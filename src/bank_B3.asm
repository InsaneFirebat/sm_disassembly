
org $B38000


CommonB3_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;B38000;
    RTL                                                                  ;B38004;


CommonB3_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;B38005;
    RTL                                                                  ;B38009;


CommonB3_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;B3800A;
    RTL                                                                  ;B3800E;


CommonB3_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;B3800F;
    RTL                                                                  ;B38013;


CommonB3_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;B38014;
    RTL                                                                  ;B38018;


UNUSED_CommonB3_GrappleAI_SamusLatchesOn_ParalyzeEnemy_B38019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;B38019;
    RTL                                                                  ;B3801D;


CommonB3_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;B3801E;
    RTL                                                                  ;B38022;


CommonB3_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;B38023;
    RTL                                                                  ;B38027;


CommonB3_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;B38028;
    RTL                                                                  ;B3802C;


CommonB3_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;B3802D;
    RTL                                                                  ;B38031;


CommonB3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;B38032;
    RTL                                                                  ;B38036;


CommonB3_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;B38037;
    RTL                                                                  ;B3803B;


CommonB3_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;B3803C;
    RTL                                                                  ;B38040;


CommonB3_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;B38041;
    RTL                                                                  ;B38045;


CommonB3_CreateADudShot_JSL:
    JSL.L CreateADudShot                                                 ;B38046;
    RTL                                                                  ;B3804A;


RTS_B3804B:
    RTS                                                                  ;B3804B;


CommonB3_RTL_B3804C:
    RTL                                                                  ;B3804C;


Spritemap_CommonB3_Nothing:
    dw $0000                                                             ;B3804D;

ExtendedSpritemap_CommonB3_Nothing:
    dw $0001,$0000,$0000                                                 ;B3804F;
    dw Spritemap_CommonB3_Nothing                                        ;B38055;
    dw Hitbox_CommonB3_Nothing                                           ;B38057;

Hitbox_CommonB3_Nothing:
    dw $0001,$0000,$0000,$0000,$0000                                     ;B38059;
    dw CommonB3_NormalEnemyTouchAI                                       ;B38063;
    dw CommonB3_NormalEnemyShotAI                                        ;B38065;

InstList_CommonB3_DeleteEnemy:
    dw Instruction_CommonB3_DeleteEnemy                                  ;B38067;

NOPNOP_B38069:
    NOP                                                                  ;B38069;
    NOP                                                                  ;B3806A;

Instruction_CommonB3_Enemy0FB2_InY:
    LDA.W $0000,Y                                                        ;B3806B;
    STA.W EnemyData.work5,X                                              ;B3806E;
    INY                                                                  ;B38071;
    INY                                                                  ;B38072;
    RTL                                                                  ;B38073;


Instruction_CommonB3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_B3807B                                                    ;B38074;
    STA.W EnemyData.work5,X                                              ;B38077;
    RTL                                                                  ;B3807A;


RTS_B3807B:
    RTS                                                                  ;B3807B;


Instruction_CommonB3_DeleteEnemy:
    LDA.W EnemyData.properties,X                                         ;B3807C;
    ORA.W #$0200                                                         ;B3807F;
    STA.W EnemyData.properties,X                                         ;B38082;
    PLA                                                                  ;B38085;
    PEA.W ProcessEnemyInstructions_return-1                              ;B38086;
    RTL                                                                  ;B38089;


Instruction_CommonB3_CallFunctionInY:
    LDA.W $0000,Y                                                        ;B3808A;
    STA.B $12                                                            ;B3808D;
    PHY                                                                  ;B3808F;
    PHX                                                                  ;B38090;
    PEA.W .manualReturn-1                                                ;B38091;
    JMP.W ($0012)                                                        ;B38094;


.manualReturn:
    PLX                                                                  ;B38097;
    PLY                                                                  ;B38098;
    INY                                                                  ;B38099;
    INY                                                                  ;B3809A;
    RTL                                                                  ;B3809B;


Instruction_CommonB3_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;B3809C;
    STA.B $12                                                            ;B3809F;
    LDA.W $0002,Y                                                        ;B380A1;
    PHY                                                                  ;B380A4;
    PHX                                                                  ;B380A5;
    PEA.W .manualReturn-1                                                ;B380A6;
    JMP.W ($0012)                                                        ;B380A9;


.manualReturn:
    PLX                                                                  ;B380AC;
    PLY                                                                  ;B380AD;
    TYA                                                                  ;B380AE;
    CLC                                                                  ;B380AF;
    ADC.W #$0004                                                         ;B380B0;
    TAY                                                                  ;B380B3;
    RTL                                                                  ;B380B4;


UNUSED_Instruction_CommonB3_CallExternalFunctionInY_B380B5:
    LDA.W $0000,Y                                                        ;B380B5;
    STA.B $12                                                            ;B380B8;
    LDA.W $0001,Y                                                        ;B380BA;
    STA.B $13                                                            ;B380BD;
    PHX                                                                  ;B380BF;
    PHY                                                                  ;B380C0;
    JSL.L .externalFunction                                              ;B380C1;
    PLY                                                                  ;B380C5;
    PLX                                                                  ;B380C6;
    INY                                                                  ;B380C7;
    INY                                                                  ;B380C8;
    INY                                                                  ;B380C9;
    RTL                                                                  ;B380CA;


.externalFunction:
    JML.W [$0012]                                                        ;B380CB;


UNUSED_Inst_CommonB3_CallExternalFunctionInY_WithA_B380CE:
    LDA.W $0000,Y                                                        ;B380CE;
    STA.B $12                                                            ;B380D1;
    LDA.W $0001,Y                                                        ;B380D3;
    STA.B $13                                                            ;B380D6;
    LDA.W $0003,Y                                                        ;B380D8;
    PHX                                                                  ;B380DB;
    PHY                                                                  ;B380DC;
    JSL.L .externalFunction                                              ;B380DD;
    PLY                                                                  ;B380E1;
    PLX                                                                  ;B380E2;
    TYA                                                                  ;B380E3;
    CLC                                                                  ;B380E4;
    ADC.W #$0005                                                         ;B380E5;
    TAY                                                                  ;B380E8;
    RTL                                                                  ;B380E9;


.externalFunction:
    JML.W [$0012]                                                        ;B380EA;


Instruction_CommonB3_GotoY:
    LDA.W $0000,Y                                                        ;B380ED;
    TAY                                                                  ;B380F0;
    RTL                                                                  ;B380F1;


Instruction_CommonB3_GotoY_PlusY:
    STY.B $12                                                            ;B380F2;
    DEY                                                                  ;B380F4;
    LDA.W $0000,Y                                                        ;B380F5;
    XBA                                                                  ;B380F8;
    BMI .highByte                                                        ;B380F9;
    AND.W #$00FF                                                         ;B380FB;
    BRA +                                                                ;B380FE;


.highByte:
    ORA.W #$FF00                                                         ;B38100;

  + CLC                                                                  ;B38103;
    ADC.B $12                                                            ;B38104;
    TAY                                                                  ;B38106;
    RTL                                                                  ;B38107;


Instruction_CommonB3_DecrementTimer_GotoYIfNonZero:
    DEC.W EnemyData.loopCounter,X                                        ;B38108;
    BNE Instruction_CommonB3_GotoY                                       ;B3810B;
    INY                                                                  ;B3810D;
    INY                                                                  ;B3810E;
    RTL                                                                  ;B3810F;


Instruction_CommonB3_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W EnemyData.loopCounter,X                                        ;B38110;
    BNE Instruction_CommonB3_GotoY                                       ;B38113;
    INY                                                                  ;B38115;
    INY                                                                  ;B38116;
    RTL                                                                  ;B38117;


Instruction_CommonB3_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;B38118;
    DEC.W EnemyData.loopCounter,X                                        ;B3811A;
    REP #$20                                                             ;B3811D;
    BNE Instruction_CommonB3_GotoY_PlusY                                 ;B3811F;
    INY                                                                  ;B38121;
    RTL                                                                  ;B38122;


Instruction_CommonB3_TimerInY:
    LDA.W $0000,Y                                                        ;B38123;
    STA.W EnemyData.loopCounter,X                                        ;B38126;
    INY                                                                  ;B38129;
    INY                                                                  ;B3812A;
    RTL                                                                  ;B3812B;


Instruction_CommonB3_SkipNextInstruction:
    INY                                                                  ;B3812C;
    INY                                                                  ;B3812D;
    RTL                                                                  ;B3812E;


Instruction_CommonB3_Sleep:
    DEY                                                                  ;B3812F;
    DEY                                                                  ;B38130;
    TYA                                                                  ;B38131;
    STA.W EnemyData.pInstList,X                                          ;B38132;
    PLA                                                                  ;B38135;
    PEA.W ProcessEnemyInstructions_return-1                              ;B38136;
    RTL                                                                  ;B38139;


Instruction_CommonB3_WaitYFrames:
    LDA.W $0000,Y                                                        ;B3813A;
    STA.W EnemyData.instTimer,X                                          ;B3813D;
    INY                                                                  ;B38140;
    INY                                                                  ;B38141;
    TYA                                                                  ;B38142;
    STA.W EnemyData.pInstList,X                                          ;B38143;
    PLA                                                                  ;B38146;
    PEA.W ProcessEnemyInstructions_return-1                              ;B38147;
    RTL                                                                  ;B3814A;


Instruction_CommonB3_TransferYBytesInYToVRAM:
    PHX                                                                  ;B3814B;
    LDX.W $0330                                                          ;B3814C;
    LDA.W $0000,Y                                                        ;B3814F;
    STA.B $D0,X                                                          ;B38152;
    LDA.W $0002,Y                                                        ;B38154;
    STA.B $D2,X                                                          ;B38157;
    LDA.W $0003,Y                                                        ;B38159;
    STA.B $D3,X                                                          ;B3815C;
    LDA.W $0005,Y                                                        ;B3815E;
    STA.B $D5,X                                                          ;B38161;
    TXA                                                                  ;B38163;
    CLC                                                                  ;B38164;
    ADC.W #$0007                                                         ;B38165;
    STA.W $0330                                                          ;B38168;
    TYA                                                                  ;B3816B;
    CLC                                                                  ;B3816C;
    ADC.W #$0007                                                         ;B3816D;
    TAY                                                                  ;B38170;
    PLX                                                                  ;B38171;
    RTL                                                                  ;B38172;


Instruction_CommonB3_EnableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;B38173;
    ORA.W #$0800                                                         ;B38176;
    STA.W EnemyData.properties,X                                         ;B38179;
    RTL                                                                  ;B3817C;


Instruction_CommonB3_DisableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;B3817D;
    AND.W #$F7FF                                                         ;B38180;
    STA.W EnemyData.properties,X                                         ;B38183;
    RTL                                                                  ;B38186;


CommonB3EnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000                   ;B38187;
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000                   ;B38197;
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000                   ;B381A7;
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000                   ;B381B7;
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000                   ;B381C7;
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000                   ;B381D7;
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000                   ;B381E7;
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000                   ;B381F7;
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000                   ;B38207;
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000                   ;B38217;
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000                   ;B38227;
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000                   ;B38237;
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000                   ;B38247;
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000                   ;B38257;
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000                   ;B38267;
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000                   ;B38277;
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000                   ;B38287;
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000                   ;B38297;
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000                   ;B382A7;
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000                   ;B382B7;
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000                   ;B382C7;
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000                   ;B382D7;
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000                   ;B382E7;
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000                   ;B382F7;
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000                   ;B38307;
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000                   ;B38317;
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000                   ;B38327;
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000                   ;B38337;
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000                   ;B38347;
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000                   ;B38357;
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000                   ;B38367;
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000                   ;B38377;
    dw $0004,$0000,$FFFC,$0000                                           ;B38387;

CommonB3EnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF                   ;B3838F;
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF                   ;B3839F;
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF                   ;B383AF;
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF                   ;B383BF;
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF                   ;B383CF;
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF                   ;B383DF;
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF                   ;B383EF;
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF                   ;B383FF;
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF                   ;B3840F;
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF                   ;B3841F;
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF                   ;B3842F;
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE                   ;B3843F;
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE                   ;B3844F;
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE                   ;B3845F;
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE                   ;B3846F;
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE                   ;B3847F;
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD                   ;B3848F;
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD                   ;B3849F;
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD                   ;B384AF;
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC                   ;B384BF;
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC                   ;B384CF;
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC                   ;B384DF;
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB                   ;B384EF;
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB                   ;B384FF;
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB                   ;B3850F;
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA                   ;B3851F;
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA                   ;B3852F;
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9                   ;B3853F;
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9                   ;B3854F;
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9                   ;B3855F;
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8                   ;B3856F;
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8                   ;B3857F;
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7                   ;B3858F;
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7                   ;B3859F;
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6                   ;B385AF;
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6                   ;B385BF;
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5                   ;B385CF;
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4                   ;B385DF;
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4                   ;B385EF;
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3                   ;B385FF;
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3                   ;B3860F;
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2                   ;B3861F;
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1                   ;B3862F;
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1                   ;B3863F;
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0                   ;B3864F;
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF                   ;B3865F;
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE                   ;B3866F;
    dw $74F9,$0011,$8B07,$FFEE                                           ;B3867F;

UNUSED_Palette_SpinningTurtleEye_B38687:
    dw $3800,$4FE9,$4266,$3D85,$20A3,$52FC,$41F7,$30D2                   ;B38687;
    dw $240E,$325F,$31DB,$3156,$30D2,$302C,$7FBD,$0C05                   ;B38697;

UNUSED_InstList_SpinningTurtleEye_Initial_B386A7:
    dw $000A                                                             ;B386A7;
    dw UNUSED_Spritemaps_SpinningTurtleEye_0_B38714                      ;B386A9;
    dw $000A                                                             ;B386AB;
    dw UNUSED_Spritemaps_SpinningTurtleEye_1_B3871B                      ;B386AD;
    dw $000A                                                             ;B386AF;
    dw UNUSED_Spritemaps_SpinningTurtleEye_2_B38722                      ;B386B1;
    dw $000A                                                             ;B386B3;
    dw UNUSED_Spritemaps_SpinningTurtleEye_3_B38729                      ;B386B5;
    dw $000A                                                             ;B386B7;
    dw UNUSED_Spritemaps_SpinningTurtleEye_4_B38730                      ;B386B9;
    dw $000A                                                             ;B386BB;
    dw UNUSED_Spritemaps_SpinningTurtleEye_5_B38737                      ;B386BD;
    dw $000A                                                             ;B386BF;
    dw UNUSED_Spritemaps_SpinningTurtleEye_6_B3873E                      ;B386C1;
    dw $000A                                                             ;B386C3;
    dw UNUSED_Spritemaps_SpinningTurtleEye_7_B38745                      ;B386C5;
    dw Instruction_Common_GotoY                                          ;B386C7;
    dw UNUSED_InstList_SpinningTurtleEye_Initial_B386A7                  ;B386C9;

UNUSED_InstList_SpinningTurtleEye_B386CB:
    dw $0008                                                             ;B386CB;
    dw UNUSED_Spritemaps_SpinningTurtleEye_8_B3874C                      ;B386CD;
    dw $0008                                                             ;B386CF;
    dw UNUSED_Spritemaps_SpinningTurtleEye_9_B38753                      ;B386D1;
    dw $0008                                                             ;B386D3;
    dw UNUSED_Spritemaps_SpinningTurtleEye_A_B3875A                      ;B386D5;
    dw Instruction_Common_GotoY                                          ;B386D7;
    dw UNUSED_InstList_SpinningTurtleEye_B386CB                          ;B386D9;

UNUSED_InstList_SpinningTurtleEye_B386DB:
    dw $0008                                                             ;B386DB;
    dw UNUSED_Spritemaps_SpinningTurtleEye_B_B38761                      ;B386DD;
    dw $0008                                                             ;B386DF;
    dw UNUSED_Spritemaps_SpinningTurtleEye_C_B38768                      ;B386E1;
    dw $0008                                                             ;B386E3;
    dw UNUSED_Spritemaps_SpinningTurtleEye_D_B3876F                      ;B386E5;
    dw Instruction_Common_GotoY                                          ;B386E7;
    dw UNUSED_InstList_SpinningTurtleEye_B386DB                          ;B386E9;

UNUSED_InstList_SpinningTurtleEye_B386EB:
    dw $0008                                                             ;B386EB;
    dw UNUSED_Spritemaps_SpinningTurtleEye_E_B38776                      ;B386ED;
    dw $0008                                                             ;B386EF;
    dw UNUSED_Spritemaps_SpinningTurtleEye_F_B3877D                      ;B386F1;
    dw $0008                                                             ;B386F3;
    dw UNUSED_Spritemaps_SpinningTurtleEye_10_B38784                     ;B386F5;
    dw Instruction_Common_GotoY                                          ;B386F7;
    dw UNUSED_InstList_SpinningTurtleEye_B386EB                          ;B386F9;

UNUSED_InitAI_SpinningTurtleEye_B386FB:
    LDX.W $0E54                                                          ;B386FB;
    LDA.W EnemyData.properties,X                                         ;B386FE;
    ORA.W #$2000                                                         ;B38701;
    STA.W EnemyData.properties,X                                         ;B38704;
    LDA.W #UNUSED_InstList_SpinningTurtleEye_Initial_B386A7              ;B38707;
    STA.W EnemyData.pInstList,X                                          ;B3870A;
    RTL                                                                  ;B3870D;


UNUSED_MainAI_SpinningTurtleEye_B3870E:
    LDX.W $0E54                                                          ;B3870E;
    RTL                                                                  ;B38711;


RTL_B38712:
    RTL                                                                  ;B38712;


RTL_B38713:
    RTL                                                                  ;B38713;


UNUSED_Spritemaps_SpinningTurtleEye_0_B38714:
    dw $0001,$01F8                                                       ;B38714;
    db $F8                                                               ;B38718;
    dw $3300                                                             ;B38719;

UNUSED_Spritemaps_SpinningTurtleEye_1_B3871B:
    dw $0001,$01F8                                                       ;B3871B;
    db $F8                                                               ;B3871F;
    dw $3301                                                             ;B38720;

UNUSED_Spritemaps_SpinningTurtleEye_2_B38722:
    dw $0001,$01F8                                                       ;B38722;
    db $F8                                                               ;B38726;
    dw $3302                                                             ;B38727;

UNUSED_Spritemaps_SpinningTurtleEye_3_B38729:
    dw $0001,$01F8                                                       ;B38729;
    db $F8                                                               ;B3872D;
    dw $3303                                                             ;B3872E;

UNUSED_Spritemaps_SpinningTurtleEye_4_B38730:
    dw $0001,$01F8                                                       ;B38730;
    db $F8                                                               ;B38734;
    dw $F300                                                             ;B38735;

UNUSED_Spritemaps_SpinningTurtleEye_5_B38737:
    dw $0001,$01F8                                                       ;B38737;
    db $F8                                                               ;B3873B;
    dw $F301                                                             ;B3873C;

UNUSED_Spritemaps_SpinningTurtleEye_6_B3873E:
    dw $0001,$01F8                                                       ;B3873E;
    db $F8                                                               ;B38742;
    dw $F302                                                             ;B38743;

UNUSED_Spritemaps_SpinningTurtleEye_7_B38745:
    dw $0001,$01F8                                                       ;B38745;
    db $F8                                                               ;B38749;
    dw $F303                                                             ;B3874A;

UNUSED_Spritemaps_SpinningTurtleEye_8_B3874C:
    dw $0001,$01F8                                                       ;B3874C;
    db $F8                                                               ;B38750;
    dw $3304                                                             ;B38751;

UNUSED_Spritemaps_SpinningTurtleEye_9_B38753:
    dw $0001,$01F8                                                       ;B38753;
    db $F8                                                               ;B38757;
    dw $3305                                                             ;B38758;

UNUSED_Spritemaps_SpinningTurtleEye_A_B3875A:
    dw $0001,$01F8                                                       ;B3875A;
    db $F8                                                               ;B3875E;
    dw $3306                                                             ;B3875F;

UNUSED_Spritemaps_SpinningTurtleEye_B_B38761:
    dw $0001,$01F8                                                       ;B38761;
    db $F8                                                               ;B38765;
    dw $3307                                                             ;B38766;

UNUSED_Spritemaps_SpinningTurtleEye_C_B38768:
    dw $0001,$01F8                                                       ;B38768;
    db $F8                                                               ;B3876C;
    dw $3308                                                             ;B3876D;

UNUSED_Spritemaps_SpinningTurtleEye_D_B3876F:
    dw $0001,$01F8                                                       ;B3876F;
    db $F8                                                               ;B38773;
    dw $3309                                                             ;B38774;

UNUSED_Spritemaps_SpinningTurtleEye_E_B38776:
    dw $0001,$01F8                                                       ;B38776;
    db $F8                                                               ;B3877A;
    dw $330A                                                             ;B3877B;

UNUSED_Spritemaps_SpinningTurtleEye_F_B3877D:
    dw $0001,$01F8                                                       ;B3877D;
    db $F8                                                               ;B38781;
    dw $330B                                                             ;B38782;

UNUSED_Spritemaps_SpinningTurtleEye_10_B38784:
    dw $0001,$01F8                                                       ;B38784;
    db $F8                                                               ;B38788;
    dw $330C                                                             ;B38789;

Palette_Zeb:
    dw $3800,$021D,$0015,$0008,$0003,$00BD,$0013,$000E                   ;B3878B;
    dw $000B,$7F5A,$7EC0,$6DE0,$54E0,$03E0,$02A0,$0140                   ;B3879B;

InstList_Zeb_FacingLeft_Rising:
    dw $0002                                                             ;B387AB;
    dw Spritemaps_Zeb_0                                                  ;B387AD;
    dw $0002                                                             ;B387AF;
    dw Spritemaps_Zeb_1                                                  ;B387B1;
    dw $0002                                                             ;B387B3;
    dw Spritemaps_Zeb_2                                                  ;B387B5;
    dw $0002                                                             ;B387B7;
    dw Spritemaps_Zeb_3                                                  ;B387B9;
    dw $0002                                                             ;B387BB;
    dw Spritemaps_Zeb_4                                                  ;B387BD;
    dw $0002                                                             ;B387BF;
    dw Spritemaps_Zeb_3                                                  ;B387C1;
    dw $0002                                                             ;B387C3;
    dw Spritemaps_Zeb_2                                                  ;B387C5;
    dw $0002                                                             ;B387C7;
    dw Spritemaps_Zeb_1                                                  ;B387C9;
    dw Instruction_Common_GotoY                                          ;B387CB;
    dw InstList_Zeb_FacingLeft_Rising                                    ;B387CD;

InstList_Zeb_FacingLeft_Shooting:
    dw $0001                                                             ;B387CF;
    dw Spritemaps_Zeb_0                                                  ;B387D1;
    dw $0001                                                             ;B387D3;
    dw Spritemaps_Zeb_1                                                  ;B387D5;
    dw $0001                                                             ;B387D7;
    dw Spritemaps_Zeb_3                                                  ;B387D9;
    dw $0001                                                             ;B387DB;
    dw Spritemaps_Zeb_4                                                  ;B387DD;
    dw $0001                                                             ;B387DF;
    dw Spritemaps_Zeb_3                                                  ;B387E1;
    dw $0001                                                             ;B387E3;
    dw Spritemaps_Zeb_1                                                  ;B387E5;
    dw Instruction_Common_GotoY                                          ;B387E7;
    dw InstList_Zeb_FacingLeft_Shooting                                  ;B387E9;

InstList_Zeb_FacingRight_Rising:
    dw $0002                                                             ;B387EB;
    dw Spritemaps_Zeb_5                                                  ;B387ED;
    dw $0002                                                             ;B387EF;
    dw Spritemaps_Zeb_6                                                  ;B387F1;
    dw $0002                                                             ;B387F3;
    dw Spritemaps_Zeb_7                                                  ;B387F5;
    dw $0002                                                             ;B387F7;
    dw Spritemaps_Zeb_8                                                  ;B387F9;
    dw $0002                                                             ;B387FB;
    dw Spritemaps_Zeb_9                                                  ;B387FD;
    dw $0002                                                             ;B387FF;
    dw Spritemaps_Zeb_8                                                  ;B38801;
    dw $0002                                                             ;B38803;
    dw Spritemaps_Zeb_7                                                  ;B38805;
    dw $0002                                                             ;B38807;
    dw Spritemaps_Zeb_6                                                  ;B38809;
    dw Instruction_Common_GotoY                                          ;B3880B;
    dw InstList_Zeb_FacingRight_Rising                                   ;B3880D;

InstList_Zeb_FacingRight_Shooting:
    dw $0001                                                             ;B3880F;
    dw Spritemaps_Zeb_5                                                  ;B38811;
    dw $0001                                                             ;B38813;
    dw Spritemaps_Zeb_6                                                  ;B38815;
    dw $0001                                                             ;B38817;
    dw Spritemaps_Zeb_8                                                  ;B38819;
    dw $0001                                                             ;B3881B;
    dw Spritemaps_Zeb_9                                                  ;B3881D;
    dw $0001                                                             ;B3881F;
    dw Spritemaps_Zeb_8                                                  ;B38821;
    dw $0001                                                             ;B38823;
    dw Spritemaps_Zeb_6                                                  ;B38825;
    dw Instruction_Common_GotoY                                          ;B38827;
    dw InstList_Zeb_FacingRight_Shooting                                 ;B38829;

InstListPointers_Zeb:
    dw InstList_Zeb_FacingLeft_Rising                                    ;B3882B;
    dw InstList_Zeb_FacingLeft_Shooting                                  ;B3882D;
    dw InstList_Zeb_FacingRight_Rising                                   ;B3882F;
    dw InstList_Zeb_FacingRight_Shooting                                 ;B38831;

InstListPointers_Zebbo:
    dw InstList_Zebbo_FacingLeft_Rising                                  ;B38833;
    dw InstList_Zebbo_FacingLeft_Shooting                                ;B38835;
    dw InstList_Zebbo_FacingRight_Rising                                 ;B38837;
    dw InstList_Zebbo_FacingRight_Shooting                               ;B38839;

InitAI_Zeb_Zebbo:
    LDX.W $0E54                                                          ;B3883B;
    LDA.W EnemyData.xPosition,X                                          ;B3883E;
    STA.W EnemyData.work1,X                                              ;B38841;
    LDA.W EnemyData.yPosition,X                                          ;B38844;
    STA.W EnemyData.work2,X                                              ;B38847;
    SEC                                                                  ;B3884A;
    SBC.W #$0010                                                         ;B3884B;
    STA.L $7E7800,X                                                      ;B3884E;
    LDA.W #Function_Zeb_Zebbo_WaitUntilOnScreen                          ;B38852;
    STA.W EnemyData.work5,X                                              ;B38855;
    LDA.W #$0030                                                         ;B38858;
    STA.W EnemyData.work3,X                                              ;B3885B;
    LDA.W #$0000                                                         ;B3885E;
    STA.W EnemyData.work4,X                                              ;B38861;
    STA.L $7E7802,X                                                      ;B38864;
    LDA.W #InstList_Zeb_FacingLeft_Rising                                ;B38868;
    STA.W EnemyData.pInstList,X                                          ;B3886B;
    LDA.W EnemyData.initParam0,X                                         ;B3886E;
    BEQ .return                                                          ;B38871;
    LDA.W #InstList_Zebbo_FacingLeft_Rising                              ;B38873;
    STA.W EnemyData.pInstList,X                                          ;B38876;

.return:
    RTL                                                                  ;B38879;


MainAI_Zeb_Zebbo:
    LDX.W $0E54                                                          ;B3887A;
    JMP.W ($0FB2,X)                                                      ;B3887D;


Function_Zeb_Zebbo_WaitUntilOnScreen:
    LDX.W $0E54                                                          ;B38880;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;B38883;
    BNE .return                                                          ;B38887;
    LDA.W #Function_Zeb_Zebbo_WaitForSamusToGetNear                      ;B38889;
    STA.W EnemyData.work5,X                                              ;B3888C;

.return:
    RTL                                                                  ;B3888F;


Function_Zeb_Zebbo_WaitForSamusToGetNear:
    JSL.L Get_SamusY_minus_EnemyY                                        ;B38890;
    BPL .return                                                          ;B38894;
    CMP.W #$FFA0                                                         ;B38896;
    BMI .return                                                          ;B38899;
    JSL.L Get_SamusX_minus_EnemyX                                        ;B3889B;
    TAY                                                                  ;B3889F;
    ROL.W EnemyData.work0,X                                              ;B388A0;
    ROL A                                                                ;B388A3;
    ROR.W EnemyData.work0,X                                              ;B388A4;
    LDA.W EnemyData.xPosition,X                                          ;B388A7;
    SEC                                                                  ;B388AA;
    SBC.W $0AF6                                                          ;B388AB;
    BPL +                                                                ;B388AE;
    EOR.W #$FFFF                                                         ;B388B0;
    INC A                                                                ;B388B3;

  + CMP.W #$0040                                                         ;B388B4;
    BCC .close                                                           ;B388B7;

.return:
    RTL                                                                  ;B388B9;


.close:
    LDA.W #Function_Zeb_Zebbo_Rising                                     ;B388BA;
    STA.W EnemyData.work5,X                                              ;B388BD;
    LDA.W EnemyData.properties,X                                         ;B388C0;
    AND.W #$FEFF                                                         ;B388C3;
    STA.W EnemyData.properties,X                                         ;B388C6;
    LDA.W #$0000                                                         ;B388C9;
    STA.W EnemyData.loopCounter,X                                        ;B388CC;
    BIT.W EnemyData.work0,X                                              ;B388CF;
    BMI .left                                                            ;B388D2;
    LDA.W #$0002                                                         ;B388D4;
    BRA +                                                                ;B388D7;


.left:
    LDA.W #$0000                                                         ;B388D9;

  + STA.W EnemyData.work4,X                                              ;B388DC;
    JSR.W Set_Zeb_Zebbo_InstList                                         ;B388DF;
    RTL                                                                  ;B388E2;


Function_Zeb_Zebbo_Rising:
    LDA.W #$FFFF                                                         ;B388E3;
    CLC                                                                  ;B388E6;
    ADC.W EnemyData.ySubPosition,X                                       ;B388E7;
    STA.W EnemyData.ySubPosition,X                                       ;B388EA;
    LDA.W #$FFFE                                                         ;B388ED;
    ADC.W EnemyData.yPosition,X                                          ;B388F0;
    STA.W EnemyData.yPosition,X                                          ;B388F3;
    LDA.L $7E7800,X                                                      ;B388F6;
    CMP.W EnemyData.yPosition,X                                          ;B388FA;
    BMI .return                                                          ;B388FD;
    LDA.W EnemyData.yPosition,X                                          ;B388FF;
    CMP.W $0AFA                                                          ;B38902;
    BCC .targetHeight                                                    ;B38905;
    BRA .return                                                          ;B38907;


.targetHeight:
    LDA.W EnemyData.work4,X                                              ;B38909;
    ORA.W #$0001                                                         ;B3890C;
    STA.W EnemyData.work4,X                                              ;B3890F;
    JSR.W Set_Zeb_Zebbo_InstList                                         ;B38912;
    LDA.W #Function_Zeb_Zebbo_Shooting                                   ;B38915;
    STA.W EnemyData.work5,X                                              ;B38918;

.return:
    RTL                                                                  ;B3891B;


Function_Zeb_Zebbo_Shooting:
    BIT.W EnemyData.work0,X                                              ;B3891C;
    BPL .right                                                           ;B3891F;
    LDA.W EnemyData.xSubPosition,X                                       ;B38921;
    SEC                                                                  ;B38924;
    SBC.W #$0000                                                         ;B38925;
    STA.W EnemyData.xSubPosition,X                                       ;B38928;
    LDA.W EnemyData.xPosition,X                                          ;B3892B;
    SBC.W #$0002                                                         ;B3892E;
    STA.W EnemyData.xPosition,X                                          ;B38931;
    BRA .checkOnScreen                                                   ;B38934;


.right:
    LDA.W #$0000                                                         ;B38936;
    CLC                                                                  ;B38939;
    ADC.W EnemyData.xSubPosition,X                                       ;B3893A;
    STA.W EnemyData.xSubPosition,X                                       ;B3893D;
    LDA.W #$0002                                                         ;B38940;
    ADC.W EnemyData.xPosition,X                                          ;B38943;
    STA.W EnemyData.xPosition,X                                          ;B38946;

.checkOnScreen:
    JSL.L CheckIfEnemyIsHorizontallyOffScreen                            ;B38949;
    BCS .respawn                                                         ;B3894D;
    RTL                                                                  ;B3894F;


