
org $B28000


CommonB2_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;B28000;
    RTL                                                                  ;B28004;


CommonB2_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;B28005;
    RTL                                                                  ;B28009;


CommonB2_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;B2800A;
    RTL                                                                  ;B2800E;


CommonB2_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;B2800F;
    RTL                                                                  ;B28013;


CommonB2_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;B28014;
    RTL                                                                  ;B28018;


UNUSED_CommonB2_GrappleAI_SamusLatchesOn_ParalyzeEnemy_B28019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;B28019;
    RTL                                                                  ;B2801D;


CommonB2_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;B2801E;
    RTL                                                                  ;B28022;


CommonB2_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;B28023;
    RTL                                                                  ;B28027;


CommonB2_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;B28028;
    RTL                                                                  ;B2802C;


CommonB2_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;B2802D;
    RTL                                                                  ;B28031;


CommonB2_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;B28032;
    RTL                                                                  ;B28036;


CommonB2_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;B28037;
    RTL                                                                  ;B2803B;


CommonB2_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;B2803C;
    RTL                                                                  ;B28040;


CommonB2_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;B28041;
    RTL                                                                  ;B28045;


CommonB2_CreateADudShot_JSL:
    JSL.L CreateADudShot                                                 ;B28046;
    RTL                                                                  ;B2804A;


RTS_B2804B:
    RTS                                                                  ;B2804B;


RTL_B2804C:
    RTL                                                                  ;B2804C;


Spritemap_CommonB2_Nothing:
    dw $0000                                                             ;B2804D;

ExtendedSpritemap_CommonB2_Nothing:
    dw $0001,$0000,$0000                                                 ;B2804F;
    dw Spritemap_CommonB2_Nothing                                        ;B28055;
    dw Hitbox_CommonB2_Nothing                                           ;B28057;

Hitbox_CommonB2_Nothing:
    dw $0001,$0000,$0000,$0000,$0000                                     ;B28059;
    dw CommonB2_NormalEnemyTouchAI                                       ;B28063;
    dw CommonB2_NormalEnemyShotAI                                        ;B28065;

InstList_CommonB2_DeleteEnemy:
    dw Instruction_CommonB2_DeleteEnemy                                  ;B28067;

NOPNOP_B28069:
    NOP                                                                  ;B28069;
    NOP                                                                  ;B2806A;

Instruction_CommonB2_Enemy0FB2_InY:
    LDA.W $0000,Y                                                        ;B2806B;
    STA.W EnemyData.work5,X                                              ;B2806E;
    INY                                                                  ;B28071;
    INY                                                                  ;B28072;
    RTL                                                                  ;B28073;


Instruction_CommonB2_SetEnemy0FB2ToRTS:
    LDA.W #RTS_B2807B                                                    ;B28074;
    STA.W EnemyData.work5,X                                              ;B28077;
    RTL                                                                  ;B2807A;


RTS_B2807B:
    RTS                                                                  ;B2807B;


Instruction_CommonB2_DeleteEnemy:
    LDA.W EnemyData.properties,X                                         ;B2807C;
    ORA.W #$0200                                                         ;B2807F;
    STA.W EnemyData.properties,X                                         ;B28082;
    PLA                                                                  ;B28085;
    PEA.W ProcessEnemyInstructions_return-1                              ;B28086;
    RTL                                                                  ;B28089;


Instruction_CommonB2_CallFunctionInY:
    LDA.W $0000,Y                                                        ;B2808A;
    STA.B $12                                                            ;B2808D;
    PHY                                                                  ;B2808F;
    PHX                                                                  ;B28090;
    PEA.W .manualReturn-1                                                ;B28091;
    JMP.W ($0012)                                                        ;B28094;


.manualReturn:
    PLX                                                                  ;B28097;
    PLY                                                                  ;B28098;
    INY                                                                  ;B28099;
    INY                                                                  ;B2809A;
    RTL                                                                  ;B2809B;


Instruction_CommonB2_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;B2809C;
    STA.B $12                                                            ;B2809F;
    LDA.W $0002,Y                                                        ;B280A1;
    PHY                                                                  ;B280A4;
    PHX                                                                  ;B280A5;
    PEA.W .manualReturn-1                                                ;B280A6;
    JMP.W ($0012)                                                        ;B280A9;


.manualReturn:
    PLX                                                                  ;B280AC;
    PLY                                                                  ;B280AD;
    TYA                                                                  ;B280AE;
    CLC                                                                  ;B280AF;
    ADC.W #$0004                                                         ;B280B0;
    TAY                                                                  ;B280B3;
    RTL                                                                  ;B280B4;


UNUSED_Instruction_CommonB2_CallExternalFunctionInY_B280B5:
    LDA.W $0000,Y                                                        ;B280B5;
    STA.B $12                                                            ;B280B8;
    LDA.W $0001,Y                                                        ;B280BA;
    STA.B $13                                                            ;B280BD;
    PHX                                                                  ;B280BF;
    PHY                                                                  ;B280C0;
    JSL.L .externalFunction                                              ;B280C1;
    PLY                                                                  ;B280C5;
    PLX                                                                  ;B280C6;
    INY                                                                  ;B280C7;
    INY                                                                  ;B280C8;
    INY                                                                  ;B280C9;
    RTL                                                                  ;B280CA;


.externalFunction:
    JML.W [$0012]                                                        ;B280CB;


UNUSED_Inst_CommonB2_CallExternalFunctionInY_WithA_B280CE:
    LDA.W $0000,Y                                                        ;B280CE;
    STA.B $12                                                            ;B280D1;
    LDA.W $0001,Y                                                        ;B280D3;
    STA.B $13                                                            ;B280D6;
    LDA.W $0003,Y                                                        ;B280D8;
    PHX                                                                  ;B280DB;
    PHY                                                                  ;B280DC;
    JSL.L .externalFunction                                              ;B280DD;
    PLY                                                                  ;B280E1;
    PLX                                                                  ;B280E2;
    TYA                                                                  ;B280E3;
    CLC                                                                  ;B280E4;
    ADC.W #$0005                                                         ;B280E5;
    TAY                                                                  ;B280E8;
    RTL                                                                  ;B280E9;


.externalFunction:
    JML.W [$0012]                                                        ;B280EA;


Instruction_CommonB2_GotoY:
    LDA.W $0000,Y                                                        ;B280ED;
    TAY                                                                  ;B280F0;
    RTL                                                                  ;B280F1;


Instruction_CommonB2_GotoY_PlusY:
    STY.B $12                                                            ;B280F2;
    DEY                                                                  ;B280F4;
    LDA.W $0000,Y                                                        ;B280F5;
    XBA                                                                  ;B280F8;
    BMI .highByte                                                        ;B280F9;
    AND.W #$00FF                                                         ;B280FB;
    BRA +                                                                ;B280FE;


.highByte:
    ORA.W #$FF00                                                         ;B28100;

  + CLC                                                                  ;B28103;
    ADC.B $12                                                            ;B28104;
    TAY                                                                  ;B28106;
    RTL                                                                  ;B28107;


Instruction_CommonB2_DecrementTimer_GotoYIfNonZero:
    DEC.W EnemyData.loopCounter,X                                        ;B28108;
    BNE Instruction_CommonB2_GotoY                                       ;B2810B;
    INY                                                                  ;B2810D;
    INY                                                                  ;B2810E;
    RTL                                                                  ;B2810F;


Instruction_CommonB2_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W EnemyData.loopCounter,X                                        ;B28110;
    BNE Instruction_CommonB2_GotoY                                       ;B28113;
    INY                                                                  ;B28115;
    INY                                                                  ;B28116;
    RTL                                                                  ;B28117;


Instruction_CommonB2_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;B28118;
    DEC.W EnemyData.loopCounter,X                                        ;B2811A;
    REP #$20                                                             ;B2811D;
    BNE Instruction_CommonB2_GotoY_PlusY                                 ;B2811F;
    INY                                                                  ;B28121;
    RTL                                                                  ;B28122;


Instruction_CommonB2_TimerInY:
    LDA.W $0000,Y                                                        ;B28123;
    STA.W EnemyData.loopCounter,X                                        ;B28126;
    INY                                                                  ;B28129;
    INY                                                                  ;B2812A;
    RTL                                                                  ;B2812B;


Instruction_CommonB2_SkipNextInstruction:
    INY                                                                  ;B2812C;
    INY                                                                  ;B2812D;
    RTL                                                                  ;B2812E;


Instruction_CommonB2_Sleep:
    DEY                                                                  ;B2812F;
    DEY                                                                  ;B28130;
    TYA                                                                  ;B28131;
    STA.W EnemyData.pInstList,X                                          ;B28132;
    PLA                                                                  ;B28135;
    PEA.W ProcessEnemyInstructions_return-1                              ;B28136;
    RTL                                                                  ;B28139;


Instruction_CommonB2_WaitYFrames:
    LDA.W $0000,Y                                                        ;B2813A;
    STA.W EnemyData.instTimer,X                                          ;B2813D;
    INY                                                                  ;B28140;
    INY                                                                  ;B28141;
    TYA                                                                  ;B28142;
    STA.W EnemyData.pInstList,X                                          ;B28143;
    PLA                                                                  ;B28146;
    PEA.W ProcessEnemyInstructions_return-1                              ;B28147;
    RTL                                                                  ;B2814A;


Instruction_CommonB2_TransferYBytesInYToVRAM:
    PHX                                                                  ;B2814B;
    LDX.W $0330                                                          ;B2814C;
    LDA.W $0000,Y                                                        ;B2814F;
    STA.B $D0,X                                                          ;B28152;
    LDA.W $0002,Y                                                        ;B28154;
    STA.B $D2,X                                                          ;B28157;
    LDA.W $0003,Y                                                        ;B28159;
    STA.B $D3,X                                                          ;B2815C;
    LDA.W $0005,Y                                                        ;B2815E;
    STA.B $D5,X                                                          ;B28161;
    TXA                                                                  ;B28163;
    CLC                                                                  ;B28164;
    ADC.W #$0007                                                         ;B28165;
    STA.W $0330                                                          ;B28168;
    TYA                                                                  ;B2816B;
    CLC                                                                  ;B2816C;
    ADC.W #$0007                                                         ;B2816D;
    TAY                                                                  ;B28170;
    PLX                                                                  ;B28171;
    RTL                                                                  ;B28172;


Instruction_CommonB2_EnableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;B28173;
    ORA.W #$0800                                                         ;B28176;
    STA.W EnemyData.properties,X                                         ;B28179;
    RTL                                                                  ;B2817C;


Instruction_CommonB2_DisableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;B2817D;
    AND.W #$F7FF                                                         ;B28180;
    STA.W EnemyData.properties,X                                         ;B28183;
    RTL                                                                  ;B28186;


CommonB2EnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000                   ;B28187;
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000                   ;B28197;
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000                   ;B281A7;
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000                   ;B281B7;
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000                   ;B281C7;
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000                   ;B281D7;
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000                   ;B281E7;
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000                   ;B281F7;
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000                   ;B28207;
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000                   ;B28217;
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000                   ;B28227;
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000                   ;B28237;
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000                   ;B28247;
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000                   ;B28257;
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000                   ;B28267;
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000                   ;B28277;
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000                   ;B28287;
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000                   ;B28297;
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000                   ;B282A7;
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000                   ;B282B7;
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000                   ;B282C7;
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000                   ;B282D7;
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000                   ;B282E7;
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000                   ;B282F7;
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000                   ;B28307;
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000                   ;B28317;
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000                   ;B28327;
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000                   ;B28337;
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000                   ;B28347;
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000                   ;B28357;
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000                   ;B28367;
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000                   ;B28377;
    dw $0004,$0000,$FFFC,$0000                                           ;B28387;

CommonB2EnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF                   ;B2838F;
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF                   ;B2839F;
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF                   ;B283AF;
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF                   ;B283BF;
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF                   ;B283CF;
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF                   ;B283DF;
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF                   ;B283EF;
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF                   ;B283FF;
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF                   ;B2840F;
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF                   ;B2841F;
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF                   ;B2842F;
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE                   ;B2843F;
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE                   ;B2844F;
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE                   ;B2845F;
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE                   ;B2846F;
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE                   ;B2847F;
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD                   ;B2848F;
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD                   ;B2849F;
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD                   ;B284AF;
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC                   ;B284BF;
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC                   ;B284CF;
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC                   ;B284DF;
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB                   ;B284EF;
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB                   ;B284FF;
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB                   ;B2850F;
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA                   ;B2851F;
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA                   ;B2852F;
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9                   ;B2853F;
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9                   ;B2854F;
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9                   ;B2855F;
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8                   ;B2856F;
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8                   ;B2857F;
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7                   ;B2858F;
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7                   ;B2859F;
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6                   ;B285AF;
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6                   ;B285BF;
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5                   ;B285CF;
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4                   ;B285DF;
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4                   ;B285EF;
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3                   ;B285FF;
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3                   ;B2860F;
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2                   ;B2861F;
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1                   ;B2862F;
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1                   ;B2863F;
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0                   ;B2864F;
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF                   ;B2865F;
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE                   ;B2866F;
    dw $74F9,$0011,$8B07,$FFEE                                           ;B2867F;

Palette_Pirate_Grey:
    dw $3800,$5755,$4A4F,$1CE4,$0C60,$56B2,$3E0D,$2D68                   ;B28687;
    dw $2526,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B28697;

Palette_Pirate_Green:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;B286A7;
    dw $0924,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B286B7;

Palette_Pirate_Magenta:
    dw $3800,$4EBF,$4D9E,$1009,$0C04,$49DE,$555D,$30B0                   ;B286C7;
    dw $1C4D,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B286D7;

Palette_Pirate_Red:
    dw $3800,$02FD,$013E,$006C,$0066,$021E,$005F,$0059                   ;B286E7;
    dw $0073,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B286F7;

Palette_Pirate_Silver_GoldNinja:
    dw $3800,$6BFF,$4ED6,$14A4,$0420,$5B7B,$3E52,$31CD                   ;B28707;
    dw $2149,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B28717;

Palette_Pirate_Gold_NonNinja:
    dw $3800,$4BBE,$06B9,$00EA,$0065,$173A,$0276,$01F2                   ;B28727;
    dw $014D,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B28737;

UNUSED_Palette_Pirate_Silver_GoldNinja_B28747:
    dw $3800,$6BFF,$4ED6,$14A4,$0420,$5B7B,$3E52,$31CD                   ;B28747;
    dw $2149,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113                   ;B28757;

PowerBombReaction_Ninja_Walking_GreyWall:
    JSL.L NormalEnemyPowerBombAI                                         ;B28767;
    RTL                                                                  ;B2876B;


EnemyTouch_SpacePirate:
    LDX.W $0E54                                                          ;B2876C;
    LDA.W EnemyData.freezeTimer,X                                        ;B2876F;
    BNE .return                                                          ;B28772;
    JSL.L NormalEnemyTouchAI                                             ;B28774;

.return:
    RTL                                                                  ;B28778;


EnemyShot_SpacePirate_Normal:
    LDX.W $0E54                                                          ;B28779;
    LDA.W EnemyData.pId,X                                                ;B2877C;
    CMP.W #EnemyHeaders_PirateGoldNinja                                  ;B2877F;
    BEQ NormalPirateShot                                                 ;B28782;
    JSL.L NormalEnemyShotAI                                              ;B28784;
    RTL                                                                  ;B28788;


NormalPirateShot:
    LDX.W $0E54                                                          ;B28789;
    LDA.W EnemyData.xPosition,X                                          ;B2878C;
    STA.L $7EF434                                                        ;B2878F;
    LDA.W EnemyData.yPosition,X                                          ;B28793;
    STA.L $7EF436                                                        ;B28796;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;B2879A;
    LDA.W EnemyData.health,X                                             ;B2879E;
    BNE .return                                                          ;B287A1;
    LDX.W $0E54                                                          ;B287A3;
    LDA.W EnemyData.pId,X                                                ;B287A6;
    CMP.W #EnemyHeaders_PirateGoldNinja                                  ;B287A9;
    BNE .notGold                                                         ;B287AC;
    STZ.W EnemyData.work1,X                                              ;B287AE;
    LDA.W #$0004                                                         ;B287B1;
    JSL.L EnemyDeath                                                     ;B287B4;
    JSL.L MetalNinjaPirateDeathItemDropRoutine                           ;B287B8;

.return:
    RTL                                                                  ;B287BC;


.notGold:
    STZ.W EnemyData.work1,X                                              ;B287BD;
    LDA.W #$0004                                                         ;B287C0;
    JSL.L EnemyDeath                                                     ;B287C3;
    RTL                                                                  ;B287C7;


EnemyShot_SpacePirate_GoldNinjaIsVulnerable:
    LDX.W $0E54                                                          ;B287C8;
    LDA.W EnemyData.pId,X                                                ;B287CB;
    CMP.W #EnemyHeaders_PirateGoldNinja                                  ;B287CE;
    BEQ .goldNinja                                                       ;B287D1;
    JMP.W NormalPirateShot                                               ;B287D3;


.goldNinja:
    LDA.W $18A6                                                          ;B287D6;
    ASL A                                                                ;B287D9;
    TAY                                                                  ;B287DA;
    LDA.W $0C18,Y                                                        ;B287DB;
    STA.B $12                                                            ;B287DE;
    AND.W #$0F00                                                         ;B287E0;
    CMP.W #$0300                                                         ;B287E3;
    BMI .beamMissileSuper                                                ;B287E6;
    RTL                                                                  ;B287E8;


.beamMissileSuper:
    LDX.W $0E54                                                          ;B287E9;
    LDA.W EnemyData.pId,X                                                ;B287EC;
    TAX                                                                  ;B287EF;
    LDA.L EnemyHeader.vulnerabilities,X                                  ;B287F0;
    BNE .zeroVuln                                                        ;B287F4;
    LDA.W #AllEnemyVulnerabilities                                       ;B287F6;

.zeroVuln:
    STA.B $14                                                            ;B287F9;
    LDA.B $12                                                            ;B287FB;
    BIT.W #$0F00                                                         ;B287FD;
    BNE .notBeam                                                         ;B28800;
    LDA.B $12                                                            ;B28802;
    AND.W #$000F                                                         ;B28804;
    CLC                                                                  ;B28807;
    ADC.B $14                                                            ;B28808;
    TAX                                                                  ;B2880A;
    LDA.L $B40000,X                                                      ;B2880B;
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
    ADC.B $14                                                            ;B2882B;
    TAX                                                                  ;B2882D;
    LDA.L $B4000B,X                                                      ;B2882E;
    AND.W #$000F                                                         ;B28832;
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible                      ;B28835;
    CMP.W #$000F                                                         ;B28837;
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible                      ;B2883A;
    BRA .gotoNormal                                                      ;B2883C;


EnemyShot_SpacePirate_GoldNinjaIsInvincible:
    LDX.W $0E54                                                          ;B2883E;
    LDA.W EnemyData.pId,X                                                ;B28841;
    CMP.W #EnemyHeaders_PirateGoldNinja                                  ;B28844;
    BEQ .gold                                                            ;B28847;
    JMP.W NormalPirateShot                                               ;B28849;


.gold:
    LDX.W $0E54                                                          ;B2884C;
    LDA.W $18A6                                                          ;B2884F;
    ASL A                                                                ;B28852;
    TAY                                                                  ;B28853;
    LDA.W $0C18,Y                                                        ;B28854;
    STA.B $12                                                            ;B28857;
    AND.W #$0F00                                                         ;B28859;
    CMP.W #$0200                                                         ;B2885C;
    BEQ .super                                                           ;B2885F;
    CMP.W #$0300                                                         ;B28861;
    BMI .reflect                                                         ;B28864;
    RTL                                                                  ;B28866;


.super:
    LDA.W $0C7C,Y                                                        ;B28867;
    BEQ .return                                                          ;B2886A;

.reflect:
    LDA.W #$000A                                                         ;B2886C;
    STA.W EnemyData.invincibilityTimer,X                                 ;B2886F;
    LDA.W $0C04,Y                                                        ;B28872;
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
    STA.W $0C04,Y                                                        ;B2888F;
    STY.B $14                                                            ;B28892;
    JSL.L ProjectileReflection                                           ;B28894;
    LDA.W #$0066                                                         ;B28898;
    JSL.L QueueSound_Lib2_Max6                                           ;B2889B;

.return:
    RTL                                                                  ;B2889F;


ExtendedSpritemaps_PirateWall_0:
    dw $0002,$0000,$0000                                                 ;B288A0;
    dw Spitemaps_PirateWall_9                                            ;B288A6;
    dw Hitboxes_PirateWall_9                                             ;B288A8;
    dw $0000,$0000                                                       ;B288AA;
    dw Spitemaps_PirateWall_0                                            ;B288AE;
    dw Hitboxes_PirateWall_0                                             ;B288B0;

ExtendedSpritemaps_PirateWall_1:
    dw $0002,$0000,$0000                                                 ;B288B2;
    dw Spitemaps_PirateWall_8                                            ;B288B8;
    dw Hitboxes_PirateWall_8                                             ;B288BA;
    dw $0000,$0000                                                       ;B288BC;
    dw Spitemaps_PirateWall_1                                            ;B288C0;
    dw Hitboxes_PirateWall_1                                             ;B288C2;

ExtendedSpritemaps_PirateWall_2:
    dw $0002,$0000,$0000                                                 ;B288C4;
    dw Spitemaps_PirateWall_7                                            ;B288CA;
    dw Hitboxes_PirateWall_7                                             ;B288CC;
    dw $0000,$0000                                                       ;B288CE;
    dw Spitemaps_PirateWall_2                                            ;B288D2;
    dw Hitboxes_PirateWall_2                                             ;B288D4;

ExtendedSpritemaps_PirateWall_3:
    dw $0002,$0000,$0000                                                 ;B288D6;
    dw Spitemaps_PirateWall_3                                            ;B288DC;
    dw Hitboxes_PirateWall_3                                             ;B288DE;
    dw $0000,$0000                                                       ;B288E0;
    dw Spitemaps_PirateWall_6                                            ;B288E4;
    dw Hitboxes_PirateWall_6                                             ;B288E6;

ExtendedSpritemaps_PirateWall_4:
    dw $0002,$0000,$0000                                                 ;B288E8;
    dw Spitemaps_PirateWall_4                                            ;B288EE;
    dw Hitboxes_PirateWall_4                                             ;B288F0;
    dw $0000,$0000                                                       ;B288F2;
    dw Spitemaps_PirateWall_5                                            ;B288F6;
    dw Hitboxes_PirateWall_5                                             ;B288F8;

ExtendedSpritemaps_PirateWall_5:
    dw $0002,$0000,$FFFE                                                 ;B288FA;
    dw Spitemaps_PirateWall_A                                            ;B28900;
    dw Hitboxes_PirateWall_A                                             ;B28902;
    dw $0000,$0000                                                       ;B28904;
    dw Spitemaps_PirateWall_9                                            ;B28908;
    dw Hitboxes_PirateWall_9                                             ;B2890A;

ExtendedSpritemaps_PirateWall_6:
    dw $0002,$0001,$FFFE                                                 ;B2890C;
    dw Spitemaps_PirateWall_B                                            ;B28912;
    dw Hitboxes_PirateWall_B                                             ;B28914;
    dw $0000,$0000                                                       ;B28916;
    dw Spitemaps_PirateWall_5                                            ;B2891A;
    dw Hitboxes_PirateWall_5                                             ;B2891C;

ExtendedSpritemaps_PirateWall_7:
    dw $0001,$0000,$0000                                                 ;B2891E;
    dw Spitemaps_PirateWall_C                                            ;B28924;
    dw Hitboxes_PirateWall_C                                             ;B28926;

ExtendedSpritemaps_PirateWall_8:
    dw $0001,$0000,$0000                                                 ;B28928;
    dw Spitemaps_PirateWall_D                                            ;B2892E;
    dw Hitboxes_PirateWall_D                                             ;B28930;

ExtendedSpritemaps_PirateWall_9:
    dw $0002,$0000,$0000                                                 ;B28932;
    dw Spitemaps_PirateWall_17                                           ;B28938;
    dw Hitboxes_PirateWall_17                                            ;B2893A;
    dw $0000,$0000                                                       ;B2893C;
    dw Spitemaps_PirateWall_E                                            ;B28940;
    dw Hitboxes_PirateWall_E                                             ;B28942;

ExtendedSpritemaps_PirateWall_A:
    dw $0002,$0000,$0000                                                 ;B28944;
    dw Spitemaps_PirateWall_16                                           ;B2894A;
    dw Hitboxes_PirateWall_16                                            ;B2894C;
    dw $0000,$0000                                                       ;B2894E;
    dw Spitemaps_PirateWall_F                                            ;B28952;
    dw Hitboxes_PirateWall_F                                             ;B28954;

ExtendedSpritemaps_PirateWall_B:
    dw $0002,$0000,$0000                                                 ;B28956;
    dw Spitemaps_PirateWall_15                                           ;B2895C;
    dw Hitboxes_PirateWall_15                                            ;B2895E;
    dw $0000,$0000                                                       ;B28960;
    dw Spitemaps_PirateWall_10                                           ;B28964;
    dw Hitboxes_PirateWall_10                                            ;B28966;

ExtendedSpritemaps_PirateWall_C:
    dw $0002,$0000,$0000                                                 ;B28968;
    dw Spitemaps_PirateWall_11                                           ;B2896E;
    dw Hitboxes_PirateWall_11                                            ;B28970;
    dw $0000,$0000                                                       ;B28972;
    dw Spitemaps_PirateWall_14                                           ;B28976;
    dw Hitboxes_PirateWall_14                                            ;B28978;

ExtendedSpritemaps_PirateWall_D:
    dw $0002,$0000,$0000                                                 ;B2897A;
    dw Spitemaps_PirateWall_12                                           ;B28980;
    dw Hitboxes_PirateWall_12                                            ;B28982;
    dw $0000,$0000                                                       ;B28984;
    dw Spitemaps_PirateWall_13                                           ;B28988;
    dw Hitboxes_PirateWall_13                                            ;B2898A;

ExtendedSpritemaps_PirateWall_E:
    dw $0002,$0000,$0000                                                 ;B2898C;
    dw Spitemaps_PirateWall_18                                           ;B28992;
    dw Hitboxes_PirateWall_18                                            ;B28994;
    dw $0000,$0002                                                       ;B28996;
    dw Spitemaps_PirateWall_13                                           ;B2899A;
    dw Hitboxes_PirateWall_13                                            ;B2899C;

ExtendedSpritemaps_PirateWall_F:
    dw $0002,$0000,$0000                                                 ;B2899E;
    dw Spitemaps_PirateWall_19                                           ;B289A4;
    dw Hitboxes_PirateWall_19                                            ;B289A6;
    dw $0000,$0002                                                       ;B289A8;
    dw Spitemaps_PirateWall_13                                           ;B289AC;
    dw Hitboxes_PirateWall_13                                            ;B289AE;

ExtendedSpritemaps_PirateWall_10:
    dw $0001,$0000,$0000                                                 ;B289B0;
    dw Spitemaps_PirateWall_1A                                           ;B289B6;
    dw Hitboxes_PirateWall_1A                                            ;B289B8;

ExtendedSpritemaps_PirateWall_11:
    dw $0001,$0000,$0000                                                 ;B289BA;
    dw Spitemaps_PirateWall_1B                                           ;B289C0;
    dw Hitboxes_PirateWall_1B                                            ;B289C2;

ExtendedSpritemaps_PirateWalking_0:
    dw $0002,$FFFB,$0003                                                 ;B289C4;
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B289CA;
    dw Hitboxes_PirateWalking_33_Ninja_1C                                ;B289CC;
    dw $0000,$0000                                                       ;B289CE;
    dw Spritemaps_PirateWalking_1                                        ;B289D2;
    dw Hitboxes_PirateWalking_1                                          ;B289D4;

ExtendedSpritemaps_PirateWalking_1:
    dw $0002,$FFFB,$0003                                                 ;B289D6;
    dw Spitemaps_PirateWalking_27_Ninja_E                                ;B289DC;
    dw Hitboxes_PirateWalking_35_Ninja_1E                                ;B289DE;
    dw $0000,$0000                                                       ;B289E0;
    dw Spritemaps_PirateWalking_2                                        ;B289E4;
    dw Hitboxes_PirateWalking_2                                          ;B289E6;

ExtendedSpritemaps_PirateWalking_2:
    dw $0002,$FFFB,$0003                                                 ;B289E8;
    dw Spitemaps_PirateWalking_28_Ninja_F                                ;B289EE;
    dw Hitboxes_PirateWalking_36_Ninja_1F                                ;B289F0;
    dw $0000,$0000                                                       ;B289F2;
    dw Spritemaps_PirateWalking_3                                        ;B289F6;
    dw Hitboxes_PirateWalking_3                                          ;B289F8;

ExtendedSpritemaps_PirateWalking_3:
    dw $0002,$FFFB,$0003                                                 ;B289FA;
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28A00;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28A02;
    dw $0002,$0000                                                       ;B28A04;
    dw Spritemaps_PirateWalking_4                                        ;B28A08;
    dw Hitboxes_PirateWalking_4                                          ;B28A0A;

ExtendedSpritemaps_PirateWalking_4:
    dw $0002,$FFFB,$0003                                                 ;B28A0C;
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28A12;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28A14;
    dw $0002,$0000                                                       ;B28A16;
    dw Spritemaps_PirateWalking_5                                        ;B28A1A;
    dw Hitboxes_PirateWalking_5                                          ;B28A1C;

ExtendedSpritemaps_PirateWalking_5:
    dw $0002,$FFFB,$0003                                                 ;B28A1E;
    dw Spitemaps_PirateWalking_28_Ninja_F                                ;B28A24;
    dw Hitboxes_PirateWalking_36_Ninja_1F                                ;B28A26;
    dw $0002,$0000                                                       ;B28A28;
    dw Spritemaps_PirateWalking_6                                        ;B28A2C;
    dw Hitboxes_PirateWalking_6                                          ;B28A2E;

ExtendedSpritemaps_PirateWalking_6:
    dw $0002,$FFFB,$0003                                                 ;B28A30;
    dw Spitemaps_PirateWalking_27_Ninja_E                                ;B28A36;
    dw Hitboxes_PirateWalking_35_Ninja_1E                                ;B28A38;
    dw $0000,$0000                                                       ;B28A3A;
    dw Spritemaps_PirateWalking_7                                        ;B28A3E;
    dw Hitboxes_PirateWalking_7                                          ;B28A40;

ExtendedSpritemaps_PirateWalking_7:
    dw $0002,$FFFB,$0003                                                 ;B28A42;
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B28A48;
    dw Hitboxes_PirateWalking_33_Ninja_1C                                ;B28A4A;
    dw $0000,$0000                                                       ;B28A4C;
    dw Spritemaps_PirateWalking_8                                        ;B28A50;
    dw Hitboxes_PirateWalking_8                                          ;B28A52;

ExtendedSpritemaps_PirateNinja_0:
    dw $0002,$0000,$0005                                                 ;B28A54;
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B28A5A;
    dw Hitboxes_PirateWalking_34_Ninja_1D                                ;B28A5C;
    dw $0000,$0003                                                       ;B28A5E;
    dw Spitemaps_PirateWalking_B_Ninja_2                                 ;B28A62;
    dw Hitboxes_PirateWalking_12_Ninja_A                                 ;B28A64;

ExtendedSpritemaps_PirateNinja_1:
    dw $0002,$0000,$0005                                                 ;B28A66;
    dw Spitemaps_PirateNinja_11                                          ;B28A6C;
    dw Hitboxes_PirateNinja_21                                           ;B28A6E;
    dw $0000,$0003                                                       ;B28A70;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28A74;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28A76;

ExtendedSpritemaps_PirateNinja_2:
    dw $0002,$0000,$0005                                                 ;B28A78;
    dw Spitemaps_PirateNinja_12                                          ;B28A7E;
    dw Hitboxes_PirateNinja_22                                           ;B28A80;
    dw $0000,$0003                                                       ;B28A82;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28A86;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28A88;

ExtendedSpritemaps_PirateNinja_3:
    dw $0002,$0000,$0004                                                 ;B28A8A;
    dw Spitemaps_PirateNinja_13                                          ;B28A90;
    dw Hitboxes_PirateNinja_23                                           ;B28A92;
    dw $0000,$0003                                                       ;B28A94;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28A98;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28A9A;

ExtendedSpritemaps_PirateNinja_4:
    dw $0002,$0000,$0003                                                 ;B28A9C;
    dw Spitemaps_PirateNinja_14                                          ;B28AA2;
    dw Hitboxes_PirateNinja_24                                           ;B28AA4;
    dw $0000,$0003                                                       ;B28AA6;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28AAA;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28AAC;

ExtendedSpritemaps_PirateNinja_5:
    dw $0002,$0000,$0005                                                 ;B28AAE;
    dw Spitemaps_PirateNinja_13                                          ;B28AB4;
    dw Hitboxes_PirateNinja_23                                           ;B28AB6;
    dw $0000,$0003                                                       ;B28AB8;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28ABC;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28ABE;

ExtendedSpritemaps_PirateNinja_6:
    dw $0002,$0000,$0005                                                 ;B28AC0;
    dw Spitemaps_PirateNinja_11                                          ;B28AC6;
    dw Hitboxes_PirateNinja_21                                           ;B28AC8;
    dw $0000,$0003                                                       ;B28ACA;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28ACE;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28AD0;

ExtendedSpritemaps_PirateNinja_7:
    dw $0002,$0000,$0006                                                 ;B28AD2;
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28AD8;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28ADA;
    dw $0000,$0003                                                       ;B28ADC;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28AE0;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28AE2;

ExtendedSpritemaps_PirateNinja_8:
    dw $0002,$0000,$0007                                                 ;B28AE4;
    dw Spitemaps_PirateNinja_18                                          ;B28AEA;
    dw Hitboxes_PirateNinja_28                                           ;B28AEC;
    dw $0000,$0003                                                       ;B28AEE;
    dw Spitemaps_PirateWalking_B_Ninja_2                                 ;B28AF2;
    dw Hitboxes_PirateWalking_12_Ninja_A                                 ;B28AF4;

ExtendedSpritemaps_PirateWalking_8:
    dw $0002,$0005,$0003                                                 ;B28AF6;
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28AFC;
    dw Hitboxes_PirateWalking_39_Ninja_32                                ;B28AFE;
    dw $0000,$0000                                                       ;B28B00;
    dw Spitemaps_PirateWalking_E                                         ;B28B04;
    dw Hitboxes_PirateWalking_15                                         ;B28B06;

ExtendedSpritemaps_PirateWalking_9:
    dw $0002,$0005,$0003                                                 ;B28B08;
    dw Spitemaps_PirateWalking_2C_Ninja_22                               ;B28B0E;
    dw Hitboxes_PirateWalking_3A_Ninja_34                                ;B28B10;
    dw $0000,$0000                                                       ;B28B12;
    dw Spitemaps_PirateWalking_F                                         ;B28B16;
    dw Hitboxes_PirateWalking_16                                         ;B28B18;

ExtendedSpritemaps_PirateWalking_A:
    dw $0002,$0005,$0003                                                 ;B28B1A;
    dw Spitemaps_PirateWalking_2D_Ninja_23                               ;B28B20;
    dw Hitboxes_PirateWalking_3B_Ninja_35                                ;B28B22;
    dw $0000,$0000                                                       ;B28B24;
    dw Spitemaps_PirateWalking_10                                        ;B28B28;
    dw Hitboxes_PirateWalking_17                                         ;B28B2A;

ExtendedSpritemaps_PirateWalking_B:
    dw $0002,$0005,$0003                                                 ;B28B2C;
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28B32;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28B34;
    dw $0000,$0000                                                       ;B28B36;
    dw Spitemaps_PirateWalking_11                                        ;B28B3A;
    dw Hitboxes_PirateWalking_18                                         ;B28B3C;

ExtendedSpritemaps_PirateWalking_C:
    dw $0002,$0005,$0003                                                 ;B28B3E;
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28B44;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28B46;
    dw $FFFF,$0000                                                       ;B28B48;
    dw Spitemaps_PirateWalking_12                                        ;B28B4C;
    dw Hitboxes_PirateWalking_19                                         ;B28B4E;

ExtendedSpritemaps_PirateWalking_D:
    dw $0002,$0005,$0003                                                 ;B28B50;
    dw Spitemaps_PirateWalking_2D_Ninja_23                               ;B28B56;
    dw Hitboxes_PirateWalking_3B_Ninja_35                                ;B28B58;
    dw $0000,$0000                                                       ;B28B5A;
    dw Spitemaps_PirateWalking_13                                        ;B28B5E;
    dw Hitboxes_PirateWalking_1A                                         ;B28B60;

ExtendedSpritemaps_PirateWalking_E:
    dw $0002,$0005,$0003                                                 ;B28B62;
    dw Spitemaps_PirateWalking_2C_Ninja_22                               ;B28B68;
    dw Hitboxes_PirateWalking_3A_Ninja_34                                ;B28B6A;
    dw $0001,$0000                                                       ;B28B6C;
    dw Spitemaps_PirateWalking_14                                        ;B28B70;
    dw Hitboxes_PirateWalking_1B                                         ;B28B72;

ExtendedSpritemaps_PirateWalking_F:
    dw $0002,$0005,$0003                                                 ;B28B74;
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28B7A;
    dw Hitboxes_PirateWalking_39_Ninja_32                                ;B28B7C;
    dw $0001,$0000                                                       ;B28B7E;
    dw Spitemaps_PirateWalking_15                                        ;B28B82;
    dw Hitboxes_PirateWalking_1C                                         ;B28B84;

ExtendedSpritemaps_PirateNinja_9:
    dw $0002,$0000,$0005                                                 ;B28B86;
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28B8C;
    dw Hitboxes_PirateNinja_33                                           ;B28B8E;
    dw $0000,$0003                                                       ;B28B90;
    dw Spitemaps_PirateWalking_17_Ninja_4                                ;B28B94;
    dw Hitboxes_PirateWalking_26_Ninja_13                                ;B28B96;

ExtendedSpritemaps_PirateNinja_A:
    dw $0002,$0000,$0005                                                 ;B28B98;
    dw Spitemaps_PirateNinja_25                                          ;B28B9E;
    dw Hitboxes_PirateNinja_37                                           ;B28BA0;
    dw $0000,$0003                                                       ;B28BA2;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BA6;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BA8;

ExtendedSpritemaps_PirateNinja_B:
    dw $0002,$0000,$0005                                                 ;B28BAA;
    dw Spitemaps_PirateNinja_26                                          ;B28BB0;
    dw Hitboxes_PirateNinja_38                                           ;B28BB2;
    dw $0000,$0003                                                       ;B28BB4;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BB8;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BBA;

ExtendedSpritemaps_PirateNinja_C:
    dw $0002,$0000,$0004                                                 ;B28BBC;
    dw Spitemaps_PirateNinja_27                                          ;B28BC2;
    dw Hitboxes_PirateNinja_39                                           ;B28BC4;
    dw $0000,$0003                                                       ;B28BC6;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BCA;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BCC;

ExtendedSpritemaps_PirateNinja_D:
    dw $0002,$0000,$0003                                                 ;B28BCE;
    dw Spitemaps_PirateNinja_28                                          ;B28BD4;
    dw Hitboxes_PirateNinja_3A                                           ;B28BD6;
    dw $0000,$0003                                                       ;B28BD8;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BDC;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BDE;

ExtendedSpritemaps_PirateNinja_E:
    dw $0002,$0000,$0005                                                 ;B28BE0;
    dw Spitemaps_PirateNinja_27                                          ;B28BE6;
    dw Hitboxes_PirateNinja_39                                           ;B28BE8;
    dw $0000,$0003                                                       ;B28BEA;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28BEE;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28BF0;

ExtendedSpritemaps_PirateNinja_F:
    dw $0002,$0000,$0005                                                 ;B28BF2;
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28BF8;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28BFA;
    dw $0000,$0003                                                       ;B28BFC;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28C00;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28C02;

ExtendedSpritemaps_PirateNinja_10:
    dw $0002,$0000,$0006                                                 ;B28C04;
    dw Spitemaps_PirateNinja_2C                                          ;B28C0A;
    dw Hitboxes_PirateNinja_3E                                           ;B28C0C;
    dw $0000,$0003                                                       ;B28C0E;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28C12;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28C14;

ExtendedSpritemaps_PirateNinja_11:
    dw $0002,$0000,$0007                                                 ;B28C16;
    dw Spitemaps_PirateNinja_2C                                          ;B28C1C;
    dw Hitboxes_PirateNinja_3E                                           ;B28C1E;
    dw $0000,$0003                                                       ;B28C20;
    dw Spitemaps_PirateWalking_17_Ninja_4                                ;B28C24;
    dw Hitboxes_PirateWalking_26_Ninja_13                                ;B28C26;

ExtendedSpritemaps_PirateWalking_10:
    dw $0002,$0000,$0003                                                 ;B28C28;
    dw Spitemaps_PirateWalking_1A                                        ;B28C2E;
    dw Hitboxes_PirateWalking_27                                         ;B28C30;
    dw $0000,$0003                                                       ;B28C32;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C36;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C38;

ExtendedSpritemaps_PirateWalking_11:
    dw $0002,$0000,$0003                                                 ;B28C3A;
    dw Spitemaps_PirateWalking_1B                                        ;B28C40;
    dw Hitboxes_PirateWalking_28                                         ;B28C42;
    dw $0000,$0003                                                       ;B28C44;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C48;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C4A;

ExtendedSpritemaps_PirateWalking_12:
    dw $0002,$0000,$0003                                                 ;B28C4C;
    dw Spitemaps_PirateWalking_1C                                        ;B28C52;
    dw Hitboxes_PirateWalking_29                                         ;B28C54;
    dw $0000,$0003                                                       ;B28C56;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C5A;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C5C;

ExtendedSpritemaps_PirateWalking_13:
    dw $0002,$0000,$0003                                                 ;B28C5E;
    dw Spitemaps_PirateWalking_1D                                        ;B28C64;
    dw Hitboxes_PirateWalking_2A                                         ;B28C66;
    dw $0000,$0003                                                       ;B28C68;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C6C;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C6E;

ExtendedSpritemaps_PirateWalking_14:
    dw $0002,$FFFF,$0004                                                 ;B28C70;
    dw Spitemaps_PirateWalking_1E                                        ;B28C76;
    dw Hitboxes_PirateWalking_2B                                         ;B28C78;
    dw $0000,$0003                                                       ;B28C7A;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28C7E;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28C80;

ExtendedSpritemaps_PirateWalking_15:
    dw $0002,$FFFE,$0006                                                 ;B28C82;
    dw Spitemaps_PirateWalking_1F                                        ;B28C88;
    dw Hitboxes_PirateWalking_2C                                         ;B28C8A;
    dw $0000,$0003                                                       ;B28C8C;
    dw Spitemaps_PirateWalking_B_Ninja_2                                 ;B28C90;
    dw Hitboxes_PirateWalking_12_Ninja_A                                 ;B28C92;

ExtendedSpritemaps_PirateWalking_16:
    dw $0002,$0000,$0003                                                 ;B28C94;
    dw Spitemaps_PirateWalking_20                                        ;B28C9A;
    dw Hitboxes_PirateWalking_2D                                         ;B28C9C;
    dw $0000,$0003                                                       ;B28C9E;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CA2;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CA4;

ExtendedSpritemaps_PirateWalking_17:
    dw $0002,$0000,$0003                                                 ;B28CA6;
    dw Spitemaps_PirateWalking_21                                        ;B28CAC;
    dw Hitboxes_PirateWalking_2E                                         ;B28CAE;
    dw $0000,$0003                                                       ;B28CB0;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CB4;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CB6;

ExtendedSpritemaps_PirateWalking_18:
    dw $0002,$0000,$0003                                                 ;B28CB8;
    dw Spitemaps_PirateWalking_22                                        ;B28CBE;
    dw Hitboxes_PirateWalking_2F                                         ;B28CC0;
    dw $0000,$0003                                                       ;B28CC2;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CC6;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CC8;

ExtendedSpritemaps_PirateWalking_19:
    dw $0002,$0000,$0003                                                 ;B28CCA;
    dw Spitemaps_PirateWalking_23                                        ;B28CD0;
    dw Hitboxes_PirateWalking_30                                         ;B28CD2;
    dw $0000,$0003                                                       ;B28CD4;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CD8;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CDA;

ExtendedSpritemaps_PirateWalking_1A:
    dw $0002,$0001,$0004                                                 ;B28CDC;
    dw Spitemaps_PirateWalking_24                                        ;B28CE2;
    dw Hitboxes_PirateWalking_31                                         ;B28CE4;
    dw $0000,$0003                                                       ;B28CE6;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28CEA;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28CEC;

ExtendedSpritemaps_PirateWalking_1B:
    dw $0002,$0002,$0006                                                 ;B28CEE;
    dw Spitemaps_PirateWalking_25                                        ;B28CF4;
    dw Hitboxes_PirateWalking_32                                         ;B28CF6;
    dw $0000,$0003                                                       ;B28CF8;
    dw Spitemaps_PirateWalking_17_Ninja_4                                ;B28CFC;
    dw Hitboxes_PirateWalking_26_Ninja_13                                ;B28CFE;

ExtendedSpritemaps_PirateWalking_1C:
    dw $0003,$FFFB,$FFF4                                                 ;B28D00;
    dw Spitemaps_PirateWalking_18                                        ;B28D06;
    dw Hitboxes_PirateWalking_27                                         ;B28D08;
    dw $0000,$0003                                                       ;B28D0A;
    dw Spitemaps_PirateWalking_C                                         ;B28D0E;
    dw Hitboxes_PirateWalking_13                                         ;B28D10;
    dw $0000,$0003                                                       ;B28D12;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28D16;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28D18;

ExtendedSpritemaps_PirateWalking_1D:
    dw $0002,$0000,$0003                                                 ;B28D1A;
    dw Spitemaps_PirateWalking_1A                                        ;B28D20;
    dw Hitboxes_PirateWalking_27                                         ;B28D22;
    dw $0000,$0003                                                       ;B28D24;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28D28;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28D2A;

ExtendedSpritemaps_PirateWalking_1E:
    dw $0003,$FFFB,$FFF5                                                 ;B28D2C;
    dw Spitemaps_PirateWalking_19                                        ;B28D32;
    dw Hitboxes_PirateWalking_27                                         ;B28D34;
    dw $0000,$0003                                                       ;B28D36;
    dw Spitemaps_PirateWalking_C                                         ;B28D3A;
    dw Hitboxes_PirateWalking_13                                         ;B28D3C;
    dw $0000,$0003                                                       ;B28D3E;
    dw Spitemaps_PirateWalking_9_Ninja_0                                 ;B28D42;
    dw Hitboxes_PirateWalking_9_Ninja_0                                  ;B28D44;

ExtendedSpritemaps_PirateWalking_1F:
    dw $0003,$0005,$FFF4                                                 ;B28D46;
    dw Spitemaps_PirateWalking_18                                        ;B28D4C;
    dw Hitboxes_PirateWalking_27                                         ;B28D4E;
    dw $0000,$0003                                                       ;B28D50;
    dw Spitemaps_PirateWalking_D                                         ;B28D54;
    dw Hitboxes_PirateWalking_14                                         ;B28D56;
    dw $0000,$0003                                                       ;B28D58;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28D5C;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28D5E;

ExtendedSpritemaps_PirateWalking_20:
    dw $0002,$0000,$0003                                                 ;B28D60;
    dw Spitemaps_PirateWalking_20                                        ;B28D66;
    dw Hitboxes_PirateWalking_2D                                         ;B28D68;
    dw $0000,$0003                                                       ;B28D6A;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28D6E;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28D70;

ExtendedSpritemaps_PirateWalking_21:
    dw $0003,$0005,$FFF5                                                 ;B28D72;
    dw Spitemaps_PirateWalking_19                                        ;B28D78;
    dw Hitboxes_PirateWalking_27                                         ;B28D7A;
    dw $0000,$0003                                                       ;B28D7C;
    dw Spitemaps_PirateWalking_D                                         ;B28D80;
    dw Hitboxes_PirateWalking_14                                         ;B28D82;
    dw $0000,$0003                                                       ;B28D84;
    dw Spitemaps_PirateWalking_16_Ninja_3                                ;B28D88;
    dw Hitboxes_PirateWalking_1D_Ninja_A                                 ;B28D8A;

ExtendedSpritemaps_PirateWalking_22:
    dw $0001,$0000,$0001                                                 ;B28D8C;
    dw Spritemaps_PirateWalking_0                                        ;B28D92;
    dw Hitboxes_PirateWalking_0                                          ;B28D94;

ExtendedSpritemaps_PirateNinja_12:
    dw $0001,$0000,$0000                                                 ;B28D96;
    dw Spitemaps_PirateNinja_2D                                          ;B28D9C;
    dw Hitboxes_PirateNinja_40                                           ;B28D9E;

ExtendedSpritemaps_PirateNinja_13:
    dw $0001,$0000,$0000                                                 ;B28DA0;
    dw Spitemaps_PirateNinja_2E                                          ;B28DA6;
    dw Hitboxes_PirateNinja_41                                           ;B28DA8;

ExtendedSpritemaps_PirateNinja_14:
    dw $0001,$0000,$0000                                                 ;B28DAA;
    dw Spitemaps_PirateNinja_2E_miscount                                 ;B28DB0;
    dw Hitboxes_PirateNinja_42                                           ;B28DB2;

ExtendedSpritemaps_PirateNinja_15:
    dw $0001,$0000,$0000                                                 ;B28DB4;
    dw Spitemaps_PirateNinja_2F                                          ;B28DBA;
    dw Hitboxes_PirateNinja_43                                           ;B28DBC;

ExtendedSpritemaps_PirateNinja_16:
    dw $0001,$0000,$0000                                                 ;B28DBE;
    dw Spitemaps_PirateNinja_30                                          ;B28DC4;
    dw Hitboxes_PirateNinja_44                                           ;B28DC6;

ExtendedSpritemaps_PirateNinja_17:
    dw $0001,$0000,$0000                                                 ;B28DC8;
    dw Spitemaps_PirateNinja_31                                          ;B28DCE;
    dw Hitboxes_PirateNinja_45                                           ;B28DD0;

ExtendedSpritemaps_PirateNinja_18:
    dw $0001,$0000,$0000                                                 ;B28DD2;
    dw Spitemaps_PirateNinja_32                                          ;B28DD8;
    dw Hitboxes_PirateNinja_46                                           ;B28DDA;

ExtendedSpritemaps_PirateNinja_19:
    dw $0001,$0000,$0000                                                 ;B28DDC;
    dw Spitemaps_PirateNinja_33                                          ;B28DE2;
    dw Hitboxes_PirateNinja_47                                           ;B28DE4;

ExtendedSpritemaps_PirateNinja_1A:
    dw $0001,$0000,$0000                                                 ;B28DE6;
    dw Spitemaps_PirateNinja_34                                          ;B28DEC;
    dw Hitboxes_PirateNinja_48                                           ;B28DEE;

ExtendedSpritemaps_PirateNinja_1B:
    dw $0001,$0000,$0000                                                 ;B28DF0;
    dw Spitemaps_PirateNinja_35                                          ;B28DF6;
    dw Hitboxes_PirateNinja_49                                           ;B28DF8;

ExtendedSpritemaps_PirateNinja_1C:
    dw $0001,$0000,$0000                                                 ;B28DFA;
    dw Spitemaps_PirateNinja_36                                          ;B28E00;
    dw Hitboxes_PirateNinja_4A                                           ;B28E02;

ExtendedSpritemaps_PirateNinja_1D:
    dw $0001,$0000,$0000                                                 ;B28E04;
    dw Spitemaps_PirateNinja_37                                          ;B28E0A;
    dw Hitboxes_PirateNinja_4B                                           ;B28E0C;

ExtendedSpritemaps_PirateNinja_1E:
    dw $0001,$0000,$0000                                                 ;B28E0E;
    dw Spitemaps_PirateNinja_38                                          ;B28E14;
    dw Hitboxes_PirateNinja_4C                                           ;B28E16;

ExtendedSpritemaps_PirateNinja_1F:
    dw $0001,$0000,$0000                                                 ;B28E18;
    dw Spitemaps_PirateNinja_39                                          ;B28E1E;
    dw Hitboxes_PirateNinja_4D                                           ;B28E20;

ExtendedSpritemaps_PirateNinja_20:
    dw $0001,$0000,$0000                                                 ;B28E22;
    dw Spitemaps_PirateNinja_3A                                          ;B28E28;
    dw Hitboxes_PirateNinja_4E                                           ;B28E2A;

ExtendedSpritemaps_PirateNinja_21:
    dw $0001,$0000,$0000                                                 ;B28E2C;
    dw Spitemaps_PirateNinja_3B                                          ;B28E32;
    dw Hitboxes_PirateNinja_4F                                           ;B28E34;

ExtendedSpritemaps_PirateNinja_22:
    dw $0002,$FFFB,$0001                                                 ;B28E36;
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B28E3C;
    dw Hitboxes_PirateWalking_33_Ninja_1C                                ;B28E3E;
    dw $0000,$FFFE                                                       ;B28E40;
    dw Spitemaps_PirateNinja_5                                           ;B28E44;
    dw Hitboxes_PirateNinja_14                                           ;B28E46;

ExtendedSpritemaps_PirateNinja_23:
    dw $0002,$FFFB,$0003                                                 ;B28E48;
    dw Spitemaps_PirateWalking_27_Ninja_E                                ;B28E4E;
    dw Hitboxes_PirateWalking_35_Ninja_1E                                ;B28E50;
    dw $FFFF,$0000                                                       ;B28E52;
    dw Spitemaps_PirateNinja_6                                           ;B28E56;
    dw Hitboxes_PirateNinja_15                                           ;B28E58;

ExtendedSpritemaps_PirateNinja_24:
    dw $0002,$FFFB,$0004                                                 ;B28E5A;
    dw Spitemaps_PirateWalking_28_Ninja_F                                ;B28E60;
    dw Hitboxes_PirateWalking_36_Ninja_1F                                ;B28E62;
    dw $0000,$0000                                                       ;B28E64;
    dw Spitemaps_PirateNinja_7                                           ;B28E68;
    dw Hitboxes_PirateNinja_16                                           ;B28E6A;

ExtendedSpritemaps_PirateNinja_25:
    dw $0002,$FFFB,$0002                                                 ;B28E6C;
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28E72;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28E74;
    dw $FFFF,$0000                                                       ;B28E76;
    dw Spitemaps_PirateNinja_8                                           ;B28E7A;
    dw Hitboxes_PirateNinja_17                                           ;B28E7C;

ExtendedSpritemaps_PirateNinja_26:
    dw $0002,$FFFB,$0001                                                 ;B28E7E;
    dw Spitemaps_PirateWalking_29_Ninja_10                               ;B28E84;
    dw Hitboxes_PirateWalking_37_Ninja_20                                ;B28E86;
    dw $0002,$FFFE                                                       ;B28E88;
    dw Spitemaps_PirateNinja_9                                           ;B28E8C;
    dw Hitboxes_PirateNinja_18                                           ;B28E8E;

ExtendedSpritemaps_PirateNinja_27:
    dw $0002,$FFFB,$0003                                                 ;B28E90;
    dw Spitemaps_PirateWalking_28_Ninja_F                                ;B28E96;
    dw Hitboxes_PirateWalking_36_Ninja_1F                                ;B28E98;
    dw $0002,$0000                                                       ;B28E9A;
    dw Spitemaps_PirateNinja_A                                           ;B28E9E;
    dw Hitboxes_PirateNinja_19                                           ;B28EA0;

ExtendedSpritemaps_PirateNinja_28:
    dw $0002,$FFFB,$0003                                                 ;B28EA2;
    dw Spitemaps_PirateWalking_27_Ninja_E                                ;B28EA8;
    dw Hitboxes_PirateWalking_35_Ninja_1E                                ;B28EAA;
    dw $0000,$0000                                                       ;B28EAC;
    dw Spitemaps_PirateNinja_B                                           ;B28EB0;
    dw Hitboxes_PirateNinja_1A                                           ;B28EB2;

ExtendedSpritemaps_PirateNinja_29:
    dw $0002,$FFFB,$0001                                                 ;B28EB4;
    dw Spitemaps_PirateWalking_26_Ninja_D                                ;B28EBA;
    dw Hitboxes_PirateWalking_33_Ninja_1C                                ;B28EBC;
    dw $0000,$0000                                                       ;B28EBE;
    dw Spitemaps_PirateNinja_C                                           ;B28EC2;
    dw Hitboxes_PirateNinja_1B                                           ;B28EC4;

ExtendedSpritemaps_PirateNinja_2A:
    dw $0002,$0005,$0001                                                 ;B28EC6;
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28ECC;
    dw Hitboxes_PirateWalking_39_Ninja_32                                ;B28ECE;
    dw $0000,$FFFE                                                       ;B28ED0;
    dw Spitemaps_PirateNinja_19                                          ;B28ED4;
    dw Hitboxes_PirateNinja_2A                                           ;B28ED6;

ExtendedSpritemaps_PirateNinja_2B:
    dw $0002,$0005,$0003                                                 ;B28ED8;
    dw Spitemaps_PirateWalking_2C_Ninja_22                               ;B28EDE;
    dw Hitboxes_PirateWalking_3A_Ninja_34                                ;B28EE0;
    dw $0000,$0000                                                       ;B28EE2;
    dw Spitemaps_PirateNinja_1A                                          ;B28EE6;
    dw Hitboxes_PirateNinja_2B                                           ;B28EE8;

ExtendedSpritemaps_PirateNinja_2C:
    dw $0002,$0005,$0004                                                 ;B28EEA;
    dw Spitemaps_PirateWalking_2D_Ninja_23                               ;B28EF0;
    dw Hitboxes_PirateWalking_3B_Ninja_35                                ;B28EF2;
    dw $0000,$0000                                                       ;B28EF4;
    dw Spitemaps_PirateNinja_1B                                          ;B28EF8;
    dw Hitboxes_PirateNinja_2C                                           ;B28EFA;

ExtendedSpritemaps_PirateNinja_2D:
    dw $0002,$0005,$0002                                                 ;B28EFC;
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28F02;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28F04;
    dw $0000,$0000                                                       ;B28F06;
    dw Spitemaps_PirateNinja_1C                                          ;B28F0A;
    dw Hitboxes_PirateNinja_2D                                           ;B28F0C;

ExtendedSpritemaps_PirateNinja_2E:
    dw $0002,$0005,$0001                                                 ;B28F0E;
    dw Spitemaps_PirateWalking_2E_Ninja_24                               ;B28F14;
    dw Hitboxes_PirateWalking_3C_Ninja_36                                ;B28F16;
    dw $FFFF,$FFFF                                                       ;B28F18;
    dw Spitemaps_PirateNinja_1D                                          ;B28F1C;
    dw Hitboxes_PirateNinja_2E                                           ;B28F1E;

ExtendedSpritemaps_PirateNinja_2F:
    dw $0002,$0005,$0003                                                 ;B28F20;
    dw Spitemaps_PirateWalking_2D_Ninja_23                               ;B28F26;
    dw Hitboxes_PirateWalking_3B_Ninja_35                                ;B28F28;
    dw $0000,$0000                                                       ;B28F2A;
    dw Spitemaps_PirateNinja_1E                                          ;B28F2E;
    dw Hitboxes_PirateNinja_2F                                           ;B28F30;

ExtendedSpritemaps_PirateNinja_30:
    dw $0002,$0005,$0003                                                 ;B28F32;
    dw Spitemaps_PirateWalking_2C_Ninja_22                               ;B28F38;
    dw Hitboxes_PirateWalking_3A_Ninja_34                                ;B28F3A;
    dw $0001,$0000                                                       ;B28F3C;
    dw Spitemaps_PirateNinja_1F                                          ;B28F40;
    dw Hitboxes_PirateNinja_30                                           ;B28F42;

ExtendedSpritemaps_PirateNinja_31:
    dw $0002,$0005,$0001                                                 ;B28F44;
    dw Spitemaps_PirateWalking_2B_Ninja_21                               ;B28F4A;
    dw Hitboxes_PirateWalking_39_Ninja_32                                ;B28F4C;
    dw $0001,$0000                                                       ;B28F4E;
    dw Spitemaps_PirateNinja_20                                          ;B28F52;
    dw Hitboxes_PirateNinja_31                                           ;B28F54;

ExtendedSpritemaps_PirateNinja_32:
    dw $0001,$0000,$0003                                                 ;B28F56;
    dw Spitemaps_PirateNinja_15                                          ;B28F5C;
    dw Hitboxes_PirateNinja_25                                           ;B28F5E;

ExtendedSpritemaps_PirateNinja_33:
    dw $0001,$0000,$0003                                                 ;B28F60;
    dw Spitemaps_PirateNinja_16                                          ;B28F66;
    dw Hitboxes_PirateNinja_26                                           ;B28F68;

ExtendedSpritemaps_PirateNinja_34:
    dw $0001,$0000,$0003                                                 ;B28F6A;
    dw Spitemaps_PirateNinja_17                                          ;B28F70;
    dw Hitboxes_PirateNinja_27                                           ;B28F72;

ExtendedSpritemaps_PirateNinja_35:
    dw $0001,$0000,$0003                                                 ;B28F74;
    dw Spitemaps_PirateNinja_29                                          ;B28F7A;
    dw Hitboxes_PirateNinja_3B                                           ;B28F7C;

ExtendedSpritemaps_PirateNinja_36:
    dw $0001,$0000,$0003                                                 ;B28F7E;
    dw Spitemaps_PirateNinja_2A                                          ;B28F84;
    dw Hitboxes_PirateNinja_3C                                           ;B28F86;

ExtendedSpritemaps_PirateNinja_37:
    dw $0001,$0000,$0003                                                 ;B28F88;
    dw Spitemaps_PirateNinja_2B                                          ;B28F8E;
    dw Hitboxes_PirateNinja_3D                                           ;B28F90;

ExtendedSpritemaps_PirateWalking_23:
    dw $0001,$0000,$0008                                                 ;B28F92;
    dw Spitemaps_PirateWalking_2A_Ninja_18                               ;B28F98;
    dw Hitboxes_PirateWalking_38                                         ;B28F9A;

ExtendedSpritemaps_PirateNinja_38:
    dw $0001,$0000,$0008                                                 ;B28F9C;
    dw Spitemaps_PirateWalking_2A_Ninja_18                               ;B28FA2;
    dw Hitboxes_PirateNinja_29                                           ;B28FA4;

ExtendedSpritemaps_PirateWalking_24:
    dw $0001,$0000,$0008                                                 ;B28FA6;
    dw Spitemaps_PirateWalking_2F                                        ;B28FAC;
    dw Hitboxes_PirateWalking_3D                                         ;B28FAE;

ExtendedSpritemaps_PirateNinja_39:
    dw $0001,$0000,$0008                                                 ;B28FB0;
    dw Spitemaps_PirateWalking_2F                                        ;B28FB6;
    dw Hitboxes_PirateNinja_3F                                           ;B28FB8;

UNUSED_ExtendedSpritemaps_SpacePirate_B28FBA:
    dw $0001,$0000,$0000                                                 ;B28FBA;
    dw UNUSED_Spitemaps_SpacePirate_B2DEBA                               ;B28FC0;
    dw UNUSED_Hitboxes_SpacePirate_B2A57C                                ;B28FC2;

UNUSED_ExtendedSpritemaps_SpacePirate_B28FC4:
    dw $0001,$0000,$0000                                                 ;B28FC4;
    dw UNUSED_Spitemaps_SpacePirate_B2DF20                               ;B28FCA;
    dw UNUSED_Hitboxes_SpacePirate_B2A58A                                ;B28FCC;

UNUSED_ExtendedSpritemaps_SpacePirate_B28FCE:
    dw $0001,$0000,$0000                                                 ;B28FCE;
    dw UNUSED_Spitemaps_SpacePirate_B2DF6D                               ;B28FD4;
    dw UNUSED_Hitboxes_SpacePirate_B2A598                                ;B28FD6;

UNUSED_ExtendedSpritemaps_SpacePirate_B28FD8:
    dw $0001,$0000,$0000                                                 ;B28FD8;
    dw UNUSED_Spitemaps_SpacePirate_B2DFB5                               ;B28FDE;
    dw UNUSED_Hitboxes_SpacePirate_B2A5A6                                ;B28FE0;

UNUSED_ExtendedSpritemaps_SpacePirate_B28FE2:
    dw $0001,$0000,$0000                                                 ;B28FE2;
    dw UNUSED_Spitemaps_SpacePirate_B2E71A                               ;B28FE8;
    dw UNUSED_Hitboxes_SpacePirate_B2A760                                ;B28FEA;

UNUSED_ExtendedSpritemaps_SpacePirate_B28FEC:
    dw $0001,$0000,$0000                                                 ;B28FEC;
    dw UNUSED_Spitemaps_SpacePirate_B2E780                               ;B28FF2;
    dw UNUSED_Hitboxes_SpacePirate_B2A76E                                ;B28FF4;

UNUSED_ExtendedSpritemaps_SpacePirate_B28FF6:
    dw $0001,$0000,$0000                                                 ;B28FF6;
    dw UNUSED_Spitemaps_SpacePirate_B2E7CD                               ;B28FFC;
    dw UNUSED_Hitboxes_SpacePirate_B2A77C                                ;B28FFE;

UNUSED_ExtendedSpritemaps_SpacePirate_B29000:
    dw $0001,$0000,$0000                                                 ;B29000;
    dw UNUSED_Spitemaps_SpacePirate_B2E815                               ;B29006;
    dw UNUSED_Hitboxes_SpacePirate_B2A78A                                ;B29008;

ExtendedSpritemaps_PirateNinja_3A:
    dw $0001,$0000,$0000                                                 ;B2900A;
    dw Spitemaps_PirateNinja_48                                          ;B29010;
    dw Hitboxes_PirateNinja_5A                                           ;B29012;

ExtendedSpritemaps_PirateNinja_3B:
    dw $0001,$0000,$0000                                                 ;B29014;
    dw Spitemaps_PirateNinja_4C                                          ;B2901A;
    dw Hitboxes_PirateNinja_5E                                           ;B2901C;

ExtendedSpritemaps_PirateNinja_3C:
    dw $0001,$0000,$0000                                                 ;B2901E;
    dw Spitemaps_PirateNinja_4E                                          ;B29024;
    dw Hitboxes_PirateNinja_60                                           ;B29026;

ExtendedSpritemaps_PirateNinja_3D:
    dw $0001,$0000,$0000                                                 ;B29028;
    dw Spitemaps_PirateNinja_52                                          ;B2902E;
    dw Hitboxes_PirateNinja_64                                           ;B29030;

ExtendedSpritemaps_PirateNinja_3E:
    dw $0001,$0005,$0000                                                 ;B29032;
    dw Spitemaps_PirateNinja_4A                                          ;B29038;
    dw Hitboxes_PirateNinja_5C                                           ;B2903A;

ExtendedSpritemaps_PirateNinja_3F:
    dw $0001,$FFFB,$0001                                                 ;B2903C;
    dw Spitemaps_PirateNinja_4B                                          ;B29042;
    dw Hitboxes_PirateNinja_5D                                           ;B29044;

ExtendedSpritemaps_PirateNinja_40:
    dw $0001,$FFFB,$0000                                                 ;B29046;
    dw Spitemaps_PirateNinja_50                                          ;B2904C;
    dw Hitboxes_PirateNinja_62                                           ;B2904E;

ExtendedSpritemaps_PirateNinja_41:
    dw $0001,$0005,$0001                                                 ;B29050;
    dw Spitemaps_PirateNinja_51                                          ;B29056;
    dw Hitboxes_PirateNinja_63                                           ;B29058;

UNUSED_ExtendedSpritemaps_SpacePirate_B2905A:
    dw $0001,$0000,$0000                                                 ;B2905A;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B29060;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B29062;

UNUSED_ExtendedSpritemaps_SpacePirate_B29064:
    dw $0001,$0000,$0000                                                 ;B29064;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B2906A;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B2906C;

UNUSED_ExtendedSpritemaps_SpacePirate_B2906E:
    dw $0002,$FFFB,$0003                                                 ;B2906E;
    dw Spitemaps_PirateNinja_47                                          ;B29074;
    dw Hitboxes_PirateNinja_59                                           ;B29076;
    dw $0000,$0000                                                       ;B29078;
    dw UNUSED_Spitemaps_SpacePirate_B2D0F8                               ;B2907C;
    dw UNUSED_Hitboxes_SpacePirate_B2A17E                                ;B2907E;

UNUSED_ExtendedSpritemaps_SpacePirate_B29080:
    dw $0002,$FFFB,$0003                                                 ;B29080;
    dw UNUSED_Spitemaps_SpacePirate_B2DB49                               ;B29086;
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6                                ;B29088;
    dw $0000,$0000                                                       ;B2908A;
    dw UNUSED_Spitemaps_SpacePirate_B2D12C                               ;B2908E;
    dw UNUSED_Hitboxes_SpacePirate_B2A18C                                ;B29090;

UNUSED_ExtendedSpritemaps_SpacePirate_B29092:
    dw $0002,$FFFB,$0003                                                 ;B29092;
    dw UNUSED_Spitemaps_SpacePirate_B2DB78                               ;B29098;
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4                                ;B2909A;
    dw $0000,$0000                                                       ;B2909C;
    dw UNUSED_Spitemaps_SpacePirate_B2D165                               ;B290A0;
    dw UNUSED_Hitboxes_SpacePirate_B2A19A                                ;B290A2;

UNUSED_ExtendedSpritemaps_SpacePirate_B290A4:
    dw $0002,$FFFB,$0003                                                 ;B290A4;
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2                               ;B290AA;
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2                                ;B290AC;
    dw $0002,$0000                                                       ;B290AE;
    dw UNUSED_Spitemaps_SpacePirate_B2D1A3                               ;B290B2;
    dw UNUSED_Hitboxes_SpacePirate_B2A1A8                                ;B290B4;

UNUSED_ExtendedSpritemaps_SpacePirate_B290B6:
    dw $0002,$FFFB,$0003                                                 ;B290B6;
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2                               ;B290BC;
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2                                ;B290BE;
    dw $0002,$0000                                                       ;B290C0;
    dw UNUSED_Spitemaps_SpacePirate_B2D1DC                               ;B290C4;
    dw UNUSED_Hitboxes_SpacePirate_B2A1B6                                ;B290C6;

UNUSED_ExtendedSpritemaps_SpacePirate_B290C8:
    dw $0002,$FFFB,$0003                                                 ;B290C8;
    dw UNUSED_Spitemaps_SpacePirate_B2DB78                               ;B290CE;
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4                                ;B290D0;
    dw $0002,$0000                                                       ;B290D2;
    dw UNUSED_Spitemaps_SpacePirate_B2D210                               ;B290D6;
    dw UNUSED_Hitboxes_SpacePirate_B2A1C4                                ;B290D8;

UNUSED_ExtendedSpritemaps_SpacePirate_B290DA:
    dw $0002,$FFFB,$0003                                                 ;B290DA;
    dw UNUSED_Spitemaps_SpacePirate_B2DB49                               ;B290E0;
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6                                ;B290E2;
    dw $0000,$0000                                                       ;B290E4;
    dw UNUSED_Spitemaps_SpacePirate_B2D249                               ;B290E8;
    dw UNUSED_Hitboxes_SpacePirate_B2A1D2                                ;B290EA;

UNUSED_ExtendedSpritemaps_SpacePirate_B290EC:
    dw $0002,$FFFB,$0003                                                 ;B290EC;
    dw Spitemaps_PirateNinja_47                                          ;B290F2;
    dw Hitboxes_PirateNinja_59                                           ;B290F4;
    dw $0000,$0000                                                       ;B290F6;
    dw UNUSED_Spitemaps_SpacePirate_B2D287                               ;B290FA;
    dw UNUSED_Hitboxes_SpacePirate_B2A1E0                                ;B290FC;

ExtendedSpritemaps_PirateNinja_42:
    dw $0002,$0000,$0005                                                 ;B290FE;
    dw Spitemaps_PirateNinja_47                                          ;B29104;
    dw Hitboxes_PirateNinja_59                                           ;B29106;
    dw $0000,$0003                                                       ;B29108;
    dw Spitemaps_PirateNinja_3E                                          ;B2910C;
    dw Hitboxes_PirateNinja_52                                           ;B2910E;

UNUSED_ExtendedSpritemaps_SpacePirate_B29110:
    dw $0002,$0000,$0005                                                 ;B29110;
    dw UNUSED_Spitemaps_SpacePirate_B2DBCC                               ;B29116;
    dw UNUSED_Hitboxes_SpacePirate_B2A4F0                                ;B29118;
    dw $0000,$0003                                                       ;B2911A;
    dw Spitemaps_PirateNinja_3D                                          ;B2911E;
    dw Hitboxes_PirateNinja_51                                           ;B29120;

UNUSED_ExtendedSpritemaps_SpacePirate_B29122:
    dw $0002,$0000,$0005                                                 ;B29122;
    dw UNUSED_Spitemaps_SpacePirate_B2DBF1                               ;B29128;
    dw UNUSED_Hitboxes_SpacePirate_B2A4FE                                ;B2912A;
    dw $0000,$0003                                                       ;B2912C;
    dw Spitemaps_PirateNinja_3D                                          ;B29130;
    dw Hitboxes_PirateNinja_51                                           ;B29132;

UNUSED_ExtendedSpritemaps_SpacePirate_B29134:
    dw $0002,$0000,$0004                                                 ;B29134;
    dw UNUSED_Spitemaps_SpacePirate_B2DC16                               ;B2913A;
    dw UNUSED_Hitboxes_SpacePirate_B2A50C                                ;B2913C;
    dw $0000,$0003                                                       ;B2913E;
    dw Spitemaps_PirateNinja_3D                                          ;B29142;
    dw Hitboxes_PirateNinja_51                                           ;B29144;

UNUSED_ExtendedSpritemaps_SpacePirate_B29146:
    dw $0002,$0000,$0003                                                 ;B29146;
    dw UNUSED_Spitemaps_SpacePirate_B2DC45                               ;B2914C;
    dw UNUSED_Hitboxes_SpacePirate_B2A51A                                ;B2914E;
    dw $0000,$0003                                                       ;B29150;
    dw Spitemaps_PirateNinja_3D                                          ;B29154;
    dw Hitboxes_PirateNinja_51                                           ;B29156;

UNUSED_ExtendedSpritemaps_SpacePirate_B29158:
    dw $0002,$0000,$0005                                                 ;B29158;
    dw UNUSED_Spitemaps_SpacePirate_B2DC16                               ;B2915E;
    dw UNUSED_Hitboxes_SpacePirate_B2A50C                                ;B29160;
    dw $0000,$0003                                                       ;B29162;
    dw Spitemaps_PirateNinja_3D                                          ;B29166;
    dw Hitboxes_PirateNinja_51                                           ;B29168;

UNUSED_ExtendedSpritemaps_SpacePirate_B2916A:
    dw $0002,$0000,$0005                                                 ;B2916A;
    dw UNUSED_Spitemaps_SpacePirate_B2DBCC                               ;B29170;
    dw UNUSED_Hitboxes_SpacePirate_B2A4F0                                ;B29172;
    dw $0000,$0003                                                       ;B29174;
    dw Spitemaps_PirateNinja_3D                                          ;B29178;
    dw Hitboxes_PirateNinja_51                                           ;B2917A;

UNUSED_ExtendedSpritemaps_SpacePirate_B2917C:
    dw $0002,$0000,$0006                                                 ;B2917C;
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2                               ;B29182;
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2                                ;B29184;
    dw $0000,$0003                                                       ;B29186;
    dw Spitemaps_PirateNinja_3D                                          ;B2918A;
    dw Hitboxes_PirateNinja_51                                           ;B2918C;

UNUSED_ExtendedSpritemaps_SpacePirate_B2918E:
    dw $0002,$0000,$0007                                                 ;B2918E;
    dw UNUSED_Spitemaps_SpacePirate_B2DFFD                               ;B29194;
    dw UNUSED_Hitboxes_SpacePirate_B2A5B4                                ;B29196;
    dw $0000,$0003                                                       ;B29198;
    dw Spitemaps_PirateNinja_3E                                          ;B2919C;
    dw Hitboxes_PirateNinja_52                                           ;B2919E;

UNUSED_ExtendedSpritemaps_SpacePirate_B291A0:
    dw $0001,$0000,$0003                                                 ;B291A0;
    dw UNUSED_Spitemaps_SpacePirate_B2D328                               ;B291A6;
    dw UNUSED_Hitboxes_SpacePirate_B2A20A                                ;B291A8;

UNUSED_ExtendedSpritemaps_SpacePirate_B291AA:
    dw $0001,$0000,$0003                                                 ;B291AA;
    dw UNUSED_Spitemaps_SpacePirate_B2D339                               ;B291B0;
    dw UNUSED_Hitboxes_SpacePirate_B2A218                                ;B291B2;

UNUSED_ExtendedSpritemaps_SpacePirate_B291B4:
    dw $0001,$0000,$0003                                                 ;B291B4;
    dw UNUSED_Spitemaps_SpacePirate_B2D345                               ;B291BA;
    dw UNUSED_Hitboxes_SpacePirate_B2A226                                ;B291BC;

UNUSED_ExtendedSpritemaps_SpacePirate_B291BE:
    dw $0001,$0000,$0003                                                 ;B291BE;
    dw UNUSED_Spitemaps_SpacePirate_B2D356                               ;B291C4;
    dw UNUSED_Hitboxes_SpacePirate_B2A234                                ;B291C6;

UNUSED_ExtendedSpritemaps_SpacePirate_B291C8:
    dw $0001,$0000,$0003                                                 ;B291C8;
    dw UNUSED_Spitemaps_SpacePirate_B2D362                               ;B291CE;
    dw UNUSED_Hitboxes_SpacePirate_B2A242                                ;B291D0;

UNUSED_ExtendedSpritemaps_SpacePirate_B291D2:
    dw $0001,$0000,$0003                                                 ;B291D2;
    dw UNUSED_Spitemaps_SpacePirate_B2D373                               ;B291D8;
    dw UNUSED_Hitboxes_SpacePirate_B2A250                                ;B291DA;

UNUSED_ExtendedSpritemaps_SpacePirate_B291DC:
    dw $0001,$0000,$0003                                                 ;B291DC;
    dw UNUSED_Spitemaps_SpacePirate_B2D37F                               ;B291E2;
    dw UNUSED_Hitboxes_SpacePirate_B2A25E                                ;B291E4;

UNUSED_ExtendedSpritemaps_SpacePirate_B291E6:
    dw $0001,$0000,$0003                                                 ;B291E6;
    dw UNUSED_Spitemaps_SpacePirate_B2D390                               ;B291EC;
    dw UNUSED_Hitboxes_SpacePirate_B2A26C                                ;B291EE;

UNUSED_ExtendedSpritemaps_SpacePirate_B291F0:
    dw $0002,$0005,$0003                                                 ;B291F0;
    dw Spitemaps_PirateNinja_4D                                          ;B291F6;
    dw Hitboxes_PirateNinja_5F                                           ;B291F8;
    dw $0000,$0000                                                       ;B291FA;
    dw UNUSED_Spitemaps_SpacePirate_B2D406                               ;B291FE;
    dw UNUSED_Hitboxes_SpacePirate_B2A2A4                                ;B29200;

UNUSED_ExtendedSpritemaps_SpacePirate_B29202:
    dw $0002,$0005,$0003                                                 ;B29202;
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9                               ;B29208;
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA                                ;B2920A;
    dw $0000,$0000                                                       ;B2920C;
    dw UNUSED_Spitemaps_SpacePirate_B2D43A                               ;B29210;
    dw UNUSED_Hitboxes_SpacePirate_B2A2B2                                ;B29212;

UNUSED_ExtendedSpritemaps_SpacePirate_B29214:
    dw $0002,$0005,$0003                                                 ;B29214;
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8                               ;B2921A;
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8                                ;B2921C;
    dw $0000,$0000                                                       ;B2921E;
    dw UNUSED_Spitemaps_SpacePirate_B2D473                               ;B29222;
    dw UNUSED_Hitboxes_SpacePirate_B2A2C0                                ;B29224;

UNUSED_ExtendedSpritemaps_SpacePirate_B29226:
    dw $0002,$0005,$0003                                                 ;B29226;
    dw UNUSED_Spitemaps_SpacePirate_B2E402                               ;B2922C;
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6                                ;B2922E;
    dw $0000,$0000                                                       ;B29230;
    dw UNUSED_Spitemaps_SpacePirate_B2D4B1                               ;B29234;
    dw UNUSED_Hitboxes_SpacePirate_B2A2CE                                ;B29236;

UNUSED_ExtendedSpritemaps_SpacePirate_B29238:
    dw $0002,$0005,$0003                                                 ;B29238;
    dw UNUSED_Spitemaps_SpacePirate_B2E402                               ;B2923E;
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6                                ;B29240;
    dw $FFFF,$0000                                                       ;B29242;
    dw UNUSED_Spitemaps_SpacePirate_B2D4EA                               ;B29246;
    dw UNUSED_Hitboxes_SpacePirate_B2A2DC                                ;B29248;

UNUSED_ExtendedSpritemaps_SpacePirate_B2924A:
    dw $0002,$0005,$0003                                                 ;B2924A;
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8                               ;B29250;
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8                                ;B29252;
    dw $0000,$0000                                                       ;B29254;
    dw UNUSED_Spitemaps_SpacePirate_B2D51E                               ;B29258;
    dw UNUSED_Hitboxes_SpacePirate_B2A2EA                                ;B2925A;

UNUSED_ExtendedSpritemaps_SpacePirate_B2925C:
    dw $0002,$0005,$0003                                                 ;B2925C;
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9                               ;B29262;
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA                                ;B29264;
    dw $0001,$0000                                                       ;B29266;
    dw UNUSED_Spitemaps_SpacePirate_B2D557                               ;B2926A;
    dw UNUSED_Hitboxes_SpacePirate_B2A2F8                                ;B2926C;

UNUSED_ExtendedSpritemaps_SpacePirate_B2926E:
    dw $0002,$0005,$0003                                                 ;B2926E;
    dw Spitemaps_PirateNinja_4D                                          ;B29274;
    dw Hitboxes_PirateNinja_5F                                           ;B29276;
    dw $0001,$0000                                                       ;B29278;
    dw UNUSED_Spitemaps_SpacePirate_B2D595                               ;B2927C;
    dw UNUSED_Hitboxes_SpacePirate_B2A306                                ;B2927E;

ExtendedSpritemaps_PirateNinja_43:
    dw $0002,$0000,$0005                                                 ;B29280;
    dw Spitemaps_PirateNinja_4D                                          ;B29286;
    dw Hitboxes_PirateNinja_5F                                           ;B29288;
    dw $0000,$0003                                                       ;B2928A;
    dw Spitemaps_PirateNinja_42                                          ;B2928E;
    dw Hitboxes_PirateNinja_56                                           ;B29290;

UNUSED_ExtendedSpritemaps_SpacePirate_B29292:
    dw $0002,$0000,$0005                                                 ;B29292;
    dw UNUSED_Spitemaps_SpacePirate_B2E42C                               ;B29298;
    dw UNUSED_Hitboxes_SpacePirate_B2A6D4                                ;B2929A;
    dw $0000,$0003                                                       ;B2929C;
    dw Spitemaps_PirateNinja_41                                          ;B292A0;
    dw Hitboxes_PirateNinja_55                                           ;B292A2;

UNUSED_ExtendedSpritemaps_SpacePirate_B292A4:
    dw $0002,$0000,$0005                                                 ;B292A4;
    dw UNUSED_Spitemaps_SpacePirate_B2E451                               ;B292AA;
    dw UNUSED_Hitboxes_SpacePirate_B2A6E2                                ;B292AC;
    dw $0000,$0003                                                       ;B292AE;
    dw Spitemaps_PirateNinja_41                                          ;B292B2;
    dw Hitboxes_PirateNinja_55                                           ;B292B4;

UNUSED_ExtendedSpritemaps_SpacePirate_B292B6:
    dw $0002,$0000,$0004                                                 ;B292B6;
    dw UNUSED_Spitemaps_SpacePirate_B2E476                               ;B292BC;
    dw UNUSED_Hitboxes_SpacePirate_B2A6F0                                ;B292BE;
    dw $0000,$0003                                                       ;B292C0;
    dw Spitemaps_PirateNinja_41                                          ;B292C4;
    dw Hitboxes_PirateNinja_55                                           ;B292C6;

UNUSED_ExtendedSpritemaps_SpacePirate_B292C8:
    dw $0002,$0000,$0003                                                 ;B292C8;
    dw UNUSED_Spitemaps_SpacePirate_B2E4A5                               ;B292CE;
    dw UNUSED_Hitboxes_SpacePirate_B2A6FE                                ;B292D0;
    dw $0000,$0003                                                       ;B292D2;
    dw Spitemaps_PirateNinja_41                                          ;B292D6;
    dw Hitboxes_PirateNinja_55                                           ;B292D8;

UNUSED_ExtendedSpritemaps_SpacePirate_B292DA:
    dw $0002,$0000,$0005                                                 ;B292DA;
    dw UNUSED_Spitemaps_SpacePirate_B2E476                               ;B292E0;
    dw UNUSED_Hitboxes_SpacePirate_B2A6F0                                ;B292E2;
    dw $0000,$0003                                                       ;B292E4;
    dw Spitemaps_PirateNinja_41                                          ;B292E8;
    dw Hitboxes_PirateNinja_55                                           ;B292EA;

UNUSED_ExtendedSpritemaps_SpacePirate_B292EC:
    dw $0002,$0000,$0005                                                 ;B292EC;
    dw UNUSED_Spitemaps_SpacePirate_B2E402                               ;B292F2;
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6                                ;B292F4;
    dw $0000,$0003                                                       ;B292F6;
    dw Spitemaps_PirateNinja_41                                          ;B292FA;
    dw Hitboxes_PirateNinja_55                                           ;B292FC;

UNUSED_ExtendedSpritemaps_SpacePirate_B292FE:
    dw $0002,$0000,$0006                                                 ;B292FE;
    dw UNUSED_Spitemaps_SpacePirate_B2E85D                               ;B29304;
    dw UNUSED_Hitboxes_SpacePirate_B2A798                                ;B29306;
    dw $0000,$0003                                                       ;B29308;
    dw Spitemaps_PirateNinja_41                                          ;B2930C;
    dw Hitboxes_PirateNinja_55                                           ;B2930E;

UNUSED_ExtendedSpritemaps_SpacePirate_B29310:
    dw $0002,$0000,$0007                                                 ;B29310;
    dw UNUSED_Spitemaps_SpacePirate_B2E85D                               ;B29316;
    dw UNUSED_Hitboxes_SpacePirate_B2A798                                ;B29318;
    dw $0000,$0003                                                       ;B2931A;
    dw Spitemaps_PirateNinja_42                                          ;B2931E;
    dw Hitboxes_PirateNinja_56                                           ;B29320;

UNUSED_ExtendedSpritemaps_SpacePirate_B29322:
    dw $0001,$0000,$0000                                                 ;B29322;
    dw UNUSED_Spitemaps_SpacePirate_B2D636                               ;B29328;
    dw UNUSED_Hitboxes_SpacePirate_B2A322                                ;B2932A;

UNUSED_ExtendedSpritemaps_SpacePirate_B2932C:
    dw $0001,$0000,$0000                                                 ;B2932C;
    dw UNUSED_Spitemaps_SpacePirate_B2D647                               ;B29332;
    dw UNUSED_Hitboxes_SpacePirate_B2A330                                ;B29334;

UNUSED_ExtendedSpritemaps_SpacePirate_B29336:
    dw $0001,$0000,$0000                                                 ;B29336;
    dw UNUSED_Spitemaps_SpacePirate_B2D653                               ;B2933C;
    dw UNUSED_Hitboxes_SpacePirate_B2A33E                                ;B2933E;

UNUSED_ExtendedSpritemaps_SpacePirate_B29340:
    dw $0001,$0000,$0000                                                 ;B29340;
    dw UNUSED_Spitemaps_SpacePirate_B2D664                               ;B29346;
    dw UNUSED_Hitboxes_SpacePirate_B2A34C                                ;B29348;

UNUSED_ExtendedSpritemaps_SpacePirate_B2934A:
    dw $0001,$0000,$0000                                                 ;B2934A;
    dw UNUSED_Spitemaps_SpacePirate_B2D670                               ;B29350;
    dw UNUSED_Hitboxes_SpacePirate_B2A35A                                ;B29352;

UNUSED_ExtendedSpritemaps_SpacePirate_B29354:
    dw $0001,$0000,$0000                                                 ;B29354;
    dw UNUSED_Spitemaps_SpacePirate_B2D681                               ;B2935A;
    dw UNUSED_Hitboxes_SpacePirate_B2A368                                ;B2935C;

UNUSED_ExtendedSpritemaps_SpacePirate_B2935E:
    dw $0001,$0000,$0000                                                 ;B2935E;
    dw UNUSED_Spitemaps_SpacePirate_B2D68D                               ;B29364;
    dw UNUSED_Hitboxes_SpacePirate_B2A376                                ;B29366;

UNUSED_ExtendedSpritemaps_SpacePirate_B29368:
    dw $0001,$0000,$0004                                                 ;B29368;
    dw UNUSED_Spitemaps_SpacePirate_B2D69E                               ;B2936E;
    dw UNUSED_Hitboxes_SpacePirate_B2A384                                ;B29370;

ExtendedSpritemaps_PirateNinja_44:
    dw $0001,$0002,$0000                                                 ;B29372;
    dw Spitemaps_PirateNinja_49                                          ;B29378;
    dw Hitboxes_PirateNinja_5B                                           ;B2937A;

ExtendedSpritemaps_PirateNinja_45:
    dw $0001,$FFFE,$0000                                                 ;B2937C;
    dw Spitemaps_PirateNinja_4F                                          ;B29382;
    dw Hitboxes_PirateNinja_61                                           ;B29384;

UNUSED_ExtendedSpritemaps_SpacePirate_B29386:
    dw $0001,$0000,$0003                                                 ;B29386;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B2938C;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B2938E;

UNUSED_ExtendedSpritemaps_SpacePirate_B29390:
    dw $0001,$0000,$0003                                                 ;B29390;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B29396;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B29398;

UNUSED_ExtendedSpritemaps_SpacePirate_B2939A:
    dw $0001,$FFFF,$0004                                                 ;B2939A;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B293A0;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B293A2;

UNUSED_ExtendedSpritemaps_SpacePirate_B293A4:
    dw $0001,$FFFE,$0006                                                 ;B293A4;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B293AA;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B293AC;

UNUSED_ExtendedSpritemaps_SpacePirate_B293AE:
    dw $0001,$0000,$0003                                                 ;B293AE;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B293B4;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B293B6;

UNUSED_ExtendedSpritemaps_SpacePirate_B293B8:
    dw $0001,$0000,$0003                                                 ;B293B8;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B293BE;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B293C0;

UNUSED_ExtendedSpritemaps_SpacePirate_B293C2:
    dw $0001,$0000,$0003                                                 ;B293C2;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B293C8;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B293CA;

UNUSED_ExtendedSpritemaps_SpacePirate_B293CC:
    dw $0001,$0000,$0003                                                 ;B293CC;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B293D2;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B293D4;

UNUSED_ExtendedSpritemaps_SpacePirate_B293D6:
    dw $0001,$0001,$0004                                                 ;B293D6;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B293DC;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B293DE;

UNUSED_ExtendedSpritemaps_SpacePirate_B293E0:
    dw $0001,$0002,$0006                                                 ;B293E0;
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC                               ;B293E6;
    dw UNUSED_Hitboxes_SpacePirate_B29FE8                                ;B293E8;

ExtendedSpritemaps_PirateNinja_46:
    dw $0003,$FFFB,$FFF4                                                 ;B293EA;
    dw Spitemaps_PirateNinja_43                                          ;B293F0;
    dw Hitboxes_PirateNinja_57                                           ;B293F2;
    dw $0000,$0003                                                       ;B293F4;
    dw Spitemaps_PirateNinja_3F                                          ;B293F8;
    dw Hitboxes_PirateNinja_53                                           ;B293FA;
    dw $0000,$0003                                                       ;B293FC;
    dw Spitemaps_PirateNinja_3D                                          ;B29400;
    dw Hitboxes_PirateNinja_51                                           ;B29402;

ExtendedSpritemaps_PirateNinja_47:
    dw $0002,$0000,$0003                                                 ;B29404;
    dw Spitemaps_PirateNinja_45                                          ;B2940A;
    dw Hitboxes_PirateNinja_57                                           ;B2940C;
    dw $0000,$0003                                                       ;B2940E;
    dw Spitemaps_PirateNinja_3D                                          ;B29412;
    dw Hitboxes_PirateNinja_51                                           ;B29414;

ExtendedSpritemaps_PirateNinja_48:
    dw $0003,$FFFB,$FFF5                                                 ;B29416;
    dw Spitemaps_PirateNinja_44                                          ;B2941C;
    dw Hitboxes_PirateNinja_57                                           ;B2941E;
    dw $0000,$0003                                                       ;B29420;
    dw Spitemaps_PirateNinja_3F                                          ;B29424;
    dw Hitboxes_PirateNinja_53                                           ;B29426;
    dw $0000,$0003                                                       ;B29428;
    dw Spitemaps_PirateNinja_3D                                          ;B2942C;
    dw Hitboxes_PirateNinja_51                                           ;B2942E;

ExtendedSpritemaps_PirateNinja_49:
    dw $0003,$0005,$FFF4                                                 ;B29430;
    dw Spitemaps_PirateNinja_43                                          ;B29436;
    dw Hitboxes_PirateNinja_57                                           ;B29438;
    dw $0000,$0003                                                       ;B2943A;
    dw Spitemaps_PirateNinja_40                                          ;B2943E;
    dw Hitboxes_PirateNinja_54                                           ;B29440;
    dw $0000,$0003                                                       ;B29442;
    dw Spitemaps_PirateNinja_41                                          ;B29446;
    dw Hitboxes_PirateNinja_55                                           ;B29448;

ExtendedSpritemaps_PirateNinja_4A:
    dw $0002,$0000,$0003                                                 ;B2944A;
    dw Spitemaps_PirateNinja_46                                          ;B29450;
    dw Hitboxes_PirateNinja_58                                           ;B29452;
    dw $0000,$0003                                                       ;B29454;
    dw Spitemaps_PirateNinja_41                                          ;B29458;
    dw Hitboxes_PirateNinja_55                                           ;B2945A;

ExtendedSpritemaps_PirateNinja_4B:
    dw $0003,$0005,$FFF5                                                 ;B2945C;
    dw Spitemaps_PirateNinja_44                                          ;B29462;
    dw Hitboxes_PirateNinja_57                                           ;B29464;
    dw $0000,$0003                                                       ;B29466;
    dw Spitemaps_PirateNinja_40                                          ;B2946A;
    dw Hitboxes_PirateNinja_54                                           ;B2946C;
    dw $0000,$0003                                                       ;B2946E;
    dw Spitemaps_PirateNinja_41                                          ;B29472;
    dw Hitboxes_PirateNinja_55                                           ;B29474;

ExtendedSpritemaps_PirateNinja_4C:
    dw $0001,$0000,$0001                                                 ;B29476;
    dw Spitemaps_PirateNinja_3C                                          ;B2947C;
    dw Hitboxes_PirateNinja_50                                           ;B2947E;

UNUSED_ExtendedSpritemaps_SpacePirate_B29480:
    dw $0001,$0000,$0000                                                 ;B29480;
    dw UNUSED_Spitemaps_SpacePirate_B2E9F7                               ;B29486;
    dw UNUSED_Hitboxes_SpacePirate_B2A802                                ;B29488;

UNUSED_ExtendedSpritemaps_SpacePirate_B2948A:
    dw $0001,$0000,$0000                                                 ;B2948A;
    dw UNUSED_Spitemaps_SpacePirate_B2EA0D                               ;B29490;
    dw UNUSED_Hitboxes_SpacePirate_B2A810                                ;B29492;

UNUSED_ExtendedSpritemaps_SpacePirate_B29494:
    dw $0001,$0000,$0000                                                 ;B29494;
    dw UNUSED_Spitemaps_SpacePirate_B2EA2D                               ;B2949A;
    dw UNUSED_Hitboxes_SpacePirate_B2A81E                                ;B2949C;

UNUSED_ExtendedSpritemaps_SpacePirate_B2949E:
    dw $0001,$0000,$0000                                                 ;B2949E;
    dw UNUSED_Spitemaps_SpacePirate_B2EA48                               ;B294A4;
    dw UNUSED_Hitboxes_SpacePirate_B2A82C                                ;B294A6;

UNUSED_ExtendedSpritemaps_SpacePirate_B294A8:
    dw $0001,$0000,$0000                                                 ;B294A8;
    dw UNUSED_Spitemaps_SpacePirate_B2EA6D                               ;B294AE;
    dw UNUSED_Hitboxes_SpacePirate_B2A83A                                ;B294B0;

UNUSED_ExtendedSpritemaps_SpacePirate_B294B2:
    dw $0001,$0000,$0000                                                 ;B294B2;
    dw UNUSED_Spitemaps_SpacePirate_B2EA83                               ;B294B8;
    dw UNUSED_Hitboxes_SpacePirate_B2A848                                ;B294BA;

UNUSED_ExtendedSpritemaps_SpacePirate_B294BC:
    dw $0001,$0000,$0000                                                 ;B294BC;
    dw UNUSED_Spitemaps_SpacePirate_B2EAA3                               ;B294C2;
    dw UNUSED_Hitboxes_SpacePirate_B2A856                                ;B294C4;

UNUSED_ExtendedSpritemaps_SpacePirate_B294C6:
    dw $0001,$0000,$0000                                                 ;B294C6;
    dw UNUSED_Spitemaps_SpacePirate_B2EABE                               ;B294CC;
    dw UNUSED_Hitboxes_SpacePirate_B2A864                                ;B294CE;

UNUSED_ExtendedSpritemaps_SpacePirate_B294D0:
    dw $0001,$0000,$0000                                                 ;B294D0;
    dw UNUSED_Spitemaps_SpacePirate_B2EBD4                               ;B294D6;
    dw UNUSED_Hitboxes_SpacePirate_B2A872                                ;B294D8;

UNUSED_ExtendedSpritemaps_SpacePirate_B294DA:
    dw $0001,$0000,$0000                                                 ;B294DA;
    dw UNUSED_Spitemaps_SpacePirate_B2EBEA                               ;B294E0;
    dw UNUSED_Hitboxes_SpacePirate_B2A880                                ;B294E2;

UNUSED_ExtendedSpritemaps_SpacePirate_B294E4:
    dw $0001,$0000,$0000                                                 ;B294E4;
    dw UNUSED_Spitemaps_SpacePirate_B2EC0A                               ;B294EA;
    dw UNUSED_Hitboxes_SpacePirate_B2A88E                                ;B294EC;

UNUSED_ExtendedSpritemaps_SpacePirate_B294EE:
    dw $0001,$0000,$0000                                                 ;B294EE;
    dw UNUSED_Spitemaps_SpacePirate_B2EC25                               ;B294F4;
    dw UNUSED_Hitboxes_SpacePirate_B2A89C                                ;B294F6;

UNUSED_ExtendedSpritemaps_SpacePirate_B294F8:
    dw $0001,$0000,$0000                                                 ;B294F8;
    dw UNUSED_Spitemaps_SpacePirate_B2EC4A                               ;B294FE;
    dw UNUSED_Hitboxes_SpacePirate_B2A8AA                                ;B29500;

UNUSED_ExtendedSpritemaps_SpacePirate_B29502:
    dw $0001,$0000,$0000                                                 ;B29502;
    dw UNUSED_Spitemaps_SpacePirate_B2EC60                               ;B29508;
    dw UNUSED_Hitboxes_SpacePirate_B2A8B8                                ;B2950A;

UNUSED_ExtendedSpritemaps_SpacePirate_B2950C:
    dw $0001,$0000,$0000                                                 ;B2950C;
    dw UNUSED_Spitemaps_SpacePirate_B2EC80                               ;B29512;
    dw UNUSED_Hitboxes_SpacePirate_B2A8C6                                ;B29514;

UNUSED_ExtendedSpritemaps_SpacePirate_B29516:
    dw $0001,$0000,$0000                                                 ;B29516;
    dw UNUSED_Spitemaps_SpacePirate_B2EC9B                               ;B2951C;
    dw UNUSED_Hitboxes_SpacePirate_B2A8D4                                ;B2951E;

UNUSED_ExtendedSpritemaps_SpacePirate_B29520:
    dw $0002,$FFFB,$0001                                                 ;B29520;
    dw Spitemaps_PirateNinja_47                                          ;B29526;
    dw Hitboxes_PirateNinja_59                                           ;B29528;
    dw $0000,$FFFE                                                       ;B2952A;
    dw UNUSED_Spitemaps_SpacePirate_B2D948                               ;B2952E;
    dw UNUSED_Hitboxes_SpacePirate_B2A448                                ;B29530;

UNUSED_ExtendedSpritemaps_SpacePirate_B29532:
    dw $0002,$FFFB,$0003                                                 ;B29532;
    dw UNUSED_Spitemaps_SpacePirate_B2DB49                               ;B29538;
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6                                ;B2953A;
    dw $FFFF,$0000                                                       ;B2953C;
    dw UNUSED_Spitemaps_SpacePirate_B2D97C                               ;B29540;
    dw UNUSED_Hitboxes_SpacePirate_B2A456                                ;B29542;

UNUSED_ExtendedSpritemaps_SpacePirate_B29544:
    dw $0002,$FFFB,$0004                                                 ;B29544;
    dw UNUSED_Spitemaps_SpacePirate_B2DB78                               ;B2954A;
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4                                ;B2954C;
    dw $0000,$0000                                                       ;B2954E;
    dw UNUSED_Spitemaps_SpacePirate_B2D9BA                               ;B29552;
    dw UNUSED_Hitboxes_SpacePirate_B2A464                                ;B29554;

UNUSED_ExtendedSpritemaps_SpacePirate_B29556:
    dw $0002,$FFFB,$0002                                                 ;B29556;
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2                               ;B2955C;
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2                                ;B2955E;
    dw $FFFF,$0000                                                       ;B29560;
    dw UNUSED_Spitemaps_SpacePirate_B2D9F8                               ;B29564;
    dw UNUSED_Hitboxes_SpacePirate_B2A472                                ;B29566;

UNUSED_ExtendedSpritemaps_SpacePirate_B29568:
    dw $0002,$FFFB,$0001                                                 ;B29568;
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2                               ;B2956E;
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2                                ;B29570;
    dw $0002,$FFFE                                                       ;B29572;
    dw UNUSED_Spitemaps_SpacePirate_B2DA31                               ;B29576;
    dw UNUSED_Hitboxes_SpacePirate_B2A480                                ;B29578;

UNUSED_ExtendedSpritemaps_SpacePirate_B2957A:
    dw $0002,$FFFB,$0003                                                 ;B2957A;
    dw UNUSED_Spitemaps_SpacePirate_B2DB78                               ;B29580;
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4                                ;B29582;
    dw $0002,$0000                                                       ;B29584;
    dw UNUSED_Spitemaps_SpacePirate_B2DA65                               ;B29588;
    dw UNUSED_Hitboxes_SpacePirate_B2A48E                                ;B2958A;

UNUSED_ExtendedSpritemaps_SpacePirate_B2958C:
    dw $0002,$FFFB,$0003                                                 ;B2958C;
    dw UNUSED_Spitemaps_SpacePirate_B2DB49                               ;B29592;
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6                                ;B29594;
    dw $0000,$0000                                                       ;B29596;
    dw UNUSED_Spitemaps_SpacePirate_B2DAA3                               ;B2959A;
    dw UNUSED_Hitboxes_SpacePirate_B2A49C                                ;B2959C;

UNUSED_ExtendedSpritemaps_SpacePirate_B2959E:
    dw $0002,$FFFB,$0001                                                 ;B2959E;
    dw Spitemaps_PirateNinja_47                                          ;B295A4;
    dw Hitboxes_PirateNinja_59                                           ;B295A6;
    dw $0000,$0000                                                       ;B295A8;
    dw UNUSED_Spitemaps_SpacePirate_B2DAE1                               ;B295AC;
    dw UNUSED_Hitboxes_SpacePirate_B2A4AA                                ;B295AE;

UNUSED_ExtendedSpritemaps_SpacePirate_B295B0:
    dw $0002,$0005,$0001                                                 ;B295B0;
    dw Spitemaps_PirateNinja_4D                                          ;B295B6;
    dw Hitboxes_PirateNinja_5F                                           ;B295B8;
    dw $0000,$FFFE                                                       ;B295BA;
    dw UNUSED_Spitemaps_SpacePirate_B2E1A8                               ;B295BE;
    dw UNUSED_Hitboxes_SpacePirate_B2A62C                                ;B295C0;

UNUSED_ExtendedSpritemaps_SpacePirate_B295C2:
    dw $0002,$0005,$0003                                                 ;B295C2;
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9                               ;B295C8;
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA                                ;B295CA;
    dw $0000,$0000                                                       ;B295CC;
    dw UNUSED_Spitemaps_SpacePirate_B2E1DC                               ;B295D0;
    dw UNUSED_Hitboxes_SpacePirate_B2A63A                                ;B295D2;

UNUSED_ExtendedSpritemaps_SpacePirate_B295D4:
    dw $0002,$0005,$0004                                                 ;B295D4;
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8                               ;B295DA;
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8                                ;B295DC;
    dw $0000,$0000                                                       ;B295DE;
    dw UNUSED_Spitemaps_SpacePirate_B2E21A                               ;B295E2;
    dw UNUSED_Hitboxes_SpacePirate_B2A648                                ;B295E4;

UNUSED_ExtendedSpritemaps_SpacePirate_B295E6:
    dw $0002,$0005,$0002                                                 ;B295E6;
    dw UNUSED_Spitemaps_SpacePirate_B2E402                               ;B295EC;
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6                                ;B295EE;
    dw $0000,$0000                                                       ;B295F0;
    dw UNUSED_Spitemaps_SpacePirate_B2E258                               ;B295F4;
    dw UNUSED_Hitboxes_SpacePirate_B2A656                                ;B295F6;

UNUSED_ExtendedSpritemaps_SpacePirate_B295F8:
    dw $0002,$0005,$0001                                                 ;B295F8;
    dw UNUSED_Spitemaps_SpacePirate_B2E402                               ;B295FE;
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6                                ;B29600;
    dw $FFFF,$FFFF                                                       ;B29602;
    dw UNUSED_Spitemaps_SpacePirate_B2E291                               ;B29606;
    dw UNUSED_Hitboxes_SpacePirate_B2A664                                ;B29608;

UNUSED_ExtendedSpritemaps_SpacePirate_B2960A:
    dw $0002,$0005,$0003                                                 ;B2960A;
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8                               ;B29610;
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8                                ;B29612;
    dw $0000,$0000                                                       ;B29614;
    dw UNUSED_Spitemaps_SpacePirate_B2E2C5                               ;B29618;
    dw UNUSED_Hitboxes_SpacePirate_B2A672                                ;B2961A;

UNUSED_ExtendedSpritemaps_SpacePirate_B2961C:
    dw $0002,$0005,$0003                                                 ;B2961C;
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9                               ;B29622;
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA                                ;B29624;
    dw $0001,$0000                                                       ;B29626;
    dw UNUSED_Spitemaps_SpacePirate_B2E303                               ;B2962A;
    dw UNUSED_Hitboxes_SpacePirate_B2A680                                ;B2962C;

UNUSED_ExtendedSpritemaps_SpacePirate_B2962E:
    dw $0002                                                             ;B2962E;
    dw $0005,$0001                                                       ;B29630;
    dw Spitemaps_PirateNinja_4D                                          ;B29634;
    dw Hitboxes_PirateNinja_5F                                           ;B29636;
    dw $0001,$0000                                                       ;B29638;
    dw UNUSED_Spitemaps_SpacePirate_B2E341                               ;B2963C;
    dw UNUSED_Hitboxes_SpacePirate_B2A68E                                ;B2963E;

UNUSED_ExtendedSpritemaps_SpacePirate_B29640:
    dw $0001                                                             ;B29640;
    dw $0000,$0003                                                       ;B29642;
    dw UNUSED_Spitemaps_SpacePirate_B2DC79                               ;B29646;
    dw UNUSED_Hitboxes_SpacePirate_B2A528                                ;B29648;

UNUSED_ExtendedSpritemaps_SpacePirate_B2964A:
    dw $0001,$0000,$0003                                                 ;B2964A;
    dw UNUSED_Spitemaps_SpacePirate_B2DCDF                               ;B29650;
    dw UNUSED_Hitboxes_SpacePirate_B2A536                                ;B29652;

UNUSED_ExtendedSpritemaps_SpacePirate_B29654:
    dw $0001,$0000,$0003                                                 ;B29654;
    dw UNUSED_Spitemaps_SpacePirate_B2DD40                               ;B2965A;
    dw UNUSED_Hitboxes_SpacePirate_B2A544                                ;B2965C;

UNUSED_ExtendedSpritemaps_SpacePirate_B2965E:
    dw $0001,$0000,$0003                                                 ;B2965E;
    dw UNUSED_Spitemaps_SpacePirate_B2E4D9                               ;B29664;
    dw UNUSED_Hitboxes_SpacePirate_B2A70C                                ;B29666;

UNUSED_ExtendedSpritemaps_SpacePirate_B29668:
    dw $0001,$0000,$0003                                                 ;B29668;
    dw UNUSED_Spitemaps_SpacePirate_B2E53F                               ;B2966E;
    dw UNUSED_Hitboxes_SpacePirate_B2A71A                                ;B29670;

UNUSED_ExtendedSpritemaps_SpacePirate_B29672:
    dw $0001,$0000,$0003                                                 ;B29672;
    dw UNUSED_Spitemaps_SpacePirate_B2E5A0                               ;B29678;
    dw UNUSED_Hitboxes_SpacePirate_B2A728                                ;B2967A;

UNUSED_ExtendedSpritemaps_SpacePirate_B2967C:
    dw $0001,$0000,$0008                                                 ;B2967C;
    dw UNUSED_Spitemaps_SpacePirate_B2E03D                               ;B29682;
    dw UNUSED_Hitboxes_SpacePirate_B2A5D0                                ;B29684;

UNUSED_ExtendedSpritemaps_SpacePirate_B29686:
    dw $0001,$0000,$0008                                                 ;B29686;
    dw UNUSED_Spitemaps_SpacePirate_B2E88C                               ;B2968C;
    dw UNUSED_Hitboxes_SpacePirate_B2A7A6                                ;B2968E;

Hitboxes_PirateWall_0:
    dw $0001,$FFEE,$FFED,$0006,$0000                                     ;B29690;
    dw EnemyTouch_SpacePirate                                            ;B2969A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2969C;

Hitboxes_PirateWall_1:
    dw $0001,$FFEE,$FFED,$0006,$0000                                     ;B2969E;
    dw EnemyTouch_SpacePirate                                            ;B296A8;
    dw EnemyShot_SpacePirate_Normal                                      ;B296AA;

Hitboxes_PirateWall_2:
    dw $0001,$FFEE,$FFED,$0006,$0000                                     ;B296AC;
    dw EnemyTouch_SpacePirate                                            ;B296B6;
    dw EnemyShot_SpacePirate_Normal                                      ;B296B8;

Hitboxes_PirateWall_3:
    dw $0001,$FFEE,$FFED,$0006,$0000                                     ;B296BA;
    dw EnemyTouch_SpacePirate                                            ;B296C4;
    dw EnemyShot_SpacePirate_Normal                                      ;B296C6;

Hitboxes_PirateWall_4:
    dw $0001,$FFEE,$FFED,$0006,$0000                                     ;B296C8;
    dw EnemyTouch_SpacePirate                                            ;B296D2;
    dw EnemyShot_SpacePirate_Normal                                      ;B296D4;

Hitboxes_PirateWall_5:
    dw $0001,$FFF2,$0000,$0004,$001E                                     ;B296D6;
    dw EnemyTouch_SpacePirate                                            ;B296E0;
    dw EnemyShot_SpacePirate_Normal                                      ;B296E2;

Hitboxes_PirateWall_6:
    dw $0001,$FFF1,$0000,$FFFF,$001E                                     ;B296E4;
    dw EnemyTouch_SpacePirate                                            ;B296EE;
    dw EnemyShot_SpacePirate_Normal                                      ;B296F0;

Hitboxes_PirateWall_7:
    dw $0001,$FFF1,$FFFA,$0000,$0017                                     ;B296F2;
    dw EnemyTouch_SpacePirate                                            ;B296FC;
    dw EnemyShot_SpacePirate_Normal                                      ;B296FE;

Hitboxes_PirateWall_8:
    dw $0001,$FFF0,$FFFB,$FFFF,$0019                                     ;B29700;
    dw EnemyTouch_SpacePirate                                            ;B2970A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2970C;

Hitboxes_PirateWall_9:
    dw $0001,$FFEF,$FFF8,$0000,$001E                                     ;B2970E;
    dw EnemyTouch_SpacePirate                                            ;B29718;
    dw EnemyShot_SpacePirate_Normal                                      ;B2971A;

Hitboxes_PirateWalking_0:
    dw $0001,$FFF3,$FFED,$000A,$001E                                     ;B2971C;
    dw EnemyTouch_SpacePirate                                            ;B29726;
    dw EnemyShot_SpacePirate_Normal                                      ;B29728;

Hitboxes_PirateWall_A:
    dw $0001,$FFF1,$FFED,$000E,$0006                                     ;B2972A;
    dw EnemyTouch_SpacePirate                                            ;B29734;
    dw EnemyShot_SpacePirate_Normal                                      ;B29736;

Hitboxes_PirateWall_B:
    dw $0001,$FFF0,$FFED,$000E,$0003                                     ;B29738;
    dw EnemyTouch_SpacePirate                                            ;B29742;
    dw EnemyShot_SpacePirate_Normal                                      ;B29744;

Hitboxes_PirateWall_C:
    dw $0001,$FFF6,$FFEB,$0013,$0016                                     ;B29746;
    dw EnemyTouch_SpacePirate                                            ;B29750;
    dw EnemyShot_SpacePirate_Normal                                      ;B29752;

Hitboxes_PirateWall_D:
    dw $0001,$FFF8,$FFED,$0012,$0010                                     ;B29754;
    dw EnemyTouch_SpacePirate                                            ;B2975E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29760;

Hitboxes_PirateWall_E:
    dw $0001,$FFF7,$FFE9,$0011,$0000                                     ;B29762;
    dw EnemyTouch_SpacePirate                                            ;B2976C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2976E;

Hitboxes_PirateWall_F:
    dw $0001,$FFF7,$FFED,$0010,$0000                                     ;B29770;
    dw EnemyTouch_SpacePirate                                            ;B2977A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2977C;

Hitboxes_PirateWall_10:
    dw $0001,$FFF7,$FFED,$0011,$0000                                     ;B2977E;
    dw EnemyTouch_SpacePirate                                            ;B29788;
    dw EnemyShot_SpacePirate_Normal                                      ;B2978A;

Hitboxes_PirateWall_11:
    dw $0001,$FFF7,$FFED,$0010,$0000                                     ;B2978C;
    dw EnemyTouch_SpacePirate                                            ;B29796;
    dw EnemyShot_SpacePirate_Normal                                      ;B29798;

Hitboxes_PirateWall_12:
    dw $0001,$FFF7,$FFED,$0011,$0000                                     ;B2979A;
    dw EnemyTouch_SpacePirate                                            ;B297A4;
    dw EnemyShot_SpacePirate_Normal                                      ;B297A6;

Hitboxes_PirateWall_13:
    dw $0001,$FFF9,$0000,$000F,$001E                                     ;B297A8;
    dw EnemyTouch_SpacePirate                                            ;B297B2;
    dw EnemyShot_SpacePirate_Normal                                      ;B297B4;

Hitboxes_PirateWall_14:
    dw $0001,$FFFE,$0000,$000F,$001E                                     ;B297B6;
    dw EnemyTouch_SpacePirate                                            ;B297C0;
    dw EnemyShot_SpacePirate_Normal                                      ;B297C2;

Hitboxes_PirateWall_15:
    dw $0001,$FFFE,$0000,$000F,$0017                                     ;B297C4;
    dw EnemyTouch_SpacePirate                                            ;B297CE;
    dw EnemyShot_SpacePirate_Normal                                      ;B297D0;

Hitboxes_PirateWall_16:
    dw $0001,$0000,$0000,$000F,$0019                                     ;B297D2;
    dw EnemyTouch_SpacePirate                                            ;B297DC;
    dw EnemyShot_SpacePirate_Normal                                      ;B297DE;

Hitboxes_PirateWall_17:
    dw $0001,$FFFF,$0000,$000F,$001E                                     ;B297E0;
    dw EnemyTouch_SpacePirate                                            ;B297EA;
    dw EnemyShot_SpacePirate_Normal                                      ;B297EC;

Hitboxes_PirateWall_18:
    dw $0001,$FFF1,$FFED,$000F,$0000                                     ;B297EE;
    dw EnemyTouch_SpacePirate                                            ;B297F8;
    dw EnemyShot_SpacePirate_Normal                                      ;B297FA;

Hitboxes_PirateWall_19:
    dw $0001,$FFF1,$FFED,$000E,$0003                                     ;B297FC;
    dw EnemyTouch_SpacePirate                                            ;B29806;
    dw EnemyShot_SpacePirate_Normal                                      ;B29808;

Hitboxes_PirateWall_1A:
    dw $0001,$FFEC,$FFED,$000A,$0019                                     ;B2980A;
    dw EnemyTouch_SpacePirate                                            ;B29814;
    dw EnemyShot_SpacePirate_Normal                                      ;B29816;

Hitboxes_PirateWall_1B:
    dw $0001,$FFEC,$FFED,$0006,$0010                                     ;B29818;
    dw EnemyTouch_SpacePirate                                            ;B29822;
    dw EnemyShot_SpacePirate_Normal                                      ;B29824;

Hitboxes_PirateWalking_1:
    dw $0001,$FFF5,$0000,$0008,$001E                                     ;B29826;
    dw EnemyTouch_SpacePirate                                            ;B29830;
    dw EnemyShot_SpacePirate_Normal                                      ;B29832;

Hitboxes_PirateWalking_2:
    dw $0001,$FFF5,$0000,$0008,$001E                                     ;B29834;
    dw EnemyTouch_SpacePirate                                            ;B2983E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29840;

Hitboxes_PirateWalking_3:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29842;
    dw EnemyTouch_SpacePirate                                            ;B2984C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2984E;

Hitboxes_PirateWalking_4:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29850;
    dw EnemyTouch_SpacePirate                                            ;B2985A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2985C;

Hitboxes_PirateWalking_5:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2985E;
    dw EnemyTouch_SpacePirate                                            ;B29868;
    dw EnemyShot_SpacePirate_Normal                                      ;B2986A;

Hitboxes_PirateWalking_6:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2986C;
    dw EnemyTouch_SpacePirate                                            ;B29876;
    dw EnemyShot_SpacePirate_Normal                                      ;B29878;

Hitboxes_PirateWalking_7:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2987A;
    dw EnemyTouch_SpacePirate                                            ;B29884;
    dw EnemyShot_SpacePirate_Normal                                      ;B29886;

Hitboxes_PirateWalking_8:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29888;
    dw EnemyTouch_SpacePirate                                            ;B29892;
    dw EnemyShot_SpacePirate_Normal                                      ;B29894;

Hitboxes_PirateWalking_9_Ninja_0:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29896;
    dw EnemyTouch_SpacePirate                                            ;B298A0;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B298A2;

Hitboxes_PirateWalking_A_Ninja_1:
    dw $0001,$FFF9,$0000,$0006,$0010                                     ;B298A4;
    dw EnemyTouch_SpacePirate                                            ;B298AE;
    dw EnemyShot_SpacePirate_Normal                                      ;B298B0;

Hitboxes_PirateWalking_A_Ninja_2:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B298B2;
    dw EnemyTouch_SpacePirate                                            ;B298BC;
    dw EnemyShot_SpacePirate_Normal                                      ;B298BE;

Hitboxes_PirateWalking_B_Ninja_3:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B298C0;
    dw EnemyTouch_SpacePirate                                            ;B298CA;
    dw EnemyShot_SpacePirate_Normal                                      ;B298CC;

Hitboxes_PirateWalking_C_Ninja_4:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B298CE;
    dw EnemyTouch_SpacePirate                                            ;B298D8;
    dw EnemyShot_SpacePirate_Normal                                      ;B298DA;

Hitboxes_PirateWalking_D_Ninja_5:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B298DC;
    dw EnemyTouch_SpacePirate                                            ;B298E6;
    dw EnemyShot_SpacePirate_Normal                                      ;B298E8;

Hitboxes_PirateWalking_E_Ninja_6:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B298EA;
    dw EnemyTouch_SpacePirate                                            ;B298F4;
    dw EnemyShot_SpacePirate_Normal                                      ;B298F6;

Hitboxes_PirateWalking_F_Ninja_7:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B298F8;
    dw EnemyTouch_SpacePirate                                            ;B29902;
    dw EnemyShot_SpacePirate_Normal                                      ;B29904;

Hitboxes_PirateWalking_10_Ninja_8:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B29906;
    dw EnemyTouch_SpacePirate                                            ;B29910;
    dw EnemyShot_SpacePirate_Normal                                      ;B29912;

Hitboxes_PirateWalking_11_Ninja_9:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B29914;
    dw EnemyTouch_SpacePirate                                            ;B2991E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29920;

Hitboxes_PirateWalking_12_Ninja_A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29922;
    dw EnemyTouch_SpacePirate                                            ;B2992C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2992E;

Hitboxes_PirateWalking_13:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29930;
    dw EnemyTouch_SpacePirate                                            ;B2993A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2993C;

Hitboxes_PirateWalking_14:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2993E;
    dw EnemyTouch_SpacePirate                                            ;B29948;
    dw EnemyShot_SpacePirate_Normal                                      ;B2994A;

Hitboxes_PirateWalking_15:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2994C;
    dw EnemyTouch_SpacePirate                                            ;B29956;
    dw EnemyShot_SpacePirate_Normal                                      ;B29958;

Hitboxes_PirateWalking_16:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2995A;
    dw EnemyTouch_SpacePirate                                            ;B29964;
    dw EnemyShot_SpacePirate_Normal                                      ;B29966;

Hitboxes_PirateWalking_17:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29968;
    dw EnemyTouch_SpacePirate                                            ;B29972;
    dw EnemyShot_SpacePirate_Normal                                      ;B29974;

Hitboxes_PirateWalking_18:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29976;
    dw EnemyTouch_SpacePirate                                            ;B29980;
    dw EnemyShot_SpacePirate_Normal                                      ;B29982;

Hitboxes_PirateWalking_19:
    dw $0001,$FFF9,$FFFF,$0006,$001E                                     ;B29984;
    dw EnemyTouch_SpacePirate                                            ;B2998E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29990;

Hitboxes_PirateWalking_1A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29992;
    dw EnemyTouch_SpacePirate                                            ;B2999C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2999E;

Hitboxes_PirateWalking_1B:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B299A0;
    dw EnemyTouch_SpacePirate                                            ;B299AA;
    dw EnemyShot_SpacePirate_Normal                                      ;B299AC;

Hitboxes_PirateWalking_1C:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B299AE;
    dw EnemyTouch_SpacePirate                                            ;B299B8;
    dw EnemyShot_SpacePirate_Normal                                      ;B299BA;

Hitboxes_PirateWalking_1D_Ninja_A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B299BC;
    dw EnemyTouch_SpacePirate                                            ;B299C6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B299C8;

Hitboxes_PirateWalking_1E_Ninja_B:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B299CA;
    dw EnemyTouch_SpacePirate                                            ;B299D4;
    dw EnemyShot_SpacePirate_Normal                                      ;B299D6;

Hitboxes_PirateWalking_1F_Ninja_C:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B299D8;
    dw EnemyTouch_SpacePirate                                            ;B299E2;
    dw EnemyShot_SpacePirate_Normal                                      ;B299E4;

Hitboxes_PirateWalking_20_Ninja_D:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B299E6;
    dw EnemyTouch_SpacePirate                                            ;B299F0;
    dw EnemyShot_SpacePirate_Normal                                      ;B299F2;

Hitboxes_PirateWalking_21_Ninja_E:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B299F4;
    dw EnemyTouch_SpacePirate                                            ;B299FE;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A00;

Hitboxes_PirateWalking_22_Ninja_F:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B29A02;
    dw EnemyTouch_SpacePirate                                            ;B29A0C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A0E;

Hitboxes_PirateWalking_23_Ninja_10:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B29A10;
    dw EnemyTouch_SpacePirate                                            ;B29A1A;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A1C;

Hitboxes_PirateWalking_24_Ninja_11:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B29A1E;
    dw EnemyTouch_SpacePirate                                            ;B29A28;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A2A;

Hitboxes_PirateWalking_25_Ninja_12:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B29A2C;
    dw EnemyTouch_SpacePirate                                            ;B29A36;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A38;

Hitboxes_PirateWalking_26_Ninja_13:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29A3A;
    dw EnemyTouch_SpacePirate                                            ;B29A44;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29A46;

Hitboxes_PirateWalking_27:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29A48;
    dw EnemyTouch_SpacePirate                                            ;B29A52;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A54;

Hitboxes_PirateWalking_28:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29A56;
    dw EnemyTouch_SpacePirate                                            ;B29A60;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A62;

Hitboxes_PirateWalking_29:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29A64;
    dw EnemyTouch_SpacePirate                                            ;B29A6E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A70;

Hitboxes_PirateWalking_2A:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29A72;
    dw EnemyTouch_SpacePirate                                            ;B29A7C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A7E;

Hitboxes_PirateWalking_2B:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29A80;
    dw EnemyTouch_SpacePirate                                            ;B29A8A;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A8C;

Hitboxes_PirateWalking_2C:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29A8E;
    dw EnemyTouch_SpacePirate                                            ;B29A98;
    dw EnemyShot_SpacePirate_Normal                                      ;B29A9A;

Hitboxes_PirateWalking_2D:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29A9C;
    dw EnemyTouch_SpacePirate                                            ;B29AA6;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AA8;

Hitboxes_PirateWalking_2E:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29AAA;
    dw EnemyTouch_SpacePirate                                            ;B29AB4;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AB6;

Hitboxes_PirateWalking_2F:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29AB8;
    dw EnemyTouch_SpacePirate                                            ;B29AC2;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AC4;

Hitboxes_PirateWalking_30:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29AC6;
    dw EnemyTouch_SpacePirate                                            ;B29AD0;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AD2;

Hitboxes_PirateWalking_31:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29AD4;
    dw EnemyTouch_SpacePirate                                            ;B29ADE;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AE0;

Hitboxes_PirateWalking_32:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29AE2;
    dw EnemyTouch_SpacePirate                                            ;B29AEC;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AEE;

Hitboxes_PirateNinja_14:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29AF0;
    dw EnemyTouch_SpacePirate                                            ;B29AFA;
    dw EnemyShot_SpacePirate_Normal                                      ;B29AFC;

Hitboxes_PirateNinja_15:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29AFE;
    dw EnemyTouch_SpacePirate                                            ;B29B08;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B0A;

Hitboxes_PirateNinja_16:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29B0C;
    dw EnemyTouch_SpacePirate                                            ;B29B16;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B18;

Hitboxes_PirateNinja_17:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29B1A;
    dw EnemyTouch_SpacePirate                                            ;B29B24;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B26;

Hitboxes_PirateNinja_18:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29B28;
    dw EnemyTouch_SpacePirate                                            ;B29B32;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B34;

Hitboxes_PirateNinja_19:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29B36;
    dw EnemyTouch_SpacePirate                                            ;B29B40;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B42;

Hitboxes_PirateNinja_1A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29B44;
    dw EnemyTouch_SpacePirate                                            ;B29B4E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B50;

Hitboxes_PirateNinja_1B:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29B52;
    dw EnemyTouch_SpacePirate                                            ;B29B5C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B5E;

Hitboxes_PirateWalking_33_Ninja_1C:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29B60;
    dw EnemyTouch_SpacePirate                                            ;B29B6A;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29B6C;

Hitboxes_PirateWalking_34_Ninja_1D:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29B6E;
    dw EnemyTouch_SpacePirate                                            ;B29B78;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29B7A;

Hitboxes_PirateWalking_35_Ninja_1E:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29B7C;
    dw EnemyTouch_SpacePirate                                            ;B29B86;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B88;

Hitboxes_PirateWalking_36_Ninja_1F:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29B8A;
    dw EnemyTouch_SpacePirate                                            ;B29B94;
    dw EnemyShot_SpacePirate_Normal                                      ;B29B96;

Hitboxes_PirateWalking_37_Ninja_20:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29B98;
    dw EnemyTouch_SpacePirate                                            ;B29BA2;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BA4;

Hitboxes_PirateNinja_21:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29BA6;
    dw EnemyTouch_SpacePirate                                            ;B29BB0;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BB2;

Hitboxes_PirateNinja_22:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29BB4;
    dw EnemyTouch_SpacePirate                                            ;B29BBE;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BC0;

Hitboxes_PirateNinja_23:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29BC2;
    dw EnemyTouch_SpacePirate                                            ;B29BCC;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BCE;

Hitboxes_PirateNinja_24:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29BD0;
    dw EnemyTouch_SpacePirate                                            ;B29BDA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BDC;

Hitboxes_PirateNinja_25:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29BDE;
    dw EnemyTouch_SpacePirate                                            ;B29BE8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BEA;

Hitboxes_PirateNinja_26:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29BEC;
    dw EnemyTouch_SpacePirate                                            ;B29BF6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29BF8;

Hitboxes_PirateNinja_27:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29BFA;
    dw EnemyTouch_SpacePirate                                            ;B29C04;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29C06;

UNUSED_Hitboxes_SpacePirate_B29C08:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29C08;
    dw EnemyTouch_SpacePirate                                            ;B29C12;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C14;

UNUSED_Hitboxes_SpacePirate_B29C16:
    dw $0001,$FFF1,$FFED,$000B,$0019                                     ;B29C16;
    dw EnemyTouch_SpacePirate                                            ;B29C20;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C22;

UNUSED_Hitboxes_SpacePirate_B29C24:
    dw $0001,$FFEE,$FFED,$0008,$0018                                     ;B29C24;
    dw EnemyTouch_SpacePirate                                            ;B29C2E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C30;

UNUSED_Hitboxes_SpacePirate_B29C32:
    dw $0001,$FFF1,$FFED,$000B,$0010                                     ;B29C32;
    dw EnemyTouch_SpacePirate                                            ;B29C3C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C3E;

UNUSED_Hitboxes_SpacePirate_B29C40:
    dw $0001,$FFF0,$FFED,$000C,$0010                                     ;B29C40;
    dw EnemyTouch_SpacePirate                                            ;B29C4A;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C4C;

UNUSED_Hitboxes_SpacePirate_B29C4E:
    dw $0001,$FFF0,$FFED,$000B,$0010                                     ;B29C4E;
    dw EnemyTouch_SpacePirate                                            ;B29C58;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C5A;

Hitboxes_PirateNinja_28:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29C5C;
    dw EnemyTouch_SpacePirate                                            ;B29C66;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29C68;

UNUSED_Hitboxes_SpacePirate_B29C6A:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B29C6A;
    dw EnemyTouch_SpacePirate                                            ;B29C74;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C76;

Hitboxes_PirateWalking_38:
    dw $0002,$FFF9,$FFED,$0006,$0017                                     ;B29C78;
    dw EnemyTouch_SpacePirate                                            ;B29C82;
    dw EnemyShot_SpacePirate_Normal                                      ;B29C84;
    dw $FFEE,$FFEE,$FFF9,$0002                                           ;B29C86;
    dw EnemyTouch_SpacePirate                                            ;B29C8E;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29C90;

Hitboxes_PirateNinja_29:
    dw $0002,$FFF9,$FFED,$0006,$0017                                     ;B29C92;
    dw EnemyTouch_SpacePirate                                            ;B29C9C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29C9E;
    dw $FFEE,$FFEE,$FFF9,$0002                                           ;B29CA0;
    dw EnemyTouch_SpacePirate                                            ;B29CA8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29CAA;

UNUSED_Hitboxes_SpacePirate_B29CAC:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29CAC;
    dw EnemyTouch_SpacePirate                                            ;B29CB6;
    dw EnemyShot_SpacePirate_Normal                                      ;B29CB8;

UNUSED_Hitboxes_SpacePirate_B29CBA:
    dw $0002,$FFF9,$FFED,$0006,$001E                                     ;B29CBA;
    dw EnemyTouch_SpacePirate                                            ;B29CC4;
    dw EnemyShot_SpacePirate_Normal                                      ;B29CC6;
    dw $FFDE,$FFFB,$0003,$0003                                           ;B29CC8;
    dw EnemyTouch_SpacePirate                                            ;B29CD0;
    dw EnemyShot_SpacePirate_Normal                                      ;B29CD2;

UNUSED_Hitboxes_SpacePirate_B29CD4:
    dw $0002,$FFF9,$FFED,$0006,$0010                                     ;B29CD4;
    dw EnemyTouch_SpacePirate                                            ;B29CDE;
    dw EnemyShot_SpacePirate_Normal                                      ;B29CE0;
    dw $FFE0,$FFFA,$FFFE,$0004                                           ;B29CE2;
    dw EnemyTouch_SpacePirate                                            ;B29CEA;
    dw EnemyShot_SpacePirate_Normal                                      ;B29CEC;

Hitboxes_PirateNinja_2A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29CEE;
    dw EnemyTouch_SpacePirate                                            ;B29CF8;
    dw EnemyShot_SpacePirate_Normal                                      ;B29CFA;

Hitboxes_PirateNinja_2B:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29CFC;
    dw EnemyTouch_SpacePirate                                            ;B29D06;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D08;

Hitboxes_PirateNinja_2C:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29D0A;
    dw EnemyTouch_SpacePirate                                            ;B29D14;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D16;

Hitboxes_PirateNinja_2D:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29D18;
    dw EnemyTouch_SpacePirate                                            ;B29D22;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D24;

Hitboxes_PirateNinja_2E:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29D26;
    dw EnemyTouch_SpacePirate                                            ;B29D30;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D32;

Hitboxes_PirateNinja_2F:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29D34;
    dw EnemyTouch_SpacePirate                                            ;B29D3E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D40;

Hitboxes_PirateNinja_30:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29D42;
    dw EnemyTouch_SpacePirate                                            ;B29D4C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D4E;

Hitboxes_PirateNinja_31:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B29D50;
    dw EnemyTouch_SpacePirate                                            ;B29D5A;
    dw EnemyShot_SpacePirate_Normal                                      ;B29D5C;

Hitboxes_PirateWalking_39_Ninja_32:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29D5E;
    dw EnemyTouch_SpacePirate                                            ;B29D68;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29D6A;

Hitboxes_PirateNinja_33:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29D6C;
    dw EnemyTouch_SpacePirate                                            ;B29D76;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29D78;

Hitboxes_PirateWalking_3A_Ninja_34:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29D7A;
    dw EnemyTouch_SpacePirate                                            ;B29D84;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29D86;

Hitboxes_PirateWalking_3B_Ninja_35:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29D88;
    dw EnemyTouch_SpacePirate                                            ;B29D92;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29D94;

Hitboxes_PirateWalking_3C_Ninja_36:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29D96;
    dw EnemyTouch_SpacePirate                                            ;B29DA0;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29DA2;

Hitboxes_PirateNinja_37:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29DA4;
    dw EnemyTouch_SpacePirate                                            ;B29DAE;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DB0;

Hitboxes_PirateNinja_38:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29DB2;
    dw EnemyTouch_SpacePirate                                            ;B29DBC;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DBE;

Hitboxes_PirateNinja_39:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29DC0;
    dw EnemyTouch_SpacePirate                                            ;B29DCA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DCC;

Hitboxes_PirateNinja_3A:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29DCE;
    dw EnemyTouch_SpacePirate                                            ;B29DD8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DDA;

Hitboxes_PirateNinja_3B:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29DDC;
    dw EnemyTouch_SpacePirate                                            ;B29DE6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DE8;

Hitboxes_PirateNinja_3C:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29DEA;
    dw EnemyTouch_SpacePirate                                            ;B29DF4;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29DF6;

Hitboxes_PirateNinja_3D:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29DF8;
    dw EnemyTouch_SpacePirate                                            ;B29E02;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29E04;

UNUSED_Hitboxes_SpacePirate_B29E06:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29E06;
    dw EnemyTouch_SpacePirate                                            ;B29E10;
    dw EnemyShot_SpacePirate_Normal                                      ;B29E12;

UNUSED_Hitboxes_SpacePirate_B29E14:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B29E14;
    dw EnemyTouch_SpacePirate                                            ;B29E1E;
    dw EnemyShot_SpacePirate_Normal                                      ;B29E20;

UNUSED_Hitboxes_SpacePirate_B29E22:
    dw $0001,$FFF7,$FFED,$0010,$0014                                     ;B29E22;
    dw EnemyTouch_SpacePirate                                            ;B29E2C;
    dw EnemyShot_SpacePirate_Normal                                      ;B29E2E;

UNUSED_Hitboxes_SpacePirate_B29E30:
    dw $0001,$FFF5,$FFED,$000E,$0010                                     ;B29E30;
    dw EnemyTouch_SpacePirate                                            ;B29E3A;
    dw EnemyShot_SpacePirate_Normal                                      ;B29E3C;

UNUSED_Hitboxes_SpacePirate_B29E3E:
    dw $0001,$FFF5,$FFED,$000F,$0010                                     ;B29E3E;
    dw EnemyTouch_SpacePirate                                            ;B29E48;
    dw EnemyShot_SpacePirate_Normal                                      ;B29E4A;

UNUSED_Hitboxes_SpacePirate_B29E4C:
    dw $0001,$FFF5,$FFED,$000E,$0010                                     ;B29E4C;
    dw EnemyTouch_SpacePirate                                            ;B29E56;
    dw EnemyShot_SpacePirate_Normal                                      ;B29E58;

Hitboxes_PirateNinja_3E:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29E5A;
    dw EnemyTouch_SpacePirate                                            ;B29E64;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29E66;

Hitboxes_PirateWalking_3D:
    dw $0002,$FFF9,$FFED,$0006,$0017                                     ;B29E68;
    dw EnemyTouch_SpacePirate                                            ;B29E72;
    dw EnemyShot_SpacePirate_Normal                                      ;B29E74;
    dw $0006,$FFED,$0011,$0001                                           ;B29E76;
    dw EnemyTouch_SpacePirate                                            ;B29E7E;
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable                       ;B29E80;

Hitboxes_PirateNinja_3F:
    dw $0002,$FFF9,$FFED,$0006,$0017                                     ;B29E82;
    dw EnemyTouch_SpacePirate                                            ;B29E8C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29E8E;
    dw $0006,$FFED,$0011,$0001                                           ;B29E90;
    dw EnemyTouch_SpacePirate                                            ;B29E98;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29E9A;

UNUSED_Hitboxes_SpacePirate_B29E9C:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B29E9C;
    dw EnemyTouch_SpacePirate                                            ;B29EA6;
    dw EnemyShot_SpacePirate_Normal                                      ;B29EA8;

UNUSED_Hitboxes_SpacePirate_B29EAA:
    dw $0002,$FFF9,$FFED,$0006,$001E                                     ;B29EAA;
    dw EnemyTouch_SpacePirate                                            ;B29EB4;
    dw EnemyShot_SpacePirate_Normal                                      ;B29EB6;
    dw $0006,$FFFB,$0020,$0004                                           ;B29EB8;
    dw EnemyTouch_SpacePirate                                            ;B29EC0;
    dw EnemyShot_SpacePirate_Normal                                      ;B29EC2;

UNUSED_Hitboxes_SpacePirate_B29EC4:
    dw $0002,$FFF9,$FFED,$0006,$0010                                     ;B29EC4;
    dw EnemyTouch_SpacePirate                                            ;B29ECE;
    dw EnemyShot_SpacePirate_Normal                                      ;B29ED0;
    dw $0006,$FFFA,$001F,$0004                                           ;B29ED2;
    dw EnemyTouch_SpacePirate                                            ;B29EDA;
    dw EnemyShot_SpacePirate_Normal                                      ;B29EDC;

Hitboxes_PirateNinja_40:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29EDE;
    dw EnemyTouch_SpacePirate                                            ;B29EE8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29EEA;

Hitboxes_PirateNinja_41:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29EEC;
    dw EnemyTouch_SpacePirate                                            ;B29EF6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29EF8;

Hitboxes_PirateNinja_42:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29EFA;
    dw EnemyTouch_SpacePirate                                            ;B29F04;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F06;

Hitboxes_PirateNinja_43:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29F08;
    dw EnemyTouch_SpacePirate                                            ;B29F12;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F14;

Hitboxes_PirateNinja_44:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29F16;
    dw EnemyTouch_SpacePirate                                            ;B29F20;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F22;

Hitboxes_PirateNinja_45:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29F24;
    dw EnemyTouch_SpacePirate                                            ;B29F2E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F30;

Hitboxes_PirateNinja_46:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29F32;
    dw EnemyTouch_SpacePirate                                            ;B29F3C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F3E;

Hitboxes_PirateNinja_47:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29F40;
    dw EnemyTouch_SpacePirate                                            ;B29F4A;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F4C;

UNUSED_Hitboxes_SpacePirate_B29F4E:
    dw $0001,$FFF3,$FFEC,$000C,$0006                                     ;B29F4E;
    dw EnemyTouch_SpacePirate                                            ;B29F58;
    dw EnemyShot_SpacePirate_Normal                                      ;B29F5A;

UNUSED_Hitboxes_SpacePirate_B29F5C:
    dw $0001,$FFF1,$FFEC,$000D,$0006                                     ;B29F5C;
    dw EnemyTouch_SpacePirate                                            ;B29F66;
    dw EnemyShot_SpacePirate_Normal                                      ;B29F68;

UNUSED_Hitboxes_SpacePirate_B29F6A:
    dw $0001,$FFF8,$FFEA,$000C,$0019                                     ;B29F6A;
    dw EnemyTouch_SpacePirate                                            ;B29F74;
    dw EnemyShot_SpacePirate_Normal                                      ;B29F76;

Hitboxes_PirateNinja_48:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29F78;
    dw EnemyTouch_SpacePirate                                            ;B29F82;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F84;

Hitboxes_PirateNinja_49:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29F86;
    dw EnemyTouch_SpacePirate                                            ;B29F90;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29F92;

Hitboxes_PirateNinja_4A:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29F94;
    dw EnemyTouch_SpacePirate                                            ;B29F9E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FA0;

Hitboxes_PirateNinja_4B:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29FA2;
    dw EnemyTouch_SpacePirate                                            ;B29FAC;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FAE;

Hitboxes_PirateNinja_4C:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29FB0;
    dw EnemyTouch_SpacePirate                                            ;B29FBA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FBC;

Hitboxes_PirateNinja_4D:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29FBE;
    dw EnemyTouch_SpacePirate                                            ;B29FC8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FCA;

Hitboxes_PirateNinja_4E:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29FCC;
    dw EnemyTouch_SpacePirate                                            ;B29FD6;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FD8;

Hitboxes_PirateNinja_4F:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B29FDA;
    dw EnemyTouch_SpacePirate                                            ;B29FE4;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B29FE6;

UNUSED_Hitboxes_SpacePirate_B29FE8:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29FE8;
    dw EnemyTouch_SpacePirate                                            ;B29FF2;
    dw EnemyShot_SpacePirate_Normal                                      ;B29FF4;

UNUSED_Hitboxes_SpacePirate_B29FF6:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B29FF6;
    dw EnemyTouch_SpacePirate                                            ;B2A000;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A002;

UNUSED_Hitboxes_SpacePirate_B2A004:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A004;
    dw EnemyTouch_SpacePirate                                            ;B2A00E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A010;

UNUSED_Hitboxes_SpacePirate_B2A012:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A012;
    dw EnemyTouch_SpacePirate                                            ;B2A01C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A01E;

UNUSED_Hitboxes_SpacePirate_B2A020:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A020;
    dw EnemyTouch_SpacePirate                                            ;B2A02A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A02C;

UNUSED_Hitboxes_SpacePirate_B2A02E:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A02E;
    dw EnemyTouch_SpacePirate                                            ;B2A038;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A03A;

UNUSED_Hitboxes_SpacePirate_B2A0C3:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A03C;
    dw EnemyTouch_SpacePirate                                            ;B2A046;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A048;

UNUSED_Hitboxes_SpacePirate_B2A04A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A04A;
    dw EnemyTouch_SpacePirate                                            ;B2A054;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A056;

UNUSED_Hitboxes_SpacePirate_B2A058:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A058;
    dw EnemyTouch_SpacePirate                                            ;B2A062;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A064;

UNUSED_Hitboxes_SpacePirate_B2A066:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A066;
    dw EnemyTouch_SpacePirate                                            ;B2A070;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A072;

Hitboxes_PirateNinja_50:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A074;
    dw EnemyTouch_SpacePirate                                            ;B2A07E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A080;

UNUSED_Hitboxes_SpacePirate_B2A082:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A082;
    dw EnemyTouch_SpacePirate                                            ;B2A08C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A08E;

UNUSED_Hitboxes_SpacePirate_B2A090:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A090;
    dw EnemyTouch_SpacePirate                                            ;B2A09A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A09C;

UNUSED_Hitboxes_SpacePirate_B2A09E:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A09E;
    dw EnemyTouch_SpacePirate                                            ;B2A0A8;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A0AA;

UNUSED_Hitboxes_SpacePirate_B2A0AC:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A0AC;
    dw EnemyTouch_SpacePirate                                            ;B2A0B6;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A0B8;

UNUSED_Hitboxes_SpacePirate_B2A0BA:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A0BA;
    dw EnemyTouch_SpacePirate                                            ;B2A0C4;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A0C6;

UNUSED_Hitboxes_SpacePirate_B2A0C8:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A0C8;
    dw EnemyTouch_SpacePirate                                            ;B2A0D2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A0D4;

UNUSED_Hitboxes_SpacePirate_B2A0D6:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A0D6;
    dw EnemyTouch_SpacePirate                                            ;B2A0E0;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A0E2;

UNUSED_Hitboxes_SpacePirate_B2A0E4:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A0E4;
    dw EnemyTouch_SpacePirate                                            ;B2A0EE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A0F0;

UNUSED_Hitboxes_SpacePirate_B2A0F2:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A0F2;
    dw EnemyTouch_SpacePirate                                            ;B2A0FC;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A0FE;

UNUSED_Hitboxes_SpacePirate_B2A100:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A100;
    dw EnemyTouch_SpacePirate                                            ;B2A10A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A10C;

UNUSED_Hitboxes_SpacePirate_B2A10E:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A10E;
    dw EnemyTouch_SpacePirate                                            ;B2A118;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A11A;

UNUSED_Hitboxes_SpacePirate_B2A11C:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A11C;
    dw EnemyTouch_SpacePirate                                            ;B2A126;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A128;

UNUSED_Hitboxes_SpacePirate_B2A12A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A12A;
    dw EnemyTouch_SpacePirate                                            ;B2A134;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A136;

UNUSED_Hitboxes_SpacePirate_B2A138:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A138;
    dw EnemyTouch_SpacePirate                                            ;B2A142;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A144;

UNUSED_Hitboxes_SpacePirate_B2A146:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A146;
    dw EnemyTouch_SpacePirate                                            ;B2A150;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A152;

UNUSED_Hitboxes_SpacePirate_B2A154:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A154;
    dw EnemyTouch_SpacePirate                                            ;B2A15E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A160;

UNUSED_Hitboxes_SpacePirate_B2A162:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A162;
    dw EnemyTouch_SpacePirate                                            ;B2A16C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A16E;

UNUSED_Hitboxes_SpacePirate_B2A170:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A170;
    dw EnemyTouch_SpacePirate                                            ;B2A17A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A17C;

UNUSED_Hitboxes_SpacePirate_B2A17E:
    dw $0001,$FFF9,$FFFF,$0006,$001E                                     ;B2A17E;
    dw EnemyTouch_SpacePirate                                            ;B2A188;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A18A;

UNUSED_Hitboxes_SpacePirate_B2A18C:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A18C;
    dw EnemyTouch_SpacePirate                                            ;B2A196;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A198;

UNUSED_Hitboxes_SpacePirate_B2A19A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A19A;
    dw EnemyTouch_SpacePirate                                            ;B2A1A4;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A1A6;

UNUSED_Hitboxes_SpacePirate_B2A1A8:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A1A8;
    dw EnemyTouch_SpacePirate                                            ;B2A1B2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A1B4;

UNUSED_Hitboxes_SpacePirate_B2A1B6:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A1B6;
    dw EnemyTouch_SpacePirate                                            ;B2A1C0;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A1C2;

UNUSED_Hitboxes_SpacePirate_B2A1C4:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A1C4;
    dw EnemyTouch_SpacePirate                                            ;B2A1CE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A1D0;

UNUSED_Hitboxes_SpacePirate_B2A1D2:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A1D2;
    dw EnemyTouch_SpacePirate                                            ;B2A1DC;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A1DE;

UNUSED_Hitboxes_SpacePirate_B2A1E0:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A1E0;
    dw EnemyTouch_SpacePirate                                            ;B2A1EA;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A1EC;

Hitboxes_PirateNinja_51:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A1EE;
    dw EnemyTouch_SpacePirate                                            ;B2A1F8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A1FA;

UNUSED_Hitboxes_SpacePirate_B2A1FC:
    dw $0001,$FFF9,$0000,$0006,$0010                                     ;B2A1FC;
    dw EnemyTouch_SpacePirate                                            ;B2A206;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A208;

UNUSED_Hitboxes_SpacePirate_B2A20A:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A20A;
    dw EnemyTouch_SpacePirate                                            ;B2A214;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A216;

UNUSED_Hitboxes_SpacePirate_B2A218:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A218;
    dw EnemyTouch_SpacePirate                                            ;B2A222;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A224;

UNUSED_Hitboxes_SpacePirate_B2A226:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A226;
    dw EnemyTouch_SpacePirate                                            ;B2A230;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A232;

UNUSED_Hitboxes_SpacePirate_B2A234:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A234;
    dw EnemyTouch_SpacePirate                                            ;B2A23E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A240;

UNUSED_Hitboxes_SpacePirate_B2A242:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A242;
    dw EnemyTouch_SpacePirate                                            ;B2A24C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A24E;

UNUSED_Hitboxes_SpacePirate_B2A250:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A250;
    dw EnemyTouch_SpacePirate                                            ;B2A25A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A25C;

UNUSED_Hitboxes_SpacePirate_B2A25E:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A25E;
    dw EnemyTouch_SpacePirate                                            ;B2A268;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A26A;

UNUSED_Hitboxes_SpacePirate_B2A26C:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A26C;
    dw EnemyTouch_SpacePirate                                            ;B2A276;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A278;

Hitboxes_PirateNinja_52:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A27A;
    dw EnemyTouch_SpacePirate                                            ;B2A284;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A286;

Hitboxes_PirateNinja_53:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A288;
    dw EnemyTouch_SpacePirate                                            ;B2A292;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A294;

Hitboxes_PirateNinja_54:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A296;
    dw EnemyTouch_SpacePirate                                            ;B2A2A0;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A2A2;

UNUSED_Hitboxes_SpacePirate_B2A2A4:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A2A4;
    dw EnemyTouch_SpacePirate                                            ;B2A2AE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A2B0;

UNUSED_Hitboxes_SpacePirate_B2A2B2:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A2B2;
    dw EnemyTouch_SpacePirate                                            ;B2A2BC;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A2BE;

UNUSED_Hitboxes_SpacePirate_B2A2C0:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A2C0;
    dw EnemyTouch_SpacePirate                                            ;B2A2CA;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A2CC;

UNUSED_Hitboxes_SpacePirate_B2A2CE:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A2CE;
    dw EnemyTouch_SpacePirate                                            ;B2A2D8;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A2DA;

UNUSED_Hitboxes_SpacePirate_B2A2DC:
    dw $0001,$FFF9,$FFFF,$0006,$001E                                     ;B2A2DC;
    dw EnemyTouch_SpacePirate                                            ;B2A2E6;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A2E8;

UNUSED_Hitboxes_SpacePirate_B2A2EA:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A2EA;
    dw EnemyTouch_SpacePirate                                            ;B2A2F4;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A2F6;

UNUSED_Hitboxes_SpacePirate_B2A2F8:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A2F8;
    dw EnemyTouch_SpacePirate                                            ;B2A302;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A304;

UNUSED_Hitboxes_SpacePirate_B2A306:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A306;
    dw EnemyTouch_SpacePirate                                            ;B2A310;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A312;

Hitboxes_PirateNinja_55:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A314;
    dw EnemyTouch_SpacePirate                                            ;B2A31E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A320;

UNUSED_Hitboxes_SpacePirate_B2A322:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A322;
    dw EnemyTouch_SpacePirate                                            ;B2A32C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A32E;

UNUSED_Hitboxes_SpacePirate_B2A330:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A330;
    dw EnemyTouch_SpacePirate                                            ;B2A33A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A33C;

UNUSED_Hitboxes_SpacePirate_B2A33E:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A33E;
    dw EnemyTouch_SpacePirate                                            ;B2A348;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A34A;

UNUSED_Hitboxes_SpacePirate_B2A34C:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A34C;
    dw EnemyTouch_SpacePirate                                            ;B2A356;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A358;

UNUSED_Hitboxes_SpacePirate_B2A35A:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A35A;
    dw EnemyTouch_SpacePirate                                            ;B2A364;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A366;

UNUSED_Hitboxes_SpacePirate_B2A368:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A368;
    dw EnemyTouch_SpacePirate                                            ;B2A372;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A374;

UNUSED_Hitboxes_SpacePirate_B2A376:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A376;
    dw EnemyTouch_SpacePirate                                            ;B2A380;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A382;

UNUSED_Hitboxes_SpacePirate_B2A384:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A384;
    dw EnemyTouch_SpacePirate                                            ;B2A38E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A390;

Hitboxes_PirateNinja_56:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A392;
    dw EnemyTouch_SpacePirate                                            ;B2A39C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A39E;

Hitboxes_PirateNinja_57:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A3A0;
    dw EnemyTouch_SpacePirate                                            ;B2A3AA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A3AC;

UNUSED_Hitboxes_SpacePirate_B2A3AE:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A3AE;
    dw EnemyTouch_SpacePirate                                            ;B2A3B8;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A3BA;

UNUSED_Hitboxes_SpacePirate_B2A3BC:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A3BC;
    dw EnemyTouch_SpacePirate                                            ;B2A3C6;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A3C8;

UNUSED_Hitboxes_SpacePirate_B2A3CA:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A3CA;
    dw EnemyTouch_SpacePirate                                            ;B2A3D4;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A3D6;

UNUSED_Hitboxes_SpacePirate_B2A3D8:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A3D8;
    dw EnemyTouch_SpacePirate                                            ;B2A3E2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A3E4;

UNUSED_Hitboxes_SpacePirate_B2A3E6:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A3E6;
    dw EnemyTouch_SpacePirate                                            ;B2A3F0;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A3F2;

Hitboxes_PirateNinja_58:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A3F4;
    dw EnemyTouch_SpacePirate                                            ;B2A3FE;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A400;

UNUSED_Hitboxes_SpacePirate_B2A402:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A402;
    dw EnemyTouch_SpacePirate                                            ;B2A40C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A40E;

UNUSED_Hitboxes_SpacePirate_B2A410:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A410;
    dw EnemyTouch_SpacePirate                                            ;B2A41A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A41C;

UNUSED_Hitboxes_SpacePirate_B2A41E:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A41E;
    dw EnemyTouch_SpacePirate                                            ;B2A428;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A42A;

UNUSED_Hitboxes_SpacePirate_B2A42C:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A42C;
    dw EnemyTouch_SpacePirate                                            ;B2A436;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A438;

UNUSED_Hitboxes_SpacePirate_B2A43A:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A43A;
    dw EnemyTouch_SpacePirate                                            ;B2A444;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A446;

UNUSED_Hitboxes_SpacePirate_B2A448:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A448;
    dw EnemyTouch_SpacePirate                                            ;B2A452;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A454;

UNUSED_Hitboxes_SpacePirate_B2A456:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A456;
    dw EnemyTouch_SpacePirate                                            ;B2A460;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A462;

UNUSED_Hitboxes_SpacePirate_B2A464:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A464;
    dw EnemyTouch_SpacePirate                                            ;B2A46E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A470;

UNUSED_Hitboxes_SpacePirate_B2A472:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A472;
    dw EnemyTouch_SpacePirate                                            ;B2A47C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A47E;

UNUSED_Hitboxes_SpacePirate_B2A480:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A480;
    dw EnemyTouch_SpacePirate                                            ;B2A48A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A48C;

UNUSED_Hitboxes_SpacePirate_B2A48E:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A48E;
    dw EnemyTouch_SpacePirate                                            ;B2A498;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A49A;

UNUSED_Hitboxes_SpacePirate_B2A49C:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A49C;
    dw EnemyTouch_SpacePirate                                            ;B2A4A6;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A4A8;

UNUSED_Hitboxes_SpacePirate_B2A4AA:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A4AA;
    dw EnemyTouch_SpacePirate                                            ;B2A4B4;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A4B6;

Hitboxes_PirateNinja_59:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A4B8;
    dw EnemyTouch_SpacePirate                                            ;B2A4C2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A4C4;

UNUSED_Hitboxes_SpacePirate_B2A4C6:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A4C6;
    dw EnemyTouch_SpacePirate                                            ;B2A4D0;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A4D2;

UNUSED_Hitboxes_SpacePirate_B2A4D4:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A4D4;
    dw EnemyTouch_SpacePirate                                            ;B2A4DE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A4E0;

UNUSED_Hitboxes_SpacePirate_B2A4E2:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A4E2;
    dw EnemyTouch_SpacePirate                                            ;B2A4EC;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A4EE;

UNUSED_Hitboxes_SpacePirate_B2A4F0:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A4F0;
    dw EnemyTouch_SpacePirate                                            ;B2A4FA;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A4FC;

UNUSED_Hitboxes_SpacePirate_B2A4FE:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A4FE;
    dw EnemyTouch_SpacePirate                                            ;B2A508;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A50A;

UNUSED_Hitboxes_SpacePirate_B2A50C:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A50C;
    dw EnemyTouch_SpacePirate                                            ;B2A516;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A518;

UNUSED_Hitboxes_SpacePirate_B2A51A:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A51A;
    dw EnemyTouch_SpacePirate                                            ;B2A524;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A526;

UNUSED_Hitboxes_SpacePirate_B2A528:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A528;
    dw EnemyTouch_SpacePirate                                            ;B2A532;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A534;

UNUSED_Hitboxes_SpacePirate_B2A536:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A536;
    dw EnemyTouch_SpacePirate                                            ;B2A540;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A542;

UNUSED_Hitboxes_SpacePirate_B2A544:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A544;
    dw EnemyTouch_SpacePirate                                            ;B2A54E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A550;

UNUSED_Hitboxes_SpacePirate_B2A552:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A552;
    dw EnemyTouch_SpacePirate                                            ;B2A55C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A55E;

Hitboxes_PirateNinja_5A:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A560;
    dw EnemyTouch_SpacePirate                                            ;B2A56A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A56C;

Hitboxes_PirateNinja_5B:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A56E;
    dw EnemyTouch_SpacePirate                                            ;B2A578;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A57A;

UNUSED_Hitboxes_SpacePirate_B2A57C:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A57C;
    dw EnemyTouch_SpacePirate                                            ;B2A586;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A588;

UNUSED_Hitboxes_SpacePirate_B2A58A:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A58A;
    dw EnemyTouch_SpacePirate                                            ;B2A594;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A596;

UNUSED_Hitboxes_SpacePirate_B2A598:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A598;
    dw EnemyTouch_SpacePirate                                            ;B2A5A2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A5A4;

UNUSED_Hitboxes_SpacePirate_B2A5A6:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A5A6;
    dw EnemyTouch_SpacePirate                                            ;B2A5B0;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A5B2;

UNUSED_Hitboxes_SpacePirate_B2A5B4:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A5B4;
    dw EnemyTouch_SpacePirate                                            ;B2A5BE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A5C0;

UNUSED_Hitboxes_SpacePirate_B2A5C2:
    dw $0001,$FFF9,$FFF7,$0006,$0006                                     ;B2A5C2;
    dw EnemyTouch_SpacePirate                                            ;B2A5CC;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A5CE;

UNUSED_Hitboxes_SpacePirate_B2A5D0:
    dw $0002,$FFF9,$FFED,$0006,$0017                                     ;B2A5D0;
    dw EnemyTouch_SpacePirate                                            ;B2A5DA;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A5DC;
    dw $FFEE,$FFEE,$FFF9,$0002                                           ;B2A5DE;
    dw EnemyTouch_SpacePirate                                            ;B2A5E6;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A5E8;

Hitboxes_PirateNinja_5C:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A5EA;
    dw EnemyTouch_SpacePirate                                            ;B2A5F4;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A5F6;

Hitboxes_PirateNinja_5D:
    dw $0002,$FFF9,$FFED,$0006,$001E                                     ;B2A5F8;
    dw EnemyTouch_SpacePirate                                            ;B2A602;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A604;
    dw $FFDE,$FFFB,$0003,$001E                                           ;B2A606;
    dw EnemyTouch_SpacePirate                                            ;B2A60E;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A610;

Hitboxes_PirateNinja_5E:
    dw $0002,$FFF9,$FFED,$0006,$0010                                     ;B2A612;
    dw EnemyTouch_SpacePirate                                            ;B2A61C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A61E;
    dw $FFDF,$0003,$FFF9,$0010                                           ;B2A620;
    dw EnemyTouch_SpacePirate                                            ;B2A628;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A62A;

UNUSED_Hitboxes_SpacePirate_B2A62C:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A62C;
    dw EnemyTouch_SpacePirate                                            ;B2A636;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A638;

UNUSED_Hitboxes_SpacePirate_B2A63A:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A63A;
    dw EnemyTouch_SpacePirate                                            ;B2A644;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A646;

UNUSED_Hitboxes_SpacePirate_B2A648:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A648;
    dw EnemyTouch_SpacePirate                                            ;B2A652;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A654;

UNUSED_Hitboxes_SpacePirate_B2A656:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A656;
    dw EnemyTouch_SpacePirate                                            ;B2A660;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A662;

UNUSED_Hitboxes_SpacePirate_B2A664:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A664;
    dw EnemyTouch_SpacePirate                                            ;B2A66E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A670;

UNUSED_Hitboxes_SpacePirate_B2A672:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A672;
    dw EnemyTouch_SpacePirate                                            ;B2A67C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A67E;

UNUSED_Hitboxes_SpacePirate_B2A680:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A680;
    dw EnemyTouch_SpacePirate                                            ;B2A68A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A68C;

UNUSED_Hitboxes_SpacePirate_B2A68E:
    dw $0001,$FFF9,$0000,$0006,$001E                                     ;B2A68E;
    dw EnemyTouch_SpacePirate                                            ;B2A698;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A69A;

Hitboxes_PirateNinja_5F:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A69C;
    dw EnemyTouch_SpacePirate                                            ;B2A6A6;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A6A8;

UNUSED_Hitboxes_SpacePirate_B2A6AA:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A6AA;
    dw EnemyTouch_SpacePirate                                            ;B2A6B4;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A6B6;

UNUSED_Hitboxes_SpacePirate_B2A6B8:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A6B8;
    dw EnemyTouch_SpacePirate                                            ;B2A6C2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A6C4;

UNUSED_Hitboxes_SpacePirate_B2A6C6:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A6C6;
    dw EnemyTouch_SpacePirate                                            ;B2A6D0;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A6D2;

UNUSED_Hitboxes_SpacePirate_B2A6D4:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A6D4;
    dw EnemyTouch_SpacePirate                                            ;B2A6DE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A6E0;

UNUSED_Hitboxes_SpacePirate_B2A6E2:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A6E2;
    dw EnemyTouch_SpacePirate                                            ;B2A6EC;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A6EE;

UNUSED_Hitboxes_SpacePirate_B2A6F0:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A6F0;
    dw EnemyTouch_SpacePirate                                            ;B2A6FA;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A6FC;

UNUSED_Hitboxes_SpacePirate_B2A6FE:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A6FE;
    dw EnemyTouch_SpacePirate                                            ;B2A708;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A70A;

UNUSED_Hitboxes_SpacePirate_B2A70C:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A70C;
    dw EnemyTouch_SpacePirate                                            ;B2A716;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A718;

UNUSED_Hitboxes_SpacePirate_B2A71A:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A71A;
    dw EnemyTouch_SpacePirate                                            ;B2A724;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A726;

UNUSED_Hitboxes_SpacePirate_B2A728:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A728;
    dw EnemyTouch_SpacePirate                                            ;B2A732;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A734;

UNUSED_Hitboxes_SpacePirate_B2A736:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A736;
    dw EnemyTouch_SpacePirate                                            ;B2A740;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A742;

Hitboxes_PirateNinja_60:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A744;
    dw EnemyTouch_SpacePirate                                            ;B2A74E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A750;

Hitboxes_PirateNinja_61:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A752;
    dw EnemyTouch_SpacePirate                                            ;B2A75C;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A75E;

UNUSED_Hitboxes_SpacePirate_B2A760:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A760;
    dw EnemyTouch_SpacePirate                                            ;B2A76A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A76C;

UNUSED_Hitboxes_SpacePirate_B2A76E:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A76E;
    dw EnemyTouch_SpacePirate                                            ;B2A778;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A77A;

UNUSED_Hitboxes_SpacePirate_B2A77C:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A77C;
    dw EnemyTouch_SpacePirate                                            ;B2A786;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A788;

UNUSED_Hitboxes_SpacePirate_B2A78A:
    dw $0001,$FFF9,$FFED,$0006,$0010                                     ;B2A78A;
    dw EnemyTouch_SpacePirate                                            ;B2A794;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A796;

UNUSED_Hitboxes_SpacePirate_B2A798:
    dw $0001,$FFF9,$FFED,$0006,$0000                                     ;B2A798;
    dw EnemyTouch_SpacePirate                                            ;B2A7A2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A7A4;

UNUSED_Hitboxes_SpacePirate_B2A7A6:
    dw $0002,$FFF9,$FFED,$0006,$0017                                     ;B2A7A6;
    dw EnemyTouch_SpacePirate                                            ;B2A7B0;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A7B2;
    dw $0006,$FFED,$0011,$0001                                           ;B2A7B4;
    dw EnemyTouch_SpacePirate                                            ;B2A7BC;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A7BE;

Hitboxes_PirateNinja_62:
    dw $0001,$FFF9,$FFED,$0006,$001E                                     ;B2A7C0;
    dw EnemyTouch_SpacePirate                                            ;B2A7CA;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A7CC;

Hitboxes_PirateNinja_63:
    dw $0002,$FFF9,$FFED,$0006,$001E                                     ;B2A7CE;
    dw EnemyTouch_SpacePirate                                            ;B2A7D8;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A7DA;
    dw $0006,$FFFA,$0020,$001E                                           ;B2A7DC;
    dw EnemyTouch_SpacePirate                                            ;B2A7E4;
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible                       ;B2A7E6;

Hitboxes_PirateNinja_64:
    dw $0002,$FFF9,$FFED,$0006,$0010                                     ;B2A7E8;
    dw EnemyTouch_SpacePirate                                            ;B2A7F2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A7F4;
    dw $0006,$0003,$001F,$0010                                           ;B2A7F6;
    dw EnemyTouch_SpacePirate                                            ;B2A7FE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A800;

UNUSED_Hitboxes_SpacePirate_B2A802:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A802;
    dw EnemyTouch_SpacePirate                                            ;B2A80C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A80E;

UNUSED_Hitboxes_SpacePirate_B2A810:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A810;
    dw EnemyTouch_SpacePirate                                            ;B2A81A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A81C;

UNUSED_Hitboxes_SpacePirate_B2A81E:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A81E;
    dw EnemyTouch_SpacePirate                                            ;B2A828;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A82A;

UNUSED_Hitboxes_SpacePirate_B2A82C:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A82C;
    dw EnemyTouch_SpacePirate                                            ;B2A836;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A838;

UNUSED_Hitboxes_SpacePirate_B2A83A:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A83A;
    dw EnemyTouch_SpacePirate                                            ;B2A844;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A846;

UNUSED_Hitboxes_SpacePirate_B2A848:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A848;
    dw EnemyTouch_SpacePirate                                            ;B2A852;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A854;

UNUSED_Hitboxes_SpacePirate_B2A856:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A856;
    dw EnemyTouch_SpacePirate                                            ;B2A860;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A862;

UNUSED_Hitboxes_SpacePirate_B2A864:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A864;
    dw EnemyTouch_SpacePirate                                            ;B2A86E;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A870;

UNUSED_Hitboxes_SpacePirate_B2A872:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A872;
    dw EnemyTouch_SpacePirate                                            ;B2A87C;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A87E;

UNUSED_Hitboxes_SpacePirate_B2A880:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A880;
    dw EnemyTouch_SpacePirate                                            ;B2A88A;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A88C;

UNUSED_Hitboxes_SpacePirate_B2A88E:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A88E;
    dw EnemyTouch_SpacePirate                                            ;B2A898;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A89A;

UNUSED_Hitboxes_SpacePirate_B2A89C:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A89C;
    dw EnemyTouch_SpacePirate                                            ;B2A8A6;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A8A8;

UNUSED_Hitboxes_SpacePirate_B2A8AA:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A8AA;
    dw EnemyTouch_SpacePirate                                            ;B2A8B4;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A8B6;

UNUSED_Hitboxes_SpacePirate_B2A8B8:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A8B8;
    dw EnemyTouch_SpacePirate                                            ;B2A8C2;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A8C4;

UNUSED_Hitboxes_SpacePirate_B2A8C6:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A8C6;
    dw EnemyTouch_SpacePirate                                            ;B2A8D0;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A8D2;

UNUSED_Hitboxes_SpacePirate_B2A8D4:
    dw $0001,$FFF5,$FFF3,$000A,$000A                                     ;B2A8D4;
    dw EnemyTouch_SpacePirate                                            ;B2A8DE;
    dw EnemyShot_SpacePirate_Normal                                      ;B2A8E0;

Spitemaps_PirateWall_0:
    dw $0008,$01EF                                                       ;B2A8E2;
    db $FD                                                               ;B2A8E6;
    dw $214D,$01EF                                                       ;B2A8E7;
    db $F5                                                               ;B2A8EB;
    dw $213D,$01EF                                                       ;B2A8EC;
    db $ED                                                               ;B2A8F0;
    dw $212D,$81F4                                                       ;B2A8F1;
    db $F3                                                               ;B2A8F5;
    dw $2100,$81F8                                                       ;B2A8F6;
    db $F0                                                               ;B2A8FA;
    dw $212E,$81F1                                                       ;B2A8FB;
    db $EA                                                               ;B2A8FF;
    dw $210E,$01EF                                                       ;B2A900;
    db $E6                                                               ;B2A904;
    dw $213D,$01EF                                                       ;B2A905;
    db $DE                                                               ;B2A909;
    dw $212D                                                             ;B2A90A;

Spitemaps_PirateWall_1:
    dw $0009,$01FC                                                       ;B2A90C;
    db $F3                                                               ;B2A910;
    dw $214F,$01F4                                                       ;B2A911;
    db $F4                                                               ;B2A915;
    dw $214E,$01EF                                                       ;B2A916;
    db $F9                                                               ;B2A91A;
    dw $214D,$01EF                                                       ;B2A91B;
    db $F1                                                               ;B2A91F;
    dw $213D,$01EF                                                       ;B2A920;
    db $E9                                                               ;B2A924;
    dw $212D,$81F8                                                       ;B2A925;
    db $F0                                                               ;B2A929;
    dw $212E,$81F1                                                       ;B2A92A;
    db $EA                                                               ;B2A92E;
    dw $210E,$01EF                                                       ;B2A92F;
    db $EA                                                               ;B2A933;
    dw $213D,$01EF                                                       ;B2A934;
    db $E2                                                               ;B2A938;
    dw $212D                                                             ;B2A939;

Spitemaps_PirateWall_2:
    dw $0008,$01EF                                                       ;B2A93B;
    db $F3                                                               ;B2A93F;
    dw $214D,$01EF                                                       ;B2A940;
    db $EB                                                               ;B2A944;
    dw $213D,$01EF                                                       ;B2A945;
    db $E3                                                               ;B2A949;
    dw $212D,$01FB                                                       ;B2A94A;
    db $F3                                                               ;B2A94E;
    dw $214F,$01F3                                                       ;B2A94F;
    db $F3                                                               ;B2A953;
    dw $214E,$81F8                                                       ;B2A954;
    db $F0                                                               ;B2A958;
    dw $212E,$81F1                                                       ;B2A959;
    db $EA                                                               ;B2A95D;
    dw $210E,$01EF                                                       ;B2A95E;
    db $E1                                                               ;B2A962;
    dw $212D                                                             ;B2A963;

Spitemaps_PirateWall_3:
    dw $000A,$01FB                                                       ;B2A965;
    db $F1                                                               ;B2A969;
    dw $214F,$01F3                                                       ;B2A96A;
    db $F0                                                               ;B2A96E;
    dw $214E,$01EF                                                       ;B2A96F;
    db $ED                                                               ;B2A973;
    dw $214D,$01EF                                                       ;B2A974;
    db $E5                                                               ;B2A978;
    dw $213D,$01EF                                                       ;B2A979;
    db $DD                                                               ;B2A97D;
    dw $212D,$81F8                                                       ;B2A97E;
    db $F0                                                               ;B2A982;
    dw $212E,$81F1                                                       ;B2A983;
    db $EA                                                               ;B2A987;
    dw $210E,$01EF                                                       ;B2A988;
    db $EF                                                               ;B2A98C;
    dw $213D,$01EF                                                       ;B2A98D;
    db $F7                                                               ;B2A991;
    dw $214D,$81F1                                                       ;B2A992;
    db $F0                                                               ;B2A996;
    dw $2100                                                             ;B2A997;

Spitemaps_PirateWall_4:
    dw $0009,$81F4                                                       ;B2A999;
    db $EB                                                               ;B2A99D;
    dw $E105,$01EF                                                       ;B2A99E;
    db $EB                                                               ;B2A9A2;
    dw $214D,$01EF                                                       ;B2A9A3;
    db $E3                                                               ;B2A9A7;
    dw $213D,$01EF                                                       ;B2A9A8;
    db $DB                                                               ;B2A9AC;
    dw $212D,$81F8                                                       ;B2A9AD;
    db $F0                                                               ;B2A9B1;
    dw $212E,$81F1                                                       ;B2A9B2;
    db $EA                                                               ;B2A9B6;
    dw $210E,$01EF                                                       ;B2A9B7;
    db $F1                                                               ;B2A9BB;
    dw $213D,$01EF                                                       ;B2A9BC;
    db $F9                                                               ;B2A9C0;
    dw $214D,$81F1                                                       ;B2A9C1;
    db $F2                                                               ;B2A9C5;
    dw $2100                                                             ;B2A9C6;

Spitemaps_PirateWall_5:
    dw $000A,$01F4                                                       ;B2A9C8;
    db $19                                                               ;B2A9CC;
    dw $2146,$01F7                                                       ;B2A9CD;
    db $13                                                               ;B2A9D1;
    dw $2119,$01F7                                                       ;B2A9D2;
    db $0B                                                               ;B2A9D6;
    dw $2109,$81F9                                                       ;B2A9D7;
    db $FE                                                               ;B2A9DB;
    dw $2107,$01EC                                                       ;B2A9DC;
    db $19                                                               ;B2A9E0;
    dw $2145,$01F5                                                       ;B2A9E1;
    db $FE                                                               ;B2A9E5;
    dw $2131,$01F5                                                       ;B2A9E6;
    db $F6                                                               ;B2A9EA;
    dw $2121,$81F6                                                       ;B2A9EB;
    db $F5                                                               ;B2A9EF;
    dw $E10C,$01F4                                                       ;B2A9F0;
    db $05                                                               ;B2A9F4;
    dw $2146,$01EC                                                       ;B2A9F5;
    db $05                                                               ;B2A9F9;
    dw $2145                                                             ;B2A9FA;

Spitemaps_PirateWall_6:
    dw $000C,$0000                                                       ;B2A9FC;
    db $FD                                                               ;B2AA00;
    dw $2149,$01F8                                                       ;B2AA01;
    db $FF                                                               ;B2AA05;
    dw $2148,$01F4                                                       ;B2AA06;
    db $14                                                               ;B2AA0A;
    dw $2146,$01EC                                                       ;B2AA0B;
    db $14                                                               ;B2AA0F;
    dw $2145,$0000                                                       ;B2AA10;
    db $FB                                                               ;B2AA14;
    dw $2149,$01F8                                                       ;B2AA15;
    db $F9                                                               ;B2AA19;
    dw $2148,$01F5                                                       ;B2AA1A;
    db $0D                                                               ;B2AA1E;
    dw $211A,$01F5                                                       ;B2AA1F;
    db $05                                                               ;B2AA23;
    dw $210A,$01F5                                                       ;B2AA24;
    db $02                                                               ;B2AA28;
    dw $2131,$01F5                                                       ;B2AA29;
    db $FA                                                               ;B2AA2D;
    dw $2121,$01F4                                                       ;B2AA2E;
    db $09                                                               ;B2AA32;
    dw $2146,$01EC                                                       ;B2AA33;
    db $09                                                               ;B2AA37;
    dw $2145                                                             ;B2AA38;

Spitemaps_PirateWall_7:
    dw $000C,$0000                                                       ;B2AA3A;
    db $F9                                                               ;B2AA3E;
    dw $2149,$01F8                                                       ;B2AA3F;
    db $FB                                                               ;B2AA43;
    dw $2148,$01F4                                                       ;B2AA44;
    db $10                                                               ;B2AA48;
    dw $2146,$01EC                                                       ;B2AA49;
    db $10                                                               ;B2AA4D;
    dw $2145,$0000                                                       ;B2AA4E;
    db $FB                                                               ;B2AA52;
    dw $2149,$01F8                                                       ;B2AA53;
    db $F9                                                               ;B2AA57;
    dw $2148,$01F5                                                       ;B2AA58;
    db $09                                                               ;B2AA5C;
    dw $211A,$01F5                                                       ;B2AA5D;
    db $01                                                               ;B2AA61;
    dw $210A,$01F5                                                       ;B2AA62;
    db $06                                                               ;B2AA66;
    dw $2131,$01F5                                                       ;B2AA67;
    db $FE                                                               ;B2AA6B;
    dw $2121,$01F4                                                       ;B2AA6C;
    db $0D                                                               ;B2AA70;
    dw $2146,$01EC                                                       ;B2AA71;
    db $0D                                                               ;B2AA75;
    dw $2145                                                             ;B2AA76;

Spitemaps_PirateWall_8:
    dw $000C,$01F3                                                       ;B2AA78;
    db $03                                                               ;B2AA7C;
    dw $2131,$01F3                                                       ;B2AA7D;
    db $FB                                                               ;B2AA81;
    dw $2121,$01F4                                                       ;B2AA82;
    db $0A                                                               ;B2AA86;
    dw $2146,$01EC                                                       ;B2AA87;
    db $0A                                                               ;B2AA8B;
    dw $2145,$0000                                                       ;B2AA8C;
    db $FC                                                               ;B2AA90;
    dw $2149,$01F8                                                       ;B2AA91;
    db $FA                                                               ;B2AA95;
    dw $2148,$0000                                                       ;B2AA96;
    db $FE                                                               ;B2AA9A;
    dw $2149,$01F8                                                       ;B2AA9B;
    db $00                                                               ;B2AA9F;
    dw $2148,$01F4                                                       ;B2AAA0;
    db $12                                                               ;B2AAA4;
    dw $2146,$01EC                                                       ;B2AAA5;
    db $12                                                               ;B2AAA9;
    dw $2145,$01F5                                                       ;B2AAAA;
    db $0C                                                               ;B2AAAE;
    dw $211A,$01F5                                                       ;B2AAAF;
    db $04                                                               ;B2AAB3;
    dw $210A                                                             ;B2AAB4;

Spitemaps_PirateWall_9:
    dw $000A,$01F5                                                       ;B2AAB6;
    db $00                                                               ;B2AABA;
    dw $2131,$01F5                                                       ;B2AABB;
    db $F8                                                               ;B2AABF;
    dw $2121,$81F7                                                       ;B2AAC0;
    db $F6                                                               ;B2AAC4;
    dw $E10C,$01F4                                                       ;B2AAC5;
    db $07                                                               ;B2AAC9;
    dw $2146,$01EC                                                       ;B2AACA;
    db $07                                                               ;B2AACE;
    dw $2145,$01F4                                                       ;B2AACF;
    db $16                                                               ;B2AAD3;
    dw $2146,$01F6                                                       ;B2AAD4;
    db $10                                                               ;B2AAD8;
    dw $2119,$01F6                                                       ;B2AAD9;
    db $08                                                               ;B2AADD;
    dw $2109,$81F8                                                       ;B2AADE;
    db $FD                                                               ;B2AAE2;
    dw $2107,$01EC                                                       ;B2AAE3;
    db $16                                                               ;B2AAE7;
    dw $2145                                                             ;B2AAE8;

Spritemaps_PirateWalking_0:
    dw $0014,$0007                                                       ;B2AAEA;
    db $FE                                                               ;B2AAEE;
    dw $615D,$0007                                                       ;B2AAEF;
    db $F6                                                               ;B2AAF3;
    dw $615C,$0007                                                       ;B2AAF4;
    db $EE                                                               ;B2AAF8;
    dw $615B,$01FF                                                       ;B2AAF9;
    db $14                                                               ;B2AAFD;
    dw $615A,$01FF                                                       ;B2AAFE;
    db $FE                                                               ;B2AB02;
    dw $6157,$01FF                                                       ;B2AB03;
    db $0C                                                               ;B2AB07;
    dw $6159,$01FF                                                       ;B2AB08;
    db $06                                                               ;B2AB0C;
    dw $6158,$01FF                                                       ;B2AB0D;
    db $F8                                                               ;B2AB11;
    dw $6156,$01FF                                                       ;B2AB12;
    db $F0                                                               ;B2AB16;
    dw $6155,$01FF                                                       ;B2AB17;
    db $E8                                                               ;B2AB1B;
    dw $6154,$01F0                                                       ;B2AB1C;
    db $00                                                               ;B2AB20;
    dw $215D,$01F0                                                       ;B2AB21;
    db $F8                                                               ;B2AB25;
    dw $215C,$01F0                                                       ;B2AB26;
    db $F0                                                               ;B2AB2A;
    dw $215B,$01F8                                                       ;B2AB2B;
    db $18                                                               ;B2AB2F;
    dw $215A,$01F8                                                       ;B2AB30;
    db $00                                                               ;B2AB34;
    dw $2157,$01F8                                                       ;B2AB35;
    db $10                                                               ;B2AB39;
    dw $2159,$01F8                                                       ;B2AB3A;
    db $08                                                               ;B2AB3E;
    dw $2158,$01F8                                                       ;B2AB3F;
    db $F8                                                               ;B2AB43;
    dw $2156,$01F8                                                       ;B2AB44;
    db $F0                                                               ;B2AB48;
    dw $2155,$01F8                                                       ;B2AB49;
    db $E8                                                               ;B2AB4D;
    dw $2154                                                             ;B2AB4E;

Spitemaps_PirateWall_A:
    dw $000D,$81F9                                                       ;B2AB50;
    db $FC                                                               ;B2AB54;
    dw $2127,$8001                                                       ;B2AB55;
    db $FC                                                               ;B2AB59;
    dw $2128,$01F1                                                       ;B2AB5A;
    db $F7                                                               ;B2AB5E;
    dw $214D,$01F1                                                       ;B2AB5F;
    db $EF                                                               ;B2AB63;
    dw $213D,$01F1                                                       ;B2AB64;
    db $E7                                                               ;B2AB68;
    dw $212D,$0006                                                       ;B2AB69;
    db $FB                                                               ;B2AB6D;
    dw $6112,$0006                                                       ;B2AB6E;
    db $F3                                                               ;B2AB72;
    dw $6102,$81FA                                                       ;B2AB73;
    db $EB                                                               ;B2AB77;
    dw $210E,$0003                                                       ;B2AB78;
    db $F9                                                               ;B2AB7C;
    dw $6142,$01FB                                                       ;B2AB7D;
    db $F1                                                               ;B2AB81;
    dw $6141,$0003                                                       ;B2AB82;
    db $F1                                                               ;B2AB86;
    dw $6140,$01FB                                                       ;B2AB87;
    db $F9                                                               ;B2AB8B;
    dw $6147,$81F1                                                       ;B2AB8C;
    db $F0                                                               ;B2AB90;
    dw $2100                                                             ;B2AB91;

Spitemaps_PirateWall_B:
    dw $000E,$01F0                                                       ;B2AB93;
    db $F7                                                               ;B2AB97;
    dw $214D,$01F0                                                       ;B2AB98;
    db $EF                                                               ;B2AB9C;
    dw $213D,$01F0                                                       ;B2AB9D;
    db $E7                                                               ;B2ABA1;
    dw $212D,$81FE                                                       ;B2ABA2;
    db $EB                                                               ;B2ABA6;
    dw $610E,$81F1                                                       ;B2ABA7;
    db $F0                                                               ;B2ABAB;
    dw $2100,$0003                                                       ;B2ABAC;
    db $F9                                                               ;B2ABB0;
    dw $6142,$01FB                                                       ;B2ABB1;
    db $F1                                                               ;B2ABB5;
    dw $6141,$0003                                                       ;B2ABB6;
    db $F1                                                               ;B2ABBA;
    dw $6140,$01FB                                                       ;B2ABBB;
    db $F9                                                               ;B2ABBF;
    dw $6147,$0008                                                       ;B2ABC0;
    db $FD                                                               ;B2ABC4;
    dw $A14D,$0008                                                       ;B2ABC5;
    db $05                                                               ;B2ABC9;
    dw $A13D,$0008                                                       ;B2ABCA;
    db $0D                                                               ;B2ABCE;
    dw $A12D,$0006                                                       ;B2ABCF;
    db $FB                                                               ;B2ABD3;
    dw $6112,$0006                                                       ;B2ABD4;
    db $F3                                                               ;B2ABD8;
    dw $6102                                                             ;B2ABD9;

Spitemaps_PirateWall_C:
    dw $0014,$0000                                                       ;B2ABDB;
    db $F2                                                               ;B2ABDF;
    dw $614F,$0008                                                       ;B2ABE0;
    db $F1                                                               ;B2ABE4;
    dw $614E,$000C                                                       ;B2ABE5;
    db $EE                                                               ;B2ABE9;
    dw $614D,$000C                                                       ;B2ABEA;
    db $E6                                                               ;B2ABEE;
    dw $613D,$000C                                                       ;B2ABEF;
    db $DE                                                               ;B2ABF3;
    dw $612D,$81FB                                                       ;B2ABF4;
    db $F1                                                               ;B2ABF8;
    dw $612E,$8002                                                       ;B2ABF9;
    db $EB                                                               ;B2ABFD;
    dw $610E,$000C                                                       ;B2ABFE;
    db $F0                                                               ;B2AC02;
    dw $613D,$000C                                                       ;B2AC03;
    db $F8                                                               ;B2AC07;
    dw $614D,$8002                                                       ;B2AC08;
    db $F1                                                               ;B2AC0C;
    dw $6100,$81F9                                                       ;B2AC0D;
    db $FF                                                               ;B2AC11;
    dw $6107,$01F4                                                       ;B2AC12;
    db $11                                                               ;B2AC16;
    dw $6144,$01F4                                                       ;B2AC17;
    db $09                                                               ;B2AC1B;
    dw $6143,$0001                                                       ;B2AC1C;
    db $09                                                               ;B2AC20;
    dw $A149,$01F9                                                       ;B2AC21;
    db $09                                                               ;B2AC25;
    dw $A148,$81FC                                                       ;B2AC26;
    db $FF                                                               ;B2AC2A;
    dw $6107,$0003                                                       ;B2AC2B;
    db $0B                                                               ;B2AC2F;
    dw $A149,$01FB                                                       ;B2AC30;
    db $0B                                                               ;B2AC34;
    dw $A148,$01FA                                                       ;B2AC35;
    db $13                                                               ;B2AC39;
    dw $6144,$01FA                                                       ;B2AC3A;
    db $0B                                                               ;B2AC3E;
    dw $6143                                                             ;B2AC3F;

Spitemaps_PirateWall_D:
    dw $0010,$0008                                                       ;B2AC41;
    db $FC                                                               ;B2AC45;
    dw $614D,$0009                                                       ;B2AC46;
    db $F4                                                               ;B2AC4A;
    dw $613D,$000A                                                       ;B2AC4B;
    db $EC                                                               ;B2AC4F;
    dw $612D,$000B                                                       ;B2AC50;
    db $FD                                                               ;B2AC54;
    dw $614D,$000C                                                       ;B2AC55;
    db $F5                                                               ;B2AC59;
    dw $613D,$000D                                                       ;B2AC5A;
    db $ED                                                               ;B2AC5E;
    dw $612D,$81FD                                                       ;B2AC5F;
    db $F3                                                               ;B2AC63;
    dw $6100,$81F9                                                       ;B2AC64;
    db $F0                                                               ;B2AC68;
    dw $612E,$8000                                                       ;B2AC69;
    db $EA                                                               ;B2AC6D;
    dw $610E,$01FA                                                       ;B2AC6E;
    db $0B                                                               ;B2AC72;
    dw $6144,$01FA                                                       ;B2AC73;
    db $03                                                               ;B2AC77;
    dw $6143,$01FE                                                       ;B2AC78;
    db $09                                                               ;B2AC7C;
    dw $6146,$0006                                                       ;B2AC7D;
    db $09                                                               ;B2AC81;
    dw $6145,$01FB                                                       ;B2AC82;
    db $FE                                                               ;B2AC86;
    dw $6149,$0003                                                       ;B2AC87;
    db $FD                                                               ;B2AC8B;
    dw $6148,$81FD                                                       ;B2AC8C;
    db $FF                                                               ;B2AC90;
    dw $6122                                                             ;B2AC91;

Spitemaps_PirateWall_E:
    dw $0008,$0009                                                       ;B2AC93;
    db $FD                                                               ;B2AC97;
    dw $614D,$0009                                                       ;B2AC98;
    db $F5                                                               ;B2AC9C;
    dw $613D,$0009                                                       ;B2AC9D;
    db $ED                                                               ;B2ACA1;
    dw $612D,$81FC                                                       ;B2ACA2;
    db $F3                                                               ;B2ACA6;
    dw $6100,$81F8                                                       ;B2ACA7;
    db $F0                                                               ;B2ACAB;
    dw $612E,$81FF                                                       ;B2ACAC;
    db $EA                                                               ;B2ACB0;
    dw $610E,$0009                                                       ;B2ACB1;
    db $E6                                                               ;B2ACB5;
    dw $613D,$0009                                                       ;B2ACB6;
    db $DE                                                               ;B2ACBA;
    dw $612D                                                             ;B2ACBB;

Spitemaps_PirateWall_F:
    dw $0009,$01FC                                                       ;B2ACBD;
    db $F3                                                               ;B2ACC1;
    dw $614F,$0004                                                       ;B2ACC2;
    db $F4                                                               ;B2ACC6;
    dw $614E,$0009                                                       ;B2ACC7;
    db $F9                                                               ;B2ACCB;
    dw $614D,$0009                                                       ;B2ACCC;
    db $F1                                                               ;B2ACD0;
    dw $613D,$0009                                                       ;B2ACD1;
    db $E9                                                               ;B2ACD5;
    dw $612D,$81F8                                                       ;B2ACD6;
    db $F0                                                               ;B2ACDA;
    dw $612E,$81FF                                                       ;B2ACDB;
    db $EA                                                               ;B2ACDF;
    dw $610E,$0009                                                       ;B2ACE0;
    db $EA                                                               ;B2ACE4;
    dw $613D,$0009                                                       ;B2ACE5;
    db $E2                                                               ;B2ACE9;
    dw $612D                                                             ;B2ACEA;

Spitemaps_PirateWall_10:
    dw $0008,$0009                                                       ;B2ACEC;
    db $F3                                                               ;B2ACF0;
    dw $614D,$0009                                                       ;B2ACF1;
    db $EB                                                               ;B2ACF5;
    dw $613D,$0009                                                       ;B2ACF6;
    db $E3                                                               ;B2ACFA;
    dw $612D,$01FD                                                       ;B2ACFB;
    db $F3                                                               ;B2ACFF;
    dw $614F,$0005                                                       ;B2AD00;
    db $F3                                                               ;B2AD04;
    dw $614E,$81F8                                                       ;B2AD05;
    db $F0                                                               ;B2AD09;
    dw $612E,$81FF                                                       ;B2AD0A;
    db $EA                                                               ;B2AD0E;
    dw $610E,$0009                                                       ;B2AD0F;
    db $E1                                                               ;B2AD13;
    dw $612D                                                             ;B2AD14;

Spitemaps_PirateWall_11:
    dw $000A,$01FD                                                       ;B2AD16;
    db $F1                                                               ;B2AD1A;
    dw $614F,$0005                                                       ;B2AD1B;
    db $F0                                                               ;B2AD1F;
    dw $614E,$0009                                                       ;B2AD20;
    db $ED                                                               ;B2AD24;
    dw $614D,$0009                                                       ;B2AD25;
    db $E5                                                               ;B2AD29;
    dw $613D,$0009                                                       ;B2AD2A;
    db $DD                                                               ;B2AD2E;
    dw $612D,$81F8                                                       ;B2AD2F;
    db $F0                                                               ;B2AD33;
    dw $612E,$81FF                                                       ;B2AD34;
    db $EA                                                               ;B2AD38;
    dw $610E,$0009                                                       ;B2AD39;
    db $EF                                                               ;B2AD3D;
    dw $613D,$0009                                                       ;B2AD3E;
    db $F7                                                               ;B2AD42;
    dw $614D,$81FF                                                       ;B2AD43;
    db $F0                                                               ;B2AD47;
    dw $6100                                                             ;B2AD48;

Spitemaps_PirateWall_12:
    dw $0009,$81FC                                                       ;B2AD4A;
    db $EB                                                               ;B2AD4E;
    dw $A105,$0009                                                       ;B2AD4F;
    db $EB                                                               ;B2AD53;
    dw $614D,$0009                                                       ;B2AD54;
    db $E3                                                               ;B2AD58;
    dw $613D,$0009                                                       ;B2AD59;
    db $DB                                                               ;B2AD5D;
    dw $612D,$81F8                                                       ;B2AD5E;
    db $F0                                                               ;B2AD62;
    dw $612E,$81FF                                                       ;B2AD63;
    db $EA                                                               ;B2AD67;
    dw $610E,$0009                                                       ;B2AD68;
    db $F1                                                               ;B2AD6C;
    dw $613D,$0009                                                       ;B2AD6D;
    db $F9                                                               ;B2AD71;
    dw $614D,$81FF                                                       ;B2AD72;
    db $F2                                                               ;B2AD76;
    dw $6100                                                             ;B2AD77;

Spitemaps_PirateWall_13:
    dw $000A,$0004                                                       ;B2AD79;
    db $19                                                               ;B2AD7D;
    dw $6146,$0001                                                       ;B2AD7E;
    db $13                                                               ;B2AD82;
    dw $6119,$0001                                                       ;B2AD83;
    db $0B                                                               ;B2AD87;
    dw $6109,$81F7                                                       ;B2AD88;
    db $FE                                                               ;B2AD8C;
    dw $6107,$000C                                                       ;B2AD8D;
    db $19                                                               ;B2AD91;
    dw $6145,$0003                                                       ;B2AD92;
    db $FE                                                               ;B2AD96;
    dw $6131,$0003                                                       ;B2AD97;
    db $F6                                                               ;B2AD9B;
    dw $6121,$81FA                                                       ;B2AD9C;
    db $F5                                                               ;B2ADA0;
    dw $A10C,$0004                                                       ;B2ADA1;
    db $05                                                               ;B2ADA5;
    dw $6146,$000C                                                       ;B2ADA6;
    db $05                                                               ;B2ADAA;
    dw $6145                                                             ;B2ADAB;

Spitemaps_PirateWall_14:
    dw $000C,$01F8                                                       ;B2ADAD;
    db $FD                                                               ;B2ADB1;
    dw $6149,$0000                                                       ;B2ADB2;
    db $FF                                                               ;B2ADB6;
    dw $6148,$0004                                                       ;B2ADB7;
    db $14                                                               ;B2ADBB;
    dw $6146,$000C                                                       ;B2ADBC;
    db $14                                                               ;B2ADC0;
    dw $6145,$01F8                                                       ;B2ADC1;
    db $FB                                                               ;B2ADC5;
    dw $6149,$0000                                                       ;B2ADC6;
    db $F9                                                               ;B2ADCA;
    dw $6148,$0003                                                       ;B2ADCB;
    db $0D                                                               ;B2ADCF;
    dw $611A,$0003                                                       ;B2ADD0;
    db $05                                                               ;B2ADD4;
    dw $610A,$0003                                                       ;B2ADD5;
    db $02                                                               ;B2ADD9;
    dw $6131,$0003                                                       ;B2ADDA;
    db $FA                                                               ;B2ADDE;
    dw $6121,$0004                                                       ;B2ADDF;
    db $09                                                               ;B2ADE3;
    dw $6146,$000C                                                       ;B2ADE4;
    db $09                                                               ;B2ADE8;
    dw $6145                                                             ;B2ADE9;

Spitemaps_PirateWall_15:
    dw $000C,$01F8                                                       ;B2ADEB;
    db $F9                                                               ;B2ADEF;
    dw $6149,$0000                                                       ;B2ADF0;
    db $FB                                                               ;B2ADF4;
    dw $6148,$0004                                                       ;B2ADF5;
    db $10                                                               ;B2ADF9;
    dw $6146,$000C                                                       ;B2ADFA;
    db $10                                                               ;B2ADFE;
    dw $6145,$01F8                                                       ;B2ADFF;
    db $FB                                                               ;B2AE03;
    dw $6149,$0000                                                       ;B2AE04;
    db $F9                                                               ;B2AE08;
    dw $6148,$0003                                                       ;B2AE09;
    db $09                                                               ;B2AE0D;
    dw $611A,$0003                                                       ;B2AE0E;
    db $01                                                               ;B2AE12;
    dw $610A,$0003                                                       ;B2AE13;
    db $06                                                               ;B2AE17;
    dw $6131,$0003                                                       ;B2AE18;
    db $FE                                                               ;B2AE1C;
    dw $6121,$0004                                                       ;B2AE1D;
    db $0D                                                               ;B2AE21;
    dw $6146,$000C                                                       ;B2AE22;
    db $0D                                                               ;B2AE26;
    dw $6145                                                             ;B2AE27;

Spitemaps_PirateWall_16:
    dw $000C,$0005                                                       ;B2AE29;
    db $03                                                               ;B2AE2D;
    dw $6131,$0005                                                       ;B2AE2E;
    db $FB                                                               ;B2AE32;
    dw $6121,$0004                                                       ;B2AE33;
    db $0A                                                               ;B2AE37;
    dw $6146,$000C                                                       ;B2AE38;
    db $0A                                                               ;B2AE3C;
    dw $6145,$01F8                                                       ;B2AE3D;
    db $FC                                                               ;B2AE41;
    dw $6149,$0000                                                       ;B2AE42;
    db $FA                                                               ;B2AE46;
    dw $6148,$01F8                                                       ;B2AE47;
    db $FE                                                               ;B2AE4B;
    dw $6149,$0000                                                       ;B2AE4C;
    db $00                                                               ;B2AE50;
    dw $6148,$0004                                                       ;B2AE51;
    db $12                                                               ;B2AE55;
    dw $6146,$000C                                                       ;B2AE56;
    db $12                                                               ;B2AE5A;
    dw $6145,$0003                                                       ;B2AE5B;
    db $0C                                                               ;B2AE5F;
    dw $611A,$0003                                                       ;B2AE60;
    db $04                                                               ;B2AE64;
    dw $610A                                                             ;B2AE65;

Spitemaps_PirateWall_17:
    dw $000A,$0003                                                       ;B2AE67;
    db $00                                                               ;B2AE6B;
    dw $6131,$0003                                                       ;B2AE6C;
    db $F8                                                               ;B2AE70;
    dw $6121,$81F9                                                       ;B2AE71;
    db $F6                                                               ;B2AE75;
    dw $A10C,$0004                                                       ;B2AE76;
    db $07                                                               ;B2AE7A;
    dw $6146,$000C                                                       ;B2AE7B;
    db $07                                                               ;B2AE7F;
    dw $6145,$0004                                                       ;B2AE80;
    db $16                                                               ;B2AE84;
    dw $6146,$0002                                                       ;B2AE85;
    db $10                                                               ;B2AE89;
    dw $6119,$0002                                                       ;B2AE8A;
    db $08                                                               ;B2AE8E;
    dw $6109,$81F8                                                       ;B2AE8F;
    db $FD                                                               ;B2AE93;
    dw $6107,$000C                                                       ;B2AE94;
    db $16                                                               ;B2AE98;
    dw $6145                                                             ;B2AE99;

Spitemaps_PirateWall_18:
    dw $000D,$81F7                                                       ;B2AE9B;
    db $FC                                                               ;B2AE9F;
    dw $6127,$81EF                                                       ;B2AEA0;
    db $FC                                                               ;B2AEA4;
    dw $6128,$0007                                                       ;B2AEA5;
    db $F7                                                               ;B2AEA9;
    dw $614D,$0007                                                       ;B2AEAA;
    db $EF                                                               ;B2AEAE;
    dw $613D,$0007                                                       ;B2AEAF;
    db $E7                                                               ;B2AEB3;
    dw $612D,$01F2                                                       ;B2AEB4;
    db $FB                                                               ;B2AEB8;
    dw $2112,$01F2                                                       ;B2AEB9;
    db $F3                                                               ;B2AEBD;
    dw $2102,$81F6                                                       ;B2AEBE;
    db $EB                                                               ;B2AEC2;
    dw $610E,$01F5                                                       ;B2AEC3;
    db $F9                                                               ;B2AEC7;
    dw $2142,$01FD                                                       ;B2AEC8;
    db $F1                                                               ;B2AECC;
    dw $2141,$01F5                                                       ;B2AECD;
    db $F1                                                               ;B2AED1;
    dw $2140,$01FD                                                       ;B2AED2;
    db $F9                                                               ;B2AED6;
    dw $2147,$81FF                                                       ;B2AED7;
    db $F0                                                               ;B2AEDB;
    dw $6100                                                             ;B2AEDC;

Spitemaps_PirateWall_19:
    dw $000E,$0008                                                       ;B2AEDE;
    db $F7                                                               ;B2AEE2;
    dw $614D,$0008                                                       ;B2AEE3;
    db $EF                                                               ;B2AEE7;
    dw $613D,$0008                                                       ;B2AEE8;
    db $E7                                                               ;B2AEEC;
    dw $612D,$81F2                                                       ;B2AEED;
    db $EB                                                               ;B2AEF1;
    dw $210E,$81FF                                                       ;B2AEF2;
    db $F0                                                               ;B2AEF6;
    dw $6100,$01F5                                                       ;B2AEF7;
    db $F9                                                               ;B2AEFB;
    dw $2142,$01FD                                                       ;B2AEFC;
    db $F1                                                               ;B2AF00;
    dw $2141,$01F5                                                       ;B2AF01;
    db $F1                                                               ;B2AF05;
    dw $2140,$01FD                                                       ;B2AF06;
    db $F9                                                               ;B2AF0A;
    dw $2147,$01F0                                                       ;B2AF0B;
    db $FD                                                               ;B2AF0F;
    dw $E14D,$01F0                                                       ;B2AF10;
    db $05                                                               ;B2AF14;
    dw $E13D,$01F0                                                       ;B2AF15;
    db $0D                                                               ;B2AF19;
    dw $E12D,$01F2                                                       ;B2AF1A;
    db $FB                                                               ;B2AF1E;
    dw $2112,$01F2                                                       ;B2AF1F;
    db $F3                                                               ;B2AF23;
    dw $2102                                                             ;B2AF24;

Spitemaps_PirateWall_1A:
    dw $0014,$01F8                                                       ;B2AF26;
    db $F2                                                               ;B2AF2A;
    dw $214F,$01F0                                                       ;B2AF2B;
    db $F1                                                               ;B2AF2F;
    dw $214E,$01EC                                                       ;B2AF30;
    db $EE                                                               ;B2AF34;
    dw $214D,$01EC                                                       ;B2AF35;
    db $E6                                                               ;B2AF39;
    dw $213D,$01EC                                                       ;B2AF3A;
    db $DE                                                               ;B2AF3E;
    dw $212D,$81F5                                                       ;B2AF3F;
    db $F1                                                               ;B2AF43;
    dw $212E,$81EE                                                       ;B2AF44;
    db $EB                                                               ;B2AF48;
    dw $210E,$01EC                                                       ;B2AF49;
    db $F0                                                               ;B2AF4D;
    dw $213D,$01EC                                                       ;B2AF4E;
    db $F8                                                               ;B2AF52;
    dw $214D,$81EE                                                       ;B2AF53;
    db $F1                                                               ;B2AF57;
    dw $2100,$81F7                                                       ;B2AF58;
    db $FF                                                               ;B2AF5C;
    dw $2107,$0004                                                       ;B2AF5D;
    db $11                                                               ;B2AF61;
    dw $2144,$0004                                                       ;B2AF62;
    db $09                                                               ;B2AF66;
    dw $2143,$01F7                                                       ;B2AF67;
    db $09                                                               ;B2AF6B;
    dw $E149,$01FF                                                       ;B2AF6C;
    db $09                                                               ;B2AF70;
    dw $E148,$81F4                                                       ;B2AF71;
    db $FF                                                               ;B2AF75;
    dw $2107,$01F5                                                       ;B2AF76;
    db $0B                                                               ;B2AF7A;
    dw $E149,$01FD                                                       ;B2AF7B;
    db $0B                                                               ;B2AF7F;
    dw $E148,$01FE                                                       ;B2AF80;
    db $13                                                               ;B2AF84;
    dw $2144,$01FE                                                       ;B2AF85;
    db $0B                                                               ;B2AF89;
    dw $2143                                                             ;B2AF8A;

Spitemaps_PirateWall_1B:
    dw $0010,$01F0                                                       ;B2AF8C;
    db $FC                                                               ;B2AF90;
    dw $214D,$01EF                                                       ;B2AF91;
    db $F4                                                               ;B2AF95;
    dw $213D,$01EE                                                       ;B2AF96;
    db $EC                                                               ;B2AF9A;
    dw $212D,$01ED                                                       ;B2AF9B;
    db $FD                                                               ;B2AF9F;
    dw $214D,$01EC                                                       ;B2AFA0;
    db $F5                                                               ;B2AFA4;
    dw $213D,$01EB                                                       ;B2AFA5;
    db $ED                                                               ;B2AFA9;
    dw $212D,$81F3                                                       ;B2AFAA;
    db $F3                                                               ;B2AFAE;
    dw $2100,$81F7                                                       ;B2AFAF;
    db $F0                                                               ;B2AFB3;
    dw $212E,$81F0                                                       ;B2AFB4;
    db $EA                                                               ;B2AFB8;
    dw $210E,$01FE                                                       ;B2AFB9;
    db $0B                                                               ;B2AFBD;
    dw $2144,$01FE                                                       ;B2AFBE;
    db $03                                                               ;B2AFC2;
    dw $2143,$01FA                                                       ;B2AFC3;
    db $09                                                               ;B2AFC7;
    dw $2146,$01F2                                                       ;B2AFC8;
    db $09                                                               ;B2AFCC;
    dw $2145,$01FD                                                       ;B2AFCD;
    db $FE                                                               ;B2AFD1;
    dw $2149,$01F5                                                       ;B2AFD2;
    db $FD                                                               ;B2AFD6;
    dw $2148,$81F3                                                       ;B2AFD7;
    db $FF                                                               ;B2AFDB;
    dw $2122                                                             ;B2AFDC;

Spritemaps_PirateWalking_1:
    dw $000A,$01F5                                                       ;B2AFDE;
    db $13                                                               ;B2AFE2;
    dw $2130,$01F4                                                       ;B2AFE3;
    db $0B                                                               ;B2AFE7;
    dw $2120,$01F2                                                       ;B2AFE8;
    db $18                                                               ;B2AFEC;
    dw $2136,$01EB                                                       ;B2AFED;
    db $18                                                               ;B2AFF1;
    dw $2135,$81F5                                                       ;B2AFF2;
    db $00                                                               ;B2AFF6;
    dw $2107,$0006                                                       ;B2AFF7;
    db $18                                                               ;B2AFFB;
    dw $2144,$0006                                                       ;B2AFFC;
    db $10                                                               ;B2B000;
    dw $2143,$81FE                                                       ;B2B001;
    db $0B                                                               ;B2B005;
    dw $2122,$01FD                                                       ;B2B006;
    db $08                                                               ;B2B00A;
    dw $211B,$01FD                                                       ;B2B00B;
    db $00                                                               ;B2B00F;
    dw $210B                                                             ;B2B010;

Spritemaps_PirateWalking_2:
    dw $000B,$01F9                                                       ;B2B012;
    db $12                                                               ;B2B016;
    dw $2131,$01F9                                                       ;B2B017;
    db $0A                                                               ;B2B01B;
    dw $2121,$01F7                                                       ;B2B01C;
    db $18                                                               ;B2B020;
    dw $2126,$01EF                                                       ;B2B021;
    db $18                                                               ;B2B025;
    dw $2125,$01FA                                                       ;B2B026;
    db $06                                                               ;B2B02A;
    dw $2119,$01FA                                                       ;B2B02B;
    db $FE                                                               ;B2B02F;
    dw $2109,$0005                                                       ;B2B030;
    db $17                                                               ;B2B034;
    dw $2144,$0005                                                       ;B2B035;
    db $0F                                                               ;B2B039;
    dw $2143,$81FA                                                       ;B2B03A;
    db $08                                                               ;B2B03E;
    dw $2122,$01FB                                                       ;B2B03F;
    db $06                                                               ;B2B043;
    dw $211A,$01FB                                                       ;B2B044;
    db $FE                                                               ;B2B048;
    dw $210A                                                             ;B2B049;

Spritemaps_PirateWalking_3:
    dw $000C,$01FD                                                       ;B2B04B;
    db $18                                                               ;B2B04F;
    dw $2126,$01F5                                                       ;B2B050;
    db $18                                                               ;B2B054;
    dw $2125,$01FE                                                       ;B2B055;
    db $14                                                               ;B2B059;
    dw $2131,$01FE                                                       ;B2B05A;
    db $0C                                                               ;B2B05E;
    dw $2121,$01FC                                                       ;B2B05F;
    db $06                                                               ;B2B063;
    dw $211A,$01FC                                                       ;B2B064;
    db $FE                                                               ;B2B068;
    dw $210A,$0004                                                       ;B2B069;
    db $18                                                               ;B2B06D;
    dw $2144,$0004                                                       ;B2B06E;
    db $10                                                               ;B2B072;
    dw $2143,$01FD                                                       ;B2B073;
    db $10                                                               ;B2B077;
    dw $211B,$01FD                                                       ;B2B078;
    db $08                                                               ;B2B07C;
    dw $210B,$01FB                                                       ;B2B07D;
    db $04                                                               ;B2B081;
    dw $2119,$01FB                                                       ;B2B082;
    db $FC                                                               ;B2B086;
    dw $2109                                                             ;B2B087;

Spritemaps_PirateWalking_4:
    dw $000B,$01FA                                                       ;B2B089;
    db $16                                                               ;B2B08D;
    dw $2126,$01F2                                                       ;B2B08E;
    db $16                                                               ;B2B092;
    dw $2125,$0004                                                       ;B2B093;
    db $18                                                               ;B2B097;
    dw $2146,$01FC                                                       ;B2B098;
    db $18                                                               ;B2B09C;
    dw $2145,$0001                                                       ;B2B09D;
    db $13                                                               ;B2B0A1;
    dw $2134,$0001                                                       ;B2B0A2;
    db $0B                                                               ;B2B0A6;
    dw $2124,$01FC                                                       ;B2B0A7;
    db $07                                                               ;B2B0AB;
    dw $211B,$01FD                                                       ;B2B0AC;
    db $FF                                                               ;B2B0B0;
    dw $210B,$81F4                                                       ;B2B0B1;
    db $00                                                               ;B2B0B5;
    dw $2107,$01F8                                                       ;B2B0B6;
    db $12                                                               ;B2B0BA;
    dw $2134,$01F8                                                       ;B2B0BB;
    db $0A                                                               ;B2B0BF;
    dw $2124                                                             ;B2B0C0;

Spritemaps_PirateWalking_5:
    dw $000A,$01FA                                                       ;B2B0C2;
    db $00                                                               ;B2B0C6;
    dw $210A,$01F2                                                       ;B2B0C7;
    db $18                                                               ;B2B0CB;
    dw $2136,$01EB                                                       ;B2B0CC;
    db $18                                                               ;B2B0D0;
    dw $2135,$0006                                                       ;B2B0D1;
    db $18                                                               ;B2B0D5;
    dw $2144,$0006                                                       ;B2B0D6;
    db $10                                                               ;B2B0DA;
    dw $2143,$81FB                                                       ;B2B0DB;
    db $0A                                                               ;B2B0DF;
    dw $2122,$01F9                                                       ;B2B0E0;
    db $08                                                               ;B2B0E4;
    dw $211B,$01F4                                                       ;B2B0E5;
    db $13                                                               ;B2B0E9;
    dw $2130,$01F3                                                       ;B2B0EA;
    db $0B                                                               ;B2B0EE;
    dw $2120,$81F4                                                       ;B2B0EF;
    db $00                                                               ;B2B0F3;
    dw $2107                                                             ;B2B0F4;

Spritemaps_PirateWalking_6:
    dw $000B,$01F7                                                       ;B2B0F6;
    db $13                                                               ;B2B0FA;
    dw $2131,$01F7                                                       ;B2B0FB;
    db $0B                                                               ;B2B0FF;
    dw $2121,$0005                                                       ;B2B100;
    db $17                                                               ;B2B104;
    dw $2144,$0005                                                       ;B2B105;
    db $0F                                                               ;B2B109;
    dw $2143,$81FA                                                       ;B2B10A;
    db $08                                                               ;B2B10E;
    dw $2122,$01FB                                                       ;B2B10F;
    db $06                                                               ;B2B113;
    dw $211A,$01FB                                                       ;B2B114;
    db $FE                                                               ;B2B118;
    dw $210A,$01F6                                                       ;B2B119;
    db $18                                                               ;B2B11D;
    dw $2126,$01EE                                                       ;B2B11E;
    db $18                                                               ;B2B122;
    dw $2125,$01F8                                                       ;B2B123;
    db $07                                                               ;B2B127;
    dw $2119,$01F8                                                       ;B2B128;
    db $FF                                                               ;B2B12C;
    dw $2109                                                             ;B2B12D;

Spritemaps_PirateWalking_7:
    dw $000C,$01FB                                                       ;B2B12F;
    db $06                                                               ;B2B133;
    dw $2119,$01FB                                                       ;B2B134;
    db $FE                                                               ;B2B138;
    dw $2109,$0002                                                       ;B2B139;
    db $19                                                               ;B2B13D;
    dw $2144,$0002                                                       ;B2B13E;
    db $11                                                               ;B2B142;
    dw $2143,$01FC                                                       ;B2B143;
    db $11                                                               ;B2B147;
    dw $211B,$01FC                                                       ;B2B148;
    db $09                                                               ;B2B14C;
    dw $210B,$01FD                                                       ;B2B14D;
    db $18                                                               ;B2B151;
    dw $2126,$01F5                                                       ;B2B152;
    db $18                                                               ;B2B156;
    dw $2125,$01FE                                                       ;B2B157;
    db $15                                                               ;B2B15B;
    dw $2131,$01FE                                                       ;B2B15C;
    db $0D                                                               ;B2B160;
    dw $2121,$01FC                                                       ;B2B161;
    db $08                                                               ;B2B165;
    dw $211A,$01FC                                                       ;B2B166;
    db $00                                                               ;B2B16A;
    dw $210A                                                             ;B2B16B;

Spritemaps_PirateWalking_8:
    dw $000B,$01FA                                                       ;B2B16D;
    db $16                                                               ;B2B171;
    dw $2126,$01F2                                                       ;B2B172;
    db $16                                                               ;B2B176;
    dw $2125,$81F6                                                       ;B2B177;
    db $00                                                               ;B2B17B;
    dw $2107,$01F8                                                       ;B2B17C;
    db $12                                                               ;B2B180;
    dw $2134,$01F8                                                       ;B2B181;
    db $0A                                                               ;B2B185;
    dw $2124,$0004                                                       ;B2B186;
    db $18                                                               ;B2B18A;
    dw $2146,$01FC                                                       ;B2B18B;
    db $18                                                               ;B2B18F;
    dw $2145,$0001                                                       ;B2B190;
    db $13                                                               ;B2B194;
    dw $2134,$0001                                                       ;B2B195;
    db $0B                                                               ;B2B199;
    dw $2124,$01FC                                                       ;B2B19A;
    db $07                                                               ;B2B19E;
    dw $211B,$01FD                                                       ;B2B19F;
    db $FF                                                               ;B2B1A3;
    dw $210B                                                             ;B2B1A4;

Spitemaps_PirateWalking_9_Ninja_0:
    dw $000A,$01F8                                                       ;B2B1A6;
    db $11                                                               ;B2B1AA;
    dw $2134,$01FC                                                       ;B2B1AB;
    db $FE                                                               ;B2B1AF;
    dw $2109,$01FC                                                       ;B2B1B0;
    db $06                                                               ;B2B1B4;
    dw $2119,$0003                                                       ;B2B1B5;
    db $15                                                               ;B2B1B9;
    dw $2126,$01FC                                                       ;B2B1BA;
    db $15                                                               ;B2B1BE;
    dw $2125,$81F5                                                       ;B2B1BF;
    db $FF                                                               ;B2B1C3;
    dw $2107,$81FB                                                       ;B2B1C4;
    db $0A                                                               ;B2B1C8;
    dw $2122,$01FA                                                       ;B2B1C9;
    db $15                                                               ;B2B1CD;
    dw $2126,$01F2                                                       ;B2B1CE;
    db $15                                                               ;B2B1D2;
    dw $2125,$01F8                                                       ;B2B1D3;
    db $09                                                               ;B2B1D7;
    dw $2124                                                             ;B2B1D8;

Spitemaps_PirateWalking_A_Ninja_1:
    dw $000A,$81F7                                                       ;B2B1DA;
    db $FF                                                               ;B2B1DE;
    dw $2107,$0004                                                       ;B2B1DF;
    db $11                                                               ;B2B1E3;
    dw $2144,$0004                                                       ;B2B1E4;
    db $09                                                               ;B2B1E8;
    dw $2143,$01F7                                                       ;B2B1E9;
    db $09                                                               ;B2B1ED;
    dw $E149,$01FF                                                       ;B2B1EE;
    db $09                                                               ;B2B1F2;
    dw $E148,$81F4                                                       ;B2B1F3;
    db $FF                                                               ;B2B1F7;
    dw $2107,$01F5                                                       ;B2B1F8;
    db $0B                                                               ;B2B1FC;
    dw $E149,$01FD                                                       ;B2B1FD;
    db $0B                                                               ;B2B201;
    dw $E148,$01FE                                                       ;B2B202;
    db $13                                                               ;B2B206;
    dw $2144,$01FE                                                       ;B2B207;
    db $0B                                                               ;B2B20B;
    dw $2143                                                             ;B2B20C;

Spitemaps_PirateWalking_B_Ninja_2:
    dw $000A,$01FC                                                       ;B2B20E;
    db $08                                                               ;B2B212;
    dw $2119,$01FC                                                       ;B2B213;
    db $00                                                               ;B2B217;
    dw $2109,$81F4                                                       ;B2B218;
    db $01                                                               ;B2B21C;
    dw $2107,$01F6                                                       ;B2B21D;
    db $09                                                               ;B2B221;
    dw $2124,$01F7                                                       ;B2B222;
    db $11                                                               ;B2B226;
    dw $2134,$0002                                                       ;B2B227;
    db $15                                                               ;B2B22B;
    dw $2126,$01FC                                                       ;B2B22C;
    db $15                                                               ;B2B230;
    dw $2125,$81FA                                                       ;B2B231;
    db $0B                                                               ;B2B235;
    dw $2122,$01F9                                                       ;B2B236;
    db $15                                                               ;B2B23A;
    dw $2126,$01F2                                                       ;B2B23B;
    db $15                                                               ;B2B23F;
    dw $2125                                                             ;B2B240;

Spitemaps_PirateWalking_C:
    dw $0005,$81EA                                                       ;B2B242;
    db $00                                                               ;B2B246;
    dw $2127,$81F2                                                       ;B2B247;
    db $00                                                               ;B2B24B;
    dw $2128,$01FB                                                       ;B2B24C;
    db $FB                                                               ;B2B250;
    dw $2113,$01FB                                                       ;B2B251;
    db $F3                                                               ;B2B255;
    dw $2103,$81F8                                                       ;B2B256;
    db $F0                                                               ;B2B25A;
    dw $212E                                                             ;B2B25B;

Spitemaps_PirateWalking_D:
    dw $0005,$8006                                                       ;B2B25D;
    db $00                                                               ;B2B261;
    dw $6127,$81FE                                                       ;B2B262;
    db $00                                                               ;B2B266;
    dw $6128,$01FD                                                       ;B2B267;
    db $FB                                                               ;B2B26B;
    dw $6113,$01FD                                                       ;B2B26C;
    db $F3                                                               ;B2B270;
    dw $6103,$81F8                                                       ;B2B271;
    db $F0                                                               ;B2B275;
    dw $612E                                                             ;B2B276;

Spitemaps_PirateWalking_E:
    dw $000A,$0003                                                       ;B2B278;
    db $13                                                               ;B2B27C;
    dw $6130,$0004                                                       ;B2B27D;
    db $0B                                                               ;B2B281;
    dw $6120,$0006                                                       ;B2B282;
    db $18                                                               ;B2B286;
    dw $6136,$000D                                                       ;B2B287;
    db $18                                                               ;B2B28B;
    dw $6135,$81FB                                                       ;B2B28C;
    db $00                                                               ;B2B290;
    dw $6107,$01F2                                                       ;B2B291;
    db $18                                                               ;B2B295;
    dw $6144,$01F2                                                       ;B2B296;
    db $10                                                               ;B2B29A;
    dw $6143,$81F2                                                       ;B2B29B;
    db $0B                                                               ;B2B29F;
    dw $6122,$01FB                                                       ;B2B2A0;
    db $08                                                               ;B2B2A4;
    dw $611B,$01FB                                                       ;B2B2A5;
    db $00                                                               ;B2B2A9;
    dw $610B                                                             ;B2B2AA;

Spitemaps_PirateWalking_F:
    dw $000B,$01FF                                                       ;B2B2AC;
    db $12                                                               ;B2B2B0;
    dw $6131,$01FF                                                       ;B2B2B1;
    db $0A                                                               ;B2B2B5;
    dw $6121,$0001                                                       ;B2B2B6;
    db $18                                                               ;B2B2BA;
    dw $6126,$0009                                                       ;B2B2BB;
    db $18                                                               ;B2B2BF;
    dw $6125,$01FE                                                       ;B2B2C0;
    db $06                                                               ;B2B2C4;
    dw $6119,$01FE                                                       ;B2B2C5;
    db $FE                                                               ;B2B2C9;
    dw $6109,$01F3                                                       ;B2B2CA;
    db $17                                                               ;B2B2CE;
    dw $6144,$01F3                                                       ;B2B2CF;
    db $0F                                                               ;B2B2D3;
    dw $6143,$81F6                                                       ;B2B2D4;
    db $08                                                               ;B2B2D8;
    dw $6122,$01FD                                                       ;B2B2D9;
    db $06                                                               ;B2B2DD;
    dw $611A,$01FD                                                       ;B2B2DE;
    db $FE                                                               ;B2B2E2;
    dw $610A                                                             ;B2B2E3;

Spitemaps_PirateWalking_10:
    dw $000C,$01FB                                                       ;B2B2E5;
    db $18                                                               ;B2B2E9;
    dw $6126,$0003                                                       ;B2B2EA;
    db $18                                                               ;B2B2EE;
    dw $6125,$01FA                                                       ;B2B2EF;
    db $14                                                               ;B2B2F3;
    dw $6131,$01FA                                                       ;B2B2F4;
    db $0C                                                               ;B2B2F8;
    dw $6121,$01FC                                                       ;B2B2F9;
    db $06                                                               ;B2B2FD;
    dw $611A,$01FC                                                       ;B2B2FE;
    db $FE                                                               ;B2B302;
    dw $610A,$01F4                                                       ;B2B303;
    db $18                                                               ;B2B307;
    dw $6144,$01F4                                                       ;B2B308;
    db $10                                                               ;B2B30C;
    dw $6143,$01FB                                                       ;B2B30D;
    db $10                                                               ;B2B311;
    dw $611B,$01FB                                                       ;B2B312;
    db $08                                                               ;B2B316;
    dw $610B,$01FD                                                       ;B2B317;
    db $04                                                               ;B2B31B;
    dw $6119,$01FD                                                       ;B2B31C;
    db $FC                                                               ;B2B320;
    dw $6109                                                             ;B2B321;

Spitemaps_PirateWalking_11:
    dw $000B,$01FE                                                       ;B2B323;
    db $16                                                               ;B2B327;
    dw $6126,$0006                                                       ;B2B328;
    db $16                                                               ;B2B32C;
    dw $6125,$01F4                                                       ;B2B32D;
    db $18                                                               ;B2B331;
    dw $6146,$01FC                                                       ;B2B332;
    db $18                                                               ;B2B336;
    dw $6145,$01F7                                                       ;B2B337;
    db $13                                                               ;B2B33B;
    dw $6134,$01F7                                                       ;B2B33C;
    db $0B                                                               ;B2B340;
    dw $6124,$01FC                                                       ;B2B341;
    db $07                                                               ;B2B345;
    dw $611B,$01FB                                                       ;B2B346;
    db $FF                                                               ;B2B34A;
    dw $610B,$81FC                                                       ;B2B34B;
    db $00                                                               ;B2B34F;
    dw $6107,$0000                                                       ;B2B350;
    db $12                                                               ;B2B354;
    dw $6134,$0000                                                       ;B2B355;
    db $0A                                                               ;B2B359;
    dw $6124                                                             ;B2B35A;

Spitemaps_PirateWalking_12:
    dw $000A,$01FE                                                       ;B2B35C;
    db $00                                                               ;B2B360;
    dw $610A,$0006                                                       ;B2B361;
    db $18                                                               ;B2B365;
    dw $6136,$000D                                                       ;B2B366;
    db $18                                                               ;B2B36A;
    dw $6135,$01F2                                                       ;B2B36B;
    db $18                                                               ;B2B36F;
    dw $6144,$01F2                                                       ;B2B370;
    db $10                                                               ;B2B374;
    dw $6143,$81F5                                                       ;B2B375;
    db $0A                                                               ;B2B379;
    dw $6122,$01FF                                                       ;B2B37A;
    db $08                                                               ;B2B37E;
    dw $611B,$0004                                                       ;B2B37F;
    db $13                                                               ;B2B383;
    dw $6130,$0005                                                       ;B2B384;
    db $0B                                                               ;B2B388;
    dw $6120,$81FC                                                       ;B2B389;
    db $00                                                               ;B2B38D;
    dw $6107                                                             ;B2B38E;

Spitemaps_PirateWalking_13:
    dw $000B,$0001                                                       ;B2B390;
    db $13                                                               ;B2B394;
    dw $6131,$0001                                                       ;B2B395;
    db $0B                                                               ;B2B399;
    dw $6121,$01F3                                                       ;B2B39A;
    db $17                                                               ;B2B39E;
    dw $6144,$01F3                                                       ;B2B39F;
    db $0F                                                               ;B2B3A3;
    dw $6143,$81F6                                                       ;B2B3A4;
    db $08                                                               ;B2B3A8;
    dw $6122,$01FD                                                       ;B2B3A9;
    db $06                                                               ;B2B3AD;
    dw $611A,$01FD                                                       ;B2B3AE;
    db $FE                                                               ;B2B3B2;
    dw $610A,$0002                                                       ;B2B3B3;
    db $18                                                               ;B2B3B7;
    dw $6126,$000A                                                       ;B2B3B8;
    db $18                                                               ;B2B3BC;
    dw $6125,$0000                                                       ;B2B3BD;
    db $07                                                               ;B2B3C1;
    dw $6119,$0000                                                       ;B2B3C2;
    db $FF                                                               ;B2B3C6;
    dw $6109                                                             ;B2B3C7;

Spitemaps_PirateWalking_14:
    dw $000C,$01FD                                                       ;B2B3C9;
    db $06                                                               ;B2B3CD;
    dw $6119,$01FD                                                       ;B2B3CE;
    db $FE                                                               ;B2B3D2;
    dw $6109,$01F6                                                       ;B2B3D3;
    db $19                                                               ;B2B3D7;
    dw $6144,$01F6                                                       ;B2B3D8;
    db $11                                                               ;B2B3DC;
    dw $6143,$01FC                                                       ;B2B3DD;
    db $11                                                               ;B2B3E1;
    dw $611B,$01FC                                                       ;B2B3E2;
    db $09                                                               ;B2B3E6;
    dw $610B,$01FB                                                       ;B2B3E7;
    db $18                                                               ;B2B3EB;
    dw $6126,$0003                                                       ;B2B3EC;
    db $18                                                               ;B2B3F0;
    dw $6125,$01FA                                                       ;B2B3F1;
    db $15                                                               ;B2B3F5;
    dw $6131,$01FA                                                       ;B2B3F6;
    db $0D                                                               ;B2B3FA;
    dw $6121,$01FC                                                       ;B2B3FB;
    db $08                                                               ;B2B3FF;
    dw $611A,$01FC                                                       ;B2B400;
    db $00                                                               ;B2B404;
    dw $610A                                                             ;B2B405;

Spitemaps_PirateWalking_15:
    dw $000B,$01FE                                                       ;B2B407;
    db $16                                                               ;B2B40B;
    dw $6126,$0006                                                       ;B2B40C;
    db $16                                                               ;B2B410;
    dw $6125,$81FA                                                       ;B2B411;
    db $00                                                               ;B2B415;
    dw $6107,$0000                                                       ;B2B416;
    db $12                                                               ;B2B41A;
    dw $6134,$0000                                                       ;B2B41B;
    db $0A                                                               ;B2B41F;
    dw $6124,$01F4                                                       ;B2B420;
    db $18                                                               ;B2B424;
    dw $6146,$01FC                                                       ;B2B425;
    db $18                                                               ;B2B429;
    dw $6145,$01F7                                                       ;B2B42A;
    db $13                                                               ;B2B42E;
    dw $6134,$01F7                                                       ;B2B42F;
    db $0B                                                               ;B2B433;
    dw $6124,$01FC                                                       ;B2B434;
    db $07                                                               ;B2B438;
    dw $611B,$01FB                                                       ;B2B439;
    db $FF                                                               ;B2B43D;
    dw $610B                                                             ;B2B43E;

Spitemaps_PirateWalking_16_Ninja_3:
    dw $000A,$0000                                                       ;B2B440;
    db $11                                                               ;B2B444;
    dw $6134,$01FC                                                       ;B2B445;
    db $FE                                                               ;B2B449;
    dw $6109,$01FC                                                       ;B2B44A;
    db $06                                                               ;B2B44E;
    dw $6119,$01F5                                                       ;B2B44F;
    db $15                                                               ;B2B453;
    dw $6126,$01FC                                                       ;B2B454;
    db $15                                                               ;B2B458;
    dw $6125,$81FB                                                       ;B2B459;
    db $FF                                                               ;B2B45D;
    dw $6107,$81F5                                                       ;B2B45E;
    db $0A                                                               ;B2B462;
    dw $6122,$01FE                                                       ;B2B463;
    db $15                                                               ;B2B467;
    dw $6126,$0006                                                       ;B2B468;
    db $15                                                               ;B2B46C;
    dw $6125,$0000                                                       ;B2B46D;
    db $09                                                               ;B2B471;
    dw $6124                                                             ;B2B472;

UNUSED_Spitemaps_SpacePirate_B2B474:
    dw $000A,$81F9                                                       ;B2B474;
    db $FF                                                               ;B2B478;
    dw $6107,$01F4                                                       ;B2B479;
    db $11                                                               ;B2B47D;
    dw $6144,$01F4                                                       ;B2B47E;
    db $09                                                               ;B2B482;
    dw $6143,$0001                                                       ;B2B483;
    db $09                                                               ;B2B487;
    dw $A149,$01F9                                                       ;B2B488;
    db $09                                                               ;B2B48C;
    dw $A148,$81FC                                                       ;B2B48D;
    db $FF                                                               ;B2B491;
    dw $6107,$0003                                                       ;B2B492;
    db $0B                                                               ;B2B496;
    dw $A149,$01FB                                                       ;B2B497;
    db $0B                                                               ;B2B49B;
    dw $A148,$01FA                                                       ;B2B49C;
    db $13                                                               ;B2B4A0;
    dw $6144,$01FA                                                       ;B2B4A1;
    db $0B                                                               ;B2B4A5;
    dw $6143                                                             ;B2B4A6;

Spitemaps_PirateWalking_17_Ninja_4:
    dw $000A,$01FC                                                       ;B2B4A8;
    db $08                                                               ;B2B4AC;
    dw $6119,$01FC                                                       ;B2B4AD;
    db $00                                                               ;B2B4B1;
    dw $6109,$81FC                                                       ;B2B4B2;
    db $01                                                               ;B2B4B6;
    dw $6107,$0002                                                       ;B2B4B7;
    db $09                                                               ;B2B4BB;
    dw $6124,$0001                                                       ;B2B4BC;
    db $11                                                               ;B2B4C0;
    dw $6134,$01F6                                                       ;B2B4C1;
    db $15                                                               ;B2B4C5;
    dw $6126,$01FC                                                       ;B2B4C6;
    db $15                                                               ;B2B4CA;
    dw $6125,$81F6                                                       ;B2B4CB;
    db $0B                                                               ;B2B4CF;
    dw $6122,$01FF                                                       ;B2B4D0;
    db $15                                                               ;B2B4D4;
    dw $6126,$0006                                                       ;B2B4D5;
    db $15                                                               ;B2B4D9;
    dw $6125                                                             ;B2B4DA;

Spitemaps_PirateWalking_18:
    dw $0004,$0000                                                       ;B2B4DC;
    db $00                                                               ;B2B4E0;
    dw $6151,$01F8                                                       ;B2B4E1;
    db $00                                                               ;B2B4E5;
    dw $2151,$0000                                                       ;B2B4E6;
    db $F8                                                               ;B2B4EA;
    dw $6150,$01F8                                                       ;B2B4EB;
    db $F8                                                               ;B2B4EF;
    dw $2150                                                             ;B2B4F0;

Spitemaps_PirateWalking_19:
    dw $0004,$0000                                                       ;B2B4F2;
    db $00                                                               ;B2B4F6;
    dw $6153,$0000                                                       ;B2B4F7;
    db $F8                                                               ;B2B4FB;
    dw $6152,$01F8                                                       ;B2B4FC;
    db $00                                                               ;B2B500;
    dw $2153,$01F8                                                       ;B2B501;
    db $F8                                                               ;B2B505;
    dw $2152                                                             ;B2B506;

Spitemaps_PirateWalking_1A:
    dw $0009,$01FB                                                       ;B2B508;
    db $FB                                                               ;B2B50C;
    dw $2113,$01FB                                                       ;B2B50D;
    db $F3                                                               ;B2B511;
    dw $2103,$0000                                                       ;B2B512;
    db $F8                                                               ;B2B516;
    dw $213F,$01F8                                                       ;B2B517;
    db $F8                                                               ;B2B51B;
    dw $213E,$01FF                                                       ;B2B51C;
    db $F0                                                               ;B2B520;
    dw $212F,$01F7                                                       ;B2B521;
    db $F0                                                               ;B2B525;
    dw $212E,$81EA                                                       ;B2B526;
    db $00                                                               ;B2B52A;
    dw $2127,$81F2                                                       ;B2B52B;
    db $00                                                               ;B2B52F;
    dw $2128,$81F0                                                       ;B2B530;
    db $EB                                                               ;B2B534;
    dw $210E                                                             ;B2B535;

Spitemaps_PirateWalking_1B:
    dw $0009,$01FA                                                       ;B2B537;
    db $FB                                                               ;B2B53B;
    dw $2113,$01FA                                                       ;B2B53C;
    db $F3                                                               ;B2B540;
    dw $2103,$0000                                                       ;B2B541;
    db $F8                                                               ;B2B545;
    dw $213F,$01F8                                                       ;B2B546;
    db $F8                                                               ;B2B54A;
    dw $213E,$01FE                                                       ;B2B54B;
    db $F0                                                               ;B2B54F;
    dw $212F,$01F6                                                       ;B2B550;
    db $F0                                                               ;B2B554;
    dw $212E,$81E9                                                       ;B2B555;
    db $00                                                               ;B2B559;
    dw $2127,$81F1                                                       ;B2B55A;
    db $00                                                               ;B2B55E;
    dw $2128,$81EE                                                       ;B2B55F;
    db $EC                                                               ;B2B563;
    dw $210E                                                             ;B2B564;

Spitemaps_PirateWalking_1C:
    dw $000A,$01F8                                                       ;B2B566;
    db $00                                                               ;B2B56A;
    dw $214C,$01F0                                                       ;B2B56B;
    db $00                                                               ;B2B56F;
    dw $214B,$01E8                                                       ;B2B570;
    db $00                                                               ;B2B574;
    dw $214A,$01F9                                                       ;B2B575;
    db $FB                                                               ;B2B579;
    dw $2113,$01F9                                                       ;B2B57A;
    db $F3                                                               ;B2B57E;
    dw $2103,$01FF                                                       ;B2B57F;
    db $F8                                                               ;B2B583;
    dw $213F,$01F7                                                       ;B2B584;
    db $F8                                                               ;B2B588;
    dw $213E,$01FD                                                       ;B2B589;
    db $F0                                                               ;B2B58D;
    dw $212F,$01F5                                                       ;B2B58E;
    db $F0                                                               ;B2B592;
    dw $212E,$81EC                                                       ;B2B593;
    db $ED                                                               ;B2B597;
    dw $210E                                                             ;B2B598;

Spitemaps_PirateWalking_1D:
    dw $0009,$81EE                                                       ;B2B59A;
    db $F8                                                               ;B2B59E;
    dw $212B,$81E6                                                       ;B2B59F;
    db $F8                                                               ;B2B5A3;
    dw $212A,$01F8                                                       ;B2B5A4;
    db $FB                                                               ;B2B5A8;
    dw $2113,$01F8                                                       ;B2B5A9;
    db $F3                                                               ;B2B5AD;
    dw $2103,$01FF                                                       ;B2B5AE;
    db $F8                                                               ;B2B5B2;
    dw $213F,$01F7                                                       ;B2B5B3;
    db $F8                                                               ;B2B5B7;
    dw $213E,$01FD                                                       ;B2B5B8;
    db $F0                                                               ;B2B5BC;
    dw $212F,$01F5                                                       ;B2B5BD;
    db $F0                                                               ;B2B5C1;
    dw $212E,$81EB                                                       ;B2B5C2;
    db $EE                                                               ;B2B5C6;
    dw $210E                                                             ;B2B5C7;

Spitemaps_PirateWalking_1E:
    dw $0009,$81EE                                                       ;B2B5C9;
    db $FA                                                               ;B2B5CD;
    dw $212B,$81E6                                                       ;B2B5CE;
    db $FA                                                               ;B2B5D2;
    dw $212A,$01F7                                                       ;B2B5D3;
    db $FA                                                               ;B2B5D7;
    dw $2113,$01F7                                                       ;B2B5D8;
    db $F3                                                               ;B2B5DC;
    dw $2103,$01FE                                                       ;B2B5DD;
    db $F8                                                               ;B2B5E1;
    dw $213F,$01F6                                                       ;B2B5E2;
    db $F8                                                               ;B2B5E6;
    dw $213E,$01FC                                                       ;B2B5E7;
    db $F0                                                               ;B2B5EB;
    dw $212F,$01F4                                                       ;B2B5EC;
    db $F0                                                               ;B2B5F0;
    dw $212E,$81EA                                                       ;B2B5F1;
    db $EF                                                               ;B2B5F5;
    dw $210E                                                             ;B2B5F6;

Spitemaps_PirateWalking_1F:
    dw $0009,$81EE                                                       ;B2B5F8;
    db $FB                                                               ;B2B5FC;
    dw $212B,$81E6                                                       ;B2B5FD;
    db $FB                                                               ;B2B601;
    dw $212A,$01F7                                                       ;B2B602;
    db $FB                                                               ;B2B606;
    dw $2113,$01F6                                                       ;B2B607;
    db $F4                                                               ;B2B60B;
    dw $2103,$01FE                                                       ;B2B60C;
    db $F8                                                               ;B2B610;
    dw $213F,$01F5                                                       ;B2B611;
    db $F9                                                               ;B2B615;
    dw $213E,$01FB                                                       ;B2B616;
    db $F1                                                               ;B2B61A;
    dw $212F,$01F3                                                       ;B2B61B;
    db $F1                                                               ;B2B61F;
    dw $212E,$81EA                                                       ;B2B620;
    db $F0                                                               ;B2B624;
    dw $210E                                                             ;B2B625;

Spitemaps_PirateWalking_20:
    dw $0009,$01FD                                                       ;B2B627;
    db $FB                                                               ;B2B62B;
    dw $6113,$01FD                                                       ;B2B62C;
    db $F3                                                               ;B2B630;
    dw $6103,$01F8                                                       ;B2B631;
    db $F8                                                               ;B2B635;
    dw $613F,$0000                                                       ;B2B636;
    db $F8                                                               ;B2B63A;
    dw $613E,$01F9                                                       ;B2B63B;
    db $F0                                                               ;B2B63F;
    dw $612F,$0001                                                       ;B2B640;
    db $F0                                                               ;B2B644;
    dw $612E,$8006                                                       ;B2B645;
    db $00                                                               ;B2B649;
    dw $6127,$81FE                                                       ;B2B64A;
    db $00                                                               ;B2B64E;
    dw $6128,$8000                                                       ;B2B64F;
    db $EB                                                               ;B2B653;
    dw $610E                                                             ;B2B654;

Spitemaps_PirateWalking_21:
    dw $0009,$01FE                                                       ;B2B656;
    db $FB                                                               ;B2B65A;
    dw $6113,$01FE                                                       ;B2B65B;
    db $F3                                                               ;B2B65F;
    dw $6103,$01F8                                                       ;B2B660;
    db $F8                                                               ;B2B664;
    dw $613F,$0000                                                       ;B2B665;
    db $F8                                                               ;B2B669;
    dw $613E,$01FA                                                       ;B2B66A;
    db $F0                                                               ;B2B66E;
    dw $612F,$0002                                                       ;B2B66F;
    db $F0                                                               ;B2B673;
    dw $612E,$8007                                                       ;B2B674;
    db $00                                                               ;B2B678;
    dw $6127,$81FF                                                       ;B2B679;
    db $00                                                               ;B2B67D;
    dw $6128,$8002                                                       ;B2B67E;
    db $EC                                                               ;B2B682;
    dw $610E                                                             ;B2B683;

Spitemaps_PirateWalking_22:
    dw $000A,$0000                                                       ;B2B685;
    db $00                                                               ;B2B689;
    dw $614C,$0008                                                       ;B2B68A;
    db $00                                                               ;B2B68E;
    dw $614B,$0010                                                       ;B2B68F;
    db $00                                                               ;B2B693;
    dw $614A,$01FF                                                       ;B2B694;
    db $FB                                                               ;B2B698;
    dw $6113,$01FF                                                       ;B2B699;
    db $F3                                                               ;B2B69D;
    dw $6103,$01F9                                                       ;B2B69E;
    db $F8                                                               ;B2B6A2;
    dw $613F,$0001                                                       ;B2B6A3;
    db $F8                                                               ;B2B6A7;
    dw $613E,$01FB                                                       ;B2B6A8;
    db $F0                                                               ;B2B6AC;
    dw $612F,$0003                                                       ;B2B6AD;
    db $F0                                                               ;B2B6B1;
    dw $612E,$8004                                                       ;B2B6B2;
    db $ED                                                               ;B2B6B6;
    dw $610E                                                             ;B2B6B7;

Spitemaps_PirateWalking_23:
    dw $0009,$8002                                                       ;B2B6B9;
    db $F8                                                               ;B2B6BD;
    dw $612B,$800A                                                       ;B2B6BE;
    db $F8                                                               ;B2B6C2;
    dw $612A,$0000                                                       ;B2B6C3;
    db $FB                                                               ;B2B6C7;
    dw $6113,$0000                                                       ;B2B6C8;
    db $F3                                                               ;B2B6CC;
    dw $6103,$01F9                                                       ;B2B6CD;
    db $F8                                                               ;B2B6D1;
    dw $613F,$0001                                                       ;B2B6D2;
    db $F8                                                               ;B2B6D6;
    dw $613E,$01FB                                                       ;B2B6D7;
    db $F0                                                               ;B2B6DB;
    dw $612F,$0003                                                       ;B2B6DC;
    db $F0                                                               ;B2B6E0;
    dw $612E,$8005                                                       ;B2B6E1;
    db $EE                                                               ;B2B6E5;
    dw $610E                                                             ;B2B6E6;

Spitemaps_PirateWalking_24:
    dw $0009,$8002                                                       ;B2B6E8;
    db $FA                                                               ;B2B6EC;
    dw $612B,$800A                                                       ;B2B6ED;
    db $FA                                                               ;B2B6F1;
    dw $612A,$0001                                                       ;B2B6F2;
    db $FA                                                               ;B2B6F6;
    dw $6113,$0001                                                       ;B2B6F7;
    db $F3                                                               ;B2B6FB;
    dw $6103,$01FA                                                       ;B2B6FC;
    db $F8                                                               ;B2B700;
    dw $613F,$0002                                                       ;B2B701;
    db $F8                                                               ;B2B705;
    dw $613E,$01FC                                                       ;B2B706;
    db $F0                                                               ;B2B70A;
    dw $612F,$0004                                                       ;B2B70B;
    db $F0                                                               ;B2B70F;
    dw $612E,$8006                                                       ;B2B710;
    db $EF                                                               ;B2B714;
    dw $610E                                                             ;B2B715;

Spitemaps_PirateWalking_25:
    dw $0009,$8002                                                       ;B2B717;
    db $FB                                                               ;B2B71B;
    dw $612B,$800A                                                       ;B2B71C;
    db $FB                                                               ;B2B720;
    dw $612A,$0001                                                       ;B2B721;
    db $FB                                                               ;B2B725;
    dw $6113,$0002                                                       ;B2B726;
    db $F4                                                               ;B2B72A;
    dw $6103,$01FA                                                       ;B2B72B;
    db $F8                                                               ;B2B72F;
    dw $613F,$0003                                                       ;B2B730;
    db $F9                                                               ;B2B734;
    dw $613E,$01FD                                                       ;B2B735;
    db $F1                                                               ;B2B739;
    dw $612F,$0005                                                       ;B2B73A;
    db $F1                                                               ;B2B73E;
    dw $612E,$8006                                                       ;B2B73F;
    db $F0                                                               ;B2B743;
    dw $610E                                                             ;B2B744;

Spitemaps_PirateNinja_5:
    dw $000A,$81F4                                                       ;B2B746;
    db $00                                                               ;B2B74A;
    dw $2107,$01FD                                                       ;B2B74B;
    db $08                                                               ;B2B74F;
    dw $211B,$01FD                                                       ;B2B750;
    db $00                                                               ;B2B754;
    dw $210B,$01ED                                                       ;B2B755;
    db $16                                                               ;B2B759;
    dw $2136,$8000                                                       ;B2B75A;
    db $08                                                               ;B2B75E;
    dw $217E,$01F1                                                       ;B2B75F;
    db $13                                                               ;B2B763;
    dw $2130,$01F1                                                       ;B2B764;
    db $0B                                                               ;B2B768;
    dw $2120,$01E6                                                       ;B2B769;
    db $16                                                               ;B2B76D;
    dw $2135,$000D                                                       ;B2B76E;
    db $16                                                               ;B2B772;
    dw $2144,$000C                                                       ;B2B773;
    db $0E                                                               ;B2B777;
    dw $2143                                                             ;B2B778;

Spitemaps_PirateNinja_6:
    dw $000C,$000B                                                       ;B2B77A;
    db $10                                                               ;B2B77E;
    dw $218D,$000B                                                       ;B2B77F;
    db $08                                                               ;B2B783;
    dw $217D,$0008                                                       ;B2B784;
    db $09                                                               ;B2B788;
    dw $216D,$0000                                                       ;B2B789;
    db $09                                                               ;B2B78D;
    dw $216C,$01F9                                                       ;B2B78E;
    db $12                                                               ;B2B792;
    dw $2131,$01F9                                                       ;B2B793;
    db $0A                                                               ;B2B797;
    dw $2121,$01F7                                                       ;B2B798;
    db $18                                                               ;B2B79C;
    dw $2126,$01EF                                                       ;B2B79D;
    db $18                                                               ;B2B7A1;
    dw $2125,$01FA                                                       ;B2B7A2;
    db $06                                                               ;B2B7A6;
    dw $2119,$01FA                                                       ;B2B7A7;
    db $FE                                                               ;B2B7AB;
    dw $2109,$01FC                                                       ;B2B7AC;
    db $06                                                               ;B2B7B0;
    dw $211A,$01FC                                                       ;B2B7B1;
    db $FE                                                               ;B2B7B5;
    dw $210A                                                             ;B2B7B6;

Spitemaps_PirateNinja_7:
    dw $000C,$01FC                                                       ;B2B7B8;
    db $06                                                               ;B2B7BC;
    dw $211A,$01FC                                                       ;B2B7BD;
    db $FE                                                               ;B2B7C1;
    dw $210A,$01F9                                                       ;B2B7C2;
    db $05                                                               ;B2B7C6;
    dw $2119,$01FD                                                       ;B2B7C7;
    db $18                                                               ;B2B7CB;
    dw $2126,$01FE                                                       ;B2B7CC;
    db $14                                                               ;B2B7D0;
    dw $2131,$01FE                                                       ;B2B7D1;
    db $0C                                                               ;B2B7D5;
    dw $2121,$01F9                                                       ;B2B7D6;
    db $FD                                                               ;B2B7DA;
    dw $2109,$01F5                                                       ;B2B7DB;
    db $18                                                               ;B2B7DF;
    dw $2125,$0001                                                       ;B2B7E0;
    db $09                                                               ;B2B7E4;
    dw $216F,$01F9                                                       ;B2B7E5;
    db $09                                                               ;B2B7E9;
    dw $216E,$0005                                                       ;B2B7EA;
    db $11                                                               ;B2B7EE;
    dw $2144,$0005                                                       ;B2B7EF;
    db $09                                                               ;B2B7F3;
    dw $2143                                                             ;B2B7F4;

Spitemaps_PirateNinja_8:
    dw $000B,$01FA                                                       ;B2B7F6;
    db $14                                                               ;B2B7FA;
    dw $2146,$01F2                                                       ;B2B7FB;
    db $14                                                               ;B2B7FF;
    dw $2145,$0006                                                       ;B2B800;
    db $18                                                               ;B2B804;
    dw $2146,$01FE                                                       ;B2B805;
    db $18                                                               ;B2B809;
    dw $2145,$0003                                                       ;B2B80A;
    db $13                                                               ;B2B80E;
    dw $2134,$0003                                                       ;B2B80F;
    db $0B                                                               ;B2B813;
    dw $2124,$01FE                                                       ;B2B814;
    db $07                                                               ;B2B818;
    dw $211B,$01FF                                                       ;B2B819;
    db $FF                                                               ;B2B81D;
    dw $210B,$81F5                                                       ;B2B81E;
    db $FD                                                               ;B2B822;
    dw $2107,$01F9                                                       ;B2B823;
    db $0F                                                               ;B2B827;
    dw $2134,$01F9                                                       ;B2B828;
    db $07                                                               ;B2B82C;
    dw $2124                                                             ;B2B82D;

Spitemaps_PirateNinja_9:
    dw $000A,$01FC                                                       ;B2B82F;
    db $08                                                               ;B2B833;
    dw $211B,$01FC                                                       ;B2B834;
    db $00                                                               ;B2B838;
    dw $210A,$01F0                                                       ;B2B839;
    db $12                                                               ;B2B83D;
    dw $2130,$81FF                                                       ;B2B83E;
    db $08                                                               ;B2B842;
    dw $217E,$01EB                                                       ;B2B843;
    db $16                                                               ;B2B847;
    dw $2136,$01E4                                                       ;B2B848;
    db $16                                                               ;B2B84C;
    dw $2135,$000D                                                       ;B2B84D;
    db $16                                                               ;B2B851;
    dw $2144,$000C                                                       ;B2B852;
    db $0E                                                               ;B2B856;
    dw $2143,$01F0                                                       ;B2B857;
    db $0A                                                               ;B2B85B;
    dw $2120,$81F3                                                       ;B2B85C;
    db $FF                                                               ;B2B860;
    dw $2107                                                             ;B2B861;

Spitemaps_PirateNinja_A:
    dw $000C,$000A                                                       ;B2B863;
    db $0F                                                               ;B2B867;
    dw $218D,$000A                                                       ;B2B868;
    db $07                                                               ;B2B86C;
    dw $217D,$01F5                                                       ;B2B86D;
    db $18                                                               ;B2B871;
    dw $2126,$01ED                                                       ;B2B872;
    db $18                                                               ;B2B876;
    dw $2125,$0006                                                       ;B2B877;
    db $09                                                               ;B2B87B;
    dw $216D,$01FE                                                       ;B2B87C;
    db $09                                                               ;B2B880;
    dw $216C,$01F6                                                       ;B2B881;
    db $13                                                               ;B2B885;
    dw $2131,$01F7                                                       ;B2B886;
    db $0B                                                               ;B2B88A;
    dw $2121,$01FB                                                       ;B2B88B;
    db $06                                                               ;B2B88F;
    dw $211A,$01FB                                                       ;B2B890;
    db $FE                                                               ;B2B894;
    dw $210A,$01F8                                                       ;B2B895;
    db $07                                                               ;B2B899;
    dw $2119,$01F8                                                       ;B2B89A;
    db $FF                                                               ;B2B89E;
    dw $2109                                                             ;B2B89F;

Spitemaps_PirateNinja_B:
    dw $000C,$0007                                                       ;B2B8A1;
    db $12                                                               ;B2B8A5;
    dw $2144,$0007                                                       ;B2B8A6;
    db $0A                                                               ;B2B8AA;
    dw $2143,$0002                                                       ;B2B8AB;
    db $0A                                                               ;B2B8AF;
    dw $216F,$01FA                                                       ;B2B8B0;
    db $0A                                                               ;B2B8B4;
    dw $216E,$01FA                                                       ;B2B8B5;
    db $06                                                               ;B2B8B9;
    dw $2119,$01FB                                                       ;B2B8BA;
    db $FE                                                               ;B2B8BE;
    dw $2109,$01FD                                                       ;B2B8BF;
    db $18                                                               ;B2B8C3;
    dw $2126,$01F5                                                       ;B2B8C4;
    db $18                                                               ;B2B8C8;
    dw $2125,$01FE                                                       ;B2B8C9;
    db $15                                                               ;B2B8CD;
    dw $2131,$01FE                                                       ;B2B8CE;
    db $0D                                                               ;B2B8D2;
    dw $2121,$01FC                                                       ;B2B8D3;
    db $08                                                               ;B2B8D7;
    dw $211A,$01FC                                                       ;B2B8D8;
    db $00                                                               ;B2B8DC;
    dw $210A                                                             ;B2B8DD;

Spitemaps_PirateNinja_C:
    dw $000B,$01FA                                                       ;B2B8DF;
    db $14                                                               ;B2B8E3;
    dw $2146,$01F2                                                       ;B2B8E4;
    db $14                                                               ;B2B8E8;
    dw $2145,$81F6                                                       ;B2B8E9;
    db $FC                                                               ;B2B8ED;
    dw $2107,$01F8                                                       ;B2B8EE;
    db $0E                                                               ;B2B8F2;
    dw $2134,$01F8                                                       ;B2B8F3;
    db $06                                                               ;B2B8F7;
    dw $2124,$0004                                                       ;B2B8F8;
    db $18                                                               ;B2B8FC;
    dw $2146,$01FC                                                       ;B2B8FD;
    db $18                                                               ;B2B901;
    dw $2145,$0001                                                       ;B2B902;
    db $13                                                               ;B2B906;
    dw $2134,$0001                                                       ;B2B907;
    db $0B                                                               ;B2B90B;
    dw $2124,$01FC                                                       ;B2B90C;
    db $07                                                               ;B2B910;
    dw $211B,$01FD                                                       ;B2B911;
    db $FF                                                               ;B2B915;
    dw $210B                                                             ;B2B916;

Spitemaps_PirateWalking_26_Ninja_D:
    dw $0009,$01FC                                                       ;B2B918;
    db $FC                                                               ;B2B91C;
    dw $6112,$01FC                                                       ;B2B91D;
    db $F4                                                               ;B2B921;
    dw $6102,$81EC                                                       ;B2B922;
    db $01                                                               ;B2B926;
    dw $2127,$81F4                                                       ;B2B927;
    db $01                                                               ;B2B92B;
    dw $2128,$81F8                                                       ;B2B92C;
    db $F0                                                               ;B2B930;
    dw $212E,$81F1                                                       ;B2B931;
    db $EA                                                               ;B2B935;
    dw $210E,$01F6                                                       ;B2B936;
    db $FE                                                               ;B2B93A;
    dw $214C,$01EE                                                       ;B2B93B;
    db $FE                                                               ;B2B93F;
    dw $214B,$01E6                                                       ;B2B940;
    db $FE                                                               ;B2B944;
    dw $214A                                                             ;B2B945;

Spitemaps_PirateWalking_27_Ninja_E:
    dw $0009,$81EB                                                       ;B2B947;
    db $00                                                               ;B2B94B;
    dw $2127,$81F3                                                       ;B2B94C;
    db $00                                                               ;B2B950;
    dw $2128,$01FB                                                       ;B2B951;
    db $FB                                                               ;B2B955;
    dw $2113,$01FA                                                       ;B2B956;
    db $F3                                                               ;B2B95A;
    dw $2103,$81F8                                                       ;B2B95B;
    db $EF                                                               ;B2B95F;
    dw $212E,$81F1                                                       ;B2B960;
    db $EA                                                               ;B2B964;
    dw $210E,$01F8                                                       ;B2B965;
    db $FD                                                               ;B2B969;
    dw $214C,$01F0                                                       ;B2B96A;
    db $FD                                                               ;B2B96E;
    dw $214B,$01E8                                                       ;B2B96F;
    db $FD                                                               ;B2B973;
    dw $214A                                                             ;B2B974;

Spitemaps_PirateWalking_28_Ninja_F:
    dw $0008,$81E9                                                       ;B2B976;
    db $FE                                                               ;B2B97A;
    dw $2127,$81F1                                                       ;B2B97B;
    db $FE                                                               ;B2B97F;
    dw $2128,$01FA                                                       ;B2B980;
    db $F8                                                               ;B2B984;
    dw $2113,$01FA                                                       ;B2B985;
    db $F0                                                               ;B2B989;
    dw $2103,$81F8                                                       ;B2B98A;
    db $EE                                                               ;B2B98E;
    dw $212E,$81F1                                                       ;B2B98F;
    db $E8                                                               ;B2B993;
    dw $210E,$01F3                                                       ;B2B994;
    db $FC                                                               ;B2B998;
    dw $214B,$01EB                                                       ;B2B999;
    db $FD                                                               ;B2B99D;
    dw $214A                                                             ;B2B99E;

Spitemaps_PirateWalking_29_Ninja_10:
    dw $0008,$81E8                                                       ;B2B9A0;
    db $00                                                               ;B2B9A4;
    dw $2127,$81F0                                                       ;B2B9A5;
    db $00                                                               ;B2B9A9;
    dw $2128,$01FA                                                       ;B2B9AA;
    db $FA                                                               ;B2B9AE;
    dw $2113,$01FA                                                       ;B2B9AF;
    db $F2                                                               ;B2B9B3;
    dw $2103,$81F8                                                       ;B2B9B4;
    db $EF                                                               ;B2B9B8;
    dw $212E,$81F1                                                       ;B2B9B9;
    db $E9                                                               ;B2B9BD;
    dw $210E,$01F5                                                       ;B2B9BE;
    db $FE                                                               ;B2B9C2;
    dw $214B,$01ED                                                       ;B2B9C3;
    db $FF                                                               ;B2B9C7;
    dw $214A                                                             ;B2B9C8;

Spitemaps_PirateNinja_11:
    dw $0007,$01F6                                                       ;B2B9CA;
    db $FC                                                               ;B2B9CE;
    dw $214C,$01EE                                                       ;B2B9CF;
    db $FC                                                               ;B2B9D3;
    dw $214B,$01E6                                                       ;B2B9D4;
    db $FC                                                               ;B2B9D8;
    dw $214A,$01FB                                                       ;B2B9D9;
    db $FA                                                               ;B2B9DD;
    dw $2112,$01FB                                                       ;B2B9DE;
    db $F2                                                               ;B2B9E2;
    dw $2102,$81F8                                                       ;B2B9E3;
    db $EF                                                               ;B2B9E7;
    dw $212E,$81F1                                                       ;B2B9E8;
    db $E9                                                               ;B2B9EC;
    dw $210E                                                             ;B2B9ED;

Spitemaps_PirateNinja_12:
    dw $0007,$81F4                                                       ;B2B9EF;
    db $F2                                                               ;B2B9F3;
    dw $2100,$01E2                                                       ;B2B9F4;
    db $F3                                                               ;B2B9F8;
    dw $212A,$81EA                                                       ;B2B9F9;
    db $F3                                                               ;B2B9FD;
    dw $212B,$81F8                                                       ;B2B9FE;
    db $EF                                                               ;B2BA02;
    dw $212E,$81F1                                                       ;B2BA03;
    db $E9                                                               ;B2BA07;
    dw $210E,$01F2                                                       ;B2BA08;
    db $FD                                                               ;B2BA0C;
    dw $214B,$01EA                                                       ;B2BA0D;
    db $FD                                                               ;B2BA11;
    dw $214A                                                             ;B2BA12;

Spitemaps_PirateNinja_13:
    dw $0009,$01F1                                                       ;B2BA14;
    db $FD                                                               ;B2BA18;
    dw $214B,$01E9                                                       ;B2BA19;
    db $FD                                                               ;B2BA1D;
    dw $214A,$01E0                                                       ;B2BA1E;
    db $E9                                                               ;B2BA22;
    dw $212A,$81E8                                                       ;B2BA23;
    db $E9                                                               ;B2BA27;
    dw $212B,$01FB                                                       ;B2BA28;
    db $F1                                                               ;B2BA2C;
    dw $214F,$01F3                                                       ;B2BA2D;
    db $F1                                                               ;B2BA31;
    dw $214E,$81F8                                                       ;B2BA32;
    db $EF                                                               ;B2BA36;
    dw $212E,$81F1                                                       ;B2BA37;
    db $E9                                                               ;B2BA3B;
    dw $210E,$01F6                                                       ;B2BA3C;
    db $FD                                                               ;B2BA40;
    dw $214C                                                             ;B2BA41;

Spitemaps_PirateNinja_14:
    dw $000A,$01F0                                                       ;B2BA43;
    db $FD                                                               ;B2BA47;
    dw $214B,$01E8                                                       ;B2BA48;
    db $FD                                                               ;B2BA4C;
    dw $214A,$01FA                                                       ;B2BA4D;
    db $E4                                                               ;B2BA51;
    dw $214D,$01FA                                                       ;B2BA52;
    db $DC                                                               ;B2BA56;
    dw $213D,$01FA                                                       ;B2BA57;
    db $D4                                                               ;B2BA5B;
    dw $212D,$01FB                                                       ;B2BA5C;
    db $E8                                                               ;B2BA60;
    dw $E113,$01FB                                                       ;B2BA61;
    db $F0                                                               ;B2BA65;
    dw $E103,$81F8                                                       ;B2BA66;
    db $F0                                                               ;B2BA6A;
    dw $212E,$81F1                                                       ;B2BA6B;
    db $EA                                                               ;B2BA6F;
    dw $210E,$01F6                                                       ;B2BA70;
    db $FD                                                               ;B2BA74;
    dw $214C                                                             ;B2BA75;

Spitemaps_PirateNinja_15:
    dw $0014,$01F6                                                       ;B2BA77;
    db $12                                                               ;B2BA7B;
    dw $2134,$01F6                                                       ;B2BA7C;
    db $0A                                                               ;B2BA80;
    dw $2124,$01F7                                                       ;B2BA81;
    db $15                                                               ;B2BA85;
    dw $2126,$01E2                                                       ;B2BA86;
    db $F4                                                               ;B2BA8A;
    dw $212A,$81EA                                                       ;B2BA8B;
    db $F4                                                               ;B2BA8F;
    dw $212B,$01F7                                                       ;B2BA90;
    db $FA                                                               ;B2BA94;
    dw $2112,$01F8                                                       ;B2BA95;
    db $F2                                                               ;B2BA99;
    dw $2102,$0002                                                       ;B2BA9A;
    db $12                                                               ;B2BA9E;
    dw $2134,$01FD                                                       ;B2BA9F;
    db $16                                                               ;B2BAA3;
    dw $2125,$01FD                                                       ;B2BAA4;
    db $07                                                               ;B2BAA8;
    dw $211A,$01FE                                                       ;B2BAA9;
    db $FF                                                               ;B2BAAD;
    dw $210A,$0001                                                       ;B2BAAE;
    db $0A                                                               ;B2BAB2;
    dw $2124,$81F6                                                       ;B2BAB3;
    db $F0                                                               ;B2BAB7;
    dw $212E,$81F0                                                       ;B2BAB8;
    db $EA                                                               ;B2BABC;
    dw $210E,$01EF                                                       ;B2BABD;
    db $16                                                               ;B2BAC1;
    dw $2145,$81F3                                                       ;B2BAC2;
    db $FF                                                               ;B2BAC6;
    dw $2107,$01F6                                                       ;B2BAC7;
    db $FE                                                               ;B2BACB;
    dw $214C,$01EE                                                       ;B2BACC;
    db $FE                                                               ;B2BAD0;
    dw $214B,$01E6                                                       ;B2BAD1;
    db $FE                                                               ;B2BAD5;
    dw $214A,$0005                                                       ;B2BAD6;
    db $15                                                               ;B2BADA;
    dw $2126                                                             ;B2BADB;

Spitemaps_PirateNinja_16:
    dw $0013,$01F7                                                       ;B2BADD;
    db $08                                                               ;B2BAE1;
    dw $2124,$0007                                                       ;B2BAE2;
    db $16                                                               ;B2BAE6;
    dw $2146,$01FF                                                       ;B2BAE7;
    db $05                                                               ;B2BAEB;
    dw $211A,$01FF                                                       ;B2BAEC;
    db $FD                                                               ;B2BAF0;
    dw $210A,$01E2                                                       ;B2BAF1;
    db $F3                                                               ;B2BAF5;
    dw $212A,$81EA                                                       ;B2BAF6;
    db $F3                                                               ;B2BAFA;
    dw $212B,$81F2                                                       ;B2BAFB;
    db $F1                                                               ;B2BAFF;
    dw $2100,$81F6                                                       ;B2BB00;
    db $EF                                                               ;B2BB04;
    dw $212E,$81EF                                                       ;B2BB05;
    db $EA                                                               ;B2BB09;
    dw $210E,$01F8                                                       ;B2BB0A;
    db $16                                                               ;B2BB0E;
    dw $2146,$01F0                                                       ;B2BB0F;
    db $15                                                               ;B2BB13;
    dw $2145,$01FF                                                       ;B2BB14;
    db $15                                                               ;B2BB18;
    dw $2145,$0003                                                       ;B2BB19;
    db $10                                                               ;B2BB1D;
    dw $2134,$0002                                                       ;B2BB1E;
    db $08                                                               ;B2BB22;
    dw $2124,$81F4                                                       ;B2BB23;
    db $FE                                                               ;B2BB27;
    dw $2107,$01F7                                                       ;B2BB28;
    db $10                                                               ;B2BB2C;
    dw $2134,$01F5                                                       ;B2BB2D;
    db $FD                                                               ;B2BB31;
    dw $214C,$01ED                                                       ;B2BB32;
    db $FD                                                               ;B2BB36;
    dw $214B,$01E5                                                       ;B2BB37;
    db $FD                                                               ;B2BB3B;
    dw $214A                                                             ;B2BB3C;

Spitemaps_PirateNinja_17:
    dw $0014,$01F7                                                       ;B2BB3E;
    db $09                                                               ;B2BB42;
    dw $2124,$01F7                                                       ;B2BB43;
    db $06                                                               ;B2BB47;
    dw $2119,$01F7                                                       ;B2BB48;
    db $FF                                                               ;B2BB4C;
    dw $2109,$01E0                                                       ;B2BB4D;
    db $F5                                                               ;B2BB51;
    dw $212A,$81E8                                                       ;B2BB52;
    db $F5                                                               ;B2BB56;
    dw $212B,$81F1                                                       ;B2BB57;
    db $F3                                                               ;B2BB5B;
    dw $2100,$81F5                                                       ;B2BB5C;
    db $F0                                                               ;B2BB60;
    dw $212E,$81EE                                                       ;B2BB61;
    db $EB                                                               ;B2BB65;
    dw $210E,$01F8                                                       ;B2BB66;
    db $16                                                               ;B2BB6A;
    dw $2146,$01F0                                                       ;B2BB6B;
    db $16                                                               ;B2BB6F;
    dw $2145,$0006                                                       ;B2BB70;
    db $16                                                               ;B2BB74;
    dw $2146,$01FE                                                       ;B2BB75;
    db $16                                                               ;B2BB79;
    dw $2145,$0003                                                       ;B2BB7A;
    db $11                                                               ;B2BB7E;
    dw $2134,$0003                                                       ;B2BB7F;
    db $09                                                               ;B2BB83;
    dw $2124,$01FF                                                       ;B2BB84;
    db $07                                                               ;B2BB88;
    dw $211B,$01FF                                                       ;B2BB89;
    db $FF                                                               ;B2BB8D;
    dw $210B,$01F8                                                       ;B2BB8E;
    db $11                                                               ;B2BB92;
    dw $2134,$01F4                                                       ;B2BB93;
    db $FE                                                               ;B2BB97;
    dw $214C,$01EC                                                       ;B2BB98;
    db $FE                                                               ;B2BB9C;
    dw $214B,$01E4                                                       ;B2BB9D;
    db $FE                                                               ;B2BBA1;
    dw $214A                                                             ;B2BBA2;

UNUSED_Spitemaps_SpacePirate_B2BBA4:
    dw $000E,$81F4                                                       ;B2BBA4;
    db $FF                                                               ;B2BBA8;
    dw $2128,$81EC                                                       ;B2BBA9;
    db $FF                                                               ;B2BBAD;
    dw $2127,$0003                                                       ;B2BBAE;
    db $15                                                               ;B2BBB2;
    dw $2126,$81FA                                                       ;B2BBB3;
    db $0B                                                               ;B2BBB7;
    dw $2122,$01FB                                                       ;B2BBB8;
    db $FC                                                               ;B2BBBC;
    dw $2113,$01FB                                                       ;B2BBBD;
    db $F4                                                               ;B2BBC1;
    dw $2103,$81F2                                                       ;B2BBC2;
    db $EB                                                               ;B2BBC6;
    dw $210E,$81F7                                                       ;B2BBC7;
    db $F2                                                               ;B2BBCB;
    dw $212E,$01FB                                                       ;B2BBCC;
    db $15                                                               ;B2BBD0;
    dw $2125,$81F7                                                       ;B2BBD1;
    db $FF                                                               ;B2BBD5;
    dw $2107,$81F3                                                       ;B2BBD6;
    db $FF                                                               ;B2BBDA;
    dw $2107,$81F4                                                       ;B2BBDB;
    db $0A                                                               ;B2BBDF;
    dw $2122,$01FB                                                       ;B2BBE0;
    db $15                                                               ;B2BBE4;
    dw $2126,$01F3                                                       ;B2BBE5;
    db $15                                                               ;B2BBE9;
    dw $2125                                                             ;B2BBEA;

UNUSED_Spitemaps_SpacePirate_B2BBEC:
    dw $0012,$81F3                                                       ;B2BBEC;
    db $EC                                                               ;B2BBF0;
    dw $210E,$0008                                                       ;B2BBF1;
    db $FC                                                               ;B2BBF5;
    dw $E14D,$0009                                                       ;B2BBF6;
    db $04                                                               ;B2BBFA;
    dw $E13D,$0009                                                       ;B2BBFB;
    db $0C                                                               ;B2BBFF;
    dw $E12D,$81FE                                                       ;B2BC00;
    db $F2                                                               ;B2BC04;
    dw $2105,$81F9                                                       ;B2BC05;
    db $F1                                                               ;B2BC09;
    dw $212E,$81EE                                                       ;B2BC0A;
    db $F3                                                               ;B2BC0E;
    dw $212B,$81E6                                                       ;B2BC0F;
    db $F3                                                               ;B2BC13;
    dw $212A,$81F7                                                       ;B2BC14;
    db $FF                                                               ;B2BC18;
    dw $2107,$0002                                                       ;B2BC19;
    db $11                                                               ;B2BC1D;
    dw $2144,$0002                                                       ;B2BC1E;
    db $09                                                               ;B2BC22;
    dw $2143,$01F7                                                       ;B2BC23;
    db $09                                                               ;B2BC27;
    dw $E149,$01FF                                                       ;B2BC28;
    db $09                                                               ;B2BC2C;
    dw $E148,$81F4                                                       ;B2BC2D;
    db $FF                                                               ;B2BC31;
    dw $2107,$01F5                                                       ;B2BC32;
    db $0B                                                               ;B2BC36;
    dw $E149,$01FD                                                       ;B2BC37;
    db $0B                                                               ;B2BC3B;
    dw $E148,$01FE                                                       ;B2BC3C;
    db $13                                                               ;B2BC40;
    dw $2144,$01FE                                                       ;B2BC41;
    db $0B                                                               ;B2BC45;
    dw $2143                                                             ;B2BC46;

UNUSED_Spitemaps_SpacePirate_B2BC48:
    dw $0014,$01F8                                                       ;B2BC48;
    db $F2                                                               ;B2BC4C;
    dw $214F,$01F0                                                       ;B2BC4D;
    db $F1                                                               ;B2BC51;
    dw $214E,$01EC                                                       ;B2BC52;
    db $EE                                                               ;B2BC56;
    dw $214D,$01EC                                                       ;B2BC57;
    db $E6                                                               ;B2BC5B;
    dw $213D,$01EC                                                       ;B2BC5C;
    db $DE                                                               ;B2BC60;
    dw $212D,$81F5                                                       ;B2BC61;
    db $F1                                                               ;B2BC65;
    dw $212E,$81EE                                                       ;B2BC66;
    db $EB                                                               ;B2BC6A;
    dw $210E,$01EC                                                       ;B2BC6B;
    db $F0                                                               ;B2BC6F;
    dw $213D,$01EC                                                       ;B2BC70;
    db $F8                                                               ;B2BC74;
    dw $214D,$81EE                                                       ;B2BC75;
    db $F1                                                               ;B2BC79;
    dw $2100,$81F7                                                       ;B2BC7A;
    db $FF                                                               ;B2BC7E;
    dw $2107,$0004                                                       ;B2BC7F;
    db $11                                                               ;B2BC83;
    dw $2144,$0004                                                       ;B2BC84;
    db $09                                                               ;B2BC88;
    dw $2143,$01F7                                                       ;B2BC89;
    db $09                                                               ;B2BC8D;
    dw $E149,$01FF                                                       ;B2BC8E;
    db $09                                                               ;B2BC92;
    dw $E148,$81F4                                                       ;B2BC93;
    db $FF                                                               ;B2BC97;
    dw $2107,$01F5                                                       ;B2BC98;
    db $0B                                                               ;B2BC9C;
    dw $E149,$01FD                                                       ;B2BC9D;
    db $0B                                                               ;B2BCA1;
    dw $E148,$01FE                                                       ;B2BCA2;
    db $13                                                               ;B2BCA6;
    dw $2144,$01FE                                                       ;B2BCA7;
    db $0B                                                               ;B2BCAB;
    dw $2143                                                             ;B2BCAC;

UNUSED_Spitemaps_SpacePirate_B2BCAE:
    dw $000F,$01E8                                                       ;B2BCAE;
    db $F7                                                               ;B2BCB2;
    dw $212A,$81F0                                                       ;B2BCB3;
    db $F7                                                               ;B2BCB7;
    dw $212B,$81F7                                                       ;B2BCB8;
    db $F6                                                               ;B2BCBC;
    dw $2100,$81FB                                                       ;B2BCBD;
    db $F2                                                               ;B2BCC1;
    dw $212E,$81F4                                                       ;B2BCC2;
    db $EC                                                               ;B2BCC6;
    dw $210E,$01FE                                                       ;B2BCC7;
    db $0B                                                               ;B2BCCB;
    dw $2146,$01F6                                                       ;B2BCCC;
    db $0B                                                               ;B2BCD0;
    dw $2145,$0001                                                       ;B2BCD1;
    db $00                                                               ;B2BCD5;
    dw $2149,$01F9                                                       ;B2BCD6;
    db $FF                                                               ;B2BCDA;
    dw $2148,$81F7                                                       ;B2BCDB;
    db $01                                                               ;B2BCDF;
    dw $2122,$01EF                                                       ;B2BCE0;
    db $F9                                                               ;B2BCE4;
    dw $214D,$01EE                                                       ;B2BCE5;
    db $F1                                                               ;B2BCE9;
    dw $213D,$01ED                                                       ;B2BCEA;
    db $E9                                                               ;B2BCEE;
    dw $212D,$0002                                                       ;B2BCEF;
    db $0D                                                               ;B2BCF3;
    dw $2144,$0002                                                       ;B2BCF4;
    db $05                                                               ;B2BCF8;
    dw $2143                                                             ;B2BCF9;

UNUSED_Spitemaps_SpacePirate_B2BCFB:
    dw $000E,$01F0                                                       ;B2BCFB;
    db $05                                                               ;B2BCFF;
    dw $E18D,$01F0                                                       ;B2BD00;
    db $0D                                                               ;B2BD04;
    dw $E17D,$01F6                                                       ;B2BD05;
    db $0B                                                               ;B2BD09;
    dw $2130,$01F6                                                       ;B2BD0A;
    db $03                                                               ;B2BD0E;
    dw $2120,$01E9                                                       ;B2BD0F;
    db $F4                                                               ;B2BD13;
    dw $212A,$81F1                                                       ;B2BD14;
    db $F4                                                               ;B2BD18;
    dw $212B,$81F8                                                       ;B2BD19;
    db $F3                                                               ;B2BD1D;
    dw $2100,$81FC                                                       ;B2BD1E;
    db $F0                                                               ;B2BD22;
    dw $212E,$81F5                                                       ;B2BD23;
    db $EA                                                               ;B2BD27;
    dw $210E,$0001                                                       ;B2BD28;
    db $FE                                                               ;B2BD2C;
    dw $2149,$01F9                                                       ;B2BD2D;
    db $FE                                                               ;B2BD31;
    dw $2148,$01F1                                                       ;B2BD32;
    db $F6                                                               ;B2BD36;
    dw $214D,$01F0                                                       ;B2BD37;
    db $EE                                                               ;B2BD3B;
    dw $213D,$01EF                                                       ;B2BD3C;
    db $E6                                                               ;B2BD40;
    dw $212D                                                             ;B2BD41;

UNUSED_Spitemaps_SpacePirate_B2BD43:
    dw $000E,$01F0                                                       ;B2BD43;
    db $05                                                               ;B2BD47;
    dw $E18D,$01F0                                                       ;B2BD48;
    db $0D                                                               ;B2BD4C;
    dw $E17D,$01F5                                                       ;B2BD4D;
    db $0B                                                               ;B2BD51;
    dw $2130,$01F5                                                       ;B2BD52;
    db $03                                                               ;B2BD56;
    dw $2120,$01E8                                                       ;B2BD57;
    db $F3                                                               ;B2BD5B;
    dw $212A,$81F0                                                       ;B2BD5C;
    db $F3                                                               ;B2BD60;
    dw $212B,$81F8                                                       ;B2BD61;
    db $F2                                                               ;B2BD65;
    dw $2100,$81FC                                                       ;B2BD66;
    db $F1                                                               ;B2BD6A;
    dw $212E,$81F5                                                       ;B2BD6B;
    db $EB                                                               ;B2BD6F;
    dw $210E,$0001                                                       ;B2BD70;
    db $FF                                                               ;B2BD74;
    dw $2149,$01F9                                                       ;B2BD75;
    db $FE                                                               ;B2BD79;
    dw $2148,$01F0                                                       ;B2BD7A;
    db $F7                                                               ;B2BD7E;
    dw $214D,$01EF                                                       ;B2BD7F;
    db $EF                                                               ;B2BD83;
    dw $213D,$01EE                                                       ;B2BD84;
    db $E7                                                               ;B2BD88;
    dw $212D                                                             ;B2BD89;

Spitemaps_PirateNinja_18:
    dw $0009,$01F9                                                       ;B2BD8B;
    db $00                                                               ;B2BD8F;
    dw $E14D,$01F9                                                       ;B2BD90;
    db $08                                                               ;B2BD94;
    dw $E13D,$01F9                                                       ;B2BD95;
    db $10                                                               ;B2BD99;
    dw $E12D,$01FA                                                       ;B2BD9A;
    db $FA                                                               ;B2BD9E;
    dw $2113,$01FA                                                       ;B2BD9F;
    db $F2                                                               ;B2BDA3;
    dw $2103,$81F8                                                       ;B2BDA4;
    db $EF                                                               ;B2BDA8;
    dw $212E,$81F1                                                       ;B2BDA9;
    db $E9                                                               ;B2BDAD;
    dw $210E,$01F5                                                       ;B2BDAE;
    db $FD                                                               ;B2BDB2;
    dw $214B,$01ED                                                       ;B2BDB3;
    db $FE                                                               ;B2BDB7;
    dw $214A                                                             ;B2BDB8;

UNUSED_Spitemaps_SpacePirate_B2BDBA:
    dw $0003,$01FC                                                       ;B2BDBA;
    db $04                                                               ;B2BDBE;
    dw $214D,$01FC                                                       ;B2BDBF;
    db $FC                                                               ;B2BDC3;
    dw $213D,$01FC                                                       ;B2BDC4;
    db $F4                                                               ;B2BDC8;
    dw $212D                                                             ;B2BDC9;

Spitemaps_PirateWalking_2A_Ninja_18:
    dw $0010,$81F9                                                       ;B2BDCB;
    db $FE                                                               ;B2BDCF;
    dw $2107,$01E4                                                       ;B2BDD0;
    db $F3                                                               ;B2BDD4;
    dw $212A,$81EC                                                       ;B2BDD5;
    db $F3                                                               ;B2BDD9;
    dw $212B,$81F6                                                       ;B2BDDA;
    db $F1                                                               ;B2BDDE;
    dw $2100,$81F2                                                       ;B2BDDF;
    db $EB                                                               ;B2BDE3;
    dw $210E,$81F9                                                       ;B2BDE4;
    db $F1                                                               ;B2BDE8;
    dw $212E,$01ED                                                       ;B2BDE9;
    db $F9                                                               ;B2BDED;
    dw $214D,$01EC                                                       ;B2BDEE;
    db $F1                                                               ;B2BDF2;
    dw $213D,$01EB                                                       ;B2BDF3;
    db $E9                                                               ;B2BDF7;
    dw $212D,$81F4                                                       ;B2BDF8;
    db $FE                                                               ;B2BDFC;
    dw $2107,$01FC                                                       ;B2BDFD;
    db $10                                                               ;B2BE01;
    dw $2125,$81F3                                                       ;B2BE02;
    db $05                                                               ;B2BE06;
    dw $2122,$0004                                                       ;B2BE07;
    db $10                                                               ;B2BE0B;
    dw $2126,$81FB                                                       ;B2BE0C;
    db $07                                                               ;B2BE10;
    dw $2122,$01FA                                                       ;B2BE11;
    db $10                                                               ;B2BE15;
    dw $2126,$01F2                                                       ;B2BE16;
    db $10                                                               ;B2BE1A;
    dw $2125                                                             ;B2BE1B;

UNUSED_Spitemaps_SpacePirate_B2BE1D:
    dw $0011,$81F3                                                       ;B2BE1D;
    db $FB                                                               ;B2BE21;
    dw $2127,$81FB                                                       ;B2BE22;
    db $FB                                                               ;B2BE26;
    dw $2128,$01FE                                                       ;B2BE27;
    db $0D                                                               ;B2BE2B;
    dw $2121,$01FE                                                       ;B2BE2C;
    db $15                                                               ;B2BE30;
    dw $2131,$01FD                                                       ;B2BE31;
    db $18                                                               ;B2BE35;
    dw $2126,$01F5                                                       ;B2BE36;
    db $18                                                               ;B2BE3A;
    dw $2125,$01FC                                                       ;B2BE3B;
    db $08                                                               ;B2BE3F;
    dw $211A,$01FC                                                       ;B2BE40;
    db $00                                                               ;B2BE44;
    dw $210A,$0007                                                       ;B2BE45;
    db $12                                                               ;B2BE49;
    dw $2144,$0007                                                       ;B2BE4A;
    db $0A                                                               ;B2BE4E;
    dw $2143,$01FA                                                       ;B2BE4F;
    db $06                                                               ;B2BE53;
    dw $2119,$01FB                                                       ;B2BE54;
    db $FE                                                               ;B2BE58;
    dw $2109,$01FA                                                       ;B2BE59;
    db $0A                                                               ;B2BE5D;
    dw $216E,$81FA                                                       ;B2BE5E;
    db $F0                                                               ;B2BE62;
    dw $2105,$81F1                                                       ;B2BE63;
    db $E6                                                               ;B2BE67;
    dw $210E,$81F7                                                       ;B2BE68;
    db $EF                                                               ;B2BE6C;
    dw $212E,$0002                                                       ;B2BE6D;
    db $0A                                                               ;B2BE71;
    dw $216F                                                             ;B2BE72;

UNUSED_Spitemaps_SpacePirate_B2BE74:
    dw $0013,$01FE                                                       ;B2BE74;
    db $FF                                                               ;B2BE78;
    dw $210A,$01E3                                                       ;B2BE79;
    db $F0                                                               ;B2BE7D;
    dw $212A,$81EB                                                       ;B2BE7E;
    db $F0                                                               ;B2BE82;
    dw $212B,$81F3                                                       ;B2BE83;
    db $F1                                                               ;B2BE87;
    dw $2100,$0006                                                       ;B2BE88;
    db $F5                                                               ;B2BE8C;
    dw $E14D,$0007                                                       ;B2BE8D;
    db $FD                                                               ;B2BE91;
    dw $E13D,$0008                                                       ;B2BE92;
    db $05                                                               ;B2BE96;
    dw $E12D,$81F3                                                       ;B2BE97;
    db $E9                                                               ;B2BE9B;
    dw $210E,$81F7                                                       ;B2BE9C;
    db $F1                                                               ;B2BEA0;
    dw $212E,$01FD                                                       ;B2BEA1;
    db $07                                                               ;B2BEA5;
    dw $211A,$01E3                                                       ;B2BEA6;
    db $FD                                                               ;B2BEAA;
    dw $E16F,$01EB                                                       ;B2BEAB;
    db $FD                                                               ;B2BEAF;
    dw $E16E,$01FB                                                       ;B2BEB0;
    db $FE                                                               ;B2BEB4;
    dw $219F,$01F3                                                       ;B2BEB5;
    db $FE                                                               ;B2BEB9;
    dw $219E,$0008                                                       ;B2BEBA;
    db $16                                                               ;B2BEBE;
    dw $2126,$0000                                                       ;B2BEBF;
    db $17                                                               ;B2BEC3;
    dw $2125,$81FE                                                       ;B2BEC4;
    db $0A                                                               ;B2BEC8;
    dw $2122,$01DE                                                       ;B2BEC9;
    db $F4                                                               ;B2BECD;
    dw $E18D,$01DD                                                       ;B2BECE;
    db $FC                                                               ;B2BED2;
    dw $E17D                                                             ;B2BED3;

UNUSED_Spitemaps_SpacePirate_B2BED5:
    dw $0016,$0009                                                       ;B2BED5;
    db $F4                                                               ;B2BED9;
    dw $E14D,$000A                                                       ;B2BEDA;
    db $FC                                                               ;B2BEDE;
    dw $E13D,$000A                                                       ;B2BEDF;
    db $04                                                               ;B2BEE3;
    dw $E12D,$0006                                                       ;B2BEE4;
    db $F3                                                               ;B2BEE8;
    dw $215F,$01FE                                                       ;B2BEE9;
    db $F4                                                               ;B2BEED;
    dw $215E,$01FF                                                       ;B2BEEE;
    db $00                                                               ;B2BEF2;
    dw $610A,$81F3                                                       ;B2BEF3;
    db $EC                                                               ;B2BEF7;
    dw $210E,$81F9                                                       ;B2BEF8;
    db $F2                                                               ;B2BEFC;
    dw $212E,$01EF                                                       ;B2BEFD;
    db $10                                                               ;B2BF01;
    dw $618D,$01EF                                                       ;B2BF02;
    db $08                                                               ;B2BF06;
    dw $617D,$01F4                                                       ;B2BF07;
    db $08                                                               ;B2BF0B;
    dw $616F,$01FC                                                       ;B2BF0C;
    db $09                                                               ;B2BF10;
    dw $616E,$0000                                                       ;B2BF11;
    db $08                                                               ;B2BF15;
    dw $611A,$01F5                                                       ;B2BF16;
    db $EA                                                               ;B2BF1A;
    dw $214D,$01F4                                                       ;B2BF1B;
    db $E2                                                               ;B2BF1F;
    dw $213D,$01F4                                                       ;B2BF20;
    db $DA                                                               ;B2BF24;
    dw $212D,$01E5                                                       ;B2BF25;
    db $FD                                                               ;B2BF29;
    dw $E16F,$01ED                                                       ;B2BF2A;
    db $FD                                                               ;B2BF2E;
    dw $E16E,$01FB                                                       ;B2BF2F;
    db $FD                                                               ;B2BF33;
    dw $219F,$01F3                                                       ;B2BF34;
    db $FD                                                               ;B2BF38;
    dw $219E,$01DE                                                       ;B2BF39;
    db $F5                                                               ;B2BF3D;
    dw $E18D,$01DE                                                       ;B2BF3E;
    db $FD                                                               ;B2BF42;
    dw $E17D                                                             ;B2BF43;

Spitemaps_PirateNinja_19:
    dw $000A,$81FC                                                       ;B2BF45;
    db $00                                                               ;B2BF49;
    dw $6107,$01FB                                                       ;B2BF4A;
    db $08                                                               ;B2BF4E;
    dw $611B,$01FB                                                       ;B2BF4F;
    db $00                                                               ;B2BF53;
    dw $610B,$000B                                                       ;B2BF54;
    db $16                                                               ;B2BF58;
    dw $6136,$81F0                                                       ;B2BF59;
    db $08                                                               ;B2BF5D;
    dw $617E,$0007                                                       ;B2BF5E;
    db $13                                                               ;B2BF62;
    dw $6130,$0007                                                       ;B2BF63;
    db $0B                                                               ;B2BF67;
    dw $6120,$0012                                                       ;B2BF68;
    db $16                                                               ;B2BF6C;
    dw $6135,$01EB                                                       ;B2BF6D;
    db $16                                                               ;B2BF71;
    dw $6144,$01EC                                                       ;B2BF72;
    db $0E                                                               ;B2BF76;
    dw $6143                                                             ;B2BF77;

Spitemaps_PirateNinja_1A:
    dw $000C,$01ED                                                       ;B2BF79;
    db $10                                                               ;B2BF7D;
    dw $618D,$01ED                                                       ;B2BF7E;
    db $08                                                               ;B2BF82;
    dw $617D,$01F0                                                       ;B2BF83;
    db $09                                                               ;B2BF87;
    dw $616D,$01F8                                                       ;B2BF88;
    db $09                                                               ;B2BF8C;
    dw $616C,$01FF                                                       ;B2BF8D;
    db $12                                                               ;B2BF91;
    dw $6131,$01FF                                                       ;B2BF92;
    db $0A                                                               ;B2BF96;
    dw $6121,$0001                                                       ;B2BF97;
    db $18                                                               ;B2BF9B;
    dw $6126,$0009                                                       ;B2BF9C;
    db $18                                                               ;B2BFA0;
    dw $6125,$01FE                                                       ;B2BFA1;
    db $06                                                               ;B2BFA5;
    dw $6119,$01FE                                                       ;B2BFA6;
    db $FE                                                               ;B2BFAA;
    dw $6109,$01FC                                                       ;B2BFAB;
    db $06                                                               ;B2BFAF;
    dw $611A,$01FC                                                       ;B2BFB0;
    db $FE                                                               ;B2BFB4;
    dw $610A                                                             ;B2BFB5;

Spitemaps_PirateNinja_1B:
    dw $000C,$01FC                                                       ;B2BFB7;
    db $06                                                               ;B2BFBB;
    dw $611A,$01FC                                                       ;B2BFBC;
    db $FE                                                               ;B2BFC0;
    dw $610A,$01FF                                                       ;B2BFC1;
    db $05                                                               ;B2BFC5;
    dw $6119,$01FB                                                       ;B2BFC6;
    db $18                                                               ;B2BFCA;
    dw $6126,$01FA                                                       ;B2BFCB;
    db $14                                                               ;B2BFCF;
    dw $6131,$01FA                                                       ;B2BFD0;
    db $0C                                                               ;B2BFD4;
    dw $6121,$01FF                                                       ;B2BFD5;
    db $FD                                                               ;B2BFD9;
    dw $6109,$0003                                                       ;B2BFDA;
    db $18                                                               ;B2BFDE;
    dw $6125,$01F7                                                       ;B2BFDF;
    db $09                                                               ;B2BFE3;
    dw $616F,$01FF                                                       ;B2BFE4;
    db $09                                                               ;B2BFE8;
    dw $616E,$01F3                                                       ;B2BFE9;
    db $11                                                               ;B2BFED;
    dw $6144,$01F3                                                       ;B2BFEE;
    db $09                                                               ;B2BFF2;
    dw $6143                                                             ;B2BFF3;

Spitemaps_PirateNinja_1C:
    dw $000B,$01FE                                                       ;B2BFF5;
    db $14                                                               ;B2BFF9;
    dw $6146,$0006                                                       ;B2BFFA;
    db $14                                                               ;B2BFFE;
    dw $6145,$01F2                                                       ;B2BFFF;
    db $18                                                               ;B2C003;
    dw $6146,$01FA                                                       ;B2C004;
    db $18                                                               ;B2C008;
    dw $6145,$01F5                                                       ;B2C009;
    db $13                                                               ;B2C00D;
    dw $6134,$01F5                                                       ;B2C00E;
    db $0B                                                               ;B2C012;
    dw $6124,$01FA                                                       ;B2C013;
    db $07                                                               ;B2C017;
    dw $611B,$01F9                                                       ;B2C018;
    db $FF                                                               ;B2C01C;
    dw $610B,$81FB                                                       ;B2C01D;
    db $FD                                                               ;B2C021;
    dw $6107,$01FF                                                       ;B2C022;
    db $0F                                                               ;B2C026;
    dw $6134,$01FF                                                       ;B2C027;
    db $07                                                               ;B2C02B;
    dw $6124                                                             ;B2C02C;

Spitemaps_PirateNinja_1D:
    dw $000A,$01FC                                                       ;B2C02E;
    db $08                                                               ;B2C032;
    dw $611B,$01FC                                                       ;B2C033;
    db $00                                                               ;B2C037;
    dw $610A,$0008                                                       ;B2C038;
    db $12                                                               ;B2C03C;
    dw $6130,$81F1                                                       ;B2C03D;
    db $08                                                               ;B2C041;
    dw $617E,$000D                                                       ;B2C042;
    db $16                                                               ;B2C046;
    dw $6136,$0014                                                       ;B2C047;
    db $16                                                               ;B2C04B;
    dw $6135,$01EB                                                       ;B2C04C;
    db $16                                                               ;B2C050;
    dw $6144,$01EC                                                       ;B2C051;
    db $0E                                                               ;B2C055;
    dw $6143,$0008                                                       ;B2C056;
    db $0A                                                               ;B2C05A;
    dw $6120,$81FD                                                       ;B2C05B;
    db $FF                                                               ;B2C05F;
    dw $6107                                                             ;B2C060;

Spitemaps_PirateNinja_1E:
    dw $000C,$01EE                                                       ;B2C062;
    db $0F                                                               ;B2C066;
    dw $618D,$01EE                                                       ;B2C067;
    db $07                                                               ;B2C06B;
    dw $617D,$0003                                                       ;B2C06C;
    db $18                                                               ;B2C070;
    dw $6126,$000B                                                       ;B2C071;
    db $18                                                               ;B2C075;
    dw $6125,$01F2                                                       ;B2C076;
    db $09                                                               ;B2C07A;
    dw $616D,$01FA                                                       ;B2C07B;
    db $09                                                               ;B2C07F;
    dw $616C,$0002                                                       ;B2C080;
    db $13                                                               ;B2C084;
    dw $6131,$0001                                                       ;B2C085;
    db $0B                                                               ;B2C089;
    dw $6121,$01FD                                                       ;B2C08A;
    db $06                                                               ;B2C08E;
    dw $611A,$01FD                                                       ;B2C08F;
    db $FE                                                               ;B2C093;
    dw $610A,$0000                                                       ;B2C094;
    db $07                                                               ;B2C098;
    dw $6119,$0000                                                       ;B2C099;
    db $FF                                                               ;B2C09D;
    dw $6109                                                             ;B2C09E;

Spitemaps_PirateNinja_1F:
    dw $000C,$01F1                                                       ;B2C0A0;
    db $12                                                               ;B2C0A4;
    dw $6144,$01F1                                                       ;B2C0A5;
    db $0A                                                               ;B2C0A9;
    dw $6143,$01F6                                                       ;B2C0AA;
    db $0A                                                               ;B2C0AE;
    dw $616F,$01FE                                                       ;B2C0AF;
    db $0A                                                               ;B2C0B3;
    dw $616E,$01FE                                                       ;B2C0B4;
    db $06                                                               ;B2C0B8;
    dw $6119,$01FD                                                       ;B2C0B9;
    db $FE                                                               ;B2C0BD;
    dw $6109,$01FB                                                       ;B2C0BE;
    db $18                                                               ;B2C0C2;
    dw $6126,$0003                                                       ;B2C0C3;
    db $18                                                               ;B2C0C7;
    dw $6125,$01FA                                                       ;B2C0C8;
    db $15                                                               ;B2C0CC;
    dw $6131,$01FA                                                       ;B2C0CD;
    db $0D                                                               ;B2C0D1;
    dw $6121,$01FC                                                       ;B2C0D2;
    db $08                                                               ;B2C0D6;
    dw $611A,$01FC                                                       ;B2C0D7;
    db $00                                                               ;B2C0DB;
    dw $610A                                                             ;B2C0DC;

Spitemaps_PirateNinja_20:
    dw $000B,$01FE                                                       ;B2C0DE;
    db $14                                                               ;B2C0E2;
    dw $6146,$0006                                                       ;B2C0E3;
    db $14                                                               ;B2C0E7;
    dw $6145,$81FA                                                       ;B2C0E8;
    db $FC                                                               ;B2C0EC;
    dw $6107,$0000                                                       ;B2C0ED;
    db $0E                                                               ;B2C0F1;
    dw $6134,$0000                                                       ;B2C0F2;
    db $06                                                               ;B2C0F6;
    dw $6124,$01F4                                                       ;B2C0F7;
    db $18                                                               ;B2C0FB;
    dw $6146,$01FC                                                       ;B2C0FC;
    db $18                                                               ;B2C100;
    dw $6145,$01F7                                                       ;B2C101;
    db $13                                                               ;B2C105;
    dw $6134,$01F7                                                       ;B2C106;
    db $0B                                                               ;B2C10A;
    dw $6124,$01FC                                                       ;B2C10B;
    db $07                                                               ;B2C10F;
    dw $611B,$01FB                                                       ;B2C110;
    db $FF                                                               ;B2C114;
    dw $610B                                                             ;B2C115;

Spitemaps_PirateWalking_2B_Ninja_21:
    dw $0009,$01FC                                                       ;B2C117;
    db $FC                                                               ;B2C11B;
    dw $2112,$01FC                                                       ;B2C11C;
    db $F4                                                               ;B2C120;
    dw $2102,$8004                                                       ;B2C121;
    db $01                                                               ;B2C125;
    dw $6127,$81FC                                                       ;B2C126;
    db $01                                                               ;B2C12A;
    dw $6128,$81F8                                                       ;B2C12B;
    db $F0                                                               ;B2C12F;
    dw $612E,$81FF                                                       ;B2C130;
    db $EA                                                               ;B2C134;
    dw $610E,$0002                                                       ;B2C135;
    db $FE                                                               ;B2C139;
    dw $614C,$000A                                                       ;B2C13A;
    db $FE                                                               ;B2C13E;
    dw $614B,$0012                                                       ;B2C13F;
    db $FE                                                               ;B2C143;
    dw $614A                                                             ;B2C144;

Spitemaps_PirateWalking_2C_Ninja_22:
    dw $0009,$8005                                                       ;B2C146;
    db $00                                                               ;B2C14A;
    dw $6127,$81FD                                                       ;B2C14B;
    db $00                                                               ;B2C14F;
    dw $6128,$01FD                                                       ;B2C150;
    db $FB                                                               ;B2C154;
    dw $6113,$01FE                                                       ;B2C155;
    db $F3                                                               ;B2C159;
    dw $6103,$81F8                                                       ;B2C15A;
    db $EF                                                               ;B2C15E;
    dw $612E,$81FF                                                       ;B2C15F;
    db $EA                                                               ;B2C163;
    dw $610E,$0000                                                       ;B2C164;
    db $FD                                                               ;B2C168;
    dw $614C,$0008                                                       ;B2C169;
    db $FD                                                               ;B2C16D;
    dw $614B,$0010                                                       ;B2C16E;
    db $FD                                                               ;B2C172;
    dw $614A                                                             ;B2C173;

Spitemaps_PirateWalking_2D_Ninja_23:
    dw $0008,$8007                                                       ;B2C175;
    db $FE                                                               ;B2C179;
    dw $6127,$81FF                                                       ;B2C17A;
    db $FE                                                               ;B2C17E;
    dw $6128,$01FE                                                       ;B2C17F;
    db $F8                                                               ;B2C183;
    dw $6113,$01FE                                                       ;B2C184;
    db $F0                                                               ;B2C188;
    dw $6103,$81F8                                                       ;B2C189;
    db $EE                                                               ;B2C18D;
    dw $612E,$81FF                                                       ;B2C18E;
    db $E8                                                               ;B2C192;
    dw $610E,$0005                                                       ;B2C193;
    db $FC                                                               ;B2C197;
    dw $614B,$000D                                                       ;B2C198;
    db $FD                                                               ;B2C19C;
    dw $614A                                                             ;B2C19D;

Spitemaps_PirateWalking_2E_Ninja_24:
    dw $0008,$8008                                                       ;B2C19F;
    db $00                                                               ;B2C1A3;
    dw $6127,$8000                                                       ;B2C1A4;
    db $00                                                               ;B2C1A8;
    dw $6128,$01FE                                                       ;B2C1A9;
    db $FA                                                               ;B2C1AD;
    dw $6113,$01FE                                                       ;B2C1AE;
    db $F2                                                               ;B2C1B2;
    dw $6103,$81F8                                                       ;B2C1B3;
    db $EF                                                               ;B2C1B7;
    dw $612E,$81FF                                                       ;B2C1B8;
    db $E9                                                               ;B2C1BC;
    dw $610E,$0003                                                       ;B2C1BD;
    db $FE                                                               ;B2C1C1;
    dw $614B,$000B                                                       ;B2C1C2;
    db $FF                                                               ;B2C1C6;
    dw $614A                                                             ;B2C1C7;

Spitemaps_PirateNinja_25:
    dw $0007,$0002                                                       ;B2C1C9;
    db $FC                                                               ;B2C1CD;
    dw $614C,$000A                                                       ;B2C1CE;
    db $FC                                                               ;B2C1D2;
    dw $614B,$0012                                                       ;B2C1D3;
    db $FC                                                               ;B2C1D7;
    dw $614A,$01FD                                                       ;B2C1D8;
    db $FA                                                               ;B2C1DC;
    dw $6112,$01FD                                                       ;B2C1DD;
    db $F2                                                               ;B2C1E1;
    dw $6102,$81F8                                                       ;B2C1E2;
    db $EF                                                               ;B2C1E6;
    dw $612E,$81FF                                                       ;B2C1E7;
    db $E9                                                               ;B2C1EB;
    dw $610E                                                             ;B2C1EC;

Spitemaps_PirateNinja_26:
    dw $0007,$81FC                                                       ;B2C1EE;
    db $F2                                                               ;B2C1F2;
    dw $6100,$0016                                                       ;B2C1F3;
    db $F3                                                               ;B2C1F7;
    dw $612A,$8006                                                       ;B2C1F8;
    db $F3                                                               ;B2C1FC;
    dw $612B,$81F8                                                       ;B2C1FD;
    db $EF                                                               ;B2C201;
    dw $612E,$81FF                                                       ;B2C202;
    db $E9                                                               ;B2C206;
    dw $610E,$0006                                                       ;B2C207;
    db $FD                                                               ;B2C20B;
    dw $614B,$000E                                                       ;B2C20C;
    db $FD                                                               ;B2C210;
    dw $614A                                                             ;B2C211;

Spitemaps_PirateNinja_27:
    dw $0009,$0007                                                       ;B2C213;
    db $FD                                                               ;B2C217;
    dw $614B,$000F                                                       ;B2C218;
    db $FD                                                               ;B2C21C;
    dw $614A,$0018                                                       ;B2C21D;
    db $E9                                                               ;B2C221;
    dw $612A,$8008                                                       ;B2C222;
    db $E9                                                               ;B2C226;
    dw $612B,$01FD                                                       ;B2C227;
    db $F1                                                               ;B2C22B;
    dw $614F,$0005                                                       ;B2C22C;
    db $F1                                                               ;B2C230;
    dw $614E,$81F8                                                       ;B2C231;
    db $EF                                                               ;B2C235;
    dw $612E,$81FF                                                       ;B2C236;
    db $E9                                                               ;B2C23A;
    dw $610E,$0002                                                       ;B2C23B;
    db $FD                                                               ;B2C23F;
    dw $614C                                                             ;B2C240;

Spitemaps_PirateNinja_28:
    dw $000A,$0008                                                       ;B2C242;
    db $FD                                                               ;B2C246;
    dw $614B,$0010                                                       ;B2C247;
    db $FD                                                               ;B2C24B;
    dw $614A,$01FE                                                       ;B2C24C;
    db $E4                                                               ;B2C250;
    dw $614D,$01FE                                                       ;B2C251;
    db $DC                                                               ;B2C255;
    dw $613D,$01FE                                                       ;B2C256;
    db $D4                                                               ;B2C25A;
    dw $612D,$01FD                                                       ;B2C25B;
    db $E8                                                               ;B2C25F;
    dw $A113,$01FD                                                       ;B2C260;
    db $F0                                                               ;B2C264;
    dw $A103,$81F8                                                       ;B2C265;
    db $F0                                                               ;B2C269;
    dw $612E,$81FF                                                       ;B2C26A;
    db $EA                                                               ;B2C26E;
    dw $610E,$0002                                                       ;B2C26F;
    db $FD                                                               ;B2C273;
    dw $614C                                                             ;B2C274;

Spitemaps_PirateNinja_29:
    dw $0014,$0002                                                       ;B2C276;
    db $12                                                               ;B2C27A;
    dw $6134,$0002                                                       ;B2C27B;
    db $0A                                                               ;B2C27F;
    dw $6124,$0001                                                       ;B2C280;
    db $15                                                               ;B2C284;
    dw $6126,$0016                                                       ;B2C285;
    db $F4                                                               ;B2C289;
    dw $612A,$8006                                                       ;B2C28A;
    db $F4                                                               ;B2C28E;
    dw $612B,$0001                                                       ;B2C28F;
    db $FA                                                               ;B2C293;
    dw $6112,$0000                                                       ;B2C294;
    db $F2                                                               ;B2C298;
    dw $6102,$01F6                                                       ;B2C299;
    db $12                                                               ;B2C29D;
    dw $6134,$01FB                                                       ;B2C29E;
    db $16                                                               ;B2C2A2;
    dw $6125,$01FB                                                       ;B2C2A3;
    db $07                                                               ;B2C2A7;
    dw $611A,$01FA                                                       ;B2C2A8;
    db $FF                                                               ;B2C2AC;
    dw $610A,$01F7                                                       ;B2C2AD;
    db $0A                                                               ;B2C2B1;
    dw $6124,$81FA                                                       ;B2C2B2;
    db $F0                                                               ;B2C2B6;
    dw $612E,$8000                                                       ;B2C2B7;
    db $EA                                                               ;B2C2BB;
    dw $610E,$0009                                                       ;B2C2BC;
    db $16                                                               ;B2C2C0;
    dw $6145,$81FD                                                       ;B2C2C1;
    db $FF                                                               ;B2C2C5;
    dw $6107,$0002                                                       ;B2C2C6;
    db $FE                                                               ;B2C2CA;
    dw $614C,$000A                                                       ;B2C2CB;
    db $FE                                                               ;B2C2CF;
    dw $614B,$0012                                                       ;B2C2D0;
    db $FE                                                               ;B2C2D4;
    dw $614A,$01F3                                                       ;B2C2D5;
    db $15                                                               ;B2C2D9;
    dw $6126                                                             ;B2C2DA;

Spitemaps_PirateNinja_2A:
    dw $0013,$0001                                                       ;B2C2DC;
    db $08                                                               ;B2C2E0;
    dw $6124,$01F1                                                       ;B2C2E1;
    db $16                                                               ;B2C2E5;
    dw $6146,$01F9                                                       ;B2C2E6;
    db $05                                                               ;B2C2EA;
    dw $611A,$01F9                                                       ;B2C2EB;
    db $FD                                                               ;B2C2EF;
    dw $610A,$0016                                                       ;B2C2F0;
    db $F3                                                               ;B2C2F4;
    dw $612A,$8006                                                       ;B2C2F5;
    db $F3                                                               ;B2C2F9;
    dw $612B,$81FE                                                       ;B2C2FA;
    db $F1                                                               ;B2C2FE;
    dw $6100,$81FA                                                       ;B2C2FF;
    db $EF                                                               ;B2C303;
    dw $612E,$8001                                                       ;B2C304;
    db $EA                                                               ;B2C308;
    dw $610E,$0000                                                       ;B2C309;
    db $16                                                               ;B2C30D;
    dw $6146,$0008                                                       ;B2C30E;
    db $15                                                               ;B2C312;
    dw $6145,$01F9                                                       ;B2C313;
    db $15                                                               ;B2C317;
    dw $6145,$01F5                                                       ;B2C318;
    db $10                                                               ;B2C31C;
    dw $6134,$01F6                                                       ;B2C31D;
    db $08                                                               ;B2C321;
    dw $6124,$81FC                                                       ;B2C322;
    db $FE                                                               ;B2C326;
    dw $6107,$0001                                                       ;B2C327;
    db $10                                                               ;B2C32B;
    dw $6134,$0003                                                       ;B2C32C;
    db $FD                                                               ;B2C330;
    dw $614C,$000B                                                       ;B2C331;
    db $FD                                                               ;B2C335;
    dw $614B,$0013                                                       ;B2C336;
    db $FD                                                               ;B2C33A;
    dw $614A                                                             ;B2C33B;

Spitemaps_PirateNinja_2B:
    dw $0014,$0001                                                       ;B2C33D;
    db $09                                                               ;B2C341;
    dw $6124,$0001                                                       ;B2C342;
    db $06                                                               ;B2C346;
    dw $6119,$0001                                                       ;B2C347;
    db $FF                                                               ;B2C34B;
    dw $6109,$0018                                                       ;B2C34C;
    db $F5                                                               ;B2C350;
    dw $612A,$8008                                                       ;B2C351;
    db $F5                                                               ;B2C355;
    dw $612B,$81FF                                                       ;B2C356;
    db $F3                                                               ;B2C35A;
    dw $6100,$81FB                                                       ;B2C35B;
    db $F0                                                               ;B2C35F;
    dw $612E,$8002                                                       ;B2C360;
    db $EB                                                               ;B2C364;
    dw $610E,$0000                                                       ;B2C365;
    db $16                                                               ;B2C369;
    dw $6146,$0008                                                       ;B2C36A;
    db $16                                                               ;B2C36E;
    dw $6145,$01F2                                                       ;B2C36F;
    db $16                                                               ;B2C373;
    dw $6146,$01FA                                                       ;B2C374;
    db $16                                                               ;B2C378;
    dw $6145,$01F5                                                       ;B2C379;
    db $11                                                               ;B2C37D;
    dw $6134,$01F5                                                       ;B2C37E;
    db $09                                                               ;B2C382;
    dw $6124,$01F9                                                       ;B2C383;
    db $07                                                               ;B2C387;
    dw $611B,$01F9                                                       ;B2C388;
    db $FF                                                               ;B2C38C;
    dw $610B,$0000                                                       ;B2C38D;
    db $11                                                               ;B2C391;
    dw $6134,$0004                                                       ;B2C392;
    db $FE                                                               ;B2C396;
    dw $614C,$000C                                                       ;B2C397;
    db $FE                                                               ;B2C39B;
    dw $614B,$0014                                                       ;B2C39C;
    db $FE                                                               ;B2C3A0;
    dw $614A                                                             ;B2C3A1;

UNUSED_Spitemaps_SpacePirate_B2C3A3:
    dw $000E,$81FC                                                       ;B2C3A3;
    db $FF                                                               ;B2C3A7;
    dw $6128,$8004                                                       ;B2C3A8;
    db $FF                                                               ;B2C3AC;
    dw $6127,$01F5                                                       ;B2C3AD;
    db $15                                                               ;B2C3B1;
    dw $6126,$81F6                                                       ;B2C3B2;
    db $0B                                                               ;B2C3B6;
    dw $6122,$01FD                                                       ;B2C3B7;
    db $FC                                                               ;B2C3BB;
    dw $6113,$01FD                                                       ;B2C3BC;
    db $F4                                                               ;B2C3C0;
    dw $6103,$81FE                                                       ;B2C3C1;
    db $EB                                                               ;B2C3C5;
    dw $610E,$81F9                                                       ;B2C3C6;
    db $F2                                                               ;B2C3CA;
    dw $612E,$01FD                                                       ;B2C3CB;
    db $15                                                               ;B2C3CF;
    dw $6125,$81F9                                                       ;B2C3D0;
    db $FF                                                               ;B2C3D4;
    dw $6107,$81FD                                                       ;B2C3D5;
    db $FF                                                               ;B2C3D9;
    dw $6107,$81FC                                                       ;B2C3DA;
    db $0A                                                               ;B2C3DE;
    dw $6122,$01FD                                                       ;B2C3DF;
    db $15                                                               ;B2C3E3;
    dw $6126,$0005                                                       ;B2C3E4;
    db $15                                                               ;B2C3E8;
    dw $6125                                                             ;B2C3E9;

UNUSED_Spitemaps_SpacePirate_B2C3EB:
    dw $0012,$81FD                                                       ;B2C3EB;
    db $EC                                                               ;B2C3EF;
    dw $610E,$01F0                                                       ;B2C3F0;
    db $FC                                                               ;B2C3F4;
    dw $A14D,$01EF                                                       ;B2C3F5;
    db $04                                                               ;B2C3F9;
    dw $A13D,$01EF                                                       ;B2C3FA;
    db $0C                                                               ;B2C3FE;
    dw $A12D,$81F2                                                       ;B2C3FF;
    db $F2                                                               ;B2C403;
    dw $6105,$81F7                                                       ;B2C404;
    db $F1                                                               ;B2C408;
    dw $612E,$8002                                                       ;B2C409;
    db $F3                                                               ;B2C40D;
    dw $612B,$800A                                                       ;B2C40E;
    db $F3                                                               ;B2C412;
    dw $612A,$81F9                                                       ;B2C413;
    db $FF                                                               ;B2C417;
    dw $6107,$01F6                                                       ;B2C418;
    db $11                                                               ;B2C41C;
    dw $6144,$01F6                                                       ;B2C41D;
    db $09                                                               ;B2C421;
    dw $6143,$0001                                                       ;B2C422;
    db $09                                                               ;B2C426;
    dw $A149,$01F9                                                       ;B2C427;
    db $09                                                               ;B2C42B;
    dw $A148,$81FC                                                       ;B2C42C;
    db $FF                                                               ;B2C430;
    dw $6107,$0003                                                       ;B2C431;
    db $0B                                                               ;B2C435;
    dw $A149,$01FB                                                       ;B2C436;
    db $0B                                                               ;B2C43A;
    dw $A148,$01FA                                                       ;B2C43B;
    db $13                                                               ;B2C43F;
    dw $6144,$01FA                                                       ;B2C440;
    db $0B                                                               ;B2C444;
    dw $6143                                                             ;B2C445;

UNUSED_Spitemaps_SpacePirate_B2C447:
    dw $0014,$0000                                                       ;B2C447;
    db $F2                                                               ;B2C44B;
    dw $614F,$0008                                                       ;B2C44C;
    db $F1                                                               ;B2C450;
    dw $614E,$000C                                                       ;B2C451;
    db $EE                                                               ;B2C455;
    dw $614D,$000C                                                       ;B2C456;
    db $E6                                                               ;B2C45A;
    dw $613D,$000C                                                       ;B2C45B;
    db $DE                                                               ;B2C45F;
    dw $612D,$81FB                                                       ;B2C460;
    db $F1                                                               ;B2C464;
    dw $612E,$8002                                                       ;B2C465;
    db $EB                                                               ;B2C469;
    dw $610E,$000C                                                       ;B2C46A;
    db $F0                                                               ;B2C46E;
    dw $613D,$000C                                                       ;B2C46F;
    db $F8                                                               ;B2C473;
    dw $614D,$8002                                                       ;B2C474;
    db $F1                                                               ;B2C478;
    dw $6100,$81F9                                                       ;B2C479;
    db $FF                                                               ;B2C47D;
    dw $6107,$01F4                                                       ;B2C47E;
    db $11                                                               ;B2C482;
    dw $6144,$01F4                                                       ;B2C483;
    db $09                                                               ;B2C487;
    dw $6143,$0001                                                       ;B2C488;
    db $09                                                               ;B2C48C;
    dw $A149,$01F9                                                       ;B2C48D;
    db $09                                                               ;B2C491;
    dw $A148,$81FC                                                       ;B2C492;
    db $FF                                                               ;B2C496;
    dw $6107,$0003                                                       ;B2C497;
    db $0B                                                               ;B2C49B;
    dw $A149,$01FB                                                       ;B2C49C;
    db $0B                                                               ;B2C4A0;
    dw $A148,$01FA                                                       ;B2C4A1;
    db $13                                                               ;B2C4A5;
    dw $6144,$01FA                                                       ;B2C4A6;
    db $0B                                                               ;B2C4AA;
    dw $6143                                                             ;B2C4AB;

UNUSED_Spitemaps_SpacePirate_B2C4AD:
    dw $000F,$0010                                                       ;B2C4AD;
    db $F7                                                               ;B2C4B1;
    dw $612A,$8000                                                       ;B2C4B2;
    db $F7                                                               ;B2C4B6;
    dw $612B,$81F9                                                       ;B2C4B7;
    db $F6                                                               ;B2C4BB;
    dw $6100,$81F5                                                       ;B2C4BC;
    db $F2                                                               ;B2C4C0;
    dw $612E,$81FC                                                       ;B2C4C1;
    db $EC                                                               ;B2C4C5;
    dw $610E,$01FA                                                       ;B2C4C6;
    db $0B                                                               ;B2C4CA;
    dw $6146,$0002                                                       ;B2C4CB;
    db $0B                                                               ;B2C4CF;
    dw $6145,$01F7                                                       ;B2C4D0;
    db $00                                                               ;B2C4D4;
    dw $6149,$01FF                                                       ;B2C4D5;
    db $FF                                                               ;B2C4D9;
    dw $6148,$81F9                                                       ;B2C4DA;
    db $01                                                               ;B2C4DE;
    dw $6122,$0009                                                       ;B2C4DF;
    db $F9                                                               ;B2C4E3;
    dw $614D,$000A                                                       ;B2C4E4;
    db $F1                                                               ;B2C4E8;
    dw $613D,$000B                                                       ;B2C4E9;
    db $E9                                                               ;B2C4ED;
    dw $612D,$01F6                                                       ;B2C4EE;
    db $0D                                                               ;B2C4F2;
    dw $6144,$01F6                                                       ;B2C4F3;
    db $05                                                               ;B2C4F7;
    dw $6143                                                             ;B2C4F8;

UNUSED_Spitemaps_SpacePirate_B2C4FA:
    dw $000E,$0008                                                       ;B2C4FA;
    db $05                                                               ;B2C4FE;
    dw $A18D,$0008                                                       ;B2C4FF;
    db $0D                                                               ;B2C503;
    dw $A17D,$0002                                                       ;B2C504;
    db $0B                                                               ;B2C508;
    dw $6130,$0002                                                       ;B2C509;
    db $03                                                               ;B2C50D;
    dw $6120,$000F                                                       ;B2C50E;
    db $F4                                                               ;B2C512;
    dw $612A,$81FF                                                       ;B2C513;
    db $F4                                                               ;B2C517;
    dw $612B,$81F8                                                       ;B2C518;
    db $F3                                                               ;B2C51C;
    dw $6100,$81F4                                                       ;B2C51D;
    db $F0                                                               ;B2C521;
    dw $612E,$81FB                                                       ;B2C522;
    db $EA                                                               ;B2C526;
    dw $610E,$01F7                                                       ;B2C527;
    db $FE                                                               ;B2C52B;
    dw $6149,$01FF                                                       ;B2C52C;
    db $FE                                                               ;B2C530;
    dw $6148,$0007                                                       ;B2C531;
    db $F6                                                               ;B2C535;
    dw $614D,$0008                                                       ;B2C536;
    db $EE                                                               ;B2C53A;
    dw $613D,$0009                                                       ;B2C53B;
    db $E6                                                               ;B2C53F;
    dw $612D                                                             ;B2C540;

UNUSED_Spitemaps_SpacePirate_B2C542:
    dw $000E,$0008                                                       ;B2C542;
    db $05                                                               ;B2C546;
    dw $A18D,$0008                                                       ;B2C547;
    db $0D                                                               ;B2C54B;
    dw $A17D,$0003                                                       ;B2C54C;
    db $0B                                                               ;B2C550;
    dw $6130,$0003                                                       ;B2C551;
    db $03                                                               ;B2C555;
    dw $6120,$0010                                                       ;B2C556;
    db $F3                                                               ;B2C55A;
    dw $612A,$8000                                                       ;B2C55B;
    db $F3                                                               ;B2C55F;
    dw $612B,$81F8                                                       ;B2C560;
    db $F2                                                               ;B2C564;
    dw $6100,$81F4                                                       ;B2C565;
    db $F1                                                               ;B2C569;
    dw $612E,$81FB                                                       ;B2C56A;
    db $EB                                                               ;B2C56E;
    dw $610E,$01F7                                                       ;B2C56F;
    db $FF                                                               ;B2C573;
    dw $6149,$01FF                                                       ;B2C574;
    db $FE                                                               ;B2C578;
    dw $6148,$0008                                                       ;B2C579;
    db $F7                                                               ;B2C57D;
    dw $614D,$0009                                                       ;B2C57E;
    db $EF                                                               ;B2C582;
    dw $613D,$000A                                                       ;B2C583;
    db $E7                                                               ;B2C587;
    dw $612D                                                             ;B2C588;

Spitemaps_PirateNinja_2C:
    dw $0009,$01FF                                                       ;B2C58A;
    db $00                                                               ;B2C58E;
    dw $A14D,$01FF                                                       ;B2C58F;
    db $08                                                               ;B2C593;
    dw $A13D,$01FF                                                       ;B2C594;
    db $10                                                               ;B2C598;
    dw $A12D,$01FE                                                       ;B2C599;
    db $FA                                                               ;B2C59D;
    dw $6113,$01FE                                                       ;B2C59E;
    db $F2                                                               ;B2C5A2;
    dw $6103,$81F8                                                       ;B2C5A3;
    db $EF                                                               ;B2C5A7;
    dw $612E,$81FF                                                       ;B2C5A8;
    db $E9                                                               ;B2C5AC;
    dw $610E,$0003                                                       ;B2C5AD;
    db $FD                                                               ;B2C5B1;
    dw $614B,$000B                                                       ;B2C5B2;
    db $FE                                                               ;B2C5B6;
    dw $614A                                                             ;B2C5B7;

Spitemaps_PirateWalking_2F:
    dw $0010,$81F7                                                       ;B2C5B9;
    db $FE                                                               ;B2C5BD;
    dw $6107,$0014                                                       ;B2C5BE;
    db $F3                                                               ;B2C5C2;
    dw $612A,$8004                                                       ;B2C5C3;
    db $F3                                                               ;B2C5C7;
    dw $612B,$81FA                                                       ;B2C5C8;
    db $F1                                                               ;B2C5CC;
    dw $6100,$81FE                                                       ;B2C5CD;
    db $EB                                                               ;B2C5D1;
    dw $610E,$81F7                                                       ;B2C5D2;
    db $F1                                                               ;B2C5D6;
    dw $612E,$000B                                                       ;B2C5D7;
    db $F9                                                               ;B2C5DB;
    dw $614D,$000C                                                       ;B2C5DC;
    db $F1                                                               ;B2C5E0;
    dw $613D,$000D                                                       ;B2C5E1;
    db $E9                                                               ;B2C5E5;
    dw $612D,$81FC                                                       ;B2C5E6;
    db $FE                                                               ;B2C5EA;
    dw $6107,$01FC                                                       ;B2C5EB;
    db $10                                                               ;B2C5EF;
    dw $6125,$81FD                                                       ;B2C5F0;
    db $05                                                               ;B2C5F4;
    dw $6122,$01F4                                                       ;B2C5F5;
    db $10                                                               ;B2C5F9;
    dw $6126,$81F5                                                       ;B2C5FA;
    db $07                                                               ;B2C5FE;
    dw $6122,$01FE                                                       ;B2C5FF;
    db $10                                                               ;B2C603;
    dw $6126,$0006                                                       ;B2C604;
    db $10                                                               ;B2C608;
    dw $6125                                                             ;B2C609;

UNUSED_Spitemaps_SpacePirate_B2C60B:
    dw $0011,$81FD                                                       ;B2C60B;
    db $FB                                                               ;B2C60F;
    dw $6127,$81F5                                                       ;B2C610;
    db $FB                                                               ;B2C614;
    dw $6128,$01FA                                                       ;B2C615;
    db $0D                                                               ;B2C619;
    dw $6121,$01FA                                                       ;B2C61A;
    db $15                                                               ;B2C61E;
    dw $6131,$01FB                                                       ;B2C61F;
    db $18                                                               ;B2C623;
    dw $6126,$0003                                                       ;B2C624;
    db $18                                                               ;B2C628;
    dw $6125,$01FC                                                       ;B2C629;
    db $08                                                               ;B2C62D;
    dw $611A,$01FC                                                       ;B2C62E;
    db $00                                                               ;B2C632;
    dw $610A,$01F1                                                       ;B2C633;
    db $12                                                               ;B2C637;
    dw $6144,$01F1                                                       ;B2C638;
    db $0A                                                               ;B2C63C;
    dw $6143,$01FE                                                       ;B2C63D;
    db $06                                                               ;B2C641;
    dw $6119,$01FD                                                       ;B2C642;
    db $FE                                                               ;B2C646;
    dw $6109,$01FE                                                       ;B2C647;
    db $0A                                                               ;B2C64B;
    dw $616E,$81F6                                                       ;B2C64C;
    db $F0                                                               ;B2C650;
    dw $6105,$81FF                                                       ;B2C651;
    db $E6                                                               ;B2C655;
    dw $610E,$81F9                                                       ;B2C656;
    db $EF                                                               ;B2C65A;
    dw $612E,$01F6                                                       ;B2C65B;
    db $0A                                                               ;B2C65F;
    dw $616F                                                             ;B2C660;

UNUSED_Spitemaps_SpacePirate_B2C662:
    dw $0013,$01FA                                                       ;B2C662;
    db $FF                                                               ;B2C666;
    dw $610A,$0015                                                       ;B2C667;
    db $F0                                                               ;B2C66B;
    dw $612A,$8005                                                       ;B2C66C;
    db $F0                                                               ;B2C670;
    dw $612B,$81FD                                                       ;B2C671;
    db $F1                                                               ;B2C675;
    dw $6100,$01F2                                                       ;B2C676;
    db $F5                                                               ;B2C67A;
    dw $A14D,$01F1                                                       ;B2C67B;
    db $FD                                                               ;B2C67F;
    dw $A13D,$01F0                                                       ;B2C680;
    db $05                                                               ;B2C684;
    dw $A12D,$81FD                                                       ;B2C685;
    db $E9                                                               ;B2C689;
    dw $610E,$81F9                                                       ;B2C68A;
    db $F1                                                               ;B2C68E;
    dw $612E,$01FB                                                       ;B2C68F;
    db $07                                                               ;B2C693;
    dw $611A,$0015                                                       ;B2C694;
    db $FD                                                               ;B2C698;
    dw $A16F,$000D                                                       ;B2C699;
    db $FD                                                               ;B2C69D;
    dw $A16E,$01FD                                                       ;B2C69E;
    db $FE                                                               ;B2C6A2;
    dw $619F,$0005                                                       ;B2C6A3;
    db $FE                                                               ;B2C6A7;
    dw $619E,$01F0                                                       ;B2C6A8;
    db $16                                                               ;B2C6AC;
    dw $6126,$01F8                                                       ;B2C6AD;
    db $17                                                               ;B2C6B1;
    dw $6125,$81F2                                                       ;B2C6B2;
    db $0A                                                               ;B2C6B6;
    dw $6122,$001A                                                       ;B2C6B7;
    db $F4                                                               ;B2C6BB;
    dw $A18D,$001B                                                       ;B2C6BC;
    db $FC                                                               ;B2C6C0;
    dw $A17D                                                             ;B2C6C1;

UNUSED_Spitemaps_SpacePirate_B2C6C3:
    dw $0016,$01EF                                                       ;B2C6C3;
    db $F4                                                               ;B2C6C7;
    dw $A14D,$01EE                                                       ;B2C6C8;
    db $FC                                                               ;B2C6CC;
    dw $A13D,$01EE                                                       ;B2C6CD;
    db $04                                                               ;B2C6D1;
    dw $A12D,$01F2                                                       ;B2C6D2;
    db $F3                                                               ;B2C6D6;
    dw $615F,$01FA                                                       ;B2C6D7;
    db $F4                                                               ;B2C6DB;
    dw $615E,$01F9                                                       ;B2C6DC;
    db $00                                                               ;B2C6E0;
    dw $210A,$81FD                                                       ;B2C6E1;
    db $EC                                                               ;B2C6E5;
    dw $610E,$81F7                                                       ;B2C6E6;
    db $F2                                                               ;B2C6EA;
    dw $612E,$0009                                                       ;B2C6EB;
    db $10                                                               ;B2C6EF;
    dw $218D,$0009                                                       ;B2C6F0;
    db $08                                                               ;B2C6F4;
    dw $217D,$0004                                                       ;B2C6F5;
    db $08                                                               ;B2C6F9;
    dw $216F,$01FC                                                       ;B2C6FA;
    db $09                                                               ;B2C6FE;
    dw $216E,$01F8                                                       ;B2C6FF;
    db $08                                                               ;B2C703;
    dw $211A,$0003                                                       ;B2C704;
    db $EA                                                               ;B2C708;
    dw $614D,$0004                                                       ;B2C709;
    db $E2                                                               ;B2C70D;
    dw $613D,$0004                                                       ;B2C70E;
    db $DA                                                               ;B2C712;
    dw $612D,$0013                                                       ;B2C713;
    db $FD                                                               ;B2C717;
    dw $A16F,$000B                                                       ;B2C718;
    db $FD                                                               ;B2C71C;
    dw $A16E,$01FD                                                       ;B2C71D;
    db $FD                                                               ;B2C721;
    dw $619F,$0005                                                       ;B2C722;
    db $FD                                                               ;B2C726;
    dw $619E,$001A                                                       ;B2C727;
    db $F5                                                               ;B2C72B;
    dw $A18D,$001A                                                       ;B2C72C;
    db $FD                                                               ;B2C730;
    dw $A17D                                                             ;B2C731;

Spitemaps_PirateNinja_2D:
    dw $0004,$81FA                                                       ;B2C733;
    db $00                                                               ;B2C737;
    dw $2182,$81EA                                                       ;B2C738;
    db $00                                                               ;B2C73C;
    dw $2180,$81FA                                                       ;B2C73D;
    db $F0                                                               ;B2C741;
    dw $2162,$81EA                                                       ;B2C742;
    db $F0                                                               ;B2C746;
    dw $2160                                                             ;B2C747;

Spitemaps_PirateNinja_2E:
    dw $0006,$01F5                                                       ;B2C749;
    db $10                                                               ;B2C74D;
    dw $21A5,$01FD                                                       ;B2C74E;
    db $10                                                               ;B2C752;
    dw $21A6,$81FD                                                       ;B2C753;
    db $00                                                               ;B2C757;
    dw $2186,$81ED                                                       ;B2C758;
    db $00                                                               ;B2C75C;
    dw $2184,$81FD                                                       ;B2C75D;
    db $F0                                                               ;B2C761;
    dw $2166,$81ED                                                       ;B2C762;
    db $F0                                                               ;B2C766;
    dw $2164                                                             ;B2C767;

Spitemaps_PirateNinja_2E_miscount:
    dw $0005,$000C                                                       ;B2C769;
    db $FE                                                               ;B2C76D;
    dw $217C,$81FC                                                       ;B2C76E;
    db $06                                                               ;B2C772;
    dw $218A,$81EC                                                       ;B2C773;
    db $06                                                               ;B2C777;
    dw $2188,$81FC                                                       ;B2C778;
    db $F6                                                               ;B2C77C;
    dw $216A,$81EC                                                       ;B2C77D;
    db $F6                                                               ;B2C781;
    dw $2168                                                             ;B2C782;

Spitemaps_PirateNinja_2F:
    dw $0007,$0010                                                       ;B2C784;
    db $FA                                                               ;B2C788;
    dw $E1A7,$81F0                                                       ;B2C789;
    db $F2                                                               ;B2C78D;
    dw $E1AA,$8000                                                       ;B2C78E;
    db $F2                                                               ;B2C792;
    dw $E1A8,$01F0                                                       ;B2C793;
    db $02                                                               ;B2C797;
    dw $E1B4,$0008                                                       ;B2C798;
    db $02                                                               ;B2C79C;
    dw $E1B1,$0010                                                       ;B2C79D;
    db $02                                                               ;B2C7A1;
    dw $E1B0,$81F8                                                       ;B2C7A2;
    db $02                                                               ;B2C7A6;
    dw $E1A2                                                             ;B2C7A7;

Spitemaps_PirateNinja_30:
    dw $0004,$81F6                                                       ;B2C7A9;
    db $F0                                                               ;B2C7AD;
    dw $E182,$8006                                                       ;B2C7AE;
    db $F0                                                               ;B2C7B2;
    dw $E180,$81F6                                                       ;B2C7B3;
    db $00                                                               ;B2C7B7;
    dw $E162,$8006                                                       ;B2C7B8;
    db $00                                                               ;B2C7BC;
    dw $E160                                                             ;B2C7BD;

Spitemaps_PirateNinja_31:
    dw $0006,$0004                                                       ;B2C7BF;
    db $E8                                                               ;B2C7C3;
    dw $E1A5,$01FC                                                       ;B2C7C4;
    db $E8                                                               ;B2C7C8;
    dw $E1A6,$81F4                                                       ;B2C7C9;
    db $F0                                                               ;B2C7CD;
    dw $E186,$8004                                                       ;B2C7CE;
    db $F0                                                               ;B2C7D2;
    dw $E184,$81F4                                                       ;B2C7D3;
    db $00                                                               ;B2C7D7;
    dw $E166,$8004                                                       ;B2C7D8;
    db $00                                                               ;B2C7DC;
    dw $E164                                                             ;B2C7DD;

Spitemaps_PirateNinja_32:
    dw $0005,$01EC                                                       ;B2C7DF;
    db $FA                                                               ;B2C7E3;
    dw $E17C,$81F4                                                       ;B2C7E4;
    db $EA                                                               ;B2C7E8;
    dw $E18A,$8004                                                       ;B2C7E9;
    db $EA                                                               ;B2C7ED;
    dw $E188,$81F4                                                       ;B2C7EE;
    db $FA                                                               ;B2C7F2;
    dw $E16A,$8004                                                       ;B2C7F3;
    db $FA                                                               ;B2C7F7;
    dw $E168                                                             ;B2C7F8;

Spitemaps_PirateNinja_33:
    dw $0007,$01E9                                                       ;B2C7FA;
    db $FE                                                               ;B2C7FE;
    dw $21A7,$8001                                                       ;B2C7FF;
    db $FE                                                               ;B2C803;
    dw $21AA,$81F1                                                       ;B2C804;
    db $FE                                                               ;B2C808;
    dw $21A8,$0009                                                       ;B2C809;
    db $F6                                                               ;B2C80D;
    dw $21B4,$01F1                                                       ;B2C80E;
    db $F6                                                               ;B2C812;
    dw $21B1,$01E9                                                       ;B2C813;
    db $F6                                                               ;B2C817;
    dw $21B0,$81F9                                                       ;B2C818;
    db $EE                                                               ;B2C81C;
    dw $21A2                                                             ;B2C81D;

UNUSED_Spitemaps_SpacePirate_B2C81F:
    dw $000D,$81F9                                                       ;B2C81F;
    db $FC                                                               ;B2C823;
    dw $2127,$8001                                                       ;B2C824;
    db $FC                                                               ;B2C828;
    dw $2128,$01F1                                                       ;B2C829;
    db $F7                                                               ;B2C82D;
    dw $214D,$01F1                                                       ;B2C82E;
    db $EF                                                               ;B2C832;
    dw $213D,$01F1                                                       ;B2C833;
    db $E7                                                               ;B2C837;
    dw $212D,$0006                                                       ;B2C838;
    db $FB                                                               ;B2C83C;
    dw $6112,$0006                                                       ;B2C83D;
    db $F3                                                               ;B2C841;
    dw $6102,$81FA                                                       ;B2C842;
    db $EB                                                               ;B2C846;
    dw $210E,$0003                                                       ;B2C847;
    db $F9                                                               ;B2C84B;
    dw $6142,$01FB                                                       ;B2C84C;
    db $F1                                                               ;B2C850;
    dw $6141,$0003                                                       ;B2C851;
    db $F1                                                               ;B2C855;
    dw $6140,$01FB                                                       ;B2C856;
    db $F9                                                               ;B2C85A;
    dw $6147,$81F1                                                       ;B2C85B;
    db $F0                                                               ;B2C85F;
    dw $2100                                                             ;B2C860;

UNUSED_Spitemaps_SpacePirate_B2C862:
    dw $000E,$01F0                                                       ;B2C862;
    db $F7                                                               ;B2C866;
    dw $214D,$01F0                                                       ;B2C867;
    db $EF                                                               ;B2C86B;
    dw $213D,$01F0                                                       ;B2C86C;
    db $E7                                                               ;B2C870;
    dw $212D,$81FE                                                       ;B2C871;
    db $EB                                                               ;B2C875;
    dw $610E,$81F1                                                       ;B2C876;
    db $F0                                                               ;B2C87A;
    dw $2100,$0003                                                       ;B2C87B;
    db $F9                                                               ;B2C87F;
    dw $6142,$01FB                                                       ;B2C880;
    db $F1                                                               ;B2C884;
    dw $6141,$0003                                                       ;B2C885;
    db $F1                                                               ;B2C889;
    dw $6140,$01FB                                                       ;B2C88A;
    db $F9                                                               ;B2C88E;
    dw $6147,$0008                                                       ;B2C88F;
    db $FD                                                               ;B2C893;
    dw $A14D,$0008                                                       ;B2C894;
    db $05                                                               ;B2C898;
    dw $A13D,$0008                                                       ;B2C899;
    db $0D                                                               ;B2C89D;
    dw $A12D,$0006                                                       ;B2C89E;
    db $FB                                                               ;B2C8A2;
    dw $6112,$0006                                                       ;B2C8A3;
    db $F3                                                               ;B2C8A7;
    dw $6102                                                             ;B2C8A8;

UNUSED_Spitemaps_SpacePirate_B2C8AA:
    dw $0014,$0000                                                       ;B2C8AA;
    db $F2                                                               ;B2C8AE;
    dw $614F,$0008                                                       ;B2C8AF;
    db $F1                                                               ;B2C8B3;
    dw $614E,$000C                                                       ;B2C8B4;
    db $EE                                                               ;B2C8B8;
    dw $614D,$000C                                                       ;B2C8B9;
    db $E6                                                               ;B2C8BD;
    dw $613D,$000C                                                       ;B2C8BE;
    db $DE                                                               ;B2C8C2;
    dw $612D,$81FB                                                       ;B2C8C3;
    db $F1                                                               ;B2C8C7;
    dw $612E,$8002                                                       ;B2C8C8;
    db $EB                                                               ;B2C8CC;
    dw $610E,$000C                                                       ;B2C8CD;
    db $F0                                                               ;B2C8D1;
    dw $613D,$000C                                                       ;B2C8D2;
    db $F8                                                               ;B2C8D6;
    dw $614D,$8002                                                       ;B2C8D7;
    db $F1                                                               ;B2C8DB;
    dw $6100,$81F9                                                       ;B2C8DC;
    db $FF                                                               ;B2C8E0;
    dw $6107,$01F4                                                       ;B2C8E1;
    db $11                                                               ;B2C8E5;
    dw $6144,$01F4                                                       ;B2C8E6;
    db $09                                                               ;B2C8EA;
    dw $6143,$0001                                                       ;B2C8EB;
    db $09                                                               ;B2C8EF;
    dw $A149,$01F9                                                       ;B2C8F0;
    db $09                                                               ;B2C8F4;
    dw $A148,$81FC                                                       ;B2C8F5;
    db $FF                                                               ;B2C8F9;
    dw $6107,$0003                                                       ;B2C8FA;
    db $0B                                                               ;B2C8FE;
    dw $A149,$01FB                                                       ;B2C8FF;
    db $0B                                                               ;B2C903;
    dw $A148,$01FA                                                       ;B2C904;
    db $13                                                               ;B2C908;
    dw $6144,$01FA                                                       ;B2C909;
    db $0B                                                               ;B2C90D;
    dw $6143                                                             ;B2C90E;

Spitemaps_PirateNinja_34:
    dw $0004,$81F6                                                       ;B2C910;
    db $00                                                               ;B2C914;
    dw $6182,$8006                                                       ;B2C915;
    db $00                                                               ;B2C919;
    dw $6180,$81F6                                                       ;B2C91A;
    db $F0                                                               ;B2C91E;
    dw $6162,$8006                                                       ;B2C91F;
    db $F0                                                               ;B2C923;
    dw $6160                                                             ;B2C924;

Spitemaps_PirateNinja_35:
    dw $0006,$0003                                                       ;B2C926;
    db $10                                                               ;B2C92A;
    dw $61A5,$01FB                                                       ;B2C92B;
    db $10                                                               ;B2C92F;
    dw $61A6,$81F3                                                       ;B2C930;
    db $00                                                               ;B2C934;
    dw $6186,$8003                                                       ;B2C935;
    db $00                                                               ;B2C939;
    dw $6184,$81F3                                                       ;B2C93A;
    db $F0                                                               ;B2C93E;
    dw $6166,$8003                                                       ;B2C93F;
    db $F0                                                               ;B2C943;
    dw $6164                                                             ;B2C944;

Spitemaps_PirateNinja_36:
    dw $0005,$01EC                                                       ;B2C946;
    db $FE                                                               ;B2C94A;
    dw $617C,$81F4                                                       ;B2C94B;
    db $06                                                               ;B2C94F;
    dw $618A,$8004                                                       ;B2C950;
    db $06                                                               ;B2C954;
    dw $6188,$81F4                                                       ;B2C955;
    db $F6                                                               ;B2C959;
    dw $616A,$8004                                                       ;B2C95A;
    db $F6                                                               ;B2C95E;
    dw $6168                                                             ;B2C95F;

Spitemaps_PirateNinja_37:
    dw $0007,$01E8                                                       ;B2C961;
    db $FA                                                               ;B2C965;
    dw $A1A7,$8000                                                       ;B2C966;
    db $F2                                                               ;B2C96A;
    dw $A1AA,$81F0                                                       ;B2C96B;
    db $F2                                                               ;B2C96F;
    dw $A1A8,$0008                                                       ;B2C970;
    db $02                                                               ;B2C974;
    dw $A1B4,$01F0                                                       ;B2C975;
    db $02                                                               ;B2C979;
    dw $A1B1,$01E8                                                       ;B2C97A;
    db $02                                                               ;B2C97E;
    dw $A1B0,$81F8                                                       ;B2C97F;
    db $02                                                               ;B2C983;
    dw $A1A2                                                             ;B2C984;

Spitemaps_PirateNinja_38:
    dw $0004,$81FA                                                       ;B2C986;
    db $F0                                                               ;B2C98A;
    dw $A182,$81EA                                                       ;B2C98B;
    db $F0                                                               ;B2C98F;
    dw $A180,$81FA                                                       ;B2C990;
    db $00                                                               ;B2C994;
    dw $A162,$81EA                                                       ;B2C995;
    db $00                                                               ;B2C999;
    dw $A160                                                             ;B2C99A;

Spitemaps_PirateNinja_39:
    dw $0006,$01F4                                                       ;B2C99C;
    db $E8                                                               ;B2C9A0;
    dw $A1A5,$01FC                                                       ;B2C9A1;
    db $E8                                                               ;B2C9A5;
    dw $A1A6,$81FC                                                       ;B2C9A6;
    db $F0                                                               ;B2C9AA;
    dw $A186,$81EC                                                       ;B2C9AB;
    db $F0                                                               ;B2C9AF;
    dw $A184,$81FC                                                       ;B2C9B0;
    db $00                                                               ;B2C9B4;
    dw $A166,$81EC                                                       ;B2C9B5;
    db $00                                                               ;B2C9B9;
    dw $A164                                                             ;B2C9BA;

Spitemaps_PirateNinja_3A:
    dw $0005,$000C                                                       ;B2C9BC;
    db $FA                                                               ;B2C9C0;
    dw $A17C,$81FC                                                       ;B2C9C1;
    db $EA                                                               ;B2C9C5;
    dw $A18A,$81EC                                                       ;B2C9C6;
    db $EA                                                               ;B2C9CA;
    dw $A188,$81FC                                                       ;B2C9CB;
    db $FA                                                               ;B2C9CF;
    dw $A16A,$81EC                                                       ;B2C9D0;
    db $FA                                                               ;B2C9D4;
    dw $A168                                                             ;B2C9D5;

Spitemaps_PirateNinja_3B:
    dw $0007,$000F                                                       ;B2C9D7;
    db $FE                                                               ;B2C9DB;
    dw $61A7,$81EF                                                       ;B2C9DC;
    db $FE                                                               ;B2C9E0;
    dw $61AA,$81FF                                                       ;B2C9E1;
    db $FE                                                               ;B2C9E5;
    dw $61A8,$01EF                                                       ;B2C9E6;
    db $F6                                                               ;B2C9EA;
    dw $61B4,$0007                                                       ;B2C9EB;
    db $F6                                                               ;B2C9EF;
    dw $61B1,$000F                                                       ;B2C9F0;
    db $F6                                                               ;B2C9F4;
    dw $61B0,$81F7                                                       ;B2C9F5;
    db $EE                                                               ;B2C9F9;
    dw $61A2                                                             ;B2C9FA;

UNUSED_Spitemaps_SpacePirate_B2C9FC:
    dw $0008,$01EF                                                       ;B2C9FC;
    db $FD                                                               ;B2CA00;
    dw $214D,$01EF                                                       ;B2CA01;
    db $F5                                                               ;B2CA05;
    dw $213D,$01EF                                                       ;B2CA06;
    db $ED                                                               ;B2CA0A;
    dw $212D,$81F4                                                       ;B2CA0B;
    db $F3                                                               ;B2CA0F;
    dw $2100,$81F8                                                       ;B2CA10;
    db $F0                                                               ;B2CA14;
    dw $212E,$81F1                                                       ;B2CA15;
    db $EA                                                               ;B2CA19;
    dw $210E,$01EF                                                       ;B2CA1A;
    db $E6                                                               ;B2CA1E;
    dw $213D,$01EF                                                       ;B2CA1F;
    db $DE                                                               ;B2CA23;
    dw $212D                                                             ;B2CA24;

UNUSED_Spitemaps_SpacePirate_B2CA26:
    dw $0009,$01FC                                                       ;B2CA26;
    db $F3                                                               ;B2CA2A;
    dw $214F,$01F4                                                       ;B2CA2B;
    db $F4                                                               ;B2CA2F;
    dw $214E,$01EF                                                       ;B2CA30;
    db $F9                                                               ;B2CA34;
    dw $214D,$01EF                                                       ;B2CA35;
    db $F1                                                               ;B2CA39;
    dw $213D,$01EF                                                       ;B2CA3A;
    db $E9                                                               ;B2CA3E;
    dw $212D,$81F8                                                       ;B2CA3F;
    db $F0                                                               ;B2CA43;
    dw $212E,$81F1                                                       ;B2CA44;
    db $EA                                                               ;B2CA48;
    dw $210E,$01EF                                                       ;B2CA49;
    db $EA                                                               ;B2CA4D;
    dw $213D,$01EF                                                       ;B2CA4E;
    db $E2                                                               ;B2CA52;
    dw $212D                                                             ;B2CA53;

UNUSED_Spitemaps_SpacePirate_B2CA55:
    dw $0008,$01EF                                                       ;B2CA55;
    db $F3                                                               ;B2CA59;
    dw $214D,$01EF                                                       ;B2CA5A;
    db $EB                                                               ;B2CA5E;
    dw $213D,$01EF                                                       ;B2CA5F;
    db $E3                                                               ;B2CA63;
    dw $212D,$01FB                                                       ;B2CA64;
    db $F3                                                               ;B2CA68;
    dw $214F,$01F3                                                       ;B2CA69;
    db $F3                                                               ;B2CA6D;
    dw $214E,$81F8                                                       ;B2CA6E;
    db $F0                                                               ;B2CA72;
    dw $212E,$81F1                                                       ;B2CA73;
    db $EA                                                               ;B2CA77;
    dw $210E,$01EF                                                       ;B2CA78;
    db $E1                                                               ;B2CA7C;
    dw $212D                                                             ;B2CA7D;

UNUSED_Spitemaps_SpacePirate_B2CA7F:
    dw $000A,$01FB                                                       ;B2CA7F;
    db $F1                                                               ;B2CA83;
    dw $214F,$01F3                                                       ;B2CA84;
    db $F0                                                               ;B2CA88;
    dw $214E,$01EF                                                       ;B2CA89;
    db $ED                                                               ;B2CA8D;
    dw $214D,$01EF                                                       ;B2CA8E;
    db $E5                                                               ;B2CA92;
    dw $213D,$01EF                                                       ;B2CA93;
    db $DD                                                               ;B2CA97;
    dw $212D,$81F8                                                       ;B2CA98;
    db $F0                                                               ;B2CA9C;
    dw $212E,$81F1                                                       ;B2CA9D;
    db $EA                                                               ;B2CAA1;
    dw $210E,$01EF                                                       ;B2CAA2;
    db $EF                                                               ;B2CAA6;
    dw $213D,$01EF                                                       ;B2CAA7;
    db $F7                                                               ;B2CAAB;
    dw $214D,$81F1                                                       ;B2CAAC;
    db $F0                                                               ;B2CAB0;
    dw $2100                                                             ;B2CAB1;

UNUSED_Spitemaps_SpacePirate_B2CAB3:
    dw $0009,$81F4                                                       ;B2CAB3;
    db $EB                                                               ;B2CAB7;
    dw $E105,$01EF                                                       ;B2CAB8;
    db $EB                                                               ;B2CABC;
    dw $214D,$01EF                                                       ;B2CABD;
    db $E3                                                               ;B2CAC1;
    dw $213D,$01EF                                                       ;B2CAC2;
    db $DB                                                               ;B2CAC6;
    dw $212D,$81F8                                                       ;B2CAC7;
    db $F0                                                               ;B2CACB;
    dw $212E,$81F1                                                       ;B2CACC;
    db $EA                                                               ;B2CAD0;
    dw $210E,$01EF                                                       ;B2CAD1;
    db $F1                                                               ;B2CAD5;
    dw $213D,$01EF                                                       ;B2CAD6;
    db $F9                                                               ;B2CADA;
    dw $214D,$81F1                                                       ;B2CADB;
    db $F2                                                               ;B2CADF;
    dw $2100                                                             ;B2CAE0;

UNUSED_Spitemaps_SpacePirate_B2CAE2:
    dw $000A,$01F4                                                       ;B2CAE2;
    db $19                                                               ;B2CAE6;
    dw $2146,$01F7                                                       ;B2CAE7;
    db $13                                                               ;B2CAEB;
    dw $2119,$01F7                                                       ;B2CAEC;
    db $0B                                                               ;B2CAF0;
    dw $2109,$81F9                                                       ;B2CAF1;
    db $FE                                                               ;B2CAF5;
    dw $2107,$01EC                                                       ;B2CAF6;
    db $19                                                               ;B2CAFA;
    dw $2145,$01F5                                                       ;B2CAFB;
    db $FE                                                               ;B2CAFF;
    dw $2131,$01F5                                                       ;B2CB00;
    db $F6                                                               ;B2CB04;
    dw $2121,$81F6                                                       ;B2CB05;
    db $F5                                                               ;B2CB09;
    dw $E10C,$01F4                                                       ;B2CB0A;
    db $05                                                               ;B2CB0E;
    dw $2146,$01EC                                                       ;B2CB0F;
    db $05                                                               ;B2CB13;
    dw $2145                                                             ;B2CB14;

UNUSED_Spitemaps_SpacePirate_B2CB16:
    dw $000C,$0000                                                       ;B2CB16;
    db $FD                                                               ;B2CB1A;
    dw $2149,$01F8                                                       ;B2CB1B;
    db $FF                                                               ;B2CB1F;
    dw $2148,$01F4                                                       ;B2CB20;
    db $14                                                               ;B2CB24;
    dw $2146,$01EC                                                       ;B2CB25;
    db $14                                                               ;B2CB29;
    dw $2145,$0000                                                       ;B2CB2A;
    db $FB                                                               ;B2CB2E;
    dw $2149,$01F8                                                       ;B2CB2F;
    db $F9                                                               ;B2CB33;
    dw $2148,$01F5                                                       ;B2CB34;
    db $0D                                                               ;B2CB38;
    dw $211A,$01F5                                                       ;B2CB39;
    db $05                                                               ;B2CB3D;
    dw $210A,$01F5                                                       ;B2CB3E;
    db $02                                                               ;B2CB42;
    dw $2131,$01F5                                                       ;B2CB43;
    db $FA                                                               ;B2CB47;
    dw $2121,$01F4                                                       ;B2CB48;
    db $09                                                               ;B2CB4C;
    dw $2146,$01EC                                                       ;B2CB4D;
    db $09                                                               ;B2CB51;
    dw $2145                                                             ;B2CB52;

UNUSED_Spitemaps_SpacePirate_B2CB54:
    dw $000C,$0000                                                       ;B2CB54;
    db $F9                                                               ;B2CB58;
    dw $2149,$01F8                                                       ;B2CB59;
    db $FB                                                               ;B2CB5D;
    dw $2148,$01F4                                                       ;B2CB5E;
    db $10                                                               ;B2CB62;
    dw $2146,$01EC                                                       ;B2CB63;
    db $10                                                               ;B2CB67;
    dw $2145,$0000                                                       ;B2CB68;
    db $FB                                                               ;B2CB6C;
    dw $2149,$01F8                                                       ;B2CB6D;
    db $F9                                                               ;B2CB71;
    dw $2148,$01F5                                                       ;B2CB72;
    db $09                                                               ;B2CB76;
    dw $211A,$01F5                                                       ;B2CB77;
    db $01                                                               ;B2CB7B;
    dw $210A,$01F5                                                       ;B2CB7C;
    db $06                                                               ;B2CB80;
    dw $2131,$01F5                                                       ;B2CB81;
    db $FE                                                               ;B2CB85;
    dw $2121,$01F4                                                       ;B2CB86;
    db $0D                                                               ;B2CB8A;
    dw $2146,$01EC                                                       ;B2CB8B;
    db $0D                                                               ;B2CB8F;
    dw $2145                                                             ;B2CB90;

UNUSED_Spitemaps_SpacePirate_B2CB92:
    dw $000C,$01F3                                                       ;B2CB92;
    db $03                                                               ;B2CB96;
    dw $2131,$01F3                                                       ;B2CB97;
    db $FB                                                               ;B2CB9B;
    dw $2121,$01F4                                                       ;B2CB9C;
    db $0A                                                               ;B2CBA0;
    dw $2146,$01EC                                                       ;B2CBA1;
    db $0A                                                               ;B2CBA5;
    dw $2145,$0000                                                       ;B2CBA6;
    db $FC                                                               ;B2CBAA;
    dw $2149,$01F8                                                       ;B2CBAB;
    db $FA                                                               ;B2CBAF;
    dw $2148,$0000                                                       ;B2CBB0;
    db $FE                                                               ;B2CBB4;
    dw $2149,$01F8                                                       ;B2CBB5;
    db $00                                                               ;B2CBB9;
    dw $2148,$01F4                                                       ;B2CBBA;
    db $12                                                               ;B2CBBE;
    dw $2146,$01EC                                                       ;B2CBBF;
    db $12                                                               ;B2CBC3;
    dw $2145,$01F5                                                       ;B2CBC4;
    db $0C                                                               ;B2CBC8;
    dw $211A,$01F5                                                       ;B2CBC9;
    db $04                                                               ;B2CBCD;
    dw $210A                                                             ;B2CBCE;

UNUSED_Spitemaps_SpacePirate_B2CBD0:
    dw $000A,$01F5                                                       ;B2CBD0;
    db $00                                                               ;B2CBD4;
    dw $2131,$01F5                                                       ;B2CBD5;
    db $F8                                                               ;B2CBD9;
    dw $2121,$81F7                                                       ;B2CBDA;
    db $F6                                                               ;B2CBDE;
    dw $E10C,$01F4                                                       ;B2CBDF;
    db $07                                                               ;B2CBE3;
    dw $2146,$01EC                                                       ;B2CBE4;
    db $07                                                               ;B2CBE8;
    dw $2145,$01F4                                                       ;B2CBE9;
    db $16                                                               ;B2CBED;
    dw $2146,$01F6                                                       ;B2CBEE;
    db $10                                                               ;B2CBF2;
    dw $2119,$01F6                                                       ;B2CBF3;
    db $08                                                               ;B2CBF7;
    dw $2109,$81F8                                                       ;B2CBF8;
    db $FD                                                               ;B2CBFC;
    dw $2107,$01EC                                                       ;B2CBFD;
    db $16                                                               ;B2CC01;
    dw $2145                                                             ;B2CC02;

Spitemaps_PirateNinja_3C:
    dw $0014,$0007                                                       ;B2CC04;
    db $FE                                                               ;B2CC08;
    dw $615D,$0007                                                       ;B2CC09;
    db $F6                                                               ;B2CC0D;
    dw $615C,$0007                                                       ;B2CC0E;
    db $EE                                                               ;B2CC12;
    dw $615B,$01FF                                                       ;B2CC13;
    db $14                                                               ;B2CC17;
    dw $615A,$01FF                                                       ;B2CC18;
    db $FE                                                               ;B2CC1C;
    dw $6157,$01FF                                                       ;B2CC1D;
    db $0C                                                               ;B2CC21;
    dw $6159,$01FF                                                       ;B2CC22;
    db $06                                                               ;B2CC26;
    dw $6158,$01FF                                                       ;B2CC27;
    db $F8                                                               ;B2CC2B;
    dw $6156,$01FF                                                       ;B2CC2C;
    db $F0                                                               ;B2CC30;
    dw $6155,$01FF                                                       ;B2CC31;
    db $E8                                                               ;B2CC35;
    dw $6154,$01F0                                                       ;B2CC36;
    db $00                                                               ;B2CC3A;
    dw $215D,$01F0                                                       ;B2CC3B;
    db $F8                                                               ;B2CC3F;
    dw $215C,$01F0                                                       ;B2CC40;
    db $F0                                                               ;B2CC44;
    dw $215B,$01F8                                                       ;B2CC45;
    db $18                                                               ;B2CC49;
    dw $215A,$01F8                                                       ;B2CC4A;
    db $00                                                               ;B2CC4E;
    dw $2157,$01F8                                                       ;B2CC4F;
    db $10                                                               ;B2CC53;
    dw $2159,$01F8                                                       ;B2CC54;
    db $08                                                               ;B2CC58;
    dw $2158,$01F8                                                       ;B2CC59;
    db $F8                                                               ;B2CC5D;
    dw $2156,$01F8                                                       ;B2CC5E;
    db $F0                                                               ;B2CC62;
    dw $2155,$01F8                                                       ;B2CC63;
    db $E8                                                               ;B2CC67;
    dw $2154                                                             ;B2CC68;

UNUSED_Spitemaps_SpacePirate_B2CC6A:
    dw $000D,$81F9                                                       ;B2CC6A;
    db $FC                                                               ;B2CC6E;
    dw $2127,$8001                                                       ;B2CC6F;
    db $FC                                                               ;B2CC73;
    dw $2128,$01F1                                                       ;B2CC74;
    db $F7                                                               ;B2CC78;
    dw $214D,$01F1                                                       ;B2CC79;
    db $EF                                                               ;B2CC7D;
    dw $213D,$01F1                                                       ;B2CC7E;
    db $E7                                                               ;B2CC82;
    dw $212D,$0006                                                       ;B2CC83;
    db $FB                                                               ;B2CC87;
    dw $6112,$0006                                                       ;B2CC88;
    db $F3                                                               ;B2CC8C;
    dw $6102,$81FA                                                       ;B2CC8D;
    db $EB                                                               ;B2CC91;
    dw $210E,$0003                                                       ;B2CC92;
    db $F9                                                               ;B2CC96;
    dw $6142,$01FB                                                       ;B2CC97;
    db $F1                                                               ;B2CC9B;
    dw $6141,$0003                                                       ;B2CC9C;
    db $F1                                                               ;B2CCA0;
    dw $6140,$01FB                                                       ;B2CCA1;
    db $F9                                                               ;B2CCA5;
    dw $6147,$81F1                                                       ;B2CCA6;
    db $F0                                                               ;B2CCAA;
    dw $2100                                                             ;B2CCAB;

UNUSED_Spitemaps_SpacePirate_B2CCAD:
    dw $000E,$01F0                                                       ;B2CCAD;
    db $F7                                                               ;B2CCB1;
    dw $214D,$01F0                                                       ;B2CCB2;
    db $EF                                                               ;B2CCB6;
    dw $213D,$01F0                                                       ;B2CCB7;
    db $E7                                                               ;B2CCBB;
    dw $212D,$81FE                                                       ;B2CCBC;
    db $EB                                                               ;B2CCC0;
    dw $610E,$81F1                                                       ;B2CCC1;
    db $F0                                                               ;B2CCC5;
    dw $2100,$0003                                                       ;B2CCC6;
    db $F9                                                               ;B2CCCA;
    dw $6142,$01FB                                                       ;B2CCCB;
    db $F1                                                               ;B2CCCF;
    dw $6141,$0003                                                       ;B2CCD0;
    db $F1                                                               ;B2CCD4;
    dw $6140,$01FB                                                       ;B2CCD5;
    db $F9                                                               ;B2CCD9;
    dw $6147,$0008                                                       ;B2CCDA;
    db $FD                                                               ;B2CCDE;
    dw $A14D,$0008                                                       ;B2CCDF;
    db $05                                                               ;B2CCE3;
    dw $A13D,$0008                                                       ;B2CCE4;
    db $0D                                                               ;B2CCE8;
    dw $A12D,$0006                                                       ;B2CCE9;
    db $FB                                                               ;B2CCED;
    dw $6112,$0006                                                       ;B2CCEE;
    db $F3                                                               ;B2CCF2;
    dw $6102                                                             ;B2CCF3;

UNUSED_Spitemaps_SpacePirate_B2CCF5:
    dw $0014,$0000                                                       ;B2CCF5;
    db $F2                                                               ;B2CCF9;
    dw $614F,$0008                                                       ;B2CCFA;
    db $F1                                                               ;B2CCFE;
    dw $614E,$000C                                                       ;B2CCFF;
    db $EE                                                               ;B2CD03;
    dw $614D,$000C                                                       ;B2CD04;
    db $E6                                                               ;B2CD08;
    dw $613D,$000C                                                       ;B2CD09;
    db $DE                                                               ;B2CD0D;
    dw $612D,$81FB                                                       ;B2CD0E;
    db $F1                                                               ;B2CD12;
    dw $612E,$8002                                                       ;B2CD13;
    db $EB                                                               ;B2CD17;
    dw $610E,$000C                                                       ;B2CD18;
    db $F0                                                               ;B2CD1C;
    dw $613D,$000C                                                       ;B2CD1D;
    db $F8                                                               ;B2CD21;
    dw $614D,$8002                                                       ;B2CD22;
    db $F1                                                               ;B2CD26;
    dw $6100,$81F9                                                       ;B2CD27;
    db $FF                                                               ;B2CD2B;
    dw $6107,$01F4                                                       ;B2CD2C;
    db $11                                                               ;B2CD30;
    dw $6144,$01F4                                                       ;B2CD31;
    db $09                                                               ;B2CD35;
    dw $6143,$0001                                                       ;B2CD36;
    db $09                                                               ;B2CD3A;
    dw $A149,$01F9                                                       ;B2CD3B;
    db $09                                                               ;B2CD3F;
    dw $A148,$81FC                                                       ;B2CD40;
    db $FF                                                               ;B2CD44;
    dw $6107,$0003                                                       ;B2CD45;
    db $0B                                                               ;B2CD49;
    dw $A149,$01FB                                                       ;B2CD4A;
    db $0B                                                               ;B2CD4E;
    dw $A148,$01FA                                                       ;B2CD4F;
    db $13                                                               ;B2CD53;
    dw $6144,$01FA                                                       ;B2CD54;
    db $0B                                                               ;B2CD58;
    dw $6143                                                             ;B2CD59;

UNUSED_Spitemaps_SpacePirate_B2CD5B:
    dw $0010,$0008                                                       ;B2CD5B;
    db $FC                                                               ;B2CD5F;
    dw $614D,$0009                                                       ;B2CD60;
    db $F4                                                               ;B2CD64;
    dw $613D,$000A                                                       ;B2CD65;
    db $EC                                                               ;B2CD69;
    dw $612D,$000B                                                       ;B2CD6A;
    db $FD                                                               ;B2CD6E;
    dw $614D,$000C                                                       ;B2CD6F;
    db $F5                                                               ;B2CD73;
    dw $613D,$000D                                                       ;B2CD74;
    db $ED                                                               ;B2CD78;
    dw $612D,$81FD                                                       ;B2CD79;
    db $F3                                                               ;B2CD7D;
    dw $6100,$81F9                                                       ;B2CD7E;
    db $F0                                                               ;B2CD82;
    dw $612E,$8000                                                       ;B2CD83;
    db $EA                                                               ;B2CD87;
    dw $610E,$01FA                                                       ;B2CD88;
    db $0B                                                               ;B2CD8C;
    dw $6144,$01FA                                                       ;B2CD8D;
    db $03                                                               ;B2CD91;
    dw $6143,$01FE                                                       ;B2CD92;
    db $09                                                               ;B2CD96;
    dw $6146,$0006                                                       ;B2CD97;
    db $09                                                               ;B2CD9B;
    dw $6145,$01FB                                                       ;B2CD9C;
    db $FE                                                               ;B2CDA0;
    dw $6149,$0003                                                       ;B2CDA1;
    db $FD                                                               ;B2CDA5;
    dw $6148,$81FD                                                       ;B2CDA6;
    db $FF                                                               ;B2CDAA;
    dw $6122                                                             ;B2CDAB;

UNUSED_Spitemaps_SpacePirate_B2CDAD:
    dw $0008,$0009                                                       ;B2CDAD;
    db $FD                                                               ;B2CDB1;
    dw $614D,$0009                                                       ;B2CDB2;
    db $F5                                                               ;B2CDB6;
    dw $613D,$0009                                                       ;B2CDB7;
    db $ED                                                               ;B2CDBB;
    dw $612D,$81FC                                                       ;B2CDBC;
    db $F3                                                               ;B2CDC0;
    dw $6100,$81F8                                                       ;B2CDC1;
    db $F0                                                               ;B2CDC5;
    dw $612E,$81FF                                                       ;B2CDC6;
    db $EA                                                               ;B2CDCA;
    dw $610E,$0009                                                       ;B2CDCB;
    db $E6                                                               ;B2CDCF;
    dw $613D,$0009                                                       ;B2CDD0;
    db $DE                                                               ;B2CDD4;
    dw $612D                                                             ;B2CDD5;

UNUSED_Spitemaps_SpacePirate_B2CDD7:
    dw $0009,$01FC                                                       ;B2CDD7;
    db $F3                                                               ;B2CDDB;
    dw $614F,$0004                                                       ;B2CDDC;
    db $F4                                                               ;B2CDE0;
    dw $614E,$0009                                                       ;B2CDE1;
    db $F9                                                               ;B2CDE5;
    dw $614D,$0009                                                       ;B2CDE6;
    db $F1                                                               ;B2CDEA;
    dw $613D,$0009                                                       ;B2CDEB;
    db $E9                                                               ;B2CDEF;
    dw $612D,$81F8                                                       ;B2CDF0;
    db $F0                                                               ;B2CDF4;
    dw $612E,$81FF                                                       ;B2CDF5;
    db $EA                                                               ;B2CDF9;
    dw $610E,$0009                                                       ;B2CDFA;
    db $EA                                                               ;B2CDFE;
    dw $613D,$0009                                                       ;B2CDFF;
    db $E2                                                               ;B2CE03;
    dw $612D                                                             ;B2CE04;

UNUSED_Spitemaps_SpacePirate_B2CE06:
    dw $0008,$0009                                                       ;B2CE06;
    db $F3                                                               ;B2CE0A;
    dw $614D,$0009                                                       ;B2CE0B;
    db $EB                                                               ;B2CE0F;
    dw $613D,$0009                                                       ;B2CE10;
    db $E3                                                               ;B2CE14;
    dw $612D,$01FD                                                       ;B2CE15;
    db $F3                                                               ;B2CE19;
    dw $614F,$0005                                                       ;B2CE1A;
    db $F3                                                               ;B2CE1E;
    dw $614E,$81F8                                                       ;B2CE1F;
    db $F0                                                               ;B2CE23;
    dw $612E,$81FF                                                       ;B2CE24;
    db $EA                                                               ;B2CE28;
    dw $610E,$0009                                                       ;B2CE29;
    db $E1                                                               ;B2CE2D;
    dw $612D                                                             ;B2CE2E;

UNUSED_Spitemaps_SpacePirate_B2CE30:
    dw $000A,$01FD                                                       ;B2CE30;
    db $F1                                                               ;B2CE34;
    dw $614F,$0005                                                       ;B2CE35;
    db $F0                                                               ;B2CE39;
    dw $614E,$0009                                                       ;B2CE3A;
    db $ED                                                               ;B2CE3E;
    dw $614D,$0009                                                       ;B2CE3F;
    db $E5                                                               ;B2CE43;
    dw $613D,$0009                                                       ;B2CE44;
    db $DD                                                               ;B2CE48;
    dw $612D,$81F8                                                       ;B2CE49;
    db $F0                                                               ;B2CE4D;
    dw $612E,$81FF                                                       ;B2CE4E;
    db $EA                                                               ;B2CE52;
    dw $610E,$0009                                                       ;B2CE53;
    db $EF                                                               ;B2CE57;
    dw $613D,$0009                                                       ;B2CE58;
    db $F7                                                               ;B2CE5C;
    dw $614D,$81FF                                                       ;B2CE5D;
    db $F0                                                               ;B2CE61;
    dw $6100                                                             ;B2CE62;

UNUSED_Spitemaps_SpacePirate_B2CE64:
    dw $0009,$81FC                                                       ;B2CE64;
    db $EB                                                               ;B2CE68;
    dw $A105,$0009                                                       ;B2CE69;
    db $EB                                                               ;B2CE6D;
    dw $614D,$0009                                                       ;B2CE6E;
    db $E3                                                               ;B2CE72;
    dw $613D,$0009                                                       ;B2CE73;
    db $DB                                                               ;B2CE77;
    dw $612D,$81F8                                                       ;B2CE78;
    db $F0                                                               ;B2CE7C;
    dw $612E,$81FF                                                       ;B2CE7D;
    db $EA                                                               ;B2CE81;
    dw $610E,$0009                                                       ;B2CE82;
    db $F1                                                               ;B2CE86;
    dw $613D,$0009                                                       ;B2CE87;
    db $F9                                                               ;B2CE8B;
    dw $614D,$81FF                                                       ;B2CE8C;
    db $F2                                                               ;B2CE90;
    dw $6100                                                             ;B2CE91;

UNUSED_Spitemaps_SpacePirate_B2CE93:
    dw $000A,$0004                                                       ;B2CE93;
    db $19                                                               ;B2CE97;
    dw $6146,$0001                                                       ;B2CE98;
    db $13                                                               ;B2CE9C;
    dw $6119,$0001                                                       ;B2CE9D;
    db $0B                                                               ;B2CEA1;
    dw $6109,$81F7                                                       ;B2CEA2;
    db $FE                                                               ;B2CEA6;
    dw $6107,$000C                                                       ;B2CEA7;
    db $19                                                               ;B2CEAB;
    dw $6145,$0003                                                       ;B2CEAC;
    db $FE                                                               ;B2CEB0;
    dw $6131,$0003                                                       ;B2CEB1;
    db $F6                                                               ;B2CEB5;
    dw $6121,$81FA                                                       ;B2CEB6;
    db $F5                                                               ;B2CEBA;
    dw $A10C,$0004                                                       ;B2CEBB;
    db $05                                                               ;B2CEBF;
    dw $6146,$000C                                                       ;B2CEC0;
    db $05                                                               ;B2CEC4;
    dw $6145                                                             ;B2CEC5;

UNUSED_Spitemaps_SpacePirate_B2CEC7:
    dw $000C,$01F8                                                       ;B2CEC7;
    db $FD                                                               ;B2CECB;
    dw $6149,$0000                                                       ;B2CECC;
    db $FF                                                               ;B2CED0;
    dw $6148,$0004                                                       ;B2CED1;
    db $14                                                               ;B2CED5;
    dw $6146,$000C                                                       ;B2CED6;
    db $14                                                               ;B2CEDA;
    dw $6145,$01F8                                                       ;B2CEDB;
    db $FB                                                               ;B2CEDF;
    dw $6149,$0000                                                       ;B2CEE0;
    db $F9                                                               ;B2CEE4;
    dw $6148,$0003                                                       ;B2CEE5;
    db $0D                                                               ;B2CEE9;
    dw $611A,$0003                                                       ;B2CEEA;
    db $05                                                               ;B2CEEE;
    dw $610A,$0003                                                       ;B2CEEF;
    db $02                                                               ;B2CEF3;
    dw $6131,$0003                                                       ;B2CEF4;
    db $FA                                                               ;B2CEF8;
    dw $6121,$0004                                                       ;B2CEF9;
    db $09                                                               ;B2CEFD;
    dw $6146,$000C                                                       ;B2CEFE;
    db $09                                                               ;B2CF02;
    dw $6145                                                             ;B2CF03;

UNUSED_Spitemaps_SpacePirate_B2CF05:
    dw $000C,$01F8                                                       ;B2CF05;
    db $F9                                                               ;B2CF09;
    dw $6149,$0000                                                       ;B2CF0A;
    db $FB                                                               ;B2CF0E;
    dw $6148,$0004                                                       ;B2CF0F;
    db $10                                                               ;B2CF13;
    dw $6146,$000C                                                       ;B2CF14;
    db $10                                                               ;B2CF18;
    dw $6145,$01F8                                                       ;B2CF19;
    db $FB                                                               ;B2CF1D;
    dw $6149,$0000                                                       ;B2CF1E;
    db $F9                                                               ;B2CF22;
    dw $6148,$0003                                                       ;B2CF23;
    db $09                                                               ;B2CF27;
    dw $611A,$0003                                                       ;B2CF28;
    db $01                                                               ;B2CF2C;
    dw $610A,$0003                                                       ;B2CF2D;
    db $06                                                               ;B2CF31;
    dw $6131,$0003                                                       ;B2CF32;
    db $FE                                                               ;B2CF36;
    dw $6121,$0004                                                       ;B2CF37;
    db $0D                                                               ;B2CF3B;
    dw $6146,$000C                                                       ;B2CF3C;
    db $0D                                                               ;B2CF40;
    dw $6145                                                             ;B2CF41;

UNUSED_Spitemaps_SpacePirate_B2CF43:
    dw $000C,$0005                                                       ;B2CF43;
    db $03                                                               ;B2CF47;
    dw $6131,$0005                                                       ;B2CF48;
    db $FB                                                               ;B2CF4C;
    dw $6121,$0004                                                       ;B2CF4D;
    db $0A                                                               ;B2CF51;
    dw $6146,$000C                                                       ;B2CF52;
    db $0A                                                               ;B2CF56;
    dw $6145,$01F8                                                       ;B2CF57;
    db $FC                                                               ;B2CF5B;
    dw $6149,$0000                                                       ;B2CF5C;
    db $FA                                                               ;B2CF60;
    dw $6148,$01F8                                                       ;B2CF61;
    db $FE                                                               ;B2CF65;
    dw $6149,$0000                                                       ;B2CF66;
    db $00                                                               ;B2CF6A;
    dw $6148,$0004                                                       ;B2CF6B;
    db $12                                                               ;B2CF6F;
    dw $6146,$000C                                                       ;B2CF70;
    db $12                                                               ;B2CF74;
    dw $6145,$0003                                                       ;B2CF75;
    db $0C                                                               ;B2CF79;
    dw $611A,$0003                                                       ;B2CF7A;
    db $04                                                               ;B2CF7E;
    dw $610A                                                             ;B2CF7F;

UNUSED_Spitemaps_SpacePirate_B2CF81:
    dw $000A,$0003                                                       ;B2CF81;
    db $00                                                               ;B2CF85;
    dw $6131,$0003                                                       ;B2CF86;
    db $F8                                                               ;B2CF8A;
    dw $6121,$81F9                                                       ;B2CF8B;
    db $F6                                                               ;B2CF8F;
    dw $A10C,$0004                                                       ;B2CF90;
    db $07                                                               ;B2CF94;
    dw $6146,$000C                                                       ;B2CF95;
    db $07                                                               ;B2CF99;
    dw $6145,$0004                                                       ;B2CF9A;
    db $16                                                               ;B2CF9E;
    dw $6146,$0002                                                       ;B2CF9F;
    db $10                                                               ;B2CFA3;
    dw $6119,$0002                                                       ;B2CFA4;
    db $08                                                               ;B2CFA8;
    dw $6109,$81F8                                                       ;B2CFA9;
    db $FD                                                               ;B2CFAD;
    dw $6107,$000C                                                       ;B2CFAE;
    db $16                                                               ;B2CFB2;
    dw $6145                                                             ;B2CFB3;

UNUSED_Spitemaps_SpacePirate_B2CFB5:
    dw $000D,$81F7                                                       ;B2CFB5;
    db $FC                                                               ;B2CFB9;
    dw $6127,$81EF                                                       ;B2CFBA;
    db $FC                                                               ;B2CFBE;
    dw $6128,$0007                                                       ;B2CFBF;
    db $F7                                                               ;B2CFC3;
    dw $614D,$0007                                                       ;B2CFC4;
    db $EF                                                               ;B2CFC8;
    dw $613D,$0007                                                       ;B2CFC9;
    db $E7                                                               ;B2CFCD;
    dw $612D,$01F2                                                       ;B2CFCE;
    db $FB                                                               ;B2CFD2;
    dw $2112,$01F2                                                       ;B2CFD3;
    db $F3                                                               ;B2CFD7;
    dw $2102,$81F6                                                       ;B2CFD8;
    db $EB                                                               ;B2CFDC;
    dw $610E,$01F5                                                       ;B2CFDD;
    db $F9                                                               ;B2CFE1;
    dw $2142,$01FD                                                       ;B2CFE2;
    db $F1                                                               ;B2CFE6;
    dw $2141,$01F5                                                       ;B2CFE7;
    db $F1                                                               ;B2CFEB;
    dw $2140,$01FD                                                       ;B2CFEC;
    db $F9                                                               ;B2CFF0;
    dw $2147,$81FF                                                       ;B2CFF1;
    db $F0                                                               ;B2CFF5;
    dw $6100                                                             ;B2CFF6;

UNUSED_Spitemaps_SpacePirate_B2CFF8:
    dw $000E,$0008                                                       ;B2CFF8;
    db $F7                                                               ;B2CFFC;
    dw $614D,$0008                                                       ;B2CFFD;
    db $EF                                                               ;B2D001;
    dw $613D,$0008                                                       ;B2D002;
    db $E7                                                               ;B2D006;
    dw $612D,$81F2                                                       ;B2D007;
    db $EB                                                               ;B2D00B;
    dw $210E,$81FF                                                       ;B2D00C;
    db $F0                                                               ;B2D010;
    dw $6100,$01F5                                                       ;B2D011;
    db $F9                                                               ;B2D015;
    dw $2142,$01FD                                                       ;B2D016;
    db $F1                                                               ;B2D01A;
    dw $2141,$01F5                                                       ;B2D01B;
    db $F1                                                               ;B2D01F;
    dw $2140,$01FD                                                       ;B2D020;
    db $F9                                                               ;B2D024;
    dw $2147,$01F0                                                       ;B2D025;
    db $FD                                                               ;B2D029;
    dw $E14D,$01F0                                                       ;B2D02A;
    db $05                                                               ;B2D02E;
    dw $E13D,$01F0                                                       ;B2D02F;
    db $0D                                                               ;B2D033;
    dw $E12D,$01F2                                                       ;B2D034;
    db $FB                                                               ;B2D038;
    dw $2112,$01F2                                                       ;B2D039;
    db $F3                                                               ;B2D03D;
    dw $2102                                                             ;B2D03E;

UNUSED_Spitemaps_SpacePirate_B2D040:
    dw $0014,$01F8                                                       ;B2D040;
    db $F2                                                               ;B2D044;
    dw $214F,$01F0                                                       ;B2D045;
    db $F1                                                               ;B2D049;
    dw $214E,$01EC                                                       ;B2D04A;
    db $EE                                                               ;B2D04E;
    dw $214D,$01EC                                                       ;B2D04F;
    db $E6                                                               ;B2D053;
    dw $213D,$01EC                                                       ;B2D054;
    db $DE                                                               ;B2D058;
    dw $212D,$81F5                                                       ;B2D059;
    db $F1                                                               ;B2D05D;
    dw $212E,$81EE                                                       ;B2D05E;
    db $EB                                                               ;B2D062;
    dw $210E,$01EC                                                       ;B2D063;
    db $F0                                                               ;B2D067;
    dw $213D,$01EC                                                       ;B2D068;
    db $F8                                                               ;B2D06C;
    dw $214D,$81EE                                                       ;B2D06D;
    db $F1                                                               ;B2D071;
    dw $2100,$81F7                                                       ;B2D072;
    db $FF                                                               ;B2D076;
    dw $2107,$0004                                                       ;B2D077;
    db $11                                                               ;B2D07B;
    dw $2144,$0004                                                       ;B2D07C;
    db $09                                                               ;B2D080;
    dw $2143,$01F7                                                       ;B2D081;
    db $09                                                               ;B2D085;
    dw $E149,$01FF                                                       ;B2D086;
    db $09                                                               ;B2D08A;
    dw $E148,$81F4                                                       ;B2D08B;
    db $FF                                                               ;B2D08F;
    dw $2107,$01F5                                                       ;B2D090;
    db $0B                                                               ;B2D094;
    dw $E149,$01FD                                                       ;B2D095;
    db $0B                                                               ;B2D099;
    dw $E148,$01FE                                                       ;B2D09A;
    db $13                                                               ;B2D09E;
    dw $2144,$01FE                                                       ;B2D09F;
    db $0B                                                               ;B2D0A3;
    dw $2143                                                             ;B2D0A4;

UNUSED_Spitemaps_SpacePirate_B2D0A6:
    dw $0010,$01F0                                                       ;B2D0A6;
    db $FC                                                               ;B2D0AA;
    dw $214D,$01EF                                                       ;B2D0AB;
    db $F4                                                               ;B2D0AF;
    dw $213D,$01EE                                                       ;B2D0B0;
    db $EC                                                               ;B2D0B4;
    dw $212D,$01ED                                                       ;B2D0B5;
    db $FD                                                               ;B2D0B9;
    dw $214D,$01EC                                                       ;B2D0BA;
    db $F5                                                               ;B2D0BE;
    dw $213D,$01EB                                                       ;B2D0BF;
    db $ED                                                               ;B2D0C3;
    dw $212D,$81F3                                                       ;B2D0C4;
    db $F3                                                               ;B2D0C8;
    dw $2100,$81F7                                                       ;B2D0C9;
    db $F0                                                               ;B2D0CD;
    dw $212E,$81F0                                                       ;B2D0CE;
    db $EA                                                               ;B2D0D2;
    dw $210E,$01FE                                                       ;B2D0D3;
    db $0B                                                               ;B2D0D7;
    dw $2144,$01FE                                                       ;B2D0D8;
    db $03                                                               ;B2D0DC;
    dw $2143,$01FA                                                       ;B2D0DD;
    db $09                                                               ;B2D0E1;
    dw $2146,$01F2                                                       ;B2D0E2;
    db $09                                                               ;B2D0E6;
    dw $2145,$01FD                                                       ;B2D0E7;
    db $FE                                                               ;B2D0EB;
    dw $2149,$01F5                                                       ;B2D0EC;
    db $FD                                                               ;B2D0F0;
    dw $2148,$81F3                                                       ;B2D0F1;
    db $FF                                                               ;B2D0F5;
    dw $2122                                                             ;B2D0F6;

UNUSED_Spitemaps_SpacePirate_B2D0F8:
    dw $000A,$01F5                                                       ;B2D0F8;
    db $13                                                               ;B2D0FC;
    dw $2130,$01F4                                                       ;B2D0FD;
    db $0B                                                               ;B2D101;
    dw $2120,$01F2                                                       ;B2D102;
    db $18                                                               ;B2D106;
    dw $2136,$01EB                                                       ;B2D107;
    db $18                                                               ;B2D10B;
    dw $2135,$81F5                                                       ;B2D10C;
    db $00                                                               ;B2D110;
    dw $2107,$0006                                                       ;B2D111;
    db $18                                                               ;B2D115;
    dw $2144,$0006                                                       ;B2D116;
    db $10                                                               ;B2D11A;
    dw $2143,$81FE                                                       ;B2D11B;
    db $0B                                                               ;B2D11F;
    dw $2122,$01FD                                                       ;B2D120;
    db $08                                                               ;B2D124;
    dw $211B,$01FD                                                       ;B2D125;
    db $00                                                               ;B2D129;
    dw $210B                                                             ;B2D12A;

UNUSED_Spitemaps_SpacePirate_B2D12C:
    dw $000B,$01F9                                                       ;B2D12C;
    db $12                                                               ;B2D130;
    dw $2131,$01F9                                                       ;B2D131;
    db $0A                                                               ;B2D135;
    dw $2121,$01F7                                                       ;B2D136;
    db $18                                                               ;B2D13A;
    dw $2126,$01EF                                                       ;B2D13B;
    db $18                                                               ;B2D13F;
    dw $2125,$01FA                                                       ;B2D140;
    db $06                                                               ;B2D144;
    dw $2119,$01FA                                                       ;B2D145;
    db $FE                                                               ;B2D149;
    dw $2109,$0005                                                       ;B2D14A;
    db $17                                                               ;B2D14E;
    dw $2144,$0005                                                       ;B2D14F;
    db $0F                                                               ;B2D153;
    dw $2143,$81FA                                                       ;B2D154;
    db $08                                                               ;B2D158;
    dw $2122,$01FB                                                       ;B2D159;
    db $06                                                               ;B2D15D;
    dw $211A,$01FB                                                       ;B2D15E;
    db $FE                                                               ;B2D162;
    dw $210A                                                             ;B2D163;

UNUSED_Spitemaps_SpacePirate_B2D165:
    dw $000C,$01FD                                                       ;B2D165;
    db $18                                                               ;B2D169;
    dw $2126,$01F5                                                       ;B2D16A;
    db $18                                                               ;B2D16E;
    dw $2125,$01FE                                                       ;B2D16F;
    db $14                                                               ;B2D173;
    dw $2131,$01FE                                                       ;B2D174;
    db $0C                                                               ;B2D178;
    dw $2121,$01FC                                                       ;B2D179;
    db $06                                                               ;B2D17D;
    dw $211A,$01FC                                                       ;B2D17E;
    db $FE                                                               ;B2D182;
    dw $210A,$0004                                                       ;B2D183;
    db $18                                                               ;B2D187;
    dw $2144,$0004                                                       ;B2D188;
    db $10                                                               ;B2D18C;
    dw $2143,$01FD                                                       ;B2D18D;
    db $10                                                               ;B2D191;
    dw $211B,$01FD                                                       ;B2D192;
    db $08                                                               ;B2D196;
    dw $210B,$01FB                                                       ;B2D197;
    db $04                                                               ;B2D19B;
    dw $2119,$01FB                                                       ;B2D19C;
    db $FC                                                               ;B2D1A0;
    dw $2109                                                             ;B2D1A1;

UNUSED_Spitemaps_SpacePirate_B2D1A3:
    dw $000B,$01FA                                                       ;B2D1A3;
    db $16                                                               ;B2D1A7;
    dw $2126,$01F2                                                       ;B2D1A8;
    db $16                                                               ;B2D1AC;
    dw $2125,$0004                                                       ;B2D1AD;
    db $18                                                               ;B2D1B1;
    dw $2146,$01FC                                                       ;B2D1B2;
    db $18                                                               ;B2D1B6;
    dw $2145,$0001                                                       ;B2D1B7;
    db $13                                                               ;B2D1BB;
    dw $2134,$0001                                                       ;B2D1BC;
    db $0B                                                               ;B2D1C0;
    dw $2124,$01FC                                                       ;B2D1C1;
    db $07                                                               ;B2D1C5;
    dw $211B,$01FD                                                       ;B2D1C6;
    db $FF                                                               ;B2D1CA;
    dw $210B,$81F4                                                       ;B2D1CB;
    db $00                                                               ;B2D1CF;
    dw $2107,$01F8                                                       ;B2D1D0;
    db $12                                                               ;B2D1D4;
    dw $2134,$01F8                                                       ;B2D1D5;
    db $0A                                                               ;B2D1D9;
    dw $2124                                                             ;B2D1DA;

UNUSED_Spitemaps_SpacePirate_B2D1DC:
    dw $000A,$01FA                                                       ;B2D1DC;
    db $00                                                               ;B2D1E0;
    dw $210A,$01F2                                                       ;B2D1E1;
    db $18                                                               ;B2D1E5;
    dw $2136,$01EB                                                       ;B2D1E6;
    db $18                                                               ;B2D1EA;
    dw $2135,$0006                                                       ;B2D1EB;
    db $18                                                               ;B2D1EF;
    dw $2144,$0006                                                       ;B2D1F0;
    db $10                                                               ;B2D1F4;
    dw $2143,$81FB                                                       ;B2D1F5;
    db $0A                                                               ;B2D1F9;
    dw $2122,$01F9                                                       ;B2D1FA;
    db $08                                                               ;B2D1FE;
    dw $211B,$01F4                                                       ;B2D1FF;
    db $13                                                               ;B2D203;
    dw $2130,$01F3                                                       ;B2D204;
    db $0B                                                               ;B2D208;
    dw $2120,$81F4                                                       ;B2D209;
    db $00                                                               ;B2D20D;
    dw $2107                                                             ;B2D20E;

UNUSED_Spitemaps_SpacePirate_B2D210:
    dw $000B,$01F7                                                       ;B2D210;
    db $13                                                               ;B2D214;
    dw $2131,$01F7                                                       ;B2D215;
    db $0B                                                               ;B2D219;
    dw $2121,$0005                                                       ;B2D21A;
    db $17                                                               ;B2D21E;
    dw $2144,$0005                                                       ;B2D21F;
    db $0F                                                               ;B2D223;
    dw $2143,$81FA                                                       ;B2D224;
    db $08                                                               ;B2D228;
    dw $2122,$01FB                                                       ;B2D229;
    db $06                                                               ;B2D22D;
    dw $211A,$01FB                                                       ;B2D22E;
    db $FE                                                               ;B2D232;
    dw $210A,$01F6                                                       ;B2D233;
    db $18                                                               ;B2D237;
    dw $2126,$01EE                                                       ;B2D238;
    db $18                                                               ;B2D23C;
    dw $2125,$01F8                                                       ;B2D23D;
    db $07                                                               ;B2D241;
    dw $2119,$01F8                                                       ;B2D242;
    db $FF                                                               ;B2D246;
    dw $2109                                                             ;B2D247;

UNUSED_Spitemaps_SpacePirate_B2D249:
    dw $000C,$01FB                                                       ;B2D249;
    db $06                                                               ;B2D24D;
    dw $2119,$01FB                                                       ;B2D24E;
    db $FE                                                               ;B2D252;
    dw $2109,$0002                                                       ;B2D253;
    db $19                                                               ;B2D257;
    dw $2144,$0002                                                       ;B2D258;
    db $11                                                               ;B2D25C;
    dw $2143,$01FC                                                       ;B2D25D;
    db $11                                                               ;B2D261;
    dw $211B,$01FC                                                       ;B2D262;
    db $09                                                               ;B2D266;
    dw $210B,$01FD                                                       ;B2D267;
    db $18                                                               ;B2D26B;
    dw $2126,$01F5                                                       ;B2D26C;
    db $18                                                               ;B2D270;
    dw $2125,$01FE                                                       ;B2D271;
    db $15                                                               ;B2D275;
    dw $2131,$01FE                                                       ;B2D276;
    db $0D                                                               ;B2D27A;
    dw $2121,$01FC                                                       ;B2D27B;
    db $08                                                               ;B2D27F;
    dw $211A,$01FC                                                       ;B2D280;
    db $00                                                               ;B2D284;
    dw $210A                                                             ;B2D285;

UNUSED_Spitemaps_SpacePirate_B2D287:
    dw $000B,$01FA                                                       ;B2D287;
    db $16                                                               ;B2D28B;
    dw $2126,$01F2                                                       ;B2D28C;
    db $16                                                               ;B2D290;
    dw $2125,$81F6                                                       ;B2D291;
    db $00                                                               ;B2D295;
    dw $2107,$01F8                                                       ;B2D296;
    db $12                                                               ;B2D29A;
    dw $2134,$01F8                                                       ;B2D29B;
    db $0A                                                               ;B2D29F;
    dw $2124,$0004                                                       ;B2D2A0;
    db $18                                                               ;B2D2A4;
    dw $2146,$01FC                                                       ;B2D2A5;
    db $18                                                               ;B2D2A9;
    dw $2145,$0001                                                       ;B2D2AA;
    db $13                                                               ;B2D2AE;
    dw $2134,$0001                                                       ;B2D2AF;
    db $0B                                                               ;B2D2B3;
    dw $2124,$01FC                                                       ;B2D2B4;
    db $07                                                               ;B2D2B8;
    dw $211B,$01FD                                                       ;B2D2B9;
    db $FF                                                               ;B2D2BD;
    dw $210B                                                             ;B2D2BE;

Spitemaps_PirateNinja_3D:
    dw $000A,$01F8                                                       ;B2D2C0;
    db $11                                                               ;B2D2C4;
    dw $2134,$01FC                                                       ;B2D2C5;
    db $FE                                                               ;B2D2C9;
    dw $2109,$01FC                                                       ;B2D2CA;
    db $06                                                               ;B2D2CE;
    dw $2119,$0003                                                       ;B2D2CF;
    db $15                                                               ;B2D2D3;
    dw $2126,$01FC                                                       ;B2D2D4;
    db $15                                                               ;B2D2D8;
    dw $2125,$81F5                                                       ;B2D2D9;
    db $FF                                                               ;B2D2DD;
    dw $2107,$81FB                                                       ;B2D2DE;
    db $0A                                                               ;B2D2E2;
    dw $2122,$01FA                                                       ;B2D2E3;
    db $15                                                               ;B2D2E7;
    dw $2126,$01F2                                                       ;B2D2E8;
    db $15                                                               ;B2D2EC;
    dw $2125,$01F8                                                       ;B2D2ED;
    db $09                                                               ;B2D2F1;
    dw $2124                                                             ;B2D2F2;

UNUSED_Spitemaps_SpacePirate_B2D2F4:
    dw $000A,$81F7                                                       ;B2D2F4;
    db $FF                                                               ;B2D2F8;
    dw $2107,$0004                                                       ;B2D2F9;
    db $11                                                               ;B2D2FD;
    dw $2144,$0004                                                       ;B2D2FE;
    db $09                                                               ;B2D302;
    dw $2143,$01F7                                                       ;B2D303;
    db $09                                                               ;B2D307;
    dw $E149,$01FF                                                       ;B2D308;
    db $09                                                               ;B2D30C;
    dw $E148,$81F4                                                       ;B2D30D;
    db $FF                                                               ;B2D311;
    dw $2107,$01F5                                                       ;B2D312;
    db $0B                                                               ;B2D316;
    dw $E149,$01FD                                                       ;B2D317;
    db $0B                                                               ;B2D31B;
    dw $E148,$01FE                                                       ;B2D31C;
    db $13                                                               ;B2D320;
    dw $2144,$01FE                                                       ;B2D321;
    db $0B                                                               ;B2D325;
    dw $2143                                                             ;B2D326;

UNUSED_Spitemaps_SpacePirate_B2D328:
    dw $0003,$0004                                                       ;B2D328;
    db $FC                                                               ;B2D32C;
    dw $214C,$01FC                                                       ;B2D32D;
    db $FC                                                               ;B2D331;
    dw $214B,$01F4                                                       ;B2D332;
    db $FC                                                               ;B2D336;
    dw $214A                                                             ;B2D337;

UNUSED_Spitemaps_SpacePirate_B2D339:
    dw $0002,$81FC                                                       ;B2D339;
    db $F8                                                               ;B2D33D;
    dw $2128,$81F4                                                       ;B2D33E;
    db $F8                                                               ;B2D342;
    dw $2127                                                             ;B2D343;

UNUSED_Spitemaps_SpacePirate_B2D345:
    dw $0003,$01FC                                                       ;B2D345;
    db $F4                                                               ;B2D349;
    dw $E14D,$01FC                                                       ;B2D34A;
    db $FC                                                               ;B2D34E;
    dw $E13D,$01FC                                                       ;B2D34F;
    db $04                                                               ;B2D353;
    dw $E12D                                                             ;B2D354;

UNUSED_Spitemaps_SpacePirate_B2D356:
    dw $0002,$81F4                                                       ;B2D356;
    db $F8                                                               ;B2D35A;
    dw $E12B,$81FC                                                       ;B2D35B;
    db $F8                                                               ;B2D35F;
    dw $E12A                                                             ;B2D360;

UNUSED_Spitemaps_SpacePirate_B2D362:
    dw $0003,$01F4                                                       ;B2D362;
    db $FC                                                               ;B2D366;
    dw $E14C,$01FC                                                       ;B2D367;
    db $FC                                                               ;B2D36B;
    dw $E14B,$0004                                                       ;B2D36C;
    db $FC                                                               ;B2D370;
    dw $E14A                                                             ;B2D371;

UNUSED_Spitemaps_SpacePirate_B2D373:
    dw $0002,$81F4                                                       ;B2D373;
    db $F8                                                               ;B2D377;
    dw $E128,$81FC                                                       ;B2D378;
    db $F8                                                               ;B2D37C;
    dw $E127                                                             ;B2D37D;

UNUSED_Spitemaps_SpacePirate_B2D37F:
    dw $0003,$01FC                                                       ;B2D37F;
    db $04                                                               ;B2D383;
    dw $214D,$01FC                                                       ;B2D384;
    db $FC                                                               ;B2D388;
    dw $213D,$01FC                                                       ;B2D389;
    db $F4                                                               ;B2D38D;
    dw $212D                                                             ;B2D38E;

UNUSED_Spitemaps_SpacePirate_B2D390:
    dw $0002,$81FC                                                       ;B2D390;
    db $F8                                                               ;B2D394;
    dw $212B,$81F4                                                       ;B2D395;
    db $F8                                                               ;B2D399;
    dw $212A                                                             ;B2D39A;

Spitemaps_PirateNinja_3E:
    dw $000A,$01FC                                                       ;B2D39C;
    db $08                                                               ;B2D3A0;
    dw $2119,$01FC                                                       ;B2D3A1;
    db $00                                                               ;B2D3A5;
    dw $2109,$81F4                                                       ;B2D3A6;
    db $01                                                               ;B2D3AA;
    dw $2107,$01F6                                                       ;B2D3AB;
    db $09                                                               ;B2D3AF;
    dw $2124,$01F7                                                       ;B2D3B0;
    db $11                                                               ;B2D3B4;
    dw $2134,$0002                                                       ;B2D3B5;
    db $15                                                               ;B2D3B9;
    dw $2126,$01FC                                                       ;B2D3BA;
    db $15                                                               ;B2D3BE;
    dw $2125,$81FA                                                       ;B2D3BF;
    db $0B                                                               ;B2D3C3;
    dw $2122,$01F9                                                       ;B2D3C4;
    db $15                                                               ;B2D3C8;
    dw $2126,$01F2                                                       ;B2D3C9;
    db $15                                                               ;B2D3CD;
    dw $2125                                                             ;B2D3CE;

Spitemaps_PirateNinja_3F:
    dw $0005,$81EA                                                       ;B2D3D0;
    db $00                                                               ;B2D3D4;
    dw $2127,$81F2                                                       ;B2D3D5;
    db $00                                                               ;B2D3D9;
    dw $2128,$01FB                                                       ;B2D3DA;
    db $FB                                                               ;B2D3DE;
    dw $2113,$01FB                                                       ;B2D3DF;
    db $F3                                                               ;B2D3E3;
    dw $2103,$81F8                                                       ;B2D3E4;
    db $F0                                                               ;B2D3E8;
    dw $212E                                                             ;B2D3E9;

Spitemaps_PirateNinja_40:
    dw $0005,$8006                                                       ;B2D3EB;
    db $00                                                               ;B2D3EF;
    dw $6127,$81FE                                                       ;B2D3F0;
    db $00                                                               ;B2D3F4;
    dw $6128,$01FD                                                       ;B2D3F5;
    db $FB                                                               ;B2D3F9;
    dw $6113,$01FD                                                       ;B2D3FA;
    db $F3                                                               ;B2D3FE;
    dw $6103,$81F8                                                       ;B2D3FF;
    db $F0                                                               ;B2D403;
    dw $612E                                                             ;B2D404;

UNUSED_Spitemaps_SpacePirate_B2D406:
    dw $000A,$0003                                                       ;B2D406;
    db $13                                                               ;B2D40A;
    dw $6130,$0004                                                       ;B2D40B;
    db $0B                                                               ;B2D40F;
    dw $6120,$0006                                                       ;B2D410;
    db $18                                                               ;B2D414;
    dw $6136,$000D                                                       ;B2D415;
    db $18                                                               ;B2D419;
    dw $6135,$81FB                                                       ;B2D41A;
    db $00                                                               ;B2D41E;
    dw $6107,$01F2                                                       ;B2D41F;
    db $18                                                               ;B2D423;
    dw $6144,$01F2                                                       ;B2D424;
    db $10                                                               ;B2D428;
    dw $6143,$81F2                                                       ;B2D429;
    db $0B                                                               ;B2D42D;
    dw $6122,$01FB                                                       ;B2D42E;
    db $08                                                               ;B2D432;
    dw $611B,$01FB                                                       ;B2D433;
    db $00                                                               ;B2D437;
    dw $610B                                                             ;B2D438;

UNUSED_Spitemaps_SpacePirate_B2D43A:
    dw $000B,$01FF                                                       ;B2D43A;
    db $12                                                               ;B2D43E;
    dw $6131,$01FF                                                       ;B2D43F;
    db $0A                                                               ;B2D443;
    dw $6121,$0001                                                       ;B2D444;
    db $18                                                               ;B2D448;
    dw $6126,$0009                                                       ;B2D449;
    db $18                                                               ;B2D44D;
    dw $6125,$01FE                                                       ;B2D44E;
    db $06                                                               ;B2D452;
    dw $6119,$01FE                                                       ;B2D453;
    db $FE                                                               ;B2D457;
    dw $6109,$01F3                                                       ;B2D458;
    db $17                                                               ;B2D45C;
    dw $6144,$01F3                                                       ;B2D45D;
    db $0F                                                               ;B2D461;
    dw $6143,$81F6                                                       ;B2D462;
    db $08                                                               ;B2D466;
    dw $6122,$01FD                                                       ;B2D467;
    db $06                                                               ;B2D46B;
    dw $611A,$01FD                                                       ;B2D46C;
    db $FE                                                               ;B2D470;
    dw $610A                                                             ;B2D471;

UNUSED_Spitemaps_SpacePirate_B2D473:
    dw $000C,$01FB                                                       ;B2D473;
    db $18                                                               ;B2D477;
    dw $6126,$0003                                                       ;B2D478;
    db $18                                                               ;B2D47C;
    dw $6125,$01FA                                                       ;B2D47D;
    db $14                                                               ;B2D481;
    dw $6131,$01FA                                                       ;B2D482;
    db $0C                                                               ;B2D486;
    dw $6121,$01FC                                                       ;B2D487;
    db $06                                                               ;B2D48B;
    dw $611A,$01FC                                                       ;B2D48C;
    db $FE                                                               ;B2D490;
    dw $610A,$01F4                                                       ;B2D491;
    db $18                                                               ;B2D495;
    dw $6144,$01F4                                                       ;B2D496;
    db $10                                                               ;B2D49A;
    dw $6143,$01FB                                                       ;B2D49B;
    db $10                                                               ;B2D49F;
    dw $611B,$01FB                                                       ;B2D4A0;
    db $08                                                               ;B2D4A4;
    dw $610B,$01FD                                                       ;B2D4A5;
    db $04                                                               ;B2D4A9;
    dw $6119,$01FD                                                       ;B2D4AA;
    db $FC                                                               ;B2D4AE;
    dw $6109                                                             ;B2D4AF;

UNUSED_Spitemaps_SpacePirate_B2D4B1:
    dw $000B,$01FE                                                       ;B2D4B1;
    db $16                                                               ;B2D4B5;
    dw $6126,$0006                                                       ;B2D4B6;
    db $16                                                               ;B2D4BA;
    dw $6125,$01F4                                                       ;B2D4BB;
    db $18                                                               ;B2D4BF;
    dw $6146,$01FC                                                       ;B2D4C0;
    db $18                                                               ;B2D4C4;
    dw $6145,$01F7                                                       ;B2D4C5;
    db $13                                                               ;B2D4C9;
    dw $6134,$01F7                                                       ;B2D4CA;
    db $0B                                                               ;B2D4CE;
    dw $6124,$01FC                                                       ;B2D4CF;
    db $07                                                               ;B2D4D3;
    dw $611B,$01FB                                                       ;B2D4D4;
    db $FF                                                               ;B2D4D8;
    dw $610B,$81FC                                                       ;B2D4D9;
    db $00                                                               ;B2D4DD;
    dw $6107,$0000                                                       ;B2D4DE;
    db $12                                                               ;B2D4E2;
    dw $6134,$0000                                                       ;B2D4E3;
    db $0A                                                               ;B2D4E7;
    dw $6124                                                             ;B2D4E8;

UNUSED_Spitemaps_SpacePirate_B2D4EA:
    dw $000A,$01FE                                                       ;B2D4EA;
    db $00                                                               ;B2D4EE;
    dw $610A,$0006                                                       ;B2D4EF;
    db $18                                                               ;B2D4F3;
    dw $6136,$000D                                                       ;B2D4F4;
    db $18                                                               ;B2D4F8;
    dw $6135,$01F2                                                       ;B2D4F9;
    db $18                                                               ;B2D4FD;
    dw $6144,$01F2                                                       ;B2D4FE;
    db $10                                                               ;B2D502;
    dw $6143,$81F5                                                       ;B2D503;
    db $0A                                                               ;B2D507;
    dw $6122,$01FF                                                       ;B2D508;
    db $08                                                               ;B2D50C;
    dw $611B,$0004                                                       ;B2D50D;
    db $13                                                               ;B2D511;
    dw $6130,$0005                                                       ;B2D512;
    db $0B                                                               ;B2D516;
    dw $6120,$81FC                                                       ;B2D517;
    db $00                                                               ;B2D51B;
    dw $6107                                                             ;B2D51C;

UNUSED_Spitemaps_SpacePirate_B2D51E:
    dw $000B,$0001                                                       ;B2D51E;
    db $13                                                               ;B2D522;
    dw $6131,$0001                                                       ;B2D523;
    db $0B                                                               ;B2D527;
    dw $6121,$01F3                                                       ;B2D528;
    db $17                                                               ;B2D52C;
    dw $6144,$01F3                                                       ;B2D52D;
    db $0F                                                               ;B2D531;
    dw $6143,$81F6                                                       ;B2D532;
    db $08                                                               ;B2D536;
    dw $6122,$01FD                                                       ;B2D537;
    db $06                                                               ;B2D53B;
    dw $611A,$01FD                                                       ;B2D53C;
    db $FE                                                               ;B2D540;
    dw $610A,$0002                                                       ;B2D541;
    db $18                                                               ;B2D545;
    dw $6126,$000A                                                       ;B2D546;
    db $18                                                               ;B2D54A;
    dw $6125,$0000                                                       ;B2D54B;
    db $07                                                               ;B2D54F;
    dw $6119,$0000                                                       ;B2D550;
    db $FF                                                               ;B2D554;
    dw $6109                                                             ;B2D555;

UNUSED_Spitemaps_SpacePirate_B2D557:
    dw $000C,$01FD                                                       ;B2D557;
    db $06                                                               ;B2D55B;
    dw $6119,$01FD                                                       ;B2D55C;
    db $FE                                                               ;B2D560;
    dw $6109,$01F6                                                       ;B2D561;
    db $19                                                               ;B2D565;
    dw $6144,$01F6                                                       ;B2D566;
    db $11                                                               ;B2D56A;
    dw $6143,$01FC                                                       ;B2D56B;
    db $11                                                               ;B2D56F;
    dw $611B,$01FC                                                       ;B2D570;
    db $09                                                               ;B2D574;
    dw $610B,$01FB                                                       ;B2D575;
    db $18                                                               ;B2D579;
    dw $6126,$0003                                                       ;B2D57A;
    db $18                                                               ;B2D57E;
    dw $6125,$01FA                                                       ;B2D57F;
    db $15                                                               ;B2D583;
    dw $6131,$01FA                                                       ;B2D584;
    db $0D                                                               ;B2D588;
    dw $6121,$01FC                                                       ;B2D589;
    db $08                                                               ;B2D58D;
    dw $611A,$01FC                                                       ;B2D58E;
    db $00                                                               ;B2D592;
    dw $610A                                                             ;B2D593;

UNUSED_Spitemaps_SpacePirate_B2D595:
    dw $000B,$01FE                                                       ;B2D595;
    db $16                                                               ;B2D599;
    dw $6126,$0006                                                       ;B2D59A;
    db $16                                                               ;B2D59E;
    dw $6125,$81FA                                                       ;B2D59F;
    db $00                                                               ;B2D5A3;
    dw $6107,$0000                                                       ;B2D5A4;
    db $12                                                               ;B2D5A8;
    dw $6134,$0000                                                       ;B2D5A9;
    db $0A                                                               ;B2D5AD;
    dw $6124,$01F4                                                       ;B2D5AE;
    db $18                                                               ;B2D5B2;
    dw $6146,$01FC                                                       ;B2D5B3;
    db $18                                                               ;B2D5B7;
    dw $6145,$01F7                                                       ;B2D5B8;
    db $13                                                               ;B2D5BC;
    dw $6134,$01F7                                                       ;B2D5BD;
    db $0B                                                               ;B2D5C1;
    dw $6124,$01FC                                                       ;B2D5C2;
    db $07                                                               ;B2D5C6;
    dw $611B,$01FB                                                       ;B2D5C7;
    db $FF                                                               ;B2D5CB;
    dw $610B                                                             ;B2D5CC;

Spitemaps_PirateNinja_41:
    dw $000A,$0000                                                       ;B2D5CE;
    db $11                                                               ;B2D5D2;
    dw $6134,$01FC                                                       ;B2D5D3;
    db $FE                                                               ;B2D5D7;
    dw $6109,$01FC                                                       ;B2D5D8;
    db $06                                                               ;B2D5DC;
    dw $6119,$01F5                                                       ;B2D5DD;
    db $15                                                               ;B2D5E1;
    dw $6126,$01FC                                                       ;B2D5E2;
    db $15                                                               ;B2D5E6;
    dw $6125,$81FB                                                       ;B2D5E7;
    db $FF                                                               ;B2D5EB;
    dw $6107,$81F5                                                       ;B2D5EC;
    db $0A                                                               ;B2D5F0;
    dw $6122,$01FE                                                       ;B2D5F1;
    db $15                                                               ;B2D5F5;
    dw $6126,$0006                                                       ;B2D5F6;
    db $15                                                               ;B2D5FA;
    dw $6125,$0000                                                       ;B2D5FB;
    db $09                                                               ;B2D5FF;
    dw $6124                                                             ;B2D600;

UNUSED_Spitemaps_SpacePirate_B2D602:
    dw $000A,$81F9                                                       ;B2D602;
    db $FF                                                               ;B2D606;
    dw $6107,$01F4                                                       ;B2D607;
    db $11                                                               ;B2D60B;
    dw $6144,$01F4                                                       ;B2D60C;
    db $09                                                               ;B2D610;
    dw $6143,$0001                                                       ;B2D611;
    db $09                                                               ;B2D615;
    dw $A149,$01F9                                                       ;B2D616;
    db $09                                                               ;B2D61A;
    dw $A148,$81FC                                                       ;B2D61B;
    db $FF                                                               ;B2D61F;
    dw $6107,$0003                                                       ;B2D620;
    db $0B                                                               ;B2D624;
    dw $A149,$01FB                                                       ;B2D625;
    db $0B                                                               ;B2D629;
    dw $A148,$01FA                                                       ;B2D62A;
    db $13                                                               ;B2D62E;
    dw $6144,$01FA                                                       ;B2D62F;
    db $0B                                                               ;B2D633;
    dw $6143                                                             ;B2D634;

UNUSED_Spitemaps_SpacePirate_B2D636:
    dw $0003,$01F4                                                       ;B2D636;
    db $FC                                                               ;B2D63A;
    dw $614C,$01FC                                                       ;B2D63B;
    db $FC                                                               ;B2D63F;
    dw $614B,$0004                                                       ;B2D640;
    db $FC                                                               ;B2D644;
    dw $614A                                                             ;B2D645;

UNUSED_Spitemaps_SpacePirate_B2D647:
    dw $0002,$81F4                                                       ;B2D647;
    db $F8                                                               ;B2D64B;
    dw $6128,$81FC                                                       ;B2D64C;
    db $F8                                                               ;B2D650;
    dw $6127                                                             ;B2D651;

UNUSED_Spitemaps_SpacePirate_B2D653:
    dw $0003,$01FC                                                       ;B2D653;
    db $F4                                                               ;B2D657;
    dw $A14D,$01FC                                                       ;B2D658;
    db $FC                                                               ;B2D65C;
    dw $A13D,$01FC                                                       ;B2D65D;
    db $04                                                               ;B2D661;
    dw $A12D                                                             ;B2D662;

UNUSED_Spitemaps_SpacePirate_B2D664:
    dw $0002,$81FC                                                       ;B2D664;
    db $F8                                                               ;B2D668;
    dw $A12B,$81F4                                                       ;B2D669;
    db $F8                                                               ;B2D66D;
    dw $A12A                                                             ;B2D66E;

UNUSED_Spitemaps_SpacePirate_B2D670:
    dw $0003,$0004                                                       ;B2D670;
    db $FC                                                               ;B2D674;
    dw $A14C,$01FC                                                       ;B2D675;
    db $FC                                                               ;B2D679;
    dw $A14B,$01F4                                                       ;B2D67A;
    db $FC                                                               ;B2D67E;
    dw $A14A                                                             ;B2D67F;

UNUSED_Spitemaps_SpacePirate_B2D681:
    dw $0002,$81FC                                                       ;B2D681;
    db $F8                                                               ;B2D685;
    dw $A128,$81F4                                                       ;B2D686;
    db $F8                                                               ;B2D68A;
    dw $A127                                                             ;B2D68B;

UNUSED_Spitemaps_SpacePirate_B2D68D:
    dw $0003,$01FC                                                       ;B2D68D;
    db $04                                                               ;B2D691;
    dw $614D,$01FC                                                       ;B2D692;
    db $FC                                                               ;B2D696;
    dw $613D,$01FC                                                       ;B2D697;
    db $F4                                                               ;B2D69B;
    dw $612D                                                             ;B2D69C;

UNUSED_Spitemaps_SpacePirate_B2D69E:
    dw $0002,$81F4                                                       ;B2D69E;
    db $F8                                                               ;B2D6A2;
    dw $612B,$81FC                                                       ;B2D6A3;
    db $F8                                                               ;B2D6A7;
    dw $612A                                                             ;B2D6A8;

Spitemaps_PirateNinja_42:
    dw $000A,$01FC                                                       ;B2D6AA;
    db $08                                                               ;B2D6AE;
    dw $6119,$01FC                                                       ;B2D6AF;
    db $00                                                               ;B2D6B3;
    dw $6109,$81FC                                                       ;B2D6B4;
    db $01                                                               ;B2D6B8;
    dw $6107,$0002                                                       ;B2D6B9;
    db $09                                                               ;B2D6BD;
    dw $6124,$0001                                                       ;B2D6BE;
    db $11                                                               ;B2D6C2;
    dw $6134,$01F6                                                       ;B2D6C3;
    db $15                                                               ;B2D6C7;
    dw $6126,$01FC                                                       ;B2D6C8;
    db $15                                                               ;B2D6CC;
    dw $6125,$81F6                                                       ;B2D6CD;
    db $0B                                                               ;B2D6D1;
    dw $6122,$01FF                                                       ;B2D6D2;
    db $15                                                               ;B2D6D6;
    dw $6126,$0006                                                       ;B2D6D7;
    db $15                                                               ;B2D6DB;
    dw $6125                                                             ;B2D6DC;

Spitemaps_PirateNinja_43:
    dw $0004,$0000                                                       ;B2D6DE;
    db $00                                                               ;B2D6E2;
    dw $6151,$01F8                                                       ;B2D6E3;
    db $00                                                               ;B2D6E7;
    dw $2151,$0000                                                       ;B2D6E8;
    db $F8                                                               ;B2D6EC;
    dw $6150,$01F8                                                       ;B2D6ED;
    db $F8                                                               ;B2D6F1;
    dw $2150                                                             ;B2D6F2;

Spitemaps_PirateNinja_44:
    dw $0004,$0000                                                       ;B2D6F4;
    db $00                                                               ;B2D6F8;
    dw $6153,$0000                                                       ;B2D6F9;
    db $F8                                                               ;B2D6FD;
    dw $6152,$01F8                                                       ;B2D6FE;
    db $00                                                               ;B2D702;
    dw $2153,$01F8                                                       ;B2D703;
    db $F8                                                               ;B2D707;
    dw $2152                                                             ;B2D708;

Spitemaps_PirateNinja_45:
    dw $0009,$01FB                                                       ;B2D70A;
    db $FB                                                               ;B2D70E;
    dw $2113,$01FB                                                       ;B2D70F;
    db $F3                                                               ;B2D713;
    dw $2103,$0000                                                       ;B2D714;
    db $F8                                                               ;B2D718;
    dw $213F,$01F8                                                       ;B2D719;
    db $F8                                                               ;B2D71D;
    dw $213E,$01FF                                                       ;B2D71E;
    db $F0                                                               ;B2D722;
    dw $212F,$01F7                                                       ;B2D723;
    db $F0                                                               ;B2D727;
    dw $212E,$81EA                                                       ;B2D728;
    db $00                                                               ;B2D72C;
    dw $2127,$81F2                                                       ;B2D72D;
    db $00                                                               ;B2D731;
    dw $2128,$81F0                                                       ;B2D732;
    db $EB                                                               ;B2D736;
    dw $210E                                                             ;B2D737;

UNUSED_Spitemaps_SpacePirate_B2D739:
    dw $0009,$01FA                                                       ;B2D739;
    db $FB                                                               ;B2D73D;
    dw $2113,$01FA                                                       ;B2D73E;
    db $F3                                                               ;B2D742;
    dw $2103,$0000                                                       ;B2D743;
    db $F8                                                               ;B2D747;
    dw $213F,$01F8                                                       ;B2D748;
    db $F8                                                               ;B2D74C;
    dw $213E,$01FE                                                       ;B2D74D;
    db $F0                                                               ;B2D751;
    dw $212F,$01F6                                                       ;B2D752;
    db $F0                                                               ;B2D756;
    dw $212E,$81E9                                                       ;B2D757;
    db $00                                                               ;B2D75B;
    dw $2127,$81F1                                                       ;B2D75C;
    db $00                                                               ;B2D760;
    dw $2128,$81EE                                                       ;B2D761;
    db $EC                                                               ;B2D765;
    dw $210E                                                             ;B2D766;

UNUSED_Spitemaps_SpacePirate_B2D768:
    dw $000A,$01F8                                                       ;B2D768;
    db $00                                                               ;B2D76C;
    dw $214C,$01F0                                                       ;B2D76D;
    db $00                                                               ;B2D771;
    dw $214B,$01E8                                                       ;B2D772;
    db $00                                                               ;B2D776;
    dw $214A,$01F9                                                       ;B2D777;
    db $FB                                                               ;B2D77B;
    dw $2113,$01F9                                                       ;B2D77C;
    db $F3                                                               ;B2D780;
    dw $2103,$01FF                                                       ;B2D781;
    db $F8                                                               ;B2D785;
    dw $213F,$01F7                                                       ;B2D786;
    db $F8                                                               ;B2D78A;
    dw $213E,$01FD                                                       ;B2D78B;
    db $F0                                                               ;B2D78F;
    dw $212F,$01F5                                                       ;B2D790;
    db $F0                                                               ;B2D794;
    dw $212E,$81EC                                                       ;B2D795;
    db $ED                                                               ;B2D799;
    dw $210E                                                             ;B2D79A;

UNUSED_Spitemaps_SpacePirate_B2D79C:
    dw $0009,$81EE                                                       ;B2D79C;
    db $F8                                                               ;B2D7A0;
    dw $212B,$81E6                                                       ;B2D7A1;
    db $F8                                                               ;B2D7A5;
    dw $212A,$01F8                                                       ;B2D7A6;
    db $FB                                                               ;B2D7AA;
    dw $2113,$01F8                                                       ;B2D7AB;
    db $F3                                                               ;B2D7AF;
    dw $2103,$01FF                                                       ;B2D7B0;
    db $F8                                                               ;B2D7B4;
    dw $213F,$01F7                                                       ;B2D7B5;
    db $F8                                                               ;B2D7B9;
    dw $213E,$01FD                                                       ;B2D7BA;
    db $F0                                                               ;B2D7BE;
    dw $212F,$01F5                                                       ;B2D7BF;
    db $F0                                                               ;B2D7C3;
    dw $212E,$81EB                                                       ;B2D7C4;
    db $EE                                                               ;B2D7C8;
    dw $210E                                                             ;B2D7C9;

UNUSED_Spitemaps_SpacePirate_B2D7CB:
    dw $0009,$81EE                                                       ;B2D7CB;
    db $FA                                                               ;B2D7CF;
    dw $212B,$81E6                                                       ;B2D7D0;
    db $FA                                                               ;B2D7D4;
    dw $212A,$01F7                                                       ;B2D7D5;
    db $FA                                                               ;B2D7D9;
    dw $2113,$01F7                                                       ;B2D7DA;
    db $F3                                                               ;B2D7DE;
    dw $2103,$01FE                                                       ;B2D7DF;
    db $F8                                                               ;B2D7E3;
    dw $213F,$01F6                                                       ;B2D7E4;
    db $F8                                                               ;B2D7E8;
    dw $213E,$01FC                                                       ;B2D7E9;
    db $F0                                                               ;B2D7ED;
    dw $212F,$01F4                                                       ;B2D7EE;
    db $F0                                                               ;B2D7F2;
    dw $212E,$81EA                                                       ;B2D7F3;
    db $EF                                                               ;B2D7F7;
    dw $210E                                                             ;B2D7F8;

UNUSED_Spitemaps_SpacePirate_B2D7FA:
    dw $0009,$81EE                                                       ;B2D7FA;
    db $FB                                                               ;B2D7FE;
    dw $212B,$81E6                                                       ;B2D7FF;
    db $FB                                                               ;B2D803;
    dw $212A,$01F7                                                       ;B2D804;
    db $FB                                                               ;B2D808;
    dw $2113,$01F6                                                       ;B2D809;
    db $F4                                                               ;B2D80D;
    dw $2103,$01FE                                                       ;B2D80E;
    db $F8                                                               ;B2D812;
    dw $213F,$01F5                                                       ;B2D813;
    db $F9                                                               ;B2D817;
    dw $213E,$01FB                                                       ;B2D818;
    db $F1                                                               ;B2D81C;
    dw $212F,$01F3                                                       ;B2D81D;
    db $F1                                                               ;B2D821;
    dw $212E,$81EA                                                       ;B2D822;
    db $F0                                                               ;B2D826;
    dw $210E                                                             ;B2D827;

Spitemaps_PirateNinja_46:
    dw $0009,$01FD                                                       ;B2D829;
    db $FB                                                               ;B2D82D;
    dw $6113,$01FD                                                       ;B2D82E;
    db $F3                                                               ;B2D832;
    dw $6103,$01F8                                                       ;B2D833;
    db $F8                                                               ;B2D837;
    dw $613F,$0000                                                       ;B2D838;
    db $F8                                                               ;B2D83C;
    dw $613E,$01F9                                                       ;B2D83D;
    db $F0                                                               ;B2D841;
    dw $612F,$0001                                                       ;B2D842;
    db $F0                                                               ;B2D846;
    dw $612E,$8006                                                       ;B2D847;
    db $00                                                               ;B2D84B;
    dw $6127,$81FE                                                       ;B2D84C;
    db $00                                                               ;B2D850;
    dw $6128,$8000                                                       ;B2D851;
    db $EB                                                               ;B2D855;
    dw $610E                                                             ;B2D856;

UNUSED_Spitemaps_SpacePirate_B2D858:
    dw $0009,$01FE                                                       ;B2D858;
    db $FB                                                               ;B2D85C;
    dw $6113,$01FE                                                       ;B2D85D;
    db $F3                                                               ;B2D861;
    dw $6103,$01F8                                                       ;B2D862;
    db $F8                                                               ;B2D866;
    dw $613F,$0000                                                       ;B2D867;
    db $F8                                                               ;B2D86B;
    dw $613E,$01FA                                                       ;B2D86C;
    db $F0                                                               ;B2D870;
    dw $612F,$0002                                                       ;B2D871;
    db $F0                                                               ;B2D875;
    dw $612E,$8007                                                       ;B2D876;
    db $00                                                               ;B2D87A;
    dw $6127,$81FF                                                       ;B2D87B;
    db $00                                                               ;B2D87F;
    dw $6128,$8002                                                       ;B2D880;
    db $EC                                                               ;B2D884;
    dw $610E                                                             ;B2D885;

UNUSED_Spitemaps_SpacePirate_B2D887:
    dw $000A,$0000                                                       ;B2D887;
    db $00                                                               ;B2D88B;
    dw $614C,$0008                                                       ;B2D88C;
    db $00                                                               ;B2D890;
    dw $614B,$0010                                                       ;B2D891;
    db $00                                                               ;B2D895;
    dw $614A,$01FF                                                       ;B2D896;
    db $FB                                                               ;B2D89A;
    dw $6113,$01FF                                                       ;B2D89B;
    db $F3                                                               ;B2D89F;
    dw $6103,$01F9                                                       ;B2D8A0;
    db $F8                                                               ;B2D8A4;
    dw $613F,$0001                                                       ;B2D8A5;
    db $F8                                                               ;B2D8A9;
    dw $613E,$01FB                                                       ;B2D8AA;
    db $F0                                                               ;B2D8AE;
    dw $612F,$0003                                                       ;B2D8AF;
    db $F0                                                               ;B2D8B3;
    dw $612E,$8004                                                       ;B2D8B4;
    db $ED                                                               ;B2D8B8;
    dw $610E                                                             ;B2D8B9;

UNUSED_Spitemaps_SpacePirate_B2D8BB:
    dw $0009,$8002                                                       ;B2D8BB;
    db $F8                                                               ;B2D8BF;
    dw $612B,$800A                                                       ;B2D8C0;
    db $F8                                                               ;B2D8C4;
    dw $612A,$0000                                                       ;B2D8C5;
    db $FB                                                               ;B2D8C9;
    dw $6113,$0000                                                       ;B2D8CA;
    db $F3                                                               ;B2D8CE;
    dw $6103,$01F9                                                       ;B2D8CF;
    db $F8                                                               ;B2D8D3;
    dw $613F,$0001                                                       ;B2D8D4;
    db $F8                                                               ;B2D8D8;
    dw $613E,$01FB                                                       ;B2D8D9;
    db $F0                                                               ;B2D8DD;
    dw $612F,$0003                                                       ;B2D8DE;
    db $F0                                                               ;B2D8E2;
    dw $612E,$8005                                                       ;B2D8E3;
    db $EE                                                               ;B2D8E7;
    dw $610E                                                             ;B2D8E8;

UNUSED_Spitemaps_SpacePirate_B2D8EA:
    dw $0009,$8002                                                       ;B2D8EA;
    db $FA                                                               ;B2D8EE;
    dw $612B,$800A                                                       ;B2D8EF;
    db $FA                                                               ;B2D8F3;
    dw $612A,$0001                                                       ;B2D8F4;
    db $FA                                                               ;B2D8F8;
    dw $6113,$0001                                                       ;B2D8F9;
    db $F3                                                               ;B2D8FD;
    dw $6103,$01FA                                                       ;B2D8FE;
    db $F8                                                               ;B2D902;
    dw $613F,$0002                                                       ;B2D903;
    db $F8                                                               ;B2D907;
    dw $613E,$01FC                                                       ;B2D908;
    db $F0                                                               ;B2D90C;
    dw $612F,$0004                                                       ;B2D90D;
    db $F0                                                               ;B2D911;
    dw $612E,$8006                                                       ;B2D912;
    db $EF                                                               ;B2D916;
    dw $610E                                                             ;B2D917;

UNUSED_Spitemaps_SpacePirate_B2D919:
    dw $0009,$8002                                                       ;B2D919;
    db $FB                                                               ;B2D91D;
    dw $612B,$800A                                                       ;B2D91E;
    db $FB                                                               ;B2D922;
    dw $612A,$0001                                                       ;B2D923;
    db $FB                                                               ;B2D927;
    dw $6113,$0002                                                       ;B2D928;
    db $F4                                                               ;B2D92C;
    dw $6103,$01FA                                                       ;B2D92D;
    db $F8                                                               ;B2D931;
    dw $613F,$0003                                                       ;B2D932;
    db $F9                                                               ;B2D936;
    dw $613E,$01FD                                                       ;B2D937;
    db $F1                                                               ;B2D93B;
    dw $612F,$0005                                                       ;B2D93C;
    db $F1                                                               ;B2D940;
    dw $612E,$8006                                                       ;B2D941;
    db $F0                                                               ;B2D945;
    dw $610E                                                             ;B2D946;

UNUSED_Spitemaps_SpacePirate_B2D948:
    dw $000A,$81F4                                                       ;B2D948;
    db $00                                                               ;B2D94C;
    dw $2107,$01FD                                                       ;B2D94D;
    db $08                                                               ;B2D951;
    dw $211B,$01FD                                                       ;B2D952;
    db $00                                                               ;B2D956;
    dw $210B,$01ED                                                       ;B2D957;
    db $16                                                               ;B2D95B;
    dw $2136,$8000                                                       ;B2D95C;
    db $08                                                               ;B2D960;
    dw $217E,$01F1                                                       ;B2D961;
    db $13                                                               ;B2D965;
    dw $2130,$01F1                                                       ;B2D966;
    db $0B                                                               ;B2D96A;
    dw $2120,$01E6                                                       ;B2D96B;
    db $16                                                               ;B2D96F;
    dw $2135,$000D                                                       ;B2D970;
    db $16                                                               ;B2D974;
    dw $2144,$000C                                                       ;B2D975;
    db $0E                                                               ;B2D979;
    dw $2143                                                             ;B2D97A;

UNUSED_Spitemaps_SpacePirate_B2D97C:
    dw $000C,$000B                                                       ;B2D97C;
    db $10                                                               ;B2D980;
    dw $218D,$000B                                                       ;B2D981;
    db $08                                                               ;B2D985;
    dw $217D,$0008                                                       ;B2D986;
    db $09                                                               ;B2D98A;
    dw $216D,$0000                                                       ;B2D98B;
    db $09                                                               ;B2D98F;
    dw $216C,$01F9                                                       ;B2D990;
    db $12                                                               ;B2D994;
    dw $2131,$01F9                                                       ;B2D995;
    db $0A                                                               ;B2D999;
    dw $2121,$01F7                                                       ;B2D99A;
    db $18                                                               ;B2D99E;
    dw $2126,$01EF                                                       ;B2D99F;
    db $18                                                               ;B2D9A3;
    dw $2125,$01FA                                                       ;B2D9A4;
    db $06                                                               ;B2D9A8;
    dw $2119,$01FA                                                       ;B2D9A9;
    db $FE                                                               ;B2D9AD;
    dw $2109,$01FC                                                       ;B2D9AE;
    db $06                                                               ;B2D9B2;
    dw $211A,$01FC                                                       ;B2D9B3;
    db $FE                                                               ;B2D9B7;
    dw $210A                                                             ;B2D9B8;

UNUSED_Spitemaps_SpacePirate_B2D9BA:
    dw $000C,$01FC                                                       ;B2D9BA;
    db $06                                                               ;B2D9BE;
    dw $211A,$01FC                                                       ;B2D9BF;
    db $FE                                                               ;B2D9C3;
    dw $210A,$01F9                                                       ;B2D9C4;
    db $05                                                               ;B2D9C8;
    dw $2119,$01FD                                                       ;B2D9C9;
    db $18                                                               ;B2D9CD;
    dw $2126,$01FE                                                       ;B2D9CE;
    db $14                                                               ;B2D9D2;
    dw $2131,$01FE                                                       ;B2D9D3;
    db $0C                                                               ;B2D9D7;
    dw $2121,$01F9                                                       ;B2D9D8;
    db $FD                                                               ;B2D9DC;
    dw $2109,$01F5                                                       ;B2D9DD;
    db $18                                                               ;B2D9E1;
    dw $2125,$0001                                                       ;B2D9E2;
    db $09                                                               ;B2D9E6;
    dw $216F,$01F9                                                       ;B2D9E7;
    db $09                                                               ;B2D9EB;
    dw $216E,$0005                                                       ;B2D9EC;
    db $11                                                               ;B2D9F0;
    dw $2144,$0005                                                       ;B2D9F1;
    db $09                                                               ;B2D9F5;
    dw $2143                                                             ;B2D9F6;

UNUSED_Spitemaps_SpacePirate_B2D9F8:
    dw $000B,$01FA                                                       ;B2D9F8;
    db $14                                                               ;B2D9FC;
    dw $2146,$01F2                                                       ;B2D9FD;
    db $14                                                               ;B2DA01;
    dw $2145,$0006                                                       ;B2DA02;
    db $18                                                               ;B2DA06;
    dw $2146,$01FE                                                       ;B2DA07;
    db $18                                                               ;B2DA0B;
    dw $2145,$0003                                                       ;B2DA0C;
    db $13                                                               ;B2DA10;
    dw $2134,$0003                                                       ;B2DA11;
    db $0B                                                               ;B2DA15;
    dw $2124,$01FE                                                       ;B2DA16;
    db $07                                                               ;B2DA1A;
    dw $211B,$01FF                                                       ;B2DA1B;
    db $FF                                                               ;B2DA1F;
    dw $210B,$81F5                                                       ;B2DA20;
    db $FD                                                               ;B2DA24;
    dw $2107,$01F9                                                       ;B2DA25;
    db $0F                                                               ;B2DA29;
    dw $2134,$01F9                                                       ;B2DA2A;
    db $07                                                               ;B2DA2E;
    dw $2124                                                             ;B2DA2F;

UNUSED_Spitemaps_SpacePirate_B2DA31:
    dw $000A,$01FC                                                       ;B2DA31;
    db $08                                                               ;B2DA35;
    dw $211B,$01FC                                                       ;B2DA36;
    db $00                                                               ;B2DA3A;
    dw $210A,$01F0                                                       ;B2DA3B;
    db $12                                                               ;B2DA3F;
    dw $2130,$81FF                                                       ;B2DA40;
    db $08                                                               ;B2DA44;
    dw $217E,$01EB                                                       ;B2DA45;
    db $16                                                               ;B2DA49;
    dw $2136,$01E4                                                       ;B2DA4A;
    db $16                                                               ;B2DA4E;
    dw $2135,$000D                                                       ;B2DA4F;
    db $16                                                               ;B2DA53;
    dw $2144,$000C                                                       ;B2DA54;
    db $0E                                                               ;B2DA58;
    dw $2143,$01F0                                                       ;B2DA59;
    db $0A                                                               ;B2DA5D;
    dw $2120,$81F3                                                       ;B2DA5E;
    db $FF                                                               ;B2DA62;
    dw $2107                                                             ;B2DA63;

UNUSED_Spitemaps_SpacePirate_B2DA65:
    dw $000C,$000A                                                       ;B2DA65;
    db $0F                                                               ;B2DA69;
    dw $218D,$000A                                                       ;B2DA6A;
    db $07                                                               ;B2DA6E;
    dw $217D,$01F5                                                       ;B2DA6F;
    db $18                                                               ;B2DA73;
    dw $2126,$01ED                                                       ;B2DA74;
    db $18                                                               ;B2DA78;
    dw $2125,$0006                                                       ;B2DA79;
    db $09                                                               ;B2DA7D;
    dw $216D,$01FE                                                       ;B2DA7E;
    db $09                                                               ;B2DA82;
    dw $216C,$01F6                                                       ;B2DA83;
    db $13                                                               ;B2DA87;
    dw $2131,$01F7                                                       ;B2DA88;
    db $0B                                                               ;B2DA8C;
    dw $2121,$01FB                                                       ;B2DA8D;
    db $06                                                               ;B2DA91;
    dw $211A,$01FB                                                       ;B2DA92;
    db $FE                                                               ;B2DA96;
    dw $210A,$01F8                                                       ;B2DA97;
    db $07                                                               ;B2DA9B;
    dw $2119,$01F8                                                       ;B2DA9C;
    db $FF                                                               ;B2DAA0;
    dw $2109                                                             ;B2DAA1;

UNUSED_Spitemaps_SpacePirate_B2DAA3:
    dw $000C,$0007                                                       ;B2DAA3;
    db $12                                                               ;B2DAA7;
    dw $2144,$0007                                                       ;B2DAA8;
    db $0A                                                               ;B2DAAC;
    dw $2143,$0002                                                       ;B2DAAD;
    db $0A                                                               ;B2DAB1;
    dw $216F,$01FA                                                       ;B2DAB2;
    db $0A                                                               ;B2DAB6;
    dw $216E,$01FA                                                       ;B2DAB7;
    db $06                                                               ;B2DABB;
    dw $2119,$01FB                                                       ;B2DABC;
    db $FE                                                               ;B2DAC0;
    dw $2109,$01FD                                                       ;B2DAC1;
    db $18                                                               ;B2DAC5;
    dw $2126,$01F5                                                       ;B2DAC6;
    db $18                                                               ;B2DACA;
    dw $2125,$01FE                                                       ;B2DACB;
    db $15                                                               ;B2DACF;
    dw $2131,$01FE                                                       ;B2DAD0;
    db $0D                                                               ;B2DAD4;
    dw $2121,$01FC                                                       ;B2DAD5;
    db $08                                                               ;B2DAD9;
    dw $211A,$01FC                                                       ;B2DADA;
    db $00                                                               ;B2DADE;
    dw $210A                                                             ;B2DADF;

UNUSED_Spitemaps_SpacePirate_B2DAE1:
    dw $000B,$01FA                                                       ;B2DAE1;
    db $14                                                               ;B2DAE5;
    dw $2146,$01F2                                                       ;B2DAE6;
    db $14                                                               ;B2DAEA;
    dw $2145,$81F6                                                       ;B2DAEB;
    db $FC                                                               ;B2DAEF;
    dw $2107,$01F8                                                       ;B2DAF0;
    db $0E                                                               ;B2DAF4;
    dw $2134,$01F8                                                       ;B2DAF5;
    db $06                                                               ;B2DAF9;
    dw $2124,$0004                                                       ;B2DAFA;
    db $18                                                               ;B2DAFE;
    dw $2146,$01FC                                                       ;B2DAFF;
    db $18                                                               ;B2DB03;
    dw $2145,$0001                                                       ;B2DB04;
    db $13                                                               ;B2DB08;
    dw $2134,$0001                                                       ;B2DB09;
    db $0B                                                               ;B2DB0D;
    dw $2124,$01FC                                                       ;B2DB0E;
    db $07                                                               ;B2DB12;
    dw $211B,$01FD                                                       ;B2DB13;
    db $FF                                                               ;B2DB17;
    dw $210B                                                             ;B2DB18;

Spitemaps_PirateNinja_47:
    dw $0009,$01FC                                                       ;B2DB1A;
    db $FC                                                               ;B2DB1E;
    dw $6112,$01FC                                                       ;B2DB1F;
    db $F4                                                               ;B2DB23;
    dw $6102,$81EC                                                       ;B2DB24;
    db $01                                                               ;B2DB28;
    dw $2127,$81F4                                                       ;B2DB29;
    db $01                                                               ;B2DB2D;
    dw $2128,$81F8                                                       ;B2DB2E;
    db $F0                                                               ;B2DB32;
    dw $212E,$81F1                                                       ;B2DB33;
    db $EA                                                               ;B2DB37;
    dw $210E,$01F6                                                       ;B2DB38;
    db $FE                                                               ;B2DB3C;
    dw $214C,$01EE                                                       ;B2DB3D;
    db $FE                                                               ;B2DB41;
    dw $214B,$01E6                                                       ;B2DB42;
    db $FE                                                               ;B2DB46;
    dw $214A                                                             ;B2DB47;

UNUSED_Spitemaps_SpacePirate_B2DB49:
    dw $0009,$81EB                                                       ;B2DB49;
    db $00                                                               ;B2DB4D;
    dw $2127,$81F3                                                       ;B2DB4E;
    db $00                                                               ;B2DB52;
    dw $2128,$01FB                                                       ;B2DB53;
    db $FB                                                               ;B2DB57;
    dw $2113,$01FA                                                       ;B2DB58;
    db $F3                                                               ;B2DB5C;
    dw $2103,$81F8                                                       ;B2DB5D;
    db $EF                                                               ;B2DB61;
    dw $212E,$81F1                                                       ;B2DB62;
    db $EA                                                               ;B2DB66;
    dw $210E,$01F8                                                       ;B2DB67;
    db $FD                                                               ;B2DB6B;
    dw $214C,$01F0                                                       ;B2DB6C;
    db $FD                                                               ;B2DB70;
    dw $214B,$01E8                                                       ;B2DB71;
    db $FD                                                               ;B2DB75;
    dw $214A                                                             ;B2DB76;

UNUSED_Spitemaps_SpacePirate_B2DB78:
    dw $0008,$81E9                                                       ;B2DB78;
    db $FE                                                               ;B2DB7C;
    dw $2127,$81F1                                                       ;B2DB7D;
    db $FE                                                               ;B2DB81;
    dw $2128,$01FA                                                       ;B2DB82;
    db $F8                                                               ;B2DB86;
    dw $2113,$01FA                                                       ;B2DB87;
    db $F0                                                               ;B2DB8B;
    dw $2103,$81F8                                                       ;B2DB8C;
    db $EE                                                               ;B2DB90;
    dw $212E,$81F1                                                       ;B2DB91;
    db $E8                                                               ;B2DB95;
    dw $210E,$01F3                                                       ;B2DB96;
    db $FC                                                               ;B2DB9A;
    dw $214B,$01EB                                                       ;B2DB9B;
    db $FD                                                               ;B2DB9F;
    dw $214A                                                             ;B2DBA0;

UNUSED_Spitemaps_SpacePirate_B2DBA2:
    dw $0008,$81E8                                                       ;B2DBA2;
    db $00                                                               ;B2DBA6;
    dw $2127,$81F0                                                       ;B2DBA7;
    db $00                                                               ;B2DBAB;
    dw $2128,$01FA                                                       ;B2DBAC;
    db $FA                                                               ;B2DBB0;
    dw $2113,$01FA                                                       ;B2DBB1;
    db $F2                                                               ;B2DBB5;
    dw $2103,$81F8                                                       ;B2DBB6;
    db $EF                                                               ;B2DBBA;
    dw $212E,$81F1                                                       ;B2DBBB;
    db $E9                                                               ;B2DBBF;
    dw $210E,$01F5                                                       ;B2DBC0;
    db $FE                                                               ;B2DBC4;
    dw $214B,$01ED                                                       ;B2DBC5;
    db $FF                                                               ;B2DBC9;
    dw $214A                                                             ;B2DBCA;

UNUSED_Spitemaps_SpacePirate_B2DBCC:
    dw $0007,$01F6                                                       ;B2DBCC;
    db $FC                                                               ;B2DBD0;
    dw $214C,$01EE                                                       ;B2DBD1;
    db $FC                                                               ;B2DBD5;
    dw $214B,$01E6                                                       ;B2DBD6;
    db $FC                                                               ;B2DBDA;
    dw $214A,$01FB                                                       ;B2DBDB;
    db $FA                                                               ;B2DBDF;
    dw $2112,$01FB                                                       ;B2DBE0;
    db $F2                                                               ;B2DBE4;
    dw $2102,$81F8                                                       ;B2DBE5;
    db $EF                                                               ;B2DBE9;
    dw $212E,$81F1                                                       ;B2DBEA;
    db $E9                                                               ;B2DBEE;
    dw $210E                                                             ;B2DBEF;

UNUSED_Spitemaps_SpacePirate_B2DBF1:
    dw $0007,$81F4                                                       ;B2DBF1;
    db $F2                                                               ;B2DBF5;
    dw $2100,$01E2                                                       ;B2DBF6;
    db $F3                                                               ;B2DBFA;
    dw $212A,$81EA                                                       ;B2DBFB;
    db $F3                                                               ;B2DBFF;
    dw $212B,$81F8                                                       ;B2DC00;
    db $EF                                                               ;B2DC04;
    dw $212E,$81F1                                                       ;B2DC05;
    db $E9                                                               ;B2DC09;
    dw $210E,$01F2                                                       ;B2DC0A;
    db $FD                                                               ;B2DC0E;
    dw $214B,$01EA                                                       ;B2DC0F;
    db $FD                                                               ;B2DC13;
    dw $214A                                                             ;B2DC14;

UNUSED_Spitemaps_SpacePirate_B2DC16:
    dw $0009,$01F1                                                       ;B2DC16;
    db $FD                                                               ;B2DC1A;
    dw $214B,$01E9                                                       ;B2DC1B;
    db $FD                                                               ;B2DC1F;
    dw $214A,$01E0                                                       ;B2DC20;
    db $E9                                                               ;B2DC24;
    dw $212A,$81E8                                                       ;B2DC25;
    db $E9                                                               ;B2DC29;
    dw $212B,$01FB                                                       ;B2DC2A;
    db $F1                                                               ;B2DC2E;
    dw $214F,$01F3                                                       ;B2DC2F;
    db $F1                                                               ;B2DC33;
    dw $214E,$81F8                                                       ;B2DC34;
    db $EF                                                               ;B2DC38;
    dw $212E,$81F1                                                       ;B2DC39;
    db $E9                                                               ;B2DC3D;
    dw $210E,$01F6                                                       ;B2DC3E;
    db $FD                                                               ;B2DC42;
    dw $214C                                                             ;B2DC43;

UNUSED_Spitemaps_SpacePirate_B2DC45:
    dw $000A,$01F0                                                       ;B2DC45;
    db $FD                                                               ;B2DC49;
    dw $214B,$01E8                                                       ;B2DC4A;
    db $FD                                                               ;B2DC4E;
    dw $214A,$01FA                                                       ;B2DC4F;
    db $E4                                                               ;B2DC53;
    dw $214D,$01FA                                                       ;B2DC54;
    db $DC                                                               ;B2DC58;
    dw $213D,$01FA                                                       ;B2DC59;
    db $D4                                                               ;B2DC5D;
    dw $212D,$01FB                                                       ;B2DC5E;
    db $E8                                                               ;B2DC62;
    dw $E113,$01FB                                                       ;B2DC63;
    db $F0                                                               ;B2DC67;
    dw $E103,$81F8                                                       ;B2DC68;
    db $F0                                                               ;B2DC6C;
    dw $212E,$81F1                                                       ;B2DC6D;
    db $EA                                                               ;B2DC71;
    dw $210E,$01F6                                                       ;B2DC72;
    db $FD                                                               ;B2DC76;
    dw $214C                                                             ;B2DC77;

UNUSED_Spitemaps_SpacePirate_B2DC79:
    dw $0014,$01F6                                                       ;B2DC79;
    db $12                                                               ;B2DC7D;
    dw $2134,$01F6                                                       ;B2DC7E;
    db $0A                                                               ;B2DC82;
    dw $2124,$01F7                                                       ;B2DC83;
    db $15                                                               ;B2DC87;
    dw $2126,$01E2                                                       ;B2DC88;
    db $F4                                                               ;B2DC8C;
    dw $212A,$81EA                                                       ;B2DC8D;
    db $F4                                                               ;B2DC91;
    dw $212B,$01F7                                                       ;B2DC92;
    db $FA                                                               ;B2DC96;
    dw $2112,$01F8                                                       ;B2DC97;
    db $F2                                                               ;B2DC9B;
    dw $2102,$0002                                                       ;B2DC9C;
    db $12                                                               ;B2DCA0;
    dw $2134,$01FD                                                       ;B2DCA1;
    db $16                                                               ;B2DCA5;
    dw $2125,$01FD                                                       ;B2DCA6;
    db $07                                                               ;B2DCAA;
    dw $211A,$01FE                                                       ;B2DCAB;
    db $FF                                                               ;B2DCAF;
    dw $210A,$0001                                                       ;B2DCB0;
    db $0A                                                               ;B2DCB4;
    dw $2124,$81F6                                                       ;B2DCB5;
    db $F0                                                               ;B2DCB9;
    dw $212E,$81F0                                                       ;B2DCBA;
    db $EA                                                               ;B2DCBE;
    dw $210E,$01EF                                                       ;B2DCBF;
    db $16                                                               ;B2DCC3;
    dw $2145,$81F3                                                       ;B2DCC4;
    db $FF                                                               ;B2DCC8;
    dw $2107,$01F6                                                       ;B2DCC9;
    db $FE                                                               ;B2DCCD;
    dw $214C,$01EE                                                       ;B2DCCE;
    db $FE                                                               ;B2DCD2;
    dw $214B,$01E6                                                       ;B2DCD3;
    db $FE                                                               ;B2DCD7;
    dw $214A,$0005                                                       ;B2DCD8;
    db $15                                                               ;B2DCDC;
    dw $2126                                                             ;B2DCDD;

UNUSED_Spitemaps_SpacePirate_B2DCDF:
    dw $0013,$01F7                                                       ;B2DCDF;
    db $08                                                               ;B2DCE3;
    dw $2124,$0007                                                       ;B2DCE4;
    db $16                                                               ;B2DCE8;
    dw $2146,$01FF                                                       ;B2DCE9;
    db $05                                                               ;B2DCED;
    dw $211A,$01FF                                                       ;B2DCEE;
    db $FD                                                               ;B2DCF2;
    dw $210A,$01E2                                                       ;B2DCF3;
    db $F3                                                               ;B2DCF7;
    dw $212A,$81EA                                                       ;B2DCF8;
    db $F3                                                               ;B2DCFC;
    dw $212B,$81F2                                                       ;B2DCFD;
    db $F1                                                               ;B2DD01;
    dw $2100,$81F6                                                       ;B2DD02;
    db $EF                                                               ;B2DD06;
    dw $212E,$81EF                                                       ;B2DD07;
    db $EA                                                               ;B2DD0B;
    dw $210E,$01F8                                                       ;B2DD0C;
    db $16                                                               ;B2DD10;
    dw $2146,$01F0                                                       ;B2DD11;
    db $15                                                               ;B2DD15;
    dw $2145,$01FF                                                       ;B2DD16;
    db $15                                                               ;B2DD1A;
    dw $2145,$0003                                                       ;B2DD1B;
    db $10                                                               ;B2DD1F;
    dw $2134,$0002                                                       ;B2DD20;
    db $08                                                               ;B2DD24;
    dw $2124,$81F4                                                       ;B2DD25;
    db $FE                                                               ;B2DD29;
    dw $2107,$01F7                                                       ;B2DD2A;
    db $10                                                               ;B2DD2E;
    dw $2134,$01F5                                                       ;B2DD2F;
    db $FD                                                               ;B2DD33;
    dw $214C,$01ED                                                       ;B2DD34;
    db $FD                                                               ;B2DD38;
    dw $214B,$01E5                                                       ;B2DD39;
    db $FD                                                               ;B2DD3D;
    dw $214A                                                             ;B2DD3E;

UNUSED_Spitemaps_SpacePirate_B2DD40:
    dw $0014,$01F7                                                       ;B2DD40;
    db $09                                                               ;B2DD44;
    dw $2124,$01F7                                                       ;B2DD45;
    db $06                                                               ;B2DD49;
    dw $2119,$01F7                                                       ;B2DD4A;
    db $FF                                                               ;B2DD4E;
    dw $2109,$01E0                                                       ;B2DD4F;
    db $F5                                                               ;B2DD53;
    dw $212A,$81E8                                                       ;B2DD54;
    db $F5                                                               ;B2DD58;
    dw $212B,$81F1                                                       ;B2DD59;
    db $F3                                                               ;B2DD5D;
    dw $2100,$81F5                                                       ;B2DD5E;
    db $F0                                                               ;B2DD62;
    dw $212E,$81EE                                                       ;B2DD63;
    db $EB                                                               ;B2DD67;
    dw $210E,$01F8                                                       ;B2DD68;
    db $16                                                               ;B2DD6C;
    dw $2146,$01F0                                                       ;B2DD6D;
    db $16                                                               ;B2DD71;
    dw $2145,$0006                                                       ;B2DD72;
    db $16                                                               ;B2DD76;
    dw $2146,$01FE                                                       ;B2DD77;
    db $16                                                               ;B2DD7B;
    dw $2145,$0003                                                       ;B2DD7C;
    db $11                                                               ;B2DD80;
    dw $2134,$0003                                                       ;B2DD81;
    db $09                                                               ;B2DD85;
    dw $2124,$01FF                                                       ;B2DD86;
    db $07                                                               ;B2DD8A;
    dw $211B,$01FF                                                       ;B2DD8B;
    db $FF                                                               ;B2DD8F;
    dw $210B,$01F8                                                       ;B2DD90;
    db $11                                                               ;B2DD94;
    dw $2134,$01F4                                                       ;B2DD95;
    db $FE                                                               ;B2DD99;
    dw $214C,$01EC                                                       ;B2DD9A;
    db $FE                                                               ;B2DD9E;
    dw $214B,$01E4                                                       ;B2DD9F;
    db $FE                                                               ;B2DDA3;
    dw $214A                                                             ;B2DDA4;

UNUSED_Spitemaps_SpacePirate_B2DDA6:
    dw $000E,$81F4                                                       ;B2DDA6;
    db $FF                                                               ;B2DDAA;
    dw $2128,$81EC                                                       ;B2DDAB;
    db $FF                                                               ;B2DDAF;
    dw $2127,$0003                                                       ;B2DDB0;
    db $15                                                               ;B2DDB4;
    dw $2126,$81FA                                                       ;B2DDB5;
    db $0B                                                               ;B2DDB9;
    dw $2122,$01FB                                                       ;B2DDBA;
    db $FC                                                               ;B2DDBE;
    dw $2113,$01FB                                                       ;B2DDBF;
    db $F4                                                               ;B2DDC3;
    dw $2103,$81F2                                                       ;B2DDC4;
    db $EB                                                               ;B2DDC8;
    dw $210E,$81F7                                                       ;B2DDC9;
    db $F2                                                               ;B2DDCD;
    dw $212E,$01FB                                                       ;B2DDCE;
    db $15                                                               ;B2DDD2;
    dw $2125,$81F7                                                       ;B2DDD3;
    db $FF                                                               ;B2DDD7;
    dw $2107,$81F3                                                       ;B2DDD8;
    db $FF                                                               ;B2DDDC;
    dw $2107,$81F4                                                       ;B2DDDD;
    db $0A                                                               ;B2DDE1;
    dw $2122,$01FB                                                       ;B2DDE2;
    db $15                                                               ;B2DDE6;
    dw $2126,$01F3                                                       ;B2DDE7;
    db $15                                                               ;B2DDEB;
    dw $2125                                                             ;B2DDEC;

Spitemaps_PirateNinja_48:
    dw $0012,$81F3                                                       ;B2DDEE;
    db $EC                                                               ;B2DDF2;
    dw $210E,$0008                                                       ;B2DDF3;
    db $FC                                                               ;B2DDF7;
    dw $E14D,$0009                                                       ;B2DDF8;
    db $04                                                               ;B2DDFC;
    dw $E13D,$0009                                                       ;B2DDFD;
    db $0C                                                               ;B2DE01;
    dw $E12D,$81FE                                                       ;B2DE02;
    db $F2                                                               ;B2DE06;
    dw $2105,$81F9                                                       ;B2DE07;
    db $F1                                                               ;B2DE0B;
    dw $212E,$81EE                                                       ;B2DE0C;
    db $F3                                                               ;B2DE10;
    dw $212B,$81E6                                                       ;B2DE11;
    db $F3                                                               ;B2DE15;
    dw $212A,$81F7                                                       ;B2DE16;
    db $FF                                                               ;B2DE1A;
    dw $2107,$0002                                                       ;B2DE1B;
    db $11                                                               ;B2DE1F;
    dw $2144,$0002                                                       ;B2DE20;
    db $09                                                               ;B2DE24;
    dw $2143,$01F7                                                       ;B2DE25;
    db $09                                                               ;B2DE29;
    dw $E149,$01FF                                                       ;B2DE2A;
    db $09                                                               ;B2DE2E;
    dw $E148,$81F4                                                       ;B2DE2F;
    db $FF                                                               ;B2DE33;
    dw $2107,$01F5                                                       ;B2DE34;
    db $0B                                                               ;B2DE38;
    dw $E149,$01FD                                                       ;B2DE39;
    db $0B                                                               ;B2DE3D;
    dw $E148,$01FE                                                       ;B2DE3E;
    db $13                                                               ;B2DE42;
    dw $2144,$01FE                                                       ;B2DE43;
    db $0B                                                               ;B2DE47;
    dw $2143                                                             ;B2DE48;

Spitemaps_PirateNinja_49:
    dw $0016,$01FE                                                       ;B2DE4A;
    db $15                                                               ;B2DE4E;
    dw $2134,$01FD                                                       ;B2DE4F;
    db $0D                                                               ;B2DE53;
    dw $2124,$01FA                                                       ;B2DE54;
    db $FB                                                               ;B2DE58;
    dw $214C,$01F2                                                       ;B2DE59;
    db $FB                                                               ;B2DE5D;
    dw $214B,$01EA                                                       ;B2DE5E;
    db $FB                                                               ;B2DE62;
    dw $214A,$01FC                                                       ;B2DE63;
    db $F9                                                               ;B2DE67;
    dw $2113,$01FC                                                       ;B2DE68;
    db $F1                                                               ;B2DE6C;
    dw $2103,$0000                                                       ;B2DE6D;
    db $18                                                               ;B2DE71;
    dw $2126,$01F8                                                       ;B2DE72;
    db $18                                                               ;B2DE76;
    dw $2125,$01FB                                                       ;B2DE77;
    db $08                                                               ;B2DE7B;
    dw $211A,$01FC                                                       ;B2DE7C;
    db $00                                                               ;B2DE80;
    dw $210A,$81F3                                                       ;B2DE81;
    db $E6                                                               ;B2DE85;
    dw $210E,$81F9                                                       ;B2DE86;
    db $EF                                                               ;B2DE8A;
    dw $212E,$01FA                                                       ;B2DE8B;
    db $FD                                                               ;B2DE8F;
    dw $2149,$01F2                                                       ;B2DE90;
    db $FD                                                               ;B2DE94;
    dw $2148,$01F4                                                       ;B2DE95;
    db $0D                                                               ;B2DE99;
    dw $2146,$01EC                                                       ;B2DE9A;
    db $0D                                                               ;B2DE9E;
    dw $2145,$01F3                                                       ;B2DE9F;
    db $09                                                               ;B2DEA3;
    dw $2134,$01F3                                                       ;B2DEA4;
    db $01                                                               ;B2DEA8;
    dw $2124,$0004                                                       ;B2DEA9;
    db $F9                                                               ;B2DEAD;
    dw $E14D,$0005                                                       ;B2DEAE;
    db $01                                                               ;B2DEB2;
    dw $E13D,$0006                                                       ;B2DEB3;
    db $09                                                               ;B2DEB7;
    dw $E12D                                                             ;B2DEB8;

UNUSED_Spitemaps_SpacePirate_B2DEBA:
    dw $0014,$01F8                                                       ;B2DEBA;
    db $F2                                                               ;B2DEBE;
    dw $214F,$01F0                                                       ;B2DEBF;
    db $F1                                                               ;B2DEC3;
    dw $214E,$01EC                                                       ;B2DEC4;
    db $EE                                                               ;B2DEC8;
    dw $214D,$01EC                                                       ;B2DEC9;
    db $E6                                                               ;B2DECD;
    dw $213D,$01EC                                                       ;B2DECE;
    db $DE                                                               ;B2DED2;
    dw $212D,$81F5                                                       ;B2DED3;
    db $F1                                                               ;B2DED7;
    dw $212E,$81EE                                                       ;B2DED8;
    db $EB                                                               ;B2DEDC;
    dw $210E,$01EC                                                       ;B2DEDD;
    db $F0                                                               ;B2DEE1;
    dw $213D,$01EC                                                       ;B2DEE2;
    db $F8                                                               ;B2DEE6;
    dw $214D,$81EE                                                       ;B2DEE7;
    db $F1                                                               ;B2DEEB;
    dw $2100,$81F7                                                       ;B2DEEC;
    db $FF                                                               ;B2DEF0;
    dw $2107,$0004                                                       ;B2DEF1;
    db $11                                                               ;B2DEF5;
    dw $2144,$0004                                                       ;B2DEF6;
    db $09                                                               ;B2DEFA;
    dw $2143,$01F7                                                       ;B2DEFB;
    db $09                                                               ;B2DEFF;
    dw $E149,$01FF                                                       ;B2DF00;
    db $09                                                               ;B2DF04;
    dw $E148,$81F4                                                       ;B2DF05;
    db $FF                                                               ;B2DF09;
    dw $2107,$01F5                                                       ;B2DF0A;
    db $0B                                                               ;B2DF0E;
    dw $E149,$01FD                                                       ;B2DF0F;
    db $0B                                                               ;B2DF13;
    dw $E148,$01FE                                                       ;B2DF14;
    db $13                                                               ;B2DF18;
    dw $2144,$01FE                                                       ;B2DF19;
    db $0B                                                               ;B2DF1D;
    dw $2143                                                             ;B2DF1E;

UNUSED_Spitemaps_SpacePirate_B2DF20:
    dw $000F,$01E8                                                       ;B2DF20;
    db $F7                                                               ;B2DF24;
    dw $212A,$81F0                                                       ;B2DF25;
    db $F7                                                               ;B2DF29;
    dw $212B,$81F7                                                       ;B2DF2A;
    db $F6                                                               ;B2DF2E;
    dw $2100,$81FB                                                       ;B2DF2F;
    db $F2                                                               ;B2DF33;
    dw $212E,$81F4                                                       ;B2DF34;
    db $EC                                                               ;B2DF38;
    dw $210E,$01FE                                                       ;B2DF39;
    db $0B                                                               ;B2DF3D;
    dw $2146,$01F6                                                       ;B2DF3E;
    db $0B                                                               ;B2DF42;
    dw $2145,$0001                                                       ;B2DF43;
    db $00                                                               ;B2DF47;
    dw $2149,$01F9                                                       ;B2DF48;
    db $FF                                                               ;B2DF4C;
    dw $2148,$81F7                                                       ;B2DF4D;
    db $01                                                               ;B2DF51;
    dw $2122,$01EF                                                       ;B2DF52;
    db $F9                                                               ;B2DF56;
    dw $214D,$01EE                                                       ;B2DF57;
    db $F1                                                               ;B2DF5B;
    dw $213D,$01ED                                                       ;B2DF5C;
    db $E9                                                               ;B2DF60;
    dw $212D,$0002                                                       ;B2DF61;
    db $0D                                                               ;B2DF65;
    dw $2144,$0002                                                       ;B2DF66;
    db $05                                                               ;B2DF6A;
    dw $2143                                                             ;B2DF6B;

UNUSED_Spitemaps_SpacePirate_B2DF6D:
    dw $000E,$01F0                                                       ;B2DF6D;
    db $05                                                               ;B2DF71;
    dw $E18D,$01F0                                                       ;B2DF72;
    db $0D                                                               ;B2DF76;
    dw $E17D,$01F6                                                       ;B2DF77;
    db $0B                                                               ;B2DF7B;
    dw $2130,$01F6                                                       ;B2DF7C;
    db $03                                                               ;B2DF80;
    dw $2120,$01E9                                                       ;B2DF81;
    db $F4                                                               ;B2DF85;
    dw $212A,$81F1                                                       ;B2DF86;
    db $F4                                                               ;B2DF8A;
    dw $212B,$81F8                                                       ;B2DF8B;
    db $F3                                                               ;B2DF8F;
    dw $2100,$81FC                                                       ;B2DF90;
    db $F0                                                               ;B2DF94;
    dw $212E,$81F5                                                       ;B2DF95;
    db $EA                                                               ;B2DF99;
    dw $210E,$0001                                                       ;B2DF9A;
    db $FE                                                               ;B2DF9E;
    dw $2149,$01F9                                                       ;B2DF9F;
    db $FE                                                               ;B2DFA3;
    dw $2148,$01F1                                                       ;B2DFA4;
    db $F6                                                               ;B2DFA8;
    dw $214D,$01F0                                                       ;B2DFA9;
    db $EE                                                               ;B2DFAD;
    dw $213D,$01EF                                                       ;B2DFAE;
    db $E6                                                               ;B2DFB2;
    dw $212D                                                             ;B2DFB3;

UNUSED_Spitemaps_SpacePirate_B2DFB5:
    dw $000E,$01F0                                                       ;B2DFB5;
    db $05                                                               ;B2DFB9;
    dw $E18D,$01F0                                                       ;B2DFBA;
    db $0D                                                               ;B2DFBE;
    dw $E17D,$01F5                                                       ;B2DFBF;
    db $0B                                                               ;B2DFC3;
    dw $2130,$01F5                                                       ;B2DFC4;
    db $03                                                               ;B2DFC8;
    dw $2120,$01E8                                                       ;B2DFC9;
    db $F3                                                               ;B2DFCD;
    dw $212A,$81F0                                                       ;B2DFCE;
    db $F3                                                               ;B2DFD2;
    dw $212B,$81F8                                                       ;B2DFD3;
    db $F2                                                               ;B2DFD7;
    dw $2100,$81FC                                                       ;B2DFD8;
    db $F1                                                               ;B2DFDC;
    dw $212E,$81F5                                                       ;B2DFDD;
    db $EB                                                               ;B2DFE1;
    dw $210E,$0001                                                       ;B2DFE2;
    db $FF                                                               ;B2DFE6;
    dw $2149,$01F9                                                       ;B2DFE7;
    db $FE                                                               ;B2DFEB;
    dw $2148,$01F0                                                       ;B2DFEC;
    db $F7                                                               ;B2DFF0;
    dw $214D,$01EF                                                       ;B2DFF1;
    db $EF                                                               ;B2DFF5;
    dw $213D,$01EE                                                       ;B2DFF6;
    db $E7                                                               ;B2DFFA;
    dw $212D                                                             ;B2DFFB;

UNUSED_Spitemaps_SpacePirate_B2DFFD:
    dw $0009,$01F9                                                       ;B2DFFD;
    db $00                                                               ;B2E001;
    dw $E14D,$01F9                                                       ;B2E002;
    db $08                                                               ;B2E006;
    dw $E13D,$01F9                                                       ;B2E007;
    db $10                                                               ;B2E00B;
    dw $E12D,$01FA                                                       ;B2E00C;
    db $FA                                                               ;B2E010;
    dw $2113,$01FA                                                       ;B2E011;
    db $F2                                                               ;B2E015;
    dw $2103,$81F8                                                       ;B2E016;
    db $EF                                                               ;B2E01A;
    dw $212E,$81F1                                                       ;B2E01B;
    db $E9                                                               ;B2E01F;
    dw $210E,$01F5                                                       ;B2E020;
    db $FD                                                               ;B2E024;
    dw $214B,$01ED                                                       ;B2E025;
    db $FE                                                               ;B2E029;
    dw $214A                                                             ;B2E02A;

UNUSED_Spitemaps_SpacePirate_B2E02C:
    dw $0003,$01FC                                                       ;B2E02C;
    db $04                                                               ;B2E030;
    dw $214D,$01FC                                                       ;B2E031;
    db $FC                                                               ;B2E035;
    dw $213D,$01FC                                                       ;B2E036;
    db $F4                                                               ;B2E03A;
    dw $212D                                                             ;B2E03B;

UNUSED_Spitemaps_SpacePirate_B2E03D:
    dw $0010,$81F9                                                       ;B2E03D;
    db $FE                                                               ;B2E041;
    dw $2107,$01E4                                                       ;B2E042;
    db $F3                                                               ;B2E046;
    dw $212A,$81EC                                                       ;B2E047;
    db $F3                                                               ;B2E04B;
    dw $212B,$81F6                                                       ;B2E04C;
    db $F1                                                               ;B2E050;
    dw $2100,$81F2                                                       ;B2E051;
    db $EB                                                               ;B2E055;
    dw $210E,$81F9                                                       ;B2E056;
    db $F1                                                               ;B2E05A;
    dw $212E,$01ED                                                       ;B2E05B;
    db $F9                                                               ;B2E05F;
    dw $214D,$01EC                                                       ;B2E060;
    db $F1                                                               ;B2E064;
    dw $213D,$01EB                                                       ;B2E065;
    db $E9                                                               ;B2E069;
    dw $212D,$81F4                                                       ;B2E06A;
    db $FE                                                               ;B2E06E;
    dw $2107,$01FC                                                       ;B2E06F;
    db $10                                                               ;B2E073;
    dw $2125,$81F3                                                       ;B2E074;
    db $05                                                               ;B2E078;
    dw $2122,$0004                                                       ;B2E079;
    db $10                                                               ;B2E07D;
    dw $2126,$81FB                                                       ;B2E07E;
    db $07                                                               ;B2E082;
    dw $2122,$01FA                                                       ;B2E083;
    db $10                                                               ;B2E087;
    dw $2126,$01F2                                                       ;B2E088;
    db $10                                                               ;B2E08C;
    dw $2125                                                             ;B2E08D;

Spitemaps_PirateNinja_4A:
    dw $0011,$81F3                                                       ;B2E08F;
    db $FB                                                               ;B2E093;
    dw $2127,$81FB                                                       ;B2E094;
    db $FB                                                               ;B2E098;
    dw $2128,$01FE                                                       ;B2E099;
    db $0D                                                               ;B2E09D;
    dw $2121,$01FE                                                       ;B2E09E;
    db $15                                                               ;B2E0A2;
    dw $2131,$01FD                                                       ;B2E0A3;
    db $18                                                               ;B2E0A7;
    dw $2126,$01F5                                                       ;B2E0A8;
    db $18                                                               ;B2E0AC;
    dw $2125,$01FC                                                       ;B2E0AD;
    db $08                                                               ;B2E0B1;
    dw $211A,$01FC                                                       ;B2E0B2;
    db $00                                                               ;B2E0B6;
    dw $210A,$0007                                                       ;B2E0B7;
    db $12                                                               ;B2E0BB;
    dw $2144,$0007                                                       ;B2E0BC;
    db $0A                                                               ;B2E0C0;
    dw $2143,$01FA                                                       ;B2E0C1;
    db $06                                                               ;B2E0C5;
    dw $2119,$01FB                                                       ;B2E0C6;
    db $FE                                                               ;B2E0CA;
    dw $2109,$01FA                                                       ;B2E0CB;
    db $0A                                                               ;B2E0CF;
    dw $216E,$81FA                                                       ;B2E0D0;
    db $F0                                                               ;B2E0D4;
    dw $2105,$81F1                                                       ;B2E0D5;
    db $E6                                                               ;B2E0D9;
    dw $210E,$81F7                                                       ;B2E0DA;
    db $EF                                                               ;B2E0DE;
    dw $212E,$0002                                                       ;B2E0DF;
    db $0A                                                               ;B2E0E3;
    dw $216F                                                             ;B2E0E4;

Spitemaps_PirateNinja_4B:
    dw $0013,$01FE                                                       ;B2E0E6;
    db $FF                                                               ;B2E0EA;
    dw $210A,$01E8                                                       ;B2E0EB;
    db $EE                                                               ;B2E0EF;
    dw $212A,$81EE                                                       ;B2E0F0;
    db $ED                                                               ;B2E0F4;
    dw $212B,$81F6                                                       ;B2E0F5;
    db $EF                                                               ;B2E0F9;
    dw $2100,$000A                                                       ;B2E0FA;
    db $F5                                                               ;B2E0FE;
    dw $E14D,$000B                                                       ;B2E0FF;
    db $FD                                                               ;B2E103;
    dw $E13D,$000C                                                       ;B2E104;
    db $05                                                               ;B2E108;
    dw $E12D,$81F7                                                       ;B2E109;
    db $E9                                                               ;B2E10D;
    dw $210E,$81FB                                                       ;B2E10E;
    db $F1                                                               ;B2E112;
    dw $212E,$01FD                                                       ;B2E113;
    db $07                                                               ;B2E117;
    dw $211A,$01E3                                                       ;B2E118;
    db $FD                                                               ;B2E11C;
    dw $E16F,$01EB                                                       ;B2E11D;
    db $FE                                                               ;B2E121;
    dw $E16E,$01FB                                                       ;B2E122;
    db $FE                                                               ;B2E126;
    dw $219F,$01F3                                                       ;B2E127;
    db $FD                                                               ;B2E12B;
    dw $219E,$0008                                                       ;B2E12C;
    db $16                                                               ;B2E130;
    dw $2126,$0000                                                       ;B2E131;
    db $17                                                               ;B2E135;
    dw $2125,$81FE                                                       ;B2E136;
    db $0A                                                               ;B2E13A;
    dw $2122,$01DE                                                       ;B2E13B;
    db $F4                                                               ;B2E13F;
    dw $E18D,$01DD                                                       ;B2E140;
    db $FC                                                               ;B2E144;
    dw $E17D                                                             ;B2E145;

Spitemaps_PirateNinja_4C:
    dw $0013,$01DE                                                       ;B2E147;
    db $0A                                                               ;B2E14B;
    dw $219D,$81E2                                                       ;B2E14C;
    db $01                                                               ;B2E150;
    dw $21AC,$81EF                                                       ;B2E151;
    db $FB                                                               ;B2E155;
    dw $21AE,$0009                                                       ;B2E156;
    db $F4                                                               ;B2E15A;
    dw $E14D,$000A                                                       ;B2E15B;
    db $FC                                                               ;B2E15F;
    dw $E13D,$000A                                                       ;B2E160;
    db $04                                                               ;B2E164;
    dw $E12D,$0006                                                       ;B2E165;
    db $F3                                                               ;B2E169;
    dw $215F,$01FE                                                       ;B2E16A;
    db $F4                                                               ;B2E16E;
    dw $215E,$01FF                                                       ;B2E16F;
    db $00                                                               ;B2E173;
    dw $610A,$81F3                                                       ;B2E174;
    db $EC                                                               ;B2E178;
    dw $210E,$81F9                                                       ;B2E179;
    db $F2                                                               ;B2E17D;
    dw $212E,$01EF                                                       ;B2E17E;
    db $10                                                               ;B2E182;
    dw $618D,$01EF                                                       ;B2E183;
    db $08                                                               ;B2E187;
    dw $617D,$01F4                                                       ;B2E188;
    db $08                                                               ;B2E18C;
    dw $616F,$01FC                                                       ;B2E18D;
    db $09                                                               ;B2E191;
    dw $616E,$0000                                                       ;B2E192;
    db $08                                                               ;B2E196;
    dw $611A,$01F5                                                       ;B2E197;
    db $EA                                                               ;B2E19B;
    dw $214D,$01F4                                                       ;B2E19C;
    db $E2                                                               ;B2E1A0;
    dw $213D,$01F4                                                       ;B2E1A1;
    db $DA                                                               ;B2E1A5;
    dw $212D                                                             ;B2E1A6;

UNUSED_Spitemaps_SpacePirate_B2E1A8:
    dw $000A,$81FC                                                       ;B2E1A8;
    db $00                                                               ;B2E1AC;
    dw $6107,$01FB                                                       ;B2E1AD;
    db $08                                                               ;B2E1B1;
    dw $611B,$01FB                                                       ;B2E1B2;
    db $00                                                               ;B2E1B6;
    dw $610B,$000B                                                       ;B2E1B7;
    db $16                                                               ;B2E1BB;
    dw $6136,$81F0                                                       ;B2E1BC;
    db $08                                                               ;B2E1C0;
    dw $617E,$0007                                                       ;B2E1C1;
    db $13                                                               ;B2E1C5;
    dw $6130,$0007                                                       ;B2E1C6;
    db $0B                                                               ;B2E1CA;
    dw $6120,$0012                                                       ;B2E1CB;
    db $16                                                               ;B2E1CF;
    dw $6135,$01EB                                                       ;B2E1D0;
    db $16                                                               ;B2E1D4;
    dw $6144,$01EC                                                       ;B2E1D5;
    db $0E                                                               ;B2E1D9;
    dw $6143                                                             ;B2E1DA;

UNUSED_Spitemaps_SpacePirate_B2E1DC:
    dw $000C,$01ED                                                       ;B2E1DC;
    db $10                                                               ;B2E1E0;
    dw $618D,$01ED                                                       ;B2E1E1;
    db $08                                                               ;B2E1E5;
    dw $617D,$01F0                                                       ;B2E1E6;
    db $09                                                               ;B2E1EA;
    dw $616D,$01F8                                                       ;B2E1EB;
    db $09                                                               ;B2E1EF;
    dw $616C,$01FF                                                       ;B2E1F0;
    db $12                                                               ;B2E1F4;
    dw $6131,$01FF                                                       ;B2E1F5;
    db $0A                                                               ;B2E1F9;
    dw $6121,$0001                                                       ;B2E1FA;
    db $18                                                               ;B2E1FE;
    dw $6126,$0009                                                       ;B2E1FF;
    db $18                                                               ;B2E203;
    dw $6125,$01FE                                                       ;B2E204;
    db $06                                                               ;B2E208;
    dw $6119,$01FE                                                       ;B2E209;
    db $FE                                                               ;B2E20D;
    dw $6109,$01FC                                                       ;B2E20E;
    db $06                                                               ;B2E212;
    dw $611A,$01FC                                                       ;B2E213;
    db $FE                                                               ;B2E217;
    dw $610A                                                             ;B2E218;

UNUSED_Spitemaps_SpacePirate_B2E21A:
    dw $000C,$01FC                                                       ;B2E21A;
    db $06                                                               ;B2E21E;
    dw $611A,$01FC                                                       ;B2E21F;
    db $FE                                                               ;B2E223;
    dw $610A,$01FF                                                       ;B2E224;
    db $05                                                               ;B2E228;
    dw $6119,$01FB                                                       ;B2E229;
    db $18                                                               ;B2E22D;
    dw $6126,$01FA                                                       ;B2E22E;
    db $14                                                               ;B2E232;
    dw $6131,$01FA                                                       ;B2E233;
    db $0C                                                               ;B2E237;
    dw $6121,$01FF                                                       ;B2E238;
    db $FD                                                               ;B2E23C;
    dw $6109,$0003                                                       ;B2E23D;
    db $18                                                               ;B2E241;
    dw $6125,$01F7                                                       ;B2E242;
    db $09                                                               ;B2E246;
    dw $616F,$01FF                                                       ;B2E247;
    db $09                                                               ;B2E24B;
    dw $616E,$01F3                                                       ;B2E24C;
    db $11                                                               ;B2E250;
    dw $6144,$01F3                                                       ;B2E251;
    db $09                                                               ;B2E255;
    dw $6143                                                             ;B2E256;

UNUSED_Spitemaps_SpacePirate_B2E258:
    dw $000B,$01FE                                                       ;B2E258;
    db $14                                                               ;B2E25C;
    dw $6146,$0006                                                       ;B2E25D;
    db $14                                                               ;B2E261;
    dw $6145,$01F2                                                       ;B2E262;
    db $18                                                               ;B2E266;
    dw $6146,$01FA                                                       ;B2E267;
    db $18                                                               ;B2E26B;
    dw $6145,$01F5                                                       ;B2E26C;
    db $13                                                               ;B2E270;
    dw $6134,$01F5                                                       ;B2E271;
    db $0B                                                               ;B2E275;
    dw $6124,$01FA                                                       ;B2E276;
    db $07                                                               ;B2E27A;
    dw $611B,$01F9                                                       ;B2E27B;
    db $FF                                                               ;B2E27F;
    dw $610B,$81FB                                                       ;B2E280;
    db $FD                                                               ;B2E284;
    dw $6107,$01FF                                                       ;B2E285;
    db $0F                                                               ;B2E289;
    dw $6134,$01FF                                                       ;B2E28A;
    db $07                                                               ;B2E28E;
    dw $6124                                                             ;B2E28F;

UNUSED_Spitemaps_SpacePirate_B2E291:
    dw $000A,$01FC                                                       ;B2E291;
    db $08                                                               ;B2E295;
    dw $611B,$01FC                                                       ;B2E296;
    db $00                                                               ;B2E29A;
    dw $610A,$0008                                                       ;B2E29B;
    db $12                                                               ;B2E29F;
    dw $6130,$81F1                                                       ;B2E2A0;
    db $08                                                               ;B2E2A4;
    dw $617E,$000D                                                       ;B2E2A5;
    db $16                                                               ;B2E2A9;
    dw $6136,$0014                                                       ;B2E2AA;
    db $16                                                               ;B2E2AE;
    dw $6135,$01EB                                                       ;B2E2AF;
    db $16                                                               ;B2E2B3;
    dw $6144,$01EC                                                       ;B2E2B4;
    db $0E                                                               ;B2E2B8;
    dw $6143,$0008                                                       ;B2E2B9;
    db $0A                                                               ;B2E2BD;
    dw $6120,$81FD                                                       ;B2E2BE;
    db $FF                                                               ;B2E2C2;
    dw $6107                                                             ;B2E2C3;

UNUSED_Spitemaps_SpacePirate_B2E2C5:
    dw $000C,$01EE                                                       ;B2E2C5;
    db $0F                                                               ;B2E2C9;
    dw $618D,$01EE                                                       ;B2E2CA;
    db $07                                                               ;B2E2CE;
    dw $617D,$0003                                                       ;B2E2CF;
    db $18                                                               ;B2E2D3;
    dw $6126,$000B                                                       ;B2E2D4;
    db $18                                                               ;B2E2D8;
    dw $6125,$01F2                                                       ;B2E2D9;
    db $09                                                               ;B2E2DD;
    dw $616D,$01FA                                                       ;B2E2DE;
    db $09                                                               ;B2E2E2;
    dw $616C,$0002                                                       ;B2E2E3;
    db $13                                                               ;B2E2E7;
    dw $6131,$0001                                                       ;B2E2E8;
    db $0B                                                               ;B2E2EC;
    dw $6121,$01FD                                                       ;B2E2ED;
    db $06                                                               ;B2E2F1;
    dw $611A,$01FD                                                       ;B2E2F2;
    db $FE                                                               ;B2E2F6;
    dw $610A,$0000                                                       ;B2E2F7;
    db $07                                                               ;B2E2FB;
    dw $6119,$0000                                                       ;B2E2FC;
    db $FF                                                               ;B2E300;
    dw $6109                                                             ;B2E301;

UNUSED_Spitemaps_SpacePirate_B2E303:
    dw $000C,$01F1                                                       ;B2E303;
    db $12                                                               ;B2E307;
    dw $6144,$01F1                                                       ;B2E308;
    db $0A                                                               ;B2E30C;
    dw $6143,$01F6                                                       ;B2E30D;
    db $0A                                                               ;B2E311;
    dw $616F,$01FE                                                       ;B2E312;
    db $0A                                                               ;B2E316;
    dw $616E,$01FE                                                       ;B2E317;
    db $06                                                               ;B2E31B;
    dw $6119,$01FD                                                       ;B2E31C;
    db $FE                                                               ;B2E320;
    dw $6109,$01FB                                                       ;B2E321;
    db $18                                                               ;B2E325;
    dw $6126,$0003                                                       ;B2E326;
    db $18                                                               ;B2E32A;
    dw $6125,$01FA                                                       ;B2E32B;
    db $15                                                               ;B2E32F;
    dw $6131,$01FA                                                       ;B2E330;
    db $0D                                                               ;B2E334;
    dw $6121,$01FC                                                       ;B2E335;
    db $08                                                               ;B2E339;
    dw $611A,$01FC                                                       ;B2E33A;
    db $00                                                               ;B2E33E;
    dw $610A                                                             ;B2E33F;

UNUSED_Spitemaps_SpacePirate_B2E341:
    dw $000B,$01FE                                                       ;B2E341;
    db $14                                                               ;B2E345;
    dw $6146,$0006                                                       ;B2E346;
    db $14                                                               ;B2E34A;
    dw $6145,$81FA                                                       ;B2E34B;
    db $FC                                                               ;B2E34F;
    dw $6107,$0000                                                       ;B2E350;
    db $0E                                                               ;B2E354;
    dw $6134,$0000                                                       ;B2E355;
    db $06                                                               ;B2E359;
    dw $6124,$01F4                                                       ;B2E35A;
    db $18                                                               ;B2E35E;
    dw $6146,$01FC                                                       ;B2E35F;
    db $18                                                               ;B2E363;
    dw $6145,$01F7                                                       ;B2E364;
    db $13                                                               ;B2E368;
    dw $6134,$01F7                                                       ;B2E369;
    db $0B                                                               ;B2E36D;
    dw $6124,$01FC                                                       ;B2E36E;
    db $07                                                               ;B2E372;
    dw $611B,$01FB                                                       ;B2E373;
    db $FF                                                               ;B2E377;
    dw $610B                                                             ;B2E378;

Spitemaps_PirateNinja_4D:
    dw $0009,$01FC                                                       ;B2E37A;
    db $FC                                                               ;B2E37E;
    dw $2112,$01FC                                                       ;B2E37F;
    db $F4                                                               ;B2E383;
    dw $2102,$8004                                                       ;B2E384;
    db $01                                                               ;B2E388;
    dw $6127,$81FC                                                       ;B2E389;
    db $01                                                               ;B2E38D;
    dw $6128,$81F8                                                       ;B2E38E;
    db $F0                                                               ;B2E392;
    dw $612E,$81FF                                                       ;B2E393;
    db $EA                                                               ;B2E397;
    dw $610E,$0002                                                       ;B2E398;
    db $FE                                                               ;B2E39C;
    dw $614C,$000A                                                       ;B2E39D;
    db $FE                                                               ;B2E3A1;
    dw $614B,$0012                                                       ;B2E3A2;
    db $FE                                                               ;B2E3A6;
    dw $614A                                                             ;B2E3A7;

UNUSED_Spitemaps_SpacePirate_B2E3A9:
    dw $0009,$8005                                                       ;B2E3A9;
    db $00                                                               ;B2E3AD;
    dw $6127,$81FD                                                       ;B2E3AE;
    db $00                                                               ;B2E3B2;
    dw $6128,$01FD                                                       ;B2E3B3;
    db $FB                                                               ;B2E3B7;
    dw $6113,$01FE                                                       ;B2E3B8;
    db $F3                                                               ;B2E3BC;
    dw $6103,$81F8                                                       ;B2E3BD;
    db $EF                                                               ;B2E3C1;
    dw $612E,$81FF                                                       ;B2E3C2;
    db $EA                                                               ;B2E3C6;
    dw $610E,$0000                                                       ;B2E3C7;
    db $FD                                                               ;B2E3CB;
    dw $614C,$0008                                                       ;B2E3CC;
    db $FD                                                               ;B2E3D0;
    dw $614B,$0010                                                       ;B2E3D1;
    db $FD                                                               ;B2E3D5;
    dw $614A                                                             ;B2E3D6;

UNUSED_Spitemaps_SpacePirate_B2E3D8:
    dw $0008,$8007                                                       ;B2E3D8;
    db $FE                                                               ;B2E3DC;
    dw $6127,$81FF                                                       ;B2E3DD;
    db $FE                                                               ;B2E3E1;
    dw $6128,$01FE                                                       ;B2E3E2;
    db $F8                                                               ;B2E3E6;
    dw $6113,$01FE                                                       ;B2E3E7;
    db $F0                                                               ;B2E3EB;
    dw $6103,$81F8                                                       ;B2E3EC;
    db $EE                                                               ;B2E3F0;
    dw $612E,$81FF                                                       ;B2E3F1;
    db $E8                                                               ;B2E3F5;
    dw $610E,$0005                                                       ;B2E3F6;
    db $FC                                                               ;B2E3FA;
    dw $614B,$000D                                                       ;B2E3FB;
    db $FD                                                               ;B2E3FF;
    dw $614A                                                             ;B2E400;

UNUSED_Spitemaps_SpacePirate_B2E402:
    dw $0008,$8008                                                       ;B2E402;
    db $00                                                               ;B2E406;
    dw $6127,$8000                                                       ;B2E407;
    db $00                                                               ;B2E40B;
    dw $6128,$01FE                                                       ;B2E40C;
    db $FA                                                               ;B2E410;
    dw $6113,$01FE                                                       ;B2E411;
    db $F2                                                               ;B2E415;
    dw $6103,$81F8                                                       ;B2E416;
    db $EF                                                               ;B2E41A;
    dw $612E,$81FF                                                       ;B2E41B;
    db $E9                                                               ;B2E41F;
    dw $610E,$0003                                                       ;B2E420;
    db $FE                                                               ;B2E424;
    dw $614B,$000B                                                       ;B2E425;
    db $FF                                                               ;B2E429;
    dw $614A                                                             ;B2E42A;

UNUSED_Spitemaps_SpacePirate_B2E42C:
    dw $0007,$0002                                                       ;B2E42C;
    db $FC                                                               ;B2E430;
    dw $614C,$000A                                                       ;B2E431;
    db $FC                                                               ;B2E435;
    dw $614B,$0012                                                       ;B2E436;
    db $FC                                                               ;B2E43A;
    dw $614A,$01FD                                                       ;B2E43B;
    db $FA                                                               ;B2E43F;
    dw $6112,$01FD                                                       ;B2E440;
    db $F2                                                               ;B2E444;
    dw $6102,$81F8                                                       ;B2E445;
    db $EF                                                               ;B2E449;
    dw $612E,$81FF                                                       ;B2E44A;
    db $E9                                                               ;B2E44E;
    dw $610E                                                             ;B2E44F;

UNUSED_Spitemaps_SpacePirate_B2E451:
    dw $0007,$81FC                                                       ;B2E451;
    db $F2                                                               ;B2E455;
    dw $6100,$0016                                                       ;B2E456;
    db $F3                                                               ;B2E45A;
    dw $612A,$8006                                                       ;B2E45B;
    db $F3                                                               ;B2E45F;
    dw $612B,$81F8                                                       ;B2E460;
    db $EF                                                               ;B2E464;
    dw $612E,$81FF                                                       ;B2E465;
    db $E9                                                               ;B2E469;
    dw $610E,$0006                                                       ;B2E46A;
    db $FD                                                               ;B2E46E;
    dw $614B,$000E                                                       ;B2E46F;
    db $FD                                                               ;B2E473;
    dw $614A                                                             ;B2E474;

UNUSED_Spitemaps_SpacePirate_B2E476:
    dw $0009,$0007                                                       ;B2E476;
    db $FD                                                               ;B2E47A;
    dw $614B,$000F                                                       ;B2E47B;
    db $FD                                                               ;B2E47F;
    dw $614A,$0018                                                       ;B2E480;
    db $E9                                                               ;B2E484;
    dw $612A,$8008                                                       ;B2E485;
    db $E9                                                               ;B2E489;
    dw $612B,$01FD                                                       ;B2E48A;
    db $F1                                                               ;B2E48E;
    dw $614F,$0005                                                       ;B2E48F;
    db $F1                                                               ;B2E493;
    dw $614E,$81F8                                                       ;B2E494;
    db $EF                                                               ;B2E498;
    dw $612E,$81FF                                                       ;B2E499;
    db $E9                                                               ;B2E49D;
    dw $610E,$0002                                                       ;B2E49E;
    db $FD                                                               ;B2E4A2;
    dw $614C                                                             ;B2E4A3;

UNUSED_Spitemaps_SpacePirate_B2E4A5:
    dw $000A,$0008                                                       ;B2E4A5;
    db $FD                                                               ;B2E4A9;
    dw $614B,$0010                                                       ;B2E4AA;
    db $FD                                                               ;B2E4AE;
    dw $614A,$01FE                                                       ;B2E4AF;
    db $E4                                                               ;B2E4B3;
    dw $614D,$01FE                                                       ;B2E4B4;
    db $DC                                                               ;B2E4B8;
    dw $613D,$01FE                                                       ;B2E4B9;
    db $D4                                                               ;B2E4BD;
    dw $612D,$01FD                                                       ;B2E4BE;
    db $E8                                                               ;B2E4C2;
    dw $A113,$01FD                                                       ;B2E4C3;
    db $F0                                                               ;B2E4C7;
    dw $A103,$81F8                                                       ;B2E4C8;
    db $F0                                                               ;B2E4CC;
    dw $612E,$81FF                                                       ;B2E4CD;
    db $EA                                                               ;B2E4D1;
    dw $610E,$0002                                                       ;B2E4D2;
    db $FD                                                               ;B2E4D6;
    dw $614C                                                             ;B2E4D7;

UNUSED_Spitemaps_SpacePirate_B2E4D9:
    dw $0014,$0002                                                       ;B2E4D9;
    db $12                                                               ;B2E4DD;
    dw $6134,$0002                                                       ;B2E4DE;
    db $0A                                                               ;B2E4E2;
    dw $6124,$0001                                                       ;B2E4E3;
    db $15                                                               ;B2E4E7;
    dw $6126,$0016                                                       ;B2E4E8;
    db $F4                                                               ;B2E4EC;
    dw $612A,$8006                                                       ;B2E4ED;
    db $F4                                                               ;B2E4F1;
    dw $612B,$0001                                                       ;B2E4F2;
    db $FA                                                               ;B2E4F6;
    dw $6112,$0000                                                       ;B2E4F7;
    db $F2                                                               ;B2E4FB;
    dw $6102,$01F6                                                       ;B2E4FC;
    db $12                                                               ;B2E500;
    dw $6134,$01FB                                                       ;B2E501;
    db $16                                                               ;B2E505;
    dw $6125,$01FB                                                       ;B2E506;
    db $07                                                               ;B2E50A;
    dw $611A,$01FA                                                       ;B2E50B;
    db $FF                                                               ;B2E50F;
    dw $610A,$01F7                                                       ;B2E510;
    db $0A                                                               ;B2E514;
    dw $6124,$81FA                                                       ;B2E515;
    db $F0                                                               ;B2E519;
    dw $612E,$8000                                                       ;B2E51A;
    db $EA                                                               ;B2E51E;
    dw $610E,$0009                                                       ;B2E51F;
    db $16                                                               ;B2E523;
    dw $6145,$81FD                                                       ;B2E524;
    db $FF                                                               ;B2E528;
    dw $6107,$0002                                                       ;B2E529;
    db $FE                                                               ;B2E52D;
    dw $614C,$000A                                                       ;B2E52E;
    db $FE                                                               ;B2E532;
    dw $614B,$0012                                                       ;B2E533;
    db $FE                                                               ;B2E537;
    dw $614A,$01F3                                                       ;B2E538;
    db $15                                                               ;B2E53C;
    dw $6126                                                             ;B2E53D;

UNUSED_Spitemaps_SpacePirate_B2E53F:
    dw $0013,$0001                                                       ;B2E53F;
    db $08                                                               ;B2E543;
    dw $6124,$01F1                                                       ;B2E544;
    db $16                                                               ;B2E548;
    dw $6146,$01F9                                                       ;B2E549;
    db $05                                                               ;B2E54D;
    dw $611A,$01F9                                                       ;B2E54E;
    db $FD                                                               ;B2E552;
    dw $610A,$0016                                                       ;B2E553;
    db $F3                                                               ;B2E557;
    dw $612A,$8006                                                       ;B2E558;
    db $F3                                                               ;B2E55C;
    dw $612B,$81FE                                                       ;B2E55D;
    db $F1                                                               ;B2E561;
    dw $6100,$81FA                                                       ;B2E562;
    db $EF                                                               ;B2E566;
    dw $612E,$8001                                                       ;B2E567;
    db $EA                                                               ;B2E56B;
    dw $610E,$0000                                                       ;B2E56C;
    db $16                                                               ;B2E570;
    dw $6146,$0008                                                       ;B2E571;
    db $15                                                               ;B2E575;
    dw $6145,$01F9                                                       ;B2E576;
    db $15                                                               ;B2E57A;
    dw $6145,$01F5                                                       ;B2E57B;
    db $10                                                               ;B2E57F;
    dw $6134,$01F6                                                       ;B2E580;
    db $08                                                               ;B2E584;
    dw $6124,$81FC                                                       ;B2E585;
    db $FE                                                               ;B2E589;
    dw $6107,$0001                                                       ;B2E58A;
    db $10                                                               ;B2E58E;
    dw $6134,$0003                                                       ;B2E58F;
    db $FD                                                               ;B2E593;
    dw $614C,$000B                                                       ;B2E594;
    db $FD                                                               ;B2E598;
    dw $614B,$0013                                                       ;B2E599;
    db $FD                                                               ;B2E59D;
    dw $614A                                                             ;B2E59E;

UNUSED_Spitemaps_SpacePirate_B2E5A0:
    dw $0014,$0001                                                       ;B2E5A0;
    db $09                                                               ;B2E5A4;
    dw $6124,$0001                                                       ;B2E5A5;
    db $06                                                               ;B2E5A9;
    dw $6119,$0001                                                       ;B2E5AA;
    db $FF                                                               ;B2E5AE;
    dw $6109,$0018                                                       ;B2E5AF;
    db $F5                                                               ;B2E5B3;
    dw $612A,$8008                                                       ;B2E5B4;
    db $F5                                                               ;B2E5B8;
    dw $612B,$81FF                                                       ;B2E5B9;
    db $F3                                                               ;B2E5BD;
    dw $6100,$81FB                                                       ;B2E5BE;
    db $F0                                                               ;B2E5C2;
    dw $612E,$8002                                                       ;B2E5C3;
    db $EB                                                               ;B2E5C7;
    dw $610E,$0000                                                       ;B2E5C8;
    db $16                                                               ;B2E5CC;
    dw $6146,$0008                                                       ;B2E5CD;
    db $16                                                               ;B2E5D1;
    dw $6145,$01F2                                                       ;B2E5D2;
    db $16                                                               ;B2E5D6;
    dw $6146,$01FA                                                       ;B2E5D7;
    db $16                                                               ;B2E5DB;
    dw $6145,$01F5                                                       ;B2E5DC;
    db $11                                                               ;B2E5E0;
    dw $6134,$01F5                                                       ;B2E5E1;
    db $09                                                               ;B2E5E5;
    dw $6124,$01F9                                                       ;B2E5E6;
    db $07                                                               ;B2E5EA;
    dw $611B,$01F9                                                       ;B2E5EB;
    db $FF                                                               ;B2E5EF;
    dw $610B,$0000                                                       ;B2E5F0;
    db $11                                                               ;B2E5F4;
    dw $6134,$0004                                                       ;B2E5F5;
    db $FE                                                               ;B2E5F9;
    dw $614C,$000C                                                       ;B2E5FA;
    db $FE                                                               ;B2E5FE;
    dw $614B,$0014                                                       ;B2E5FF;
    db $FE                                                               ;B2E603;
    dw $614A                                                             ;B2E604;

UNUSED_Spitemaps_SpacePirate_B2E606:
    dw $000E,$81FC                                                       ;B2E606;
    db $FF                                                               ;B2E60A;
    dw $6128,$8004                                                       ;B2E60B;
    db $FF                                                               ;B2E60F;
    dw $6127,$01F5                                                       ;B2E610;
    db $15                                                               ;B2E614;
    dw $6126,$81F6                                                       ;B2E615;
    db $0B                                                               ;B2E619;
    dw $6122,$01FD                                                       ;B2E61A;
    db $FC                                                               ;B2E61E;
    dw $6113,$01FD                                                       ;B2E61F;
    db $F4                                                               ;B2E623;
    dw $6103,$81FE                                                       ;B2E624;
    db $EB                                                               ;B2E628;
    dw $610E,$81F9                                                       ;B2E629;
    db $F2                                                               ;B2E62D;
    dw $612E,$01FD                                                       ;B2E62E;
    db $15                                                               ;B2E632;
    dw $6125,$81F9                                                       ;B2E633;
    db $FF                                                               ;B2E637;
    dw $6107,$81FD                                                       ;B2E638;
    db $FF                                                               ;B2E63C;
    dw $6107,$81FC                                                       ;B2E63D;
    db $0A                                                               ;B2E641;
    dw $6122,$01FD                                                       ;B2E642;
    db $15                                                               ;B2E646;
    dw $6126,$0005                                                       ;B2E647;
    db $15                                                               ;B2E64B;
    dw $6125                                                             ;B2E64C;

Spitemaps_PirateNinja_4E:
    dw $0012,$81FD                                                       ;B2E64E;
    db $EC                                                               ;B2E652;
    dw $610E,$01F0                                                       ;B2E653;
    db $FC                                                               ;B2E657;
    dw $A14D,$01EF                                                       ;B2E658;
    db $04                                                               ;B2E65C;
    dw $A13D,$01EF                                                       ;B2E65D;
    db $0C                                                               ;B2E661;
    dw $A12D,$81F2                                                       ;B2E662;
    db $F2                                                               ;B2E666;
    dw $6105,$81F7                                                       ;B2E667;
    db $F1                                                               ;B2E66B;
    dw $612E,$8002                                                       ;B2E66C;
    db $F3                                                               ;B2E670;
    dw $612B,$800A                                                       ;B2E671;
    db $F3                                                               ;B2E675;
    dw $612A,$81F9                                                       ;B2E676;
    db $FF                                                               ;B2E67A;
    dw $6107,$01F6                                                       ;B2E67B;
    db $11                                                               ;B2E67F;
    dw $6144,$01F6                                                       ;B2E680;
    db $09                                                               ;B2E684;
    dw $6143,$0001                                                       ;B2E685;
    db $09                                                               ;B2E689;
    dw $A149,$01F9                                                       ;B2E68A;
    db $09                                                               ;B2E68E;
    dw $A148,$81FC                                                       ;B2E68F;
    db $FF                                                               ;B2E693;
    dw $6107,$0003                                                       ;B2E694;
    db $0B                                                               ;B2E698;
    dw $A149,$01FB                                                       ;B2E699;
    db $0B                                                               ;B2E69D;
    dw $A148,$01FA                                                       ;B2E69E;
    db $13                                                               ;B2E6A2;
    dw $6144,$01FA                                                       ;B2E6A3;
    db $0B                                                               ;B2E6A7;
    dw $6143                                                             ;B2E6A8;

Spitemaps_PirateNinja_4F:
    dw $0016,$01FA                                                       ;B2E6AA;
    db $15                                                               ;B2E6AE;
    dw $6134,$01FB                                                       ;B2E6AF;
    db $0D                                                               ;B2E6B3;
    dw $6124,$01FE                                                       ;B2E6B4;
    db $FB                                                               ;B2E6B8;
    dw $614C,$0006                                                       ;B2E6B9;
    db $FB                                                               ;B2E6BD;
    dw $614B,$000E                                                       ;B2E6BE;
    db $FB                                                               ;B2E6C2;
    dw $614A,$01FC                                                       ;B2E6C3;
    db $F9                                                               ;B2E6C7;
    dw $6113,$01FC                                                       ;B2E6C8;
    db $F1                                                               ;B2E6CC;
    dw $6103,$01F8                                                       ;B2E6CD;
    db $18                                                               ;B2E6D1;
    dw $6126,$0000                                                       ;B2E6D2;
    db $18                                                               ;B2E6D6;
    dw $6125,$01FD                                                       ;B2E6D7;
    db $08                                                               ;B2E6DB;
    dw $611A,$01FC                                                       ;B2E6DC;
    db $00                                                               ;B2E6E0;
    dw $610A,$81FD                                                       ;B2E6E1;
    db $E6                                                               ;B2E6E5;
    dw $610E,$81F7                                                       ;B2E6E6;
    db $EF                                                               ;B2E6EA;
    dw $612E,$01FE                                                       ;B2E6EB;
    db $FD                                                               ;B2E6EF;
    dw $6149,$0006                                                       ;B2E6F0;
    db $FD                                                               ;B2E6F4;
    dw $6148,$0004                                                       ;B2E6F5;
    db $0D                                                               ;B2E6F9;
    dw $6146,$000C                                                       ;B2E6FA;
    db $0D                                                               ;B2E6FE;
    dw $6145,$0005                                                       ;B2E6FF;
    db $09                                                               ;B2E703;
    dw $6134,$0005                                                       ;B2E704;
    db $01                                                               ;B2E708;
    dw $6124,$01F4                                                       ;B2E709;
    db $F9                                                               ;B2E70D;
    dw $A14D,$01F3                                                       ;B2E70E;
    db $01                                                               ;B2E712;
    dw $A13D,$01F2                                                       ;B2E713;
    db $09                                                               ;B2E717;
    dw $A12D                                                             ;B2E718;

UNUSED_Spitemaps_SpacePirate_B2E71A:
    dw $0014,$0000                                                       ;B2E71A;
    db $F2                                                               ;B2E71E;
    dw $614F,$0008                                                       ;B2E71F;
    db $F1                                                               ;B2E723;
    dw $614E,$000C                                                       ;B2E724;
    db $EE                                                               ;B2E728;
    dw $614D,$000C                                                       ;B2E729;
    db $E6                                                               ;B2E72D;
    dw $613D,$000C                                                       ;B2E72E;
    db $DE                                                               ;B2E732;
    dw $612D,$81FB                                                       ;B2E733;
    db $F1                                                               ;B2E737;
    dw $612E,$8002                                                       ;B2E738;
    db $EB                                                               ;B2E73C;
    dw $610E,$000C                                                       ;B2E73D;
    db $F0                                                               ;B2E741;
    dw $613D,$000C                                                       ;B2E742;
    db $F8                                                               ;B2E746;
    dw $614D,$8002                                                       ;B2E747;
    db $F1                                                               ;B2E74B;
    dw $6100,$81F9                                                       ;B2E74C;
    db $FF                                                               ;B2E750;
    dw $6107,$01F4                                                       ;B2E751;
    db $11                                                               ;B2E755;
    dw $6144,$01F4                                                       ;B2E756;
    db $09                                                               ;B2E75A;
    dw $6143,$0001                                                       ;B2E75B;
    db $09                                                               ;B2E75F;
    dw $A149,$01F9                                                       ;B2E760;
    db $09                                                               ;B2E764;
    dw $A148,$81FC                                                       ;B2E765;
    db $FF                                                               ;B2E769;
    dw $6107,$0003                                                       ;B2E76A;
    db $0B                                                               ;B2E76E;
    dw $A149,$01FB                                                       ;B2E76F;
    db $0B                                                               ;B2E773;
    dw $A148,$01FA                                                       ;B2E774;
    db $13                                                               ;B2E778;
    dw $6144,$01FA                                                       ;B2E779;
    db $0B                                                               ;B2E77D;
    dw $6143                                                             ;B2E77E;

UNUSED_Spitemaps_SpacePirate_B2E780:
    dw $000F,$0010                                                       ;B2E780;
    db $F7                                                               ;B2E784;
    dw $612A,$8000                                                       ;B2E785;
    db $F7                                                               ;B2E789;
    dw $612B,$81F9                                                       ;B2E78A;
    db $F6                                                               ;B2E78E;
    dw $6100,$81F5                                                       ;B2E78F;
    db $F2                                                               ;B2E793;
    dw $612E,$81FC                                                       ;B2E794;
    db $EC                                                               ;B2E798;
    dw $610E,$01FA                                                       ;B2E799;
    db $0B                                                               ;B2E79D;
    dw $6146,$0002                                                       ;B2E79E;
    db $0B                                                               ;B2E7A2;
    dw $6145,$01F7                                                       ;B2E7A3;
    db $00                                                               ;B2E7A7;
    dw $6149,$01FF                                                       ;B2E7A8;
    db $FF                                                               ;B2E7AC;
    dw $6148,$81F9                                                       ;B2E7AD;
    db $01                                                               ;B2E7B1;
    dw $6122,$0009                                                       ;B2E7B2;
    db $F9                                                               ;B2E7B6;
    dw $614D,$000A                                                       ;B2E7B7;
    db $F1                                                               ;B2E7BB;
    dw $613D,$000B                                                       ;B2E7BC;
    db $E9                                                               ;B2E7C0;
    dw $612D,$01F6                                                       ;B2E7C1;
    db $0D                                                               ;B2E7C5;
    dw $6144,$01F6                                                       ;B2E7C6;
    db $05                                                               ;B2E7CA;
    dw $6143                                                             ;B2E7CB;

UNUSED_Spitemaps_SpacePirate_B2E7CD:
    dw $000E,$0008                                                       ;B2E7CD;
    db $05                                                               ;B2E7D1;
    dw $A18D,$0008                                                       ;B2E7D2;
    db $0D                                                               ;B2E7D6;
    dw $A17D,$0002                                                       ;B2E7D7;
    db $0B                                                               ;B2E7DB;
    dw $6130,$0002                                                       ;B2E7DC;
    db $03                                                               ;B2E7E0;
    dw $6120,$000F                                                       ;B2E7E1;
    db $F4                                                               ;B2E7E5;
    dw $612A,$81FF                                                       ;B2E7E6;
    db $F4                                                               ;B2E7EA;
    dw $612B,$81F8                                                       ;B2E7EB;
    db $F3                                                               ;B2E7EF;
    dw $6100,$81F4                                                       ;B2E7F0;
    db $F0                                                               ;B2E7F4;
    dw $612E,$81FB                                                       ;B2E7F5;
    db $EA                                                               ;B2E7F9;
    dw $610E,$01F7                                                       ;B2E7FA;
    db $FE                                                               ;B2E7FE;
    dw $6149,$01FF                                                       ;B2E7FF;
    db $FE                                                               ;B2E803;
    dw $6148,$0007                                                       ;B2E804;
    db $F6                                                               ;B2E808;
    dw $614D,$0008                                                       ;B2E809;
    db $EE                                                               ;B2E80D;
    dw $613D,$0009                                                       ;B2E80E;
    db $E6                                                               ;B2E812;
    dw $612D                                                             ;B2E813;

UNUSED_Spitemaps_SpacePirate_B2E815:
    dw $000E,$0008                                                       ;B2E815;
    db $05                                                               ;B2E819;
    dw $A18D,$0008                                                       ;B2E81A;
    db $0D                                                               ;B2E81E;
    dw $A17D,$0003                                                       ;B2E81F;
    db $0B                                                               ;B2E823;
    dw $6130,$0003                                                       ;B2E824;
    db $03                                                               ;B2E828;
    dw $6120,$0010                                                       ;B2E829;
    db $F3                                                               ;B2E82D;
    dw $612A,$8000                                                       ;B2E82E;
    db $F3                                                               ;B2E832;
    dw $612B,$81F8                                                       ;B2E833;
    db $F2                                                               ;B2E837;
    dw $6100,$81F4                                                       ;B2E838;
    db $F1                                                               ;B2E83C;
    dw $612E,$81FB                                                       ;B2E83D;
    db $EB                                                               ;B2E841;
    dw $610E,$01F7                                                       ;B2E842;
    db $FF                                                               ;B2E846;
    dw $6149,$01FF                                                       ;B2E847;
    db $FE                                                               ;B2E84B;
    dw $6148,$0008                                                       ;B2E84C;
    db $F7                                                               ;B2E850;
    dw $614D,$0009                                                       ;B2E851;
    db $EF                                                               ;B2E855;
    dw $613D,$000A                                                       ;B2E856;
    db $E7                                                               ;B2E85A;
    dw $612D                                                             ;B2E85B;

UNUSED_Spitemaps_SpacePirate_B2E85D:
    dw $0009,$01FF                                                       ;B2E85D;
    db $00                                                               ;B2E861;
    dw $A14D,$01FF                                                       ;B2E862;
    db $08                                                               ;B2E866;
    dw $A13D,$01FF                                                       ;B2E867;
    db $10                                                               ;B2E86B;
    dw $A12D,$01FE                                                       ;B2E86C;
    db $FA                                                               ;B2E870;
    dw $6113,$01FE                                                       ;B2E871;
    db $F2                                                               ;B2E875;
    dw $6103,$81F8                                                       ;B2E876;
    db $EF                                                               ;B2E87A;
    dw $612E,$81FF                                                       ;B2E87B;
    db $E9                                                               ;B2E87F;
    dw $610E,$0003                                                       ;B2E880;
    db $FD                                                               ;B2E884;
    dw $614B,$000B                                                       ;B2E885;
    db $FE                                                               ;B2E889;
    dw $614A                                                             ;B2E88A;

UNUSED_Spitemaps_SpacePirate_B2E88C:
    dw $0010,$81F7                                                       ;B2E88C;
    db $FE                                                               ;B2E890;
    dw $6107,$0014                                                       ;B2E891;
    db $F3                                                               ;B2E895;
    dw $612A,$8004                                                       ;B2E896;
    db $F3                                                               ;B2E89A;
    dw $612B,$81FA                                                       ;B2E89B;
    db $F1                                                               ;B2E89F;
    dw $6100,$81FE                                                       ;B2E8A0;
    db $EB                                                               ;B2E8A4;
    dw $610E,$81F7                                                       ;B2E8A5;
    db $F1                                                               ;B2E8A9;
    dw $612E,$000B                                                       ;B2E8AA;
    db $F9                                                               ;B2E8AE;
    dw $614D,$000C                                                       ;B2E8AF;
    db $F1                                                               ;B2E8B3;
    dw $613D,$000D                                                       ;B2E8B4;
    db $E9                                                               ;B2E8B8;
    dw $612D,$81FC                                                       ;B2E8B9;
    db $FE                                                               ;B2E8BD;
    dw $6107,$01FC                                                       ;B2E8BE;
    db $10                                                               ;B2E8C2;
    dw $6125,$81FD                                                       ;B2E8C3;
    db $05                                                               ;B2E8C7;
    dw $6122,$01F4                                                       ;B2E8C8;
    db $10                                                               ;B2E8CC;
    dw $6126,$81F5                                                       ;B2E8CD;
    db $07                                                               ;B2E8D1;
    dw $6122,$01FE                                                       ;B2E8D2;
    db $10                                                               ;B2E8D6;
    dw $6126,$0006                                                       ;B2E8D7;
    db $10                                                               ;B2E8DB;
    dw $6125                                                             ;B2E8DC;

Spitemaps_PirateNinja_50:
    dw $0011,$81FD                                                       ;B2E8DE;
    db $FB                                                               ;B2E8E2;
    dw $6127,$81F5                                                       ;B2E8E3;
    db $FB                                                               ;B2E8E7;
    dw $6128,$01FA                                                       ;B2E8E8;
    db $0D                                                               ;B2E8EC;
    dw $6121,$01FA                                                       ;B2E8ED;
    db $15                                                               ;B2E8F1;
    dw $6131,$01FB                                                       ;B2E8F2;
    db $18                                                               ;B2E8F6;
    dw $6126,$0003                                                       ;B2E8F7;
    db $18                                                               ;B2E8FB;
    dw $6125,$01FC                                                       ;B2E8FC;
    db $08                                                               ;B2E900;
    dw $611A,$01FC                                                       ;B2E901;
    db $00                                                               ;B2E905;
    dw $610A,$01F1                                                       ;B2E906;
    db $12                                                               ;B2E90A;
    dw $6144,$01F1                                                       ;B2E90B;
    db $0A                                                               ;B2E90F;
    dw $6143,$01FE                                                       ;B2E910;
    db $06                                                               ;B2E914;
    dw $6119,$01FD                                                       ;B2E915;
    db $FE                                                               ;B2E919;
    dw $6109,$01FE                                                       ;B2E91A;
    db $0A                                                               ;B2E91E;
    dw $616E,$81F6                                                       ;B2E91F;
    db $F0                                                               ;B2E923;
    dw $6105,$81FF                                                       ;B2E924;
    db $E6                                                               ;B2E928;
    dw $610E,$81F9                                                       ;B2E929;
    db $EF                                                               ;B2E92D;
    dw $612E,$01F6                                                       ;B2E92E;
    db $0A                                                               ;B2E932;
    dw $616F                                                             ;B2E933;

Spitemaps_PirateNinja_51:
    dw $0013,$01FA                                                       ;B2E935;
    db $FF                                                               ;B2E939;
    dw $610A,$0010                                                       ;B2E93A;
    db $EE                                                               ;B2E93E;
    dw $612A,$8002                                                       ;B2E93F;
    db $ED                                                               ;B2E943;
    dw $612B,$81FA                                                       ;B2E944;
    db $EF                                                               ;B2E948;
    dw $6100,$01EE                                                       ;B2E949;
    db $F5                                                               ;B2E94D;
    dw $A14D,$01ED                                                       ;B2E94E;
    db $FD                                                               ;B2E952;
    dw $A13D,$01EC                                                       ;B2E953;
    db $05                                                               ;B2E957;
    dw $A12D,$81F9                                                       ;B2E958;
    db $E9                                                               ;B2E95C;
    dw $610E,$81F5                                                       ;B2E95D;
    db $F1                                                               ;B2E961;
    dw $612E,$01FB                                                       ;B2E962;
    db $07                                                               ;B2E966;
    dw $611A,$0015                                                       ;B2E967;
    db $FD                                                               ;B2E96B;
    dw $A16F,$000D                                                       ;B2E96C;
    db $FE                                                               ;B2E970;
    dw $A16E,$01FD                                                       ;B2E971;
    db $FE                                                               ;B2E975;
    dw $619F,$0005                                                       ;B2E976;
    db $FD                                                               ;B2E97A;
    dw $619E,$01F0                                                       ;B2E97B;
    db $16                                                               ;B2E97F;
    dw $6126,$01F8                                                       ;B2E980;
    db $17                                                               ;B2E984;
    dw $6125,$81F2                                                       ;B2E985;
    db $0A                                                               ;B2E989;
    dw $6122,$001A                                                       ;B2E98A;
    db $F4                                                               ;B2E98E;
    dw $A18D,$001B                                                       ;B2E98F;
    db $FC                                                               ;B2E993;
    dw $A17D                                                             ;B2E994;

Spitemaps_PirateNinja_52:
    dw $0013,$001A                                                       ;B2E996;
    db $0A                                                               ;B2E99A;
    dw $619D,$800E                                                       ;B2E99B;
    db $01                                                               ;B2E99F;
    dw $61AC,$8001                                                       ;B2E9A0;
    db $FB                                                               ;B2E9A4;
    dw $61AE,$01EF                                                       ;B2E9A5;
    db $F4                                                               ;B2E9A9;
    dw $A14D,$01EE                                                       ;B2E9AA;
    db $FC                                                               ;B2E9AE;
    dw $A13D,$01EE                                                       ;B2E9AF;
    db $04                                                               ;B2E9B3;
    dw $A12D,$01F2                                                       ;B2E9B4;
    db $F3                                                               ;B2E9B8;
    dw $615F,$01FA                                                       ;B2E9B9;
    db $F4                                                               ;B2E9BD;
    dw $615E,$01F9                                                       ;B2E9BE;
    db $00                                                               ;B2E9C2;
    dw $210A,$81FD                                                       ;B2E9C3;
    db $EC                                                               ;B2E9C7;
    dw $610E,$81F7                                                       ;B2E9C8;
    db $F2                                                               ;B2E9CC;
    dw $612E,$0009                                                       ;B2E9CD;
    db $10                                                               ;B2E9D1;
    dw $218D,$0009                                                       ;B2E9D2;
    db $08                                                               ;B2E9D6;
    dw $217D,$0004                                                       ;B2E9D7;
    db $08                                                               ;B2E9DB;
    dw $216F,$01FC                                                       ;B2E9DC;
    db $09                                                               ;B2E9E0;
    dw $216E,$01F8                                                       ;B2E9E1;
    db $08                                                               ;B2E9E5;
    dw $211A,$0003                                                       ;B2E9E6;
    db $EA                                                               ;B2E9EA;
    dw $614D,$0004                                                       ;B2E9EB;
    db $E2                                                               ;B2E9EF;
    dw $613D,$0004                                                       ;B2E9F0;
    db $DA                                                               ;B2E9F4;
    dw $612D                                                             ;B2E9F5;

UNUSED_Spitemaps_SpacePirate_B2E9F7:
    dw $0004,$81FA                                                       ;B2E9F7;
    db $00                                                               ;B2E9FB;
    dw $2182,$81EA                                                       ;B2E9FC;
    db $00                                                               ;B2EA00;
    dw $2180,$81FA                                                       ;B2EA01;
    db $F0                                                               ;B2EA05;
    dw $2162,$81EA                                                       ;B2EA06;
    db $F0                                                               ;B2EA0A;
    dw $2160                                                             ;B2EA0B;

UNUSED_Spitemaps_SpacePirate_B2EA0D:
    dw $0006,$01F5                                                       ;B2EA0D;
    db $10                                                               ;B2EA11;
    dw $21A5,$01FD                                                       ;B2EA12;
    db $10                                                               ;B2EA16;
    dw $21A6,$81FD                                                       ;B2EA17;
    db $00                                                               ;B2EA1B;
    dw $2186,$81ED                                                       ;B2EA1C;
    db $00                                                               ;B2EA20;
    dw $2184,$81FD                                                       ;B2EA21;
    db $F0                                                               ;B2EA25;
    dw $2166,$81ED                                                       ;B2EA26;
    db $F0                                                               ;B2EA2A;
    dw $2164                                                             ;B2EA2B;

UNUSED_Spitemaps_SpacePirate_B2EA2D:
    dw $0005,$000C                                                       ;B2EA2D;
    db $FE                                                               ;B2EA31;
    dw $217C,$81FC                                                       ;B2EA32;
    db $06                                                               ;B2EA36;
    dw $218A,$81EC                                                       ;B2EA37;
    db $06                                                               ;B2EA3B;
    dw $2188,$81FC                                                       ;B2EA3C;
    db $F6                                                               ;B2EA40;
    dw $216A,$81EC                                                       ;B2EA41;
    db $F6                                                               ;B2EA45;
    dw $2168                                                             ;B2EA46;

UNUSED_Spitemaps_SpacePirate_B2EA48:
    dw $0007,$0010                                                       ;B2EA48;
    db $FA                                                               ;B2EA4C;
    dw $E1A7,$81F0                                                       ;B2EA4D;
    db $F2                                                               ;B2EA51;
    dw $E1AA,$8000                                                       ;B2EA52;
    db $F2                                                               ;B2EA56;
    dw $E1A8,$01F0                                                       ;B2EA57;
    db $02                                                               ;B2EA5B;
    dw $E1B4,$0008                                                       ;B2EA5C;
    db $02                                                               ;B2EA60;
    dw $E1B1,$0010                                                       ;B2EA61;
    db $02                                                               ;B2EA65;
    dw $E1B0,$81F8                                                       ;B2EA66;
    db $02                                                               ;B2EA6A;
    dw $E1A2                                                             ;B2EA6B;

UNUSED_Spitemaps_SpacePirate_B2EA6D:
    dw $0004,$81F6                                                       ;B2EA6D;
    db $F0                                                               ;B2EA71;
    dw $E182,$8006                                                       ;B2EA72;
    db $F0                                                               ;B2EA76;
    dw $E180,$81F6                                                       ;B2EA77;
    db $00                                                               ;B2EA7B;
    dw $E162,$8006                                                       ;B2EA7C;
    db $00                                                               ;B2EA80;
    dw $E160                                                             ;B2EA81;

UNUSED_Spitemaps_SpacePirate_B2EA83:
    dw $0006,$0004                                                       ;B2EA83;
    db $E8                                                               ;B2EA87;
    dw $E1A5,$01FC                                                       ;B2EA88;
    db $E8                                                               ;B2EA8C;
    dw $E1A6,$81F4                                                       ;B2EA8D;
    db $F0                                                               ;B2EA91;
    dw $E186,$8004                                                       ;B2EA92;
    db $F0                                                               ;B2EA96;
    dw $E184,$81F4                                                       ;B2EA97;
    db $00                                                               ;B2EA9B;
    dw $E166,$8004                                                       ;B2EA9C;
    db $00                                                               ;B2EAA0;
    dw $E164                                                             ;B2EAA1;

UNUSED_Spitemaps_SpacePirate_B2EAA3:
    dw $0005,$01EC                                                       ;B2EAA3;
    db $FA                                                               ;B2EAA7;
    dw $E17C,$81F4                                                       ;B2EAA8;
    db $EA                                                               ;B2EAAC;
    dw $E18A,$8004                                                       ;B2EAAD;
    db $EA                                                               ;B2EAB1;
    dw $E188,$81F4                                                       ;B2EAB2;
    db $FA                                                               ;B2EAB6;
    dw $E16A,$8004                                                       ;B2EAB7;
    db $FA                                                               ;B2EABB;
    dw $E168                                                             ;B2EABC;

UNUSED_Spitemaps_SpacePirate_B2EABE:
    dw $0007,$01E9                                                       ;B2EABE;
    db $FE                                                               ;B2EAC2;
    dw $21A7,$8001                                                       ;B2EAC3;
    db $FE                                                               ;B2EAC7;
    dw $21AA,$81F1                                                       ;B2EAC8;
    db $FE                                                               ;B2EACC;
    dw $21A8,$0009                                                       ;B2EACD;
    db $F6                                                               ;B2EAD1;
    dw $21B4,$01F1                                                       ;B2EAD2;
    db $F6                                                               ;B2EAD6;
    dw $21B1,$01E9                                                       ;B2EAD7;
    db $F6                                                               ;B2EADB;
    dw $21B0,$81F9                                                       ;B2EADC;
    db $EE                                                               ;B2EAE0;
    dw $21A2                                                             ;B2EAE1;

UNUSED_Spitemaps_SpacePirate_B2EAE3:
    dw $000D,$81F9                                                       ;B2EAE3;
    db $FC                                                               ;B2EAE7;
    dw $2127,$8001                                                       ;B2EAE8;
    db $FC                                                               ;B2EAEC;
    dw $2128,$01F1                                                       ;B2EAED;
    db $F7                                                               ;B2EAF1;
    dw $214D,$01F1                                                       ;B2EAF2;
    db $EF                                                               ;B2EAF6;
    dw $213D,$01F1                                                       ;B2EAF7;
    db $E7                                                               ;B2EAFB;
    dw $212D,$0006                                                       ;B2EAFC;
    db $FB                                                               ;B2EB00;
    dw $6112,$0006                                                       ;B2EB01;
    db $F3                                                               ;B2EB05;
    dw $6102,$81FA                                                       ;B2EB06;
    db $EB                                                               ;B2EB0A;
    dw $210E,$0003                                                       ;B2EB0B;
    db $F9                                                               ;B2EB0F;
    dw $6142,$01FB                                                       ;B2EB10;
    db $F1                                                               ;B2EB14;
    dw $6141,$0003                                                       ;B2EB15;
    db $F1                                                               ;B2EB19;
    dw $6140,$01FB                                                       ;B2EB1A;
    db $F9                                                               ;B2EB1E;
    dw $6147,$81F1                                                       ;B2EB1F;
    db $F0                                                               ;B2EB23;
    dw $2100                                                             ;B2EB24;

UNUSED_Spitemaps_SpacePirate_B2EB26:
    dw $000E,$01F0                                                       ;B2EB26;
    db $F7                                                               ;B2EB2A;
    dw $214D,$01F0                                                       ;B2EB2B;
    db $EF                                                               ;B2EB2F;
    dw $213D,$01F0                                                       ;B2EB30;
    db $E7                                                               ;B2EB34;
    dw $212D,$81FE                                                       ;B2EB35;
    db $EB                                                               ;B2EB39;
    dw $610E,$81F1                                                       ;B2EB3A;
    db $F0                                                               ;B2EB3E;
    dw $2100,$0003                                                       ;B2EB3F;
    db $F9                                                               ;B2EB43;
    dw $6142,$01FB                                                       ;B2EB44;
    db $F1                                                               ;B2EB48;
    dw $6141,$0003                                                       ;B2EB49;
    db $F1                                                               ;B2EB4D;
    dw $6140,$01FB                                                       ;B2EB4E;
    db $F9                                                               ;B2EB52;
    dw $6147,$0008                                                       ;B2EB53;
    db $FD                                                               ;B2EB57;
    dw $A14D,$0008                                                       ;B2EB58;
    db $05                                                               ;B2EB5C;
    dw $A13D,$0008                                                       ;B2EB5D;
    db $0D                                                               ;B2EB61;
    dw $A12D,$0006                                                       ;B2EB62;
    db $FB                                                               ;B2EB66;
    dw $6112,$0006                                                       ;B2EB67;
    db $F3                                                               ;B2EB6B;
    dw $6102                                                             ;B2EB6C;

UNUSED_Spitemaps_SpacePirate_B2EB6E:
    dw $0014,$0000                                                       ;B2EB6E;
    db $F2                                                               ;B2EB72;
    dw $614F,$0008                                                       ;B2EB73;
    db $F1                                                               ;B2EB77;
    dw $614E,$000C                                                       ;B2EB78;
    db $EE                                                               ;B2EB7C;
    dw $614D,$000C                                                       ;B2EB7D;
    db $E6                                                               ;B2EB81;
    dw $613D,$000C                                                       ;B2EB82;
    db $DE                                                               ;B2EB86;
    dw $612D,$81FB                                                       ;B2EB87;
    db $F1                                                               ;B2EB8B;
    dw $612E,$8002                                                       ;B2EB8C;
    db $EB                                                               ;B2EB90;
    dw $610E,$000C                                                       ;B2EB91;
    db $F0                                                               ;B2EB95;
    dw $613D,$000C                                                       ;B2EB96;
    db $F8                                                               ;B2EB9A;
    dw $614D,$8002                                                       ;B2EB9B;
    db $F1                                                               ;B2EB9F;
    dw $6100,$81F9                                                       ;B2EBA0;
    db $FF                                                               ;B2EBA4;
    dw $6107,$01F4                                                       ;B2EBA5;
    db $11                                                               ;B2EBA9;
    dw $6144,$01F4                                                       ;B2EBAA;
    db $09                                                               ;B2EBAE;
    dw $6143,$0001                                                       ;B2EBAF;
    db $09                                                               ;B2EBB3;
    dw $A149,$01F9                                                       ;B2EBB4;
    db $09                                                               ;B2EBB8;
    dw $A148,$81FC                                                       ;B2EBB9;
    db $FF                                                               ;B2EBBD;
    dw $6107,$0003                                                       ;B2EBBE;
    db $0B                                                               ;B2EBC2;
    dw $A149,$01FB                                                       ;B2EBC3;
    db $0B                                                               ;B2EBC7;
    dw $A148,$01FA                                                       ;B2EBC8;
    db $13                                                               ;B2EBCC;
    dw $6144,$01FA                                                       ;B2EBCD;
    db $0B                                                               ;B2EBD1;
    dw $6143                                                             ;B2EBD2;

UNUSED_Spitemaps_SpacePirate_B2EBD4:
    dw $0004,$81F6                                                       ;B2EBD4;
    db $00                                                               ;B2EBD8;
    dw $6182,$8006                                                       ;B2EBD9;
    db $00                                                               ;B2EBDD;
    dw $6180,$81F6                                                       ;B2EBDE;
    db $F0                                                               ;B2EBE2;
    dw $6162,$8006                                                       ;B2EBE3;
    db $F0                                                               ;B2EBE7;
    dw $6160                                                             ;B2EBE8;

UNUSED_Spitemaps_SpacePirate_B2EBEA:
    dw $0006,$0003                                                       ;B2EBEA;
    db $10                                                               ;B2EBEE;
    dw $61A5,$01FB                                                       ;B2EBEF;
    db $10                                                               ;B2EBF3;
    dw $61A6,$81F3                                                       ;B2EBF4;
    db $00                                                               ;B2EBF8;
    dw $6186,$8003                                                       ;B2EBF9;
    db $00                                                               ;B2EBFD;
    dw $6184,$81F3                                                       ;B2EBFE;
    db $F0                                                               ;B2EC02;
    dw $6166,$8003                                                       ;B2EC03;
    db $F0                                                               ;B2EC07;
    dw $6164                                                             ;B2EC08;

UNUSED_Spitemaps_SpacePirate_B2EC0A:
    dw $0005,$01EC                                                       ;B2EC0A;
    db $FE                                                               ;B2EC0E;
    dw $617C,$81F4                                                       ;B2EC0F;
    db $06                                                               ;B2EC13;
    dw $618A,$8004                                                       ;B2EC14;
    db $06                                                               ;B2EC18;
    dw $6188,$81F4                                                       ;B2EC19;
    db $F6                                                               ;B2EC1D;
    dw $616A,$8004                                                       ;B2EC1E;
    db $F6                                                               ;B2EC22;
    dw $6168                                                             ;B2EC23;

UNUSED_Spitemaps_SpacePirate_B2EC25:
    dw $0007,$01E8                                                       ;B2EC25;
    db $FA                                                               ;B2EC29;
    dw $A1A7,$8000                                                       ;B2EC2A;
    db $F2                                                               ;B2EC2E;
    dw $A1AA,$81F0                                                       ;B2EC2F;
    db $F2                                                               ;B2EC33;
    dw $A1A8,$0008                                                       ;B2EC34;
    db $02                                                               ;B2EC38;
    dw $A1B4,$01F0                                                       ;B2EC39;
    db $02                                                               ;B2EC3D;
    dw $A1B1,$01E8                                                       ;B2EC3E;
    db $02                                                               ;B2EC42;
    dw $A1B0,$81F8                                                       ;B2EC43;
    db $02                                                               ;B2EC47;
    dw $A1A2                                                             ;B2EC48;

UNUSED_Spitemaps_SpacePirate_B2EC4A:
    dw $0004,$81FA                                                       ;B2EC4A;
    db $F0                                                               ;B2EC4E;
    dw $A182,$81EA                                                       ;B2EC4F;
    db $F0                                                               ;B2EC53;
    dw $A180,$81FA                                                       ;B2EC54;
    db $00                                                               ;B2EC58;
    dw $A162,$81EA                                                       ;B2EC59;
    db $00                                                               ;B2EC5D;
    dw $A160                                                             ;B2EC5E;

UNUSED_Spitemaps_SpacePirate_B2EC60:
    dw $0006,$01F4                                                       ;B2EC60;
    db $E8                                                               ;B2EC64;
    dw $A1A5,$01FC                                                       ;B2EC65;
    db $E8                                                               ;B2EC69;
    dw $A1A6,$81FC                                                       ;B2EC6A;
    db $F0                                                               ;B2EC6E;
    dw $A186,$81EC                                                       ;B2EC6F;
    db $F0                                                               ;B2EC73;
    dw $A184,$81FC                                                       ;B2EC74;
    db $00                                                               ;B2EC78;
    dw $A166,$81EC                                                       ;B2EC79;
    db $00                                                               ;B2EC7D;
    dw $A164                                                             ;B2EC7E;

UNUSED_Spitemaps_SpacePirate_B2EC80:
    dw $0005,$000C                                                       ;B2EC80;
    db $FA                                                               ;B2EC84;
    dw $A17C,$81FC                                                       ;B2EC85;
    db $EA                                                               ;B2EC89;
    dw $A18A,$81EC                                                       ;B2EC8A;
    db $EA                                                               ;B2EC8E;
    dw $A188,$81FC                                                       ;B2EC8F;
    db $FA                                                               ;B2EC93;
    dw $A16A,$81EC                                                       ;B2EC94;
    db $FA                                                               ;B2EC98;
    dw $A168                                                             ;B2EC99;

UNUSED_Spitemaps_SpacePirate_B2EC9B:
    dw $0007,$000F                                                       ;B2EC9B;
    db $FE                                                               ;B2EC9F;
    dw $61A7,$81EF                                                       ;B2ECA0;
    db $FE                                                               ;B2ECA4;
    dw $61AA,$81FF                                                       ;B2ECA5;
    db $FE                                                               ;B2ECA9;
    dw $61A8,$01EF                                                       ;B2ECAA;
    db $F6                                                               ;B2ECAE;
    dw $61B4,$0007                                                       ;B2ECAF;
    db $F6                                                               ;B2ECB3;
    dw $61B1,$000F                                                       ;B2ECB4;
    db $F6                                                               ;B2ECB8;
    dw $61B0,$81F7                                                       ;B2ECB9;
    db $EE                                                               ;B2ECBD;
    dw $61A2                                                             ;B2ECBE;

InstList_PirateWall_FireLaser_WallJumpLeft:
    dw Instruction_PirateWall_FunctionInY                                ;B2ECC0;
    dw RTS_B2F0E3                                                        ;B2ECC2;
    dw $0009                                                             ;B2ECC4;
    dw ExtendedSpritemaps_PirateWall_E                                   ;B2ECC6;
    dw $000F                                                             ;B2ECC8;
    dw ExtendedSpritemaps_PirateWall_F                                   ;B2ECCA;
    dw Instruction_PirateWall_FireLaserLeft                              ;B2ECCC;
    dw Instruction_Common_WaitYFrames                                    ;B2ECCE;
    dw $0020                                                             ;B2ECD0;
    dw Instruction_PirateWall_PrepareWallJumpToLeft                      ;B2ECD2;
    dw Instruction_PirateWall_FunctionInY                                ;B2ECD4;
    dw Function_PirateWall_WallJumpingLeft                               ;B2ECD6;
    dw Instruction_PirateWall_QueueSpacePirateAttackSFX                  ;B2ECD8;
    dw $000A                                                             ;B2ECDA;
    dw ExtendedSpritemaps_PirateWall_10                                  ;B2ECDC;
    dw $0001                                                             ;B2ECDE;
    dw ExtendedSpritemaps_PirateWall_11                                  ;B2ECE0;
    dw Instruction_Common_Sleep                                          ;B2ECE2;

InstList_PirateWall_LandedOnLeftWall:
    dw Instruction_PirateWall_FunctionInY                                ;B2ECE4;
    dw Function_PirateWall_ClimbingLeftWall                              ;B2ECE6;
    dw $000A                                                             ;B2ECE8;
    dw ExtendedSpritemaps_PirateWall_10                                  ;B2ECEA;

InstList_PirateWall_MovingUpLeftWall_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2ECEC;
    dw Function_PirateWall_ClimbingLeftWall                              ;B2ECEE;
    dw Instruction_Common_TimerInY                                       ;B2ECF0;
    dw $0004                                                             ;B2ECF2;

InstList_PirateWall_MovingUpLeftWall_1:
    dw $000A                                                             ;B2ECF4;
    dw ExtendedSpritemaps_PirateWall_0                                   ;B2ECF6;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ECF8;
    dw $FFFD,$0008                                                       ;B2ECFA;
    dw ExtendedSpritemaps_PirateWall_1                                   ;B2ECFE;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED00;
    dw $FFFD,$0005                                                       ;B2ED02;
    dw ExtendedSpritemaps_PirateWall_2                                   ;B2ED06;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED08;
    dw $FFFD,$0008                                                       ;B2ED0A;
    dw ExtendedSpritemaps_PirateWall_3                                   ;B2ED0E;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED10;
    dw $FFFD,$000A                                                       ;B2ED12;
    dw ExtendedSpritemaps_PirateWall_4                                   ;B2ED16;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED18;
    dw $FFFD,$0008                                                       ;B2ED1A;
    dw ExtendedSpritemaps_PirateWall_3                                   ;B2ED1E;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED20;
    dw $FFFD,$0005                                                       ;B2ED22;
    dw ExtendedSpritemaps_PirateWall_2                                   ;B2ED26;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED28;
    dw $FFFD,$0008                                                       ;B2ED2A;
    dw ExtendedSpritemaps_PirateWall_1                                   ;B2ED2E;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B2ED30;
    dw InstList_PirateWall_MovingUpLeftWall_1                            ;B2ED32;
    dw Instruction_PirateWall_RandomlyChooseADirection_LeftWall          ;B2ED34;

InstList_PirateWall_MovingDownLeftWall_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2ED36;
    dw Function_PirateWall_ClimbingLeftWall                              ;B2ED38;
    dw Instruction_Common_TimerInY                                       ;B2ED3A;
    dw $0004                                                             ;B2ED3C;

InstList_PirateWall_MovingDownLeftWall_1:
    dw $000A                                                             ;B2ED3E;
    dw ExtendedSpritemaps_PirateWall_0                                   ;B2ED40;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED42;
    dw $0003,$0008                                                       ;B2ED44;
    dw ExtendedSpritemaps_PirateWall_1                                   ;B2ED48;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED4A;
    dw $0003,$0005                                                       ;B2ED4C;
    dw ExtendedSpritemaps_PirateWall_2                                   ;B2ED50;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED52;
    dw $0003,$0008                                                       ;B2ED54;
    dw ExtendedSpritemaps_PirateWall_3                                   ;B2ED58;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED5A;
    dw $0003                                                             ;B2ED5C;
    dw $000A                                                             ;B2ED5E;
    dw ExtendedSpritemaps_PirateWall_4                                   ;B2ED60;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED62;
    dw $0003,$0008                                                       ;B2ED64;
    dw ExtendedSpritemaps_PirateWall_3                                   ;B2ED68;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED6A;
    dw $0003                                                             ;B2ED6C;
    dw $0005                                                             ;B2ED6E;
    dw ExtendedSpritemaps_PirateWall_2                                   ;B2ED70;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left         ;B2ED72;
    dw $0003,$0008                                                       ;B2ED74;
    dw ExtendedSpritemaps_PirateWall_1                                   ;B2ED78;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B2ED7A;
    dw InstList_PirateWall_MovingDownLeftWall_1                          ;B2ED7C;
    dw Instruction_PirateWall_RandomlyChooseADirection_LeftWall          ;B2ED7E;

InstList_PirateWall_FireLaser_WallJumpRight:
    dw Instruction_PirateWall_FunctionInY                                ;B2ED80;
    dw RTS_B2F04F                                                        ;B2ED82;
    dw $0009                                                             ;B2ED84;
    dw ExtendedSpritemaps_PirateWall_5                                   ;B2ED86;
    dw $0001                                                             ;B2ED88;
    dw ExtendedSpritemaps_PirateWall_6                                   ;B2ED8A;
    dw Instruction_PirateWall_FireLaserRight                             ;B2ED8C;
    dw Instruction_Common_WaitYFrames                                    ;B2ED8E;
    dw $0020                                                             ;B2ED90;
    dw Instruction_PirateWall_PrepareWallJumpToRight                     ;B2ED92;
    dw Instruction_PirateWall_FunctionInY                                ;B2ED94;
    dw Function_PirateWall_WallJumpingRight                              ;B2ED96;
    dw Instruction_PirateWall_QueueSpacePirateAttackSFX                  ;B2ED98;
    dw $000A                                                             ;B2ED9A;
    dw ExtendedSpritemaps_PirateWall_7                                   ;B2ED9C;
    dw $0001                                                             ;B2ED9E;
    dw ExtendedSpritemaps_PirateWall_8                                   ;B2EDA0;
    dw Instruction_Common_Sleep                                          ;B2EDA2;

InstList_PirateWall_LandingOnRightWall:
    dw Instruction_PirateWall_FunctionInY                                ;B2EDA4;
    dw Function_PirateWall_ClimbingRightWall                             ;B2EDA6;
    dw $000A                                                             ;B2EDA8;
    dw ExtendedSpritemaps_PirateWall_7                                   ;B2EDAA;

InstList_PirateWall_MovingDownRightWall_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2EDAC;
    dw Function_PirateWall_ClimbingRightWall                             ;B2EDAE;
    dw Instruction_Common_TimerInY                                       ;B2EDB0;
    dw $0004                                                             ;B2EDB2;

InstList_PirateWall_MovingDownRightWall_1:
    dw $000A                                                             ;B2EDB4;
    dw ExtendedSpritemaps_PirateWall_9                                   ;B2EDB6;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EDB8;
    dw $0003,$0008                                                       ;B2EDBA;
    dw ExtendedSpritemaps_PirateWall_A                                   ;B2EDBE;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EDC0;
    dw $0003                                                             ;B2EDC2;
    dw $0005                                                             ;B2EDC4;
    dw ExtendedSpritemaps_PirateWall_B                                   ;B2EDC6;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EDC8;
    dw $0003,$0008                                                       ;B2EDCA;
    dw ExtendedSpritemaps_PirateWall_C                                   ;B2EDCE;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EDD0;
    dw $0003,$000A                                                       ;B2EDD2;
    dw ExtendedSpritemaps_PirateWall_D                                   ;B2EDD6;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EDD8;
    dw $0003,$0008                                                       ;B2EDDA;
    dw ExtendedSpritemaps_PirateWall_C                                   ;B2EDDE;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EDE0;
    dw $0003,$0005                                                       ;B2EDE2;
    dw ExtendedSpritemaps_PirateWall_B                                   ;B2EDE6;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EDE8;
    dw $0003,$0008                                                       ;B2EDEA;
    dw ExtendedSpritemaps_PirateWall_A                                   ;B2EDEE;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B2EDF0;
    dw InstList_PirateWall_MovingDownRightWall_1                         ;B2EDF2;
    dw Instruction_PirateWall_RandomlyChooseADirection_RightWall         ;B2EDF4;

InstList_PirateWall_MovingUpRightWall_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2EDF6;
    dw Function_PirateWall_ClimbingRightWall                             ;B2EDF8;
    dw Instruction_Common_TimerInY                                       ;B2EDFA;
    dw $0004                                                             ;B2EDFC;

InstList_PirateWall_MovingUpRightWall_1:
    dw $000A                                                             ;B2EDFE;
    dw ExtendedSpritemaps_PirateWall_9                                   ;B2EE00;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EE02;
    dw $FFFD,$0008                                                       ;B2EE04;
    dw ExtendedSpritemaps_PirateWall_A                                   ;B2EE08;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EE0A;
    dw $FFFD,$0005                                                       ;B2EE0C;
    dw ExtendedSpritemaps_PirateWall_B                                   ;B2EE10;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EE12;
    dw $FFFD,$0008                                                       ;B2EE14;
    dw ExtendedSpritemaps_PirateWall_C                                   ;B2EE18;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EE1A;
    dw $FFFD,$000A                                                       ;B2EE1C;
    dw ExtendedSpritemaps_PirateWall_D                                   ;B2EE20;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EE22;
    dw $FFFD,$0008                                                       ;B2EE24;
    dw ExtendedSpritemaps_PirateWall_C                                   ;B2EE28;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EE2A;
    dw $FFFD,$0005                                                       ;B2EE2C;
    dw ExtendedSpritemaps_PirateWall_B                                   ;B2EE30;
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right        ;B2EE32;
    dw $FFFD,$0008                                                       ;B2EE34;
    dw ExtendedSpritemaps_PirateWall_A                                   ;B2EE38;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B2EE3A;
    dw InstList_PirateWall_MovingUpRightWall_1                           ;B2EE3C;
    dw Instruction_PirateWall_RandomlyChooseADirection_RightWall         ;B2EE3E;

Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left:
    PHX                                                                  ;B2EE40;
    LDX.W $0E54                                                          ;B2EE41;
    LDA.W #$0000                                                         ;B2EE44;
    STA.B $12                                                            ;B2EE47;
    LDA.W $0000,Y                                                        ;B2EE49;
    STA.B $14                                                            ;B2EE4C;
    PHY                                                                  ;B2EE4E;
    PHX                                                                  ;B2EE4F;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2EE50;
    PLX                                                                  ;B2EE54;
    PLY                                                                  ;B2EE55;
    BCC .noCOllision                                                     ;B2EE56;
    LDA.W EnemyData.work2,X                                              ;B2EE58;
    EOR.W #$0001                                                         ;B2EE5B;
    STA.W EnemyData.work2,X                                              ;B2EE5E;
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0                      ;B2EE61;
    LDA.W EnemyData.work2,X                                              ;B2EE64;
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


Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right:
    PHX                                                                  ;B2EE72;
    LDX.W $0E54                                                          ;B2EE73;
    LDA.W #$0000                                                         ;B2EE76;
    STA.B $12                                                            ;B2EE79;
    LDA.W $0000,Y                                                        ;B2EE7B;
    STA.B $14                                                            ;B2EE7E;
    PHY                                                                  ;B2EE80;
    PHX                                                                  ;B2EE81;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2EE82;
    PLX                                                                  ;B2EE86;
    PLY                                                                  ;B2EE87;
    BCC .noCollision                                                     ;B2EE88;
    LDA.W EnemyData.work2,X                                              ;B2EE8A;
    EOR.W #$0001                                                         ;B2EE8D;
    STA.W EnemyData.work2,X                                              ;B2EE90;
    LDY.W #InstList_PirateWall_MovingDownRightWall_0                     ;B2EE93;
    LDA.W EnemyData.work2,X                                              ;B2EE96;
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


Instruction_PirateWall_RandomlyChooseADirection_LeftWall:
    PHX                                                                  ;B2EEA4;
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0                      ;B2EEA5;
    LDX.W $0E54                                                          ;B2EEA8;
    JSL.L GenerateRandomNumber                                           ;B2EEAB;
    AND.W #$0001                                                         ;B2EEAF;
    STA.W EnemyData.work2,X                                              ;B2EEB2;
    BEQ .return                                                          ;B2EEB5;
    LDY.W #InstList_PirateWall_MovingUpLeftWall_0                        ;B2EEB7;

.return:
    PLX                                                                  ;B2EEBA;
    RTL                                                                  ;B2EEBB;


Instruction_PirateWall_RandomlyChooseADirection_RightWall:
    PHX                                                                  ;B2EEBC;
    LDY.W #InstList_PirateWall_MovingDownRightWall_0                     ;B2EEBD;
    LDX.W $0E54                                                          ;B2EEC0;
    JSL.L GenerateRandomNumber                                           ;B2EEC3;
    AND.W #$0001                                                         ;B2EEC7;
    STA.W EnemyData.work2,X                                              ;B2EECA;
    BEQ .return                                                          ;B2EECD;
    LDY.W #InstList_PirateWall_MovingUpRightWall_0                       ;B2EECF;

.return:
    PLX                                                                  ;B2EED2;
    RTL                                                                  ;B2EED3;


Instruction_PirateWall_PrepareWallJumpToRight:
    PHX                                                                  ;B2EED4;
    PHY                                                                  ;B2EED5;
    LDX.W $0E54                                                          ;B2EED6;
    LDA.W EnemyData.initParam1,X                                         ;B2EED9;
    CLC                                                                  ;B2EEDC;
    ADC.W EnemyData.xPosition,X                                          ;B2EEDD;
    STA.W EnemyData.work1,X                                              ;B2EEE0;
    LDA.W EnemyData.initParam1,X                                         ;B2EEE3;
    LSR A                                                                ;B2EEE6;
    CLC                                                                  ;B2EEE7;
    ADC.W EnemyData.xPosition,X                                          ;B2EEE8;
    STA.W EnemyData.work3,X                                              ;B2EEEB;
    LDA.W EnemyData.yPosition,X                                          ;B2EEEE;
    STA.W EnemyData.work4,X                                              ;B2EEF1;
    LDA.W #$0040                                                         ;B2EEF4;
    STA.W EnemyData.work5,X                                              ;B2EEF7;
    PLY                                                                  ;B2EEFA;
    PLX                                                                  ;B2EEFB;
    RTL                                                                  ;B2EEFC;


Instruction_PirateWall_PrepareWallJumpToLeft:
    PHX                                                                  ;B2EEFD;
    PHY                                                                  ;B2EEFE;
    LDX.W $0E54                                                          ;B2EEFF;
    LDA.W EnemyData.xPosition,X                                          ;B2EF02;
    SEC                                                                  ;B2EF05;
    SBC.W EnemyData.initParam1,X                                         ;B2EF06;
    STA.W EnemyData.work1,X                                              ;B2EF09;
    LDA.W EnemyData.initParam1,X                                         ;B2EF0C;
    LSR A                                                                ;B2EF0F;
    STA.B $12                                                            ;B2EF10;
    LDA.W EnemyData.xPosition,X                                          ;B2EF12;
    SEC                                                                  ;B2EF15;
    SBC.B $12                                                            ;B2EF16;
    STA.W EnemyData.work3,X                                              ;B2EF18;
    LDA.W EnemyData.yPosition,X                                          ;B2EF1B;
    STA.W EnemyData.work4,X                                              ;B2EF1E;
    LDA.W #$00C0                                                         ;B2EF21;
    STA.W EnemyData.work5,X                                              ;B2EF24;
    PLY                                                                  ;B2EF27;
    PLX                                                                  ;B2EF28;
    RTL                                                                  ;B2EF29;


Instruction_PirateWall_FireLaserLeft:
    PHX                                                                  ;B2EF2A;
    PHY                                                                  ;B2EF2B;
    LDY.W $0E54                                                          ;B2EF2C;
    LDX.W EnemyData.pId,Y                                                ;B2EF2F;
    LDA.L $A00006,X                                                      ;B2EF32;
    STA.W $1993                                                          ;B2EF36;
    LDX.W $0E54                                                          ;B2EF39;
    LDA.W EnemyData.xPosition,X                                          ;B2EF3C;
    SEC                                                                  ;B2EF3F;
    SBC.W #$0018                                                         ;B2EF40;
    STA.B $12                                                            ;B2EF43;
    LDA.W EnemyData.yPosition,X                                          ;B2EF45;
    SEC                                                                  ;B2EF48;
    SBC.W #$0010                                                         ;B2EF49;
    STA.B $14                                                            ;B2EF4C;
    LDA.W #$0000                                                         ;B2EF4E;
    STA.B $16                                                            ;B2EF51;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;B2EF53;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B2EF56;
    PLY                                                                  ;B2EF5A;
    PLX                                                                  ;B2EF5B;
    RTL                                                                  ;B2EF5C;


Instruction_PirateWall_FireLaserRight:
    PHX                                                                  ;B2EF5D;
    PHY                                                                  ;B2EF5E;
    LDX.W $0E54                                                          ;B2EF5F;
    LDA.W EnemyData.xPosition,X                                          ;B2EF62;
    CLC                                                                  ;B2EF65;
    ADC.W #$0018                                                         ;B2EF66;
    STA.B $12                                                            ;B2EF69;
    LDA.W EnemyData.yPosition,X                                          ;B2EF6B;
    SEC                                                                  ;B2EF6E;
    SBC.W #$0010                                                         ;B2EF6F;
    STA.B $14                                                            ;B2EF72;
    LDA.W #$0001                                                         ;B2EF74;
    STA.B $16                                                            ;B2EF77;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;B2EF79;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B2EF7C;
    PLY                                                                  ;B2EF80;
    PLX                                                                  ;B2EF81;
    RTL                                                                  ;B2EF82;


Instruction_PirateWall_FunctionInY:
    PHY                                                                  ;B2EF83;
    PHX                                                                  ;B2EF84;
    LDX.W $0E54                                                          ;B2EF85;
    LDA.W $0000,Y                                                        ;B2EF88;
    STA.W EnemyData.work0,X                                              ;B2EF8B;
    PLX                                                                  ;B2EF8E;
    PLY                                                                  ;B2EF8F;
    INY                                                                  ;B2EF90;
    INY                                                                  ;B2EF91;
    RTL                                                                  ;B2EF92;


Instruction_PirateWall_QueueSpacePirateAttackSFX:
    PHX                                                                  ;B2EF93;
    PHY                                                                  ;B2EF94;
    LDA.W #$0066                                                         ;B2EF95;
    JSL.L QueueSound_Lib2_Max6                                           ;B2EF98;
    PLY                                                                  ;B2EF9C;
    PLX                                                                  ;B2EF9D;
    RTL                                                                  ;B2EF9E;


InitAI_PirateWall:
    LDX.W $0E54                                                          ;B2EF9F;
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0                      ;B2EFA2;
    LDA.W EnemyData.initParam0,X                                         ;B2EFA5;
    BIT.W #$0001                                                         ;B2EFA8;
    BEQ .zeroParam                                                       ;B2EFAB;
    LDY.W #InstList_PirateWall_MovingDownRightWall_0                     ;B2EFAD;

.zeroParam:
    TYA                                                                  ;B2EFB0;
    STA.W EnemyData.pInstList,X                                          ;B2EFB1;
    LDA.W #$00BE                                                         ;B2EFB4;
    STA.L $7E8000,X                                                      ;B2EFB7;
    LDA.W #$0042                                                         ;B2EFBB;
    STA.L $7E8002,X                                                      ;B2EFBE;
    LDA.W #$0002                                                         ;B2EFC2;
    STA.L $7E8004,X                                                      ;B2EFC5;
    LDA.W EnemyData.initParam0,X                                         ;B2EFC9;
    BIT.W #$8000                                                         ;B2EFCC;
    BNE .notFastJump                                                     ;B2EFCF;
    LDA.L $7E8000,X                                                      ;B2EFD1;
    CLC                                                                  ;B2EFD5;
    ADC.W #$0002                                                         ;B2EFD6;
    STA.L $7E8000,X                                                      ;B2EFD9;
    LDA.L $7E8002,X                                                      ;B2EFDD;
    SEC                                                                  ;B2EFE1;
    SBC.W #$0002                                                         ;B2EFE2;
    STA.L $7E8002,X                                                      ;B2EFE5;
    LDA.L $7E8004,X                                                      ;B2EFE9;
    CLC                                                                  ;B2EFED;
    ADC.W #$0002                                                         ;B2EFEE;
    STA.L $7E8004,X                                                      ;B2EFF1;

.notFastJump:
    LDY.W #Function_PirateWall_ClimbingLeftWall                          ;B2EFF5;
    LDA.W EnemyData.initParam0,X                                         ;B2EFF8;
    BIT.W #$0001                                                         ;B2EFFB;
    BEQ +                                                                ;B2EFFE;
    LDY.W #Function_PirateWall_ClimbingRightWall                         ;B2F000;

  + TYA                                                                  ;B2F003;
    STA.W EnemyData.work0,X                                              ;B2F004;
    LDA.W EnemyData.xPosition,X                                          ;B2F007;
    AND.W #$000F                                                         ;B2F00A;
    CMP.W #$000B                                                         ;B2F00D;
    BMI .lessThanB                                                       ;B2F010;
    LDA.W EnemyData.xPosition,X                                          ;B2F012;
    AND.W #$FFF0                                                         ;B2F015;
    CLC                                                                  ;B2F018;
    ADC.W #$0010                                                         ;B2F019;
    STA.W EnemyData.xPosition,X                                          ;B2F01C;
    BRA .return                                                          ;B2F01F;


.lessThanB:
    LDA.W EnemyData.xPosition,X                                          ;B2F021;
    AND.W #$FFF8                                                         ;B2F024;
    STA.W EnemyData.xPosition,X                                          ;B2F027;
    BRA .return                                                          ;B2F02A; >.<


.return:
    RTL                                                                  ;B2F02C;


MainAI_PirateWall:
    LDX.W $0E54                                                          ;B2F02D;
    JSR.W ($0FA8,X)                                                      ;B2F030;
    RTL                                                                  ;B2F033;


Function_PirateWall_ClimbingLeftWall:
    LDX.W $0E54                                                          ;B2F034;
    LDA.W #$0020                                                         ;B2F037;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2F03A;
    BEQ RTS_B2F04D                                                       ;B2F03E;
    LDA.W #InstList_PirateWall_FireLaser_WallJumpRight                   ;B2F040;
    STA.W EnemyData.pInstList,X                                          ;B2F043;
    LDA.W #$0001                                                         ;B2F046;
    STA.W EnemyData.instTimer,X                                          ;B2F049;
    RTS                                                                  ;B2F04C;


RTS_B2F04D:
    RTS                                                                  ;B2F04D;


RTS_B2F04E:
    RTS                                                                  ;B2F04E;


RTS_B2F04F:
    RTS                                                                  ;B2F04F;


Function_PirateWall_WallJumpingRight:
    LDX.W $0E54                                                          ;B2F050;
    LDA.W EnemyData.initParam1,X                                         ;B2F053;
    LSR A                                                                ;B2F056;
    STA.W $0E32                                                          ;B2F057;
    LDA.W EnemyData.work5,X                                              ;B2F05A;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;B2F05D;
    CLC                                                                  ;B2F061;
    ADC.W EnemyData.work3,X                                              ;B2F062;
    STA.W EnemyData.xPosition,X                                          ;B2F065;
    LDA.W EnemyData.initParam1,X                                         ;B2F068;
    LSR A                                                                ;B2F06B;
    LSR A                                                                ;B2F06C;
    STA.W $0E32                                                          ;B2F06D;
    LDA.W EnemyData.work5,X                                              ;B2F070;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;B2F073;
    EOR.W #$FFFF                                                         ;B2F077;
    INC A                                                                ;B2F07A;
    CLC                                                                  ;B2F07B;
    ADC.W EnemyData.work4,X                                              ;B2F07C;
    STA.W EnemyData.yPosition,X                                          ;B2F07F;
    LDA.W EnemyData.work5,X                                              ;B2F082;
    SEC                                                                  ;B2F085;
    SBC.L $7E8004,X                                                      ;B2F086;
    AND.W #$00FF                                                         ;B2F08A;
    STA.W EnemyData.work5,X                                              ;B2F08D;
    CMP.L $7E8000,X                                                      ;B2F090;
    BNE .return                                                          ;B2F094;
    LDA.W #InstList_PirateWall_LandingOnRightWall                        ;B2F096;
    STA.W EnemyData.pInstList,X                                          ;B2F099;
    LDA.W #$0001                                                         ;B2F09C;
    STA.W EnemyData.instTimer,X                                          ;B2F09F;
    LDA.W EnemyData.xPosition,X                                          ;B2F0A2;
    AND.W #$000F                                                         ;B2F0A5;
    CMP.W #$000B                                                         ;B2F0A8;
    BMI .lessThanB                                                       ;B2F0AB;
    LDA.W EnemyData.xPosition,X                                          ;B2F0AD;
    AND.W #$FFF0                                                         ;B2F0B0;
    CLC                                                                  ;B2F0B3;
    ADC.W #$0010                                                         ;B2F0B4;
    STA.W EnemyData.xPosition,X                                          ;B2F0B7;
    BRA .return                                                          ;B2F0BA;


.lessThanB:
    LDA.W EnemyData.xPosition,X                                          ;B2F0BC;
    AND.W #$FFF8                                                         ;B2F0BF;
    STA.W EnemyData.xPosition,X                                          ;B2F0C2;
    BRA .return                                                          ;B2F0C5; >.<


.return:
    RTS                                                                  ;B2F0C7;


Function_PirateWall_ClimbingRightWall:
    LDX.W $0E54                                                          ;B2F0C8;
    LDA.W #$0020                                                         ;B2F0CB;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2F0CE;
    BEQ RTS_B2F0E1                                                       ;B2F0D2;
    LDA.W #InstList_PirateWall_FireLaser_WallJumpLeft                    ;B2F0D4;
    STA.W EnemyData.pInstList,X                                          ;B2F0D7;
    LDA.W #$0001                                                         ;B2F0DA;
    STA.W EnemyData.instTimer,X                                          ;B2F0DD;
    RTS                                                                  ;B2F0E0;


RTS_B2F0E1:
    RTS                                                                  ;B2F0E1;


RTS_B2F0E2:
    RTS                                                                  ;B2F0E2;


RTS_B2F0E3:
    RTS                                                                  ;B2F0E3;


Function_PirateWall_WallJumpingLeft:
    LDX.W $0E54                                                          ;B2F0E4;
    LDA.W EnemyData.initParam1,X                                         ;B2F0E7;
    LSR A                                                                ;B2F0EA;
    STA.W $0E32                                                          ;B2F0EB;
    LDA.W EnemyData.work5,X                                              ;B2F0EE;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;B2F0F1;
    CLC                                                                  ;B2F0F5;
    ADC.W EnemyData.work3,X                                              ;B2F0F6;
    STA.W EnemyData.xPosition,X                                          ;B2F0F9;
    LDA.W EnemyData.initParam1,X                                         ;B2F0FC;
    LSR A                                                                ;B2F0FF;
    LSR A                                                                ;B2F100;
    STA.W $0E32                                                          ;B2F101;
    LDA.W EnemyData.work5,X                                              ;B2F104;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;B2F107;
    EOR.W #$FFFF                                                         ;B2F10B;
    INC A                                                                ;B2F10E;
    CLC                                                                  ;B2F10F;
    ADC.W EnemyData.work4,X                                              ;B2F110;
    STA.W EnemyData.yPosition,X                                          ;B2F113;
    LDA.W EnemyData.work5,X                                              ;B2F116;
    CLC                                                                  ;B2F119;
    ADC.L $7E8004,X                                                      ;B2F11A;
    AND.W #$00FF                                                         ;B2F11E;
    STA.W EnemyData.work5,X                                              ;B2F121;
    CMP.L $7E8002,X                                                      ;B2F124;
    BNE .return                                                          ;B2F128;
    LDA.W #InstList_PirateWall_LandedOnLeftWall                          ;B2F12A;
    STA.W EnemyData.pInstList,X                                          ;B2F12D;
    LDA.W #$0001                                                         ;B2F130;
    STA.W EnemyData.instTimer,X                                          ;B2F133;
    LDA.W EnemyData.xPosition,X                                          ;B2F136;
    AND.W #$000F                                                         ;B2F139;
    CMP.W #$000B                                                         ;B2F13C;
    BMI .lessThanB                                                       ;B2F13F;
    LDA.W EnemyData.xPosition,X                                          ;B2F141;
    AND.W #$FFF0                                                         ;B2F144;
    CLC                                                                  ;B2F147;
    ADC.W #$0010                                                         ;B2F148;
    STA.W EnemyData.xPosition,X                                          ;B2F14B;
    BRA .return                                                          ;B2F14E;


.lessThanB:
    LDA.W EnemyData.xPosition,X                                          ;B2F150;
    AND.W #$FFF8                                                         ;B2F153;
    STA.W EnemyData.xPosition,X                                          ;B2F156;
    BRA .return                                                          ;B2F159; >.<


.return:
    RTS                                                                  ;B2F15B;


InstList_PirateNinja_ProjectileClawAttack_Left:
    dw Instruction_PirateWall_FunctionInY                                ;B2F15C;
    dw RTS_A0804B                                                        ;B2F15E;
    dw $0005                                                             ;B2F160;
    dw ExtendedSpritemaps_PirateNinja_0                                  ;B2F162;
    dw $0005                                                             ;B2F164;
    dw ExtendedSpritemaps_PirateNinja_1                                  ;B2F166;
    dw $0005                                                             ;B2F168;
    dw ExtendedSpritemaps_PirateNinja_2                                  ;B2F16A;
    dw $0005                                                             ;B2F16C;
    dw ExtendedSpritemaps_PirateNinja_3                                  ;B2F16E;
    dw $0005                                                             ;B2F170;
    dw ExtendedSpritemaps_PirateNinja_4                                  ;B2F172;
    dw $0002                                                             ;B2F174;
    dw ExtendedSpritemaps_PirateNinja_5                                  ;B2F176;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F178;
    dw $0000,$FFE0,$FFF8                                                 ;B2F17A;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F180;
    dw $0066,$0002                                                       ;B2F182;
    dw ExtendedSpritemaps_PirateNinja_6                                  ;B2F186;
    dw $0002                                                             ;B2F188;
    dw ExtendedSpritemaps_PirateNinja_7                                  ;B2F18A;
    dw $0002                                                             ;B2F18C;
    dw ExtendedSpritemaps_PirateNinja_8                                  ;B2F18E;
    dw $0005                                                             ;B2F190;
    dw ExtendedSpritemaps_PirateNinja_0                                  ;B2F192;
    dw $0005                                                             ;B2F194;
    dw ExtendedSpritemaps_PirateNinja_1                                  ;B2F196;
    dw $0005                                                             ;B2F198;
    dw ExtendedSpritemaps_PirateNinja_2                                  ;B2F19A;
    dw $0005                                                             ;B2F19C;
    dw ExtendedSpritemaps_PirateNinja_3                                  ;B2F19E;
    dw $0005                                                             ;B2F1A0;
    dw ExtendedSpritemaps_PirateNinja_4                                  ;B2F1A2;
    dw $0002                                                             ;B2F1A4;
    dw ExtendedSpritemaps_PirateNinja_5                                  ;B2F1A6;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F1A8;
    dw $0000,$FFF0,$0008                                                 ;B2F1AA;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F1B0;
    dw $0066,$0002                                                       ;B2F1B2;
    dw ExtendedSpritemaps_PirateNinja_6                                  ;B2F1B6;
    dw $0002                                                             ;B2F1B8;
    dw ExtendedSpritemaps_PirateNinja_7                                  ;B2F1BA;
    dw $0002                                                             ;B2F1BC;
    dw ExtendedSpritemaps_PirateNinja_8                                  ;B2F1BE;
    dw Instruction_Common_GotoY                                          ;B2F1C0;
    dw InstList_PirateNinja_Active_FacingLeft_0                          ;B2F1C2;

InstList_PirateNinja_SpinJumpLeft_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F1C4;
    dw RTS_A0804B                                                        ;B2F1C6;
    dw $0005                                                             ;B2F1C8;
    dw ExtendedSpritemaps_PirateNinja_0                                  ;B2F1CA;
    dw $0005                                                             ;B2F1CC;
    dw ExtendedSpritemaps_PirateNinja_1                                  ;B2F1CE;
    dw $0005                                                             ;B2F1D0;
    dw ExtendedSpritemaps_PirateNinja_2                                  ;B2F1D2;
    dw $0005                                                             ;B2F1D4;
    dw ExtendedSpritemaps_PirateNinja_3                                  ;B2F1D6;
    dw $0005                                                             ;B2F1D8;
    dw ExtendedSpritemaps_PirateNinja_4                                  ;B2F1DA;
    dw $0002                                                             ;B2F1DC;
    dw ExtendedSpritemaps_PirateNinja_5                                  ;B2F1DE;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F1E0;
    dw $0000,$FFE0,$FFF8                                                 ;B2F1E2;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F1E8;
    dw $0066,$0002                                                       ;B2F1EA;
    dw ExtendedSpritemaps_PirateNinja_6                                  ;B2F1EE;
    dw $0002                                                             ;B2F1F0;
    dw ExtendedSpritemaps_PirateNinja_7                                  ;B2F1F2;
    dw $0002                                                             ;B2F1F4;
    dw ExtendedSpritemaps_PirateNinja_8                                  ;B2F1F6;
    dw Instruction_PirateNinja_ResetSpeed                                ;B2F1F8;
    dw Instruction_PirateWall_FunctionInY                                ;B2F1FA;
    dw RTS_A0804B                                                        ;B2F1FC;
    dw $0008                                                             ;B2F1FE;
    dw ExtendedSpritemaps_PirateNinja_0                                  ;B2F200;
    dw Instruction_PirateWall_FunctionInY                                ;B2F202;
    dw Function_PirateNinja_SpinJumpleft_Rising                          ;B2F204;

InstList_PirateNinja_SpinJumpLeft_1:
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F206;
    dw $003F,$0001                                                       ;B2F208;
    dw ExtendedSpritemaps_PirateNinja_12                                 ;B2F20C;
    dw $0001                                                             ;B2F20E;
    dw ExtendedSpritemaps_PirateNinja_13                                 ;B2F210;
    dw $0001                                                             ;B2F212;
    dw ExtendedSpritemaps_PirateNinja_14                                 ;B2F214;
    dw $0001                                                             ;B2F216;
    dw ExtendedSpritemaps_PirateNinja_15                                 ;B2F218;
    dw $0001                                                             ;B2F21A;
    dw ExtendedSpritemaps_PirateNinja_16                                 ;B2F21C;
    dw $0001                                                             ;B2F21E;
    dw ExtendedSpritemaps_PirateNinja_17                                 ;B2F220;
    dw $0001                                                             ;B2F222;
    dw ExtendedSpritemaps_PirateNinja_18                                 ;B2F224;
    dw $0001                                                             ;B2F226;
    dw ExtendedSpritemaps_PirateNinja_19                                 ;B2F228;
    dw Instruction_Common_GotoY                                          ;B2F22A;
    dw InstList_PirateNinja_SpinJumpLeft_1                               ;B2F22C;

InstList_PirateNinja_Active_FacingLeft_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F22E;
    dw Function_PirateNinja_Active                                       ;B2F230;

InstList_PirateNinja_Active_FacingLeft_1:
    dw $000A                                                             ;B2F232;
    dw ExtendedSpritemaps_PirateNinja_32                                 ;B2F234;
    dw $000A                                                             ;B2F236;
    dw ExtendedSpritemaps_PirateNinja_33                                 ;B2F238;
    dw $000A                                                             ;B2F23A;
    dw ExtendedSpritemaps_PirateNinja_34                                 ;B2F23C;
    dw $000A                                                             ;B2F23E;
    dw ExtendedSpritemaps_PirateNinja_33                                 ;B2F240;
    dw Instruction_PirateWall_FunctionInY                                ;B2F242;
    dw RTS_A0804B                                                        ;B2F244;
    dw Instruction_PirateNinja_SetFunction0FAC_Active                    ;B2F246;
    dw Instruction_Common_GotoY                                          ;B2F248;
    dw InstList_PirateNinja_Active_FacingLeft_1                          ;B2F24A;

UNUSED_InstList_PirateNinja_WalkingLeft_B2F24C:
    dw $0005                                                             ;B2F24C;
    dw ExtendedSpritemaps_PirateNinja_22                                 ;B2F24E;
    dw $0005                                                             ;B2F250;
    dw ExtendedSpritemaps_PirateNinja_23                                 ;B2F252;
    dw $0005                                                             ;B2F254;
    dw ExtendedSpritemaps_PirateNinja_24                                 ;B2F256;
    dw $0005                                                             ;B2F258;
    dw ExtendedSpritemaps_PirateNinja_25                                 ;B2F25A;
    dw $0005                                                             ;B2F25C;
    dw ExtendedSpritemaps_PirateNinja_26                                 ;B2F25E;
    dw $0005                                                             ;B2F260;
    dw ExtendedSpritemaps_PirateNinja_27                                 ;B2F262;
    dw $0005                                                             ;B2F264;
    dw ExtendedSpritemaps_PirateNinja_28                                 ;B2F266;
    dw $0005                                                             ;B2F268;
    dw ExtendedSpritemaps_PirateNinja_29                                 ;B2F26A;
    dw Instruction_Common_GotoY                                          ;B2F26C;
    dw UNUSED_InstList_PirateNinja_WalkingLeft_B2F24C                    ;B2F26E;

InstList_PirateNinja_Flinch_FacingLeft:
    dw Instruction_PirateWall_FunctionInY                                ;B2F270;
    dw RTS_A0804B                                                        ;B2F272;
    dw $0010                                                             ;B2F274;
    dw ExtendedSpritemaps_PirateNinja_38                                 ;B2F276;
    dw Instruction_Common_GotoY                                          ;B2F278;
    dw InstList_PirateNinja_Active_FacingLeft_0                          ;B2F27A;

InstList_PirateNinja_DivekickLeft_Jump_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F27C;
    dw RTS_B2804B                                                        ;B2F27E;
    dw $0008                                                             ;B2F280;
    dw ExtendedSpritemaps_PirateNinja_42                                 ;B2F282;
    dw Instruction_PirateNinja_SetLeftDivekickJumpInitialYSpeed          ;B2F284;
    dw Instruction_PirateWall_FunctionInY                                ;B2F286;
    dw Instruction_PirateNinja_DivekickLeft_Jump                         ;B2F288;

InstList_PirateNinja_DivekickLeft_Jump_1:
    dw Instruction_PirateNinja_PaletteIndexInY                           ;B2F28A;
    dw $0200,$0004                                                       ;B2F28C;
    dw ExtendedSpritemaps_PirateNinja_3A                                 ;B2F290;
    dw Instruction_PirateNinja_PaletteIndexInY                           ;B2F292;
    dw $0E00,$0004                                                       ;B2F294;
    dw ExtendedSpritemaps_PirateNinja_3A                                 ;B2F298;
    dw Instruction_Common_GotoY                                          ;B2F29A;
    dw InstList_PirateNinja_DivekickLeft_Jump_1                          ;B2F29C;
    dw Instruction_Common_Sleep                                          ;B2F29E;

InstList_PirateNinja_DivekickLeft_Divekick:
    dw Instruction_PirateNinja_PaletteIndexInY                           ;B2F2A0;
    dw $0E00                                                             ;B2F2A2;
    dw Instruction_PirateWall_FunctionInY                                ;B2F2A4;
    dw Instruction_PirateNinja_DivekickLeft_Divekick                     ;B2F2A6;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F2A8;
    dw $0066,$0001                                                       ;B2F2AA;
    dw ExtendedSpritemaps_PirateNinja_3B                                 ;B2F2AE;
    dw Instruction_Common_Sleep                                          ;B2F2B0;

InstList_PirateNinja_DivekickLeft_WalkToLeftPost_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F2B2;
    dw Instruction_PirateNinja_DivekickLeft_WalkToLeftPost               ;B2F2B4;

InstList_PirateNinja_DivekickLeft_WalkToLeftPost_1:
    dw $0005                                                             ;B2F2B6;
    dw ExtendedSpritemaps_PirateNinja_22                                 ;B2F2B8;
    dw $0005                                                             ;B2F2BA;
    dw ExtendedSpritemaps_PirateNinja_23                                 ;B2F2BC;
    dw $0005                                                             ;B2F2BE;
    dw ExtendedSpritemaps_PirateNinja_24                                 ;B2F2C0;
    dw $0005                                                             ;B2F2C2;
    dw ExtendedSpritemaps_PirateNinja_25                                 ;B2F2C4;
    dw $0005                                                             ;B2F2C6;
    dw ExtendedSpritemaps_PirateNinja_26                                 ;B2F2C8;
    dw $0005                                                             ;B2F2CA;
    dw ExtendedSpritemaps_PirateNinja_27                                 ;B2F2CC;
    dw $0005                                                             ;B2F2CE;
    dw ExtendedSpritemaps_PirateNinja_28                                 ;B2F2D0;
    dw $0005                                                             ;B2F2D2;
    dw ExtendedSpritemaps_PirateNinja_29                                 ;B2F2D4;
    dw Instruction_Common_GotoY                                          ;B2F2D6;
    dw InstList_PirateNinja_DivekickLeft_WalkToLeftPost_1                ;B2F2D8;

InstList_PirateNinja_Initial_FacingLeft_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F2DA;
    dw Function_PirateNinja_Initial                                      ;B2F2DC;

InstList_PirateNinja_Initial_FacingLeft_1:
    dw $0020                                                             ;B2F2DE;
    dw ExtendedSpritemaps_PirateNinja_46                                 ;B2F2E0;
    dw $000A                                                             ;B2F2E2;
    dw ExtendedSpritemaps_PirateNinja_47                                 ;B2F2E4;
    dw $0020                                                             ;B2F2E6;
    dw ExtendedSpritemaps_PirateNinja_48                                 ;B2F2E8;
    dw $000A                                                             ;B2F2EA;
    dw ExtendedSpritemaps_PirateNinja_47                                 ;B2F2EC;
    dw $0020                                                             ;B2F2EE;
    dw ExtendedSpritemaps_PirateNinja_46                                 ;B2F2F0;
    dw Instruction_Common_GotoY                                          ;B2F2F2;
    dw InstList_PirateNinja_Initial_FacingLeft_1                         ;B2F2F4;
    dw Instruction_CommonB2_Sleep                                        ;B2F2F6;

InstList_PirateNinja_Land_FacingLeft_0:
    dw Instruction_PirateNinja_PaletteIndexInY                           ;B2F2F8;
    dw $0200                                                             ;B2F2FA;
    dw Instruction_PirateWall_FunctionInY                                ;B2F2FC;
    dw RTS_A0804B                                                        ;B2F2FE;
    dw $0004                                                             ;B2F300;
    dw ExtendedSpritemaps_PirateNinja_47                                 ;B2F302;
    dw $0008                                                             ;B2F304;
    dw ExtendedSpritemaps_PirateNinja_46                                 ;B2F306;
    dw $0004                                                             ;B2F308;
    dw ExtendedSpritemaps_PirateNinja_4C                                 ;B2F30A;
    dw $0004                                                             ;B2F30C;
    dw ExtendedSpritemaps_PirateNinja_4A                                 ;B2F30E;
    dw Instruction_PirateWall_FunctionInY                                ;B2F310;
    dw Function_PirateNinja_ReadingToDivekick                            ;B2F312;

InstList_PirateNinja_Land_FacingLeft_1:
    dw $000A                                                             ;B2F314;
    dw ExtendedSpritemaps_PirateNinja_35                                 ;B2F316;
    dw $000A                                                             ;B2F318;
    dw ExtendedSpritemaps_PirateNinja_36                                 ;B2F31A;
    dw $000A                                                             ;B2F31C;
    dw ExtendedSpritemaps_PirateNinja_37                                 ;B2F31E;
    dw $000A                                                             ;B2F320;
    dw ExtendedSpritemaps_PirateNinja_36                                 ;B2F322;
    dw Instruction_Common_GotoY                                          ;B2F324;
    dw InstList_PirateNinja_Land_FacingLeft_1                            ;B2F326;

UNUSED_InstList_PirateNinja_FacingForward_B2F328:
    dw $0008                                                             ;B2F328;
    dw ExtendedSpritemaps_PirateNinja_4C                                 ;B2F32A;
    dw Instruction_Common_Sleep                                          ;B2F32C;

InstList_PirateNinja_StandingKick_FacingLeft:
    dw Instruction_PirateWall_FunctionInY                                ;B2F32E;
    dw RTS_A0804B                                                        ;B2F330;
    dw $0004                                                             ;B2F332;
    dw ExtendedSpritemaps_PirateNinja_3E                                 ;B2F334;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F336;
    dw $0066,$0004                                                       ;B2F338;
    dw ExtendedSpritemaps_PirateNinja_44                                 ;B2F33C;
    dw $0020                                                             ;B2F33E;
    dw ExtendedSpritemaps_PirateNinja_3F                                 ;B2F340;
    dw $0004                                                             ;B2F342;
    dw ExtendedSpritemaps_PirateNinja_44                                 ;B2F344;
    dw Instruction_Common_GotoY                                          ;B2F346;
    dw InstList_PirateNinja_Active_FacingLeft_0                          ;B2F348;

InstList_PirateNinja_ProjectileClawAttack_Right:
    dw Instruction_PirateWall_FunctionInY                                ;B2F34A;
    dw RTS_B2804B                                                        ;B2F34C;
    dw $0005                                                             ;B2F34E;
    dw ExtendedSpritemaps_PirateNinja_9                                  ;B2F350;
    dw $0005                                                             ;B2F352;
    dw ExtendedSpritemaps_PirateNinja_A                                  ;B2F354;
    dw $0005                                                             ;B2F356;
    dw ExtendedSpritemaps_PirateNinja_B                                  ;B2F358;
    dw $0005                                                             ;B2F35A;
    dw ExtendedSpritemaps_PirateNinja_C                                  ;B2F35C;
    dw $0005                                                             ;B2F35E;
    dw ExtendedSpritemaps_PirateNinja_D                                  ;B2F360;
    dw $0002                                                             ;B2F362;
    dw ExtendedSpritemaps_PirateNinja_E                                  ;B2F364;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F366;
    dw $0001,$0020,$FFF8                                                 ;B2F368;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F36E;
    dw $0066,$0002                                                       ;B2F370;
    dw ExtendedSpritemaps_PirateNinja_A                                  ;B2F374;
    dw $0002                                                             ;B2F376;
    dw ExtendedSpritemaps_PirateNinja_F                                  ;B2F378;
    dw $0002                                                             ;B2F37A;
    dw ExtendedSpritemaps_PirateNinja_11                                 ;B2F37C;
    dw $0005                                                             ;B2F37E;
    dw ExtendedSpritemaps_PirateNinja_9                                  ;B2F380;
    dw $0005                                                             ;B2F382;
    dw ExtendedSpritemaps_PirateNinja_A                                  ;B2F384;
    dw $0005                                                             ;B2F386;
    dw ExtendedSpritemaps_PirateNinja_B                                  ;B2F388;
    dw $0005                                                             ;B2F38A;
    dw ExtendedSpritemaps_PirateNinja_C                                  ;B2F38C;
    dw $0005                                                             ;B2F38E;
    dw ExtendedSpritemaps_PirateNinja_D                                  ;B2F390;
    dw $0002                                                             ;B2F392;
    dw ExtendedSpritemaps_PirateNinja_E                                  ;B2F394;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F396;
    dw $0001,$0010,$0008,$0002                                           ;B2F398;
    dw ExtendedSpritemaps_PirateNinja_A                                  ;B2F3A0;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F3A2;
    dw $0066,$0002                                                       ;B2F3A4;
    dw ExtendedSpritemaps_PirateNinja_F                                  ;B2F3A8;
    dw $0002                                                             ;B2F3AA;
    dw ExtendedSpritemaps_PirateNinja_11                                 ;B2F3AC;
    dw Instruction_Common_GotoY                                          ;B2F3AE;
    dw InstList_PirateNinja_Active_FacingRight_0                         ;B2F3B0;

InstList_PirateNinja_SpinJumpRight_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F3B2;
    dw RTS_B2804B                                                        ;B2F3B4;
    dw $0005                                                             ;B2F3B6;
    dw ExtendedSpritemaps_PirateNinja_9                                  ;B2F3B8;
    dw $0005                                                             ;B2F3BA;
    dw ExtendedSpritemaps_PirateNinja_A                                  ;B2F3BC;
    dw $0005                                                             ;B2F3BE;
    dw ExtendedSpritemaps_PirateNinja_B                                  ;B2F3C0;
    dw $0005                                                             ;B2F3C2;
    dw ExtendedSpritemaps_PirateNinja_C                                  ;B2F3C4;
    dw $0005                                                             ;B2F3C6;
    dw ExtendedSpritemaps_PirateNinja_D                                  ;B2F3C8;
    dw $0002                                                             ;B2F3CA;
    dw ExtendedSpritemaps_PirateNinja_E                                  ;B2F3CC;
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset      ;B2F3CE;
    dw $0001,$0020,$FFF8                                                 ;B2F3D0;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F3D6;
    dw $0066,$0002                                                       ;B2F3D8;
    dw ExtendedSpritemaps_PirateNinja_A                                  ;B2F3DC;
    dw $0002                                                             ;B2F3DE;
    dw ExtendedSpritemaps_PirateNinja_F                                  ;B2F3E0;
    dw $0002                                                             ;B2F3E2;
    dw ExtendedSpritemaps_PirateNinja_11                                 ;B2F3E4;
    dw Instruction_PirateNinja_ResetSpeed                                ;B2F3E6;
    dw Instruction_PirateWall_FunctionInY                                ;B2F3E8;
    dw RTS_A0804B                                                        ;B2F3EA;
    dw $0008                                                             ;B2F3EC;
    dw ExtendedSpritemaps_PirateNinja_9                                  ;B2F3EE;
    dw Instruction_PirateWall_FunctionInY                                ;B2F3F0;
    dw Function_PirateNinja_SpinJumpRight_Rising                         ;B2F3F2;

InstList_PirateNinja_SpinJumpRight_1:
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F3F4;
    dw $003F,$0001                                                       ;B2F3F6;
    dw ExtendedSpritemaps_PirateNinja_1A                                 ;B2F3FA;
    dw $0001                                                             ;B2F3FC;
    dw ExtendedSpritemaps_PirateNinja_1B                                 ;B2F3FE;
    dw $0001                                                             ;B2F400;
    dw ExtendedSpritemaps_PirateNinja_1C                                 ;B2F402;
    dw $0001                                                             ;B2F404;
    dw ExtendedSpritemaps_PirateNinja_1D                                 ;B2F406;
    dw $0001                                                             ;B2F408;
    dw ExtendedSpritemaps_PirateNinja_1E                                 ;B2F40A;
    dw $0001                                                             ;B2F40C;
    dw ExtendedSpritemaps_PirateNinja_1F                                 ;B2F40E;
    dw $0001                                                             ;B2F410;
    dw ExtendedSpritemaps_PirateNinja_20                                 ;B2F412;
    dw $0001                                                             ;B2F414;
    dw ExtendedSpritemaps_PirateNinja_21                                 ;B2F416;
    dw Instruction_Common_GotoY                                          ;B2F418;
    dw InstList_PirateNinja_SpinJumpRight_1                              ;B2F41A;

UNUSED_InstList_PirateNinja_B2F41C:
    dw $0010                                                             ;B2F41C;
    dw ExtendedSpritemaps_PirateNinja_9                                  ;B2F41E;

InstList_PirateNinja_Active_FacingRight_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F420;
    dw Function_PirateNinja_Active                                       ;B2F422;

InstList_PirateNinja_Active_FacingRight_1:
    dw $000A                                                             ;B2F424;
    dw ExtendedSpritemaps_PirateNinja_35                                 ;B2F426;
    dw $000A                                                             ;B2F428;
    dw ExtendedSpritemaps_PirateNinja_36                                 ;B2F42A;
    dw $000A                                                             ;B2F42C;
    dw ExtendedSpritemaps_PirateNinja_37                                 ;B2F42E;
    dw $000A                                                             ;B2F430;
    dw ExtendedSpritemaps_PirateNinja_36                                 ;B2F432;
    dw Instruction_PirateWall_FunctionInY                                ;B2F434;
    dw RTS_B2804B                                                        ;B2F436;
    dw Instruction_PirateNinja_SetFunction0FAC_Active                    ;B2F438;
    dw Instruction_Common_GotoY                                          ;B2F43A;
    dw InstList_PirateNinja_Active_FacingRight_1                         ;B2F43C;

UNUSED_InstList_PirateNinja_WalkingRight_B2F43E:
    dw $0005                                                             ;B2F43E;
    dw ExtendedSpritemaps_PirateNinja_2A                                 ;B2F440;
    dw $0005                                                             ;B2F442;
    dw ExtendedSpritemaps_PirateNinja_2B                                 ;B2F444;
    dw $0005                                                             ;B2F446;
    dw ExtendedSpritemaps_PirateNinja_2C                                 ;B2F448;
    dw $0005                                                             ;B2F44A;
    dw ExtendedSpritemaps_PirateNinja_2D                                 ;B2F44C;
    dw $0005                                                             ;B2F44E;
    dw ExtendedSpritemaps_PirateNinja_2E                                 ;B2F450;
    dw $0005                                                             ;B2F452;
    dw ExtendedSpritemaps_PirateNinja_2F                                 ;B2F454;
    dw $0005                                                             ;B2F456;
    dw ExtendedSpritemaps_PirateNinja_30                                 ;B2F458;
    dw $0005                                                             ;B2F45A;
    dw ExtendedSpritemaps_PirateNinja_31                                 ;B2F45C;
    dw Instruction_Common_GotoY                                          ;B2F45E;
    dw UNUSED_InstList_PirateNinja_WalkingRight_B2F43E                   ;B2F460;

InstList_PirateNinja_Flinch_FacingRight:
    dw Instruction_PirateWall_FunctionInY                                ;B2F462;
    dw RTS_B2804B                                                        ;B2F464;
    dw $0010                                                             ;B2F466;
    dw ExtendedSpritemaps_PirateNinja_39                                 ;B2F468;
    dw Instruction_Common_GotoY                                          ;B2F46A;
    dw InstList_PirateNinja_Active_FacingRight_0                         ;B2F46C;

InstList_PirateNinja_DivekickRight_Jump_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F46E;
    dw RTS_B2804B                                                        ;B2F470;
    dw $0008                                                             ;B2F472;
    dw ExtendedSpritemaps_PirateNinja_43                                 ;B2F474;
    dw Instruction_PirateNinja_SetRightDivekickJumpInitialYSpeed         ;B2F476;
    dw Instruction_PirateWall_FunctionInY                                ;B2F478;
    dw Instruction_PirateNinja_DivekickRight_Jump                        ;B2F47A;

InstList_PirateNinja_DivekickRight_Jump_1:
    dw Instruction_PirateNinja_PaletteIndexInY                           ;B2F47C;
    dw $0200,$0004                                                       ;B2F47E;
    dw ExtendedSpritemaps_PirateNinja_3C                                 ;B2F482;
    dw Instruction_PirateNinja_PaletteIndexInY                           ;B2F484;
    dw $0E00,$0004                                                       ;B2F486;
    dw ExtendedSpritemaps_PirateNinja_3C                                 ;B2F48A;
    dw Instruction_Common_GotoY                                          ;B2F48C;
    dw InstList_PirateNinja_DivekickRight_Jump_1                         ;B2F48E;
    dw Instruction_Common_Sleep                                          ;B2F490;

InstList_PirateNinja_DivekickRight_Divekick:
    dw Instruction_PirateNinja_PaletteIndexInY                           ;B2F492;
    dw $0E00                                                             ;B2F494;
    dw Instruction_PirateWall_FunctionInY                                ;B2F496;
    dw Instruction_PirateNinja_DivekickRight_Divekick                    ;B2F498;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F49A;
    dw $0066,$0001                                                       ;B2F49C;
    dw ExtendedSpritemaps_PirateNinja_3D                                 ;B2F4A0;
    dw Instruction_Common_Sleep                                          ;B2F4A2;

InstList_PirateNinja_DivekickRight_WalkToRightPost_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F4A4;
    dw Instruction_PirateNinja_DivekickRight_WalkToRightPost             ;B2F4A6;

InstList_PirateNinja_DivekickRight_WalkToRightPost_1:
    dw $0005                                                             ;B2F4A8;
    dw ExtendedSpritemaps_PirateNinja_2A                                 ;B2F4AA;
    dw $0005                                                             ;B2F4AC;
    dw ExtendedSpritemaps_PirateNinja_2B                                 ;B2F4AE;
    dw $0005                                                             ;B2F4B0;
    dw ExtendedSpritemaps_PirateNinja_2C                                 ;B2F4B2;
    dw $0005                                                             ;B2F4B4;
    dw ExtendedSpritemaps_PirateNinja_2D                                 ;B2F4B6;
    dw $0005                                                             ;B2F4B8;
    dw ExtendedSpritemaps_PirateNinja_2E                                 ;B2F4BA;
    dw $0005                                                             ;B2F4BC;
    dw ExtendedSpritemaps_PirateNinja_2F                                 ;B2F4BE;
    dw $0005                                                             ;B2F4C0;
    dw ExtendedSpritemaps_PirateNinja_30                                 ;B2F4C2;
    dw $0005                                                             ;B2F4C4;
    dw ExtendedSpritemaps_PirateNinja_31                                 ;B2F4C6;
    dw Instruction_Common_GotoY                                          ;B2F4C8;
    dw InstList_PirateNinja_DivekickRight_WalkToRightPost_1              ;B2F4CA;

InstList_PirateNinja_Initial_FacingRight_0:
    dw Instruction_PirateWall_FunctionInY                                ;B2F4CC;
    dw Function_PirateNinja_Initial                                      ;B2F4CE;

InstList_PirateNinja_Initial_FacingRight_1:
    dw $0020                                                             ;B2F4D0;
    dw ExtendedSpritemaps_PirateNinja_49                                 ;B2F4D2;
    dw $000A                                                             ;B2F4D4;
    dw ExtendedSpritemaps_PirateNinja_4A                                 ;B2F4D6;
    dw $0020                                                             ;B2F4D8;
    dw ExtendedSpritemaps_PirateNinja_4B                                 ;B2F4DA;
    dw $000A                                                             ;B2F4DC;
    dw ExtendedSpritemaps_PirateNinja_4A                                 ;B2F4DE;
    dw $0020                                                             ;B2F4E0;
    dw ExtendedSpritemaps_PirateNinja_49                                 ;B2F4E2;
    dw Instruction_Common_GotoY                                          ;B2F4E4;
    dw InstList_PirateNinja_Initial_FacingRight_1                        ;B2F4E6;
    dw Instruction_Common_Sleep                                          ;B2F4E8;

InstList_PirateNinja_Land_FacingRight_0:
    dw Instruction_PirateNinja_PaletteIndexInY                           ;B2F4EA;
    dw $0200                                                             ;B2F4EC;
    dw Instruction_PirateWall_FunctionInY                                ;B2F4EE;
    dw RTS_A0804B                                                        ;B2F4F0;
    dw $0004                                                             ;B2F4F2;
    dw ExtendedSpritemaps_PirateNinja_4A                                 ;B2F4F4;
    dw $0008                                                             ;B2F4F6;
    dw ExtendedSpritemaps_PirateNinja_49                                 ;B2F4F8;
    dw $0004                                                             ;B2F4FA;
    dw ExtendedSpritemaps_PirateNinja_4C                                 ;B2F4FC;
    dw $0004                                                             ;B2F4FE;
    dw ExtendedSpritemaps_PirateNinja_47                                 ;B2F500;
    dw Instruction_PirateWall_FunctionInY                                ;B2F502;
    dw Function_PirateNinja_ReadingToDivekick                            ;B2F504;

InstList_PirateNinja_Land_FacingRight_1:
    dw $000A                                                             ;B2F506;
    dw ExtendedSpritemaps_PirateNinja_32                                 ;B2F508;
    dw $000A                                                             ;B2F50A;
    dw ExtendedSpritemaps_PirateNinja_33                                 ;B2F50C;
    dw $000A                                                             ;B2F50E;
    dw ExtendedSpritemaps_PirateNinja_34                                 ;B2F510;
    dw $000A                                                             ;B2F512;
    dw ExtendedSpritemaps_PirateNinja_33                                 ;B2F514;
    dw Instruction_Common_GotoY                                          ;B2F516;
    dw InstList_PirateNinja_Land_FacingRight_1                           ;B2F518;

InstList_PirateNinja_StandingKick_FacingRight:
    dw Instruction_PirateWall_FunctionInY                                ;B2F51A;
    dw RTS_A0804B                                                        ;B2F51C;
    dw $0004                                                             ;B2F51E;
    dw ExtendedSpritemaps_PirateNinja_40                                 ;B2F520;
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6                   ;B2F522;
    dw $0066,$0004                                                       ;B2F524;
    dw ExtendedSpritemaps_PirateNinja_45                                 ;B2F528;
    dw $0020                                                             ;B2F52A;
    dw ExtendedSpritemaps_PirateNinja_41                                 ;B2F52C;
    dw $0004                                                             ;B2F52E;
    dw ExtendedSpritemaps_PirateNinja_45                                 ;B2F530;
    dw Instruction_Common_GotoY                                          ;B2F532;
    dw InstList_PirateNinja_Active_FacingRight_0                         ;B2F534;

Instruction_PirateNinja_PaletteIndexInY:
    PHX                                                                  ;B2F536;
    PHY                                                                  ;B2F537;
    LDX.W $0E54                                                          ;B2F538;
    LDA.W $0000,Y                                                        ;B2F53B;
    STA.W EnemyData.palette,X                                            ;B2F53E;
    PLY                                                                  ;B2F541;
    PLX                                                                  ;B2F542;
    INY                                                                  ;B2F543;
    INY                                                                  ;B2F544;
    RTL                                                                  ;B2F545;


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


UNUSED_Instruction_PirateNinja_GotoFunction0FAC_B2F554:
    PHX                                                                  ;B2F554;
    LDX.W $0E54                                                          ;B2F555;
    LDA.W #$0001                                                         ;B2F558;
    STA.W EnemyData.instTimer,X                                          ;B2F55B;
    LDA.W EnemyData.work2,X                                              ;B2F55E;
    TAY                                                                  ;B2F561;
    PLX                                                                  ;B2F562;
    RTL                                                                  ;B2F563;


Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset:
    PHX                                                                  ;B2F564;
    PHY                                                                  ;B2F565;
    LDX.W $0E54                                                          ;B2F566;
    LDA.W $0002,Y                                                        ;B2F569;
    STA.B $16                                                            ;B2F56C;
    LDA.W $0004,Y                                                        ;B2F56E;
    STA.B $18                                                            ;B2F571;
    LDA.W EnemyData.xPosition,X                                          ;B2F573;
    STA.B $12                                                            ;B2F576;
    LDA.W EnemyData.yPosition,X                                          ;B2F578;
    STA.B $14                                                            ;B2F57B;
    LDA.W $0000,Y                                                        ;B2F57D;
    LDY.W #EnemyProjectile_PirateClaw                                    ;B2F580;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;B2F583;
    PLY                                                                  ;B2F587;
    PLX                                                                  ;B2F588;
    INY                                                                  ;B2F589;
    INY                                                                  ;B2F58A;
    INY                                                                  ;B2F58B;
    INY                                                                  ;B2F58C;
    INY                                                                  ;B2F58D;
    INY                                                                  ;B2F58E;
    RTL                                                                  ;B2F58F;


Instruction_PirateNinja_SetFunction0FAC_Active:
    PHX                                                                  ;B2F590;
    LDX.W $0E54                                                          ;B2F591;
    LDA.W EnemyData.xPosition,X                                          ;B2F594;
    SEC                                                                  ;B2F597;
    SBC.W $0AF6                                                          ;B2F598;
    STA.B $12                                                            ;B2F59B;
    LDA.W #$0001                                                         ;B2F59D;
    STA.W EnemyData.instTimer,X                                          ;B2F5A0;
    LDY.W #InstList_PirateNinja_Active_FacingLeft_0                      ;B2F5A3;
    LDA.B $12                                                            ;B2F5A6;
    BPL .keepLeft                                                        ;B2F5A8;
    LDY.W #InstList_PirateNinja_Active_FacingRight_0                     ;B2F5AA;

.keepLeft:
    TYA                                                                  ;B2F5AD;
    STA.W EnemyData.work2,X                                              ;B2F5AE;
    PLX                                                                  ;B2F5B1;
    RTL                                                                  ;B2F5B2;


UNUSED_Instruction_PirateNinja_Set0FAC_StandingKick_B2F5B3:
    PHX                                                                  ;B2F5B3;
    LDX.W $0E54                                                          ;B2F5B4;
    LDA.W EnemyData.xPosition,X                                          ;B2F5B7;
    SEC                                                                  ;B2F5BA;
    SBC.W $0AF6                                                          ;B2F5BB;
    STA.B $12                                                            ;B2F5BE;
    LDA.W #$0001                                                         ;B2F5C0;
    STA.W EnemyData.instTimer,X                                          ;B2F5C3;
    LDY.W #InstList_PirateNinja_StandingKick_FacingLeft                  ;B2F5C6;
    LDA.B $12                                                            ;B2F5C9;
    BPL .keepLeft                                                        ;B2F5CB;
    LDY.W #InstList_PirateNinja_StandingKick_FacingRight                 ;B2F5CD;

.keepLeft:
    TYA                                                                  ;B2F5D0;
    STA.W EnemyData.work2,X                                              ;B2F5D1;
    PLX                                                                  ;B2F5D4;
    RTL                                                                  ;B2F5D5;


Instruction_PirateNinja_ResetSpeed:
    LDA.W #$0000                                                         ;B2F5D6;
    STA.L $7E7800,X                                                      ;B2F5D9;
    RTL                                                                  ;B2F5DD;


InitAI_PirateNinja:
    LDX.W $0E54                                                          ;B2F5DE;
    LDY.W #InstList_PirateNinja_Initial_FacingLeft_0                     ;B2F5E1;
    LDA.W EnemyData.initParam0,X                                         ;B2F5E4;
    BIT.W #$0001                                                         ;B2F5E7;
    BEQ .zeroParam1                                                      ;B2F5EA;
    LDY.W #InstList_PirateNinja_Initial_FacingRight_0                    ;B2F5EC;

.zeroParam1:
    TYA                                                                  ;B2F5EF;
    STA.W EnemyData.pInstList,X                                          ;B2F5F0;
    STA.W EnemyData.work2,X                                              ;B2F5F3;
    LDA.W EnemyData.initParam0,X                                         ;B2F5F6;
    BIT.W #$0001                                                         ;B2F5F9;
    BEQ .zeroParam1again                                                 ;B2F5FC;
    LDA.W EnemyData.xPosition,X                                          ;B2F5FE;
    STA.W EnemyData.work4,X                                              ;B2F601;
    CLC                                                                  ;B2F604;
    ADC.W EnemyData.initParam1,X                                         ;B2F605;
    STA.W EnemyData.work5,X                                              ;B2F608;
    BRA +                                                                ;B2F60B;


.zeroParam1again:
    LDA.W EnemyData.xPosition,X                                          ;B2F60D;
    STA.W EnemyData.work5,X                                              ;B2F610;
    SEC                                                                  ;B2F613;
    SBC.W EnemyData.initParam1,X                                         ;B2F614;
    STA.W EnemyData.work4,X                                              ;B2F617;

  + LDA.W EnemyData.work5,X                                              ;B2F61A;
    SEC                                                                  ;B2F61D;
    SBC.W EnemyData.work4,X                                              ;B2F61E;
    LSR A                                                                ;B2F621;
    STA.B $14                                                            ;B2F622;
    CLC                                                                  ;B2F624;
    ADC.W EnemyData.work4,X                                              ;B2F625;
    STA.W EnemyData.work3,X                                              ;B2F628;
    LDA.W EnemyData.work3,X                                              ;B2F62B; >_<
    STZ.B $12                                                            ;B2F62E;
    STZ.B $16                                                            ;B2F630;
    LDA.B $14                                                            ;B2F632;
    AND.W #$00FF                                                         ;B2F634;
    XBA                                                                  ;B2F637;
    STA.B $14                                                            ;B2F638;

.loop:
    LDA.W #$0020                                                         ;B2F63A;
    CLC                                                                  ;B2F63D;
    ADC.B $12                                                            ;B2F63E;
    STA.B $12                                                            ;B2F640;
    CLC                                                                  ;B2F642;
    ADC.B $16                                                            ;B2F643;
    STA.B $16                                                            ;B2F645;
    CMP.B $14                                                            ;B2F647;
    BMI .loop                                                            ;B2F649;
    LDA.B $12                                                            ;B2F64B;
    STA.W EnemyData.work1,X                                              ;B2F64D;
    LDA.B $16                                                            ;B2F650;
    AND.W #$FF00                                                         ;B2F652;
    XBA                                                                  ;B2F655;
    STA.B $18                                                            ;B2F656;
    CLC                                                                  ;B2F658;
    ADC.W EnemyData.work3,X                                              ;B2F659;
    STA.W EnemyData.work5,X                                              ;B2F65C;
    LDA.W EnemyData.work3,X                                              ;B2F65F;
    SEC                                                                  ;B2F662;
    SBC.B $18                                                            ;B2F663;
    STA.W EnemyData.work4,X                                              ;B2F665;
    LDY.W EnemyData.work4,X                                              ;B2F668;
    LDA.W EnemyData.initParam0,X                                         ;B2F66B;
    BIT.W #$0001                                                         ;B2F66E;
    BNE .zeroParam1again2                                                ;B2F671;
    LDY.W EnemyData.work5,X                                              ;B2F673;

.zeroParam1again2:
    TYA                                                                  ;B2F676;
    STA.W EnemyData.xPosition,X                                          ;B2F677;
    LDA.W #RTS_B2804B                                                    ;B2F67A;
    STA.W EnemyData.work0,X                                              ;B2F67D;
    LDA.W EnemyData.yPosition,X                                          ;B2F680;
    STA.L $7E7810,X                                                      ;B2F683;
    LDY.W #$0000                                                         ;B2F687;
    LDX.W #$0000                                                         ;B2F68A;
    LDA.W #$000F                                                         ;B2F68D;
    STA.B $12                                                            ;B2F690;

.loopPalette:
    LDA.W Palette_Pirate_Gold_NonNinja,Y                                 ;B2F692;
    STA.L $7EC3E0,X                                                      ;B2F695;
    INY                                                                  ;B2F699;
    INY                                                                  ;B2F69A;
    INX                                                                  ;B2F69B;
    INX                                                                  ;B2F69C;
    DEC.B $12                                                            ;B2F69D;
    BPL .loopPalette                                                     ;B2F69F;
    RTL                                                                  ;B2F6A1;


MainAI_PirateNinja:
    LDX.W $0E54                                                          ;B2F6A2;
    JSR.W ($0FA8,X)                                                      ;B2F6A5;
    RTL                                                                  ;B2F6A8;


Function_PirateNinja_Initial:
    LDX.W $0E54                                                          ;B2F6A9;
    LDA.W EnemyData.xPosition,X                                          ;B2F6AC;
    SEC                                                                  ;B2F6AF;
    SBC.W $0AF6                                                          ;B2F6B0;
    BPL +                                                                ;B2F6B3;
    EOR.W #$FFFF                                                         ;B2F6B5;
    INC A                                                                ;B2F6B8;

  + SEC                                                                  ;B2F6B9;
    SBC.W #$0080                                                         ;B2F6BA;
    BPL .tooFar                                                          ;B2F6BD;
    LDA.W EnemyData.xPosition,X                                          ;B2F6BF;
    SEC                                                                  ;B2F6C2;
    SBC.W $0AF6                                                          ;B2F6C3;
    STA.B $12                                                            ;B2F6C6;
    LDY.W #InstList_PirateNinja_Active_FacingLeft_0                      ;B2F6C8;
    LDA.B $12                                                            ;B2F6CB;
    BPL .keepLeft                                                        ;B2F6CD;
    LDY.W #InstList_PirateNinja_Active_FacingRight_0                     ;B2F6CF;

.keepLeft:
    TYA                                                                  ;B2F6D2;
    STA.W EnemyData.pInstList,X                                          ;B2F6D3;
    STA.W EnemyData.work2,X                                              ;B2F6D6;
    LDA.W #$0001                                                         ;B2F6D9;
    STA.W EnemyData.instTimer,X                                          ;B2F6DC;
    RTS                                                                  ;B2F6DF;


.tooFar:
    JSR.W PirateNinja_FlinchTrigger                                      ;B2F6E0;
    RTS                                                                  ;B2F6E3;


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


PirateNinja_ProjectileClawAttackTrigger:
    LDA.W EnemyData.frameCounter,X                                       ;B2F6F7;
    AND.W #$003F                                                         ;B2F6FA;
    BNE .return                                                          ;B2F6FD;
    LDA.W EnemyData.xPosition,X                                          ;B2F6FF;
    CMP.W EnemyData.work4,X                                              ;B2F702;
    BEQ .reachedLeftPost                                                 ;B2F705;
    LDA.W EnemyData.xPosition,X                                          ;B2F707;
    SEC                                                                  ;B2F70A;
    SBC.W $0AF6                                                          ;B2F70B;
    BPL .return                                                          ;B2F70E;
    LDA.W #InstList_PirateNinja_ProjectileClawAttack_Right               ;B2F710;
    STA.W EnemyData.pInstList,X                                          ;B2F713;
    BRA .set1Timer                                                       ;B2F716;


.reachedLeftPost:
    LDA.W EnemyData.xPosition,X                                          ;B2F718;
    SEC                                                                  ;B2F71B;
    SBC.W $0AF6                                                          ;B2F71C;
    BMI .return                                                          ;B2F71F;
    LDA.W #InstList_PirateNinja_ProjectileClawAttack_Left                ;B2F721;
    STA.W EnemyData.pInstList,X                                          ;B2F724;

.set1Timer:
    LDA.W #$0001                                                         ;B2F727;
    STA.W EnemyData.instTimer,X                                          ;B2F72A;

.return:
    RTS                                                                  ;B2F72D;


PirateNinja_FlinchTrigger:
    PHX                                                                  ;B2F72E;
    LDX.W $0E54                                                          ;B2F72F;
    LDY.W #$0008                                                         ;B2F732;

.loop:
    LDA.W $0C18,Y                                                        ;B2F735;
    BNE .checkProjectile                                                 ;B2F738;
    DEY                                                                  ;B2F73A;
    DEY                                                                  ;B2F73B;
    BPL .loop                                                            ;B2F73C;
    BRA .returnNoFlinch                                                  ;B2F73E;


.checkProjectile:
    LDA.W $0B64,Y                                                        ;B2F740;
    SEC                                                                  ;B2F743;
    SBC.W EnemyData.xPosition,X                                          ;B2F744;
    BPL +                                                                ;B2F747;
    EOR.W #$FFFF                                                         ;B2F749;
    INC A                                                                ;B2F74C;

  + SEC                                                                  ;B2F74D;
    SBC.W #$0020                                                         ;B2F74E;
    BPL .returnNoFlinch                                                  ;B2F751;
    LDA.W $0B78,Y                                                        ;B2F753;
    SEC                                                                  ;B2F756;
    SBC.W EnemyData.yPosition,X                                          ;B2F757;
    BPL +                                                                ;B2F75A;
    EOR.W #$FFFF                                                         ;B2F75C;
    INC A                                                                ;B2F75F;

  + SEC                                                                  ;B2F760;
    SBC.W #$0020                                                         ;B2F761;
    BPL .returnNoFlinch                                                  ;B2F764;
    LDA.W EnemyData.xPosition,X                                          ;B2F766;
    SEC                                                                  ;B2F769;
    SBC.W $0AF6                                                          ;B2F76A;
    STA.B $12                                                            ;B2F76D;
    LDY.W #InstList_PirateNinja_Flinch_FacingLeft                        ;B2F76F;
    LDA.B $12                                                            ;B2F772;
    BPL .keepLeft                                                        ;B2F774;
    LDY.W #InstList_PirateNinja_Flinch_FacingRight                       ;B2F776;

.keepLeft:
    TYA                                                                  ;B2F779;
    STA.W EnemyData.pInstList,X                                          ;B2F77A;
    LDA.W #$0001                                                         ;B2F77D;
    STA.W EnemyData.instTimer,X                                          ;B2F780;
    PLX                                                                  ;B2F783;
    LDA.W #$0001                                                         ;B2F784;
    RTS                                                                  ;B2F787;


.returnNoFlinch:
    PLX                                                                  ;B2F788;
    LDA.W #$0000                                                         ;B2F789;
    RTS                                                                  ;B2F78C;


PirateNinja_SpinJumpTrigger:
    PHX                                                                  ;B2F78D;
    LDX.W $0E54                                                          ;B2F78E;
    LDA.W EnemyData.work3,X                                              ;B2F791;
    SEC                                                                  ;B2F794;
    SBC.W $0AF6                                                          ;B2F795;
    BPL +                                                                ;B2F798;
    EOR.W #$FFFF                                                         ;B2F79A;
    INC A                                                                ;B2F79D;

  + SEC                                                                  ;B2F79E;
    SBC.W #$0020                                                         ;B2F79F;
    BPL .returnNoSpinJump                                                ;B2F7A2;
    LDY.W #InstList_PirateNinja_SpinJumpLeft_0                           ;B2F7A4;
    LDA.W EnemyData.xPosition,X                                          ;B2F7A7;
    CMP.W EnemyData.work4,X                                              ;B2F7AA;
    BNE .keepLeft                                                        ;B2F7AD;
    LDY.W #InstList_PirateNinja_SpinJumpRight_0                          ;B2F7AF;

.keepLeft:
    TYA                                                                  ;B2F7B2;
    STA.W EnemyData.pInstList,X                                          ;B2F7B3;
    LDA.W #$0001                                                         ;B2F7B6;
    STA.W EnemyData.instTimer,X                                          ;B2F7B9;
    PLX                                                                  ;B2F7BC;
    LDA.W #$0001                                                         ;B2F7BD;
    RTS                                                                  ;B2F7C0;


.returnNoSpinJump:
    PLX                                                                  ;B2F7C1;
    LDA.W #$0000                                                         ;B2F7C2;
    RTS                                                                  ;B2F7C5;


PirateNinja_StandingKickTrigger:
    PHX                                                                  ;B2F7C6;
    LDX.W $0E54                                                          ;B2F7C7;
    LDA.W $0AF6                                                          ;B2F7CA;
    SEC                                                                  ;B2F7CD;
    SBC.W EnemyData.xPosition,X                                          ;B2F7CE;
    BPL +                                                                ;B2F7D1;
    EOR.W #$FFFF                                                         ;B2F7D3;
    INC A                                                                ;B2F7D6;

  + SEC                                                                  ;B2F7D7;
    SBC.W #$0028                                                         ;B2F7D8;
    BPL .returnNoStandingKick                                            ;B2F7DB;
    LDA.W $0AFA                                                          ;B2F7DD;
    SEC                                                                  ;B2F7E0;
    SBC.W EnemyData.yPosition,X                                          ;B2F7E1;
    BPL +                                                                ;B2F7E4;
    EOR.W #$FFFF                                                         ;B2F7E6;
    INC A                                                                ;B2F7E9;

  + SEC                                                                  ;B2F7EA;
    SBC.W #$0028                                                         ;B2F7EB;
    BPL .returnNoStandingKick                                            ;B2F7EE;
    LDA.W EnemyData.xPosition,X                                          ;B2F7F0;
    SEC                                                                  ;B2F7F3;
    SBC.W $0AF6                                                          ;B2F7F4;
    STA.B $12                                                            ;B2F7F7;
    LDY.W #InstList_PirateNinja_StandingKick_FacingLeft                  ;B2F7F9;
    LDA.B $12                                                            ;B2F7FC;
    BPL .kepLeft                                                         ;B2F7FE;
    LDY.W #InstList_PirateNinja_StandingKick_FacingRight                 ;B2F800;

.kepLeft:
    TYA                                                                  ;B2F803;
    STA.W EnemyData.pInstList,X                                          ;B2F804;
    LDA.W #$0001                                                         ;B2F807;
    STA.W EnemyData.instTimer,X                                          ;B2F80A;
    PLX                                                                  ;B2F80D;
    LDA.W #$0001                                                         ;B2F80E;
    RTS                                                                  ;B2F811;


.returnNoStandingKick:
    PLX                                                                  ;B2F812;
    LDA.W #$0000                                                         ;B2F813;
    RTS                                                                  ;B2F816;


Function_PirateNinja_SpinJumpleft_Rising:
    LDA.L $7E7800,X                                                      ;B2F817;
    AND.W #$FF00                                                         ;B2F81B;
    XBA                                                                  ;B2F81E;
    STA.B $12                                                            ;B2F81F;
    LDA.W EnemyData.xPosition,X                                          ;B2F821;
    SEC                                                                  ;B2F824;
    SBC.B $12                                                            ;B2F825;
    STA.W EnemyData.xPosition,X                                          ;B2F827;
    DEC.W EnemyData.yPosition,X                                          ;B2F82A;
    DEC.W EnemyData.yPosition,X                                          ;B2F82D;
    LDA.L $7E7800,X                                                      ;B2F830;
    CLC                                                                  ;B2F834;
    ADC.W #$0020                                                         ;B2F835;
    STA.L $7E7800,X                                                      ;B2F838;
    LDA.W EnemyData.xPosition,X                                          ;B2F83C;
    CMP.W EnemyData.work3,X                                              ;B2F83F;
    BMI .falling                                                         ;B2F842;
    RTS                                                                  ;B2F844;


.falling:
    LDA.W #Function_PirateNinja_SpinJumpLeft_Falling                     ;B2F845;
    STA.W EnemyData.work0,X                                              ;B2F848;
    RTS                                                                  ;B2F84B;


Function_PirateNinja_SpinJumpLeft_Falling:
    LDA.L $7E7800,X                                                      ;B2F84C;
    AND.W #$FF00                                                         ;B2F850;
    XBA                                                                  ;B2F853;
    STA.B $12                                                            ;B2F854;
    LDA.W EnemyData.xPosition,X                                          ;B2F856;
    SEC                                                                  ;B2F859;
    SBC.B $12                                                            ;B2F85A;
    STA.W EnemyData.xPosition,X                                          ;B2F85C;
    INC.W EnemyData.yPosition,X                                          ;B2F85F;
    INC.W EnemyData.yPosition,X                                          ;B2F862;
    LDA.L $7E7800,X                                                      ;B2F865;
    SEC                                                                  ;B2F869;
    SBC.W #$0020                                                         ;B2F86A;
    STA.L $7E7800,X                                                      ;B2F86D;
    BEQ .landing                                                         ;B2F871;
    RTS                                                                  ;B2F873;


.landing:
    LDA.W #RTS_B2804B                                                    ;B2F874;
    STA.W EnemyData.work0,X                                              ;B2F877;
    LDA.W #InstList_PirateNinja_Land_FacingLeft_0                        ;B2F87A;
    STA.W EnemyData.pInstList,X                                          ;B2F87D;
    LDA.W #$0001                                                         ;B2F880;
    STA.W EnemyData.instTimer,X                                          ;B2F883;
    LDA.W EnemyData.work4,X                                              ;B2F886;
    STA.W EnemyData.xPosition,X                                          ;B2F889;
    JSR.W PirateNinja_SpawnLandingDustCloud                              ;B2F88C;
    RTS                                                                  ;B2F88F;


Function_PirateNinja_SpinJumpRight_Rising:
    LDA.L $7E7800,X                                                      ;B2F890;
    AND.W #$FF00                                                         ;B2F894;
    XBA                                                                  ;B2F897;
    STA.B $12                                                            ;B2F898;
    LDA.W EnemyData.xPosition,X                                          ;B2F89A;
    CLC                                                                  ;B2F89D;
    ADC.B $12                                                            ;B2F89E;
    STA.W EnemyData.xPosition,X                                          ;B2F8A0;
    DEC.W EnemyData.yPosition,X                                          ;B2F8A3;
    DEC.W EnemyData.yPosition,X                                          ;B2F8A6;
    LDA.L $7E7800,X                                                      ;B2F8A9;
    CLC                                                                  ;B2F8AD;
    ADC.W #$0020                                                         ;B2F8AE;
    STA.L $7E7800,X                                                      ;B2F8B1;
    LDA.W EnemyData.xPosition,X                                          ;B2F8B5;
    CMP.W EnemyData.work3,X                                              ;B2F8B8;
    BPL .falling                                                         ;B2F8BB;
    RTS                                                                  ;B2F8BD;


.falling:
    LDA.W #Function_PirateNinja_SpinJumpRight_Falling                    ;B2F8BE;
    STA.W EnemyData.work0,X                                              ;B2F8C1;
    RTS                                                                  ;B2F8C4;


Function_PirateNinja_SpinJumpRight_Falling:
    LDA.L $7E7800,X                                                      ;B2F8C5;
    AND.W #$FF00                                                         ;B2F8C9;
    XBA                                                                  ;B2F8CC;
    STA.B $12                                                            ;B2F8CD;
    LDA.W EnemyData.xPosition,X                                          ;B2F8CF;
    CLC                                                                  ;B2F8D2;
    ADC.B $12                                                            ;B2F8D3;
    STA.W EnemyData.xPosition,X                                          ;B2F8D5;
    INC.W EnemyData.yPosition,X                                          ;B2F8D8;
    INC.W EnemyData.yPosition,X                                          ;B2F8DB;
    LDA.L $7E7800,X                                                      ;B2F8DE;
    SEC                                                                  ;B2F8E2;
    SBC.W #$0020                                                         ;B2F8E3;
    STA.L $7E7800,X                                                      ;B2F8E6;
    BEQ .landing                                                         ;B2F8EA;
    RTS                                                                  ;B2F8EC;


.landing:
    LDA.W #RTS_B2804B                                                    ;B2F8ED;
    STA.W EnemyData.work0,X                                              ;B2F8F0;
    LDA.W #InstList_PirateNinja_Land_FacingRight_0                       ;B2F8F3;
    STA.W EnemyData.pInstList,X                                          ;B2F8F6;
    LDA.W #$0001                                                         ;B2F8F9;
    STA.W EnemyData.instTimer,X                                          ;B2F8FC;
    LDA.W EnemyData.work5,X                                              ;B2F8FF;
    STA.W EnemyData.xPosition,X                                          ;B2F902;
    JSR.W PirateNinja_SpawnLandingDustCloud                              ;B2F905;
    RTS                                                                  ;B2F908;


Function_PirateNinja_ReadingToDivekick:
    JSR.W PirateNinja_FlinchTrigger                                      ;B2F909;
    BNE .return                                                          ;B2F90C;
    JSR.W PirateNinja_StandingKickTrigger                                ;B2F90E;
    BNE .return                                                          ;B2F911;
    JSR.W PirateNinja_DivekickTrigger                                    ;B2F913;

.return:
    RTS                                                                  ;B2F916;


PirateNinja_DivekickTrigger:
    LDX.W $0E54                                                          ;B2F917;
    LDA.W EnemyData.work3,X                                              ;B2F91A;
    SEC                                                                  ;B2F91D;
    SBC.W $0AF6                                                          ;B2F91E;
    BPL +                                                                ;B2F921;
    EOR.W #$FFFF                                                         ;B2F923;
    INC A                                                                ;B2F926;

  + SEC                                                                  ;B2F927;
    SBC.W #$0020                                                         ;B2F928;
    BPL .return                                                          ;B2F92B;

.loopRNG:
    JSL.L GenerateRandomNumber                                           ;B2F92D;
    AND.W #$0003                                                         ;B2F931;
    BEQ .loopRNG                                                         ;B2F934;
    STA.B $12                                                            ;B2F936;
    LDY.W #$0000                                                         ;B2F938;
    LDA.W EnemyData.xPosition,X                                          ;B2F93B;
    CMP.W EnemyData.work4,X                                              ;B2F93E;
    BNE .keepLeft                                                        ;B2F941;
    LDY.W #$0004                                                         ;B2F943;

.keepLeft:
    TYA                                                                  ;B2F946;
    CLC                                                                  ;B2F947;
    ADC.B $12                                                            ;B2F948;
    ASL A                                                                ;B2F94A;
    TAY                                                                  ;B2F94B;
    LDA.W .leftPointers,Y                                                ;B2F94C;
    STA.W EnemyData.pInstList,X                                          ;B2F94F;
    LDA.W #$0001                                                         ;B2F952;
    STA.W EnemyData.instTimer,X                                          ;B2F955;

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

Instruction_PirateNinja_SetLeftDivekickJumpInitialYSpeed:
    PHX                                                                  ;B2F969;
    PHY                                                                  ;B2F96A;
    LDA.W #$0600                                                         ;B2F96B;
    STA.L $7E7800,X                                                      ;B2F96E;
    LDA.W EnemyData.work5,X                                              ;B2F972;
    SEC                                                                  ;B2F975;
    SBC.W EnemyData.work3,X                                              ;B2F976;
    LSR A                                                                ;B2F979;
    CLC                                                                  ;B2F97A;
    ADC.W EnemyData.work3,X                                              ;B2F97B;
    STA.L $7E7806,X                                                      ;B2F97E;
    PLY                                                                  ;B2F982;
    PLX                                                                  ;B2F983;
    RTL                                                                  ;B2F984;


Instruction_PirateNinja_DivekickLeft_Jump:
    LDA.L $7E7800,X                                                      ;B2F985;
    AND.W #$FF00                                                         ;B2F989;
    XBA                                                                  ;B2F98C;
    STA.B $12                                                            ;B2F98D;
    LDA.W EnemyData.yPosition,X                                          ;B2F98F;
    SEC                                                                  ;B2F992;
    SBC.B $12                                                            ;B2F993;
    STA.W EnemyData.yPosition,X                                          ;B2F995;
    LDA.L $7E7800,X                                                      ;B2F998;
    SEC                                                                  ;B2F99C;
    SBC.W #$0040                                                         ;B2F99D;
    STA.L $7E7800,X                                                      ;B2F9A0;
    BMI .negativeSpeed                                                   ;B2F9A4;
    RTS                                                                  ;B2F9A6;


.negativeSpeed:
    LDA.W #Instruction_PirateNinja_DivekickLeft_Divekick                 ;B2F9A7;
    STA.W EnemyData.work0,X                                              ;B2F9AA;
    LDA.W #InstList_PirateNinja_DivekickLeft_Divekick                    ;B2F9AD;
    STA.W EnemyData.pInstList,X                                          ;B2F9B0;
    LDA.W #$0001                                                         ;B2F9B3;
    STA.W EnemyData.instTimer,X                                          ;B2F9B6;
    LDA.W #$0600                                                         ;B2F9B9;
    STA.L $7E7800,X                                                      ;B2F9BC;
    RTS                                                                  ;B2F9C0;


Instruction_PirateNinja_DivekickLeft_Divekick:
    LDA.W EnemyData.xPosition,X                                          ;B2F9C1;
    SEC                                                                  ;B2F9C4;
    SBC.W #$0005                                                         ;B2F9C5;
    STA.W EnemyData.xPosition,X                                          ;B2F9C8;
    LDA.L $7E7800,X                                                      ;B2F9CB;
    AND.W #$FF00                                                         ;B2F9CF;
    XBA                                                                  ;B2F9D2;
    STA.B $14                                                            ;B2F9D3;
    LDA.L $7E7800,X                                                      ;B2F9D5;
    AND.W #$00FF                                                         ;B2F9D9;
    STA.B $12                                                            ;B2F9DC;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2F9DE;
    BCS .collision                                                       ;B2F9E2;
    LDA.L $7E7800,X                                                      ;B2F9E4;
    SEC                                                                  ;B2F9E8;
    SBC.W #$0040                                                         ;B2F9E9;
    STA.L $7E7800,X                                                      ;B2F9EC;
    BMI .collision                                                       ;B2F9F0;
    BIT.W #$FF00                                                         ;B2F9F2;
    BEQ .collision                                                       ;B2F9F5;
    RTS                                                                  ;B2F9F7;


.collision:
    LDA.W #Instruction_PirateNinja_DivekickLeft_WalkToLeftPost           ;B2F9F8;
    STA.W EnemyData.work0,X                                              ;B2F9FB;
    LDA.W #InstList_PirateNinja_DivekickLeft_WalkToLeftPost_0            ;B2F9FE;
    STA.W EnemyData.pInstList,X                                          ;B2FA01;
    LDA.W #$0001                                                         ;B2FA04;
    STA.W EnemyData.instTimer,X                                          ;B2FA07;
    LDA.L $7E7810,X                                                      ;B2FA0A;
    STA.W EnemyData.yPosition,X                                          ;B2FA0E;
    JSR.W PirateNinja_SpawnLandingDustCloud                              ;B2FA11;
    RTS                                                                  ;B2FA14;


Instruction_PirateNinja_DivekickLeft_WalkToLeftPost:
    LDA.W EnemyData.xPosition,X                                          ;B2FA15;
    CLC                                                                  ;B2FA18;
    ADC.W #$FFFE                                                         ;B2FA19;
    STA.W EnemyData.xPosition,X                                          ;B2FA1C;
    CMP.W EnemyData.work4,X                                              ;B2FA1F;
    BPL .return                                                          ;B2FA22;
    LDA.W EnemyData.work4,X                                              ;B2FA24;
    STA.W EnemyData.xPosition,X                                          ;B2FA27;
    LDA.W #InstList_PirateNinja_Land_FacingLeft_0                        ;B2FA2A;
    STA.W EnemyData.pInstList,X                                          ;B2FA2D;
    LDA.W #$0001                                                         ;B2FA30;
    STA.W EnemyData.instTimer,X                                          ;B2FA33;
    LDA.W #RTS_B2804B                                                    ;B2FA36;
    STA.W EnemyData.work0,X                                              ;B2FA39;

.return:
    RTS                                                                  ;B2FA3C;


Instruction_PirateNinja_SetRightDivekickJumpInitialYSpeed:
    PHX                                                                  ;B2FA3D;
    PHY                                                                  ;B2FA3E;
    LDA.W #$0600                                                         ;B2FA3F;
    STA.L $7E7800,X                                                      ;B2FA42;
    LDA.W EnemyData.work3,X                                              ;B2FA46;
    SEC                                                                  ;B2FA49;
    SBC.W EnemyData.work4,X                                              ;B2FA4A;
    LSR A                                                                ;B2FA4D;
    CLC                                                                  ;B2FA4E;
    ADC.W EnemyData.work4,X                                              ;B2FA4F;
    STA.L $7E7806,X                                                      ;B2FA52;
    PLY                                                                  ;B2FA56;
    PLX                                                                  ;B2FA57;
    RTL                                                                  ;B2FA58;


Instruction_PirateNinja_DivekickRight_Jump:
    LDA.L $7E7800,X                                                      ;B2FA59;
    AND.W #$FF00                                                         ;B2FA5D;
    XBA                                                                  ;B2FA60;
    STA.B $12                                                            ;B2FA61;
    LDA.W EnemyData.yPosition,X                                          ;B2FA63;
    SEC                                                                  ;B2FA66;
    SBC.B $12                                                            ;B2FA67;
    STA.W EnemyData.yPosition,X                                          ;B2FA69;
    LDA.L $7E7800,X                                                      ;B2FA6C;
    SEC                                                                  ;B2FA70;
    SBC.W #$0040                                                         ;B2FA71;
    STA.L $7E7800,X                                                      ;B2FA74;
    BMI .negativeSpeed                                                   ;B2FA78;
    RTS                                                                  ;B2FA7A;


.negativeSpeed:
    LDA.W #Instruction_PirateNinja_DivekickRight_Divekick                ;B2FA7B;
    STA.W EnemyData.work0,X                                              ;B2FA7E;
    LDA.W #InstList_PirateNinja_DivekickRight_Divekick                   ;B2FA81;
    STA.W EnemyData.pInstList,X                                          ;B2FA84;
    LDA.W #$0001                                                         ;B2FA87;
    STA.W EnemyData.instTimer,X                                          ;B2FA8A;
    LDA.W #$0600                                                         ;B2FA8D;
    STA.L $7E7800,X                                                      ;B2FA90;
    RTS                                                                  ;B2FA94;


Instruction_PirateNinja_DivekickRight_Divekick:
    LDA.W EnemyData.xPosition,X                                          ;B2FA95;
    CLC                                                                  ;B2FA98;
    ADC.W #$0005                                                         ;B2FA99;
    STA.W EnemyData.xPosition,X                                          ;B2FA9C;
    LDA.L $7E7800,X                                                      ;B2FA9F;
    AND.W #$FF00                                                         ;B2FAA3;
    XBA                                                                  ;B2FAA6;
    STA.B $14                                                            ;B2FAA7;
    LDA.L $7E7800,X                                                      ;B2FAA9;
    AND.W #$00FF                                                         ;B2FAAD;
    STA.B $12                                                            ;B2FAB0;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FAB2;
    BCS .landing                                                         ;B2FAB6;
    LDA.L $7E7800,X                                                      ;B2FAB8;
    SEC                                                                  ;B2FABC;
    SBC.W #$0040                                                         ;B2FABD;
    STA.L $7E7800,X                                                      ;B2FAC0;
    BMI .landing                                                         ;B2FAC4;
    BIT.W #$FF00                                                         ;B2FAC6;
    BEQ .landing                                                         ;B2FAC9;
    RTS                                                                  ;B2FACB;


.landing:
    LDA.W #Instruction_PirateNinja_DivekickRight_WalkToRightPost         ;B2FACC;
    STA.W EnemyData.work0,X                                              ;B2FACF;
    LDA.W #InstList_PirateNinja_DivekickRight_WalkToRightPost_0          ;B2FAD2;
    STA.W EnemyData.pInstList,X                                          ;B2FAD5;
    LDA.W #$0001                                                         ;B2FAD8;
    STA.W EnemyData.instTimer,X                                          ;B2FADB;
    LDA.L $7E7810,X                                                      ;B2FADE;
    STA.W EnemyData.yPosition,X                                          ;B2FAE2;
    JSR.W PirateNinja_SpawnLandingDustCloud                              ;B2FAE5;
    RTS                                                                  ;B2FAE8;


Instruction_PirateNinja_DivekickRight_WalkToRightPost:
    LDA.W EnemyData.xPosition,X                                          ;B2FAE9;
    CLC                                                                  ;B2FAEC;
    ADC.W #$0002                                                         ;B2FAED;
    STA.W EnemyData.xPosition,X                                          ;B2FAF0;
    CMP.W EnemyData.work5,X                                              ;B2FAF3;
    BMI .return                                                          ;B2FAF6;
    LDA.W EnemyData.work5,X                                              ;B2FAF8;
    STA.W EnemyData.xPosition,X                                          ;B2FAFB;
    LDA.W #InstList_PirateNinja_Land_FacingRight_0                       ;B2FAFE;
    STA.W EnemyData.pInstList,X                                          ;B2FB01;
    LDA.W #$0001                                                         ;B2FB04;
    STA.W EnemyData.instTimer,X                                          ;B2FB07;
    LDA.W #RTS_B2804B                                                    ;B2FB0A;
    STA.W EnemyData.work0,X                                              ;B2FB0D;

.return:
    RTS                                                                  ;B2FB10;


PirateNinja_SpawnLandingDustCloud:
    LDA.W EnemyData.xPosition,X                                          ;B2FB11;
    SEC                                                                  ;B2FB14;
    SBC.W #$0008                                                         ;B2FB15;
    STA.B $12                                                            ;B2FB18;
    LDA.W EnemyData.yPosition,X                                          ;B2FB1A;
    CLC                                                                  ;B2FB1D;
    ADC.W #$001C                                                         ;B2FB1E;
    STA.B $14                                                            ;B2FB21;
    LDA.W #$000A                                                         ;B2FB23;
    STA.B $16                                                            ;B2FB26;
    STZ.B $18                                                            ;B2FB28;
    JSL.L Create_Sprite_Object                                           ;B2FB2A;
    LDA.W EnemyData.xPosition,X                                          ;B2FB2E;
    CLC                                                                  ;B2FB31;
    ADC.W #$0008                                                         ;B2FB32;
    STA.B $12                                                            ;B2FB35;
    LDA.W EnemyData.yPosition,X                                          ;B2FB37;
    CLC                                                                  ;B2FB3A;
    ADC.W #$001C                                                         ;B2FB3B;
    STA.B $14                                                            ;B2FB3E;
    LDA.W #$000A                                                         ;B2FB40;
    STA.B $16                                                            ;B2FB43;
    STZ.B $18                                                            ;B2FB45;
    JSL.L Create_Sprite_Object                                           ;B2FB47;
    RTS                                                                  ;B2FB4B;


InstList_PirateWalking_Flinch_FacingLeft:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FB4C;
    dw RTS_A0804B                                                        ;B2FB4E;
    dw $0010                                                             ;B2FB50;
    dw ExtendedSpritemaps_PirateWalking_23                               ;B2FB52;
    dw Instruction_Common_GotoY                                          ;B2FB54;
    dw InstList_PirateWalking_WalkingLeft_0                              ;B2FB56;

InstList_PirateWalking_Flinch_FacingRight:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FB58;
    dw RTS_A0804B                                                        ;B2FB5A;
    dw $0010                                                             ;B2FB5C;
    dw ExtendedSpritemaps_PirateWalking_24                               ;B2FB5E;
    dw Instruction_Common_GotoY                                          ;B2FB60;
    dw InstList_PirateWalking_WalkingRight_0                             ;B2FB62;

InstList_PirateWalking_WalkingLeft_0:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FB64;
    dw Function_PirateWalking_WalkingLeft                                ;B2FB66;

InstList_PirateWalking_WalkingLeft_1:
    dw $000A                                                             ;B2FB68;
    dw ExtendedSpritemaps_PirateWalking_0                                ;B2FB6A;
    dw $000A                                                             ;B2FB6C;
    dw ExtendedSpritemaps_PirateWalking_1                                ;B2FB6E;
    dw $000A                                                             ;B2FB70;
    dw ExtendedSpritemaps_PirateWalking_2                                ;B2FB72;
    dw $000A                                                             ;B2FB74;
    dw ExtendedSpritemaps_PirateWalking_3                                ;B2FB76;
    dw $000A                                                             ;B2FB78;
    dw ExtendedSpritemaps_PirateWalking_4                                ;B2FB7A;
    dw $000A                                                             ;B2FB7C;
    dw ExtendedSpritemaps_PirateWalking_5                                ;B2FB7E;
    dw $000A                                                             ;B2FB80;
    dw ExtendedSpritemaps_PirateWalking_6                                ;B2FB82;
    dw $000A                                                             ;B2FB84;
    dw ExtendedSpritemaps_PirateWalking_7                                ;B2FB86;
    dw Instruction_Common_GotoY                                          ;B2FB88;
    dw InstList_PirateWalking_WalkingLeft_1                              ;B2FB8A;

InstList_PirateWalking_FireLasersLeft:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FB8C;
    dw RTS_B2FE4A                                                        ;B2FB8E;
    dw $0018                                                             ;B2FB90;
    dw ExtendedSpritemaps_PirateWalking_10                               ;B2FB92;
    dw $0008                                                             ;B2FB94;
    dw ExtendedSpritemaps_PirateWalking_11                               ;B2FB96;
    dw $0008                                                             ;B2FB98;
    dw ExtendedSpritemaps_PirateWalking_12                               ;B2FB9A;
    dw $0008                                                             ;B2FB9C;
    dw ExtendedSpritemaps_PirateWalking_13                               ;B2FB9E;
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY             ;B2FBA0;
    dw $0008,$0008                                                       ;B2FBA2;
    dw ExtendedSpritemaps_PirateWalking_14                               ;B2FBA6;
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY             ;B2FBA8;
    dw $0002,$0018                                                       ;B2FBAA;
    dw ExtendedSpritemaps_PirateWalking_15                               ;B2FBAE;
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY             ;B2FBB0;
    dw $FFF8,$0008                                                       ;B2FBB2;
    dw ExtendedSpritemaps_PirateWalking_14                               ;B2FBB6;
    dw $0008                                                             ;B2FBB8;
    dw ExtendedSpritemaps_PirateWalking_13                               ;B2FBBA;
    dw $0008                                                             ;B2FBBC;
    dw ExtendedSpritemaps_PirateWalking_12                               ;B2FBBE;
    dw $0008                                                             ;B2FBC0;
    dw ExtendedSpritemaps_PirateWalking_11                               ;B2FBC2;
    dw Instruction_PirateWalking_ChooseAMovement                         ;B2FBC4;

InstList_PirateWalking_LookingAround_FacingLeft:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FBC6;
    dw RTS_B2FE4A                                                        ;B2FBC8;
    dw $0020                                                             ;B2FBCA;
    dw ExtendedSpritemaps_PirateWalking_1C                               ;B2FBCC;
    dw $000A                                                             ;B2FBCE;
    dw ExtendedSpritemaps_PirateWalking_1D                               ;B2FBD0;
    dw $0020                                                             ;B2FBD2;
    dw ExtendedSpritemaps_PirateWalking_1E                               ;B2FBD4;
    dw $000A                                                             ;B2FBD6;
    dw ExtendedSpritemaps_PirateWalking_1D                               ;B2FBD8;
    dw $0020                                                             ;B2FBDA;
    dw ExtendedSpritemaps_PirateWalking_1C                               ;B2FBDC;
    dw $0008                                                             ;B2FBDE;
    dw ExtendedSpritemaps_PirateWalking_22                               ;B2FBE0;
    dw Instruction_Common_GotoY                                          ;B2FBE2;
    dw InstList_PirateWalking_WalkingRight_0                             ;B2FBE4;

InstList_PirateWalking_WalkingRight_0:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FBE6;
    dw Function_PirateWalking_WalkingRight                               ;B2FBE8;

InstList_PirateWalking_WalkingRight_1:
    dw $000A                                                             ;B2FBEA;
    dw ExtendedSpritemaps_PirateWalking_8                                ;B2FBEC;
    dw $000A                                                             ;B2FBEE;
    dw ExtendedSpritemaps_PirateWalking_9                                ;B2FBF0;
    dw $000A                                                             ;B2FBF2;
    dw ExtendedSpritemaps_PirateWalking_A                                ;B2FBF4;
    dw $000A                                                             ;B2FBF6;
    dw ExtendedSpritemaps_PirateWalking_B                                ;B2FBF8;
    dw $000A                                                             ;B2FBFA;
    dw ExtendedSpritemaps_PirateWalking_C                                ;B2FBFC;
    dw $000A                                                             ;B2FBFE;
    dw ExtendedSpritemaps_PirateWalking_D                                ;B2FC00;
    dw $000A                                                             ;B2FC02;
    dw ExtendedSpritemaps_PirateWalking_E                                ;B2FC04;
    dw $000A                                                             ;B2FC06;
    dw ExtendedSpritemaps_PirateWalking_F                                ;B2FC08;
    dw Instruction_Common_GotoY                                          ;B2FC0A;
    dw InstList_PirateWalking_WalkingRight_1                             ;B2FC0C;

InstList_PirateWalking_FireLasersRight:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FC0E;
    dw RTS_B2FE4A                                                        ;B2FC10;
    dw $0018                                                             ;B2FC12;
    dw ExtendedSpritemaps_PirateWalking_16                               ;B2FC14;
    dw $0008                                                             ;B2FC16;
    dw ExtendedSpritemaps_PirateWalking_17                               ;B2FC18;
    dw $0008                                                             ;B2FC1A;
    dw ExtendedSpritemaps_PirateWalking_18                               ;B2FC1C;
    dw $0008                                                             ;B2FC1E;
    dw ExtendedSpritemaps_PirateWalking_19                               ;B2FC20;
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY            ;B2FC22;
    dw $0008,$0008                                                       ;B2FC24;
    dw ExtendedSpritemaps_PirateWalking_1A                               ;B2FC28;
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY            ;B2FC2A;
    dw $0002,$0018                                                       ;B2FC2C;
    dw ExtendedSpritemaps_PirateWalking_1B                               ;B2FC30;
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY            ;B2FC32;
    dw $FFF8,$0008                                                       ;B2FC34;
    dw ExtendedSpritemaps_PirateWalking_1A                               ;B2FC38;
    dw $0008                                                             ;B2FC3A;
    dw ExtendedSpritemaps_PirateWalking_19                               ;B2FC3C;
    dw $0008                                                             ;B2FC3E;
    dw ExtendedSpritemaps_PirateWalking_18                               ;B2FC40;
    dw $0008                                                             ;B2FC42;
    dw ExtendedSpritemaps_PirateWalking_17                               ;B2FC44;
    dw Instruction_PirateWalking_ChooseAMovement                         ;B2FC46;

InstList_PirateWalking_LookingAround_FacingRight:
    dw Instruction_PirateWalking_FunctionInY                             ;B2FC48;
    dw RTS_B2FE4A                                                        ;B2FC4A;
    dw $0020                                                             ;B2FC4C;
    dw ExtendedSpritemaps_PirateWalking_1F                               ;B2FC4E;
    dw $000A                                                             ;B2FC50;
    dw ExtendedSpritemaps_PirateWalking_20                               ;B2FC52;
    dw $0020                                                             ;B2FC54;
    dw ExtendedSpritemaps_PirateWalking_21                               ;B2FC56;
    dw $000A                                                             ;B2FC58;
    dw ExtendedSpritemaps_PirateWalking_20                               ;B2FC5A;
    dw $0020                                                             ;B2FC5C;
    dw ExtendedSpritemaps_PirateWalking_1F                               ;B2FC5E;
    dw $0008                                                             ;B2FC60;
    dw ExtendedSpritemaps_PirateWalking_22                               ;B2FC62;
    dw Instruction_Common_GotoY                                          ;B2FC64;
    dw InstList_PirateWalking_WalkingLeft_0                              ;B2FC66;

Instruction_PirateWalking_FireLaserLeftWithYOffsetInY:
    PHX                                                                  ;B2FC68;
    PHY                                                                  ;B2FC69;
    LDX.W $0E54                                                          ;B2FC6A;
    LDA.W EnemyData.xPosition,X                                          ;B2FC6D;
    SEC                                                                  ;B2FC70;
    SBC.W #$0018                                                         ;B2FC71;
    STA.B $12                                                            ;B2FC74;
    LDA.W EnemyData.yPosition,X                                          ;B2FC76;
    SEC                                                                  ;B2FC79;
    SBC.W $0000,Y                                                        ;B2FC7A;
    STA.B $14                                                            ;B2FC7D;
    LDA.W #$0000                                                         ;B2FC7F;
    STA.B $16                                                            ;B2FC82;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;B2FC84;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B2FC87;
    PLY                                                                  ;B2FC8B;
    PLX                                                                  ;B2FC8C;
    INY                                                                  ;B2FC8D;
    INY                                                                  ;B2FC8E;
    RTL                                                                  ;B2FC8F;


Instruction_PirateWalking_FireLaserRightWithYOffsetInY:
    PHX                                                                  ;B2FC90;
    PHY                                                                  ;B2FC91;
    LDX.W $0E54                                                          ;B2FC92;
    LDA.W EnemyData.xPosition,X                                          ;B2FC95;
    CLC                                                                  ;B2FC98;
    ADC.W #$0018                                                         ;B2FC99;
    STA.B $12                                                            ;B2FC9C;
    LDA.W EnemyData.yPosition,X                                          ;B2FC9E;
    SEC                                                                  ;B2FCA1;
    SBC.W $0000,Y                                                        ;B2FCA2;
    STA.B $14                                                            ;B2FCA5;
    LDA.W #$0001                                                         ;B2FCA7;
    STA.B $16                                                            ;B2FCAA;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;B2FCAC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B2FCAF;
    PLY                                                                  ;B2FCB3;
    PLX                                                                  ;B2FCB4;
    INY                                                                  ;B2FCB5;
    INY                                                                  ;B2FCB6;
    RTL                                                                  ;B2FCB7;


Instruction_PirateWalking_FunctionInY:
    PHY                                                                  ;B2FCB8;
    PHX                                                                  ;B2FCB9;
    LDX.W $0E54                                                          ;B2FCBA;
    LDA.W $0000,Y                                                        ;B2FCBD;
    STA.W EnemyData.work0,X                                              ;B2FCC0;
    PLX                                                                  ;B2FCC3;
    PLY                                                                  ;B2FCC4;
    INY                                                                  ;B2FCC5;
    INY                                                                  ;B2FCC6;
    RTL                                                                  ;B2FCC7;


Instruction_PirateWalking_ChooseAMovement:
    PHX                                                                  ;B2FCC8;
    LDX.W $0E54                                                          ;B2FCC9;
    LDA.W #$0010                                                         ;B2FCCC;
    PHY                                                                  ;B2FCCF;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2FCD0;
    PLY                                                                  ;B2FCD4;
    AND.W #$FFFF                                                         ;B2FCD5;
    BNE .verticalClose                                                   ;B2FCD8;
    LDX.W $0E54                                                          ;B2FCDA;
    LDY.W #InstList_PirateWalking_WalkingRight_0                         ;B2FCDD;
    LDA.W $0AF6                                                          ;B2FCE0;
    SEC                                                                  ;B2FCE3;
    SBC.W EnemyData.xPosition,X                                          ;B2FCE4;
    BMI .returnWalking                                                   ;B2FCE7;
    LDY.W #InstList_PirateWalking_WalkingLeft_0                          ;B2FCE9;

.returnWalking:
    PLX                                                                  ;B2FCEC;
    RTL                                                                  ;B2FCED;


.verticalClose:
    LDX.W $0E54                                                          ;B2FCEE;
    LDY.W #InstList_PirateWalking_FireLasersLeft                         ;B2FCF1;
    LDA.W $0AF6                                                          ;B2FCF4;
    SEC                                                                  ;B2FCF7;
    SBC.W EnemyData.xPosition,X                                          ;B2FCF8;
    BMI .returnLasers                                                    ;B2FCFB;
    LDY.W #InstList_PirateWalking_FireLasersRight                        ;B2FCFD;

.returnLasers:
    PLX                                                                  ;B2FD00;
    RTL                                                                  ;B2FD01;


InitAI_PirateWalking:
    LDX.W $0E54                                                          ;B2FD02;
    LDY.W #InstList_PirateWalking_WalkingLeft_0                          ;B2FD05;
    LDA.W EnemyData.initParam0,X                                         ;B2FD08;
    BIT.W #$0001                                                         ;B2FD0B;
    BEQ .keepLeft                                                        ;B2FD0E;
    LDY.W #InstList_PirateWalking_WalkingRight_0                         ;B2FD10;

.keepLeft:
    TYA                                                                  ;B2FD13;
    STA.W EnemyData.pInstList,X                                          ;B2FD14;
    LDA.W #RTS_B2804B                                                    ;B2FD17;
    STA.W EnemyData.work0,X                                              ;B2FD1A;
    LDA.W EnemyData.xPosition,X                                          ;B2FD1D;
    CLC                                                                  ;B2FD20;
    ADC.W EnemyData.initParam1,X                                         ;B2FD21;
    STA.W EnemyData.work5,X                                              ;B2FD24;
    LDA.W EnemyData.xPosition,X                                          ;B2FD27;
    SEC                                                                  ;B2FD2A;
    SBC.W EnemyData.initParam1,X                                         ;B2FD2B;
    STA.W EnemyData.work4,X                                              ;B2FD2E;
    RTL                                                                  ;B2FD31;


MainAI_PirateWalking:
    LDX.W $0E54                                                          ;B2FD32;
    JSR.W ($0FA8,X)                                                      ;B2FD35;
    LDA.W EnemyData.initParam0,X                                         ;B2FD38;
    BIT.W #$8000                                                         ;B2FD3B;
    BEQ .return                                                          ;B2FD3E;
    JSR.W PirateWalking_FlinchTrigger                                    ;B2FD40;

.return:
    RTL                                                                  ;B2FD43;


Function_PirateWalking_WalkingLeft:
    LDX.W $0E54                                                          ;B2FD44;
    LDA.W #$0010                                                         ;B2FD47;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2FD4A;
    BEQ .walk                                                            ;B2FD4E;
    LDY.W #InstList_PirateWalking_FireLasersLeft                         ;B2FD50;
    LDA.W $0AF6                                                          ;B2FD53;
    SEC                                                                  ;B2FD56;
    SBC.W EnemyData.xPosition,X                                          ;B2FD57;
    BMI .keepLeft                                                        ;B2FD5A;
    LDY.W #InstList_PirateWalking_FireLasersRight                        ;B2FD5C;

.keepLeft:
    TYA                                                                  ;B2FD5F;
    STA.W EnemyData.pInstList,X                                          ;B2FD60;
    LDA.W #$0001                                                         ;B2FD63;
    STA.W EnemyData.instTimer,X                                          ;B2FD66;
    RTS                                                                  ;B2FD69;


.walk:
    LDA.W #$0001                                                         ;B2FD6A;
    STA.B $14                                                            ;B2FD6D;
    STZ.B $12                                                            ;B2FD6F;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FD71;
    BCC .return                                                          ;B2FD75;
    LDA.W EnemyData.xPosition,X                                          ;B2FD77;
    STA.L $7E7800,X                                                      ;B2FD7A;
    CLC                                                                  ;B2FD7E;
    ADC.W #$FFEF                                                         ;B2FD7F;
    STA.W EnemyData.xPosition,X                                          ;B2FD82;
    LDA.W #$0001                                                         ;B2FD85;
    STA.B $14                                                            ;B2FD88;
    STZ.B $12                                                            ;B2FD8A;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FD8C;
    PHP                                                                  ;B2FD90;
    LDA.L $7E7800,X                                                      ;B2FD91;
    STA.W EnemyData.xPosition,X                                          ;B2FD95;
    PLP                                                                  ;B2FD98;
    BCC .collision                                                       ;B2FD99;
    LDA.W #$0000                                                         ;B2FD9B;
    STA.B $12                                                            ;B2FD9E;
    LDA.W #$FFF7                                                         ;B2FDA0;
    STA.B $14                                                            ;B2FDA3;
    JSL.L CheckForHorizontalSolidBlockCollision                          ;B2FDA5;
    LDA.W #$C7FF                                                         ;B2FDA9;
    STA.B $12                                                            ;B2FDAC;
    LDA.W #$FFFF                                                         ;B2FDAE;
    STA.B $14                                                            ;B2FDB1;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;B2FDB3;
    BCS .collision                                                       ;B2FDB7;
    LDA.W EnemyData.xPosition,X                                          ;B2FDB9;
    CMP.W EnemyData.work4,X                                              ;B2FDBC;
    BPL .return                                                          ;B2FDBF;

.collision:
    LDA.W #InstList_PirateWalking_LookingAround_FacingLeft               ;B2FDC1;
    STA.W EnemyData.pInstList,X                                          ;B2FDC4;
    LDA.W #$0001                                                         ;B2FDC7;
    STA.W EnemyData.instTimer,X                                          ;B2FDCA;

.return:
    RTS                                                                  ;B2FDCD;


Function_PirateWalking_WalkingRight:
    LDX.W $0E54                                                          ;B2FDCE;
    LDA.W #$0010                                                         ;B2FDD1;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B2FDD4;
    BEQ .walk                                                            ;B2FDD8;
    LDY.W #InstList_PirateWalking_FireLasersLeft                         ;B2FDDA;
    LDA.W $0AF6                                                          ;B2FDDD;
    SEC                                                                  ;B2FDE0;
    SBC.W EnemyData.xPosition,X                                          ;B2FDE1;
    BMI .keepLeft                                                        ;B2FDE4;
    LDY.W #InstList_PirateWalking_FireLasersRight                        ;B2FDE6;

.keepLeft:
    TYA                                                                  ;B2FDE9;
    STA.W EnemyData.pInstList,X                                          ;B2FDEA;
    LDA.W #$0001                                                         ;B2FDED;
    STA.W EnemyData.instTimer,X                                          ;B2FDF0;
    RTS                                                                  ;B2FDF3;


.walk:
    LDA.W #$0001                                                         ;B2FDF4;
    STA.B $14                                                            ;B2FDF7;
    STZ.B $12                                                            ;B2FDF9;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FDFB;
    BCC .return                                                          ;B2FDFF;
    LDA.W EnemyData.xPosition,X                                          ;B2FE01;
    STA.L $7E7800,X                                                      ;B2FE04;
    CLC                                                                  ;B2FE08;
    ADC.W #$0010                                                         ;B2FE09;
    STA.W EnemyData.xPosition,X                                          ;B2FE0C;
    LDA.W #$0001                                                         ;B2FE0F;
    STA.B $14                                                            ;B2FE12;
    STZ.B $12                                                            ;B2FE14;
    JSL.L MoveEnemyDownBy_14_12                                          ;B2FE16;
    PHP                                                                  ;B2FE1A;
    LDA.L $7E7800,X                                                      ;B2FE1B;
    STA.W EnemyData.xPosition,X                                          ;B2FE1F;
    PLP                                                                  ;B2FE22;
    BCC .collision                                                       ;B2FE23;
    LDA.W #$3800                                                         ;B2FE25;
    STA.B $12                                                            ;B2FE28;
    LDA.W #$0000                                                         ;B2FE2A;
    STA.B $14                                                            ;B2FE2D;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;B2FE2F;
    BCS .collision                                                       ;B2FE33;
    LDA.W EnemyData.xPosition,X                                          ;B2FE35;
    CMP.W EnemyData.work5,X                                              ;B2FE38;
    BMI .return                                                          ;B2FE3B;

.collision:
    LDA.W #InstList_PirateWalking_LookingAround_FacingRight              ;B2FE3D;
    STA.W EnemyData.pInstList,X                                          ;B2FE40;
    LDA.W #$0001                                                         ;B2FE43;
    STA.W EnemyData.instTimer,X                                          ;B2FE46;

.return:
    RTS                                                                  ;B2FE49;


RTS_B2FE4A:
    RTS                                                                  ;B2FE4A;


PirateWalking_FlinchTrigger:
    PHX                                                                  ;B2FE4B;
    LDX.W $0E54                                                          ;B2FE4C;
    LDY.W #$0008                                                         ;B2FE4F;

.loopProjectiles:
    LDA.W $0C18,Y                                                        ;B2FE52;
    BNE .checkProjectile                                                 ;B2FE55;
    DEY                                                                  ;B2FE57;
    DEY                                                                  ;B2FE58;
    BPL .loopProjectiles                                                 ;B2FE59;
    BRA .returnNoFlinch                                                  ;B2FE5B;


.checkProjectile:
    LDA.W $0B64,Y                                                        ;B2FE5D;
    SEC                                                                  ;B2FE60;
    SBC.W EnemyData.xPosition,X                                          ;B2FE61;
    BPL +                                                                ;B2FE64;
    EOR.W #$FFFF                                                         ;B2FE66;
    INC A                                                                ;B2FE69;

  + SEC                                                                  ;B2FE6A;
    SBC.W #$0020                                                         ;B2FE6B;
    BPL .returnNoFlinch                                                  ;B2FE6E;
    LDA.W $0B78,Y                                                        ;B2FE70;
    SEC                                                                  ;B2FE73;
    SBC.W EnemyData.yPosition,X                                          ;B2FE74;
    BPL +                                                                ;B2FE77;
    EOR.W #$FFFF                                                         ;B2FE79;
    INC A                                                                ;B2FE7C;

  + SEC                                                                  ;B2FE7D;
    SBC.W #$0020                                                         ;B2FE7E;
    BPL .returnNoFlinch                                                  ;B2FE81;
    LDA.W EnemyData.xPosition,X                                          ;B2FE83;
    SEC                                                                  ;B2FE86;
    SBC.W $0AF6                                                          ;B2FE87;
    STA.B $12                                                            ;B2FE8A;
    LDY.W #InstList_PirateWalking_Flinch_FacingLeft                      ;B2FE8C;
    LDA.B $12                                                            ;B2FE8F;
    BPL .keepLeft                                                        ;B2FE91;
    LDY.W #InstList_PirateWalking_Flinch_FacingRight                     ;B2FE93;

.keepLeft:
    TYA                                                                  ;B2FE96;
    STA.W EnemyData.pInstList,X                                          ;B2FE97;
    LDA.W #$0001                                                         ;B2FE9A;
    STA.W EnemyData.instTimer,X                                          ;B2FE9D;
    PLX                                                                  ;B2FEA0;
    LDA.W #$0001                                                         ;B2FEA1;
    RTS                                                                  ;B2FEA4;


.returnNoFlinch:
    PLX                                                                  ;B2FEA5;
    LDA.W #$0000                                                         ;B2FEA6;
    RTS                                                                  ;B2FEA9;


Freespace_BankB2_FEAA:                                                   ;B2FEAA;
; $156 bytes
