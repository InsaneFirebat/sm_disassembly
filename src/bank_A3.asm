
org $A38000


CommonA3_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A38000;
    RTL                                                                  ;A38004;


CommonA3_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A38005;
    RTL                                                                  ;A38009;


CommonA3_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A3800A;
    RTL                                                                  ;A3800E;


CommonA3_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A3800F;
    RTL                                                                  ;A38013;


CommonA3_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A38014;
    RTL                                                                  ;A38018;


UNUSED_CommonA3_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A38019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A38019;
    RTL                                                                  ;A3801D;


CommonA3_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A3801E;
    RTL                                                                  ;A38022;


CommonA3_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A38023;
    RTL                                                                  ;A38027;


CommonA3_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A38028;
    RTL                                                                  ;A3802C;


CommonA3_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A3802D;
    RTL                                                                  ;A38031;


CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A38032;
    RTL                                                                  ;A38036;


CommonA3_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A38037;
    RTL                                                                  ;A3803B;


CommonA3_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A3803C;
    RTL                                                                  ;A38040;


CommonA3_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A38041;
    RTL                                                                  ;A38045;


CommonA3_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A38046;
    RTL                                                                  ;A3804A;


RTS_A3804B:
    RTS                                                                  ;A3804B;


RTL_A3804C:
    RTL                                                                  ;A3804C;


Spritemap_CommonA3_Nothing:
    dw $0000                                                             ;A3804D;

ExtendedSpritemap_CommonA3_Nothing:
    dw $0001,$0000,$0000                                                 ;A3804F;
    dw Spritemap_CommonA3_Nothing                                        ;A38055;
    dw Hitbox_CommonA3_Nothing                                           ;A38057;

Hitbox_CommonA3_Nothing:
    dw $0001,$0000,$0000,$0000,$0000                                     ;A38059;
    dw CommonA3_NormalEnemyTouchAI                                       ;A38063;
    dw CommonA3_NormalEnemyShotAI                                        ;A38065;

InstList_CommonA3_DeleteEnemy:
    dw Instruction_CommonA3_DeleteEnemy                                  ;A38067;

NOPNOP_A38069:
    NOP                                                                  ;A38069;
    NOP                                                                  ;A3806A;

Instruction_CommonA3_Enemy0FB2_InY:
    LDA.W $0000,Y                                                        ;A3806B;
    STA.W EnemyData.work5,X                                              ;A3806E;
    INY                                                                  ;A38071;
    INY                                                                  ;A38072;
    RTL                                                                  ;A38073;


Instruction_CommonA3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A3807B                                                    ;A38074;
    STA.W EnemyData.work5,X                                              ;A38077;
    RTL                                                                  ;A3807A;


RTS_A3807B:
    RTS                                                                  ;A3807B;


Instruction_CommonA3_DeleteEnemy:
    LDA.W EnemyData.properties,X                                         ;A3807C;
    ORA.W #$0200                                                         ;A3807F;
    STA.W EnemyData.properties,X                                         ;A38082;
    PLA                                                                  ;A38085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A38086;
    RTL                                                                  ;A38089;


Instruction_CommonA3_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A3808A;
    STA.B $12                                                            ;A3808D;
    PHY                                                                  ;A3808F;
    PHX                                                                  ;A38090;
    PEA.W .manualReturn-1                                                ;A38091;
    JMP.W ($0012)                                                        ;A38094;


.manualReturn:
    PLX                                                                  ;A38097;
    PLY                                                                  ;A38098;
    INY                                                                  ;A38099;
    INY                                                                  ;A3809A;
    RTL                                                                  ;A3809B;


Instruction_CommonA3_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A3809C;
    STA.B $12                                                            ;A3809F;
    LDA.W $0002,Y                                                        ;A380A1;
    PHY                                                                  ;A380A4;
    PHX                                                                  ;A380A5;
    PEA.W .manualReturn-1                                                ;A380A6;
    JMP.W ($0012)                                                        ;A380A9;


.manualReturn:
    PLX                                                                  ;A380AC;
    PLY                                                                  ;A380AD;
    TYA                                                                  ;A380AE;
    CLC                                                                  ;A380AF;
    ADC.W #$0004                                                         ;A380B0;
    TAY                                                                  ;A380B3;
    RTL                                                                  ;A380B4;


UNUSED_Instruction_CommonA3_CallExternalFunctionInY_A380B5:
    LDA.W $0000,Y                                                        ;A380B5;
    STA.B $12                                                            ;A380B8;
    LDA.W $0001,Y                                                        ;A380BA;
    STA.B $13                                                            ;A380BD;
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
    JML.W [$0012]                                                        ;A380CB;


UNUSED_Inst_CommonA3_CallExternalFunctionInY_WithA_A380CE:
    LDA.W $0000,Y                                                        ;A380CE;
    STA.B $12                                                            ;A380D1;
    LDA.W $0001,Y                                                        ;A380D3;
    STA.B $13                                                            ;A380D6;
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
    JML.W [$0012]                                                        ;A380EA;


Instruction_CommonA3_GotoY:
    LDA.W $0000,Y                                                        ;A380ED;
    TAY                                                                  ;A380F0;
    RTL                                                                  ;A380F1;


Instruction_CommonA3_GotoY_PlusY:
    STY.B $12                                                            ;A380F2;
    DEY                                                                  ;A380F4;
    LDA.W $0000,Y                                                        ;A380F5;
    XBA                                                                  ;A380F8;
    BMI .highByte                                                        ;A380F9;
    AND.W #$00FF                                                         ;A380FB;
    BRA +                                                                ;A380FE;


.highByte:
    ORA.W #$FF00                                                         ;A38100;

  + CLC                                                                  ;A38103;
    ADC.B $12                                                            ;A38104;
    TAY                                                                  ;A38106;
    RTL                                                                  ;A38107;

    DEC.W EnemyData.loopCounter,X                                        ;A38108;

Instruction_CommonA3_DecrementTimer_GotoYIfNonZero:
    BNE Instruction_CommonA3_GotoY                                       ;A3810B;
    INY                                                                  ;A3810D;
    INY                                                                  ;A3810E;
    RTL                                                                  ;A3810F;


Instruction_CommonA3_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W EnemyData.loopCounter,X                                        ;A38110;
    BNE Instruction_CommonA3_GotoY                                       ;A38113;
    INY                                                                  ;A38115;
    INY                                                                  ;A38116;
    RTL                                                                  ;A38117;


Instruction_CommonA3_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A38118;
    DEC.W EnemyData.loopCounter,X                                        ;A3811A;
    REP #$20                                                             ;A3811D;
    BNE Instruction_CommonA3_GotoY_PlusY                                 ;A3811F;
    INY                                                                  ;A38121;
    RTL                                                                  ;A38122;


Instruction_CommonA3_TimerInY:
    LDA.W $0000,Y                                                        ;A38123;
    STA.W EnemyData.loopCounter,X                                        ;A38126;
    INY                                                                  ;A38129;
    INY                                                                  ;A3812A;
    RTL                                                                  ;A3812B;


Instruction_CommonA3_SkipNextInstruction:
    INY                                                                  ;A3812C;
    INY                                                                  ;A3812D;
    RTL                                                                  ;A3812E;


Instruction_CommonA3_Sleep:
    DEY                                                                  ;A3812F;
    DEY                                                                  ;A38130;
    TYA                                                                  ;A38131;
    STA.W EnemyData.pInstList,X                                          ;A38132;
    PLA                                                                  ;A38135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A38136;
    RTL                                                                  ;A38139;


Instruction_CommonA3_WaitYFrames:
    LDA.W $0000,Y                                                        ;A3813A;
    STA.W EnemyData.instTimer,X                                          ;A3813D;
    INY                                                                  ;A38140;
    INY                                                                  ;A38141;
    TYA                                                                  ;A38142;
    STA.W EnemyData.pInstList,X                                          ;A38143;
    PLA                                                                  ;A38146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A38147;
    RTL                                                                  ;A3814A;


Instruction_CommonA3_TransferYBytesInYToVRAM:
    PHX                                                                  ;A3814B;
    LDX.W $0330                                                          ;A3814C;
    LDA.W $0000,Y                                                        ;A3814F;
    STA.B $D0,X                                                          ;A38152;
    LDA.W $0002,Y                                                        ;A38154;
    STA.B $D2,X                                                          ;A38157;
    LDA.W $0003,Y                                                        ;A38159;
    STA.B $D3,X                                                          ;A3815C;
    LDA.W $0005,Y                                                        ;A3815E;
    STA.B $D5,X                                                          ;A38161;
    TXA                                                                  ;A38163;
    CLC                                                                  ;A38164;
    ADC.W #$0007                                                         ;A38165;
    STA.W $0330                                                          ;A38168;
    TYA                                                                  ;A3816B;
    CLC                                                                  ;A3816C;
    ADC.W #$0007                                                         ;A3816D;
    TAY                                                                  ;A38170;
    PLX                                                                  ;A38171;
    RTL                                                                  ;A38172;


Instruction_CommonA3_EnableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;A38173;
    ORA.W #$0800                                                         ;A38176;
    STA.W EnemyData.properties,X                                         ;A38179;
    RTL                                                                  ;A3817C;


Instruction_CommonA3_DisableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;A3817D;
    AND.W #$F7FF                                                         ;A38180;
    STA.W EnemyData.properties,X                                         ;A38183;
    RTL                                                                  ;A38186;


CommonA3EnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000                   ;A08187;
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000                   ;A08197;
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000                   ;A081A7;
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000                   ;A081B7;
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000                   ;A081C7;
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000                   ;A081D7;
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000                   ;A081E7;
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000                   ;A081F7;
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000                   ;A08207;
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000                   ;A08217;
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000                   ;A08227;
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000                   ;A08237;
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000                   ;A08247;
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000                   ;A08257;
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000                   ;A08267;
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000                   ;A08277;
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000                   ;A08287;
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000                   ;A08297;
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000                   ;A082A7;
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000                   ;A082B7;
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000                   ;A082C7;
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000                   ;A082D7;
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000                   ;A082E7;
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000                   ;A082F7;
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000                   ;A08307;
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000                   ;A08317;
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000                   ;A08327;
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000                   ;A08337;
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000                   ;A08347;
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000                   ;A08357;
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000                   ;A08367;
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000                   ;A08377;
    dw $0004,$0000,$FFFC,$0000                                           ;A08387;

CommonA3EnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF                   ;A0838F;
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF                   ;A0839F;
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF                   ;A083AF;
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF                   ;A083BF;
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF                   ;A083CF;
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF                   ;A083DF;
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF                   ;A083EF;
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF                   ;A083FF;
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF                   ;A0840F;
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF                   ;A0841F;
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF                   ;A0842F;
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE                   ;A0843F;
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE                   ;A0844F;
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE                   ;A0845F;
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE                   ;A0846F;
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE                   ;A0847F;
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD                   ;A0848F;
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD                   ;A0849F;
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD                   ;A084AF;
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC                   ;A084BF;
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC                   ;A084CF;
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC                   ;A084DF;
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB                   ;A084EF;
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB                   ;A084FF;
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB                   ;A0850F;
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA                   ;A0851F;
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA                   ;A0852F;
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9                   ;A0853F;
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9                   ;A0854F;
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9                   ;A0855F;
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8                   ;A0856F;
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8                   ;A0857F;
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7                   ;A0858F;
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7                   ;A0859F;
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6                   ;A085AF;
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6                   ;A085BF;
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5                   ;A085CF;
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4                   ;A085DF;
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4                   ;A085EF;
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3                   ;A085FF;
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3                   ;A0860F;
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2                   ;A0861F;
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1                   ;A0862F;
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1                   ;A0863F;
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0                   ;A0864F;
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF                   ;A0865F;
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE                   ;A0866F;
    dw $74F9,$0011,$8B07,$FFEE                                           ;A0867F;

Palette_Waver:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A38687;
    dw $2C63,$241F,$1C17,$142F,$0C47,$3BE0,$2680,$1580                   ;A38697;

InstList_Waver_Steady_FacingLeft:
    dw $0001                                                             ;A386A7;
    dw Spritemap_Waver_2                                                 ;A386A9;
    dw Instruction_Common_Sleep                                          ;A386AB;

InstList_Waver_Steady_FacingRight:
    dw $0001                                                             ;A386AD;
    dw Spritemap_Waver_7                                                 ;A386AF;
    dw Instruction_Common_Sleep                                          ;A386B1;

InstList_Waver_Spinning_FacingLeft:
    dw $0008                                                             ;A386B3;
    dw Spritemap_Waver_3                                                 ;A386B5;
    dw $0008                                                             ;A386B7;
    dw Spritemap_Waver_4                                                 ;A386B9;
    dw $0008                                                             ;A386BB;
    dw Spritemap_Waver_0                                                 ;A386BD;
    dw $0008                                                             ;A386BF;
    dw Spritemap_Waver_1                                                 ;A386C1;
    dw Instruction_Waver_SetSpinFinishedFlag                             ;A386C3;
    dw Instruction_Common_Sleep                                          ;A386C5;

InstList_Waver_Spinning_FacingRight:
    dw $0008                                                             ;A386C7;
    dw Spritemap_Waver_8                                                 ;A386C9;
    dw $0008                                                             ;A386CB;
    dw Spritemap_Waver_9                                                 ;A386CD;
    dw $0008                                                             ;A386CF;
    dw Spritemap_Waver_5                                                 ;A386D1;
    dw $0008                                                             ;A386D3;
    dw Spritemap_Waver_6                                                 ;A386D5;
    dw Instruction_Waver_SetSpinFinishedFlag                             ;A386D7;
    dw Instruction_Common_Sleep                                          ;A386D9;

InstListPointers_Waver:
    dw InstList_Waver_Steady_FacingLeft                                  ;A386DB;
    dw InstList_Waver_Steady_FacingRight                                 ;A386DD;
    dw InstList_Waver_Spinning_FacingLeft                                ;A386DF;
    dw InstList_Waver_Spinning_FacingRight                               ;A386E1;

Instruction_Waver_SetSpinFinishedFlag:
    LDX.W $0E54                                                          ;A386E3;
    LDA.W #$0001                                                         ;A386E6;
    STA.W EnemyData.work4,X                                              ;A386E9;
    RTL                                                                  ;A386EC;


InitAI_Waver:
    LDX.W $0E54                                                          ;A386ED;
    LDA.W #$0180                                                         ;A386F0;
    AND.W #$FF00                                                         ;A386F3;
    XBA                                                                  ;A386F6;
    STA.W EnemyData.work1,X                                              ;A386F7;
    LDA.W #$0180                                                         ;A386FA;
    AND.W #$00FF                                                         ;A386FD;
    XBA                                                                  ;A38700;
    STA.W EnemyData.work0,X                                              ;A38701;
    LDA.W EnemyData.initParam0,X                                         ;A38704;
    AND.W #$0001                                                         ;A38707;
    BNE .facingLeft                                                      ;A3870A;
    LDA.W #$0180                                                         ;A3870C;
    EOR.W #$FFFF                                                         ;A3870F;
    INC A                                                                ;A38712;
    AND.W #$FF00                                                         ;A38713;
    XBA                                                                  ;A38716;
    JSL.L Sign_Extend_A                                                  ;A38717;
    STA.W EnemyData.work1,X                                              ;A3871B;
    LDA.W #$0180                                                         ;A3871E;
    EOR.W #$FFFF                                                         ;A38721;
    INC A                                                                ;A38724;
    AND.W #$00FF                                                         ;A38725;
    XBA                                                                  ;A38728;
    JSL.L Sign_Extend_A                                                  ;A38729;
    STA.W EnemyData.work0,X                                              ;A3872D;

.facingLeft:
    STZ.W EnemyData.work5,X                                              ;A38730;
    STZ.W EnemyData.work2,X                                              ;A38733;
    STZ.W EnemyData.work4,X                                              ;A38736;
    LDA.W #InstList_Waver_Steady_FacingLeft                              ;A38739;
    STA.W EnemyData.pInstList,X                                          ;A3873C;
    LDA.W EnemyData.initParam0,X                                         ;A3873F;
    AND.W #$0001                                                         ;A38742;
    STA.W EnemyData.work5,X                                              ;A38745;
    JSR.W SetWaverInstList                                               ;A38748;
    RTL                                                                  ;A3874B;


MainAI_Waver:
    LDX.W $0E54                                                          ;A3874C;
    LDA.W EnemyData.work0,X                                              ;A3874F;
    STA.B $12                                                            ;A38752;
    LDA.W EnemyData.work1,X                                              ;A38754;
    STA.B $14                                                            ;A38757;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A38759;
    BCC .noWallCollision                                                 ;A3875D;
    LDA.W EnemyData.work0+1,X                                            ;A3875F;
    STA.B $12                                                            ;A38762;
    EOR.W #$FFFF                                                         ;A38764;
    INC A                                                                ;A38767;
    AND.W #$FF00                                                         ;A38768;
    XBA                                                                  ;A3876B;
    JSL.L Sign_Extend_A                                                  ;A3876C;
    STA.W EnemyData.work1,X                                              ;A38770;
    LDA.B $12                                                            ;A38773;
    EOR.W #$FFFF                                                         ;A38775;
    INC A                                                                ;A38778;
    AND.W #$00FF                                                         ;A38779;
    XBA                                                                  ;A3877C;
    JSL.L Sign_Extend_A                                                  ;A3877D;
    STA.W EnemyData.work0,X                                              ;A38781;
    LDA.W EnemyData.work5,X                                              ;A38784;
    EOR.W #$0001                                                         ;A38787;
    AND.W #$0001                                                         ;A3878A;
    STA.W EnemyData.work5,X                                              ;A3878D;
    JSR.W SetWaverInstList                                               ;A38790;
    JMP.W .merge                                                         ;A38793;


.noWallCollision:
    LDA.W #$0004                                                         ;A38796;
    STA.W $0E32                                                          ;A38799;
    LDA.W EnemyData.work3,X                                              ;A3879C;
    AND.W #$00FF                                                         ;A3879F;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A387A2;
    STA.B $14                                                            ;A387A6;
    STZ.B $12                                                            ;A387A8;
    JSL.L MoveEnemyDownBy_14_12                                          ;A387AA;
    BCC .noBlockCollision                                                ;A387AE;
    LDX.W $0E54                                                          ;A387B0;
    LDA.W EnemyData.work3,X                                              ;A387B3;
    CLC                                                                  ;A387B6;
    ADC.W #$0080                                                         ;A387B7;
    AND.W #$00FF                                                         ;A387BA;
    STA.W EnemyData.work3,X                                              ;A387BD;
    BRA .merge                                                           ;A387C0;


.noBlockCollision:
    LDX.W $0E54                                                          ;A387C2;
    LDA.W EnemyData.work3,X                                              ;A387C5;
    CLC                                                                  ;A387C8;
    ADC.W #$0002                                                         ;A387C9;
    STA.W EnemyData.work3,X                                              ;A387CC;

.merge:
    LDX.W $0E54                                                          ;A387CF;
    LDA.W EnemyData.work3,X                                              ;A387D2;
    AND.W #$007F                                                         ;A387D5;
    CMP.W #$0038                                                         ;A387D8;
    BNE .notSpinning                                                     ;A387DB;
    LDA.W EnemyData.work5,X                                              ;A387DD;
    ORA.W #$0002                                                         ;A387E0;
    STA.W EnemyData.work5,X                                              ;A387E3;
    JSR.W SetWaverInstList                                               ;A387E6;

.notSpinning:
    LDA.W EnemyData.work4,X                                              ;A387E9;
    BEQ .return                                                          ;A387EC;
    STZ.W EnemyData.work4,X                                              ;A387EE;
    LDA.W EnemyData.work5,X                                              ;A387F1;
    AND.W #$0001                                                         ;A387F4;
    STA.W EnemyData.work5,X                                              ;A387F7;
    JSR.W SetWaverInstList                                               ;A387FA;

.return:
    RTL                                                                  ;A387FD;


SetWaverInstList:
    LDX.W $0E54                                                          ;A387FE;
    LDA.W EnemyData.work5,X                                              ;A38801;
    CMP.W EnemyData.work2,X                                              ;A38804;
    BEQ .return                                                          ;A38807;
    STA.W EnemyData.work2,X                                              ;A38809;
    ASL A                                                                ;A3880C;
    TAY                                                                  ;A3880D;
    LDA.W InstListPointers_Waver,Y                                       ;A3880E;
    STA.W EnemyData.pInstList,X                                          ;A38811;
    LDA.W #$0001                                                         ;A38814;
    STA.W EnemyData.instTimer,X                                          ;A38817;
    STZ.W EnemyData.loopCounter,X                                        ;A3881A;

.return:
    RTS                                                                  ;A3881D;


Spritemap_Waver_0:
    dw $0004,$0000                                                       ;A3881E;
    db $08                                                               ;A38822;
    dw $2122,$01F8                                                       ;A38823;
    db $08                                                               ;A38827;
    dw $2121,$8000                                                       ;A38828;
    db $F8                                                               ;A3882C;
    dw $2102,$81F0                                                       ;A3882D;
    db $F8                                                               ;A38831;
    dw $2100                                                             ;A38832;

Spritemap_Waver_1:
    dw $0004,$01ED                                                       ;A38834;
    db $FC                                                               ;A38838;
    dw $2124,$0005                                                       ;A38839;
    db $00                                                               ;A3883D;
    dw $2116,$0005                                                       ;A3883E;
    db $F8                                                               ;A38842;
    dw $2106,$81F5                                                       ;A38843;
    db $F8                                                               ;A38847;
    dw $2104                                                             ;A38848;

Spritemap_Waver_2:
    dw $0003,$01ED                                                       ;A3884A;
    db $FD                                                               ;A3884E;
    dw $2126,$01F5                                                       ;A3884F;
    db $FD                                                               ;A38853;
    dw $2127,$81FD                                                       ;A38854;
    db $F8                                                               ;A38858;
    dw $2107                                                             ;A38859;

Spritemap_Waver_3:
    dw $0004,$01EC                                                       ;A3885B;
    db $FC                                                               ;A3885F;
    dw $2129,$0004                                                       ;A38860;
    db $00                                                               ;A38864;
    dw $211B,$0004                                                       ;A38865;
    db $F8                                                               ;A38869;
    dw $210B,$81F4                                                       ;A3886A;
    db $F8                                                               ;A3886E;
    dw $2109                                                             ;A3886F;

Spritemap_Waver_4:
    dw $0004,$0000                                                       ;A38871;
    db $08                                                               ;A38875;
    dw $212E,$01F8                                                       ;A38876;
    db $08                                                               ;A3887A;
    dw $212D,$8000                                                       ;A3887B;
    db $F8                                                               ;A3887F;
    dw $210E,$81F0                                                       ;A38880;
    db $F8                                                               ;A38884;
    dw $210C                                                             ;A38885;

Spritemap_Waver_5:
    dw $0004,$01F8                                                       ;A38887;
    db $08                                                               ;A3888B;
    dw $6122,$0000                                                       ;A3888C;
    db $08                                                               ;A38890;
    dw $6121,$81F0                                                       ;A38891;
    db $F8                                                               ;A38895;
    dw $6102,$8000                                                       ;A38896;
    db $F8                                                               ;A3889A;
    dw $6100                                                             ;A3889B;

Spritemap_Waver_6:
    dw $0004,$000B                                                       ;A3889D;
    db $FC                                                               ;A388A1;
    dw $6124,$01F3                                                       ;A388A2;
    db $00                                                               ;A388A6;
    dw $6116,$01F3                                                       ;A388A7;
    db $F8                                                               ;A388AB;
    dw $6106,$81FB                                                       ;A388AC;
    db $F8                                                               ;A388B0;
    dw $6104                                                             ;A388B1;

Spritemap_Waver_7:
    dw $0003,$000B                                                       ;A388B3;
    db $FD                                                               ;A388B7;
    dw $6126,$0003                                                       ;A388B8;
    db $FD                                                               ;A388BC;
    dw $6127,$81F3                                                       ;A388BD;
    db $F8                                                               ;A388C1;
    dw $6107                                                             ;A388C2;

Spritemap_Waver_8:
    dw $0004,$000C                                                       ;A388C4;
    db $FC                                                               ;A388C8;
    dw $6129,$01F4                                                       ;A388C9;
    db $00                                                               ;A388CD;
    dw $611B,$01F4                                                       ;A388CE;
    db $F8                                                               ;A388D2;
    dw $610B,$81FC                                                       ;A388D3;
    db $F8                                                               ;A388D7;
    dw $6109                                                             ;A388D8;

Spritemap_Waver_9:
    dw $0004,$01F8                                                       ;A388DA;
    db $08                                                               ;A388DE;
    dw $612E,$0000                                                       ;A388DF;
    db $08                                                               ;A388E3;
    dw $612D,$81F0                                                       ;A388E4;
    db $F8                                                               ;A388E8;
    dw $610E,$8000                                                       ;A388E9;
    db $F8                                                               ;A388ED;
    dw $610C                                                             ;A388EE;

Palette_Metaree:
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616                   ;A388F0;
    dw $0132,$6F39,$5A73,$41AD,$2D08,$1863,$7FFF,$0041                   ;A38900;

InstList_Metaree_Idling:
    dw $000A                                                             ;A38910;
    dw Spritemap_Metaree_0                                               ;A38912;
    dw $000A                                                             ;A38914;
    dw Spritemap_Metaree_2                                               ;A38916;
    dw $000A                                                             ;A38918;
    dw Spritemap_Metaree_3                                               ;A3891A;
    dw $000A                                                             ;A3891C;
    dw Spritemap_Metaree_4                                               ;A3891E;
    dw Instruction_Common_GotoY                                          ;A38920;
    dw InstList_Metaree_Idling                                           ;A38922;

InstList_Metaree_PrepareToLaunchAttack:
    dw $0010                                                             ;A38924;
    dw Spritemap_Metaree_0                                               ;A38926;
    dw $0008                                                             ;A38928;
    dw Spritemap_Metaree_1                                               ;A3892A;
    dw Instruction_Metaree_SetAttackReadyFlag                            ;A3892C;
    dw Instruction_Common_Sleep                                          ;A3892E;

InstList_Metaree_LaunchedAttack_0:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A38930;

InstList_Metaree_LaunchedAttack_1:
    dw $0002                                                             ;A38932;
    dw Spritemap_Metaree_2                                               ;A38934;
    dw $0002                                                             ;A38936;
    dw Spritemap_Metaree_3                                               ;A38938;
    dw $0002                                                             ;A3893A;
    dw Spritemap_Metaree_4                                               ;A3893C;
    dw $0002                                                             ;A3893E;
    dw Spritemap_Metaree_0                                               ;A38940;
    dw Instruction_Common_GotoY                                          ;A38942;
    dw InstList_Metaree_LaunchedAttack_1                                 ;A38944;

UNUSED_InstList_Metaree_StopAnimating_A38946:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A38946;
    dw $0001                                                             ;A38948;
    dw Spritemap_Metaree_0                                               ;A3894A;
    dw Instruction_Common_Sleep                                          ;A3894C;

InstListPointers_Metaree:
    dw InstList_Metaree_Idling                                           ;A3894E;
    dw InstList_Metaree_PrepareToLaunchAttack                            ;A38950;
    dw InstList_Metaree_LaunchedAttack_0                                 ;A38952;
    dw UNUSED_InstList_Metaree_StopAnimating_A38946                      ;A38954;

Instruction_Metaree_SetAttackReadyFlag:
    LDX.W $0E54                                                          ;A38956;
    LDA.W #$0001                                                         ;A38959;
    STA.W EnemyData.work4,X                                              ;A3895C;
    RTL                                                                  ;A3895F;


InitAI_Metaree:
    LDX.W $0E54                                                          ;A38960;
    STZ.W EnemyData.work2,X                                              ;A38963;
    STZ.W EnemyData.work3,X                                              ;A38966;
    STZ.W EnemyData.work4,X                                              ;A38969;
    LDA.W #InstList_Metaree_Idling                                       ;A3896C;
    STA.W EnemyData.pInstList,X                                          ;A3896F;
    LDA.W #Function_Metaree_Idling                                       ;A38972;
    STA.W EnemyData.work1,X                                              ;A38975;
    RTL                                                                  ;A38978;


MainAI_Metaree:
    LDX.W $0E54                                                          ;A38979;
    JMP.W ($0FAA,X)                                                      ;A3897C;


UNUSED_FunctionPointers_Metaree_A3897F:
    dw Function_Metaree_Idling                                           ;A3897F;
    dw Function_Metaree_PrepareToLaunchAttack                            ;A38981;
    dw Function_Metaree_LaunchedAttack                                   ;A38983;
    dw Function_Metaree_Burrowing                                        ;A38985;

Function_Metaree_Idling:
    LDX.W $0E54                                                          ;A38987;
    LDA.W EnemyData.xPosition,X                                          ;A3898A;
    SEC                                                                  ;A3898D;
    SBC.W $0AF6                                                          ;A3898E;
    BPL +                                                                ;A38991;
    EOR.W #$FFFF                                                         ;A38993;
    INC A                                                                ;A38996;

  + CMP.W #$0048                                                         ;A38997;
    BCS .return                                                          ;A3899A;
    JSR.W DetermineMetareeYVelocity                                      ;A3899C;
    INC.W EnemyData.work2,X                                              ;A3899F;
    JSR.W SetMetareeInstListPointer                                      ;A389A2;
    LDA.W #Function_Metaree_PrepareToLaunchAttack                        ;A389A5;
    STA.W EnemyData.work1,X                                              ;A389A8;

.return:
    RTL                                                                  ;A389AB;


DetermineMetareeYVelocity:
    LDA.W $0AFA                                                          ;A389AC;
    SEC                                                                  ;A389AF;
    SBC.W EnemyData.yPosition,X                                          ;A389B0;
    STA.W HW_WRDIV                                                       ;A389B3;
    SEP #$20                                                             ;A389B6;
    LDA.B #$18                                                           ;A389B8;
    STA.W HW_WRDIVB                                                      ;A389BA;
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
    STA.W EnemyData.work5,X                                              ;A389D0;
    RTS                                                                  ;A389D3;


Function_Metaree_PrepareToLaunchAttack:
    LDA.W EnemyData.work4,X                                              ;A389D4;
    BEQ .return                                                          ;A389D7;
    STZ.W EnemyData.work4,X                                              ;A389D9;
    LDX.W $0E54                                                          ;A389DC;
    INC.W EnemyData.work2,X                                              ;A389DF;
    JSR.W SetMetareeInstListPointer                                      ;A389E2;
    LDA.W #Function_Metaree_LaunchedAttack                               ;A389E5;
    STA.W EnemyData.work1,X                                              ;A389E8;
    LDA.W #$005B                                                         ;A389EB;
    JSL.L QueueSound_Lib2_Max6                                           ;A389EE;

.return:
    RTL                                                                  ;A389F2;


Function_Metaree_LaunchedAttack:
    LDX.W $0E54                                                          ;A389F3;
    LDA.W #$0015                                                         ;A389F6;
    STA.W EnemyData.work0,X                                              ;A389F9;
    LDA.W EnemyData.work5,X                                              ;A389FC;
    STA.B $14                                                            ;A389FF;
    STZ.B $12                                                            ;A38A01;
    LDA.W EnemyData.properties,X                                         ;A38A03;
    ORA.W #$0003                                                         ;A38A06;
    STA.W EnemyData.properties,X                                         ;A38A09;
    LDX.W $0E54                                                          ;A38A0C;
    JSL.L CheckForVerticalSolidBlockCollision_SkreeMetaree               ;A38A0F;
    BCS .collision                                                       ;A38A13;
    LDX.W $0E54                                                          ;A38A15;
    LDA.W EnemyData.yPosition,X                                          ;A38A18;
    CLC                                                                  ;A38A1B;
    ADC.W EnemyData.work5,X                                              ;A38A1C;
    STA.W EnemyData.yPosition,X                                          ;A38A1F;
    LDA.W #$0002                                                         ;A38A22;
    STA.W $0E24                                                          ;A38A25;
    LDA.W EnemyData.xPosition,X                                          ;A38A28;
    CMP.W $0AF6                                                          ;A38A2B;
    BMI .steerLeft                                                       ;A38A2E;
    LDA.W #$FFFE                                                         ;A38A30;
    STA.W $0E24                                                          ;A38A33;

.steerLeft:
    LDA.W EnemyData.xPosition,X                                          ;A38A36;
    CLC                                                                  ;A38A39;
    ADC.W $0E24                                                          ;A38A3A;
    STA.W EnemyData.xPosition,X                                          ;A38A3D;
    BRA .return                                                          ;A38A40;


.collision:
    LDX.W $0E54                                                          ;A38A42;
    LDA.W #$0001                                                         ;A38A45;
    STA.W EnemyData.instTimer,X                                          ;A38A48;
    STZ.W EnemyData.loopCounter,X                                        ;A38A4B;
    LDA.W #Function_Metaree_Burrowing                                    ;A38A4E;
    STA.W EnemyData.work1,X                                              ;A38A51;
    LDA.W #$005C                                                         ;A38A54;
    JSL.L QueueSound_Lib2_Max6                                           ;A38A57;

.return:
    RTL                                                                  ;A38A5B;


Function_Metaree_Burrowing:
    LDX.W $0E54                                                          ;A38A5C;
    DEC.W EnemyData.work0,X                                              ;A38A5F;
    BEQ .delete                                                          ;A38A62;
    LDA.W EnemyData.work0,X                                              ;A38A64;
    CMP.W #$0008                                                         ;A38A67;
    BNE .timerNot8                                                       ;A38A6A;
    LDX.W $0E54                                                          ;A38A6C;
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownRight                 ;A38A6F;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38A72;
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpRight                   ;A38A76;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38A79;
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownLeft                  ;A38A7D;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38A80;
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpLeft                    ;A38A84;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38A87;

.timerNot8:
    LDX.W $0E54                                                          ;A38A8B;
    INC.W EnemyData.yPosition,X                                          ;A38A8E;
    RTL                                                                  ;A38A91;


.delete:
    LDX.W $0E54                                                          ;A38A92;
    LDA.W EnemyData.palette,X                                            ;A38A95;
    ORA.W EnemyData.gfxOffset,X                                          ;A38A98;
    STA.L $7E7006,X                                                      ;A38A9B;
    LDA.W #$0A00                                                         ;A38A9F;
    STA.W EnemyData.palette,X                                            ;A38AA2;
    STZ.W EnemyData.gfxOffset,X                                          ;A38AA5;
    LDA.W EnemyData.properties,X                                         ;A38AA8;
    ORA.W #$0200                                                         ;A38AAB;
    STA.W EnemyData.properties,X                                         ;A38AAE;
    RTL                                                                  ;A38AB1;


SetMetareeInstListPointer:
    LDX.W $0E54                                                          ;A38AB2;
    LDA.W EnemyData.work2,X                                              ;A38AB5;
    CMP.W EnemyData.work3,X                                              ;A38AB8;
    BEQ .return                                                          ;A38ABB;
    STA.W EnemyData.work3,X                                              ;A38ABD;
    ASL A                                                                ;A38AC0;
    TAY                                                                  ;A38AC1;
    LDA.W InstListPointers_Metaree,Y                                     ;A38AC2;
    STA.W EnemyData.pInstList,X                                          ;A38AC5;
    LDA.W #$0001                                                         ;A38AC8;
    STA.W EnemyData.instTimer,X                                          ;A38ACB;
    STZ.W EnemyData.loopCounter,X                                        ;A38ACE;

.return:
    RTS                                                                  ;A38AD1;


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

RTL_A38B0E:
    RTL                                                                  ;A38B0E;


EnemyShot_Metaree:
    LDX.W $0E54                                                          ;A38B0F;
    LDA.W EnemyData.gfxOffset,X                                          ;A38B12;
    STA.W $0E2A                                                          ;A38B15;
    LDA.W EnemyData.palette,X                                            ;A38B18;
    STA.W $0E2C                                                          ;A38B1B;
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A38B1E;
    LDX.W $0E54                                                          ;A38B22;
    LDA.W EnemyData.health,X                                             ;A38B25;
    BNE .return                                                          ;A38B28;
    LDX.W $0E54                                                          ;A38B2A;
    LDA.W $0E2A                                                          ;A38B2D;
    STA.W EnemyData.gfxOffset,X                                          ;A38B30;
    LDA.W $0E2C                                                          ;A38B33;
    STA.W EnemyData.palette,X                                            ;A38B36;
    LDA.W EnemyData.work0,X                                              ;A38B39;
    LDX.W $0E54                                                          ;A38B3C;
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownRight                 ;A38B3F;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38B42;
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpRight                   ;A38B46;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38B49;
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownLeft                  ;A38B4D;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38B50;
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpLeft                    ;A38B54;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A38B57;
    LDX.W $0E54                                                          ;A38B5B;
    STZ.W EnemyData.gfxOffset,X                                          ;A38B5E;
    STZ.W EnemyData.palette,X                                            ;A38B61;

.return:
    RTL                                                                  ;A38B64;


Spritemap_Metaree_0:
    dw $0009,$0004                                                       ;A38B65;
    db $F5                                                               ;A38B69;
    dw $6122,$0004                                                       ;A38B6A;
    db $FD                                                               ;A38B6E;
    dw $6123,$0004                                                       ;A38B6F;
    db $05                                                               ;A38B73;
    dw $6124,$01F4                                                       ;A38B74;
    db $05                                                               ;A38B78;
    dw $2124,$01F4                                                       ;A38B79;
    db $FD                                                               ;A38B7D;
    dw $2123,$01F4                                                       ;A38B7E;
    db $F5                                                               ;A38B82;
    dw $2122,$0000                                                       ;A38B83;
    db $03                                                               ;A38B87;
    dw $2121,$01F8                                                       ;A38B88;
    db $03                                                               ;A38B8C;
    dw $2120,$81F8                                                       ;A38B8D;
    db $F3                                                               ;A38B91;
    dw $2100                                                             ;A38B92;

Spritemap_Metaree_1:
    dw $0007,$0005                                                       ;A38B94;
    db $03                                                               ;A38B98;
    dw $6127,$01F3                                                       ;A38B99;
    db $03                                                               ;A38B9D;
    dw $2127,$0005                                                       ;A38B9E;
    db $FB                                                               ;A38BA2;
    dw $6126,$01F3                                                       ;A38BA3;
    db $FB                                                               ;A38BA7;
    dw $2126,$0005                                                       ;A38BA8;
    db $F3                                                               ;A38BAC;
    dw $6125,$01F3                                                       ;A38BAD;
    db $F3                                                               ;A38BB1;
    dw $2125,$81F8                                                       ;A38BB2;
    db $F3                                                               ;A38BB6;
    dw $2102                                                             ;A38BB7;

Spritemap_Metaree_2:
    dw $0007,$81F5                                                       ;A38BB9;
    db $03                                                               ;A38BBD;
    dw $2106,$81F5                                                       ;A38BBE;
    db $F3                                                               ;A38BC2;
    dw $2104,$0000                                                       ;A38BC3;
    db $03                                                               ;A38BC7;
    dw $2121,$81F8                                                       ;A38BC8;
    db $F3                                                               ;A38BCC;
    dw $2100,$0000                                                       ;A38BCD;
    db $03                                                               ;A38BD1;
    dw $212A,$0000                                                       ;A38BD2;
    db $FB                                                               ;A38BD6;
    dw $2129,$0000                                                       ;A38BD7;
    db $F3                                                               ;A38BDB;
    dw $2128                                                             ;A38BDC;

Spritemap_Metaree_3:
    dw $0002,$81F8                                                       ;A38BDE;
    db $03                                                               ;A38BE2;
    dw $210E,$81F8                                                       ;A38BE3;
    db $F3                                                               ;A38BE7;
    dw $210C                                                             ;A38BE8;

Spritemap_Metaree_4:
    dw $0007,$81FB                                                       ;A38BEA;
    db $03                                                               ;A38BEE;
    dw $210A,$81FB                                                       ;A38BEF;
    db $F3                                                               ;A38BF3;
    dw $2108,$01F8                                                       ;A38BF4;
    db $03                                                               ;A38BF8;
    dw $2120,$81F8                                                       ;A38BF9;
    db $F3                                                               ;A38BFD;
    dw $2100,$01F8                                                       ;A38BFE;
    db $03                                                               ;A38C02;
    dw $612A,$01F8                                                       ;A38C03;
    db $FB                                                               ;A38C07;
    dw $6129,$01F8                                                       ;A38C08;
    db $F3                                                               ;A38C0C;
    dw $6128                                                             ;A38C0D;

Palette_Fireflea:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA                   ;A38C0F;
    dw $0011,$7F5A,$5D45,$40C3,$2462,$53E9,$3AC6,$1961                   ;A38C1F;

InstList_Fireflea:
    dw $0002                                                             ;A38C2F;
    dw Spritemap_Fireflea_0                                              ;A38C31;
    dw $0001                                                             ;A38C33;
    dw Spritemap_Fireflea_1                                              ;A38C35;
    dw $0002                                                             ;A38C37;
    dw Spritemap_Fireflea_2                                              ;A38C39;
    dw $0001                                                             ;A38C3B;
    dw Spritemap_Fireflea_1                                              ;A38C3D;
    dw $0002                                                             ;A38C3F;
    dw Spritemap_Fireflea_0                                              ;A38C41;
    dw $0001                                                             ;A38C43;
    dw Spritemap_Fireflea_1                                              ;A38C45;
    dw $0002                                                             ;A38C47;
    dw Spritemap_Fireflea_2                                              ;A38C49;
    dw $0001                                                             ;A38C4B;
    dw Spritemap_Fireflea_1                                              ;A38C4D;
    dw $0002                                                             ;A38C4F;
    dw Spritemap_Fireflea_3                                              ;A38C51;
    dw $0001                                                             ;A38C53;
    dw Spritemap_Fireflea_4                                              ;A38C55;
    dw $0002                                                             ;A38C57;
    dw Spritemap_Fireflea_5                                              ;A38C59;
    dw $0001                                                             ;A38C5B;
    dw Spritemap_Fireflea_4                                              ;A38C5D;
    dw $0002                                                             ;A38C5F;
    dw Spritemap_Fireflea_6                                              ;A38C61;
    dw $0001                                                             ;A38C63;
    dw Spritemap_Fireflea_7                                              ;A38C65;
    dw $0002                                                             ;A38C67;
    dw Spritemap_Fireflea_8                                              ;A38C69;
    dw $0001                                                             ;A38C6B;
    dw Spritemap_Fireflea_7                                              ;A38C6D;
    dw $0002                                                             ;A38C6F;
    dw Spritemap_Fireflea_9                                              ;A38C71;
    dw $0001                                                             ;A38C73;
    dw Spritemap_Fireflea_A                                              ;A38C75;
    dw $0002                                                             ;A38C77;
    dw Spritemap_Fireflea_B                                              ;A38C79;
    dw $0001                                                             ;A38C7B;
    dw Spritemap_Fireflea_A                                              ;A38C7D;
    dw $0002                                                             ;A38C7F;
    dw Spritemap_Fireflea_C                                              ;A38C81;
    dw $0001                                                             ;A38C83;
    dw Spritemap_Fireflea_D                                              ;A38C85;
    dw $0002                                                             ;A38C87;
    dw Spritemap_Fireflea_E                                              ;A38C89;
    dw $0001                                                             ;A38C8B;
    dw Spritemap_Fireflea_D                                              ;A38C8D;
    dw $0002                                                             ;A38C8F;
    dw Spritemap_Fireflea_F                                              ;A38C91;
    dw $0001                                                             ;A38C93;
    dw Spritemap_Fireflea_10                                             ;A38C95;
    dw $0002                                                             ;A38C97;
    dw Spritemap_Fireflea_11                                             ;A38C99;
    dw $0001                                                             ;A38C9B;
    dw Spritemap_Fireflea_10                                             ;A38C9D;
    dw $0002                                                             ;A38C9F;
    dw Spritemap_Fireflea_12                                             ;A38CA1;
    dw $0001                                                             ;A38CA3;
    dw Spritemap_Fireflea_13                                             ;A38CA5;
    dw $0002                                                             ;A38CA7;
    dw Spritemap_Fireflea_14                                             ;A38CA9;
    dw $0001                                                             ;A38CAB;
    dw Spritemap_Fireflea_13                                             ;A38CAD;
    dw $0002                                                             ;A38CAF;
    dw Spritemap_Fireflea_F                                              ;A38CB1;
    dw $0001                                                             ;A38CB3;
    dw Spritemap_Fireflea_10                                             ;A38CB5;
    dw $0002                                                             ;A38CB7;
    dw Spritemap_Fireflea_11                                             ;A38CB9;
    dw $0001                                                             ;A38CBB;
    dw Spritemap_Fireflea_10                                             ;A38CBD;
    dw $0002                                                             ;A38CBF;
    dw Spritemap_Fireflea_C                                              ;A38CC1;
    dw $0001                                                             ;A38CC3;
    dw Spritemap_Fireflea_D                                              ;A38CC5;
    dw $0002                                                             ;A38CC7;
    dw Spritemap_Fireflea_E                                              ;A38CC9;
    dw $0001                                                             ;A38CCB;
    dw Spritemap_Fireflea_D                                              ;A38CCD;
    dw $0002                                                             ;A38CCF;
    dw Spritemap_Fireflea_9                                              ;A38CD1;
    dw $0001                                                             ;A38CD3;
    dw Spritemap_Fireflea_A                                              ;A38CD5;
    dw $0002                                                             ;A38CD7;
    dw Spritemap_Fireflea_B                                              ;A38CD9;
    dw $0001                                                             ;A38CDB;
    dw Spritemap_Fireflea_A                                              ;A38CDD;
    dw $0002                                                             ;A38CDF;
    dw Spritemap_Fireflea_6                                              ;A38CE1;
    dw $0001                                                             ;A38CE3;
    dw Spritemap_Fireflea_7                                              ;A38CE5;
    dw $0002                                                             ;A38CE7;
    dw Spritemap_Fireflea_8                                              ;A38CE9;
    dw $0001                                                             ;A38CEB;
    dw Spritemap_Fireflea_7                                              ;A38CED;
    dw $0002                                                             ;A38CEF;
    dw Spritemap_Fireflea_3                                              ;A38CF1;
    dw $0001                                                             ;A38CF3;
    dw Spritemap_Fireflea_4                                              ;A38CF5;
    dw $0002                                                             ;A38CF7;
    dw Spritemap_Fireflea_5                                              ;A38CF9;
    dw $0001                                                             ;A38CFB;
    dw Spritemap_Fireflea_4                                              ;A38CFD;
    dw Instruction_Common_GotoY                                          ;A38CFF;
    dw InstList_Fireflea                                                 ;A38D01;

UNUSED_Fireflea_Data_A38D03:
    dw $1000,$2000,$4000,$6000,$8000,$A000,$C000,$E000                   ;A38D03;

UNUSED_Fireflea_Data_A38D13:
    dw $0001,$2001,$4001,$6001,$8001                                     ;A38D13;

FirefleaMovementRadii:
    dw $0008,$0010,$0018,$0020,$0028,$0030,$0038,$0040                   ;A38D1D;

InitAI_Fireflea:
    LDX.W $0E54                                                          ;A38D2D;
    LDA.W #InstList_Fireflea                                             ;A38D30;
    STA.W EnemyData.pInstList,X                                          ;A38D33;
    LDA.W EnemyData.initParam0,X                                         ;A38D36;
    AND.W #$00FF                                                         ;A38D39;
    STA.B $12                                                            ;A38D3C;
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


SetFirefleaCenter:
    LDA.W EnemyData.xPosition,X                                          ;A38D5D;
    STA.W EnemyData.work4,X                                              ;A38D60;
    LDA.W EnemyData.yPosition,X                                          ;A38D63;
    STA.W EnemyData.work5,X                                              ;A38D66;
    RTS                                                                  ;A38D69;


SetInitialFirefleaAngle:
    LDA.W EnemyData.initParam0+1,X                                       ;A38D6A;
    AND.W #$00FF                                                         ;A38D6D;
    XBA                                                                  ;A38D70;
    STA.W EnemyData.work3,X                                              ;A38D71;
    RTS                                                                  ;A38D74;


SetFirefleaSpeed:
    LDA.W EnemyData.initParam1,X                                         ;A38D75;
    AND.W #$00FF                                                         ;A38D78;
    ASL A                                                                ;A38D7B;
    ASL A                                                                ;A38D7C;
    ASL A                                                                ;A38D7D;
    TAY                                                                  ;A38D7E;
    LDA.B $12                                                            ;A38D7F;
    AND.W #$0001                                                         ;A38D81;
    BNE +                                                                ;A38D84;
    INY                                                                  ;A38D86;
    INY                                                                  ;A38D87;
    INY                                                                  ;A38D88;
    INY                                                                  ;A38D89;

  + TYA                                                                  ;A38D8A;
    STA.L $7E7804,X                                                      ;A38D8B;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A38D8F;
    STA.W EnemyData.work1,X                                              ;A38D92;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A38D95;
    STA.W EnemyData.work0,X                                              ;A38D98;
    RTS                                                                  ;A38D9B;


SetFirefleaRadius:
    LDA.W EnemyData.initParam1+1,X                                       ;A38D9C;
    AND.W #$00FF                                                         ;A38D9F;
    ASL A                                                                ;A38DA2;
    TAY                                                                  ;A38DA3;
    LDA.W FirefleaMovementRadii,Y                                        ;A38DA4;
    AND.W #$00FF                                                         ;A38DA7;
    STA.W EnemyData.work2,X                                              ;A38DAA;
    RTS                                                                  ;A38DAD;


SetInitialCirclingFirefleaPosition:
    LDA.W EnemyData.work2,X                                              ;A38DAE;
    STA.W $0E32                                                          ;A38DB1;
    LDA.W EnemyData.work3,X                                              ;A38DB4;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A38DB7;
    CLC                                                                  ;A38DBB;
    ADC.W EnemyData.work4,X                                              ;A38DBC;
    STA.W EnemyData.xPosition,X                                          ;A38DBF;
    LDA.W EnemyData.work2,X                                              ;A38DC2;
    STA.W $0E32                                                          ;A38DC5;
    LDA.W EnemyData.work3,X                                              ;A38DC8;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A38DCB;
    CLC                                                                  ;A38DCF;
    ADC.W EnemyData.work5,X                                              ;A38DD0;
    STA.W EnemyData.yPosition,X                                          ;A38DD3;
    RTS                                                                  ;A38DD6;


SetFirefleaMinMaxYPositions:
    LDA.W EnemyData.yPosition,X                                          ;A38DD7;
    SEC                                                                  ;A38DDA;
    SBC.W EnemyData.work2,X                                              ;A38DDB;
    STA.L $7E7800,X                                                      ;A38DDE;
    LDA.W EnemyData.yPosition,X                                          ;A38DE2;
    CLC                                                                  ;A38DE5;
    ADC.W EnemyData.work2,X                                              ;A38DE6;
    STA.L $7E7802,X                                                      ;A38DE9;
    RTS                                                                  ;A38DED;


MainAI_Fireflea:
    LDX.W $0E54                                                          ;A38DEE;
    LDA.W EnemyData.initParam0,X                                         ;A38DF1;
    AND.W #$0002                                                         ;A38DF4;
    BEQ .verticalMovement                                                ;A38DF7;
    LDA.W EnemyData.work2,X                                              ;A38DF9;
    STA.W $0E32                                                          ;A38DFC;
    LDA.W EnemyData.work3,X                                              ;A38DFF;
    AND.W #$FF00                                                         ;A38E02;
    XBA                                                                  ;A38E05;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A38E06;
    CLC                                                                  ;A38E0A;
    ADC.W EnemyData.work4,X                                              ;A38E0B;
    STA.W EnemyData.xPosition,X                                          ;A38E0E;
    LDA.W EnemyData.work2,X                                              ;A38E11;
    STA.W $0E32                                                          ;A38E14;
    LDA.W EnemyData.work3,X                                              ;A38E17;
    AND.W #$FF00                                                         ;A38E1A;
    XBA                                                                  ;A38E1D;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A38E1E;
    CLC                                                                  ;A38E22;
    ADC.W EnemyData.work5,X                                              ;A38E23;
    STA.W EnemyData.yPosition,X                                          ;A38E26;
    LDA.W EnemyData.work3,X                                              ;A38E29;
    CLC                                                                  ;A38E2C;
    ADC.W EnemyData.work0+1,X                                            ;A38E2D;
    STA.W EnemyData.work3,X                                              ;A38E30;
    RTL                                                                  ;A38E33;


.verticalMovement:
    LDA.L $7E7804,X                                                      ;A38E34;
    TAY                                                                  ;A38E38;
    CLC                                                                  ;A38E39;
    LDA.W EnemyData.ySubPosition,X                                       ;A38E3A;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A38E3D;
    STA.W EnemyData.ySubPosition,X                                       ;A38E40;
    LDA.W EnemyData.yPosition,X                                          ;A38E43;
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A38E46;
    STA.W EnemyData.yPosition,X                                          ;A38E49;
    LDA.W EnemyData.yPosition,X                                          ;A38E4C;
    CMP.L $7E7800,X                                                      ;A38E4F;
    BMI +                                                                ;A38E53;
    LDA.W EnemyData.yPosition,X                                          ;A38E55;
    CMP.L $7E7802,X                                                      ;A38E58;
    BPL +                                                                ;A38E5C;
    RTL                                                                  ;A38E5E;


  + LDA.L $7E7804,X                                                      ;A38E5F;
    EOR.W #$0004                                                         ;A38E63;
    STA.L $7E7804,X                                                      ;A38E66;
    RTL                                                                  ;A38E6A;


EnemyTouch_Fireflea:
    JSL.L CommonA3_NormalEnemyTouchAI                                    ;A38E6B;
    JSL.L EnemyDeath                                                     ;A38E6F;
    LDA.W $177E                                                          ;A38E73;
    CLC                                                                  ;A38E76;
    ADC.W #$0002                                                         ;A38E77;
    CMP.W #$000E                                                         ;A38E7A;
    BPL .return                                                          ;A38E7D;
    STA.W $177E                                                          ;A38E7F;

.return:
    RTL                                                                  ;A38E82;


PowerBombReaction_Fireflea:
    JSL.L CommonA3_NormalEnemyPowerBombAI                                ;A38E83;
    BRA ShotReaction_Fireflea_Common                                     ;A38E87;


EnemyShot_Fireflea:
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A38E89; fallthrough to ShotReaction_Fireflea_Common

ShotReaction_Fireflea_Common:
    LDX.W $0E54                                                          ;A38E8D;
    LDA.W EnemyData.health,X                                             ;A38E90;
    BNE .return                                                          ;A38E93;
    LDA.W $177E                                                          ;A38E95;
    CLC                                                                  ;A38E98;
    ADC.W #$0002                                                         ;A38E99;
    CMP.W #$000E                                                         ;A38E9C;
    BPL .return                                                          ;A38E9F;
    STA.W $177E                                                          ;A38EA1;

.return:
    RTL                                                                  ;A38EA4;


Spritemap_Fireflea_0:
    dw $0003,$81F8                                                       ;A38EA5;
    db $F8                                                               ;A38EA9;
    dw $3100,$0001                                                       ;A38EAA;
    db $F6                                                               ;A38EAE;
    dw $3121,$01F7                                                       ;A38EAF;
    db $F6                                                               ;A38EB3;
    dw $3120                                                             ;A38EB4;

Spritemap_Fireflea_1:
    dw $0003,$81F8                                                       ;A38EB6;
    db $F8                                                               ;A38EBA;
    dw $3100,$0001                                                       ;A38EBB;
    db $F6                                                               ;A38EBF;
    dw $3123,$01F7                                                       ;A38EC0;
    db $F6                                                               ;A38EC4;
    dw $3122                                                             ;A38EC5;

Spritemap_Fireflea_2:
    dw $0003,$81F8                                                       ;A38EC7;
    db $F8                                                               ;A38ECB;
    dw $3100,$0001                                                       ;A38ECC;
    db $F6                                                               ;A38ED0;
    dw $3125,$01F7                                                       ;A38ED1;
    db $F6                                                               ;A38ED5;
    dw $3124                                                             ;A38ED6;

Spritemap_Fireflea_3:
    dw $0003,$81F8                                                       ;A38ED8;
    db $F8                                                               ;A38EDC;
    dw $3102,$0001                                                       ;A38EDD;
    db $F6                                                               ;A38EE1;
    dw $3121,$01F7                                                       ;A38EE2;
    db $F6                                                               ;A38EE6;
    dw $3120                                                             ;A38EE7;

Spritemap_Fireflea_4:
    dw $0003,$81F8                                                       ;A38EE9;
    db $F8                                                               ;A38EED;
    dw $3102,$0001                                                       ;A38EEE;
    db $F6                                                               ;A38EF2;
    dw $3123,$01F7                                                       ;A38EF3;
    db $F6                                                               ;A38EF7;
    dw $3122                                                             ;A38EF8;

Spritemap_Fireflea_5:
    dw $0003,$81F8                                                       ;A38EFA;
    db $F8                                                               ;A38EFE;
    dw $3102,$0001                                                       ;A38EFF;
    db $F6                                                               ;A38F03;
    dw $3125,$01F7                                                       ;A38F04;
    db $F6                                                               ;A38F08;
    dw $3124                                                             ;A38F09;

Spritemap_Fireflea_6:
    dw $0003,$81F8                                                       ;A38F0B;
    db $F8                                                               ;A38F0F;
    dw $3104,$0001                                                       ;A38F10;
    db $F6                                                               ;A38F14;
    dw $3127,$01F7                                                       ;A38F15;
    db $F6                                                               ;A38F19;
    dw $3126                                                             ;A38F1A;

Spritemap_Fireflea_7:
    dw $0003,$81F8                                                       ;A38F1C;
    db $F8                                                               ;A38F20;
    dw $3104,$0001                                                       ;A38F21;
    db $F6                                                               ;A38F25;
    dw $3129,$01F7                                                       ;A38F26;
    db $F6                                                               ;A38F2A;
    dw $3128                                                             ;A38F2B;

Spritemap_Fireflea_8:
    dw $0003,$81F8                                                       ;A38F2D;
    db $F8                                                               ;A38F31;
    dw $3104,$0001                                                       ;A38F32;
    db $F6                                                               ;A38F36;
    dw $312B,$01F7                                                       ;A38F37;
    db $F6                                                               ;A38F3B;
    dw $312A                                                             ;A38F3C;

Spritemap_Fireflea_9:
    dw $0003,$81F8                                                       ;A38F3E;
    db $F8                                                               ;A38F42;
    dw $3106,$0001                                                       ;A38F43;
    db $F6                                                               ;A38F47;
    dw $3127,$01F7                                                       ;A38F48;
    db $F6                                                               ;A38F4C;
    dw $3126                                                             ;A38F4D;

Spritemap_Fireflea_A:
    dw $0003,$81F8                                                       ;A38F4F;
    db $F8                                                               ;A38F53;
    dw $3106,$0001                                                       ;A38F54;
    db $F6                                                               ;A38F58;
    dw $3129,$01F7                                                       ;A38F59;
    db $F6                                                               ;A38F5D;
    dw $3128                                                             ;A38F5E;

Spritemap_Fireflea_B:
    dw $0003,$81F8                                                       ;A38F60;
    db $F8                                                               ;A38F64;
    dw $3106,$0001                                                       ;A38F65;
    db $F6                                                               ;A38F69;
    dw $312B,$01F7                                                       ;A38F6A;
    db $F6                                                               ;A38F6E;
    dw $312A                                                             ;A38F6F;

Spritemap_Fireflea_C:
    dw $0003,$81F8                                                       ;A38F71;
    db $F8                                                               ;A38F75;
    dw $3108,$0001                                                       ;A38F76;
    db $F6                                                               ;A38F7A;
    dw $3127,$01F7                                                       ;A38F7B;
    db $F6                                                               ;A38F7F;
    dw $3126                                                             ;A38F80;

Spritemap_Fireflea_D:
    dw $0003,$81F8                                                       ;A38F82;
    db $F8                                                               ;A38F86;
    dw $3108,$0001                                                       ;A38F87;
    db $F6                                                               ;A38F8B;
    dw $3129,$01F7                                                       ;A38F8C;
    db $F6                                                               ;A38F90;
    dw $3128                                                             ;A38F91;

Spritemap_Fireflea_E:
    dw $0003,$81F8                                                       ;A38F93;
    db $F8                                                               ;A38F97;
    dw $3108,$0001                                                       ;A38F98;
    db $F6                                                               ;A38F9C;
    dw $312B,$01F7                                                       ;A38F9D;
    db $F6                                                               ;A38FA1;
    dw $312A                                                             ;A38FA2;

Spritemap_Fireflea_F:
    dw $0003,$81F8                                                       ;A38FA4;
    db $F8                                                               ;A38FA8;
    dw $310A,$0001                                                       ;A38FA9;
    db $F6                                                               ;A38FAD;
    dw $312D,$01F7                                                       ;A38FAE;
    db $F6                                                               ;A38FB2;
    dw $312C                                                             ;A38FB3;

Spritemap_Fireflea_10:
    dw $0003,$81F8                                                       ;A38FB5;
    db $F8                                                               ;A38FB9;
    dw $310A,$0001                                                       ;A38FBA;
    db $F6                                                               ;A38FBE;
    dw $312F,$01F7                                                       ;A38FBF;
    db $F6                                                               ;A38FC3;
    dw $312E                                                             ;A38FC4;

Spritemap_Fireflea_11:
    dw $0003,$81F8                                                       ;A38FC6;
    db $F8                                                               ;A38FCA;
    dw $310A,$0001                                                       ;A38FCB;
    db $F6                                                               ;A38FCF;
    dw $311F,$01F7                                                       ;A38FD0;
    db $F6                                                               ;A38FD4;
    dw $311E                                                             ;A38FD5;

Spritemap_Fireflea_12:
    dw $0003,$81F8                                                       ;A38FD7;
    db $F8                                                               ;A38FDB;
    dw $310C,$0001                                                       ;A38FDC;
    db $F6                                                               ;A38FE0;
    dw $312D,$01F7                                                       ;A38FE1;
    db $F6                                                               ;A38FE5;
    dw $312C                                                             ;A38FE6;

Spritemap_Fireflea_13:
    dw $0003,$0001                                                       ;A38FE8;
    db $F6                                                               ;A38FEC;
    dw $312F,$01F7                                                       ;A38FED;
    db $F6                                                               ;A38FF1;
    dw $312E,$81F8                                                       ;A38FF2;
    db $F8                                                               ;A38FF6;
    dw $310C                                                             ;A38FF7;

Spritemap_Fireflea_14:
    dw $0003,$0001                                                       ;A38FF9;
    db $F6                                                               ;A38FFD;
    dw $311F,$01F7                                                       ;A38FFE;
    db $F6                                                               ;A39002;
    dw $311E,$81F8                                                       ;A39003;
    db $F8                                                               ;A39007;
    dw $310C                                                             ;A39008;

Palette_Skultera:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3900A;
    dw $2C63,$241F,$1C17,$142F,$0C47,$03FF,$0237,$00D1                   ;A3901A;

InstList_Skultera_SwimmingLeft_0:
    dw Instruction_Skultera_SetLayerTo2                                  ;A3902A;

InstList_Skultera_SwimmingLeft_1:
    dw $000E                                                             ;A3902C;
    dw Spritemap_Skultera_0                                              ;A3902E;
    dw $000E                                                             ;A39030;
    dw Spritemap_Skultera_1                                              ;A39032;
    dw $000E                                                             ;A39034;
    dw Spritemap_Skultera_2                                              ;A39036;
    dw Instruction_Common_GotoY                                          ;A39038;
    dw InstList_Skultera_SwimmingLeft_1                                  ;A3903A;

InstList_Skultera_TurningRight:
    dw $000D                                                             ;A3903C;
    dw Spritemap_Skultera_3                                              ;A3903E;
    dw $000A                                                             ;A39040;
    dw Spritemap_Skultera_4                                              ;A39042;
    dw $0008                                                             ;A39044;
    dw Spritemap_Skultera_5                                              ;A39046;
    dw $0006                                                             ;A39048;
    dw Spritemap_Skultera_6                                              ;A3904A;
    dw $0006                                                             ;A3904C;
    dw Spritemap_Skultera_7                                              ;A3904E;
    dw $0008                                                             ;A39050;
    dw Spritemap_Skultera_8                                              ;A39052;
    dw $000A                                                             ;A39054;
    dw Spritemap_Skultera_9                                              ;A39056;
    dw $000D                                                             ;A39058;
    dw Spritemap_Skultera_A                                              ;A3905A;
    dw Instruction_Skultera_SetTurnFinishedFlag                          ;A3905C;
    dw Instruction_Common_Sleep                                          ;A3905E;

InstList_Skultera_SwimmingRight_0:
    dw Instruction_Skultera_SetLayerTo6                                  ;A39060;

InstList_Skultera_SwimmingRight_1:
    dw $000E                                                             ;A39062;
    dw Spritemap_Skultera_B                                              ;A39064;
    dw $000E                                                             ;A39066;
    dw Spritemap_Skultera_C                                              ;A39068;
    dw $000E                                                             ;A3906A;
    dw Spritemap_Skultera_D                                              ;A3906C;
    dw Instruction_Common_GotoY                                          ;A3906E;
    dw InstList_Skultera_SwimmingRight_1                                 ;A39070;

InstList_Skultera_TurningLeft:
    dw $000D                                                             ;A39072;
    dw Spritemap_Skultera_E                                              ;A39074;
    dw $000A                                                             ;A39076;
    dw Spritemap_Skultera_F                                              ;A39078;
    dw $0008                                                             ;A3907A;
    dw Spritemap_Skultera_10                                             ;A3907C;
    dw $0006                                                             ;A3907E;
    dw Spritemap_Skultera_11                                             ;A39080;
    dw $0006                                                             ;A39082;
    dw Spritemap_Skultera_12                                             ;A39084;
    dw $0008                                                             ;A39086;
    dw Spritemap_Skultera_13                                             ;A39088;
    dw $000A                                                             ;A3908A;
    dw Spritemap_Skultera_14                                             ;A3908C;
    dw $000D                                                             ;A3908E;
    dw Spritemap_Skultera_15                                             ;A39090;
    dw Instruction_Skultera_SetTurnFinishedFlag                          ;A39092;
    dw Instruction_Common_Sleep                                          ;A39094;

Instruction_Skultera_SetLayerTo6:
    LDX.W $0E54                                                          ;A39096;
    LDA.W #$0006                                                         ;A39099;
    STA.W EnemyData.layer,X                                              ;A3909C;
    RTL                                                                  ;A3909F;


Instruction_Skultera_SetLayerTo2:
    LDX.W $0E54                                                          ;A390A0;
    LDA.W #$0002                                                         ;A390A3;
    STA.W EnemyData.layer,X                                              ;A390A6;
    RTL                                                                  ;A390A9;


Instruction_Skultera_SetTurnFinishedFlag:
    LDX.W $0E54                                                          ;A390AA;
    LDA.W #$0001                                                         ;A390AD;
    STA.L $7E7802,X                                                      ;A390B0;
    RTL                                                                  ;A390B4;


InitAI_Skultera:
    LDX.W $0E54                                                          ;A390B5;
    LDA.W #InstList_Skultera_SwimmingLeft_0                              ;A390B8;
    STA.W EnemyData.pInstList,X                                          ;A390BB;
    LDA.W #Function_Skultera_SwimmingLeft                                ;A390BE;
    STA.W EnemyData.work0,X                                              ;A390C1;
    LDA.W EnemyData.initParam0+1,X                                       ;A390C4;
    AND.W #$00FF                                                         ;A390C7;
    BNE .keepLeft                                                        ;A390CA;
    LDA.W #InstList_Skultera_SwimmingRight_0                             ;A390CC;
    STA.W EnemyData.pInstList,X                                          ;A390CF;
    LDA.W #Function_Skultera_SwimmingRight                               ;A390D2;
    STA.W EnemyData.work0,X                                              ;A390D5;

.keepLeft:
    LDA.W EnemyData.initParam0,X                                         ;A390D8;
    AND.W #$00FF                                                         ;A390DB;
    ASL A                                                                ;A390DE;
    ASL A                                                                ;A390DF;
    ASL A                                                                ;A390E0;
    TAY                                                                  ;A390E1;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A390E2;
    STA.W EnemyData.work2,X                                              ;A390E5;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A390E8;
    STA.W EnemyData.work1,X                                              ;A390EB;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;A390EE;
    STA.W EnemyData.work4,X                                              ;A390F1;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;A390F4;
    STA.W EnemyData.work3,X                                              ;A390F7;
    LDA.W EnemyData.initParam1,X                                         ;A390FA;
    AND.W #$00FF                                                         ;A390FD;
    STA.L $7E7800,X                                                      ;A39100;
    LDA.W EnemyData.initParam1+1,X                                       ;A39104;
    AND.W #$00FF                                                         ;A39107;
    STA.L $7E7804,X                                                      ;A3910A;
    LDA.W #$0000                                                         ;A3910E;
    STA.W EnemyData.work5,X                                              ;A39111;
    STA.L $7E7802,X                                                      ;A39114;
    LDA.L $7E7800,X                                                      ;A39118;
    STA.W $0E32                                                          ;A3911C;
    LDA.W EnemyData.work5,X                                              ;A3911F;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A39122;
    STA.L $7E7806,X                                                      ;A39126;
    RTL                                                                  ;A3912A;


MainAI_Skultera:
    LDX.W $0E54                                                          ;A3912B;
    JSR.W ($0FA8,X)                                                      ;A3912E;
    RTL                                                                  ;A39131;


Function_Skultera_SwimmingLeft:
    LDX.W $0E54                                                          ;A39132;
    LDA.W EnemyData.work3,X                                              ;A39135;
    STA.B $12                                                            ;A39138;
    LDA.W EnemyData.work4,X                                              ;A3913A;
    STA.B $14                                                            ;A3913D;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3913F;
    BCC .noWallCollision                                                 ;A39143;
    LDA.W #Function_Skultera_TurningRight                                ;A39145;
    STA.W EnemyData.work0,X                                              ;A39148;
    LDA.W #$0001                                                         ;A3914B;
    STA.W EnemyData.instTimer,X                                          ;A3914E;
    STZ.W EnemyData.loopCounter,X                                        ;A39151;
    LDA.W #InstList_Skultera_TurningRight                                ;A39154;
    STA.W EnemyData.pInstList,X                                          ;A39157;
    BRA .merge                                                           ;A3915A;


.noWallCollision:
    LDA.L $7E7800,X                                                      ;A3915C;
    STA.W $0E32                                                          ;A39160;
    LDA.W EnemyData.work5,X                                              ;A39163;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A39166;
    STA.L $7E7808,X                                                      ;A3916A;
    SEC                                                                  ;A3916E;
    SBC.L $7E7806,X                                                      ;A3916F;
    STA.B $14                                                            ;A39173;
    STZ.B $12                                                            ;A39175;
    JSL.L MoveEnemyDownBy_14_12                                          ;A39177;
    BCC .noBlockCollision                                                ;A3917B;
    LDA.W #Function_Skultera_TurningRight                                ;A3917D;
    STA.W EnemyData.work0,X                                              ;A39180;
    LDA.W #$0001                                                         ;A39183;
    STA.W EnemyData.instTimer,X                                          ;A39186;
    STZ.W EnemyData.loopCounter,X                                        ;A39189;
    LDA.W #InstList_Skultera_TurningRight                                ;A3918C;
    STA.W EnemyData.pInstList,X                                          ;A3918F;
    BRA .merge                                                           ;A39192;


.noBlockCollision:
    LDA.W EnemyData.work5,X                                              ;A39194;
    CLC                                                                  ;A39197;
    ADC.L $7E7804,X                                                      ;A39198;
    AND.W #$00FF                                                         ;A3919C;
    STA.W EnemyData.work5,X                                              ;A3919F;

.merge:
    LDA.L $7E7808,X                                                      ;A391A2;
    STA.L $7E7806,X                                                      ;A391A6;
    RTS                                                                  ;A391AA;


Function_Skultera_SwimmingRight:
    LDX.W $0E54                                                          ;A391AB;
    LDA.W EnemyData.work1,X                                              ;A391AE;
    STA.B $12                                                            ;A391B1;
    LDA.W EnemyData.work2,X                                              ;A391B3;
    STA.B $14                                                            ;A391B6;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A391B8;
    BCC .noWallCollision                                                 ;A391BC;
    LDA.W #Function_Skultera_TurningLeft                                 ;A391BE;
    STA.W EnemyData.work0,X                                              ;A391C1;
    LDA.W #$0001                                                         ;A391C4;
    STA.W EnemyData.instTimer,X                                          ;A391C7;
    STZ.W EnemyData.loopCounter,X                                        ;A391CA;
    LDA.W #InstList_Skultera_TurningLeft                                 ;A391CD;
    STA.W EnemyData.pInstList,X                                          ;A391D0;
    BRA .merge                                                           ;A391D3;


.noWallCollision:
    LDA.L $7E7800,X                                                      ;A391D5;
    STA.W $0E32                                                          ;A391D9;
    LDA.W EnemyData.work5,X                                              ;A391DC;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A391DF;
    STA.L $7E7808,X                                                      ;A391E3;
    SEC                                                                  ;A391E7;
    SBC.L $7E7806,X                                                      ;A391E8;
    STA.B $14                                                            ;A391EC;
    STZ.B $12                                                            ;A391EE;
    JSL.L MoveEnemyDownBy_14_12                                          ;A391F0;
    BCC .noBlockCollision                                                ;A391F4;
    LDA.W #Function_Skultera_TurningLeft                                 ;A391F6;
    STA.W EnemyData.work0,X                                              ;A391F9;
    LDA.W #$0001                                                         ;A391FC;
    STA.W EnemyData.instTimer,X                                          ;A391FF;
    STZ.W EnemyData.loopCounter,X                                        ;A39202;
    LDA.W #InstList_Skultera_TurningLeft                                 ;A39205;
    STA.W EnemyData.pInstList,X                                          ;A39208;
    BRA .merge                                                           ;A3920B;


.noBlockCollision:
    LDA.W EnemyData.work5,X                                              ;A3920D;
    CLC                                                                  ;A39210;
    ADC.L $7E7804,X                                                      ;A39211;
    AND.W #$00FF                                                         ;A39215;
    STA.W EnemyData.work5,X                                              ;A39218;

.merge:
    LDA.L $7E7808,X                                                      ;A3921B;
    STA.L $7E7806,X                                                      ;A3921F;
    RTS                                                                  ;A39223;


Function_Skultera_TurningRight:
    LDX.W $0E54                                                          ;A39224;
    LDA.L $7E7802,X                                                      ;A39227;
    BEQ .return                                                          ;A3922B;
    LDA.W #$0000                                                         ;A3922D;
    STA.L $7E7802,X                                                      ;A39230;
    LDA.W #Function_Skultera_SwimmingRight                               ;A39234;
    STA.W EnemyData.work0,X                                              ;A39237;
    LDA.L $7E7804,X                                                      ;A3923A;
    EOR.W #$FFFF                                                         ;A3923E;
    INC A                                                                ;A39241;
    STA.L $7E7804,X                                                      ;A39242;
    LDA.W #$0001                                                         ;A39246;
    STA.W EnemyData.instTimer,X                                          ;A39249;
    STZ.W EnemyData.loopCounter,X                                        ;A3924C;
    LDA.W #InstList_Skultera_SwimmingRight_0                             ;A3924F;
    STA.W EnemyData.pInstList,X                                          ;A39252;

.return:
    RTS                                                                  ;A39255;


Function_Skultera_TurningLeft:
    LDX.W $0E54                                                          ;A39256;
    LDA.L $7E7802,X                                                      ;A39259;
    BEQ .return                                                          ;A3925D;
    LDA.W #$0000                                                         ;A3925F;
    STA.L $7E7802,X                                                      ;A39262;
    LDA.W #Function_Skultera_SwimmingLeft                                ;A39266;
    STA.W EnemyData.work0,X                                              ;A39269;
    LDA.L $7E7804,X                                                      ;A3926C;
    EOR.W #$FFFF                                                         ;A39270;
    INC A                                                                ;A39273;
    STA.L $7E7804,X                                                      ;A39274;
    LDA.W #$0001                                                         ;A39278;
    STA.W EnemyData.instTimer,X                                          ;A3927B;
    STZ.W EnemyData.loopCounter,X                                        ;A3927E;
    LDA.W #InstList_Skultera_SwimmingLeft_0                              ;A39281;
    STA.W EnemyData.pInstList,X                                          ;A39284;

.return:
    RTS                                                                  ;A39287;


RTL_A39288:
    RTL                                                                  ;A39288;


RTL_A39289:
    RTL                                                                  ;A39289;


Spritemap_Skultera_0:
    dw $0005,$C3F2                                                       ;A3928A;
    db $00                                                               ;A3928E;
    dw $2104,$C3F2                                                       ;A3928F;
    db $F0                                                               ;A39293;
    dw $2100,$01FE                                                       ;A39294;
    db $FD                                                               ;A39298;
    dw $2120,$0003                                                       ;A39299;
    db $FE                                                               ;A3929D;
    dw $2121,$0008                                                       ;A3929E;
    db $FE                                                               ;A392A2;
    dw $2123                                                             ;A392A3;

Spritemap_Skultera_1:
    dw $0005,$C3F2                                                       ;A392A5;
    db $00                                                               ;A392A9;
    dw $2102,$C3F2                                                       ;A392AA;
    db $F0                                                               ;A392AE;
    dw $2100,$01FE                                                       ;A392AF;
    db $FE                                                               ;A392B3;
    dw $2121,$0003                                                       ;A392B4;
    db $00                                                               ;A392B8;
    dw $2122,$0008                                                       ;A392B9;
    db $FE                                                               ;A392BD;
    dw $2124                                                             ;A392BE;

Spritemap_Skultera_2:
    dw $0005,$C3F2                                                       ;A392C0;
    db $00                                                               ;A392C4;
    dw $2102,$C3F2                                                       ;A392C5;
    db $F0                                                               ;A392C9;
    dw $2100,$01FE                                                       ;A392CA;
    db $00                                                               ;A392CE;
    dw $2122,$0003                                                       ;A392CF;
    db $FD                                                               ;A392D3;
    dw $2120,$0008                                                       ;A392D4;
    db $FE                                                               ;A392D8;
    dw $2125                                                             ;A392D9;

Spritemap_Skultera_3:
    dw $0005,$0008                                                       ;A392DB;
    db $FE                                                               ;A392DF;
    dw $2123,$0003                                                       ;A392E0;
    db $FE                                                               ;A392E4;
    dw $2121,$01FE                                                       ;A392E5;
    db $FD                                                               ;A392E9;
    dw $2120,$C3F2                                                       ;A392EA;
    db $00                                                               ;A392EE;
    dw $2102,$C3F2                                                       ;A392EF;
    db $F0                                                               ;A392F3;
    dw $2100                                                             ;A392F4;

Spritemap_Skultera_4:
    dw $0005,$C3F2                                                       ;A392F6;
    db $00                                                               ;A392FA;
    dw $2108,$C3F2                                                       ;A392FB;
    db $F0                                                               ;A392FF;
    dw $2106,$01FC                                                       ;A39300;
    db $FE                                                               ;A39304;
    dw $2121,$0001                                                       ;A39305;
    db $00                                                               ;A39309;
    dw $2122,$0006                                                       ;A3930A;
    db $FE                                                               ;A3930E;
    dw $2124                                                             ;A3930F;

Spritemap_Skultera_5:
    dw $0004,$C3F2                                                       ;A39311;
    db $00                                                               ;A39315;
    dw $210C,$C3F2                                                       ;A39316;
    db $F0                                                               ;A3931A;
    dw $210A,$01FE                                                       ;A3931B;
    db $FD                                                               ;A3931F;
    dw $2120,$0003                                                       ;A39320;
    db $FE                                                               ;A39324;
    dw $2125                                                             ;A39325;

Spritemap_Skultera_6:
    dw $0004,$C3F0                                                       ;A39327;
    db $00                                                               ;A3932B;
    dw $6108,$C3F0                                                       ;A3932C;
    db $F0                                                               ;A39330;
    dw $6106,$01EE                                                       ;A39331;
    db $FD                                                               ;A39335;
    dw $6120,$01FD                                                       ;A39336;
    db $FE                                                               ;A3933A;
    dw $2123                                                             ;A3933B;

Spritemap_Skultera_7:
    dw $0003,$C3F2                                                       ;A3933D;
    db $F0                                                               ;A39341;
    dw $6100,$C3F2                                                       ;A39342;
    db $00                                                               ;A39346;
    dw $6102,$01EF                                                       ;A39347;
    db $FD                                                               ;A3934B;
    dw $6121                                                             ;A3934C;

Spritemap_Skultera_8:
    dw $0004,$C3F5                                                       ;A3934E;
    db $00                                                               ;A39352;
    dw $6104,$C3F5                                                       ;A39353;
    db $F0                                                               ;A39357;
    dw $6100,$01F1                                                       ;A39358;
    db $00                                                               ;A3935C;
    dw $6122,$01EF                                                       ;A3935D;
    db $FD                                                               ;A39361;
    dw $6120                                                             ;A39362;

Spritemap_Skultera_9:
    dw $0005,$C3FB                                                       ;A39364;
    db $00                                                               ;A39368;
    dw $6102,$C3FB                                                       ;A39369;
    db $F0                                                               ;A3936D;
    dw $6100,$01F7                                                       ;A3936E;
    db $FD                                                               ;A39372;
    dw $6120,$01F2                                                       ;A39373;
    db $00                                                               ;A39377;
    dw $6122,$01F0                                                       ;A39378;
    db $FE                                                               ;A3937C;
    dw $6124                                                             ;A3937D;

Spritemap_Skultera_A:
    dw $0005,$C3FF                                                       ;A3937F;
    db $00                                                               ;A39383;
    dw $6102,$C3FF                                                       ;A39384;
    db $F0                                                               ;A39388;
    dw $6100,$01FB                                                       ;A39389;
    db $00                                                               ;A3938D;
    dw $6122,$01F6                                                       ;A3938E;
    db $FD                                                               ;A39392;
    dw $6120,$01F1                                                       ;A39393;
    db $FE                                                               ;A39397;
    dw $6125                                                             ;A39398;

Spritemap_Skultera_B:
    dw $0005,$C3FE                                                       ;A3939A;
    db $F0                                                               ;A3939E;
    dw $6100,$C3FE                                                       ;A3939F;
    db $00                                                               ;A393A3;
    dw $6104,$01FA                                                       ;A393A4;
    db $FD                                                               ;A393A8;
    dw $6120,$01F5                                                       ;A393A9;
    db $FE                                                               ;A393AD;
    dw $6121,$01F0                                                       ;A393AE;
    db $FE                                                               ;A393B2;
    dw $6123                                                             ;A393B3;

Spritemap_Skultera_C:
    dw $0005,$C3FE                                                       ;A393B5;
    db $00                                                               ;A393B9;
    dw $6102,$C3FE                                                       ;A393BA;
    db $F0                                                               ;A393BE;
    dw $6100,$01FA                                                       ;A393BF;
    db $FE                                                               ;A393C3;
    dw $6121,$01F5                                                       ;A393C4;
    db $00                                                               ;A393C8;
    dw $6122,$01F0                                                       ;A393C9;
    db $FE                                                               ;A393CD;
    dw $6124                                                             ;A393CE;

Spritemap_Skultera_D:
    dw $0005,$C3FE                                                       ;A393D0;
    db $00                                                               ;A393D4;
    dw $6102,$C3FE                                                       ;A393D5;
    db $F0                                                               ;A393D9;
    dw $6100,$01FA                                                       ;A393DA;
    db $00                                                               ;A393DE;
    dw $6122,$01F5                                                       ;A393DF;
    db $FD                                                               ;A393E3;
    dw $6120,$01F0                                                       ;A393E4;
    db $FE                                                               ;A393E8;
    dw $6125                                                             ;A393E9;

Spritemap_Skultera_E:
    dw $0005,$01F0                                                       ;A393EB;
    db $FE                                                               ;A393EF;
    dw $6123,$01F5                                                       ;A393F0;
    db $FE                                                               ;A393F4;
    dw $6121,$01FA                                                       ;A393F5;
    db $FD                                                               ;A393F9;
    dw $6120,$C3FE                                                       ;A393FA;
    db $00                                                               ;A393FE;
    dw $6102,$C3FE                                                       ;A393FF;
    db $F0                                                               ;A39403;
    dw $6100                                                             ;A39404;

Spritemap_Skultera_F:
    dw $0005,$C3FE                                                       ;A39406;
    db $00                                                               ;A3940A;
    dw $6108,$C3FE                                                       ;A3940B;
    db $F0                                                               ;A3940F;
    dw $6106,$01FC                                                       ;A39410;
    db $FE                                                               ;A39414;
    dw $6121,$01F7                                                       ;A39415;
    db $00                                                               ;A39419;
    dw $6122,$01F2                                                       ;A3941A;
    db $FE                                                               ;A3941E;
    dw $6124                                                             ;A3941F;

Spritemap_Skultera_10:
    dw $0004,$C3FE                                                       ;A39421;
    db $00                                                               ;A39425;
    dw $610C,$C3FE                                                       ;A39426;
    db $F0                                                               ;A3942A;
    dw $610A,$01FA                                                       ;A3942B;
    db $FD                                                               ;A3942F;
    dw $6120,$01F5                                                       ;A39430;
    db $FE                                                               ;A39434;
    dw $6125                                                             ;A39435;

Spritemap_Skultera_11:
    dw $0004,$C200                                                       ;A39437;
    db $00                                                               ;A3943B;
    dw $2108,$C200                                                       ;A3943C;
    db $F0                                                               ;A39440;
    dw $2106,$000A                                                       ;A39441;
    db $FD                                                               ;A39445;
    dw $2120,$01FB                                                       ;A39446;
    db $FE                                                               ;A3944A;
    dw $6123                                                             ;A3944B;

Spritemap_Skultera_12:
    dw $0003,$C3FE                                                       ;A3944D;
    db $F0                                                               ;A39451;
    dw $2100,$C3FE                                                       ;A39452;
    db $00                                                               ;A39456;
    dw $2102,$0009                                                       ;A39457;
    db $FD                                                               ;A3945B;
    dw $2121                                                             ;A3945C;

Spritemap_Skultera_13:
    dw $0004,$C3FB                                                       ;A3945E;
    db $00                                                               ;A39462;
    dw $2104,$C3FB                                                       ;A39463;
    db $F0                                                               ;A39467;
    dw $2100,$0007                                                       ;A39468;
    db $00                                                               ;A3946C;
    dw $2122,$0009                                                       ;A3946D;
    db $FD                                                               ;A39471;
    dw $2120                                                             ;A39472;

Spritemap_Skultera_14:
    dw $0005,$C3F5                                                       ;A39474;
    db $00                                                               ;A39478;
    dw $2102,$C3F5                                                       ;A39479;
    db $F0                                                               ;A3947D;
    dw $2100,$0001                                                       ;A3947E;
    db $FD                                                               ;A39482;
    dw $2120,$0006                                                       ;A39483;
    db $00                                                               ;A39487;
    dw $2122,$0008                                                       ;A39488;
    db $FE                                                               ;A3948C;
    dw $2124                                                             ;A3948D;

Spritemap_Skultera_15:
    dw $0005,$C3F1                                                       ;A3948F;
    db $00                                                               ;A39493;
    dw $2102,$C3F1                                                       ;A39494;
    db $F0                                                               ;A39498;
    dw $2100,$01FD                                                       ;A39499;
    db $00                                                               ;A3949D;
    dw $2122,$0002                                                       ;A3949E;
    db $FD                                                               ;A394A2;
    dw $2120,$0007                                                       ;A394A3;
    db $FE                                                               ;A394A7;
    dw $2125                                                             ;A394A8;

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

InstList_Elevator:
    dw $0002                                                             ;A394D6;
    dw Spritemap_Elevator_0                                              ;A394D8;
    dw $0002                                                             ;A394DA;
    dw Spritemap_Elevator_1                                              ;A394DC;
    dw Instruction_Common_GotoY                                          ;A394DE;
    dw InstList_Elevator                                                 ;A394E0;

ElevatorControllerInputs:
    dw $0400,$0800                                                       ;A394E2;

InitAI_Elevator:
    LDX.W $0E54                                                          ;A394E6;
    LDA.W #Spritemap_CommonA3_Nothing                                    ;A394E9;
    STA.W EnemyData.pSpritemap,X                                         ;A394EC;
    LDA.W #$0001                                                         ;A394EF;
    STA.W EnemyData.instTimer,X                                          ;A394F2;
    STZ.W EnemyData.loopCounter,X                                        ;A394F5;
    LDA.W #InstList_Elevator                                             ;A394F8;
    STA.W EnemyData.pInstList,X                                          ;A394FB;
    ASL.W EnemyData.initParam0,X                                         ;A394FE;
    LDA.W EnemyData.yPosition,X                                          ;A39501;
    STA.W EnemyData.work0,X                                              ;A39504;
    LDA.W $0E18                                                          ;A39507;
    CMP.W #$0002                                                         ;A3950A;
    BEQ .doorTransition                                                  ;A3950D;
    STZ.W $0E16                                                          ;A3950F;
    STZ.W $0E18                                                          ;A39512;

.doorTransition:
    LDA.W $0E16                                                          ;A39515;
    ORA.W $0E18                                                          ;A39518;
    BEQ .return                                                          ;A3951B;
    LDX.W $0E54                                                          ;A3951D;
    LDA.W EnemyData.initParam1,X                                         ;A39520;
    STA.W EnemyData.yPosition,X                                          ;A39523;
    JSR.W PlaceSamusOnElevator                                           ;A39526;

.return:
    RTL                                                                  ;A39529;


MainAI_GrappleAI_FrozenAI_Elevator:
    LDA.W $0795                                                          ;A3952A;
    BNE .return                                                          ;A3952D;
    LDA.W $0E16                                                          ;A3952F;
    ORA.W $0E18                                                          ;A39532;
    BEQ .return                                                          ;A39535;
    LDA.W $0E18                                                          ;A39537;
    ASL A                                                                ;A3953A;
    TAX                                                                  ;A3953B;
    JSR.W (.pointers,X)                                                  ;A3953C;

.return:
    RTL                                                                  ;A3953F;


.pointers:
    dw ElevatorAI_0_LeavingRoom                                          ;A39540;
    dw ElevatorAI_1_LeavingRoom                                          ;A39542;
    dw ElevatorAI_2_DoorTransition                                       ;A39544;
    dw ElevatorAI_3_EnteringRoom                                         ;A39546;

ElevatorAI_0_LeavingRoom:
    LDX.W $0E54                                                          ;A39548;
    LDY.W EnemyData.initParam0,X                                         ;A3954B;
    LDA.B $8F                                                            ;A3954E;
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
    INC.W $0E18                                                          ;A39571;
    RTS                                                                  ;A39574;


.notRiding:
    STZ.W $0E16                                                          ;A39575;
    RTS                                                                  ;A39578;


ElevatorAI_1_LeavingRoom:
    LDX.W $0E54                                                          ;A39579;
    LDA.W EnemyData.initParam0,X                                         ;A3957C;
    BNE .up                                                              ;A3957F;
    LDA.W #$0000                                                         ;A39581;
    STA.W $0799                                                          ;A39584;
    LDA.W EnemyData.ySubPosition,X                                       ;A39587;
    CLC                                                                  ;A3958A;
    ADC.W #$8000                                                         ;A3958B;
    STA.W EnemyData.ySubPosition,X                                       ;A3958E;
    LDA.W EnemyData.yPosition,X                                          ;A39591;
    ADC.W #$0001                                                         ;A39594;
    STA.W EnemyData.yPosition,X                                          ;A39597;
    BRA +                                                                ;A3959A;


.up:
    LDA.W #$8000                                                         ;A3959C;
    STA.W $0799                                                          ;A3959F;
    LDA.W EnemyData.ySubPosition,X                                       ;A395A2;
    SEC                                                                  ;A395A5;
    SBC.W #$8000                                                         ;A395A6;
    STA.W EnemyData.ySubPosition,X                                       ;A395A9;
    LDA.W EnemyData.yPosition,X                                          ;A395AC;
    SBC.W #$0001                                                         ;A395AF;
    STA.W EnemyData.yPosition,X                                          ;A395B2;

  + JSR.W PlaceSamusOnElevator                                           ;A395B5;
    RTS                                                                  ;A395B8;


ElevatorAI_2_DoorTransition:
    INC.W $0E18                                                          ;A395B9; fallthrough to ElevatorAI_3_EnteringRoom

ElevatorAI_3_EnteringRoom:
    LDX.W $0E54                                                          ;A395BC;
    LDA.W EnemyData.initParam0,X                                         ;A395BF;
    BEQ .down                                                            ;A395C2;
    LDA.W EnemyData.ySubPosition,X                                       ;A395C4;
    CLC                                                                  ;A395C7;
    ADC.W #$8000                                                         ;A395C8;
    STA.W EnemyData.ySubPosition,X                                       ;A395CB;
    LDA.W EnemyData.yPosition,X                                          ;A395CE;
    ADC.W #$0001                                                         ;A395D1;
    STA.W EnemyData.yPosition,X                                          ;A395D4;
    CMP.W EnemyData.work0,X                                              ;A395D7;
    BCS .reachedTarget                                                   ;A395DA;
    BRA PlaceSamusOnElevator                                             ;A395DC;


.down:
    LDA.W EnemyData.ySubPosition,X                                       ;A395DE;
    SEC                                                                  ;A395E1;
    SBC.W #$8000                                                         ;A395E2;
    STA.W EnemyData.ySubPosition,X                                       ;A395E5;
    LDA.W EnemyData.yPosition,X                                          ;A395E8;
    SBC.W #$0001                                                         ;A395EB;
    STA.W EnemyData.yPosition,X                                          ;A395EE;
    CMP.W EnemyData.work0,X                                              ;A395F1;
    BCC .reachedTarget                                                   ;A395F4;
    BRA PlaceSamusOnElevator                                             ;A395F6;


.reachedTarget:
    STZ.W $0E18                                                          ;A395F8;
    STZ.W $0E16                                                          ;A395FB;
    LDA.W #$0025                                                         ;A395FE;
    JSL.L QueueSound_Lib3_Max6                                           ;A39601;
    LDA.W EnemyData.work0,X                                              ;A39605;
    STA.W EnemyData.yPosition,X                                          ;A39608;
    LDA.W #$000B                                                         ;A3960B;
    JSL.L Run_Samus_Command                                              ;A3960E; fallthrough to PlaceSamusOnElevator

PlaceSamusOnElevator:
    LDX.W $0E54                                                          ;A39612;
    LDA.W EnemyData.yPosition,X                                          ;A39615;
    SEC                                                                  ;A39618;
    SBC.W #$001A                                                         ;A39619;
    STA.W $0AFA                                                          ;A3961C;
    STZ.W $0AFC                                                          ;A3961F;
    LDA.W EnemyData.xPosition,X                                          ;A39622;
    STA.W $0AF6                                                          ;A39625;
    STZ.W $0B2E                                                          ;A39628;
    STZ.W $0B2C                                                          ;A3962B;
    RTS                                                                  ;A3962E;


Spritemap_Elevator_0:
    dw $0004,$01F2                                                       ;A3962F;
    db $FC                                                               ;A39633;
    dw $6A6C,$0006                                                       ;A39634;
    db $FC                                                               ;A39638;
    dw $6A6C,$0000                                                       ;A39639;
    db $FC                                                               ;A3963D;
    dw $6A6C,$01F8                                                       ;A3963E;
    db $FC                                                               ;A39642;
    dw $2A6C                                                             ;A39643;

Spritemap_Elevator_1:
    dw $0004,$0000                                                       ;A39645;
    db $FC                                                               ;A39649;
    dw $6A6E,$0008                                                       ;A3964A;
    db $FC                                                               ;A3964E;
    dw $6A6D,$01F8                                                       ;A3964F;
    db $FC                                                               ;A39653;
    dw $2A6E,$01F0                                                       ;A39654;
    db $FC                                                               ;A39658;
    dw $2A6D                                                             ;A39659;

Palette_Sciser:
    dw $3800,$3EDF,$0018,$000F,$0005,$01DD,$0118,$0093                   ;A3965B;
    dw $002F,$7FE0,$7DA0,$48E0,$30A0,$3BE0,$2680,$1580                   ;A3966B;

InstList_Sciser_UpsideRight_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3967B;
    dw Function_Crawlers_CrawlingVertically                              ;A3967D;

InstList_Sciser_UpsideRight_1:
    dw $0008                                                             ;A3967F;
    dw Spritemap_Sciser_UpsideRight_0                                    ;A39681;
    dw $0008                                                             ;A39683;
    dw Spritemap_Sciser_UpsideRight_1                                    ;A39685;
    dw $0008                                                             ;A39687;
    dw Spritemap_Sciser_UpsideRight_2                                    ;A39689;
    dw $0008                                                             ;A3968B;
    dw Spritemap_Sciser_UpsideRight_1                                    ;A3968D;
    dw Instruction_Common_GotoY                                          ;A3968F;
    dw InstList_Sciser_UpsideRight_1                                     ;A39691;

InstList_Sciser_UpsideLeft_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A39693;
    dw Function_Crawlers_CrawlingVertically                              ;A39695;

InstList_Sciser_UpsideLeft_1:
    dw $0008                                                             ;A39697;
    dw Spritemap_Sciser_UpsideLeft_0                                     ;A39699;
    dw $0008                                                             ;A3969B;
    dw Spritemap_Sciser_UpsideLeft_1                                     ;A3969D;
    dw $0008                                                             ;A3969F;
    dw Spritemap_Sciser_UpsideLeft_2                                     ;A396A1;
    dw $0008                                                             ;A396A3;
    dw Spritemap_Sciser_UpsideLeft_1                                     ;A396A5;
    dw Instruction_Common_GotoY                                          ;A396A7;
    dw InstList_Sciser_UpsideLeft_1                                      ;A396A9;

InstList_Sciser_UpsideDown_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A396AB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A396AD;

InstList_Sciser_UpsideDown_1:
    dw $0008                                                             ;A396AF;
    dw Spritemap_Sciser_UpsideDown_0                                     ;A396B1;
    dw $0008                                                             ;A396B3;
    dw Spritemap_Sciser_UpsideDown_1                                     ;A396B5;
    dw $0008                                                             ;A396B7;
    dw Spritemap_Sciser_UpsideDown_2                                     ;A396B9;
    dw $0008                                                             ;A396BB;
    dw Spritemap_Sciser_UpsideDown_1                                     ;A396BD;
    dw Instruction_Common_GotoY                                          ;A396BF;
    dw InstList_Sciser_UpsideDown_1                                      ;A396C1;

InstList_Sciser_UpsideUp_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A396C3;
    dw Function_Crawlers_CrawlingHorizontally                            ;A396C5;

InstList_Sciser_UpsideUp_1:
    dw $0008                                                             ;A396C7;
    dw Spritemap_Sciser_UpsideUp_0                                       ;A396C9;
    dw $0008                                                             ;A396CB;
    dw Spritemap_Sciser_UpsideUp_1                                       ;A396CD;
    dw $0008                                                             ;A396CF;
    dw Spritemap_Sciser_UpsideUp_2                                       ;A396D1;
    dw $0008                                                             ;A396D3;
    dw Spritemap_Sciser_UpsideUp_1                                       ;A396D5;
    dw Instruction_Common_GotoY                                          ;A396D7;
    dw InstList_Sciser_UpsideUp_1                                        ;A396D9;

InstListPointers_Sciser:
    dw InstList_Sciser_UpsideRight_0                                     ;A396DB;
    dw InstList_Sciser_UpsideLeft_0                                      ;A396DD;
    dw InstList_Sciser_UpsideDown_0                                      ;A396DF;
    dw InstList_Sciser_UpsideUp_0                                        ;A396E1;

InitAI_Sciser:
    LDX.W $0E54                                                          ;A396E3;
    LDA.W #$0008                                                         ;A396E6;
    STA.W EnemyData.initParam1,X                                         ;A396E9;
    LDA.W EnemyData.pInstList,X                                          ;A396EC;
    AND.W #$0003                                                         ;A396EF;
    ASL A                                                                ;A396F2;
    TAY                                                                  ;A396F3;
    LDA.W InstListPointers_Sciser,Y                                      ;A396F4;
    STA.W EnemyData.pInstList,X                                          ;A396F7;
    JMP.W InitAI_Crawlers_Common                                         ;A396FA;


UNUSED_GetEnemyIndex_A396FD:
    LDX.W $0E54                                                          ;A396FD;
    RTL                                                                  ;A39700;


RTL_A39701:
    RTL                                                                  ;A39701;


RTL_A39702:
    RTL                                                                  ;A39702;


Spritemap_Sciser_UpsideUp_0:
    dw $0004,$81FF                                                       ;A39703;
    db $F3                                                               ;A39707;
    dw $6106,$81F3                                                       ;A39708;
    db $F4                                                               ;A3970C;
    dw $2106,$8000                                                       ;A3970D;
    db $FC                                                               ;A39711;
    dw $6104,$81F0                                                       ;A39712;
    db $FC                                                               ;A39716;
    dw $2100                                                             ;A39717;

Spritemap_Sciser_UpsideUp_1:
    dw $0004,$81FE                                                       ;A39719;
    db $F3                                                               ;A3971D;
    dw $6106,$81F2                                                       ;A3971E;
    db $F3                                                               ;A39722;
    dw $2106,$8000                                                       ;A39723;
    db $FB                                                               ;A39727;
    dw $6102,$81F0                                                       ;A39728;
    db $FB                                                               ;A3972C;
    dw $2102                                                             ;A3972D;

Spritemap_Sciser_UpsideUp_2:
    dw $0004,$81FD                                                       ;A3972F;
    db $F4                                                               ;A39733;
    dw $6106,$81F1                                                       ;A39734;
    db $F3                                                               ;A39738;
    dw $2106,$8000                                                       ;A39739;
    db $FC                                                               ;A3973D;
    dw $6100,$81F0                                                       ;A3973E;
    db $FC                                                               ;A39742;
    dw $2104                                                             ;A39743;

Spritemap_Sciser_UpsideRight_0:
    dw $0004,$81FD                                                       ;A39745;
    db $FF                                                               ;A39749;
    dw $A10E,$81FC                                                       ;A3974A;
    db $F3                                                               ;A3974E;
    dw $210E,$81F4                                                       ;A3974F;
    db $00                                                               ;A39753;
    dw $A10C,$81F4                                                       ;A39754;
    db $F0                                                               ;A39758;
    dw $2108                                                             ;A39759;

Spritemap_Sciser_UpsideRight_1:
    dw $0004,$81FD                                                       ;A3975B;
    db $FE                                                               ;A3975F;
    dw $A10E,$81FD                                                       ;A39760;
    db $F2                                                               ;A39764;
    dw $210E,$81F5                                                       ;A39765;
    db $00                                                               ;A39769;
    dw $A10A,$81F5                                                       ;A3976A;
    db $F0                                                               ;A3976E;
    dw $210A                                                             ;A3976F;

Spritemap_Sciser_UpsideRight_2:
    dw $0004,$81FC                                                       ;A39771;
    db $FD                                                               ;A39775;
    dw $A10E,$81FD                                                       ;A39776;
    db $F1                                                               ;A3977A;
    dw $210E,$81F4                                                       ;A3977B;
    db $00                                                               ;A3977F;
    dw $A108,$81F4                                                       ;A39780;
    db $F0                                                               ;A39784;
    dw $210C                                                             ;A39785;

Spritemap_Sciser_UpsideDown_0:
    dw $0004,$81FF                                                       ;A39787;
    db $FD                                                               ;A3978B;
    dw $E106,$81F3                                                       ;A3978C;
    db $FC                                                               ;A39790;
    dw $A106,$8000                                                       ;A39791;
    db $F4                                                               ;A39795;
    dw $E104,$81F0                                                       ;A39796;
    db $F4                                                               ;A3979A;
    dw $A100                                                             ;A3979B;

Spritemap_Sciser_UpsideDown_1:
    dw $0004,$81FE                                                       ;A3979D;
    db $FD                                                               ;A397A1;
    dw $E106,$81F2                                                       ;A397A2;
    db $FD                                                               ;A397A6;
    dw $A106,$8000                                                       ;A397A7;
    db $F5                                                               ;A397AB;
    dw $E102,$81F0                                                       ;A397AC;
    db $F5                                                               ;A397B0;
    dw $A102                                                             ;A397B1;

Spritemap_Sciser_UpsideDown_2:
    dw $0004,$81FD                                                       ;A397B3;
    db $FC                                                               ;A397B7;
    dw $E106,$81F1                                                       ;A397B8;
    db $FD                                                               ;A397BC;
    dw $A106,$8000                                                       ;A397BD;
    db $F4                                                               ;A397C1;
    dw $E100,$81F0                                                       ;A397C2;
    db $F4                                                               ;A397C6;
    dw $A104                                                             ;A397C7;

Spritemap_Sciser_UpsideLeft_0:
    dw $0004,$81F3                                                       ;A397C9;
    db $FF                                                               ;A397CD;
    dw $E10E,$81F4                                                       ;A397CE;
    db $F3                                                               ;A397D2;
    dw $610E,$81FC                                                       ;A397D3;
    db $00                                                               ;A397D7;
    dw $E10C,$81FC                                                       ;A397D8;
    db $F0                                                               ;A397DC;
    dw $6108                                                             ;A397DD;

Spritemap_Sciser_UpsideLeft_1:
    dw $0004,$81F3                                                       ;A397DF;
    db $FE                                                               ;A397E3;
    dw $E10E,$81F3                                                       ;A397E4;
    db $F2                                                               ;A397E8;
    dw $610E,$81FB                                                       ;A397E9;
    db $00                                                               ;A397ED;
    dw $E10A,$81FB                                                       ;A397EE;
    db $F0                                                               ;A397F2;
    dw $610A                                                             ;A397F3;

Spritemap_Sciser_UpsideLeft_2:
    dw $0004,$81F4                                                       ;A397F5;
    db $FD                                                               ;A397F9;
    dw $E10E,$81F3                                                       ;A397FA;
    db $F1                                                               ;A397FE;
    dw $610E,$81FC                                                       ;A397FF;
    db $00                                                               ;A39803;
    dw $E108,$81FC                                                       ;A39804;
    db $F0                                                               ;A39808;
    dw $610C                                                             ;A39809;

Palette_Zero:
    dw $3800,$57F5,$4AEF,$1182,$00C0,$5752,$3EAD,$2E08                   ;A3980B;
    dw $25C6,$03FD,$02D5,$020F,$0149,$3EDF,$0018,$000F                   ;A3981B;

UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982B:
    dw Instruction_Crawlers_FunctionInY                                  ;A3982B;
    dw Function_Crawlers_CrawlingVertically                              ;A3982D;

UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982F:
    dw $0004                                                             ;A3982F;
    dw Spritemap_Zero_UpsideRight_FacingUp_0                             ;A39831;
    dw $0004                                                             ;A39833;
    dw Spritemap_Zero_UpsideRight_FacingUp_1                             ;A39835;
    dw $0004                                                             ;A39837;
    dw Spritemap_Zero_UpsideRight_FacingUp_2                             ;A39839;
    dw $0004                                                             ;A3983B;
    dw Spritemap_Zero_UpsideRight_FacingUp_3                             ;A3983D;
    dw $0004                                                             ;A3983F;
    dw Spritemap_Zero_UpsideRight_FacingUp_2                             ;A39841;
    dw $0004                                                             ;A39843;
    dw Spritemap_Zero_UpsideRight_FacingUp_1                             ;A39845;
    dw Instruction_Common_GotoY                                          ;A39847;
    dw UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982F                  ;A39849;

InstList_Zero_UpsideRight_FacingDown_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3984B;
    dw Function_Crawlers_CrawlingVertically                              ;A3984D;

InstList_Zero_UpsideRight_FacingDown_1:
    dw $0004                                                             ;A3984F;
    dw Spritemap_Zero_UpsideRight_FacingDown_0                           ;A39851;
    dw $0004                                                             ;A39853;
    dw Spritemap_Zero_UpsideRight_FacingDown_1                           ;A39855;
    dw $0004                                                             ;A39857;
    dw Spritemap_Zero_UpsideRight_FacingDown_2                           ;A39859;
    dw $0004                                                             ;A3985B;
    dw Spritemap_Zero_UpsideRight_FacingDown_3                           ;A3985D;
    dw $0004                                                             ;A3985F;
    dw Spritemap_Zero_UpsideRight_FacingDown_2                           ;A39861;
    dw $0004                                                             ;A39863;
    dw Spritemap_Zero_UpsideRight_FacingDown_1                           ;A39865;
    dw Instruction_Common_GotoY                                          ;A39867;
    dw InstList_Zero_UpsideRight_FacingDown_1                            ;A39869;

UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986B:
    dw Instruction_Crawlers_FunctionInY                                  ;A3986B;
    dw Function_Crawlers_CrawlingVertically                              ;A3986D;

UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986F:
    dw $0004                                                             ;A3986F;
    dw Spritemap_Zero_UpsideLeft_FacingDown_0                            ;A39871;
    dw $0004                                                             ;A39873;
    dw Spritemap_Zero_UpsideLeft_FacingDown_1                            ;A39875;
    dw $0004                                                             ;A39877;
    dw Spritemap_Zero_UpsideLeft_FacingDown_2                            ;A39879;
    dw $0004                                                             ;A3987B;
    dw Spritemap_Zero_UpsideLeft_FacingDown_3                            ;A3987D;
    dw $0004                                                             ;A3987F;
    dw Spritemap_Zero_UpsideLeft_FacingDown_2                            ;A39881;
    dw $0004                                                             ;A39883;
    dw Spritemap_Zero_UpsideLeft_FacingDown_1                            ;A39885;
    dw Instruction_Common_GotoY                                          ;A39887;
    dw UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986F                 ;A39889;

InstList_Zero_UpsideLeft_FacingUp_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3988B;
    dw Function_Crawlers_CrawlingVertically                              ;A3988D;

InstList_Zero_UpsideLeft_FacingUp_1:
    dw $0004                                                             ;A3988F;
    dw Spritemap_Zero_UpsideLeft_FacingUp_0                              ;A39891;
    dw $0004                                                             ;A39893;
    dw Spritemap_Zero_UpsideLeft_FacingUp_1                              ;A39895;
    dw $0004                                                             ;A39897;
    dw Spritemap_Zero_UpsideLeft_FacingUp_2                              ;A39899;
    dw $0004                                                             ;A3989B;
    dw Spritemap_Zero_UpsideLeft_FacingUp_3                              ;A3989D;
    dw $0004                                                             ;A3989F;
    dw Spritemap_Zero_UpsideLeft_FacingUp_2                              ;A398A1;
    dw $0004                                                             ;A398A3;
    dw Spritemap_Zero_UpsideLeft_FacingUp_1                              ;A398A5;
    dw Instruction_Common_GotoY                                          ;A398A7;
    dw InstList_Zero_UpsideLeft_FacingUp_1                               ;A398A9;

InstList_Zero_UpsideDown_FacingLeft_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A398AB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A398AD;

InstList_Zero_UpsideDown_FacingLeft_1:
    dw $0004                                                             ;A398AF;
    dw Spritemap_Zero_UpsideDown_FacingLeft_0                            ;A398B1;
    dw $0004                                                             ;A398B3;
    dw Spritemap_Zero_UpsideDown_FacingLeft_1                            ;A398B5;
    dw $0004                                                             ;A398B7;
    dw Spritemap_Zero_UpsideDown_FacingLeft_2                            ;A398B9;
    dw $0004                                                             ;A398BB;
    dw Spritemap_Zero_UpsideDown_FacingLeft_3                            ;A398BD;
    dw $0004                                                             ;A398BF;
    dw Spritemap_Zero_UpsideDown_FacingLeft_2                            ;A398C1;
    dw $0004                                                             ;A398C3;
    dw Spritemap_Zero_UpsideDown_FacingLeft_1                            ;A398C5;
    dw Instruction_Common_GotoY                                          ;A398C7;
    dw InstList_Zero_UpsideDown_FacingLeft_1                             ;A398C9;

UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CB:
    dw Instruction_Crawlers_FunctionInY                                  ;A398CB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A398CD;

UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CF:
    dw $0004                                                             ;A398CF;
    dw Spritemap_Zero_UpsideUp_FacingLeft_0                              ;A398D1;
    dw $0004                                                             ;A398D3;
    dw Spritemap_Zero_UpsideUp_FacingLeft_1                              ;A398D5;
    dw $0004                                                             ;A398D7;
    dw Spritemap_Zero_UpsideUp_FacingLeft_2                              ;A398D9;
    dw $0004                                                             ;A398DB;
    dw Spritemap_Zero_UpsideUp_FacingLeft_3                              ;A398DD;
    dw $0004                                                             ;A398DF;
    dw Spritemap_Zero_UpsideUp_FacingLeft_2                              ;A398E1;
    dw $0004                                                             ;A398E3;
    dw Spritemap_Zero_UpsideUp_FacingLeft_1                              ;A398E5;
    dw Instruction_Common_GotoY                                          ;A398E7;
    dw UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CF                   ;A398E9;

UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EB:
    dw Instruction_Crawlers_FunctionInY                                  ;A398EB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A398ED;

UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EF:
    dw $0004                                                             ;A398EF;
    dw Spritemap_Zero_UpsideDown_FacingRight_0                           ;A398F1;
    dw $0004                                                             ;A398F3;
    dw Spritemap_Zero_UpsideDown_FacingRight_1                           ;A398F5;
    dw $0004                                                             ;A398F7;
    dw Spritemap_Zero_UpsideDown_FacingRight_2                           ;A398F9;
    dw $0004                                                             ;A398FB;
    dw Spritemap_Zero_UpsideDown_FacingRight_3                           ;A398FD;
    dw $0004                                                             ;A398FF;
    dw Spritemap_Zero_UpsideDown_FacingRight_2                           ;A39901;
    dw $0004                                                             ;A39903;
    dw Spritemap_Zero_UpsideDown_FacingRight_1                           ;A39905;
    dw Instruction_Common_GotoY                                          ;A39907;
    dw UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EF                ;A39909;

UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B:
    dw Instruction_Crawlers_FunctionInY                                  ;A3990B;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3990D;

UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990F:
    dw $0004                                                             ;A3990F;
    dw Spritemap_Zero_UpsideUp_FacingRight_0                             ;A39911;
    dw $0004                                                             ;A39913;
    dw Spritemap_Zero_UpsideUp_FacingRight_1                             ;A39915;
    dw $0004                                                             ;A39917;
    dw Spritemap_Zero_UpsideUp_FacingRight_2                             ;A39919;
    dw $0004                                                             ;A3991B;
    dw Spritemap_Zero_UpsideUp_FacingRight_3                             ;A3991D;
    dw $0004                                                             ;A3991F;
    dw Spritemap_Zero_UpsideUp_FacingRight_2                             ;A39921;
    dw $0004                                                             ;A39923;
    dw Spritemap_Zero_UpsideUp_FacingRight_1                             ;A39925;
    dw Instruction_Common_GotoY                                          ;A39927;
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990F                  ;A39929;

InitialInstListPointers_Zero:
    dw InstList_Zero_UpsideRight_FacingDown_0                            ;A3992B;
    dw InstList_Zero_UpsideLeft_FacingUp_0                               ;A3992D;
    dw InstList_Zero_UpsideDown_FacingLeft_0                             ;A3992F;
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B                  ;A39931;
    dw UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982B                  ;A39933;
    dw UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986B                 ;A39935;
    dw UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CB                   ;A39937;
    dw UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EB                ;A39939;

InitAI_Zero:
    LDX.W $0E54                                                          ;A3993B;
    LDA.W #$000A                                                         ;A3993E;
    STA.W EnemyData.initParam1,X                                         ;A39941;
    LDA.W EnemyData.pInstList,X                                          ;A39944;
    AND.W #$0003                                                         ;A39947;
    ASL A                                                                ;A3994A;
    TAY                                                                  ;A3994B;
    LDA.W InitialInstListPointers_Zero,Y                                 ;A3994C;
    STA.W EnemyData.pInstList,X                                          ;A3994F;
    JMP.W InitAI_Crawlers_Common                                         ;A39952;


UNUSED_GetEnemyIndex_A39955:
    LDX.W $0E54                                                          ;A39955;
    RTL                                                                  ;A39958;


RTL_A39959:
    RTL                                                                  ;A39959;


RTL_A3995A:
    RTL                                                                  ;A3995A;


Spritemap_Zero_UpsideUp_FacingRight_0:
    dw $0003,$8000                                                       ;A3995B;
    db $F8                                                               ;A3995F;
    dw $2104,$81FA                                                       ;A39960;
    db $F8                                                               ;A39964;
    dw $2102,$81F1                                                       ;A39965;
    db $F8                                                               ;A39969;
    dw $2100                                                             ;A3996A;

Spritemap_Zero_UpsideUp_FacingRight_1:
    dw $0003,$8000                                                       ;A3996C;
    db $F8                                                               ;A39970;
    dw $2104,$81FA                                                       ;A39971;
    db $F8                                                               ;A39975;
    dw $2102,$81F0                                                       ;A39976;
    db $F8                                                               ;A3997A;
    dw $2100                                                             ;A3997B;

Spritemap_Zero_UpsideUp_FacingRight_2:
    dw $0003,$8001                                                       ;A3997D;
    db $F8                                                               ;A39981;
    dw $2104,$81FA                                                       ;A39982;
    db $F8                                                               ;A39986;
    dw $2102,$81EF                                                       ;A39987;
    db $F8                                                               ;A3998B;
    dw $2100                                                             ;A3998C;

Spritemap_Zero_UpsideUp_FacingRight_3:
    dw $0003,$8002                                                       ;A3998E;
    db $F8                                                               ;A39992;
    dw $2104,$81FA                                                       ;A39993;
    db $F8                                                               ;A39997;
    dw $2102,$81EE                                                       ;A39998;
    db $F8                                                               ;A3999C;
    dw $2100                                                             ;A3999D;

Spritemap_Zero_UpsideLeft_FacingUp_0:
    dw $0003,$81F8                                                       ;A3999F;
    db $00                                                               ;A399A3;
    dw $610A,$81F8                                                       ;A399A4;
    db $FA                                                               ;A399A8;
    dw $6108,$81F8                                                       ;A399A9;
    db $F1                                                               ;A399AD;
    dw $6106                                                             ;A399AE;

Spritemap_Zero_UpsideLeft_FacingUp_1:
    dw $0003,$81F8                                                       ;A399B0;
    db $00                                                               ;A399B4;
    dw $610A,$81F8                                                       ;A399B5;
    db $FA                                                               ;A399B9;
    dw $6108,$81F8                                                       ;A399BA;
    db $F0                                                               ;A399BE;
    dw $6106                                                             ;A399BF;

Spritemap_Zero_UpsideLeft_FacingUp_2:
    dw $0003,$81F8                                                       ;A399C1;
    db $01                                                               ;A399C5;
    dw $610A,$81F8                                                       ;A399C6;
    db $FA                                                               ;A399CA;
    dw $6108,$81F8                                                       ;A399CB;
    db $EF                                                               ;A399CF;
    dw $6106                                                             ;A399D0;

Spritemap_Zero_UpsideLeft_FacingUp_3:
    dw $0003,$81F8                                                       ;A399D2;
    db $02                                                               ;A399D6;
    dw $610A,$81F8                                                       ;A399D7;
    db $FA                                                               ;A399DB;
    dw $6108,$81F8                                                       ;A399DC;
    db $EE                                                               ;A399E0;
    dw $6106                                                             ;A399E1;

Spritemap_Zero_UpsideDown_FacingLeft_0:
    dw $0003,$81F0                                                       ;A399E3;
    db $F8                                                               ;A399E7;
    dw $E104,$81F6                                                       ;A399E8;
    db $F8                                                               ;A399EC;
    dw $E102,$81FF                                                       ;A399ED;
    db $F8                                                               ;A399F1;
    dw $E100                                                             ;A399F2;

Spritemap_Zero_UpsideDown_FacingLeft_1:
    dw $0003,$81F0                                                       ;A399F4;
    db $F8                                                               ;A399F8;
    dw $E104,$81F6                                                       ;A399F9;
    db $F8                                                               ;A399FD;
    dw $E102,$8000                                                       ;A399FE;
    db $F8                                                               ;A39A02;
    dw $E100                                                             ;A39A03;

Spritemap_Zero_UpsideDown_FacingLeft_2:
    dw $0003,$81EF                                                       ;A39A05;
    db $F8                                                               ;A39A09;
    dw $E104,$81F6                                                       ;A39A0A;
    db $F8                                                               ;A39A0E;
    dw $E102,$8001                                                       ;A39A0F;
    db $F8                                                               ;A39A13;
    dw $E100                                                             ;A39A14;

Spritemap_Zero_UpsideDown_FacingLeft_3:
    dw $0003,$81EE                                                       ;A39A16;
    db $F8                                                               ;A39A1A;
    dw $E104,$81F6                                                       ;A39A1B;
    db $F8                                                               ;A39A1F;
    dw $E102,$8002                                                       ;A39A20;
    db $F8                                                               ;A39A24;
    dw $E100                                                             ;A39A25;

Spritemap_Zero_UpsideLeft_FacingDown_0:
    dw $0003,$81F8                                                       ;A39A27;
    db $F0                                                               ;A39A2B;
    dw $E10A,$81F8                                                       ;A39A2C;
    db $F6                                                               ;A39A30;
    dw $E108,$81F8                                                       ;A39A31;
    db $FF                                                               ;A39A35;
    dw $E106                                                             ;A39A36;

Spritemap_Zero_UpsideLeft_FacingDown_1:
    dw $0003,$81F8                                                       ;A39A38;
    db $F0                                                               ;A39A3C;
    dw $E10A,$81F8                                                       ;A39A3D;
    db $F6                                                               ;A39A41;
    dw $E108,$81F8                                                       ;A39A42;
    db $00                                                               ;A39A46;
    dw $E106                                                             ;A39A47;

Spritemap_Zero_UpsideLeft_FacingDown_2:
    dw $0003,$81F8                                                       ;A39A49;
    db $EF                                                               ;A39A4D;
    dw $E10A,$81F8                                                       ;A39A4E;
    db $F6                                                               ;A39A52;
    dw $E108,$81F8                                                       ;A39A53;
    db $01                                                               ;A39A57;
    dw $E106                                                             ;A39A58;

Spritemap_Zero_UpsideLeft_FacingDown_3:
    dw $0003,$81F8                                                       ;A39A5A;
    db $EE                                                               ;A39A5E;
    dw $E10A,$81F8                                                       ;A39A5F;
    db $F6                                                               ;A39A63;
    dw $E108,$81F8                                                       ;A39A64;
    db $02                                                               ;A39A68;
    dw $E106                                                             ;A39A69;

Spritemap_Zero_UpsideUp_FacingLeft_0:
    dw $0003,$8000                                                       ;A39A6B;
    db $F8                                                               ;A39A6F;
    dw $A104,$81FA                                                       ;A39A70;
    db $F8                                                               ;A39A74;
    dw $A102,$81F1                                                       ;A39A75;
    db $F8                                                               ;A39A79;
    dw $A100                                                             ;A39A7A;

Spritemap_Zero_UpsideUp_FacingLeft_1:
    dw $0003,$8000                                                       ;A39A7C;
    db $F8                                                               ;A39A80;
    dw $A104,$81FA                                                       ;A39A81;
    db $F8                                                               ;A39A85;
    dw $A102,$81F0                                                       ;A39A86;
    db $F8                                                               ;A39A8A;
    dw $A100                                                             ;A39A8B;

Spritemap_Zero_UpsideUp_FacingLeft_2:
    dw $0003,$8001                                                       ;A39A8D;
    db $F8                                                               ;A39A91;
    dw $A104,$81FA                                                       ;A39A92;
    db $F8                                                               ;A39A96;
    dw $A102,$81EF                                                       ;A39A97;
    db $F8                                                               ;A39A9B;
    dw $A100                                                             ;A39A9C;

Spritemap_Zero_UpsideUp_FacingLeft_3:
    dw $0003,$8002                                                       ;A39A9E;
    db $F8                                                               ;A39AA2;
    dw $A104,$81FA                                                       ;A39AA3;
    db $F8                                                               ;A39AA7;
    dw $A102,$81EE                                                       ;A39AA8;
    db $F8                                                               ;A39AAC;
    dw $A100                                                             ;A39AAD;

Spritemap_Zero_UpsideRight_FacingUp_0:
    dw $0003,$81F8                                                       ;A39AAF;
    db $00                                                               ;A39AB3;
    dw $210A,$81F8                                                       ;A39AB4;
    db $FA                                                               ;A39AB8;
    dw $2108,$81F8                                                       ;A39AB9;
    db $F1                                                               ;A39ABD;
    dw $2106                                                             ;A39ABE;

Spritemap_Zero_UpsideRight_FacingUp_1:
    dw $0003,$81F8                                                       ;A39AC0;
    db $00                                                               ;A39AC4;
    dw $210A,$81F8                                                       ;A39AC5;
    db $FA                                                               ;A39AC9;
    dw $2108,$81F8                                                       ;A39ACA;
    db $F0                                                               ;A39ACE;
    dw $2106                                                             ;A39ACF;

Spritemap_Zero_UpsideRight_FacingUp_2:
    dw $0003,$81F8                                                       ;A39AD1;
    db $01                                                               ;A39AD5;
    dw $210A,$81F8                                                       ;A39AD6;
    db $FA                                                               ;A39ADA;
    dw $2108,$81F8                                                       ;A39ADB;
    db $EF                                                               ;A39ADF;
    dw $2106                                                             ;A39AE0;

Spritemap_Zero_UpsideRight_FacingUp_3:
    dw $0003,$81F8                                                       ;A39AE2;
    db $02                                                               ;A39AE6;
    dw $210A,$81F8                                                       ;A39AE7;
    db $FA                                                               ;A39AEB;
    dw $2108,$81F8                                                       ;A39AEC;
    db $EE                                                               ;A39AF0;
    dw $2106                                                             ;A39AF1;

Spritemap_Zero_UpsideDown_FacingRight_0:
    dw $0003,$81F0                                                       ;A39AF3;
    db $F8                                                               ;A39AF7;
    dw $6104,$81F6                                                       ;A39AF8;
    db $F8                                                               ;A39AFC;
    dw $6102,$81FF                                                       ;A39AFD;
    db $F8                                                               ;A39B01;
    dw $6100                                                             ;A39B02;

Spritemap_Zero_UpsideDown_FacingRight_1:
    dw $0003,$81F0                                                       ;A39B04;
    db $F8                                                               ;A39B08;
    dw $6104,$81F6                                                       ;A39B09;
    db $F8                                                               ;A39B0D;
    dw $6102,$8000                                                       ;A39B0E;
    db $F8                                                               ;A39B12;
    dw $6100                                                             ;A39B13;

Spritemap_Zero_UpsideDown_FacingRight_2:
    dw $0003,$81EF                                                       ;A39B15;
    db $F8                                                               ;A39B19;
    dw $6104,$81F6                                                       ;A39B1A;
    db $F8                                                               ;A39B1E;
    dw $6102,$8001                                                       ;A39B1F;
    db $F8                                                               ;A39B23;
    dw $6100                                                             ;A39B24;

Spritemap_Zero_UpsideDown_FacingRight_3:
    dw $0003,$81EE                                                       ;A39B26;
    db $F8                                                               ;A39B2A;
    dw $6104,$81F6                                                       ;A39B2B;
    db $F8                                                               ;A39B2F;
    dw $6102,$8002                                                       ;A39B30;
    db $F8                                                               ;A39B34;
    dw $6100                                                             ;A39B35;

Spritemap_Zero_UpsideRight_FacingDown_0:
    dw $0003,$81F8                                                       ;A39B37;
    db $F0                                                               ;A39B3B;
    dw $A10A,$81F8                                                       ;A39B3C;
    db $F6                                                               ;A39B40;
    dw $A108,$81F8                                                       ;A39B41;
    db $FF                                                               ;A39B45;
    dw $A106                                                             ;A39B46;

Spritemap_Zero_UpsideRight_FacingDown_1:
    dw $0003,$81F8                                                       ;A39B48;
    db $F0                                                               ;A39B4C;
    dw $A10A,$81F8                                                       ;A39B4D;
    db $F6                                                               ;A39B51;
    dw $A108,$81F8                                                       ;A39B52;
    db $00                                                               ;A39B56;
    dw $A106                                                             ;A39B57;

Spritemap_Zero_UpsideRight_FacingDown_2:
    dw $0003,$81F8                                                       ;A39B59;
    db $EF                                                               ;A39B5D;
    dw $A10A,$81F8                                                       ;A39B5E;
    db $F6                                                               ;A39B62;
    dw $A108,$81F8                                                       ;A39B63;
    db $01                                                               ;A39B67;
    dw $A106                                                             ;A39B68;

Spritemap_Zero_UpsideRight_FacingDown_3:
    dw $0003,$81F8                                                       ;A39B6A;
    db $EE                                                               ;A39B6E;
    dw $A10A,$81F8                                                       ;A39B6F;
    db $F6                                                               ;A39B73;
    dw $A108,$81F8                                                       ;A39B74;
    db $02                                                               ;A39B78;
    dw $A106                                                             ;A39B79;

Palette_Tripper:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A39B7B;
    dw $0924,$7F5A,$7EC0,$6DE0,$54E0,$03FF,$0237,$00D1                   ;A39B8B;

Palette_Kamer2:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610                   ;A39B9B;
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113                   ;A39BAB;

InstList_Kamer2_VerticallyMoving_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate       ;A39BBB;

InstList_Kamer2_VerticallyMoving_Left_1:
    dw $000A                                                             ;A39BBD;
    dw Spritemap_Kamer2_0                                                ;A39BBF;
    dw $000A                                                             ;A39BC1;
    dw Spritemap_Kamer2_1                                                ;A39BC3;
    dw $000A                                                             ;A39BC5;
    dw Spritemap_Kamer2_2                                                ;A39BC7;
    dw $000A                                                             ;A39BC9;
    dw Spritemap_Kamer2_3                                                ;A39BCB;
    dw Instruction_Common_GotoY                                          ;A39BCD;
    dw InstList_Kamer2_VerticallyMoving_Left_1                           ;A39BCF;

InstList_Kamer2_VerticallyMoving_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate      ;A39BD1;

InstList_Kamer2_VerticallyMoving_Right_1:
    dw $000A                                                             ;A39BD3;
    dw Spritemap_Kamer2_0                                                ;A39BD5;
    dw $000A                                                             ;A39BD7;
    dw Spritemap_Kamer2_1                                                ;A39BD9;
    dw $000A                                                             ;A39BDB;
    dw Spritemap_Kamer2_2                                                ;A39BDD;
    dw $000A                                                             ;A39BDF;
    dw Spritemap_Kamer2_3                                                ;A39BE1;
    dw Instruction_Common_GotoY                                          ;A39BE3;
    dw InstList_Kamer2_VerticallyMoving_Right_1                          ;A39BE5;

InstList_Kamer2_VerticallyStill_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement                 ;A39BE7;

InstList_Kamer2_VerticallyStill_Left_1:
    dw $000A                                                             ;A39BE9;
    dw Spritemap_Kamer2_0                                                ;A39BEB;
    dw $000A                                                             ;A39BED;
    dw Spritemap_Kamer2_1                                                ;A39BEF;
    dw $000A                                                             ;A39BF1;
    dw Spritemap_Kamer2_2                                                ;A39BF3;
    dw $000A                                                             ;A39BF5;
    dw Spritemap_Kamer2_3                                                ;A39BF7;
    dw Instruction_Common_GotoY                                          ;A39BF9;
    dw InstList_Kamer2_VerticallyStill_Left_1                            ;A39BFB;

InstList_Kamer2_VerticallyStill_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement                ;A39BFD;

InstList_Kamer2_VerticallyStill_Right_1:
    dw $000A                                                             ;A39BFF;
    dw Spritemap_Kamer2_0                                                ;A39C01;
    dw $000A                                                             ;A39C03;
    dw Spritemap_Kamer2_1                                                ;A39C05;
    dw $000A                                                             ;A39C07;
    dw Spritemap_Kamer2_2                                                ;A39C09;
    dw $000A                                                             ;A39C0B;
    dw Spritemap_Kamer2_3                                                ;A39C0D;
    dw Instruction_Common_GotoY                                          ;A39C0F;
    dw InstList_Kamer2_VerticallyStill_Right_1                           ;A39C11;

InstList_Tripper_VerticallyMoving_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate       ;A39C13;

InstList_Tripper_VerticallyMoving_Left_1:
    dw $0007                                                             ;A39C15;
    dw Spritemap_Tripper_VerticallyMoving_Left_0                         ;A39C17;
    dw $0008                                                             ;A39C19;
    dw Spritemap_Tripper_VerticallyMoving_Left_1                         ;A39C1B;
    dw $0007                                                             ;A39C1D;
    dw Spritemap_Tripper_VerticallyMoving_Left_0                         ;A39C1F;
    dw $0008                                                             ;A39C21;
    dw Spritemap_Tripper_VerticallyMoving_Left_2                         ;A39C23;
    dw Instruction_Common_GotoY                                          ;A39C25;
    dw InstList_Tripper_VerticallyMoving_Left_1                          ;A39C27;

InstList_Tripper_VerticallyMoving_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate      ;A39C29;

InstList_Tripper_VerticallyMoving_Right_1:
    dw $0007                                                             ;A39C2B;
    dw Spritemap_Tripper_VerticallyMoving_Right_0                        ;A39C2D;
    dw $0008                                                             ;A39C2F;
    dw Spritemap_Tripper_VerticallyMoving_Right_1                        ;A39C31;
    dw $0007                                                             ;A39C33;
    dw Spritemap_Tripper_VerticallyMoving_Right_0                        ;A39C35;
    dw $0008                                                             ;A39C37;
    dw Spritemap_Tripper_VerticallyMoving_Right_2                        ;A39C39;
    dw Instruction_Common_GotoY                                          ;A39C3B;
    dw InstList_Tripper_VerticallyMoving_Right_1                         ;A39C3D;

InstList_Tripper_VerticallyStill_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement                 ;A39C3F;

InstList_Tripper_VerticallyStill_Right_1:
    dw $0007                                                             ;A39C41;
    dw Spritemap_Tripper_VerticallyStill_Right_0                         ;A39C43;
    dw $0008                                                             ;A39C45;
    dw Spritemap_Tripper_VerticallyStill_Right_1                         ;A39C47;
    dw $0007                                                             ;A39C49;
    dw Spritemap_Tripper_VerticallyStill_Right_0                         ;A39C4B;
    dw $0008                                                             ;A39C4D;
    dw Spritemap_Tripper_VerticallyStill_Right_2                         ;A39C4F;
    dw Instruction_Common_GotoY                                          ;A39C51;
    dw InstList_Tripper_VerticallyStill_Right_1                          ;A39C53;

InstList_Tripper_VerticallyStill_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement                ;A39C55;

InstList_Tripper_VerticallyStill_Left_1:
    dw $0007                                                             ;A39C57;
    dw Spritemap_Tripper_VerticallyStill_Left_0                          ;A39C59;
    dw $0008                                                             ;A39C5B;
    dw Spritemap_Tripper_VerticallyStill_Left_1                          ;A39C5D;
    dw $0007                                                             ;A39C5F;
    dw Spritemap_Tripper_VerticallyStill_Left_0                          ;A39C61;
    dw $0008                                                             ;A39C63;
    dw Spritemap_Tripper_VerticallyStill_Left_2                          ;A39C65;
    dw Instruction_Common_GotoY                                          ;A39C67;
    dw InstList_Tripper_VerticallyStill_Left_1                           ;A39C69;

Instruction_Tripper_Kamer2_SetMovingLeftXMovement:
    LDX.W $0E54                                                          ;A39C6B;
    LDA.W #$0000                                                         ;A39C6E;
    STA.L $7E7804,X                                                      ;A39C71;
    RTL                                                                  ;A39C75;


Instruction_Tripper_Kamer2_SetMovingRightXMovement:
    LDX.W $0E54                                                          ;A39C76;
    LDA.W #$0001                                                         ;A39C79;
    STA.L $7E7804,X                                                      ;A39C7C;
    RTL                                                                  ;A39C80;


Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate:
    LDX.W $0E54                                                          ;A39C81;
    LDA.W #$0000                                                         ;A39C84;
    STA.L $7E7804,X                                                      ;A39C87;
    RTL                                                                  ;A39C8B;


Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate:
    LDX.W $0E54                                                          ;A39C8C;
    LDA.W #$0001                                                         ;A39C8F;
    STA.L $7E7804,X                                                      ;A39C92;
    RTL                                                                  ;A39C96;


FunctionPointers_Tripper_Kamer2_XMovement:
    dw Function_Tripper_Kamer2_XMovement_0_MovingLeft                    ;A39C97;
    dw Function_Tripper_Kamer2_XMovement_1_MovingRight                   ;A39C99;

FunctionPointers_Tripper_Kamer2_YMovement:
    dw Function_Tripper_Kamer2_YMovement_Rising                          ;A39C9B;
    dw Function_Tripper_Kamer2_YMovement_1_Sinking                       ;A39C9D;

InitAI_Kamer2:
    LDX.W $0E54                                                          ;A39C9F;
    LDA.W #$FFFF                                                         ;A39CA2;
    STA.L $7E783E,X                                                      ;A39CA5;
    LDY.W #InstList_Kamer2_VerticallyStill_Left_0                        ;A39CA9;
    LDA.W EnemyData.initParam0,X                                         ;A39CAC;
    STA.L $7E7804,X                                                      ;A39CAF;
    BEQ InitAI_Tripper_Kamer2_Common                                     ;A39CB3;
    LDY.W #InstList_Kamer2_VerticallyStill_Right_0                       ;A39CB5;
    BRA InitAI_Tripper_Kamer2_Common                                     ;A39CB8;


InitAI_Tripper:
    LDX.W $0E54                                                          ;A39CBA;
    LDY.W #InstList_Tripper_VerticallyStill_Right_0                      ;A39CBD;
    LDA.W EnemyData.initParam0,X                                         ;A39CC0;
    STA.L $7E7804,X                                                      ;A39CC3;
    BEQ InitAI_Tripper_Kamer2_Common                                     ;A39CC7;
    LDY.W #InstList_Tripper_VerticallyStill_Left_0                       ;A39CC9; fallthrough to InitAI_Tripper_Kamer2_Common

InitAI_Tripper_Kamer2_Common:
    TYA                                                                  ;A39CCC;
    STA.W EnemyData.pInstList,X                                          ;A39CCD;
    LDA.W EnemyData.initParam1,X                                         ;A39CD0;
    AND.W #$00FF                                                         ;A39CD3;
    ASL A                                                                ;A39CD6;
    ASL A                                                                ;A39CD7;
    ASL A                                                                ;A39CD8;
    TAY                                                                  ;A39CD9;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A39CDA;
    STA.W EnemyData.work2,X                                              ;A39CDD;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A39CE0;
    STA.W EnemyData.work1,X                                              ;A39CE3;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;A39CE6;
    STA.W EnemyData.work4,X                                              ;A39CE9;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;A39CEC;
    STA.W EnemyData.work3,X                                              ;A39CEF;
    LDA.W #$0000                                                         ;A39CF2;
    STA.L $7E7800,X                                                      ;A39CF5;
    STA.L $7E7806,X                                                      ;A39CF9;
    STA.L $7E7808,X                                                      ;A39CFD;
    LDA.W EnemyData.yPosition,X                                          ;A39D01;
    INC A                                                                ;A39D04;
    STA.W EnemyData.work0,X                                              ;A39D05;
    STZ.W EnemyData.work5,X                                              ;A39D08;
    LDA.W EnemyData.initParam1+1,X                                       ;A39D0B;
    AND.W #$00FF                                                         ;A39D0E;
    STA.L $7E780A,X                                                      ;A39D11;
    RTL                                                                  ;A39D15;


MainAI_Tripper_Kamer2:
    LDX.W $0E54                                                          ;A39D16;
    LDA.W #$0000                                                         ;A39D19;
    STA.L $7E7800,X                                                      ;A39D1C;
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A39D20;
    BEQ .SamusNotRiding                                                  ;A39D24;
    LDA.W #$0001                                                         ;A39D26;
    STA.L $7E7800,X                                                      ;A39D29;

.SamusNotRiding:
    LDX.W $0E54                                                          ;A39D2D;
    LDA.L $7E7804,X                                                      ;A39D30;
    ASL A                                                                ;A39D34;
    TAX                                                                  ;A39D35;
    JSR.W (FunctionPointers_Tripper_Kamer2_XMovement,X)                  ;A39D36;
    LDX.W $0E54                                                          ;A39D39;
    LDA.L $7E7800,X                                                      ;A39D3C;
    ASL A                                                                ;A39D40;
    TAX                                                                  ;A39D41;
    JSR.W (FunctionPointers_Tripper_Kamer2_YMovement,X)                  ;A39D42;
    LDX.W $0E54                                                          ;A39D45;
    LDA.L $7E7800,X                                                      ;A39D48;
    CMP.L $7E780C,X                                                      ;A39D4C;
    BEQ .noChange                                                        ;A39D50;
    STZ.W EnemyData.work5,X                                              ;A39D52;

.noChange:
    LDA.L $7E7800,X                                                      ;A39D55;
    STA.L $7E780C,X                                                      ;A39D59;
    RTL                                                                  ;A39D5D;


Function_Tripper_Kamer2_XMovement_0_MovingLeft:
    LDX.W $0E54                                                          ;A39D5E;
    LDA.W EnemyData.xPosition,X                                          ;A39D61;
    STA.L $7E7802,X                                                      ;A39D64;
    LDA.W EnemyData.work3,X                                              ;A39D68;
    STA.B $12                                                            ;A39D6B;
    LDA.W EnemyData.work4,X                                              ;A39D6D;
    STA.B $14                                                            ;A39D70;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A39D72;
    BCC .return                                                          ;A39D76;
    LDA.W #$0001                                                         ;A39D78;
    STA.L $7E7804,X                                                      ;A39D7B;
    JSR.W SetPlatformInstList_VerticallyStill_MovingRight                ;A39D7F;

.return:
    RTS                                                                  ;A39D82;


Function_Tripper_Kamer2_XMovement_1_MovingRight:
    LDX.W $0E54                                                          ;A39D83;
    LDA.W EnemyData.xPosition,X                                          ;A39D86;
    STA.L $7E7802,X                                                      ;A39D89;
    LDA.W EnemyData.work1,X                                              ;A39D8D;
    STA.B $12                                                            ;A39D90;
    LDA.W EnemyData.work2,X                                              ;A39D92;
    STA.B $14                                                            ;A39D95;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A39D97;
    BCC .return                                                          ;A39D9B;
    LDA.W #$0000                                                         ;A39D9D;
    STA.L $7E7804,X                                                      ;A39DA0;
    JSR.W SetPlatformInstList_VerticallyStill_MovingLeft                 ;A39DA4;

.return:
    RTS                                                                  ;A39DA7;


Function_Tripper_Kamer2_YMovement_Rising:
    LDX.W $0E54                                                          ;A39DA8;
    LDA.W EnemyData.yPosition,X                                          ;A39DAB;
    CMP.W EnemyData.work0,X                                              ;A39DAE;
    BMI .notMoving                                                       ;A39DB1;
    JSR.W SetPlatformInstList_VerticallyMoving                           ;A39DB3;
    INC.W EnemyData.work5,X                                              ;A39DB6;
    LDA.W EnemyData.work5,X                                              ;A39DB9;
    CMP.L $7E780A,X                                                      ;A39DBC;
    BMI +                                                                ;A39DC0;
    LDA.L $7E780A,X                                                      ;A39DC2;
    STA.W EnemyData.work5,X                                              ;A39DC6;

  + ASL A                                                                ;A39DC9;
    ASL A                                                                ;A39DCA;
    ASL A                                                                ;A39DCB;
    TAY                                                                  ;A39DCC;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A39DCD;
    STA.B $12                                                            ;A39DD0;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A39DD2;
    STA.B $14                                                            ;A39DD5;
    JSL.L MoveEnemyDownBy_14_12                                          ;A39DD7;
    BCC .return                                                          ;A39DDB;

.notMoving:
    STZ.W EnemyData.work5,X                                              ;A39DDD;
    JSR.W SetPlatformInstList_VerticallyStill                            ;A39DE0;

.return:
    RTS                                                                  ;A39DE3;


Function_Tripper_Kamer2_YMovement_1_Sinking:
    LDX.W $0E54                                                          ;A39DE4;
    LDA.W EnemyData.yPosition,X                                          ;A39DE7;
    CMP.W EnemyData.work0,X                                              ;A39DEA;
    JSR.W RTS_A39E46                                                     ;A39DED;
    INC.W EnemyData.work5,X                                              ;A39DF0;
    LDA.W EnemyData.work5,X                                              ;A39DF3;
    CMP.L $7E780A,X                                                      ;A39DF6;
    BMI +                                                                ;A39DFA;
    LDA.L $7E780A,X                                                      ;A39DFC;
    STA.W EnemyData.work5,X                                              ;A39E00;

  + LDA.W EnemyData.xPosition,X                                          ;A39E03;
    SEC                                                                  ;A39E06;
    SBC.L $7E7802,X                                                      ;A39E07;
    CLC                                                                  ;A39E0B;
    ADC.W $0B58                                                          ;A39E0C;
    STA.W $0B58                                                          ;A39E0F;
    LDA.W EnemyData.yPosition,X                                          ;A39E12;
    STA.L $7E7802,X                                                      ;A39E15;
    LDA.W EnemyData.work5,X                                              ;A39E19;
    ASL A                                                                ;A39E1C;
    ASL A                                                                ;A39E1D;
    ASL A                                                                ;A39E1E;
    TAY                                                                  ;A39E1F;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A39E20;
    STA.B $12                                                            ;A39E23;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A39E25;
    STA.B $14                                                            ;A39E28;
    JSL.L MoveEnemyDownBy_14_12                                          ;A39E2A;
    BCC .notCollidedWithBlock                                            ;A39E2E;
    STZ.W EnemyData.work5,X                                              ;A39E30;
    JSR.W SetPlatformInstList_VerticallyStill                            ;A39E33;

.notCollidedWithBlock:
    LDA.W EnemyData.yPosition,X                                          ;A39E36;
    SEC                                                                  ;A39E39;
    SBC.L $7E7802,X                                                      ;A39E3A;
    CLC                                                                  ;A39E3E;
    ADC.W $0B5C                                                          ;A39E3F;
    STA.W $0B5C                                                          ;A39E42;
    RTS                                                                  ;A39E45;


RTS_A39E46:
    RTS                                                                  ;A39E46;


SetPlatformInstList_VerticallyMoving_MovingLeft:
    LDX.W $0E54                                                          ;A39E47;
    LDY.W #InstList_Tripper_VerticallyMoving_Left_0                      ;A39E4A;
    LDA.L $7E783E,X                                                      ;A39E4D;
    BPL .Tripper                                                         ;A39E51;
    LDY.W #InstList_Kamer2_VerticallyMoving_Left_0                       ;A39E53;

.Tripper:
    TYA                                                                  ;A39E56;
    STA.W EnemyData.pInstList,X                                          ;A39E57;
    LDA.W #$0001                                                         ;A39E5A;
    STA.W EnemyData.instTimer,X                                          ;A39E5D;
    STZ.W EnemyData.loopCounter,X                                        ;A39E60;
    RTS                                                                  ;A39E63;


SetPlatformInstList_VerticallyMoving_MovingRight:
    LDX.W $0E54                                                          ;A39E64;
    LDY.W #InstList_Tripper_VerticallyMoving_Right_0                     ;A39E67;
    LDA.L $7E783E,X                                                      ;A39E6A;
    BPL .Tripper                                                         ;A39E6E;
    LDY.W #InstList_Kamer2_VerticallyMoving_Right_0                      ;A39E70;

.Tripper:
    TYA                                                                  ;A39E73;
    STA.W EnemyData.pInstList,X                                          ;A39E74;
    LDA.W #$0001                                                         ;A39E77;
    STA.W EnemyData.instTimer,X                                          ;A39E7A;
    STZ.W EnemyData.loopCounter,X                                        ;A39E7D;
    RTS                                                                  ;A39E80;


SetPlatformInstList_VerticallyStill_MovingLeft:
    LDX.W $0E54                                                          ;A39E81;
    LDY.W #InstList_Tripper_VerticallyStill_Right_0                      ;A39E84;
    LDA.L $7E783E,X                                                      ;A39E87;
    BPL .Tripper                                                         ;A39E8B;
    LDY.W #InstList_Kamer2_VerticallyStill_Left_0                        ;A39E8D;

.Tripper:
    TYA                                                                  ;A39E90;
    STA.W EnemyData.pInstList,X                                          ;A39E91;
    LDA.W #$0001                                                         ;A39E94;
    STA.W EnemyData.instTimer,X                                          ;A39E97;
    STZ.W EnemyData.loopCounter,X                                        ;A39E9A;
    RTS                                                                  ;A39E9D;


SetPlatformInstList_VerticallyStill_MovingRight:
    LDX.W $0E54                                                          ;A39E9E;
    LDY.W #InstList_Tripper_VerticallyStill_Left_0                       ;A39EA1;
    LDA.L $7E783E,X                                                      ;A39EA4;
    BPL .Tripper                                                         ;A39EA8;
    LDY.W #InstList_Kamer2_VerticallyStill_Right_0                       ;A39EAA;

.Tripper:
    TYA                                                                  ;A39EAD;
    STA.W EnemyData.pInstList,X                                          ;A39EAE;
    LDA.W #$0001                                                         ;A39EB1;
    STA.W EnemyData.instTimer,X                                          ;A39EB4;
    STZ.W EnemyData.loopCounter,X                                        ;A39EB7;
    RTS                                                                  ;A39EBA;


SetPlatformInstList_VerticallyMoving:
    LDX.W $0E54                                                          ;A39EBB;
    LDA.L $7E7806,X                                                      ;A39EBE;
    BNE .merge                                                           ;A39EC2;
    LDA.W #$0001                                                         ;A39EC4;
    STA.L $7E7806,X                                                      ;A39EC7;
    LDA.L $7E7804,X                                                      ;A39ECB;
    BEQ .movingLeft                                                      ;A39ECF;
    JSR.W SetPlatformInstList_VerticallyMoving_MovingRight               ;A39ED1;
    BRA .merge                                                           ;A39ED4;


.movingLeft:
    JSR.W SetPlatformInstList_VerticallyMoving_MovingLeft                ;A39ED6;

.merge:
    LDA.W #$0000                                                         ;A39ED9;
    STA.L $7E7808,X                                                      ;A39EDC;
    RTS                                                                  ;A39EE0;


SetPlatformInstList_VerticallyStill:
    LDX.W $0E54                                                          ;A39EE1;
    LDA.L $7E7808,X                                                      ;A39EE4;
    BNE .merge                                                           ;A39EE8;
    LDA.W #$0001                                                         ;A39EEA;
    STA.L $7E7808,X                                                      ;A39EED;
    LDA.L $7E7804,X                                                      ;A39EF1;
    BEQ .movingLeft                                                      ;A39EF5;
    JSR.W SetPlatformInstList_VerticallyStill_MovingRight                ;A39EF7;
    BRA .merge                                                           ;A39EFA;


.movingLeft:
    JSR.W SetPlatformInstList_VerticallyStill_MovingLeft                 ;A39EFC;

.merge:
    LDA.W #$0000                                                         ;A39EFF;
    STA.L $7E7806,X                                                      ;A39F02;
    RTS                                                                  ;A39F06;


RTL_A39F07:
    RTL                                                                  ;A39F07;


EnemyShot_Tripper:
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A39F08;
    LDX.W $0E54                                                          ;A39F0C;
    LDA.W EnemyData.freezeTimer,X                                        ;A39F0F;
    BEQ .return                                                          ;A39F12;
    LDA.L $7E7804,X                                                      ;A39F14;
    BEQ .movingLeft                                                      ;A39F18;
    LDA.W #Spritemap_Tripper_Frozen_MovingRight                          ;A39F1A;
    STA.W EnemyData.pSpritemap,X                                         ;A39F1D;
    BRA .return                                                          ;A39F20;


.movingLeft:
    LDA.W #Spritemap_Tripper_Frozen_MovingLeft                           ;A39F22;
    STA.W EnemyData.pSpritemap,X                                         ;A39F25;

.return:
    RTL                                                                  ;A39F28;


Spritemap_Tripper_VerticallyMoving_Left_0:
    dw $0003,$01F9                                                       ;A39F29;
    db $08                                                               ;A39F2D;
    dw $210E,$C200                                                       ;A39F2E;
    db $F8                                                               ;A39F32;
    dw $2102,$C3F0                                                       ;A39F33;
    db $F8                                                               ;A39F37;
    dw $2100                                                             ;A39F38;

Spritemap_Tripper_VerticallyMoving_Left_1:
    dw $0003,$C200                                                       ;A39F3A;
    db $F8                                                               ;A39F3E;
    dw $2102,$01F9                                                       ;A39F3F;
    db $08                                                               ;A39F43;
    dw $210F,$C3F0                                                       ;A39F44;
    db $F8                                                               ;A39F48;
    dw $2108                                                             ;A39F49;

Spritemap_Tripper_VerticallyMoving_Left_2:
    dw $0003,$C200                                                       ;A39F4B;
    db $F8                                                               ;A39F4F;
    dw $2102,$01F9                                                       ;A39F50;
    db $08                                                               ;A39F54;
    dw $210F,$C3F0                                                       ;A39F55;
    db $F8                                                               ;A39F59;
    dw $2104                                                             ;A39F5A;

Spritemap_Tripper_VerticallyMoving_Right_0:
    dw $0003,$01FF                                                       ;A39F5C;
    db $08                                                               ;A39F60;
    dw $610E,$C3F0                                                       ;A39F61;
    db $F8                                                               ;A39F65;
    dw $6102,$C200                                                       ;A39F66;
    db $F8                                                               ;A39F6A;
    dw $6100                                                             ;A39F6B;

Spritemap_Tripper_VerticallyMoving_Right_1:
    dw $0003,$C3F0                                                       ;A39F6D;
    db $F8                                                               ;A39F71;
    dw $6102,$01FF                                                       ;A39F72;
    db $08                                                               ;A39F76;
    dw $610F,$C200                                                       ;A39F77;
    db $F8                                                               ;A39F7B;
    dw $6108                                                             ;A39F7C;

Spritemap_Tripper_VerticallyMoving_Right_2:
    dw $0003,$C3F0                                                       ;A39F7E;
    db $F8                                                               ;A39F82;
    dw $6102,$01FF                                                       ;A39F83;
    db $08                                                               ;A39F87;
    dw $610F,$C200                                                       ;A39F88;
    db $F8                                                               ;A39F8C;
    dw $6104                                                             ;A39F8D;

Spritemap_Tripper_VerticallyStill_Right_0:
    dw $0004,$C200                                                       ;A39F8F;
    db $F8                                                               ;A39F93;
    dw $2102,$000B                                                       ;A39F94;
    db $02                                                               ;A39F98;
    dw $211D,$0003                                                       ;A39F99;
    db $02                                                               ;A39F9D;
    dw $211C,$C3F0                                                       ;A39F9E;
    db $F8                                                               ;A39FA2;
    dw $2100                                                             ;A39FA3;

Spritemap_Tripper_VerticallyStill_Right_1:
    dw $0003,$C200                                                       ;A39FA5;
    db $F8                                                               ;A39FA9;
    dw $2102,$0002                                                       ;A39FAA;
    db $02                                                               ;A39FAE;
    dw $211E,$C3F0                                                       ;A39FAF;
    db $F8                                                               ;A39FB3;
    dw $2104                                                             ;A39FB4;

Spritemap_Tripper_VerticallyStill_Right_2:
    dw $0004,$C200                                                       ;A39FB6;
    db $F8                                                               ;A39FBA;
    dw $2102,$000B                                                       ;A39FBB;
    db $02                                                               ;A39FBF;
    dw $210D,$0003                                                       ;A39FC0;
    db $02                                                               ;A39FC4;
    dw $210C,$C3F0                                                       ;A39FC5;
    db $F8                                                               ;A39FC9;
    dw $2108                                                             ;A39FCA;

Spritemap_Tripper_VerticallyStill_Left_0:
    dw $0004,$C3F0                                                       ;A39FCC;
    db $F8                                                               ;A39FD0;
    dw $6102,$01ED                                                       ;A39FD1;
    db $02                                                               ;A39FD5;
    dw $611D,$01F5                                                       ;A39FD6;
    db $02                                                               ;A39FDA;
    dw $611C,$C200                                                       ;A39FDB;
    db $F8                                                               ;A39FDF;
    dw $6100                                                             ;A39FE0;

Spritemap_Tripper_VerticallyStill_Left_1:
    dw $0003,$C3F0                                                       ;A39FE2;
    db $F8                                                               ;A39FE6;
    dw $6102,$01F6                                                       ;A39FE7;
    db $02                                                               ;A39FEB;
    dw $611E,$C200                                                       ;A39FEC;
    db $F8                                                               ;A39FF0;
    dw $6104                                                             ;A39FF1;

Spritemap_Tripper_VerticallyStill_Left_2:
    dw $0004,$C3F0                                                       ;A39FF3;
    db $F8                                                               ;A39FF7;
    dw $6102,$01ED                                                       ;A39FF8;
    db $02                                                               ;A39FFC;
    dw $610D,$01F5                                                       ;A39FFD;
    db $02                                                               ;A3A001;
    dw $610C,$C200                                                       ;A3A002;
    db $F8                                                               ;A3A006;
    dw $6108                                                             ;A3A007;

Spritemap_Tripper_Frozen_MovingLeft:
    dw $0002,$8000                                                       ;A3A009;
    db $F8                                                               ;A3A00D;
    dw $2102,$81F0                                                       ;A3A00E;
    db $F8                                                               ;A3A012;
    dw $2108                                                             ;A3A013;

Spritemap_Tripper_Frozen_MovingRight:
    dw $0002,$81F0                                                       ;A3A015;
    db $F8                                                               ;A3A019;
    dw $6102,$8000                                                       ;A3A01A;
    db $F8                                                               ;A3A01E;
    dw $6108                                                             ;A3A01F;

Spritemap_Kamer2_0:
    dw $0002,$8000                                                       ;A3A021;
    db $F8                                                               ;A3A025;
    dw $6100,$81F0                                                       ;A3A026;
    db $F8                                                               ;A3A02A;
    dw $2100                                                             ;A3A02B;

Spritemap_Kamer2_1:
    dw $0002,$8000                                                       ;A3A02D;
    db $F8                                                               ;A3A031;
    dw $6102,$81F0                                                       ;A3A032;
    db $F8                                                               ;A3A036;
    dw $2102                                                             ;A3A037;

Spritemap_Kamer2_2:
    dw $0002,$8000                                                       ;A3A039;
    db $F8                                                               ;A3A03D;
    dw $6104,$81F0                                                       ;A3A03E;
    db $F8                                                               ;A3A042;
    dw $2104                                                             ;A3A043;

Spritemap_Kamer2_3:
    dw $0002,$8000                                                       ;A3A045;
    db $F8                                                               ;A3A049;
    dw $6106,$81F0                                                       ;A3A04A;
    db $F8                                                               ;A3A04E;
    dw $2106                                                             ;A3A04F;

Palette_Sbug:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A3A051;
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1                   ;A3A061;

InstList_Sbug_FacingUp:
    dw $0005                                                             ;A3A071;
    dw Spritemap_Sbug_FacingUp_0                                         ;A3A073;
    dw $0005                                                             ;A3A075;
    dw Spritemap_Sbug_FacingUp_1                                         ;A3A077;
    dw $0005                                                             ;A3A079;
    dw Spritemap_Sbug_FacingUp_0                                         ;A3A07B;
    dw $0005                                                             ;A3A07D;
    dw Spritemap_Sbug_FacingUp_2                                         ;A3A07F;
    dw Instruction_Common_GotoY                                          ;A3A081;
    dw InstList_Sbug_FacingUp                                            ;A3A083;

InstList_Sbug_FacingUpLeft:
    dw $0005                                                             ;A3A085;
    dw Spritemap_Sbug_FacingUpLeft_0                                     ;A3A087;
    dw $0005                                                             ;A3A089;
    dw Spritemap_Sbug_FacingUpLeft_1                                     ;A3A08B;
    dw $0005                                                             ;A3A08D;
    dw Spritemap_Sbug_FacingUpLeft_0                                     ;A3A08F;
    dw $0005                                                             ;A3A091;
    dw Spritemap_Sbug_FacingUpLeft_2                                     ;A3A093;
    dw Instruction_Common_GotoY                                          ;A3A095;
    dw InstList_Sbug_FacingUpLeft                                        ;A3A097;

InstList_Sbug_FacingLeft:
    dw $0005                                                             ;A3A099;
    dw Spritemap_Sbug_FacingLeft_0                                       ;A3A09B;
    dw $0005                                                             ;A3A09D;
    dw Spritemap_Sbug_FacingLeft_1                                       ;A3A09F;
    dw $0005                                                             ;A3A0A1;
    dw Spritemap_Sbug_FacingLeft_0                                       ;A3A0A3;
    dw $0005                                                             ;A3A0A5;
    dw Spritemap_Sbug_FacingLeft_2                                       ;A3A0A7;
    dw Instruction_Common_GotoY                                          ;A3A0A9;
    dw InstList_Sbug_FacingLeft                                          ;A3A0AB;

InstList_Sbug_FacingDownLeft:
    dw $0005                                                             ;A3A0AD;
    dw Spritemap_Sbug_FacingDownLeft_0                                   ;A3A0AF;
    dw $0005                                                             ;A3A0B1;
    dw Spritemap_Sbug_FacingDownLeft_1                                   ;A3A0B3;
    dw $0005                                                             ;A3A0B5;
    dw Spritemap_Sbug_FacingDownLeft_0                                   ;A3A0B7;
    dw $0005                                                             ;A3A0B9;
    dw Spritemap_Sbug_FacingDownLeft_2                                   ;A3A0BB;
    dw Instruction_Common_GotoY                                          ;A3A0BD;
    dw InstList_Sbug_FacingDownLeft                                      ;A3A0BF;

InstList_Sbug_FacingDown:
    dw $0005                                                             ;A3A0C1;
    dw Spritemap_Sbug_FacingDown_0                                       ;A3A0C3;
    dw $0005                                                             ;A3A0C5;
    dw Spritemap_Sbug_FacingDown_1                                       ;A3A0C7;
    dw $0005                                                             ;A3A0C9;
    dw Spritemap_Sbug_FacingDown_0                                       ;A3A0CB;
    dw $0005                                                             ;A3A0CD;
    dw Spritemap_Sbug_FacingDown_2                                       ;A3A0CF;
    dw Instruction_Common_GotoY                                          ;A3A0D1;
    dw InstList_Sbug_FacingDown                                          ;A3A0D3;

InstList_Sbug_FacingDownRight:
    dw $0005                                                             ;A3A0D5;
    dw Spritemap_Sbug_FacingDownRight_0                                  ;A3A0D7;
    dw $0005                                                             ;A3A0D9;
    dw Spritemap_Sbug_FacingDownRight_1                                  ;A3A0DB;
    dw $0005                                                             ;A3A0DD;
    dw Spritemap_Sbug_FacingDownRight_0                                  ;A3A0DF;
    dw $0005                                                             ;A3A0E1;
    dw Spritemap_Sbug_FacingDownRight_2                                  ;A3A0E3;
    dw Instruction_Common_GotoY                                          ;A3A0E5;
    dw InstList_Sbug_FacingDownRight                                     ;A3A0E7;

InstList_Sbug_FacingRight:
    dw $0005                                                             ;A3A0E9;
    dw Spritemap_Sbug_FacingRight_0                                      ;A3A0EB;
    dw $0005                                                             ;A3A0ED;
    dw Spritemap_Sbug_FacingRight_1                                      ;A3A0EF;
    dw $0005                                                             ;A3A0F1;
    dw Spritemap_Sbug_FacingRight_0                                      ;A3A0F3;
    dw $0005                                                             ;A3A0F5;
    dw Spritemap_Sbug_FacingRight_2                                      ;A3A0F7;
    dw Instruction_Common_GotoY                                          ;A3A0F9;
    dw InstList_Sbug_FacingRight                                         ;A3A0FB;

InstList_Sbug_FacingUpRight:
    dw $0005                                                             ;A3A0FD;
    dw Spritemap_Sbug_FacingUpRight_0                                    ;A3A0FF;
    dw $0005                                                             ;A3A101;
    dw Spritemap_Sbug_FacingUpRight_1                                    ;A3A103;
    dw $0005                                                             ;A3A105;
    dw Spritemap_Sbug_FacingUpRight_0                                    ;A3A107;
    dw $0005                                                             ;A3A109;
    dw Spritemap_Sbug_FacingUpRight_2                                    ;A3A10B;
    dw Instruction_Common_GotoY                                          ;A3A10D;
    dw InstList_Sbug_FacingUpRight                                       ;A3A10F;

InstListPointers_Sbug:
    dw InstList_Sbug_FacingUp                                            ;A3A111;
    dw InstList_Sbug_FacingUpLeft                                        ;A3A113;
    dw InstList_Sbug_FacingLeft                                          ;A3A115;
    dw InstList_Sbug_FacingDownLeft                                      ;A3A117;
    dw InstList_Sbug_FacingDown                                          ;A3A119;
    dw InstList_Sbug_FacingDownRight                                     ;A3A11B;
    dw InstList_Sbug_FacingRight                                         ;A3A11D;
    dw InstList_Sbug_FacingUpRight                                       ;A3A11F;

ActivateFunctionPointers_Sbug:
    dw Function_Sbug_Activate_0_MoveForwards                             ;A3A121;
    dw Function_Sbug_Activate_1_MoveForwardsInAZigZag                    ;A3A123;
    dw Function_Sbug_Activate_2_MoveAlong45DegreeAngleTowardsSamus       ;A3A125;
    dw Function_Sbug_Activate_3_MoveRandomly_WaitForSamusIfHitBlock      ;A3A127;
    dw Function_Sbug_Activate_4_MoveRandomly_ReverseUntil6BlockAway      ;A3A129;
    dw Function_Sbug_Activate_5_MoveForwards_WaitForSamus                ;A3A12B;
    dw Function_Sbug_Activate_6_MoveAlong45DegreeAngleAwayFromSamus      ;A3A12D;

SetSbugInstList:
    LDX.W $0E54                                                          ;A3A12F;
    LDA.L $7E8008,X                                                      ;A3A132;
    CMP.L $7E800A,X                                                      ;A3A136;
    BEQ .return                                                          ;A3A13A;
    STA.L $7E800A,X                                                      ;A3A13C;
    STA.W EnemyData.pInstList,X                                          ;A3A140;
    LDA.W #$0001                                                         ;A3A143;
    STA.W EnemyData.instTimer,X                                          ;A3A146;
    STZ.W EnemyData.loopCounter,X                                        ;A3A149;

.return:
    RTS                                                                  ;A3A14C;


InitAI_Sbug:
    LDX.W $0E54                                                          ;A3A14D;
    LDA.W #$0000                                                         ;A3A150;
    STA.L $7E800A,X                                                      ;A3A153;
    STA.L $7E8008,X                                                      ;A3A157;
    JSR.W CalculateMovingForwardSpeeds                                   ;A3A15B;
    JSR.W CalculateMovingLeftVelocities                                  ;A3A15E;
    JSR.W CalculateMovingRightVelocities                                 ;A3A161;
    JSR.W DetermineFacingForwardInstListIndex                            ;A3A164;
    JSR.W DetermineFacingLeftInstListIndex                               ;A3A167;
    JSR.W DetermineFacingRightInstListIndex                              ;A3A16A;
    LDA.L $7E8000,X                                                      ;A3A16D;
    TAY                                                                  ;A3A171;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A172;
    STA.L $7E8008,X                                                      ;A3A175;
    JSR.W SetSbugInstList                                                ;A3A179;
    LDA.W #Function_Sbug_WaitForSamusToGetNear                           ;A3A17C;
    STA.W EnemyData.work1,X                                              ;A3A17F;
    RTL                                                                  ;A3A182;


CalculateMovingForwardSpeeds:
    LDA.W EnemyData.initParam0,X                                         ;A3A183;
    AND.W #$00FF                                                         ;A3A186;
    STA.B $14                                                            ;A3A189;
    LDA.W EnemyData.initParam0+1,X                                       ;A3A18B;
    AND.W #$00FF                                                         ;A3A18E;
    STA.B $12                                                            ;A3A191;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A3A193; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16                                                            ;A3A197;
    STA.L $7E7802,X                                                      ;A3A199;
    LDA.B $18                                                            ;A3A19D;
    STA.L $7E7800,X                                                      ;A3A19F;
    LDA.B $1A                                                            ;A3A1A3;
    STA.L $7E7806,X                                                      ;A3A1A5;
    LDA.B $1C                                                            ;A3A1A9;
    STA.L $7E7804,X                                                      ;A3A1AB;
    RTS                                                                  ;A3A1AF;


UNUSED_CalculateMovingForwardVelocities_A3A1B0:
    LDA.W EnemyData.initParam0,X                                         ;A3A1B0;
    AND.W #$00FF                                                         ;A3A1B3;
    STA.W $0E32                                                          ;A3A1B6;
    LDA.W EnemyData.initParam0+1,X                                       ;A3A1B9;
    AND.W #$00FF                                                         ;A3A1BC;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A3A1BF;
    LDA.W $0E36                                                          ;A3A1C3;
    STA.L $7E7802,X                                                      ;A3A1C6;
    LDA.W $0E38                                                          ;A3A1CA;
    STA.L $7E7800,X                                                      ;A3A1CD;
    LDA.W EnemyData.initParam0,X                                         ;A3A1D1;
    AND.W #$00FF                                                         ;A3A1D4;
    STA.W $0E32                                                          ;A3A1D7;
    LDA.W EnemyData.initParam0+1,X                                       ;A3A1DA;
    AND.W #$00FF                                                         ;A3A1DD;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A3A1E0;
    LDA.W $0E36                                                          ;A3A1E4;
    STA.L $7E7806,X                                                      ;A3A1E7;
    LDA.W $0E38                                                          ;A3A1EB;
    STA.L $7E7804,X                                                      ;A3A1EE;
    RTS                                                                  ;A3A1F2;


CalculateMovingLeftVelocities:
    LDA.W EnemyData.initParam0,X                                         ;A3A1F3;
    AND.W #$00FF                                                         ;A3A1F6;
    STA.W $0E32                                                          ;A3A1F9;
    LDA.W EnemyData.initParam0+1,X                                       ;A3A1FC;
    SEC                                                                  ;A3A1FF;
    SBC.W #$0020                                                         ;A3A200;
    AND.W #$00FF                                                         ;A3A203;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A3A206;
    LDA.W $0E36                                                          ;A3A20A;
    STA.L $7E780A,X                                                      ;A3A20D;
    LDA.W $0E38                                                          ;A3A211;
    STA.L $7E7808,X                                                      ;A3A214;
    LDA.W EnemyData.initParam0,X                                         ;A3A218;
    AND.W #$00FF                                                         ;A3A21B;
    STA.W $0E32                                                          ;A3A21E;
    LDA.W EnemyData.initParam0+1,X                                       ;A3A221;
    SEC                                                                  ;A3A224;
    SBC.W #$0020                                                         ;A3A225;
    AND.W #$00FF                                                         ;A3A228;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A3A22B;
    LDA.W $0E36                                                          ;A3A22F;
    STA.L $7E780E,X                                                      ;A3A232;
    LDA.W $0E38                                                          ;A3A236;
    STA.L $7E780C,X                                                      ;A3A239;
    RTS                                                                  ;A3A23D;


CalculateMovingRightVelocities:
    LDA.W EnemyData.initParam0,X                                         ;A3A23E;
    AND.W #$00FF                                                         ;A3A241;
    STA.W $0E32                                                          ;A3A244;
    LDA.W EnemyData.initParam0+1,X                                       ;A3A247;
    CLC                                                                  ;A3A24A;
    ADC.W #$0020                                                         ;A3A24B;
    AND.W #$00FF                                                         ;A3A24E;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A3A251;
    LDA.W $0E36                                                          ;A3A255;
    STA.L $7E7812,X                                                      ;A3A258;
    LDA.W $0E38                                                          ;A3A25C;
    STA.L $7E7810,X                                                      ;A3A25F;
    LDA.W EnemyData.initParam0,X                                         ;A3A263;
    AND.W #$00FF                                                         ;A3A266;
    STA.W $0E32                                                          ;A3A269;
    LDA.W EnemyData.initParam0+1,X                                       ;A3A26C;
    CLC                                                                  ;A3A26F;
    ADC.W #$0020                                                         ;A3A270;
    AND.W #$00FF                                                         ;A3A273;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A3A276;
    LDA.W $0E36                                                          ;A3A27A;
    STA.L $7E7816,X                                                      ;A3A27D;
    LDA.W $0E38                                                          ;A3A281;
    STA.L $7E7814,X                                                      ;A3A284;
    RTS                                                                  ;A3A288;


DetermineFacingForwardInstListIndex:
    LDA.W EnemyData.initParam0+1,X                                       ;A3A289;
    SEC                                                                  ;A3A28C;
    SBC.W #$0030                                                         ;A3A28D;
    AND.W #$00FF                                                         ;A3A290;
    LSR A                                                                ;A3A293;
    LSR A                                                                ;A3A294;
    LSR A                                                                ;A3A295;
    LSR A                                                                ;A3A296;
    LSR A                                                                ;A3A297;
    ASL A                                                                ;A3A298;
    STA.L $7E8000,X                                                      ;A3A299;
    RTS                                                                  ;A3A29D;


DetermineFacingLeftInstListIndex:
    LDA.W EnemyData.initParam0+1,X                                       ;A3A29E;
    SEC                                                                  ;A3A2A1;
    SBC.W #$0030                                                         ;A3A2A2;
    SEC                                                                  ;A3A2A5;
    SBC.W #$0020                                                         ;A3A2A6;
    AND.W #$00FF                                                         ;A3A2A9;
    LSR A                                                                ;A3A2AC;
    LSR A                                                                ;A3A2AD;
    LSR A                                                                ;A3A2AE;
    LSR A                                                                ;A3A2AF;
    LSR A                                                                ;A3A2B0;
    ASL A                                                                ;A3A2B1;
    STA.L $7E8002,X                                                      ;A3A2B2;
    RTS                                                                  ;A3A2B6;


DetermineFacingRightInstListIndex:
    LDA.W EnemyData.initParam0+1,X                                       ;A3A2B7;
    SEC                                                                  ;A3A2BA;
    SBC.W #$0030                                                         ;A3A2BB;
    CLC                                                                  ;A3A2BE;
    ADC.W #$0020                                                         ;A3A2BF;
    AND.W #$00FF                                                         ;A3A2C2;
    LSR A                                                                ;A3A2C5;
    LSR A                                                                ;A3A2C6;
    LSR A                                                                ;A3A2C7;
    LSR A                                                                ;A3A2C8;
    LSR A                                                                ;A3A2C9;
    ASL A                                                                ;A3A2CA;
    STA.L $7E8004,X                                                      ;A3A2CB;
    RTS                                                                  ;A3A2CF;


MainAI_Sbug:
    LDX.W $0E54                                                          ;A3A2D0;
    JSR.W ($0FAA,X)                                                      ;A3A2D3;
    RTL                                                                  ;A3A2D6;


Function_Sbug_WaitForSamusToGetNear:
    LDX.W $0E54                                                          ;A3A2D7;
    LDA.W EnemyData.initParam1,X                                         ;A3A2DA;
    AND.W #$00FF                                                         ;A3A2DD;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A3A2E0;
    BEQ .return                                                          ;A3A2E4;
    LDA.W EnemyData.initParam1,X                                         ;A3A2E6;
    AND.W #$00FF                                                         ;A3A2E9;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A3A2EC;
    BEQ .return                                                          ;A3A2F0;
    LDA.W EnemyData.initParam1+1,X                                       ;A3A2F2;
    AND.W #$00FF                                                         ;A3A2F5;
    ASL A                                                                ;A3A2F8;
    TAY                                                                  ;A3A2F9;
    LDA.W ActivateFunctionPointers_Sbug,Y                                ;A3A2FA;
    STA.W EnemyData.work1,X                                              ;A3A2FD;

.return:
    RTS                                                                  ;A3A300;


Function_Sbug_Activate_0_MoveForwards:
    LDX.W $0E54                                                          ;A3A301;
    LDA.W #Function_Sbug_Activated_0_MoveForwards                        ;A3A304;
    STA.W EnemyData.work1,X                                              ;A3A307;
    RTS                                                                  ;A3A30A;


Function_Sbug_Activate_1_MoveForwardsInAZigZag:
    LDX.W $0E54                                                          ;A3A30B;
    LDA.W #Function_Sbug_Activated_1_MoveForwardsInAZigZag               ;A3A30E;
    STA.W EnemyData.work1,X                                              ;A3A311;
    RTS                                                                  ;A3A314;


Function_Sbug_Activate_3_MoveRandomly_WaitForSamusIfHitBlock:
    LDX.W $0E54                                                          ;A3A315;
    LDA.W #$000B                                                         ;A3A318;
    STA.W $05E5                                                          ;A3A31B;
    LDA.W #Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock ;A3A31E;
    STA.W EnemyData.work1,X                                              ;A3A321;
    RTS                                                                  ;A3A324;


Function_Sbug_Activate_4_MoveRandomly_ReverseUntil6BlockAway:
    LDX.W $0E54                                                          ;A3A325;
    LDA.W #$0200                                                         ;A3A328;
    STA.W EnemyData.work0,X                                              ;A3A32B;
    LDA.W #$000B                                                         ;A3A32E;
    STA.W $05E5                                                          ;A3A331;
    LDA.W #Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway ;A3A334;
    STA.W EnemyData.work1,X                                              ;A3A337;
    RTS                                                                  ;A3A33A;


Function_Sbug_Activate_5_MoveForwards_WaitForSamus:
    LDX.W $0E54                                                          ;A3A33B;
    LDA.W #$0020                                                         ;A3A33E;
    STA.W EnemyData.work5,X                                              ;A3A341;
    LDA.W #Function_Sbug_Activated_5_MoveForwards_WaitForSamus           ;A3A344;
    STA.W EnemyData.work1,X                                              ;A3A347;
    RTS                                                                  ;A3A34A;


Function_Sbug_Activate_2_MoveAlong45DegreeAngleTowardsSamus:
    LDX.W $0E54                                                          ;A3A34B;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A3A34E;
    SEC                                                                  ;A3A352;
    SBC.W #$0040                                                         ;A3A353;
    EOR.W #$FFFF                                                         ;A3A356;
    INC A                                                                ;A3A359;
    CLC                                                                  ;A3A35A;
    ADC.W #$0100                                                         ;A3A35B;
    AND.W #$00FF                                                         ;A3A35E;
    STA.W EnemyData.work2,X                                              ;A3A361;
    JSR.W CalculateCustomVelocities                                      ;A3A364;
    JSR.W DetermineCustomInstListIndex                                   ;A3A367;
    LDA.L $7E8006,X                                                      ;A3A36A;
    TAY                                                                  ;A3A36E;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A36F;
    STA.L $7E8008,X                                                      ;A3A372;
    JSR.W SetSbugInstList                                                ;A3A376;
    LDA.W #Function_Sbug_Activated_2_MoveAlong45DegreeAngleTowardsSamus  ;A3A379;
    STA.W EnemyData.work1,X                                              ;A3A37C;
    RTS                                                                  ;A3A37F;


Function_Sbug_Activate_6_MoveAlong45DegreeAngleAwayFromSamus:
    LDX.W $0E54                                                          ;A3A380;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A3A383;
    SEC                                                                  ;A3A387;
    SBC.W #$0040                                                         ;A3A388;
    EOR.W #$FFFF                                                         ;A3A38B;
    INC A                                                                ;A3A38E;
    CLC                                                                  ;A3A38F;
    ADC.W #$0080                                                         ;A3A390;
    AND.W #$00FF                                                         ;A3A393;
    STA.W EnemyData.work2,X                                              ;A3A396;
    JSR.W CalculateCustomVelocities                                      ;A3A399;
    JSR.W DetermineCustomInstListIndex                                   ;A3A39C;
    LDA.L $7E8006,X                                                      ;A3A39F;
    TAY                                                                  ;A3A3A3;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A3A4;
    STA.L $7E8008,X                                                      ;A3A3A7;
    JSR.W SetSbugInstList                                                ;A3A3AB;
    LDA.W #Function_Sbug_Activated_6_MoveAlong45DegAngleAwayFromSamus    ;A3A3AE;
    STA.W EnemyData.work1,X                                              ;A3A3B1;
    RTS                                                                  ;A3A3B4;


DetermineCustomInstListIndex:
    LDA.W EnemyData.work2,X                                              ;A3A3B5;
    SEC                                                                  ;A3A3B8;
    SBC.W #$0030                                                         ;A3A3B9;
    AND.W #$00FF                                                         ;A3A3BC;
    LSR A                                                                ;A3A3BF;
    LSR A                                                                ;A3A3C0;
    LSR A                                                                ;A3A3C1;
    LSR A                                                                ;A3A3C2;
    LSR A                                                                ;A3A3C3;
    ASL A                                                                ;A3A3C4;
    STA.L $7E8006,X                                                      ;A3A3C5;
    RTS                                                                  ;A3A3C9;


CalculateCustomVelocities:
    LDA.W EnemyData.initParam0,X                                         ;A3A3CA;
    AND.W #$00FF                                                         ;A3A3CD;
    STA.W $0E32                                                          ;A3A3D0;
    LDA.W EnemyData.work2,X                                              ;A3A3D3;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A3A3D6;
    LDA.W $0E36                                                          ;A3A3DA;
    STA.L $7E781A,X                                                      ;A3A3DD;
    LDA.W $0E38                                                          ;A3A3E1;
    STA.L $7E7818,X                                                      ;A3A3E4;
    LDA.W EnemyData.initParam0,X                                         ;A3A3E8;
    AND.W #$00FF                                                         ;A3A3EB;
    STA.W $0E32                                                          ;A3A3EE;
    LDA.W EnemyData.work2,X                                              ;A3A3F1;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A3A3F4;
    LDA.W $0E36                                                          ;A3A3F8;
    STA.L $7E781E,X                                                      ;A3A3FB;
    LDA.W $0E38                                                          ;A3A3FF;
    STA.L $7E781C,X                                                      ;A3A402;
    RTS                                                                  ;A3A406;


Function_Sbug_Activated_0_MoveForwards:
    LDX.W $0E54                                                          ;A3A407;
    JSR.W MoveSbugForward                                                ;A3A40A;
    RTS                                                                  ;A3A40D;


Function_Sbug_Activated_1_MoveForwardsInAZigZag:
    LDX.W $0E54                                                          ;A3A40E;
    LDA.W EnemyData.frameCounter,X                                       ;A3A411;
    AND.W #$0010                                                         ;A3A414;
    BNE .right                                                           ;A3A417;
    LDA.L $7E8002,X                                                      ;A3A419;
    TAY                                                                  ;A3A41D;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A41E;
    STA.L $7E8008,X                                                      ;A3A421;
    JSR.W SetSbugInstList                                                ;A3A425;
    JSR.W MoveSbugLeft                                                   ;A3A428;
    BRA .return                                                          ;A3A42B;


.right:
    LDA.L $7E8004,X                                                      ;A3A42D;
    TAY                                                                  ;A3A431;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A432;
    STA.L $7E8008,X                                                      ;A3A435;
    JSR.W SetSbugInstList                                                ;A3A439;
    JSR.W MoveSbugRight                                                  ;A3A43C;

.return:
    RTS                                                                  ;A3A43F;


Function_Sbug_Activated_2_MoveAlong45DegreeAngleTowardsSamus:
    LDX.W $0E54                                                          ;A3A440;
    JSR.W MoveSbugAlongCustomAngle                                       ;A3A443;
    RTS                                                                  ;A3A446;


Function_Sbug_Activated_6_MoveAlong45DegAngleAwayFromSamus:
    LDX.W $0E54                                                          ;A3A447;
    JSR.W MoveSbugAlongCustomAngle                                       ;A3A44A;
    RTS                                                                  ;A3A44D;


Function_Sbug_Activated_5_MoveForwards_WaitForSamus:
    LDX.W $0E54                                                          ;A3A44E;
    DEC.W EnemyData.work5,X                                              ;A3A451;
    BMI .wait                                                            ;A3A454;
    JSR.W MoveSbugForward                                                ;A3A456;
    BRA .return                                                          ;A3A459;


.wait:
    LDA.W #Function_Sbug_WaitForSamusToGetNear                           ;A3A45B;
    STA.W EnemyData.work1,X                                              ;A3A45E;

.return:
    RTS                                                                  ;A3A461;


Function_Sbug_MoveAlongCustomAngle_WaitForSamusIfHitBlock:
    LDX.W $0E54                                                          ;A3A462;
    DEC.W EnemyData.work5,X                                              ;A3A465;
    BMI .timerExpired                                                    ;A3A468;
    JSR.W MoveSbugAlongCustomAngle_WaitForSamusIfHitBlock                ;A3A46A;
    BRA .return                                                          ;A3A46D;


.timerExpired:
    LDA.W #Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock ;A3A46F;
    STA.W EnemyData.work1,X                                              ;A3A472;

.return:
    RTS                                                                  ;A3A475;


Function_Sbug_MoveStraightAlongAngle_ReverseUntil6BlocksAway:
    LDX.W $0E54                                                          ;A3A476;
    DEC.W EnemyData.work0,X                                              ;A3A479;
    BMI .move                                                            ;A3A47C;
    DEC.W EnemyData.work5,X                                              ;A3A47E;
    BMI .done                                                            ;A3A481;
    LDA.W EnemyData.xPosition,X                                          ;A3A483;
    SEC                                                                  ;A3A486;
    SBC.W $0AF6                                                          ;A3A487;
    JSL.L NegateA_A0B067                                                 ;A3A48A;
    CMP.W #$0060                                                         ;A3A48E;
    BPL +                                                                ;A3A491;
    BRA .move                                                            ;A3A493;


  + LDA.W EnemyData.yPosition,X                                          ;A3A495;
    SEC                                                                  ;A3A498;
    SBC.W $0AFA                                                          ;A3A499;
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
    STA.W EnemyData.work1,X                                              ;A3A4B2;

.return:
    RTS                                                                  ;A3A4B5;


Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway:
    LDX.W $0E54                                                          ;A3A4B6;
    JSL.L GenerateRandomNumber                                           ;A3A4B9;
    AND.W #$00FF                                                         ;A3A4BD;
    SEC                                                                  ;A3A4C0;
    SBC.W #$0040                                                         ;A3A4C1;
    AND.W #$00FF                                                         ;A3A4C4;
    CLC                                                                  ;A3A4C7;
    ADC.W EnemyData.work2,X                                              ;A3A4C8;
    STA.W EnemyData.work2,X                                              ;A3A4CB;
    JSR.W CalculateCustomVelocities                                      ;A3A4CE;
    JSR.W DetermineCustomInstListIndex                                   ;A3A4D1;
    LDA.L $7E8006,X                                                      ;A3A4D4;
    TAY                                                                  ;A3A4D8;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A4D9;
    STA.L $7E8008,X                                                      ;A3A4DC;
    JSR.W SetSbugInstList                                                ;A3A4E0;
    LDA.W #$0020                                                         ;A3A4E3;
    STA.W EnemyData.work5,X                                              ;A3A4E6;
    LDA.W #Function_Sbug_MoveStraightAlongAngle_ReverseUntil6BlocksAway  ;A3A4E9;
    STA.W EnemyData.work1,X                                              ;A3A4EC;
    RTS                                                                  ;A3A4EF;


Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock:
    LDX.W $0E54                                                          ;A3A4F0;
    JSL.L GenerateRandomNumber                                           ;A3A4F3;
    AND.W #$00FF                                                         ;A3A4F7;
    SEC                                                                  ;A3A4FA;
    SBC.W #$0040                                                         ;A3A4FB;
    AND.W #$00FF                                                         ;A3A4FE;
    CLC                                                                  ;A3A501;
    ADC.W EnemyData.work2,X                                              ;A3A502;
    STA.W EnemyData.work2,X                                              ;A3A505;
    JSR.W CalculateCustomVelocities                                      ;A3A508;
    JSR.W DetermineCustomInstListIndex                                   ;A3A50B;
    LDA.L $7E8006,X                                                      ;A3A50E;
    TAY                                                                  ;A3A512;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A513;
    STA.L $7E8008,X                                                      ;A3A516;
    JSR.W SetSbugInstList                                                ;A3A51A;
    LDA.W #$0020                                                         ;A3A51D;
    STA.W EnemyData.work5,X                                              ;A3A520;
    LDA.W #Function_Sbug_MoveAlongCustomAngle_WaitForSamusIfHitBlock     ;A3A523;
    STA.W EnemyData.work1,X                                              ;A3A526;
    RTS                                                                  ;A3A529;


ReverseSbugCustomAngle:
    LDX.W $0E54                                                          ;A3A52A;
    LDA.L $7E781A,X                                                      ;A3A52D;
    EOR.W #$FFFF                                                         ;A3A531;
    INC A                                                                ;A3A534;
    STA.L $7E781A,X                                                      ;A3A535;
    LDA.L $7E7818,X                                                      ;A3A539;
    EOR.W #$FFFF                                                         ;A3A53D;
    INC A                                                                ;A3A540;
    STA.L $7E7818,X                                                      ;A3A541;
    LDA.L $7E781E,X                                                      ;A3A545;
    EOR.W #$FFFF                                                         ;A3A549;
    INC A                                                                ;A3A54C;
    STA.L $7E781E,X                                                      ;A3A54D;
    LDA.L $7E781C,X                                                      ;A3A551;
    EOR.W #$FFFF                                                         ;A3A555;
    INC A                                                                ;A3A558;
    STA.L $7E781C,X                                                      ;A3A559;
    LDA.L $7E8006,X                                                      ;A3A55D;
    CLC                                                                  ;A3A561;
    ADC.W #$0004                                                         ;A3A562;
    AND.W #$0007                                                         ;A3A565;
    STA.L $7E8006,X                                                      ;A3A568;
    TAY                                                                  ;A3A56C;
    LDA.W InstListPointers_Sbug,Y                                        ;A3A56D;
    STA.L $7E8008,X                                                      ;A3A570;
    JSR.W SetSbugInstList                                                ;A3A574;
    RTS                                                                  ;A3A577;


MoveSbugForward:
    LDA.L $7E7802,X                                                      ;A3A578;
    STA.W $0E24                                                          ;A3A57C;
    LDA.L $7E7800,X                                                      ;A3A57F;
    STA.W $0E26                                                          ;A3A583;
    LDA.L $7E7806,X                                                      ;A3A586;
    STA.W $0E28                                                          ;A3A58A;
    LDA.L $7E7804,X                                                      ;A3A58D;
    STA.W $0E2A                                                          ;A3A591;
    LDA.W EnemyData.initParam0+1,X                                       ;A3A594;
    AND.W #$00FF                                                         ;A3A597;
    STA.W $0E20                                                          ;A3A59A;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A3A59D;
    RTS                                                                  ;A3A5A1;


RTS_A3A5A2:
    RTS                                                                  ;A3A5A2;


MoveSbugLeft:
    LDA.W EnemyData.xPosition,X                                          ;A3A5A3;
    CLC                                                                  ;A3A5A6;
    ADC.L $7E780A,X                                                      ;A3A5A7;
    STA.W EnemyData.xPosition,X                                          ;A3A5AB;
    LDA.W EnemyData.xSubPosition,X                                       ;A3A5AE;
    CLC                                                                  ;A3A5B1;
    ADC.L $7E7808,X                                                      ;A3A5B2;
    BCC +                                                                ;A3A5B6;
    INC.W EnemyData.xPosition,X                                          ;A3A5B8;

  + STA.W EnemyData.xSubPosition,X                                       ;A3A5BB;
    LDA.W EnemyData.yPosition,X                                          ;A3A5BE;
    CLC                                                                  ;A3A5C1;
    ADC.L $7E780E,X                                                      ;A3A5C2;
    STA.W EnemyData.yPosition,X                                          ;A3A5C6;
    LDA.W EnemyData.ySubPosition,X                                       ;A3A5C9;
    CLC                                                                  ;A3A5CC;
    ADC.L $7E780C,X                                                      ;A3A5CD;
    BCC +                                                                ;A3A5D1;
    INC.W EnemyData.yPosition,X                                          ;A3A5D3;

  + STA.W EnemyData.ySubPosition,X                                       ;A3A5D6;
    RTS                                                                  ;A3A5D9;


MoveSbugRight:
    LDA.W EnemyData.xPosition,X                                          ;A3A5DA;
    CLC                                                                  ;A3A5DD;
    ADC.L $7E7812,X                                                      ;A3A5DE;
    STA.W EnemyData.xPosition,X                                          ;A3A5E2;
    LDA.W EnemyData.xSubPosition,X                                       ;A3A5E5;
    CLC                                                                  ;A3A5E8;
    ADC.L $7E7810,X                                                      ;A3A5E9;
    BCC +                                                                ;A3A5ED;
    INC.W EnemyData.xPosition,X                                          ;A3A5EF;

  + STA.W EnemyData.xSubPosition,X                                       ;A3A5F2;
    LDA.W EnemyData.yPosition,X                                          ;A3A5F5;
    CLC                                                                  ;A3A5F8;
    ADC.L $7E7816,X                                                      ;A3A5F9;
    STA.W EnemyData.yPosition,X                                          ;A3A5FD;
    LDA.W EnemyData.ySubPosition,X                                       ;A3A600;
    CLC                                                                  ;A3A603;
    ADC.L $7E7814,X                                                      ;A3A604;
    BCC +                                                                ;A3A608;
    INC.W EnemyData.yPosition,X                                          ;A3A60A;

  + STA.W EnemyData.ySubPosition,X                                       ;A3A60D;
    RTS                                                                  ;A3A610;


MoveSbugAlongCustomAngle:
    LDA.W EnemyData.xPosition,X                                          ;A3A611;
    CLC                                                                  ;A3A614;
    ADC.L $7E781A,X                                                      ;A3A615;
    STA.W EnemyData.xPosition,X                                          ;A3A619;
    LDA.W EnemyData.xSubPosition,X                                       ;A3A61C;
    CLC                                                                  ;A3A61F;
    ADC.L $7E7818,X                                                      ;A3A620;
    BCC +                                                                ;A3A624;
    INC.W EnemyData.xPosition,X                                          ;A3A626;

  + STA.W EnemyData.xSubPosition,X                                       ;A3A629;
    LDA.W EnemyData.yPosition,X                                          ;A3A62C;
    CLC                                                                  ;A3A62F;
    ADC.L $7E781E,X                                                      ;A3A630;
    STA.W EnemyData.yPosition,X                                          ;A3A634;
    LDA.W EnemyData.ySubPosition,X                                       ;A3A637;
    CLC                                                                  ;A3A63A;
    ADC.L $7E781C,X                                                      ;A3A63B;
    BCC +                                                                ;A3A63F;
    INC.W EnemyData.yPosition,X                                          ;A3A641;

  + STA.W EnemyData.ySubPosition,X                                       ;A3A644;
    RTS                                                                  ;A3A647;


MoveSbugAlongCustomAngle_WaitForSamusIfHitBlock:
    LDA.L $7E7818,X                                                      ;A3A648;
    STA.B $12                                                            ;A3A64C;
    LDA.L $7E781A,X                                                      ;A3A64E;
    STA.B $14                                                            ;A3A652;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3A654;
    BCC .notCollidedWithWall                                             ;A3A658;
    LDA.W #Function_Sbug_WaitForSamusToGetNear                           ;A3A65A;
    STA.W EnemyData.work1,X                                              ;A3A65D;
    BRA .return                                                          ;A3A660;


.notCollidedWithWall:
    LDA.L $7E781C,X                                                      ;A3A662;
    STA.B $12                                                            ;A3A666;
    LDA.L $7E781E,X                                                      ;A3A668;
    STA.B $14                                                            ;A3A66C;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3A66E;
    BCC .return                                                          ;A3A672;
    LDA.W #Function_Sbug_WaitForSamusToGetNear                           ;A3A674;
    STA.W EnemyData.work1,X                                              ;A3A677;

.return:
    RTS                                                                  ;A3A67A;


RTL_A3A67B:
    RTL                                                                  ;A3A67B;


RTL_A3A67C:
    RTL                                                                  ;A3A67C;


Spritemap_Sbug_FacingUp_0:
    dw $0001,$01FC                                                       ;A3A67D;
    db $FC                                                               ;A3A681;
    dw $3100                                                             ;A3A682;

Spritemap_Sbug_FacingUp_1:
    dw $0001,$01FC                                                       ;A3A684;
    db $FC                                                               ;A3A688;
    dw $3101                                                             ;A3A689;

Spritemap_Sbug_FacingUp_2:
    dw $0001,$01FC                                                       ;A3A68B;
    db $FC                                                               ;A3A68F;
    dw $3102                                                             ;A3A690;

Spritemap_Sbug_FacingUpLeft_0:
    dw $0001,$01FC                                                       ;A3A692;
    db $FC                                                               ;A3A696;
    dw $3103                                                             ;A3A697;

Spritemap_Sbug_FacingUpLeft_1:
    dw $0001,$01FC                                                       ;A3A699;
    db $FC                                                               ;A3A69D;
    dw $3104                                                             ;A3A69E;

Spritemap_Sbug_FacingUpLeft_2:
    dw $0001,$01FC                                                       ;A3A6A0;
    db $FC                                                               ;A3A6A4;
    dw $3105                                                             ;A3A6A5;

Spritemap_Sbug_FacingLeft_0:
    dw $0001,$01FC                                                       ;A3A6A7;
    db $FC                                                               ;A3A6AB;
    dw $3106                                                             ;A3A6AC;

Spritemap_Sbug_FacingLeft_1:
    dw $0001,$01FC                                                       ;A3A6AE;
    db $FC                                                               ;A3A6B2;
    dw $3107                                                             ;A3A6B3;

Spritemap_Sbug_FacingLeft_2:
    dw $0001,$01FC                                                       ;A3A6B5;
    db $FC                                                               ;A3A6B9;
    dw $3108                                                             ;A3A6BA;

Spritemap_Sbug_FacingDownLeft_0:
    dw $0001,$01FC                                                       ;A3A6BC;
    db $FC                                                               ;A3A6C0;
    dw $B103                                                             ;A3A6C1;

Spritemap_Sbug_FacingDownLeft_1:
    dw $0001,$01FC                                                       ;A3A6C3;
    db $FC                                                               ;A3A6C7;
    dw $B104                                                             ;A3A6C8;

Spritemap_Sbug_FacingDownLeft_2:
    dw $0001,$01FC                                                       ;A3A6CA;
    db $FC                                                               ;A3A6CE;
    dw $B105                                                             ;A3A6CF;

Spritemap_Sbug_FacingDown_0:
    dw $0001,$01FC                                                       ;A3A6D1;
    db $FC                                                               ;A3A6D5;
    dw $B100                                                             ;A3A6D6;

Spritemap_Sbug_FacingDown_1:
    dw $0001,$01FC                                                       ;A3A6D8;
    db $FC                                                               ;A3A6DC;
    dw $B101                                                             ;A3A6DD;

Spritemap_Sbug_FacingDown_2:
    dw $0001,$01FC                                                       ;A3A6DF;
    db $FC                                                               ;A3A6E3;
    dw $B102                                                             ;A3A6E4;

Spritemap_Sbug_FacingDownRight_0:
    dw $0001,$01FC                                                       ;A3A6E6;
    db $FC                                                               ;A3A6EA;
    dw $F103                                                             ;A3A6EB;

Spritemap_Sbug_FacingDownRight_1:
    dw $0001,$01FC                                                       ;A3A6ED;
    db $FC                                                               ;A3A6F1;
    dw $F104                                                             ;A3A6F2;

Spritemap_Sbug_FacingDownRight_2:
    dw $0001,$01FC                                                       ;A3A6F4;
    db $FC                                                               ;A3A6F8;
    dw $F105                                                             ;A3A6F9;

Spritemap_Sbug_FacingRight_0:
    dw $0001,$01FC                                                       ;A3A6FB;
    db $FC                                                               ;A3A6FF;
    dw $7106                                                             ;A3A700;

Spritemap_Sbug_FacingRight_1:
    dw $0001,$01FC                                                       ;A3A702;
    db $FC                                                               ;A3A706;
    dw $7107                                                             ;A3A707;

Spritemap_Sbug_FacingRight_2:
    dw $0001,$01FC                                                       ;A3A709;
    db $FC                                                               ;A3A70D;
    dw $7108                                                             ;A3A70E;

Spritemap_Sbug_FacingUpRight_0:
    dw $0001,$01FC                                                       ;A3A710;
    db $FC                                                               ;A3A714;
    dw $7103                                                             ;A3A715;

Spritemap_Sbug_FacingUpRight_1:
    dw $0001,$01FC                                                       ;A3A717;
    db $FC                                                               ;A3A71B;
    dw $7104                                                             ;A3A71C;

Spritemap_Sbug_FacingUpRight_2:
    dw $0001,$01FC                                                       ;A3A71E;
    db $FC                                                               ;A3A722;
    dw $7105                                                             ;A3A723;

Palette_Mochtroid:
    dw $3800,$3FB7,$2EAD,$0142,$0060,$3B10,$226B,$11C6                   ;A3A725;
    dw $0984,$72FF,$2CDF,$24B9,$1CAF,$2A9D,$19D6,$0D10                   ;A3A735;

InstList_Mochtroid_NotTouchingSamus:
    dw $000E                                                             ;A3A745;
    dw Spritemap_Mochtroid_NotTouchingSamus_0                            ;A3A747;
    dw $000E                                                             ;A3A749;
    dw Spritemap_Mochtroid_NotTouchingSamus_1                            ;A3A74B;
    dw $000E                                                             ;A3A74D;
    dw Spritemap_Mochtroid_NotTouchingSamus_2                            ;A3A74F;
    dw $000E                                                             ;A3A751;
    dw Spritemap_Mochtroid_NotTouchingSamus_1                            ;A3A753;
    dw Instruction_Common_GotoY                                          ;A3A755;
    dw InstList_Mochtroid_NotTouchingSamus                               ;A3A757;

InstList_Mochtroid_TouchingSamus:
    dw $0005                                                             ;A3A759;
    dw Spritemap_Mochtroid_TouchingSamus_0                               ;A3A75B;
    dw $0005                                                             ;A3A75D;
    dw Spritemap_Mochtroid_TouchingSamus_1                               ;A3A75F;
    dw $0005                                                             ;A3A761;
    dw Spritemap_Mochtroid_TouchingSamus_2                               ;A3A763;
    dw $0005                                                             ;A3A765;
    dw Spritemap_Mochtroid_TouchingSamus_1                               ;A3A767;
    dw Instruction_Common_GotoY                                          ;A3A769;
    dw InstList_Mochtroid_TouchingSamus                                  ;A3A76B;

MocktroidShakeVelocityTable_X:
    dw $0002,$0000,$FFFE,$0000                                           ;A3A76D;

MocktroidShakeVelocityTable_Y:
    dw $0000,$FFFE,$0000,$0002                                           ;A3A775;

InitAI_Mochtroid:
    LDX.W $0E54                                                          ;A3A77D;
    LDA.W #$0002                                                         ;A3A780;
    STA.W EnemyData.layer,X                                              ;A3A783;
    LDA.W #InstList_Mochtroid_NotTouchingSamus                           ;A3A786;
    JSR.W SetMochtroidInstList                                           ;A3A789;
    STZ.W EnemyData.work5,X                                              ;A3A78C;
    RTL                                                                  ;A3A78F;


MainAI_Mochtroid:
    LDX.W $0E54                                                          ;A3A790;
    LDA.W EnemyData.work5,X                                              ;A3A793;
    ASL A                                                                ;A3A796;
    TAX                                                                  ;A3A797;
    PHX                                                                  ;A3A798;
    LDX.W $0E54                                                          ;A3A799;
    STZ.W EnemyData.work5,X                                              ;A3A79C;
    PLX                                                                  ;A3A79F;
    JSR.W (.pointers,X)                                                  ;A3A7A0;
    RTL                                                                  ;A3A7A3;


.pointers:
    dw Function_Mochtroid_0_NotTouchingSamus                             ;A3A7A4;
    dw Function_Mochtroid_1_TouchingSamus                                ;A3A7A6;
    dw UNUSED_Function_Mochtroid_2_Shaking_A3A88F                        ;A3A7A8;

Function_Mochtroid_0_NotTouchingSamus:
    LDX.W $0E54                                                          ;A3A7AA;
    STZ.B $12                                                            ;A3A7AD;
    STZ.B $14                                                            ;A3A7AF;
    LDA.W EnemyData.yPosition,X                                          ;A3A7B1;
    SEC                                                                  ;A3A7B4;
    SBC.W $0AFA                                                          ;A3A7B5;
    LSR A                                                                ;A3A7B8;
    LSR A                                                                ;A3A7B9;
    STA.B $13                                                            ;A3A7BA;
    AND.W #$2000                                                         ;A3A7BC;
    BEQ +                                                                ;A3A7BF;
    LDA.B $14                                                            ;A3A7C1;
    ORA.W #$FFC0                                                         ;A3A7C3;
    STA.B $14                                                            ;A3A7C6;

  + LDA.W EnemyData.work2,X                                              ;A3A7C8;
    SEC                                                                  ;A3A7CB;
    SBC.B $12                                                            ;A3A7CC;
    STA.W EnemyData.work2,X                                              ;A3A7CE;
    LDA.W EnemyData.work3,X                                              ;A3A7D1;
    SBC.B $14                                                            ;A3A7D4;
    STA.W EnemyData.work3,X                                              ;A3A7D6;
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
    STA.W EnemyData.work3,X                                              ;A3A7ED;
    STZ.W EnemyData.work2,X                                              ;A3A7F0;

  + LDA.W EnemyData.work2,X                                              ;A3A7F3;
    BNE +                                                                ;A3A7F6;
    LDA.W EnemyData.work3,X                                              ;A3A7F8;
    BNE +                                                                ;A3A7FB;
    STZ.W EnemyData.work2,X                                              ;A3A7FD;
    STZ.W EnemyData.work3,X                                              ;A3A800;

  + LDA.W EnemyData.work2,X                                              ;A3A803;
    STA.B $12                                                            ;A3A806;
    LDA.W EnemyData.work3,X                                              ;A3A808;
    STA.B $14                                                            ;A3A80B;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3A80D;
    BCC .notCollidedWithBlock                                            ;A3A811;
    STZ.W EnemyData.work2,X                                              ;A3A813;
    STZ.W EnemyData.work3,X                                              ;A3A816;

.notCollidedWithBlock:
    LDX.W $0E54                                                          ;A3A819;
    STZ.B $12                                                            ;A3A81C;
    STZ.B $14                                                            ;A3A81E;
    LDA.W EnemyData.xPosition,X                                          ;A3A820;
    SEC                                                                  ;A3A823;
    SBC.W $0AF6                                                          ;A3A824;
    LSR A                                                                ;A3A827;
    LSR A                                                                ;A3A828;
    STA.B $13                                                            ;A3A829;
    AND.W #$2000                                                         ;A3A82B;
    BEQ +                                                                ;A3A82E;
    LDA.B $14                                                            ;A3A830;
    ORA.W #$FFC0                                                         ;A3A832;
    STA.B $14                                                            ;A3A835;

  + LDA.W EnemyData.work0,X                                              ;A3A837;
    SEC                                                                  ;A3A83A;
    SBC.B $12                                                            ;A3A83B;
    STA.W EnemyData.work0,X                                              ;A3A83D;
    LDA.W EnemyData.work1,X                                              ;A3A840;
    SBC.B $14                                                            ;A3A843;
    STA.W EnemyData.work1,X                                              ;A3A845;
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
    STA.W EnemyData.work1,X                                              ;A3A85C;
    STZ.W EnemyData.work0,X                                              ;A3A85F;

  + LDA.W EnemyData.work0,X                                              ;A3A862;
    BNE +                                                                ;A3A865;
    LDA.W EnemyData.work1,X                                              ;A3A867;
    BNE +                                                                ;A3A86A;
    STZ.W EnemyData.work0,X                                              ;A3A86C;
    STZ.W EnemyData.work1,X                                              ;A3A86F;

  + LDA.W EnemyData.work0,X                                              ;A3A872;
    STA.B $12                                                            ;A3A875;
    LDA.W EnemyData.work1,X                                              ;A3A877;
    STA.B $14                                                            ;A3A87A;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3A87C;
    BCC .noBlockCollision                                                ;A3A880;
    STZ.W EnemyData.work0,X                                              ;A3A882;
    STZ.W EnemyData.work1,X                                              ;A3A885;

.noBlockCollision:
    LDA.W #InstList_Mochtroid_NotTouchingSamus                           ;A3A888;
    JSR.W SetMochtroidInstList                                           ;A3A88B;
    RTS                                                                  ;A3A88E;


UNUSED_Function_Mochtroid_2_Shaking_A3A88F:
    LDX.W $0E54                                                          ;A3A88F;
    LDA.W EnemyData.work4,X                                              ;A3A892;
    AND.W #$0006                                                         ;A3A895;
    TAY                                                                  ;A3A898;
    LDA.W EnemyData.xPosition,X                                          ;A3A899;
    CLC                                                                  ;A3A89C;
    ADC.W MocktroidShakeVelocityTable_X,Y                                ;A3A89D;
    STA.W EnemyData.xPosition,X                                          ;A3A8A0;
    LDA.W EnemyData.yPosition,X                                          ;A3A8A3;
    CLC                                                                  ;A3A8A6;
    ADC.W MocktroidShakeVelocityTable_Y,Y                                ;A3A8A7;
    STA.W EnemyData.yPosition,X                                          ;A3A8AA;
    STZ.W EnemyData.work0,X                                              ;A3A8AD;
    STZ.W EnemyData.work1,X                                              ;A3A8B0;
    STZ.W EnemyData.work2,X                                              ;A3A8B3;
    STZ.W EnemyData.work3,X                                              ;A3A8B6;
    DEC.W EnemyData.work4,X                                              ;A3A8B9;
    BNE .shaking                                                         ;A3A8BC;
    STZ.W EnemyData.work5,X                                              ;A3A8BE;

.shaking:
    LDA.W #InstList_Mochtroid_NotTouchingSamus                           ;A3A8C1;
    JSR.W SetMochtroidInstList                                           ;A3A8C4;
    RTS                                                                  ;A3A8C7;


Function_Mochtroid_1_TouchingSamus:
    LDX.W $0E54                                                          ;A3A8C8;
    LDA.W EnemyData.xPosition,X                                          ;A3A8CB;
    CMP.W $0AF6                                                          ;A3A8CE;
    BEQ .centeredX                                                       ;A3A8D1;
    BPL .moveLeft                                                        ;A3A8D3;
    BMI .moveRight                                                       ;A3A8D5;

.centeredX:
    STZ.W EnemyData.work0,X                                              ;A3A8D7;
    STZ.W EnemyData.work1,X                                              ;A3A8DA;
    BRA .moveX                                                           ;A3A8DD;


.moveLeft:
    STZ.W EnemyData.work0,X                                              ;A3A8DF;
    LDA.W #$FFFF                                                         ;A3A8E2;
    STA.W EnemyData.work1,X                                              ;A3A8E5;
    BRA .moveX                                                           ;A3A8E8;


.moveRight:
    STZ.W EnemyData.work0,X                                              ;A3A8EA;
    LDA.W #$0001                                                         ;A3A8ED;
    STA.W EnemyData.work1,X                                              ;A3A8F0;
    BRA .moveX                                                           ;A3A8F3;


.moveX:
    LDA.W EnemyData.work0,X                                              ;A3A8F5;
    STA.B $12                                                            ;A3A8F8;
    LDA.W EnemyData.work1,X                                              ;A3A8FA;
    STA.B $14                                                            ;A3A8FD;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3A8FF;
    LDA.W EnemyData.yPosition,X                                          ;A3A903;
    CMP.W $0AFA                                                          ;A3A906;
    BEQ .centeredY                                                       ;A3A909;
    BPL .moveUp                                                          ;A3A90B;
    BMI .moveDown                                                        ;A3A90D;

.centeredY:
    STZ.W EnemyData.work2,X                                              ;A3A90F;
    STZ.W EnemyData.work3,X                                              ;A3A912;
    BRA .moveY                                                           ;A3A915;


.moveUp:
    STZ.W EnemyData.work2,X                                              ;A3A917;
    LDA.W #$FFFF                                                         ;A3A91A;
    STA.W EnemyData.work3,X                                              ;A3A91D;
    BRA .moveY                                                           ;A3A920;


.moveDown:
    STZ.W EnemyData.work2,X                                              ;A3A922;
    LDA.W #$0001                                                         ;A3A925;
    STA.W EnemyData.work3,X                                              ;A3A928;
    BRA .moveY                                                           ;A3A92B;


.moveY:
    LDA.W EnemyData.work2,X                                              ;A3A92D;
    STA.B $12                                                            ;A3A930;
    LDA.W EnemyData.work3,X                                              ;A3A932;
    STA.B $14                                                            ;A3A935;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3A937;
    RTS                                                                  ;A3A93B;


SetMochtroidInstList:
    CMP.L $7E7802,X                                                      ;A3A93C;
    BEQ .return                                                          ;A3A940;
    STA.L $7E7802,X                                                      ;A3A942;
    STA.W EnemyData.pInstList,X                                          ;A3A946;
    LDA.W #$0001                                                         ;A3A949;
    STA.W EnemyData.instTimer,X                                          ;A3A94C;
    STZ.W EnemyData.loopCounter,X                                        ;A3A94F;

.return:
    RTS                                                                  ;A3A952;


EnemyTouch_Mochtroid:
    LDX.W $0E54                                                          ;A3A953;
    LDA.W #$0001                                                         ;A3A956;
    STA.W EnemyData.work5,X                                              ;A3A959;
    LDA.W #InstList_Mochtroid_TouchingSamus                              ;A3A95C;
    JSR.W SetMochtroidInstList                                           ;A3A95F;
    LDA.L $7E8000,X                                                      ;A3A962;
    INC A                                                                ;A3A966;
    STA.L $7E8000,X                                                      ;A3A967;
    LDA.W $0A6E                                                          ;A3A96B;
    BNE .damage                                                          ;A3A96E;
    LDA.W $0E44                                                          ;A3A970;
    AND.W #$0007                                                         ;A3A973;
    CMP.W #$0007                                                         ;A3A976;
    BNE .skipSFX                                                         ;A3A979;
    LDA.W Equipment.currentEnergy                                        ;A3A97B;
    CMP.W #$001E                                                         ;A3A97E;
    BMI .skipSFX                                                         ;A3A981;
    LDA.W #$002D                                                         ;A3A983;
    JSL.L QueueSound_Lib3_Max6                                           ;A3A986;

.skipSFX:
    LDA.L $7E8000,X                                                      ;A3A98A;
    CMP.W #$0050                                                         ;A3A98E;
    BMI .return                                                          ;A3A991;
    LDA.W #$0000                                                         ;A3A993;
    STA.L $7E8000,X                                                      ;A3A996;

.damage:
    JSL.L CommonA3_NormalEnemyTouchAI                                    ;A3A99A;
    LDA.W #$0000                                                         ;A3A99E;
    STA.W $18A8                                                          ;A3A9A1;
    STA.W $18AA                                                          ;A3A9A4;

.return:
    RTL                                                                  ;A3A9A7;


EnemyShot_Mochtroid:
    LDX.W $0E54                                                          ;A3A9A8;
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A3A9AB;
    RTL                                                                  ;A3A9AF;


Spritemap_Mochtroid_NotTouchingSamus_0:
    dw $0006,$8000                                                       ;A3A9B0;
    db $F4                                                               ;A3A9B4;
    dw $6100,$81F0                                                       ;A3A9B5;
    db $F4                                                               ;A3A9B9;
    dw $2100,$0006                                                       ;A3A9BA;
    db $04                                                               ;A3A9BE;
    dw $611C,$01FE                                                       ;A3A9BF;
    db $04                                                               ;A3A9C3;
    dw $611D,$01FA                                                       ;A3A9C4;
    db $04                                                               ;A3A9C8;
    dw $211D,$01F2                                                       ;A3A9C9;
    db $04                                                               ;A3A9CD;
    dw $211C                                                             ;A3A9CE;

Spritemap_Mochtroid_NotTouchingSamus_1:
    dw $0006,$8000                                                       ;A3A9D0;
    db $F4                                                               ;A3A9D4;
    dw $6102,$81F0                                                       ;A3A9D5;
    db $F4                                                               ;A3A9D9;
    dw $2102,$0007                                                       ;A3A9DA;
    db $04                                                               ;A3A9DE;
    dw $610C,$01FF                                                       ;A3A9DF;
    db $04                                                               ;A3A9E3;
    dw $610D,$01F9                                                       ;A3A9E4;
    db $04                                                               ;A3A9E8;
    dw $210D,$01F1                                                       ;A3A9E9;
    db $04                                                               ;A3A9ED;
    dw $210C                                                             ;A3A9EE;

Spritemap_Mochtroid_NotTouchingSamus_2:
    dw $0004,$8000                                                       ;A3A9F0;
    db $F2                                                               ;A3A9F4;
    dw $6104,$81F0                                                       ;A3A9F5;
    db $F2                                                               ;A3A9F9;
    dw $2104,$81F8                                                       ;A3A9FA;
    db $02                                                               ;A3A9FE;
    dw $610E,$81F8                                                       ;A3A9FF;
    db $02                                                               ;A3AA03;
    dw $210E                                                             ;A3AA04;

Spritemap_Mochtroid_TouchingSamus_0:
    dw $0004,$81F9                                                       ;A3AA06;
    db $02                                                               ;A3AA0A;
    dw $610E,$8000                                                       ;A3AA0B;
    db $F2                                                               ;A3AA0F;
    dw $6106,$81F0                                                       ;A3AA10;
    db $F2                                                               ;A3AA14;
    dw $2106,$81F7                                                       ;A3AA15;
    db $02                                                               ;A3AA19;
    dw $210E                                                             ;A3AA1A;

Spritemap_Mochtroid_TouchingSamus_1:
    dw $0004,$81F0                                                       ;A3AA1C;
    db $F1                                                               ;A3AA20;
    dw $2108,$81FA                                                       ;A3AA21;
    db $01                                                               ;A3AA25;
    dw $610E,$81F6                                                       ;A3AA26;
    db $01                                                               ;A3AA2A;
    dw $210E,$8000                                                       ;A3AA2B;
    db $F1                                                               ;A3AA2F;
    dw $6108                                                             ;A3AA30;

Spritemap_Mochtroid_TouchingSamus_2:
    dw $0004,$81F9                                                       ;A3AA32;
    db $02                                                               ;A3AA36;
    dw $610E,$81F7                                                       ;A3AA37;
    db $02                                                               ;A3AA3B;
    dw $210E,$8000                                                       ;A3AA3C;
    db $F2                                                               ;A3AA40;
    dw $610A,$81F0                                                       ;A3AA41;
    db $F2                                                               ;A3AA45;
    dw $210A                                                             ;A3AA46;

Palette_Sidehopper:
    dw $3800,$57FF,$42F7,$0D4A,$0063,$4F5A,$36B5,$2610                   ;A3AA48;
    dw $1DCE,$4EDA,$3A35,$2990,$14EB,$5FE0,$32A0,$1940                   ;A3AA58;

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


InstList_Sidehopper_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3AA76;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3                    ;A3AA78;
    dw $005D,$0001                                                       ;A3AA7A;
    dw Spritemap_Sidehopper_2                                            ;A3AA7E;
    dw Instruction_Common_Sleep                                          ;A3AA80;

InstList_Sidehopper_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3AA82;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3                    ;A3AA84;
    dw $005E,$0002                                                       ;A3AA86;
    dw Spritemap_Sidehopper_0                                            ;A3AA8A;
    dw $0005                                                             ;A3AA8C;
    dw Spritemap_Sidehopper_1                                            ;A3AA8E;
    dw $0002                                                             ;A3AA90;
    dw Spritemap_Sidehopper_0                                            ;A3AA92;
    dw $0003                                                             ;A3AA94;
    dw Spritemap_Sidehopper_1                                            ;A3AA96;
    dw Instruction_Hopper_ReadyToHop                                     ;A3AA98;
    dw Instruction_Common_Sleep                                          ;A3AA9A;

InstList_Sidehopper_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3AA9C;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3                    ;A3AA9E;
    dw $005D,$0001                                                       ;A3AAA0;
    dw Spritemap_Sidehopper_5                                            ;A3AAA4;
    dw Instruction_Common_Sleep                                          ;A3AAA6;

InstList_Sidehopper_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3AAA8;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3                    ;A3AAAA;
    dw $005E,$0002                                                       ;A3AAAC;
    dw Spritemap_Sidehopper_3                                            ;A3AAB0;
    dw $0005                                                             ;A3AAB2;
    dw Spritemap_Sidehopper_4                                            ;A3AAB4;
    dw $0002                                                             ;A3AAB6;
    dw Spritemap_Sidehopper_3                                            ;A3AAB8;
    dw $0003                                                             ;A3AABA;
    dw Spritemap_Sidehopper_4                                            ;A3AABC;
    dw Instruction_Hopper_ReadyToHop                                     ;A3AABE;
    dw Instruction_Common_Sleep                                          ;A3AAC0;

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

HopTable_Small_YSpeedTableIndexDelta:
    db $03,$00,$03,$00                                                   ;A3AAE6;

HopTable_Small_XSpeed:
    db $03,$00,$03,$00                                                   ;A3AAEA;

HopTable_Small_JumpHeight:
    db $00,$10,$00,$10                                                   ;A3AAEE;

HopTable_Big_YSpeedTableIndexDelta:
    db $04,$00,$04,$00                                                   ;A3AAF2;

HopTable_Big_XSpeed:
    db $03,$00,$03,$00                                                   ;A3AAF6;

HopTable_Big_JumpHeight:
    db $00,$30,$00,$30                                                   ;A3AAFA;

Instruction_Hopper_ReadyToHop:
    LDX.W $0E54                                                          ;A3AAFE;
    LDA.W #$0001                                                         ;A3AB01;
    STA.L $7E7808,X                                                      ;A3AB04;
    RTL                                                                  ;A3AB08;


InitAI_Hopper:
    LDX.W $0E54                                                          ;A3AB09;
    LDA.W #$0025                                                         ;A3AB0C;
    STA.W $05E5                                                          ;A3AB0F;
    JSL.L GenerateRandomNumber                                           ;A3AB12;
    LDA.W #$0000                                                         ;A3AB16;
    STA.L $7E7806,X                                                      ;A3AB19;
    STA.L $7E7808,X                                                      ;A3AB1D;
    STA.L $7E780A,X                                                      ;A3AB21;
    LDA.W EnemyData.pId,X                                                ;A3AB25;
    TAX                                                                  ;A3AB28;
    LDA.L $A0002A,X                                                      ;A3AB29;
    ASL A                                                                ;A3AB2D;
    LDX.W $0E54                                                          ;A3AB2E;
    STA.L $7E780C,X                                                      ;A3AB31;
    LDA.W EnemyData.initParam0,X                                         ;A3AB35;
    BNE .upsideDown                                                      ;A3AB38;
    LDA.L $7E780C,X                                                      ;A3AB3A;
    TAY                                                                  ;A3AB3E;
    LDA.W InstListPointers_Sidehopper_Landed_UpsideUp,Y                  ;A3AB3F;
    BRA +                                                                ;A3AB42;


.upsideDown:
    LDA.L $7E780C,X                                                      ;A3AB44;
    TAY                                                                  ;A3AB48;
    LDA.W InstListPointers_Sidehopper_Landed_UpsideDown,Y                ;A3AB49;

  + STA.L $7E7800,X                                                      ;A3AB4C;
    JSR.W SetSidehopperInstList                                          ;A3AB50;
    LDA.W EnemyData.pId,X                                                ;A3AB53;
    TAX                                                                  ;A3AB56;
    LDA.L $A0002A,X                                                      ;A3AB57;
    BEQ .sidehopper                                                      ;A3AB5B;
    LDA.W #$0002                                                         ;A3AB5D;
    LDX.W $0E54                                                          ;A3AB60;
    STA.L $7E780A,X                                                      ;A3AB63;

.sidehopper:
    LDX.W $0E54                                                          ;A3AB67;
    LDA.L $7E780A,X                                                      ;A3AB6A;
    TAY                                                                  ;A3AB6E;
    LDA.W HopTable_Small_JumpHeight,Y                                    ;A3AB6F;
    STA.B $16                                                            ;A3AB72;
    LDA.W HopTable_Small_YSpeedTableIndexDelta,Y                         ;A3AB74;
    STA.B $18                                                            ;A3AB77;
    JSR.W Hoppers_CalculateInitialHopSpeed                               ;A3AB79;
    STA.L $7E7802,X                                                      ;A3AB7C;
    LDA.L $7E780A,X                                                      ;A3AB80;
    TAY                                                                  ;A3AB84;
    LDA.W HopTable_Big_JumpHeight,Y                                      ;A3AB85;
    STA.B $16                                                            ;A3AB88;
    LDA.W HopTable_Big_YSpeedTableIndexDelta,Y                           ;A3AB8A;
    STA.B $18                                                            ;A3AB8D;
    JSR.W Hoppers_CalculateInitialHopSpeed                               ;A3AB8F;
    STA.L $7E7804,X                                                      ;A3AB92;
    LDA.W #Function_Hopper_Hop                                           ;A3AB96;
    STA.W EnemyData.work1,X                                              ;A3AB99;
    RTL                                                                  ;A3AB9C;


Hoppers_CalculateInitialHopSpeed:
    STZ.B $12                                                            ;A3AB9D;
    STZ.B $14                                                            ;A3AB9F;

.loop:
    LDA.B $12                                                            ;A3ABA1;
    CLC                                                                  ;A3ABA3;
    ADC.B $18                                                            ;A3ABA4;
    STA.B $12                                                            ;A3ABA6;
    ASL A                                                                ;A3ABA8;
    ASL A                                                                ;A3ABA9;
    ASL A                                                                ;A3ABAA;
    TAY                                                                  ;A3ABAB;
    LDA.B $14                                                            ;A3ABAC;
    CLC                                                                  ;A3ABAE;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y                  ;A3ABAF;
    STA.B $14                                                            ;A3ABB2;
    CMP.B $16                                                            ;A3ABB4;
    BMI .loop                                                            ;A3ABB6;
    LDA.B $12                                                            ;A3ABB8;
    RTS                                                                  ;A3ABBA;


SetSidehopperInstList:
    LDX.W $0E54                                                          ;A3ABBB;
    LDA.L $7E7800,X                                                      ;A3ABBE;
    STA.W EnemyData.pInstList,X                                          ;A3ABC2;
    LDA.W #$0001                                                         ;A3ABC5;
    STA.W EnemyData.instTimer,X                                          ;A3ABC8;
    STZ.W EnemyData.loopCounter,X                                        ;A3ABCB;
    RTS                                                                  ;A3ABCE;


MainAI_Hopper:
    LDX.W $0E54                                                          ;A3ABCF;
    JSR.W ($0FAA,X)                                                      ;A3ABD2;
    RTL                                                                  ;A3ABD5;


Function_Hopper_Hop:
    JSL.L GenerateRandomNumber                                           ;A3ABD6;
    AND.W #$0001                                                         ;A3ABDA;
    ASL A                                                                ;A3ABDD;
    TAY                                                                  ;A3ABDE;
    LDA.W HopFunctionPointers_Sidehopper,Y                               ;A3ABDF;
    STA.W EnemyData.work1,X                                              ;A3ABE2;
    RTS                                                                  ;A3ABE5;


Function_Hopper_SmallHop:
    LDX.W $0E54                                                          ;A3ABE6;
    LDA.L $7E780A,X                                                      ;A3ABE9;
    TAY                                                                  ;A3ABED;
    LDA.W HopTable_Small_YSpeedTableIndexDelta,Y                         ;A3ABEE;
    STA.W EnemyData.work4,X                                              ;A3ABF1;
    LDA.W HopTable_Small_XSpeed,Y                                        ;A3ABF4;
    STA.W EnemyData.work3,X                                              ;A3ABF7;
    LDA.L $7E7802,X                                                      ;A3ABFA;
    STA.W EnemyData.work2,X                                              ;A3ABFE;
    LDA.W #Function_Hopper_Hop_UpsideUp                                  ;A3AC01;
    STA.W EnemyData.work1,X                                              ;A3AC04;
    LDA.W EnemyData.initParam0,X                                         ;A3AC07;
    BEQ .return                                                          ;A3AC0A;
    LDA.W #Function_Hopper_Hop_UpsideDown                                ;A3AC0C;
    STA.W EnemyData.work1,X                                              ;A3AC0F;

.return:
    RTS                                                                  ;A3AC12;


Function_Hopper_BigHop:
    LDX.W $0E54                                                          ;A3AC13;
    LDA.L $7E780A,X                                                      ;A3AC16;
    TAY                                                                  ;A3AC1A;
    LDA.W HopTable_Big_YSpeedTableIndexDelta,Y                           ;A3AC1B;
    STA.W EnemyData.work4,X                                              ;A3AC1E;
    LDA.W HopTable_Big_XSpeed,Y                                          ;A3AC21;
    STA.W EnemyData.work3,X                                              ;A3AC24;
    LDA.L $7E7804,X                                                      ;A3AC27;
    STA.W EnemyData.work2,X                                              ;A3AC2B;
    LDA.W #Function_Hopper_Hop_UpsideUp                                  ;A3AC2E;
    STA.W EnemyData.work1,X                                              ;A3AC31;
    LDA.W EnemyData.initParam0,X                                         ;A3AC34;
    BEQ .return                                                          ;A3AC37;
    LDA.W #Function_Hopper_Hop_UpsideDown                                ;A3AC39;
    STA.W EnemyData.work1,X                                              ;A3AC3C;

.return:
    RTS                                                                  ;A3AC3F;


Function_Hopper_Hop_UpsideUp:
    LDX.W $0E54                                                          ;A3AC40;
    LDA.W #Function_Hopper_HopBackwards_UpsideUp                         ;A3AC43;
    STA.W EnemyData.work1,X                                              ;A3AC46;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A3AC49;
    BMI .return                                                          ;A3AC4D;
    LDA.W #Function_Hopper_HopForwards_UpsideUp                          ;A3AC4F;
    STA.W EnemyData.work1,X                                              ;A3AC52;

.return:
    RTS                                                                  ;A3AC55;


Function_Hopper_Hop_UpsideDown:
    LDX.W $0E54                                                          ;A3AC56;
    LDA.W #Function_Hopper_HopBackwards_UpsideDown                       ;A3AC59;
    STA.W EnemyData.work1,X                                              ;A3AC5C;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A3AC5F;
    BMI .return                                                          ;A3AC63;
    LDA.W #Function_Hopper_HopForwards_UpsideDown                        ;A3AC65;
    STA.W EnemyData.work1,X                                              ;A3AC68;

.return:
    RTS                                                                  ;A3AC6B;


Function_Hopper_HopBackwards_UpsideUp:
    LDX.W $0E54                                                          ;A3AC6C;
    LDA.W EnemyData.work3,X                                              ;A3AC6F;
    EOR.W #$FFFF                                                         ;A3AC72;
    INC A                                                                ;A3AC75;
    STA.W EnemyData.work3,X                                              ;A3AC76;
    LDA.L $7E780C,X                                                      ;A3AC79;
    TAY                                                                  ;A3AC7D;
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideUp,Y                 ;A3AC7E;
    STA.L $7E7800,X                                                      ;A3AC81;
    JSR.W SetSidehopperInstList                                          ;A3AC85;
    LDA.W #Function_Hopper_Jumping_UpsideUp                              ;A3AC88;
    STA.W EnemyData.work1,X                                              ;A3AC8B;
    RTS                                                                  ;A3AC8E;


Function_Hopper_HopForwards_UpsideUp:
    LDX.W $0E54                                                          ;A3AC8F;
    LDA.L $7E780C,X                                                      ;A3AC92;
    TAY                                                                  ;A3AC96;
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideUp,Y                 ;A3AC97;
    STA.L $7E7800,X                                                      ;A3AC9A;
    JSR.W SetSidehopperInstList                                          ;A3AC9E;
    LDA.W #Function_Hopper_Jumping_UpsideUp_duplicate                    ;A3ACA1;
    STA.W EnemyData.work1,X                                              ;A3ACA4;
    RTS                                                                  ;A3ACA7;


Function_Hopper_HopBackwards_UpsideDown:
    LDX.W $0E54                                                          ;A3ACA8;
    LDA.W EnemyData.work3,X                                              ;A3ACAB;
    EOR.W #$FFFF                                                         ;A3ACAE;
    INC A                                                                ;A3ACB1;
    STA.W EnemyData.work3,X                                              ;A3ACB2;
    LDA.L $7E780C,X                                                      ;A3ACB5;
    TAY                                                                  ;A3ACB9;
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideDown,Y               ;A3ACBA;
    STA.L $7E7800,X                                                      ;A3ACBD;
    JSR.W SetSidehopperInstList                                          ;A3ACC1;
    LDA.W #Function_Hopper_Jumping_UpsideDown                            ;A3ACC4;
    STA.W EnemyData.work1,X                                              ;A3ACC7;
    RTS                                                                  ;A3ACCA;


Function_Hopper_HopForwards_UpsideDown:
    LDX.W $0E54                                                          ;A3ACCB;
    LDA.L $7E780C,X                                                      ;A3ACCE;
    TAY                                                                  ;A3ACD2;
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideDown,Y               ;A3ACD3;
    STA.L $7E7800,X                                                      ;A3ACD6;
    JSR.W SetSidehopperInstList                                          ;A3ACDA;
    LDA.W #Function_Hopper_Jumping_UpsideDown_duplicate                  ;A3ACDD;
    STA.W EnemyData.work1,X                                              ;A3ACE0;
    RTS                                                                  ;A3ACE3;


Function_Hopper_Landed:
    LDX.W $0E54                                                          ;A3ACE4;
    LDA.L $7E780C,X                                                      ;A3ACE7;
    TAY                                                                  ;A3ACEB;
    LDA.W InstListPointers_Sidehopper_Landed_UpsideUp,Y                  ;A3ACEC;
    STA.L $7E7800,X                                                      ;A3ACEF;
    LDA.W EnemyData.initParam0,X                                         ;A3ACF3;
    BEQ .upsideDown                                                      ;A3ACF6;
    LDA.L $7E780C,X                                                      ;A3ACF8;
    TAY                                                                  ;A3ACFC;
    LDA.W InstListPointers_Sidehopper_Landed_UpsideDown,Y                ;A3ACFD;
    STA.L $7E7800,X                                                      ;A3AD00;

.upsideDown:
    JSR.W SetSidehopperInstList                                          ;A3AD04;
    LDA.W #Function_Hopper_WaitToHop                                     ;A3AD07;
    STA.W EnemyData.work1,X                                              ;A3AD0A;
    RTS                                                                  ;A3AD0D;


Function_Hopper_Jumping_UpsideUp:
    LDX.W $0E54                                                          ;A3AD0E;
    LDA.L $7E7806,X                                                      ;A3AD11;
    BNE .falling                                                         ;A3AD15;
    JSR.W HopperMovement_Jumping_UpsideUp                                ;A3AD17;
    BRA .return                                                          ;A3AD1A;


.falling:
    JSR.W HopperMovement_Falling_UpsideUp                                ;A3AD1C;

.return:
    RTS                                                                  ;A3AD1F;


Function_Hopper_Jumping_UpsideUp_duplicate:
    LDX.W $0E54                                                          ;A3AD20;
    LDA.L $7E7806,X                                                      ;A3AD23;
    BNE .falling                                                         ;A3AD27;
    JSR.W HopperMovement_Jumping_UpsideUp                                ;A3AD29;
    BRA .return                                                          ;A3AD2C;


.falling:
    JSR.W HopperMovement_Falling_UpsideUp                                ;A3AD2E;

.return:
    RTS                                                                  ;A3AD31;


Function_Hopper_Jumping_UpsideDown:
    LDX.W $0E54                                                          ;A3AD32;
    LDA.L $7E7806,X                                                      ;A3AD35;
    BNE .falling                                                         ;A3AD39;
    JSR.W HopperMovement_Jumping_UpsideDown                              ;A3AD3B;
    BRA .return                                                          ;A3AD3E;


.falling:
    JSR.W HopperMovement_Falling_UpsideDown                              ;A3AD40;

.return:
    RTS                                                                  ;A3AD43;


Function_Hopper_Jumping_UpsideDown_duplicate:
    LDX.W $0E54                                                          ;A3AD44;
    LDA.L $7E7806,X                                                      ;A3AD47;
    BNE .falling                                                         ;A3AD4B;
    JSR.W HopperMovement_Jumping_UpsideDown                              ;A3AD4D;
    BRA .return                                                          ;A3AD50;


.falling:
    JSR.W HopperMovement_Falling_UpsideDown                              ;A3AD52;

.return:
    RTS                                                                  ;A3AD55;


Function_Hopper_WaitToHop:
    LDX.W $0E54                                                          ;A3AD56;
    LDA.L $7E7808,X                                                      ;A3AD59;
    BEQ .return                                                          ;A3AD5D;
    LDA.W #$0000                                                         ;A3AD5F;
    STA.L $7E7808,X                                                      ;A3AD62;
    LDA.W #Function_Hopper_Hop                                           ;A3AD66;
    STA.W EnemyData.work1,X                                              ;A3AD69;

.return:
    RTS                                                                  ;A3AD6C;


HopperMovement_Jumping_UpsideUp:
    LDX.W $0E54                                                          ;A3AD6D;
    LDA.W EnemyData.work2,X                                              ;A3AD70;
    ASL A                                                                ;A3AD73;
    ASL A                                                                ;A3AD74;
    ASL A                                                                ;A3AD75;
    TAY                                                                  ;A3AD76;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A3AD77;
    STA.B $14                                                            ;A3AD7A;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A3AD7C;
    STA.B $12                                                            ;A3AD7F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3AD81;
    BCC .notCollidedWithBlock                                            ;A3AD85;
    LDA.W EnemyData.work3,X                                              ;A3AD87;
    EOR.W #$FFFF                                                         ;A3AD8A;
    INC A                                                                ;A3AD8D;
    STA.W EnemyData.work3,X                                              ;A3AD8E;
    LDA.W #$0001                                                         ;A3AD91;
    STA.L $7E7806,X                                                      ;A3AD94;
    BRA .return                                                          ;A3AD98;


.notCollidedWithBlock:
    LDA.W EnemyData.work3,X                                              ;A3AD9A;
    STA.B $14                                                            ;A3AD9D;
    STZ.B $12                                                            ;A3AD9F;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3ADA1;
    BCC .notCollidedWithWall                                             ;A3ADA5;
    LDA.W EnemyData.work3,X                                              ;A3ADA7;
    EOR.W #$FFFF                                                         ;A3ADAA;
    INC A                                                                ;A3ADAD;
    STA.W EnemyData.work3,X                                              ;A3ADAE;
    LDA.W #$0001                                                         ;A3ADB1;
    STA.L $7E7806,X                                                      ;A3ADB4;
    BRA .return                                                          ;A3ADB8;


.notCollidedWithWall:
    LDA.W EnemyData.work2,X                                              ;A3ADBA;
    SEC                                                                  ;A3ADBD;
    SBC.W EnemyData.work4,X                                              ;A3ADBE;
    STA.W EnemyData.work2,X                                              ;A3ADC1;
    BPL .return                                                          ;A3ADC4;
    LDA.W #$0001                                                         ;A3ADC6;
    STA.L $7E7806,X                                                      ;A3ADC9;
    LDA.W #$0000                                                         ;A3ADCD;
    STA.W EnemyData.work2,X                                              ;A3ADD0;

.return:
    RTS                                                                  ;A3ADD3;


HopperMovement_Falling_UpsideUp:
    LDX.W $0E54                                                          ;A3ADD4;
    LDA.W EnemyData.work2,X                                              ;A3ADD7;
    ASL A                                                                ;A3ADDA;
    ASL A                                                                ;A3ADDB;
    ASL A                                                                ;A3ADDC;
    TAY                                                                  ;A3ADDD;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A3ADDE;
    STA.B $14                                                            ;A3ADE1;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A3ADE3;
    STA.B $12                                                            ;A3ADE6;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3ADE8;
    BCC .notCollidedWithBlock                                            ;A3ADEC;
    LDA.W #$0000                                                         ;A3ADEE;
    STA.L $7E7806,X                                                      ;A3ADF1;
    LDA.W #Function_Hopper_Landed                                        ;A3ADF5;
    STA.W EnemyData.work1,X                                              ;A3ADF8;
    BRA .return                                                          ;A3ADFB;


.notCollidedWithBlock:
    LDA.W EnemyData.work3,X                                              ;A3ADFD;
    STA.B $14                                                            ;A3AE00;
    STZ.B $12                                                            ;A3AE02;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3AE04;
    BCC .notCollidedWithWall                                             ;A3AE08;
    LDA.W EnemyData.work3,X                                              ;A3AE0A;
    EOR.W #$FFFF                                                         ;A3AE0D;
    INC A                                                                ;A3AE10;
    STA.W EnemyData.work3,X                                              ;A3AE11;

.notCollidedWithWall:
    LDA.W EnemyData.work2,X                                              ;A3AE14;
    CLC                                                                  ;A3AE17;
    ADC.W EnemyData.work4,X                                              ;A3AE18;
    CMP.W #$0040                                                         ;A3AE1B;
    BMI +                                                                ;A3AE1E;
    LDA.W #$0040                                                         ;A3AE20;

  + STA.W EnemyData.work2,X                                              ;A3AE23;

.return:
    RTS                                                                  ;A3AE26;


HopperMovement_Jumping_UpsideDown:
    LDX.W $0E54                                                          ;A3AE27;
    LDA.W EnemyData.work2,X                                              ;A3AE2A;
    ASL A                                                                ;A3AE2D;
    ASL A                                                                ;A3AE2E;
    ASL A                                                                ;A3AE2F;
    TAY                                                                  ;A3AE30;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A3AE31;
    STA.B $14                                                            ;A3AE34;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A3AE36;
    STA.B $12                                                            ;A3AE39;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3AE3B;
    BCC .notCollidedWithBlock                                            ;A3AE3F;
    LDA.W EnemyData.work3,X                                              ;A3AE41;
    EOR.W #$FFFF                                                         ;A3AE44;
    INC A                                                                ;A3AE47;
    STA.W EnemyData.work3,X                                              ;A3AE48;
    LDA.W #$0001                                                         ;A3AE4B;
    STA.L $7E7806,X                                                      ;A3AE4E;
    BRA .return                                                          ;A3AE52;


.notCollidedWithBlock:
    LDA.W EnemyData.work3,X                                              ;A3AE54;
    STA.B $14                                                            ;A3AE57;
    STZ.B $12                                                            ;A3AE59;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3AE5B;
    BCC .notCollidedWithWall                                             ;A3AE5F;
    LDA.W EnemyData.work3,X                                              ;A3AE61;
    EOR.W #$FFFF                                                         ;A3AE64;
    INC A                                                                ;A3AE67;
    STA.W EnemyData.work3,X                                              ;A3AE68;
    LDA.W #$0001                                                         ;A3AE6B;
    STA.L $7E7806,X                                                      ;A3AE6E;
    BRA .return                                                          ;A3AE72;


.notCollidedWithWall:
    LDA.W EnemyData.work2,X                                              ;A3AE74;
    SEC                                                                  ;A3AE77;
    SBC.W EnemyData.work4,X                                              ;A3AE78;
    STA.W EnemyData.work2,X                                              ;A3AE7B;
    BPL .return                                                          ;A3AE7E;
    LDA.W #$0001                                                         ;A3AE80;
    STA.L $7E7806,X                                                      ;A3AE83;
    LDA.W #$0000                                                         ;A3AE87;
    STA.W EnemyData.work2,X                                              ;A3AE8A;

.return:
    RTS                                                                  ;A3AE8D;


HopperMovement_Falling_UpsideDown:
    LDX.W $0E54                                                          ;A3AE8E;
    LDA.W EnemyData.work2,X                                              ;A3AE91;
    ASL A                                                                ;A3AE94;
    ASL A                                                                ;A3AE95;
    ASL A                                                                ;A3AE96;
    TAY                                                                  ;A3AE97;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A3AE98;
    STA.B $14                                                            ;A3AE9B;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A3AE9D;
    STA.B $12                                                            ;A3AEA0;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3AEA2;
    BCC .notCollidedWithBlock                                            ;A3AEA6;
    LDA.W #$0000                                                         ;A3AEA8;
    STA.L $7E7806,X                                                      ;A3AEAB;
    LDA.W #Function_Hopper_Landed                                        ;A3AEAF;
    STA.W EnemyData.work1,X                                              ;A3AEB2;
    BRA .return                                                          ;A3AEB5;


.notCollidedWithBlock:
    LDA.W EnemyData.work3,X                                              ;A3AEB7;
    STA.B $14                                                            ;A3AEBA;
    STZ.B $12                                                            ;A3AEBC;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3AEBE;
    BCC .notCollidedWithWall                                             ;A3AEC2;
    LDA.W EnemyData.work3,X                                              ;A3AEC4;
    EOR.W #$FFFF                                                         ;A3AEC7;
    INC A                                                                ;A3AECA;
    STA.W EnemyData.work3,X                                              ;A3AECB;

.notCollidedWithWall:
    LDA.W EnemyData.work2,X                                              ;A3AECE;
    CLC                                                                  ;A3AED1;
    ADC.W EnemyData.work4,X                                              ;A3AED2;
    CMP.W #$0040                                                         ;A3AED5;
    BMI +                                                                ;A3AED8;
    LDA.W #$0040                                                         ;A3AEDA;

  + STA.W EnemyData.work2,X                                              ;A3AEDD;

.return:
    RTS                                                                  ;A3AEE0;


RTL_A3AEE1:
    RTL                                                                  ;A3AEE1;


RTL_A3AEE2:
    RTL                                                                  ;A3AEE2;


Spritemap_Sidehopper_0:
    dw $0005,$81F8                                                       ;A3AEE3;
    db $F3                                                               ;A3AEE7;
    dw $2100,$8004                                                       ;A3AEE8;
    db $EC                                                               ;A3AEEC;
    dw $6106,$8004                                                       ;A3AEED;
    db $FC                                                               ;A3AEF1;
    dw $6104,$81EC                                                       ;A3AEF2;
    db $EC                                                               ;A3AEF6;
    dw $2106,$81EC                                                       ;A3AEF7;
    db $FC                                                               ;A3AEFB;
    dw $2104                                                             ;A3AEFC;

Spritemap_Sidehopper_1:
    dw $0005,$81F8                                                       ;A3AEFE;
    db $F5                                                               ;A3AF02;
    dw $2102,$8004                                                       ;A3AF03;
    db $EC                                                               ;A3AF07;
    dw $610A,$81EC                                                       ;A3AF08;
    db $EC                                                               ;A3AF0C;
    dw $210A,$8004                                                       ;A3AF0D;
    db $FC                                                               ;A3AF11;
    dw $6108,$81EC                                                       ;A3AF12;
    db $FC                                                               ;A3AF16;
    dw $2108                                                             ;A3AF17;

Spritemap_Sidehopper_2:
    dw $0005,$81F8                                                       ;A3AF19;
    db $EF                                                               ;A3AF1D;
    dw $2100,$8004                                                       ;A3AF1E;
    db $04                                                               ;A3AF22;
    dw $610E,$8004                                                       ;A3AF23;
    db $F4                                                               ;A3AF27;
    dw $610C,$81EC                                                       ;A3AF28;
    db $04                                                               ;A3AF2C;
    dw $210E,$81EC                                                       ;A3AF2D;
    db $F4                                                               ;A3AF31;
    dw $210C                                                             ;A3AF32;

Spritemap_Sidehopper_3:
    dw $0005,$81F8                                                       ;A3AF34;
    db $FD                                                               ;A3AF38;
    dw $A100,$8004                                                       ;A3AF39;
    db $04                                                               ;A3AF3D;
    dw $E106,$8004                                                       ;A3AF3E;
    db $F4                                                               ;A3AF42;
    dw $E104,$81EC                                                       ;A3AF43;
    db $04                                                               ;A3AF47;
    dw $A106,$81EC                                                       ;A3AF48;
    db $F4                                                               ;A3AF4C;
    dw $A104                                                             ;A3AF4D;

Spritemap_Sidehopper_4:
    dw $0005,$81F8                                                       ;A3AF4F;
    db $FB                                                               ;A3AF53;
    dw $A102,$8004                                                       ;A3AF54;
    db $04                                                               ;A3AF58;
    dw $E10A,$81EC                                                       ;A3AF59;
    db $04                                                               ;A3AF5D;
    dw $A10A,$8004                                                       ;A3AF5E;
    db $F4                                                               ;A3AF62;
    dw $E108,$81EC                                                       ;A3AF63;
    db $F4                                                               ;A3AF67;
    dw $A108                                                             ;A3AF68;

Spritemap_Sidehopper_5:
    dw $0005,$81F8                                                       ;A3AF6A;
    db $01                                                               ;A3AF6E;
    dw $A100,$8004                                                       ;A3AF6F;
    db $EC                                                               ;A3AF73;
    dw $E10E,$8004                                                       ;A3AF74;
    db $FC                                                               ;A3AF78;
    dw $E10C,$81EC                                                       ;A3AF79;
    db $EC                                                               ;A3AF7D;
    dw $A10E,$81EC                                                       ;A3AF7E;
    db $FC                                                               ;A3AF82;
    dw $A10C                                                             ;A3AF83;

Palette_Dessgeega:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3AF85;
    dw $2C63,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140                   ;A3AF95;

InstList_Dessgeega_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3AFA5;
    dw $0001                                                             ;A3AFA7;
    dw Spritemap_Dessgeega_2                                             ;A3AFA9;
    dw Instruction_Common_Sleep                                          ;A3AFAB;

InstList_Dessgeega_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3AFAD;
    dw $0002                                                             ;A3AFAF;
    dw Spritemap_Dessgeega_0                                             ;A3AFB1;
    dw $0005                                                             ;A3AFB3;
    dw Spritemap_Dessgeega_1                                             ;A3AFB5;
    dw $0002                                                             ;A3AFB7;
    dw Spritemap_Dessgeega_0                                             ;A3AFB9;
    dw $0003                                                             ;A3AFBB;
    dw Spritemap_Dessgeega_1                                             ;A3AFBD;
    dw Instruction_Hopper_ReadyToHop                                     ;A3AFBF;
    dw Instruction_Common_Sleep                                          ;A3AFC1;

InstList_Dessgeega_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3AFC3;
    dw $0001                                                             ;A3AFC5;
    dw Spritemap_Dessgeega_5                                             ;A3AFC7;
    dw Instruction_Common_Sleep                                          ;A3AFC9;

InstList_Dessgeega_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3AFCB;
    dw $0002                                                             ;A3AFCD;
    dw Spritemap_Dessgeega_3                                             ;A3AFCF;
    dw $0005                                                             ;A3AFD1;
    dw Spritemap_Dessgeega_4                                             ;A3AFD3;
    dw $0002                                                             ;A3AFD5;
    dw Spritemap_Dessgeega_3                                             ;A3AFD7;
    dw $0003                                                             ;A3AFD9;
    dw Spritemap_Dessgeega_4                                             ;A3AFDB;
    dw Instruction_Hopper_ReadyToHop                                     ;A3AFDD;
    dw Instruction_Common_Sleep                                          ;A3AFDF;

RTL_A3AFE1:
    RTL                                                                  ;A3AFE1;


RTL_A3AFE2:
    RTL                                                                  ;A3AFE2;


Spritemap_Dessgeega_0:
    dw $0005,$81F8                                                       ;A3AFE3;
    db $F3                                                               ;A3AFE7;
    dw $2100,$8004                                                       ;A3AFE8;
    db $EC                                                               ;A3AFEC;
    dw $6106,$8004                                                       ;A3AFED;
    db $FC                                                               ;A3AFF1;
    dw $6104,$81EC                                                       ;A3AFF2;
    db $EC                                                               ;A3AFF6;
    dw $2106,$81EC                                                       ;A3AFF7;
    db $FC                                                               ;A3AFFB;
    dw $2104                                                             ;A3AFFC;

Spritemap_Dessgeega_1:
    dw $0005,$81F8                                                       ;A3AFFE;
    db $F5                                                               ;A3B002;
    dw $2102,$8004                                                       ;A3B003;
    db $EC                                                               ;A3B007;
    dw $610A,$81EC                                                       ;A3B008;
    db $EC                                                               ;A3B00C;
    dw $210A,$8004                                                       ;A3B00D;
    db $FC                                                               ;A3B011;
    dw $6108,$81EC                                                       ;A3B012;
    db $FC                                                               ;A3B016;
    dw $2108                                                             ;A3B017;

Spritemap_Dessgeega_2:
    dw $0005,$81F8                                                       ;A3B019;
    db $EF                                                               ;A3B01D;
    dw $2100,$8004                                                       ;A3B01E;
    db $04                                                               ;A3B022;
    dw $610E,$8004                                                       ;A3B023;
    db $F4                                                               ;A3B027;
    dw $610C,$81EC                                                       ;A3B028;
    db $04                                                               ;A3B02C;
    dw $210E,$81EC                                                       ;A3B02D;
    db $F4                                                               ;A3B031;
    dw $210C                                                             ;A3B032;

Spritemap_Dessgeega_3:
    dw $0005,$81F8                                                       ;A3B034;
    db $FD                                                               ;A3B038;
    dw $A100,$8004                                                       ;A3B039;
    db $04                                                               ;A3B03D;
    dw $E106,$8004                                                       ;A3B03E;
    db $F4                                                               ;A3B042;
    dw $E104,$81EC                                                       ;A3B043;
    db $04                                                               ;A3B047;
    dw $A106,$81EC                                                       ;A3B048;
    db $F4                                                               ;A3B04C;
    dw $A104                                                             ;A3B04D;

Spritemap_Dessgeega_4:
    dw $0005,$81F8                                                       ;A3B04F;
    db $FB                                                               ;A3B053;
    dw $A102,$8004                                                       ;A3B054;
    db $04                                                               ;A3B058;
    dw $E10A,$81EC                                                       ;A3B059;
    db $04                                                               ;A3B05D;
    dw $A10A,$8004                                                       ;A3B05E;
    db $F4                                                               ;A3B062;
    dw $E108,$81EC                                                       ;A3B063;
    db $F4                                                               ;A3B067;
    dw $A108                                                             ;A3B068;

Spritemap_Dessgeega_5:
    dw $0005,$81F8                                                       ;A3B06A;
    db $01                                                               ;A3B06E;
    dw $A100,$8004                                                       ;A3B06F;
    db $EC                                                               ;A3B073;
    dw $E10E,$8004                                                       ;A3B074;
    db $FC                                                               ;A3B078;
    dw $E10C,$81EC                                                       ;A3B079;
    db $EC                                                               ;A3B07D;
    dw $A10E,$81EC                                                       ;A3B07E;
    db $FC                                                               ;A3B082;
    dw $A10C                                                             ;A3B083;

Palette_SidehopperLarge:
    dw $3800,$57FF,$42F7,$0D4A,$0063,$4F5A,$36B5,$2610                   ;A3B085;
    dw $1DCE,$4EDA,$3A35,$2990,$14EB,$5FE0,$32A0,$1940                   ;A3B095;

Palette_SidehopperTourian:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A3B0A5;
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A3B0B5;

InstList_SidehopperLarge_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3B0C5;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3                    ;A3B0C7;
    dw $005D,$0001                                                       ;A3B0C9;
    dw Spritemap_SidehopperTourian_2                                     ;A3B0CD;
    dw Instruction_Common_Sleep                                          ;A3B0CF;

InstList_SidehopperLarge_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3B0D1;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3                    ;A3B0D3;
    dw $005E,$0002                                                       ;A3B0D5;
    dw Spritemap_SidehopperTourian_0                                     ;A3B0D9;
    dw $0005                                                             ;A3B0DB;
    dw Spritemap_SidehopperTourian_1                                     ;A3B0DD;
    dw $0002                                                             ;A3B0DF;
    dw Spritemap_SidehopperTourian_0                                     ;A3B0E1;
    dw $0003                                                             ;A3B0E3;
    dw Spritemap_SidehopperTourian_1                                     ;A3B0E5;
    dw Instruction_Hopper_ReadyToHop                                     ;A3B0E7;
    dw Instruction_Common_Sleep                                          ;A3B0E9;

InstList_SidehopperLarge_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3B0EB;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3                    ;A3B0ED;
    dw $005D,$0001                                                       ;A3B0EF;
    dw Spritemap_SidehopperTourian_5                                     ;A3B0F3;
    dw Instruction_Common_Sleep                                          ;A3B0F5;

InstList_SidehopperLarge_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3B0F7;
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3                    ;A3B0F9;
    dw $005E,$0002                                                       ;A3B0FB;
    dw Spritemap_SidehopperTourian_3                                     ;A3B0FF;
    dw $0005                                                             ;A3B101;
    dw Spritemap_SidehopperTourian_4                                     ;A3B103;
    dw $0002                                                             ;A3B105;
    dw Spritemap_SidehopperTourian_3                                     ;A3B107;
    dw $0003                                                             ;A3B109;
    dw Spritemap_SidehopperTourian_4                                     ;A3B10B;
    dw Instruction_Hopper_ReadyToHop                                     ;A3B10D;
    dw Instruction_Common_Sleep                                          ;A3B10F;

Spritemap_SidehopperTourian_0:
    dw $0007,$0000                                                       ;A3B111;
    db $EC                                                               ;A3B115;
    dw $2101,$01F8                                                       ;A3B116;
    db $EC                                                               ;A3B11A;
    dw $2100,$C20C                                                       ;A3B11B;
    db $04                                                               ;A3B11F;
    dw $6106,$C3E4                                                       ;A3B120;
    db $04                                                               ;A3B124;
    dw $2106,$C208                                                       ;A3B125;
    db $F4                                                               ;A3B129;
    dw $6104,$C3E8                                                       ;A3B12A;
    db $F4                                                               ;A3B12E;
    dw $2104,$C3F8                                                       ;A3B12F;
    db $F4                                                               ;A3B133;
    dw $2110                                                             ;A3B134;

Spritemap_SidehopperTourian_1:
    dw $0007,$C3F8                                                       ;A3B136;
    db $F6                                                               ;A3B13A;
    dw $2112,$C20D                                                       ;A3B13B;
    db $04                                                               ;A3B13F;
    dw $610A,$C3E3                                                       ;A3B140;
    db $04                                                               ;A3B144;
    dw $210A,$C208                                                       ;A3B145;
    db $F4                                                               ;A3B149;
    dw $6108,$C3E8                                                       ;A3B14A;
    db $F4                                                               ;A3B14E;
    dw $2108,$0000                                                       ;A3B14F;
    db $EE                                                               ;A3B153;
    dw $2101,$01F8                                                       ;A3B154;
    db $EE                                                               ;A3B158;
    dw $2100                                                             ;A3B159;

Spritemap_SidehopperTourian_2:
    dw $000B,$0010                                                       ;A3B15B;
    db $0C                                                               ;A3B15F;
    dw $6102,$0008                                                       ;A3B160;
    db $0C                                                               ;A3B164;
    dw $6103,$01F0                                                       ;A3B165;
    db $0C                                                               ;A3B169;
    dw $2103,$01E8                                                       ;A3B16A;
    db $0C                                                               ;A3B16E;
    dw $2102,$C208                                                       ;A3B16F;
    db $FC                                                               ;A3B173;
    dw $610E,$C3E8                                                       ;A3B174;
    db $FC                                                               ;A3B178;
    dw $210E,$C208                                                       ;A3B179;
    db $EC                                                               ;A3B17D;
    dw $610C,$C3E8                                                       ;A3B17E;
    db $EC                                                               ;A3B182;
    dw $210C,$0000                                                       ;A3B183;
    db $E3                                                               ;A3B187;
    dw $2101,$01F8                                                       ;A3B188;
    db $E3                                                               ;A3B18C;
    dw $2100,$C3F8                                                       ;A3B18D;
    db $EB                                                               ;A3B191;
    dw $2110                                                             ;A3B192;

Spritemap_SidehopperTourian_3:
    dw $0007,$0000                                                       ;A3B194;
    db $0C                                                               ;A3B198;
    dw $A101,$01F8                                                       ;A3B199;
    db $0C                                                               ;A3B19D;
    dw $A100,$C20C                                                       ;A3B19E;
    db $EC                                                               ;A3B1A2;
    dw $E106,$C3E4                                                       ;A3B1A3;
    db $EC                                                               ;A3B1A7;
    dw $A106,$C208                                                       ;A3B1A8;
    db $FC                                                               ;A3B1AC;
    dw $E104,$C3E8                                                       ;A3B1AD;
    db $FC                                                               ;A3B1B1;
    dw $A104,$C3F8                                                       ;A3B1B2;
    db $FC                                                               ;A3B1B6;
    dw $A110                                                             ;A3B1B7;

Spritemap_SidehopperTourian_4:
    dw $0007,$C3F8                                                       ;A3B1B9;
    db $FA                                                               ;A3B1BD;
    dw $A112,$C20D                                                       ;A3B1BE;
    db $EC                                                               ;A3B1C2;
    dw $E10A,$C3E3                                                       ;A3B1C3;
    db $EC                                                               ;A3B1C7;
    dw $A10A,$C208                                                       ;A3B1C8;
    db $FC                                                               ;A3B1CC;
    dw $E108,$C3E8                                                       ;A3B1CD;
    db $FC                                                               ;A3B1D1;
    dw $A108,$0000                                                       ;A3B1D2;
    db $0A                                                               ;A3B1D6;
    dw $A101,$01F8                                                       ;A3B1D7;
    db $0A                                                               ;A3B1DB;
    dw $A100                                                             ;A3B1DC;

Spritemap_SidehopperTourian_5:
    dw $000B,$0010                                                       ;A3B1DE;
    db $EC                                                               ;A3B1E2;
    dw $E102,$0008                                                       ;A3B1E3;
    db $EC                                                               ;A3B1E7;
    dw $E103,$01F0                                                       ;A3B1E8;
    db $EC                                                               ;A3B1EC;
    dw $A103,$01E8                                                       ;A3B1ED;
    db $EC                                                               ;A3B1F1;
    dw $A102,$C208                                                       ;A3B1F2;
    db $F4                                                               ;A3B1F6;
    dw $E10E,$C3E8                                                       ;A3B1F7;
    db $F4                                                               ;A3B1FB;
    dw $A10E,$C208                                                       ;A3B1FC;
    db $04                                                               ;A3B200;
    dw $E10C,$C3E8                                                       ;A3B201;
    db $04                                                               ;A3B205;
    dw $A10C,$0000                                                       ;A3B206;
    db $15                                                               ;A3B20A;
    dw $A101,$01F8                                                       ;A3B20B;
    db $15                                                               ;A3B20F;
    dw $A100,$C3F8                                                       ;A3B210;
    db $05                                                               ;A3B214;
    dw $A110                                                             ;A3B215;

Palette_DessgeegaLarge:
    dw $3800,$72FA                                                       ;A3B217;
    db $B0                                                               ;A3B21B;
    dw $4555,$0128                                                       ;A3B21C;
    db $18                                                               ;A3B220;
    dw $6210,$496B                                                       ;A3B221;
    db $C6                                                               ;A3B225;
    dw $6338,$1F2C                                                       ;A3B226;
    db $24                                                               ;A3B22A;
    dw $1C17,$142F                                                       ;A3B22B;
    db $47                                                               ;A3B22F;
    dw $E00C,$A003                                                       ;A3B230;
    db $02                                                               ;A3B234;
    dw $0140                                                             ;A3B235;

InstList_DessgeegaLarge_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3B237;
    dw $0001                                                             ;A3B239;
    dw Spritemap_DessgeegaLarge_2                                        ;A3B23B;
    dw Instruction_CommonA3_Sleep                                        ;A3B23D;

InstList_DessgeegaLarge_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3B23F;
    dw $0002                                                             ;A3B241;
    dw Spritemap_DessgeegaLarge_0                                        ;A3B243;
    dw $0005                                                             ;A3B245;
    dw Spritemap_DessgeegaLarge_1                                        ;A3B247;
    dw $0002                                                             ;A3B249;
    dw Spritemap_DessgeegaLarge_0                                        ;A3B24B;
    dw $0003                                                             ;A3B24D;
    dw Spritemap_DessgeegaLarge_1                                        ;A3B24F;
    dw Instruction_Hopper_ReadyToHop                                     ;A3B251;
    dw Instruction_Common_Sleep                                          ;A3B253;

InstList_DessgeegaLarge_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3B255;
    dw $0001                                                             ;A3B257;
    dw Spritemap_DessgeegaLarge_5                                        ;A3B259;
    dw Instruction_Common_Sleep                                          ;A3B25B;

InstList_DessgeegaLarge_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3B25D;
    dw $0002                                                             ;A3B25F;
    dw Spritemap_DessgeegaLarge_3                                        ;A3B261;
    dw $0005                                                             ;A3B263;
    dw Spritemap_DessgeegaLarge_4                                        ;A3B265;
    dw $0002                                                             ;A3B267;
    dw Spritemap_DessgeegaLarge_3                                        ;A3B269;
    dw $0003                                                             ;A3B26B;
    dw Spritemap_DessgeegaLarge_4                                        ;A3B26D;
    dw Instruction_Hopper_ReadyToHop                                     ;A3B26F;
    dw Instruction_Common_Sleep                                          ;A3B271;

Spritemap_DessgeegaLarge_0:
    dw $0009,$C3F8                                                       ;A3B273;
    db $F5                                                               ;A3B277;
    dw $2100,$C3E5                                                       ;A3B278;
    db $F4                                                               ;A3B27C;
    dw $2104,$C20B                                                       ;A3B27D;
    db $F4                                                               ;A3B281;
    dw $6104,$0006                                                       ;A3B282;
    db $F5                                                               ;A3B286;
    dw $611A,$01F2                                                       ;A3B287;
    db $F5                                                               ;A3B28B;
    dw $211A,$C20B                                                       ;A3B28C;
    db $04                                                               ;A3B290;
    dw $6106,$C3E5                                                       ;A3B291;
    db $04                                                               ;A3B295;
    dw $2106,$0000                                                       ;A3B296;
    db $ED                                                               ;A3B29A;
    dw $210D,$01F8                                                       ;A3B29B;
    db $ED                                                               ;A3B29F;
    dw $210C                                                             ;A3B2A0;

Spritemap_DessgeegaLarge_1:
    dw $0009,$C3F8                                                       ;A3B2A2;
    db $F6                                                               ;A3B2A6;
    dw $2102,$C20A                                                       ;A3B2A7;
    db $F4                                                               ;A3B2AB;
    dw $6104,$C3E6                                                       ;A3B2AC;
    db $F4                                                               ;A3B2B0;
    dw $2104,$0006                                                       ;A3B2B1;
    db $F6                                                               ;A3B2B5;
    dw $611C,$01F2                                                       ;A3B2B6;
    db $F6                                                               ;A3B2BA;
    dw $211C,$C20B                                                       ;A3B2BB;
    db $04                                                               ;A3B2BF;
    dw $6106,$C3E5                                                       ;A3B2C0;
    db $04                                                               ;A3B2C4;
    dw $2106,$0000                                                       ;A3B2C5;
    db $EE                                                               ;A3B2C9;
    dw $210B,$01F8                                                       ;A3B2CA;
    db $EE                                                               ;A3B2CE;
    dw $210A                                                             ;A3B2CF;

Spritemap_DessgeegaLarge_2:
    dw $000B,$C3F8                                                       ;A3B2D1;
    db $F0                                                               ;A3B2D5;
    dw $2100,$C20B                                                       ;A3B2D6;
    db $F4                                                               ;A3B2DA;
    dw $6104,$C3E5                                                       ;A3B2DB;
    db $F4                                                               ;A3B2DF;
    dw $2104,$0007                                                       ;A3B2E0;
    db $F4                                                               ;A3B2E4;
    dw $611B,$01F1                                                       ;A3B2E5;
    db $F4                                                               ;A3B2E9;
    dw $211B,$0000                                                       ;A3B2EA;
    db $E8                                                               ;A3B2EE;
    dw $210D,$01F8                                                       ;A3B2EF;
    db $E8                                                               ;A3B2F3;
    dw $210C,$C20A                                                       ;A3B2F4;
    db $14                                                               ;A3B2F8;
    dw $610E,$C3E6                                                       ;A3B2F9;
    db $14                                                               ;A3B2FD;
    dw $210E,$C20A                                                       ;A3B2FE;
    db $04                                                               ;A3B302;
    dw $6108,$C3E6                                                       ;A3B303;
    db $04                                                               ;A3B307;
    dw $2108                                                             ;A3B308;

Spritemap_DessgeegaLarge_3:
    dw $0009,$C3F8                                                       ;A3B30A;
    db $FB                                                               ;A3B30E;
    dw $A100,$C3E5                                                       ;A3B30F;
    db $FC                                                               ;A3B313;
    dw $A104,$C20B                                                       ;A3B314;
    db $FC                                                               ;A3B318;
    dw $E104,$0006                                                       ;A3B319;
    db $03                                                               ;A3B31D;
    dw $E11A,$01F2                                                       ;A3B31E;
    db $03                                                               ;A3B322;
    dw $A11A,$C20B                                                       ;A3B323;
    db $EC                                                               ;A3B327;
    dw $E106,$C3E5                                                       ;A3B328;
    db $EC                                                               ;A3B32C;
    dw $A106,$0000                                                       ;A3B32D;
    db $0B                                                               ;A3B331;
    dw $A10D,$01F8                                                       ;A3B332;
    db $0B                                                               ;A3B336;
    dw $A10C                                                             ;A3B337;

Spritemap_DessgeegaLarge_4:
    dw $0009,$C3F8                                                       ;A3B339;
    db $FA                                                               ;A3B33D;
    dw $A102,$C20A                                                       ;A3B33E;
    db $FC                                                               ;A3B342;
    dw $E104,$C3E6                                                       ;A3B343;
    db $FC                                                               ;A3B347;
    dw $A104,$0006                                                       ;A3B348;
    db $02                                                               ;A3B34C;
    dw $E11C,$01F2                                                       ;A3B34D;
    db $02                                                               ;A3B351;
    dw $A11C,$C20B                                                       ;A3B352;
    db $EC                                                               ;A3B356;
    dw $E106,$C3E5                                                       ;A3B357;
    db $EC                                                               ;A3B35B;
    dw $A106,$0000                                                       ;A3B35C;
    db $0A                                                               ;A3B360;
    dw $A10B,$01F8                                                       ;A3B361;
    db $0A                                                               ;A3B365;
    dw $A10A                                                             ;A3B366;

Spritemap_DessgeegaLarge_5:
    dw $000B,$C3F8                                                       ;A3B368;
    db $04                                                               ;A3B36C;
    dw $A100,$C20B                                                       ;A3B36D;
    db $00                                                               ;A3B371;
    dw $E104,$C3E5                                                       ;A3B372;
    db $00                                                               ;A3B376;
    dw $A104,$0007                                                       ;A3B377;
    db $08                                                               ;A3B37B;
    dw $E11B,$01F1                                                       ;A3B37C;
    db $08                                                               ;A3B380;
    dw $A11B,$0000                                                       ;A3B381;
    db $14                                                               ;A3B385;
    dw $A10D,$01F8                                                       ;A3B386;
    db $14                                                               ;A3B38A;
    dw $A10C,$C20A                                                       ;A3B38B;
    db $E0                                                               ;A3B38F;
    dw $E10E,$C3E6                                                       ;A3B390;
    db $E0                                                               ;A3B394;
    dw $A10E,$C20A                                                       ;A3B395;
    db $F0                                                               ;A3B399;
    dw $E108,$C3E6                                                       ;A3B39A;
    db $F0                                                               ;A3B39E;
    dw $A108                                                             ;A3B39F;

Palette_Zoa:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3B3A1;
    dw $2C63,$1D79,$1933,$150E,$10C8,$3BE0,$2680,$1580                   ;A3B3B1;

InstList_Zoa_FacingLeft_Shooting:
    dw Instruction_Zoa_SetXSpeedTableIndexTo4                            ;A3B3C1;
    dw $0040                                                             ;A3B3C3;
    dw Spritemap_Zoa_0                                                   ;A3B3C5;
    dw Instruction_Zoa_SetXSpeedTableIndexTo8                            ;A3B3C7;
    dw $0008                                                             ;A3B3C9;
    dw Spritemap_Zoa_1                                                   ;A3B3CB;
    dw Instruction_Zoa_SetXSpeedTableIndexToC                            ;A3B3CD;
    dw $0030                                                             ;A3B3CF;
    dw Spritemap_Zoa_2                                                   ;A3B3D1;
    dw Instruction_Common_GotoY                                          ;A3B3D3;
    dw InstList_Zoa_FacingLeft_Shooting                                  ;A3B3D5;

InstList_Zoa_FacingLeft_Rising:
    dw $0004                                                             ;A3B3D7;
    dw Spritemap_Zoa_4                                                   ;A3B3D9;
    dw $0004                                                             ;A3B3DB;
    dw Spritemap_Zoa_3                                                   ;A3B3DD;
    dw $0004                                                             ;A3B3DF;
    dw Spritemap_Zoa_5                                                   ;A3B3E1;
    dw Instruction_Common_GotoY                                          ;A3B3E3;
    dw InstList_Zoa_FacingLeft_Rising                                    ;A3B3E5;

InstList_Zoa_FacingRight_Shooting:
    dw Instruction_Zoa_SetXSpeedTableIndexTo4                            ;A3B3E7;
    dw $0040                                                             ;A3B3E9;
    dw Spritemap_Zoa_6                                                   ;A3B3EB;
    dw Instruction_Zoa_SetXSpeedTableIndexTo8                            ;A3B3ED;
    dw $0008                                                             ;A3B3EF;
    dw Spritemap_Zoa_7                                                   ;A3B3F1;
    dw Instruction_Zoa_SetXSpeedTableIndexToC                            ;A3B3F3;
    dw $0030                                                             ;A3B3F5;
    dw Spritemap_Zoa_8                                                   ;A3B3F7;
    dw Instruction_Common_GotoY                                          ;A3B3F9;
    dw InstList_Zoa_FacingRight_Shooting                                 ;A3B3FB;

InstList_Zoa_FacingRight_Rising:
    dw $0004                                                             ;A3B3FD;
    dw Spritemap_Zoa_A                                                   ;A3B3FF;
    dw $0004                                                             ;A3B401;
    dw Spritemap_Zoa_9                                                   ;A3B403;
    dw $0004                                                             ;A3B405;
    dw Spritemap_Zoa_B                                                   ;A3B407;
    dw Instruction_Common_GotoY                                          ;A3B409;
    dw InstList_Zoa_FacingRight_Rising                                   ;A3B40B;

InstListPointers_Zoa:
    dw InstList_Zoa_FacingLeft_Shooting                                  ;A3B40D;
    dw InstList_Zoa_FacingLeft_Rising                                    ;A3B40F;
    dw InstList_Zoa_FacingRight_Shooting                                 ;A3B411;
    dw InstList_Zoa_FacingRight_Rising                                   ;A3B413;

ZoaXSpeedTable_speed:
    dw $0000                                                             ;A3B415;

ZoaXSpeedTable_subSpeed:
    dw $0000,$0000,$8000,$0000,$A000,$0002,$0000,$0000                   ;A3B417;
    dw $0000                                                             ;A3B427;

Instruction_Zoa_SetXSpeedTableIndexTo4:
    LDX.W $0E54                                                          ;A3B429;
    LDA.W #$0004                                                         ;A3B42C;
    STA.L $7E7800,X                                                      ;A3B42F;
    RTL                                                                  ;A3B433;


Instruction_Zoa_SetXSpeedTableIndexTo8:
    LDX.W $0E54                                                          ;A3B434;
    LDA.W #$0008                                                         ;A3B437;
    STA.L $7E7800,X                                                      ;A3B43A;
    RTL                                                                  ;A3B43E;


Instruction_Zoa_SetXSpeedTableIndexToC:
    LDX.W $0E54                                                          ;A3B43F;
    LDA.W #$000C                                                         ;A3B442;
    STA.L $7E7800,X                                                      ;A3B445;
    RTL                                                                  ;A3B449;


InitAI_Zoa:
    LDX.W $0E54                                                          ;A3B44A;
    LDA.W #Function_Zoa_WaitForSamusToGetNear                            ;A3B44D;
    STA.W EnemyData.initParam0,X                                         ;A3B450;
    LDA.W #$0000                                                         ;A3B453;
    STA.W EnemyData.work3,X                                              ;A3B456;
    STA.W EnemyData.work4,X                                              ;A3B459;
    STA.L $7E7800,X                                                      ;A3B45C;
    LDA.W #InstList_Zoa_FacingLeft_Shooting                              ;A3B460;
    STA.W EnemyData.pInstList,X                                          ;A3B463;
    LDA.W EnemyData.properties,X                                         ;A3B466;
    ORA.W #$0100                                                         ;A3B469;
    STA.W EnemyData.properties,X                                         ;A3B46C;
    LDA.W EnemyData.xPosition,X                                          ;A3B46F;
    STA.W EnemyData.work1,X                                              ;A3B472;
    LDA.W EnemyData.yPosition,X                                          ;A3B475;
    STA.W EnemyData.work2,X                                              ;A3B478;
    RTL                                                                  ;A3B47B;


MainAI_Zoa:
    LDX.W $0E54                                                          ;A3B47C;
    JMP.W ($0FB4,X)                                                      ;A3B47F;


Function_Zoa_WaitForSamusToGetNear:
    LDX.W $0E54                                                          ;A3B482;
    LDA.W #$0080                                                         ;A3B485;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A3B488;
    BEQ .return                                                          ;A3B48C;
    LDY.W #$0001                                                         ;A3B48E;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A3B491;
    BMI .keepLeft                                                        ;A3B495;
    LDY.W #$0003                                                         ;A3B497;

.keepLeft:
    TYA                                                                  ;A3B49A;
    STA.W EnemyData.work3,X                                              ;A3B49B;
    JSR.W SetZoaInstList                                                 ;A3B49E;
    LDA.W #Function_Zoa_Rising                                           ;A3B4A1;
    STA.W EnemyData.initParam0,X                                         ;A3B4A4;

.return:
    RTL                                                                  ;A3B4A7;


Function_Zoa_Rising:
    LDA.W EnemyData.properties,X                                         ;A3B4A8;
    AND.W #$FEFF                                                         ;A3B4AB;
    STA.W EnemyData.properties,X                                         ;A3B4AE;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A3B4B1;
    BMI .rising                                                          ;A3B4B5;
    DEC.W EnemyData.work3,X                                              ;A3B4B7;
    JSR.W SetZoaInstList                                                 ;A3B4BA;
    STZ.W EnemyData.work5,X                                              ;A3B4BD;
    LDA.W #Function_Zoa_Shooting                                         ;A3B4C0;
    STA.W EnemyData.initParam0,X                                         ;A3B4C3;
    RTL                                                                  ;A3B4C6;


.rising:
    LDA.W #$0000                                                         ;A3B4C7;
    STA.B $14                                                            ;A3B4CA;
    LDA.W #$8000                                                         ;A3B4CC;
    STA.B $12                                                            ;A3B4CF;
    JSL.L MoveEnemyY_minus_12_14                                         ;A3B4D1;
    RTL                                                                  ;A3B4D5;


Function_Zoa_Shooting:
    LDA.W EnemyData.work3,X                                              ;A3B4D6;
    BEQ .right                                                           ;A3B4D9;
    LDA.L $7E7800,X                                                      ;A3B4DB;
    TAY                                                                  ;A3B4DF;
    LDA.W ZoaXSpeedTable_speed,Y                                         ;A3B4E0;
    STA.B $14                                                            ;A3B4E3;
    LDA.W ZoaXSpeedTable_subSpeed,Y                                      ;A3B4E5;
    STA.B $12                                                            ;A3B4E8;
    JSL.L MoveEnemyX_plus_12_14                                          ;A3B4EA;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A3B4EE;
    BNE .offScreen                                                       ;A3B4F2;
    JSR.W SetZoaInstList                                                 ;A3B4F4;
    RTL                                                                  ;A3B4F7;


.right:
    LDA.L $7E7800,X                                                      ;A3B4F8;
    TAY                                                                  ;A3B4FC;
    LDA.W ZoaXSpeedTable_speed,Y                                         ;A3B4FD;
    STA.B $14                                                            ;A3B500;
    LDA.W ZoaXSpeedTable_subSpeed,Y                                      ;A3B502;
    STA.B $12                                                            ;A3B505;
    JSL.L MoveEnemyX_minus_12_14                                         ;A3B507;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A3B50B;
    BNE .offScreen                                                       ;A3B50F;
    JSR.W SetZoaInstList                                                 ;A3B511;
    RTL                                                                  ;A3B514;


.offScreen:
    LDA.W EnemyData.properties,X                                         ;A3B515;
    ORA.W #$0100                                                         ;A3B518;
    STA.W EnemyData.properties,X                                         ;A3B51B;
    LDA.W EnemyData.work1,X                                              ;A3B51E;
    STA.W EnemyData.xPosition,X                                          ;A3B521;
    LDA.W EnemyData.work2,X                                              ;A3B524;
    STA.W EnemyData.yPosition,X                                          ;A3B527;
    STZ.W EnemyData.work3,X                                              ;A3B52A;
    JSR.W SetZoaInstList                                                 ;A3B52D;
    LDA.W #Function_Zoa_WaitForSamusToGetNear                            ;A3B530;
    STA.W EnemyData.initParam0,X                                         ;A3B533;
    RTL                                                                  ;A3B536;


SetZoaInstList:
    LDX.W $0E54                                                          ;A3B537;
    LDA.W EnemyData.work3,X                                              ;A3B53A;
    CMP.W EnemyData.work4,X                                              ;A3B53D;
    BEQ .return                                                          ;A3B540;
    STA.W EnemyData.work4,X                                              ;A3B542;
    ASL A                                                                ;A3B545;
    TAY                                                                  ;A3B546;
    LDA.W InstListPointers_Zoa,Y                                         ;A3B547;
    STA.W EnemyData.pInstList,X                                          ;A3B54A;
    LDA.W #$0001                                                         ;A3B54D;
    STA.W EnemyData.instTimer,X                                          ;A3B550;
    STZ.W EnemyData.loopCounter,X                                        ;A3B553;

.return:
    RTS                                                                  ;A3B556;


UNUSED_GetEnemyIndex_A3B557:
    LDX.W $0E54                                                          ;A3B557;
    RTL                                                                  ;A3B55A;


UNUSED_GetEnemyIndex_A3B55B:
    LDX.W $0E54                                                          ;A3B55B;
    RTL                                                                  ;A3B55E;


Spritemap_Zoa_0:
    dw $0001,$81F8                                                       ;A3B55F;
    db $F8                                                               ;A3B563;
    dw $2100                                                             ;A3B564;

Spritemap_Zoa_1:
    dw $0001,$81F8                                                       ;A3B566;
    db $F8                                                               ;A3B56A;
    dw $2102                                                             ;A3B56B;

Spritemap_Zoa_2:
    dw $0001,$81F8                                                       ;A3B56D;
    db $F8                                                               ;A3B571;
    dw $2104                                                             ;A3B572;

Spritemap_Zoa_3:
    dw $0001,$81F8                                                       ;A3B574;
    db $F8                                                               ;A3B578;
    dw $2106                                                             ;A3B579;

Spritemap_Zoa_4:
    dw $0001,$81F8                                                       ;A3B57B;
    db $F8                                                               ;A3B57F;
    dw $2108                                                             ;A3B580;

Spritemap_Zoa_5:
    dw $0001,$81F8                                                       ;A3B582;
    db $F8                                                               ;A3B586;
    dw $210A                                                             ;A3B587;

Spritemap_Zoa_6:
    dw $0001,$81F8                                                       ;A3B589;
    db $F8                                                               ;A3B58D;
    dw $6100                                                             ;A3B58E;

Spritemap_Zoa_7:
    dw $0001,$81F8                                                       ;A3B590;
    db $F8                                                               ;A3B594;
    dw $6102                                                             ;A3B595;

Spritemap_Zoa_8:
    dw $0001,$81F8                                                       ;A3B597;
    db $F8                                                               ;A3B59B;
    dw $6104                                                             ;A3B59C;

Spritemap_Zoa_9:
    dw $0001,$81F8                                                       ;A3B59E;
    db $F8                                                               ;A3B5A2;
    dw $6106                                                             ;A3B5A3;

Spritemap_Zoa_A:
    dw $0001,$81F8                                                       ;A3B5A5;
    db $F8                                                               ;A3B5A9;
    dw $6108                                                             ;A3B5AA;

Spritemap_Zoa_B:
    dw $0001,$81F8                                                       ;A3B5AC;
    db $F8                                                               ;A3B5B0;
    dw $610A                                                             ;A3B5B1;

Palette_Viola:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A3B5B3;
    dw $35A0,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140                   ;A3B5C3;

InstList_Viola_UpsideDown:
    dw Instruction_Crawlers_FunctionInY                                  ;A3B5D3;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3B5D5;
    dw Instruction_Common_GotoY                                          ;A3B5D7;
    dw InstList_Viola_Normal                                             ;A3B5D9;

InstList_Viola_UpsideUp:
    dw Instruction_Crawlers_FunctionInY                                  ;A3B5DB;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3B5DD;
    dw Instruction_Common_GotoY                                          ;A3B5DF;
    dw InstList_Viola_Normal                                             ;A3B5E1;

InstList_Viola_UpsideRight:
    dw Instruction_Crawlers_FunctionInY                                  ;A3B5E3;
    dw Function_Crawlers_CrawlingVertically                              ;A3B5E5;
    dw Instruction_Common_GotoY                                          ;A3B5E7;
    dw InstList_Viola_Normal                                             ;A3B5E9;

InstList_Viola_UpsideLeft:
    dw Instruction_Crawlers_FunctionInY                                  ;A3B5EB;
    dw Function_Crawlers_CrawlingVertically                              ;A3B5ED;

InstList_Viola_Normal:
    dw $000A                                                             ;A3B5EF;
    dw Spritemap_Viola_Normal_0                                          ;A3B5F1;
    dw $000A                                                             ;A3B5F3;
    dw Spritemap_Viola_Normal_1                                          ;A3B5F5;
    dw $000A                                                             ;A3B5F7;
    dw Spritemap_Viola_Normal_2                                          ;A3B5F9;
    dw $000A                                                             ;A3B5FB;
    dw Spritemap_Viola_Normal_3                                          ;A3B5FD;
    dw $000A                                                             ;A3B5FF;
    dw Spritemap_Viola_Normal_4                                          ;A3B601;
    dw $000A                                                             ;A3B603;
    dw Spritemap_Viola_Normal_5                                          ;A3B605;
    dw $000A                                                             ;A3B607;
    dw Spritemap_Viola_Normal_6                                          ;A3B609;
    dw $000A                                                             ;A3B60B;
    dw Spritemap_Viola_Normal_7                                          ;A3B60D;
    dw $000A                                                             ;A3B60F;
    dw Spritemap_Viola_Normal_6                                          ;A3B611;
    dw $000A                                                             ;A3B613;
    dw Spritemap_Viola_Normal_5                                          ;A3B615;
    dw $000A                                                             ;A3B617;
    dw Spritemap_Viola_Normal_4                                          ;A3B619;
    dw $000A                                                             ;A3B61B;
    dw Spritemap_Viola_Normal_3                                          ;A3B61D;
    dw $000A                                                             ;A3B61F;
    dw Spritemap_Viola_Normal_2                                          ;A3B621;
    dw $000A                                                             ;A3B623;
    dw Spritemap_Viola_Normal_1                                          ;A3B625;
    dw Instruction_Common_GotoY                                          ;A3B627;
    dw InstList_Viola_Normal                                             ;A3B629;

UNUSED_InstList_Viola_XFlipped_A3B62B:
    dw $0006                                                             ;A3B62B;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6C1                            ;A3B62D;
    dw $0006                                                             ;A3B62F;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6C8                            ;A3B631;
    dw $0006                                                             ;A3B633;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6CF                            ;A3B635;
    dw $0006                                                             ;A3B637;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6D6                            ;A3B639;
    dw $0006                                                             ;A3B63B;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6DD                            ;A3B63D;
    dw $0006                                                             ;A3B63F;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6E4                            ;A3B641;
    dw $0006                                                             ;A3B643;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6EB                            ;A3B645;
    dw $0006                                                             ;A3B647;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6F2                            ;A3B649;
    dw $0006                                                             ;A3B64B;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6EB                            ;A3B64D;
    dw $0006                                                             ;A3B64F;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6E4                            ;A3B651;
    dw $0006                                                             ;A3B653;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6DD                            ;A3B655;
    dw $0006                                                             ;A3B657;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6D6                            ;A3B659;
    dw $0006                                                             ;A3B65B;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6CF                            ;A3B65D;
    dw $0006                                                             ;A3B65F;
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6C8                            ;A3B661;
    dw Instruction_Common_GotoY                                          ;A3B663;
    dw UNUSED_InstList_Viola_XFlipped_A3B62B                             ;A3B665;

InitialInstListPointers_Viola:
    dw InstList_Viola_UpsideRight                                        ;A3B667;
    dw InstList_Viola_UpsideLeft                                         ;A3B669;
    dw InstList_Viola_UpsideDown                                         ;A3B66B;
    dw InstList_Viola_UpsideUp                                           ;A3B66D;

InitAI_Viola:
    LDX.W $0E54                                                          ;A3B66F;
    LDA.W #$0006                                                         ;A3B672;
    STA.W EnemyData.initParam1,X                                         ;A3B675;
    LDA.W EnemyData.properties,X                                         ;A3B678;
    AND.W #$0003                                                         ;A3B67B;
    ASL A                                                                ;A3B67E;
    TAY                                                                  ;A3B67F;
    LDA.W InitialInstListPointers_Viola,Y                                ;A3B680;
    STA.W EnemyData.pInstList,X                                          ;A3B683;
    JMP.W InitAI_Crawlers_Common                                         ;A3B686;


Spritemap_Viola_Normal_0:
    dw $0001,$81F8                                                       ;A3B689;
    db $F8                                                               ;A3B68D;
    dw $2100                                                             ;A3B68E;

Spritemap_Viola_Normal_1:
    dw $0001,$81F8                                                       ;A3B690;
    db $F8                                                               ;A3B694;
    dw $2102                                                             ;A3B695;

Spritemap_Viola_Normal_2:
    dw $0001,$81F8                                                       ;A3B697;
    db $F8                                                               ;A3B69B;
    dw $2104                                                             ;A3B69C;

Spritemap_Viola_Normal_3:
    dw $0001,$81F8                                                       ;A3B69E;
    db $F8                                                               ;A3B6A2;
    dw $2106                                                             ;A3B6A3;

Spritemap_Viola_Normal_4:
    dw $0001,$81F8                                                       ;A3B6A5;
    db $F8                                                               ;A3B6A9;
    dw $2108                                                             ;A3B6AA;

Spritemap_Viola_Normal_5:
    dw $0001,$81F8                                                       ;A3B6AC;
    db $F8                                                               ;A3B6B0;
    dw $210A                                                             ;A3B6B1;

Spritemap_Viola_Normal_6:
    dw $0001,$81F8                                                       ;A3B6B3;
    db $F8                                                               ;A3B6B7;
    dw $210C                                                             ;A3B6B8;

Spritemap_Viola_Normal_7:
    dw $0001,$81F8                                                       ;A3B6BA;
    db $F8                                                               ;A3B6BE;
    dw $210E                                                             ;A3B6BF;

UNUSED_Spritemap_Viola_XFlipped_A3B6C1:
    dw $0001,$81F8                                                       ;A3B6C1;
    db $F8                                                               ;A3B6C5;
    dw $6100                                                             ;A3B6C6;

UNUSED_Spritemap_Viola_XFlipped_A3B6C8:
    dw $0001,$81F8                                                       ;A3B6C8;
    db $F8                                                               ;A3B6CC;
    dw $6102                                                             ;A3B6CD;

UNUSED_Spritemap_Viola_XFlipped_A3B6CF:
    dw $0001,$81F8                                                       ;A3B6CF;
    db $F8                                                               ;A3B6D3;
    dw $6104                                                             ;A3B6D4;

UNUSED_Spritemap_Viola_XFlipped_A3B6D6:
    dw $0001,$81F8                                                       ;A3B6D6;
    db $F8                                                               ;A3B6DA;
    dw $6106                                                             ;A3B6DB;

UNUSED_Spritemap_Viola_XFlipped_A3B6DD:
    dw $0001,$81F8                                                       ;A3B6DD;
    db $F8                                                               ;A3B6E1;
    dw $6108                                                             ;A3B6E2;

UNUSED_Spritemap_Viola_XFlipped_A3B6E4:
    dw $0001,$81F8                                                       ;A3B6E4;
    db $F8                                                               ;A3B6E8;
    dw $610A                                                             ;A3B6E9;

UNUSED_Spritemap_Viola_XFlipped_A3B6EB:
    dw $0001,$81F8                                                       ;A3B6EB;
    db $F8                                                               ;A3B6EF;
    dw $610C                                                             ;A3B6F0;

UNUSED_Spritemap_Viola_XFlipped_A3B6F2:
    dw $0001,$81F8                                                       ;A3B6F2;
    db $F8                                                               ;A3B6F6;
    dw $610E                                                             ;A3B6F7;

UNUSED_CrashIfEnemyInitParamIsNonZero_A3B6F9:
    LDX.W $0E54                                                          ;A3B6F9;
    LDA.W EnemyData.pInstList,X                                          ;A3B6FC;

.crash:
    BNE .crash                                                           ;A3B6FF;
    RTL                                                                  ;A3B701;


Palette_Bang:
    dw $3800,$013F,$00D8,$0091,$002B,$7F12,$5B13,$2B15                   ;A3B702;
    dw $0318,$6A03,$5DA2,$40E1,$2C60,$2020,$7FFF,$0842                   ;A3B712;

InstListPointers_Bang:
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

InstList_Bang_Core_Growth0_Idling:
    dw $0020                                                             ;A3B75E;
    dw Spritemap_Bang_Growth0_Idling_0                                   ;A3B760;
    dw $000D                                                             ;A3B762;
    dw Spritemap_Bang_Growth0_Idling_2                                   ;A3B764;
    dw $0010                                                             ;A3B766;
    dw Spritemap_Bang_Growth0_Idling_4                                   ;A3B768;
    dw $000D                                                             ;A3B76A;
    dw Spritemap_Bang_Growth0_Idling_2                                   ;A3B76C;
    dw Instruction_Common_GotoY                                          ;A3B76E;
    dw InstList_Bang_Core_Growth0_Idling                                 ;A3B770;

InstList_Bang_Core_Growth0_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B772;
    dw $0004                                                             ;A3B774;
    dw Spritemap_Bang_Growth0_Growing_0                                  ;A3B776;
    dw $0008                                                             ;A3B778;
    dw Spritemap_Bang_Growth0_Growing_1                                  ;A3B77A;
    dw $0004                                                             ;A3B77C;
    dw Spritemap_Bang_Growth0_Growing_0                                  ;A3B77E;
    dw $0002                                                             ;A3B780;
    dw Spritemap_Bang_Growth0_Growing_2                                  ;A3B782;
    dw $0004                                                             ;A3B784;
    dw Spritemap_Bang_Growth0_Growing_4                                  ;A3B786;
    dw $0010                                                             ;A3B788;
    dw Spritemap_Bang_Growth0_Growing_6                                  ;A3B78A;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B78C;
    dw Instruction_Common_Sleep                                          ;A3B78E;

InstList_Bang_Core_Growth1_Idling:
    dw $0010                                                             ;A3B790;
    dw Spritemap_Bang_Growth1_Idling_0                                   ;A3B792;
    dw $0008                                                             ;A3B794;
    dw Spritemap_Bang_Growth1_Idling_2                                   ;A3B796;
    dw $000D                                                             ;A3B798;
    dw Spritemap_Bang_Growth1_Idling_4                                   ;A3B79A;
    dw $0008                                                             ;A3B79C;
    dw Spritemap_Bang_Growth1_Idling_2                                   ;A3B79E;
    dw Instruction_Common_GotoY                                          ;A3B7A0;
    dw InstList_Bang_Core_Growth1_Idling                                 ;A3B7A2;

InstList_Bang_Core_Growth1_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B7A4;
    dw $0004                                                             ;A3B7A6;
    dw Spritemap_Bang_Growth1_Growing_0                                  ;A3B7A8;
    dw $0008                                                             ;A3B7AA;
    dw Spritemap_Bang_Growth1_Growing_1                                  ;A3B7AC;
    dw $0004                                                             ;A3B7AE;
    dw Spritemap_Bang_Growth1_Growing_0                                  ;A3B7B0;
    dw $0002                                                             ;A3B7B2;
    dw Spritemap_Bang_Growth1_Growing_2                                  ;A3B7B4;
    dw $0004                                                             ;A3B7B6;
    dw Spritemap_Bang_Growth1_Growing_4                                  ;A3B7B8;
    dw $0010                                                             ;A3B7BA;
    dw Spritemap_Bang_Growth1_Growing_6                                  ;A3B7BC;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B7BE;
    dw Instruction_Common_Sleep                                          ;A3B7C0;

InstList_Bang_Core_Growth2_Idling:
    dw $000C                                                             ;A3B7C2;
    dw Spritemap_Bang_Growth2_Idling_0                                   ;A3B7C4;
    dw $0006                                                             ;A3B7C6;
    dw Spritemap_Bang_Growth2_Idling_2                                   ;A3B7C8;
    dw $0004                                                             ;A3B7CA;
    dw Spritemap_Bang_Growth2_Idling_4                                   ;A3B7CC;
    dw $0006                                                             ;A3B7CE;
    dw Spritemap_Bang_Growth2_Idling_2                                   ;A3B7D0;
    dw Instruction_Common_GotoY                                          ;A3B7D2;
    dw InstList_Bang_Core_Growth2_Idling                                 ;A3B7D4;

InstList_Bang_Core_Growth2_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B7D6;
    dw $0004                                                             ;A3B7D8;
    dw Spritemap_Bang_Growth2_Growing_0                                  ;A3B7DA;
    dw $0008                                                             ;A3B7DC;
    dw Spritemap_Bang_Growth2_Growing_2                                  ;A3B7DE;
    dw $0004                                                             ;A3B7E0;
    dw Spritemap_Bang_Growth2_Growing_0                                  ;A3B7E2;
    dw $0002                                                             ;A3B7E4;
    dw Spritemap_Bang_Growth2_Growing_4                                  ;A3B7E6;
    dw $0004                                                             ;A3B7E8;
    dw Spritemap_Bang_Growth2_Growing_6                                  ;A3B7EA;
    dw $0010                                                             ;A3B7EC;
    dw Spritemap_Bang_Growth2_Growing_8                                  ;A3B7EE;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B7F0;
    dw Instruction_Common_Sleep                                          ;A3B7F2;

InstList_Bang_Core_Growth3_Idling:
    dw $0008                                                             ;A3B7F4;
    dw Spritemap_Bang_Growth3_Idling_0                                   ;A3B7F6;
    dw $0003                                                             ;A3B7F8;
    dw Spritemap_Bang_Growth3_Idling_2                                   ;A3B7FA;
    dw $0002                                                             ;A3B7FC;
    dw Spritemap_Bang_Growth3_Idling_4                                   ;A3B7FE;
    dw $0003                                                             ;A3B800;
    dw Spritemap_Bang_Growth3_Idling_2                                   ;A3B802;
    dw $0008                                                             ;A3B804;
    dw Spritemap_Bang_Growth3_Idling_6                                   ;A3B806;
    dw $0003                                                             ;A3B808;
    dw Spritemap_Bang_Growth3_Idling_8                                   ;A3B80A;
    dw $0002                                                             ;A3B80C;
    dw Spritemap_Bang_Growth3_Idling_A                                   ;A3B80E;
    dw $0003                                                             ;A3B810;
    dw Spritemap_Bang_Growth3_Idling_8                                   ;A3B812;
    dw $0008                                                             ;A3B814;
    dw Spritemap_Bang_Growth3_Idling_0                                   ;A3B816;
    dw $0003                                                             ;A3B818;
    dw Spritemap_Bang_Growth3_Idling_2                                   ;A3B81A;
    dw $0002                                                             ;A3B81C;
    dw Spritemap_Bang_Growth3_Idling_4                                   ;A3B81E;
    dw $0003                                                             ;A3B820;
    dw Spritemap_Bang_Growth3_Idling_2                                   ;A3B822;
    dw $0008                                                             ;A3B824;
    dw Spritemap_Bang_Growth3_Idling_C                                   ;A3B826;
    dw $0003                                                             ;A3B828;
    dw Spritemap_Bang_Growth3_Idling_E                                   ;A3B82A;
    dw $0002                                                             ;A3B82C;
    dw Spritemap_Bang_Growth3_Idling_10                                  ;A3B82E;
    dw $0003                                                             ;A3B830;
    dw Spritemap_Bang_Growth3_Idling_E                                   ;A3B832;
    dw Instruction_Common_GotoY                                          ;A3B834;
    dw InstList_Bang_Core_Growth3_Idling                                 ;A3B836;

InstList_Bang_Core_Growth3_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B838;
    dw $0004                                                             ;A3B83A;
    dw Spritemap_Bang_Growth3_Growing_0                                  ;A3B83C;
    dw $0008                                                             ;A3B83E;
    dw Spritemap_Bang_Growth3_Growing_2                                  ;A3B840;
    dw $0004                                                             ;A3B842;
    dw Spritemap_Bang_Growth3_Growing_0                                  ;A3B844;
    dw $0002                                                             ;A3B846;
    dw Spritemap_Bang_Growth3_Growing_4                                  ;A3B848;
    dw $0004                                                             ;A3B84A;
    dw Spritemap_Bang_Growth3_Growing_6                                  ;A3B84C;
    dw $0004                                                             ;A3B84E;
    dw Spritemap_Bang_Growth3_Growing_8                                  ;A3B850;
    dw $0010                                                             ;A3B852;
    dw Spritemap_Bang_Growth3_Growing_A                                  ;A3B854;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B856;
    dw Instruction_Common_Sleep                                          ;A3B858;

InstList_Bang_Core_Growth4_Idling:
    dw $0006                                                             ;A3B85A;
    dw Spritemap_Bang_Growth4_Idling_0                                   ;A3B85C;
    dw $0002                                                             ;A3B85E;
    dw Spritemap_Bang_Growth4_Idling_2                                   ;A3B860;
    dw $0001                                                             ;A3B862;
    dw Spritemap_Bang_Growth4_Idling_4                                   ;A3B864;
    dw $0002                                                             ;A3B866;
    dw Spritemap_Bang_Growth4_Idling_2                                   ;A3B868;
    dw $0006                                                             ;A3B86A;
    dw Spritemap_Bang_Growth4_Idling_6                                   ;A3B86C;
    dw $0001                                                             ;A3B86E;
    dw Spritemap_Bang_Growth4_Idling_4                                   ;A3B870;
    dw $0002                                                             ;A3B872;
    dw Spritemap_Bang_Growth4_Idling_2                                   ;A3B874;
    dw $0006                                                             ;A3B876;
    dw Spritemap_Bang_Growth4_Idling_8                                   ;A3B878;
    dw $0002                                                             ;A3B87A;
    dw Spritemap_Bang_Growth4_Idling_A                                   ;A3B87C;
    dw $0001                                                             ;A3B87E;
    dw Spritemap_Bang_Growth4_Idling_C                                   ;A3B880;
    dw $0002                                                             ;A3B882;
    dw Spritemap_Bang_Growth4_Idling_A                                   ;A3B884;
    dw Instruction_Common_GotoY                                          ;A3B886;
    dw InstList_Bang_Core_Growth4_Idling                                 ;A3B888;

InstList_Bang_Core_Growth4_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B88A;
    dw $0004                                                             ;A3B88C;
    dw Spritemap_Bang_Growth4_Growing_0                                  ;A3B88E;
    dw $0008                                                             ;A3B890;
    dw Spritemap_Bang_Growth4_Growing_2                                  ;A3B892;
    dw $0004                                                             ;A3B894;
    dw Spritemap_Bang_Growth4_Growing_0                                  ;A3B896;
    dw $0002                                                             ;A3B898;
    dw Spritemap_Bang_Growth4_Growing_4                                  ;A3B89A;
    dw $0004                                                             ;A3B89C;
    dw Spritemap_Bang_Growth4_Growing_6                                  ;A3B89E;
    dw $0004                                                             ;A3B8A0;
    dw Spritemap_Bang_Growth4_Growing_8                                  ;A3B8A2;
    dw $0010                                                             ;A3B8A4;
    dw Spritemap_Bang_Growth4_Growing_A                                  ;A3B8A6;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B8A8;
    dw Instruction_Common_Sleep                                          ;A3B8AA;

InstList_Bang_Shell_Growth0_Idling:
    dw $0020                                                             ;A3B8AC;
    dw Spritemap_Bang_Growth0_Idling_1                                   ;A3B8AE;
    dw $000D                                                             ;A3B8B0;
    dw Spritemap_Bang_Growth0_Idling_3                                   ;A3B8B2;
    dw $0010                                                             ;A3B8B4;
    dw Spritemap_Bang_Growth0_Idling_5                                   ;A3B8B6;
    dw $000D                                                             ;A3B8B8;
    dw Spritemap_Bang_Growth0_Idling_3                                   ;A3B8BA;
    dw Instruction_Common_GotoY                                          ;A3B8BC;
    dw InstList_Bang_Shell_Growth0_Idling                                ;A3B8BE;

InstList_Bang_Shell_Growth0_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B8C0;
    dw $0004                                                             ;A3B8C2;
    dw Spritemap_CommonA3_Nothing                                        ;A3B8C4;
    dw $0008                                                             ;A3B8C6;
    dw Spritemap_CommonA3_Nothing                                        ;A3B8C8;
    dw $0004                                                             ;A3B8CA;
    dw Spritemap_CommonA3_Nothing                                        ;A3B8CC;
    dw $0002                                                             ;A3B8CE;
    dw Spritemap_Bang_Growth0_Growing_3                                  ;A3B8D0;
    dw $0004                                                             ;A3B8D2;
    dw Spritemap_Bang_Growth0_Growing_5                                  ;A3B8D4;
    dw $0010                                                             ;A3B8D6;
    dw Spritemap_Bang_Growth0_Growing_7                                  ;A3B8D8;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B8DA;
    dw Instruction_Common_Sleep                                          ;A3B8DC;

InstList_Bang_Shell_Growth1_Idling:
    dw $0010                                                             ;A3B8DE;
    dw Spritemap_Bang_Growth1_Idling_1                                   ;A3B8E0;
    dw $0008                                                             ;A3B8E2;
    dw Spritemap_Bang_Growth1_Idling_3                                   ;A3B8E4;
    dw $000D                                                             ;A3B8E6;
    dw Spritemap_Bang_Growth1_Idling_5                                   ;A3B8E8;
    dw $0008                                                             ;A3B8EA;
    dw Spritemap_Bang_Growth1_Idling_3                                   ;A3B8EC;
    dw Instruction_Common_GotoY                                          ;A3B8EE;
    dw InstList_Bang_Shell_Growth1_Idling                                ;A3B8F0;

InstList_Bang_Shell_Growth1_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B8F2;
    dw $0004                                                             ;A3B8F4;
    dw Spritemap_CommonA3_Nothing                                        ;A3B8F6;
    dw $0008                                                             ;A3B8F8;
    dw Spritemap_CommonA3_Nothing                                        ;A3B8FA;
    dw $0004                                                             ;A3B8FC;
    dw Spritemap_CommonA3_Nothing                                        ;A3B8FE;
    dw $0002                                                             ;A3B900;
    dw Spritemap_Bang_Growth1_Growing_3                                  ;A3B902;
    dw $0004                                                             ;A3B904;
    dw Spritemap_Bang_Growth1_Growing_5                                  ;A3B906;
    dw $0010                                                             ;A3B908;
    dw Spritemap_Bang_Growth1_Growing_7                                  ;A3B90A;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B90C;
    dw Instruction_Common_Sleep                                          ;A3B90E;

InstList_Bang_Shell_Growth2_Idling:
    dw $000C                                                             ;A3B910;
    dw Spritemap_Bang_Growth2_Idling_1                                   ;A3B912;
    dw $0006                                                             ;A3B914;
    dw Spritemap_Bang_Growth2_Idling_3                                   ;A3B916;
    dw $0004                                                             ;A3B918;
    dw Spritemap_Bang_Growth2_Idling_5                                   ;A3B91A;
    dw $0006                                                             ;A3B91C;
    dw Spritemap_Bang_Growth2_Idling_3                                   ;A3B91E;
    dw Instruction_Common_GotoY                                          ;A3B920;
    dw InstList_Bang_Shell_Growth2_Idling                                ;A3B922;

InstList_Bang_Shell_Growth2_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B924;
    dw $0004                                                             ;A3B926;
    dw Spritemap_Bang_Growth2_Growing_1                                  ;A3B928;
    dw $0008                                                             ;A3B92A;
    dw Spritemap_Bang_Growth2_Growing_3                                  ;A3B92C;
    dw $0004                                                             ;A3B92E;
    dw Spritemap_Bang_Growth2_Growing_1                                  ;A3B930;
    dw $0002                                                             ;A3B932;
    dw Spritemap_Bang_Growth2_Growing_5                                  ;A3B934;
    dw $0004                                                             ;A3B936;
    dw Spritemap_Bang_Growth2_Growing_7                                  ;A3B938;
    dw $0010                                                             ;A3B93A;
    dw Spritemap_Bang_Growth2_Growing_9                                  ;A3B93C;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B93E;
    dw Instruction_Common_Sleep                                          ;A3B940;

InstList_Bang_Shell_Growth3_Idling:
    dw $0008                                                             ;A3B942;
    dw Spritemap_Bang_Growth3_Idling_1                                   ;A3B944;
    dw $0003                                                             ;A3B946;
    dw Spritemap_Bang_Growth3_Idling_3                                   ;A3B948;
    dw $0002                                                             ;A3B94A;
    dw Spritemap_Bang_Growth3_Idling_5                                   ;A3B94C;
    dw $0003                                                             ;A3B94E;
    dw Spritemap_Bang_Growth3_Idling_3                                   ;A3B950;
    dw $0008                                                             ;A3B952;
    dw Spritemap_Bang_Growth3_Idling_7                                   ;A3B954;
    dw $0003                                                             ;A3B956;
    dw Spritemap_Bang_Growth3_Idling_9                                   ;A3B958;
    dw $0002                                                             ;A3B95A;
    dw Spritemap_Bang_Growth3_Idling_B                                   ;A3B95C;
    dw $0003                                                             ;A3B95E;
    dw Spritemap_Bang_Growth3_Idling_9                                   ;A3B960;
    dw $0008                                                             ;A3B962;
    dw Spritemap_Bang_Growth3_Idling_1                                   ;A3B964;
    dw $0003                                                             ;A3B966;
    dw Spritemap_Bang_Growth3_Idling_3                                   ;A3B968;
    dw $0002                                                             ;A3B96A;
    dw Spritemap_Bang_Growth3_Idling_5                                   ;A3B96C;
    dw $0003                                                             ;A3B96E;
    dw Spritemap_Bang_Growth3_Idling_3                                   ;A3B970;
    dw $0008                                                             ;A3B972;
    dw Spritemap_Bang_Growth3_Idling_D                                   ;A3B974;
    dw $0003                                                             ;A3B976;
    dw Spritemap_Bang_Growth3_Idling_F                                   ;A3B978;
    dw $0002                                                             ;A3B97A;
    dw Spritemap_Bang_Growth3_Idling_11                                  ;A3B97C;
    dw $0003                                                             ;A3B97E;
    dw Spritemap_Bang_Growth3_Idling_F                                   ;A3B980;
    dw Instruction_Common_GotoY                                          ;A3B982;
    dw InstList_Bang_Shell_Growth3_Idling                                ;A3B984;

InstList_Bang_Shell_Growth3_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B986;
    dw $0004                                                             ;A3B988;
    dw Spritemap_Bang_Growth3_Growing_1                                  ;A3B98A;
    dw $0008                                                             ;A3B98C;
    dw Spritemap_Bang_Growth3_Growing_3                                  ;A3B98E;
    dw $0004                                                             ;A3B990;
    dw Spritemap_Bang_Growth3_Growing_1                                  ;A3B992;
    dw $0002                                                             ;A3B994;
    dw Spritemap_Bang_Growth3_Growing_5                                  ;A3B996;
    dw $0004                                                             ;A3B998;
    dw Spritemap_Bang_Growth3_Growing_7                                  ;A3B99A;
    dw $0004                                                             ;A3B99C;
    dw Spritemap_Bang_Growth3_Growing_9                                  ;A3B99E;
    dw $0010                                                             ;A3B9A0;
    dw Spritemap_Bang_Growth3_Growing_B                                  ;A3B9A2;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B9A4;
    dw Instruction_Common_Sleep                                          ;A3B9A6;

InstList_Bang_Shell_Growth4_Idling:
    dw $0006                                                             ;A3B9A8;
    dw Spritemap_Bang_Growth4_Idling_1                                   ;A3B9AA;
    dw $0002                                                             ;A3B9AC;
    dw Spritemap_Bang_Growth4_Idling_3                                   ;A3B9AE;
    dw $0001                                                             ;A3B9B0;
    dw Spritemap_Bang_Growth4_Idling_5                                   ;A3B9B2;
    dw $0002                                                             ;A3B9B4;
    dw Spritemap_Bang_Growth4_Idling_3                                   ;A3B9B6;
    dw $0006                                                             ;A3B9B8;
    dw Spritemap_Bang_Growth4_Idling_7                                   ;A3B9BA;
    dw $0001                                                             ;A3B9BC;
    dw Spritemap_Bang_Growth4_Idling_5                                   ;A3B9BE;
    dw $0002                                                             ;A3B9C0;
    dw Spritemap_Bang_Growth4_Idling_3                                   ;A3B9C2;
    dw $0006                                                             ;A3B9C4;
    dw Spritemap_Bang_Growth4_Idling_9                                   ;A3B9C6;
    dw $0002                                                             ;A3B9C8;
    dw Spritemap_Bang_Growth4_Idling_B                                   ;A3B9CA;
    dw $0001                                                             ;A3B9CC;
    dw Spritemap_Bang_Growth4_Idling_D                                   ;A3B9CE;
    dw $0002                                                             ;A3B9D0;
    dw Spritemap_Bang_Growth4_Idling_B                                   ;A3B9D2;
    dw Instruction_Common_GotoY                                          ;A3B9D4;
    dw InstList_Bang_Shell_Growth4_Idling                                ;A3B9D6;

InstList_Bang_Shell_Growth4_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX                              ;A3B9D8;
    dw $0004                                                             ;A3B9DA;
    dw Spritemap_Bang_Growth4_Growing_1                                  ;A3B9DC;
    dw $0008                                                             ;A3B9DE;
    dw Spritemap_Bang_Growth4_Growing_3                                  ;A3B9E0;
    dw $0004                                                             ;A3B9E2;
    dw Spritemap_Bang_Growth4_Growing_1                                  ;A3B9E4;
    dw $0002                                                             ;A3B9E6;
    dw Spritemap_Bang_Growth4_Growing_5                                  ;A3B9E8;
    dw $0004                                                             ;A3B9EA;
    dw Spritemap_Bang_Growth4_Growing_7                                  ;A3B9EC;
    dw $0004                                                             ;A3B9EE;
    dw Spritemap_Bang_Growth4_Growing_9                                  ;A3B9F0;
    dw $0010                                                             ;A3B9F2;
    dw Spritemap_CommonA3_Nothing                                        ;A3B9F4;
    dw Instruction_Bang_SetFinishedGrowingFlagTo1                        ;A3B9F6;
    dw Instruction_Common_Sleep                                          ;A3B9F8;

InstList_Bang_Electricity_None:
    dw $0001                                                             ;A3B9FA;
    dw Spritemap_CommonA3_Nothing                                        ;A3B9FC;
    dw Instruction_Common_Sleep                                          ;A3B9FE;

InstList_Bang_Electricity_Growth3_4_Growing:
    dw $0002                                                             ;A3BA00;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_0                    ;A3BA02;
    dw $0003                                                             ;A3BA04;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_1                    ;A3BA06;
    dw $0004                                                             ;A3BA08;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_2                    ;A3BA0A;
    dw $0002                                                             ;A3BA0C;
    dw Spritemap_CommonA3_Nothing                                        ;A3BA0E;
    dw $0004                                                             ;A3BA10;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_3                    ;A3BA12;
    dw $0002                                                             ;A3BA14;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_4                    ;A3BA16;
    dw $0003                                                             ;A3BA18;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_5                    ;A3BA1A;
    dw $0002                                                             ;A3BA1C;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_6                    ;A3BA1E;
    dw $0004                                                             ;A3BA20;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_7                    ;A3BA22;
    dw $0003                                                             ;A3BA24;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_8                    ;A3BA26;
    dw $000A                                                             ;A3BA28;
    dw Spritemap_CommonA3_Nothing                                        ;A3BA2A;
    dw $0003                                                             ;A3BA2C;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_9                    ;A3BA2E;
    dw $0002                                                             ;A3BA30;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_A                    ;A3BA32;
    dw $0004                                                             ;A3BA34;
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_B                    ;A3BA36;
    dw Instruction_Common_GotoY                                          ;A3BA38;
    dw InstList_Bang_Electricity_Growth3_4_Growing                       ;A3BA3A;

UNSUED_InstList_Bang_Electricity_Growing_A3BA3C:
    dw $0002                                                             ;A3BA3C;
    dw UNUSED_Spritemap_Bang_Electricity_A3C5AE                          ;A3BA3E;
    dw $0003                                                             ;A3BA40;
    dw UNUSED_Spritemap_Bang_Electricity_A3C5BA                          ;A3BA42;
    dw $0004                                                             ;A3BA44;
    dw UNUSED_Spritemap_Bang_Electricity_A3C5C6                          ;A3BA46;
    dw $0002                                                             ;A3BA48;
    dw Spritemap_CommonA3_Nothing                                        ;A3BA4A;
    dw $0004                                                             ;A3BA4C;
    dw UNUSED_Spritemap_Bang_Electricity_A3C5D2                          ;A3BA4E;
    dw $0002                                                             ;A3BA50;
    dw UNUSED_Spritemap_Bang_Electricity_A3C5DE                          ;A3BA52;
    dw $0003                                                             ;A3BA54;
    dw UNUSED_Spritemap_Bang_Electricity_A3C5EA                          ;A3BA56;
    dw $0002                                                             ;A3BA58;
    dw UNUSED_Spritemap_Bang_Electricity_A3C5F6                          ;A3BA5A;
    dw $0004                                                             ;A3BA5C;
    dw UNUSED_Spritemap_Bang_Electricity_A3C602                          ;A3BA5E;
    dw $0003                                                             ;A3BA60;
    dw UNUSED_Spritemap_Bang_Electricity_A3C60E                          ;A3BA62;
    dw $000A                                                             ;A3BA64;
    dw Spritemap_CommonA3_Nothing                                        ;A3BA66;
    dw $0003                                                             ;A3BA68;
    dw UNUSED_Spritemap_Bang_Electricity_A3C61A                          ;A3BA6A;
    dw $0002                                                             ;A3BA6C;
    dw UNUSED_Spritemap_Bang_Electricity_A3C626                          ;A3BA6E;
    dw $0004                                                             ;A3BA70;
    dw UNUSED_Spritemap_Bang_Electricity_A3C632                          ;A3BA72;
    dw Instruction_Common_GotoY                                          ;A3BA74;
    dw UNSUED_InstList_Bang_Electricity_Growing_A3BA3C                   ;A3BA76;

Instruction_Bang_PlayAcquiredSuitSFX:
    PHY                                                                  ;A3BA78;
    PHX                                                                  ;A3BA79;
    LDA.W #$0056                                                         ;A3BA7A;
    JSL.L QueueSound_Lib2_Max6                                           ;A3BA7D;
    PLX                                                                  ;A3BA81;
    PLY                                                                  ;A3BA82;
    RTL                                                                  ;A3BA83;


BangMaxSpeeds:
    dw $02FF,$03FF,$04FF,$05FF,$06FF,$07FF,$08FF,$09FF                   ;A3BA84;

BangAngles:
    dw $00C0,$00E0,$0000,$0020,$0040,$0040,$0060,$0080                   ;A3BA94;
    dw $00A0,$00C0                                                       ;A3BAA4;

Instruction_Bang_SetFinishedGrowingFlagTo1:
    LDX.W $0E54                                                          ;A3BAA8;
    LDA.W #$0001                                                         ;A3BAAB;
    STA.L $7E8004,X                                                      ;A3BAAE;
    RTL                                                                  ;A3BAB2;


InitAI_Bang:
    LDX.W $0E54                                                          ;A3BAB3;
    LDA.W EnemyData.palette,X                                            ;A3BAB6;
    STA.W EnemyData.work1,X                                              ;A3BAB9;
    LDA.W EnemyData.properties,X                                         ;A3BABC;
    ORA.W #$1000                                                         ;A3BABF;
    STA.W EnemyData.properties,X                                         ;A3BAC2;
    LDA.W #Function_Bang_Movement_MovementDelay                          ;A3BAC5;
    STA.W EnemyData.work5,X                                              ;A3BAC8;
    LDA.W #$0010                                                         ;A3BACB;
    STA.L $7E7800,X                                                      ;A3BACE;
    LDA.W #$0000                                                         ;A3BAD2;
    STA.L $7E7802,X                                                      ;A3BAD5;
    STA.L $7E7804,X                                                      ;A3BAD9;
    STA.L $7E8000,X                                                      ;A3BADD;
    STA.L $7E8002,X                                                      ;A3BAE1;
    STA.L $7E8004,X                                                      ;A3BAE5;
    LDA.W EnemyData.initParam1,X                                         ;A3BAE9;
    AND.W #$00FF                                                         ;A3BAEC;
    ASL A                                                                ;A3BAEF;
    TAY                                                                  ;A3BAF0;
    LDA.W BangMaxSpeeds,Y                                                ;A3BAF1;
    STA.L $7E7816,X                                                      ;A3BAF4;
    LDA.W EnemyData.initParam1+1,X                                       ;A3BAF8;
    AND.W #$00FF                                                         ;A3BAFB;
    ASL A                                                                ;A3BAFE;
    ASL A                                                                ;A3BAFF;
    TAY                                                                  ;A3BB00;
    LDA.W BangAccelerationIntervalTimeResetValues_accel,Y                ;A3BB01;
    STA.L $7E7818,X                                                      ;A3BB04;
    STA.L $7E781A,X                                                      ;A3BB08;
    LDA.W BangAccelerationIntervalTimeResetValues_decel,Y                ;A3BB0C;
    STA.L $7E781C,X                                                      ;A3BB0F;
    LDA.W EnemyData.pInstList,X                                          ;A3BB13;
    BNE .idling                                                          ;A3BB16;
    LDA.W #Function_Bang_Movement_GetEnemyIndex                          ;A3BB18;
    STA.W EnemyData.work5,X                                              ;A3BB1B;

.idling:
    LDA.W #InstList_Bang_Core_Growth0_Idling                             ;A3BB1E;
    STA.W EnemyData.pInstList,X                                          ;A3BB21;
    RTL                                                                  ;A3BB24;


MainAI_Bang:
    LDX.W $0E54                                                          ;A3BB25;
    JMP.W ($0FB4,X)                                                      ;A3BB28;


BangAI_Electricity:
    LDX.W $0E54                                                          ;A3BB2B;
    LDA.L $7E8040,X                                                      ;A3BB2E;
    CLC                                                                  ;A3BB32;
    ADC.W #$000A                                                         ;A3BB33;
    STA.L $7E8000,X                                                      ;A3BB36;
    JSR.W SetBangInstList                                                ;A3BB3A;
    LDX.W $0E54                                                          ;A3BB3D;
    LDA.W EnemyData.properties,X                                         ;A3BB40;
    ORA.W #$0400                                                         ;A3BB43;
    STA.W EnemyData.properties,X                                         ;A3BB46;
    RTL                                                                  ;A3BB49;


BangAI_Shell:
    LDX.W $0E54                                                          ;A3BB4A;
    LDA.L $7E7FC0,X                                                      ;A3BB4D;
    CLC                                                                  ;A3BB51;
    ADC.W #$0014                                                         ;A3BB52;
    STA.L $7E8000,X                                                      ;A3BB55;
    JSR.W SetBangInstList                                                ;A3BB59;
    LDA.W EnemyData.properties,X                                         ;A3BB5C;
    ORA.W #$0400                                                         ;A3BB5F;
    STA.W EnemyData.properties,X                                         ;A3BB62;
    RTL                                                                  ;A3BB65;


BangAI_Core:
    LDX.W $0E54                                                          ;A3BB66;
    JSR.W ExecuteBangeMovementFunction                                   ;A3BB69;
    LDA.W EnemyData.xPosition,X                                          ;A3BB6C;
    STA.W $0F3A,X                                                        ;A3BB6F;
    STA.W $0FBA,X                                                        ;A3BB72;
    LDA.W EnemyData.yPosition,X                                          ;A3BB75;
    STA.W $0F3E,X                                                        ;A3BB78;
    STA.W $0FBE,X                                                        ;A3BB7B;
    LDY.W EnemyData.work1,X                                              ;A3BB7E;
    LDA.L $7E8000,X                                                      ;A3BB81;
    AND.W #$0001                                                         ;A3BB85;
    BEQ +                                                                ;A3BB88;
    LDY.W #$0C00                                                         ;A3BB8A;

  + TYA                                                                  ;A3BB8D;
    STA.W EnemyData.palette,X                                            ;A3BB8E;
    JSR.W SetBangInstList                                                ;A3BB91;
    LDA.L $7E8004,X                                                      ;A3BB94;
    BNE +                                                                ;A3BB98;
    RTL                                                                  ;A3BB9A;


  + LDA.W #$0000                                                         ;A3BB9B;
    STA.L $7E8004,X                                                      ;A3BB9E;
    LDA.L $7E8000,X                                                      ;A3BBA2;
    CMP.W #$0009                                                         ;A3BBA6;
    BNE +                                                                ;A3BBA9;
    LDA.W #$0010                                                         ;A3BBAB;
    STA.W EnemyData.invincibilityTimer,X                                 ;A3BBAE;
    LDA.W EnemyData.properties,X                                         ;A3BBB1;
    ORA.W #$0400                                                         ;A3BBB4;
    STA.W EnemyData.properties,X                                         ;A3BBB7;
    JSL.L DetermineDirectionOfSamusFromEnemy                             ;A3BBBA;
    JSR.W FireChargedBeamAtSamus                                         ;A3BBBE;
    JSL.L EnemyDeath                                                     ;A3BBC1;
    LDX.W $0E54                                                          ;A3BBC5;
    LDA.W $0FC6,X                                                        ;A3BBC8;
    ORA.W #$0200                                                         ;A3BBCB;
    STA.W $0FC6,X                                                        ;A3BBCE;
    LDA.W $0F46,X                                                        ;A3BBD1;
    ORA.W #$0200                                                         ;A3BBD4;
    STA.W $0F46,X                                                        ;A3BBD7;
    RTL                                                                  ;A3BBDA;


  + LDX.W $0E54                                                          ;A3BBDB;
    LDA.L $7E8000,X                                                      ;A3BBDE;
    INC A                                                                ;A3BBE2;
    STA.L $7E8000,X                                                      ;A3BBE3;
    JSR.W SetBangInstList                                                ;A3BBE7;
    RTL                                                                  ;A3BBEA;


FireChargedBeamAtSamus:
    STA.W $1872                                                          ;A3BBEB;
    LDX.W $0E54                                                          ;A3BBEE;
    LDA.W $0CCE                                                          ;A3BBF1;
    CMP.W #$0005                                                         ;A3BBF4;
    BPL .fail                                                            ;A3BBF7;
    LDA.W #$0000                                                         ;A3BBF9;
    TAY                                                                  ;A3BBFC;

.loop:
    LDA.W $0C2C,Y                                                        ;A3BBFD;
    BEQ .zeroDamage                                                      ;A3BC00;
    INY                                                                  ;A3BC02;
    INY                                                                  ;A3BC03;
    BRA .loop                                                            ;A3BC04;


.zeroDamage:
    LDA.W EnemyData.xPosition,X                                          ;A3BC06;
    STA.W $0B64,Y                                                        ;A3BC09;
    LDA.W EnemyData.yPosition,X                                          ;A3BC0C;
    STA.W $0B78,Y                                                        ;A3BC0F;
    LDA.W $1872                                                          ;A3BC12;
    STA.W $0C04,Y                                                        ;A3BC15;
    LDA.W Equipment.equippedBeams                                        ;A3BC18;
    AND.W #$000F                                                         ;A3BC1B;
    ORA.W #$0010                                                         ;A3BC1E;
    STA.W $0C18,Y                                                        ;A3BC21;
    INC.W $0CCE                                                          ;A3BC24;
    STY.B $14                                                            ;A3BC27;
    JSL.L ProjectileReflection                                           ;A3BC29;
    LDA.W EnemyData.work4,X                                              ;A3BC2D;
    STA.W $0C2C,Y                                                        ;A3BC30;
    LDA.W $0C18,Y                                                        ;A3BC33;
    AND.W #$000F                                                         ;A3BC36;
    ASL A                                                                ;A3BC39;
    TAX                                                                  ;A3BC3A;
    LDA.W .beamTypes,X                                                   ;A3BC3B;
    JSL.L QueueSound_Lib1_Max6                                           ;A3BC3E;
    LDA.W #$0000                                                         ;A3BC42;
    RTS                                                                  ;A3BC45;


.fail:
    LDA.W #$0001                                                         ;A3BC46;
    RTS                                                                  ;A3BC49;


.beamTypes:
    dw $0017,$0019,$0018,$001A,$001E,$001C,$001D,$001F                   ;A3BC4A;
    dw $0022,$0020,$0021,$0000,$0000,$0000,$0000,$0000                   ;A3BC5A;

BangAccelerationIntervalTimeResetValues_accel:
    dw $0003                                                             ;A3BC6A;

BangAccelerationIntervalTimeResetValues_decel:
    dw $0001,$0004,$0001,$0005,$0002,$0006,$0002,$0007                   ;A3BC6C;
    dw $0002,$0008,$0003,$0009,$0003,$000A,$0004,$000B                   ;A3BC7C;
    dw $0004,$000C,$0005,$000D,$0005,$000E,$0006,$000F                   ;A3BC8C;
    dw $0006                                                             ;A3BC9C;

ExecuteBangeMovementFunction:
    LDX.W $0E54                                                          ;A3BC9E;
    JSR.W ($0FB2,X)                                                      ;A3BCA1;
    RTS                                                                  ;A3BCA4;


Function_Bang_Movement_MovementDelay:
    LDX.W $0E54                                                          ;A3BCA5;
    LDA.L $7E7800,X                                                      ;A3BCA8;
    DEC A                                                                ;A3BCAC;
    STA.L $7E7800,X                                                      ;A3BCAD;
    BNE .return                                                          ;A3BCB1;
    LDA.W #$0010                                                         ;A3BCB3;
    STA.L $7E7800,X                                                      ;A3BCB6;
    LDA.W #Function_Bang_Movement_TargetSamus                            ;A3BCBA;
    STA.W EnemyData.work5,X                                              ;A3BCBD;

.return:
    RTS                                                                  ;A3BCC0;


Function_Bang_Movement_GetEnemyIndex:
    LDX.W $0E54                                                          ;A3BCC1;
    RTS                                                                  ;A3BCC4;


Function_Bang_Movement_TargetSamus:
    LDX.W $0E54                                                          ;A3BCC5;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A3BCC8;
    SEC                                                                  ;A3BCCC;
    SBC.W #$0040                                                         ;A3BCCD;
    AND.W #$00FF                                                         ;A3BCD0;
    STA.L $7E7802,X                                                      ;A3BCD3;
    LDA.W #Function_Bang_Movement_Accelerating                           ;A3BCD7;
    STA.W EnemyData.work5,X                                              ;A3BCDA;
    LDA.W #$0000                                                         ;A3BCDD;
    STA.L $7E780E,X                                                      ;A3BCE0;
    STA.L $7E7810,X                                                      ;A3BCE4;
    STA.L $7E7812,X                                                      ;A3BCE8;
    STA.L $7E7814,X                                                      ;A3BCEC;
    RTS                                                                  ;A3BCF0;


TriggerBangDecelerationIfTooFarOffTarget:
    LDX.W $0E54                                                          ;A3BCF1;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A3BCF4;
    SEC                                                                  ;A3BCF8;
    SBC.W #$0040                                                         ;A3BCF9;
    AND.W #$00FF                                                         ;A3BCFC;
    STA.L $7E7804,X                                                      ;A3BCFF;
    SEC                                                                  ;A3BD03;
    SBC.L $7E7802,X                                                      ;A3BD04;
    JSL.L Sign_Extend_A                                                  ;A3BD08;
    JSL.L NegateA_A0B067                                                 ;A3BD0C;
    CMP.W #$0030                                                         ;A3BD10;
    BMI .return                                                          ;A3BD13;
    LDA.W #Function_Bang_Movement_Decelerating                           ;A3BD15;
    STA.W EnemyData.work5,X                                              ;A3BD18;

.return:
    RTS                                                                  ;A3BD1B;


Function_Bang_Movement_Accelerating:
    LDX.W $0E54                                                          ;A3BD1C;
    JSR.W BangXMovement                                                  ;A3BD1F;
    JSR.W BangYMovement                                                  ;A3BD22;
    JSR.W AccelerateBang                                                 ;A3BD25;
    JSR.W TriggerBangDecelerationIfTooFarOffTarget                       ;A3BD28;
    RTS                                                                  ;A3BD2B;


Function_Bang_Movement_Decelerating:
    LDX.W $0E54                                                          ;A3BD2C;
    JSR.W BangXMovement                                                  ;A3BD2F;
    JSR.W BangYMovement                                                  ;A3BD32;
    JSR.W DecelerateBang                                                 ;A3BD35;
    LDA.L $7E7814,X                                                      ;A3BD38;
    BNE .delay                                                           ;A3BD3C;
    BMI .delay                                                           ;A3BD3E;
    LDA.L $7E7812,X                                                      ;A3BD40;
    BEQ .delay                                                           ;A3BD44;
    BPL .return                                                          ;A3BD46;

.delay:
    LDA.W #Function_Bang_Movement_MovementDelay                          ;A3BD48;
    STA.W EnemyData.work5,X                                              ;A3BD4B;

.return:
    RTS                                                                  ;A3BD4E;


AccelerateBang:
    LDX.W $0E54                                                          ;A3BD4F;
    LDA.L $7E7818,X                                                      ;A3BD52;
    DEC A                                                                ;A3BD56;
    STA.L $7E7818,X                                                      ;A3BD57;
    BPL .return                                                          ;A3BD5B;
    LDA.L $7E781A,X                                                      ;A3BD5D;
    STA.L $7E7818,X                                                      ;A3BD61;
    LDA.L $7E7814,X                                                      ;A3BD65;
    CMP.L $7E7816,X                                                      ;A3BD69;
    BPL .return                                                          ;A3BD6D;
    LDA.L $7E7812,X                                                      ;A3BD6F;
    CLC                                                                  ;A3BD73;
    ADC.W #$0016                                                         ;A3BD74;
    STA.L $7E7812,X                                                      ;A3BD77;
    LDA.L $7E7814,X                                                      ;A3BD7B;
    CLC                                                                  ;A3BD7F;
    ADC.L $7E7812,X                                                      ;A3BD80;
    STA.L $7E7814,X                                                      ;A3BD84;

.return:
    RTS                                                                  ;A3BD88;


DecelerateBang:
    LDX.W $0E54                                                          ;A3BD89;
    LDA.L $7E7818,X                                                      ;A3BD8C;
    DEC A                                                                ;A3BD90;
    STA.L $7E7818,X                                                      ;A3BD91;
    BPL .return                                                          ;A3BD95;
    LDA.L $7E781C,X                                                      ;A3BD97;
    STA.L $7E7818,X                                                      ;A3BD9B;
    LDA.L $7E7812,X                                                      ;A3BD9F;
    SEC                                                                  ;A3BDA3;
    SBC.W #$0016                                                         ;A3BDA4;
    STA.L $7E7812,X                                                      ;A3BDA7;
    LDA.L $7E7814,X                                                      ;A3BDAB;
    SEC                                                                  ;A3BDAF;
    SBC.L $7E7812,X                                                      ;A3BDB0;
    STA.L $7E7814,X                                                      ;A3BDB4;

.return:
    RTS                                                                  ;A3BDB8;


BangXMovement:
    LDX.W $0E54                                                          ;A3BDB9;
    LDA.L $7E7802,X                                                      ;A3BDBC;
    PHX                                                                  ;A3BDC0;
    CLC                                                                  ;A3BDC1;
    ADC.W #$0040                                                         ;A3BDC2;
    AND.W #$00FF                                                         ;A3BDC5;
    ASL A                                                                ;A3BDC8;
    TAX                                                                  ;A3BDC9;
    LDA.L SineCosineTables_16bitSine,X                                   ;A3BDCA;
    STA.B $12                                                            ;A3BDCE;
    PLX                                                                  ;A3BDD0;
    LDA.B $12                                                            ;A3BDD1;
    BPL +                                                                ;A3BDD3;
    LDA.W #$0001                                                         ;A3BDD5;
    STA.L $7E780E,X                                                      ;A3BDD8;

  + LDA.B $12                                                            ;A3BDDC;
    JSL.L NegateA_A0B067                                                 ;A3BDDE;
    AND.W #$FF00                                                         ;A3BDE2;
    XBA                                                                  ;A3BDE5;
    STA.B $16                                                            ;A3BDE6;
    LDA.L $7E7814,X                                                      ;A3BDE8;
    STA.B $18                                                            ;A3BDEC;
    JSR.W UnsignedMultiplication_24bit_A3BE7B                            ;A3BDEE;
    LDA.B $1C                                                            ;A3BDF1;
    STA.B $16                                                            ;A3BDF3;
    LDA.B $1E                                                            ;A3BDF5;
    STA.B $18                                                            ;A3BDF7;
    LDA.L $7E780E,X                                                      ;A3BDF9;
    BEQ +                                                                ;A3BDFD;
    JSR.W StrugglingWithMultiWordNegation                                ;A3BDFF;
    LDA.B $1C                                                            ;A3BE02;
    STA.B $16                                                            ;A3BE04;
    LDA.B $1E                                                            ;A3BE06;
    STA.B $18                                                            ;A3BE08;

  + CLC                                                                  ;A3BE0A;
    LDA.W EnemyData.xSubPosition,X                                       ;A3BE0B;
    ADC.B $16                                                            ;A3BE0E;
    STA.W EnemyData.xSubPosition,X                                       ;A3BE10;
    LDA.W EnemyData.xPosition,X                                          ;A3BE13;
    ADC.B $18                                                            ;A3BE16;
    STA.W EnemyData.xPosition,X                                          ;A3BE18;
    RTS                                                                  ;A3BE1B;


BangYMovement:
    LDX.W $0E54                                                          ;A3BE1C;
    LDA.L $7E7802,X                                                      ;A3BE1F;
    PHX                                                                  ;A3BE23;
    AND.W #$00FF                                                         ;A3BE24;
    ASL A                                                                ;A3BE27;
    TAX                                                                  ;A3BE28;
    LDA.L SineCosineTables_16bitSine,X                                   ;A3BE29;
    STA.B $12                                                            ;A3BE2D;
    PLX                                                                  ;A3BE2F;
    LDA.B $12                                                            ;A3BE30;
    BPL +                                                                ;A3BE32;
    LDA.W #$0001                                                         ;A3BE34;
    STA.L $7E7810,X                                                      ;A3BE37;

  + LDA.B $12                                                            ;A3BE3B;
    JSL.L NegateA_A0B067                                                 ;A3BE3D;
    AND.W #$FF00                                                         ;A3BE41;
    XBA                                                                  ;A3BE44;
    STA.B $16                                                            ;A3BE45;
    LDA.L $7E7814,X                                                      ;A3BE47;
    STA.B $18                                                            ;A3BE4B;
    JSR.W UnsignedMultiplication_24bit_A3BE7B                            ;A3BE4D;
    LDA.B $1C                                                            ;A3BE50;
    STA.B $16                                                            ;A3BE52;
    LDA.B $1E                                                            ;A3BE54;
    STA.B $18                                                            ;A3BE56;
    LDA.L $7E7810,X                                                      ;A3BE58;
    BEQ +                                                                ;A3BE5C;
    JSR.W StrugglingWithMultiWordNegation                                ;A3BE5E;
    LDA.B $1C                                                            ;A3BE61;
    STA.B $16                                                            ;A3BE63;
    LDA.B $1E                                                            ;A3BE65;
    STA.B $18                                                            ;A3BE67;

  + CLC                                                                  ;A3BE69;
    LDA.W EnemyData.ySubPosition,X                                       ;A3BE6A;
    ADC.B $16                                                            ;A3BE6D;
    STA.W EnemyData.ySubPosition,X                                       ;A3BE6F;
    LDA.W EnemyData.yPosition,X                                          ;A3BE72;
    ADC.B $18                                                            ;A3BE75;
    STA.W EnemyData.yPosition,X                                          ;A3BE77;
    RTS                                                                  ;A3BE7A;


UnsignedMultiplication_24bit_A3BE7B:
    PHP                                                                  ;A3BE7B;
    SEP #$20                                                             ;A3BE7C;
    LDA.B $16                                                            ;A3BE7E;
    STA.W HW_WRMPYA                                                      ;A3BE80;
    LDA.B $18                                                            ;A3BE83;
    STA.W HW_WRMPYB                                                      ;A3BE85;
    NOP                                                                  ;A3BE88;
    NOP                                                                  ;A3BE89;
    NOP                                                                  ;A3BE8A;
    REP #$20                                                             ;A3BE8B;
    LDA.W HW_RDMPY                                                       ;A3BE8D;
    STA.B $1C                                                            ;A3BE90;
    SEP #$20                                                             ;A3BE92;
    LDA.B $16                                                            ;A3BE94;
    STA.W HW_WRMPYA                                                      ;A3BE96;
    LDA.B $19                                                            ;A3BE99;
    STA.W HW_WRMPYB                                                      ;A3BE9B;
    NOP                                                                  ;A3BE9E;
    NOP                                                                  ;A3BE9F;
    NOP                                                                  ;A3BEA0;
    REP #$20                                                             ;A3BEA1;
    LDA.W HW_RDMPY                                                       ;A3BEA3;
    AND.W #$FF00                                                         ;A3BEA6;
    XBA                                                                  ;A3BEA9;
    STA.B $1E                                                            ;A3BEAA;
    LDA.W HW_RDMPY                                                       ;A3BEAC;
    AND.W #$00FF                                                         ;A3BEAF;
    XBA                                                                  ;A3BEB2;
    CLC                                                                  ;A3BEB3;
    ADC.B $1C                                                            ;A3BEB4;
    STA.B $1C                                                            ;A3BEB6;
    BCC .return                                                          ;A3BEB8;
    INC.B $1E                                                            ;A3BEBA;

.return:
    PLP                                                                  ;A3BEBC;
    RTS                                                                  ;A3BEBD;


StrugglingWithMultiWordNegation:
    LDA.B $16                                                            ;A3BEBE;
    BNE +                                                                ;A3BEC0;
    LDA.B $18                                                            ;A3BEC2;
    BNE +                                                                ;A3BEC4;
    BRA .return                                                          ;A3BEC6;


  + LDA.B $16                                                            ;A3BEC8;
    LDA.W #$0000                                                         ;A3BECA;
    SEC                                                                  ;A3BECD;
    SBC.B $16                                                            ;A3BECE;
    STA.B $1C                                                            ;A3BED0;
    LDA.B $18                                                            ;A3BED2;
    EOR.W #$FFFF                                                         ;A3BED4;
    STA.B $1E                                                            ;A3BED7;

.return:
    RTS                                                                  ;A3BED9;


SetBangInstList:
    LDX.W $0E54                                                          ;A3BEDA;
    LDA.L $7E8000,X                                                      ;A3BEDD;
    CMP.L $7E8002,X                                                      ;A3BEE1;
    BEQ .return                                                          ;A3BEE5;
    STA.L $7E8002,X                                                      ;A3BEE7;
    ASL A                                                                ;A3BEEB;
    TAY                                                                  ;A3BEEC;
    LDA.W InstListPointers_Bang,Y                                        ;A3BEED;
    STA.W EnemyData.pInstList,X                                          ;A3BEF0;
    LDA.W #$0001                                                         ;A3BEF3;
    STA.W EnemyData.instTimer,X                                          ;A3BEF6;
    STZ.W EnemyData.loopCounter,X                                        ;A3BEF9;

.return:
    RTS                                                                  ;A3BEFC;


EnemyShot_Bang:
    LDX.W $0E54                                                          ;A3BEFD;
    LDA.W EnemyData.work5,X                                              ;A3BF00;
    CMP.W #Function_Bang_Movement_GetEnemyIndex                          ;A3BF03;
    BEQ .RTSFunction                                                     ;A3BF06;
    LDA.W $18A6                                                          ;A3BF08;
    ASL A                                                                ;A3BF0B;
    TAY                                                                  ;A3BF0C;
    LDA.W $0C04,Y                                                        ;A3BF0D;
    AND.W #$000F                                                         ;A3BF10;
    ASL A                                                                ;A3BF13;
    TAY                                                                  ;A3BF14;
    LDA.W BangAngles,Y                                                   ;A3BF15;
    STA.L $7E7802,X                                                      ;A3BF18;
    LDA.W #Function_Bang_Movement_Decelerating                           ;A3BF1C;
    STA.W EnemyData.work5,X                                              ;A3BF1F;
    LDA.W #$0000                                                         ;A3BF22;
    STA.L $7E780E,X                                                      ;A3BF25;
    STA.L $7E7810,X                                                      ;A3BF29;
    LDA.W #$0100                                                         ;A3BF2D;
    STA.L $7E7812,X                                                      ;A3BF30;
    LDA.W #$0600                                                         ;A3BF34;
    STA.L $7E7814,X                                                      ;A3BF37;

.RTSFunction:
    LDA.L $7E8000,X                                                      ;A3BF3B;
    CMP.W #$0009                                                         ;A3BF3F;
    BNE .notIndex9                                                       ;A3BF42;
    RTL                                                                  ;A3BF44;


.notIndex9:
    LDA.L $7E8000,X                                                      ;A3BF45;
    INC A                                                                ;A3BF49;
    STA.L $7E8000,X                                                      ;A3BF4A;
    JSR.W SetBangInstList                                                ;A3BF4E;
    LDA.W $18A6                                                          ;A3BF51;
    ASL A                                                                ;A3BF54;
    TAY                                                                  ;A3BF55;
    LDA.W $0C2C,Y                                                        ;A3BF56;
    CLC                                                                  ;A3BF59;
    ADC.W EnemyData.work4,X                                              ;A3BF5A;
    STA.W EnemyData.work4,X                                              ;A3BF5D;
    LDA.W $0C04,Y                                                        ;A3BF60;
    ORA.W #$0010                                                         ;A3BF63;
    STA.W $0C04,Y                                                        ;A3BF66;
    LDX.W $0E54                                                          ;A3BF69;
    LDA.L $7E8000,X                                                      ;A3BF6C;
    CMP.W #$0009                                                         ;A3BF70;
    BEQ +                                                                ;A3BF73;
    RTL                                                                  ;A3BF75;


  + LDA.W #$0001                                                         ;A3BF76;
    STA.W EnemyData.work3,X                                              ;A3BF79;
    RTL                                                                  ;A3BF7C;


Spritemap_Bang_Growth0_Idling_0:
    dw $0001,$01FC                                                       ;A3BF7D;
    db $FC                                                               ;A3BF81;
    dw $3113                                                             ;A3BF82;

Spritemap_Bang_Growth0_Idling_1:
    dw $0001,$01FC                                                       ;A3BF84;
    db $FC                                                               ;A3BF88;
    dw $3110                                                             ;A3BF89;

Spritemap_Bang_Growth0_Idling_2:
    dw $0001,$01FC                                                       ;A3BF8B;
    db $FC                                                               ;A3BF8F;
    dw $3114                                                             ;A3BF90;

Spritemap_Bang_Growth0_Idling_3:
    dw $0001,$01FC                                                       ;A3BF92;
    db $FC                                                               ;A3BF96;
    dw $3111                                                             ;A3BF97;

Spritemap_Bang_Growth0_Idling_4:
    dw $0001,$01FC                                                       ;A3BF99;
    db $FC                                                               ;A3BF9D;
    dw $3115                                                             ;A3BF9E;

Spritemap_Bang_Growth0_Idling_5:
    dw $0001,$01FC                                                       ;A3BFA0;
    db $FC                                                               ;A3BFA4;
    dw $3112                                                             ;A3BFA5;

Spritemap_Bang_Growth0_Growing_0:
    dw $0001,$01FC                                                       ;A3BFA7;
    db $FC                                                               ;A3BFAB;
    dw $3170                                                             ;A3BFAC;

Spritemap_Bang_Growth0_Growing_1:
    dw $0001,$01FC                                                       ;A3BFAE;
    db $FC                                                               ;A3BFB2;
    dw $3160                                                             ;A3BFB3;

Spritemap_Bang_Growth0_Growing_2:
    dw $0001,$01FC                                                       ;A3BFB5;
    db $FC                                                               ;A3BFB9;
    dw $3116                                                             ;A3BFBA;

Spritemap_Bang_Growth0_Growing_3:
    dw $0004,$01F9                                                       ;A3BFBC;
    db $FF                                                               ;A3BFC0;
    dw $F101,$01FF                                                       ;A3BFC1;
    db $FF                                                               ;A3BFC5;
    dw $B101,$01FF                                                       ;A3BFC6;
    db $F9                                                               ;A3BFCA;
    dw $3101,$01F9                                                       ;A3BFCB;
    db $F9                                                               ;A3BFCF;
    dw $3100                                                             ;A3BFD0;

Spritemap_Bang_Growth0_Growing_4:
    dw $0001,$01FC                                                       ;A3BFD2;
    db $FC                                                               ;A3BFD6;
    dw $3116                                                             ;A3BFD7;

Spritemap_Bang_Growth0_Growing_5:
    dw $0004,$01F8                                                       ;A3BFD9;
    db $FF                                                               ;A3BFDD;
    dw $F101,$0000                                                       ;A3BFDE;
    db $FF                                                               ;A3BFE2;
    dw $B101,$0000                                                       ;A3BFE3;
    db $F9                                                               ;A3BFE7;
    dw $3101,$01F8                                                       ;A3BFE8;
    db $F9                                                               ;A3BFEC;
    dw $3100                                                             ;A3BFED;

Spritemap_Bang_Growth0_Growing_6:
    dw $0001,$01FC                                                       ;A3BFEF;
    db $FC                                                               ;A3BFF3;
    dw $3116                                                             ;A3BFF4;

Spritemap_Bang_Growth0_Growing_7:
    dw $0004,$01F8                                                       ;A3BFF6;
    db $00                                                               ;A3BFFA;
    dw $F101,$0000                                                       ;A3BFFB;
    db $00                                                               ;A3BFFF;
    dw $B101,$0000                                                       ;A3C000;
    db $F8                                                               ;A3C004;
    dw $3101,$01F8                                                       ;A3C005;
    db $F8                                                               ;A3C009;
    dw $3100                                                             ;A3C00A;

Spritemap_Bang_Growth1_Idling_0:
    dw $0001,$01FC                                                       ;A3C00C;
    db $FC                                                               ;A3C010;
    dw $3116                                                             ;A3C011;

Spritemap_Bang_Growth1_Idling_1:
    dw $0004,$01F8                                                       ;A3C013;
    db $00                                                               ;A3C017;
    dw $F101,$0000                                                       ;A3C018;
    db $00                                                               ;A3C01C;
    dw $B101,$0000                                                       ;A3C01D;
    db $F8                                                               ;A3C021;
    dw $3101,$01F8                                                       ;A3C022;
    db $F8                                                               ;A3C026;
    dw $3100                                                             ;A3C027;

Spritemap_Bang_Growth1_Idling_2:
    dw $0001,$01FC                                                       ;A3C029;
    db $FC                                                               ;A3C02D;
    dw $3117                                                             ;A3C02E;

Spritemap_Bang_Growth1_Idling_3:
    dw $0004,$01F8                                                       ;A3C030;
    db $00                                                               ;A3C034;
    dw $F103,$0000                                                       ;A3C035;
    db $00                                                               ;A3C039;
    dw $B103,$0000                                                       ;A3C03A;
    db $F8                                                               ;A3C03E;
    dw $3103,$01F8                                                       ;A3C03F;
    db $F8                                                               ;A3C043;
    dw $3102                                                             ;A3C044;

Spritemap_Bang_Growth1_Idling_4:
    dw $0001,$01FC                                                       ;A3C046;
    db $FC                                                               ;A3C04A;
    dw $3118                                                             ;A3C04B;

Spritemap_Bang_Growth1_Idling_5:
    dw $0004,$01F8                                                       ;A3C04D;
    db $00                                                               ;A3C051;
    dw $F105,$0000                                                       ;A3C052;
    db $00                                                               ;A3C056;
    dw $B105,$0000                                                       ;A3C057;
    db $F8                                                               ;A3C05B;
    dw $3105,$01F8                                                       ;A3C05C;
    db $F8                                                               ;A3C060;
    dw $3104                                                             ;A3C061;

Spritemap_Bang_Growth1_Growing_0:
    dw $0004,$0000                                                       ;A3C063;
    db $00                                                               ;A3C067;
    dw $F172,$01F8                                                       ;A3C068;
    db $00                                                               ;A3C06C;
    dw $B172,$0000                                                       ;A3C06D;
    db $F8                                                               ;A3C071;
    dw $7172,$01F8                                                       ;A3C072;
    db $F8                                                               ;A3C076;
    dw $3172                                                             ;A3C077;

Spritemap_Bang_Growth1_Growing_1:
    dw $0004,$0000                                                       ;A3C079;
    db $00                                                               ;A3C07D;
    dw $F171,$01F8                                                       ;A3C07E;
    db $00                                                               ;A3C082;
    dw $B171,$0000                                                       ;A3C083;
    db $F8                                                               ;A3C087;
    dw $7171,$01F8                                                       ;A3C088;
    db $F8                                                               ;A3C08C;
    dw $3171                                                             ;A3C08D;

Spritemap_Bang_Growth1_Growing_2:
    dw $0001,$01FC                                                       ;A3C08F;
    db $FC                                                               ;A3C093;
    dw $3119                                                             ;A3C094;

Spritemap_Bang_Growth1_Growing_3:
    dw $0004,$01F9                                                       ;A3C096;
    db $FF                                                               ;A3C09A;
    dw $F107,$01FF                                                       ;A3C09B;
    db $FF                                                               ;A3C09F;
    dw $B107,$01FF                                                       ;A3C0A0;
    db $F9                                                               ;A3C0A4;
    dw $3107,$01F9                                                       ;A3C0A5;
    db $F9                                                               ;A3C0A9;
    dw $3106                                                             ;A3C0AA;

Spritemap_Bang_Growth1_Growing_4:
    dw $0001,$01FC                                                       ;A3C0AC;
    db $FC                                                               ;A3C0B0;
    dw $3119                                                             ;A3C0B1;

Spritemap_Bang_Growth1_Growing_5:
    dw $0004,$01F9                                                       ;A3C0B3;
    db $00                                                               ;A3C0B7;
    dw $F107,$01FF                                                       ;A3C0B8;
    db $00                                                               ;A3C0BC;
    dw $B107,$01FF                                                       ;A3C0BD;
    db $F8                                                               ;A3C0C1;
    dw $3107,$01F9                                                       ;A3C0C2;
    db $F8                                                               ;A3C0C6;
    dw $3106                                                             ;A3C0C7;

Spritemap_Bang_Growth1_Growing_6:
    dw $0001,$01FC                                                       ;A3C0C9;
    db $FC                                                               ;A3C0CD;
    dw $3119                                                             ;A3C0CE;

Spritemap_Bang_Growth1_Growing_7:
    dw $0004,$01F8                                                       ;A3C0D0;
    db $00                                                               ;A3C0D4;
    dw $F107,$0000                                                       ;A3C0D5;
    db $00                                                               ;A3C0D9;
    dw $B107,$0000                                                       ;A3C0DA;
    db $F8                                                               ;A3C0DE;
    dw $3107,$01F8                                                       ;A3C0DF;
    db $F8                                                               ;A3C0E3;
    dw $3106                                                             ;A3C0E4;

Spritemap_Bang_Growth2_Idling_0:
    dw $0001,$01FC                                                       ;A3C0E6;
    db $FC                                                               ;A3C0EA;
    dw $3119                                                             ;A3C0EB;

Spritemap_Bang_Growth2_Idling_1:
    dw $0004,$01F8                                                       ;A3C0ED;
    db $00                                                               ;A3C0F1;
    dw $F107,$0000                                                       ;A3C0F2;
    db $00                                                               ;A3C0F6;
    dw $B107,$0000                                                       ;A3C0F7;
    db $F8                                                               ;A3C0FB;
    dw $3107,$01F8                                                       ;A3C0FC;
    db $F8                                                               ;A3C100;
    dw $3106                                                             ;A3C101;

Spritemap_Bang_Growth2_Idling_2:
    dw $0001,$01FC                                                       ;A3C103;
    db $FC                                                               ;A3C107;
    dw $311A                                                             ;A3C108;

Spritemap_Bang_Growth2_Idling_3:
    dw $0004,$01F8                                                       ;A3C10A;
    db $00                                                               ;A3C10E;
    dw $F109,$0000                                                       ;A3C10F;
    db $00                                                               ;A3C113;
    dw $B109,$0000                                                       ;A3C114;
    db $F8                                                               ;A3C118;
    dw $3109,$01F8                                                       ;A3C119;
    db $F8                                                               ;A3C11D;
    dw $3108                                                             ;A3C11E;

Spritemap_Bang_Growth2_Idling_4:
    dw $0001,$01FC                                                       ;A3C120;
    db $FC                                                               ;A3C124;
    dw $311B                                                             ;A3C125;

Spritemap_Bang_Growth2_Idling_5:
    dw $0004,$01F8                                                       ;A3C127;
    db $00                                                               ;A3C12B;
    dw $F10B,$0000                                                       ;A3C12C;
    db $00                                                               ;A3C130;
    dw $B10B,$0000                                                       ;A3C131;
    db $F8                                                               ;A3C135;
    dw $310B,$01F8                                                       ;A3C136;
    db $F8                                                               ;A3C13A;
    dw $310A                                                             ;A3C13B;

Spritemap_Bang_Growth2_Growing_0:
    dw $0001,$01FC                                                       ;A3C13D;
    db $FC                                                               ;A3C141;
    dw $3119                                                             ;A3C142;

Spritemap_Bang_Growth2_Growing_1:
    dw $0004,$0000                                                       ;A3C144;
    db $00                                                               ;A3C148;
    dw $F177,$01F8                                                       ;A3C149;
    db $00                                                               ;A3C14D;
    dw $B177,$0000                                                       ;A3C14E;
    db $F8                                                               ;A3C152;
    dw $7177,$01F8                                                       ;A3C153;
    db $F8                                                               ;A3C157;
    dw $3177                                                             ;A3C158;

Spritemap_Bang_Growth2_Growing_2:
    dw $0001,$01FC                                                       ;A3C15A;
    db $FC                                                               ;A3C15E;
    dw $3119                                                             ;A3C15F;

Spritemap_Bang_Growth2_Growing_3:
    dw $0004,$0000                                                       ;A3C161;
    db $00                                                               ;A3C165;
    dw $F167,$01F8                                                       ;A3C166;
    db $00                                                               ;A3C16A;
    dw $B167,$0000                                                       ;A3C16B;
    db $F8                                                               ;A3C16F;
    dw $7167,$01F8                                                       ;A3C170;
    db $F8                                                               ;A3C174;
    dw $3167                                                             ;A3C175;

Spritemap_Bang_Growth2_Growing_4:
    dw $0001,$C3F8                                                       ;A3C177;
    db $F8                                                               ;A3C17B;
    dw $310C                                                             ;A3C17C;

Spritemap_Bang_Growth2_Growing_5:
    dw $0004,$C3F2                                                       ;A3C17E;
    db $FE                                                               ;A3C182;
    dw $F122,$C3FE                                                       ;A3C183;
    db $FE                                                               ;A3C187;
    dw $B122,$C3FE                                                       ;A3C188;
    db $F2                                                               ;A3C18C;
    dw $3122,$C3F2                                                       ;A3C18D;
    db $F2                                                               ;A3C191;
    dw $3120                                                             ;A3C192;

Spritemap_Bang_Growth2_Growing_6:
    dw $0001,$C3F8                                                       ;A3C194;
    db $F8                                                               ;A3C198;
    dw $310C                                                             ;A3C199;

Spritemap_Bang_Growth2_Growing_7:
    dw $0004,$C3FF                                                       ;A3C19B;
    db $F1                                                               ;A3C19F;
    dw $3122,$C3F1                                                       ;A3C1A0;
    db $F1                                                               ;A3C1A4;
    dw $3120,$C3F1                                                       ;A3C1A5;
    db $FF                                                               ;A3C1A9;
    dw $F122,$C3FF                                                       ;A3C1AA;
    db $FF                                                               ;A3C1AE;
    dw $B122                                                             ;A3C1AF;

Spritemap_Bang_Growth2_Growing_8:
    dw $0001,$C3F8                                                       ;A3C1B1;
    db $F8                                                               ;A3C1B5;
    dw $310C                                                             ;A3C1B6;

Spritemap_Bang_Growth2_Growing_9:
    dw $0004,$C3F0                                                       ;A3C1B8;
    db $00                                                               ;A3C1BC;
    dw $F122,$C200                                                       ;A3C1BD;
    db $00                                                               ;A3C1C1;
    dw $B122,$C200                                                       ;A3C1C2;
    db $F0                                                               ;A3C1C6;
    dw $3122,$C3F0                                                       ;A3C1C7;
    db $F0                                                               ;A3C1CB;
    dw $3120                                                             ;A3C1CC;

Spritemap_Bang_Growth3_Idling_0:
    dw $0001,$C3F8                                                       ;A3C1CE;
    db $F8                                                               ;A3C1D2;
    dw $310C                                                             ;A3C1D3;

Spritemap_Bang_Growth3_Idling_1:
    dw $0004,$C200                                                       ;A3C1D5;
    db $F0                                                               ;A3C1D9;
    dw $3122,$C3F0                                                       ;A3C1DA;
    db $F0                                                               ;A3C1DE;
    dw $3120,$C3F0                                                       ;A3C1DF;
    db $00                                                               ;A3C1E3;
    dw $F122,$C200                                                       ;A3C1E4;
    db $00                                                               ;A3C1E8;
    dw $B122                                                             ;A3C1E9;

Spritemap_Bang_Growth3_Idling_2:
    dw $0001,$C3F8                                                       ;A3C1EB;
    db $F8                                                               ;A3C1EF;
    dw $312C                                                             ;A3C1F0;

Spritemap_Bang_Growth3_Idling_3:
    dw $0004,$C3F0                                                       ;A3C1F2;
    db $00                                                               ;A3C1F6;
    dw $F126,$C200                                                       ;A3C1F7;
    db $00                                                               ;A3C1FB;
    dw $B126,$C200                                                       ;A3C1FC;
    db $F0                                                               ;A3C200;
    dw $3126,$C3F0                                                       ;A3C201;
    db $F0                                                               ;A3C205;
    dw $3124                                                             ;A3C206;

Spritemap_Bang_Growth3_Idling_4:
    dw $0001,$C3F8                                                       ;A3C208;
    db $F8                                                               ;A3C20C;
    dw $314C                                                             ;A3C20D;

Spritemap_Bang_Growth3_Idling_5:
    dw $0004,$C200                                                       ;A3C20F;
    db $F0                                                               ;A3C213;
    dw $312A,$C3F0                                                       ;A3C214;
    db $F0                                                               ;A3C218;
    dw $3128,$C3F0                                                       ;A3C219;
    db $00                                                               ;A3C21D;
    dw $F12A,$C200                                                       ;A3C21E;
    db $00                                                               ;A3C222;
    dw $B12A                                                             ;A3C223;

Spritemap_Bang_Growth3_Idling_6:
    dw $0001,$C3F8                                                       ;A3C225;
    db $F8                                                               ;A3C229;
    dw $310C                                                             ;A3C22A;

Spritemap_Bang_Growth3_Idling_7:
    dw $0004,$C200                                                       ;A3C22C;
    db $FF                                                               ;A3C230;
    dw $B122,$C3F0                                                       ;A3C231;
    db $FF                                                               ;A3C235;
    dw $F122,$C200                                                       ;A3C236;
    db $F1                                                               ;A3C23A;
    dw $3122,$C3F0                                                       ;A3C23B;
    db $F1                                                               ;A3C23F;
    dw $3120                                                             ;A3C240;

Spritemap_Bang_Growth3_Idling_8:
    dw $0001,$C3F8                                                       ;A3C242;
    db $F8                                                               ;A3C246;
    dw $312C                                                             ;A3C247;

Spritemap_Bang_Growth3_Idling_9:
    dw $0004,$C200                                                       ;A3C249;
    db $FF                                                               ;A3C24D;
    dw $B126,$C3F0                                                       ;A3C24E;
    db $FF                                                               ;A3C252;
    dw $F126,$C200                                                       ;A3C253;
    db $F1                                                               ;A3C257;
    dw $3126,$C3F0                                                       ;A3C258;
    db $F1                                                               ;A3C25C;
    dw $3124                                                             ;A3C25D;

Spritemap_Bang_Growth3_Idling_A:
    dw $0001,$C3F8                                                       ;A3C25F;
    db $F8                                                               ;A3C263;
    dw $314C                                                             ;A3C264;

Spritemap_Bang_Growth3_Idling_B:
    dw $0004,$C200                                                       ;A3C266;
    db $FF                                                               ;A3C26A;
    dw $B12A,$C3F0                                                       ;A3C26B;
    db $FF                                                               ;A3C26F;
    dw $F12A,$C200                                                       ;A3C270;
    db $F1                                                               ;A3C274;
    dw $312A,$C3F0                                                       ;A3C275;
    db $F1                                                               ;A3C279;
    dw $3128                                                             ;A3C27A;

Spritemap_Bang_Growth3_Idling_C:
    dw $0001,$C3F8                                                       ;A3C27C;
    db $F8                                                               ;A3C280;
    dw $310C                                                             ;A3C281;

Spritemap_Bang_Growth3_Idling_D:
    dw $0004,$C3FF                                                       ;A3C283;
    db $00                                                               ;A3C287;
    dw $B122,$C3F1                                                       ;A3C288;
    db $00                                                               ;A3C28C;
    dw $F122,$C3FF                                                       ;A3C28D;
    db $F0                                                               ;A3C291;
    dw $3122,$C3F1                                                       ;A3C292;
    db $F0                                                               ;A3C296;
    dw $3120                                                             ;A3C297;

Spritemap_Bang_Growth3_Idling_E:
    dw $0001,$C3F8                                                       ;A3C299;
    db $F8                                                               ;A3C29D;
    dw $312C                                                             ;A3C29E;

Spritemap_Bang_Growth3_Idling_F:
    dw $0004,$C3FF                                                       ;A3C2A0;
    db $00                                                               ;A3C2A4;
    dw $B126,$C3F1                                                       ;A3C2A5;
    db $00                                                               ;A3C2A9;
    dw $F126,$C3FF                                                       ;A3C2AA;
    db $F0                                                               ;A3C2AE;
    dw $3126,$C3F1                                                       ;A3C2AF;
    db $F0                                                               ;A3C2B3;
    dw $3124                                                             ;A3C2B4;

Spritemap_Bang_Growth3_Idling_10:
    dw $0001,$C3F8                                                       ;A3C2B6;
    db $F8                                                               ;A3C2BA;
    dw $314C                                                             ;A3C2BB;

Spritemap_Bang_Growth3_Idling_11:
    dw $0004,$C3FF                                                       ;A3C2BD;
    db $00                                                               ;A3C2C1;
    dw $B12A,$C3F1                                                       ;A3C2C2;
    db $00                                                               ;A3C2C6;
    dw $F12A,$C3FF                                                       ;A3C2C7;
    db $F0                                                               ;A3C2CB;
    dw $312A,$C3F1                                                       ;A3C2CC;
    db $F0                                                               ;A3C2D0;
    dw $3128                                                             ;A3C2D1;

Spritemap_Bang_Growth3_Growing_0:
    dw $0001,$C3F8                                                       ;A3C2D3;
    db $F8                                                               ;A3C2D7;
    dw $316A                                                             ;A3C2D8;

Spritemap_Bang_Growth3_Growing_1:
    dw $0004,$C3F0                                                       ;A3C2DA;
    db $00                                                               ;A3C2DE;
    dw $F122,$C200                                                       ;A3C2DF;
    db $00                                                               ;A3C2E3;
    dw $B122,$C200                                                       ;A3C2E4;
    db $F0                                                               ;A3C2E8;
    dw $3122,$C3F0                                                       ;A3C2E9;
    db $F0                                                               ;A3C2ED;
    dw $3120                                                             ;A3C2EE;

Spritemap_Bang_Growth3_Growing_2:
    dw $0001,$C3F8                                                       ;A3C2F0;
    db $F8                                                               ;A3C2F4;
    dw $3168                                                             ;A3C2F5;

Spritemap_Bang_Growth3_Growing_3:
    dw $0004,$C3F0                                                       ;A3C2F7;
    db $00                                                               ;A3C2FB;
    dw $F122,$C200                                                       ;A3C2FC;
    db $00                                                               ;A3C300;
    dw $B122,$C200                                                       ;A3C301;
    db $F0                                                               ;A3C305;
    dw $3122,$C3F0                                                       ;A3C306;
    db $F0                                                               ;A3C30A;
    dw $3120                                                             ;A3C30B;

Spritemap_Bang_Growth3_Growing_4:
    dw $0001,$C3F8                                                       ;A3C30D;
    db $F8                                                               ;A3C311;
    dw $316C                                                             ;A3C312;

Spritemap_Bang_Growth3_Growing_5:
    dw $0004,$C3F2                                                       ;A3C314;
    db $FE                                                               ;A3C318;
    dw $F142,$C3FE                                                       ;A3C319;
    db $FE                                                               ;A3C31D;
    dw $B142,$C3FE                                                       ;A3C31E;
    db $F2                                                               ;A3C322;
    dw $3142,$C3F2                                                       ;A3C323;
    db $F2                                                               ;A3C327;
    dw $3140                                                             ;A3C328;

Spritemap_Bang_Growth3_Growing_6:
    dw $0001,$C3F8                                                       ;A3C32A;
    db $F8                                                               ;A3C32E;
    dw $316E                                                             ;A3C32F;

Spritemap_Bang_Growth3_Growing_7:
    dw $0004,$C3F1                                                       ;A3C331;
    db $FF                                                               ;A3C335;
    dw $F142,$C3FF                                                       ;A3C336;
    db $FF                                                               ;A3C33A;
    dw $B142,$C3FF                                                       ;A3C33B;
    db $F1                                                               ;A3C33F;
    dw $3142,$C3F1                                                       ;A3C340;
    db $F1                                                               ;A3C344;
    dw $3140                                                             ;A3C345;

Spritemap_Bang_Growth3_Growing_8:
    dw $0001,$C3F8                                                       ;A3C347;
    db $F8                                                               ;A3C34B;
    dw $316C                                                             ;A3C34C;

Spritemap_Bang_Growth3_Growing_9:
    dw $0004,$C200                                                       ;A3C34E;
    db $00                                                               ;A3C352;
    dw $B142,$C3F0                                                       ;A3C353;
    db $00                                                               ;A3C357;
    dw $F142,$C200                                                       ;A3C358;
    db $F0                                                               ;A3C35C;
    dw $3142,$C3F0                                                       ;A3C35D;
    db $F0                                                               ;A3C361;
    dw $3140                                                             ;A3C362;

Spritemap_Bang_Growth3_Growing_A:
    dw $0001,$C3F8                                                       ;A3C364;
    db $F8                                                               ;A3C368;
    dw $310E                                                             ;A3C369;

Spritemap_Bang_Growth3_Growing_B:
    dw $0004,$C200                                                       ;A3C36B;
    db $00                                                               ;A3C36F;
    dw $B142,$C3F0                                                       ;A3C370;
    db $00                                                               ;A3C374;
    dw $F142,$C200                                                       ;A3C375;
    db $F0                                                               ;A3C379;
    dw $3142,$C3F0                                                       ;A3C37A;
    db $F0                                                               ;A3C37E;
    dw $3140                                                             ;A3C37F;

Spritemap_Bang_Electricity_Growth3_4_Growing_0:
    dw $0002,$0004                                                       ;A3C381;
    db $FC                                                               ;A3C385;
    dw $3164,$01F6                                                       ;A3C386;
    db $F6                                                               ;A3C38A;
    dw $3161                                                             ;A3C38B;

Spritemap_Bang_Electricity_Growth3_4_Growing_1:
    dw $0002,$0004                                                       ;A3C38D;
    db $FC                                                               ;A3C391;
    dw $3165,$01F6                                                       ;A3C392;
    db $F6                                                               ;A3C396;
    dw $3162                                                             ;A3C397;

Spritemap_Bang_Electricity_Growth3_4_Growing_2:
    dw $0002,$0004                                                       ;A3C399;
    db $FC                                                               ;A3C39D;
    dw $3166,$01F6                                                       ;A3C39E;
    db $F6                                                               ;A3C3A2;
    dw $3163                                                             ;A3C3A3;

Spritemap_Bang_Electricity_Growth3_4_Growing_3:
    dw $0002,$0002                                                       ;A3C3A5;
    db $F6                                                               ;A3C3A9;
    dw $7161,$01F4                                                       ;A3C3AA;
    db $FD                                                               ;A3C3AE;
    dw $3164                                                             ;A3C3AF;

Spritemap_Bang_Electricity_Growth3_4_Growing_4:
    dw $0002,$0002                                                       ;A3C3B1;
    db $F6                                                               ;A3C3B5;
    dw $7162,$01F4                                                       ;A3C3B6;
    db $FD                                                               ;A3C3BA;
    dw $3165                                                             ;A3C3BB;

Spritemap_Bang_Electricity_Growth3_4_Growing_5:
    dw $0002,$01F4                                                       ;A3C3BD;
    db $FD                                                               ;A3C3C1;
    dw $3166,$0002                                                       ;A3C3C2;
    db $F6                                                               ;A3C3C6;
    dw $7163                                                             ;A3C3C7;

Spritemap_Bang_Electricity_Growth3_4_Growing_6:
    dw $0002,$01FA                                                       ;A3C3C9;
    db $03                                                               ;A3C3CD;
    dw $3176,$01FC                                                       ;A3C3CE;
    db $F5                                                               ;A3C3D2;
    dw $3174                                                             ;A3C3D3;

Spritemap_Bang_Electricity_Growth3_4_Growing_7:
    dw $0002,$01FA                                                       ;A3C3D5;
    db $03                                                               ;A3C3D9;
    dw $3175,$01FC                                                       ;A3C3DA;
    db $F5                                                               ;A3C3DE;
    dw $3175                                                             ;A3C3DF;

Spritemap_Bang_Electricity_Growth3_4_Growing_8:
    dw $0002,$01FB                                                       ;A3C3E1;
    db $03                                                               ;A3C3E5;
    dw $3174,$01FC                                                       ;A3C3E6;
    db $F5                                                               ;A3C3EA;
    dw $3176                                                             ;A3C3EB;

Spritemap_Bang_Electricity_Growth3_4_Growing_9:
    dw $0002,$0002                                                       ;A3C3ED;
    db $02                                                               ;A3C3F1;
    dw $3163,$01F6                                                       ;A3C3F2;
    db $02                                                               ;A3C3F6;
    dw $7161                                                             ;A3C3F7;

Spritemap_Bang_Electricity_Growth3_4_Growing_A:
    dw $0002,$0002                                                       ;A3C3F9;
    db $02                                                               ;A3C3FD;
    dw $3162,$01F6                                                       ;A3C3FE;
    db $02                                                               ;A3C402;
    dw $7162                                                             ;A3C403;

Spritemap_Bang_Electricity_Growth3_4_Growing_B:
    dw $0002,$0002                                                       ;A3C405;
    db $02                                                               ;A3C409;
    dw $3161,$01F6                                                       ;A3C40A;
    db $02                                                               ;A3C40E;
    dw $7163                                                             ;A3C40F;

Spritemap_Bang_Growth4_Idling_0:
    dw $0001,$C3F8                                                       ;A3C411;
    db $F8                                                               ;A3C415;
    dw $310E                                                             ;A3C416;

Spritemap_Bang_Growth4_Idling_1:
    dw $0004,$C200                                                       ;A3C418;
    db $00                                                               ;A3C41C;
    dw $B142,$C3F0                                                       ;A3C41D;
    db $00                                                               ;A3C421;
    dw $F142,$C200                                                       ;A3C422;
    db $F0                                                               ;A3C426;
    dw $3142,$C3F0                                                       ;A3C427;
    db $F0                                                               ;A3C42B;
    dw $3140                                                             ;A3C42C;

Spritemap_Bang_Growth4_Idling_2:
    dw $0001,$C3F8                                                       ;A3C42E;
    db $F8                                                               ;A3C432;
    dw $312E                                                             ;A3C433;

Spritemap_Bang_Growth4_Idling_3:
    dw $0004,$C200                                                       ;A3C435;
    db $00                                                               ;A3C439;
    dw $B146,$C3F0                                                       ;A3C43A;
    db $00                                                               ;A3C43E;
    dw $F146,$C200                                                       ;A3C43F;
    db $F0                                                               ;A3C443;
    dw $3146,$C3F0                                                       ;A3C444;
    db $F0                                                               ;A3C448;
    dw $3144                                                             ;A3C449;

Spritemap_Bang_Growth4_Idling_4:
    dw $0001,$C3F8                                                       ;A3C44B;
    db $F8                                                               ;A3C44F;
    dw $314E                                                             ;A3C450;

Spritemap_Bang_Growth4_Idling_5:
    dw $0004,$C200                                                       ;A3C452;
    db $00                                                               ;A3C456;
    dw $B14A,$C3F0                                                       ;A3C457;
    db $00                                                               ;A3C45B;
    dw $F14A,$C200                                                       ;A3C45C;
    db $F0                                                               ;A3C460;
    dw $314A,$C3F0                                                       ;A3C461;
    db $F0                                                               ;A3C465;
    dw $3148                                                             ;A3C466;

Spritemap_Bang_Growth4_Idling_6:
    dw $0001,$C3F8                                                       ;A3C468;
    db $F8                                                               ;A3C46C;
    dw $310E                                                             ;A3C46D;

Spritemap_Bang_Growth4_Idling_7:
    dw $0004,$C3F0                                                       ;A3C46F;
    db $FF                                                               ;A3C473;
    dw $F142,$C200                                                       ;A3C474;
    db $FF                                                               ;A3C478;
    dw $B142,$C200                                                       ;A3C479;
    db $F1                                                               ;A3C47D;
    dw $3142,$C3F0                                                       ;A3C47E;
    db $F1                                                               ;A3C482;
    dw $3140                                                             ;A3C483;

UNUSED_Spritemap_Bang_Growth4_Idling_A3C485:
    dw $0001,$C3F8                                                       ;A3C485;
    db $F8                                                               ;A3C489;
    dw $312E                                                             ;A3C48A;

UNUSED_Spritemap_Bang_Growth4_Idling_A3C48C:
    dw $0004,$C3F0                                                       ;A3C48C;
    db $FF                                                               ;A3C490;
    dw $F146,$C200                                                       ;A3C491;
    db $FF                                                               ;A3C495;
    dw $B146,$C200                                                       ;A3C496;
    db $F1                                                               ;A3C49A;
    dw $3146,$C3F0                                                       ;A3C49B;
    db $F1                                                               ;A3C49F;
    dw $3144                                                             ;A3C4A0;

UNUSED_Spritemap_Bang_Growth4_Idling_A3C4A2:
    dw $0001,$C3F8                                                       ;A3C4A2;
    db $F8                                                               ;A3C4A6;
    dw $314E                                                             ;A3C4A7;

UNUSED_Spritemap_Bang_Growth4_Idling_A3C4A9:
    dw $0004,$C3F0                                                       ;A3C4A9;
    db $FF                                                               ;A3C4AD;
    dw $F14A,$C200                                                       ;A3C4AE;
    db $FF                                                               ;A3C4B2;
    dw $B14A,$C200                                                       ;A3C4B3;
    db $F1                                                               ;A3C4B7;
    dw $314A,$C3F0                                                       ;A3C4B8;
    db $F1                                                               ;A3C4BC;
    dw $3148                                                             ;A3C4BD;

Spritemap_Bang_Growth4_Idling_8:
    dw $0001,$C3F8                                                       ;A3C4BF;
    db $F8                                                               ;A3C4C3;
    dw $310E                                                             ;A3C4C4;

Spritemap_Bang_Growth4_Idling_9:
    dw $0004,$C3FF                                                       ;A3C4C6;
    db $00                                                               ;A3C4CA;
    dw $B142,$C3F1                                                       ;A3C4CB;
    db $00                                                               ;A3C4CF;
    dw $F142,$C3FF                                                       ;A3C4D0;
    db $F0                                                               ;A3C4D4;
    dw $3142,$C3F1                                                       ;A3C4D5;
    db $F0                                                               ;A3C4D9;
    dw $3140                                                             ;A3C4DA;

Spritemap_Bang_Growth4_Idling_A:
    dw $0001,$C3F8                                                       ;A3C4DC;
    db $F8                                                               ;A3C4E0;
    dw $312E                                                             ;A3C4E1;

Spritemap_Bang_Growth4_Idling_B:
    dw $0004,$C3FF                                                       ;A3C4E3;
    db $00                                                               ;A3C4E7;
    dw $B146,$C3F1                                                       ;A3C4E8;
    db $00                                                               ;A3C4EC;
    dw $F146,$C3FF                                                       ;A3C4ED;
    db $F0                                                               ;A3C4F1;
    dw $3146,$C3F1                                                       ;A3C4F2;
    db $F0                                                               ;A3C4F6;
    dw $3144                                                             ;A3C4F7;

Spritemap_Bang_Growth4_Idling_C:
    dw $0001,$C3F8                                                       ;A3C4F9;
    db $F8                                                               ;A3C4FD;
    dw $314E                                                             ;A3C4FE;

Spritemap_Bang_Growth4_Idling_D:
    dw $0004,$C3FF                                                       ;A3C500;
    db $00                                                               ;A3C504;
    dw $B14A,$C3F1                                                       ;A3C505;
    db $00                                                               ;A3C509;
    dw $F14A,$C3FF                                                       ;A3C50A;
    db $F0                                                               ;A3C50E;
    dw $314A,$C3F1                                                       ;A3C50F;
    db $F0                                                               ;A3C513;
    dw $3148                                                             ;A3C514;

Spritemap_Bang_Growth4_Growing_0:
    dw $0001,$C3F8                                                       ;A3C516;
    db $F8                                                               ;A3C51A;
    dw $316E                                                             ;A3C51B;

Spritemap_Bang_Growth4_Growing_1:
    dw $0004,$C3F0                                                       ;A3C51D;
    db $00                                                               ;A3C521;
    dw $F142,$C200                                                       ;A3C522;
    db $00                                                               ;A3C526;
    dw $B142,$C200                                                       ;A3C527;
    db $F0                                                               ;A3C52B;
    dw $3142,$C3F0                                                       ;A3C52C;
    db $F0                                                               ;A3C530;
    dw $3140                                                             ;A3C531;

Spritemap_Bang_Growth4_Growing_2:
    dw $0001,$C3F8                                                       ;A3C533;
    db $F8                                                               ;A3C537;
    dw $316C                                                             ;A3C538;

Spritemap_Bang_Growth4_Growing_3:
    dw $0004,$C200                                                       ;A3C53A;
    db $00                                                               ;A3C53E;
    dw $B142,$C3F0                                                       ;A3C53F;
    db $00                                                               ;A3C543;
    dw $F142,$C200                                                       ;A3C544;
    db $F0                                                               ;A3C548;
    dw $3142,$C3F0                                                       ;A3C549;
    db $F0                                                               ;A3C54D;
    dw $3140                                                             ;A3C54E;

Spritemap_Bang_Growth4_Growing_4:
    dw $0001,$C3F8                                                       ;A3C550;
    db $F8                                                               ;A3C554;
    dw $316E                                                             ;A3C555;

Spritemap_Bang_Growth4_Growing_5:
    dw $0004,$C3EF                                                       ;A3C557;
    db $EF                                                               ;A3C55B;
    dw $7142,$C3EF                                                       ;A3C55C;
    db $01                                                               ;A3C560;
    dw $F142,$C201                                                       ;A3C561;
    db $01                                                               ;A3C565;
    dw $B142,$C201                                                       ;A3C566;
    db $EF                                                               ;A3C56A;
    dw $3142                                                             ;A3C56B;

Spritemap_Bang_Growth4_Growing_6:
    dw $0001,$C3F8                                                       ;A3C56D;
    db $F8                                                               ;A3C571;
    dw $316C                                                             ;A3C572;

Spritemap_Bang_Growth4_Growing_7:
    dw $0004,$C3EE                                                       ;A3C574;
    db $EE                                                               ;A3C578;
    dw $7146,$C3EE                                                       ;A3C579;
    db $02                                                               ;A3C57D;
    dw $F146,$C202                                                       ;A3C57E;
    db $02                                                               ;A3C582;
    dw $B146,$C202                                                       ;A3C583;
    db $EE                                                               ;A3C587;
    dw $3146                                                             ;A3C588;

Spritemap_Bang_Growth4_Growing_8:
    dw $0001,$C3F8                                                       ;A3C58A;
    db $F8                                                               ;A3C58E;
    dw $316E                                                             ;A3C58F;

Spritemap_Bang_Growth4_Growing_9:
    dw $0004,$C3ED                                                       ;A3C591;
    db $ED                                                               ;A3C595;
    dw $714A,$C3ED                                                       ;A3C596;
    db $03                                                               ;A3C59A;
    dw $F14A,$C203                                                       ;A3C59B;
    db $03                                                               ;A3C59F;
    dw $B14A,$C203                                                       ;A3C5A0;
    db $ED                                                               ;A3C5A4;
    dw $314A                                                             ;A3C5A5;

Spritemap_Bang_Growth4_Growing_A:
    dw $0001,$C3F8                                                       ;A3C5A7;
    db $F8                                                               ;A3C5AB;
    dw $316C                                                             ;A3C5AC;

UNUSED_Spritemap_Bang_Electricity_A3C5AE:
    dw $0002,$0006                                                       ;A3C5AE;
    db $FC                                                               ;A3C5B2;
    dw $3164,$01F5                                                       ;A3C5B3;
    db $F5                                                               ;A3C5B7;
    dw $3161                                                             ;A3C5B8;

UNUSED_Spritemap_Bang_Electricity_A3C5BA:
    dw $0002,$0006                                                       ;A3C5BA;
    db $FC                                                               ;A3C5BE;
    dw $3165,$01F5                                                       ;A3C5BF;
    db $F5                                                               ;A3C5C3;
    dw $3162                                                             ;A3C5C4;

UNUSED_Spritemap_Bang_Electricity_A3C5C6:
    dw $0002,$0006                                                       ;A3C5C6;
    db $FC                                                               ;A3C5CA;
    dw $3166,$01F5                                                       ;A3C5CB;
    db $F5                                                               ;A3C5CF;
    dw $3163                                                             ;A3C5D0;

UNUSED_Spritemap_Bang_Electricity_A3C5D2:
    dw $0002,$0003                                                       ;A3C5D2;
    db $F5                                                               ;A3C5D6;
    dw $7161,$01F2                                                       ;A3C5D7;
    db $FD                                                               ;A3C5DB;
    dw $3164                                                             ;A3C5DC;

UNUSED_Spritemap_Bang_Electricity_A3C5DE:
    dw $0002,$0003                                                       ;A3C5DE;
    db $F5                                                               ;A3C5E2;
    dw $7162,$01F2                                                       ;A3C5E3;
    db $FD                                                               ;A3C5E7;
    dw $3165                                                             ;A3C5E8;

UNUSED_Spritemap_Bang_Electricity_A3C5EA:
    dw $0002,$01F2                                                       ;A3C5EA;
    db $FD                                                               ;A3C5EE;
    dw $3166,$0003                                                       ;A3C5EF;
    db $F5                                                               ;A3C5F3;
    dw $7163                                                             ;A3C5F4;

UNUSED_Spritemap_Bang_Electricity_A3C5F6:
    dw $0002,$01FA                                                       ;A3C5F6;
    db $05                                                               ;A3C5FA;
    dw $3176,$01FC                                                       ;A3C5FB;
    db $F3                                                               ;A3C5FF;
    dw $3174                                                             ;A3C600;

UNUSED_Spritemap_Bang_Electricity_A3C602:
    dw $0002,$01FA                                                       ;A3C602;
    db $05                                                               ;A3C606;
    dw $3175,$01FC                                                       ;A3C607;
    db $F3                                                               ;A3C60B;
    dw $3175                                                             ;A3C60C;

UNUSED_Spritemap_Bang_Electricity_A3C60E:
    dw $0002,$01FB                                                       ;A3C60E;
    db $05                                                               ;A3C612;
    dw $3174,$01FC                                                       ;A3C613;
    db $F3                                                               ;A3C617;
    dw $3176                                                             ;A3C618;

UNUSED_Spritemap_Bang_Electricity_A3C61A:
    dw $0002,$0003                                                       ;A3C61A;
    db $03                                                               ;A3C61E;
    dw $3163,$01F5                                                       ;A3C61F;
    db $03                                                               ;A3C623;
    dw $7161                                                             ;A3C624;

UNUSED_Spritemap_Bang_Electricity_A3C626:
    dw $0002,$0003                                                       ;A3C626;
    db $03                                                               ;A3C62A;
    dw $3162,$01F5                                                       ;A3C62B;
    db $03                                                               ;A3C62F;
    dw $7162                                                             ;A3C630;

UNUSED_Spritemap_Bang_Electricity_A3C632:
    dw $0002,$0003                                                       ;A3C632;
    db $03                                                               ;A3C636;
    dw $3161,$01F5                                                       ;A3C637;
    db $03                                                               ;A3C63B;
    dw $7163                                                             ;A3C63C;

Palette_Skree:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A3C63E;
    dw $0924,$7FFF,$039C,$0237,$00D1,$61BF,$38B6,$1448                   ;A3C64E;

InstList_Skree_Idling:
    dw $000A                                                             ;A3C65E;
    dw Spritemap_Skree_0                                                 ;A3C660;
    dw $000A                                                             ;A3C662;
    dw Spritemap_Skree_2                                                 ;A3C664;
    dw $000A                                                             ;A3C666;
    dw Spritemap_Skree_3                                                 ;A3C668;
    dw $000A                                                             ;A3C66A;
    dw Spritemap_Skree_4                                                 ;A3C66C;
    dw Instruction_Common_GotoY                                          ;A3C66E;
    dw InstList_Skree_Idling                                             ;A3C670;

InstList_Skree_PrepareToLaunchAttack:
    dw $0010                                                             ;A3C672;
    dw Spritemap_Skree_0                                                 ;A3C674;
    dw $0008                                                             ;A3C676;
    dw Spritemap_Skree_1                                                 ;A3C678;
    dw Instruction_Skree_SetAttackReadyFlag                              ;A3C67A;
    dw Instruction_Common_Sleep                                          ;A3C67C;

InstList_Skree_LaunchedAttack_0:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A3C67E;

InstList_Skree_LaunchedAttack_1:
    dw $0002                                                             ;A3C680;
    dw Spritemap_Skree_2                                                 ;A3C682;
    dw $0002                                                             ;A3C684;
    dw Spritemap_Skree_3                                                 ;A3C686;
    dw $0002                                                             ;A3C688;
    dw Spritemap_Skree_4                                                 ;A3C68A;
    dw $0002                                                             ;A3C68C;
    dw Spritemap_Skree_0                                                 ;A3C68E;
    dw Instruction_Common_GotoY                                          ;A3C690;
    dw InstList_Skree_LaunchedAttack_1                                   ;A3C692;

UNUSED_InstList_Skree_StopAnimating_A3C694:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A3C694;
    dw $0001                                                             ;A3C696;
    dw Spritemap_Skree_0                                                 ;A3C698;
    dw Instruction_Common_Sleep                                          ;A3C69A;

InstListPointers_Skree:
    dw InstList_Skree_Idling                                             ;A3C69C;
    dw InstList_Skree_PrepareToLaunchAttack                              ;A3C69E;
    dw InstList_Skree_LaunchedAttack_0                                   ;A3C6A0;
    dw UNUSED_InstList_Skree_StopAnimating_A3C694                        ;A3C6A2;

Instruction_Skree_SetAttackReadyFlag:
    LDX.W $0E54                                                          ;A3C6A4;
    LDA.W #$0001                                                         ;A3C6A7;
    STA.W EnemyData.work4,X                                              ;A3C6AA;
    RTL                                                                  ;A3C6AD;


InitAI_Skree:
    LDX.W $0E54                                                          ;A3C6AE;
    STZ.W EnemyData.work2,X                                              ;A3C6B1;
    STZ.W EnemyData.work3,X                                              ;A3C6B4;
    STZ.W EnemyData.work4,X                                              ;A3C6B7;
    LDA.W #InstList_Skree_Idling                                         ;A3C6BA;
    STA.W EnemyData.pInstList,X                                          ;A3C6BD;
    LDA.W #Function_Skree_Idling                                         ;A3C6C0;
    STA.W EnemyData.work1,X                                              ;A3C6C3;
    RTL                                                                  ;A3C6C6;


MainAI_Skree:
    LDX.W $0E54                                                          ;A3C6C7;
    JMP.W ($0FAA,X)                                                      ;A3C6CA;


UNUSED_FunctionPointers_Skree_A3C6CD:
    dw Function_Skree_Idling                                             ;A3C6CD;
    dw Function_Skree_PrepareToLaunchAttack                              ;A3C6CF;
    dw Function_Skree_LaunchedAttack                                     ;A3C6D1;
    dw Function_Skree_Burrowing                                          ;A3C6D3;

Function_Skree_Idling:
    LDX.W $0E54                                                          ;A3C6D5;
    LDA.W EnemyData.xPosition,X                                          ;A3C6D8;
    SEC                                                                  ;A3C6DB;
    SBC.W $0AF6                                                          ;A3C6DC;
    BPL +                                                                ;A3C6DF;
    EOR.W #$FFFF                                                         ;A3C6E1;
    INC A                                                                ;A3C6E4;

  + CMP.W #$0030                                                         ;A3C6E5;
    BCS .return                                                          ;A3C6E8;
    INC.W EnemyData.work2,X                                              ;A3C6EA;
    JSR.W SetSkreeInstListPointer                                        ;A3C6ED;
    LDA.W #Function_Skree_PrepareToLaunchAttack                          ;A3C6F0;
    STA.W EnemyData.work1,X                                              ;A3C6F3;

.return:
    RTL                                                                  ;A3C6F6;


Function_Skree_PrepareToLaunchAttack:
    LDA.W EnemyData.work4,X                                              ;A3C6F7;
    BEQ .return                                                          ;A3C6FA;
    STZ.W EnemyData.work4,X                                              ;A3C6FC;
    LDX.W $0E54                                                          ;A3C6FF;
    INC.W EnemyData.work2,X                                              ;A3C702;
    JSR.W SetSkreeInstListPointer                                        ;A3C705;
    LDA.W #Function_Skree_LaunchedAttack                                 ;A3C708;
    STA.W EnemyData.work1,X                                              ;A3C70B;
    LDA.W #$005B                                                         ;A3C70E;
    JSL.L QueueSound_Lib2_Max6                                           ;A3C711;

.return:
    RTL                                                                  ;A3C715;


Function_Skree_LaunchedAttack:
    LDX.W $0E54                                                          ;A3C716;
    LDA.W #$0015                                                         ;A3C719;
    STA.W EnemyData.work0,X                                              ;A3C71C;
    LDA.W #$0006                                                         ;A3C71F;
    STA.B $14                                                            ;A3C722;
    STZ.B $12                                                            ;A3C724;
    LDA.W EnemyData.properties,X                                         ;A3C726;
    ORA.W #$0003                                                         ;A3C729;
    STA.W EnemyData.properties,X                                         ;A3C72C;
    LDX.W $0E54                                                          ;A3C72F;
    JSL.L CheckForVerticalSolidBlockCollision_SkreeMetaree               ;A3C732;
    BCS .collision                                                       ;A3C736;
    LDX.W $0E54                                                          ;A3C738;
    LDA.W EnemyData.yPosition,X                                          ;A3C73B;
    CLC                                                                  ;A3C73E;
    ADC.W #$0006                                                         ;A3C73F;
    STA.W EnemyData.yPosition,X                                          ;A3C742;
    LDA.W #$0001                                                         ;A3C745;
    STA.W $0E24                                                          ;A3C748;
    LDA.W EnemyData.xPosition,X                                          ;A3C74B;
    CMP.W $0AF6                                                          ;A3C74E;
    BMI .steerRight                                                      ;A3C751;
    LDA.W #$FFFF                                                         ;A3C753;
    STA.W $0E24                                                          ;A3C756;

.steerRight:
    LDA.W EnemyData.xPosition,X                                          ;A3C759;
    CLC                                                                  ;A3C75C;
    ADC.W $0E24                                                          ;A3C75D;
    STA.W EnemyData.xPosition,X                                          ;A3C760;
    BRA .return                                                          ;A3C763;


.collision:
    LDX.W $0E54                                                          ;A3C765;
    LDA.W #$0001                                                         ;A3C768;
    STA.W EnemyData.instTimer,X                                          ;A3C76B;
    STZ.W EnemyData.loopCounter,X                                        ;A3C76E;
    LDA.W #Function_Skree_Burrowing                                      ;A3C771;
    STA.W EnemyData.work1,X                                              ;A3C774;
    LDA.W #$005C                                                         ;A3C777;
    JSL.L QueueSound_Lib2_Max6                                           ;A3C77A;

.return:
    RTL                                                                  ;A3C77E;


Function_Skree_Burrowing:
    LDX.W $0E54                                                          ;A3C77F;
    DEC.W EnemyData.work0,X                                              ;A3C782;
    BEQ .delete                                                          ;A3C785;
    LDA.W EnemyData.work0,X                                              ;A3C787;
    CMP.W #$0008                                                         ;A3C78A;
    BNE .timerNot8                                                       ;A3C78D;
    LDX.W $0E54                                                          ;A3C78F;
    LDY.W #EnemyProjectile_SkreeParticles_DownRight                      ;A3C792;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C795;
    LDY.W #EnemyProjectile_SkreeParticles_UpRight                        ;A3C799;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C79C;
    LDY.W #EnemyProjectile_SkreeParticles_DownLeft                       ;A3C7A0;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C7A3;
    LDY.W #EnemyProjectile_SkreeParticles_UpLeft                         ;A3C7A7;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C7AA;

.timerNot8:
    LDX.W $0E54                                                          ;A3C7AE;
    INC.W EnemyData.yPosition,X                                          ;A3C7B1;
    RTL                                                                  ;A3C7B4;


.delete:
    LDX.W $0E54                                                          ;A3C7B5;
    LDA.W EnemyData.palette,X                                            ;A3C7B8;
    ORA.W EnemyData.gfxOffset,X                                          ;A3C7BB;
    STA.L $7E7006,X                                                      ;A3C7BE;
    LDA.W #$0A00                                                         ;A3C7C2;
    STA.W EnemyData.palette,X                                            ;A3C7C5;
    STZ.W EnemyData.gfxOffset,X                                          ;A3C7C8;
    LDA.W EnemyData.properties,X                                         ;A3C7CB;
    ORA.W #$0200                                                         ;A3C7CE;
    STA.W EnemyData.properties,X                                         ;A3C7D1;
    RTL                                                                  ;A3C7D4;


SetSkreeInstListPointer:
    LDX.W $0E54                                                          ;A3C7D5;
    LDA.W EnemyData.work2,X                                              ;A3C7D8;
    CMP.W EnemyData.work3,X                                              ;A3C7DB;
    BEQ .return                                                          ;A3C7DE;
    STA.W EnemyData.work3,X                                              ;A3C7E0;
    ASL A                                                                ;A3C7E3;
    TAY                                                                  ;A3C7E4;
    LDA.W InstListPointers_Skree,Y                                       ;A3C7E5;
    STA.W EnemyData.pInstList,X                                          ;A3C7E8;
    LDA.W #$0001                                                         ;A3C7EB;
    STA.W EnemyData.instTimer,X                                          ;A3C7EE;
    STZ.W EnemyData.loopCounter,X                                        ;A3C7F1;

.return:
    RTS                                                                  ;A3C7F4;


EnemyShot_Skree:
    LDX.W $0E54                                                          ;A3C7F5;
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic     ;A3C7F8;
    LDX.W $0E54                                                          ;A3C7FC;
    LDA.W EnemyData.health,X                                             ;A3C7FF;
    BNE .return                                                          ;A3C802;
    LDA.W EnemyData.work0,X                                              ;A3C804;
    LDX.W $0E54                                                          ;A3C807;
    LDY.W #EnemyProjectile_SkreeParticles_DownRight                      ;A3C80A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C80D;
    LDY.W #EnemyProjectile_SkreeParticles_UpRight                        ;A3C811;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C814;
    LDY.W #EnemyProjectile_SkreeParticles_DownLeft                       ;A3C818;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C81B;
    LDY.W #EnemyProjectile_SkreeParticles_UpLeft                         ;A3C81F;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A3C822;
    LDY.W #$0002                                                         ;A3C826;
    LDA.W $18A6                                                          ;A3C829;
    ASL A                                                                ;A3C82C;
    TAX                                                                  ;A3C82D;
    LDA.W $0C18,X                                                        ;A3C82E;
    AND.W #$0F00                                                         ;A3C831;
    CMP.W #$0200                                                         ;A3C834;
    BEQ .superMissile                                                    ;A3C837;
    LDY.W #$0000                                                         ;A3C839;

.superMissile:
    TYA                                                                  ;A3C83C;
    JSL.L EnemyDeath                                                     ;A3C83D;

.return:
    RTL                                                                  ;A3C841;


Spritemap_Skree_0:
    dw $0006,$0000                                                       ;A3C842;
    db $0C                                                               ;A3C846;
    dw $6112,$0000                                                       ;A3C847;
    db $04                                                               ;A3C84B;
    dw $6102,$01F8                                                       ;A3C84C;
    db $0C                                                               ;A3C850;
    dw $2112,$01F8                                                       ;A3C851;
    db $04                                                               ;A3C855;
    dw $2102,$8000                                                       ;A3C856;
    db $F4                                                               ;A3C85A;
    dw $6100,$81F0                                                       ;A3C85B;
    db $F4                                                               ;A3C85F;
    dw $2100                                                             ;A3C860;

Spritemap_Skree_1:
    dw $0004,$0004                                                       ;A3C862;
    db $04                                                               ;A3C866;
    dw $6105,$01F4                                                       ;A3C867;
    db $04                                                               ;A3C86B;
    dw $2105,$8000                                                       ;A3C86C;
    db $F4                                                               ;A3C870;
    dw $6103,$81F0                                                       ;A3C871;
    db $F4                                                               ;A3C875;
    dw $2103                                                             ;A3C876;

Spritemap_Skree_2:
    dw $0002,$81F8                                                       ;A3C878;
    db $04                                                               ;A3C87C;
    dw $2108,$81F8                                                       ;A3C87D;
    db $F4                                                               ;A3C881;
    dw $2106                                                             ;A3C882;

Spritemap_Skree_3:
    dw $0004,$01FC                                                       ;A3C884;
    db $0C                                                               ;A3C888;
    dw $211B,$01FC                                                       ;A3C889;
    db $04                                                               ;A3C88D;
    dw $210B,$01FC                                                       ;A3C88E;
    db $FC                                                               ;A3C892;
    dw $211A,$01FC                                                       ;A3C893;
    db $F4                                                               ;A3C897;
    dw $210A                                                             ;A3C898;

Spritemap_Skree_4:
    dw $0002,$81F8                                                       ;A3C89A;
    db $04                                                               ;A3C89E;
    dw $210E,$81F8                                                       ;A3C89F;
    db $F4                                                               ;A3C8A3;
    dw $210C                                                             ;A3C8A4;

Palette_Yard:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610                   ;A3C8A6;
    dw $1DCE,$77FF,$62B5,$314A,$1063,$4D1F,$38B6,$246E                   ;A3C8B6;

InstList_Yard_OutsideTurn_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C8C6;
    dw RTL_A3CF5F                                                        ;A3C8C8;
    dw Instruction_Yard_HidingInstListInY                                ;A3C8CA;
    dw RTL_A3CF5F                                                        ;A3C8CC;
    dw $0007                                                             ;A3C8CE;
    dw Spritemap_Yard_15                                                 ;A3C8D0;
    dw $0004                                                             ;A3C8D2;
    dw Spritemap_Yard_16                                                 ;A3C8D4;
    dw $0007                                                             ;A3C8D6;
    dw Spritemap_Yard_17                                                 ;A3C8D8;
    dw Instruction_Yard_MoveByPixelsInY                                  ;A3C8DA;
    dw $FFFC,$FFF8                                                       ;A3C8DC;

InstList_Yard_Crawling_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C8E0;
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingLeft               ;A3C8E2;
    dw Instruction_Yard_HidingInstListInY                                ;A3C8E4;
    dw InstList_Yard_Hiding_UpsideUp_MovingLeft                          ;A3C8E6;
    dw Instruction_Yard_DirectionInY                                     ;A3C8E8;
    dw $0006,$0009                                                       ;A3C8EA;
    dw Spritemap_Yard_0                                                  ;A3C8EE;
    dw $000D                                                             ;A3C8F0;
    dw Spritemap_Yard_1                                                  ;A3C8F2;
    dw $0009                                                             ;A3C8F4;
    dw Spritemap_Yard_2                                                  ;A3C8F6;
    dw Instruction_Common_GotoY                                          ;A3C8F8;
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft                        ;A3C8FA;

InstList_Yard_OutsideTurn_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C8FC;
    dw RTL_A3CF5F                                                        ;A3C8FE;
    dw Instruction_Yard_HidingInstListInY                                ;A3C900;
    dw RTL_A3CF5F                                                        ;A3C902;
    dw $0007                                                             ;A3C904;
    dw Spritemap_Yard_3                                                  ;A3C906;
    dw $0004                                                             ;A3C908;
    dw Spritemap_Yard_4                                                  ;A3C90A;
    dw $0007                                                             ;A3C90C;
    dw Spritemap_Yard_5                                                  ;A3C90E;
    dw Instruction_Yard_MoveByPixelsInY                                  ;A3C910;
    dw $FFF8,$0004                                                       ;A3C912;

InstList_Yard_Crawling_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C916;
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingDown             ;A3C918;
    dw Instruction_Yard_HidingInstListInY                                ;A3C91A;
    dw InstList_Yard_Hiding_UpsideLeft_MovingDown                        ;A3C91C;
    dw Instruction_Yard_DirectionInY                                     ;A3C91E;
    dw $0003,$0009                                                       ;A3C920;
    dw Spritemap_Yard_6                                                  ;A3C924;
    dw $000D                                                             ;A3C926;
    dw Spritemap_Yard_7                                                  ;A3C928;
    dw $0009                                                             ;A3C92A;
    dw Spritemap_Yard_8                                                  ;A3C92C;
    dw Instruction_Common_GotoY                                          ;A3C92E;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3C930;

InstList_Yard_OutsideTurn_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C932;
    dw RTL_A3CF5F                                                        ;A3C934;
    dw Instruction_Yard_HidingInstListInY                                ;A3C936;
    dw RTL_A3CF5F                                                        ;A3C938;
    dw $0007                                                             ;A3C93A;
    dw Spritemap_Yard_9                                                  ;A3C93C;
    dw $0004                                                             ;A3C93E;
    dw Spritemap_Yard_A                                                  ;A3C940;
    dw $0007                                                             ;A3C942;
    dw Spritemap_Yard_B                                                  ;A3C944;
    dw Instruction_Yard_MoveByPixelsInY                                  ;A3C946;
    dw $0004,$0008                                                       ;A3C948;

InstList_Yard_Crawling_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C94C;
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingRight            ;A3C94E;
    dw Instruction_Yard_HidingInstListInY                                ;A3C950;
    dw InstList_Yard_Hiding_UpsideDown_MovingRight                       ;A3C952;
    dw Instruction_Yard_DirectionInY                                     ;A3C954;
    dw $0005,$0009                                                       ;A3C956;
    dw Spritemap_Yard_C                                                  ;A3C95A;
    dw $000D                                                             ;A3C95C;
    dw Spritemap_Yard_D                                                  ;A3C95E;
    dw $0009                                                             ;A3C960;
    dw Spritemap_Yard_E                                                  ;A3C962;
    dw Instruction_Common_GotoY                                          ;A3C964;
    dw InstList_Yard_Crawling_UpsideDown_MovingRight                     ;A3C966;

InstList_Yard_OutsideTurn_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C968;
    dw RTL_A3CF5F                                                        ;A3C96A;
    dw Instruction_Yard_HidingInstListInY                                ;A3C96C;
    dw RTL_A3CF5F                                                        ;A3C96E;
    dw $0007                                                             ;A3C970;
    dw Spritemap_Yard_F                                                  ;A3C972;
    dw $0004                                                             ;A3C974;
    dw Spritemap_Yard_10                                                 ;A3C976;
    dw $0007                                                             ;A3C978;
    dw Spritemap_Yard_11                                                 ;A3C97A;
    dw Instruction_Yard_MoveByPixelsInY                                  ;A3C97C;
    dw $0008,$FFFC                                                       ;A3C97E;

InstList_Yard_Crawling_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C982;
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingUp              ;A3C984;
    dw Instruction_Yard_HidingInstListInY                                ;A3C986;
    dw InstList_Yard_Hiding_UpsideRight_MovingUp                         ;A3C988;
    dw Instruction_Yard_DirectionInY                                     ;A3C98A;
    dw $0000,$0009                                                       ;A3C98C;
    dw Spritemap_Yard_12                                                 ;A3C990;
    dw $000D                                                             ;A3C992;
    dw Spritemap_Yard_13                                                 ;A3C994;
    dw $0009                                                             ;A3C996;
    dw Spritemap_Yard_14                                                 ;A3C998;
    dw Instruction_Common_GotoY                                          ;A3C99A;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3C99C;

InstList_Yard_OutsideTurn_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C99E;
    dw RTL_A3CF5F                                                        ;A3C9A0;
    dw Instruction_Yard_HidingInstListInY                                ;A3C9A2;
    dw RTL_A3CF5F                                                        ;A3C9A4;
    dw $0007                                                             ;A3C9A6;
    dw Spritemap_Yard_35                                                 ;A3C9A8;
    dw $0004                                                             ;A3C9AA;
    dw Spritemap_Yard_36                                                 ;A3C9AC;
    dw $0007                                                             ;A3C9AE;
    dw Spritemap_Yard_37                                                 ;A3C9B0;
    dw Instruction_Yard_MoveByPixelsInY                                  ;A3C9B2;
    dw $0004,$FFF8                                                       ;A3C9B4;

InstList_Yard_Crawling_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C9B8;
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingRight              ;A3C9BA;
    dw Instruction_Yard_HidingInstListInY                                ;A3C9BC;
    dw InstList_Yard_Hiding_UpsideUp_MovingRight                         ;A3C9BE;
    dw Instruction_Yard_DirectionInY                                     ;A3C9C0;
    dw $0007,$0009                                                       ;A3C9C2;
    dw Spritemap_Yard_20                                                 ;A3C9C6;
    dw $000D                                                             ;A3C9C8;
    dw Spritemap_Yard_21                                                 ;A3C9CA;
    dw $0009                                                             ;A3C9CC;
    dw Spritemap_Yard_22                                                 ;A3C9CE;
    dw Instruction_Common_GotoY                                          ;A3C9D0;
    dw InstList_Yard_Crawling_UpsideUp_MovingRight                       ;A3C9D2;

InstList_Yard_OutsideTurn_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C9D4;
    dw RTL_A3CF5F                                                        ;A3C9D6;
    dw Instruction_Yard_HidingInstListInY                                ;A3C9D8;
    dw RTL_A3CF5F                                                        ;A3C9DA;
    dw $0007                                                             ;A3C9DC;
    dw Spritemap_Yard_23                                                 ;A3C9DE;
    dw $0004                                                             ;A3C9E0;
    dw Spritemap_Yard_24                                                 ;A3C9E2;
    dw $0007                                                             ;A3C9E4;
    dw Spritemap_Yard_25                                                 ;A3C9E6;
    dw Instruction_Yard_MoveByPixelsInY                                  ;A3C9E8;
    dw $0008,$0004                                                       ;A3C9EA;

InstList_Yard_Crawling_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3C9EE;
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingDown            ;A3C9F0;
    dw Instruction_Yard_HidingInstListInY                                ;A3C9F2;
    dw InstList_Yard_Hiding_UpsideRight_MovingDown                       ;A3C9F4;
    dw Instruction_Yard_DirectionInY                                     ;A3C9F6;
    dw $0001,$0009                                                       ;A3C9F8;
    dw Spritemap_Yard_26                                                 ;A3C9FC;
    dw $000D                                                             ;A3C9FE;
    dw Spritemap_Yard_27                                                 ;A3CA00;
    dw $0009                                                             ;A3CA02;
    dw Spritemap_Yard_28                                                 ;A3CA04;
    dw Instruction_Common_GotoY                                          ;A3CA06;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CA08;

InstList_Yard_OutsideTurn_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA0A;
    dw RTL_A3CF5F                                                        ;A3CA0C;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA0E;
    dw RTL_A3CF5F                                                        ;A3CA10;
    dw $0007                                                             ;A3CA12;
    dw Spritemap_Yard_29                                                 ;A3CA14;
    dw $0004                                                             ;A3CA16;
    dw Spritemap_Yard_2A                                                 ;A3CA18;
    dw $0007                                                             ;A3CA1A;
    dw Spritemap_Yard_2B                                                 ;A3CA1C;
    dw Instruction_Yard_MoveByPixelsInY                                  ;A3CA1E;
    dw $FFFC,$0008                                                       ;A3CA20;

InstList_Yard_Crawling_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA24;
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingLeft             ;A3CA26;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA28;
    dw InstList_Yard_Hiding_UpsideDown_MovingLeft                        ;A3CA2A;
    dw Instruction_Yard_DirectionInY                                     ;A3CA2C;
    dw $0004,$0009                                                       ;A3CA2E;
    dw Spritemap_Yard_2C                                                 ;A3CA32;
    dw $000D                                                             ;A3CA34;
    dw Spritemap_Yard_2D                                                 ;A3CA36;
    dw $0009                                                             ;A3CA38;
    dw Spritemap_Yard_2E                                                 ;A3CA3A;
    dw Instruction_Common_GotoY                                          ;A3CA3C;
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft                      ;A3CA3E;

InstList_Yard_OutsideTurn_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA40;
    dw RTL_A3CF5F                                                        ;A3CA42;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA44;
    dw RTL_A3CF5F                                                        ;A3CA46;
    dw $0007                                                             ;A3CA48;
    dw Spritemap_Yard_2F                                                 ;A3CA4A;
    dw $0004                                                             ;A3CA4C;
    dw Spritemap_Yard_30                                                 ;A3CA4E;
    dw $0007                                                             ;A3CA50;
    dw Spritemap_Yard_31                                                 ;A3CA52;
    dw Instruction_Yard_MoveByPixelsInY                                  ;A3CA54;
    dw $FFF8,$FFFC                                                       ;A3CA56;

InstList_Yard_Crawling_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA5A;
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingUp               ;A3CA5C;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA5E;
    dw InstList_Yard_Hiding_UpsideLeft_MovingUp                          ;A3CA60;
    dw Instruction_Yard_DirectionInY                                     ;A3CA62;
    dw $0002,$0009                                                       ;A3CA64;
    dw Spritemap_Yard_32                                                 ;A3CA68;
    dw $000D                                                             ;A3CA6A;
    dw Spritemap_Yard_33                                                 ;A3CA6C;
    dw $0009                                                             ;A3CA6E;
    dw Spritemap_Yard_34                                                 ;A3CA70;
    dw Instruction_Common_GotoY                                          ;A3CA72;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CA74;

InstList_Yard_InsideTurn_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA76;
    dw RTL_A3CF5F                                                        ;A3CA78;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA7A;
    dw RTL_A3CF5F                                                        ;A3CA7C;
    dw $0007                                                             ;A3CA7E;
    dw Spritemap_Yard_40                                                 ;A3CA80;
    dw $0004                                                             ;A3CA82;
    dw Spritemap_Yard_41                                                 ;A3CA84;
    dw $0007                                                             ;A3CA86;
    dw Spritemap_Yard_42                                                 ;A3CA88;
    dw Instruction_Common_GotoY                                          ;A3CA8A;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CA8C;

InstList_Yard_InsideTurn_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CA8E;
    dw RTL_A3CF5F                                                        ;A3CA90;
    dw Instruction_Yard_HidingInstListInY                                ;A3CA92;
    dw RTL_A3CF5F                                                        ;A3CA94;
    dw $0007                                                             ;A3CA96;
    dw Spritemap_Yard_43                                                 ;A3CA98;
    dw $0004                                                             ;A3CA9A;
    dw Spritemap_Yard_44                                                 ;A3CA9C;
    dw $0007                                                             ;A3CA9E;
    dw Spritemap_Yard_45                                                 ;A3CAA0;
    dw Instruction_Common_GotoY                                          ;A3CAA2;
    dw InstList_Yard_Crawling_UpsideDown_MovingRight                     ;A3CAA4;

InstList_Yard_InsideTurn_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CAA6;
    dw RTL_A3CF5F                                                        ;A3CAA8;
    dw Instruction_Yard_HidingInstListInY                                ;A3CAAA;
    dw RTL_A3CF5F                                                        ;A3CAAC;
    dw $0007                                                             ;A3CAAE;
    dw Spritemap_Yard_46                                                 ;A3CAB0;
    dw $0004                                                             ;A3CAB2;
    dw Spritemap_Yard_47                                                 ;A3CAB4;
    dw $0007                                                             ;A3CAB6;
    dw Spritemap_Yard_48                                                 ;A3CAB8;
    dw Instruction_Common_GotoY                                          ;A3CABA;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CABC;

InstList_Yard_InsideTurn_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CABE;
    dw RTL_A3CF5F                                                        ;A3CAC0;
    dw Instruction_Yard_HidingInstListInY                                ;A3CAC2;
    dw RTL_A3CF5F                                                        ;A3CAC4;
    dw $0007                                                             ;A3CAC6;
    dw Spritemap_Yard_49                                                 ;A3CAC8;
    dw $0004                                                             ;A3CACA;
    dw Spritemap_Yard_4A                                                 ;A3CACC;
    dw $0007                                                             ;A3CACE;
    dw Spritemap_Yard_4B                                                 ;A3CAD0;
    dw Instruction_Common_GotoY                                          ;A3CAD2;
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft                        ;A3CAD4;

InstList_Yard_InsideTurn_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CAD6;
    dw RTL_A3CF5F                                                        ;A3CAD8;
    dw Instruction_Yard_HidingInstListInY                                ;A3CADA;
    dw RTL_A3CF5F                                                        ;A3CADC;
    dw $0007                                                             ;A3CADE;
    dw Spritemap_Yard_54                                                 ;A3CAE0;
    dw $0004                                                             ;A3CAE2;
    dw Spritemap_Yard_55                                                 ;A3CAE4;
    dw $0007                                                             ;A3CAE6;
    dw Spritemap_Yard_56                                                 ;A3CAE8;
    dw Instruction_Common_GotoY                                          ;A3CAEA;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CAEC;

InstList_Yard_InsideTurn_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CAEE;
    dw RTL_A3CF5F                                                        ;A3CAF0;
    dw Instruction_Yard_HidingInstListInY                                ;A3CAF2;
    dw RTL_A3CF5F                                                        ;A3CAF4;
    dw $0007                                                             ;A3CAF6;
    dw Spritemap_Yard_57                                                 ;A3CAF8;
    dw $0004                                                             ;A3CAFA;
    dw Spritemap_Yard_58                                                 ;A3CAFC;
    dw $0007                                                             ;A3CAFE;
    dw Spritemap_Yard_59                                                 ;A3CB00;
    dw Instruction_Common_GotoY                                          ;A3CB02;
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft                      ;A3CB04;

InstList_Yard_InsideTurn_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB06;
    dw RTL_A3CF5F                                                        ;A3CB08;
    dw Instruction_Yard_HidingInstListInY                                ;A3CB0A;
    dw RTL_A3CF5F                                                        ;A3CB0C;
    dw $0007                                                             ;A3CB0E;
    dw Spritemap_Yard_5A                                                 ;A3CB10;
    dw $0004                                                             ;A3CB12;
    dw Spritemap_Yard_5B                                                 ;A3CB14;
    dw $0007                                                             ;A3CB16;
    dw Spritemap_Yard_5C                                                 ;A3CB18;
    dw Instruction_Common_GotoY                                          ;A3CB1A;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CB1C;

InstList_Yard_InsideTurn_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB1E;
    dw RTL_A3CF5F                                                        ;A3CB20;
    dw Instruction_Yard_HidingInstListInY                                ;A3CB22;
    dw RTL_A3CF5F                                                        ;A3CB24;
    dw $0007                                                             ;A3CB26;
    dw Spritemap_Yard_5D                                                 ;A3CB28;
    dw $0004                                                             ;A3CB2A;
    dw Spritemap_Yard_5E                                                 ;A3CB2C;
    dw $0007                                                             ;A3CB2E;
    dw Spritemap_Yard_5F                                                 ;A3CB30;
    dw Instruction_Common_GotoY                                          ;A3CB32;
    dw InstList_Yard_Crawling_UpsideUp_MovingRight                       ;A3CB34;

InstList_Yard_Hiding_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB36;
    dw Function_Yard_Movement_Hiding                                     ;A3CB38;
    dw $0005                                                             ;A3CB3A;
    dw Spritemap_Yard_18                                                 ;A3CB3C;
    dw $0001                                                             ;A3CB3E;
    dw Spritemap_Yard_19                                                 ;A3CB40;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CB42;

InstList_Yard_Hidden_UpsideUp_MovingLeft:
    dw $0030                                                             ;A3CB44;
    dw Spritemap_Yard_4C                                                 ;A3CB46;
    dw $0010                                                             ;A3CB48;
    dw Spritemap_Yard_4D                                                 ;A3CB4A;
    dw Instruction_Common_GotoY                                          ;A3CB4C;
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft                        ;A3CB4E;

InstList_Yard_Hiding_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB50;
    dw Function_Yard_Movement_Hiding                                     ;A3CB52;
    dw $0005                                                             ;A3CB54;
    dw Spritemap_Yard_3C                                                 ;A3CB56;
    dw $0001                                                             ;A3CB58;
    dw Spritemap_Yard_3D                                                 ;A3CB5A;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CB5C;
    dw $0030                                                             ;A3CB5E;
    dw Spritemap_Yard_64                                                 ;A3CB60;
    dw $0010                                                             ;A3CB62;
    dw Spritemap_Yard_65                                                 ;A3CB64;
    dw Instruction_Common_GotoY                                          ;A3CB66;
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft                      ;A3CB68;

InstList_Yard_Hiding_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB6A;
    dw Function_Yard_Movement_Hiding                                     ;A3CB6C;
    dw $0005                                                             ;A3CB6E;
    dw Spritemap_Yard_1C                                                 ;A3CB70;
    dw $0001                                                             ;A3CB72;
    dw Spritemap_Yard_1D                                                 ;A3CB74;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CB76;
    dw $0030                                                             ;A3CB78;
    dw Spritemap_Yard_50                                                 ;A3CB7A;
    dw $0010                                                             ;A3CB7C;
    dw Spritemap_Yard_51                                                 ;A3CB7E;
    dw Instruction_Common_GotoY                                          ;A3CB80;
    dw InstList_Yard_Crawling_UpsideDown_MovingRight                     ;A3CB82;

InstList_Yard_Hiding_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB84;
    dw Function_Yard_Movement_Hiding                                     ;A3CB86;
    dw $0005                                                             ;A3CB88;
    dw Spritemap_Yard_38                                                 ;A3CB8A;
    dw $0001                                                             ;A3CB8C;
    dw Spritemap_Yard_39                                                 ;A3CB8E;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CB90;

InstList_Yard_Hidden_UpsideUp_MovingRight:
    dw $0030                                                             ;A3CB92;
    dw Spritemap_Yard_60                                                 ;A3CB94;
    dw $0010                                                             ;A3CB96;
    dw Spritemap_Yard_61                                                 ;A3CB98;
    dw Instruction_Common_GotoY                                          ;A3CB9A;
    dw InstList_Yard_Crawling_UpsideUp_MovingRight                       ;A3CB9C;

InstList_Yard_Hiding_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CB9E;
    dw Function_Yard_Movement_Hiding                                     ;A3CBA0;
    dw $0005                                                             ;A3CBA2;
    dw Spritemap_Yard_1E                                                 ;A3CBA4;
    dw $0001                                                             ;A3CBA6;
    dw Spritemap_Yard_1F                                                 ;A3CBA8;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CBAA;
    dw $0030                                                             ;A3CBAC;
    dw Spritemap_Yard_4E                                                 ;A3CBAE;
    dw $0010                                                             ;A3CBB0;
    dw Spritemap_Yard_4F                                                 ;A3CBB2;
    dw Instruction_Common_GotoY                                          ;A3CBB4;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CBB6;

InstList_Yard_Hiding_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CBB8;
    dw Function_Yard_Movement_Hiding                                     ;A3CBBA;
    dw $0005                                                             ;A3CBBC;
    dw Spritemap_Yard_3E                                                 ;A3CBBE;
    dw $0001                                                             ;A3CBC0;
    dw Spritemap_Yard_3F                                                 ;A3CBC2;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CBC4;
    dw $0030                                                             ;A3CBC6;
    dw Spritemap_Yard_62                                                 ;A3CBC8;
    dw $0010                                                             ;A3CBCA;
    dw Spritemap_Yard_63                                                 ;A3CBCC;
    dw Instruction_Common_GotoY                                          ;A3CBCE;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CBD0;

InstList_Yard_Hiding_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CBD2;
    dw Function_Yard_Movement_Hiding                                     ;A3CBD4;
    dw $0005                                                             ;A3CBD6;
    dw Spritemap_Yard_1A                                                 ;A3CBD8;
    dw $0001                                                             ;A3CBDA;
    dw Spritemap_Yard_1B                                                 ;A3CBDC;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CBDE;
    dw $0030                                                             ;A3CBE0;
    dw Spritemap_Yard_52                                                 ;A3CBE2;
    dw $0010                                                             ;A3CBE4;
    dw Spritemap_Yard_53                                                 ;A3CBE6;
    dw Instruction_Common_GotoY                                          ;A3CBE8;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CBEA;

InstList_Yard_Hiding_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CBEC;
    dw Function_Yard_Movement_Hiding                                     ;A3CBEE;
    dw $0005                                                             ;A3CBF0;
    dw Spritemap_Yard_3A                                                 ;A3CBF2;
    dw $0001                                                             ;A3CBF4;
    dw Spritemap_Yard_3B                                                 ;A3CBF6;
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance            ;A3CBF8;
    dw $0030                                                             ;A3CBFA;
    dw Spritemap_Yard_66                                                 ;A3CBFC;
    dw $0010                                                             ;A3CBFE;
    dw Spritemap_Yard_67                                                 ;A3CC00;
    dw Instruction_Common_GotoY                                          ;A3CC02;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CC04;

InstList_Yard_Airborne_FacingLeft_0:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CC06;
    dw Function_Yard_Movement_Airborne                                   ;A3CC08;
    dw $0003                                                             ;A3CC0A;
    dw Spritemap_Yard_1F                                                 ;A3CC0C;

InstList_Yard_Airborne_FacingLeft_1:
    dw $0003                                                             ;A3CC0E;
    dw Spritemap_Yard_1B                                                 ;A3CC10;
    dw $0003                                                             ;A3CC12;
    dw Spritemap_Yard_1D                                                 ;A3CC14;
    dw $0003                                                             ;A3CC16;
    dw Spritemap_Yard_1F                                                 ;A3CC18;
    dw Instruction_Common_GotoY                                          ;A3CC1A;
    dw InstList_Yard_Airborne_FacingLeft_1                               ;A3CC1C;

InstList_Yard_Airborne_FacingRight_0:
    dw Instruction_Yard_MovementFunctionInY                              ;A3CC1E;
    dw Function_Yard_Movement_Airborne                                   ;A3CC20;
    dw $0003                                                             ;A3CC22;
    dw Spritemap_Yard_3F                                                 ;A3CC24;

InstList_Yard_Airborne_FacingRight_1:
    dw $0003                                                             ;A3CC26;
    dw Spritemap_Yard_3B                                                 ;A3CC28;
    dw $0003                                                             ;A3CC2A;
    dw Spritemap_Yard_3D                                                 ;A3CC2C;
    dw $0003                                                             ;A3CC2E;
    dw Spritemap_Yard_3F                                                 ;A3CC30;
    dw Instruction_Common_GotoY                                          ;A3CC32;
    dw InstList_Yard_Airborne_FacingRight_1                              ;A3CC34;

Instruction_Yard_MovementFunctionInY:
    LDA.W $0000,Y                                                        ;A3CC36;
    STA.W EnemyData.work5,X                                              ;A3CC39;
    INY                                                                  ;A3CC3C;
    INY                                                                  ;A3CC3D;
    RTL                                                                  ;A3CC3E;


Instruction_Yard_HidingInstListInY:
    LDA.W $0000,Y                                                        ;A3CC3F;
    STA.W EnemyData.work3,X                                              ;A3CC42;
    INY                                                                  ;A3CC45;
    INY                                                                  ;A3CC46;
    RTL                                                                  ;A3CC47;


Instruction_Yard_DirectionInY:
    PHY                                                                  ;A3CC48;
    LDA.W $0000,Y                                                        ;A3CC49;
    STA.L $7E780E,X                                                      ;A3CC4C;
    ASL A                                                                ;A3CC50;
    ASL A                                                                ;A3CC51;
    ASL A                                                                ;A3CC52;
    TAY                                                                  ;A3CC53;
    LDA.W YardDirectionData_airborneFacingDirection,Y                    ;A3CC54;
    STA.L $000FAC,X                                                      ;A3CC57;
    PLY                                                                  ;A3CC5B;
    INY                                                                  ;A3CC5C;
    INY                                                                  ;A3CC5D;
    RTL                                                                  ;A3CC5E;


Instruction_Yard_MoveByPixelsInY:
    LDA.W $0000,Y                                                        ;A3CC5F;
    CLC                                                                  ;A3CC62;
    ADC.W EnemyData.xPosition,X                                          ;A3CC63;
    STA.W EnemyData.xPosition,X                                          ;A3CC66;
    LDA.W $0002,Y                                                        ;A3CC69;
    CLC                                                                  ;A3CC6C;
    ADC.W EnemyData.yPosition,X                                          ;A3CC6D;
    STA.W EnemyData.yPosition,X                                          ;A3CC70;
    INY                                                                  ;A3CC73;
    INY                                                                  ;A3CC74;
    INY                                                                  ;A3CC75;
    INY                                                                  ;A3CC76;
    RTL                                                                  ;A3CC77;


Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance:
    LDA.L $7E7810,X                                                      ;A3CC78;
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


UNUSED_Instruction_Yard_A3CC92:
    NOP                                                                  ;A3CC92;
    PHY                                                                  ;A3CC93;
    JSL.L UNUSED_MakeYardFaceSamus_A3D315                                ;A3CC94;
    BCC .notTurningAround                                                ;A3CC98;
    PLY                                                                  ;A3CC9A;
    LDA.W EnemyData.pInstList,X                                          ;A3CC9B;
    TAY                                                                  ;A3CC9E;
    RTL                                                                  ;A3CC9F;


.notTurningAround:
    PLY                                                                  ;A3CCA0;
    RTL                                                                  ;A3CCA1;


YardCrawlingSpeeds:
    dw $0040,$0080,$00C0,$0100,$0140,$0180,$01C0,$0200                   ;A3CCA2;
    dw $0240,$0280,$02C0,$0300,$0340,$0380,$0400,$0440                   ;A3CCB2;
    dw $0540,$0580,$05C0,$0600,$0640,$0680,$06C0,$0700                   ;A3CCC2;
    dw $0740,$0780,$07C0,$0800,$0840,$0880,$0800,$0000                   ;A3CCD2;

YardTurnData_upsideUp_movingLeft:
    dw $FFF9,$0000                                                       ;A3CCE2;
    dw InstList_Yard_OutsideTurn_UpsideUp_MovingLeft                     ;A3CCE6;
    dw InstList_Yard_InsideTurn_UpsideUp_MovingLeft                      ;A3CCE8;

YardTurnData_upsideLeft_movingDown:
    dw $0000,$0007                                                       ;A3CCEA;
    dw InstList_Yard_OutsideTurn_UpsideLeft_MovingDown                   ;A3CCEE;
    dw InstList_Yard_InsideTurn_UpsideLeft_MovingDown                    ;A3CCF0;

YardTurnData_upsideDown_movingRight:
    dw $0007,$0000                                                       ;A3CCF2;
    dw InstList_Yard_OutsideTurn_UpsideDown_MovingRight                  ;A3CCF6;
    dw InstList_Yard_InsideTurn_UpsideDown_MovingRight                   ;A3CCF8;

YardTurnData_upsideRight_movingUp:
    dw $0000,$FFF9                                                       ;A3CCFA;
    dw InstList_Yard_OutsideTurn_UpsideRight_MovingUp                    ;A3CCFE;
    dw InstList_Yard_InsideTurn_UpsideRight_MovingUp                     ;A3CD00;

YardTurnData_upsideUp_movingRight:
    dw $0007,$0000                                                       ;A3CD02;
    dw InstList_Yard_OutsideTurn_UpsideUp_MovingRight                    ;A3CD06;
    dw InstList_Yard_InsideTurn_UpsideUp_MovingRight                     ;A3CD08;

YardTurnData_upsideRight_movingDown:
    dw $0000,$0007                                                       ;A3CD0A;
    dw InstList_Yard_OutsideTurn_UpsideRight_MovingDown                  ;A3CD0E;
    dw InstList_Yard_InsideTurn_UpsideRight_MovingDown                   ;A3CD10;

YardTurnData_upsideDown_movingLeft:
    dw $FFF9,$0000                                                       ;A3CD12;
    dw InstList_Yard_OutsideTurn_UpsideDown_MovingLeft                   ;A3CD16;
    dw InstList_Yard_InsideTurn_UpsideDown_MovingLeft                    ;A3CD18;

YardTurnData_upsideLeft_movingUp:
    dw $0000,$FFF9                                                       ;A3CD1A;
    dw InstList_Yard_OutsideTurn_UpsideLeft_MovingUp                     ;A3CD1E;
    dw InstList_Yard_InsideTurn_UpsideLeft_MovingUp                      ;A3CD20;

YardTurnData_upsideUp_movingLeft_noTurnTransition:
    dw $0000,$0000                                                       ;A3CD22;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CD26;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CD28;

YardTurnData_upsideDown_movingRight_noTurnTransition:
    dw $0000,$0000                                                       ;A3CD2A;
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CD2E;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CD30;

YardTurnData_upsideUp_movingRight_noTurnTransition:
    dw $0000,$0000                                                       ;A3CD32;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CD36;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CD38;

YardTurnData_upsideDown_movingLeft_noTurnTransition:
    dw $0000,$0000                                                       ;A3CD3A;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CD3E;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CD40;

YardDirectionData_crawlingInstList:
    dw InstList_Yard_Crawling_UpsideRight_MovingUp                       ;A3CD42;

YardDirectionData_movementDirection:
    dw $0002                                                             ;A3CD44;

YardDirectionData_hidingInstList:
    dw InstList_Yard_Hiding_UpsideRight_MovingUp                         ;A3CD46;

YardDirectionData_airborneFacingDirection:
    dw $0000                                                             ;A3CD48;
    dw InstList_Yard_Crawling_UpsideRight_MovingDown                     ;A3CD4A;
    dw $0003                                                             ;A3CD4C;
    dw InstList_Yard_Hiding_UpsideRight_MovingDown                       ;A3CD4E;
    dw $0001                                                             ;A3CD50;
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp                        ;A3CD52;
    dw $0002                                                             ;A3CD54;
    dw InstList_Yard_Hiding_UpsideLeft_MovingUp                          ;A3CD56;
    dw $0001                                                             ;A3CD58;
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown                      ;A3CD5A;
    dw $0003                                                             ;A3CD5C;
    dw InstList_Yard_Hiding_UpsideLeft_MovingDown                        ;A3CD5E;
    dw $0000                                                             ;A3CD60;
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft                      ;A3CD62;
    dw $0000                                                             ;A3CD64;
    dw InstList_Yard_Hiding_UpsideDown_MovingLeft                        ;A3CD66;
    dw $0001                                                             ;A3CD68;
    dw InstList_Yard_Crawling_UpsideDown_MovingRight                     ;A3CD6A;
    dw $0001                                                             ;A3CD6C;
    dw InstList_Yard_Hiding_UpsideDown_MovingRight                       ;A3CD6E;
    dw $0000                                                             ;A3CD70;
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft                        ;A3CD72;
    dw $0000                                                             ;A3CD74;
    dw InstList_Yard_Hiding_UpsideUp_MovingLeft                          ;A3CD76;
    dw $0000                                                             ;A3CD78;
    dw InstList_Yard_Crawling_UpsideUp_MovingRight                       ;A3CD7A;
    dw $0001                                                             ;A3CD7C;
    dw InstList_Yard_Hiding_UpsideUp_MovingRight                         ;A3CD7E;
    dw $0001                                                             ;A3CD80;

YardCrawlingVelocitySigns_X:
    dw $FFFF,$0001                                                       ;A3CD82;

YardCrawlingVelocitySigns_Y:
    dw $FFFF,$0001,$FFFF,$0001,$0000,$0000,$0000,$0000                   ;A3CD86;
    dw $FFFF,$0001,$0000,$0000,$0000,$0000,$FFFF,$0001                   ;A3CD96;
    dw $FFFF,$0001,$0000,$0000,$FFFF,$0001,$FFFF,$0001                   ;A3CDA6;
    dw $0000,$0000,$0000,$0000,$0000,$0000                               ;A3CDB8;

YardOppositeDirection:
    dw $0001,$0000,$0003,$0002,$0005,$0004,$0007,$0006                   ;A3CDC2;

YardCrawlingMovementFunctions:
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingLeft             ;A3CDD2;
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingDown            ;A3CDD4;
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingUp               ;A3CDD6;
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingDown             ;A3CDD8;
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingUp              ;A3CDDA;
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingRight            ;A3CDDC;
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingLeft               ;A3CDDE;
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingRight              ;A3CDE0;

InitAI_Yard:
    LDX.W $0E54                                                          ;A3CDE2;
    LDA.W #RTL_A3CF5F                                                    ;A3CDE5;
    STA.W EnemyData.work5,X                                              ;A3CDE8;
    LDA.W #Spritemap_CommonA3_Nothing                                    ;A3CDEB;
    STA.W EnemyData.pSpritemap,X                                         ;A3CDEE;
    LDA.W #$0001                                                         ;A3CDF1;
    STA.W EnemyData.instTimer,X                                          ;A3CDF4;
    LDA.W EnemyData.pInstList,X                                          ;A3CDF7;
    ASL A                                                                ;A3CDFA;
    ASL A                                                                ;A3CDFB;
    ASL A                                                                ;A3CDFC;
    TAY                                                                  ;A3CDFD;
    LDA.W YardDirectionData_crawlingInstList,Y                           ;A3CDFE;
    STA.W EnemyData.pInstList,X                                          ;A3CE01;
    LDA.W YardDirectionData_movementDirection,Y                          ;A3CE04;
    ORA.W EnemyData.properties,X                                         ;A3CE07;
    STA.W EnemyData.properties,X                                         ;A3CE0A;
    LDA.W YardDirectionData_hidingInstList,Y                             ;A3CE0D;
    STA.W EnemyData.work3,X                                              ;A3CE10;
    LDA.W YardDirectionData_airborneFacingDirection,Y                    ;A3CE13;
    STA.W EnemyData.work2,X                                              ;A3CE16;
    LDA.W #$0000                                                         ;A3CE19;
    STA.L $7E7810,X                                                      ;A3CE1C;
    LDA.W EnemyData.initParam0,X                                         ;A3CE20;
    STA.L $7E780C,X                                                      ;A3CE23; fallthrough to SetYardCrawlingVelocities

SetYardCrawlingVelocities:
    LDA.W YardCrawlingVelocitySigns_X,Y                                  ;A3CE27;
    STA.B $12                                                            ;A3CE2A;
    LDA.W YardCrawlingVelocitySigns_X+2,Y                                ;A3CE2C;
    STA.B $14                                                            ;A3CE2F;
    LDA.W YardCrawlingVelocitySigns_Y,Y                                  ;A3CE31;
    STA.B $16                                                            ;A3CE34;
    LDA.W YardCrawlingVelocitySigns_Y+2,Y                                ;A3CE36;
    STA.B $18                                                            ;A3CE39;
    LDA.W EnemyData.initParam0,X                                         ;A3CE3B;
    ASL A                                                                ;A3CE3E;
    TAY                                                                  ;A3CE3F;
    LDA.W YardCrawlingSpeeds,Y                                           ;A3CE40;
    EOR.B $12                                                            ;A3CE43;
    CLC                                                                  ;A3CE45;
    ADC.B $14                                                            ;A3CE46;
    STA.W EnemyData.work0,X                                              ;A3CE48;
    LDA.W YardCrawlingSpeeds,Y                                           ;A3CE4B;
    EOR.B $16                                                            ;A3CE4E;
    CLC                                                                  ;A3CE50;
    ADC.B $18                                                            ;A3CE51;
    STA.W EnemyData.work1,X                                              ;A3CE53;
    RTL                                                                  ;A3CE56;


SetYardCrawlingMovementFunction:
    LDA.L $7E780E,X                                                      ;A3CE57;
    ASL A                                                                ;A3CE5B;
    TAY                                                                  ;A3CE5C;
    LDA.W YardCrawlingMovementFunctions,Y                                ;A3CE5D;
    STA.W EnemyData.work5,X                                              ;A3CE60;
    RTL                                                                  ;A3CE63;


MainAI_Yard:
    LDX.W $0E54                                                          ;A3CE64;
    JSR.W DropYardIfSuperMissileQuake                                    ;A3CE67;
    JSR.W HandleYardHiding                                               ;A3CE6A;
    JSR.W DetermineIfYardHitboxIsSolidToSamus                            ;A3CE6D;
    JMP.W ($0FB2,X)                                                      ;A3CE70;


DropYardIfSuperMissileQuake:
    LDA.L $7E7810,X                                                      ;A3CE73;
    CMP.W #$0003                                                         ;A3CE77;
    BEQ .return                                                          ;A3CE7A;
    CMP.W #$0004                                                         ;A3CE7C;
    BEQ .return                                                          ;A3CE7F;
    CMP.W #$0005                                                         ;A3CE81;
    BEQ .return                                                          ;A3CE84;
    LDA.W $1840                                                          ;A3CE86;
    CMP.W #$001E                                                         ;A3CE89;
    BNE .return                                                          ;A3CE8C;
    LDA.W $183E                                                          ;A3CE8E;
    CMP.W #$0014                                                         ;A3CE91;
    BNE .return                                                          ;A3CE94;
    JSR.W DropYard                                                       ;A3CE96;

.return:
    RTS                                                                  ;A3CE99;


HandleYardHiding:
    LDA.L $7E7810,X                                                      ;A3CE9A;
    CMP.W #$0001                                                         ;A3CE9E;
    BEQ .return1                                                         ;A3CEA1;
    CMP.W #$0003                                                         ;A3CEA3;
    BEQ .return1                                                         ;A3CEA6;
    CMP.W #$0004                                                         ;A3CEA8;
    BEQ .return1                                                         ;A3CEAB;
    CMP.W #$0005                                                         ;A3CEAD;
    BEQ .return1                                                         ;A3CEB0;
    LDA.W EnemyData.yPosition,X                                          ;A3CEB2;
    SEC                                                                  ;A3CEB5;
    SBC.W $0AFA                                                          ;A3CEB6;
    CMP.W #$FFA0                                                         ;A3CEB9;
    BMI .crawl                                                           ;A3CEBC;
    LDA.W EnemyData.xPosition,X                                          ;A3CEBE;
    CMP.W $0AF6                                                          ;A3CEC1;
    BMI .leftOfSamus                                                     ;A3CEC4;
    LDA.W $0A1E                                                          ;A3CEC6;
    AND.W #$00FF                                                         ;A3CEC9;
    CMP.W #$0008                                                         ;A3CECC;
    BNE .crawl                                                           ;A3CECF;
    BRA +                                                                ;A3CED1;


.leftOfSamus:
    LDA.W $0A1E                                                          ;A3CED3;
    AND.W #$00FF                                                         ;A3CED6;
    CMP.W #$0004                                                         ;A3CED9;
    BNE .crawl                                                           ;A3CEDC;

  + LDA.L $7E7810,X                                                      ;A3CEDE;
    CMP.W #$0002                                                         ;A3CEE2;
    BEQ .return0                                                         ;A3CEE5;
    LDA.W EnemyData.work3,X                                              ;A3CEE7;
    CMP.W #RTL_A3CF5F                                                    ;A3CEEA;
    BEQ .crawl                                                           ;A3CEED;
    STA.W EnemyData.pInstList,X                                          ;A3CEEF;
    LDA.W #Spritemap_CommonA3_Nothing                                    ;A3CEF2;
    STA.W EnemyData.pSpritemap,X                                         ;A3CEF5;
    LDA.W #$0001                                                         ;A3CEF8;
    STA.W EnemyData.instTimer,X                                          ;A3CEFB;
    STZ.W EnemyData.loopCounter,X                                        ;A3CEFE;
    LDA.W #$0002                                                         ;A3CF01;
    STA.L $7E7810,X                                                      ;A3CF04;

.return0:
    RTS                                                                  ;A3CF08;


.crawl:
    LDA.W #$0000                                                         ;A3CF09;
    STA.L $7E7810,X                                                      ;A3CF0C;

.return1:
    RTS                                                                  ;A3CF10;


DetermineIfYardHitboxIsSolidToSamus:
    LDA.W EnemyData.work5,X                                              ;A3CF11;
    CMP.W #Function_Yard_Movement_Airborne                               ;A3CF14;
    BEQ .notSolid                                                        ;A3CF17;
    LDA.L $7E7810,X                                                      ;A3CF19;
    CMP.W #$0001                                                         ;A3CF1D;
    BEQ .aggressivelyCrawling                                            ;A3CF20;
    LDA.W $0B3C                                                          ;A3CF22;
    BNE .notSolid                                                        ;A3CF25;
    LDA.L $7E7810,X                                                      ;A3CF27;
    CMP.W #$0002                                                         ;A3CF2B;
    BEQ .solid                                                           ;A3CF2E;
    CMP.W #$0003                                                         ;A3CF30;
    BEQ .notSolid                                                        ;A3CF33;
    CMP.W #$0005                                                         ;A3CF35;
    BNE .solid                                                           ;A3CF38;
    BRA .notSolid                                                        ;A3CF3A;


.aggressivelyCrawling:
    LDA.W $0B3C                                                          ;A3CF3C;
    BNE .notSolid                                                        ;A3CF3F;
    LDA.W EnemyData.work5,X                                              ;A3CF41;
    CMP.W #RTL_A3CF5F                                                    ;A3CF44;
    BEQ .solid                                                           ;A3CF47;
    BRA .notSolid                                                        ;A3CF49;


.solid:
    LDA.W EnemyData.properties,X                                         ;A3CF4B;
    ORA.W #$8000                                                         ;A3CF4E;
    STA.W EnemyData.properties,X                                         ;A3CF51;
    RTS                                                                  ;A3CF54;


.notSolid:
    LDA.W EnemyData.properties,X                                         ;A3CF55;
    AND.W #$7FFF                                                         ;A3CF58;
    STA.W EnemyData.properties,X                                         ;A3CF5B;
    RTS                                                                  ;A3CF5E;


RTL_A3CF5F:
    RTL                                                                  ;A3CF5F;


Function_Yard_Movement_Hiding:
    LDA.L $7E780E,X                                                      ;A3CF60;
    CMP.W #$0004                                                         ;A3CF64;
    BCS .notMovingVertically                                             ;A3CF67;
    STZ.B $12                                                            ;A3CF69;
    STZ.B $14                                                            ;A3CF6B;
    LDA.W EnemyData.work0,X                                              ;A3CF6D;
    JSR.W SignedMath_A3CF8F                                              ;A3CF70;
    JSL.L CheckForHorizontalSolidBlockCollision                          ;A3CF73;
    BCC .noCollision                                                     ;A3CF77;
    RTL                                                                  ;A3CF79;


.notMovingVertically:
    STZ.B $12                                                            ;A3CF7A;
    STZ.B $14                                                            ;A3CF7C;
    LDA.W EnemyData.work1,X                                              ;A3CF7E;
    JSR.W SignedMath_A3CF8F                                              ;A3CF81;
    JSL.L CheckForVerticalSolidBlockCollision                            ;A3CF84;
    BCC .noCollision                                                     ;A3CF88;
    RTL                                                                  ;A3CF8A;


.noCollision:
    JSR.W DropYard                                                       ;A3CF8B;
    RTL                                                                  ;A3CF8E;


SignedMath_A3CF8F:
    BPL +                                                                ;A3CF8F;
    DEC.B $14                                                            ;A3CF91;

  + STA.B $13                                                            ;A3CF93;
    LDA.B $14                                                            ;A3CF95;
    BPL .add7                                                            ;A3CF97;
    SEC                                                                  ;A3CF99;
    SBC.W #$0007                                                         ;A3CF9A;
    BRA +                                                                ;A3CF9D;


.add7:
    CLC                                                                  ;A3CF9F;
    ADC.W #$0007                                                         ;A3CFA0;

  + STA.B $14                                                            ;A3CFA3;
    RTS                                                                  ;A3CFA5;


Function_Yard_Movement_Crawling_UpsideUp_MovingLeft:
    LDA.L $7E780A,X                                                      ;A3CFA6;
    BNE .upsideUpMovingLeftNoTurnTransition                              ;A3CFAA;
    LDY.W #YardTurnData_upsideUp_movingLeft                              ;A3CFAC;
    BRA .gotoCrawlingMovementHorizontal                                  ;A3CFAF;


.upsideUpMovingLeftNoTurnTransition:
    LDY.W #YardTurnData_upsideUp_movingLeft_noTurnTransition             ;A3CFB1;

.gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal                                ;A3CFB4;


Function_Yard_Movement_Crawling_UpsideLeft_MovingDown:
    LDY.W #YardTurnData_upsideLeft_movingDown                            ;A3CFB7;
    JMP.W YardCrawlingMovement_Vertical                                  ;A3CFBA;


Function_Yard_Movement_Crawling_UpsideDown_MovingRight:
    LDA.L $7E780A,X                                                      ;A3CFBD;
    BNE .upsideDownMovingRightNoTurnTransition                           ;A3CFC1;
    LDY.W #YardTurnData_upsideDown_movingRight                           ;A3CFC3;
    BRA .gotoCrawlingMovementHorizontal                                  ;A3CFC6;


.upsideDownMovingRightNoTurnTransition:
    LDY.W #YardTurnData_upsideDown_movingRight_noTurnTransition          ;A3CFC8;

.gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal                                ;A3CFCB;


Function_Yard_Movement_Crawling_UpsideRight_MovingUp:
    LDY.W #YardTurnData_upsideRight_movingUp                             ;A3CFCE;
    JMP.W YardCrawlingMovement_Vertical                                  ;A3CFD1;


Function_Yard_Movement_Crawling_UpsideUp_MovingRight:
    LDA.L $7E780A,X                                                      ;A3CFD4;
    BNE .upsideUpMovingRightNoTurnTransition                             ;A3CFD8;
    LDY.W #YardTurnData_upsideUp_movingRight                             ;A3CFDA;
    BRA .gotoCrawlingMovementHorizontal                                  ;A3CFDD;


.upsideUpMovingRightNoTurnTransition:
    LDY.W #YardTurnData_upsideUp_movingRight_noTurnTransition            ;A3CFDF;

.gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal                                ;A3CFE2;


Function_Yard_Movement_Crawling_UpsideRight_MovingDown:
    LDY.W #YardTurnData_upsideRight_movingDown                           ;A3CFE5;
    JMP.W YardCrawlingMovement_Vertical                                  ;A3CFE8;


Function_Yard_Movement_Crawling_UpsideDown_MovingLeft:
    LDA.L $7E780A,X                                                      ;A3CFEB;
    BNE .upsideDownMovingLeftNoTurnTransition                            ;A3CFEF;
    LDY.W #YardTurnData_upsideDown_movingLeft                            ;A3CFF1;
    BRA .gotoCrawlingMovementHorizontal                                  ;A3CFF4;


.upsideDownMovingLeftNoTurnTransition:
    LDY.W #YardTurnData_upsideDown_movingLeft_noTurnTransition           ;A3CFF6;

.gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal                                ;A3CFF9;


Function_Yard_Movement_Crawling_UpsideLeft_MovingUp:
    LDY.W #YardTurnData_upsideLeft_movingUp                              ;A3CFFC;
    JMP.W YardCrawlingMovement_Vertical                                  ;A3CFFF;


YardCrawlingMovement_Vertical:
    JSR.W MoveYardAheadForOutsideTurnCheck                               ;A3D002;
    STZ.B $12                                                            ;A3D005;
    STZ.B $14                                                            ;A3D007;
    LDA.W EnemyData.work0,X                                              ;A3D009;
    BPL +                                                                ;A3D00C;
    DEC.B $14                                                            ;A3D00E;

  + STA.B $13                                                            ;A3D010;
    LDA.B $14                                                            ;A3D012;
    BPL .inc                                                             ;A3D014;
    DEC A                                                                ;A3D016;
    BRA +                                                                ;A3D017;


.inc:
    INC A                                                                ;A3D019;

  + STA.B $14                                                            ;A3D01A;
    PHY                                                                  ;A3D01C;
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes                           ;A3D01D;
    PLY                                                                  ;A3D021;
    JSR.W MoveYardBackForOutsideTurnCheck                                ;A3D022;
    BCC .outsideTurn                                                     ;A3D025;
    LDA.W #$0000                                                         ;A3D027;
    STA.W EnemyData.work4,X                                              ;A3D02A;
    PHY                                                                  ;A3D02D;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3D02E;
    PLY                                                                  ;A3D032;
    JSR.W HandleTurnTransitionDisabling                                  ;A3D033;
    STZ.B $12                                                            ;A3D036;
    STZ.B $14                                                            ;A3D038;
    LDA.W EnemyData.work1,X                                              ;A3D03A;
    BPL +                                                                ;A3D03D;
    DEC.B $14                                                            ;A3D03F;

  + STA.B $13                                                            ;A3D041;
    PHY                                                                  ;A3D043;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3D044;
    PLY                                                                  ;A3D048;
    BCS .insideTurn                                                      ;A3D049;
    RTL                                                                  ;A3D04B;


.insideTurn:
    LDA.W EnemyData.work0,X                                              ;A3D04C;
    EOR.W #$FFFF                                                         ;A3D04F;
    INC A                                                                ;A3D052;
    STA.W EnemyData.work0,X                                              ;A3D053;
    LDA.W $0006,Y                                                        ;A3D056;
    JSR.W SetYardInstList_DisableTurnTransition                          ;A3D059;
    RTL                                                                  ;A3D05C;


.outsideTurn:
    LDA.W EnemyData.work4,X                                              ;A3D05D;
    INC A                                                                ;A3D060;
    STA.W EnemyData.work4,X                                              ;A3D061;
    CMP.W #$0004                                                         ;A3D064;
    BMI .lessThan4Turns                                                  ;A3D067;
    JSR.W DropYard                                                       ;A3D069;
    RTL                                                                  ;A3D06C;


.lessThan4Turns:
    LDA.W EnemyData.work1,X                                              ;A3D06D;
    EOR.W #$FFFF                                                         ;A3D070;
    INC A                                                                ;A3D073;
    STA.W EnemyData.work1,X                                              ;A3D074;
    LDA.W $0004,Y                                                        ;A3D077;
    JSR.W SetYardInstList_DisableTurnTransition                          ;A3D07A;
    RTL                                                                  ;A3D07D;


YardCrawlingMovement_Horizontal:
    JSR.W MoveYardAheadForOutsideTurnCheck                               ;A3D07E;
    STZ.B $12                                                            ;A3D081;
    STZ.B $14                                                            ;A3D083;
    LDA.W EnemyData.work1,X                                              ;A3D085;
    BPL +                                                                ;A3D088;
    DEC.B $14                                                            ;A3D08A;

  + STA.B $13                                                            ;A3D08C;
    LDA.B $14                                                            ;A3D08E;
    BPL .inc                                                             ;A3D090;
    DEC A                                                                ;A3D092;
    BRA +                                                                ;A3D093;


.inc:
    INC A                                                                ;A3D095;

  + STA.B $14                                                            ;A3D096;
    PHY                                                                  ;A3D098;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3D099;
    PLY                                                                  ;A3D09D;
    JSR.W MoveYardBackForOutsideTurnCheck                                ;A3D09E;
    BCC .outsideTurn                                                     ;A3D0A1;
    LDA.W #$0000                                                         ;A3D0A3;
    STA.W EnemyData.work4,X                                              ;A3D0A6;
    STZ.B $12                                                            ;A3D0A9;
    STZ.B $14                                                            ;A3D0AB;
    LDA.W EnemyData.work0,X                                              ;A3D0AD;
    BPL +                                                                ;A3D0B0;
    DEC.B $14                                                            ;A3D0B2;

  + STA.B $13                                                            ;A3D0B4;
    PHY                                                                  ;A3D0B6;
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes                           ;A3D0B7;
    PLY                                                                  ;A3D0BB;
    BCS .insideTurn                                                      ;A3D0BC;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3D0BE;
    JSR.W HandleTurnTransitionDisabling                                  ;A3D0C2;
    RTL                                                                  ;A3D0C5;


.insideTurn:
    LDA.W EnemyData.work1,X                                              ;A3D0C6;
    EOR.W #$FFFF                                                         ;A3D0C9;
    INC A                                                                ;A3D0CC;
    STA.W EnemyData.work1,X                                              ;A3D0CD;
    LDA.W $0006,Y                                                        ;A3D0D0;
    JSR.W SetYardInstList_DisableTurnTransition                          ;A3D0D3;
    RTL                                                                  ;A3D0D6;


.outsideTurn:
    LDA.W EnemyData.work4,X                                              ;A3D0D7;
    INC A                                                                ;A3D0DA;
    STA.W EnemyData.work4,X                                              ;A3D0DB;
    CMP.W #$0004                                                         ;A3D0DE;
    BMI .lessThan4Turns                                                  ;A3D0E1;
    JSR.W DropYard                                                       ;A3D0E3;
    RTL                                                                  ;A3D0E6;


.lessThan4Turns:
    LDA.W EnemyData.work0,X                                              ;A3D0E7;
    EOR.W #$FFFF                                                         ;A3D0EA;
    INC A                                                                ;A3D0ED;
    STA.W EnemyData.work0,X                                              ;A3D0EE;
    LDA.W $0004,Y                                                        ;A3D0F1;
    JSR.W SetYardInstList_DisableTurnTransition                          ;A3D0F4;
    RTL                                                                  ;A3D0F7;


MoveYardAheadForOutsideTurnCheck:
    LDA.W EnemyData.xPosition,X                                          ;A3D0F8;
    CLC                                                                  ;A3D0FB;
    ADC.W $0000,Y                                                        ;A3D0FC;
    STA.W EnemyData.xPosition,X                                          ;A3D0FF;
    LDA.W EnemyData.yPosition,X                                          ;A3D102;
    CLC                                                                  ;A3D105;
    ADC.W $0002,Y                                                        ;A3D106;
    STA.W EnemyData.yPosition,X                                          ;A3D109;
    RTS                                                                  ;A3D10C;


MoveYardBackForOutsideTurnCheck:
    PHP                                                                  ;A3D10D;
    LDA.W EnemyData.xPosition,X                                          ;A3D10E;
    SEC                                                                  ;A3D111;
    SBC.W $0000,Y                                                        ;A3D112;
    STA.W EnemyData.xPosition,X                                          ;A3D115;
    LDA.W EnemyData.yPosition,X                                          ;A3D118;
    SEC                                                                  ;A3D11B;
    SBC.W $0002,Y                                                        ;A3D11C;
    STA.W EnemyData.yPosition,X                                          ;A3D11F;
    PLP                                                                  ;A3D122;
    RTS                                                                  ;A3D123;


HandleTurnTransitionDisabling:
    BCS .resetTurnTransitionDisableCounter                               ;A3D124;
    LDA.L $7E7808,X                                                      ;A3D126;
    INC A                                                                ;A3D12A;
    CMP.W #$0010                                                         ;A3D12B;
    BCS .enableTurnTransition                                            ;A3D12E;
    STA.L $7E7808,X                                                      ;A3D130;
    RTS                                                                  ;A3D134;


.resetTurnTransitionDisableCounter:
    LDA.W #$0001                                                         ;A3D135;
    STA.L $7E780A,X                                                      ;A3D138;
    LDA.W #$0000                                                         ;A3D13C;
    STA.L $7E7808,X                                                      ;A3D13F;
    RTS                                                                  ;A3D143;


.enableTurnTransition:
    LDA.W #$0000                                                         ;A3D144;
    STA.L $7E780A,X                                                      ;A3D147;
    RTS                                                                  ;A3D14B;


SetYardInstList_DisableTurnTransition:
    STA.W EnemyData.pInstList,X                                          ;A3D14C;
    LDA.W #$0001                                                         ;A3D14F;
    STA.W EnemyData.instTimer,X                                          ;A3D152;
    LDA.W #$0001                                                         ;A3D155;
    STA.L $7E780A,X                                                      ;A3D158;
    LDA.W #$0000                                                         ;A3D15C;
    STA.L $7E7808,X                                                      ;A3D15F;
    RTS                                                                  ;A3D163;


DropYard:
    PHY                                                                  ;A3D164;
    LDA.L $7E7810,X                                                      ;A3D165;
    CMP.W #$0003                                                         ;A3D169;
    BEQ .return                                                          ;A3D16C;
    LDA.W #$0003                                                         ;A3D16E;
    STA.L $7E7810,X                                                      ;A3D171;
    LDA.W #Function_Yard_Movement_Airborne                               ;A3D175;
    STA.W EnemyData.work5,X                                              ;A3D178;
    LDA.W EnemyData.work2,X                                              ;A3D17B;
    ASL A                                                                ;A3D17E;
    ASL A                                                                ;A3D17F;
    TAY                                                                  ;A3D180;
    LDA.W .airbornePointers,Y                                            ;A3D181;
    STA.W EnemyData.pInstList,X                                          ;A3D184;
    LDA.W .hidingPointers,Y                                              ;A3D187;
    STA.W EnemyData.work3,X                                              ;A3D18A;
    LDA.W #$0001                                                         ;A3D18D;
    STA.W EnemyData.instTimer,X                                          ;A3D190;
    STZ.W EnemyData.loopCounter,X                                        ;A3D193;
    LDA.W #$0000                                                         ;A3D196;
    STA.L $7E7804,X                                                      ;A3D199;
    STA.L $7E7806,X                                                      ;A3D19D;
    STA.L $7E7800,X                                                      ;A3D1A1;
    STA.L $7E7802,X                                                      ;A3D1A5;

.return:
    PLY                                                                  ;A3D1A9;
    RTS                                                                  ;A3D1AA;


.airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0                               ;A3D1AB;

.hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft                          ;A3D1AD;
    dw InstList_Yard_Airborne_FacingRight_0                              ;A3D1AF;
    dw InstList_Yard_Hidden_UpsideUp_MovingRight                         ;A3D1B1;

Function_Yard_Movement_Airborne:
    LDA.L $7E7810,X                                                      ;A3D1B3;
    CMP.W #$0003                                                         ;A3D1B7;
    BEQ .XMovementEnd                                                    ;A3D1BA;
    LDA.L $7E7804,X                                                      ;A3D1BC;
    STA.B $12                                                            ;A3D1C0;
    LDA.L $7E7806,X                                                      ;A3D1C2;
    STA.B $14                                                            ;A3D1C6;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3D1C8;
    BCS .hitWall                                                         ;A3D1CC;
    LDA.L $7E7806,X                                                      ;A3D1CE;
    BMI .right                                                           ;A3D1D2;
    LDA.W #$1000                                                         ;A3D1D4;
    EOR.W #$FFFF                                                         ;A3D1D7;
    INC A                                                                ;A3D1DA;
    STA.B $16                                                            ;A3D1DB;
    LDA.W #$0000                                                         ;A3D1DD;
    EOR.W #$FFFF                                                         ;A3D1E0;
    STA.B $18                                                            ;A3D1E3;
    BRA +                                                                ;A3D1E5;


.right:
    LDA.W #$1000                                                         ;A3D1E7;
    STA.B $16                                                            ;A3D1EA;
    LDA.W #$0000                                                         ;A3D1EC;
    STA.B $18                                                            ;A3D1EF;

  + CLC                                                                  ;A3D1F1;
    LDA.L $7E7804,X                                                      ;A3D1F2;
    ADC.B $16                                                            ;A3D1F6;
    STA.L $7E7804,X                                                      ;A3D1F8;
    LDA.L $7E7806,X                                                      ;A3D1FC;
    ADC.B $18                                                            ;A3D200;
    BEQ .gotoXMovementEnd                                                ;A3D202;
    STA.L $7E7806,X                                                      ;A3D204;

.gotoXMovementEnd:
    BRA .XMovementEnd                                                    ;A3D208;


.hitWall:
    LDA.L $7E7804,X                                                      ;A3D20A;
    EOR.W #$FFFF                                                         ;A3D20E;
    INC A                                                                ;A3D211;
    STA.L $7E7804,X                                                      ;A3D212;
    LDA.L $7E7806,X                                                      ;A3D216;
    EOR.W #$FFFF                                                         ;A3D21A;
    INC A                                                                ;A3D21D;
    STA.L $7E7806,X                                                      ;A3D21E;
    LDA.W #$0001                                                         ;A3D222;
    STA.L $7E8000,X                                                      ;A3D225;
    LDA.W #$0070                                                         ;A3D229;
    JSL.L QueueSound_Lib2_Max3                                           ;A3D22C;
    JMP.W .XMovementEnd                                                  ;A3D230; >_<


.XMovementEnd:
    LDA.L $7E7800,X                                                      ;A3D233;
    STA.B $12                                                            ;A3D237;
    LDA.L $7E7802,X                                                      ;A3D239;
    STA.B $14                                                            ;A3D23D;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3D23F;
    BCS .collidedVertically                                              ;A3D243;
    CLC                                                                  ;A3D245;
    LDA.L $7E7800,X                                                      ;A3D246;
    ADC.W #$2000                                                         ;A3D24A;
    STA.L $7E7800,X                                                      ;A3D24D;
    LDA.L $7E7802,X                                                      ;A3D251;
    ADC.W #$0000                                                         ;A3D255;
    CMP.W #$0004                                                         ;A3D258;
    BPL .return                                                          ;A3D25B;
    STA.L $7E7802,X                                                      ;A3D25D;

.return:
    RTL                                                                  ;A3D261;


.collidedVertically:
    LDA.L $7E7802,X                                                      ;A3D262;
    BMI +                                                                ;A3D266;
    CMP.W #$0003                                                         ;A3D268;
    BMI .land                                                            ;A3D26B;

  + LDA.L $7E7800,X                                                      ;A3D26D;
    EOR.W #$FFFF                                                         ;A3D271;
    INC A                                                                ;A3D274;
    STA.L $7E7800,X                                                      ;A3D275;
    LDA.L $7E7802,X                                                      ;A3D279;
    EOR.W #$FFFF                                                         ;A3D27D;
    INC A                                                                ;A3D280;
    STA.L $7E7802,X                                                      ;A3D281;
    LDA.W #$0000                                                         ;A3D285;
    STA.L $7E8000,X                                                      ;A3D288;
    RTL                                                                  ;A3D28C;


.land:
    LDA.W #$0000                                                         ;A3D28D;
    STA.L $7E7806,X                                                      ;A3D290;
    STA.L $7E7804,X                                                      ;A3D294;
    STA.L $7E7802,X                                                      ;A3D298;
    STA.L $7E7800,X                                                      ;A3D29C;
    STA.W EnemyData.work4,X                                              ;A3D2A0;
    STA.L $7E7808,X                                                      ;A3D2A3;
    LDA.W #$0001                                                         ;A3D2A7;
    STA.L $7E780A,X                                                      ;A3D2AA;
    LDA.L $7E7810,X                                                      ;A3D2AE;
    CMP.W #$0003                                                         ;A3D2B2;
    BEQ .dropped                                                         ;A3D2B5;
    LDA.W #$0001                                                         ;A3D2B7;
    STA.L $7E7810,X                                                      ;A3D2BA;
    LDA.W #$0008                                                         ;A3D2BE;
    STA.W EnemyData.initParam0,X                                         ;A3D2C1;
    JSL.L MakeYardFaceSamusHorizontally                                  ;A3D2C4;
    JSR.W SetYardAirborneInstList                                        ;A3D2C8;
    BRA +                                                                ;A3D2CB;


.dropped:
    LDA.W #$0000                                                         ;A3D2CD;
    STA.L $7E7810,X                                                      ;A3D2D0;

  + LDA.W EnemyData.properties,X                                         ;A3D2D4;
    AND.W #$FFFC                                                         ;A3D2D7;
    ORA.W EnemyData.work2,X                                              ;A3D2DA;
    STA.W EnemyData.properties,X                                         ;A3D2DD;
    JSL.L InitAI_Crawlers_Common                                         ;A3D2E0;
    LDA.W #RTL_A3CF5F                                                    ;A3D2E4;
    STA.W EnemyData.work5,X                                              ;A3D2E7;
    LDA.W EnemyData.work3,X                                              ;A3D2EA;
    STA.W EnemyData.pInstList,X                                          ;A3D2ED;
    LDA.W #$0001                                                         ;A3D2F0;
    STA.W EnemyData.instTimer,X                                          ;A3D2F3;
    STZ.W EnemyData.loopCounter,X                                        ;A3D2F6;
    RTL                                                                  ;A3D2F9;


SetYardAirborneInstList:
    LDA.W EnemyData.work2,X                                              ;A3D2FA;
    ASL A                                                                ;A3D2FD;
    ASL A                                                                ;A3D2FE;
    TAY                                                                  ;A3D2FF;
    LDA.W .airbornePointers,Y                                            ;A3D300;
    STA.W EnemyData.pInstList,X                                          ;A3D303;
    LDA.W .hidingPointers,Y                                              ;A3D306;
    STA.W EnemyData.work3,X                                              ;A3D309;
    RTS                                                                  ;A3D30C;


.airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0                               ;A3D30D;

.hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft                          ;A3D30F;
    dw InstList_Yard_Airborne_FacingRight_0                              ;A3D311;
    dw InstList_Yard_Hidden_UpsideUp_MovingRight                         ;A3D313;

UNUSED_MakeYardFaceSamus_A3D315:
    LDA.L $7E780A,X                                                      ;A3D315;
    BEQ .turningEnabled                                                  ;A3D319;
    CLC                                                                  ;A3D31B;
    RTL                                                                  ;A3D31C;


.turningEnabled:
    LDA.L $7E780E,X                                                      ;A3D31D;
    CMP.W #$0004                                                         ;A3D321;
    BCS MakeYardFaceSamusHorizontally                                    ;A3D324;
    BIT.W #$0001                                                         ;A3D326;
    BNE .movingDown                                                      ;A3D329;
    LDA.W EnemyData.yPosition,X                                          ;A3D32B;
    CMP.W $0AFA                                                          ;A3D32E;
    BCC TurnYardAround                                                   ;A3D331;
    CLC                                                                  ;A3D333;
    RTL                                                                  ;A3D334;


.movingDown:
    LDA.W EnemyData.yPosition,X                                          ;A3D335;
    CMP.W $0AFA                                                          ;A3D338;
    BCS TurnYardAround                                                   ;A3D33B;
    RTL                                                                  ;A3D33D;


MakeYardFaceSamusHorizontally:
    LDA.W EnemyData.work2,X                                              ;A3D33E;
    BNE .facingRight                                                     ;A3D341;
    LDA.W EnemyData.xPosition,X                                          ;A3D343;
    CMP.W $0AF6                                                          ;A3D346;
    BCC TurnYardAround                                                   ;A3D349;
    CLC                                                                  ;A3D34B;
    RTL                                                                  ;A3D34C;


.facingRight:
    LDA.W EnemyData.xPosition,X                                          ;A3D34D;
    CMP.W $0AF6                                                          ;A3D350;
    BCS TurnYardAround                                                   ;A3D353;
    RTL                                                                  ;A3D355;


TurnYardAround:
    LDA.L $7E7810,X                                                      ;A3D356;
    CMP.W #$0002                                                         ;A3D35A;
    BEQ .failed                                                          ;A3D35D;
    LDA.W EnemyData.work5,X                                              ;A3D35F;
    CMP.W #RTL_A3CF5F                                                    ;A3D362;
    BEQ .failed                                                          ;A3D365;
    LDA.L $7E780E,X                                                      ;A3D367;
    ASL A                                                                ;A3D36B;
    TAY                                                                  ;A3D36C;
    LDA.W YardOppositeDirection,Y                                        ;A3D36D;
    STA.L $7E780E,X                                                      ;A3D370;
    ASL A                                                                ;A3D374;
    ASL A                                                                ;A3D375;
    ASL A                                                                ;A3D376;
    TAY                                                                  ;A3D377;
    LDA.W YardDirectionData_crawlingInstList,Y                           ;A3D378;
    STA.W EnemyData.pInstList,X                                          ;A3D37B;
    LDA.W EnemyData.properties,X                                         ;A3D37E;
    AND.W #$FFFC                                                         ;A3D381;
    ORA.W YardDirectionData_movementDirection,Y                          ;A3D384;
    STA.W EnemyData.properties,X                                         ;A3D387;
    LDA.W YardDirectionData_hidingInstList,Y                             ;A3D38A;
    STA.W EnemyData.work3,X                                              ;A3D38D;
    LDA.W YardDirectionData_airborneFacingDirection,Y                    ;A3D390;
    STA.W EnemyData.work2,X                                              ;A3D393;
    JSL.L SetYardCrawlingVelocities                                      ;A3D396;
    JSL.L SetYardCrawlingMovementFunction                                ;A3D39A;
    LDA.W #$0001                                                         ;A3D39E;
    STA.L $7E780A,X                                                      ;A3D3A1;
    LDA.W #$0000                                                         ;A3D3A5;
    STA.L $7E7808,X                                                      ;A3D3A8;
    SEC                                                                  ;A3D3AC;
    RTL                                                                  ;A3D3AD;


.failed:
    CLC                                                                  ;A3D3AE;
    RTL                                                                  ;A3D3AF;


EnemyTouch_Yard:
    LDX.W $0E54                                                          ;A3D3B0;
    LDA.L $7E7810,X                                                      ;A3D3B3;
    CMP.W #$0001                                                         ;A3D3B7;
    BNE .notAggressiveCrawling                                           ;A3D3BA;
    LDA.W EnemyData.work5,X                                              ;A3D3BC;
    CMP.W #RTL_A3CF5F                                                    ;A3D3BF;
    BEQ .notAggressiveCrawling                                           ;A3D3C2;
    JSR.W CheckIfSamusIsDirectingTowardsYard                             ;A3D3C4;
    BCC .notAggressiveCrawling                                           ;A3D3C7;
    BRA .notKicked                                                       ;A3D3C9;


.notAggressiveCrawling:
    LDA.W EnemyData.work5,X                                              ;A3D3CB;
    CMP.W #Function_Yard_Movement_Airborne                               ;A3D3CE;
    BEQ .kicked                                                          ;A3D3D1;
    LDA.W $0B3C                                                          ;A3D3D3;
    BEQ .notKicked                                                       ;A3D3D6;

.kicked:
    JSR.W KickYardIntoAIr                                                ;A3D3D8;
    LDA.W EnemyData.work5,X                                              ;A3D3DB;
    CMP.W #Function_Yard_Movement_Airborne                               ;A3D3DE;
    BNE .returnUpper                                                     ;A3D3E1;
    LDA.W #$0070                                                         ;A3D3E3;
    JSL.L QueueSound_Lib2_Max3                                           ;A3D3E6;

.returnUpper:
    RTL                                                                  ;A3D3EA;


.notKicked:
    LDA.W EnemyData.work5,X                                              ;A3D3EB;
    CMP.W #RTL_A3CF5F                                                    ;A3D3EE;
    BEQ .returnLower                                                     ;A3D3F1;
    LDA.L $7E7810,X                                                      ;A3D3F3;
    CMP.W #$0004                                                         ;A3D3F7;
    BEQ .returnLower                                                     ;A3D3FA;
    CMP.W #$0003                                                         ;A3D3FC;
    BEQ .returnLower                                                     ;A3D3FF;
    JSL.L CommonA3_NormalEnemyTouchAI                                    ;A3D401;
    LDA.L $7E780C,X                                                      ;A3D405;
    STA.W EnemyData.initParam0,X                                         ;A3D409;
    LDA.L $7E7810,X                                                      ;A3D40C;
    CMP.W #$0000                                                         ;A3D410;
    BEQ .setIdleCrawling                                                 ;A3D413;
    JSL.L TurnYardAround                                                 ;A3D415;

.setIdleCrawling:
    LDA.W #$0000                                                         ;A3D419;
    STA.L $7E7810,X                                                      ;A3D41C;

.returnLower:
    RTL                                                                  ;A3D420;


CheckIfSamusIsDirectingTowardsYard:
    LDA.B $8B                                                            ;A3D421;
    AND.W #$0300                                                         ;A3D423;
    XBA                                                                  ;A3D426;
    DEC A                                                                ;A3D427;
    STA.B $12                                                            ;A3D428;
    LDA.W EnemyData.work2,X                                              ;A3D42A;
    AND.W #$0001                                                         ;A3D42D;
    STA.B $14                                                            ;A3D430;
    LDA.B $12                                                            ;A3D432;
    BNE .notPressingRight                                                ;A3D434;
    LDA.B $14                                                            ;A3D436;
    BEQ .towardsYard                                                     ;A3D438;
    BRA .awayFromYard                                                    ;A3D43A;


.notPressingRight:
    LDA.B $14                                                            ;A3D43C;
    BEQ .awayFromYard                                                    ;A3D43E;
    BRA .towardsYard                                                     ;A3D440;


.awayFromYard:
    CLC                                                                  ;A3D442;
    RTS                                                                  ;A3D443;


.towardsYard:
    SEC                                                                  ;A3D444;
    RTS                                                                  ;A3D445;


UNUSED_CheckIfYardIsMovingTheDirectionSamusIsFacing_A3D446:
    LDA.W EnemyData.work0,X                                              ;A3D446;
    BPL .positiveXVelocity                                               ;A3D449;
    LDA.W $0A1E                                                          ;A3D44B;
    AND.W #$00FF                                                         ;A3D44E;
    CMP.W #$0008                                                         ;A3D451;
    BNE .movingDirectionSamusFacing                                      ;A3D454;
    BRA .movingOppositeDirection                                         ;A3D456;


.positiveXVelocity:
    LDA.W $0A1E                                                          ;A3D458;
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


EnemyShot_Yard:
    LDX.W $0E54                                                          ;A3D469;
    LDA.W $18A6                                                          ;A3D46C;
    ASL A                                                                ;A3D46F;
    TAY                                                                  ;A3D470;
    LDA.W $0C18,Y                                                        ;A3D471;
    AND.W #$FF00                                                         ;A3D474;
    CMP.W #$0300                                                         ;A3D477;
    BEQ .normalShotAI                                                    ;A3D47A;
    CMP.W #$0500                                                         ;A3D47C;
    BNE .shot                                                            ;A3D47F;

.normalShotAI:
    JSL.L CommonA3_NormalEnemyShotAI                                     ;A3D481;
    RTL                                                                  ;A3D485;


.shot:
    LDA.L $7E7810,X                                                      ;A3D486;
    CMP.W #$0003                                                         ;A3D48A;
    BEQ .playSFX                                                         ;A3D48D;
    CMP.W #$0004                                                         ;A3D48F;
    BEQ .playSFX                                                         ;A3D492;
    JSR.W ShootYardIntoAir                                               ;A3D494;

.playSFX:
    LDA.W #$0070                                                         ;A3D497;
    JSL.L QueueSound_Lib2_Max3                                           ;A3D49A;
    RTL                                                                  ;A3D49E;


KickYardIntoAIr:
    LDA.W #$0004                                                         ;A3D49F;
    STA.L $7E7810,X                                                      ;A3D4A2;
    LDA.W #Function_Yard_Movement_Airborne                               ;A3D4A6;
    STA.W EnemyData.work5,X                                              ;A3D4A9;
    LDA.W EnemyData.work2,X                                              ;A3D4AC;
    ASL A                                                                ;A3D4AF;
    ASL A                                                                ;A3D4B0;
    TAY                                                                  ;A3D4B1;
    LDA.W .airbornePointers,Y                                            ;A3D4B2;
    STA.W EnemyData.pInstList,X                                          ;A3D4B5;
    LDA.W .hidingPointers,Y                                              ;A3D4B8;
    STA.W EnemyData.work3,X                                              ;A3D4BB;
    LDA.W #$0001                                                         ;A3D4BE;
    STA.W EnemyData.instTimer,X                                          ;A3D4C1;
    STZ.W EnemyData.loopCounter,X                                        ;A3D4C4;
    LDA.W $0DA4                                                          ;A3D4C7;
    STA.L $7E7804,X                                                      ;A3D4CA;
    LDA.W $0DA2                                                          ;A3D4CE;
    STA.L $7E7806,X                                                      ;A3D4D1;
    CMP.W #$0010                                                         ;A3D4D5;
    BCC +                                                                ;A3D4D8;
    LDA.W #$000F                                                         ;A3D4DA;

  + ASL A                                                                ;A3D4DD;
    ASL A                                                                ;A3D4DE;
    TAY                                                                  ;A3D4DF;
    LDA.W .YSubVelocity,Y                                                ;A3D4E0;
    STA.L $7E7800,X                                                      ;A3D4E3;
    LDA.W .YVelocity,Y                                                   ;A3D4E7;
    STA.L $7E7802,X                                                      ;A3D4EA;
    LDA.W $0A1E                                                          ;A3D4EE;
    BIT.W #$0004                                                         ;A3D4F1;
    BEQ .return                                                          ;A3D4F4;
    LDA.L $7E7804,X                                                      ;A3D4F6;
    EOR.W #$FFFF                                                         ;A3D4FA;
    INC A                                                                ;A3D4FD;
    STA.L $7E7804,X                                                      ;A3D4FE;
    LDA.L $7E7806,X                                                      ;A3D502;
    EOR.W #$FFFF                                                         ;A3D506;
    INC A                                                                ;A3D509;
    STA.L $7E7806,X                                                      ;A3D50A;

.return:
    RTS                                                                  ;A3D50E;


.airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0                               ;A3D50F;

.hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft                          ;A3D511;
    dw InstList_Yard_Airborne_FacingRight_0                              ;A3D513;
    dw InstList_Yard_Hidden_UpsideUp_MovingRight                         ;A3D515;

.YSubVelocity:
    dw $0000                                                             ;A3D517;

.YVelocity:
    dw $FFFD,$A000,$FFFD,$4000,$FFFD,$0000,$FFFC,$A000                   ;A3D519;
    dw $FFFC,$4000,$FFFC,$0000,$FFFB,$A000,$FFFB,$4000                   ;A3D529;
    dw $FFFB,$0000,$FFFA,$A000,$FFFA,$4000,$FFFA,$0000                   ;A3D539;
    dw $FFF9,$A000,$FFF9,$4000,$FFF9,$0000,$FFF8                         ;A3D549;

ShootYardIntoAir:
    PHY                                                                  ;A3D557;
    LDA.W #$0005                                                         ;A3D558;
    STA.L $7E7810,X                                                      ;A3D55B;
    LDA.W #Function_Yard_Movement_Airborne                               ;A3D55F;
    STA.W EnemyData.work5,X                                              ;A3D562;
    LDA.W EnemyData.work2,X                                              ;A3D565;
    ASL A                                                                ;A3D568;
    ASL A                                                                ;A3D569;
    TAY                                                                  ;A3D56A;
    LDA.W .airbornePointers,Y                                            ;A3D56B;
    STA.W EnemyData.pInstList,X                                          ;A3D56E;
    LDA.W .hidingPointers,Y                                              ;A3D571;
    STA.W EnemyData.work3,X                                              ;A3D574;
    LDA.W #$0001                                                         ;A3D577;
    STA.W EnemyData.instTimer,X                                          ;A3D57A;
    STZ.W EnemyData.loopCounter,X                                        ;A3D57D;
    LDA.W #$FFFF                                                         ;A3D580;
    STA.L $7E7802,X                                                      ;A3D583;
    LDA.W $0A1E                                                          ;A3D587;
    AND.W #$00FF                                                         ;A3D58A;
    CMP.W #$0004                                                         ;A3D58D;
    BNE .SamusFacingRight                                                ;A3D590;
    LDA.W #$FFFF                                                         ;A3D592;
    STA.L $7E7806,X                                                      ;A3D595;
    BRA .return                                                          ;A3D599;


.SamusFacingRight:
    LDA.W #$0001                                                         ;A3D59B;
    STA.L $7E7806,X                                                      ;A3D59E;

.return:
    PLY                                                                  ;A3D5A2;
    RTS                                                                  ;A3D5A3;


.airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0                               ;A3D5A4;

.hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft                          ;A3D5A6;
    dw InstList_Yard_Airborne_FacingRight_0                              ;A3D5A8;
    dw InstList_Yard_Hidden_UpsideUp_MovingRight                         ;A3D5AA;

Spritemap_Yard_0:
    dw $0002,$C3FB                                                       ;A3D5AC;
    db $F6                                                               ;A3D5B0;
    dw $2120,$C3F5                                                       ;A3D5B1;
    db $F8                                                               ;A3D5B5;
    dw $2100                                                             ;A3D5B6;

Spritemap_Yard_1:
    dw $0002,$C3FC                                                       ;A3D5B8;
    db $F6                                                               ;A3D5BC;
    dw $2120,$C3F4                                                       ;A3D5BD;
    db $F8                                                               ;A3D5C1;
    dw $2102                                                             ;A3D5C2;

Spritemap_Yard_2:
    dw $0002,$C3FB                                                       ;A3D5C4;
    db $F5                                                               ;A3D5C8;
    dw $2120,$C3F5                                                       ;A3D5C9;
    db $F8                                                               ;A3D5CD;
    dw $2104                                                             ;A3D5CE;

Spritemap_Yard_3:
    dw $0002,$C3F9                                                       ;A3D5D0;
    db $F6                                                               ;A3D5D4;
    dw $2120,$C3F4                                                       ;A3D5D5;
    db $FE                                                               ;A3D5D9;
    dw $2106                                                             ;A3D5DA;

Spritemap_Yard_4:
    dw $0002,$C3F2                                                       ;A3D5DC;
    db $F6                                                               ;A3D5E0;
    dw $2122,$C3F0                                                       ;A3D5E1;
    db $01                                                               ;A3D5E5;
    dw $2108                                                             ;A3D5E6;

Spritemap_Yard_5:
    dw $0002,$C3EE                                                       ;A3D5E8;
    db $F8                                                               ;A3D5EC;
    dw $2124,$C3F0                                                       ;A3D5ED;
    db $00                                                               ;A3D5F1;
    dw $2108                                                             ;A3D5F2;

Spritemap_Yard_6:
    dw $0002,$C3F6                                                       ;A3D5F4;
    db $F5                                                               ;A3D5F8;
    dw $2124,$C3F8                                                       ;A3D5F9;
    db $FB                                                               ;A3D5FD;
    dw $2108                                                             ;A3D5FE;

Spritemap_Yard_7:
    dw $0002,$C3F6                                                       ;A3D600;
    db $F4                                                               ;A3D604;
    dw $2124,$C3F8                                                       ;A3D605;
    db $FC                                                               ;A3D609;
    dw $210A                                                             ;A3D60A;

Spritemap_Yard_8:
    dw $0002,$C3F5                                                       ;A3D60C;
    db $F5                                                               ;A3D610;
    dw $2124,$C3F8                                                       ;A3D611;
    db $FB                                                               ;A3D615;
    dw $210C                                                             ;A3D616;

Spritemap_Yard_9:
    dw $0002,$C3F6                                                       ;A3D618;
    db $F7                                                               ;A3D61C;
    dw $2124,$C3FE                                                       ;A3D61D;
    db $FC                                                               ;A3D621;
    dw $210E                                                             ;A3D622;

Spritemap_Yard_A:
    dw $0002,$C3F6                                                       ;A3D624;
    db $FE                                                               ;A3D628;
    dw $2126,$C201                                                       ;A3D629;
    db $00                                                               ;A3D62D;
    dw $E100                                                             ;A3D62E;

Spritemap_Yard_B:
    dw $0002,$C3F8                                                       ;A3D630;
    db $02                                                               ;A3D634;
    dw $E120,$C200                                                       ;A3D635;
    db $00                                                               ;A3D639;
    dw $E100                                                             ;A3D63A;

Spritemap_Yard_C:
    dw $0002,$C3F5                                                       ;A3D63C;
    db $FA                                                               ;A3D640;
    dw $E120,$C3FB                                                       ;A3D641;
    db $F8                                                               ;A3D645;
    dw $E100                                                             ;A3D646;

Spritemap_Yard_D:
    dw $0002,$C3F4                                                       ;A3D648;
    db $FA                                                               ;A3D64C;
    dw $E120,$C3FC                                                       ;A3D64D;
    db $F8                                                               ;A3D651;
    dw $E102                                                             ;A3D652;

Spritemap_Yard_E:
    dw $0002,$C3F5                                                       ;A3D654;
    db $FB                                                               ;A3D658;
    dw $E120,$C3FB                                                       ;A3D659;
    db $F8                                                               ;A3D65D;
    dw $E104                                                             ;A3D65E;

Spritemap_Yard_F:
    dw $0002,$C3F7                                                       ;A3D660;
    db $FA                                                               ;A3D664;
    dw $E120,$C3FC                                                       ;A3D665;
    db $F2                                                               ;A3D669;
    dw $E106                                                             ;A3D66A;

Spritemap_Yard_10:
    dw $0002,$C3FE                                                       ;A3D66C;
    db $FA                                                               ;A3D670;
    dw $E122,$C200                                                       ;A3D671;
    db $EF                                                               ;A3D675;
    dw $E108                                                             ;A3D676;

Spritemap_Yard_11:
    dw $0002,$C202                                                       ;A3D678;
    db $F8                                                               ;A3D67C;
    dw $E124,$C200                                                       ;A3D67D;
    db $F0                                                               ;A3D681;
    dw $E108                                                             ;A3D682;

Spritemap_Yard_12:
    dw $0002,$C3FA                                                       ;A3D684;
    db $FB                                                               ;A3D688;
    dw $E124,$C3F8                                                       ;A3D689;
    db $F5                                                               ;A3D68D;
    dw $E108                                                             ;A3D68E;

Spritemap_Yard_13:
    dw $0002,$C3FA                                                       ;A3D690;
    db $FC                                                               ;A3D694;
    dw $E124,$C3F8                                                       ;A3D695;
    db $F4                                                               ;A3D699;
    dw $E10A                                                             ;A3D69A;

Spritemap_Yard_14:
    dw $0002,$C3FB                                                       ;A3D69C;
    db $FB                                                               ;A3D6A0;
    dw $E124,$C3F8                                                       ;A3D6A1;
    db $F5                                                               ;A3D6A5;
    dw $E10C                                                             ;A3D6A6;

Spritemap_Yard_15:
    dw $0002,$C3FA                                                       ;A3D6A8;
    db $F9                                                               ;A3D6AC;
    dw $E124,$C3F2                                                       ;A3D6AD;
    db $F4                                                               ;A3D6B1;
    dw $E10E                                                             ;A3D6B2;

Spritemap_Yard_16:
    dw $0002,$C3FA                                                       ;A3D6B4;
    db $F2                                                               ;A3D6B8;
    dw $E126,$C3EF                                                       ;A3D6B9;
    db $F0                                                               ;A3D6BD;
    dw $2100                                                             ;A3D6BE;

Spritemap_Yard_17:
    dw $0002,$C3F8                                                       ;A3D6C0;
    db $EE                                                               ;A3D6C4;
    dw $2120,$C3F0                                                       ;A3D6C5;
    db $F0                                                               ;A3D6C9;
    dw $2100                                                             ;A3D6CA;

Spritemap_Yard_18:
    dw $0002,$C3FB                                                       ;A3D6CC;
    db $F7                                                               ;A3D6D0;
    dw $2120,$C3F9                                                       ;A3D6D1;
    db $F8                                                               ;A3D6D5;
    dw $2100                                                             ;A3D6D6;

Spritemap_Yard_19:
    dw $0001,$C3F8                                                       ;A3D6D8;
    db $F8                                                               ;A3D6DC;
    dw $2122                                                             ;A3D6DD;

Spritemap_Yard_1A:
    dw $0002,$C3F7                                                       ;A3D6DF;
    db $F6                                                               ;A3D6E3;
    dw $2124,$C3F8                                                       ;A3D6E4;
    db $F8                                                               ;A3D6E8;
    dw $2108                                                             ;A3D6E9;

Spritemap_Yard_1B:
    dw $0001,$C3F8                                                       ;A3D6EB;
    db $F8                                                               ;A3D6EF;
    dw $2126                                                             ;A3D6F0;

Spritemap_Yard_1C:
    dw $0002,$C3F6                                                       ;A3D6F2;
    db $F9                                                               ;A3D6F6;
    dw $E120,$C3F8                                                       ;A3D6F7;
    db $F8                                                               ;A3D6FB;
    dw $E100                                                             ;A3D6FC;

Spritemap_Yard_1D:
    dw $0001,$C3F8                                                       ;A3D6FE;
    db $F8                                                               ;A3D702;
    dw $E122                                                             ;A3D703;

Spritemap_Yard_1E:
    dw $0002,$C3F9                                                       ;A3D705;
    db $FA                                                               ;A3D709;
    dw $6124,$C3F8                                                       ;A3D70A;
    db $F8                                                               ;A3D70E;
    dw $E108                                                             ;A3D70F;

Spritemap_Yard_1F:
    dw $0001,$C3F8                                                       ;A3D711;
    db $F8                                                               ;A3D715;
    dw $E126                                                             ;A3D716;

Spritemap_Yard_20:
    dw $0002,$C3F5                                                       ;A3D718;
    db $F6                                                               ;A3D71C;
    dw $6120,$C3FB                                                       ;A3D71D;
    db $F8                                                               ;A3D721;
    dw $6100                                                             ;A3D722;

Spritemap_Yard_21:
    dw $0002,$C3F4                                                       ;A3D724;
    db $F6                                                               ;A3D728;
    dw $6120,$C3FC                                                       ;A3D729;
    db $F8                                                               ;A3D72D;
    dw $6102                                                             ;A3D72E;

Spritemap_Yard_22:
    dw $0002,$C3F5                                                       ;A3D730;
    db $F5                                                               ;A3D734;
    dw $6120,$C3FB                                                       ;A3D735;
    db $F8                                                               ;A3D739;
    dw $6104                                                             ;A3D73A;

Spritemap_Yard_23:
    dw $0002,$C3F7                                                       ;A3D73C;
    db $F6                                                               ;A3D740;
    dw $6120,$C3FC                                                       ;A3D741;
    db $FE                                                               ;A3D745;
    dw $6106                                                             ;A3D746;

Spritemap_Yard_24:
    dw $0002,$C3FE                                                       ;A3D748;
    db $F6                                                               ;A3D74C;
    dw $6122,$C200                                                       ;A3D74D;
    db $01                                                               ;A3D751;
    dw $6108                                                             ;A3D752;

Spritemap_Yard_25:
    dw $0002,$C202                                                       ;A3D754;
    db $F8                                                               ;A3D758;
    dw $6124,$C200                                                       ;A3D759;
    db $00                                                               ;A3D75D;
    dw $6108                                                             ;A3D75E;

Spritemap_Yard_26:
    dw $0002,$C3FA                                                       ;A3D760;
    db $F5                                                               ;A3D764;
    dw $6124,$C3F8                                                       ;A3D765;
    db $FB                                                               ;A3D769;
    dw $6108                                                             ;A3D76A;

Spritemap_Yard_27:
    dw $0002,$C3FA                                                       ;A3D76C;
    db $F4                                                               ;A3D770;
    dw $6124,$C3F8                                                       ;A3D771;
    db $FC                                                               ;A3D775;
    dw $610A                                                             ;A3D776;

Spritemap_Yard_28:
    dw $0002,$C3FB                                                       ;A3D778;
    db $F5                                                               ;A3D77C;
    dw $6124,$C3F8                                                       ;A3D77D;
    db $FB                                                               ;A3D781;
    dw $610C                                                             ;A3D782;

Spritemap_Yard_29:
    dw $0002,$C3FA                                                       ;A3D784;
    db $F7                                                               ;A3D788;
    dw $6124,$C3F2                                                       ;A3D789;
    db $FC                                                               ;A3D78D;
    dw $610E                                                             ;A3D78E;

Spritemap_Yard_2A:
    dw $0002,$C3FA                                                       ;A3D790;
    db $FE                                                               ;A3D794;
    dw $6126,$C3EF                                                       ;A3D795;
    db $00                                                               ;A3D799;
    dw $A100                                                             ;A3D79A;

Spritemap_Yard_2B:
    dw $0002,$C3F8                                                       ;A3D79C;
    db $02                                                               ;A3D7A0;
    dw $A120,$C3F0                                                       ;A3D7A1;
    db $00                                                               ;A3D7A5;
    dw $A100                                                             ;A3D7A6;

Spritemap_Yard_2C:
    dw $0002,$C3FB                                                       ;A3D7A8;
    db $FA                                                               ;A3D7AC;
    dw $A120,$C3F5                                                       ;A3D7AD;
    db $F8                                                               ;A3D7B1;
    dw $A100                                                             ;A3D7B2;

Spritemap_Yard_2D:
    dw $0002,$C3FC                                                       ;A3D7B4;
    db $FA                                                               ;A3D7B8;
    dw $A120,$C3F4                                                       ;A3D7B9;
    db $F8                                                               ;A3D7BD;
    dw $A102                                                             ;A3D7BE;

Spritemap_Yard_2E:
    dw $0002,$C3FB                                                       ;A3D7C0;
    db $FB                                                               ;A3D7C4;
    dw $A120,$C3F5                                                       ;A3D7C5;
    db $F8                                                               ;A3D7C9;
    dw $A104                                                             ;A3D7CA;

Spritemap_Yard_2F:
    dw $0002,$C3F9                                                       ;A3D7CC;
    db $FA                                                               ;A3D7D0;
    dw $A120,$C3F4                                                       ;A3D7D1;
    db $F2                                                               ;A3D7D5;
    dw $A106                                                             ;A3D7D6;

Spritemap_Yard_30:
    dw $0002,$C3F2                                                       ;A3D7D8;
    db $FA                                                               ;A3D7DC;
    dw $A122,$C3F0                                                       ;A3D7DD;
    db $EF                                                               ;A3D7E1;
    dw $A108                                                             ;A3D7E2;

Spritemap_Yard_31:
    dw $0002,$C3EE                                                       ;A3D7E4;
    db $F8                                                               ;A3D7E8;
    dw $A124,$C3F0                                                       ;A3D7E9;
    db $F0                                                               ;A3D7ED;
    dw $A108                                                             ;A3D7EE;

Spritemap_Yard_32:
    dw $0002,$C3F6                                                       ;A3D7F0;
    db $FB                                                               ;A3D7F4;
    dw $A124,$C3F8                                                       ;A3D7F5;
    db $F5                                                               ;A3D7F9;
    dw $A108                                                             ;A3D7FA;

Spritemap_Yard_33:
    dw $0002,$C3F6                                                       ;A3D7FC;
    db $FC                                                               ;A3D800;
    dw $A124,$C3F8                                                       ;A3D801;
    db $F4                                                               ;A3D805;
    dw $A10A                                                             ;A3D806;

Spritemap_Yard_34:
    dw $0002,$C3F5                                                       ;A3D808;
    db $FB                                                               ;A3D80C;
    dw $A124,$C3F8                                                       ;A3D80D;
    db $F5                                                               ;A3D811;
    dw $A10C                                                             ;A3D812;

Spritemap_Yard_35:
    dw $0002,$C3F7                                                       ;A3D814;
    db $F9                                                               ;A3D818;
    dw $A124,$C3FF                                                       ;A3D819;
    db $F4                                                               ;A3D81D;
    dw $A10E                                                             ;A3D81E;

Spritemap_Yard_36:
    dw $0002,$C3F6                                                       ;A3D820;
    db $F2                                                               ;A3D824;
    dw $A126,$C201                                                       ;A3D825;
    db $F0                                                               ;A3D829;
    dw $6100                                                             ;A3D82A;

Spritemap_Yard_37:
    dw $0002,$C3F8                                                       ;A3D82C;
    db $EE                                                               ;A3D830;
    dw $6120,$C200                                                       ;A3D831;
    db $F0                                                               ;A3D835;
    dw $6100                                                             ;A3D836;

Spritemap_Yard_38:
    dw $0002,$C3F5                                                       ;A3D838;
    db $F7                                                               ;A3D83C;
    dw $6120,$C3F7                                                       ;A3D83D;
    db $F8                                                               ;A3D841;
    dw $6100                                                             ;A3D842;

Spritemap_Yard_39:
    dw $0001,$C3F8                                                       ;A3D844;
    db $F8                                                               ;A3D848;
    dw $6122                                                             ;A3D849;

Spritemap_Yard_3A:
    dw $0002,$C3F9                                                       ;A3D84B;
    db $F6                                                               ;A3D84F;
    dw $6124,$C3F8                                                       ;A3D850;
    db $F8                                                               ;A3D854;
    dw $6108                                                             ;A3D855;

Spritemap_Yard_3B:
    dw $0001,$C3F8                                                       ;A3D857;
    db $F8                                                               ;A3D85B;
    dw $6126                                                             ;A3D85C;

Spritemap_Yard_3C:
    dw $0002,$C3FA                                                       ;A3D85E;
    db $F9                                                               ;A3D862;
    dw $A120,$C3F8                                                       ;A3D863;
    db $F8                                                               ;A3D867;
    dw $A100                                                             ;A3D868;

Spritemap_Yard_3D:
    dw $0001,$C3F8                                                       ;A3D86A;
    db $F8                                                               ;A3D86E;
    dw $A122                                                             ;A3D86F;

Spritemap_Yard_3E:
    dw $0002,$C3F7                                                       ;A3D871;
    db $FA                                                               ;A3D875;
    dw $A124,$C3F8                                                       ;A3D876;
    db $F8                                                               ;A3D87A;
    dw $A108                                                             ;A3D87B;

Spritemap_Yard_3F:
    dw $0001,$C3F8                                                       ;A3D87D;
    db $F8                                                               ;A3D881;
    dw $A126                                                             ;A3D882;

UNUSED_Spritemap_Yard_A3D884:
    dw $0002,$C3FB                                                       ;A3D884;
    db $F6                                                               ;A3D888;
    dw $2120,$C3F5                                                       ;A3D889;
    db $F8                                                               ;A3D88D;
    dw $2100                                                             ;A3D88E;

Spritemap_Yard_40:
    dw $0002,$C3F5                                                       ;A3D890;
    db $F8                                                               ;A3D894;
    dw $2128,$C3FB                                                       ;A3D895;
    db $F7                                                               ;A3D899;
    dw $2120                                                             ;A3D89A;

Spritemap_Yard_41:
    dw $0002,$C3FA                                                       ;A3D89C;
    db $FA                                                               ;A3D8A0;
    dw $E126,$C3F8                                                       ;A3D8A1;
    db $F7                                                               ;A3D8A5;
    dw $E108                                                             ;A3D8A6;

Spritemap_Yard_42:
    dw $0002,$C3FA                                                       ;A3D8A8;
    db $FA                                                               ;A3D8AC;
    dw $E124,$C3F8                                                       ;A3D8AD;
    db $F6                                                               ;A3D8B1;
    dw $E108                                                             ;A3D8B2;

UNUSED_Spritemap_Yard_A3D8B4:
    dw $0002,$C3FA                                                       ;A3D8B4;
    db $FB                                                               ;A3D8B8;
    dw $E124,$C3F8                                                       ;A3D8B9;
    db $F5                                                               ;A3D8BD;
    dw $E108                                                             ;A3D8BE;

Spritemap_Yard_43:
    dw $0002,$C3F8                                                       ;A3D8C0;
    db $F5                                                               ;A3D8C4;
    dw $E12A,$C3F9                                                       ;A3D8C5;
    db $FB                                                               ;A3D8C9;
    dw $E124                                                             ;A3D8CA;

Spritemap_Yard_44:
    dw $0002,$C3F6                                                       ;A3D8CC;
    db $FA                                                               ;A3D8D0;
    dw $2126,$C3F9                                                       ;A3D8D1;
    db $F8                                                               ;A3D8D5;
    dw $E100                                                             ;A3D8D6;

Spritemap_Yard_45:
    dw $0002,$C3F6                                                       ;A3D8D8;
    db $FA                                                               ;A3D8DC;
    dw $E120,$C3FA                                                       ;A3D8DD;
    db $F8                                                               ;A3D8E1;
    dw $E100                                                             ;A3D8E2;

UNUSED_Spritemap_Yard_A3D8E4:
    dw $0002,$C3F5                                                       ;A3D8E4;
    db $FA                                                               ;A3D8E8;
    dw $E120,$C3FB                                                       ;A3D8E9;
    db $F8                                                               ;A3D8ED;
    dw $E100                                                             ;A3D8EE;

Spritemap_Yard_46:
    dw $0002,$C3FB                                                       ;A3D8F0;
    db $F8                                                               ;A3D8F4;
    dw $E128,$C3F5                                                       ;A3D8F5;
    db $F9                                                               ;A3D8F9;
    dw $E120                                                             ;A3D8FA;

Spritemap_Yard_47:
    dw $0002,$C3F6                                                       ;A3D8FC;
    db $F6                                                               ;A3D900;
    dw $2126,$C3F8                                                       ;A3D901;
    db $F9                                                               ;A3D905;
    dw $2108                                                             ;A3D906;

Spritemap_Yard_48:
    dw $0002,$C3F6                                                       ;A3D908;
    db $F6                                                               ;A3D90C;
    dw $2124,$C3F8                                                       ;A3D90D;
    db $FA                                                               ;A3D911;
    dw $2108                                                             ;A3D912;

UNUSED_Spritemap_Yard_A3D914:
    dw $0002,$C3F6                                                       ;A3D914;
    db $F5                                                               ;A3D918;
    dw $2124,$C3F8                                                       ;A3D919;
    db $FB                                                               ;A3D91D;
    dw $2108                                                             ;A3D91E;

Spritemap_Yard_49:
    dw $0002,$C3F8                                                       ;A3D920;
    db $FB                                                               ;A3D924;
    dw $212A,$C3F7                                                       ;A3D925;
    db $F5                                                               ;A3D929;
    dw $2124                                                             ;A3D92A;

Spritemap_Yard_4A:
    dw $0002,$C3FA                                                       ;A3D92C;
    db $F6                                                               ;A3D930;
    dw $2122,$C3F7                                                       ;A3D931;
    db $F8                                                               ;A3D935;
    dw $2100                                                             ;A3D936;

Spritemap_Yard_4B:
    dw $0002,$C3FB                                                       ;A3D938;
    db $F6                                                               ;A3D93C;
    dw $2120,$C3F7                                                       ;A3D93D;
    db $F8                                                               ;A3D941;
    dw $2100                                                             ;A3D942;

Spritemap_Yard_4C:
    dw $0001,$C3F8                                                       ;A3D944;
    db $F8                                                               ;A3D948;
    dw $2122                                                             ;A3D949;

Spritemap_Yard_4D:
    dw $0002,$C3F8                                                       ;A3D94B;
    db $F7                                                               ;A3D94F;
    dw $2120,$C3F6                                                       ;A3D950;
    db $F8                                                               ;A3D954;
    dw $2100                                                             ;A3D955;

Spritemap_Yard_4E:
    dw $0001,$C3F8                                                       ;A3D957;
    db $F8                                                               ;A3D95B;
    dw $E126                                                             ;A3D95C;

Spritemap_Yard_4F:
    dw $0002,$C3F9                                                       ;A3D95E;
    db $F8                                                               ;A3D962;
    dw $E124,$C3F8                                                       ;A3D963;
    db $F6                                                               ;A3D967;
    dw $E108                                                             ;A3D968;

Spritemap_Yard_50:
    dw $0001,$C3F8                                                       ;A3D96A;
    db $F8                                                               ;A3D96E;
    dw $E122                                                             ;A3D96F;

Spritemap_Yard_51:
    dw $0002,$C3F8                                                       ;A3D971;
    db $F9                                                               ;A3D975;
    dw $E120,$C3FA                                                       ;A3D976;
    db $F8                                                               ;A3D97A;
    dw $E100                                                             ;A3D97B;

Spritemap_Yard_52:
    dw $0001,$C3F8                                                       ;A3D97D;
    db $F8                                                               ;A3D981;
    dw $2126                                                             ;A3D982;

Spritemap_Yard_53:
    dw $0002,$C3F7                                                       ;A3D984;
    db $F8                                                               ;A3D988;
    dw $2124,$C3F8                                                       ;A3D989;
    db $FA                                                               ;A3D98D;
    dw $2108                                                             ;A3D98E;

UNUSED_Spritemap_Yard_A3D990:
    dw $0002,$C3F5                                                       ;A3D990;
    db $F6                                                               ;A3D994;
    dw $6120,$C3FB                                                       ;A3D995;
    db $F8                                                               ;A3D999;
    dw $6100                                                             ;A3D99A;

Spritemap_Yard_54:
    dw $0002,$C3FB                                                       ;A3D99C;
    db $F8                                                               ;A3D9A0;
    dw $6128,$C3F5                                                       ;A3D9A1;
    db $F7                                                               ;A3D9A5;
    dw $6120                                                             ;A3D9A6;

Spritemap_Yard_55:
    dw $0002,$C3F6                                                       ;A3D9A8;
    db $FA                                                               ;A3D9AC;
    dw $A126,$C3F8                                                       ;A3D9AD;
    db $F7                                                               ;A3D9B1;
    dw $A108                                                             ;A3D9B2;

Spritemap_Yard_56:
    dw $0002,$C3F6                                                       ;A3D9B4;
    db $FA                                                               ;A3D9B8;
    dw $A124,$C3F8                                                       ;A3D9B9;
    db $F6                                                               ;A3D9BD;
    dw $A108                                                             ;A3D9BE;

UNUSED_Spritemap_Yard_A3D9C0:
    dw $0002,$C3F6                                                       ;A3D9C0;
    db $FB                                                               ;A3D9C4;
    dw $A124,$C3F8                                                       ;A3D9C5;
    db $F5                                                               ;A3D9C9;
    dw $A108                                                             ;A3D9CA;

Spritemap_Yard_57:
    dw $0002,$C3F8                                                       ;A3D9CC;
    db $F5                                                               ;A3D9D0;
    dw $A12A,$C3F7                                                       ;A3D9D1;
    db $FB                                                               ;A3D9D5;
    dw $A124                                                             ;A3D9D6;

Spritemap_Yard_58:
    dw $0002,$C3FA                                                       ;A3D9D8;
    db $FA                                                               ;A3D9DC;
    dw $6126,$C3F7                                                       ;A3D9DD;
    db $F8                                                               ;A3D9E1;
    dw $A100                                                             ;A3D9E2;

Spritemap_Yard_59:
    dw $0002,$C3FA                                                       ;A3D9E4;
    db $FA                                                               ;A3D9E8;
    dw $A120,$C3F6                                                       ;A3D9E9;
    db $F8                                                               ;A3D9ED;
    dw $A100                                                             ;A3D9EE;

UNUSED_Spritemap_Yard_A3D9F0:
    dw $0002,$C3FB                                                       ;A3D9F0;
    db $FA                                                               ;A3D9F4;
    dw $A120,$C3F5                                                       ;A3D9F5;
    db $F8                                                               ;A3D9F9;
    dw $A100                                                             ;A3D9FA;

Spritemap_Yard_5A:
    dw $0002,$C3F5                                                       ;A3D9FC;
    db $F8                                                               ;A3DA00;
    dw $A128,$C3FB                                                       ;A3DA01;
    db $F9                                                               ;A3DA05;
    dw $A120                                                             ;A3DA06;

Spritemap_Yard_5B:
    dw $0002,$C3FA                                                       ;A3DA08;
    db $F6                                                               ;A3DA0C;
    dw $6126,$C3F8                                                       ;A3DA0D;
    db $F9                                                               ;A3DA11;
    dw $6108                                                             ;A3DA12;

Spritemap_Yard_5C:
    dw $0002,$C3FA                                                       ;A3DA14;
    db $F6                                                               ;A3DA18;
    dw $6124,$C3F8                                                       ;A3DA19;
    db $FA                                                               ;A3DA1D;
    dw $6108                                                             ;A3DA1E;

UNUSED_Spritemap_Yard_A3DA20:
    dw $0002,$C3FA                                                       ;A3DA20;
    db $F5                                                               ;A3DA24;
    dw $6124,$C3F8                                                       ;A3DA25;
    db $FB                                                               ;A3DA29;
    dw $6108                                                             ;A3DA2A;

Spritemap_Yard_5D:
    dw $0002,$C3F8                                                       ;A3DA2C;
    db $FB                                                               ;A3DA30;
    dw $612A,$C3F9                                                       ;A3DA31;
    db $F5                                                               ;A3DA35;
    dw $6124                                                             ;A3DA36;

Spritemap_Yard_5E:
    dw $0002,$C3F6                                                       ;A3DA38;
    db $F6                                                               ;A3DA3C;
    dw $6122,$C3F9                                                       ;A3DA3D;
    db $F8                                                               ;A3DA41;
    dw $6100                                                             ;A3DA42;

Spritemap_Yard_5F:
    dw $0002,$C3F5                                                       ;A3DA44;
    db $F6                                                               ;A3DA48;
    dw $6120,$C3F9                                                       ;A3DA49;
    db $F8                                                               ;A3DA4D;
    dw $6100                                                             ;A3DA4E;

Spritemap_Yard_60:
    dw $0001,$C3F8                                                       ;A3DA50;
    db $F8                                                               ;A3DA54;
    dw $6122                                                             ;A3DA55;

Spritemap_Yard_61:
    dw $0002,$C3F8                                                       ;A3DA57;
    db $F7                                                               ;A3DA5B;
    dw $6120,$C3FA                                                       ;A3DA5C;
    db $F8                                                               ;A3DA60;
    dw $6100                                                             ;A3DA61;

Spritemap_Yard_62:
    dw $0001,$C3F8                                                       ;A3DA63;
    db $F8                                                               ;A3DA67;
    dw $A126                                                             ;A3DA68;

Spritemap_Yard_63:
    dw $0002,$C3F7                                                       ;A3DA6A;
    db $F8                                                               ;A3DA6E;
    dw $A124,$C3F8                                                       ;A3DA6F;
    db $F6                                                               ;A3DA73;
    dw $A108                                                             ;A3DA74;

Spritemap_Yard_64:
    dw $0001,$C3F8                                                       ;A3DA76;
    db $F8                                                               ;A3DA7A;
    dw $A122                                                             ;A3DA7B;

Spritemap_Yard_65:
    dw $0002,$C3F8                                                       ;A3DA7D;
    db $F9                                                               ;A3DA81;
    dw $A120,$C3F6                                                       ;A3DA82;
    db $F8                                                               ;A3DA86;
    dw $A100                                                             ;A3DA87;

Spritemap_Yard_66:
    dw $0001,$C3F8                                                       ;A3DA89;
    db $F8                                                               ;A3DA8D;
    dw $6126                                                             ;A3DA8E;

Spritemap_Yard_67:
    dw $0002,$C3F9                                                       ;A3DA90;
    db $F8                                                               ;A3DA94;
    dw $6124,$C3F8                                                       ;A3DA95;
    db $FA                                                               ;A3DA99;
    dw $6108                                                             ;A3DA9A;

Palette_Reflec:
    dw $3800,$7FBD,$5EB5,$1884,$0800,$777B,$5EB5,$45EF                   ;A3DA9C;
    dw $2D29,$241F,$1C17,$142F,$0C47,$06E1,$6BF5,$05A1                   ;A3DAAC;

ReflecPaletteCycleColors:
    dw $241F,$1C17,$142F,$0C47,$211F,$18D8,$10B1,$086A                   ;A3DABC;
    dw $221F,$1999,$1113,$08AD,$1EFF,$163A,$0D95,$04D0                   ;A3DACC;
    dw $1BFF,$12FB,$09F7,$00F3,$1BFF,$12FB,$09F7,$00F3                   ;A3DADC;
    dw $1EFF,$163A,$0D95,$04D0,$221F,$1999,$1113,$08AD                   ;A3DAEC;
    dw $211F,$18D8,$10B1,$086A,$241F,$1C17,$142F,$0C47                   ;A3DAFC;

EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes:
    LDA.W $0797                                                          ;A3DB0C;
    BNE .return                                                          ;A3DB0F;
    LDA.W $1798                                                          ;A3DB11;
    DEC A                                                                ;A3DB14;
    STA.W $1798                                                          ;A3DB15;
    BNE .return                                                          ;A3DB18;
    LDA.W #$0010                                                         ;A3DB1A;
    STA.W $1798                                                          ;A3DB1D;
    LDA.W $1794                                                          ;A3DB20;
    TAX                                                                  ;A3DB23;
    LDA.W $1796                                                          ;A3DB24;
    ASL A                                                                ;A3DB27;
    ASL A                                                                ;A3DB28;
    ASL A                                                                ;A3DB29;
    TAY                                                                  ;A3DB2A;
    LDA.W #$0004                                                         ;A3DB2B;
    STA.W $060B                                                          ;A3DB2E;

.loop:
    LDA.W ReflecPaletteCycleColors,Y                                     ;A3DB31;
    STA.L $7EC112,X                                                      ;A3DB34;
    INY                                                                  ;A3DB38;
    INY                                                                  ;A3DB39;
    INX                                                                  ;A3DB3A;
    INX                                                                  ;A3DB3B;
    DEC.W $060B                                                          ;A3DB3C;
    BNE .loop                                                            ;A3DB3F;
    LDA.W $1796                                                          ;A3DB41;
    INC A                                                                ;A3DB44;
    AND.W #$0007                                                         ;A3DB45;
    STA.W $1796                                                          ;A3DB48;

.return:
    RTL                                                                  ;A3DB4B;


InstList_Reflec_FacingLeft:
    dw Instruction_Reflec_Param2InY                                      ;A3DB4C;
    dw $0000,$0040                                                       ;A3DB4E;
    dw Spritemap_Reflec_0                                                ;A3DB52;
    dw Instruction_Common_GotoY                                          ;A3DB54;
    dw InstList_Reflec_FacingLeft                                        ;A3DB56;

InstList_Reflec_FacingUpLeft:
    dw Instruction_Reflec_Param2InY                                      ;A3DB58;
    dw $0001,$0040                                                       ;A3DB5A;
    dw Spritemap_Reflec_1                                                ;A3DB5E;
    dw Instruction_Common_GotoY                                          ;A3DB60;
    dw InstList_Reflec_FacingUpLeft                                      ;A3DB62;

InstList_Reflec_FacingUp:
    dw Instruction_Reflec_Param2InY                                      ;A3DB64;
    dw $0002,$0040                                                       ;A3DB66;
    dw Spritemap_Reflec_2                                                ;A3DB6A;
    dw Instruction_Common_Sleep                                          ;A3DB6C;

InstList_Reflec_FacingUpRight:
    dw Instruction_Reflec_Param2InY                                      ;A3DB6E;
    dw $0003,$0040                                                       ;A3DB70;
    dw Spritemap_Reflec_3                                                ;A3DB74;
    dw Instruction_Common_Sleep                                          ;A3DB76;

InstList_Reflec_FacingRight:
    dw Instruction_Reflec_Param2InY                                      ;A3DB78;
    dw $0000,$0040                                                       ;A3DB7A;
    dw Spritemap_Reflec_4                                                ;A3DB7E;
    dw Instruction_Common_Sleep                                          ;A3DB80;

InstList_Reflec_FacingDownRight:
    dw Instruction_Reflec_Param2InY                                      ;A3DB82;
    dw $0001,$0040                                                       ;A3DB84;
    dw Spritemap_Reflec_5                                                ;A3DB88;
    dw Instruction_Common_Sleep                                          ;A3DB8A;

InstList_Reflec_FacingDown:
    dw Instruction_Reflec_Param2InY                                      ;A3DB8C;
    dw $0002,$0040                                                       ;A3DB8E;
    dw Spritemap_Reflec_6                                                ;A3DB92;
    dw Instruction_Common_Sleep                                          ;A3DB94;

InstList_Reflec_FacingDownLeft:
    dw Instruction_Reflec_Param2InY                                      ;A3DB96;
    dw $0003,$0040                                                       ;A3DB98;
    dw Spritemap_Reflec_7                                                ;A3DB9C;
    dw Instruction_Common_Sleep                                          ;A3DB9E;

InstList_Reflec_ZeroHealth_FacingLeft:
    dw Instruction_Reflec_Param2InY                                      ;A3DBA0;
    dw $0000,$0001                                                       ;A3DBA2;
    dw Spritemap_Reflec_0                                                ;A3DBA6;
    dw Instruction_Common_Sleep                                          ;A3DBA8;

InstList_Reflec_ZeroHealth_FacingUpLeft:
    dw Instruction_Reflec_Param2InY                                      ;A3DBAA;
    dw $0001,$0001                                                       ;A3DBAC;
    dw Spritemap_Reflec_1                                                ;A3DBB0;
    dw Instruction_Common_Sleep                                          ;A3DBB2;

InstList_Reflec_ZeroHealth_FacingUp:
    dw Instruction_Reflec_Param2InY                                      ;A3DBB4;
    dw $0002,$0001                                                       ;A3DBB6;
    dw Spritemap_Reflec_2                                                ;A3DBBA;
    dw Instruction_Common_Sleep                                          ;A3DBBC;

InstList_Reflec_ZeroHealth_FacingUpRight:
    dw Instruction_Reflec_Param2InY                                      ;A3DBBE;
    dw $0003,$0001                                                       ;A3DBC0;
    dw Spritemap_Reflec_3                                                ;A3DBC4;
    dw Instruction_Common_Sleep                                          ;A3DBC6;

Instruction_Reflec_Param2InY:
    PHY                                                                  ;A3DBC8;
    LDA.W $0000,Y                                                        ;A3DBC9;
    STA.W EnemyData.initParam1,X                                         ;A3DBCC;
    PLY                                                                  ;A3DBCF;
    INY                                                                  ;A3DBD0;
    INY                                                                  ;A3DBD1;
    RTL                                                                  ;A3DBD2;


InitAI_Reflec:
    LDX.W $0E54                                                          ;A3DBD3;
    LDA.W EnemyData.properties,X                                         ;A3DBD6;
    ORA.W #$1000                                                         ;A3DBD9;
    STA.W EnemyData.properties,X                                         ;A3DBDC;
    LDA.W EnemyData.initParam0,X                                         ;A3DBDF;
    ASL A                                                                ;A3DBE2;
    TAY                                                                  ;A3DBE3;
    LDA.W .pointers,Y                                                    ;A3DBE4;
    STA.W EnemyData.pInstList,X                                          ;A3DBE7;
    LDA.W #EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes       ;A3DBEA;
    STA.W $178C                                                          ;A3DBED;
    LDA.W #EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes>>16   ;A3DBF0;
    STA.W $178E                                                          ;A3DBF3;
    LDA.W EnemyData.palette,X                                            ;A3DBF6;
    ASL A                                                                ;A3DBF9;
    ASL A                                                                ;A3DBFA;
    ASL A                                                                ;A3DBFB;
    ASL A                                                                ;A3DBFC;
    AND.W #$FF00                                                         ;A3DBFD;
    XBA                                                                  ;A3DC00;
    STA.W $1794                                                          ;A3DC01;
    LDA.W #$0010                                                         ;A3DC04;
    STA.W $1798                                                          ;A3DC07;
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

RTL_A3DC1B:
    RTL                                                                  ;A3DC1B;


EnemyShot_Reflec:
    LDX.W $0E54                                                          ;A3DC1C;
    LDA.W $18A6                                                          ;A3DC1F;
    ASL A                                                                ;A3DC22;
    TAY                                                                  ;A3DC23;
    LDA.W #$000A                                                         ;A3DC24;
    STA.W EnemyData.invincibilityTimer,X                                 ;A3DC27;
    LDA.W EnemyData.initParam1,X                                         ;A3DC2A;
    ASL A                                                                ;A3DC2D;
    ASL A                                                                ;A3DC2E;
    ASL A                                                                ;A3DC2F;
    ASL A                                                                ;A3DC30;
    ASL A                                                                ;A3DC31;
    STA.W $0E32                                                          ;A3DC32;
    LDA.W $0C04,Y                                                        ;A3DC35;
    AND.W #$000F                                                         ;A3DC38;
    ASL A                                                                ;A3DC3B;
    CLC                                                                  ;A3DC3C;
    ADC.W $0E32                                                          ;A3DC3D;
    TAX                                                                  ;A3DC40;
    STA.W $0E32                                                          ;A3DC41;
    LDA.W ReflectedDirectionTable,X                                      ;A3DC44;
    CMP.W #$8000                                                         ;A3DC47;
    BEQ +                                                                ;A3DC4A;
    LDA.W ReflectedDirectionTable,X                                      ;A3DC4C;
    BMI .executeFunction                                                 ;A3DC4F;
    BRA .skipFunction                                                    ;A3DC51;


.executeFunction:
    JSR.W (ReflectedDirectionTable_offsetNegatives,X)                    ;A3DC53;
    LDX.W $0E32                                                          ;A3DC56;
    LDA.W ReflectedDirectionTable,X                                      ;A3DC59;
    EOR.W #$FFFF                                                         ;A3DC5C;
    INC A                                                                ;A3DC5F;

.skipFunction:
    STA.W $0C04,Y                                                        ;A3DC60;
    LDA.W $0C18,Y                                                        ;A3DC63;
    AND.W #$7FFF                                                         ;A3DC66;
    STA.W $0C18,Y                                                        ;A3DC69;
    STY.B $14                                                            ;A3DC6C;
    JSL.L ProjectileReflection                                           ;A3DC6E;
    LDA.W #$0057                                                         ;A3DC72;
    JSL.L QueueSound_Lib2_Max6                                           ;A3DC75;
    RTL                                                                  ;A3DC79;


  + LDA.W $0C04,Y                                                        ;A3DC7A;
    ORA.W #$0010                                                         ;A3DC7D;
    STA.W $0C04,Y                                                        ;A3DC80;
    LDA.W EnemyData.health,X                                             ;A3DC83;
    BEQ .return                                                          ;A3DC86;
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic     ;A3DC88;
    LDA.W EnemyData.health,X                                             ;A3DC8C;
    BNE .return                                                          ;A3DC8F;
    LDA.W EnemyData.initParam1,X                                         ;A3DC91;
    ASL A                                                                ;A3DC94;
    TAY                                                                  ;A3DC95;
    LDA.W .pointers,Y                                                    ;A3DC96;
    STA.W EnemyData.pInstList,X                                          ;A3DC99;
    LDA.W #$0001                                                         ;A3DC9C;
    STA.W EnemyData.instTimer,X                                          ;A3DC9F;
    STZ.W EnemyData.loopCounter,X                                        ;A3DCA2;

.return:
    RTL                                                                  ;A3DCA5;


.pointers:
    dw InstList_Reflec_ZeroHealth_FacingLeft                             ;A3DCA6;
    dw InstList_Reflec_ZeroHealth_FacingUpLeft                           ;A3DCA8;
    dw InstList_Reflec_ZeroHealth_FacingUp                               ;A3DCAA;
    dw InstList_Reflec_ZeroHealth_FacingUpRight                          ;A3DCAC;

ReflectedDirectionTable:
    dw $8000,$FFF8,$0007,$FFFA,$8000,$8000,$FFFD,$0002                   ;A3DCAE;
    dw $FFFF,$8000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A3DCBE;
    dw $FFFE,$8000,$FFF7,$0008,$FFF9,$FFF9,$8000,$FFFB                   ;A3DCCE;
    dw $0003,$FFFE,$0000,$0000,$0000,$0000,$0000,$0000                   ;A3DCDE;
    dw $0004,$FFFD,$8000,$FFFF,$0000,$0009,$FFF8,$8000                   ;A3DCEE;
    dw $FFFA,$0005,$0000,$0000,$0000,$0000,$0000,$0000                   ;A3DCFE;
    dw $FFF9,$0006,$FFFC,$8000,$FFFE,$FFFE,$0001,$FFF7                   ;A3DD0E;
    dw $8000,$FFF9,$0000,$0000,$0000,$0000,$0000,$0000                   ;A3DD1E;

ReflectedDirectionTable_offsetNegatives:
    dw $0000,$DDAE,$0000,$DDAE,$0000,$0000,$DDCF,$0000                   ;A3DD2E;
    dw $DDCF,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A3DD3E;
    dw $DDF0,$0000,$DE0D,$0000,$DE2A,$DE2A,$0000,$DE47                   ;A3DD4E;
    dw $0000,$DDF0,$0000,$0000,$0000,$0000,$0000,$0000                   ;A3DD5E;
    dw $0000,$DE64,$0000,$DE85,$0000,$0000,$DE85,$0000                   ;A3DD6E;
    dw $DE64,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A3DD7E;
    dw $DEA6,$0000,$DEC3,$0000,$DEE0,$DEE0,$0000,$DEFD                   ;A3DD8E;
    dw $0000,$DEA6,$0000,$0000,$0000,$0000,$0000,$0000                   ;A3DD9E;

Function_Reflec_ReflectionOffset_Vertical_UpRight_DownRight:
    LDX.W $0E54                                                          ;A3DDAE;
    LDA.W EnemyData.xPosition,X                                          ;A3DDB1;
    SEC                                                                  ;A3DDB4;
    SBC.W #$0008                                                         ;A3DDB5;
    STA.W $0E36                                                          ;A3DDB8;
    LDA.W $0B64,Y                                                        ;A3DDBB;
    CLC                                                                  ;A3DDBE;
    ADC.W $0BB4,Y                                                        ;A3DDBF;
    CMP.W $0E36                                                          ;A3DDC2;
    BPL .return1                                                         ;A3DDC5;
    LDA.W #$0000                                                         ;A3DDC7;
    RTS                                                                  ;A3DDCA;


.return1:
    LDA.W #$0001                                                         ;A3DDCB;
    RTS                                                                  ;A3DDCE;


Function_Reflec_ReflectionOffset_Vertical_UpLeft_DownLeft:
    LDX.W $0E54                                                          ;A3DDCF;
    LDA.W EnemyData.xPosition,X                                          ;A3DDD2;
    CLC                                                                  ;A3DDD5;
    ADC.W #$0008                                                         ;A3DDD6;
    STA.W $0E36                                                          ;A3DDD9;
    LDA.W $0B64,Y                                                        ;A3DDDC;
    SEC                                                                  ;A3DDDF;
    SBC.W $0BB4,Y                                                        ;A3DDE0;
    CMP.W $0E36                                                          ;A3DDE3;
    BMI .return1                                                         ;A3DDE6;
    LDA.W #$0000                                                         ;A3DDE8;
    RTS                                                                  ;A3DDEB;


.return1:
    LDA.W #$0001                                                         ;A3DDEC;
    RTS                                                                  ;A3DDEF;


Function_Reflec_ReflectionOffset_UpRightDiagonal_Up:
    LDX.W $0E54                                                          ;A3DDF0;
    LDA.W EnemyData.xPosition,X                                          ;A3DDF3;
    STA.W $0E36                                                          ;A3DDF6;
    LDA.W $0B64,Y                                                        ;A3DDF9;
    CLC                                                                  ;A3DDFC;
    ADC.W $0BB4,Y                                                        ;A3DDFD;
    CMP.W $0E36                                                          ;A3DE00;
    BMI .return1                                                         ;A3DE03;
    LDA.W #$0000                                                         ;A3DE05;
    RTS                                                                  ;A3DE08;


.return1:
    LDA.W #$0001                                                         ;A3DE09;
    RTS                                                                  ;A3DE0C;


Function_Reflec_ReflectionOffset_UpRightDiagonal_Right:
    LDX.W $0E54                                                          ;A3DE0D;
    LDA.W EnemyData.yPosition,X                                          ;A3DE10;
    STA.W $0E36                                                          ;A3DE13;
    LDA.W $0B78,Y                                                        ;A3DE16;
    SEC                                                                  ;A3DE19;
    SBC.W $0BC8,Y                                                        ;A3DE1A;
    CMP.W $0E36                                                          ;A3DE1D;
    BPL .return1                                                         ;A3DE20;
    LDA.W #$0000                                                         ;A3DE22;
    RTS                                                                  ;A3DE25;


.return1:
    LDA.W #$0001                                                         ;A3DE26;
    RTS                                                                  ;A3DE29;


Function_Reflec_ReflectionOffset_UpRightDiagonal_Down:
    LDX.W $0E54                                                          ;A3DE2A;
    LDA.W EnemyData.xPosition,X                                          ;A3DE2D;
    STA.W $0E36                                                          ;A3DE30;
    LDA.W $0B64,Y                                                        ;A3DE33;
    SEC                                                                  ;A3DE36;
    SBC.W $0BB4,Y                                                        ;A3DE37;
    CMP.W $0E36                                                          ;A3DE3A;
    BPL .return1                                                         ;A3DE3D;
    LDA.W #$0000                                                         ;A3DE3F;
    RTS                                                                  ;A3DE42;


.return1:
    LDA.W #$0001                                                         ;A3DE43;
    RTS                                                                  ;A3DE46;


Function_Reflec_ReflectionOffset_UpRightDiagonal_Left:
    LDX.W $0E54                                                          ;A3DE47;
    LDA.W EnemyData.yPosition,X                                          ;A3DE4A;
    STA.W $0E36                                                          ;A3DE4D;
    LDA.W $0B78,Y                                                        ;A3DE50;
    CLC                                                                  ;A3DE53;
    ADC.W $0BC8,Y                                                        ;A3DE54;
    CMP.W $0E36                                                          ;A3DE57;
    BMI .return1                                                         ;A3DE5A;
    LDA.W #$0000                                                         ;A3DE5C;
    RTS                                                                  ;A3DE5F;


.return1:
    LDA.W #$0001                                                         ;A3DE60;
    RTS                                                                  ;A3DE63;


Function_Reflec_ReflectionOffset_Horizontal_UpRight_UpLeft:
    LDX.W $0E54                                                          ;A3DE64;
    LDA.W EnemyData.yPosition,X                                          ;A3DE67;
    CLC                                                                  ;A3DE6A;
    ADC.W #$0008                                                         ;A3DE6B;
    STA.W $0E36                                                          ;A3DE6E;
    LDA.W $0B78,Y                                                        ;A3DE71;
    SEC                                                                  ;A3DE74;
    SBC.W $0BC8,Y                                                        ;A3DE75;
    CMP.W $0E36                                                          ;A3DE78;
    BMI .return1                                                         ;A3DE7B;
    LDA.W #$0000                                                         ;A3DE7D;
    RTS                                                                  ;A3DE80;


.return1:
    LDA.W #$0001                                                         ;A3DE81;
    RTS                                                                  ;A3DE84;


Func_Reflec_ReflectionOffset_Horizontal_DownRight_DownLeft:
    LDX.W $0E54                                                          ;A3DE85;
    LDA.W EnemyData.yPosition,X                                          ;A3DE88;
    SEC                                                                  ;A3DE8B;
    SBC.W #$0008                                                         ;A3DE8C;
    STA.W $0E36                                                          ;A3DE8F;
    LDA.W $0B78,Y                                                        ;A3DE92;
    CLC                                                                  ;A3DE95;
    ADC.W $0BC8,Y                                                        ;A3DE96;
    CMP.W $0E36                                                          ;A3DE99;
    BPL .return1                                                         ;A3DE9C;
    LDA.W #$0000                                                         ;A3DE9E;
    RTS                                                                  ;A3DEA1;


.return1:
    LDA.W #$0001                                                         ;A3DEA2;
    RTS                                                                  ;A3DEA5;


Function_Reflec_ReflectionOffset_DownRightDiagonal_Up:
    LDX.W $0E54                                                          ;A3DEA6;
    LDA.W EnemyData.xPosition,X                                          ;A3DEA9;
    STA.W $0E36                                                          ;A3DEAC;
    LDA.W $0B64,Y                                                        ;A3DEAF;
    SEC                                                                  ;A3DEB2;
    SBC.W $0BB4,Y                                                        ;A3DEB3;
    CMP.W $0E36                                                          ;A3DEB6;
    BMI .return1                                                         ;A3DEB9;
    LDA.W #$0000                                                         ;A3DEBB;
    RTS                                                                  ;A3DEBE;


.return1:
    LDA.W #$0001                                                         ;A3DEBF;
    RTS                                                                  ;A3DEC2;


Function_Reflec_ReflectionOffset_DownRightDiagonal_Right:
    LDX.W $0E54                                                          ;A3DEC3;
    LDA.W EnemyData.yPosition,X                                          ;A3DEC6;
    STA.W $0E36                                                          ;A3DEC9;
    LDA.W $0B78,Y                                                        ;A3DECC;
    CLC                                                                  ;A3DECF;
    ADC.W $0BC8,Y                                                        ;A3DED0;
    CMP.W $0E36                                                          ;A3DED3;
    BPL .return0                                                         ;A3DED6;
    LDA.W #$0001                                                         ;A3DED8;
    RTS                                                                  ;A3DEDB;


.return0:
    LDA.W #$0000                                                         ;A3DEDC;
    RTS                                                                  ;A3DEDF;


Function_Reflec_ReflectionOffset_DownRightDiagonal_Down:
    LDX.W $0E54                                                          ;A3DEE0;
    LDA.W EnemyData.xPosition,X                                          ;A3DEE3;
    STA.W $0E36                                                          ;A3DEE6;
    LDA.W $0B64,Y                                                        ;A3DEE9;
    SEC                                                                  ;A3DEEC;
    SBC.W $0BB4,Y                                                        ;A3DEED;
    CMP.W $0E36                                                          ;A3DEF0;
    BMI .return1                                                         ;A3DEF3;
    LDA.W #$0000                                                         ;A3DEF5;
    RTS                                                                  ;A3DEF8;


.return1:
    LDA.W #$0001                                                         ;A3DEF9;
    RTS                                                                  ;A3DEFC;


Function_Reflec_ReflectionOffset_DownRightDiagonal_Left:
    LDX.W $0E54                                                          ;A3DEFD;
    LDA.W EnemyData.yPosition,X                                          ;A3DF00;
    STA.W $0E36                                                          ;A3DF03;
    LDA.W $0B78,Y                                                        ;A3DF06;
    SEC                                                                  ;A3DF09;
    SBC.W $0BC8,Y                                                        ;A3DF0A;
    CMP.W $0E36                                                          ;A3DF0D;
    BPL .return1                                                         ;A3DF10;
    LDA.W #$0000                                                         ;A3DF12;
    RTS                                                                  ;A3DF15;


.return1:
    LDA.W #$0001                                                         ;A3DF16;
    RTS                                                                  ;A3DF19;


Spritemap_Reflec_0:
    dw $0003,$81F0                                                       ;A3DF1A;
    db $00                                                               ;A3DF1E;
    dw $610E,$81F0                                                       ;A3DF1F;
    db $F0                                                               ;A3DF23;
    dw $210D,$81F8                                                       ;A3DF24;
    db $F8                                                               ;A3DF28;
    dw $2100                                                             ;A3DF29;

Spritemap_Reflec_1:
    dw $0003,$81EA                                                       ;A3DF2B;
    db $F3                                                               ;A3DF2F;
    dw $211A,$81F2                                                       ;A3DF30;
    db $EB                                                               ;A3DF34;
    dw $210B,$81F8                                                       ;A3DF35;
    db $F8                                                               ;A3DF39;
    dw $2102                                                             ;A3DF3A;

Spritemap_Reflec_2:
    dw $0003,$81F8                                                       ;A3DF3C;
    db $F8                                                               ;A3DF40;
    dw $2104,$8000                                                       ;A3DF41;
    db $F1                                                               ;A3DF45;
    dw $A118,$81F0                                                       ;A3DF46;
    db $F1                                                               ;A3DF4A;
    dw $2108                                                             ;A3DF4B;

Spritemap_Reflec_3:
    dw $0003,$81F8                                                       ;A3DF4D;
    db $F8                                                               ;A3DF51;
    dw $2106,$8006                                                       ;A3DF52;
    db $F3                                                               ;A3DF56;
    dw $611A,$81FE                                                       ;A3DF57;
    db $EB                                                               ;A3DF5B;
    dw $610B                                                             ;A3DF5C;

Spritemap_Reflec_4:
    dw $0003,$8000                                                       ;A3DF5E;
    db $00                                                               ;A3DF62;
    dw $210E,$8000                                                       ;A3DF63;
    db $F0                                                               ;A3DF67;
    dw $610D,$81F8                                                       ;A3DF68;
    db $F8                                                               ;A3DF6C;
    dw $2100                                                             ;A3DF6D;

Spritemap_Reflec_5:
    dw $0003,$81F8                                                       ;A3DF6F;
    db $F8                                                               ;A3DF73;
    dw $2102,$8006                                                       ;A3DF74;
    db $FD                                                               ;A3DF78;
    dw $E11A,$81FE                                                       ;A3DF79;
    db $05                                                               ;A3DF7D;
    dw $E10B                                                             ;A3DF7E;

Spritemap_Reflec_6:
    dw $0003,$81F8                                                       ;A3DF80;
    db $F8                                                               ;A3DF84;
    dw $2104,$8000                                                       ;A3DF85;
    db $FF                                                               ;A3DF89;
    dw $2118,$81F0                                                       ;A3DF8A;
    db $FF                                                               ;A3DF8E;
    dw $A108                                                             ;A3DF8F;

Spritemap_Reflec_7:
    dw $0003,$81F8                                                       ;A3DF91;
    db $F8                                                               ;A3DF95;
    dw $2106,$81EA                                                       ;A3DF96;
    db $FD                                                               ;A3DF9A;
    dw $A11A,$81F2                                                       ;A3DF9B;
    db $05                                                               ;A3DF9F;
    dw $A10B                                                             ;A3DFA0;

Palette_HZoomer:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610                   ;A3DFA2;
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113                   ;A3DFB2;

Instruction_HZoomer_FunctionInY:
    LDA.W $0000,Y                                                        ;A3DFC2;
    STA.W EnemyData.work5,X                                              ;A3DFC5;
    INY                                                                  ;A3DFC8;
    INY                                                                  ;A3DFC9;
    RTL                                                                  ;A3DFCA;


InstList_HZoomer_UpsideRight_0:
    dw Instruction_HZoomer_FunctionInY                                   ;A3DFCB;
    dw Function_HZoomer_CrawlingVertically                               ;A3DFCD;

InstList_HZoomer_UpsideRight_1:
    dw $0003                                                             ;A3DFCF;
    dw Spritemap_Crawlers_UpsideRight_0                                  ;A3DFD1;
    dw $0003                                                             ;A3DFD3;
    dw Spritemap_Crawlers_UpsideRight_1                                  ;A3DFD5;
    dw $0003                                                             ;A3DFD7;
    dw Spritemap_Crawlers_UpsideRight_2                                  ;A3DFD9;
    dw $0003                                                             ;A3DFDB;
    dw Spritemap_Crawlers_UpsideRight_3                                  ;A3DFDD;
    dw $0003                                                             ;A3DFDF;
    dw Spritemap_Crawlers_UpsideRight_4                                  ;A3DFE1;
    dw Instruction_Common_GotoY                                          ;A3DFE3;
    dw InstList_HZoomer_UpsideRight_1                                    ;A3DFE5;

InstList_HZoomer_UpsideLeft_0:
    dw Instruction_HZoomer_FunctionInY                                   ;A3DFE7;
    dw Function_HZoomer_CrawlingVertically                               ;A3DFE9;

InstList_HZoomer_UpsideLeft_1:
    dw $0003                                                             ;A3DFEB;
    dw Spritemap_Crawlers_UpsideLeft_0                                   ;A3DFED;
    dw $0003                                                             ;A3DFEF;
    dw Spritemap_Crawlers_UpsideLeft_1                                   ;A3DFF1;
    dw $0003                                                             ;A3DFF3;
    dw Spritemap_Crawlers_UpsideLeft_2                                   ;A3DFF5;
    dw $0003                                                             ;A3DFF7;
    dw Spritemap_Crawlers_UpsideLeft_3                                   ;A3DFF9;
    dw $0003                                                             ;A3DFFB;
    dw Spritemap_Crawlers_UpsideLeft_4                                   ;A3DFFD;
    dw Instruction_Common_GotoY                                          ;A3DFFF;
    dw InstList_HZoomer_UpsideLeft_1                                     ;A3E001;

InstList_HZoomer_UpsideDown_0:
    dw Instruction_HZoomer_FunctionInY                                   ;A3E003;
    dw Function_HZoomer_CrawlingHorizontally                             ;A3E005;

InstList_HZoomer_UpsideDown_1:
    dw $0003                                                             ;A3E007;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_0                        ;A3E009;
    dw $0003                                                             ;A3E00B;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_1                        ;A3E00D;
    dw $0003                                                             ;A3E00F;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_2                        ;A3E011;
    dw $0003                                                             ;A3E013;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_3                        ;A3E015;
    dw $0003                                                             ;A3E017;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_4                        ;A3E019;
    dw Instruction_Common_GotoY                                          ;A3E01B;
    dw InstList_HZoomer_UpsideDown_1                                     ;A3E01D;

InstList_HZoomer_UpsideUp_0:
    dw Instruction_HZoomer_FunctionInY                                   ;A3E01F;
    dw Function_HZoomer_CrawlingHorizontally                             ;A3E021;

InstList_HZoomer_UpsideUp_1:
    dw $0003                                                             ;A3E023;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_0                         ;A3E025;
    dw $0003                                                             ;A3E027;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_1                         ;A3E029;
    dw $0003                                                             ;A3E02B;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_2                         ;A3E02D;
    dw $0003                                                             ;A3E02F;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_3                         ;A3E031;
    dw $0003                                                             ;A3E033;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_4                         ;A3E035;
    dw Instruction_Common_GotoY                                          ;A3E037;
    dw InstList_HZoomer_UpsideUp_1                                       ;A3E039;

HZoomerInitialInstListPointers:
    dw InstList_HZoomer_UpsideRight_0                                    ;A3E03B;
    dw InstList_HZoomer_UpsideLeft_0                                     ;A3E03D;
    dw InstList_HZoomer_UpsideDown_0                                     ;A3E03F;
    dw InstList_HZoomer_UpsideUp_0                                       ;A3E041;

InitAI_HZoomer:
    LDX.W $0E54                                                          ;A3E043;
    LDA.W EnemyData.pInstList,X                                          ;A3E046;
    AND.W #$0003                                                         ;A3E049;
    ASL A                                                                ;A3E04C;
    TAY                                                                  ;A3E04D;
    LDA.W HZoomerInitialInstListPointers,Y                               ;A3E04E;
    STA.W EnemyData.pInstList,X                                          ;A3E051;
    LDA.W #.return                                                       ;A3E054;
    STA.W EnemyData.work5,X                                              ;A3E057;
    LDA.W EnemyData.initParam0,X                                         ;A3E05A;
    ASL A                                                                ;A3E05D;
    TAY                                                                  ;A3E05E;
    LDA.W CrawlersSpeedTable,Y                                           ;A3E05F;
    STA.W EnemyData.work0,X                                              ;A3E062;
    STA.W EnemyData.work1,X                                              ;A3E065;
    LDA.W EnemyData.properties,X                                         ;A3E068;
    AND.W #$0003                                                         ;A3E06B;
    BNE +                                                                ;A3E06E;
    LDA.W EnemyData.work0,X                                              ;A3E070;
    EOR.W #$FFFF                                                         ;A3E073;
    INC A                                                                ;A3E076;
    STA.W EnemyData.work0,X                                              ;A3E077;
    RTL                                                                  ;A3E07A;


  + CMP.W #$0002                                                         ;A3E07B;
    BNE .return                                                          ;A3E07E;
    LDA.W EnemyData.work1,X                                              ;A3E080;
    EOR.W #$FFFF                                                         ;A3E083;
    INC A                                                                ;A3E086;
    STA.W EnemyData.work1,X                                              ;A3E087;

.return:
    RTL                                                                  ;A3E08A;


MainAI_HZoomer:
    LDX.W $0E54                                                          ;A3E08B;
    JMP.W ($0FB2,X)                                                      ;A3E08E;


Function_HZoomer_CrawlingVertically:
    LDA.W $1840                                                          ;A3E091;
    CMP.W #$001E                                                         ;A3E094;
    BNE .noQuake                                                         ;A3E097;
    LDA.W $183E                                                          ;A3E099;
    CMP.W #$0014                                                         ;A3E09C;
    BNE .noQuake                                                         ;A3E09F;
    LDA.W EnemyData.work5,X                                              ;A3E0A1;
    STA.L $7E7806,X                                                      ;A3E0A4;
    LDA.W #Function_Crawlers_Falling                                     ;A3E0A8;
    STA.W EnemyData.work5,X                                              ;A3E0AB;

.noQuake:
    STZ.B $12                                                            ;A3E0AE;
    STZ.B $14                                                            ;A3E0B0;
    LDA.W EnemyData.work0,X                                              ;A3E0B2;
    BPL +                                                                ;A3E0B5;
    DEC.B $14                                                            ;A3E0B7;

  + STA.B $13                                                            ;A3E0B9;
    LDA.B $14                                                            ;A3E0BB;
    BPL .inc                                                             ;A3E0BD;
    DEC A                                                                ;A3E0BF;
    BRA .moveRight                                                       ;A3E0C0;


.inc:
    INC A                                                                ;A3E0C2;

.moveRight:
    STA.B $14                                                            ;A3E0C3;
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes                           ;A3E0C5;
    BCC .outsideTurn                                                     ;A3E0C9;
    LDA.W #$0000                                                         ;A3E0CB;
    STA.L $7E7808,X                                                      ;A3E0CE;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3E0D2;
    STZ.B $12                                                            ;A3E0D6;
    STZ.B $14                                                            ;A3E0D8;
    LDA.W EnemyData.work1,X                                              ;A3E0DA;
    BPL .moveDown                                                        ;A3E0DD;
    DEC.B $14                                                            ;A3E0DF;

.moveDown:
    STA.B $13                                                            ;A3E0E1;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E0E3;
    BCS .insideTurn                                                      ;A3E0E7;
    LDX.W $0E54                                                          ;A3E0E9;
    LDA.W $0AFA                                                          ;A3E0EC;
    SEC                                                                  ;A3E0EF;
    SBC.W EnemyData.yPosition,X                                          ;A3E0F0;
    BPL .SamusRightOfZHoomer                                             ;A3E0F3;
    LDA.W EnemyData.work1,X                                              ;A3E0F5;
    BMI .return                                                          ;A3E0F8;
    BRA .negateY                                                         ;A3E0FA;


.SamusRightOfZHoomer:
    LDA.W EnemyData.work1,X                                              ;A3E0FC;
    BPL .return                                                          ;A3E0FF;

.negateY:
    EOR.W #$FFFF                                                         ;A3E101;
    INC A                                                                ;A3E104;

.return:
    STA.W EnemyData.work1,X                                              ;A3E105;
    RTL                                                                  ;A3E108;


.insideTurn:
    LDA.W EnemyData.work0,X                                              ;A3E109;
    EOR.W #$FFFF                                                         ;A3E10C;
    INC A                                                                ;A3E10F;
    STA.W EnemyData.work0,X                                              ;A3E110;
    LDY.W #InstList_HZoomer_UpsideUp_0                                   ;A3E113;
    LDY.W #InstList_HZoomer_UpsideUp_0                                   ;A3E116; >.<
    LDA.W EnemyData.work1,X                                              ;A3E119;
    BPL ..keepUp                                                         ;A3E11C;
    LDY.W #InstList_HZoomer_UpsideDown_0                                 ;A3E11E;

..keepUp:
    TYA                                                                  ;A3E121;
    STA.W EnemyData.pInstList,X                                          ;A3E122;
    LDA.W #$0001                                                         ;A3E125;
    STA.W EnemyData.instTimer,X                                          ;A3E128;
    RTL                                                                  ;A3E12B;


.outsideTurn:
    LDA.L $7E7808,X                                                      ;A3E12C;
    INC A                                                                ;A3E130;
    STA.L $7E7808,X                                                      ;A3E131;
    CMP.W #$0004                                                         ;A3E135;
    BMI .notFalling                                                      ;A3E138;
    LDA.W EnemyData.work5,X                                              ;A3E13A;
    STA.L $7E7806,X                                                      ;A3E13D;
    LDA.W #Function_Crawlers_Falling                                     ;A3E141;
    STA.W EnemyData.work5,X                                              ;A3E144;
    RTL                                                                  ;A3E147;


.notFalling:
    LDA.W EnemyData.work1,X                                              ;A3E148;
    EOR.W #$FFFF                                                         ;A3E14B;
    INC A                                                                ;A3E14E;
    STA.W EnemyData.work1,X                                              ;A3E14F;
    LDY.W #InstList_HZoomer_UpsideUp_0                                   ;A3E152;
    LDA.W EnemyData.work1,X                                              ;A3E155;
    BPL .keepUp                                                          ;A3E158;
    LDY.W #InstList_HZoomer_UpsideDown_0                                 ;A3E15A;

.keepUp:
    TYA                                                                  ;A3E15D;
    STA.W EnemyData.pInstList,X                                          ;A3E15E;
    LDA.W #$0001                                                         ;A3E161;
    STA.W EnemyData.instTimer,X                                          ;A3E164;
    RTL                                                                  ;A3E167;


Function_HZoomer_CrawlingHorizontally:
    LDA.W $1840                                                          ;A3E168;
    CMP.W #$001E                                                         ;A3E16B;
    BNE .noQuake                                                         ;A3E16E;
    LDA.W $183E                                                          ;A3E170;
    CMP.W #$0014                                                         ;A3E173;
    BNE .noQuake                                                         ;A3E176;
    LDA.W EnemyData.work5,X                                              ;A3E178;
    STA.L $7E7806,X                                                      ;A3E17B;
    LDA.W #Function_Crawlers_Falling                                     ;A3E17F;
    STA.W EnemyData.work5,X                                              ;A3E182;

.noQuake:
    STZ.B $12                                                            ;A3E185;
    STZ.B $14                                                            ;A3E187;
    LDA.W EnemyData.work1,X                                              ;A3E189;
    BPL +                                                                ;A3E18C;
    DEC.B $14                                                            ;A3E18E;

  + STA.B $13                                                            ;A3E190;
    LDA.B $14                                                            ;A3E192;
    BPL .inc                                                             ;A3E194;
    DEC A                                                                ;A3E196;
    BRA .moveDown                                                        ;A3E197;


.inc:
    INC A                                                                ;A3E199;

.moveDown:
    STA.B $14                                                            ;A3E19A;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E19C;
    BCC .outsideTurn                                                     ;A3E1A0;
    LDA.W #$0000                                                         ;A3E1A2;
    STA.L $7E7808,X                                                      ;A3E1A5;
    STZ.B $12                                                            ;A3E1A9;
    STZ.B $14                                                            ;A3E1AB;
    LDA.W EnemyData.work0,X                                              ;A3E1AD;
    BPL .moveRight                                                       ;A3E1B0;
    DEC.B $14                                                            ;A3E1B2;

.moveRight:
    STA.B $13                                                            ;A3E1B4;
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes                           ;A3E1B6;
    BCS .insideTurn                                                      ;A3E1BA;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3E1BC;
    LDX.W $0E54                                                          ;A3E1C0;
    LDA.W $0AF6                                                          ;A3E1C3;
    SEC                                                                  ;A3E1C6;
    SBC.W EnemyData.xPosition,X                                          ;A3E1C7;
    BPL .SamusToTheRight                                                 ;A3E1CA;
    LDA.W EnemyData.work0,X                                              ;A3E1CC;
    BMI .return                                                          ;A3E1CF;
    BRA .negate                                                          ;A3E1D1;


.SamusToTheRight:
    LDA.W EnemyData.work0,X                                              ;A3E1D3;
    BPL .return                                                          ;A3E1D6;

.negate:
    EOR.W #$FFFF                                                         ;A3E1D8;
    INC A                                                                ;A3E1DB;

.return:
    STA.W EnemyData.work0,X                                              ;A3E1DC;
    RTL                                                                  ;A3E1DF;


.insideTurn:
    LDA.W EnemyData.work1,X                                              ;A3E1E0;
    EOR.W #$FFFF                                                         ;A3E1E3;
    INC A                                                                ;A3E1E6;
    STA.W EnemyData.work1,X                                              ;A3E1E7;
    LDY.W #InstList_HZoomer_UpsideLeft_0                                 ;A3E1EA;
    LDA.W EnemyData.work0,X                                              ;A3E1ED;
    BPL .keepLeft                                                        ;A3E1F0;
    LDY.W #InstList_HZoomer_UpsideRight_0                                ;A3E1F2;

.keepLeft:
    TYA                                                                  ;A3E1F5;
    STA.W EnemyData.pInstList,X                                          ;A3E1F6;
    LDA.W #$0001                                                         ;A3E1F9;
    STA.W EnemyData.instTimer,X                                          ;A3E1FC;
    RTL                                                                  ;A3E1FF;


.outsideTurn:
    LDA.L $7E7808,X                                                      ;A3E200;
    INC A                                                                ;A3E204;
    STA.L $7E7808,X                                                      ;A3E205;
    CMP.W #$0004                                                         ;A3E209;
    BMI .notFalling                                                      ;A3E20C;
    LDA.W EnemyData.work5,X                                              ;A3E20E;
    STA.L $7E7806,X                                                      ;A3E211;
    LDA.W #Function_Crawlers_Falling                                     ;A3E215;
    STA.W EnemyData.work5,X                                              ;A3E218;
    RTL                                                                  ;A3E21B;


.notFalling:
    LDA.W EnemyData.work0,X                                              ;A3E21C;
    EOR.W #$FFFF                                                         ;A3E21F;
    INC A                                                                ;A3E222;
    STA.W EnemyData.work0,X                                              ;A3E223;
    LDY.W #InstList_HZoomer_UpsideLeft_0                                 ;A3E226;
    LDA.W EnemyData.work0,X                                              ;A3E229;
    BPL ..keepLeft                                                       ;A3E22C;
    LDY.W #InstList_HZoomer_UpsideRight_0                                ;A3E22E;

..keepLeft:
    TYA                                                                  ;A3E231;
    STA.W EnemyData.pInstList,X                                          ;A3E232;
    LDA.W #$0001                                                         ;A3E235;
    STA.W EnemyData.instTimer,X                                          ;A3E238;
    RTL                                                                  ;A3E23B;


Palette_Zeela:
    dw $3800,$3F5A,$2E50,$00E5,$0063,$3AB3,$220E,$1169                   ;A3E23C;
    dw $0927,$03FF,$02F7,$0210,$0108,$7FFF,$0299,$0170                   ;A3E24C;

InstList_Zeela_Zoomer_UpsideRight_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3E25C;
    dw Function_Crawlers_CrawlingVertically                              ;A3E25E;

InstList_Zeela_Zoomer_UpsideRight_1:
    dw $0003                                                             ;A3E260;
    dw Spritemap_Crawlers_UpsideRight_0                                  ;A3E262;
    dw $0003                                                             ;A3E264;
    dw Spritemap_Crawlers_UpsideRight_1                                  ;A3E266;
    dw $0003                                                             ;A3E268;
    dw Spritemap_Crawlers_UpsideRight_2                                  ;A3E26A;
    dw $0003                                                             ;A3E26C;
    dw Spritemap_Crawlers_UpsideRight_3                                  ;A3E26E;
    dw $0003                                                             ;A3E270;
    dw Spritemap_Crawlers_UpsideRight_4                                  ;A3E272;
    dw Instruction_Common_GotoY                                          ;A3E274;
    dw InstList_Zeela_Zoomer_UpsideRight_1                               ;A3E276;

InstList_Zeela_Zoomer_UpsideLeft_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3E278;
    dw Function_Crawlers_CrawlingVertically                              ;A3E27A;

InstList_Zeela_Zoomer_UpsideLeft_1:
    dw $0003                                                             ;A3E27C;
    dw Spritemap_Crawlers_UpsideLeft_0                                   ;A3E27E;
    dw $0003                                                             ;A3E280;
    dw Spritemap_Crawlers_UpsideLeft_1                                   ;A3E282;
    dw $0003                                                             ;A3E284;
    dw Spritemap_Crawlers_UpsideLeft_2                                   ;A3E286;
    dw $0003                                                             ;A3E288;
    dw Spritemap_Crawlers_UpsideLeft_3                                   ;A3E28A;
    dw $0003                                                             ;A3E28C;
    dw Spritemap_Crawlers_UpsideLeft_4                                   ;A3E28E;
    dw Instruction_Common_GotoY                                          ;A3E290;
    dw InstList_Zeela_Zoomer_UpsideLeft_1                                ;A3E292;

InstList_Zeela_Zoomer_UpsideDown_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3E294;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3E296;

InstList_Zeela_Zoomer_UpsideDown_1:
    dw $0003                                                             ;A3E298;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_0                        ;A3E29A;
    dw $0003                                                             ;A3E29C;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_1                        ;A3E29E;
    dw $0003                                                             ;A3E2A0;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_2                        ;A3E2A2;
    dw $0003                                                             ;A3E2A4;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_3                        ;A3E2A6;
    dw $0003                                                             ;A3E2A8;
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_4                        ;A3E2AA;
    dw Instruction_Common_GotoY                                          ;A3E2AC;
    dw InstList_Zeela_Zoomer_UpsideDown_1                                ;A3E2AE;

InstList_Zeela_Zoomer_UpsideUp_0:
    dw Instruction_Crawlers_FunctionInY                                  ;A3E2B0;
    dw Function_Crawlers_CrawlingHorizontally                            ;A3E2B2;

InstList_Zeela_Zoomer_UpsideUp_1:
    dw $0003                                                             ;A3E2B4;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_0                         ;A3E2B6;
    dw $0003                                                             ;A3E2B8;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_1                         ;A3E2BA;
    dw $0003                                                             ;A3E2BC;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_2                         ;A3E2BE;
    dw $0003                                                             ;A3E2C0;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_3                         ;A3E2C2;
    dw $0003                                                             ;A3E2C4;
    dw Spritemap_Crawlers_UpsideUp_FacingRight_4                         ;A3E2C6;
    dw Instruction_Common_GotoY                                          ;A3E2C8;
    dw InstList_Zeela_Zoomer_UpsideUp_1                                  ;A3E2CA;

InitialInstListPointers_Crawlers:
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ;A3E2CC;
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ;A3E2CE;
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ;A3E2D0;
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ;A3E2D2;

InitAI_Zeela:
    LDX.W $0E54                                                          ;A3E2D4;
    LDA.W EnemyData.pInstList,X                                          ;A3E2D7;
    AND.W #$0003                                                         ;A3E2DA;
    ASL A                                                                ;A3E2DD;
    TAY                                                                  ;A3E2DE;
    LDA.W InitialInstListPointers_Crawlers,Y                             ;A3E2DF;
    STA.W EnemyData.pInstList,X                                          ;A3E2E2;
    JMP.W InitAI_Crawlers_Common                                         ;A3E2E5;


Spritemap_Crawlers_UpsideUp_FacingRight_0:
    dw $0004,$0002                                                       ;A3E2E8;
    db $00                                                               ;A3E2EC;
    dw $2121,$01F6                                                       ;A3E2ED;
    db $00                                                               ;A3E2F1;
    dw $2120,$8000                                                       ;A3E2F2;
    db $F8                                                               ;A3E2F6;
    dw $2102,$81F0                                                       ;A3E2F7;
    db $F8                                                               ;A3E2FB;
    dw $2100                                                             ;A3E2FC;

Spritemap_Crawlers_UpsideUp_FacingRight_1:
    dw $0004,$0002                                                       ;A3E2FE;
    db $00                                                               ;A3E302;
    dw $2123,$01F6                                                       ;A3E303;
    db $00                                                               ;A3E307;
    dw $2122,$8000                                                       ;A3E308;
    db $F7                                                               ;A3E30C;
    dw $2102,$81F0                                                       ;A3E30D;
    db $F7                                                               ;A3E311;
    dw $2100                                                             ;A3E312;

Spritemap_Crawlers_UpsideUp_FacingRight_2:
    dw $0004,$0002                                                       ;A3E314;
    db $00                                                               ;A3E318;
    dw $2125,$01F6                                                       ;A3E319;
    db $00                                                               ;A3E31D;
    dw $2124,$81F0                                                       ;A3E31E;
    db $F7                                                               ;A3E322;
    dw $6102,$8000                                                       ;A3E323;
    db $F7                                                               ;A3E327;
    dw $6100                                                             ;A3E328;

Spritemap_Crawlers_UpsideUp_FacingRight_3:
    dw $0004,$0002                                                       ;A3E32A;
    db $00                                                               ;A3E32E;
    dw $2127,$01F6                                                       ;A3E32F;
    db $00                                                               ;A3E333;
    dw $2126,$81F0                                                       ;A3E334;
    db $F7                                                               ;A3E338;
    dw $6102,$8000                                                       ;A3E339;
    db $F7                                                               ;A3E33D;
    dw $6100                                                             ;A3E33E;

Spritemap_Crawlers_UpsideUp_FacingRight_4:
    dw $0004,$0002                                                       ;A3E340;
    db $00                                                               ;A3E344;
    dw $2129,$01F6                                                       ;A3E345;
    db $00                                                               ;A3E349;
    dw $2128,$8000                                                       ;A3E34A;
    db $F8                                                               ;A3E34E;
    dw $2102,$81F0                                                       ;A3E34F;
    db $F8                                                               ;A3E353;
    dw $2100                                                             ;A3E354;

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E356:
    dw $0004,$01F5                                                       ;A3E356;
    db $00                                                               ;A3E35A;
    dw $6121,$0001                                                       ;A3E35B;
    db $00                                                               ;A3E35F;
    dw $6120,$81EF                                                       ;A3E360;
    db $F8                                                               ;A3E364;
    dw $6102,$81FF                                                       ;A3E365;
    db $F8                                                               ;A3E369;
    dw $6100                                                             ;A3E36A;

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E36C:
    dw $0004,$01F5                                                       ;A3E36C;
    db $00                                                               ;A3E370;
    dw $6123,$0001                                                       ;A3E371;
    db $00                                                               ;A3E375;
    dw $6122,$81EF                                                       ;A3E376;
    db $F7                                                               ;A3E37A;
    dw $6102,$81FF                                                       ;A3E37B;
    db $F7                                                               ;A3E37F;
    dw $6100                                                             ;A3E380;

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E382:
    dw $0004,$01F5                                                       ;A3E382;
    db $00                                                               ;A3E386;
    dw $6125,$0001                                                       ;A3E387;
    db $00                                                               ;A3E38B;
    dw $6124,$81FF                                                       ;A3E38C;
    db $F7                                                               ;A3E390;
    dw $2102,$81EF                                                       ;A3E391;
    db $F7                                                               ;A3E395;
    dw $2100                                                             ;A3E396;

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E398:
    dw $0004,$01F5                                                       ;A3E398;
    db $00                                                               ;A3E39C;
    dw $6127,$0001                                                       ;A3E39D;
    db $00                                                               ;A3E3A1;
    dw $6126,$81FF                                                       ;A3E3A2;
    db $F7                                                               ;A3E3A6;
    dw $2102,$81EF                                                       ;A3E3A7;
    db $F7                                                               ;A3E3AB;
    dw $2100                                                             ;A3E3AC;

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E3AE:
    dw $0004,$01F5                                                       ;A3E3AE;
    db $00                                                               ;A3E3B2;
    dw $6129,$0001                                                       ;A3E3B3;
    db $00                                                               ;A3E3B7;
    dw $6128,$81EF                                                       ;A3E3B8;
    db $F8                                                               ;A3E3BC;
    dw $6102,$81FF                                                       ;A3E3BD;
    db $F8                                                               ;A3E3C1;
    dw $6100                                                             ;A3E3C2;

Spritemap_Crawlers_UpsideLeft_0:
    dw $0004,$0000                                                       ;A3E3C4;
    db $F6                                                               ;A3E3C8;
    dw $2108,$0000                                                       ;A3E3C9;
    db $02                                                               ;A3E3CD;
    dw $2118,$81F8                                                       ;A3E3CE;
    db $00                                                               ;A3E3D2;
    dw $2106,$81F8                                                       ;A3E3D3;
    db $F0                                                               ;A3E3D7;
    dw $2104                                                             ;A3E3D8;

Spritemap_Crawlers_UpsideLeft_1:
    dw $0004,$0000                                                       ;A3E3DA;
    db $F6                                                               ;A3E3DE;
    dw $2109,$0000                                                       ;A3E3DF;
    db $02                                                               ;A3E3E3;
    dw $2119,$81F7                                                       ;A3E3E4;
    db $00                                                               ;A3E3E8;
    dw $2106,$81F7                                                       ;A3E3E9;
    db $F0                                                               ;A3E3ED;
    dw $2104                                                             ;A3E3EE;

Spritemap_Crawlers_UpsideLeft_2:
    dw $0004,$0000                                                       ;A3E3F0;
    db $F6                                                               ;A3E3F4;
    dw $210A,$0000                                                       ;A3E3F5;
    db $02                                                               ;A3E3F9;
    dw $211A,$81F7                                                       ;A3E3FA;
    db $F0                                                               ;A3E3FE;
    dw $A106,$81F7                                                       ;A3E3FF;
    db $00                                                               ;A3E403;
    dw $A104                                                             ;A3E404;

Spritemap_Crawlers_UpsideLeft_3:
    dw $0004,$0000                                                       ;A3E406;
    db $F6                                                               ;A3E40A;
    dw $210B,$0000                                                       ;A3E40B;
    db $02                                                               ;A3E40F;
    dw $211B,$81F7                                                       ;A3E410;
    db $F0                                                               ;A3E414;
    dw $A106,$81F7                                                       ;A3E415;
    db $00                                                               ;A3E419;
    dw $A104                                                             ;A3E41A;

Spritemap_Crawlers_UpsideLeft_4:
    dw $0004,$0000                                                       ;A3E41C;
    db $F6                                                               ;A3E420;
    dw $210C,$0000                                                       ;A3E421;
    db $02                                                               ;A3E425;
    dw $211C,$81F8                                                       ;A3E426;
    db $00                                                               ;A3E42A;
    dw $2106,$81F8                                                       ;A3E42B;
    db $F0                                                               ;A3E42F;
    dw $2104                                                             ;A3E430;

Spritemap_Crawlers_UpsideDown_FacingLeft_0:
    dw $0004,$0002                                                       ;A3E432;
    db $F8                                                               ;A3E436;
    dw $A121,$01F6                                                       ;A3E437;
    db $F8                                                               ;A3E43B;
    dw $A120,$8000                                                       ;A3E43C;
    db $F8                                                               ;A3E440;
    dw $A102,$81F0                                                       ;A3E441;
    db $F8                                                               ;A3E445;
    dw $A100                                                             ;A3E446;

Spritemap_Crawlers_UpsideDown_FacingLeft_1:
    dw $0004,$0002                                                       ;A3E448;
    db $F7                                                               ;A3E44C;
    dw $A123,$01F6                                                       ;A3E44D;
    db $F7                                                               ;A3E451;
    dw $A122,$8000                                                       ;A3E452;
    db $F9                                                               ;A3E456;
    dw $A102,$81F0                                                       ;A3E457;
    db $F9                                                               ;A3E45B;
    dw $A100                                                             ;A3E45C;

Spritemap_Crawlers_UpsideDown_FacingLeft_2:
    dw $0004,$0002                                                       ;A3E45E;
    db $F7                                                               ;A3E462;
    dw $A125,$01F6                                                       ;A3E463;
    db $F7                                                               ;A3E467;
    dw $A124,$81F0                                                       ;A3E468;
    db $F9                                                               ;A3E46C;
    dw $E102,$8000                                                       ;A3E46D;
    db $F9                                                               ;A3E471;
    dw $E100                                                             ;A3E472;

Spritemap_Crawlers_UpsideDown_FacingLeft_3:
    dw $0004,$0002                                                       ;A3E474;
    db $F7                                                               ;A3E478;
    dw $A127,$01F6                                                       ;A3E479;
    db $F7                                                               ;A3E47D;
    dw $A126,$81F0                                                       ;A3E47E;
    db $F9                                                               ;A3E482;
    dw $E102,$8000                                                       ;A3E483;
    db $F9                                                               ;A3E487;
    dw $E100                                                             ;A3E488;

Spritemap_Crawlers_UpsideDown_FacingLeft_4:
    dw $0004,$0002                                                       ;A3E48A;
    db $F8                                                               ;A3E48E;
    dw $A129,$01F6                                                       ;A3E48F;
    db $F8                                                               ;A3E493;
    dw $A128,$8000                                                       ;A3E494;
    db $F8                                                               ;A3E498;
    dw $A102,$81F0                                                       ;A3E499;
    db $F8                                                               ;A3E49D;
    dw $A100                                                             ;A3E49E;

Spritemap_Crawlers_UpsideDown_FacingRight_0:
    dw $0004,$01F5                                                       ;A3E4A0;
    db $F8                                                               ;A3E4A4;
    dw $E121,$0001                                                       ;A3E4A5;
    db $F8                                                               ;A3E4A9;
    dw $E120,$81EF                                                       ;A3E4AA;
    db $F8                                                               ;A3E4AE;
    dw $E102,$81FF                                                       ;A3E4AF;
    db $F8                                                               ;A3E4B3;
    dw $E100                                                             ;A3E4B4;

Spritemap_Crawlers_UpsideDown_FacingRight_1:
    dw $0004,$01F5                                                       ;A3E4B6;
    db $F7                                                               ;A3E4BA;
    dw $E123,$0001                                                       ;A3E4BB;
    db $F7                                                               ;A3E4BF;
    dw $E122,$81EF                                                       ;A3E4C0;
    db $F9                                                               ;A3E4C4;
    dw $E102,$81FF                                                       ;A3E4C5;
    db $F9                                                               ;A3E4C9;
    dw $E100                                                             ;A3E4CA;

Spritemap_Crawlers_UpsideDown_FacingRight_2:
    dw $0004,$01F5                                                       ;A3E4CC;
    db $F7                                                               ;A3E4D0;
    dw $E125,$0001                                                       ;A3E4D1;
    db $F7                                                               ;A3E4D5;
    dw $E124,$81FF                                                       ;A3E4D6;
    db $F9                                                               ;A3E4DA;
    dw $A102,$81EF                                                       ;A3E4DB;
    db $F9                                                               ;A3E4DF;
    dw $A100                                                             ;A3E4E0;

Spritemap_Crawlers_UpsideDown_FacingRight_3:
    dw $0004,$01F5                                                       ;A3E4E2;
    db $F7                                                               ;A3E4E6;
    dw $E127,$0001                                                       ;A3E4E7;
    db $F7                                                               ;A3E4EB;
    dw $E126,$81FF                                                       ;A3E4EC;
    db $F9                                                               ;A3E4F0;
    dw $A102,$81EF                                                       ;A3E4F1;
    db $F9                                                               ;A3E4F5;
    dw $A100                                                             ;A3E4F6;

Spritemap_Crawlers_UpsideDown_FacingRight_4:
    dw $0004,$01F5                                                       ;A3E4F8;
    db $F8                                                               ;A3E4FC;
    dw $E129,$0001                                                       ;A3E4FD;
    db $F8                                                               ;A3E501;
    dw $E128,$81EF                                                       ;A3E502;
    db $F8                                                               ;A3E506;
    dw $E102,$81FF                                                       ;A3E507;
    db $F8                                                               ;A3E50B;
    dw $E100                                                             ;A3E50C;

Spritemap_Crawlers_UpsideRight_0:
    dw $0004,$01F8                                                       ;A3E50E;
    db $F6                                                               ;A3E512;
    dw $6108,$01F8                                                       ;A3E513;
    db $02                                                               ;A3E517;
    dw $6118,$81F8                                                       ;A3E518;
    db $00                                                               ;A3E51C;
    dw $6106,$81F8                                                       ;A3E51D;
    db $F0                                                               ;A3E521;
    dw $6104                                                             ;A3E522;

Spritemap_Crawlers_UpsideRight_1:
    dw $0004,$01F7                                                       ;A3E524;
    db $F6                                                               ;A3E528;
    dw $6109,$01F7                                                       ;A3E529;
    db $02                                                               ;A3E52D;
    dw $6119,$81F9                                                       ;A3E52E;
    db $00                                                               ;A3E532;
    dw $6106,$81F9                                                       ;A3E533;
    db $F0                                                               ;A3E537;
    dw $6104                                                             ;A3E538;

Spritemap_Crawlers_UpsideRight_2:
    dw $0004,$01F7                                                       ;A3E53A;
    db $F6                                                               ;A3E53E;
    dw $610A,$01F7                                                       ;A3E53F;
    db $02                                                               ;A3E543;
    dw $611A,$81F9                                                       ;A3E544;
    db $F0                                                               ;A3E548;
    dw $E106,$81F9                                                       ;A3E549;
    db $00                                                               ;A3E54D;
    dw $E104                                                             ;A3E54E;

Spritemap_Crawlers_UpsideRight_3:
    dw $0004,$01F7                                                       ;A3E550;
    db $F6                                                               ;A3E554;
    dw $610B,$01F7                                                       ;A3E555;
    db $02                                                               ;A3E559;
    dw $611B,$81F9                                                       ;A3E55A;
    db $F0                                                               ;A3E55E;
    dw $E106,$81F9                                                       ;A3E55F;
    db $00                                                               ;A3E563;
    dw $E104                                                             ;A3E564;

Spritemap_Crawlers_UpsideRight_4:
    dw $0004,$01F8                                                       ;A3E566;
    db $F6                                                               ;A3E56A;
    dw $610C,$01F8                                                       ;A3E56B;
    db $02                                                               ;A3E56F;
    dw $611C,$81F8                                                       ;A3E570;
    db $00                                                               ;A3E574;
    dw $6106,$81F8                                                       ;A3E575;
    db $F0                                                               ;A3E579;
    dw $6104                                                             ;A3E57A;

Palette_Sova:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA                   ;A3E57C;
    dw $0011,$7FFF,$039C,$0237,$00D1,$3BE0,$2680,$1580                   ;A3E58C;

InitAI_Sova:
    LDX.W $0E54                                                          ;A3E59C;
    LDA.W EnemyData.pInstList,X                                          ;A3E59F;
    AND.W #$0003                                                         ;A3E5A2;
    ASL A                                                                ;A3E5A5;
    TAY                                                                  ;A3E5A6;
    LDA.W InitialInstListPointers_Crawlers,Y                             ;A3E5A7;
    STA.W EnemyData.pInstList,X                                          ;A3E5AA;
    JMP.W InitAI_Crawlers_Common                                         ;A3E5AD;


Palette_Zoomer:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6                   ;A3E5B0;
    dw $2C63,$7FE0,$7DA0,$48E0,$30A0,$03FF,$0237,$00D1                   ;A3E5C0;

Palette_MZoomer:
    dw $3800,$7FFF,$4ED3,$1926,$0481,$5F57,$4691,$360D                   ;A3E5D0;
    dw $2DCB,$6BBA,$56B2,$2947,$18C3,$7FFF,$4ED3,$1926                   ;A3E5E0;

CrawlersSpeedTable:
    dw $0040,$0080,$00C0,$0100,$0140,$0180,$01C0,$0200                   ;A3E5F0;
    dw $0240,$0280,$02C0,$0300,$0340,$0380,$0400,$0440                   ;A3E600;
    dw $0540,$0580,$05C0,$0600,$0640,$0680,$06C0,$0700                   ;A3E610;
    dw $0740,$0780,$07C0,$0800,$0840,$0880,$0800,$0000                   ;A3E620;

CrawlersInstListPointerTable_upsideDown:
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ;A3E630;
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ;A3E632;
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ;A3E634;
    dw InstList_Viola_UpsideDown                                         ;A3E636;
    dw InstList_Sciser_UpsideDown_0                                      ;A3E638;
    dw InstList_Zero_UpsideDown_FacingLeft_0                             ;A3E63A;

CrawlersInstListPointerTable_upsideUp:
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ;A3E63C;
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ;A3E63E;
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ;A3E640;
    dw InstList_Viola_UpsideUp                                           ;A3E642;
    dw InstList_Sciser_UpsideUp_0                                        ;A3E644;
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B                  ;A3E646;

CrawlersInstListPointerTable_upsideRight:
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ;A3E648;
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ;A3E64A;
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ;A3E64C;
    dw InstList_Viola_UpsideRight                                        ;A3E64E;
    dw InstList_Sciser_UpsideRight_0                                     ;A3E650;
    dw InstList_Zero_UpsideRight_FacingDown_0                            ;A3E652;

CrawlersInstListPointerTable_upsideLeft:
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ;A3E654;
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ;A3E656;
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ;A3E658;
    dw InstList_Viola_UpsideLeft                                         ;A3E65A;
    dw InstList_Sciser_UpsideLeft_0                                      ;A3E65C;
    dw InstList_Zero_UpsideLeft_FacingUp_0                               ;A3E65E;

Instruction_Crawlers_FunctionInY:
    LDA.W $0000,Y                                                        ;A3E660;
    STA.W EnemyData.work5,X                                              ;A3E663;
    INY                                                                  ;A3E666;
    INY                                                                  ;A3E667;
    RTL                                                                  ;A3E668;


InitAI_Zoomer_MZoomer:
    LDX.W $0E54                                                          ;A3E669;
    LDA.W EnemyData.pInstList,X                                          ;A3E66C;
    AND.W #$0003                                                         ;A3E66F;
    ASL A                                                                ;A3E672;
    TAY                                                                  ;A3E673;
    LDA.W InitialInstListPointers_Crawlers,Y                             ;A3E674;
    STA.W EnemyData.pInstList,X                                          ;A3E677; fallthrough to InitAI_Crawlers_Common

InitAI_Crawlers_Common:
    LDA.W #Spritemap_CommonA3_Nothing                                    ;A3E67A;
    STA.W EnemyData.pSpritemap,X                                         ;A3E67D;
    LDA.W #$0001                                                         ;A3E680;
    STA.W EnemyData.instTimer,X                                          ;A3E683;
    LDA.W #.return                                                       ;A3E686;
    STA.W EnemyData.work5,X                                              ;A3E689;
    LDA.W EnemyData.initParam0,X                                         ;A3E68C;
    CMP.W #$00FF                                                         ;A3E68F;
    BEQ .skipSpeedTable                                                  ;A3E692;
    ASL A                                                                ;A3E694;
    TAY                                                                  ;A3E695;
    LDA.W CrawlersSpeedTable,Y                                           ;A3E696;
    STA.W EnemyData.work0,X                                              ;A3E699;
    STA.W EnemyData.work1,X                                              ;A3E69C;

.skipSpeedTable:
    LDA.W EnemyData.properties,X                                         ;A3E69F;
    AND.W #$0003                                                         ;A3E6A2;
    BNE .properties                                                      ;A3E6A5;
    LDA.W EnemyData.work0,X                                              ;A3E6A7;
    EOR.W #$FFFF                                                         ;A3E6AA;
    INC A                                                                ;A3E6AD;
    STA.W EnemyData.work0,X                                              ;A3E6AE;
    RTL                                                                  ;A3E6B1;


.properties:
    CMP.W #$0002                                                         ;A3E6B2;
    BNE .return                                                          ;A3E6B5;
    LDA.W EnemyData.work1,X                                              ;A3E6B7;
    EOR.W #$FFFF                                                         ;A3E6BA;
    INC A                                                                ;A3E6BD;
    STA.W EnemyData.work1,X                                              ;A3E6BE;

.return:
    RTL                                                                  ;A3E6C1;


MainAI_Crawlers:
    LDX.W $0E54                                                          ;A3E6C2;
    JMP.W ($0FB2,X)                                                      ;A3E6C5;


Function_Crawlers_CrawlingVertically:
    LDA.W $1840                                                          ;A3E6C8;
    CMP.W #$001E                                                         ;A3E6CB;
    BNE .noQuake                                                         ;A3E6CE;
    LDA.W $183E                                                          ;A3E6D0;
    CMP.W #$0014                                                         ;A3E6D3;
    BNE .noQuake                                                         ;A3E6D6;
    LDA.W EnemyData.work5,X                                              ;A3E6D8;
    STA.L $7E7806,X                                                      ;A3E6DB;
    LDA.W #Function_Crawlers_Falling                                     ;A3E6DF;
    STA.W EnemyData.work5,X                                              ;A3E6E2;

.noQuake:
    STZ.B $12                                                            ;A3E6E5;
    STZ.B $14                                                            ;A3E6E7;
    LDA.W EnemyData.work0,X                                              ;A3E6E9;
    BPL .positive                                                        ;A3E6EC;
    DEC.B $14                                                            ;A3E6EE;

.positive:
    STA.B $13                                                            ;A3E6F0;
    LDA.B $14                                                            ;A3E6F2;
    BPL .inc                                                             ;A3E6F4;
    DEC A                                                                ;A3E6F6;
    BRA .moveRight                                                       ;A3E6F7;


.inc:
    INC A                                                                ;A3E6F9;

.moveRight:
    STA.B $14                                                            ;A3E6FA;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3E6FC;
    BCC .outsideTurn                                                     ;A3E700;
    LDA.W #$0000                                                         ;A3E702;
    STA.L $7E7808,X                                                      ;A3E705;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3E709;
    STZ.B $12                                                            ;A3E70D;
    STZ.B $14                                                            ;A3E70F;
    LDA.W EnemyData.work1,X                                              ;A3E711;
    BPL .moveDown                                                        ;A3E714;
    DEC.B $14                                                            ;A3E716;

.moveDown:
    STA.B $13                                                            ;A3E718;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E71A;
    BCS .insideTurn                                                      ;A3E71E;
    RTL                                                                  ;A3E720;


.insideTurn:
    LDA.W EnemyData.work0,X                                              ;A3E721;
    EOR.W #$FFFF                                                         ;A3E724;
    INC A                                                                ;A3E727;
    STA.W EnemyData.work0,X                                              ;A3E728;
    LDY.W EnemyData.initParam1,X                                         ;A3E72B;
    LDA.W EnemyData.work1,X                                              ;A3E72E;
    BPL .insideTurn_up                                                   ;A3E731;
    LDA.W CrawlersInstListPointerTable_upsideDown,Y                      ;A3E733;
    BRA +                                                                ;A3E736;


.insideTurn_up:
    LDA.W CrawlersInstListPointerTable_upsideUp,Y                        ;A3E738;

  + STA.W EnemyData.pInstList,X                                          ;A3E73B;
    LDA.W #$0001                                                         ;A3E73E;
    STA.W EnemyData.instTimer,X                                          ;A3E741;
    RTL                                                                  ;A3E744;


.outsideTurn:
    LDA.L $7E7808,X                                                      ;A3E745;
    INC A                                                                ;A3E749;
    STA.L $7E7808,X                                                      ;A3E74A;
    CMP.W #$0004                                                         ;A3E74E;
    BMI .negate                                                          ;A3E751;
    LDA.W EnemyData.work5,X                                              ;A3E753;
    STA.L $7E7806,X                                                      ;A3E756;
    LDA.W #Function_Crawlers_Falling                                     ;A3E75A;
    STA.W EnemyData.work5,X                                              ;A3E75D;
    RTL                                                                  ;A3E760;


.negate:
    LDA.W EnemyData.work1,X                                              ;A3E761;
    EOR.W #$FFFF                                                         ;A3E764;
    INC A                                                                ;A3E767;
    STA.W EnemyData.work1,X                                              ;A3E768;
    LDY.W EnemyData.initParam1,X                                         ;A3E76B;
    LDA.W EnemyData.work1,X                                              ;A3E76E;
    BPL .positiveYVelocity                                               ;A3E771;
    LDA.W CrawlersInstListPointerTable_upsideDown,Y                      ;A3E773;
    BRA .outsideTurn_up                                                  ;A3E776;


.positiveYVelocity:
    LDA.W CrawlersInstListPointerTable_upsideUp,Y                        ;A3E778;

.outsideTurn_up:
    STA.W EnemyData.pInstList,X                                          ;A3E77B;
    LDA.W #$0001                                                         ;A3E77E;
    STA.W EnemyData.instTimer,X                                          ;A3E781;
    RTL                                                                  ;A3E784;


Function_Crawlers_Falling:
    LDA.L $7E7802,X                                                      ;A3E785;
    STA.B $12                                                            ;A3E789;
    LDA.L $7E7804,X                                                      ;A3E78B;
    STA.B $14                                                            ;A3E78F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E791;
    BCC .noCollision                                                     ;A3E795;
    LDA.W EnemyData.initParam0,X                                         ;A3E797;
    CMP.W #$00FF                                                         ;A3E79A;
    BNE .skipSpeed                                                       ;A3E79D;
    LDA.W #$0080                                                         ;A3E79F;
    STA.W EnemyData.work0,X                                              ;A3E7A2;
    STA.W EnemyData.work1,X                                              ;A3E7A5;

.skipSpeed:
    LDA.W #$0000                                                         ;A3E7A8;
    STA.L $7E7802,X                                                      ;A3E7AB;
    STA.L $7E7804,X                                                      ;A3E7AF;
    STA.L $7E7808,X                                                      ;A3E7B3;
    LDA.L $7E7806,X                                                      ;A3E7B7;
    STA.W EnemyData.work5,X                                              ;A3E7BB;
    RTL                                                                  ;A3E7BE;


.noCollision:
    LDA.L $7E7804,X                                                      ;A3E7BF;
    CMP.W #$0004                                                         ;A3E7C3;
    BPL .fallSpeedCapped                                                 ;A3E7C6;
    LDA.L $7E7802,X                                                      ;A3E7C8;
    CLC                                                                  ;A3E7CC;
    ADC.W #$8000                                                         ;A3E7CD;
    STA.L $7E7802,X                                                      ;A3E7D0;
    LDA.L $7E7804,X                                                      ;A3E7D4;
    ADC.W #$0000                                                         ;A3E7D8;
    STA.L $7E7804,X                                                      ;A3E7DB;

.fallSpeedCapped:
    LDA.L $7E7802,X                                                      ;A3E7DF;
    BNE .return                                                          ;A3E7E3;
    LDA.L $7E7804,X                                                      ;A3E7E5;
    BNE .return                                                          ;A3E7E9;
    LDA.W #Function_Crawlers_CrawlingVertically                          ;A3E7EB;
    STA.W EnemyData.work5,X                                              ;A3E7EE;

.return:
    RTL                                                                  ;A3E7F1;


Function_Crawlers_CrawlingHorizontally:
    LDA.W $1840                                                          ;A3E7F2;
    CMP.W #$001E                                                         ;A3E7F5;
    BNE .noQuake                                                         ;A3E7F8;
    LDA.W $183E                                                          ;A3E7FA;
    CMP.W #$0014                                                         ;A3E7FD;
    BNE .noQuake                                                         ;A3E800;
    LDA.W EnemyData.work5,X                                              ;A3E802;
    STA.L $7E7806,X                                                      ;A3E805;
    LDA.W #Function_Crawlers_Falling                                     ;A3E809;
    STA.W EnemyData.work5,X                                              ;A3E80C;

.noQuake:
    STZ.B $12                                                            ;A3E80F;
    STZ.B $14                                                            ;A3E811;
    LDA.W EnemyData.work1,X                                              ;A3E813;
    BPL .positive                                                        ;A3E816;
    DEC.B $14                                                            ;A3E818;

.positive:
    STA.B $13                                                            ;A3E81A;
    LDA.B $14                                                            ;A3E81C;
    BPL .inc                                                             ;A3E81E;
    DEC A                                                                ;A3E820;
    BRA .moveDown                                                        ;A3E821;


.inc:
    INC A                                                                ;A3E823;

.moveDown:
    STA.B $14                                                            ;A3E824;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3E826;
    BCC .outsideTurn                                                     ;A3E82A;
    LDA.W #$0000                                                         ;A3E82C;
    STA.L $7E7808,X                                                      ;A3E82F;
    JSR.W AdjustEnemyXVelocityForSlopes                                  ;A3E833;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3E836;
    BCS .insideTurn                                                      ;A3E83A;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A3E83C;
    RTL                                                                  ;A3E840;


.insideTurn:
    LDA.W EnemyData.work1,X                                              ;A3E841;
    EOR.W #$FFFF                                                         ;A3E844;
    INC A                                                                ;A3E847;
    STA.W EnemyData.work1,X                                              ;A3E848;
    LDY.W EnemyData.initParam1,X                                         ;A3E84B;
    LDA.W EnemyData.work0,X                                              ;A3E84E;
    BPL ..left                                                           ;A3E851;
    LDA.W CrawlersInstListPointerTable_upsideRight,Y                     ;A3E853;
    BRA +                                                                ;A3E856;


..left:
    LDA.W CrawlersInstListPointerTable_upsideLeft,Y                      ;A3E858;

  + STA.W EnemyData.pInstList,X                                          ;A3E85B;
    LDA.W #$0001                                                         ;A3E85E;
    STA.W EnemyData.instTimer,X                                          ;A3E861;
    RTL                                                                  ;A3E864;


.outsideTurn:
    LDA.L $7E7808,X                                                      ;A3E865;
    INC A                                                                ;A3E869;
    STA.L $7E7808,X                                                      ;A3E86A;
    CMP.W #$0004                                                         ;A3E86E;
    BMI .notFalling                                                      ;A3E871;
    LDA.W EnemyData.work5,X                                              ;A3E873;
    STA.L $7E7806,X                                                      ;A3E876;
    LDA.W #Function_Crawlers_Falling                                     ;A3E87A;
    STA.W EnemyData.work5,X                                              ;A3E87D;
    RTL                                                                  ;A3E880;


.notFalling:
    LDA.W EnemyData.work0,X                                              ;A3E881;
    EOR.W #$FFFF                                                         ;A3E884;
    INC A                                                                ;A3E887;
    STA.W EnemyData.work0,X                                              ;A3E888;
    LDY.W EnemyData.initParam1,X                                         ;A3E88B;
    LDA.W EnemyData.work0,X                                              ;A3E88E;
    BPL .outsideTurn_left                                                ;A3E891;
    LDA.W CrawlersInstListPointerTable_upsideRight,Y                     ;A3E893;
    BRA +                                                                ;A3E896;


.outsideTurn_left:
    LDA.W CrawlersInstListPointerTable_upsideLeft,Y                      ;A3E898;

  + STA.W EnemyData.pInstList,X                                          ;A3E89B;
    LDA.W #$0001                                                         ;A3E89E;
    STA.W EnemyData.instTimer,X                                          ;A3E8A1;
    RTL                                                                  ;A3E8A4;


AdjustEnemyXVelocityForSlopes:
    LDA.W EnemyData.xPosition,X                                          ;A3E8A5;
    PHA                                                                  ;A3E8A8;
    LDA.W EnemyData.yPosition,X                                          ;A3E8A9;
    BIT.W EnemyData.work1,X                                              ;A3E8AC;
    BPL .negativeYVelocity                                               ;A3E8AF;
    SEC                                                                  ;A3E8B1;
    SBC.W EnemyData.yHitboxRadius,X                                      ;A3E8B2;
    BRA .positiveYVelocity                                               ;A3E8B5;


.negativeYVelocity:
    CLC                                                                  ;A3E8B7;
    ADC.W EnemyData.yHitboxRadius,X                                      ;A3E8B8;
    DEC A                                                                ;A3E8BB;

.positiveYVelocity:
    PHA                                                                  ;A3E8BC;
    JSL.L CalculateTheBlockContainingAPixelPosition                      ;A3E8BD;
    LDA.W $0DC4                                                          ;A3E8C1;
    ASL A                                                                ;A3E8C4;
    TAX                                                                  ;A3E8C5;
    LDA.L $7F0002,X                                                      ;A3E8C6;
    AND.W #$F000                                                         ;A3E8CA;
    CMP.W #$1000                                                         ;A3E8CD;
    BNE .normalSpeed                                                     ;A3E8D0;
    LDX.W $0DC4                                                          ;A3E8D2;
    LDA.L $7F6402,X                                                      ;A3E8D5;
    AND.W #$001F                                                         ;A3E8D9;
    CMP.W #$0005                                                         ;A3E8DC;
    BCC .normalSpeed                                                     ;A3E8DF;
    ASL A                                                                ;A3E8E1;
    ASL A                                                                ;A3E8E2;
    TAX                                                                  ;A3E8E3;
    LDY.W .adjustedSpeedMultiplier,X                                     ;A3E8E4;
    LDX.W $0E54                                                          ;A3E8E7;
    LDA.W EnemyData.work0,X                                              ;A3E8EA;
    BPL .multiply                                                        ;A3E8ED;
    EOR.W #$FFFF                                                         ;A3E8EF;
    INC A                                                                ;A3E8F2;
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;A3E8F3;
    LDA.W $05F1                                                          ;A3E8F7;
    EOR.W #$FFFF                                                         ;A3E8FA;
    CLC                                                                  ;A3E8FD;
    ADC.W #$0001                                                         ;A3E8FE;
    STA.B $12                                                            ;A3E901;
    LDA.W $05F3                                                          ;A3E903;
    EOR.W #$FFFF                                                         ;A3E906;
    ADC.W #$0000                                                         ;A3E909;
    STA.B $14                                                            ;A3E90C;
    RTS                                                                  ;A3E90E;


.multiply:
    JSL.L A_Y_16bit_UnsignedMultiplication                               ;A3E90F;
    LDA.W $05F1                                                          ;A3E913;
    STA.B $12                                                            ;A3E916;
    LDA.W $05F3                                                          ;A3E918;
    STA.B $14                                                            ;A3E91B;
    RTS                                                                  ;A3E91D;


.normalSpeed:
    LDX.W $0E54                                                          ;A3E91E;
    STZ.B $12                                                            ;A3E921;
    STZ.B $14                                                            ;A3E923;
    LDA.W EnemyData.work0,X                                              ;A3E925;
    BPL +                                                                ;A3E928;
    DEC.B $14                                                            ;A3E92A;

  + STA.B $13                                                            ;A3E92C;
    RTS                                                                  ;A3E92E;


.additiveSpeedMultiplier:
    dw $0000                                                             ;A3E92F;

.adjustedSpeedMultiplier:
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000                   ;A3E931;
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000                   ;A3E941;
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000                   ;A3E951;
    dw $0100,$0000,$0100,$1000,$00B0,$1000,$00B0,$0000                   ;A3E961;
    dw $0100,$0000,$0100,$1000,$00C0,$0000,$0100,$1000                   ;A3E971;
    dw $00C0,$1000,$00C0,$0800,$00D8,$0800,$00D8,$0600                   ;A3E981;
    dw $00F0,$0600,$00F0,$0600,$00F0,$4000,$0080,$4000                   ;A3E991;
    dw $0080,$6000,$0050,$6000,$0050,$6000,$0050                         ;A3E9A1;

Palette_Metroid:
    dw $3800,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014                   ;A3E9AF;
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0                   ;A3E9BF;

InstList_Metroid_ChasingSamus:
    dw $0010                                                             ;A3E9CF;
    dw Spritemap_Metroid_Insides_0                                       ;A3E9D1;
    dw $0010                                                             ;A3E9D3;
    dw Spritemap_Metroid_Insides_1                                       ;A3E9D5;
    dw $0006                                                             ;A3E9D7;
    dw Spritemap_Metroid_Insides_2                                       ;A3E9D9;
    dw $000A                                                             ;A3E9DB;
    dw Spritemap_Metroid_Insides_3                                       ;A3E9DD;
    dw $0010                                                             ;A3E9DF;
    dw Spritemap_Metroid_Insides_1                                       ;A3E9E1;
    dw $0010                                                             ;A3E9E3;
    dw Spritemap_Metroid_Insides_0                                       ;A3E9E5;
    dw $0010                                                             ;A3E9E7;
    dw Spritemap_Metroid_Insides_1                                       ;A3E9E9;
    dw $0006                                                             ;A3E9EB;
    dw Spritemap_Metroid_Insides_2                                       ;A3E9ED;
    dw $000A                                                             ;A3E9EF;
    dw Spritemap_Metroid_Insides_3                                       ;A3E9F1;
    dw $0010                                                             ;A3E9F3;
    dw Spritemap_Metroid_Insides_1                                       ;A3E9F5;
    dw $0010                                                             ;A3E9F7;
    dw Spritemap_Metroid_Insides_0                                       ;A3E9F9;
    dw $0010                                                             ;A3E9FB;
    dw Spritemap_Metroid_Insides_1                                       ;A3E9FD;
    dw $0006                                                             ;A3E9FF;
    dw Spritemap_Metroid_Insides_2                                       ;A3EA01;
    dw $000A                                                             ;A3EA03;
    dw Spritemap_Metroid_Insides_3                                       ;A3EA05;
    dw $0010                                                             ;A3EA07;
    dw Spritemap_Metroid_Insides_1                                       ;A3EA09;
    dw $0010                                                             ;A3EA0B;
    dw Spritemap_Metroid_Insides_0                                       ;A3EA0D;
    dw $0010                                                             ;A3EA0F;
    dw Spritemap_Metroid_Insides_1                                       ;A3EA11;
    dw $0006                                                             ;A3EA13;
    dw Spritemap_Metroid_Insides_2                                       ;A3EA15;
    dw $000A                                                             ;A3EA17;
    dw Spritemap_Metroid_Insides_3                                       ;A3EA19;
    dw $0010                                                             ;A3EA1B;
    dw Spritemap_Metroid_Insides_1                                       ;A3EA1D;
    dw Instruction_Metroid_PlayRandomMetroidSFX                          ;A3EA1F;
    dw Instruction_Common_GotoY                                          ;A3EA21;
    dw InstList_Metroid_ChasingSamus                                     ;A3EA23;

InstList_Metroid_DrainingSamus:
    dw $0010                                                             ;A3EA25;
    dw Spritemap_Metroid_Insides_0                                       ;A3EA27;
    dw $0010                                                             ;A3EA29;
    dw Spritemap_Metroid_Insides_1                                       ;A3EA2B;
    dw $0006                                                             ;A3EA2D;
    dw Spritemap_Metroid_Insides_2                                       ;A3EA2F;
    dw $000A                                                             ;A3EA31;
    dw Spritemap_Metroid_Insides_3                                       ;A3EA33;
    dw $0010                                                             ;A3EA35;
    dw Spritemap_Metroid_Insides_1                                       ;A3EA37;
    dw Instruction_Metroid_PlayDrainingSamusSFX                          ;A3EA39;
    dw Instruction_Common_GotoY                                          ;A3EA3B;
    dw InstList_Metroid_DrainingSamus                                    ;A3EA3D;

BombedOffVelocities_X:
    dw $0002,$0000,$FFFE,$0000                                           ;A3EA3F;

BombedOffVelocities_Y:
    dw $0000,$FFFE,$0000,$0002                                           ;A3EA47;

InitAI_Metroid:
    LDX.W $0E54                                                          ;A3EA4F;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EA52;
    STA.W EnemyData.pInstList,X                                          ;A3EA55;
    LDA.W EnemyData.palette,X                                            ;A3EA58;
    ORA.W EnemyData.gfxOffset,X                                          ;A3EA5B;
    STA.B $18                                                            ;A3EA5E;
    LDA.W EnemyData.xPosition,X                                          ;A3EA60;
    STA.B $12                                                            ;A3EA63;
    LDA.W EnemyData.yPosition,X                                          ;A3EA65;
    STA.B $14                                                            ;A3EA68;
    LDA.W #$0032                                                         ;A3EA6A;
    STA.B $16                                                            ;A3EA6D;
    JSL.L Create_Sprite_Object                                           ;A3EA6F;
    LDA.B $12                                                            ;A3EA73;
    STA.L $7E7800,X                                                      ;A3EA75;
    LDX.W $0E54                                                          ;A3EA79;
    LDA.W EnemyData.palette,X                                            ;A3EA7C;
    ORA.W EnemyData.gfxOffset,X                                          ;A3EA7F;
    STA.B $18                                                            ;A3EA82;
    LDA.W EnemyData.xPosition,X                                          ;A3EA84;
    STA.B $12                                                            ;A3EA87;
    LDA.W EnemyData.yPosition,X                                          ;A3EA89;
    STA.B $14                                                            ;A3EA8C;
    LDA.W #$0034                                                         ;A3EA8E;
    STA.B $16                                                            ;A3EA91;
    JSL.L Create_Sprite_Object                                           ;A3EA93;
    LDA.B $12                                                            ;A3EA97;
    STA.L $7E7802,X                                                      ;A3EA99;
    LDA.W #$0000                                                         ;A3EA9D;
    STA.L $7E7804,X                                                      ;A3EAA0;
    RTL                                                                  ;A3EAA4;


Instruction_Metroid_PlayDrainingSamusSFX:
    PHX                                                                  ;A3EAA5;
    PHY                                                                  ;A3EAA6;
    LDA.W #$0050                                                         ;A3EAA7;
    JSL.L QueueSound_Lib2_Max6                                           ;A3EAAA;
    PLY                                                                  ;A3EAAE;
    PLX                                                                  ;A3EAAF;
    RTL                                                                  ;A3EAB0;


Instruction_Metroid_PlayRandomMetroidSFX:
    PHX                                                                  ;A3EAB1;
    PHY                                                                  ;A3EAB2;
    JSL.L GenerateRandomNumber                                           ;A3EAB3;
    AND.W #$0007                                                         ;A3EAB7;
    ASL A                                                                ;A3EABA;
    TAX                                                                  ;A3EABB;
    LDA.W .SFX,X                                                         ;A3EABC;
    JSL.L QueueSound_Lib2_Max6                                           ;A3EABF;
    PLY                                                                  ;A3EAC3;
    PLX                                                                  ;A3EAC4;
    RTL                                                                  ;A3EAC5;


.unused:
    dw $00B4,$00BE,$00C8,$00D2,$00DC,$00E6,$00F0,$00FA                   ;A3EAC6;

.SFX:
    dw $0050,$0058,$005A,$0050,$0058,$005A,$0058,$005A                   ;A3EAD6;

FrozenAI_Metroid:
    JSL.L CommonA3_NormalEnemyFrozenAI                                   ;A3EAE6;
    LDX.W $0E54                                                          ;A3EAEA;
    LDA.W EnemyData.work4,X                                              ;A3EAED;
    BEQ .timerExpired                                                    ;A3EAF0;
    DEC.W EnemyData.work4,X                                              ;A3EAF2;
    LDA.W #$0002                                                         ;A3EAF5;
    STA.W EnemyData.flashTimer,X                                         ;A3EAF8;

.timerExpired:
    LDA.L $7E7800,X                                                      ;A3EAFB;
    TAX                                                                  ;A3EAFF;
    LDA.W #$0C00                                                         ;A3EB00;
    STA.L $7EF078,X                                                      ;A3EB03;
    LDA.W #$0001                                                         ;A3EB07;
    STA.L $7EF2F8,X                                                      ;A3EB0A;
    LDA.W #InstList_SpriteObject_32_MetroidElectricity                   ;A3EB0E;
    STA.L $7EEF78,X                                                      ;A3EB11;
    LDX.W $0E54                                                          ;A3EB15;
    LDA.L $7E7802,X                                                      ;A3EB18;
    TAX                                                                  ;A3EB1C;
    LDA.W #$0C00                                                         ;A3EB1D;
    STA.L $7EF078,X                                                      ;A3EB20;
    LDA.W #$0001                                                         ;A3EB24;
    STA.L $7EF2F8,X                                                      ;A3EB27;
    LDA.W #InstList_SpriteObject_34_MetroidShell                         ;A3EB2B;
    STA.L $7EEF78,X                                                      ;A3EB2E;
    RTL                                                                  ;A3EB32;


HurtAI_Metroid:
    LDX.W $0E54                                                          ;A3EB33;
    LDY.W #$F1FF                                                         ;A3EB36; >.<
    LDA.W EnemyData.flashTimer,X                                         ;A3EB39;
    BIT.W #$0002                                                         ;A3EB3C;
    BEQ .flash                                                           ;A3EB3F;
    LDA.W EnemyData.palette,X                                            ;A3EB41;
    STA.B $12                                                            ;A3EB44;
    LDX.W $0E54                                                          ;A3EB46;
    LDA.L $7E7800,X                                                      ;A3EB49;
    TAX                                                                  ;A3EB4D;
    LDA.L $7EF078,X                                                      ;A3EB4E;
    AND.W #$F1FF                                                         ;A3EB52;
    ORA.B $12                                                            ;A3EB55;
    STA.L $7EF078,X                                                      ;A3EB57;
    LDX.W $0E54                                                          ;A3EB5B;
    LDA.L $7E7802,X                                                      ;A3EB5E;
    TAX                                                                  ;A3EB62;
    LDA.L $7EF078,X                                                      ;A3EB63;
    AND.W #$F1FF                                                         ;A3EB67;
    ORA.B $12                                                            ;A3EB6A;
    STA.L $7EF078,X                                                      ;A3EB6C;
    RTL                                                                  ;A3EB70;


.flash:
    LDX.W $0E54                                                          ;A3EB71;
    LDA.L $7E7800,X                                                      ;A3EB74;
    TAX                                                                  ;A3EB78;
    LDA.L $7EF078,X                                                      ;A3EB79;
    AND.W #$F1FF                                                         ;A3EB7D;
    STA.L $7EF078,X                                                      ;A3EB80;
    LDX.W $0E54                                                          ;A3EB84;
    LDA.L $7E7802,X                                                      ;A3EB87;
    TAX                                                                  ;A3EB8B;
    LDA.L $7EF078,X                                                      ;A3EB8C;
    AND.W #$F1FF                                                         ;A3EB90;
    STA.L $7EF078,X                                                      ;A3EB93;
    RTL                                                                  ;A3EB97;


MainAI_Metroid:
    LDX.W $0E54                                                          ;A3EB98;
    LDA.W $0AFA                                                          ;A3EB9B;
    SEC                                                                  ;A3EB9E;
    SBC.W #$0008                                                         ;A3EB9F;
    STA.W $0E32                                                          ;A3EBA2;
    LDA.W EnemyData.work5,X                                              ;A3EBA5;
    ASL A                                                                ;A3EBA8;
    TAX                                                                  ;A3EBA9;
    JSR.W (.pointers,X)                                                  ;A3EBAA;
    LDA.W EnemyData.palette,X                                            ;A3EBAD;
    ORA.W EnemyData.gfxOffset,X                                          ;A3EBB0;
    STA.B $18                                                            ;A3EBB3;
    LDA.W EnemyData.xPosition,X                                          ;A3EBB5;
    STA.B $12                                                            ;A3EBB8;
    LDA.W EnemyData.yPosition,X                                          ;A3EBBA;
    STA.B $14                                                            ;A3EBBD;
    LDA.L $7E7800,X                                                      ;A3EBBF;
    TAX                                                                  ;A3EBC3;
    LDA.B $12                                                            ;A3EBC4;
    STA.L $7EF0F8,X                                                      ;A3EBC6;
    LDA.B $14                                                            ;A3EBCA;
    STA.L $7EF1F8,X                                                      ;A3EBCC;
    LDA.B $18                                                            ;A3EBD0;
    STA.L $7EF078,X                                                      ;A3EBD2;
    LDA.W #$0000                                                         ;A3EBD6;
    STA.L $7EF2F8,X                                                      ;A3EBD9;
    LDX.W $0E54                                                          ;A3EBDD;
    LDA.W EnemyData.xPosition,X                                          ;A3EBE0;
    STA.B $12                                                            ;A3EBE3;
    LDA.W EnemyData.yPosition,X                                          ;A3EBE5;
    STA.B $14                                                            ;A3EBE8;
    LDA.L $7E7802,X                                                      ;A3EBEA;
    TAX                                                                  ;A3EBEE;
    LDA.B $12                                                            ;A3EBEF;
    STA.L $7EF0F8,X                                                      ;A3EBF1;
    LDA.B $14                                                            ;A3EBF5;
    STA.L $7EF1F8,X                                                      ;A3EBF7;
    LDA.B $18                                                            ;A3EBFB;
    STA.L $7EF078,X                                                      ;A3EBFD;
    LDA.W #$0000                                                         ;A3EC01;
    STA.L $7EF2F8,X                                                      ;A3EC04;
    RTL                                                                  ;A3EC08;


.pointers:
    dw Function_Metroid_0_ChaseSamus                                     ;A3EC09;
    dw Function_Metroid_1_LatchOntoSamus                                 ;A3EC0B;
    dw Function_Metroid_2_LatchedOntoSamus                               ;A3EC0D;
    dw Function_Metroid_3_BombedOffSamus                                 ;A3EC0F;

Function_Metroid_0_ChaseSamus:
    LDX.W $0E54                                                          ;A3EC11;
    STZ.B $12                                                            ;A3EC14;
    STZ.B $14                                                            ;A3EC16;
    LDA.W EnemyData.yPosition,X                                          ;A3EC18;
    SEC                                                                  ;A3EC1B;
    SBC.W $0E32                                                          ;A3EC1C;
    LSR A                                                                ;A3EC1F;
    LSR A                                                                ;A3EC20;
    STA.B $13                                                            ;A3EC21;
    AND.W #$2000                                                         ;A3EC23;
    BEQ +                                                                ;A3EC26;
    LDA.B $14                                                            ;A3EC28;
    ORA.W #$FFC0                                                         ;A3EC2A;
    STA.B $14                                                            ;A3EC2D;

  + LDA.W EnemyData.work2,X                                              ;A3EC2F;
    SEC                                                                  ;A3EC32;
    SBC.B $12                                                            ;A3EC33;
    STA.W EnemyData.work2,X                                              ;A3EC35;
    LDA.W EnemyData.work3,X                                              ;A3EC38;
    SBC.B $14                                                            ;A3EC3B;
    STA.W EnemyData.work3,X                                              ;A3EC3D;
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
    STA.W EnemyData.work3,X                                              ;A3EC54;
    STZ.W EnemyData.work2,X                                              ;A3EC57;

.moveDown:
    LDA.W EnemyData.work2,X                                              ;A3EC5A;
    STA.B $12                                                            ;A3EC5D;
    LDA.W EnemyData.work3,X                                              ;A3EC5F;
    STA.B $14                                                            ;A3EC62;
    LDX.W $0E54                                                          ;A3EC64;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3EC67;
    BCC .notCollidedWithBlock                                            ;A3EC6B;
    LDX.W $0E54                                                          ;A3EC6D;
    STZ.W EnemyData.work2,X                                              ;A3EC70;
    STZ.W EnemyData.work3,X                                              ;A3EC73;

.notCollidedWithBlock:
    LDX.W $0E54                                                          ;A3EC76;
    STZ.B $12                                                            ;A3EC79;
    STZ.B $14                                                            ;A3EC7B;
    LDA.W EnemyData.xPosition,X                                          ;A3EC7D;
    SEC                                                                  ;A3EC80;
    SBC.W $0AF6                                                          ;A3EC81;
    LSR A                                                                ;A3EC84;
    LSR A                                                                ;A3EC85;
    STA.B $13                                                            ;A3EC86;
    AND.W #$2000                                                         ;A3EC88;
    BEQ +                                                                ;A3EC8B;
    LDA.B $14                                                            ;A3EC8D;
    ORA.W #$FFC0                                                         ;A3EC8F;
    STA.B $14                                                            ;A3EC92;

  + LDA.W EnemyData.work0,X                                              ;A3EC94;
    SEC                                                                  ;A3EC97;
    SBC.B $12                                                            ;A3EC98;
    STA.W EnemyData.work0,X                                              ;A3EC9A;
    LDA.W EnemyData.work1,X                                              ;A3EC9D;
    SBC.B $14                                                            ;A3ECA0;
    STA.W EnemyData.work1,X                                              ;A3ECA2;
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
    STA.W EnemyData.work1,X                                              ;A3ECB9;
    STZ.W EnemyData.work0,X                                              ;A3ECBC;

.moveRight:
    LDA.W EnemyData.work0,X                                              ;A3ECBF;
    STA.B $12                                                            ;A3ECC2;
    LDA.W EnemyData.work1,X                                              ;A3ECC4;
    STA.B $14                                                            ;A3ECC7;
    LDX.W $0E54                                                          ;A3ECC9;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3ECCC;
    BCC .return                                                          ;A3ECD0;
    LDX.W $0E54                                                          ;A3ECD2;
    STZ.W EnemyData.work0,X                                              ;A3ECD5;
    STZ.W EnemyData.work1,X                                              ;A3ECD8;

.return:
    RTS                                                                  ;A3ECDB;


Function_Metroid_1_LatchOntoSamus:
    LDX.W $0E54                                                          ;A3ECDC;
    STZ.B $12                                                            ;A3ECDF;
    STZ.B $14                                                            ;A3ECE1;
    LDA.W $0E32                                                          ;A3ECE3;
    SEC                                                                  ;A3ECE6;
    SBC.W EnemyData.yPosition,X                                          ;A3ECE7;
    XBA                                                                  ;A3ECEA;
    AND.W #$FF00                                                         ;A3ECEB;
    LSR A                                                                ;A3ECEE;
    LSR A                                                                ;A3ECEF;
    LSR A                                                                ;A3ECF0;
    STA.B $14                                                            ;A3ECF1;
    AND.W #$1000                                                         ;A3ECF3;
    BEQ +                                                                ;A3ECF6;
    LDA.B $14                                                            ;A3ECF8;
    ORA.W #$E000                                                         ;A3ECFA;
    STA.B $14                                                            ;A3ECFD;

  + LDA.B $14                                                            ;A3ECFF;
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
    STA.B $14                                                            ;A3ED15;
    STZ.B $12                                                            ;A3ED17;

.moveDown:
    LDA.B $12                                                            ;A3ED19;
    STA.W EnemyData.work2,X                                              ;A3ED1B;
    LDA.B $14                                                            ;A3ED1E;
    STA.W EnemyData.work3,X                                              ;A3ED20;
    LDX.W $0E54                                                          ;A3ED23;
    JSL.L MoveEnemyDownBy_14_12                                          ;A3ED26;
    BCC .notCollidedWithBlock                                            ;A3ED2A;
    LDX.W $0E54                                                          ;A3ED2C;
    STZ.W EnemyData.work2,X                                              ;A3ED2F;
    STZ.W EnemyData.work3,X                                              ;A3ED32;

.notCollidedWithBlock:
    LDX.W $0E54                                                          ;A3ED35;
    STZ.B $12                                                            ;A3ED38;
    STZ.B $14                                                            ;A3ED3A;
    LDA.W $0AF6                                                          ;A3ED3C;
    SEC                                                                  ;A3ED3F;
    SBC.W EnemyData.xPosition,X                                          ;A3ED40;
    XBA                                                                  ;A3ED43;
    AND.W #$FF00                                                         ;A3ED44;
    LSR A                                                                ;A3ED47;
    LSR A                                                                ;A3ED48;
    LSR A                                                                ;A3ED49;
    STA.B $14                                                            ;A3ED4A;
    AND.W #$1000                                                         ;A3ED4C;
    BEQ +                                                                ;A3ED4F;
    LDA.B $14                                                            ;A3ED51;
    ORA.W #$E000                                                         ;A3ED53;
    STA.B $14                                                            ;A3ED56;

  + LDA.B $14                                                            ;A3ED58;
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
    STA.B $14                                                            ;A3ED6E;
    STZ.B $12                                                            ;A3ED70;

.moveRight:
    LDA.B $12                                                            ;A3ED72;
    STA.W EnemyData.work0,X                                              ;A3ED74;
    LDA.B $14                                                            ;A3ED77;
    STA.W EnemyData.work1,X                                              ;A3ED79;
    LDX.W $0E54                                                          ;A3ED7C;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A3ED7F;
    BCC .return                                                          ;A3ED83;
    LDX.W $0E54                                                          ;A3ED85;
    STZ.W EnemyData.work0,X                                              ;A3ED88;
    STZ.W EnemyData.work1,X                                              ;A3ED8B;

.return:
    RTS                                                                  ;A3ED8E;


Function_Metroid_2_LatchedOntoSamus:
    LDX.W $0E54                                                          ;A3ED8F;
    LDA.W $0AF6                                                          ;A3ED92;
    STA.W EnemyData.xPosition,X                                          ;A3ED95;
    LDA.W $0E32                                                          ;A3ED98;
    STA.W EnemyData.yPosition,X                                          ;A3ED9B;
    STZ.W EnemyData.work0,X                                              ;A3ED9E;
    STZ.W EnemyData.work1,X                                              ;A3EDA1;
    STZ.W EnemyData.work2,X                                              ;A3EDA4;
    STZ.W EnemyData.work3,X                                              ;A3EDA7;
    RTS                                                                  ;A3EDAA;


Function_Metroid_3_BombedOffSamus:
    LDX.W $0E54                                                          ;A3EDAB;
    LDA.W EnemyData.work4,X                                              ;A3EDAE;
    AND.W #$0003                                                         ;A3EDB1;
    ASL A                                                                ;A3EDB4;
    TAY                                                                  ;A3EDB5;
    LDA.W EnemyData.xPosition,X                                          ;A3EDB6;
    CLC                                                                  ;A3EDB9;
    ADC.W BombedOffVelocities_X,Y                                        ;A3EDBA;
    STA.W EnemyData.xPosition,X                                          ;A3EDBD;
    LDA.W EnemyData.yPosition,X                                          ;A3EDC0;
    CLC                                                                  ;A3EDC3;
    ADC.W BombedOffVelocities_Y,Y                                        ;A3EDC4;
    STA.W EnemyData.yPosition,X                                          ;A3EDC7;
    STZ.W EnemyData.work0,X                                              ;A3EDCA;
    STZ.W EnemyData.work1,X                                              ;A3EDCD;
    STZ.W EnemyData.work2,X                                              ;A3EDD0;
    STZ.W EnemyData.work3,X                                              ;A3EDD3;
    DEC.W EnemyData.work4,X                                              ;A3EDD6;
    BNE .return                                                          ;A3EDD9;
    STZ.W EnemyData.work5,X                                              ;A3EDDB;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EDDE;
    STA.W EnemyData.pInstList,X                                          ;A3EDE1;
    LDA.W #$0001                                                         ;A3EDE4;
    STA.W EnemyData.instTimer,X                                          ;A3EDE7;

.return:
    RTS                                                                  ;A3EDEA;


EnemyTouch_Metroid:
    LDA.W $0AFA                                                          ;A3EDEB;
    SEC                                                                  ;A3EDEE;
    SBC.W #$0008                                                         ;A3EDEF;
    STA.W $0E32                                                          ;A3EDF2;
    LDA.W $0A6E                                                          ;A3EDF5;
    BEQ .normal                                                          ;A3EDF8;
    LDX.W $0E54                                                          ;A3EDFA;
    LDA.W EnemyData.work5,X                                              ;A3EDFD;
    CMP.W #$0002                                                         ;A3EE00;
    BEQ .return                                                          ;A3EE03;
    STZ.W EnemyData.work0,X                                              ;A3EE05;
    STZ.W EnemyData.work2,X                                              ;A3EE08;
    LDY.W #$0000                                                         ;A3EE0B;
    LDA.W EnemyData.xPosition,X                                          ;A3EE0E;
    SEC                                                                  ;A3EE11;
    SBC.W $0AF6                                                          ;A3EE12;
    BPL +                                                                ;A3EE15;
    LDY.W #$FF00                                                         ;A3EE17;

  + PHA                                                                  ;A3EE1A;
    TYA                                                                  ;A3EE1B;
    STA.W EnemyData.work1,X                                              ;A3EE1C;
    PLA                                                                  ;A3EE1F;
    ASL A                                                                ;A3EE20;
    ASL A                                                                ;A3EE21;
    ASL A                                                                ;A3EE22;
    ASL A                                                                ;A3EE23;
    ASL A                                                                ;A3EE24;
    ASL A                                                                ;A3EE25;
    STA.W EnemyData.work0+1,X                                            ;A3EE26;
    LDY.W #$0000                                                         ;A3EE29;
    LDA.W EnemyData.yPosition,X                                          ;A3EE2C;
    SEC                                                                  ;A3EE2F;
    SBC.W $0E32                                                          ;A3EE30;
    BPL +                                                                ;A3EE33;
    LDY.W #$FF00                                                         ;A3EE35;

  + PHA                                                                  ;A3EE38;
    TYA                                                                  ;A3EE39;
    STA.W EnemyData.work3,X                                              ;A3EE3A;
    PLA                                                                  ;A3EE3D;
    ASL A                                                                ;A3EE3E;
    ASL A                                                                ;A3EE3F;
    ASL A                                                                ;A3EE40;
    ASL A                                                                ;A3EE41;
    ASL A                                                                ;A3EE42;
    ASL A                                                                ;A3EE43;
    STA.W EnemyData.work2+1,X                                            ;A3EE44;
    STZ.W EnemyData.work5,X                                              ;A3EE47;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EE4A;
    STA.W EnemyData.pInstList,X                                          ;A3EE4D;
    LDA.W #$0001                                                         ;A3EE50;
    STA.W EnemyData.instTimer,X                                          ;A3EE53;

.return:
    RTL                                                                  ;A3EE56;


.normal:
    LDX.W $0E54                                                          ;A3EE57;
    LDA.W EnemyData.work5,X                                              ;A3EE5A;
    CMP.W #$0003                                                         ;A3EE5D;
    BEQ +                                                                ;A3EE60;
    LDA.W $0E44                                                          ;A3EE62;
    AND.W #$0007                                                         ;A3EE65;
    CMP.W #$0007                                                         ;A3EE68;
    BNE .skipSFX                                                         ;A3EE6B;
    LDA.W Equipment.currentEnergy                                        ;A3EE6D;
    CMP.W #$001E                                                         ;A3EE70;
    BMI .skipSFX                                                         ;A3EE73;
    LDA.W #$002D                                                         ;A3EE75;
    JSL.L QueueSound_Lib3_Max6                                           ;A3EE78;

.skipSFX:
    JSR.W DealMetroidContactDamageToSamus                                ;A3EE7C;

  + LDA.W EnemyData.work5,X                                              ;A3EE7F;
    CMP.W #$0002                                                         ;A3EE82;
    BCS .return                                                          ;A3EE85;
    LDY.W #$0001                                                         ;A3EE87;
    LDA.W EnemyData.xPosition,X                                          ;A3EE8A;
    SEC                                                                  ;A3EE8D;
    SBC.W $0AF6                                                          ;A3EE8E;
    BPL +                                                                ;A3EE91;
    EOR.W #$FFFF                                                         ;A3EE93;
    INC A                                                                ;A3EE96;

  + CMP.W #$0008                                                         ;A3EE97;
    BCS .setFunction                                                     ;A3EE9A;
    LDA.W EnemyData.yPosition,X                                          ;A3EE9C;
    SEC                                                                  ;A3EE9F;
    SBC.W $0E32                                                          ;A3EEA0;
    BPL +                                                                ;A3EEA3;
    EOR.W #$FFFF                                                         ;A3EEA5;
    INC A                                                                ;A3EEA8;

  + CMP.W #$0008                                                         ;A3EEA9;
    BCS .setFunction                                                     ;A3EEAC;
    LDY.W #$0002                                                         ;A3EEAE;
    LDA.W #$0012                                                         ;A3EEB1;
    JSL.L Run_Samus_Command                                              ;A3EEB4;

.setFunction:
    TYA                                                                  ;A3EEB8;
    STA.W EnemyData.work5,X                                              ;A3EEB9;
    CMP.W #$0002                                                         ;A3EEBC;
    BNE .return                                                          ;A3EEBF;
    LDA.W #InstList_Metroid_DrainingSamus                                ;A3EEC1;
    STA.W EnemyData.pInstList,X                                          ;A3EEC4;
    LDA.W #$0001                                                         ;A3EEC7;
    STA.W EnemyData.instTimer,X                                          ;A3EECA;
    RTL                                                                  ;A3EECD;


DealMetroidContactDamageToSamus:
    LDA.W $0AFA                                                          ;A3EECE;
    SEC                                                                  ;A3EED1;
    SBC.W #$0008                                                         ;A3EED2;
    STA.W $0E32                                                          ;A3EED5;
    LDA.W Equipment.equippedItems                                        ;A3EED8;
    BIT.W #$0020                                                         ;A3EEDB;
    BNE .gravitySuit                                                     ;A3EEDE;
    LSR A                                                                ;A3EEE0;
    BCC .powerSuit                                                       ;A3EEE1;
    LDA.W #$6000                                                         ;A3EEE3;
    BRA .merge                                                           ;A3EEE6;


.gravitySuit:
    LDA.W #$3000                                                         ;A3EEE8;
    BRA .merge                                                           ;A3EEEB;


.powerSuit:
    LDA.W #$C000                                                         ;A3EEED;

.merge:
    STA.B $12                                                            ;A3EEF0;
    LDA.L $7E7804,X                                                      ;A3EEF2;
    SEC                                                                  ;A3EEF6;
    SBC.B $12                                                            ;A3EEF7;
    STA.L $7E7804,X                                                      ;A3EEF9;
    BCS .return                                                          ;A3EEFD;
    LDA.W #$0001                                                         ;A3EEFF;
    JSL.L Deal_A_Damage_to_Samus                                         ;A3EF02;

.return:
    RTS                                                                  ;A3EF06;


EnemyShot_Metroid:
    LDA.W $0AFA                                                          ;A3EF07;
    SEC                                                                  ;A3EF0A;
    SBC.W #$0008                                                         ;A3EF0B;
    STA.W $0E32                                                          ;A3EF0E;
    LDA.W $18A6                                                          ;A3EF11;
    ASL A                                                                ;A3EF14;
    TAY                                                                  ;A3EF15;
    LDX.W $0E54                                                          ;A3EF16;
    LDA.W EnemyData.freezeTimer,X                                        ;A3EF19;
    BEQ .notFrozen                                                       ;A3EF1C;
    LDA.W $0C18,Y                                                        ;A3EF1E;
    AND.W #$0F00                                                         ;A3EF21;
    CMP.W #$0100                                                         ;A3EF24;
    BEQ .missile                                                         ;A3EF27;
    CMP.W #$0200                                                         ;A3EF29;
    BNE .returnUpper                                                     ;A3EF2C;

.missile:
    LDA.W EnemyData.xPosition,X                                          ;A3EF2E;
    STA.L $7EF434                                                        ;A3EF31;
    LDA.W EnemyData.yPosition,X                                          ;A3EF35;
    STA.L $7EF436                                                        ;A3EF38;
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic     ;A3EF3C;
    LDA.W EnemyData.health,X                                             ;A3EF40;
    BNE .returnUpper                                                     ;A3EF43;
    STZ.W EnemyData.work1,X                                              ;A3EF45;
    LDA.W #$0004                                                         ;A3EF48;
    JSL.L EnemyDeath                                                     ;A3EF4B;
    LDA.W #$0013                                                         ;A3EF4F;
    JSL.L Run_Samus_Command                                              ;A3EF52;
    LDX.W $0E54                                                          ;A3EF56;
    LDA.L $7E7800,X                                                      ;A3EF59;
    TAX                                                                  ;A3EF5D;
    LDA.W #$0000                                                         ;A3EF5E;
    STA.L $7EEF78,X                                                      ;A3EF61;
    LDX.W $0E54                                                          ;A3EF65;
    LDA.L $7E7802,X                                                      ;A3EF68;
    TAX                                                                  ;A3EF6C;
    LDA.W #$0000                                                         ;A3EF6D;
    STA.L $7EEF78,X                                                      ;A3EF70;
    JSL.L MetroidDeathItemDropRoutine                                    ;A3EF74;

.returnUpper:
    RTL                                                                  ;A3EF78;


.notFrozen:
    LDA.W EnemyData.work5,X                                              ;A3EF79;
    CMP.W #$0002                                                         ;A3EF7C;
    BNE .notLatched                                                      ;A3EF7F;
    LDA.W $0C18,Y                                                        ;A3EF81;
    AND.W #$0F00                                                         ;A3EF84;
    CMP.W #$0500                                                         ;A3EF87;
    BNE .returnLower                                                     ;A3EF8A;
    LDA.W #$0004                                                         ;A3EF8C;
    STA.W EnemyData.work4,X                                              ;A3EF8F;
    LDA.W #$0003                                                         ;A3EF92;
    STA.W EnemyData.work5,X                                              ;A3EF95;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EF98;
    STA.W EnemyData.pInstList,X                                          ;A3EF9B;
    LDA.W #$0001                                                         ;A3EF9E;
    STA.W EnemyData.instTimer,X                                          ;A3EFA1;
    LDA.W #$0013                                                         ;A3EFA4;
    JSL.L Run_Samus_Command                                              ;A3EFA7;

.returnLower:
    RTL                                                                  ;A3EFAB;


.notLatched:
    STZ.W EnemyData.work0,X                                              ;A3EFAC;
    STZ.W EnemyData.work2,X                                              ;A3EFAF;
    LDY.W #$0000                                                         ;A3EFB2;
    LDA.W EnemyData.xPosition,X                                          ;A3EFB5;
    SEC                                                                  ;A3EFB8;
    SBC.W $0B64,Y                                                        ;A3EFB9;
    BPL +                                                                ;A3EFBC;
    LDY.W #$FF00                                                         ;A3EFBE;

  + PHA                                                                  ;A3EFC1;
    TYA                                                                  ;A3EFC2;
    STA.W EnemyData.work1,X                                              ;A3EFC3;
    PLA                                                                  ;A3EFC6;
    ASL A                                                                ;A3EFC7;
    ASL A                                                                ;A3EFC8;
    ASL A                                                                ;A3EFC9;
    ASL A                                                                ;A3EFCA;
    ASL A                                                                ;A3EFCB;
    STA.W EnemyData.work0+1,X                                            ;A3EFCC;
    LDY.W #$0000                                                         ;A3EFCF;
    LDA.W EnemyData.yPosition,X                                          ;A3EFD2;
    SEC                                                                  ;A3EFD5;
    SBC.W $0B78,Y                                                        ;A3EFD6;
    BPL +                                                                ;A3EFD9;
    LDY.W #$FF00                                                         ;A3EFDB;

  + PHA                                                                  ;A3EFDE;
    TYA                                                                  ;A3EFDF;
    STA.W EnemyData.work3,X                                              ;A3EFE0;
    PLA                                                                  ;A3EFE3;
    ASL A                                                                ;A3EFE4;
    ASL A                                                                ;A3EFE5;
    ASL A                                                                ;A3EFE6;
    ASL A                                                                ;A3EFE7;
    ASL A                                                                ;A3EFE8;
    STA.W EnemyData.work2+1,X                                            ;A3EFE9;
    STZ.W EnemyData.work5,X                                              ;A3EFEC;
    LDA.W #InstList_Metroid_ChasingSamus                                 ;A3EFEF;
    STA.W EnemyData.pInstList,X                                          ;A3EFF2;
    LDA.W #$0001                                                         ;A3EFF5;
    STA.W EnemyData.instTimer,X                                          ;A3EFF8;
    LDA.W $18A6                                                          ;A3EFFB;
    ASL A                                                                ;A3EFFE;
    TAY                                                                  ;A3EFFF;
    LDA.W $0C18,Y                                                        ;A3F000;
    AND.W #$0002                                                         ;A3F003;
    BEQ .notIceBeam                                                      ;A3F006;
    LDA.W #$000A                                                         ;A3F008;
    JSL.L QueueSound_Lib3_Max6                                           ;A3F00B;
    LDA.W $0C2C,Y                                                        ;A3F00F;
    STA.B $12                                                            ;A3F012;
    LDA.W #$0004                                                         ;A3F014;
    STA.W EnemyData.flashTimer,X                                         ;A3F017;
    LDA.W EnemyData.initParam1,X                                         ;A3F01A;
    SEC                                                                  ;A3F01D;
    SBC.B $12                                                            ;A3F01E;
    BEQ .freeze                                                          ;A3F020;
    BCS .noFreeze                                                        ;A3F022;

.freeze:
    STZ.W EnemyData.initParam1,X                                         ;A3F024;
    LDA.W #$0190                                                         ;A3F027;
    STA.W EnemyData.freezeTimer,X                                        ;A3F02A;
    LDA.W EnemyData.ai,X                                                 ;A3F02D;
    ORA.W #$0004                                                         ;A3F030;
    STA.W EnemyData.ai,X                                                 ;A3F033;
    RTL                                                                  ;A3F036;


.noFreeze:
    STA.W EnemyData.initParam1,X                                         ;A3F037;

.notIceBeam:
    LDA.W #$005A                                                         ;A3F03A;
    JSL.L QueueSound_Lib2_Max6                                           ;A3F03D;
    RTL                                                                  ;A3F041;


PowerBombReaction_Metroid:
    JSL.L NormalEnemyPowerBombAI                                         ;A3F042;
    LDA.W EnemyData.health,X                                             ;A3F046;
    BNE .return                                                          ;A3F049;
    LDA.W #$0013                                                         ;A3F04B;
    JSL.L Run_Samus_Command                                              ;A3F04E;
    LDX.W $0E54                                                          ;A3F052;
    LDA.L $7E7800,X                                                      ;A3F055;
    TAX                                                                  ;A3F059;
    LDA.W #$0000                                                         ;A3F05A;
    STA.L $7EEF78,X                                                      ;A3F05D;
    LDX.W $0E54                                                          ;A3F061;
    LDA.L $7E7802,X                                                      ;A3F064;
    TAX                                                                  ;A3F068;
    LDA.W #$0000                                                         ;A3F069;
    STA.L $7EEF78,X                                                      ;A3F06C;

.return:
    RTL                                                                  ;A3F070;


UNUSED_Spritemap_Metroid_Shell_A3F071:
    dw $000A,$0010                                                       ;A3F071;
    db $04                                                               ;A3F075;
    dw $6130,$0010                                                       ;A3F076;
    db $FC                                                               ;A3F07A;
    dw $6120,$0010                                                       ;A3F07B;
    db $F4                                                               ;A3F07F;
    dw $6110,$01E8                                                       ;A3F080;
    db $04                                                               ;A3F084;
    dw $2130,$01E8                                                       ;A3F085;
    db $FC                                                               ;A3F089;
    dw $2120,$01E8                                                       ;A3F08A;
    db $F4                                                               ;A3F08E;
    dw $2110,$8000                                                       ;A3F08F;
    db $FC                                                               ;A3F093;
    dw $6121,$8000                                                       ;A3F094;
    db $EC                                                               ;A3F098;
    dw $2103,$81F0                                                       ;A3F099;
    db $FC                                                               ;A3F09D;
    dw $2121,$81F0                                                       ;A3F09E;
    db $EC                                                               ;A3F0A2;
    dw $2101                                                             ;A3F0A3;

UNUSED_Spritemap_Metroid_Shell_A3F0A5:
    dw $000A,$0010                                                       ;A3F0A5;
    db $FC                                                               ;A3F0A9;
    dw $612A,$0010                                                       ;A3F0AA;
    db $04                                                               ;A3F0AE;
    dw $613A,$0010                                                       ;A3F0AF;
    db $F4                                                               ;A3F0B3;
    dw $211F,$01E8                                                       ;A3F0B4;
    db $04                                                               ;A3F0B8;
    dw $213A,$01E8                                                       ;A3F0B9;
    db $FC                                                               ;A3F0BD;
    dw $212A,$01E8                                                       ;A3F0BE;
    db $F4                                                               ;A3F0C2;
    dw $211A,$8000                                                       ;A3F0C3;
    db $EC                                                               ;A3F0C7;
    dw $210D,$8000                                                       ;A3F0C8;
    db $FC                                                               ;A3F0CC;
    dw $612B,$81F0                                                       ;A3F0CD;
    db $FC                                                               ;A3F0D1;
    dw $212B,$81F0                                                       ;A3F0D2;
    db $EC                                                               ;A3F0D6;
    dw $210B                                                             ;A3F0D7;

UNUSED_Spritemap_Metroid_Shell_A3F0D9:
    dw $000A,$01E8                                                       ;A3F0D9;
    db $FC                                                               ;A3F0DD;
    dw $2125,$0010                                                       ;A3F0DE;
    db $04                                                               ;A3F0E2;
    dw $6135,$0010                                                       ;A3F0E3;
    db $FC                                                               ;A3F0E7;
    dw $6125,$0010                                                       ;A3F0E8;
    db $F4                                                               ;A3F0EC;
    dw $6115,$01E8                                                       ;A3F0ED;
    db $04                                                               ;A3F0F1;
    dw $2135,$01E8                                                       ;A3F0F2;
    db $F4                                                               ;A3F0F6;
    dw $2115,$8000                                                       ;A3F0F7;
    db $FC                                                               ;A3F0FB;
    dw $6126,$8000                                                       ;A3F0FC;
    db $EC                                                               ;A3F100;
    dw $2108,$81F0                                                       ;A3F101;
    db $FC                                                               ;A3F105;
    dw $2126,$81F0                                                       ;A3F106;
    db $EC                                                               ;A3F10A;
    dw $2106                                                             ;A3F10B;

Spritemap_Metroid_Insides_0:
    dw $0008,$0010                                                       ;A3F10D;
    db $00                                                               ;A3F111;
    dw $6160,$0010                                                       ;A3F112;
    db $F8                                                               ;A3F116;
    dw $6150,$01E8                                                       ;A3F117;
    db $00                                                               ;A3F11B;
    dw $2160,$01E8                                                       ;A3F11C;
    db $F8                                                               ;A3F120;
    dw $2150,$8000                                                       ;A3F121;
    db $00                                                               ;A3F125;
    dw $6161,$8000                                                       ;A3F126;
    db $F0                                                               ;A3F12A;
    dw $6141,$81F0                                                       ;A3F12B;
    db $00                                                               ;A3F12F;
    dw $2161,$81F0                                                       ;A3F130;
    db $F0                                                               ;A3F134;
    dw $2141                                                             ;A3F135;

Spritemap_Metroid_Insides_1:
    dw $0006,$0010                                                       ;A3F137;
    db $00                                                               ;A3F13B;
    dw $6163,$01E8                                                       ;A3F13C;
    db $00                                                               ;A3F140;
    dw $2163,$8000                                                       ;A3F141;
    db $00                                                               ;A3F145;
    dw $6164,$8000                                                       ;A3F146;
    db $F0                                                               ;A3F14A;
    dw $6144,$81F0                                                       ;A3F14B;
    db $00                                                               ;A3F14F;
    dw $2164,$81F0                                                       ;A3F150;
    db $F0                                                               ;A3F154;
    dw $2144                                                             ;A3F155;

Spritemap_Metroid_Insides_2:
    dw $0008,$0010                                                       ;A3F157;
    db $00                                                               ;A3F15B;
    dw $6166,$0010                                                       ;A3F15C;
    db $F8                                                               ;A3F160;
    dw $6156,$01E8                                                       ;A3F161;
    db $00                                                               ;A3F165;
    dw $2166,$01E8                                                       ;A3F166;
    db $F8                                                               ;A3F16A;
    dw $2156,$8000                                                       ;A3F16B;
    db $00                                                               ;A3F16F;
    dw $6167,$8000                                                       ;A3F170;
    db $F0                                                               ;A3F174;
    dw $6147,$81F0                                                       ;A3F175;
    db $00                                                               ;A3F179;
    dw $2167,$81F0                                                       ;A3F17A;
    db $F0                                                               ;A3F17E;
    dw $2147                                                             ;A3F17F;

Spritemap_Metroid_Insides_3:
    dw $0008,$0010                                                       ;A3F181;
    db $00                                                               ;A3F185;
    dw $6169,$0010                                                       ;A3F186;
    db $F8                                                               ;A3F18A;
    dw $6159,$01E8                                                       ;A3F18B;
    db $00                                                               ;A3F18F;
    dw $2169,$01E8                                                       ;A3F190;
    db $F8                                                               ;A3F194;
    dw $2159,$8000                                                       ;A3F195;
    db $00                                                               ;A3F199;
    dw $616A,$8000                                                       ;A3F19A;
    db $F0                                                               ;A3F19E;
    dw $614A,$81F0                                                       ;A3F19F;
    db $00                                                               ;A3F1A3;
    dw $216A,$81F0                                                       ;A3F1A4;
    db $F0                                                               ;A3F1A8;
    dw $214A                                                             ;A3F1A9;

UNUSED_Spritemap_Metroid_Electricity_A3F1AB:
    dw $0003,$0000                                                       ;A3F1AB;
    db $EC                                                               ;A3F1AF;
    dw $217C,$01F8                                                       ;A3F1B0;
    db $FC                                                               ;A3F1B4;
    dw $214D,$01F0                                                       ;A3F1B5;
    db $FC                                                               ;A3F1B9;
    dw $214C                                                             ;A3F1BA;

UNUSED_Spritemap_Metroid_Electricity_A3F1BC:
    dw $0003,$0000                                                       ;A3F1BC;
    db $EC                                                               ;A3F1C0;
    dw $217D,$01F8                                                       ;A3F1C1;
    db $FC                                                               ;A3F1C5;
    dw $215D,$01F0                                                       ;A3F1C6;
    db $FC                                                               ;A3F1CA;
    dw $215C                                                             ;A3F1CB;

UNUSED_Spritemap_Metroid_Electricity_A3F1CD:
    dw $0003,$0000                                                       ;A3F1CD;
    db $EC                                                               ;A3F1D1;
    dw $217E,$01F8                                                       ;A3F1D2;
    db $FC                                                               ;A3F1D6;
    dw $216D,$01F0                                                       ;A3F1D7;
    db $FC                                                               ;A3F1DB;
    dw $216C                                                             ;A3F1DC;

UNUSED_Spritemap_Metroid_Electricity_A3F1DE:
    dw $0004,$0008                                                       ;A3F1DE;
    db $FC                                                               ;A3F1E2;
    dw $214F,$0000                                                       ;A3F1E3;
    db $FC                                                               ;A3F1E7;
    dw $214E,$01F8                                                       ;A3F1E8;
    db $F4                                                               ;A3F1EC;
    dw $213D,$01F8                                                       ;A3F1ED;
    db $EC                                                               ;A3F1F1;
    dw $212D                                                             ;A3F1F2;

UNUSED_Spritemap_Metroid_Electricity_A3F1F4:
    dw $0004,$0008                                                       ;A3F1F4;
    db $FC                                                               ;A3F1F8;
    dw $215F,$0000                                                       ;A3F1F9;
    db $FC                                                               ;A3F1FD;
    dw $215E,$01F8                                                       ;A3F1FE;
    db $F4                                                               ;A3F202;
    dw $213E,$01F8                                                       ;A3F203;
    db $EC                                                               ;A3F207;
    dw $212E                                                             ;A3F208;

UNUSED_Spritemap_Metroid_Electricity_A3F20A:
    dw $0004,$0008                                                       ;A3F20A;
    db $FC                                                               ;A3F20E;
    dw $216F,$0000                                                       ;A3F20F;
    db $FC                                                               ;A3F213;
    dw $216E,$01F8                                                       ;A3F214;
    db $F4                                                               ;A3F218;
    dw $213F,$01F8                                                       ;A3F219;
    db $EC                                                               ;A3F21D;
    dw $212F                                                             ;A3F21E;

UNUSED_Spritemap_Metroid_Electricity_A3F220:
    dw $0003,$0008                                                       ;A3F220;
    db $FC                                                               ;A3F224;
    dw $214D,$0000                                                       ;A3F225;
    db $FC                                                               ;A3F229;
    dw $214C,$01F8                                                       ;A3F22A;
    db $EC                                                               ;A3F22E;
    dw $617C                                                             ;A3F22F;

UNUSED_Spritemap_Metroid_Electricity_A3F231:
    dw $0003,$0008                                                       ;A3F231;
    db $FC                                                               ;A3F235;
    dw $215D,$0000                                                       ;A3F236;
    db $FC                                                               ;A3F23A;
    dw $215C,$01F8                                                       ;A3F23B;
    db $EC                                                               ;A3F23F;
    dw $617D                                                             ;A3F240;

UNUSED_Spritemap_Metroid_Electricity_A3F242:
    dw $0003,$0008                                                       ;A3F242;
    db $FC                                                               ;A3F246;
    dw $216D,$0000                                                       ;A3F247;
    db $FC                                                               ;A3F24B;
    dw $216C,$01F8                                                       ;A3F24C;
    db $EC                                                               ;A3F250;
    dw $617E                                                             ;A3F251;

UNUSED_Spritemap_Metroid_Electricity_A3F253:
    dw $0004,$01F8                                                       ;A3F253;
    db $FC                                                               ;A3F257;
    dw $214F,$01F0                                                       ;A3F258;
    db $FC                                                               ;A3F25C;
    dw $214E,$0000                                                       ;A3F25D;
    db $F4                                                               ;A3F261;
    dw $613D,$0000                                                       ;A3F262;
    db $EC                                                               ;A3F266;
    dw $612D                                                             ;A3F267;

UNUSED_Spritemap_Metroid_Electricity_A3F269:
    dw $0004,$01F8                                                       ;A3F269;
    db $FC                                                               ;A3F26D;
    dw $216F,$01F0                                                       ;A3F26E;
    db $FC                                                               ;A3F272;
    dw $216E,$0000                                                       ;A3F273;
    db $F4                                                               ;A3F277;
    dw $613E,$0000                                                       ;A3F278;
    db $EC                                                               ;A3F27C;
    dw $612E                                                             ;A3F27D;

UNUSED_Spritemap_Metroid_Electricity_A3F27F:
    dw $0004,$01F8                                                       ;A3F27F;
    db $FC                                                               ;A3F283;
    dw $215F,$01F0                                                       ;A3F284;
    db $FC                                                               ;A3F288;
    dw $215E,$0000                                                       ;A3F289;
    db $F4                                                               ;A3F28D;
    dw $613F,$0000                                                       ;A3F28E;
    db $EC                                                               ;A3F292;
    dw $612F                                                             ;A3F293;

UNUSED_Spritemap_Metroid_Electricity_A3F295:
    dw $0002,$01F8                                                       ;A3F295;
    db $FC                                                               ;A3F299;
    dw $214D,$01F0                                                       ;A3F29A;
    db $FC                                                               ;A3F29E;
    dw $214C                                                             ;A3F29F;

UNUSED_Spritemap_Metroid_Electricity_A3F2A1:
    dw $0001,$01F0                                                       ;A3F2A1;
    db $FC                                                               ;A3F2A5;
    dw $215C                                                             ;A3F2A6;

UNUSED_Spritemap_Metroid_Electricity_A3F2A8:
    dw $0002,$01F8                                                       ;A3F2A8;
    db $FC                                                               ;A3F2AC;
    dw $216D,$01F0                                                       ;A3F2AD;
    db $FC                                                               ;A3F2B1;
    dw $216C                                                             ;A3F2B2;

UNUSED_Spritemap_Metroid_Electricity_A3F2B4:
    dw $0002,$01F8                                                       ;A3F2B4;
    db $F4                                                               ;A3F2B8;
    dw $213D,$01F8                                                       ;A3F2B9;
    db $EC                                                               ;A3F2BD;
    dw $212D                                                             ;A3F2BE;

UNUSED_Spritemap_Metroid_Electricity_A3F2C0:
    dw $0002,$01F8                                                       ;A3F2C0;
    db $F4                                                               ;A3F2C4;
    dw $213E,$01F8                                                       ;A3F2C5;
    db $EC                                                               ;A3F2C9;
    dw $212E                                                             ;A3F2CA;

UNUSED_Spritemap_Metroid_Electricity_A3F2CC:
    dw $0002,$01F8                                                       ;A3F2CC;
    db $F4                                                               ;A3F2D0;
    dw $213F,$01F8                                                       ;A3F2D1;
    db $EC                                                               ;A3F2D5;
    dw $212F                                                             ;A3F2D6;

UNUSED_Spritemap_Metroid_Electricity_A3F2D8:
    dw $0002,$0008                                                       ;A3F2D8;
    db $FC                                                               ;A3F2DC;
    dw $214D,$0000                                                       ;A3F2DD;
    db $FC                                                               ;A3F2E1;
    dw $214C                                                             ;A3F2E2;

UNUSED_Spritemap_Metroid_Electricity_A3F2E4:
    dw $0002,$0008                                                       ;A3F2E4;
    db $FC                                                               ;A3F2E8;
    dw $215D,$0000                                                       ;A3F2E9;
    db $FC                                                               ;A3F2ED;
    dw $215C                                                             ;A3F2EE;

UNUSED_Spritemap_Metroid_Electricity_A3F2F0:
    dw $0002,$0008                                                       ;A3F2F0;
    db $FC                                                               ;A3F2F4;
    dw $216D,$0000                                                       ;A3F2F5;
    db $FC                                                               ;A3F2F9;
    dw $216C                                                             ;A3F2FA;

UNUSED_Spritemap_Metroid_Electricity_A3F2FC:
    dw $0001,$0000                                                       ;A3F2FC;
    db $EC                                                               ;A3F300;
    dw $217C                                                             ;A3F301;

UNUSED_Spritemap_Metroid_Electricity_A3F303:
    dw $0001,$0000                                                       ;A3F303;
    db $EC                                                               ;A3F307;
    dw $217D                                                             ;A3F308;

UNUSED_Spritemap_Metroid_Electricity_A3F30A:
    dw $0001,$0000                                                       ;A3F30A;
    db $EC                                                               ;A3F30E;
    dw $217E                                                             ;A3F30F;

Freespace_BankA3_F311:                                                   ;A3F311;
; $CEF bytes