.respawn:
    LDA.W EnemyData.work1,X                                              ;B38950;
    STA.W EnemyData.xPosition,X                                          ;B38953;
    STZ.W EnemyData.xSubPosition,X                                       ;B38956;
    LDA.W EnemyData.work2,X                                              ;B38959;
    STA.W EnemyData.yPosition,X                                          ;B3895C;
    STA.W EnemyData.ySubPosition,X                                       ;B3895F;
    STZ.W EnemyData.work4,X                                              ;B38962;
    JSR.W Set_Zeb_Zebbo_InstList                                         ;B38965;
    LDA.W EnemyData.properties,X                                         ;B38968;
    ORA.W #$0100                                                         ;B3896B;
    STA.W EnemyData.properties,X                                         ;B3896E;
    LDA.W #$0030                                                         ;B38971;
    STA.W EnemyData.work3,X                                              ;B38974;
    LDA.W #Function_Zeb_Zebbo_SpawnDelay                                 ;B38977;
    STA.W EnemyData.work5,X                                              ;B3897A;
    RTL                                                                  ;B3897D;


Function_Zeb_Zebbo_SpawnDelay:
    DEC.W EnemyData.work3,X                                              ;B3897E;
    BEQ .doneWaiting                                                     ;B38981;
    RTL                                                                  ;B38983;


.doneWaiting:
    LDA.W #Function_Zeb_Zebbo_WaitForSamusToGetNear                      ;B38984;
    STA.W EnemyData.work5,X                                              ;B38987;
    RTL                                                                  ;B3898A;


Set_Zeb_Zebbo_InstList:
    LDX.W $0E54                                                          ;B3898B;
    LDA.W EnemyData.work4,X                                              ;B3898E;
    CMP.L $7E7802,X                                                      ;B38991;
    BEQ .return                                                          ;B38995;
    STA.L $7E7802,X                                                      ;B38997;
    ASL A                                                                ;B3899B;
    TAY                                                                  ;B3899C;
    LDA.W EnemyData.initParam0,X                                         ;B3899D;
    BNE .zebbo                                                           ;B389A0;
    LDA.W InstListPointers_Zeb,Y                                         ;B389A2;
    BRA +                                                                ;B389A5;


.zebbo:
    LDA.W InstListPointers_Zebbo,Y                                       ;B389A7;

  + STA.W EnemyData.pInstList,X                                          ;B389AA;
    LDA.W #$0001                                                         ;B389AD;
    STA.W EnemyData.instTimer,X                                          ;B389B0;
    STZ.W EnemyData.loopCounter,X                                        ;B389B3;

.return:
    RTS                                                                  ;B389B6;


Spritemaps_Zeb_0:
    dw $0001,$81F8                                                       ;B389B7;
    db $F8                                                               ;B389BB;
    dw $2100                                                             ;B389BC;

Spritemaps_Zeb_1:
    dw $0001,$81F8                                                       ;B389BE;
    db $F8                                                               ;B389C2;
    dw $2102                                                             ;B389C3;

Spritemaps_Zeb_2:
    dw $0001,$81F8                                                       ;B389C5;
    db $F8                                                               ;B389C9;
    dw $2104                                                             ;B389CA;

Spritemaps_Zeb_3:
    dw $0001,$81F8                                                       ;B389CC;
    db $F8                                                               ;B389D0;
    dw $2106                                                             ;B389D1;

Spritemaps_Zeb_4:
    dw $0001,$81F8                                                       ;B389D3;
    db $F8                                                               ;B389D7;
    dw $2108                                                             ;B389D8;

Spritemaps_Zeb_5:
    dw $0001,$81F8                                                       ;B389DA;
    db $F8                                                               ;B389DE;
    dw $6100                                                             ;B389DF;

Spritemaps_Zeb_6:
    dw $0001,$81F8                                                       ;B389E1;
    db $F8                                                               ;B389E5;
    dw $6102                                                             ;B389E6;

Spritemaps_Zeb_7:
    dw $0001,$81F8                                                       ;B389E8;
    db $F8                                                               ;B389EC;
    dw $6104                                                             ;B389ED;

Spritemaps_Zeb_8:
    dw $0001,$81F8                                                       ;B389EF;
    db $F8                                                               ;B389F3;
    dw $6106                                                             ;B389F4;

Spritemaps_Zeb_9:
    dw $0001,$81F8                                                       ;B389F6;
    db $F8                                                               ;B389FA;
    dw $6108                                                             ;B389FB;

Palette_Zebbo:
    dw $3800,$3F95,$2E8B,$0120,$0060,$3AEE,$2249,$11A4                   ;B389FD;
    dw $0962,$39BB,$30F5,$2C6E,$2827,$7F93,$6ECE,$6229                   ;B38A0D;

InstList_Zebbo_FacingLeft_Rising:
    dw $0002                                                             ;B38A1D;
    dw Spritemaps_Zebbo_3                                                ;B38A1F;
    dw $0001                                                             ;B38A21;
    dw Spritemaps_Zebbo_4                                                ;B38A23;
    dw $0002                                                             ;B38A25;
    dw Spritemaps_Zebbo_5                                                ;B38A27;
    dw $0001                                                             ;B38A29;
    dw Spritemaps_Zebbo_4                                                ;B38A2B;
    dw Instruction_Common_GotoY                                          ;B38A2D;
    dw InstList_Zebbo_FacingLeft_Rising                                  ;B38A2F;

InstList_Zebbo_FacingLeft_Shooting:
    dw $0003                                                             ;B38A31;
    dw Spritemaps_Zebbo_0                                                ;B38A33;
    dw $0003                                                             ;B38A35;
    dw Spritemaps_Zebbo_1                                                ;B38A37;
    dw $0003                                                             ;B38A39;
    dw Spritemaps_Zebbo_2                                                ;B38A3B;
    dw $0003                                                             ;B38A3D;
    dw Spritemaps_Zebbo_1                                                ;B38A3F;
    dw Instruction_Common_GotoY                                          ;B38A41;
    dw InstList_Zebbo_FacingLeft_Shooting                                ;B38A43;

InstList_Zebbo_FacingRight_Rising:
    dw $0002                                                             ;B38A45;
    dw Spritemaps_Zebbo_9                                                ;B38A47;
    dw $0001                                                             ;B38A49;
    dw Spritemaps_Zebbo_A                                                ;B38A4B;
    dw $0002                                                             ;B38A4D;
    dw Spritemaps_Zebbo_B                                                ;B38A4F;
    dw $0001                                                             ;B38A51;
    dw Spritemaps_Zebbo_A                                                ;B38A53;
    dw Instruction_Common_GotoY                                          ;B38A55;
    dw InstList_Zebbo_FacingRight_Rising                                 ;B38A57;

InstList_Zebbo_FacingRight_Shooting:
    dw $0003                                                             ;B38A59;
    dw Spritemaps_Zebbo_6                                                ;B38A5B;
    dw $0003                                                             ;B38A5D;
    dw Spritemaps_Zebbo_7                                                ;B38A5F;
    dw $0003                                                             ;B38A61;
    dw Spritemaps_Zebbo_8                                                ;B38A63;
    dw $0003                                                             ;B38A65;
    dw Spritemaps_Zebbo_7                                                ;B38A67;
    dw Instruction_Common_GotoY                                          ;B38A69;
    dw InstList_Zebbo_FacingRight_Shooting                               ;B38A6B;

Spritemaps_Zebbo_0:
    dw $0001,$81F8                                                       ;B38A6D;
    db $F8                                                               ;B38A71;
    dw $2100                                                             ;B38A72;

Spritemaps_Zebbo_1:
    dw $0001,$81F8                                                       ;B38A74;
    db $F8                                                               ;B38A78;
    dw $2102                                                             ;B38A79;

Spritemaps_Zebbo_2:
    dw $0001,$81F8                                                       ;B38A7B;
    db $F8                                                               ;B38A7F;
    dw $2104                                                             ;B38A80;

Spritemaps_Zebbo_3:
    dw $0001,$81F8                                                       ;B38A82;
    db $F8                                                               ;B38A86;
    dw $2106                                                             ;B38A87;

Spritemaps_Zebbo_4:
    dw $0001,$81F8                                                       ;B38A89;
    db $F8                                                               ;B38A8D;
    dw $2108                                                             ;B38A8E;

Spritemaps_Zebbo_5:
    dw $0001,$81F8                                                       ;B38A90;
    db $F8                                                               ;B38A94;
    dw $210A                                                             ;B38A95;

Spritemaps_Zebbo_6:
    dw $0001,$81F8                                                       ;B38A97;
    db $F8                                                               ;B38A9B;
    dw $6100                                                             ;B38A9C;

Spritemaps_Zebbo_7:
    dw $0001,$81F8                                                       ;B38A9E;
    db $F8                                                               ;B38AA2;
    dw $6102                                                             ;B38AA3;

Spritemaps_Zebbo_8:
    dw $0001,$81F8                                                       ;B38AA5;
    db $F8                                                               ;B38AA9;
    dw $6104                                                             ;B38AAA;

Spritemaps_Zebbo_9:
    dw $0001,$81F8                                                       ;B38AAC;
    db $F8                                                               ;B38AB0;
    dw $6106                                                             ;B38AB1;

Spritemaps_Zebbo_A:
    dw $0001,$81F8                                                       ;B38AB3;
    db $F8                                                               ;B38AB7;
    dw $6108                                                             ;B38AB8;

Spritemaps_Zebbo_B:
    dw $0001,$81F8                                                       ;B38ABA;
    db $F8                                                               ;B38ABE;
    dw $610A                                                             ;B38ABF;

Palette_Gamet:
    dw $3800,$021D,$0015,$0008,$0003,$015F,$0076,$0050                   ;B38AC1;
    dw $000B,$7FFF,$56E0,$3180,$18C0,$43FF,$42DC,$4176                   ;B38AD1;

InstList_Gamet_FacingLeft_Rising:
    dw $0002                                                             ;B38AE1;
    dw Spritemaps_Gamet_0                                                ;B38AE3;
    dw $0002                                                             ;B38AE5;
    dw Spritemaps_Gamet_1                                                ;B38AE7;
    dw $0002                                                             ;B38AE9;
    dw Spritemaps_Gamet_2                                                ;B38AEB;
    dw $0002                                                             ;B38AED;
    dw Spritemaps_Gamet_3                                                ;B38AEF;
    dw $0002                                                             ;B38AF1;
    dw Spritemaps_Gamet_4                                                ;B38AF3;
    dw $0002                                                             ;B38AF5;
    dw Spritemaps_Gamet_3                                                ;B38AF7;
    dw $0002                                                             ;B38AF9;
    dw Spritemaps_Gamet_2                                                ;B38AFB;
    dw $0002                                                             ;B38AFD;
    dw Spritemaps_Gamet_1                                                ;B38AFF;
    dw Instruction_Common_GotoY                                          ;B38B01;
    dw InstList_Gamet_FacingLeft_Rising                                  ;B38B03;

InstList_Gamet_FacingLeft_Shooting:
    dw $0001                                                             ;B38B05;
    dw Spritemaps_Gamet_0                                                ;B38B07;
    dw $0001                                                             ;B38B09;
    dw Spritemaps_Gamet_1                                                ;B38B0B;
    dw $0001                                                             ;B38B0D;
    dw Spritemaps_Gamet_3                                                ;B38B0F;
    dw $0001                                                             ;B38B11;
    dw Spritemaps_Gamet_4                                                ;B38B13;
    dw $0001                                                             ;B38B15;
    dw Spritemaps_Gamet_3                                                ;B38B17;
    dw $0001                                                             ;B38B19;
    dw Spritemaps_Gamet_1                                                ;B38B1B;
    dw Instruction_Common_GotoY                                          ;B38B1D;
    dw InstList_Gamet_FacingLeft_Shooting                                ;B38B1F;

InstList_Gamet_FacingRight_Rising:
    dw $0002                                                             ;B38B21;
    dw Spritemaps_Gamet_5                                                ;B38B23;
    dw $0002                                                             ;B38B25;
    dw Spritemaps_Gamet_6                                                ;B38B27;
    dw $0002                                                             ;B38B29;
    dw Spritemaps_Gamet_7                                                ;B38B2B;
    dw $0002                                                             ;B38B2D;
    dw Spritemaps_Gamet_8                                                ;B38B2F;
    dw $0002                                                             ;B38B31;
    dw Spritemaps_Gamet_9                                                ;B38B33;
    dw $0002                                                             ;B38B35;
    dw Spritemaps_Gamet_8                                                ;B38B37;
    dw $0002                                                             ;B38B39;
    dw Spritemaps_Gamet_7                                                ;B38B3B;
    dw $0002                                                             ;B38B3D;
    dw Spritemaps_Gamet_6                                                ;B38B3F;
    dw Instruction_Common_GotoY                                          ;B38B41;
    dw InstList_Gamet_FacingRight_Rising                                 ;B38B43;

InstList_Gamet_FacingRight_Shooting:
    dw $0001                                                             ;B38B45;
    dw Spritemaps_Gamet_5                                                ;B38B47;
    dw $0001                                                             ;B38B49;
    dw Spritemaps_Gamet_6                                                ;B38B4B;
    dw $0001                                                             ;B38B4D;
    dw Spritemaps_Gamet_8                                                ;B38B4F;
    dw $0001                                                             ;B38B51;
    dw Spritemaps_Gamet_9                                                ;B38B53;
    dw $0001                                                             ;B38B55;
    dw Spritemaps_Gamet_8                                                ;B38B57;
    dw $0001                                                             ;B38B59;
    dw Spritemaps_Gamet_6                                                ;B38B5B;
    dw Instruction_Common_GotoY                                          ;B38B5D;
    dw InstList_Gamet_FacingRight_Shooting                               ;B38B5F;

InitAI_Gamet:
    LDX.W $0E54                                                          ;B38B61;
    LDA.W EnemyData.xPosition,X                                          ;B38B64;
    STA.W EnemyData.work3,X                                              ;B38B67;
    LDA.W EnemyData.yPosition,X                                          ;B38B6A;
    STA.W EnemyData.work4,X                                              ;B38B6D;
    LDA.W EnemyData.properties,X                                         ;B38B70;
    ORA.W #$0100                                                         ;B38B73;
    STA.W EnemyData.properties,X                                         ;B38B76;
    LDA.W EnemyData.initParam1+1,X                                       ;B38B79;
    AND.W #$00FF                                                         ;B38B7C;
    ASL A                                                                ;B38B7F;
    ASL A                                                                ;B38B80;
    ASL A                                                                ;B38B81;
    STA.W EnemyData.work1,X                                              ;B38B82;
    STZ.W EnemyData.work2,X                                              ;B38B85;
    LDA.W #$0001                                                         ;B38B88;
    STA.W EnemyData.instTimer,X                                          ;B38B8B;
    STZ.W EnemyData.loopCounter,X                                        ;B38B8E;
    LDA.W #InstList_Gamet_FacingLeft_Rising                              ;B38B91;
    STA.W EnemyData.pInstList,X                                          ;B38B94;
    LDA.W #Function_Gamet_WaitUntilAllReady                              ;B38B97;
    STA.W EnemyData.work0,X                                              ;B38B9A;
    RTL                                                                  ;B38B9D;


MainAI_Gamet:
    LDX.W $0E54                                                          ;B38B9E;
    JSR.W ($0FA8,X)                                                      ;B38BA1;
    JSR.W ResetEnemyIfOffScreen                                          ;B38BA4;
    RTL                                                                  ;B38BA7;


ResetEnemyIfOffScreen:
    LDX.W $0E54                                                          ;B38BA8;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;B38BAB;
    BEQ .return                                                          ;B38BAF;
    LDA.W EnemyData.properties,X                                         ;B38BB1;
    ORA.W #$0100                                                         ;B38BB4;
    STA.W EnemyData.properties,X                                         ;B38BB7;
    LDA.W #Function_Gamet_WaitUntilAllReady                              ;B38BBA;
    STA.W EnemyData.work0,X                                              ;B38BBD;
    LDA.W EnemyData.work3,X                                              ;B38BC0;
    STA.W EnemyData.xPosition,X                                          ;B38BC3;
    LDA.W EnemyData.work4,X                                              ;B38BC6;
    STA.W EnemyData.yPosition,X                                          ;B38BC9;

.return:
    RTS                                                                  ;B38BCC;


Function_Gamet_WaitUntilAllReady:
    LDX.W $0E54                                                          ;B38BCD;
    LDA.W EnemyData.initParam1,X                                         ;B38BD0;
    AND.W #$00FF                                                         ;B38BD3;
    BEQ .return                                                          ;B38BD6;
    LDA.W $0FE8,X                                                        ;B38BD8;
    CMP.W #Function_Gamet_WaitUntilAllReady                              ;B38BDB;
    BNE .return                                                          ;B38BDE;
    LDA.W $1028,X                                                        ;B38BE0;
    CMP.W #Function_Gamet_WaitUntilAllReady                              ;B38BE3;
    BNE .return                                                          ;B38BE6;
    LDA.W $1068,X                                                        ;B38BE8;
    CMP.W #Function_Gamet_WaitUntilAllReady                              ;B38BEB;
    BNE .return                                                          ;B38BEE;
    LDA.W $10A8,X                                                        ;B38BF0;
    CMP.W #Function_Gamet_WaitUntilAllReady                              ;B38BF3;
    BNE .return                                                          ;B38BF6;
    LDA.W #Function_Gamet_WaitForSamusToGetNear                          ;B38BF8;
    STA.W EnemyData.work0,X                                              ;B38BFB;

.return:
    RTS                                                                  ;B38BFE;


Function_Gamet_WaitForSamusToGetNear:
    LDX.W $0E54                                                          ;B38BFF;
    LDA.W EnemyData.initParam1,X                                         ;B38C02;
    AND.W #$00FF                                                         ;B38C05;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;B38C08;
    BEQ .return                                                          ;B38C0C;
    LDA.W EnemyData.yPosition,X                                          ;B38C0E;
    CMP.W $0AFA                                                          ;B38C11;
    BMI .return                                                          ;B38C14;
    INC.W EnemyData.work2,X                                              ;B38C16;
    LDA.W #$0001                                                         ;B38C19;
    STA.W EnemyData.instTimer,X                                          ;B38C1C;
    STZ.W EnemyData.loopCounter,X                                        ;B38C1F;
    JSL.L Get_SamusX_minus_EnemyX                                        ;B38C22;
    BPL .facingRight                                                     ;B38C26;
    LDA.W #InstList_Gamet_FacingLeft_Rising                              ;B38C28;
    STA.W EnemyData.pInstList,X                                          ;B38C2B;
    STA.W $0FD2,X                                                        ;B38C2E;
    STA.W $1012,X                                                        ;B38C31;
    STA.W $1052,X                                                        ;B38C34;
    STA.W $1092,X                                                        ;B38C37;
    BRA .setupFormation                                                  ;B38C3A;


.facingRight:
    LDA.W #InstList_Gamet_FacingRight_Rising                             ;B38C3C;
    STA.W EnemyData.pInstList,X                                          ;B38C3F;
    STA.W $0FD2,X                                                        ;B38C42;
    STA.W $1012,X                                                        ;B38C45;
    STA.W $1052,X                                                        ;B38C48;
    STA.W $1092,X                                                        ;B38C4B;

.setupFormation:
    JSR.W SetupGametFormation                                            ;B38C4E;

.return:
    RTS                                                                  ;B38C51;


SetupGametFormation:
    LDA.W #Function_Gamet_Rising                                         ;B38C52;
    STA.W EnemyData.work0,X                                              ;B38C55;
    STA.W $0FE8,X                                                        ;B38C58;
    STA.W $1028,X                                                        ;B38C5B;
    STA.W $1068,X                                                        ;B38C5E;
    STA.W $10A8,X                                                        ;B38C61;
    LDA.W #$0068                                                         ;B38C64;
    STA.L $7E7804,X                                                      ;B38C67;
    LDA.W #$0060                                                         ;B38C6B;
    STA.L $7E7844,X                                                      ;B38C6E;
    LDA.W #$0058                                                         ;B38C72;
    STA.L $7E7884,X                                                      ;B38C75;
    LDA.W #$0070                                                         ;B38C79;
    STA.L $7E78C4,X                                                      ;B38C7C;
    LDA.W #$0078                                                         ;B38C80;
    STA.L $7E7904,X                                                      ;B38C83;
    LDA.W #Function_Gamet_MoveToFormation_Center                         ;B38C87;
    STA.W EnemyData.work5,X                                              ;B38C8A;
    LDA.W #Function_Gamet_MoveToFormation_UpperMiddle                    ;B38C8D;
    STA.W $0FF2,X                                                        ;B38C90;
    LDA.W #Function_Gamet_MoveToFormation_Top                            ;B38C93;
    STA.W $1032,X                                                        ;B38C96;
    LDA.W #Function_Gamet_MoveToFormation_LowerMiddle                    ;B38C99;
    STA.W $1072,X                                                        ;B38C9C;
    LDA.W #Function_Gamet_MoveToFormation_Bottom                         ;B38C9F;
    STA.W $10B2,X                                                        ;B38CA2;
    RTS                                                                  ;B38CA5;


Function_Gamet_Rising:
    LDX.W $0E54                                                          ;B38CA6;
    LDA.W EnemyData.properties,X                                         ;B38CA9;
    AND.W #$FEFF                                                         ;B38CAC;
    STA.W EnemyData.properties,X                                         ;B38CAF;
    LDA.W #$0080                                                         ;B38CB2;
    TAY                                                                  ;B38CB5;
    LDA.W EnemyData.ySubPosition,X                                       ;B38CB6;
    CLC                                                                  ;B38CB9;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;B38CBA;
    BCC +                                                                ;B38CBD;
    INC.W EnemyData.yPosition,X                                          ;B38CBF;

  + STA.W EnemyData.ySubPosition,X                                       ;B38CC2;
    LDA.W EnemyData.yPosition,X                                          ;B38CC5;
    CLC                                                                  ;B38CC8;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;B38CC9;
    STA.W EnemyData.yPosition,X                                          ;B38CCC;
    CMP.W $0AFA                                                          ;B38CCF;
    BPL .return                                                          ;B38CD2;
    LDA.W EnemyData.work5,X                                              ;B38CD4;
    STA.W EnemyData.work0,X                                              ;B38CD7;
    LDA.W EnemyData.yPosition,X                                          ;B38CDA;
    STA.L $7E7802,X                                                      ;B38CDD;
    LDA.W #$0001                                                         ;B38CE1;
    STA.W EnemyData.instTimer,X                                          ;B38CE4;
    STZ.W EnemyData.loopCounter,X                                        ;B38CE7;
    JSL.L Get_SamusX_minus_EnemyX                                        ;B38CEA;
    BPL .facingRight                                                     ;B38CEE;
    LDA.W #InstList_Gamet_FacingLeft_Rising                              ;B38CF0;
    STA.W EnemyData.pInstList,X                                          ;B38CF3;
    BRA .return                                                          ;B38CF6;


.facingRight:
    LDA.W #InstList_Gamet_FacingRight_Rising                             ;B38CF8;
    STA.W EnemyData.pInstList,X                                          ;B38CFB;

.return:
    RTS                                                                  ;B38CFE;


Function_Gamet_MoveToFormation_Center:
    LDX.W $0E54                                                          ;B38CFF;
    INC.W EnemyData.work2,X                                              ;B38D02;
    LDA.W #Function_Gamet_ShootDelay                                     ;B38D05;
    STA.W EnemyData.work0,X                                              ;B38D08;
    RTS                                                                  ;B38D0B;


Function_Gamet_MoveToFormation_UpperMiddle:
    LDX.W $0E54                                                          ;B38D0C;
    INC.W EnemyData.work2,X                                              ;B38D0F;
    LDA.W #$0080                                                         ;B38D12;
    TAY                                                                  ;B38D15;
    LDA.W EnemyData.ySubPosition,X                                       ;B38D16;
    CLC                                                                  ;B38D19;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;B38D1A;
    BCC +                                                                ;B38D1D;
    INC.W EnemyData.yPosition,X                                          ;B38D1F;

  + STA.W EnemyData.ySubPosition,X                                       ;B38D22;
    LDA.W EnemyData.yPosition,X                                          ;B38D25;
    CLC                                                                  ;B38D28;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;B38D29;
    STA.W EnemyData.yPosition,X                                          ;B38D2C;
    CLC                                                                  ;B38D2F;
    ADC.W #$0010                                                         ;B38D30;
    CMP.L $7E7802,X                                                      ;B38D33;
    BPL .return                                                          ;B38D37;
    LDA.L $7E7802,X                                                      ;B38D39;
    SEC                                                                  ;B38D3D;
    SBC.W #$0010                                                         ;B38D3E;
    STA.W EnemyData.yPosition,X                                          ;B38D41;
    STZ.W EnemyData.ySubPosition,X                                       ;B38D44;
    LDA.W #Function_Gamet_ShootDelay                                     ;B38D47;
    STA.W EnemyData.work0,X                                              ;B38D4A;

.return:
    RTS                                                                  ;B38D4D;


Function_Gamet_MoveToFormation_Top:
    LDX.W $0E54                                                          ;B38D4E;
    INC.W EnemyData.work2,X                                              ;B38D51;
    LDA.W #$0080                                                         ;B38D54;
    TAY                                                                  ;B38D57;
    LDA.W EnemyData.ySubPosition,X                                       ;B38D58;
    CLC                                                                  ;B38D5B;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;B38D5C;
    BCC +                                                                ;B38D5F;
    INC.W EnemyData.yPosition,X                                          ;B38D61;

  + STA.W EnemyData.ySubPosition,X                                       ;B38D64;
    LDA.W EnemyData.yPosition,X                                          ;B38D67;
    CLC                                                                  ;B38D6A;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;B38D6B;
    STA.W EnemyData.yPosition,X                                          ;B38D6E;
    CLC                                                                  ;B38D71;
    ADC.W #$0020                                                         ;B38D72;
    CMP.L $7E7802,X                                                      ;B38D75;
    BPL .return                                                          ;B38D79;
    LDA.L $7E7802,X                                                      ;B38D7B;
    SEC                                                                  ;B38D7F;
    SBC.W #$0020                                                         ;B38D80;
    STA.W EnemyData.yPosition,X                                          ;B38D83;
    STZ.W EnemyData.ySubPosition,X                                       ;B38D86;
    LDA.W #Function_Gamet_ShootDelay                                     ;B38D89;
    STA.W EnemyData.work0,X                                              ;B38D8C;

.return:
    RTS                                                                  ;B38D8F;


Function_Gamet_MoveToFormation_LowerMiddle:
    LDX.W $0E54                                                          ;B38D90;
    INC.W EnemyData.work2,X                                              ;B38D93;
    LDA.W #$0080                                                         ;B38D96;
    TAY                                                                  ;B38D99;
    LDA.W EnemyData.ySubPosition,X                                       ;B38D9A;
    CLC                                                                  ;B38D9D;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;B38D9E;
    BCC +                                                                ;B38DA1;
    INC.W EnemyData.yPosition,X                                          ;B38DA3;

  + STA.W EnemyData.ySubPosition,X                                       ;B38DA6;
    LDA.W EnemyData.yPosition,X                                          ;B38DA9;
    CLC                                                                  ;B38DAC;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;B38DAD;
    STA.W EnemyData.yPosition,X                                          ;B38DB0;
    SEC                                                                  ;B38DB3;
    SBC.W #$0010                                                         ;B38DB4;
    CMP.L $7E7802,X                                                      ;B38DB7;
    BMI .return                                                          ;B38DBB;
    LDA.L $7E7802,X                                                      ;B38DBD;
    CLC                                                                  ;B38DC1;
    ADC.W #$0010                                                         ;B38DC2;
    STA.W EnemyData.yPosition,X                                          ;B38DC5;
    STZ.W EnemyData.ySubPosition,X                                       ;B38DC8;
    LDA.W #Function_Gamet_ShootDelay                                     ;B38DCB;
    STA.W EnemyData.work0,X                                              ;B38DCE;

.return:
    RTS                                                                  ;B38DD1;


Function_Gamet_MoveToFormation_Bottom:
    LDX.W $0E54                                                          ;B38DD2;
    INC.W EnemyData.work2,X                                              ;B38DD5;
    LDA.W #$0080                                                         ;B38DD8;
    TAY                                                                  ;B38DDB;
    LDA.W EnemyData.ySubPosition,X                                       ;B38DDC;
    CLC                                                                  ;B38DDF;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;B38DE0;
    BCC +                                                                ;B38DE3;
    INC.W EnemyData.yPosition,X                                          ;B38DE5;

  + STA.W EnemyData.ySubPosition,X                                       ;B38DE8;
    LDA.W EnemyData.yPosition,X                                          ;B38DEB;
    CLC                                                                  ;B38DEE;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;B38DEF;
    STA.W EnemyData.yPosition,X                                          ;B38DF2;
    SEC                                                                  ;B38DF5;
    SBC.W #$0020                                                         ;B38DF6;
    CMP.L $7E7802,X                                                      ;B38DF9;
    BMI .return                                                          ;B38DFD;
    LDA.L $7E7802,X                                                      ;B38DFF;
    CLC                                                                  ;B38E03;
    ADC.W #$0020                                                         ;B38E04;
    STA.W EnemyData.yPosition,X                                          ;B38E07;
    STZ.W EnemyData.ySubPosition,X                                       ;B38E0A;
    LDA.W #Function_Gamet_ShootDelay                                     ;B38E0D;
    STA.W EnemyData.work0,X                                              ;B38E10;

.return:
    RTS                                                                  ;B38E13;


Function_Gamet_ShootingLeft:
    LDX.W $0E54                                                          ;B38E14;
    LDA.W EnemyData.work1,X                                              ;B38E17;
    TAY                                                                  ;B38E1A;
    LDA.W EnemyData.xSubPosition,X                                       ;B38E1B;
    CLC                                                                  ;B38E1E;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;B38E1F;
    BCC +                                                                ;B38E22;
    INC.W EnemyData.xPosition,X                                          ;B38E24;

  + STA.W EnemyData.xSubPosition,X                                       ;B38E27;
    LDA.W EnemyData.xPosition,X                                          ;B38E2A;
    CLC                                                                  ;B38E2D;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;B38E2E;
    STA.W EnemyData.xPosition,X                                          ;B38E31;
    RTS                                                                  ;B38E34;


Function_Gamet_ShootingRight:
    LDX.W $0E54                                                          ;B38E35;
    LDA.W EnemyData.work1,X                                              ;B38E38;
    TAY                                                                  ;B38E3B;
    LDA.W EnemyData.xSubPosition,X                                       ;B38E3C;
    CLC                                                                  ;B38E3F;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;B38E40;
    BCC +                                                                ;B38E43;
    INC.W EnemyData.xPosition,X                                          ;B38E45;

  + STA.W EnemyData.xSubPosition,X                                       ;B38E48;
    LDA.W EnemyData.xPosition,X                                          ;B38E4B;
    CLC                                                                  ;B38E4E;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;B38E4F;
    STA.W EnemyData.xPosition,X                                          ;B38E52;
    RTS                                                                  ;B38E55;


UNUSED_LoadEnemyIndex_B38E56:
    LDX.W $0E54                                                          ;B38E56;
    RTS                                                                  ;B38E59;


Function_Gamet_ShootDelay:
    LDX.W $0E54                                                          ;B38E5A;
    INC.W EnemyData.work2,X                                              ;B38E5D;
    LDA.W EnemyData.work2,X                                              ;B38E60;
    CMP.L $7E7804,X                                                      ;B38E63;
    BMI .return                                                          ;B38E67;
    STZ.W EnemyData.work2,X                                              ;B38E69;
    LDA.W #$0001                                                         ;B38E6C;
    STA.W EnemyData.instTimer,X                                          ;B38E6F;
    STZ.W EnemyData.loopCounter,X                                        ;B38E72;
    LDA.W #Function_Gamet_ShootingLeft                                   ;B38E75;
    STA.W EnemyData.work0,X                                              ;B38E78;
    LDA.W #InstList_Gamet_FacingLeft_Shooting                            ;B38E7B;
    STA.W EnemyData.pInstList,X                                          ;B38E7E;
    JSL.L Get_SamusX_minus_EnemyX                                        ;B38E81;
    BMI .return                                                          ;B38E85;
    LDA.W #Function_Gamet_ShootingRight                                  ;B38E87;
    STA.W EnemyData.work0,X                                              ;B38E8A;
    LDA.W #InstList_Gamet_FacingRight_Shooting                           ;B38E8D;
    STA.W EnemyData.pInstList,X                                          ;B38E90;

.return:
    RTS                                                                  ;B38E93;


RTL_B38E94:
    RTL                                                                  ;B38E94;


RTL_B38E95:
    RTL                                                                  ;B38E95;


Spritemaps_Gamet_0:
    dw $0001,$81F8                                                       ;B38E96;
    db $F8                                                               ;B38E9A;
    dw $2100                                                             ;B38E9B;

Spritemaps_Gamet_1:
    dw $0001,$81F8                                                       ;B38E9D;
    db $F8                                                               ;B38EA1;
    dw $2102                                                             ;B38EA2;

