
org $A88000


CommonA8_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A88000;
    RTL                                                                  ;A88004;


CommonA8_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A88005;
    RTL                                                                  ;A88009;


CommonA8_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A8800A;
    RTL                                                                  ;A8800E;


CommonA8_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A8800F;
    RTL                                                                  ;A88013;


CommonA8_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A88014;
    RTL                                                                  ;A88018;


UNUSED_CommonA8_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A88019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A88019;
    RTL                                                                  ;A8801D;


CommonA8_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A8801E;
    RTL                                                                  ;A88022;


CommonA8_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A88023;
    RTL                                                                  ;A88027;


CommonA8_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A88028;
    RTL                                                                  ;A8802C;


CommonA8_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A8802D;
    RTL                                                                  ;A88031;


CommonA8_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A88032;
    RTL                                                                  ;A88036;


CommonA8_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A88037;
    RTL                                                                  ;A8803B;


CommonA8_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A8803C;
    RTL                                                                  ;A88040;


CommonA8_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A88041;
    RTL                                                                  ;A88045;


CommonA8_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A88046;
    RTL                                                                  ;A8804A;


RTS_A8804B:
    RTS                                                                  ;A8804B;


RTL_A8804C:
    RTL                                                                  ;A8804C;


Spritemap_CommonA8_Nothing:
    dw $0000                                                             ;A8804D;

ExtendedSpritemap_CommonA8_Nothing:
    dw $0001,$0000,$0000                                                 ;A8804F;
    dw Spritemap_CommonA8_Nothing                                        ;A88055;
    dw Hitbox_CommonA8_Nothing                                           ;A88057;

Hitbox_CommonA8_Nothing:
    dw $0001,$0000,$0000,$0000,$0000                                     ;A88059;
    dw CommonA8_NormalEnemyTouchAI                                       ;A88063;
    dw CommonA8_NormalEnemyShotAI                                        ;A88065;

InstList_CommonA8_DeleteEnemy:
    dw Instruction_CommonA8_DeleteEnemy                                  ;A88067;

NOPNOP_A88069:
    NOP                                                                  ;A88069;
    NOP                                                                  ;A8806A;

Instruction_CommonA8_Enemy0FB2_InY:
    LDA.W $0000,Y                                                        ;A8806B;
    STA.W EnemyData.work5,X                                              ;A8806E;
    INY                                                                  ;A88071;
    INY                                                                  ;A88072;
    RTL                                                                  ;A88073;


Instruction_CommonA8_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A8807B                                                    ;A88074;
    STA.W EnemyData.work5,X                                              ;A88077;
    RTL                                                                  ;A8807A;


RTS_A8807B:
    RTS                                                                  ;A8807B;


Instruction_CommonA8_DeleteEnemy:
    LDA.W EnemyData.properties,X                                         ;A8807C;
    ORA.W #$0200                                                         ;A8807F;
    STA.W EnemyData.properties,X                                         ;A88082;
    PLA                                                                  ;A88085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A88086;
    RTL                                                                  ;A88089;


Instruction_CommonA8_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A8808A;
    STA.B $12                                                            ;A8808D;
    PHY                                                                  ;A8808F;
    PHX                                                                  ;A88090;
    PEA.W .manualReturn-1                                                ;A88091;
    JMP.W ($0012)                                                        ;A88094;


.manualReturn:
    PLX                                                                  ;A88097;
    PLY                                                                  ;A88098;
    INY                                                                  ;A88099;
    INY                                                                  ;A8809A;
    RTL                                                                  ;A8809B;


Instruction_CommonA8_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A8809C;
    STA.B $12                                                            ;A8809F;
    LDA.W $0002,Y                                                        ;A880A1;
    PHY                                                                  ;A880A4;
    PHX                                                                  ;A880A5;
    PEA.W .manualReturn-1                                                ;A880A6;
    JMP.W ($0012)                                                        ;A880A9;


.manualReturn:
    PLX                                                                  ;A880AC;
    PLY                                                                  ;A880AD;
    TYA                                                                  ;A880AE;
    CLC                                                                  ;A880AF;
    ADC.W #$0004                                                         ;A880B0;
    TAY                                                                  ;A880B3;
    RTL                                                                  ;A880B4;


UNUSED_Instruction_CommonA8_CallExternalFunctionInY_A880B5:
    LDA.W $0000,Y                                                        ;A880B5;
    STA.B $12                                                            ;A880B8;
    LDA.W $0001,Y                                                        ;A880BA;
    STA.B $13                                                            ;A880BD;
    PHX                                                                  ;A880BF;
    PHY                                                                  ;A880C0;
    JSL.L .externalFunction                                              ;A880C1;
    PLY                                                                  ;A880C5;
    PLX                                                                  ;A880C6;
    INY                                                                  ;A880C7;
    INY                                                                  ;A880C8;
    INY                                                                  ;A880C9;
    RTL                                                                  ;A880CA;


.externalFunction:
    JML.W [$0012]                                                        ;A880CB;


UNUSED_Inst_CommonA8_CallExternalFunctionInY_WithA_A880CE:
    LDA.W $0000,Y                                                        ;A880CE;
    STA.B $12                                                            ;A880D1;
    LDA.W $0001,Y                                                        ;A880D3;
    STA.B $13                                                            ;A880D6;
    LDA.W $0003,Y                                                        ;A880D8;
    PHX                                                                  ;A880DB;
    PHY                                                                  ;A880DC;
    JSL.L .externalFunction                                              ;A880DD;
    PLY                                                                  ;A880E1;
    PLX                                                                  ;A880E2;
    TYA                                                                  ;A880E3;
    CLC                                                                  ;A880E4;
    ADC.W #$0005                                                         ;A880E5;
    TAY                                                                  ;A880E8;
    RTL                                                                  ;A880E9;


.externalFunction:
    JML.W [$0012]                                                        ;A880EA;


Instruction_CommonA8_GotoY:
    LDA.W $0000,Y                                                        ;A880ED;
    TAY                                                                  ;A880F0;
    RTL                                                                  ;A880F1;


Instruction_CommonA8_GotoY_PlusY:
    STY.B $12                                                            ;A880F2;
    DEY                                                                  ;A880F4;
    LDA.W $0000,Y                                                        ;A880F5;
    XBA                                                                  ;A880F8;
    BMI .highByte                                                        ;A880F9;
    AND.W #$00FF                                                         ;A880FB;
    BRA +                                                                ;A880FE;


.highByte:
    ORA.W #$FF00                                                         ;A88100;

  + CLC                                                                  ;A88103;
    ADC.B $12                                                            ;A88104;
    TAY                                                                  ;A88106;
    RTL                                                                  ;A88107;


Instruction_CommonA8_DecrementTimer_GotoYIfNonZero:
    DEC.W EnemyData.loopCounter,X                                        ;A88108;
    BNE Instruction_CommonA8_GotoY                                       ;A8810B;
    INY                                                                  ;A8810D;
    INY                                                                  ;A8810E;
    RTL                                                                  ;A8810F;


Instruction_CommonA8_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W EnemyData.loopCounter,X                                        ;A88110;
    BNE Instruction_CommonA8_GotoY                                       ;A88113;
    INY                                                                  ;A88115;
    INY                                                                  ;A88116;
    RTL                                                                  ;A88117;


Instruction_CommonA8_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A88118;
    DEC.W EnemyData.loopCounter,X                                        ;A8811A;
    REP #$20                                                             ;A8811D;
    BNE Instruction_CommonA8_GotoY_PlusY                                 ;A8811F;
    INY                                                                  ;A88121;
    RTL                                                                  ;A88122;


Instruction_CommonA8_TimerInY:
    LDA.W $0000,Y                                                        ;A88123;
    STA.W EnemyData.loopCounter,X                                        ;A88126;
    INY                                                                  ;A88129;
    INY                                                                  ;A8812A;
    RTL                                                                  ;A8812B;


Instruction_CommonA8_SkipNextInstruction:
    INY                                                                  ;A8812C;
    INY                                                                  ;A8812D;
    RTL                                                                  ;A8812E;


Instruction_CommonA8_Sleep:
    DEY                                                                  ;A8812F;
    DEY                                                                  ;A88130;
    TYA                                                                  ;A88131;
    STA.W EnemyData.pInstList,X                                          ;A88132;
    PLA                                                                  ;A88135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A88136;
    RTL                                                                  ;A88139;


Instruction_CommonA8_WaitYFrames:
    LDA.W $0000,Y                                                        ;A8813A;
    STA.W EnemyData.instTimer,X                                          ;A8813D;
    INY                                                                  ;A88140;
    INY                                                                  ;A88141;
    TYA                                                                  ;A88142;
    STA.W EnemyData.pInstList,X                                          ;A88143;
    PLA                                                                  ;A88146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A88147;
    RTL                                                                  ;A8814A;


Instruction_CommonA8_TransferYBytesInYToVRAM:
    PHX                                                                  ;A8814B;
    LDX.W $0330                                                          ;A8814C;
    LDA.W $0000,Y                                                        ;A8814F;
    STA.B $D0,X                                                          ;A88152;
    LDA.W $0002,Y                                                        ;A88154;
    STA.B $D2,X                                                          ;A88157;
    LDA.W $0003,Y                                                        ;A88159;
    STA.B $D3,X                                                          ;A8815C;
    LDA.W $0005,Y                                                        ;A8815E;
    STA.B $D5,X                                                          ;A88161;
    TXA                                                                  ;A88163;
    CLC                                                                  ;A88164;
    ADC.W #$0007                                                         ;A88165;
    STA.W $0330                                                          ;A88168;
    TYA                                                                  ;A8816B;
    CLC                                                                  ;A8816C;
    ADC.W #$0007                                                         ;A8816D;
    TAY                                                                  ;A88170;
    PLX                                                                  ;A88171;
    RTL                                                                  ;A88172;


Instruction_CommonA8_EnableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;A88173;
    ORA.W #$0800                                                         ;A88176;
    STA.W EnemyData.properties,X                                         ;A88179;
    RTL                                                                  ;A8817C;


Instruction_CommonA8_DisableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;A8817D;
    AND.W #$F7FF                                                         ;A88180;
    STA.W EnemyData.properties,X                                         ;A88183;
    RTL                                                                  ;A88186;


CommonA8EnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000                   ;A88187;
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000                   ;A88197;
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000                   ;A881A7;
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000                   ;A881B7;
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000                   ;A881C7;
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000                   ;A881D7;
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000                   ;A881E7;
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000                   ;A881F7;
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000                   ;A88207;
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000                   ;A88217;
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000                   ;A88227;
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000                   ;A88237;
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000                   ;A88247;
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000                   ;A88257;
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000                   ;A88267;
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000                   ;A88277;
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000                   ;A88287;
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000                   ;A88297;
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000                   ;A882A7;
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000                   ;A882B7;
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000                   ;A882C7;
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000                   ;A882D7;
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000                   ;A882E7;
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000                   ;A882F7;
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000                   ;A88307;
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000                   ;A88317;
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000                   ;A88327;
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000                   ;A88337;
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000                   ;A88347;
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000                   ;A88357;
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000                   ;A88367;
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000                   ;A88377;
    dw $0004,$0000,$FFFC,$0000                                           ;A88387;

CommonA8EnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF                   ;A8838F;
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF                   ;A8839F;
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF                   ;A883AF;
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF                   ;A883BF;
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF                   ;A883CF;
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF                   ;A883DF;
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF                   ;A883EF;
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF                   ;A883FF;
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF                   ;A8840F;
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF                   ;A8841F;
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF                   ;A8842F;
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE                   ;A8843F;
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE                   ;A8844F;
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE                   ;A8845F;
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE                   ;A8846F;
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE                   ;A8847F;
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD                   ;A8848F;
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD                   ;A8849F;
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD                   ;A884AF;
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC                   ;A884BF;
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC                   ;A884CF;
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC                   ;A884DF;
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB                   ;A884EF;
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB                   ;A884FF;
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB                   ;A8850F;
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA                   ;A8851F;
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA                   ;A8852F;
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9                   ;A8853F;
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9                   ;A8854F;
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9                   ;A8855F;
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8                   ;A8856F;
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8                   ;A8857F;
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7                   ;A8858F;
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7                   ;A8859F;
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6                   ;A885AF;
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6                   ;A885BF;
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5                   ;A885CF;
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4                   ;A885DF;
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4                   ;A885EF;
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3                   ;A885FF;
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3                   ;A8860F;
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2                   ;A8861F;
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1                   ;A8862F;
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1                   ;A8863F;
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0                   ;A8864F;
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF                   ;A8865F;
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE                   ;A8866F;
    dw $74F9,$0011,$8B07,$FFEE                                           ;A8867F;

Palette_Evir:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A88687;
    dw $158C,$03FF,$02B9,$0170,$0069,$0BB1,$1EA9,$0145                   ;A88697;

InstList_Evir_Body_FacingLeft:
    dw $000A                                                             ;A886A7;
    dw Spritemap_Evir_0                                                  ;A886A9;
    dw $000A                                                             ;A886AB;
    dw Spritemap_Evir_1                                                  ;A886AD;
    dw $000A                                                             ;A886AF;
    dw Spritemap_Evir_2                                                  ;A886B1;
    dw $000A                                                             ;A886B3;
    dw Spritemap_Evir_3                                                  ;A886B5;
    dw $000A                                                             ;A886B7;
    dw Spritemap_Evir_4                                                  ;A886B9;
    dw $000A                                                             ;A886BB;
    dw Spritemap_Evir_5                                                  ;A886BD;
    dw Instruction_Common_GotoY                                          ;A886BF;
    dw InstList_Evir_Body_FacingLeft                                     ;A886C1;

InstList_Evir_Arms_FacingLeft:
    dw $000A                                                             ;A886C3;
    dw Spritemap_Evir_6                                                  ;A886C5;
    dw $000A                                                             ;A886C7;
    dw Spritemap_Evir_7                                                  ;A886C9;
    dw $000A                                                             ;A886CB;
    dw Spritemap_Evir_8                                                  ;A886CD;
    dw $000A                                                             ;A886CF;
    dw Spritemap_Evir_9                                                  ;A886D1;
    dw $000A                                                             ;A886D3;
    dw Spritemap_Evir_6                                                  ;A886D5;
    dw $000A                                                             ;A886D7;
    dw Spritemap_Evir_7                                                  ;A886D9;
    dw $000A                                                             ;A886DB;
    dw Spritemap_Evir_8                                                  ;A886DD;
    dw $000A                                                             ;A886DF;
    dw Spritemap_Evir_9                                                  ;A886E1;
    dw $000A                                                             ;A886E3;
    dw Spritemap_Evir_6                                                  ;A886E5;
    dw $000A                                                             ;A886E7;
    dw Spritemap_Evir_7                                                  ;A886E9;
    dw $000A                                                             ;A886EB;
    dw Spritemap_Evir_8                                                  ;A886ED;
    dw $000A                                                             ;A886EF;
    dw Spritemap_Evir_9                                                  ;A886F1;
    dw $000A                                                             ;A886F3;
    dw Spritemap_Evir_6                                                  ;A886F5;
    dw $000A                                                             ;A886F7;
    dw Spritemap_Evir_7                                                  ;A886F9;
    dw $000A                                                             ;A886FB;
    dw Spritemap_Evir_8                                                  ;A886FD;
    dw $000A                                                             ;A886FF;
    dw Spritemap_Evir_9                                                  ;A88701;
    dw $0030                                                             ;A88703;
    dw Spritemap_Evir_A                                                  ;A88705;
    dw Instruction_Common_GotoY                                          ;A88707;
    dw InstList_Evir_Arms_FacingLeft                                     ;A88709;

InstList_Evir_Body_FacingRight:
    dw $000A                                                             ;A8870B;
    dw Spritemap_Evir_D                                                  ;A8870D;
    dw $000A                                                             ;A8870F;
    dw Spritemap_Evir_E                                                  ;A88711;
    dw $000A                                                             ;A88713;
    dw Spritemap_Evir_F                                                  ;A88715;
    dw $000A                                                             ;A88717;
    dw Spritemap_Evir_10                                                 ;A88719;
    dw $000A                                                             ;A8871B;
    dw Spritemap_Evir_11                                                 ;A8871D;
    dw $000A                                                             ;A8871F;
    dw Spritemap_Evir_12                                                 ;A88721;
    dw Instruction_CommonA8_GotoY                                        ;A88723;
    dw InstList_Evir_Body_FacingRight                                    ;A88725;

InstList_Evir_Arms_FacingRight:
    dw $000A                                                             ;A88727;
    dw Spritemap_Evir_13                                                 ;A88729;
    dw $000A                                                             ;A8872B;
    dw Spritemap_Evir_14                                                 ;A8872D;
    dw $000A                                                             ;A8872F;
    dw Spritemap_Evir_15                                                 ;A88731;
    dw $000A                                                             ;A88733;
    dw Spritemap_Evir_16                                                 ;A88735;
    dw $000A                                                             ;A88737;
    dw Spritemap_Evir_13                                                 ;A88739;
    dw $000A                                                             ;A8873B;
    dw Spritemap_Evir_14                                                 ;A8873D;
    dw $000A                                                             ;A8873F;
    dw Spritemap_Evir_15                                                 ;A88741;
    dw $000A                                                             ;A88743;
    dw Spritemap_Evir_16                                                 ;A88745;
    dw $000A                                                             ;A88747;
    dw Spritemap_Evir_13                                                 ;A88749;
    dw $000A                                                             ;A8874B;
    dw Spritemap_Evir_14                                                 ;A8874D;
    dw $000A                                                             ;A8874F;
    dw Spritemap_Evir_15                                                 ;A88751;
    dw $000A                                                             ;A88753;
    dw Spritemap_Evir_16                                                 ;A88755;
    dw $000A                                                             ;A88757;
    dw Spritemap_Evir_13                                                 ;A88759;
    dw $000A                                                             ;A8875B;
    dw Spritemap_Evir_14                                                 ;A8875D;
    dw $000A                                                             ;A8875F;
    dw Spritemap_Evir_15                                                 ;A88761;
    dw $000A                                                             ;A88763;
    dw Spritemap_Evir_16                                                 ;A88765;
    dw $0030                                                             ;A88767;
    dw Spritemap_Evir_17                                                 ;A88769;
    dw Instruction_Common_GotoY                                          ;A8876B;
    dw InstList_Evir_Arms_FacingRight                                    ;A8876D;

InstList_Evir_Projectile_Normal:
    dw $0001                                                             ;A8876F;
    dw Spritemap_Evir_C                                                  ;A88771;
    dw Instruction_Common_Sleep                                          ;A88773;

InstList_Evir_Projectile_Regenerating_0:
    dw Instruction_Evir_SetInitialRegenerationXOffset                    ;A88775;
    dw Instruction_Common_TimerInY                                       ;A88777;
    dw $0008                                                             ;A88779;
    dw Instruction_Evir_PlaySpitSFX                                      ;A8877B;

InstList_Evir_Projectile_Regenerating_1:
    dw $0008                                                             ;A8877D;
    dw Spritemap_Evir_B                                                  ;A8877F;
    dw Instruction_Evir_AdvanceRegenerationXOffset                       ;A88781;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A88783;
    dw InstList_Evir_Projectile_Regenerating_1                           ;A88785;
    dw $0010                                                             ;A88787;
    dw Spritemap_Evir_C                                                  ;A88789;
    dw Instruction_Evir_FinishRegeneration                               ;A8878B;
    dw Instruction_Common_Sleep                                          ;A8878D;

Instruction_Evir_PlaySpitSFX:
    PHX                                                                  ;A8878F;
    PHY                                                                  ;A88790;
    LDA.W #$005E                                                         ;A88791;
    JSL.L QueueSound_Lib2_Max6                                           ;A88794;
    PLY                                                                  ;A88798;
    PLX                                                                  ;A88799;
    RTL                                                                  ;A8879A;


Instruction_Evir_SetInitialRegenerationXOffset:
    LDX.W $0E54                                                          ;A8879B;
    LDA.L $7E7782,X                                                      ;A8879E;
    CMP.W #InstList_Evir_Body_FacingRight                                ;A887A2;
    BEQ .facingRight                                                     ;A887A5;
    LDA.W #$0008                                                         ;A887A7;
    STA.W EnemyData.work5,X                                              ;A887AA;
    BRA .return                                                          ;A887AD;


.facingRight:
    LDA.W #$FFF8                                                         ;A887AF;
    STA.W EnemyData.work5,X                                              ;A887B2;

.return:
    RTL                                                                  ;A887B5;


Instruction_Evir_AdvanceRegenerationXOffset:
    LDX.W $0E54                                                          ;A887B6;
    LDA.L $7E7782,X                                                      ;A887B9;
    CMP.W #InstList_Evir_Body_FacingRight                                ;A887BD;
    BEQ .facingRight                                                     ;A887C0;
    DEC.W EnemyData.work5,X                                              ;A887C2;
    BRA .return                                                          ;A887C5;


.facingRight:
    INC.W EnemyData.work5,X                                              ;A887C7;

.return:
    RTL                                                                  ;A887CA;


Instruction_Evir_FinishRegeneration:
    LDX.W $0E54                                                          ;A887CB;
    LDA.W #$0000                                                         ;A887CE;
    STA.L $7E7818,X                                                      ;A887D1;
    STA.L $7E7816,X                                                      ;A887D5;
    LDA.W #Function_EvirProjectile_Idle                                  ;A887D9;
    STA.W EnemyData.work2,X                                              ;A887DC;
    RTL                                                                  ;A887DF;


InitAI_Evir:
    LDX.W $0E54                                                          ;A887E0;
    LDA.W EnemyData.initParam0,X                                         ;A887E3;
    BNE .nonZeroParam1                                                   ;A887E6;
    JSR.W SetEvirFacingDirection                                         ;A887E8;
    LDA.W EnemyData.initParam1,X                                         ;A887EB;
    AND.W #$00FF                                                         ;A887EE;
    ASL A                                                                ;A887F1;
    ASL A                                                                ;A887F2;
    ASL A                                                                ;A887F3;
    TAY                                                                  ;A887F4;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A887F5;
    STA.L $7E7808,X                                                      ;A887F8;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A887FC;
    STA.L $7E7806,X                                                      ;A887FF;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;A88803;
    STA.L $7E780C,X                                                      ;A88806;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;A8880A;
    STA.L $7E780A,X                                                      ;A8880D;
    LDA.W $0FB7,Y                                                        ;A88811;
    AND.W #$00FF                                                         ;A88814;
    LSR A                                                                ;A88817;
    STA.W EnemyData.work4,X                                              ;A88818;
    BRA +                                                                ;A8881B;


.nonZeroParam1:
    JSR.W HandleEvirArms                                                 ;A8881D;
    LDA.W #$0004                                                         ;A88820;
    STA.W EnemyData.layer,X                                              ;A88823;

  + LDA.W #$0000                                                         ;A88826;
    STA.L $7E7800,X                                                      ;A88829;
    STA.L $7E7802,X                                                      ;A8882D;
    LDA.W #Function_Evir_HandleBodyArms                                  ;A88831;
    STA.W EnemyData.work2,X                                              ;A88834;
    RTL                                                                  ;A88837;


SetEvirFacingDirection:
    LDX.W $0E54                                                          ;A88838;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8883B;
    BPL .SamusToTheRight                                                 ;A8883F;
    LDA.W #$0000                                                         ;A88841;
    STA.W EnemyData.work1,X                                              ;A88844;
    BRA +                                                                ;A88847;


.SamusToTheRight:
    LDA.W #$0001                                                         ;A88849;
    STA.W EnemyData.work1,X                                              ;A8884C;

  + LDA.W #InstList_Evir_Body_FacingLeft                                 ;A8884F;
    STA.L $7E7804,X                                                      ;A88852;
    LDA.W EnemyData.work1,X                                              ;A88856;
    BEQ .keepLeft                                                        ;A88859;
    LDA.W #InstList_Evir_Body_FacingRight                                ;A8885B;
    STA.L $7E7804,X                                                      ;A8885E;

.keepLeft:
    JSR.W SetEvirInstList                                                ;A88862;
    RTS                                                                  ;A88865;


HandleEvirArms:
    LDX.W $0E54                                                          ;A88866;
    LDA.W $0F6A,X                                                        ;A88869;
    STA.W EnemyData.work1,X                                              ;A8886C;
    BNE .facingRight                                                     ;A8886F;
    LDA.W $0F3A,X                                                        ;A88871;
    SEC                                                                  ;A88874;
    SBC.W #$0004                                                         ;A88875;
    STA.W EnemyData.xPosition,X                                          ;A88878;
    LDA.W $0F3E,X                                                        ;A8887B;
    CLC                                                                  ;A8887E;
    ADC.W #$000A                                                         ;A8887F;
    STA.W EnemyData.yPosition,X                                          ;A88882;
    LDA.W #InstList_Evir_Arms_FacingLeft                                 ;A88885;
    STA.L $7E7804,X                                                      ;A88888;
    JSR.W SetEvirInstList                                                ;A8888C;
    BRA .return                                                          ;A8888F;


.facingRight:
    LDA.W $0F3A,X                                                        ;A88891;
    CLC                                                                  ;A88894;
    ADC.W #$0004                                                         ;A88895;
    STA.W EnemyData.xPosition,X                                          ;A88898;
    LDA.W $0F3E,X                                                        ;A8889B;
    CLC                                                                  ;A8889E;
    ADC.W #$000A                                                         ;A8889F;
    STA.W EnemyData.yPosition,X                                          ;A888A2;
    LDA.W #InstList_Evir_Arms_FacingRight                                ;A888A5;
    STA.L $7E7804,X                                                      ;A888A8;
    JSR.W SetEvirInstList                                                ;A888AC;

.return:
    RTS                                                                  ;A888AF;


InitAI_EvirProjectile:
    LDX.W $0E54                                                          ;A888B0;
    LDA.W #InstList_Evir_Projectile_Normal                               ;A888B3;
    STA.L $7E7804,X                                                      ;A888B6;
    JSR.W SetEvirInstList                                                ;A888BA;
    LDA.W $0F16,X                                                        ;A888BD;
    STA.W EnemyData.palette,X                                            ;A888C0;
    LDA.W $0F18,X                                                        ;A888C3;
    STA.W EnemyData.gfxOffset,X                                          ;A888C6;
    JSR.W ResetEvirProjectilePosition                                    ;A888C9;
    LDA.W #$0000                                                         ;A888CC;
    STA.L $7E7802,X                                                      ;A888CF;
    STA.L $7E7818,X                                                      ;A888D3;
    STA.L $7E7816,X                                                      ;A888D7;
    STA.W EnemyData.work5,X                                              ;A888DB;
    LDA.W #Function_EvirProjectile_Idle                                  ;A888DE;
    STA.W EnemyData.work2,X                                              ;A888E1;
    RTL                                                                  ;A888E4;


ResetEvirProjectilePosition:
    LDX.W $0E54                                                          ;A888E5;
    LDA.W $0F2A,X                                                        ;A888E8;
    STA.W EnemyData.work1,X                                              ;A888EB;
    BNE .notUp                                                           ;A888EE;
    LDA.W $0EFA,X                                                        ;A888F0;
    SEC                                                                  ;A888F3;
    SBC.W #$0004                                                         ;A888F4;
    STA.W EnemyData.xPosition,X                                          ;A888F7;
    LDA.W $0EFE,X                                                        ;A888FA;
    CLC                                                                  ;A888FD;
    ADC.W #$0012                                                         ;A888FE;
    STA.W EnemyData.yPosition,X                                          ;A88901;
    BRA .return                                                          ;A88904;


.notUp:
    LDA.W $0EFA,X                                                        ;A88906;
    CLC                                                                  ;A88909;
    ADC.W #$0004                                                         ;A8890A;
    STA.W EnemyData.xPosition,X                                          ;A8890D;
    LDA.W $0EFE,X                                                        ;A88910;
    CLC                                                                  ;A88913;
    ADC.W #$0012                                                         ;A88914;
    STA.W EnemyData.yPosition,X                                          ;A88917;

.return:
    RTS                                                                  ;A8891A;


MainAI_Evir:
    LDX.W $0E54                                                          ;A8891B;
    JSR.W ($0FAC,X)                                                      ;A8891E;
    RTL                                                                  ;A88921;


Function_Evir_HandleBodyArms:
    LDX.W $0E54                                                          ;A88922;
    LDA.W EnemyData.initParam0,X                                         ;A88925;
    BNE .notMaster                                                       ;A88928;
    JSR.W HandleEvirBody                                                 ;A8892A;
    BRA .return                                                          ;A8892D;


.notMaster:
    JSR.W Call_HandleEvirArms                                            ;A8892F;

.return:
    RTS                                                                  ;A88932;


HandleEvirBody:
    LDX.W $0E54                                                          ;A88933;
    LDA.L $7E7898,X                                                      ;A88936;
    BNE .directionChosen                                                 ;A8893A;
    JSR.W SetEvirFacingDirection                                         ;A8893C;

.directionChosen:
    LDA.L $7E7800,X                                                      ;A8893F;
    BNE .sinking                                                         ;A88943;
    LDA.W EnemyData.yPosition,X                                          ;A88945;
    CLC                                                                  ;A88948;
    ADC.L $7E780C,X                                                      ;A88949;
    STA.W EnemyData.yPosition,X                                          ;A8894D;
    LDA.W EnemyData.ySubPosition,X                                       ;A88950;
    CLC                                                                  ;A88953;
    ADC.L $7E780A,X                                                      ;A88954;
    BCC .storeYSubPosition                                               ;A88958;
    INC.W EnemyData.yPosition,X                                          ;A8895A;

.storeYSubPosition:
    STA.W EnemyData.ySubPosition,X                                       ;A8895D;
    BRA +                                                                ;A88960;


.sinking:
    LDA.W EnemyData.yPosition,X                                          ;A88962;
    CLC                                                                  ;A88965;
    ADC.L $7E7808,X                                                      ;A88966;
    STA.W EnemyData.yPosition,X                                          ;A8896A;
    LDA.W EnemyData.ySubPosition,X                                       ;A8896D;
    CLC                                                                  ;A88970;
    ADC.L $7E7806,X                                                      ;A88971;
    BCC ..storeYSubPosition                                              ;A88975;
    INC.W EnemyData.yPosition,X                                          ;A88977;

..storeYSubPosition:
    STA.W EnemyData.ySubPosition,X                                       ;A8897A;

  + DEC.W EnemyData.work4,X                                              ;A8897D;
    BPL .return                                                          ;A88980;
    LDA.W EnemyData.initParam1+1,X                                       ;A88982;
    AND.W #$00FF                                                         ;A88985;
    STA.W EnemyData.work4,X                                              ;A88988;
    LDA.L $7E7800,X                                                      ;A8898B;
    EOR.W #$0001                                                         ;A8898F;
    STA.L $7E7800,X                                                      ;A88992;

.return:
    RTS                                                                  ;A88996;


Call_HandleEvirArms:
    LDX.W $0E54                                                          ;A88997; >.<
    JSR.W HandleEvirArms                                                 ;A8899A;
    RTS                                                                  ;A8899D;


MainAI_EvirProjectile:
    LDX.W $0E54                                                          ;A8899E;
    LDA.W EnemyData.freezeTimer,X                                        ;A889A1;
    BNE .merge                                                           ;A889A4;
    LDA.L $7E7816,X                                                      ;A889A6;
    BEQ .angleInitialized                                                ;A889AA;
    LDA.W EnemyData.work1,X                                              ;A889AC; >_<
    LDA.W #InstList_Evir_Projectile_Normal                               ;A889AF;
    STA.L $7E7804,X                                                      ;A889B2;
    JSR.W SetEvirInstList                                                ;A889B6;
    BRA .merge                                                           ;A889B9;


.angleInitialized:
    LDA.L $7E7818,X                                                      ;A889BB;
    BEQ .doneSpawning                                                    ;A889BF;
    LDA.W #InstList_Evir_Projectile_Regenerating_0                       ;A889C1;
    STA.L $7E7804,X                                                      ;A889C4;
    JSR.W SetEvirInstList                                                ;A889C8;
    BRA .merge                                                           ;A889CB;


.doneSpawning:
    JSR.W ShootEvirProjectileAtSamus                                     ;A889CD;

.merge:
    JSR.W ($0FAC,X)                                                      ;A889D0;
    RTL                                                                  ;A889D3;


ShootEvirProjectileAtSamus:
    LDA.W $0E54                                                          ;A889D4;
    SEC                                                                  ;A889D7;
    SBC.W #$0080                                                         ;A889D8;
    TAX                                                                  ;A889DB;
    LDA.W #$0080                                                         ;A889DC;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A889DF;
    BEQ .return                                                          ;A889E3;
    LDA.W #$0004                                                         ;A889E5;
    STA.W $0E32                                                          ;A889E8;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A889EB;
    SEC                                                                  ;A889EF;
    SBC.W #$0040                                                         ;A889F0;
    AND.W #$00FF                                                         ;A889F3;
    EOR.W #$FFFF                                                         ;A889F6;
    INC A                                                                ;A889F9;
    STA.B $16                                                            ;A889FA;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A889FC;
    STA.L $7E780E,X                                                      ;A88A00;
    LDA.W $0E38                                                          ;A88A04;
    STA.L $7E7810,X                                                      ;A88A07;
    LDA.B $16                                                            ;A88A0B;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A88A0D;
    STA.L $7E7812,X                                                      ;A88A11;
    LDA.W $0E38                                                          ;A88A15;
    STA.L $7E7814,X                                                      ;A88A18;
    LDA.W #InstList_Evir_Projectile_Normal                               ;A88A1C;
    STA.L $7E7804,X                                                      ;A88A1F;
    JSR.W SetEvirInstList                                                ;A88A23;
    LDA.W #$0001                                                         ;A88A26;
    STA.L $7E7816,X                                                      ;A88A29;
    LDA.W #Function_EvirProjectile_Moving                                ;A88A2D;
    STA.W EnemyData.work2,X                                              ;A88A30;

.return:
    RTS                                                                  ;A88A33;


Function_EvirProjectile_Idle:
    LDX.W $0E54                                                          ;A88A34;
    JSR.W ResetEvirProjectilePosition                                    ;A88A37;
    RTS                                                                  ;A88A3A;


Function_EvirProjectile_Moving:
    LDX.W $0E54                                                          ;A88A3B;
    JSR.W StartEvirProjectileRegeneratingIfFarOffScreen                  ;A88A3E;
    LDA.W EnemyData.xPosition,X                                          ;A88A41;
    CLC                                                                  ;A88A44;
    ADC.L $7E780E,X                                                      ;A88A45;
    STA.W EnemyData.xPosition,X                                          ;A88A49;
    LDA.W EnemyData.xSubPosition,X                                       ;A88A4C;
    CLC                                                                  ;A88A4F;
    ADC.L $7E7810,X                                                      ;A88A50;
    BCC +                                                                ;A88A54;
    INC.W EnemyData.xPosition,X                                          ;A88A56;

  + STA.W EnemyData.xSubPosition,X                                       ;A88A59;
    LDA.W EnemyData.yPosition,X                                          ;A88A5C;
    CLC                                                                  ;A88A5F;
    ADC.L $7E7812,X                                                      ;A88A60;
    STA.W EnemyData.yPosition,X                                          ;A88A64;
    LDA.W EnemyData.ySubPosition,X                                       ;A88A67;
    CLC                                                                  ;A88A6A;
    ADC.L $7E7814,X                                                      ;A88A6B;
    BCC +                                                                ;A88A6F;
    INC.W EnemyData.yPosition,X                                          ;A88A71;

  + STA.W EnemyData.ySubPosition,X                                       ;A88A74;
    RTS                                                                  ;A88A77;


Function_EvirProjectile_Regenerating:
    LDX.W $0E54                                                          ;A88A78;
    LDA.W $0F1E,X                                                        ;A88A7B;
    BNE .return                                                          ;A88A7E;
    LDA.L $7E7818,X                                                      ;A88A80;
    BNE .notRegenerating                                                 ;A88A84;
    LDA.W #InstList_Evir_Projectile_Normal                               ;A88A86;
    STA.L $7E7804,X                                                      ;A88A89;
    JSR.W SetEvirInstList                                                ;A88A8D;
    LDA.W #$0000                                                         ;A88A90;
    STA.L $7E7818,X                                                      ;A88A93;
    STA.L $7E7816,X                                                      ;A88A97;
    LDA.W #Function_EvirProjectile_Idle                                  ;A88A9B;
    STA.W EnemyData.work2,X                                              ;A88A9E;
    BRA .return                                                          ;A88AA1;


.notRegenerating:
    JSR.W ResetEvirProjectilePosition                                    ;A88AA3;
    LDA.W EnemyData.xPosition,X                                          ;A88AA6;
    CLC                                                                  ;A88AA9;
    ADC.W EnemyData.work5,X                                              ;A88AAA;
    STA.W EnemyData.xPosition,X                                          ;A88AAD;

.return:
    RTS                                                                  ;A88AB0;


StartEvirProjectileRegeneratingIfFarOffScreen:
    LDX.W $0E54                                                          ;A88AB1;
    LDA.W #$0100                                                         ;A88AB4;
    JSL.L CheckIfEnemyCenterIsOverAPixelsOffScreen                       ;A88AB7;
    BEQ .return                                                          ;A88ABB;
    LDA.W $0F1E,X                                                        ;A88ABD;
    BNE .return                                                          ;A88AC0;
    LDA.W #$0000                                                         ;A88AC2;
    STA.L $7E7816,X                                                      ;A88AC5;
    LDA.W #$0001                                                         ;A88AC9;
    STA.L $7E7818,X                                                      ;A88ACC;
    LDA.W #Function_EvirProjectile_Regenerating                          ;A88AD0;
    STA.W EnemyData.work2,X                                              ;A88AD3;
    LDA.W #$0001                                                         ;A88AD6;
    STA.L $7E7818,X                                                      ;A88AD9;
    LDA.W #InstList_Evir_Projectile_Regenerating_0                       ;A88ADD;
    STA.L $7E7804,X                                                      ;A88AE0;
    JSR.W SetEvirInstList                                                ;A88AE4;

.return:
    RTS                                                                  ;A88AE7;


SetEvirInstList:
    LDX.W $0E54                                                          ;A88AE8;
    LDA.L $7E7804,X                                                      ;A88AEB;
    CMP.L $7E7802,X                                                      ;A88AEF;
    BEQ .return                                                          ;A88AF3;
    STA.W EnemyData.pInstList,X                                          ;A88AF5;
    STA.L $7E7802,X                                                      ;A88AF8;
    LDA.W #$0001                                                         ;A88AFC;
    STA.W EnemyData.instTimer,X                                          ;A88AFF;
    STZ.W EnemyData.loopCounter,X                                        ;A88B02;

.return:
    RTS                                                                  ;A88B05;


EnemyShot_Evir:
    JSL.L CommonA8_NormalEnemyTouchAI                                    ;A88B06;
    BRA ContactReaction_Evir_Common                                      ;A88B0A;


PowerBombReaction_Evir:
    JSL.L CommonA8_NormalEnemyPowerBombAI                                ;A88B0C;
    BRA ContactReaction_Evir_Common                                      ;A88B10;


EnemyTouch_Evir:
    JSL.L NormalEnemyShotAI                                              ;A88B12; fallthrough to ContactReaction_Evir_Common

ContactReaction_Evir_Common:
    LDX.W $0E54                                                          ;A88B16;
    LDA.W EnemyData.health,X                                             ;A88B19;
    BNE .notDead                                                         ;A88B1C;
    LDA.W $0FC6,X                                                        ;A88B1E;
    ORA.W #$0200                                                         ;A88B21;
    STA.W $0FC6,X                                                        ;A88B24;
    LDA.W $1006,X                                                        ;A88B27;
    ORA.W #$0200                                                         ;A88B2A;
    STA.W $1006,X                                                        ;A88B2D;

.notDead:
    LDA.W EnemyData.freezeTimer,X                                        ;A88B30;
    BEQ .return                                                          ;A88B33;
    STA.W $0FDE,X                                                        ;A88B35;
    LDA.W $0FCA,X                                                        ;A88B38;
    ORA.W #$0004                                                         ;A88B3B;
    STA.W $0FCA,X                                                        ;A88B3E;
    LDA.W $102C,X                                                        ;A88B41;
    CMP.W #Function_EvirProjectile_Moving                                ;A88B44;
    BEQ .return                                                          ;A88B47;
    LDA.W $100A,X                                                        ;A88B49;
    ORA.W #$0004                                                         ;A88B4C;
    STA.W $100A,X                                                        ;A88B4F;
    LDA.W EnemyData.freezeTimer,X                                        ;A88B52;
    STA.W $101E,X                                                        ;A88B55;

.return:
    RTL                                                                  ;A88B58;


Spritemap_Evir_0:
    dw $0009,$81FE                                                       ;A88B59;
    db $FB                                                               ;A88B5D;
    dw $2106,$81EE                                                       ;A88B5E;
    db $FB                                                               ;A88B62;
    dw $2104,$81FE                                                       ;A88B63;
    db $EB                                                               ;A88B67;
    dw $2102,$81EE                                                       ;A88B68;
    db $EB                                                               ;A88B6C;
    dw $2100,$8002                                                       ;A88B6D;
    db $FB                                                               ;A88B71;
    dw $2108,$8001                                                       ;A88B72;
    db $01                                                               ;A88B76;
    dw $2108,$81FF                                                       ;A88B77;
    db $07                                                               ;A88B7B;
    dw $210C,$01FE                                                       ;A88B7C;
    db $10                                                               ;A88B80;
    dw $2126,$01FE                                                       ;A88B81;
    db $08                                                               ;A88B85;
    dw $2125                                                             ;A88B86;

Spritemap_Evir_1:
    dw $0009,$81FE                                                       ;A88B88;
    db $FB                                                               ;A88B8C;
    dw $2106,$81EE                                                       ;A88B8D;
    db $FB                                                               ;A88B91;
    dw $2104,$81FE                                                       ;A88B92;
    db $EB                                                               ;A88B96;
    dw $2102,$81EE                                                       ;A88B97;
    db $EB                                                               ;A88B9B;
    dw $2100,$8002                                                       ;A88B9C;
    db $FC                                                               ;A88BA0;
    dw $2108,$8001                                                       ;A88BA1;
    db $02                                                               ;A88BA5;
    dw $2108,$81FF                                                       ;A88BA6;
    db $07                                                               ;A88BAA;
    dw $210C,$01FE                                                       ;A88BAB;
    db $10                                                               ;A88BAF;
    dw $2126,$01FE                                                       ;A88BB0;
    db $08                                                               ;A88BB4;
    dw $2125                                                             ;A88BB5;

Spritemap_Evir_2:
    dw $0009,$81FE                                                       ;A88BB7;
    db $FB                                                               ;A88BBB;
    dw $2106,$81EE                                                       ;A88BBC;
    db $FB                                                               ;A88BC0;
    dw $2104,$81FE                                                       ;A88BC1;
    db $EB                                                               ;A88BC5;
    dw $2102,$81EE                                                       ;A88BC6;
    db $EB                                                               ;A88BCA;
    dw $2100,$8002                                                       ;A88BCB;
    db $FD                                                               ;A88BCF;
    dw $2108,$8001                                                       ;A88BD0;
    db $03                                                               ;A88BD4;
    dw $2108,$81FF                                                       ;A88BD5;
    db $08                                                               ;A88BD9;
    dw $210C,$01FE                                                       ;A88BDA;
    db $11                                                               ;A88BDE;
    dw $2126,$01FE                                                       ;A88BDF;
    db $09                                                               ;A88BE3;
    dw $2125                                                             ;A88BE4;

Spritemap_Evir_3:
    dw $0009,$81FE                                                       ;A88BE6;
    db $FB                                                               ;A88BEA;
    dw $2106,$81EE                                                       ;A88BEB;
    db $FB                                                               ;A88BEF;
    dw $2104,$81FE                                                       ;A88BF0;
    db $EB                                                               ;A88BF4;
    dw $2102,$81EE                                                       ;A88BF5;
    db $EB                                                               ;A88BF9;
    dw $2100,$8002                                                       ;A88BFA;
    db $FD                                                               ;A88BFE;
    dw $2108,$8001                                                       ;A88BFF;
    db $04                                                               ;A88C03;
    dw $2108,$81FF                                                       ;A88C04;
    db $09                                                               ;A88C08;
    dw $210C,$01FE                                                       ;A88C09;
    db $12                                                               ;A88C0D;
    dw $2126,$01FE                                                       ;A88C0E;
    db $0A                                                               ;A88C12;
    dw $2125                                                             ;A88C13;

Spritemap_Evir_4:
    dw $0009,$81FE                                                       ;A88C15;
    db $FB                                                               ;A88C19;
    dw $2106,$81EE                                                       ;A88C1A;
    db $FB                                                               ;A88C1E;
    dw $2104,$81FE                                                       ;A88C1F;
    db $EB                                                               ;A88C23;
    dw $2102,$81EE                                                       ;A88C24;
    db $EB                                                               ;A88C28;
    dw $2100,$8002                                                       ;A88C29;
    db $FD                                                               ;A88C2D;
    dw $2108,$8001                                                       ;A88C2E;
    db $04                                                               ;A88C32;
    dw $2108,$81FF                                                       ;A88C33;
    db $0A                                                               ;A88C37;
    dw $210C,$01FE                                                       ;A88C38;
    db $11                                                               ;A88C3C;
    dw $2126,$01FE                                                       ;A88C3D;
    db $09                                                               ;A88C41;
    dw $2125                                                             ;A88C42;

Spritemap_Evir_5:
    dw $0009,$81FE                                                       ;A88C44;
    db $FB                                                               ;A88C48;
    dw $2106,$81EE                                                       ;A88C49;
    db $FB                                                               ;A88C4D;
    dw $2104,$81FE                                                       ;A88C4E;
    db $EB                                                               ;A88C52;
    dw $2102,$81EE                                                       ;A88C53;
    db $EB                                                               ;A88C57;
    dw $2100,$8002                                                       ;A88C58;
    db $FC                                                               ;A88C5C;
    dw $2108,$8001                                                       ;A88C5D;
    db $03                                                               ;A88C61;
    dw $2108,$81FF                                                       ;A88C62;
    db $09                                                               ;A88C66;
    dw $210C,$01FE                                                       ;A88C67;
    db $10                                                               ;A88C6B;
    dw $2126,$01FE                                                       ;A88C6C;
    db $08                                                               ;A88C70;
    dw $2125                                                             ;A88C71;

UNUSED_Spritemap_Evir_A88C73:
    dw $0009,$81FE                                                       ;A88C73;
    db $FB                                                               ;A88C77;
    dw $2106,$81EE                                                       ;A88C78;
    db $FB                                                               ;A88C7C;
    dw $2104,$81FE                                                       ;A88C7D;
    db $EB                                                               ;A88C81;
    dw $2102,$81EE                                                       ;A88C82;
    db $EB                                                               ;A88C86;
    dw $2100,$8002                                                       ;A88C87;
    db $FB                                                               ;A88C8B;
    dw $2108,$8001                                                       ;A88C8C;
    db $01                                                               ;A88C90;
    dw $2108,$81FF                                                       ;A88C91;
    db $07                                                               ;A88C95;
    dw $210C,$01FE                                                       ;A88C96;
    db $10                                                               ;A88C9A;
    dw $2126,$01FE                                                       ;A88C9B;
    db $08                                                               ;A88C9F;
    dw $2125                                                             ;A88CA0;

Spritemap_Evir_6:
    dw $0005,$0000                                                       ;A88CA2;
    db $F8                                                               ;A88CA6;
    dw $2123,$01F8                                                       ;A88CA7;
    db $F8                                                               ;A88CAB;
    dw $2122,$0002                                                       ;A88CAC;
    db $FC                                                               ;A88CB0;
    dw $2124,$01FE                                                       ;A88CB1;
    db $F4                                                               ;A88CB5;
    dw $2121,$01F6                                                       ;A88CB6;
    db $F4                                                               ;A88CBA;
    dw $2120                                                             ;A88CBB;

Spritemap_Evir_7:
    dw $0005,$01FE                                                       ;A88CBD;
    db $F4                                                               ;A88CC1;
    dw $2123,$01F6                                                       ;A88CC2;
    db $F4                                                               ;A88CC6;
    dw $2122,$0000                                                       ;A88CC7;
    db $F8                                                               ;A88CCB;
    dw $2124,$0002                                                       ;A88CCC;
    db $FC                                                               ;A88CD0;
    dw $2123,$01FA                                                       ;A88CD1;
    db $FC                                                               ;A88CD5;
    dw $2122                                                             ;A88CD6;

Spritemap_Evir_8:
    dw $0005,$01FE                                                       ;A88CD8;
    db $F4                                                               ;A88CDC;
    dw $2124,$01F8                                                       ;A88CDD;
    db $F8                                                               ;A88CE1;
    dw $2122,$0000                                                       ;A88CE2;
    db $F8                                                               ;A88CE6;
    dw $2123,$0002                                                       ;A88CE7;
    db $FC                                                               ;A88CEB;
    dw $2121,$01FA                                                       ;A88CEC;
    db $FC                                                               ;A88CF0;
    dw $2120                                                             ;A88CF1;

Spritemap_Evir_9:
    dw $0006,$01FE                                                       ;A88CF3;
    db $F4                                                               ;A88CF7;
    dw $2123,$01F6                                                       ;A88CF8;
    db $F4                                                               ;A88CFC;
    dw $2122,$01F8                                                       ;A88CFD;
    db $F8                                                               ;A88D01;
    dw $2120,$0000                                                       ;A88D02;
    db $F8                                                               ;A88D06;
    dw $2121,$0002                                                       ;A88D07;
    db $FC                                                               ;A88D0B;
    dw $2123,$01FA                                                       ;A88D0C;
    db $FC                                                               ;A88D10;
    dw $2122                                                             ;A88D11;

Spritemap_Evir_A:
    dw $0003,$01FE                                                       ;A88D13;
    db $F4                                                               ;A88D17;
    dw $2124,$0000                                                       ;A88D18;
    db $F8                                                               ;A88D1C;
    dw $2124,$0002                                                       ;A88D1D;
    db $FC                                                               ;A88D21;
    dw $2124                                                             ;A88D22;

UNUSED_Spritemap_Evir_A88D24:
    dw $0006,$01FE                                                       ;A88D24;
    db $F4                                                               ;A88D28;
    dw $2123,$01F6                                                       ;A88D29;
    db $F4                                                               ;A88D2D;
    dw $2122,$01F8                                                       ;A88D2E;
    db $F8                                                               ;A88D32;
    dw $2122,$0000                                                       ;A88D33;
    db $F8                                                               ;A88D37;
    dw $2123,$0002                                                       ;A88D38;
    db $FC                                                               ;A88D3C;
    dw $2123,$01FA                                                       ;A88D3D;
    db $FC                                                               ;A88D41;
    dw $2122                                                             ;A88D42;

UNUSED_Spritemap_Evir_A88D44:
    dw $0006,$01FE                                                       ;A88D44;
    db $F4                                                               ;A88D48;
    dw $2121,$01F6                                                       ;A88D49;
    db $F4                                                               ;A88D4D;
    dw $2120,$0000                                                       ;A88D4E;
    db $F8                                                               ;A88D52;
    dw $2121,$01F8                                                       ;A88D53;
    db $F8                                                               ;A88D57;
    dw $2120,$0002                                                       ;A88D58;
    db $FC                                                               ;A88D5C;
    dw $2121,$01FA                                                       ;A88D5D;
    db $FC                                                               ;A88D61;
    dw $2120                                                             ;A88D62;

Spritemap_Evir_B:
    dw $0004,$0000                                                       ;A88D64;
    db $00                                                               ;A88D68;
    dw $A128,$01F8                                                       ;A88D69;
    db $00                                                               ;A88D6D;
    dw $A127,$0000                                                       ;A88D6E;
    db $F8                                                               ;A88D72;
    dw $2128,$01F8                                                       ;A88D73;
    db $F8                                                               ;A88D77;
    dw $2127                                                             ;A88D78;

Spritemap_Evir_C:
    dw $0001,$81F8                                                       ;A88D7A;
    db $F8                                                               ;A88D7E;
    dw $210E                                                             ;A88D7F;

Spritemap_Evir_D:
    dw $0009,$81F2                                                       ;A88D81;
    db $FB                                                               ;A88D85;
    dw $6106,$8002                                                       ;A88D86;
    db $FB                                                               ;A88D8A;
    dw $6104,$81F2                                                       ;A88D8B;
    db $EB                                                               ;A88D8F;
    dw $6102,$8002                                                       ;A88D90;
    db $EB                                                               ;A88D94;
    dw $6100,$81EE                                                       ;A88D95;
    db $FB                                                               ;A88D99;
    dw $6108,$81EF                                                       ;A88D9A;
    db $01                                                               ;A88D9E;
    dw $6108,$81F1                                                       ;A88D9F;
    db $07                                                               ;A88DA3;
    dw $610C,$01FA                                                       ;A88DA4;
    db $10                                                               ;A88DA8;
    dw $6126,$01FA                                                       ;A88DA9;
    db $08                                                               ;A88DAD;
    dw $6125                                                             ;A88DAE;

Spritemap_Evir_E:
    dw $0009,$81F2                                                       ;A88DB0;
    db $FB                                                               ;A88DB4;
    dw $6106,$8002                                                       ;A88DB5;
    db $FB                                                               ;A88DB9;
    dw $6104,$81F2                                                       ;A88DBA;
    db $EB                                                               ;A88DBE;
    dw $6102,$8002                                                       ;A88DBF;
    db $EB                                                               ;A88DC3;
    dw $6100,$81EE                                                       ;A88DC4;
    db $FC                                                               ;A88DC8;
    dw $6108,$81EF                                                       ;A88DC9;
    db $02                                                               ;A88DCD;
    dw $6108,$81F1                                                       ;A88DCE;
    db $07                                                               ;A88DD2;
    dw $610C,$01FA                                                       ;A88DD3;
    db $10                                                               ;A88DD7;
    dw $6126,$01FA                                                       ;A88DD8;
    db $08                                                               ;A88DDC;
    dw $6125                                                             ;A88DDD;

Spritemap_Evir_F:
    dw $0009,$81F2                                                       ;A88DDF;
    db $FB                                                               ;A88DE3;
    dw $6106,$8002                                                       ;A88DE4;
    db $FB                                                               ;A88DE8;
    dw $6104,$81F2                                                       ;A88DE9;
    db $EB                                                               ;A88DED;
    dw $6102,$8002                                                       ;A88DEE;
    db $EB                                                               ;A88DF2;
    dw $6100,$81EE                                                       ;A88DF3;
    db $FD                                                               ;A88DF7;
    dw $6108,$81EF                                                       ;A88DF8;
    db $03                                                               ;A88DFC;
    dw $6108,$81F1                                                       ;A88DFD;
    db $08                                                               ;A88E01;
    dw $610C,$01FA                                                       ;A88E02;
    db $11                                                               ;A88E06;
    dw $6126,$01FA                                                       ;A88E07;
    db $09                                                               ;A88E0B;
    dw $6125                                                             ;A88E0C;

Spritemap_Evir_10:
    dw $0009,$81F2                                                       ;A88E0E;
    db $FB                                                               ;A88E12;
    dw $6106,$8002                                                       ;A88E13;
    db $FB                                                               ;A88E17;
    dw $6104,$81F2                                                       ;A88E18;
    db $EB                                                               ;A88E1C;
    dw $6102,$8002                                                       ;A88E1D;
    db $EB                                                               ;A88E21;
    dw $6100,$81EE                                                       ;A88E22;
    db $FD                                                               ;A88E26;
    dw $6108,$81EF                                                       ;A88E27;
    db $04                                                               ;A88E2B;
    dw $6108,$81F1                                                       ;A88E2C;
    db $09                                                               ;A88E30;
    dw $610C,$01FA                                                       ;A88E31;
    db $12                                                               ;A88E35;
    dw $6126,$01FA                                                       ;A88E36;
    db $0A                                                               ;A88E3A;
    dw $6125                                                             ;A88E3B;

Spritemap_Evir_11:
    dw $0009,$81F2                                                       ;A88E3D;
    db $FB                                                               ;A88E41;
    dw $6106,$8002                                                       ;A88E42;
    db $FB                                                               ;A88E46;
    dw $6104,$81F2                                                       ;A88E47;
    db $EB                                                               ;A88E4B;
    dw $6102,$8002                                                       ;A88E4C;
    db $EB                                                               ;A88E50;
    dw $6100,$81EE                                                       ;A88E51;
    db $FD                                                               ;A88E55;
    dw $6108,$81EF                                                       ;A88E56;
    db $04                                                               ;A88E5A;
    dw $6108,$81F1                                                       ;A88E5B;
    db $0A                                                               ;A88E5F;
    dw $610C,$01FA                                                       ;A88E60;
    db $11                                                               ;A88E64;
    dw $6126,$01FA                                                       ;A88E65;
    db $09                                                               ;A88E69;
    dw $6125                                                             ;A88E6A;

Spritemap_Evir_12:
    dw $0009,$81F2                                                       ;A88E6C;
    db $FB                                                               ;A88E70;
    dw $6106,$8002                                                       ;A88E71;
    db $FB                                                               ;A88E75;
    dw $6104,$81F2                                                       ;A88E76;
    db $EB                                                               ;A88E7A;
    dw $6102,$8002                                                       ;A88E7B;
    db $EB                                                               ;A88E7F;
    dw $6100,$81EE                                                       ;A88E80;
    db $FC                                                               ;A88E84;
    dw $6108,$81EF                                                       ;A88E85;
    db $03                                                               ;A88E89;
    dw $6108,$81F1                                                       ;A88E8A;
    db $09                                                               ;A88E8E;
    dw $610C,$01FA                                                       ;A88E8F;
    db $10                                                               ;A88E93;
    dw $6126,$01FA                                                       ;A88E94;
    db $08                                                               ;A88E98;
    dw $6125                                                             ;A88E99;

UNUSED_Spritemap_Evir_A88E9B:
    dw $0009,$81F2                                                       ;A88E9B;
    db $FB                                                               ;A88E9F;
    dw $6106,$8002                                                       ;A88EA0;
    db $FB                                                               ;A88EA4;
    dw $6104,$81F2                                                       ;A88EA5;
    db $EB                                                               ;A88EA9;
    dw $6102,$8002                                                       ;A88EAA;
    db $EB                                                               ;A88EAE;
    dw $6100,$81EE                                                       ;A88EAF;
    db $FB                                                               ;A88EB3;
    dw $6108,$81EF                                                       ;A88EB4;
    db $01                                                               ;A88EB8;
    dw $6108,$81F1                                                       ;A88EB9;
    db $07                                                               ;A88EBD;
    dw $610C,$01FA                                                       ;A88EBE;
    db $10                                                               ;A88EC2;
    dw $6126,$01FA                                                       ;A88EC3;
    db $08                                                               ;A88EC7;
    dw $6125                                                             ;A88EC8;

Spritemap_Evir_13:
    dw $0005,$01F8                                                       ;A88ECA;
    db $F8                                                               ;A88ECE;
    dw $6123,$0000                                                       ;A88ECF;
    db $F8                                                               ;A88ED3;
    dw $6122,$01FA                                                       ;A88ED4;
    db $F4                                                               ;A88ED8;
    dw $6121,$0002                                                       ;A88ED9;
    db $F4                                                               ;A88EDD;
    dw $6120,$01F6                                                       ;A88EDE;
    db $FC                                                               ;A88EE2;
    dw $6124                                                             ;A88EE3;

Spritemap_Evir_14:
    dw $0005,$01FA                                                       ;A88EE5;
    db $F4                                                               ;A88EE9;
    dw $6123,$0002                                                       ;A88EEA;
    db $F4                                                               ;A88EEE;
    dw $6122,$01F8                                                       ;A88EEF;
    db $F8                                                               ;A88EF3;
    dw $6124,$01F6                                                       ;A88EF4;
    db $FC                                                               ;A88EF8;
    dw $6123,$01FE                                                       ;A88EF9;
    db $FC                                                               ;A88EFD;
    dw $6122                                                             ;A88EFE;

Spritemap_Evir_15:
    dw $0005,$01FA                                                       ;A88F00;
    db $F4                                                               ;A88F04;
    dw $6124,$01F8                                                       ;A88F05;
    db $F8                                                               ;A88F09;
    dw $6123,$0000                                                       ;A88F0A;
    db $F8                                                               ;A88F0E;
    dw $6122,$01F6                                                       ;A88F0F;
    db $FC                                                               ;A88F13;
    dw $6121,$01FE                                                       ;A88F14;
    db $FC                                                               ;A88F18;
    dw $6120                                                             ;A88F19;

Spritemap_Evir_16:
    dw $0006,$01FA                                                       ;A88F1B;
    db $F4                                                               ;A88F1F;
    dw $6123,$0002                                                       ;A88F20;
    db $F4                                                               ;A88F24;
    dw $6122,$0000                                                       ;A88F25;
    db $F8                                                               ;A88F29;
    dw $6120,$01F8                                                       ;A88F2A;
    db $F8                                                               ;A88F2E;
    dw $6121,$01F6                                                       ;A88F2F;
    db $FC                                                               ;A88F33;
    dw $6123,$01FE                                                       ;A88F34;
    db $FC                                                               ;A88F38;
    dw $6122                                                             ;A88F39;

Spritemap_Evir_17:
    dw $0003,$01F6                                                       ;A88F3B;
    db $FC                                                               ;A88F3F;
    dw $6124,$01F8                                                       ;A88F40;
    db $F8                                                               ;A88F44;
    dw $6124,$01FA                                                       ;A88F45;
    db $F4                                                               ;A88F49;
    dw $6124                                                             ;A88F4A;

UNUSED_Spritemap_Evir_A88F4C:
    dw $0006,$01FA                                                       ;A88F4C;
    db $F4                                                               ;A88F50;
    dw $6123,$0002                                                       ;A88F51;
    db $F4                                                               ;A88F55;
    dw $6122,$01F8                                                       ;A88F56;
    db $F8                                                               ;A88F5A;
    dw $6123,$0000                                                       ;A88F5B;
    db $F8                                                               ;A88F5F;
    dw $6122,$01F6                                                       ;A88F60;
    db $FC                                                               ;A88F64;
    dw $6123,$01FE                                                       ;A88F65;
    db $FC                                                               ;A88F69;
    dw $6122                                                             ;A88F6A;

UNUSED_Spritemap_Evir_A88F6C:
    dw $0006,$01FA                                                       ;A88F6C;
    db $F4                                                               ;A88F70;
    dw $6121,$0002                                                       ;A88F71;
    db $F4                                                               ;A88F75;
    dw $6120,$0000                                                       ;A88F76;
    db $F8                                                               ;A88F7A;
    dw $6120,$01F8                                                       ;A88F7B;
    db $F8                                                               ;A88F7F;
    dw $6121,$01F6                                                       ;A88F80;
    db $FC                                                               ;A88F84;
    dw $6121,$01FE                                                       ;A88F85;
    db $FC                                                               ;A88F89;
    dw $6120                                                             ;A88F8A;

Palette_Eye:
    dw $3800,$72B2,$71C7,$2461,$1840,$7A8E,$660B,$4D03                   ;A88F8C;
    dw $4900,$7FE0,$7E80,$44E0,$2C20,$0000,$0000,$0000                   ;A88F9C;

InstList_Eye_Active:
    dw $000A                                                             ;A88FAC;
    dw Spritemap_Eye_7                                                   ;A88FAE;
    dw $000A                                                             ;A88FB0;
    dw Spritemap_Eye_7                                                   ;A88FB2;
    dw $000A                                                             ;A88FB4;
    dw Spritemap_Eye_8                                                   ;A88FB6;
    dw $000A                                                             ;A88FB8;
    dw Spritemap_Eye_9                                                   ;A88FBA;
    dw $000A                                                             ;A88FBC;
    dw Spritemap_Eye_A                                                   ;A88FBE;
    dw $000A                                                             ;A88FC0;
    dw Spritemap_Eye_B                                                   ;A88FC2;
    dw $000A                                                             ;A88FC4;
    dw Spritemap_Eye_C                                                   ;A88FC6;
    dw $000A                                                             ;A88FC8;
    dw Spritemap_Eye_D                                                   ;A88FCA;
    dw $000A                                                             ;A88FCC;
    dw Spritemap_Eye_6                                                   ;A88FCE;
    dw $000A                                                             ;A88FD0;
    dw Spritemap_Eye_5                                                   ;A88FD2;
    dw $000A                                                             ;A88FD4;
    dw Spritemap_Eye_4                                                   ;A88FD6;
    dw $000A                                                             ;A88FD8;
    dw Spritemap_Eye_3                                                   ;A88FDA;
    dw $000A                                                             ;A88FDC;
    dw Spritemap_Eye_2                                                   ;A88FDE;
    dw $000A                                                             ;A88FE0;
    dw Spritemap_Eye_1                                                   ;A88FE2;
    dw $000A                                                             ;A88FE4;
    dw Spritemap_Eye_0                                                   ;A88FE6;
    dw $000A                                                             ;A88FE8;
    dw Spritemap_Eye_0                                                   ;A88FEA;
    dw Instruction_Common_GotoY                                          ;A88FEC;
    dw InstList_Eye_Active                                               ;A88FEE;

InstList_Eye_FacingRight_Deactivating:
    dw $0008                                                             ;A88FF0;
    dw Spritemap_Eye_F                                                   ;A88FF2;
    dw $0030                                                             ;A88FF4;
    dw Spritemap_Eye_3                                                   ;A88FF6;
    dw $0005                                                             ;A88FF8;
    dw Spritemap_Eye_F                                                   ;A88FFA;

InstList_Eye_FacingRight_Closed:
    dw $0030                                                             ;A88FFC;
    dw Spritemap_Eye_E                                                   ;A88FFE;
    dw Instruction_Common_Sleep                                          ;A89000;

InstList_Eye_FacingLeft_Deactivating:
    dw $0008                                                             ;A89002;
    dw Spritemap_Eye_11                                                  ;A89004;
    dw $0030                                                             ;A89006;
    dw Spritemap_Eye_A                                                   ;A89008;
    dw $0005                                                             ;A8900A;
    dw Spritemap_Eye_11                                                  ;A8900C;

InstList_Eye_FacingLeft_Closed:
    dw $0030                                                             ;A8900E;
    dw Spritemap_Eye_10                                                  ;A89010;
    dw Instruction_Common_Sleep                                          ;A89012;

InstList_Eye_FacingRight_Activating:
    dw $0020                                                             ;A89014;
    dw Spritemap_Eye_E                                                   ;A89016;
    dw $0005                                                             ;A89018;
    dw Spritemap_Eye_F                                                   ;A8901A;
    dw $0030                                                             ;A8901C;
    dw Spritemap_Eye_3                                                   ;A8901E;
    dw $0008                                                             ;A89020;
    dw Spritemap_Eye_F                                                   ;A89022;
    dw Instruction_Common_Sleep                                          ;A89024;

InstList_Eye_FacingLeft_Activating:
    dw $0020                                                             ;A89026;
    dw Spritemap_Eye_10                                                  ;A89028;
    dw $0005                                                             ;A8902A;
    dw Spritemap_Eye_11                                                  ;A8902C;
    dw $0030                                                             ;A8902E;
    dw Spritemap_Eye_A                                                   ;A89030;
    dw $0008                                                             ;A89032;
    dw Spritemap_Eye_11                                                  ;A89034;
    dw Instruction_Common_Sleep                                          ;A89036;

InstList_Eye_Mount_FacingRight:
    dw $0001                                                             ;A89038;
    dw Spritemap_Eye_12                                                  ;A8903A;
    dw Instruction_Common_Sleep                                          ;A8903C;

InstList_Eye_Mount_FacingDown:
    dw $0001                                                             ;A8903E;
    dw Spritemap_Eye_13                                                  ;A89040;
    dw Instruction_Common_Sleep                                          ;A89042;

InstList_Eye_Mount_FacingLeft:
    dw $0001                                                             ;A89044;
    dw Spritemap_Eye_14                                                  ;A89046;
    dw Instruction_CommonA8_Sleep                                        ;A89048;

InstList_Eye_Mount_FacingUp:
    dw $0001                                                             ;A8904A;
    dw Spritemap_Eye_15                                                  ;A8904C;
    dw Instruction_CommonA8_Sleep                                        ;A8904E;

EyeConstants_XProximityToActivate:
    dw $0080                                                             ;A89050;

EyeConstants_XProximityToDeactivate:
    dw $00B0                                                             ;A89052;

EyeConstants_YProximityToActivate:
    dw $0080                                                             ;A89054;

EyeConstants_YProximityToDeactivate:
    dw $0080                                                             ;A89056;

InitAI_Eye:
    LDX.W $0E54                                                          ;A89058;
    LDA.W EnemyData.properties,X                                         ;A8905B;
    ORA.W #$2000                                                         ;A8905E;
    STA.W EnemyData.properties,X                                         ;A89061;
    LDA.W #Spritemap_CommonA8_Nothing                                    ;A89064;
    STA.W EnemyData.pSpritemap,X                                         ;A89067;
    LDA.W #$0001                                                         ;A8906A;
    STA.W EnemyData.instTimer,X                                          ;A8906D;
    STZ.W EnemyData.loopCounter,X                                        ;A89070;
    LDA.W EnemyData.initParam1,X                                         ;A89073;
    BMI .mountPart                                                       ;A89076;
    LDA.W #Function_Eye_WaitForSamusToGetNear                            ;A89078;
    STA.W EnemyData.work5,X                                              ;A8907B;
    LDA.W EnemyData.initParam0,X                                         ;A8907E;
    BIT.W #$0001                                                         ;A89081;
    BEQ .facingRight                                                     ;A89084;
    LDA.W #InstList_Eye_FacingLeft_Closed                                ;A89086;
    STA.W EnemyData.pInstList,X                                          ;A89089;
    BRA .return                                                          ;A8908C;


.facingRight:
    LDA.W #InstList_Eye_FacingRight_Closed                               ;A8908E;
    STA.W EnemyData.pInstList,X                                          ;A89091;
    BRA .return                                                          ;A89094;


.mountPart:
    AND.W #$000F                                                         ;A89096;
    ASL A                                                                ;A89099;
    TAY                                                                  ;A8909A;
    LDA.W EnemyData.xPosition,X                                          ;A8909B;
    CLC                                                                  ;A8909E;
    ADC.W .XOffsets,Y                                                    ;A8909F;
    STA.W EnemyData.xPosition,X                                          ;A890A2;
    LDA.W EnemyData.yPosition,X                                          ;A890A5;
    CLC                                                                  ;A890A8;
    ADC.W .YOffsets,Y                                                    ;A890A9;
    STA.W EnemyData.yPosition,X                                          ;A890AC;
    LDA.W #RTL_A891DC                                                    ;A890AF;
    STA.W EnemyData.work5,X                                              ;A890B2;
    LDA.W .instListPointers,Y                                            ;A890B5;
    STA.W EnemyData.pInstList,X                                          ;A890B8;
    LDX.W #$01FE                                                         ;A890BB;

.loop:
    LDA.W #$00FF                                                         ;A890BE;
    STA.L $7E9100,X                                                      ;A890C1;
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

MainAI_Eye:
    LDX.W $0E54                                                          ;A890E2;
    LDA.W $09A4                                                          ;A890E5;
    BIT.W #$0004                                                         ;A890E8;
    BEQ .return                                                          ;A890EB;
    JMP.W ($0FB2,X)                                                      ;A890ED;


.return:
    RTL                                                                  ;A890F0;


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
    STA.W EnemyData.work4,X                                              ;A89108;
    LDA.W #$0001                                                         ;A8910B;
    STA.W EnemyData.instTimer,X                                          ;A8910E;
    LDA.W EnemyData.initParam0,X                                         ;A89111;
    BIT.W #$0001                                                         ;A89114;
    BEQ .zeroParam                                                       ;A89117;
    LDA.W #InstList_Eye_FacingLeft_Activating                            ;A89119;
    STA.W EnemyData.pInstList,X                                          ;A8911C;
    BRA +                                                                ;A8911F;


.zeroParam:
    LDA.W #InstList_Eye_FacingRight_Activating                           ;A89121;
    STA.W EnemyData.pInstList,X                                          ;A89124;

  + LDA.W #Function_Eye_Activating                                       ;A89127;
    STA.W EnemyData.work5,X                                              ;A8912A;

.return:
    RTL                                                                  ;A8912D;


Function_Eye_Activating:
    DEC.W EnemyData.work4,X                                              ;A8912E;
    BEQ .timerExpired                                                    ;A89131;
    BPL .return                                                          ;A89133;

.timerExpired:
    LDA.W #$0017                                                         ;A89135;
    JSL.L QueueSound_Lib2_Max6                                           ;A89138;
    JSL.L Spawn_MorphBallEyeBeam_HDMAObject                              ;A8913C;
    LDA.W #Function_Eye_Active                                           ;A89140;
    STA.W EnemyData.work5,X                                              ;A89143;
    LDA.W $0AF6                                                          ;A89146;
    SEC                                                                  ;A89149;
    SBC.W EnemyData.xPosition,X                                          ;A8914A;
    STA.B $12                                                            ;A8914D;
    LDA.W $0AFA                                                          ;A8914F;
    SEC                                                                  ;A89152;
    SBC.W EnemyData.yPosition,X                                          ;A89153;
    STA.B $14                                                            ;A89156;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A89158;
    STA.W EnemyData.work3,X                                              ;A8915C;

.return:
    RTL                                                                  ;A8915F;


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
    STZ.W EnemyData.work2,X                                              ;A8917B;
    LDA.W #$0020                                                         ;A8917E;
    STA.W EnemyData.work4,X                                              ;A89181;
    LDA.W EnemyData.initParam0,X                                         ;A89184;
    BIT.W #$0001                                                         ;A89187;
    BEQ .zeroParam                                                       ;A8918A;
    LDA.W #InstList_Eye_FacingLeft_Deactivating                          ;A8918C;
    STA.W EnemyData.pInstList,X                                          ;A8918F;
    BRA +                                                                ;A89192;


.zeroParam:
    LDA.W #InstList_Eye_FacingRight_Deactivating                         ;A89194;
    STA.W EnemyData.pInstList,X                                          ;A89197;

  + LDA.W #Function_Eye_Deactivating                                     ;A8919A;
    STA.W EnemyData.work5,X                                              ;A8919D;
    BRA .merge                                                           ;A891A0;


.inProximity:
    LDA.W $0AF6                                                          ;A891A2;
    SEC                                                                  ;A891A5;
    SBC.W EnemyData.xPosition,X                                          ;A891A6;
    STA.B $12                                                            ;A891A9;
    LDA.W $0AFA                                                          ;A891AB;
    SEC                                                                  ;A891AE;
    SBC.W EnemyData.yPosition,X                                          ;A891AF;
    STA.B $14                                                            ;A891B2;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A891B4;
    STA.W EnemyData.work3,X                                              ;A891B8;
    AND.W #$00F0                                                         ;A891BB;
    LSR A                                                                ;A891BE;
    LSR A                                                                ;A891BF;
    CLC                                                                  ;A891C0;
    ADC.W #InstList_Eye_Active                                           ;A891C1;
    STA.W EnemyData.pInstList,X                                          ;A891C4;

.merge:
    LDA.W #$0001                                                         ;A891C7;
    STA.W EnemyData.instTimer,X                                          ;A891CA;
    RTL                                                                  ;A891CD;


Function_Eye_Deactivating:
    DEC.W EnemyData.work4,X                                              ;A891CE;
    BEQ .timerExpired                                                    ;A891D1;
    BPL .return                                                          ;A891D3;

.timerExpired:
    LDA.W #Function_Eye_WaitForSamusToGetNear                            ;A891D5;
    STA.W EnemyData.work5,X                                              ;A891D8;

.return:
    RTL                                                                  ;A891DB;


RTL_A891DC:
    RTL                                                                  ;A891DC;


RTL_A891DD:
    RTL                                                                  ;A891DD;


RTL_A891DE:
    RTL                                                                  ;A891DE;


Spritemap_Eye_0:
    dw $0001,$81F8                                                       ;A891DF;
    db $F8                                                               ;A891E3;
    dw $2100                                                             ;A891E4;

Spritemap_Eye_1:
    dw $0001,$81F8                                                       ;A891E6;
    db $F8                                                               ;A891EA;
    dw $2102                                                             ;A891EB;

Spritemap_Eye_2:
    dw $0001,$81F8                                                       ;A891ED;
    db $F8                                                               ;A891F1;
    dw $2104                                                             ;A891F2;

Spritemap_Eye_3:
    dw $0001,$81F8                                                       ;A891F4;
    db $F8                                                               ;A891F8;
    dw $2106                                                             ;A891F9;

Spritemap_Eye_4:
    dw $0001,$81F8                                                       ;A891FB;
    db $F8                                                               ;A891FF;
    dw $2108                                                             ;A89200;

Spritemap_Eye_5:
    dw $0001,$81F8                                                       ;A89202;
    db $F8                                                               ;A89206;
    dw $210A                                                             ;A89207;

Spritemap_Eye_6:
    dw $0001,$81F8                                                       ;A89209;
    db $F8                                                               ;A8920D;
    dw $210C                                                             ;A8920E;

Spritemap_Eye_7:
    dw $0001,$81F8                                                       ;A89210;
    db $F8                                                               ;A89214;
    dw $6100                                                             ;A89215;

Spritemap_Eye_8:
    dw $0001,$81F8                                                       ;A89217;
    db $F8                                                               ;A8921B;
    dw $6102                                                             ;A8921C;

Spritemap_Eye_9:
    dw $0001,$81F8                                                       ;A8921E;
    db $F8                                                               ;A89222;
    dw $6104                                                             ;A89223;

Spritemap_Eye_A:
    dw $0001,$81F8                                                       ;A89225;
    db $F8                                                               ;A89229;
    dw $6106                                                             ;A8922A;

Spritemap_Eye_B:
    dw $0001,$81F8                                                       ;A8922C;
    db $F8                                                               ;A89230;
    dw $6108                                                             ;A89231;

Spritemap_Eye_C:
    dw $0001,$81F8                                                       ;A89233;
    db $F8                                                               ;A89237;
    dw $610A                                                             ;A89238;

Spritemap_Eye_D:
    dw $0001,$81F8                                                       ;A8923A;
    db $F8                                                               ;A8923E;
    dw $610C                                                             ;A8923F;

Spritemap_Eye_E:
    dw $0004,$01F8                                                       ;A89241;
    db $00                                                               ;A89245;
    dw $A11F,$01F8                                                       ;A89246;
    db $F8                                                               ;A8924A;
    dw $211F,$0000                                                       ;A8924B;
    db $00                                                               ;A8924F;
    dw $2117,$0000                                                       ;A89250;
    db $F8                                                               ;A89254;
    dw $2107                                                             ;A89255;

Spritemap_Eye_F:
    dw $0004,$01F8                                                       ;A89257;
    db $00                                                               ;A8925B;
    dw $A11E,$01F8                                                       ;A8925C;
    db $F8                                                               ;A89260;
    dw $211E,$0000                                                       ;A89261;
    db $00                                                               ;A89265;
    dw $2117,$0000                                                       ;A89266;
    db $F8                                                               ;A8926A;
    dw $2107                                                             ;A8926B;

Spritemap_Eye_10:
    dw $0004,$0000                                                       ;A8926D;
    db $00                                                               ;A89271;
    dw $E11F,$0000                                                       ;A89272;
    db $F8                                                               ;A89276;
    dw $611F,$01F8                                                       ;A89277;
    db $00                                                               ;A8927B;
    dw $6117,$01F8                                                       ;A8927C;
    db $F8                                                               ;A89280;
    dw $6107                                                             ;A89281;

Spritemap_Eye_11:
    dw $0004,$0000                                                       ;A89283;
    db $00                                                               ;A89287;
    dw $E11E,$0000                                                       ;A89288;
    db $F8                                                               ;A8928C;
    dw $611E,$01F8                                                       ;A8928D;
    db $00                                                               ;A89291;
    dw $6117,$01F8                                                       ;A89292;
    db $F8                                                               ;A89296;
    dw $6107                                                             ;A89297;

Spritemap_Eye_12:
    dw $0002,$01FC                                                       ;A89299;
    db $00                                                               ;A8929D;
    dw $A10E,$01FC                                                       ;A8929E;
    db $F8                                                               ;A892A2;
    dw $210E                                                             ;A892A3;

Spritemap_Eye_13:
    dw $0002,$0000                                                       ;A892A5;
    db $FC                                                               ;A892A9;
    dw $610F,$01F8                                                       ;A892AA;
    db $FC                                                               ;A892AE;
    dw $210F                                                             ;A892AF;

Spritemap_Eye_14:
    dw $0002,$01FC                                                       ;A892B1;
    db $00                                                               ;A892B5;
    dw $E10E,$01FC                                                       ;A892B6;
    db $F8                                                               ;A892BA;
    dw $610E                                                             ;A892BB;

Spritemap_Eye_15:
    dw $0002,$0000                                                       ;A892BD;
    db $FC                                                               ;A892C1;
    dw $E10F,$01F8                                                       ;A892C2;
    db $FC                                                               ;A892C6;
    dw $A10F                                                             ;A892C7;

Spritemap_Eye_16:
    dw $0004,$01F8                                                       ;A892C9;
    db $00                                                               ;A892CD;
    dw $A11F,$01F8                                                       ;A892CE;
    db $F8                                                               ;A892D2;
    dw $211F,$0000                                                       ;A892D3;
    db $00                                                               ;A892D7;
    dw $2117,$0000                                                       ;A892D8;
    db $F8                                                               ;A892DC;
    dw $2107                                                             ;A892DD;

Spritemap_Eye_17:
    dw $0004,$01F8                                                       ;A892DF;
    db $00                                                               ;A892E3;
    dw $A11E,$01F8                                                       ;A892E4;
    db $F8                                                               ;A892E8;
    dw $211E,$0000                                                       ;A892E9;
    db $00                                                               ;A892ED;
    dw $2117,$0000                                                       ;A892EE;
    db $F8                                                               ;A892F2;
    dw $2107                                                             ;A892F3;

Spritemap_Eye_18:
    dw $0004,$0000                                                       ;A892F5;
    db $00                                                               ;A892F9;
    dw $E11F,$0000                                                       ;A892FA;
    db $F8                                                               ;A892FE;
    dw $611F,$01F8                                                       ;A892FF;
    db $00                                                               ;A89303;
    dw $6117,$01F8                                                       ;A89304;
    db $F8                                                               ;A89308;
    dw $6107                                                             ;A89309;

Spritemap_Eye_19:
    dw $0004,$0000                                                       ;A8930B;
    db $00                                                               ;A8930F;
    dw $E11E,$0000                                                       ;A89310;
    db $F8                                                               ;A89314;
    dw $611E,$01F8                                                       ;A89315;
    db $00                                                               ;A89319;
    dw $6117,$01F8                                                       ;A8931A;
    db $F8                                                               ;A8931E;
    dw $6107                                                             ;A8931F;

Spritemap_Eye_1A:
    dw $0004,$0000                                                       ;A89321;
    db $00                                                               ;A89325;
    dw $E11F,$0000                                                       ;A89326;
    db $F8                                                               ;A8932A;
    dw $611F,$01F8                                                       ;A8932B;
    db $00                                                               ;A8932F;
    dw $6117,$01F8                                                       ;A89330;
    db $F8                                                               ;A89334;
    dw $6107                                                             ;A89335;

Spritemap_Eye_1B:
    dw $0004,$0000                                                       ;A89337;
    db $00                                                               ;A8933B;
    dw $E11E,$0000                                                       ;A8933C;
    db $F8                                                               ;A89340;
    dw $611E,$01F8                                                       ;A89341;
    db $00                                                               ;A89345;
    dw $6117,$01F8                                                       ;A89346;
    db $F8                                                               ;A8934A;
    dw $6107                                                             ;A8934B;

Spritemap_Eye_1C:
    dw $0004,$01F8                                                       ;A8934D;
    db $00                                                               ;A89351;
    dw $A11F,$01F8                                                       ;A89352;
    db $F8                                                               ;A89356;
    dw $211F,$0000                                                       ;A89357;
    db $00                                                               ;A8935B;
    dw $2117,$0000                                                       ;A8935C;
    db $F8                                                               ;A89360;
    dw $2107                                                             ;A89361;

Spritemap_Eye_1D:
    dw $0004,$01F8                                                       ;A89363;
    db $00                                                               ;A89367;
    dw $A11E,$01F8                                                       ;A89368;
    db $F8                                                               ;A8936C;
    dw $211E,$0000                                                       ;A8936D;
    db $00                                                               ;A89371;
    dw $2117,$0000                                                       ;A89372;
    db $F8                                                               ;A89376;
    dw $2107                                                             ;A89377;

Palette_Fune:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD                   ;A89379;
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A                   ;A89389;

InstList_Fune_FacingLeft_Idling:
    dw $0001                                                             ;A89399;
    dw Spritemap_Fune_FacingLeft_Idle_MouthClosed                        ;A8939B;
    dw Instruction_Common_Sleep                                          ;A8939D;

InstList_Fune_FacingLeft_Active:
    dw $0010                                                             ;A8939F;
    dw Spritemap_Fune_FacingLeft_Idle_MouthClosed                        ;A893A1;
    dw $0008                                                             ;A893A3;
    dw Spritemap_Fune_FacingLeft_StartOpeningMouth                       ;A893A5;
    dw $0008                                                             ;A893A7;
    dw Spritemap_Fune_FacingLeft_MouthOpening1                           ;A893A9;
    dw $0008                                                             ;A893AB;
    dw Spritemap_Fune_FacingLeft_MouthOpening2                           ;A893AD;
    dw Instruction_Fune_SpawnFireball_FacingLeft                         ;A893AF;
    dw Instruction_FuneNamihe_QueueSpitSFX                               ;A893B1;
    dw $0010                                                             ;A893B3;
    dw Spritemap_Fune_FacingLeft_MouthMostOpen                           ;A893B5;
    dw $0008                                                             ;A893B7;
    dw Spritemap_Fune_FacingLeft_MouthOpening2                           ;A893B9;
    dw $0008                                                             ;A893BB;
    dw Spritemap_Fune_FacingLeft_MouthOpening1                           ;A893BD;
    dw $0008                                                             ;A893BF;
    dw Spritemap_Fune_FacingLeft_StartOpeningMouth                       ;A893C1;
    dw Instruction_FuneNamihe_FinishActivity                             ;A893C3;
    dw Instruction_Common_GotoY                                          ;A893C5;
    dw InstList_Fune_FacingLeft_Idling                                   ;A893C7;

InstList_Fune_FacingRight_Idling:
    dw $0001                                                             ;A893C9;
    dw Spritemap_Fune_FacingRight_Idle_MouthClosed                       ;A893CB;
    dw Instruction_Common_Sleep                                          ;A893CD;

InstList_Fune_FacingRight_Active:
    dw $0010                                                             ;A893CF;
    dw Spritemap_Fune_FacingRight_Idle_MouthClosed                       ;A893D1;
    dw $0008                                                             ;A893D3;
    dw Spritemap_Fune_FacingRight_StartOpeningMouth                      ;A893D5;
    dw $0008                                                             ;A893D7;
    dw Spritemap_Fune_FacingRight_MouthOpening1                          ;A893D9;
    dw $0008                                                             ;A893DB;
    dw Spritemap_Fune_FacingRight_MouthOpening2                          ;A893DD;
    dw Instruction_Fune_SpawnFireball_FacingRight                        ;A893DF;
    dw Instruction_FuneNamihe_QueueSpitSFX                               ;A893E1;
    dw $0010                                                             ;A893E3;
    dw Spritemap_Fune_FacingRight_MouthMostOpen                          ;A893E5;
    dw $0008                                                             ;A893E7;
    dw Spritemap_Fune_FacingRight_MouthOpening2                          ;A893E9;
    dw $0008                                                             ;A893EB;
    dw Spritemap_Fune_FacingRight_MouthOpening1                          ;A893ED;
    dw $0008                                                             ;A893EF;
    dw Spritemap_Fune_FacingRight_StartOpeningMouth                      ;A893F1;
    dw Instruction_FuneNamihe_FinishActivity_duplicate                   ;A893F3;
    dw Instruction_Common_GotoY                                          ;A893F5;
    dw InstList_Fune_FacingRight_Idling                                  ;A893F7;

Spritemap_Fune_FacingLeft_Idle_MouthClosed:
    dw $0008,$0008                                                       ;A893F9;
    db $0C                                                               ;A893FD;
    dw $2127,$0000                                                       ;A893FE;
    db $0C                                                               ;A89402;
    dw $2126,$8000                                                       ;A89403;
    db $FC                                                               ;A89407;
    dw $2122,$8000                                                       ;A89408;
    db $EC                                                               ;A8940C;
    dw $2120,$81F0                                                       ;A8940D;
    db $FC                                                               ;A89411;
    dw $2102,$01F8                                                       ;A89412;
    db $FC                                                               ;A89416;
    dw $2125,$01F0                                                       ;A89417;
    db $FC                                                               ;A8941B;
    dw $2124,$81F0                                                       ;A8941C;
    db $EC                                                               ;A89420;
    dw $2100                                                             ;A89421;

Spritemap_Fune_FacingLeft_StartOpeningMouth:
    dw $0008,$0006                                                       ;A89423;
    db $0C                                                               ;A89427;
    dw $2127,$01FE                                                       ;A89428;
    db $0C                                                               ;A8942C;
    dw $2126,$81FE                                                       ;A8942D;
    db $FC                                                               ;A89431;
    dw $2122,$81FE                                                       ;A89432;
    db $EC                                                               ;A89436;
    dw $2120,$81EE                                                       ;A89437;
    db $FE                                                               ;A8943B;
    dw $2102,$01F6                                                       ;A8943C;
    db $FC                                                               ;A89440;
    dw $2125,$01EE                                                       ;A89441;
    db $FC                                                               ;A89445;
    dw $2124,$81EE                                                       ;A89446;
    db $EC                                                               ;A8944A;
    dw $2100                                                             ;A8944B;

Spritemap_Fune_FacingLeft_MouthOpening1:
    dw $0008,$0004                                                       ;A8944D;
    db $0C                                                               ;A89451;
    dw $2127,$01FC                                                       ;A89452;
    db $0C                                                               ;A89456;
    dw $2126,$81FC                                                       ;A89457;
    db $FC                                                               ;A8945B;
    dw $2122,$81FC                                                       ;A8945C;
    db $EC                                                               ;A89460;
    dw $2120,$81EC                                                       ;A89461;
    db $00                                                               ;A89465;
    dw $2102,$01F4                                                       ;A89466;
    db $FC                                                               ;A8946A;
    dw $2125,$01EC                                                       ;A8946B;
    db $FC                                                               ;A8946F;
    dw $2124,$81EC                                                       ;A89470;
    db $EC                                                               ;A89474;
    dw $2100                                                             ;A89475;

Spritemap_Fune_FacingLeft_MouthOpening2:
    dw $0008,$0002                                                       ;A89477;
    db $0C                                                               ;A8947B;
    dw $2127,$01FA                                                       ;A8947C;
    db $0C                                                               ;A89480;
    dw $2126,$81FA                                                       ;A89481;
    db $FC                                                               ;A89485;
    dw $2122,$81FA                                                       ;A89486;
    db $EC                                                               ;A8948A;
    dw $2120,$81EA                                                       ;A8948B;
    db $01                                                               ;A8948F;
    dw $2102,$01F2                                                       ;A89490;
    db $FC                                                               ;A89494;
    dw $2125,$01EA                                                       ;A89495;
    db $FC                                                               ;A89499;
    dw $2124,$81EA                                                       ;A8949A;
    db $EC                                                               ;A8949E;
    dw $2100                                                             ;A8949F;

Spritemap_Fune_FacingLeft_MouthMostOpen:
    dw $0008,$0000                                                       ;A894A1;
    db $0C                                                               ;A894A5;
    dw $2127,$01F8                                                       ;A894A6;
    db $0C                                                               ;A894AA;
    dw $2126,$81F8                                                       ;A894AB;
    db $FC                                                               ;A894AF;
    dw $2122,$81F8                                                       ;A894B0;
    db $EC                                                               ;A894B4;
    dw $2120,$81E8                                                       ;A894B5;
    db $03                                                               ;A894B9;
    dw $2102,$01F0                                                       ;A894BA;
    db $FC                                                               ;A894BE;
    dw $2125,$01E8                                                       ;A894BF;
    db $FC                                                               ;A894C3;
    dw $2124,$81E8                                                       ;A894C4;
    db $EC                                                               ;A894C8;
    dw $2100                                                             ;A894C9;

Spritemap_Fune_FacingRight_Idle_MouthClosed:
    dw $0008,$01F0                                                       ;A894CB;
    db $0C                                                               ;A894CF;
    dw $6127,$01F8                                                       ;A894D0;
    db $0C                                                               ;A894D4;
    dw $6126,$81F0                                                       ;A894D5;
    db $FC                                                               ;A894D9;
    dw $6122,$81F0                                                       ;A894DA;
    db $EC                                                               ;A894DE;
    dw $6120,$8000                                                       ;A894DF;
    db $FC                                                               ;A894E3;
    dw $6102,$0000                                                       ;A894E4;
    db $FC                                                               ;A894E8;
    dw $6125,$0008                                                       ;A894E9;
    db $FC                                                               ;A894ED;
    dw $6124,$8000                                                       ;A894EE;
    db $EC                                                               ;A894F2;
    dw $6100                                                             ;A894F3;

Spritemap_Fune_FacingRight_StartOpeningMouth:
    dw $0008,$01F2                                                       ;A894F5;
    db $0C                                                               ;A894F9;
    dw $6127,$01FA                                                       ;A894FA;
    db $0C                                                               ;A894FE;
    dw $6126,$81F2                                                       ;A894FF;
    db $FC                                                               ;A89503;
    dw $6122,$81F2                                                       ;A89504;
    db $EC                                                               ;A89508;
    dw $6120,$8002                                                       ;A89509;
    db $FE                                                               ;A8950D;
    dw $6102,$0002                                                       ;A8950E;
    db $FC                                                               ;A89512;
    dw $6125,$000A                                                       ;A89513;
    db $FC                                                               ;A89517;
    dw $6124,$8002                                                       ;A89518;
    db $EC                                                               ;A8951C;
    dw $6100                                                             ;A8951D;

Spritemap_Fune_FacingRight_MouthOpening1:
    dw $0008,$01F4                                                       ;A8951F;
    db $0C                                                               ;A89523;
    dw $6127,$01FC                                                       ;A89524;
    db $0C                                                               ;A89528;
    dw $6126,$81F4                                                       ;A89529;
    db $FC                                                               ;A8952D;
    dw $6122,$81F4                                                       ;A8952E;
    db $EC                                                               ;A89532;
    dw $6120,$8004                                                       ;A89533;
    db $00                                                               ;A89537;
    dw $6102,$0004                                                       ;A89538;
    db $FC                                                               ;A8953C;
    dw $6125,$000C                                                       ;A8953D;
    db $FC                                                               ;A89541;
    dw $6124,$8004                                                       ;A89542;
    db $EC                                                               ;A89546;
    dw $6100                                                             ;A89547;

Spritemap_Fune_FacingRight_MouthOpening2:
    dw $0008,$01F6                                                       ;A89549;
    db $0C                                                               ;A8954D;
    dw $6127,$01FE                                                       ;A8954E;
    db $0C                                                               ;A89552;
    dw $6126,$81F6                                                       ;A89553;
    db $FC                                                               ;A89557;
    dw $6122,$81F6                                                       ;A89558;
    db $EC                                                               ;A8955C;
    dw $6120,$8006                                                       ;A8955D;
    db $01                                                               ;A89561;
    dw $6102,$0006                                                       ;A89562;
    db $FC                                                               ;A89566;
    dw $6125,$000E                                                       ;A89567;
    db $FC                                                               ;A8956B;
    dw $6124,$8006                                                       ;A8956C;
    db $EC                                                               ;A89570;
    dw $6100                                                             ;A89571;

Spritemap_Fune_FacingRight_MouthMostOpen:
    dw $0008,$01F8                                                       ;A89573;
    db $0C                                                               ;A89577;
    dw $6127,$0000                                                       ;A89578;
    db $0C                                                               ;A8957C;
    dw $6126,$81F8                                                       ;A8957D;
    db $FC                                                               ;A89581;
    dw $6122,$81F8                                                       ;A89582;
    db $EC                                                               ;A89586;
    dw $6120,$8007                                                       ;A89587;
    db $02                                                               ;A8958B;
    dw $6102,$0008                                                       ;A8958C;
    db $FC                                                               ;A89590;
    dw $6125,$0010                                                       ;A89591;
    db $FC                                                               ;A89595;
    dw $6124,$8008                                                       ;A89596;
    db $EC                                                               ;A8959A;
    dw $6100                                                             ;A8959B;

Palette_Namihe:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD                   ;A8959D;
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A                   ;A895AD;

InstList_Namihe_FacingLeft_Idling:
    dw $0001                                                             ;A895BD;
    dw Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened                   ;A895BF;
    dw Instruction_Common_Sleep                                          ;A895C1;

InstList_Namihe_FacingLeft_Active:
    dw $0008                                                             ;A895C3;
    dw Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened                   ;A895C5;
    dw $0008                                                             ;A895C7;
    dw Spritemap_Namihe_FacingLeft_EyeOpened                             ;A895C9;
    dw $0008                                                             ;A895CB;
    dw Spritemap_Namihe_FacingLeft_StartOpeningMouth                     ;A895CD;
    dw $0008                                                             ;A895CF;
    dw Spritemap_Namihe_FacingLeft_MouthOpening1                         ;A895D1;
    dw $0008                                                             ;A895D3;
    dw Spritemap_Namihe_FacingLeft_MouthOpening2                         ;A895D5;
    dw Instruction_Namihe_SpawnFireball_FacingLeft                       ;A895D7;
    dw Instruction_FuneNamihe_QueueSpitSFX                               ;A895D9;
    dw $0008                                                             ;A895DB;
    dw Spritemap_Namihe_FacingLeft_MouthMostOpen                         ;A895DD;
    dw $0008                                                             ;A895DF;
    dw Spritemap_Namihe_FacingLeft_MouthOpening2                         ;A895E1;
    dw $0008                                                             ;A895E3;
    dw Spritemap_Namihe_FacingLeft_MouthOpening1                         ;A895E5;
    dw $0008                                                             ;A895E7;
    dw Spritemap_Namihe_FacingLeft_StartOpeningMouth                     ;A895E9;
    dw Instruction_FuneNamihe_FinishActivity                             ;A895EB;
    dw Instruction_Common_GotoY                                          ;A895ED;
    dw InstList_Namihe_FacingLeft_Idling                                 ;A895EF;

InstList_Namihe_FacingRight_Idling:
    dw $0001                                                             ;A895F1;
    dw Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed                  ;A895F3;
    dw Instruction_Common_Sleep                                          ;A895F5;

InstList_Namihe_FacingRight_Active:
    dw $0008                                                             ;A895F7;
    dw Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed                  ;A895F9;
    dw $0008                                                             ;A895FB;
    dw Spritemap_Namihe_FacingRight_EyeOpened                            ;A895FD;
    dw $0008                                                             ;A895FF;
    dw Spritemap_Namihe_FacingRight_StartOpeningMouth                    ;A89601;
    dw $0008                                                             ;A89603;
    dw Spritemap_Namihe_FacingRight_MouthOpening1                        ;A89605;
    dw $0008                                                             ;A89607;
    dw Spritemap_Namihe_FacingRight_MouthOpening2                        ;A89609;
    dw Instruction_Namihe_SpawnFireball_FacingRight                      ;A8960B;
    dw Instruction_FuneNamihe_QueueSpitSFX                               ;A8960D;
    dw $0008                                                             ;A8960F;
    dw Spritemap_Namihe_FacingRight_MouthMostOpen                        ;A89611;
    dw $0008                                                             ;A89613;
    dw Spritemap_Namihe_FacingRight_MouthOpening2                        ;A89615;
    dw $0008                                                             ;A89617;
    dw Spritemap_Namihe_FacingRight_MouthOpening1                        ;A89619;
    dw $0008                                                             ;A8961B;
    dw Spritemap_Namihe_FacingRight_StartOpeningMouth                    ;A8961D;
    dw Instruction_FuneNamihe_FinishActivity_duplicate                   ;A8961F;
    dw Instruction_Common_GotoY                                          ;A89621;
    dw InstList_Namihe_FacingRight_Idling                                ;A89623;

Instruction_FuneNamihe_QueueSpitSFX:
    PHY                                                                  ;A89625;
    PHX                                                                  ;A89626;
    LDA.W #$001F                                                         ;A89627;
    JSL.L QueueSound_Lib2_Max9                                           ;A8962A;
    PLX                                                                  ;A8962E;
    PLY                                                                  ;A8962F;
    RTL                                                                  ;A89630;


Instruction_Namihe_SpawnFireball_FacingLeft:
    PHY                                                                  ;A89631;
    LDX.W $0E54                                                          ;A89632;
    LDA.W EnemyData.initParam1,X                                         ;A89635;
    AND.W #$00FF                                                         ;A89638;
    STA.W $1995                                                          ;A8963B;
    LDA.W #$0000                                                         ;A8963E;
    LDY.W #EnemyProjectile_NamiheFireball                                ;A89641;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A89644;
    PLY                                                                  ;A89648;
    RTL                                                                  ;A89649;


Instruction_Namihe_SpawnFireball_FacingRight:
    PHY                                                                  ;A8964A;
    LDX.W $0E54                                                          ;A8964B;
    LDA.W EnemyData.initParam1,X                                         ;A8964E;
    AND.W #$00FF                                                         ;A89651;
    STA.W $1995                                                          ;A89654;
    LDA.W #$0001                                                         ;A89657;
    LDY.W #EnemyProjectile_NamiheFireball                                ;A8965A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8965D;
    PLY                                                                  ;A89661;
    RTL                                                                  ;A89662;


Instruction_Fune_SpawnFireball_FacingLeft:
    PHY                                                                  ;A89663;
    LDX.W $0E54                                                          ;A89664;
    LDA.W EnemyData.initParam1,X                                         ;A89667;
    AND.W #$00FF                                                         ;A8966A;
    STA.W $1995                                                          ;A8966D;
    LDA.W #$0000                                                         ;A89670;
    LDY.W #EnemyProjectile_FuneFireball                                  ;A89673;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A89676;
    PLY                                                                  ;A8967A;
    RTL                                                                  ;A8967B;


Instruction_Fune_SpawnFireball_FacingRight:
    PHY                                                                  ;A8967C;
    LDX.W $0E54                                                          ;A8967D;
    LDA.W EnemyData.initParam1,X                                         ;A89680;
    AND.W #$00FF                                                         ;A89683;
    STA.W $1995                                                          ;A89686;
    LDA.W #$0001                                                         ;A89689;
    LDY.W #EnemyProjectile_FuneFireball                                  ;A8968C;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8968F;
    PLY                                                                  ;A89693;
    RTL                                                                  ;A89694;


Instruction_FuneNamihe_FinishActivity:
    LDX.W $0E54                                                          ;A89695;
    LDA.W EnemyData.work0,X                                              ;A89698;
    INC A                                                                ;A8969B;
    INC A                                                                ;A8969C;
    INC A                                                                ;A8969D;
    INC A                                                                ;A8969E;
    STA.W EnemyData.work0,X                                              ;A8969F;
    LDA.W #Function_Fune_WaitForTimer                                    ;A896A2;
    STA.W EnemyData.work1,X                                              ;A896A5;
    LDA.W EnemyData.work3,X                                              ;A896A8;
    BEQ .return                                                          ;A896AB;
    LDA.W #Function_Namihe_WaitForSamusToGetNear                         ;A896AD;
    STA.W EnemyData.work1,X                                              ;A896B0;

.return:
    RTL                                                                  ;A896B3;


Instruction_FuneNamihe_FinishActivity_duplicate:
    LDX.W $0E54                                                          ;A896B4;
    LDA.W EnemyData.work0,X                                              ;A896B7;
    INC A                                                                ;A896BA;
    INC A                                                                ;A896BB;
    INC A                                                                ;A896BC;
    INC A                                                                ;A896BD;
    STA.W EnemyData.work0,X                                              ;A896BE;
    LDA.W #Function_Fune_WaitForTimer                                    ;A896C1;
    STA.W EnemyData.work1,X                                              ;A896C4;
    LDA.W EnemyData.work3,X                                              ;A896C7;
    BEQ .return                                                          ;A896CA;
    LDA.W #Function_Namihe_WaitForSamusToGetNear                         ;A896CC;
    STA.W EnemyData.work1,X                                              ;A896CF;

.return:
    RTL                                                                  ;A896D2;


InstListPointers_Fune_Namihe:
    dw InstList_Fune_FacingLeft_Active                                   ;A896D3;
    dw InstList_Fune_FacingRight_Active                                  ;A896D5;
    dw InstList_Fune_FacingLeft_Idling                                   ;A896D7;
    dw InstList_Fune_FacingRight_Idling                                  ;A896D9;
    dw InstList_Namihe_FacingLeft_Active                                 ;A896DB;
    dw InstList_Namihe_FacingRight_Active                                ;A896DD;
    dw InstList_Namihe_FacingLeft_Idling                                 ;A896DF;
    dw InstList_Namihe_FacingRight_Idling                                ;A896E1;

InitAI_Fune_Namihe:
    LDX.W $0E54                                                          ;A896E3;
    LDA.W #InstListPointers_Fune_Namihe+$4                               ;A896E6;
    STA.W EnemyData.work0,X                                              ;A896E9;
    LDA.W #Function_Fune_WaitForTimer                                    ;A896EC;
    STA.W EnemyData.work1,X                                              ;A896EF;
    LDA.W EnemyData.initParam0,X                                         ;A896F2;
    AND.W #$000F                                                         ;A896F5;
    STA.W EnemyData.work3,X                                              ;A896F8;
    BEQ .speciesDetermined                                               ;A896FB;
    LDA.W #InstListPointers_Fune_Namihe+$C                               ;A896FD;
    STA.W EnemyData.work0,X                                              ;A89700;
    LDA.W #Function_Namihe_WaitForSamusToGetNear                         ;A89703;
    STA.W EnemyData.work1,X                                              ;A89706;

.speciesDetermined:
    LDA.W EnemyData.initParam0,X                                         ;A89709;
    AND.W #$00F0                                                         ;A8970C;
    BEQ .directionDetermined                                             ;A8970F;
    INC.W EnemyData.work0,X                                              ;A89711;
    INC.W EnemyData.work0,X                                              ;A89714;

.directionDetermined:
    JSR.W SetFuneNamiheInstList                                          ;A89717;
    LDA.W EnemyData.initParam1+1,X                                       ;A8971A;
    AND.W #$00FF                                                         ;A8971D;
    STA.W EnemyData.work2,X                                              ;A89720;
    LDA.W EnemyData.initParam0+1,X                                       ;A89723;
    AND.W #$00FF                                                         ;A89726;
    STA.W EnemyData.work5,X                                              ;A89729;
    STZ.W EnemyData.work4,X                                              ;A8972C;
    RTL                                                                  ;A8972F;


MainAI_Fune_Namihe:
    LDX.W $0E54                                                          ;A89730;
    JSR.W ($0FAA,X)                                                      ;A89733;
    RTL                                                                  ;A89736;


Function_Fune_WaitForTimer:
    LDX.W $0E54                                                          ;A89737;
    INC.W EnemyData.work4,X                                              ;A8973A;
    LDA.W EnemyData.work4,X                                              ;A8973D;
    CMP.W EnemyData.work5,X                                              ;A89740;
    BMI .return                                                          ;A89743;
    LDA.W EnemyData.work0,X                                              ;A89745;
    DEC A                                                                ;A89748;
    DEC A                                                                ;A89749;
    DEC A                                                                ;A8974A;
    DEC A                                                                ;A8974B;
    STA.W EnemyData.work0,X                                              ;A8974C;
    JSR.W SetFuneNamiheInstList                                          ;A8974F;
    LDA.W #RTS_A8978E                                                    ;A89752;
    STA.W EnemyData.work1,X                                              ;A89755;
    STZ.W EnemyData.work4,X                                              ;A89758;

.return:
    RTS                                                                  ;A8975B;


Function_Namihe_WaitForSamusToGetNear:
    LDX.W $0E54                                                          ;A8975C;
    LDA.W EnemyData.work0,X                                              ;A8975F;
    STA.L $7E7800,X                                                      ;A89762;
    JSR.W Namihe_CheckIfSamusIsInProximity                               ;A89766;
    BEQ .notInProximity                                                  ;A89769;
    LDA.L $7E7800,X                                                      ;A8976B;
    STA.W EnemyData.work0,X                                              ;A8976F;
    DEC A                                                                ;A89772;
    DEC A                                                                ;A89773;
    DEC A                                                                ;A89774;
    DEC A                                                                ;A89775;
    STA.L $7E7800,X                                                      ;A89776;
    STA.W EnemyData.work0,X                                              ;A8977A;
    JSR.W SetFuneNamiheInstList                                          ;A8977D;
    LDA.W #RTS_A8978F                                                    ;A89780;
    STA.W EnemyData.work1,X                                              ;A89783;

.notInProximity:
    LDA.L $7E7800,X                                                      ;A89786;
    STA.W EnemyData.work0,X                                              ;A8978A;
    RTS                                                                  ;A8978D;


RTS_A8978E:
    RTS                                                                  ;A8978E;


RTS_A8978F:
    RTS                                                                  ;A8978F;


Namihe_CheckIfSamusIsInProximity:
    LDX.W $0E54                                                          ;A89790;
    LDA.W EnemyData.work2,X                                              ;A89793;
    JSL.L IsSamusWithingAPixelRowsOfEnemy                                ;A89796;
    RTS                                                                  ;A8979A;


SetFuneNamiheInstList:
    LDX.W $0E54                                                          ;A8979B;
    LDA.W #$0001                                                         ;A8979E;
    STA.W EnemyData.instTimer,X                                          ;A897A1;
    STZ.W EnemyData.loopCounter,X                                        ;A897A4;
    LDA.W EnemyData.work0,X                                              ;A897A7;
    TAY                                                                  ;A897AA;
    LDA.W $0000,Y                                                        ;A897AB;
    STA.W EnemyData.pInstList,X                                          ;A897AE;
    RTS                                                                  ;A897B1;


RTL_A897B2:
    RTL                                                                  ;A897B2;


RTL_A897B3:
    RTL                                                                  ;A897B3;


Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened:
    dw $0008,$0008                                                       ;A897B4;
    db $0C                                                               ;A897B8;
    dw $2127,$0000                                                       ;A897B9;
    db $0C                                                               ;A897BD;
    dw $2126,$8000                                                       ;A897BE;
    db $FC                                                               ;A897C2;
    dw $2122,$8000                                                       ;A897C3;
    db $EC                                                               ;A897C7;
    dw $2120,$81F0                                                       ;A897C8;
    db $00                                                               ;A897CC;
    dw $2106,$01F8                                                       ;A897CD;
    db $FC                                                               ;A897D1;
    dw $2135,$01F0                                                       ;A897D2;
    db $FC                                                               ;A897D6;
    dw $2134,$81F0                                                       ;A897D7;
    db $EC                                                               ;A897DB;
    dw $2104                                                             ;A897DC;

Spritemap_Namihe_FacingLeft_EyeOpened:
    dw $0008,$81F0                                                       ;A897DE;
    db $00                                                               ;A897E2;
    dw $2106,$01F8                                                       ;A897E3;
    db $EC                                                               ;A897E7;
    dw $2105,$01F0                                                       ;A897E8;
    db $EC                                                               ;A897EC;
    dw $2104,$81F0                                                       ;A897ED;
    db $F4                                                               ;A897F1;
    dw $2108,$0008                                                       ;A897F2;
    db $0C                                                               ;A897F6;
    dw $2127,$0000                                                       ;A897F7;
    db $0C                                                               ;A897FB;
    dw $2126,$8000                                                       ;A897FC;
    db $FC                                                               ;A89800;
    dw $2122,$8000                                                       ;A89801;
    db $EC                                                               ;A89805;
    dw $2120                                                             ;A89806;

Spritemap_Namihe_FacingLeft_StartOpeningMouth:
    dw $0008,$81EE                                                       ;A89808;
    db $02                                                               ;A8980C;
    dw $2106,$01F6                                                       ;A8980D;
    db $EC                                                               ;A89811;
    dw $2105,$01EE                                                       ;A89812;
    db $EC                                                               ;A89816;
    dw $2104,$81EE                                                       ;A89817;
    db $F4                                                               ;A8981B;
    dw $2108,$0006                                                       ;A8981C;
    db $0C                                                               ;A89820;
    dw $2127,$01FE                                                       ;A89821;
    db $0C                                                               ;A89825;
    dw $2126,$81FE                                                       ;A89826;
    db $FC                                                               ;A8982A;
    dw $2122,$81FE                                                       ;A8982B;
    db $EC                                                               ;A8982F;
    dw $2120                                                             ;A89830;

Spritemap_Namihe_FacingLeft_MouthOpening1:
    dw $0008,$81EC                                                       ;A89832;
    db $03                                                               ;A89836;
    dw $2106,$01F4                                                       ;A89837;
    db $EC                                                               ;A8983B;
    dw $2105,$01EC                                                       ;A8983C;
    db $EC                                                               ;A89840;
    dw $2104,$81EC                                                       ;A89841;
    db $F4                                                               ;A89845;
    dw $2108,$0004                                                       ;A89846;
    db $0C                                                               ;A8984A;
    dw $2127,$01FC                                                       ;A8984B;
    db $0C                                                               ;A8984F;
    dw $2126,$81FC                                                       ;A89850;
    db $FC                                                               ;A89854;
    dw $2122,$81FC                                                       ;A89855;
    db $EC                                                               ;A89859;
    dw $2120                                                             ;A8985A;

Spritemap_Namihe_FacingLeft_MouthOpening2:
    dw $0008,$81EA                                                       ;A8985C;
    db $04                                                               ;A89860;
    dw $2106,$01F2                                                       ;A89861;
    db $EC                                                               ;A89865;
    dw $2105,$01EA                                                       ;A89866;
    db $EC                                                               ;A8986A;
    dw $2104,$81EA                                                       ;A8986B;
    db $F4                                                               ;A8986F;
    dw $2108,$0002                                                       ;A89870;
    db $0C                                                               ;A89874;
    dw $2127,$01FA                                                       ;A89875;
    db $0C                                                               ;A89879;
    dw $2126,$81FA                                                       ;A8987A;
    db $FC                                                               ;A8987E;
    dw $2122,$81FA                                                       ;A8987F;
    db $EC                                                               ;A89883;
    dw $2120                                                             ;A89884;

Spritemap_Namihe_FacingLeft_MouthMostOpen:
    dw $0008,$81E9                                                       ;A89886;
    db $05                                                               ;A8988A;
    dw $2106,$01F0                                                       ;A8988B;
    db $EC                                                               ;A8988F;
    dw $2105,$01E8                                                       ;A89890;
    db $EC                                                               ;A89894;
    dw $2104,$81E8                                                       ;A89895;
    db $F4                                                               ;A89899;
    dw $2108,$0000                                                       ;A8989A;
    db $0C                                                               ;A8989E;
    dw $2127,$01F8                                                       ;A8989F;
    db $0C                                                               ;A898A3;
    dw $2126,$81F8                                                       ;A898A4;
    db $FC                                                               ;A898A8;
    dw $2122,$81F8                                                       ;A898A9;
    db $EC                                                               ;A898AD;
    dw $2120                                                             ;A898AE;

Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed:
    dw $0008,$01F0                                                       ;A898B0;
    db $0C                                                               ;A898B4;
    dw $6127,$01F8                                                       ;A898B5;
    db $0C                                                               ;A898B9;
    dw $6126,$81F0                                                       ;A898BA;
    db $FC                                                               ;A898BE;
    dw $6122,$81F0                                                       ;A898BF;
    db $EC                                                               ;A898C3;
    dw $6120,$8000                                                       ;A898C4;
    db $00                                                               ;A898C8;
    dw $6106,$0000                                                       ;A898C9;
    db $FC                                                               ;A898CD;
    dw $6135,$0008                                                       ;A898CE;
    db $FC                                                               ;A898D2;
    dw $6134,$8000                                                       ;A898D3;
    db $EC                                                               ;A898D7;
    dw $6104                                                             ;A898D8;

Spritemap_Namihe_FacingRight_EyeOpened:
    dw $0008,$8000                                                       ;A898DA;
    db $00                                                               ;A898DE;
    dw $6106,$0000                                                       ;A898DF;
    db $EC                                                               ;A898E3;
    dw $6105,$0008                                                       ;A898E4;
    db $EC                                                               ;A898E8;
    dw $6104,$8000                                                       ;A898E9;
    db $F4                                                               ;A898ED;
    dw $6108,$01F0                                                       ;A898EE;
    db $0C                                                               ;A898F2;
    dw $6127,$01F8                                                       ;A898F3;
    db $0C                                                               ;A898F7;
    dw $6126,$81F0                                                       ;A898F8;
    db $FC                                                               ;A898FC;
    dw $6122,$81F0                                                       ;A898FD;
    db $EC                                                               ;A89901;
    dw $6120                                                             ;A89902;

Spritemap_Namihe_FacingRight_StartOpeningMouth:
    dw $0008,$8002                                                       ;A89904;
    db $02                                                               ;A89908;
    dw $6106,$0002                                                       ;A89909;
    db $EC                                                               ;A8990D;
    dw $6105,$000A                                                       ;A8990E;
    db $EC                                                               ;A89912;
    dw $6104,$8002                                                       ;A89913;
    db $F4                                                               ;A89917;
    dw $6108,$01F2                                                       ;A89918;
    db $0C                                                               ;A8991C;
    dw $6127,$01FA                                                       ;A8991D;
    db $0C                                                               ;A89921;
    dw $6126,$81F2                                                       ;A89922;
    db $FC                                                               ;A89926;
    dw $6122,$81F2                                                       ;A89927;
    db $EC                                                               ;A8992B;
    dw $6120                                                             ;A8992C;

Spritemap_Namihe_FacingRight_MouthOpening1:
    dw $0008,$8004                                                       ;A8992E;
    db $03                                                               ;A89932;
    dw $6106,$0004                                                       ;A89933;
    db $EC                                                               ;A89937;
    dw $6105,$000C                                                       ;A89938;
    db $EC                                                               ;A8993C;
    dw $6104,$8004                                                       ;A8993D;
    db $F4                                                               ;A89941;
    dw $6108,$01F4                                                       ;A89942;
    db $0C                                                               ;A89946;
    dw $6127,$01FC                                                       ;A89947;
    db $0C                                                               ;A8994B;
    dw $6126,$81F4                                                       ;A8994C;
    db $FC                                                               ;A89950;
    dw $6122,$81F4                                                       ;A89951;
    db $EC                                                               ;A89955;
    dw $6120                                                             ;A89956;

Spritemap_Namihe_FacingRight_MouthOpening2:
    dw $0008,$8006                                                       ;A89958;
    db $04                                                               ;A8995C;
    dw $6106,$0006                                                       ;A8995D;
    db $EC                                                               ;A89961;
    dw $6105,$000E                                                       ;A89962;
    db $EC                                                               ;A89966;
    dw $6104,$8006                                                       ;A89967;
    db $F4                                                               ;A8996B;
    dw $6108,$01F6                                                       ;A8996C;
    db $0C                                                               ;A89970;
    dw $6127,$01FE                                                       ;A89971;
    db $0C                                                               ;A89975;
    dw $6126,$81F6                                                       ;A89976;
    db $FC                                                               ;A8997A;
    dw $6122,$81F6                                                       ;A8997B;
    db $EC                                                               ;A8997F;
    dw $6120                                                             ;A89980;

Spritemap_Namihe_FacingRight_MouthMostOpen:
    dw $0008,$8007                                                       ;A89982;
    db $05                                                               ;A89986;
    dw $6106,$0008                                                       ;A89987;
    db $EC                                                               ;A8998B;
    dw $6105,$0010                                                       ;A8998C;
    db $EC                                                               ;A89990;
    dw $6104,$8008                                                       ;A89991;
    db $F4                                                               ;A89995;
    dw $6108,$01F8                                                       ;A89996;
    db $0C                                                               ;A8999A;
    dw $6127,$0000                                                       ;A8999B;
    db $0C                                                               ;A8999F;
    dw $6126,$81F8                                                       ;A899A0;
    db $FC                                                               ;A899A4;
    dw $6122,$81F8                                                       ;A899A5;
    db $EC                                                               ;A899A9;
    dw $6120                                                             ;A899AA;

Palette_Coven:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A899AC;
    dw $1DCE,$01DF,$001F,$0018,$000A,$06B9,$00EA,$0045                   ;A899BC;

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

InstList_Coven:
    dw $0010                                                             ;A89A8C;
    dw Spritemap_Coven_0                                                 ;A89A8E;
    dw $0010                                                             ;A89A90;
    dw Spritemap_Coven_1                                                 ;A89A92;
    dw $0010                                                             ;A89A94;
    dw Spritemap_Coven_2                                                 ;A89A96;
    dw Instruction_Common_GotoY                                          ;A89A98;
    dw InstList_Coven                                                    ;A89A9A;

CovenConstants_SamusMovementCounterThreshold:
    dw $0010                                                             ;A89A9C;

CovenConstants_SamusStationaryFramesThreshold:
    dw $0040                                                             ;A89A9E;

CovenConstants_HoveringYAccelerationDeceleration:
    dw $1800                                                             ;A89AA0;

CovenConstants_InitialHoveringYVelocity:
    dw $0001                                                             ;A89AA2;

CovenConstants_SleepTimer:
    dw $0078                                                             ;A89AA4;

CovenConstants_MaterializeTimer:
    dw $0078                                                             ;A89AA6;

CovenConstants_OffsetsFromSamusToMaterialize_X:
    dw $FFC0                                                             ;A89AA8;

CovenConstants_OffsetsFromSamusToMaterialize_Y:
    dw $FFC0,$0000,$FFC0,$0040,$0000,$FFC0,$0000,$0000                   ;A89AAA;
    dw $0000,$0040,$0000,$FFC0,$0040,$0000,$0040,$0040                   ;A89ABA;
    dw $0040                                                             ;A89ACA;

CovenPaletteTransitionDelayTable:
    dw $0001,$0008,$0001,$0008,$0001,$0007,$0001,$0007                   ;A89ACC;
    dw $0002,$0006,$0002,$0006,$0003,$0005,$0003,$0005                   ;A89ADC;
    dw $FFFF                                                             ;A89AEC;

InitAI_Coven:
    LDX.W $0E54                                                          ;A89AEE;
    LDA.W EnemyData.properties,X                                         ;A89AF1;
    ORA.W #$2500                                                         ;A89AF4;
    STA.W EnemyData.properties,X                                         ;A89AF7;
    LDA.W #$0001                                                         ;A89AFA;
    STA.W EnemyData.instTimer,X                                          ;A89AFD;
    STZ.W EnemyData.loopCounter,X                                        ;A89B00;
    LDA.W #InstList_Coven                                                ;A89B03;
    STA.W EnemyData.pInstList,X                                          ;A89B06;
    LDA.W #Function_Coven_Dematerialized_Asleep                          ;A89B09;
    STA.W EnemyData.work0,X                                              ;A89B0C;
    LDA.W CovenConstants_SleepTimer                                      ;A89B0F;
    CLC                                                                  ;A89B12;
    ADC.W #$00A0                                                         ;A89B13;
    STA.W EnemyData.work1,X                                              ;A89B16;
    LDX.W $0E54                                                          ;A89B19;
    LDA.W EnemyData.palette,X                                            ;A89B1C;
    XBA                                                                  ;A89B1F;
    ASL A                                                                ;A89B20;
    ASL A                                                                ;A89B21;
    ASL A                                                                ;A89B22;
    ASL A                                                                ;A89B23;
    CLC                                                                  ;A89B24;
    ADC.W #$0100                                                         ;A89B25;
    TAX                                                                  ;A89B28;
    LDA.W #$0010                                                         ;A89B29;
    STA.B $12                                                            ;A89B2C;
    LDA.W #$0000                                                         ;A89B2E;

.loop:
    STA.L $7EC200,X                                                      ;A89B31;
    INX                                                                  ;A89B35;
    INX                                                                  ;A89B36;
    DEC.B $12                                                            ;A89B37;
    BPL .loop                                                            ;A89B39;
    RTL                                                                  ;A89B3B;


MainAI_Coven:
    LDX.W $0E54                                                          ;A89B3C;
    JMP.W ($0FA8,X)                                                      ;A89B3F;


Function_Coven_Materialize_FadeToWhite:
    PHX                                                                  ;A89B42;
    JSR.W HandleFadeInTimerAndIndex                                      ;A89B43;
    LDY.W #$0010                                                         ;A89B46;
    LDX.W $0E54                                                          ;A89B49;
    LDA.W EnemyData.palette,X                                            ;A89B4C;
    XBA                                                                  ;A89B4F;
    ASL A                                                                ;A89B50;
    ASL A                                                                ;A89B51;
    ASL A                                                                ;A89B52;
    ASL A                                                                ;A89B53;
    CLC                                                                  ;A89B54;
    ADC.W #$0100                                                         ;A89B55;
    TAX                                                                  ;A89B58;
    LDA.W #$0010                                                         ;A89B59;
    STA.B $12                                                            ;A89B5C;

.loopUpper:
    LDA.L $7EC000,X                                                      ;A89B5E;
    AND.W #$001F                                                         ;A89B62;
    CMP.W #$001F                                                         ;A89B65;
    BPL .next                                                            ;A89B68;
    LDA.L $7EC000,X                                                      ;A89B6A;
    CLC                                                                  ;A89B6E;
    ADC.W #$0421                                                         ;A89B6F;
    STA.L $7EC000,X                                                      ;A89B72;
    DEY                                                                  ;A89B76;

.next:
    INX                                                                  ;A89B77;
    INX                                                                  ;A89B78;
    DEC.B $12                                                            ;A89B79;
    BNE .loopUpper                                                       ;A89B7B;
    CPY.W #$0010                                                         ;A89B7D;
    BMI .return                                                          ;A89B80;
    LDX.W $0E54                                                          ;A89B82;
    LDA.W #Function_Coven_Materialize_FadeFromWhite                      ;A89B85;
    STA.W EnemyData.work0,X                                              ;A89B88;
    LDA.W EnemyData.palette,X                                            ;A89B8B;
    XBA                                                                  ;A89B8E;
    ASL A                                                                ;A89B8F;
    ASL A                                                                ;A89B90;
    ASL A                                                                ;A89B91;
    ASL A                                                                ;A89B92;
    CLC                                                                  ;A89B93;
    ADC.W #$0100                                                         ;A89B94;
    TAX                                                                  ;A89B97;
    LDY.W #$0000                                                         ;A89B98;

.loopLower:
    LDA.W Palette_Coven,Y                                                ;A89B9B;
    STA.L $7EC200,X                                                      ;A89B9E;
    INX                                                                  ;A89BA2;
    INX                                                                  ;A89BA3;
    INY                                                                  ;A89BA4;
    INY                                                                  ;A89BA5;
    CPY.W #$0020                                                         ;A89BA6;
    BMI .loopLower                                                       ;A89BA9;

.return:
    PLX                                                                  ;A89BAB;
    RTL                                                                  ;A89BAC;


Function_Coven_Materialize_FadeFromWhite:
    JSR.W AdvanceCovenPaletteTransition                                  ;A89BAD;
    PHA                                                                  ;A89BB0;
    LDX.W $0E54                                                          ;A89BB1;
    JSR.W HandleFadeInTimerAndIndex                                      ;A89BB4;
    PLA                                                                  ;A89BB7;
    ORA.W EnemyData.work1,X                                              ;A89BB8;
    BNE .return                                                          ;A89BBB;
    LDA.W EnemyData.properties,X                                         ;A89BBD;
    AND.W #$FBFF                                                         ;A89BC0; >.< #$FAFF
    AND.W #$FEFF                                                         ;A89BC3;
    STA.W EnemyData.properties,X                                         ;A89BC6;
    LDA.W #Function_Coven_Materialized                                   ;A89BC9;
    STA.W EnemyData.work0,X                                              ;A89BCC;
    LDA.W EnemyData.yPosition,X                                          ;A89BCF;
    STA.L $7E7800,X                                                      ;A89BD2;
    LDA.W #$0001                                                         ;A89BD6;
    STA.W EnemyData.work1,X                                              ;A89BD9;
    LDA.W #$0002                                                         ;A89BDC;
    STA.W EnemyData.work2,X                                              ;A89BDF;
    LDA.W #$0000                                                         ;A89BE2;
    STA.L $7E7802,X                                                      ;A89BE5;
    LDA.W CovenConstants_InitialHoveringYVelocity                        ;A89BE9;
    STA.L $7E7804,X                                                      ;A89BEC;
    LDA.W CovenConstants_MaterializeTimer                                ;A89BF0;
    STA.W EnemyData.work1,X                                              ;A89BF3;
    LDA.W #$0004                                                         ;A89BF6;
    STA.L $7E780A,X                                                      ;A89BF9;
    LDA.W $0AF6                                                          ;A89BFD;
    STA.L $7E780C,X                                                      ;A89C00;
    STA.L $7E780E,X                                                      ;A89C04;
    STA.L $7E7810,X                                                      ;A89C08;
    LDA.W #$000C                                                         ;A89C0C;
    STA.L $7E7812,X                                                      ;A89C0F;
    LDA.W $0AFA,X                                                        ;A89C13;
    STA.L $7E7814,X                                                      ;A89C16;
    STA.L $7E7816,X                                                      ;A89C1A;
    STA.L $7E7818,X                                                      ;A89C1E;
    LDA.W CovenConstants_SamusStationaryFramesThreshold                  ;A89C22;
    STA.L $7E781A,X                                                      ;A89C25;
    LDA.W CovenConstants_SamusMovementCounterThreshold                   ;A89C29;
    STA.L $7E781C,X                                                      ;A89C2C;

.return:
    RTL                                                                  ;A89C30;


HandleFadeInTimerAndIndex:
    LDA.W EnemyData.work1,X                                              ;A89C31;
    BEQ .timerExpired                                                    ;A89C34;
    DEC A                                                                ;A89C36;
    STA.W EnemyData.work1,X                                              ;A89C37;
    BNE .return                                                          ;A89C3A;
    LDA.W EnemyData.work2,X                                              ;A89C3C;
    TAY                                                                  ;A89C3F;
    LDA.W CovenPaletteTransitionDelayTable,Y                             ;A89C40;
    BMI .terminator                                                      ;A89C43;
    STA.W EnemyData.work1,X                                              ;A89C45;
    TYA                                                                  ;A89C48;
    INC A                                                                ;A89C49;
    INC A                                                                ;A89C4A;
    STA.W EnemyData.work2,X                                              ;A89C4B;
    TYA                                                                  ;A89C4E;
    BIT.W #$0002                                                         ;A89C4F;
    BEQ .timerExpired                                                    ;A89C52;

.return:
    RTS                                                                  ;A89C54;


.timerExpired:
    LDA.W EnemyData.properties,X                                         ;A89C55;
    AND.W #$FEFF                                                         ;A89C58;
    STA.W EnemyData.properties,X                                         ;A89C5B;
    RTS                                                                  ;A89C5E;


.terminator:
    LDA.W #$0000                                                         ;A89C5F;
    STA.W EnemyData.work1,X                                              ;A89C62;
    STA.W EnemyData.work2,X                                              ;A89C65;
    RTS                                                                  ;A89C68;


Function_Coven_Dematerializing:
    JSR.W AdvanceCovenPaletteTransition                                  ;A89C69;
    CMP.W #$0000                                                         ;A89C6C;
    BNE .return                                                          ;A89C6F;
    LDX.W $0E54                                                          ;A89C71;
    LDA.W #Function_Coven_Dematerialized_Asleep                          ;A89C74;
    STA.W EnemyData.work0,X                                              ;A89C77;
    LDA.W EnemyData.properties,X                                         ;A89C7A;
    ORA.W #$0100                                                         ;A89C7D;
    STA.W EnemyData.properties,X                                         ;A89C80;
    LDA.W CovenConstants_SleepTimer                                      ;A89C83;
    STA.W EnemyData.work1,X                                              ;A89C86;

.return:
    RTL                                                                  ;A89C89;


Function_Coven_Materialized:
    LDA.W EnemyData.ySubPosition,X                                       ;A89C8A;
    CLC                                                                  ;A89C8D;
    ADC.L $7E7802,X                                                      ;A89C8E;
    STA.W EnemyData.ySubPosition,X                                       ;A89C92;
    LDA.W EnemyData.yPosition,X                                          ;A89C95;
    ADC.L $7E7804,X                                                      ;A89C98;
    STA.W EnemyData.yPosition,X                                          ;A89C9C;
    LDA.W EnemyData.yPosition,X                                          ;A89C9F;
    CMP.L $7E7800,X                                                      ;A89CA2;
    BMI .subvelocity                                                     ;A89CA6;
    LDA.L $7E7802,X                                                      ;A89CA8;
    SEC                                                                  ;A89CAC;
    SBC.W CovenConstants_HoveringYAccelerationDeceleration               ;A89CAD;
    STA.L $7E7802,X                                                      ;A89CB0;
    LDA.L $7E7804,X                                                      ;A89CB4;
    SBC.W #$0000                                                         ;A89CB8;
    STA.L $7E7804,X                                                      ;A89CBB;
    BRA +                                                                ;A89CBF;


.subvelocity:
    LDA.L $7E7802,X                                                      ;A89CC1;
    CLC                                                                  ;A89CC5;
    ADC.W CovenConstants_HoveringYAccelerationDeceleration               ;A89CC6;
    STA.L $7E7802,X                                                      ;A89CC9;
    LDA.L $7E7804,X                                                      ;A89CCD;
    ADC.W #$0000                                                         ;A89CD1;
    STA.L $7E7804,X                                                      ;A89CD4;

  + LDA.W EnemyData.work1,X                                              ;A89CD8;
    DEC A                                                                ;A89CDB;
    STA.W EnemyData.work1,X                                              ;A89CDC;
    BNE .return                                                          ;A89CDF;
    LDA.W #Function_Coven_Dematerializing                                ;A89CE1;
    STA.W EnemyData.work0,X                                              ;A89CE4;
    LDA.W EnemyData.properties,X                                         ;A89CE7;
    ORA.W #$0400                                                         ;A89CEA;
    STA.W EnemyData.properties,X                                         ;A89CED;
    LDX.W $0E54                                                          ;A89CF0;
    LDA.W EnemyData.palette,X                                            ;A89CF3;
    XBA                                                                  ;A89CF6;
    ASL A                                                                ;A89CF7;
    ASL A                                                                ;A89CF8;
    ASL A                                                                ;A89CF9;
    ASL A                                                                ;A89CFA;
    CLC                                                                  ;A89CFB;
    ADC.W #$0100                                                         ;A89CFC;
    TAX                                                                  ;A89CFF;
    LDA.W #$0010                                                         ;A89D00;
    STA.B $12                                                            ;A89D03;
    LDA.W #$7FFF                                                         ;A89D05;

.loop:
    STA.L $7EC200,X                                                      ;A89D08;
    INX                                                                  ;A89D0C;
    INX                                                                  ;A89D0D;
    DEC.B $12                                                            ;A89D0E;
    BPL .loop                                                            ;A89D10;

.return:
    RTL                                                                  ;A89D12;


Function_Coven_Dematerialized_Asleep:
    LDA.W EnemyData.work1,X                                              ;A89D13;
    BEQ .timerExpired                                                    ;A89D16;
    DEC A                                                                ;A89D18;
    STA.W EnemyData.work1,X                                              ;A89D19;
    BNE .return                                                          ;A89D1C;

.timerExpired:
    LDA.W #$0001                                                         ;A89D1E;
    STA.W EnemyData.work1,X                                              ;A89D21;
    LDA.W #$0002                                                         ;A89D24;
    STA.W EnemyData.work2,X                                              ;A89D27;
    LDA.W #Function_Coven_Dematerialized_Awake                           ;A89D2A;
    STA.W EnemyData.work0,X                                              ;A89D2D;

.return:
    RTL                                                                  ;A89D30;


RTL_A89D31:
    RTL                                                                  ;A89D31;


CovenStationaryZoneXRadius:
    dw $0001                                                             ;A89D32;

CovenStationaryZoneYRadius:
    dw $0001                                                             ;A89D34;

Function_Coven_Dematerialized_Awake:
    LDA.W $0AF6                                                          ;A89D36;
    CMP.L $7E780E,X                                                      ;A89D39;
    BMI .breakLockOn                                                     ;A89D3D;
    CMP.L $7E7810,X                                                      ;A89D3F;
    BPL .breakLockOn                                                     ;A89D43;
    LDA.W $0AFA,X                                                        ;A89D45;
    CMP.L $7E7816,X                                                      ;A89D48;
    BMI .breakLockOn                                                     ;A89D4C;
    CMP.L $7E7818,X                                                      ;A89D4E;
    BPL .breakLockOn                                                     ;A89D52;
    LDA.L $7E781A,X                                                      ;A89D54;
    DEC A                                                                ;A89D58;
    STA.L $7E781A,X                                                      ;A89D59;
    BEQ +                                                                ;A89D5D;
    JMP.W .updateZone                                                    ;A89D5F;


  + LDA.W #$0004                                                         ;A89D62;
    STA.L $7E780A,X                                                      ;A89D65;
    LDA.W #$000C                                                         ;A89D69;
    STA.L $7E7812,X                                                      ;A89D6C;
    BRA .materialize                                                     ;A89D70;


.breakLockOn:
    LDA.W CovenConstants_SamusStationaryFramesThreshold                  ;A89D72;
    STA.L $7E781A,X                                                      ;A89D75;
    LDY.W #$0000                                                         ;A89D79;
    LDA.W $0AF6                                                          ;A89D7C;
    SEC                                                                  ;A89D7F;
    SBC.L $7E780C,X                                                      ;A89D80;
    BMI .checkXMovementDirection                                         ;A89D84;
    BEQ .noXMovement                                                     ;A89D86;
    LDY.W #$0008                                                         ;A89D88;
    BRA .checkXMovementDirection                                         ;A89D8B;


.noXMovement:
    LDY.W #$0004                                                         ;A89D8D;

.checkXMovementDirection:
    TYA                                                                  ;A89D90;
    CMP.L $7E780A,X                                                      ;A89D91;
    BEQ .checkYMovement                                                  ;A89D95;
    TYA                                                                  ;A89D97;
    STA.L $7E780A,X                                                      ;A89D98;
    LDA.W CovenConstants_SamusMovementCounterThreshold                   ;A89D9C;
    STA.L $7E781C,X                                                      ;A89D9F;
    BRA .updateZone                                                      ;A89DA3;


.materialize:
    LDA.W #Function_Coven_Materialize_FadeToWhite                        ;A89DA5;
    STA.W EnemyData.work0,X                                              ;A89DA8;
    LDA.W CovenConstants_SamusStationaryFramesThreshold                  ;A89DAB;
    STA.L $7E781A,X                                                      ;A89DAE;
    LDA.W CovenConstants_SamusMovementCounterThreshold                   ;A89DB2;
    STA.L $7E781C,X                                                      ;A89DB5;
    LDA.L $7E780A,X                                                      ;A89DB9;
    CLC                                                                  ;A89DBD;
    ADC.L $7E7812,X                                                      ;A89DBE;
    TAY                                                                  ;A89DC2;
    LDA.W $0AF6,X                                                        ;A89DC3;
    CLC                                                                  ;A89DC6;
    ADC.W CovenConstants_OffsetsFromSamusToMaterialize_X,Y               ;A89DC7;
    STA.W EnemyData.xPosition,X                                          ;A89DCA;
    LDA.W $0AFA,X                                                        ;A89DCD;
    CLC                                                                  ;A89DD0;
    ADC.W CovenConstants_OffsetsFromSamusToMaterialize_Y,Y               ;A89DD1;
    STA.W EnemyData.yPosition,X                                          ;A89DD4;
    RTL                                                                  ;A89DD7;


.checkYMovement:
    LDY.W #$0000                                                         ;A89DD8;
    LDA.W $0AFA                                                          ;A89DDB;
    SEC                                                                  ;A89DDE;
    SBC.L $7E7814,X                                                      ;A89DDF;
    BMI .checkYMovementDirection                                         ;A89DE3;
    BEQ .noYMovement                                                     ;A89DE5;
    LDY.W #$0018                                                         ;A89DE7;
    BRA .checkYMovementDirection                                         ;A89DEA;


.noYMovement:
    LDY.W #$000C                                                         ;A89DEC;

.checkYMovementDirection:
    TYA                                                                  ;A89DEF;
    CMP.L $7E7812,X                                                      ;A89DF0;
    BEQ .matchingYMovementDirection                                      ;A89DF4;
    TYA                                                                  ;A89DF6;
    STA.L $7E7812,X                                                      ;A89DF7;
    LDA.W CovenConstants_SamusMovementCounterThreshold                   ;A89DFB;
    STA.L $7E781C,X                                                      ;A89DFE;
    BRA .updateZone                                                      ;A89E02;


.matchingYMovementDirection:
    LDA.L $7E781C,X                                                      ;A89E04;
    DEC A                                                                ;A89E08;
    STA.L $7E781C,X                                                      ;A89E09;
    BEQ .materialize                                                     ;A89E0D;

.updateZone:
    LDA.W $0AF6                                                          ;A89E0F;
    STA.L $7E780C,X                                                      ;A89E12;
    SEC                                                                  ;A89E16;
    SBC.W CovenStationaryZoneXRadius                                     ;A89E17;
    STA.L $7E780E,X                                                      ;A89E1A;
    LDA.W $0AF6                                                          ;A89E1E;
    CLC                                                                  ;A89E21;
    ADC.W CovenStationaryZoneXRadius                                     ;A89E22;
    STA.L $7E7810,X                                                      ;A89E25;
    LDA.W $0AFA                                                          ;A89E29;
    STA.L $7E7814,X                                                      ;A89E2C;
    SEC                                                                  ;A89E30;
    SBC.W CovenStationaryZoneYRadius                                     ;A89E31;
    STA.L $7E7816,X                                                      ;A89E34;
    LDA.W $0AFA                                                          ;A89E38;
    CLC                                                                  ;A89E3B;
    ADC.W CovenStationaryZoneYRadius                                     ;A89E3C;
    STA.L $7E7818,X                                                      ;A89E3F;
    RTL                                                                  ;A89E43;


RTL_A89E44:
    RTL                                                                  ;A89E44;


RTL_A89E45:
    RTL                                                                  ;A89E45;


Spritemap_Coven_0:
    dw $0004,$8000                                                       ;A89E46;
    db $00                                                               ;A89E4A;
    dw $3106,$81F0                                                       ;A89E4B;
    db $00                                                               ;A89E4F;
    dw $3104,$8000                                                       ;A89E50;
    db $F0                                                               ;A89E54;
    dw $3102,$81F0                                                       ;A89E55;
    db $F0                                                               ;A89E59;
    dw $3100                                                             ;A89E5A;

Spritemap_Coven_1:
    dw $0004,$8000                                                       ;A89E5C;
    db $00                                                               ;A89E60;
    dw $310A,$81F0                                                       ;A89E61;
    db $00                                                               ;A89E65;
    dw $3108,$8000                                                       ;A89E66;
    db $F0                                                               ;A89E6A;
    dw $3102,$81F0                                                       ;A89E6B;
    db $F0                                                               ;A89E6F;
    dw $3100                                                             ;A89E70;

Spritemap_Coven_2:
    dw $0004,$8000                                                       ;A89E72;
    db $00                                                               ;A89E76;
    dw $310E,$81F0                                                       ;A89E77;
    db $00                                                               ;A89E7B;
    dw $310C,$8000                                                       ;A89E7C;
    db $F0                                                               ;A89E80;
    dw $3102,$81F0                                                       ;A89E81;
    db $F0                                                               ;A89E85;
    dw $3100                                                             ;A89E86;

AdvanceCovenPaletteTransition:
    PHP                                                                  ;A89E88;
    PHX                                                                  ;A89E89;
    PHY                                                                  ;A89E8A;
    REP #$30                                                             ;A89E8B;
    LDY.W #$0000                                                         ;A89E8D;
    LDA.W $0797                                                          ;A89E90;
    BEQ .notDoorTransition                                               ;A89E93;
    JMP.W .return                                                        ;A89E95;


.notDoorTransition:
    LDX.W $0E54                                                          ;A89E98;
    LDA.W EnemyData.palette,X                                            ;A89E9B;
    XBA                                                                  ;A89E9E;
    ASL A                                                                ;A89E9F;
    ASL A                                                                ;A89EA0;
    ASL A                                                                ;A89EA1;
    ASL A                                                                ;A89EA2;
    CLC                                                                  ;A89EA3;
    ADC.W #$0100                                                         ;A89EA4;
    TAX                                                                  ;A89EA7;
    CLC                                                                  ;A89EA8;
    ADC.W #$0020                                                         ;A89EA9;
    STA.B $14                                                            ;A89EAC;

.loop:
    LDA.L $7EC200,X                                                      ;A89EAE;
    CMP.L $7EC000,X                                                      ;A89EB2;
    BNE .notReachedTarget                                                ;A89EB6;
    JMP.W .next                                                          ;A89EB8;


.notReachedTarget:
    AND.W #$001F                                                         ;A89EBB;
    STA.B $12                                                            ;A89EBE;
    LDA.L $7EC000,X                                                      ;A89EC0;
    AND.W #$001F                                                         ;A89EC4;
    CMP.B $12                                                            ;A89EC7;
    BEQ .redEnd                                                          ;A89EC9;
    BPL .notReachedRedTarget                                             ;A89ECB;
    INC A                                                                ;A89ECD;
    BRA +                                                                ;A89ECE;


.notReachedRedTarget:
    DEC A                                                                ;A89ED0;

  + STA.B $12                                                            ;A89ED1;
    LDA.L $7EC000,X                                                      ;A89ED3;
    AND.W #$FFE0                                                         ;A89ED7;
    ORA.B $12                                                            ;A89EDA;
    STA.L $7EC000,X                                                      ;A89EDC;
    INY                                                                  ;A89EE0;

.redEnd:
    LDA.L $7EC200,X                                                      ;A89EE1;
    AND.W #$03E0                                                         ;A89EE5;
    STA.B $12                                                            ;A89EE8;
    LDA.L $7EC000,X                                                      ;A89EEA;
    AND.W #$03E0                                                         ;A89EEE;
    CMP.B $12                                                            ;A89EF1;
    BEQ .greenEnd                                                        ;A89EF3;
    BPL .notReachedGreenTarget                                           ;A89EF5;
    CLC                                                                  ;A89EF7;
    ADC.W #$0020                                                         ;A89EF8;
    BRA +                                                                ;A89EFB;


.notReachedGreenTarget:
    SEC                                                                  ;A89EFD;
    SBC.W #$0020                                                         ;A89EFE;

  + STA.B $12                                                            ;A89F01;
    LDA.L $7EC000,X                                                      ;A89F03;
    AND.W #$FC1F                                                         ;A89F07;
    ORA.B $12                                                            ;A89F0A;
    STA.L $7EC000,X                                                      ;A89F0C;
    INY                                                                  ;A89F10;

.greenEnd:
    LDA.L $7EC200,X                                                      ;A89F11;
    AND.W #$7C00                                                         ;A89F15;
    STA.B $12                                                            ;A89F18;
    LDA.L $7EC000,X                                                      ;A89F1A;
    AND.W #$7C00                                                         ;A89F1E;
    CMP.B $12                                                            ;A89F21;
    BEQ .next                                                            ;A89F23;
    BPL .notReachedBlueTarget                                            ;A89F25;
    CLC                                                                  ;A89F27;
    ADC.W #$0400                                                         ;A89F28;
    BRA +                                                                ;A89F2B;


.notReachedBlueTarget:
    SEC                                                                  ;A89F2D;
    SBC.W #$0400                                                         ;A89F2E;

  + STA.B $12                                                            ;A89F31;
    LDA.L $7EC000,X                                                      ;A89F33;
    AND.W #$83FF                                                         ;A89F37;
    ORA.B $12                                                            ;A89F3A;
    STA.L $7EC000,X                                                      ;A89F3C;
    INY                                                                  ;A89F40;

.next:
    INX                                                                  ;A89F41;
    INX                                                                  ;A89F42;
    CPX.B $14                                                            ;A89F43;
    BPL .return                                                          ;A89F45;
    JMP.W .loop                                                          ;A89F47;


.return:
    TYA                                                                  ;A89F4A;
    PLY                                                                  ;A89F4B;
    PLX                                                                  ;A89F4C;
    PLP                                                                  ;A89F4D;
    RTS                                                                  ;A89F4E;


Palette_YappingMaw:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A89F4F;
    dw $1DCE,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A89F5F;

InstList_YappingMaw_Attacking_FacingUp:
    dw $0005                                                             ;A89F6F;
    dw Spritemap_YappingMaw_0                                            ;A89F71;
    dw $0003                                                             ;A89F73;
    dw Spritemap_YappingMaw_1                                            ;A89F75;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89F77;
    dw $0050                                                             ;A89F79;
    dw Spritemap_YappingMaw_2                                            ;A89F7B;
    dw $0003                                                             ;A89F7D;
    dw Spritemap_YappingMaw_1                                            ;A89F7F;
    dw Instruction_Common_GotoY                                          ;A89F81;
    dw InstList_YappingMaw_Attacking_FacingUp                            ;A89F83;

InstList_YappingMaw_Attacking_FacingUpRight:
    dw $0005                                                             ;A89F85;
    dw Spritemap_YappingMaw_3                                            ;A89F87;
    dw $0003                                                             ;A89F89;
    dw Spritemap_YappingMaw_4                                            ;A89F8B;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89F8D;
    dw $0050                                                             ;A89F8F;
    dw Spritemap_YappingMaw_5                                            ;A89F91;
    dw $0003                                                             ;A89F93;
    dw Spritemap_YappingMaw_4                                            ;A89F95;
    dw Instruction_Common_GotoY                                          ;A89F97;
    dw InstList_YappingMaw_Attacking_FacingUpRight                       ;A89F99;

InstList_YappingMaw_Attacking_FacingRight:
    dw $0005                                                             ;A89F9B;
    dw Spritemap_YappingMaw_6                                            ;A89F9D;
    dw $0003                                                             ;A89F9F;
    dw Spritemap_YappingMaw_7                                            ;A89FA1;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FA3;
    dw $0050                                                             ;A89FA5;
    dw Spritemap_YappingMaw_8                                            ;A89FA7;
    dw $0003                                                             ;A89FA9;
    dw Spritemap_YappingMaw_7                                            ;A89FAB;
    dw Instruction_Common_GotoY                                          ;A89FAD;
    dw InstList_YappingMaw_Attacking_FacingRight                         ;A89FAF;

InstList_YappingMaw_Attacking_FacingDownRight:
    dw $0005                                                             ;A89FB1;
    dw Spritemap_YappingMaw_9                                            ;A89FB3;
    dw $0003                                                             ;A89FB5;
    dw Spritemap_YappingMaw_A                                            ;A89FB7;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FB9;
    dw $0050                                                             ;A89FBB;
    dw Spritemap_YappingMaw_B                                            ;A89FBD;
    dw $0003                                                             ;A89FBF;
    dw Spritemap_YappingMaw_A                                            ;A89FC1;
    dw Instruction_Common_GotoY                                          ;A89FC3;
    dw InstList_YappingMaw_Attacking_FacingDownRight                     ;A89FC5;

InstList_YappingMaw_Attacking_FacingDown:
    dw $0005                                                             ;A89FC7;
    dw Spritemap_YappingMaw_C                                            ;A89FC9;
    dw $0003                                                             ;A89FCB;
    dw Spritemap_YappingMaw_D                                            ;A89FCD;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FCF;
    dw $0050                                                             ;A89FD1;
    dw Spritemap_YappingMaw_E                                            ;A89FD3;
    dw $0003                                                             ;A89FD5;
    dw Spritemap_YappingMaw_D                                            ;A89FD7;
    dw Instruction_Common_GotoY                                          ;A89FD9;
    dw InstList_YappingMaw_Attacking_FacingDown                          ;A89FDB;

InstList_YappingMaw_Attacking_FacingDownLeft:
    dw $0005                                                             ;A89FDD;
    dw Spritemap_YappingMaw_F                                            ;A89FDF;
    dw $0003                                                             ;A89FE1;
    dw Spritemap_YappingMaw_10                                           ;A89FE3;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FE5;
    dw $0050                                                             ;A89FE7;
    dw Spritemap_YappingMaw_11                                           ;A89FE9;
    dw $0003                                                             ;A89FEB;
    dw Spritemap_YappingMaw_10                                           ;A89FED;
    dw Instruction_Common_GotoY                                          ;A89FEF;
    dw InstList_YappingMaw_Attacking_FacingDownLeft                      ;A89FF1;

InstList_YappingMaw_Attacking_FacingLeft:
    dw $0005                                                             ;A89FF3;
    dw Spritemap_YappingMaw_12                                           ;A89FF5;
    dw $0003                                                             ;A89FF7;
    dw Spritemap_YappingMaw_13                                           ;A89FF9;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A89FFB;
    dw $0050                                                             ;A89FFD;
    dw Spritemap_YappingMaw_14                                           ;A89FFF;
    dw $0003                                                             ;A8A001;
    dw Spritemap_YappingMaw_13                                           ;A8A003;
    dw Instruction_Common_GotoY                                          ;A8A005;
    dw InstList_YappingMaw_Attacking_FacingLeft                          ;A8A007;

InstList_YappingMaw_Attacking_FacingUpLeft:
    dw $0005                                                             ;A8A009;
    dw Spritemap_YappingMaw_15                                           ;A8A00B;
    dw $0003                                                             ;A8A00D;
    dw Spritemap_YappingMaw_16                                           ;A8A00F;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A011;
    dw $0050                                                             ;A8A013;
    dw Spritemap_YappingMaw_17                                           ;A8A015;
    dw $0003                                                             ;A8A017;
    dw Spritemap_YappingMaw_16                                           ;A8A019;
    dw Instruction_Common_GotoY                                          ;A8A01B;
    dw InstList_YappingMaw_Attacking_FacingUpLeft                        ;A8A01D;

InstList_YappingMaw_Cooldown_FacingUpRight:
    dw Instruction_YappingMaw_OffsetSamusUpRight                         ;A8A01F;
    dw $0004                                                             ;A8A021;
    dw Spritemap_YappingMaw_5                                            ;A8A023;

InstList_YappingMaw_Cooldown_FacingUp_0:
    dw Instruction_YappingMaw_OffsetSamusUp                              ;A8A025;

InstList_YappingMaw_Cooldown_FacingUp_1:
    dw $0050                                                             ;A8A027;
    dw Spritemap_YappingMaw_2                                            ;A8A029;
    dw $0003                                                             ;A8A02B;
    dw Spritemap_YappingMaw_1                                            ;A8A02D;
    dw $0005                                                             ;A8A02F;
    dw Spritemap_YappingMaw_0                                            ;A8A031;
    dw $0003                                                             ;A8A033;
    dw Spritemap_YappingMaw_1                                            ;A8A035;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A037;
    dw Instruction_Common_GotoY                                          ;A8A039;
    dw InstList_YappingMaw_Cooldown_FacingUp_1                           ;A8A03B;

InstList_YappingMaw_Cooldown_FacingUpLeft_0:
    dw Instruction_YappingMaw_OffsetSamusUpLeft                          ;A8A03D;
    dw $0004                                                             ;A8A03F;
    dw Spritemap_YappingMaw_17                                           ;A8A041;
    dw Instruction_YappingMaw_OffsetSamusUp                              ;A8A043;

InstList_YappingMaw_Cooldown_FacingUpLeft_1:
    dw $0050                                                             ;A8A045;
    dw Spritemap_YappingMaw_2                                            ;A8A047;
    dw $0003                                                             ;A8A049;
    dw Spritemap_YappingMaw_1                                            ;A8A04B;
    dw $0005                                                             ;A8A04D;
    dw Spritemap_YappingMaw_0                                            ;A8A04F;
    dw $0003                                                             ;A8A051;
    dw Spritemap_YappingMaw_1                                            ;A8A053;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A055;
    dw Instruction_CommonA8_GotoY                                        ;A8A057;
    dw InstList_YappingMaw_Cooldown_FacingUpLeft_1                       ;A8A059;

InstList_YappingMaw_Cooldown_FacingDownRight:
    dw Instruction_YappingMaw_OffsetSamusDownRight                       ;A8A05B;
    dw $0004                                                             ;A8A05D;
    dw Spritemap_YappingMaw_B                                            ;A8A05F;

InstList_YappingMaw_Cooldown_FacingDown_0:
    dw Instruction_YappingMaw_OffsetSamusDown                            ;A8A061;

InstList_YappingMaw_Cooldown_FacingDown_1:
    dw $0050                                                             ;A8A063;
    dw Spritemap_YappingMaw_E                                            ;A8A065;
    dw $0003                                                             ;A8A067;
    dw Spritemap_YappingMaw_D                                            ;A8A069;
    dw $0005                                                             ;A8A06B;
    dw Spritemap_YappingMaw_C                                            ;A8A06D;
    dw $0003                                                             ;A8A06F;
    dw Spritemap_YappingMaw_D                                            ;A8A071;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A073;
    dw Instruction_Common_GotoY                                          ;A8A075;
    dw InstList_YappingMaw_Cooldown_FacingDown_1                         ;A8A077;

InstList_YappingMaw_Cooldown_FacingDownLeft_0:
    dw Instruction_YappingMaw_OffsetSamusDownLeft                        ;A8A079;
    dw $0004                                                             ;A8A07B;
    dw Spritemap_YappingMaw_11                                           ;A8A07D;
    dw Instruction_YappingMaw_OffsetSamusDown                            ;A8A07F;

InstList_YappingMaw_Cooldown_FacingDownLeft_1:
    dw $0050                                                             ;A8A081;
    dw Spritemap_YappingMaw_E                                            ;A8A083;
    dw $0003                                                             ;A8A085;
    dw Spritemap_YappingMaw_D                                            ;A8A087;
    dw $0005                                                             ;A8A089;
    dw Spritemap_YappingMaw_C                                            ;A8A08B;
    dw $0003                                                             ;A8A08D;
    dw Spritemap_YappingMaw_D                                            ;A8A08F;
    dw Instruction_YappingMaw_QueueSFXIfOnScreen                         ;A8A091;
    dw Instruction_Common_GotoY                                          ;A8A093;
    dw InstList_YappingMaw_Cooldown_FacingDownLeft_1                     ;A8A095;

InstListPointers_YappingMaw:
    dw InstList_YappingMaw_Attacking_FacingUp                            ;A8A097;
    dw InstList_YappingMaw_Attacking_FacingUpRight                       ;A8A099;
    dw InstList_YappingMaw_Attacking_FacingRight                         ;A8A09B;
    dw InstList_YappingMaw_Attacking_FacingDownRight                     ;A8A09D;
    dw InstList_YappingMaw_Attacking_FacingDown                          ;A8A09F;
    dw InstList_YappingMaw_Attacking_FacingDownLeft                      ;A8A0A1;
    dw InstList_YappingMaw_Attacking_FacingLeft                          ;A8A0A3;
    dw InstList_YappingMaw_Attacking_FacingUpLeft                        ;A8A0A5;

YappingMawSamusOffsets_X_Up:
    dw $0000                                                             ;A8A0A7;

YappingMawSamusOffsets_Y_Up:
    dw $FFF0                                                             ;A8A0A9;

YappingMawSamusOffsets_X_UpRight:
    dw $0008                                                             ;A8A0AB;

YappingMawSamusOffsets_Y_UpRight:
    dw $FFF8                                                             ;A8A0AD;

UNUSED_YappingMawSamusOffsets_X_Right_A8A0AF:
    dw $0010                                                             ;A8A0AF;

UNUSED_YappingMawSamusOffsets_Y_Right_A8A0B1:
    dw $0000                                                             ;A8A0B1;

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

UNUSED_YappingMawSamusOffsets_X_Left_A8A0BF:
    dw $FFF0                                                             ;A8A0BF;

UNUSED_YappingMawSamusOffsets_Y_Left_A8A0C1:
    dw $0000                                                             ;A8A0C1;

YappingMawSamusOffsets_X_UpLeft:
    dw $FFF8                                                             ;A8A0C3;

YappingMawSamusOffsets_Y_UpLeft:
    dw $FFF8                                                             ;A8A0C5;

Instruction_YappingMaw_OffsetSamusUpRight:
    LDX.W $0E54                                                          ;A8A0C7;
    LDA.W YappingMawSamusOffsets_X_UpRight                               ;A8A0CA;
    STA.L $7E8024,X                                                      ;A8A0CD;
    LDA.W YappingMawSamusOffsets_Y_UpRight                               ;A8A0D1;
    STA.L $7E8026,X                                                      ;A8A0D4;
    RTL                                                                  ;A8A0D8;


Instruction_YappingMaw_OffsetSamusUpLeft:
    LDX.W $0E54                                                          ;A8A0D9;
    LDA.W YappingMawSamusOffsets_X_UpLeft                                ;A8A0DC;
    STA.L $7E8024,X                                                      ;A8A0DF;
    LDA.W YappingMawSamusOffsets_Y_UpLeft                                ;A8A0E3;
    STA.L $7E8026,X                                                      ;A8A0E6;
    RTL                                                                  ;A8A0EA;


Instruction_YappingMaw_OffsetSamusDownRight:
    LDX.W $0E54                                                          ;A8A0EB;
    LDA.W YappingMawSamusOffsets_X_DownRight                             ;A8A0EE;
    STA.L $7E8024,X                                                      ;A8A0F1;
    LDA.W YappingMawSamusOffsets_Y_DownRight                             ;A8A0F5;
    STA.L $7E8026,X                                                      ;A8A0F8;
    RTL                                                                  ;A8A0FC;


Instruction_YappingMaw_OffsetSamusDownLeft:
    LDX.W $0E54                                                          ;A8A0FD;
    LDA.W YappingMawSamusOffsets_X_DownLeft                              ;A8A100;
    STA.L $7E8024,X                                                      ;A8A103;
    LDA.W YappingMawSamusOffsets_Y_DownLeft                              ;A8A107;
    STA.L $7E8026,X                                                      ;A8A10A;
    RTL                                                                  ;A8A10E;


Instruction_YappingMaw_OffsetSamusUp:
    LDX.W $0E54                                                          ;A8A10F;
    LDA.W YappingMawSamusOffsets_X_Up                                    ;A8A112;
    STA.L $7E8024,X                                                      ;A8A115;
    LDA.W YappingMawSamusOffsets_Y_Up                                    ;A8A119;
    STA.L $7E8026,X                                                      ;A8A11C;
    RTL                                                                  ;A8A120;


Instruction_YappingMaw_OffsetSamusDown:
    LDX.W $0E54                                                          ;A8A121;
    LDA.W YappingMawSamusOffsets_X_Down                                  ;A8A124;
    STA.L $7E8024,X                                                      ;A8A127;
    LDA.W YappingMawSamusOffsets_Y_Down                                  ;A8A12B;
    STA.L $7E8026,X                                                      ;A8A12E;
    RTL                                                                  ;A8A132;


Instruction_YappingMaw_QueueSFXIfOnScreen:
    PHY                                                                  ;A8A133;
    PHX                                                                  ;A8A134;
    LDX.W $0E54                                                          ;A8A135;
    LDA.L $7E802C,X                                                      ;A8A138;
    BNE .return                                                          ;A8A13C;
    LDA.W #$002F                                                         ;A8A13E;
    JSL.L QueueSound_Lib2_Max6                                           ;A8A141;

.return:
    PLX                                                                  ;A8A145;
    PLY                                                                  ;A8A146;
    RTL                                                                  ;A8A147;


InitAI_YappingMaw:
    LDX.W $0E54                                                          ;A8A148;
    LDA.W EnemyData.xPosition,X                                          ;A8A14B;
    STA.L $7E7818,X                                                      ;A8A14E;
    LDA.W EnemyData.yPosition,X                                          ;A8A152;
    STA.L $7E781A,X                                                      ;A8A155;
    LDA.W #$0000                                                         ;A8A159;
    STA.L $7E7800,X                                                      ;A8A15C;
    STA.L $7E7802,X                                                      ;A8A160;
    STA.L $7E7804,X                                                      ;A8A164;
    STA.L $7E7806,X                                                      ;A8A168;
    STA.L $7E7808,X                                                      ;A8A16C;
    STA.L $7E780A,X                                                      ;A8A170;
    STA.L $7E780C,X                                                      ;A8A174;
    STA.L $7E780E,X                                                      ;A8A178;
    STA.L $7E8020,X                                                      ;A8A17C;
    LDA.W EnemyData.initParam0,X                                         ;A8A180;
    STA.W EnemyData.work5,X                                              ;A8A183;
    LDA.W #$0040                                                         ;A8A186;
    STA.W EnemyData.work4,X                                              ;A8A189;
    LDA.W #InstList_YappingMaw_Attacking_FacingUp                        ;A8A18C;
    STA.W EnemyData.pInstList,X                                          ;A8A18F;
    LDA.W #$0039                                                         ;A8A192;
    STA.B $24                                                            ;A8A195;
    LDA.W #$0008                                                         ;A8A197;
    STA.B $22                                                            ;A8A19A;
    LDA.W EnemyData.initParam1,X                                         ;A8A19C;
    BNE .keepUp                                                          ;A8A19F;
    LDA.W #InstList_YappingMaw_Attacking_FacingDown                      ;A8A1A1;
    STA.W EnemyData.pInstList,X                                          ;A8A1A4;
    LDA.W #$0038                                                         ;A8A1A7;
    STA.B $24                                                            ;A8A1AA;
    LDA.W #$FFF8                                                         ;A8A1AC;
    STA.B $22                                                            ;A8A1AF;

.keepUp:
    LDA.W #$0001                                                         ;A8A1B1;
    STA.W EnemyData.instTimer,X                                          ;A8A1B4;
    STZ.W EnemyData.loopCounter,X                                        ;A8A1B7;
    LDA.W #Function_YappingMaw_Neutral                                   ;A8A1BA;
    STA.W EnemyData.work0,X                                              ;A8A1BD;
    LDA.W EnemyData.palette,X                                            ;A8A1C0;
    AND.W #$0E00                                                         ;A8A1C3;
    STA.L $7E880A,X                                                      ;A8A1C6;
    LDA.W #$0003                                                         ;A8A1CA;
    STA.L $7E8808,X                                                      ;A8A1CD;

.loop:
    LDX.W $0E54                                                          ;A8A1D1;
    LDY.W #EnemyProjectile_YappingMawsBody                               ;A8A1D4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8A1D7;
    LDX.W $0E54                                                          ;A8A1DB;
    LDA.L $7E8808,X                                                      ;A8A1DE;
    DEC A                                                                ;A8A1E2;
    STA.L $7E8808,X                                                      ;A8A1E3;
    BPL .loop                                                            ;A8A1E7;
    LDA.W EnemyData.xPosition,X                                          ;A8A1E9;
    STA.B $12                                                            ;A8A1EC;
    LDA.W EnemyData.yPosition,X                                          ;A8A1EE;
    CLC                                                                  ;A8A1F1;
    ADC.B $22                                                            ;A8A1F2;
    STA.B $14                                                            ;A8A1F4;
    LDA.B $24                                                            ;A8A1F6;
    STA.B $16                                                            ;A8A1F8;
    LDA.W EnemyData.palette,X                                            ;A8A1FA;
    ORA.W EnemyData.gfxOffset,X                                          ;A8A1FD;
    STA.L $7E880E,X                                                      ;A8A200;
    STA.B $18                                                            ;A8A204;
    JSL.L Create_Sprite_Object                                           ;A8A206;
    LDA.B $12                                                            ;A8A20A;
    STA.L $7E880C,X                                                      ;A8A20C;
    RTL                                                                  ;A8A210;


MainAI_YappingMaw:
    LDX.W $0E54                                                          ;A8A211;
    LDA.L $7E802A,X                                                      ;A8A214;
    DEC A                                                                ;A8A218;
    STA.L $7E802A,X                                                      ;A8A219;
    JSL.L CheckIfEnemyCenterIsOnScreen                                   ;A8A21D;
    STA.L $7E802C,X                                                      ;A8A221;
    JSR.W ($0FA8,X)                                                      ;A8A225;
    JSR.W SetBodySegmentPosition_3                                       ;A8A228;
    JSR.W SetBodySegmentPosition_2                                       ;A8A22B;
    JSR.W SetBodySegmentPosition_1                                       ;A8A22E;
    JSR.W SetBodySegmentPosition_0                                       ;A8A231;
    RTL                                                                  ;A8A234;


Function_YappingMaw_Neutral:
    LDX.W $0E54                                                          ;A8A235;
    LDA.W EnemyData.xPosition,X                                          ;A8A238;
    STA.W $0E32                                                          ;A8A23B;
    LDA.W EnemyData.yPosition,X                                          ;A8A23E;
    STA.W $0E34                                                          ;A8A241;
    LDA.W $0AF6                                                          ;A8A244;
    STA.W $0E36                                                          ;A8A247;
    LDA.W $0AFA                                                          ;A8A24A;
    STA.W $0E38                                                          ;A8A24D;
    JSL.L CalculateDistanceAndAngleOfSamusFromEnemy                      ;A8A250;
    JSL.L NegateA_A0B067                                                 ;A8A254;
    STA.L $7E7810,X                                                      ;A8A258;
    CMP.W #$0020                                                         ;A8A25C;
    BMI .pointBlank                                                      ;A8A25F;
    CMP.W EnemyData.work5,X                                              ;A8A261;
    BPL .return                                                          ;A8A264;
    LDA.L $7E7810,X                                                      ;A8A266; >_<
    CMP.W #$0040                                                         ;A8A26A;
    BMI +                                                                ;A8A26D;
    LDA.W #$0040                                                         ;A8A26F;
    STA.L $7E7810,X                                                      ;A8A272;

  + LDA.W $0E3A                                                          ;A8A276;
    STA.L $7E7814,X                                                      ;A8A279;
    LDA.W #Function_YappingMaw_Attack                                    ;A8A27D;
    STA.W EnemyData.work0,X                                              ;A8A280;

.return:
    RTS                                                                  ;A8A283;


.pointBlank:
    LDA.W #$0030                                                         ;A8A284;
    STA.L $7E802A,X                                                      ;A8A287;
    RTS                                                                  ;A8A28B;


Function_YappingMaw_Attack:
    LDX.W $0E54                                                          ;A8A28C;
    STZ.W EnemyData.work1,X                                              ;A8A28F;
    STZ.W EnemyData.work2,X                                              ;A8A292;
    STZ.W EnemyData.work3,X                                              ;A8A295;
    LDA.L $7E7810,X                                                      ;A8A298;
    LSR A                                                                ;A8A29C;
    STA.L $7E7812,X                                                      ;A8A29D;
    LDA.L $7E7814,X                                                      ;A8A2A1;
    SEC                                                                  ;A8A2A5;
    SBC.W #$0040                                                         ;A8A2A6;
    AND.W #$00FF                                                         ;A8A2A9;
    EOR.W #$FFFF                                                         ;A8A2AC;
    INC A                                                                ;A8A2AF;
    CLC                                                                  ;A8A2B0;
    ADC.W #$0100                                                         ;A8A2B1;
    AND.W #$00FF                                                         ;A8A2B4;
    STA.L $7E7816,X                                                      ;A8A2B7;
    CMP.W #$0080                                                         ;A8A2BB;
    BPL .targetAngleGreaterThanEqualTo80                                 ;A8A2BE;
    LDA.W #$0000                                                         ;A8A2C0;
    STA.L $7E801E,X                                                      ;A8A2C3;
    BRA +                                                                ;A8A2C7;


.targetAngleGreaterThanEqualTo80:
    LDA.W #$0001                                                         ;A8A2C9;
    STA.L $7E801E,X                                                      ;A8A2CC;

  + JSR.W CalculateYappingMawOriginPosition                              ;A8A2D0;
    LDA.L $7E7814,X                                                      ;A8A2D3;
    CLC                                                                  ;A8A2D7;
    ADC.W #$0010                                                         ;A8A2D8;
    AND.W #$00FF                                                         ;A8A2DB;
    LSR A                                                                ;A8A2DE;
    LSR A                                                                ;A8A2DF;
    LSR A                                                                ;A8A2E0;
    LSR A                                                                ;A8A2E1;
    LSR A                                                                ;A8A2E2;
    ASL A                                                                ;A8A2E3;
    STA.L $7E8028,X                                                      ;A8A2E4;
    TAY                                                                  ;A8A2E8;
    LDA.W InstListPointers_YappingMaw,Y                                  ;A8A2E9;
    STA.W EnemyData.pInstList,X                                          ;A8A2EC;
    LDA.W #$0001                                                         ;A8A2EF;
    STA.W EnemyData.instTimer,X                                          ;A8A2F2;
    STZ.W EnemyData.loopCounter,X                                        ;A8A2F5;
    TYA                                                                  ;A8A2F8;
    ASL A                                                                ;A8A2F9;
    TAY                                                                  ;A8A2FA;
    LDA.W YappingMawSamusOffsets_X_Up,Y                                  ;A8A2FB;
    STA.L $7E8024,X                                                      ;A8A2FE;
    LDA.W YappingMawSamusOffsets_Y_Up,Y                                  ;A8A302;
    STA.L $7E8026,X                                                      ;A8A305;
    LDA.W #Function_YappingMaw_Attacking                                 ;A8A309;
    STA.W EnemyData.work0,X                                              ;A8A30C;
    RTS                                                                  ;A8A30F;


CalculateYappingMawOriginPosition:
    LDX.W $0E54                                                          ;A8A310;
    LDA.L $7E7812,X                                                      ;A8A313;
    STA.W $0E32                                                          ;A8A317;
    LDA.W #$0080                                                         ;A8A31A;
    JSL.L Math_Cosine_A8A73E                                             ;A8A31D;
    STA.L $7E781C,X                                                      ;A8A321;
    LDA.L $7E7812,X                                                      ;A8A325;
    LSR A                                                                ;A8A329;
    STA.W $0E32                                                          ;A8A32A;
    LDA.W #$0080                                                         ;A8A32D;
    JSL.L Math_Sine_A8A742                                               ;A8A330;
    STA.L $7E781E,X                                                      ;A8A334;
    RTS                                                                  ;A8A338;


CalculateBodySegment1Velocities:
    LDX.W $0E54                                                          ;A8A339;
    LDA.L $7E7800,X                                                      ;A8A33C;
    STA.W $0E32                                                          ;A8A340;
    LDA.W #$0000                                                         ;A8A343;
    JSL.L Math_Cosine_A8A73E                                             ;A8A346;
    STA.L $7E7820,X                                                      ;A8A34A;
    LDA.W #$0000                                                         ;A8A34E;
    JSL.L Math_Sine_A8A742                                               ;A8A351;
    STA.L $7E7822,X                                                      ;A8A355;
    LDA.L $7E7816,X                                                      ;A8A359;
    JSL.L Math_Cosine_A8A73E                                             ;A8A35D;
    SEC                                                                  ;A8A361;
    SBC.L $7E7820,X                                                      ;A8A362;
    STA.L $7E800E,X                                                      ;A8A366;
    LDA.L $7E7816,X                                                      ;A8A36A;
    JSL.L Math_Sine_A8A742                                               ;A8A36E;
    SEC                                                                  ;A8A372;
    SBC.L $7E7822,X                                                      ;A8A373;
    STA.L $7E8010,X                                                      ;A8A377;
    RTS                                                                  ;A8A37B;


CalculateBodySegment2Velocities:
    LDX.W $0E54                                                          ;A8A37C;
    LDA.L $7E7804,X                                                      ;A8A37F;
    STA.W $0E32                                                          ;A8A383;
    LDA.W #$0000                                                         ;A8A386;
    JSL.L Math_Cosine_A8A73E                                             ;A8A389;
    STA.L $7E7820,X                                                      ;A8A38D;
    LDA.W #$0000                                                         ;A8A391;
    JSL.L Math_Sine_A8A742                                               ;A8A394;
    STA.L $7E7822,X                                                      ;A8A398;
    LDA.L $7E7816,X                                                      ;A8A39C;
    JSL.L Math_Cosine_A8A73E                                             ;A8A3A0;
    SEC                                                                  ;A8A3A4;
    SBC.L $7E7820,X                                                      ;A8A3A5;
    STA.L $7E8012,X                                                      ;A8A3A9;
    LDA.L $7E7816,X                                                      ;A8A3AD;
    JSL.L Math_Sine_A8A742                                               ;A8A3B1;
    SEC                                                                  ;A8A3B5;
    SBC.L $7E7822,X                                                      ;A8A3B6;
    STA.L $7E8014,X                                                      ;A8A3BA;
    RTS                                                                  ;A8A3BE;


CalculateBodySegment3Velocities:
    LDX.W $0E54                                                          ;A8A3BF;
    LDA.L $7E7808,X                                                      ;A8A3C2;
    STA.W $0E32                                                          ;A8A3C6;
    LDA.W #$0000                                                         ;A8A3C9;
    JSL.L Math_Cosine_A8A73E                                             ;A8A3CC;
    STA.L $7E7820,X                                                      ;A8A3D0;
    LDA.W #$0000                                                         ;A8A3D4;
    JSL.L Math_Sine_A8A742                                               ;A8A3D7;
    STA.L $7E7822,X                                                      ;A8A3DB;
    LDA.L $7E7816,X                                                      ;A8A3DF;
    JSL.L Math_Cosine_A8A73E                                             ;A8A3E3;
    SEC                                                                  ;A8A3E7;
    SBC.L $7E7820,X                                                      ;A8A3E8;
    STA.L $7E8016,X                                                      ;A8A3EC;
    LDA.L $7E7816,X                                                      ;A8A3F0;
    JSL.L Math_Sine_A8A742                                               ;A8A3F4;
    SEC                                                                  ;A8A3F8;
    SBC.L $7E7822,X                                                      ;A8A3F9;
    STA.L $7E8018,X                                                      ;A8A3FD;
    RTS                                                                  ;A8A401;


CalculateHeadSegmentVelocities:
    LDX.W $0E54                                                          ;A8A402;
    LDA.L $7E780C,X                                                      ;A8A405;
    STA.W $0E32                                                          ;A8A409;
    LDA.W #$0000                                                         ;A8A40C;
    JSL.L Math_Cosine_A8A73E                                             ;A8A40F;
    STA.L $7E7820,X                                                      ;A8A413;
    LDA.W #$0000                                                         ;A8A417;
    JSL.L Math_Sine_A8A742                                               ;A8A41A;
    STA.L $7E7822,X                                                      ;A8A41E;
    LDA.L $7E7816,X                                                      ;A8A422;
    JSL.L Math_Cosine_A8A73E                                             ;A8A426;
    SEC                                                                  ;A8A42A;
    SBC.L $7E7820,X                                                      ;A8A42B;
    STA.L $7E801A,X                                                      ;A8A42F;
    LDA.L $7E7816,X                                                      ;A8A433;
    JSL.L Math_Sine_A8A742                                               ;A8A437;
    SEC                                                                  ;A8A43B;
    SBC.L $7E7822,X                                                      ;A8A43C;
    STA.L $7E801C,X                                                      ;A8A440;
    RTS                                                                  ;A8A444;


Function_YappingMaw_Attacking:
    LDX.W $0E54                                                          ;A8A445;
    LDA.W EnemyData.work1,X                                              ;A8A448;
    LSR A                                                                ;A8A44B;
    LSR A                                                                ;A8A44C;
    STA.B $14                                                            ;A8A44D;
    LDA.L $7E801E,X                                                      ;A8A44F;
    BNE .notAimingDown                                                   ;A8A453;
    SEC                                                                  ;A8A455;
    LDA.W #$0080                                                         ;A8A456;
    SBC.B $14                                                            ;A8A459;
    STA.L $7E8002,X                                                      ;A8A45B;
    SBC.B $14                                                            ;A8A45F;
    STA.L $7E8004,X                                                      ;A8A461;
    SBC.B $14                                                            ;A8A465;
    STA.L $7E8006,X                                                      ;A8A467;
    SBC.B $14                                                            ;A8A46B;
    STA.L $7E8008,X                                                      ;A8A46D;
    BRA +                                                                ;A8A471;


.notAimingDown:
    CLC                                                                  ;A8A473;
    LDA.W #$0080                                                         ;A8A474;
    ADC.B $14                                                            ;A8A477;
    STA.L $7E8002,X                                                      ;A8A479;
    ADC.B $14                                                            ;A8A47D;
    STA.L $7E8004,X                                                      ;A8A47F;
    ADC.B $14                                                            ;A8A483;
    STA.L $7E8006,X                                                      ;A8A485;
    ADC.B $14                                                            ;A8A489;
    STA.L $7E8008,X                                                      ;A8A48B;

  + LDA.L $7E7812,X                                                      ;A8A48F;
    STA.W $0E32                                                          ;A8A493;
    LDA.L $7E8002,X                                                      ;A8A496;
    JSL.L Math_Cosine_A8A73E                                             ;A8A49A;
    SEC                                                                  ;A8A49E;
    SBC.L $7E781C,X                                                      ;A8A49F;
    STA.L $7E7800,X                                                      ;A8A4A3;
    LDA.L $7E8004,X                                                      ;A8A4A7;
    JSL.L Math_Cosine_A8A73E                                             ;A8A4AB;
    SEC                                                                  ;A8A4AF;
    SBC.L $7E781C,X                                                      ;A8A4B0;
    STA.L $7E7804,X                                                      ;A8A4B4;
    LDA.L $7E8006,X                                                      ;A8A4B8;
    JSL.L Math_Cosine_A8A73E                                             ;A8A4BC;
    SEC                                                                  ;A8A4C0;
    SBC.L $7E781C,X                                                      ;A8A4C1;
    STA.L $7E7808,X                                                      ;A8A4C5;
    LDA.L $7E8008,X                                                      ;A8A4C9;
    JSL.L Math_Cosine_A8A73E                                             ;A8A4CD;
    SEC                                                                  ;A8A4D1;
    SBC.L $7E781C,X                                                      ;A8A4D2;
    STA.L $7E780C,X                                                      ;A8A4D6;
    LDA.L $7E7812,X                                                      ;A8A4DA;
    LSR A                                                                ;A8A4DE;
    STA.W $0E32                                                          ;A8A4DF;
    LDA.L $7E8002,X                                                      ;A8A4E2;
    JSL.L Math_Sine_A8A742                                               ;A8A4E6;
    SEC                                                                  ;A8A4EA;
    SBC.L $7E781E,X                                                      ;A8A4EB;
    STA.L $7E7802,X                                                      ;A8A4EF;
    LDA.L $7E8004,X                                                      ;A8A4F3;
    JSL.L Math_Sine_A8A742                                               ;A8A4F7;
    SEC                                                                  ;A8A4FB;
    SBC.L $7E781E,X                                                      ;A8A4FC;
    STA.L $7E7806,X                                                      ;A8A500;
    LDA.L $7E8006,X                                                      ;A8A504;
    JSL.L Math_Sine_A8A742                                               ;A8A508;
    SEC                                                                  ;A8A50C;
    SBC.L $7E781E,X                                                      ;A8A50D;
    STA.L $7E780A,X                                                      ;A8A511;
    LDA.L $7E8008,X                                                      ;A8A515;
    JSL.L Math_Sine_A8A742                                               ;A8A519;
    SEC                                                                  ;A8A51D;
    SBC.L $7E781E,X                                                      ;A8A51E;
    STA.L $7E780E,X                                                      ;A8A522;
    JSR.W CalculateBodySegment1Velocities                                ;A8A526;
    JSR.W CalculateBodySegment2Velocities                                ;A8A529;
    JSR.W CalculateBodySegment3Velocities                                ;A8A52C;
    JSR.W CalculateHeadSegmentVelocities                                 ;A8A52F;
    CLC                                                                  ;A8A532;
    LDA.L $7E7800,X                                                      ;A8A533;
    ADC.L $7E800E,X                                                      ;A8A537;
    STA.L $7E7800,X                                                      ;A8A53B;
    LDA.L $7E7802,X                                                      ;A8A53F;
    ADC.L $7E8010,X                                                      ;A8A543;
    STA.L $7E7802,X                                                      ;A8A547;
    LDA.L $7E7804,X                                                      ;A8A54B;
    ADC.L $7E8012,X                                                      ;A8A54F;
    STA.L $7E7804,X                                                      ;A8A553;
    LDA.L $7E7806,X                                                      ;A8A557;
    ADC.L $7E8014,X                                                      ;A8A55B;
    STA.L $7E7806,X                                                      ;A8A55F;
    LDA.L $7E7808,X                                                      ;A8A563;
    ADC.L $7E8016,X                                                      ;A8A567;
    STA.L $7E7808,X                                                      ;A8A56B;
    LDA.L $7E780A,X                                                      ;A8A56F;
    ADC.L $7E8018,X                                                      ;A8A573;
    STA.L $7E780A,X                                                      ;A8A577;
    LDA.L $7E780C,X                                                      ;A8A57B;
    ADC.L $7E801A,X                                                      ;A8A57F;
    STA.L $7E780C,X                                                      ;A8A583;
    LDA.L $7E780E,X                                                      ;A8A587;
    ADC.L $7E801C,X                                                      ;A8A58B;
    STA.L $7E780E,X                                                      ;A8A58F;
    LDA.L $7E7818,X                                                      ;A8A593;
    CLC                                                                  ;A8A597;
    ADC.L $7E780C,X                                                      ;A8A598;
    STA.W EnemyData.xPosition,X                                          ;A8A59C;
    LDA.L $7E781A,X                                                      ;A8A59F;
    CLC                                                                  ;A8A5A3;
    ADC.L $7E780E,X                                                      ;A8A5A4;
    STA.W EnemyData.yPosition,X                                          ;A8A5A8;
    JSR.W UpdateYappingMawAngularSpeed                                   ;A8A5AB;
    LDA.W EnemyData.work1,X                                              ;A8A5AE;
    CMP.W #$0000                                                         ;A8A5B1;
    BMI .cooldown                                                        ;A8A5B4;
    CMP.W #$0080                                                         ;A8A5B6;
    BMI .gotoMoveSamus                                                   ;A8A5B9;
    LDA.W #$0080                                                         ;A8A5BB;
    STA.W EnemyData.work1,X                                              ;A8A5BE;
    STZ.W EnemyData.work2,X                                              ;A8A5C1;
    INC.W EnemyData.work3,X                                              ;A8A5C4;
    INC.W EnemyData.work3,X                                              ;A8A5C7;
    INC.W EnemyData.work3,X                                              ;A8A5CA;
    INC.W EnemyData.work3,X                                              ;A8A5CD;
    BRA .gotoMoveSamus                                                   ;A8A5D0;


.cooldown:
    LDA.W #Function_YappingMaw_Cooldown                                  ;A8A5D2;
    STA.W EnemyData.work0,X                                              ;A8A5D5;
    LDA.W #$0030                                                         ;A8A5D8;
    STA.L $7E802A,X                                                      ;A8A5DB;
    LDA.L $7E8028,X                                                      ;A8A5DF;
    CMP.W #$0004                                                         ;A8A5E3;
    BEQ .upRight                                                         ;A8A5E6;
    CMP.W #$000C                                                         ;A8A5E8;
    BEQ .upLeft                                                          ;A8A5EB;
    BRA .up                                                              ;A8A5ED;


.gotoMoveSamus:
    BRA .moveSamus                                                       ;A8A5EF;


.upRight:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUpRight                    ;A8A5F1;
    STA.W EnemyData.pInstList,X                                          ;A8A5F4;
    BRA .upMerge                                                         ;A8A5F7;


.upLeft:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUpLeft_0                   ;A8A5F9;
    STA.W EnemyData.pInstList,X                                          ;A8A5FC;
    BRA .upMerge                                                         ;A8A5FF;


.up:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUp_0                       ;A8A601;
    STA.W EnemyData.pInstList,X                                          ;A8A604;

.upMerge:
    LDA.W EnemyData.initParam1,X                                         ;A8A607;
    BNE .return                                                          ;A8A60A;
    LDA.L $7E8028,X                                                      ;A8A60C;
    CMP.W #$0004                                                         ;A8A610;
    BEQ .downRight                                                       ;A8A613;
    CMP.W #$000C                                                         ;A8A615;
    BEQ .downLeft                                                        ;A8A618;
    BRA .down                                                            ;A8A61A;


.downRight:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDownRight                  ;A8A61C;
    STA.W EnemyData.pInstList,X                                          ;A8A61F;
    BRA .moveSamus                                                       ;A8A622;


.downLeft:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDownLeft_0                 ;A8A624;
    STA.W EnemyData.pInstList,X                                          ;A8A627;
    BRA .moveSamus                                                       ;A8A62A;


.down:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDown_0                     ;A8A62C;
    STA.W EnemyData.pInstList,X                                          ;A8A62F;
    BRA .return                                                          ;A8A632;


.moveSamus:
    LDA.L $7E8020,X                                                      ;A8A634;
    BEQ .return                                                          ;A8A638;
    JSR.W MoveSamusWithYappingMawPincers                                 ;A8A63A;

.return:
    RTS                                                                  ;A8A63D;


UpdateYappingMawAngularSpeed:
    LDY.W EnemyData.work3,X                                              ;A8A63E;
    LDA.W EnemyData.work1,X                                              ;A8A641;
    CLC                                                                  ;A8A644;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8A645;
    STA.W EnemyData.work1,X                                              ;A8A648;
    LDA.W EnemyData.work2,X                                              ;A8A64B;
    CLC                                                                  ;A8A64E;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A8A64F;
    BCC +                                                                ;A8A652;
    INC.W EnemyData.work1,X                                              ;A8A654;

  + STA.W EnemyData.work2,X                                              ;A8A657;
    LDA.W EnemyData.work3,X                                              ;A8A65A;
    CLC                                                                  ;A8A65D;
    ADC.W #$0008                                                         ;A8A65E;
    STA.W EnemyData.work3,X                                              ;A8A661;
    RTS                                                                  ;A8A664;


MoveSamusWithYappingMawPincers:
    LDX.W $0E54                                                          ;A8A665;
    LDA.W #$0003                                                         ;A8A668;
    JSL.L Run_Samus_Command                                              ;A8A66B;
    LDA.W EnemyData.xPosition,X                                          ;A8A66F;
    CLC                                                                  ;A8A672;
    ADC.L $7E8024,X                                                      ;A8A673;
    STA.W $0AF6                                                          ;A8A677;
    LDA.W EnemyData.yPosition,X                                          ;A8A67A;
    CLC                                                                  ;A8A67D;
    ADC.L $7E8026,X                                                      ;A8A67E;
    STA.W $0AFA                                                          ;A8A682;
    JSL.L CapScrollingSpeed                                              ;A8A685;
    RTS                                                                  ;A8A689;


Function_YappingMaw_Cooldown:
    LDX.W $0E54                                                          ;A8A68A;
    LDA.L $7E8020,X                                                      ;A8A68D;
    BEQ .notGrabbingSamus                                                ;A8A691;
    JSR.W MoveSamusWithYappingMawPincers                                 ;A8A693;

.notGrabbingSamus:
    DEC.W EnemyData.work4,X                                              ;A8A696;
    BPL .return                                                          ;A8A699;
    LDA.W $0A60                                                          ;A8A69B;
    CMP.W #SamusPoseInputHandler_Demo                                    ;A8A69E;
    BEQ .return                                                          ;A8A6A1;
    LDA.W #SamusPoseInputHandler_Normal                                  ;A8A6A3;
    STA.W $0A60                                                          ;A8A6A6;
    LDA.W #$0000                                                         ;A8A6A9;
    STA.L $7E8020,X                                                      ;A8A6AC;
    LDA.W #$0030                                                         ;A8A6B0;
    STA.L $7E802A,X                                                      ;A8A6B3;
    LDA.W #$0040                                                         ;A8A6B7;
    STA.W EnemyData.work4,X                                              ;A8A6BA;
    LDA.W #Function_YappingMaw_Neutral                                   ;A8A6BD;
    STA.W EnemyData.work0,X                                              ;A8A6C0;

.return:
    RTS                                                                  ;A8A6C3;


SetBodySegmentPosition_0:
    LDX.W $0E54                                                          ;A8A6C4;
    LDA.L $7E8800,X                                                      ;A8A6C7;
    TAY                                                                  ;A8A6CB;
    LDA.L $7E7818,X                                                      ;A8A6CC;
    STA.W $1A4B,Y                                                        ;A8A6D0;
    LDA.L $7E781A,X                                                      ;A8A6D3;
    STA.W $1A93,Y                                                        ;A8A6D7;
    RTS                                                                  ;A8A6DA;


SetBodySegmentPosition_1:
    LDX.W $0E54                                                          ;A8A6DB;
    LDA.L $7E8802,X                                                      ;A8A6DE;
    TAY                                                                  ;A8A6E2;
    LDA.L $7E7818,X                                                      ;A8A6E3;
    CLC                                                                  ;A8A6E7;
    ADC.L $7E7800,X                                                      ;A8A6E8;
    STA.W $1A4B,Y                                                        ;A8A6EC;
    LDA.L $7E781A,X                                                      ;A8A6EF;
    CLC                                                                  ;A8A6F3;
    ADC.L $7E7802,X                                                      ;A8A6F4;
    STA.W $1A93,Y                                                        ;A8A6F8;
    RTS                                                                  ;A8A6FB;


SetBodySegmentPosition_2:
    LDX.W $0E54                                                          ;A8A6FC;
    LDA.L $7E8804,X                                                      ;A8A6FF;
    TAY                                                                  ;A8A703;
    LDA.L $7E7818,X                                                      ;A8A704;
    CLC                                                                  ;A8A708;
    ADC.L $7E7804,X                                                      ;A8A709;
    STA.W $1A4B,Y                                                        ;A8A70D;
    LDA.L $7E781A,X                                                      ;A8A710;
    CLC                                                                  ;A8A714;
    ADC.L $7E7806,X                                                      ;A8A715;
    STA.W $1A93,Y                                                        ;A8A719;
    RTS                                                                  ;A8A71C;


SetBodySegmentPosition_3:
    LDX.W $0E54                                                          ;A8A71D;
    LDA.L $7E8806,X                                                      ;A8A720;
    TAY                                                                  ;A8A724;
    LDA.L $7E7818,X                                                      ;A8A725;
    CLC                                                                  ;A8A729;
    ADC.L $7E7808,X                                                      ;A8A72A;
    STA.W $1A4B,Y                                                        ;A8A72E;
    LDA.L $7E781A,X                                                      ;A8A731;
    CLC                                                                  ;A8A735;
    ADC.L $7E780A,X                                                      ;A8A736;
    STA.W $1A93,Y                                                        ;A8A73A;
    RTS                                                                  ;A8A73D;


Math_Cosine_A8A73E:
    SEC                                                                  ;A8A73E;
    SBC.W #$0040                                                         ;A8A73F;

Math_Sine_A8A742:
    STA.B $12                                                            ;A8A742;
    LDA.W #$0100                                                         ;A8A744;
    SEC                                                                  ;A8A747;
    SBC.B $12                                                            ;A8A748;
    AND.W #$00FF                                                         ;A8A74A;
    ASL A                                                                ;A8A74D;
    TAX                                                                  ;A8A74E;
    PHP                                                                  ;A8A74F;
    STZ.B $14                                                            ;A8A750;
    STZ.B $16                                                            ;A8A752;
    LDA.L SineCosineTables_16bitSine,X                                   ;A8A754;
    BPL +                                                                ;A8A758;
    EOR.W #$FFFF                                                         ;A8A75A;
    INC A                                                                ;A8A75D;
    INC.B $14                                                            ;A8A75E;

  + AND.W #$FF00                                                         ;A8A760;
    XBA                                                                  ;A8A763;
    SEP #$20                                                             ;A8A764;
    STA.W HW_WRMPYA                                                      ;A8A766;
    LDA.W $0E32                                                          ;A8A769;
    BEQ +                                                                ;A8A76C;
    STA.W HW_WRMPYB                                                      ;A8A76E;
    NOP                                                                  ;A8A771;
    NOP                                                                  ;A8A772;
    NOP                                                                  ;A8A773;
    REP #$20                                                             ;A8A774;
    LDA.W HW_RDMPY                                                       ;A8A776;
    AND.W #$FF00                                                         ;A8A779;
    XBA                                                                  ;A8A77C;
    ASL A                                                                ;A8A77D;
    STA.B $16                                                            ;A8A77E;
    LDA.B $14                                                            ;A8A780;
    BEQ +                                                                ;A8A782;
    LDA.W HW_RDMPY                                                       ;A8A784;
    EOR.W #$FFFF                                                         ;A8A787;
    INC A                                                                ;A8A78A;
    XBA                                                                  ;A8A78B;
    ASL A                                                                ;A8A78C;
    ORA.W #$FF00                                                         ;A8A78D;
    STA.B $16                                                            ;A8A790;

  + LDA.B $16                                                            ;A8A792;
    LDX.W $0E54                                                          ;A8A794;
    PLP                                                                  ;A8A797;
    RTL                                                                  ;A8A798;


EnemyTouch_YappingMaw:
    LDX.W $0E54                                                          ;A8A799;
    LDA.L $7E802A,X                                                      ;A8A79C;
    BPL .return                                                          ;A8A7A0;
    LDA.L $7E8020,X                                                      ;A8A7A2;
    BNE .return                                                          ;A8A7A6;
    LDA.W #$0000                                                         ;A8A7A8;
    STA.L $7E802A,X                                                      ;A8A7AB;
    LDA.W #$0001                                                         ;A8A7AF;
    STA.L $7E8020,X                                                      ;A8A7B2;
    LDA.W #RTS_90E90E                                                    ;A8A7B6;
    STA.W $0A60                                                          ;A8A7B9;

.return:
    RTL                                                                  ;A8A7BC;


EnemyShot_YappingMaw:
    JSL.L NormalEnemyShotAI                                              ;A8A7BD;
    LDX.W $0E54                                                          ;A8A7C1;
    LDA.W EnemyData.health,X                                             ;A8A7C4;
    BNE .alive                                                           ;A8A7C7;
    LDA.L $7E8800,X                                                      ;A8A7C9;
    TAY                                                                  ;A8A7CD;
    LDA.W #$0000                                                         ;A8A7CE;
    STA.W $1997,Y                                                        ;A8A7D1;
    LDA.L $7E8802,X                                                      ;A8A7D4;
    TAY                                                                  ;A8A7D8;
    LDA.W #$0000                                                         ;A8A7D9;
    STA.W $1997,Y                                                        ;A8A7DC;
    LDA.L $7E8804,X                                                      ;A8A7DF;
    TAY                                                                  ;A8A7E3;
    LDA.W #$0000                                                         ;A8A7E4;
    STA.W $1997,Y                                                        ;A8A7E7;
    LDA.L $7E8806,X                                                      ;A8A7EA;
    TAY                                                                  ;A8A7EE;
    LDA.W #$0000                                                         ;A8A7EF;
    STA.W $1997,Y                                                        ;A8A7F2;
    PHX                                                                  ;A8A7F5;
    LDA.L $7E880C,X                                                      ;A8A7F6;
    TAX                                                                  ;A8A7FA;
    LDA.W #$0000                                                         ;A8A7FB;
    STA.L $7EEF78,X                                                      ;A8A7FE;
    PLX                                                                  ;A8A802;
    LDA.W $0A60                                                          ;A8A803;
    CMP.W #SamusPoseInputHandler_Demo                                    ;A8A806;
    BEQ .notDemo                                                         ;A8A809;
    LDA.W #SamusPoseInputHandler_Normal                                  ;A8A80B;
    STA.W $0A60                                                          ;A8A80E;

.notDemo:
    LDA.W #$0000                                                         ;A8A811;
    STA.L $7E8020,X                                                      ;A8A814;
    BRA .return                                                          ;A8A818;


.alive:
    LDA.W EnemyData.freezeTimer,X                                        ;A8A81A;
    BEQ .return                                                          ;A8A81D;
    LDA.W $0A60                                                          ;A8A81F;
    CMP.W #SamusPoseInputHandler_Demo                                    ;A8A822;
    BEQ .alsoNotDemo                                                     ;A8A825;
    LDA.W #SamusPoseInputHandler_Normal                                  ;A8A827;
    STA.W $0A60                                                          ;A8A82A;

.alsoNotDemo:
    LDA.W #$0000                                                         ;A8A82D;
    STA.L $7E8020,X                                                      ;A8A830;

.return:
    RTL                                                                  ;A8A834;


FrozenAI_YappingMaw:
    JSL.L CommonA8_NormalEnemyFrozenAI                                   ;A8A835;
    LDA.L $7E8800,X                                                      ;A8A839;
    TAY                                                                  ;A8A83D;
    JSR.W SetYappingMawBodySegmentFrozenPalette                          ;A8A83E;
    LDA.L $7E8802,X                                                      ;A8A841;
    TAY                                                                  ;A8A845;
    JSR.W SetYappingMawBodySegmentFrozenPalette                          ;A8A846;
    LDA.L $7E8804,X                                                      ;A8A849;
    TAY                                                                  ;A8A84D;
    JSR.W SetYappingMawBodySegmentFrozenPalette                          ;A8A84E;
    LDA.L $7E8806,X                                                      ;A8A851;
    TAY                                                                  ;A8A855;
    JSR.W SetYappingMawBodySegmentFrozenPalette                          ;A8A856;
    JSR.W SetYappingMawBaseFrozenPalette                                 ;A8A859;
    RTL                                                                  ;A8A85C;


SetYappingMawBodySegmentFrozenPalette:
    LDX.W $0E54                                                          ;A8A85D;
    LDA.W $19BB,Y                                                        ;A8A860;
    AND.W #$F1FF                                                         ;A8A863;
    ORA.L $7E880A,X                                                      ;A8A866;
    STA.W $19BB,Y                                                        ;A8A86A;
    LDA.W EnemyData.freezeTimer,X                                        ;A8A86D;
    BEQ .return                                                          ;A8A870;
    LDA.W $19BB,Y                                                        ;A8A872;
    AND.W #$F1FF                                                         ;A8A875;
    ORA.W #$0C00                                                         ;A8A878;
    STA.W $19BB,Y                                                        ;A8A87B;
    LDA.W EnemyData.freezeTimer,X                                        ;A8A87E;
    CMP.W #$005A                                                         ;A8A881;
    BPL .return                                                          ;A8A884;
    BIT.W #$0002                                                         ;A8A886;
    BNE .return                                                          ;A8A889;
    LDA.W $19BB,Y                                                        ;A8A88B;
    AND.W #$F1FF                                                         ;A8A88E;
    ORA.L $7E880A,X                                                      ;A8A891;
    STA.W $19BB,Y                                                        ;A8A895;

.return:
    RTS                                                                  ;A8A898;


SetYappingMawBaseFrozenPalette:
    LDX.W $0E54                                                          ;A8A899;
    LDA.L $7E880A,X                                                      ;A8A89C;
    STA.B $12                                                            ;A8A8A0;
    LDA.L $7E880C,X                                                      ;A8A8A2;
    STA.B $14                                                            ;A8A8A6;
    TAX                                                                  ;A8A8A8;
    LDA.L $7EF078,X                                                      ;A8A8A9;
    AND.W #$F1FF                                                         ;A8A8AD;
    ORA.B $12                                                            ;A8A8B0;
    STA.L $7EF078,X                                                      ;A8A8B2;
    LDX.W $0E54                                                          ;A8A8B6;
    LDA.W EnemyData.freezeTimer,X                                        ;A8A8B9;
    BEQ .return                                                          ;A8A8BC;
    LDX.B $14                                                            ;A8A8BE;
    LDA.L $7EF078,X                                                      ;A8A8C0;
    AND.W #$F1FF                                                         ;A8A8C4;
    ORA.W #$0C00                                                         ;A8A8C7;
    STA.L $7EF078,X                                                      ;A8A8CA;
    LDX.W $0E54                                                          ;A8A8CE;
    LDA.W EnemyData.freezeTimer,X                                        ;A8A8D1;
    CMP.W #$005A                                                         ;A8A8D4;
    BPL .return                                                          ;A8A8D7;
    BIT.W #$0002                                                         ;A8A8D9;
    BNE .return                                                          ;A8A8DC;
    LDX.B $14                                                            ;A8A8DE;
    LDA.L $7EF078,X                                                      ;A8A8E0;
    AND.W #$F1FF                                                         ;A8A8E4;
    ORA.B $12                                                            ;A8A8E7;
    STA.L $7EF078,X                                                      ;A8A8E9;

.return:
    RTS                                                                  ;A8A8ED;


Spritemap_YappingMaw_0:
    dw $0005,$81F8                                                       ;A8A8EE;
    db $F8                                                               ;A8A8F2;
    dw $2100,$01F4                                                       ;A8A8F3;
    db $FA                                                               ;A8A8F7;
    dw $210F,$01EC                                                       ;A8A8F8;
    db $FA                                                               ;A8A8FC;
    dw $210E,$0004                                                       ;A8A8FD;
    db $FA                                                               ;A8A901;
    dw $610F,$000C                                                       ;A8A902;
    db $FA                                                               ;A8A906;
    dw $610E                                                             ;A8A907;

Spritemap_YappingMaw_1:
    dw $0003,$81F8                                                       ;A8A909;
    db $F8                                                               ;A8A90D;
    dw $2100,$8004                                                       ;A8A90E;
    db $F0                                                               ;A8A912;
    dw $6106,$81EC                                                       ;A8A913;
    db $F0                                                               ;A8A917;
    dw $2106                                                             ;A8A918;

Spritemap_YappingMaw_2:
    dw $0005,$81F8                                                       ;A8A91A;
    db $F8                                                               ;A8A91E;
    dw $2100,$0000                                                       ;A8A91F;
    db $F6                                                               ;A8A923;
    dw $610D,$0000                                                       ;A8A924;
    db $EE                                                               ;A8A928;
    dw $610C,$01F8                                                       ;A8A929;
    db $F6                                                               ;A8A92D;
    dw $210D,$01F8                                                       ;A8A92E;
    db $EE                                                               ;A8A932;
    dw $210C                                                             ;A8A933;

Spritemap_YappingMaw_3:
    dw $0003,$81F8                                                       ;A8A935;
    db $F8                                                               ;A8A939;
    dw $2102,$81F2                                                       ;A8A93A;
    db $EE                                                               ;A8A93E;
    dw $2106,$8002                                                       ;A8A93F;
    db $FE                                                               ;A8A943;
    dw $E108                                                             ;A8A944;

Spritemap_YappingMaw_4:
    dw $0005,$81F8                                                       ;A8A946;
    db $F8                                                               ;A8A94A;
    dw $2102,$0005                                                       ;A8A94B;
    db $FD                                                               ;A8A94F;
    dw $610F,$000D                                                       ;A8A950;
    db $FD                                                               ;A8A954;
    dw $610E,$01FB                                                       ;A8A955;
    db $F3                                                               ;A8A959;
    dw $210D,$01FB                                                       ;A8A95A;
    db $EB                                                               ;A8A95E;
    dw $210C                                                             ;A8A95F;

Spritemap_YappingMaw_5:
    dw $0003,$81F8                                                       ;A8A961;
    db $F8                                                               ;A8A965;
    dw $2102,$8001                                                       ;A8A966;
    db $F4                                                               ;A8A96A;
    dw $6106,$81FC                                                       ;A8A96B;
    db $EF                                                               ;A8A96F;
    dw $6108                                                             ;A8A970;

Spritemap_YappingMaw_6:
    dw $0005,$81F8                                                       ;A8A972;
    db $F8                                                               ;A8A976;
    dw $2104,$01FE                                                       ;A8A977;
    db $04                                                               ;A8A97B;
    dw $A10D,$01FE                                                       ;A8A97C;
    db $0C                                                               ;A8A980;
    dw $A10C,$01FE                                                       ;A8A981;
    db $F4                                                               ;A8A985;
    dw $210D,$01FE                                                       ;A8A986;
    db $EC                                                               ;A8A98A;
    dw $210C                                                             ;A8A98B;

Spritemap_YappingMaw_7:
    dw $0003,$81F8                                                       ;A8A98D;
    db $F8                                                               ;A8A991;
    dw $2104,$8000                                                       ;A8A992;
    db $EC                                                               ;A8A996;
    dw $6108,$8000                                                       ;A8A997;
    db $04                                                               ;A8A99B;
    dw $E108                                                             ;A8A99C;

Spritemap_YappingMaw_8:
    dw $0005,$81F8                                                       ;A8A99E;
    db $F8                                                               ;A8A9A2;
    dw $2104,$0003                                                       ;A8A9A3;
    db $F8                                                               ;A8A9A7;
    dw $E10F,$000B                                                       ;A8A9A8;
    db $F8                                                               ;A8A9AC;
    dw $E10E,$0003                                                       ;A8A9AD;
    db $00                                                               ;A8A9B1;
    dw $610F,$000B                                                       ;A8A9B2;
    db $00                                                               ;A8A9B6;
    dw $610E                                                             ;A8A9B7;

Spritemap_YappingMaw_9:
    dw $0003,$81F8                                                       ;A8A9B9;
    db $F8                                                               ;A8A9BD;
    dw $A102,$81F2                                                       ;A8A9BE;
    db $02                                                               ;A8A9C2;
    dw $A106,$8002                                                       ;A8A9C3;
    db $F2                                                               ;A8A9C7;
    dw $6108                                                             ;A8A9C8;

Spritemap_YappingMaw_A:
    dw $0005,$81F8                                                       ;A8A9CA;
    db $F8                                                               ;A8A9CE;
    dw $A102,$0005                                                       ;A8A9CF;
    db $FB                                                               ;A8A9D3;
    dw $E10F,$000D                                                       ;A8A9D4;
    db $FB                                                               ;A8A9D8;
    dw $E10E,$01FB                                                       ;A8A9D9;
    db $05                                                               ;A8A9DD;
    dw $A10D,$01FB                                                       ;A8A9DE;
    db $0D                                                               ;A8A9E2;
    dw $A10C                                                             ;A8A9E3;

Spritemap_YappingMaw_B:
    dw $0003,$81F8                                                       ;A8A9E5;
    db $F8                                                               ;A8A9E9;
    dw $A102,$8001                                                       ;A8A9EA;
    db $FC                                                               ;A8A9EE;
    dw $E106,$81FC                                                       ;A8A9EF;
    db $01                                                               ;A8A9F3;
    dw $E108                                                             ;A8A9F4;

Spritemap_YappingMaw_C:
    dw $0005,$81F8                                                       ;A8A9F6;
    db $F8                                                               ;A8A9FA;
    dw $A100,$01F4                                                       ;A8A9FB;
    db $FE                                                               ;A8A9FF;
    dw $A10F,$01EC                                                       ;A8AA00;
    db $FE                                                               ;A8AA04;
    dw $A10E,$0004                                                       ;A8AA05;
    db $FE                                                               ;A8AA09;
    dw $E10F,$000C                                                       ;A8AA0A;
    db $FE                                                               ;A8AA0E;
    dw $E10E                                                             ;A8AA0F;

Spritemap_YappingMaw_D:
    dw $0003,$81F8                                                       ;A8AA11;
    db $F8                                                               ;A8AA15;
    dw $A100,$8004                                                       ;A8AA16;
    db $00                                                               ;A8AA1A;
    dw $E106,$81EC                                                       ;A8AA1B;
    db $00                                                               ;A8AA1F;
    dw $A106                                                             ;A8AA20;

Spritemap_YappingMaw_E:
    dw $0005,$81F8                                                       ;A8AA22;
    db $F8                                                               ;A8AA26;
    dw $A100,$0000                                                       ;A8AA27;
    db $02                                                               ;A8AA2B;
    dw $E10D,$0000                                                       ;A8AA2C;
    db $0A                                                               ;A8AA30;
    dw $E10C,$01F8                                                       ;A8AA31;
    db $02                                                               ;A8AA35;
    dw $A10D,$01F8                                                       ;A8AA36;
    db $0A                                                               ;A8AA3A;
    dw $A10C                                                             ;A8AA3B;

Spritemap_YappingMaw_F:
    dw $0003,$81F8                                                       ;A8AA3D;
    db $F8                                                               ;A8AA41;
    dw $E102,$81FE                                                       ;A8AA42;
    db $02                                                               ;A8AA46;
    dw $E106,$81EE                                                       ;A8AA47;
    db $F2                                                               ;A8AA4B;
    dw $2108                                                             ;A8AA4C;

Spritemap_YappingMaw_10:
    dw $0005,$81F8                                                       ;A8AA4E;
    db $F8                                                               ;A8AA52;
    dw $E102,$01F3                                                       ;A8AA53;
    db $FB                                                               ;A8AA57;
    dw $A10F,$01EB                                                       ;A8AA58;
    db $FB                                                               ;A8AA5C;
    dw $A10E,$01FD                                                       ;A8AA5D;
    db $05                                                               ;A8AA61;
    dw $E10D,$01FD                                                       ;A8AA62;
    db $0D                                                               ;A8AA66;
    dw $E10C                                                             ;A8AA67;

Spritemap_YappingMaw_11:
    dw $0003,$81F8                                                       ;A8AA69;
    db $F8                                                               ;A8AA6D;
    dw $E102,$81EF                                                       ;A8AA6E;
    db $FC                                                               ;A8AA72;
    dw $A106,$81F4                                                       ;A8AA73;
    db $01                                                               ;A8AA77;
    dw $A108                                                             ;A8AA78;

Spritemap_YappingMaw_12:
    dw $0005,$81F8                                                       ;A8AA7A;
    db $F8                                                               ;A8AA7E;
    dw $6104,$01FA                                                       ;A8AA7F;
    db $04                                                               ;A8AA83;
    dw $E10D,$01FA                                                       ;A8AA84;
    db $0C                                                               ;A8AA88;
    dw $E10C,$01FA                                                       ;A8AA89;
    db $F4                                                               ;A8AA8D;
    dw $610D,$01FA                                                       ;A8AA8E;
    db $EC                                                               ;A8AA92;
    dw $610C                                                             ;A8AA93;

Spritemap_YappingMaw_13:
    dw $0003,$81F8                                                       ;A8AA95;
    db $F8                                                               ;A8AA99;
    dw $6104,$81F0                                                       ;A8AA9A;
    db $EC                                                               ;A8AA9E;
    dw $2108,$81F0                                                       ;A8AA9F;
    db $04                                                               ;A8AAA3;
    dw $A108                                                             ;A8AAA4;

Spritemap_YappingMaw_14:
    dw $0005,$81F8                                                       ;A8AAA6;
    db $F8                                                               ;A8AAAA;
    dw $6104,$01F5                                                       ;A8AAAB;
    db $F8                                                               ;A8AAAF;
    dw $A10F,$01ED                                                       ;A8AAB0;
    db $F8                                                               ;A8AAB4;
    dw $A10E,$01F5                                                       ;A8AAB5;
    db $00                                                               ;A8AAB9;
    dw $210F,$01ED                                                       ;A8AABA;
    db $00                                                               ;A8AABE;
    dw $210E                                                             ;A8AABF;

Spritemap_YappingMaw_15:
    dw $0003,$81F8                                                       ;A8AAC1;
    db $F8                                                               ;A8AAC5;
    dw $6102,$81FE                                                       ;A8AAC6;
    db $EE                                                               ;A8AACA;
    dw $6106,$81EE                                                       ;A8AACB;
    db $FE                                                               ;A8AACF;
    dw $A108                                                             ;A8AAD0;

Spritemap_YappingMaw_16:
    dw $0005,$81F8                                                       ;A8AAD2;
    db $F8                                                               ;A8AAD6;
    dw $6102,$01F3                                                       ;A8AAD7;
    db $FD                                                               ;A8AADB;
    dw $210F,$01EB                                                       ;A8AADC;
    db $FD                                                               ;A8AAE0;
    dw $210E,$01FD                                                       ;A8AAE1;
    db $F3                                                               ;A8AAE5;
    dw $610D,$01FD                                                       ;A8AAE6;
    db $EB                                                               ;A8AAEA;
    dw $610C                                                             ;A8AAEB;

Spritemap_YappingMaw_17:
    dw $0003,$81F8                                                       ;A8AAED;
    db $F8                                                               ;A8AAF1;
    dw $6102,$81EF                                                       ;A8AAF2;
    db $F4                                                               ;A8AAF6;
    dw $2106,$81F4                                                       ;A8AAF7;
    db $EF                                                               ;A8AAFB;
    dw $2108                                                             ;A8AAFC;

Palette_Kago:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A8AAFE;
    dw $1DCE,$01DF,$001F,$0018,$000A,$06B9,$00EA,$0045                   ;A8AB0E;

InstList_Kago_Initial_SlowAnimation:
    dw $000A                                                             ;A8AB1E;
    dw Spritemap_Kago_0                                                  ;A8AB20;
    dw $000A                                                             ;A8AB22;
    dw Spritemap_Kago_1                                                  ;A8AB24;
    dw $000A                                                             ;A8AB26;
    dw Spritemap_Kago_2                                                  ;A8AB28;
    dw $000A                                                             ;A8AB2A;
    dw Spritemap_Kago_1                                                  ;A8AB2C;
    dw Instruction_Common_GotoY                                          ;A8AB2E;
    dw InstList_Kago_Initial_SlowAnimation                               ;A8AB30;

InstList_Kago_TakenHit_FastAnimation:
    dw $0003                                                             ;A8AB32;
    dw Spritemap_Kago_0                                                  ;A8AB34;
    dw $0003                                                             ;A8AB36;
    dw Spritemap_Kago_1                                                  ;A8AB38;
    dw $0003                                                             ;A8AB3A;
    dw Spritemap_Kago_2                                                  ;A8AB3C;
    dw $0003                                                             ;A8AB3E;
    dw Spritemap_Kago_1                                                  ;A8AB40;
    dw Instruction_Common_GotoY                                          ;A8AB42;
    dw InstList_Kago_TakenHit_FastAnimation                              ;A8AB44;

InitAI_Kago:
    LDX.W $0E54                                                          ;A8AB46;
    LDA.W EnemyData.properties,X                                         ;A8AB49;
    ORA.W #$2000                                                         ;A8AB4C;
    STA.W EnemyData.properties,X                                         ;A8AB4F;
    LDA.W #$0001                                                         ;A8AB52;
    STA.W EnemyData.instTimer,X                                          ;A8AB55;
    STZ.W EnemyData.loopCounter,X                                        ;A8AB58;
    STZ.W EnemyData.work4,X                                              ;A8AB5B;
    LDA.W #InstList_Kago_Initial_SlowAnimation                           ;A8AB5E;
    STA.W EnemyData.pInstList,X                                          ;A8AB61;
    LDA.W #Function_Kago_Nothing                                         ;A8AB64;
    STA.W EnemyData.work0,X                                              ;A8AB67;
    STZ.W EnemyData.work5,X                                              ;A8AB6A;
    LDA.W EnemyData.initParam0,X                                         ;A8AB6D;
    STA.L $7E7808,X                                                      ;A8AB70;
    RTL                                                                  ;A8AB74;


MainAI_Kago:
    LDX.W $0E54                                                          ;A8AB75;
    JMP.W ($0FA8,X)                                                      ;A8AB78;


Function_Kago_Nothing:
    LDA.W #RTL_A8AB81                                                    ;A8AB7B;
    STA.W EnemyData.work0,X                                              ;A8AB7E; fallthrough to RTL_A8AB81

RTL_A8AB81:
    RTL                                                                  ;A8AB81;


RTL_A8AB82:
    RTL                                                                  ;A8AB82;


EnemyShot_Kago:
    PHX                                                                  ;A8AB83;
    PHY                                                                  ;A8AB84;
    JSL.L NormalEnemyShotAI                                              ;A8AB85;
    LDA.W #$0002                                                         ;A8AB89;
    STA.W $183E                                                          ;A8AB8C;
    LDA.W #$0010                                                         ;A8AB8F;
    STA.W $1840                                                          ;A8AB92;
    LDX.W $0E54                                                          ;A8AB95;
    LDA.W EnemyData.work1,X                                              ;A8AB98;
    BNE .takenHit                                                        ;A8AB9B;
    LDA.W #$0001                                                         ;A8AB9D;
    STA.W EnemyData.work1,X                                              ;A8ABA0;
    LDA.W #InstList_Kago_TakenHit_FastAnimation                          ;A8ABA3;
    STA.W EnemyData.pInstList,X                                          ;A8ABA6;
    LDA.W #$0001                                                         ;A8ABA9;
    STA.W EnemyData.instTimer,X                                          ;A8ABAC;

.takenHit:
    LDA.L $7E7808,X                                                      ;A8ABAF;
    SEC                                                                  ;A8ABB3;
    SBC.W #$0001                                                         ;A8ABB4;
    STA.L $7E7808,X                                                      ;A8ABB7;
    BPL .notDead                                                         ;A8ABBB;
    LDA.W #$0004                                                         ;A8ABBD;
    JSL.L EnemyDeath                                                     ;A8ABC0;
    LDX.W $0E54                                                          ;A8ABC4;
    LDA.W #$0001                                                         ;A8ABC7;
    STA.W EnemyData.work5,X                                              ;A8ABCA;

.notDead:
    LDY.W #EnemyProjectile_KagoBug                                       ;A8ABCD;
    LDA.W EnemyData.yPosition,X                                          ;A8ABD0;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8ABD3;
    PLY                                                                  ;A8ABD7;
    PLX                                                                  ;A8ABD8;
    RTL                                                                  ;A8ABD9;


Spritemap_Kago_0:
    dw $0004,$8000                                                       ;A8ABDA;
    db $00                                                               ;A8ABDE;
    dw $210E,$81F0                                                       ;A8ABDF;
    db $00                                                               ;A8ABE3;
    dw $210C,$8000                                                       ;A8ABE4;
    db $F0                                                               ;A8ABE8;
    dw $2102,$81F0                                                       ;A8ABE9;
    db $F0                                                               ;A8ABED;
    dw $2100                                                             ;A8ABEE;

Spritemap_Kago_1:
    dw $0004,$8000                                                       ;A8ABF0;
    db $00                                                               ;A8ABF4;
    dw $2122,$81F0                                                       ;A8ABF5;
    db $00                                                               ;A8ABF9;
    dw $2120,$8000                                                       ;A8ABFA;
    db $F0                                                               ;A8ABFE;
    dw $2106,$81F0                                                       ;A8ABFF;
    db $F0                                                               ;A8AC03;
    dw $2104                                                             ;A8AC04;

Spritemap_Kago_2:
    dw $0004,$8000                                                       ;A8AC06;
    db $00                                                               ;A8AC0A;
    dw $2126,$81F0                                                       ;A8AC0B;
    db $00                                                               ;A8AC0F;
    dw $2124,$8000                                                       ;A8AC10;
    db $F0                                                               ;A8AC14;
    dw $210A,$81F0                                                       ;A8AC15;
    db $F0                                                               ;A8AC19;
    dw $2108                                                             ;A8AC1A;

Palette_Magdollite:
    dw $3800,$001F,$001C,$0018,$0015,$7FFF,$3BE0,$2680                   ;A8AC1C;
    dw $1580                                                             ;A8AC2C;

Palette_Magdollite_Glow_0:
    dw $023F                                                             ;A8AC2E;

Palette_Magdollite_Glow_1:
    dw $00BD                                                             ;A8AC30;

Palette_Magdollite_Glow_2:
    dw $0014                                                             ;A8AC32;

Palette_Magdollite_Glow_3:
    dw $0010,$0000,$0000,$0000,$3800,$0000,$0000,$0000                   ;A8AC34;
    dw $0000,$0000,$0000,$0000,$0000,$00BD,$0014,$0010                   ;A8AC44;
    dw $023F,$0000,$0000,$0000,$3800,$0000,$0000,$0000                   ;A8AC54;
    dw $0000,$0000,$0000,$0000,$0000,$0014,$0010,$023F                   ;A8AC64;
    dw $00BD,$0000,$0000,$0000,$3800,$0000,$0000,$0000                   ;A8AC74;
    dw $0000,$0000,$0000,$0000,$0000,$0010,$023F,$00BD                   ;A8AC84;
    dw $0014,$0000,$0000,$0000                                           ;A8AC94;

InstList_Magdollite_Idling_FacingLeft:
    dw $000D                                                             ;A8AC9C;
    dw Spritemap_Magdollite_FacingLeft_Head_0                            ;A8AC9E;
    dw $000D                                                             ;A8ACA0;
    dw Spritemap_Magdollite_FacingLeft_Head_1                            ;A8ACA2;
    dw $000D                                                             ;A8ACA4;
    dw Spritemap_Magdollite_FacingLeft_Head_2                            ;A8ACA6;
    dw $000D                                                             ;A8ACA8;
    dw Spritemap_Magdollite_FacingLeft_Head_1                            ;A8ACAA;
    dw Instruction_CommonA8_GotoY                                        ;A8ACAC;
    dw InstList_Magdollite_Idling_FacingLeft                             ;A8ACAE;

InstList_Magdollite_Slave2_ThrowFireballs_FacingLeft:
    dw Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen           ;A8ACB0;
    dw $0061                                                             ;A8ACB2;
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8ACB4;
    dw Instruction_Magdollite_SetCooldownTimerTo100                      ;A8ACB6;
    dw $001A                                                             ;A8ACB8;
    dw Spritemap_Magdollite_FacingLeft_Fist_0                            ;A8ACBA;
    dw $0008                                                             ;A8ACBC;
    dw Spritemap_Magdollite_FacingLeft_Fist_1                            ;A8ACBE;
    dw Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_FacingLeft      ;A8ACC0;
    dw $0005                                                             ;A8ACC2;
    dw Spritemap_Magdollite_FacingLeft_Hand_FingersStraight              ;A8ACC4;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8ACC6;
    dw $0005                                                             ;A8ACC8;
    dw Spritemap_Magdollite_FacingLeft_Hand_FingersStraight              ;A8ACCA;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8ACCC;
    dw $0005                                                             ;A8ACCE;
    dw Spritemap_Magdollite_FacingLeft_Hand_FingersStraight              ;A8ACD0;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8ACD2;
    dw Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_Left_dup        ;A8ACD4;
    dw $0005                                                             ;A8ACD6;
    dw Spritemap_Magdollite_FacingLeft_Hand_FingersCurled                ;A8ACD8;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8ACDA;
    dw Instruction_Common_Sleep                                          ;A8ACDC;

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_0:
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8ACDE;
    dw $0005                                                             ;A8ACE0;
    dw Spritemap_Magdollite_FacingLeft_Head_1                            ;A8ACE2;
    dw Instruction_Magdollite_MoveDown2Pixels                            ;A8ACE4;
    dw $0005                                                             ;A8ACE6;
    dw Spritemap_Magdollite_FacingLeft_Head_1                            ;A8ACE8;
    dw $0005                                                             ;A8ACEA;
    dw Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava              ;A8ACEC;
    dw $0005                                                             ;A8ACEE;
    dw Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava        ;A8ACF0;
    dw Instruction_Magdollite_MoveDown2Pixels                            ;A8ACF2;
    dw $0005                                                             ;A8ACF4;
    dw Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava        ;A8ACF6;
    dw Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible      ;A8ACF8;
    dw Instruction_Common_TimerInY                                       ;A8ACFA;
    dw $0018                                                             ;A8ACFC;

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_1:
    dw Instruction_Magdollite_MoveBaseAndPillarUp1Pixel                  ;A8ACFE;
    dw $0001                                                             ;A8AD00;
    dw Spritemap_Magdollite_FacingLeft_WidePillarSection                 ;A8AD02;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A8AD04;
    dw InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_1        ;A8AD06;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8AD08;
    dw Instruction_Common_Sleep                                          ;A8AD0A;

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_0:
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8AD0C;
    dw Instruction_Magdollite_RestoreInitialYPositions                   ;A8AD0E;
    dw Instruction_Common_TimerInY                                       ;A8AD10;
    dw $0018                                                             ;A8AD12;

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_1:
    dw Instruction_Magdollite_MoveBaseAndPillarDown1Pixel                ;A8AD14;
    dw $0001                                                             ;A8AD16;
    dw Spritemap_Magdollite_FacingLeft_WidePillarSection                 ;A8AD18;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A8AD1A;
    dw InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_1      ;A8AD1C;
    dw Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible       ;A8AD1E;
    dw $0005                                                             ;A8AD20;
    dw Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava        ;A8AD22;
    dw Instruction_Magdollite_MoveUp2Pixels                              ;A8AD24;
    dw $0005                                                             ;A8AD26;
    dw Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava        ;A8AD28;
    dw $0005                                                             ;A8AD2A;
    dw Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava              ;A8AD2C;
    dw $0005                                                             ;A8AD2E;
    dw Spritemap_Magdollite_FacingLeft_Head_1                            ;A8AD30;
    dw Instruction_Magdollite_MoveUp2Pixels                              ;A8AD32;
    dw $0005                                                             ;A8AD34;
    dw Spritemap_Magdollite_FacingLeft_Head_1                            ;A8AD36;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8AD38;
    dw Instruction_Common_Sleep                                          ;A8AD3A;

InstList_Magdollite_Idling_FacingRight:
    dw $000D                                                             ;A8AD3C;
    dw Spritemap_Magdollite_FacingRight_Head_0                           ;A8AD3E;
    dw $000D                                                             ;A8AD40;
    dw Spritemap_Magdollite_FacingRight_Head_1                           ;A8AD42;
    dw $000D                                                             ;A8AD44;
    dw Spritemap_Magdollite_FacingRight_Head_2                           ;A8AD46;
    dw $000D                                                             ;A8AD48;
    dw Spritemap_Magdollite_FacingRight_Head_1                           ;A8AD4A;
    dw Instruction_Common_GotoY                                          ;A8AD4C;
    dw InstList_Magdollite_Idling_FacingRight                            ;A8AD4E;

InstList_Magdollite_ThrowFireballs_FacingRight:
    dw Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen           ;A8AD50;
    dw $0061                                                             ;A8AD52;
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8AD54;
    dw Instruction_Magdollite_SetCooldownTimerTo100                      ;A8AD56;
    dw $001A                                                             ;A8AD58;
    dw Spritemap_Magdollite_FacingRight_Fist_0                           ;A8AD5A;
    dw $0008                                                             ;A8AD5C;
    dw Spritemap_Magdollite_FacingRight_Fist_1                           ;A8AD5E;
    dw Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_FaceRight      ;A8AD60;
    dw $0005                                                             ;A8AD62;
    dw Spritemap_Magdollite_FacingRight_Hand_FingersStraight             ;A8AD64;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8AD66;
    dw $0005                                                             ;A8AD68;
    dw Spritemap_Magdollite_FacingRight_Hand_FingersStraight             ;A8AD6A;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8AD6C;
    dw $0005                                                             ;A8AD6E;
    dw Spritemap_Magdollite_FacingRight_Hand_FingersStraight             ;A8AD70;
    dw Instruction_Magdollite_SpawnLavaProjectile                        ;A8AD72;
    dw Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_Right_dup      ;A8AD74;
    dw $0005                                                             ;A8AD76;
    dw Spritemap_Magdollite_FacingRight_Hand_FingersCurled               ;A8AD78;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8AD7A;
    dw Instruction_Common_Sleep                                          ;A8AD7C;

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_0:
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8AD7E;
    dw $0005                                                             ;A8AD80;
    dw Spritemap_Magdollite_FacingRight_Head_1                           ;A8AD82;
    dw Instruction_Magdollite_MoveDown2Pixels                            ;A8AD84;
    dw $0005                                                             ;A8AD86;
    dw Spritemap_Magdollite_FacingRight_Head_1                           ;A8AD88;
    dw $0005                                                             ;A8AD8A;
    dw Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava             ;A8AD8C;
    dw $0005                                                             ;A8AD8E;
    dw Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava       ;A8AD90;
    dw Instruction_Magdollite_MoveDown2Pixels                            ;A8AD92;
    dw $0005                                                             ;A8AD94;
    dw Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava       ;A8AD96;
    dw Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible      ;A8AD98;
    dw Instruction_Common_TimerInY                                       ;A8AD9A;
    dw $0018                                                             ;A8AD9C;

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_1:
    dw Instruction_Magdollite_MoveBaseAndPillarUp1Pixel                  ;A8AD9E;
    dw $0001                                                             ;A8ADA0;
    dw Spritemap_Magdollite_FacingRight_WidePillarSection                ;A8ADA2;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A8ADA4;
    dw InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_1       ;A8ADA6;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8ADA8;
    dw Instruction_Common_Sleep                                          ;A8ADAA;

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_0:
    dw Instruction_Magdollite_SetWaitingFlag                             ;A8ADAC;
    dw Instruction_Magdollite_RestoreInitialYPositions                   ;A8ADAE;
    dw Instruction_Common_TimerInY                                       ;A8ADB0;
    dw $0018                                                             ;A8ADB2;

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_1:
    dw Instruction_Magdollite_MoveBaseAndPillarDown1Pixel                ;A8ADB4;
    dw $0001                                                             ;A8ADB6;
    dw Spritemap_Magdollite_FacingRight_WidePillarSection                ;A8ADB8;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A8ADBA;
    dw InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_1     ;A8ADBC;
    dw Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible       ;A8ADBE;
    dw $0005                                                             ;A8ADC0;
    dw Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava       ;A8ADC2;
    dw Instruction_Magdollite_MoveUp2Pixels                              ;A8ADC4;
    dw $0005                                                             ;A8ADC6;
    dw Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava       ;A8ADC8;
    dw $0005                                                             ;A8ADCA;
    dw Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava             ;A8ADCC;
    dw $0005                                                             ;A8ADCE;
    dw Spritemap_Magdollite_FacingRight_Head_1                           ;A8ADD0;
    dw Instruction_Magdollite_MoveUp2Pixels                              ;A8ADD2;
    dw $0005                                                             ;A8ADD4;
    dw Spritemap_Magdollite_FacingRight_Head_1                           ;A8ADD6;
    dw Instruction_Magdollite_ResetWaitingFlag                           ;A8ADD8;
    dw Instruction_Common_Sleep                                          ;A8ADDA;

InstList_Magdollite_Slave1_NarrowPillar_FacingLeft:
    dw $0001                                                             ;A8ADDC;
    dw Spritemap_Magdollite_FacingLeft_NarrowPillarSection               ;A8ADDE;
    dw Instruction_Common_Sleep                                          ;A8ADE0;

InstList_Magdollite_Slave1_NarrowPillar_FacingRight:
    dw $0001                                                             ;A8ADE2;
    dw Spritemap_Magdollite_FacingRight_NarrowPillarSection              ;A8ADE4;
    dw Instruction_Common_Sleep                                          ;A8ADE6;

InstList_Magdollite_Slave1_3xPillarStack:
    dw $0001                                                             ;A8ADE8;
    dw Spritemap_Magdollite_NarrowPillarStacks_3x                        ;A8ADEA;
    dw Instruction_Common_Sleep                                          ;A8ADEC;

InstList_Magdollite_Slave1_4xPillarStack:
    dw $0001                                                             ;A8ADEE;
    dw Spritemap_Magdollite_NarrowPillarStacks_4x                        ;A8ADF0;
    dw Instruction_Common_Sleep                                          ;A8ADF2;

InstList_Magdollite_Slave1_5xPillarStack:
    dw $0001                                                             ;A8ADF4;
    dw Spritemap_Magdollite_NarrowPillarStacks_5x                        ;A8ADF6;
    dw Instruction_Common_Sleep                                          ;A8ADF8;

InstList_Magdollite_Slave1_6xPillarStack:
    dw $0001                                                             ;A8ADFA;
    dw Spritemap_Magdollite_NarrowPillarStacks_6x                        ;A8ADFC;
    dw Instruction_Common_Sleep                                          ;A8ADFE;

InstList_Magdollite_Slave1_7xPillarStack:
    dw $0001                                                             ;A8AE00;
    dw Spritemap_Magdollite_NarrowPillarStacks_7x                        ;A8AE02;
    dw Instruction_Common_Sleep                                          ;A8AE04;

InstList_Magdollite_Slave1_8xPillarStack:
    dw $0001                                                             ;A8AE06;
    dw Spritemap_Magdollite_NarrowPillarStacks_8x                        ;A8AE08;
    dw Instruction_Common_Sleep                                          ;A8AE0A;

InstList_Magdollite_Slave2_PillarCap:
    dw $0001                                                             ;A8AE0C;
    dw Spritemap_Magdollite_FacingLeft_PillarCap                         ;A8AE0E;
    dw Instruction_CommonA8_Sleep                                        ;A8AE10;

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


Instruction_Magdollite_MoveDown2Pixels:
    LDX.W $0E54                                                          ;A8AE26;
    INC.W EnemyData.yPosition,X                                          ;A8AE29;
    INC.W EnemyData.yPosition,X                                          ;A8AE2C;
    RTL                                                                  ;A8AE2F;


Instruction_Magdollite_MoveUp2Pixels:
    LDX.W $0E54                                                          ;A8AE30;
    DEC.W EnemyData.yPosition,X                                          ;A8AE33;
    DEC.W EnemyData.yPosition,X                                          ;A8AE36;
    RTL                                                                  ;A8AE39;


Instruction_Magdollite_SetWaitingFlag:
    LDX.W $0E54                                                          ;A8AE3A;
    LDA.W #$0001                                                         ;A8AE3D;
    STA.L $7E7802,X                                                      ;A8AE40;
    RTL                                                                  ;A8AE44;


Instruction_Magdollite_ResetWaitingFlag:
    LDX.W $0E54                                                          ;A8AE45;
    LDA.W #$0000                                                         ;A8AE48;
    STA.L $7E7802,X                                                      ;A8AE4B;
    RTL                                                                  ;A8AE4F;


Instruction_Magdollite_MoveBaseAndPillarUp1Pixel:
    LDX.W $0E54                                                          ;A8AE50;
    DEC.W EnemyData.yPosition,X                                          ;A8AE53;
    DEC.W $0FBE,X                                                        ;A8AE56;
    RTL                                                                  ;A8AE59;


Instruction_Magdollite_MoveBaseAndPillarDown1Pixel:
    LDX.W $0E54                                                          ;A8AE5A;
    INC.W EnemyData.yPosition,X                                          ;A8AE5D;
    INC.W $0FBE,X                                                        ;A8AE60;
    RTL                                                                  ;A8AE63;


Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible:
    LDX.W $0E54                                                          ;A8AE64;
    LDA.L $7E7806,X                                                      ;A8AE67;
    CLC                                                                  ;A8AE6B;
    ADC.W #$0018                                                         ;A8AE6C;
    STA.W EnemyData.yPosition,X                                          ;A8AE6F;
    STA.W $0FBE,X                                                        ;A8AE72;
    LDA.W $0FC6,X                                                        ;A8AE75;
    AND.W #$FEFF                                                         ;A8AE78;
    STA.W $0FC6,X                                                        ;A8AE7B;
    LDA.W $1006,X                                                        ;A8AE7E;
    AND.W #$FEFF                                                         ;A8AE81;
    STA.W $1006,X                                                        ;A8AE84;
    RTL                                                                  ;A8AE87;


Instruction_Magdollite_RestoreInitialYPositions:
    LDX.W $0E54                                                          ;A8AE88;
    LDA.L $7E7806,X                                                      ;A8AE8B;
    STA.W EnemyData.yPosition,X                                          ;A8AE8F;
    STA.W $0FBE,X                                                        ;A8AE92;
    RTL                                                                  ;A8AE95;


Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible:
    LDX.W $0E54                                                          ;A8AE96;
    LDA.L $7E7806,X                                                      ;A8AE99;
    CLC                                                                  ;A8AE9D;
    ADC.W #$0004                                                         ;A8AE9E;
    STA.W EnemyData.yPosition,X                                          ;A8AEA1;
    STA.W $0FBE,X                                                        ;A8AEA4;
    LDA.W $0FC6,X                                                        ;A8AEA7;
    ORA.W #$0100                                                         ;A8AEAA;
    STA.W $0FC6,X                                                        ;A8AEAD;
    LDA.W $1006,X                                                        ;A8AEB0;
    ORA.W #$0100                                                         ;A8AEB3;
    STA.W $1006,X                                                        ;A8AEB6;
    RTL                                                                  ;A8AEB9;


Instruction_Magdollite_SpawnLavaProjectile:
    PHY                                                                  ;A8AEBA;
    LDX.W $0E54                                                          ;A8AEBB;
    LDY.W #EnemyProjectile_Magdollite                                    ;A8AEBE;
    LDA.W EnemyData.work1,X                                              ;A8AEC1;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8AEC4;
    PLY                                                                  ;A8AEC8;
    RTL                                                                  ;A8AEC9;


Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_FaceRight:
    LDX.W $0E54                                                          ;A8AECA;
    LDA.L $7E7824,X                                                      ;A8AECD;
    CLC                                                                  ;A8AED1;
    ADC.W #$0008                                                         ;A8AED2;
    STA.W EnemyData.xPosition,X                                          ;A8AED5;
    LDA.L $7E7826,X                                                      ;A8AED8;
    CLC                                                                  ;A8AEDC;
    ADC.W #$FFFC                                                         ;A8AEDD;
    STA.W EnemyData.yPosition,X                                          ;A8AEE0;
    RTL                                                                  ;A8AEE3;


Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_FacingLeft:
    LDX.W $0E54                                                          ;A8AEE4;
    LDA.L $7E7824,X                                                      ;A8AEE7;
    CLC                                                                  ;A8AEEB;
    ADC.W #$FFF8                                                         ;A8AEEC;
    STA.W EnemyData.xPosition,X                                          ;A8AEEF;
    LDA.L $7E7826,X                                                      ;A8AEF2;
    CLC                                                                  ;A8AEF6;
    ADC.W #$FFFC                                                         ;A8AEF7;
    STA.W EnemyData.yPosition,X                                          ;A8AEFA;
    RTL                                                                  ;A8AEFD;


Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_Right_dup:
    LDX.W $0E54                                                          ;A8AEFE;
    LDA.L $7E7824,X                                                      ;A8AF01;
    CLC                                                                  ;A8AF05;
    ADC.W #$0008                                                         ;A8AF06;
    STA.W EnemyData.xPosition,X                                          ;A8AF09;
    LDA.L $7E7826,X                                                      ;A8AF0C;
    CLC                                                                  ;A8AF10;
    ADC.W #$FFF8                                                         ;A8AF11;
    STA.W EnemyData.yPosition,X                                          ;A8AF14;
    RTL                                                                  ;A8AF17;


Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_Left_dup:
    LDX.W $0E54                                                          ;A8AF18;
    LDA.L $7E7824,X                                                      ;A8AF1B;
    CLC                                                                  ;A8AF1F;
    ADC.W #$FFF8                                                         ;A8AF20;
    STA.W EnemyData.xPosition,X                                          ;A8AF23;
    LDA.L $7E7826,X                                                      ;A8AF26;
    CLC                                                                  ;A8AF2A;
    ADC.W #$FFFC                                                         ;A8AF2B;
    STA.W EnemyData.yPosition,X                                          ;A8AF2E;
    RTL                                                                  ;A8AF31;


UNUSED_Magdollite_RestoreXYPositions_A8AF32:
    LDX.W $0E54                                                          ;A8AF32;
    LDA.L $7E7824,X                                                      ;A8AF35;
    STA.W EnemyData.xPosition,X                                          ;A8AF39;
    LDA.L $7E7826,X                                                      ;A8AF3C;
    STA.W EnemyData.yPosition,X                                          ;A8AF40;
    RTL                                                                  ;A8AF43;


Instruction_Magdollite_SetCooldownTimerTo100:
    LDX.W $0E54                                                          ;A8AF44;
    LDA.W #$0100                                                         ;A8AF47;
    STA.L $7E7808,X                                                      ;A8AF4A;
    RTL                                                                  ;A8AF4E;


InitAIFunctionPointers:
    dw Function_Magdollite_Init_Master                                   ;A8AF4F;
    dw Function_Magdollite_Init_Slave1                                   ;A8AF51;
    dw Function_Magdollite_Init_Slave2                                   ;A8AF53;

MagdolliteArmHeightThreshold:
    dw $0000,$0010,$0020,$0030,$0040,$0050,$0060,$0070                   ;A8AF55;
    dw $0080                                                             ;A8AF65;

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
    dw $000C,$000C,$0014,$001C,$0024,$002C,$0034,$003C                   ;A8AF79;
    dw $0044                                                             ;A8AF89;

InitAI_Magdollite:
    LDX.W $0E54                                                          ;A8AF8B;
    LDA.W EnemyData.initParam0,X                                         ;A8AF8E;
    ASL A                                                                ;A8AF91;
    TAX                                                                  ;A8AF92;
    JSR.W (InitAIFunctionPointers,X)                                     ;A8AF93;
    JSR.W GetMagdolliteSpeeds                                            ;A8AF96;
    JSR.W SetMagdolliteGraphicsDrawnHook                                 ;A8AF99;
    RTL                                                                  ;A8AF9C;


Function_Magdollite_Init_Master:
    LDX.W $0E54                                                          ;A8AF9D;
    LDA.W #$0000                                                         ;A8AFA0;
    STA.W EnemyData.work2,X                                              ;A8AFA3;
    STA.L $7E7800,X                                                      ;A8AFA6;
    STA.L $7E7804,X                                                      ;A8AFAA;
    LDA.W EnemyData.yPosition,X                                          ;A8AFAE;
    STA.L $7E7806,X                                                      ;A8AFB1;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8AFB5;
    BPL .keepLeft                                                        ;A8AFB9;
    LDA.W #$0001                                                         ;A8AFBB;
    STA.L $7E7800,X                                                      ;A8AFBE;

.keepLeft:
    LDA.L $7E7800,X                                                      ;A8AFC2;
    LDA.W #InstList_Magdollite_Idling_FacingLeft                         ;A8AFC6;
    STA.W EnemyData.work3,X                                              ;A8AFC9;
    LDA.L $7E7800,X                                                      ;A8AFCC;
    BNE .keepLeft2                                                       ;A8AFD0;
    LDA.W #InstList_Magdollite_Idling_FacingRight                        ;A8AFD2;
    STA.W EnemyData.work3,X                                              ;A8AFD5;

.keepLeft2:
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8AFD8;
    LDA.W #Function_Magdollite_WaitForSamusToGetNear                     ;A8AFDB;
    STA.W EnemyData.work5,X                                              ;A8AFDE;
    RTS                                                                  ;A8AFE1;


Function_Magdollite_Init_Slave1:
    LDX.W $0E54                                                          ;A8AFE2;
    LDA.W EnemyData.yPosition,X                                          ;A8AFE5;
    STA.L $7E7806,X                                                      ;A8AFE8;
    LDA.W #$0000                                                         ;A8AFEC;
    STA.W EnemyData.work2,X                                              ;A8AFEF;
    STA.L $7E7818,X                                                      ;A8AFF2;
    LDA.W #$0001                                                         ;A8AFF6;
    STA.L $7E781A,X                                                      ;A8AFF9;
    LDA.W #InstList_Magdollite_Slave1_NarrowPillar_FacingLeft            ;A8AFFD;
    STA.W EnemyData.work3,X                                              ;A8B000;
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B003;
    LDA.W EnemyData.yPosition,X                                          ;A8B006;
    CLC                                                                  ;A8B009;
    ADC.W #$0020                                                         ;A8B00A;
    STA.W EnemyData.yPosition,X                                          ;A8B00D;
    LDA.W #Function_Magdollite_Slave1_WaitForAttackToBeTriggered         ;A8B010;
    STA.W EnemyData.work5,X                                              ;A8B013;
    LDA.W EnemyData.properties,X                                         ;A8B016;
    ORA.W #$0100                                                         ;A8B019;
    STA.W EnemyData.properties,X                                         ;A8B01C;
    RTS                                                                  ;A8B01F;


Function_Magdollite_Init_Slave2:
    LDX.W $0E54                                                          ;A8B020;
    LDA.W EnemyData.yPosition,X                                          ;A8B023;
    STA.L $7E7806,X                                                      ;A8B026;
    LDA.W EnemyData.xPosition,X                                          ;A8B02A;
    STA.L $7E7822,X                                                      ;A8B02D;
    LDA.W #$0000                                                         ;A8B031;
    STA.W EnemyData.work2,X                                              ;A8B034;
    STA.L $7E7808,X                                                      ;A8B037;
    LDA.W #InstList_Magdollite_Slave2_PillarCap                          ;A8B03B;
    STA.W EnemyData.work3,X                                              ;A8B03E;
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B041;
    LDA.W EnemyData.yPosition,X                                          ;A8B044;
    CLC                                                                  ;A8B047;
    ADC.W #$0020                                                         ;A8B048;
    STA.W EnemyData.yPosition,X                                          ;A8B04B;
    LDA.W #Function_Magdollite_Slave2_Idling_WaitingForTrigger           ;A8B04E;
    STA.W EnemyData.work5,X                                              ;A8B051;
    LDA.W EnemyData.properties,X                                         ;A8B054;
    ORA.W #$0100                                                         ;A8B057;
    STA.W EnemyData.properties,X                                         ;A8B05A;
    RTS                                                                  ;A8B05D;


GetMagdolliteSpeeds:
    LDX.W $0E54                                                          ;A8B05E;
    LDA.W EnemyData.initParam1+1,X                                       ;A8B061;
    AND.W #$00FF                                                         ;A8B064;
    ASL A                                                                ;A8B067;
    ASL A                                                                ;A8B068;
    ASL A                                                                ;A8B069;
    TAY                                                                  ;A8B06A;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A8B06B;
    STA.L $7E7810,X                                                      ;A8B06E;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A8B072;
    STA.L $7E780E,X                                                      ;A8B075;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;A8B079;
    STA.L $7E7814,X                                                      ;A8B07C;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;A8B080;
    STA.L $7E7812,X                                                      ;A8B083;
    RTS                                                                  ;A8B087;


SetMagdolliteGraphicsDrawnHook:
    LDA.W #EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes   ;A8B088;
    STA.W $178C                                                          ;A8B08B;
    LDA.W #EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes>>16 ;A8B08E;
    STA.W $178E                                                          ;A8B091;
    LDA.W EnemyData.palette,X                                            ;A8B094;
    AND.W #$0E00                                                         ;A8B097;
    LSR A                                                                ;A8B09A;
    LSR A                                                                ;A8B09B;
    LSR A                                                                ;A8B09C;
    LSR A                                                                ;A8B09D;
    CLC                                                                  ;A8B09E;
    ADC.W #$0100                                                         ;A8B09F;
    STA.W $1794                                                          ;A8B0A2;
    LDA.W #$0008                                                         ;A8B0A5;
    STA.W $1798                                                          ;A8B0A8;
    LDA.W #$0000                                                         ;A8B0AB;
    STA.W $1796                                                          ;A8B0AE;
    RTS                                                                  ;A8B0B1;


EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes:
    LDA.W $0797                                                          ;A8B0B2;
    BNE .return                                                          ;A8B0B5;
    LDX.W $0E54                                                          ;A8B0B7;
    LDA.W $1798                                                          ;A8B0BA;
    DEC A                                                                ;A8B0BD;
    STA.W $1798                                                          ;A8B0BE;
    BNE .return                                                          ;A8B0C1;
    LDA.W #$0008                                                         ;A8B0C3;
    STA.W $1798                                                          ;A8B0C6;
    LDA.W $1796                                                          ;A8B0C9;
    INC A                                                                ;A8B0CC;
    STA.W $1796                                                          ;A8B0CD;
    AND.W #$0003                                                         ;A8B0D0;
    ASL A                                                                ;A8B0D3;
    ASL A                                                                ;A8B0D4;
    ASL A                                                                ;A8B0D5;
    ASL A                                                                ;A8B0D6;
    ASL A                                                                ;A8B0D7;
    TAY                                                                  ;A8B0D8;
    LDA.W Palette_Magdollite_Glow_0,Y                                    ;A8B0D9;
    STA.B $12                                                            ;A8B0DC;
    LDA.W Palette_Magdollite_Glow_1,Y                                    ;A8B0DE;
    STA.B $14                                                            ;A8B0E1;
    LDA.W Palette_Magdollite_Glow_2,Y                                    ;A8B0E3;
    STA.B $16                                                            ;A8B0E6;
    LDA.W Palette_Magdollite_Glow_3,Y                                    ;A8B0E8;
    STA.B $18                                                            ;A8B0EB;
    LDA.W $1794                                                          ;A8B0ED;
    TAX                                                                  ;A8B0F0;
    LDA.B $12                                                            ;A8B0F1;
    STA.L $7EC012,X                                                      ;A8B0F3;
    LDA.B $14                                                            ;A8B0F7;
    STA.L $7EC014,X                                                      ;A8B0F9;
    LDA.B $16                                                            ;A8B0FD;
    STA.L $7EC016,X                                                      ;A8B0FF;
    LDA.B $18                                                            ;A8B103;
    STA.L $7EC018,X                                                      ;A8B105;

.return:
    RTL                                                                  ;A8B109;


MainAI_Magdollite:
    LDX.W $0E54                                                          ;A8B10A;
    LDA.L $7E7808,X                                                      ;A8B10D;
    DEC A                                                                ;A8B111;
    STA.L $7E7808,X                                                      ;A8B112;
    JSR.W ($0FB2,X)                                                      ;A8B116;
    RTL                                                                  ;A8B119;


Function_Magdollite_WaitForSamusToGetNear:
    LDX.W $0E54                                                          ;A8B11A;
    LDA.W #$0000                                                         ;A8B11D;
    STA.L $7E7800,X                                                      ;A8B120;
    LDA.W #InstList_Magdollite_Idling_FacingLeft                         ;A8B124;
    STA.W EnemyData.work3,X                                              ;A8B127;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B12A;
    BMI .facingDirectionChosen                                           ;A8B12E;
    LDA.W #InstList_Magdollite_Idling_FacingRight                        ;A8B130;
    STA.W EnemyData.work3,X                                              ;A8B133;
    LDA.W #$0001                                                         ;A8B136;
    STA.L $7E7800,X                                                      ;A8B139;

.facingDirectionChosen:
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B13D;
    LDA.L $7E7888,X                                                      ;A8B140;
    BPL .return                                                          ;A8B144;
    LDA.W #$0000                                                         ;A8B146;
    STA.L $7E7888,X                                                      ;A8B149;
    LDA.W EnemyData.initParam1,X                                         ;A8B14D;
    AND.W #$00FF                                                         ;A8B150;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A8B153;
    BEQ .return                                                          ;A8B157;
    LDA.W #InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_0    ;A8B159;
    STA.W EnemyData.work3,X                                              ;A8B15C;
    LDA.L $7E7800,X                                                      ;A8B15F;
    BEQ .keepLeft                                                        ;A8B163;
    LDA.W #InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_0   ;A8B165;
    STA.W EnemyData.work3,X                                              ;A8B168;

.keepLeft:
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B16B;
    LDA.W #Function_Magdollite_WaitUntilBasePillarFormed                 ;A8B16E;
    STA.W EnemyData.work5,X                                              ;A8B171;

.return:
    RTS                                                                  ;A8B174;


Function_Magdollite_WaitUntilBasePillarFormed:
    LDX.W $0E54                                                          ;A8B175;
    LDA.L $7E7802,X                                                      ;A8B178;
    BNE .return                                                          ;A8B17C;
    LDA.W #$0001                                                         ;A8B17E;
    STA.L $7E7804,X                                                      ;A8B181;
    LDA.W #$0000                                                         ;A8B185;
    STA.L $7E785A,X                                                      ;A8B188;
    LDA.W #Function_Magdollite_WaitForOtherPartsToFinish                 ;A8B18C;
    STA.W EnemyData.work5,X                                              ;A8B18F;

.return:
    RTS                                                                  ;A8B192;


Function_Magdollite_WaitForOtherPartsToFinish:
    LDX.W $0E54                                                          ;A8B193;
    LDA.L $7E7804,X                                                      ;A8B196;
    BNE .return                                                          ;A8B19A;
    LDA.W #InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_0  ;A8B19C;
    STA.W EnemyData.work3,X                                              ;A8B19F;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B1A2;
    BMI .facingDirectionChosen                                           ;A8B1A6;
    LDA.W #InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_0 ;A8B1A8;
    STA.W EnemyData.work3,X                                              ;A8B1AB;

.facingDirectionChosen:
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B1AE;
    LDA.W #Function_Magdollite_UnformBasePillarBackToHeadIdling          ;A8B1B1;
    STA.W EnemyData.work5,X                                              ;A8B1B4;

.return:
    RTS                                                                  ;A8B1B7;


Function_Magdollite_UnformBasePillarBackToHeadIdling:
    LDX.W $0E54                                                          ;A8B1B8;
    LDA.L $7E7802,X                                                      ;A8B1BB;
    BNE .return                                                          ;A8B1BF;
    LDA.W #InstList_Magdollite_Idling_FacingLeft                         ;A8B1C1;
    STA.W EnemyData.work3,X                                              ;A8B1C4;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B1C7;
    BMI .facingDirectionChosen                                           ;A8B1CB;
    LDA.W #InstList_Magdollite_Idling_FacingRight                        ;A8B1CD;
    STA.W EnemyData.work3,X                                              ;A8B1D0;

.facingDirectionChosen:
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B1D3;
    LDA.W #Function_Magdollite_WaitForSamusToGetNear                     ;A8B1D6;
    STA.W EnemyData.work5,X                                              ;A8B1D9;

.return:
    RTS                                                                  ;A8B1DC;


Function_Magdollite_Slave1_WaitForAttackToBeTriggered:
    LDX.W $0E54                                                          ;A8B1DD;
    LDA.L $7E781A,X                                                      ;A8B1E0;
    BNE .return                                                          ;A8B1E4;
    LDA.W #Function_Magdollite_Slave1_HandlePillarGrowth                 ;A8B1E6;
    STA.W EnemyData.work5,X                                              ;A8B1E9;
    LDA.W #$0000                                                         ;A8B1EC;
    STA.W EnemyData.work4,X                                              ;A8B1EF;
    STA.L $7E781A,X                                                      ;A8B1F2;
    LDA.W #$0002                                                         ;A8B1F6;
    STA.W EnemyData.work1,X                                              ;A8B1F9;
    LDA.L $7E7806,X                                                      ;A8B1FC;
    STA.W EnemyData.yPosition,X                                          ;A8B200;

.return:
    RTS                                                                  ;A8B203;


Function_Magdollite_Slave1_HandlePillarGrowth:
    LDX.W $0E54                                                          ;A8B204;
    CLC                                                                  ;A8B207;
    LDA.W EnemyData.ySubPosition,X                                       ;A8B208;
    ADC.L $7E77D2,X                                                      ;A8B20B;
    STA.W EnemyData.ySubPosition,X                                       ;A8B20F;
    BCC +                                                                ;A8B212;
    INC.W EnemyData.work4,X                                              ;A8B214;

  + LDA.W EnemyData.yPosition,X                                          ;A8B217;
    ADC.L $7E77D4,X                                                      ;A8B21A;
    STA.W EnemyData.yPosition,X                                          ;A8B21E;
    CLC                                                                  ;A8B221;
    LDA.W EnemyData.work4,X                                              ;A8B222;
    ADC.L $7E77D4,X                                                      ;A8B225;
    STA.W EnemyData.work4,X                                              ;A8B229;
    JSR.W Function_Magdollite_Slave1_AddPillarStacksToReachSamusHeight   ;A8B22C;
    RTS                                                                  ;A8B22F;


Function_Magdollite_Slave1_AddPillarStacksToReachSamusHeight:
    LDA.W EnemyData.work4,X                                              ;A8B230;
    EOR.W #$FFFF                                                         ;A8B233;
    INC A                                                                ;A8B236;
    CMP.W #$006C                                                         ;A8B237;
    BPL .doneGrowing                                                     ;A8B23A;
    LDY.W EnemyData.work1,X                                              ;A8B23C;
    LDA.W EnemyData.yPosition,X                                          ;A8B23F;
    SEC                                                                  ;A8B242;
    SBC.W MagdolliteYOffsetAimingAtSamus,Y                               ;A8B243;
    CMP.W $0AFA                                                          ;A8B246;
    BMI .doneGrowing                                                     ;A8B249;
    LDA.W EnemyData.work4,X                                              ;A8B24B;
    EOR.W #$FFFF                                                         ;A8B24E;
    INC A                                                                ;A8B251;
    CMP.W MagdolliteArmHeightThreshold,Y                                 ;A8B252;
    BPL .increasePillarStack                                             ;A8B255;
    BRA .return                                                          ;A8B257;


.doneGrowing:
    LDA.W #Function_Magdollite_Slave1_GetEnemyIndex                      ;A8B259;
    STA.W EnemyData.work5,X                                              ;A8B25C;
    LDA.W #$0001                                                         ;A8B25F;
    STA.L $7E7818,X                                                      ;A8B262;
    LDA.W EnemyData.work4,X                                              ;A8B266;
    EOR.W #$FFFF                                                         ;A8B269;
    INC A                                                                ;A8B26C;
    CMP.W MagdolliteArmHeightThreshold,Y                                 ;A8B26D;
    BPL .increasePillarStack                                             ;A8B270;
    BRA .return                                                          ;A8B272;


.increasePillarStack:
    INC.W EnemyData.work1,X                                              ;A8B274;
    INC.W EnemyData.work1,X                                              ;A8B277;
    LDA.W EnemyData.yPosition,X                                          ;A8B27A;
    CLC                                                                  ;A8B27D;
    ADC.W #$0008                                                         ;A8B27E;
    STA.W EnemyData.yPosition,X                                          ;A8B281;
    LDY.W EnemyData.work1,X                                              ;A8B284;
    LDA.W MagdolliteSlave1InstListPointers,Y                             ;A8B287;
    STA.W EnemyData.work3,X                                              ;A8B28A;
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B28D;

.return:
    RTS                                                                  ;A8B290;


Function_Magdollite_Slave1_GetEnemyIndex:
    LDX.W $0E54                                                          ;A8B291;
    RTS                                                                  ;A8B294;


Function_Magdollite_Slave1_HandlePillarShrinking:
    LDX.W $0E54                                                          ;A8B295;
    LDA.W EnemyData.yPosition,X                                          ;A8B298;
    CLC                                                                  ;A8B29B;
    ADC.L $7E77D0,X                                                      ;A8B29C;
    STA.W EnemyData.yPosition,X                                          ;A8B2A0;
    LDA.W EnemyData.work4,X                                              ;A8B2A3;
    CLC                                                                  ;A8B2A6;
    ADC.L $7E77D0,X                                                      ;A8B2A7;
    STA.W EnemyData.work4,X                                              ;A8B2AB;
    LDA.W EnemyData.ySubPosition,X                                       ;A8B2AE;
    CLC                                                                  ;A8B2B1;
    ADC.L $7E77CE,X                                                      ;A8B2B2;
    BCC +                                                                ;A8B2B6;
    INC.W EnemyData.yPosition,X                                          ;A8B2B8;
    INC.W EnemyData.work4,X                                              ;A8B2BB;

  + STA.W EnemyData.ySubPosition,X                                       ;A8B2BE;
    JSR.W RemoveMagdollitePillarStacksUntilBackToBaseHeight              ;A8B2C1;
    RTS                                                                  ;A8B2C4;


RemoveMagdollitePillarStacksUntilBackToBaseHeight:
    LDY.W EnemyData.work1,X                                              ;A8B2C5;
    DEY                                                                  ;A8B2C8;
    DEY                                                                  ;A8B2C9;
    LDA.W EnemyData.work4,X                                              ;A8B2CA;
    BPL .doneShrinking                                                   ;A8B2CD;
    EOR.W #$FFFF                                                         ;A8B2CF;
    INC A                                                                ;A8B2D2;
    CMP.W MagdolliteArmHeightThreshold,Y                                 ;A8B2D3;
    BMI .removeTileAndRecenter                                           ;A8B2D6;
    BRA .return                                                          ;A8B2D8;


.removeTileAndRecenter:
    DEC.W EnemyData.work1,X                                              ;A8B2DA;
    DEC.W EnemyData.work1,X                                              ;A8B2DD;
    LDA.W EnemyData.yPosition,X                                          ;A8B2E0;
    SEC                                                                  ;A8B2E3;
    SBC.W #$0008                                                         ;A8B2E4;
    STA.W EnemyData.yPosition,X                                          ;A8B2E7;
    LDY.W EnemyData.work1,X                                              ;A8B2EA;
    LDA.W MagdolliteSlave1InstListPointers,Y                             ;A8B2ED;
    STA.W EnemyData.work3,X                                              ;A8B2F0;
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B2F3;
    BRA .return                                                          ;A8B2F6;


.doneShrinking:
    LDA.W #$0001                                                         ;A8B2F8;
    STA.L $7E781A,X                                                      ;A8B2FB;
    LDA.W #$0000                                                         ;A8B2FF;
    STA.L $7E77C4,X                                                      ;A8B302;
    LDA.W #Function_Magdollite_Slave1_WaitForAttackToBeTriggered         ;A8B306;
    STA.W EnemyData.work5,X                                              ;A8B309;

.return:
    RTS                                                                  ;A8B30C;


Function_Magdollite_Slave2_Idling_WaitingForTrigger:
    LDX.W $0E54                                                          ;A8B30D;
    LDA.W $0F32,X                                                        ;A8B310;
    CMP.W #Function_Magdollite_WaitUntilBasePillarFormed                 ;A8B313;
    BNE .return                                                          ;A8B316;
    LDA.W #Function_Magdollite_Slave2_SetToThrowFireballsAfterGrowing    ;A8B318;
    STA.W EnemyData.work5,X                                              ;A8B31B;

.return:
    RTS                                                                  ;A8B31E;


Function_Magdollite_Slave2_SetSlave1ToShrinkAfterFireballs:
    LDX.W $0E54                                                          ;A8B31F;
    LDA.L $7E7802,X                                                      ;A8B322;
    BNE .done                                                            ;A8B326;
    LDA.W #InstList_Magdollite_Slave2_PillarCap                          ;A8B328;
    STA.W EnemyData.work3,X                                              ;A8B32B;
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B32E;
    LDA.W #Function_Magdollite_Slave1_HandlePillarShrinking              ;A8B331;
    STA.W $0F72,X                                                        ;A8B334;
    LDA.W #Function_Magdollite_Slave2_GoBackToIdlingAfterPillarShrinks   ;A8B337;
    STA.W EnemyData.work5,X                                              ;A8B33A;
    LDA.W #$0000                                                         ;A8B33D;
    STA.L $7E77D8,X                                                      ;A8B340;
    LDA.L $7E7824,X                                                      ;A8B344;
    STA.W EnemyData.xPosition,X                                          ;A8B348;
    LDA.L $7E7826,X                                                      ;A8B34B;
    STA.W EnemyData.yPosition,X                                          ;A8B34F;

.done:
    JSR.W SetMagdolliteYRadius                                           ;A8B352;
    RTS                                                                  ;A8B355;


Function_Magdollite_Slave2_SetToThrowFireballsAfterGrowing:
    LDX.W $0E54                                                          ;A8B356;
    LDA.L $7E77D8,X                                                      ;A8B359;
    BEQ .waiting                                                         ;A8B35D;
    LDA.W #InstList_Magdollite_Slave2_ThrowFireballs_FacingLeft          ;A8B35F;
    STA.W EnemyData.work3,X                                              ;A8B362;
    LDA.W #$0000                                                         ;A8B365;
    STA.W EnemyData.work1,X                                              ;A8B368;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B36B;
    BMI .directionChosen                                                 ;A8B36F;
    LDA.W #InstList_Magdollite_ThrowFireballs_FacingRight                ;A8B371;
    STA.W EnemyData.work3,X                                              ;A8B374;
    LDA.W #$0001                                                         ;A8B377;
    STA.W EnemyData.work1,X                                              ;A8B37A;

.directionChosen:
    JSR.W CheckIfMagdolliteInstListChanged                               ;A8B37D;
    LDA.W #Function_Magdollite_Slave2_SetSlave1ToShrinkAfterFireballs    ;A8B380;
    STA.W EnemyData.work5,X                                              ;A8B383;
    LDA.W EnemyData.xPosition,X                                          ;A8B386;
    STA.L $7E7824,X                                                      ;A8B389;
    LDA.W EnemyData.yPosition,X                                          ;A8B38D;
    STA.L $7E7826,X                                                      ;A8B390;
    BRA .done                                                            ;A8B394;


.waiting:
    LDY.W $0F6A,X                                                        ;A8B396;
    LDA.W $0F3E,X                                                        ;A8B399;
    SEC                                                                  ;A8B39C;
    SBC.W MagdolliteYOffsetAimingAtSamus,Y                               ;A8B39D;
    STA.W EnemyData.yPosition,X                                          ;A8B3A0;

.done:
    JSR.W SetMagdolliteYRadius                                           ;A8B3A3;
    RTS                                                                  ;A8B3A6;


Function_Magdollite_Slave2_GoBackToIdlingAfterPillarShrinks:
    LDX.W $0E54                                                          ;A8B3A7;
    LDA.W $0F32,X                                                        ;A8B3AA;
    CMP.W #Function_Magdollite_WaitForSamusToGetNear                     ;A8B3AD;
    BNE .notWaitingForTrigger                                            ;A8B3B0;
    LDA.W #Function_Magdollite_Slave2_Idling_WaitingForTrigger           ;A8B3B2;
    STA.W EnemyData.work5,X                                              ;A8B3B5;
    BRA .done                                                            ;A8B3B8;


.notWaitingForTrigger:
    LDY.W $0F6A,X                                                        ;A8B3BA;
    LDA.W $0F3E,X                                                        ;A8B3BD;
    SEC                                                                  ;A8B3C0;
    SBC.W MagdolliteYOffsetAimingAtSamus,Y                               ;A8B3C1;
    STA.W EnemyData.yPosition,X                                          ;A8B3C4;

.done:
    JSR.W SetMagdolliteYRadius                                           ;A8B3C7;
    RTS                                                                  ;A8B3CA;


SetMagdolliteYRadius:
    LDA.W $0EFE,X                                                        ;A8B3CB;
    SEC                                                                  ;A8B3CE;
    SBC.W EnemyData.yPosition,X                                          ;A8B3CF;
    CLC                                                                  ;A8B3D2;
    ADC.W #$0002                                                         ;A8B3D3;
    STA.W $0F04,X                                                        ;A8B3D6;
    CMP.W #$0008                                                         ;A8B3D9;
    BPL .return                                                          ;A8B3DC;
    LDA.W #$0008                                                         ;A8B3DE;
    STA.W $0F04,X                                                        ;A8B3E1;

.return:
    RTS                                                                  ;A8B3E4;


CheckIfMagdolliteInstListChanged:
    LDX.W $0E54                                                          ;A8B3E5;
    LDA.W EnemyData.work3,X                                              ;A8B3E8;
    CMP.W EnemyData.work2,X                                              ;A8B3EB;
    BEQ .return                                                          ;A8B3EE;
    STA.W EnemyData.pInstList,X                                          ;A8B3F0;
    STA.W EnemyData.work2,X                                              ;A8B3F3;
    LDA.W #$0001                                                         ;A8B3F6;
    STA.W EnemyData.instTimer,X                                          ;A8B3F9;
    STZ.W EnemyData.loopCounter,X                                        ;A8B3FC;

.return:
    RTS                                                                  ;A8B3FF;


PowerBombReaction_Magdollite:
    JSL.L CommonA8_NormalEnemyPowerBombAI                                ;A8B400;
    BRA ContactReaction_Magdollite_Common                                ;A8B404;


EnemyTouch_Magdollite:
    JSL.L CommonA8_NormalEnemyTouchAI                                    ;A8B406;
    BRA ContactReaction_Magdollite_Common                                ;A8B40A;


EnemyShot_Magdollite:
    JSL.L NormalEnemyShotAI                                              ;A8B40C;

ContactReaction_Magdollite_Common:
    LDX.W $0E54                                                          ;A8B410;
    LDA.W EnemyData.health,X                                             ;A8B413;
    BNE .notDead                                                         ;A8B416;
    LDA.W $0FC6,X                                                        ;A8B418;
    ORA.W #$0200                                                         ;A8B41B;
    STA.W $0FC6,X                                                        ;A8B41E;
    LDA.W $1006,X                                                        ;A8B421;
    ORA.W #$0200                                                         ;A8B424;
    STA.W $1006,X                                                        ;A8B427;

.notDead:
    LDA.W EnemyData.freezeTimer,X                                        ;A8B42A;
    BEQ .return                                                          ;A8B42D;
    STA.W $0FDE,X                                                        ;A8B42F;
    STA.W $101E,X                                                        ;A8B432;
    LDA.W $0FCA,X                                                        ;A8B435;
    ORA.W #$0004                                                         ;A8B438;
    STA.W $0FCA,X                                                        ;A8B43B;
    LDA.W $100A,X                                                        ;A8B43E;
    ORA.W #$0004                                                         ;A8B441;
    STA.W $100A,X                                                        ;A8B444;

.return:
    RTL                                                                  ;A8B447;


Spritemap_Magdollite_FacingLeft_Head_0:
    dw $0003,$0004                                                       ;A8B448;
    db $FF                                                               ;A8B44C;
    dw $2123,$0004                                                       ;A8B44D;
    db $F7                                                               ;A8B451;
    dw $2122,$81F4                                                       ;A8B452;
    db $F7                                                               ;A8B456;
    dw $210A                                                             ;A8B457;

Spritemap_Magdollite_FacingLeft_Head_1:
    dw $0003,$0004                                                       ;A8B459;
    db $00                                                               ;A8B45D;
    dw $2123,$0004                                                       ;A8B45E;
    db $F8                                                               ;A8B462;
    dw $2122,$81F4                                                       ;A8B463;
    db $F8                                                               ;A8B467;
    dw $210A                                                             ;A8B468;

Spritemap_Magdollite_FacingLeft_Head_2:
    dw $0003,$0004                                                       ;A8B46A;
    db $01                                                               ;A8B46E;
    dw $2123,$0004                                                       ;A8B46F;
    db $F9                                                               ;A8B473;
    dw $2122,$81F4                                                       ;A8B474;
    db $F9                                                               ;A8B478;
    dw $210A                                                             ;A8B479;

Spritemap_Magdollite_FacingLeft_Fist_0:
    dw $0003,$0000                                                       ;A8B47B;
    db $04                                                               ;A8B47F;
    dw $2121,$01F8                                                       ;A8B480;
    db $04                                                               ;A8B484;
    dw $2120,$81F8                                                       ;A8B485;
    db $F4                                                               ;A8B489;
    dw $2108                                                             ;A8B48A;

Spritemap_Magdollite_FacingLeft_Fist_1:
    dw $0003,$01FD                                                       ;A8B48C;
    db $04                                                               ;A8B490;
    dw $2121,$01F5                                                       ;A8B491;
    db $04                                                               ;A8B495;
    dw $2120,$81F9                                                       ;A8B496;
    db $F5                                                               ;A8B49A;
    dw $2108                                                             ;A8B49B;

Spritemap_Magdollite_FacingLeft_Hand_FingersStraight:
    dw $0002,$8000                                                       ;A8B49D;
    db $FC                                                               ;A8B4A1;
    dw $2106,$81F0                                                       ;A8B4A2;
    db $F9                                                               ;A8B4A6;
    dw $2104                                                             ;A8B4A7;

Spritemap_Magdollite_FacingLeft_Hand_FingersCurled:
    dw $0002,$8000                                                       ;A8B4A9;
    db $F8                                                               ;A8B4AD;
    dw $2102,$81F0                                                       ;A8B4AE;
    db $F8                                                               ;A8B4B2;
    dw $2100                                                             ;A8B4B3;

Spritemap_Magdollite_FacingLeft_PillarCap:
    dw $0002,$0000                                                       ;A8B4B5;
    db $FC                                                               ;A8B4B9;
    dw $2125,$01F8                                                       ;A8B4BA;
    db $FC                                                               ;A8B4BE;
    dw $2124                                                             ;A8B4BF;

Spritemap_Magdollite_FacingLeft_WidePillarSection:
    dw $0001,$81F8                                                       ;A8B4C1;
    db $F8                                                               ;A8B4C5;
    dw $210E                                                             ;A8B4C6;

UNUSED_Spritemap_Magdollite_Blank_A8B4C8:
    dw $0001,$81F8                                                       ;A8B4C8;
    db $F8                                                               ;A8B4CC;
    dw $210C                                                             ;A8B4CD;

Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava:
    dw $0003,$0004                                                       ;A8B4CF;
    db $FC                                                               ;A8B4D3;
    dw $2128,$01FC                                                       ;A8B4D4;
    db $FC                                                               ;A8B4D8;
    dw $2127,$01F4                                                       ;A8B4D9;
    db $FC                                                               ;A8B4DD;
    dw $2126                                                             ;A8B4DE;

Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava:
    dw $0003,$0004                                                       ;A8B4E0;
    db $FC                                                               ;A8B4E4;
    dw $212B,$01FC                                                       ;A8B4E5;
    db $FC                                                               ;A8B4E9;
    dw $212A,$01F4                                                       ;A8B4EA;
    db $FC                                                               ;A8B4EE;
    dw $2129                                                             ;A8B4EF;

Spritemap_Magdollite_FacingRight_Head_0:
    dw $0003,$01F4                                                       ;A8B4F1;
    db $FF                                                               ;A8B4F5;
    dw $6123,$01F4                                                       ;A8B4F6;
    db $F7                                                               ;A8B4FA;
    dw $6122,$81FC                                                       ;A8B4FB;
    db $F7                                                               ;A8B4FF;
    dw $610A                                                             ;A8B500;

Spritemap_Magdollite_FacingRight_Head_1:
    dw $0003,$01F4                                                       ;A8B502;
    db $00                                                               ;A8B506;
    dw $6123,$01F4                                                       ;A8B507;
    db $F8                                                               ;A8B50B;
    dw $6122,$81FC                                                       ;A8B50C;
    db $F8                                                               ;A8B510;
    dw $610A                                                             ;A8B511;

Spritemap_Magdollite_FacingRight_Head_2:
    dw $0003,$01F4                                                       ;A8B513;
    db $01                                                               ;A8B517;
    dw $6123,$01F4                                                       ;A8B518;
    db $F9                                                               ;A8B51C;
    dw $6122,$81FC                                                       ;A8B51D;
    db $F9                                                               ;A8B521;
    dw $610A                                                             ;A8B522;

Spritemap_Magdollite_FacingRight_Fist_0:
    dw $0003,$01F8                                                       ;A8B524;
    db $04                                                               ;A8B528;
    dw $6121,$0000                                                       ;A8B529;
    db $04                                                               ;A8B52D;
    dw $6120,$81F8                                                       ;A8B52E;
    db $F4                                                               ;A8B532;
    dw $6108                                                             ;A8B533;

Spritemap_Magdollite_FacingRight_Fist_1:
    dw $0003,$01FB                                                       ;A8B535;
    db $04                                                               ;A8B539;
    dw $6121,$0003                                                       ;A8B53A;
    db $04                                                               ;A8B53E;
    dw $6120,$81F7                                                       ;A8B53F;
    db $F5                                                               ;A8B543;
    dw $6108                                                             ;A8B544;

Spritemap_Magdollite_FacingRight_Hand_FingersStraight:
    dw $0002,$81F0                                                       ;A8B546;
    db $FC                                                               ;A8B54A;
    dw $6106,$8000                                                       ;A8B54B;
    db $F9                                                               ;A8B54F;
    dw $6104                                                             ;A8B550;

Spritemap_Magdollite_FacingRight_Hand_FingersCurled:
    dw $0002,$81F0                                                       ;A8B552;
    db $F8                                                               ;A8B556;
    dw $6102,$8000                                                       ;A8B557;
    db $F8                                                               ;A8B55B;
    dw $6100                                                             ;A8B55C;

UNUSED_Spritemap_Magdollite_FacingRight_PillarCap_A8B55E:
    dw $0002,$01F8                                                       ;A8B55E;
    db $FC                                                               ;A8B562;
    dw $6125,$0000                                                       ;A8B563;
    db $FC                                                               ;A8B567;
    dw $6124                                                             ;A8B568;

Spritemap_Magdollite_FacingRight_WidePillarSection:
    dw $0001,$81F8                                                       ;A8B56A;
    db $F8                                                               ;A8B56E;
    dw $610E                                                             ;A8B56F;

UNUSED_Spritemap_Magdollite_FacingRight_NarrowPillar_A8B571:
    dw $0001,$81F8                                                       ;A8B571;
    db $F8                                                               ;A8B575;
    dw $610C                                                             ;A8B576;

Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava:
    dw $0003,$01F4                                                       ;A8B578;
    db $FC                                                               ;A8B57C;
    dw $6128,$01FC                                                       ;A8B57D;
    db $FC                                                               ;A8B581;
    dw $6127,$0004                                                       ;A8B582;
    db $FC                                                               ;A8B586;
    dw $6126                                                             ;A8B587;

Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava:
    dw $0003,$01F4                                                       ;A8B589;
    db $FC                                                               ;A8B58D;
    dw $612B,$01FC                                                       ;A8B58E;
    db $FC                                                               ;A8B592;
    dw $612A,$0004                                                       ;A8B593;
    db $FC                                                               ;A8B597;
    dw $6129                                                             ;A8B598;

Spritemap_Magdollite_FacingLeft_NarrowPillarSection:
    dw $0001,$81F8                                                       ;A8B59A;
    db $F8                                                               ;A8B59E;
    dw $210C                                                             ;A8B59F;

Spritemap_Magdollite_FacingRight_NarrowPillarSection:
    dw $0002,$81F8                                                       ;A8B5A1;
    db $00                                                               ;A8B5A5;
    dw $210C,$81F8                                                       ;A8B5A6;
    db $F0                                                               ;A8B5AA;
    dw $210C                                                             ;A8B5AB;

Spritemap_Magdollite_NarrowPillarStacks_3x:
    dw $0003,$81F8                                                       ;A8B5AD;
    db $08                                                               ;A8B5B1;
    dw $210C,$81F8                                                       ;A8B5B2;
    db $E8                                                               ;A8B5B6;
    dw $210C,$81F8                                                       ;A8B5B7;
    db $F8                                                               ;A8B5BB;
    dw $210C                                                             ;A8B5BC;

Spritemap_Magdollite_NarrowPillarStacks_4x:
    dw $0004,$81F8                                                       ;A8B5BE;
    db $10                                                               ;A8B5C2;
    dw $210C,$81F8                                                       ;A8B5C3;
    db $00                                                               ;A8B5C7;
    dw $210C,$81F8                                                       ;A8B5C8;
    db $F0                                                               ;A8B5CC;
    dw $210C,$81F8                                                       ;A8B5CD;
    db $E0                                                               ;A8B5D1;
    dw $210C                                                             ;A8B5D2;

Spritemap_Magdollite_NarrowPillarStacks_5x:
    dw $0005,$81F8                                                       ;A8B5D4;
    db $18                                                               ;A8B5D8;
    dw $210C,$81F8                                                       ;A8B5D9;
    db $08                                                               ;A8B5DD;
    dw $210C,$81F8                                                       ;A8B5DE;
    db $D8                                                               ;A8B5E2;
    dw $210C,$81F8                                                       ;A8B5E3;
    db $F8                                                               ;A8B5E7;
    dw $210C,$81F8                                                       ;A8B5E8;
    db $E8                                                               ;A8B5EC;
    dw $210C                                                             ;A8B5ED;

Spritemap_Magdollite_NarrowPillarStacks_6x:
    dw $0006,$81F8                                                       ;A8B5EF;
    db $10                                                               ;A8B5F3;
    dw $210C,$81F8                                                       ;A8B5F4;
    db $20                                                               ;A8B5F8;
    dw $210C,$81F8                                                       ;A8B5F9;
    db $00                                                               ;A8B5FD;
    dw $210C,$81F8                                                       ;A8B5FE;
    db $F0                                                               ;A8B602;
    dw $210C,$81F8                                                       ;A8B603;
    db $E0                                                               ;A8B607;
    dw $210C,$81F8                                                       ;A8B608;
    db $D0                                                               ;A8B60C;
    dw $210C                                                             ;A8B60D;

Spritemap_Magdollite_NarrowPillarStacks_7x:
    dw $0007,$81F8                                                       ;A8B60F;
    db $28                                                               ;A8B613;
    dw $210C,$81F8                                                       ;A8B614;
    db $18                                                               ;A8B618;
    dw $210C,$81F8                                                       ;A8B619;
    db $08                                                               ;A8B61D;
    dw $210C,$81F8                                                       ;A8B61E;
    db $F8                                                               ;A8B622;
    dw $210C,$81F8                                                       ;A8B623;
    db $E8                                                               ;A8B627;
    dw $210C,$81F8                                                       ;A8B628;
    db $D8                                                               ;A8B62C;
    dw $210C,$81F8                                                       ;A8B62D;
    db $C8                                                               ;A8B631;
    dw $210C                                                             ;A8B632;

Spritemap_Magdollite_NarrowPillarStacks_8x:
    dw $0008,$81F8                                                       ;A8B634;
    db $30                                                               ;A8B638;
    dw $210C,$81F8                                                       ;A8B639;
    db $00                                                               ;A8B63D;
    dw $210C,$81F8                                                       ;A8B63E;
    db $20                                                               ;A8B642;
    dw $210C,$81F8                                                       ;A8B643;
    db $10                                                               ;A8B647;
    dw $210C,$81F8                                                       ;A8B648;
    db $F0                                                               ;A8B64C;
    dw $210C,$81F8                                                       ;A8B64D;
    db $E0                                                               ;A8B651;
    dw $210C,$81F8                                                       ;A8B652;
    db $D0                                                               ;A8B656;
    dw $210C,$81F8                                                       ;A8B657;
    db $C0                                                               ;A8B65B;
    dw $210C                                                             ;A8B65C;

Palette_Beetom:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610                   ;A8B65E;
    dw $1DCE,$1CDF,$4FE0,$3B20,$2A20,$1097,$6BDF,$042E                   ;A8B66E;

UNUSED_BeetomEyeColors_A8B67E:
    dw $4FE0,$3B20,$2A20,$3BE0,$2680,$1580,$2740,$11E0                   ;A8B67E;
    dw $00E0,$12A0,$0140,$0040                                           ;A8B68E;

InstList_Beetom_Crawling_FacingLeft_0:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A8B696;

InstList_Beetom_Crawling_FacingLeft_1:
    dw $000A                                                             ;A8B698;
    dw Spritemap_Beetom_0                                                ;A8B69A;
    dw $000A                                                             ;A8B69C;
    dw Spritemap_Beetom_1                                                ;A8B69E;
    dw $000A                                                             ;A8B6A0;
    dw Spritemap_Beetom_2                                                ;A8B6A2;
    dw $000A                                                             ;A8B6A4;
    dw Spritemap_Beetom_1                                                ;A8B6A6;
    dw Instruction_Common_GotoY                                          ;A8B6A8;
    dw InstList_Beetom_Crawling_FacingLeft_1                             ;A8B6AA;

InstList_Beetom_Hop_FacingLeft:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A8B6AC;
    dw $0004                                                             ;A8B6AE;
    dw Spritemap_Beetom_3                                                ;A8B6B0;
    dw $0008                                                             ;A8B6B2;
    dw Spritemap_Beetom_4                                                ;A8B6B4;
    dw $0004                                                             ;A8B6B6;
    dw Spritemap_Beetom_3                                                ;A8B6B8;
    dw $0001                                                             ;A8B6BA;
    dw Spritemap_Beetom_0                                                ;A8B6BC;
    dw Instruction_Common_Sleep                                          ;A8B6BE;

UNUSED_InstList_Beetom_SmallHop_FacingLeft_A8B6C0:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A8B6C0;
    dw $0004                                                             ;A8B6C2;
    dw Spritemap_Beetom_3                                                ;A8B6C4;
    dw $0001                                                             ;A8B6C6;
    dw Spritemap_Beetom_0                                                ;A8B6C8;
    dw Instruction_Common_Sleep                                          ;A8B6CA;

InstList_Beetom_DrainingSamus_FacingLeft_0:
    dw $0005                                                             ;A8B6CC;
    dw Spritemap_Beetom_5                                                ;A8B6CE;
    dw $0005                                                             ;A8B6D0;
    dw Spritemap_Beetom_6                                                ;A8B6D2;
    dw $0005                                                             ;A8B6D4;
    dw Spritemap_Beetom_7                                                ;A8B6D6;
    dw $0030                                                             ;A8B6D8;
    dw Spritemap_Beetom_6                                                ;A8B6DA;
    dw Instruction_Beetom_Nothing                                        ;A8B6DC;

InstList_Beetom_DrainingSamus_FacingLeft_1:
    dw $0005                                                             ;A8B6DE;
    dw Spritemap_Beetom_8                                                ;A8B6E0;
    dw $0005                                                             ;A8B6E2;
    dw Spritemap_Beetom_9                                                ;A8B6E4;
    dw $0005                                                             ;A8B6E6;
    dw Spritemap_Beetom_A                                                ;A8B6E8;
    dw $0005                                                             ;A8B6EA;
    dw Spritemap_Beetom_9                                                ;A8B6EC;
    dw Instruction_Common_GotoY                                          ;A8B6EE;
    dw InstList_Beetom_DrainingSamus_FacingLeft_1                        ;A8B6F0;

InstList_Beetom_Crawling_FacingRight_0:
    dw Instruction_Common_DisableOffScreenProcessing                     ;A8B6F2;

InstList_Beetom_Crawling_FacingRight_1:
    dw $000A                                                             ;A8B6F4;
    dw Spritemap_Beetom_B                                                ;A8B6F6;
    dw $000A                                                             ;A8B6F8;
    dw Spritemap_Beetom_C                                                ;A8B6FA;
    dw $000A                                                             ;A8B6FC;
    dw Spritemap_Beetom_D                                                ;A8B6FE;
    dw $000A                                                             ;A8B700;
    dw Spritemap_Beetom_C                                                ;A8B702;
    dw Instruction_Common_GotoY                                          ;A8B704;
    dw InstList_Beetom_Crawling_FacingRight_1                            ;A8B706;

InstList_Beetom_Hop_FacingRight:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A8B708;
    dw $0004                                                             ;A8B70A;
    dw Spritemap_Beetom_E                                                ;A8B70C;
    dw $0008                                                             ;A8B70E;
    dw Spritemap_Beetom_F                                                ;A8B710;
    dw $0004                                                             ;A8B712;
    dw Spritemap_Beetom_E                                                ;A8B714;
    dw $0001                                                             ;A8B716;
    dw Spritemap_Beetom_B                                                ;A8B718;
    dw Instruction_Common_Sleep                                          ;A8B71A;

UNUSED_InstList_Beetom_SmallHop_FacingRight_A8B71C:
    dw Instruction_Common_EnableOffScreenProcessing                      ;A8B71C;
    dw $0004                                                             ;A8B71E;
    dw Spritemap_Beetom_E                                                ;A8B720;
    dw $0001                                                             ;A8B722;
    dw Spritemap_Beetom_B                                                ;A8B724;
    dw Instruction_CommonA8_Sleep                                        ;A8B726;

InstList_Beetom_DrainingSamus_FacingRight_0:
    dw $0005                                                             ;A8B728;
    dw Spritemap_Beetom_10                                               ;A8B72A;
    dw $0005                                                             ;A8B72C;
    dw Spritemap_Beetom_11                                               ;A8B72E;
    dw $0005                                                             ;A8B730;
    dw Spritemap_Beetom_12                                               ;A8B732;
    dw $0030                                                             ;A8B734;
    dw Spritemap_Beetom_11                                               ;A8B736;
    dw Instruction_Beetom_Nothing                                        ;A8B738;

InstList_Beetom_DrainingSamus_FacingRight_1:
    dw $0005                                                             ;A8B73A;
    dw Spritemap_Beetom_13                                               ;A8B73C;
    dw $0005                                                             ;A8B73E;
    dw Spritemap_Beetom_14                                               ;A8B740;
    dw $0005                                                             ;A8B742;
    dw Spritemap_Beetom_15                                               ;A8B744;
    dw $0005                                                             ;A8B746;
    dw Spritemap_Beetom_14                                               ;A8B748;
    dw Instruction_Common_GotoY                                          ;A8B74A;
    dw InstList_Beetom_DrainingSamus_FacingRight_1                       ;A8B74C;

SamusNotInProximityBeetomFunctionPointers:
    dw Function_Beetom_StartIdling                                       ;A8B74E;
    dw Function_Beetom_StartIdling                                       ;A8B750;
    dw Function_Beetom_StartShortHopRight                                ;A8B752;
    dw Function_Beetom_StartLongHopRight                                 ;A8B754;
    dw Function_Beetom_StartShortHopRight                                ;A8B756;
    dw Function_Beetom_StartShortHopLeft                                 ;A8B758;
    dw Function_Beetom_StartLongHopLeft                                  ;A8B75A;
    dw Function_Beetom_StartLongHopRight                                 ;A8B75C;

Instruction_Beetom_Nothing:
    LDX.W $0E54                                                          ;A8B75E;
    RTL                                                                  ;A8B761;


SetBeetomInstList:
    LDX.W $0E54                                                          ;A8B762;
    LDA.L $7E7800,X                                                      ;A8B765;
    STA.W EnemyData.pInstList,X                                          ;A8B769;
    LDA.W #$0001                                                         ;A8B76C;
    STA.W EnemyData.instTimer,X                                          ;A8B76F;
    STZ.W EnemyData.loopCounter,X                                        ;A8B772;
    RTS                                                                  ;A8B775;


InitAI_Beetom:
    LDX.W $0E54                                                          ;A8B776;
    LDA.W #$0000                                                         ;A8B779;
    STA.W EnemyData.work3,X                                              ;A8B77C;
    STA.W EnemyData.work2,X                                              ;A8B77F;
    STA.L $7E780A,X                                                      ;A8B782;
    STA.L $7E7810,X                                                      ;A8B786;
    STA.W EnemyData.work0,X                                              ;A8B78A;
    LDA.W #$0040                                                         ;A8B78D;
    STA.W EnemyData.work4,X                                              ;A8B790;
    LDA.B $8B                                                            ;A8B793;
    STA.W EnemyData.work5,X                                              ;A8B795;
    LDA.W #$0017                                                         ;A8B798;
    STA.W $05E5                                                          ;A8B79B;
    LDA.W #$3000                                                         ;A8B79E;
    STA.B $16                                                            ;A8B7A1;
    LDA.W #$0004                                                         ;A8B7A3;
    STA.B $18                                                            ;A8B7A6;
    JSR.W Beetom_CalculateInitialHopSpeed                                ;A8B7A8;
    STA.L $7E7804,X                                                      ;A8B7AB;
    LDA.W #$4000                                                         ;A8B7AF;
    STA.B $16                                                            ;A8B7B2;
    LDA.W #$0005                                                         ;A8B7B4;
    STA.B $18                                                            ;A8B7B7;
    JSR.W Beetom_CalculateInitialHopSpeed                                ;A8B7B9;
    STA.L $7E7806,X                                                      ;A8B7BC;
    LDA.W #$3000                                                         ;A8B7C0;
    STA.B $16                                                            ;A8B7C3;
    LDA.W #$0003                                                         ;A8B7C5;
    STA.B $18                                                            ;A8B7C8;
    JSR.W Beetom_CalculateInitialHopSpeed                                ;A8B7CA;
    STA.L $7E7808,X                                                      ;A8B7CD;
    LDA.W #InstList_Beetom_Crawling_FacingRight_0                        ;A8B7D1;
    STA.L $7E7800,X                                                      ;A8B7D4;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B7D8;
    BPL .SamusToTheLeft                                                  ;A8B7DC;
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0                         ;A8B7DE;
    STA.L $7E7800,X                                                      ;A8B7E1;

.SamusToTheLeft:
    JSR.W SetBeetomInstList                                              ;A8B7E5;
    LDA.W #Function_Beetom_DecideAction                                  ;A8B7E8;
    STA.W EnemyData.work2,X                                              ;A8B7EB;
    RTL                                                                  ;A8B7EE;


Beetom_CalculateInitialHopSpeed:
    STZ.B $12                                                            ;A8B7EF;
    STZ.B $14                                                            ;A8B7F1;

.loop:
    LDA.B $12                                                            ;A8B7F3;
    CLC                                                                  ;A8B7F5;
    ADC.B $18                                                            ;A8B7F6;
    STA.B $12                                                            ;A8B7F8;
    ASL A                                                                ;A8B7FA;
    ASL A                                                                ;A8B7FB;
    ASL A                                                                ;A8B7FC;
    TAY                                                                  ;A8B7FD;
    LDA.B $14                                                            ;A8B7FE;
    CLC                                                                  ;A8B800;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y                  ;A8B801;
    STA.B $14                                                            ;A8B804;
    CMP.B $16                                                            ;A8B806;
    BMI .loop                                                            ;A8B808;
    LDA.B $12                                                            ;A8B80A;
    RTS                                                                  ;A8B80C;


MainAI_Beetom:
    LDX.W $0E54                                                          ;A8B80D;
    JSR.W ($0FAC,X)                                                      ;A8B810;
    RTL                                                                  ;A8B813;


Function_Beetom_DecideAction:
    LDX.W $0E54                                                          ;A8B814;
    LDA.W #$0060                                                         ;A8B817;
    JSL.L IsSamusWithinAPixelColumnsOfEnemy                              ;A8B81A;
    BEQ .notInProximity                                                  ;A8B81E;
    LDA.W #Function_Beetom_DecideAction_SamusInProximity                 ;A8B820;
    STA.W EnemyData.work2,X                                              ;A8B823;
    BRA .return                                                          ;A8B826;


.notInProximity:
    LDA.W #Function_Beetom_DecideAction_SamusNotInProximity              ;A8B828;
    STA.W EnemyData.work2,X                                              ;A8B82B;

.return:
    RTS                                                                  ;A8B82E;


Function_Beetom_DecideAction_SamusNotInProximity:
    LDX.W $0E54                                                          ;A8B82F;
    JSL.L GenerateRandomNumber                                           ;A8B832;
    LDA.W $05E5                                                          ;A8B836;
    AND.W #$0007                                                         ;A8B839;
    ASL A                                                                ;A8B83C;
    TAY                                                                  ;A8B83D;
    LDA.W SamusNotInProximityBeetomFunctionPointers,Y                    ;A8B83E;
    STA.W EnemyData.work2,X                                              ;A8B841;
    LDA.W $05E5                                                          ;A8B844;
    AND.W #$0001                                                         ;A8B847;
    STA.L $7E7812,X                                                      ;A8B84A;
    RTS                                                                  ;A8B84E;


Function_Beetom_StartIdling:
    LDX.W $0E54                                                          ;A8B84F;
    LDA.W #$0020                                                         ;A8B852;
    STA.W EnemyData.work3,X                                              ;A8B855;
    LDA.W #Function_Beetom_Idling                                        ;A8B858;
    STA.W EnemyData.work2,X                                              ;A8B85B;
    RTS                                                                  ;A8B85E;


Function_Beetom_StartCrawlingLeft:
    LDX.W $0E54                                                          ;A8B85F;
    LDA.W #Function_Beetom_CrawlingLeft                                  ;A8B862;
    STA.W EnemyData.work2,X                                              ;A8B865;
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0                         ;A8B868;
    STA.L $7E7800,X                                                      ;A8B86B;
    JSR.W SetBeetomInstList                                              ;A8B86F;
    RTS                                                                  ;A8B872;


Function_Beetom_StartCrawlingRight:
    LDX.W $0E54                                                          ;A8B873;
    LDA.W #Function_Beetom_CrawlingRight                                 ;A8B876;
    STA.W EnemyData.work2,X                                              ;A8B879;
    LDA.W #InstList_Beetom_Crawling_FacingRight_0                        ;A8B87C;
    STA.L $7E7800,X                                                      ;A8B87F;
    JSR.W SetBeetomInstList                                              ;A8B883;
    RTS                                                                  ;A8B886;


Function_Beetom_StartShortHopRight:
    LDX.W $0E54                                                          ;A8B887;
    LDA.L $7E7804,X                                                      ;A8B88A;
    STA.W EnemyData.work1,X                                              ;A8B88E;
    LDA.W #Function_Beetom_ShortHopLeft                                  ;A8B891;
    STA.W EnemyData.work2,X                                              ;A8B894;
    LDA.W #$0000                                                         ;A8B897;
    STA.L $7E780A,X                                                      ;A8B89A;
    LDA.W #InstList_Beetom_Hop_FacingLeft                                ;A8B89E;
    STA.L $7E7800,X                                                      ;A8B8A1;
    JSR.W SetBeetomInstList                                              ;A8B8A5;
    RTS                                                                  ;A8B8A8;


Function_Beetom_StartShortHopLeft:
    LDX.W $0E54                                                          ;A8B8A9;
    LDA.L $7E7804,X                                                      ;A8B8AC;
    STA.W EnemyData.work1,X                                              ;A8B8B0;
    LDA.W #Function_Beetom_ShortHopRight                                 ;A8B8B3;
    STA.W EnemyData.work2,X                                              ;A8B8B6;
    LDA.W #$0000                                                         ;A8B8B9;
    STA.L $7E780A,X                                                      ;A8B8BC;
    LDA.W #InstList_Beetom_Hop_FacingRight                               ;A8B8C0;
    STA.L $7E7800,X                                                      ;A8B8C3;
    JSR.W SetBeetomInstList                                              ;A8B8C7;
    RTS                                                                  ;A8B8CA;


Function_Beetom_StartLongHopLeft:
    LDX.W $0E54                                                          ;A8B8CB;
    LDA.L $7E7806,X                                                      ;A8B8CE;
    STA.W EnemyData.work1,X                                              ;A8B8D2;
    LDA.W #Function_Beetom_LongHopLeft                                   ;A8B8D5;
    STA.W EnemyData.work2,X                                              ;A8B8D8;
    LDA.W #$0000                                                         ;A8B8DB;
    STA.L $7E780A,X                                                      ;A8B8DE;
    LDA.W #InstList_Beetom_Hop_FacingLeft                                ;A8B8E2;
    STA.L $7E7800,X                                                      ;A8B8E5;
    JSR.W SetBeetomInstList                                              ;A8B8E9;
    RTS                                                                  ;A8B8EC;


Function_Beetom_StartLongHopRight:
    LDX.W $0E54                                                          ;A8B8ED;
    LDA.L $7E7806,X                                                      ;A8B8F0;
    STA.W EnemyData.work1,X                                              ;A8B8F4;
    LDA.W #Function_Beetom_LongHopRight                                  ;A8B8F7;
    STA.W EnemyData.work2,X                                              ;A8B8FA;
    LDA.W #$0000                                                         ;A8B8FD;
    STA.L $7E780A,X                                                      ;A8B900;
    LDA.W #InstList_Beetom_Hop_FacingRight                               ;A8B904;
    STA.L $7E7800,X                                                      ;A8B907;
    JSR.W SetBeetomInstList                                              ;A8B90B;
    RTS                                                                  ;A8B90E;


Function_Beetom_DecideAction_SamusInProximity:
    LDX.W $0E54                                                          ;A8B90F;
    LDA.L $7E7808,X                                                      ;A8B912;
    STA.W EnemyData.work1,X                                              ;A8B916;
    LDA.W #InstList_Beetom_Hop_FacingRight                               ;A8B919;
    STA.L $7E7800,X                                                      ;A8B91C;
    LDA.W #Function_Beetom_LungeRight                                    ;A8B920;
    STA.W EnemyData.work2,X                                              ;A8B923;
    LDA.W #$0001                                                         ;A8B926;
    STA.L $7E7812,X                                                      ;A8B929;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8B92D;
    BPL .SamusToTheLeft                                                  ;A8B931;
    LDA.W #InstList_Beetom_Hop_FacingLeft                                ;A8B933;
    STA.L $7E7800,X                                                      ;A8B936;
    LDA.W #Function_Beetom_LungeLeft                                     ;A8B93A;
    STA.W EnemyData.work2,X                                              ;A8B93D;
    LDA.W #$0000                                                         ;A8B940;
    STA.L $7E7812,X                                                      ;A8B943;

.SamusToTheLeft:
    JSR.W SetBeetomInstList                                              ;A8B947;
    LDA.W #$0000                                                         ;A8B94A;
    STA.L $7E780A,X                                                      ;A8B94D;
    RTS                                                                  ;A8B951;


Function_Beetom_StartDrainingSamus_FacingLeft:
    LDX.W $0E54                                                          ;A8B952;
    LDA.W #InstList_Beetom_DrainingSamus_FacingLeft_0                    ;A8B955;
    STA.L $7E7800,X                                                      ;A8B958;
    JSR.W SetBeetomInstList                                              ;A8B95C;
    LDA.W #Function_Beetom_DrainingSamus_FacingLeft                      ;A8B95F;
    STA.W EnemyData.work2,X                                              ;A8B962;
    RTS                                                                  ;A8B965;


Function_Beetom_StartDrainingSamus_FacingRight:
    LDX.W $0E54                                                          ;A8B966;
    LDA.W #InstList_Beetom_DrainingSamus_FacingRight_0                   ;A8B969;
    STA.L $7E7800,X                                                      ;A8B96C;
    JSR.W SetBeetomInstList                                              ;A8B970;
    LDA.W #Function_Beetom_DrainingSamus_FacingRight                     ;A8B973;
    STA.W EnemyData.work2,X                                              ;A8B976;
    RTS                                                                  ;A8B979;


Function_Beetom_StartDropping:
    LDX.W $0E54                                                          ;A8B97A;
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0                         ;A8B97D;
    STA.L $7E7800,X                                                      ;A8B980;
    LDA.L $7E7812,X                                                      ;A8B984;
    BEQ .keepLeft                                                        ;A8B988;
    LDA.W #InstList_Beetom_Crawling_FacingRight_0                        ;A8B98A;
    STA.L $7E7800,X                                                      ;A8B98D;

.keepLeft:
    JSR.W SetBeetomInstList                                              ;A8B991;
    LDA.W #$0000                                                         ;A8B994;
    STA.L $7E780A,X                                                      ;A8B997;
    LDA.W #Function_Beetom_Dropping                                      ;A8B99B;
    STA.W EnemyData.work2,X                                              ;A8B99E;
    RTS                                                                  ;A8B9A1;


Function_Beetom_StartBeingFlung:
    LDX.W $0E54                                                          ;A8B9A2;
    LDA.W #$0000                                                         ;A8B9A5;
    STA.W EnemyData.work1,X                                              ;A8B9A8;
    LDA.W #Function_Beetom_BeingFlung                                    ;A8B9AB;
    STA.W EnemyData.work2,X                                              ;A8B9AE;
    RTS                                                                  ;A8B9B1;


Function_Beetom_Idling:
    LDX.W $0E54                                                          ;A8B9B2;
    DEC.W EnemyData.work3,X                                              ;A8B9B5;
    BPL .return                                                          ;A8B9B8;
    LDA.W #Function_Beetom_DecideAction                                  ;A8B9BA;
    STA.W EnemyData.work2,X                                              ;A8B9BD;

.return:
    RTS                                                                  ;A8B9C0;


Function_Beetom_CrawlingLeft:
    LDX.W $0E54                                                          ;A8B9C1;
    DEC.W EnemyData.work3,X                                              ;A8B9C4;
    BMI .end                                                             ;A8B9C7;
    LDA.W EnemyData.xPosition,X                                          ;A8B9C9;
    SEC                                                                  ;A8B9CC;
    SBC.W #$0008                                                         ;A8B9CD;
    STA.W EnemyData.xPosition,X                                          ;A8B9D0;
    LDA.W #$0001                                                         ;A8B9D3;
    STA.B $14                                                            ;A8B9D6;
    STZ.B $12                                                            ;A8B9D8;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8B9DA;
    BCS .collidedWithBlock                                               ;A8B9DE;
    LDA.W #Function_Beetom_StartCrawlingRight                            ;A8B9E0;
    STA.W EnemyData.work2,X                                              ;A8B9E3;
    DEC.W EnemyData.yPosition,X                                          ;A8B9E6;
    LDA.W EnemyData.xPosition,X                                          ;A8B9E9;
    CLC                                                                  ;A8B9EC;
    ADC.W #$0008                                                         ;A8B9ED;
    STA.W EnemyData.xPosition,X                                          ;A8B9F0;
    BRA .return                                                          ;A8B9F3;


.collidedWithBlock:
    LDA.W EnemyData.xPosition,X                                          ;A8B9F5;
    CLC                                                                  ;A8B9F8;
    ADC.W #$0008                                                         ;A8B9F9;
    STA.W EnemyData.xPosition,X                                          ;A8B9FC;
    LDA.W #$C000                                                         ;A8B9FF;
    STA.B $12                                                            ;A8BA02;
    LDA.W #$FFFF                                                         ;A8BA04;
    STA.B $14                                                            ;A8BA07;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BA09;
    BCC .return                                                          ;A8BA0D;
    LDA.W #Function_Beetom_StartCrawlingRight                            ;A8BA0F;
    STA.W EnemyData.work2,X                                              ;A8BA12;
    BRA .return                                                          ;A8BA15;


.end:
    LDA.W #$0040                                                         ;A8BA17;
    STA.W EnemyData.work3,X                                              ;A8BA1A;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BA1D;
    STA.W EnemyData.work2,X                                              ;A8BA20;

.return:
    RTS                                                                  ;A8BA23;


Function_Beetom_CrawlingRight:
    LDX.W $0E54                                                          ;A8BA24;
    DEC.W EnemyData.work3,X                                              ;A8BA27;
    BMI .end                                                             ;A8BA2A;
    LDA.W EnemyData.xPosition,X                                          ;A8BA2C;
    CLC                                                                  ;A8BA2F;
    ADC.W #$0008                                                         ;A8BA30;
    STA.W EnemyData.xPosition,X                                          ;A8BA33;
    LDA.W #$0001                                                         ;A8BA36;
    STA.B $14                                                            ;A8BA39;
    STZ.B $12                                                            ;A8BA3B;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BA3D;
    BCS .collidedWithBlock                                               ;A8BA41;
    LDA.W #Function_Beetom_StartCrawlingLeft                             ;A8BA43;
    STA.W EnemyData.work2,X                                              ;A8BA46;
    DEC.W EnemyData.yPosition,X                                          ;A8BA49;
    LDA.W EnemyData.xPosition,X                                          ;A8BA4C;
    SEC                                                                  ;A8BA4F;
    SBC.W #$0008                                                         ;A8BA50;
    STA.W EnemyData.xPosition,X                                          ;A8BA53;
    BRA .return                                                          ;A8BA56;


.collidedWithBlock:
    LDA.W EnemyData.xPosition,X                                          ;A8BA58;
    SEC                                                                  ;A8BA5B;
    SBC.W #$0008                                                         ;A8BA5C;
    STA.W EnemyData.xPosition,X                                          ;A8BA5F;
    LDA.W #$4000                                                         ;A8BA62;
    STA.B $12                                                            ;A8BA65;
    STZ.B $14                                                            ;A8BA67;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BA69;
    BCC .return                                                          ;A8BA6D;
    LDA.W #Function_Beetom_StartCrawlingLeft                             ;A8BA6F;
    STA.W EnemyData.work2,X                                              ;A8BA72;
    BRA .return                                                          ;A8BA75;


.end:
    LDA.W #$0040                                                         ;A8BA77;
    STA.W EnemyData.work3,X                                              ;A8BA7A;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BA7D;
    STA.W EnemyData.work2,X                                              ;A8BA80;

.return:
    RTS                                                                  ;A8BA83;


Function_Beetom_ShortHopLeft:
    LDX.W $0E54                                                          ;A8BA84;
    LDA.L $7E780A,X                                                      ;A8BA87;
    BNE .falling                                                         ;A8BA8B;
    JSR.W Function_Beetom_YMovement_ShortHop_Rising                      ;A8BA8D;
    BRA +                                                                ;A8BA90;


.falling:
    JSR.W Function_Beetom_YMovement_ShortHop_Falling                     ;A8BA92;

  + LDA.W #$FFFF                                                         ;A8BA95;
    STA.B $14                                                            ;A8BA98;
    LDA.W #$C000                                                         ;A8BA9A;
    STA.B $12                                                            ;A8BA9D;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BA9F;
    BCC .return                                                          ;A8BAA3;
    LDA.L $7E7812,X                                                      ;A8BAA5;
    EOR.W #$0001                                                         ;A8BAA9;
    STA.L $7E7812,X                                                      ;A8BAAC;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BAB0;
    STA.W EnemyData.work2,X                                              ;A8BAB3;

.return:
    RTS                                                                  ;A8BAB6;


Function_Beetom_ShortHopRight:
    LDX.W $0E54                                                          ;A8BAB7;
    LDA.L $7E780A,X                                                      ;A8BABA;
    BNE .falling                                                         ;A8BABE;
    JSR.W Function_Beetom_YMovement_ShortHop_Rising                      ;A8BAC0;
    BRA +                                                                ;A8BAC3;


.falling:
    JSR.W Function_Beetom_YMovement_ShortHop_Falling                     ;A8BAC5;

  + STZ.B $14                                                            ;A8BAC8;
    LDA.W #$4000                                                         ;A8BACA;
    STA.B $12                                                            ;A8BACD;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BACF;
    BCC .return                                                          ;A8BAD3;
    LDA.L $7E7812,X                                                      ;A8BAD5;
    EOR.W #$0001                                                         ;A8BAD9;
    STA.L $7E7812,X                                                      ;A8BADC;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BAE0;
    STA.W EnemyData.work2,X                                              ;A8BAE3;

.return:
    RTS                                                                  ;A8BAE6;


Function_Beetom_YMovement_ShortHop_Rising:
    LDA.W EnemyData.work1,X                                              ;A8BAE7;
    ASL A                                                                ;A8BAEA;
    ASL A                                                                ;A8BAEB;
    ASL A                                                                ;A8BAEC;
    TAY                                                                  ;A8BAED;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A8BAEE;
    STA.B $14                                                            ;A8BAF1;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A8BAF3;
    STA.B $12                                                            ;A8BAF6;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BAF8;
    BCC .notCollidedWithBlock                                            ;A8BAFC;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BAFE;
    STA.W EnemyData.work2,X                                              ;A8BB01;
    BRA .return                                                          ;A8BB04;


.notCollidedWithBlock:
    LDA.W EnemyData.work1,X                                              ;A8BB06;
    SEC                                                                  ;A8BB09;
    SBC.W #$0004                                                         ;A8BB0A;
    STA.W EnemyData.work1,X                                              ;A8BB0D;
    BPL .return                                                          ;A8BB10;
    LDA.W #$0000                                                         ;A8BB12;
    STA.W EnemyData.work1,X                                              ;A8BB15;
    LDA.W #$0001                                                         ;A8BB18;
    STA.L $7E780A,X                                                      ;A8BB1B;

.return:
    RTS                                                                  ;A8BB1F;


Function_Beetom_YMovement_ShortHop_Falling:
    LDA.W EnemyData.work1,X                                              ;A8BB20;
    ASL A                                                                ;A8BB23;
    ASL A                                                                ;A8BB24;
    ASL A                                                                ;A8BB25;
    TAY                                                                  ;A8BB26;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8BB27;
    STA.B $14                                                            ;A8BB2A;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A8BB2C;
    STA.B $12                                                            ;A8BB2F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BB31;
    BCC .notCollidedWithBlock                                            ;A8BB35;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BB37;
    STA.W EnemyData.work2,X                                              ;A8BB3A;
    BRA .return                                                          ;A8BB3D;


.notCollidedWithBlock:
    LDA.W EnemyData.work1,X                                              ;A8BB3F;
    CLC                                                                  ;A8BB42;
    ADC.W #$0004                                                         ;A8BB43;
    STA.W EnemyData.work1,X                                              ;A8BB46;
    CMP.W #$0040                                                         ;A8BB49;
    BMI .return                                                          ;A8BB4C;
    LDA.W #$0040                                                         ;A8BB4E;
    STA.W EnemyData.work1,X                                              ;A8BB51;

.return:
    RTS                                                                  ;A8BB54;


Function_Beetom_LongHopLeft:
    LDX.W $0E54                                                          ;A8BB55;
    LDA.L $7E780A,X                                                      ;A8BB58;
    BNE .falling                                                         ;A8BB5C;
    JSR.W Function_Beetom_YMovement_LongHop_Rising                       ;A8BB5E;
    BRA +                                                                ;A8BB61;


.falling:
    JSR.W Function_Beetom_YMovement_LongHop_Falling                      ;A8BB63;

  + LDA.W #$FFFF                                                         ;A8BB66;
    STA.B $14                                                            ;A8BB69;
    LDA.W #$C000                                                         ;A8BB6B;
    STA.B $12                                                            ;A8BB6E;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BB70;
    BCC .return                                                          ;A8BB74;
    LDA.L $7E7812,X                                                      ;A8BB76;
    EOR.W #$0001                                                         ;A8BB7A;
    STA.L $7E7812,X                                                      ;A8BB7D;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BB81;
    STA.W EnemyData.work2,X                                              ;A8BB84;

.return:
    RTS                                                                  ;A8BB87;


Function_Beetom_LongHopRight:
    LDX.W $0E54                                                          ;A8BB88;
    LDA.L $7E780A,X                                                      ;A8BB8B;
    BNE .falling                                                         ;A8BB8F;
    JSR.W Function_Beetom_YMovement_LongHop_Rising                       ;A8BB91;
    BRA +                                                                ;A8BB94;


.falling:
    JSR.W Function_Beetom_YMovement_LongHop_Falling                      ;A8BB96;

  + STZ.B $14                                                            ;A8BB99;
    LDA.W #$4000                                                         ;A8BB9B;
    STA.B $12                                                            ;A8BB9E;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BBA0;
    BCC .return                                                          ;A8BBA4;
    LDA.L $7E7812,X                                                      ;A8BBA6;
    EOR.W #$0001                                                         ;A8BBAA;
    STA.L $7E7812,X                                                      ;A8BBAD;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BBB1;
    STA.W EnemyData.work2,X                                              ;A8BBB4;

.return:
    RTS                                                                  ;A8BBB7;


Function_Beetom_YMovement_LongHop_Rising:
    LDA.W EnemyData.work1,X                                              ;A8BBB8;
    ASL A                                                                ;A8BBBB;
    ASL A                                                                ;A8BBBC;
    ASL A                                                                ;A8BBBD;
    TAY                                                                  ;A8BBBE;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A8BBBF;
    STA.B $14                                                            ;A8BBC2;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A8BBC4;
    STA.B $12                                                            ;A8BBC7;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BBC9;
    BCC .notCollidedWithBlock                                            ;A8BBCD;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BBCF;
    STA.W EnemyData.work2,X                                              ;A8BBD2;
    BRA .return                                                          ;A8BBD5;


.notCollidedWithBlock:
    LDA.W EnemyData.work1,X                                              ;A8BBD7;
    SEC                                                                  ;A8BBDA;
    SBC.W #$0005                                                         ;A8BBDB;
    STA.W EnemyData.work1,X                                              ;A8BBDE;
    BPL .return                                                          ;A8BBE1;
    LDA.W #$0000                                                         ;A8BBE3;
    STA.W EnemyData.work1,X                                              ;A8BBE6;
    LDA.W #$0001                                                         ;A8BBE9;
    STA.L $7E780A,X                                                      ;A8BBEC;

.return:
    RTS                                                                  ;A8BBF0;


Function_Beetom_YMovement_LongHop_Falling:
    LDA.W EnemyData.work1,X                                              ;A8BBF1;
    ASL A                                                                ;A8BBF4;
    ASL A                                                                ;A8BBF5;
    ASL A                                                                ;A8BBF6;
    TAY                                                                  ;A8BBF7;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8BBF8;
    STA.B $14                                                            ;A8BBFB;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A8BBFD;
    STA.B $12                                                            ;A8BC00;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BC02;
    BCC .notCollidedWithBlock                                            ;A8BC06;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BC08;
    STA.W EnemyData.work2,X                                              ;A8BC0B;
    BRA .return                                                          ;A8BC0E;


.notCollidedWithBlock:
    LDA.W EnemyData.work1,X                                              ;A8BC10;
    CLC                                                                  ;A8BC13;
    ADC.W #$0005                                                         ;A8BC14;
    STA.W EnemyData.work1,X                                              ;A8BC17;
    CMP.W #$0040                                                         ;A8BC1A;
    BMI .return                                                          ;A8BC1D;
    LDA.W #$0040                                                         ;A8BC1F;
    STA.W EnemyData.work1,X                                              ;A8BC22;

.return:
    RTS                                                                  ;A8BC25;


Function_Beetom_LungeLeft:
    LDX.W $0E54                                                          ;A8BC26;
    LDA.L $7E780A,X                                                      ;A8BC29;
    BNE .falling                                                         ;A8BC2D;
    JSR.W Function_Beetom_YMovement_Lunge_Rising                         ;A8BC2F;
    BRA +                                                                ;A8BC32;


.falling:
    JSR.W Function_Beetom_YMovement_Lunge_Falling                        ;A8BC34;

  + LDA.W #$0003                                                         ;A8BC37;
    EOR.W #$FFFF                                                         ;A8BC3A;
    INC A                                                                ;A8BC3D;
    STA.B $14                                                            ;A8BC3E;
    STZ.B $12                                                            ;A8BC40;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BC42;
    BCC .return                                                          ;A8BC46;
    LDA.L $7E7812,X                                                      ;A8BC48;
    EOR.W #$0001                                                         ;A8BC4C;
    STA.L $7E7812,X                                                      ;A8BC4F;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BC53;
    STA.W EnemyData.work2,X                                              ;A8BC56;

.return:
    RTS                                                                  ;A8BC59;


Function_Beetom_LungeRight:
    LDX.W $0E54                                                          ;A8BC5A;
    LDA.L $7E780A,X                                                      ;A8BC5D;
    BNE .falling                                                         ;A8BC61;
    JSR.W Function_Beetom_YMovement_Lunge_Rising                         ;A8BC63;
    BRA +                                                                ;A8BC66;


.falling:
    JSR.W Function_Beetom_YMovement_Lunge_Falling                        ;A8BC68;

  + LDA.W #$0003                                                         ;A8BC6B;
    STA.B $14                                                            ;A8BC6E;
    STZ.B $12                                                            ;A8BC70;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BC72;
    BCC .return                                                          ;A8BC76;
    LDA.L $7E7812,X                                                      ;A8BC78;
    EOR.W #$0001                                                         ;A8BC7C;
    STA.L $7E7812,X                                                      ;A8BC7F;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BC83;
    STA.W EnemyData.work2,X                                              ;A8BC86;

.return:
    RTS                                                                  ;A8BC89;


Function_Beetom_YMovement_Lunge_Rising:
    LDA.W EnemyData.work1,X                                              ;A8BC8A;
    ASL A                                                                ;A8BC8D;
    ASL A                                                                ;A8BC8E;
    ASL A                                                                ;A8BC8F;
    TAY                                                                  ;A8BC90;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y                  ;A8BC91;
    STA.B $14                                                            ;A8BC94;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y                  ;A8BC96;
    STA.B $12                                                            ;A8BC99;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BC9B;
    BCC .notCollidedWithBlock                                            ;A8BC9F;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BCA1;
    STA.W EnemyData.work2,X                                              ;A8BCA4;
    BRA .return                                                          ;A8BCA7;


.notCollidedWithBlock:
    LDA.W EnemyData.work1,X                                              ;A8BCA9;
    SEC                                                                  ;A8BCAC;
    SBC.W #$0005                                                         ;A8BCAD;
    STA.W EnemyData.work1,X                                              ;A8BCB0;
    BPL .return                                                          ;A8BCB3;
    LDA.W #$0000                                                         ;A8BCB5;
    STA.W EnemyData.work1,X                                              ;A8BCB8;
    LDA.W #$0001                                                         ;A8BCBB;
    STA.L $7E780A,X                                                      ;A8BCBE;

.return:
    RTS                                                                  ;A8BCC2;


Function_Beetom_YMovement_Lunge_Falling:
    LDA.W EnemyData.work1,X                                              ;A8BCC3;
    ASL A                                                                ;A8BCC6;
    ASL A                                                                ;A8BCC7;
    ASL A                                                                ;A8BCC8;
    TAY                                                                  ;A8BCC9;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8BCCA;
    STA.B $14                                                            ;A8BCCD;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A8BCCF;
    STA.B $12                                                            ;A8BCD2;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BCD4;
    BCC .notCollidedWithBlock                                            ;A8BCD8;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BCDA;
    STA.W EnemyData.work2,X                                              ;A8BCDD;
    BRA .return                                                          ;A8BCE0;


.notCollidedWithBlock:
    LDA.W EnemyData.work1,X                                              ;A8BCE2;
    CLC                                                                  ;A8BCE5;
    ADC.W #$0003                                                         ;A8BCE6;
    STA.W EnemyData.work1,X                                              ;A8BCE9;
    CMP.W #$0040                                                         ;A8BCEC;
    BMI .return                                                          ;A8BCEF;
    LDA.W #$0040                                                         ;A8BCF1;
    STA.W EnemyData.work1,X                                              ;A8BCF4;

.return:
    RTS                                                                  ;A8BCF7;


Function_Beetom_DrainingSamus_FacingLeft:
    LDX.W $0E54                                                          ;A8BCF8;
    LDA.W EnemyData.work4,X                                              ;A8BCFB;
    BNE .attached                                                        ;A8BCFE;
    STZ.B $12                                                            ;A8BD00;
    LDA.W #$0010                                                         ;A8BD02;
    STA.B $14                                                            ;A8BD05;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BD07;
    BCC .notCollidedWithWall                                             ;A8BD0B;
    LDA.W #$0001                                                         ;A8BD0D;
    STA.L $7E7812,X                                                      ;A8BD10;
    STZ.B $12                                                            ;A8BD14;
    LDA.W #$FFE0                                                         ;A8BD16;
    STA.B $14                                                            ;A8BD19;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BD1B;

.notCollidedWithWall:
    LDA.W #$0000                                                         ;A8BD1F;
    STA.L $7E7810,X                                                      ;A8BD22;
    LDA.W #Function_Beetom_StartBeingFlung                               ;A8BD26;
    STA.W EnemyData.work2,X                                              ;A8BD29;
    BRA .return                                                          ;A8BD2C;


.attached:
    LDA.W $0AF6                                                          ;A8BD2E;
    STA.W EnemyData.xPosition,X                                          ;A8BD31;
    LDA.W $0AFA                                                          ;A8BD34;
    SEC                                                                  ;A8BD37;
    SBC.W #$0004                                                         ;A8BD38;
    STA.W EnemyData.yPosition,X                                          ;A8BD3B;
    JSR.W UpdateBeetomButtonCounter                                      ;A8BD3E;

.return:
    RTS                                                                  ;A8BD41;


Function_Beetom_DrainingSamus_FacingRight:
    LDX.W $0E54                                                          ;A8BD42;
    LDA.W EnemyData.work4,X                                              ;A8BD45;
    BNE .attached                                                        ;A8BD48;
    STZ.B $12                                                            ;A8BD4A;
    LDA.W #$FFF0                                                         ;A8BD4C;
    STA.B $14                                                            ;A8BD4F;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BD51;
    BCC .notCollidedWithWall                                             ;A8BD55;
    LDA.W #$0000                                                         ;A8BD57;
    STA.L $7E7812,X                                                      ;A8BD5A;
    STZ.B $12                                                            ;A8BD5E;
    LDA.W #$0020                                                         ;A8BD60;
    STA.B $14                                                            ;A8BD63;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BD65;

.notCollidedWithWall:
    LDA.W #$0000                                                         ;A8BD69;
    STA.L $7E7810,X                                                      ;A8BD6C;
    LDA.W #Function_Beetom_StartBeingFlung                               ;A8BD70;
    STA.W EnemyData.work2,X                                              ;A8BD73;
    BRA .return                                                          ;A8BD76;


.attached:
    LDA.W $0AF6                                                          ;A8BD78;
    STA.W EnemyData.xPosition,X                                          ;A8BD7B;
    LDA.W $0AFA                                                          ;A8BD7E;
    SEC                                                                  ;A8BD81;
    SBC.W #$0004                                                         ;A8BD82;
    STA.W EnemyData.yPosition,X                                          ;A8BD85;
    JSR.W UpdateBeetomButtonCounter                                      ;A8BD88;

.return:
    RTS                                                                  ;A8BD8B;


UpdateBeetomButtonCounter:
    LDX.W $0E54                                                          ;A8BD8C;
    LDA.B $8B                                                            ;A8BD8F;
    CMP.W EnemyData.work5,X                                              ;A8BD91;
    BEQ .return                                                          ;A8BD94;
    STA.W EnemyData.work5,X                                              ;A8BD96;
    DEC.W EnemyData.work4,X                                              ;A8BD99;

.return:
    RTS                                                                  ;A8BD9C;


Function_Beetom_Dropping:
    LDX.W $0E54                                                          ;A8BD9D;
    LDA.W #$0003                                                         ;A8BDA0;
    STA.B $14                                                            ;A8BDA3;
    LDA.W #$0000                                                         ;A8BDA5;
    STA.B $12                                                            ;A8BDA8;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BDAA;
    BCC .return                                                          ;A8BDAE;
    LDA.L $7E7812,X                                                      ;A8BDB0;
    BNE .keepLeft                                                        ;A8BDB4;
    LDA.W #Function_Beetom_StartCrawlingLeft                             ;A8BDB6;
    STA.W EnemyData.work2,X                                              ;A8BDB9;
    BRA .return                                                          ;A8BDBC;


.keepLeft:
    LDA.W #Function_Beetom_StartCrawlingRight                            ;A8BDBE;
    STA.W EnemyData.work2,X                                              ;A8BDC1;

.return:
    RTS                                                                  ;A8BDC4;


Function_Beetom_BeingFlung:
    LDX.W $0E54                                                          ;A8BDC5;
    JSR.W Function_Beetom_Movement_BeingFlung                            ;A8BDC8;
    RTS                                                                  ;A8BDCB;


Function_Beetom_Movement_BeingFlung:
    LDA.W EnemyData.work1,X                                              ;A8BDCC;
    ASL A                                                                ;A8BDCF;
    ASL A                                                                ;A8BDD0;
    ASL A                                                                ;A8BDD1;
    TAY                                                                  ;A8BDD2;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y                  ;A8BDD3;
    STA.B $14                                                            ;A8BDD6;
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y                    ;A8BDD8;
    STA.B $12                                                            ;A8BDDB;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8BDDD;
    BCC .notCollidedWithBlock                                            ;A8BDE1;
    LDA.W #Function_Beetom_DecideAction                                  ;A8BDE3;
    STA.W EnemyData.work2,X                                              ;A8BDE6;
    BRA +                                                                ;A8BDE9;


.notCollidedWithBlock:
    LDA.W EnemyData.work1,X                                              ;A8BDEB;
    CLC                                                                  ;A8BDEE;
    ADC.W #$0001                                                         ;A8BDEF;
    STA.W EnemyData.work1,X                                              ;A8BDF2;
    CMP.W #$0040                                                         ;A8BDF5;
    BMI +                                                                ;A8BDF8;
    LDA.W #$0040                                                         ;A8BDFA;
    STA.W EnemyData.work1,X                                              ;A8BDFD;

  + LDA.L $7E7812,X                                                      ;A8BE00;
    BNE .right                                                           ;A8BE04;
    LDA.W #$0002                                                         ;A8BE06;
    BRA +                                                                ;A8BE09;


.right:
    LDA.W #$0002                                                         ;A8BE0B;
    EOR.W #$FFFF                                                         ;A8BE0E;
    INC A                                                                ;A8BE11;

  + STA.B $14                                                            ;A8BE12;
    STZ.B $12                                                            ;A8BE14;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8BE16;
    BCC .return                                                          ;A8BE1A;
    LDA.L $7E7812,X                                                      ;A8BE1C;
    EOR.W #$0001                                                         ;A8BE20;
    STA.L $7E7812,X                                                      ;A8BE23;
    LDA.W #Function_Beetom_StartDropping                                 ;A8BE27;
    STA.W EnemyData.work2,X                                              ;A8BE2A;

.return:
    RTS                                                                  ;A8BE2D;


EnemyTouch_Beetom:
    LDX.W $0E54                                                          ;A8BE2E;
    LDA.L $7E7810,X                                                      ;A8BE31;
    BNE .attached                                                        ;A8BE35;
    LDA.L $7E7812,X                                                      ;A8BE37;
    BNE .right                                                           ;A8BE3B;
    LDA.W #Function_Beetom_StartDrainingSamus_FacingLeft                 ;A8BE3D;
    STA.W EnemyData.work2,X                                              ;A8BE40;
    BRA +                                                                ;A8BE43;


.right:
    LDA.W #Function_Beetom_StartDrainingSamus_FacingRight                ;A8BE45;
    STA.W EnemyData.work2,X                                              ;A8BE48;

  + LDA.W #$0001                                                         ;A8BE4B;
    STA.L $7E7810,X                                                      ;A8BE4E;
    LDA.W #$0040                                                         ;A8BE52;
    STA.W EnemyData.work4,X                                              ;A8BE55;
    LDA.W #$0002                                                         ;A8BE58;
    STA.W EnemyData.layer,X                                              ;A8BE5B;
    LDA.W $0AF6                                                          ;A8BE5E;
    SEC                                                                  ;A8BE61;
    SBC.W EnemyData.xPosition,X                                          ;A8BE62;
    STA.L $7E780C,X                                                      ;A8BE65;
    LDA.W $0AFA                                                          ;A8BE69;
    SEC                                                                  ;A8BE6C;
    SBC.W EnemyData.yPosition,X                                          ;A8BE6D;
    STA.L $7E780E,X                                                      ;A8BE70;

.attached:
    LDA.W $0A6E                                                          ;A8BE74;
    BNE .damage                                                          ;A8BE77;
    LDA.W $0E44                                                          ;A8BE79;
    AND.W #$0007                                                         ;A8BE7C;
    CMP.W #$0007                                                         ;A8BE7F;
    BNE +                                                                ;A8BE82;
    LDA.W $09C2                                                          ;A8BE84;
    CMP.W #$001E                                                         ;A8BE87;
    BMI +                                                                ;A8BE8A;
    LDA.W #$002D                                                         ;A8BE8C;
    JSL.L QueueSound_Lib3_Max6                                           ;A8BE8F;

  + LDA.W EnemyData.frameCounter,X                                       ;A8BE93;
    AND.W #$003F                                                         ;A8BE96;
    CMP.W #$003F                                                         ;A8BE99;
    BNE .return                                                          ;A8BE9C;

.damage:
    JSL.L CommonA8_NormalEnemyTouchAI                                    ;A8BE9E;
    LDA.W #$0000                                                         ;A8BEA2;
    STA.W $18A8                                                          ;A8BEA5;
    STA.W $18AA                                                          ;A8BEA8;

.return:
    RTL                                                                  ;A8BEAB;


EnemyShot_Beetom:
    JSL.L CommonA8_NormalEnemyShotAI                                     ;A8BEAC;
    LDX.W $0E54                                                          ;A8BEB0;
    LDA.W EnemyData.freezeTimer,X                                        ;A8BEB3;
    BEQ .return                                                          ;A8BEB6;
    LDA.W EnemyData.work2,X                                              ;A8BEB8;
    CMP.W #Function_Beetom_DrainingSamus_FacingRight                     ;A8BEBB;
    BEQ .startDropping                                                   ;A8BEBE;
    CMP.W #Function_Beetom_DrainingSamus_FacingLeft                      ;A8BEC0;
    BNE .return                                                          ;A8BEC3;

.startDropping:
    LDA.W #Function_Beetom_StartDropping                                 ;A8BEC5;
    STA.W EnemyData.work2,X                                              ;A8BEC8;

.return:
    LDA.W #$0000                                                         ;A8BECB;
    STA.L $7E7810,X                                                      ;A8BECE;
    RTL                                                                  ;A8BED2;


Spritemap_Beetom_0:
    dw $0005,$0000                                                       ;A8BED3;
    db $FE                                                               ;A8BED7;
    dw $211E,$0000                                                       ;A8BED8;
    db $F6                                                               ;A8BEDC;
    dw $210E,$0005                                                       ;A8BEDD;
    db $00                                                               ;A8BEE1;
    dw $211F,$0005                                                       ;A8BEE2;
    db $F8                                                               ;A8BEE6;
    dw $210F,$81F8                                                       ;A8BEE7;
    db $F8                                                               ;A8BEEB;
    dw $2100                                                             ;A8BEEC;

Spritemap_Beetom_1:
    dw $0005,$0000                                                       ;A8BEEE;
    db $FF                                                               ;A8BEF2;
    dw $211E,$0000                                                       ;A8BEF3;
    db $F7                                                               ;A8BEF7;
    dw $210E,$0006                                                       ;A8BEF8;
    db $00                                                               ;A8BEFC;
    dw $211F,$0005                                                       ;A8BEFD;
    db $F9                                                               ;A8BF01;
    dw $210F,$81F8                                                       ;A8BF02;
    db $F8                                                               ;A8BF06;
    dw $2102                                                             ;A8BF07;

Spritemap_Beetom_2:
    dw $0005,$0000                                                       ;A8BF09;
    db $00                                                               ;A8BF0D;
    dw $211E,$0001                                                       ;A8BF0E;
    db $F8                                                               ;A8BF12;
    dw $210E,$0007                                                       ;A8BF13;
    db $00                                                               ;A8BF17;
    dw $211F,$0006                                                       ;A8BF18;
    db $FA                                                               ;A8BF1C;
    dw $210F,$81F8                                                       ;A8BF1D;
    db $F8                                                               ;A8BF21;
    dw $2104                                                             ;A8BF22;

Spritemap_Beetom_3:
    dw $0005,$0007                                                       ;A8BF24;
    db $FE                                                               ;A8BF28;
    dw $A10D,$01FF                                                       ;A8BF29;
    db $FE                                                               ;A8BF2D;
    dw $A10C,$000C                                                       ;A8BF2E;
    db $FF                                                               ;A8BF32;
    dw $210F,$000D                                                       ;A8BF33;
    db $07                                                               ;A8BF37;
    dw $211F,$81F8                                                       ;A8BF38;
    db $F8                                                               ;A8BF3C;
    dw $2100                                                             ;A8BF3D;

Spritemap_Beetom_4:
    dw $0005,$000E                                                       ;A8BF3F;
    db $0F                                                               ;A8BF43;
    dw $211F,$000C                                                       ;A8BF44;
    db $07                                                               ;A8BF48;
    dw $210F,$0008                                                       ;A8BF49;
    db $02                                                               ;A8BF4D;
    dw $210D,$0000                                                       ;A8BF4E;
    db $02                                                               ;A8BF52;
    dw $210C,$81F8                                                       ;A8BF53;
    db $F8                                                               ;A8BF57;
    dw $2100                                                             ;A8BF58;

Spritemap_Beetom_5:
    dw $0005,$0002                                                       ;A8BF5A;
    db $00                                                               ;A8BF5E;
    dw $210D,$01FA                                                       ;A8BF5F;
    db $00                                                               ;A8BF63;
    dw $210C,$0000                                                       ;A8BF64;
    db $05                                                               ;A8BF68;
    dw $211D,$01F8                                                       ;A8BF69;
    db $05                                                               ;A8BF6D;
    dw $211C,$81F8                                                       ;A8BF6E;
    db $F8                                                               ;A8BF72;
    dw $2106                                                             ;A8BF73;

Spritemap_Beetom_6:
    dw $0005,$0001                                                       ;A8BF75;
    db $00                                                               ;A8BF79;
    dw $210D,$01F9                                                       ;A8BF7A;
    db $00                                                               ;A8BF7E;
    dw $210C,$01FF                                                       ;A8BF7F;
    db $05                                                               ;A8BF83;
    dw $211D,$01F8                                                       ;A8BF84;
    db $05                                                               ;A8BF88;
    dw $211C,$81F8                                                       ;A8BF89;
    db $F8                                                               ;A8BF8D;
    dw $2108                                                             ;A8BF8E;

Spritemap_Beetom_7:
    dw $0005,$0000                                                       ;A8BF90;
    db $00                                                               ;A8BF94;
    dw $210D,$01F8                                                       ;A8BF95;
    db $00                                                               ;A8BF99;
    dw $210C,$01FE                                                       ;A8BF9A;
    db $05                                                               ;A8BF9E;
    dw $211D,$01F8                                                       ;A8BF9F;
    db $05                                                               ;A8BFA3;
    dw $211C,$81F8                                                       ;A8BFA4;
    db $F8                                                               ;A8BFA8;
    dw $210A                                                             ;A8BFA9;

Spritemap_Beetom_8:
    dw $0006,$01FA                                                       ;A8BFAB;
    db $F8                                                               ;A8BFAF;
    dw $2120,$0002                                                       ;A8BFB0;
    db $00                                                               ;A8BFB4;
    dw $210D,$01FA                                                       ;A8BFB5;
    db $00                                                               ;A8BFB9;
    dw $210C,$0000                                                       ;A8BFBA;
    db $05                                                               ;A8BFBE;
    dw $211D,$01F8                                                       ;A8BFBF;
    db $05                                                               ;A8BFC3;
    dw $211C,$81F8                                                       ;A8BFC4;
    db $F8                                                               ;A8BFC8;
    dw $2106                                                             ;A8BFC9;

Spritemap_Beetom_9:
    dw $0006,$01FA                                                       ;A8BFCB;
    db $F8                                                               ;A8BFCF;
    dw $2121,$0001                                                       ;A8BFD0;
    db $00                                                               ;A8BFD4;
    dw $210D,$01F9                                                       ;A8BFD5;
    db $00                                                               ;A8BFD9;
    dw $210C,$01FF                                                       ;A8BFDA;
    db $05                                                               ;A8BFDE;
    dw $211D,$01F8                                                       ;A8BFDF;
    db $05                                                               ;A8BFE3;
    dw $211C,$81F8                                                       ;A8BFE4;
    db $F8                                                               ;A8BFE8;
    dw $2108                                                             ;A8BFE9;

Spritemap_Beetom_A:
    dw $0006,$01FA                                                       ;A8BFEB;
    db $F8                                                               ;A8BFEF;
    dw $2122,$0000                                                       ;A8BFF0;
    db $00                                                               ;A8BFF4;
    dw $210D,$01F8                                                       ;A8BFF5;
    db $00                                                               ;A8BFF9;
    dw $210C,$01FE                                                       ;A8BFFA;
    db $05                                                               ;A8BFFE;
    dw $211D,$01F8                                                       ;A8BFFF;
    db $05                                                               ;A8C003;
    dw $211C,$81F8                                                       ;A8C004;
    db $F8                                                               ;A8C008;
    dw $210A                                                             ;A8C009;

Spritemap_Beetom_B:
    dw $0005,$01F8                                                       ;A8C00B;
    db $FE                                                               ;A8C00F;
    dw $611E,$01F8                                                       ;A8C010;
    db $F6                                                               ;A8C014;
    dw $610E,$01F3                                                       ;A8C015;
    db $00                                                               ;A8C019;
    dw $611F,$01F3                                                       ;A8C01A;
    db $F8                                                               ;A8C01E;
    dw $610F,$81F8                                                       ;A8C01F;
    db $F8                                                               ;A8C023;
    dw $6100                                                             ;A8C024;

Spritemap_Beetom_C:
    dw $0005,$01F8                                                       ;A8C026;
    db $FF                                                               ;A8C02A;
    dw $611E,$01F8                                                       ;A8C02B;
    db $F7                                                               ;A8C02F;
    dw $610E,$01F2                                                       ;A8C030;
    db $00                                                               ;A8C034;
    dw $611F,$01F3                                                       ;A8C035;
    db $F9                                                               ;A8C039;
    dw $610F,$81F8                                                       ;A8C03A;
    db $F8                                                               ;A8C03E;
    dw $6102                                                             ;A8C03F;

Spritemap_Beetom_D:
    dw $0005,$01F8                                                       ;A8C041;
    db $00                                                               ;A8C045;
    dw $611E,$01F7                                                       ;A8C046;
    db $F8                                                               ;A8C04A;
    dw $610E,$01F1                                                       ;A8C04B;
    db $00                                                               ;A8C04F;
    dw $611F,$01F2                                                       ;A8C050;
    db $FA                                                               ;A8C054;
    dw $610F,$81F8                                                       ;A8C055;
    db $F8                                                               ;A8C059;
    dw $6104                                                             ;A8C05A;

Spritemap_Beetom_E:
    dw $0005,$01F1                                                       ;A8C05C;
    db $FE                                                               ;A8C060;
    dw $E10D,$01F9                                                       ;A8C061;
    db $FE                                                               ;A8C065;
    dw $E10C,$01EC                                                       ;A8C066;
    db $FF                                                               ;A8C06A;
    dw $610F,$01EB                                                       ;A8C06B;
    db $07                                                               ;A8C06F;
    dw $611F,$81F8                                                       ;A8C070;
    db $F8                                                               ;A8C074;
    dw $6100                                                             ;A8C075;

Spritemap_Beetom_F:
    dw $0005,$01EA                                                       ;A8C077;
    db $0F                                                               ;A8C07B;
    dw $611F,$01EC                                                       ;A8C07C;
    db $07                                                               ;A8C080;
    dw $610F,$01F0                                                       ;A8C081;
    db $02                                                               ;A8C085;
    dw $610D,$01F8                                                       ;A8C086;
    db $02                                                               ;A8C08A;
    dw $610C,$81F8                                                       ;A8C08B;
    db $F8                                                               ;A8C08F;
    dw $6100                                                             ;A8C090;

Spritemap_Beetom_10:
    dw $0005,$01F6                                                       ;A8C092;
    db $00                                                               ;A8C096;
    dw $610D,$01FE                                                       ;A8C097;
    db $00                                                               ;A8C09B;
    dw $610C,$01F8                                                       ;A8C09C;
    db $05                                                               ;A8C0A0;
    dw $611D,$0000                                                       ;A8C0A1;
    db $05                                                               ;A8C0A5;
    dw $611C,$81F8                                                       ;A8C0A6;
    db $F8                                                               ;A8C0AA;
    dw $6106                                                             ;A8C0AB;

Spritemap_Beetom_11:
    dw $0005,$01F7                                                       ;A8C0AD;
    db $00                                                               ;A8C0B1;
    dw $610D,$01FF                                                       ;A8C0B2;
    db $00                                                               ;A8C0B6;
    dw $610C,$01F9                                                       ;A8C0B7;
    db $05                                                               ;A8C0BB;
    dw $611D,$0000                                                       ;A8C0BC;
    db $05                                                               ;A8C0C0;
    dw $611C,$81F8                                                       ;A8C0C1;
    db $F8                                                               ;A8C0C5;
    dw $6108                                                             ;A8C0C6;

Spritemap_Beetom_12:
    dw $0005,$01F8                                                       ;A8C0C8;
    db $00                                                               ;A8C0CC;
    dw $610D,$0000                                                       ;A8C0CD;
    db $00                                                               ;A8C0D1;
    dw $610C,$01FA                                                       ;A8C0D2;
    db $05                                                               ;A8C0D6;
    dw $611D,$0000                                                       ;A8C0D7;
    db $05                                                               ;A8C0DB;
    dw $611C,$81F8                                                       ;A8C0DC;
    db $F8                                                               ;A8C0E0;
    dw $610A                                                             ;A8C0E1;

Spritemap_Beetom_13:
    dw $0006,$01FE                                                       ;A8C0E3;
    db $F8                                                               ;A8C0E7;
    dw $6120,$01F6                                                       ;A8C0E8;
    db $00                                                               ;A8C0EC;
    dw $610D,$01FE                                                       ;A8C0ED;
    db $00                                                               ;A8C0F1;
    dw $610C,$01F8                                                       ;A8C0F2;
    db $05                                                               ;A8C0F6;
    dw $611D,$0000                                                       ;A8C0F7;
    db $05                                                               ;A8C0FB;
    dw $611C,$81F8                                                       ;A8C0FC;
    db $F8                                                               ;A8C100;
    dw $6106                                                             ;A8C101;

Spritemap_Beetom_14:
    dw $0006,$01FE                                                       ;A8C103;
    db $F8                                                               ;A8C107;
    dw $6121,$01F7                                                       ;A8C108;
    db $00                                                               ;A8C10C;
    dw $610D,$01FF                                                       ;A8C10D;
    db $00                                                               ;A8C111;
    dw $610C,$01F9                                                       ;A8C112;
    db $05                                                               ;A8C116;
    dw $611D,$0000                                                       ;A8C117;
    db $05                                                               ;A8C11B;
    dw $611C,$81F8                                                       ;A8C11C;
    db $F8                                                               ;A8C120;
    dw $6108                                                             ;A8C121;

Spritemap_Beetom_15:
    dw $0006,$01FE                                                       ;A8C123;
    db $F8                                                               ;A8C127;
    dw $6122,$01F8                                                       ;A8C128;
    db $00                                                               ;A8C12C;
    dw $610D,$0000                                                       ;A8C12D;
    db $00                                                               ;A8C131;
    dw $610C,$01FA                                                       ;A8C132;
    db $05                                                               ;A8C136;
    dw $611D,$0000                                                       ;A8C137;
    db $05                                                               ;A8C13B;
    dw $611C,$81F8                                                       ;A8C13C;
    db $F8                                                               ;A8C140;
    dw $610A                                                             ;A8C141;

Palette_Powamp:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A8C143;
    dw $1DCE,$02FF,$01BF,$000F,$0008,$03FF,$0237,$00D1                   ;A8C153;

InstList_Powamp_Body_FastAnimation:
    dw $0005                                                             ;A8C163;
    dw Spritemap_Powamp_Body_CheeksLowered                               ;A8C165;
    dw $0005                                                             ;A8C167;
    dw Spritemap_Powamp_Body_CheeksLifting                               ;A8C169;
    dw $0005                                                             ;A8C16B;
    dw Spritemap_Powamp_Body_CheeksRaised                                ;A8C16D;
    dw Instruction_Common_GotoY                                          ;A8C16F;
    dw InstList_Powamp_Body_FastAnimation                                ;A8C171;

InstList_Powamp_Body_SlowAnimation:
    dw $0009                                                             ;A8C173;
    dw Spritemap_Powamp_Body_CheeksLowered                               ;A8C175;
    dw $0009                                                             ;A8C177;
    dw Spritemap_Powamp_Body_CheeksLifting                               ;A8C179;
    dw $0009                                                             ;A8C17B;
    dw Spritemap_Powamp_Body_CheeksRaised                                ;A8C17D;
    dw Instruction_Common_GotoY                                          ;A8C17F;
    dw InstList_Powamp_Body_SlowAnimation                                ;A8C181;

InstList_Powamp_Balloon_StartingToRise:
    dw $0001                                                             ;A8C183;
    dw Spritemap_Powamp_Balloon_Deflated                                 ;A8C185;

InstList_Powamp_Balloon_Inflating:
    dw $0006                                                             ;A8C187;
    dw Spritemap_Powamp_Balloon_Inflating                                ;A8C189;

InstList_Powamp_Balloon_Inflated:
    dw $00A0                                                             ;A8C18B;
    dw Spritemap_Powamp_Balloon_FullyInflated                            ;A8C18D;
    dw Instruction_Common_Sleep                                          ;A8C18F;

InstList_Powamp_Balloon_StartSinking:
    dw $0001                                                             ;A8C191;
    dw Spritemap_Powamp_Balloon_FullyInflated                            ;A8C193;
    dw $0006                                                             ;A8C195;
    dw Spritemap_Powamp_Balloon_Inflating                                ;A8C197;

InstList_Powamp_Balloon_Deflated:
    dw $00A0                                                             ;A8C199;
    dw Spritemap_Powamp_Balloon_Deflated                                 ;A8C19B;
    dw Instruction_Common_Sleep                                          ;A8C19D;

PowampTravelDistanceWhenNotGrappled:
    dw $0040                                                             ;A8C19F;

PowampWiggleTable:
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

InitAI_Powamp:
    LDX.W $0E54                                                          ;A8C1C9;
    LDA.W EnemyData.properties,X                                         ;A8C1CC;
    ORA.W #$2000                                                         ;A8C1CF;
    STA.W EnemyData.properties,X                                         ;A8C1D2;
    LDA.W #Spritemap_CommonA8_Nothing                                    ;A8C1D5;
    STA.W EnemyData.pSpritemap,X                                         ;A8C1D8;
    LDA.W #$0001                                                         ;A8C1DB;
    STA.W EnemyData.instTimer,X                                          ;A8C1DE;
    STZ.W EnemyData.loopCounter,X                                        ;A8C1E1;
    LDA.W EnemyData.initParam0,X                                         ;A8C1E4;
    BNE .balloon                                                         ;A8C1E7;
    LDA.W #$003C                                                         ;A8C1E9;
    STA.W EnemyData.work4,X                                              ;A8C1EC;
    LDA.W #Function_Powamp_Deflated_Resting                              ;A8C1EF;
    STA.W EnemyData.work5,X                                              ;A8C1F2;
    LDA.W #InstList_Powamp_Body_SlowAnimation                            ;A8C1F5;
    STA.W EnemyData.pInstList,X                                          ;A8C1F8;
    BRA .return                                                          ;A8C1FB;


.balloon:
    LDA.W EnemyData.xPosition,X                                          ;A8C1FD;
    STA.W EnemyData.work0,X                                              ;A8C200;
    LDA.W EnemyData.yPosition,X                                          ;A8C203;
    STA.W EnemyData.work1,X                                              ;A8C206;
    LDA.W #RTL_A8C568                                                    ;A8C209;
    STA.W EnemyData.work5,X                                              ;A8C20C;
    LDA.W #InstList_Powamp_Balloon_Deflated                              ;A8C20F;
    STA.W EnemyData.pInstList,X                                          ;A8C212;
    LDA.W EnemyData.initParam1,X                                         ;A8C215;
    STA.W EnemyData.work3,X                                              ;A8C218;

.return:
    RTL                                                                  ;A8C21B;


MainAI_Powamp:
    LDX.W $0E54                                                          ;A8C21C;
    JMP.W ($0FB2,X)                                                      ;A8C21F;


RTL_A8C222:
    RTL                                                                  ;A8C222;


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


HandlePowampBalloonYOffset:
    LDA.W $0F52,X                                                        ;A8C234;
    CMP.W #InstList_Powamp_Balloon_StartSinking                          ;A8C237;
    BPL .sinking                                                         ;A8C23A;
    SEC                                                                  ;A8C23C;
    SBC.W #$0004                                                         ;A8C23D;
    SEC                                                                  ;A8C240;
    SBC.W #InstList_Powamp_Balloon_StartingToRise                        ;A8C241;
    LSR A                                                                ;A8C244;
    CMP.W #$0006                                                         ;A8C245;
    BMI +                                                                ;A8C248;
    LDA.W #$0000                                                         ;A8C24A;

  + TAY                                                                  ;A8C24D;
    LDA.W EnemyData.yPosition,X                                          ;A8C24E;
    CLC                                                                  ;A8C251;
    ADC.W .risingYOffsets,Y                                              ;A8C252;
    STA.W $0F3E,X                                                        ;A8C255;
    BRA .return                                                          ;A8C258;


.sinking:
    SEC                                                                  ;A8C25A;
    SBC.W #$0004                                                         ;A8C25B;
    SEC                                                                  ;A8C25E;
    SBC.W #InstList_Powamp_Balloon_StartSinking                          ;A8C25F;
    LSR A                                                                ;A8C262;
    CMP.W #$0006                                                         ;A8C263;
    BMI +                                                                ;A8C266;
    LDA.W #$0000                                                         ;A8C268;

  + TAY                                                                  ;A8C26B;
    LDA.W EnemyData.yPosition,X                                          ;A8C26C;
    CLC                                                                  ;A8C26F;
    ADC.W .sinkingYOffsets,Y                                             ;A8C270;
    STA.W $0F3E,X                                                        ;A8C273;

.return:
    RTS                                                                  ;A8C276;


.risingYOffsets:
    dw $FFF4,$FFF0,$FFEC                                                 ;A8C277;

.sinkingYOffsets:
    dw $FFEC,$FFF0,$FFF4                                                 ;A8C27D;

Function_Powamp_Deflated_Resting:
    DEC.W EnemyData.work4,X                                              ;A8C283;
    BEQ .timerExpired                                                    ;A8C286;
    BPL .done                                                            ;A8C288;

.timerExpired:
    LDA.W #$0001                                                         ;A8C28A;
    STA.W $0F54,X                                                        ;A8C28D;
    LDA.W #InstList_Powamp_Balloon_StartingToRise                        ;A8C290;
    STA.W $0F52,X                                                        ;A8C293;
    LDA.W #Function_Powamp_Inflating                                     ;A8C296;
    STA.W EnemyData.work5,X                                              ;A8C299;
    LDA.W #$000A                                                         ;A8C29C;
    STA.W EnemyData.work4,X                                              ;A8C29F;

.done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C2A2;
    RTL                                                                  ;A8C2A5;


Function_Powamp_Inflating:
    DEC.W EnemyData.work4,X                                              ;A8C2A6;
    BEQ .timerExpired                                                    ;A8C2A9;
    BPL .done                                                            ;A8C2AB;

.timerExpired:
    LDA.W #Function_Powamp_Inflated_RiseToTargetHeight                   ;A8C2AD;
    STA.W EnemyData.work5,X                                              ;A8C2B0;
    LDA.W Powamp_InitialYVelocity_Rising                                 ;A8C2B3;
    STA.W EnemyData.work0,X                                              ;A8C2B6;
    LDA.W Powamp_InitialYVelocity_Rising+2                               ;A8C2B9;
    STA.W EnemyData.work1,X                                              ;A8C2BC;
    LDA.W #$0001                                                         ;A8C2BF;
    STA.W EnemyData.instTimer,X                                          ;A8C2C2;
    LDA.W #InstList_Powamp_Body_FastAnimation                            ;A8C2C5;
    STA.W EnemyData.pInstList,X                                          ;A8C2C8;

.done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C2CB;
    RTL                                                                  ;A8C2CE;


Function_Powamp_Inflated_RiseToTargetHeight:
    LDA.W EnemyData.ai,X                                                 ;A8C2CF;
    BIT.W #$0001                                                         ;A8C2D2;
    BEQ .notGrappleAI                                                    ;A8C2D5;
    LDA.W #Function_Powamp_Grappled_RiseToTargetHeight                   ;A8C2D7;
    STA.W EnemyData.work5,X                                              ;A8C2DA;
    JMP.W Function_Powamp_Grappled_RiseToTargetHeight                    ;A8C2DD;


.notGrappleAI:
    DEC.W EnemyData.work3,X                                              ;A8C2E0;
    BEQ .negativeTimer                                                   ;A8C2E3;
    BPL .timerNotExpired                                                 ;A8C2E5;

.negativeTimer:
    LDA.W #$0005                                                         ;A8C2E7;
    STA.W EnemyData.work3,X                                              ;A8C2EA;
    LDA.W EnemyData.work2,X                                              ;A8C2ED;
    ASL A                                                                ;A8C2F0;
    TAY                                                                  ;A8C2F1;
    LDA.W $0F68,X                                                        ;A8C2F2;
    CLC                                                                  ;A8C2F5;
    ADC.W PowampWiggleTable,Y                                            ;A8C2F6;
    STA.W $0F3A,X                                                        ;A8C2F9;
    STA.W EnemyData.xPosition,X                                          ;A8C2FC;
    LDA.W EnemyData.work2,X                                              ;A8C2FF;
    INC A                                                                ;A8C302;
    CMP.W #$000C                                                         ;A8C303;
    BMI .storeIndex                                                      ;A8C306;
    LDA.W #$0000                                                         ;A8C308;

.storeIndex:
    STA.W EnemyData.work2,X                                              ;A8C30B;

.timerNotExpired:
    LDA.W EnemyData.work1,X                                              ;A8C30E;
    CLC                                                                  ;A8C311;
    ADC.W Powamp_YAccel_Rising+2                                         ;A8C312;
    STA.W EnemyData.work1,X                                              ;A8C315;
    LDA.W EnemyData.work0,X                                              ;A8C318;
    ADC.W Powamp_YAccel_Rising                                           ;A8C31B;
    STA.W EnemyData.work0,X                                              ;A8C31E;
    LDA.W EnemyData.work0,X                                              ;A8C321;
    STA.B $14                                                            ;A8C324;
    LDA.W EnemyData.work1,X                                              ;A8C326;
    STA.B $12                                                            ;A8C329;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C32B;
    BCS .doneRising                                                      ;A8C32F;
    LDA.W $0F6A,X                                                        ;A8C331;
    SEC                                                                  ;A8C334;
    SBC.W PowampTravelDistanceWhenNotGrappled                            ;A8C335;
    CMP.W EnemyData.yPosition,X                                          ;A8C338;
    BMI .done                                                            ;A8C33B;

.doneRising:
    LDA.W EnemyData.work2,X                                              ;A8C33D;
    BEQ .centered                                                        ;A8C340;
    CMP.W #$0006                                                         ;A8C342;
    BEQ .centered                                                        ;A8C345;
    LDA.W #Function_Powamp_Inflated_FinishWiggle                         ;A8C347;
    STA.W EnemyData.work5,X                                              ;A8C34A;
    BRA .done                                                            ;A8C34D;


.centered:
    LDA.W #Function_Powamp_Deflating                                     ;A8C34F;
    STA.W EnemyData.work5,X                                              ;A8C352;
    LDA.W #$000A                                                         ;A8C355;
    STA.W EnemyData.work4,X                                              ;A8C358;
    LDA.W #$0001                                                         ;A8C35B;
    STA.W $0F54,X                                                        ;A8C35E;
    LDA.W #InstList_Powamp_Balloon_StartSinking                          ;A8C361;
    STA.W $0F52,X                                                        ;A8C364;

.done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C367;
    RTL                                                                  ;A8C36A;


Function_Powamp_Inflated_FinishWiggle:
    DEC.W EnemyData.work3,X                                              ;A8C36B;
    BEQ .timerExpired                                                    ;A8C36E;
    BPL .continueRising                                                  ;A8C370;

.timerExpired:
    LDA.W #$0005                                                         ;A8C372;
    STA.W EnemyData.work3,X                                              ;A8C375;
    LDA.W EnemyData.work2,X                                              ;A8C378;
    ASL A                                                                ;A8C37B;
    TAY                                                                  ;A8C37C;
    LDA.W $0F68,X                                                        ;A8C37D;
    CLC                                                                  ;A8C380;
    ADC.W PowampWiggleTable,Y                                            ;A8C381;
    STA.W $0F3A,X                                                        ;A8C384;
    STA.W EnemyData.xPosition,X                                          ;A8C387;
    LDA.W EnemyData.work2,X                                              ;A8C38A;
    BEQ .centered                                                        ;A8C38D;
    CMP.W #$0006                                                         ;A8C38F;
    BEQ .centered                                                        ;A8C392;
    INC A                                                                ;A8C394;
    CMP.W #$000C                                                         ;A8C395;
    BMI .storeIndex                                                      ;A8C398;
    LDA.W #$0000                                                         ;A8C39A;

.storeIndex:
    STA.W EnemyData.work2,X                                              ;A8C39D;
    BRA .continueRising                                                  ;A8C3A0;


.centered:
    LDA.W #Function_Powamp_Deflating                                     ;A8C3A2;
    STA.W EnemyData.work5,X                                              ;A8C3A5;
    LDA.W #$000A                                                         ;A8C3A8;
    STA.W EnemyData.work4,X                                              ;A8C3AB;
    LDA.W #$0001                                                         ;A8C3AE;
    STA.W $0F54,X                                                        ;A8C3B1;
    LDA.W #InstList_Powamp_Balloon_StartSinking                          ;A8C3B4;
    STA.W $0F52,X                                                        ;A8C3B7;
    BRA .return                                                          ;A8C3BA;


.continueRising:
    LDA.W EnemyData.work1,X                                              ;A8C3BC;
    CLC                                                                  ;A8C3BF;
    ADC.W Powamp_YAccel_Rising+2                                         ;A8C3C0;
    STA.W EnemyData.work1,X                                              ;A8C3C3;
    LDA.W EnemyData.work0,X                                              ;A8C3C6;
    ADC.W Powamp_YAccel_Rising                                           ;A8C3C9;
    STA.W EnemyData.work0,X                                              ;A8C3CC;
    LDA.W EnemyData.work0,X                                              ;A8C3CF;
    STA.B $14                                                            ;A8C3D2;
    LDA.W EnemyData.work1,X                                              ;A8C3D4;
    STA.B $12                                                            ;A8C3D7;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C3D9;

.return:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C3DD;
    RTL                                                                  ;A8C3E0;


Function_Powamp_Grappled_RiseToTargetHeight:
    LDA.W EnemyData.ai,X                                                 ;A8C3E1;
    BIT.W #$0001                                                         ;A8C3E4;
    BNE .grappleAI                                                       ;A8C3E7;
    LDA.W #Function_Powamp_Inflated_FinishWiggle                         ;A8C3E9;
    STA.W EnemyData.work5,X                                              ;A8C3EC;
    RTL                                                                  ;A8C3EF;


.grappleAI:
    DEC.W EnemyData.work3,X                                              ;A8C3F0;
    BEQ .timerExpired                                                    ;A8C3F3;
    BPL .timerNotExpired                                                 ;A8C3F5;

.timerExpired:
    LDA.W #$0005                                                         ;A8C3F7;
    STA.W EnemyData.work3,X                                              ;A8C3FA;
    LDA.W EnemyData.work2,X                                              ;A8C3FD;
    ASL A                                                                ;A8C400;
    TAY                                                                  ;A8C401;
    LDA.W $0F68,X                                                        ;A8C402;
    CLC                                                                  ;A8C405;
    ADC.W PowampWiggleTable,Y                                            ;A8C406;
    STA.W $0F3A,X                                                        ;A8C409;
    STA.W EnemyData.xPosition,X                                          ;A8C40C;
    LDA.W EnemyData.work2,X                                              ;A8C40F;
    INC A                                                                ;A8C412;
    CMP.W #$000C                                                         ;A8C413;
    BMI .storeIndex                                                      ;A8C416;
    LDA.W #$0000                                                         ;A8C418;

.storeIndex:
    STA.W EnemyData.work2,X                                              ;A8C41B;

.timerNotExpired:
    LDA.W EnemyData.work1,X                                              ;A8C41E;
    CLC                                                                  ;A8C421;
    ADC.W Powamp_YAccel_Rising+2                                         ;A8C422;
    STA.W EnemyData.work1,X                                              ;A8C425;
    LDA.W EnemyData.work0,X                                              ;A8C428;
    ADC.W Powamp_YAccel_Rising                                           ;A8C42B;
    STA.W EnemyData.work0,X                                              ;A8C42E;
    LDA.W EnemyData.work0,X                                              ;A8C431;
    STA.B $14                                                            ;A8C434;
    LDA.W EnemyData.work1,X                                              ;A8C436;
    STA.B $12                                                            ;A8C439;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C43B;
    BCS .doneSinking                                                     ;A8C43F;
    LDA.W $0F6A,X                                                        ;A8C441;
    SEC                                                                  ;A8C444;
    SBC.W $0F6E,X                                                        ;A8C445;
    CMP.W EnemyData.yPosition,X                                          ;A8C448;
    BMI .return                                                          ;A8C44B;

.doneSinking:
    LDA.W EnemyData.work2,X                                              ;A8C44D;
    BEQ .centered                                                        ;A8C450;
    CMP.W #$0006                                                         ;A8C452;
    BEQ .centered                                                        ;A8C455;
    LDA.W #Function_Powamp_Grappled_FinishWiggle                         ;A8C457;
    STA.W EnemyData.work5,X                                              ;A8C45A;
    BRA .return                                                          ;A8C45D;


.centered:
    LDA.W #Function_Powamp_Grappled_Resting                              ;A8C45F;
    STA.W EnemyData.work5,X                                              ;A8C462;

.return:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C465;
    RTL                                                                  ;A8C468;


Function_Powamp_Grappled_FinishWiggle:
    LDA.W EnemyData.ai,X                                                 ;A8C469;
    BIT.W #$0001                                                         ;A8C46C;
    BNE .GrappleAI                                                       ;A8C46F;
    LDA.W #Function_Powamp_Inflated_FinishWiggle                         ;A8C471;
    STA.W EnemyData.work5,X                                              ;A8C474;
    RTL                                                                  ;A8C477;


.GrappleAI:
    DEC.W EnemyData.work3,X                                              ;A8C478;
    BEQ .timerExpired                                                    ;A8C47B;
    BPL .continueRising                                                  ;A8C47D;

.timerExpired:
    LDA.W #$0005                                                         ;A8C47F;
    STA.W EnemyData.work3,X                                              ;A8C482;
    LDA.W EnemyData.work2,X                                              ;A8C485;
    ASL A                                                                ;A8C488;
    TAY                                                                  ;A8C489;
    LDA.W $0F68,X                                                        ;A8C48A;
    CLC                                                                  ;A8C48D;
    ADC.W PowampWiggleTable,Y                                            ;A8C48E;
    STA.W $0F3A,X                                                        ;A8C491;
    STA.W EnemyData.xPosition,X                                          ;A8C494;
    LDA.W EnemyData.work2,X                                              ;A8C497;
    BEQ .centered                                                        ;A8C49A;
    CMP.W #$0006                                                         ;A8C49C;
    BEQ .centered                                                        ;A8C49F;
    INC A                                                                ;A8C4A1;
    CMP.W #$000C                                                         ;A8C4A2;
    BMI .storeIndex                                                      ;A8C4A5;
    LDA.W #$0000                                                         ;A8C4A7;

.storeIndex:
    STA.W EnemyData.work2,X                                              ;A8C4AA;
    BRA .continueRising                                                  ;A8C4AD;


.centered:
    LDA.W #Function_Powamp_Grappled_Resting                              ;A8C4AF;
    STA.W EnemyData.work5,X                                              ;A8C4B2;
    BRA .return                                                          ;A8C4B5;


.continueRising:
    LDA.W EnemyData.work1,X                                              ;A8C4B7;
    CLC                                                                  ;A8C4BA;
    ADC.W Powamp_YAccel_Rising+2                                         ;A8C4BB;
    STA.W EnemyData.work1,X                                              ;A8C4BE;
    LDA.W EnemyData.work0,X                                              ;A8C4C1;
    ADC.W Powamp_YAccel_Rising                                           ;A8C4C4;
    STA.W EnemyData.work0,X                                              ;A8C4C7;
    LDA.W EnemyData.work0,X                                              ;A8C4CA;
    STA.B $14                                                            ;A8C4CD;
    LDA.W EnemyData.work1,X                                              ;A8C4CF;
    STA.B $12                                                            ;A8C4D2;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C4D4;

.return:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C4D8;
    RTL                                                                  ;A8C4DB;


Function_Powamp_Grappled_Resting:
    LDA.W EnemyData.ai,X                                                 ;A8C4DC;
    BIT.W #$0001                                                         ;A8C4DF;
    BNE .done                                                            ;A8C4E2;
    LDA.W #Function_Powamp_Deflating                                     ;A8C4E4;
    STA.W EnemyData.work5,X                                              ;A8C4E7;
    LDA.W #$000A                                                         ;A8C4EA;
    STA.W EnemyData.work4,X                                              ;A8C4ED;
    LDA.W #$0001                                                         ;A8C4F0;
    STA.W $0F54,X                                                        ;A8C4F3;
    LDA.W #InstList_Powamp_Balloon_StartSinking                          ;A8C4F6;
    STA.W $0F52,X                                                        ;A8C4F9;

.done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C4FC;
    RTL                                                                  ;A8C4FF;


Function_Powamp_Deflating:
    DEC.W EnemyData.work4,X                                              ;A8C500;
    BEQ .timerExpired                                                    ;A8C503;
    BPL .done                                                            ;A8C505;

.timerExpired:
    LDA.W #Function_Powamp_Deflated_Sinking                              ;A8C507;
    STA.W EnemyData.work5,X                                              ;A8C50A;
    LDA.W Powamp_InitialYVelocity_Sinking                                ;A8C50D;
    STA.W EnemyData.work0,X                                              ;A8C510;
    LDA.W Powamp_InitialYVelocity_Sinking+2                              ;A8C513;
    STA.W EnemyData.work1,X                                              ;A8C516;

.done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C519;
    RTL                                                                  ;A8C51C;


Function_Powamp_Deflated_Sinking:
    LDA.W EnemyData.work1,X                                              ;A8C51D;
    CLC                                                                  ;A8C520;
    ADC.W Powamp_YAccel_Sinking+2                                        ;A8C521;
    STA.W EnemyData.work1,X                                              ;A8C524;
    LDA.W EnemyData.work0,X                                              ;A8C527;
    ADC.W Powamp_YAccel_Sinking                                          ;A8C52A;
    STA.W EnemyData.work0,X                                              ;A8C52D;
    LDA.W EnemyData.work0,X                                              ;A8C530;
    STA.B $14                                                            ;A8C533;
    LDA.W EnemyData.work1,X                                              ;A8C535;
    STA.B $12                                                            ;A8C538;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8C53A;
    LDA.W EnemyData.yPosition,X                                          ;A8C53E;
    CMP.W $0F6A,X                                                        ;A8C541;
    BMI .done                                                            ;A8C544;
    LDA.W $0F6A,X                                                        ;A8C546;
    STA.W EnemyData.yPosition,X                                          ;A8C549;
    LDA.W #Function_Powamp_Deflated_Resting                              ;A8C54C;
    STA.W EnemyData.work5,X                                              ;A8C54F;
    LDA.W #$003C                                                         ;A8C552;
    STA.W EnemyData.work4,X                                              ;A8C555;
    LDA.W #$0001                                                         ;A8C558;
    STA.W EnemyData.instTimer,X                                          ;A8C55B;
    LDA.W #InstList_Powamp_Body_SlowAnimation                            ;A8C55E;
    STA.W EnemyData.pInstList,X                                          ;A8C561;

.done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C564;
    RTL                                                                  ;A8C567;


RTL_A8C568:
    RTL                                                                  ;A8C568;


Function_Powamp_FatalDamage:
    LDA.W $0F52,X                                                        ;A8C569;
    CMP.W #InstList_Powamp_Balloon_StartSinking                          ;A8C56C;
    BMI +                                                                ;A8C56F;
    SEC                                                                  ;A8C571;
    SBC.W #$0004                                                         ;A8C572;
    SEC                                                                  ;A8C575;
    SBC.W #InstList_Powamp_Balloon_StartSinking                          ;A8C576;
    LSR A                                                                ;A8C579;
    BEQ +                                                                ;A8C57A;
    TAY                                                                  ;A8C57C;
    LDA.W .instListPointers,Y                                            ;A8C57D;
    STA.W $0F52,X                                                        ;A8C580;
    LDA.W #$0001                                                         ;A8C583;
    STA.W $0F54,X                                                        ;A8C586;

  + LDA.W #Function_Powamp_DeathSequence                                 ;A8C589;
    STA.W EnemyData.work5,X                                              ;A8C58C;
    LDA.W #$0020                                                         ;A8C58F;
    STA.W EnemyData.work4,X                                              ;A8C592;
    JSR.W HandlePowampBalloonYOffset                                     ;A8C595;
    RTL                                                                  ;A8C598;


.instListPointers:
    dw InstList_Powamp_Balloon_Inflated                                  ;A8C599;
    dw InstList_Powamp_Balloon_Inflating                                 ;A8C59B;
    dw InstList_Powamp_Balloon_StartingToRise                            ;A8C59D;

Function_Powamp_DeathSequence:
    DEC.W EnemyData.work4,X                                              ;A8C59F;
    BEQ .timerExpired                                                    ;A8C5A2;
    BPL .done                                                            ;A8C5A4;

.timerExpired:
    STZ.W $0F4C,X                                                        ;A8C5A6;
    LDA.W $0F46,X                                                        ;A8C5A9;
    ORA.W #$0200                                                         ;A8C5AC;
    STA.W $0F46,X                                                        ;A8C5AF;
    JSR.W FirePowampSpikesIn8Directions                                  ;A8C5B2;
    JSL.L EnemyDeath                                                     ;A8C5B5;
    RTL                                                                  ;A8C5B9;


.done:
    JSR.W HandlePowampBalloonYOffset                                     ;A8C5BA;
    RTL                                                                  ;A8C5BD;


EnemyTouch_Powamp:
    LDX.W $0E54                                                          ;A8C5BE;
    LDA.W EnemyData.initParam1,X                                         ;A8C5C1;
    BNE .return                                                          ;A8C5C4;
    LDA.W EnemyData.palette,X                                            ;A8C5C6;
    PHA                                                                  ;A8C5C9;
    JSL.L NormalEnemyTouchAI                                             ;A8C5CA;
    LDX.W $0E54                                                          ;A8C5CE;
    LDA.W EnemyData.health,X                                             ;A8C5D1;
    BEQ .dead                                                            ;A8C5D4;
    PLA                                                                  ;A8C5D6;
    RTL                                                                  ;A8C5D7;


.dead:
    LDA.W $0F46,X                                                        ;A8C5D8;
    ORA.W #$0200                                                         ;A8C5DB;
    STA.W $0F46,X                                                        ;A8C5DE;
    PLA                                                                  ;A8C5E1;
    STA.W EnemyData.palette,X                                            ;A8C5E2;
    JSR.W FirePowampSpikesIn8Directions                                  ;A8C5E5;
    LDA.W #$0A00                                                         ;A8C5E8;
    STA.W EnemyData.palette,X                                            ;A8C5EB;

.return:
    RTL                                                                  ;A8C5EE;


EnemyShot_Powamp:
    PHB                                                                  ;A8C5EF;
    LDX.W $0E54                                                          ;A8C5F0;
    LDA.W EnemyData.initParam1,X                                         ;A8C5F3;
    BEQ .body                                                            ;A8C5F6;
    PLB                                                                  ;A8C5F8;
    RTL                                                                  ;A8C5F9;


.body:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A8C5FA;
    LDA.W EnemyData.ai,X                                                 ;A8C5FE;
    BIT.W #$0004                                                         ;A8C601;
    BEQ .notFrozenAI                                                     ;A8C604;
    LDA.W EnemyData.freezeTimer,X                                        ;A8C606;
    STA.W $0F5E,X                                                        ;A8C609;
    LDA.W $0F4A,X                                                        ;A8C60C;
    ORA.W #$0004                                                         ;A8C60F;
    STA.W $0F4A,X                                                        ;A8C612;

.notFrozenAI:
    LDA.W EnemyData.ai,X                                                 ;A8C615;
    BIT.W #$0002                                                         ;A8C618;
    BEQ .notHurtAI                                                       ;A8C61B;
    LDA.W EnemyData.flashTimer,X                                         ;A8C61D;
    STA.W $0F5C,X                                                        ;A8C620;
    LDA.W $0F4A,X                                                        ;A8C623;
    ORA.W #$0002                                                         ;A8C626;
    STA.W $0F4A,X                                                        ;A8C629;

.notHurtAI:
    LDA.W EnemyData.health,X                                             ;A8C62C;
    BNE .return                                                          ;A8C62F;
    LDA.W #Function_Powamp_FatalDamage                                   ;A8C631;
    STA.W EnemyData.work5,X                                              ;A8C634;
    LDA.W #$0001                                                         ;A8C637;
    STA.W EnemyData.initParam1,X                                         ;A8C63A;

.return:
    PLB                                                                  ;A8C63D;
    RTL                                                                  ;A8C63E;


PowerBombReaction_Powamp:
    JSL.L CommonA8_NormalEnemyPowerBombAI                                ;A8C63F;
    LDX.W $0E54                                                          ;A8C643;
    LDA.W EnemyData.health,X                                             ;A8C646;
    BNE .notDead                                                         ;A8C649;
    LDA.W $0F46,X                                                        ;A8C64B;
    ORA.W #$0200                                                         ;A8C64E;
    STA.W $0F46,X                                                        ;A8C651;
    BRA .return                                                          ;A8C654;


.notDead:
    LDA.W EnemyData.shakeTimer,X                                         ;A8C656;
    STA.W $0F62,X                                                        ;A8C659;
    LDA.W EnemyData.invincibilityTimer,X                                 ;A8C65C;
    STA.W $0F60,X                                                        ;A8C65F;
    LDA.W EnemyData.flashTimer,X                                         ;A8C662;
    STA.W $0F5C,X                                                        ;A8C665;
    LDA.W EnemyData.freezeTimer,X                                        ;A8C668;
    STA.W $0F5E,X                                                        ;A8C66B;
    LDA.W EnemyData.ai,X                                                 ;A8C66E;
    STA.W $0F4A,X                                                        ;A8C671;

.return:
    RTL                                                                  ;A8C674;


Spritemap_Powamp_Body_CheeksLowered:
    dw $0001,$81F8                                                       ;A8C675;
    db $F8                                                               ;A8C679;
    dw $2100                                                             ;A8C67A;

Spritemap_Powamp_Body_CheeksLifting:
    dw $0001,$81F8                                                       ;A8C67C;
    db $F8                                                               ;A8C680;
    dw $2102                                                             ;A8C681;

Spritemap_Powamp_Body_CheeksRaised:
    dw $0001,$81F8                                                       ;A8C683;
    db $F8                                                               ;A8C687;
    dw $2104                                                             ;A8C688;

Spritemap_Powamp_Balloon_Deflated:
    dw $0001,$01FC                                                       ;A8C68A;
    db $FC                                                               ;A8C68E;
    dw $210E                                                             ;A8C68F;

Spritemap_Powamp_Balloon_Inflating:
    dw $0001,$81F8                                                       ;A8C691;
    db $F8                                                               ;A8C695;
    dw $2106                                                             ;A8C696;

Spritemap_Powamp_Balloon_FullyInflated:
    dw $0005,$0004                                                       ;A8C698;
    db $04                                                               ;A8C69C;
    dw $210D,$01FC                                                       ;A8C69D;
    db $04                                                               ;A8C6A1;
    dw $210C,$01F4                                                       ;A8C6A2;
    db $04                                                               ;A8C6A6;
    dw $210B,$81FC                                                       ;A8C6A7;
    db $F4                                                               ;A8C6AB;
    dw $2109,$81F4                                                       ;A8C6AC;
    db $F4                                                               ;A8C6B0;
    dw $2108                                                             ;A8C6B1;

Palette_Robot:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610                   ;A8C6B3;
    dw $1DCE,$001F,$0018,$000F,$0008,$000A,$03FF,$02B5                   ;A8C6C3;

InstList_RobotNoPower_Neutral:
    dw $7FFF                                                             ;A8C6D3;
    dw Spritemap_Robot_19                                                ;A8C6D5;
    dw Instruction_Common_Sleep                                          ;A8C6D7;

InstList_RobotNoPower_LeaningLeft:
    dw $7FFF                                                             ;A8C6D9;
    dw Spritemap_Robot_18                                                ;A8C6DB;
    dw Instruction_Common_Sleep                                          ;A8C6DD;

InstList_RobotNoPower_LeaningRIght:
    dw $7FFF                                                             ;A8C6DF;
    dw Spritemap_Robot_1A                                                ;A8C6E1;
    dw Instruction_CommonA8_Sleep                                        ;A8C6E3;

InstList_Robot_Initial:
    dw $0020                                                             ;A8C6E5;
    dw Spritemap_Robot_1                                                 ;A8C6E7;

InstList_Robot_FacingLeft_WalkingForwards_0:
    dw $0001                                                             ;A8C6E9;
    dw Spritemap_Robot_1                                                 ;A8C6EB;

InstList_Robot_FacingLeft_WalkingForwards_1:
    dw $000A                                                             ;A8C6ED;
    dw Spritemap_Robot_1                                                 ;A8C6EF;
    dw $0001                                                             ;A8C6F1;
    dw Spritemap_Robot_2                                                 ;A8C6F3;
    dw Instruction_Robot_TryShootingLaserLeft                            ;A8C6F5;
    dw $0009                                                             ;A8C6F7;
    dw Spritemap_Robot_2                                                 ;A8C6F9;
    dw $0001                                                             ;A8C6FB;
    dw Spritemap_Robot_3                                                 ;A8C6FD;
    dw Instruction_Robot_TryShootingLaserUpLeft                          ;A8C6FF;
    dw $0009                                                             ;A8C701;
    dw Spritemap_Robot_3                                                 ;A8C703;
    dw $000A                                                             ;A8C705;
    dw Spritemap_Robot_4                                                 ;A8C707;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C709;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall         ;A8C70B;
    dw $000A                                                             ;A8C70D;
    dw Spritemap_Robot_5                                                 ;A8C70F;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall         ;A8C711;
    dw $000A                                                             ;A8C713;
    dw Spritemap_Robot_6                                                 ;A8C715;
    dw $000A                                                             ;A8C717;
    dw Spritemap_Robot_7                                                 ;A8C719;
    dw $000A                                                             ;A8C71B;
    dw Spritemap_Robot_8                                                 ;A8C71D;
    dw $000A                                                             ;A8C71F;
    dw Spritemap_Robot_9                                                 ;A8C721;
    dw $000A                                                             ;A8C723;
    dw Spritemap_Robot_A                                                 ;A8C725;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall         ;A8C727;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C729;
    dw $000A                                                             ;A8C72B;
    dw Spritemap_Robot_B                                                 ;A8C72D;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall         ;A8C72F;
    dw $0001                                                             ;A8C731;
    dw Spritemap_Robot_0                                                 ;A8C733;
    dw Instruction_Robot_TryShootingLaserDownLeft                        ;A8C735;
    dw $0009                                                             ;A8C737;
    dw Spritemap_Robot_0                                                 ;A8C739;
    dw Instruction_Common_GotoY                                          ;A8C73B;
    dw InstList_Robot_FacingLeft_WalkingForwards_1                       ;A8C73D;

InstList_Robot_FacingLeft_HitWallMovingForwards:
    dw $0001                                                             ;A8C73F;
    dw Spritemap_Robot_B                                                 ;A8C741;
    dw $000A                                                             ;A8C743;
    dw Spritemap_Robot_B                                                 ;A8C745;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C747;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C749;
    dw $000A                                                             ;A8C74B;
    dw Spritemap_Robot_A                                                 ;A8C74D;
    dw $000A                                                             ;A8C74F;
    dw Spritemap_Robot_9                                                 ;A8C751;
    dw $000A                                                             ;A8C753;
    dw Spritemap_Robot_8                                                 ;A8C755;
    dw $000A                                                             ;A8C757;
    dw Spritemap_Robot_7                                                 ;A8C759;
    dw $000A                                                             ;A8C75B;
    dw Spritemap_Robot_6                                                 ;A8C75D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C75F;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C761;
    dw $000A                                                             ;A8C763;
    dw Spritemap_Robot_5                                                 ;A8C765;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C767;
    dw $000A                                                             ;A8C769;
    dw Spritemap_Robot_4                                                 ;A8C76B;
    dw $000A                                                             ;A8C76D;
    dw Spritemap_Robot_3                                                 ;A8C76F;
    dw $000A                                                             ;A8C771;
    dw Spritemap_Robot_2                                                 ;A8C773;
    dw $000A                                                             ;A8C775;
    dw Spritemap_Robot_1                                                 ;A8C777;
    dw $000A                                                             ;A8C779;
    dw Spritemap_Robot_0                                                 ;A8C77B;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C77D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C77F;
    dw $000A                                                             ;A8C781;
    dw Spritemap_Robot_B                                                 ;A8C783;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C785;
    dw $000A                                                             ;A8C787;
    dw Spritemap_Robot_A                                                 ;A8C789;
    dw $000A                                                             ;A8C78B;
    dw Spritemap_Robot_9                                                 ;A8C78D;
    dw $000A                                                             ;A8C78F;
    dw Spritemap_Robot_8                                                 ;A8C791;
    dw $000A                                                             ;A8C793;
    dw Spritemap_Robot_7                                                 ;A8C795;
    dw $000A                                                             ;A8C797;
    dw Spritemap_Robot_6                                                 ;A8C799;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C79B;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C79D;
    dw $000A                                                             ;A8C79F;
    dw Spritemap_Robot_5                                                 ;A8C7A1;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C7A3;
    dw $000A                                                             ;A8C7A5;
    dw Spritemap_Robot_4                                                 ;A8C7A7;
    dw $000A                                                             ;A8C7A9;
    dw Spritemap_Robot_3                                                 ;A8C7AB;
    dw $000A                                                             ;A8C7AD;
    dw Spritemap_Robot_2                                                 ;A8C7AF;
    dw $000A                                                             ;A8C7B1;
    dw Spritemap_Robot_1                                                 ;A8C7B3;
    dw $000A                                                             ;A8C7B5;
    dw Spritemap_Robot_0                                                 ;A8C7B7;
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards       ;A8C7B9;

InstList_Robot_FacingLeft_Shot_SamusIsAhead:
    dw $0005                                                             ;A8C7BB;
    dw Spritemap_Robot_B                                                 ;A8C7BD;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C7BF;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7C1;
    dw $0005                                                             ;A8C7C3;
    dw Spritemap_Robot_A                                                 ;A8C7C5;
    dw $0005                                                             ;A8C7C7;
    dw Spritemap_Robot_9                                                 ;A8C7C9;
    dw $0005                                                             ;A8C7CB;
    dw Spritemap_Robot_8                                                 ;A8C7CD;
    dw $0005                                                             ;A8C7CF;
    dw Spritemap_Robot_7                                                 ;A8C7D1;
    dw $0005                                                             ;A8C7D3;
    dw Spritemap_Robot_6                                                 ;A8C7D5;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C7D7;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7D9;
    dw $0005                                                             ;A8C7DB;
    dw Spritemap_Robot_5                                                 ;A8C7DD;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7DF;
    dw $0005                                                             ;A8C7E1;
    dw Spritemap_Robot_4                                                 ;A8C7E3;
    dw $0005                                                             ;A8C7E5;
    dw Spritemap_Robot_3                                                 ;A8C7E7;
    dw $0005                                                             ;A8C7E9;
    dw Spritemap_Robot_2                                                 ;A8C7EB;
    dw $0005                                                             ;A8C7ED;
    dw Spritemap_Robot_1                                                 ;A8C7EF;
    dw $0005                                                             ;A8C7F1;
    dw Spritemap_Robot_0                                                 ;A8C7F3;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7F5;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C7F7;
    dw $0005                                                             ;A8C7F9;
    dw Spritemap_Robot_B                                                 ;A8C7FB;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C7FD;
    dw $0005                                                             ;A8C7FF;
    dw Spritemap_Robot_A                                                 ;A8C801;
    dw $0005                                                             ;A8C803;
    dw Spritemap_Robot_9                                                 ;A8C805;
    dw $0005                                                             ;A8C807;
    dw Spritemap_Robot_8                                                 ;A8C809;
    dw $0005                                                             ;A8C80B;
    dw Spritemap_Robot_7                                                 ;A8C80D;
    dw $0005                                                             ;A8C80F;
    dw Spritemap_Robot_6                                                 ;A8C811;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C813;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C815;
    dw $0005                                                             ;A8C817;
    dw Spritemap_Robot_5                                                 ;A8C819;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall       ;A8C81B;
    dw $0005                                                             ;A8C81D;
    dw Spritemap_Robot_4                                                 ;A8C81F;
    dw $0005                                                             ;A8C821;
    dw Spritemap_Robot_3                                                 ;A8C823;
    dw $0005                                                             ;A8C825;
    dw Spritemap_Robot_2                                                 ;A8C827;
    dw $0005                                                             ;A8C829;
    dw Spritemap_Robot_1                                                 ;A8C82B;
    dw $0005                                                             ;A8C82D;
    dw Spritemap_Robot_0                                                 ;A8C82F;
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards       ;A8C831;

InstList_Robot_FacingLeft_Shot_SamusIsBehind:
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C833;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C835;
    dw $0005                                                             ;A8C837;
    dw Spritemap_Robot_1                                                 ;A8C839;
    dw $0005                                                             ;A8C83B;
    dw Spritemap_Robot_2                                                 ;A8C83D;
    dw $0005                                                             ;A8C83F;
    dw Spritemap_Robot_3                                                 ;A8C841;
    dw $0005                                                             ;A8C843;
    dw Spritemap_Robot_4                                                 ;A8C845;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C847;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C849;
    dw $0005                                                             ;A8C84B;
    dw Spritemap_Robot_5                                                 ;A8C84D;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C84F;
    dw $0005                                                             ;A8C851;
    dw Spritemap_Robot_6                                                 ;A8C853;
    dw $0005                                                             ;A8C855;
    dw Spritemap_Robot_7                                                 ;A8C857;
    dw $0005                                                             ;A8C859;
    dw Spritemap_Robot_8                                                 ;A8C85B;
    dw $0005                                                             ;A8C85D;
    dw Spritemap_Robot_9                                                 ;A8C85F;
    dw $0005                                                             ;A8C861;
    dw Spritemap_Robot_A                                                 ;A8C863;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C865;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C867;
    dw $0005                                                             ;A8C869;
    dw Spritemap_Robot_B                                                 ;A8C86B;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C86D;
    dw $0005                                                             ;A8C86F;
    dw Spritemap_Robot_0                                                 ;A8C871;
    dw $0005                                                             ;A8C873;
    dw Spritemap_Robot_1                                                 ;A8C875;
    dw $0005                                                             ;A8C877;
    dw Spritemap_Robot_2                                                 ;A8C879;
    dw $0005                                                             ;A8C87B;
    dw Spritemap_Robot_3                                                 ;A8C87D;
    dw $0005                                                             ;A8C87F;
    dw Spritemap_Robot_4                                                 ;A8C881;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C883;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C885;
    dw $0005                                                             ;A8C887;
    dw Spritemap_Robot_5                                                 ;A8C889;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C88B;
    dw $0005                                                             ;A8C88D;
    dw Spritemap_Robot_6                                                 ;A8C88F;
    dw $0005                                                             ;A8C891;
    dw Spritemap_Robot_7                                                 ;A8C893;
    dw $0005                                                             ;A8C895;
    dw Spritemap_Robot_8                                                 ;A8C897;
    dw $0005                                                             ;A8C899;
    dw Spritemap_Robot_9                                                 ;A8C89B;
    dw $0005                                                             ;A8C89D;
    dw Spritemap_Robot_A                                                 ;A8C89F;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C8A1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C8A3;
    dw $0005                                                             ;A8C8A5;
    dw Spritemap_Robot_B                                                 ;A8C8A7;
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall        ;A8C8A9;
    dw $0005                                                             ;A8C8AB;
    dw Spritemap_Robot_0                                                 ;A8C8AD;
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards                 ;A8C8AF;

InstList_Robot_FacingLeft_ShotLaserDownLeft:
    dw $0005                                                             ;A8C8B1;
    dw Spritemap_Robot_0                                                 ;A8C8B3;
    dw $0002                                                             ;A8C8B5;
    dw Spritemap_Robot_B                                                 ;A8C8B7;
    dw Instruction_Common_GotoY                                          ;A8C8B9;
    dw InstList_Robot_FacingLeft_LaserShotRecoil                         ;A8C8BB;

InstList_Robot_FacingLeft_ShotLaserLeft:
    dw $0005                                                             ;A8C8BD;
    dw Spritemap_Robot_1                                                 ;A8C8BF;
    dw $0002                                                             ;A8C8C1;
    dw Spritemap_Robot_0                                                 ;A8C8C3;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C8C5;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C8C7;
    dw $000A                                                             ;A8C8C9;
    dw Spritemap_Robot_B                                                 ;A8C8CB;
    dw Instruction_Common_GotoY                                          ;A8C8CD;
    dw InstList_Robot_FacingLeft_LaserShotRecoil                         ;A8C8CF;

InstList_Robot_FacingLeft_ShotLaserUpLeft:
    dw $0005                                                             ;A8C8D1;
    dw Spritemap_Robot_3                                                 ;A8C8D3;
    dw $0002                                                             ;A8C8D5;
    dw Spritemap_Robot_2                                                 ;A8C8D7;
    dw $0002                                                             ;A8C8D9;
    dw Spritemap_Robot_1                                                 ;A8C8DB;
    dw $0004                                                             ;A8C8DD;
    dw Spritemap_Robot_0                                                 ;A8C8DF;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C8E1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C8E3;
    dw $0004                                                             ;A8C8E5;
    dw Spritemap_Robot_B                                                 ;A8C8E7;

InstList_Robot_FacingLeft_LaserShotRecoil:
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C8E9;
    dw $0010                                                             ;A8C8EB;
    dw Spritemap_Robot_A                                                 ;A8C8ED;
    dw $0005                                                             ;A8C8EF;
    dw Spritemap_Robot_9                                                 ;A8C8F1;
    dw $0005                                                             ;A8C8F3;
    dw Spritemap_Robot_8                                                 ;A8C8F5;
    dw $0005                                                             ;A8C8F7;
    dw Spritemap_Robot_7                                                 ;A8C8F9;
    dw $0005                                                             ;A8C8FB;
    dw Spritemap_Robot_6                                                 ;A8C8FD;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C8FF;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C901;
    dw $000A                                                             ;A8C903;
    dw Spritemap_Robot_5                                                 ;A8C905;
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall        ;A8C907;
    dw $000A                                                             ;A8C909;
    dw Spritemap_Robot_4                                                 ;A8C90B;
    dw $000A                                                             ;A8C90D;
    dw Spritemap_Robot_3                                                 ;A8C90F;
    dw $0060                                                             ;A8C911;
    dw Spritemap_Robot_2                                                 ;A8C913;
    dw Instruction_Robot_DecrementLaserCooldown                          ;A8C915;
    dw Instruction_CommonA8_GotoY                                        ;A8C917;
    dw InstList_Robot_FacingLeft_WalkingForwards_0                       ;A8C919;

InstList_Robot_ApproachingAFallToTheRight:
    dw $0080                                                             ;A8C91B;
    dw Spritemap_Robot_C                                                 ;A8C91D;
    dw $000A                                                             ;A8C91F;
    dw Spritemap_Robot_D                                                 ;A8C921;
    dw $000A                                                             ;A8C923;
    dw Spritemap_Robot_E                                                 ;A8C925;
    dw Instruction_Robot_DecrementLaserCooldown                          ;A8C927;
    dw Instruction_Common_GotoY                                          ;A8C929;
    dw InstList_Robot_FacingLeft_WalkingForwards_0                       ;A8C92B;

InstList_Robot_FacingRight_WalkingForwards_0:
    dw $0001                                                             ;A8C92D;
    dw Spritemap_Robot_C                                                 ;A8C92F;

InstList_Robot_FacingRight_WalkingForwards_1:
    dw $0001                                                             ;A8C931;
    dw Spritemap_Robot_C                                                 ;A8C933;
    dw Instruction_Robot_TryShootingLaserDownRight                       ;A8C935;
    dw $0009                                                             ;A8C937;
    dw Spritemap_Robot_C                                                 ;A8C939;
    dw Instruction_Robot_DecrementLaserCooldown                          ;A8C93B;
    dw $000A                                                             ;A8C93D;
    dw Spritemap_Robot_D                                                 ;A8C93F;
    dw $0001                                                             ;A8C941;
    dw Spritemap_Robot_E                                                 ;A8C943;
    dw Instruction_Robot_TryShootingLaserRight                           ;A8C945;
    dw $0009                                                             ;A8C947;
    dw Spritemap_Robot_E                                                 ;A8C949;
    dw $0001                                                             ;A8C94B;
    dw Spritemap_Robot_F                                                 ;A8C94D;
    dw Instruction_Robot_TryShootingLaserUpRight                         ;A8C94F;
    dw $0009                                                             ;A8C951;
    dw Spritemap_Robot_F                                                 ;A8C953;
    dw $000A                                                             ;A8C955;
    dw Spritemap_Robot_10                                                ;A8C957;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C959;
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall        ;A8C95B;
    dw $000A                                                             ;A8C95D;
    dw Spritemap_Robot_11                                                ;A8C95F;
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall        ;A8C961;
    dw $000A                                                             ;A8C963;
    dw Spritemap_Robot_12                                                ;A8C965;
    dw $000A                                                             ;A8C967;
    dw Spritemap_Robot_13                                                ;A8C969;
    dw $000A                                                             ;A8C96B;
    dw Spritemap_Robot_14                                                ;A8C96D;
    dw $000A                                                             ;A8C96F;
    dw Spritemap_Robot_15                                                ;A8C971;
    dw $000A                                                             ;A8C973;
    dw Spritemap_Robot_16                                                ;A8C975;
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall        ;A8C977;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C979;
    dw $000A                                                             ;A8C97B;
    dw Spritemap_Robot_17                                                ;A8C97D;
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall        ;A8C97F;
    dw Instruction_Common_GotoY                                          ;A8C981;
    dw InstList_Robot_FacingRight_WalkingForwards_1                      ;A8C983;

InstList_Robot_FacingRight_HitWallMovingForwards:
    dw $0001                                                             ;A8C985;
    dw Spritemap_Robot_17                                                ;A8C987;
    dw $000A                                                             ;A8C989;
    dw Spritemap_Robot_17                                                ;A8C98B;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C98D;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C98F;
    dw $000A                                                             ;A8C991;
    dw Spritemap_Robot_16                                                ;A8C993;
    dw $000A                                                             ;A8C995;
    dw Spritemap_Robot_15                                                ;A8C997;
    dw $000A                                                             ;A8C999;
    dw Spritemap_Robot_14                                                ;A8C99B;
    dw $000A                                                             ;A8C99D;
    dw Spritemap_Robot_13                                                ;A8C99F;
    dw $000A                                                             ;A8C9A1;
    dw Spritemap_Robot_12                                                ;A8C9A3;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C9A5;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9A7;
    dw $000A                                                             ;A8C9A9;
    dw Spritemap_Robot_11                                                ;A8C9AB;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9AD;
    dw $000A                                                             ;A8C9AF;
    dw Spritemap_Robot_10                                                ;A8C9B1;
    dw $000A                                                             ;A8C9B3;
    dw Spritemap_Robot_F                                                 ;A8C9B5;
    dw $000A                                                             ;A8C9B7;
    dw Spritemap_Robot_E                                                 ;A8C9B9;
    dw $000A                                                             ;A8C9BB;
    dw Spritemap_Robot_D                                                 ;A8C9BD;
    dw $000A                                                             ;A8C9BF;
    dw Spritemap_Robot_C                                                 ;A8C9C1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C9C3;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9C5;
    dw $000A                                                             ;A8C9C7;
    dw Spritemap_Robot_17                                                ;A8C9C9;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9CB;
    dw $000A                                                             ;A8C9CD;
    dw Spritemap_Robot_16                                                ;A8C9CF;
    dw $000A                                                             ;A8C9D1;
    dw Spritemap_Robot_15                                                ;A8C9D3;
    dw $000A                                                             ;A8C9D5;
    dw Spritemap_Robot_14                                                ;A8C9D7;
    dw $000A                                                             ;A8C9D9;
    dw Spritemap_Robot_13                                                ;A8C9DB;
    dw $000A                                                             ;A8C9DD;
    dw Spritemap_Robot_12                                                ;A8C9DF;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8C9E1;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9E3;
    dw $000A                                                             ;A8C9E5;
    dw Spritemap_Robot_11                                                ;A8C9E7;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8C9E9;
    dw $000A                                                             ;A8C9EB;
    dw Spritemap_Robot_10                                                ;A8C9ED;
    dw $000A                                                             ;A8C9EF;
    dw Spritemap_Robot_F                                                 ;A8C9F1;
    dw $000A                                                             ;A8C9F3;
    dw Spritemap_Robot_E                                                 ;A8C9F5;
    dw $000A                                                             ;A8C9F7;
    dw Spritemap_Robot_D                                                 ;A8C9F9;
    dw $000A                                                             ;A8C9FB;
    dw Spritemap_Robot_C                                                 ;A8C9FD;
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards                 ;A8C9FF;

InstList_Robot_FacingRight_Shot_SamusIsAhead:
    dw $0001                                                             ;A8CA01;
    dw Spritemap_Robot_17                                                ;A8CA03;
    dw $0005                                                             ;A8CA05;
    dw Spritemap_Robot_17                                                ;A8CA07;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA09;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA0B;
    dw $0005                                                             ;A8CA0D;
    dw Spritemap_Robot_16                                                ;A8CA0F;
    dw $0005                                                             ;A8CA11;
    dw Spritemap_Robot_15                                                ;A8CA13;
    dw $0005                                                             ;A8CA15;
    dw Spritemap_Robot_14                                                ;A8CA17;
    dw $0005                                                             ;A8CA19;
    dw Spritemap_Robot_13                                                ;A8CA1B;
    dw $0005                                                             ;A8CA1D;
    dw Spritemap_Robot_12                                                ;A8CA1F;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA21;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA23;
    dw $0005                                                             ;A8CA25;
    dw Spritemap_Robot_11                                                ;A8CA27;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA29;
    dw $0005                                                             ;A8CA2B;
    dw Spritemap_Robot_10                                                ;A8CA2D;
    dw $0005                                                             ;A8CA2F;
    dw Spritemap_Robot_F                                                 ;A8CA31;
    dw $0005                                                             ;A8CA33;
    dw Spritemap_Robot_E                                                 ;A8CA35;
    dw $0005                                                             ;A8CA37;
    dw Spritemap_Robot_D                                                 ;A8CA39;
    dw $0005                                                             ;A8CA3B;
    dw Spritemap_Robot_C                                                 ;A8CA3D;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA3F;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA41;
    dw $0005                                                             ;A8CA43;
    dw Spritemap_Robot_17                                                ;A8CA45;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA47;
    dw $0005                                                             ;A8CA49;
    dw Spritemap_Robot_16                                                ;A8CA4B;
    dw $0005                                                             ;A8CA4D;
    dw Spritemap_Robot_15                                                ;A8CA4F;
    dw $0005                                                             ;A8CA51;
    dw Spritemap_Robot_14                                                ;A8CA53;
    dw $0005                                                             ;A8CA55;
    dw Spritemap_Robot_13                                                ;A8CA57;
    dw $0005                                                             ;A8CA59;
    dw Spritemap_Robot_12                                                ;A8CA5B;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA5D;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA5F;
    dw $000A                                                             ;A8CA61;
    dw Spritemap_Robot_11                                                ;A8CA63;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall      ;A8CA65;
    dw $0005                                                             ;A8CA67;
    dw Spritemap_Robot_10                                                ;A8CA69;
    dw $0005                                                             ;A8CA6B;
    dw Spritemap_Robot_F                                                 ;A8CA6D;
    dw $0005                                                             ;A8CA6F;
    dw Spritemap_Robot_E                                                 ;A8CA71;
    dw $0005                                                             ;A8CA73;
    dw Spritemap_Robot_D                                                 ;A8CA75;
    dw $0005                                                             ;A8CA77;
    dw Spritemap_Robot_C                                                 ;A8CA79;
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards                 ;A8CA7B;

InstList_Robot_FacingRight_Shot_SamusIsBehind:
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CA7D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA7F;
    dw $0005                                                             ;A8CA81;
    dw Spritemap_Robot_C                                                 ;A8CA83;
    dw $0005                                                             ;A8CA85;
    dw Spritemap_Robot_D                                                 ;A8CA87;
    dw $0005                                                             ;A8CA89;
    dw Spritemap_Robot_E                                                 ;A8CA8B;
    dw $0005                                                             ;A8CA8D;
    dw Spritemap_Robot_F                                                 ;A8CA8F;
    dw $0005                                                             ;A8CA91;
    dw Spritemap_Robot_10                                                ;A8CA93;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA95;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CA97;
    dw $0005                                                             ;A8CA99;
    dw Spritemap_Robot_11                                                ;A8CA9B;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CA9D;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CA9F;
    dw $0005                                                             ;A8CAA1;
    dw Spritemap_Robot_12                                                ;A8CAA3;
    dw $0005                                                             ;A8CAA5;
    dw Spritemap_Robot_13                                                ;A8CAA7;
    dw $0005                                                             ;A8CAA9;
    dw Spritemap_Robot_14                                                ;A8CAAB;
    dw $0005                                                             ;A8CAAD;
    dw Spritemap_Robot_15                                                ;A8CAAF;
    dw $0005                                                             ;A8CAB1;
    dw Spritemap_Robot_16                                                ;A8CAB3;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CAB5;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CAB7;
    dw $0005                                                             ;A8CAB9;
    dw Spritemap_Robot_17                                                ;A8CABB;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CABD;
    dw $0005                                                             ;A8CABF;
    dw Spritemap_Robot_C                                                 ;A8CAC1;
    dw $0005                                                             ;A8CAC3;
    dw Spritemap_Robot_D                                                 ;A8CAC5;
    dw $0005                                                             ;A8CAC7;
    dw Spritemap_Robot_E                                                 ;A8CAC9;
    dw $0005                                                             ;A8CACB;
    dw Spritemap_Robot_F                                                 ;A8CACD;
    dw $0005                                                             ;A8CACF;
    dw Spritemap_Robot_10                                                ;A8CAD1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CAD3;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CAD5;
    dw $0005                                                             ;A8CAD7;
    dw Spritemap_Robot_11                                                ;A8CAD9;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CADB;
    dw $0005                                                             ;A8CADD;
    dw Spritemap_Robot_12                                                ;A8CADF;
    dw $0005                                                             ;A8CAE1;
    dw Spritemap_Robot_13                                                ;A8CAE3;
    dw $0005                                                             ;A8CAE5;
    dw Spritemap_Robot_14                                                ;A8CAE7;
    dw $0005                                                             ;A8CAE9;
    dw Spritemap_Robot_15                                                ;A8CAEB;
    dw $0005                                                             ;A8CAED;
    dw Spritemap_Robot_16                                                ;A8CAEF;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CAF1;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CAF3;
    dw $0005                                                             ;A8CAF5;
    dw Spritemap_Robot_17                                                ;A8CAF7;
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall       ;A8CAF9;
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards       ;A8CAFB;

InstList_Robot_FacingRight_ShotLaserDownRight:
    dw $0005                                                             ;A8CAFD;
    dw Spritemap_Robot_C                                                 ;A8CAFF;
    dw $0002                                                             ;A8CB01;
    dw Spritemap_Robot_17                                                ;A8CB03;
    dw Instruction_Common_GotoY                                          ;A8CB05;
    dw InstList_Robot_FacingRight_LaserShotRecoil                        ;A8CB07;

InstList_Robot_FacingRight_ShotLaserRight:
    dw $0005                                                             ;A8CB09;
    dw Spritemap_Robot_D                                                 ;A8CB0B;
    dw $0002                                                             ;A8CB0D;
    dw Spritemap_Robot_C                                                 ;A8CB0F;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CB11;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB13;
    dw $000A                                                             ;A8CB15;
    dw Spritemap_Robot_17                                                ;A8CB17;
    dw Instruction_Common_GotoY                                          ;A8CB19;
    dw InstList_Robot_FacingRight_LaserShotRecoil                        ;A8CB1B;

InstList_Robot_FacingRight_ShotLaserUpRight:
    dw $0005                                                             ;A8CB1D;
    dw Spritemap_Robot_F                                                 ;A8CB1F;
    dw $0002                                                             ;A8CB21;
    dw Spritemap_Robot_E                                                 ;A8CB23;
    dw $0002                                                             ;A8CB25;
    dw Spritemap_Robot_D                                                 ;A8CB27;
    dw $0004                                                             ;A8CB29;
    dw Spritemap_Robot_C                                                 ;A8CB2B;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CB2D;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB2F;
    dw $0004                                                             ;A8CB31;
    dw Spritemap_Robot_17                                                ;A8CB33;

InstList_Robot_FacingRight_LaserShotRecoil:
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB35;
    dw $0010                                                             ;A8CB37;
    dw Spritemap_Robot_16                                                ;A8CB39;
    dw $0005                                                             ;A8CB3B;
    dw Spritemap_Robot_15                                                ;A8CB3D;
    dw $0005                                                             ;A8CB3F;
    dw Spritemap_Robot_14                                                ;A8CB41;
    dw $0005                                                             ;A8CB43;
    dw Spritemap_Robot_13                                                ;A8CB45;
    dw $0005                                                             ;A8CB47;
    dw Spritemap_Robot_12                                                ;A8CB49;
    dw Instruction_Robot_PlaySFXIfOnScreen                               ;A8CB4B;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB4D;
    dw $000A                                                             ;A8CB4F;
    dw Spritemap_Robot_11                                                ;A8CB51;
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall       ;A8CB53;
    dw $000A                                                             ;A8CB55;
    dw Spritemap_Robot_10                                                ;A8CB57;
    dw $000A                                                             ;A8CB59;
    dw Spritemap_Robot_F                                                 ;A8CB5B;
    dw $0060                                                             ;A8CB5D;
    dw Spritemap_Robot_E                                                 ;A8CB5F;
    dw Instruction_Common_GotoY                                          ;A8CB61;
    dw InstList_Robot_FacingRight_WalkingForwards_0                      ;A8CB63;

InstList_Robot_ApproachingAFallToTheLeft:
    dw $0080                                                             ;A8CB65;
    dw Spritemap_Robot_0                                                 ;A8CB67;
    dw $000A                                                             ;A8CB69;
    dw Spritemap_Robot_1                                                 ;A8CB6B;
    dw $000A                                                             ;A8CB6D;
    dw Spritemap_Robot_2                                                 ;A8CB6F;
    dw Instruction_Robot_DecrementLaserCooldown                          ;A8CB71;
    dw Instruction_Common_GotoY                                          ;A8CB73;
    dw InstList_Robot_FacingRight_WalkingForwards_0                      ;A8CB75;

InitAI_Robot:
    LDX.W $079F                                                          ;A8CB77;
    LDA.L $7ED828,X                                                      ;A8CB7A;
    BIT.W #$0001                                                         ;A8CB7E;
    BEQ InitAI_RobotNoPower                                              ;A8CB81;
    LDX.W $0E54                                                          ;A8CB83;
    SEP #$20                                                             ;A8CB86;
    LDA.B #EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes>>16    ;A8CB88;
    STA.W $178E                                                          ;A8CB8A;
    REP #$20                                                             ;A8CB8D;
    LDA.W #EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes        ;A8CB8F;
    STA.W $178C                                                          ;A8CB92;
    LDA.W EnemyData.properties,X                                         ;A8CB95;
    ORA.W #$A000                                                         ;A8CB98;
    STA.W EnemyData.properties,X                                         ;A8CB9B;
    LDA.W #$0004                                                         ;A8CB9E;
    STA.W EnemyData.instTimer,X                                          ;A8CBA1;
    STZ.W EnemyData.loopCounter,X                                        ;A8CBA4;
    LDA.W #InstList_Robot_Initial                                        ;A8CBA7;
    STA.W EnemyData.pInstList,X                                          ;A8CBAA;
    LDA.W #$FE00                                                         ;A8CBAD;
    STA.W EnemyData.work0,X                                              ;A8CBB0;
    LDA.W #$0001                                                         ;A8CBB3;
    STA.L $7ED654                                                        ;A8CBB6;
    LDA.W #$0000                                                         ;A8CBBA;
    STA.L $7ED656                                                        ;A8CBBD;
    STA.W EnemyData.work1,X                                              ;A8CBC1;
    LDA.W EnemyData.palette,X                                            ;A8CBC4;
    STA.L $7ED652                                                        ;A8CBC7;
    RTL                                                                  ;A8CBCB;


InitAI_RobotNoPower:
    LDX.W $0E54                                                          ;A8CBCC;
    LDA.W EnemyData.initParam0,X                                         ;A8CBCF;
    CMP.W #$0000                                                         ;A8CBD2;
    BMI .zeroParam1                                                      ;A8CBD5;
    CMP.W #$0004                                                         ;A8CBD7;
    BMI .valid                                                           ;A8CBDA;

.zeroParam1:
    LDA.W #$0000                                                         ;A8CBDC;

.valid:
    STA.W EnemyData.initParam0,X                                         ;A8CBDF;
    ASL A                                                                ;A8CBE2;
    TAY                                                                  ;A8CBE3;
    LDA.W .pointers,Y                                                    ;A8CBE4;
    STA.W EnemyData.pInstList,X                                          ;A8CBE7;
    LDA.W EnemyData.properties,X                                         ;A8CBEA;
    ORA.W #$8000                                                         ;A8CBED;
    STA.W EnemyData.properties,X                                         ;A8CBF0;
    LDA.W #$0001                                                         ;A8CBF3;
    STA.W EnemyData.instTimer,X                                          ;A8CBF6;
    STZ.W EnemyData.loopCounter,X                                        ;A8CBF9;
    LDA.W #$0000                                                         ;A8CBFC;
    STA.L $7ED654                                                        ;A8CBFF;
    LDA.W #$0000                                                         ;A8CC03;
    STA.W EnemyData.work4,X                                              ;A8CC06;
    LDA.W #$0001                                                         ;A8CC09;
    STA.W EnemyData.work5,X                                              ;A8CC0C;
    LDA.L $7ED652                                                        ;A8CC0F;
    AND.W #$FF00                                                         ;A8CC13;
    XBA                                                                  ;A8CC16;
    ASL A                                                                ;A8CC17;
    ASL A                                                                ;A8CC18;
    ASL A                                                                ;A8CC19;
    ASL A                                                                ;A8CC1A;
    TAX                                                                  ;A8CC1B;
    LDA.W #$000A                                                         ;A8CC1C;
    STA.L $7EC112,X                                                      ;A8CC1F;
    STA.L $7EC114,X                                                      ;A8CC23;
    STA.L $7EC116,X                                                      ;A8CC27;
    STA.L $7EC118,X                                                      ;A8CC2B;
    RTL                                                                  ;A8CC2F;


.pointers:
    dw InstList_RobotNoPower_Neutral                                     ;A8CC30;
    dw InstList_RobotNoPower_LeaningLeft                                 ;A8CC32;
    dw InstList_RobotNoPower_LeaningRIght                                ;A8CC34;

MainAI_Robot:
    LDX.W $0E54                                                          ;A8CC36;
    LDA.W EnemyData.work4,X                                              ;A8CC39;
    STA.B $12                                                            ;A8CC3C;
    LDA.W EnemyData.work5,X                                              ;A8CC3E;
    STA.B $14                                                            ;A8CC41;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8CC43;
    BCS RTL_A8CC66                                                       ;A8CC47;
    LDX.W $0E54                                                          ;A8CC49;
    LDA.W EnemyData.instTimer,X                                          ;A8CC4C;
    INC A                                                                ;A8CC4F;
    STA.W EnemyData.instTimer,X                                          ;A8CC50;
    LDA.W EnemyData.work4,X                                              ;A8CC53;
    CLC                                                                  ;A8CC56;
    ADC.W #$8000                                                         ;A8CC57;
    STA.W EnemyData.work4,X                                              ;A8CC5A;
    LDA.W EnemyData.work5,X                                              ;A8CC5D;
    ADC.W #$0000                                                         ;A8CC60;
    STA.W EnemyData.work5,X                                              ;A8CC63; fallthrough to MainAI_RobotNoPower

RTL_A8CC66:
    RTL                                                                  ;A8CC66;


EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes:
    LDA.W $0797                                                          ;A8CC67;
    BNE .return                                                          ;A8CC6A;
    LDA.L $7ED654                                                        ;A8CC6C;
    BEQ .return                                                          ;A8CC70;
    DEC A                                                                ;A8CC72;
    STA.L $7ED654                                                        ;A8CC73;
    BNE .return                                                          ;A8CC77;
    PHX                                                                  ;A8CC79;
    LDA.L $7ED652                                                        ;A8CC7A;
    AND.W #$FF00                                                         ;A8CC7E;
    XBA                                                                  ;A8CC81;
    ASL A                                                                ;A8CC82;
    ASL A                                                                ;A8CC83;
    ASL A                                                                ;A8CC84;
    ASL A                                                                ;A8CC85;
    TAX                                                                  ;A8CC86;
    LDA.L $7ED656                                                        ;A8CC87;
    TAY                                                                  ;A8CC8B;

.again:
    LDA.W .paletteColor9,Y                                               ;A8CC8C;
    BMI .zero                                                            ;A8CC8F;
    STA.L $7EC112,X                                                      ;A8CC91;
    LDA.W .paletteColorA,Y                                               ;A8CC95;
    STA.L $7EC114,X                                                      ;A8CC98;
    LDA.W .paletteColorB,Y                                               ;A8CC9C;
    STA.L $7EC116,X                                                      ;A8CC9F;
    LDA.W .paletteColorC,Y                                               ;A8CCA3;
    STA.L $7EC118,X                                                      ;A8CCA6;
    LDA.W .timer,Y                                                       ;A8CCAA;
    STA.L $7ED654                                                        ;A8CCAD;
    TYA                                                                  ;A8CCB1;
    CLC                                                                  ;A8CCB2;
    ADC.W #$000A                                                         ;A8CCB3;
    STA.L $7ED656                                                        ;A8CCB6;
    PLX                                                                  ;A8CCBA;

.return:
    RTL                                                                  ;A8CCBB;


.zero:
    LDY.W #$0000                                                         ;A8CCBC;
    BRA .again                                                           ;A8CCBF;


.paletteColor9:
    dw $001F                                                             ;A8CCC1;

.paletteColorA:
    dw $0018                                                             ;A8CCC3;

.paletteColorB:
    dw $000F                                                             ;A8CCC5;

.paletteColorC:
    dw $0008                                                             ;A8CCC7;

.timer:
    dw $0040,$0018,$000F,$0008,$001F,$0010,$000F,$0008                   ;A8CCC9;
    dw $001F,$0018,$0010,$0008,$001F,$0018,$000F,$0040                   ;A8CCD9;
    dw $000F,$0008,$001F,$0018,$0010,$0018,$000F,$0008                   ;A8CCE9;
    dw $001F,$0010,$FFFF                                                 ;A8CCF9;

DecrementRobotLaserCooldown:
    LDA.W EnemyData.work1,X                                              ;A8CCFF;
    BEQ .return                                                          ;A8CD02;
    DEC A                                                                ;A8CD04;
    STA.W EnemyData.work1,X                                              ;A8CD05;

.return:
    RTS                                                                  ;A8CD08;


Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall:
    PHX                                                                  ;A8CD09;
    PHY                                                                  ;A8CD0A;
    LDX.W $0E54                                                          ;A8CD0B;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CD0E;
    LDA.W #$FE00                                                         ;A8CD11;
    STA.W EnemyData.work0,X                                              ;A8CD14;
    LDA.W #$0000                                                         ;A8CD17;
    STA.B $12                                                            ;A8CD1A;
    LDA.W #$FFFC                                                         ;A8CD1C;
    STA.B $14                                                            ;A8CD1F;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CD21;
    BCC .notCollidedWithWall                                             ;A8CD25;
    LDA.W EnemyData.work1,X                                              ;A8CD27;
    CLC                                                                  ;A8CD2A;
    ADC.W #$0008                                                         ;A8CD2B;
    STA.W EnemyData.work1,X                                              ;A8CD2E;
    PLY                                                                  ;A8CD31;
    LDY.W #InstList_Robot_FacingLeft_HitWallMovingForwards               ;A8CD32;
    PLX                                                                  ;A8CD35;
    RTL                                                                  ;A8CD36;


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CD37;
    AND.W #$FFFF                                                         ;A8CD3B;
    BEQ .notTouchingSamusFromBelow                                       ;A8CD3E;
    LDA.W #$0000                                                         ;A8CD40;
    STA.W $0B56                                                          ;A8CD43;
    LDA.W #$FFFC                                                         ;A8CD46;
    STA.W $0B58                                                          ;A8CD49;

.notTouchingSamusFromBelow:
    LDA.W EnemyData.yPosition,X                                          ;A8CD4C;
    STA.W EnemyData.work3,X                                              ;A8CD4F;
    LDA.W EnemyData.xPosition,X                                          ;A8CD52;
    STA.W EnemyData.work2,X                                              ;A8CD55;
    SEC                                                                  ;A8CD58;
    SBC.W EnemyData.xHitboxRadius,X                                      ;A8CD59;
    SEC                                                                  ;A8CD5C;
    SBC.W EnemyData.xHitboxRadius,X                                      ;A8CD5D;
    STA.W EnemyData.xPosition,X                                          ;A8CD60;
    STZ.B $12                                                            ;A8CD63;
    LDA.W #$0001                                                         ;A8CD65;
    STA.B $14                                                            ;A8CD68;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8CD6A;
    BCS .collidedWithBlock                                               ;A8CD6E;
    LDA.W EnemyData.work1,X                                              ;A8CD70;
    CLC                                                                  ;A8CD73;
    ADC.W #$0008                                                         ;A8CD74;
    STA.W EnemyData.work1,X                                              ;A8CD77;
    LDA.W EnemyData.work2,X                                              ;A8CD7A;
    STA.W EnemyData.xPosition,X                                          ;A8CD7D;
    LDA.W EnemyData.work3,X                                              ;A8CD80;
    STA.W EnemyData.yPosition,X                                          ;A8CD83;
    PLY                                                                  ;A8CD86;
    LDX.W $0E54                                                          ;A8CD87;
    LDA.W #$0200                                                         ;A8CD8A;
    STA.W EnemyData.work0,X                                              ;A8CD8D;
    LDY.W #InstList_Robot_ApproachingAFallToTheLeft                      ;A8CD90;
    PLX                                                                  ;A8CD93;
    RTL                                                                  ;A8CD94;


.collidedWithBlock:
    LDA.W EnemyData.work2,X                                              ;A8CD95;
    STA.W EnemyData.xPosition,X                                          ;A8CD98;
    LDA.W EnemyData.work3,X                                              ;A8CD9B;
    STA.W EnemyData.yPosition,X                                          ;A8CD9E;
    PLY                                                                  ;A8CDA1;
    PLX                                                                  ;A8CDA2;
    RTL                                                                  ;A8CDA3;


Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall:
    PHX                                                                  ;A8CDA4;
    PHY                                                                  ;A8CDA5;
    LDX.W $0E54                                                          ;A8CDA6;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CDA9;
    LDA.W #$FE00                                                         ;A8CDAC;
    STA.W EnemyData.work0,X                                              ;A8CDAF;
    LDA.W #$0000                                                         ;A8CDB2;
    STA.B $12                                                            ;A8CDB5;
    LDA.W #$FFFC                                                         ;A8CDB7;
    STA.B $14                                                            ;A8CDBA;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CDBC;
    BCC .notCollidedWtihWall                                             ;A8CDC0;
    LDA.W EnemyData.work1,X                                              ;A8CDC2;
    CLC                                                                  ;A8CDC5;
    ADC.W #$0008                                                         ;A8CDC6;
    STA.W EnemyData.work1,X                                              ;A8CDC9;
    PLY                                                                  ;A8CDCC;
    LDY.W #InstList_Robot_FacingLeft_HitWallMovingForwards               ;A8CDCD;
    PLX                                                                  ;A8CDD0;
    RTL                                                                  ;A8CDD1;


.notCollidedWtihWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CDD2;
    AND.W #$FFFF                                                         ;A8CDD6;
    BEQ .return                                                          ;A8CDD9;
    LDA.W #$0000                                                         ;A8CDDB;
    STA.W $0B56                                                          ;A8CDDE;
    LDA.W #$FFFC                                                         ;A8CDE1;
    STA.W $0B58                                                          ;A8CDE4;

.return:
    PLY                                                                  ;A8CDE7;
    PLX                                                                  ;A8CDE8;
    RTL                                                                  ;A8CDE9;


Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall:
    PHX                                                                  ;A8CDEA;
    PHY                                                                  ;A8CDEB;
    LDX.W $0E54                                                          ;A8CDEC;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CDEF;
    LDA.W #$FE00                                                         ;A8CDF2;
    STA.W EnemyData.work0,X                                              ;A8CDF5;
    LDA.W #$0000                                                         ;A8CDF8;
    STA.B $12                                                            ;A8CDFB;
    LDA.W #$0004                                                         ;A8CDFD;
    STA.B $14                                                            ;A8CE00;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CE02;
    BCC .notCollidedWithWall                                             ;A8CE06;
    LDA.W EnemyData.work1,X                                              ;A8CE08;
    CLC                                                                  ;A8CE0B;
    ADC.W #$0008                                                         ;A8CE0C;
    STA.W EnemyData.work1,X                                              ;A8CE0F;
    PLY                                                                  ;A8CE12;
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8CE13;
    PLX                                                                  ;A8CE16;
    RTL                                                                  ;A8CE17;


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CE18;
    AND.W #$FFFF                                                         ;A8CE1C;
    BEQ .notTouchingSamusFromBelow                                       ;A8CE1F;
    LDA.W #$0000                                                         ;A8CE21;
    STA.W $0B56                                                          ;A8CE24;
    LDA.W #$0004                                                         ;A8CE27;
    STA.W $0B58                                                          ;A8CE2A;

.notTouchingSamusFromBelow:
    LDA.W EnemyData.yPosition,X                                          ;A8CE2D;
    STA.W EnemyData.work3,X                                              ;A8CE30;
    LDA.W EnemyData.xPosition,X                                          ;A8CE33;
    STA.W EnemyData.work2,X                                              ;A8CE36;
    CLC                                                                  ;A8CE39;
    ADC.W EnemyData.xHitboxRadius,X                                      ;A8CE3A;
    CLC                                                                  ;A8CE3D;
    ADC.W EnemyData.xHitboxRadius,X                                      ;A8CE3E;
    STA.W EnemyData.xPosition,X                                          ;A8CE41;
    STZ.B $12                                                            ;A8CE44;
    LDA.W #$0001                                                         ;A8CE46;
    STA.B $14                                                            ;A8CE49;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8CE4B;
    BCS .collidedWithBlock                                               ;A8CE4F;
    LDA.W EnemyData.work1,X                                              ;A8CE51;
    CLC                                                                  ;A8CE54;
    ADC.W #$0008                                                         ;A8CE55;
    STA.W EnemyData.work1,X                                              ;A8CE58;
    LDA.W EnemyData.work2,X                                              ;A8CE5B;
    STA.W EnemyData.xPosition,X                                          ;A8CE5E;
    LDA.W EnemyData.work3,X                                              ;A8CE61;
    STA.W EnemyData.yPosition,X                                          ;A8CE64;
    PLY                                                                  ;A8CE67;
    LDX.W $0E54                                                          ;A8CE68;
    LDA.W #$FE00                                                         ;A8CE6B;
    STA.W EnemyData.work0,X                                              ;A8CE6E;
    LDY.W #InstList_Robot_ApproachingAFallToTheRight                     ;A8CE71;
    PLX                                                                  ;A8CE74;
    RTL                                                                  ;A8CE75;


.collidedWithBlock:
    LDA.W EnemyData.work2,X                                              ;A8CE76;
    STA.W EnemyData.xPosition,X                                          ;A8CE79;
    LDA.W EnemyData.work3,X                                              ;A8CE7C;
    STA.W EnemyData.yPosition,X                                          ;A8CE7F;
    PLY                                                                  ;A8CE82;
    PLX                                                                  ;A8CE83;
    RTL                                                                  ;A8CE84;


Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall:
    PHX                                                                  ;A8CE85;
    PHY                                                                  ;A8CE86;
    LDX.W $0E54                                                          ;A8CE87;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CE8A;
    LDA.W #$FE00                                                         ;A8CE8D;
    STA.W EnemyData.work0,X                                              ;A8CE90;
    LDA.W #$0000                                                         ;A8CE93;
    STA.B $12                                                            ;A8CE96;
    LDA.W #$0004                                                         ;A8CE98;
    STA.B $14                                                            ;A8CE9B;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CE9D;
    BCC .notCollidedWithWall                                             ;A8CEA1;
    LDA.W EnemyData.work1,X                                              ;A8CEA3;
    CLC                                                                  ;A8CEA6;
    ADC.W #$0008                                                         ;A8CEA7;
    STA.W EnemyData.work1,X                                              ;A8CEAA;
    PLY                                                                  ;A8CEAD;
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8CEAE;
    PLX                                                                  ;A8CEB1;
    RTL                                                                  ;A8CEB2;


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CEB3;
    AND.W #$FFFF                                                         ;A8CEB7;
    BEQ .return                                                          ;A8CEBA;
    LDA.W #$0000                                                         ;A8CEBC;
    STA.W $0B56                                                          ;A8CEBF;
    LDA.W #$0004                                                         ;A8CEC2;
    STA.W $0B58                                                          ;A8CEC5;

.return:
    PLY                                                                  ;A8CEC8;
    PLX                                                                  ;A8CEC9;
    RTL                                                                  ;A8CECA;


Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards:
    LDY.W #InstList_Robot_FacingRight_WalkingForwards_0                  ;A8CECB;
    RTL                                                                  ;A8CECE;


Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall:
    PHX                                                                  ;A8CECF;
    PHY                                                                  ;A8CED0;
    LDX.W $0E54                                                          ;A8CED1;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CED4;
    LDA.W #$0200                                                         ;A8CED7;
    STA.W EnemyData.work0,X                                              ;A8CEDA;
    LDA.W #$0000                                                         ;A8CEDD;
    STA.B $12                                                            ;A8CEE0;
    LDA.W #$0004                                                         ;A8CEE2;
    STA.B $14                                                            ;A8CEE5;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CEE7;
    BCC .notCollidedWithWall                                             ;A8CEEB;
    LDA.W EnemyData.work1,X                                              ;A8CEED;
    CLC                                                                  ;A8CEF0;
    ADC.W #$0008                                                         ;A8CEF1;
    STA.W EnemyData.work1,X                                              ;A8CEF4;
    PLY                                                                  ;A8CEF7;
    LDY.W #InstList_Robot_FacingRight_HitWallMovingForwards              ;A8CEF8;
    PLX                                                                  ;A8CEFB;
    RTL                                                                  ;A8CEFC;


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CEFD;
    AND.W #$FFFF                                                         ;A8CF01;
    BEQ .notTouchingSamusFromBelow                                       ;A8CF04;
    LDA.W #$0000                                                         ;A8CF06;
    STA.W $0B56                                                          ;A8CF09;
    LDA.W #$0004                                                         ;A8CF0C;
    STA.W $0B58                                                          ;A8CF0F;

.notTouchingSamusFromBelow:
    LDA.W EnemyData.yPosition,X                                          ;A8CF12;
    STA.W EnemyData.work3,X                                              ;A8CF15;
    LDA.W EnemyData.xPosition,X                                          ;A8CF18;
    STA.W EnemyData.work2,X                                              ;A8CF1B;
    CLC                                                                  ;A8CF1E;
    ADC.W EnemyData.xHitboxRadius,X                                      ;A8CF1F;
    CLC                                                                  ;A8CF22;
    ADC.W EnemyData.xHitboxRadius,X                                      ;A8CF23;
    STA.W EnemyData.xPosition,X                                          ;A8CF26;
    STZ.B $12                                                            ;A8CF29;
    LDA.W #$0001                                                         ;A8CF2B;
    STA.B $14                                                            ;A8CF2E;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8CF30;
    BCS .collidedWithBlock                                               ;A8CF34;
    LDA.W EnemyData.work1,X                                              ;A8CF36;
    CLC                                                                  ;A8CF39;
    ADC.W #$0008                                                         ;A8CF3A;
    STA.W EnemyData.work1,X                                              ;A8CF3D;
    LDA.W EnemyData.work2,X                                              ;A8CF40;
    STA.W EnemyData.xPosition,X                                          ;A8CF43;
    LDA.W EnemyData.work3,X                                              ;A8CF46;
    STA.W EnemyData.yPosition,X                                          ;A8CF49;
    PLY                                                                  ;A8CF4C;
    LDX.W $0E54                                                          ;A8CF4D;
    LDA.W #$FE00                                                         ;A8CF50;
    STA.W EnemyData.work0,X                                              ;A8CF53;
    LDY.W #InstList_Robot_ApproachingAFallToTheRight                     ;A8CF56;
    PLX                                                                  ;A8CF59;
    RTL                                                                  ;A8CF5A;


.collidedWithBlock:
    LDA.W EnemyData.work2,X                                              ;A8CF5B;
    STA.W EnemyData.xPosition,X                                          ;A8CF5E;
    LDA.W EnemyData.work3,X                                              ;A8CF61;
    STA.W EnemyData.yPosition,X                                          ;A8CF64;
    PLY                                                                  ;A8CF67;
    PLX                                                                  ;A8CF68;
    RTL                                                                  ;A8CF69;


Instruction_Robot_FacingRight_MoveForward_HandleHittingWall:
    PHX                                                                  ;A8CF6A;
    PHY                                                                  ;A8CF6B;
    LDX.W $0E54                                                          ;A8CF6C;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CF6F;
    LDA.W #$0200                                                         ;A8CF72;
    STA.W EnemyData.work0,X                                              ;A8CF75;
    LDA.W #$0000                                                         ;A8CF78;
    STA.B $12                                                            ;A8CF7B;
    LDA.W #$0004                                                         ;A8CF7D;
    STA.B $14                                                            ;A8CF80;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CF82;
    BCC .notCollidedWithWall                                             ;A8CF86;
    LDA.W EnemyData.work1,X                                              ;A8CF88;
    CLC                                                                  ;A8CF8B;
    ADC.W #$0008                                                         ;A8CF8C;
    STA.W EnemyData.work1,X                                              ;A8CF8F;
    PLY                                                                  ;A8CF92;
    LDY.W #InstList_Robot_FacingRight_HitWallMovingForwards              ;A8CF93;
    PLX                                                                  ;A8CF96;
    RTL                                                                  ;A8CF97;


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CF98;
    AND.W #$FFFF                                                         ;A8CF9C;
    BEQ .return                                                          ;A8CF9F;
    LDA.W #$0000                                                         ;A8CFA1;
    STA.W $0B56                                                          ;A8CFA4;
    LDA.W #$0004                                                         ;A8CFA7;
    STA.W $0B58                                                          ;A8CFAA;

.return:
    PLY                                                                  ;A8CFAD;
    PLX                                                                  ;A8CFAE;
    RTL                                                                  ;A8CFAF;


Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall:
    PHX                                                                  ;A8CFB0;
    PHY                                                                  ;A8CFB1;
    LDX.W $0E54                                                          ;A8CFB2;
    JSR.W DecrementRobotLaserCooldown                                    ;A8CFB5;
    LDA.W #$0200                                                         ;A8CFB8;
    STA.W EnemyData.work0,X                                              ;A8CFBB;
    LDA.W #$0000                                                         ;A8CFBE;
    STA.B $12                                                            ;A8CFC1;
    LDA.W #$FFFC                                                         ;A8CFC3;
    STA.B $14                                                            ;A8CFC6;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8CFC8;
    BCC .notCollidedWithWall                                             ;A8CFCC;
    LDA.W EnemyData.work1,X                                              ;A8CFCE;
    CLC                                                                  ;A8CFD1;
    ADC.W #$0008                                                         ;A8CFD2;
    STA.W EnemyData.work1,X                                              ;A8CFD5;
    PLY                                                                  ;A8CFD8;
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8CFD9;
    PLX                                                                  ;A8CFDC;
    RTL                                                                  ;A8CFDD;


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8CFDE;
    AND.W #$FFFF                                                         ;A8CFE2;
    BEQ .notTouchingSamusFromBelow                                       ;A8CFE5;
    LDA.W #$0000                                                         ;A8CFE7;
    STA.W $0B56                                                          ;A8CFEA;
    LDA.W #$FFFC                                                         ;A8CFED;
    STA.W $0B58                                                          ;A8CFF0;

.notTouchingSamusFromBelow:
    LDA.W EnemyData.yPosition,X                                          ;A8CFF3;
    STA.W EnemyData.work3,X                                              ;A8CFF6;
    LDA.W EnemyData.xPosition,X                                          ;A8CFF9;
    STA.W EnemyData.work2,X                                              ;A8CFFC;
    SEC                                                                  ;A8CFFF;
    SBC.W EnemyData.xHitboxRadius,X                                      ;A8D000;
    SEC                                                                  ;A8D003;
    SBC.W EnemyData.xHitboxRadius,X                                      ;A8D004;
    STA.W EnemyData.xPosition,X                                          ;A8D007;
    STZ.B $12                                                            ;A8D00A;
    LDA.W #$0001                                                         ;A8D00C;
    STA.B $14                                                            ;A8D00F;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8D011;
    BCS .collidedWithBlock                                               ;A8D015;
    LDA.W EnemyData.work1,X                                              ;A8D017;
    CLC                                                                  ;A8D01A;
    ADC.W #$0008                                                         ;A8D01B;
    STA.W EnemyData.work1,X                                              ;A8D01E;
    LDA.W EnemyData.work3,X                                              ;A8D021;
    STA.W EnemyData.yPosition,X                                          ;A8D024;
    LDA.W EnemyData.work2,X                                              ;A8D027;
    STA.W EnemyData.xPosition,X                                          ;A8D02A;
    PLY                                                                  ;A8D02D;
    LDX.W $0E54                                                          ;A8D02E;
    LDA.W #$0200                                                         ;A8D031;
    STA.W EnemyData.work0,X                                              ;A8D034;
    LDY.W #InstList_Robot_ApproachingAFallToTheLeft                      ;A8D037;
    PLX                                                                  ;A8D03A;
    RTL                                                                  ;A8D03B;


.collidedWithBlock:
    LDA.W EnemyData.work3,X                                              ;A8D03C;
    STA.W EnemyData.yPosition,X                                          ;A8D03F;
    LDA.W EnemyData.work2,X                                              ;A8D042;
    STA.W EnemyData.xPosition,X                                          ;A8D045;
    PLY                                                                  ;A8D048;
    PLX                                                                  ;A8D049;
    RTL                                                                  ;A8D04A;


Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall:
    PHX                                                                  ;A8D04B;
    PHY                                                                  ;A8D04C;
    LDX.W $0E54                                                          ;A8D04D;
    JSR.W DecrementRobotLaserCooldown                                    ;A8D050;
    LDA.W #$0200                                                         ;A8D053;
    STA.W EnemyData.work0,X                                              ;A8D056;
    LDA.W #$0000                                                         ;A8D059;
    STA.B $12                                                            ;A8D05C;
    LDA.W #$FFFC                                                         ;A8D05E;
    STA.B $14                                                            ;A8D061;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8D063;
    BCC .notCollidedWithWall                                             ;A8D067;
    LDA.W EnemyData.work1,X                                              ;A8D069;
    CLC                                                                  ;A8D06C;
    ADC.W #$0008                                                         ;A8D06D;
    STA.W EnemyData.work1,X                                              ;A8D070;
    PLY                                                                  ;A8D073;
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8D074;
    PLX                                                                  ;A8D077;
    RTL                                                                  ;A8D078;


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow                           ;A8D079;
    AND.W #$FFFF                                                         ;A8D07D;
    BEQ .return                                                          ;A8D080;
    LDA.W #$0000                                                         ;A8D082;
    STA.W $0B56                                                          ;A8D085;
    LDA.W #$FFFC                                                         ;A8D088;
    STA.W $0B58                                                          ;A8D08B;

.return:
    PLY                                                                  ;A8D08E;
    PLX                                                                  ;A8D08F;
    RTL                                                                  ;A8D090;


Instruction_Robot_PlaySFXIfOnScreen:
    PHX                                                                  ;A8D091;
    PHY                                                                  ;A8D092;
    LDX.W $0E54                                                          ;A8D093;
    LDA.W $0911                                                          ;A8D096;
    CMP.W EnemyData.xPosition,X                                          ;A8D099;
    BPL .return                                                          ;A8D09C;
    CLC                                                                  ;A8D09E;
    ADC.W #$0100                                                         ;A8D09F;
    CMP.W EnemyData.xPosition,X                                          ;A8D0A2;
    BMI .return                                                          ;A8D0A5;
    LDA.W $0915                                                          ;A8D0A7;
    CMP.W EnemyData.yPosition,X                                          ;A8D0AA;
    BPL .return                                                          ;A8D0AD;
    CLC                                                                  ;A8D0AF;
    ADC.W #$00E0                                                         ;A8D0B0;
    CMP.W EnemyData.yPosition,X                                          ;A8D0B3;
    BMI .return                                                          ;A8D0B6;
    LDA.W #$0068                                                         ;A8D0B8;
    JSL.L QueueSound_Lib2_Max6                                           ;A8D0BB;

.return:
    PLY                                                                  ;A8D0BF;
    PLX                                                                  ;A8D0C0;
    RTL                                                                  ;A8D0C1;


Instruction_Robot_Goto_FacingLeft_WalkingForwards:
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0                   ;A8D0C2;
    RTL                                                                  ;A8D0C5;


Instruction_Robot_TryShootingLaserUpRight:
    LDA.W #InstList_Robot_FacingRight_ShotLaserUpRight                   ;A8D0C6;
    STA.B $32                                                            ;A8D0C9;
    LDA.W #EnemyProjectile_RobotLaser_UpRight                            ;A8D0CB;
    STA.B $30                                                            ;A8D0CE;
    BRA HandleFiringLaser_Upwards                                        ;A8D0D0;


Instruction_Robot_TryShootingLaserUpLeft:
    LDA.W #InstList_Robot_FacingLeft_ShotLaserUpLeft                     ;A8D0D2;
    STA.B $32                                                            ;A8D0D5;
    LDA.W #EnemyProjectile_RobotLaser_UpLeft                             ;A8D0D7;
    STA.B $30                                                            ;A8D0DA; fallthrough to HandleFiringLaser_Upwards

HandleFiringLaser_Upwards:
    LDA.W EnemyData.work1,X                                              ;A8D0DC;
    BNE .timerNotExpired                                                 ;A8D0DF;
    LDA.W $05E5                                                          ;A8D0E1;
    AND.W #$001F                                                         ;A8D0E4;
    CLC                                                                  ;A8D0E7;
    ADC.W #$0010                                                         ;A8D0E8;
    STA.W EnemyData.work1,X                                              ;A8D0EB;
    PHX                                                                  ;A8D0EE;
    LDY.B $30                                                            ;A8D0EF;
    LDX.W $0E54                                                          ;A8D0F1;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8D0F4;
    PLX                                                                  ;A8D0F8;
    LDY.B $32                                                            ;A8D0F9;
    RTL                                                                  ;A8D0FB;


.timerNotExpired:
    JSR.W DecrementRobotLaserCooldown                                    ;A8D0FC;
    RTL                                                                  ;A8D0FF;


Instruction_Robot_TryShootingLaserRight:
    LDA.W #InstList_Robot_FacingRight_ShotLaserRight                     ;A8D100;
    STA.B $32                                                            ;A8D103;
    BRA HandleFiringLaser_Horizontal                                     ;A8D105;


Instruction_Robot_TryShootingLaserLeft:
    LDA.W #InstList_Robot_FacingLeft_ShotLaserLeft                       ;A8D107;
    STA.B $32                                                            ;A8D10A;

HandleFiringLaser_Horizontal:
    LDA.W EnemyData.work1,X                                              ;A8D10C;
    BNE .timerNotExpired                                                 ;A8D10F;
    LDA.W $05E5                                                          ;A8D111;
    AND.W #$001F                                                         ;A8D114;
    CLC                                                                  ;A8D117;
    ADC.W #$0010                                                         ;A8D118;
    STA.W EnemyData.work1,X                                              ;A8D11B;
    PHX                                                                  ;A8D11E;
    LDY.W #EnemyProjectile_RobotLaser_Horizontal                         ;A8D11F;
    LDX.W $0E54                                                          ;A8D122;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8D125;
    PLX                                                                  ;A8D129;
    LDY.B $32                                                            ;A8D12A;
    RTL                                                                  ;A8D12C;


.timerNotExpired:
    JSR.W DecrementRobotLaserCooldown                                    ;A8D12D;
    RTL                                                                  ;A8D130;


Instruction_Robot_TryShootingLaserDownRight:
    LDA.W #EnemyProjectile_RobotLaser_DownRight                          ;A8D131;
    STA.B $30                                                            ;A8D134;
    LDA.W #InstList_Robot_FacingRight_ShotLaserDownRight                 ;A8D136;
    STA.B $32                                                            ;A8D139;
    BRA HandleFiringLaser_Downwards                                      ;A8D13B;


Instruction_Robot_TryShootingLaserDownLeft:
    LDA.W #EnemyProjectile_RobotLaser_DownLeft                           ;A8D13D;
    STA.B $30                                                            ;A8D140;
    LDA.W #InstList_Robot_FacingLeft_ShotLaserDownLeft                   ;A8D142;
    STA.B $32                                                            ;A8D145;

HandleFiringLaser_Downwards:
    LDA.W EnemyData.work1,X                                              ;A8D147;
    BNE .timerNotExpired                                                 ;A8D14A;
    LDA.W $05E5                                                          ;A8D14C;
    AND.W #$001F                                                         ;A8D14F;
    CLC                                                                  ;A8D152;
    ADC.W #$0010                                                         ;A8D153;
    STA.W EnemyData.work1,X                                              ;A8D156;
    PHX                                                                  ;A8D159;
    LDY.B $30                                                            ;A8D15A;
    LDX.W $0E54                                                          ;A8D15C;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8D15F;
    LDY.B $32                                                            ;A8D163;
    PLX                                                                  ;A8D165;
    RTL                                                                  ;A8D166;


.timerNotExpired:
    JSR.W DecrementRobotLaserCooldown                                    ;A8D167;
    RTL                                                                  ;A8D16A;


Instruction_Robot_DecrementLaserCooldown:
    PHX                                                                  ;A8D16B;
    LDX.W $0E54                                                          ;A8D16C;
    JSR.W DecrementRobotLaserCooldown                                    ;A8D16F;
    PLX                                                                  ;A8D172;
    RTL                                                                  ;A8D173;


EnemyTouch_Robot:
    LDX.W $0E54                                                          ;A8D174;
    LDA.W EnemyData.xPosition,X                                          ;A8D177;
    CMP.W $0AF6                                                          ;A8D17A;
    BMI .rightOfSamus                                                    ;A8D17D;
    LDA.W #$FFFC                                                         ;A8D17F;
    STA.W $0B58                                                          ;A8D182;
    RTL                                                                  ;A8D185;


.rightOfSamus:
    LDA.W #$0004                                                         ;A8D186;
    STA.W $0B58                                                          ;A8D189;
    RTL                                                                  ;A8D18C;


EnemyShot_RobotNoPower:
    JSL.L NormalEnemyShotAI                                              ;A8D18D;
    RTL                                                                  ;A8D191;


EnemyShot_Robot:
    REP #$30                                                             ;A8D192;
    PHX                                                                  ;A8D194;
    PHY                                                                  ;A8D195;
    LDX.W $079F                                                          ;A8D196;
    LDA.L $7ED828,X                                                      ;A8D199;
    BIT.W #$0001                                                         ;A8D19D;
    BEQ .return                                                          ;A8D1A0;
    LDX.W $0E54                                                          ;A8D1A2;
    JSL.L NormalEnemyShotAI                                              ;A8D1A5;
    LDX.W $0E54                                                          ;A8D1A9;
    LDA.W EnemyData.health,X                                             ;A8D1AC;
    BEQ .return                                                          ;A8D1AF;
    LDA.W EnemyData.work0,X                                              ;A8D1B1;
    BMI .facingLeft                                                      ;A8D1B4;
    LDA.W $0AF6                                                          ;A8D1B6;
    CMP.W EnemyData.xPosition,X                                          ;A8D1B9;
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
    LDA.W $0AF6                                                          ;A8D1CB;
    CMP.W EnemyData.xPosition,X                                          ;A8D1CE;
    BPL .facingLeft_behind                                               ;A8D1D1;
    LDA.W #InstList_Robot_FacingLeft_Shot_SamusIsAhead                   ;A8D1D3;

.merge:
    STA.W EnemyData.pInstList,X                                          ;A8D1D6;
    LDA.W #$0001                                                         ;A8D1D9;
    STA.W EnemyData.instTimer,X                                          ;A8D1DC;
    LDA.W EnemyData.work1,X                                              ;A8D1DF;
    CLC                                                                  ;A8D1E2;
    ADC.W #$0040                                                         ;A8D1E3;
    STA.W EnemyData.work1,X                                              ;A8D1E6;
    PLY                                                                  ;A8D1E9;
    PLX                                                                  ;A8D1EA;
    RTL                                                                  ;A8D1EB;


.facingLeft_behind:
    LDA.W #InstList_Robot_FacingLeft_Shot_SamusIsBehind                  ;A8D1EC;
    BRA .merge                                                           ;A8D1EF;


Spritemap_Robot_0:
    dw $000C,$8000                                                       ;A8D1F1;
    db $01                                                               ;A8D1F5;
    dw $212E,$81F0                                                       ;A8D1F6;
    db $01                                                               ;A8D1FA;
    dw $212C,$0008                                                       ;A8D1FB;
    db $17                                                               ;A8D1FF;
    dw $2149,$0000                                                       ;A8D200;
    db $17                                                               ;A8D204;
    dw $2148,$8000                                                       ;A8D205;
    db $07                                                               ;A8D209;
    dw $210C,$0000                                                       ;A8D20A;
    db $19                                                               ;A8D20E;
    dw $214B,$01F8                                                       ;A8D20F;
    db $19                                                               ;A8D213;
    dw $214A,$81F8                                                       ;A8D214;
    db $09                                                               ;A8D218;
    dw $210E,$8000                                                       ;A8D219;
    db $F1                                                               ;A8D21D;
    dw $2122,$81F0                                                       ;A8D21E;
    db $F1                                                               ;A8D222;
    dw $2120,$8000                                                       ;A8D223;
    db $E1                                                               ;A8D227;
    dw $2102,$81F0                                                       ;A8D228;
    db $E1                                                               ;A8D22C;
    dw $2100                                                             ;A8D22D;

Spritemap_Robot_1:
    dw $000C,$8001                                                       ;A8D22F;
    db $01                                                               ;A8D233;
    dw $2146,$81F1                                                       ;A8D234;
    db $01                                                               ;A8D238;
    dw $2144,$0003                                                       ;A8D239;
    db $18                                                               ;A8D23D;
    dw $2149,$01FB                                                       ;A8D23E;
    db $18                                                               ;A8D242;
    dw $2148,$81FB                                                       ;A8D243;
    db $08                                                               ;A8D247;
    dw $210C,$0000                                                       ;A8D248;
    db $19                                                               ;A8D24C;
    dw $214B,$01F8                                                       ;A8D24D;
    db $19                                                               ;A8D251;
    dw $214A,$81F8                                                       ;A8D252;
    db $09                                                               ;A8D256;
    dw $210E,$8000                                                       ;A8D257;
    db $F1                                                               ;A8D25B;
    dw $2126,$81F0                                                       ;A8D25C;
    db $F1                                                               ;A8D260;
    dw $2124,$81FF                                                       ;A8D261;
    db $E1                                                               ;A8D265;
    dw $2106,$81EF                                                       ;A8D266;
    db $E1                                                               ;A8D26A;
    dw $2104                                                             ;A8D26B;

Spritemap_Robot_2:
    dw $000C,$8000                                                       ;A8D26D;
    db $01                                                               ;A8D271;
    dw $2146,$81F0                                                       ;A8D272;
    db $01                                                               ;A8D276;
    dw $2144,$01FF                                                       ;A8D277;
    db $19                                                               ;A8D27B;
    dw $2149,$01F7                                                       ;A8D27C;
    db $19                                                               ;A8D280;
    dw $2148,$81F7                                                       ;A8D281;
    db $09                                                               ;A8D285;
    dw $210C,$0001                                                       ;A8D286;
    db $19                                                               ;A8D28A;
    dw $214B,$01F9                                                       ;A8D28B;
    db $19                                                               ;A8D28F;
    dw $214A,$81F9                                                       ;A8D290;
    db $09                                                               ;A8D294;
    dw $210E,$8000                                                       ;A8D295;
    db $F1                                                               ;A8D299;
    dw $2126,$81F0                                                       ;A8D29A;
    db $F1                                                               ;A8D29E;
    dw $2124,$8000                                                       ;A8D29F;
    db $E1                                                               ;A8D2A3;
    dw $2106,$81F0                                                       ;A8D2A4;
    db $E1                                                               ;A8D2A8;
    dw $2104                                                             ;A8D2A9;

Spritemap_Robot_3:
    dw $000C,$81FF                                                       ;A8D2AB;
    db $01                                                               ;A8D2AF;
    dw $2146,$81EF                                                       ;A8D2B0;
    db $01                                                               ;A8D2B4;
    dw $2144,$01FC                                                       ;A8D2B5;
    db $18                                                               ;A8D2B9;
    dw $2149,$01F4                                                       ;A8D2BA;
    db $18                                                               ;A8D2BE;
    dw $2148,$81F4                                                       ;A8D2BF;
    db $08                                                               ;A8D2C3;
    dw $210C,$0000                                                       ;A8D2C4;
    db $19                                                               ;A8D2C8;
    dw $214B,$01F8                                                       ;A8D2C9;
    db $19                                                               ;A8D2CD;
    dw $214A,$81F8                                                       ;A8D2CE;
    db $09                                                               ;A8D2D2;
    dw $210E,$8000                                                       ;A8D2D3;
    db $F1                                                               ;A8D2D7;
    dw $2126,$81F0                                                       ;A8D2D8;
    db $F1                                                               ;A8D2DC;
    dw $2124,$8001                                                       ;A8D2DD;
    db $E1                                                               ;A8D2E1;
    dw $2106,$81F1                                                       ;A8D2E2;
    db $E1                                                               ;A8D2E6;
    dw $2104                                                             ;A8D2E7;

Spritemap_Robot_4:
    dw $000C,$8000                                                       ;A8D2E9;
    db $01                                                               ;A8D2ED;
    dw $2142,$81F0                                                       ;A8D2EE;
    db $01                                                               ;A8D2F2;
    dw $2140,$01F7                                                       ;A8D2F3;
    db $16                                                               ;A8D2F7;
    dw $2149,$01EF                                                       ;A8D2F8;
    db $16                                                               ;A8D2FC;
    dw $2148,$81EF                                                       ;A8D2FD;
    db $06                                                               ;A8D301;
    dw $210C,$0001                                                       ;A8D302;
    db $19                                                               ;A8D306;
    dw $214B,$01F9                                                       ;A8D307;
    db $19                                                               ;A8D30B;
    dw $214A,$81F9                                                       ;A8D30C;
    db $09                                                               ;A8D310;
    dw $210E,$8000                                                       ;A8D311;
    db $F1                                                               ;A8D315;
    dw $212A,$81F0                                                       ;A8D316;
    db $F1                                                               ;A8D31A;
    dw $2128,$8000                                                       ;A8D31B;
    db $E1                                                               ;A8D31F;
    dw $210A,$81F0                                                       ;A8D320;
    db $E1                                                               ;A8D324;
    dw $2108                                                             ;A8D325;

Spritemap_Robot_5:
    dw $000C,$8000                                                       ;A8D327;
    db $01                                                               ;A8D32B;
    dw $2146,$81F0                                                       ;A8D32C;
    db $01                                                               ;A8D330;
    dw $2144,$01FC                                                       ;A8D331;
    db $17                                                               ;A8D335;
    dw $2149,$01F4                                                       ;A8D336;
    db $17                                                               ;A8D33A;
    dw $2148,$81F4                                                       ;A8D33B;
    db $07                                                               ;A8D33F;
    dw $210C,$0004                                                       ;A8D340;
    db $19                                                               ;A8D344;
    dw $214B,$01FC                                                       ;A8D345;
    db $19                                                               ;A8D349;
    dw $214A,$81FC                                                       ;A8D34A;
    db $09                                                               ;A8D34E;
    dw $210E,$8000                                                       ;A8D34F;
    db $F1                                                               ;A8D353;
    dw $2126,$81F0                                                       ;A8D354;
    db $F1                                                               ;A8D358;
    dw $2124,$8000                                                       ;A8D359;
    db $E1                                                               ;A8D35D;
    dw $2106,$81F0                                                       ;A8D35E;
    db $E1                                                               ;A8D362;
    dw $2104                                                             ;A8D363;

Spritemap_Robot_6:
    dw $000C,$8000                                                       ;A8D365;
    db $01                                                               ;A8D369;
    dw $212E,$81F0                                                       ;A8D36A;
    db $01                                                               ;A8D36E;
    dw $212C,$0000                                                       ;A8D36F;
    db $19                                                               ;A8D373;
    dw $2149,$01F8                                                       ;A8D374;
    db $19                                                               ;A8D378;
    dw $2148,$81F8                                                       ;A8D379;
    db $09                                                               ;A8D37D;
    dw $210C,$0008                                                       ;A8D37E;
    db $17                                                               ;A8D382;
    dw $214B,$0000                                                       ;A8D383;
    db $17                                                               ;A8D387;
    dw $214A,$8000                                                       ;A8D388;
    db $07                                                               ;A8D38C;
    dw $210E,$8000                                                       ;A8D38D;
    db $F1                                                               ;A8D391;
    dw $2122,$81F0                                                       ;A8D392;
    db $F1                                                               ;A8D396;
    dw $2120,$8000                                                       ;A8D397;
    db $E1                                                               ;A8D39B;
    dw $2102,$81F0                                                       ;A8D39C;
    db $E1                                                               ;A8D3A0;
    dw $2100                                                             ;A8D3A1;

Spritemap_Robot_7:
    dw $000C,$8001                                                       ;A8D3A3;
    db $01                                                               ;A8D3A7;
    dw $2146,$81F1                                                       ;A8D3A8;
    db $01                                                               ;A8D3AC;
    dw $2144,$0000                                                       ;A8D3AD;
    db $19                                                               ;A8D3B1;
    dw $2149,$01F8                                                       ;A8D3B2;
    db $19                                                               ;A8D3B6;
    dw $2148,$81F8                                                       ;A8D3B7;
    db $09                                                               ;A8D3BB;
    dw $210C,$0003                                                       ;A8D3BC;
    db $18                                                               ;A8D3C0;
    dw $214B,$01FB                                                       ;A8D3C1;
    db $18                                                               ;A8D3C5;
    dw $214A,$81FB                                                       ;A8D3C6;
    db $08                                                               ;A8D3CA;
    dw $210E,$8000                                                       ;A8D3CB;
    db $F1                                                               ;A8D3CF;
    dw $2126,$81F0                                                       ;A8D3D0;
    db $F1                                                               ;A8D3D4;
    dw $2124,$81FF                                                       ;A8D3D5;
    db $E1                                                               ;A8D3D9;
    dw $2106,$81EF                                                       ;A8D3DA;
    db $E1                                                               ;A8D3DE;
    dw $2104                                                             ;A8D3DF;

Spritemap_Robot_8:
    dw $000C,$8000                                                       ;A8D3E1;
    db $01                                                               ;A8D3E5;
    dw $2146,$81F0                                                       ;A8D3E6;
    db $01                                                               ;A8D3EA;
    dw $2144,$01F8                                                       ;A8D3EB;
    db $19                                                               ;A8D3EF;
    dw $2148,$0000                                                       ;A8D3F0;
    db $19                                                               ;A8D3F4;
    dw $2149,$81F8                                                       ;A8D3F5;
    db $09                                                               ;A8D3F9;
    dw $210C,$01FE                                                       ;A8D3FA;
    db $19                                                               ;A8D3FE;
    dw $214B,$01F6                                                       ;A8D3FF;
    db $19                                                               ;A8D403;
    dw $214A,$81F6                                                       ;A8D404;
    db $09                                                               ;A8D408;
    dw $210E,$8000                                                       ;A8D409;
    db $F1                                                               ;A8D40D;
    dw $2126,$81F0                                                       ;A8D40E;
    db $F1                                                               ;A8D412;
    dw $2124,$8000                                                       ;A8D413;
    db $E1                                                               ;A8D417;
    dw $2106,$81F0                                                       ;A8D418;
    db $E1                                                               ;A8D41C;
    dw $2104                                                             ;A8D41D;

Spritemap_Robot_9:
    dw $000C,$81FF                                                       ;A8D41F;
    db $01                                                               ;A8D423;
    dw $2146,$81EF                                                       ;A8D424;
    db $01                                                               ;A8D428;
    dw $2144,$0000                                                       ;A8D429;
    db $19                                                               ;A8D42D;
    dw $2149,$01F8                                                       ;A8D42E;
    db $19                                                               ;A8D432;
    dw $2148,$81F8                                                       ;A8D433;
    db $09                                                               ;A8D437;
    dw $210C,$01FC                                                       ;A8D438;
    db $18                                                               ;A8D43C;
    dw $214B,$01F4                                                       ;A8D43D;
    db $18                                                               ;A8D441;
    dw $214A,$81F4                                                       ;A8D442;
    db $08                                                               ;A8D446;
    dw $210E,$8000                                                       ;A8D447;
    db $F1                                                               ;A8D44B;
    dw $2126,$81F0                                                       ;A8D44C;
    db $F1                                                               ;A8D450;
    dw $2124,$8001                                                       ;A8D451;
    db $E1                                                               ;A8D455;
    dw $2106,$81F1                                                       ;A8D456;
    db $E1                                                               ;A8D45A;
    dw $2104                                                             ;A8D45B;

Spritemap_Robot_A:
    dw $000C,$8000                                                       ;A8D45D;
    db $01                                                               ;A8D461;
    dw $2142,$81F0                                                       ;A8D462;
    db $01                                                               ;A8D466;
    dw $2140,$0001                                                       ;A8D467;
    db $19                                                               ;A8D46B;
    dw $2149,$01F9                                                       ;A8D46C;
    db $19                                                               ;A8D470;
    dw $2148,$81F9                                                       ;A8D471;
    db $09                                                               ;A8D475;
    dw $210C,$01F7                                                       ;A8D476;
    db $16                                                               ;A8D47A;
    dw $214B,$01EF                                                       ;A8D47B;
    db $16                                                               ;A8D47F;
    dw $214A,$81EF                                                       ;A8D480;
    db $06                                                               ;A8D484;
    dw $210E,$8000                                                       ;A8D485;
    db $F1                                                               ;A8D489;
    dw $212A,$81F0                                                       ;A8D48A;
    db $F1                                                               ;A8D48E;
    dw $2128,$8000                                                       ;A8D48F;
    db $E1                                                               ;A8D493;
    dw $210A,$81F0                                                       ;A8D494;
    db $E1                                                               ;A8D498;
    dw $2108                                                             ;A8D499;

Spritemap_Robot_B:
    dw $000C,$8000                                                       ;A8D49B;
    db $01                                                               ;A8D49F;
    dw $2146,$81F0                                                       ;A8D4A0;
    db $01                                                               ;A8D4A4;
    dw $2144,$0004                                                       ;A8D4A5;
    db $19                                                               ;A8D4A9;
    dw $2149,$01FC                                                       ;A8D4AA;
    db $19                                                               ;A8D4AE;
    dw $2148,$81FC                                                       ;A8D4AF;
    db $09                                                               ;A8D4B3;
    dw $210C,$01FC                                                       ;A8D4B4;
    db $17                                                               ;A8D4B8;
    dw $214B,$01F4                                                       ;A8D4B9;
    db $17                                                               ;A8D4BD;
    dw $214A,$81F4                                                       ;A8D4BE;
    db $07                                                               ;A8D4C2;
    dw $210E,$8000                                                       ;A8D4C3;
    db $F1                                                               ;A8D4C7;
    dw $2126,$81F0                                                       ;A8D4C8;
    db $F1                                                               ;A8D4CC;
    dw $2124,$8000                                                       ;A8D4CD;
    db $E1                                                               ;A8D4D1;
    dw $2106,$81F0                                                       ;A8D4D2;
    db $E1                                                               ;A8D4D6;
    dw $2104                                                             ;A8D4D7;

Spritemap_Robot_C:
    dw $000C,$81F0                                                       ;A8D4D9;
    db $01                                                               ;A8D4DD;
    dw $612E,$8000                                                       ;A8D4DE;
    db $01                                                               ;A8D4E2;
    dw $612C,$01F0                                                       ;A8D4E3;
    db $17                                                               ;A8D4E7;
    dw $6149,$01F8                                                       ;A8D4E8;
    db $17                                                               ;A8D4EC;
    dw $6148,$81F0                                                       ;A8D4ED;
    db $07                                                               ;A8D4F1;
    dw $610C,$01F8                                                       ;A8D4F2;
    db $19                                                               ;A8D4F6;
    dw $614B,$0000                                                       ;A8D4F7;
    db $19                                                               ;A8D4FB;
    dw $614A,$81F8                                                       ;A8D4FC;
    db $09                                                               ;A8D500;
    dw $610E,$81F0                                                       ;A8D501;
    db $F1                                                               ;A8D505;
    dw $6122,$8000                                                       ;A8D506;
    db $F1                                                               ;A8D50A;
    dw $6120,$81F0                                                       ;A8D50B;
    db $E1                                                               ;A8D50F;
    dw $6102,$8000                                                       ;A8D510;
    db $E1                                                               ;A8D514;
    dw $6100                                                             ;A8D515;

Spritemap_Robot_D:
    dw $000C,$81EF                                                       ;A8D517;
    db $01                                                               ;A8D51B;
    dw $6146,$81FF                                                       ;A8D51C;
    db $01                                                               ;A8D520;
    dw $6144,$01F5                                                       ;A8D521;
    db $18                                                               ;A8D525;
    dw $6149,$01FD                                                       ;A8D526;
    db $18                                                               ;A8D52A;
    dw $6148,$81F5                                                       ;A8D52B;
    db $08                                                               ;A8D52F;
    dw $610C,$01F8                                                       ;A8D530;
    db $19                                                               ;A8D534;
    dw $614B,$0000                                                       ;A8D535;
    db $19                                                               ;A8D539;
    dw $614A,$81F8                                                       ;A8D53A;
    db $09                                                               ;A8D53E;
    dw $610E,$81F0                                                       ;A8D53F;
    db $F1                                                               ;A8D543;
    dw $6126,$8000                                                       ;A8D544;
    db $F1                                                               ;A8D548;
    dw $6124,$81F1                                                       ;A8D549;
    db $E1                                                               ;A8D54D;
    dw $6106,$8001                                                       ;A8D54E;
    db $E1                                                               ;A8D552;
    dw $6104                                                             ;A8D553;

Spritemap_Robot_E:
    dw $000C,$81F0                                                       ;A8D555;
    db $01                                                               ;A8D559;
    dw $6146,$8000                                                       ;A8D55A;
    db $01                                                               ;A8D55E;
    dw $6144,$01F9                                                       ;A8D55F;
    db $19                                                               ;A8D563;
    dw $6149,$0001                                                       ;A8D564;
    db $19                                                               ;A8D568;
    dw $6148,$81F9                                                       ;A8D569;
    db $09                                                               ;A8D56D;
    dw $610C,$01F7                                                       ;A8D56E;
    db $19                                                               ;A8D572;
    dw $614B,$01FF                                                       ;A8D573;
    db $19                                                               ;A8D577;
    dw $614A,$81F7                                                       ;A8D578;
    db $09                                                               ;A8D57C;
    dw $610E,$81F0                                                       ;A8D57D;
    db $F1                                                               ;A8D581;
    dw $6126,$8000                                                       ;A8D582;
    db $F1                                                               ;A8D586;
    dw $6124,$81F0                                                       ;A8D587;
    db $E1                                                               ;A8D58B;
    dw $6106,$8000                                                       ;A8D58C;
    db $E1                                                               ;A8D590;
    dw $6104                                                             ;A8D591;

Spritemap_Robot_F:
    dw $000C,$81F1                                                       ;A8D593;
    db $01                                                               ;A8D597;
    dw $6146,$8001                                                       ;A8D598;
    db $01                                                               ;A8D59C;
    dw $6144,$01FC                                                       ;A8D59D;
    db $18                                                               ;A8D5A1;
    dw $6149,$0004                                                       ;A8D5A2;
    db $18                                                               ;A8D5A6;
    dw $6148,$81FC                                                       ;A8D5A7;
    db $08                                                               ;A8D5AB;
    dw $610C,$01F8                                                       ;A8D5AC;
    db $19                                                               ;A8D5B0;
    dw $614B,$0000                                                       ;A8D5B1;
    db $19                                                               ;A8D5B5;
    dw $614A,$81F8                                                       ;A8D5B6;
    db $09                                                               ;A8D5BA;
    dw $610E,$81F0                                                       ;A8D5BB;
    db $F1                                                               ;A8D5BF;
    dw $6126,$8000                                                       ;A8D5C0;
    db $F1                                                               ;A8D5C4;
    dw $6124,$81EF                                                       ;A8D5C5;
    db $E1                                                               ;A8D5C9;
    dw $6106,$81FF                                                       ;A8D5CA;
    db $E1                                                               ;A8D5CE;
    dw $6104                                                             ;A8D5CF;

Spritemap_Robot_10:
    dw $000C,$81F0                                                       ;A8D5D1;
    db $01                                                               ;A8D5D5;
    dw $6142,$8000                                                       ;A8D5D6;
    db $01                                                               ;A8D5DA;
    dw $6140,$0001                                                       ;A8D5DB;
    db $16                                                               ;A8D5DF;
    dw $6149,$0009                                                       ;A8D5E0;
    db $16                                                               ;A8D5E4;
    dw $6148,$8001                                                       ;A8D5E5;
    db $06                                                               ;A8D5E9;
    dw $610C,$01F7                                                       ;A8D5EA;
    db $19                                                               ;A8D5EE;
    dw $614B,$01FF                                                       ;A8D5EF;
    db $19                                                               ;A8D5F3;
    dw $614A,$81F7                                                       ;A8D5F4;
    db $09                                                               ;A8D5F8;
    dw $610E,$81F0                                                       ;A8D5F9;
    db $F1                                                               ;A8D5FD;
    dw $612A,$8000                                                       ;A8D5FE;
    db $F1                                                               ;A8D602;
    dw $6128,$81F0                                                       ;A8D603;
    db $E1                                                               ;A8D607;
    dw $610A,$8000                                                       ;A8D608;
    db $E1                                                               ;A8D60C;
    dw $6108                                                             ;A8D60D;

Spritemap_Robot_11:
    dw $000C,$81F0                                                       ;A8D60F;
    db $01                                                               ;A8D613;
    dw $6146,$8000                                                       ;A8D614;
    db $01                                                               ;A8D618;
    dw $6144,$01FC                                                       ;A8D619;
    db $17                                                               ;A8D61D;
    dw $6149,$0004                                                       ;A8D61E;
    db $17                                                               ;A8D622;
    dw $6148,$81FC                                                       ;A8D623;
    db $07                                                               ;A8D627;
    dw $610C,$01F4                                                       ;A8D628;
    db $19                                                               ;A8D62C;
    dw $614B,$01FC                                                       ;A8D62D;
    db $19                                                               ;A8D631;
    dw $614A,$81F4                                                       ;A8D632;
    db $09                                                               ;A8D636;
    dw $610E,$81F0                                                       ;A8D637;
    db $F1                                                               ;A8D63B;
    dw $6126,$8000                                                       ;A8D63C;
    db $F1                                                               ;A8D640;
    dw $6124,$81F0                                                       ;A8D641;
    db $E1                                                               ;A8D645;
    dw $6106,$8000                                                       ;A8D646;
    db $E1                                                               ;A8D64A;
    dw $6104                                                             ;A8D64B;

Spritemap_Robot_12:
    dw $000C,$81F0                                                       ;A8D64D;
    db $01                                                               ;A8D651;
    dw $612E,$8000                                                       ;A8D652;
    db $01                                                               ;A8D656;
    dw $612C,$01F8                                                       ;A8D657;
    db $19                                                               ;A8D65B;
    dw $6149,$0000                                                       ;A8D65C;
    db $19                                                               ;A8D660;
    dw $6148,$81F8                                                       ;A8D661;
    db $09                                                               ;A8D665;
    dw $610C,$01F0                                                       ;A8D666;
    db $17                                                               ;A8D66A;
    dw $614B,$01F8                                                       ;A8D66B;
    db $17                                                               ;A8D66F;
    dw $614A,$81F0                                                       ;A8D670;
    db $07                                                               ;A8D674;
    dw $610E,$81F0                                                       ;A8D675;
    db $F1                                                               ;A8D679;
    dw $6122,$8000                                                       ;A8D67A;
    db $F1                                                               ;A8D67E;
    dw $6120,$81F0                                                       ;A8D67F;
    db $E1                                                               ;A8D683;
    dw $6102,$8000                                                       ;A8D684;
    db $E1                                                               ;A8D688;
    dw $6100                                                             ;A8D689;

Spritemap_Robot_13:
    dw $000C,$81EF                                                       ;A8D68B;
    db $01                                                               ;A8D68F;
    dw $6146,$81FF                                                       ;A8D690;
    db $01                                                               ;A8D694;
    dw $6144,$01F8                                                       ;A8D695;
    db $19                                                               ;A8D699;
    dw $6149,$0000                                                       ;A8D69A;
    db $19                                                               ;A8D69E;
    dw $6148,$81F8                                                       ;A8D69F;
    db $09                                                               ;A8D6A3;
    dw $610C,$01F5                                                       ;A8D6A4;
    db $18                                                               ;A8D6A8;
    dw $614B,$01FD                                                       ;A8D6A9;
    db $18                                                               ;A8D6AD;
    dw $614A,$81F5                                                       ;A8D6AE;
    db $08                                                               ;A8D6B2;
    dw $610E,$81F0                                                       ;A8D6B3;
    db $F1                                                               ;A8D6B7;
    dw $6126,$8000                                                       ;A8D6B8;
    db $F1                                                               ;A8D6BC;
    dw $6124,$81F1                                                       ;A8D6BD;
    db $E1                                                               ;A8D6C1;
    dw $6106,$8001                                                       ;A8D6C2;
    db $E1                                                               ;A8D6C6;
    dw $6104                                                             ;A8D6C7;

Spritemap_Robot_14:
    dw $000C,$81F0                                                       ;A8D6C9;
    db $01                                                               ;A8D6CD;
    dw $6146,$8000                                                       ;A8D6CE;
    db $01                                                               ;A8D6D2;
    dw $6144,$0000                                                       ;A8D6D3;
    db $19                                                               ;A8D6D7;
    dw $6148,$01F8                                                       ;A8D6D8;
    db $19                                                               ;A8D6DC;
    dw $6149,$81F8                                                       ;A8D6DD;
    db $09                                                               ;A8D6E1;
    dw $610C,$01FA                                                       ;A8D6E2;
    db $19                                                               ;A8D6E6;
    dw $614B,$0002                                                       ;A8D6E7;
    db $19                                                               ;A8D6EB;
    dw $614A,$81FA                                                       ;A8D6EC;
    db $09                                                               ;A8D6F0;
    dw $610E,$81F0                                                       ;A8D6F1;
    db $F1                                                               ;A8D6F5;
    dw $6126,$8000                                                       ;A8D6F6;
    db $F1                                                               ;A8D6FA;
    dw $6124,$81F0                                                       ;A8D6FB;
    db $E1                                                               ;A8D6FF;
    dw $6106,$8000                                                       ;A8D700;
    db $E1                                                               ;A8D704;
    dw $6104                                                             ;A8D705;

Spritemap_Robot_15:
    dw $000C,$81F1                                                       ;A8D707;
    db $01                                                               ;A8D70B;
    dw $6146,$8001                                                       ;A8D70C;
    db $01                                                               ;A8D710;
    dw $6144,$01F8                                                       ;A8D711;
    db $19                                                               ;A8D715;
    dw $6149,$0000                                                       ;A8D716;
    db $19                                                               ;A8D71A;
    dw $6148,$81F8                                                       ;A8D71B;
    db $09                                                               ;A8D71F;
    dw $610C,$01FC                                                       ;A8D720;
    db $18                                                               ;A8D724;
    dw $614B,$0004                                                       ;A8D725;
    db $18                                                               ;A8D729;
    dw $614A,$81FC                                                       ;A8D72A;
    db $08                                                               ;A8D72E;
    dw $610E,$81F0                                                       ;A8D72F;
    db $F1                                                               ;A8D733;
    dw $6126,$8000                                                       ;A8D734;
    db $F1                                                               ;A8D738;
    dw $6124,$81EF                                                       ;A8D739;
    db $E1                                                               ;A8D73D;
    dw $6106,$81FF                                                       ;A8D73E;
    db $E1                                                               ;A8D742;
    dw $6104                                                             ;A8D743;

Spritemap_Robot_16:
    dw $000C,$81F0                                                       ;A8D745;
    db $01                                                               ;A8D749;
    dw $6142,$8000                                                       ;A8D74A;
    db $01                                                               ;A8D74E;
    dw $6140,$01F7                                                       ;A8D74F;
    db $19                                                               ;A8D753;
    dw $6149,$01FF                                                       ;A8D754;
    db $19                                                               ;A8D758;
    dw $6148,$81F7                                                       ;A8D759;
    db $09                                                               ;A8D75D;
    dw $610C,$0001                                                       ;A8D75E;
    db $16                                                               ;A8D762;
    dw $614B,$0009                                                       ;A8D763;
    db $16                                                               ;A8D767;
    dw $614A,$8001                                                       ;A8D768;
    db $06                                                               ;A8D76C;
    dw $610E,$81F0                                                       ;A8D76D;
    db $F1                                                               ;A8D771;
    dw $612A,$8000                                                       ;A8D772;
    db $F1                                                               ;A8D776;
    dw $6128,$81F0                                                       ;A8D777;
    db $E1                                                               ;A8D77B;
    dw $610A,$8000                                                       ;A8D77C;
    db $E1                                                               ;A8D780;
    dw $6108                                                             ;A8D781;

Spritemap_Robot_17:
    dw $000C,$81F0                                                       ;A8D783;
    db $01                                                               ;A8D787;
    dw $6146,$8000                                                       ;A8D788;
    db $01                                                               ;A8D78C;
    dw $6144,$01F4                                                       ;A8D78D;
    db $19                                                               ;A8D791;
    dw $6149,$01FC                                                       ;A8D792;
    db $19                                                               ;A8D796;
    dw $6148,$81F4                                                       ;A8D797;
    db $09                                                               ;A8D79B;
    dw $610C,$01FC                                                       ;A8D79C;
    db $17                                                               ;A8D7A0;
    dw $614B,$0004                                                       ;A8D7A1;
    db $17                                                               ;A8D7A5;
    dw $614A,$81FC                                                       ;A8D7A6;
    db $07                                                               ;A8D7AA;
    dw $610E,$81F0                                                       ;A8D7AB;
    db $F1                                                               ;A8D7AF;
    dw $6126,$8000                                                       ;A8D7B0;
    db $F1                                                               ;A8D7B4;
    dw $6124,$81F0                                                       ;A8D7B5;
    db $E1                                                               ;A8D7B9;
    dw $6106,$8000                                                       ;A8D7BA;
    db $E1                                                               ;A8D7BE;
    dw $6104                                                             ;A8D7BF;

Spritemap_Robot_18:
    dw $0006,$8000                                                       ;A8D7C1;
    db $01                                                               ;A8D7C5;
    dw $212E,$81F0                                                       ;A8D7C6;
    db $01                                                               ;A8D7CA;
    dw $212C,$8000                                                       ;A8D7CB;
    db $F1                                                               ;A8D7CF;
    dw $2122,$81F0                                                       ;A8D7D0;
    db $F1                                                               ;A8D7D4;
    dw $2120,$8000                                                       ;A8D7D5;
    db $E1                                                               ;A8D7D9;
    dw $2102,$81F0                                                       ;A8D7DA;
    db $E1                                                               ;A8D7DE;
    dw $2100                                                             ;A8D7DF;

Spritemap_Robot_19:
    dw $0006,$8000                                                       ;A8D7E1;
    db $01                                                               ;A8D7E5;
    dw $2146,$81F0                                                       ;A8D7E6;
    db $01                                                               ;A8D7EA;
    dw $2144,$8000                                                       ;A8D7EB;
    db $F1                                                               ;A8D7EF;
    dw $2126,$81F0                                                       ;A8D7F0;
    db $F1                                                               ;A8D7F4;
    dw $2124,$8000                                                       ;A8D7F5;
    db $E1                                                               ;A8D7F9;
    dw $2106,$81F0                                                       ;A8D7FA;
    db $E1                                                               ;A8D7FE;
    dw $2104                                                             ;A8D7FF;

Spritemap_Robot_1A:
    dw $0006,$8000                                                       ;A8D801;
    db $01                                                               ;A8D805;
    dw $2142,$81F0                                                       ;A8D806;
    db $01                                                               ;A8D80A;
    dw $2140,$8000                                                       ;A8D80B;
    db $F1                                                               ;A8D80F;
    dw $212A,$81F0                                                       ;A8D810;
    db $F1                                                               ;A8D814;
    dw $2128,$8000                                                       ;A8D815;
    db $E1                                                               ;A8D819;
    dw $210A,$81F0                                                       ;A8D81A;
    db $E1                                                               ;A8D81E;
    dw $2108                                                             ;A8D81F;

Palette_Bull:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A8D821;
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1                   ;A8D831;

InstList_Bull_Normal:
    dw $000A                                                             ;A8D841;
    dw Spritemap_Bull_0                                                  ;A8D843;
    dw $000A                                                             ;A8D845;
    dw Spritemap_Bull_1                                                  ;A8D847;
    dw $000A                                                             ;A8D849;
    dw Spritemap_Bull_0                                                  ;A8D84B;
    dw $000A                                                             ;A8D84D;
    dw Spritemap_Bull_2                                                  ;A8D84F;
    dw Instruction_Common_GotoY                                          ;A8D851;
    dw InstList_Bull_Normal                                              ;A8D853;

InstList_Bull_Shot_0:
    dw Instruction_Common_TimerInY                                       ;A8D855;
    dw $0005                                                             ;A8D857;

InstList_Bull_Shot_1:
    dw $0003                                                             ;A8D859;
    dw Spritemap_Bull_0                                                  ;A8D85B;
    dw $0003                                                             ;A8D85D;
    dw Spritemap_Bull_1                                                  ;A8D85F;
    dw $0003                                                             ;A8D861;
    dw Spritemap_Bull_0                                                  ;A8D863;
    dw $0003                                                             ;A8D865;
    dw Spritemap_Bull_2                                                  ;A8D867;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A8D869;
    dw InstList_Bull_Shot_1                                              ;A8D86B;
    dw Instruction_Common_GotoY                                          ;A8D86D;
    dw InstList_Bull_Normal                                              ;A8D86F;

BullConstants_AngleToMove_upFacingRight:
    dw $00C0                                                             ;A8D871;

BullConstants_AngleToMove_upRight:
    dw $00E0                                                             ;A8D873;

BullConstants_AngleToMove_right:
    dw $0000                                                             ;A8D875;

BullConstants_AngleToMove_downRight:
    dw $0020                                                             ;A8D877;

BullConstants_AngleToMove_downFacingRight:
    dw $0040                                                             ;A8D879;

BullConstants_AngleToMove_downFacingLeft:
    dw $0040                                                             ;A8D87B;

BullConstants_AngleToMove_downLeft:
    dw $0060                                                             ;A8D87D;

BullConstants_AngleToMove_left:
    dw $0080                                                             ;A8D87F;

BullConstants_AngleToMove_upLeft:
    dw $00A0                                                             ;A8D881;

BullConstants_AngleToMove_upFacingLeft:
    dw $00C0                                                             ;A8D883;

BullConstants_MaxSpeeds:
    dw $03FF,$04FF,$05FF,$06FF,$07FF,$08FF,$09FF,$0AFF                   ;A8D885;

BullAccelerationIntervalTable_accel:
    dw $0003                                                             ;A8D895;

BullAccelerationIntervalTable_decel:
    dw $0001,$0004,$0001,$0005,$0002,$0006,$0002,$0007                   ;A8D897;
    dw $0002,$0008,$0003,$0009,$0003,$000A,$0004,$000B                   ;A8D8A7;
    dw $0004,$000C,$0005,$000D,$0005,$000E,$0006,$000F                   ;A8D8B7;
    dw $0006                                                             ;A8D8C7;

InitAI_Bull:
    LDX.W $0E54                                                          ;A8D8C9;
    LDA.W #$0001                                                         ;A8D8CC;
    STA.W EnemyData.instTimer,X                                          ;A8D8CF;
    STZ.W EnemyData.loopCounter,X                                        ;A8D8D2;
    LDA.W #InstList_Bull_Normal                                          ;A8D8D5;
    STA.W EnemyData.pInstList,X                                          ;A8D8D8;
    LDA.W EnemyData.initParam0,X                                         ;A8D8DB;
    ASL A                                                                ;A8D8DE;
    ASL A                                                                ;A8D8DF;
    TAY                                                                  ;A8D8E0;
    LDA.W BullAccelerationIntervalTable_accel,Y                          ;A8D8E1;
    STA.L $7E780A,X                                                      ;A8D8E4;
    STA.W EnemyData.work5,X                                              ;A8D8E8;
    LDA.W BullAccelerationIntervalTable_decel,Y                          ;A8D8EB;
    STA.L $7E780C,X                                                      ;A8D8EE;
    LDA.W #$0010                                                         ;A8D8F2;
    STA.W EnemyData.work4,X                                              ;A8D8F5;
    LDA.W #Function_Bull_MovementDelay                                   ;A8D8F8;
    STA.W EnemyData.work0,X                                              ;A8D8FB;
    LDA.W EnemyData.initParam1,X                                         ;A8D8FE;
    ASL A                                                                ;A8D901;
    TAY                                                                  ;A8D902;
    LDA.W BullConstants_MaxSpeeds,Y                                      ;A8D903;
    STA.L $7E7800,X                                                      ;A8D906;
    RTL                                                                  ;A8D90A;


MainAI_Bull:
    LDX.W $0E54                                                          ;A8D90B;
    LDA.L $7E780E,X                                                      ;A8D90E;
    DEC A                                                                ;A8D912;
    STA.L $7E780E,X                                                      ;A8D913;
    BNE .function                                                        ;A8D917;
    LDA.W #$0001                                                         ;A8D919;
    STA.L $7E780E,X                                                      ;A8D91C;
    LDA.W #$0000                                                         ;A8D920;
    STA.L $7E7806,X                                                      ;A8D923;

.function:
    JSR.W ($0FA8,X)                                                      ;A8D927;
    RTL                                                                  ;A8D92A;


Function_Bull_MovementDelay:
    LDX.W $0E54                                                          ;A8D92B;
    DEC.W EnemyData.work4,X                                              ;A8D92E;
    BNE .return                                                          ;A8D931;
    LDA.W #$0010                                                         ;A8D933;
    STA.W EnemyData.work4,X                                              ;A8D936;
    LDA.W #Function_Bull_TargetSamus                                     ;A8D939;
    STA.W EnemyData.work0,X                                              ;A8D93C;

.return:
    RTS                                                                  ;A8D93F;


Function_Bull_TargetSamus:
    LDX.W $0E54                                                          ;A8D940;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A8D943;
    SEC                                                                  ;A8D947;
    SBC.W #$0040                                                         ;A8D948;
    AND.W #$00FF                                                         ;A8D94B;
    STA.L $7E7802,X                                                      ;A8D94E;
    STA.L $7E7804,X                                                      ;A8D952;
    LDA.W #Function_Bull_Accelerating                                    ;A8D956;
    STA.W EnemyData.work0,X                                              ;A8D959;
    LDA.W #$0018                                                         ;A8D95C;
    STA.W EnemyData.work2,X                                              ;A8D95F;
    RTS                                                                  ;A8D962;


Function_Bull_Accelerating:
    LDX.W $0E54                                                          ;A8D963;
    LDA.W EnemyData.work3,X                                              ;A8D966;
    CMP.L $7E7800,X                                                      ;A8D969;
    BPL .maxSpeed                                                        ;A8D96D;
    JSR.W AccelerateBull                                                 ;A8D96F;

.maxSpeed:
    JSR.W BullXMovement                                                  ;A8D972;
    JSR.W BullYMovement                                                  ;A8D975;
    JSR.W TriggerBullDecelerationIfTooFarOffTarget                       ;A8D978;
    RTS                                                                  ;A8D97B;


Function_Bull_Decelerating:
    LDX.W $0E54                                                          ;A8D97C;
    LDA.W EnemyData.work3,X                                              ;A8D97F;
    BEQ .stopped                                                         ;A8D982;
    BMI .stopped                                                         ;A8D984;
    LDA.W EnemyData.work1,X                                              ;A8D986;
    BEQ .stopped                                                         ;A8D989;
    BPL .decelerate                                                      ;A8D98B;

.stopped:
    LDA.W #Function_Bull_MovementDelay                                   ;A8D98D;
    STA.W EnemyData.work0,X                                              ;A8D990;
    LDA.W #$0000                                                         ;A8D993;
    STA.W EnemyData.work1,X                                              ;A8D996;
    STA.W EnemyData.work2,X                                              ;A8D999;
    STA.W EnemyData.work3,X                                              ;A8D99C;
    RTS                                                                  ;A8D99F;


.decelerate:
    JSR.W BullXMovement                                                  ;A8D9A0;
    JSR.W BullYMovement                                                  ;A8D9A3;
    JSR.W DecelerateBull                                                 ;A8D9A6;
    RTS                                                                  ;A8D9A9;


TriggerBullDecelerationIfTooFarOffTarget:
    LDX.W $0E54                                                          ;A8D9AA;
    JSL.L CalculateAngleOfSamusFromEnemy                                 ;A8D9AD;
    SEC                                                                  ;A8D9B1;
    SBC.W #$0040                                                         ;A8D9B2;
    AND.W #$00FF                                                         ;A8D9B5;
    STA.L $7E7802,X                                                      ;A8D9B8;
    SEC                                                                  ;A8D9BC;
    SBC.L $7E7804,X                                                      ;A8D9BD;
    JSL.L Sign_Extend_A                                                  ;A8D9C1;
    JSL.L NegateA_A0B067                                                 ;A8D9C5;
    CMP.W #$0030                                                         ;A8D9C9;
    BMI .return                                                          ;A8D9CC;
    LDA.W #Function_Bull_Decelerating                                    ;A8D9CE;
    STA.W EnemyData.work0,X                                              ;A8D9D1;
    LDA.W #$0018                                                         ;A8D9D4;
    STA.W EnemyData.work2,X                                              ;A8D9D7;

.return:
    RTS                                                                  ;A8D9DA;


BullXMovement:
    LDX.W $0E54                                                          ;A8D9DB;
    STZ.B $1A                                                            ;A8D9DE;
    LDA.L $7E7804,X                                                      ;A8D9E0;
    PHX                                                                  ;A8D9E4;
    CLC                                                                  ;A8D9E5;
    ADC.W #$0040                                                         ;A8D9E6;
    AND.W #$00FF                                                         ;A8D9E9;
    ASL A                                                                ;A8D9EC;
    TAX                                                                  ;A8D9ED;
    LDA.L SineCosineTables_16bitSine,X                                   ;A8D9EE;
    STA.B $12                                                            ;A8D9F2;
    PLX                                                                  ;A8D9F4;
    LDA.B $12                                                            ;A8D9F5;
    BPL .positive                                                        ;A8D9F7;
    INC.B $1A                                                            ;A8D9F9;

.positive:
    LDA.B $12                                                            ;A8D9FB;
    JSL.L NegateA_A0B067                                                 ;A8D9FD;
    AND.W #$FF00                                                         ;A8DA01;
    XBA                                                                  ;A8DA04;
    STA.B $16                                                            ;A8DA05;
    LDA.W EnemyData.work3,X                                              ;A8DA07;
    STA.B $18                                                            ;A8DA0A;
    JSR.W Math_24Bit_UnsignedMultiplication_A8DAB3                       ;A8DA0C;
    LDA.B $1A                                                            ;A8DA0F;
    BEQ .notLeft                                                         ;A8DA11;
    JSR.W Negate_1E_1C_A8DAF6                                            ;A8DA13;

.notLeft:
    CLC                                                                  ;A8DA16;
    LDA.W EnemyData.xSubPosition,X                                       ;A8DA17;
    ADC.B $1C                                                            ;A8DA1A;
    STA.W EnemyData.xSubPosition,X                                       ;A8DA1C;
    LDA.W EnemyData.xPosition,X                                          ;A8DA1F;
    ADC.B $1E                                                            ;A8DA22;
    STA.W EnemyData.xPosition,X                                          ;A8DA24;
    RTS                                                                  ;A8DA27;


BullYMovement:
    LDX.W $0E54                                                          ;A8DA28;
    STZ.B $1A                                                            ;A8DA2B;
    LDA.L $7E7804,X                                                      ;A8DA2D;
    PHX                                                                  ;A8DA31;
    AND.W #$00FF                                                         ;A8DA32;
    ASL A                                                                ;A8DA35;
    TAX                                                                  ;A8DA36;
    LDA.L SineCosineTables_16bitSine,X                                   ;A8DA37;
    STA.B $12                                                            ;A8DA3B;
    PLX                                                                  ;A8DA3D;
    LDA.B $12                                                            ;A8DA3E;
    BPL .positive                                                        ;A8DA40;
    INC.B $1A                                                            ;A8DA42;

.positive:
    LDA.B $12                                                            ;A8DA44;
    JSL.L NegateA_A0B067                                                 ;A8DA46;
    AND.W #$FF00                                                         ;A8DA4A;
    XBA                                                                  ;A8DA4D;
    STA.B $16                                                            ;A8DA4E;
    LDA.W EnemyData.work3,X                                              ;A8DA50;
    STA.B $18                                                            ;A8DA53;
    JSR.W Math_24Bit_UnsignedMultiplication_A8DAB3                       ;A8DA55;
    LDA.B $1A                                                            ;A8DA58;
    BEQ .notUp                                                           ;A8DA5A;
    JSR.W Negate_1E_1C_A8DAF6                                            ;A8DA5C;

.notUp:
    CLC                                                                  ;A8DA5F;
    LDA.W EnemyData.ySubPosition,X                                       ;A8DA60;
    ADC.B $1C                                                            ;A8DA63;
    STA.W EnemyData.ySubPosition,X                                       ;A8DA65;
    LDA.W EnemyData.yPosition,X                                          ;A8DA68;
    ADC.B $1E                                                            ;A8DA6B;
    STA.W EnemyData.yPosition,X                                          ;A8DA6D;
    RTS                                                                  ;A8DA70;


AccelerateBull:
    DEC.W EnemyData.work5,X                                              ;A8DA71;
    BNE .return                                                          ;A8DA74;
    LDA.L $7E780A,X                                                      ;A8DA76;
    STA.W EnemyData.work5,X                                              ;A8DA7A;
    LDA.W EnemyData.work1,X                                              ;A8DA7D;
    CLC                                                                  ;A8DA80;
    ADC.W EnemyData.work2,X                                              ;A8DA81;
    STA.W EnemyData.work1,X                                              ;A8DA84;
    LDA.W EnemyData.work3,X                                              ;A8DA87;
    CLC                                                                  ;A8DA8A;
    ADC.W EnemyData.work1,X                                              ;A8DA8B;
    STA.W EnemyData.work3,X                                              ;A8DA8E;

.return:
    RTS                                                                  ;A8DA91;


DecelerateBull:
    DEC.W EnemyData.work5,X                                              ;A8DA92;
    BNE .return                                                          ;A8DA95;
    LDA.L $7E780C,X                                                      ;A8DA97;
    STA.W EnemyData.work5,X                                              ;A8DA9B;
    LDA.W EnemyData.work1,X                                              ;A8DA9E;
    SEC                                                                  ;A8DAA1;
    SBC.W EnemyData.work2,X                                              ;A8DAA2;
    STA.W EnemyData.work1,X                                              ;A8DAA5;
    LDA.W EnemyData.work3,X                                              ;A8DAA8;
    SEC                                                                  ;A8DAAB;
    SBC.W EnemyData.work1,X                                              ;A8DAAC;
    STA.W EnemyData.work3,X                                              ;A8DAAF;

.return:
    RTS                                                                  ;A8DAB2;


Math_24Bit_UnsignedMultiplication_A8DAB3:
    PHP                                                                  ;A8DAB3;
    SEP #$20                                                             ;A8DAB4;
    LDA.B $16                                                            ;A8DAB6;
    STA.W HW_WRMPYA                                                      ;A8DAB8;
    LDA.B $18                                                            ;A8DABB;
    STA.W HW_WRMPYB                                                      ;A8DABD;
    NOP                                                                  ;A8DAC0;
    NOP                                                                  ;A8DAC1;
    NOP                                                                  ;A8DAC2;
    REP #$20                                                             ;A8DAC3;
    LDA.W HW_RDMPY                                                       ;A8DAC5;
    STA.B $1C                                                            ;A8DAC8;
    SEP #$20                                                             ;A8DACA;
    LDA.B $16                                                            ;A8DACC;
    STA.W HW_WRMPYA                                                      ;A8DACE;
    LDA.B $19                                                            ;A8DAD1;
    STA.W HW_WRMPYB                                                      ;A8DAD3;
    NOP                                                                  ;A8DAD6;
    NOP                                                                  ;A8DAD7;
    NOP                                                                  ;A8DAD8;
    REP #$20                                                             ;A8DAD9;
    LDA.W HW_RDMPY                                                       ;A8DADB;
    AND.W #$FF00                                                         ;A8DADE;
    XBA                                                                  ;A8DAE1;
    STA.B $1E                                                            ;A8DAE2;
    LDA.W HW_RDMPY                                                       ;A8DAE4;
    AND.W #$00FF                                                         ;A8DAE7;
    XBA                                                                  ;A8DAEA;
    CLC                                                                  ;A8DAEB;
    ADC.B $1C                                                            ;A8DAEC;
    STA.B $1C                                                            ;A8DAEE;
    BCC .return                                                          ;A8DAF0;
    INC.B $1E                                                            ;A8DAF2;

.return:
    PLP                                                                  ;A8DAF4;
    RTS                                                                  ;A8DAF5;


Negate_1E_1C_A8DAF6:
    LDA.B $1C                                                            ;A8DAF6;
    BNE .nonZero                                                         ;A8DAF8;
    LDA.B $1E                                                            ;A8DAFA;
    BEQ .return                                                          ;A8DAFC;
    DEC.B $1C                                                            ;A8DAFE;
    BRA +                                                                ;A8DB00;


.nonZero:
    LDA.B $1C                                                            ;A8DB02; >.<
    LDA.W #$0000                                                         ;A8DB04;
    SEC                                                                  ;A8DB07;
    SBC.B $1C                                                            ;A8DB08;
    STA.B $1C                                                            ;A8DB0A;

  + LDA.B $1E                                                            ;A8DB0C;
    EOR.W #$FFFF                                                         ;A8DB0E;
    STA.B $1E                                                            ;A8DB11;

.return:
    RTS                                                                  ;A8DB13;


EnemyShot_Bull:
    LDX.W $0E54                                                          ;A8DB14;
    LDA.W EnemyData.health,X                                             ;A8DB17;
    STA.L $7E8800,X                                                      ;A8DB1A;
    JSL.L CommonA8_NormalEnemyShotAI                                     ;A8DB1E;
    LDA.W EnemyData.health,X                                             ;A8DB22;
    CMP.L $7E8800,X                                                      ;A8DB25;
    BEQ .noDamage                                                        ;A8DB29;
    RTL                                                                  ;A8DB2B;


.noDamage:
    LDA.L $7E7806,X                                                      ;A8DB2C;
    BNE .return                                                          ;A8DB30;
    LDA.W #$0001                                                         ;A8DB32;
    STA.W EnemyData.instTimer,X                                          ;A8DB35;
    STZ.W EnemyData.loopCounter,X                                        ;A8DB38;
    LDA.W #InstList_Bull_Shot_0                                          ;A8DB3B;
    STA.W EnemyData.pInstList,X                                          ;A8DB3E;
    LDA.W $18A6                                                          ;A8DB41;
    ASL A                                                                ;A8DB44;
    TAY                                                                  ;A8DB45;
    LDA.W $0C04,Y                                                        ;A8DB46;
    AND.W #$000F                                                         ;A8DB49;
    ASL A                                                                ;A8DB4C;
    TAY                                                                  ;A8DB4D;
    LDA.W BullConstants_AngleToMove_upFacingRight,Y                      ;A8DB4E;
    STA.L $7E7804,X                                                      ;A8DB51;
    LDA.W #$0100                                                         ;A8DB55;
    STA.W EnemyData.work1,X                                              ;A8DB58;
    LDA.W #$0600                                                         ;A8DB5B;
    STA.W EnemyData.work3,X                                              ;A8DB5E;
    LDA.W #Function_Bull_Decelerating                                    ;A8DB61;
    STA.W EnemyData.work0,X                                              ;A8DB64;
    LDA.W #$0030                                                         ;A8DB67;
    STA.L $7E780E,X                                                      ;A8DB6A;
    LDA.W #$0001                                                         ;A8DB6E;
    STA.L $7E7806,X                                                      ;A8DB71;

.return:
    RTL                                                                  ;A8DB75;


Spritemap_Bull_0:
    dw $0004,$81F8                                                       ;A8DB76;
    db $00                                                               ;A8DB7A;
    dw $210A,$81F0                                                       ;A8DB7B;
    db $00                                                               ;A8DB7F;
    dw $2109,$81F8                                                       ;A8DB80;
    db $F0                                                               ;A8DB84;
    dw $2107,$81F0                                                       ;A8DB85;
    db $F0                                                               ;A8DB89;
    dw $2106                                                             ;A8DB8A;

Spritemap_Bull_1:
    dw $0004,$81F8                                                       ;A8DB8C;
    db $00                                                               ;A8DB90;
    dw $210D,$81F0                                                       ;A8DB91;
    db $00                                                               ;A8DB95;
    dw $210C,$81F8                                                       ;A8DB96;
    db $F0                                                               ;A8DB9A;
    dw $2104,$81F0                                                       ;A8DB9B;
    db $F0                                                               ;A8DB9F;
    dw $2103                                                             ;A8DBA0;

Spritemap_Bull_2:
    dw $0007,$0000                                                       ;A8DBA2;
    db $08                                                               ;A8DBA6;
    dw $211F,$0000                                                       ;A8DBA7;
    db $00                                                               ;A8DBAB;
    dw $210F,$01F8                                                       ;A8DBAC;
    db $08                                                               ;A8DBB0;
    dw $2123,$01F0                                                       ;A8DBB1;
    db $08                                                               ;A8DBB5;
    dw $2122,$81F0                                                       ;A8DBB6;
    db $F8                                                               ;A8DBBA;
    dw $2110,$81F8                                                       ;A8DBBB;
    db $F0                                                               ;A8DBBF;
    dw $2101,$81F0                                                       ;A8DBC0;
    db $F0                                                               ;A8DBC4;
    dw $2100                                                             ;A8DBC5;

Palette_Alcoon:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA                   ;A8DBC7;
    dw $0011,$5A5C,$41B4,$290D,$1065,$03FF,$0237,$00D1                   ;A8DBD7;

InstList_Alcoon_FacingLeft_Walking_0:
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DBE7;

InstList_Alcoon_FacingLeft_Walking_1:
    dw $000A                                                             ;A8DBE9;
    dw Spritemap_Alcoon_FacingLeft_FrontFootForward                      ;A8DBEB;
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DBED;
    dw $000A                                                             ;A8DBEF;
    dw Spritemap_Alcoon_FacingLeft_FeetTogether_FrontFootDown            ;A8DBF1;
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DBF3;
    dw $000A                                                             ;A8DBF5;
    dw Spritemap_Alcoon_FacingLeft_FrontFootBack                         ;A8DBF7;
    dw Instruction_Alcoon_DecrementStepCounter_MoveHorizontally          ;A8DBF9;
    dw $000A                                                             ;A8DBFB;
    dw Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward          ;A8DBFD;
    dw Instruction_Common_GotoY                                          ;A8DBFF;
    dw InstList_Alcoon_FacingLeft_Walking_0                              ;A8DC01;

InstList_Alcoon_FacingLeft_SpawnFireballs:
    dw $0014                                                             ;A8DC03;
    dw Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward      ;A8DC05;
    dw $0009                                                             ;A8DC07;
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging      ;A8DC09;
    dw $0010                                                             ;A8DC0B;
    dw Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit               ;A8DC0D;
    dw $0003                                                             ;A8DC0F;
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging      ;A8DC11;
    dw Instruction_Alcoon_SpawnAlcoonFireballHorizontally                ;A8DC13;
    dw $000A                                                             ;A8DC15;
    dw Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit            ;A8DC17;
    dw $000A                                                             ;A8DC19;
    dw Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward      ;A8DC1B;
    dw $0009                                                             ;A8DC1D;
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging      ;A8DC1F;
    dw $0010                                                             ;A8DC21;
    dw Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit               ;A8DC23;
    dw $0003                                                             ;A8DC25;
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging      ;A8DC27;
    dw Instruction_Alcoon_SpawnAlcoonFireballUpward                      ;A8DC29;
    dw $000A                                                             ;A8DC2B;
    dw Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit            ;A8DC2D;
    dw $000A                                                             ;A8DC2F;
    dw Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward      ;A8DC31;
    dw $0009                                                             ;A8DC33;
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging      ;A8DC35;
    dw $0010                                                             ;A8DC37;
    dw Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit               ;A8DC39;
    dw $0003                                                             ;A8DC3B;
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging      ;A8DC3D;
    dw Instruction_Alcoon_SpawnAlcoonFireballDownward                    ;A8DC3F;
    dw $0028                                                             ;A8DC41;
    dw Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit            ;A8DC43;
    dw Instruction_Alcoon_StartWalking                                   ;A8DC45;
    dw $0001                                                             ;A8DC47;
    dw Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit            ;A8DC49;

InstList_Alcoon_FacingLeft_Airborne_LookingUp:
    dw $7FFF                                                             ;A8DC4B;
    dw UNUSED_Spritemap_Alcoon_FacingLeft_LookingUp_A8E0BB               ;A8DC4D;
    dw Instruction_Common_Sleep                                          ;A8DC4F;

InstList_Alcoon_FacingLeft_Airborne_LookingForward:
    dw $7FFF                                                             ;A8DC51;
    dw Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward          ;A8DC53;
    dw Instruction_Common_Sleep                                          ;A8DC55;

InstList_Alcoon_FacingRight_Walking_0:
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DC57;

InstList_Alcoon_FacingRight_Walking_1:
    dw $000A                                                             ;A8DC59;
    dw Spritemap_Alcoon_FacingRight_FrontFootFoward                      ;A8DC5B;
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DC5D;
    dw $000A                                                             ;A8DC5F;
    dw Spritemap_Alcoon_FacingRight_FeetTogether_FrontFootBack           ;A8DC61;
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision           ;A8DC63;
    dw $000A                                                             ;A8DC65;
    dw Spritemap_Alcoon_FacingRight_FrontFootBack                        ;A8DC67;
    dw Instruction_Alcoon_DecrementStepCounter_MoveHorizontally          ;A8DC69;
    dw $000A                                                             ;A8DC6B;
    dw Spritemap_Alcoon_FacingRight_FrontFootUp                          ;A8DC6D;
    dw Instruction_Common_GotoY                                          ;A8DC6F;
    dw InstList_Alcoon_FacingRight_Walking_0                             ;A8DC71;

InstList_Alcoon_FacingRight_SpawnFireballs:
    dw $0014                                                             ;A8DC73;
    dw Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward      ;A8DC75;
    dw $0009                                                             ;A8DC77;
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging       ;A8DC79;
    dw $0010                                                             ;A8DC7B;
    dw Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit              ;A8DC7D;
    dw $0003                                                             ;A8DC7F;
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging       ;A8DC81;
    dw Instruction_Alcoon_SpawnAlcoonFireballHorizontally                ;A8DC83;
    dw $000A                                                             ;A8DC85;
    dw Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit           ;A8DC87;
    dw $000A                                                             ;A8DC89;
    dw Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward      ;A8DC8B;
    dw $0009                                                             ;A8DC8D;
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging       ;A8DC8F;
    dw $0010                                                             ;A8DC91;
    dw Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit              ;A8DC93;
    dw $0003                                                             ;A8DC95;
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging       ;A8DC97;
    dw Instruction_Alcoon_SpawnAlcoonFireballUpward                      ;A8DC99;
    dw $000A                                                             ;A8DC9B;
    dw Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit           ;A8DC9D;
    dw $000A                                                             ;A8DC9F;
    dw Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward      ;A8DCA1;
    dw $0009                                                             ;A8DCA3;
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging       ;A8DCA5;
    dw $0010                                                             ;A8DCA7;
    dw Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit              ;A8DCA9;
    dw $0003                                                             ;A8DCAB;
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging       ;A8DCAD;
    dw Instruction_Alcoon_SpawnAlcoonFireballDownward                    ;A8DCAF;
    dw $0028                                                             ;A8DCB1;
    dw Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit           ;A8DCB3;
    dw Instruction_Alcoon_StartWalking                                   ;A8DCB5;
    dw $0001                                                             ;A8DCB7;
    dw Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit           ;A8DCB9;

InstList_Alcoon_FacingRight_Airborne_LookingUp:
    dw $7FFF                                                             ;A8DCBB;
    dw Spritemap_Alcoon_FacingRight_LookingUp                            ;A8DCBD;
    dw Instruction_Common_Sleep                                          ;A8DCBF;

InstList_Alcoon_FacingRight_Airborne_LookingForward:
    dw $7FFF                                                             ;A8DCC1;
    dw Spritemap_Alcoon_FacingRight_FrontFootUp                          ;A8DCC3;
    dw Instruction_Common_Sleep                                          ;A8DCC5;

AlcoonConstants_XThresholdToEmerge:
    dw $0050                                                             ;A8DCC7;

UNUSED_AlcoonConstants_A8DCC9:
    dw $0040                                                             ;A8DCC9;

AlcoonConstants_XThresholdToHide:
    dw $0070                                                             ;A8DCCB;

InitAI_Alcoon:
    LDX.W $0E54                                                          ;A8DCCD;
    LDA.W #$0000                                                         ;A8DCD0;
    STA.L $7E7808,X                                                      ;A8DCD3;
    LDA.W EnemyData.yPosition,X                                          ;A8DCD7;
    STA.W EnemyData.work5,X                                              ;A8DCDA;
    LDA.W EnemyData.xPosition,X                                          ;A8DCDD;
    STA.L $7E7804,X                                                      ;A8DCE0;
    LDA.W EnemyData.properties,X                                         ;A8DCE4;
    ORA.W #$2000                                                         ;A8DCE7;
    STA.W EnemyData.properties,X                                         ;A8DCEA;
    LDA.W #InstList_Alcoon_FacingLeft_Walking_0                          ;A8DCED;
    STA.W EnemyData.pInstList,X                                          ;A8DCF0;
    LDA.W #Function_Alcoon_WaitForSamusToGetNear                         ;A8DCF3;
    STA.W EnemyData.work0,X                                              ;A8DCF6;
    JSR.W SetupAlcoonJumpMovement                                        ;A8DCF9;

.loopRising:
    LDA.W EnemyData.work2,X                                              ;A8DCFC;
    CLC                                                                  ;A8DCFF;
    ADC.W EnemyData.ySubPosition,X                                       ;A8DD00;
    STA.W EnemyData.ySubPosition,X                                       ;A8DD03;
    LDA.W EnemyData.work1,X                                              ;A8DD06;
    ADC.W EnemyData.yPosition,X                                          ;A8DD09;
    STA.W EnemyData.yPosition,X                                          ;A8DD0C;
    JSR.W AlcoonYAcceleration                                            ;A8DD0F;
    BMI .loopRising                                                      ;A8DD12;

.loopFalling:
    LDA.W EnemyData.work2,X                                              ;A8DD14;
    STA.B $12                                                            ;A8DD17;
    LDA.W EnemyData.work1,X                                              ;A8DD19;
    STA.B $14                                                            ;A8DD1C;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8DD1E;
    BCS .collidedWithBlock                                               ;A8DD22;
    JSR.W AlcoonYAcceleration                                            ;A8DD24;
    BRA .loopFalling                                                     ;A8DD27;


.collidedWithBlock:
    LDA.W EnemyData.yPosition,X                                          ;A8DD29;
    STA.L $7E7806,X                                                      ;A8DD2C;
    LDA.W EnemyData.work5,X                                              ;A8DD30;
    STA.W EnemyData.yPosition,X                                          ;A8DD33;
    RTL                                                                  ;A8DD36;


SetupAlcoonJumpMovement:
    LDA.W #$FFF4                                                         ;A8DD37;
    STA.W EnemyData.work1,X                                              ;A8DD3A;
    LDA.W #$0000                                                         ;A8DD3D;
    STA.W EnemyData.work2,X                                              ;A8DD40;
    STA.W EnemyData.work3,X                                              ;A8DD43;
    STA.W EnemyData.work4,X                                              ;A8DD46;
    STA.L $7E7800,X                                                      ;A8DD49;
    LDA.W #$8000                                                         ;A8DD4D;
    STA.L $7E7802,X                                                      ;A8DD50;
    RTS                                                                  ;A8DD54;


AlcoonYAcceleration:
    LDA.W EnemyData.work2,X                                              ;A8DD55;
    CLC                                                                  ;A8DD58;
    ADC.L $7E7802,X                                                      ;A8DD59;
    STA.W EnemyData.work2,X                                              ;A8DD5D;
    LDA.W EnemyData.work1,X                                              ;A8DD60;
    ADC.L $7E7800,X                                                      ;A8DD63;
    STA.W EnemyData.work1,X                                              ;A8DD67;
    RTS                                                                  ;A8DD6A;


MainAI_Alcoon:
    LDX.W $0E54                                                          ;A8DD6B;
    JMP.W ($0FA8,X)                                                      ;A8DD6E;


Function_Alcoon_WaitForSamusToGetNear:
    LDA.L $7E7806,X                                                      ;A8DD71;
    SEC                                                                  ;A8DD75;
    SBC.W $0AFA                                                          ;A8DD76;
    BPL .SamusBelowSpawn                                                 ;A8DD79;
    EOR.W #$FFFF                                                         ;A8DD7B;
    INC A                                                                ;A8DD7E;

.SamusBelowSpawn:
    CMP.W #$0020                                                         ;A8DD7F;
    BPL .return                                                          ;A8DD82;
    LDA.W $0AF6                                                          ;A8DD84;
    SEC                                                                  ;A8DD87;
    SBC.W EnemyData.xPosition,X                                          ;A8DD88;
    PHP                                                                  ;A8DD8B;
    BPL +                                                                ;A8DD8C;
    EOR.W #$FFFF                                                         ;A8DD8E;
    INC A                                                                ;A8DD91;

  + CMP.W AlcoonConstants_XThresholdToEmerge                             ;A8DD92;
    BPL .returnPLP                                                       ;A8DD95;
    JSR.W SetupAlcoonJumpMovement                                        ;A8DD97;
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingUp                 ;A8DD9A;
    LDA.W #$FFFE                                                         ;A8DD9D;
    PLP                                                                  ;A8DDA0;
    BMI .SamusToTheRight                                                 ;A8DDA1;
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingUp                ;A8DDA3;
    LDA.W #$0002                                                         ;A8DDA6;

.SamusToTheRight:
    STA.W EnemyData.work3,X                                              ;A8DDA9;
    TYA                                                                  ;A8DDAC;
    STA.W EnemyData.pInstList,X                                          ;A8DDAD;
    LDA.W #$0001                                                         ;A8DDB0;
    STA.W EnemyData.instTimer,X                                          ;A8DDB3;
    LDA.W #Function_Alcoon_Emerging_Rising                               ;A8DDB6;
    STA.W EnemyData.work0,X                                              ;A8DDB9;
    LDA.W #$005E                                                         ;A8DDBC;
    JSL.L QueueSound_Lib2_Max6                                           ;A8DDBF;

.return:
    RTL                                                                  ;A8DDC3;


.returnPLP:
    PLP                                                                  ;A8DDC4;
    RTL                                                                  ;A8DDC5;


Function_Alcoon_Emerging_Rising:
    LDA.W EnemyData.work2,X                                              ;A8DDC6;
    CLC                                                                  ;A8DDC9;
    ADC.W EnemyData.ySubPosition,X                                       ;A8DDCA;
    STA.W EnemyData.ySubPosition,X                                       ;A8DDCD;
    LDA.W EnemyData.work1,X                                              ;A8DDD0;
    ADC.W EnemyData.yPosition,X                                          ;A8DDD3;
    STA.W EnemyData.yPosition,X                                          ;A8DDD6;
    JSR.W AlcoonYAcceleration                                            ;A8DDD9;
    BMI .return                                                          ;A8DDDC;

.falling:
    LDA.W #Function_Alcoon_Emerging_Falling                              ;A8DDDE;
    STA.W EnemyData.work0,X                                              ;A8DDE1;
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingForward            ;A8DDE4;
    LDA.W EnemyData.work3,X                                              ;A8DDE7;
    BMI .keepLeft                                                        ;A8DDEA;
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingForward           ;A8DDEC;

.keepLeft:
    TYA                                                                  ;A8DDEF;
    STA.W EnemyData.pInstList,X                                          ;A8DDF0;
    LDA.W #$0001                                                         ;A8DDF3;
    STA.W EnemyData.instTimer,X                                          ;A8DDF6;

.return:
    RTL                                                                  ;A8DDF9;

    LDA.W #$0000                                                         ;A8DDFA; dead code
    STA.W EnemyData.work1,X                                              ;A8DDFD;
    STA.W EnemyData.work2,X                                              ;A8DE00;
    BRA .falling                                                         ;A8DE03;


Function_Alcoon_Emerging_Falling:
    LDA.W EnemyData.work2,X                                              ;A8DE05;
    STA.B $12                                                            ;A8DE08;
    LDA.W EnemyData.work1,X                                              ;A8DE0A;
    STA.B $14                                                            ;A8DE0D;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8DE0F;
    BCS .collidedWithBlock                                               ;A8DE13;
    JSR.W AlcoonYAcceleration                                            ;A8DE15;
    RTL                                                                  ;A8DE18;


.collidedWithBlock:
    LDA.W $0AF6                                                          ;A8DE19;
    SEC                                                                  ;A8DE1C;
    SBC.W EnemyData.xPosition,X                                          ;A8DE1D;
    PHP                                                                  ;A8DE20;
    LDY.W #InstList_Alcoon_FacingLeft_Walking_0                          ;A8DE21;
    LDA.W #$FFFE                                                         ;A8DE24;
    PLP                                                                  ;A8DE27;
    BMI .directionChosen                                                 ;A8DE28;
    LDA.W #$0002                                                         ;A8DE2A;
    LDY.W #InstList_Alcoon_FacingRight_Walking_0                         ;A8DE2D;

.directionChosen:
    STA.W EnemyData.work3,X                                              ;A8DE30;
    TYA                                                                  ;A8DE33;
    STA.W EnemyData.pInstList,X                                          ;A8DE34;
    LDA.W #$0001                                                         ;A8DE37;
    STA.W EnemyData.instTimer,X                                          ;A8DE3A;
    LDA.W #Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus         ;A8DE3D;
    STA.W EnemyData.work0,X                                              ;A8DE40;
    LDA.W #$0001                                                         ;A8DE43;
    STA.L $7E7808,X                                                      ;A8DE46;
    RTL                                                                  ;A8DE4A;


Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus:
    STZ.B $12                                                            ;A8DE4B;
    LDA.W #$0002                                                         ;A8DE4D;
    STA.B $14                                                            ;A8DE50;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8DE52;
    LDA.L $7E7804,X                                                      ;A8DE56;
    SEC                                                                  ;A8DE5A;
    SBC.W EnemyData.xPosition,X                                          ;A8DE5B;
    BPL +                                                                ;A8DE5E;
    EOR.W #$FFFF                                                         ;A8DE60;
    INC A                                                                ;A8DE63;

  + CMP.W AlcoonConstants_XThresholdToHide                               ;A8DE64;
    BPL .farAway                                                         ;A8DE67;
    LDA.W $0AF6                                                          ;A8DE69;
    SEC                                                                  ;A8DE6C;
    SBC.W EnemyData.xPosition,X                                          ;A8DE6D;
    PHP                                                                  ;A8DE70;
    BPL +                                                                ;A8DE71;
    EOR.W #$FFFF                                                         ;A8DE73;
    INC A                                                                ;A8DE76;

  + LDA.L $7E7808,X                                                      ;A8DE77;
    BNE .returnPLP                                                       ;A8DE7B;
    PLP                                                                  ;A8DE7D;
    BMI .facingLeft                                                      ;A8DE7E;
    LDY.W #InstList_Alcoon_FacingRight_SpawnFireballs                    ;A8DE80;
    LDA.W EnemyData.work3,X                                              ;A8DE83;
    BPL .fireballs                                                       ;A8DE86;
    RTL                                                                  ;A8DE88;


.returnPLP:
    PLP                                                                  ;A8DE89;
    RTL                                                                  ;A8DE8A;


.facingLeft:
    LDY.W #InstList_Alcoon_FacingLeft_SpawnFireballs                     ;A8DE8B;
    LDA.W EnemyData.work3,X                                              ;A8DE8E;
    BPL .return                                                          ;A8DE91;

.fireballs:
    TYA                                                                  ;A8DE93;
    STA.W EnemyData.pInstList,X                                          ;A8DE94;
    LDA.W #$0001                                                         ;A8DE97;
    STA.W EnemyData.instTimer,X                                          ;A8DE9A;
    LDA.W #RTL_A8DECC                                                    ;A8DE9D;
    STA.W EnemyData.work0,X                                              ;A8DEA0;

.return:
    RTL                                                                  ;A8DEA3;


.farAway:
    LDA.W #Function_Alcoon_Hiding_Rising                                 ;A8DEA4;
    STA.W EnemyData.work0,X                                              ;A8DEA7;
    LDA.W #$FFFC                                                         ;A8DEAA;
    STA.W EnemyData.work1,X                                              ;A8DEAD;
    LDA.W #$0000                                                         ;A8DEB0;
    STA.W EnemyData.work2,X                                              ;A8DEB3;
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingForward            ;A8DEB6;
    LDA.W EnemyData.work3,X                                              ;A8DEB9;
    BMI +                                                                ;A8DEBC;
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingForward           ;A8DEBE;

  + TYA                                                                  ;A8DEC1;
    STA.W EnemyData.pInstList,X                                          ;A8DEC2;
    LDA.W #$0001                                                         ;A8DEC5;
    STA.W EnemyData.instTimer,X                                          ;A8DEC8;
    RTL                                                                  ;A8DECB;


RTL_A8DECC:
    RTL                                                                  ;A8DECC;


Function_Alcoon_Hiding_Rising:
    LDA.W EnemyData.work2,X                                              ;A8DECD;
    CLC                                                                  ;A8DED0;
    ADC.W EnemyData.ySubPosition,X                                       ;A8DED1;
    STA.W EnemyData.ySubPosition,X                                       ;A8DED4;
    LDA.W EnemyData.work1,X                                              ;A8DED7;
    ADC.W EnemyData.yPosition,X                                          ;A8DEDA;
    STA.W EnemyData.yPosition,X                                          ;A8DEDD;
    JSR.W AlcoonYAcceleration                                            ;A8DEE0;
    BMI .return                                                          ;A8DEE3;
    LDA.W #Function_Alcoon_Hiding_Falling                                ;A8DEE5;
    STA.W EnemyData.work0,X                                              ;A8DEE8;

.return:
    RTL                                                                  ;A8DEEB;


Function_Alcoon_Hiding_Falling:
    LDA.W EnemyData.work2,X                                              ;A8DEEC;
    CLC                                                                  ;A8DEEF;
    ADC.W EnemyData.ySubPosition,X                                       ;A8DEF0;
    STA.W EnemyData.ySubPosition,X                                       ;A8DEF3;
    LDA.W EnemyData.work1,X                                              ;A8DEF6;
    ADC.W EnemyData.yPosition,X                                          ;A8DEF9;
    STA.W EnemyData.yPosition,X                                          ;A8DEFC;
    CMP.W EnemyData.work5,X                                              ;A8DEFF;
    BPL .reachedTargetY                                                  ;A8DF02;
    JSR.W AlcoonYAcceleration                                            ;A8DF04;
    RTL                                                                  ;A8DF07;


.reachedTargetY:
    LDA.W EnemyData.work5,X                                              ;A8DF08;
    STA.W EnemyData.yPosition,X                                          ;A8DF0B;
    LDA.L $7E7804,X                                                      ;A8DF0E;
    STA.W EnemyData.xPosition,X                                          ;A8DF12;
    LDA.W #Function_Alcoon_WaitForSamusToGetNear                         ;A8DF15;
    STA.W EnemyData.work0,X                                              ;A8DF18;
    RTL                                                                  ;A8DF1B;


Instruction_Alcoon_SpawnAlcoonFireballUpward:
    PHY                                                                  ;A8DF1C;
    LDA.W #$0000                                                         ;A8DF1D;

Instruction_Alcoon_SpawnAlcoonFireballUpward_loop:
    LDY.W #EnemyProjectile_AlcoonFireball                                ;A8DF20;
    LDX.W $0E54                                                          ;A8DF23;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8DF26;
    LDA.W #$003F                                                         ;A8DF2A;
    JSL.L QueueSound_Lib2_Max6                                           ;A8DF2D;
    PLY                                                                  ;A8DF31;
    RTL                                                                  ;A8DF32;


Instruction_Alcoon_SpawnAlcoonFireballHorizontally:
    PHY                                                                  ;A8DF33;
    LDA.W #$0002                                                         ;A8DF34;
    BRA Instruction_Alcoon_SpawnAlcoonFireballUpward_loop                ;A8DF37;


Instruction_Alcoon_SpawnAlcoonFireballDownward:
    PHY                                                                  ;A8DF39;
    LDA.W #$0004                                                         ;A8DF3A;
    BRA Instruction_Alcoon_SpawnAlcoonFireballUpward_loop                ;A8DF3D;


Instruction_Alcoon_StartWalking:
    LDX.W $0E54                                                          ;A8DF3F;
    LDA.W #Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus         ;A8DF42;
    STA.W EnemyData.work0,X                                              ;A8DF45;
    LDA.W $05E5                                                          ;A8DF48;
    AND.W #$0003                                                         ;A8DF4B;
    BNE +                                                                ;A8DF4E;
    LDA.W #$0002                                                         ;A8DF50;

  + STA.L $7E7808,X                                                      ;A8DF53;
    LDY.W #InstList_Alcoon_FacingLeft_Walking_0                          ;A8DF57;
    LDA.W EnemyData.work3,X                                              ;A8DF5A;
    BMI .return                                                          ;A8DF5D;
    LDY.W #InstList_Alcoon_FacingRight_Walking_0                         ;A8DF5F;

.return:
    RTL                                                                  ;A8DF62;


Instruction_Alcoon_DecrementStepCounter_MoveHorizontally:
    LDX.W $0E54                                                          ;A8DF63;
    LDA.L $7E7808,X                                                      ;A8DF66;
    BEQ Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision          ;A8DF6A;
    DEC A                                                                ;A8DF6C;
    STA.L $7E7808,X                                                      ;A8DF6D; fallthrough to Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision

Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision:
    PHY                                                                  ;A8DF71;
    LDX.W $0E54                                                          ;A8DF72;
    STZ.B $12                                                            ;A8DF75;
    LDA.W EnemyData.work3,X                                              ;A8DF77;
    STA.B $14                                                            ;A8DF7A;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8DF7C;
    BCS .turnAround                                                      ;A8DF80;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8DF82;
    PLY                                                                  ;A8DF86;
    RTL                                                                  ;A8DF87;


.turnAround:
    PLY                                                                  ;A8DF88;
    LDY.W #InstList_Alcoon_FacingLeft_Walking_1                          ;A8DF89;
    LDA.W EnemyData.work3,X                                              ;A8DF8C;
    BPL .directionChosen                                                 ;A8DF8F;
    LDY.W #InstList_Alcoon_FacingRight_Walking_1                         ;A8DF91;

.directionChosen:
    EOR.W #$FFFF                                                         ;A8DF94;
    INC A                                                                ;A8DF97;
    STA.W EnemyData.work3,X                                              ;A8DF98;
    RTL                                                                  ;A8DF9B;


RTL_A8DF9C:
    RTL                                                                  ;A8DF9C;


UNUSED_NormalEnemyShotAI_A8DF9D:
    JSL.L NormalEnemyShotAI                                              ;A8DF9D;
    RTL                                                                  ;A8DFA1;


Spritemap_Alcoon_FacingLeft_FrontFootForward:
    dw $0006,$81FD                                                       ;A8DFA2;
    db $F3                                                               ;A8DFA6;
    dw $2124,$8004                                                       ;A8DFA7;
    db $FC                                                               ;A8DFAB;
    dw $210C,$81F8                                                       ;A8DFAC;
    db $F8                                                               ;A8DFB0;
    dw $210A,$81F8                                                       ;A8DFB1;
    db $08                                                               ;A8DFB5;
    dw $2102,$01ED                                                       ;A8DFB6;
    db $F0                                                               ;A8DFBA;
    dw $212A,$81F5                                                       ;A8DFBB;
    db $E8                                                               ;A8DFBF;
    dw $2100                                                             ;A8DFC0;

Spritemap_Alcoon_FacingLeft_FeetTogether_FrontFootDown:
    dw $0006,$8004                                                       ;A8DFC2;
    db $FB                                                               ;A8DFC6;
    dw $210E,$81FD                                                       ;A8DFC7;
    db $F2                                                               ;A8DFCB;
    dw $2126,$81F8                                                       ;A8DFCC;
    db $07                                                               ;A8DFD0;
    dw $2104,$81F8                                                       ;A8DFD1;
    db $F7                                                               ;A8DFD5;
    dw $210A,$01EE                                                       ;A8DFD6;
    db $EF                                                               ;A8DFDA;
    dw $212A,$81F6                                                       ;A8DFDB;
    db $E7                                                               ;A8DFDF;
    dw $2100                                                             ;A8DFE0;

Spritemap_Alcoon_FacingLeft_FrontFootBack:
    dw $0007,$01FD                                                       ;A8DFE2;
    db $FB                                                               ;A8DFE6;
    dw $213D,$01FD                                                       ;A8DFE7;
    db $F3                                                               ;A8DFEB;
    dw $213C,$8004                                                       ;A8DFEC;
    db $FC                                                               ;A8DFF0;
    dw $2120,$81F8                                                       ;A8DFF1;
    db $08                                                               ;A8DFF5;
    dw $2106,$81F8                                                       ;A8DFF6;
    db $F8                                                               ;A8DFFA;
    dw $210A,$01EF                                                       ;A8DFFB;
    db $F0                                                               ;A8DFFF;
    dw $212A,$81F7                                                       ;A8E000;
    db $E8                                                               ;A8E004;
    dw $2100                                                             ;A8E005;

Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward:
    dw $0006,$8004                                                       ;A8E007;
    db $FB                                                               ;A8E00B;
    dw $2122,$81FD                                                       ;A8E00C;
    db $F2                                                               ;A8E010;
    dw $2126,$81F8                                                       ;A8E011;
    db $07                                                               ;A8E015;
    dw $2108,$81F8                                                       ;A8E016;
    db $F7                                                               ;A8E01A;
    dw $210A,$01EE                                                       ;A8E01B;
    db $EF                                                               ;A8E01F;
    dw $212A,$81F6                                                       ;A8E020;
    db $E7                                                               ;A8E024;
    dw $2100                                                             ;A8E025;

Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward:
    dw $0006,$81FD                                                       ;A8E027;
    db $F3                                                               ;A8E02B;
    dw $2124,$8004                                                       ;A8E02C;
    db $FC                                                               ;A8E030;
    dw $210C,$81F8                                                       ;A8E031;
    db $08                                                               ;A8E035;
    dw $2106,$81F8                                                       ;A8E036;
    db $F8                                                               ;A8E03A;
    dw $210A,$01EE                                                       ;A8E03B;
    db $F0                                                               ;A8E03F;
    dw $212A,$81F6                                                       ;A8E040;
    db $E8                                                               ;A8E044;
    dw $2100                                                             ;A8E045;

Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging:
    dw $0007,$81FE                                                       ;A8E047;
    db $F3                                                               ;A8E04B;
    dw $2126,$8005                                                       ;A8E04C;
    db $FC                                                               ;A8E050;
    dw $210E,$01F7                                                       ;A8E051;
    db $F0                                                               ;A8E055;
    dw $212E,$81F8                                                       ;A8E056;
    db $08                                                               ;A8E05A;
    dw $2106,$81F9                                                       ;A8E05B;
    db $F8                                                               ;A8E05F;
    dw $210A,$01F0                                                       ;A8E060;
    db $F0                                                               ;A8E064;
    dw $212A,$81F7                                                       ;A8E065;
    db $E8                                                               ;A8E069;
    dw $2100                                                             ;A8E06A;

Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit:
    dw $0009,$0000                                                       ;A8E06C;
    db $F0                                                               ;A8E070;
    dw $213B,$01FE                                                       ;A8E071;
    db $FB                                                               ;A8E075;
    dw $213D,$01FE                                                       ;A8E076;
    db $F3                                                               ;A8E07A;
    dw $213C,$8005                                                       ;A8E07B;
    db $FC                                                               ;A8E07F;
    dw $2120,$01F8                                                       ;A8E080;
    db $F0                                                               ;A8E084;
    dw $212F,$81F8                                                       ;A8E085;
    db $08                                                               ;A8E089;
    dw $2106,$81F9                                                       ;A8E08A;
    db $F8                                                               ;A8E08E;
    dw $210A,$01F2                                                       ;A8E08F;
    db $F0                                                               ;A8E093;
    dw $212A,$81F8                                                       ;A8E094;
    db $E8                                                               ;A8E098;
    dw $2100                                                             ;A8E099;

Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit:
    dw $0006,$81FD                                                       ;A8E09B;
    db $F3                                                               ;A8E09F;
    dw $2124,$8004                                                       ;A8E0A0;
    db $FC                                                               ;A8E0A4;
    dw $2122,$01EE                                                       ;A8E0A5;
    db $F0                                                               ;A8E0A9;
    dw $212B,$81F8                                                       ;A8E0AA;
    db $08                                                               ;A8E0AE;
    dw $2106,$81F8                                                       ;A8E0AF;
    db $F8                                                               ;A8E0B3;
    dw $210A,$81F6                                                       ;A8E0B4;
    db $E8                                                               ;A8E0B8;
    dw $2100                                                             ;A8E0B9;

UNUSED_Spritemap_Alcoon_FacingLeft_LookingUp_A8E0BB:
    dw $0006,$81FD                                                       ;A8E0BB;
    db $F3                                                               ;A8E0BF;
    dw $2124,$01FA                                                       ;A8E0C0;
    db $E4                                                               ;A8E0C4;
    dw $613A,$81FA                                                       ;A8E0C5;
    db $EC                                                               ;A8E0C9;
    dw $2128,$8004                                                       ;A8E0CA;
    db $FC                                                               ;A8E0CE;
    dw $2122,$81F8                                                       ;A8E0CF;
    db $08                                                               ;A8E0D3;
    dw $2108,$81F8                                                       ;A8E0D4;
    db $F8                                                               ;A8E0D8;
    dw $210A                                                             ;A8E0D9;

Spritemap_Alcoon_FacingRight_FrontFootFoward:
    dw $0006,$81F3                                                       ;A8E0DB;
    db $F3                                                               ;A8E0DF;
    dw $6124,$81EC                                                       ;A8E0E0;
    db $FC                                                               ;A8E0E4;
    dw $610C,$81F8                                                       ;A8E0E5;
    db $F8                                                               ;A8E0E9;
    dw $610A,$81F8                                                       ;A8E0EA;
    db $08                                                               ;A8E0EE;
    dw $6102,$000B                                                       ;A8E0EF;
    db $F0                                                               ;A8E0F3;
    dw $612A,$81FB                                                       ;A8E0F4;
    db $E8                                                               ;A8E0F8;
    dw $6100                                                             ;A8E0F9;

Spritemap_Alcoon_FacingRight_FeetTogether_FrontFootBack:
    dw $0006,$81EC                                                       ;A8E0FB;
    db $FB                                                               ;A8E0FF;
    dw $610E,$81F3                                                       ;A8E100;
    db $F2                                                               ;A8E104;
    dw $6126,$81F8                                                       ;A8E105;
    db $07                                                               ;A8E109;
    dw $6104,$81F8                                                       ;A8E10A;
    db $F7                                                               ;A8E10E;
    dw $610A,$000A                                                       ;A8E10F;
    db $EF                                                               ;A8E113;
    dw $612A,$81FA                                                       ;A8E114;
    db $E7                                                               ;A8E118;
    dw $6100                                                             ;A8E119;

Spritemap_Alcoon_FacingRight_FrontFootBack:
    dw $0007,$01FB                                                       ;A8E11B;
    db $FB                                                               ;A8E11F;
    dw $613D,$01FB                                                       ;A8E120;
    db $F3                                                               ;A8E124;
    dw $613C,$81EC                                                       ;A8E125;
    db $FC                                                               ;A8E129;
    dw $6120,$81F8                                                       ;A8E12A;
    db $08                                                               ;A8E12E;
    dw $6106,$81F8                                                       ;A8E12F;
    db $F8                                                               ;A8E133;
    dw $610A,$0009                                                       ;A8E134;
    db $F0                                                               ;A8E138;
    dw $612A,$81F9                                                       ;A8E139;
    db $E8                                                               ;A8E13D;
    dw $6100                                                             ;A8E13E;

Spritemap_Alcoon_FacingRight_FrontFootUp:
    dw $0006,$81EC                                                       ;A8E140;
    db $FB                                                               ;A8E144;
    dw $6122,$81F3                                                       ;A8E145;
    db $F2                                                               ;A8E149;
    dw $6126,$81F8                                                       ;A8E14A;
    db $07                                                               ;A8E14E;
    dw $6108,$81F8                                                       ;A8E14F;
    db $F7                                                               ;A8E153;
    dw $610A,$000A                                                       ;A8E154;
    db $EF                                                               ;A8E158;
    dw $612A,$81FA                                                       ;A8E159;
    db $E7                                                               ;A8E15D;
    dw $6100                                                             ;A8E15E;

Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward:
    dw $0006,$81F3                                                       ;A8E160;
    db $F3                                                               ;A8E164;
    dw $6124,$81EC                                                       ;A8E165;
    db $FC                                                               ;A8E169;
    dw $610C,$81F8                                                       ;A8E16A;
    db $08                                                               ;A8E16E;
    dw $6106,$81F8                                                       ;A8E16F;
    db $F8                                                               ;A8E173;
    dw $610A,$000A                                                       ;A8E174;
    db $F0                                                               ;A8E178;
    dw $612A,$81FA                                                       ;A8E179;
    db $E8                                                               ;A8E17D;
    dw $6100                                                             ;A8E17E;

Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging:
    dw $0007,$81F2                                                       ;A8E180;
    db $F3                                                               ;A8E184;
    dw $6126,$81EB                                                       ;A8E185;
    db $FC                                                               ;A8E189;
    dw $610E,$0001                                                       ;A8E18A;
    db $F0                                                               ;A8E18E;
    dw $612E,$81F8                                                       ;A8E18F;
    db $08                                                               ;A8E193;
    dw $6106,$81F7                                                       ;A8E194;
    db $F8                                                               ;A8E198;
    dw $610A,$0008                                                       ;A8E199;
    db $F0                                                               ;A8E19D;
    dw $612A,$81F9                                                       ;A8E19E;
    db $E8                                                               ;A8E1A2;
    dw $6100                                                             ;A8E1A3;

Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit:
    dw $0009,$01F8                                                       ;A8E1A5;
    db $F0                                                               ;A8E1A9;
    dw $613B,$01FA                                                       ;A8E1AA;
    db $FB                                                               ;A8E1AE;
    dw $613D,$01FA                                                       ;A8E1AF;
    db $F3                                                               ;A8E1B3;
    dw $613C,$81EB                                                       ;A8E1B4;
    db $FC                                                               ;A8E1B8;
    dw $6120,$0000                                                       ;A8E1B9;
    db $F0                                                               ;A8E1BD;
    dw $612F,$81F8                                                       ;A8E1BE;
    db $08                                                               ;A8E1C2;
    dw $6106,$81F7                                                       ;A8E1C3;
    db $F8                                                               ;A8E1C7;
    dw $610A,$0006                                                       ;A8E1C8;
    db $F0                                                               ;A8E1CC;
    dw $612A,$81F8                                                       ;A8E1CD;
    db $E8                                                               ;A8E1D1;
    dw $6100                                                             ;A8E1D2;

Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit:
    dw $0006,$81F3                                                       ;A8E1D4;
    db $F3                                                               ;A8E1D8;
    dw $6124,$81EC                                                       ;A8E1D9;
    db $FC                                                               ;A8E1DD;
    dw $6122,$000A                                                       ;A8E1DE;
    db $F0                                                               ;A8E1E2;
    dw $612B,$81F8                                                       ;A8E1E3;
    db $08                                                               ;A8E1E7;
    dw $6106,$81F8                                                       ;A8E1E8;
    db $F8                                                               ;A8E1EC;
    dw $610A,$81FA                                                       ;A8E1ED;
    db $E8                                                               ;A8E1F1;
    dw $6100                                                             ;A8E1F2;

Spritemap_Alcoon_FacingRight_LookingUp:
    dw $0006,$81F3                                                       ;A8E1F4;
    db $F3                                                               ;A8E1F8;
    dw $6124,$01FE                                                       ;A8E1F9;
    db $E4                                                               ;A8E1FD;
    dw $213A,$81F6                                                       ;A8E1FE;
    db $EC                                                               ;A8E202;
    dw $6128,$81EC                                                       ;A8E203;
    db $FC                                                               ;A8E207;
    dw $6122,$81F8                                                       ;A8E208;
    db $08                                                               ;A8E20C;
    dw $6108,$81F8                                                       ;A8E20D;
    db $F8                                                               ;A8E211;
    dw $610A                                                             ;A8E212;

UNUSED_Spritemap_Alcoon_FireballProjectile_0_A8E214:
    dw $0001,$01FC                                                       ;A8E214;
    db $FC                                                               ;A8E218;
    dw $612C                                                             ;A8E219;

UNUSED_Spritemap_Alcoon_FireballProjectile_1_A8E21B:
    dw $0001,$01FC                                                       ;A8E21B;
    db $FC                                                               ;A8E21F;
    dw $E12D                                                             ;A8E220;

UNUSED_Spritemap_Alcoon_FireballProjectile_2_A8E222:
    dw $0001,$01FC                                                       ;A8E222;
    db $FC                                                               ;A8E226;
    dw $A12C                                                             ;A8E227;

UNUSED_Spritemap_Alcoon_FireballProjectile_3_A8E229:
    dw $0001,$01FC                                                       ;A8E229;
    db $FC                                                               ;A8E22D;
    dw $212D                                                             ;A8E22E;

Palette_Atomic:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20                   ;A8E230;
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1                   ;A8E240;

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

InstList_Atomic_SpinningUpRight:
    dw $0008                                                             ;A8E310;
    dw Spritemap_Atomic_0                                                ;A8E312;
    dw $0008                                                             ;A8E314;
    dw Spritemap_Atomic_1                                                ;A8E316;
    dw $0008                                                             ;A8E318;
    dw Spritemap_Atomic_2                                                ;A8E31A;
    dw $0008                                                             ;A8E31C;
    dw Spritemap_Atomic_3                                                ;A8E31E;
    dw $0008                                                             ;A8E320;
    dw Spritemap_Atomic_4                                                ;A8E322;
    dw $0008                                                             ;A8E324;
    dw Spritemap_Atomic_5                                                ;A8E326;
    dw Instruction_Common_GotoY                                          ;A8E328;
    dw InstList_Atomic_SpinningUpRight                                   ;A8E32A;

InstList_Atomic_SpinningUpLeft:
    dw $0008                                                             ;A8E32C;
    dw Spritemap_Atomic_6                                                ;A8E32E;
    dw $0008                                                             ;A8E330;
    dw Spritemap_Atomic_7                                                ;A8E332;
    dw $0008                                                             ;A8E334;
    dw Spritemap_Atomic_8                                                ;A8E336;
    dw $0008                                                             ;A8E338;
    dw Spritemap_Atomic_9                                                ;A8E33A;
    dw $0008                                                             ;A8E33C;
    dw Spritemap_Atomic_A                                                ;A8E33E;
    dw $0008                                                             ;A8E340;
    dw Spritemap_Atomic_B                                                ;A8E342;
    dw Instruction_Common_GotoY                                          ;A8E344;
    dw InstList_Atomic_SpinningUpLeft                                    ;A8E346;

InstList_Atomic_SpinningDownLeft:
    dw $0008                                                             ;A8E348;
    dw Spritemap_Atomic_5                                                ;A8E34A;
    dw $0008                                                             ;A8E34C;
    dw Spritemap_Atomic_4                                                ;A8E34E;
    dw $0008                                                             ;A8E350;
    dw Spritemap_Atomic_3                                                ;A8E352;
    dw $0008                                                             ;A8E354;
    dw Spritemap_Atomic_2                                                ;A8E356;
    dw $0008                                                             ;A8E358;
    dw Spritemap_Atomic_1                                                ;A8E35A;
    dw $0008                                                             ;A8E35C;
    dw Spritemap_Atomic_0                                                ;A8E35E;
    dw Instruction_Common_GotoY                                          ;A8E360;
    dw InstList_Atomic_SpinningDownLeft                                  ;A8E362;

InstList_Atomic_SpinningDownRight:
    dw $0008                                                             ;A8E364;
    dw Spritemap_Atomic_B                                                ;A8E366;
    dw $0008                                                             ;A8E368;
    dw Spritemap_Atomic_A                                                ;A8E36A;
    dw $0008                                                             ;A8E36C;
    dw Spritemap_Atomic_9                                                ;A8E36E;
    dw $0008                                                             ;A8E370;
    dw Spritemap_Atomic_8                                                ;A8E372;
    dw $0008                                                             ;A8E374;
    dw Spritemap_Atomic_7                                                ;A8E376;
    dw $0008                                                             ;A8E378;
    dw Spritemap_Atomic_6                                                ;A8E37A;
    dw Instruction_Common_GotoY                                          ;A8E37C;
    dw InstList_Atomic_SpinningDownRight                                 ;A8E37E;

AtomicInstListPointers:
    dw InstList_Atomic_SpinningUpRight                                   ;A8E380;
    dw InstList_Atomic_SpinningUpLeft                                    ;A8E382;
    dw InstList_Atomic_SpinningDownLeft                                  ;A8E384;
    dw InstList_Atomic_SpinningDownRight                                 ;A8E386;

InitAI_Atomic:
    LDX.W $0E54                                                          ;A8E388;
    LDA.W #$0001                                                         ;A8E38B;
    STA.W EnemyData.instTimer,X                                          ;A8E38E;
    STZ.W EnemyData.loopCounter,X                                        ;A8E391;
    LDA.W EnemyData.initParam0,X                                         ;A8E394;
    ASL A                                                                ;A8E397;
    TAY                                                                  ;A8E398;
    LDA.W AtomicInstListPointers,Y                                       ;A8E399;
    STA.W EnemyData.pInstList,X                                          ;A8E39C;
    LDA.W EnemyData.initParam1,X                                         ;A8E39F;
    ASL A                                                                ;A8E3A2;
    ASL A                                                                ;A8E3A3;
    ASL A                                                                ;A8E3A4;
    TAY                                                                  ;A8E3A5;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y                         ;A8E3A6;
    STA.L $7E7802,X                                                      ;A8E3A9;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y                       ;A8E3AD;
    STA.L $7E7800,X                                                      ;A8E3B0;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y                       ;A8E3B4;
    STA.L $7E7806,X                                                      ;A8E3B7;
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y                       ;A8E3BB;
    STA.L $7E7804,X                                                      ;A8E3BE;
    RTL                                                                  ;A8E3C2;


MainAI_Atomic:
    LDX.W $0E54                                                          ;A8E3C3;
    JSR.W ChooseAtomicYMovementFunction                                  ;A8E3C6;
    JSR.W ChooseAtomicXMovementFunction                                  ;A8E3C9;
    LDX.W $0E54                                                          ;A8E3CC;
    JSR.W ($0FA8,X)                                                      ;A8E3CF;
    LDX.W $0E54                                                          ;A8E3D2;
    JSR.W ($0FAA,X)                                                      ;A8E3D5;
    RTL                                                                  ;A8E3D8;


ChooseAtomicYMovementFunction:
    LDX.W $0E54                                                          ;A8E3D9;
    LDA.W #Function_Atomic_MoveUp                                        ;A8E3DC;
    STA.W EnemyData.work0,X                                              ;A8E3DF;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A8E3E2;
    BMI .return                                                          ;A8E3E6;
    LDA.W #Function_Atomic_MoveDown                                      ;A8E3E8;
    STA.W EnemyData.work0,X                                              ;A8E3EB;

.return:
    RTS                                                                  ;A8E3EE;


ChooseAtomicXMovementFunction:
    LDX.W $0E54                                                          ;A8E3EF;
    LDA.W #Function_Atomic_MoveLeft                                      ;A8E3F2;
    STA.W EnemyData.work1,X                                              ;A8E3F5;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8E3F8;
    BMI .return                                                          ;A8E3FC;
    LDA.W #Function_Atomic_MoveRight                                     ;A8E3FE;
    STA.W EnemyData.work1,X                                              ;A8E401;

.return:
    RTS                                                                  ;A8E404;


Function_Atomic_MoveUp:
    LDX.W $0E54                                                          ;A8E405;
    LDA.W EnemyData.yPosition,X                                          ;A8E408;
    CLC                                                                  ;A8E40B;
    ADC.L $7E7806,X                                                      ;A8E40C;
    STA.W EnemyData.yPosition,X                                          ;A8E410;
    LDA.W EnemyData.ySubPosition,X                                       ;A8E413;
    CLC                                                                  ;A8E416;
    ADC.L $7E7804,X                                                      ;A8E417;
    BCC .done                                                            ;A8E41B;
    INC.W EnemyData.yPosition,X                                          ;A8E41D;

.done:
    STA.W EnemyData.ySubPosition,X                                       ;A8E420;
    RTS                                                                  ;A8E423;


Function_Atomic_MoveDown:
    LDX.W $0E54                                                          ;A8E424;
    LDA.W EnemyData.yPosition,X                                          ;A8E427;
    CLC                                                                  ;A8E42A;
    ADC.L $7E7802,X                                                      ;A8E42B;
    STA.W EnemyData.yPosition,X                                          ;A8E42F;
    LDA.W EnemyData.ySubPosition,X                                       ;A8E432;
    CLC                                                                  ;A8E435;
    ADC.L $7E7800,X                                                      ;A8E436;
    BCC .done                                                            ;A8E43A;
    INC.W EnemyData.yPosition,X                                          ;A8E43C;

.done:
    STA.W EnemyData.ySubPosition,X                                       ;A8E43F;
    RTS                                                                  ;A8E442;


Function_Atomic_MoveLeft:
    LDX.W $0E54                                                          ;A8E443;
    LDA.W EnemyData.xPosition,X                                          ;A8E446;
    CLC                                                                  ;A8E449;
    ADC.L $7E7806,X                                                      ;A8E44A;
    STA.W EnemyData.xPosition,X                                          ;A8E44E;
    LDA.W EnemyData.xSubPosition,X                                       ;A8E451;
    CLC                                                                  ;A8E454;
    ADC.L $7E7804,X                                                      ;A8E455;
    BCC .done                                                            ;A8E459;
    INC.W EnemyData.xPosition,X                                          ;A8E45B;

.done:
    STA.W EnemyData.xSubPosition,X                                       ;A8E45E;
    RTS                                                                  ;A8E461;


Function_Atomic_MoveRight:
    LDX.W $0E54                                                          ;A8E462;
    LDA.W EnemyData.xPosition,X                                          ;A8E465;
    CLC                                                                  ;A8E468;
    ADC.L $7E7802,X                                                      ;A8E469;
    STA.W EnemyData.xPosition,X                                          ;A8E46D;
    LDA.W EnemyData.xSubPosition,X                                       ;A8E470;
    CLC                                                                  ;A8E473;
    ADC.L $7E7800,X                                                      ;A8E474;
    BCC .done                                                            ;A8E478;
    INC.W EnemyData.xPosition,X                                          ;A8E47A;

.done:
    STA.W EnemyData.xSubPosition,X                                       ;A8E47D;
    RTS                                                                  ;A8E480;


UNUSED_Atomic_GetEnemyIndex_A8E481:
    LDX.W $0E54                                                          ;A8E481;
    RTL                                                                  ;A8E484;


UNUSED_Atomic_GetEnemyIndex_A8E485:
    LDX.W $0E54                                                          ;A8E485;
    RTL                                                                  ;A8E488;


Spritemap_Atomic_0:
    dw $0004,$01F8                                                       ;A8E489;
    db $00                                                               ;A8E48D;
    dw $2102,$81F8                                                       ;A8E48E;
    db $F8                                                               ;A8E492;
    dw $2100,$01FC                                                       ;A8E493;
    db $F4                                                               ;A8E497;
    dw $2103,$0004                                                       ;A8E498;
    db $FC                                                               ;A8E49C;
    dw $2103                                                             ;A8E49D;

Spritemap_Atomic_1:
    dw $0004,$01FC                                                       ;A8E49F;
    db $FC                                                               ;A8E4A3;
    dw $2102,$81F8                                                       ;A8E4A4;
    db $F8                                                               ;A8E4A8;
    dw $2100,$01F8                                                       ;A8E4A9;
    db $F8                                                               ;A8E4AD;
    dw $2103,$0000                                                       ;A8E4AE;
    db $00                                                               ;A8E4B2;
    dw $2103                                                             ;A8E4B3;

Spritemap_Atomic_2:
    dw $0004,$0000                                                       ;A8E4B5;
    db $F8                                                               ;A8E4B9;
    dw $2102,$81F8                                                       ;A8E4BA;
    db $F8                                                               ;A8E4BE;
    dw $2100,$01F4                                                       ;A8E4BF;
    db $FC                                                               ;A8E4C3;
    dw $2103,$01FC                                                       ;A8E4C4;
    db $04                                                               ;A8E4C8;
    dw $2103                                                             ;A8E4C9;

Spritemap_Atomic_3:
    dw $0004,$01F4                                                       ;A8E4CB;
    db $FC                                                               ;A8E4CF;
    dw $2102,$01FC                                                       ;A8E4D0;
    db $04                                                               ;A8E4D4;
    dw $2102,$81F8                                                       ;A8E4D5;
    db $F8                                                               ;A8E4D9;
    dw $2100,$0001                                                       ;A8E4DA;
    db $F7                                                               ;A8E4DE;
    dw $2103                                                             ;A8E4DF;

Spritemap_Atomic_4:
    dw $0003,$01F8                                                       ;A8E4E1;
    db $F8                                                               ;A8E4E5;
    dw $2102,$0000                                                       ;A8E4E6;
    db $00                                                               ;A8E4EA;
    dw $2102,$81F8                                                       ;A8E4EB;
    db $F8                                                               ;A8E4EF;
    dw $2100                                                             ;A8E4F0;

Spritemap_Atomic_5:
    dw $0004,$01FC                                                       ;A8E4F2;
    db $F4                                                               ;A8E4F6;
    dw $2102,$0004                                                       ;A8E4F7;
    db $FC                                                               ;A8E4FB;
    dw $2102,$81F8                                                       ;A8E4FC;
    db $F8                                                               ;A8E500;
    dw $2100,$01F7                                                       ;A8E501;
    db $01                                                               ;A8E505;
    dw $2103                                                             ;A8E506;

Spritemap_Atomic_6:
    dw $0004,$0000                                                       ;A8E508;
    db $00                                                               ;A8E50C;
    dw $2102,$81F8                                                       ;A8E50D;
    db $F8                                                               ;A8E511;
    dw $2100,$01FC                                                       ;A8E512;
    db $F4                                                               ;A8E516;
    dw $2103,$01F4                                                       ;A8E517;
    db $FC                                                               ;A8E51B;
    dw $2103                                                             ;A8E51C;

Spritemap_Atomic_7:
    dw $0004,$01FC                                                       ;A8E51E;
    db $FC                                                               ;A8E522;
    dw $2102,$81F8                                                       ;A8E523;
    db $F8                                                               ;A8E527;
    dw $2100,$0000                                                       ;A8E528;
    db $F8                                                               ;A8E52C;
    dw $6103,$01F8                                                       ;A8E52D;
    db $00                                                               ;A8E531;
    dw $6103                                                             ;A8E532;

Spritemap_Atomic_8:
    dw $0004,$01F8                                                       ;A8E534;
    db $F8                                                               ;A8E538;
    dw $2102,$81F8                                                       ;A8E539;
    db $F8                                                               ;A8E53D;
    dw $2100,$0004                                                       ;A8E53E;
    db $FC                                                               ;A8E542;
    dw $2103,$01FC                                                       ;A8E543;
    db $04                                                               ;A8E547;
    dw $2103                                                             ;A8E548;

Spritemap_Atomic_9:
    dw $0004,$0004                                                       ;A8E54A;
    db $FC                                                               ;A8E54E;
    dw $2102,$01FC                                                       ;A8E54F;
    db $04                                                               ;A8E553;
    dw $2102,$81F8                                                       ;A8E554;
    db $F8                                                               ;A8E558;
    dw $2100,$01F7                                                       ;A8E559;
    db $F7                                                               ;A8E55D;
    dw $2103                                                             ;A8E55E;

Spritemap_Atomic_A:
    dw $0003,$0000                                                       ;A8E560;
    db $F8                                                               ;A8E564;
    dw $2102,$01F8                                                       ;A8E565;
    db $00                                                               ;A8E569;
    dw $2102,$81F8                                                       ;A8E56A;
    db $F8                                                               ;A8E56E;
    dw $2100                                                             ;A8E56F;

Spritemap_Atomic_B:
    dw $0004,$01FC                                                       ;A8E571;
    db $F4                                                               ;A8E575;
    dw $2102,$01F4                                                       ;A8E576;
    db $FC                                                               ;A8E57A;
    dw $2102,$81F8                                                       ;A8E57B;
    db $F8                                                               ;A8E57F;
    dw $2100,$0001                                                       ;A8E580;
    db $01                                                               ;A8E584;
    dw $2103                                                             ;A8E585;

Palette_Spark:
    dw $3800,$7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA                   ;A8E587;
    dw $03E0,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;A8E597;

InstList_Spark_FlickerOn:
    dw Instruction_Spark_SetAsTangible                                   ;A8E5A7;
    dw $0001                                                             ;A8E5A9;
    dw Spritemap_Spark_Flickering_0                                      ;A8E5AB;
    dw $0002                                                             ;A8E5AD;
    dw Spritemap_CommonA8_Nothing                                        ;A8E5AF;
    dw $0001                                                             ;A8E5B1;
    dw Spritemap_Spark_Flickering_0                                      ;A8E5B3;
    dw $0002                                                             ;A8E5B5;
    dw Spritemap_CommonA8_Nothing                                        ;A8E5B7;
    dw $0001                                                             ;A8E5B9;
    dw Spritemap_Spark_Flickering_1                                      ;A8E5BB;
    dw $0002                                                             ;A8E5BD;
    dw Spritemap_CommonA8_Nothing                                        ;A8E5BF;
    dw $0001                                                             ;A8E5C1;
    dw Spritemap_Spark_Flickering_1                                      ;A8E5C3;
    dw $0001                                                             ;A8E5C5;
    dw Spritemap_CommonA8_Nothing                                        ;A8E5C7;
    dw $0002                                                             ;A8E5C9;
    dw Spritemap_Spark_Flickering_2                                      ;A8E5CB;
    dw $0002                                                             ;A8E5CD;
    dw Spritemap_Spark_Flickering_3                                      ;A8E5CF;

InstList_Spark_Constant:
    dw $0003                                                             ;A8E5D1;
    dw Spritemap_Spark_Constant_0                                        ;A8E5D3;
    dw $0003                                                             ;A8E5D5;
    dw Spritemap_Spark_Constant_1                                        ;A8E5D7;
    dw $0003                                                             ;A8E5D9;
    dw Spritemap_Spark_Constant_2                                        ;A8E5DB;
    dw $0003                                                             ;A8E5DD;
    dw Spritemap_Spark_Constant_3                                        ;A8E5DF;
    dw Instruction_Common_GotoY                                          ;A8E5E1;
    dw InstList_Spark_Constant                                           ;A8E5E3;

InstList_Spark_FlickerOut:
    dw $0001                                                             ;A8E5E5;
    dw Spritemap_Spark_Flickering_0                                      ;A8E5E7;
    dw $0001                                                             ;A8E5E9;
    dw Spritemap_Spark_Flickering_0                                      ;A8E5EB;
    dw $0001                                                             ;A8E5ED;
    dw Spritemap_Spark_Flickering_1                                      ;A8E5EF;
    dw $0001                                                             ;A8E5F1;
    dw Spritemap_Spark_Flickering_1                                      ;A8E5F3;
    dw $0001                                                             ;A8E5F5;
    dw Spritemap_Spark_Flickering_2                                      ;A8E5F7;
    dw $0001                                                             ;A8E5F9;
    dw Spritemap_CommonA8_Nothing                                        ;A8E5FB;
    dw $0001                                                             ;A8E5FD;
    dw Spritemap_Spark_Flickering_2                                      ;A8E5FF;
    dw $0001                                                             ;A8E601;
    dw Spritemap_CommonA8_Nothing                                        ;A8E603;
    dw Instruction_Spark_SetAsIntangible                                 ;A8E605;
    dw Instruction_CommonA8_Sleep                                        ;A8E607;

InstList_Spark_EmitFallingSparks:
    dw $0003                                                             ;A8E609;
    dw Spritemap_Spark_Flickering_0                                      ;A8E60B;
    dw $0003                                                             ;A8E60D;
    dw Spritemap_Spark_Flickering_1                                      ;A8E60F;
    dw $0003                                                             ;A8E611;
    dw Spritemap_Spark_Flickering_2                                      ;A8E613;
    dw $0003                                                             ;A8E615;
    dw Spritemap_Spark_Flickering_3                                      ;A8E617;
    dw Instruction_Common_GotoY                                          ;A8E619;
    dw InstList_Spark_EmitFallingSparks                                  ;A8E61B;

Instruction_Spark_SetAsIntangible:
    LDX.W $0E54                                                          ;A8E61D;
    LDA.W EnemyData.properties,X                                         ;A8E620;
    ORA.W #$0400                                                         ;A8E623;
    STA.W EnemyData.properties,X                                         ;A8E626;
    RTL                                                                  ;A8E629;


Instruction_Spark_SetAsTangible:
    LDX.W $0E54                                                          ;A8E62A;
    LDA.W EnemyData.properties,X                                         ;A8E62D;
    AND.W #$FBFF                                                         ;A8E630;
    STA.W EnemyData.properties,X                                         ;A8E633;
    RTL                                                                  ;A8E636;


InitAI_Spark:
    LDX.W $0E54                                                          ;A8E637;
    LDA.W EnemyData.initParam0,X                                         ;A8E63A;
    AND.W #$0003                                                         ;A8E63D;
    ASL A                                                                ;A8E640;
    TAY                                                                  ;A8E641;
    LDA.W .functionPointers,Y                                            ;A8E642;
    STA.W EnemyData.work1,X                                              ;A8E645;
    LDA.W EnemyData.initParam1,X                                         ;A8E648;
    STA.W EnemyData.work4,X                                              ;A8E64B;
    STZ.B $12                                                            ;A8E64E;
    JSR.W SetSparkFunctionTimer                                          ;A8E650;
    LDA.W #$0001                                                         ;A8E653;
    STA.W EnemyData.instTimer,X                                          ;A8E656;
    LDA.W .instListPointers,Y                                            ;A8E659;
    STA.W EnemyData.pInstList,X                                          ;A8E65C;
    STZ.W EnemyData.loopCounter,X                                        ;A8E65F;
    LDA.W #$0001                                                         ;A8E662;
    STA.W EnemyData.instTimer,X                                          ;A8E665;
    LDX.W $079F                                                          ;A8E668;
    LDA.L $7ED828,X                                                      ;A8E66B;
    AND.W #$0001                                                         ;A8E66F;
    BEQ .PhantoonAlive                                                   ;A8E672;
    RTL                                                                  ;A8E674;


.PhantoonAlive:
    LDX.W $0E54                                                          ;A8E675;
    LDA.W EnemyData.properties,X                                         ;A8E678;
    ORA.W $0100                                                          ;A8E67B; >_<
    STA.W EnemyData.properties,X                                         ;A8E67E;
    RTL                                                                  ;A8E681;


.instListPointers:
    dw InstList_Spark_Constant                                           ;A8E682;
    dw InstList_Spark_Constant                                           ;A8E684;
    dw InstList_Spark_EmitFallingSparks                                  ;A8E686;

.functionPointers:
    dw RTL_A8E694                                                        ;A8E688;
    dw Function_Spark_Intermittent_Active                                ;A8E68A;
    dw Function_Spark_EmitFallingSparks                                  ;A8E68C;

MainAI_Spark:
    LDX.W $0E54                                                          ;A8E68E;
    JMP.W ($0FAA,X)                                                      ;A8E691;


RTL_A8E694:
    RTL                                                                  ;A8E694;


Function_Spark_Intermittent_Inactive:
    LDA.W EnemyData.work5,X                                              ;A8E695;
    DEC A                                                                ;A8E698;
    BEQ .timerExpired                                                    ;A8E699;
    STA.W EnemyData.work5,X                                              ;A8E69B;
    RTL                                                                  ;A8E69E;


.timerExpired:
    LDA.W #Function_Spark_Intermittent_Active                            ;A8E69F;
    STA.W EnemyData.work1,X                                              ;A8E6A2;
    LDA.W #InstList_Spark_FlickerOn                                      ;A8E6A5;
    STA.W EnemyData.pInstList,X                                          ;A8E6A8;
    LDA.W #$0001                                                         ;A8E6AB;
    STA.W EnemyData.instTimer,X                                          ;A8E6AE;
    STZ.B $12                                                            ;A8E6B1;
    JSR.W SetSparkFunctionTimer                                          ;A8E6B3;
    RTL                                                                  ;A8E6B6;


Function_Spark_Intermittent_Active:
    LDA.W EnemyData.work5,X                                              ;A8E6B7;
    DEC A                                                                ;A8E6BA;
    BEQ .timerExpired                                                    ;A8E6BB;
    STA.W EnemyData.work5,X                                              ;A8E6BD;
    RTL                                                                  ;A8E6C0;


.timerExpired:
    LDA.W #Function_Spark_Intermittent_Inactive                          ;A8E6C1;
    STA.W EnemyData.work1,X                                              ;A8E6C4;
    LDA.W #InstList_Spark_FlickerOut                                     ;A8E6C7;
    STA.W EnemyData.pInstList,X                                          ;A8E6CA;
    LDA.W #$0001                                                         ;A8E6CD;
    STA.W EnemyData.instTimer,X                                          ;A8E6D0;
    LDA.W #$0008                                                         ;A8E6D3;
    STA.B $12                                                            ;A8E6D6;
    JSR.W SetSparkFunctionTimer                                          ;A8E6D8;
    RTL                                                                  ;A8E6DB;


Function_Spark_EmitFallingSparks:
    LDA.W EnemyData.work5,X                                              ;A8E6DC;
    DEC A                                                                ;A8E6DF;
    BEQ .timerExpired                                                    ;A8E6E0;
    STA.W EnemyData.work5,X                                              ;A8E6E2;
    RTL                                                                  ;A8E6E5;


.timerExpired:
    LDX.W $0E54                                                          ;A8E6E6;
    LDY.W #EnemyProjectile_FallingSpark                                  ;A8E6E9;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8E6EC;
    STZ.B $12                                                            ;A8E6F0;
    JSR.W SetSparkFunctionTimer                                          ;A8E6F2;
    RTL                                                                  ;A8E6F5;


SetSparkFunctionTimer:
    LDA.W EnemyData.work4,X                                              ;A8E6F6;
    BPL .noRNG                                                           ;A8E6F9;
    JSL.L GenerateRandomNumber                                           ;A8E6FB;
    AND.W #$003F                                                         ;A8E6FF;
    CLC                                                                  ;A8E702;
    ADC.W #$0004                                                         ;A8E703;

.noRNG:
    CLC                                                                  ;A8E706;
    ADC.B $12                                                            ;A8E707;
    STA.W EnemyData.work5,X                                              ;A8E709;
    RTS                                                                  ;A8E70C;


RTL_A8E70D:
    RTL                                                                  ;A8E70D;


EnemyShot_Spark:
    PHX                                                                  ;A8E70E;
    LDA.W $18A6                                                          ;A8E70F;
    ASL A                                                                ;A8E712;
    TAX                                                                  ;A8E713;
    LDA.W $0C04,X                                                        ;A8E714;
    AND.W #$FFEF                                                         ;A8E717;
    STA.W $0C04,X                                                        ;A8E71A;
    PLX                                                                  ;A8E71D;
    RTL                                                                  ;A8E71E;


Spritemap_Spark_Constant_0:
    dw $0002,$01FC                                                       ;A8E71F;
    db $01                                                               ;A8E723;
    dw $3103,$01FC                                                       ;A8E724;
    db $FC                                                               ;A8E728;
    dw $3100                                                             ;A8E729;

Spritemap_Spark_Constant_1:
    dw $0002,$01FC                                                       ;A8E72B;
    db $06                                                               ;A8E72F;
    dw $7104,$01FC                                                       ;A8E730;
    db $FC                                                               ;A8E734;
    dw $3101                                                             ;A8E735;

Spritemap_Spark_Constant_2:
    dw $0002,$01FC                                                       ;A8E737;
    db $08                                                               ;A8E73B;
    dw $3105,$01FC                                                       ;A8E73C;
    db $FC                                                               ;A8E740;
    dw $3102                                                             ;A8E741;

Spritemap_Spark_Constant_3:
    dw $0002,$01FC                                                       ;A8E743;
    db $0A                                                               ;A8E747;
    dw $3106,$01FC                                                       ;A8E748;
    db $FC                                                               ;A8E74C;
    dw $7101                                                             ;A8E74D;

Spritemap_Spark_Flickering_0:
    dw $0005,$0002                                                       ;A8E74F;
    db $FE                                                               ;A8E753;
    dw $3109,$01F6                                                       ;A8E754;
    db $FC                                                               ;A8E758;
    dw $3108,$0000                                                       ;A8E759;
    db $F8                                                               ;A8E75D;
    dw $3107,$01FC                                                       ;A8E75E;
    db $03                                                               ;A8E762;
    dw $3103,$01FC                                                       ;A8E763;
    db $FC                                                               ;A8E767;
    dw $3100                                                             ;A8E768;

Spritemap_Spark_Flickering_1:
    dw $0005,$01F4                                                       ;A8E76A;
    db $FC                                                               ;A8E76E;
    dw $3109,$0004                                                       ;A8E76F;
    db $00                                                               ;A8E773;
    dw $310A,$0002                                                       ;A8E774;
    db $F6                                                               ;A8E778;
    dw $3108,$01FC                                                       ;A8E779;
    db $06                                                               ;A8E77D;
    dw $7104,$01FC                                                       ;A8E77E;
    db $FC                                                               ;A8E782;
    dw $3101                                                             ;A8E783;

Spritemap_Spark_Flickering_2:
    dw $0004,$01F4                                                       ;A8E785;
    db $FC                                                               ;A8E789;
    dw $310A,$0004                                                       ;A8E78A;
    db $F4                                                               ;A8E78E;
    dw $3109,$01FC                                                       ;A8E78F;
    db $09                                                               ;A8E793;
    dw $3105,$01FC                                                       ;A8E794;
    db $FC                                                               ;A8E798;
    dw $3102                                                             ;A8E799;

Spritemap_Spark_Flickering_3:
    dw $0003,$0004                                                       ;A8E79B;
    db $F4                                                               ;A8E79F;
    dw $310A,$01FC                                                       ;A8E7A0;
    db $0E                                                               ;A8E7A4;
    dw $3106,$01FC                                                       ;A8E7A5;
    db $FC                                                               ;A8E7A9;
    dw $7101                                                             ;A8E7AA;

Palette_FaceBlock:
    dw $3800,$72B2,$71C7,$2461,$1840,$7A8E,$660B,$4D03                   ;A8E7AC;
    dw $30A4,$30A4,$2461,$1840,$0800,$0000,$0000,$0000                   ;A8E7BC;

FaceBlockGlowColors:
    dw $001F,$0012,$000A,$002B,$051F,$0096,$0011,$0007                   ;A8E7CC;
    dw $0A3F,$013B,$0018,$000D,$0F3F,$01BF,$001F,$0012                   ;A8E7DC;
    dw $0F3F,$01BF,$001F,$0012,$0A3F,$013B,$0018,$000D                   ;A8E7EC;
    dw $051F,$0096,$0011,$0007,$001F,$0012,$000A,$002B                   ;A8E7FC;

InstList_FaceBlock_TurningLeft:
    dw $0030                                                             ;A8E80C;
    dw Spritemap_FaceBlock_FacingForward                                 ;A8E80E;
    dw $0010                                                             ;A8E810;
    dw Spritemap_FaceBlock_TurningLeft                                   ;A8E812;
    dw $0010                                                             ;A8E814;
    dw Spritemap_FaceBlock_FacingLeft                                    ;A8E816;
    dw Instruction_Common_Sleep                                          ;A8E818;

InstList_FaceBlock_TurningRight:
    dw $0030                                                             ;A8E81A;
    dw Spritemap_FaceBlock_FacingForward                                 ;A8E81C;
    dw $0010                                                             ;A8E81E;
    dw Spritemap_FaceBlock_TurningRight                                  ;A8E820;
    dw $0010                                                             ;A8E822;
    dw Spritemap_FaceBlock_FacingRight                                   ;A8E824;
    dw Instruction_Common_Sleep                                          ;A8E826;

InstList_FaceBlock_FacingForward:
    dw $0001                                                             ;A8E828;
    dw Spritemap_FaceBlock_FacingForward                                 ;A8E82A;
    dw Instruction_Common_Sleep                                          ;A8E82C;

InitAI_FaceBlock:
    LDX.W $0E54                                                          ;A8E82E;
    LDA.W #InstList_FaceBlock_FacingForward                              ;A8E831;
    STA.W EnemyData.pInstList,X                                          ;A8E834;
    LDY.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes    ;A8E837;
    LDA.W $09A4                                                          ;A8E83A;
    BIT.W #$0004                                                         ;A8E83D;
    BNE .morphBallCollected                                              ;A8E840;
    LDY.W #RTL_A8804C                                                    ;A8E842;

.morphBallCollected:
    STY.W $178C                                                          ;A8E845;
    LDA.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes>>16 ;A8E848;
    STA.W $178E                                                          ;A8E84B;
    LDA.W EnemyData.palette,X                                            ;A8E84E;
    ASL A                                                                ;A8E851;
    ASL A                                                                ;A8E852;
    ASL A                                                                ;A8E853;
    ASL A                                                                ;A8E854;
    AND.W #$FF00                                                         ;A8E855;
    XBA                                                                  ;A8E858;
    STA.W $1794                                                          ;A8E859;
    LDA.W #$0010                                                         ;A8E85C;
    STA.W $1798                                                          ;A8E85F;
    LDA.W EnemyData.initParam1,X                                         ;A8E862;
    AND.W #$0001                                                         ;A8E865;
    ROR A                                                                ;A8E868;
    ROR A                                                                ;A8E869;
    STA.W EnemyData.initParam1,X                                         ;A8E86A;
    RTL                                                                  ;A8E86D;


EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes:
    LDA.W $0797                                                          ;A8E86E;
    BNE .return                                                          ;A8E871;
    LDA.W $1798                                                          ;A8E873;
    DEC A                                                                ;A8E876;
    STA.W $1798                                                          ;A8E877;
    BNE .return                                                          ;A8E87A;
    LDA.W #$0010                                                         ;A8E87C;
    STA.W $1798                                                          ;A8E87F;
    LDA.W $1794                                                          ;A8E882;
    TAX                                                                  ;A8E885;
    LDA.W $1796                                                          ;A8E886;
    ASL A                                                                ;A8E889;
    ASL A                                                                ;A8E88A;
    ASL A                                                                ;A8E88B;
    TAY                                                                  ;A8E88C;
    LDA.W #$0004                                                         ;A8E88D;
    STA.W $060B                                                          ;A8E890;

.loopColors:
    LDA.W FaceBlockGlowColors,Y                                          ;A8E893;
    STA.L $7EC112,X                                                      ;A8E896;
    INY                                                                  ;A8E89A;
    INY                                                                  ;A8E89B;
    INX                                                                  ;A8E89C;
    INX                                                                  ;A8E89D;
    DEC.W $060B                                                          ;A8E89E;
    BNE .loopColors                                                      ;A8E8A1;
    LDA.W $1796                                                          ;A8E8A3;
    INC A                                                                ;A8E8A6;
    AND.W #$0007                                                         ;A8E8A7;
    STA.W $1796                                                          ;A8E8AA;

.return:
    RTL                                                                  ;A8E8AD;


MainAI_FaceBlock:
    LDX.W $0E54                                                          ;A8E8AE;
    LDA.W $09A4                                                          ;A8E8B1;
    BIT.W #$0004                                                         ;A8E8B4;
    BEQ .return                                                          ;A8E8B7;
    LDY.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes    ;A8E8B9;
    STY.W $178C                                                          ;A8E8BC;
    LDA.W EnemyData.palette,X                                            ;A8E8BF;
    ASL A                                                                ;A8E8C2;
    ASL A                                                                ;A8E8C3;
    ASL A                                                                ;A8E8C4;
    ASL A                                                                ;A8E8C5;
    AND.W #$FF00                                                         ;A8E8C6;
    XBA                                                                  ;A8E8C9;
    STA.W $1794                                                          ;A8E8CA;
    LDA.W EnemyData.work0,X                                              ;A8E8CD;
    BNE .return                                                          ;A8E8D0;
    JSL.L Get_SamusY_minus_EnemyY                                        ;A8E8D2;
    JSL.L NegateA_A0B067                                                 ;A8E8D6;
    CMP.W EnemyData.initParam0,X                                         ;A8E8DA;
    BPL .return                                                          ;A8E8DD;
    JSL.L Get_SamusX_minus_EnemyX                                        ;A8E8DF;
    STA.W EnemyData.work1,X                                              ;A8E8E3;
    JSL.L NegateA_A0B067                                                 ;A8E8E6;
    CMP.W EnemyData.initParam0,X                                         ;A8E8EA;
    BPL .return                                                          ;A8E8ED;
    LDA.W EnemyData.work1,X                                              ;A8E8EF;
    AND.W #$8000                                                         ;A8E8F2;
    CMP.W EnemyData.initParam1,X                                         ;A8E8F5;
    BEQ .return                                                          ;A8E8F8;
    LDY.W #InstList_FaceBlock_TurningLeft                                ;A8E8FA;
    LDA.W EnemyData.work1,X                                              ;A8E8FD;
    BMI .keepLeft                                                        ;A8E900;
    LDY.W #InstList_FaceBlock_TurningRight                               ;A8E902;

.keepLeft:
    TYA                                                                  ;A8E905;
    STA.W EnemyData.pInstList,X                                          ;A8E906;
    LDA.W #$0001                                                         ;A8E909;
    STA.W EnemyData.instTimer,X                                          ;A8E90C;
    LDA.W #$0001                                                         ;A8E90F;
    STA.W EnemyData.work0,X                                              ;A8E912;
    LDA.W #$0010                                                         ;A8E915;
    STA.W $1798                                                          ;A8E918;

.return:
    RTL                                                                  ;A8E91B;


RTL_A8E91C:
    RTL                                                                  ;A8E91C;


EnemyShot_FaceBlock:
    LDA.W $18A6                                                          ;A8E91D;
    ASL A                                                                ;A8E920;
    TAX                                                                  ;A8E921;
    LDA.W $0C04,X                                                        ;A8E922;
    AND.W #$FFEF                                                         ;A8E925;
    STA.W $0C04,X                                                        ;A8E928;
    RTL                                                                  ;A8E92B;


Spritemap_FaceBlock_FacingForward:
    dw $0004,$0000                                                       ;A8E92C;
    db $00                                                               ;A8E930;
    dw $3107,$01F8                                                       ;A8E931;
    db $00                                                               ;A8E935;
    dw $3106,$0000                                                       ;A8E936;
    db $F8                                                               ;A8E93A;
    dw $3101,$01F8                                                       ;A8E93B;
    db $F8                                                               ;A8E93F;
    dw $3100                                                             ;A8E940;

Spritemap_FaceBlock_TurningLeft:
    dw $0004,$0000                                                       ;A8E942;
    db $00                                                               ;A8E946;
    dw $3109,$01F8                                                       ;A8E947;
    db $00                                                               ;A8E94B;
    dw $3108,$0000                                                       ;A8E94C;
    db $F8                                                               ;A8E950;
    dw $3103,$01F8                                                       ;A8E951;
    db $F8                                                               ;A8E955;
    dw $3102                                                             ;A8E956;

Spritemap_FaceBlock_FacingLeft:
    dw $0004,$0000                                                       ;A8E958;
    db $00                                                               ;A8E95C;
    dw $310B,$01F8                                                       ;A8E95D;
    db $00                                                               ;A8E961;
    dw $310A,$0000                                                       ;A8E962;
    db $F8                                                               ;A8E966;
    dw $3105,$01F8                                                       ;A8E967;
    db $F8                                                               ;A8E96B;
    dw $3104                                                             ;A8E96C;

Spritemap_FaceBlock_TurningRight:
    dw $0004,$01F8                                                       ;A8E96E;
    db $00                                                               ;A8E972;
    dw $7109,$0000                                                       ;A8E973;
    db $00                                                               ;A8E977;
    dw $7108,$01F8                                                       ;A8E978;
    db $F8                                                               ;A8E97C;
    dw $7103,$0000                                                       ;A8E97D;
    db $F8                                                               ;A8E981;
    dw $7102                                                             ;A8E982;

Spritemap_FaceBlock_FacingRight:
    dw $0004,$01F8                                                       ;A8E984;
    db $00                                                               ;A8E988;
    dw $710B,$0000                                                       ;A8E989;
    db $00                                                               ;A8E98D;
    dw $710A,$01F8                                                       ;A8E98E;
    db $F8                                                               ;A8E992;
    dw $7105,$0000                                                       ;A8E993;
    db $F8                                                               ;A8E997;
    dw $7104                                                             ;A8E998;

Palette_KihunterGreen:
    dw $3800,$4B57,$3A4D,$0CE2,$0040,$46B0,$2E0B,$1D66                   ;A8E99A;
    dw $1524,$48FF,$38B6,$246E,$1448,$03FF,$0237,$00D1                   ;A8E9AA;

Palette_KihunterYellow:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610                   ;A8E9BA;
    dw $1DCE,$03E0,$0301,$01A1,$00C1,$6BFA,$42B0,$1545                   ;A8E9CA;

Palette_KihunterRed:
    dw $3800,$5ADF,$3975,$0C0A,$0006,$4E1A,$2D33,$1C8E                   ;A8E9DA;
    dw $102B,$6F11,$522A,$3124,$1824,$02FF,$01BF,$000F                   ;A8E9EA;

InstList_Kihunter_Idling_FacingLeft:
    dw $0002                                                             ;A8E9FA;
    dw Spritemap_Kihunter_0                                              ;A8E9FC;
    dw $0002                                                             ;A8E9FE;
    dw Spritemap_Kihunter_1                                              ;A8EA00;
    dw $0001                                                             ;A8EA02;
    dw Spritemap_Kihunter_2                                              ;A8EA04;
    dw Instruction_Kihunter_SetIdlingInstListsFacingForwards             ;A8EA06;

InstList_Kihunter_Swiping_FacingLeft:
    dw $0002                                                             ;A8EA08;
    dw Spritemap_Kihunter_11                                             ;A8EA0A;
    dw $0006                                                             ;A8EA0C;
    dw Spritemap_Kihunter_12                                             ;A8EA0E;
    dw $0002                                                             ;A8EA10;
    dw Spritemap_Kihunter_11                                             ;A8EA12;
    dw $0002                                                             ;A8EA14;
    dw Spritemap_Kihunter_10                                             ;A8EA16;
    dw $0002                                                             ;A8EA18;
    dw Spritemap_Kihunter_13                                             ;A8EA1A;
    dw $0020                                                             ;A8EA1C;
    dw Spritemap_Kihunter_14                                             ;A8EA1E;
    dw Instruction_Common_GotoY                                          ;A8EA20;
    dw InstList_Kihunter_Idling_FacingLeft                               ;A8EA22;

InstList_Kihunter_Idling_FacingRight:
    dw $0002                                                             ;A8EA24;
    dw Spritemap_Kihunter_8                                              ;A8EA26;
    dw $0002                                                             ;A8EA28;
    dw Spritemap_Kihunter_9                                              ;A8EA2A;
    dw $0001                                                             ;A8EA2C;
    dw Spritemap_Kihunter_A                                              ;A8EA2E;
    dw Instruction_Kihunter_SetIdlingInstListsFacingForwards             ;A8EA30;

InstList_Kihunter_Swiping_FacingRight:
    dw $0002                                                             ;A8EA32;
    dw Spritemap_Kihunter_16                                             ;A8EA34;
    dw $0006                                                             ;A8EA36;
    dw Spritemap_Kihunter_17                                             ;A8EA38;
    dw $0002                                                             ;A8EA3A;
    dw Spritemap_Kihunter_16                                             ;A8EA3C;
    dw $0002                                                             ;A8EA3E;
    dw Spritemap_Kihunter_15                                             ;A8EA40;
    dw $0002                                                             ;A8EA42;
    dw Spritemap_Kihunter_18                                             ;A8EA44;
    dw $0020                                                             ;A8EA46;
    dw Spritemap_Kihunter_19                                             ;A8EA48;
    dw Instruction_Common_GotoY                                          ;A8EA4A;
    dw InstList_Kihunter_Idling_FacingRight                              ;A8EA4C;

InstList_KihunterWings_FacingLeft:
    dw $0002                                                             ;A8EA4E;
    dw Spritemap_Kihunter_3                                              ;A8EA50;
    dw $0002                                                             ;A8EA52;
    dw Spritemap_Kihunter_4                                              ;A8EA54;
    dw $0001                                                             ;A8EA56;
    dw Spritemap_Kihunter_5                                              ;A8EA58;
    dw Instruction_CommonA8_GotoY                                        ;A8EA5A;
    dw InstList_KihunterWings_FacingLeft                                 ;A8EA5C;

InstList_KihunterWings_FacingRight:
    dw $0002                                                             ;A8EA5E;
    dw Spritemap_Kihunter_B                                              ;A8EA60;
    dw $0002                                                             ;A8EA62;
    dw Spritemap_Kihunter_C                                              ;A8EA64;
    dw $0001                                                             ;A8EA66;
    dw Spritemap_Kihunter_D                                              ;A8EA68;
    dw Instruction_Common_GotoY                                          ;A8EA6A;
    dw InstList_KihunterWings_FacingRight                                ;A8EA6C;

UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E:
    dw $0010                                                             ;A8EA6E;
    dw Spritemap_Kihunter_6                                              ;A8EA70;
    dw Instruction_Common_GotoY                                          ;A8EA72;
    dw UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E             ;A8EA74;

UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA76:
    dw $0010                                                             ;A8EA76;
    dw Spritemap_Kihunter_7                                              ;A8EA78;
    dw Instruction_Common_GotoY                                          ;A8EA7A;
    dw UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA76             ;A8EA7C;

InstList_KihunterWings_Falling:
    dw $0001                                                             ;A8EA7E;
    dw Spritemap_Kihunter_E                                              ;A8EA80;
    dw Instruction_Common_Sleep                                          ;A8EA82;

UNUSED_InstList_KihunterWings_Falling_A8EA84:
    dw $0001                                                             ;A8EA84;
    dw Spritemap_Kihunter_F                                              ;A8EA86;
    dw Instruction_Common_Sleep                                          ;A8EA88;

InstList_Kihunter_Hop_FacingLeft:
    dw $0008                                                             ;A8EA8A;
    dw Spritemap_Kihunter_1A                                             ;A8EA8C;
    dw $0008                                                             ;A8EA8E;
    dw Spritemap_Kihunter_1B                                             ;A8EA90;
    dw $000B                                                             ;A8EA92;
    dw Spritemap_Kihunter_1C                                             ;A8EA94;
    dw $0002                                                             ;A8EA96;
    dw Spritemap_Kihunter_1B                                             ;A8EA98;
    dw $0002                                                             ;A8EA9A;
    dw Spritemap_Kihunter_1A                                             ;A8EA9C;
    dw Instruction_Kihunter_SetFunctionToHop                             ;A8EA9E;
    dw $0001                                                             ;A8EAA0;
    dw Spritemap_Kihunter_1D                                             ;A8EAA2;
    dw Instruction_Common_Sleep                                          ;A8EAA4;

InstList_Kihunter_Hop_FacingRight:
    dw $0008                                                             ;A8EAA6;
    dw Spritemap_Kihunter_1E                                             ;A8EAA8;
    dw $0008                                                             ;A8EAAA;
    dw Spritemap_Kihunter_1F                                             ;A8EAAC;
    dw $000B                                                             ;A8EAAE;
    dw Spritemap_Kihunter_20                                             ;A8EAB0;
    dw $0002                                                             ;A8EAB2;
    dw Spritemap_Kihunter_1F                                             ;A8EAB4;
    dw $0002                                                             ;A8EAB6;
    dw Spritemap_Kihunter_1E                                             ;A8EAB8;
    dw Instruction_Kihunter_SetFunctionToHop                             ;A8EABA;
    dw $0001                                                             ;A8EABC;
    dw Spritemap_Kihunter_21                                             ;A8EABE;
    dw Instruction_Common_Sleep                                          ;A8EAC0;

InstList_Kihunter_LandedFromHop_FacingLeft:
    dw $0008                                                             ;A8EAC2;
    dw Spritemap_Kihunter_1A                                             ;A8EAC4;
    dw $0008                                                             ;A8EAC6;
    dw Spritemap_Kihunter_1B                                             ;A8EAC8;
    dw $000B                                                             ;A8EACA;
    dw Spritemap_Kihunter_1C                                             ;A8EACC;
    dw $0008                                                             ;A8EACE;
    dw Spritemap_Kihunter_1B                                             ;A8EAD0;
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking              ;A8EAD2;
    dw $0001                                                             ;A8EAD4;
    dw Spritemap_Kihunter_1A                                             ;A8EAD6;
    dw Instruction_Common_Sleep                                          ;A8EAD8;

InstList_Kihunter_LandedFromHop_FacingRight:
    dw $0008                                                             ;A8EADA;
    dw Spritemap_Kihunter_1E                                             ;A8EADC;
    dw $0008                                                             ;A8EADE;
    dw Spritemap_Kihunter_1F                                             ;A8EAE0;
    dw $000B                                                             ;A8EAE2;
    dw Spritemap_Kihunter_20                                             ;A8EAE4;
    dw $0008                                                             ;A8EAE6;
    dw Spritemap_Kihunter_1F                                             ;A8EAE8;
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking              ;A8EAEA;
    dw $0001                                                             ;A8EAEC;
    dw Spritemap_Kihunter_1E                                             ;A8EAEE;
    dw Instruction_Common_Sleep                                          ;A8EAF0;

InstList_Kihunter_AcidSpitAttack_FacingLeft:
    dw $0020                                                             ;A8EAF2;
    dw Spritemap_Kihunter_22                                             ;A8EAF4;
    dw $0006                                                             ;A8EAF6;
    dw Spritemap_Kihunter_23                                             ;A8EAF8;
    dw $0010                                                             ;A8EAFA;
    dw Spritemap_Kihunter_24                                             ;A8EAFC;
    dw $0002                                                             ;A8EAFE;
    dw Spritemap_Kihunter_25                                             ;A8EB00;
    dw Instruction_Kihunter_FireAcidSpitLeft                             ;A8EB02;
    dw $0018                                                             ;A8EB04;
    dw Spritemap_Kihunter_26                                             ;A8EB06;
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking              ;A8EB08;
    dw $0001                                                             ;A8EB0A;
    dw Spritemap_Kihunter_22                                             ;A8EB0C;
    dw Instruction_Common_Sleep                                          ;A8EB0E;

InstList_Kihunter_AcidSpitAttack_FacingRight:
    dw $0020                                                             ;A8EB10;
    dw Spritemap_Kihunter_27                                             ;A8EB12;
    dw $0006                                                             ;A8EB14;
    dw Spritemap_Kihunter_28                                             ;A8EB16;
    dw $0010                                                             ;A8EB18;
    dw Spritemap_Kihunter_29                                             ;A8EB1A;
    dw $0002                                                             ;A8EB1C;
    dw Spritemap_Kihunter_2A                                             ;A8EB1E;
    dw Instruction_Kihunter_FireAcidSpitRight                            ;A8EB20;
    dw $0018                                                             ;A8EB22;
    dw Spritemap_Kihunter_2B                                             ;A8EB24;
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking              ;A8EB26;
    dw $0001                                                             ;A8EB28;
    dw Spritemap_Kihunter_27                                             ;A8EB2A;
    dw Instruction_Common_Sleep                                          ;A8EB2C;

Spritemap_Kihunter_0:
    dw $0008,$01E5                                                       ;A8EB2E;
    db $03                                                               ;A8EB32;
    dw $210E,$C3EB                                                       ;A8EB33;
    db $FE                                                               ;A8EB37;
    dw $2126,$C3F4                                                       ;A8EB38;
    db $F8                                                               ;A8EB3C;
    dw $212C,$C3FD                                                       ;A8EB3D;
    db $01                                                               ;A8EB41;
    dw $211E,$C3FD                                                       ;A8EB42;
    db $09                                                               ;A8EB46;
    dw $212E,$C200                                                       ;A8EB47;
    db $00                                                               ;A8EB4B;
    dw $2122,$C3EF                                                       ;A8EB4C;
    db $F0                                                               ;A8EB50;
    dw $2100,$01E2                                                       ;A8EB51;
    db $02                                                               ;A8EB55;
    dw $210E                                                             ;A8EB56;

Spritemap_Kihunter_1:
    dw $0008,$01E5                                                       ;A8EB58;
    db $02                                                               ;A8EB5C;
    dw $210E,$C3EB                                                       ;A8EB5D;
    db $FD                                                               ;A8EB61;
    dw $2126,$C3F4                                                       ;A8EB62;
    db $F7                                                               ;A8EB66;
    dw $212C,$C3FD                                                       ;A8EB67;
    db $00                                                               ;A8EB6B;
    dw $211E,$C3FD                                                       ;A8EB6C;
    db $08                                                               ;A8EB70;
    dw $212E,$C200                                                       ;A8EB71;
    db $FF                                                               ;A8EB75;
    dw $2122,$C3EF                                                       ;A8EB76;
    db $EF                                                               ;A8EB7A;
    dw $2100,$01E2                                                       ;A8EB7B;
    db $01                                                               ;A8EB7F;
    dw $210E                                                             ;A8EB80;

Spritemap_Kihunter_2:
    dw $0008,$01E5                                                       ;A8EB82;
    db $03                                                               ;A8EB86;
    dw $210E,$C3EB                                                       ;A8EB87;
    db $FE                                                               ;A8EB8B;
    dw $2126,$C3F4                                                       ;A8EB8C;
    db $F8                                                               ;A8EB90;
    dw $212C,$C3FD                                                       ;A8EB91;
    db $01                                                               ;A8EB95;
    dw $211E,$C3FD                                                       ;A8EB96;
    db $09                                                               ;A8EB9A;
    dw $212E,$C200                                                       ;A8EB9B;
    db $00                                                               ;A8EB9F;
    dw $2122,$C3EF                                                       ;A8EBA0;
    db $F0                                                               ;A8EBA4;
    dw $2100,$01E2                                                       ;A8EBA5;
    db $02                                                               ;A8EBA9;
    dw $210E                                                             ;A8EBAA;

Spritemap_Kihunter_3:
    dw $0004,$000B                                                       ;A8EBAC;
    db $E3                                                               ;A8EBB0;
    dw $2144,$0001                                                       ;A8EBB1;
    db $E3                                                               ;A8EBB5;
    dw $2143,$C209                                                       ;A8EBB6;
    db $EB                                                               ;A8EBBA;
    dw $2141,$C201                                                       ;A8EBBB;
    db $EB                                                               ;A8EBBF;
    dw $2140                                                             ;A8EBC0;

Spritemap_Kihunter_4:
    dw $0002,$0012                                                       ;A8EBC2;
    db $FB                                                               ;A8EBC6;
    dw $2145,$C202                                                       ;A8EBC7;
    db $F3                                                               ;A8EBCB;
    dw $2146                                                             ;A8EBCC;

Spritemap_Kihunter_5:
    dw $0003,$0011                                                       ;A8EBCE;
    db $F3                                                               ;A8EBD2;
    dw $2155,$0009                                                       ;A8EBD3;
    db $F3                                                               ;A8EBD7;
    dw $2154,$0001                                                       ;A8EBD8;
    db $F3                                                               ;A8EBDC;
    dw $2153                                                             ;A8EBDD;

Spritemap_Kihunter_6:
    dw $0002,$C3FC                                                       ;A8EBDF;
    db $F8                                                               ;A8EBE3;
    dw $2149,$C3F4                                                       ;A8EBE4;
    db $F8                                                               ;A8EBE8;
    dw $2148                                                             ;A8EBE9;

Spritemap_Kihunter_7:
    dw $0002,$C3FC                                                       ;A8EBEB;
    db $F8                                                               ;A8EBEF;
    dw $2149,$C3F4                                                       ;A8EBF0;
    db $F8                                                               ;A8EBF4;
    dw $2148                                                             ;A8EBF5;

Spritemap_Kihunter_8:
    dw $0008,$0013                                                       ;A8EBF7;
    db $03                                                               ;A8EBFB;
    dw $610E,$C205                                                       ;A8EBFC;
    db $FE                                                               ;A8EC00;
    dw $6126,$C3FC                                                       ;A8EC01;
    db $F8                                                               ;A8EC05;
    dw $612C,$C3F3                                                       ;A8EC06;
    db $01                                                               ;A8EC0A;
    dw $611E,$C3F3                                                       ;A8EC0B;
    db $09                                                               ;A8EC0F;
    dw $612E,$C3F0                                                       ;A8EC10;
    db $00                                                               ;A8EC14;
    dw $6122,$C201                                                       ;A8EC15;
    db $F0                                                               ;A8EC19;
    dw $6100,$0016                                                       ;A8EC1A;
    db $02                                                               ;A8EC1E;
    dw $610E                                                             ;A8EC1F;

Spritemap_Kihunter_9:
    dw $0008,$0013                                                       ;A8EC21;
    db $02                                                               ;A8EC25;
    dw $610E,$C205                                                       ;A8EC26;
    db $FD                                                               ;A8EC2A;
    dw $6126,$C3FC                                                       ;A8EC2B;
    db $F7                                                               ;A8EC2F;
    dw $612C,$C3F3                                                       ;A8EC30;
    db $00                                                               ;A8EC34;
    dw $611E,$C3F3                                                       ;A8EC35;
    db $08                                                               ;A8EC39;
    dw $612E,$C3F0                                                       ;A8EC3A;
    db $FF                                                               ;A8EC3E;
    dw $6122,$C201                                                       ;A8EC3F;
    db $EF                                                               ;A8EC43;
    dw $6100,$0016                                                       ;A8EC44;
    db $01                                                               ;A8EC48;
    dw $610E                                                             ;A8EC49;

Spritemap_Kihunter_A:
    dw $0008,$0013                                                       ;A8EC4B;
    db $03                                                               ;A8EC4F;
    dw $610E,$C205                                                       ;A8EC50;
    db $FE                                                               ;A8EC54;
    dw $6126,$C3FC                                                       ;A8EC55;
    db $F8                                                               ;A8EC59;
    dw $612C,$C3F3                                                       ;A8EC5A;
    db $01                                                               ;A8EC5E;
    dw $611E,$C3F3                                                       ;A8EC5F;
    db $09                                                               ;A8EC63;
    dw $612E,$C3F0                                                       ;A8EC64;
    db $00                                                               ;A8EC68;
    dw $6122,$C201                                                       ;A8EC69;
    db $F0                                                               ;A8EC6D;
    dw $6100,$0016                                                       ;A8EC6E;
    db $02                                                               ;A8EC72;
    dw $610E                                                             ;A8EC73;

Spritemap_Kihunter_B:
    dw $0004,$01ED                                                       ;A8EC75;
    db $E3                                                               ;A8EC79;
    dw $6144,$01F7                                                       ;A8EC7A;
    db $E3                                                               ;A8EC7E;
    dw $6143,$C3E7                                                       ;A8EC7F;
    db $EB                                                               ;A8EC83;
    dw $6141,$C3EF                                                       ;A8EC84;
    db $EB                                                               ;A8EC88;
    dw $6140                                                             ;A8EC89;

Spritemap_Kihunter_C:
    dw $0002,$01E6                                                       ;A8EC8B;
    db $FB                                                               ;A8EC8F;
    dw $6145,$C3EE                                                       ;A8EC90;
    db $F3                                                               ;A8EC94;
    dw $6146                                                             ;A8EC95;

Spritemap_Kihunter_D:
    dw $0003,$01E7                                                       ;A8EC97;
    db $F3                                                               ;A8EC9B;
    dw $6155,$01EF                                                       ;A8EC9C;
    db $F3                                                               ;A8ECA0;
    dw $6154,$01F7                                                       ;A8ECA1;
    db $F3                                                               ;A8ECA5;
    dw $6153                                                             ;A8ECA6;

Spritemap_Kihunter_E:
    dw $0002,$C3F4                                                       ;A8ECA8;
    db $F8                                                               ;A8ECAC;
    dw $6149,$C3FC                                                       ;A8ECAD;
    db $F8                                                               ;A8ECB1;
    dw $6148                                                             ;A8ECB2;

Spritemap_Kihunter_F:
    dw $0002,$C3F4                                                       ;A8ECB4;
    db $F8                                                               ;A8ECB8;
    dw $6149,$C3FC                                                       ;A8ECB9;
    db $F8                                                               ;A8ECBD;
    dw $6148                                                             ;A8ECBE;

Spritemap_Kihunter_10:
    dw $0008,$01E5                                                       ;A8ECC0;
    db $03                                                               ;A8ECC4;
    dw $210E,$C3EB                                                       ;A8ECC5;
    db $FE                                                               ;A8ECC9;
    dw $2126,$C3F4                                                       ;A8ECCA;
    db $F8                                                               ;A8ECCE;
    dw $212C,$C3FD                                                       ;A8ECCF;
    db $01                                                               ;A8ECD3;
    dw $211E,$C3FD                                                       ;A8ECD4;
    db $09                                                               ;A8ECD8;
    dw $212E,$C200                                                       ;A8ECD9;
    db $00                                                               ;A8ECDD;
    dw $2122,$C3EF                                                       ;A8ECDE;
    db $F0                                                               ;A8ECE2;
    dw $2100,$01E2                                                       ;A8ECE3;
    db $02                                                               ;A8ECE7;
    dw $210E                                                             ;A8ECE8;

Spritemap_Kihunter_11:
    dw $0008,$01E9                                                       ;A8ECEA;
    db $F5                                                               ;A8ECEE;
    dw $210F,$C3EC                                                       ;A8ECEF;
    db $FA                                                               ;A8ECF3;
    dw $2128,$C3F4                                                       ;A8ECF4;
    db $F8                                                               ;A8ECF8;
    dw $212C,$C3FD                                                       ;A8ECF9;
    db $01                                                               ;A8ECFD;
    dw $211E,$C3FD                                                       ;A8ECFE;
    db $09                                                               ;A8ED02;
    dw $212E,$C200                                                       ;A8ED03;
    db $00                                                               ;A8ED07;
    dw $2122,$C3EF                                                       ;A8ED08;
    db $F0                                                               ;A8ED0C;
    dw $2100,$01E6                                                       ;A8ED0D;
    db $F4                                                               ;A8ED11;
    dw $210F                                                             ;A8ED12;

Spritemap_Kihunter_12:
    dw $0008,$01F0                                                       ;A8ED14;
    db $F5                                                               ;A8ED18;
    dw $214F,$C3EC                                                       ;A8ED19;
    db $FA                                                               ;A8ED1D;
    dw $2128,$C3F4                                                       ;A8ED1E;
    db $F8                                                               ;A8ED22;
    dw $212C,$C3FD                                                       ;A8ED23;
    db $01                                                               ;A8ED27;
    dw $211E,$C3FD                                                       ;A8ED28;
    db $09                                                               ;A8ED2C;
    dw $212E,$C200                                                       ;A8ED2D;
    db $00                                                               ;A8ED31;
    dw $2122,$C3EF                                                       ;A8ED32;
    db $F0                                                               ;A8ED36;
    dw $2100,$01ED                                                       ;A8ED37;
    db $F4                                                               ;A8ED3B;
    dw $214F                                                             ;A8ED3C;

Spritemap_Kihunter_13:
    dw $0008,$01E8                                                       ;A8ED3E;
    db $0F                                                               ;A8ED42;
    dw $210E,$C3ED                                                       ;A8ED43;
    db $03                                                               ;A8ED47;
    dw $2124,$C3F4                                                       ;A8ED48;
    db $F9                                                               ;A8ED4C;
    dw $212C,$C3FD                                                       ;A8ED4D;
    db $01                                                               ;A8ED51;
    dw $211E,$C3FD                                                       ;A8ED52;
    db $09                                                               ;A8ED56;
    dw $212E,$C200                                                       ;A8ED57;
    db $00                                                               ;A8ED5B;
    dw $2122,$C3EF                                                       ;A8ED5C;
    db $F1                                                               ;A8ED60;
    dw $2100,$01E5                                                       ;A8ED61;
    db $0E                                                               ;A8ED65;
    dw $210E                                                             ;A8ED66;

Spritemap_Kihunter_14:
    dw $0008,$C3ED                                                       ;A8ED68;
    db $03                                                               ;A8ED6C;
    dw $2124,$01F0                                                       ;A8ED6D;
    db $0F                                                               ;A8ED71;
    dw $214E,$C3F4                                                       ;A8ED72;
    db $F9                                                               ;A8ED76;
    dw $212C,$C3FD                                                       ;A8ED77;
    db $02                                                               ;A8ED7B;
    dw $211E,$C3FD                                                       ;A8ED7C;
    db $0A                                                               ;A8ED80;
    dw $212E,$C200                                                       ;A8ED81;
    db $01                                                               ;A8ED85;
    dw $2122,$C3EF                                                       ;A8ED86;
    db $F2                                                               ;A8ED8A;
    dw $2100,$01ED                                                       ;A8ED8B;
    db $0E                                                               ;A8ED8F;
    dw $214E                                                             ;A8ED90;

Spritemap_Kihunter_15:
    dw $0008,$0013                                                       ;A8ED92;
    db $03                                                               ;A8ED96;
    dw $610E,$C205                                                       ;A8ED97;
    db $FE                                                               ;A8ED9B;
    dw $6126,$C3FC                                                       ;A8ED9C;
    db $F8                                                               ;A8EDA0;
    dw $612C,$C3F3                                                       ;A8EDA1;
    db $01                                                               ;A8EDA5;
    dw $611E,$C3F3                                                       ;A8EDA6;
    db $09                                                               ;A8EDAA;
    dw $612E,$C3F0                                                       ;A8EDAB;
    db $00                                                               ;A8EDAF;
    dw $6122,$C201                                                       ;A8EDB0;
    db $F0                                                               ;A8EDB4;
    dw $6100,$0016                                                       ;A8EDB5;
    db $02                                                               ;A8EDB9;
    dw $610E                                                             ;A8EDBA;

Spritemap_Kihunter_16:
    dw $0008,$000F                                                       ;A8EDBC;
    db $F5                                                               ;A8EDC0;
    dw $610F,$C204                                                       ;A8EDC1;
    db $FA                                                               ;A8EDC5;
    dw $6128,$C3FC                                                       ;A8EDC6;
    db $F8                                                               ;A8EDCA;
    dw $612C,$C3F3                                                       ;A8EDCB;
    db $01                                                               ;A8EDCF;
    dw $611E,$C3F3                                                       ;A8EDD0;
    db $09                                                               ;A8EDD4;
    dw $612E,$C3F0                                                       ;A8EDD5;
    db $00                                                               ;A8EDD9;
    dw $6122,$C201                                                       ;A8EDDA;
    db $F0                                                               ;A8EDDE;
    dw $6100,$0012                                                       ;A8EDDF;
    db $F4                                                               ;A8EDE3;
    dw $610F                                                             ;A8EDE4;

Spritemap_Kihunter_17:
    dw $0008,$0008                                                       ;A8EDE6;
    db $F5                                                               ;A8EDEA;
    dw $614F,$C204                                                       ;A8EDEB;
    db $FA                                                               ;A8EDEF;
    dw $6128,$C3FC                                                       ;A8EDF0;
    db $F8                                                               ;A8EDF4;
    dw $612C,$C3F3                                                       ;A8EDF5;
    db $01                                                               ;A8EDF9;
    dw $611E,$C3F3                                                       ;A8EDFA;
    db $09                                                               ;A8EDFE;
    dw $612E,$C3F0                                                       ;A8EDFF;
    db $00                                                               ;A8EE03;
    dw $6122,$C201                                                       ;A8EE04;
    db $F0                                                               ;A8EE08;
    dw $6100,$000B                                                       ;A8EE09;
    db $F4                                                               ;A8EE0D;
    dw $614F                                                             ;A8EE0E;

Spritemap_Kihunter_18:
    dw $0008,$0010                                                       ;A8EE10;
    db $0F                                                               ;A8EE14;
    dw $610E,$C203                                                       ;A8EE15;
    db $03                                                               ;A8EE19;
    dw $6124,$C3FC                                                       ;A8EE1A;
    db $F9                                                               ;A8EE1E;
    dw $612C,$C3F3                                                       ;A8EE1F;
    db $01                                                               ;A8EE23;
    dw $611E,$C3F3                                                       ;A8EE24;
    db $09                                                               ;A8EE28;
    dw $612E,$C3F0                                                       ;A8EE29;
    db $00                                                               ;A8EE2D;
    dw $6122,$C201                                                       ;A8EE2E;
    db $F1                                                               ;A8EE32;
    dw $6100,$0013                                                       ;A8EE33;
    db $0E                                                               ;A8EE37;
    dw $610E                                                             ;A8EE38;

Spritemap_Kihunter_19:
    dw $0008,$C203                                                       ;A8EE3A;
    db $03                                                               ;A8EE3E;
    dw $6124,$0008                                                       ;A8EE3F;
    db $0F                                                               ;A8EE43;
    dw $614E,$C3FC                                                       ;A8EE44;
    db $F9                                                               ;A8EE48;
    dw $612C,$C3F3                                                       ;A8EE49;
    db $02                                                               ;A8EE4D;
    dw $611E,$C3F3                                                       ;A8EE4E;
    db $0A                                                               ;A8EE52;
    dw $612E,$C3F0                                                       ;A8EE53;
    db $01                                                               ;A8EE57;
    dw $6122,$C201                                                       ;A8EE58;
    db $F2                                                               ;A8EE5C;
    dw $6100,$000B                                                       ;A8EE5D;
    db $0E                                                               ;A8EE61;
    dw $614E                                                             ;A8EE62;

Spritemap_Kihunter_1A:
    dw $0008,$01E3                                                       ;A8EE64;
    db $FF                                                               ;A8EE68;
    dw $210E,$C3E9                                                       ;A8EE69;
    db $FA                                                               ;A8EE6D;
    dw $2126,$C3F2                                                       ;A8EE6E;
    db $F4                                                               ;A8EE72;
    dw $212C,$C3FA                                                       ;A8EE73;
    db $F8                                                               ;A8EE77;
    dw $215E,$C3FA                                                       ;A8EE78;
    db $00                                                               ;A8EE7C;
    dw $216E,$C3FE                                                       ;A8EE7D;
    db $FC                                                               ;A8EE81;
    dw $2122,$C3EE                                                       ;A8EE82;
    db $ED                                                               ;A8EE86;
    dw $2100,$01E0                                                       ;A8EE87;
    db $FE                                                               ;A8EE8B;
    dw $210E                                                             ;A8EE8C;

Spritemap_Kihunter_1B:
    dw $0008,$01E3                                                       ;A8EE8E;
    db $04                                                               ;A8EE92;
    dw $210E,$C3E9                                                       ;A8EE93;
    db $FF                                                               ;A8EE97;
    dw $2126,$C3F2                                                       ;A8EE98;
    db $F9                                                               ;A8EE9C;
    dw $212C,$C3FB                                                       ;A8EE9D;
    db $00                                                               ;A8EEA1;
    dw $2162,$C3FE                                                       ;A8EEA2;
    db $01                                                               ;A8EEA6;
    dw $2122,$C3ED                                                       ;A8EEA7;
    db $F1                                                               ;A8EEAB;
    dw $2100,$01E0                                                       ;A8EEAC;
    db $03                                                               ;A8EEB0;
    dw $210E,$C3F9                                                       ;A8EEB1;
    db $FF                                                               ;A8EEB5;
    dw $2162                                                             ;A8EEB6;

Spritemap_Kihunter_1C:
    dw $0008,$01E3                                                       ;A8EEB8;
    db $07                                                               ;A8EEBC;
    dw $210E,$C3E9                                                       ;A8EEBD;
    db $02                                                               ;A8EEC1;
    dw $2126,$C3F2                                                       ;A8EEC2;
    db $FC                                                               ;A8EEC6;
    dw $212C,$C3FB                                                       ;A8EEC7;
    db $00                                                               ;A8EECB;
    dw $2160,$C3FE                                                       ;A8EECC;
    db $04                                                               ;A8EED0;
    dw $2122,$C3ED                                                       ;A8EED1;
    db $F4                                                               ;A8EED5;
    dw $2100,$01E0                                                       ;A8EED6;
    db $06                                                               ;A8EEDA;
    dw $210E,$C3F9                                                       ;A8EEDB;
    db $FF                                                               ;A8EEDF;
    dw $2160                                                             ;A8EEE0;

Spritemap_Kihunter_1D:
    dw $0008,$01E8                                                       ;A8EEE2;
    db $00                                                               ;A8EEE6;
    dw $210E,$C3EE                                                       ;A8EEE7;
    db $FB                                                               ;A8EEEB;
    dw $2126,$C3F7                                                       ;A8EEEC;
    db $F5                                                               ;A8EEF0;
    dw $212C,$C200                                                       ;A8EEF1;
    db $FE                                                               ;A8EEF5;
    dw $211E,$C200                                                       ;A8EEF6;
    db $06                                                               ;A8EEFA;
    dw $212E,$C203                                                       ;A8EEFB;
    db $FD                                                               ;A8EEFF;
    dw $2122,$C3F3                                                       ;A8EF00;
    db $EE                                                               ;A8EF04;
    dw $2100,$01E5                                                       ;A8EF05;
    db $FF                                                               ;A8EF09;
    dw $210E                                                             ;A8EF0A;

Spritemap_Kihunter_1E:
    dw $0008,$0015                                                       ;A8EF0C;
    db $FF                                                               ;A8EF10;
    dw $610E,$C207                                                       ;A8EF11;
    db $FA                                                               ;A8EF15;
    dw $6126,$C3FE                                                       ;A8EF16;
    db $F4                                                               ;A8EF1A;
    dw $612C,$C3F6                                                       ;A8EF1B;
    db $F8                                                               ;A8EF1F;
    dw $615E,$C3F6                                                       ;A8EF20;
    db $00                                                               ;A8EF24;
    dw $616E,$C3F2                                                       ;A8EF25;
    db $FC                                                               ;A8EF29;
    dw $6122,$C202                                                       ;A8EF2A;
    db $ED                                                               ;A8EF2E;
    dw $6100,$0018                                                       ;A8EF2F;
    db $FE                                                               ;A8EF33;
    dw $610E                                                             ;A8EF34;

Spritemap_Kihunter_1F:
    dw $0008,$0015                                                       ;A8EF36;
    db $04                                                               ;A8EF3A;
    dw $610E,$C207                                                       ;A8EF3B;
    db $FF                                                               ;A8EF3F;
    dw $6126,$C3FE                                                       ;A8EF40;
    db $F9                                                               ;A8EF44;
    dw $612C,$C3F5                                                       ;A8EF45;
    db $00                                                               ;A8EF49;
    dw $6162,$C3F2                                                       ;A8EF4A;
    db $01                                                               ;A8EF4E;
    dw $6122,$C203                                                       ;A8EF4F;
    db $F1                                                               ;A8EF53;
    dw $6100,$0018                                                       ;A8EF54;
    db $03                                                               ;A8EF58;
    dw $610E,$C3F7                                                       ;A8EF59;
    db $FF                                                               ;A8EF5D;
    dw $6162                                                             ;A8EF5E;

Spritemap_Kihunter_20:
    dw $0008,$0015                                                       ;A8EF60;
    db $07                                                               ;A8EF64;
    dw $610E,$C207                                                       ;A8EF65;
    db $02                                                               ;A8EF69;
    dw $6126,$C3FE                                                       ;A8EF6A;
    db $FC                                                               ;A8EF6E;
    dw $612C,$C3F5                                                       ;A8EF6F;
    db $00                                                               ;A8EF73;
    dw $6160,$C3F2                                                       ;A8EF74;
    db $04                                                               ;A8EF78;
    dw $6122,$C203                                                       ;A8EF79;
    db $F4                                                               ;A8EF7D;
    dw $6100,$0018                                                       ;A8EF7E;
    db $06                                                               ;A8EF82;
    dw $610E,$C3F7                                                       ;A8EF83;
    db $FF                                                               ;A8EF87;
    dw $6160                                                             ;A8EF88;

Spritemap_Kihunter_21:
    dw $0008,$0012                                                       ;A8EF8A;
    db $FF                                                               ;A8EF8E;
    dw $610E,$C204                                                       ;A8EF8F;
    db $FA                                                               ;A8EF93;
    dw $6126,$C3FB                                                       ;A8EF94;
    db $F4                                                               ;A8EF98;
    dw $612C,$C3F0                                                       ;A8EF99;
    db $FE                                                               ;A8EF9D;
    dw $611E,$C3F0                                                       ;A8EF9E;
    db $06                                                               ;A8EFA2;
    dw $612E,$C3EF                                                       ;A8EFA3;
    db $FC                                                               ;A8EFA7;
    dw $6122,$C3FF                                                       ;A8EFA8;
    db $ED                                                               ;A8EFAC;
    dw $6100,$0015                                                       ;A8EFAD;
    db $FE                                                               ;A8EFB1;
    dw $610E                                                             ;A8EFB2;

Spritemap_Kihunter_22:
    dw $0008,$01E3                                                       ;A8EFB4;
    db $FF                                                               ;A8EFB8;
    dw $210E,$C3E9                                                       ;A8EFB9;
    db $FA                                                               ;A8EFBD;
    dw $2126,$C3F2                                                       ;A8EFBE;
    db $F4                                                               ;A8EFC2;
    dw $212C,$C3FA                                                       ;A8EFC3;
    db $F8                                                               ;A8EFC7;
    dw $215E,$C3FA                                                       ;A8EFC8;
    db $00                                                               ;A8EFCC;
    dw $216E,$C3FE                                                       ;A8EFCD;
    db $FC                                                               ;A8EFD1;
    dw $2122,$C3EE                                                       ;A8EFD2;
    db $ED                                                               ;A8EFD6;
    dw $2100,$01E0                                                       ;A8EFD7;
    db $FE                                                               ;A8EFDB;
    dw $210E                                                             ;A8EFDC;

Spritemap_Kihunter_23:
    dw $0009,$01E4                                                       ;A8EFDE;
    db $FF                                                               ;A8EFE2;
    dw $210E,$C3EA                                                       ;A8EFE3;
    db $FA                                                               ;A8EFE7;
    dw $2126,$C3F3                                                       ;A8EFE8;
    db $F4                                                               ;A8EFEC;
    dw $212C,$C3FA                                                       ;A8EFED;
    db $F8                                                               ;A8EFF1;
    dw $215E,$C3FA                                                       ;A8EFF2;
    db $00                                                               ;A8EFF6;
    dw $216E,$C3FE                                                       ;A8EFF7;
    db $FC                                                               ;A8EFFB;
    dw $2122,$C3F2                                                       ;A8EFFC;
    db $EC                                                               ;A8F000;
    dw $2103,$C3EA                                                       ;A8F001;
    db $EC                                                               ;A8F005;
    dw $2102,$01E1                                                       ;A8F006;
    db $FE                                                               ;A8F00A;
    dw $210E                                                             ;A8F00B;

Spritemap_Kihunter_24:
    dw $0009,$01E5                                                       ;A8F00D;
    db $FF                                                               ;A8F011;
    dw $210E,$C3EB                                                       ;A8F012;
    db $FA                                                               ;A8F016;
    dw $2126,$C3F4                                                       ;A8F017;
    db $F4                                                               ;A8F01B;
    dw $212C,$C3FA                                                       ;A8F01C;
    db $F8                                                               ;A8F020;
    dw $215E,$C3FA                                                       ;A8F021;
    db $00                                                               ;A8F025;
    dw $216E,$C3FD                                                       ;A8F026;
    db $FC                                                               ;A8F02A;
    dw $2122,$C3FC                                                       ;A8F02B;
    db $EC                                                               ;A8F02F;
    dw $2107,$C3EC                                                       ;A8F030;
    db $EC                                                               ;A8F034;
    dw $2105,$01E2                                                       ;A8F035;
    db $FE                                                               ;A8F039;
    dw $210E                                                             ;A8F03A;

Spritemap_Kihunter_25:
    dw $0009,$01E5                                                       ;A8F03C;
    db $FF                                                               ;A8F040;
    dw $210E,$C3EB                                                       ;A8F041;
    db $FA                                                               ;A8F045;
    dw $2126,$C3F4                                                       ;A8F046;
    db $F4                                                               ;A8F04A;
    dw $212C,$C3FA                                                       ;A8F04B;
    db $F8                                                               ;A8F04F;
    dw $215E,$C3FA                                                       ;A8F050;
    db $00                                                               ;A8F054;
    dw $216E,$C3EB                                                       ;A8F055;
    db $EC                                                               ;A8F059;
    dw $210A,$C3FB                                                       ;A8F05A;
    db $EC                                                               ;A8F05E;
    dw $2107,$C3FF                                                       ;A8F05F;
    db $FC                                                               ;A8F063;
    dw $2122,$01E2                                                       ;A8F064;
    db $FE                                                               ;A8F068;
    dw $210E                                                             ;A8F069;

Spritemap_Kihunter_26:
    dw $0009,$01E4                                                       ;A8F06B;
    db $FF                                                               ;A8F06F;
    dw $210E,$C3EA                                                       ;A8F070;
    db $FA                                                               ;A8F074;
    dw $2126,$C3F3                                                       ;A8F075;
    db $F4                                                               ;A8F079;
    dw $212C,$C3FA                                                       ;A8F07A;
    db $F8                                                               ;A8F07E;
    dw $215E,$C3FA                                                       ;A8F07F;
    db $00                                                               ;A8F083;
    dw $216E,$C3FD                                                       ;A8F084;
    db $FC                                                               ;A8F088;
    dw $2122,$C3EA                                                       ;A8F089;
    db $EC                                                               ;A8F08D;
    dw $210C,$C3FA                                                       ;A8F08E;
    db $EC                                                               ;A8F092;
    dw $2107,$01E1                                                       ;A8F093;
    db $FE                                                               ;A8F097;
    dw $210E                                                             ;A8F098;

Spritemap_Kihunter_27:
    dw $0008,$0015                                                       ;A8F09A;
    db $FF                                                               ;A8F09E;
    dw $610E,$C207                                                       ;A8F09F;
    db $FA                                                               ;A8F0A3;
    dw $6126,$C3FE                                                       ;A8F0A4;
    db $F4                                                               ;A8F0A8;
    dw $612C,$C3F6                                                       ;A8F0A9;
    db $F8                                                               ;A8F0AD;
    dw $615E,$C3F6                                                       ;A8F0AE;
    db $00                                                               ;A8F0B2;
    dw $616E,$C3F2                                                       ;A8F0B3;
    db $FC                                                               ;A8F0B7;
    dw $6122,$C202                                                       ;A8F0B8;
    db $ED                                                               ;A8F0BC;
    dw $6100,$0018                                                       ;A8F0BD;
    db $FE                                                               ;A8F0C1;
    dw $610E                                                             ;A8F0C2;

Spritemap_Kihunter_28:
    dw $0009,$0014                                                       ;A8F0C4;
    db $FF                                                               ;A8F0C8;
    dw $610E,$C206                                                       ;A8F0C9;
    db $FA                                                               ;A8F0CD;
    dw $6126,$C3FD                                                       ;A8F0CE;
    db $F4                                                               ;A8F0D2;
    dw $612C,$C3F6                                                       ;A8F0D3;
    db $F8                                                               ;A8F0D7;
    dw $615E,$C3F6                                                       ;A8F0D8;
    db $00                                                               ;A8F0DC;
    dw $616E,$C3F2                                                       ;A8F0DD;
    db $FC                                                               ;A8F0E1;
    dw $6122,$C3FE                                                       ;A8F0E2;
    db $EC                                                               ;A8F0E6;
    dw $6103,$C206                                                       ;A8F0E7;
    db $EC                                                               ;A8F0EB;
    dw $6102,$0017                                                       ;A8F0EC;
    db $FE                                                               ;A8F0F0;
    dw $610E                                                             ;A8F0F1;

Spritemap_Kihunter_29:
    dw $0009,$0013                                                       ;A8F0F3;
    db $FF                                                               ;A8F0F7;
    dw $610E,$C205                                                       ;A8F0F8;
    db $FA                                                               ;A8F0FC;
    dw $6126,$C3FC                                                       ;A8F0FD;
    db $F4                                                               ;A8F101;
    dw $612C,$C3F6                                                       ;A8F102;
    db $F8                                                               ;A8F106;
    dw $615E,$C3F6                                                       ;A8F107;
    db $00                                                               ;A8F10B;
    dw $616E,$C3F3                                                       ;A8F10C;
    db $FC                                                               ;A8F110;
    dw $6122,$C3F4                                                       ;A8F111;
    db $EC                                                               ;A8F115;
    dw $6107,$C204                                                       ;A8F116;
    db $EC                                                               ;A8F11A;
    dw $6105,$0016                                                       ;A8F11B;
    db $FE                                                               ;A8F11F;
    dw $610E                                                             ;A8F120;

Spritemap_Kihunter_2A:
    dw $0009,$0013                                                       ;A8F122;
    db $FF                                                               ;A8F126;
    dw $610E,$C205                                                       ;A8F127;
    db $FA                                                               ;A8F12B;
    dw $6126,$C3FC                                                       ;A8F12C;
    db $F4                                                               ;A8F130;
    dw $612C,$C3F6                                                       ;A8F131;
    db $F8                                                               ;A8F135;
    dw $615E,$C3F6                                                       ;A8F136;
    db $00                                                               ;A8F13A;
    dw $616E,$C205                                                       ;A8F13B;
    db $EC                                                               ;A8F13F;
    dw $610A,$C3F5                                                       ;A8F140;
    db $EC                                                               ;A8F144;
    dw $6107,$C3F1                                                       ;A8F145;
    db $FC                                                               ;A8F149;
    dw $6122,$0016                                                       ;A8F14A;
    db $FE                                                               ;A8F14E;
    dw $610E                                                             ;A8F14F;

Spritemap_Kihunter_2B:
    dw $0009,$0014                                                       ;A8F151;
    db $FF                                                               ;A8F155;
    dw $610E,$C206                                                       ;A8F156;
    db $FA                                                               ;A8F15A;
    dw $6126,$C3FD                                                       ;A8F15B;
    db $F4                                                               ;A8F15F;
    dw $612C,$C3F6                                                       ;A8F160;
    db $F8                                                               ;A8F164;
    dw $615E,$C3F6                                                       ;A8F165;
    db $00                                                               ;A8F169;
    dw $616E,$C3F3                                                       ;A8F16A;
    db $FC                                                               ;A8F16E;
    dw $6122,$C206                                                       ;A8F16F;
    db $EC                                                               ;A8F173;
    dw $610C,$C3F6                                                       ;A8F174;
    db $EC                                                               ;A8F178;
    dw $6107,$0017                                                       ;A8F179;
    db $FE                                                               ;A8F17D;
    dw $610E                                                             ;A8F17E;

KihunterConstants_XProximityToActivateSwoop:
    dw $0060                                                             ;A8F180;

KihunterConstants_fallingAcceleration_hop:
    dw $E000                                                             ;A8F182;

KihunterConstants_fallingAcceleration_wingsClipped:
    dw $0000                                                             ;A8F184;

KihunterConstants_fallingWingsArcRadius:
    dw $0030                                                             ;A8F186;

InitAI_Kihunter:
    LDX.W $0E54                                                          ;A8F188;
    LDA.W EnemyData.properties,X                                         ;A8F18B;
    ORA.W #$2000                                                         ;A8F18E;
    STA.W EnemyData.properties,X                                         ;A8F191;
    LDA.W #$0000                                                         ;A8F194;
    STA.L $7E7828,X                                                      ;A8F197;
    LDA.W #$0001                                                         ;A8F19B;
    STA.W EnemyData.instTimer,X                                          ;A8F19E;
    STZ.W EnemyData.loopCounter,X                                        ;A8F1A1;
    LDA.W #InstList_Kihunter_Idling_FacingLeft                           ;A8F1A4;
    STA.W EnemyData.pInstList,X                                          ;A8F1A7;
    LDA.W #$0000                                                         ;A8F1AA;
    STA.W EnemyData.work5,X                                              ;A8F1AD;
    LDA.W #Function_Kihunter_Winged_IdleFlying                           ;A8F1B0;
    STA.W EnemyData.work0,X                                              ;A8F1B3;
    LDA.W #$0000                                                         ;A8F1B6;
    STA.L $7E7810,X                                                      ;A8F1B9;
    LDA.W #$0001                                                         ;A8F1BD;
    STA.L $7E7812,X                                                      ;A8F1C0;
    LDA.W #$0000                                                         ;A8F1C4;
    STA.L $7E780C,X                                                      ;A8F1C7;
    LDA.W #$FFFF                                                         ;A8F1CB;
    STA.L $7E780E,X                                                      ;A8F1CE;
    LDA.W EnemyData.yPosition,X                                          ;A8F1D2;
    SEC                                                                  ;A8F1D5;
    SBC.W #$0010                                                         ;A8F1D6;
    STA.L $7E7814,X                                                      ;A8F1D9;
    CLC                                                                  ;A8F1DD;
    ADC.W #$0020                                                         ;A8F1DE;
    STA.L $7E7816,X                                                      ;A8F1E1;
    LDA.W EnemyData.xPosition,X                                          ;A8F1E5;
    STA.L $7E7818,X                                                      ;A8F1E8;
    LDA.W EnemyData.yPosition,X                                          ;A8F1EC;
    STA.L $7E781A,X                                                      ;A8F1EF;
    LDA.W EnemyData.initParam0,X                                         ;A8F1F3;
    BPL .return                                                          ;A8F1F6;
    LDA.W #$0001                                                         ;A8F1F8;
    STA.L $7E7828,X                                                      ;A8F1FB;
    LDA.W #Function_Kihunter_Wingless_InitialFalling                     ;A8F1FF;
    STA.W EnemyData.work0,X                                              ;A8F202;
    LDA.W #$0000                                                         ;A8F205;
    STA.L $7E7810,X                                                      ;A8F208;
    LDA.W #$0001                                                         ;A8F20C;
    STA.L $7E7812,X                                                      ;A8F20F;

.return:
    RTL                                                                  ;A8F213;


InitAI_KihunterWings:
    LDX.W $0E54                                                          ;A8F214;
    LDA.W EnemyData.properties,X                                         ;A8F217;
    ORA.W #$2000                                                         ;A8F21A;
    STA.W EnemyData.properties,X                                         ;A8F21D;
    LDA.W #$0001                                                         ;A8F220;
    STA.W EnemyData.instTimer,X                                          ;A8F223;
    STZ.W EnemyData.loopCounter,X                                        ;A8F226;
    LDA.W #InstList_KihunterWings_FacingLeft                             ;A8F229;
    STA.W EnemyData.pInstList,X                                          ;A8F22C;
    LDA.W $0F3E,X                                                        ;A8F22F;
    STA.W EnemyData.yPosition,X                                          ;A8F232;
    LDA.W $0F3A,X                                                        ;A8F235;
    STA.W EnemyData.xPosition,X                                          ;A8F238;
    LDA.W #Function_KihunterWings_Attached                               ;A8F23B;
    STA.W EnemyData.work0,X                                              ;A8F23E;
    LDA.W $0F56,X                                                        ;A8F241;
    STA.W EnemyData.palette,X                                            ;A8F244;
    LDA.W $0F58,X                                                        ;A8F247;
    STA.W EnemyData.gfxOffset,X                                          ;A8F24A;
    LDA.W $0F74,X                                                        ;A8F24D;
    BPL .return                                                          ;A8F250;
    LDA.W EnemyData.properties,X                                         ;A8F252;
    ORA.W #$0200                                                         ;A8F255;
    STA.W EnemyData.properties,X                                         ;A8F258;

.return:
    RTL                                                                  ;A8F25B;


MainAI_Kihunter:
    LDX.W $0E54                                                          ;A8F25C;
    JMP.W ($0FA8,X)                                                      ;A8F25F;


MainAI_KihunterWings:
    LDX.W $0E54                                                          ;A8F262;
    JMP.W ($0FA8,X)                                                      ;A8F265;


Function_Kihunter_Winged_IdleFlying:
    LDA.L $7E7810,X                                                      ;A8F268;
    STA.B $12                                                            ;A8F26C;
    LDA.L $7E7812,X                                                      ;A8F26E;
    STA.B $14                                                            ;A8F272;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F274;
    BCS .collidedWithBlock                                               ;A8F278;
    LDA.W EnemyData.yPosition,X                                          ;A8F27A;
    CMP.L $7E7814,X                                                      ;A8F27D;
    BMI .idleDown                                                        ;A8F281;
    CMP.L $7E7816,X                                                      ;A8F283;
    BMI .noChangeY                                                       ;A8F287;
    LDA.W #$FFFF                                                         ;A8F289;
    BRA .changeY                                                         ;A8F28C;


.collidedWithBlock:
    LDA.L $7E7812,X                                                      ;A8F28E;
    EOR.W #$FFFF                                                         ;A8F292;
    INC A                                                                ;A8F295;
    BRA .changeY                                                         ;A8F296;


.idleDown:
    LDA.W #$0001                                                         ;A8F298;

.changeY:
    STA.L $7E7812,X                                                      ;A8F29B;

.noChangeY:
    LDA.L $7E780C,X                                                      ;A8F29F;
    STA.B $12                                                            ;A8F2A3;
    LDA.L $7E780E,X                                                      ;A8F2A5;
    STA.B $14                                                            ;A8F2A9;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8F2AB;
    BCC .noCollision                                                     ;A8F2AF;
    LDY.W #$0000                                                         ;A8F2B1;
    LDA.L $7E780E,X                                                      ;A8F2B4;
    EOR.W #$FFFF                                                         ;A8F2B8;
    INC A                                                                ;A8F2BB;
    STA.L $7E780E,X                                                      ;A8F2BC;
    BMI .movingLeft                                                      ;A8F2C0;
    LDY.W #$0004                                                         ;A8F2C2;

.movingLeft:
    LDA.W .instListPointers_kihunter,Y                                   ;A8F2C5;
    STA.W EnemyData.pInstList,X                                          ;A8F2C8;
    LDA.W .instListPointers_wings,Y                                      ;A8F2CB;
    STA.W $0FD2,X                                                        ;A8F2CE;
    LDA.W #$0001                                                         ;A8F2D1;
    STA.W EnemyData.instTimer,X                                          ;A8F2D4;
    STA.W $0FD4,X                                                        ;A8F2D7;

.noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8F2DA;
    LDA.W $0AF6                                                          ;A8F2DE;
    SEC                                                                  ;A8F2E1;
    SBC.W EnemyData.xPosition,X                                          ;A8F2E2;
    STA.B $12                                                            ;A8F2E5;
    BPL +                                                                ;A8F2E7;
    EOR.W #$FFFF                                                         ;A8F2E9;
    INC A                                                                ;A8F2EC;

  + STA.B $14                                                            ;A8F2ED;
    CMP.W KihunterConstants_XProximityToActivateSwoop                    ;A8F2EF;
    BMI +                                                                ;A8F2F2;
    RTL                                                                  ;A8F2F4;


  + LDA.W $0AFA                                                          ;A8F2F5;
    SEC                                                                  ;A8F2F8;
    SBC.W EnemyData.yPosition,X                                          ;A8F2F9;
    CMP.W #$0020                                                         ;A8F2FC;
    BPL .outsideRange                                                    ;A8F2FF;
    RTL                                                                  ;A8F301;


.outsideRange:
    STA.B $18                                                            ;A8F302;
    LDA.B $12                                                            ;A8F304;
    BMI .rightOfSamus                                                    ;A8F306;
    LDA.W #$0002                                                         ;A8F308;
    STA.L $7E7800,X                                                      ;A8F30B;
    LDA.W #$0000                                                         ;A8F30F;
    STA.L $7E7804,X                                                      ;A8F312;
    STA.L $7E7806,X                                                      ;A8F316;
    STA.L $7E7808,X                                                      ;A8F31A;
    LDA.W #$2000                                                         ;A8F31E;
    STA.L $7E780A,X                                                      ;A8F321;
    LDA.W #$0080                                                         ;A8F325;
    STA.W EnemyData.work5,X                                              ;A8F328;
    LDA.W #$0001                                                         ;A8F32B;
    STA.L $7E780E,X                                                      ;A8F32E;
    LDA.W #$0090                                                         ;A8F332;
    STA.L $7E781C,X                                                      ;A8F335;
    LDY.W #$0004                                                         ;A8F339;
    BRA +                                                                ;A8F33C;


.rightOfSamus:
    LDA.W #$FFFE                                                         ;A8F33E;
    STA.L $7E7800,X                                                      ;A8F341;
    LDA.W #$0000                                                         ;A8F345;
    STA.L $7E7804,X                                                      ;A8F348;
    STA.L $7E7806,X                                                      ;A8F34C;
    LDA.W #$FFFF                                                         ;A8F350;
    STA.L $7E7808,X                                                      ;A8F353;
    STA.L $7E780E,X                                                      ;A8F357;
    LDA.W #$E000                                                         ;A8F35B;
    STA.L $7E780A,X                                                      ;A8F35E;
    LDA.W #$00FF                                                         ;A8F362;
    STA.W EnemyData.work5,X                                              ;A8F365;
    LDA.W #$00F0                                                         ;A8F368;
    STA.L $7E781C,X                                                      ;A8F36B;
    LDY.W #$0000                                                         ;A8F36F;

  + LDA.W .instListPointers_kihunter,Y                                   ;A8F372;
    STA.W EnemyData.pInstList,X                                          ;A8F375;
    LDA.W .instListPointers_wings,Y                                      ;A8F378;
    STA.W $0FD2,X                                                        ;A8F37B;
    LDA.W #$0001                                                         ;A8F37E;
    STA.W EnemyData.instTimer,X                                          ;A8F381;
    STA.W $0FD4,X                                                        ;A8F384;
    LDA.W EnemyData.xPosition,X                                          ;A8F387;
    CLC                                                                  ;A8F38A;
    ADC.B $12                                                            ;A8F38B;
    STA.W EnemyData.work1,X                                              ;A8F38D;
    LDA.W EnemyData.yPosition,X                                          ;A8F390;
    STA.W EnemyData.work2,X                                              ;A8F393;
    LDA.W #Function_Kihunter_Winged_Swoop                                ;A8F396;
    STA.W EnemyData.work0,X                                              ;A8F399;
    LDA.B $18                                                            ;A8F39C;
    STA.L $7E7824,X                                                      ;A8F39E;
    LDA.B $14                                                            ;A8F3A2;
    STA.L $7E7822,X                                                      ;A8F3A4;
    LDA.W #$0000                                                         ;A8F3A8;
    STA.L $7E7820,X                                                      ;A8F3AB;
    RTL                                                                  ;A8F3AF;


.instListPointers_kihunter:
    dw InstList_Kihunter_Idling_FacingLeft                               ;A8F3B0;

.instListPointers_wings:
    dw InstList_KihunterWings_FacingLeft                                 ;A8F3B2;
    dw InstList_Kihunter_Idling_FacingRight                              ;A8F3B4;
    dw InstList_KihunterWings_FacingRight                                ;A8F3B6;

Function_Kihunter_Winged_Swoop:
    LDA.L $7E7808,X                                                      ;A8F3B8;
    BPL .arcingRight                                                     ;A8F3BC;
    LDA.W EnemyData.work5,X                                              ;A8F3BE;
    CMP.L $7E781C,X                                                      ;A8F3C1;
    BPL .noInstListChange                                                ;A8F3C5;
    BRA +                                                                ;A8F3C7;


.arcingRight:
    LDA.W EnemyData.work5,X                                              ;A8F3C9;
    CMP.L $7E781C,X                                                      ;A8F3CC;
    BMI .noInstListChange                                                ;A8F3D0;

  + LDA.L $7E7820,X                                                      ;A8F3D2;
    BNE .noInstListChange                                                ;A8F3D6;
    LDA.W #$0001                                                         ;A8F3D8;
    STA.L $7E7820,X                                                      ;A8F3DB;
    LDY.W #InstList_Kihunter_Swiping_FacingRight                         ;A8F3DF;
    LDA.L $7E7808,X                                                      ;A8F3E2;
    BPL .keepRight                                                       ;A8F3E6;
    LDY.W #InstList_Kihunter_Swiping_FacingLeft                          ;A8F3E8;

.keepRight:
    TYA                                                                  ;A8F3EB;
    STA.W EnemyData.pInstList,X                                          ;A8F3EC;
    LDA.W #$0001                                                         ;A8F3EF;
    STA.W EnemyData.instTimer,X                                          ;A8F3F2;

.noInstListChange:
    LDA.L $7E7808,X                                                      ;A8F3F5;
    BPL .rightwards                                                      ;A8F3F9;
    LDA.L $7E7806,X                                                      ;A8F3FB;
    CLC                                                                  ;A8F3FF;
    ADC.L $7E780A,X                                                      ;A8F400;
    STA.L $7E7806,X                                                      ;A8F404;
    LDA.L $7E7804,X                                                      ;A8F408;
    ADC.L $7E7808,X                                                      ;A8F40C;
    CMP.L $7E7800,X                                                      ;A8F410;
    BPL +                                                                ;A8F414;
    LDA.L $7E7800,X                                                      ;A8F416;

  + STA.L $7E7804,X                                                      ;A8F41A;
    LDA.W EnemyData.work5,X                                              ;A8F41E;
    CLC                                                                  ;A8F421;
    ADC.L $7E7804,X                                                      ;A8F422;
    STA.W EnemyData.work5,X                                              ;A8F426;
    CMP.W #$0080                                                         ;A8F429;
    BPL .swoopContinues                                                  ;A8F42C;
    LDA.W #Function_Kihunter_Winged_IdleFlying                           ;A8F42E;
    STA.W EnemyData.work0,X                                              ;A8F431;
    RTL                                                                  ;A8F434;


.rightwards:
    LDA.L $7E7806,X                                                      ;A8F435;
    CLC                                                                  ;A8F439;
    ADC.L $7E780A,X                                                      ;A8F43A;
    STA.L $7E7806,X                                                      ;A8F43E;
    LDA.L $7E7804,X                                                      ;A8F442;
    ADC.L $7E7808,X                                                      ;A8F446;
    CMP.L $7E7800,X                                                      ;A8F44A;
    BMI +                                                                ;A8F44E;
    LDA.L $7E7800,X                                                      ;A8F450;

  + STA.L $7E7804,X                                                      ;A8F454;
    LDA.W EnemyData.work5,X                                              ;A8F458;
    CLC                                                                  ;A8F45B;
    ADC.L $7E7804,X                                                      ;A8F45C;
    STA.W EnemyData.work5,X                                              ;A8F460;
    CMP.W #$0100                                                         ;A8F463;
    BMI .swoopContinues                                                  ;A8F466;
    LDA.W #Function_Kihunter_Winged_IdleFlying                           ;A8F468;
    STA.W EnemyData.work0,X                                              ;A8F46B;
    RTL                                                                  ;A8F46E;


.swoopContinues:
    LDA.L $7E7822,X                                                      ;A8F46F;
    STA.W $0E32                                                          ;A8F473;
    LDA.W EnemyData.work5,X                                              ;A8F476;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F479;
    CLC                                                                  ;A8F47D;
    ADC.W EnemyData.work1,X                                              ;A8F47E;
    SEC                                                                  ;A8F481;
    SBC.W EnemyData.xPosition,X                                          ;A8F482;
    STA.B $14                                                            ;A8F485;
    STZ.B $12                                                            ;A8F487;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8F489;
    BCS .collidedHorizontally                                            ;A8F48D;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8F48F;
    LDA.L $7E7824,X                                                      ;A8F493;
    STA.W $0E32                                                          ;A8F497;
    LDA.W EnemyData.work5,X                                              ;A8F49A;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F49D;
    CLC                                                                  ;A8F4A1;
    ADC.W EnemyData.work2,X                                              ;A8F4A2;
    SEC                                                                  ;A8F4A5;
    SBC.W EnemyData.yPosition,X                                          ;A8F4A6;
    STA.B $14                                                            ;A8F4A9;
    STZ.B $12                                                            ;A8F4AB;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F4AD;
    BCS .collidedVertically                                              ;A8F4B1;
    RTL                                                                  ;A8F4B3;


.collidedHorizontally:
    LDA.L $7E7808,X                                                      ;A8F4B4;
    BPL .arcRight                                                        ;A8F4B8;
    LDA.W #$0000                                                         ;A8F4BA;
    STA.L $7E780C,X                                                      ;A8F4BD;
    LDA.W #$0001                                                         ;A8F4C1;
    STA.L $7E780E,X                                                      ;A8F4C4;
    BRA .collidedVertically                                              ;A8F4C8;


.arcRight:
    LDA.W #$0000                                                         ;A8F4CA;
    STA.L $7E780C,X                                                      ;A8F4CD;
    LDA.W #$FFFF                                                         ;A8F4D1;
    STA.L $7E780E,X                                                      ;A8F4D4;

.collidedVertically:
    LDA.W #Function_Kihunter_Winged_BackOff                              ;A8F4D8;
    STA.W EnemyData.work0,X                                              ;A8F4DB;
    LDA.W #$0000                                                         ;A8F4DE;
    STA.L $7E7810,X                                                      ;A8F4E1;
    LDA.W #$FFFF                                                         ;A8F4E5;
    STA.L $7E7812,X                                                      ;A8F4E8;
    RTL                                                                  ;A8F4EC;


Function_Kihunter_Winged_BackOff:
    LDA.L $7E780C,X                                                      ;A8F4ED;
    STA.B $12                                                            ;A8F4F1;
    LDA.L $7E780E,X                                                      ;A8F4F3;
    STA.B $14                                                            ;A8F4F7;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8F4F9;
    BCS .collidedWithBlock                                               ;A8F4FD;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8F4FF;
    LDA.L $7E7810,X                                                      ;A8F503;
    STA.B $12                                                            ;A8F507;
    LDA.L $7E7812,X                                                      ;A8F509;
    STA.B $14                                                            ;A8F50D;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F50F;
    BCS .collidedWithBlock                                               ;A8F513;
    LDA.W EnemyData.yPosition,X                                          ;A8F515;
    CMP.L $7E781A,X                                                      ;A8F518;
    BMI .collidedWithBlock                                               ;A8F51C;
    RTL                                                                  ;A8F51E;


.collidedWithBlock:
    LDA.W #Function_Kihunter_Winged_IdleFlying                           ;A8F51F;
    STA.W EnemyData.work0,X                                              ;A8F522;
    RTL                                                                  ;A8F525;


Instruction_Kihunter_SetIdlingInstListsFacingForwards:
    LDY.W #InstList_Kihunter_Idling_FacingLeft                           ;A8F526;
    LDA.W #InstList_KihunterWings_FacingLeft                             ;A8F529;
    STA.B $12                                                            ;A8F52C;
    LDA.L $7E780E,X                                                      ;A8F52E;
    BMI .keepLeft                                                        ;A8F532;
    LDY.W #InstList_Kihunter_Idling_FacingRight                          ;A8F534;
    LDA.W #InstList_KihunterWings_FacingRight                            ;A8F537;
    STA.B $12                                                            ;A8F53A;

.keepLeft:
    TYA                                                                  ;A8F53C;
    STA.W EnemyData.pInstList,X                                          ;A8F53D;
    LDA.W #$0001                                                         ;A8F540;
    STA.W EnemyData.instTimer,X                                          ;A8F543;
    LDA.W $0FE8,X                                                        ;A8F546;
    CMP.W #Function_KihunterWings_Attached                               ;A8F549;
    BNE .return                                                          ;A8F54C;
    LDA.B $12                                                            ;A8F54E;
    STA.W $0FD2,X                                                        ;A8F550;
    LDA.W #$0001                                                         ;A8F553;
    STA.W $0FD4,X                                                        ;A8F556;

.return:
    RTL                                                                  ;A8F559;


Function_Kihunter_Wingless_InitialFalling:
    LDA.L $7E7810,X                                                      ;A8F55A;
    STA.B $12                                                            ;A8F55E;
    LDA.L $7E7812,X                                                      ;A8F560;
    STA.B $14                                                            ;A8F564;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F566;
    BCC .notCollidedWithBlock                                            ;A8F56A;
    LDA.W #Function_Kihunter_Wingless_PrepareToHop                       ;A8F56C;
    STA.W EnemyData.work0,X                                              ;A8F56F;
    RTL                                                                  ;A8F572;


.notCollidedWithBlock:
    LDA.L $7E7810,X                                                      ;A8F573;
    CLC                                                                  ;A8F577;
    ADC.W KihunterConstants_fallingAcceleration_hop                      ;A8F578;
    STA.L $7E7810,X                                                      ;A8F57B;
    LDA.L $7E7812,X                                                      ;A8F57F;
    ADC.W KihunterConstants_fallingAcceleration_wingsClipped             ;A8F583;
    STA.L $7E7812,X                                                      ;A8F586;
    RTL                                                                  ;A8F58A;


Function_Kihunter_Wingless_PrepareToHop:
    LDA.W #RTL_A8F5E3                                                    ;A8F58B;
    STA.W EnemyData.work0,X                                              ;A8F58E;
    LDA.W #$0000                                                         ;A8F591;
    STA.L $7E7810,X                                                      ;A8F594;
    LDA.W $05E5                                                          ;A8F598;
    AND.W #$0001                                                         ;A8F59B;
    CLC                                                                  ;A8F59E;
    ADC.W #$FFF8                                                         ;A8F59F;
    STA.L $7E7812,X                                                      ;A8F5A2;
    LDA.W EnemyData.xPosition,X                                          ;A8F5A6;
    CMP.W $0AF6                                                          ;A8F5A9;
    BPL .rightOfSamus                                                    ;A8F5AC;
    LDA.W #$0000                                                         ;A8F5AE;
    STA.L $7E780C,X                                                      ;A8F5B1;
    LDA.W #$0002                                                         ;A8F5B5;
    STA.L $7E780E,X                                                      ;A8F5B8;
    LDA.W #InstList_Kihunter_Hop_FacingRight                             ;A8F5BC;
    STA.W EnemyData.pInstList,X                                          ;A8F5BF;
    LDA.W #$0001                                                         ;A8F5C2;
    STA.W EnemyData.instTimer,X                                          ;A8F5C5;
    RTL                                                                  ;A8F5C8;


.rightOfSamus:
    LDA.W #$0000                                                         ;A8F5C9;
    STA.L $7E780C,X                                                      ;A8F5CC;
    LDA.W #$FFFE                                                         ;A8F5D0;
    STA.L $7E780E,X                                                      ;A8F5D3;
    LDA.W #InstList_Kihunter_Hop_FacingLeft                              ;A8F5D7;
    STA.W EnemyData.pInstList,X                                          ;A8F5DA;
    LDA.W #$0001                                                         ;A8F5DD;
    STA.W EnemyData.instTimer,X                                          ;A8F5E0; fallthrough to RTL_A8F5E3

RTL_A8F5E3:
    RTL                                                                  ;A8F5E3;


Instruction_Kihunter_SetFunctionToHop:
    PHX                                                                  ;A8F5E4;
    LDX.W $0E54                                                          ;A8F5E5;
    LDA.W #Function_Kihunter_Wingless_Hop                                ;A8F5E8;
    STA.W EnemyData.work0,X                                              ;A8F5EB;
    PLX                                                                  ;A8F5EE;
    RTL                                                                  ;A8F5EF;


Function_Kihunter_Wingless_Hop:
    LDA.L $7E7810,X                                                      ;A8F5F0;
    STA.B $12                                                            ;A8F5F4;
    LDA.L $7E7812,X                                                      ;A8F5F6;
    STA.B $14                                                            ;A8F5FA;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F5FC;
    BCS .collidedVertically                                              ;A8F600;
    LDA.L $7E780C,X                                                      ;A8F602;
    STA.B $12                                                            ;A8F606;
    LDA.L $7E780E,X                                                      ;A8F608;
    STA.B $14                                                            ;A8F60C;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;A8F60E;
    BCS .collidedHorizontally                                            ;A8F612;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;A8F614;
    LDA.L $7E7810,X                                                      ;A8F618;
    CLC                                                                  ;A8F61C;
    ADC.W KihunterConstants_fallingAcceleration_hop                      ;A8F61D;
    STA.L $7E7810,X                                                      ;A8F620;
    LDA.L $7E7812,X                                                      ;A8F624;
    ADC.W KihunterConstants_fallingAcceleration_wingsClipped             ;A8F628;
    STA.L $7E7812,X                                                      ;A8F62B;
    RTL                                                                  ;A8F62F;


.collidedHorizontally:
    LDA.L $7E780E,X                                                      ;A8F630;
    EOR.W #$FFFF                                                         ;A8F634;
    INC A                                                                ;A8F637;
    STA.L $7E780E,X                                                      ;A8F638;
    RTL                                                                  ;A8F63C;


.collidedVertically:
    LDA.L $7E7812,X                                                      ;A8F63D;
    BMI .hitCeiling                                                      ;A8F641;
    LDA.W #$0000                                                         ;A8F643;
    STA.L $7E7810,X                                                      ;A8F646;
    LDA.W #$FFFC                                                         ;A8F64A;
    STA.L $7E7812,X                                                      ;A8F64D;
    LDA.W #RTL_A8F5E3                                                    ;A8F651;
    STA.W EnemyData.work0,X                                              ;A8F654;
    LDA.W #$000C                                                         ;A8F657;
    STA.L $7E781E,X                                                      ;A8F65A;
    LDY.W #InstList_Kihunter_LandedFromHop_FacingLeft                    ;A8F65E;
    LDA.W EnemyData.pInstList,X                                          ;A8F661;
    CMP.W #InstList_Kihunter_Hop_FacingRight                             ;A8F664;
    BMI .keepLeft                                                        ;A8F667;
    LDY.W #InstList_Kihunter_LandedFromHop_FacingRight                   ;A8F669;

.keepLeft:
    TYA                                                                  ;A8F66C;
    STA.W EnemyData.pInstList,X                                          ;A8F66D;
    LDA.W #$0001                                                         ;A8F670;
    STA.W EnemyData.instTimer,X                                          ;A8F673;
    RTL                                                                  ;A8F676;


.hitCeiling:
    LDA.W #$0001                                                         ;A8F677;
    STA.L $7E7812,X                                                      ;A8F67A;
    RTL                                                                  ;A8F67E;


Instruction_Kihunter_SetFunctionTo_Wingless_Thinking:
    PHX                                                                  ;A8F67F;
    LDX.W $0E54                                                          ;A8F680;
    LDA.W #Function_Kihunter_Wingless_Thinking                           ;A8F683;
    STA.W EnemyData.work0,X                                              ;A8F686;
    PLX                                                                  ;A8F689;
    RTL                                                                  ;A8F68A;


Function_Kihunter_Wingless_Thinking:
    LDA.L $7E781E,X                                                      ;A8F68B;
    DEC A                                                                ;A8F68F;
    STA.L $7E781E,X                                                      ;A8F690;
    BNE .return                                                          ;A8F694;
    LDY.W #Function_Kihunter_Wingless_PrepareToHop                       ;A8F696;
    LDA.W EnemyData.xPosition,X                                          ;A8F699;
    SEC                                                                  ;A8F69C;
    SBC.W $0AF6                                                          ;A8F69D;
    BPL +                                                                ;A8F6A0;
    EOR.W #$FFFF                                                         ;A8F6A2;
    INC A                                                                ;A8F6A5;

  + CMP.W #$0060                                                         ;A8F6A6;
    BPL .keepHop                                                         ;A8F6A9;
    LDY.W #Function_Kihunter_Wingless_FireAcidSpit                       ;A8F6AB;

.keepHop:
    TYA                                                                  ;A8F6AE;
    STA.W EnemyData.work0,X                                              ;A8F6AF;

.return:
    RTL                                                                  ;A8F6B2;


Function_Kihunter_Wingless_FireAcidSpit:
    LDY.W #InstList_Kihunter_AcidSpitAttack_FacingLeft                   ;A8F6B3;
    LDA.W EnemyData.xPosition,X                                          ;A8F6B6;
    CMP.W $0AF6                                                          ;A8F6B9;
    BPL .keepLeft                                                        ;A8F6BC;
    LDY.W #InstList_Kihunter_AcidSpitAttack_FacingRight                  ;A8F6BE;

.keepLeft:
    TYA                                                                  ;A8F6C1;
    STA.W EnemyData.pInstList,X                                          ;A8F6C2;
    LDA.W #$0001                                                         ;A8F6C5;
    STA.W EnemyData.instTimer,X                                          ;A8F6C8;
    LDA.W #RTL_A8F5E3                                                    ;A8F6CB;
    STA.W EnemyData.work0,X                                              ;A8F6CE;
    RTL                                                                  ;A8F6D1;


Instruction_Kihunter_FireAcidSpitLeft:
    PHY                                                                  ;A8F6D2;
    LDY.W #EnemyProjectile_KiHunterAcidSpit_Left                         ;A8F6D3;
    BRA FireAcidSpit                                                     ;A8F6D6;


Instruction_Kihunter_FireAcidSpitRight:
    PHY                                                                  ;A8F6D8;
    LDY.W #EnemyProjectile_KiHunterAcidSpit_Right                        ;A8F6D9; fallthrough to FireAcidSpit

FireAcidSpit:
    LDA.W #$004C                                                         ;A8F6DC;
    JSL.L QueueSound_Lib2_Max6                                           ;A8F6DF;
    LDX.W $0E54                                                          ;A8F6E3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A8F6E6;
    LDA.W #$0018                                                         ;A8F6EA;
    STA.L $7E781E,X                                                      ;A8F6ED;
    PLY                                                                  ;A8F6F1;
    RTL                                                                  ;A8F6F2;


Function_KihunterWings_Attached:
    LDA.W $0F3A,X                                                        ;A8F6F3;
    STA.W EnemyData.xPosition,X                                          ;A8F6F6;
    LDA.W $0F3E,X                                                        ;A8F6F9;
    STA.W EnemyData.yPosition,X                                          ;A8F6FC;
    RTL                                                                  ;A8F6FF;


RTL_A8F700:
    RTL                                                                  ;A8F700;


EnemyShot_Kihunter:
    JSL.L NormalEnemyShotAI                                              ;A8F701;
    LDX.W $0E54                                                          ;A8F705;
    LDA.W EnemyData.health,X                                             ;A8F708;
    BEQ .dead                                                            ;A8F70B;
    CMP.W $0FF4,X                                                        ;A8F70D;
    BEQ .clipWings                                                       ;A8F710;
    BMI .clipWings                                                       ;A8F712;
    LDA.W EnemyData.ai,X                                                 ;A8F714;
    STA.W $0FCA,X                                                        ;A8F717;
    LDA.W EnemyData.freezeTimer,X                                        ;A8F71A;
    STA.W $0FDE,X                                                        ;A8F71D;
    LDA.W EnemyData.invincibilityTimer,X                                 ;A8F720;
    STA.W $0FE0,X                                                        ;A8F723;
    LDA.W EnemyData.flashTimer,X                                         ;A8F726;
    STA.W $0FDC,X                                                        ;A8F729;

.returnUpper:
    RTL                                                                  ;A8F72C;


.dead:
    LDA.W #$0200                                                         ;A8F72D;
    STA.W $0FC6,X                                                        ;A8F730;
    RTL                                                                  ;A8F733;


.clipWings:
    LDA.L $7E7828,X                                                      ;A8F734;
    BNE .returnUpper                                                     ;A8F738;
    LDA.W #$0001                                                         ;A8F73A;
    STA.L $7E7828,X                                                      ;A8F73D;
    LDA.W #Function_Kihunter_Wingless_InitialFalling                     ;A8F741;
    STA.W EnemyData.work0,X                                              ;A8F744;
    LDA.W #$0000                                                         ;A8F747;
    STA.L $7E7810,X                                                      ;A8F74A;
    LDA.W #$0001                                                         ;A8F74E;
    STA.L $7E7812,X                                                      ;A8F751;
    PHX                                                                  ;A8F755;
    TXA                                                                  ;A8F756;
    CLC                                                                  ;A8F757;
    ADC.W #$0040                                                         ;A8F758;
    STA.W $0E54                                                          ;A8F75B;
    TAX                                                                  ;A8F75E;
    LDA.W EnemyData.work0,X                                              ;A8F75F;
    CMP.W #Function_KihunterWings_Falling                                ;A8F762;
    BEQ .returnLower                                                     ;A8F765;
    LDA.W EnemyData.yPosition,X                                          ;A8F767;
    STA.L $7E780E,X                                                      ;A8F76A;
    LDA.W EnemyData.xPosition,X                                          ;A8F76E;
    STA.L $7E7810,X                                                      ;A8F771;
    JSR.W DetermineFallingKihunterWingsSpeedTableIndexResetValue         ;A8F775;
    JSR.W DetermineFallingKihunterWingsLeftArcCenterOffsets              ;A8F778;
    JSR.W DetermineFallingKihunterWingsRightArcCenterOffsets             ;A8F77B;
    LDA.W #$E000                                                         ;A8F77E;
    STA.W EnemyData.work5,X                                              ;A8F781;
    LDA.W #Function_KihunterWings_Falling                                ;A8F784;
    STA.W EnemyData.work0,X                                              ;A8F787;
    LDA.W #Function_KihunterWings_Falling_DriftingLeft                   ;A8F78A;
    STA.L $7E7800,X                                                      ;A8F78D;
    LDA.L $7E780E,X                                                      ;A8F791;
    SEC                                                                  ;A8F795;
    SBC.L $7E7816,X                                                      ;A8F796;
    STA.L $7E780C,X                                                      ;A8F79A;
    LDA.W EnemyData.xPosition,X                                          ;A8F79E;
    STA.L $7E780A,X                                                      ;A8F7A1;
    LDA.L $7E7814,X                                                      ;A8F7A5;
    STA.W EnemyData.work1,X                                              ;A8F7A9;
    LDA.W #InstList_KihunterWings_Falling                                ;A8F7AC;
    STA.W EnemyData.pInstList,X                                          ;A8F7AF;
    LDA.W #Spritemap_CommonA8_Nothing                                    ;A8F7B2;
    STA.W EnemyData.pSpritemap,X                                         ;A8F7B5;
    LDA.W #$0001                                                         ;A8F7B8;
    STA.W EnemyData.instTimer,X                                          ;A8F7BB;
    STZ.W EnemyData.loopCounter,X                                        ;A8F7BE;
    LDA.W EnemyData.properties,X                                         ;A8F7C1;
    ORA.W #$0800                                                         ;A8F7C4;
    STA.W EnemyData.properties,X                                         ;A8F7C7;

.returnLower:
    PLA                                                                  ;A8F7CA;
    STA.W $0E54                                                          ;A8F7CB;
    RTL                                                                  ;A8F7CE;


Function_KihunterWings_Falling:
    LDX.W $0E54                                                          ;A8F7CF;
    LDA.L $7E7800,X                                                      ;A8F7D2;
    STA.B $12                                                            ;A8F7D6;
    JMP.W ($0012)                                                        ;A8F7D8;


Function_KihunterWings_Falling_DriftingLeft:
    LDX.W $0E54                                                          ;A8F7DB;
    LDA.W EnemyData.work1,X                                              ;A8F7DE;
    AND.W #$FF00                                                         ;A8F7E1;
    XBA                                                                  ;A8F7E4;
    ASL A                                                                ;A8F7E5;
    ASL A                                                                ;A8F7E6;
    ASL A                                                                ;A8F7E7;
    TAY                                                                  ;A8F7E8;
    LDA.W EnemyData.work5,X                                              ;A8F7E9;
    CLC                                                                  ;A8F7EC;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+5,Y                  ;A8F7ED;
    STA.W EnemyData.work5,X                                              ;A8F7F0;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F7F3;
    AND.W #$00FF                                                         ;A8F7F6;
    STA.W $0E32                                                          ;A8F7F9;
    LDA.W EnemyData.work5,X                                              ;A8F7FC;
    XBA                                                                  ;A8F7FF;
    AND.W #$00FF                                                         ;A8F800;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F803;
    SEC                                                                  ;A8F807;
    SBC.L $7E7808,X                                                      ;A8F808;
    CLC                                                                  ;A8F80C;
    ADC.L $7E780C,X                                                      ;A8F80D;
    STA.W EnemyData.yPosition,X                                          ;A8F811;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F814;
    AND.W #$00FF                                                         ;A8F817;
    STA.W $0E32                                                          ;A8F81A;
    LDA.W EnemyData.work5,X                                              ;A8F81D;
    XBA                                                                  ;A8F820;
    AND.W #$00FF                                                         ;A8F821;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F824;
    SEC                                                                  ;A8F828;
    SBC.L $7E7806,X                                                      ;A8F829;
    CLC                                                                  ;A8F82D;
    ADC.L $7E780A,X                                                      ;A8F82E;
    STA.W EnemyData.xPosition,X                                          ;A8F832;
    LDA.W EnemyData.work5,X                                              ;A8F835;
    CMP.W #$C000                                                         ;A8F838;
    BPL +                                                                ;A8F83B;
    JSR.W SetupFallingKihunterWingsDriftingRight                         ;A8F83D;
    RTL                                                                  ;A8F840;


  + LDA.W EnemyData.work1,X                                              ;A8F841;
    SEC                                                                  ;A8F844;
    SBC.W #$0180                                                         ;A8F845;
    BPL .return                                                          ;A8F848;
    LDA.W #$0100                                                         ;A8F84A;

.return:
    STA.W EnemyData.work1,X                                              ;A8F84D;
    RTL                                                                  ;A8F850;


DetermineFallingKihunterWingsLeftArcCenterOffsets:
    LDX.W $0E54                                                          ;A8F851;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F854;
    AND.W #$00FF                                                         ;A8F857;
    STA.W $0E32                                                          ;A8F85A;
    LDA.W #$E000                                                         ;A8F85D;
    XBA                                                                  ;A8F860;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F861;
    STA.L $7E7806,X                                                      ;A8F865;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F869;
    AND.W #$00FF                                                         ;A8F86C;
    STA.W $0E32                                                          ;A8F86F;
    LDA.W #$E000                                                         ;A8F872;
    XBA                                                                  ;A8F875;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F876;
    STA.L $7E7808,X                                                      ;A8F87A;
    RTS                                                                  ;A8F87E;


DetermineFallingKihunterWingsRightArcCenterOffsets:
    LDX.W $0E54                                                          ;A8F87F;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F882;
    AND.W #$00FF                                                         ;A8F885;
    STA.W $0E32                                                          ;A8F888;
    LDA.W #$A000                                                         ;A8F88B;
    XBA                                                                  ;A8F88E;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F88F;
    STA.L $7E7802,X                                                      ;A8F893;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F897;
    AND.W #$00FF                                                         ;A8F89A;
    STA.W $0E32                                                          ;A8F89D;
    LDA.W #$A000                                                         ;A8F8A0;
    XBA                                                                  ;A8F8A3;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F8A4;
    STA.L $7E7804,X                                                      ;A8F8A8;
    RTS                                                                  ;A8F8AC;


Function_KihunterWings_Falling_DriftingRight:
    LDX.W $0E54                                                          ;A8F8AD;
    LDA.W EnemyData.work1,X                                              ;A8F8B0;
    AND.W #$FF00                                                         ;A8F8B3;
    XBA                                                                  ;A8F8B6;
    ASL A                                                                ;A8F8B7;
    ASL A                                                                ;A8F8B8;
    ASL A                                                                ;A8F8B9;
    TAY                                                                  ;A8F8BA;
    LDA.W EnemyData.work5,X                                              ;A8F8BB;
    CLC                                                                  ;A8F8BE;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y                  ;A8F8BF;
    STA.W EnemyData.work5,X                                              ;A8F8C2;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F8C5;
    AND.W #$00FF                                                         ;A8F8C8;
    STA.W $0E32                                                          ;A8F8CB;
    LDA.W EnemyData.work5,X                                              ;A8F8CE;
    XBA                                                                  ;A8F8D1;
    AND.W #$00FF                                                         ;A8F8D2;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A8F8D5;
    SEC                                                                  ;A8F8D9;
    SBC.L $7E7804,X                                                      ;A8F8DA;
    CLC                                                                  ;A8F8DE;
    ADC.L $7E780C,X                                                      ;A8F8DF;
    SEC                                                                  ;A8F8E3;
    SBC.W EnemyData.yPosition,X                                          ;A8F8E4;
    STA.B $14                                                            ;A8F8E7;
    STZ.B $12                                                            ;A8F8E9;
    JSL.L MoveEnemyDownBy_14_12                                          ;A8F8EB;
    BCS .collidedVertically                                              ;A8F8EF;
    LDA.W KihunterConstants_fallingWingsArcRadius                        ;A8F8F1;
    AND.W #$00FF                                                         ;A8F8F4;
    STA.W $0E32                                                          ;A8F8F7;
    LDA.W EnemyData.work5,X                                              ;A8F8FA;
    XBA                                                                  ;A8F8FD;
    AND.W #$00FF                                                         ;A8F8FE;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A8F901;
    SEC                                                                  ;A8F905;
    SBC.L $7E7802,X                                                      ;A8F906;
    CLC                                                                  ;A8F90A;
    ADC.L $7E780A,X                                                      ;A8F90B;
    STA.W EnemyData.xPosition,X                                          ;A8F90F;
    LDA.W EnemyData.work5,X                                              ;A8F912;
    CMP.W #$C000                                                         ;A8F915;
    BMI +                                                                ;A8F918;
    JSR.W SetupFallingKihunterWingsDriftingLeft                          ;A8F91A;
    RTL                                                                  ;A8F91D;


  + LDA.W EnemyData.work1,X                                              ;A8F91E;
    SEC                                                                  ;A8F921;
    SBC.W #$0180                                                         ;A8F922;
    BPL .return                                                          ;A8F925;
    LDA.W #$0100                                                         ;A8F927;

.return:
    STA.W EnemyData.work1,X                                              ;A8F92A;
    RTL                                                                  ;A8F92D;


.collidedVertically:
    LDA.W EnemyData.properties,X                                         ;A8F92E;
    ORA.W #$0200                                                         ;A8F931;
    STA.W EnemyData.properties,X                                         ;A8F934;
    LDA.L $7E7810,X                                                      ;A8F937;
    STA.W EnemyData.xPosition,X                                          ;A8F93B;
    LDA.L $7E780E,X                                                      ;A8F93E;
    STA.W EnemyData.yPosition,X                                          ;A8F942;
    BRA .return                                                          ;A8F945;


SetupFallingKihunterWingsDriftingLeft:
    LDA.W #Function_KihunterWings_Falling_DriftingLeft                   ;A8F947;
    STA.L $7E7800,X                                                      ;A8F94A;
    LDA.L $7E7814,X                                                      ;A8F94E;
    STA.W EnemyData.work1,X                                              ;A8F952;
    LDA.W #$E000                                                         ;A8F955;
    STA.W EnemyData.work5,X                                              ;A8F958;
    LDA.W EnemyData.xPosition,X                                          ;A8F95B;
    STA.L $7E780A,X                                                      ;A8F95E;
    LDA.W EnemyData.yPosition,X                                          ;A8F962;
    STA.L $7E780C,X                                                      ;A8F965;
    RTS                                                                  ;A8F969;


SetupFallingKihunterWingsDriftingRight:
    LDA.W #Function_KihunterWings_Falling_DriftingRight                  ;A8F96A;
    STA.L $7E7800,X                                                      ;A8F96D;
    LDA.L $7E7814,X                                                      ;A8F971;
    STA.W EnemyData.work1,X                                              ;A8F975;
    LDA.W #$A000                                                         ;A8F978;
    STA.W EnemyData.work5,X                                              ;A8F97B;
    LDA.W EnemyData.xPosition,X                                          ;A8F97E;
    STA.L $7E780A,X                                                      ;A8F981;
    LDA.W EnemyData.yPosition,X                                          ;A8F985;
    STA.L $7E780C,X                                                      ;A8F988;
    RTS                                                                  ;A8F98C;


DetermineFallingKihunterWingsSpeedTableIndexResetValue:
    LDX.W $0E54                                                          ;A8F98D;
    LDA.W #$0000                                                         ;A8F990;
    STA.L $7E7814,X                                                      ;A8F993;
    STA.W EnemyData.work1,X                                              ;A8F997;

.loop:
    LDA.L $7E7814,X                                                      ;A8F99A;
    CLC                                                                  ;A8F99E;
    ADC.W #$0180                                                         ;A8F99F;
    STA.L $7E7814,X                                                      ;A8F9A2;
    AND.W #$FF00                                                         ;A8F9A6;
    XBA                                                                  ;A8F9A9;
    ASL A                                                                ;A8F9AA;
    ASL A                                                                ;A8F9AB;
    ASL A                                                                ;A8F9AC;
    TAY                                                                  ;A8F9AD;
    LDA.W EnemyData.work3,X                                              ;A8F9AE;
    CLC                                                                  ;A8F9B1;
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y                  ;A8F9B2;
    STA.W EnemyData.work3,X                                              ;A8F9B5;
    CMP.W #$2000                                                         ;A8F9B8;
    BMI .loop                                                            ;A8F9BB;
    RTS                                                                  ;A8F9BD;


Freespace_BankA8_F9BE:                                                   ;A8F9BE;
; $642 bytes
