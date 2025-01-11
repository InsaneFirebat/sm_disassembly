
org $A98000


CommonA9_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A98000;
    RTL                                                                  ;A98004;


CommonA9_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A98005;
    RTL                                                                  ;A98009;


CommonA9_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A9800A;
    RTL                                                                  ;A9800E;


CommonA9_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A9800F;
    RTL                                                                  ;A98013;


CommonA9_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A98014;
    RTL                                                                  ;A98018;


UNUSED_CommonA9_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A98019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A98019;
    RTL                                                                  ;A9801D;


CommonA9_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A9801E;
    RTL                                                                  ;A98022;


CommonA9_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A98023;
    RTL                                                                  ;A98027;


CommonA9_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A98028;
    RTL                                                                  ;A9802C;


CommonA9_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A9802D;
    RTL                                                                  ;A98031;


CommonA9_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A98032;
    RTL                                                                  ;A98036;


CommonA9_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A98037;
    RTL                                                                  ;A9803B;


CommonA9_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A9803C;
    RTL                                                                  ;A98040;


CommonA9_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A98041;
    RTL                                                                  ;A98045;


CommonA9_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A98046;
    RTL                                                                  ;A9804A;


RTS_A9804B:
    RTS                                                                  ;A9804B;


RTL_A9804C:
    RTL                                                                  ;A9804C;


Spritemap_CommonA9_Nothing:
    dw $0000                                                             ;A9804D;

ExtendedSpritemap_CommonA9_Nothing:
    dw $0001,$0000,$0000                                                 ;A9804F;
    dw Spritemap_CommonA9_Nothing                                        ;A98055;
    dw Hitbox_CommonA9_Nothing                                           ;A98057;

Hitbox_CommonA9_Nothing:
    dw $0001,$0000,$0000,$0000,$0000                                     ;A98059;
    dw CommonA9_NormalEnemyTouchAI                                       ;A98063;
    dw CommonA9_NormalEnemyShotAI                                        ;A98065;

InstList_CommonA9_DeleteEnemy:
    dw Instruction_CommonA9_DeleteEnemy                                  ;A98067;

NOPNOP_A98069:
    NOP                                                                  ;A98069;
    NOP                                                                  ;A9806A;

Instruction_CommonA9_Enemy0FB2_InY:
    LDA.W $0000,Y                                                        ;A9806B;
    STA.W $0FB2,X                                                        ;A9806E;
    INY                                                                  ;A98071;
    INY                                                                  ;A98072;
    RTL                                                                  ;A98073;


Instruction_CommonA9_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A9807B                                                    ;A98074;
    STA.W $0FB2,X                                                        ;A98077;
    RTL                                                                  ;A9807A;


RTS_A9807B:
    RTS                                                                  ;A9807B;


Instruction_CommonA9_DeleteEnemy:
    LDA.W $0F86,X                                                        ;A9807C;
    ORA.W #$0200                                                         ;A9807F;
    STA.W $0F86,X                                                        ;A98082;
    PLA                                                                  ;A98085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A98086;
    RTL                                                                  ;A98089;


Instruction_CommonA9_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A9808A;
    STA.B $12                                                            ;A9808D;
    PHY                                                                  ;A9808F;
    PHX                                                                  ;A98090;
    PEA.W .manualReturn-1                                                ;A98091;
    JMP.W ($0012)                                                        ;A98094;


.manualReturn:
    PLX                                                                  ;A98097;
    PLY                                                                  ;A98098;
    INY                                                                  ;A98099;
    INY                                                                  ;A9809A;
    RTL                                                                  ;A9809B;


Instruction_CommonA9_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A9809C;
    STA.B $12                                                            ;A9809F;
    LDA.W $0002,Y                                                        ;A980A1;
    PHY                                                                  ;A980A4;
    PHX                                                                  ;A980A5;
    PEA.W .manualReturn-1                                                ;A980A6;
    JMP.W ($0012)                                                        ;A980A9;


.manualReturn:
    PLX                                                                  ;A980AC;
    PLY                                                                  ;A980AD;
    TYA                                                                  ;A980AE;
    CLC                                                                  ;A980AF;
    ADC.W #$0004                                                         ;A980B0;
    TAY                                                                  ;A980B3;
    RTL                                                                  ;A980B4;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_CommonA9_CallExternalFunctionInY_A980B5:
    LDA.W $0000,Y                                                        ;A980B5;
    STA.B $12                                                            ;A980B8;
    LDA.W $0001,Y                                                        ;A980BA;
    STA.B $13                                                            ;A980BD;
    PHX                                                                  ;A980BF;
    PHY                                                                  ;A980C0;
    JSL.L .externalFunction                                              ;A980C1;
    PLY                                                                  ;A980C5;
    PLX                                                                  ;A980C6;
    INY                                                                  ;A980C7;
    INY                                                                  ;A980C8;
    INY                                                                  ;A980C9;
    RTL                                                                  ;A980CA;


.externalFunction:
    JML.W [$0012]                                                        ;A980CB;


UNUSED_Inst_CommonA9_CallExternalFunctionInY_WithA_A980CE:
    LDA.W $0000,Y                                                        ;A980CE;
    STA.B $12                                                            ;A980D1;
    LDA.W $0001,Y                                                        ;A980D3;
    STA.B $13                                                            ;A980D6;
    LDA.W $0003,Y                                                        ;A980D8;
    PHX                                                                  ;A980DB;
    PHY                                                                  ;A980DC;
    JSL.L .externalFunction                                              ;A980DD;
    PLY                                                                  ;A980E1;
    PLX                                                                  ;A980E2;
    TYA                                                                  ;A980E3;
    CLC                                                                  ;A980E4;
    ADC.W #$0005                                                         ;A980E5;
    TAY                                                                  ;A980E8;
    RTL                                                                  ;A980E9;


.externalFunction:
    JML.W [$0012]                                                        ;A980EA;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_CommonA9_GotoY:
    LDA.W $0000,Y                                                        ;A980ED;
    TAY                                                                  ;A980F0;
    RTL                                                                  ;A980F1;


Instruction_CommonA9_GotoY_PlusY:
    STY.B $12                                                            ;A980F2;
    DEY                                                                  ;A980F4;
    LDA.W $0000,Y                                                        ;A980F5;
    XBA                                                                  ;A980F8;
    BMI .highByte                                                        ;A980F9;
    AND.W #$00FF                                                         ;A980FB;
    BRA +                                                                ;A980FE;


.highByte:
    ORA.W #$FF00                                                         ;A98100;

  + CLC                                                                  ;A98103;
    ADC.B $12                                                            ;A98104;
    TAY                                                                  ;A98106;
    RTL                                                                  ;A98107;


Instruction_CommonA9_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X                                                        ;A98108;
    BNE Instruction_CommonA9_GotoY                                       ;A9810B;
    INY                                                                  ;A9810D;
    INY                                                                  ;A9810E;
    RTL                                                                  ;A9810F;


Instruction_CommonA9_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X                                                        ;A98110;
    BNE Instruction_CommonA9_GotoY                                       ;A98113;
    INY                                                                  ;A98115;
    INY                                                                  ;A98116;
    RTL                                                                  ;A98117;


Instruction_CommonA9_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A98118;
    DEC.W $0F90,X                                                        ;A9811A;
    REP #$20                                                             ;A9811D;
    BNE Instruction_CommonA9_GotoY_PlusY                                 ;A9811F;
    INY                                                                  ;A98121;
    RTL                                                                  ;A98122;


Instruction_CommonA9_TimerInY:
    LDA.W $0000,Y                                                        ;A98123;
    STA.W $0F90,X                                                        ;A98126;
    INY                                                                  ;A98129;
    INY                                                                  ;A9812A;
    RTL                                                                  ;A9812B;


Instruction_CommonA9_SkipNextInstruction:
    INY                                                                  ;A9812C;
    INY                                                                  ;A9812D;
    RTL                                                                  ;A9812E;


Instruction_CommonA9_Sleep:
    DEY                                                                  ;A9812F;
    DEY                                                                  ;A98130;
    TYA                                                                  ;A98131;
    STA.W $0F92,X                                                        ;A98132;
    PLA                                                                  ;A98135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A98136;
    RTL                                                                  ;A98139;


Instruction_CommonA9_WaitYFrames:
    LDA.W $0000,Y                                                        ;A9813A;
    STA.W $0F94,X                                                        ;A9813D;
    INY                                                                  ;A98140;
    INY                                                                  ;A98141;
    TYA                                                                  ;A98142;
    STA.W $0F92,X                                                        ;A98143;
    PLA                                                                  ;A98146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A98147;
    RTL                                                                  ;A9814A;


Instruction_CommonA9_TransferYBytesInYToVRAM:
    PHX                                                                  ;A9814B;
    LDX.W $0330                                                          ;A9814C;
    LDA.W $0000,Y                                                        ;A9814F;
    STA.B $D0,X                                                          ;A98152;
    LDA.W $0002,Y                                                        ;A98154;
    STA.B $D2,X                                                          ;A98157;
    LDA.W $0003,Y                                                        ;A98159;
    STA.B $D3,X                                                          ;A9815C;
    LDA.W $0005,Y                                                        ;A9815E;
    STA.B $D5,X                                                          ;A98161;
    TXA                                                                  ;A98163;
    CLC                                                                  ;A98164;
    ADC.W #$0007                                                         ;A98165;
    STA.W $0330                                                          ;A98168;
    TYA                                                                  ;A9816B;
    CLC                                                                  ;A9816C;
    ADC.W #$0007                                                         ;A9816D;
    TAY                                                                  ;A98170;
    PLX                                                                  ;A98171;
    RTL                                                                  ;A98172;


Instruction_CommonA9_EnableOffScreenProcessing:
    LDA.W $0F86,X                                                        ;A98173;
    ORA.W #$0800                                                         ;A98176;
    STA.W $0F86,X                                                        ;A98179;
    RTL                                                                  ;A9817C;


Instruction_CommonA9_DisableOffScreenProcessing:
    LDA.W $0F86,X                                                        ;A9817D;
    AND.W #$F7FF                                                         ;A98180;
    STA.W $0F86,X                                                        ;A98183;
    RTL                                                                  ;A98186;


CommonA9EnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000                   ;A98187;
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000                   ;A98197;
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000                   ;A981A7;
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000                   ;A981B7;
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000                   ;A981C7;
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000                   ;A981D7;
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000                   ;A981E7;
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000                   ;A981F7;
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000                   ;A98207;
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000                   ;A98217;
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000                   ;A98227;
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000                   ;A98237;
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000                   ;A98247;
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000                   ;A98257;
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000                   ;A98267;
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000                   ;A98277;
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000                   ;A98287;
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000                   ;A98297;
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000                   ;A982A7;
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000                   ;A982B7;
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000                   ;A982C7;
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000                   ;A982D7;
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000                   ;A982E7;
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000                   ;A982F7;
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000                   ;A98307;
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000                   ;A98317;
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000                   ;A98327;
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000                   ;A98337;
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000                   ;A98347;
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000                   ;A98357;
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000                   ;A98367;
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000                   ;A98377;
    dw $0004,$0000,$FFFC,$0000                                           ;A98387;

CommonA9EnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF                   ;A9838F;
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF                   ;A9839F;
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF                   ;A983AF;
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF                   ;A983BF;
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF                   ;A983CF;
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF                   ;A983DF;
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF                   ;A983EF;
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF                   ;A983FF;
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF                   ;A9840F;
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF                   ;A9841F;
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF                   ;A9842F;
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE                   ;A9843F;
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE                   ;A9844F;
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE                   ;A9845F;
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE                   ;A9846F;
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE                   ;A9847F;
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD                   ;A9848F;
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD                   ;A9849F;
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD                   ;A984AF;
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC                   ;A984BF;
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC                   ;A984CF;
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC                   ;A984DF;
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB                   ;A984EF;
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB                   ;A984FF;
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB                   ;A9850F;
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA                   ;A9851F;
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA                   ;A9852F;
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9                   ;A9853F;
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9                   ;A9854F;
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9                   ;A9855F;
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8                   ;A9856F;
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8                   ;A9857F;
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7                   ;A9858F;
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7                   ;A9859F;
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6                   ;A985AF;
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6                   ;A985BF;
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5                   ;A985CF;
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4                   ;A985DF;
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4                   ;A985EF;
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3                   ;A985FF;
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3                   ;A9860F;
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2                   ;A9861F;
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1                   ;A9862F;
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1                   ;A9863F;
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0                   ;A9864F;
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF                   ;A9865F;
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE                   ;A9866F;
    dw $74F9,$0011,$8B07,$FFEE                                           ;A9867F;

InitAI_MotherBrainBody:
    PHB                                                                  ;A98687;
    PEA.W $7E7E                                                          ;A98688;
    PLB                                                                  ;A9868B;
    PLB                                                                  ;A9868C;
    LDA.W #$0338                                                         ;A9868D;
    LDX.W #$0FFE                                                         ;A98690;

.loopTilemap:
    STA.W $2000,X                                                        ;A98693;
    DEX                                                                  ;A98696;
    DEX                                                                  ;A98697;
    BPL .loopTilemap                                                     ;A98698;
    PLB                                                                  ;A9869A;
    LDA.W #InstList_MotherBrainHead_InitialDummy                         ;A9869B;
    JSR.W SetMotherBrainBodyInstList                                     ;A9869E;
    STZ.W $0F98                                                          ;A986A1;
    LDA.W $0F86                                                          ;A986A4;
    ORA.W #$1500                                                         ;A986A7;
    STA.W $0F86                                                          ;A986AA;
    LDA.W #$0000                                                         ;A986AD;
    STA.W $0F96                                                          ;A986B0;
    LDY.W #Palette_MotherBrain_GlassShards+2                             ;A986B3;
    LDX.W #$0162                                                         ;A986B6;
    LDA.W #$000F                                                         ;A986B9;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A986BC;
    LDY.W #Palette_MotherBrain_TubeProjectiles+2                         ;A986C0;
    LDX.W #$01E2                                                         ;A986C3;
    LDA.W #$000F                                                         ;A986C6;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A986C9;
    LDA.W #$0000                                                         ;A986CD;
    STA.L $7E7800                                                        ;A986D0;
    STA.L $7E7844                                                        ;A986D4;
    LDA.W #$0002                                                         ;A986D8;
    STA.L $7E7808                                                        ;A986DB;
    LDA.W #Function_MotherBrain_SetupBrainToBeDrawn                      ;A986DF;
    STA.W $0FE8                                                          ;A986E2;
    LDA.W #Function_MotherBrain_FirstPhase                               ;A986E5;
    STA.W $0FA8                                                          ;A986E8;
    LDA.W #$0001                                                         ;A986EB;
    JSL.L Load_FX_Entry                                                  ;A986EE;
    LDA.W #$0000                                                         ;A986F2;

.loopProjectiles:
    PHA                                                                  ;A986F5;
    LDY.W #EnemyProjectile_MotherBrainTurret                             ;A986F6;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A986F9;
    PLA                                                                  ;A986FD;
    INC A                                                                ;A986FE;
    CMP.W #$000C                                                         ;A986FF;
    BCC .loopProjectiles                                                 ;A98702;
    RTL                                                                  ;A98704;


InitAI_MotherBrainHead:
    LDX.W #$0040                                                         ;A98705;
    LDY.W #CorpseRottingDefinitions_MotherBrain                          ;A98708;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9870B;
    LDA.W #$0BB8                                                         ;A9870E;
    STA.W $0FCC                                                          ;A98711;
    LDA.W #InstList_MotherBrainHead_InitialDummy                         ;A98714;
    JSR.W SetMotherBrainHeadUnusedInstList                               ;A98717;
    STZ.W $0FD8                                                          ;A9871A;
    LDA.W $0FC6                                                          ;A9871D;
    ORA.W #$1100                                                         ;A98720;
    STA.W $0FC6                                                          ;A98723;
    LDA.W #$0200                                                         ;A98726;
    STA.W $0FD6                                                          ;A98729;
    STA.L $7E7818                                                        ;A9872C;
    STA.L $7E781A                                                        ;A98730;
    LDA.W #InstList_MotherBrainHead_Initial                              ;A98734;
    JSR.W SetMotherBrainHeadInstList                                     ;A98737;
    JSR.W SetupMotherBrainHeadNormalPalette                              ;A9873A;
    RTL                                                                  ;A9873D;


MainAI_HurtAI_MotherBrainBody:
    JSR.W MotherBrainPalette_HandleRoomPalette                           ;A9873E;
    PEA.W .manualReturn-1                                                ;A98741;
    JMP.W ($0FA8)                                                        ;A98744;


.manualReturn:
    JSR.W HandleMotherBrainsPalette                                      ;A98747;
    JSR.W MotherBrain_vs_Samus_CollisionDetection                        ;A9874A;
    JSR.W ProcessMotherBrainInvincibilityPalette                         ;A9874D;
    LDA.L $7E7844                                                        ;A98750;
    BEQ .return                                                          ;A98754;
    LDA.W #UnpauseHook_MotherBrainBody>>8&$FF00                          ;A98756;
    STA.W $0605                                                          ;A98759;
    LDA.W #UnpauseHook_MotherBrainBody                                   ;A9875C;
    STA.W $0604                                                          ;A9875F;

.return:
    RTL                                                                  ;A98762;


UnpauseHook_MotherBrainBody:
    LDA.L $7E782C                                                        ;A98763;
    BEQ .noRainbowSFX                                                    ;A98767;
    LDA.W #$0040                                                         ;A98769;
    JSL.L QueueSound_Lib1_Max6                                           ;A9876C;

.noRainbowSFX:
    LDA.W $0F88                                                          ;A98770;
    AND.W #$0004                                                         ;A98773;
    BEQ .return                                                          ;A98776;
    LDA.W #$0800                                                         ;A98778;
    STA.W $179A                                                          ;A9877B;
    LDA.W #$0001                                                         ;A9877E;
    STA.W $0E1E                                                          ;A98781;

.return:
    RTL                                                                  ;A98784;


RTS_A98785:
    RTS                                                                  ;A98785;


RTL_A98786:
    RTL                                                                  ;A98786;


PowerBombReaction_MotherBrain:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A98787; Fallthrough to MainAI_HurtAI_MotherBrainHead

MainAI_HurtAI_MotherBrainHead:
    LDA.W #RTL_A98786>>8&$FF00                                           ;A9878B;
    STA.W $178D                                                          ;A9878E;
    LDA.W #RTL_A98786                                                    ;A98791;
    STA.W $178C                                                          ;A98794;
    LDA.W $0FC6                                                          ;A98797;
    AND.W #$0100                                                         ;A9879A;
    BEQ RTL_A98786                                                       ;A9879D;
    JMP.W ($0FE8)                                                        ;A9879F;


Function_MotherBrain_SetupBrainAndNeckToBeDrawn:
    LDA.W $0A78                                                          ;A987A2;
    BNE .timeIsFrozen                                                    ;A987A5;
    JSR.W HandleMotherBrainsNeck                                         ;A987A7;

.timeIsFrozen:
    LDA.L $7E805C                                                        ;A987AA;
    STA.W $0FBA                                                          ;A987AE;
    LDA.W #$FFEB                                                         ;A987B1;
    CLC                                                                  ;A987B4;
    ADC.L $7E805E                                                        ;A987B5;
    STA.W $0FBE                                                          ;A987B9;
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck>>8&$FF00  ;A987BC;
    STA.W $178D                                                          ;A987BF;
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck           ;A987C2;
    STA.W $178C                                                          ;A987C5;
    RTL                                                                  ;A987C8;


EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck:
    JSR.W DrawMotherBrainHead                                            ;A987C9;
    JSR.W DrawMotherBrainsNeck                                           ;A987CC;
    RTL                                                                  ;A987CF;


Function_MotherBrain_SetupBrainToBeDrawn:
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrain>>8&$FF00         ;A987D0;
    STA.W $178D                                                          ;A987D3;
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrain                  ;A987D6;
    STA.W $178C                                                          ;A987D9;
    RTL                                                                  ;A987DC;


EnemyGraphicsDrawnHook_MotherBrain_DrawBrain:
    JSR.W DrawMotherBrainHead                                            ;A987DD;
    RTL                                                                  ;A987E0;


Function_MotherBrain_FirstPhase:
    LDA.W #$0002                                                         ;A987E1;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;A987E4;
    BCC .runCollisionDetection                                           ;A987E8;
    LDA.W $1840                                                          ;A987EA;
    STA.L $7E7840                                                        ;A987ED;
    LDA.W $0AF6                                                          ;A987F1;
    CMP.W #$00EC                                                         ;A987F4;
    BPL .runCollisionDetection                                           ;A987F7;
    LDA.W $0FCC                                                          ;A987F9;
    BNE .runCollisionDetection                                           ;A987FC;
    LDA.W #$0001                                                         ;A987FE;
    STA.L $7E783A                                                        ;A98801;
    STA.L $7E7800                                                        ;A98805;
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A98809;
    LDA.W #$0006                                                         ;A9880D;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A98810;
    JSL.L SealMotherBrainsWallFunction_FakeDeath_Descent                 ;A98814;

.runCollisionDetection:
    JSR.W MotherBrain_vs_Samus_CollisionDetection                        ;A98818;
    PLA                                                                  ;A9881B;
    RTL                                                                  ;A9881C;


Function_MotherBrainBody_FakeDeath_Descent_InitialPause:
    LDA.W #Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion   ;A9881D;
    STA.W $0FA8                                                          ;A98820;
    LDA.W #$0040                                                         ;A98823;
    STA.W $0FB2                                                          ;A98826; fallthrough to Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion

Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion:
    DEC.W $0FB2                                                          ;A98829;
    BMI .timerExpired                                                    ;A9882C;
    RTS                                                                  ;A9882E;


.timerExpired:
    LDA.W #$0000                                                         ;A9882F;
    JSL.L Run_Samus_Command                                              ;A98832;
    LDA.L $7ECD20                                                        ;A98836;
    AND.W #$00FF                                                         ;A9883A;
    STA.L $7ECD20                                                        ;A9883D;
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_QueueMusic         ;A98841;
    STA.W $0FA8                                                          ;A98844;
    LDA.W #$0020                                                         ;A98847;
    STA.W $0FB2                                                          ;A9884A;

Function_MotherBrainBody_FakeDeath_Descent_QueueMusic:
    DEC.W $0FB2                                                          ;A9884D;
    BPL Function_MBBody_FakeDeath_Descent_return                         ;A98850;
    LDA.W #$0000                                                         ;A98852;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A98855;
    LDA.W #$FF21                                                         ;A98859;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9885C;
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus        ;A98860;
    STA.W $0FA8                                                          ;A98863;
    LDA.W #$000C                                                         ;A98866;
    STA.W $0FB2                                                          ;A98869; fallthrough to Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus

Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus:
    DEC.W $0FB2                                                          ;A9886C;
    BPL Function_MBBody_FakeDeath_Descent_return                         ;A9886F;
    LDA.W #$0001                                                         ;A98871;
    JSL.L Run_Samus_Command                                              ;A98874;
    LDA.W #Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid  ;A98878;
    STA.W $0FA8                                                          ;A9887B;
    LDA.W #$0008                                                         ;A9887E;
    STA.W $0FB2                                                          ;A98881; fallthrough to Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid

Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid:
    DEC.W $0FB2                                                          ;A98884;
    BPL Function_MBBody_FakeDeath_Descent_return                         ;A98887;
    JSR.W MotherBrainPalette_BeginScreenFlashing                         ;A98889;
    LDA.W #$0002                                                         ;A9888C;
    JSL.L Load_FX_Entry                                                  ;A9888F;
    LDA.W #Function_MotherBrainBody_SpawnTubesFallingWhenLessThan4Proj   ;A98893;
    STA.W $0FF0                                                          ;A98896;
    LDA.W #Function_MBBody_FakeDeath_Descent_TransitionMBPaletteToGrey   ;A98899;
    STA.W $0FA8                                                          ;A9889C;
    STZ.W $0FB2                                                          ;A9889F;
    LDA.W #$0000                                                         ;A988A2;
    STA.L $7E802E                                                        ;A988A5;
    JSL.L Spawn_Hardcoded_PLM                                            ;A988A9;
    db $0E,$02                                                           ;A988AD;
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom                    ;A988AF;

Function_MBBody_FakeDeath_Descent_return:
    RTS                                                                  ;A988B1;


Function_MBBody_FakeDeath_Descent_TransitionMBPaletteToGrey:
    DEC.W $0FB2                                                          ;A988B2;
    BPL Function_MBBody_FakeDeath_Descent_CollapseTubes                  ;A988B5;
    LDA.W #$0008                                                         ;A988B7;
    STA.W $0FB2                                                          ;A988BA;
    LDA.L $7E802E                                                        ;A988BD;
    INC A                                                                ;A988C1;
    STA.L $7E802E                                                        ;A988C2;
    DEC A                                                                ;A988C6;
    JSL.L TransitionMotherBrainPaletteToGrey_FakeDeath                   ;A988C7;
    BCC Function_MBBody_FakeDeath_Descent_CollapseTubes                  ;A988CB;
    LDA.W #Function_MBBody_FakeDeath_Descent_CollapseTubes               ;A988CD;
    STA.W $0FA8                                                          ;A988D0;

Function_MBBody_FakeDeath_Descent_CollapseTubes:
    PEA.W .manualReturn-1                                                ;A988D3;
    JMP.W ($0FF0)                                                        ;A988D6;


.manualReturn:
    JSR.W HandleFakeDeathExplosions                                      ;A988D9;
    RTS                                                                  ;A988DC;


HandleFakeDeathExplosions:
    LDA.L $7E8030                                                        ;A988DD;
    DEC A                                                                ;A988E1;
    BMI .timerExpired                                                    ;A988E2;
    STA.L $7E8030                                                        ;A988E4;
    RTS                                                                  ;A988E8;


.timerExpired:
    LDA.W #$0008                                                         ;A988E9;
    STA.L $7E8030                                                        ;A988EC;
    LDA.L $7E8032                                                        ;A988F0;
    DEC A                                                                ;A988F4;
    BPL +                                                                ;A988F5;
    LDA.W #$0007                                                         ;A988F7;

  + STA.L $7E8032                                                        ;A988FA;
    ASL A                                                                ;A988FE;
    ASL A                                                                ;A988FF;
    TAX                                                                  ;A98900;
    LDA.W .XPosition,X                                                   ;A98901;
    STA.B $12                                                            ;A98904;
    LDA.W .YPosition,X                                                   ;A98906;
    STA.B $14                                                            ;A98909;
    LDY.W #$0003                                                         ;A9890B;
    LDA.W $05E5                                                          ;A9890E;
    CMP.W #$4000                                                         ;A98911;
    BCS +                                                                ;A98914;
    LDY.W #$000C                                                         ;A98916;

  + TYA                                                                  ;A98919;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9891A;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9891D;
    LDA.W #$0024                                                         ;A98921;
    JSL.L QueueSound_Lib2_Max3                                           ;A98924;
    RTS                                                                  ;A98928;


.XPosition:
    dw $0088                                                             ;A98929;

.YPosition:
    dw $0074,$0078,$0084,$007C,$005A,$008A,$0092,$0078                   ;A9892B;
    dw $0034,$007C,$00AA,$008A,$0048,$0078,$00CE                         ;A9893B;

Function_MotherBrainBody_SpawnTubesFallingWhenLessThan4Proj:
    LDY.W #$0000                                                         ;A98949;
    TYX                                                                  ;A9894C;

.loop:
    LDA.W $1997,Y                                                        ;A9894D;
    BNE .nextProj                                                        ;A98950;
    INX                                                                  ;A98952;

.nextProj:
    INY                                                                  ;A98953;
    INY                                                                  ;A98954;
    CPY.W #$0024                                                         ;A98955;
    BMI .loop                                                            ;A98958;
    CPX.W #$0004                                                         ;A9895A;
    BPL .tooManyProjs                                                    ;A9895D;
    RTS                                                                  ;A9895F;


.tooManyProjs:
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomLeft           ;A98960;
    JSL.L SpawnEnemy                                                     ;A98963;
    LDA.W #Function_MotherBrainBody_ClearBottomLeftTube                  ;A98967;
    STA.W $0FF0                                                          ;A9896A;
    RTS                                                                  ;A9896D;


Function_MotherBrainBody_ClearBottomLeftTube:
    JSL.L Spawn_Hardcoded_PLM                                            ;A9896E;
    db $05,$09                                                           ;A98972;
    dw PLMEntries_clearMotherBrainsBottomLeftTube                        ;A98974;
    LDA.W #Function_MotherBrainBody_SpawnTopRightTubeFallingProjectile   ;A98976;
    STA.W $0FF0                                                          ;A98979;
    LDA.W #$0020                                                         ;A9897C;
    STA.W $0FF2                                                          ;A9897F;
    RTS                                                                  ;A98982;


Function_MotherBrainBody_SpawnTopRightTubeFallingProjectile:
    DEC.W $0FF2                                                          ;A98983;
    BPL .return                                                          ;A98986;
    LDA.W #$0098                                                         ;A98988;
    STA.B $12                                                            ;A9898B;
    LDA.W #$002F                                                         ;A9898D;
    STA.B $14                                                            ;A98990;
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopRight               ;A98992;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98995;
    LDA.W #Function_MotherBrainBody_ClearCeilingBlockColumn9             ;A98999;
    STA.W $0FF0                                                          ;A9899C;

.return:
    RTS                                                                  ;A9899F;


Function_MotherBrainBody_ClearCeilingBlockColumn9:
    JSL.L Spawn_Hardcoded_PLM                                            ;A989A0;
    db $09,$02                                                           ;A989A4;
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom                    ;A989A6;
    LDA.W #Function_MotherBrainBody_SpawnTopLeftTubeFallingProjectile    ;A989A8;
    STA.W $0FF0                                                          ;A989AB;
    LDA.W #$0020                                                         ;A989AE;
    STA.W $0FF2                                                          ;A989B1;
    RTS                                                                  ;A989B4;


Function_MotherBrainBody_SpawnTopLeftTubeFallingProjectile:
    DEC.W $0FF2                                                          ;A989B5;
    BPL .return                                                          ;A989B8;
    LDA.W #$0068                                                         ;A989BA;
    STA.B $12                                                            ;A989BD;
    LDA.W #$002F                                                         ;A989BF;
    STA.B $14                                                            ;A989C2;
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopLeft                ;A989C4;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A989C7;
    LDA.W #Function_MotherBrainBody_ClearCeilingBlockColumn6             ;A989CB;
    STA.W $0FF0                                                          ;A989CE;

.return:
    RTS                                                                  ;A989D1;


Function_MotherBrainBody_ClearCeilingBlockColumn6:
    JSL.L Spawn_Hardcoded_PLM                                            ;A989D2;
    db $06,$02                                                           ;A989D6;
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom                    ;A989D8;
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling1                   ;A989DA;
    STA.W $0FF0                                                          ;A989DD;
    LDA.W #$0020                                                         ;A989E0;
    STA.W $0FF2                                                          ;A989E3;
    RTS                                                                  ;A989E6;


Function_MotherBrainBody_SpawnTubesFalling1:
    DEC.W $0FF2                                                          ;A989E7;
    BPL .return                                                          ;A989EA;
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomRight          ;A989EC;
    JSL.L SpawnEnemy                                                     ;A989EF;
    LDA.W #Function_MotherBrainBody_ClearBottomRightTube                 ;A989F3;
    STA.W $0FF0                                                          ;A989F6;

.return:
    RTS                                                                  ;A989F9;


Function_MotherBrainBody_ClearBottomRightTube:
    JSL.L Spawn_Hardcoded_PLM                                            ;A989FA;
    db $0A,$09                                                           ;A989FE;
    dw PLMEntries_clearMotherBrainsBottomRightTube                       ;A98A00;
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling2                   ;A98A02;
    STA.W $0FF0                                                          ;A98A05;
    LDA.W #$0020                                                         ;A98A08;
    STA.W $0FF2                                                          ;A98A0B;
    RTS                                                                  ;A98A0E;


Function_MotherBrainBody_SpawnTubesFalling2:
    DEC.W $0FF2                                                          ;A98A0F;
    BPL .return                                                          ;A98A12;
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomMiddleLeft     ;A98A14;
    JSL.L SpawnEnemy                                                     ;A98A17;
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleLeftTube            ;A98A1B;
    STA.W $0FF0                                                          ;A98A1E;

.return:
    RTS                                                                  ;A98A21;


Function_MotherBrainBody_ClearBottomMiddleLeftTube:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98A22;
    db $06,$0A                                                           ;A98A26;
    dw PLMEntries_clearMotherBrainsBottomMiddleSideTube                  ;A98A28;
    LDA.W #Function_MotherBrainBody_SpawnTopMiddleLeftTubeFallingProj    ;A98A2A;
    STA.W $0FF0                                                          ;A98A2D;
    LDA.W #$0020                                                         ;A98A30;
    STA.W $0FF2                                                          ;A98A33;
    RTS                                                                  ;A98A36;


Function_MotherBrainBody_SpawnTopMiddleLeftTubeFallingProj:
    DEC.W $0FF2                                                          ;A98A37;
    BPL .return                                                          ;A98A3A;
    LDA.W #$0078                                                         ;A98A3C;
    STA.B $12                                                            ;A98A3F;
    LDA.W #$003B                                                         ;A98A41;
    STA.B $14                                                            ;A98A44;
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopMiddleLeft          ;A98A46;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98A49;
    LDA.W #Function_MotherBrainBody_ClearCeilingTubeColumn7              ;A98A4D;
    STA.W $0FF0                                                          ;A98A50;

.return:
    RTS                                                                  ;A98A53;


Function_MotherBrainBody_ClearCeilingTubeColumn7:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98A54;
    db $07,$02                                                           ;A98A58;
    dw PLMEntries_clearCeilingTubeInMotherBrainsRoom                     ;A98A5A;
    LDA.W #Function_MotherBrainBody_SpawnTopMiddleRightTubeFallingProj   ;A98A5C;
    STA.W $0FF0                                                          ;A98A5F;
    LDA.W #$0020                                                         ;A98A62;
    STA.W $0FF2                                                          ;A98A65;
    RTS                                                                  ;A98A68;


Function_MotherBrainBody_SpawnTopMiddleRightTubeFallingProj:
    DEC.W $0FF2                                                          ;A98A69;
    BPL .return                                                          ;A98A6C;
    LDA.W #$0088                                                         ;A98A6E;
    STA.B $12                                                            ;A98A71;
    LDA.W #$003B                                                         ;A98A73;
    STA.B $14                                                            ;A98A76;
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopMiddleRight         ;A98A78;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98A7B;
    LDA.W #Function_MotherBrainBody_ClearCeilingTubeColumn8              ;A98A7F;
    STA.W $0FF0                                                          ;A98A82;

.return:
    RTS                                                                  ;A98A85;


Function_MotherBrainBody_ClearCeilingTubeColumn8:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98A86;
    db $08,$02                                                           ;A98A8A;
    dw PLMEntries_clearCeilingTubeInMotherBrainsRoom                     ;A98A8C;
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling3                   ;A98A8E;
    STA.W $0FF0                                                          ;A98A91;
    LDA.W #$0020                                                         ;A98A94;
    STA.W $0FF2                                                          ;A98A97;
    RTS                                                                  ;A98A9A;


Function_MotherBrainBody_SpawnTubesFalling3:
    DEC.W $0FF2                                                          ;A98A9B;
    BPL .return                                                          ;A98A9E;
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomMiddleRight    ;A98AA0;
    JSL.L SpawnEnemy                                                     ;A98AA3;
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleRightTube           ;A98AA7;
    STA.W $0FF0                                                          ;A98AAA;

.return:
    RTS                                                                  ;A98AAD;


Function_MotherBrainBody_ClearBottomMiddleRightTube:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98AAE;
    db $09,$0A                                                           ;A98AB2;
    dw PLMEntries_clearMotherBrainsBottomMiddleSideTube                  ;A98AB4;
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling4                   ;A98AB6;
    STA.W $0FF0                                                          ;A98AB9;
    LDA.W #$0002                                                         ;A98ABC;
    STA.W $0FF2                                                          ;A98ABF;
    RTS                                                                  ;A98AC2;


Function_MotherBrainBody_SpawnTubesFalling4:
    DEC.W $0FF2                                                          ;A98AC3;
    BPL .return                                                          ;A98AC6;
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_MainTube             ;A98AC8;
    JSL.L SpawnEnemy                                                     ;A98ACB;
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleTubes               ;A98ACF;
    STA.W $0FF0                                                          ;A98AD2;

.return:
    RTS                                                                  ;A98AD5;


Function_MotherBrainBody_ClearBottomMiddleTubes:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98AD6;
    db $07,$07                                                           ;A98ADA;
    dw PLMEntries_clearMotherBrainsBottomMiddleTubes                     ;A98ADC;
    LDA.W #RTS_A98AE4                                                    ;A98ADE;
    STA.W $0FF0                                                          ;A98AE1; fallthrough to RTS_A98AE4

RTS_A98AE4:
    RTS                                                                  ;A98AE4;


EnemyPopulations_MotherBrainFallingTubes_BottomLeft:
    dw EnemyHeaders_MotherBrainTubes                                     ;A98AE5;
    dw $0060,$00B3                                                       ;A98AE7;
    dw InstList_MotherBrainTubes_0                                       ;A98AEB;
    dw $A000,$0000,$0000,$0000                                           ;A98AED;

EnemyPopulations_MotherBrainFallingTubes_BottomRight:
    dw EnemyHeaders_MotherBrainTubes                                     ;A98AF5;
    dw $00A0,$00B3                                                       ;A98AF7;
    dw InstList_MotherBrainTubes_1                                       ;A98AFB;
    dw $A000,$0000,$0002,$0000                                           ;A98AFD;

EnemyPopulations_MotherBrainFallingTubes_BottomMiddleLeft:
    dw EnemyHeaders_MotherBrainTubes                                     ;A98B05;
    dw $0068,$00BB                                                       ;A98B07;
    dw InstList_MotherBrainTubes_2                                       ;A98B0B;
    dw $A000,$0000,$0004,$0000                                           ;A98B0D;

EnemyPopulations_MotherBrainFallingTubes_BottomMiddleRight:
    dw EnemyHeaders_MotherBrainTubes                                     ;A98B15;
    dw $0098,$00BB                                                       ;A98B17;
    dw InstList_MotherBrainTubes_3                                       ;A98B1B;
    dw $A000,$0000,$0006,$0000                                           ;A98B1D;

EnemyPopulations_MotherBrainFallingTubes_MainTube:
    dw EnemyHeaders_MotherBrainTubes                                     ;A98B25;
    dw $0080,$00A7                                                       ;A98B27;
    dw InstList_MotherBrainTubes_4                                       ;A98B2B;
    dw $A800,$0000,$0008,$0020                                           ;A98B2D;

InitAI_MotherBrainTubes:
    LDX.W $0E54                                                          ;A98B35;
    LDY.W $0FB4,X                                                        ;A98B38;
    LDA.W .XRaidius,Y                                                    ;A98B3B;
    STA.W $0F82,X                                                        ;A98B3E;
    LDA.W .YRadius,Y                                                     ;A98B41;
    STA.W $0F84,X                                                        ;A98B44;
    LDA.W .YPositionThreshold,Y                                          ;A98B47;
    STA.W $0FAA,X                                                        ;A98B4A;
    STZ.W $0FAE,X                                                        ;A98B4D;
    STZ.W $0FB0,X                                                        ;A98B50;
    STZ.W $0FAC,X                                                        ;A98B53;
    LDA.W .functionPointer,Y                                             ;A98B56;
    STA.W $0FA8,X                                                        ;A98B59;
    RTL                                                                  ;A98B5C;


.XRaidius:
    dw $0010,$0010,$0008,$0008,$0010                                     ;A98B5D;

.YRadius:
    dw $0020,$0020,$0018,$0018,$0020                                     ;A98B67;

.YPositionThreshold:
    dw $00F8,$00F8,$00F0,$00F0,$00F6                                     ;A98B71;

.functionPointer:
    dw Function_MotherBrainTubes_NonMainTube                             ;A98B7B;
    dw Function_MotherBrainTubes_NonMainTube                             ;A98B7D;
    dw Function_MotherBrainTubes_NonMainTube                             ;A98B7F;
    dw Function_MotherBrainTubes_NonMainTube                             ;A98B81;
    dw Function_MotherBrainTubes_MainTube_WaitingToFall                  ;A98B83;

MainAI_MotherBrainTubes:
    JMP.W ($0FA8,X)                                                      ;A98B85;


Function_MotherBrainTubes_NonMainTube:
    LDA.W $0FAC,X                                                        ;A98B88;
    CLC                                                                  ;A98B8B;
    ADC.W #$0006                                                         ;A98B8C;
    STA.W $0FAC,X                                                        ;A98B8F;
    JSR.W AddADividedBy100ToEnemyYPosition                               ;A98B92;
    LDA.W $0F7E,X                                                        ;A98B95;
    CMP.W $0FAA,X                                                        ;A98B98;
    BPL ExplodeMotherBrainTubes                                          ;A98B9B;

HandleFallingTubeSmoke:
    DEC.W $0FAE,X                                                        ;A98B9D;
    BPL HandleFallingTubeSmoke_return                                    ;A98BA0;
    JSR.W SpawnFallingTubeSmoke                                          ;A98BA2;

HandleFallingTubeSmoke_return:
    RTL                                                                  ;A98BA5;


ExplodeMotherBrainTubes:
    LDA.W $0F86,X                                                        ;A98BA6;
    ORA.W #$0200                                                         ;A98BA9;
    STA.W $0F86,X                                                        ;A98BAC;
    LDA.W $0F7A,X                                                        ;A98BAF;
    STA.B $12                                                            ;A98BB2;
    LDA.W $0F7E,X                                                        ;A98BB4;
    STA.B $14                                                            ;A98BB7;
    LDA.W #$0003                                                         ;A98BB9;
    LDY.W #EnemyProjectile_MiscDust                                      ;A98BBC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98BBF;
    LDA.W #$0024                                                         ;A98BC3;
    JSL.L QueueSound_Lib2_Max3                                           ;A98BC6;
    RTL                                                                  ;A98BCA;


Function_MotherBrainTubes_MainTube_WaitingToFall:
    DEC.W $0FB6,X                                                        ;A98BCB;
    BPL HandleFallingTubeSmoke_return                                    ;A98BCE;
    LDA.W #Function_MotherBrainTubes_MainTube_Falling                    ;A98BD0;
    STA.W $0FA8,X                                                        ;A98BD3; fallthrough to Function_MotherBrainTubes_MainTube_Falling


Function_MotherBrainTubes_MainTube_Falling:
    LDA.W $0FAC,X                                                        ;A98BD6;
    CLC                                                                  ;A98BD9;
    ADC.W #$0006                                                         ;A98BDA;
    STA.W $0FAC,X                                                        ;A98BDD;
    JSR.W AddADividedBy100ToEnemyYPosition                               ;A98BE0;
    PHA                                                                  ;A98BE3;
    CMP.W #$00F4                                                         ;A98BE4;
    BMI .lessThanF4                                                      ;A98BE7;
    LDA.W $0F86,X                                                        ;A98BE9;
    ORA.W #$0100                                                         ;A98BEC;
    STA.W $0F86,X                                                        ;A98BEF;

.lessThanF4:
    PLA                                                                  ;A98BF2;
    SEC                                                                  ;A98BF3;
    SBC.W #$0038                                                         ;A98BF4;
    CMP.W #$00C4                                                         ;A98BF7;
    STA.W $0FBE                                                          ;A98BFA;
    BPL .greaterThanEqualToC4                                            ;A98BFD;
    JMP.W HandleFallingTubeSmoke                                         ;A98BFF;


.greaterThanEqualToC4:
    JSR.W MotherBrainPalette_EndScreenFlashing                           ;A98C02;
    LDA.W #$0019                                                         ;A98C05;
    JSL.L EnableEarthquakeTypeInAFor20Frames                             ;A98C08;
    STZ.W $18B4                                                          ;A98C0C;
    STZ.W $18B6                                                          ;A98C0F;
    STZ.W $0FAC,X                                                        ;A98C12;
    LDA.W #$00C4                                                         ;A98C15;
    STA.W $0FBE                                                          ;A98C18;
    LDA.W #$003B                                                         ;A98C1B;
    STA.W $0F7A                                                          ;A98C1E;
    LDA.W #$0117                                                         ;A98C21;
    STA.W $0F7E                                                          ;A98C24;
    JSR.W SetupMotherBrainsNeckForFakeDeathAscent                        ;A98C27;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows2_3  ;A98C2A;
    STA.W $0FA8                                                          ;A98C2D;
    LDX.W $0E54                                                          ;A98C30;
    JMP.W ExplodeMotherBrainTubes                                        ;A98C33;


SpawnFallingTubeSmoke:
    LDA.W #$0008                                                         ;A98C36;
    STA.W $0FAE,X                                                        ;A98C39;
    LDA.W $0FB0,X                                                        ;A98C3C;
    INC A                                                                ;A98C3F;
    AND.W #$0003                                                         ;A98C40;
    STA.W $0FB0,X                                                        ;A98C43;
    ASL A                                                                ;A98C46;
    TAY                                                                  ;A98C47;
    LDA.W .data,Y                                                        ;A98C48;
    CLC                                                                  ;A98C4B;
    ADC.W $0F7A,X                                                        ;A98C4C;
    STA.B $12                                                            ;A98C4F;
    LDA.W #$00D0                                                         ;A98C51;
    STA.B $14                                                            ;A98C54;
    LDA.W #$0009                                                         ;A98C56;
    LDY.W #EnemyProjectile_MiscDust                                      ;A98C59;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98C5C;
    RTS                                                                  ;A98C60;


.data:
    dw $FFF8,$0002,$FFFC,$0006                                           ;A98C61;

InstList_MotherBrainTubes_0:
    dw $0001                                                             ;A98C69;
    dw Spritemaps_MotherBrainTubes_0                                     ;A98C6B;
    dw Instruction_Common_Sleep                                          ;A98C6D;

InstList_MotherBrainTubes_1:
    dw $0001                                                             ;A98C6F;
    dw Spritemaps_MotherBrainTubes_1                                     ;A98C71;
    dw Instruction_Common_Sleep                                          ;A98C73;

InstList_MotherBrainTubes_2:
    dw $0001                                                             ;A98C75;
    dw Spritemaps_MotherBrainTubes_2                                     ;A98C77;
    dw Instruction_Common_Sleep                                          ;A98C79;

InstList_MotherBrainTubes_3:
    dw $0001                                                             ;A98C7B;
    dw Spritemaps_MotherBrainTubes_3                                     ;A98C7D;
    dw Instruction_Common_Sleep                                          ;A98C7F;

InstList_MotherBrainTubes_4:
    dw $0001                                                             ;A98C81;
    dw Spritemaps_MotherBrainTubes_4                                     ;A98C83;
    dw Instruction_Common_Sleep                                          ;A98C85;

Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows2_3:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98C87;
    db $02,$02                                                           ;A98C8B;
    dw PLMEntries_motherBrainsBackgroundRow2                             ;A98C8D;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98C8F;
    db $02,$03                                                           ;A98C93;
    dw PLMEntries_motherBrainsBackgroundRow3                             ;A98C95;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows4_5  ;A98C97;
    STA.W $0FA8                                                          ;A98C9A;
    RTS                                                                  ;A98C9D;


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows4_5:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98C9E;
    db $02,$04                                                           ;A98CA2;
    dw PLMEntries_motherBrainsBackgroundRow4                             ;A98CA4;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CA6;
    db $02,$05                                                           ;A98CAA;
    dw PLMEntries_motherBrainsBackgroundRow5                             ;A98CAC;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows6_7  ;A98CAE;
    STA.W $0FA8                                                          ;A98CB1;
    RTS                                                                  ;A98CB4;


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows6_7:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CB5;
    db $02,$06                                                           ;A98CB9;
    dw PLMEntries_motherBrainsBackgroundRow6                             ;A98CBB;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CBD;
    db $02,$07                                                           ;A98CC1;
    dw PLMEntries_motherBrainsBackgroundRow7                             ;A98CC3;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows8_9  ;A98CC5;
    STA.W $0FA8                                                          ;A98CC8;
    RTS                                                                  ;A98CCB;


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows8_9:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CCC;
    db $02,$08                                                           ;A98CD0;
    dw PLMEntries_motherBrainsBackgroundRow8                             ;A98CD2;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CD4;
    db $02,$09                                                           ;A98CD8;
    dw PLMEntries_motherBrainsBackgroundRow9                             ;A98CDA;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsA_B  ;A98CDC;
    STA.W $0FA8                                                          ;A98CDF;
    RTS                                                                  ;A98CE2;


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsA_B:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CE3;
    db $02,$0A                                                           ;A98CE7;
    dw PLMEntries_motherBrainsBackgroundRowA                             ;A98CE9;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CEB;
    db $02,$0B                                                           ;A98CEF;
    dw PLMEntries_motherBrainsBackgroundRowB                             ;A98CF1;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsC_D  ;A98CF3;
    STA.W $0FA8                                                          ;A98CF6;
    RTS                                                                  ;A98CF9;


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsC_D:
    JSL.L Spawn_Hardcoded_PLM                                            ;A98CFA;
    db $02,$0C                                                           ;A98CFE;
    dw PLMEntries_motherBrainsBackgroundRowC                             ;A98D00;
    JSL.L Spawn_Hardcoded_PLM                                            ;A98D02;
    db $02,$0D                                                           ;A98D06;
    dw PLMEntries_motherBrainsBackgroundRowD                             ;A98D08;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2GFX    ;A98D0A;
    STA.W $0FA8                                                          ;A98D0D;
    RTS                                                                  ;A98D10;


Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2GFX:
    LDA.W #$0101                                                         ;A98D11;
    STA.W $091B                                                          ;A98D14;
    LDA.B $59                                                            ;A98D17;
    AND.W #$FFFC                                                         ;A98D19;
    STA.B $59                                                            ;A98D1C;
    LDY.W #Palette_MotherBrain_Attacks+2                                 ;A98D1E;
    LDX.W #$0142                                                         ;A98D21;
    LDA.W #$000F                                                         ;A98D24;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A98D27;
    LDY.W #Palette_MotherBrain_BackLeg+2                                 ;A98D2B;
    LDX.W #$0162                                                         ;A98D2E;
    LDA.W #$000F                                                         ;A98D31;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A98D34;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2Brain  ;A98D38;
    STA.W $0FA8                                                          ;A98D3B;
    LDA.W #$0001                                                         ;A98D3E;
    STA.W $0E1E                                                          ;A98D41;
    STA.L $7E7844                                                        ;A98D44;
    RTS                                                                  ;A98D48;


Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2Brain:
    LDA.W #$0034                                                         ;A98D49;
    STA.W $1982                                                          ;A98D4C;
    LDA.W #Function_MotherBrain_SetupBrainAndNeckToBeDrawn               ;A98D4F;
    STA.W $0FE8                                                          ;A98D52;
    LDA.W $0F86                                                          ;A98D55;
    AND.W #$FBFF                                                         ;A98D58;
    STA.W $0F86                                                          ;A98D5B;
    LDA.W $0FC6                                                          ;A98D5E;
    AND.W #$FBFF                                                         ;A98D61;
    STA.W $0FC6                                                          ;A98D64;
    LDA.W #$4650                                                         ;A98D67;
    STA.W $0FCC                                                          ;A98D6A;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense    ;A98D6D;
    STA.W $0FA8                                                          ;A98D70;
    LDA.W #$0080                                                         ;A98D73;
    STA.W $0FB2                                                          ;A98D76; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense

Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense:
    DEC.W $0FB2                                                          ;A98D79;
    BMI .timerExpired                                                    ;A98D7C;
    RTS                                                                  ;A98D7E;


.timerExpired:
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising  ;A98D7F;
    STA.W $0FA8                                                          ;A98D82;
    LDA.W #$0020                                                         ;A98D85;
    STA.W $0FB2                                                          ;A98D88; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising

Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising:
    DEC.W $0FB2                                                          ;A98D8B;
    BMI .timerExpired                                                    ;A98D8E;
    RTS                                                                  ;A98D90;


.timerExpired:
    JSL.L Spawn_MotherBrainRising_HDMAObject                             ;A98D91;
    STA.L $7E7812                                                        ;A98D95;
    LDA.W $0FC6                                                          ;A98D99;
    ORA.W #$0100                                                         ;A98D9C;
    STA.W $0FC6                                                          ;A98D9F;
    LDA.W #InstList_MotherBrainHead_Initial                              ;A98DA2;
    JSR.W SetMotherBrainHeadInstList                                     ;A98DA5;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles      ;A98DA8;
    STA.W $0FA8                                                          ;A98DAB;
    LDA.W #$0100                                                         ;A98DAE;
    STA.W $0FB2                                                          ;A98DB1; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles

Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_legs                ;A98DB4;
    JSR.W ProcessSpriteTilesTransfers                                    ;A98DB7;
    BCS .finishedLoading                                                 ;A98DBA;
    RTS                                                                  ;A98DBC;


.finishedLoading:
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing     ;A98DBD;
    STA.W $0FA8                                                          ;A98DC0; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing


Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing:
    DEC.W $0FB2                                                          ;A98DC3;
    BPL .return                                                          ;A98DC6;
    LDA.W #$003B                                                         ;A98DC8;
    STA.W $0F7A                                                          ;A98DCB;
    LDA.W #$0117                                                         ;A98DCE;
    STA.W $0F7E                                                          ;A98DD1;
    LDA.W #$FFE5                                                         ;A98DD4;
    STA.B $B5                                                            ;A98DD7;
    LDA.W #$FF27                                                         ;A98DD9;
    STA.B $B7                                                            ;A98DDC;
    LDA.W #$0007                                                         ;A98DDE;
    STA.L $7E7808                                                        ;A98DE1;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_StartMusic_Quake    ;A98DE5;
    STA.W $0FA8                                                          ;A98DE8;

.return:
    RTS                                                                  ;A98DEB;


Function_MotherBrainBody_FakeDeath_Ascent_StartMusic_Quake:
    LDA.W #InstList_MotherBrainBody_Crouched                             ;A98DEC;
    JSR.W SetMotherBrainBodyInstList                                     ;A98DEF;
    LDA.W #$0001                                                         ;A98DF2;
    STA.W $0FD4                                                          ;A98DF5;
    LDA.W $0F86                                                          ;A98DF8;
    AND.W #$FEFF                                                         ;A98DFB;
    STA.W $0F86                                                          ;A98DFE;
    LDA.W #$003B                                                         ;A98E01;
    STA.W $0F7A                                                          ;A98E04;
    LDA.W #$0117                                                         ;A98E07;
    STA.W $0F7E                                                          ;A98E0A;
    LDA.W #$FFE5                                                         ;A98E0D;
    STA.B $B5                                                            ;A98E10;
    LDA.W #$FF27                                                         ;A98E12;
    STA.B $B7                                                            ;A98E15;
    LDA.W #$0005                                                         ;A98E17;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A98E1A;
    LDA.W #$0002                                                         ;A98E1E;
    STA.W $183E                                                          ;A98E21;
    LDA.W #$0100                                                         ;A98E24;
    STA.W $1840                                                          ;A98E27;
    LDA.W #$0050                                                         ;A98E2A;
    STA.L $7E8068                                                        ;A98E2D;
    LDA.W #$0001                                                         ;A98E31;
    STA.L $7E8062                                                        ;A98E34;
    LDA.W #$0008                                                         ;A98E38;
    STA.L $7E8064                                                        ;A98E3B;
    LDA.W #$0006                                                         ;A98E3F;
    STA.L $7E8066                                                        ;A98E42;
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_RaiseMotherBrain    ;A98E46;
    STA.W $0FA8                                                          ;A98E49;
    RTS                                                                  ;A98E4C;


Function_MotherBrainBody_FakeDeath_Ascent_RaiseMotherBrain:
    LDA.W $05B6                                                          ;A98E4D;
    AND.W #$0003                                                         ;A98E50;
    BNE Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return        ;A98E53;
    JSR.W SpawnDustCloudsForMotherBrainsAscent                           ;A98E55;
    LDA.W #$0002                                                         ;A98E58;
    STA.B $12                                                            ;A98E5B;
    LDA.B $B7                                                            ;A98E5D;
    CLC                                                                  ;A98E5F;
    ADC.B $12                                                            ;A98E60;
    STA.B $B7                                                            ;A98E62;
    LDA.W $0F7E                                                          ;A98E64;
    SEC                                                                  ;A98E67;
    SBC.B $12                                                            ;A98E68;
    STA.W $0F7E                                                          ;A98E6A;
    CMP.W #$00BD                                                         ;A98E6D;
    BCS Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return        ;A98E70;
    LDA.W #$0140                                                         ;A98E72;
    STA.W $179A                                                          ;A98E75;
    LDA.W #$00BC                                                         ;A98E78;
    STA.W $0F7E                                                          ;A98E7B;
    STZ.W $1840                                                          ;A98E7E;
    LDA.L $7E7812                                                        ;A98E81;
    TAX                                                                  ;A98E85;
    STZ.W $18B4,X                                                        ;A98E86;
    LDA.W #InstList_MotherBrainBody_StandingUpAfterCrouching_Slow        ;A98E89;
    JSR.W SetMotherBrainBodyInstList                                     ;A98E8C;
    LDA.W #Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch            ;A98E8F;
    STA.W $0FA8                                                          ;A98E92; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_WaitForMBUncrouch

Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch:
    LDA.L $7E7804                                                        ;A98E95;
    BEQ Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_standing      ;A98E99;

Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return:
    RTS                                                                  ;A98E9B;


Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_standing:
    STA.L $7E802E                                                        ;A98E9C;
    LDA.W #Function_MBBody_FakeDeath_Ascent_TransitionFromGreyLowerHead  ;A98EA0;
    STA.W $0FA8                                                          ;A98EA3;
    STZ.W $0FB2                                                          ;A98EA6;
    RTS                                                                  ;A98EA9;


Function_MBBody_FakeDeath_Ascent_TransitionFromGreyLowerHead:
    DEC.W $0FB2                                                          ;A98EAA;
    BPL .return                                                          ;A98EAD;
    LDA.W #$0004                                                         ;A98EAF;
    STA.W $0FB2                                                          ;A98EB2;
    LDA.L $7E802E                                                        ;A98EB5;
    INC A                                                                ;A98EB9;
    STA.L $7E802E                                                        ;A98EBA;
    DEC A                                                                ;A98EBE;
    JSL.L TransitionMotherBrainPaletteFromGrey_FakeDeath                 ;A98EBF;
    BCC .return                                                          ;A98EC3;
    LDA.W #$0001                                                         ;A98EC5;
    STA.L $7E7860                                                        ;A98EC8;
    INC A                                                                ;A98ECC;
    STA.L $7E7800                                                        ;A98ECD;
    DEC A                                                                ;A98ED1;
    STA.L $7E7864                                                        ;A98ED2;
    LDA.W #$0006                                                         ;A98ED6;
    STA.L $7E8064                                                        ;A98ED9;
    STA.L $7E8066                                                        ;A98EDD;
    LDA.W #$0500                                                         ;A98EE1;
    STA.L $7E8068                                                        ;A98EE4;
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_ShakeHeadMenacing  ;A98EE8;
    STA.W $0FA8                                                          ;A98EEB;
    LDA.W #$0017                                                         ;A98EEE;
    STA.W $0FB2                                                          ;A98EF1;

.return:
    RTS                                                                  ;A98EF4;


Function_MotherBrainBody_Phase2_Stretching_ShakeHeadMenacing:
    DEC.W $0FB2                                                          ;A98EF5;
    BMI .timerExpired                                                    ;A98EF8;
    RTS                                                                  ;A98EFA;


.timerExpired:
    LDA.W #InstList_MotherBrainHead_Stretching_Phase2_0                  ;A98EFB;
    JSR.W SetMotherBrainHeadInstList                                     ;A98EFE;
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp    ;A98F01;
    STA.W $0FA8                                                          ;A98F04;
    LDA.W #$0040                                                         ;A98F07;
    STA.L $7E8068                                                        ;A98F0A;
    LDA.W #$0100                                                         ;A98F0E;
    STA.W $0FB2                                                          ;A98F11; fallthrough to Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp

Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp:
    DEC.W $0FB2                                                          ;A98F14;
    BPL Function_MotherBrainBody_Phase2_Stretching_FinishStretching_return ;A98F17;
    LDA.W #$0002                                                         ;A98F19;
    STA.L $7E8064                                                        ;A98F1C;
    LDA.W #$0004                                                         ;A98F20;
    STA.L $7E8066                                                        ;A98F23;
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_FinishStretching   ;A98F27;
    STA.W $0FA8                                                          ;A98F2A;
    LDA.W #$0040                                                         ;A98F2D;
    STA.W $0FB2                                                          ;A98F30; fallthrough to Function_MotherBrainBody_Phase2_Stretching_FinishStretching


Function_MotherBrainBody_Phase2_Stretching_FinishStretching:
    DEC.W $0FB2                                                          ;A98F33;
    BPL .return                                                          ;A98F36;
    LDA.W #$0001                                                         ;A98F38;
    STA.L $7E7868                                                        ;A98F3B;
    LDA.W #Function_MotherBrainBody_Phase2_Thinking                      ;A98F3F;
    STA.W $0FA8                                                          ;A98F42;

.return:
    RTS                                                                  ;A98F45;


SpawnDustCloudsForMotherBrainsAscent:
    DEC.W $0FF2                                                          ;A98F46;
    BPL .timerNotExpired                                                 ;A98F49;
    LDA.W #$0007                                                         ;A98F4B;
    STA.W $0FF2                                                          ;A98F4E;

.timerNotExpired:
    LDA.W $0FF2                                                          ;A98F51;
    ASL A                                                                ;A98F54;
    TAX                                                                  ;A98F55;
    LDA.W .XPositions,X                                                  ;A98F56;
    STA.B $12                                                            ;A98F59;
    LDA.W #$00D4                                                         ;A98F5B;
    STA.B $14                                                            ;A98F5E;
    LDA.W $05E5                                                          ;A98F60;
    AND.W #$0100                                                         ;A98F63;
    XBA                                                                  ;A98F66;
    TAX                                                                  ;A98F67;
    LDA.W .explosionType,X                                               ;A98F68;
    AND.W #$00FF                                                         ;A98F6B;
    LDY.W #EnemyProjectile_MiscDust                                      ;A98F6E;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A98F71;
    LDA.W #$0029                                                         ;A98F75;
    JSL.L QueueSound_Lib2_Max3                                           ;A98F78;
    RTS                                                                  ;A98F7C;


.explosionType:
    db $09,$12                                                           ;A98F7D;

.XPositions:
    dw $003D,$0054,$0020,$0035,$005A,$0043,$0067,$0029                   ;A98F7F;

MotherBrainFightSpriteTileTransferEntries:
  .legs
    dw $0200                                                             ;A98F8F;
    dl Tiles_MotherBrainLegs                                             ;A98F91;
    dw $7400,$0200                                                       ;A98F94;
    dl Tiles_MotherBrainLegs+$200                                        ;A98F98;
    dw $7500,$0200                                                       ;A98F9B;
    dl Tiles_MotherBrainLegs+$400                                        ;A98F9F;
    dw $7600,$0200                                                       ;A98FA2;
    dl Tiles_MotherBrainLegs+$600                                        ;A98FA6;
    dw $7700,$0200                                                       ;A98FA9;
    dl Tiles_MotherBrainLegs+$800                                        ;A98FAD;
    dw $7800,$0200                                                       ;A98FB0;
    dl Tiles_MotherBrainLegs+$A00                                        ;A98FB4;
    dw $7900,$0200                                                       ;A98FB7;
    dl Tiles_MotherBrainLegs+$C00                                        ;A98FBB;
    dw $7A00,$0200                                                       ;A98FBE;
    dl Tiles_MotherBrainLegs+$E00                                        ;A98FC2;
    dw $7B00                                                             ;A98FC5;

  .attacks
    dw $0200                                                             ;A98FC7;
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX                  ;A98FC9;
    dw $7C00,$0200                                                       ;A98FCC;
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$200             ;A98FD0;
    dw $7D00,$0200                                                       ;A98FD3;
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$400             ;A98FD7;
    dw $7E00,$0200                                                       ;A98FDA;
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$600             ;A98FDE;
    dw $7F00,$0000                                                       ;A98FE1;

  .babyMetroid
    dw $0200                                                             ;A98FE5;
    dl Tiles_BabyMetroid+$400                                            ;A98FE7;
    dw $7C00,$0200                                                       ;A98FEA;
    dl Tiles_BabyMetroid+$600                                            ;A98FEE;
    dw $7D00,$0200                                                       ;A98FF1;
    dl Tiles_BabyMetroid+$800                                            ;A98FF5;
    dw $7E00,$0200                                                       ;A98FF8;
    dl Tiles_BabyMetroid+$A00                                            ;A98FFC;
    dw $7F00,$0000                                                       ;A98FFF;

  .corpse
    dw $01C0                                                             ;A99003;
    dl Tiles_CorpseMotherBrain                                           ;A99005;
    dw $7A00,$01C0                                                       ;A99008;
    dl Tiles_CorpseMotherBrain+$200                                      ;A9900C;
    dw $7B00,$01C0                                                       ;A9900F;
    dl Tiles_CorpseMotherBrain+$400                                      ;A99013;
    dw $7C00,$01C0                                                       ;A99016;
    dl Tiles_CorpseMotherBrain+$600                                      ;A9901A;
    dw $7D00,$01C0                                                       ;A9901D;
    dl Tiles_CorpseMotherBrain+$800                                      ;A99021;
    dw $7E00,$01C0                                                       ;A99024;
    dl Tiles_CorpseMotherBrain+$A00                                      ;A99028;
    dw $7F00,$0000                                                       ;A9902B;

  .explodedDoor
    dw $0200                                                             ;A9902F;
    dl Tiles_MotherBrainExplodedEscapeDoorParticles                      ;A99031;
    dw $7000,$0200                                                       ;A99034;
    dl Tiles_MotherBrainExplodedEscapeDoorParticles+$200                 ;A99038;
    dw $7100,$0000                                                       ;A9903B;

SetupMotherBrainsNeckForFakeDeathAscent:
    LDA.W #$0002                                                         ;A9903F;
    STA.L $7E8048                                                        ;A99042;
    LDA.W #$000A                                                         ;A99046;
    STA.L $7E804E                                                        ;A99049;
    STA.L $7E805A                                                        ;A9904D;
    LDA.W #$0014                                                         ;A99051;
    STA.L $7E8054                                                        ;A99054;
    STA.L $7E8060                                                        ;A99058;
    LDA.W #$4800                                                         ;A9905C;
    STA.L $7E8040                                                        ;A9905F;
    LDA.W #$5000                                                         ;A99063;
    STA.L $7E8042                                                        ;A99066;
    LDA.W #$0100                                                         ;A9906A;
    STA.L $7E8068                                                        ;A9906D;
    RTS                                                                  ;A99071;


HandleMotherBrainsNeck_Lower:
    LDA.L $7E8064                                                        ;A99072;
    TAX                                                                  ;A99076;
    JMP.W (.pointers,X)                                                  ;A99077;


.pointers:
    dw RTS_A99084                                                        ;A9907A;
    dw HandleMotherBrainsNeck_Lower_2_BobDown                            ;A9907C;
    dw HandleMotherBrainsNeck_Lower_4_BobUp                              ;A9907E;
    dw HandleMotherBrainsNeck_Lower_6_Lower                              ;A99080;
    dw HandleMotherBrainsNeck_Lower_8_Raise                              ;A99082;

RTS_A99084:
    RTS                                                                  ;A99084;


HandleMotherBrainsNeck_Lower_2_BobDown:
    LDA.L $7E8040                                                        ;A99085;
    SEC                                                                  ;A99089;
    SBC.L $7E8068                                                        ;A9908A;
    CMP.W #$2800                                                         ;A9908E;
    BCS +                                                                ;A99091;
    LDA.W #$0004                                                         ;A99093;
    STA.L $7E8064                                                        ;A99096;
    LDA.W #$2800                                                         ;A9909A;

  + STA.L $7E8040                                                        ;A9909D;
    RTS                                                                  ;A990A1;


HandleMotherBrainsNeck_Lower_4_BobUp:
    LDA.W $0FBE                                                          ;A990A2;
    CMP.W #$003C                                                         ;A990A5;
    BMI .bobDown                                                         ;A990A8;
    LDA.L $7E8040                                                        ;A990AA;
    CLC                                                                  ;A990AE;
    ADC.L $7E8068                                                        ;A990AF;
    CMP.W #$9000                                                         ;A990B3;
    BCC +                                                                ;A990B6;
    LDA.W #$0002                                                         ;A990B8;
    STA.L $7E8064                                                        ;A990BB;
    LDA.W #$9000                                                         ;A990BF;

  + STA.L $7E8040                                                        ;A990C2;
    RTS                                                                  ;A990C6;


.bobDown:
    LDA.W #$0002                                                         ;A990C7;
    STA.L $7E8064                                                        ;A990CA;
    RTS                                                                  ;A990CE;


HandleMotherBrainsNeck_Lower_6_Lower:
    LDA.L $7E8040                                                        ;A990CF;
    SEC                                                                  ;A990D3;
    SBC.L $7E8068                                                        ;A990D4;
    CMP.W #$3000                                                         ;A990D8;
    BCS +                                                                ;A990DB;
    LDA.W #$0000                                                         ;A990DD;
    STA.L $7E8064                                                        ;A990E0;
    LDA.W #$3000                                                         ;A990E4;

  + STA.L $7E8040                                                        ;A990E7;
    RTS                                                                  ;A990EB;


HandleMotherBrainsNeck_Lower_8_Raise:
    LDA.L $7E8040                                                        ;A990EC;
    CLC                                                                  ;A990F0;
    ADC.L $7E8068                                                        ;A990F1;
    CMP.W #$9000                                                         ;A990F5;
    BCC +                                                                ;A990F8;
    LDA.W #$0000                                                         ;A990FA;
    STA.L $7E8064                                                        ;A990FD;
    LDA.W #$9000                                                         ;A99101;

  + STA.L $7E8040                                                        ;A99104;
    RTS                                                                  ;A99108;


HandleMotherBrainsNeck_Upper:
    LDA.L $7E8066                                                        ;A99109;
    TAX                                                                  ;A9910D;
    JMP.W (.pointers,X)                                                  ;A9910E;


.pointers:
    dw RTS_A9911B                                                        ;A99111;
    dw HandleMotherBrainsNeck_Upper_3_BobDown                            ;A99113;
    dw HandleMotherBrainsNeck_Upper_4_BobUp                              ;A99115;
    dw HandleMotherBrainsNeck_Upper_6_Lower                              ;A99117;
    dw HandleMotherBrainsNeck_Upper_8_Raise                              ;A99119;

RTS_A9911B:
    RTS                                                                  ;A9911B;


HandleMotherBrainsNeck_Upper_3_BobDown:
    LDA.W $0FBE                                                          ;A9911C;
    CLC                                                                  ;A9911F;
    ADC.W #$0004                                                         ;A99120;
    CMP.W $0AFA                                                          ;A99123;
    BMI +                                                                ;A99126;
    LDA.W #$0004                                                         ;A99128;
    STA.L $7E8064                                                        ;A9912B;
    STA.L $7E8066                                                        ;A9912F;
    RTS                                                                  ;A99133;


  + LDA.L $7E8042                                                        ;A99134;
    SEC                                                                  ;A99138;
    SBC.L $7E8068                                                        ;A99139;
    CMP.W #$2000                                                         ;A9913D;
    BCS +                                                                ;A99140;
    LDA.W #$0004                                                         ;A99142;
    STA.L $7E8066                                                        ;A99145;
    LDA.W #$2000                                                         ;A99149;

  + STA.L $7E8042                                                        ;A9914C;
    RTS                                                                  ;A99150;


HandleMotherBrainsNeck_Upper_4_BobUp:
    LDA.L $7E8040                                                        ;A99151;
    CLC                                                                  ;A99155;
    ADC.W #$0800                                                         ;A99156;
    STA.B $12                                                            ;A99159;
    LDA.L $7E8042                                                        ;A9915B;
    CLC                                                                  ;A9915F;
    ADC.L $7E8068                                                        ;A99160;
    CMP.B $12                                                            ;A99164;
    BCC +                                                                ;A99166;
    LDA.W #$0002                                                         ;A99168;
    STA.L $7E8066                                                        ;A9916B;
    LDA.B $12                                                            ;A9916F;

  + STA.L $7E8042                                                        ;A99171;
    RTS                                                                  ;A99175;


HandleMotherBrainsNeck_Upper_6_Lower:
    LDA.L $7E8042                                                        ;A99176;
    SEC                                                                  ;A9917A;
    SBC.L $7E8068                                                        ;A9917B;
    CMP.W #$2000                                                         ;A9917F;
    BCS +                                                                ;A99182;
    LDA.W #$0000                                                         ;A99184;
    STA.L $7E8066                                                        ;A99187;
    LDA.W #$2000                                                         ;A9918B;

  + STA.L $7E8042                                                        ;A9918E;
    RTS                                                                  ;A99192;


HandleMotherBrainsNeck_Upper_8_Raise:
    LDA.L $7E8040                                                        ;A99193;
    CLC                                                                  ;A99197;
    ADC.W #$0800                                                         ;A99198;
    STA.B $12                                                            ;A9919B;
    LDA.L $7E8042                                                        ;A9919D;
    CLC                                                                  ;A991A1;
    ADC.L $7E8068                                                        ;A991A2;
    CMP.B $12                                                            ;A991A6;
    BCC +                                                                ;A991A8;
    LDA.W #$0000                                                         ;A991AA;
    STA.L $7E8066                                                        ;A991AD;
    LDA.B $12                                                            ;A991B1;

  + STA.L $7E8042                                                        ;A991B3;
    RTS                                                                  ;A991B7;


HandleMotherBrainsNeck:
    LDA.W #$FFB0                                                         ;A991B8;
    CLC                                                                  ;A991BB;
    ADC.W $0F7A                                                          ;A991BC;
    STA.L $7E7814                                                        ;A991BF;
    LDA.W #$002E                                                         ;A991C3;
    CLC                                                                  ;A991C6;
    ADC.W $0F7E                                                          ;A991C7;
    STA.L $7E7816                                                        ;A991CA;
    LDA.L $7E8062                                                        ;A991CE;
    BEQ .neckMovementDisabled                                            ;A991D2;
    JSR.W HandleMotherBrainsNeck_Lower                                   ;A991D4;
    JSR.W HandleMotherBrainsNeck_Upper                                   ;A991D7;

.neckMovementDisabled:
    LDA.L $7E8041                                                        ;A991DA;
    AND.W #$00FF                                                         ;A991DE;
    STA.B $12                                                            ;A991E1;
    LDA.L $7E8048                                                        ;A991E3;
    JSL.L GetSineMathInA_A9C460                                          ;A991E7;
    CLC                                                                  ;A991EB;
    ADC.L $7E7814                                                        ;A991EC;
    CLC                                                                  ;A991F0;
    ADC.W #$0070                                                         ;A991F1;
    STA.L $7E8044                                                        ;A991F4;
    LDA.L $7E8048                                                        ;A991F8;
    JSL.L GetCosineMathInA_A9C465                                        ;A991FC;
    CLC                                                                  ;A99200;
    ADC.L $7E7816                                                        ;A99201;
    CLC                                                                  ;A99205;
    ADC.W #$FFA0                                                         ;A99206;
    STA.L $7E8046                                                        ;A99209;
    LDA.L $7E804E                                                        ;A9920D;
    JSL.L GetSineMathInA_A9C460                                          ;A99211;
    CLC                                                                  ;A99215;
    ADC.L $7E7814                                                        ;A99216;
    CLC                                                                  ;A9921A;
    ADC.W #$0070                                                         ;A9921B;
    STA.L $7E804A                                                        ;A9921E;
    LDA.L $7E804E                                                        ;A99222;
    JSL.L GetCosineMathInA_A9C465                                        ;A99226;
    CLC                                                                  ;A9922A;
    ADC.L $7E7816                                                        ;A9922B;
    CLC                                                                  ;A9922F;
    ADC.W #$FFA0                                                         ;A99230;
    STA.L $7E804C                                                        ;A99233;
    LDA.L $7E8054                                                        ;A99237;
    JSL.L GetSineMathInA_A9C460                                          ;A9923B;
    CLC                                                                  ;A9923F;
    ADC.L $7E7814                                                        ;A99240;
    CLC                                                                  ;A99244;
    ADC.W #$0070                                                         ;A99245;
    STA.L $7E8050                                                        ;A99248;
    LDA.L $7E8054                                                        ;A9924C;
    JSL.L GetCosineMathInA_A9C465                                        ;A99250;
    CLC                                                                  ;A99254;
    ADC.L $7E7816                                                        ;A99255;
    CLC                                                                  ;A99259;
    ADC.W #$FFA0                                                         ;A9925A;
    STA.L $7E8052                                                        ;A9925D;
    LDA.L $7E8043                                                        ;A99261;
    AND.W #$00FF                                                         ;A99265;
    STA.B $12                                                            ;A99268;
    LDA.L $7E805A                                                        ;A9926A;
    JSL.L GetSineMathInA_A9C460                                          ;A9926E;
    CLC                                                                  ;A99272;
    ADC.L $7E8050                                                        ;A99273;
    STA.L $7E8056                                                        ;A99277;
    LDA.L $7E805A                                                        ;A9927B;
    JSL.L GetCosineMathInA_A9C465                                        ;A9927F;
    CLC                                                                  ;A99283;
    ADC.L $7E8052                                                        ;A99284;
    STA.L $7E8058                                                        ;A99288;
    LDA.L $7E8060                                                        ;A9928C;
    JSL.L GetSineMathInA_A9C460                                          ;A99290;
    CLC                                                                  ;A99294;
    ADC.L $7E8050                                                        ;A99295;
    STA.L $7E805C                                                        ;A99299;
    LDA.L $7E8060                                                        ;A9929D;
    JSL.L GetCosineMathInA_A9C465                                        ;A992A1;
    CLC                                                                  ;A992A5;
    ADC.L $7E8052                                                        ;A992A6;
    STA.L $7E805E                                                        ;A992AA;
    RTS                                                                  ;A992AE;


GetMotherBrainHeadSpritemapPointerInY:
    LDA.W $0A78                                                          ;A992AF;
    BNE .timeFrozen                                                      ;A992B2;
    LDA.L $7E8002                                                        ;A992B4;
    BMI .processInstList                                                 ;A992B8;

.noDraw:
    PLA                                                                  ;A992BA;
    RTS                                                                  ;A992BB;


.timeFrozen:
    LDA.L $7E8002                                                        ;A992BC;
    BPL .noDraw                                                          ;A992C0;
    TAX                                                                  ;A992C2;
    LDY.W $0002,X                                                        ;A992C3;
    RTS                                                                  ;A992C6;


.processInstList:
    TAX                                                                  ;A992C7;
    LDA.W $0000,X                                                        ;A992C8;
    BMI .ASMInstruction                                                  ;A992CB;
    CMP.L $7E8000                                                        ;A992CD;
    BPL .tick                                                            ;A992D1;
    INX                                                                  ;A992D3;
    INX                                                                  ;A992D4;
    INX                                                                  ;A992D5;
    INX                                                                  ;A992D6;

.loop:
    LDA.W $0000,X                                                        ;A992D7;
    BPL .specialInstruction                                              ;A992DA;

.ASMInstruction:
    STA.B $00                                                            ;A992DC;
    INX                                                                  ;A992DE;
    INX                                                                  ;A992DF;
    PEA.W .loop-1                                                        ;A992E0;
    JMP.W ($0000)                                                        ;A992E3;


.specialInstruction:
    LDA.W #$0001                                                         ;A992E6;
    STA.L $7E8000                                                        ;A992E9;
    TXA                                                                  ;A992ED;
    STA.L $7E8002                                                        ;A992EE;
    LDY.W $0002,X                                                        ;A992F2;
    RTS                                                                  ;A992F5;


.tick:
    LDA.L $7E8000                                                        ;A992F6;
    INC A                                                                ;A992FA;
    STA.L $7E8000                                                        ;A992FB;
    LDY.W $0002,X                                                        ;A992FF;
    RTS                                                                  ;A99302;


DrawMotherBrainsNeck:
    LDA.W $0F86                                                          ;A99303;
    AND.W #$0100                                                         ;A99306;
    BEQ .visible                                                         ;A99309;
    RTS                                                                  ;A9930B;


.visible:
    LDA.L $7E805C                                                        ;A9930C;
    STA.B $12                                                            ;A99310;
    LDA.L $7E805E                                                        ;A99312;
    STA.B $14                                                            ;A99316;
    JSR.W DrawMotherBrainNeckSegment                                     ;A99318;
    LDA.L $7E8056                                                        ;A9931B;
    STA.B $12                                                            ;A9931F;
    LDA.L $7E8058                                                        ;A99321;
    STA.B $14                                                            ;A99325;
    JSR.W DrawMotherBrainNeckSegment                                     ;A99327;
    LDA.L $7E8050                                                        ;A9932A;
    STA.B $12                                                            ;A9932E;
    LDA.L $7E8052                                                        ;A99330;
    STA.B $14                                                            ;A99334;
    JSR.W DrawMotherBrainNeckSegment                                     ;A99336;
    LDA.L $7E804A                                                        ;A99339;
    STA.B $12                                                            ;A9933D;
    LDA.L $7E804C                                                        ;A9933F;
    STA.B $14                                                            ;A99343;
    JSR.W DrawMotherBrainNeckSegment                                     ;A99345;
    LDA.L $7E8044                                                        ;A99348;
    STA.B $12                                                            ;A9934C;
    LDA.L $7E8046                                                        ;A9934E;
    STA.B $14                                                            ;A99352;
    JMP.W DrawMotherBrainNeckSegment                                     ;A99354;


DrawMotherBrainHead:
    LDA.L $7E7868                                                        ;A99357;
    BEQ .getSpritemap                                                    ;A9935B;
    LDA.L $7E786A                                                        ;A9935D;
    BNE .getSpritemap                                                    ;A99361;
    LDA.W $05E5                                                          ;A99363;
    BMI .getSpritemap                                                    ;A99366;
    LDY.W #EnemyProjectile_MotherBrainPurpleBreath_Small                 ;A99368;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9936B;

.getSpritemap:
    JSR.W GetMotherBrainHeadSpritemapPointerInY                          ;A9936F;
    LDA.L $7E781A                                                        ;A99372;
    TAX                                                                  ;A99376;
    LDA.W $0FDC                                                          ;A99377;
    LSR A                                                                ;A9937A;
    BCC .evenInvincibilityTimer                                          ;A9937B;
    LDX.W #$0000                                                         ;A9937D;

.evenInvincibilityTimer:
    STX.B $16                                                            ;A99380;
    LDA.L $7E7840                                                        ;A99382;
    BEQ .nonZeroShakeTimer                                               ;A99386;
    DEC A                                                                ;A99388;
    STA.L $7E7840                                                        ;A99389;
    BRA +                                                                ;A9938D;


.nonZeroShakeTimer:
    LDA.W $0FDC                                                          ;A9938F;
    BNE +                                                                ;A99392;
    LDA.W $0FE2                                                          ;A99394;

  + AND.W #$0006                                                         ;A99397;
    TAX                                                                  ;A9939A;
    LDA.W ShakingOffsets_X,X                                             ;A9939B;
    CLC                                                                  ;A9939E;
    ADC.W $0FBA                                                          ;A9939F;
    STA.B $12                                                            ;A993A2;
    CLC                                                                  ;A993A4;
    ADC.W #$0020                                                         ;A993A5;
    SEC                                                                  ;A993A8;
    SBC.W $0911                                                          ;A993A9;
    BMI .return                                                          ;A993AC;
    LDA.W ShakingOffsets_Y,X                                             ;A993AE;
    CLC                                                                  ;A993B1;
    ADC.W $0FBE                                                          ;A993B2;
    STA.B $14                                                            ;A993B5;
    JMP.W AddSpritemapToOAM_RoomCoordinates                              ;A993B7;


.return:
    RTS                                                                  ;A993BA;


ShakingOffsets_X:
    dw $0000,$FFFF,$0000,$0001                                           ;A993BB;

ShakingOffsets_Y:
    dw $0000,$0001,$FFFF,$0001                                           ;A993C3;

DrawMotherBrainNeckSegment:
    LDA.W $0FDC                                                          ;A993CB;
    AND.W #$0006                                                         ;A993CE;
    TAX                                                                  ;A993D1;
    LDA.W ShakingOffsets_X,X                                             ;A993D2;
    CLC                                                                  ;A993D5;
    ADC.B $12                                                            ;A993D6;
    STA.B $12                                                            ;A993D8;
    LDA.W ShakingOffsets_Y,X                                             ;A993DA;
    CLC                                                                  ;A993DD;
    ADC.B $14                                                            ;A993DE;
    STA.B $14                                                            ;A993E0;
    LDA.L $7E7818                                                        ;A993E2;
    STA.B $16                                                            ;A993E6;
    LDY.W #Spritemaps_MotherBrain_5                                      ;A993E8;
    JMP.W AddSpritemapToOAM_RoomCoordinates                              ;A993EB; >.<


AddSpritemapToOAM_RoomCoordinates:
    LDA.W $0000,Y                                                        ;A993EE;
    INY                                                                  ;A993F1;
    INY                                                                  ;A993F2;
    STA.B $18                                                            ;A993F3;
    LDX.W $0590                                                          ;A993F5;
    CLC                                                                  ;A993F8;

.loop:
    LDA.W $0001,Y                                                        ;A993F9;
    AND.W #$FF00                                                         ;A993FC;
    BPL +                                                                ;A993FF;
    ORA.W #$00FF                                                         ;A99401;

  + XBA                                                                  ;A99404;
    CLC                                                                  ;A99405;
    ADC.B $14                                                            ;A99406;
    SEC                                                                  ;A99408;
    SBC.W $0915                                                          ;A99409;
    BMI .next                                                            ;A9940C;
    STA.B $1A                                                            ;A9940E;
    LDA.W $0000,Y                                                        ;A99410;
    ADC.B $12                                                            ;A99413;
    SEC                                                                  ;A99415;
    SBC.W $0911                                                          ;A99416;
    STA.W $0370,X                                                        ;A99419;
    AND.W #$0100                                                         ;A9941C;
    BEQ .checkSizeBit                                                    ;A9941F;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;A99421;
    STA.B $1C                                                            ;A99425;
    LDA.B ($1C)                                                          ;A99427;
    ORA.L MapOfOAMIndex_highXPosBit,X                                    ;A99429;
    STA.B ($1C)                                                          ;A9942D;

.checkSizeBit:
    LDA.W $0000,Y                                                        ;A9942F;
    BPL +                                                                ;A99432;
    LDA.L MapOfOAMIndexToHighOAM_address,X                               ;A99434;
    STA.B $1C                                                            ;A99438;
    LDA.B ($1C)                                                          ;A9943A;
    ORA.L MapOfOAMIndex_sizeBit,X                                        ;A9943C;
    STA.B ($1C)                                                          ;A99440;

  + LDA.B $1A                                                            ;A99442;
    STA.W $0371,X                                                        ;A99444;
    LDA.W $0003,Y                                                        ;A99447;
    ORA.B $16                                                            ;A9944A;
    STA.W $0372,X                                                        ;A9944C;
    TXA                                                                  ;A9944F;
    CLC                                                                  ;A99450;
    ADC.W #$0004                                                         ;A99451;
    AND.W #$01FF                                                         ;A99454;
    TAX                                                                  ;A99457;

.next:
    TYA                                                                  ;A99458;
    CLC                                                                  ;A99459;
    ADC.W #$0005                                                         ;A9945A;
    TAY                                                                  ;A9945D;
    DEC.B $18                                                            ;A9945E;
    BNE .loop                                                            ;A99460;
    STX.W $0590                                                          ;A99462;
    RTS                                                                  ;A99465;


Calculate_MotherBrain_RainbowBeam_HDMATables:
    PHB                                                                  ;A99466;
    PEA.W $AD00                                                          ;A99467;
    PLB                                                                  ;A9946A;
    PLB                                                                  ;A9946B;
    JSL.L CalculateMotherBrainRainbowBeamHDMATables                      ;A9946C;
    PLB                                                                  ;A99470;
    RTL                                                                  ;A99471;


Palette_MotherBrain:
    dw $3800,$269F,$0159,$004C,$0004,$5739,$4273,$2DAD                   ;A99472;
    dw $14C6,$367F,$29F9,$2173,$150C,$0C86,$7FFF,$0000                   ;A99482;

Palette_MotherBrain_BackLeg:
    dw $3800,$0000,$0000,$0000,$0024,$29AD,$214A,$14E7                   ;A99492;
    dw $0C63,$0000,$0000,$0000,$0000,$0000,$29AD,$0000                   ;A994A2;

Palette_MotherBrain_Attacks:
    dw $3800,$7FE0,$6B20,$5640,$03FF,$02BF,$015F,$001F                   ;A994B2;
    dw $29F9,$2173,$150C,$6318,$4631,$294A,$7FFF,$0C63                   ;A994C2;

Palette_MotherBrain_BabyMetroid:
    dw $3800,$57B8,$0B11,$1646,$00E3,$72FF,$2CDF,$24B9                   ;A994D2;
    dw $1CAF,$18A9,$4F9F,$3ED8,$2E12,$08CD,$7FFF,$0000                   ;A994E2;

Palette_MotherBrain_TubeProjectiles:
    dw $3800,$6318,$6318,$0802,$5294,$39CE,$2108,$1084                   ;A994F2;
    dw $0019,$0012,$5C00,$4000,$1084,$197F,$7FFF,$0000                   ;A99502;

Palette_MotherBrain_GlassShards:
    dw $3800,$5294,$39CE,$2108,$7F8B,$6F0A,$5E88,$4E07                   ;A99512;
    dw $3986,$2905,$1883,$0802,$1084,$6318,$7FFF,$0000                   ;A99522;

Palette_MotherBrain_ExplodedDoor:
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616                   ;A99532;
    dw $0132,$5294,$4210,$318C,$2108,$1084,$7FFF,$0000                   ;A99542;

MoveMotherBrainBodyDownByA_ScrollLeftByX:
    PHA                                                                  ;A99552;
    CLC                                                                  ;A99553;
    ADC.W $0F7E                                                          ;A99554;
    STA.W $0F7E                                                          ;A99557;
    PLA                                                                  ;A9955A;
    EOR.W #$FFFF                                                         ;A9955B;
    INC A                                                                ;A9955E;
    CLC                                                                  ;A9955F;
    ADC.B $B7                                                            ;A99560;
    STA.B $B7                                                            ;A99562;
    TXA                                                                  ;A99564;
    CLC                                                                  ;A99565;
    ADC.W #$0022                                                         ;A99566;
    STA.B $14                                                            ;A99569;
    LDA.W $0F7A                                                          ;A9956B;
    EOR.W #$FFFF                                                         ;A9956E;
    INC A                                                                ;A99571;
    CLC                                                                  ;A99572;
    ADC.B $14                                                            ;A99573;
    STA.B $B5                                                            ;A99575;
    PLX                                                                  ;A99577;
    RTL                                                                  ;A99578;


MoveMotherBrainBodyDownByA:
    PHA                                                                  ;A99579;
    CLC                                                                  ;A9957A;
    ADC.W $0F7E                                                          ;A9957B;
    STA.W $0F7E                                                          ;A9957E;
    PLA                                                                  ;A99581;
    EOR.W #$FFFF                                                         ;A99582;
    INC A                                                                ;A99585;
    CLC                                                                  ;A99586;
    ADC.B $B7                                                            ;A99587;
    STA.B $B7                                                            ;A99589;
    LDA.W #$0000                                                         ;A9958B;
    SEC                                                                  ;A9958E;
    SBC.W $0F7A                                                          ;A9958F;
    CLC                                                                  ;A99592;
    ADC.W #$0022                                                         ;A99593;
    STA.B $B5                                                            ;A99596;
    RTL                                                                  ;A99598;


MotherBrainFootstepEffect:
    LDA.W #$0001                                                         ;A99599;
    STA.W $183E                                                          ;A9959C;
    LDA.W #$0004                                                         ;A9959F;
    STA.W $1840                                                          ;A995A2;
    LDA.L $7E7800                                                        ;A995A5;
    CMP.W #$0003                                                         ;A995A9;
    BNE .return                                                          ;A995AC;
    LDA.W #$0016                                                         ;A995AE;
    STA.L QueueSound_Lib3_Max6                                           ;A995B1; >_<

.return:
    RTS                                                                  ;A995B5;


Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4:
    PHX                                                                  ;A995B6;
    LDX.W #$0004                                                         ;A995B7;
    LDA.W #$FFF6                                                         ;A995BA;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995BD;


Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4:
    PHX                                                                  ;A995C0;
    LDX.W #$0004                                                         ;A995C1;
    LDA.W #$FFF0                                                         ;A995C4;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995C7;


Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2:
    PHX                                                                  ;A995CA;
    LDX.W #$FFFE                                                         ;A995CB;
    LDA.W #$FFF4                                                         ;A995CE;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995D1;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_MotherBrainBody_MoveBodyRightBy2_A995D4:
    PHX                                                                  ;A995D4;
    LDX.W #$FFFE                                                         ;A995D5;
    LDA.W #$0000                                                         ;A995D8;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995DB;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4:
    PHX                                                                  ;A995DE;
    LDX.W #$0004                                                         ;A995DF;
    LDA.W #$000C                                                         ;A995E2;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995E5;


Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2:
    PHX                                                                  ;A995E8;
    LDX.W #$FFFE                                                         ;A995E9;
    LDA.W #$0010                                                         ;A995EC;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995EF;


Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2:
    PHX                                                                  ;A995F2;
    LDX.W #$FFFE                                                         ;A995F3;
    LDA.W #$000A                                                         ;A995F6;
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX                       ;A995F9;


Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1:
    LDA.W $0F7A                                                          ;A995FC;
    CLC                                                                  ;A995FF;
    ADC.W #$0001                                                         ;A99600;
    STA.W $0F7A                                                          ;A99603;
    LDA.W #$FFFE                                                         ;A99606;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99609;


Instruction_MotherBrainBody_MoveBodyRightBy2:
    LDA.W $0F7A                                                          ;A9960C;
    CLC                                                                  ;A9960F;
    ADC.W #$0002                                                         ;A99610;
    STA.W $0F7A                                                          ;A99613;
    LDA.W #$0000                                                         ;A99616;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99619;


Instruction_MotherBrainBody_MoveBodyUpBy1:
    LDA.W #$0001                                                         ;A9961C;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A9961F;


Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep:
    LDA.W #$0022                                                         ;A99622;
    JSR.W MotherBrainFootstepEffect                                      ;A99625;
    LDA.W $0F7A                                                          ;A99628;
    CLC                                                                  ;A9962B;
    ADC.W #$0003                                                         ;A9962C;
    STA.W $0F7A                                                          ;A9962F;
    LDA.W #$0001                                                         ;A99632;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99635;


Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15:
    LDA.W $0F7A                                                          ;A99638;
    CLC                                                                  ;A9963B;
    ADC.W #$000F                                                         ;A9963C;
    STA.W $0F7A                                                          ;A9963F;
    LDA.W #$FFFE                                                         ;A99642;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99645;


Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6:
    LDA.W $0F7A                                                          ;A99648;
    CLC                                                                  ;A9964B;
    ADC.W #$0006                                                         ;A9964C;
    STA.W $0F7A                                                          ;A9964F;
    LDA.W #$FFFC                                                         ;A99652;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99655;


Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2:
    LDA.W $0F7A                                                          ;A99658;
    CLC                                                                  ;A9965B;
    ADC.W #$FFFE                                                         ;A9965C;
    STA.W $0F7A                                                          ;A9965F;
    LDA.W #$0004                                                         ;A99662;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99665;


Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep:
    LDA.W #$FFEF                                                         ;A99668;
    JSR.W MotherBrainFootstepEffect                                      ;A9966B;
    LDA.W $0F7A                                                          ;A9966E;
    CLC                                                                  ;A99671;
    ADC.W #$FFFF                                                         ;A99672;
    STA.W $0F7A                                                          ;A99675;
    LDA.W #$0002                                                         ;A99678;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A9967B;


Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate:
    LDA.W #$000B                                                         ;A9967E;
    JSR.W MotherBrainFootstepEffect                                      ;A99681;
    LDA.W $0F7A                                                          ;A99684;
    SEC                                                                  ;A99687;
    SBC.W #$0001                                                         ;A99688;
    STA.W $0F7A                                                          ;A9968B;
    LDA.W #$0002                                                         ;A9968E;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A99691;


Instruction_MotherBrainBody_MoveBodyLeftBy2:
    LDA.W $0F7A                                                          ;A99694;
    SEC                                                                  ;A99697;
    SBC.W #$0002                                                         ;A99698;
    STA.W $0F7A                                                          ;A9969B;
    LDA.W #$0000                                                         ;A9969E;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996A1;


Instruction_MotherBrainBody_MoveBodyDownBy1:
    LDA.W #$FFFF                                                         ;A996A4;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996A7;


Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3:
    LDA.W $0F7A                                                          ;A996AA;
    SEC                                                                  ;A996AD;
    SBC.W #$0003                                                         ;A996AE;
    STA.W $0F7A                                                          ;A996B1;
    LDA.W #$FFFF                                                         ;A996B4;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996B7;


Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep:
    LDA.W #$FFDB                                                         ;A996BA;
    JSR.W MotherBrainFootstepEffect                                      ;A996BD;
    LDA.W $0F7A                                                          ;A996C0;
    SEC                                                                  ;A996C3;
    SBC.W #$000F                                                         ;A996C4;
    STA.W $0F7A                                                          ;A996C7;
    LDA.W #$0002                                                         ;A996CA;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996CD;


Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6:
    LDA.W $0F7A                                                          ;A996D0;
    SEC                                                                  ;A996D3;
    SBC.W #$0006                                                         ;A996D4;
    STA.W $0F7A                                                          ;A996D7;
    LDA.W #$0004                                                         ;A996DA;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996DD;


Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2:
    LDA.W $0F7A                                                          ;A996E0;
    SEC                                                                  ;A996E3;
    SBC.W #$FFFE                                                         ;A996E4;
    STA.W $0F7A                                                          ;A996E7;
    LDA.W #$FFFC                                                         ;A996EA;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996ED;


Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1:
    LDA.W $0F7A                                                          ;A996F0;
    SEC                                                                  ;A996F3;
    SBC.W #$FFFF                                                         ;A996F4;
    STA.W $0F7A                                                          ;A996F7;
    LDA.W #$FFFE                                                         ;A996FA;
    JMP.W MoveMotherBrainBodyDownByA                                     ;A996FD;


Instruction_MotherBrainBody_SetPoseToStanding:
    LDA.W #$0000                                                         ;A99700;
    STA.L $7E7804                                                        ;A99703;
    RTL                                                                  ;A99707;


Instruction_MotherBrainBody_SetPoseToWalking:
    LDA.W #$0001                                                         ;A99708;
    STA.L $7E7804                                                        ;A9970B;
    RTL                                                                  ;A9970F;


Instruction_MotherBrainBody_SetPoseToCrouching:
    LDA.W #$0003                                                         ;A99710;
    STA.L $7E7804                                                        ;A99713;
    RTL                                                                  ;A99717;


Instruction_MotherBrainBody_SetPoseToCrouchingTransition:
    LDA.W #$0002                                                         ;A99718;
    STA.L $7E7804                                                        ;A9971B;
    RTL                                                                  ;A9971F;


Instruction_MotherBrainBody_SetPoseToDeathBeamMode:
    LDA.W #$0004                                                         ;A99720;
    STA.L $7E7804                                                        ;A99723;
    RTL                                                                  ;A99727;


Instruction_MotherBrainBody_SetPoseToLeaningDown:
    LDA.W #$0006                                                         ;A99728;
    STA.L $7E7804                                                        ;A9972B;
    RTL                                                                  ;A9972F;


InstList_MotherBrainBody_WalkingForwards_ReallyFast:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A99730;
    dw $0002                                                             ;A99732;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99734;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A99736;
    dw $0002                                                             ;A99738;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A9973A;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A9973C;
    dw $0002                                                             ;A9973E;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A99740;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A99742;
    dw $0002                                                             ;A99744;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A99746;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A99748;
    dw $0002                                                             ;A9974A;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A9974C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A9974E;
    dw $0002                                                             ;A99750;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A99752;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A99754;
    dw $0002                                                             ;A99756;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A99758;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A9975A;
    dw $0002                                                             ;A9975C;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A9975E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A99760;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99762;
    dw $0002                                                             ;A99764;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A99766;
    dw Instruction_Common_Sleep                                          ;A99768;

InstList_MotherBrainBody_WalkingForwards_Fast:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A9976A;
    dw $0004                                                             ;A9976C;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A9976E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A99770;
    dw $0004                                                             ;A99772;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A99774;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A99776;
    dw $0004                                                             ;A99778;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A9977A;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A9977C;
    dw $0004                                                             ;A9977E;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A99780;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A99782;
    dw $0004                                                             ;A99784;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A99786;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A99788;
    dw $0004                                                             ;A9978A;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A9978C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A9978E;
    dw $0004                                                             ;A99790;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A99792;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A99794;
    dw $0004                                                             ;A99796;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A99798;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A9979A;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A9979C;
    dw $0004                                                             ;A9979E;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A997A0;
    dw Instruction_Common_Sleep                                          ;A997A2;

InstList_MotherBrainBody_WalkingForwards_Medium:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A997A4;
    dw $0006                                                             ;A997A6;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A997A8;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A997AA;
    dw $0006                                                             ;A997AC;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A997AE;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A997B0;
    dw $0006                                                             ;A997B2;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A997B4;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A997B6;
    dw $0006                                                             ;A997B8;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A997BA;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A997BC;
    dw $0006                                                             ;A997BE;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A997C0;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A997C2;
    dw $0006                                                             ;A997C4;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A997C6;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A997C8;
    dw $0006                                                             ;A997CA;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A997CC;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A997CE;
    dw $0006                                                             ;A997D0;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A997D2;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A997D4;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A997D6;
    dw $0006                                                             ;A997D8;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A997DA;
    dw Instruction_Common_Sleep                                          ;A997DC;

InstList_MotherBrainBody_WalkingForwards_Slow:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A997DE;
    dw $0008                                                             ;A997E0;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A997E2;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A997E4;
    dw $0008                                                             ;A997E6;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A997E8;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A997EA;
    dw $0008                                                             ;A997EC;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A997EE;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A997F0;
    dw $0008                                                             ;A997F2;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A997F4;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A997F6;
    dw $0008                                                             ;A997F8;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A997FA;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A997FC;
    dw $0008                                                             ;A997FE;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A99800;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A99802;
    dw $0008                                                             ;A99804;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A99806;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A99808;
    dw $0008                                                             ;A9980A;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A9980C;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A9980E;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99810;
    dw $0008                                                             ;A99812;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A99814;
    dw Instruction_Common_Sleep                                          ;A99816;

InstList_MotherBrainBody_WalkingForwards_ReallySlow:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A99818;
    dw $000A                                                             ;A9981A;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A9981C;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1          ;A9981E;
    dw $000A                                                             ;A99820;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A99822;
    dw Instruction_MotherBrainBody_MoveBodyRightBy2                      ;A99824;
    dw $000A                                                             ;A99826;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A99828;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1                         ;A9982A;
    dw $000A                                                             ;A9982C;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A9982E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep       ;A99830;
    dw $000A                                                             ;A99832;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A99834;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15             ;A99836;
    dw $000A                                                             ;A99838;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A9983A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6              ;A9983C;
    dw $000A                                                             ;A9983E;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A99840;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2                 ;A99842;
    dw $000A                                                             ;A99844;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A99846;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep        ;A99848;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A9984A;
    dw $000A                                                             ;A9984C;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A9984E;
    dw Instruction_Common_Sleep                                          ;A99850;

InstList_MotherBrainBody_WalkingBackwards_Slow:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A99852;
    dw $0008                                                             ;A99854;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A99856;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A99858;
    dw $0008                                                             ;A9985A;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A9985C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A9985E;
    dw $0008                                                             ;A99860;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A99862;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A99864;
    dw $0008                                                             ;A99866;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A99868;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A9986A;
    dw $0008                                                             ;A9986C;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A9986E;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A99870;
    dw $0008                                                             ;A99872;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A99874;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A99876;
    dw $0008                                                             ;A99878;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A9987A;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A9987C;
    dw $0008                                                             ;A9987E;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A99880;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A99882;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99884;
    dw $0008                                                             ;A99886;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99888;
    dw Instruction_Common_Sleep                                          ;A9988A;

InstList_MotherBrainBody_WalkingBackwards_ReallyFast:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A9988C;
    dw $0002                                                             ;A9988E;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A99890;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A99892;
    dw $0002                                                             ;A99894;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A99896;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A99898;
    dw $0002                                                             ;A9989A;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A9989C;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A9989E;
    dw $0002                                                             ;A998A0;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A998A2;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A998A4;
    dw $0002                                                             ;A998A6;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A998A8;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A998AA;
    dw $0002                                                             ;A998AC;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A998AE;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A998B0;
    dw $0002                                                             ;A998B2;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A998B4;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A998B6;
    dw $0002                                                             ;A998B8;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A998BA;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A998BC;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A998BE;
    dw $0002                                                             ;A998C0;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A998C2;
    dw Instruction_Common_Sleep                                          ;A998C4;

InstList_MotherBrainBody_WalkingBackwards_Fast:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A998C6;
    dw $0004                                                             ;A998C8;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A998CA;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A998CC;
    dw $0004                                                             ;A998CE;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A998D0;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A998D2;
    dw $0004                                                             ;A998D4;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A998D6;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A998D8;
    dw $0004                                                             ;A998DA;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A998DC;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A998DE;
    dw $0004                                                             ;A998E0;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A998E2;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A998E4;
    dw $0004                                                             ;A998E6;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A998E8;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A998EA;
    dw $0004                                                             ;A998EC;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A998EE;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A998F0;
    dw $0004                                                             ;A998F2;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A998F4;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A998F6;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A998F8;
    dw $0004                                                             ;A998FA;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A998FC;
    dw Instruction_Common_Sleep                                          ;A998FE;

InstList_MotherBrainBody_WalkingBackwards_Medium:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A99900;
    dw $0006                                                             ;A99902;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A99904;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A99906;
    dw $0006                                                             ;A99908;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A9990A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A9990C;
    dw $0006                                                             ;A9990E;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A99910;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A99912;
    dw $0006                                                             ;A99914;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A99916;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A99918;
    dw $0006                                                             ;A9991A;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A9991C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A9991E;
    dw $0006                                                             ;A99920;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A99922;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A99924;
    dw $0006                                                             ;A99926;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A99928;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A9992A;
    dw $0006                                                             ;A9992C;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A9992E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A99930;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99932;
    dw $0006                                                             ;A99934;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99936;
    dw Instruction_Common_Sleep                                          ;A99938;

InstList_MotherBrainBody_WalkingBackwards_ReallySlow:
    dw Instruction_MotherBrainBody_SetPoseToWalking                      ;A9993A;
    dw $000A                                                             ;A9993C;
    dw ExtendedSpritemap_MotherBrainBody_Walking_7                       ;A9993E;
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1              ;A99940;
    dw $000A                                                             ;A99942;
    dw ExtendedSpritemap_MotherBrainBody_Walking_6                       ;A99944;
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2              ;A99946;
    dw $000A                                                             ;A99948;
    dw ExtendedSpritemap_MotherBrainBody_Walking_5                       ;A9994A;
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6                 ;A9994C;
    dw $000A                                                             ;A9994E;
    dw ExtendedSpritemap_MotherBrainBody_Walking_4                       ;A99950;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep       ;A99952;
    dw $000A                                                             ;A99954;
    dw ExtendedSpritemap_MotherBrainBody_Walking_3                       ;A99956;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3               ;A99958;
    dw $000A                                                             ;A9995A;
    dw ExtendedSpritemap_MotherBrainBody_Walking_2                       ;A9995C;
    dw Instruction_MotherBrainBody_MoveBodyDownBy1                       ;A9995E;
    dw $000A                                                             ;A99960;
    dw ExtendedSpritemap_MotherBrainBody_Walking_1                       ;A99962;
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2                       ;A99964;
    dw $000A                                                             ;A99966;
    dw ExtendedSpritemap_MotherBrainBody_Walking_0                       ;A99968;
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate ;A9996A;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A9996C;
    dw $000A                                                             ;A9996E;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99970;
    dw Instruction_Common_Sleep                                          ;A99972;

InstList_MotherBrainBody_CrouchAndThenStandUp:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A99974;
    dw $0008                                                             ;A99976;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99978;
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4        ;A9997A;
    dw $0008                                                             ;A9997C;
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown                     ;A9997E;
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2       ;A99980;
    dw $0008                                                             ;A99982;
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching                     ;A99984;
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2       ;A99986;
    dw Instruction_MotherBrainBody_SetPoseToCrouching                    ;A99988;
    dw $0008                                                             ;A9998A;
    dw ExtendedSpritemap_MotherBrainBody_Crouched                        ;A9998C;
    dw $0008                                                             ;A9998E;
    dw ExtendedSpritemap_MotherBrainBody_Crouched                        ;A99990;
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4          ;A99992;
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A99994;
    dw $0008                                                             ;A99996;
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching                     ;A99998;
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4          ;A9999A;
    dw $0008                                                             ;A9999C;
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown                     ;A9999E;
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2         ;A999A0;
    dw $0008                                                             ;A999A2;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A999A4;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A999A6;
    dw Instruction_Common_Sleep                                          ;A999A8;

InstList_MotherBrainBody_StandingUpAfterCrouching_Slow:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A999AA;
    dw $0010                                                             ;A999AC;
    dw ExtendedSpritemap_MotherBrainBody_Crouched                        ;A999AE;
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4          ;A999B0;
    dw $0010                                                             ;A999B2;
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching                     ;A999B4;
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4          ;A999B6;
    dw $0010                                                             ;A999B8;
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown                     ;A999BA;
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2         ;A999BC;
    dw $0010                                                             ;A999BE;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A999C0;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A999C2;
    dw Instruction_Common_Sleep                                          ;A999C4;

InstList_MotherBrainBody_StandingUpAfterCrouching_Fast:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A999C6;
    dw $0008                                                             ;A999C8;
    dw ExtendedSpritemap_MotherBrainBody_Crouched                        ;A999CA;
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4          ;A999CC;
    dw $0008                                                             ;A999CE;
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching                     ;A999D0;
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4          ;A999D2;
    dw $0008                                                             ;A999D4;
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown                     ;A999D6;
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2         ;A999D8;
    dw $0008                                                             ;A999DA;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A999DC;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A999DE;
    dw Instruction_Common_Sleep                                          ;A999E0;

InstList_MotherBrainBody_StandingUpAfterLeaningDown:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A999E2;
    dw $0008                                                             ;A999E4;
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown                     ;A999E6;
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2         ;A999E8;
    dw $0008                                                             ;A999EA;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A999EC;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A999EE;
    dw Instruction_Common_Sleep                                          ;A999F0;

InstList_MotherBrainBody_LeaningDown:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A999F2;
    dw $0008                                                             ;A999F4;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A999F6;
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4        ;A999F8;
    dw Instruction_MotherBrainBody_SetPoseToLeaningDown                  ;A999FA;
    dw $0008                                                             ;A999FC;
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown                     ;A999FE;
    dw Instruction_Common_Sleep                                          ;A99A00;

InstList_MotherBrainBody_Crouched:
    dw Instruction_MotherBrainBody_SetPoseToCrouching                    ;A99A02;
    dw $0008                                                             ;A99A04;
    dw ExtendedSpritemap_MotherBrainBody_Crouched                        ;A99A06;
    dw Instruction_Common_Sleep                                          ;A99A08;

InstList_MotherBrainBody_Crouch_Slow:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A99A0A;
    dw $0008                                                             ;A99A0C;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99A0E;
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4        ;A99A10;
    dw $0008                                                             ;A99A12;
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown                     ;A99A14;
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2       ;A99A16;
    dw $0008                                                             ;A99A18;
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching                     ;A99A1A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2       ;A99A1C;
    dw Instruction_MotherBrainBody_SetPoseToCrouching                    ;A99A1E;
    dw $0008                                                             ;A99A20;
    dw ExtendedSpritemap_MotherBrainBody_Crouched                        ;A99A22;
    dw Instruction_Common_Sleep                                          ;A99A24;

InstList_MotherBrainBody_Crouch_Fast:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition          ;A99A26;
    dw $0008                                                             ;A99A28;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99A2A;
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4        ;A99A2C;
    dw $0002                                                             ;A99A2E;
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown                     ;A99A30;
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2       ;A99A32;
    dw $0002                                                             ;A99A34;
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching                     ;A99A36;
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2       ;A99A38;
    dw Instruction_MotherBrainBody_SetPoseToCrouching                    ;A99A3A;
    dw $0008                                                             ;A99A3C;
    dw ExtendedSpritemap_MotherBrainBody_Crouched                        ;A99A3E;
    dw Instruction_Common_Sleep                                          ;A99A40;

InstList_MotherBrainBody_DeathBeamMode:
    dw Instruction_MotherBrainBody_SetPoseToDeathBeamMode                ;A99A42;
    dw $0001                                                             ;A99A44;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99A46;
    dw $0001                                                             ;A99A48;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_0                ;A99A4A;
    dw $0001                                                             ;A99A4C;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99A4E;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A50;
    dw $0024,$FFD8,$0001,$0001                                           ;A99A52;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99A5A;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A5C;
    dw $0022,$FFD6,$0002,$0001                                           ;A99A5E;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99A66;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A68;
    dw $0024,$FFD8,$0001,$0001                                           ;A99A6A;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99A72;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A74;
    dw $0022,$FFD6,$0002,$0001                                           ;A99A76;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99A7E;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A80;
    dw $0024,$FFD8,$0001,$0001                                           ;A99A82;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99A8A;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A8C;
    dw $0022,$FFD6,$0002,$0001                                           ;A99A8E;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99A96;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99A98;
    dw $0024,$FFD8,$0001,$0001                                           ;A99A9A;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99AA2;
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj           ;A99AA4;
    dw $0022,$FFD6,$0002,$0001                                           ;A99AA6;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99AAE;
    dw $0001                                                             ;A99AB0;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1                ;A99AB2;
    dw Instruction_MotherBrainBody_SpawnDeathBeamProjectile              ;A99AB4;
    dw $0001                                                             ;A99AB6;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_2                ;A99AB8;
    dw $0001                                                             ;A99ABA;
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_3                ;A99ABC;
    dw $00F0                                                             ;A99ABE;
    dw ExtendedSpritemap_MotherBrainBody_Standing                        ;A99AC0;
    dw Instruction_MotherBrainBody_IncrementDeathBeamAttackPhase         ;A99AC2;
    dw Instruction_MotherBrainBody_SetPoseToStanding                     ;A99AC4;
    dw Instruction_Common_Sleep                                          ;A99AC6;

Instruction_MotherBrainBody_SpawnDustCloudExplosionProj:
    PHY                                                                  ;A99AC8;
    PHX                                                                  ;A99AC9;
    LDA.W $0000,Y                                                        ;A99ACA;
    CLC                                                                  ;A99ACD;
    ADC.W $0F7A                                                          ;A99ACE;
    STA.B $12                                                            ;A99AD1;
    LDA.W $0002,Y                                                        ;A99AD3;
    CLC                                                                  ;A99AD6;
    ADC.W $0F7E                                                          ;A99AD7;
    STA.B $14                                                            ;A99ADA;
    LDA.W $0004,Y                                                        ;A99ADC;
    LDY.W #EnemyProjectile_MiscDust                                      ;A99ADF;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99AE2;
    PLX                                                                  ;A99AE6;
    PLY                                                                  ;A99AE7;
    INY                                                                  ;A99AE8;
    INY                                                                  ;A99AE9;
    INY                                                                  ;A99AEA;
    INY                                                                  ;A99AEB;
    INY                                                                  ;A99AEC;
    INY                                                                  ;A99AED;
    RTL                                                                  ;A99AEE;


Instruction_MotherBrainBody_SpawnDeathBeamProjectile:
    PHX                                                                  ;A99AEF;
    PHY                                                                  ;A99AF0;
    LDA.W #$0063                                                         ;A99AF1;
    JSL.L QueueSound_Lib2_Max6                                           ;A99AF4;
    LDX.W #$0040                                                         ;A99AF8;
    LDY.W #EnemyProjectile_MotherBrainRedBeam_Charging                   ;A99AFB;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A99AFE;
    PLY                                                                  ;A99B02;
    PLX                                                                  ;A99B03;
    RTL                                                                  ;A99B04;


Instruction_MotherBrainBody_IncrementDeathBeamAttackPhase:
    LDA.L $7E782E                                                        ;A99B05;
    INC A                                                                ;A99B09;
    STA.L $7E782E                                                        ;A99B0A;
    RTL                                                                  ;A99B0E;


Instruction_MotherBrain_GotoX:
    LDA.W $0000,X                                                        ;A99B0F;
    TAX                                                                  ;A99B12;
    RTS                                                                  ;A99B13;


Instruction_MotherBrainHead_EnableNeckMovement_GotoX:
    LDA.W #$0001                                                         ;A99B14;
    STA.L $7E8062                                                        ;A99B17;
    LDA.W $0000,X                                                        ;A99B1B;
    TAX                                                                  ;A99B1E;
    RTS                                                                  ;A99B1F;


Instruction_MotherBrainHead_DisableNeckMovement:
    LDA.W #$0000                                                         ;A99B20;
    STA.L $7E8062                                                        ;A99B23;
    RTS                                                                  ;A99B27;


Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6:
    LDA.W $0000,X                                                        ;A99B28;
    JSL.L QueueSound_Lib2_Max6                                           ;A99B2B;
    INX                                                                  ;A99B2F;
    INX                                                                  ;A99B30;
    RTS                                                                  ;A99B31;


Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6:
    LDA.W $0000,X                                                        ;A99B32;
    JSL.L QueueSound_Lib3_Max6                                           ;A99B35;
    INX                                                                  ;A99B39;
    INX                                                                  ;A99B3A;
    RTS                                                                  ;A99B3B;


Instruction_MotherBrainHead_SpawnDroolProjectile:
    LDA.L $7E7864                                                        ;A99B3C;
    BEQ .return                                                          ;A99B40;
    PHY                                                                  ;A99B42;
    LDA.L $7E7866                                                        ;A99B43;
    INC A                                                                ;A99B47;
    CMP.W #$0006                                                         ;A99B48;
    BMI +                                                                ;A99B4B;
    LDA.W #$0000                                                         ;A99B4D;

  + STA.L $7E7866                                                        ;A99B50;
    LDY.W #EnemyProjectile_MotherBrainDrool                              ;A99B54;
    LDA.L $7E8068                                                        ;A99B57;
    CMP.W #$0080                                                         ;A99B5B;
    BMI .lessThan80                                                      ;A99B5E;
    LDY.W #EnemyProjectile_MotherBrainDyingDrool                         ;A99B60;

.lessThan80:
    LDA.L $7E7866                                                        ;A99B63;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99B67;
    PLY                                                                  ;A99B6B;

.return:
    RTS                                                                  ;A99B6C;


Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile:
    PHY                                                                  ;A99B6D;
    LDY.W #EnemyProjectile_MotherBrainPurpleBreath_Big                   ;A99B6E;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99B71;
    PLY                                                                  ;A99B75;
    RTS                                                                  ;A99B76;


Instruction_MotherBrainHead_SetMainShakeTimerTo50:
    LDA.W #$0032                                                         ;A99B77;
    STA.L $7E7840                                                        ;A99B7A;
    RTS                                                                  ;A99B7E;


InstList_MotherBrainHead_Stretching_Phase2_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50                 ;A99B7F;
    dw $0002                                                             ;A99B81;
    dw Spritemaps_MotherBrain_2                                          ;A99B83;
    dw $0002                                                             ;A99B85;
    dw Spritemaps_MotherBrain_3                                          ;A99B87;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99B89;
    dw $0002                                                             ;A99B8B;
    dw Spritemaps_MotherBrain_3                                          ;A99B8D;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99B8F;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99B91;
    dw $007E                                                             ;A99B93;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99B95;
    dw $0010                                                             ;A99B97;
    dw Spritemaps_MotherBrain_4                                          ;A99B99;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99B9B;
    dw $0010                                                             ;A99B9D;
    dw Spritemaps_MotherBrain_4                                          ;A99B9F;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BA1;
    dw $0020                                                             ;A99BA3;
    dw Spritemaps_MotherBrain_4                                          ;A99BA5;
    dw $0004                                                             ;A99BA7;
    dw Spritemaps_MotherBrain_3                                          ;A99BA9;

InstList_MotherBrainHead_Stretching_Phase2_1:
    dw $0001                                                             ;A99BAB;
    dw Spritemaps_MotherBrain_2                                          ;A99BAD;
    dw Instruction_MotherBrain_GotoX                                     ;A99BAF;
    dw InstList_MotherBrainHead_Stretching_Phase2_1                      ;A99BB1;

InstList_MotherBrainHead_Stretching_Phase3_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50                 ;A99BB3;
    dw $0002                                                             ;A99BB5;
    dw Spritemaps_MotherBrain_8                                          ;A99BB7;
    dw $0002                                                             ;A99BB9;
    dw Spritemaps_MotherBrain_9                                          ;A99BBB;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BBD;
    dw $0002                                                             ;A99BBF;
    dw Spritemaps_MotherBrain_9                                          ;A99BC1;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99BC3;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99BC5;
    dw $007E                                                             ;A99BC7;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BC9;
    dw $0010                                                             ;A99BCB;
    dw Spritemaps_MotherBrain_A                                          ;A99BCD;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BCF;
    dw $0010                                                             ;A99BD1;
    dw Spritemaps_MotherBrain_A                                          ;A99BD3;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99BD5;
    dw $0020                                                             ;A99BD7;
    dw Spritemaps_MotherBrain_A                                          ;A99BD9;
    dw $0004                                                             ;A99BDB;
    dw Spritemaps_MotherBrain_9                                          ;A99BDD;

InstList_MotherBrainHead_Stretching_Phase3_1:
    dw $0001                                                             ;A99BDF;
    dw Spritemaps_MotherBrain_8                                          ;A99BE1;
    dw Instruction_MotherBrain_GotoX                                     ;A99BE3;
    dw InstList_MotherBrainHead_Stretching_Phase3_1                      ;A99BE5;

InstList_MotherBrainHead_HyperBeamRecoil_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50                 ;A99BE7;
    dw $0002                                                             ;A99BE9;
    dw Spritemaps_MotherBrain_8                                          ;A99BEB;
    dw $0002                                                             ;A99BED;
    dw Spritemaps_MotherBrain_9                                          ;A99BEF;
    dw $0002                                                             ;A99BF1;
    dw Spritemaps_MotherBrain_9                                          ;A99BF3;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99BF5;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99BF7;
    dw $007E,$0010                                                       ;A99BF9;
    dw Spritemaps_MotherBrain_A                                          ;A99BFD;
    dw $0010                                                             ;A99BFF;
    dw Spritemaps_MotherBrain_A                                          ;A99C01;
    dw $0020                                                             ;A99C03;
    dw Spritemaps_MotherBrain_A                                          ;A99C05;
    dw $0004                                                             ;A99C07;
    dw Spritemaps_MotherBrain_9                                          ;A99C09;

InstList_MotherBrainHead_HyperBeamRecoil_1:
    dw $0001                                                             ;A99C0B;
    dw Spritemaps_MotherBrain_8                                          ;A99C0D;
    dw Instruction_MotherBrain_GotoX                                     ;A99C0F;
    dw InstList_MotherBrainHead_HyperBeamRecoil_1                        ;A99C11;

InstList_MotherBrainHead_InitialDummy:
    dw $0000                                                             ;A99C13;
    dw UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A320                  ;A99C15;
    dw Instruction_Common_Sleep                                          ;A99C17;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MotherBrainHead_A99C19:
    dw $0008                                                             ;A99C19;
    dw Spritemaps_MotherBrain_2                                          ;A99C1B;
    dw $0004                                                             ;A99C1D;
    dw Spritemaps_MotherBrain_1                                          ;A99C1F;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_MotherBrainHead_Initial:
    dw $0004                                                             ;A99C21;
    dw Spritemaps_MotherBrain_0                                          ;A99C23;
    dw Instruction_MotherBrain_GotoX                                     ;A99C25;
    dw InstList_MotherBrainHead_Initial                                  ;A99C27;

InstList_MotherBrainHead_Decapitated_0:
    dw $0008                                                             ;A99C29;
    dw Spritemaps_MotherBrain_8                                          ;A99C2B;
    dw $0004                                                             ;A99C2D;
    dw Spritemaps_MotherBrain_7                                          ;A99C2F;

InstList_MotherBrainHead_Decapitated_1:
    dw $0004                                                             ;A99C31;
    dw Spritemaps_MotherBrain_6                                          ;A99C33;
    dw Instruction_MotherBrain_GotoX                                     ;A99C35;
    dw InstList_MotherBrainHead_Decapitated_1                            ;A99C37;

InstList_MotherBrainHead_DyingDrool_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50                 ;A99C39;
    dw $0004                                                             ;A99C3B;
    dw Spritemaps_MotherBrain_8                                          ;A99C3D;
    dw $0004                                                             ;A99C3F;
    dw Spritemaps_MotherBrain_9                                          ;A99C41;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99C43;
    dw $007E                                                             ;A99C45;

InstList_MotherBrainHead_DyingDrool_1:
    dw $0002                                                             ;A99C47;
    dw Spritemaps_MotherBrain_A                                          ;A99C49;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99C4B;
    dw $0002                                                             ;A99C4D;
    dw Spritemaps_MotherBrain_A                                          ;A99C4F;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99C51;
    dw $0002                                                             ;A99C53;
    dw Spritemaps_MotherBrain_A                                          ;A99C55;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99C57;
    dw $0002                                                             ;A99C59;
    dw Spritemaps_MotherBrain_A                                          ;A99C5B;
    dw Instruction_MotherBrainHead_SpawnDroolProjectile                  ;A99C5D;

InstList_MotherBrainHead_DyingDrool_2:
    dw $0002                                                             ;A99C5F;
    dw Spritemaps_MotherBrain_A                                          ;A99C61;
    dw Instruction_MotherBrainHead_GotoDyingDroolInstList                ;A99C63;

Instruction_MotherBrainHead_GotoDyingDroolInstList:
    LDX.W #InstList_MotherBrainHead_DyingDrool_2                         ;A99C65;
    LDA.W $05E5                                                          ;A99C68;
    AND.W #$0FFF                                                         ;A99C6B;
    CMP.W #$0FE0                                                         ;A99C6E;
    BCC .return                                                          ;A99C71;
    LDX.W #InstList_MotherBrainHead_DyingDrool_1                         ;A99C73;

.return:
    RTS                                                                  ;A99C76;


InstList_MotherBrainHead_FiringRainbowBeam:
    dw $0001                                                             ;A99C77;
    dw Spritemaps_MotherBrain_2                                          ;A99C79;
    dw Instruction_MotherBrain_GotoX                                     ;A99C7B;
    dw InstList_MotherBrainHead_FiringRainbowBeam                        ;A99C7D;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MotherBrainHead_A99C7F:
    dw $0001                                                             ;A99C7F;
    dw Spritemaps_MotherBrain_8                                          ;A99C81;
    dw Instruction_MotherBrain_GotoX                                     ;A99C83;
    dw UNUSED_InstList_MotherBrainHead_A99C7F                            ;A99C85;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_MotherBrainHead_Neutral_Phase2_0:
    dw $0004                                                             ;A99C87;
    dw Spritemaps_MotherBrain_0                                          ;A99C89;
    dw $0004                                                             ;A99C8B;
    dw Spritemaps_MotherBrain_1                                          ;A99C8D;
    dw $0008                                                             ;A99C8F;
    dw Spritemaps_MotherBrain_2                                          ;A99C91;
    dw $0004                                                             ;A99C93;
    dw Spritemaps_MotherBrain_1                                          ;A99C95;
    dw $0004                                                             ;A99C97;
    dw Spritemaps_MotherBrain_0                                          ;A99C99;
    dw $0004                                                             ;A99C9B;
    dw Spritemaps_MotherBrain_1                                          ;A99C9D;

InstList_MotherBrainHead_Neutral_Phase2_1:
    dw $0008                                                             ;A99C9F;
    dw Spritemaps_MotherBrain_2                                          ;A99CA1;
    dw Instruction_MotherBrainHead_MaybeGotoNeutralPhase2                ;A99CA3;
    dw $0004                                                             ;A99CA5;
    dw Spritemaps_MotherBrain_1                                          ;A99CA7;
    dw Instruction_MotherBrain_GotoX                                     ;A99CA9;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99CAB;

Instruction_MotherBrainHead_MaybeGotoNeutralPhase2:
    LDA.W $05E5                                                          ;A99CAD;
    CMP.W #$F000                                                         ;A99CB0;
    BCS .return                                                          ;A99CB3;
    LDX.W #InstList_MotherBrainHead_Neutral_Phase2_1                     ;A99CB5;

.return:
    RTS                                                                  ;A99CB8;


InstList_MotherBrainHead_Neutral_Phase3_0:
    dw $0004                                                             ;A99CB9;
    dw Spritemaps_MotherBrain_6                                          ;A99CBB;
    dw $0004                                                             ;A99CBD;
    dw Spritemaps_MotherBrain_7                                          ;A99CBF;
    dw $0008                                                             ;A99CC1;
    dw Spritemaps_MotherBrain_8                                          ;A99CC3;
    dw $0004                                                             ;A99CC5;
    dw Spritemaps_MotherBrain_7                                          ;A99CC7;
    dw $0004                                                             ;A99CC9;
    dw Spritemaps_MotherBrain_6                                          ;A99CCB;
    dw $0004                                                             ;A99CCD;
    dw Spritemaps_MotherBrain_7                                          ;A99CCF;

InstList_MotherBrainHead_Neutral_Phase3_1:
    dw $0008                                                             ;A99CD1;
    dw Spritemaps_MotherBrain_8                                          ;A99CD3;
    dw $0008                                                             ;A99CD5;
    dw Spritemaps_MotherBrain_7                                          ;A99CD7;
    dw Instruction_MotherBrainHead_MaybeGotoNeutralPhase3                ;A99CD9;
    dw $0004                                                             ;A99CDB;
    dw Spritemaps_MotherBrain_6                                          ;A99CDD;
    dw Instruction_MotherBrain_GotoX                                     ;A99CDF;
    dw InstList_MotherBrainHead_Neutral_Phase3_0                         ;A99CE1;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MotherBrainHead_Neutral_Phase3_A99CE3:
    dw $0004                                                             ;A99CE3;
    dw Spritemaps_MotherBrain_8                                          ;A99CE5;
    dw $0004                                                             ;A99CE7;
    dw Spritemaps_MotherBrain_9                                          ;A99CE9;
    dw $0002                                                             ;A99CEB;
    dw Spritemaps_MotherBrain_A                                          ;A99CED;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99CEF;
    dw $006F,$0002                                                       ;A99CF1;
    dw Spritemaps_MotherBrain_A                                          ;A99CF5;
    dw $0002                                                             ;A99CF7;
    dw Spritemaps_MotherBrain_A                                          ;A99CF9;
    dw $0002                                                             ;A99CFB;
    dw Spritemaps_MotherBrain_A                                          ;A99CFD;
    dw $0002                                                             ;A99CFF;
    dw Spritemaps_MotherBrain_A                                          ;A99D01;
    dw $0004                                                             ;A99D03;
    dw Spritemaps_MotherBrain_9                                          ;A99D05;
    dw $0004                                                             ;A99D07;
    dw Spritemaps_MotherBrain_8                                          ;A99D09;
    dw Instruction_MotherBrainHead_GotoNeutralPhase3                     ;A99D0B;
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_MotherBrainHead_MaybeGotoNeutralPhase3:
    LDA.W $05E5                                                          ;A99D0D;
    AND.W #$0FFF                                                         ;A99D10;
    CMP.W #$0F40                                                         ;A99D13;
    BRA +                                                                ;A99D16;

if !FEATURE_KEEP_UNREFERENCED
    LDX.W #UNUSED_InstList_MotherBrainHead_Neutral_Phase3_A99CE3         ;A99D18;
    RTS                                                                  ;A99D1B;
endif ; !FEATURE_KEEP_UNREFERENCED


  + CMP.W #$0EC0                                                         ;A99D1C;
    BCS Instruction_MotherBrainHead_GotoNeutralPhase3_return             ;A99D1F;

Instruction_MotherBrainHead_GotoNeutralPhase3:
    LDX.W #InstList_MotherBrainHead_Neutral_Phase3_1                     ;A99D21;

Instruction_MotherBrainHead_GotoNeutralPhase3_return:
    RTS                                                                  ;A99D24;


InstList_MotherBrainHead_Corpse_0:
    dw $0002                                                             ;A99D25;
    dw Spritemaps_MotherBrain_6                                          ;A99D27;
    dw $0002                                                             ;A99D29;
    dw Spritemaps_MotherBrain_7                                          ;A99D2B;
    dw $0040                                                             ;A99D2D;
    dw Spritemaps_MotherBrain_8                                          ;A99D2F;
    dw $0040                                                             ;A99D31;
    dw Spritemaps_MotherBrain_18                                         ;A99D33;

InstList_MotherBrainHead_Corpse_1:
    dw $0002                                                             ;A99D35;
    dw Spritemaps_MotherBrain_19                                         ;A99D37;
    dw Instruction_MotherBrain_GotoX                                     ;A99D39;
    dw InstList_MotherBrainHead_Corpse_1                                 ;A99D3B;

InstList_MotherBrainHead_Attacking_4OnionRings_Phase2:
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99D3D;
    dw $0004                                                             ;A99D3F;
    dw Spritemaps_MotherBrain_2                                          ;A99D41;
    dw $0004                                                             ;A99D43;
    dw Spritemaps_MotherBrain_3                                          ;A99D45;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99D47;
    dw $006F,$0008                                                       ;A99D49;
    dw Spritemaps_MotherBrain_4                                          ;A99D4D;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D4F;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D51;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6                 ;A99D53;
    dw $0017,$0003                                                       ;A99D55;
    dw Spritemaps_MotherBrain_4                                          ;A99D59;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D5B;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D5D;
    dw $0003                                                             ;A99D5F;
    dw Spritemaps_MotherBrain_4                                          ;A99D61;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D63;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D65;
    dw $0003                                                             ;A99D67;
    dw Spritemaps_MotherBrain_4                                          ;A99D69;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D6B;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D6D;
    dw $0010                                                             ;A99D6F;
    dw Spritemaps_MotherBrain_4                                          ;A99D71;
    dw $0004                                                             ;A99D73;
    dw Spritemaps_MotherBrain_3                                          ;A99D75;
    dw $0010                                                             ;A99D77;
    dw Spritemaps_MotherBrain_2                                          ;A99D79;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99D7B;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99D7D;

InstList_MotherBrainHead_Attacking_2OnionRings_Phase2:
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99D7F;
    dw $0004                                                             ;A99D81;
    dw Spritemaps_MotherBrain_2                                          ;A99D83;
    dw $0004                                                             ;A99D85;
    dw Spritemaps_MotherBrain_3                                          ;A99D87;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99D89;
    dw $006F,$0008                                                       ;A99D8B;
    dw Spritemaps_MotherBrain_4                                          ;A99D8F;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D91;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D93;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6                 ;A99D95;
    dw $0017,$0003                                                       ;A99D97;
    dw Spritemaps_MotherBrain_4                                          ;A99D9B;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99D9D;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99D9F;
    dw $0010                                                             ;A99DA1;
    dw Spritemaps_MotherBrain_4                                          ;A99DA3;
    dw $0004                                                             ;A99DA5;
    dw Spritemaps_MotherBrain_3                                          ;A99DA7;
    dw $0010                                                             ;A99DA9;
    dw Spritemaps_MotherBrain_2                                          ;A99DAB;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99DAD;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99DAF;

InstList_MotherBrainHead_Attacking_BabyMetroid:
    dw Instruction_MotherBrainHead_IncBabyMetroidAttackCounter           ;A99DB1;
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99DB3;
    dw Instruction_MotherBrainHead_AimOnionRingsAtBabyMetroid            ;A99DB5;
    dw Instruction_MotherBrain_GotoX                                     ;A99DB7;
    dw InstList_MotherBrainHead_Attacking_4OnionRings_Phase3             ;A99DB9;

InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3:
    dw Instruction_MotherBrainHead_ResetBabyMetroidAttackCounter         ;A99DBB;
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99DBD;
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus                  ;A99DBF;

InstList_MotherBrainHead_Attacking_4OnionRings_Phase3:
    dw $0004                                                             ;A99DC1;
    dw Spritemaps_MotherBrain_8                                          ;A99DC3;
    dw $0004                                                             ;A99DC5;
    dw Spritemaps_MotherBrain_9                                          ;A99DC7;
    dw Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX             ;A99DC9;
    dw $0008                                                             ;A99DCB;
    dw Spritemaps_MotherBrain_A                                          ;A99DCD;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99DCF;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6                 ;A99DD1;
    dw $0017,$0003                                                       ;A99DD3;
    dw Spritemaps_MotherBrain_A                                          ;A99DD7;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99DD9;
    dw $0003                                                             ;A99DDB;
    dw Spritemaps_MotherBrain_A                                          ;A99DDD;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99DDF;
    dw $0003                                                             ;A99DE1;
    dw Spritemaps_MotherBrain_A                                          ;A99DE3;
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile             ;A99DE5;
    dw $0010                                                             ;A99DE7;
    dw Spritemaps_MotherBrain_A                                          ;A99DE9;
    dw $0004                                                             ;A99DEB;
    dw Spritemaps_MotherBrain_9                                          ;A99DED;
    dw $0010                                                             ;A99DEF;
    dw Spritemaps_MotherBrain_8                                          ;A99DF1;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99DF3;
    dw InstList_MotherBrainHead_Neutral_Phase3_0                         ;A99DF5;

Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX:
    PHY                                                                  ;A99DF7;
    LDA.L $7E7826                                                        ;A99DF8;
    CMP.W #$000B                                                         ;A99DFC;
    BEQ .return                                                          ;A99DFF;
    LDA.W #$0000                                                         ;A99E01;
    ASL A                                                                ;A99E04;
    TAY                                                                  ;A99E05;
    LDA.W .sfx,Y                                                         ;A99E06;
    JSL.L QueueSound_Lib2_Max6                                           ;A99E09;

.return:
    PLY                                                                  ;A99E0D;
    RTS                                                                  ;A99E0E;


.sfx:
    dw $006F,$006F,$006F,$007E,$006F,$006F,$007E,$006F                   ;A99E0F;
    dw $006F,$007E,$007E,$006F,$006F                                     ;A99E1F;

Instruction_MotherBrainHead_SpawnOnionRingsProjectile:
    PHY                                                                  ;A99E29;
    LDY.W #EnemyProjectile_MotherBrainOnionRings                         ;A99E2A;
    LDA.L $7E7834                                                        ;A99E2D;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99E31;
    PLY                                                                  ;A99E35;
    RTS                                                                  ;A99E36;


Instruction_MotherBrainHead_AimOnionRingsAtBabyMetroid:
    PHX                                                                  ;A99E37;
    PHY                                                                  ;A99E38;
    LDA.L $7E7854                                                        ;A99E39;
    TAX                                                                  ;A99E3D;
    LDA.W $0F7A,X                                                        ;A99E3E;
    SEC                                                                  ;A99E41;
    SBC.W $0FBA                                                          ;A99E42;
    SEC                                                                  ;A99E45;
    SBC.W #$000A                                                         ;A99E46;
    STA.B $12                                                            ;A99E49;
    LDA.W $0F7E,X                                                        ;A99E4B;
    SEC                                                                  ;A99E4E;
    SBC.W $0FBE                                                          ;A99E4F;
    SEC                                                                  ;A99E52;
    SBC.W #$0010                                                         ;A99E53;
    STA.B $14                                                            ;A99E56;
    JMP.W AimMotherBrainOnionRings                                       ;A99E58;


Instruction_MotherBrainHead_AimOnionRingsAtSamus:
    PHX                                                                  ;A99E5B;
    PHY                                                                  ;A99E5C;
    LDA.W $0AF6                                                          ;A99E5D;
    SEC                                                                  ;A99E60;
    SBC.W $0FBA                                                          ;A99E61;
    SEC                                                                  ;A99E64;
    SBC.W #$000A                                                         ;A99E65;
    STA.B $12                                                            ;A99E68;
    LDA.W $0AFA                                                          ;A99E6A;
    SEC                                                                  ;A99E6D;
    SBC.W $0FBE                                                          ;A99E6E;
    SEC                                                                  ;A99E71;
    SBC.W #$0010                                                         ;A99E72;
    STA.B $14                                                            ;A99E75;

AimMotherBrainOnionRings:
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A99E77;
    SEC                                                                  ;A99E7B;
    SBC.W #$0080                                                         ;A99E7C;
    EOR.W #$FFFF                                                         ;A99E7F;
    INC A                                                                ;A99E82;
    AND.W #$00FF                                                         ;A99E83;
    SEP #$20                                                             ;A99E86;
    CMP.B #$10                                                           ;A99E88;
    BPL +                                                                ;A99E8A;
    CMP.B #$C0                                                           ;A99E8C;
    BMI .upperHalf                                                       ;A99E8E;
    LDA.B #$10                                                           ;A99E90;
    BRA .merge                                                           ;A99E92;


  + CMP.B #$48                                                           ;A99E94;
    BCC .merge                                                           ;A99E96;

.upperHalf:
    LDA.B #$48                                                           ;A99E98;

.merge:
    REP #$20                                                             ;A99E9A;
    STA.L $7E7834                                                        ;A99E9C;
    PLY                                                                  ;A99EA0;
    PLX                                                                  ;A99EA1;
    RTS                                                                  ;A99EA2;


Instruction_MotherBrainHead_IncBabyMetroidAttackCounter:
    LDA.L $7E7826                                                        ;A99EA3;
    INC A                                                                ;A99EA7;
    CMP.W #$000C                                                         ;A99EA8;
    BCC .notMax12                                                        ;A99EAB;
    LDA.W #$000C                                                         ;A99EAD;

.notMax12:
    STA.L $7E7826                                                        ;A99EB0;
    RTS                                                                  ;A99EB4;


Instruction_MotherBrainHead_ResetBabyMetroidAttackCounter:
    LDA.W #$0000                                                         ;A99EB5;
    STA.L $7E7826                                                        ;A99EB8;
    RTS                                                                  ;A99EBC;


Instruction_MotherBrainHead_SpawnBombProjectileWithParamX:
    PHY                                                                  ;A99EBD;
    LDA.W $0000,X                                                        ;A99EBE;
    LDY.W #EnemyProjectile_MotherBrainBomb                               ;A99EC1;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99EC4;
    PLY                                                                  ;A99EC8;
    INX                                                                  ;A99EC9;
    INX                                                                  ;A99ECA;
    RTS                                                                  ;A99ECB;


InstList_MotherBrainHead_Attacking_Bomb_Phase2:
    dw $0004                                                             ;A99ECC;
    dw Spritemaps_MotherBrain_0                                          ;A99ECE;
    dw $0004                                                             ;A99ED0;
    dw Spritemaps_MotherBrain_1                                          ;A99ED2;
    dw $0008                                                             ;A99ED4;
    dw Spritemaps_MotherBrain_2                                          ;A99ED6;
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99ED8;
    dw $0004                                                             ;A99EDA;
    dw Spritemaps_MotherBrain_2                                          ;A99EDC;
    dw $0004                                                             ;A99EDE;
    dw Spritemaps_MotherBrain_3                                          ;A99EE0;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99EE2;
    dw $006F,$0008                                                       ;A99EE4;
    dw Spritemaps_MotherBrain_4                                          ;A99EE8;
    dw Instruction_MotherBrainHead_SpawnBombProjectileWithParamX         ;A99EEA;
    dw $0007                                                             ;A99EEC;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99EEE;
    dw $0020                                                             ;A99EF0;
    dw Spritemaps_MotherBrain_4                                          ;A99EF2;
    dw $0004                                                             ;A99EF4;
    dw Spritemaps_MotherBrain_3                                          ;A99EF6;
    dw $0010                                                             ;A99EF8;
    dw Spritemaps_MotherBrain_2                                          ;A99EFA;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99EFC;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99EFE;

InstList_MotherBrainHead_Attacking_Bomb_Phase3:
    dw $0004                                                             ;A99F00;
    dw Spritemaps_MotherBrain_6                                          ;A99F02;
    dw $0004                                                             ;A99F04;
    dw Spritemaps_MotherBrain_7                                          ;A99F06;
    dw $0008                                                             ;A99F08;
    dw Spritemaps_MotherBrain_8                                          ;A99F0A;
    dw Instruction_MotherBrainHead_DisableNeckMovement                   ;A99F0C;
    dw $0004                                                             ;A99F0E;
    dw Spritemaps_MotherBrain_8                                          ;A99F10;
    dw $0004                                                             ;A99F12;
    dw Spritemaps_MotherBrain_9                                          ;A99F14;
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6                 ;A99F16;
    dw $006F,$0008                                                       ;A99F18;
    dw Spritemaps_MotherBrain_A                                          ;A99F1C;
    dw Instruction_MotherBrainHead_SpawnBombProjectileWithParamX         ;A99F1E;
    dw $0001                                                             ;A99F20;
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile        ;A99F22;
    dw $0020                                                             ;A99F24;
    dw Spritemaps_MotherBrain_A                                          ;A99F26;
    dw $0004                                                             ;A99F28;
    dw Spritemaps_MotherBrain_9                                          ;A99F2A;
    dw $0010                                                             ;A99F2C;
    dw Spritemaps_MotherBrain_8                                          ;A99F2E;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99F30;
    dw InstList_MotherBrainHead_Neutral_Phase3_0                         ;A99F32;

InstList_MotherBrainHead_Attacking_Laser:
    dw $0010                                                             ;A99F34;
    dw Spritemaps_MotherBrain_1                                          ;A99F36;
    dw $0004                                                             ;A99F38;
    dw Spritemaps_MotherBrain_2                                          ;A99F3A;
    dw InstList_MotherBrainHead_SpawnLaserProjectile                     ;A99F3C;
    dw $0020                                                             ;A99F3E;
    dw Spritemaps_MotherBrain_2                                          ;A99F40;
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX              ;A99F42;
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A99F44;

InstList_MotherBrainHead_SpawnLaserProjectile:
    LDA.W #$0000                                                         ;A99F46;
    STA.L $7E8062                                                        ;A99F49;
    PHY                                                                  ;A99F4D;
    LDA.W $0FBA                                                          ;A99F4E;
    CLC                                                                  ;A99F51;
    ADC.W #$0010                                                         ;A99F52;
    STA.B $12                                                            ;A99F55;
    LDA.W $0FBE                                                          ;A99F57;
    CLC                                                                  ;A99F5A;
    ADC.W #$0004                                                         ;A99F5B;
    STA.B $14                                                            ;A99F5E;
    LDA.W #$0001                                                         ;A99F60;
    LDY.W #EnemyProjectile_PirateMotherBrainLaser                        ;A99F63;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99F66;
    PLY                                                                  ;A99F6A;
    RTS                                                                  ;A99F6B;


InstList_MotherBrainHead_ChargingRainbowBeam_0:
    dw Instruction_MotherBrainHead_SetupEffectsForRainbowBeamCharge      ;A99F6C;
    dw $0004                                                             ;A99F6E;
    dw Spritemaps_MotherBrain_2                                          ;A99F70;
    dw $0004                                                             ;A99F72;
    dw Spritemaps_MotherBrain_1                                          ;A99F74;
    dw $0002                                                             ;A99F76;
    dw Spritemaps_MotherBrain_0                                          ;A99F78;

InstList_MotherBrainHead_ChargingRainbowBeam_1:
    dw Instruction_MotherBrainHead_SpawnRainbowBeamChargingProj          ;A99F7A;
    dw $001E                                                             ;A99F7C;
    dw Spritemaps_MotherBrain_0                                          ;A99F7E;
    dw Instruction_MotherBrain_GotoX                                     ;A99F80;
    dw InstList_MotherBrainHead_ChargingRainbowBeam_1                    ;A99F82;

Instruction_MotherBrainHead_SpawnRainbowBeamChargingProj:
    PHY                                                                  ;A99F84;
    LDY.W #EnemyProjectile_MotherBrainRainbowBeam_Charging               ;A99F85;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A99F88;
    PLY                                                                  ;A99F8C;
    RTS                                                                  ;A99F8D;


Instruction_MotherBrainHead_SetupEffectsForRainbowBeamCharge:
    LDA.W #$0000                                                         ;A99F8E;
    STA.L $7E7868                                                        ;A99F91;
    JSR.W SetupMotherBrainHeadPaletteForChargingHerLaser                 ;A99F95;
    LDA.W #$007F                                                         ;A99F98;
    JSL.L QueueSound_Lib2_Max6                                           ;A99F9B;
    RTS                                                                  ;A99F9F;


ExtendedSpritemap_MotherBrainBody_Standing:
    dw $0009,$0012,$003A                                                 ;A99FA0;
    dw Spritemaps_MotherBrain_13                                         ;A99FA6;
    dw Hitbox_MotherBrainBody_3                                          ;A99FA8;
    dw $001E,$001D                                                       ;A99FAA;
    dw Spritemaps_MotherBrain_F                                          ;A99FAE;
    dw Hitbox_MotherBrainBody_2                                          ;A99FB0;
    dw $0019,$001E                                                       ;A99FB2;
    dw Spritemaps_MotherBrain_11                                         ;A99FB6;
    dw Hitbox_MotherBrainBody_2                                          ;A99FB8;
    dw $0000,$FFFC                                                       ;A99FBA;
    dw Spritemaps_MotherBrain_B                                          ;A99FBE;
    dw Hitbox_MotherBrainBody_2                                          ;A99FC0;
    dw $0000,$0000                                                       ;A99FC2;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A99FC6;
    dw Hitbox_MotherBrainBody_6                                          ;A99FC8;
    dw $0000,$0000                                                       ;A99FCA;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A99FCE;
    dw Hitbox_MotherBrainBody_8                                          ;A99FD0;
    dw $FFF6,$0038                                                       ;A99FD2;
    dw Spritemaps_MotherBrain_17                                         ;A99FD6;
    dw Hitbox_MotherBrainBody_5                                          ;A99FD8;
    dw $0007,$001C                                                       ;A99FDA;
    dw Spritemaps_MotherBrain_15                                         ;A99FDE;
    dw Hitbox_MotherBrainBody_4                                          ;A99FE0;
    dw $0002,$001D                                                       ;A99FE2;
    dw Spritemaps_MotherBrain_16                                         ;A99FE6;
    dw Hitbox_MotherBrainBody_4                                          ;A99FE8;

ExtendedSpritemap_MotherBrainBody_Walking_0:
    dw $000A,$001C,$002F                                                 ;A99FEA;
    dw Spritemaps_MotherBrain_13                                         ;A99FF0;
    dw Hitbox_MotherBrainBody_3                                          ;A99FF2;
    dw $0026,$0013                                                       ;A99FF4;
    dw Spritemaps_MotherBrain_F                                          ;A99FF8;
    dw Hitbox_MotherBrainBody_2                                          ;A99FFA;
    dw $0021,$0013                                                       ;A99FFC;
    dw Spritemaps_MotherBrain_11                                         ;A9A000;
    dw Hitbox_MotherBrainBody_2                                          ;A9A002;
    dw $0000,$FFFD                                                       ;A9A004;
    dw Spritemaps_MotherBrain_C                                          ;A9A008;
    dw Hitbox_MotherBrainBody_2                                          ;A9A00A;
    dw $0000,$0002                                                       ;A9A00C;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A010;
    dw Hitbox_MotherBrainBody_6                                          ;A9A012;
    dw $0000,$0000                                                       ;A9A014;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A018;
    dw Hitbox_MotherBrainBody_8                                          ;A9A01A;
    dw $FFF5,$003A                                                       ;A9A01C;
    dw Spritemaps_MotherBrain_17                                         ;A9A020;
    dw Hitbox_MotherBrainBody_5                                          ;A9A022;
    dw $0006,$001F                                                       ;A9A024;
    dw Spritemaps_MotherBrain_15                                         ;A9A028;
    dw Hitbox_MotherBrainBody_4                                          ;A9A02A;
    dw $0001,$0021                                                       ;A9A02C;
    dw Spritemaps_MotherBrain_16                                         ;A9A030;
    dw Hitbox_MotherBrainBody_4                                          ;A9A032;
    dw $FFE7,$FFFD                                                       ;A9A034;
    dw Spritemaps_MotherBrain_14                                         ;A9A038;
    dw Hitbox_MotherBrainBody_4                                          ;A9A03A;

ExtendedSpritemap_MotherBrainBody_Walking_1:
    dw $000A,$0028,$0030                                                 ;A9A03C;
    dw Spritemaps_MotherBrain_13                                         ;A9A042;
    dw Hitbox_MotherBrainBody_3                                          ;A9A044;
    dw $0026,$0013                                                       ;A9A046;
    dw Spritemaps_MotherBrain_F                                          ;A9A04A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A04C;
    dw $0023,$0013                                                       ;A9A04E;
    dw Spritemaps_MotherBrain_10                                         ;A9A052;
    dw Hitbox_MotherBrainBody_2                                          ;A9A054;
    dw $0000,$FFFD                                                       ;A9A056;
    dw Spritemaps_MotherBrain_C                                          ;A9A05A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A05C;
    dw $0000,$0002                                                       ;A9A05E;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A062;
    dw Hitbox_MotherBrainBody_6                                          ;A9A064;
    dw $0000,$0000                                                       ;A9A066;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A06A;
    dw Hitbox_MotherBrainBody_8                                          ;A9A06C;
    dw $FFF3,$003A                                                       ;A9A06E;
    dw Spritemaps_MotherBrain_17                                         ;A9A072;
    dw Hitbox_MotherBrainBody_5                                          ;A9A074;
    dw $0005,$001F                                                       ;A9A076;
    dw Spritemaps_MotherBrain_15                                         ;A9A07A;
    dw Hitbox_MotherBrainBody_4                                          ;A9A07C;
    dw $FFFF,$0021                                                       ;A9A07E;
    dw Spritemaps_MotherBrain_16                                         ;A9A082;
    dw Hitbox_MotherBrainBody_4                                          ;A9A084;
    dw $FFE6,$FFFD                                                       ;A9A086;
    dw Spritemaps_MotherBrain_14                                         ;A9A08A;
    dw Hitbox_MotherBrainBody_4                                          ;A9A08C;

ExtendedSpritemap_MotherBrainBody_Walking_2:
    dw $000A,$0028,$0033                                                 ;A9A08E;
    dw Spritemaps_MotherBrain_13                                         ;A9A094;
    dw Hitbox_MotherBrainBody_3                                          ;A9A096;
    dw $0026,$0015                                                       ;A9A098;
    dw Spritemaps_MotherBrain_F                                          ;A9A09C;
    dw Hitbox_MotherBrainBody_2                                          ;A9A09E;
    dw $0023,$0016                                                       ;A9A0A0;
    dw Spritemaps_MotherBrain_10                                         ;A9A0A4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A0A6;
    dw $FFFF,$FFFE                                                       ;A9A0A8;
    dw Spritemaps_MotherBrain_C                                          ;A9A0AC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A0AE;
    dw $0000,$0001                                                       ;A9A0B0;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A0B4;
    dw Hitbox_MotherBrainBody_6                                          ;A9A0B6;
    dw $0000,$0000                                                       ;A9A0B8;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A0BC;
    dw Hitbox_MotherBrainBody_8                                          ;A9A0BE;
    dw $FFF3,$0039                                                       ;A9A0C0;
    dw Spritemaps_MotherBrain_17                                         ;A9A0C4;
    dw Hitbox_MotherBrainBody_5                                          ;A9A0C6;
    dw $0005,$001E                                                       ;A9A0C8;
    dw Spritemaps_MotherBrain_15                                         ;A9A0CC;
    dw Hitbox_MotherBrainBody_4                                          ;A9A0CE;
    dw $FFFF,$0020                                                       ;A9A0D0;
    dw Spritemaps_MotherBrain_16                                         ;A9A0D4;
    dw Hitbox_MotherBrainBody_4                                          ;A9A0D6;
    dw $FFE6,$FFFC                                                       ;A9A0D8;
    dw Spritemaps_MotherBrain_14                                         ;A9A0DC;
    dw Hitbox_MotherBrainBody_4                                          ;A9A0DE;

ExtendedSpritemap_MotherBrainBody_Walking_3:
    dw $0009,$0024,$003A                                                 ;A9A0E0;
    dw Spritemaps_MotherBrain_13                                         ;A9A0E6;
    dw Hitbox_MotherBrainBody_3                                          ;A9A0E8;
    dw $0021,$001D                                                       ;A9A0EA;
    dw Spritemaps_MotherBrain_F                                          ;A9A0EE;
    dw Hitbox_MotherBrainBody_2                                          ;A9A0F0;
    dw $001F,$001E                                                       ;A9A0F2;
    dw Spritemaps_MotherBrain_10                                         ;A9A0F6;
    dw Hitbox_MotherBrainBody_2                                          ;A9A0F8;
    dw $0001,$FFFC                                                       ;A9A0FA;
    dw Spritemaps_MotherBrain_B                                          ;A9A0FE;
    dw Hitbox_MotherBrainBody_2                                          ;A9A100;
    dw $0000,$0000                                                       ;A9A102;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A106;
    dw Hitbox_MotherBrainBody_6                                          ;A9A108;
    dw $0000,$0000                                                       ;A9A10A;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A10E;
    dw Hitbox_MotherBrainBody_8                                          ;A9A110;
    dw $FFF0,$0038                                                       ;A9A112;
    dw Spritemaps_MotherBrain_17                                         ;A9A116;
    dw Hitbox_MotherBrainBody_5                                          ;A9A118;
    dw $0003,$001C                                                       ;A9A11A;
    dw Spritemaps_MotherBrain_15                                         ;A9A11E;
    dw Hitbox_MotherBrainBody_4                                          ;A9A120;
    dw $FFFC,$001E                                                       ;A9A122;
    dw Spritemaps_MotherBrain_16                                         ;A9A126;
    dw Hitbox_MotherBrainBody_4                                          ;A9A128;

ExtendedSpritemap_MotherBrainBody_Walking_4:
    dw $0009,$0015,$003C                                                 ;A9A12A;
    dw Spritemaps_MotherBrain_13                                         ;A9A130;
    dw Hitbox_MotherBrainBody_3                                          ;A9A132;
    dw $001D,$001F                                                       ;A9A134;
    dw Spritemaps_MotherBrain_F                                          ;A9A138;
    dw Hitbox_MotherBrainBody_2                                          ;A9A13A;
    dw $001B,$0020                                                       ;A9A13C;
    dw Spritemaps_MotherBrain_11                                         ;A9A140;
    dw Hitbox_MotherBrainBody_2                                          ;A9A142;
    dw $FFFE,$FFFE                                                       ;A9A144;
    dw Spritemaps_MotherBrain_B                                          ;A9A148;
    dw Hitbox_MotherBrainBody_2                                          ;A9A14A;
    dw $0000,$0002                                                       ;A9A14C;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A150;
    dw Hitbox_MotherBrainBody_6                                          ;A9A152;
    dw $0000,$0000                                                       ;A9A154;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A158;
    dw Hitbox_MotherBrainBody_8                                          ;A9A15A;
    dw $FFF0,$0034                                                       ;A9A15C;
    dw Spritemaps_MotherBrain_17                                         ;A9A160;
    dw Hitbox_MotherBrainBody_5                                          ;A9A162;
    dw $0000,$001A                                                       ;A9A164;
    dw Spritemaps_MotherBrain_15                                         ;A9A168;
    dw Hitbox_MotherBrainBody_4                                          ;A9A16A;
    dw $FFFB,$001C                                                       ;A9A16C;
    dw Spritemaps_MotherBrain_16                                         ;A9A170;
    dw Hitbox_MotherBrainBody_4                                          ;A9A172;

ExtendedSpritemap_MotherBrainBody_Walking_5:
    dw $0009,$000F,$0040                                                 ;A9A174;
    dw Spritemaps_MotherBrain_13                                         ;A9A17A;
    dw Hitbox_MotherBrainBody_3                                          ;A9A17C;
    dw $001E,$0023                                                       ;A9A17E;
    dw Spritemaps_MotherBrain_F                                          ;A9A182;
    dw Hitbox_MotherBrainBody_2                                          ;A9A184;
    dw $001A,$0025                                                       ;A9A186;
    dw Spritemaps_MotherBrain_12                                         ;A9A18A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A18C;
    dw $FFFE,$FFFF                                                       ;A9A18E;
    dw Spritemaps_MotherBrain_B                                          ;A9A192;
    dw Hitbox_MotherBrainBody_2                                          ;A9A194;
    dw $0000,$0006                                                       ;A9A196;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A19A;
    dw Hitbox_MotherBrainBody_6                                          ;A9A19C;
    dw $0000,$0000                                                       ;A9A19E;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A1A2;
    dw Hitbox_MotherBrainBody_8                                          ;A9A1A4;
    dw $FFF6,$002F                                                       ;A9A1A6;
    dw Spritemaps_MotherBrain_17                                         ;A9A1AA;
    dw Hitbox_MotherBrainBody_5                                          ;A9A1AC;
    dw $0004,$0016                                                       ;A9A1AE;
    dw Spritemaps_MotherBrain_15                                         ;A9A1B2;
    dw Hitbox_MotherBrainBody_4                                          ;A9A1B4;
    dw $FFFF,$0018                                                       ;A9A1B6;
    dw Spritemaps_MotherBrain_16                                         ;A9A1BA;
    dw Hitbox_MotherBrainBody_4                                          ;A9A1BC;

ExtendedSpritemap_MotherBrainBody_Walking_6:
    dw $0009,$0011,$003C                                                 ;A9A1BE;
    dw Spritemaps_MotherBrain_13                                         ;A9A1C4;
    dw Hitbox_MotherBrainBody_3                                          ;A9A1C6;
    dw $001E,$0020                                                       ;A9A1C8;
    dw Spritemaps_MotherBrain_F                                          ;A9A1CC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A1CE;
    dw $0018,$0020                                                       ;A9A1D0;
    dw Spritemaps_MotherBrain_11                                         ;A9A1D4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A1D6;
    dw $FFFF,$FFFE                                                       ;A9A1D8;
    dw Spritemaps_MotherBrain_B                                          ;A9A1DC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A1DE;
    dw $0000,$0002                                                       ;A9A1E0;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A1E4;
    dw Hitbox_MotherBrainBody_6                                          ;A9A1E6;
    dw $0000,$0000                                                       ;A9A1E8;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A1EC;
    dw Hitbox_MotherBrainBody_8                                          ;A9A1EE;
    dw $FFF8,$002F                                                       ;A9A1F0;
    dw Spritemaps_MotherBrain_17                                         ;A9A1F4;
    dw Hitbox_MotherBrainBody_5                                          ;A9A1F6;
    dw $0007,$0015                                                       ;A9A1F8;
    dw Spritemaps_MotherBrain_15                                         ;A9A1FC;
    dw Hitbox_MotherBrainBody_4                                          ;A9A1FE;
    dw $0003,$0017                                                       ;A9A200;
    dw Spritemaps_MotherBrain_16                                         ;A9A204;
    dw Hitbox_MotherBrainBody_4                                          ;A9A206;

ExtendedSpritemap_MotherBrainBody_Walking_7:
    dw $0009,$0012,$003A                                                 ;A9A208;
    dw Spritemaps_MotherBrain_13                                         ;A9A20E;
    dw Hitbox_MotherBrainBody_3                                          ;A9A210;
    dw $001F,$001E                                                       ;A9A212;
    dw Spritemaps_MotherBrain_F                                          ;A9A216;
    dw Hitbox_MotherBrainBody_2                                          ;A9A218;
    dw $0019,$001E                                                       ;A9A21A;
    dw Spritemaps_MotherBrain_11                                         ;A9A21E;
    dw Hitbox_MotherBrainBody_2                                          ;A9A220;
    dw $FFFF,$FFFD                                                       ;A9A222;
    dw Spritemaps_MotherBrain_B                                          ;A9A226;
    dw Hitbox_MotherBrainBody_2                                          ;A9A228;
    dw $0000,$0000                                                       ;A9A22A;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A22E;
    dw Hitbox_MotherBrainBody_6                                          ;A9A230;
    dw $0000,$0000                                                       ;A9A232;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A236;
    dw Hitbox_MotherBrainBody_8                                          ;A9A238;
    dw $FFF6,$0038                                                       ;A9A23A;
    dw Spritemaps_MotherBrain_17                                         ;A9A23E;
    dw Hitbox_MotherBrainBody_5                                          ;A9A240;
    dw $0007,$001C                                                       ;A9A242;
    dw Spritemaps_MotherBrain_15                                         ;A9A246;
    dw Hitbox_MotherBrainBody_4                                          ;A9A248;
    dw $0002,$001F                                                       ;A9A24A;
    dw Spritemaps_MotherBrain_16                                         ;A9A24E;
    dw Hitbox_MotherBrainBody_4                                          ;A9A250;

ExtendedSpritemap_MotherBrainBody_Crouched:
    dw $0007,$0012,$0014                                                 ;A9A252;
    dw Spritemaps_MotherBrain_13                                         ;A9A258;
    dw Hitbox_MotherBrainBody_3                                          ;A9A25A;
    dw $0022,$FFF7                                                       ;A9A25C;
    dw Spritemaps_MotherBrain_F                                          ;A9A260;
    dw Hitbox_MotherBrainBody_2                                          ;A9A262;
    dw $001F,$FFFA                                                       ;A9A264;
    dw Spritemaps_MotherBrain_12                                         ;A9A268;
    dw Hitbox_MotherBrainBody_2                                          ;A9A26A;
    dw $FFFB,$0003                                                       ;A9A26C;
    dw Spritemaps_MotherBrain_E                                          ;A9A270;
    dw Hitbox_MotherBrainBody_2                                          ;A9A272;
    dw $0000,$FFDA                                                       ;A9A274;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A278;
    dw Hitbox_MotherBrainBody_6                                          ;A9A27A;
    dw $0004,$0000                                                       ;A9A27C;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A280;
    dw Hitbox_MotherBrainBody_8                                          ;A9A282;
    dw $FFF6,$0012                                                       ;A9A284;
    dw Spritemaps_MotherBrain_17                                         ;A9A288;
    dw Hitbox_MotherBrainBody_5                                          ;A9A28A;

ExtendedSpritemap_MotherBrainBody_Uncrouching:
    dw $0009,$0012,$001E                                                 ;A9A28C;
    dw Spritemaps_MotherBrain_13                                         ;A9A292;
    dw Hitbox_MotherBrainBody_3                                          ;A9A294;
    dw $0024,$0002                                                       ;A9A296;
    dw Spritemaps_MotherBrain_F                                          ;A9A29A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A29C;
    dw $001F,$0004                                                       ;A9A29E;
    dw Spritemaps_MotherBrain_12                                         ;A9A2A2;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2A4;
    dw $FFFB,$FFFE                                                       ;A9A2A6;
    dw Spritemaps_MotherBrain_D                                          ;A9A2AA;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2AC;
    dw $0000,$FFE4                                                       ;A9A2AE;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A2B2;
    dw Hitbox_MotherBrainBody_6                                          ;A9A2B4;
    dw $FFFE,$0000                                                       ;A9A2B6;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A2BA;
    dw Hitbox_MotherBrainBody_8                                          ;A9A2BC;
    dw $FFF6,$001C                                                       ;A9A2BE;
    dw Spritemaps_MotherBrain_17                                         ;A9A2C2;
    dw Hitbox_MotherBrainBody_5                                          ;A9A2C4;
    dw $0007,$0000                                                       ;A9A2C6;
    dw Spritemaps_MotherBrain_15                                         ;A9A2CA;
    dw Hitbox_MotherBrainBody_4                                          ;A9A2CC;
    dw $0002,$0001                                                       ;A9A2CE;
    dw Spritemaps_MotherBrain_16                                         ;A9A2D2;
    dw Hitbox_MotherBrainBody_4                                          ;A9A2D4;

ExtendedSpritemap_MotherBrainBody_LeaningDown:
    dw $0009,$0012,$002E                                                 ;A9A2D6;
    dw Spritemaps_MotherBrain_13                                         ;A9A2DC;
    dw Hitbox_MotherBrainBody_3                                          ;A9A2DE;
    dw $001F,$0011                                                       ;A9A2E0;
    dw Spritemaps_MotherBrain_F                                          ;A9A2E4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2E6;
    dw $001A,$0012                                                       ;A9A2E8;
    dw Spritemaps_MotherBrain_11                                         ;A9A2EC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2EE;
    dw $FFFB,$FFFC                                                       ;A9A2F0;
    dw Spritemaps_MotherBrain_C                                          ;A9A2F4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A2F6;
    dw $0000,$FFF4                                                       ;A9A2F8;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A2FC;
    dw Hitbox_MotherBrainBody_6                                          ;A9A2FE;
    dw $FFFE,$0000                                                       ;A9A300;
    dw ExtendedTilemaps_MotherBrain_1                                    ;A9A304;
    dw Hitbox_MotherBrainBody_8                                          ;A9A306;
    dw $FFF6,$002C                                                       ;A9A308;
    dw Spritemaps_MotherBrain_17                                         ;A9A30C;
    dw Hitbox_MotherBrainBody_5                                          ;A9A30E;
    dw $0007,$0010                                                       ;A9A310;
    dw Spritemaps_MotherBrain_15                                         ;A9A314;
    dw Hitbox_MotherBrainBody_4                                          ;A9A316;
    dw $0002,$0011                                                       ;A9A318;
    dw Spritemaps_MotherBrain_16                                         ;A9A31C;
    dw Hitbox_MotherBrainBody_4                                          ;A9A31E;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A320:
    dw $0001,$0000,$0000                                                 ;A9A320;
    dw Spritemaps_MotherBrain_0                                          ;A9A326;
    dw Hitbox_MotherBrainBody_0                                          ;A9A328;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A32A:
    dw $0001,$0000,$0000                                                 ;A9A32A;
    dw Spritemaps_MotherBrain_1                                          ;A9A330;
    dw Hitbox_MotherBrainBody_0                                          ;A9A332;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A334:
    dw $0001,$0000,$0000                                                 ;A9A334;
    dw Spritemaps_MotherBrain_2                                          ;A9A33A;
    dw Hitbox_MotherBrainBody_0                                          ;A9A33C;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A33E:
    dw $0001,$0000,$0000                                                 ;A9A33E;
    dw Spritemaps_MotherBrain_3                                          ;A9A344;
    dw Hitbox_MotherBrainBody_0                                          ;A9A346;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A348:
    dw $0001,$0000,$0000                                                 ;A9A348;
    dw Spritemaps_MotherBrain_4                                          ;A9A34E;
    dw Hitbox_MotherBrainBody_0                                          ;A9A350;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A352:
    dw $0001,$0000,$0000                                                 ;A9A352;
    dw Spritemaps_MotherBrain_6                                          ;A9A358;
    dw Hitbox_MotherBrainBody_1                                          ;A9A35A;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A35C:
    dw $0001,$0000,$0000                                                 ;A9A35C;
    dw Spritemaps_MotherBrain_7                                          ;A9A362;
    dw Hitbox_MotherBrainBody_1                                          ;A9A364;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A366:
    dw $0001,$0000,$0000                                                 ;A9A366;
    dw Spritemaps_MotherBrain_8                                          ;A9A36C;
    dw Hitbox_MotherBrainBody_1                                          ;A9A36E;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A370:
    dw $0001,$0000,$0000                                                 ;A9A370;
    dw Spritemaps_MotherBrain_9                                          ;A9A376;
    dw Hitbox_MotherBrainBody_1                                          ;A9A378;

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A37A:
    dw $0001,$0000,$0000                                                 ;A9A37A;
    dw Spritemaps_MotherBrain_A                                          ;A9A380;
    dw Hitbox_MotherBrainBody_1                                          ;A9A382;
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_0:
    dw $0009,$0012,$003A                                                 ;A9A384;
    dw Spritemaps_MotherBrain_13                                         ;A9A38A;
    dw Hitbox_MotherBrainBody_3                                          ;A9A38C;
    dw $001E,$001D                                                       ;A9A38E;
    dw Spritemaps_MotherBrain_F                                          ;A9A392;
    dw Hitbox_MotherBrainBody_2                                          ;A9A394;
    dw $0019,$001E                                                       ;A9A396;
    dw Spritemaps_MotherBrain_11                                         ;A9A39A;
    dw Hitbox_MotherBrainBody_2                                          ;A9A39C;
    dw $0000,$FFFC                                                       ;A9A39E;
    dw Spritemaps_MotherBrain_B                                          ;A9A3A2;
    dw Hitbox_MotherBrainBody_2                                          ;A9A3A4;
    dw $0000,$0000                                                       ;A9A3A6;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A3AA;
    dw Hitbox_MotherBrainBody_6                                          ;A9A3AC;
    dw $0000,$0000                                                       ;A9A3AE;
    dw ExtendedTilemaps_MotherBrain_2                                    ;A9A3B2;
    dw Hitbox_MotherBrainBody_9                                          ;A9A3B4;
    dw $FFF6,$0038                                                       ;A9A3B6;
    dw Spritemaps_MotherBrain_17                                         ;A9A3BA;
    dw Hitbox_MotherBrainBody_5                                          ;A9A3BC;
    dw $0007,$001C                                                       ;A9A3BE;
    dw Spritemaps_MotherBrain_15                                         ;A9A3C2;
    dw Hitbox_MotherBrainBody_4                                          ;A9A3C4;
    dw $0002,$001D                                                       ;A9A3C6;
    dw Spritemaps_MotherBrain_16                                         ;A9A3CA;
    dw Hitbox_MotherBrainBody_4                                          ;A9A3CC;

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1:
    dw $0009,$0012,$003A                                                 ;A9A3CE;
    dw Spritemaps_MotherBrain_13                                         ;A9A3D4;
    dw Hitbox_MotherBrainBody_3                                          ;A9A3D6;
    dw $001E,$001D                                                       ;A9A3D8;
    dw Spritemaps_MotherBrain_F                                          ;A9A3DC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A3DE;
    dw $0019,$001E                                                       ;A9A3E0;
    dw Spritemaps_MotherBrain_11                                         ;A9A3E4;
    dw Hitbox_MotherBrainBody_2                                          ;A9A3E6;
    dw $0000,$FFFC                                                       ;A9A3E8;
    dw Spritemaps_MotherBrain_B                                          ;A9A3EC;
    dw Hitbox_MotherBrainBody_2                                          ;A9A3EE;
    dw $0000,$0000                                                       ;A9A3F0;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A3F4;
    dw Hitbox_MotherBrainBody_6                                          ;A9A3F6;
    dw $0000,$0000                                                       ;A9A3F8;
    dw ExtendedTilemaps_MotherBrain_3                                    ;A9A3FC;
    dw Hitbox_MotherBrainBody_A                                          ;A9A3FE;
    dw $FFF6,$0038                                                       ;A9A400;
    dw Spritemaps_MotherBrain_17                                         ;A9A404;
    dw Hitbox_MotherBrainBody_5                                          ;A9A406;
    dw $0007,$001C                                                       ;A9A408;
    dw Spritemaps_MotherBrain_15                                         ;A9A40C;
    dw Hitbox_MotherBrainBody_4                                          ;A9A40E;
    dw $0002,$001D                                                       ;A9A410;
    dw Spritemaps_MotherBrain_16                                         ;A9A414;
    dw Hitbox_MotherBrainBody_4                                          ;A9A416;

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_2:
    dw $0009,$0012,$003A                                                 ;A9A418;
    dw Spritemaps_MotherBrain_13                                         ;A9A41E;
    dw Hitbox_MotherBrainBody_3                                          ;A9A420;
    dw $001E,$001D                                                       ;A9A422;
    dw Spritemaps_MotherBrain_F                                          ;A9A426;
    dw Hitbox_MotherBrainBody_2                                          ;A9A428;
    dw $0019,$001E                                                       ;A9A42A;
    dw Spritemaps_MotherBrain_11                                         ;A9A42E;
    dw Hitbox_MotherBrainBody_2                                          ;A9A430;
    dw $0000,$FFFC                                                       ;A9A432;
    dw Spritemaps_MotherBrain_B                                          ;A9A436;
    dw Hitbox_MotherBrainBody_2                                          ;A9A438;
    dw $0000,$0000                                                       ;A9A43A;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A43E;
    dw Hitbox_MotherBrainBody_6                                          ;A9A440;
    dw $0000,$0000                                                       ;A9A442;
    dw ExtendedTilemaps_MotherBrain_4                                    ;A9A446;
    dw Hitbox_MotherBrainBody_B                                          ;A9A448;
    dw $FFF6,$0038                                                       ;A9A44A;
    dw Spritemaps_MotherBrain_17                                         ;A9A44E;
    dw Hitbox_MotherBrainBody_5                                          ;A9A450;
    dw $0007,$001C                                                       ;A9A452;
    dw Spritemaps_MotherBrain_15                                         ;A9A456;
    dw Hitbox_MotherBrainBody_4                                          ;A9A458;
    dw $0002,$001D                                                       ;A9A45A;
    dw Spritemaps_MotherBrain_16                                         ;A9A45E;
    dw Hitbox_MotherBrainBody_4                                          ;A9A460;

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_3:
    dw $0009,$0012,$003A                                                 ;A9A462;
    dw Spritemaps_MotherBrain_13                                         ;A9A468;
    dw Hitbox_MotherBrainBody_3                                          ;A9A46A;
    dw $001E,$001D                                                       ;A9A46C;
    dw Spritemaps_MotherBrain_F                                          ;A9A470;
    dw Hitbox_MotherBrainBody_2                                          ;A9A472;
    dw $0019,$001E                                                       ;A9A474;
    dw Spritemaps_MotherBrain_11                                         ;A9A478;
    dw Hitbox_MotherBrainBody_2                                          ;A9A47A;
    dw $0000,$FFFC                                                       ;A9A47C;
    dw Spritemaps_MotherBrain_B                                          ;A9A480;
    dw Hitbox_MotherBrainBody_2                                          ;A9A482;
    dw $0000,$0000                                                       ;A9A484;
    dw ExtendedTilemaps_MotherBrain_0                                    ;A9A488;
    dw Hitbox_MotherBrainBody_6                                          ;A9A48A;
    dw $0000,$0000                                                       ;A9A48C;
    dw ExtendedTilemaps_MotherBrain_5                                    ;A9A490;
    dw Hitbox_MotherBrainBody_C                                          ;A9A492;
    dw $FFF6,$0038                                                       ;A9A494;
    dw Spritemaps_MotherBrain_17                                         ;A9A498;
    dw Hitbox_MotherBrainBody_5                                          ;A9A49A;
    dw $0007,$001C                                                       ;A9A49C;
    dw Spritemaps_MotherBrain_15                                         ;A9A4A0;
    dw Hitbox_MotherBrainBody_4                                          ;A9A4A2;
    dw $0002,$001D                                                       ;A9A4A4;
    dw Spritemaps_MotherBrain_16                                         ;A9A4A8;
    dw Hitbox_MotherBrainBody_4                                          ;A9A4AA;

Hitbox_MotherBrainBody_0:
    dw $0001,$FFEC,$FFEB,$0010,$0017                                     ;A9A4AC;
    dw EnemyTouch_MotherBrainHead                                        ;A9A4B6;
    dw EnemyShot_MotherBrainHead                                         ;A9A4B8;

Hitbox_MotherBrainBody_1:
    dw $0001,$FFEC,$FFEB,$0013,$0017                                     ;A9A4BA;
    dw EnemyTouch_MotherBrainHead                                        ;A9A4C4;
    dw EnemyShot_MotherBrainHead                                         ;A9A4C6;

Hitbox_MotherBrainBody_2:
    dw $0000                                                             ;A9A4C8;

Hitbox_MotherBrainBody_3:
    dw $0001,$FFE9,$FFFF,$0017,$0007                                     ;A9A4CA;
    dw RTL_A9B5C5                                                        ;A9A4D4;
    dw EnemyShot_MotherBrainBody                                         ;A9A4D6;

Hitbox_MotherBrainBody_4:
    dw $0000                                                             ;A9A4D8;

Hitbox_MotherBrainBody_5:
    dw $0001,$FFE9,$FFFE,$0017,$0007                                     ;A9A4DA;
    dw RTL_A9B5C5                                                        ;A9A4E4;
    dw EnemyShot_MotherBrainBody                                         ;A9A4E6;

Hitbox_MotherBrainBody_6:
    dw $0002,$FFE0,$FFE8,$0014,$0034                                     ;A9A4E8;
    dw RTL_A9B5C5                                                        ;A9A4F2;
    dw EnemyShot_MotherBrainBody                                         ;A9A4F4;
    dw $FFE8,$FFD6,$000D,$FFE7                                           ;A9A4F6;
    dw RTL_A9B5C5                                                        ;A9A4FE;
    dw EnemyShot_MotherBrainBody                                         ;A9A500;

Hitbox_MotherBrainBody_7:
    dw $0000                                                             ;A9A502;

Hitbox_MotherBrainBody_8:
    dw $0002,$0004,$FFC5,$001C,$FFE8                                     ;A9A504;
    dw RTL_A9B5C5                                                        ;A9A50E;
    dw EnemyShot_MotherBrainBody                                         ;A9A510;
    dw $001C,$FFD7,$0039,$FFE2                                           ;A9A512;
    dw RTL_A9B5C5                                                        ;A9A51A;
    dw EnemyShot_MotherBrainBody                                         ;A9A51C;

Hitbox_MotherBrainBody_9:
    dw $0002,$0004,$FFC5,$001C,$FFE8                                     ;A9A51E;
    dw RTL_A9B5C5                                                        ;A9A528;
    dw EnemyShot_MotherBrainBody                                         ;A9A52A;
    dw $001C,$FFD7,$0036,$FFE2                                           ;A9A52C;
    dw RTL_A9B5C5                                                        ;A9A534;
    dw EnemyShot_MotherBrainBody                                         ;A9A536;

Hitbox_MotherBrainBody_A:
    dw $0002,$0004,$FFC5,$001C,$FFE8                                     ;A9A538;
    dw RTL_A9B5C5                                                        ;A9A542;
    dw EnemyShot_MotherBrainBody                                         ;A9A544;
    dw $001D,$FFD5,$002D,$FFE8                                           ;A9A546;
    dw RTL_A9B5C5                                                        ;A9A54E;
    dw EnemyShot_MotherBrainBody                                         ;A9A550;

Hitbox_MotherBrainBody_B:
    dw $0002,$0004,$FFC5,$001C,$FFE8                                     ;A9A552;
    dw RTL_A9B5C5                                                        ;A9A55C;
    dw EnemyShot_MotherBrainBody                                         ;A9A55E;
    dw $001D,$FFD0,$0044,$FFD8                                           ;A9A560;
    dw RTL_A9B5C5                                                        ;A9A568;
    dw EnemyShot_MotherBrainBody                                         ;A9A56A;

Hitbox_MotherBrainBody_C:
    dw $0002,$0004,$FFC5,$001C,$FFE8                                     ;A9A56C;
    dw RTL_A9B5C5                                                        ;A9A576;
    dw EnemyShot_MotherBrainBody                                         ;A9A578;
    dw $001C,$FFD7,$003A,$FFE1                                           ;A9A57A;
    dw RTL_A9B5C5                                                        ;A9A582;
    dw EnemyShot_MotherBrainBody                                         ;A9A584;

Spritemaps_MotherBrain_0:
    dw $000B,$000C                                                       ;A9A586;
    db $01                                                               ;A9A58A;
    dw $2133,$8002                                                       ;A9A58B;
    db $09                                                               ;A9A58F;
    dw $2100,$81E8                                                       ;A9A590;
    db $04                                                               ;A9A594;
    dw $2108,$81F8                                                       ;A9A595;
    db $04                                                               ;A9A599;
    dw $2102,$81F8                                                       ;A9A59A;
    db $F4                                                               ;A9A59E;
    dw $2120,$8008                                                       ;A9A59F;
    db $00                                                               ;A9A5A3;
    dw $2104,$8008                                                       ;A9A5A4;
    db $F0                                                               ;A9A5A8;
    dw $211E,$8008                                                       ;A9A5A9;
    db $E8                                                               ;A9A5AD;
    dw $210E,$81F8                                                       ;A9A5AE;
    db $E4                                                               ;A9A5B2;
    dw $210A,$01F0                                                       ;A9A5B3;
    db $EC                                                               ;A9A5B7;
    dw $2122,$81E8                                                       ;A9A5B8;
    db $F4                                                               ;A9A5BC;
    dw $2106                                                             ;A9A5BD;

Spritemaps_MotherBrain_1:
    dw $000B,$000C                                                       ;A9A5BF;
    db $01                                                               ;A9A5C3;
    dw $2132,$8002                                                       ;A9A5C4;
    db $09                                                               ;A9A5C8;
    dw $2100,$81E8                                                       ;A9A5C9;
    db $04                                                               ;A9A5CD;
    dw $2108,$81F8                                                       ;A9A5CE;
    db $04                                                               ;A9A5D2;
    dw $2102,$81F8                                                       ;A9A5D3;
    db $F4                                                               ;A9A5D7;
    dw $2120,$8008                                                       ;A9A5D8;
    db $00                                                               ;A9A5DC;
    dw $2104,$8008                                                       ;A9A5DD;
    db $F0                                                               ;A9A5E1;
    dw $211E,$8008                                                       ;A9A5E2;
    db $E8                                                               ;A9A5E6;
    dw $210E,$81F8                                                       ;A9A5E7;
    db $E4                                                               ;A9A5EB;
    dw $210A,$01F0                                                       ;A9A5EC;
    db $EC                                                               ;A9A5F0;
    dw $2122,$81E8                                                       ;A9A5F1;
    db $F4                                                               ;A9A5F5;
    dw $2106                                                             ;A9A5F6;

Spritemaps_MotherBrain_2:
    dw $000A,$8002                                                       ;A9A5F8;
    db $09                                                               ;A9A5FC;
    dw $2100,$81E8                                                       ;A9A5FD;
    db $04                                                               ;A9A601;
    dw $2108,$81F8                                                       ;A9A602;
    db $04                                                               ;A9A606;
    dw $2102,$81F8                                                       ;A9A607;
    db $F4                                                               ;A9A60B;
    dw $2120,$8008                                                       ;A9A60C;
    db $00                                                               ;A9A610;
    dw $2104,$8008                                                       ;A9A611;
    db $F0                                                               ;A9A615;
    dw $211E,$8008                                                       ;A9A616;
    db $E8                                                               ;A9A61A;
    dw $210E,$81F8                                                       ;A9A61B;
    db $E4                                                               ;A9A61F;
    dw $210A,$01F0                                                       ;A9A620;
    db $EC                                                               ;A9A624;
    dw $2122,$81E8                                                       ;A9A625;
    db $F4                                                               ;A9A629;
    dw $2106                                                             ;A9A62A;

Spritemaps_MotherBrain_3:
    dw $000A,$81FF                                                       ;A9A62C;
    db $0E                                                               ;A9A630;
    dw $2124,$81E8                                                       ;A9A631;
    db $04                                                               ;A9A635;
    dw $2108,$81F8                                                       ;A9A636;
    db $04                                                               ;A9A63A;
    dw $2102,$81F8                                                       ;A9A63B;
    db $F4                                                               ;A9A63F;
    dw $2120,$8008                                                       ;A9A640;
    db $00                                                               ;A9A644;
    dw $2104,$8008                                                       ;A9A645;
    db $F0                                                               ;A9A649;
    dw $211E,$8008                                                       ;A9A64A;
    db $E8                                                               ;A9A64E;
    dw $210E,$81F8                                                       ;A9A64F;
    db $E4                                                               ;A9A653;
    dw $210A,$01F0                                                       ;A9A654;
    db $EC                                                               ;A9A658;
    dw $2122,$81E8                                                       ;A9A659;
    db $F4                                                               ;A9A65D;
    dw $2106                                                             ;A9A65E;

Spritemaps_MotherBrain_4:
    dw $000A,$81FC                                                       ;A9A660;
    db $10                                                               ;A9A664;
    dw $2126,$81E8                                                       ;A9A665;
    db $04                                                               ;A9A669;
    dw $2108,$81F8                                                       ;A9A66A;
    db $04                                                               ;A9A66E;
    dw $2102,$81F8                                                       ;A9A66F;
    db $F4                                                               ;A9A673;
    dw $2120,$8008                                                       ;A9A674;
    db $00                                                               ;A9A678;
    dw $2104,$8008                                                       ;A9A679;
    db $F0                                                               ;A9A67D;
    dw $211E,$8008                                                       ;A9A67E;
    db $E8                                                               ;A9A682;
    dw $210E,$81F8                                                       ;A9A683;
    db $E4                                                               ;A9A687;
    dw $210A,$01F0                                                       ;A9A688;
    db $EC                                                               ;A9A68C;
    dw $2122,$81E8                                                       ;A9A68D;
    db $F4                                                               ;A9A691;
    dw $2106                                                             ;A9A692;

Spritemaps_MotherBrain_5:
    dw $0001,$81F8                                                       ;A9A694;
    db $F8                                                               ;A9A698;
    dw $212A                                                             ;A9A699;

Spritemaps_MotherBrain_6:
    dw $000C,$000C                                                       ;A9A69B;
    db $01                                                               ;A9A69F;
    dw $2133,$8002                                                       ;A9A6A0;
    db $09                                                               ;A9A6A4;
    dw $2100,$8008                                                       ;A9A6A5;
    db $00                                                               ;A9A6A9;
    dw $2104,$0008                                                       ;A9A6AA;
    db $E8                                                               ;A9A6AE;
    dw $2123,$8008                                                       ;A9A6AF;
    db $F0                                                               ;A9A6B3;
    dw $213E,$81F8                                                       ;A9A6B4;
    db $E4                                                               ;A9A6B8;
    dw $213C,$81F8                                                       ;A9A6B9;
    db $F4                                                               ;A9A6BD;
    dw $2128,$81F8                                                       ;A9A6BE;
    db $04                                                               ;A9A6C2;
    dw $2102,$01F0                                                       ;A9A6C3;
    db $0C                                                               ;A9A6C7;
    dw $214B,$01F0                                                       ;A9A6C8;
    db $EC                                                               ;A9A6CC;
    dw $214A,$81E8                                                       ;A9A6CD;
    db $F4                                                               ;A9A6D1;
    dw $210C,$81E8                                                       ;A9A6D2;
    db $FC                                                               ;A9A6D6;
    dw $211C                                                             ;A9A6D7;

Spritemaps_MotherBrain_7:
    dw $000C,$000C                                                       ;A9A6D9;
    db $01                                                               ;A9A6DD;
    dw $2132,$8002                                                       ;A9A6DE;
    db $09                                                               ;A9A6E2;
    dw $2100,$8008                                                       ;A9A6E3;
    db $00                                                               ;A9A6E7;
    dw $2104,$0008                                                       ;A9A6E8;
    db $E8                                                               ;A9A6EC;
    dw $2123,$8008                                                       ;A9A6ED;
    db $F0                                                               ;A9A6F1;
    dw $213E,$81F8                                                       ;A9A6F2;
    db $E4                                                               ;A9A6F6;
    dw $213C,$81F8                                                       ;A9A6F7;
    db $F4                                                               ;A9A6FB;
    dw $2128,$81F8                                                       ;A9A6FC;
    db $04                                                               ;A9A700;
    dw $2102,$01F0                                                       ;A9A701;
    db $0C                                                               ;A9A705;
    dw $214B,$01F0                                                       ;A9A706;
    db $EC                                                               ;A9A70A;
    dw $214A,$81E8                                                       ;A9A70B;
    db $F4                                                               ;A9A70F;
    dw $210C,$81E8                                                       ;A9A710;
    db $FC                                                               ;A9A714;
    dw $211C                                                             ;A9A715;

Spritemaps_MotherBrain_8:
    dw $000B,$8002                                                       ;A9A717;
    db $09                                                               ;A9A71B;
    dw $2100,$8008                                                       ;A9A71C;
    db $00                                                               ;A9A720;
    dw $2104,$0008                                                       ;A9A721;
    db $E8                                                               ;A9A725;
    dw $2123,$8008                                                       ;A9A726;
    db $F0                                                               ;A9A72A;
    dw $213E,$81F8                                                       ;A9A72B;
    db $E4                                                               ;A9A72F;
    dw $213C,$81F8                                                       ;A9A730;
    db $F4                                                               ;A9A734;
    dw $2128,$81F8                                                       ;A9A735;
    db $04                                                               ;A9A739;
    dw $2102,$01F0                                                       ;A9A73A;
    db $0C                                                               ;A9A73E;
    dw $214B,$01F0                                                       ;A9A73F;
    db $EC                                                               ;A9A743;
    dw $214A,$81E8                                                       ;A9A744;
    db $F4                                                               ;A9A748;
    dw $210C,$81E8                                                       ;A9A749;
    db $FC                                                               ;A9A74D;
    dw $211C                                                             ;A9A74E;

Spritemaps_MotherBrain_9:
    dw $000B,$81FF                                                       ;A9A750;
    db $0E                                                               ;A9A754;
    dw $2124,$8008                                                       ;A9A755;
    db $00                                                               ;A9A759;
    dw $2104,$0008                                                       ;A9A75A;
    db $E8                                                               ;A9A75E;
    dw $2123,$8008                                                       ;A9A75F;
    db $F0                                                               ;A9A763;
    dw $213E,$81F8                                                       ;A9A764;
    db $E4                                                               ;A9A768;
    dw $213C,$81F8                                                       ;A9A769;
    db $F4                                                               ;A9A76D;
    dw $2128,$81F8                                                       ;A9A76E;
    db $04                                                               ;A9A772;
    dw $2102,$01F0                                                       ;A9A773;
    db $0C                                                               ;A9A777;
    dw $214B,$01F0                                                       ;A9A778;
    db $EC                                                               ;A9A77C;
    dw $214A,$81E8                                                       ;A9A77D;
    db $F4                                                               ;A9A781;
    dw $210C,$81E8                                                       ;A9A782;
    db $FC                                                               ;A9A786;
    dw $211C                                                             ;A9A787;

Spritemaps_MotherBrain_A:
    dw $000B,$81FC                                                       ;A9A789;
    db $10                                                               ;A9A78D;
    dw $2126,$8008                                                       ;A9A78E;
    db $00                                                               ;A9A792;
    dw $2104,$0008                                                       ;A9A793;
    db $E8                                                               ;A9A797;
    dw $2123,$8008                                                       ;A9A798;
    db $F0                                                               ;A9A79C;
    dw $213E,$81F8                                                       ;A9A79D;
    db $E4                                                               ;A9A7A1;
    dw $213C,$81F8                                                       ;A9A7A2;
    db $F4                                                               ;A9A7A6;
    dw $2128,$81F8                                                       ;A9A7A7;
    db $04                                                               ;A9A7AB;
    dw $2102,$01F0                                                       ;A9A7AC;
    db $0C                                                               ;A9A7B0;
    dw $214B,$01F0                                                       ;A9A7B1;
    db $EC                                                               ;A9A7B5;
    dw $214A,$81E8                                                       ;A9A7B6;
    db $F4                                                               ;A9A7BA;
    dw $210C,$81E8                                                       ;A9A7BB;
    db $FC                                                               ;A9A7BF;
    dw $211C                                                             ;A9A7C0;

Spritemaps_MotherBrain_B:
    dw $0009,$001C                                                       ;A9A7C2;
    db $1C                                                               ;A9A7C6;
    dw $337B,$8014                                                       ;A9A7C7;
    db $0C                                                               ;A9A7CB;
    dw $335A,$800C                                                       ;A9A7CC;
    db $14                                                               ;A9A7D0;
    dw $3369,$000C                                                       ;A9A7D1;
    db $0C                                                               ;A9A7D5;
    dw $3366,$0014                                                       ;A9A7D6;
    db $04                                                               ;A9A7DA;
    dw $F378,$0004                                                       ;A9A7DB;
    db $14                                                               ;A9A7DF;
    dw $3378,$01FC                                                       ;A9A7E0;
    db $FC                                                               ;A9A7E4;
    dw $3347,$81FC                                                       ;A9A7E5;
    db $04                                                               ;A9A7E9;
    dw $3357,$8004                                                       ;A9A7EA;
    db $FC                                                               ;A9A7EE;
    dw $3348                                                             ;A9A7EF;

Spritemaps_MotherBrain_C:
    dw $0006,$801D                                                       ;A9A7F1;
    db $03                                                               ;A9A7F5;
    dw $335E,$801D                                                       ;A9A7F6;
    db $0B                                                               ;A9A7FA;
    dw $336E,$800D                                                       ;A9A7FB;
    db $0B                                                               ;A9A7FF;
    dw $3362,$800D                                                       ;A9A800;
    db $FB                                                               ;A9A804;
    dw $3360,$81FD                                                       ;A9A805;
    db $03                                                               ;A9A809;
    dw $336C,$81FD                                                       ;A9A80A;
    db $FB                                                               ;A9A80E;
    dw $335C                                                             ;A9A80F;

Spritemaps_MotherBrain_D:
    dw $0008,$0028                                                       ;A9A811;
    db $00                                                               ;A9A815;
    dw $B377,$0028                                                       ;A9A816;
    db $F8                                                               ;A9A81A;
    dw $3377,$8018                                                       ;A9A81B;
    db $00                                                               ;A9A81F;
    dw $B343,$8018                                                       ;A9A820;
    db $F0                                                               ;A9A824;
    dw $3343,$8010                                                       ;A9A825;
    db $00                                                               ;A9A829;
    dw $B342,$8000                                                       ;A9A82A;
    db $00                                                               ;A9A82E;
    dw $B340,$8010                                                       ;A9A82F;
    db $F0                                                               ;A9A833;
    dw $3342,$8000                                                       ;A9A834;
    db $F0                                                               ;A9A838;
    dw $3340                                                             ;A9A839;

Spritemaps_MotherBrain_E:
    dw $0006,$801D                                                       ;A9A83B;
    db $ED                                                               ;A9A83F;
    dw $B35E,$801D                                                       ;A9A840;
    db $E5                                                               ;A9A844;
    dw $B36E,$800D                                                       ;A9A845;
    db $E5                                                               ;A9A849;
    dw $B362,$800D                                                       ;A9A84A;
    db $F5                                                               ;A9A84E;
    dw $B360,$81FD                                                       ;A9A84F;
    db $ED                                                               ;A9A853;
    dw $B36C,$81FD                                                       ;A9A854;
    db $F5                                                               ;A9A858;
    dw $B35C                                                             ;A9A859;

Spritemaps_MotherBrain_F:
    dw $0001,$81F8                                                       ;A9A85B;
    db $F8                                                               ;A9A85F;
    dw $3364                                                             ;A9A860;

Spritemaps_MotherBrain_10:
    dw $0002,$81F8                                                       ;A9A862;
    db $10                                                               ;A9A866;
    dw $3388,$81F8                                                       ;A9A867;
    db $00                                                               ;A9A86B;
    dw $3345                                                             ;A9A86C;

Spritemaps_MotherBrain_11:
    dw $0002,$81F3                                                       ;A9A86E;
    db $10                                                               ;A9A872;
    dw $338A,$81F7                                                       ;A9A873;
    db $00                                                               ;A9A877;
    dw $3381                                                             ;A9A878;

Spritemaps_MotherBrain_12:
    dw $0004,$01FB                                                       ;A9A87A;
    db $0E                                                               ;A9A87E;
    dw $3376,$81EB                                                       ;A9A87F;
    db $0E                                                               ;A9A883;
    dw $3386,$81FB                                                       ;A9A884;
    db $FE                                                               ;A9A888;
    dw $3384,$81F3                                                       ;A9A889;
    db $FE                                                               ;A9A88D;
    dw $3383                                                             ;A9A88E;

Spritemaps_MotherBrain_13:
    dw $0004,$0010                                                       ;A9A890;
    db $00                                                               ;A9A894;
    dw $3390,$0008                                                       ;A9A895;
    db $00                                                               ;A9A899;
    dw $3380,$81F8                                                       ;A9A89A;
    db $F8                                                               ;A9A89E;
    dw $338E,$81E8                                                       ;A9A89F;
    db $F8                                                               ;A9A8A3;
    dw $338C                                                             ;A9A8A4;

Spritemaps_MotherBrain_14:
    dw $0009,$001C                                                       ;A9A8A6;
    db $1C                                                               ;A9A8AA;
    dw $277B,$8014                                                       ;A9A8AB;
    db $0C                                                               ;A9A8AF;
    dw $275A,$800C                                                       ;A9A8B0;
    db $14                                                               ;A9A8B4;
    dw $2769,$000C                                                       ;A9A8B5;
    db $0C                                                               ;A9A8B9;
    dw $2766,$0014                                                       ;A9A8BA;
    db $04                                                               ;A9A8BE;
    dw $E778,$0004                                                       ;A9A8BF;
    db $14                                                               ;A9A8C3;
    dw $2778,$01FC                                                       ;A9A8C4;
    db $FC                                                               ;A9A8C8;
    dw $2747,$81FC                                                       ;A9A8C9;
    db $04                                                               ;A9A8CD;
    dw $2757,$8004                                                       ;A9A8CE;
    db $FC                                                               ;A9A8D2;
    dw $2748                                                             ;A9A8D3;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_MotherBrain_A9A8D5:
    dw $0006,$801D                                                       ;A9A8D5;
    db $03                                                               ;A9A8D9;
    dw $275E,$801D                                                       ;A9A8DA;
    db $0B                                                               ;A9A8DE;
    dw $276E,$800D                                                       ;A9A8DF;
    db $0B                                                               ;A9A8E3;
    dw $2762,$800D                                                       ;A9A8E4;
    db $FB                                                               ;A9A8E8;
    dw $2760,$81FD                                                       ;A9A8E9;
    db $03                                                               ;A9A8ED;
    dw $276C,$81FD                                                       ;A9A8EE;
    db $FB                                                               ;A9A8F2;
    dw $275C                                                             ;A9A8F3;

UNUSED_Spritemaps_MotherBrain_A9A8F5:
    dw $0008,$0028                                                       ;A9A8F5;
    db $00                                                               ;A9A8F9;
    dw $A777,$0028                                                       ;A9A8FA;
    db $F8                                                               ;A9A8FE;
    dw $2777,$8018                                                       ;A9A8FF;
    db $00                                                               ;A9A903;
    dw $A743,$8018                                                       ;A9A904;
    db $F0                                                               ;A9A908;
    dw $2743,$8010                                                       ;A9A909;
    db $00                                                               ;A9A90D;
    dw $A742,$8000                                                       ;A9A90E;
    db $00                                                               ;A9A912;
    dw $A740,$8010                                                       ;A9A913;
    db $F0                                                               ;A9A917;
    dw $2742,$8000                                                       ;A9A918;
    db $F0                                                               ;A9A91C;
    dw $2740                                                             ;A9A91D;

UNUSED_Spritemaps_MotherBrain_A9A91F:
    dw $0006,$801D                                                       ;A9A91F;
    db $ED                                                               ;A9A923;
    dw $A75E,$801D                                                       ;A9A924;
    db $E5                                                               ;A9A928;
    dw $A76E,$800D                                                       ;A9A929;
    db $E5                                                               ;A9A92D;
    dw $A762,$800D                                                       ;A9A92E;
    db $F5                                                               ;A9A932;
    dw $A760,$81FD                                                       ;A9A933;
    db $ED                                                               ;A9A937;
    dw $A76C,$81FD                                                       ;A9A938;
    db $F5                                                               ;A9A93C;
    dw $A75C                                                             ;A9A93D;
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_MotherBrain_15:
    dw $0001,$81F8                                                       ;A9A93F;
    db $F8                                                               ;A9A943;
    dw $2764                                                             ;A9A944;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_MotherBrain_A9A946:
    dw $0002,$81F8                                                       ;A9A946;
    db $10                                                               ;A9A94A;
    dw $2788,$81F8                                                       ;A9A94B;
    db $00                                                               ;A9A94F;
    dw $2745                                                             ;A9A950;

UNUSED_Spritemaps_MotherBrain_A9A952:
    dw $0002,$81F3                                                       ;A9A952;
    db $10                                                               ;A9A956;
    dw $278A,$81F7                                                       ;A9A957;
    db $00                                                               ;A9A95B;
    dw $2781                                                             ;A9A95C;
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_MotherBrain_16:
    dw $0004,$01FB                                                       ;A9A95E;
    db $0E                                                               ;A9A962;
    dw $2776,$81EB                                                       ;A9A963;
    db $0E                                                               ;A9A967;
    dw $2786,$81FB                                                       ;A9A968;
    db $FE                                                               ;A9A96C;
    dw $2784,$81F3                                                       ;A9A96D;
    db $FE                                                               ;A9A971;
    dw $2783                                                             ;A9A972;

Spritemaps_MotherBrain_17:
    dw $0004,$0010                                                       ;A9A974;
    db $00                                                               ;A9A978;
    dw $2790,$0008                                                       ;A9A979;
    db $00                                                               ;A9A97D;
    dw $2780,$81F8                                                       ;A9A97E;
    db $F8                                                               ;A9A982;
    dw $278E,$81E8                                                       ;A9A983;
    db $F8                                                               ;A9A987;
    dw $278C                                                             ;A9A988;

ExtendedTilemaps_MotherBrain_0:
    dw $FFFE,$2080,$0004,$2338,$2338,$31B7,$31B8,$20C0                   ;A9A98A;
    dw $0004,$2338,$31B9,$31BA,$31BB,$2100,$0004,$2338                   ;A9A99A;
    dw $31BC,$31BD,$31BE,$2140,$000A,$31BF,$31C0,$31C1                   ;A9A9AA;
    dw $31C2,$31C3,$31C4,$31C5,$31C6,$31C7,$31C8,$2180                   ;A9A9BA;
    dw $000A,$31CA,$31CB,$31CC,$31CD,$31CE,$31CF,$31D0                   ;A9A9CA;
    dw $2338,$2338,$2338,$21C0,$000A,$31D1,$31D2,$31D3                   ;A9A9DA;
    dw $31D4,$31D5,$31D6,$31D7,$31D8,$2338,$2338,$2200                   ;A9A9EA;
    dw $000A,$31D9,$31DA,$31DB,$31DC,$31DD,$31DE,$31DF                   ;A9A9FA;
    dw $31E0,$2338,$2338,$2240,$000A,$31E1,$31E2,$31E3                   ;A9AA0A;
    dw $31E4,$31E5,$31E6,$31E7,$2338,$2338,$2338,$2280                   ;A9AA1A;
    dw $000A,$2338,$31E8,$31E9,$31EA,$31EB,$31EC,$31ED                   ;A9AA2A;
    dw $2338,$2338,$2338,$22C0,$0004,$2338,$2338,$31EE                   ;A9AA3A;
    dw $31EF,$FFFF                                                       ;A9AA4A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedTilemaps_MotherBrain_A9AA4E:
    dw $FFFE,$2084,$0002,$2338,$2338,$20C2,$0003,$2338                   ;A9AA4E;
    dw $2338,$2338,$2102,$0003,$2338,$2338,$2338,$2140                   ;A9AA5E;
    dw $000A,$2338,$2338,$2338,$2338,$2338,$2338,$2338                   ;A9AA6E;
    dw $2338,$2338,$2338,$2180,$0007,$2338,$2338,$2338                   ;A9AA7E;
    dw $2338,$2338,$2338,$2338,$21C0,$0008,$2338,$2338                   ;A9AA8E;
    dw $2338,$2338,$2338,$2338,$2338,$2338,$2200,$0008                   ;A9AA9E;
    dw $2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338                   ;A9AAAE;
    dw $2240,$0007,$2338,$2338,$2338,$2338,$2338,$2338                   ;A9AABE;
    dw $2338,$2282,$0006,$2338,$2338,$2338,$2338,$2338                   ;A9AACE;
    dw $2338,$22C4,$0002,$2338,$2338,$FFFF                               ;A9AADE;
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedTilemaps_MotherBrain_1:
    dw $FFFE,$2006,$000B,$2338,$2338,$3167,$3168,$3169                   ;A9AAEA;
    dw $2338,$2338,$2338,$2338,$2338,$2338,$2046,$000B                   ;A9AAFA;
    dw $2338,$316A,$316B,$316C,$316D,$316E,$2338,$2338                   ;A9AB0A;
    dw $2338,$2338,$2338,$2086,$000B,$31B8,$316F,$3170                   ;A9AB1A;
    dw $3171,$3172,$3173,$3174,$3186,$3187,$2338,$2338                   ;A9AB2A;
    dw $20C6,$000B,$31BB,$3177,$3178,$3179,$317A,$317B                   ;A9AB3A;
    dw $317C,$3188,$3189,$2338,$2338,$2106,$000B,$31BE                   ;A9AB4A;
    dw $317F,$3180,$3181,$3182,$3183,$3184,$3185,$2338                   ;A9AB5A;
    dw $2338,$2338,$FFFF                                                 ;A9AB6A;

ExtendedTilemaps_MotherBrain_2:
    dw $FFFE,$2006,$000B,$2338,$2338,$3167,$3168,$3169                   ;A9AB70;
    dw $2338,$2338,$2338,$2338,$2338,$2338,$2046,$000B                   ;A9AB80;
    dw $2338,$316A,$316B,$316C,$316D,$316E,$2338,$2338                   ;A9AB90;
    dw $2338,$2338,$2338,$2086,$000B,$31B8,$316F,$3170                   ;A9ABA0;
    dw $3171,$3172,$3173,$3174,$3175,$3176,$2338,$2338                   ;A9ABB0;
    dw $20C6,$000B,$31BB,$3177,$3178,$3179,$317A,$317B                   ;A9ABC0;
    dw $317C,$317D,$317E,$2338,$2338,$2106,$000B,$31BE                   ;A9ABD0;
    dw $317F,$3180,$3181,$3182,$3183,$3184,$3185,$2338                   ;A9ABE0;
    dw $2338,$2338,$FFFF                                                 ;A9ABF0;

ExtendedTilemaps_MotherBrain_3:
    dw $FFFE,$2006,$0001,$2338,$200A,$0002,$318A,$318B                   ;A9ABF6;
    dw $2018,$0002,$2338,$2338,$2046,$0001,$2338,$204A                   ;A9AC06;
    dw $0003,$318C,$318D,$318E,$2058,$0002,$2338,$2338                   ;A9AC16;
    dw $2086,$000B,$31B8,$318F,$3190,$3191,$3192,$3193                   ;A9AC26;
    dw $3194,$2338,$2338,$2338,$2338,$20C6,$000B,$31BB                   ;A9AC36;
    dw $3195,$3196,$3197,$3198,$3199,$319A,$319B,$2338                   ;A9AC46;
    dw $2338,$2338,$2106,$0001,$31BE,$210C,$0004,$319C                   ;A9AC56;
    dw $319D,$319E,$319F,$2118,$0002,$2338,$2338,$FFFF                   ;A9AC66;

ExtendedTilemaps_MotherBrain_4:
    dw $FFFE,$200A,$0003,$3167,$31A0,$31A1,$2046,$0001                   ;A9AC76;
    dw $31B6,$204A,$0004,$31A2,$31A3,$31A4,$31A5,$2056                   ;A9AC86;
    dw $0003,$31A6,$31A7,$31A8,$2088,$000A,$316F,$31A9                   ;A9AC96;
    dw $31AA,$31AB,$31AC,$31AD,$31AE,$31AF,$31B0,$31B1                   ;A9ACA6;
    dw $20C8,$0007,$3177,$3178,$3178,$31B2,$31B3,$31B4                   ;A9ACB6;
    dw $31B5,$2106,$0001,$31BE,$210C,$0004,$319C,$319D                   ;A9ACC6;
    dw $319E,$319F,$2118,$0002,$2338,$2338,$FFFF                         ;A9ACD6;

ExtendedTilemaps_MotherBrain_5:
    dw $FFFE,$200C,$0002,$3168,$3169,$2046,$0001,$2338                   ;A9ACE4;
    dw $204A,$0004,$316B,$316C,$316D,$316E,$2056,$0003                   ;A9ACF4;
    dw $2338,$2338,$2338,$208A,$0009,$3170,$3171,$3172                   ;A9AD04;
    dw $3173,$3174,$3186,$3187,$2338,$2338,$20CC,$0006                   ;A9AD14;
    dw $3179,$317A,$317B,$317C,$3188,$3189,$210C,$0004                   ;A9AD24;
    dw $3181,$3182,$3183,$3184,$FFFF                                     ;A9AD34;

Spritemaps_MotherBrain_18:
    dw $0009,$8008                                                       ;A9AD3E;
    db $08                                                               ;A9AD42;
    dw $21E4,$81F8                                                       ;A9AD43;
    db $08                                                               ;A9AD47;
    dw $21E2,$81E8                                                       ;A9AD48;
    db $08                                                               ;A9AD4C;
    dw $21E0,$8008                                                       ;A9AD4D;
    db $F8                                                               ;A9AD51;
    dw $21C4,$81F8                                                       ;A9AD52;
    db $F8                                                               ;A9AD56;
    dw $21C2,$81E8                                                       ;A9AD57;
    db $F8                                                               ;A9AD5B;
    dw $21C0,$8008                                                       ;A9AD5C;
    db $E8                                                               ;A9AD60;
    dw $21A4,$81F8                                                       ;A9AD61;
    db $E8                                                               ;A9AD65;
    dw $21A2,$81E8                                                       ;A9AD66;
    db $E8                                                               ;A9AD6A;
    dw $21A0                                                             ;A9AD6B;

Spritemaps_MotherBrain_19:
    dw $000A,$8014                                                       ;A9AD6D;
    db $08                                                               ;A9AD71;
    dw $21EC,$8004                                                       ;A9AD72;
    db $08                                                               ;A9AD76;
    dw $21EA,$81F4                                                       ;A9AD77;
    db $08                                                               ;A9AD7B;
    dw $21E8,$81E4                                                       ;A9AD7C;
    db $08                                                               ;A9AD80;
    dw $21E6,$8004                                                       ;A9AD81;
    db $F8                                                               ;A9AD85;
    dw $21CA,$81F4                                                       ;A9AD86;
    db $F8                                                               ;A9AD8A;
    dw $21C8,$81E4                                                       ;A9AD8B;
    db $F8                                                               ;A9AD8F;
    dw $21C6,$8004                                                       ;A9AD90;
    db $E8                                                               ;A9AD94;
    dw $21AA,$81F4                                                       ;A9AD95;
    db $E8                                                               ;A9AD99;
    dw $21A8,$81E4                                                       ;A9AD9A;
    db $E8                                                               ;A9AD9E;
    dw $21A6                                                             ;A9AD9F;

Spritemaps_MotherBrainTubes_0:
    dw $000A,$0008                                                       ;A9ADA1;
    db $E4                                                               ;A9ADA5;
    dw $2F5D,$0008                                                       ;A9ADA6;
    db $DC                                                               ;A9ADAA;
    dw $2F4D,$0000                                                       ;A9ADAB;
    db $E4                                                               ;A9ADAF;
    dw $2F5D,$0000                                                       ;A9ADB0;
    db $DC                                                               ;A9ADB4;
    dw $2F4D,$C3F0                                                       ;A9ADB5;
    db $DC                                                               ;A9ADB9;
    dw $2F42,$01F8                                                       ;A9ADBA;
    db $1C                                                               ;A9ADBE;
    dw $2F51,$01F0                                                       ;A9ADBF;
    db $1C                                                               ;A9ADC3;
    dw $2F50,$C3F0                                                       ;A9ADC4;
    db $FC                                                               ;A9ADC8;
    dw $2F47,$C3F0                                                       ;A9ADC9;
    db $EC                                                               ;A9ADCD;
    dw $AF40,$C3F0                                                       ;A9ADCE;
    db $0C                                                               ;A9ADD2;
    dw $2F40                                                             ;A9ADD3;

Spritemaps_MotherBrainTubes_1:
    dw $000A,$01F0                                                       ;A9ADD5;
    db $E4                                                               ;A9ADD9;
    dw $6F5D,$01F0                                                       ;A9ADDA;
    db $DC                                                               ;A9ADDE;
    dw $6F4D,$01F8                                                       ;A9ADDF;
    db $E4                                                               ;A9ADE3;
    dw $6F5D,$01F8                                                       ;A9ADE4;
    db $DC                                                               ;A9ADE8;
    dw $6F4D,$C200                                                       ;A9ADE9;
    db $DC                                                               ;A9ADED;
    dw $6F42,$0000                                                       ;A9ADEE;
    db $1C                                                               ;A9ADF2;
    dw $6F51,$0008                                                       ;A9ADF3;
    db $1C                                                               ;A9ADF7;
    dw $6F50,$C200                                                       ;A9ADF8;
    db $FC                                                               ;A9ADFC;
    dw $6F47,$C200                                                       ;A9ADFD;
    db $EC                                                               ;A9AE01;
    dw $EF40,$C200                                                       ;A9AE02;
    db $0C                                                               ;A9AE06;
    dw $6F40                                                             ;A9AE07;

Spritemaps_MotherBrainTubes_2:
    dw $0008,$C3F8                                                       ;A9AE09;
    db $E4                                                               ;A9AE0D;
    dw $2F44,$0000                                                       ;A9AE0E;
    db $14                                                               ;A9AE12;
    dw $2F51,$01F8                                                       ;A9AE13;
    db $14                                                               ;A9AE17;
    dw $2F50,$C3F8                                                       ;A9AE18;
    db $04                                                               ;A9AE1C;
    dw $2F4B,$0000                                                       ;A9AE1D;
    db $FC                                                               ;A9AE21;
    dw $2F51,$01F8                                                       ;A9AE22;
    db $FC                                                               ;A9AE26;
    dw $2F50,$0000                                                       ;A9AE27;
    db $F4                                                               ;A9AE2B;
    dw $2F51,$01F8                                                       ;A9AE2C;
    db $F4                                                               ;A9AE30;
    dw $2F50                                                             ;A9AE31;

Spritemaps_MotherBrainTubes_3:
    dw $0008,$C3F8                                                       ;A9AE33;
    db $E4                                                               ;A9AE37;
    dw $6F44,$01F8                                                       ;A9AE38;
    db $14                                                               ;A9AE3C;
    dw $6F51,$0000                                                       ;A9AE3D;
    db $14                                                               ;A9AE41;
    dw $6F50,$C3F8                                                       ;A9AE42;
    db $04                                                               ;A9AE46;
    dw $2F4B,$01F8                                                       ;A9AE47;
    db $FC                                                               ;A9AE4B;
    dw $6F51,$0000                                                       ;A9AE4C;
    db $FC                                                               ;A9AE50;
    dw $6F50,$01F8                                                       ;A9AE51;
    db $F4                                                               ;A9AE55;
    dw $6F51,$0000                                                       ;A9AE56;
    db $F4                                                               ;A9AE5A;
    dw $6F50                                                             ;A9AE5B;

Spritemaps_MotherBrainTubes_4:
    dw $001A,$0000                                                       ;A9AE5D;
    db $E0                                                               ;A9AE61;
    dw $6F70,$01F8                                                       ;A9AE62;
    db $E0                                                               ;A9AE66;
    dw $2F70,$0000                                                       ;A9AE67;
    db $D8                                                               ;A9AE6B;
    dw $6F60,$01F8                                                       ;A9AE6C;
    db $D8                                                               ;A9AE70;
    dw $2F60,$0008                                                       ;A9AE71;
    db $28                                                               ;A9AE75;
    dw $2F6D,$0000                                                       ;A9AE76;
    db $28                                                               ;A9AE7A;
    dw $2F6D,$01F8                                                       ;A9AE7B;
    db $28                                                               ;A9AE7F;
    dw $2F6D,$01F0                                                       ;A9AE80;
    db $28                                                               ;A9AE84;
    dw $2F6D,$0008                                                       ;A9AE85;
    db $20                                                               ;A9AE89;
    dw $2F6D,$0000                                                       ;A9AE8A;
    db $20                                                               ;A9AE8E;
    dw $2F6D,$01F8                                                       ;A9AE8F;
    db $20                                                               ;A9AE93;
    dw $2F6D,$01F0                                                       ;A9AE94;
    db $20                                                               ;A9AE98;
    dw $2F6D,$0008                                                       ;A9AE99;
    db $18                                                               ;A9AE9D;
    dw $2F6C,$0000                                                       ;A9AE9E;
    db $18                                                               ;A9AEA2;
    dw $2F6C,$01F8                                                       ;A9AEA3;
    db $18                                                               ;A9AEA7;
    dw $2F6C,$01F0                                                       ;A9AEA8;
    db $18                                                               ;A9AEAC;
    dw $2F6C,$C200                                                       ;A9AEAD;
    db $F8                                                               ;A9AEB1;
    dw $6F49,$C3F0                                                       ;A9AEB2;
    db $F8                                                               ;A9AEB6;
    dw $2F49,$C200                                                       ;A9AEB7;
    db $08                                                               ;A9AEBB;
    dw $6F46,$C3F0                                                       ;A9AEBC;
    db $08                                                               ;A9AEC0;
    dw $2F46,$C200                                                       ;A9AEC1;
    db $E8                                                               ;A9AEC5;
    dw $2F40,$C3F0                                                       ;A9AEC6;
    db $E8                                                               ;A9AECA;
    dw $2F40,$C200                                                       ;A9AECB;
    db $D8                                                               ;A9AECF;
    dw $EF4E,$C3F0                                                       ;A9AED0;
    db $D8                                                               ;A9AED4;
    dw $AF4E,$C200                                                       ;A9AED5;
    db $D0                                                               ;A9AED9;
    dw $EF5E,$C3F0                                                       ;A9AEDA;
    db $D0                                                               ;A9AEDE;
    dw $AF5E                                                             ;A9AEDF;

Function_MBBody_Phase3_DeathSequence_MoveToBackOfRoom:
    LDA.W $0F86                                                          ;A9AEE1;
    ORA.W #$0400                                                         ;A9AEE4;
    STA.W $0F86                                                          ;A9AEE7;
    LDA.W $0FC6                                                          ;A9AEEA;
    ORA.W #$0400                                                         ;A9AEED;
    STA.W $0FC6                                                          ;A9AEF0;
    LDA.W #$0000                                                         ;A9AEF3;
    STA.L $7E7808                                                        ;A9AEF6;
    LDY.W #$0006                                                         ;A9AEFA;
    LDA.W #$0028                                                         ;A9AEFD;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9AF00;
    BCS .arrivedAtBack                                                   ;A9AF03;
    RTS                                                                  ;A9AF05;


.arrivedAtBack:
    LDA.W #Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding      ;A9AF06;
    STA.W $0FA8                                                          ;A9AF09;
    LDA.W #$0080                                                         ;A9AF0C;
    STA.W $0FB2                                                          ;A9AF0F;

Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody                   ;A9AF12;
    DEC.W $0FB2                                                          ;A9AF15;
    BPL Function_MBBody_Phase3_DeathSequence_return                      ;A9AF18;
    LDA.W #Function_MBBody_Phase3_DeathSequence_StumbleToMiddleOfRoom    ;A9AF1A;
    STA.W $0FA8                                                          ;A9AF1D;

Function_MBBody_Phase3_DeathSequence_return:
    RTS                                                                  ;A9AF20;


Function_MBBody_Phase3_DeathSequence_StumbleToMiddleOfRoom:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody                   ;A9AF21;
    LDY.W #$0002                                                         ;A9AF24;
    LDA.W #$0060                                                         ;A9AF27;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9AF2A;
    BCC Function_MBBody_Phase3_DeathSequence_return                      ;A9AF2D;
    LDA.W #InstList_MotherBrainHead_DyingDrool_0                         ;A9AF2F;
    JSR.W SetMotherBrainHeadInstList                                     ;A9AF32;
    LDA.W #$0006                                                         ;A9AF35;
    STA.L $7E8064                                                        ;A9AF38;
    STA.L $7E8066                                                        ;A9AF3C;
    LDA.W #$0500                                                         ;A9AF40;
    STA.L $7E8068                                                        ;A9AF43;
    LDA.W #Function_MBBody_Phase3_DeathSequence_DisableBrainEffects      ;A9AF47;
    STA.W $0FA8                                                          ;A9AF4A;
    LDA.W #$0020                                                         ;A9AF4D;
    STA.W $0FB2                                                          ;A9AF50;
    RTS                                                                  ;A9AF53;


Function_MBBody_Phase3_DeathSequence_DisableBrainEffects:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody                   ;A9AF54;
    DEC.W $0FB2                                                          ;A9AF57;
    BPL Function_MBBody_Phase3_DeathSequence_return                      ;A9AF5A;
    LDA.W #$0000                                                         ;A9AF5C;
    STA.L $7E8064                                                        ;A9AF5F;
    STA.L $7E8066                                                        ;A9AF63;
    STA.L $7E7864                                                        ;A9AF67;
    STA.L $7E7868                                                        ;A9AF6B;
    STA.L $7E7860                                                        ;A9AF6F;
    STA.L $7E7862                                                        ;A9AF73;
    LDX.W #$001C                                                         ;A9AF77;

.loopPalette:
    LDA.L $7EC122,X                                                      ;A9AF7A;
    STA.L $7EC1E2,X                                                      ;A9AF7E;
    DEX                                                                  ;A9AF82;
    DEX                                                                  ;A9AF83;
    BPL .loopPalette                                                     ;A9AF84;
    JSL.L MotherBrainHealthBasedPaletteHandling                          ;A9AF86;
    LDA.W #$0E00                                                         ;A9AF8A;
    STA.L $7E781A                                                        ;A9AF8D;
    STZ.W $0FF0                                                          ;A9AF91;
    STZ.W $0FF2                                                          ;A9AF94;
    LDA.W #Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut         ;A9AF97;
    STA.W $0FA8                                                          ;A9AF9A; fallthrough to Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut

Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut:
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody                   ;A9AF9D;
    DEC.W $0FB2                                                          ;A9AFA0;
    BMI .timerExpired                                                    ;A9AFA3;
    RTS                                                                  ;A9AFA5;


.timerExpired:
    LDA.W #$0000                                                         ;A9AFA6;
    STA.L $7E802E                                                        ;A9AFA9;
    LDA.W #Function_MBBody_Phase3_DeathSequence_FadeOutBody              ;A9AFAD;
    STA.W $0FA8                                                          ;A9AFB0;
    STZ.W $0FB2                                                          ;A9AFB3; fallthrough to Function_MBBody_Phase3_DeathSequence_FadeOutBody

Function_MBBody_Phase3_DeathSequence_FadeOutBody:
    JSL.L HandleMotherBrainBodyFlickering                                ;A9AFB6;
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody                   ;A9AFBA;
    DEC.W $0FB2                                                          ;A9AFBD;
    BPL .returnUpper                                                     ;A9AFC0;
    LDA.W #$0010                                                         ;A9AFC2;
    STA.W $0FB2                                                          ;A9AFC5;
    LDA.L $7E802E                                                        ;A9AFC8;
    INC A                                                                ;A9AFCC;
    STA.L $7E802E                                                        ;A9AFCD;
    DEC A                                                                ;A9AFD1;
    JSL.L FadeMotherBrainPaletteToBlack                                  ;A9AFD2;
    BCS .fadedToBlack                                                    ;A9AFD6;

.returnUpper:
    RTS                                                                  ;A9AFD8;


.fadedToBlack:
    LDA.W #$02C6                                                         ;A9AFD9;
    STA.W $179A                                                          ;A9AFDC;
    TAX                                                                  ;A9AFDF;
    PHB                                                                  ;A9AFE0;
    PEA.W $7E7E                                                          ;A9AFE1;
    PLB                                                                  ;A9AFE4;
    PLB                                                                  ;A9AFE5;
    LDA.W #$0338                                                         ;A9AFE6; >.< off by one, causing a few black pixels to remain

.loopTilemap:
    STA.W $2000,X                                                        ;A9AFE9;
    DEX                                                                  ;A9AFEC;
    DEX                                                                  ;A9AFED;
    BPL .loopTilemap                                                     ;A9AFEE;
    PLB                                                                  ;A9AFF0;
    LDA.W #$0001                                                         ;A9AFF1;
    STA.W $0E1E                                                          ;A9AFF4;
    LDA.W $0F86                                                          ;A9AFF7;
    ORA.W #$0100                                                         ;A9AFFA;
    AND.W #$DFFF                                                         ;A9AFFD;
    STA.W $0F86                                                          ;A9B000;
    STZ.W $0F88                                                          ;A9B003;
    LDA.W #Function_MBBody_Phase3_DeathSequence_FinalFewExplosions       ;A9B006;
    STA.W $0FA8                                                          ;A9B009;
    LDA.W #$0010                                                         ;A9B00C;
    STA.W $0FB2                                                          ;A9B00F;

Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower:
    RTS                                                                  ;A9B012;


Function_MBBody_Phase3_DeathSequence_FinalFewExplosions:
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody                   ;A9B013;
    DEC.W $0FB2                                                          ;A9B016;
    BPL Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower     ;A9B019;
    LDA.W #Function_MBBody_Phase3_DeathSequence_RealizeDecapitation      ;A9B01B;
    STA.W $0FA8                                                          ;A9B01E;
    RTS                                                                  ;A9B021;


GenerateSmokyExplosionsAroundMotherBrainBody:
    LDA.W #MotherBrainExplosionParameters_1                              ;A9B022;
    STA.B $16                                                            ;A9B025;
    LDA.W #$0002                                                         ;A9B027;
    STA.B $18                                                            ;A9B02A;
    LDA.W #$0010                                                         ;A9B02C;
    BRA GenerateExplosionsAroundMotherBrainBody                          ;A9B02F;


GenerateMixedExplosionsAroundMotherBrainBody:
    LDA.W #MotherBrainExplosionParameters_0                              ;A9B031;
    STA.B $16                                                            ;A9B034;
    LDA.W #$0004                                                         ;A9B036;
    STA.B $18                                                            ;A9B039;
    LDA.W #$0008                                                         ;A9B03B; fallthrough to GenerateExplosionsAroundMotherBrainBody

GenerateExplosionsAroundMotherBrainBody:
    DEC.W $0FF0                                                          ;A9B03E;
    BPL Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower     ;A9B041;
    STA.W $0FF0                                                          ;A9B043;
    DEC.W $0FF2                                                          ;A9B046;
    BPL .getIndex                                                        ;A9B049;
    LDA.W #$0006                                                         ;A9B04B;
    STA.W $0FF2                                                          ;A9B04E;

.getIndex:
    LDA.W $0FF2                                                          ;A9B051;
    ASL A                                                                ;A9B054;
    ASL A                                                                ;A9B055;
    ASL A                                                                ;A9B056;
    ASL A                                                                ;A9B057;
    TAX                                                                  ;A9B058;
    LDA.B $18                                                            ;A9B059;

.loop:
    PHA                                                                  ;A9B05B;
    PHX                                                                  ;A9B05C;
    LDA.W .XOffset,X                                                     ;A9B05D;
    STA.B $12                                                            ;A9B060;
    LDA.W .YOffset,X                                                     ;A9B062;
    STA.B $14                                                            ;A9B065;
    LDX.B $16                                                            ;A9B067;
    LDY.W $0000,X                                                        ;A9B069;
    JSL.L GenerateRandomNumber                                           ;A9B06C;
    CMP.W #$4000                                                         ;A9B070;
    BCC .random                                                          ;A9B073;
    LDY.W $0002,X                                                        ;A9B075;
    CMP.W #$E000                                                         ;A9B078;
    BCC .random                                                          ;A9B07B;
    LDY.W $0004,X                                                        ;A9B07D;

.random:
    TYA                                                                  ;A9B080;
    LDY.W #EnemyProjectile_MotherBrainDeathExplosion                     ;A9B081;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B084;
    PLX                                                                  ;A9B088;
    PLA                                                                  ;A9B089;
    INX                                                                  ;A9B08A;
    INX                                                                  ;A9B08B;
    INX                                                                  ;A9B08C;
    INX                                                                  ;A9B08D;
    DEC A                                                                ;A9B08E;
    BNE .loop                                                            ;A9B08F;
    LDA.W #$0013                                                         ;A9B091;
    JSL.L QueueSound_Lib3_Max3                                           ;A9B094;
    RTS                                                                  ;A9B098;


.XOffset:
    dw $0024                                                             ;A9B099;

.YOffset:
    dw $FFDB,$FFED,$FFF1,$FFFC,$000D,$001D,$0019,$0011                   ;A9B09B;
    dw $FFC9,$001E,$FFEA,$FFFD,$FFFB,$0000,$0028,$0034                   ;A9B0AB;
    dw $FFDE,$FFFD,$FFF1,$000C,$0013,$0019,$002C,$0004                   ;A9B0BB;
    dw $FFD5,$FFF4,$FFEA,$000D,$FFFE,$FFF8,$0034,$FFFE                   ;A9B0CB;
    dw $FFDF,$000A,$FFF6,$FFF2,$0010,$0006,$003B,$0014                   ;A9B0DB;
    dw $FFD7,$0004,$FFEA,$FFEC,$0003,$FFE5,$0039,$000A                   ;A9B0EB;
    dw $FFE1,$FFEC,$FFF8,$0000,$0017,$001E,$003D                         ;A9B0FB;

MotherBrainExplosionParameters_0:
    dw $0000,$0001,$0002                                                 ;A9B109;

MotherBrainExplosionParameters_1:
    dw $0001,$0001,$0001                                                 ;A9B10F;

Function_MBBody_Phase3_DeathSequence_RealizeDecapitation:
    LDA.W #InstList_MotherBrainHead_Decapitated_0                        ;A9B115;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B118;
    LDA.W #Function_MotherBrain_SetupBrainToBeDrawn                      ;A9B11B;
    STA.W $0FE8                                                          ;A9B11E;
    LDA.W #$0000                                                         ;A9B121;
    STA.W $0FB2                                                          ;A9B124;
    LDA.W #Function_MBBody_Phase3_DeathSequence_BrainFallsToGround       ;A9B127;
    STA.W $0FA8                                                          ;A9B12A; fallthrough to Function_MBBody_Phase3_DeathSequence_BrainFallsToGround

Function_MBBody_Phase3_DeathSequence_BrainFallsToGround:
    LDA.W $0FB2                                                          ;A9B12D;
    CLC                                                                  ;A9B130;
    ADC.W #$0020                                                         ;A9B131;
    STA.W $0FB2                                                          ;A9B134;
    XBA                                                                  ;A9B137;
    AND.W #$00FF                                                         ;A9B138;
    CLC                                                                  ;A9B13B;
    ADC.W $0FBE                                                          ;A9B13C;
    CMP.W #$00C4                                                         ;A9B13F;
    BCC .hitGround                                                       ;A9B142;
    LDA.W #$0002                                                         ;A9B144;
    JSL.L EnableEarthquakeTypeInAFor20Frames                             ;A9B147;
    LDA.W #Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles          ;A9B14B;
    STA.W $0FA8                                                          ;A9B14E;
    LDA.W #$0100                                                         ;A9B151;
    STA.W $0FB2                                                          ;A9B154;
    LDA.W #$00C4                                                         ;A9B157;

.hitGround:
    STA.W $0FBE                                                          ;A9B15A;
    RTS                                                                  ;A9B15D;


Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_corpse              ;A9B15E;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9B161;
    BCC Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles_return      ;A9B164;
    LDA.W #Function_MBBody_Phase3_DeathSequence_SetupFadeToGrey          ;A9B166;
    STA.W $0FA8                                                          ;A9B169;
    LDA.W #$0020                                                         ;A9B16C;
    STA.W $0FB2                                                          ;A9B16F;

Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles_return:
    RTS                                                                  ;A9B172;


Function_MBBody_Phase3_DeathSequence_SetupFadeToGrey:
    DEC.W $0FB2                                                          ;A9B173;
    BPL Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles_return      ;A9B176;
    LDA.W #$0000                                                         ;A9B178;
    STA.L $7E802E                                                        ;A9B17B;
    LDA.W #Function_MBBody_Phase3_DeathSequence_FadeToGrey               ;A9B17F;
    STA.W $0FA8                                                          ;A9B182;
    STZ.W $0FB2                                                          ;A9B185;
    RTS                                                                  ;A9B188;


Function_MBBody_Phase3_DeathSequence_FadeToGrey:
    DEC.W $0FB2                                                          ;A9B189;
    BPL .return                                                          ;A9B18C;
    LDA.L $7E802E                                                        ;A9B18E;
    INC A                                                                ;A9B192;
    STA.L $7E802E                                                        ;A9B193;
    DEC A                                                                ;A9B197;
    JSL.L TransitionMotherBrainPaletteToGrey_RealDeath                   ;A9B198;
    BCS .finishedTransition                                              ;A9B19C;
    LDA.W #$0010                                                         ;A9B19E;
    STA.W $0FB2                                                          ;A9B1A1;

.return:
    RTS                                                                  ;A9B1A4;


.finishedTransition:
    LDA.W #InstList_MotherBrainHead_Corpse_0                             ;A9B1A5;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B1A8;
    LDA.W #Function_MBBody_Phase3_DeathSequence_CorpseTipsOver           ;A9B1AB;
    STA.W $0FA8                                                          ;A9B1AE;
    LDA.W #$0100                                                         ;A9B1B1;
    STA.W $0FB2                                                          ;A9B1B4;
    RTS                                                                  ;A9B1B7;


Function_MBBody_Phase3_DeathSequence_CorpseTipsOver:
    DEC.W $0FB2                                                          ;A9B1B8;
    BMI .timerExpired                                                    ;A9B1BB;
    RTS                                                                  ;A9B1BD;


.timerExpired:
    LDA.W #Function_MBBody_Phase3_DeathSequence_CorpseRotsAway           ;A9B1BE;
    STA.W $0FA8                                                          ;A9B1C1;
    LDA.W $0FC6                                                          ;A9B1C4;
    ORA.W #$0400                                                         ;A9B1C7;
    STA.W $0FC6                                                          ;A9B1CA;
    LDA.W #$0000                                                         ;A9B1CD;
    STA.L $7E7808                                                        ;A9B1D0;
    RTS                                                                  ;A9B1D4;


Function_MBBody_Phase3_DeathSequence_CorpseRotsAway:
    LDX.W #$0040                                                         ;A9B1D5;
    JSR.W ProcessCorpseRotting                                           ;A9B1D8;
    BCC .finishedRotting                                                 ;A9B1DB;
    LDX.W #$0040                                                         ;A9B1DD;
    LDA.L $7E8826,X                                                      ;A9B1E0;
    TAX                                                                  ;A9B1E4;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9B1E5;


.finishedRotting:
    LDA.W $0FC6                                                          ;A9B1E8;
    ORA.W #$0100                                                         ;A9B1EB;
    AND.W #$DFFF                                                         ;A9B1EE;
    STA.W $0FC6                                                          ;A9B1F1;
    STZ.W $0FC8                                                          ;A9B1F4;
    LDA.W #$0000                                                         ;A9B1F7;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9B1FA;
    LDA.W #$FF24                                                         ;A9B1FE;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9B201;
    LDA.W #Function_MBBody_Phase3_DeathSequence_20FrameDelay             ;A9B205;
    STA.W $0FA8                                                          ;A9B208;
    LDA.W #$0014                                                         ;A9B20B;
    STA.W $0FB2                                                          ;A9B20E; fallthrough to Function_MBBody_Phase3_DeathSequence_20FrameDelay

Function_MBBody_Phase3_DeathSequence_20FrameDelay:
    DEC.W $0FB2                                                          ;A9B211;
    BPL .return                                                          ;A9B214;
    STZ.W $0FBA                                                          ;A9B216;
    STZ.W $0FBE                                                          ;A9B219;
    LDA.W #Function_MBBody_Phase3_DeathSequence_LoadEscapeTimerTiles     ;A9B21C;
    STA.W $0FA8                                                          ;A9B21F;

.return:
    RTS                                                                  ;A9B222;


CorpseRottingRotEntryFinishedHook_MotherBrain:
    PHX                                                                  ;A9B223;
    LDA.W $05E5                                                          ;A9B224;
    AND.W #$001F                                                         ;A9B227;
    CLC                                                                  ;A9B22A;
    ADC.W $0FBA                                                          ;A9B22B;
    CLC                                                                  ;A9B22E;
    ADC.W #$FFF0                                                         ;A9B22F;
    STA.B $12                                                            ;A9B232;
    LDA.W $0FBE                                                          ;A9B234;
    CLC                                                                  ;A9B237;
    ADC.W #$0010                                                         ;A9B238;
    STA.B $14                                                            ;A9B23B;
    LDA.W #$000A                                                         ;A9B23D;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9B240;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B243;
    LDA.W $0E44                                                          ;A9B247;
    AND.W #$0007                                                         ;A9B24A;
    BNE .return                                                          ;A9B24D;
    LDA.W #$0010                                                         ;A9B24F;
    JSL.L QueueSound_Lib2_Max3                                           ;A9B252;

.return:
    PLX                                                                  ;A9B256;
    RTS                                                                  ;A9B257;


Function_MBBody_Phase3_DeathSequence_LoadEscapeTimerTiles:
    PHB                                                                  ;A9B258;
    PEA.W $A600                                                          ;A9B259;
    PLB                                                                  ;A9B25C;
    PLB                                                                  ;A9B25D;
    LDX.W #ZebesEscapeTimerSpriteTileTransferEntries_size                ;A9B25E;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9B261;
    PLB                                                                  ;A9B264;
    BCC Function_MBBody_Phase3_DeathSequence_StartEscape_return          ;A9B265;
    LDA.W #Function_MBBody_Phase3_DeathSequence_StartEscape              ;A9B267;
    STA.W $0FA8                                                          ;A9B26A; fallthrough to Function_MBBody_Phase3_DeathSequence_StartEscapeSequence

Function_MBBody_Phase3_DeathSequence_StartEscape:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_explodedDoor        ;A9B26D;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9B270;
    BCC Function_MBBody_Phase3_DeathSequence_StartEscape_return          ;A9B273;
    LDY.W #Palette_MotherBrain_ExplodedDoor+2                            ;A9B275;
    LDX.W #$0122                                                         ;A9B278;
    LDA.W #$000E                                                         ;A9B27B;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9B27E;
    LDA.W #$0007                                                         ;A9B282;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9B285;
    LDA.W #$0005                                                         ;A9B289;
    STA.W $183E                                                          ;A9B28C;
    LDA.W #$FFFF                                                         ;A9B28F;
    STA.W $1840                                                          ;A9B292;
    LDY.W #PaletteFXObjects_Tourian8_ShutterRedFlashing                  ;A9B295;
    JSL.L Spawn_PaletteFXObject                                          ;A9B298;
    LDY.W #PaletteFXObjects_Tourian10_BackgroundRedFlashing              ;A9B29C;
    JSL.L Spawn_PaletteFXObject                                          ;A9B29F;
    LDY.W #PaletteFXObjects_Tourian20_GeneralLevelRedFlashing            ;A9B2A3;
    JSL.L Spawn_PaletteFXObject                                          ;A9B2A6;
    LDY.W #PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs   ;A9B2AA;
    JSL.L Spawn_PaletteFXObject                                          ;A9B2AD;
    LDA.W #$0000                                                         ;A9B2B1;
    STA.L $7E7844                                                        ;A9B2B4;
    JSL.L SetupZebesEscapeTypewriter                                     ;A9B2B8;
    LDA.W #$0020                                                         ;A9B2BC;
    STA.W $0FB2                                                          ;A9B2BF;
    LDY.W #Function_MBBody_Phase3_DeathSequence_SpawnTimeBombSetJapanText ;A9B2C2;
    LDA.W $09E2                                                          ;A9B2C5;
    BNE .keepJapanText                                                   ;A9B2C8;
    LDY.W #Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText   ;A9B2CA;

.keepJapanText:
    STY.W $0FA8                                                          ;A9B2CD;

Function_MBBody_Phase3_DeathSequence_StartEscape_return:
    RTS                                                                  ;A9B2D0;


Function_MBBody_Phase3_DeathSequence_SpawnTimeBombSetJapanText:
    DEC.W $0FB2                                                          ;A9B2D1;
    BPL Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText      ;A9B2D4;
    LDA.W #Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText   ;A9B2D6;
    STA.W $0FA8                                                          ;A9B2D9;
    LDY.W #EnemyProjectile_TimeBombSetJapanText                          ;A9B2DC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B2DF; fallthrough to Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText

Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText:
    LDA.W #$2610                                                         ;A9B2E3;
    JSL.L HandleTypewriterText_External                                  ;A9B2E6;
    BCC .return                                                          ;A9B2EA;
    LDA.W #Function_MBBody_Phase3_DeathSequence_DoorExploding_StartTimer ;A9B2EC;
    STA.W $0FA8                                                          ;A9B2EF;
    LDA.W #$0020                                                         ;A9B2F2;
    STA.W $0FB2                                                          ;A9B2F5;

.return:
    RTS                                                                  ;A9B2F8;


Function_MBBody_Phase3_DeathSequence_DoorExploding_StartTimer:
    JSL.L GenerateEscapeDoorExplosion                                    ;A9B2F9;
    DEC.W $0FB2                                                          ;A9B2FD;
    BPL .return                                                          ;A9B300;
    LDA.W #$000F                                                         ;A9B302;
    JSL.L Run_Samus_Command                                              ;A9B305;
    LDA.W #$0002                                                         ;A9B309;
    STA.W $0943                                                          ;A9B30C;
    JSL.L SetBossBitsInAForCurrentArea                                   ;A9B30F;
    LDA.W #$000E                                                         ;A9B313;
    JSL.L MarkEvent_inA                                                  ;A9B316;
    LDA.W #Function_MBBody_Phase3_DeathSequence_BlowUpEscapeDoor         ;A9B31A;
    STA.W $0FA8                                                          ;A9B31D;
    LDA.W #$0000                                                         ;A9B320;
    STA.W $0FF0                                                          ;A9B323;
    STA.W $0FF2                                                          ;A9B326;

.return:
    RTS                                                                  ;A9B329;


Function_MBBody_Phase3_DeathSequence_BlowUpEscapeDoor:
    JSR.W ExplodeMotherBrainEscapeDoor                                   ;A9B32A;
    LDA.W #Function_MBBody_Phase3_DeathSequence_KeepEarthquakeGoing      ;A9B32D;
    STA.W $0FA8                                                          ;A9B330;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9B333;
    db $00,$06                                                           ;A9B337;
    dw PLMEntries_motherBrainsRoomEscapeDoor                             ;A9B339;
    RTS                                                                  ;A9B33B;


Function_MBBody_Phase3_DeathSequence_KeepEarthquakeGoing:
    LDA.W $1840                                                          ;A9B33C;
    BNE .return                                                          ;A9B33F;
    DEC A                                                                ;A9B341;
    STA.W $1840                                                          ;A9B342;

.return:
    RTS                                                                  ;A9B345;


GenerateEscapeDoorExplosion:
    LDA.W $0FF0                                                          ;A9B346;
    DEC A                                                                ;A9B349;
    STA.W $0FF0                                                          ;A9B34A;
    BPL .return                                                          ;A9B34D;
    LDA.W #$0004                                                         ;A9B34F;
    STA.W $0FF0                                                          ;A9B352;
    LDA.W $0FF2                                                          ;A9B355;
    DEC A                                                                ;A9B358;
    STA.W $0FF2                                                          ;A9B359;
    BPL .max3                                                            ;A9B35C;
    LDA.W #$0003                                                         ;A9B35E;
    STA.W $0FF2                                                          ;A9B361;

.max3:
    LDA.W $0FF2                                                          ;A9B364;
    ASL A                                                                ;A9B367;
    ASL A                                                                ;A9B368;
    TAY                                                                  ;A9B369;
    LDA.W .data0,Y                                                       ;A9B36A;
    STA.B $12                                                            ;A9B36D;
    LDA.W .data1,Y                                                       ;A9B36F;
    STA.B $14                                                            ;A9B372;
    LDY.W #$0003                                                         ;A9B374;
    JSL.L GenerateRandomNumber                                           ;A9B377;
    CMP.W #$4000                                                         ;A9B37B;
    BCS .keepExplosion                                                   ;A9B37E;
    LDY.W #$000C                                                         ;A9B380;

.keepExplosion:
    TYA                                                                  ;A9B383;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9B384;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B387;
    LDA.W #$0024                                                         ;A9B38B;
    JSL.L QueueSound_Lib2_Max3                                           ;A9B38E;

.return:
    RTL                                                                  ;A9B392;


.data0:
    dw $0008                                                             ;A9B393;

.data1:
    dw $006C,$0018,$0080,$0009,$0090,$0018,$0074                         ;A9B395;

ExplodeMotherBrainEscapeDoor:
    LDA.W #$0000                                                         ;A9B3A3;

.loop:
    PHA                                                                  ;A9B3A6;
    LDY.W #EnemyProjectile_MotherBrainExplodedEscapeDoorParticles        ;A9B3A7;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9B3AA;
    PLA                                                                  ;A9B3AE;
    INC A                                                                ;A9B3AF;
    CMP.W #$0008                                                         ;A9B3B0;
    BCC .loop                                                            ;A9B3B3;
    RTS                                                                  ;A9B3B5;


MotherBrain_vs_Samus_CollisionDetection:
    LDA.L $7E7808                                                        ;A9B3B6;
    STA.B $1A                                                            ;A9B3BA;
    LSR.B $1A                                                            ;A9B3BC;
    BCC .checkBrain                                                      ;A9B3BE;
    LDA.W $0F7A                                                          ;A9B3C0;
    STA.B $12                                                            ;A9B3C3;
    LDA.W $0F7E                                                          ;A9B3C5;
    STA.B $14                                                            ;A9B3C8;
    LDX.W #HitboxDefinitions_MotherBrainBody                             ;A9B3CA;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B3CD;
    BCS .return                                                          ;A9B3D0;

.checkBrain:
    LSR.B $1A                                                            ;A9B3D2;
    BCC .checkNeck                                                       ;A9B3D4;
    LDA.W $0FBA                                                          ;A9B3D6;
    STA.B $12                                                            ;A9B3D9;
    LDA.W $0FBE                                                          ;A9B3DB;
    STA.B $14                                                            ;A9B3DE;
    LDX.W #HitboxDefinitions_MotherBrainHead                             ;A9B3E0;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B3E3;
    BCS .return                                                          ;A9B3E6;

.checkNeck:
    LSR.B $1A                                                            ;A9B3E8;
    BCC .return                                                          ;A9B3EA;
    LDA.L $7E804A                                                        ;A9B3EC;
    STA.B $12                                                            ;A9B3F0;
    LDA.L $7E804C                                                        ;A9B3F2;
    STA.B $14                                                            ;A9B3F6;
    LDX.W #HitboxDefinitions_MotherBrainNeck                             ;A9B3F8;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B3FB;
    BCS .return                                                          ;A9B3FE;
    LDA.L $7E8050                                                        ;A9B400;
    STA.B $12                                                            ;A9B404;
    LDA.L $7E8052                                                        ;A9B406;
    STA.B $14                                                            ;A9B40A;
    LDX.W #HitboxDefinitions_MotherBrainNeck                             ;A9B40C;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B40F;
    BCS .return                                                          ;A9B412;
    LDA.L $7E8056                                                        ;A9B414;
    STA.B $12                                                            ;A9B418;
    LDA.L $7E8058                                                        ;A9B41A;
    STA.B $14                                                            ;A9B41E;
    LDX.W #HitboxDefinitions_MotherBrainNeck                             ;A9B420;
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection                    ;A9B423;

.return:
    RTS                                                                  ;A9B426;


HitboxDefinitions_MotherBrainBody:
    dw $0002,$FFE0,$FFE8,$002A,$0038,$FFE8,$FFD6,$001C                   ;A9B427;
    dw $FFE7                                                             ;A9B437;

HitboxDefinitions_MotherBrainHead:
    dw $0002,$FFE8,$FFEA,$0016,$0000,$FFEA,$0001,$0010                   ;A9B439;
    dw $0014                                                             ;A9B449;

HitboxDefinitions_MotherBrainNeck:
    dw $0001,$FFF8,$FFF8,$0008,$0008                                     ;A9B44B;

MotherBrainPart_vs_Samus_CollisionDetection:
    LDA.W $0000,X                                                        ;A9B455;
    BEQ .returnNoCollision                                               ;A9B458;
    STA.B $16                                                            ;A9B45A;
    INX                                                                  ;A9B45C;
    INX                                                                  ;A9B45D;

.loop:
    LDA.W $0AFA                                                          ;A9B45E;
    SEC                                                                  ;A9B461;
    SBC.B $14                                                            ;A9B462;
    BPL .SamusBelowHitbox                                                ;A9B464;
    EOR.W #$FFFF                                                         ;A9B466;
    INC A                                                                ;A9B469;
    STA.B $18                                                            ;A9B46A;
    LDA.W $0002,X                                                        ;A9B46C;
    BRA +                                                                ;A9B46F;


.SamusBelowHitbox:
    STA.B $18                                                            ;A9B471;
    LDA.W $0006,X                                                        ;A9B473;

  + BPL +                                                                ;A9B476;
    EOR.W #$FFFF                                                         ;A9B478;
    INC A                                                                ;A9B47B;

  + CLC                                                                  ;A9B47C;
    ADC.W $0B00                                                          ;A9B47D;
    SEC                                                                  ;A9B480;
    SBC.B $18                                                            ;A9B481;
    BMI .next                                                            ;A9B483;
    LDA.W $0AF6                                                          ;A9B485;
    SEC                                                                  ;A9B488;
    SBC.B $12                                                            ;A9B489;
    BPL .SamusRightOfHitbox                                              ;A9B48B;
    EOR.W #$FFFF                                                         ;A9B48D;
    INC A                                                                ;A9B490;
    STA.B $18                                                            ;A9B491;
    LDA.W $0000,X                                                        ;A9B493;
    BRA +                                                                ;A9B496;


.SamusRightOfHitbox:
    STA.B $18                                                            ;A9B498;
    LDA.W $0004,X                                                        ;A9B49A;

  + BPL +                                                                ;A9B49D;
    EOR.W #$FFFF                                                         ;A9B49F;
    INC A                                                                ;A9B4A2;

  + CLC                                                                  ;A9B4A3;
    ADC.W $0AFE                                                          ;A9B4A4;
    SEC                                                                  ;A9B4A7;
    SBC.B $18                                                            ;A9B4A8;
    BPL .hit                                                             ;A9B4AA;

.next:
    DEC.B $16                                                            ;A9B4AC;
    BEQ .returnNoCollision                                               ;A9B4AE;
    TXA                                                                  ;A9B4B0;
    CLC                                                                  ;A9B4B1;
    ADC.W #$0008                                                         ;A9B4B2;
    TAX                                                                  ;A9B4B5;
    JMP.W .loop                                                          ;A9B4B6;


.returnNoCollision:
    CLC                                                                  ;A9B4B9;
    RTS                                                                  ;A9B4BA;


.hit:
    CMP.W #$0004                                                         ;A9B4BB;
    BPL .min4                                                            ;A9B4BE;
    LDA.W #$0004                                                         ;A9B4C0;

.min4:
    STA.W $0B58                                                          ;A9B4C3;
    LDA.W #$0004                                                         ;A9B4C6;
    STA.W $0B5C                                                          ;A9B4C9;
    STZ.W $0B56                                                          ;A9B4CC;
    STZ.W $0B5A                                                          ;A9B4CF;
    LDA.W #$0060                                                         ;A9B4D2;
    STA.W $18A8                                                          ;A9B4D5;
    LDA.W #$0005                                                         ;A9B4D8;
    STA.W $18AA                                                          ;A9B4DB;
    LDA.W #$0001                                                         ;A9B4DE;
    STA.W $0A54                                                          ;A9B4E1;
    LDA.W $0AFA                                                          ;A9B4E4;
    CMP.W #$00C0                                                         ;A9B4E7;
    BPL .SamusInAir                                                      ;A9B4EA;
    LDA.W #$0002                                                         ;A9B4EC;
    STA.W $0B36                                                          ;A9B4EF;

.SamusInAir:
    LDA.W $0F7A                                                          ;A9B4F2;
    CLC                                                                  ;A9B4F5;
    ADC.W #$0018                                                         ;A9B4F6;
    CMP.W $0AF6                                                          ;A9B4F9;
    BPL .returnCollision                                                 ;A9B4FC;
    JSR.W HurtSamus_A9B5E1                                               ;A9B4FE;

.returnCollision:
    SEC                                                                  ;A9B501;
    RTS                                                                  ;A9B502;


EnemyShot_MotherBrainBody:
    JML.L CreateADudShot                                                 ;A9B503;


EnemyShot_MotherBrainHead:
    LDA.L $7E7800                                                        ;A9B507;
    BNE .notFirstPhase                                                   ;A9B50B;
    LDA.W $18A6                                                          ;A9B50D;
    ASL A                                                                ;A9B510;
    TAY                                                                  ;A9B511;
    LDA.W $0C19,Y                                                        ;A9B512;
    AND.W #$0007                                                         ;A9B515;
    TAY                                                                  ;A9B518;
    LDA.W .projectileType,Y                                              ;A9B519;
    AND.W #$00FF                                                         ;A9B51C;
    BEQ .return                                                          ;A9B51F;
    LDX.W #$004E                                                         ;A9B521;
    CLC                                                                  ;A9B524;
    ADC.W $1DC7,X                                                        ;A9B525;
    STA.W $1DC7,X                                                        ;A9B528;
    LDA.W #$006E                                                         ;A9B52B;
    JSL.L QueueSound_Lib2_Max6                                           ;A9B52E;
    LDY.W #$000D                                                         ;A9B532;
    LDA.W $0FDC                                                          ;A9B535;
    BEQ +                                                                ;A9B538;
    LSR A                                                                ;A9B53A;
    BCC +                                                                ;A9B53B;
    INY                                                                  ;A9B53D;

  + STY.W $0FDC                                                          ;A9B53E;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A9B541;

.return:
    RTL                                                                  ;A9B545;


.projectileType:
    db $00,$01,$01,$00,$00,$00,$00,$00                                   ;A9B546;

.notFirstPhase:
    JSR.W MotherBrainShotReaction_Phase2_3                               ;A9B54E;
    LDA.L $7E7800                                                        ;A9B551;
    CMP.W #$0001                                                         ;A9B555;
    BNE .gotoNormalShotAI                                                ;A9B558;
    JML.L CreateADudShot                                                 ;A9B55A;


.gotoNormalShotAI:
    JML.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A9B55E;


MotherBrainShotReaction_Phase2_3:
    LDA.L $7E7800                                                        ;A9B562;
    CMP.W #$0004                                                         ;A9B566;
    BNE .notBeam                                                         ;A9B569;
    JSR.W DetermineMotherBrainShotReactionType                           ;A9B56B;
    CMP.W #$0002                                                         ;A9B56E;
    BNE .notBeam                                                         ;A9B571;
    JMP.W MotherBrainBeamShotReaction_Phase3                             ;A9B573;


.notBeam:
    JSR.W DetermineMotherBrainShotReactionType                           ;A9B576;
    DEC A                                                                ;A9B579;
    BEQ .superMissile                                                    ;A9B57A;
    LDA.L $7E780E                                                        ;A9B57C;
    SEC                                                                  ;A9B580;
    SBC.W #$0100                                                         ;A9B581;
    BPL .done                                                            ;A9B584;

.superMissile:
    LDA.W #$0000                                                         ;A9B586;

.done:
    STA.L $7E780E                                                        ;A9B589;
    RTS                                                                  ;A9B58D;


DetermineMotherBrainShotReactionType:
    LDA.W $18A6                                                          ;A9B58E;
    ASL A                                                                ;A9B591;
    TAY                                                                  ;A9B592;
    LDA.W $0C19,Y                                                        ;A9B593;
    AND.W #$0007                                                         ;A9B596;
    TAY                                                                  ;A9B599;
    LDA.W .projectileTypes,Y                                             ;A9B59A;
    AND.W #$00FF                                                         ;A9B59D;
    RTS                                                                  ;A9B5A0;


.projectileTypes:
    db $02,$01,$01,$00,$00,$00,$00,$00                                   ;A9B5A1;

MotherBrainBeamShotReaction_Phase3:
    LDA.L $7E780E                                                        ;A9B5A9;
    SEC                                                                  ;A9B5AD;
    SBC.W #$010A                                                         ;A9B5AE;
    BPL .maxCounter                                                      ;A9B5B1;
    LDA.W #Function_MotherBrainNeck_SetupHyperBeamRecoil                 ;A9B5B3;
    STA.L $7E7870                                                        ;A9B5B6;
    LDA.W #$0000                                                         ;A9B5BA;
    STA.W $0FB2                                                          ;A9B5BD;

.maxCounter:
    STA.L $7E780E                                                        ;A9B5C0;
    RTS                                                                  ;A9B5C4;


RTL_A9B5C5:
    RTL                                                                  ;A9B5C5;


EnemyTouch_MotherBrainHead:
    LDA.W $0A1F                                                          ;A9B5C6;
    AND.W #$00FF                                                         ;A9B5C9;
    CMP.W #$0003                                                         ;A9B5CC;
    BNE .return                                                          ;A9B5CF;
    LDY.W #$000D                                                         ;A9B5D1;
    LDA.W $0FDC                                                          ;A9B5D4;
    BEQ +                                                                ;A9B5D7;
    LSR A                                                                ;A9B5D9;
    BCC +                                                                ;A9B5DA;
    INY                                                                  ;A9B5DC;

  + STY.W $0FDC                                                          ;A9B5DD;

.return:
    RTL                                                                  ;A9B5E0;


HurtSamus_A9B5E1:
    JSL.L DealSuitAdjustedEnemyDamageToSamus                             ;A9B5E1;
    LDA.W #$0060                                                         ;A9B5E5;
    STA.W $18A8                                                          ;A9B5E8;
    LDA.W #$0005                                                         ;A9B5EB;
    STA.W $18AA                                                          ;A9B5EE;
    LDY.W #$0000                                                         ;A9B5F1;
    LDX.W $0E54                                                          ;A9B5F4;
    LDA.W $0AF6                                                          ;A9B5F7;
    SEC                                                                  ;A9B5FA;
    SBC.W $0F7A,X                                                        ;A9B5FB;
    BMI .left                                                            ;A9B5FE;
    INY                                                                  ;A9B600;

.left:
    STY.W $0A54                                                          ;A9B601;
    RTS                                                                  ;A9B604;


Function_MotherBrainBody_Phase2_Thinking:
    LDA.W $0FCC                                                          ;A9B605;
    BNE .notDead                                                         ;A9B608;
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck  ;A9B60A;
    STA.W $0FA8                                                          ;A9B60D;
    JMP.W Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck   ;A9B610;


.notDead:
    LDA.L $7E7804                                                        ;A9B613;
    BEQ .standing                                                        ;A9B617;
    RTS                                                                  ;A9B619;


.standing:
    LDA.W $0FCC                                                          ;A9B61A;
    CMP.W #$1194                                                         ;A9B61D;
    BMI .lowHealth                                                       ;A9B620;
    LDA.W $05E5                                                          ;A9B622;
    CMP.W #$1000                                                         ;A9B625;
    BCC .tryAttack                                                       ;A9B628;
    JMP.W HandleMotherBrainWalking                                       ;A9B62A;


.tryAttack:
    LDA.W #Function_MotherBrainBody_Phase2_TryAttack                     ;A9B62D;
    STA.W $0FA8                                                          ;A9B630;
    RTS                                                                  ;A9B633;


.lowHealth:
    LDA.W $05E5                                                          ;A9B634;
    CMP.W #$2000                                                         ;A9B637;
    BCS +                                                                ;A9B63A;
    JMP.W HandleMotherBrainWalking                                       ;A9B63C;


  + CMP.W #$A000                                                         ;A9B63F;
    BCS .tryAttack                                                       ;A9B642;
    LDA.W #Function_MotherBrainBody_Phase2_FiringDeathBeam               ;A9B644;
    STA.W $0FA8                                                          ;A9B647;
    RTS                                                                  ;A9B64A;


Function_MotherBrainBody_Phase2_TryAttack:
    LDA.L $7E7830                                                        ;A9B64B;
    ASL A                                                                ;A9B64F;
    TAX                                                                  ;A9B650;
    JMP.W (.pointers,X)                                                  ;A9B651;


.pointers:
    dw TryMotherBrainAttack_Phase2_TryAttack                             ;A9B654;
    dw TryMotherBrainPhase2Attack_Cooldown                               ;A9B656;
    dw TryMotherBrainPhase2Attack_EndAttack                              ;A9B658;

TryMotherBrainAttack_Phase2_TryAttack:
    LDA.W #$0040                                                         ;A9B65A;
    STA.W $0FB4                                                          ;A9B65D;
    LDA.L $7E7830                                                        ;A9B660;
    INC A                                                                ;A9B664;
    STA.L $7E7830                                                        ;A9B665;
    JSR.W DecideMotherBrainPhase2AttackStrategy                          ;A9B669;
    LDX.W #.default                                                      ;A9B66C;
    LDA.W $0FBE                                                          ;A9B66F;
    CLC                                                                  ;A9B672;
    ADC.W #$0004                                                         ;A9B673;
    SEC                                                                  ;A9B676;
    SBC.W $0AFA                                                          ;A9B677;
    BPL +                                                                ;A9B67A;
    EOR.W #$FFFF                                                         ;A9B67C;
    INC A                                                                ;A9B67F;

  + CMP.W #$0020                                                         ;A9B680;
    BCS .SamusFar                                                        ;A9B683;
    LDX.W #.SamusClose                                                   ;A9B685;

.SamusFar:
    SEP #$20                                                             ;A9B688;
    LDY.W #$0000                                                         ;A9B68A;
    LDA.W $05E5                                                          ;A9B68D;
    CMP.W $0000,X                                                        ;A9B690;
    BCC +                                                                ;A9B693;
    INY                                                                  ;A9B695;
    INY                                                                  ;A9B696;
    CMP.W $0001,X                                                        ;A9B697;
    BCC +                                                                ;A9B69A;
    INY                                                                  ;A9B69C;
    INY                                                                  ;A9B69D;
    CMP.W $0002,X                                                        ;A9B69E;
    BCC +                                                                ;A9B6A1;
    INY                                                                  ;A9B6A3;
    INY                                                                  ;A9B6A4;

  + TYX                                                                  ;A9B6A5;
    REP #$20                                                             ;A9B6A6;
    LDA.W .instListPointers,X                                            ;A9B6A8;
    CMP.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2                ;A9B6AB;
    BEQ .bomb                                                            ;A9B6AE;
    CMP.W #InstList_MotherBrainHead_Attacking_Laser                      ;A9B6B0;
    BEQ .laser                                                           ;A9B6B3;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B6B5;

.return:
    RTS                                                                  ;A9B6B8;


.bomb:
    LDA.L $7E784A                                                        ;A9B6B9;
    CMP.W #$0001                                                         ;A9B6BD;
    BPL .return                                                          ;A9B6C0;
    LDA.W #Function_MotherBrainBody_FiringBomb_DecideOnWalking           ;A9B6C2;
    STA.W $0FA8                                                          ;A9B6C5;
    JMP.W Function_MotherBrainBody_FiringBomb_DecideOnWalking            ;A9B6C8;


.laser:
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly        ;A9B6CB;
    STA.W $0FA8                                                          ;A9B6CE;
    JMP.W Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly         ;A9B6D1;


.instListPointers:
    dw InstList_MotherBrainHead_Neutral_Phase2_0                         ;A9B6D4;
    dw InstList_MotherBrainHead_Attacking_4OnionRings_Phase2             ;A9B6D6;
    dw InstList_MotherBrainHead_Attacking_Laser                          ;A9B6D8;
    dw InstList_MotherBrainHead_Attacking_Bomb_Phase2                    ;A9B6DA;

.default:
    db $40,$80,$C0                                                       ;A9B6DC;

.SamusClose:
    db $10,$20,$D0                                                       ;A9B6DF;

DecideMotherBrainPhase2AttackStrategy:
    LDA.W $0A1F                                                          ;A9B6E2;
    AND.W #$00FF                                                         ;A9B6E5;
    ASL A                                                                ;A9B6E8;
    TAX                                                                  ;A9B6E9;
    LDA.W .poses,X                                                       ;A9B6EA;
    BNE .aimAtGround                                                     ;A9B6ED;
    LDA.W $05E5                                                          ;A9B6EF;
    AND.W #$00FF                                                         ;A9B6F2;
    CMP.W #$0080                                                         ;A9B6F5;
    BMI .callersReturn                                                   ;A9B6F8;
    LDA.W #InstList_MotherBrainHead_Attacking_4OnionRings_Phase2         ;A9B6FA;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B6FD;
    PLA                                                                  ;A9B700;
    RTS                                                                  ;A9B701;


.callersReturn:
    PLA                                                                  ;A9B702;
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly        ;A9B703;
    STA.W $0FA8                                                          ;A9B706;
    JMP.W Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly         ;A9B709;


.aimAtGround:
    LDA.W $05E5                                                          ;A9B70C;
    AND.W #$00FF                                                         ;A9B70F;
    CMP.W #$0080                                                         ;A9B712;
    BPL +                                                                ;A9B715;
    RTS                                                                  ;A9B717;


  + LDA.L $7E784A                                                        ;A9B718;
    CMP.W #$0001                                                         ;A9B71C;
    BPL .return                                                          ;A9B71F;
    LDA.W #Function_MotherBrainBody_FiringBomb_DecideOnWalking           ;A9B721;
    STA.W $0FA8                                                          ;A9B724;
    PLA                                                                  ;A9B727;
    JMP.W Function_MotherBrainBody_FiringBomb_DecideOnWalking            ;A9B728;


.return:
    RTS                                                                  ;A9B72B;


.poses:
    dw $FFFF,$FFEF,$0000,$0000,$FFFF,$FFFF,$0000,$FFFF                   ;A9B72C;
    dw $0000,$0000,$FFFF,$0000,$0000,$0000,$FFEF,$FFFF                   ;A9B73C;
    dw $FFFF,$FFFF,$0000,$0000,$0000,$FFEF,$FFFF,$FFFF                   ;A9B74C;
    dw $FFFF,$FFFF,$FFFF,$FFFF                                           ;A9B75C;

TryMotherBrainPhase2Attack_Cooldown:
    DEC.W $0FB4                                                          ;A9B764;
    BNE .return                                                          ;A9B767;
    LDA.L $7E7830                                                        ;A9B769;
    INC A                                                                ;A9B76D;
    STA.L $7E7830                                                        ;A9B76E;

.return:
    RTS                                                                  ;A9B772;


TryMotherBrainPhase2Attack_EndAttack:
    LDA.W #$0000                                                         ;A9B773;
    STA.L $7E7830                                                        ;A9B776;
    LDA.W #Function_MotherBrainBody_Phase2_Thinking                      ;A9B77A;
    STA.W $0FA8                                                          ;A9B77D;
    RTS                                                                  ;A9B780;


Function_MotherBrainBody_FiringBomb_DecideOnWalking:
    LDA.W $05E5                                                          ;A9B781;
    CMP.W #$FF80                                                         ;A9B784;
    BCS MotherBrainFiringBomb_DecideOnCrouching                          ;A9B787;
    LDX.W #$0040                                                         ;A9B789;
    CMP.W #$6000                                                         ;A9B78C;
    BCS +                                                                ;A9B78F;
    LDX.W #$0060                                                         ;A9B791;

  + TXA                                                                  ;A9B794;
    CMP.W $0F7A                                                          ;A9B795;
    BPL MotherBrainFiringBomb_DecideOnCrouching                          ;A9B798;
    STA.W $0FB2                                                          ;A9B79A;
    LDY.W #$0006                                                         ;A9B79D;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9B7A0;
    BCS MotherBrainFiringBomb_DecideOnCrouching                          ;A9B7A3;
    LDA.W #Function_MotherBrainBody_FiringBomb_WalkingBackwards          ;A9B7A5;
    STA.W $0FA8                                                          ;A9B7A8;

Function_MotherBrainBody_FiringBomb_DecideOnWalking_return:
    RTS                                                                  ;A9B7AB;


Function_MotherBrainBody_FiringBomb_WalkingBackwards:
    LDY.W #$0006                                                         ;A9B7AC;
    LDA.W $0FB2                                                          ;A9B7AF;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9B7B2;
    BCC Function_MotherBrainBody_FiringBomb_DecideOnWalking_return       ;A9B7B5;

MotherBrainFiringBomb_DecideOnCrouching:
    JSL.L GenerateRandomNumber                                           ;A9B7B7;
    CMP.W #$8000                                                         ;A9B7BB;
    BCC MotherBrainFiringBomb_FireBomb                                   ;A9B7BE;
    LDA.W #Function_MotherBrainBody_FiringBomb_Crouch                    ;A9B7C0;
    STA.W $0FA8                                                          ;A9B7C3;

Function_MotherBrainBody_FiringBomb_Crouch:
    JSR.W MakeMotherBrainCrouch                                          ;A9B7C6;
    BCC Function_MotherBrainBody_FiringBomb_DecideOnWalking_return       ;A9B7C9;

MotherBrainFiringBomb_FireBomb:
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2                ;A9B7CB;
    LDA.L $7E783E                                                        ;A9B7CE;
    BEQ .notCorpse                                                       ;A9B7D2;
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase3                ;A9B7D4;

.notCorpse:
    TYA                                                                  ;A9B7D7;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B7D8;
    LDA.W #Function_MotherBrainBody_FiringBomb_FiredBomb                 ;A9B7DB;
    STA.W $0FA8                                                          ;A9B7DE;
    LDA.W #$002C                                                         ;A9B7E1;
    STA.W $0FB2                                                          ;A9B7E4;
    RTS                                                                  ;A9B7E7;


Function_MotherBrainBody_FiringBomb_FiredBomb:
    DEC.W $0FB2                                                          ;A9B7E8;
    BPL MotherBrainFiringBomb_FinishFiringBomb_return                    ;A9B7EB;
    JSR.W MakeMotherBrainStandUp                                         ;A9B7ED;
    BCS MotherBrainFiringBomb_FinishFiringBomb                           ;A9B7F0;
    LDA.W #Function_MotherBrainBody_FiringBomb_StandUp                   ;A9B7F2;
    STA.W $0FA8                                                          ;A9B7F5;

Function_MotherBrainBody_FiringBomb_StandUp:
    JSR.W MakeMotherBrainStandUp                                         ;A9B7F8;
    BCC MotherBrainFiringBomb_FinishFiringBomb_return                    ;A9B7FB;

MotherBrainFiringBomb_FinishFiringBomb:
    LDY.W #Function_MotherBrainBody_Phase2_Thinking                      ;A9B7FD;
    LDA.L $7E783E                                                        ;A9B800;
    BEQ .notCorpse                                                       ;A9B804;
    LDY.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack        ;A9B806;

.notCorpse:
    TYA                                                                  ;A9B809;
    STA.W $0FA8                                                          ;A9B80A;

MotherBrainFiringBomb_FinishFiringBomb_return:
    RTS                                                                  ;A9B80D;


Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly:
    LDX.W #$0008                                                         ;A9B80E;
    LDA.W $0FBE                                                          ;A9B811;
    CMP.W $0AFA                                                          ;A9B814;
    BPL +                                                                ;A9B817;
    LDX.W #$0006                                                         ;A9B819;

  + TXA                                                                  ;A9B81C;
    STA.L $7E8064                                                        ;A9B81D;
    STA.L $7E8066                                                        ;A9B821;
    LDA.W #$0200                                                         ;A9B825;
    STA.L $7E8068                                                        ;A9B828;
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadSlowlyAndFire  ;A9B82C;
    STA.W $0FA8                                                          ;A9B82F;
    LDA.W #$0004                                                         ;A9B832;
    STA.W $0FB2                                                          ;A9B835;
    RTS                                                                  ;A9B838;


Function_MBBody_Phase2_FiringLaser_PositionHeadSlowlyAndFire:
    DEC.W $0FB2                                                          ;A9B839;
    BMI .timerExpired                                                    ;A9B83C;
    RTS                                                                  ;A9B83E;


.timerExpired:
    LDY.W #$0100                                                         ;A9B83F;
    LDA.L $7E8068                                                        ;A9B842;
    BPL +                                                                ;A9B846;
    LDY.W #$FF00                                                         ;A9B848;

  + TYA                                                                  ;A9B84B;
    STA.L $7E8068                                                        ;A9B84C;
    LDA.W #InstList_MotherBrainHead_Attacking_Laser                      ;A9B850;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B853;
    LDA.W #Function_MotherBrainBody_Phase2_FiringLaser_FinishAttack      ;A9B856;
    STA.W $0FA8                                                          ;A9B859;
    LDA.W #$0010                                                         ;A9B85C;
    STA.W $0FB2                                                          ;A9B85F;
    RTS                                                                  ;A9B862;


Function_MotherBrainBody_Phase2_FiringLaser_FinishAttack:
    DEC.W $0FB2                                                          ;A9B863;
    BMI .timerExpired                                                    ;A9B866;
    RTS                                                                  ;A9B868;


.timerExpired:
    LDA.W #$0004                                                         ;A9B869;
    STA.L $7E8064                                                        ;A9B86C;
    STA.L $7E8066                                                        ;A9B870;
    LDA.W #Function_MotherBrainBody_Phase2_Thinking                      ;A9B874;
    STA.W $0FA8                                                          ;A9B877;
    JMP.W Function_MotherBrainBody_Phase2_Thinking                       ;A9B87A;


Function_MotherBrainBody_Phase2_FiringDeathBeam:
    LDA.L $7E782E                                                        ;A9B87D;
    ASL A                                                                ;A9B881;
    TAX                                                                  ;A9B882;
    JSR.W (.pointers,X)                                                  ;A9B883;
    RTS                                                                  ;A9B886;


.pointers:
    dw MotherBrainPhase2_FiringDeathBeam_BackUp                          ;A9B887;
    dw MotherBrainPhase2_FiringDeathBeam_WaitForAnyActiveBombs           ;A9B889;
    dw RTS_A9B8C8                                                        ;A9B88B;
    dw MotherBrainPhase2_FiringDeathBeam_Finish                          ;A9B88D;

MotherBrainPhase2_FiringDeathBeam_BackUp:
    LDY.W #$0008                                                         ;A9B88F;
    LDA.W #$0028                                                         ;A9B892;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9B895;
    BCC .return                                                          ;A9B898;
    LDA.W #$0008                                                         ;A9B89A;
    STA.L $7E8064                                                        ;A9B89D;
    LDA.W #$0006                                                         ;A9B8A1;
    STA.L $7E8066                                                        ;A9B8A4;
    LDA.L $7E782E                                                        ;A9B8A8;
    INC A                                                                ;A9B8AC;
    STA.L $7E782E                                                        ;A9B8AD;

.return:
    RTS                                                                  ;A9B8B1;


MotherBrainPhase2_FiringDeathBeam_WaitForAnyActiveBombs:
    LDA.L $7E784A                                                        ;A9B8B2;
    BNE .return                                                          ;A9B8B6;
    LDA.W #InstList_MotherBrainBody_DeathBeamMode                        ;A9B8B8;
    JSR.W SetMotherBrainBodyInstList                                     ;A9B8BB;
    LDA.L $7E782E                                                        ;A9B8BE;
    INC A                                                                ;A9B8C2;
    STA.L $7E782E                                                        ;A9B8C3;

.return:
    RTS                                                                  ;A9B8C7;


RTS_A9B8C8:
    RTS                                                                  ;A9B8C8;


MotherBrainPhase2_FiringDeathBeam_Finish:
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0                     ;A9B8C9;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B8CC;
    LDA.W #$0002                                                         ;A9B8CF;
    STA.L $7E8064                                                        ;A9B8D2;
    LDA.W #$0004                                                         ;A9B8D6;
    STA.L $7E8066                                                        ;A9B8D9;
    LDA.W #$0000                                                         ;A9B8DD;
    STA.L $7E782E                                                        ;A9B8E0;
    LDA.W #Function_MotherBrainBody_Phase2_Thinking                      ;A9B8E4;
    STA.W $0FA8                                                          ;A9B8E7;
    RTS                                                                  ;A9B8EA;


Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck:
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0                     ;A9B8EB;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B8EE;
    LDA.W #$0040                                                         ;A9B8F1;
    STA.L $7E8068                                                        ;A9B8F4;
    LDA.W #$0001                                                         ;A9B8F8;
    STA.L $7E8062                                                        ;A9B8FB;
    LDA.W #$0002                                                         ;A9B8FF;
    STA.L $7E8064                                                        ;A9B902;
    LDA.W #$0004                                                         ;A9B906;
    STA.L $7E8066                                                        ;A9B909;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartCharging        ;A9B90D;
    STA.W $0FA8                                                          ;A9B910;
    LDA.W #$0100                                                         ;A9B913;
    STA.W $0FB2                                                          ;A9B916;

Function_MotherBrainBody_Phase2_FiringRainbowBeam_return:
    RTS                                                                  ;A9B919;


Function_MBBody_Phase2_FiringRainbowBeam_StartCharging:
    DEC.W $0FB2                                                          ;A9B91A;
    BPL Function_MotherBrainBody_Phase2_FiringRainbowBeam_return         ;A9B91D;
    LDA.W #InstList_MotherBrainHead_ChargingRainbowBeam_0                ;A9B91F;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B922;
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck ;A9B925;
    STA.W $0FA8                                                          ;A9B928; fallthrough to Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck

Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck:
    LDA.W #$0028                                                         ;A9B92B;
    JSR.W MakeMBWalkBackwardsReallySlowTowardsXPositionInA_RetractHead   ;A9B92E;
    BCC Function_MotherBrainBody_Phase2_FiringRainbowBeam_return         ;A9B931;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge  ;A9B933;
    STA.W $0FA8                                                          ;A9B936;
    LDA.W #$0100                                                         ;A9B939;
    STA.W $0FB2                                                          ;A9B93C; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge

Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge:
    DEC.W $0FB2                                                          ;A9B93F;
    BPL Function_MotherBrainBody_Phase2_FiringRainbowBeam_return         ;A9B942;
    LDA.W #$0071                                                         ;A9B944;
    JSL.L QueueSound_Lib2_Max6                                           ;A9B947;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown       ;A9B94B;
    STA.W $0FA8                                                          ;A9B94E; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown

Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown:
    LDA.W #$0008                                                         ;A9B951;
    STA.W $0CCC                                                          ;A9B954;
    LDA.W #$0006                                                         ;A9B957;
    STA.L $7E8064                                                        ;A9B95A;
    STA.L $7E8066                                                        ;A9B95E;
    LDA.W #$0500                                                         ;A9B962;
    STA.L $7E8068                                                        ;A9B965;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam ;A9B969;
    STA.W $0FA8                                                          ;A9B96C;
    LDA.W #$0010                                                         ;A9B96F;
    STA.W $0FB2                                                          ;A9B972; fallthough to Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam

Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam:
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth                        ;A9B975;
    LDA.W $0CEE                                                          ;A9B978;
    BNE .return                                                          ;A9B97B;
    DEC.W $0FB2                                                          ;A9B97D;
    BMI .timerExpired                                                    ;A9B980;

.return:
    RTS                                                                  ;A9B982;


.timerExpired:
    LDA.W $0CEE                                                          ;A9B983;
    BNE .return                                                          ;A9B986; >_<
    STZ.W $0CCC                                                          ;A9B988;
    JSR.W ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex           ;A9B98B;
    LDA.W #InstList_MotherBrainHead_FiringRainbowBeam                    ;A9B98E;
    JSR.W SetMotherBrainHeadInstList                                     ;A9B991;
    LDA.W #$0200                                                         ;A9B994;
    STA.L $7E8026                                                        ;A9B997;
    JSL.L Spawn_MotherBrainRainbowBeam_HDMAObject                        ;A9B99B;
    STA.L $7E7812                                                        ;A9B99F;
    LDA.W #$0040                                                         ;A9B9A3;
    STA.L $7E8068                                                        ;A9B9A6;
    LDA.W #$0001                                                         ;A9B9AA;
    STA.L $7E8062                                                        ;A9B9AD;
    LDA.W #$0002                                                         ;A9B9B1;
    STA.L $7E8064                                                        ;A9B9B4;
    LDA.W #$0004                                                         ;A9B9B8;
    STA.L $7E8066                                                        ;A9B9BB;
    STZ.W $0FB4                                                          ;A9B9BF;
    STZ.W $0FB6                                                          ;A9B9C2;
    LDA.W #$0005                                                         ;A9B9C5;
    LDY.W $09C2                                                          ;A9B9C8;
    CPY.W #$02BC                                                         ;A9B9CB;
    BPL .greaterThan2BC                                                  ;A9B9CE;
    LDA.W #$0018                                                         ;A9B9D0;

.greaterThan2BC:
    JSL.L Run_Samus_Command                                              ;A9B9D3;
    LDA.W #$0006                                                         ;A9B9D7;
    STA.L $7E782A                                                        ;A9B9DA;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_MoveSamusTowardWall  ;A9B9DE;
    STA.W $0FA8                                                          ;A9B9E1;
    RTS                                                                  ;A9B9E4;


Function_MBBody_Phase2_FiringRainbowBeam_MoveSamusTowardWall:
    JSR.W PlayMotherBrainRainbowBeamSFX                                  ;A9B9E5;
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9B9E8;
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth                        ;A9B9EB;
    JSR.W HandleMotherBrainRainbowBeamExplosions                         ;A9B9EE;
    JSR.W MoveSamusTowardsWallDueToRainbowBeam                           ;A9B9F1;
    BCC .return                                                          ;A9B9F4;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_1FrameDelay          ;A9B9F6;
    STA.W $0FA8                                                          ;A9B9F9;
    STZ.W $0FB2                                                          ;A9B9FC;

.return:
    RTS                                                                  ;A9B9FF;


Function_MBBody_Phase2_FiringRainbowBeam_1FrameDelay:
    JSR.W PlayMotherBrainRainbowBeamSFX                                  ;A9BA00;
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BA03;
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth                        ;A9BA06;
    JSR.W HandleMotherBrainRainbowBeamExplosions                         ;A9BA09;
    JSR.W MoveSamusTowardsWallDueToRainbowBeam                           ;A9BA0C;
    DEC.W $0FB2                                                          ;A9BA0F;
    BPL .return                                                          ;A9BA12;
    LDA.W #$0008                                                         ;A9BA14;
    STA.W $183E                                                          ;A9BA17;
    LDA.W #$0008                                                         ;A9BA1A;
    STA.W $1840                                                          ;A9BA1D;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartDrainingSamus   ;A9BA20;
    STA.W $0FA8                                                          ;A9BA23;

.return:
    RTS                                                                  ;A9BA26;


Function_MBBody_Phase2_FiringRainbowBeam_StartDrainingSamus:
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus        ;A9BA27;
    STA.W $0FA8                                                          ;A9BA2A;
    LDA.W #$012B                                                         ;A9BA2D;
    STA.W $0FB2                                                          ;A9BA30;
    STA.W $1840                                                          ;A9BA33;
    LDA.W #$0008                                                         ;A9BA36;
    STA.W $183E                                                          ;A9BA39; fallthough to Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus

Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus:
    JSR.W PlayMotherBrainRainbowBeamSFX                                  ;A9BA3C;
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BA3F;
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth                        ;A9BA42;
    JSR.W HandleMotherBrainRainbowBeamExplosions                         ;A9BA45;
    JSL.L DamageSamusDueToRainbowBeam                                    ;A9BA48;
    JSR.W DecrementAmmoDueToRainbowBeam                                  ;A9BA4C;
    JSR.W MoveSamusTowardsMiddleOfWall                                   ;A9BA4F;
    DEC.W $0FB2                                                          ;A9BA52;
    BPL Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring_return     ;A9BA55;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring         ;A9BA57;
    STA.W $0FA8                                                          ;A9BA5A;
    RTS                                                                  ;A9BA5D;


Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring:
    JSR.W PlayMotherBrainRainbowBeamSFX                                  ;A9BA5E;
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BA61;
    JSR.W AimMotherBrainRainbowBeam                                      ;A9BA64;
    JSR.W HandleMotherBrainRainbowBeamExplosions                         ;A9BA67;
    LDA.L $7E8026                                                        ;A9BA6A;
    SEC                                                                  ;A9BA6E;
    SBC.W #$0180                                                         ;A9BA6F;
    STA.L $7E8026                                                        ;A9BA72;
    CMP.W #$0200                                                         ;A9BA76;
    BPL Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring_return     ;A9BA79;
    LDA.W #$0200                                                         ;A9BA7B;
    STA.L $7E8026                                                        ;A9BA7E;
    LDA.W #$FF00                                                         ;A9BA82;
    STA.W $0FB4                                                          ;A9BA85;
    STZ.W $0FB6                                                          ;A9BA88;
    LDA.L $7E7812                                                        ;A9BA8B;
    TAX                                                                  ;A9BA8F;
    STZ.W $18B4,X                                                        ;A9BA90;
    STZ.W $1840                                                          ;A9BA93;
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0                     ;A9BA96;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BA99;
    JSR.W SetupMotherBrainHeadNormalPalette                              ;A9BA9C;
    JSR.W WriteMotherBrainDefaultPalette                                 ;A9BA9F;
    LDA.W #$0002                                                         ;A9BAA2;
    JSL.L QueueSound_Lib1_Max6                                           ;A9BAA5;
    LDA.W #$0000                                                         ;A9BAA9;
    STA.L $7E782C                                                        ;A9BAAC;
    LDA.W #$0001                                                         ;A9BAB0;
    JSL.L Run_Samus_Command                                              ;A9BAB3;
    LDA.W #$0008                                                         ;A9BAB7;
    STA.W $0CCC                                                          ;A9BABA;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_LetSamusFall         ;A9BABD;
    STA.W $0FA8                                                          ;A9BAC0;

Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring_return:
    RTS                                                                  ;A9BAC3;


Function_MBBody_Phase2_FiringRainbowBeam_LetSamusFall:
    LDA.W #$0000                                                         ;A9BAC4;
    JSL.L DrainedSamusController                                         ;A9BAC7;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand   ;A9BACB;
    STA.W $0FA8                                                          ;A9BACE;

Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand:
    JSR.W MoveSamusForFallingAfterRainbowBeam                            ;A9BAD1;
    BCC .return                                                          ;A9BAD4;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_LowerHead            ;A9BAD6;
    STA.W $0FA8                                                          ;A9BAD9;

.return:
    RTS                                                                  ;A9BADC;


Function_MBBody_Phase2_FiringRainbowBeam_LowerHead:
    LDA.W #$0040                                                         ;A9BADD;
    STA.L $7E8068                                                        ;A9BAE0;
    LDA.W #$0001                                                         ;A9BAE4;
    STA.L $7E8062                                                        ;A9BAE7;
    LDA.W #$0002                                                         ;A9BAEB;
    STA.L $7E8064                                                        ;A9BAEE;
    LDA.W #$0004                                                         ;A9BAF2;
    STA.L $7E8066                                                        ;A9BAF5;
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_DecideNextAction     ;A9BAF9;
    STA.W $0FA8                                                          ;A9BAFC;
    LDA.W #$0080                                                         ;A9BAFF;
    STA.W $0FB2                                                          ;A9BB02;

Function_MBBody_Phase2_FiringRainbowBeam_LowerHead_return:
    RTS                                                                  ;A9BB05;


Function_MBBody_Phase2_FiringRainbowBeam_DecideNextAction:
    DEC.W $0FB2                                                          ;A9BB06;
    BPL Function_MBBody_Phase2_FiringRainbowBeam_LowerHead_return        ;A9BB09;
    LDA.W $09C2                                                          ;A9BB0B;
    CMP.W #$0190                                                         ;A9BB0E;
    BMI .lessThan190                                                     ;A9BB11;
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck  ;A9BB13;
    STA.W $0FA8                                                          ;A9BB16;
    RTS                                                                  ;A9BB19;


.lessThan190:
    LDY.W #$000A                                                         ;A9BB1A;
    LDA.W $0F7A                                                          ;A9BB1D;
    CLC                                                                  ;A9BB20;
    ADC.W #$0010                                                         ;A9BB21;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9BB24;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_GetSamusToLowEnergy     ;A9BB27;
    STA.W $0FA8                                                          ;A9BB2A;
    RTS                                                                  ;A9BB2D;


PlayMotherBrainRainbowBeamSFX:
    LDA.L $7E782A                                                        ;A9BB2E;
    BMI .return                                                          ;A9BB32;
    DEC A                                                                ;A9BB34;
    STA.L $7E782A                                                        ;A9BB35;
    LDA.W #$0040                                                         ;A9BB39;
    JSL.L QueueSound_Lib1_Max6                                           ;A9BB3C;
    LDA.W #$0001                                                         ;A9BB40;
    STA.L $7E782C                                                        ;A9BB43;

.return:
    RTS                                                                  ;A9BB47;


MakeMBWalkBackwardsReallySlowTowardsXPositionInA_RetractHead:
    LDY.W #$000A                                                         ;A9BB48;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9BB4B;
    BCS RetractMotherBrainsHead                                          ;A9BB4E;
    RTS                                                                  ;A9BB50;


RetractMotherBrainsHead:
    LDA.W #$0050                                                         ;A9BB51;
    STA.L $7E8068                                                        ;A9BB54;
    LDA.W #$0001                                                         ;A9BB58;
    STA.L $7E8062                                                        ;A9BB5B;
    LDA.W #$0008                                                         ;A9BB5F;
    STA.L $7E8064                                                        ;A9BB62;
    LDA.W #$0006                                                         ;A9BB66;
    STA.L $7E8066                                                        ;A9BB69;
    RTS                                                                  ;A9BB6D;


AimMotherBrainRainbowBeam_IncreaseWidth:
    LDA.L $7E8026                                                        ;A9BB6E;
    CLC                                                                  ;A9BB72;
    ADC.W #$0180                                                         ;A9BB73;
    CMP.W #$0C00                                                         ;A9BB76;
    BMI +                                                                ;A9BB79;
    LDA.W #$0C00                                                         ;A9BB7B;

  + STA.L $7E8026                                                        ;A9BB7E;

AimMotherBrainRainbowBeam:
    LDA.W $0AF6                                                          ;A9BB82;
    SEC                                                                  ;A9BB85;
    SBC.W $0FBA                                                          ;A9BB86;
    SEC                                                                  ;A9BB89;
    SBC.W #$0010                                                         ;A9BB8A;
    STA.B $12                                                            ;A9BB8D;
    LDA.W $0AFA                                                          ;A9BB8F;
    SEC                                                                  ;A9BB92;
    SBC.W $0FBE                                                          ;A9BB93;
    SEC                                                                  ;A9BB96;
    SBC.W #$0004                                                         ;A9BB97;
    STA.B $14                                                            ;A9BB9A;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A9BB9C;
    SEC                                                                  ;A9BBA0;
    SBC.W #$0080                                                         ;A9BBA1;
    EOR.W #$FFFF                                                         ;A9BBA4;
    INC A                                                                ;A9BBA7;
    AND.W #$00FF                                                         ;A9BBA8;
    STA.L $7E8022                                                        ;A9BBAB;
    RTS                                                                  ;A9BBAF;


CalculateMotherBrainRainbowBeamHDMATables_long:
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables                   ;A9BBB0;
    RTS                                                                  ;A9BBB4;


MoveSamusTowardsWallDueToRainbowBeam:
    LDA.W #$1000                                                         ;A9BBB5;
    JSR.W MoveSamusHorizontallyTowardsWall                               ;A9BBB8;
    BCS .return                                                          ;A9BBBB;
    LDA.L $7E8022                                                        ;A9BBBD;
    STA.B $12                                                            ;A9BBC1;
    LDA.W #$1000                                                         ;A9BBC3;
    JSL.L Math_86C272                                                    ;A9BBC6;
    JSR.W MoveSamusVerticallyTowardsCeilingFloor                         ;A9BBCA;
    CLC                                                                  ;A9BBCD;

.return:
    RTS                                                                  ;A9BBCE;


MoveSamusTowardsMiddleOfWall:
    LDA.W #$0040                                                         ;A9BBCF;
    LDY.W #$007C                                                         ;A9BBD2;
    CPY.W $0AFA                                                          ;A9BBD5;
    BPL .lessThanEqualTo7C                                               ;A9BBD8;
    EOR.W #$FFFF                                                         ;A9BBDA;
    INC A                                                                ;A9BBDD;

.lessThanEqualTo7C:
    JMP.W MoveSamusVerticallyTowardsCeilingFloor                         ;A9BBDE;


MoveSamusForFallingAfterRainbowBeam:
    LDA.W $0FB4                                                          ;A9BBE1;
    CLC                                                                  ;A9BBE4;
    ADC.W #$0002                                                         ;A9BBE5;
    BMI +                                                                ;A9BBE8;
    LDA.W #$0000                                                         ;A9BBEA;

  + STA.W $0FB4                                                          ;A9BBED;
    JSR.W MoveSamusHorizontallyTowardsWall                               ;A9BBF0;
    LDA.W $0FB6                                                          ;A9BBF3;
    CLC                                                                  ;A9BBF6;
    ADC.W #$0018                                                         ;A9BBF7;
    STA.W $0FB6                                                          ;A9BBFA; fallthrough to MoveSamusVerticallyTowardsCeilingFloor

MoveSamusVerticallyTowardsCeilingFloor:
    SEP #$20                                                             ;A9BBFD;
    CLC                                                                  ;A9BBFF;
    ADC.W $0AFD                                                          ;A9BC00;
    STA.W $0AFD                                                          ;A9BC03;
    STA.W $0B17                                                          ;A9BC06;
    REP #$20                                                             ;A9BC09;
    AND.W #$FF00                                                         ;A9BC0B;
    XBA                                                                  ;A9BC0E;
    BPL +                                                                ;A9BC0F;
    ORA.W #$FF00                                                         ;A9BC11;

  + ADC.W $0AFA                                                          ;A9BC14;
    CMP.W #$0030                                                         ;A9BC17;
    BMI .load30                                                          ;A9BC1A;
    CMP.W #$00C0                                                         ;A9BC1C;
    BPL .loadC0                                                          ;A9BC1F;
    STA.W $0AFA                                                          ;A9BC21;
    STA.W $0B14                                                          ;A9BC24;
    CLC                                                                  ;A9BC27;
    RTS                                                                  ;A9BC28;


.load30:
    LDA.W #$0030                                                         ;A9BC29;
    BRA +                                                                ;A9BC2C;


.loadC0:
    LDA.W #$00C0                                                         ;A9BC2E;

  + STA.W $0AFA                                                          ;A9BC31;
    STA.W $0B14                                                          ;A9BC34;
    STZ.W $0AFC                                                          ;A9BC37;
    STZ.W $0B16                                                          ;A9BC3A;
    SEC                                                                  ;A9BC3D;
    RTS                                                                  ;A9BC3E;


MoveSamusHorizontallyTowardsWall:
    SEP #$20                                                             ;A9BC3F;
    CLC                                                                  ;A9BC41;
    ADC.W $0AF9                                                          ;A9BC42;
    STA.W $0AF9                                                          ;A9BC45;
    STA.W $0B13                                                          ;A9BC48;
    REP #$20                                                             ;A9BC4B;
    AND.W #$FF00                                                         ;A9BC4D;
    XBA                                                                  ;A9BC50;
    BPL +                                                                ;A9BC51;
    ORA.W #$FF00                                                         ;A9BC53;

  + ADC.W $0AF6                                                          ;A9BC56;
    CMP.W #$00EB                                                         ;A9BC59;
    BPL .greaterThanEqualToEB                                            ;A9BC5C;
    STA.W $0AF6                                                          ;A9BC5E;
    STA.W $0B10                                                          ;A9BC61;
    RTS                                                                  ;A9BC64;


.greaterThanEqualToEB:
    LDA.W #$00EB                                                         ;A9BC65;
    STA.W $0AF6                                                          ;A9BC68;
    STA.W $0B10                                                          ;A9BC6B;
    STZ.W $0AF8                                                          ;A9BC6E;
    STZ.W $0B12                                                          ;A9BC71;
    SEC                                                                  ;A9BC74;
    RTS                                                                  ;A9BC75;


HandleMotherBrainRainbowBeamExplosions:
    DEC.W $0FB6                                                          ;A9BC76;
    BMI .timerExpired                                                    ;A9BC79;
    RTS                                                                  ;A9BC7B;


.timerExpired:
    LDA.W #$0008                                                         ;A9BC7C;
    STA.W $0FB6                                                          ;A9BC7F;
    INC.W $0FB4                                                          ;A9BC82;
    LDA.W $0FB4                                                          ;A9BC85;
    AND.W #$0007                                                         ;A9BC88;
    ASL A                                                                ;A9BC8B;
    TAX                                                                  ;A9BC8C;
    LDA.W .data0,X                                                       ;A9BC8D;
    STA.B $12                                                            ;A9BC90;
    LDA.W .data1,X                                                       ;A9BC92;
    STA.B $14                                                            ;A9BC95;
    LDY.W #EnemyProjectile_MotherBrainRainbowBeam_Explosion              ;A9BC97;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9BC9A;
    LDA.W #$0024                                                         ;A9BC9E;
    JSL.L QueueSound_Lib2_Max6                                           ;A9BCA1;
    RTS                                                                  ;A9BCA5;


.data0:
    db $F8,$FF,$06,$00,$FC,$FF,$02,$00,$03,$00,$FA,$FF,$08,$00,$00,$00   ;A9BCA6;

.data1:
    db $F9,$FF,$02,$00,$05,$00,$FC,$FF,$06,$00,$FE,$FF,$FA,$FF,$07,$00   ;A9BCB6;

ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex:
    LDA.W #$0000                                                         ;A9BCC6;
    STA.L $7E7842                                                        ;A9BCC9;
    RTS                                                                  ;A9BCCD;


WriteMotherBrainDefaultPalette:
    LDY.W #Palette_MotherBrain+2                                         ;A9BCCE;
    LDX.W #$0082                                                         ;A9BCD1;
    LDA.W #$000F                                                         ;A9BCD4;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BCD7;
    LDY.W #Palette_MotherBrain+2                                         ;A9BCDB;
    LDX.W #$0122                                                         ;A9BCDE;
    LDA.W #$000F                                                         ;A9BCE1;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BCE4;
    LDY.W #Palette_MotherBrain_BackLeg+2                                 ;A9BCE8;
    LDX.W #$0162                                                         ;A9BCEB;
    LDA.W #$000F                                                         ;A9BCEE;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BCF1;
    RTS                                                                  ;A9BCF5;


WriteMotherBrainPhase2DeathPalette:
    LDA.L MotherBrainPhase2DeathBeforeGreyPalette_Pointers               ;A9BCF6;
    TAY                                                                  ;A9BCFA;
    BRA WriteMotherBrainPalette                                          ;A9BCFB;


HandleMotherBrainBodyRainbowBeamPalette:
    LDA.W $0FA4                                                          ;A9BCFD;
    AND.W #$0002                                                         ;A9BD00;
    BNE .loadIndex                                                       ;A9BD03;
    RTS                                                                  ;A9BD05;


.loadIndex:
    LDA.L $7E7842                                                        ;A9BD06;

.restart:
    TAX                                                                  ;A9BD0A;
    LDA.L MotherBrainBodyRainbowBeamPalette_Pointers,X                   ;A9BD0B;
    BEQ .restart                                                         ;A9BD0F;
    INX                                                                  ;A9BD11;
    INX                                                                  ;A9BD12;
    TXA                                                                  ;A9BD13;
    STA.L $7E7842                                                        ;A9BD14;
    LDA.L MotherBrainBodyRainbowBeamPalette_Pointers-2,X                 ;A9BD18;
    TAY                                                                  ;A9BD1C;

WriteMotherBrainPalette:
    PHB                                                                  ;A9BD1D;
    PEA.W $AD00                                                          ;A9BD1E;
    PLB                                                                  ;A9BD21;
    PLB                                                                  ;A9BD22;
    PHY                                                                  ;A9BD23;
    LDX.W #$0082                                                         ;A9BD24;
    LDA.W #$000F                                                         ;A9BD27;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BD2A;
    PLY                                                                  ;A9BD2E;
    LDX.W #$0122                                                         ;A9BD2F;
    LDA.W #$000F                                                         ;A9BD32;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BD35;
    LDX.W #$0162                                                         ;A9BD39;
    LDA.W #$000F                                                         ;A9BD3C;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9BD3F;
    PLB                                                                  ;A9BD43;
    RTS                                                                  ;A9BD44;


Function_MBBody_Phase2_FinishSamusOff_GetSamusToLowEnergy:
    LDA.W #$0050                                                         ;A9BD45;
    JSL.L Suit_Damage_Division                                           ;A9BD48;
    ASL A                                                                ;A9BD4C;
    ASL A                                                                ;A9BD4D;
    ADC.W #$0014                                                         ;A9BD4E;
    CMP.W $09C2                                                          ;A9BD51;
    BPL .done                                                            ;A9BD54;
    LDA.W $05E5                                                          ;A9BD56;
    AND.W #$0FFF                                                         ;A9BD59;
    CMP.W #$0FA0                                                         ;A9BD5C;
    BCC .noAttack                                                        ;A9BD5F;
    LDA.W #$00A0                                                         ;A9BD61;
    JSL.L Suit_Damage_Division                                           ;A9BD64;
    CLC                                                                  ;A9BD68;
    ADC.W #$0014                                                         ;A9BD69;
    CMP.W $09C2                                                          ;A9BD6C;
    BPL .onionRings                                                      ;A9BD6F;
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2                ;A9BD71;
    LDA.W $05E5                                                          ;A9BD74;
    AND.W #$0FFF                                                         ;A9BD77;
    CMP.W #$0FF0                                                         ;A9BD7A;
    BCS .doAttack                                                        ;A9BD7D;

.onionRings:
    LDY.W #InstList_MotherBrainHead_Attacking_2OnionRings_Phase2         ;A9BD7F;

.doAttack:
    TYA                                                                  ;A9BD82;
    JMP.W SetMotherBrainHeadInstList                                     ;A9BD83;


.noAttack:
    LDA.W $0FA4                                                          ;A9BD86;
    AND.W #$001F                                                         ;A9BD89;
    BNE .return                                                          ;A9BD8C;
    JMP.W MaybeMakeMotherBrainStandUpOrLeanDown                          ;A9BD8E;


.done:
    LDA.W #Function_MotherBrainBody_Phase2_FinishSamusOff_StandUp        ;A9BD91;
    STA.W $0FA8                                                          ;A9BD94;

.return:
    RTS                                                                  ;A9BD97;


Function_MotherBrainBody_Phase2_FinishSamusOff_StandUp:
    JSR.W MakeMotherBrainStandUp                                         ;A9BD98;
    BCC Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BD9B;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone       ;A9BD9D;
    STA.W $0FA8                                                          ;A9BDA0;
    LDA.W #$0010                                                         ;A9BDA3;
    STA.W $0FB2                                                          ;A9BDA6; fallthrough to Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone

Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone:
    DEC.W $0FB2                                                          ;A9BDA9;
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BDAC;
    LDA.W #InstList_MotherBrainHead_Stretching_Phase2_0                  ;A9BDAE;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BDB1;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_ChargeFinalRainbowBeam  ;A9BDB4;
    STA.W $0FA8                                                          ;A9BDB7;
    LDA.W #$0100                                                         ;A9BDBA;
    STA.W $0FB2                                                          ;A9BDBD;
    RTS                                                                  ;A9BDC0;


Function_MBBody_Phase2_FinishSamusOff_ChargeFinalRainbowBeam:
    DEC.W $0FB2                                                          ;A9BDC1;
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BDC4;
    LDA.W #InstList_MotherBrainHead_ChargingRainbowBeam_0                ;A9BDC6;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BDC9;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid         ;A9BDCC;
    STA.W $0FA8                                                          ;A9BDCF; fallthough to Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid

Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_babyMetroid         ;A9BDD2;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9BDD5;
    BCC Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BDD8;
    JSR.W RetractMotherBrainsHead                                        ;A9BDDA;
    JSR.W SpawnBabyMetroidCutscene                                       ;A9BDDD;
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_FireFinalRainbowBeam    ;A9BDE0;
    STA.W $0FA8                                                          ;A9BDE3;
    LDA.W #$0100                                                         ;A9BDE6;
    STA.W $0FB2                                                          ;A9BDE9;

Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return:
    RTS                                                                  ;A9BDEC;


Function_MBBody_Phase2_FinishSamusOff_FireFinalRainbowBeam:
    DEC.W $0FB2                                                          ;A9BDED;
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return     ;A9BDF0;
    JSR.W ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex           ;A9BDF2;
    LDA.W #InstList_MotherBrainHead_FiringRainbowBeam                    ;A9BDF5;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BDF8;
    LDA.W #$0006                                                         ;A9BDFB;
    STA.L $7E8064                                                        ;A9BDFE;
    STA.L $7E8066                                                        ;A9BE02;
    LDA.W #$0500                                                         ;A9BE06;
    STA.L $7E8068                                                        ;A9BE09;
    LDA.W #$0071                                                         ;A9BE0D;
    JSL.L QueueSound_Lib2_Max6                                           ;A9BE10;
    LDA.W #RTS_A9BE1A                                                    ;A9BE14;
    STA.W $0FA8                                                          ;A9BE17;

RTS_A9BE1A:
    RTS                                                                  ;A9BE1A;


SpawnBabyMetroidCutscene:
    LDX.W #PopulationData_BabyMetroidCutscene                            ;A9BE1B;
    JSL.L SpawnEnemy                                                     ;A9BE1E;
    TXA                                                                  ;A9BE22;
    STA.L $7E7854                                                        ;A9BE23;
    RTS                                                                  ;A9BE27;


PopulationData_BabyMetroidCutscene:
    dw EnemyHeaders_BabyMetroidCutscene                                  ;A9BE28;
    dw $0180,$0040                                                       ;A9BE2A;
    dw InstList_BabyMetroid_Initial                                      ;A9BE2E;
    dw $2800,$0000,$0000,$0000                                           ;A9BE30;

Function_MotherBrainBody_DrainedByBabyMetroid_TakenAback:
    LDA.W #$0003                                                         ;A9BE38;
    STA.L $7E7800                                                        ;A9BE3B;
    LDA.W #$0008                                                         ;A9BE3F;
    STA.L $7E8064                                                        ;A9BE42;
    STA.L $7E8066                                                        ;A9BE46;
    LDA.W #$0700                                                         ;A9BE4A;
    STA.L $7E8068                                                        ;A9BE4D;
    LDA.W #Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance   ;A9BE51;
    STA.W $0FA8                                                          ;A9BE54;
    LDA.W #$0030                                                         ;A9BE57;
    STA.W $0FB2                                                          ;A9BE5A; fallthrough to Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance

Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance:
    JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BE5D;
    DEC.W $0FB2                                                          ;A9BE60;
    BPL .return                                                          ;A9BE63;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_FiringRainbowBeam        ;A9BE65;
    STA.W $0FA8                                                          ;A9BE68;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkForwards          ;A9BE6B;
    STA.L $7E7850                                                        ;A9BE6E;
    LDA.W #$0000                                                         ;A9BE72;
    STA.L $7E784C                                                        ;A9BE75;
    LDA.W #$0002                                                         ;A9BE79;
    STA.L $7E784E                                                        ;A9BE7C;
    LDA.W #$0001                                                         ;A9BE80;
    LDA.L $7E8062                                                        ;A9BE83;
    LDA.W #$0002                                                         ;A9BE87;
    STA.L $7E8064                                                        ;A9BE8A;
    LDA.W #$0004                                                         ;A9BE8E;
    STA.L $7E8066                                                        ;A9BE91;

.return:
    RTS                                                                  ;A9BE95;


Function_MBBody_DrainedByBabyMetroid_FiringRainbowBeam:
    LDA.L $7E7840                                                        ;A9BE96;
    BNE +                                                                ;A9BE9A;
    LDA.W #$0032                                                         ;A9BE9C;
    STA.L $7E7840                                                        ;A9BE9F;

  + JSR.W HandleMotherBrainBodyRainbowBeamPalette                        ;A9BEA3;
    LDA.L $7E7850                                                        ;A9BEA6;
    STA.B $12                                                            ;A9BEAA;
    PEA.W .manualReturn-1                                                ;A9BEAC;
    JMP.W ($0012)                                                        ;A9BEAF;


.manualReturn:
    LDA.L $7E784C                                                        ;A9BEB2;
    ASL A                                                                ;A9BEB6;
    TAY                                                                  ;A9BEB7;
    LDA.W .walkingAnimationDelays,Y                                      ;A9BEB8;
    AND.W #$00FF                                                         ;A9BEBB;
    STA.L $7E784E                                                        ;A9BEBE;
    LDA.W .neckAngleDeltas,Y                                             ;A9BEC2;
    STA.L $7E8068                                                        ;A9BEC5;
    LDA.L $7E784C                                                        ;A9BEC9;
    CMP.W #$0006                                                         ;A9BECD;
    BNE .return                                                          ;A9BED0;
    LDA.W #$0000                                                         ;A9BED2;
    STA.L $7E782C                                                        ;A9BED5;
    STA.L $7E7860                                                        ;A9BED9;
    JSR.W WriteMotherBrainPhase2DeathPalette                             ;A9BEDD;
    LDA.W #$0002                                                         ;A9BEE0;
    JSL.L QueueSound_Lib1_Max6                                           ;A9BEE3;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_RainbowBeamHasRunOut     ;A9BEE7;
    STA.W $0FA8                                                          ;A9BEEA;

.return:
    RTS                                                                  ;A9BEED;


.walkingAnimationDelays:
    dw $0002,$0002,$0006,$0006,$0008,$0008,$000A,$000A                   ;A9BEEE;

.neckAngleDeltas:
    dw $0500,$0500,$0200,$0200,$00C0,$00C0,$0040,$0040                   ;A9BEFE;

Function_MBBody_DrainedByBabyMetroid_RainbowBeamHasRunOut:
    LDA.L $7E7850                                                        ;A9BF0E;
    STA.B $12                                                            ;A9BF12;
    PEA.W .manualReturn-1                                                ;A9BF14;
    JMP.W ($0012)                                                        ;A9BF17;


.manualReturn:
    LDA.L $7E784C                                                        ;A9BF1A;
    CMP.W #$0008                                                         ;A9BF1E;
    BMI Function_MotherBrainBody_DrainedByBabyMetroid_return             ;A9BF21;
    LDA.W #$0040                                                         ;A9BF23;
    STA.L $7E8068                                                        ;A9BF26;
    LDA.W #$0008                                                         ;A9BF2A;
    STA.L $7E8064                                                        ;A9BF2D;
    STA.L $7E8066                                                        ;A9BF31;
    LDA.W #InstList_MotherBrainHead_DyingDrool_0                         ;A9BF35;
    JSR.W SetMotherBrainHeadInstList                                     ;A9BF38;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom         ;A9BF3B;
    STA.W $0FA8                                                          ;A9BF3E; fallthrough to Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom

Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom:
    LDA.W #$0028                                                         ;A9BF41;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9BF44;
    BCC Function_MotherBrainBody_DrainedByBabyMetroid_return             ;A9BF47;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode       ;A9BF49;
    STA.W $0FA8                                                          ;A9BF4C;
    LDA.W #$0000                                                         ;A9BF4F;
    STA.L $7E8066                                                        ;A9BF52; fallthrough to Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode

Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode:
    LDA.L $7E8064                                                        ;A9BF56;
    ORA.L $7E8066                                                        ;A9BF5A;
    BNE Function_MotherBrainBody_DrainedByBabyMetroid_return             ;A9BF5E;
    STA.L $7E7864                                                        ;A9BF60;
    LDA.L $7E7804                                                        ;A9BF64;
    BNE Function_MotherBrainBody_DrainedByBabyMetroid_return             ;A9BF68;
    LDA.W #InstList_MotherBrainBody_Crouch_Fast                          ;A9BF6A;
    JSR.W SetMotherBrainBodyInstList                                     ;A9BF6D;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_PrepareTransitionToGrey  ;A9BF70;
    STA.W $0FA8                                                          ;A9BF73;
    LDA.W #$0040                                                         ;A9BF76;
    STA.W $0FB2                                                          ;A9BF79;

Function_MotherBrainBody_DrainedByBabyMetroid_return:
    RTS                                                                  ;A9BF7C;


Function_MBBody_DrainedByBabyMetroid_PrepareTransitionToGrey:
    DEC.W $0FB2                                                          ;A9BF7D;
    BPL Function_MotherBrainBody_DrainedByBabyMetroid_return             ;A9BF80;
    LDA.W #$0000                                                         ;A9BF82;
    STA.L $7E802E                                                        ;A9BF85;
    LDA.W #Function_MBBody_DrainedByBabyMetroid_TransitionToGrey         ;A9BF89;
    STA.W $0FA8                                                          ;A9BF8C;
    LDA.W #$0010                                                         ;A9BF8F;
    STA.W $0FB2                                                          ;A9BF92;

Function_MBBody_DrainedByBabyMetroid_TransitionToGrey:
    DEC.W $0FB2                                                          ;A9BF95;
    BPL Function_MotherBrainBody_DrainedByBabyMetroid_return             ;A9BF98;
    LDA.W #$0010                                                         ;A9BF9A;
    STA.W $0FB2                                                          ;A9BF9D;
    LDA.L $7E802E                                                        ;A9BFA0;
    INC A                                                                ;A9BFA4;
    STA.L $7E802E                                                        ;A9BFA5;
    DEC A                                                                ;A9BFA9;
    JSL.L TransitionMotherBrainPaletteToGrey_DrainedByBabyMetroid        ;A9BFAA;
    BCC Function_MotherBrainBody_DrainedByBabyMetroid_return             ;A9BFAE;
    LDA.W #$8CA0                                                         ;A9BFB0; 36,000 HP
    STA.W $0FCC                                                          ;A9BFB3;
    LDA.W #$0001                                                         ;A9BFB6;
    STA.L $7E783E                                                        ;A9BFB9;
    DEC A                                                                ;A9BFBD;
    STA.L $7E7868                                                        ;A9BFBE;
    LDA.W #$0002                                                         ;A9BFC2;
    STA.L $7E7800                                                        ;A9BFC5;
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey      ;A9BFC9;
    STA.W $0FA8                                                          ;A9BFCC;
    RTS                                                                  ;A9BFCF;


Function_MotherBrainBody_PainfulWalking_WalkForwards:
    LDA.L $7E784E                                                        ;A9BFD0;
    TAY                                                                  ;A9BFD4;
    LDA.W #$0048                                                         ;A9BFD5;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9BFD8;
    BCC .return                                                          ;A9BFDB;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkingForwards       ;A9BFDD;
    STA.L $7E7850                                                        ;A9BFE0;
    JSR.W SetMotherBrainPainfulWalkingFunctionTimer                      ;A9BFE4;

.return:
    RTS                                                                  ;A9BFE7;


Function_MotherBrainBody_PainfulWalking_WalkingForwards:
    LDA.L $7E7852                                                        ;A9BFE8;
    DEC A                                                                ;A9BFEC;
    STA.L $7E7852                                                        ;A9BFED;
    BNE .return                                                          ;A9BFF1;
    LDA.L $7E784C                                                        ;A9BFF3;
    INC A                                                                ;A9BFF7;
    STA.L $7E784C                                                        ;A9BFF8;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkBackwards         ;A9BFFC;
    STA.L $7E7850                                                        ;A9BFFF;

.return:
    RTS                                                                  ;A9C003;


Function_MotherBrainBody_PainfulWalking_WalkBackwards:
    LDA.L $7E784E                                                        ;A9C004;
    TAY                                                                  ;A9C008;
    LDA.W #$0028                                                         ;A9C009;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C00C;
    BCC .return                                                          ;A9C00F;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkingBackwards      ;A9C011;
    STA.L $7E7850                                                        ;A9C014;
    JSR.W SetMotherBrainPainfulWalkingFunctionTimer                      ;A9C018;

.return:
    RTS                                                                  ;A9C01B;


Function_MotherBrainBody_PainfulWalking_WalkingBackwards:
    LDA.L $7E7852                                                        ;A9C01C;
    DEC A                                                                ;A9C020;
    STA.L $7E7852                                                        ;A9C021;
    BNE .return                                                          ;A9C025;
    LDA.L $7E784C                                                        ;A9C027;
    INC A                                                                ;A9C02B;
    STA.L $7E784C                                                        ;A9C02C;
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkForwards          ;A9C030;
    STA.L $7E7850                                                        ;A9C033;

.return:
    RTS                                                                  ;A9C037;


SetMotherBrainPainfulWalkingFunctionTimer:
    LDA.L $7E784C                                                        ;A9C038;
    ASL A                                                                ;A9C03C;
    TAY                                                                  ;A9C03D;
    LDA.W .timers,Y                                                      ;A9C03E;
    AND.W #$00FF                                                         ;A9C041;
    STA.L $7E7852                                                        ;A9C044;
    RTS                                                                  ;A9C048;


.timers:
    dw $0010,$0010,$0020,$0020,$0030,$0030,$0040,$0040                   ;A9C049;

Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey:
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_ShowSignsOfLife    ;A9C059;
    STA.W $0FA8                                                          ;A9C05C;
    LDA.W #$0300                                                         ;A9C05F;
    STA.W $0FB2                                                          ;A9C062;

Function_MotherBrainBody_Phase2_ReviveSelf_return:
    RTS                                                                  ;A9C065;


Function_MotherBrainBody_Phase2_ReviveSelf_ShowSignsOfLife:
    DEC.W $0FB2                                                          ;A9C066;
    BPL Function_MotherBrainBody_Phase2_ReviveSelf_return                ;A9C069;
    LDA.W #$0001                                                         ;A9C06B;
    STA.L $7E7868                                                        ;A9C06E;
    STA.L $7E7864                                                        ;A9C072;
    LDA.W #Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey     ;A9C076;
    STA.W $0FA8                                                          ;A9C079;
    LDA.W #$00E0                                                         ;A9C07C;
    STA.W $0FB2                                                          ;A9C07F; fallthrough to Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey

Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey:
    LDA.W #Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey          ;A9C082;
    STA.W $0FA8                                                          ;A9C085;
    LDA.W #$0000                                                         ;A9C088;
    STA.L $7E802E                                                        ;A9C08B; fallthrough to Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey

Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey:
    DEC.W $0FB2                                                          ;A9C08F;
    BPL Function_MotherBrainBody_Phase2_ReviveSelf_return                ;A9C092;
    LDA.W #$0010                                                         ;A9C094;
    STA.W $0FB2                                                          ;A9C097;
    LDA.L $7E802E                                                        ;A9C09A;
    INC A                                                                ;A9C09E;
    STA.L $7E802E                                                        ;A9C09F;
    DEC A                                                                ;A9C0A3;
    JSL.L TransitionMotherBrainPaletteFromGrey_DrainedByBabyMetroid      ;A9C0A4;
    BCC Function_MotherBrainBody_Phase2_ReviveSelf_return                ;A9C0A8;
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp             ;A9C0AA;
    STA.W $0FA8                                                          ;A9C0AD;
    LDA.W #$0001                                                         ;A9C0B0;
    STA.L $7E7860                                                        ;A9C0B3;
    JSR.W SetupMotherBrainHeadNormalPalette                              ;A9C0B7; fallthrough to Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp

Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp:
    JSR.W MakeMotherBrainStandUp                                         ;A9C0BA;
    BCC Function_MotherBrainBody_Phase2_ReviveSelf_return                ;A9C0BD;
    LDA.W #$0006                                                         ;A9C0BF;
    STA.L $7E8064                                                        ;A9C0C2;
    STA.L $7E8066                                                        ;A9C0C6;
    LDA.W #$0500                                                         ;A9C0CA;
    STA.L $7E8068                                                        ;A9C0CD;
    LDA.W #$0001                                                         ;A9C0D1;
    STA.L $7E8062                                                        ;A9C0D4;
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch      ;A9C0D8;
    STA.W $0FA8                                                          ;A9C0DB;
    LDA.W #$0010                                                         ;A9C0DE;
    STA.W $0FB2                                                          ;A9C0E1; fallthrough to Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch

Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch:
    DEC.W $0FB2                                                          ;A9C0E4;
    BPL Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return     ;A9C0E7;
    LDA.W #InstList_MotherBrainHead_Stretching_Phase3_0                  ;A9C0E9;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C0EC;
    LDA.W #Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid         ;A9C0EF;
    STA.W $0FA8                                                          ;A9C0F2;
    LDA.W #$0080                                                         ;A9C0F5;
    STA.W $0FB2                                                          ;A9C0F8; fallthrough to Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid

Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid:
    DEC.W $0FB2                                                          ;A9C0FB;
    BPL Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return     ;A9C0FE;
    LDY.W #$0004                                                         ;A9C100;
    LDA.W #$0050                                                         ;A9C103;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9C106;
    BCC Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return     ;A9C109;
    LDA.W #Func_MBBody_Phase2_ReviveSelf_PrepareNeckForBabyMetroidDeath  ;A9C10B;
    STA.W $0FA8                                                          ;A9C10E;
    LDA.W #$0002                                                         ;A9C111;
    STA.L $7E783E                                                        ;A9C114;
    DEC A                                                                ;A9C118;
    STA.L $7E7862                                                        ;A9C119;

Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return:
    RTS                                                                  ;A9C11D;


Func_MBBody_Phase2_ReviveSelf_PrepareNeckForBabyMetroidDeath:
    LDA.W #$0000                                                         ;A9C11E;
    STA.L $7E7826                                                        ;A9C121;
    LDA.W #$0001                                                         ;A9C125;
    STA.L $7E8062                                                        ;A9C128;
    LDA.W #$0002                                                         ;A9C12C;
    STA.L $7E8064                                                        ;A9C12F;
    LDA.W #$0004                                                         ;A9C133;
    STA.L $7E8066                                                        ;A9C136;
    LDA.W #$0040                                                         ;A9C13A;
    STA.L $7E8068                                                        ;A9C13D;
    LDA.W #Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath   ;A9C141;
    STA.W $0FA8                                                          ;A9C144; fallthrough to Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath

Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath:
    JSR.W MakeMotherBrainStandUp                                         ;A9C147;
    BCS .standing                                                        ;A9C14A;
    RTS                                                                  ;A9C14C;


.standing:
    LDA.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack        ;A9C14D;
    STA.W $0FA8                                                          ;A9C150;
    LDY.W #$000A                                                         ;A9C153;
    LDA.W #$0050                                                         ;A9C156;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9C159; fallthrough to Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack

Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack:
    JSR.W MaybeMakeMotherBrainStandUpOrLeanDown                          ;A9C15C;
    LDA.W $05E5                                                          ;A9C15F;
    BMI +                                                                ;A9C162;
    RTS                                                                  ;A9C164;


  + LDY.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3    ;A9C165;
    LDA.L $7E7854                                                        ;A9C168;
    BEQ .zeroIndex                                                       ;A9C16C;
    LDY.W #InstList_MotherBrainHead_Attacking_BabyMetroid                ;A9C16E;

.zeroIndex:
    TYA                                                                  ;A9C171;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C172;
    LDA.W #Function_MBBody_Phase2_KillBabyMetroid_AttackCooldown         ;A9C175;
    STA.W $0FA8                                                          ;A9C178;
    LDA.W #$0040                                                         ;A9C17B;
    STA.W $0FB2                                                          ;A9C17E;

Function_MBBody_Phase2_KillBabyMetroid_return:
    RTS                                                                  ;A9C181;


Function_MBBody_Phase2_KillBabyMetroid_AttackCooldown:
    DEC.W $0FB2                                                          ;A9C182;
    BPL Function_MBBody_Phase2_KillBabyMetroid_return                    ;A9C185;
    LDA.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack        ;A9C187;
    STA.W $0FA8                                                          ;A9C18A;

RTS_A9C18D:
    RTS                                                                  ;A9C18D;


Function_MBBody_Phase2_PrepareForFinalBabyMetroidAttack:
    JSR.W MakeMotherBrainStandUp                                         ;A9C18E;
    LDY.W #$0004                                                         ;A9C191;
    LDA.W #$0040                                                         ;A9C194;
    JMP.W MakeMotherBrainWalkBackwards                                   ;A9C197;


Function_MBBody_Phase2_ExecuteFinalBabyMetroidAttack:
    LDA.W #InstList_MotherBrainHead_Attacking_BabyMetroid                ;A9C19A;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C19D;
    LDA.W #RTS_A9C1A6                                                    ;A9C1A0;
    STA.W $0FA8                                                          ;A9C1A3;

RTS_A9C1A6:
    RTS                                                                  ;A9C1A6;


MaybeMakeMotherBrainStandUpOrLeanDown:
    LDA.L $7E7804                                                        ;A9C1A7;
    BEQ .standing                                                        ;A9C1AB;
    CMP.W #$0006                                                         ;A9C1AD;
    BNE .return                                                          ;A9C1B0;
    LDA.W $05E5                                                          ;A9C1B2;
    AND.W #$00FF                                                         ;A9C1B5;
    CMP.W #$00C0                                                         ;A9C1B8;
    BCC .return                                                          ;A9C1BB;
    JMP.W MakeMotherBrainStandUp                                         ;A9C1BD;


.standing:
    LDA.W $05E5                                                          ;A9C1C0;
    AND.W #$00FF                                                         ;A9C1C3;
    CMP.W #$00C0                                                         ;A9C1C6;
    BCC .return                                                          ;A9C1C9;
    JMP.W MakeMotherBrainLeanDown                                        ;A9C1CB;


.return:
    RTS                                                                  ;A9C1CE;


Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance:
    LDA.W #$0004                                                         ;A9C1CF;
    STA.L $7E7800                                                        ;A9C1D2;
    LDA.W #Function_MBBody_Phase3_RecoverFromCutscene_SetupForFighting   ;A9C1D6;
    STA.W $0FA8                                                          ;A9C1D9;
    LDA.W #$0020                                                         ;A9C1DC;
    STA.W $0FB2                                                          ;A9C1DF;
    LDA.W $0F7A                                                          ;A9C1E2;
    SEC                                                                  ;A9C1E5;
    SBC.W #$000E                                                         ;A9C1E6;
    LDY.W #$0002                                                         ;A9C1E9;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C1EC;

Function_MotherBrainBody_Phase3_RecoverFromCutscene_return:
    RTS                                                                  ;A9C1EF;


Function_MBBody_Phase3_RecoverFromCutscene_SetupForFighting:
    DEC.W $0FB2                                                          ;A9C1F0;
    BPL Function_MotherBrainBody_Phase3_RecoverFromCutscene_return       ;A9C1F3;
    LDA.W #Function_MBBody_Phase3_Fighting_Main                          ;A9C1F5;
    STA.W $0FA8                                                          ;A9C1F8;
    LDA.W #Function_MotherBrainNeck_Normal                               ;A9C1FB;
    STA.L $7E7870                                                        ;A9C1FE;
    LDA.W #Function_MotherBrainBody_Walking_TryToInchForward             ;A9C202;
    STA.L $7E7874                                                        ;A9C205; fallthrough to Function_MBBody_Phase3_Fighting_Main

Function_MBBody_Phase3_Fighting_Main:
    LDA.W $0FCC                                                          ;A9C209;
    BNE Function_MBBody_Phase3_Fighting_Main_notDead                     ;A9C20C;
    LDA.W #Function_MBBody_Phase3_DeathSequence_MoveToBackOfRoom         ;A9C20E;
    STA.W $0FA8                                                          ;A9C211;

Function_MBBody_Phase3_Fighting_Main_return:
    RTS                                                                  ;A9C214;


Function_MBBody_Phase3_Fighting_Main_notDead:
    JSR.W MotherBrainPhase3NeckHandler                                   ;A9C215;
    JSR.W MotherBrainPhase3WalkingHandler                                ;A9C218;
    LDA.L $7E7804                                                        ;A9C21B;
    BNE Function_MBBody_Phase3_Fighting_Main_return                      ;A9C21F;
    LDA.L $7E780C                                                        ;A9C221;
    BNE Function_MBBody_Phase3_Fighting_Main_return                      ;A9C225;
    LDA.W $05E5                                                          ;A9C227;
    BPL Function_MBBody_Phase3_Fighting_Main_return                      ;A9C22A;
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase3                ;A9C22C;
    LDA.W $05E5                                                          ;A9C22F;
    AND.W #$00FF                                                         ;A9C232;
    CMP.W #$0080                                                         ;A9C235;
    BCC Function_MBBody_Phase3_Fighting_Main_lessThan80                  ;A9C238;
    LDY.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3    ;A9C23A;

Function_MBBody_Phase3_Fighting_Main_lessThan80:
    TYA                                                                  ;A9C23D;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C23E;
    LDA.W #Function_MBBody_Phase3_Fighting_AttackCooldown                ;A9C241;
    STA.W $0FA8                                                          ;A9C244;
    LDA.W #$0040                                                         ;A9C247;
    STA.W $0FB2                                                          ;A9C24A;
    RTS                                                                  ;A9C24D;


Function_MBBody_Phase3_Fighting_AttackCooldown:
    DEC.W $0FB2                                                          ;A9C24E;
    BPL Function_MBBody_Phase3_Fighting_Main_return                      ;A9C251;
    LDA.W #Function_MBBody_Phase3_Fighting_Main                          ;A9C253;
    STA.W $0FA8                                                          ;A9C256;
    RTS                                                                  ;A9C259;


MotherBrainPhase3WalkingHandler:
    LDA.L $7E7804                                                        ;A9C25A;
    BEQ .standing                                                        ;A9C25E;
    RTS                                                                  ;A9C260;


.standing:
    LDA.L $7E7874                                                        ;A9C261;
    STA.B $12                                                            ;A9C265;
    JMP.W ($0012)                                                        ;A9C267;


Function_MotherBrainBody_Walking_TryToInchForward:
    LDA.L $7E780E                                                        ;A9C26A;
    BEQ .walkLeft                                                        ;A9C26E;
    CLC                                                                  ;A9C270;
    ADC.W #$0020                                                         ;A9C271;
    STA.L $7E780E                                                        ;A9C274;
    CMP.W #$0100                                                         ;A9C278;
    BCC .return                                                          ;A9C27B;
    LDA.W $0F7A                                                          ;A9C27D;
    INC A                                                                ;A9C280;
    STA.L $7E7876                                                        ;A9C281;
    LDA.W $05E5                                                          ;A9C285;
    AND.W #$0002                                                         ;A9C288;
    CLC                                                                  ;A9C28B;
    ADC.W #$0004                                                         ;A9C28C;
    TAY                                                                  ;A9C28F;
    LDA.L $7E7876                                                        ;A9C290;
    JSR.W MakeMotherBrainWalkForwards                                    ;A9C294;
    BCC .return                                                          ;A9C297;
    LDA.W #$0080                                                         ;A9C299;
    STA.L $7E780E                                                        ;A9C29C;

.return:
    RTS                                                                  ;A9C2A0;


.walkLeft:
    LDA.W $0F7A                                                          ;A9C2A1;
    SEC                                                                  ;A9C2A4;
    SBC.W #$000E                                                         ;A9C2A5;
    STA.L $7E7876                                                        ;A9C2A8;
    LDA.W #Function_MotherBrainBody_Walking_RetreatQuickly               ;A9C2AC;
    STA.L $7E7874                                                        ;A9C2AF; fallthrough to Function_MotherBrainBody_Walking_RetreatQuickly

Function_MotherBrainBody_Walking_RetreatQuickly:
    LDA.L $7E7876                                                        ;A9C2B3;
    LDY.W #$0002                                                         ;A9C2B7;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C2BA;
    BCC .return                                                          ;A9C2BD;
    LDA.W $0F7A                                                          ;A9C2BF;
    SEC                                                                  ;A9C2C2;
    SBC.W #$000E                                                         ;A9C2C3;
    STA.L $7E7876                                                        ;A9C2C6;
    LDA.W #Function_MotherBrainBody_Walking_RetreatSlowly                ;A9C2CA;
    STA.L $7E7874                                                        ;A9C2CD;

.return:
    RTS                                                                  ;A9C2D1;


Function_MotherBrainBody_Walking_RetreatSlowly:
    LDA.L $7E7876                                                        ;A9C2D2;
    LDY.W #$0004                                                         ;A9C2D6;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C2D9;
    BCS .reachedTargetX                                                  ;A9C2DC;
    RTS                                                                  ;A9C2DE;


.reachedTargetX:
    LDA.W #$0040                                                         ;A9C2DF;
    JMP.W SetMotherBrainWalkingFunctionToTryToInchForward                ;A9C2E2;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Function_MotherBrainBody_Walking_Crouch_A9C2E5:
    JSR.W MakeMotherBrainCrouch                                          ;A9C2E5;
    BCC UNUSED_Function_MotherBrainBody_Walking_Crouch_return_A9C2F8     ;A9C2E8;
    LDA.W #UNUSED_Function_MotherBrainBody_Walking_Crouching_A9C2F9      ;A9C2EA;
    STA.L $7E7874                                                        ;A9C2ED;
    LDA.W #$0040                                                         ;A9C2F1;
    STA.L $7E7878                                                        ;A9C2F4;

UNUSED_Function_MotherBrainBody_Walking_Crouch_return_A9C2F8:
    RTS                                                                  ;A9C2F8;


UNUSED_Function_MotherBrainBody_Walking_Crouching_A9C2F9:
    LDA.L $7E7878                                                        ;A9C2F9;
    DEC A                                                                ;A9C2FD;
    STA.L $7E7878                                                        ;A9C2FE;
    BPL UNUSED_Function_MotherBrainBody_Walking_Crouch_return_A9C2F8     ;A9C302;
    LDA.W #UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B        ;A9C304;
    STA.L $7E7874                                                        ;A9C307;

UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B:
    JSR.W MakeMotherBrainStandUp                                         ;A9C30B;
    BCC UNUSED_Function_MotherBrainBody_Walking_Crouch_return_A9C2F8     ;A9C30E;
    LDA.W #$00C0                                                         ;A9C310; fallthrough to SetMotherBrainWalkingFunctionToTryToInchForward
endif ; !FEATURE_KEEP_UNREFERENCED

SetMotherBrainWalkingFunctionToTryToInchForward:
    STA.L $7E780E                                                        ;A9C313;
    LDA.W #Function_MotherBrainBody_Walking_TryToInchForward             ;A9C317;
    STA.L $7E7874                                                        ;A9C31A;
    LDA.W $0F7A                                                          ;A9C31E;
    INC A                                                                ;A9C321;
    STA.L $7E7876                                                        ;A9C322;
    RTS                                                                  ;A9C326;


MotherBrainPhase3NeckHandler:
    LDA.L $7E7870                                                        ;A9C327;
    STA.B $12                                                            ;A9C32B;
    JMP.W ($0012)                                                        ;A9C32D;


Function_MotherBrainNeck_Normal:
    LDA.W #$0001                                                         ;A9C330;
    STA.L $7E8064                                                        ;A9C333; >_<
    LDA.W #$0080                                                         ;A9C337;
    STA.L $7E8068                                                        ;A9C33A;
    LDA.W #$0002                                                         ;A9C33E;
    STA.L $7E8064                                                        ;A9C341;
    LDA.W #$0004                                                         ;A9C345;
    STA.L $7E8066                                                        ;A9C348;
    LDA.W #RTS_A9C353                                                    ;A9C34C;
    STA.L $7E7870                                                        ;A9C34F;

RTS_A9C353:
    RTS                                                                  ;A9C353;


Function_MotherBrainNeck_SetupRecoilRecovery:
    LDA.W #$0001                                                         ;A9C354;
    STA.L $7E8062                                                        ;A9C357;
    LDA.W #$0500                                                         ;A9C35B;
    STA.L $7E8068                                                        ;A9C35E;
    LDA.W #$0006                                                         ;A9C362;
    STA.L $7E8064                                                        ;A9C365;
    STA.L $7E8066                                                        ;A9C369;
    LDA.W #Function_MotherBrainNeck_RecoilRecovery                       ;A9C36D;
    STA.L $7E7870                                                        ;A9C370;
    LDA.W #$0010                                                         ;A9C374;
    STA.L $7E7872                                                        ;A9C377; fallthrough to Function_MotherBrainNeck_RecoilRecovery

Function_MotherBrainNeck_RecoilRecovery:
    LDA.L $7E7872                                                        ;A9C37B;
    DEC A                                                                ;A9C37F;
    BMI .timerExpired                                                    ;A9C380;
    STA.L $7E7872                                                        ;A9C382;
    RTS                                                                  ;A9C386;


.timerExpired:
    LDA.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3    ;A9C387;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C38A;
    LDA.W #Function_MotherBrainNeck_Normal                               ;A9C38D;
    STA.L $7E7870                                                        ;A9C390;
    RTS                                                                  ;A9C394;


Function_MotherBrainNeck_SetupHyperBeamRecoil:
    LDA.W #$0001                                                         ;A9C395;
    STA.L $7E8062                                                        ;A9C398;
    STA.L $7E780C                                                        ;A9C39C;
    LDA.W #InstList_MotherBrainHead_HyperBeamRecoil_0                    ;A9C3A0;
    JSR.W SetMotherBrainHeadInstList                                     ;A9C3A3;
    LDA.W #$0032                                                         ;A9C3A6;
    STA.L $7E7840                                                        ;A9C3A9;
    LDA.W #$0900                                                         ;A9C3AD;
    STA.L $7E8068                                                        ;A9C3B0;
    LDA.W #$0008                                                         ;A9C3B4;
    STA.L $7E8064                                                        ;A9C3B7;
    STA.L $7E8066                                                        ;A9C3BB;
    LDA.W #Function_MotherBrainNeck_HyperBeamRecoil                      ;A9C3BF;
    STA.L $7E7870                                                        ;A9C3C2;
    LDA.W #$000B                                                         ;A9C3C6;
    STA.L $7E7872                                                        ;A9C3C9; fallthrough to Function_MotherBrainNeck_HyperBeamRecoil

Function_MotherBrainNeck_HyperBeamRecoil:
    LDA.L $7E7872                                                        ;A9C3CD;
    DEC A                                                                ;A9C3D1;
    BMI .timerExpired                                                    ;A9C3D2;
    STA.L $7E7872                                                        ;A9C3D4;
    RTS                                                                  ;A9C3D8;


.timerExpired:
    LDA.W #$0080                                                         ;A9C3D9;
    STA.L $7E8068                                                        ;A9C3DC;
    LDA.W #$0000                                                         ;A9C3E0;
    STA.L $7E780C                                                        ;A9C3E3;
    LDA.W #Function_MotherBrainNeck_SetupRecoilRecovery                  ;A9C3E7;
    STA.L $7E7870                                                        ;A9C3EA;
    RTS                                                                  ;A9C3EE;


MoveEnemyAccordingToVelocity:
    LDX.W $0E54                                                          ;A9C3EF;
    LDA.W $0FAA,X                                                        ;A9C3F2;
    SEP #$20                                                             ;A9C3F5;
    CLC                                                                  ;A9C3F7;
    ADC.W $0F7D,X                                                        ;A9C3F8;
    STA.W $0F7D,X                                                        ;A9C3FB;
    REP #$20                                                             ;A9C3FE;
    AND.W #$FF00                                                         ;A9C400;
    XBA                                                                  ;A9C403;
    BPL +                                                                ;A9C404;
    ORA.W #$FF00                                                         ;A9C406;

  + ADC.W $0F7A,X                                                        ;A9C409;
    STA.W $0F7A,X                                                        ;A9C40C;
    LDA.W $0FAC,X                                                        ;A9C40F;
    SEP #$20                                                             ;A9C412;
    CLC                                                                  ;A9C414;
    ADC.W $0F81,X                                                        ;A9C415;
    STA.W $0F81,X                                                        ;A9C418;
    REP #$20                                                             ;A9C41B;
    AND.W #$FF00                                                         ;A9C41D;
    XBA                                                                  ;A9C420;
    BPL +                                                                ;A9C421;
    ORA.W #$FF00                                                         ;A9C423;

  + ADC.W $0F7E,X                                                        ;A9C426;
    STA.W $0F7E,X                                                        ;A9C429;
    RTL                                                                  ;A9C42C;


SetMotherBrainBodyInstList:
    STA.W $0F92                                                          ;A9C42D;
    LDA.W #$0001                                                         ;A9C430;
    STA.W $0F94                                                          ;A9C433;
    STZ.W $0F90                                                          ;A9C436;
    RTS                                                                  ;A9C439;


SetMotherBrainHeadUnusedInstList:
    STA.W $0FD2                                                          ;A9C43A;
    LDA.W #$0001                                                         ;A9C43D;
    STA.W $0FD4                                                          ;A9C440;
    STZ.W $0FD0                                                          ;A9C443;
    RTS                                                                  ;A9C446;


SetMotherBrainHeadInstList:
    STA.L $7E8002                                                        ;A9C447;
    LDA.W #$0001                                                         ;A9C44B;
    STA.L $7E8000                                                        ;A9C44E;
    RTS                                                                  ;A9C452;


SetEnemyInstList:
    STA.W $0F92,X                                                        ;A9C453;
    LDA.W #$0001                                                         ;A9C456;
    STA.W $0F94,X                                                        ;A9C459;
    STZ.W $0F90,X                                                        ;A9C45C;
    RTL                                                                  ;A9C45F;


GetSineMathInA_A9C460:
    TAY                                                                  ;A9C460;
    LDA.B $12                                                            ;A9C461;
    BRA GetSineMathInA_A9C46C                                            ;A9C463;


GetCosineMathInA_A9C465:
    TAY                                                                  ;A9C465;
    LDA.B $12                                                            ;A9C466;
    CLC                                                                  ;A9C468;
    ADC.W #$0040                                                         ;A9C469;

GetSineMathInA_A9C46C:
    PHX                                                                  ;A9C46C;
    ASL A                                                                ;A9C46D;
    AND.W #$01FE                                                         ;A9C46E;
    TAX                                                                  ;A9C471;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;A9C472;
    SEP #$20                                                             ;A9C476;
    STA.L $00211B                                                        ;A9C478;
    XBA                                                                  ;A9C47C;
    STA.L $00211B                                                        ;A9C47D;
    TYA                                                                  ;A9C481;
    STA.L $00211C                                                        ;A9C482;
    REP #$20                                                             ;A9C486;
    LDA.L $002135                                                        ;A9C488;
    PLX                                                                  ;A9C48C;
    RTL                                                                  ;A9C48D;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_AddADividedBy100ToEnemyXPosition_A9C48E:
    SEP #$20                                                             ;A9C48E;
    CLC                                                                  ;A9C490;
    ADC.W $0F7D,X                                                        ;A9C491;
    STA.W $0F7D,X                                                        ;A9C494;
    REP #$20                                                             ;A9C497;
    AND.W #$FF00                                                         ;A9C499;
    XBA                                                                  ;A9C49C;
    BPL +                                                                ;A9C49D;
    ORA.W #$FF00                                                         ;A9C49F;

  + ADC.W $0F7A,X                                                        ;A9C4A2;
    STA.W $0F7A,X                                                        ;A9C4A5;
    RTS                                                                  ;A9C4A8;
endif ; !FEATURE_KEEP_UNREFERENCED


AddADividedBy100ToEnemyYPosition:
    SEP #$20                                                             ;A9C4A9;
    CLC                                                                  ;A9C4AB;
    ADC.W $0F81,X                                                        ;A9C4AC;
    STA.W $0F81,X                                                        ;A9C4AF;
    REP #$20                                                             ;A9C4B2;
    AND.W #$FF00                                                         ;A9C4B4;
    XBA                                                                  ;A9C4B7;
    BPL +                                                                ;A9C4B8;
    ORA.W #$FF00                                                         ;A9C4BA;

  + ADC.W $0F7E,X                                                        ;A9C4BD;
    STA.W $0F7E,X                                                        ;A9C4C0;
    RTS                                                                  ;A9C4C3;


DecrementAmmoDueToRainbowBeam:
    LDA.W $0E44                                                          ;A9C4C4;
    AND.W #$0003                                                         ;A9C4C7;
    BNE .superMissiles                                                   ;A9C4CA;
    LDA.W $09C6                                                          ;A9C4CC;
    BEQ .superMissiles                                                   ;A9C4CF;
    SEC                                                                  ;A9C4D1;
    SBC.W .decrementValue                                                ;A9C4D2;
    CMP.W #$0001                                                         ;A9C4D5;
    BPL .writeMissiles                                                   ;A9C4D8;
    LDA.W $09D2                                                          ;A9C4DA;
    CMP.W #$0001                                                         ;A9C4DD;
    BNE .resetAutoCancel                                                 ;A9C4E0;
    LDA.W #$0000                                                         ;A9C4E2;
    STA.W $09D2                                                          ;A9C4E5;

.resetAutoCancel:
    LDA.W #$0000                                                         ;A9C4E8;
    STA.W $0A04                                                          ;A9C4EB;

.writeMissiles:
    STA.W $09C6                                                          ;A9C4EE;

.superMissiles:
    LDA.W $0E44                                                          ;A9C4F1;
    AND.W #$0003                                                         ;A9C4F4;
    BNE .powerBombs                                                      ;A9C4F7;
    LDA.W $09CA                                                          ;A9C4F9;
    BEQ .powerBombs                                                      ;A9C4FC;
    SEC                                                                  ;A9C4FE;
    SBC.W .decrementValue                                                ;A9C4FF;
    CMP.W #$0001                                                         ;A9C502;
    BPL .writeSuperMissiles                                              ;A9C505;
    LDA.W $09D2                                                          ;A9C507;
    CMP.W #$0002                                                         ;A9C50A;
    BNE ..resetAutoCancel                                                ;A9C50D;
    LDA.W #$0000                                                         ;A9C50F;
    STA.W $09D2                                                          ;A9C512;

..resetAutoCancel:
    LDA.W #$0000                                                         ;A9C515;
    STA.W $0A04                                                          ;A9C518;

.writeSuperMissiles:
    STA.W $09CA                                                          ;A9C51B;

.powerBombs:
    LDA.W $09CE                                                          ;A9C51E;
    BEQ .return                                                          ;A9C521;
    SEC                                                                  ;A9C523;
    SBC.W .decrementValue                                                ;A9C524;
    CMP.W #$0001                                                         ;A9C527;
    BPL .writePowerBombs                                                 ;A9C52A;
    LDA.W $09D2                                                          ;A9C52C;
    CMP.W #$0003                                                         ;A9C52F;
    BNE ..resetAutoCancel                                                ;A9C532;
    LDA.W #$0000                                                         ;A9C534;
    STA.W $09D2                                                          ;A9C537;

..resetAutoCancel:
    LDA.W #$0000                                                         ;A9C53A;
    STA.W $0A04                                                          ;A9C53D;

.writePowerBombs:
    STA.W $09CE                                                          ;A9C540;

.return:
    RTS                                                                  ;A9C543;


.decrementValue:
    dw $0001                                                             ;A9C544;

HandlePlayingGainingLosingIncrementalEnergySFX:
    PHA                                                                  ;A9C546;
    LDA.W $09C2                                                          ;A9C547;
    CMP.W #$0051                                                         ;A9C54A;
    BMI .return                                                          ;A9C54D;
    LDA.W $0E44                                                          ;A9C54F;
    AND.W #$0007                                                         ;A9C552;
    BNE .return                                                          ;A9C555;
    LDA.W #$002D                                                         ;A9C557;
    JSL.L QueueSound_Lib3_Max3                                           ;A9C55A;

.return:
    PLA                                                                  ;A9C55E;
    RTS                                                                  ;A9C55F;


DamageSamusDueToBabyMetroid:
    LDY.W #$FFFC                                                         ;A9C560;
    LDA.W $09A2                                                          ;A9C563;
    LSR A                                                                ;A9C566;
    BCC .varia                                                           ;A9C567;
    LDY.W #$FFFD                                                         ;A9C569;

.varia:
    TYA                                                                  ;A9C56C;
    ADC.W $09C2                                                          ;A9C56D;
    CMP.W #$0002                                                         ;A9C570;
    BPL .done                                                            ;A9C573;
    CLC                                                                  ;A9C575;
    LDA.W #$0001                                                         ;A9C576;

.done:
    STA.W $09C2                                                          ;A9C579;
    RTL                                                                  ;A9C57C;


DamageSamusDueToRainbowBeam:
    LDY.W #$FFFE                                                         ;A9C57D;
    LDA.W $09A2                                                          ;A9C580;
    LSR A                                                                ;A9C583;
    BCC .varia                                                           ;A9C584;
    LDY.W #$FFFE                                                         ;A9C586;

.varia:
    TYA                                                                  ;A9C589;
    ADC.W $09C2                                                          ;A9C58A;
    CMP.W #$0001                                                         ;A9C58D;
    BPL .done                                                            ;A9C590;
    CLC                                                                  ;A9C592;
    LDA.W #$0000                                                         ;A9C593;

.done:
    STA.W $09C2                                                          ;A9C596;
    PHP                                                                  ;A9C599;
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX                 ;A9C59A;
    PLP                                                                  ;A9C59D;
    RTL                                                                  ;A9C59E;


HealSamusDueToBabyMetroid:
    LDA.W #$0001                                                         ;A9C59F;
    CLC                                                                  ;A9C5A2;
    ADC.W $09C2                                                          ;A9C5A3;
    CMP.W $09C4                                                          ;A9C5A6;
    BMI .notMaxed                                                        ;A9C5A9;
    LDA.W $09C4                                                          ;A9C5AB;
    STA.W $09C2                                                          ;A9C5AE;
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX                 ;A9C5B1;
    CLC                                                                  ;A9C5B4;
    RTL                                                                  ;A9C5B5;


.notMaxed:
    STA.W $09C2                                                          ;A9C5B6;
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX                 ;A9C5B9;
    SEC                                                                  ;A9C5BC;
    RTL                                                                  ;A9C5BD;


ProcessSpriteTilesTransfers:
    LDA.L $7E8004                                                        ;A9C5BE;
    BNE +                                                                ;A9C5C2;
    TXA                                                                  ;A9C5C4;

  + TAX                                                                  ;A9C5C5;
    LDY.W $0330                                                          ;A9C5C6;
    LDA.W $0000,X                                                        ;A9C5C9;
    BEQ +                                                                ;A9C5CC;
    STA.W $00D0,Y                                                        ;A9C5CE;
    LDA.W $0003,X                                                        ;A9C5D1;
    STA.W $00D3,Y                                                        ;A9C5D4;
    LDA.W $0002,X                                                        ;A9C5D7;
    STA.W $00D2,Y                                                        ;A9C5DA;
    LDA.W $0005,X                                                        ;A9C5DD;
    STA.W $00D5,Y                                                        ;A9C5E0;
    TYA                                                                  ;A9C5E3;
    CLC                                                                  ;A9C5E4;
    ADC.W #$0007                                                         ;A9C5E5;
    STA.W $0330                                                          ;A9C5E8;
    TXA                                                                  ;A9C5EB;
    ADC.W #$0007                                                         ;A9C5EC;
    STA.L $7E8004                                                        ;A9C5EF;
    TAX                                                                  ;A9C5F3;
    LDA.W $0000,X                                                        ;A9C5F4;
    BEQ +                                                                ;A9C5F7;
    CLC                                                                  ;A9C5F9;
    RTS                                                                  ;A9C5FA;


  + STA.L $7E8004                                                        ;A9C5FB;
    SEC                                                                  ;A9C5FF;
    RTS                                                                  ;A9C600;


MakeMotherBrainWalkForwards:
    CMP.W $0F7A                                                          ;A9C601;
    BMI .returnReachedTarget                                             ;A9C604;
    LDA.L $7E7804                                                        ;A9C606;
    BNE .returnNotReached                                                ;A9C60A;
    LDA.W $0F7A                                                          ;A9C60C;
    CMP.W #$0080                                                         ;A9C60F;
    BPL .returnReachedTarget                                             ;A9C612;
    LDA.W .pointers,Y                                                    ;A9C614;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C617;

.returnNotReached:
    CLC                                                                  ;A9C61A;
    RTS                                                                  ;A9C61B;


.returnReachedTarget:
    SEC                                                                  ;A9C61C;
    RTS                                                                  ;A9C61D;


.pointers:
    dw .pointers                                                         ;A9C61E;
    dw InstList_MotherBrainBody_WalkingForwards_ReallyFast               ;A9C620;
    dw InstList_MotherBrainBody_WalkingForwards_Fast                     ;A9C622;
    dw InstList_MotherBrainBody_WalkingForwards_Medium                   ;A9C624;
    dw InstList_MotherBrainBody_WalkingForwards_Slow                     ;A9C626;
    dw InstList_MotherBrainBody_WalkingForwards_ReallySlow               ;A9C628;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_MakeMotherBrainWalkBackwards_A9C62A:
    CMP.W $0F7A                                                          ;A9C62A;
    BPL .returnCarrySet                                                  ;A9C62D;
    LDA.L $7E7804                                                        ;A9C62F;
    BNE .returnCarryClear                                                ;A9C633;
    LDA.W $0F7A                                                          ;A9C635;
    CMP.W #$0010                                                         ;A9C638;
    BMI .returnCarrySet                                                  ;A9C63B;
    LDA.W MakeMotherBrainWalkBackwards_pointers,Y                        ;A9C63D;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C640;

.returnCarryClear:
    CLC                                                                  ;A9C643;
    RTS                                                                  ;A9C644;


.returnCarrySet:
    SEC                                                                  ;A9C645;
    RTS                                                                  ;A9C646;
endif ; !FEATURE_KEEP_UNREFERENCED


MakeMotherBrainWalkBackwards:
    CMP.W $0F7A                                                          ;A9C647;
    BPL .returnTargetReached                                             ;A9C64A;
    LDA.L $7E7804                                                        ;A9C64C;
    BNE .returnNotReached                                                ;A9C650;
    LDA.W $0F7A                                                          ;A9C652;
    CMP.W #$0030                                                         ;A9C655;
    BMI .returnTargetReached                                             ;A9C658;
    LDA.W MakeMotherBrainWalkBackwards_pointers,Y                        ;A9C65A;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C65D;

.returnNotReached:
    CLC                                                                  ;A9C660;
    RTS                                                                  ;A9C661;


.returnTargetReached:
    SEC                                                                  ;A9C662;
    RTS                                                                  ;A9C663;


MakeMotherBrainWalkBackwards_pointers:
    dw MakeMotherBrainWalkBackwards_pointers                             ;A9C664;
    dw InstList_MotherBrainBody_WalkingBackwards_ReallyFast              ;A9C666;
    dw InstList_MotherBrainBody_WalkingBackwards_Fast                    ;A9C668;
    dw InstList_MotherBrainBody_WalkingBackwards_Medium                  ;A9C66A;
    dw InstList_MotherBrainBody_WalkingBackwards_Slow                    ;A9C66C;
    dw InstList_MotherBrainBody_WalkingBackwards_ReallySlow              ;A9C66E;

MakeMotherBrainStandUp:
    LDA.L $7E7804                                                        ;A9C670;
    BEQ .returnStanding                                                  ;A9C674;
    LDY.W #InstList_MotherBrainBody_StandingUpAfterCrouching_Fast        ;A9C676;
    CMP.W #$0003                                                         ;A9C679;
    BEQ .standFast                                                       ;A9C67C;
    CMP.W #$0006                                                         ;A9C67E;
    BNE .returnNotStanding                                               ;A9C681;
    LDY.W #InstList_MotherBrainBody_StandingUpAfterLeaningDown           ;A9C683;

.standFast:
    TYA                                                                  ;A9C686;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C687;

.returnNotStanding:
    CLC                                                                  ;A9C68A;
    RTS                                                                  ;A9C68B;


.returnStanding:
    SEC                                                                  ;A9C68C;
    RTS                                                                  ;A9C68D;


MakeMotherBrainCrouch:
    LDA.L $7E7804                                                        ;A9C68E;
    BEQ .crouchSlow                                                      ;A9C692;
    CMP.W #$0003                                                         ;A9C694;
    BNE .notCrouched                                                     ;A9C697;
    SEC                                                                  ;A9C699;
    RTS                                                                  ;A9C69A;


.crouchSlow:
    LDA.W #InstList_MotherBrainBody_Crouch_Slow                          ;A9C69B;

.setToCrouch:
    JSR.W SetMotherBrainBodyInstList                                     ;A9C69E;

.notCrouched:
    CLC                                                                  ;A9C6A1;
    RTS                                                                  ;A9C6A2;


MakeMotherBrainLeanDown:
    LDA.L $7E7804                                                        ;A9C6A3;
    BEQ .leanDown                                                        ;A9C6A7;
    CMP.W #$0006                                                         ;A9C6A9;
    BNE .notLeaningDown                                                  ;A9C6AC;
    SEC                                                                  ;A9C6AE;
    RTS                                                                  ;A9C6AF;


.leanDown:
    LDA.W #InstList_MotherBrainBody_LeaningDown                          ;A9C6B0;
    JSR.W SetMotherBrainBodyInstList                                     ;A9C6B3;

.notLeaningDown:
    CLC                                                                  ;A9C6B6;
    RTS                                                                  ;A9C6B7;


HandleMotherBrainWalking:
    LDA.L $7E7804                                                        ;A9C6B8;
    BEQ .standing                                                        ;A9C6BC;
    RTS                                                                  ;A9C6BE;


.standing:
    LDA.L $7E780E                                                        ;A9C6BF;
    BEQ .walkBackwards                                                   ;A9C6C3;
    CLC                                                                  ;A9C6C5;
    ADC.W #$0006                                                         ;A9C6C6;
    STA.L $7E780E                                                        ;A9C6C9;
    CMP.W #$0100                                                         ;A9C6CD;
    BCC .maybeWalkForwardsIfFarLeft                                      ;A9C6D0;

.walkForwards:
    LDA.W #$0080                                                         ;A9C6D2;
    STA.L $7E780E                                                        ;A9C6D5;
    LDA.W $0F7A                                                          ;A9C6D9;
    CMP.W #$0080                                                         ;A9C6DC;
    BPL .return                                                          ;A9C6DF;
    LDA.W #InstList_MotherBrainBody_WalkingForwards_Medium               ;A9C6E1;
    JMP.W SetMotherBrainBodyInstList                                     ;A9C6E4;


.walkBackwards:
    LDA.W #$0001                                                         ;A9C6E7;
    STA.L $7E780E                                                        ;A9C6EA;
    LDA.W $0F7A                                                          ;A9C6EE;
    CMP.W #$0030                                                         ;A9C6F1;
    BMI .maybeWalkForwards                                               ;A9C6F4;
    LDA.W #InstList_MotherBrainBody_WalkingBackwards_Fast                ;A9C6F6;
    JMP.W SetMotherBrainBodyInstList                                     ;A9C6F9;


.maybeWalkForwardsIfFarLeft:
    LDA.W $0F7A                                                          ;A9C6FC;
    CMP.W #$0030                                                         ;A9C6FF;
    BPL .return                                                          ;A9C702;

.maybeWalkForwards:
    LDA.W $05E5                                                          ;A9C704;
    AND.W #$0FFF                                                         ;A9C707;
    CMP.W #$0FC0                                                         ;A9C70A;
    BPL .walkForwards                                                    ;A9C70D;

.return:
    RTS                                                                  ;A9C70F;


InitAI_BabyMetroidCutscene:
    LDX.W $0E54                                                          ;A9C710;
    LDA.W $0F86,X                                                        ;A9C713;
    ORA.W #$3000                                                         ;A9C716;
    STA.W $0F86,X                                                        ;A9C719;
    LDA.W #$0E00                                                         ;A9C71C;
    STA.W $0F96,X                                                        ;A9C71F;
    LDA.W #InstList_BabyMetroid_Initial                                  ;A9C722;
    STA.W $0F92,X                                                        ;A9C725;
    LDA.W #$0001                                                         ;A9C728;
    STA.W $0F94,X                                                        ;A9C72B;
    STA.L $7E7808,X                                                      ;A9C72E;
    STZ.W $0F90,X                                                        ;A9C732;
    LDA.W #$000A                                                         ;A9C735;
    STA.W $0FB0,X                                                        ;A9C738;
    LDA.W #$00A0                                                         ;A9C73B;
    STA.W $0F98,X                                                        ;A9C73E;
    LDA.W #$0140                                                         ;A9C741;
    STA.W $0F7A,X                                                        ;A9C744;
    LDA.W #$0060                                                         ;A9C747;
    STA.W $0F7E,X                                                        ;A9C74A;
    STZ.W $0FAA,X                                                        ;A9C74D;
    STZ.W $0FAC,X                                                        ;A9C750;
    LDA.W #$0000                                                         ;A9C753;
    STA.L $7E7812,X                                                      ;A9C756;
    LDA.W #Function_BabyMetroidCutscene_DashOntoScreen                   ;A9C75A;
    STA.W $0FA8,X                                                        ;A9C75D;
    LDA.W #$00F8                                                         ;A9C760;
    STA.W $0FB2,X                                                        ;A9C763;
    LDA.W #HandleBabyMetroidCutscenePalette_Normal                       ;A9C766;
    STA.L $7E781E,X                                                      ;A9C769;
    LDY.W #Palette_MotherBrain_BabyMetroid+2                             ;A9C76D;
    LDX.W #$01E2                                                         ;A9C770;
    LDA.W #$000F                                                         ;A9C773;
    JMP.W WriteAColorsFromYtoColorIndexX                                 ;A9C776;


MainAI_BabyMetroidCutscene:
    LDX.W $0E54                                                          ;A9C779;
    STZ.W $0FA2,X                                                        ;A9C77C;
    JSR.W ($0FA8,X)                                                      ;A9C77F;
    JSL.L MoveEnemyAccordingToVelocity                                   ;A9C782;
    JSR.W HandleBabyMetroidCutsceneFlashing                              ;A9C786;
    JSR.W HandleBabyMetroidCutsceneHealthBasedPalette                    ;A9C789;
    LDX.W $0E54                                                          ;A9C78C;
    LDA.L $7E781E,X                                                      ;A9C78F;
    STA.B $12                                                            ;A9C793;
    PEA.W .manualReturn-1                                                ;A9C795;
    JMP.W ($0012)                                                        ;A9C798;


.manualReturn:
    RTL                                                                  ;A9C79B;


HandleBabyMetroidCutsceneFlashing:
    LDY.W #$0E00                                                         ;A9C79C;
    LDA.L $7E780C,X                                                      ;A9C79F;
    BEQ .return                                                          ;A9C7A3;
    DEC A                                                                ;A9C7A5;
    STA.L $7E780C,X                                                      ;A9C7A6;
    AND.W #$0002                                                         ;A9C7AA;
    BEQ .return                                                          ;A9C7AD;
    LDY.W #$0000                                                         ;A9C7AF;

.return:
    TYA                                                                  ;A9C7B2;
    STA.W $0F96,X                                                        ;A9C7B3;
    RTS                                                                  ;A9C7B6;


HandlePlayingBabyMetroidCutsceneCrySFX:
    LDA.L $7E7828                                                        ;A9C7B7;
    BEQ .return                                                          ;A9C7BB;
    LDA.W #$0000                                                         ;A9C7BD;
    STA.L $7E7828                                                        ;A9C7C0;
    LDA.W #$0072                                                         ;A9C7C4;
    JSL.L QueueSound_Lib2_Max6                                           ;A9C7C7;

.return:
    RTS                                                                  ;A9C7CB;


Function_BabyMetroidCutscene_DashOntoScreen:
    DEC.W $0FB2,X                                                        ;A9C7CC;
    BMI .timerExpired                                                    ;A9C7CF;
    RTS                                                                  ;A9C7D1;


.timerExpired:
    LDA.W #$D800                                                         ;A9C7D2;
    STA.L $7E7814,X                                                      ;A9C7D5;
    LDA.W #$0A00                                                         ;A9C7D9;
    STA.L $7E7816,X                                                      ;A9C7DC;
    LDA.W #Function_BabyMetroidCutscene_CurveTowardMotherBrainHead       ;A9C7E0;
    STA.W $0FA8,X                                                        ;A9C7E3;
    LDA.W #$000A                                                         ;A9C7E6;
    STA.W $0FB2,X                                                        ;A9C7E9; fallthrough to Function_BabyMetroidCutscene_CurveTowardMotherBrainHead

Function_BabyMetroidCutscene_CurveTowardMotherBrainHead:
    LDA.W #$FE80                                                         ;A9C7EC;
    STA.B $12                                                            ;A9C7EF;
    LDA.W #$B000                                                         ;A9C7F1;
    STA.B $14                                                            ;A9C7F4;
    LDA.W #$0A00                                                         ;A9C7F6;
    STA.B $16                                                            ;A9C7F9;
    JSR.W UpdateBabyMetroidCutsceneSpeedAndAngle                         ;A9C7FB;
    DEC.W $0FB2,X                                                        ;A9C7FE;
    BMI .timerExpired                                                    ;A9C801;
    RTS                                                                  ;A9C803;


.timerExpired:
    LDA.W #Function_BabyMetroidCutscene_GetRightUpInMotherBrainsFace     ;A9C804;
    STA.W $0FA8,X                                                        ;A9C807;
    LDA.W #$0009                                                         ;A9C80A;
    STA.W $0FB2,X                                                        ;A9C80D;
    RTS                                                                  ;A9C810;


Function_BabyMetroidCutscene_GetRightUpInMotherBrainsFace:
    LDA.W #$FA00                                                         ;A9C811;
    STA.B $12                                                            ;A9C814;
    LDA.W #$8200                                                         ;A9C816;
    STA.B $14                                                            ;A9C819;
    LDA.W #$0E00                                                         ;A9C81B;
    STA.B $16                                                            ;A9C81E;
    JSR.W UpdateBabyMetroidCutsceneSpeedAndAngle                         ;A9C820;
    LDA.W $0FBA                                                          ;A9C823;
    STA.B $12                                                            ;A9C826;
    LDA.W $0FBE                                                          ;A9C828;
    STA.B $14                                                            ;A9C82B;
    LDA.W #$0004                                                         ;A9C82D;
    STA.B $16                                                            ;A9C830;
    STA.B $18                                                            ;A9C832;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9C834;
    BCC .timerExpired                                                    ;A9C838;
    DEC.W $0FB2,X                                                        ;A9C83A;
    BMI .timerExpired                                                    ;A9C83D;
    RTS                                                                  ;A9C83F;


.timerExpired:
    STA.W $0FA8,X                                                        ;A9C840;
    LDA.W #Function_BabyMetroidCutscene_LatchOntoMotherBrain             ;A9C843;
    STA.W $0FA8,X                                                        ;A9C846;
    LDA.W #$0001                                                         ;A9C849;
    JSL.L DrainedSamusController                                         ;A9C84C;
    RTS                                                                  ;A9C850;


Function_BabyMetroidCutscene_LatchOntoMotherBrain:
    LDA.W $0FBA                                                          ;A9C851;
    STA.B $12                                                            ;A9C854;
    LDA.W $0FBE                                                          ;A9C856;
    CLC                                                                  ;A9C859;
    ADC.W #$FFE8                                                         ;A9C85A;
    STA.B $14                                                            ;A9C85D;
    LDY.W #$0000                                                         ;A9C85F;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9C862;
    LDA.W #$0008                                                         ;A9C865;
    STA.B $16                                                            ;A9C868;
    STA.B $18                                                            ;A9C86A;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9C86C;
    BCS .return                                                          ;A9C870;
    LDA.W #Function_BabyMetroidCutscene_SetMotherBrainToStumbleBack      ;A9C872;
    STA.W $0FA8,X                                                        ;A9C875;

.return:
    RTS                                                                  ;A9C878;


Function_BabyMetroidCutscene_SetMotherBrainToStumbleBack:
    LDY.W #$0002                                                         ;A9C879;
    LDA.W $0F7A                                                          ;A9C87C;
    DEC A                                                                ;A9C87F;
    JSR.W MakeMotherBrainWalkBackwards                                   ;A9C880;
    LDA.W #Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody     ;A9C883;
    STA.W $0FA8,X                                                        ;A9C886; fallthrough to Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody

Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody:
    LDA.W $0FBA                                                          ;A9C889;
    CLC                                                                  ;A9C88C;
    ADC.W #$0000                                                         ;A9C88D;
    STA.B $12                                                            ;A9C890;
    LDA.W $0FBE                                                          ;A9C892;
    CLC                                                                  ;A9C895;
    ADC.W #$FFE8                                                         ;A9C896;
    STA.B $14                                                            ;A9C899;
    LDA.W #$0200                                                         ;A9C89B;
    JSR.W AccelerateBabyMetroidTowardsPoint                              ;A9C89E;
    BCS .reachedTarget                                                   ;A9C8A1;
    RTS                                                                  ;A9C8A3;


.reachedTarget:
    STZ.W $0FAA,X                                                        ;A9C8A4;
    STZ.W $0FAC,X                                                        ;A9C8A7;
    LDA.W $0FBA                                                          ;A9C8AA;
    STA.W $0F7A,X                                                        ;A9C8AD;
    LDA.W $0FBE                                                          ;A9C8B0;
    CLC                                                                  ;A9C8B3;
    ADC.W #$FFE8                                                         ;A9C8B4;
    STA.W $0F7E,X                                                        ;A9C8B7;
    LDA.W #InstList_BabyMetroid_DrainingMotherBrain                      ;A9C8BA;
    JSL.L SetEnemyInstList                                               ;A9C8BD;
    LDA.W #Function_BabyMetroidCutscene_WaitForMBToTurnToCorpse          ;A9C8C1;
    STA.W $0FA8,X                                                        ;A9C8C4;
    LDA.W #$0001                                                         ;A9C8C7;
    STA.W $0FB0,X                                                        ;A9C8CA;
    LDA.W #Function_MotherBrainBody_DrainedByBabyMetroid_TakenAback      ;A9C8CD;
    STA.W $0FA8                                                          ;A9C8D0;
    LDA.W #$0040                                                         ;A9C8D3;
    JSL.L QueueSound_Lib1_Max6                                           ;A9C8D6;
    LDA.W #$0001                                                         ;A9C8DA;
    STA.L $7E782C                                                        ;A9C8DD;
    RTS                                                                  ;A9C8E1;


Function_BabyMetroidCutscene_WaitForMBToTurnToCorpse:
    LDA.W $0FA4,X                                                        ;A9C8E2;
    AND.W #$0006                                                         ;A9C8E5;
    TAY                                                                  ;A9C8E8;
    LDA.W ShakingOffsets_X,Y                                             ;A9C8E9;
    CLC                                                                  ;A9C8EC;
    ADC.W $0FBA                                                          ;A9C8ED;
    STA.W $0F7A,X                                                        ;A9C8F0;
    LDA.W ShakingOffsets_Y,Y                                             ;A9C8F3;
    CLC                                                                  ;A9C8F6;
    ADC.W $0FBE                                                          ;A9C8F7;
    CLC                                                                  ;A9C8FA;
    ADC.W #$FFE8                                                         ;A9C8FB;
    STA.W $0F7E,X                                                        ;A9C8FE;
    LDA.L $7E783E                                                        ;A9C901;
    BNE .turnedToCorpse                                                  ;A9C905;
    RTS                                                                  ;A9C907;


.turnedToCorpse:
    LDA.W #Function_BabyMetroidCutscene_StopDraining                     ;A9C908;
    STA.W $0FA8,X                                                        ;A9C90B;
    LDA.W #$0040                                                         ;A9C90E;
    STA.W $0FB2,X                                                        ;A9C911;
    RTS                                                                  ;A9C914;


Function_BabyMetroidCutscene_StopDraining:
    LDA.W $0FBA                                                          ;A9C915;
    STA.W $0F7A,X                                                        ;A9C918;
    LDA.W $0FBE                                                          ;A9C91B;
    CLC                                                                  ;A9C91E;
    ADC.W #$FFE8                                                         ;A9C91F;
    STA.W $0F7E,X                                                        ;A9C922;
    DEC.W $0FB2,X                                                        ;A9C925;
    BMI .timerExpired                                                    ;A9C928;
    RTS                                                                  ;A9C92A;


.timerExpired:
    LDA.W #InstList_BabyMetroid_Initial                                  ;A9C92B;
    JSL.L SetEnemyInstList                                               ;A9C92E;
    LDA.W #$000A                                                         ;A9C932;
    STA.W $0FB0,X                                                        ;A9C935;
    LDA.W #Function_BabyMetroidCutscene_LetGo_SpawnDustClouds            ;A9C938;
    STA.W $0FA8,X                                                        ;A9C93B;
    LDA.W #$0020                                                         ;A9C93E;
    STA.W $0FB2,X                                                        ;A9C941;
    STZ.W $0FAA,X                                                        ;A9C944;
    STZ.W $0FAC,X                                                        ;A9C947;
    RTS                                                                  ;A9C94A;


Function_BabyMetroidCutscene_LetGo_SpawnDustClouds:
    DEC.W $0FB2,X                                                        ;A9C94B;
    BPL Function_BabyMetroidCutscene_MoveToTheCeiling                    ;A9C94E;
    JSR.W SpawnThreeDustCloudsOnMotherBrainHead                          ;A9C950;
    LDA.W #Function_BabyMetroidCutscene_MoveToTheCeiling                 ;A9C953;
    STA.W $0FA8,X                                                        ;A9C956; fallthrough to Function_BabyMetroidCutscene_MoveToTheCeiling

Function_BabyMetroidCutscene_MoveToTheCeiling:
    LDA.W $0FBA                                                          ;A9C959;
    STA.B $12                                                            ;A9C95C;
    LDA.W #$0000                                                         ;A9C95E;
    STA.B $14                                                            ;A9C961;
    LDY.W #$0000                                                         ;A9C963;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9C966;
    LDA.W #$0004                                                         ;A9C969;
    STA.B $16                                                            ;A9C96C;
    STA.B $18                                                            ;A9C96E;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9C970;
    BCC .collision                                                       ;A9C974;
    RTS                                                                  ;A9C976;


.collision:
    LDA.W #$0004                                                         ;A9C977;
    JSL.L DrainedSamusController                                         ;A9C97A;
    LDA.W #Function_BabyMetroidCutscene_MoveToSamus                      ;A9C97E;
    STA.W $0FA8,X                                                        ;A9C981;
    LDA.W #BabyMetroidCutscene_MovementTable_CeilingToSamus              ;A9C984;
    STA.L $7E781C,X                                                      ;A9C987;
    RTS                                                                  ;A9C98B;


SpawnThreeDustCloudsOnMotherBrainHead:
    LDA.W #$FFF8                                                         ;A9C98C;
    STA.B $14                                                            ;A9C98F;
    LDA.W #$FFF0                                                         ;A9C991;
    JSR.W SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14           ;A9C994;
    LDA.W #$FFF0                                                         ;A9C997;
    STA.B $14                                                            ;A9C99A;
    LDA.W #$0000                                                         ;A9C99C;
    JSR.W SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14           ;A9C99F;
    LDA.W #$FFF8                                                         ;A9C9A2;
    STA.B $14                                                            ;A9C9A5;
    LDA.W #$0010                                                         ;A9C9A7; fallthrough to SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14

SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14:
    CLC                                                                  ;A9C9AA;
    ADC.W $0FBA                                                          ;A9C9AB;
    STA.B $12                                                            ;A9C9AE;
    LDA.B $14                                                            ;A9C9B0;
    CLC                                                                  ;A9C9B2;
    ADC.W $0FBE                                                          ;A9C9B3;
    STA.B $14                                                            ;A9C9B6;
    LDA.W #$0009                                                         ;A9C9B8;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9C9BB;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9C9BE;
    RTS                                                                  ;A9C9C2;


Function_BabyMetroidCutscene_MoveToSamus:
    LDA.W #$0000                                                         ;A9C9C3;
    STA.L $7E7808,X                                                      ;A9C9C6;
    INC A                                                                ;A9C9CA;
    STA.L $7E7812,X                                                      ;A9C9CB;
    LDA.W $05E5                                                          ;A9C9CF;
    AND.W #$0FFF                                                         ;A9C9D2;
    CMP.W #$0FA0                                                         ;A9C9D5;
    BCC .skipSFX                                                         ;A9C9D8;
    LDA.W #$0052                                                         ;A9C9DA;
    JSL.L QueueSound_Lib2_Max6                                           ;A9C9DD;

.skipSFX:
    LDA.L $7E781C,X                                                      ;A9C9E1;
    TAY                                                                  ;A9C9E5;
    LDA.W $0000,Y                                                        ;A9C9E6;
    STA.B $12                                                            ;A9C9E9;
    LDA.W $0002,Y                                                        ;A9C9EB;
    STA.B $14                                                            ;A9C9EE;
    LDA.W $0006,Y                                                        ;A9C9F0;
    STA.B $16                                                            ;A9C9F3;
    LDA.W $0004,Y                                                        ;A9C9F5;
    PHY                                                                  ;A9C9F8;
    TAY                                                                  ;A9C9F9;
    PEA.W .manualReturn-1                                                ;A9C9FA;
    JMP.W ($0016)                                                        ;A9C9FD;


.manualReturn:
    PLY                                                                  ;A9CA00;
    LDA.W #$0004                                                         ;A9CA01;
    STA.B $16                                                            ;A9CA04;
    STA.B $18                                                            ;A9CA06;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CA08;
    BCS .return                                                          ;A9CA0C;
    LDA.W $0008,Y                                                        ;A9CA0E;
    BMI .function                                                        ;A9CA11;
    LDA.L $7E781C,X                                                      ;A9CA13;
    CLC                                                                  ;A9CA17;
    ADC.W #$0008                                                         ;A9CA18;
    STA.L $7E781C,X                                                      ;A9CA1B;

.return:
    RTS                                                                  ;A9CA1F;


.function:
    STA.W $0FA8,X                                                        ;A9CA20;
    RTS                                                                  ;A9CA23;


BabyMetroidCutscene_MovementTable_CeilingToSamus:
    dw $00A0,$0078,$0000                                                 ;A9CA24;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA2A;
    dw $0130,$007A,$0000                                                 ;A9CA2C;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA32;
    dw $00C0,$0040,$0000                                                 ;A9CA34;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA3A;
    dw $00C0,$0070,$0000                                                 ;A9CA3C;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA42;
    dw $00E0,$0080,$0000                                                 ;A9CA44;
    dw GradduallyAccelerateTowardsPoint_1A_10                            ;A9CA4A;
    dw $00CD,$0090,$0000                                                 ;A9CA4C;
    dw GradduallyAccelerateTowardsPoint_1A_8                             ;A9CA52;
    dw $00CC,$00A0,$0000                                                 ;A9CA54;
    dw GradduallyAccelerateTowardsPoint_1A_8                             ;A9CA5A;
    dw $00CB,$00B0,$0000                                                 ;A9CA5C;
    dw GradduallyAccelerateTowardsPoint_1A_8                             ;A9CA62;
    dw Function_BabyMetroidCutscene_LatchOntoSamus                       ;A9CA64;

Function_BabyMetroidCutscene_LatchOntoSamus:
    LDA.W $0AF6                                                          ;A9CA66;
    STA.B $12                                                            ;A9CA69;
    LDA.W $0AFA                                                          ;A9CA6B;
    SEC                                                                  ;A9CA6E;
    SBC.W #$0014                                                         ;A9CA6F;
    STA.B $14                                                            ;A9CA72;
    LDY.W #$0000                                                         ;A9CA74;
    JMP.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9CA77;


Function_BabyMetroidCutscene_HealSamusUpToFullEnergy:
    LDA.W #$0000                                                         ;A9CA7A;
    STA.L $7E7808,X                                                      ;A9CA7D;
    JSR.W HandlePlayingBabyMetroidCutsceneCrySFX                         ;A9CA81;
    LDA.W $0FA4,X                                                        ;A9CA84;
    AND.W #$0006                                                         ;A9CA87;
    TAY                                                                  ;A9CA8A;
    LDA.W ShakingOffsets_X,Y                                             ;A9CA8B;
    CLC                                                                  ;A9CA8E;
    ADC.W $0AF6                                                          ;A9CA8F;
    STA.W $0F7A,X                                                        ;A9CA92;
    LDA.W ShakingOffsets_Y,Y                                             ;A9CA95;
    CLC                                                                  ;A9CA98;
    ADC.W $0AFA                                                          ;A9CA99;
    SEC                                                                  ;A9CA9C;
    SBC.W #$0014                                                         ;A9CA9D;
    STA.W $0F7E,X                                                        ;A9CAA0;
    JSL.L HealSamusDueToBabyMetroid                                      ;A9CAA3;
    BCS .return                                                          ;A9CAA7;
    LDA.W $09D4                                                          ;A9CAA9;
    STA.W $09D6                                                          ;A9CAAC;
    LDA.W #Function_BabyMetroidCutscene_IdleUntilRunOutOfHealth          ;A9CAAF;
    STA.W $0FA8,X                                                        ;A9CAB2;
    LDA.W #.return                                                       ;A9CAB5;
    STA.L $7E781E,X                                                      ;A9CAB8;

.return:
    RTS                                                                  ;A9CABC;


Function_BabyMetroidCutscene_IdleUntilRunOutOfHealth:
    JSR.W HandlePlayingBabyMetroidCutsceneCrySFX                         ;A9CABD;
    LDA.L $7E780C,X                                                      ;A9CAC0;
    BEQ .checkHealth                                                     ;A9CAC4;
    AND.W #$0006                                                         ;A9CAC6;
    TAY                                                                  ;A9CAC9;
    LDA.W ShakingOffsets_X,Y                                             ;A9CACA;
    ASL A                                                                ;A9CACD;
    CLC                                                                  ;A9CACE;
    ADC.W $0AF6                                                          ;A9CACF;
    STA.W $0F7A,X                                                        ;A9CAD2;
    LDA.W ShakingOffsets_Y,Y                                             ;A9CAD5;
    ASL A                                                                ;A9CAD8;
    CLC                                                                  ;A9CAD9;
    ADC.W $0AFA                                                          ;A9CADA;
    SEC                                                                  ;A9CADD;
    SBC.W #$0014                                                         ;A9CADE;
    STA.W $0F7E,X                                                        ;A9CAE1;

.checkHealth:
    LDA.W $0F8C,X                                                        ;A9CAE4;
    BEQ .zeroHealth                                                      ;A9CAE7;
    RTS                                                                  ;A9CAE9;


.zeroHealth:
    LDA.W #$0140                                                         ;A9CAEA;
    STA.W $0F8C,X                                                        ;A9CAED;
    LDA.W #Function_BabyMetroidCutscene_ReleaseSamus                     ;A9CAF0;
    STA.W $0FA8,X                                                        ;A9CAF3;
    LDA.W #$000A                                                         ;A9CAF6;
    STA.W $0FB0,X                                                        ;A9CAF9;
    STZ.W $0FAE,X                                                        ;A9CAFC;
    LDA.W #HandleBabyMetroidCutscenePalette_LowHealth                    ;A9CAFF;
    STA.L $7E781E,X                                                      ;A9CB02;
    LDA.W #$0001                                                         ;A9CB06;
    STA.L $7E7808,X                                                      ;A9CB09;
    DEC A                                                                ;A9CB0D;
    STA.L $7E7812,X                                                      ;A9CB0E;
    RTS                                                                  ;A9CB12;


Function_BabyMetroidCutscene_ReleaseSamus:
    LDA.W #$0072                                                         ;A9CB13;
    JSL.L QueueSound_Lib2_Max6                                           ;A9CB16;
    LDA.W #$0001                                                         ;A9CB1A;
    STA.L $7E7856                                                        ;A9CB1D;
    LDA.W #Function_BabyMetroidCutscene_StaredownMotherBrain             ;A9CB21;
    STA.W $0FA8,X                                                        ;A9CB24;
    LDA.W #Function_MBBody_Phase2_PrepareForFinalBabyMetroidAttack       ;A9CB27;
    STA.W $0FA8                                                          ;A9CB2A; fallthrough to Function_BabyMetroidCutscene_StaredownMotherBrain

Function_BabyMetroidCutscene_StaredownMotherBrain:
    LDA.W $0AF6                                                          ;A9CB2D;
    SEC                                                                  ;A9CB30;
    SBC.W #$0004                                                         ;A9CB31;
    STA.B $12                                                            ;A9CB34;
    LDA.W #$0060                                                         ;A9CB36;
    STA.B $14                                                            ;A9CB39;
    LDY.W #$0000                                                         ;A9CB3B;
    JSR.W GradduallyAccelerateTowardsPoint_1A_10                         ;A9CB3E;
    LDA.W #$0004                                                         ;A9CB41;
    STA.B $16                                                            ;A9CB44;
    STA.B $18                                                            ;A9CB46;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CB48;
    BCC .collision                                                       ;A9CB4C;
    RTS                                                                  ;A9CB4E;


.collision:
    LDA.W #Function_BabyMetroidCutscene_FlyOffScreen                     ;A9CB4F;
    STA.W $0FA8,X                                                        ;A9CB52;
    RTS                                                                  ;A9CB55;


Function_BabyMetroidCutscene_FlyOffScreen:
    LDA.W #$0110                                                         ;A9CB56;
    STA.B $12                                                            ;A9CB59;
    LDA.W #$0040                                                         ;A9CB5B;
    STA.B $14                                                            ;A9CB5E;
    LDY.W #$0000                                                         ;A9CB60;
    JSR.W GradduallyAccelerateTowardsPoint_1A_10                         ;A9CB63;
    LDA.W #$0004                                                         ;A9CB66;
    STA.B $16                                                            ;A9CB69;
    STA.B $18                                                            ;A9CB6B;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CB6D;
    BCC .collision                                                       ;A9CB71;
    RTS                                                                  ;A9CB73;


.collision:
    LDA.W #Function_BabyMetroidCutscene_MoveToFinalChargeStartPosition   ;A9CB74;
    STA.W $0FA8,X                                                        ;A9CB77;
    RTS                                                                  ;A9CB7A;


Function_BabyMetroidCutscene_MoveToFinalChargeStartPosition:
    LDA.W #$0131                                                         ;A9CB7B;
    STA.B $12                                                            ;A9CB7E;
    LDA.W #$00A0                                                         ;A9CB80;
    STA.B $14                                                            ;A9CB83;
    LDY.W #$0000                                                         ;A9CB85;
    JSR.W GradduallyAccelerateTowardsPoint_1A_10                         ;A9CB88;
    LDA.W #$0004                                                         ;A9CB8B;
    STA.B $16                                                            ;A9CB8E;
    STA.B $18                                                            ;A9CB90;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CB92;
    BCC .collision                                                       ;A9CB96;
    RTS                                                                  ;A9CB98;


.collision:
    LDA.W #$004F                                                         ;A9CB99;
    STA.W $0F8C,X                                                        ;A9CB9C;
    LDA.W #$0000                                                         ;A9CB9F;
    STA.L $7E7856                                                        ;A9CBA2;
    LDA.W #Function_MBBody_Phase2_ExecuteFinalBabyMetroidAttack          ;A9CBA6;
    STA.W $0FA8                                                          ;A9CBA9;
    LDA.W #Function_BabyMetroidCutscene_InitiateFinalCharge              ;A9CBAC;
    STA.W $0FA8,X                                                        ;A9CBAF;
    RTS                                                                  ;A9CBB2;


Function_BabyMetroidCutscene_InitiateFinalCharge:
    LDA.W #$0122                                                         ;A9CBB3;
    STA.B $12                                                            ;A9CBB6;
    LDA.W #$0080                                                         ;A9CBB8;
    STA.B $14                                                            ;A9CBBB;
    LDY.W #$000A                                                         ;A9CBBD;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9CBC0;
    LDA.W #$0004                                                         ;A9CBC3;
    STA.B $16                                                            ;A9CBC6;
    STA.B $18                                                            ;A9CBC8;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9CBCA;
    BCC .collision                                                       ;A9CBCE;
    RTS                                                                  ;A9CBD0;


.collision:
    LDA.W #Function_BabyMetroidCutscene_FinalCharge                      ;A9CBD1;
    STA.W $0FA8,X                                                        ;A9CBD4;
    RTS                                                                  ;A9CBD7;


Function_BabyMetroidCutscene_FinalCharge:
    LDA.W $0FBA                                                          ;A9CBD8;
    STA.B $12                                                            ;A9CBDB;
    LDA.W #$FFE0                                                         ;A9CBDD;
    CLC                                                                  ;A9CBE0;
    ADC.W $0FBE                                                          ;A9CBE1;
    STA.B $14                                                            ;A9CBE4;
    LDY.W #$000C                                                         ;A9CBE6;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9CBE9;
    LDA.W $0F8C,X                                                        ;A9CBEC;
    BEQ .zeroHealth                                                      ;A9CBEF;
    RTS                                                                  ;A9CBF1;


.zeroHealth:
    LDA.W #Function_BabyMetroidCutscene_PrepareForHyperBeam_return       ;A9CBF2;
    STA.L $7E781E,X                                                      ;A9CBF5;
    LDA.W #$10A0                                                         ;A9CBF9;
    STA.W $0F98,X                                                        ;A9CBFC;
    LDA.W #$0019                                                         ;A9CBFF;
    JSL.L QueueSound_Lib3_Max6                                           ;A9CC02;
    JSL.L FadeOutBackgroundForBabyMetroidDeathSequence                   ;A9CC06;
    LDA.W #InstList_BabyMetroid_TookFatalBlow                            ;A9CC0A;
    JSL.L SetEnemyInstList                                               ;A9CC0D;
    STZ.W $0FAA,X                                                        ;A9CC11;
    STZ.W $0FAC,X                                                        ;A9CC14;
    LDA.W #RTS_A9C18D                                                    ;A9CC17;
    STA.W $0FA8                                                          ;A9CC1A;
    LDA.W #$0000                                                         ;A9CC1D;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9CC20;
    LDA.W #Function_BabyMetroidCutscene_TakeFinalBlow                    ;A9CC24;
    STA.W $0FA8,X                                                        ;A9CC27;
    LDA.W #$0010                                                         ;A9CC2A;
    STA.W $0FB2,X                                                        ;A9CC2D;
    LDA.W $0F7A,X                                                        ;A9CC30;
    STA.L $7E7820,X                                                      ;A9CC33;
    LDA.W $0F7E,X                                                        ;A9CC37;
    STA.L $7E7822,X                                                      ;A9CC3A; fallthrough to Function_BabyMetroidCutscene_TakeFinalBlow

Function_BabyMetroidCutscene_TakeFinalBlow:
    JSR.W ShakeBabyMetroidCutscene                                       ;A9CC3E;
    DEC.W $0FB2,X                                                        ;A9CC41;
    BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return          ;A9CC44;
    LDA.L $7E7820,X                                                      ;A9CC46;
    STA.W $0F7A,X                                                        ;A9CC4A;
    LDA.L $7E7822,X                                                      ;A9CC4D;
    STA.W $0F7E,X                                                        ;A9CC51;
    LDA.W #Function_BabyMetroidCutscene_PlaySamusTheme                   ;A9CC54;
    STA.W $0FA8,X                                                        ;A9CC57;
    LDA.W #$0038                                                         ;A9CC5A;
    STA.W $0FB2,X                                                        ;A9CC5D; fallthrough to Function_BabyMetroidCutscene_PlaySamusTheme

Function_BabyMetroidCutscene_PlaySamusTheme:
    DEC.W $0FB2,X                                                        ;A9CC60;
    BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return          ;A9CC63;
    LDA.W #$FF48                                                         ;A9CC65;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9CC68;
    LDA.W #$0005                                                         ;A9CC6C;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9CC6F;
    LDA.W #Function_BabyMetroidCutscene_PrepareForHyperBeam              ;A9CC73;
    STA.W $0FA8,X                                                        ;A9CC76;
    LDA.W #$000C                                                         ;A9CC79;
    STA.W $0FB2,X                                                        ;A9CC7C; fallthrough to Function_BabyMetroidCutscene_PrepareForHyperBeam

Function_BabyMetroidCutscene_PrepareForHyperBeam:
    DEC.W $0FB2,X                                                        ;A9CC7F;
    BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return          ;A9CC82;
    LDA.W #$0019                                                         ;A9CC84;
    JSL.L Run_Samus_Command                                              ;A9CC87;
    LDA.W #SamusRainbowPaletteFunction_ActivateRainbowWhenEnemyIsLow     ;A9CC8B;
    STA.L $7E786C                                                        ;A9CC8E;
    LDA.W #Function_BabyMetroidCutscene_DeathSequence                    ;A9CC92;
    STA.W $0FA8,X                                                        ;A9CC95;

Function_BabyMetroidCutscene_PrepareForHyperBeam_return:
    RTS                                                                  ;A9CC98;


Function_BabyMetroidCutscene_DeathSequence:
    JSR.W HandleSamusRainbowPaletteAnimation                             ;A9CC99;
    JSR.W AccelerateBabyMetroidCutsceneDownwards                         ;A9CC9C;
    JSR.W FadeBabyMetroidCutsceneToBlack                                 ;A9CC9F;
    BCS .fadedToBlack                                                    ;A9CCA2;
    JSR.W HandleBabyMetroidCutsceneDeathExplosions                       ;A9CCA4;
    JMP.W HandleEnemyBlinking                                            ;A9CCA7;


.fadedToBlack:
    LDA.W $0F86,X                                                        ;A9CCAA;
    ORA.W #$0100                                                         ;A9CCAD;
    STA.W $0F86,X                                                        ;A9CCB0;
    LDA.W #Function_BabyMetroidCutscene_UnloadTiles                      ;A9CCB3;
    STA.W $0FA8,X                                                        ;A9CCB6;
    LDA.W #$0080                                                         ;A9CCB9;
    STA.W $0FB2,X                                                        ;A9CCBC;

Function_BabyMetroidCutscene_DeathSequence_return:
    RTS                                                                  ;A9CCBF;


Function_BabyMetroidCutscene_UnloadTiles:
    JSR.W HandleSamusRainbowPaletteAnimation                             ;A9CCC0;
    DEC.W $0FB2,X                                                        ;A9CCC3;
    BPL Function_BabyMetroidCutscene_DeathSequence_return                ;A9CCC6;
    PHX                                                                  ;A9CCC8;
    LDX.W #MotherBrainFightSpriteTileTransferEntries_attacks             ;A9CCC9;
    JSR.W ProcessSpriteTilesTransfers                                    ;A9CCCC;
    PLX                                                                  ;A9CCCF;
    BCC Function_BabyMetroidCutscene_DeathSequence_return                ;A9CCD0;
    LDA.W #Function_BabyMetroidCutscene_LetSamusRainbowSomeMore          ;A9CCD2;
    STA.W $0FA8,X                                                        ;A9CCD5;
    LDA.W #$00B0                                                         ;A9CCD8;
    STA.W $0FB2,X                                                        ;A9CCDB; fallthrough to Function_BabyMetroidCutscene_LetSamusRainbowSomeMore

Function_BabyMetroidCutscene_LetSamusRainbowSomeMore:
    DEC.W $0FB2,X                                                        ;A9CCDE;
    BPL Function_BabyMetroidCutscene_DeathSequence_return                ;A9CCE1;
    LDA.W #Function_BabyMetroidCutscene_FinalCutscene                    ;A9CCE3;
    STA.W $0FA8,X                                                        ;A9CCE6;
    LDA.W #$0000                                                         ;A9CCE9;
    STA.L $7E802E                                                        ;A9CCEC; fallthrough to Function_BabyMetroidCutscene_FinalCutscene

Function_BabyMetroidCutscene_FinalCutscene:
    LDA.L $7E802E                                                        ;A9CCF0;
    INC A                                                                ;A9CCF4;
    STA.L $7E802E                                                        ;A9CCF5;
    DEC A                                                                ;A9CCF9;
    PHX                                                                  ;A9CCFA;
    JSL.L FadeInBackgroundForMotherBrainPhase3                           ;A9CCFB;
    PLX                                                                  ;A9CCFF;
    BCC Function_BabyMetroidCutscene_DeathSequence_return                ;A9CD00;
    LDA.W #Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance   ;A9CD02;
    STA.W $0FA8                                                          ;A9CD05;
    LDA.W #$0017                                                         ;A9CD08;
    JSL.L Run_Samus_Command                                              ;A9CD0B;
    LDA.W #$0003                                                         ;A9CD0F;
    JSL.L DrainedSamusController                                         ;A9CD12;
    LDA.W $0F86,X                                                        ;A9CD16;
    ORA.W #$0200                                                         ;A9CD19;
    STA.W $0F86,X                                                        ;A9CD1C;
    LDA.W #$0000                                                         ;A9CD1F;
    STA.L $7E7854                                                        ;A9CD22;
    RTS                                                                  ;A9CD26;


HandleSamusRainbowPaletteAnimation:
    LDA.L $7E786C                                                        ;A9CD27;
    STA.B $12                                                            ;A9CD2B;
    JMP.W ($0012)                                                        ;A9CD2D;


SamusRainbowPaletteFunction_ActivateRainbowWhenEnemyIsLow:
    LDA.W $0F7E,X                                                        ;A9CD30;
    CLC                                                                  ;A9CD33;
    ADC.W #$0010                                                         ;A9CD34;
    CMP.W $0AFA                                                          ;A9CD37;
    BMI .return                                                          ;A9CD3A;
    LDA.W #$0016                                                         ;A9CD3C;
    JSL.L Run_Samus_Command                                              ;A9CD3F;
    LDA.W #SamusRainbowPaletteFunction_GraduallySlowAnimationDown        ;A9CD43;
    STA.L $7E786C                                                        ;A9CD46;

.return:
    RTS                                                                  ;A9CD4A;


SamusRainbowPaletteFunction_GraduallySlowAnimationDown:
    LDA.L $7E787A                                                        ;A9CD4B;
    CLC                                                                  ;A9CD4F;
    ADC.W #$0300                                                         ;A9CD50;
    STA.L $7E787A                                                        ;A9CD53;
    BCC .return                                                          ;A9CD57;
    LDA.W $0ACE                                                          ;A9CD59;
    INC A                                                                ;A9CD5C;
    CMP.W #$000A                                                         ;A9CD5D;
    BMI .stillSlowing                                                    ;A9CD60;
    LDA.W #$000A                                                         ;A9CD62;

.stillSlowing:
    STA.W $0ACE                                                          ;A9CD65;

.return:
    RTS                                                                  ;A9CD68;


FadeBabyMetroidCutsceneToBlack:
    LDA.W $0F7E,X                                                        ;A9CD69;
    CMP.W #$0080                                                         ;A9CD6C;
    BMI .returnNotFaded                                                  ;A9CD6F;
    PHB                                                                  ;A9CD71;
    PEA.W $AD00                                                          ;A9CD72;
    PLB                                                                  ;A9CD75;
    PLB                                                                  ;A9CD76;
    LDA.L $7E7818,X                                                      ;A9CD77;
    DEC A                                                                ;A9CD7B;
    BMI .advancePalette                                                  ;A9CD7C;
    STA.L $7E7818,X                                                      ;A9CD7E;
    PLB                                                                  ;A9CD82;

.returnNotFaded:
    CLC                                                                  ;A9CD83;
    RTS                                                                  ;A9CD84;


.advancePalette:
    LDA.W #$0008                                                         ;A9CD85;
    STA.L $7E7818,X                                                      ;A9CD88;
    LDA.L $7E781A,X                                                      ;A9CD8C;
    INC A                                                                ;A9CD90;
    CMP.W #$0007                                                         ;A9CD91;
    BMI .fadeToBlack                                                     ;A9CD94;
    PLB                                                                  ;A9CD96;
    SEC                                                                  ;A9CD97;
    RTS                                                                  ;A9CD98;


.fadeToBlack:
    PHX                                                                  ;A9CD99;
    STA.L $7E781A,X                                                      ;A9CD9A;
    ASL A                                                                ;A9CD9E;
    TAX                                                                  ;A9CD9F;
    LDY.W BabyMetroidFadingToBlackPalettes,X                             ;A9CDA0;
    LDX.W #$01E2                                                         ;A9CDA3;
    LDA.W #$000E                                                         ;A9CDA6;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9CDA9;
    PLX                                                                  ;A9CDAD;
    PLB                                                                  ;A9CDAE;
    CLC                                                                  ;A9CDAF;
    RTS                                                                  ;A9CDB0;


HandleBabyMetroidCutsceneDeathExplosions:
    LDA.L $7E7810,X                                                      ;A9CDB1;
    DEC A                                                                ;A9CDB5;
    BMI .timerExpired                                                    ;A9CDB6;
    STA.L $7E7810,X                                                      ;A9CDB8;
    RTS                                                                  ;A9CDBC;


.timerExpired:
    LDA.W #$0004                                                         ;A9CDBD;
    STA.L $7E7810,X                                                      ;A9CDC0;
    LDA.L $7E780E,X                                                      ;A9CDC4;
    INC A                                                                ;A9CDC8;
    CMP.W #$000A                                                         ;A9CDC9;
    BMI +                                                                ;A9CDCC;
    LDA.W #$0000                                                         ;A9CDCE;

  + STA.L $7E780E,X                                                      ;A9CDD1;
    ASL A                                                                ;A9CDD5;
    ASL A                                                                ;A9CDD6;
    TAY                                                                  ;A9CDD7;
    LDA.W .XOffsets,Y                                                    ;A9CDD8;
    CLC                                                                  ;A9CDDB;
    ADC.W $0F7A,X                                                        ;A9CDDC;
    STA.B $12                                                            ;A9CDDF;
    LDA.W .YOffsets,Y                                                    ;A9CDE1;
    CLC                                                                  ;A9CDE4;
    ADC.W $0F7E,X                                                        ;A9CDE5;
    STA.B $14                                                            ;A9CDE8;
    LDA.W #$0003                                                         ;A9CDEA;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9CDED;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9CDF0;
    LDA.W #$0013                                                         ;A9CDF4;
    JSL.L QueueSound_Lib3_Max3                                           ;A9CDF7;
    RTS                                                                  ;A9CDFB;


.XOffsets:
    dw $FFE8                                                             ;A9CDFC;

.YOffsets:
    dw $FFE8,$FFEC,$0014,$0010,$FFE2,$001E,$FFFD,$000E                   ;A9CDFE;
    dw $FFF3,$FFFE,$0012,$FFFE,$FFE0,$FFE1,$0008,$FFFC                   ;A9CE0E;
    dw $FFF6,$0013,$0013                                                 ;A9CE1E;

HandleEnemyBlinking:
    LDA.W $0FA4,X                                                        ;A9CE24;
    AND.W #$0001                                                         ;A9CE27;
    BEQ .invisible                                                       ;A9CE2A;
    LDA.W $0F86,X                                                        ;A9CE2C;
    AND.W #$FEFF                                                         ;A9CE2F;
    STA.W $0F86,X                                                        ;A9CE32;
    RTS                                                                  ;A9CE35;


.invisible:
    LDA.W $0F86,X                                                        ;A9CE36;
    ORA.W #$0100                                                         ;A9CE39;
    STA.W $0F86,X                                                        ;A9CE3C;
    RTS                                                                  ;A9CE3F;


AccelerateBabyMetroidCutsceneDownwards:
    LDA.W $0FAA,X                                                        ;A9CE40;
    BPL +                                                                ;A9CE43;
    EOR.W #$FFFF                                                         ;A9CE45;
    INC A                                                                ;A9CE48;

  + SEC                                                                  ;A9CE49;
    SBC.W #$0020                                                         ;A9CE4A;
    BPL +                                                                ;A9CE4D;
    LDA.W #$0000                                                         ;A9CE4F;

  + BIT.W $0FAA,X                                                        ;A9CE52;
    BPL +                                                                ;A9CE55;
    EOR.W #$FFFF                                                         ;A9CE57;
    INC A                                                                ;A9CE5A;

  + STA.W $0FAA,X                                                        ;A9CE5B;
    LDA.W $0FAC,X                                                        ;A9CE5E;
    CLC                                                                  ;A9CE61;
    ADC.W #$0002                                                         ;A9CE62;
    STA.W $0FAC,X                                                        ;A9CE65;
    RTS                                                                  ;A9CE68;


HandleBabyMetroidCutsceneHealthBasedPalette:
    LDA.L $7E7812,X                                                      ;A9CE69;
    BEQ .return                                                          ;A9CE6D;
    LDA.W $0F8C,X                                                        ;A9CE6F;
    CMP.W #$0A00                                                         ;A9CE72;
    BMI .health80                                                        ;A9CE75;

.return:
    RTS                                                                  ;A9CE77;


.health80:
    LDY.W #$0002                                                         ;A9CE78;
    CMP.W #$08C0                                                         ;A9CE7B;
    BPL .setPalette                                                      ;A9CE7E;
    LDY.W #$0004                                                         ;A9CE80;
    CMP.W #$0780                                                         ;A9CE83;
    BPL .setPalette                                                      ;A9CE86;
    LDY.W #$0006                                                         ;A9CE88;
    CMP.W #$0640                                                         ;A9CE8B;
    BPL .setPalette                                                      ;A9CE8E;
    LDY.W #$0008                                                         ;A9CE90;
    CMP.W #$0500                                                         ;A9CE93;
    BPL .setPalette                                                      ;A9CE96;
    LDY.W #$000A                                                         ;A9CE98;
    CMP.W #$03C0                                                         ;A9CE9B;
    BPL .setPalette                                                      ;A9CE9E;
    LDY.W #$000C                                                         ;A9CEA0;
    CMP.W #$0280                                                         ;A9CEA3;
    BPL .setPalette                                                      ;A9CEA6;
    LDY.W #$000E                                                         ;A9CEA8;

.setPalette:
    PHB                                                                  ;A9CEAB;
    PEA.W $AD00                                                          ;A9CEAC;
    PLB                                                                  ;A9CEAF;
    PLB                                                                  ;A9CEB0;
    PHY                                                                  ;A9CEB1;
    LDA.W BabyMetroidHealthBasedPalette_Shell,Y                          ;A9CEB2;
    TAY                                                                  ;A9CEB5;
    LDX.W #$01E2                                                         ;A9CEB6;
    LDA.W #$0004                                                         ;A9CEB9;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9CEBC;
    LDX.W #$01F4                                                         ;A9CEC0;
    LDA.W #$0005                                                         ;A9CEC3;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9CEC6;
    PLY                                                                  ;A9CECA;
    LDA.W BabyMetroidHealthBasedPalette_Innards,Y                        ;A9CECB;
    TAY                                                                  ;A9CECE;
    LDX.W #$01EA                                                         ;A9CECF;
    LDA.W #$0005                                                         ;A9CED2;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9CED5;
    PLB                                                                  ;A9CED9;
    RTS                                                                  ;A9CEDA;


ShakeBabyMetroidCutscene:
    LDA.W $0FAC,X                                                        ;A9CEDB;
    CLC                                                                  ;A9CEDE;
    ADC.W #$FFFF                                                         ;A9CEDF;
    STA.W $0FAC,X                                                        ;A9CEE2;
    LDA.W $0FA4,X                                                        ;A9CEE5;
    AND.W #$0006                                                         ;A9CEE8;
    TAY                                                                  ;A9CEEB;
    LDA.W ShakingOffsets_X,Y                                             ;A9CEEC;
    CLC                                                                  ;A9CEEF;
    ADC.L $7E7820,X                                                      ;A9CEF0;
    STA.W $0F7A,X                                                        ;A9CEF4;
    LDA.W ShakingOffsets_Y,Y                                             ;A9CEF7;
    CLC                                                                  ;A9CEFA;
    ADC.L $7E7822,X                                                      ;A9CEFB;
    STA.W $0F7E,X                                                        ;A9CEFF;
    RTS                                                                  ;A9CF02;


EnemyTouch_BabyMetroidCutscene:
    LDX.W $0E54                                                          ;A9CF03;
    LDA.W $0FA8,X                                                        ;A9CF06;
    CMP.W #Function_BabyMetroidCutscene_LatchOntoSamus                   ;A9CF09;
    BNE .return                                                          ;A9CF0C;
    LDA.W $0AF6                                                          ;A9CF0E;
    STA.B $12                                                            ;A9CF11;
    LDA.W $0AFA                                                          ;A9CF13;
    SEC                                                                  ;A9CF16;
    SBC.W #$0014                                                         ;A9CF17;
    STA.B $14                                                            ;A9CF1A;
    LDA.W #$0010                                                         ;A9CF1C;
    JSR.W AccelerateBabyMetroidTowardsPoint                              ;A9CF1F;
    BCC .return                                                          ;A9CF22;
    STZ.W $0FAA,X                                                        ;A9CF24;
    STZ.W $0FAC,X                                                        ;A9CF27;
    LDA.W #Function_BabyMetroidCutscene_HealSamusUpToFullEnergy          ;A9CF2A;
    STA.W $0FA8,X                                                        ;A9CF2D;

.return:
    RTL                                                                  ;A9CF30;


UpdateBabyMetroidCutsceneSpeedAndAngle:
    LDA.B $16                                                            ;A9CF31;
    CMP.L $7E7816,X                                                      ;A9CF33;
    BEQ .speedCalculated                                                 ;A9CF37;
    BPL .notReachedTargedSpeed                                           ;A9CF39;
    LDA.L $7E7816,X                                                      ;A9CF3B;
    SEC                                                                  ;A9CF3F;
    SBC.W #$0020                                                         ;A9CF40;
    CMP.B $16                                                            ;A9CF43;
    BPL .setSpeed                                                        ;A9CF45;
    LDA.B $16                                                            ;A9CF47;

.setSpeed:
    STA.L $7E7816,X                                                      ;A9CF49;
    BRA .speedCalculated                                                 ;A9CF4D;


.notReachedTargedSpeed:
    LDA.L $7E7816,X                                                      ;A9CF4F;
    CLC                                                                  ;A9CF53;
    ADC.W #$0020                                                         ;A9CF54;
    CMP.B $16                                                            ;A9CF57;
    BMI ..setSpeed                                                       ;A9CF59;
    LDA.B $16                                                            ;A9CF5B;

..setSpeed:
    STA.L $7E7816,X                                                      ;A9CF5D;

.speedCalculated:
    LDA.B $12                                                            ;A9CF61;
    BMI .negativeAngleDelta                                              ;A9CF63;
    CLC                                                                  ;A9CF65;
    ADC.L $7E7814,X                                                      ;A9CF66;
    CMP.B $14                                                            ;A9CF6A;
    BMI .setAngle                                                        ;A9CF6C;
    BRA .maxAngle                                                        ;A9CF6E;


.negativeAngleDelta:
    CLC                                                                  ;A9CF70;
    ADC.L $7E7814,X                                                      ;A9CF71;
    CMP.B $14                                                            ;A9CF75;
    BPL .setAngle                                                        ;A9CF77;

.maxAngle:
    LDA.B $14                                                            ;A9CF79;

.setAngle:
    STA.L $7E7814,X                                                      ;A9CF7B;
    XBA                                                                  ;A9CF7F;
    AND.W #$00FF                                                         ;A9CF80;
    STA.B $12                                                            ;A9CF83;
    LDA.L $7E7816,X                                                      ;A9CF85;
    JSL.L Math_86C26C                                                    ;A9CF89;
    LDX.W $0E54                                                          ;A9CF8D;
    STA.W $0FAA,X                                                        ;A9CF90;
    LDA.L $7E7816,X                                                      ;A9CF93;
    JSL.L Math_86C272                                                    ;A9CF97;
    LDX.W $0E54                                                          ;A9CF9B;
    STA.W $0FAC,X                                                        ;A9CF9E;
    RTS                                                                  ;A9CFA1;


InstList_BabyMetroid_Initial:
    dw $0010                                                             ;A9CFA2;
    dw Spritemap_BabyMetroid_0                                           ;A9CFA4;
    dw $0010                                                             ;A9CFA6;
    dw Spritemap_BabyMetroid_1                                           ;A9CFA8;
    dw $0010                                                             ;A9CFAA;
    dw Spritemap_BabyMetroid_2                                           ;A9CFAC;
    dw $0010                                                             ;A9CFAE;
    dw Spritemap_BabyMetroid_1                                           ;A9CFB0;
    dw Instruction_BabyMetroid_GotoInitial                               ;A9CFB2;

Instruction_BabyMetroid_GotoInitial:
    LDY.W #InstList_BabyMetroid_Initial                                  ;A9CFB4;
    RTL                                                                  ;A9CFB7;


InstList_BabyMetroid_DrainingMotherBrain:
    dw $0008                                                             ;A9CFB8;
    dw Spritemap_BabyMetroid_0                                           ;A9CFBA;
    dw $0008                                                             ;A9CFBC;
    dw Spritemap_BabyMetroid_1                                           ;A9CFBE;
    dw $0005                                                             ;A9CFC0;
    dw Spritemap_BabyMetroid_2                                           ;A9CFC2;
    dw $0002                                                             ;A9CFC4;
    dw Spritemap_BabyMetroid_1                                           ;A9CFC6;
    dw Instruction_BabyMetroid_GotoDrainingMotherBrain                   ;A9CFC8;

Instruction_BabyMetroid_GotoDrainingMotherBrain:
    LDY.W #InstList_BabyMetroid_DrainingMotherBrain                      ;A9CFCA;
    RTL                                                                  ;A9CFCD;


InstList_BabyMetroid_TookFatalBlow:
    dw $0080                                                             ;A9CFCE;
    dw Spritemap_BabyMetroid_2                                           ;A9CFD0;
    dw Instruction_CommonA9_Sleep                                        ;A9CFD2;

ProcessMotherBrainInvincibilityPalette:
    LDA.L $7E7800                                                        ;A9CFD4;
    CMP.W #$0004                                                         ;A9CFD8;
    BNE .return                                                          ;A9CFDB;
    LDA.W $0FDC                                                          ;A9CFDD;
    LSR A                                                                ;A9CFE0;
    BEQ .return                                                          ;A9CFE1;
    BCS .return                                                          ;A9CFE3;
    LDX.W #$001C                                                         ;A9CFE5;

.loop:
    LDA.L $7EC102,X                                                      ;A9CFE8;
    STA.L $7EC122,X                                                      ;A9CFEC;
    STA.L $7EC162,X                                                      ;A9CFF0;
    STA.L $7EC082,X                                                      ;A9CFF4;
    DEX                                                                  ;A9CFF8;
    DEX                                                                  ;A9CFF9;
    BPL .loop                                                            ;A9CFFA;

.return:
    RTS                                                                  ;A9CFFC;


MotherBrainPalette_BeginScreenFlashing:
    LDA.W #InstList_RoomPalette_FirstPhaseEnded                          ;A9CFFD;
    STA.L $7E781C                                                        ;A9D000;
    LDA.W #$0001                                                         ;A9D004;
    STA.L $7E781E                                                        ;A9D007;
    RTS                                                                  ;A9D00B;


MotherBrainPalette_EndScreenFlashing:
    LDA.W #$0000                                                         ;A9D00C;
    STA.L $7E781C                                                        ;A9D00F;
    STA.L $7E781E                                                        ;A9D013;
    LDY.W #RoomPalettes_Phase1Ended_0                                    ;A9D017;
    BRA MotherBrainPalette_WriteRoomPalette                              ;A9D01A;


MotherBrainPalette_HandleRoomPalette:
    LDA.W #$781C                                                         ;A9D01C;
    JSR.W HandleRoomPaletteInstList                                      ;A9D01F;
    BCS MotherBrainPalette_WriteRoomPalette                              ;A9D022;
    RTS                                                                  ;A9D024;


MotherBrainPalette_WriteRoomPalette:
    LDX.W #$0068                                                         ;A9D025;
    LDA.W #$000C                                                         ;A9D028;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D02B;
    PHY                                                                  ;A9D02F;
    LDX.W #$00A6                                                         ;A9D030;
    LDA.W #$000C                                                         ;A9D033;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D036;
    PLY                                                                  ;A9D03A;
    LDX.W #$00E6                                                         ;A9D03B;
    LDA.W #$000C                                                         ;A9D03E;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D041;
    RTS                                                                  ;A9D045;


InstList_RoomPalette_FirstPhaseEnded:
    dw $0002                                                             ;A9D046;
    dw RoomPalettes_Phase1Ended_0                                        ;A9D048;
    dw $0002                                                             ;A9D04A;
    dw RoomPalettes_Phase1Ended_1                                        ;A9D04C;
    dw $0002                                                             ;A9D04E;
    dw RoomPalettes_Phase1Ended_2                                        ;A9D050;
    dw $0002                                                             ;A9D052;
    dw RoomPalettes_Phase1Ended_3                                        ;A9D054;
    dw $0002                                                             ;A9D056;
    dw RoomPalettes_Phase1Ended_0                                        ;A9D058;
    dw $0002                                                             ;A9D05A;
    dw RoomPalettes_Phase1Ended_1                                        ;A9D05C;
    dw $0002                                                             ;A9D05E;
    dw RoomPalettes_Phase1Ended_0                                        ;A9D060;
    dw $0002                                                             ;A9D062;
    dw RoomPalettes_Phase1Ended_3                                        ;A9D064;
    dw $0002                                                             ;A9D066;
    dw RoomPalettes_Phase1Ended_1                                        ;A9D068;
    dw $0002                                                             ;A9D06A;
    dw RoomPalettes_Phase1Ended_0                                        ;A9D06C;
    dw $0002                                                             ;A9D06E;
    dw RoomPalettes_Phase1Ended_3                                        ;A9D070;
    dw $0002                                                             ;A9D072;
    dw RoomPalettes_Phase1Ended_2                                        ;A9D074;
    dw $0002                                                             ;A9D076;
    dw RoomPalettes_Phase1Ended_0                                        ;A9D078;
    dw $0002                                                             ;A9D07A;
    dw RoomPalettes_Phase1Ended_2                                        ;A9D07C;
    dw Instruction_MotherBrain_GotoX                                     ;A9D07E;
    dw InstList_RoomPalette_FirstPhaseEnded                              ;A9D080;

RoomPalettes_Phase1Ended_0:
    dw $4A16,$3991,$2D2C,$1CA7,$20E5,$18A4,$1083,$0841                   ;A9D082;
    dw $0000,$0000,$02DF,$0000,$0802,$5294,$39CE,$2108                   ;A9D092;
    dw $1084,$0019,$0012,$5C00,$4000,$1084,$197F,$7FFF                   ;A9D0A2;

RoomPalettes_Phase1Ended_1:
    dw $4EB9,$4656,$3E12,$31CF,$35EE,$2DCD,$29AC,$258B                   ;A9D0B2;
    dw $1D4A,$1D4A,$1F3F,$1D4A,$254C,$3DEF,$2D6B,$18C6                   ;A9D0C2;
    dw $0C63,$0013,$000E,$4400,$3000,$0C63,$1517,$5EF7                   ;A9D0D2;

RoomPalettes_Phase1Ended_2:
    dw $575C,$4F3A,$4B19,$46D7,$46F6,$46D6,$42D6,$3EB5                   ;A9D0E2;
    dw $3EB5,$3EB5,$3F9F,$3EB5,$3EB5,$294A,$1CE7,$1084                   ;A9D0F2;
    dw $0842,$000D,$0009,$3000,$2000,$0842,$0CD0,$4210                   ;A9D102;

RoomPalettes_Phase1Ended_3:
    dw $5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF                   ;A9D112;
    dw $5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$14A5,$1084,$0842                   ;A9D122;
    dw $0421,$0006,$0005,$1800,$1000,$0421,$0868,$2108                   ;A9D132;

UNSUED_SetInvalidRoomPaletteInstructionList_A9D142:
    LDA.W #MotherBrainPalettes_TransitionToGrey                          ;A9D142;
    STA.L $7E781C                                                        ;A9D145;
    LDA.W #$0001                                                         ;A9D149;
    STA.L $7E781E                                                        ;A9D14C;
    RTS                                                                  ;A9D150;


UNSUED_SetInvalidRoomPaletteInstructionList_A9D151:
    LDA.W #MotherBrainPalettes_TransitionFromGrey                        ;A9D151;
    STA.L $7E781C                                                        ;A9D154;
    LDA.W #$0001                                                         ;A9D158;
    STA.L $7E781E                                                        ;A9D15B;
    RTS                                                                  ;A9D15F;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_HandleMotherBrainsPalette_A9D160:
    LDA.W #$781C                                                         ;A9D160;
    JSR.W HandleRoomPaletteInstList                                      ;A9D163;
    BCC .return                                                          ;A9D166;
    PHY                                                                  ;A9D168;
    LDX.W #$0082                                                         ;A9D169;
    LDA.W #$000D                                                         ;A9D16C;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D16F;
    PLY                                                                  ;A9D173;
    LDX.W #$0122                                                         ;A9D174;
    LDA.W #$000D                                                         ;A9D177;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D17A;
    LDX.W #$0168                                                         ;A9D17E;
    LDA.W #$0005                                                         ;A9D181;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D184;
    LDX.W #$017C                                                         ;A9D188;
    LDA.W $0000,Y                                                        ;A9D18B;
    STA.W $0000,X                                                        ;A9D18E;

.return:
    RTS                                                                  ;A9D191;
endif ; !FEATURE_KEEP_UNREFERENCED


HandleRoomPaletteInstList:
    STA.B $00                                                            ;A9D192;
    INC A                                                                ;A9D194;
    INC A                                                                ;A9D195;
    STA.B $03                                                            ;A9D196;
    SEP #$20                                                             ;A9D198;
    LDA.B #$7E                                                           ;A9D19A;
    STA.B $02                                                            ;A9D19C;
    STA.B $05                                                            ;A9D19E;
    REP #$20                                                             ;A9D1A0;
    LDA.B [$00]                                                          ;A9D1A2;
    BMI .pointer                                                         ;A9D1A4;
    CLC                                                                  ;A9D1A6;
    RTS                                                                  ;A9D1A7;


.pointer:
    TAX                                                                  ;A9D1A8;
    LDA.W $0000,X                                                        ;A9D1A9;
    BMI .instruction                                                     ;A9D1AC;
    CMP.B [$03]                                                          ;A9D1AE;
    BNE .tick                                                            ;A9D1B0;
    INX                                                                  ;A9D1B2;
    INX                                                                  ;A9D1B3;
    INX                                                                  ;A9D1B4;
    INX                                                                  ;A9D1B5;

.loop:
    LDA.W $0000,X                                                        ;A9D1B6;
    BEQ .terminator                                                      ;A9D1B9;
    BPL .specialInstruction                                              ;A9D1BB;

.instruction:
    STA.B $06                                                            ;A9D1BD;
    INX                                                                  ;A9D1BF;
    INX                                                                  ;A9D1C0;
    PEA.W .loop-1                                                        ;A9D1C1;
    JMP.W ($0006)                                                        ;A9D1C4;


.specialInstruction:
    LDA.W #$0001                                                         ;A9D1C7;
    STA.B [$03]                                                          ;A9D1CA;
    TXA                                                                  ;A9D1CC;
    STA.B [$00]                                                          ;A9D1CD;
    LDY.W $0002,X                                                        ;A9D1CF;
    SEC                                                                  ;A9D1D2;
    RTS                                                                  ;A9D1D3;


.tick:
    LDA.B [$03]                                                          ;A9D1D4;
    INC A                                                                ;A9D1D6;
    STA.B [$03]                                                          ;A9D1D7;
    LDY.W $0002,X                                                        ;A9D1D9;
    SEC                                                                  ;A9D1DC;
    RTS                                                                  ;A9D1DD;


.terminator:
    STA.B [$00]                                                          ;A9D1DE;
    STA.B [$03]                                                          ;A9D1E0;
    CLC                                                                  ;A9D1E2;
    RTS                                                                  ;A9D1E3;


HandleMotherBrainsPalette:
    LDA.L $7E7860                                                        ;A9D1E4;
    BEQ .disabled                                                        ;A9D1E8;
    JSR.W HandleMotherBrainHeadPalette                                   ;A9D1EA;

.disabled:
    LDA.L $7E7862                                                        ;A9D1ED;
    BEQ .return                                                          ;A9D1F1;
    JSL.L MotherBrainHealthBasedPaletteHandling                          ;A9D1F3;

.return:
    RTS                                                                  ;A9D1F7;


SetupMotherBrainHeadNormalPalette:
    LDA.W #$000A                                                         ;A9D1F8;
    STA.W $0FB0                                                          ;A9D1FB;
    RTS                                                                  ;A9D1FE;


SetupMotherBrainHeadPaletteForChargingHerLaser:
    LDA.W #$0202                                                         ;A9D1FF;
    STA.W $0FB0                                                          ;A9D202;
    RTS                                                                  ;A9D205;


HandleMotherBrainHeadPalette:
    LDA.L $7E7800                                                        ;A9D206;
    DEC A                                                                ;A9D20A;
    BEQ .return                                                          ;A9D20B;
    SEP #$20                                                             ;A9D20D;
    LDA.W $0FAF                                                          ;A9D20F;
    BEQ .zero                                                            ;A9D212;
    DEC A                                                                ;A9D214;
    STA.W $0FAF                                                          ;A9D215;

.return:
    REP #$20                                                             ;A9D218;
    RTS                                                                  ;A9D21A;


.zero:
    XBA                                                                  ;A9D21B;
    LDA.W $0FB1                                                          ;A9D21C;
    TAX                                                                  ;A9D21F;
    LDY.W .pointers,X                                                    ;A9D220;
    STY.B $12                                                            ;A9D223;
    LDA.W $0FB0                                                          ;A9D225;
    STA.W $0FAF                                                          ;A9D228;
    LDA.W $0FAE                                                          ;A9D22B;
    BNE .zeroCounter                                                     ;A9D22E;
    LDY.W $0FE8                                                          ;A9D230;
    CPY.W #Function_MotherBrain_SetupBrainAndNeckToBeDrawn               ;A9D233;
    BNE .return                                                          ;A9D236;

.zeroCounter:
    INC A                                                                ;A9D238;
    AND.B #$07                                                           ;A9D239;
    STA.W $0FAE                                                          ;A9D23B;
    REP #$20                                                             ;A9D23E;
    AND.W #$00FF                                                         ;A9D240;
    ASL A                                                                ;A9D243;
    ASL A                                                                ;A9D244;
    ASL A                                                                ;A9D245;
    ADC.B $12                                                            ;A9D246;
    TAY                                                                  ;A9D248;
    LDX.W #$0122                                                         ;A9D249;
    LDA.L $7E781A                                                        ;A9D24C;
    CMP.W #$0200                                                         ;A9D250;
    BEQ +                                                                ;A9D253;
    LDX.W #$01E2                                                         ;A9D255;

  + LDA.W #$0003                                                         ;A9D258;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9D25B;
    RTS                                                                  ;A9D25F;


.pointers:
    dw .normalPaletteSet                                                 ;A9D260;
    dw .chargingLaserPaletteSet                                          ;A9D262;

.normalPaletteSet:
    dw $2EDF,$019B,$008E,$0006,$269F,$0159,$004C,$0004                   ;A9D264;
    dw $1E5D,$0117,$000A,$0002,$161B,$00D5,$0008,$0000                   ;A9D274;
    dw $161B,$00D5,$0008,$0000,$1E5D,$0117,$000A,$0002                   ;A9D284;
    dw $269F,$0159,$004C,$0004,$2EDF,$019B,$008E,$0006                   ;A9D294;

.chargingLaserPaletteSet:
    dw $269F,$0159,$004C,$0004,$229F,$0179,$008E,$0067                   ;A9D2A4;
    dw $1A9F,$01BA,$00F1,$00CB,$16BF,$01FB,$0153,$012E                   ;A9D2B4;
    dw $16BF,$01FB,$0153,$012E,$1A9F,$01BA,$00F1,$00CB                   ;A9D2C4;
    dw $229F,$0179,$008E,$0067,$269F,$0159,$004C,$0004                   ;A9D2D4;

WriteAColorsFromYtoColorIndexX:
    STA.B $12                                                            ;A9D2E4;

.loop:
    LDA.W $0000,Y                                                        ;A9D2E6;
    STA.L $7EC000,X                                                      ;A9D2E9;
    INX                                                                  ;A9D2ED;
    INX                                                                  ;A9D2EE;
    INY                                                                  ;A9D2EF;
    INY                                                                  ;A9D2F0;
    DEC.B $12                                                            ;A9D2F1;
    BNE .loop                                                            ;A9D2F3;
    RTL                                                                  ;A9D2F5;


WriteAColorsFromYToTargetColorIndexX:
    STA.B $12                                                            ;A9D2F6;

.loop:
    LDA.W $0000,Y                                                        ;A9D2F8;
    STA.L $7EC200,X                                                      ;A9D2FB;
    INX                                                                  ;A9D2FF;
    INX                                                                  ;A9D300;
    INY                                                                  ;A9D301;
    INY                                                                  ;A9D302;
    DEC.B $12                                                            ;A9D303;
    BNE .loop                                                            ;A9D305;
    RTL                                                                  ;A9D307;


InitAI_CorpseTorizo:
    PHB                                                                  ;A9D308;
    PEA.W $7E7E                                                          ;A9D309;
    PLB                                                                  ;A9D30C;
    PLB                                                                  ;A9D30D;
    LDA.W #$0000                                                         ;A9D30E;
    LDX.W #$0FFE                                                         ;A9D311;

.loop:
    STA.W $2000,X                                                        ;A9D314;
    DEX                                                                  ;A9D317;
    DEX                                                                  ;A9D318;
    BPL .loop                                                            ;A9D319;
    PLB                                                                  ;A9D31B;
    LDA.W #Function_CorpseTorizo_WaitForSamusCollision                   ;A9D31C;
    STA.W $0FA8                                                          ;A9D31F;
    LDA.W $0F86                                                          ;A9D322;
    ORA.W #$A000                                                         ;A9D325;
    STA.W $0F86                                                          ;A9D328;
    LDA.W #InstList_CorpseTorizo                                         ;A9D32B;
    STA.W $0F92                                                          ;A9D32E;
    LDA.W #$0001                                                         ;A9D331;
    STA.W $0F94                                                          ;A9D334;
    STZ.W $0F90                                                          ;A9D337;
    LDA.W #$0200                                                         ;A9D33A;
    STA.W $0F96                                                          ;A9D33D;
    STZ.W $0FAA                                                          ;A9D340;
    LDA.W #$0008                                                         ;A9D343;
    STA.W $0FAC                                                          ;A9D346;
    LDA.W #$0000                                                         ;A9D349;
    STA.L $7E7808                                                        ;A9D34C;
    LDA.W #$000F                                                         ;A9D350;
    STA.L $7E7804                                                        ;A9D353;
    LDA.W #$0000                                                         ;A9D357;
    STA.L $7E7806                                                        ;A9D35A;
    LDX.W #$0000                                                         ;A9D35E;
    LDY.W #CorpseRottingDefinitions_Torizo                               ;A9D361;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D364;
    RTL                                                                  ;A9D367;


MainAI_CorpseTorizo:
    LDA.W $0F86                                                          ;A9D368;
    AND.W #$0400                                                         ;A9D36B;
    BNE .noCollision                                                     ;A9D36E;
    JSR.W CorpseTorizo_vs_Samus_CollisionDetection                       ;A9D370;
    BCC .noCollision                                                     ;A9D373;
    LDA.W $0F86                                                          ;A9D375;
    ORA.W #$0400                                                         ;A9D378;
    STA.W $0F86                                                          ;A9D37B;
    LDA.W #Function_CorpseTorizo_Rotting                                 ;A9D37E;
    STA.W $0FA8                                                          ;A9D381;

.noCollision:
    LDA.W #EnemyGraphicsDrawnHook_CorpseTorizo>>8&$FF00                  ;A9D384;
    STA.W $178D                                                          ;A9D387;
    LDA.W #EnemyGraphicsDrawnHook_CorpseTorizo                           ;A9D38A;
    STA.W $178C                                                          ;A9D38D;
    LDX.W #$0000                                                         ;A9D390;
    JSR.W ($0FA8,X)                                                      ;A9D393;
    JSR.W ProcessCorpseTorizoRottingVRAMTransfers                        ;A9D396;
    RTL                                                                  ;A9D399;


EnemyGraphicsDrawnHook_CorpseTorizo:
    STZ.B $16                                                            ;A9D39A;
    LDA.W #$0128                                                         ;A9D39C;
    STA.B $12                                                            ;A9D39F;
    LDA.W #$00BB                                                         ;A9D3A1;
    STA.B $14                                                            ;A9D3A4;
    LDY.W #Spritemaps_CorpseTorizo_SandHeap                              ;A9D3A6;
    JSR.W AddSpritemapToOAM_RoomCoordinates                              ;A9D3A9;
    RTL                                                                  ;A9D3AC;


Function_CorpseTorizo_WaitForSamusCollision:
    CPX.W $182C                                                          ;A9D3AD;
    BEQ .collision                                                       ;A9D3B0;
    CPX.W $182E                                                          ;A9D3B2;
    BEQ .collision                                                       ;A9D3B5;
    CPX.W $1830                                                          ;A9D3B7;
    BEQ .collision                                                       ;A9D3BA;
    CPX.W $1832                                                          ;A9D3BC;
    BNE .return                                                          ;A9D3BF;

.collision:
    LDA.W #Function_CorpseTorizo_PreRotDelay                             ;A9D3C1;
    STA.W $0FA8                                                          ;A9D3C4;

.return:
    RTS                                                                  ;A9D3C7;


Function_CorpseTorizo_PreRotDelay:
    LDA.L $7E7808                                                        ;A9D3C8;
    INC A                                                                ;A9D3CC;
    STA.L $7E7808                                                        ;A9D3CD;
    CMP.W #$0010                                                         ;A9D3D1;
    BCS .done                                                            ;A9D3D4;
    RTS                                                                  ;A9D3D6;


.done:
    LDA.W $0F86                                                          ;A9D3D7;
    ORA.W #$0400                                                         ;A9D3DA;
    STA.W $0F86                                                          ;A9D3DD;
    LDA.W #Function_CorpseTorizo_Rotting                                 ;A9D3E0;
    STA.W $0FA8                                                          ;A9D3E3; fallthrough to Function_CorpseTorizo_Rotting

Function_CorpseTorizo_Rotting:
    LDA.L $7E7806                                                        ;A9D3E6;
    INC A                                                                ;A9D3EA;
    STA.L $7E7806                                                        ;A9D3EB;
    CMP.W #$000F                                                         ;A9D3EF;
    BCC .sandHeapFormed                                                  ;A9D3F2;
    LDA.W #$0000                                                         ;A9D3F4;
    STA.L $7E7806                                                        ;A9D3F7;
    LDA.L $7E7804                                                        ;A9D3FB;
    BEQ .sandHeapFormed                                                  ;A9D3FF;
    JSR.W CopyLineOfSandHeapTileData                                     ;A9D401;
    LDA.L $7E7804                                                        ;A9D404;
    DEC A                                                                ;A9D408;
    STA.L $7E7804                                                        ;A9D409;

.sandHeapFormed:
    LDA.W $0FAC                                                          ;A9D40D;
    CLC                                                                  ;A9D410;
    ADC.W #$0001                                                         ;A9D411;
    STA.W $0FAC                                                          ;A9D414;
    LDX.W #$0000                                                         ;A9D417;
    JSL.L MoveEnemyAccordingToVelocity                                   ;A9D41A;
    JSR.W ProcessCorpseRotting                                           ;A9D41E;
    BCS .return                                                          ;A9D421;
    LDA.W #Function_CorpseTorizo_WaitForSamusCollision_return            ;A9D423;
    STA.W $0FA8                                                          ;A9D426;

.return:
    RTS                                                                  ;A9D429;


PowerBombReaction_CorpseTorizo:
    LDA.W $0F86                                                          ;A9D42A;
    AND.W #$0400                                                         ;A9D42D;
    BEQ EnemyTouch_EnemyShot_CorpseTorizo                                ;A9D430;
    RTL                                                                  ;A9D432;


EnemyTouch_EnemyShot_CorpseTorizo:
    LDA.W $0F86                                                          ;A9D433;
    ORA.W #$0400                                                         ;A9D436;
    STA.W $0F86                                                          ;A9D439;
    LDA.W #Function_CorpseTorizo_Rotting                                 ;A9D43C;
    STA.W $0FA8                                                          ;A9D43F;
    RTL                                                                  ;A9D442;


CorpseTorizo_vs_Samus_CollisionDetection:
    LDA.W $0F7A                                                          ;A9D443;
    STA.B $12                                                            ;A9D446;
    LDA.W $0F7E                                                          ;A9D448;
    STA.B $14                                                            ;A9D44B;
    LDX.W #HitboxDefinition_CorpseTorizo                                 ;A9D44D;
    LDA.W $0000,X                                                        ;A9D450;
    BEQ .returnNoCollision                                               ;A9D453;
    STA.B $16                                                            ;A9D455;
    INX                                                                  ;A9D457;
    INX                                                                  ;A9D458;

.loop:
    LDA.W $0AFA                                                          ;A9D459;
    SEC                                                                  ;A9D45C;
    SBC.B $14                                                            ;A9D45D;
    BPL .SamusBelow                                                      ;A9D45F;
    EOR.W #$FFFF                                                         ;A9D461;
    INC A                                                                ;A9D464;
    STA.B $18                                                            ;A9D465;
    LDA.W $0002,X                                                        ;A9D467;
    BRA .checkY                                                          ;A9D46A;


.SamusBelow:
    STA.B $18                                                            ;A9D46C;
    LDA.W $0006,X                                                        ;A9D46E;

.checkY:
    BPL +                                                                ;A9D471;
    EOR.W #$FFFF                                                         ;A9D473;
    INC A                                                                ;A9D476;

  + CLC                                                                  ;A9D477;
    ADC.W $0B00                                                          ;A9D478;
    SEC                                                                  ;A9D47B;
    SBC.B $18                                                            ;A9D47C;
    BMI .next                                                            ;A9D47E;
    LDA.W $0AF6                                                          ;A9D480;
    SEC                                                                  ;A9D483;
    SBC.B $12                                                            ;A9D484;
    BPL .SamusToTheRight                                                 ;A9D486;
    EOR.W #$FFFF                                                         ;A9D488;
    INC A                                                                ;A9D48B;
    STA.B $18                                                            ;A9D48C;
    LDA.W $0000,X                                                        ;A9D48E;
    BRA .checkX                                                          ;A9D491;


.SamusToTheRight:
    STA.B $18                                                            ;A9D493;
    LDA.W $0004,X                                                        ;A9D495;

.checkX:
    BPL +                                                                ;A9D498;
    EOR.W #$FFFF                                                         ;A9D49A;
    INC A                                                                ;A9D49D;

  + CLC                                                                  ;A9D49E;
    ADC.W $0AFE                                                          ;A9D49F;
    SEC                                                                  ;A9D4A2;
    SBC.B $18                                                            ;A9D4A3;
    BPL .collision                                                       ;A9D4A5;

.next:
    DEC.B $16                                                            ;A9D4A7;
    BEQ .returnNoCollision                                               ;A9D4A9;
    TXA                                                                  ;A9D4AB;
    CLC                                                                  ;A9D4AC;
    ADC.W #$0008                                                         ;A9D4AD;
    TAX                                                                  ;A9D4B0;
    JMP.W .loop                                                          ;A9D4B1;


.returnNoCollision:
    CLC                                                                  ;A9D4B4;
    RTS                                                                  ;A9D4B5;


.collision:
    CMP.W #$0004                                                         ;A9D4B6;
    BPL .min4                                                            ;A9D4B9;
    LDA.W #$0004                                                         ;A9D4BB;

.min4:
    STA.W $0B58                                                          ;A9D4BE;
    LDA.W #$0004                                                         ;A9D4C1;
    STA.W $0B5C                                                          ;A9D4C4;
    STZ.W $0B56                                                          ;A9D4C7;
    STZ.W $0B5A                                                          ;A9D4CA;
    SEC                                                                  ;A9D4CD;
    RTS                                                                  ;A9D4CE;


ProcessCorpseTorizoRottingVRAMTransfers:
    LDA.L $7E7800                                                        ;A9D4CF;
    INC A                                                                ;A9D4D3;
    STA.L $7E7800                                                        ;A9D4D4;
    LSR A                                                                ;A9D4D8;
    BCS .odd                                                             ;A9D4D9;
    LDX.W #$0000                                                         ;A9D4DB;
    LDY.W $0330                                                          ;A9D4DE;
    LDA.W .size0,X                                                       ;A9D4E1;

.loopEven:
    STA.W $00D0,Y                                                        ;A9D4E4;
    LDA.W .bank0,X                                                       ;A9D4E7;
    STA.W $00D3,Y                                                        ;A9D4EA;
    LDA.W .src0,X                                                        ;A9D4ED;
    STA.W $00D2,Y                                                        ;A9D4F0;
    LDA.W .dest0,X                                                       ;A9D4F3;
    STA.W $00D5,Y                                                        ;A9D4F6;
    TYA                                                                  ;A9D4F9;
    CLC                                                                  ;A9D4FA;
    ADC.W #$0007                                                         ;A9D4FB;
    TAY                                                                  ;A9D4FE;
    TXA                                                                  ;A9D4FF;
    ADC.W #$0008                                                         ;A9D500;
    TAX                                                                  ;A9D503;
    LDA.W .size0,X                                                       ;A9D504;
    BNE .loopEven                                                        ;A9D507;
    STA.L $7E8004                                                        ;A9D509;
    TYA                                                                  ;A9D50D;
    STA.W $0330                                                          ;A9D50E;
    RTS                                                                  ;A9D511;


.odd:
    LDX.W #$0000                                                         ;A9D512;
    LDY.W $0330                                                          ;A9D515;
    LDA.W .size1,X                                                       ;A9D518;

.loopOdd:
    STA.W $00D0,Y                                                        ;A9D51B;
    LDA.W .bank1,X                                                       ;A9D51E;
    STA.W $00D3,Y                                                        ;A9D521;
    LDA.W .src1,X                                                        ;A9D524;
    STA.W $00D2,Y                                                        ;A9D527;
    LDA.W .dest1,X                                                       ;A9D52A;
    STA.W $00D5,Y                                                        ;A9D52D;
    TYA                                                                  ;A9D530;
    CLC                                                                  ;A9D531;
    ADC.W #$0007                                                         ;A9D532;
    TAY                                                                  ;A9D535;
    TXA                                                                  ;A9D536;
    ADC.W #$0008                                                         ;A9D537;
    TAX                                                                  ;A9D53A;
    LDA.W .size1,X                                                       ;A9D53B;
    BNE .loopOdd                                                         ;A9D53E;
    STA.L $7E8004                                                        ;A9D540;
    TYA                                                                  ;A9D544;
    STA.W $0330                                                          ;A9D545;
    RTS                                                                  ;A9D548;


.size0:
    dw $00C0                                                             ;A9D549;

.bank0:
    dw $7E00                                                             ;A9D54B;

.src0:
    dw $2060                                                             ;A9D54D;

.dest0:
    dw $7090,$00C0,$7E00,$21A0,$7190,$0100,$7E00,$22C0                   ;A9D54F;
    dw $7280,$0100,$7E00,$2400,$7380,$0100,$7E00,$2540                   ;A9D55F;
    dw $7480,$0100,$7E00,$2680,$7580,$0120,$7E00,$9620                   ;A9D56F;
    dw $7100,$0000                                                       ;A9D57F;

.size1:
    dw $0100                                                             ;A9D583;

.bank1:
    dw $7E00                                                             ;A9D585;

.src1:
    dw $27C0                                                             ;A9D587;

.dest1:
    dw $7680,$0100,$7E00,$2900,$7780,$0100,$7E00,$2A40                   ;A9D589;
    dw $7880,$0120,$7E00,$2B60,$7970,$0140,$7E00,$2C80                   ;A9D599;
    dw $7A60,$0140,$7E00,$2DC0,$7B60,$0100,$7E00,$9500                   ;A9D5A9;
    dw $7000,$0000                                                       ;A9D5B9;

CorpseRottingRotEntryFinishedHook_CorpseTorizo:
    PHX                                                                  ;A9D5BD;
    LDA.W $05E5                                                          ;A9D5BE;
    AND.W #$001F                                                         ;A9D5C1;
    CLC                                                                  ;A9D5C4;
    ADC.W #$0110                                                         ;A9D5C5;
    STA.B $12                                                            ;A9D5C8;
    LDA.W #$00BC                                                         ;A9D5CA;
    STA.B $14                                                            ;A9D5CD;
    LDA.W #$000A                                                         ;A9D5CF;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9D5D2;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9D5D5;
    LDA.W $0E44                                                          ;A9D5D9;
    AND.W #$0007                                                         ;A9D5DC;
    BNE .return                                                          ;A9D5DF;
    LDA.W #$0010                                                         ;A9D5E1;
    JSL.L QueueSound_Lib2_Max6                                           ;A9D5E4;

.return:
    PLX                                                                  ;A9D5E8;
    RTS                                                                  ;A9D5E9;


CopyLineOfSandHeapTileData:
    ASL A                                                                ;A9D5EA;
    PHA                                                                  ;A9D5EB;
    TAX                                                                  ;A9D5EC;
    LDA.W .destOffsets,X                                                 ;A9D5ED;
    TAY                                                                  ;A9D5F0;
    PLX                                                                  ;A9D5F1;
    LDA.W .srcOffsets,X                                                  ;A9D5F2;
    TAX                                                                  ;A9D5F5;
    PHB                                                                  ;A9D5F6;
    PEA.W $7E7E                                                          ;A9D5F7;
    PLB                                                                  ;A9D5FA;
    PLB                                                                  ;A9D5FB;
    LDA.L Tiles_CorpseTorizo,X                                           ;A9D5FC;
    STA.W $9500,Y                                                        ;A9D600;
    LDA.L Tiles_CorpseTorizo+$10,X                                       ;A9D603;
    STA.W $9510,Y                                                        ;A9D607;
    LDA.L Tiles_CorpseTorizo+$20,X                                       ;A9D60A;
    STA.W $9520,Y                                                        ;A9D60E;
    LDA.L Tiles_CorpseTorizo+$30,X                                       ;A9D611;
    STA.W $9530,Y                                                        ;A9D615;
    LDA.L Tiles_CorpseTorizo+$40,X                                       ;A9D618;
    STA.W $9540,Y                                                        ;A9D61C;
    LDA.L Tiles_CorpseTorizo+$50,X                                       ;A9D61F;
    STA.W $9550,Y                                                        ;A9D623;
    LDA.L Tiles_CorpseTorizo+$60,X                                       ;A9D626;
    STA.W $9560,Y                                                        ;A9D62A;
    LDA.L Tiles_CorpseTorizo+$70,X                                       ;A9D62D;
    STA.W $9570,Y                                                        ;A9D631;
    LDA.L Tiles_CorpseTorizo+$80,X                                       ;A9D634;
    STA.W $9580,Y                                                        ;A9D638;
    LDA.L Tiles_CorpseTorizo+$90,X                                       ;A9D63B;
    STA.W $9590,Y                                                        ;A9D63F;
    LDA.L Tiles_CorpseTorizo+$A0,X                                       ;A9D642;
    STA.W $95A0,Y                                                        ;A9D646;
    LDA.L Tiles_CorpseTorizo+$B0,X                                       ;A9D649;
    STA.W $95B0,Y                                                        ;A9D64D;
    LDA.L Tiles_CorpseTorizo+$C0,X                                       ;A9D650;
    STA.W $95C0,Y                                                        ;A9D654;
    LDA.L Tiles_CorpseTorizo+$D0,X                                       ;A9D657;
    STA.W $95D0,Y                                                        ;A9D65B;
    LDA.L Tiles_CorpseTorizo+$E0,X                                       ;A9D65E;
    STA.W $95E0,Y                                                        ;A9D662;
    LDA.L Tiles_CorpseTorizo+$F0,X                                       ;A9D665;
    STA.W $95F0,Y                                                        ;A9D669;
    LDA.L Tiles_CorpseTorizo+$100,X                                      ;A9D66C;
    STA.W $9600,Y                                                        ;A9D670;
    LDA.L Tiles_CorpseTorizo+$110,X                                      ;A9D673;
    STA.W $9610,Y                                                        ;A9D677;
    PLB                                                                  ;A9D67A;
    RTS                                                                  ;A9D67B;


.destOffsets:
    dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E                   ;A9D67C;
    dw $0120,$0122,$0124,$0126,$0128,$012A,$012C,$012E                   ;A9D68C;

.srcOffsets:
    dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E                   ;A9D69C;
    dw $0200,$0202,$0204,$0206,$0208,$020A,$020C,$020E                   ;A9D6AC;

Palette_CorpseTorizo:
    dw $3800,$4F38,$3A52,$0CA5,$0042,$42D5,$2DEF,$218B                   ;A9D6BC;
    dw $1528,$4F38,$42B4,$3631,$29CD,$1949,$0CC6,$0042                   ;A9D6CC;

InstList_CorpseTorizo:
    dw $0001                                                             ;A9D6DC;
    dw Spritemaps_CorpseTorizo                                           ;A9D6DE;
    dw Instruction_Common_Sleep                                          ;A9D6E0;

Spritemaps_CorpseTorizo:
    dw $0019,$01E8                                                       ;A9D6E2;
    db $14                                                               ;A9D6E6;
    dw $2397,$C218                                                       ;A9D6E7;
    db $CC                                                               ;A9D6EB;
    dw $230D,$C208                                                       ;A9D6EC;
    db $CC                                                               ;A9D6F0;
    dw $230B,$C3F8                                                       ;A9D6F1;
    db $CC                                                               ;A9D6F5;
    dw $2309,$C220                                                       ;A9D6F6;
    db $DC                                                               ;A9D6FA;
    dw $232E,$C210                                                       ;A9D6FB;
    db $DC                                                               ;A9D6FF;
    dw $232C,$C200                                                       ;A9D700;
    db $DC                                                               ;A9D704;
    dw $232A,$C3F0                                                       ;A9D705;
    db $DC                                                               ;A9D709;
    dw $2328,$C220                                                       ;A9D70A;
    db $EC                                                               ;A9D70E;
    dw $234E,$C210                                                       ;A9D70F;
    db $EC                                                               ;A9D713;
    dw $234C,$C200                                                       ;A9D714;
    db $EC                                                               ;A9D718;
    dw $234A,$C3F0                                                       ;A9D719;
    db $EC                                                               ;A9D71D;
    dw $2348,$C220                                                       ;A9D71E;
    db $FC                                                               ;A9D722;
    dw $236E,$C210                                                       ;A9D723;
    db $FC                                                               ;A9D727;
    dw $236C,$C200                                                       ;A9D728;
    db $FC                                                               ;A9D72C;
    dw $236A,$C3F0                                                       ;A9D72D;
    db $FC                                                               ;A9D731;
    dw $2368,$C220                                                       ;A9D732;
    db $0C                                                               ;A9D736;
    dw $238E,$C210                                                       ;A9D737;
    db $0C                                                               ;A9D73B;
    dw $238C,$C200                                                       ;A9D73C;
    db $0C                                                               ;A9D740;
    dw $238A,$C3F0                                                       ;A9D741;
    db $0C                                                               ;A9D745;
    dw $2388,$C220                                                       ;A9D746;
    db $1C                                                               ;A9D74A;
    dw $23AE,$C210                                                       ;A9D74B;
    db $1C                                                               ;A9D74F;
    dw $23AC,$C200                                                       ;A9D750;
    db $1C                                                               ;A9D754;
    dw $23AA,$C3F0                                                       ;A9D755;
    db $1C                                                               ;A9D759;
    dw $23A8,$C3E0                                                       ;A9D75A;
    db $1C                                                               ;A9D75E;
    dw $23A6                                                             ;A9D75F;

Spritemaps_CorpseTorizo_SandHeap:
    dw $0005,$0018                                                       ;A9D761;
    db $FE                                                               ;A9D765;
    dw $2318,$C208                                                       ;A9D766;
    db $F6                                                               ;A9D76A;
    dw $2306,$C3F8                                                       ;A9D76B;
    db $F6                                                               ;A9D76F;
    dw $2304,$C3E8                                                       ;A9D770;
    db $F6                                                               ;A9D774;
    dw $2302,$C3D8                                                       ;A9D775;
    db $F6                                                               ;A9D779;
    dw $2300                                                             ;A9D77A;

HitboxDefinition_CorpseTorizo:
    dw $0007,$FFE1,$0025,$FFF5,$002B,$0010,$0025,$0026                   ;A9D77C;
    dw $002B,$FFE8,$0012,$FFF3,$0024,$000B,$001A,$0019                   ;A9D78C;
    dw $0024,$FFF6,$FFE2,$0010,$0018,$FFF9,$FFD4,$0022                   ;A9D79C;
    dw $FFE1,$0011,$FFE1,$0028,$FFF9                                     ;A9D7AC;

InitAI_CorpseSidehopper:
    LDX.W $0E54                                                          ;A9D7B6;
    LDA.W $0FB4,X                                                        ;A9D7B9;
    TAX                                                                  ;A9D7BC;
    JMP.W (.pointers,X)                                                  ;A9D7BD;


.pointers:
    dw CorpseSidehopperInit_Param1_0_InitiallyAlive                      ;A9D7C0;
    dw CorpseSidehopperInit_Param1_2_InitiallyDead                       ;A9D7C2;

CorpseSidehopperInit_Param1_0_InitiallyAlive:
    LDX.W $0E54                                                          ;A9D7C4;
    LDA.W $0F86,X                                                        ;A9D7C7;
    AND.W #$7FFF                                                         ;A9D7CA;
    ORA.W #$0800                                                         ;A9D7CD;
    STA.W $0F86,X                                                        ;A9D7D0;
    LDA.W $0F86                                                          ;A9D7D3;
    AND.W #$0100                                                         ;A9D7D6;
    BEQ .visible                                                         ;A9D7D9;
    LDA.W $0F86,X                                                        ;A9D7DB;
    ORA.W #$0200                                                         ;A9D7DE;
    STA.W $0F86,X                                                        ;A9D7E1;

.visible:
    LDA.W #$0000                                                         ;A9D7E4;
    STA.L $7E7810,X                                                      ;A9D7E7;
    LDA.W #$0060                                                         ;A9D7EB;
    STA.L $7E7814,X                                                      ;A9D7EE;
    LDA.W #$0100                                                         ;A9D7F2;
    STA.L $7E7816,X                                                      ;A9D7F5;
    LDA.W #$01E8                                                         ;A9D7F9;
    STA.W $0F7A,X                                                        ;A9D7FC;
    LDA.W #$00B8                                                         ;A9D7FF;
    STA.W $0F7E,X                                                        ;A9D802;
    LDA.W #Function_CorpseSidehopper_Alive_WaitingForActivation          ;A9D805;
    STA.W $0FA8,X                                                        ;A9D808;
    LDA.W #$0200                                                         ;A9D80B;
    STA.W $0F96,X                                                        ;A9D80E;
    LDA.W #$0015                                                         ;A9D811;
    STA.W $0F84,X                                                        ;A9D814;
    LDA.W #InstList_CorpseSidehopper_Alive_Idle                          ;A9D817;
    JSL.L SetEnemyInstList                                               ;A9D81A;
    LDY.W #CorpseRottingDefinitions_Sidehopper_Param1_0                  ;A9D81E;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D821;
    RTL                                                                  ;A9D824;


CorpseSidehopperInit_Param1_2_InitiallyDead:
    LDX.W $0E54                                                          ;A9D825;
    LDA.W #$FFFF                                                         ;A9D828;
    STA.L $7E7810,X                                                      ;A9D82B;
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision          ;A9D82F;
    STA.W $0FA8,X                                                        ;A9D832;
    LDA.W #$0E00                                                         ;A9D835;
    STA.W $0F96,X                                                        ;A9D838;
    LDA.W #InstList_CorpseSidehopper_Alive_Dead                          ;A9D83B;
    JSL.L SetEnemyInstList                                               ;A9D83E;
    LDY.W #CorpseRottingDefinitions_Sidehopper_Param1_2                  ;A9D842;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D845;
    RTL                                                                  ;A9D848;


InitAI_CorpseZoomer:
    LDX.W $0E54                                                          ;A9D849;
    LDA.W #$0E00                                                         ;A9D84C;
    STA.W $0F96,X                                                        ;A9D84F;
    LDA.W #Function_CorpseZoomer_WaitForSamusCollision                   ;A9D852;
    STA.W $0FA8,X                                                        ;A9D855;
    LDY.W $0FB4,X                                                        ;A9D858;
    LDA.W .instListPointers,Y                                            ;A9D85B;
    JSL.L SetEnemyInstList                                               ;A9D85E;
    LDA.W .corpseRottingDefinitionPointers,Y                             ;A9D862;
    TAY                                                                  ;A9D865;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D866;
    RTL                                                                  ;A9D869;


.instListPointers:
    dw InstList_CorpseZoomer_Param1_0                                    ;A9D86A;
    dw InstList_CorpseZoomer_Param1_2                                    ;A9D86C;
    dw InstList_CorpseZoomer_Param1_4                                    ;A9D86E;

.corpseRottingDefinitionPointers:
    dw CorpseRottingDefinitions_Zoomer_Param1_0                          ;A9D870;
    dw CorpseRottingDefinitions_Zoomer_Param1_2                          ;A9D872;
    dw CorpseRottingDefinitions_Zoomer_Param1_4                          ;A9D874;

InitAI_CorpseRipper:
    LDX.W $0E54                                                          ;A9D876;
    LDA.W #$0E00                                                         ;A9D879;
    STA.W $0F96,X                                                        ;A9D87C;
    LDA.W #Function_CorpseRipper_WaitForSamusCollision                   ;A9D87F;
    STA.W $0FA8,X                                                        ;A9D882;
    LDY.W $0FB4,X                                                        ;A9D885;
    LDA.W .instListPointers,Y                                            ;A9D888;
    JSL.L SetEnemyInstList                                               ;A9D88B;
    LDA.W .corpseRottingDefinitionPointers,Y                             ;A9D88F;
    TAY                                                                  ;A9D892;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D893;
    RTL                                                                  ;A9D896;


.instListPointers:
    dw InstList_CorpseRipper_Param1_0                                    ;A9D897;
    dw InstList_CorpseRipper_Param1_2                                    ;A9D899;

.corpseRottingDefinitionPointers:
    dw CorpseRottingDefinitions_Ripper_Param1_0                          ;A9D89B;
    dw CorpseRottingDefinitions_Ripper_Param1_2                          ;A9D89D;

InitAI_CorpseSkree:
    LDX.W $0E54                                                          ;A9D89F;
    LDA.W #$0E00                                                         ;A9D8A2;
    STA.W $0F96,X                                                        ;A9D8A5;
    LDA.W #Function_CorpseSkree_WaitForSamusCollision                    ;A9D8A8;
    STA.W $0FA8,X                                                        ;A9D8AB;
    LDY.W $0FB4,X                                                        ;A9D8AE;
    LDA.W .instListPointers,Y                                            ;A9D8B1;
    JSL.L SetEnemyInstList                                               ;A9D8B4;
    LDA.W .corpseRottingDefinitionPointers,Y                             ;A9D8B8;
    TAY                                                                  ;A9D8BB;
    JSR.W InitializeEnemyCorpseRotting                                   ;A9D8BC;
    RTL                                                                  ;A9D8BF;


.instListPointers:
    dw InstList_CorpseSkree_Param1_0                                     ;A9D8C0;
    dw InstList_CorpseSkree_Param1_2                                     ;A9D8C2;
    dw InstList_CorpseSkree_Param1_4                                     ;A9D8C4;

.corpseRottingDefinitionPointers:
    dw CorpseRottingDefinitions_Skree_Param1_0                           ;A9D8C6;
    dw CorpseRottingDefinitions_Skree_Param1_2                           ;A9D8C8;
    dw CorpseRottingDefinitions_Skree_Param1_4                           ;A9D8CA;

PowerBombReaction_CorpseSidehopper:
    LDX.W $0E54                                                          ;A9D8CC;
    LDA.L $7E7810,X                                                      ;A9D8CF;
    CMP.W #$0008                                                         ;A9D8D3;
    BCC MainAI_HurtAI_CorpseEnemies                                      ;A9D8D6;
    JMP.W EnemyShot_CorpseSidehopper                                     ;A9D8D8;


MainAI_HurtAI_CorpseEnemies:
    LDX.W $0E54                                                          ;A9D8DB;
    JSR.W ($0FA8,X)                                                      ;A9D8DE;
    RTL                                                                  ;A9D8E1;


Function_CorpseSidehopper_Alive_WaitingForActivation:
    LDA.W $0911                                                          ;A9D8E2;
    CMP.W #$0201                                                         ;A9D8E5;
    BMI .activate                                                        ;A9D8E8;
    RTS                                                                  ;A9D8EA;


.activate:
    LDA.W #Function_CorpseSidehopper_Hopping                             ;A9D8EB;
    STA.W $0FA8,X                                                        ;A9D8EE; fallthrough to Function_CorpseSidehopper_Hopping

Function_CorpseSidehopper_Hopping:
    JSR.W CorpseSidehopperMovement                                       ;A9D8F1;
    BCC .return                                                          ;A9D8F4;
    LDA.L $7E780C,X                                                      ;A9D8F6;
    INC A                                                                ;A9D8FA;
    AND.W #$0003                                                         ;A9D8FB;
    STA.L $7E780C,X                                                      ;A9D8FE;
    LDA.W #InstList_CorpseSidehopper_Alive_Hopping                       ;A9D902;
    JSL.L SetEnemyInstList                                               ;A9D905;
    LDA.W #.return                                                       ;A9D909;
    STA.W $0FA8,X                                                        ;A9D90C;

.return:
    RTS                                                                  ;A9D90F;


Function_CorpseSidehopper_StartIdling:
    LDA.W #Function_CorpseSidehopper_Idling                              ;A9D910;
    STA.W $0FA8,X                                                        ;A9D913;
    LDA.W #$0040                                                         ;A9D916;
    STA.W $0FB2,X                                                        ;A9D919;
    RTS                                                                  ;A9D91C;


Function_CorpseSidehopper_Idling:
    DEC.W $0FB2,X                                                        ;A9D91D;
    BPL .return                                                          ;A9D920;
    LDA.L $7E7810,X                                                      ;A9D922;
    BEQ .notDone                                                         ;A9D926;
    LDA.W #Function_CorpseSidehopper_BeingDrained                        ;A9D928;
    STA.W $0FA8,X                                                        ;A9D92B;
    RTS                                                                  ;A9D92E;


.notDone:
    LDA.W #Function_CorpseSidehopper_Hopping                             ;A9D92F;
    STA.W $0FA8,X                                                        ;A9D932;
    LDA.W #InstList_CorpseSidehopper_Alive_Idle                          ;A9D935;
    JSL.L SetEnemyInstList                                               ;A9D938;
    LDA.L $7E780C,X                                                      ;A9D93C;
    ASL A                                                                ;A9D940;
    TAY                                                                  ;A9D941;
    LDA.W .YVelocity,Y                                                   ;A9D942;
    STA.L $7E7816,X                                                      ;A9D945;
    LDA.W .XVelocity,Y                                                   ;A9D949;
    STA.L $7E7814,X                                                      ;A9D94C;

.return:
    RTS                                                                  ;A9D950;


.YVelocity:
    dw $FE00,$FE00,$FE00,$FC00                                           ;A9D951;

.XVelocity:
    dw $01C0,$0120,$0120,$0300                                           ;A9D959;

CorpseSidehopperMovement:
    LDA.L $7E7814,X                                                      ;A9D961;
    JSR.W CorpseSidehopperMovement_Horizontal                            ;A9D965;
    LDY.W #$0020                                                         ;A9D968;
    LDA.L $7E7816,X                                                      ;A9D96B;
    BMI .rising                                                          ;A9D96F;
    LDY.W #$0080                                                         ;A9D971;

.rising:
    TYA                                                                  ;A9D974;
    CLC                                                                  ;A9D975;
    ADC.L $7E7816,X                                                      ;A9D976;
    STA.L $7E7816,X                                                      ;A9D97A;
    STA.B $12                                                            ;A9D97E;
    LDA.W $0F7A,X                                                        ;A9D980;
    CMP.W #$0220                                                         ;A9D983;
    BMI .lessThan220                                                     ;A9D986;
    LDA.B $12                                                            ;A9D988;
    SEP #$20                                                             ;A9D98A;
    STA.B $13                                                            ;A9D98C;
    STZ.B $12                                                            ;A9D98E;
    REP #$20                                                             ;A9D990;
    AND.W #$FF00                                                         ;A9D992;
    BPL +                                                                ;A9D995;
    ORA.W #$00FF                                                         ;A9D997;

  + XBA                                                                  ;A9D99A;
    STA.B $14                                                            ;A9D99B;
    JSL.L MoveEnemyDownBy_14_12                                          ;A9D99D;
    RTS                                                                  ;A9D9A1;


.lessThan220:
    LDA.B $12                                                            ;A9D9A2;
    SEP #$20                                                             ;A9D9A4;
    CLC                                                                  ;A9D9A6;
    ADC.W $0F81,X                                                        ;A9D9A7;
    STA.W $0F81,X                                                        ;A9D9AA;
    REP #$20                                                             ;A9D9AD;
    AND.W #$FF00                                                         ;A9D9AF;
    XBA                                                                  ;A9D9B2;
    BPL +                                                                ;A9D9B3;
    ORA.W #$FF00                                                         ;A9D9B5;

  + ADC.W $0F7E,X                                                        ;A9D9B8;
    STA.W $0F7E,X                                                        ;A9D9BB;
    CMP.W #$00B8                                                         ;A9D9BE;
    BMI .lessThanB8                                                      ;A9D9C1;
    SEC                                                                  ;A9D9C3;
    RTS                                                                  ;A9D9C4;


.lessThanB8:
    CLC                                                                  ;A9D9C5;
    RTS                                                                  ;A9D9C6;


CorpseSidehopperMovement_Horizontal:
    STA.B $12                                                            ;A9D9C7;
    LDA.W $0F7A,X                                                        ;A9D9C9;
    CMP.W #$0220                                                         ;A9D9CC;
    BMI .lessThan220                                                     ;A9D9CF;
    LDA.B $12                                                            ;A9D9D1;
    SEP #$20                                                             ;A9D9D3;
    STA.B $13                                                            ;A9D9D5;
    STZ.B $12                                                            ;A9D9D7;
    REP #$20                                                             ;A9D9D9;
    AND.W #$FF00                                                         ;A9D9DB;
    BPL +                                                                ;A9D9DE;
    ORA.W #$00FF                                                         ;A9D9E0;

  + XBA                                                                  ;A9D9E3;
    STA.B $14                                                            ;A9D9E4;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A9D9E6;
    RTS                                                                  ;A9D9EA;


.lessThan220:
    LDA.B $12                                                            ;A9D9EB;
    SEP #$20                                                             ;A9D9ED;
    CLC                                                                  ;A9D9EF;
    ADC.W $0F7D,X                                                        ;A9D9F0;
    STA.W $0F7D,X                                                        ;A9D9F3;
    REP #$20                                                             ;A9D9F6;
    AND.W #$FF00                                                         ;A9D9F8;
    XBA                                                                  ;A9D9FB;
    BPL +                                                                ;A9D9FC;
    ORA.W #$FF00                                                         ;A9D9FE;

  + ADC.W $0F7A,X                                                        ;A9DA01;
    STA.W $0F7A,X                                                        ;A9DA04;
    RTS                                                                  ;A9DA07;


Function_CorpseSidehopper_BeingDrained:
    LDA.L $7E780E,X                                                      ;A9DA08;
    INC A                                                                ;A9DA0C;
    STA.L $7E780E,X                                                      ;A9DA0D;
    CMP.W #$0008                                                         ;A9DA11;
    BCC .return                                                          ;A9DA14;
    LDA.W #$0000                                                         ;A9DA16;
    STA.L $7E780E,X                                                      ;A9DA19;
    LDA.L $7E7810,X                                                      ;A9DA1D;
    DEC A                                                                ;A9DA21;
    ASL A                                                                ;A9DA22;
    ASL A                                                                ;A9DA23;
    ASL A                                                                ;A9DA24;
    ASL A                                                                ;A9DA25;
    ASL A                                                                ;A9DA26;
    ADC.W #Palette_SidehopperCorpseBeingDrained_0                        ;A9DA27;
    TAY                                                                  ;A9DA2A;
    LDX.W #$0122                                                         ;A9DA2B;
    LDA.W #$000F                                                         ;A9DA2E;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9DA31;
    LDX.W $0E54                                                          ;A9DA35;
    LDA.L $7E7810,X                                                      ;A9DA38;
    INC A                                                                ;A9DA3C;
    STA.L $7E7810,X                                                      ;A9DA3D;
    CMP.W #$0008                                                         ;A9DA41;
    BCC .return                                                          ;A9DA44;
    LDA.W #InstList_CorpseSidehopper_Alive_Corpse                        ;A9DA46;
    JSL.L SetEnemyInstList                                               ;A9DA49;
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision          ;A9DA4D;
    STA.W $0FA8,X                                                        ;A9DA50;
    LDA.W $0F86,X                                                        ;A9DA53;
    ORA.W #$8000                                                         ;A9DA56;
    STA.W $0F86,X                                                        ;A9DA59;
    LDA.W #$000C                                                         ;A9DA5C;
    STA.W $0F84,X                                                        ;A9DA5F;

.return:
    RTS                                                                  ;A9DA62;


RTS_A9DA63:
    RTS                                                                  ;A9DA63;


Function_CorpseSidehopper_Dead_WaitForSamusCollision:
    LDY.W #Function_CorpseSidehopper_PreRotDelay                         ;A9DA64;
    BRA CorpseCommonAI_WaitForSamusCollision                             ;A9DA67;


Function_CorpseZoomer_WaitForSamusCollision:
    LDY.W #Function_CorpseZoomer_PreRotDelay                             ;A9DA69;
    BRA CorpseCommonAI_WaitForSamusCollision                             ;A9DA6C;


Function_CorpseSkree_WaitForSamusCollision:
    LDY.W #Function_CorpseSkree_PreRotDelay                              ;A9DA6E;
    BRA CorpseCommonAI_WaitForSamusCollision                             ;A9DA71;


Function_CorpseRipper_WaitForSamusCollision:
    LDY.W #Function_CorpseRipper_PreRotDelay                             ;A9DA73;

CorpseCommonAI_WaitForSamusCollision:
    CPX.W $182C                                                          ;A9DA76;
    BEQ .collision                                                       ;A9DA79;
    CPX.W $182E                                                          ;A9DA7B;
    BEQ .collision                                                       ;A9DA7E;
    CPX.W $1830                                                          ;A9DA80;
    BEQ .collision                                                       ;A9DA83;
    CPX.W $1832                                                          ;A9DA85;
    BNE .return                                                          ;A9DA88;

.collision:
    TYA                                                                  ;A9DA8A;
    STA.W $0FA8,X                                                        ;A9DA8B;

.return:
    RTS                                                                  ;A9DA8E;


Function_CorpseSidehopper_PreRotDelay:
    LDY.W #Function_CorpseSidehopper_Rotting                             ;A9DA8F;
    BRA CorpseCommonAI_PreRotDelay                                       ;A9DA92;


Function_CorpseZoomer_PreRotDelay:
    LDY.W #Function_CorpseZoomer_Rotting                                 ;A9DA94;
    BRA CorpseCommonAI_PreRotDelay                                       ;A9DA97;


Function_CorpseRipper_PreRotDelay:
    LDY.W #Function_CorpseRipper_Rotting                                 ;A9DA99;
    BRA CorpseCommonAI_PreRotDelay                                       ;A9DA9C;


Function_CorpseSkree_PreRotDelay:
    LDY.W #Function_CorpseSkree_Rotting                                  ;A9DA9E;

CorpseCommonAI_PreRotDelay:
    INC.W $0FAA,X                                                        ;A9DAA1;
    LDA.W $0FAA,X                                                        ;A9DAA4;
    CMP.W #$0010                                                         ;A9DAA7;
    BCC .return                                                          ;A9DAAA;
    TYA                                                                  ;A9DAAC;
    STA.W $0FA8,X                                                        ;A9DAAD;
    LDA.W $0F86,X                                                        ;A9DAB0;
    ORA.W #$0400                                                         ;A9DAB3;
    STA.W $0F86,X                                                        ;A9DAB6;

.return:
    RTS                                                                  ;A9DAB9;


Function_CorpseSidehopper_Rotting:
    JSR.W ProcessCorpseRotting                                           ;A9DABA;
    LDX.W $0E54                                                          ;A9DABD;
    BCS .process                                                         ;A9DAC0;
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision          ;A9DAC2;
    STA.W $0FA8,X                                                        ;A9DAC5;

.process:
    LDA.L $7E8826,X                                                      ;A9DAC8;
    TAX                                                                  ;A9DACC;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9DACD;


Function_CorpseZoomer_Rotting:
    JSR.W ProcessCorpseRotting                                           ;A9DAD0;
    LDX.W $0E54                                                          ;A9DAD3;
    BCS .process                                                         ;A9DAD6;
    LDA.W #RTS_A9DA63                                                    ;A9DAD8;
    STA.W $0FA8,X                                                        ;A9DADB;

.process:
    LDA.L $7E8826,X                                                      ;A9DADE;
    TAX                                                                  ;A9DAE2;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9DAE3;


Function_CorpseRipper_Rotting:
    JSR.W ProcessCorpseRotting                                           ;A9DAE6;
    LDX.W $0E54                                                          ;A9DAE9;
    BCS .process                                                         ;A9DAEC;
    LDA.W #RTS_A9DA63                                                    ;A9DAEE;
    STA.W $0FA8,X                                                        ;A9DAF1;

.process:
    LDA.L $7E8826,X                                                      ;A9DAF4;
    TAX                                                                  ;A9DAF8;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9DAF9;


Function_CorpseSkree_Rotting:
    JSR.W ProcessCorpseRotting                                           ;A9DAFC;
    LDX.W $0E54                                                          ;A9DAFF;
    BCS .process                                                         ;A9DB02;
    LDA.W #RTS_A9DA63                                                    ;A9DB04;
    STA.W $0FA8,X                                                        ;A9DB07;

.process:
    LDA.L $7E8826,X                                                      ;A9DB0A;
    TAX                                                                  ;A9DB0E;
    JMP.W ProcessCorpseRottingVRAMTransfers                              ;A9DB0F;


ProcessCorpseRotting:
    PHB                                                                  ;A9DB12;
    PEA.W $7E7E                                                          ;A9DB13;
    PLB                                                                  ;A9DB16;
    PLB                                                                  ;A9DB17;
    LDA.W $882E,X                                                        ;A9DB18;
    STA.W $880A                                                          ;A9DB1B;
    LDA.W $8830,X                                                        ;A9DB1E;
    STA.W $880C                                                          ;A9DB21;
    LDA.W $8832,X                                                        ;A9DB24;
    STA.W $880E                                                          ;A9DB27;
    LDA.W $8834,X                                                        ;A9DB2A;
    STA.W $8810                                                          ;A9DB2D;
    LDA.W $8836,X                                                        ;A9DB30;
    STA.W $8812                                                          ;A9DB33;
    LDA.W $882C,X                                                        ;A9DB36;
    STA.W $8808                                                          ;A9DB39;
    LDA.W $8828,X                                                        ;A9DB3C;
    STA.W $8804                                                          ;A9DB3F;
    LDA.W $882A,X                                                        ;A9DB42;
    STA.W $8806                                                          ;A9DB45;
    LDA.W $8824,X                                                        ;A9DB48;
    TAX                                                                  ;A9DB4B;
    LDA.W #$0000                                                         ;A9DB4C;

.loop:
    PHA                                                                  ;A9DB4F;
    LDA.W $0000,X                                                        ;A9DB50;
    BMI .next                                                            ;A9DB53;
    LDA.W $0002,X                                                        ;A9DB55;
    BEQ .timerExpired                                                    ;A9DB58;
    DEC A                                                                ;A9DB5A;
    STA.W $0002,X                                                        ;A9DB5B;
    CMP.W #$0004                                                         ;A9DB5E;
    BCS .next                                                            ;A9DB61;
    LDA.W $8804                                                          ;A9DB63;
    STA.B $12                                                            ;A9DB66;
    LDA.B $01,S                                                          ;A9DB68;
    CMP.W $880E                                                          ;A9DB6A;
    BCC +                                                                ;A9DB6D;
    LDA.W $8806                                                          ;A9DB6F;
    STA.B $12                                                            ;A9DB72;

  + LDA.W $8808                                                          ;A9DB74;
    STA.B $14                                                            ;A9DB77;
    LDA.W #$00A9                                                         ;A9DB79;
    STA.B $16                                                            ;A9DB7C;
    PHX                                                                  ;A9DB7E;
    LDA.W $0000,X                                                        ;A9DB7F;
    JSR.W CopMoveCorpseRottingRotEntry                                   ;A9DB82;
    PLX                                                                  ;A9DB85;
    BRA .next                                                            ;A9DB86;


.timerExpired:
    PHX                                                                  ;A9DB88;
    LDA.W $8806                                                          ;A9DB89;
    STA.B $12                                                            ;A9DB8C;
    LDA.W $8808                                                          ;A9DB8E;
    STA.B $14                                                            ;A9DB91;
    LDA.W #$00A9                                                         ;A9DB93;
    STA.B $16                                                            ;A9DB96;
    LDA.W $0000,X                                                        ;A9DB98;
    JSR.W CopMoveCorpseRottingRotEntry                                   ;A9DB9B;
    PLX                                                                  ;A9DB9E;
    LDA.W $0000,X                                                        ;A9DB9F;
    CLC                                                                  ;A9DBA2;
    ADC.W #$0002                                                         ;A9DBA3;
    CMP.W $880C                                                          ;A9DBA6;
    BCC .store                                                           ;A9DBA9;
    LDA.W $8812                                                          ;A9DBAB;
    STA.B $12                                                            ;A9DBAE;
    PHK                                                                  ;A9DBB0;
    PLB                                                                  ;A9DBB1;
    PEA.W .manualReturn-1                                                ;A9DBB2;
    JMP.W ($0012)                                                        ;A9DBB5;


.manualReturn:
    PEA.W $7E7E                                                          ;A9DBB8;
    PLB                                                                  ;A9DBBB;
    PLB                                                                  ;A9DBBC;
    LDA.B $01,S                                                          ;A9DBBD;
    CMP.W $880C                                                          ;A9DBBF;
    BCS .returnFinishedRotting                                           ;A9DBC2;
    LDA.W #$FFFF                                                         ;A9DBC4;

.store:
    STA.W $0000,X                                                        ;A9DBC7;

.next:
    TXA                                                                  ;A9DBCA;
    CLC                                                                  ;A9DBCB;
    ADC.W #$0004                                                         ;A9DBCC;
    TAX                                                                  ;A9DBCF;
    PLA                                                                  ;A9DBD0;
    INC A                                                                ;A9DBD1;
    CMP.W $880A                                                          ;A9DBD2;
    BPL .returnNotFinished                                               ;A9DBD5;
    JMP.W .loop                                                          ;A9DBD7;


.returnNotFinished:
    PLB                                                                  ;A9DBDA;
    RTS                                                                  ;A9DBDB;


.returnFinishedRotting:
    PLA                                                                  ;A9DBDC;
    PLB                                                                  ;A9DBDD;
    CLC                                                                  ;A9DBDE;
    RTS                                                                  ;A9DBDF;


CopMoveCorpseRottingRotEntry:
    STA.W $8802                                                          ;A9DBE0;
    TAY                                                                  ;A9DBE3;
    AND.W #$FFF8                                                         ;A9DBE4;
    LSR A                                                                ;A9DBE7;
    LSR A                                                                ;A9DBE8;
    TAX                                                                  ;A9DBE9;
    TYA                                                                  ;A9DBEA;
    AND.W #$0007                                                         ;A9DBEB;
    CMP.W #$0006                                                         ;A9DBEE;
    BCS .greaterThan5                                                    ;A9DBF1;
    TXY                                                                  ;A9DBF3;
    ASL A                                                                ;A9DBF4;
    ADC.B [$14],Y                                                        ;A9DBF5;
    TAX                                                                  ;A9DBF7;
    TAY                                                                  ;A9DBF8;
    JMP.W ($0012)                                                        ;A9DBF9;


.greaterThan5:
    TXY                                                                  ;A9DBFC;
    ASL A                                                                ;A9DBFD;
    ADC.B [$14],Y                                                        ;A9DBFE;
    TAX                                                                  ;A9DC00;
    ADC.W $8810                                                          ;A9DC01;
    TAY                                                                  ;A9DC04;
    JMP.W ($0012)                                                        ;A9DC05;


CorpseRotEntryFinishedHook_Normal:
    PHX                                                                  ;A9DC08;
    LDA.W $05E5                                                          ;A9DC09;
    AND.W #$001A                                                         ;A9DC0C;
    LDX.W $0E54                                                          ;A9DC0F;
    CLC                                                                  ;A9DC12;
    ADC.W $0F7A,X                                                        ;A9DC13;
    CLC                                                                  ;A9DC16;
    ADC.W #$FFF2                                                         ;A9DC17;
    STA.B $12                                                            ;A9DC1A;
    LDA.W $0F7E,X                                                        ;A9DC1C;
    CLC                                                                  ;A9DC1F;
    ADC.W #$0010                                                         ;A9DC20;
    STA.B $14                                                            ;A9DC23;
    LDA.W #$000A                                                         ;A9DC25;
    LDY.W #EnemyProjectile_MiscDust                                      ;A9DC28;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A9DC2B;
    LDA.W $0E44                                                          ;A9DC2F;
    AND.W #$0007                                                         ;A9DC32;
    BNE .return                                                          ;A9DC35;
    LDA.W #$0010                                                         ;A9DC37;
    JSL.L QueueSound_Lib2_Max3                                           ;A9DC3A;

.return:
    PLX                                                                  ;A9DC3E;
    RTS                                                                  ;A9DC3F;


InitializeCorpseRottingDataTable:
    DEC A                                                                ;A9DC40;
    STZ.B $12                                                            ;A9DC41;

.loop:
    PHA                                                                  ;A9DC43;
    STA.L $7E0000,X                                                      ;A9DC44;
    LDA.B $12                                                            ;A9DC48;
    INX                                                                  ;A9DC4A;
    INX                                                                  ;A9DC4B;
    STA.L $7E0000,X                                                      ;A9DC4C;
    INX                                                                  ;A9DC50;
    INX                                                                  ;A9DC51;
    LDA.B $12                                                            ;A9DC52;
    CLC                                                                  ;A9DC54;
    ADC.W #$0002                                                         ;A9DC55;
    STA.B $12                                                            ;A9DC58;
    PLA                                                                  ;A9DC5A;
    DEC A                                                                ;A9DC5B;
    BPL .loop                                                            ;A9DC5C;
    RTS                                                                  ;A9DC5E;


InitializeEnemyCorpseRotting:
    LDA.W $0000,Y                                                        ;A9DC5F;
    STA.L $7E8824,X                                                      ;A9DC62;
    LDA.W $0002,Y                                                        ;A9DC66;
    STA.L $7E8826,X                                                      ;A9DC69;
    LDA.W $0004,Y                                                        ;A9DC6D;
    STA.L $7E8828,X                                                      ;A9DC70;
    LDA.W $0006,Y                                                        ;A9DC74;
    STA.L $7E882A,X                                                      ;A9DC77;
    LDA.W $000E,Y                                                        ;A9DC7B;
    STA.L $7E8836,X                                                      ;A9DC7E;
    LDA.W $000C,Y                                                        ;A9DC82;
    STA.L $7E882C,X                                                      ;A9DC85;
    PHY                                                                  ;A9DC89;
    TAY                                                                  ;A9DC8A;
    LDA.W $0002,Y                                                        ;A9DC8B;
    SEC                                                                  ;A9DC8E;
    SBC.W #$000C                                                         ;A9DC8F;
    STA.L $7E8834,X                                                      ;A9DC92;
    PLY                                                                  ;A9DC96;
    LDA.W $0008,Y                                                        ;A9DC97;
    STA.L $7E882E,X                                                      ;A9DC9A;
    DEC A                                                                ;A9DC9E;
    STA.L $7E8830,X                                                      ;A9DC9F;
    DEC A                                                                ;A9DCA3;
    STA.L $7E8832,X                                                      ;A9DCA4;
    LDX.W $0000,Y                                                        ;A9DCA8;
    LDA.W $0008,Y                                                        ;A9DCAB;
    JSR.W InitializeCorpseRottingDataTable                               ;A9DCAE;
    LDA.W $000A,Y                                                        ;A9DCB1;
    STA.B $12                                                            ;A9DCB4;
    JMP.W ($0012)                                                        ;A9DCB6;


ProcessCorpseRottingVRAMTransfers:
    LDY.W $0330                                                          ;A9DCB9;
    LDA.W $0000,X                                                        ;A9DCBC;

.loop:
    STA.W $00D0,Y                                                        ;A9DCBF;
    LDA.W $0002,X                                                        ;A9DCC2;
    STA.W $00D3,Y                                                        ;A9DCC5;
    LDA.W $0004,X                                                        ;A9DCC8;
    STA.W $00D2,Y                                                        ;A9DCCB;
    LDA.W $0006,X                                                        ;A9DCCE;
    STA.W $00D5,Y                                                        ;A9DCD1;
    TYA                                                                  ;A9DCD4;
    CLC                                                                  ;A9DCD5;
    ADC.W #$0007                                                         ;A9DCD6;
    TAY                                                                  ;A9DCD9;
    TXA                                                                  ;A9DCDA;
    ADC.W #$0008                                                         ;A9DCDB;
    TAX                                                                  ;A9DCDE;
    LDA.W $0000,X                                                        ;A9DCDF;
    BNE .loop                                                            ;A9DCE2;
    STA.L $7E8004                                                        ;A9DCE4;
    TYA                                                                  ;A9DCE8;
    STA.W $0330                                                          ;A9DCE9;
    RTS                                                                  ;A9DCEC;


PowerBombReaction_CorpseZoomer:
    LDX.W $0E54                                                          ;A9DCED;
    LDA.W $0F86,X                                                        ;A9DCF0;
    AND.W #$0400                                                         ;A9DCF3;
    BNE CorpseCommonContactReaction_return                               ;A9DCF6;

EnemyTouch_EnemyShot_CorpseZoomer:
    LDA.W #Function_CorpseZoomer_Rotting                                 ;A9DCF8;
    BRA CorpseCommonContactReaction                                      ;A9DCFB;


PowerBombReaction_CorpseRipper:
    LDX.W $0E54                                                          ;A9DCFD;
    LDA.W $0F86,X                                                        ;A9DD00;
    AND.W #$0400                                                         ;A9DD03;
    BNE CorpseCommonContactReaction_return                               ;A9DD06;

EnemyTouch_EnemyShot_CorpseRipper:
    LDA.W #Function_CorpseRipper_Rotting                                 ;A9DD08;
    BRA CorpseCommonContactReaction                                      ;A9DD0B;


PowerBombReaction_CorpseSkree:
    LDX.W $0E54                                                          ;A9DD0D;
    LDA.W $0F86,X                                                        ;A9DD10;
    AND.W #$0400                                                         ;A9DD13;
    BNE CorpseCommonContactReaction_return                               ;A9DD16;

EnemyTouch_EnemyShot_CorpseSkree:
    LDA.W #Function_CorpseSkree_Rotting                                  ;A9DD18;
    BRA CorpseCommonContactReaction                                      ;A9DD1B;


EnemyShot_CorpseSidehopper:
    LDX.W $0E54                                                          ;A9DD1D;
    LDA.W $0F86,X                                                        ;A9DD20;
    AND.W #$0400                                                         ;A9DD23;
    BNE CorpseCommonContactReaction_return                               ;A9DD26;
    LDA.L $7E7810,X                                                      ;A9DD28;
    CMP.W #$0008                                                         ;A9DD2C;
    BCC CorpseCommonContactReaction_return                               ;A9DD2F;

CorpseSidehopperContactReaction_Rottable:
    LDA.W #Function_CorpseSidehopper_Rotting                             ;A9DD31;

CorpseCommonContactReaction:
    LDX.W $0E54                                                          ;A9DD34;
    STA.W $0FA8,X                                                        ;A9DD37;
    LDA.W $0F86,X                                                        ;A9DD3A;
    ORA.W #$0C00                                                         ;A9DD3D;
    STA.W $0F86,X                                                        ;A9DD40;

CorpseCommonContactReaction_return:
    RTL                                                                  ;A9DD43;


EnemyTouch_CorpseSidehopper:
    LDX.W $0E54                                                          ;A9DD44;
    LDA.L $7E7810,X                                                      ;A9DD47;
    CMP.W #$0008                                                         ;A9DD4B;
    BCS CorpseSidehopperContactReaction_Rottable                         ;A9DD4E;
    LDX.W $0E54                                                          ;A9DD50;
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A9DD53;
    RTL                                                                  ;A9DD57;


CorpseRottingDefinitions_Torizo:
  .rotTablePointer
    dw $9000                                                             ;A9DD58;
  .VRAMTransferPointer
    dw $0000                                                             ;A9DD5A;
  .rotEntryCopyFunction
    dw CorpseRottingRotEntry_Copy_Torizo                                 ;A9DD5C;
  .rotEntryMoveFunction
    dw CorpseRottingRotEntry_Move_Torizo                                 ;A9DD5E;
  .height
    dw $0060                                                             ;A9DD60;
  .initFunctionPointer
    dw CorpseRottingInit_Torizo                                          ;A9DD62;
  .tileDataRowOffsetsPointer
    dw CorpseRottingTileRowOffsets_Torizo                                ;A9DD64;
  .rotEntryFinishedHook
    dw CorpseRottingRotEntryFinishedHook_CorpseTorizo                    ;A9DD66;

CorpseRottingDefinitions_Sidehopper_Param1_0:
    dw $9000                                                             ;A9DD68;
    dw CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_0          ;A9DD6A;
    dw CorpseRottingRotEntry_Copy_Sidehopper_Param1_0                    ;A9DD6C;
    dw CorpseRottingRotEntry_Move_Sidehopper_Param1_0                    ;A9DD6E;
    dw $0028                                                             ;A9DD70;
    dw CorpseRottingInit_Sidehopper_Param1_0                             ;A9DD72;
    dw CorpseRottingTileRowOffsets_Sidehopper                            ;A9DD74;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DD76;

CorpseRottingDefinitions_Sidehopper_Param1_2:
    dw $90A0                                                             ;A9DD78;
    dw CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_2          ;A9DD7A;
    dw CorpseRottingRotEntry_Copy_Sidehopper_Param1_2                    ;A9DD7C;
    dw CorpseRottingRotEntry_Move_Sidehopper_Param1_2                    ;A9DD7E;
    dw $0028                                                             ;A9DD80;
    dw CorpseRottingInit_Sidehopper_Param1_2                             ;A9DD82;
    dw CorpseRottingTileRowOffsets_Sidehopper                            ;A9DD84;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DD86;

CorpseRottingDefinitions_Zoomer_Param1_0:
    dw $92C0                                                             ;A9DD88;
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_0              ;A9DD8A;
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_0                        ;A9DD8C;
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_0                        ;A9DD8E;
    dw $0010                                                             ;A9DD90;
    dw CorpseRottingInit_Zoomer_Param1_0                                 ;A9DD92;
    dw CorpseRottingTileRowOffsets_Zoomer                                ;A9DD94;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DD96;

CorpseRottingDefinitions_Zoomer_Param1_2:
    dw $9300                                                             ;A9DD98;
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_2              ;A9DD9A;
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_2                        ;A9DD9C;
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_2                        ;A9DD9E;
    dw $0010                                                             ;A9DDA0;
    dw CorpseRottingInit_Zoomer_Param1_2                                 ;A9DDA2;
    dw CorpseRottingTileRowOffsets_Zoomer                                ;A9DDA4;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDA6;

CorpseRottingDefinitions_Zoomer_Param1_4:
    dw $9340                                                             ;A9DDA8;
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_4              ;A9DDAA;
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_4                        ;A9DDAC;
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_4                        ;A9DDAE;
    dw $0010                                                             ;A9DDB0;
    dw CorpseRottingInit_Zoomer_Param1_4                                 ;A9DDB2;
    dw CorpseRottingTileRowOffsets_Zoomer                                ;A9DDB4;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDB6;

CorpseRottingDefinitions_Ripper_Param1_0:
    dw $9380                                                             ;A9DDB8;
    dw CorpseRottingVRAMTransferDefinitions_Ripper_Param1_0              ;A9DDBA;
    dw CorpseRottingRotEntry_Copy_Ripper_Param1_0                        ;A9DDBC;
    dw CorpseRottingRotEntry_Move_Ripper_Param1_0                        ;A9DDBE;
    dw $0010                                                             ;A9DDC0;
    dw CorpseRottingInit_Ripper_Param1_0                                 ;A9DDC2;
    dw CorpseRottingTileRowOffsets_Ripper                                ;A9DDC4;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDC6;

CorpseRottingDefinitions_Ripper_Param1_2:
    dw $93C0                                                             ;A9DDC8;
    dw CorpseRottingVRAMTransferDefinitions_Ripper_Param1_2              ;A9DDCA;
    dw CorpseRottingRotEntry_Copy_Ripper_Param1_2                        ;A9DDCC;
    dw CorpseRottingRotEntry_Move_Ripper_Param1_2                        ;A9DDCE;
    dw $0010                                                             ;A9DDD0;
    dw CorpseRottingInit_Ripper_Param1_2                                 ;A9DDD2;
    dw CorpseRottingTileRowOffsets_Ripper                                ;A9DDD4;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDD6;

CorpseRottingDefinitions_Skree_Param1_0:
    dw $9140                                                             ;A9DDD8;
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_0               ;A9DDDA;
    dw CorpseRottingRotEntry_Copy_Skree_Param1_0                         ;A9DDDC;
    dw CorpseRottingRotEntry_Move_Skree_Param1_0                         ;A9DDDE;
    dw $0020                                                             ;A9DDE0;
    dw CorpseRottingInit_Skree_Param1_0                                  ;A9DDE2;
    dw CorpseRottingTileRowOffsets_Skree                                 ;A9DDE4;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDE6;

CorpseRottingDefinitions_Skree_Param1_2:
    dw $91C0                                                             ;A9DDE8;
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_2               ;A9DDEA;
    dw CorpseRottingRotEntry_Copy_Skree_Param1_2                         ;A9DDEC;
    dw CorpseRottingRotEntry_Move_Skree_Param1_2                         ;A9DDEE;
    dw $0020                                                             ;A9DDF0;
    dw CorpseRottingInit_Skree_Param1_2                                  ;A9DDF2;
    dw CorpseRottingTileRowOffsets_Skree                                 ;A9DDF4;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DDF6;

CorpseRottingDefinitions_Skree_Param1_4:
    dw $9240                                                             ;A9DDF8;
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_4               ;A9DDFA;
    dw CorpseRottingRotEntry_Copy_Skree_Param1_4                         ;A9DDFC;
    dw CorpseRottingRotEntry_Move_Skree_Param1_4                         ;A9DDFE;
    dw $0020                                                             ;A9DE00;
    dw CorpseRottingInit_Skree_Param1_4                                  ;A9DE02;
    dw CorpseRottingTileRowOffsets_Skree                                 ;A9DE04;
    dw CorpseRotEntryFinishedHook_Normal                                 ;A9DE06;

CorpseRottingDefinitions_MotherBrain:
    dw $9700                                                             ;A9DE08;
    dw CorpseRottingVRAMTransferDefinitions_MotherBrain                  ;A9DE0A;
    dw CorpseRottingRotEntry_Copy_MotherBrain                            ;A9DE0C;
    dw CorpseRottingRotEntry_Move_MotherBrain                            ;A9DE0E;
    dw $0030                                                             ;A9DE10;
    dw CorpseRottingInit_MotherBrain                                     ;A9DE12;
    dw CorpseRottingTileRowOffsets_MotherBrain                           ;A9DE14;
    dw CorpseRottingRotEntryFinishedHook_MotherBrain                     ;A9DE16;

CorpseRottingInit_Torizo:
    PHB                                                                  ;A9DE18;
    LDX.W #Tiles_CorpseTorizo+$120                                       ;A9DE19;
    LDY.W #$2060                                                         ;A9DE1C;
    LDA.W #$00BF                                                         ;A9DE1F;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE22;
    PLB                                                                  ;A9DE25;
    PHB                                                                  ;A9DE26;
    LDX.W #Tiles_CorpseTorizo+$320                                       ;A9DE27;
    LDY.W #$21A0                                                         ;A9DE2A;
    LDA.W #$00BF                                                         ;A9DE2D;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE30;
    PLB                                                                  ;A9DE33;
    PHB                                                                  ;A9DE34;
    LDX.W #Tiles_CorpseTorizo+$500                                       ;A9DE35;
    LDY.W #$22C0                                                         ;A9DE38;
    LDA.W #$00FF                                                         ;A9DE3B;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE3E;
    PLB                                                                  ;A9DE41;
    PHB                                                                  ;A9DE42;
    LDX.W #Tiles_CorpseTorizo+$700                                       ;A9DE43;
    LDY.W #$2400                                                         ;A9DE46;
    LDA.W #$00FF                                                         ;A9DE49;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE4C;
    PLB                                                                  ;A9DE4F;
    PHB                                                                  ;A9DE50;
    LDX.W #Tiles_CorpseTorizo+$900                                       ;A9DE51;
    LDY.W #$2540                                                         ;A9DE54;
    LDA.W #$00FF                                                         ;A9DE57;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE5A;
    PLB                                                                  ;A9DE5D;
    PHB                                                                  ;A9DE5E;
    LDX.W #Tiles_CorpseTorizo+$B00                                       ;A9DE5F;
    LDY.W #$2680                                                         ;A9DE62;
    LDA.W #$00FF                                                         ;A9DE65;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE68;
    PLB                                                                  ;A9DE6B;
    PHB                                                                  ;A9DE6C;
    LDX.W #Tiles_CorpseTorizo+$D00                                       ;A9DE6D;
    LDY.W #$27C0                                                         ;A9DE70;
    LDA.W #$00FF                                                         ;A9DE73;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE76;
    PLB                                                                  ;A9DE79;
    PHB                                                                  ;A9DE7A;
    LDX.W #Tiles_CorpseTorizo+$F00                                       ;A9DE7B;
    LDY.W #$2900                                                         ;A9DE7E;
    LDA.W #$00FF                                                         ;A9DE81;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE84;
    PLB                                                                  ;A9DE87;
    PHB                                                                  ;A9DE88;
    LDX.W #Tiles_CorpseTorizo+$1100                                      ;A9DE89;
    LDY.W #$2A40                                                         ;A9DE8C;
    LDA.W #$00FF                                                         ;A9DE8F;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DE92;
    PLB                                                                  ;A9DE95;
    PHB                                                                  ;A9DE96;
    LDX.W #Tiles_CorpseTorizo+$12E0                                      ;A9DE97;
    LDY.W #$2B60                                                         ;A9DE9A;
    LDA.W #$011F                                                         ;A9DE9D;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DEA0;
    PLB                                                                  ;A9DEA3;
    PHB                                                                  ;A9DEA4;
    LDX.W #Tiles_CorpseTorizo+$14C0                                      ;A9DEA5;
    LDY.W #$2C80                                                         ;A9DEA8;
    LDA.W #$013F                                                         ;A9DEAB;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DEAE;
    PLB                                                                  ;A9DEB1;
    PHB                                                                  ;A9DEB2;
    LDX.W #Tiles_CorpseTorizo+$16C0                                      ;A9DEB3;
    LDY.W #$2DC0                                                         ;A9DEB6;
    LDA.W #$013F                                                         ;A9DEB9;
    MVN $7E,Tiles_CorpseTorizo>>16                                       ;A9DEBC;
    PLB                                                                  ;A9DEBF;
    RTS                                                                  ;A9DEC0;


CorpseRottingInit_Sidehopper_Param1_0:
    PHB                                                                  ;A9DEC1;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$40               ;A9DEC2;
    LDY.W #$2040                                                         ;A9DEC5;
    LDA.W #$005F                                                         ;A9DEC8;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DECB;
    PLB                                                                  ;A9DECE;
    PHB                                                                  ;A9DECF;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$200              ;A9DED0;
    LDY.W #$20A0                                                         ;A9DED3;
    LDA.W #$009F                                                         ;A9DED6;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DED9;
    PLB                                                                  ;A9DEDC;
    PHB                                                                  ;A9DEDD;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$400              ;A9DEDE;
    LDY.W #$2140                                                         ;A9DEE1;
    LDA.W #$009F                                                         ;A9DEE4;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DEE7;
    PLB                                                                  ;A9DEEA;
    PHB                                                                  ;A9DEEB;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$600              ;A9DEEC;
    LDY.W #$21E0                                                         ;A9DEEF;
    LDA.W #$009F                                                         ;A9DEF2;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DEF5;
    PLB                                                                  ;A9DEF8;
    PHB                                                                  ;A9DEF9;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$800              ;A9DEFA;
    LDY.W #$2280                                                         ;A9DEFD;
    LDA.W #$009F                                                         ;A9DF00;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF03;
    PLB                                                                  ;A9DF06;
    RTS                                                                  ;A9DF07;


CorpseRottingInit_Sidehopper_Param1_2:
    PHB                                                                  ;A9DF08;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$120              ;A9DF09;
    LDY.W #$2320                                                         ;A9DF0C;
    LDA.W #$003F                                                         ;A9DF0F;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF12;
    PLB                                                                  ;A9DF15;
    PHB                                                                  ;A9DF16;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$320              ;A9DF17;
    LDY.W #$23C0                                                         ;A9DF1A;
    LDA.W #$009F                                                         ;A9DF1D;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF20;
    PLB                                                                  ;A9DF23;
    PHB                                                                  ;A9DF24;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$520              ;A9DF25;
    LDY.W #$2460                                                         ;A9DF28;
    LDA.W #$009F                                                         ;A9DF2B;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF2E;
    PLB                                                                  ;A9DF31;
    PHB                                                                  ;A9DF32;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$720              ;A9DF33;
    LDY.W #$2500                                                         ;A9DF36;
    LDA.W #$009F                                                         ;A9DF39;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF3C;
    PLB                                                                  ;A9DF3F;
    PHB                                                                  ;A9DF40;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$920              ;A9DF41;
    LDY.W #$25A0                                                         ;A9DF44;
    LDA.W #$009F                                                         ;A9DF47;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF4A;
    PLB                                                                  ;A9DF4D;
    RTS                                                                  ;A9DF4E;


CorpseRottingInit_Zoomer_Param1_0:
    PHB                                                                  ;A9DF4F;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$A60              ;A9DF50;
    LDY.W #$2940                                                         ;A9DF53;
    LDA.W #$005F                                                         ;A9DF56;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF59;
    PLB                                                                  ;A9DF5C;
    PHB                                                                  ;A9DF5D;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$C60              ;A9DF5E;
    LDY.W #$29A0                                                         ;A9DF61;
    LDA.W #$005F                                                         ;A9DF64;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF67;
    PLB                                                                  ;A9DF6A;
    RTS                                                                  ;A9DF6B;


CorpseRottingInit_Zoomer_Param1_2:
    PHB                                                                  ;A9DF6C;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$AC0              ;A9DF6D;
    LDY.W #$2A00                                                         ;A9DF70;
    LDA.W #$005F                                                         ;A9DF73;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF76;
    PLB                                                                  ;A9DF79;
    PHB                                                                  ;A9DF7A;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$CC0              ;A9DF7B;
    LDY.W #$2A60                                                         ;A9DF7E;
    LDA.W #$005F                                                         ;A9DF81;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF84;
    PLB                                                                  ;A9DF87;
    RTS                                                                  ;A9DF88;


CorpseRottingInit_Zoomer_Param1_4:
    PHB                                                                  ;A9DF89;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$B20              ;A9DF8A;
    LDY.W #$2AC0                                                         ;A9DF8D;
    LDA.W #$005F                                                         ;A9DF90;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DF93;
    PLB                                                                  ;A9DF96;
    PHB                                                                  ;A9DF97;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$D20              ;A9DF98;
    LDY.W #$2B20                                                         ;A9DF9B;
    LDA.W #$005F                                                         ;A9DF9E;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFA1;
    PLB                                                                  ;A9DFA4;
    RTS                                                                  ;A9DFA5;


CorpseRottingInit_Ripper_Param1_0:
    PHB                                                                  ;A9DFA6;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$A00              ;A9DFA7;
    LDY.W #$2B80                                                         ;A9DFAA;
    LDA.W #$005F                                                         ;A9DFAD;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFB0;
    PLB                                                                  ;A9DFB3;
    PHB                                                                  ;A9DFB4;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$C00              ;A9DFB5;
    LDY.W #$2BE0                                                         ;A9DFB8;
    LDA.W #$005F                                                         ;A9DFBB;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFBE;
    PLB                                                                  ;A9DFC1;
    RTS                                                                  ;A9DFC2;


CorpseRottingInit_Ripper_Param1_2:
    PHB                                                                  ;A9DFC3;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$B80              ;A9DFC4;
    LDY.W #$2C40                                                         ;A9DFC7;
    LDA.W #$005F                                                         ;A9DFCA;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFCD;
    PLB                                                                  ;A9DFD0;
    PHB                                                                  ;A9DFD1;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$D80              ;A9DFD2;
    LDY.W #$2CA0                                                         ;A9DFD5;
    LDA.W #$005F                                                         ;A9DFD8;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFDB;
    PLB                                                                  ;A9DFDE;
    RTS                                                                  ;A9DFDF;


CorpseRottingInit_Skree_Param1_0:
    PHB                                                                  ;A9DFE0;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$2A0              ;A9DFE1;
    LDY.W #$2640                                                         ;A9DFE4;
    LDA.W #$003F                                                         ;A9DFE7;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFEA;
    PLB                                                                  ;A9DFED;
    PHB                                                                  ;A9DFEE;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$4A0              ;A9DFEF;
    LDY.W #$2680                                                         ;A9DFF2;
    LDA.W #$003F                                                         ;A9DFF5;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9DFF8;
    PLB                                                                  ;A9DFFB;
    PHB                                                                  ;A9DFFC;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$6A0              ;A9DFFD;
    LDY.W #$26C0                                                         ;A9E000;
    LDA.W #$003F                                                         ;A9E003;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E006;
    PLB                                                                  ;A9E009;
    PHB                                                                  ;A9E00A;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$8A0              ;A9E00B;
    LDY.W #$2700                                                         ;A9E00E;
    LDA.W #$003F                                                         ;A9E011;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E014;
    PLB                                                                  ;A9E017;
    RTS                                                                  ;A9E018;


CorpseRottingInit_Skree_Param1_2:
    PHB                                                                  ;A9E019;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$E0               ;A9E01A;
    LDY.W #$2740                                                         ;A9E01D;
    LDA.W #$003F                                                         ;A9E020;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E023;
    PLB                                                                  ;A9E026;
    PHB                                                                  ;A9E027;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$2E0              ;A9E028;
    LDY.W #$2780                                                         ;A9E02B;
    LDA.W #$003F                                                         ;A9E02E;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E031;
    PLB                                                                  ;A9E034;
    PHB                                                                  ;A9E035;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$4E0              ;A9E036;
    LDY.W #$27C0                                                         ;A9E039;
    LDA.W #$003F                                                         ;A9E03C;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E03F;
    PLB                                                                  ;A9E042;
    PHB                                                                  ;A9E043;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$6E0              ;A9E044;
    LDY.W #$2800                                                         ;A9E047;
    LDA.W #$003F                                                         ;A9E04A;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E04D;
    PLB                                                                  ;A9E050;
    RTS                                                                  ;A9E051;


CorpseRottingInit_Skree_Param1_4:
    PHB                                                                  ;A9E052;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$1C0              ;A9E053;
    LDY.W #$2840                                                         ;A9E056;
    LDA.W #$003F                                                         ;A9E059;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E05C;
    PLB                                                                  ;A9E05F;
    PHB                                                                  ;A9E060;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$3C0              ;A9E061;
    LDY.W #$2880                                                         ;A9E064;
    LDA.W #$003F                                                         ;A9E067;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E06A;
    PLB                                                                  ;A9E06D;
    PHB                                                                  ;A9E06E;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$5C0              ;A9E06F;
    LDY.W #$28C0                                                         ;A9E072;
    LDA.W #$003F                                                         ;A9E075;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E078;
    PLB                                                                  ;A9E07B;
    PHB                                                                  ;A9E07C;
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$7C0              ;A9E07D;
    LDY.W #$2900                                                         ;A9E080;
    LDA.W #$003F                                                         ;A9E083;
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16              ;A9E086;
    PLB                                                                  ;A9E089;
    RTS                                                                  ;A9E08A;


CorpseRottingInit_MotherBrain:
    PHB                                                                  ;A9E08B;
    LDX.W #Tiles_CorpseMotherBrain+$C0                                   ;A9E08C;
    LDY.W #$9000                                                         ;A9E08F;
    LDA.W #$00BF                                                         ;A9E092;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E095;
    PLB                                                                  ;A9E098;
    PHB                                                                  ;A9E099;
    LDX.W #Tiles_CorpseMotherBrain+$2C0                                  ;A9E09A;
    LDY.W #$90E0                                                         ;A9E09D;
    LDA.W #$00BF                                                         ;A9E0A0;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0A3;
    PLB                                                                  ;A9E0A6;
    PHB                                                                  ;A9E0A7;
    LDX.W #Tiles_CorpseMotherBrain+$4C0                                  ;A9E0A8;
    LDY.W #$91C0                                                         ;A9E0AB;
    LDA.W #$00BF                                                         ;A9E0AE;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0B1;
    PLB                                                                  ;A9E0B4;
    PHB                                                                  ;A9E0B5;
    LDX.W #Tiles_CorpseMotherBrain+$6C0                                  ;A9E0B6;
    LDY.W #$92A0                                                         ;A9E0B9;
    LDA.W #$00BF                                                         ;A9E0BC;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0BF;
    PLB                                                                  ;A9E0C2;
    PHB                                                                  ;A9E0C3;
    LDX.W #Tiles_CorpseMotherBrain+$8C0                                  ;A9E0C4;
    LDY.W #$9380                                                         ;A9E0C7;
    LDA.W #$00DF                                                         ;A9E0CA;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0CD;
    PLB                                                                  ;A9E0D0;
    PHB                                                                  ;A9E0D1;
    LDX.W #Tiles_CorpseMotherBrain+$AC0                                  ;A9E0D2;
    LDY.W #$9460                                                         ;A9E0D5;
    LDA.W #$00DF                                                         ;A9E0D8;
    MVN $7E,Tiles_CorpseMotherBrain>>16                                  ;A9E0DB;
    PLB                                                                  ;A9E0DE;
    RTS                                                                  ;A9E0DF;


CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_0:
    dw $0060,$7E00,$2040,$7020,$00A0,$7E00,$20A0,$7100                   ;A9E0E0;
    dw $00A0,$7E00,$2140,$7200,$00A0,$7E00,$21E0,$7300                   ;A9E0F0;
    dw $00A0,$7E00,$2280,$7400,$0000                                     ;A9E100;

CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_2:
    dw $0040,$7E00,$2320,$7090,$00A0,$7E00,$23C0,$7190                   ;A9E10A;
    dw $00A0,$7E00,$2460,$7290,$00A0,$7E00,$2500,$7390                   ;A9E11A;
    dw $00A0,$7E00,$25A0,$7490,$0000                                     ;A9E12A;

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_0:
    dw $0060,$7E00,$2940,$7530,$0060,$7E00,$29A0,$7630                   ;A9E134;
    dw $0000                                                             ;A9E144;

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_2:
    dw $0060,$7E00,$2A00,$7560,$0060,$7E00,$2A60,$7660                   ;A9E146;
    dw $0000                                                             ;A9E156;

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_4:
    dw $0060,$7E00,$2AC0,$7590,$0060,$7E00,$2B20,$7690                   ;A9E158;
    dw $0000                                                             ;A9E168;

CorpseRottingVRAMTransferDefinitions_Ripper_Param1_0:
    dw $0060,$7E00,$2B80,$7500,$0060,$7E00,$2BE0,$7600                   ;A9E16A;
    dw $0000                                                             ;A9E17A;

CorpseRottingVRAMTransferDefinitions_Ripper_Param1_2:
    dw $0060,$7E00,$2C40,$75C0,$0060,$7E00,$2CA0,$76C0                   ;A9E17C;
    dw $0000                                                             ;A9E18C;

CorpseRottingVRAMTransferDefinitions_Skree_Param1_0:
    dw $0040,$7E00,$2640,$7150,$0040,$7E00,$2680,$7250                   ;A9E18E;
    dw $0040,$7E00,$26C0,$7350,$0040,$7E00,$2700,$7450                   ;A9E19E;
    dw $0000                                                             ;A9E1AE;

CorpseRottingVRAMTransferDefinitions_Skree_Param1_2:
    dw $0040,$7E00,$2740,$7070,$0040,$7E00,$2780,$7170                   ;A9E1B0;
    dw $0040,$7E00,$27C0,$7270,$0040,$7E00,$2800,$7370                   ;A9E1C0;
    dw $0000                                                             ;A9E1D0;

CorpseRottingVRAMTransferDefinitions_Skree_Param1_4:
    dw $0040,$7E00,$2840,$70E0,$0040,$7E00,$2880,$71E0                   ;A9E1D2;
    dw $0040,$7E00,$28C0,$72E0,$0040,$7E00,$2900,$73E0                   ;A9E1E2;
    dw $0000                                                             ;A9E1F2;

CorpseRottingVRAMTransferDefinitions_MotherBrain:
    dw $0060,$7E00,$9040,$7A80,$00A0,$7E00,$9100,$7B70                   ;A9E1F4;
    dw $00C0,$7E00,$91C0,$7C60,$00C0,$7E00,$92A0,$7D60                   ;A9E204;
    dw $00E0,$7E00,$9380,$7E60,$00E0,$7E00,$9460,$7F60                   ;A9E214;
    dw $0000                                                             ;A9E224;

CorpseRottingTileRowOffsets_Torizo:
    dw $0000,$0140,$0280,$03C0,$0500,$0640,$0780,$08C0                   ;A9E226;
    dw $0A00,$0B40,$0C80,$0DC0,$0F00                                     ;A9E236;

CorpseRottingTileRowOffsets_Sidehopper:
    dw $0000,$00A0,$0140,$01E0,$0280,$0320                               ;A9E240;

CorpseRottingTileRowOffsets_Zoomer:
    dw $0000,$0060,$00C0                                                 ;A9E24C;

CorpseRottingTileRowOffsets_Ripper:
    dw $0000,$0060,$00C0                                                 ;A9E252;

CorpseRottingTileRowOffsets_Skree:
    dw $0000,$0040,$0080,$00C0,$0100                                     ;A9E258;

CorpseRottingTileRowOffsets_MotherBrain:
    dw $0000,$00E0,$01C0,$02A0,$0380,$0460,$0540,$0620                   ;A9E262;

CorpseRottingRotEntry_Move_Torizo:
    LDA.W $8802                                                          ;A9E272;
    CMP.W #$0050                                                         ;A9E275;
    BCC .column1                                                         ;A9E278;
    CMP.W #$005E                                                         ;A9E27A;
    BPL .offsetGreaterThan5D                                             ;A9E27D;
    LDA.W $2000,X                                                        ;A9E27F;
    STA.W $2002,Y                                                        ;A9E282;
    LDA.W $2010,X                                                        ;A9E285;
    STA.W $2012,Y                                                        ;A9E288;

.offsetGreaterThan5D:
    STZ.W $2000,X                                                        ;A9E28B;
    STZ.W $2010,X                                                        ;A9E28E;

.column1:
    LDA.W $8802                                                          ;A9E291;
    CMP.W #$0048                                                         ;A9E294;
    BCC .column2                                                         ;A9E297;
    CMP.W #$005E                                                         ;A9E299;
    BPL ..offsetGreaterThan5E                                            ;A9E29C;
    LDA.W $2020,X                                                        ;A9E29E;
    STA.W $2022,Y                                                        ;A9E2A1;
    LDA.W $2030,X                                                        ;A9E2A4;
    STA.W $2032,Y                                                        ;A9E2A7;

..offsetGreaterThan5E:
    STZ.W $2020,X                                                        ;A9E2AA;
    STZ.W $2030,X                                                        ;A9E2AD;

.column2:
    LDA.W $8802                                                          ;A9E2B0;
    CMP.W #$0010                                                         ;A9E2B3;
    BCC .column3                                                         ;A9E2B6;
    CMP.W #$005E                                                         ;A9E2B8;
    BPL ..offsetGreaterThan5E                                            ;A9E2BB;
    LDA.W $2040,X                                                        ;A9E2BD;
    STA.W $2042,Y                                                        ;A9E2C0;
    LDA.W $2050,X                                                        ;A9E2C3;
    STA.W $2052,Y                                                        ;A9E2C6;

..offsetGreaterThan5E:
    STZ.W $2040,X                                                        ;A9E2C9;
    STZ.W $2050,X                                                        ;A9E2CC;

.column3:
    LDA.W $8802                                                          ;A9E2CF;
    CMP.W #$005E                                                         ;A9E2D2;
    BPL ..offsetGreaterThan5E                                            ;A9E2D5;
    LDA.W $2060,X                                                        ;A9E2D7;
    STA.W $2062,Y                                                        ;A9E2DA;
    LDA.W $2070,X                                                        ;A9E2DD;
    STA.W $2072,Y                                                        ;A9E2E0;

..offsetGreaterThan5E:
    STZ.W $2060,X                                                        ;A9E2E3;
    STZ.W $2070,X                                                        ;A9E2E6;
    LDA.W $8802                                                          ;A9E2E9;
    CMP.W #$005E                                                         ;A9E2EC;
    BPL +                                                                ;A9E2EF;
    LDA.W $2080,X                                                        ;A9E2F1;
    STA.W $2082,Y                                                        ;A9E2F4;
    LDA.W $2090,X                                                        ;A9E2F7;
    STA.W $2092,Y                                                        ;A9E2FA;

  + STZ.W $2080,X                                                        ;A9E2FD;
    STZ.W $2090,X                                                        ;A9E300;
    LDA.W $8802                                                          ;A9E303;
    CMP.W #$005E                                                         ;A9E306;
    BPL +                                                                ;A9E309;
    LDA.W $20A0,X                                                        ;A9E30B;
    STA.W $20A2,Y                                                        ;A9E30E;
    LDA.W $20B0,X                                                        ;A9E311;
    STA.W $20B2,Y                                                        ;A9E314;

  + STZ.W $20A0,X                                                        ;A9E317;
    STZ.W $20B0,X                                                        ;A9E31A;
    LDA.W $8802                                                          ;A9E31D;
    CMP.W #$005E                                                         ;A9E320;
    BPL +                                                                ;A9E323;
    LDA.W $20C0,X                                                        ;A9E325;
    STA.W $20C2,Y                                                        ;A9E328;
    LDA.W $20D0,X                                                        ;A9E32B;
    STA.W $20D2,Y                                                        ;A9E32E;

  + STZ.W $20C0,X                                                        ;A9E331;
    STZ.W $20D0,X                                                        ;A9E334;
    LDA.W $8802                                                          ;A9E337;
    CMP.W #$005E                                                         ;A9E33A;
    BPL +                                                                ;A9E33D;
    LDA.W $20E0,X                                                        ;A9E33F;
    STA.W $20E2,Y                                                        ;A9E342;
    LDA.W $20F0,X                                                        ;A9E345;
    STA.W $20F2,Y                                                        ;A9E348;

  + STZ.W $20E0,X                                                        ;A9E34B;
    STZ.W $20F0,X                                                        ;A9E34E;
    LDA.W $8802                                                          ;A9E351;
    CMP.W #$005E                                                         ;A9E354;
    BPL +                                                                ;A9E357;
    LDA.W $2100,X                                                        ;A9E359;
    STA.W $2102,Y                                                        ;A9E35C;
    LDA.W $2110,X                                                        ;A9E35F;
    STA.W $2112,Y                                                        ;A9E362;

  + STZ.W $2100,X                                                        ;A9E365;
    STZ.W $2110,X                                                        ;A9E368;
    LDA.W $8802                                                          ;A9E36B;
    CMP.W #$0010                                                         ;A9E36E;
    BCC .return                                                          ;A9E371;
    CMP.W #$005E                                                         ;A9E373;
    BPL +                                                                ;A9E376;
    LDA.W $2120,X                                                        ;A9E378;
    STA.W $2122,Y                                                        ;A9E37B;
    LDA.W $2130,X                                                        ;A9E37E;
    STA.W $2132,Y                                                        ;A9E381;

  + STZ.W $2120,X                                                        ;A9E384;
    STZ.W $2130,X                                                        ;A9E387;

.return:
    RTS                                                                  ;A9E38A;


CorpseRottingRotEntry_Copy_Torizo:
    LDA.W $8802                                                          ;A9E38B;
    CMP.W #$0050                                                         ;A9E38E;
    BCC +                                                                ;A9E391;
    CMP.W #$005E                                                         ;A9E393;
    BPL +                                                                ;A9E396;
    LDA.W $2000,X                                                        ;A9E398;
    STA.W $2002,Y                                                        ;A9E39B;
    LDA.W $2010,X                                                        ;A9E39E;
    STA.W $2012,Y                                                        ;A9E3A1;

  + LDA.W $8802                                                          ;A9E3A4;
    CMP.W #$0048                                                         ;A9E3A7;
    BCC +                                                                ;A9E3AA;
    CMP.W #$005E                                                         ;A9E3AC;
    BPL +                                                                ;A9E3AF;
    LDA.W $2020,X                                                        ;A9E3B1;
    STA.W $2022,Y                                                        ;A9E3B4;
    LDA.W $2030,X                                                        ;A9E3B7;
    STA.W $2032,Y                                                        ;A9E3BA;

  + LDA.W $8802                                                          ;A9E3BD;
    CMP.W #$0010                                                         ;A9E3C0;
    BCC +                                                                ;A9E3C3;
    CMP.W #$005E                                                         ;A9E3C5;
    BPL +                                                                ;A9E3C8;
    LDA.W $2040,X                                                        ;A9E3CA;
    STA.W $2042,Y                                                        ;A9E3CD;
    LDA.W $2050,X                                                        ;A9E3D0;
    STA.W $2052,Y                                                        ;A9E3D3;

  + LDA.W $8802                                                          ;A9E3D6;
    CMP.W #$005E                                                         ;A9E3D9;
    BPL +                                                                ;A9E3DC;
    LDA.W $2060,X                                                        ;A9E3DE;
    STA.W $2062,Y                                                        ;A9E3E1;
    LDA.W $2070,X                                                        ;A9E3E4;
    STA.W $2072,Y                                                        ;A9E3E7;

  + LDA.W $8802                                                          ;A9E3EA;
    CMP.W #$005E                                                         ;A9E3ED;
    BPL +                                                                ;A9E3F0;
    LDA.W $2080,X                                                        ;A9E3F2;
    STA.W $2082,Y                                                        ;A9E3F5;
    LDA.W $2090,X                                                        ;A9E3F8;
    STA.W $2092,Y                                                        ;A9E3FB;

  + LDA.W $8802                                                          ;A9E3FE;
    CMP.W #$005E                                                         ;A9E401;
    BPL +                                                                ;A9E404;
    LDA.W $20A0,X                                                        ;A9E406;
    STA.W $20A2,Y                                                        ;A9E409;
    LDA.W $20B0,X                                                        ;A9E40C;
    STA.W $20B2,Y                                                        ;A9E40F;

  + LDA.W $8802                                                          ;A9E412;
    CMP.W #$005E                                                         ;A9E415;
    BPL +                                                                ;A9E418;
    LDA.W $20C0,X                                                        ;A9E41A;
    STA.W $20C2,Y                                                        ;A9E41D;
    LDA.W $20D0,X                                                        ;A9E420;
    STA.W $20D2,Y                                                        ;A9E423;

  + LDA.W $8802                                                          ;A9E426;
    CMP.W #$005E                                                         ;A9E429;
    BPL +                                                                ;A9E42C;
    LDA.W $20E0,X                                                        ;A9E42E;
    STA.W $20E2,Y                                                        ;A9E431;
    LDA.W $20F0,X                                                        ;A9E434;
    STA.W $20F2,Y                                                        ;A9E437;

  + LDA.W $8802                                                          ;A9E43A;
    CMP.W #$005E                                                         ;A9E43D;
    BPL +                                                                ;A9E440;
    LDA.W $2100,X                                                        ;A9E442;
    STA.W $2102,Y                                                        ;A9E445;
    LDA.W $2110,X                                                        ;A9E448;
    STA.W $2112,Y                                                        ;A9E44B;

  + LDA.W $8802                                                          ;A9E44E;
    CMP.W #$0010                                                         ;A9E451;
    BCC .return                                                          ;A9E454;
    CMP.W #$005E                                                         ;A9E456;
    BPL .return                                                          ;A9E459;
    LDA.W $2120,X                                                        ;A9E45B;
    STA.W $2122,Y                                                        ;A9E45E;
    LDA.W $2130,X                                                        ;A9E461;
    STA.W $2132,Y                                                        ;A9E464;

.return:
    RTS                                                                  ;A9E467;


CorpseRottingRotEntry_Move_Sidehopper_Param1_0:
    LDA.W $8802                                                          ;A9E468;
    CMP.W #$0008                                                         ;A9E46B;
    BCC .column1                                                         ;A9E46E;
    CMP.W #$0026                                                         ;A9E470;
    BPL .offsetGreaterThan25                                             ;A9E473;
    LDA.W $2000,X                                                        ;A9E475;
    STA.W $2002,Y                                                        ;A9E478;
    LDA.W $2010,X                                                        ;A9E47B;
    STA.W $2012,Y                                                        ;A9E47E;

.offsetGreaterThan25:
    STZ.W $2000,X                                                        ;A9E481;
    STZ.W $2010,X                                                        ;A9E484;

.column1:
    LDA.W $8802                                                          ;A9E487;
    CMP.W #$0008                                                         ;A9E48A;
    BCC .column2                                                         ;A9E48D;
    CMP.W #$0026                                                         ;A9E48F;
    BPL ..offsetGreaterThan25                                            ;A9E492;
    LDA.W $2020,X                                                        ;A9E494;
    STA.W $2022,Y                                                        ;A9E497;
    LDA.W $2030,X                                                        ;A9E49A;
    STA.W $2032,Y                                                        ;A9E49D;

..offsetGreaterThan25:
    STZ.W $2020,X                                                        ;A9E4A0;
    STZ.W $2030,X                                                        ;A9E4A3;

.column2:
    LDA.W $8802                                                          ;A9E4A6;
    CMP.W #$0026                                                         ;A9E4A9;
    BPL +                                                                ;A9E4AC;
    LDA.W $2040,X                                                        ;A9E4AE;
    STA.W $2042,Y                                                        ;A9E4B1;
    LDA.W $2050,X                                                        ;A9E4B4;
    STA.W $2052,Y                                                        ;A9E4B7;

  + STZ.W $2040,X                                                        ;A9E4BA;
    STZ.W $2050,X                                                        ;A9E4BD;
    LDA.W $8802                                                          ;A9E4C0;
    CMP.W #$0026                                                         ;A9E4C3;
    BPL +                                                                ;A9E4C6;
    LDA.W $2060,X                                                        ;A9E4C8;
    STA.W $2062,Y                                                        ;A9E4CB;
    LDA.W $2070,X                                                        ;A9E4CE;
    STA.W $2072,Y                                                        ;A9E4D1;

  + STZ.W $2060,X                                                        ;A9E4D4;
    STZ.W $2070,X                                                        ;A9E4D7;
    LDA.W $8802                                                          ;A9E4DA;
    CMP.W #$0026                                                         ;A9E4DD;
    BPL +                                                                ;A9E4E0;
    LDA.W $2080,X                                                        ;A9E4E2;
    STA.W $2082,Y                                                        ;A9E4E5;
    LDA.W $2090,X                                                        ;A9E4E8;
    STA.W $2092,Y                                                        ;A9E4EB;

  + STZ.W $2080,X                                                        ;A9E4EE;
    STZ.W $2090,X                                                        ;A9E4F1;
    RTS                                                                  ;A9E4F4;


CorpseRottingRotEntry_Copy_Sidehopper_Param1_0:
    LDA.W $8802                                                          ;A9E4F5;
    CMP.W #$0008                                                         ;A9E4F8;
    BCC +                                                                ;A9E4FB;
    CMP.W #$0026                                                         ;A9E4FD;
    BPL +                                                                ;A9E500;
    LDA.W $2000,X                                                        ;A9E502;
    STA.W $2002,Y                                                        ;A9E505;
    LDA.W $2010,X                                                        ;A9E508;
    STA.W $2012,Y                                                        ;A9E50B;

  + LDA.W $8802                                                          ;A9E50E;
    CMP.W #$0008                                                         ;A9E511;
    BCC +                                                                ;A9E514;
    CMP.W #$0026                                                         ;A9E516;
    BPL +                                                                ;A9E519;
    LDA.W $2020,X                                                        ;A9E51B;
    STA.W $2022,Y                                                        ;A9E51E;
    LDA.W $2030,X                                                        ;A9E521;
    STA.W $2032,Y                                                        ;A9E524;

  + LDA.W $8802                                                          ;A9E527;
    CMP.W #$0026                                                         ;A9E52A;
    BPL +                                                                ;A9E52D;
    LDA.W $2040,X                                                        ;A9E52F;
    STA.W $2042,Y                                                        ;A9E532;
    LDA.W $2050,X                                                        ;A9E535;
    STA.W $2052,Y                                                        ;A9E538;

  + LDA.W $8802                                                          ;A9E53B;
    CMP.W #$0026                                                         ;A9E53E;
    BPL +                                                                ;A9E541;
    LDA.W $2060,X                                                        ;A9E543;
    STA.W $2062,Y                                                        ;A9E546;
    LDA.W $2070,X                                                        ;A9E549;
    STA.W $2072,Y                                                        ;A9E54C;

  + LDA.W $8802                                                          ;A9E54F;
    CMP.W #$0026                                                         ;A9E552;
    BPL .return                                                          ;A9E555;
    LDA.W $2080,X                                                        ;A9E557;
    STA.W $2082,Y                                                        ;A9E55A;
    LDA.W $2090,X                                                        ;A9E55D;
    STA.W $2092,Y                                                        ;A9E560;

.return:
    RTS                                                                  ;A9E563;


CorpseRottingRotEntry_Move_Sidehopper_Param1_2:
    LDA.W $8802                                                          ;A9E564;
    CMP.W #$0026                                                         ;A9E567;
    BPL +                                                                ;A9E56A;
    LDA.W $2320,X                                                        ;A9E56C;
    STA.W $2322,Y                                                        ;A9E56F;
    LDA.W $2330,X                                                        ;A9E572;
    STA.W $2332,Y                                                        ;A9E575;

  + STZ.W $2320,X                                                        ;A9E578;
    STZ.W $2330,X                                                        ;A9E57B;
    LDA.W $8802                                                          ;A9E57E;
    CMP.W #$0026                                                         ;A9E581;
    BPL +                                                                ;A9E584;
    LDA.W $2340,X                                                        ;A9E586;
    STA.W $2342,Y                                                        ;A9E589;
    LDA.W $2350,X                                                        ;A9E58C;
    STA.W $2352,Y                                                        ;A9E58F;

  + STZ.W $2340,X                                                        ;A9E592;
    STZ.W $2350,X                                                        ;A9E595;
    LDA.W $8802                                                          ;A9E598;
    CMP.W #$0008                                                         ;A9E59B;
    BCC .column3                                                         ;A9E59E;
    CMP.W #$0026                                                         ;A9E5A0;
    BPL +                                                                ;A9E5A3;
    LDA.W $2360,X                                                        ;A9E5A5;
    STA.W $2362,Y                                                        ;A9E5A8;
    LDA.W $2370,X                                                        ;A9E5AB;
    STA.W $2372,Y                                                        ;A9E5AE;

  + STZ.W $2360,X                                                        ;A9E5B1;
    STZ.W $2370,X                                                        ;A9E5B4;

.column3:
    LDA.W $8802                                                          ;A9E5B7;
    CMP.W #$0008                                                         ;A9E5BA;
    BCC .column4                                                         ;A9E5BD;
    CMP.W #$0026                                                         ;A9E5BF;
    BPL +                                                                ;A9E5C2;
    LDA.W $2380,X                                                        ;A9E5C4;
    STA.W $2382,Y                                                        ;A9E5C7;
    LDA.W $2390,X                                                        ;A9E5CA;
    STA.W $2392,Y                                                        ;A9E5CD;

  + STZ.W $2380,X                                                        ;A9E5D0;
    STZ.W $2390,X                                                        ;A9E5D3;

.column4:
    LDA.W $8802                                                          ;A9E5D6;
    CMP.W #$0008                                                         ;A9E5D9;
    BCC .return                                                          ;A9E5DC;
    CMP.W #$0026                                                         ;A9E5DE;
    BPL +                                                                ;A9E5E1;
    LDA.W $23A0,X                                                        ;A9E5E3;
    STA.W $23A2,Y                                                        ;A9E5E6;
    LDA.W $23B0,X                                                        ;A9E5E9;
    STA.W $23B2,Y                                                        ;A9E5EC;

  + STZ.W $23A0,X                                                        ;A9E5EF;
    STZ.W $23B0,X                                                        ;A9E5F2;

.return:
    RTS                                                                  ;A9E5F5;


CorpseRottingRotEntry_Copy_Sidehopper_Param1_2:
    LDA.W $8802                                                          ;A9E5F6;
    CMP.W #$0026                                                         ;A9E5F9;
    BPL +                                                                ;A9E5FC;
    LDA.W $2320,X                                                        ;A9E5FE;
    STA.W $2322,Y                                                        ;A9E601;
    LDA.W $2330,X                                                        ;A9E604;
    STA.W $2332,Y                                                        ;A9E607;

  + LDA.W $8802                                                          ;A9E60A;
    CMP.W #$0026                                                         ;A9E60D;
    BPL +                                                                ;A9E610;
    LDA.W $2340,X                                                        ;A9E612;
    STA.W $2342,Y                                                        ;A9E615;
    LDA.W $2350,X                                                        ;A9E618;
    STA.W $2352,Y                                                        ;A9E61B;

  + LDA.W $8802                                                          ;A9E61E;
    CMP.W #$0008                                                         ;A9E621;
    BCC +                                                                ;A9E624;
    CMP.W #$0026                                                         ;A9E626;
    BPL +                                                                ;A9E629;
    LDA.W $2360,X                                                        ;A9E62B;
    STA.W $2362,Y                                                        ;A9E62E;
    LDA.W $2370,X                                                        ;A9E631;
    STA.W $2372,Y                                                        ;A9E634;

  + LDA.W $8802                                                          ;A9E637;
    CMP.W #$0008                                                         ;A9E63A;
    BCC +                                                                ;A9E63D;
    CMP.W #$0026                                                         ;A9E63F;
    BPL +                                                                ;A9E642;
    LDA.W $2380,X                                                        ;A9E644;
    STA.W $2382,Y                                                        ;A9E647;
    LDA.W $2390,X                                                        ;A9E64A;
    STA.W $2392,Y                                                        ;A9E64D;

  + LDA.W $8802                                                          ;A9E650;
    CMP.W #$0008                                                         ;A9E653;
    BCC .return                                                          ;A9E656;
    CMP.W #$0026                                                         ;A9E658;
    BPL .return                                                          ;A9E65B;
    LDA.W $23A0,X                                                        ;A9E65D;
    STA.W $23A2,Y                                                        ;A9E660;
    LDA.W $23B0,X                                                        ;A9E663;
    STA.W $23B2,Y                                                        ;A9E666;

.return:
    RTS                                                                  ;A9E669;


CorpseRottingRotEntry_Move_Zoomer_Param1_0:
    LDA.W $8802                                                          ;A9E66A;
    CMP.W #$000E                                                         ;A9E66D;
    BPL +                                                                ;A9E670;
    LDA.W $2940,X                                                        ;A9E672;
    STA.W $2942,Y                                                        ;A9E675;
    LDA.W $2950,X                                                        ;A9E678;
    STA.W $2952,Y                                                        ;A9E67B;

  + STZ.W $2940,X                                                        ;A9E67E;
    STZ.W $2950,X                                                        ;A9E681;
    LDA.W $8802                                                          ;A9E684;
    CMP.W #$000E                                                         ;A9E687;
    BPL +                                                                ;A9E68A;
    LDA.W $2960,X                                                        ;A9E68C;
    STA.W $2962,Y                                                        ;A9E68F;
    LDA.W $2970,X                                                        ;A9E692;
    STA.W $2972,Y                                                        ;A9E695;

  + STZ.W $2960,X                                                        ;A9E698;
    STZ.W $2970,X                                                        ;A9E69B;
    LDA.W $8802                                                          ;A9E69E;
    CMP.W #$000E                                                         ;A9E6A1;
    BPL +                                                                ;A9E6A4;
    LDA.W $2980,X                                                        ;A9E6A6;
    STA.W $2982,Y                                                        ;A9E6A9;
    LDA.W $2990,X                                                        ;A9E6AC;
    STA.W $2992,Y                                                        ;A9E6AF;

  + STZ.W $2980,X                                                        ;A9E6B2;
    STZ.W $2990,X                                                        ;A9E6B5;
    RTS                                                                  ;A9E6B8;


CorpseRottingRotEntry_Copy_Zoomer_Param1_0:
    LDA.W $8802                                                          ;A9E6B9;
    CMP.W #$000E                                                         ;A9E6BC;
    BPL +                                                                ;A9E6BF;
    LDA.W $2940,X                                                        ;A9E6C1;
    STA.W $2942,Y                                                        ;A9E6C4;
    LDA.W $2950,X                                                        ;A9E6C7;
    STA.W $2952,Y                                                        ;A9E6CA;

  + LDA.W $8802                                                          ;A9E6CD;
    CMP.W #$000E                                                         ;A9E6D0;
    BPL +                                                                ;A9E6D3;
    LDA.W $2960,X                                                        ;A9E6D5;
    STA.W $2962,Y                                                        ;A9E6D8;
    LDA.W $2970,X                                                        ;A9E6DB;
    STA.W $2972,Y                                                        ;A9E6DE;

  + LDA.W $8802                                                          ;A9E6E1;
    CMP.W #$000E                                                         ;A9E6E4;
    BPL .return                                                          ;A9E6E7;
    LDA.W $2980,X                                                        ;A9E6E9;
    STA.W $2982,Y                                                        ;A9E6EC;
    LDA.W $2990,X                                                        ;A9E6EF;
    STA.W $2992,Y                                                        ;A9E6F2;

.return:
    RTS                                                                  ;A9E6F5;


CorpseRottingRotEntry_Move_Zoomer_Param1_2:
    LDA.W $8802                                                          ;A9E6F6;
    CMP.W #$000E                                                         ;A9E6F9;
    BPL +                                                                ;A9E6FC;
    LDA.W $2A00,X                                                        ;A9E6FE;
    STA.W $2A02,Y                                                        ;A9E701;
    LDA.W $2A10,X                                                        ;A9E704;
    STA.W $2A12,Y                                                        ;A9E707;

  + STZ.W $2A00,X                                                        ;A9E70A;
    STZ.W $2A10,X                                                        ;A9E70D;
    LDA.W $8802                                                          ;A9E710;
    CMP.W #$000E                                                         ;A9E713;
    BPL +                                                                ;A9E716;
    LDA.W $2A20,X                                                        ;A9E718;
    STA.W $2A22,Y                                                        ;A9E71B;
    LDA.W $2A30,X                                                        ;A9E71E;
    STA.W $2A32,Y                                                        ;A9E721;

  + STZ.W $2A20,X                                                        ;A9E724;
    STZ.W $2A30,X                                                        ;A9E727;
    LDA.W $8802                                                          ;A9E72A;
    CMP.W #$000E                                                         ;A9E72D;
    BPL +                                                                ;A9E730;
    LDA.W $2A40,X                                                        ;A9E732;
    STA.W $2A42,Y                                                        ;A9E735;
    LDA.W $2A50,X                                                        ;A9E738;
    STA.W $2A52,Y                                                        ;A9E73B;

  + STZ.W $2A40,X                                                        ;A9E73E;
    STZ.W $2A50,X                                                        ;A9E741;
    RTS                                                                  ;A9E744;


CorpseRottingRotEntry_Copy_Zoomer_Param1_2:
    LDA.W $8802                                                          ;A9E745;
    CMP.W #$000E                                                         ;A9E748;
    BPL +                                                                ;A9E74B;
    LDA.W $2A00,X                                                        ;A9E74D;
    STA.W $2A02,Y                                                        ;A9E750;
    LDA.W $2A10,X                                                        ;A9E753;
    STA.W $2A12,Y                                                        ;A9E756;

  + LDA.W $8802                                                          ;A9E759;
    CMP.W #$000E                                                         ;A9E75C;
    BPL +                                                                ;A9E75F;
    LDA.W $2A20,X                                                        ;A9E761;
    STA.W $2A22,Y                                                        ;A9E764;
    LDA.W $2A30,X                                                        ;A9E767;
    STA.W $2A32,Y                                                        ;A9E76A;

  + LDA.W $8802                                                          ;A9E76D;
    CMP.W #$000E                                                         ;A9E770;
    BPL .return                                                          ;A9E773;
    LDA.W $2A40,X                                                        ;A9E775;
    STA.W $2A42,Y                                                        ;A9E778;
    LDA.W $2A50,X                                                        ;A9E77B;
    STA.W $2A52,Y                                                        ;A9E77E;

.return:
    RTS                                                                  ;A9E781;


CorpseRottingRotEntry_Move_Zoomer_Param1_4:
    LDA.W $8802                                                          ;A9E782;
    CMP.W #$000E                                                         ;A9E785;
    BPL +                                                                ;A9E788;
    LDA.W $2AC0,X                                                        ;A9E78A;
    STA.W $2AC2,Y                                                        ;A9E78D;
    LDA.W $2AD0,X                                                        ;A9E790;
    STA.W $2AD2,Y                                                        ;A9E793;

  + STZ.W $2AC0,X                                                        ;A9E796;
    STZ.W $2AD0,X                                                        ;A9E799;
    LDA.W $8802                                                          ;A9E79C;
    CMP.W #$000E                                                         ;A9E79F;
    BPL +                                                                ;A9E7A2;
    LDA.W $2AE0,X                                                        ;A9E7A4;
    STA.W $2AE2,Y                                                        ;A9E7A7;
    LDA.W $2AF0,X                                                        ;A9E7AA;
    STA.W $2AF2,Y                                                        ;A9E7AD;

  + STZ.W $2AE0,X                                                        ;A9E7B0;
    STZ.W $2AF0,X                                                        ;A9E7B3;
    LDA.W $8802                                                          ;A9E7B6;
    CMP.W #$000E                                                         ;A9E7B9;
    BPL +                                                                ;A9E7BC;
    LDA.W $2B00,X                                                        ;A9E7BE;
    STA.W $2B02,Y                                                        ;A9E7C1;
    LDA.W $2B10,X                                                        ;A9E7C4;
    STA.W $2B12,Y                                                        ;A9E7C7;

  + STZ.W $2B00,X                                                        ;A9E7CA;
    STZ.W $2B10,X                                                        ;A9E7CD;
    RTS                                                                  ;A9E7D0;


CorpseRottingRotEntry_Copy_Zoomer_Param1_4:
    LDA.W $8802                                                          ;A9E7D1;
    CMP.W #$000E                                                         ;A9E7D4;
    BPL +                                                                ;A9E7D7;
    LDA.W $2AC0,X                                                        ;A9E7D9;
    STA.W $2AC2,Y                                                        ;A9E7DC;
    LDA.W $2AD0,X                                                        ;A9E7DF;
    STA.W $2AD2,Y                                                        ;A9E7E2;

  + LDA.W $8802                                                          ;A9E7E5;
    CMP.W #$000E                                                         ;A9E7E8;
    BPL +                                                                ;A9E7EB;
    LDA.W $2AE0,X                                                        ;A9E7ED;
    STA.W $2AE2,Y                                                        ;A9E7F0;
    LDA.W $2AF0,X                                                        ;A9E7F3;
    STA.W $2AF2,Y                                                        ;A9E7F6;

  + LDA.W $8802                                                          ;A9E7F9;
    CMP.W #$000E                                                         ;A9E7FC;
    BPL .return                                                          ;A9E7FF;
    LDA.W $2B00,X                                                        ;A9E801;
    STA.W $2B02,Y                                                        ;A9E804;
    LDA.W $2B10,X                                                        ;A9E807;
    STA.W $2B12,Y                                                        ;A9E80A;

.return:
    RTS                                                                  ;A9E80D;


CorpseRottingRotEntry_Move_Ripper_Param1_0:
    LDA.W $8802                                                          ;A9E80E;
    CMP.W #$000E                                                         ;A9E811;
    BPL +                                                                ;A9E814;
    LDA.W $2B80,X                                                        ;A9E816;
    STA.W $2B82,Y                                                        ;A9E819;
    LDA.W $2B90,X                                                        ;A9E81C;
    STA.W $2B92,Y                                                        ;A9E81F;

  + STZ.W $2B80,X                                                        ;A9E822;
    STZ.W $2B90,X                                                        ;A9E825;
    LDA.W $8802                                                          ;A9E828;
    CMP.W #$000E                                                         ;A9E82B;
    BPL +                                                                ;A9E82E;
    LDA.W $2BA0,X                                                        ;A9E830;
    STA.W $2BA2,Y                                                        ;A9E833;
    LDA.W $2BB0,X                                                        ;A9E836;
    STA.W $2BB2,Y                                                        ;A9E839;

  + STZ.W $2BA0,X                                                        ;A9E83C;
    STZ.W $2BB0,X                                                        ;A9E83F;
    LDA.W $8802                                                          ;A9E842;
    CMP.W #$000E                                                         ;A9E845;
    BPL +                                                                ;A9E848;
    LDA.W $2BC0,X                                                        ;A9E84A;
    STA.W $2BC2,Y                                                        ;A9E84D;
    LDA.W $2BD0,X                                                        ;A9E850;
    STA.W $2BD2,Y                                                        ;A9E853;

  + STZ.W $2BC0,X                                                        ;A9E856;
    STZ.W $2BD0,X                                                        ;A9E859;
    RTS                                                                  ;A9E85C;


CorpseRottingRotEntry_Copy_Ripper_Param1_0:
    LDA.W $8802                                                          ;A9E85D;
    CMP.W #$000E                                                         ;A9E860;
    BPL +                                                                ;A9E863;
    LDA.W $2B80,X                                                        ;A9E865;
    STA.W $2B82,Y                                                        ;A9E868;
    LDA.W $2B90,X                                                        ;A9E86B;
    STA.W $2B92,Y                                                        ;A9E86E;

  + LDA.W $8802                                                          ;A9E871;
    CMP.W #$000E                                                         ;A9E874;
    BPL +                                                                ;A9E877;
    LDA.W $2BA0,X                                                        ;A9E879;
    STA.W $2BA2,Y                                                        ;A9E87C;
    LDA.W $2BB0,X                                                        ;A9E87F;
    STA.W $2BB2,Y                                                        ;A9E882;

  + LDA.W $8802                                                          ;A9E885;
    CMP.W #$000E                                                         ;A9E888;
    BPL .return                                                          ;A9E88B;
    LDA.W $2BC0,X                                                        ;A9E88D;
    STA.W $2BC2,Y                                                        ;A9E890;
    LDA.W $2BD0,X                                                        ;A9E893;
    STA.W $2BD2,Y                                                        ;A9E896;

.return:
    RTS                                                                  ;A9E899;


CorpseRottingRotEntry_Move_Ripper_Param1_2:
    LDA.W $8802                                                          ;A9E89A;
    CMP.W #$000E                                                         ;A9E89D;
    BPL +                                                                ;A9E8A0;
    LDA.W $2C40,X                                                        ;A9E8A2;
    STA.W $2C42,Y                                                        ;A9E8A5;
    LDA.W $2C50,X                                                        ;A9E8A8;
    STA.W $2C52,Y                                                        ;A9E8AB;

  + STZ.W $2C40,X                                                        ;A9E8AE;
    STZ.W $2C50,X                                                        ;A9E8B1;
    LDA.W $8802                                                          ;A9E8B4;
    CMP.W #$000E                                                         ;A9E8B7;
    BPL +                                                                ;A9E8BA;
    LDA.W $2C60,X                                                        ;A9E8BC;
    STA.W $2C62,Y                                                        ;A9E8BF;
    LDA.W $2C70,X                                                        ;A9E8C2;
    STA.W $2C72,Y                                                        ;A9E8C5;

  + STZ.W $2C60,X                                                        ;A9E8C8;
    STZ.W $2C70,X                                                        ;A9E8CB;
    LDA.W $8802                                                          ;A9E8CE;
    CMP.W #$000E                                                         ;A9E8D1;
    BPL +                                                                ;A9E8D4;
    LDA.W $2C80,X                                                        ;A9E8D6;
    STA.W $2C82,Y                                                        ;A9E8D9;
    LDA.W $2C90,X                                                        ;A9E8DC;
    STA.W $2C92,Y                                                        ;A9E8DF;

  + STZ.W $2C80,X                                                        ;A9E8E2;
    STZ.W $2C90,X                                                        ;A9E8E5;
    RTS                                                                  ;A9E8E8;


CorpseRottingRotEntry_Copy_Ripper_Param1_2:
    LDA.W $8802                                                          ;A9E8E9;
    CMP.W #$000E                                                         ;A9E8EC;
    BPL +                                                                ;A9E8EF;
    LDA.W $2C40,X                                                        ;A9E8F1;
    STA.W $2C42,Y                                                        ;A9E8F4;
    LDA.W $2C50,X                                                        ;A9E8F7;
    STA.W $2C52,Y                                                        ;A9E8FA;

  + LDA.W $8802                                                          ;A9E8FD;
    CMP.W #$000E                                                         ;A9E900;
    BPL +                                                                ;A9E903;
    LDA.W $2C60,X                                                        ;A9E905;
    STA.W $2C62,Y                                                        ;A9E908;
    LDA.W $2C70,X                                                        ;A9E90B;
    STA.W $2C72,Y                                                        ;A9E90E;

  + LDA.W $8802                                                          ;A9E911;
    CMP.W #$000E                                                         ;A9E914;
    BPL .return                                                          ;A9E917;
    LDA.W $2C80,X                                                        ;A9E919;
    STA.W $2C82,Y                                                        ;A9E91C;
    LDA.W $2C90,X                                                        ;A9E91F;
    STA.W $2C92,Y                                                        ;A9E922;

.return:
    RTS                                                                  ;A9E925;


CorpseRottingRotEntry_Move_Skree_Param1_0:
    LDA.W $8802                                                          ;A9E926;
    CMP.W #$001E                                                         ;A9E929;
    BPL +                                                                ;A9E92C;
    LDA.W $2640,X                                                        ;A9E92E;
    STA.W $2642,Y                                                        ;A9E931;
    LDA.W $2650,X                                                        ;A9E934;
    STA.W $2652,Y                                                        ;A9E937;

  + STZ.W $2640,X                                                        ;A9E93A;
    STZ.W $2650,X                                                        ;A9E93D;
    LDA.W $8802                                                          ;A9E940;
    CMP.W #$001E                                                         ;A9E943;
    BPL +                                                                ;A9E946;
    LDA.W $2660,X                                                        ;A9E948;
    STA.W $2662,Y                                                        ;A9E94B;
    LDA.W $2670,X                                                        ;A9E94E;
    STA.W $2672,Y                                                        ;A9E951;

  + STZ.W $2660,X                                                        ;A9E954;
    STZ.W $2670,X                                                        ;A9E957;
    RTS                                                                  ;A9E95A;


CorpseRottingRotEntry_Copy_Skree_Param1_0:
    LDA.W $8802                                                          ;A9E95B;
    CMP.W #$001E                                                         ;A9E95E;
    BPL +                                                                ;A9E961;
    LDA.W $2640,X                                                        ;A9E963;
    STA.W $2642,Y                                                        ;A9E966;
    LDA.W $2650,X                                                        ;A9E969;
    STA.W $2652,Y                                                        ;A9E96C;

  + LDA.W $8802                                                          ;A9E96F;
    CMP.W #$001E                                                         ;A9E972;
    BPL .return                                                          ;A9E975;
    LDA.W $2660,X                                                        ;A9E977;
    STA.W $2662,Y                                                        ;A9E97A;
    LDA.W $2670,X                                                        ;A9E97D;
    STA.W $2672,Y                                                        ;A9E980;

.return:
    RTS                                                                  ;A9E983;


CorpseRottingRotEntry_Move_Skree_Param1_2:
    LDA.W $8802                                                          ;A9E984;
    CMP.W #$001E                                                         ;A9E987;
    BPL +                                                                ;A9E98A;
    LDA.W $2740,X                                                        ;A9E98C;
    STA.W $2742,Y                                                        ;A9E98F;
    LDA.W $2750,X                                                        ;A9E992;
    STA.W $2752,Y                                                        ;A9E995;

  + STZ.W $2740,X                                                        ;A9E998;
    STZ.W $2750,X                                                        ;A9E99B;
    LDA.W $8802                                                          ;A9E99E;
    CMP.W #$001E                                                         ;A9E9A1;
    BPL +                                                                ;A9E9A4;
    LDA.W $2760,X                                                        ;A9E9A6;
    STA.W $2762,Y                                                        ;A9E9A9;
    LDA.W $2770,X                                                        ;A9E9AC;
    STA.W $2772,Y                                                        ;A9E9AF;

  + STZ.W $2760,X                                                        ;A9E9B2;
    STZ.W $2770,X                                                        ;A9E9B5;
    RTS                                                                  ;A9E9B8;


CorpseRottingRotEntry_Copy_Skree_Param1_2:
    LDA.W $8802                                                          ;A9E9B9;
    CMP.W #$001E                                                         ;A9E9BC;
    BPL +                                                                ;A9E9BF;
    LDA.W $2740,X                                                        ;A9E9C1;
    STA.W $2742,Y                                                        ;A9E9C4;
    LDA.W $2750,X                                                        ;A9E9C7;
    STA.W $2752,Y                                                        ;A9E9CA;

  + LDA.W $8802                                                          ;A9E9CD;
    CMP.W #$001E                                                         ;A9E9D0;
    BPL .return                                                          ;A9E9D3;
    LDA.W $2760,X                                                        ;A9E9D5;
    STA.W $2762,Y                                                        ;A9E9D8;
    LDA.W $2770,X                                                        ;A9E9DB;
    STA.W $2772,Y                                                        ;A9E9DE;

.return:
    RTS                                                                  ;A9E9E1;


CorpseRottingRotEntry_Move_Skree_Param1_4:
    LDA.W $8802                                                          ;A9E9E2;
    CMP.W #$001E                                                         ;A9E9E5;
    BPL +                                                                ;A9E9E8;
    LDA.W $2840,X                                                        ;A9E9EA;
    STA.W $2842,Y                                                        ;A9E9ED;
    LDA.W $2850,X                                                        ;A9E9F0;
    STA.W $2852,Y                                                        ;A9E9F3;

  + STZ.W $2840,X                                                        ;A9E9F6;
    STZ.W $2850,X                                                        ;A9E9F9;
    LDA.W $8802                                                          ;A9E9FC;
    CMP.W #$001E                                                         ;A9E9FF;
    BPL +                                                                ;A9EA02;
    LDA.W $2860,X                                                        ;A9EA04;
    STA.W $2862,Y                                                        ;A9EA07;
    LDA.W $2870,X                                                        ;A9EA0A;
    STA.W $2872,Y                                                        ;A9EA0D;

  + STZ.W $2860,X                                                        ;A9EA10;
    STZ.W $2870,X                                                        ;A9EA13;
    RTS                                                                  ;A9EA16;


CorpseRottingRotEntry_Copy_Skree_Param1_4:
    LDA.W $8802                                                          ;A9EA17;
    CMP.W #$001E                                                         ;A9EA1A;
    BPL +                                                                ;A9EA1D;
    LDA.W $2840,X                                                        ;A9EA1F;
    STA.W $2842,Y                                                        ;A9EA22;
    LDA.W $2850,X                                                        ;A9EA25;
    STA.W $2852,Y                                                        ;A9EA28;

  + LDA.W $8802                                                          ;A9EA2B;
    CMP.W #$001E                                                         ;A9EA2E;
    BPL .return                                                          ;A9EA31;
    LDA.W $2860,X                                                        ;A9EA33;
    STA.W $2862,Y                                                        ;A9EA36;
    LDA.W $2870,X                                                        ;A9EA39;
    STA.W $2872,Y                                                        ;A9EA3C;

.return:
    RTS                                                                  ;A9EA3F;


CorpseRottingRotEntry_Move_MotherBrain:
    LDA.W $8802                                                          ;A9EA40;
    CMP.W #$0010                                                         ;A9EA43;
    BCC .column1                                                         ;A9EA46;
    CMP.W #$002E                                                         ;A9EA48;
    BPL +                                                                ;A9EA4B;
    LDA.W $9000,X                                                        ;A9EA4D;
    STA.W $9002,Y                                                        ;A9EA50;
    LDA.W $9010,X                                                        ;A9EA53;
    STA.W $9012,Y                                                        ;A9EA56;

  + STZ.W $9000,X                                                        ;A9EA59;
    STZ.W $9010,X                                                        ;A9EA5C;

.column1:
    LDA.W $8802                                                          ;A9EA5F;
    CMP.W #$0008                                                         ;A9EA62;
    BCC .column2                                                         ;A9EA65;
    CMP.W #$002E                                                         ;A9EA67;
    BPL +                                                                ;A9EA6A;
    LDA.W $9020,X                                                        ;A9EA6C;
    STA.W $9022,Y                                                        ;A9EA6F;
    LDA.W $9030,X                                                        ;A9EA72;
    STA.W $9032,Y                                                        ;A9EA75;

  + STZ.W $9020,X                                                        ;A9EA78;
    STZ.W $9030,X                                                        ;A9EA7B;

.column2:
    LDA.W $8802                                                          ;A9EA7E;
    CMP.W #$002E                                                         ;A9EA81;
    BPL +                                                                ;A9EA84;
    LDA.W $9040,X                                                        ;A9EA86;
    STA.W $9042,Y                                                        ;A9EA89;
    LDA.W $9050,X                                                        ;A9EA8C;
    STA.W $9052,Y                                                        ;A9EA8F;

  + STZ.W $9040,X                                                        ;A9EA92;
    STZ.W $9050,X                                                        ;A9EA95;
    LDA.W $8802                                                          ;A9EA98;
    CMP.W #$002E                                                         ;A9EA9B;
    BPL +                                                                ;A9EA9E;
    LDA.W $9060,X                                                        ;A9EAA0;
    STA.W $9062,Y                                                        ;A9EAA3;
    LDA.W $9070,X                                                        ;A9EAA6;
    STA.W $9072,Y                                                        ;A9EAA9;

  + STZ.W $9060,X                                                        ;A9EAAC;
    STZ.W $9070,X                                                        ;A9EAAF;
    LDA.W $8802                                                          ;A9EAB2;
    CMP.W #$002E                                                         ;A9EAB5;
    BPL +                                                                ;A9EAB8;
    LDA.W $9080,X                                                        ;A9EABA;
    STA.W $9082,Y                                                        ;A9EABD;
    LDA.W $9090,X                                                        ;A9EAC0;
    STA.W $9092,Y                                                        ;A9EAC3;

  + STZ.W $9080,X                                                        ;A9EAC6;
    STZ.W $9090,X                                                        ;A9EAC9;
    LDA.W $8802                                                          ;A9EACC;
    CMP.W #$0008                                                         ;A9EACF;
    BCC .column6                                                         ;A9EAD2;
    CMP.W #$002E                                                         ;A9EAD4;
    BPL +                                                                ;A9EAD7;
    LDA.W $90A0,X                                                        ;A9EAD9;
    STA.W $90A2,Y                                                        ;A9EADC;
    LDA.W $90B0,X                                                        ;A9EADF;
    STA.W $90B2,Y                                                        ;A9EAE2;

  + STZ.W $90A0,X                                                        ;A9EAE5;
    STZ.W $90B0,X                                                        ;A9EAE8;

.column6:
    LDA.W $8802                                                          ;A9EAEB;
    CMP.W #$0020                                                         ;A9EAEE;
    BCC .return                                                          ;A9EAF1;
    CMP.W #$002E                                                         ;A9EAF3;
    BPL +                                                                ;A9EAF6;
    LDA.W $90C0,X                                                        ;A9EAF8;
    STA.W $90C2,Y                                                        ;A9EAFB;
    LDA.W $90D0,X                                                        ;A9EAFE;
    STA.W $90D2,Y                                                        ;A9EB01;

  + STZ.W $90C0,X                                                        ;A9EB04;
    STZ.W $90D0,X                                                        ;A9EB07;

.return:
    RTS                                                                  ;A9EB0A;


CorpseRottingRotEntry_Copy_MotherBrain:
    LDA.W $8802                                                          ;A9EB0B;
    CMP.W #$0010                                                         ;A9EB0E;
    BCC +                                                                ;A9EB11;
    CMP.W #$002E                                                         ;A9EB13;
    BPL +                                                                ;A9EB16;
    LDA.W $9000,X                                                        ;A9EB18;
    STA.W $9002,Y                                                        ;A9EB1B;
    LDA.W $9010,X                                                        ;A9EB1E;
    STA.W $9012,Y                                                        ;A9EB21;

  + LDA.W $8802                                                          ;A9EB24;
    CMP.W #$0008                                                         ;A9EB27;
    BCC +                                                                ;A9EB2A;
    CMP.W #$002E                                                         ;A9EB2C;
    BPL +                                                                ;A9EB2F;
    LDA.W $9020,X                                                        ;A9EB31;
    STA.W $9022,Y                                                        ;A9EB34;
    LDA.W $9030,X                                                        ;A9EB37;
    STA.W $9032,Y                                                        ;A9EB3A;

  + LDA.W $8802                                                          ;A9EB3D;
    CMP.W #$002E                                                         ;A9EB40;
    BPL +                                                                ;A9EB43;
    LDA.W $9040,X                                                        ;A9EB45;
    STA.W $9042,Y                                                        ;A9EB48;
    LDA.W $9050,X                                                        ;A9EB4B;
    STA.W $9052,Y                                                        ;A9EB4E;

  + LDA.W $8802                                                          ;A9EB51;
    CMP.W #$002E                                                         ;A9EB54;
    BPL +                                                                ;A9EB57;
    LDA.W $9060,X                                                        ;A9EB59;
    STA.W $9062,Y                                                        ;A9EB5C;
    LDA.W $9070,X                                                        ;A9EB5F;
    STA.W $9072,Y                                                        ;A9EB62;

  + LDA.W $8802                                                          ;A9EB65;
    CMP.W #$002E                                                         ;A9EB68;
    BPL +                                                                ;A9EB6B;
    LDA.W $9080,X                                                        ;A9EB6D;
    STA.W $9082,Y                                                        ;A9EB70;
    LDA.W $9090,X                                                        ;A9EB73;
    STA.W $9092,Y                                                        ;A9EB76;

  + LDA.W $8802                                                          ;A9EB79;
    CMP.W #$0008                                                         ;A9EB7C;
    BCC +                                                                ;A9EB7F;
    CMP.W #$002E                                                         ;A9EB81;
    BPL +                                                                ;A9EB84;
    LDA.W $90A0,X                                                        ;A9EB86;
    STA.W $90A2,Y                                                        ;A9EB89;
    LDA.W $90B0,X                                                        ;A9EB8C;
    STA.W $90B2,Y                                                        ;A9EB8F;

  + LDA.W $8802                                                          ;A9EB92;
    CMP.W #$0020                                                         ;A9EB95;
    BCC .return                                                          ;A9EB98;
    CMP.W #$002E                                                         ;A9EB9A;
    BPL .return                                                          ;A9EB9D;
    LDA.W $90C0,X                                                        ;A9EB9F;
    STA.W $90C2,Y                                                        ;A9EBA2;
    LDA.W $90D0,X                                                        ;A9EBA5;
    STA.W $90D2,Y                                                        ;A9EBA8;

.return:
    RTS                                                                  ;A9EBAB;


Palette_CorpseSidehopper2:
    dw $3800,$4EDA,$3A35,$2990,$14EB,$77E9,$5706,$3A44                   ;A9EBAC;
    dw $1D62,$2FBA,$22F6,$1A33,$1170,$08CD,$639F,$0446                   ;A9EBBC;

Palette_SidehopperCorpseBeingDrained_0:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A9EBCC;
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A9EBDC;

Palette_SidehopperCorpseBeingDrained_1:
    dw $3800,$77DF,$52C5,$2962,$14A1,$67A5,$56A4,$4203                   ;A9EBEC;
    dw $3182,$77FF,$0F7B,$01F4,$00CF,$037B,$01F3,$00AF                   ;A9EBFC;

Palette_SidehopperCorpseBeingDrained_2:
    dw $3800,$6FBF,$4ECA,$2544,$10A2,$5F8B,$4E88,$3DE6                   ;A9EC0C;
    dw $2D85,$6FFF,$1B5A,$05D1,$00CC,$06D6,$0190,$00AC                   ;A9EC1C;

Palette_SidehopperCorpseBeingDrained_3:
    dw $3800,$6BBF,$4AAE,$1D05,$0C83,$5B50,$466C,$35EA                   ;A9EC2C;
    dw $2567,$67FF,$2B39,$058F,$00AA,$0652,$014C,$048A                   ;A9EC3C;

Palette_SidehopperCorpseBeingDrained_4:
    dw $3800,$639F,$46B3,$18E7,$0884,$5336,$3E50,$31CD                   ;A9EC4C;
    dw $216A,$5FFF,$3718,$096C,$00A7,$09AD,$00E9,$0487                   ;A9EC5C;

Palette_SidehopperCorpseBeingDrained_5:
    dw $3800,$5B7F,$4298,$10C9,$0465,$4F1B,$3634,$29B0                   ;A9EC6C;
    dw $1D4C,$57FF,$42F7,$0929,$00A5,$0929,$00A5,$0465                   ;A9EC7C;

Palette_SidehopperCorpseBeingDrained_6:
    dw $3800,$57FF,$42F7,$0929,$00A5,$7FFF,$4231,$0043                   ;A9EC8C;
    dw $4B3F,$42DB,$3678,$2E14,$2190,$192C,$0CC9,$0465                   ;A9EC9C;

InstList_CorpseSidehopper_Alive_Hopping:
    dw $0002                                                             ;A9ECAC;
    dw Spritemap_CorpseSidehopper_Alive_0                                ;A9ECAE;
    dw $0004                                                             ;A9ECB0;
    dw Spritemap_CorpseSidehopper_Alive_1                                ;A9ECB2;
    dw $0005                                                             ;A9ECB4;
    dw Spritemap_CorpseSidehopper_Alive_0                                ;A9ECB6;
    dw $0030                                                             ;A9ECB8;
    dw Spritemap_CorpseSidehopper_Alive_1                                ;A9ECBA;
    dw $0005                                                             ;A9ECBC;
    dw Spritemap_CorpseSidehopper_Alive_0                                ;A9ECBE;
    dw $0004                                                             ;A9ECC0;
    dw Spritemap_CorpseSidehopper_Alive_1                                ;A9ECC2;
    dw $0005                                                             ;A9ECC4;
    dw Spritemap_CorpseSidehopper_Alive_0                                ;A9ECC6;
    dw $0004                                                             ;A9ECC8;
    dw Spritemap_CorpseSidehopper_Alive_1                                ;A9ECCA;
    dw Instruction_SidehopperCorpse_EndHop                               ;A9ECCC;
    dw Instruction_Common_Sleep                                          ;A9ECCE;

Instruction_SidehopperCorpse_EndHop:
    PHY                                                                  ;A9ECD0;
    LDY.W #Function_CorpseSidehopper_StartIdling                         ;A9ECD1;
    LDA.L $7E7810,X                                                      ;A9ECD4;
    BEQ .setFunctionPointerInY                                           ;A9ECD8;
    LDY.W #Function_CorpseSidehopper_BeingDrained                        ;A9ECDA;

.setFunctionPointerInY:
    TYA                                                                  ;A9ECDD;
    STA.W $0FA8,X                                                        ;A9ECDE;
    PLY                                                                  ;A9ECE1;
    RTL                                                                  ;A9ECE2;


InstList_CorpseSidehopper_Alive_Idle:
    dw $0001                                                             ;A9ECE3;
    dw Spritemap_CorpseSidehopper_Alive_2                                ;A9ECE5;
    dw Instruction_Common_Sleep                                          ;A9ECE7;

InstList_CorpseSidehopper_Alive_Corpse:
    dw $0001                                                             ;A9ECE9;
    dw Spritemap_CorpseSidehopper_Dead_0                                 ;A9ECEB;
    dw Instruction_Common_Sleep                                          ;A9ECED;

InstList_CorpseSidehopper_Alive_Dead:
    dw $0001                                                             ;A9ECEF;
    dw Spritemap_CorpseSidehopper_Dead_1                                 ;A9ECF1;
    dw Instruction_Common_Sleep                                          ;A9ECF3;

InstList_CorpseZoomer_Param1_0:
    dw $0001                                                             ;A9ECF5;
    dw Spritemap_CorpseZoomer_0                                          ;A9ECF7;
    dw Instruction_Common_Sleep                                          ;A9ECF9;

InstList_CorpseZoomer_Param1_2:
    dw $0001                                                             ;A9ECFB;
    dw Spritemap_CorpseZoomer_1                                          ;A9ECFD;
    dw Instruction_Common_Sleep                                          ;A9ECFF;

InstList_CorpseZoomer_Param1_4:
    dw $0001                                                             ;A9ED01;
    dw Spritemap_CorpseZoomer_2                                          ;A9ED03;
    dw Instruction_Common_Sleep                                          ;A9ED05;

InstList_CorpseRipper_Param1_0:
    dw $0001                                                             ;A9ED07;
    dw Spritemap_CorpseRipper_0                                          ;A9ED09;
    dw Instruction_Common_Sleep                                          ;A9ED0B;

InstList_CorpseRipper_Param1_2:
    dw $0001                                                             ;A9ED0D;
    dw Spritemap_CorpseRipper_1                                          ;A9ED0F;
    dw Instruction_Common_Sleep                                          ;A9ED11;

InstList_CorpseSkree_Param1_0:
    dw $0001                                                             ;A9ED13;
    dw Spritemap_CorpseSkree_0                                           ;A9ED15;
    dw Instruction_Common_Sleep                                          ;A9ED17;

InstList_CorpseSkree_Param1_2:
    dw $0001                                                             ;A9ED19;
    dw Spritemap_CorpseSkree_1                                           ;A9ED1B;
    dw Instruction_Common_Sleep                                          ;A9ED1D;

InstList_CorpseSkree_Param1_4:
    dw $0001                                                             ;A9ED1F;
    dw Spritemap_CorpseSkree_2                                           ;A9ED21;
    dw Instruction_Common_Sleep                                          ;A9ED23;

Spritemap_CorpseSidehopper_Dead_0:
    dw $0008,$C20C                                                       ;A9ED25;
    db $02                                                               ;A9ED29;
    dw $6130,$C20C                                                       ;A9ED2A;
    db $F2                                                               ;A9ED2E;
    dw $6110,$C3FC                                                       ;A9ED2F;
    db $FA                                                               ;A9ED33;
    dw $2123,$C3FC                                                       ;A9ED34;
    db $EA                                                               ;A9ED38;
    dw $2103,$C3F4                                                       ;A9ED39;
    db $FA                                                               ;A9ED3D;
    dw $2122,$C3F4                                                       ;A9ED3E;
    db $EA                                                               ;A9ED42;
    dw $2102,$C3E4                                                       ;A9ED43;
    db $02                                                               ;A9ED47;
    dw $2130,$C3E4                                                       ;A9ED48;
    db $F2                                                               ;A9ED4C;
    dw $2110                                                             ;A9ED4D;

Spritemap_CorpseSidehopper_Dead_1:
    dw $0008,$C20C                                                       ;A9ED4F;
    db $FE                                                               ;A9ED53;
    dw $6129,$C20C                                                       ;A9ED54;
    db $EE                                                               ;A9ED58;
    dw $6109,$C3F4                                                       ;A9ED59;
    db $06                                                               ;A9ED5D;
    dw $213B,$C3F4                                                       ;A9ED5E;
    db $F6                                                               ;A9ED62;
    dw $211B,$C3FC                                                       ;A9ED63;
    db $06                                                               ;A9ED67;
    dw $213C,$C3FC                                                       ;A9ED68;
    db $F6                                                               ;A9ED6C;
    dw $211C,$C3E4                                                       ;A9ED6D;
    db $FE                                                               ;A9ED71;
    dw $2129,$C3E4                                                       ;A9ED72;
    db $EE                                                               ;A9ED76;
    dw $2109                                                             ;A9ED77;

Spritemap_CorpseZoomer_0:
    dw $0002,$C3FC                                                       ;A9ED79;
    db $F8                                                               ;A9ED7D;
    dw $2154,$C3F4                                                       ;A9ED7E;
    db $F8                                                               ;A9ED82;
    dw $2153                                                             ;A9ED83;

Spritemap_CorpseZoomer_1:
    dw $0002,$C3FC                                                       ;A9ED85;
    db $F8                                                               ;A9ED89;
    dw $2157,$C3F4                                                       ;A9ED8A;
    db $F8                                                               ;A9ED8E;
    dw $2156                                                             ;A9ED8F;

Spritemap_CorpseZoomer_2:
    dw $0002,$C3FC                                                       ;A9ED91;
    db $F8                                                               ;A9ED95;
    dw $215A,$C3F4                                                       ;A9ED96;
    db $F8                                                               ;A9ED9A;
    dw $2159                                                             ;A9ED9B;

Spritemap_CorpseRipper_0:
    dw $0002,$C3FC                                                       ;A9ED9D;
    db $F8                                                               ;A9EDA1;
    dw $2151,$C3F4                                                       ;A9EDA2;
    db $F8                                                               ;A9EDA6;
    dw $2150                                                             ;A9EDA7;

Spritemap_CorpseRipper_1:
    dw $0002,$C3FC                                                       ;A9EDA9;
    db $F8                                                               ;A9EDAD;
    dw $215D,$C3F4                                                       ;A9EDAE;
    db $F8                                                               ;A9EDB2;
    dw $215C                                                             ;A9EDB3;

Spritemap_CorpseSkree_0:
    dw $0004,$C3FC                                                       ;A9EDB5;
    db $04                                                               ;A9EDB9;
    dw $7135,$C3FC                                                       ;A9EDBA;
    db $F4                                                               ;A9EDBE;
    dw $7115,$C3F4                                                       ;A9EDBF;
    db $04                                                               ;A9EDC3;
    dw $3135,$C3F4                                                       ;A9EDC4;
    db $F4                                                               ;A9EDC8;
    dw $3115                                                             ;A9EDC9;

Spritemap_CorpseSkree_1:
    dw $0004,$C3FC                                                       ;A9EDCB;
    db $04                                                               ;A9EDCF;
    dw $7127,$C3FC                                                       ;A9EDD0;
    db $F4                                                               ;A9EDD4;
    dw $7107,$C3F4                                                       ;A9EDD5;
    db $04                                                               ;A9EDD9;
    dw $3127,$C3F4                                                       ;A9EDDA;
    db $F4                                                               ;A9EDDE;
    dw $3107                                                             ;A9EDDF;

Spritemap_CorpseSkree_2:
    dw $0004,$C3FC                                                       ;A9EDE1;
    db $04                                                               ;A9EDE5;
    dw $712E,$C3FC                                                       ;A9EDE6;
    db $F4                                                               ;A9EDEA;
    dw $710E,$C3F4                                                       ;A9EDEB;
    db $04                                                               ;A9EDEF;
    dw $312E,$C3F4                                                       ;A9EDF0;
    db $F4                                                               ;A9EDF4;
    dw $310E                                                             ;A9EDF5;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Corpse_A9EDF7:
    dw $000A,$000C                                                       ;A9EDF7;
    db $FC                                                               ;A9EDFB;
    dw $2F0C,$0014                                                       ;A9EDFC;
    db $FC                                                               ;A9EE00;
    dw $2F0D,$0004                                                       ;A9EE01;
    db $FC                                                               ;A9EE05;
    dw $2F0B,$01F4                                                       ;A9EE06;
    db $FC                                                               ;A9EE0A;
    dw $2F0D,$01EC                                                       ;A9EE0B;
    db $FC                                                               ;A9EE0F;
    dw $2F0C,$01E4                                                       ;A9EE10;
    db $FC                                                               ;A9EE14;
    dw $2F0B,$0008                                                       ;A9EE15;
    db $FC                                                               ;A9EE19;
    dw $2F06,$0000                                                       ;A9EE1A;
    db $FC                                                               ;A9EE1E;
    dw $2F05,$01F8                                                       ;A9EE1F;
    db $FC                                                               ;A9EE23;
    dw $2F01,$01F0                                                       ;A9EE24;
    db $FC                                                               ;A9EE28;
    dw $2F00                                                             ;A9EE29;

UNUSED_Spritemap_Corpse_A9EE2B:
    dw $0003,$0004                                                       ;A9EE2B;
    db $FA                                                               ;A9EE2F;
    dw $2F0D,$01FC                                                       ;A9EE30;
    db $FA                                                               ;A9EE34;
    dw $2F0C,$01F4                                                       ;A9EE35;
    db $FA                                                               ;A9EE39;
    dw $2F0B                                                             ;A9EE3A;
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CorpseSidehopper_Alive_0:
    dw $0007,$0000                                                       ;A9EE3C;
    db $EC                                                               ;A9EE40;
    dw $2171,$01F8                                                       ;A9EE41;
    db $EC                                                               ;A9EE45;
    dw $2170,$C20C                                                       ;A9EE46;
    db $04                                                               ;A9EE4A;
    dw $6176,$C3E4                                                       ;A9EE4B;
    db $04                                                               ;A9EE4F;
    dw $2176,$C208                                                       ;A9EE50;
    db $F4                                                               ;A9EE54;
    dw $6174,$C3E8                                                       ;A9EE55;
    db $F4                                                               ;A9EE59;
    dw $2174,$C3F8                                                       ;A9EE5A;
    db $F4                                                               ;A9EE5E;
    dw $2180                                                             ;A9EE5F;

Spritemap_CorpseSidehopper_Alive_1:
    dw $0007,$C3F8                                                       ;A9EE61;
    db $F6                                                               ;A9EE65;
    dw $2182,$C20D                                                       ;A9EE66;
    db $04                                                               ;A9EE6A;
    dw $617A,$C3E3                                                       ;A9EE6B;
    db $04                                                               ;A9EE6F;
    dw $217A,$C208                                                       ;A9EE70;
    db $F4                                                               ;A9EE74;
    dw $6178,$C3E8                                                       ;A9EE75;
    db $F4                                                               ;A9EE79;
    dw $2178,$0000                                                       ;A9EE7A;
    db $EE                                                               ;A9EE7E;
    dw $2171,$01F8                                                       ;A9EE7F;
    db $EE                                                               ;A9EE83;
    dw $2170                                                             ;A9EE84;

Spritemap_CorpseSidehopper_Alive_2:
    dw $000B,$0010                                                       ;A9EE86;
    db $0C                                                               ;A9EE8A;
    dw $6172,$0008                                                       ;A9EE8B;
    db $0C                                                               ;A9EE8F;
    dw $6173,$01F0                                                       ;A9EE90;
    db $0C                                                               ;A9EE94;
    dw $2173,$01E8                                                       ;A9EE95;
    db $0C                                                               ;A9EE99;
    dw $2172,$C208                                                       ;A9EE9A;
    db $FC                                                               ;A9EE9E;
    dw $617E,$C3E8                                                       ;A9EE9F;
    db $FC                                                               ;A9EEA3;
    dw $217E,$C208                                                       ;A9EEA4;
    db $EC                                                               ;A9EEA8;
    dw $617C,$C3E8                                                       ;A9EEA9;
    db $EC                                                               ;A9EEAD;
    dw $217C,$0000                                                       ;A9EEAE;
    db $E3                                                               ;A9EEB2;
    dw $2171,$01F8                                                       ;A9EEB3;
    db $E3                                                               ;A9EEB7;
    dw $2170,$C3F8                                                       ;A9EEB8;
    db $EB                                                               ;A9EEBC;
    dw $2180                                                             ;A9EEBD;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_GetYDividedByA_A9EEBF:
    STY.W $4204                                                          ;A9EEBF;
    SEP #$20                                                             ;A9EEC2;
    STA.W $4206                                                          ;A9EEC4;
    REP #$20                                                             ;A9EEC7;
    XBA                                                                  ;A9EEC9;
    XBA                                                                  ;A9EECA;
    NOP                                                                  ;A9EECB;
    NOP                                                                  ;A9EECC;
    LDA.W $4214                                                          ;A9EECD;
    RTS                                                                  ;A9EED0;
endif ; !FEATURE_KEEP_UNREFERENCED


CheckForEnemyCollisionWithEnemy:
    LDA.W $0F82,Y                                                        ;A9EED1;
    CLC                                                                  ;A9EED4;
    ADC.W $0F82,X                                                        ;A9EED5;
    INC A                                                                ;A9EED8;
    STA.B $12                                                            ;A9EED9;
    LDA.W $0F7A,Y                                                        ;A9EEDB;
    SEC                                                                  ;A9EEDE;
    SBC.W $0F7A,X                                                        ;A9EEDF;
    BPL +                                                                ;A9EEE2;
    EOR.W #$FFFF                                                         ;A9EEE4;
    INC A                                                                ;A9EEE7;

  + CMP.B $12                                                            ;A9EEE8;
    BCS .return                                                          ;A9EEEA;
    LDA.W $0F84,Y                                                        ;A9EEEC;
    CLC                                                                  ;A9EEEF;
    ADC.W $0F84,X                                                        ;A9EEF0;
    INC A                                                                ;A9EEF3;
    STA.B $12                                                            ;A9EEF4;
    LDA.W $0F7E,Y                                                        ;A9EEF6;
    SEC                                                                  ;A9EEF9;
    SBC.W $0F7E,X                                                        ;A9EEFA;
    BPL +                                                                ;A9EEFD;
    EOR.W #$FFFF                                                         ;A9EEFF;
    INC A                                                                ;A9EF02;

  + CMP.B $12                                                            ;A9EF03;

.return:
    RTL                                                                  ;A9EF05;


CheckForEnemyCollisionWithRectangle:
    LDA.B $16                                                            ;A9EF06;
    CLC                                                                  ;A9EF08;
    ADC.W $0F82,X                                                        ;A9EF09;
    INC A                                                                ;A9EF0C;
    STA.B $1A                                                            ;A9EF0D;
    LDA.B $12                                                            ;A9EF0F;
    SEC                                                                  ;A9EF11;
    SBC.W $0F7A,X                                                        ;A9EF12;
    BPL +                                                                ;A9EF15;
    EOR.W #$FFFF                                                         ;A9EF17;
    INC A                                                                ;A9EF1A;

  + CMP.B $1A                                                            ;A9EF1B;
    BCS .return                                                          ;A9EF1D;
    LDA.B $18                                                            ;A9EF1F;
    CLC                                                                  ;A9EF21;
    ADC.W $0F84,X                                                        ;A9EF22;
    INC A                                                                ;A9EF25;
    STA.B $1A                                                            ;A9EF26;
    LDA.B $14                                                            ;A9EF28;
    SEC                                                                  ;A9EF2A;
    SBC.W $0F7E,X                                                        ;A9EF2B;
    BPL +                                                                ;A9EF2E;
    EOR.W #$FFFF                                                         ;A9EF30;
    INC A                                                                ;A9EF33;

  + CMP.B $1A                                                            ;A9EF34;

.return:
    RTL                                                                  ;A9EF36;


InitAI_BabyMetroid:
    PHB                                                                  ;A9EF37;
    PEA.W $7E7E                                                          ;A9EF38;
    PLB                                                                  ;A9EF3B;
    PLB                                                                  ;A9EF3C;
    LDA.W #$0000                                                         ;A9EF3D;
    LDX.W #$0FFE                                                         ;A9EF40;

.loop:
    STA.W $2000,X                                                        ;A9EF43;
    DEX                                                                  ;A9EF46;
    DEX                                                                  ;A9EF47;
    BPL .loop                                                            ;A9EF48;
    PLB                                                                  ;A9EF4A;
    LDX.W $0E54                                                          ;A9EF4B;
    LDA.W $0F86,X                                                        ;A9EF4E;
    ORA.W #$3000                                                         ;A9EF51;
    STA.W $0F86,X                                                        ;A9EF54;
    LDA.W #$0400                                                         ;A9EF57;
    STA.W $0F96,X                                                        ;A9EF5A;
    LDA.W #InstList_BabyMetroid_Normal                                   ;A9EF5D;
    STA.W $0F92,X                                                        ;A9EF60;
    LDA.W #$0001                                                         ;A9EF63;
    STA.W $0F94,X                                                        ;A9EF66;
    STZ.W $0F90,X                                                        ;A9EF69;
    LDA.W #Function_BabyMetroid_WaitForCamera                            ;A9EF6C;
    BIT.W $0911                                                          ;A9EF6F;
    BPL .notLeftDoor                                                     ;A9EF72;
    LDA.W $0F86,X                                                        ;A9EF74;
    ORA.W #$0500                                                         ;A9EF77;
    STA.W $0F86,X                                                        ;A9EF7A;
    LDA.W #Function_BabyMetroid_Disappeared                              ;A9EF7D;

.notLeftDoor:
    STA.W $0FA8,X                                                        ;A9EF80;
    STZ.W $0FAA,X                                                        ;A9EF83;
    STZ.W $0FAC,X                                                        ;A9EF86;
    LDA.W #$000A                                                         ;A9EF89;
    STA.W $0FB0,X                                                        ;A9EF8C;
    STZ.W $0FB6,X                                                        ;A9EF8F;
    LDY.W #Palette_CorpseSidehopper                                      ;A9EF92;
    LDX.W #$0120                                                         ;A9EF95;
    LDA.W #$0010                                                         ;A9EF98;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A9EF9B;
    LDY.W #Palette_BabyMetroid                                           ;A9EF9F;
    LDX.W #$0140                                                         ;A9EFA2;
    LDA.W #$0010                                                         ;A9EFA5;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A9EFA8;
    LDY.W #Palette_CorpseCommon                                          ;A9EFAC;
    LDX.W #$01E0                                                         ;A9EFAF;
    LDA.W #$0010                                                         ;A9EFB2;
    JSL.L WriteAColorsFromYToTargetColorIndexX                           ;A9EFB5;
    RTL                                                                  ;A9EFB9;


PowerBombReaction_BabyMetroid:
    LDX.W $0E54                                                          ;A9EFBA;
    LDA.W $0FB6,X                                                        ;A9EFBD;
    BEQ MainAI_BabyMetroid                                               ;A9EFC0;
    JSR.W SignalBabyMetroidToLeave                                       ;A9EFC2; fallthrough to MainAI_BabyMetroid

MainAI_BabyMetroid:
    LDX.W $0E54                                                          ;A9EFC5;
    LDA.W #$7FFF                                                         ;A9EFC8;
    STA.W $0F8C,X                                                        ;A9EFCB;
    JSR.W ($0FA8,X)                                                      ;A9EFCE;
    JSL.L MoveEnemyAccordingToVelocity                                   ;A9EFD1;
    LDA.L $7EC400                                                        ;A9EFD5;
    BNE .return                                                          ;A9EFD9;
    JSR.W HandleNormalBabyMetroidPalette                                 ;A9EFDB;

.return:
    RTL                                                                  ;A9EFDE;


Function_BabyMetroid_Disappeared:
    STZ.W $0FAA,X                                                        ;A9EFDF;
    STZ.W $0FAC,X                                                        ;A9EFE2;
    RTS                                                                  ;A9EFE5;


Function_BabyMetroid_WaitForCamera:
    LDA.W $0911                                                          ;A9EFE6;
    CMP.W #$0201                                                         ;A9EFE9;
    BPL .return                                                          ;A9EFEC;
    LDA.W #$0200                                                         ;A9EFEE;
    STA.W $0911                                                          ;A9EFF1;
    LDA.L $7ECD20                                                        ;A9EFF4;
    AND.W #$00FF                                                         ;A9EFF8;
    STA.L $7ECD20                                                        ;A9EFFB;
    LDA.L $7ECD22                                                        ;A9EFFF;
    AND.W #$00FF                                                         ;A9F003;
    STA.L $7ECD22                                                        ;A9F006;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9F00A;
    db $30,$03                                                           ;A9F00E;
    dw PLMEntries_createBabyMetroidInvisibleWall                         ;A9F010;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9F012;
    db $1F,$03                                                           ;A9F016;
    dw PLMEntries_createBabyMetroidInvisibleWall                         ;A9F018;
    LDX.W $0E54                                                          ;A9F01A;
    LDA.W #Function_BabyMetroid_LetSidehopperLiveForABit                 ;A9F01D;
    STA.W $0FA8,X                                                        ;A9F020;
    LDA.W #$0001                                                         ;A9F023;
    STA.L $7E7808,X                                                      ;A9F026;

.return:
    RTS                                                                  ;A9F02A;


Function_BabyMetroid_LetSidehopperLiveForABit:
    LDA.W #Function_BabyMetroid_QueueBattleMusic                         ;A9F02B;
    STA.W $0FA8,X                                                        ;A9F02E;
    LDA.W #$01D0                                                         ;A9F031;
    STA.W $0FB2,X                                                        ;A9F034; fallthrough to Function_BabyMetroid_QueueBattleMusic

Function_BabyMetroid_QueueBattleMusic:
    DEC.W $0FB2,X                                                        ;A9F037;
    BPL Function_BabyMetroid_RushToMiddleOfRoom_return                   ;A9F03A;
    LDA.W #$0005                                                         ;A9F03C;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9F03F;
    LDA.W #Function_BabyMetroid_RushToMiddleOfRoom                       ;A9F043;
    STA.W $0FA8,X                                                        ;A9F046; fallthrough to Function_BabyMetroid_RushToMiddleOfRoom

Function_BabyMetroid_RushToMiddleOfRoom:
    LDA.W #$0248                                                         ;A9F049;
    STA.B $12                                                            ;A9F04C;
    LDA.W #$004A                                                         ;A9F04E;
    STA.B $14                                                            ;A9F051;
    LDY.W #$000F                                                         ;A9F053;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F056;
    LDA.W #$0001                                                         ;A9F059;
    STA.B $16                                                            ;A9F05C;
    STA.B $18                                                            ;A9F05E;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9F060;
    BCS Function_BabyMetroid_RushToMiddleOfRoom_return                   ;A9F064;
    LDA.W #Function_BabyMetroid_RushToSidehopper                         ;A9F066;
    STA.W $0FA8,X                                                        ;A9F069;

Function_BabyMetroid_RushToMiddleOfRoom_return:
    RTS                                                                  ;A9F06C;


Function_BabyMetroid_RushToSidehopper:
    LDA.W $0FBA,X                                                        ;A9F06D;
    STA.B $12                                                            ;A9F070;
    LDA.W $0FBE,X                                                        ;A9F072;
    CLC                                                                  ;A9F075;
    ADC.W #$FFE0                                                         ;A9F076;
    STA.B $14                                                            ;A9F079;
    LDY.W #$000F                                                         ;A9F07B;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F07E;
    TXA                                                                  ;A9F081;
    CLC                                                                  ;A9F082;
    ADC.W #$0040                                                         ;A9F083;
    TAY                                                                  ;A9F086;
    JSL.L CheckForEnemyCollisionWithEnemy                                ;A9F087;
    BCS .return                                                          ;A9F08B;
    LDA.W #Function_BabyMetroid_LatchOntoSidehopper                      ;A9F08D;
    STA.W $0FA8,X                                                        ;A9F090;

.return:
    RTS                                                                  ;A9F093;


Function_BabyMetroid_LatchOntoSidehopper:
    LDA.W $0FBA,X                                                        ;A9F094;
    STA.B $12                                                            ;A9F097;
    LDA.W $0FBE,X                                                        ;A9F099;
    CLC                                                                  ;A9F09C;
    ADC.W #$FFE0                                                         ;A9F09D;
    STA.B $14                                                            ;A9F0A0;
    LDA.W #$0200                                                         ;A9F0A2;
    JSR.W AccelerateBabyMetroidTowardsPoint                              ;A9F0A5;
    BCS .reachedTarget                                                   ;A9F0A8;
    RTS                                                                  ;A9F0AA;


.reachedTarget:
    STZ.W $0FAA,X                                                        ;A9F0AB;
    STZ.W $0FAC,X                                                        ;A9F0AE;
    LDA.W $0FBA,X                                                        ;A9F0B1;
    STA.W $0F7A,X                                                        ;A9F0B4;
    LDA.W $0FBE,X                                                        ;A9F0B7;
    CLC                                                                  ;A9F0BA;
    ADC.W #$FFE0                                                         ;A9F0BB;
    STA.W $0F7E,X                                                        ;A9F0BE;
    LDA.W #InstList_BabyMetroid_LatchedOn                                ;A9F0C1;
    STA.W $0F92,X                                                        ;A9F0C4;
    LDA.W #$0001                                                         ;A9F0C7;
    STA.W $0F94,X                                                        ;A9F0CA;
    STZ.W $0F90,X                                                        ;A9F0CD;
    LDA.W #Function_BabyMetroid_DrainingSidehopper                       ;A9F0D0;
    STA.W $0FA8,X                                                        ;A9F0D3;
    LDA.W #$0001                                                         ;A9F0D6;
    STA.W $0FB0,X                                                        ;A9F0D9;
    STZ.W $0FB6,X                                                        ;A9F0DC;
    LDA.W #$0140                                                         ;A9F0DF;
    STA.W $0FB2,X                                                        ;A9F0E2;
    RTS                                                                  ;A9F0E5;


Function_BabyMetroid_DrainingSidehopper:
    LDA.W $0FA4,X                                                        ;A9F0E6;
    AND.W #$0006                                                         ;A9F0E9;
    TAY                                                                  ;A9F0EC;
    LDA.W ShakingOffsets_X,Y                                             ;A9F0ED;
    ADC.W $0FBA,X                                                        ;A9F0F0;
    STA.W $0F7A,X                                                        ;A9F0F3;
    LDA.W ShakingOffsets_Y,Y                                             ;A9F0F6;
    CLC                                                                  ;A9F0F9;
    ADC.W $0FBE,X                                                        ;A9F0FA;
    CLC                                                                  ;A9F0FD;
    ADC.W #$FFE0                                                         ;A9F0FE;
    STA.W $0F7E,X                                                        ;A9F101;
    DEC.W $0FB2,X                                                        ;A9F104;
    BNE .return                                                          ;A9F107;
    LDA.W #Function_BabyMetroid_MakeSidehopperRottable                   ;A9F109;
    STA.W $0FA8,X                                                        ;A9F10C;
    LDA.W #InstList_BabyMetroid_FinishDraining                           ;A9F10F;
    STA.W $0F92,X                                                        ;A9F112;
    LDA.W #$0001                                                         ;A9F115;
    STA.W $0F94,X                                                        ;A9F118;
    STZ.W $0F90,X                                                        ;A9F11B;
    LDA.W #$000A                                                         ;A9F11E;
    STA.W $0FB0,X                                                        ;A9F121;

.return:
    RTS                                                                  ;A9F124;


Function_BabyMetroid_MakeSidehopperRottable:
    LDA.W #$0001                                                         ;A9F125;
    STA.L $7E7850                                                        ;A9F128;
    LDA.W #Function_BabyMetroid_MoveUp_UnlockCamera                      ;A9F12C;
    STA.W $0FA8,X                                                        ;A9F12F;
    LDA.W #$00C0                                                         ;A9F132;
    STA.W $0FB2,X                                                        ;A9F135; fallthrough to Function_BabyMetroid_MoveUp_UnlockCamera

Function_BabyMetroid_MoveUp_UnlockCamera:
    LDA.W $0F7A,X                                                        ;A9F138;
    STA.B $12                                                            ;A9F13B;
    LDA.W #$0068                                                         ;A9F13D;
    STA.B $14                                                            ;A9F140;
    LDY.W #$0000                                                         ;A9F142;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F145;
    DEC.W $0FB2,X                                                        ;A9F148;
    BPL .return                                                          ;A9F14B;
    LDA.W #Function_BabyMetroid_StareDownSamus                           ;A9F14D;
    STA.W $0FA8,X                                                        ;A9F150;
    LDA.W #$0001                                                         ;A9F153;
    STA.W $0FB6,X                                                        ;A9F156;
    LDA.L $7ECD20                                                        ;A9F159;
    ORA.W #$0100                                                         ;A9F15D;
    STA.L $7ECD20                                                        ;A9F160;
    LDA.L $7ECD22                                                        ;A9F164;
    ORA.W #$0100                                                         ;A9F168;
    STA.L $7ECD22                                                        ;A9F16B;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9F16F;
    db $30,$03                                                           ;A9F173;
    dw PLMEntries_clearBabyMetroidInvisibleWall                          ;A9F175;
    JSL.L Spawn_Hardcoded_PLM                                            ;A9F177;
    db $1F,$03                                                           ;A9F17B;
    dw PLMEntries_clearBabyMetroidInvisibleWall                          ;A9F17D;

.return:
    RTS                                                                  ;A9F17F;


Function_BabyMetroid_StareDownSamus:
    LDA.W $0F7A,X                                                        ;A9F180;
    SEC                                                                  ;A9F183;
    SBC.W $0AF6                                                          ;A9F184;
    BPL +                                                                ;A9F187;
    EOR.W #$FFFF                                                         ;A9F189;
    INC A                                                                ;A9F18C;

  + CMP.W #$0008                                                         ;A9F18D;
    BCS .notClose                                                        ;A9F190;
    LDA.L $7E7804,X                                                      ;A9F192;
    ADC.W #$0002                                                         ;A9F196;
    BRA +                                                                ;A9F199;


.notClose:
    LDA.L $7E7804,X                                                      ;A9F19B;
    BEQ +                                                                ;A9F19F;
    SEC                                                                  ;A9F1A1;
    SBC.W #$0001                                                         ;A9F1A2;
    BPL +                                                                ;A9F1A5;
    LDA.W #$0000                                                         ;A9F1A7;

  + STA.L $7E7804,X                                                      ;A9F1AA;
    CMP.W #$0100                                                         ;A9F1AE;
    BCS .done                                                            ;A9F1B1;
    LDA.W $0AF6                                                          ;A9F1B3;
    CMP.W #$0200                                                         ;A9F1B6;
    BMI .done                                                            ;A9F1B9;
    LDA.L $7E7802,X                                                      ;A9F1BB;
    BEQ .zeroAggroTimer                                                  ;A9F1BF;
    DEC A                                                                ;A9F1C1;
    STA.L $7E7802,X                                                      ;A9F1C2;
    LDY.W $0AFA                                                          ;A9F1C6;
    BRA .notRareChance                                                   ;A9F1C9;


.zeroAggroTimer:
    LDY.W #$0050                                                         ;A9F1CB;
    LDA.W $05E5                                                          ;A9F1CE;
    AND.W #$0FFF                                                         ;A9F1D1;
    CMP.W #$0FE0                                                         ;A9F1D4;
    BCC .notRareChance                                                   ;A9F1D7;
    LDA.W #$0020                                                         ;A9F1D9;
    STA.L $7E7802,X                                                      ;A9F1DC;

.notRareChance:
    STY.B $14                                                            ;A9F1E0;
    LDA.W $0AF6                                                          ;A9F1E2;
    STA.B $12                                                            ;A9F1E5;
    LDX.W $0E54                                                          ;A9F1E7;
    LDY.W #$000A                                                         ;A9F1EA;
    JMP.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F1ED;


.done:
    LDX.W $0E54                                                          ;A9F1F0;
    LDA.W #Function_BabyMetroid_LatchOntoSamus                           ;A9F1F3;
    STA.W $0FA8,X                                                        ;A9F1F6;
    RTS                                                                  ;A9F1F9;


Function_BabyMetroid_LatchOntoSamus:
    LDA.W $0AF6                                                          ;A9F1FA;
    STA.B $12                                                            ;A9F1FD;
    LDA.W $0AFA                                                          ;A9F1FF;
    SEC                                                                  ;A9F202;
    SBC.W #$0020                                                         ;A9F203;
    STA.B $14                                                            ;A9F206;
    LDY.W #$000F                                                         ;A9F208;
    JMP.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F20B;


Function_BabyMetroid_StartDrainingSamus:
    LDA.W #$0012                                                         ;A9F20E;
    JSL.L Run_Samus_Command                                              ;A9F211;
    LDA.W #Function_BabyMetroid_DrainingSamus                            ;A9F215;
    STA.W $0FA8                                                          ;A9F218; fallthrough to Function_BabyMetroid_DrainingSamus

Function_BabyMetroid_DrainingSamus:
    LDA.W $09C2                                                          ;A9F21B;
    CMP.W #$0002                                                         ;A9F21E;
    BCC .done                                                            ;A9F221;
    LDA.W #$0008                                                         ;A9F223;
    STA.W $0CCC                                                          ;A9F226;
    LDA.W #$0005                                                         ;A9F229;
    STA.W $0CD2                                                          ;A9F22C;
    LDA.W #$0002                                                         ;A9F22F;
    STA.W $0A66                                                          ;A9F232;
    LDA.W $0B2E                                                          ;A9F235;
    CMP.W #$0004                                                         ;A9F238;
    BMI .lessThan4                                                       ;A9F23B;
    LDA.W #$0002                                                         ;A9F23D;
    STA.W $0B2E                                                          ;A9F240;

.lessThan4:
    LDA.W $0FA4,X                                                        ;A9F243;
    AND.W #$0006                                                         ;A9F246;
    TAY                                                                  ;A9F249;
    LDA.W ShakingOffsets_X,Y                                             ;A9F24A;
    ADC.W $0AF6                                                          ;A9F24D;
    STA.W $0F7A,X                                                        ;A9F250;
    LDA.W ShakingOffsets_Y,Y                                             ;A9F253;
    CLC                                                                  ;A9F256;
    ADC.W #$FFEC                                                         ;A9F257;
    CLC                                                                  ;A9F25A;
    ADC.W $0AFA                                                          ;A9F25B;
    STA.W $0F7E,X                                                        ;A9F25E;
    JSL.L DamageSamusDueToBabyMetroid                                    ;A9F261;
    RTS                                                                  ;A9F265;


.done:
    STZ.W $0A66                                                          ;A9F266;
    STZ.W $0CD2                                                          ;A9F269;
    LDA.W #Function_BabyMetroid_StartHeelRealization                     ;A9F26C;
    STA.W $0FA8,X                                                        ;A9F26F;
    STZ.W $0FAA,X                                                        ;A9F272;
    STZ.W $0FAC,X                                                        ;A9F275;
    LDA.W #InstList_BabyMetroid_FinishDraining                           ;A9F278;
    JSL.L SetEnemyInstList                                               ;A9F27B;
    LDA.W #$000A                                                         ;A9F27F;
    STA.W $0FB0,X                                                        ;A9F282;
    LDA.W #$0013                                                         ;A9F285;
    JSL.L Run_Samus_Command                                              ;A9F288;
    LDA.W #$0000                                                         ;A9F28C;
    JSL.L DrainedSamusController                                         ;A9F28F;
    LDA.W #$0000                                                         ;A9F293;
    STA.L $7E7808,X                                                      ;A9F296;
    LDA.W #$0007                                                         ;A9F29A;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A9F29D;
    RTS                                                                  ;A9F2A1;


Function_BabyMetroid_StartHeelRealization:
    LDA.W #Function_BabyMetroid_HeelRealization                          ;A9F2A2;
    STA.W $0FA8,X                                                        ;A9F2A5;
    LDA.W #$0078                                                         ;A9F2A8;
    STA.W $0FB2,X                                                        ;A9F2AB; fallthrough to Function_BabyMetroid_HeelRealization

Function_BabyMetroid_HeelRealization:
    DEC.W $0FB2,X                                                        ;A9F2AE;
    BMI .timerExpired                                                    ;A9F2B1;
    RTS                                                                  ;A9F2B3;


.timerExpired:
    LDA.W #Function_BabyMetroid_BackOffGuiltily                          ;A9F2B4;
    STA.W $0FA8,X                                                        ;A9F2B7;
    LDA.W #$00C0                                                         ;A9F2BA;
    STA.W $0FB2,X                                                        ;A9F2BD; fallthrough to Function_BabyMetroid_BackOffGuiltily

Function_BabyMetroid_BackOffGuiltily:
    LDA.W $0AF6                                                          ;A9F2C0;
    STA.B $12                                                            ;A9F2C3;
    LDA.W #$0068                                                         ;A9F2C5;
    STA.B $14                                                            ;A9F2C8;
    LDX.W $0E54                                                          ;A9F2CA;
    LDY.W #$0000                                                         ;A9F2CD;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F2D0;
    DEC.W $0FB2,X                                                        ;A9F2D3;
    BMI .timerExpired                                                    ;A9F2D6;
    RTS                                                                  ;A9F2D8;


.timerExpired:
    LDA.W #$007D                                                         ;A9F2D9;
    JSL.L QueueSound_Lib2_Max6                                           ;A9F2DC;
    LDA.W #Function_BabyMetroid_GoLeftGuiltily                           ;A9F2E0;
    STA.W $0FA8,X                                                        ;A9F2E3;
    LDA.W #$0058                                                         ;A9F2E6;
    STA.W $0FB2,X                                                        ;A9F2E9;
    LDA.W #InstList_BabyMetroid_LatchedOn                                ;A9F2EC;
    STA.W $0F92,X                                                        ;A9F2EF;
    LDA.W #$0001                                                         ;A9F2F2;
    STA.W $0F94,X                                                        ;A9F2F5;
    STZ.W $0F90,X                                                        ;A9F2F8; fallthrough to Function_BabyMetroid_GoLeftGuiltily

Function_BabyMetroid_GoLeftGuiltily:
    LDA.W $0AF6                                                          ;A9F2FB;
    CLC                                                                  ;A9F2FE;
    ADC.W #$FFC0                                                         ;A9F2FF;
    STA.B $12                                                            ;A9F302;
    LDA.W #$0064                                                         ;A9F304;
    STA.B $14                                                            ;A9F307;
    LDX.W $0E54                                                          ;A9F309;
    LDY.W #$0000                                                         ;A9F30C;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F30F;
    DEC.W $0FB2,X                                                        ;A9F312;
    BMI .timerExpired                                                    ;A9F315;
    RTS                                                                  ;A9F317;


.timerExpired:
    LDA.W #Function_BabyMetroid_GoRightGuiltily                          ;A9F318;
    STA.W $0FA8,X                                                        ;A9F31B;
    LDA.W #$0058                                                         ;A9F31E;
    STA.W $0FB2,X                                                        ;A9F321; fallthrough to Function_BabyMetroid_GoRightGuiltily

Function_BabyMetroid_GoRightGuiltily:
    LDA.W $0AF6                                                          ;A9F324;
    CLC                                                                  ;A9F327;
    ADC.W #$0060                                                         ;A9F328;
    STA.B $12                                                            ;A9F32B;
    LDA.W #$0068                                                         ;A9F32D;
    STA.B $14                                                            ;A9F330;
    LDX.W $0E54                                                          ;A9F332;
    LDY.W #$0000                                                         ;A9F335;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F338;
    DEC.W $0FB2,X                                                        ;A9F33B;
    BMI .timerExpired                                                    ;A9F33E;
    RTS                                                                  ;A9F340;


.timerExpired:
    LDX.W $0E54                                                          ;A9F341;
    LDA.W #Function_BabyMetroid_SamusRecovering                          ;A9F344;
    STA.W $0FA8,X                                                        ;A9F347;
    LDA.W #$0100                                                         ;A9F34A;
    STA.W $0FB2,X                                                        ;A9F34D;
    LDA.W #InstList_BabyMetroid_Remorse                                  ;A9F350;
    STA.W $0F92,X                                                        ;A9F353;
    LDA.W #$0001                                                         ;A9F356;
    STA.W $0F94,X                                                        ;A9F359;
    STZ.W $0F90,X                                                        ;A9F35C;
    RTS                                                                  ;A9F35F;


Function_BabyMetroid_FleeRemorsefully:
    LDA.W #$0052                                                         ;A9F360;
    JSL.L QueueSound_Lib2_Max6                                           ;A9F363;
    LDA.W #Function_BabyMetroid_Fleeing                                  ;A9F367;
    STA.W $0FA8,X                                                        ;A9F36A; fallthrough to Function_BabyMetroid_Fleeing

Function_BabyMetroid_Fleeing:
    LDA.W #$FF80                                                         ;A9F36D;
    STA.B $12                                                            ;A9F370;
    LDA.W #$0040                                                         ;A9F372;
    STA.B $14                                                            ;A9F375;
    LDX.W $0E54                                                          ;A9F377;
    LDY.W #$0000                                                         ;A9F37A;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F37D;
    LDA.W #$0008                                                         ;A9F380;
    STA.B $16                                                            ;A9F383;
    STA.B $18                                                            ;A9F385;
    JSL.L CheckForEnemyCollisionWithRectangle                            ;A9F387;
    BCS .return                                                          ;A9F38B;
    STZ.W $0FAA,X                                                        ;A9F38D;
    STZ.W $0FAC,X                                                        ;A9F390;
    LDA.W $0F86,X                                                        ;A9F393;
    AND.W #$DEFF                                                         ;A9F396;
    STA.W $0F86,X                                                        ;A9F399;
    LDA.W #Function_BabyMetroid_Disappeared                              ;A9F39C;
    STA.W $0FA8,X                                                        ;A9F39F;

.return:
    RTS                                                                  ;A9F3A2;


Function_BabyMetroid_SamusRecovering:
    DEC.W $0FB2,X                                                        ;A9F3A3;
    BMI .timerExpired                                                    ;A9F3A6;
    JMP.W GraduallyAccelerateTowardSamus                                 ;A9F3A8;


.timerExpired:
    LDA.W #$0002                                                         ;A9F3AB;
    JSL.L DrainedSamusController                                         ;A9F3AE;
    LDA.W #$0001                                                         ;A9F3B2;
    STA.W $0FB6,X                                                        ;A9F3B5;
    LDA.W #Function_BabyMetroid_Remorse                                  ;A9F3B8;
    STA.W $0FA8,X                                                        ;A9F3BB; fallthrough to Function_BabyMetroid_Remorse

Function_BabyMetroid_Remorse:
    JSR.W GraduallyAccelerateTowardSamus                                 ;A9F3BE;
    BCS MakeBabyMetroidFlee                                              ;A9F3C1;
    RTS                                                                  ;A9F3C3;


MakeBabyMetroidFlee:
    LDA.W #Function_BabyMetroid_FleeRemorsefully                         ;A9F3C4;
    STA.W $0FA8,X                                                        ;A9F3C7;
    RTS                                                                  ;A9F3CA;


SignalBabyMetroidToLeave:
    LDA.W $0FA8,X                                                        ;A9F3CB;
    CMP.W #Function_BabyMetroid_Remorse                                  ;A9F3CE;
    BEQ MakeBabyMetroidFlee                                              ;A9F3D1;
    RTS                                                                  ;A9F3D3;


GraduallyAccelerateTowardSamus:
    LDA.W $0F7A,X                                                        ;A9F3D4;
    SEC                                                                  ;A9F3D7;
    SBC.W $0AF6                                                          ;A9F3D8;
    BPL +                                                                ;A9F3DB;
    EOR.W #$FFFF                                                         ;A9F3DD;
    INC A                                                                ;A9F3E0;

  + CMP.W #$0002                                                         ;A9F3E1;
    BCS .notClose                                                        ;A9F3E4;
    LDA.L $7E7804,X                                                      ;A9F3E6;
    ADC.W #$0002                                                         ;A9F3EA;
    BRA +                                                                ;A9F3ED;


.notClose:
    LDA.L $7E7804,X                                                      ;A9F3EF;
    BEQ +                                                                ;A9F3F3;
    SEC                                                                  ;A9F3F5;
    SBC.W #$0001                                                         ;A9F3F6;
    BPL +                                                                ;A9F3F9;
    LDA.W #$0000                                                         ;A9F3FB;

  + STA.L $7E7804,X                                                      ;A9F3FE;
    LDA.L $7E7802,X                                                      ;A9F402;
    BEQ .zeroAggroTimer                                                  ;A9F406;
    DEC A                                                                ;A9F408;
    STA.L $7E7802,X                                                      ;A9F409;
    LDA.W $0AFA                                                          ;A9F40D;
    CLC                                                                  ;A9F410;
    ADC.W #$FFEE                                                         ;A9F411;
    TAY                                                                  ;A9F414;
    BRA +                                                                ;A9F415;


.zeroAggroTimer:
    LDY.W #$0050                                                         ;A9F417;
    LDA.W $05E5                                                          ;A9F41A;
    AND.W #$0FFF                                                         ;A9F41D;
    CMP.W #$0FE0                                                         ;A9F420;
    BCC +                                                                ;A9F423;
    LDA.W #$0020                                                         ;A9F425;
    STA.L $7E7802,X                                                      ;A9F428;

  + STY.B $14                                                            ;A9F42C;
    LDA.W $0AF6                                                          ;A9F42E;
    STA.B $12                                                            ;A9F431;
    LDX.W $0E54                                                          ;A9F433;
    LDY.W #$0008                                                         ;A9F436;
    JSR.W GradduallyAccelerateTowardsPoint_1A_400                        ;A9F439;
    LDA.L $7E7804,X                                                      ;A9F43C;
    CMP.W #$0400                                                         ;A9F440;
    BCS .returnReadyToFlee                                               ;A9F443;
    LDA.W $0AF6                                                          ;A9F445;
    CMP.W #$0080                                                         ;A9F448;
    BMI .returnReadyToFlee                                               ;A9F44B;
    CLC                                                                  ;A9F44D;
    RTS                                                                  ;A9F44E;


.returnReadyToFlee:
    SEC                                                                  ;A9F44F;
    RTS                                                                  ;A9F450;


GradduallyAccelerateTowardsPoint_1A_400:
    LDA.W #$0400                                                         ;A9F451;
    STA.B $1A                                                            ;A9F454;
    BRA GradduallyAccelerateTowardsPoint                                 ;A9F456;


GradduallyAccelerateTowardsPoint_1A_4:
    LDA.W #$0004                                                         ;A9F458;
    STA.B $1A                                                            ;A9F45B;
    BRA GradduallyAccelerateTowardsPoint                                 ;A9F45D;


GradduallyAccelerateTowardsPoint_1A_8:
    LDA.W #$0008                                                         ;A9F45F;
    STA.B $1A                                                            ;A9F462;
    BRA GradduallyAccelerateTowardsPoint                                 ;A9F464;


GradduallyAccelerateTowardsPoint_1A_10:
    LDA.W #$0010                                                         ;A9F466;
    STA.B $1A                                                            ;A9F469; fallthrough to GradduallyAccelerateTowardsPoint

GradduallyAccelerateTowardsPoint:
    LDA.W GradualAccelerationDivisorTable,Y                              ;A9F46B;
    AND.W #$00FF                                                         ;A9F46E;
    STA.B $18                                                            ;A9F471;
    JSR.W GraduallyAccelerateHorizontally                                ;A9F473;
    LDA.W $0F7E,X                                                        ;A9F476;
    SEC                                                                  ;A9F479;
    SBC.B $14                                                            ;A9F47A;
    BEQ .return                                                          ;A9F47C;
    BPL .up                                                              ;A9F47E;
    EOR.W #$FFFF                                                         ;A9F480;
    INC A                                                                ;A9F483;
    STA.W $4204                                                          ;A9F484;
    SEP #$20                                                             ;A9F487;
    LDA.B $18                                                            ;A9F489;
    STA.W $4206                                                          ;A9F48B;
    REP #$20                                                             ;A9F48E;
    XBA                                                                  ;A9F490;
    XBA                                                                  ;A9F491;
    NOP                                                                  ;A9F492;
    NOP                                                                  ;A9F493;
    LDA.W $4214                                                          ;A9F494;
    BNE +                                                                ;A9F497;
    INC A                                                                ;A9F499;

  + STA.B $16                                                            ;A9F49A;
    LDA.W $0FAC,X                                                        ;A9F49C;
    BPL .movingDown                                                      ;A9F49F;
    CLC                                                                  ;A9F4A1;
    ADC.W #$0008                                                         ;A9F4A2;
    ADC.B $16                                                            ;A9F4A5;

.movingDown:
    ADC.B $16                                                            ;A9F4A7;
    CMP.W #$0500                                                         ;A9F4A9;
    BMI .storeDownwardVelocity                                           ;A9F4AC;
    LDA.W #$0500                                                         ;A9F4AE;

.storeDownwardVelocity:
    STA.W $0FAC,X                                                        ;A9F4B1;

.return:
    RTS                                                                  ;A9F4B4;


.up:
    STA.W $4204                                                          ;A9F4B5;
    SEP #$20                                                             ;A9F4B8;
    LDA.B $18                                                            ;A9F4BA;
    STA.W $4206                                                          ;A9F4BC;
    REP #$20                                                             ;A9F4BF;
    XBA                                                                  ;A9F4C1;
    XBA                                                                  ;A9F4C2;
    NOP                                                                  ;A9F4C3;
    NOP                                                                  ;A9F4C4;
    LDA.W $4214                                                          ;A9F4C5;
    BNE +                                                                ;A9F4C8;
    INC A                                                                ;A9F4CA;

  + STA.B $16                                                            ;A9F4CB;
    LDA.W $0FAC,X                                                        ;A9F4CD;
    BMI .movingUp                                                        ;A9F4D0;
    SEC                                                                  ;A9F4D2;
    SBC.W #$0008                                                         ;A9F4D3;
    SBC.B $16                                                            ;A9F4D6;

.movingUp:
    SBC.B $16                                                            ;A9F4D8;
    CMP.W #$FB00                                                         ;A9F4DA;
    BPL .storeUpwardVelocity                                             ;A9F4DD;
    LDA.W #$FB00                                                         ;A9F4DF;

.storeUpwardVelocity:
    STA.W $0FAC,X                                                        ;A9F4E2;
    RTS                                                                  ;A9F4E5;


GraduallyAccelerateHorizontally:
    LDA.W $0F7A,X                                                        ;A9F4E6;
    SEC                                                                  ;A9F4E9;
    SBC.B $12                                                            ;A9F4EA;
    BEQ .return                                                          ;A9F4EC;
    BPL .left                                                            ;A9F4EE;
    EOR.W #$FFFF                                                         ;A9F4F0;
    INC A                                                                ;A9F4F3;
    STA.W $4204                                                          ;A9F4F4;
    SEP #$20                                                             ;A9F4F7;
    LDA.B $18                                                            ;A9F4F9;
    STA.W $4206                                                          ;A9F4FB;
    REP #$20                                                             ;A9F4FE;
    XBA                                                                  ;A9F500;
    XBA                                                                  ;A9F501;
    NOP                                                                  ;A9F502;
    NOP                                                                  ;A9F503;
    LDA.W $4214                                                          ;A9F504;
    BNE +                                                                ;A9F507;
    INC A                                                                ;A9F509;

  + STA.B $16                                                            ;A9F50A;
    LDA.W $0FAA,X                                                        ;A9F50C;
    BPL .movingRight                                                     ;A9F50F;
    PHA                                                                  ;A9F511;
    JSL.L CheckIfEnemyIsVagulyOnScreen                                   ;A9F512;
    PLA                                                                  ;A9F516;
    BCC .onScreenRight                                                   ;A9F517;
    ADC.B $1A                                                            ;A9F519;

.onScreenRight:
    CLC                                                                  ;A9F51B;
    ADC.W #$0008                                                         ;A9F51C;
    ADC.B $16                                                            ;A9F51F;

.movingRight:
    ADC.B $16                                                            ;A9F521;
    CMP.W #$0800                                                         ;A9F523;
    BMI .storeRightwardVelocity                                          ;A9F526;
    LDA.W #$0800                                                         ;A9F528;

.storeRightwardVelocity:
    STA.W $0FAA,X                                                        ;A9F52B;

.return:
    RTS                                                                  ;A9F52E;


.left:
    STA.W $4204                                                          ;A9F52F;
    SEP #$20                                                             ;A9F532;
    LDA.B $18                                                            ;A9F534;
    STA.W $4206                                                          ;A9F536;
    REP #$20                                                             ;A9F539;
    XBA                                                                  ;A9F53B;
    XBA                                                                  ;A9F53C;
    NOP                                                                  ;A9F53D;
    NOP                                                                  ;A9F53E;
    LDA.W $4214                                                          ;A9F53F;
    BNE +                                                                ;A9F542;
    INC A                                                                ;A9F544;

  + STA.B $16                                                            ;A9F545;
    LDA.W $0FAA,X                                                        ;A9F547;
    BMI .movingLeft                                                      ;A9F54A;
    PHA                                                                  ;A9F54C;
    JSL.L CheckIfEnemyIsVagulyOnScreen                                   ;A9F54D;
    PLA                                                                  ;A9F551;
    BCC ..onScreen                                                       ;A9F552;
    SBC.B $1A                                                            ;A9F554;

..onScreen:
    SEC                                                                  ;A9F556;
    SBC.W #$0008                                                         ;A9F557;
    SBC.B $16                                                            ;A9F55A;

.movingLeft:
    SBC.B $16                                                            ;A9F55C;
    CMP.W #$F800                                                         ;A9F55E;
    BPL .storeLeftwardVelocity                                           ;A9F561;
    LDA.W #$F800                                                         ;A9F563;

.storeLeftwardVelocity:
    STA.W $0FAA,X                                                        ;A9F566;
    RTS                                                                  ;A9F569;


GradualAccelerationDivisorTable:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ;A9F56A;

CheckIfEnemyIsVagulyOnScreen:
    LDA.W $0F7E,X                                                        ;A9F57A;
    BMI .returnOffScreen                                                 ;A9F57D;
    CLC                                                                  ;A9F57F;
    ADC.W #$0060                                                         ;A9F580;
    SEC                                                                  ;A9F583;
    SBC.W $0915                                                          ;A9F584;
    BMI .returnOffScreen                                                 ;A9F587;
    CMP.W #$01A0                                                         ;A9F589;
    BPL .returnOffScreen                                                 ;A9F58C;
    LDA.W $0F7A,X                                                        ;A9F58E;
    BMI .returnOffScreen                                                 ;A9F591;
    CLC                                                                  ;A9F593;
    ADC.W #$0010                                                         ;A9F594;
    SEC                                                                  ;A9F597;
    SBC.W $0911                                                          ;A9F598;
    BMI .returnOffScreen                                                 ;A9F59B;
    CMP.W #$0120                                                         ;A9F59D;
    BPL .returnOffScreen                                                 ;A9F5A0;
    CLC                                                                  ;A9F5A2;
    RTL                                                                  ;A9F5A3;


.returnOffScreen:
    SEC                                                                  ;A9F5A4;
    RTL                                                                  ;A9F5A5;


AccelerateBabyMetroidTowardsPoint:
    STA.B $16                                                            ;A9F5A6;
    STZ.B $1C                                                            ;A9F5A8;
    JSR.W AccelerateBabyMetroidTowardsXPosition                          ;A9F5AA;
    JSR.W AccelerateBabyMetroidTowardsYPosition                          ;A9F5AD;
    LSR.B $1C                                                            ;A9F5B0;
    LSR.B $1C                                                            ;A9F5B2;
    RTS                                                                  ;A9F5B4;


AccelerateBabyMetroidTowardsYPosition:
    LDA.W $0F7E,X                                                        ;A9F5B5;
    SEC                                                                  ;A9F5B8;
    SBC.B $14                                                            ;A9F5B9;
    BEQ .reachedTarget                                                   ;A9F5BB;
    BPL .up                                                              ;A9F5BD;
    LDA.W $0FAC,X                                                        ;A9F5BF;
    CLC                                                                  ;A9F5C2;
    ADC.B $16                                                            ;A9F5C3;
    CMP.W #$0500                                                         ;A9F5C5;
    BMI +                                                                ;A9F5C8;
    LDA.W #$0500                                                         ;A9F5CA;

  + STA.W $0FAC,X                                                        ;A9F5CD;
    AND.W #$FF00                                                         ;A9F5D0;
    XBA                                                                  ;A9F5D3;
    BPL +                                                                ;A9F5D4;
    ORA.W #$FF00                                                         ;A9F5D6;

  + CLC                                                                  ;A9F5D9;
    ADC.W $0F7E,X                                                        ;A9F5DA;
    CMP.B $14                                                            ;A9F5DD;
    BMI .returnUpper                                                     ;A9F5DF;
    STZ.W $0FAC,X                                                        ;A9F5E1;
    LDA.B $14                                                            ;A9F5E4;

.reachedTarget:
    INC.B $1C                                                            ;A9F5E6;

.returnUpper:
    RTS                                                                  ;A9F5E8;


.up:
    LDA.W $0FAC,X                                                        ;A9F5E9;
    SEC                                                                  ;A9F5EC;
    SBC.B $16                                                            ;A9F5ED;
    CMP.W #$FB00                                                         ;A9F5EF;
    BPL +                                                                ;A9F5F2;
    LDA.W #$FB00                                                         ;A9F5F4;

  + STA.W $0FAC,X                                                        ;A9F5F7;
    AND.W #$FF00                                                         ;A9F5FA;
    XBA                                                                  ;A9F5FD;
    BPL +                                                                ;A9F5FE;
    ORA.W #$FF00                                                         ;A9F600;

  + CLC                                                                  ;A9F603;
    ADC.W $0F7E,X                                                        ;A9F604;
    CMP.B $14                                                            ;A9F607;
    BEQ .resetVelocity                                                   ;A9F609;
    BPL .returnLower                                                     ;A9F60B;

.resetVelocity:
    STZ.W $0FAC,X                                                        ;A9F60D;
    LDA.B $14                                                            ;A9F610;
    INC.B $1C                                                            ;A9F612;

.returnLower:
    RTS                                                                  ;A9F614;


AccelerateBabyMetroidTowardsXPosition:
    LDA.W $0F7A,X                                                        ;A9F615;
    SEC                                                                  ;A9F618;
    SBC.B $12                                                            ;A9F619;
    BPL .left                                                            ;A9F61B;
    EOR.W #$FFFF                                                         ;A9F61D;
    INC A                                                                ;A9F620;
    LDA.W $0FAA,X                                                        ;A9F621;
    CLC                                                                  ;A9F624;
    ADC.B $16                                                            ;A9F625;
    CMP.W #$0500                                                         ;A9F627;
    BMI +                                                                ;A9F62A;
    LDA.W #$0500                                                         ;A9F62C;

  + STA.W $0FAA,X                                                        ;A9F62F;
    AND.W #$FF00                                                         ;A9F632;
    XBA                                                                  ;A9F635;
    BPL +                                                                ;A9F636;
    ORA.W #$FF00                                                         ;A9F638;

  + CLC                                                                  ;A9F63B;
    ADC.W $0F7A,X                                                        ;A9F63C;
    CMP.B $12                                                            ;A9F63F;
    BMI .returnUpper                                                     ;A9F641;
    STZ.W $0FAA,X                                                        ;A9F643;
    LDA.B $12                                                            ;A9F646;
    INC.B $1C                                                            ;A9F648;

.returnUpper:
    RTS                                                                  ;A9F64A;


.left:
    LDA.W $0FAA,X                                                        ;A9F64B;
    SEC                                                                  ;A9F64E;
    SBC.B $16                                                            ;A9F64F;
    CMP.W #$FB00                                                         ;A9F651;
    BPL +                                                                ;A9F654;
    LDA.W #$FB00                                                         ;A9F656;

  + STA.W $0FAA,X                                                        ;A9F659;
    AND.W #$FF00                                                         ;A9F65C;
    XBA                                                                  ;A9F65F;
    BPL +                                                                ;A9F660;
    ORA.W #$FF00                                                         ;A9F662;

  + CLC                                                                  ;A9F665;
    ADC.W $0F7A,X                                                        ;A9F666;
    CMP.B $12                                                            ;A9F669;
    BEQ .resetVelocity                                                   ;A9F66B;
    BPL .returnLower                                                     ;A9F66D;

.resetVelocity:
    STZ.W $0FAA,X                                                        ;A9F66F;
    LDA.B $12                                                            ;A9F672;
    INC.B $1C                                                            ;A9F674;

.returnLower:
    RTS                                                                  ;A9F676;


HandleNormalBabyMetroidPalette:
    LDA.W #$014A                                                         ;A9F677;
    STA.B $12                                                            ;A9F67A;
    LDA.W #BabyMetroidColors_Normal                                      ;A9F67C;
    STA.B $16                                                            ;A9F67F;
    BRA HandleBabyMetroidPalette                                         ;A9F681;


HandleBabyMetroidCutscenePalette_Normal:
    LDA.W #$01EA                                                         ;A9F683;
    STA.B $12                                                            ;A9F686;
    LDA.W #BabyMetroidColors_Normal                                      ;A9F688;
    STA.B $16                                                            ;A9F68B;
    BRA HandleBabyMetroidPalette                                         ;A9F68D;


HandleBabyMetroidCutscenePalette_LowHealth:
    LDA.W #$01EA                                                         ;A9F68F;
    STA.B $12                                                            ;A9F692;
    LDA.W #BabyMetroidColors_LowHealth                                   ;A9F694;
    STA.B $16                                                            ;A9F697; fallthrough to HandleBabyMetroidPalette

HandleBabyMetroidPalette:
    LDX.W $0E54                                                          ;A9F699;
    SEP #$20                                                             ;A9F69C;
    LDA.W $0FAF,X                                                        ;A9F69E;
    BEQ .timerExpired                                                    ;A9F6A1;
    DEC A                                                                ;A9F6A3;
    STA.W $0FAF,X                                                        ;A9F6A4;
    REP #$20                                                             ;A9F6A7;
    RTS                                                                  ;A9F6A9;


.timerExpired:
    LDA.W $0FB0,X                                                        ;A9F6AA;
    STA.W $0FAF,X                                                        ;A9F6AD;
    LDA.W $0FAE,X                                                        ;A9F6B0;
    INC A                                                                ;A9F6B3;
    AND.B #$07                                                           ;A9F6B4;
    STA.W $0FAE,X                                                        ;A9F6B6;
    REP #$20                                                             ;A9F6B9;
    AND.W #$00FF                                                         ;A9F6BB;
    JSR.W HandleBabyMetroidCrySFX                                        ;A9F6BE;
    ASL A                                                                ;A9F6C1;
    ASL A                                                                ;A9F6C2;
    ASL A                                                                ;A9F6C3;
    ADC.B $16                                                            ;A9F6C4;
    TAY                                                                  ;A9F6C6;
    LDX.B $12                                                            ;A9F6C7;
    LDA.W #$0004                                                         ;A9F6C9;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;A9F6CC;
    RTS                                                                  ;A9F6D0;


BabyMetroidColors_Normal:
    dw $72FF,$2CDF,$24B9,$1CAF,$5E5F,$183F,$1014,$080A                   ;A9F6D1;
    dw $49BA,$041A,$000F,$0005,$3515,$0015,$000A,$0005                   ;A9F6E1;
    dw $3515,$0015,$000A,$0005,$49BA,$041A,$000F,$0005                   ;A9F6F1;
    dw $5E5F,$183F,$1014,$080A,$72FF,$2CDF,$24B9,$1CAF                   ;A9F701;

BabyMetroidColors_LowHealth:
    dw $5990,$3870,$346D,$3068,$494D,$306D,$284A,$2446                   ;A9F711;
    dw $3D0B,$244B,$2048,$1844,$2CC8,$1C48,$1425,$0C22                   ;A9F721;
    dw $2CC8,$1C48,$1425,$0C22,$3D0B,$244B,$2048,$1844                   ;A9F731;
    dw $494D,$306D,$284A,$2446,$5990,$3870,$346D,$3068                   ;A9F741;

HandleBabyMetroidCrySFX:
    CMP.W #$0005                                                         ;A9F751;
    BEQ .timerExpired                                                    ;A9F754;
    RTS                                                                  ;A9F756;


.timerExpired:
    PHA                                                                  ;A9F757;
    PHY                                                                  ;A9F758;
    LDA.L $7E7808,X                                                      ;A9F759;
    BEQ .return                                                          ;A9F75D;
    LDA.L $7E780A,X                                                      ;A9F75F;
    INC A                                                                ;A9F763;
    STA.L $7E780A,X                                                      ;A9F764;
    CMP.W #$0004                                                         ;A9F768;
    BCC .return                                                          ;A9F76B;
    LDA.W #$0000                                                         ;A9F76D;
    STA.L $7E780A,X                                                      ;A9F770;
    LDA.W #$0072                                                         ;A9F774;
    LDY.W $0FB0,X                                                        ;A9F777;
    CPY.W #$000A                                                         ;A9F77A;
    BCS .queueSFX                                                        ;A9F77D;
    LDA.W #$0078                                                         ;A9F77F;

.queueSFX:
    JSL.L QueueSound_Lib2_Max6                                           ;A9F782;

.return:
    PLY                                                                  ;A9F786;
    PLA                                                                  ;A9F787;
    RTS                                                                  ;A9F788;


EnemyTouch_BabyMetroid:
    LDX.W $0E54                                                          ;A9F789;
    LDA.W $0FB6,X                                                        ;A9F78C;
    BEQ .return                                                          ;A9F78F;
    JSR.W SignalBabyMetroidToLeave                                       ;A9F791;
    LDA.W $0A1F                                                          ;A9F794;
    AND.W #$00FF                                                         ;A9F797;
    CMP.W #$0003                                                         ;A9F79A;
    BNE .notSpinJumping                                                  ;A9F79D;
    LDA.W $0AF6                                                          ;A9F79F;
    CMP.W #$0200                                                         ;A9F7A2;
    BPL .repelled                                                        ;A9F7A5;

.notSpinJumping:
    LDA.W $0FA8,X                                                        ;A9F7A7;
    CMP.W #Function_BabyMetroid_LatchOntoSamus                           ;A9F7AA;
    BEQ .latchedOntoSamus                                                ;A9F7AD;
    CMP.W #Function_BabyMetroid_StareDownSamus                           ;A9F7AF;
    BNE .return                                                          ;A9F7B2;
    LDA.W #Function_BabyMetroid_LatchOntoSamus                           ;A9F7B4;
    STA.W $0FA8,X                                                        ;A9F7B7;

.return:
    RTL                                                                  ;A9F7BA;


.latchedOntoSamus:
    LDA.W $0AF6                                                          ;A9F7BB;
    STA.B $12                                                            ;A9F7BE;
    LDA.W $0AFA                                                          ;A9F7C0;
    SEC                                                                  ;A9F7C3;
    SBC.W #$0020                                                         ;A9F7C4;
    STA.B $14                                                            ;A9F7C7;
    LDA.W #$0200                                                         ;A9F7C9;
    JSR.W AccelerateBabyMetroidTowardsPoint                              ;A9F7CC;
    BCC .return                                                          ;A9F7CF;
    LDX.W $0E54                                                          ;A9F7D1;
    LDA.W #InstList_BabyMetroid_LatchedOn                                ;A9F7D4;
    STA.W $0F92,X                                                        ;A9F7D7;
    LDA.W #$0001                                                         ;A9F7DA;
    STA.W $0F94,X                                                        ;A9F7DD;
    STZ.W $0F90,X                                                        ;A9F7E0;
    LDA.W #$0001                                                         ;A9F7E3;
    STA.W $0FB0,X                                                        ;A9F7E6;
    STZ.W $0FB6,X                                                        ;A9F7E9;
    STZ.W $0FAA,X                                                        ;A9F7EC;
    STZ.W $0FAC,X                                                        ;A9F7EF;
    LDA.W #Function_BabyMetroid_StartDrainingSamus                       ;A9F7F2;
    STA.W $0FA8,X                                                        ;A9F7F5;
    RTL                                                                  ;A9F7F8;


.repelled:
    LDA.W $0AF6                                                          ;A9F7F9;
    SEC                                                                  ;A9F7FC;
    SBC.W $0F7A,X                                                        ;A9F7FD;
    STA.B $12                                                            ;A9F800;
    LDA.W $0AFA                                                          ;A9F802;
    SEC                                                                  ;A9F805;
    SBC.W $0F7E,X                                                        ;A9F806;
    STA.B $14                                                            ;A9F809;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A9F80B;
    SEC                                                                  ;A9F80F;
    SBC.W #$0080                                                         ;A9F810;
    EOR.W #$FFFF                                                         ;A9F813;
    INC A                                                                ;A9F816;
    CLC                                                                  ;A9F817;
    ADC.W #$0080                                                         ;A9F818;
    AND.W #$00FF                                                         ;A9F81B;
    STA.B $12                                                            ;A9F81E;
    LDA.W #$0040                                                         ;A9F820;
    PHA                                                                  ;A9F823;
    JSL.L Math_86C26C                                                    ;A9F824;
    LDX.W $0E54                                                          ;A9F828;
    CLC                                                                  ;A9F82B;
    ADC.W $0FAA,X                                                        ;A9F82C;
    STA.W $0FAA,X                                                        ;A9F82F;
    PLA                                                                  ;A9F832;
    JSL.L Math_86C272                                                    ;A9F833;
    LDX.W $0E54                                                          ;A9F837;
    CLC                                                                  ;A9F83A;
    ADC.W $0FAC,X                                                        ;A9F83B;
    STA.W $0FAC,X                                                        ;A9F83E;
    RTL                                                                  ;A9F841;


EnemyShot_BabyMetroid:
    LDX.W $0E54                                                          ;A9F842;
    LDA.W $0FB6,X                                                        ;A9F845;
    BEQ .return                                                          ;A9F848;
    JSR.W SignalBabyMetroidToLeave                                       ;A9F84A;
    LDA.W $0B64                                                          ;A9F84D;
    SEC                                                                  ;A9F850;
    SBC.W $0F7A,X                                                        ;A9F851;
    STA.B $12                                                            ;A9F854;
    LDA.W $0B78                                                          ;A9F856;
    SEC                                                                  ;A9F859;
    SBC.W $0F7E,X                                                        ;A9F85A;
    STA.B $14                                                            ;A9F85D;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A9F85F;
    SEC                                                                  ;A9F863;
    SBC.W #$0080                                                         ;A9F864;
    EOR.W #$FFFF                                                         ;A9F867;
    INC A                                                                ;A9F86A;
    CLC                                                                  ;A9F86B;
    ADC.W #$0080                                                         ;A9F86C;
    AND.W #$00FF                                                         ;A9F86F;
    STA.B $12                                                            ;A9F872;
    LDA.W $18A6                                                          ;A9F874;
    ASL A                                                                ;A9F877;
    TAX                                                                  ;A9F878;
    LDA.W $0C2C,X                                                        ;A9F879;
    ASL A                                                                ;A9F87C;
    ASL A                                                                ;A9F87D;
    ASL A                                                                ;A9F87E;
    CMP.W #$00F0                                                         ;A9F87F;
    BCC +                                                                ;A9F882;
    LDA.W #$00F0                                                         ;A9F884;

  + PHA                                                                  ;A9F887;
    JSL.L Math_86C26C                                                    ;A9F888;
    LDX.W $0E54                                                          ;A9F88C;
    CLC                                                                  ;A9F88F;
    ADC.W $0FAA,X                                                        ;A9F890;
    STA.W $0FAA,X                                                        ;A9F893;
    PLA                                                                  ;A9F896;
    JSL.L Math_86C272                                                    ;A9F897;
    LDX.W $0E54                                                          ;A9F89B;
    CLC                                                                  ;A9F89E;
    ADC.W $0FAC,X                                                        ;A9F89F;
    STA.W $0FAC,X                                                        ;A9F8A2;

.return:
    RTL                                                                  ;A9F8A5;


Palette_CorpseCommon:
    dw $3800,$57FF,$42F7,$0929,$00A5,$7FFF,$4231,$0043                   ;A9F8A6;
    dw $4B3F,$42DB,$3678,$2E14,$2190,$192C,$0CC9,$0465                   ;A9F8B6;

Palette_CorpseSidehopper:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A9F8C6;
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A9F8D6;

Palette_BabyMetroid:
    dw $3800,$57B8,$0B11,$1646,$00E3,$72FF,$2CDF,$24B9                   ;A9F8E6;
    dw $1CAF,$18A9,$4F9F,$3ED8,$2E12,$08CD,$7FFF,$0000                   ;A9F8F6;

InstList_BabyMetroid_FinishDraining:
    dw $0080                                                             ;A9F906;
    dw Spritemap_BabyMetroid_2                                           ;A9F908;
    dw $0010                                                             ;A9F90A;
    dw Spritemap_BabyMetroid_1                                           ;A9F90C;

InstList_BabyMetroid_Normal:
    dw $0010                                                             ;A9F90E;
    dw Spritemap_BabyMetroid_0                                           ;A9F910;
    dw $0010                                                             ;A9F912;
    dw Spritemap_BabyMetroid_1                                           ;A9F914;
    dw $0010                                                             ;A9F916;
    dw Spritemap_BabyMetroid_2                                           ;A9F918;
    dw $0010                                                             ;A9F91A;
    dw Spritemap_BabyMetroid_1                                           ;A9F91C;
    dw Instruction_BabyMetroid_GotoNormal                                ;A9F91E;

Instruction_BabyMetroid_GotoNormal:
    LDY.W #InstList_BabyMetroid_Normal                                   ;A9F920;
    RTL                                                                  ;A9F923;


InstList_BabyMetroid_LatchedOn:
    dw $0008                                                             ;A9F924;
    dw Spritemap_BabyMetroid_0                                           ;A9F926;
    dw $0008                                                             ;A9F928;
    dw Spritemap_BabyMetroid_1                                           ;A9F92A;
    dw $0005                                                             ;A9F92C;
    dw Spritemap_BabyMetroid_2                                           ;A9F92E;
    dw $0002                                                             ;A9F930;
    dw Spritemap_BabyMetroid_1                                           ;A9F932;
    dw Instruction_GotoLatchedOn                                         ;A9F934;

Instruction_GotoLatchedOn:
    LDY.W #InstList_BabyMetroid_LatchedOn                                ;A9F936;
    RTL                                                                  ;A9F939;


InstList_BabyMetroid_Remorse:
    dw $000A                                                             ;A9F93A;
    dw Spritemap_BabyMetroid_0                                           ;A9F93C;
    dw $000A                                                             ;A9F93E;
    dw Spritemap_BabyMetroid_1                                           ;A9F940;
    dw $000A                                                             ;A9F942;
    dw Spritemap_BabyMetroid_2                                           ;A9F944;
    dw $000A                                                             ;A9F946;
    dw Spritemap_BabyMetroid_1                                           ;A9F948;
    dw $000A                                                             ;A9F94A;
    dw Spritemap_BabyMetroid_0                                           ;A9F94C;
    dw $000A                                                             ;A9F94E;
    dw Spritemap_BabyMetroid_1                                           ;A9F950;
    dw $000A                                                             ;A9F952;
    dw Spritemap_BabyMetroid_2                                           ;A9F954;
    dw $000A                                                             ;A9F956;
    dw Spritemap_BabyMetroid_1                                           ;A9F958;
    dw Instruction_BabyMetroid_GotoY_OrPlayRemorseSFX                    ;A9F95A;
    dw InstList_BabyMetroid_Remorse                                      ;A9F95C;
    dw $0006                                                             ;A9F95E;
    dw Spritemap_BabyMetroid_0                                           ;A9F960;
    dw $0005                                                             ;A9F962;
    dw Spritemap_BabyMetroid_1                                           ;A9F964;
    dw $0004                                                             ;A9F966;
    dw Spritemap_BabyMetroid_2                                           ;A9F968;
    dw $0003                                                             ;A9F96A;
    dw Spritemap_BabyMetroid_1                                           ;A9F96C;
    dw $0002                                                             ;A9F96E;
    dw Spritemap_BabyMetroid_0                                           ;A9F970;
    dw $0003                                                             ;A9F972;
    dw Spritemap_BabyMetroid_1                                           ;A9F974;
    dw $0004                                                             ;A9F976;
    dw Spritemap_BabyMetroid_2                                           ;A9F978;
    dw $0005                                                             ;A9F97A;
    dw Spritemap_BabyMetroid_1                                           ;A9F97C;
    dw $0006                                                             ;A9F97E;
    dw Spritemap_BabyMetroid_0                                           ;A9F980;
    dw $0007                                                             ;A9F982;
    dw Spritemap_BabyMetroid_1                                           ;A9F984;
    dw $0008                                                             ;A9F986;
    dw Spritemap_BabyMetroid_2                                           ;A9F988;
    dw $0009                                                             ;A9F98A;
    dw Spritemap_BabyMetroid_1                                           ;A9F98C;
    dw Instruction_BabyMetroid_GotoRemorse                               ;A9F98E;

Instruction_BabyMetroid_GotoRemorse:
    LDY.W #InstList_BabyMetroid_Remorse                                  ;A9F990;
    RTL                                                                  ;A9F993;


Instruction_BabyMetroid_GotoY_OrPlayRemorseSFX:
    LDA.W $05E5                                                          ;A9F994;
    BPL .gotoY                                                           ;A9F997;
    LDA.W #$0052                                                         ;A9F999;
    JSL.L QueueSound_Lib2_Max6                                           ;A9F99C;
    INY                                                                  ;A9F9A0;
    INY                                                                  ;A9F9A1;
    RTL                                                                  ;A9F9A2;


.gotoY:
    LDA.W $0000,Y                                                        ;A9F9A3;
    TAY                                                                  ;A9F9A6;
    RTL                                                                  ;A9F9A7;


Spritemap_BabyMetroid_0:
    dw $001E,$0000                                                       ;A9F9A8;
    db $18                                                               ;A9F9AC;
    dw $6120,$01F8                                                       ;A9F9AD;
    db $18                                                               ;A9F9B1;
    dw $2120,$C208                                                       ;A9F9B2;
    db $18                                                               ;A9F9B6;
    dw $6105,$C3E8                                                       ;A9F9B7;
    db $18                                                               ;A9F9BB;
    dw $2105,$C210                                                       ;A9F9BC;
    db $18                                                               ;A9F9C0;
    dw $6104,$C3E0                                                       ;A9F9C1;
    db $18                                                               ;A9F9C5;
    dw $2104,$C200                                                       ;A9F9C6;
    db $08                                                               ;A9F9CA;
    dw $6148,$C3F0                                                       ;A9F9CB;
    db $08                                                               ;A9F9CF;
    dw $2148,$C208                                                       ;A9F9D0;
    db $08                                                               ;A9F9D4;
    dw $6147,$C218                                                       ;A9F9D5;
    db $08                                                               ;A9F9D9;
    dw $6145,$C3E8                                                       ;A9F9DA;
    db $08                                                               ;A9F9DE;
    dw $2147,$C3D8                                                       ;A9F9DF;
    db $08                                                               ;A9F9E3;
    dw $2145,$C218                                                       ;A9F9E4;
    db $F8                                                               ;A9F9E8;
    dw $6125,$C208                                                       ;A9F9E9;
    db $F8                                                               ;A9F9ED;
    dw $6127,$C200                                                       ;A9F9EE;
    db $F8                                                               ;A9F9F2;
    dw $6128,$C3F0                                                       ;A9F9F3;
    db $F8                                                               ;A9F9F7;
    dw $2128,$C3E8                                                       ;A9F9F8;
    db $F8                                                               ;A9F9FC;
    dw $2127,$C3D8                                                       ;A9F9FD;
    db $F8                                                               ;A9FA01;
    dw $2125,$0018                                                       ;A9FA02;
    db $E0                                                               ;A9FA06;
    dw $6131,$C218                                                       ;A9FA07;
    db $E8                                                               ;A9FA0B;
    dw $6140,$C208                                                       ;A9FA0C;
    db $E8                                                               ;A9FA10;
    dw $6142,$C208                                                       ;A9FA11;
    db $D8                                                               ;A9FA15;
    dw $6122,$C200                                                       ;A9FA16;
    db $D8                                                               ;A9FA1A;
    dw $6123,$C200                                                       ;A9FA1B;
    db $E8                                                               ;A9FA1F;
    dw $6143,$C3F0                                                       ;A9FA20;
    db $E8                                                               ;A9FA24;
    dw $2143,$C3F0                                                       ;A9FA25;
    db $D8                                                               ;A9FA29;
    dw $2123,$01E0                                                       ;A9FA2A;
    db $E0                                                               ;A9FA2E;
    dw $2131,$C3D8                                                       ;A9FA2F;
    db $E8                                                               ;A9FA33;
    dw $2140,$C3E8                                                       ;A9FA34;
    db $E8                                                               ;A9FA38;
    dw $2142,$C3E8                                                       ;A9FA39;
    db $D8                                                               ;A9FA3D;
    dw $2122                                                             ;A9FA3E;

Spritemap_BabyMetroid_1:
    dw $001E,$C200                                                       ;A9FA40;
    db $08                                                               ;A9FA44;
    dw $614E,$C3F0                                                       ;A9FA45;
    db $08                                                               ;A9FA49;
    dw $214E,$C218                                                       ;A9FA4A;
    db $08                                                               ;A9FA4E;
    dw $6145,$C210                                                       ;A9FA4F;
    db $08                                                               ;A9FA53;
    dw $612E,$C3E0                                                       ;A9FA54;
    db $08                                                               ;A9FA58;
    dw $212E,$C3D8                                                       ;A9FA59;
    db $08                                                               ;A9FA5D;
    dw $2145,$000D                                                       ;A9FA5E;
    db $28                                                               ;A9FA62;
    dw $6130,$01EB                                                       ;A9FA63;
    db $28                                                               ;A9FA67;
    dw $2130,$C200                                                       ;A9FA68;
    db $18                                                               ;A9FA6C;
    dw $6102,$C210                                                       ;A9FA6D;
    db $18                                                               ;A9FA71;
    dw $6100,$C3F0                                                       ;A9FA72;
    db $18                                                               ;A9FA76;
    dw $2102,$C3E0                                                       ;A9FA77;
    db $18                                                               ;A9FA7B;
    dw $2100,$C200                                                       ;A9FA7C;
    db $F8                                                               ;A9FA80;
    dw $6128,$C3F0                                                       ;A9FA81;
    db $F8                                                               ;A9FA85;
    dw $2128,$C208                                                       ;A9FA86;
    db $F8                                                               ;A9FA8A;
    dw $6127,$C218                                                       ;A9FA8B;
    db $F8                                                               ;A9FA8F;
    dw $6125,$C3E8                                                       ;A9FA90;
    db $F8                                                               ;A9FA94;
    dw $2127,$C3D8                                                       ;A9FA95;
    db $F8                                                               ;A9FA99;
    dw $2125,$C200                                                       ;A9FA9A;
    db $E8                                                               ;A9FA9E;
    dw $6143,$C200                                                       ;A9FA9F;
    db $D8                                                               ;A9FAA3;
    dw $6123,$C3F0                                                       ;A9FAA4;
    db $E8                                                               ;A9FAA8;
    dw $2143,$C3F0                                                       ;A9FAA9;
    db $D8                                                               ;A9FAAD;
    dw $2123,$C218                                                       ;A9FAAE;
    db $E8                                                               ;A9FAB2;
    dw $6140,$C208                                                       ;A9FAB3;
    db $E8                                                               ;A9FAB7;
    dw $6142,$C208                                                       ;A9FAB8;
    db $D8                                                               ;A9FABC;
    dw $6122,$C3E8                                                       ;A9FABD;
    db $E8                                                               ;A9FAC1;
    dw $2142,$C3E8                                                       ;A9FAC2;
    db $D8                                                               ;A9FAC6;
    dw $2122,$C3D8                                                       ;A9FAC7;
    db $E8                                                               ;A9FACB;
    dw $2140,$0018                                                       ;A9FACC;
    db $E0                                                               ;A9FAD0;
    dw $6131,$01E0                                                       ;A9FAD1;
    db $E0                                                               ;A9FAD5;
    dw $2131                                                             ;A9FAD6;

Spritemap_BabyMetroid_2:
    dw $001E,$C208                                                       ;A9FAD8;
    db $F8                                                               ;A9FADC;
    dw $6127,$C3E8                                                       ;A9FADD;
    db $F8                                                               ;A9FAE1;
    dw $2127,$0015                                                       ;A9FAE2;
    db $28                                                               ;A9FAE6;
    dw $6121,$01E3                                                       ;A9FAE7;
    db $28                                                               ;A9FAEB;
    dw $2121,$C200                                                       ;A9FAEC;
    db $18                                                               ;A9FAF0;
    dw $614C,$C210                                                       ;A9FAF1;
    db $18                                                               ;A9FAF5;
    dw $614A,$C200                                                       ;A9FAF6;
    db $08                                                               ;A9FAFA;
    dw $612C,$C210                                                       ;A9FAFB;
    db $08                                                               ;A9FAFF;
    dw $612A,$C3F0                                                       ;A9FB00;
    db $18                                                               ;A9FB04;
    dw $214C,$C3E0                                                       ;A9FB05;
    db $18                                                               ;A9FB09;
    dw $214A,$C3F0                                                       ;A9FB0A;
    db $08                                                               ;A9FB0E;
    dw $212C,$C3E0                                                       ;A9FB0F;
    db $08                                                               ;A9FB13;
    dw $212A,$C218                                                       ;A9FB14;
    db $08                                                               ;A9FB18;
    dw $6145,$C3D8                                                       ;A9FB19;
    db $08                                                               ;A9FB1D;
    dw $2145,$C200                                                       ;A9FB1E;
    db $F8                                                               ;A9FB22;
    dw $6128,$C3F0                                                       ;A9FB23;
    db $F8                                                               ;A9FB27;
    dw $2128,$C218                                                       ;A9FB28;
    db $F8                                                               ;A9FB2C;
    dw $6125,$C3D8                                                       ;A9FB2D;
    db $F8                                                               ;A9FB31;
    dw $2125,$0018                                                       ;A9FB32;
    db $E0                                                               ;A9FB36;
    dw $6131,$01E0                                                       ;A9FB37;
    db $E0                                                               ;A9FB3B;
    dw $2131,$C200                                                       ;A9FB3C;
    db $E8                                                               ;A9FB40;
    dw $6143,$C200                                                       ;A9FB41;
    db $D8                                                               ;A9FB45;
    dw $6123,$C3F0                                                       ;A9FB46;
    db $E8                                                               ;A9FB4A;
    dw $2143,$C3F0                                                       ;A9FB4B;
    db $D8                                                               ;A9FB4F;
    dw $2123,$C208                                                       ;A9FB50;
    db $E8                                                               ;A9FB54;
    dw $6142,$C208                                                       ;A9FB55;
    db $D8                                                               ;A9FB59;
    dw $6122,$C3E8                                                       ;A9FB5A;
    db $E8                                                               ;A9FB5E;
    dw $2142,$C3E8                                                       ;A9FB5F;
    db $D8                                                               ;A9FB63;
    dw $2122,$C218                                                       ;A9FB64;
    db $E8                                                               ;A9FB68;
    dw $6140,$C3D8                                                       ;A9FB69;
    db $E8                                                               ;A9FB6D;
    dw $2140                                                             ;A9FB6E;

Freespace_BankA9_FB70:                                                   ;A9FB70;
; $490 bytes