Spritemaps_Gamet_2:
    dw $0001,$81F8                                                       ;B38EA4;
    db $F8                                                               ;B38EA8;
    dw $2104                                                             ;B38EA9;

Spritemaps_Gamet_3:
    dw $0001,$81F8                                                       ;B38EAB;
    db $F8                                                               ;B38EAF;
    dw $2106                                                             ;B38EB0;

Spritemaps_Gamet_4:
    dw $0001,$81F8                                                       ;B38EB2;
    db $F8                                                               ;B38EB6;
    dw $2108                                                             ;B38EB7;

Spritemaps_Gamet_5:
    dw $0001,$81F8                                                       ;B38EB9;
    db $F8                                                               ;B38EBD;
    dw $6100                                                             ;B38EBE;

Spritemaps_Gamet_6:
    dw $0001,$81F8                                                       ;B38EC0;
    db $F8                                                               ;B38EC4;
    dw $6102                                                             ;B38EC5;

Spritemaps_Gamet_7:
    dw $0001,$81F8                                                       ;B38EC7;
    db $F8                                                               ;B38ECB;
    dw $6104                                                             ;B38ECC;

Spritemaps_Gamet_8:
    dw $0001,$81F8                                                       ;B38ECE;
    db $F8                                                               ;B38ED2;
    dw $6106                                                             ;B38ED3;

Spritemaps_Gamet_9:
    dw $0001,$81F8                                                       ;B38ED5;
    db $F8                                                               ;B38ED9;
    dw $6108                                                             ;B38EDA;

Palette_Geega:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610                   ;B38EDC;
    dw $1DCE,$3FE0,$2EE0,$2200,$1100,$7E5B,$552F,$2887                   ;B38EEC;

InstList_Geega_FacingLeft_Rising:
    dw $0004                                                             ;B38EFC;
    dw Spritemaps_Geega_0                                                ;B38EFE;
    dw $0004                                                             ;B38F00;
    dw Spritemaps_Geega_1                                                ;B38F02;
    dw $0004                                                             ;B38F04;
    dw Spritemaps_Geega_2                                                ;B38F06;
    dw $0004                                                             ;B38F08;
    dw Spritemaps_Geega_1                                                ;B38F0A;
    dw Instruction_Common_GotoY                                          ;B38F0C;
    dw InstList_Geega_FacingLeft_Rising                                  ;B38F0E;

InstList_Geega_FacingLeft_Shooting:
    dw $0001                                                             ;B38F10;
    dw Spritemaps_Geega_3                                                ;B38F12;
    dw $0001                                                             ;B38F14;
    dw Spritemaps_Geega_4                                                ;B38F16;
    dw $0001                                                             ;B38F18;
    dw Spritemaps_Geega_5                                                ;B38F1A;
    dw $0001                                                             ;B38F1C;
    dw Spritemaps_Geega_4                                                ;B38F1E;
    dw Instruction_Common_GotoY                                          ;B38F20;
    dw InstList_Geega_FacingLeft_Shooting                                ;B38F22;

InstList_Geega_FacingRight_Rising:
    dw $0004                                                             ;B38F24;
    dw Spritemaps_Geega_6                                                ;B38F26;
    dw $0004                                                             ;B38F28;
    dw Spritemaps_Geega_7                                                ;B38F2A;
    dw $0004                                                             ;B38F2C;
    dw Spritemaps_Geega_8                                                ;B38F2E;
    dw $0004                                                             ;B38F30;
    dw Spritemaps_Geega_7                                                ;B38F32;
    dw Instruction_Common_GotoY                                          ;B38F34;
    dw InstList_Geega_FacingRight_Rising                                 ;B38F36;

InstList_Geega_FacingRight_Shooting:
    dw $0001                                                             ;B38F38;
    dw Spritemaps_Geega_9                                                ;B38F3A;
    dw $0001                                                             ;B38F3C;
    dw Spritemaps_Geega_A                                                ;B38F3E;
    dw $0001                                                             ;B38F40;
    dw Spritemaps_Geega_B                                                ;B38F42;
    dw $0001                                                             ;B38F44;
    dw Spritemaps_Geega_A                                                ;B38F46;
    dw Instruction_Common_GotoY                                          ;B38F48;
    dw InstList_Geega_FacingRight_Shooting                               ;B38F4A;

InitAI_Geega:
    LDX.W $0E54                                                          ;B38F4C;
    LDA.W EnemyData.xPosition,X                                          ;B38F4F;
    STA.L $7E780E,X                                                      ;B38F52;
    LDA.W EnemyData.yPosition,X                                          ;B38F56;
    STA.L $7E7810,X                                                      ;B38F59;
    STZ.W EnemyData.xSubPosition,X                                       ;B38F5D;
    STZ.W EnemyData.ySubPosition,X                                       ;B38F60;
    LDA.W #$0001                                                         ;B38F63;
    STA.W EnemyData.instTimer,X                                          ;B38F66;
    STZ.W EnemyData.loopCounter,X                                        ;B38F69;
    LDA.W #InstList_Geega_FacingLeft_Rising                              ;B38F6C;
    STA.W EnemyData.pInstList,X                                          ;B38F6F;
    LDA.W EnemyData.initParam0,X                                         ;B38F72;
    BNE +                                                                ;B38F75;
    LDA.W #InstList_Geega_FacingRight_Rising                             ;B38F77;
    STA.W EnemyData.pInstList,X                                          ;B38F7A;

  + LDA.W EnemyData.initParam1,X                                         ;B38F7D;
    ASL A                                                                ;B38F80;
    ASL A                                                                ;B38F81;
    ASL A                                                                ;B38F82;
    TAY                                                                  ;B38F83;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;B38F84;
    STA.L $7E7802,X                                                      ;B38F87;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;B38F8B;
    STA.L $7E7800,X                                                      ;B38F8E;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;B38F92;
    STA.L $7E7806,X                                                      ;B38F95;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;B38F99;
    STA.L $7E7804,X                                                      ;B38F9C;
    LDA.W #Function_Geega_WaitForSamusToGetNear                          ;B38FA0;
    STA.W EnemyData.work0,X                                              ;B38FA3;
    LDA.W #$0000                                                         ;B38FA6;
    STA.L $7E780C,X                                                      ;B38FA9;
    RTL                                                                  ;B38FAD;


MainAI_Geega:
    LDX.W $0E54                                                          ;B38FAE;
    JSR.W ($0FA8,X)                                                      ;B38FB1;
    RTL                                                                  ;B38FB4;


Function_Geega_WaitForSamusToGetNear:
    LDX.W $0E54                                                          ;B38FB5;
    LDA.W EnemyData.initParam0,X                                         ;B38FB8;
    BNE .leftwards                                                       ;B38FBB;
    JSL.L Get_SamusX_minus_EnemyX                                        ;B38FBD;
    BMI .return                                                          ;B38FC1;
    CMP.W #$00C0                                                         ;B38FC3;
    BPL .return                                                          ;B38FC6;
    BRA +                                                                ;B38FC8;


.leftwards:
    JSL.L Get_SamusX_minus_EnemyX                                        ;B38FCA;
    BPL .return                                                          ;B38FCE;
    CMP.W #$FF40                                                         ;B38FD0;
    BMI .return                                                          ;B38FD3;

  + LDA.W #$0030                                                         ;B38FD5;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;B38FD8;
    BEQ .return                                                          ;B38FDC;
    LDA.W EnemyData.properties,X                                         ;B38FDE;
    AND.W #$FEFF                                                         ;B38FE1;
    STA.W EnemyData.properties,X                                         ;B38FE4;
    LDA.W #$0018                                                         ;B38FE7;
    STA.L $7E8000,X                                                      ;B38FEA;
    LDA.W #Function_Geega_ShootDelay                                     ;B38FEE;
    STA.W EnemyData.work0,X                                              ;B38FF1;

.return:
    RTS                                                                  ;B38FF4;


Function_Geega_ShootDelay:
    LDA.L $7E8000,X                                                      ;B38FF5;
    DEC A                                                                ;B38FF9;
    STA.L $7E8000,X                                                      ;B38FFA;
    BEQ .timerExpired                                                    ;B38FFE;
    RTS                                                                  ;B39000;


.timerExpired:
    LDA.W #$0001                                                         ;B39001;
    STA.W EnemyData.instTimer,X                                          ;B39004;
    STZ.W EnemyData.loopCounter,X                                        ;B39007;
    LDA.W #InstList_Geega_FacingLeft_Rising                              ;B3900A;
    STA.W EnemyData.pInstList,X                                          ;B3900D;
    LDA.W #Function_Geega_ShootingLeft                                   ;B39010;
    STA.W EnemyData.work0,X                                              ;B39013;
    LDA.W EnemyData.initParam0,X                                         ;B39016;
    BNE .return                                                          ;B39019;
    LDA.W #InstList_Geega_FacingRight_Rising                             ;B3901B;
    STA.W EnemyData.pInstList,X                                          ;B3901E;
    LDA.W #Function_Geega_ShootingRight                                  ;B39021;
    STA.W EnemyData.work0,X                                              ;B39024;

.return:
    RTS                                                                  ;B39027;


Function_Geega_ShootingLeft:
    LDX.W $0E54                                                          ;B39028;
    JSR.W MoveGeegaLeft                                                  ;B3902B;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;B3902E;
    BEQ .onScreen                                                        ;B39032;
    LDA.L $7E780E,X                                                      ;B39034;
    STA.W EnemyData.xPosition,X                                          ;B39038;
    LDA.L $7E7810,X                                                      ;B3903B;
    STA.W EnemyData.yPosition,X                                          ;B3903F;
    STZ.W EnemyData.xSubPosition,X                                       ;B39042;
    STZ.W EnemyData.ySubPosition,X                                       ;B39045;
    LDA.W #Function_Geega_WaitForSamusToGetNear                          ;B39048;
    STA.W EnemyData.work0,X                                              ;B3904B;
    LDA.W #$0000                                                         ;B3904E;
    STA.L $7E780C,X                                                      ;B39051;
    LDA.W EnemyData.properties,X                                         ;B39055;
    ORA.W #$0100                                                         ;B39058;
    STA.W EnemyData.properties,X                                         ;B3905B;
    BRA .return                                                          ;B3905E;


.onScreen:
    LDA.L $7E780C,X                                                      ;B39060;
    BNE .return                                                          ;B39064;
    LDA.W EnemyData.xPosition,X                                          ;B39066;
    SEC                                                                  ;B39069;
    SBC.W $0AF6                                                          ;B3906A;
    CMP.W #$0030                                                         ;B3906D;
    BPL .return                                                          ;B39070;
    LDA.W #Function_Geega_DippingLeft                                    ;B39072;
    STA.W EnemyData.work0,X                                              ;B39075;
    STZ.W EnemyData.work2,X                                              ;B39078;
    STZ.W EnemyData.work3,X                                              ;B3907B;
    LDA.W #$0028                                                         ;B3907E;
    STA.W EnemyData.work4,X                                              ;B39081;
    LDA.W #$0001                                                         ;B39084;
    STA.W EnemyData.work5,X                                              ;B39087;
    LDA.W EnemyData.xPosition,X                                          ;B3908A;
    STA.L $7E7808,X                                                      ;B3908D;
    LDA.W #$0001                                                         ;B39091;
    STA.W EnemyData.instTimer,X                                          ;B39094;
    STZ.W EnemyData.loopCounter,X                                        ;B39097;
    LDA.W #InstList_Geega_FacingLeft_Shooting                            ;B3909A;
    STA.W EnemyData.pInstList,X                                          ;B3909D;

.return:
    RTS                                                                  ;B390A0;


MoveGeegaLeft:
    LDA.W EnemyData.xSubPosition,X                                       ;B390A1;
    CLC                                                                  ;B390A4;
    ADC.L $7E7804,X                                                      ;B390A5;
    BCC +                                                                ;B390A9;
    INC.W EnemyData.xPosition,X                                          ;B390AB;

  + STA.W EnemyData.xSubPosition,X                                       ;B390AE;
    LDA.W EnemyData.xPosition,X                                          ;B390B1;
    CLC                                                                  ;B390B4;
    ADC.L $7E7806,X                                                      ;B390B5;
    STA.W EnemyData.xPosition,X                                          ;B390B9;
    RTS                                                                  ;B390BC;


Function_Geega_ShootingRight:
    LDX.W $0E54                                                          ;B390BD;
    JSR.W MoveGeegaRight                                                 ;B390C0;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;B390C3;
    BEQ .onScreen                                                        ;B390C7;
    LDA.L $7E780E,X                                                      ;B390C9;
    STA.W EnemyData.xPosition,X                                          ;B390CD;
    LDA.L $7E7810,X                                                      ;B390D0;
    STA.W EnemyData.yPosition,X                                          ;B390D4;
    STZ.W EnemyData.xSubPosition,X                                       ;B390D7;
    STZ.W EnemyData.ySubPosition,X                                       ;B390DA;
    LDA.W #Function_Geega_WaitForSamusToGetNear                          ;B390DD;
    STA.W EnemyData.work0,X                                              ;B390E0;
    LDA.W #$0000                                                         ;B390E3;
    STA.L $7E780C,X                                                      ;B390E6;
    LDA.W EnemyData.properties,X                                         ;B390EA;
    ORA.W #$0100                                                         ;B390ED;
    STA.W EnemyData.properties,X                                         ;B390F0;
    BRA .return                                                          ;B390F3;


.onScreen:
    LDA.L $7E780C,X                                                      ;B390F5;
    BNE .return                                                          ;B390F9;
    LDA.W EnemyData.xPosition,X                                          ;B390FB;
    SEC                                                                  ;B390FE;
    SBC.W $0AF6                                                          ;B390FF;
    EOR.W #$FFFF                                                         ;B39102;
    INC A                                                                ;B39105;
    CMP.W #$0030                                                         ;B39106;
    BPL .return                                                          ;B39109;
    LDA.W #Function_Geega_DippingRight                                   ;B3910B;
    STA.W EnemyData.work0,X                                              ;B3910E;
    STZ.W EnemyData.work2,X                                              ;B39111;
    STZ.W EnemyData.work3,X                                              ;B39114;
    LDA.W #$0028                                                         ;B39117;
    STA.W EnemyData.work4,X                                              ;B3911A;
    LDA.W #$0001                                                         ;B3911D;
    STA.W EnemyData.work5,X                                              ;B39120;
    LDA.W EnemyData.xPosition,X                                          ;B39123;
    STA.L $7E7808,X                                                      ;B39126;
    LDA.W #$0001                                                         ;B3912A;
    STA.W EnemyData.instTimer,X                                          ;B3912D;
    STZ.W EnemyData.loopCounter,X                                        ;B39130;
    LDA.W #InstList_Geega_FacingRight_Shooting                           ;B39133;
    STA.W EnemyData.pInstList,X                                          ;B39136;

.return:
    RTS                                                                  ;B39139;


MoveGeegaRight:
    LDA.W EnemyData.work1,X                                              ;B3913A;
    TAY                                                                  ;B3913D;
    LDA.W EnemyData.xSubPosition,X                                       ;B3913E;
    CLC                                                                  ;B39141;
    ADC.L $7E7800,X                                                      ;B39142;
    BCC +                                                                ;B39146;
    INC.W EnemyData.xPosition,X                                          ;B39148;

  + STA.W EnemyData.xSubPosition,X                                       ;B3914B;
    LDA.W EnemyData.xPosition,X                                          ;B3914E;
    CLC                                                                  ;B39151;
    ADC.L $7E7802,X                                                      ;B39152;
    STA.W EnemyData.xPosition,X                                          ;B39156;
    RTS                                                                  ;B39159;


Function_Geega_DippingLeft:
    LDX.W $0E54                                                          ;B3915A;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;B3915D;
    BEQ .onScreen                                                        ;B39161;
    LDA.L $7E780E,X                                                      ;B39163;
    STA.W EnemyData.xPosition,X                                          ;B39167;
    LDA.L $7E7810,X                                                      ;B3916A;
    STA.W EnemyData.yPosition,X                                          ;B3916E;
    STZ.W EnemyData.xSubPosition,X                                       ;B39171;
    STZ.W EnemyData.ySubPosition,X                                       ;B39174;
    LDA.W #Function_Geega_WaitForSamusToGetNear                          ;B39177;
    STA.W EnemyData.work0,X                                              ;B3917A;
    LDA.W #$0000                                                         ;B3917D;
    STA.L $7E780C,X                                                      ;B39180;
    LDA.W #$0001                                                         ;B39184;
    STA.W EnemyData.instTimer,X                                          ;B39187;
    STZ.W EnemyData.loopCounter,X                                        ;B3918A;
    LDA.W #InstList_Geega_FacingLeft_Rising                              ;B3918D;
    STA.W EnemyData.pInstList,X                                          ;B39190;
    LDA.W EnemyData.properties,X                                         ;B39193;
    ORA.W #$0100                                                         ;B39196;
    STA.W EnemyData.properties,X                                         ;B39199;
    JMP.W .return                                                        ;B3919C;


.onScreen:
    JSR.W MoveGeegaLeft                                                  ;B3919F;
    LDA.W EnemyData.work5,X                                              ;B391A2;
    BNE .moveDown                                                        ;B391A5;
    JSR.W MoveGeegaUp                                                    ;B391A7;
    LDA.W EnemyData.yPosition,X                                          ;B391AA;
    CMP.L $7E7810,X                                                      ;B391AD;
    BPL .return                                                          ;B391B1;
    LDA.W #$0001                                                         ;B391B3;
    STA.L $7E780C,X                                                      ;B391B6;
    STA.W EnemyData.work5,X                                              ;B391BA;
    LDA.W #Function_Geega_ShootingLeft                                   ;B391BD;
    STA.W EnemyData.work0,X                                              ;B391C0;
    LDA.W #$0001                                                         ;B391C3;
    STA.W EnemyData.instTimer,X                                          ;B391C6;
    STZ.W EnemyData.loopCounter,X                                        ;B391C9;
    LDA.W #InstList_Geega_FacingLeft_Rising                              ;B391CC;
    STA.W EnemyData.pInstList,X                                          ;B391CF;
    BRA .return                                                          ;B391D2;


.moveDown:
    JSR.W MoveGeegaDown                                                  ;B391D4;

.return:
    RTS                                                                  ;B391D7;


Function_Geega_DippingRight:
    LDX.W $0E54                                                          ;B391D8;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;B391DB;
    BEQ .onScreen                                                        ;B391DF;
    LDA.L $7E780E,X                                                      ;B391E1;
    STA.W EnemyData.xPosition,X                                          ;B391E5;
    LDA.L $7E7810,X                                                      ;B391E8;
    STA.W EnemyData.yPosition,X                                          ;B391EC;
    STZ.W EnemyData.xSubPosition,X                                       ;B391EF;
    STZ.W EnemyData.ySubPosition,X                                       ;B391F2;
    LDA.W #Function_Geega_WaitForSamusToGetNear                          ;B391F5;
    STA.W EnemyData.work0,X                                              ;B391F8;
    LDA.W #$0000                                                         ;B391FB;
    STA.L $7E780C,X                                                      ;B391FE;
    LDA.W #$0001                                                         ;B39202;
    STA.W EnemyData.instTimer,X                                          ;B39205;
    STZ.W EnemyData.loopCounter,X                                        ;B39208;
    LDA.W #InstList_Geega_FacingRight_Rising                             ;B3920B;
    STA.W EnemyData.pInstList,X                                          ;B3920E;
    LDA.W EnemyData.properties,X                                         ;B39211;
    ORA.W #$0100                                                         ;B39214;
    STA.W EnemyData.properties,X                                         ;B39217;
    JMP.W .return                                                        ;B3921A;


.onScreen:
    JSR.W MoveGeegaRight                                                 ;B3921D;
    LDA.W EnemyData.work5,X                                              ;B39220;
    BNE .moveDown                                                        ;B39223;
    JSR.W MoveGeegaUp                                                    ;B39225;
    LDA.L $7E7810,X                                                      ;B39228;
    CMP.W EnemyData.yPosition,X                                          ;B3922C;
    BMI .return                                                          ;B3922F;
    LDA.W #$0001                                                         ;B39231;
    STA.L $7E780C,X                                                      ;B39234;
    STA.W EnemyData.work5,X                                              ;B39238;
    LDA.W #$0001                                                         ;B3923B;
    STA.W EnemyData.instTimer,X                                          ;B3923E;
    STZ.W EnemyData.loopCounter,X                                        ;B39241;
    LDA.W #InstList_Geega_FacingRight_Rising                             ;B39244;
    STA.W EnemyData.pInstList,X                                          ;B39247;
    LDA.W #Function_Geega_ShootingRight                                  ;B3924A;
    STA.W EnemyData.work0,X                                              ;B3924D;
    BRA .return                                                          ;B39250;


.moveDown:
    JSR.W MoveGeegaDown                                                  ;B39252;

.return:
    RTS                                                                  ;B39255;


MoveGeegaUp:
    INC.W EnemyData.work4,X                                              ;B39256;
    LDA.W EnemyData.work4,X                                              ;B39259;
    ASL A                                                                ;B3925C;
    ASL A                                                                ;B3925D;
    ASL A                                                                ;B3925E;
    TAY                                                                  ;B3925F;
    LDA.W EnemyData.ySubPosition,X                                       ;B39260;
    CLC                                                                  ;B39263;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;B39264;
    BCC +                                                                ;B39267;
    INC.W EnemyData.yPosition,X                                          ;B39269;

  + STA.W EnemyData.ySubPosition,X                                       ;B3926C;
    LDA.W EnemyData.yPosition,X                                          ;B3926F;
    CLC                                                                  ;B39272;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;B39273;
    STA.W EnemyData.yPosition,X                                          ;B39276;
    RTS                                                                  ;B39279;


MoveGeegaDown:
    DEC.W EnemyData.work4,X                                              ;B3927A;
    BPL +                                                                ;B3927D;
    LDA.W #$0000                                                         ;B3927F;
    STA.W EnemyData.work4,X                                              ;B39282;
    STA.W EnemyData.work5,X                                              ;B39285;
    BRA .return                                                          ;B39288;


  + LDA.W EnemyData.work4,X                                              ;B3928A;
    ASL A                                                                ;B3928D;
    ASL A                                                                ;B3928E;
    ASL A                                                                ;B3928F;
    TAY                                                                  ;B39290;
    LDA.W EnemyData.ySubPosition,X                                       ;B39291;
    CLC                                                                  ;B39294;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;B39295;
    BCC +                                                                ;B39298;
    INC.W EnemyData.yPosition,X                                          ;B3929A;

  + STA.W EnemyData.ySubPosition,X                                       ;B3929D;
    LDA.W EnemyData.yPosition,X                                          ;B392A0;
    CLC                                                                  ;B392A3;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;B392A4;
    STA.W EnemyData.yPosition,X                                          ;B392A7;

.return:
    RTS                                                                  ;B392AA;


RTL_B392AB:
    RTL                                                                  ;B392AB;


RTL_B392AC:
    RTL                                                                  ;B392AC;


Spritemaps_Geega_0:
    db $01,$00,$F8,$C3,$F8,$00,$21                                       ;B392AD;

Spritemaps_Geega_1:
    db $01,$00,$F8,$C3,$F8,$02,$21                                       ;B392B4;

Spritemaps_Geega_2:
    db $01,$00,$F8,$C3,$F8,$04,$21                                       ;B392BB;

Spritemaps_Geega_3:
    db $01,$00,$F8,$C3,$F8,$06,$21                                       ;B392C2;

Spritemaps_Geega_4:
    db $01,$00,$F8,$C3,$F8,$08,$21                                       ;B392C9;

Spritemaps_Geega_5:
    db $01,$00,$F8,$C3,$F8,$0A,$21                                       ;B392D0;

Spritemaps_Geega_6:
    db $01,$00,$F8,$C3,$F8,$00,$61                                       ;B392D7;

Spritemaps_Geega_7:
    db $01,$00,$F8,$C3,$F8,$02,$61                                       ;B392DE;

Spritemaps_Geega_8:
    db $01,$00,$F8,$C3,$F8,$04,$61                                       ;B392E5;

Spritemaps_Geega_9:
    db $01,$00,$F8,$C3,$F8,$06,$61                                       ;B392EC;

Spritemaps_Geega_A:
    db $01,$00,$F8,$C3,$F8,$08,$61                                       ;B392F3;

Spritemaps_Geega_B:
    db $01,$00,$F8,$C3,$F8,$0A,$61                                       ;B392FA;

UNUSED_SpritemapPointers_Geega_B39301:
    dw Spritemaps_Geega_0                                                ;B39301;
    dw Spritemaps_Geega_1                                                ;B39303;
    dw Spritemaps_Geega_2                                                ;B39305;
    dw Spritemaps_Geega_3                                                ;B39307;
    dw Spritemaps_Geega_4                                                ;B39309;
    dw Spritemaps_Geega_5                                                ;B3930B;
    dw Spritemaps_Geega_6                                                ;B3930D;
    dw Spritemaps_Geega_7                                                ;B3930F;
    dw Spritemaps_Geega_8                                                ;B39311;
    dw Spritemaps_Geega_9                                                ;B39313;
    dw Spritemaps_Geega_A                                                ;B39315;
    dw Spritemaps_Geega_B                                                ;B39317;

Palette_Botwoon:
    dw $0000,$27E9,$1A66,$1585,$0CA3,$3F9C,$2E97,$1D72                   ;B39319;
    dw $108E,$0A5F,$09DB,$0956,$08D2,$082C,$7FBD,$0C05                   ;B39329;

InstList_Botwoon_MouthClosed_AimingUp_FacingLeft:
    dw Instruction_Botwoon_EnemyRadius_8x10                              ;B39339;
    dw $0001                                                             ;B3933B;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft      ;B3933D;
    dw Instruction_Common_Sleep                                          ;B3933F;

InstList_Botwoon_MouthClosed_AimingUpLeft:
    dw Instruction_Botwoon_EnemyRadius_CxC                               ;B39341;
    dw $0001                                                             ;B39343;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft             ;B39345;
    dw Instruction_Common_Sleep                                          ;B39347;

InstList_Botwoon_MouthClosed_AimingLeft:
    dw Instruction_Botwoon_EnemyRadius_10x8                              ;B39349;
    dw $0001                                                             ;B3934B;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft               ;B3934D;
    dw Instruction_Common_Sleep                                          ;B3934F;

InstList_Botwoon_MouthClosed_AimingDownLeft:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate                     ;B39351;
    dw $0001                                                             ;B39353;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft           ;B39355;
    dw Instruction_Common_Sleep                                          ;B39357;

UNSUED_InstList_Botwoon_MouthClosed_AimDown_FaceLeft_B39359:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate                    ;B39359;
    dw $0001                                                             ;B3935B;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft       ;B3935D;
    dw Instruction_Common_Sleep                                          ;B3935F;

InstList_Botwoon_MouthClosed_AimingDown_FacingRight:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again              ;B39361;
    dw $0001                                                             ;B39363;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight      ;B39365;
    dw Instruction_Common_Sleep                                          ;B39367;

InstList_Botwoon_MouthClosed_AimingDownRight:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again               ;B39369;
    dw $0001                                                             ;B3936B;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight          ;B3936D;
    dw Instruction_Common_Sleep                                          ;B3936F;

InstList_Botwoon_MouthClosed_AimingRight:
    dw Instruction_Botwoon_EnemyRadius_10x8_duplicate                    ;B39371;
    dw $0001                                                             ;B39373;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight              ;B39375;
    dw Instruction_Common_Sleep                                          ;B39377;

InstList_Botwoon_MouthClosed_AimingUpRight:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2              ;B39379;
    dw $0001                                                             ;B3937B;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight            ;B3937D;
    dw Instruction_Common_Sleep                                          ;B3937F;

InstList_Botwoon_MouthClosed_AimingUp_FacingRight:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2             ;B39381;
    dw $0001                                                             ;B39383;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight        ;B39385;
    dw Instruction_Common_Sleep                                          ;B39387;

InstList_Botwoon_Hide:
    dw $0001                                                             ;B39389;
    dw Spritemap_Common_Nothing                                          ;B3938B;
    dw Instruction_Common_Sleep                                          ;B3938D;

UNSUED_InstList_Botwoon_Spit_AimingUp_FacingLeft:
    dw $0020                                                             ;B3938F;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft      ;B39391;
    dw Instruction_Botwoon_EnemyRadius_8x10                              ;B39393;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B39395;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B39397;
    dw $0010                                                             ;B39399;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingLeft        ;B3939B;
    dw Instruction_Common_Sleep                                          ;B3939D;

InstList_Botwoon_Spit_AimingUpLeft:
    dw $0020                                                             ;B3939F;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft             ;B393A1;
    dw Instruction_Botwoon_EnemyRadius_CxC                               ;B393A3;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B393A5;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B393A7;
    dw $0010                                                             ;B393A9;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpLeft               ;B393AB;
    dw Instruction_Common_Sleep                                          ;B393AD;

InstList_Botwoon_Spit_AimingLeft:
    dw $0020                                                             ;B393AF;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft               ;B393B1;
    dw Instruction_Botwoon_EnemyRadius_10x8                              ;B393B3;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B393B5;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B393B7;
    dw $0019                                                             ;B393B9;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingLeft                 ;B393BB;
    dw Instruction_Common_Sleep                                          ;B393BD;

InstList_Botwoon_Spit_AimingDownLeft:
    dw $0020                                                             ;B393BF;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft           ;B393C1;
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate                     ;B393C3;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B393C5;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B393C7;
    dw $0010                                                             ;B393C9;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownLeft             ;B393CB;
    dw Instruction_Common_Sleep                                          ;B393CD;

UNUSED_InstList_Botwoon_Spit_AimingDown_FacingLeft_B393CF:
    dw $0020                                                             ;B393CF;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft       ;B393D1;
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate                    ;B393D3;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B393D5;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B393D7;
    dw $0010                                                             ;B393D9;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingDown_FacingLeft      ;B393DB;
    dw Instruction_Common_Sleep                                          ;B393DD;

InstList_Botwoon_Spit_AimingDown_FacingRight:
    dw $0020                                                             ;B393DF;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight      ;B393E1;
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again              ;B393E3;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B393E5;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B393E7;
    dw $0010                                                             ;B393E9;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimDown_FacingRight        ;B393EB;
    dw Instruction_Common_Sleep                                          ;B393ED;

InstList_Botwoon_Spit_AimingDownRight:
    dw $0020                                                             ;B393EF;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight          ;B393F1;
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again               ;B393F3;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B393F5;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B393F7;
    dw $0010                                                             ;B393F9;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownRight            ;B393FB;
    dw Instruction_Common_Sleep                                          ;B393FD;

InstList_Botwoon_Spit_AimingRight:
    dw $0020                                                             ;B393FF;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight              ;B39401;
    dw Instruction_Botwoon_EnemyRadius_10x8_duplicate                    ;B39403;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B39405;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B39407;
    dw $0010                                                             ;B39409;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingRight                ;B3940B;
    dw Instruction_Common_Sleep                                          ;B3940D;

InstList_Botwoon_Spit_AimingUpRight:
    dw $0020                                                             ;B3940F;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight            ;B39411;
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2              ;B39413;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B39415;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B39417;
    dw $0010                                                             ;B39419;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpRight              ;B3941B;
    dw Instruction_Common_Sleep                                          ;B3941D;

InstList_Botwoon_Spit_AimingUp_FacingRight:
    dw $0020                                                             ;B3941F;
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight        ;B39421;
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2             ;B39423;
    dw Instruction_Botwoon_QueueSpitSFX                                  ;B39425;
    dw Instruction_Botwoon_SetSpittingFlag                               ;B39427;
    dw $0010                                                             ;B39429;
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingRight       ;B3942B;
    dw Instruction_Common_Sleep                                          ;B3942D;

UNUSED_InstList_Botwoon_Hidden_AimingUp_FacingLeft_B3942F:
    dw $0001                                                             ;B3942F;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingUp_FacingLeft      ;B39431;
    dw Instruction_Common_Sleep                                          ;B39433;

InstList_Botwoon_Hidden_AimingUpLeft:
    dw $0001                                                             ;B39435;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpLeft             ;B39437;
    dw Instruction_Common_Sleep                                          ;B39439;

InstList_Botwoon_Hidden_AimingLeft:
    dw $0001                                                             ;B3943B;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingLeft               ;B3943D;
    dw Instruction_Common_Sleep                                          ;B3943F;

InstList_Botwoon_Hidden_AimingDownLeft:
    dw $0001                                                             ;B39441;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownLeft           ;B39443;
    dw Instruction_Common_Sleep                                          ;B39445;

UNUSED_InstList_Botwoon_Hidden_AimingDown_FacingLeft_B39447:
    dw $0001                                                             ;B39447;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingLeft       ;B39449;
    dw Instruction_Common_Sleep                                          ;B3944B;

InstList_Botwoon_Hidden_AimingDown_FacingRight:
    dw $0001                                                             ;B3944D;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingRight      ;B3944F;
    dw Instruction_Common_Sleep                                          ;B39451;

InstList_Botwoon_Hidden_AimingDownRight:
    dw $0001                                                             ;B39453;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownRight          ;B39455;
    dw Instruction_Common_Sleep                                          ;B39457;

InstList_Botwoon_Hidden_AimingRight:
    dw $0001                                                             ;B39459;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingRight              ;B3945B;
    dw Instruction_Common_Sleep                                          ;B3945D;

InstList_Botwoon_Hidden_AimingUpRight:
    dw $0001                                                             ;B3945F;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpRight            ;B39461;
    dw Instruction_Common_Sleep                                          ;B39463;

InstList_Botwoon_Hidden_AimingUp_FacingRIght:
    dw $0001                                                             ;B39465;
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimUp_FacingRight        ;B39467;
    dw Instruction_Common_Sleep                                          ;B39469;

InstListPointers_Botwoon:
    dw InstList_Botwoon_MouthClosed_AimingUp_FacingRight                 ;B3946B;
    dw InstList_Botwoon_MouthClosed_AimingUpRight                        ;B3946D;
    dw InstList_Botwoon_MouthClosed_AimingRight                          ;B3946F;
    dw InstList_Botwoon_MouthClosed_AimingDownRight                      ;B39471;
    dw InstList_Botwoon_MouthClosed_AimingDown_FacingRight               ;B39473;
    dw InstList_Botwoon_MouthClosed_AimingDownLeft                       ;B39475;
    dw InstList_Botwoon_MouthClosed_AimingLeft                           ;B39477;
    dw InstList_Botwoon_MouthClosed_AimingUpLeft                         ;B39479;
    dw InstList_Botwoon_Hide                                             ;B3947B;
    dw InstList_Botwoon_Hide                                             ;B3947D;
    dw InstList_Botwoon_Hide                                             ;B3947F;
    dw InstList_Botwoon_Hide                                             ;B39481;
    dw InstList_Botwoon_Hide                                             ;B39483;
    dw InstList_Botwoon_Hide                                             ;B39485;
    dw InstList_Botwoon_Hide                                             ;B39487;
    dw InstList_Botwoon_Hide                                             ;B39489;

InstListPointers_Botwoon_spit:
    dw InstList_Botwoon_Spit_AimingUp_FacingRight                        ;B3948B;
    dw InstList_Botwoon_Spit_AimingUpRight                               ;B3948D;
    dw InstList_Botwoon_Spit_AimingRight                                 ;B3948F;
    dw InstList_Botwoon_Spit_AimingDownRight                             ;B39491;
    dw InstList_Botwoon_Spit_AimingDown_FacingRight                      ;B39493;
    dw InstList_Botwoon_Spit_AimingDownLeft                              ;B39495;
    dw InstList_Botwoon_Spit_AimingLeft                                  ;B39497;
    dw InstList_Botwoon_Spit_AimingUpLeft                                ;B39499;

BotwoonHoleHitboxes_leftBoundary:
    dw $003C                                                             ;B3949B;

BotwoonHoleHitboxes_rightBoundary:
    dw $0044                                                             ;B3949D;

BotwoonHoleHitboxes_topBoundary:
    dw $006C                                                             ;B3949F;

BotwoonHoleHitboxes_bottomBoundary:
    dw $0074,$007C,$0084,$00AC,$00B4,$009C,$00A4,$005C                   ;B394A1;
    dw $0064,$00DC,$00E4,$008C,$0094                                     ;B394B1;

BotwoonSpeedTable_speed:
    dw $0002                                                             ;B394BB;

BotwoonSpeedTable_bodyTravelTime:
    dw $0018,$0003,$0010,$0004,$000C                                     ;B394BD;

Instruction_Botwoon_EnemyRadius_8x10:
    LDX.W $0E54                                                          ;B394C7;
    LDA.W #$0008                                                         ;B394CA;
    STA.W EnemyData.xHitboxRadius,X                                      ;B394CD;
    LDA.W #$0010                                                         ;B394D0;
    STA.W EnemyData.yHitboxRadius,X                                      ;B394D3;
    RTL                                                                  ;B394D6;


Instruction_Botwoon_EnemyRadius_CxC:
    LDX.W $0E54                                                          ;B394D7;
    LDA.W #$000C                                                         ;B394DA;
    STA.W EnemyData.xHitboxRadius,X                                      ;B394DD;
    LDA.W #$000C                                                         ;B394E0;
    STA.W EnemyData.yHitboxRadius,X                                      ;B394E3;
    RTL                                                                  ;B394E6;


Instruction_Botwoon_EnemyRadius_10x8:
    LDX.W $0E54                                                          ;B394E7;
    LDA.W #$0010                                                         ;B394EA;
    STA.W EnemyData.xHitboxRadius,X                                      ;B394ED;
    LDA.W #$0008                                                         ;B394F0;
    STA.W EnemyData.yHitboxRadius,X                                      ;B394F3;
    RTL                                                                  ;B394F6;


Instruction_Botwoon_EnemyRadius_CxC_duplicate:
    LDX.W $0E54                                                          ;B394F7;
    LDA.W #$000C                                                         ;B394FA;
    STA.W EnemyData.xHitboxRadius,X                                      ;B394FD;
    LDA.W #$000C                                                         ;B39500;
    STA.W EnemyData.yHitboxRadius,X                                      ;B39503;
    RTL                                                                  ;B39506;


Instruction_Botwoon_EnemyRadius_8x10_duplicate:
    LDX.W $0E54                                                          ;B39507;
    LDA.W #$0008                                                         ;B3950A;
    STA.W EnemyData.xHitboxRadius,X                                      ;B3950D;
    LDA.W #$0010                                                         ;B39510;
    STA.W EnemyData.yHitboxRadius,X                                      ;B39513;
    RTL                                                                  ;B39516;


Instruction_Botwoon_EnemyRadius_8x10_duplicate_again:
    LDX.W $0E54                                                          ;B39517;
    LDA.W #$0008                                                         ;B3951A;
    STA.W EnemyData.xHitboxRadius,X                                      ;B3951D;
    LDA.W #$0010                                                         ;B39520;
    STA.W EnemyData.yHitboxRadius,X                                      ;B39523;
    RTL                                                                  ;B39526;


Instruction_Botwoon_EnemyRadius_CxC_duplicate_again:
    LDX.W $0E54                                                          ;B39527;
    LDA.W #$000C                                                         ;B3952A;
    STA.W EnemyData.xHitboxRadius,X                                      ;B3952D;
    LDA.W #$000C                                                         ;B39530;
    STA.W EnemyData.yHitboxRadius,X                                      ;B39533;
    RTL                                                                  ;B39536;


Instruction_Botwoon_EnemyRadius_10x8_duplicate:
    LDX.W $0E54                                                          ;B39537;
    LDA.W #$0010                                                         ;B3953A;
    STA.W EnemyData.xHitboxRadius,X                                      ;B3953D;
    LDA.W #$0008                                                         ;B39540;
    STA.W EnemyData.yHitboxRadius,X                                      ;B39543;
    RTL                                                                  ;B39546;


Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2:
    LDX.W $0E54                                                          ;B39547;
    LDA.W #$000C                                                         ;B3954A;
    STA.W EnemyData.xHitboxRadius,X                                      ;B3954D;
    LDA.W #$000C                                                         ;B39550;
    STA.W EnemyData.yHitboxRadius,X                                      ;B39553;
    RTL                                                                  ;B39556;


Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2:
    LDX.W $0E54                                                          ;B39557;
    LDA.W #$0008                                                         ;B3955A;
    STA.W EnemyData.xHitboxRadius,X                                      ;B3955D;
    LDA.W #$0010                                                         ;B39560;
    STA.W EnemyData.yHitboxRadius,X                                      ;B39563;
    RTL                                                                  ;B39566;


Instruction_Botwoon_SetSpittingFlag:
    LDX.W $0E54                                                          ;B39567;
    LDA.W #$0001                                                         ;B3956A;
    STA.L $7E8834,X                                                      ;B3956D;
    RTL                                                                  ;B39571;


Instruction_Botwoon_QueueSpitSFX:
    LDA.W #$007C                                                         ;B39572;
    JSL.L QueueSound_Lib2_Max6                                           ;B39575;
    RTL                                                                  ;B39579;


RTL_B3957A:
    RTL                                                                  ;B3957A;


QueueSmallExplosionSFX:
    LDA.W #$0024                                                         ;B3957B;
    JSL.L QueueSound_Lib2_Max6                                           ;B3957E;
    RTL                                                                  ;B39582;


InitAI_Botwoon:
    LDA.L $7ED82C                                                        ;B39583;
    AND.W #$0002                                                         ;B39587;
    BEQ .notDead                                                         ;B3958A;
    LDX.W $0E54                                                          ;B3958C;
    JSL.L Spawn_Hardcoded_PLM                                            ;B3958F;
    db $0F,$04                                                           ;B39593;
    dw PLMEntries_clearBotwoonWall                                       ;B39595;
    LDA.W #$0101                                                         ;B39597;
    STA.L $7ECD20                                                        ;B3959A;
    LDA.W #InstList_Botwoon_Hide                                         ;B3959E;
    STA.W EnemyData.pInstList,X                                          ;B395A1;
    LDA.W EnemyData.properties,X                                         ;B395A4;
    ORA.W #$0200                                                         ;B395A7;
    STA.W EnemyData.properties,X                                         ;B395AA;
    JMP.W .return                                                        ;B395AD;


.notDead:
    LDX.W $0E54                                                          ;B395B0;
    LDA.W #$0018                                                         ;B395B3;
    STA.W EnemyData.work0,X                                              ;B395B6;

.loop:
    LDY.W #EnemyProjectile_BotwoonsBody                                  ;B395B9;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;B395BC;
    LDX.W $0E54                                                          ;B395C0;
    DEC.W EnemyData.work0,X                                              ;B395C3;
    DEC.W EnemyData.work0,X                                              ;B395C6;
    BPL .loop                                                            ;B395C9;
    LDA.W #InstList_Botwoon_Hide                                         ;B395CB;
    STA.W EnemyData.pInstList,X                                          ;B395CE;
    STA.L $7E8036,X                                                      ;B395D1;
    LDA.W #Function_Botwoon_Initial                                      ;B395D5;
    STA.W EnemyData.work3,X                                              ;B395D8;
    LDA.W #Function_Botwoon_Movement_DirectlyTowardTargetHole            ;B395DB;
    STA.W EnemyData.work4,X                                              ;B395DE;
    LDA.W #Function_Botwoon_Head_MovingAround                            ;B395E1;
    STA.W EnemyData.work5,X                                              ;B395E4;
    LDA.W #$0100                                                         ;B395E7;
    STA.L $7E8000,X                                                      ;B395EA;
    LDA.W BotwoonSpeedTable_speed                                        ;B395EE;
    STA.L $7E8030,X                                                      ;B395F1;
    LDA.W BotwoonSpeedTable_bodyTravelTime                               ;B395F5;
    STA.W EnemyData.work2,X                                              ;B395F8;
    LDA.W #$0001                                                         ;B395FB;
    STA.L $7E8026,X                                                      ;B395FE;
    STA.L $7E8028,X                                                      ;B39602;
    STA.L $7E8832,X                                                      ;B39606;
    LDA.W #$FFFF                                                         ;B3960A;
    STA.L $7E802C,X                                                      ;B3960D;
    LDA.W #$0000                                                         ;B39611;
    STA.L $7E802E,X                                                      ;B39614;
    LDA.W EnemyData.properties,X                                         ;B39618;
    ORA.W #$0400                                                         ;B3961B;
    STA.W EnemyData.properties,X                                         ;B3961E;
    LDA.W EnemyData.health,X                                             ;B39621;
    STA.L $7E8836,X                                                      ;B39624;
    LSR A                                                                ;B39628;
    STA.L $7E8838,X                                                      ;B39629;
    LSR A                                                                ;B3962D;
    STA.L $7E883A,X                                                      ;B3962E;
    LDA.W EnemyData.xPosition,X                                          ;B39632;
    STA.L $7E8820,X                                                      ;B39635;
    STA.L $7E8824,X                                                      ;B39639;
    STA.L $7E8828,X                                                      ;B3963D;
    STA.L $7E882C,X                                                      ;B39641;
    LDA.W EnemyData.yPosition,X                                          ;B39645;
    STA.L $7E8822,X                                                      ;B39648;
    STA.L $7E8826,X                                                      ;B3964C;
    STA.L $7E882A,X                                                      ;B39650;
    STA.L $7E882E,X                                                      ;B39654;
    LDA.W EnemyData.palette,X                                            ;B39658;
    LSR A                                                                ;B3965B;
    LSR A                                                                ;B3965C;
    LSR A                                                                ;B3965D;
    LSR A                                                                ;B3965E;
    CLC                                                                  ;B3965F;
    ADC.W #$0100                                                         ;B39660;
    STA.L $7E881C,X                                                      ;B39663;

.return:
    RTL                                                                  ;B39667;


MainAI_Botwoon:
    LDX.W $0E54                                                          ;B39668;
    JSR.W BotwoonDeathCheck                                              ;B3966B;
    JSR.W ($0FAE,X)                                                      ;B3966E;
    JSR.W BotwoonHealthBasedPaletteHandling                              ;B39671;
    RTL                                                                  ;B39674;


UNUSED_Data_B39675:
    dw $FFFF,$00FF,$01FF                                                 ;B39675;

UNUSED_SpeedTable_Random_B3967B:
    LDA.L $7E803E,X                                                      ;B3967B;
    ASL A                                                                ;B3967F;
    TAY                                                                  ;B39680;
    LDA.W UNUSED_Data_B39675,Y                                           ;B39681;
    STA.B $12                                                            ;B39684;
    JSL.L GenerateRandomNumber                                           ;B39686;
    AND.B $12                                                            ;B3968A;
    BNE .return                                                          ;B3968C;
    LDA.W #$0001                                                         ;B3968E;
    STA.L $7E801C,X                                                      ;B39691;

.return:
    RTS                                                                  ;B39695;


UNUSED_Botwoon_MaybeSpitting_B39396:
    LDX.W $0E54                                                          ;B39696;
    LDA.L $7E801E,X                                                      ;B39699;
    BNE +                                                                ;B3969D;
    LDA.L $7E801C,X                                                      ;B3969F;
    BEQ +                                                                ;B396A3;
    LDA.L $7E8026,X                                                      ;B396A5;
    BNE +                                                                ;B396A9;
    LDA.L $7E8002,X                                                      ;B396AB;
    BNE +                                                                ;B396AF;
    LDA.W #Function_Botwoon_Head_Spitting_SetAngleAndShow                ;B396B1;
    STA.W EnemyData.work5,X                                              ;B396B4;
    LDA.W #$0018                                                         ;B396B7;
    STA.L $7E8002,X                                                      ;B396BA;

  + LDA.W #$0000                                                         ;B396BE;
    STA.L $7E801C,X                                                      ;B396C1;
    RTS                                                                  ;B396C5;


BotwoonDeathCheck:
    LDX.W $0E54                                                          ;B396C6;
    LDA.L $7E801E,X                                                      ;B396C9;
    BEQ .return                                                          ;B396CD;
    LDA.L $7E803C,X                                                      ;B396CF;
    BEQ .return                                                          ;B396D3;
    LDA.W #$0001                                                         ;B396D5;
    STA.L $7E8020,X                                                      ;B396D8;
    LDA.W #Function_Botwoon_DeathSequence_PreDeathDelay                  ;B396DC;
    STA.W EnemyData.work3,X                                              ;B396DF;
    LDA.W #$00F0                                                         ;B396E2;
    STA.L $7E8004,X                                                      ;B396E5;
    LDA.W #$0000                                                         ;B396E9;
    STA.L $7E801E,X                                                      ;B396EC;
    STA.L $7E803C,X                                                      ;B396F0;

.return:
    RTS                                                                  ;B396F4;


SetBotwoonAsIntangible:
    LDA.W $0F86                                                          ;B396F5;
    ORA.W #$0400                                                         ;B396F8;
    STA.W $0F86                                                          ;B396FB;
    RTS                                                                  ;B396FE;


UNUSED_SetBotwoonBodyProjectilesAsIntangible_B396FF:
    LDY.W #$0022                                                         ;B396FF;

.loop:
    TYX                                                                  ;B39702;
    LDA.W $1BD7,Y                                                        ;B39703;
    ORA.W #$2000                                                         ;B39706;
    STA.W $1BD7,Y                                                        ;B39709;
    LDA.W #$0002                                                         ;B3970C;
    STA.L $7EF380,X                                                      ;B3970F;
    DEY                                                                  ;B39713;
    DEY                                                                  ;B39714;
    CPY.W #$000A                                                         ;B39715;
    BPL .loop                                                            ;B39718;
    RTS                                                                  ;B3971A;


BotwoonHealthBasedPalettes:
    dw $0000,$27E9,$1A66,$1585,$0CA3,$3F9C,$2E97,$1D72                   ;B3971B;
    dw $108E,$0A5F,$09DB,$0956,$08D2,$082C,$7FBD,$0C05                   ;B3972B;
    dw $2003,$27EB,$1A88,$15A7,$0CC4,$3B5C,$2E58,$1D53                   ;B3973B;
    dw $106F,$0E3F,$0DBB,$0D36,$0CD2,$0C2C,$77BD,$0C06                   ;B3974B;
    dw $2003,$23ED,$168A,$11C8,$08E5,$3AFD,$2A38,$1D34                   ;B3975B;
    dw $1071,$0DFF,$0D9B,$0D36,$0CB3,$0C2D,$6FDE,$0807                   ;B3976B;
    dw $0000,$23EF,$16AC,$11EA,$0906,$36BD,$29F9,$1D15                   ;B3977B;
    dw $1052,$11DF,$117B,$1116,$10B3,$102D,$67DE,$0808                   ;B3978B;
    dw $0000,$23F2,$12CF,$11EC,$0908,$327D,$25B9,$18D6                   ;B3979B;
    dw $1453,$11BF,$115C,$10F7,$1093,$102E,$5FDE,$0408                   ;B397AB;
    dw $0000,$23F4,$12F1,$120E,$0929,$2E3D,$257A,$18B7                   ;B397BB;
    dw $1434,$159F,$153C,$14D7,$1493,$142E,$57DE,$0409                   ;B397CB;
    dw $0000,$1FF6,$0EF3,$0E2F,$054A,$2DDE,$215A,$1898                   ;B397DB;
    dw $1436,$155F,$151C,$14D7,$1474,$142F,$4FFF,$000A                   ;B397EB;
    dw $0000,$1FF8,$0F15,$0E51,$056B,$299E,$211B,$1879                   ;B397FB;
    dw $1417,$193F,$18FC,$18B7,$1874,$182F,$47FF,$000B                   ;B3980B;

BotwoonHealthThresholdsForPaletteChange:
    dw $0BB8,$0A41,$08CA,$0753,$05DC,$0465,$02EE,$0177                   ;B3981B;

BotwoonHealthBasedPaletteHandling:
    LDX.W $0E54                                                          ;B3982B;
    LDA.L $7E881E,X                                                      ;B3982E;
    CMP.W #$0010                                                         ;B39832;
    BEQ .return                                                          ;B39835;
    TAY                                                                  ;B39837;
    LDA.W EnemyData.health,X                                             ;B39838;
    CMP.W BotwoonHealthThresholdsForPaletteChange,Y                      ;B3983B;
    BPL .return                                                          ;B3983E;
    LDA.L $7E881E,X                                                      ;B39840;
    ASL A                                                                ;B39844;
    ASL A                                                                ;B39845;
    ASL A                                                                ;B39846;
    ASL A                                                                ;B39847;
    STA.B $12                                                            ;B39848;
    LDA.L $7E881C,X                                                      ;B3984A;
    STA.B $14                                                            ;B3984E;

.loop:
    LDY.B $12                                                            ;B39850;
    LDX.B $14                                                            ;B39852;
    LDA.W BotwoonHealthBasedPalettes,Y                                   ;B39854;
    STA.L $7EC000,X                                                      ;B39857;
    INC.B $12                                                            ;B3985B;
    INC.B $12                                                            ;B3985D;
    INC.B $14                                                            ;B3985F;
    INC.B $14                                                            ;B39861;
    LDA.B $14                                                            ;B39863;
    CMP.W #$0200                                                         ;B39865;
    BNE .loop                                                            ;B39868;
    LDX.W $0E54                                                          ;B3986A;
    LDA.L $7E881E,X                                                      ;B3986D;
    INC A                                                                ;B39871;
    INC A                                                                ;B39872;
    STA.L $7E881E,X                                                      ;B39873;

.return:
    RTS                                                                  ;B39877;


Function_Botwoon_Initial:
    LDX.W $0E54                                                          ;B39878;
    LDA.L $7E8000,X                                                      ;B3987B;
    DEC A                                                                ;B3987F;
    STA.L $7E8000,X                                                      ;B39880;
    BNE .return                                                          ;B39884;
    LDA.W #Function_Botwoon_GoThroughHole                                ;B39886;
    STA.W EnemyData.work3,X                                              ;B39889;

.return:
    RTS                                                                  ;B3988C;


BotwoonLeaveHoleAction_JumpTable:
    dw SetupBotwoonMovingAround                                          ;B3988D;
    dw SetupBotwoonMovingAround                                          ;B3988F;
    dw SetupBotwoonMovingAround                                          ;B39891;
    dw SetupBotwoonSpitting                                              ;B39893;
    dw SetupBotwoonSpitting                                              ;B39895;
    dw SetupBotwoonSpitting                                              ;B39897;
    dw SetupBotwoonSpitting                                              ;B39899;
    dw SetupBotwoonSpitting                                              ;B3989B;

Function_Botwoon_GoThroughHole:
    LDX.W $0E54                                                          ;B3989D;
    LDA.L $7E8038,X                                                      ;B398A0;
    BEQ .moveAround                                                      ;B398A4;
    LDA.W #$0000                                                         ;B398A6;
    STA.L $7E8038,X                                                      ;B398A9;
    STZ.B $12                                                            ;B398AD;
    LDA.L $7E8026,X                                                      ;B398AF;
    BNE .gotoAction                                                      ;B398B3;
    LDA.L $7E8832,X                                                      ;B398B5;
    BNE .gotoAction                                                      ;B398B9;
    LDA.L $7E803E,X                                                      ;B398BB;
    BNE .gotoAction                                                      ;B398BF;
    JSL.L GenerateRandomNumber                                           ;B398C1;
    AND.W #$000E                                                         ;B398C5;
    STA.B $12                                                            ;B398C8;

.gotoAction:
    LDA.W #$0000                                                         ;B398CA;
    STA.L $7E8832,X                                                      ;B398CD;
    LDX.B $12                                                            ;B398D1;
    JMP.W (BotwoonLeaveHoleAction_JumpTable,X)                           ;B398D3;


.moveAround:
    JSR.W ($0FB0,X)                                                      ;B398D6;
    JSR.W UpdateBotwoonPositionHistory                                   ;B398D9;
    JSR.W UpdateBotwonBodyProjectilePositions                            ;B398DC;
    JSR.W ($0FB2,X)                                                      ;B398DF;
    JSR.W SetBotwoonInstListTableIndices                                 ;B398E2;
    JSR.W UpdateBotwoonPositionHistoryIndex                              ;B398E5;
    JSR.W Botwoon_vs_Hole_CollisionDetection                             ;B398E8;
    RTS                                                                  ;B398EB;


SetupBotwoonMovingAround:
    LDX.W $0E54                                                          ;B398EC;
    LDA.W #Function_Botwoon_MovingAround                                 ;B398EF;
    STA.W EnemyData.work3,X                                              ;B398F2;
    LDA.W #Function_Botwoon_Movement_StartMovingAccordingToMovementData  ;B398F5;
    STA.W EnemyData.work4,X                                              ;B398F8;
    LDA.W #$0000                                                         ;B398FB;
    STA.L $7E8002,X                                                      ;B398FE;
    LDA.W #Function_Botwoon_Head_MovingAround                            ;B39902;
    STA.W EnemyData.work5,X                                              ;B39905;
    LDA.W #$0000                                                         ;B39908;
    STA.L $7E8816,X                                                      ;B3990B;
    JSR.W ChooseBotwoonMovementPath                                      ;B3990F;
    RTS                                                                  ;B39912;


SetupBotwoonSpitting:
    LDX.W $0E54                                                          ;B39913;
    LDA.W #Function_Botwoon_Spitting                                     ;B39916;
    STA.W EnemyData.work3,X                                              ;B39919;
    LDA.W #Function_Botwoon_Head_Spitting_SetAngleAndShow                ;B3991C;
    STA.W EnemyData.work5,X                                              ;B3991F;
    LDA.W #$0030                                                         ;B39922;
    STA.L $7E8002,X                                                      ;B39925;
    LDA.W EnemyData.properties,X                                         ;B39929;
    AND.W #$FBFF                                                         ;B3992C;
    STA.W EnemyData.properties,X                                         ;B3992F;
    RTS                                                                  ;B39932;


ChooseBotwoonMovementPath:
    JSR.W SetBotwoonSpeed                                                ;B39933;
    STZ.B $12                                                            ;B39936;
    LDA.L $7E8026,X                                                      ;B39938;
    BEQ .notHidden                                                       ;B3993C;
    LDA.W #$0080                                                         ;B3993E;
    STA.B $12                                                            ;B39941;

.notHidden:
    JSL.L GenerateRandomNumber                                           ;B39943;
    AND.W #$0018                                                         ;B39947;
    STA.B $14                                                            ;B3994A;
    LDA.L $7E802E,X                                                      ;B3994C;
    ASL A                                                                ;B39950;
    ASL A                                                                ;B39951;
    CLC                                                                  ;B39952;
    ADC.B $12                                                            ;B39953;
    CLC                                                                  ;B39955;
    ADC.B $14                                                            ;B39956;
    STA.L $7E8800,X                                                      ;B39958;
    RTS                                                                  ;B3995C;


SetBotwoonSpeed:
    LDA.L $7E8026,X                                                      ;B3995D;
    BNE .return                                                          ;B39961;
    LDA.W #$0000                                                         ;B39963;
    STA.L $7E803E,X                                                      ;B39966;
    LDA.W EnemyData.health,X                                             ;B3996A;
    BEQ .return                                                          ;B3996D;
    BMI .return                                                          ;B3996F;
    CMP.L $7E8838,X                                                      ;B39971;
    BPL .return                                                          ;B39975;
    CMP.L $7E883A,X                                                      ;B39977;
    BPL .halfHealth                                                      ;B3997B;
    BRA .quarterHealth                                                   ;B3997D;


.halfHealth:
    LDA.W #$0001                                                         ;B3997F;
    STA.L $7E803E,X                                                      ;B39982;
    BRA .merge                                                           ;B39986;


.quarterHealth:
    LDA.W #$0002                                                         ;B39988;
    STA.L $7E803E,X                                                      ;B3998B;

.merge:
    LDA.L $7E803E,X                                                      ;B3998F;
    ASL A                                                                ;B39993;
    ASL A                                                                ;B39994;
    TAY                                                                  ;B39995;
    LDA.W BotwoonSpeedTable_speed,Y                                      ;B39996;
    STA.L $7E8030,X                                                      ;B39999;
    LDA.W BotwoonSpeedTable_bodyTravelTime,Y                             ;B3999D;
    STA.W EnemyData.work2,X                                              ;B399A0;

.return:
    RTS                                                                  ;B399A3;


Function_Botwoon_MovingAround:
    LDX.W $0E54                                                          ;B399A4;
    LDA.L $7E8038,X                                                      ;B399A7;
    BEQ .notGoingThroughHole                                             ;B399AB;
    LDA.W #$0000                                                         ;B399AD;
    STA.L $7E8038,X                                                      ;B399B0;
    JMP.W +                                                              ;B399B4; >.<


.notGoingThroughHole:
    JSR.W ($0FB0,X)                                                      ;B399B7;
    JSR.W UpdateBotwoonPositionHistory                                   ;B399BA;
    JSR.W UpdateBotwonBodyProjectilePositions                            ;B399BD;
    JSR.W ($0FB2,X)                                                      ;B399C0;
    JSR.W SetBotwoonInstListTableIndices                                 ;B399C3;
    JSR.W UpdateBotwoonPositionHistoryIndex                              ;B399C6;
    RTS                                                                  ;B399C9;


  + LDA.W #Function_Botwoon_GoThroughHole                                ;B399CA;
    STA.W EnemyData.work3,X                                              ;B399CD;
    LDA.W #Function_Botwoon_Movement_DirectlyTowardTargetHole            ;B399D0;
    STA.W EnemyData.work4,X                                              ;B399D3;
    LDA.L $7E8026,X                                                      ;B399D6;
    BEQ .return                                                          ;B399DA;
    LDA.W #$0000                                                         ;B399DC;
    STA.L $7E802A,X                                                      ;B399DF;

.return:
    RTS                                                                  ;B399E3;


Function_Botwoon_Spitting:
    LDX.W $0E54                                                          ;B399E4;
    LDA.L $7E8002,X                                                      ;B399E7;
    BNE .timerNotExpired                                                 ;B399EB;
    LDA.W #$0000                                                         ;B399ED;
    STA.L $7E8038,X                                                      ;B399F0;
    JMP.W +                                                              ;B399F4; >.<


.timerNotExpired:
    LDA.W #$0000                                                         ;B399F7;
    STA.L $7E801C,X                                                      ;B399FA;
    JSR.W ($0FB2,X)                                                      ;B399FE;
    RTS                                                                  ;B39A01;


  + LDA.W #Function_Botwoon_MovingAround                                 ;B39A02;
    STA.W EnemyData.work3,X                                              ;B39A05;
    LDA.W #Function_Botwoon_Movement_StartMovingAccordingToMovementData  ;B39A08;
    STA.W EnemyData.work4,X                                              ;B39A0B;
    LDA.W #Function_Botwoon_Head_MovingAround                            ;B39A0E;
    STA.W EnemyData.work5,X                                              ;B39A11;
    LDA.L $7E801E,X                                                      ;B39A14;
    BNE .deathFlagSet                                                    ;B39A18;
    JSL.L GenerateRandomNumber                                           ;B39A1A;
    AND.W #$0001                                                         ;B39A1E;
    STA.L $7E8026,X                                                      ;B39A21;
    STA.L $7E8028,X                                                      ;B39A25;
    BEQ .deathFlagSet                                                    ;B39A29;
    LDA.W #$0000                                                         ;B39A2B;
    STA.L $7E802A,X                                                      ;B39A2E;
    LDA.W #$FFFF                                                         ;B39A32;
    STA.L $7E802C,X                                                      ;B39A35;
    BRA .merge                                                           ;B39A39;


.deathFlagSet:
    LDA.W #$0000                                                         ;B39A3B;
    STA.L $7E8816,X                                                      ;B39A3E;

.merge:
    JSR.W ChooseBotwoonMovementPath                                      ;B39A42;
    RTS                                                                  ;B39A45;


Function_Botwoon_DeathSequence_PreDeathDelay:
    LDX.W $0E54                                                          ;B39A46;
    LDA.L $7E8004,X                                                      ;B39A49;
    INC A                                                                ;B39A4D;
    STA.L $7E8004,X                                                      ;B39A4E;
    CMP.W #$0100                                                         ;B39A52;
    BMI .return                                                          ;B39A55;
    LDA.W #Function_Botwoon_DeathSequence_FallingToGround                ;B39A57;
    STA.W EnemyData.work3,X                                              ;B39A5A;

.return:
    RTS                                                                  ;B39A5D;


Function_Botwoon_DeathSequence_FallingToGround:
    LDX.W $0E54                                                          ;B39A5E;
    LDA.L $7E8010,X                                                      ;B39A61;
    AND.W #$FF00                                                         ;B39A65;
    XBA                                                                  ;B39A68;
    ASL A                                                                ;B39A69;
    ASL A                                                                ;B39A6A;
    ASL A                                                                ;B39A6B;
    TAY                                                                  ;B39A6C;
    LDA.W EnemyData.ySubPosition,X                                       ;B39A6D;
    CLC                                                                  ;B39A70;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;B39A71;
    BCC +                                                                ;B39A74;
    INC.W EnemyData.yPosition,X                                          ;B39A76;

  + STA.W EnemyData.ySubPosition,X                                       ;B39A79;
    LDA.W EnemyData.yPosition,X                                          ;B39A7C;
    CLC                                                                  ;B39A7F;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;B39A80;
    STA.W EnemyData.yPosition,X                                          ;B39A83;
    CMP.W #$00C8                                                         ;B39A86;
    BMI .lessThanC8                                                      ;B39A89;
    LDA.W #$00C8                                                         ;B39A8B;
    STA.W EnemyData.yPosition,X                                          ;B39A8E;
    LDA.W #Function_Botwoon_DeathSequence_WaitForBodyToFallToGround      ;B39A91;
    STA.W EnemyData.work3,X                                              ;B39A94;
    LDA.W EnemyData.xPosition,X                                          ;B39A97;
    STA.B $12                                                            ;B39A9A;
    LDA.W EnemyData.yPosition,X                                          ;B39A9C;
    STA.B $14                                                            ;B39A9F;
    LDA.W #$001D                                                         ;B39AA1;
    LDY.W #EnemyProjectile_MiscDust                                      ;B39AA4;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;B39AA7;
    JSL.L QueueSmallExplosionSFX                                         ;B39AAB;
    LDA.W EnemyData.properties,X                                         ;B39AAF;
    ORA.W #$0400                                                         ;B39AB2;
    ORA.W #$0100                                                         ;B39AB5;
    STA.W EnemyData.properties,X                                         ;B39AB8;
    BRA .return                                                          ;B39ABB;


.lessThanC8:
    LDA.L $7E8010,X                                                      ;B39ABD;
    CLC                                                                  ;B39AC1;
    ADC.W #$00C0                                                         ;B39AC2;
    STA.L $7E8010,X                                                      ;B39AC5;

.return:
    RTS                                                                  ;B39AC9;


Function_Botwoon_DeathSequence_WaitForBodyToFallToGround:
    LDX.W $0E54                                                          ;B39ACA;
    LDA.L $7E883E,X                                                      ;B39ACD;
    BEQ .return                                                          ;B39AD1;
    LDA.W #Function_Botwoon_DeathSequence_CrumblingWall                  ;B39AD3;
    STA.W EnemyData.work3,X                                              ;B39AD6;
    JSR.W SpawnBotwoonItemDrops_StartCrumblingWall                       ;B39AD9;

.return:
    RTS                                                                  ;B39ADC;


SpawnBotwoonItemDrops_StartCrumblingWall:
    JSL.L Spawn_Hardcoded_PLM                                            ;B39ADD;
    db $0F,$04                                                           ;B39AE1;
    dw PLMEntries_crumbleBotwoonWall                                     ;B39AE3;
    JSL.L BotwoonDeathItemDropRoutine                                    ;B39AE5;
    LDA.W #$0000                                                         ;B39AE9;
    STA.L $7E8006,X                                                      ;B39AEC;
    STA.L $7E8008,X                                                      ;B39AF0;
    STA.L $7E800A,X                                                      ;B39AF4;
    RTS                                                                  ;B39AF8;


Function_Botwoon_DeathSequence_CrumblingWall:
    LDA.L $7E8006,X                                                      ;B39AF9;
    CMP.W #$00C0                                                         ;B39AFD;
    BPL .end                                                             ;B39B00;
    CMP.W #$0040                                                         ;B39B02;
    BPL .wall                                                            ;B39B05;
    JMP.W .return                                                        ;B39B07;


.end:
    LDA.W EnemyData.properties,X                                         ;B39B0A;
    ORA.W #$0200                                                         ;B39B0D;
    STA.W EnemyData.properties,X                                         ;B39B10;
    LDA.W #$0002                                                         ;B39B13;
    JSL.L SetBossBitsInAForCurrentArea                                   ;B39B16;
    LDA.W #$0003                                                         ;B39B1A;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;B39B1D;
    RTS                                                                  ;B39B21;


.wall:
    LDA.L $7E8008,X                                                      ;B39B22;
    DEC A                                                                ;B39B26;
    STA.L $7E8008,X                                                      ;B39B27;
    BPL .timerNotExpired                                                 ;B39B2B;
    LDA.W #$000C                                                         ;B39B2D;
    STA.L $7E8008,X                                                      ;B39B30;
    JSL.L GenerateRandomNumber                                           ;B39B34;
    AND.W #$001F                                                         ;B39B38;
    CLC                                                                  ;B39B3B;
    ADC.W #$00E8                                                         ;B39B3C;
    STA.B $12                                                            ;B39B3F;
    JSL.L GenerateRandomNumber                                           ;B39B41;
    AND.W #$001F                                                         ;B39B45;
    SEC                                                                  ;B39B48;
    SBC.W #$0008                                                         ;B39B49;
    CLC                                                                  ;B39B4C;
    ADC.L $7E8006,X                                                      ;B39B4D;
    STA.B $14                                                            ;B39B51;
    LDA.W #$001D                                                         ;B39B53;
    STA.B $16                                                            ;B39B56;
    LDA.W #$0A00                                                         ;B39B58;
    STA.B $18                                                            ;B39B5B;
    JSL.L Create_Sprite_Object                                           ;B39B5D;
    JSL.L QueueSmallExplosionSFX                                         ;B39B61;

.timerNotExpired:
    LDA.L $7E800A,X                                                      ;B39B65;
    DEC A                                                                ;B39B69;
    STA.L $7E800A,X                                                      ;B39B6A;
    BPL .return                                                          ;B39B6E;
    LDA.W #$0004                                                         ;B39B70;
    STA.L $7E800A,X                                                      ;B39B73;
    LDA.W #$0002                                                         ;B39B77;
    STA.B $24                                                            ;B39B7A;

.loop:
    JSL.L GenerateRandomNumber                                           ;B39B7C;
    AND.W #$003F                                                         ;B39B80;
    CLC                                                                  ;B39B83;
    ADC.W #$00E0                                                         ;B39B84;
    STA.B $12                                                            ;B39B87;
    JSL.L GenerateRandomNumber                                           ;B39B89;
    AND.W #$001F                                                         ;B39B8D;
    SEC                                                                  ;B39B90;
    SBC.W #$0008                                                         ;B39B91;
    CLC                                                                  ;B39B94;
    ADC.L $7E8006,X                                                      ;B39B95;
    STA.B $14                                                            ;B39B99;
    LDA.W #$0009                                                         ;B39B9B;
    STA.B $16                                                            ;B39B9E;
    LDA.W #$0A00                                                         ;B39BA0;
    STA.B $18                                                            ;B39BA3;
    JSL.L Create_Sprite_Object                                           ;B39BA5;
    DEC.B $24                                                            ;B39BA9;
    BNE .loop                                                            ;B39BAB;

.return:
    LDA.L $7E8006,X                                                      ;B39BAD;
    INC A                                                                ;B39BB1;
    STA.L $7E8006,X                                                      ;B39BB2;
    RTS                                                                  ;B39BB6;


Function_Botwoon_Movement_DirectlyTowardTargetHole:
    LDX.W $0E54                                                          ;B39BB7;
    JSR.W CalculateXYOffsetsToTargetHole                                 ;B39BBA;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;B39BBD;
    STA.L $7E8032,X                                                      ;B39BC1;
    SEC                                                                  ;B39BC5;
    SBC.W #$0040                                                         ;B39BC6;
    EOR.W #$FFFF                                                         ;B39BC9;
    INC A                                                                ;B39BCC;
    CLC                                                                  ;B39BCD;
    ADC.W #$0100                                                         ;B39BCE;
    AND.W #$00FF                                                         ;B39BD1;
    STA.L $7E8034,X                                                      ;B39BD4;
    LDA.L $7E8026,X                                                      ;B39BD8;
    CMP.L $7E8028,X                                                      ;B39BDC;
    BEQ .move                                                            ;B39BE0;
    LDA.L $7E8026,X                                                      ;B39BE2;
    STA.L $7E8028,X                                                      ;B39BE6;
    LDA.W #$0001                                                         ;B39BEA;
    STA.L $7E8038,X                                                      ;B39BED;
    JMP.W .return                                                        ;B39BF1;


.move:
    JSR.W MoveBotwoonAccordingToSpeedAndAngleToTargetHole                ;B39BF4;

.return:
    RTS                                                                  ;B39BF7;


CalculateXYOffsetsToTargetHole:
    LDA.L $7E802E,X                                                      ;B39BF8;
    TAY                                                                  ;B39BFC;
    LDA.W BotwoonHoleHitboxes_leftBoundary,Y                             ;B39BFD;
    CLC                                                                  ;B39C00;
    ADC.W #$0004                                                         ;B39C01;
    SEC                                                                  ;B39C04;
    SBC.W EnemyData.xPosition,X                                          ;B39C05;
    STA.B $12                                                            ;B39C08;
    CMP.W #$0100                                                         ;B39C0A;
    BPL .XClampHigh                                                      ;B39C0D;
    CMP.W #$FF00                                                         ;B39C0F;
    BMI .XClampLow                                                       ;B39C12;
    BRA .merge                                                           ;B39C14;


.XClampHigh:
    LDA.W #$00FF                                                         ;B39C16;
    STA.B $12                                                            ;B39C19;
    BRA .merge                                                           ;B39C1B;


.XClampLow:
    LDA.W #$FF01                                                         ;B39C1D;
    STA.B $12                                                            ;B39C20;

.merge:
    LDA.W BotwoonHoleHitboxes_topBoundary,Y                              ;B39C22;
    CLC                                                                  ;B39C25;
    ADC.W #$0004                                                         ;B39C26;
    SEC                                                                  ;B39C29;
    SBC.W EnemyData.yPosition,X                                          ;B39C2A;
    STA.B $14                                                            ;B39C2D;
    CMP.W #$0100                                                         ;B39C2F;
    BPL .YClampHigh                                                      ;B39C32;
    CMP.W #$FF00                                                         ;B39C34;
    BMI .YClampLow                                                       ;B39C37;
    BRA .return                                                          ;B39C39;


.YClampHigh:
    LDA.W #$00FF                                                         ;B39C3B;
    STA.B $14                                                            ;B39C3E;
    BRA .return                                                          ;B39C40;


.YClampLow:
    LDA.W #$FF01                                                         ;B39C42;
    STA.B $14                                                            ;B39C45;

.return:
    RTS                                                                  ;B39C47;


MoveBotwoonAccordingToSpeedAndAngleToTargetHole:
    LDX.W $0E54                                                          ;B39C48;
    LDA.L $7E8034,X                                                      ;B39C4B;
    STA.B $12                                                            ;B39C4F;
    LDA.L $7E8030,X                                                      ;B39C51;
    STA.B $14                                                            ;B39C55;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;B39C57; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.L $7E8034,X                                                      ;B39C5B;
    STA.W $0E20                                                          ;B39C5F;
    LDA.B $16                                                            ;B39C62;
    STA.W $0E24                                                          ;B39C64;
    LDA.B $18                                                            ;B39C67;
    STA.W $0E26                                                          ;B39C69;
    LDA.B $1A                                                            ;B39C6C;
    STA.W $0E28                                                          ;B39C6E;
    LDA.B $1C                                                            ;B39C71;
    STA.W $0E2A                                                          ;B39C73;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;B39C76;
    RTS                                                                  ;B39C7A;


UpdateBotwoonPositionHistory:
    LDY.W $0E54                                                          ;B39C7B;
    LDX.W EnemyData.work1,Y                                              ;B39C7E;
    LDA.W EnemyData.xPosition,Y                                          ;B39C81;
    STA.L $7E9000,X                                                      ;B39C84;
    LDA.W EnemyData.yPosition,Y                                          ;B39C88;
    STA.L $7E9002,X                                                      ;B39C8B;
    RTS                                                                  ;B39C8F;


UpdateBotwonBodyProjectilePositions:
    LDX.W $0E54                                                          ;B39C90;
    LDA.W EnemyData.work1,X                                              ;B39C93;
    SEC                                                                  ;B39C96;
    SBC.W EnemyData.work2,X                                              ;B39C97;
    AND.W #$03FF                                                         ;B39C9A;
    STA.B $12                                                            ;B39C9D;
    LDA.W #$0018                                                         ;B39C9F;
    STA.B $14                                                            ;B39CA2;

.loop:
    LDX.B $14                                                            ;B39CA4;
    LDA.L $7E7800,X                                                      ;B39CA6;
    TAY                                                                  ;B39CAA;
    LDX.W $0E54                                                          ;B39CAB;
    LDA.L $7E802C,X                                                      ;B39CAE;
    CMP.B $12                                                            ;B39CB2;
    BNE .toggleVisibilityEnd                                             ;B39CB4;
    LDX.B $14                                                            ;B39CB6;
    LDA.L $7E7820,X                                                      ;B39CB8;
    EOR.W #$0001                                                         ;B39CBC;
    STA.L $7E7820,X                                                      ;B39CBF;
    BEQ .notHidden                                                       ;B39CC3;
    LDA.W $1BD7,Y                                                        ;B39CC5;
    ORA.W #$2000                                                         ;B39CC8;
    STA.W $1BD7,Y                                                        ;B39CCB;
    PHX                                                                  ;B39CCE;
    TYX                                                                  ;B39CCF;
    LDA.W #$0002                                                         ;B39CD0;
    STA.L $7EF380,X                                                      ;B39CD3;
    PLX                                                                  ;B39CD7;
    BRA +                                                                ;B39CD8;


.notHidden:
    LDA.W $1BD7,Y                                                        ;B39CDA;
    AND.W #$DFFF                                                         ;B39CDD;
    STA.W $1BD7,Y                                                        ;B39CE0;
    PHX                                                                  ;B39CE3;
    TYX                                                                  ;B39CE4;
    LDA.W #$0001                                                         ;B39CE5;
    STA.L $7EF380,X                                                      ;B39CE8;
    PLX                                                                  ;B39CEC;

  + CPX.W #$0000                                                         ;B39CED;
    BNE .toggleVisibilityEnd                                             ;B39CF0;
    LDX.W $0E54                                                          ;B39CF2;
    LDA.W #$0000                                                         ;B39CF5;
    STA.L $7E802A,X                                                      ;B39CF8;
    STA.L $7E803C,X                                                      ;B39CFC;
    LDA.W #$FFFF                                                         ;B39D00;
    STA.L $7E802C,X                                                      ;B39D03;
    LDA.L $7E8026,X                                                      ;B39D07;
    BNE .toggleVisibilityEnd                                             ;B39D0B;
    LDA.W #$0001                                                         ;B39D0D;
    STA.L $7E803C,X                                                      ;B39D10;

.toggleVisibilityEnd:
    LDX.B $12                                                            ;B39D14;
    LDA.L $7E9000,X                                                      ;B39D16;
    STA.W $1A4B,Y                                                        ;B39D1A;
    LDA.L $7E9002,X                                                      ;B39D1D;
    STA.W $1A93,Y                                                        ;B39D21;
    LDX.W $0E54                                                          ;B39D24;
    LDA.B $12                                                            ;B39D27;
    SEC                                                                  ;B39D29;
    SBC.W EnemyData.work2,X                                              ;B39D2A;
    AND.W #$03FF                                                         ;B39D2D;
    STA.B $12                                                            ;B39D30;
    DEC.B $14                                                            ;B39D32;
    DEC.B $14                                                            ;B39D34;
    BMI .return                                                          ;B39D36;
    JMP.W .loop                                                          ;B39D38;


.return:
    RTS                                                                  ;B39D3B;


UpdateBotwoonPositionHistoryIndex:
    LDX.W $0E54                                                          ;B39D3C;
    LDA.W EnemyData.work1,X                                              ;B39D3F;
    CLC                                                                  ;B39D42;
    ADC.W #$0004                                                         ;B39D43;
    AND.W #$03FF                                                         ;B39D46;
    STA.W EnemyData.work1,X                                              ;B39D49;
    RTS                                                                  ;B39D4C;


SetBotwoonInstListTableIndices:
    LDX.W $0E54                                                          ;B39D4D;
    LDA.W #$0018                                                         ;B39D50;
    STA.B $16                                                            ;B39D53;

.loop:
    STZ.B $18                                                            ;B39D55;
    LDX.B $16                                                            ;B39D57;
    LDA.L $7E7800,X                                                      ;B39D59;
    TAY                                                                  ;B39D5D;
    LDA.L $7E7820,X                                                      ;B39D5E;
    BEQ .nothidden                                                       ;B39D62;
    LDA.W #$0100                                                         ;B39D64;
    STA.B $18                                                            ;B39D67;

.nothidden:
    LDA.B $16                                                            ;B39D69;
    CMP.W #$0018                                                         ;B39D6B;
    BEQ .first                                                           ;B39D6E;
    CMP.W #$0000                                                         ;B39D70;
    BNE .notZero                                                         ;B39D73;
    LDA.B $18                                                            ;B39D75;
    CLC                                                                  ;B39D77;
    ADC.W #$0200                                                         ;B39D78;
    STA.B $18                                                            ;B39D7B;

.notZero:
    LDA.W $1A4D,Y                                                        ;B39D7D;
    SEC                                                                  ;B39D80;
    SBC.W $1A4B,Y                                                        ;B39D81;
    STA.B $12                                                            ;B39D84;
    LDA.W $1A95,Y                                                        ;B39D86;
    SEC                                                                  ;B39D89;
    SBC.W $1A93,Y                                                        ;B39D8A;
    STA.B $14                                                            ;B39D8D;
    BRA .merge                                                           ;B39D8F;


.first:
    LDX.W $0E54                                                          ;B39D91;
    LDA.W EnemyData.xPosition,X                                          ;B39D94;
    SEC                                                                  ;B39D97;
    SBC.W $1A4B,Y                                                        ;B39D98;
    STA.B $12                                                            ;B39D9B;
    LDA.W EnemyData.yPosition,X                                          ;B39D9D;
    SEC                                                                  ;B39DA0;
    SBC.W $1A93,Y                                                        ;B39DA1;
    STA.B $14                                                            ;B39DA4;

.merge:
    JSL.L CalculateAngleOf_12_14_Offset                                  ;B39DA6;
    CLC                                                                  ;B39DAA;
    ADC.B $18                                                            ;B39DAB;
    LSR A                                                                ;B39DAD;
    LSR A                                                                ;B39DAE;
    LSR A                                                                ;B39DAF;
    LSR A                                                                ;B39DB0;
    LSR A                                                                ;B39DB1;
    ASL A                                                                ;B39DB2;
    STA.W $1AFF,Y                                                        ;B39DB3;
    DEC.B $16                                                            ;B39DB6;
    DEC.B $16                                                            ;B39DB8;
    BMI .return                                                          ;B39DBA;
    JMP.W .loop                                                          ;B39DBC;


.return:
    RTS                                                                  ;B39DBF;


Function_Botwoon_Head_MovingAround:
    LDX.W $0E54                                                          ;B39DC0;
    LDA.W EnemyData.xPosition,X                                          ;B39DC3;
    SEC                                                                  ;B39DC6;
    SBC.L $7E882C,X                                                      ;B39DC7;
    STA.B $12                                                            ;B39DCB;
    LDA.W EnemyData.yPosition,X                                          ;B39DCD;
    SEC                                                                  ;B39DD0;
    SBC.L $7E882E,X                                                      ;B39DD1;
    STA.B $14                                                            ;B39DD5;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;B39DD7;
    STA.B $16                                                            ;B39DDB;
    LDA.B $12                                                            ;B39DDD;
    BNE .nonZero                                                         ;B39DDF;
    LDA.B $14                                                            ;B39DE1;
    BNE .nonZero                                                         ;B39DE3;
    JMP.W .noHeadUpdate                                                  ;B39DE5;


  .nonZero
    LDA.L $7E8026,X                                                      ;B39DE8;
    BEQ .notHidden                                                       ;B39DEC;
    LDA.W #$0007                                                         ;B39DEE;
    STA.W EnemyData.layer,X                                              ;B39DF1;
    LDA.W EnemyData.properties,X                                         ;B39DF4;
    ORA.W #$0400                                                         ;B39DF7;
    STA.W EnemyData.properties,X                                         ;B39DFA;
    LDA.B $16                                                            ;B39DFD;
    CLC                                                                  ;B39DFF;
    ADC.W #$0100                                                         ;B39E00;
    STA.B $16                                                            ;B39E03;
    BRA +                                                                ;B39E05;


  .notHidden
    LDA.W #$0002                                                         ;B39E07;
    STA.W EnemyData.layer,X                                              ;B39E0A;
    LDA.W EnemyData.properties,X                                         ;B39E0D;
    AND.W #$FBFF                                                         ;B39E10;
    STA.W EnemyData.properties,X                                         ;B39E13;

+   LDA.B $16                                                            ;B39E16;
    LSR A                                                                ;B39E18;
    LSR A                                                                ;B39E19;
    LSR A                                                                ;B39E1A;
    LSR A                                                                ;B39E1B;
    LSR A                                                                ;B39E1C;
    ASL A                                                                ;B39E1D;
    TAY                                                                  ;B39E1E;
    LDA.W InstListPointers_Botwoon,Y                                     ;B39E1F;
    CMP.L $7E8036,X                                                      ;B39E22;
    BEQ .noHeadUpdate                                                    ;B39E26;
    STA.W EnemyData.pInstList,X                                          ;B39E28;
    STA.L $7E8036,X                                                      ;B39E2B;
    LDA.W #$0001                                                         ;B39E2F;
    STA.W EnemyData.instTimer,X                                          ;B39E32;
    STZ.W EnemyData.loopCounter,X                                        ;B39E35;

  .noHeadUpdate
    LDA.L $7E8828,X                                                      ;B39E38;
    STA.L $7E882C,X                                                      ;B39E3C;
    LDA.L $7E882A,X                                                      ;B39E40;
    STA.L $7E882E,X                                                      ;B39E44;
    LDA.L $7E8824,X                                                      ;B39E48;
    STA.L $7E8828,X                                                      ;B39E4C;
    LDA.L $7E8826,X                                                      ;B39E50;
    STA.L $7E882A,X                                                      ;B39E54;
    LDA.L $7E8820,X                                                      ;B39E58;
    STA.L $7E8824,X                                                      ;B39E5C;
    LDA.L $7E8822,X                                                      ;B39E60;
    STA.L $7E8826,X                                                      ;B39E64;
    LDA.W EnemyData.xPosition,X                                          ;B39E68;
    STA.L $7E8820,X                                                      ;B39E6B;
    LDA.W EnemyData.yPosition,X                                          ;B39E6F;
    STA.L $7E8822,X                                                      ;B39E72;
    RTS                                                                  ;B39E76;


BotwoonSpitSpeeds:
    dw $0002,$0003,$0004                                                 ;B39E77;

Function_Botwoon_Head_Spitting_SetAngleAndShow:
    LDX.W $0E54                                                          ;B39E7D;
    LDA.W #$0002                                                         ;B39E80;
    STA.W EnemyData.layer,X                                              ;B39E83;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;B39E86;
    STA.L $7E803A,X                                                      ;B39E8A;
    CLC                                                                  ;B39E8E;
    ADC.W #$0010                                                         ;B39E8F;
    AND.W #$00FF                                                         ;B39E92;
    LSR A                                                                ;B39E95;
    LSR A                                                                ;B39E96;
    LSR A                                                                ;B39E97;
    LSR A                                                                ;B39E98;
    LSR A                                                                ;B39E99;
    ASL A                                                                ;B39E9A;
    TAY                                                                  ;B39E9B;
    LDA.W InstListPointers_Botwoon_spit,Y                                ;B39E9C;
    STA.W EnemyData.pInstList,X                                          ;B39E9F;
    STA.L $7E8036,X                                                      ;B39EA2;
    LDA.W #$0001                                                         ;B39EA6;
    STA.W EnemyData.instTimer,X                                          ;B39EA9;
    STZ.W EnemyData.loopCounter,X                                        ;B39EAC;
    LDA.L $7E803A,X                                                      ;B39EAF;
    SEC                                                                  ;B39EB3;
    SBC.W #$0040                                                         ;B39EB4;
    AND.W #$00FF                                                         ;B39EB7;
    EOR.W #$FFFF                                                         ;B39EBA;
    INC A                                                                ;B39EBD;
    CLC                                                                  ;B39EBE;
    ADC.W #$0100                                                         ;B39EBF;
    AND.W #$00FF                                                         ;B39EC2;
    STA.L $7E803A,X                                                      ;B39EC5;
    LDA.W #Function_Botwoon_Head_Spitting_Spawn5SpitProjectiles          ;B39EC9;
    STA.W EnemyData.work5,X                                              ;B39ECC;
    LDA.W EnemyData.work3,X                                              ;B39ECF;
    CMP.W #Function_Botwoon_Spitting                                     ;B39ED2;
    BEQ .gotoHeadFunction                                                ;B39ED5;
    LDA.W #Function_Botwoon_Head_Spitting_Spawn3SpitProjectiles          ;B39ED7;
    STA.W EnemyData.work5,X                                              ;B39EDA;

.gotoHeadFunction:
    JMP.W ($0FB2,X)                                                      ;B39EDD;


Function_Botwoon_Head_Spitting_Spawn5SpitProjectiles:
    LDX.W $0E54                                                          ;B39EE0;
    LDA.L $7E8834,X                                                      ;B39EE3;
    BNE .spitting                                                        ;B39EE7;
    RTS                                                                  ;B39EE9;


.spitting:
    LDA.L $7E803A,X                                                      ;B39EEA;
    SEC                                                                  ;B39EEE;
    SBC.W #$0020                                                         ;B39EEF;
    AND.W #$00FF                                                         ;B39EF2;
    STA.W $060B                                                          ;B39EF5;
    LDA.W #$0005                                                         ;B39EF8;
    STA.W $060D                                                          ;B39EFB;
    LDA.L $7E803E,X                                                      ;B39EFE;
    ASL A                                                                ;B39F02;
    TAY                                                                  ;B39F03;
    LDA.W BotwoonSpitSpeeds,Y                                            ;B39F04;
    STA.W $0E32                                                          ;B39F07;

.loop:
    LDY.W #EnemyProjectile_BotwoonsSpit                                  ;B39F0A;
    LDA.W $0E32                                                          ;B39F0D;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;B39F10;
    LDA.W $060B                                                          ;B39F14;
    CLC                                                                  ;B39F17;
    ADC.W #$0010                                                         ;B39F18;
    AND.W #$00FF                                                         ;B39F1B;
    STA.W $060B                                                          ;B39F1E;
    DEC.W $060D                                                          ;B39F21;
    BNE .loop                                                            ;B39F24;
    LDA.W #$0000                                                         ;B39F26;
    STA.L $7E8834,X                                                      ;B39F29;
    LDA.W #Function_Botwoon_Head_Spitting_Cooldown                       ;B39F2D;
    STA.W EnemyData.work5,X                                              ;B39F30;
    RTS                                                                  ;B39F33;


Function_Botwoon_Head_Spitting_Spawn3SpitProjectiles:
    LDX.W $0E54                                                          ;B39F34;
    LDA.L $7E803A,X                                                      ;B39F37;
    SEC                                                                  ;B39F3B;
    SBC.W #$0010                                                         ;B39F3C;
    AND.W #$00FF                                                         ;B39F3F;
    STA.W $060B                                                          ;B39F42;
    LDA.W #$0003                                                         ;B39F45;
    STA.W $060D                                                          ;B39F48;
    LDA.L $7E803E,X                                                      ;B39F4B;
    ASL A                                                                ;B39F4F;
    TAY                                                                  ;B39F50;
    LDA.W BotwoonSpitSpeeds,Y                                            ;B39F51;
    STA.W $0E32                                                          ;B39F54;

.loop:
    LDY.W #EnemyProjectile_BotwoonsSpit                                  ;B39F57;
    LDA.W $0E32                                                          ;B39F5A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;B39F5D;
    LDA.W $060B                                                          ;B39F61;
    CLC                                                                  ;B39F64;
    ADC.W #$0010                                                         ;B39F65;
    AND.W #$00FF                                                         ;B39F68;
    STA.W $060B                                                          ;B39F6B;
    DEC.W $060D                                                          ;B39F6E;
    BNE .loop                                                            ;B39F71;
    LDA.W #Function_Botwoon_Head_Spitting_Cooldown                       ;B39F73;
    STA.W EnemyData.work5,X                                              ;B39F76;
    RTS                                                                  ;B39F79;


Function_Botwoon_Head_Spitting_Cooldown:
    LDA.L $7E8002,X                                                      ;B39F7A;
    DEC A                                                                ;B39F7E;
    STA.L $7E8002,X                                                      ;B39F7F;
    BPL .return                                                          ;B39F83;
    LDA.W #$0000                                                         ;B39F85;
    STA.L $7E8002,X                                                      ;B39F88;
    LDA.W #Function_Botwoon_Head_MovingAround                            ;B39F8C;
    STA.W EnemyData.work5,X                                              ;B39F8F;

.return:
    RTS                                                                  ;B39F92;


Botwoon_vs_Hole_CollisionDetection:
    LDA.L $7E802A,X                                                      ;B39F93;
    BEQ .collisionNotDisabled                                            ;B39F97;
    JMP.W .return                                                        ;B39F99;


.collisionNotDisabled:
    LDA.W #$0018                                                         ;B39F9C;
    STA.B $12                                                            ;B39F9F;

.loop:
    LDY.B $12                                                            ;B39FA1;
    LDX.W $0E54                                                          ;B39FA3;
    LDA.W EnemyData.xPosition,X                                          ;B39FA6;
    CMP.W BotwoonHoleHitboxes_leftBoundary,Y                             ;B39FA9;
    BMI .notInHole                                                       ;B39FAC;
    LDA.W EnemyData.xPosition,X                                          ;B39FAE;
    CMP.W BotwoonHoleHitboxes_rightBoundary,Y                            ;B39FB1;
    BPL .notInHole                                                       ;B39FB4;
    LDA.W EnemyData.yPosition,X                                          ;B39FB6;
    CMP.W BotwoonHoleHitboxes_topBoundary,Y                              ;B39FB9;
    BMI .notInHole                                                       ;B39FBC;
    LDA.W EnemyData.yPosition,X                                          ;B39FBE;
    CMP.W BotwoonHoleHitboxes_bottomBoundary,Y                           ;B39FC1;
    BPL .notInHole                                                       ;B39FC4;
    LDA.W #$0001                                                         ;B39FC6;
    STA.L $7E802A,X                                                      ;B39FC9;
    LDA.L $7E8026,X                                                      ;B39FCD;
    EOR.W #$0001                                                         ;B39FD1;
    STA.L $7E8026,X                                                      ;B39FD4;
    LDA.W EnemyData.work1,X                                              ;B39FD8;
    STA.L $7E802C,X                                                      ;B39FDB;
    LDA.L $7E800C,X                                                      ;B39FDF;
    DEC A                                                                ;B39FE3;
    STA.L $7E800C,X                                                      ;B39FE4;
    BRA .return                                                          ;B39FE8;


.notInHole:
    LDA.W #$0000                                                         ;B39FEA;
    STA.L $7E802A,X                                                      ;B39FED;
    LDA.B $12                                                            ;B39FF1;
    SEC                                                                  ;B39FF3;
    SBC.W #$0008                                                         ;B39FF4;
    STA.B $12                                                            ;B39FF7;
    BMI .return                                                          ;B39FF9;
    JMP.W .loop                                                          ;B39FFB;


.return:
    RTS                                                                  ;B39FFE;


EnemyTouch_Botwoon:
    JSL.L CommonB3_NormalTouchAI_NoDeathCheck                            ;B39FFF;
    LDX.W $0E54                                                          ;B3A003;
    LDA.W EnemyData.health,X                                             ;B3A006;
    BNE .return                                                          ;B3A009;
    LDA.W #$0001                                                         ;B3A00B;
    STA.L $7E801E,X                                                      ;B3A00E;
    JSR.W SetBotwoonAsIntangible                                         ;B3A012;

.return:
    RTL                                                                  ;B3A015;


EnemyShot_Botwoon:
    LDX.W $0E54                                                          ;B3A016;
    LDA.W EnemyData.health,X                                             ;B3A019;
    STA.L $7E8818,X                                                      ;B3A01C;
    JSL.L CommonB3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic     ;B3A020;
    LDA.L $7E8818,X                                                      ;B3A024;
    CMP.W EnemyData.health,X                                             ;B3A028;
    BEQ .healthUnchanged                                                 ;B3A02B;
    JSL.L RTL_B3957A                                                     ;B3A02D; >.<

.healthUnchanged:
    LDA.W EnemyData.health,X                                             ;B3A031;
    BNE .return                                                          ;B3A034;
    LDA.W #$0001                                                         ;B3A036;
    STA.L $7E801E,X                                                      ;B3A039;
    JSR.W SetBotwoonAsIntangible                                         ;B3A03D;

.return:
    RTL                                                                  ;B3A040;


PowerBombReaction_Botwoon:
    JSL.L CommonB3_NormalEnemyPowerBombAI_NoDeathCheck                   ;B3A041;
    LDX.W $0E54                                                          ;B3A045;
    LDA.W EnemyData.health,X                                             ;B3A048;
    BNE .return                                                          ;B3A04B;
    LDA.W #$0001                                                         ;B3A04D;
    STA.L $7E801E,X                                                      ;B3A050;
    JSR.W SetBotwoonAsIntangible                                         ;B3A054;

.return:
    RTL                                                                  ;B3A057;


BotwoonMovementData_Terminator:
    db $80,$00                                                           ;B3A058;

BotwoonMovementData_Visible_LeftToBottom:
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A05A;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3A06A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3A07A;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF   ;B3A08A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A09A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3A0AA;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01   ;B3A0BA;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3A0CA;
    db $00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00   ;B3A0DA;
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01   ;B3A0EA;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3A0FA;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3A10A;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3A11A;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3A12A;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01   ;B3A13A;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3A14A;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3A15A;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01   ;B3A16A;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A17A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A18A;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3A19A;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF   ;B3A1AA;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3A1BA;
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3A1CA;
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3A1DA;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00   ;B3A1EA;
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3A1FA;
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3A20A;
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3A21A;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3A22A;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3A23A;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01   ;B3A24A;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3A25A;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01   ;B3A26A;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3A27A;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3A28A;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3A29A;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3A2AA;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3A2BA;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3A2CA;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3A2DA;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3A2EA;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3A2FA;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01   ;B3A30A;
    db $FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$80,$00   ;B3A31A;

BotwoonMovementData_Visible_LeftToTop:
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3A32A;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01   ;B3A33A;
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00   ;B3A34A;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01   ;B3A35A;
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01   ;B3A36A;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3A37A;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3A38A;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3A39A;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3A3AA;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3A3BA;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01,$FF,$00   ;B3A3CA;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3A3DA;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3A3EA;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3A3FA;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00   ;B3A40A;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3A41A;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3A42A;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A43A;
    db $00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A44A;
    db $00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A45A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A46A;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A47A;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A48A;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00   ;B3A49A;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3A4AA;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF   ;B3A4BA;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3A4CA;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3A4DA;
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3A4EA;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3A4FA;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3A50A;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3A51A;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3A52A;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3A53A;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3A54A;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3A55A;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3A56A;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3A57A;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3A58A;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3A59A;
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3A5AA;
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3A5BA;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF   ;B3A5CA;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00   ;B3A5DA;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3A5EA;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3A5FA;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3A60A;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3A61A;
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3A62A;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3A63A;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3A64A;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3A65A;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF   ;B3A66A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3A67A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A68A;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A69A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$80,$F0,$00,$00,$00,$00   ;B3A6AA;
    db $80,$00                                                           ;B3A6BA;

BotwoonMovementData_Visible_LeftToRight:
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3A6BC;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3A6CC;
    db $01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3A6DC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01   ;B3A6EC;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3A6FC;
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3A70C;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3A71C;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3A72C;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$01   ;B3A73C;
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01   ;B3A74C;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3A75C;
    db $01,$00,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00   ;B3A76C;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$01   ;B3A77C;
    db $01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3A78C;
    db $01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$01,$01,$01,$00   ;B3A79C;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A7AC;
    db $01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3A7BC;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3A7CC;
    db $01,$00,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00   ;B3A7DC;
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF   ;B3A7EC;
    db $01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3A7FC;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF   ;B3A80C;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3A81C;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3A82C;
    db $01,$00,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3A83C;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF   ;B3A84C;
    db $01,$00,$00,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3A85C;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A86C;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A87C;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A88C;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3A89C;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$00   ;B3A8AC;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01   ;B3A8BC;
    db $01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3A8CC;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$00   ;B3A8DC;
    db $00,$01,$FF,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3A8EC;
    db $FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3A8FC;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3A90C;
    db $FF,$00,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF   ;B3A91C;
    db $00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3A92C;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00   ;B3A93C;
    db $00,$FF,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3A94C;
    db $01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3A95C;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A96C;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF   ;B3A97C;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A98C;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A99C;
    db $00,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3A9AC;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A9BC;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3A9CC;
    db $01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3A9DC;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3A9EC;
    db $01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3A9FC;
    db $01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3AA0C;
    db $01,$00,$00,$01,$01,$00,$80,$00                                   ;B3AA1C;

BotwoonMovementData_Visible_LeftToLeft:
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00   ;B3AA24;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00   ;B3AA34;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3AA44;
    db $00,$01,$01,$00,$01,$01,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01   ;B3AA54;
    db $01,$00,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3AA64;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01   ;B3AA74;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3AA84;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3AA94;
    db $00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3AAA4;
    db $01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3AAB4;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3AAC4;
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3AAD4;
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01   ;B3AAE4;
    db $00,$01,$01,$00,$00,$01,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01   ;B3AAF4;
    db $01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$01,$01   ;B3AB04;
    db $01,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3AB14;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3AB24;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3AB34;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF   ;B3AB44;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$00,$FF   ;B3AB54;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3AB64;
    db $01,$00,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3AB74;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3AB84;
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3AB94;
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00   ;B3ABA4;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF   ;B3ABB4;
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3ABC4;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3ABD4;
    db $00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3ABE4;
    db $01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3ABF4;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3AC04;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01   ;B3AC14;
    db $00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3AC24;
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3AC34;
    db $FF,$00,$00,$01,$FF,$01,$FF,$01,$00,$01,$FF,$00,$FF,$01,$FF,$00   ;B3AC44;
    db $00,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00   ;B3AC54;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3AC64;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3AC74;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3AC84;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3AC94;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00   ;B3ACA4;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3ACB4;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$00,$FF   ;B3ACC4;
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF   ;B3ACD4;
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3ACE4;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3ACF4;
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3AD04;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3AD14;
    db $FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3AD24;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF   ;B3AD34;
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3AD44;
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3AD54;
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3AD64;
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3AD74;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3AD84;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3AD94;
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3ADA4;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3ADB4;
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3ADC4;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00   ;B3ADD4;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00   ;B3ADE4;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$80,$00                           ;B3ADF4;

BotwoonMovementData_Visible_BottomToLeft:
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3ADFE;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3AE0E;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3AE1E;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3AE2E;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3AE3E;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF   ;B3AE4E;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3AE5E;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3AE6E;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3AE7E;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3AE8E;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3AE9E;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3AEAE;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3AEBE;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF   ;B3AECE;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3AEDE;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00   ;B3AEEE;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3AEFE;
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00   ;B3AF0E;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3AF1E;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00   ;B3AF2E;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3AF3E;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3AF4E;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3AF5E;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3AF6E;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;B3AF7E;
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00   ;B3AF8E;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3AF9E;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3AFAE;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3AFBE;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3AFCE;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF   ;B3AFDE;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3AFEE;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3AFFE;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3B00E;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3B01E;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3B02E;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3B03E;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3B04E;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3B05E;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01,$FF,$01,$00,$01,$FF,$00   ;B3B06E;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3B07E;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3B08E;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3B09E;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3B0AE;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3B0BE;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3B0CE;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3B0DE;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00   ;B3B0EE;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00   ;B3B0FE;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01   ;B3B10E;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3B11E;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3B12E;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00   ;B3B13E;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01   ;B3B14E;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$80,$00                   ;B3B15E;

BotwoonMovementData_Visible_BottomToTop:
    db $01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3B16A;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3B17A;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3B18A;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3B19A;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B1AA;
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B1BA;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3B1CA;
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3B1DA;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF   ;B3B1EA;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3B1FA;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3B20A;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01   ;B3B21A;
    db $FF,$00,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3B22A;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3B23A;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3B24A;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B25A;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$01   ;B3B26A;
    db $00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01   ;B3B27A;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3B28A;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3B29A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3B2AA;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3B2BA;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3B2CA;
    db $00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3B2DA;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00   ;B3B2EA;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B2FA;
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3B30A;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B31A;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B32A;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;B3B33A;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3B34A;
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3B35A;
    db $FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3B36A;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3B37A;
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00   ;B3B38A;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3B39A;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3B3AA;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3B3BA;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3B3CA;
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01   ;B3B3DA;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3B3EA;
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3B3FA;
    db $00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3B40A;
    db $00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3B41A;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$01   ;B3B42A;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00   ;B3B43A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3B44A;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3B45A;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3B46A;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3B47A;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3B48A;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3B49A;
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3B4AA;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3B4BA;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF   ;B3B4CA;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B4DA;
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B4EA;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3B4FA;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00   ;B3B50A;
    db $FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01   ;B3B51A;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3B52A;
    db $FF,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3B53A;
    db $FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$80,$00                   ;B3B54A;

BotwoonMovementData_Visible_BottomToRight:
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF   ;B3B556;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3B566;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3B576;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3B586;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3B596;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3B5A6;
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3B5B6;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B5C6;
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B5D6;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B5E6;
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B5F6;
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3B606;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3B616;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF   ;B3B626;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01   ;B3B636;
    db $FF,$00,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3B646;
    db $FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3B656;
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B666;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B676;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B686;
    db $FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B696;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B6A6;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3B6B6;
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3B6C6;
    db $00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00   ;B3B6D6;
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01   ;B3B6E6;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00   ;B3B6F6;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3B706;
    db $01,$01,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3B716;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3B726;
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3B736;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01   ;B3B746;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3B756;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF   ;B3B766;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3B776;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3B786;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3B796;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3B7A6;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3B7B6;
    db $01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00   ;B3B7C6;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3B7D6;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3B7E6;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3B7F6;
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3B806;
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3B816;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3B826;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3B836;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B846;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3B856;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3B866;
    db $00,$FF,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3B876;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3B886;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3B896;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3B8A6;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3B8B6;
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$01,$00,$01   ;B3B8C6;
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3B8D6;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B8E6;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B8F6;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B906;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3B916;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3B926;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3B936;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$80,$00   ;B3B946;

BotwoonMovementData_Visible_BottomToBottom:
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3B956;
    db $00,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF   ;B3B966;
    db $FF,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF   ;B3B976;
    db $FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF   ;B3B986;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B996;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3B9A6;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3B9B6;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3B9C6;
    db $FF,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3B9D6;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3B9E6;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3B9F6;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3BA06;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00   ;B3BA16;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3BA26;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3BA36;
    db $01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00   ;B3BA46;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3BA56;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3BA66;
    db $01,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3BA76;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3BA86;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3BA96;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3BAA6;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3BAB6;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00   ;B3BAC6;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3BAD6;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3BAE6;
    db $01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3BAF6;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3BB06;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3BB16;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3BB26;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3BB36;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3BB46;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$01   ;B3BB56;
    db $01,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01   ;B3BB66;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3BB76;
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$01   ;B3BB86;
    db $00,$01,$FF,$00,$00,$01,$FF,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00   ;B3BB96;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01   ;B3BBA6;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3BBB6;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3BBC6;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3BBD6;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3BBE6;
    db $FF,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3BBF6;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$01   ;B3BC06;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3BC16;
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01   ;B3BC26;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3BC36;
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01   ;B3BC46;
    db $FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3BC56;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01   ;B3BC66;
    db $FF,$00,$00,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$80,$00   ;B3BC76;

BotwoonMovementData_Visible_TopToLeft:
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3BC86;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3BC96;
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01   ;B3BCA6;
    db $FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01   ;B3BCB6;
    db $FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01   ;B3BCC6;
    db $00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01   ;B3BCD6;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3BCE6;
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3BCF6;
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3BD06;
    db $01,$00,$00,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3BD16;
    db $01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3BD26;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3BD36;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01   ;B3BD46;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3BD56;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3BD66;
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00   ;B3BD76;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00   ;B3BD86;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$01,$01   ;B3BD96;
    db $00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01   ;B3BDA6;
    db $01,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01   ;B3BDB6;
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3BDC6;
    db $00,$01,$FF,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$01   ;B3BDD6;
    db $FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3BDE6;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3BDF6;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3BE06;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3BE16;
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00   ;B3BE26;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00   ;B3BE36;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3BE46;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3BE56;
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF   ;B3BE66;
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00   ;B3BE76;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3BE86;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00   ;B3BE96;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3BEA6;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3BEB6;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00   ;B3BEC6;
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3BED6;
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3BEE6;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00   ;B3BEF6;
    db $00,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3BF06;
    db $00,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01   ;B3BF16;
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01   ;B3BF26;
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3BF36;
    db $01,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00   ;B3BF46;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3BF56;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3BF66;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3BF76;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3BF86;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3BF96;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3BFA6;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;B3BFB6;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3BFC6;
    db $FF,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF   ;B3BFD6;
    db $FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3BFE6;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3BFF6;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3C006;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3C016;
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3C026;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3C036;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3C046;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3C056;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00   ;B3C066;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$80,$00   ;B3C076;

BotwoonMovementData_Visible_TopToBottom:
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01   ;B3C086;
    db $FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3C096;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3C0A6;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3C0B6;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3C0C6;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3C0D6;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00   ;B3C0E6;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00   ;B3C0F6;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C106;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C116;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C126;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C136;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF   ;B3C146;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C156;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3C166;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3C176;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3C186;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3C196;
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01   ;B3C1A6;
    db $00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3C1B6;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01   ;B3C1C6;
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01   ;B3C1D6;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00   ;B3C1E6;
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3C1F6;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3C206;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3C216;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3C226;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3C236;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3C246;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3C256;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00   ;B3C266;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3C276;
    db $00,$01,$01,$00,$00,$01,$01,$00,$80,$00                           ;B3C286;

BotwoonMovementData_Visible_TopToRight:
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3C290;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3C2A0;
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3C2B0;
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$00,$01   ;B3C2C0;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3C2D0;
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01   ;B3C2E0;
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3C2F0;
    db $01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3C300;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01   ;B3C310;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3C320;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3C330;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3C340;
    db $FF,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01   ;B3C350;
    db $FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3C360;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3C370;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3C380;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3C390;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3C3A0;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3C3B0;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3C3C0;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00   ;B3C3D0;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C3E0;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C3F0;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01   ;B3C400;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C410;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C420;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3C430;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3C440;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3C450;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3C460;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3C470;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3C480;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3C490;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3C4A0;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00   ;B3C4B0;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3C4C0;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3C4D0;
    db $01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3C4E0;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3C4F0;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3C500;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3C510;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3C520;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3C530;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3C540;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3C550;
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3C560;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3C570;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00   ;B3C580;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3C590;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3C5A0;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3C5B0;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3C5C0;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01   ;B3C5D0;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3C5E0;
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3C5F0;
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3C600;
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00   ;B3C610;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00   ;B3C620;
    db $00,$01,$01,$00,$00,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3C630;
    db $01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$00,$01   ;B3C640;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3C650;
    db $00,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3C660;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3C670;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$80,$00   ;B3C680;

BotwoonMovementData_Visible_TopToTop:
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3C690;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3C6A0;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3C6B0;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01   ;B3C6C0;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00   ;B3C6D0;
    db $00,$01,$01,$00,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00   ;B3C6E0;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3C6F0;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3C700;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3C710;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3C720;
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3C730;
    db $01,$00,$00,$01,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00   ;B3C740;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3C750;
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3C760;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3C770;
    db $00,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3C780;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3C790;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C7A0;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3C7B0;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3C7C0;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3C7D0;
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$FF   ;B3C7E0;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;B3C7F0;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3C800;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3C810;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3C820;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3C830;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3C840;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3C850;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3C860;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3C870;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3C880;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3C890;
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3C8A0;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3C8B0;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3C8C0;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00   ;B3C8D0;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3C8E0;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3C8F0;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3C900;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;B3C910;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3C920;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3C930;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00   ;B3C940;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3C950;
    db $00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3C960;
    db $00,$FF,$01,$00,$00,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3C970;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3C980;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3C990;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3C9A0;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3C9B0;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$80,$00                   ;B3C9C0;

BotwoonMovementData_Visible_RightToLeft:
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF   ;B3C9CC;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3C9DC;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3C9EC;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF   ;B3C9FC;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3CA0C;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3CA1C;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3CA2C;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3CA3C;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00   ;B3CA4C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3CA5C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3CA6C;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3CA7C;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01,$00,$01,$FF,$00,$00,$01   ;B3CA8C;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3CA9C;
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3CAAC;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3CABC;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01   ;B3CACC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3CADC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3CAEC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3CAFC;
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01   ;B3CB0C;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01   ;B3CB1C;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3CB2C;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3CB3C;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01   ;B3CB4C;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3CB5C;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00   ;B3CB6C;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3CB7C;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3CB8C;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3CB9C;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3CBAC;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3CBBC;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3CBCC;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3CBDC;
    db $01,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3CBEC;
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00   ;B3CBFC;
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00   ;B3CC0C;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00   ;B3CC1C;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3CC2C;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF   ;B3CC3C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00   ;B3CC4C;
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3CC5C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3CC6C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3CC7C;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3CC8C;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3CC9C;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3CCAC;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3CCBC;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3CCCC;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3CCDC;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3CCEC;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3CCFC;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF   ;B3CD0C;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3CD1C;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$FF   ;B3CD2C;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3CD3C;
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00   ;B3CD4C;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3CD5C;
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3CD6C;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3CD7C;
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00   ;B3CD8C;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3CD9C;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF   ;B3CDAC;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$80,$00   ;B3CDBC;

BotwoonMovementData_Visible_RightToBottom:
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3CDCC;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3CDDC;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3CDEC;
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3CDFC;
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3CE0C;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF   ;B3CE1C;
    db $FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF   ;B3CE2C;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3CE3C;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3CE4C;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3CE5C;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3CE6C;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3CE7C;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3CE8C;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3CE9C;
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3CEAC;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01   ;B3CEBC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3CECC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3CEDC;
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3CEEC;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00   ;B3CEFC;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3CF0C;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3CF1C;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3CF2C;
    db $FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3CF3C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3CF4C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3CF5C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3CF6C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3CF7C;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3CF8C;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF   ;B3CF9C;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;B3CFAC;
    db $FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00   ;B3CFBC;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF   ;B3CFCC;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3CFDC;
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3CFEC;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3CFFC;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3D00C;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3D01C;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D02C;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3D03C;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01   ;B3D04C;
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$00,$01   ;B3D05C;
    db $01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3D06C;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3D07C;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3D08C;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3D09C;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01   ;B3D0AC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3D0BC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01   ;B3D0CC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3D0DC;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3D0EC;
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$FF,$00   ;B3D0FC;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3D10C;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF   ;B3D11C;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3D12C;
    db $FF,$00,$80,$00                                                   ;B3D13C;

BotwoonMovementData_Visible_RightToTop:
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3D140;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3D150;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3D160;
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3D170;
    db $FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;B3D180;
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01   ;B3D190;
    db $FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3D1A0;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3D1B0;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3D1C0;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00   ;B3D1D0;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3D1E0;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3D1F0;
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3D200;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3D210;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;B3D220;
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;B3D230;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3D240;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3D250;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3D260;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3D270;
    db $00,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3D280;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3D290;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF   ;B3D2A0;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D2B0;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3D2C0;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3D2D0;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3D2E0;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01   ;B3D2F0;
    db $01,$00,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3D300;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3D310;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3D320;
    db $FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3D330;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01   ;B3D340;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3D350;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3D360;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3D370;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3D380;
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00   ;B3D390;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3D3A0;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3D3B0;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3D3C0;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3D3D0;
    db $01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$00   ;B3D3E0;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3D3F0;
    db $01,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3D400;
    db $01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3D410;
    db $00,$01,$00,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3D420;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3D430;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3D440;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3D450;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;B3D460;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3D470;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF   ;B3D480;
    db $FF,$00,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3D490;
    db $80,$00                                                           ;B3D4A0;

BotwoonMovementData_Visible_RightToRight:
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF   ;B3D4A2;
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3D4B2;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3D4C2;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF   ;B3D4D2;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF   ;B3D4E2;
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00   ;B3D4F2;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00   ;B3D502;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00   ;B3D512;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3D522;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01   ;B3D532;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3D542;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00   ;B3D552;
    db $FF,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01   ;B3D562;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00   ;B3D572;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3D582;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3D592;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3D5A2;
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3D5B2;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01   ;B3D5C2;
    db $FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01,$FF,$01   ;B3D5D2;
    db $00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3D5E2;
    db $00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00,$00,$01   ;B3D5F2;
    db $01,$01,$01,$01,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00   ;B3D602;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3D612;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D622;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D632;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D642;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3D652;
    db $00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00   ;B3D662;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01   ;B3D672;
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3D682;
    db $01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3D692;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3D6A2;
    db $FF,$00,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$00   ;B3D6B2;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01,$FF,$01   ;B3D6C2;
    db $FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3D6D2;
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00   ;B3D6E2;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;B3D6F2;
    db $FF,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF   ;B3D702;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00   ;B3D712;
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3D722;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3D732;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3D742;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF   ;B3D752;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF   ;B3D762;
    db $01,$00,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00   ;B3D772;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3D782;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF   ;B3D792;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D7A2;
    db $01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00   ;B3D7B2;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF   ;B3D7C2;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D7D2;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D7E2;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D7F2;
    db $01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D802;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D812;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D822;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00   ;B3D832;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF   ;B3D842;
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$FF   ;B3D852;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3D862;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$80,$00           ;B3D872;

BotwoonMovementData_Hidden_LeftToFromBottom:
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3D880;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00   ;B3D890;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3D8A0;
    db $01,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01   ;B3D8B0;
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3D8C0;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3D8D0;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3D8E0;
    db $00,$01,$01,$00,$01,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01   ;B3D8F0;
    db $01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3D900;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3D910;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00   ;B3D920;
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01   ;B3D930;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00   ;B3D940;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3D950;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3D960;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00   ;B3D970;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3D980;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3D990;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3D9A0;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3D9B0;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3D9C0;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3D9D0;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3D9E0;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3D9F0;

BotwoonMovementData_Hidden_LeftToFromBottom_End:
    db $80,$00                                                           ;B3DA00;

BotwoonMovementData_Hidden_LeftToFromTop:
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3DA02;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00   ;B3DA12;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3DA22;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3DA32;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3DA42;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3DA52;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3DA62;
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3DA72;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00   ;B3DA82;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3DA92;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3DAA2;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DAB2;
    db $00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF   ;B3DAC2;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3DAD2;
    db $00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00   ;B3DAE2;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3DAF2;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00   ;B3DB02;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3DB12;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00   ;B3DB22;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3DB32;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF   ;B3DB42;
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3DB52;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3DB62;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01   ;B3DB72;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$01   ;B3DB82;
    db $01,$00,$01,$00,$00,$01,$01,$00                                   ;B3DB92;

BotwoonMovementData_Hidden_LeftToFromTop_End:
    db $80,$00                                                           ;B3DB9A;

BotwoonMovementData_Hidden_LeftToFromRight:
    db $00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3DB9C;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3DBAC;
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00   ;B3DBBC;
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01   ;B3DBCC;
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3DBDC;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3DBEC;
    db $00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00   ;B3DBFC;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3DC0C;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01   ;B3DC1C;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3DC2C;
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01   ;B3DC3C;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3DC4C;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3DC5C;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3DC6C;
    db $00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3DC7C;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DC8C;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DC9C;
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DCAC;
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3DCBC;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DCCC;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DCDC;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DCEC;
    db $00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00   ;B3DCFC;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00   ;B3DD0C;
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DD1C;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3DD2C;
    db $01,$00,$01,$00                                                   ;B3DD3C;

BotwoonMovementData_Hidden_LeftToFromRight_End:
    db $80,$00                                                           ;B3DD40;

BotwoonMovementData_Hidden_BottomToFromTop:
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3DD42;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3DD52;
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF   ;B3DD62;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00   ;B3DD72;
    db $00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3DD82;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3DD92;
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00   ;B3DDA2;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00   ;B3DDB2;
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF   ;B3DDC2;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;B3DDD2;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$00,$FF   ;B3DDE2;
    db $FF,$00,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF   ;B3DDF2;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3DE02;
    db $00,$FF,$01,$00,$00,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3DE12;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00   ;B3DE22;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DE32;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3DE42;
    db $00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3DE52;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3DE62;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF                           ;B3DE72;

BotwoonMovementData_Hidden_BottomToFromTop_End:
    db $80,$00                                                           ;B3DE7C;

BotwoonMovementData_Hidden_BottomToFromRight:
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3DE7E;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3DE8E;
    db $01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3DE9E;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3DEAE;
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3DEBE;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF   ;B3DECE;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;B3DEDE;
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3DEEE;
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00   ;B3DEFE;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00   ;B3DF0E;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DF1E;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3DF2E;
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3DF3E;
    db $01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00   ;B3DF4E;
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;B3DF5E;
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01   ;B3DF6E;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00   ;B3DF7E;
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00   ;B3DF8E;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00   ;B3DF9E;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3DFAE;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3DFBE;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3DFCE;

BotwoonMovementData_Hidden_BottomToFromRight_End:
    db $80,$00                                                           ;B3DFDE;

BotwoonMovementData_Hidden_TopToFromRight:
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3DFE0;
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01   ;B3DFF0;
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3E000;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3E010;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01   ;B3E020;
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00   ;B3E030;
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3E040;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00   ;B3E050;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3E060;
    db $00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF   ;B3E070;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3E080;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF   ;B3E090;
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3E0A0;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00   ;B3E0B0;
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$00,$01   ;B3E0C0;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00   ;B3E0D0;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;B3E0E0;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01   ;B3E0F0;
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01   ;B3E100;
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01   ;B3E110;
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;B3E120;
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;B3E130;
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF           ;B3E140;

BotwoonMovementData_Hidden_TopToFromRight_End:
    db $80,$00                                                           ;B3E14E;

BotwoonMovementTable:
    dw BotwoonMovementData_Visible_LeftToBottom                          ;B3E150;
    dw $0000,$0008,$0000                                                 ;B3E152;
    dw BotwoonMovementData_Visible_LeftToTop                             ;B3E158;
    dw $0000,$0010,$0000                                                 ;B3E15A;
    dw BotwoonMovementData_Visible_LeftToRight                           ;B3E160;
    dw $0000,$0018,$0000                                                 ;B3E162;
    dw BotwoonMovementData_Visible_LeftToLeft                            ;B3E168;
    dw $0000,$0000,$0000                                                 ;B3E16A;
    dw BotwoonMovementData_Visible_BottomToLeft                          ;B3E170;
    dw $0000,$0000,$0000                                                 ;B3E172;
    dw BotwoonMovementData_Visible_BottomToTop                           ;B3E178;
    dw $0000,$0010,$0000                                                 ;B3E17A;
    dw BotwoonMovementData_Visible_BottomToRight                         ;B3E180;
    dw $0000,$0018,$0000                                                 ;B3E182;
    dw BotwoonMovementData_Visible_BottomToBottom                        ;B3E188;
    dw $0000,$0008,$0000                                                 ;B3E18A;
    dw BotwoonMovementData_Visible_TopToLeft                             ;B3E190;
    dw $0000,$0000,$0000                                                 ;B3E192;
    dw BotwoonMovementData_Visible_TopToBottom                           ;B3E198;
    dw $0000,$0008,$0000                                                 ;B3E19A;
    dw BotwoonMovementData_Visible_TopToRight                            ;B3E1A0;
    dw $0000,$0018,$0000                                                 ;B3E1A2;
    dw BotwoonMovementData_Visible_TopToTop                              ;B3E1A8;
    dw $0000,$0010,$0000                                                 ;B3E1AA;
    dw BotwoonMovementData_Visible_RightToLeft                           ;B3E1B0;
    dw $0000,$0000,$0000                                                 ;B3E1B2;
    dw BotwoonMovementData_Visible_RightToBottom                         ;B3E1B8;
    dw $0000,$0008,$0000                                                 ;B3E1BA;
    dw BotwoonMovementData_Visible_RightToTop                            ;B3E1C0;
    dw $0000,$0010,$0000                                                 ;B3E1C2;
    dw BotwoonMovementData_Visible_RightToRight                          ;B3E1C8;
    dw $0000,$0018,$0000                                                 ;B3E1CA;
    dw BotwoonMovementData_Hidden_LeftToFromBottom                       ;B3E1D0;
    dw $0000,$0008,$0000                                                 ;B3E1D2;
    dw BotwoonMovementData_Hidden_LeftToFromTop                          ;B3E1D8;
    dw $0000,$0010,$0000                                                 ;B3E1DA;
    dw BotwoonMovementData_Hidden_LeftToFromRight                        ;B3E1E0;
    dw $0000,$0018,$0000                                                 ;B3E1E2;
    dw BotwoonMovementData_Hidden_LeftToFromRight                        ;B3E1E8;
    dw $0000,$0018,$0000                                                 ;B3E1EA;
    dw BotwoonMovementData_Hidden_LeftToFromBottom_End                   ;B3E1F0;
    dw $FFFF,$0000,$0000                                                 ;B3E1F2;
    dw BotwoonMovementData_Hidden_BottomToFromTop                        ;B3E1F8;
    dw $0000,$0010,$0000                                                 ;B3E1FA;
    dw BotwoonMovementData_Hidden_BottomToFromRight                      ;B3E200;
    dw $0000,$0018,$0000                                                 ;B3E202;
    dw BotwoonMovementData_Hidden_BottomToFromRight                      ;B3E208;
    dw $0000,$0018,$0000                                                 ;B3E20A;
    dw BotwoonMovementData_Hidden_LeftToFromTop_End                      ;B3E210;
    dw $FFFF,$0000,$0000                                                 ;B3E212;
    dw BotwoonMovementData_Hidden_BottomToFromTop_End                    ;B3E218;
    dw $FFFF,$0008,$0000                                                 ;B3E21A;
    dw BotwoonMovementData_Hidden_TopToFromRight                         ;B3E220;
    dw $0000,$0018,$0000                                                 ;B3E222;
    dw BotwoonMovementData_Hidden_TopToFromRight                         ;B3E228;
    dw $0000,$0018,$0000                                                 ;B3E22A;
    dw BotwoonMovementData_Hidden_LeftToFromRight_End                    ;B3E230;
    dw $FFFF,$0000,$0000                                                 ;B3E232;
    dw BotwoonMovementData_Hidden_BottomToFromRight_End                  ;B3E238;
    dw $FFFF,$0008,$0000                                                 ;B3E23A;
    dw BotwoonMovementData_Hidden_TopToFromRight_End                     ;B3E240;
    dw $FFFF,$0010,$0000                                                 ;B3E242;
    dw BotwoonMovementData_Hidden_TopToFromRight_End                     ;B3E248;
    dw $FFFF,$0010,$0000                                                 ;B3E24A;

Function_Botwoon_Movement_StartMovingAccordingToMovementData:
    LDX.W $0E54                                                          ;B3E250;
    LDA.W #Function_Botwoon_Movement_MoveAccordingToMovementData         ;B3E253;
    STA.W EnemyData.work4,X                                              ;B3E256;
    LDA.W #$0000                                                         ;B3E259;
    STA.L $7E8038,X                                                      ;B3E25C;
    LDA.L $7E8800,X                                                      ;B3E260;
    CLC                                                                  ;B3E264;
    ADC.W #BotwoonMovementTable                                          ;B3E265;
    TAY                                                                  ;B3E268;
    LDA.W $0000,Y                                                        ;B3E269;
    STA.L $7E8804,X                                                      ;B3E26C;
    LDA.W $0004,Y                                                        ;B3E270;
    STA.L $7E802E,X                                                      ;B3E273;
    LDA.W $0002,Y                                                        ;B3E277;
    STA.L $7E8808,X                                                      ;B3E27A;
    BPL Function_Botwoon_Movement_MoveAccordingToMovementData            ;B3E27E;
    LDA.L $7E8804,X                                                      ;B3E280;
    SEC                                                                  ;B3E284;
    SBC.W #$0004                                                         ;B3E285;
    STA.L $7E8804,X                                                      ;B3E288;

Function_Botwoon_Movement_MoveAccordingToMovementData:
    LDX.W $0E54                                                          ;B3E28C;
    STZ.B $12                                                            ;B3E28F;
    STZ.B $14                                                            ;B3E291;
    LDA.L $7E8030,X                                                      ;B3E293;
    STA.B $18                                                            ;B3E297;
    LDA.W #$0002                                                         ;B3E299;
    STA.B $16                                                            ;B3E29C;
    LDA.L $7E8808,X                                                      ;B3E29E;
    BPL .loop                                                            ;B3E2A2;
    LDA.W #$FFFE                                                         ;B3E2A4;
    STA.B $16                                                            ;B3E2A7;

.loop:
    LDA.L $7E8804,X                                                      ;B3E2A9;
    TAY                                                                  ;B3E2AD;
    LDA.W $0000,Y                                                        ;B3E2AE;
    AND.W #$00FF                                                         ;B3E2B1;
    JSL.L Sign_Extend_A                                                  ;B3E2B4;
    CMP.W #$FF80                                                         ;B3E2B8;
    BEQ .end                                                             ;B3E2BB;
    CLC                                                                  ;B3E2BD;
    ADC.B $12                                                            ;B3E2BE;
    STA.B $12                                                            ;B3E2C0;
    LDA.W $0001,Y                                                        ;B3E2C2;
    AND.W #$00FF                                                         ;B3E2C5;
    JSL.L Sign_Extend_A                                                  ;B3E2C8;
    CMP.W #$FF80                                                         ;B3E2CC;
    BEQ .end                                                             ;B3E2CF;
    CLC                                                                  ;B3E2D1;
    ADC.B $14                                                            ;B3E2D2;
    STA.B $14                                                            ;B3E2D4;
    LDA.L $7E8804,X                                                      ;B3E2D6;
    CLC                                                                  ;B3E2DA;
    ADC.B $16                                                            ;B3E2DB;
    STA.L $7E8804,X                                                      ;B3E2DD;
    DEC.B $18                                                            ;B3E2E1;
    BNE .loop                                                            ;B3E2E3;
    LDA.L $7E8808,X                                                      ;B3E2E5;
    BPL .positive                                                        ;B3E2E9;
    LDA.B $12                                                            ;B3E2EB;
    EOR.W #$FFFF                                                         ;B3E2ED;
    INC A                                                                ;B3E2F0;
    STA.B $12                                                            ;B3E2F1;
    LDA.B $14                                                            ;B3E2F3;
    EOR.W #$FFFF                                                         ;B3E2F5;
    INC A                                                                ;B3E2F8;
    STA.B $14                                                            ;B3E2F9;

.positive:
    LDA.W EnemyData.xPosition,X                                          ;B3E2FB;
    CLC                                                                  ;B3E2FE;
    ADC.B $12                                                            ;B3E2FF;
    STA.W EnemyData.xPosition,X                                          ;B3E301;
    LDA.W EnemyData.yPosition,X                                          ;B3E304;
    CLC                                                                  ;B3E307;
    ADC.B $14                                                            ;B3E308;
    STA.W EnemyData.yPosition,X                                          ;B3E30A;
    RTS                                                                  ;B3E30D;


.end:
    LDA.W #$0000                                                         ;B3E30E;
    STA.L $7E8802,X                                                      ;B3E311;
    LDA.W #$0001                                                         ;B3E315;
    STA.L $7E8038,X                                                      ;B3E318;
    RTS                                                                  ;B3E31C;


Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft:
    dw $0002,$81F8                                                       ;B3E31D;
    db $F7                                                               ;B3E321;
    dw $2122,$81F8                                                       ;B3E322;
    db $E7                                                               ;B3E326;
    dw $2120                                                             ;B3E327;

Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft:
    dw $0002,$81F8                                                       ;B3E329;
    db $F6                                                               ;B3E32D;
    dw $2106,$81F0                                                       ;B3E32E;
    db $EE                                                               ;B3E332;
    dw $2104                                                             ;B3E333;

Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft:
    dw $0002,$81FC                                                       ;B3E335;
    db $F8                                                               ;B3E339;
    dw $2102,$81EC                                                       ;B3E33A;
    db $F8                                                               ;B3E33E;
    dw $2100                                                             ;B3E33F;

Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft:
    dw $0002,$81F8                                                       ;B3E341;
    db $F9                                                               ;B3E345;
    dw $210A,$81F0                                                       ;B3E346;
    db $01                                                               ;B3E34A;
    dw $2108                                                             ;B3E34B;

Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft:
    dw $0002,$81F8                                                       ;B3E34D;
    db $09                                                               ;B3E351;
    dw $210E,$81F8                                                       ;B3E352;
    db $F9                                                               ;B3E356;
    dw $210C                                                             ;B3E357;

Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight:
    dw $0002,$81F8                                                       ;B3E359;
    db $09                                                               ;B3E35D;
    dw $610E,$81F8                                                       ;B3E35E;
    db $F9                                                               ;B3E362;
    dw $610C                                                             ;B3E363;

Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight:
    dw $0002,$8000                                                       ;B3E365;
    db $01                                                               ;B3E369;
    dw $6108,$81F8                                                       ;B3E36A;
    db $F9                                                               ;B3E36E;
    dw $610A                                                             ;B3E36F;

Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight:
    dw $0002,$81F4                                                       ;B3E371;
    db $F8                                                               ;B3E375;
    dw $6102,$8004                                                       ;B3E376;
    db $F8                                                               ;B3E37A;
    dw $6100                                                             ;B3E37B;

Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight:
    dw $0002,$8000                                                       ;B3E37D;
    db $EE                                                               ;B3E381;
    dw $6104,$81F8                                                       ;B3E382;
    db $F6                                                               ;B3E386;
    dw $6106                                                             ;B3E387;

Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight:
    dw $0002,$81F8                                                       ;B3E389;
    db $F7                                                               ;B3E38D;
    dw $6122,$81F8                                                       ;B3E38E;
    db $E7                                                               ;B3E392;
    dw $6120                                                             ;B3E393;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingLeft:
    dw $0002,$81F8                                                       ;B3E395;
    db $F8                                                               ;B3E399;
    dw $2126,$81F8                                                       ;B3E39A;
    db $E8                                                               ;B3E39E;
    dw $2124                                                             ;B3E39F;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpLeft:
    dw $0003,$01F0                                                       ;B3E3A1;
    db $00                                                               ;B3E3A5;
    dw $21A6,$81F8                                                       ;B3E3A6;
    db $F8                                                               ;B3E3AA;
    dw $2186,$81F0                                                       ;B3E3AB;
    db $F0                                                               ;B3E3AF;
    dw $2184                                                             ;B3E3B0;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingLeft:
    dw $0002,$81FC                                                       ;B3E3B2;
    db $F8                                                               ;B3E3B6;
    dw $2182,$81EC                                                       ;B3E3B7;
    db $F8                                                               ;B3E3BB;
    dw $2180                                                             ;B3E3BC;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownLeft:
    dw $0003,$0000                                                       ;B3E3BE;
    db $09                                                               ;B3E3C2;
    dw $21A7,$81F8                                                       ;B3E3C3;
    db $F9                                                               ;B3E3C7;
    dw $218A,$81F0                                                       ;B3E3C8;
    db $01                                                               ;B3E3CC;
    dw $2188                                                             ;B3E3CD;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDown_FacingLeft:
    dw $0002,$81F8                                                       ;B3E3CF;
    db $09                                                               ;B3E3D3;
    dw $218E,$81F8                                                       ;B3E3D4;
    db $F9                                                               ;B3E3D8;
    dw $218C                                                             ;B3E3D9;

Spritemaps_Botwoon_MouthOpen_Priority2_AimDown_FacingRight:
    dw $0002,$81F8                                                       ;B3E3DB;
    db $09                                                               ;B3E3DF;
    dw $618E,$81F8                                                       ;B3E3E0;
    db $F9                                                               ;B3E3E4;
    dw $618C                                                             ;B3E3E5;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownRight:
    dw $0003,$01F8                                                       ;B3E3E7;
    db $09                                                               ;B3E3EB;
    dw $61A7,$81F8                                                       ;B3E3EC;
    db $F9                                                               ;B3E3F0;
    dw $618A,$8000                                                       ;B3E3F1;
    db $01                                                               ;B3E3F5;
    dw $6188                                                             ;B3E3F6;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingRight:
    dw $0002,$81F4                                                       ;B3E3F8;
    db $F8                                                               ;B3E3FC;
    dw $6182,$8004                                                       ;B3E3FD;
    db $F8                                                               ;B3E401;
    dw $6180                                                             ;B3E402;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpRight:
    dw $0003,$0008                                                       ;B3E404;
    db $00                                                               ;B3E408;
    dw $61A6,$81F8                                                       ;B3E409;
    db $F8                                                               ;B3E40D;
    dw $6186,$8000                                                       ;B3E40E;
    db $F0                                                               ;B3E412;
    dw $6184                                                             ;B3E413;

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingRight:
    dw $0002,$81F8                                                       ;B3E415;
    db $F8                                                               ;B3E419;
    dw $6126,$81F8                                                       ;B3E41A;
    db $E8                                                               ;B3E41E;
    dw $6124                                                             ;B3E41F;

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUp_FacingLeft:
    dw $0002,$81F8                                                       ;B3E421;
    db $F7                                                               ;B3E425;
    dw $0122,$81F8                                                       ;B3E426;
    db $E7                                                               ;B3E42A;
    dw $0120                                                             ;B3E42B;

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpLeft:
    dw $0002,$81F8                                                       ;B3E42D;
    db $F6                                                               ;B3E431;
    dw $0106,$81F0                                                       ;B3E432;
    db $EE                                                               ;B3E436;
    dw $0104                                                             ;B3E437;

Spritemaps_Botwoon_MouthClosed_Priority0_AimingLeft:
    dw $0002,$81FC                                                       ;B3E439;
    db $F8                                                               ;B3E43D;
    dw $0102,$81EC                                                       ;B3E43E;
    db $F8                                                               ;B3E442;
    dw $0100                                                             ;B3E443;

Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownLeft:
    dw $0002,$81F8                                                       ;B3E445;
    db $F9                                                               ;B3E449;
    dw $010A,$81F0                                                       ;B3E44A;
    db $01                                                               ;B3E44E;
    dw $0108                                                             ;B3E44F;

Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingLeft:
    dw $0002,$81F8                                                       ;B3E451;
    db $09                                                               ;B3E455;
    dw $010E,$81F8                                                       ;B3E456;
    db $F9                                                               ;B3E45A;
    dw $010C                                                             ;B3E45B;

Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingRight:
    dw $0002,$81F8                                                       ;B3E45D;
    db $09                                                               ;B3E461;
    dw $410E,$81F8                                                       ;B3E462;
    db $F9                                                               ;B3E466;
    dw $410C                                                             ;B3E467;

Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownRight:
    dw $0002,$8000                                                       ;B3E469;
    db $01                                                               ;B3E46D;
    dw $4108,$81F8                                                       ;B3E46E;
    db $F9                                                               ;B3E472;
    dw $410A                                                             ;B3E473;

Spritemaps_Botwoon_MouthClosed_Priority0_AimingRight:
    dw $0002,$81F4                                                       ;B3E475;
    db $F8                                                               ;B3E479;
    dw $4102,$8004                                                       ;B3E47A;
    db $F8                                                               ;B3E47E;
    dw $4100                                                             ;B3E47F;

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpRight:
    dw $0002,$8000                                                       ;B3E481;
    db $EE                                                               ;B3E485;
    dw $4104,$81F8                                                       ;B3E486;
    db $F6                                                               ;B3E48A;
    dw $4106                                                             ;B3E48B;

Spritemaps_Botwoon_MouthClosed_Priority0_AimUp_FacingRight:
    dw $0002,$81F8                                                       ;B3E48D;
    db $F7                                                               ;B3E491;
    dw $4122,$81F8                                                       ;B3E492;
    db $E7                                                               ;B3E496;
    dw $4120                                                             ;B3E497;

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpFaceLeft_B3E499:
    dw $0002,$81F8                                                       ;B3E499;
    db $F8                                                               ;B3E49D;
    dw $0126,$81F8                                                       ;B3E49E;
    db $E8                                                               ;B3E4A2;
    dw $0124                                                             ;B3E4A3;

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpLeft_B3E4A5:
    dw $0003,$01F0                                                       ;B3E4A5;
    db $00                                                               ;B3E4A9;
    dw $01A6,$81F8                                                       ;B3E4AA;
    db $F8                                                               ;B3E4AE;
    dw $0186,$81F0                                                       ;B3E4AF;
    db $F0                                                               ;B3E4B3;
    dw $0184                                                             ;B3E4B4;

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_Left_B3E4B6:
    dw $0002,$81FC                                                       ;B3E4B6;
    db $F8                                                               ;B3E4BA;
    dw $0182,$81EC                                                       ;B3E4BB;
    db $F8                                                               ;B3E4BF;
    dw $0180                                                             ;B3E4C0;

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_DownLeft_B3E4C2:
    dw $0003,$0000                                                       ;B3E4C2;
    db $09                                                               ;B3E4C6;
    dw $01A7,$81F8                                                       ;B3E4C7;
    db $F9                                                               ;B3E4CB;
    dw $018A,$81F0                                                       ;B3E4CC;
    db $01                                                               ;B3E4D0;
    dw $0188                                                             ;B3E4D1;

UNUSED_Spritemap_Botwoon_MouthOpen_Prio0_DownFaceLeft_B3E4D3:
    dw $0002,$81F8                                                       ;B3E4D3;
    db $09                                                               ;B3E4D7;
    dw $018E,$81F8                                                       ;B3E4D8;
    db $F9                                                               ;B3E4DC;
    dw $018C                                                             ;B3E4DD;

UNUSED_Spritemap_Botwoon_MouthOpen_Pri0_DownFaceRight_B3E4DF:
    dw $0002,$81F8                                                       ;B3E4DF;
    db $09                                                               ;B3E4E3;
    dw $418E,$81F8                                                       ;B3E4E4;
    db $F9                                                               ;B3E4E8;
    dw $418C                                                             ;B3E4E9;

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_DownRight_B3E4EB:
    dw $0003,$01F8                                                       ;B3E4EB;
    db $09                                                               ;B3E4EF;
    dw $41A7,$81F8                                                       ;B3E4F0;
    db $F9                                                               ;B3E4F4;
    dw $418A,$8000                                                       ;B3E4F5;
    db $01                                                               ;B3E4F9;
    dw $4188                                                             ;B3E4FA;

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_Right_B3E4FC:
    dw $0002,$81F4                                                       ;B3E4FC;
    db $F8                                                               ;B3E500;
    dw $4182,$8004                                                       ;B3E501;
    db $F8                                                               ;B3E505;
    dw $4180                                                             ;B3E506;

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpRight_B3E508:
    dw $0003,$0008                                                       ;B3E508;
    db $00                                                               ;B3E50C;
    dw $41A6,$81F8                                                       ;B3E50D;
    db $F8                                                               ;B3E511;
    dw $4186,$8000                                                       ;B3E512;
    db $F0                                                               ;B3E516;
    dw $4184                                                             ;B3E517;

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpFaceRight_B3E519:
    dw $0002,$81F8                                                       ;B3E519;
    db $F8                                                               ;B3E51D;
    dw $4126,$81F8                                                       ;B3E51E;
    db $E8                                                               ;B3E522;
    dw $4124                                                             ;B3E523;

Palette_EtecoonEscape:
    dw $3800,$5F97,$56F2,$2987,$00A0,$6355,$4AB0,$3A0B                   ;B3E525;
    dw $31C9,$57FF,$42F7,$2610,$158C,$03FF,$0279,$0029                   ;B3E535;

Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE:
    LDA.W $1962                                                          ;B3E545;
    CMP.W #$00CE                                                         ;B3E548;
    BCS .greaterThanCE                                                   ;B3E54B;
    LDA.W $0000,Y                                                        ;B3E54D;
    TAY                                                                  ;B3E550;
    RTL                                                                  ;B3E551;


.greaterThanCE:
    INY                                                                  ;B3E552;
    INY                                                                  ;B3E553;
    RTL                                                                  ;B3E554;


RTS_B3E555:
    RTS                                                                  ;B3E555;


InstList_EtecoonEscape_RunningLeft_LowTide_0:
    dw Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE          ;B3E556;
    dw InstList_EtecoonEscape_RunningLeft_HighTide                       ;B3E558;

InstList_EtecoonEscape_RunningLeft_LowTide_1:
    dw $0005                                                             ;B3E55A;
    dw Spritemaps_EtecoonEscape_0                                        ;B3E55C;
    dw $0005                                                             ;B3E55E;
    dw Spritemaps_EtecoonEscape_1                                        ;B3E560;
    dw $0005                                                             ;B3E562;
    dw Spritemaps_EtecoonEscape_2                                        ;B3E564;
    dw $0005                                                             ;B3E566;
    dw Spritemaps_EtecoonEscape_1                                        ;B3E568;
    dw Instruction_Common_GotoY                                          ;B3E56A;
    dw InstList_EtecoonEscape_RunningLeft_LowTide_1                      ;B3E56C;

InstList_EtecoonEscape_RunningLeft_HighTide:
    dw $0003                                                             ;B3E56E;
    dw Spritemaps_EtecoonEscape_0                                        ;B3E570;
    dw $0003                                                             ;B3E572;
    dw Spritemaps_EtecoonEscape_1                                        ;B3E574;
    dw $0003                                                             ;B3E576;
    dw Spritemaps_EtecoonEscape_2                                        ;B3E578;
    dw $0003                                                             ;B3E57A;
    dw Spritemaps_EtecoonEscape_1                                        ;B3E57C;
    dw Instruction_Common_GotoY                                          ;B3E57E;
    dw InstList_EtecoonEscape_RunningLeft_HighTide                       ;B3E580;

InstList_EtecoonEscape_RunningRight_LowTide_0:
    dw Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE          ;B3E582;
    dw InstList_EtecoonEscape_RunningRight_HighTide                      ;B3E584;

InstList_EtecoonEscape_RunningRight_LowTide_1:
    dw $0006                                                             ;B3E586;
    dw Spritemaps_EtecoonEscape_3                                        ;B3E588;
    dw $0006                                                             ;B3E58A;
    dw Spritemaps_EtecoonEscape_4                                        ;B3E58C;
    dw $0006                                                             ;B3E58E;
    dw Spritemaps_EtecoonEscape_5                                        ;B3E590;
    dw $0006                                                             ;B3E592;
    dw Spritemaps_EtecoonEscape_4                                        ;B3E594;
    dw Instruction_Common_GotoY                                          ;B3E596;
    dw InstList_EtecoonEscape_RunningRight_LowTide_1                     ;B3E598;

InstList_EtecoonEscape_RunningRight_HighTide:
    dw $0003                                                             ;B3E59A;
    dw Spritemaps_EtecoonEscape_3                                        ;B3E59C;
    dw $0003                                                             ;B3E59E;
    dw Spritemaps_EtecoonEscape_4                                        ;B3E5A0;
    dw $0003                                                             ;B3E5A2;
    dw Spritemaps_EtecoonEscape_5                                        ;B3E5A4;
    dw $0003                                                             ;B3E5A6;
    dw Spritemaps_EtecoonEscape_4                                        ;B3E5A8;
    dw Instruction_Common_GotoY                                          ;B3E5AA;
    dw InstList_EtecoonEscape_RunningRight_HighTide                      ;B3E5AC;

InstList_EtecoonEscape_RunningForEscape_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;B3E5AE;
    dw Function_EtecoonEscape_RunningForEscape                           ;B3E5B0;

InstList_EtecoonEscape_RunningForEscape_1:
    dw $0003                                                             ;B3E5B2;
    dw Spritemaps_EtecoonEscape_3                                        ;B3E5B4;
    dw $0003                                                             ;B3E5B6;
    dw Spritemaps_EtecoonEscape_4                                        ;B3E5B8;
    dw $0003                                                             ;B3E5BA;
    dw Spritemaps_EtecoonEscape_5                                        ;B3E5BC;
    dw $0003                                                             ;B3E5BE;
    dw Spritemaps_EtecoonEscape_4                                        ;B3E5C0;
    dw Instruction_Common_GotoY                                          ;B3E5C2;
    dw InstList_EtecoonEscape_RunningForEscape_1                         ;B3E5C4;

InstList_EtecoonEscape_Stationary:
    dw $0040                                                             ;B3E5C6;
    dw Spritemaps_EtecoonEscape_E                                        ;B3E5C8;
    dw $0008                                                             ;B3E5CA;
    dw Spritemaps_EtecoonEscape_F                                        ;B3E5CC;
    dw $0040                                                             ;B3E5CE;
    dw Spritemaps_EtecoonEscape_11                                       ;B3E5D0;
    dw $0008                                                             ;B3E5D2;
    dw Spritemaps_EtecoonEscape_10                                       ;B3E5D4;
    dw Instruction_Common_GotoY                                          ;B3E5D6;
    dw InstList_EtecoonEscape_Stationary                                 ;B3E5D8;

InstList_EtecoonEscape_ExpressGratitudeThenEscape_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS                              ;B3E5DA;
    dw Instruction_Common_TimerInY                                       ;B3E5DC;
    dw $0008                                                             ;B3E5DE;

InstList_EtecoonEscape_ExpressGratitudeThenEscape_1:
    dw $0008                                                             ;B3E5E0;
    dw Spritemaps_EtecoonEscape_0                                        ;B3E5E2;
    dw Instruction_EtecoonEscape_XPositionPlusY                          ;B3E5E4;
    dw $FFFD,$0008                                                       ;B3E5E6;
    dw Spritemaps_EtecoonEscape_1                                        ;B3E5EA;
    dw Instruction_EtecoonEscape_XPositionPlusY                          ;B3E5EC;
    dw $FFFD,$0008                                                       ;B3E5EE;
    dw Spritemaps_EtecoonEscape_2                                        ;B3E5F2;
    dw Instruction_EtecoonEscape_XPositionPlusY                          ;B3E5F4;
    dw $FFFD,$0008                                                       ;B3E5F6;
    dw Spritemaps_EtecoonEscape_1                                        ;B3E5FA;
    dw Instruction_EtecoonEscape_XPositionPlusY                          ;B3E5FC;
    dw $FFFD                                                             ;B3E5FE;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B3E600;
    dw InstList_EtecoonEscape_ExpressGratitudeThenEscape_1               ;B3E602;
    dw $0040                                                             ;B3E604;
    dw Spritemaps_EtecoonEscape_E                                        ;B3E606;
    dw $0008                                                             ;B3E608;
    dw Spritemaps_EtecoonEscape_F                                        ;B3E60A;
    dw Instruction_Common_GotoY                                          ;B3E60C;
    dw InstList_EtecoonEscape_RunningForEscape_0                         ;B3E60E;

Instruction_EtecoonEscape_XPositionPlusY:
    LDA.W EnemyData.xPosition,X                                          ;B3E610;
    CLC                                                                  ;B3E613;
    ADC.W $0000,Y                                                        ;B3E614;
    STA.W EnemyData.xPosition,X                                          ;B3E617;
    INY                                                                  ;B3E61A;
    INY                                                                  ;B3E61B;
    RTL                                                                  ;B3E61C;


UNUSED_InstList_EtecoonEscape_B3E61D:
    dw $0001                                                             ;B3E61D;
    dw Spritemaps_EtecoonEscape_6                                        ;B3E61F;
    dw Instruction_Common_Sleep                                          ;B3E621;

UNUSED_InstList_EtecoonEscape_B3E623:
    dw $000C                                                             ;B3E623;
    dw Spritemaps_EtecoonEscape_7                                        ;B3E625;
    dw $000C                                                             ;B3E627;
    dw Spritemaps_EtecoonEscape_8                                        ;B3E629;
    dw $0006                                                             ;B3E62B;
    dw Spritemaps_EtecoonEscape_9                                        ;B3E62D;
    dw $000C                                                             ;B3E62F;
    dw Spritemaps_EtecoonEscape_8                                        ;B3E631;
    dw $000C                                                             ;B3E633;
    dw Spritemaps_EtecoonEscape_7                                        ;B3E635;
    dw Instruction_Common_Sleep                                          ;B3E637;

UNUSED_InstList_EtecoonEscape_B3E639:
    dw $0001                                                             ;B3E639;
    dw Spritemaps_EtecoonEscape_A                                        ;B3E63B;
    dw Instruction_Common_Sleep                                          ;B3E63D;

UNUSED_InstList_EtecoonEscape_B3E63F:
    dw $000C                                                             ;B3E63F;
    dw Spritemaps_EtecoonEscape_B                                        ;B3E641;
    dw $000C                                                             ;B3E643;
    dw Spritemaps_EtecoonEscape_C                                        ;B3E645;
    dw $0006                                                             ;B3E647;
    dw Spritemaps_EtecoonEscape_D                                        ;B3E649;
    dw $000C                                                             ;B3E64B;
    dw Spritemaps_EtecoonEscape_C                                        ;B3E64D;
    dw $000C                                                             ;B3E64F;
    dw Spritemaps_EtecoonEscape_B                                        ;B3E651;
    dw Instruction_Common_Sleep                                          ;B3E653;

MainAI_EtecoonEscape:
    LDX.W $0E54                                                          ;B3E655;
    JSR.W ($0FB2,X)                                                      ;B3E658;
    RTL                                                                  ;B3E65B;


Function_EtecoonEscape_RunningForEscape:
    LDA.W EnemyData.xSubPosition,X                                       ;B3E65C;
    CLC                                                                  ;B3E65F;
    ADC.W #$8000                                                         ;B3E660;
    STA.W EnemyData.xSubPosition,X                                       ;B3E663;
    LDA.W EnemyData.xPosition,X                                          ;B3E666;
    ADC.W #$0003                                                         ;B3E669;
    STA.W EnemyData.xPosition,X                                          ;B3E66C;
    RTS                                                                  ;B3E66F;


Function_EtecoonEscape_StationaryWaitingToExpressGratitude:
    LDA.W #$000F                                                         ;B3E670;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;B3E673;
    BCC .return                                                          ;B3E677;
    LDA.W #InstList_EtecoonEscape_ExpressGratitudeThenEscape_0           ;B3E679;
    STA.W EnemyData.pInstList,X                                          ;B3E67C;

.return:
    RTS                                                                  ;B3E67F;


Function_EtecoonEscape_RunningAroundAimlessly:
    STZ.B $12                                                            ;B3E680;
    STZ.B $14                                                            ;B3E682;
    LDA.W EnemyData.work0,X                                              ;B3E684;
    BPL +                                                                ;B3E687;
    DEC.B $14                                                            ;B3E689;

  + STA.B $13                                                            ;B3E68B;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;B3E68D;
    BCC .noCollision                                                     ;B3E691;
    LDA.W #$0001                                                         ;B3E693;
    STA.W EnemyData.instTimer,X                                          ;B3E696;
    LDA.W EnemyData.work0,X                                              ;B3E699;
    EOR.W #$FFFF                                                         ;B3E69C;
    INC A                                                                ;B3E69F;
    STA.W EnemyData.work0,X                                              ;B3E6A0;
    BPL .greaterThan0                                                    ;B3E6A3;
    LDA.W #InstList_EtecoonEscape_RunningLeft_LowTide_0                  ;B3E6A5;
    BRA +                                                                ;B3E6A8;


.greaterThan0:
    LDA.W #InstList_EtecoonEscape_RunningRight_LowTide_0                 ;B3E6AA;

  + STA.W EnemyData.pInstList,X                                          ;B3E6AD;
    LDA.W #$000F                                                         ;B3E6B0;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;B3E6B3;
    BCC .noCollision                                                     ;B3E6B7;
    LDA.W #InstList_EtecoonEscape_RunningForEscape_0                     ;B3E6B9;
    STA.W EnemyData.pInstList,X                                          ;B3E6BC;

.noCollision:
    STZ.B $12                                                            ;B3E6BF;
    LDA.W #$0001                                                         ;B3E6C1;
    STA.B $14                                                            ;B3E6C4;
    JSL.L MoveEnemyDownBy_14_12                                          ;B3E6C6;
    RTS                                                                  ;B3E6CA;


InitAI_EtecoonEscape:
    LDX.W $0E54                                                          ;B3E6CB;
    LDA.W #$000F                                                         ;B3E6CE;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;B3E6D1;
    BCC .notEscaped                                                      ;B3E6D5;
    LDA.W EnemyData.properties,X                                         ;B3E6D7;
    ORA.W #$0200                                                         ;B3E6DA;
    STA.W EnemyData.properties,X                                         ;B3E6DD;
    RTL                                                                  ;B3E6E0;


.notEscaped:
    LDA.W EnemyData.properties,X                                         ;B3E6E1;
    ORA.W #$A400                                                         ;B3E6E4;
    STA.W EnemyData.properties,X                                         ;B3E6E7;
    LDA.W #$0001                                                         ;B3E6EA;
    STA.W EnemyData.instTimer,X                                          ;B3E6ED;
    STZ.W EnemyData.loopCounter,X                                        ;B3E6F0;
    STZ.W EnemyData.palette,X                                            ;B3E6F3;
    LDY.W EnemyData.initParam0,X                                         ;B3E6F6;
    LDA.W .XPosition,Y                                                   ;B3E6F9;
    STA.W EnemyData.xPosition,X                                          ;B3E6FC;
    LDA.W .YPosition,Y                                                   ;B3E6FF;
    STA.W EnemyData.yPosition,X                                          ;B3E702;
    LDA.W .functionPointer,Y                                             ;B3E705;
    STA.W EnemyData.work5,X                                              ;B3E708;
    LDA.W .instListPointer,Y                                             ;B3E70B;
    STA.W EnemyData.pInstList,X                                          ;B3E70E;
    LDA.W .XVelocity,Y                                                   ;B3E711;
    STA.W EnemyData.work0,X                                              ;B3E714;
    RTL                                                                  ;B3E717;


.XPosition:
    dw $0080,$00A0,$00E8                                                 ;B3E718;

.YPosition:
    dw $00C8,$00C8,$00C8                                                 ;B3E71E;

.functionPointer:
    dw Function_EtecoonEscape_RunningAroundAimlessly                     ;B3E724;
    dw Function_EtecoonEscape_RunningAroundAimlessly                     ;B3E726;
    dw Function_EtecoonEscape_StationaryWaitingToExpressGratitude        ;B3E728;

.instListPointer:
    dw InstList_EtecoonEscape_RunningLeft_LowTide_0                      ;B3E72A;
    dw InstList_EtecoonEscape_RunningRight_LowTide_0                     ;B3E72C;
    dw InstList_EtecoonEscape_Stationary                                 ;B3E72E;

.XVelocity:
    dw $FE00,$0280,$0000                                                 ;B3E730;

Spritemaps_EtecoonEscape_0:
    dw $0003,$01F2                                                       ;B3E736;
    db $FF                                                               ;B3E73A;
    dw $3329,$C3F5                                                       ;B3E73B;
    db $EF                                                               ;B3E73F;
    dw $3300,$C3FA                                                       ;B3E740;
    db $F7                                                               ;B3E744;
    dw $3302                                                             ;B3E745;

Spritemaps_EtecoonEscape_1:
    dw $0002,$C3F5                                                       ;B3E747;
    db $F0                                                               ;B3E74B;
    dw $3300,$C3FA                                                       ;B3E74C;
    db $F8                                                               ;B3E750;
    dw $3304                                                             ;B3E751;

Spritemaps_EtecoonEscape_2:
    dw $0002,$C3F5                                                       ;B3E753;
    db $F1                                                               ;B3E757;
    dw $3300,$C3FA                                                       ;B3E758;
    db $F9                                                               ;B3E75C;
    dw $3306                                                             ;B3E75D;

Spritemaps_EtecoonEscape_3:
    dw $0003,$0006                                                       ;B3E75F;
    db $FF                                                               ;B3E763;
    dw $7329,$C3FB                                                       ;B3E764;
    db $EF                                                               ;B3E768;
    dw $7300,$C3F6                                                       ;B3E769;
    db $F7                                                               ;B3E76D;
    dw $7302                                                             ;B3E76E;

Spritemaps_EtecoonEscape_4:
    dw $0002,$C3FB                                                       ;B3E770;
    db $F0                                                               ;B3E774;
    dw $7300,$C3F6                                                       ;B3E775;
    db $F8                                                               ;B3E779;
    dw $7304                                                             ;B3E77A;

Spritemaps_EtecoonEscape_5:
    dw $0002,$C3FB                                                       ;B3E77C;
    db $F1                                                               ;B3E780;
    dw $7300,$C3F6                                                       ;B3E781;
    db $F9                                                               ;B3E785;
    dw $7306                                                             ;B3E786;

Spritemaps_EtecoonEscape_6:
    dw $0007,$0001                                                       ;B3E788;
    db $FE                                                               ;B3E78C;
    dw $7322,$01F8                                                       ;B3E78D;
    db $FE                                                               ;B3E791;
    dw $3322,$C3F8                                                       ;B3E792;
    db $F2                                                               ;B3E796;
    dw $730C,$01F9                                                       ;B3E797;
    db $01                                                               ;B3E79B;
    dw $3324,$0000                                                       ;B3E79C;
    db $01                                                               ;B3E7A0;
    dw $7324,$01F9                                                       ;B3E7A1;
    db $FA                                                               ;B3E7A5;
    dw $3320,$0000                                                       ;B3E7A6;
    db $FA                                                               ;B3E7AA;
    dw $7320                                                             ;B3E7AB;

Spritemaps_EtecoonEscape_7:
    dw $0007,$01F7                                                       ;B3E7AD;
    db $FC                                                               ;B3E7B1;
    dw $3322,$0002                                                       ;B3E7B2;
    db $FC                                                               ;B3E7B6;
    dw $7322,$C3F8                                                       ;B3E7B7;
    db $F1                                                               ;B3E7BB;
    dw $730C,$01F9                                                       ;B3E7BC;
    db $01                                                               ;B3E7C0;
    dw $3323,$0000                                                       ;B3E7C1;
    db $01                                                               ;B3E7C5;
    dw $7323,$01F9                                                       ;B3E7C6;
    db $FA                                                               ;B3E7CA;
    dw $3320,$0000                                                       ;B3E7CB;
    db $FA                                                               ;B3E7CF;
    dw $7320                                                             ;B3E7D0;

Spritemaps_EtecoonEscape_8:
    dw $0007,$01F9                                                       ;B3E7D2;
    db $01                                                               ;B3E7D6;
    dw $3323,$0000                                                       ;B3E7D7;
    db $01                                                               ;B3E7DB;
    dw $7323,$C3F8                                                       ;B3E7DC;
    db $EF                                                               ;B3E7E0;
    dw $730C,$01F9                                                       ;B3E7E1;
    db $F9                                                               ;B3E7E5;
    dw $3320,$0000                                                       ;B3E7E6;
    db $F9                                                               ;B3E7EA;
    dw $7320,$01F5                                                       ;B3E7EB;
    db $F9                                                               ;B3E7EF;
    dw $3321,$0004                                                       ;B3E7F0;
    db $F9                                                               ;B3E7F4;
    dw $7321                                                             ;B3E7F5;

Spritemaps_EtecoonEscape_9:
    dw $0007,$01F9                                                       ;B3E7F7;
    db $01                                                               ;B3E7FB;
    dw $3323,$0000                                                       ;B3E7FC;
    db $01                                                               ;B3E800;
    dw $7323,$C3F8                                                       ;B3E801;
    db $EF                                                               ;B3E805;
    dw $730C,$01F9                                                       ;B3E806;
    db $F9                                                               ;B3E80A;
    dw $3320,$0000                                                       ;B3E80B;
    db $F9                                                               ;B3E80F;
    dw $7320,$01F5                                                       ;B3E810;
    db $F7                                                               ;B3E814;
    dw $3321,$0004                                                       ;B3E815;
    db $F7                                                               ;B3E819;
    dw $7321                                                             ;B3E81A;

Spritemaps_EtecoonEscape_A:
    dw $0007,$01F7                                                       ;B3E81C;
    db $FE                                                               ;B3E820;
    dw $3322,$0000                                                       ;B3E821;
    db $FE                                                               ;B3E825;
    dw $7322,$C3F8                                                       ;B3E826;
    db $F2                                                               ;B3E82A;
    dw $330C,$01FF                                                       ;B3E82B;
    db $01                                                               ;B3E82F;
    dw $7324,$01F8                                                       ;B3E830;
    db $01                                                               ;B3E834;
    dw $3324,$01FF                                                       ;B3E835;
    db $FA                                                               ;B3E839;
    dw $7320,$01F8                                                       ;B3E83A;
    db $FA                                                               ;B3E83E;
    dw $3320                                                             ;B3E83F;

Spritemaps_EtecoonEscape_B:
    dw $0007,$0001                                                       ;B3E841;
    db $FC                                                               ;B3E845;
    dw $7322,$01F6                                                       ;B3E846;
    db $FC                                                               ;B3E84A;
    dw $3322,$C3F8                                                       ;B3E84B;
    db $F1                                                               ;B3E84F;
    dw $330C,$01FF                                                       ;B3E850;
    db $01                                                               ;B3E854;
    dw $7323,$01F8                                                       ;B3E855;
    db $01                                                               ;B3E859;
    dw $3323,$01FF                                                       ;B3E85A;
    db $FA                                                               ;B3E85E;
    dw $7320,$01F8                                                       ;B3E85F;
    db $FA                                                               ;B3E863;
    dw $3320                                                             ;B3E864;

Spritemaps_EtecoonEscape_C:
    dw $0007,$01FF                                                       ;B3E866;
    db $01                                                               ;B3E86A;
    dw $7323,$01F8                                                       ;B3E86B;
    db $01                                                               ;B3E86F;
    dw $3323,$C3F8                                                       ;B3E870;
    db $EF                                                               ;B3E874;
    dw $330C,$01FF                                                       ;B3E875;
    db $F9                                                               ;B3E879;
    dw $7320,$01F8                                                       ;B3E87A;
    db $F9                                                               ;B3E87E;
    dw $3320,$0003                                                       ;B3E87F;
    db $F9                                                               ;B3E883;
    dw $7321,$01F4                                                       ;B3E884;
    db $F9                                                               ;B3E888;
    dw $3321                                                             ;B3E889;

Spritemaps_EtecoonEscape_D:
    dw $0007,$01FF                                                       ;B3E88B;
    db $01                                                               ;B3E88F;
    dw $7323,$01F8                                                       ;B3E890;
    db $01                                                               ;B3E894;
    dw $3323,$C3F8                                                       ;B3E895;
    db $EF                                                               ;B3E899;
    dw $330C,$01FF                                                       ;B3E89A;
    db $F9                                                               ;B3E89E;
    dw $7320,$01F8                                                       ;B3E89F;
    db $F9                                                               ;B3E8A3;
    dw $3320,$0003                                                       ;B3E8A4;
    db $F7                                                               ;B3E8A8;
    dw $7321,$01F4                                                       ;B3E8A9;
    db $F7                                                               ;B3E8AD;
    dw $3321                                                             ;B3E8AE;

Spritemaps_EtecoonEscape_E:
    dw $0007,$C3F8                                                       ;B3E8B0;
    db $ED                                                               ;B3E8B4;
    dw $3300,$0002                                                       ;B3E8B5;
    db $F9                                                               ;B3E8B9;
    dw $7322,$01F7                                                       ;B3E8BA;
    db $F9                                                               ;B3E8BE;
    dw $3322,$01F9                                                       ;B3E8BF;
    db $FF                                                               ;B3E8C3;
    dw $3324,$0000                                                       ;B3E8C4;
    db $FF                                                               ;B3E8C8;
    dw $7324,$01F9                                                       ;B3E8C9;
    db $F7                                                               ;B3E8CD;
    dw $3320,$0000                                                       ;B3E8CE;
    db $F7                                                               ;B3E8D2;
    dw $7320                                                             ;B3E8D3;

Spritemaps_EtecoonEscape_F:
    dw $0007,$0002                                                       ;B3E8D5;
    db $F9                                                               ;B3E8D9;
    dw $7322,$01F7                                                       ;B3E8DA;
    db $F9                                                               ;B3E8DE;
    dw $3322,$C3F8                                                       ;B3E8DF;
    db $ED                                                               ;B3E8E3;
    dw $730C,$01F9                                                       ;B3E8E4;
    db $FF                                                               ;B3E8E8;
    dw $3324,$0000                                                       ;B3E8E9;
    db $FF                                                               ;B3E8ED;
    dw $7324,$01F9                                                       ;B3E8EE;
    db $F7                                                               ;B3E8F2;
    dw $3320,$0000                                                       ;B3E8F3;
    db $F7                                                               ;B3E8F7;
    dw $7320                                                             ;B3E8F8;

Spritemaps_EtecoonEscape_10:
    dw $0007,$01F6                                                       ;B3E8FA;
    db $F9                                                               ;B3E8FE;
    dw $3322,$0001                                                       ;B3E8FF;
    db $F9                                                               ;B3E903;
    dw $7322,$C3F8                                                       ;B3E904;
    db $ED                                                               ;B3E908;
    dw $330C,$01FF                                                       ;B3E909;
    db $FF                                                               ;B3E90D;
    dw $7324,$01F8                                                       ;B3E90E;
    db $FF                                                               ;B3E912;
    dw $3324,$01FF                                                       ;B3E913;
    db $F7                                                               ;B3E917;
    dw $7320,$01F8                                                       ;B3E918;
    db $F7                                                               ;B3E91C;
    dw $3320                                                             ;B3E91D;

Spritemaps_EtecoonEscape_11:
    dw $0007,$C3F8                                                       ;B3E91F;
    db $ED                                                               ;B3E923;
    dw $3300,$01F6                                                       ;B3E924;
    db $F9                                                               ;B3E928;
    dw $3322,$0001                                                       ;B3E929;
    db $F9                                                               ;B3E92D;
    dw $7322,$01FF                                                       ;B3E92E;
    db $FF                                                               ;B3E932;
    dw $7324,$01F8                                                       ;B3E933;
    db $FF                                                               ;B3E937;
    dw $3324,$01FF                                                       ;B3E938;
    db $F7                                                               ;B3E93C;
    dw $7320,$01F8                                                       ;B3E93D;
    db $F7                                                               ;B3E941;
    dw $3320                                                             ;B3E942;

Palette_DachoraEscape:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;B3E944;
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A                   ;B3E954;

InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0:
    dw Instruction_Common_TimerInY                                       ;B3E964;
    dw $0005                                                             ;B3E966;

InstList_DachoraEscape_RunningAroundAimlessly_LowTide_1:
    dw $0003                                                             ;B3E968;
    dw Spritemaps_DachoraEscape_0                                        ;B3E96A;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E96C;
    dw $0003                                                             ;B3E96E;
    dw Spritemaps_DachoraEscape_1                                        ;B3E970;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E972;
    dw $0003                                                             ;B3E974;
    dw Spritemaps_DachoraEscape_2                                        ;B3E976;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E978;
    dw $0003                                                             ;B3E97A;
    dw Spritemaps_DachoraEscape_3                                        ;B3E97C;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E97E;
    dw $0003                                                             ;B3E980;
    dw Spritemaps_DachoraEscape_4                                        ;B3E982;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E984;
    dw $0003                                                             ;B3E986;
    dw Spritemaps_DachoraEscape_5                                        ;B3E988;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E98A;
    dw InstList_DachoraEscape_GotoY_IfAcidLessThanCE                     ;B3E98C;
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_2          ;B3E98E;
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped                    ;B3E990;
    dw InstList_DachoraEscape_RunningForEscape_0                         ;B3E992;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B3E994;
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_1           ;B3E996;
    dw Instruction_Common_TimerInY                                       ;B3E998;
    dw $0005                                                             ;B3E99A;

InstList_DachoraEscape_RunningAroundAimlessly_LowTide_2:
    dw $0003                                                             ;B3E99C;
    dw Spritemaps_DachoraEscape_6                                        ;B3E99E;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3E9A0;
    dw $0003                                                             ;B3E9A2;
    dw Spritemaps_DachoraEscape_7                                        ;B3E9A4;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3E9A6;
    dw $0003                                                             ;B3E9A8;
    dw Spritemaps_DachoraEscape_8                                        ;B3E9AA;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3E9AC;
    dw $0003                                                             ;B3E9AE;
    dw Spritemaps_DachoraEscape_9                                        ;B3E9B0;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3E9B2;
    dw $0003                                                             ;B3E9B4;
    dw Spritemaps_DachoraEscape_A                                        ;B3E9B6;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3E9B8;
    dw $0003                                                             ;B3E9BA;
    dw Spritemaps_DachoraEscape_B                                        ;B3E9BC;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3E9BE;
    dw InstList_DachoraEscape_GotoY_IfAcidLessThanCE                     ;B3E9C0;
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_4          ;B3E9C2;
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped                    ;B3E9C4;
    dw InstList_DachoraEscape_RunningForEscape_1                         ;B3E9C6;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B3E9C8;
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_2           ;B3E9CA;
    dw Instruction_Common_GotoY                                          ;B3E9CC;
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0           ;B3E9CE;

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_0:
    dw Instruction_Common_TimerInY                                       ;B3E9D0;
    dw $0005                                                             ;B3E9D2;

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_1:
    dw $0002                                                             ;B3E9D4;
    dw Spritemaps_DachoraEscape_0                                        ;B3E9D6;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E9D8;
    dw $0002                                                             ;B3E9DA;
    dw Spritemaps_DachoraEscape_1                                        ;B3E9DC;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E9DE;
    dw $0002                                                             ;B3E9E0;
    dw Spritemaps_DachoraEscape_2                                        ;B3E9E2;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E9E4;
    dw $0002                                                             ;B3E9E6;
    dw Spritemaps_DachoraEscape_3                                        ;B3E9E8;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E9EA;
    dw $0002                                                             ;B3E9EC;
    dw Spritemaps_DachoraEscape_4                                        ;B3E9EE;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E9F0;
    dw $0002                                                             ;B3E9F2;
    dw Spritemaps_DachoraEscape_5                                        ;B3E9F4;
    dw InstList_DachoraEscape_XPositionMinus6                            ;B3E9F6;
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped                    ;B3E9F8;
    dw InstList_DachoraEscape_RunningForEscape_0                         ;B3E9FA;

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_2:
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B3E9FC;
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_1          ;B3E9FE;
    dw Instruction_Common_TimerInY                                       ;B3EA00;
    dw $0005                                                             ;B3EA02;

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_3:
    dw $0002                                                             ;B3EA04;
    dw Spritemaps_DachoraEscape_6                                        ;B3EA06;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA08;
    dw $0002                                                             ;B3EA0A;
    dw Spritemaps_DachoraEscape_7                                        ;B3EA0C;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA0E;
    dw $0002                                                             ;B3EA10;
    dw Spritemaps_DachoraEscape_8                                        ;B3EA12;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA14;
    dw $0002                                                             ;B3EA16;
    dw Spritemaps_DachoraEscape_9                                        ;B3EA18;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA1A;
    dw $0002                                                             ;B3EA1C;
    dw Spritemaps_DachoraEscape_A                                        ;B3EA1E;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA20;
    dw $0002                                                             ;B3EA22;
    dw Spritemaps_DachoraEscape_B                                        ;B3EA24;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA26;
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped                    ;B3EA28;
    dw InstList_DachoraEscape_RunningForEscape_1                         ;B3EA2A;

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_4:
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;B3EA2C;
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_3          ;B3EA2E;
    dw Instruction_Common_GotoY                                          ;B3EA30;
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_0          ;B3EA32;

InstList_DachoraEscape_RunningForEscape_0:
    dw $001E                                                             ;B3EA34;
    dw Spritemaps_DachoraEscape_0                                        ;B3EA36;

InstList_DachoraEscape_RunningForEscape_1:
    dw $005A                                                             ;B3EA38;
    dw Spritemaps_DachoraEscape_6                                        ;B3EA3A;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA3C;
    dw $0005                                                             ;B3EA3E;
    dw Spritemaps_DachoraEscape_7                                        ;B3EA40;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA42;
    dw $0005                                                             ;B3EA44;
    dw Spritemaps_DachoraEscape_8                                        ;B3EA46;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA48;
    dw $0004                                                             ;B3EA4A;
    dw Spritemaps_DachoraEscape_9                                        ;B3EA4C;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA4E;
    dw $0004                                                             ;B3EA50;
    dw Spritemaps_DachoraEscape_A                                        ;B3EA52;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA54;
    dw $0004                                                             ;B3EA56;
    dw Spritemaps_DachoraEscape_B                                        ;B3EA58;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA5A;
    dw $0003                                                             ;B3EA5C;
    dw Spritemaps_DachoraEscape_6                                        ;B3EA5E;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA60;
    dw $0003                                                             ;B3EA62;
    dw Spritemaps_DachoraEscape_7                                        ;B3EA64;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA66;
    dw $0003                                                             ;B3EA68;
    dw Spritemaps_DachoraEscape_8                                        ;B3EA6A;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA6C;
    dw $0002                                                             ;B3EA6E;
    dw Spritemaps_DachoraEscape_9                                        ;B3EA70;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA72;
    dw $0002                                                             ;B3EA74;
    dw Spritemaps_DachoraEscape_A                                        ;B3EA76;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA78;
    dw $0002                                                             ;B3EA7A;
    dw Spritemaps_DachoraEscape_B                                        ;B3EA7C;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA7E;

InstList_DachoraEscape_RunningForEscape_2:
    dw $0001                                                             ;B3EA80;
    dw Spritemaps_DachoraEscape_6                                        ;B3EA82;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA84;
    dw $0001                                                             ;B3EA86;
    dw Spritemaps_DachoraEscape_7                                        ;B3EA88;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA8A;
    dw $0001                                                             ;B3EA8C;
    dw Spritemaps_DachoraEscape_8                                        ;B3EA8E;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA90;
    dw $0001                                                             ;B3EA92;
    dw Spritemaps_DachoraEscape_9                                        ;B3EA94;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA96;
    dw $0001                                                             ;B3EA98;
    dw Spritemaps_DachoraEscape_A                                        ;B3EA9A;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EA9C;
    dw $0001                                                             ;B3EA9E;
    dw Spritemaps_DachoraEscape_B                                        ;B3EAA0;
    dw InstList_DachoraEscape_XPositionPlus6                             ;B3EAA2;
    dw Instruction_Common_GotoY                                          ;B3EAA4;
    dw InstList_DachoraEscape_RunningForEscape_2                         ;B3EAA6;

InstList_DachoraEscape_GotoY_IfAcidLessThanCE:
    LDA.W $1962                                                          ;B3EAA8;
    CMP.W #$00CE                                                         ;B3EAAB;
    BCS .greaterThanCE                                                   ;B3EAAE;
    LDA.W $0000,Y                                                        ;B3EAB0;
    TAY                                                                  ;B3EAB3;
    RTL                                                                  ;B3EAB4;


.greaterThanCE:
    INY                                                                  ;B3EAB5;
    INY                                                                  ;B3EAB6;
    RTL                                                                  ;B3EAB7;


InstList_DachoraEscape_GotoY_IfCrittersEscaped:
    LDA.W #$000F                                                         ;B3EAB8;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;B3EABB;
    BCC .notEscaped                                                      ;B3EABF;
    LDA.W $0000,Y                                                        ;B3EAC1;
    TAY                                                                  ;B3EAC4;
    RTL                                                                  ;B3EAC5;


.notEscaped:
    INY                                                                  ;B3EAC6;
    INY                                                                  ;B3EAC7;
    RTL                                                                  ;B3EAC8;


InstList_DachoraEscape_XPositionMinus6:
    LDX.W $0E54                                                          ;B3EAC9;
    LDA.W EnemyData.xPosition,X                                          ;B3EACC;
    SEC                                                                  ;B3EACF;
    SBC.W #$0006                                                         ;B3EAD0;
    STA.W EnemyData.xPosition,X                                          ;B3EAD3;
    RTL                                                                  ;B3EAD6;


InstList_DachoraEscape_XPositionPlus6:
    LDX.W $0E54                                                          ;B3EAD7;
    LDA.W EnemyData.xPosition,X                                          ;B3EADA;
    CLC                                                                  ;B3EADD;
    ADC.W #$0006                                                         ;B3EADE;
    STA.W EnemyData.xPosition,X                                          ;B3EAE1;
    RTL                                                                  ;B3EAE4;


InitAI_DachoraEscape:
    LDX.W $0E54                                                          ;B3EAE5;
    LDA.W #$000F                                                         ;B3EAE8;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;B3EAEB;
    BCC .notEscaped                                                      ;B3EAEF;
    LDA.W EnemyData.properties,X                                         ;B3EAF1;
    ORA.W #$0200                                                         ;B3EAF4;
    STA.W EnemyData.properties,X                                         ;B3EAF7;
    RTL                                                                  ;B3EAFA;


.notEscaped:
    LDA.W EnemyData.properties,X                                         ;B3EAFB;
    ORA.W #$2000                                                         ;B3EAFE;
    STA.W EnemyData.properties,X                                         ;B3EB01;
    LDA.W #Spritemap_CommonB3_Nothing                                    ;B3EB04;
    STA.W EnemyData.pSpritemap,X                                         ;B3EB07;
    LDA.W #$0001                                                         ;B3EB0A;
    STA.W EnemyData.instTimer,X                                          ;B3EB0D;
    STZ.W EnemyData.loopCounter,X                                        ;B3EB10;
    LDA.W #InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0       ;B3EB13;
    STA.W EnemyData.pInstList,X                                          ;B3EB16;
    RTL                                                                  ;B3EB19;


RTL_B3EB1A:
    RTL                                                                  ;B3EB1A;


Spritemaps_DachoraEscape_0:
    dw $0009,$01F0                                                       ;B3EB1B;
    db $F2                                                               ;B3EB1F;
    dw $3310,$C3F8                                                       ;B3EB20;
    db $EA                                                               ;B3EB24;
    dw $3301,$0002                                                       ;B3EB25;
    db $F7                                                               ;B3EB29;
    dw $331E,$01FA                                                       ;B3EB2A;
    db $F7                                                               ;B3EB2E;
    dw $330E,$01F2                                                       ;B3EB2F;
    db $03                                                               ;B3EB33;
    dw $331F,$01F2                                                       ;B3EB34;
    db $FB                                                               ;B3EB38;
    dw $330F,$01F2                                                       ;B3EB39;
    db $0F                                                               ;B3EB3D;
    dw $3322,$C3FA                                                       ;B3EB3E;
    db $07                                                               ;B3EB42;
    dw $3313,$C3FA                                                       ;B3EB43;
    db $FF                                                               ;B3EB47;
    dw $3303                                                             ;B3EB48;

Spritemaps_DachoraEscape_1:
    dw $0009,$01EF                                                       ;B3EB4A;
    db $F3                                                               ;B3EB4E;
    dw $3310,$C3F7                                                       ;B3EB4F;
    db $EB                                                               ;B3EB53;
    dw $3301,$0002                                                       ;B3EB54;
    db $F8                                                               ;B3EB58;
    dw $335F,$01FA                                                       ;B3EB59;
    db $F8                                                               ;B3EB5D;
    dw $335E,$01F2                                                       ;B3EB5E;
    db $04                                                               ;B3EB62;
    dw $331F,$01F2                                                       ;B3EB63;
    db $FC                                                               ;B3EB67;
    dw $330F,$C3FA                                                       ;B3EB68;
    db $08                                                               ;B3EB6C;
    dw $3316,$01F2                                                       ;B3EB6D;
    db $08                                                               ;B3EB71;
    dw $3315,$C3FA                                                       ;B3EB72;
    db $00                                                               ;B3EB76;
    dw $3306                                                             ;B3EB77;

Spritemaps_DachoraEscape_2:
    dw $000B,$01EE                                                       ;B3EB79;
    db $F1                                                               ;B3EB7D;
    dw $3310,$C3F6                                                       ;B3EB7E;
    db $E9                                                               ;B3EB82;
    dw $3301,$01EA                                                       ;B3EB83;
    db $0E                                                               ;B3EB87;
    dw $332D,$0002                                                       ;B3EB88;
    db $F6                                                               ;B3EB8C;
    dw $331E,$01FA                                                       ;B3EB8D;
    db $F6                                                               ;B3EB91;
    dw $330E,$01F2                                                       ;B3EB92;
    db $FA                                                               ;B3EB96;
    dw $330F,$C3FA                                                       ;B3EB97;
    db $FE                                                               ;B3EB9B;
    dw $3309,$C3F2                                                       ;B3EB9C;
    db $FE                                                               ;B3EBA0;
    dw $3308,$000A                                                       ;B3EBA1;
    db $0E                                                               ;B3EBA5;
    dw $332B,$000A                                                       ;B3EBA6;
    db $06                                                               ;B3EBAA;
    dw $331B,$C3F2                                                       ;B3EBAB;
    db $06                                                               ;B3EBAF;
    dw $3318                                                             ;B3EBB0;

Spritemaps_DachoraEscape_3:
    dw $0009,$01F0                                                       ;B3EBB2;
    db $F2                                                               ;B3EBB6;
    dw $3310,$C3F8                                                       ;B3EBB7;
    db $EA                                                               ;B3EBBB;
    dw $3301,$0002                                                       ;B3EBBC;
    db $F7                                                               ;B3EBC0;
    dw $335F,$01FA                                                       ;B3EBC1;
    db $F7                                                               ;B3EBC5;
    dw $335E,$01F2                                                       ;B3EBC6;
    db $0F                                                               ;B3EBCA;
    dw $3352,$01F2                                                       ;B3EBCB;
    db $03                                                               ;B3EBCF;
    dw $331F,$01F2                                                       ;B3EBD0;
    db $FB                                                               ;B3EBD4;
    dw $330F,$C3FA                                                       ;B3EBD5;
    db $07                                                               ;B3EBD9;
    dw $3343,$C3FA                                                       ;B3EBDA;
    db $FF                                                               ;B3EBDE;
    dw $3333                                                             ;B3EBDF;

Spritemaps_DachoraEscape_4:
    dw $0009,$01EF                                                       ;B3EBE1;
    db $F3                                                               ;B3EBE5;
    dw $3310,$C3F7                                                       ;B3EBE6;
    db $EB                                                               ;B3EBEA;
    dw $3301,$01F4                                                       ;B3EBEB;
    db $10                                                               ;B3EBEF;
    dw $3352,$01F2                                                       ;B3EBF0;
    db $04                                                               ;B3EBF4;
    dw $331F,$01F2                                                       ;B3EBF5;
    db $FC                                                               ;B3EBF9;
    dw $330F,$0002                                                       ;B3EBFA;
    db $F8                                                               ;B3EBFE;
    dw $331E,$01FA                                                       ;B3EBFF;
    db $F8                                                               ;B3EC03;
    dw $330E,$C3FA                                                       ;B3EC04;
    db $08                                                               ;B3EC08;
    dw $3346,$C3FA                                                       ;B3EC09;
    db $00                                                               ;B3EC0D;
    dw $3336                                                             ;B3EC0E;

Spritemaps_DachoraEscape_5:
    dw $000B,$01EE                                                       ;B3EC10;
    db $F1                                                               ;B3EC14;
    dw $3310,$C3F6                                                       ;B3EC15;
    db $E9                                                               ;B3EC19;
    dw $3301,$0002                                                       ;B3EC1A;
    db $F6                                                               ;B3EC1E;
    dw $335F,$01FA                                                       ;B3EC1F;
    db $F6                                                               ;B3EC23;
    dw $335E,$01EA                                                       ;B3EC24;
    db $0E                                                               ;B3EC28;
    dw $335A,$01F2                                                       ;B3EC29;
    db $FA                                                               ;B3EC2D;
    dw $330F,$C3FA                                                       ;B3EC2E;
    db $FE                                                               ;B3EC32;
    dw $3339,$C3F2                                                       ;B3EC33;
    db $06                                                               ;B3EC37;
    dw $3348,$000A                                                       ;B3EC38;
    db $06                                                               ;B3EC3C;
    dw $334B,$000A                                                       ;B3EC3D;
    db $0E                                                               ;B3EC41;
    dw $335B,$C3F2                                                       ;B3EC42;
    db $FE                                                               ;B3EC46;
    dw $3338                                                             ;B3EC47;

Spritemaps_DachoraEscape_6:
    dw $0009,$0008                                                       ;B3EC49;
    db $F2                                                               ;B3EC4D;
    dw $7310,$C3F8                                                       ;B3EC4E;
    db $EA                                                               ;B3EC52;
    dw $7301,$01F6                                                       ;B3EC53;
    db $F7                                                               ;B3EC57;
    dw $731E,$01FE                                                       ;B3EC58;
    db $F7                                                               ;B3EC5C;
    dw $730E,$0006                                                       ;B3EC5D;
    db $03                                                               ;B3EC61;
    dw $731F,$0006                                                       ;B3EC62;
    db $FB                                                               ;B3EC66;
    dw $730F,$0006                                                       ;B3EC67;
    db $0F                                                               ;B3EC6B;
    dw $7322,$C3F6                                                       ;B3EC6C;
    db $07                                                               ;B3EC70;
    dw $7313,$C3F6                                                       ;B3EC71;
    db $FF                                                               ;B3EC75;
    dw $7303                                                             ;B3EC76;

Spritemaps_DachoraEscape_7:
    dw $0009,$0009                                                       ;B3EC78;
    db $F3                                                               ;B3EC7C;
    dw $7310,$C3F9                                                       ;B3EC7D;
    db $EB                                                               ;B3EC81;
    dw $7301,$01F6                                                       ;B3EC82;
    db $F8                                                               ;B3EC86;
    dw $735F,$01FE                                                       ;B3EC87;
    db $F8                                                               ;B3EC8B;
    dw $735E,$0006                                                       ;B3EC8C;
    db $04                                                               ;B3EC90;
    dw $731F,$0006                                                       ;B3EC91;
    db $FC                                                               ;B3EC95;
    dw $730F,$C3F6                                                       ;B3EC96;
    db $08                                                               ;B3EC9A;
    dw $7316,$0006                                                       ;B3EC9B;
    db $08                                                               ;B3EC9F;
    dw $7315,$C3F6                                                       ;B3ECA0;
    db $00                                                               ;B3ECA4;
    dw $7306                                                             ;B3ECA5;

Spritemaps_DachoraEscape_8:
    dw $000B,$000A                                                       ;B3ECA7;
    db $F1                                                               ;B3ECAB;
    dw $7310,$C3FA                                                       ;B3ECAC;
    db $E9                                                               ;B3ECB0;
    dw $7301,$000E                                                       ;B3ECB1;
    db $0E                                                               ;B3ECB5;
    dw $732D,$01F6                                                       ;B3ECB6;
    db $F6                                                               ;B3ECBA;
    dw $731E,$01FE                                                       ;B3ECBB;
    db $F6                                                               ;B3ECBF;
    dw $730E,$0006                                                       ;B3ECC0;
    db $FA                                                               ;B3ECC4;
    dw $730F,$C3F6                                                       ;B3ECC5;
    db $FE                                                               ;B3ECC9;
    dw $7309,$C3FE                                                       ;B3ECCA;
    db $FE                                                               ;B3ECCE;
    dw $7308,$01EE                                                       ;B3ECCF;
    db $0E                                                               ;B3ECD3;
    dw $732B,$01EE                                                       ;B3ECD4;
    db $06                                                               ;B3ECD8;
    dw $731B,$C3FE                                                       ;B3ECD9;
    db $06                                                               ;B3ECDD;
    dw $7318                                                             ;B3ECDE;

Spritemaps_DachoraEscape_9:
    dw $0009,$0008                                                       ;B3ECE0;
    db $F2                                                               ;B3ECE4;
    dw $7310,$C3F8                                                       ;B3ECE5;
    db $EA                                                               ;B3ECE9;
    dw $7301,$01F6                                                       ;B3ECEA;
    db $F7                                                               ;B3ECEE;
    dw $735F,$01FE                                                       ;B3ECEF;
    db $F7                                                               ;B3ECF3;
    dw $735E,$0006                                                       ;B3ECF4;
    db $0F                                                               ;B3ECF8;
    dw $7352,$0006                                                       ;B3ECF9;
    db $03                                                               ;B3ECFD;
    dw $731F,$0006                                                       ;B3ECFE;
    db $FB                                                               ;B3ED02;
    dw $730F,$C3F6                                                       ;B3ED03;
    db $07                                                               ;B3ED07;
    dw $7343,$C3F6                                                       ;B3ED08;
    db $FF                                                               ;B3ED0C;
    dw $7333                                                             ;B3ED0D;

Spritemaps_DachoraEscape_A:
    dw $0009,$0009                                                       ;B3ED0F;
    db $F3                                                               ;B3ED13;
    dw $7310,$C3F9                                                       ;B3ED14;
    db $EB                                                               ;B3ED18;
    dw $7301,$0004                                                       ;B3ED19;
    db $10                                                               ;B3ED1D;
    dw $7352,$0006                                                       ;B3ED1E;
    db $04                                                               ;B3ED22;
    dw $731F,$0006                                                       ;B3ED23;
    db $FC                                                               ;B3ED27;
    dw $730F,$01F6                                                       ;B3ED28;
    db $F8                                                               ;B3ED2C;
    dw $731E,$01FE                                                       ;B3ED2D;
    db $F8                                                               ;B3ED31;
    dw $730E,$C3F6                                                       ;B3ED32;
    db $08                                                               ;B3ED36;
    dw $7346,$C3F6                                                       ;B3ED37;
    db $00                                                               ;B3ED3B;
    dw $7336                                                             ;B3ED3C;

Spritemaps_DachoraEscape_B:
    dw $000B,$000A                                                       ;B3ED3E;
    db $F1                                                               ;B3ED42;
    dw $7310,$C3FA                                                       ;B3ED43;
    db $E9                                                               ;B3ED47;
    dw $7301,$01F6                                                       ;B3ED48;
    db $F6                                                               ;B3ED4C;
    dw $735F,$01FE                                                       ;B3ED4D;
    db $F6                                                               ;B3ED51;
    dw $735E,$000E                                                       ;B3ED52;
    db $0E                                                               ;B3ED56;
    dw $735A,$0006                                                       ;B3ED57;
    db $FA                                                               ;B3ED5B;
    dw $730F,$C3F6                                                       ;B3ED5C;
    db $FE                                                               ;B3ED60;
    dw $7339,$C3FE                                                       ;B3ED61;
    db $06                                                               ;B3ED65;
    dw $7348,$01EE                                                       ;B3ED66;
    db $06                                                               ;B3ED6A;
    dw $734B,$01EE                                                       ;B3ED6B;
    db $0E                                                               ;B3ED6F;
    dw $735B,$C3FE                                                       ;B3ED70;
    db $FE                                                               ;B3ED74;
    dw $7338                                                             ;B3ED75;

Freespace_BankB3_ED77:                                                   ;B3ED77;
; $1289 bytes
