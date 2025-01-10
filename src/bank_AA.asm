
org $AA8000


CommonAA_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;AA8000;
    RTL                                                                  ;AA8004;


CommonAA_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;AA8005;
    RTL                                                                  ;AA8009;


CommonAA_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;AA800A;
    RTL                                                                  ;AA800E;


CommonAA_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;AA800F;
    RTL                                                                  ;AA8013;


CommonAA_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;AA8014;
    RTL                                                                  ;AA8018;


UNUSED_CommonAA_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A38019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;AA8019;
    RTL                                                                  ;AA801D;


CommonAA_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;AA801E;
    RTL                                                                  ;AA8022;


CommonAA_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;AA8023;
    RTL                                                                  ;AA8027;


CommonAA_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;AA8028;
    RTL                                                                  ;AA802C;


CommonAA_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;AA802D;
    RTL                                                                  ;AA8031;


CommonAA_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;AA8032;
    RTL                                                                  ;AA8036;


CommonAA_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;AA8037;
    RTL                                                                  ;AA803B;


CommonAA_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;AA803C;
    RTL                                                                  ;AA8040;


CommonAA_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;AA8041;
    RTL                                                                  ;AA8045;


CommonAA_CreateADudShot_JSL:
    JSL.L CreateADudShot                                                 ;AA8046;
    RTL                                                                  ;AA804A;


RTS_AA804B:
    RTS                                                                  ;AA804B;


RTL_AA804C:
    RTL                                                                  ;AA804C;


Spritemap_CommonAA_Nothing:
    dw $0000                                                             ;AA804D;

ExtendedSpritemap_CommonAA_Nothing:
    dw $0001,$0000,$0000                                                 ;AA804F;
    dw Spritemap_CommonAA_Nothing                                        ;AA8055;
    dw Hitbox_CommonAA_Nothing                                           ;AA8057;

Hitbox_CommonAA_Nothing:
    dw $0001,$0000,$0000,$0000,$0000                                     ;AA8059;
    dw CommonAA_NormalEnemyTouchAI                                       ;AA8063;
    dw CommonAA_NormalEnemyShotAI                                        ;AA8065;

InstList_CommonAA_DeleteEnemy:
    dw Instruction_CommonAA_DeleteEnemy                                  ;AA8067;

NOPNOP_AA8069:
    NOP                                                                  ;AA8069;
    NOP                                                                  ;AA806A;

Instruction_CommonAA_Enemy0FB2_InY:
    LDA.W $0000,Y                                                        ;AA806B;
    STA.W EnemyData.work5,X                                              ;AA806E;
    INY                                                                  ;AA8071;
    INY                                                                  ;AA8072;
    RTL                                                                  ;AA8073;


Instruction_CommonAA3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_AA807B                                                    ;AA8074;
    STA.W EnemyData.work5,X                                              ;AA8077;
    RTL                                                                  ;AA807A;


RTS_AA807B:
    RTS                                                                  ;AA807B;


Instruction_CommonAA_DeleteEnemy:
    LDA.W EnemyData.properties,X                                         ;AA807C;
    ORA.W #$0200                                                         ;AA807F;
    STA.W EnemyData.properties,X                                         ;AA8082;
    PLA                                                                  ;AA8085;
    PEA.W ProcessEnemyInstructions_return-1                              ;AA8086;
    RTL                                                                  ;AA8089;


Instruction_CommonAA_CallFunctionInY:
    LDA.W $0000,Y                                                        ;AA808A;
    STA.B $12                                                            ;AA808D;
    PHY                                                                  ;AA808F;
    PHX                                                                  ;AA8090;
    PEA.W .manualReturn-1                                                ;AA8091;
    JMP.W ($0012)                                                        ;AA8094;


.manualReturn:
    PLX                                                                  ;AA8097;
    PLY                                                                  ;AA8098;
    INY                                                                  ;AA8099;
    INY                                                                  ;AA809A;
    RTL                                                                  ;AA809B;


Instruction_CommonAA_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;AA809C;
    STA.B $12                                                            ;AA809F;
    LDA.W $0002,Y                                                        ;AA80A1;
    PHY                                                                  ;AA80A4;
    PHX                                                                  ;AA80A5;
    PEA.W .manualReturn-1                                                ;AA80A6;
    JMP.W ($0012)                                                        ;AA80A9;


.manualReturn:
    PLX                                                                  ;AA80AC;
    PLY                                                                  ;AA80AD;
    TYA                                                                  ;AA80AE;
    CLC                                                                  ;AA80AF;
    ADC.W #$0004                                                         ;AA80B0;
    TAY                                                                  ;AA80B3;
    RTL                                                                  ;AA80B4;


UNUSED_Instruction_CommonAA_CallExternalFunctionInY_AA80B5:
    LDA.W $0000,Y                                                        ;AA80B5;
    STA.B $12                                                            ;AA80B8;
    LDA.W $0001,Y                                                        ;AA80BA;
    STA.B $13                                                            ;AA80BD;
    PHX                                                                  ;AA80BF;
    PHY                                                                  ;AA80C0;
    JSL.L .externalFunction                                              ;AA80C1;
    PLY                                                                  ;AA80C5;
    PLX                                                                  ;AA80C6;
    INY                                                                  ;AA80C7;
    INY                                                                  ;AA80C8;
    INY                                                                  ;AA80C9;
    RTL                                                                  ;AA80CA;


.externalFunction:
    JML.W [$0012]                                                        ;AA80CB;


UNUSED_Inst_CommonAA_CallExternalFunctionInY_WithA_AA80CE:
    LDA.W $0000,Y                                                        ;AA80CE;
    STA.B $12                                                            ;AA80D1;
    LDA.W $0001,Y                                                        ;AA80D3;
    STA.B $13                                                            ;AA80D6;
    LDA.W $0003,Y                                                        ;AA80D8;
    PHX                                                                  ;AA80DB;
    PHY                                                                  ;AA80DC;
    JSL.L .externalFunction                                              ;AA80DD;
    PLY                                                                  ;AA80E1;
    PLX                                                                  ;AA80E2;
    TYA                                                                  ;AA80E3;
    CLC                                                                  ;AA80E4;
    ADC.W #$0005                                                         ;AA80E5;
    TAY                                                                  ;AA80E8;
    RTL                                                                  ;AA80E9;


.externalFunction:
    JML.W [$0012]                                                        ;AA80EA;


Instruction_CommonAA_GotoY:
    LDA.W $0000,Y                                                        ;AA80ED;
    TAY                                                                  ;AA80F0;
    RTL                                                                  ;AA80F1;


Instruction_CommonAA_GotoY_PlusY:
    STY.B $12                                                            ;AA80F2;
    DEY                                                                  ;AA80F4;
    LDA.W $0000,Y                                                        ;AA80F5;
    XBA                                                                  ;AA80F8;
    BMI .highByte                                                        ;AA80F9;
    AND.W #$00FF                                                         ;AA80FB;
    BRA +                                                                ;AA80FE;


.highByte:
    ORA.W #$FF00                                                         ;AA8100;

  + CLC                                                                  ;AA8103;
    ADC.B $12                                                            ;AA8104;
    TAY                                                                  ;AA8106;
    RTL                                                                  ;AA8107;


Instruction_CommonAA_DecrementTimer_GotoYIfNonZero:
    DEC.W EnemyData.loopCounter,X                                        ;AA8108;
    BNE Instruction_CommonAA_GotoY                                       ;AA810B;
    INY                                                                  ;AA810D;
    INY                                                                  ;AA810E;
    RTL                                                                  ;AA810F;


Instruction_CommonAA_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W EnemyData.loopCounter,X                                        ;AA8110;
    BNE Instruction_CommonAA_GotoY                                       ;AA8113;
    INY                                                                  ;AA8115;
    INY                                                                  ;AA8116;
    RTL                                                                  ;AA8117;


Instruction_CommonAA_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;AA8118;
    DEC.W EnemyData.loopCounter,X                                        ;AA811A;
    REP #$20                                                             ;AA811D;
    BNE Instruction_CommonAA_GotoY_PlusY                                 ;AA811F;
    INY                                                                  ;AA8121;
    RTL                                                                  ;AA8122;


Instruction_CommonAA_TimerInY:
    LDA.W $0000,Y                                                        ;AA8123;
    STA.W EnemyData.loopCounter,X                                        ;AA8126;
    INY                                                                  ;AA8129;
    INY                                                                  ;AA812A;
    RTL                                                                  ;AA812B;


Instruction_CommonAA_SkipNextInstruction:
    INY                                                                  ;AA812C;
    INY                                                                  ;AA812D;
    RTL                                                                  ;AA812E;


Instruction_CommonAA_Sleep:
    DEY                                                                  ;AA812F;
    DEY                                                                  ;AA8130;
    TYA                                                                  ;AA8131;
    STA.W EnemyData.pInstList,X                                          ;AA8132;
    PLA                                                                  ;AA8135;
    PEA.W ProcessEnemyInstructions_return-1                              ;AA8136;
    RTL                                                                  ;AA8139;


Instruction_CommonAA_WaitYFrames:
    LDA.W $0000,Y                                                        ;AA813A;
    STA.W EnemyData.instTimer,X                                          ;AA813D;
    INY                                                                  ;AA8140;
    INY                                                                  ;AA8141;
    TYA                                                                  ;AA8142;
    STA.W EnemyData.pInstList,X                                          ;AA8143;
    PLA                                                                  ;AA8146;
    PEA.W ProcessEnemyInstructions_return-1                              ;AA8147;
    RTL                                                                  ;AA814A;


Instruction_CommonAA_TransferYBytesInYToVRAM:
    PHX                                                                  ;AA814B;
    LDX.W $0330                                                          ;AA814C;
    LDA.W $0000,Y                                                        ;AA814F;
    STA.B $D0,X                                                          ;AA8152;
    LDA.W $0002,Y                                                        ;AA8154;
    STA.B $D2,X                                                          ;AA8157;
    LDA.W $0003,Y                                                        ;AA8159;
    STA.B $D3,X                                                          ;AA815C;
    LDA.W $0005,Y                                                        ;AA815E;
    STA.B $D5,X                                                          ;AA8161;
    TXA                                                                  ;AA8163;
    CLC                                                                  ;AA8164;
    ADC.W #$0007                                                         ;AA8165;
    STA.W $0330                                                          ;AA8168;
    TYA                                                                  ;AA816B;
    CLC                                                                  ;AA816C;
    ADC.W #$0007                                                         ;AA816D;
    TAY                                                                  ;AA8170;
    PLX                                                                  ;AA8171;
    RTL                                                                  ;AA8172;


Instruction_CommonAA_EnableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;AA8173;
    ORA.W #$0800                                                         ;AA8176;
    STA.W EnemyData.properties,X                                         ;AA8179;
    RTL                                                                  ;AA817C;


Instruction_CommonAA_DisableOffScreenProcessing:
    LDA.W EnemyData.properties,X                                         ;AA817D;
    AND.W #$F7FF                                                         ;AA8180;
    STA.W EnemyData.properties,X                                         ;AA8183;
    RTL                                                                  ;AA8186;


CommonAAEnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000                   ;AA8187;
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000                   ;AA8197;
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000                   ;AA81A7;
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000                   ;AA81B7;
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000                   ;AA81C7;
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000                   ;AA81D7;
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000                   ;AA81E7;
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000                   ;AA81F7;
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000                   ;AA8207;
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000                   ;AA8217;
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000                   ;AA8227;
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000                   ;AA8237;
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000                   ;AA8247;
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000                   ;AA8257;
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000                   ;AA8267;
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000                   ;AA8277;
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000                   ;AA8287;
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000                   ;AA8297;
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000                   ;AA82A7;
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000                   ;AA82B7;
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000                   ;AA82C7;
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000                   ;AA82D7;
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000                   ;AA82E7;
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000                   ;AA82F7;
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000                   ;AA8307;
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000                   ;AA8317;
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000                   ;AA8327;
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000                   ;AA8337;
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000                   ;AA8347;
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000                   ;AA8357;
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000                   ;AA8367;
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000                   ;AA8377;
    dw $0004,$0000,$FFFC,$0000                                           ;AA8387;

CommonAAEnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF                   ;AA838F;
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF                   ;AA839F;
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF                   ;AA83AF;
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF                   ;AA83BF;
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF                   ;AA83CF;
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF                   ;AA83DF;
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF                   ;AA83EF;
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF                   ;AA83FF;
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF                   ;AA840F;
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF                   ;AA841F;
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF                   ;AA842F;
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE                   ;AA843F;
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE                   ;AA844F;
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE                   ;AA845F;
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE                   ;AA846F;
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE                   ;AA847F;
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD                   ;AA848F;
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD                   ;AA849F;
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD                   ;AA84AF;
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC                   ;AA84BF;
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC                   ;AA84CF;
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC                   ;AA84DF;
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB                   ;AA84EF;
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB                   ;AA84FF;
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB                   ;AA850F;
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA                   ;AA851F;
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA                   ;AA852F;
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9                   ;AA853F;
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9                   ;AA854F;
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9                   ;AA855F;
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8                   ;AA856F;
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8                   ;AA857F;
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7                   ;AA858F;
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7                   ;AA859F;
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6                   ;AA85AF;
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6                   ;AA85BF;
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5                   ;AA85CF;
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4                   ;AA85DF;
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4                   ;AA85EF;
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3                   ;AA85FF;
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3                   ;AA860F;
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2                   ;AA861F;
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1                   ;AA862F;
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1                   ;AA863F;
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0                   ;AA864F;
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF                   ;AA865F;
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE                   ;AA866F;
    dw $74F9,$0011,$8B07,$FFEE                                           ;AA867F;

Palette_Torizo_OrbProjectile:
    dw $3800,$03FF,$033B,$0216,$0113,$6B1E,$4A16,$3591                   ;AA8687;
    dw $20E9,$1580,$1580,$1580,$1580,$1580,$1580,$1580                   ;AA8697;

Palette_Torizo_BombTorizoStatue:
    dw $3800,$02DF,$01D7,$00AC,$5A73,$41AD,$2D08,$1863                   ;AA86A7;
    dw $1486,$0145,$0145,$0145,$7FFF,$0145,$0145,$0000                   ;AA86B7;

Palette_Torizo_InitialBombTorizo_SpritePalette1:
    dw $3800,$679F,$5299,$252E,$14AA,$5EFC,$4657,$35B2                   ;AA86C7;
    dw $2D70,$5B7F,$3DF8,$2D0E,$5F5F,$5E1A,$5D35,$0C63                   ;AA86D7;

Palette_Torizo_InitialBombTorizo_SpritePalette2:
    dw $3800,$4ABA,$35B2,$0847,$0003,$4215,$2970,$18CB                   ;AA86E7;
    dw $1089,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63                   ;AA86F7;

Palette_Torizo_Normal_SpritePalette1:
    dw $3800,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB                   ;AA8707;
    dw $1868,$6F7F,$51F8,$410E,$031F,$01DA,$00F5,$0C63                   ;AA8717;

Palette_Torizo_Normal_SpritePalette2:
    dw $3800,$4215,$2D0D,$0002,$0000,$3970,$20CB,$0C26                   ;AA8727;
    dw $0403,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63                   ;AA8737;

Palette_Torizo_InitialGoldenTorizo_SpritePalette1:
    dw $3800,$6AB5,$49B0,$1C45,$0C01,$5613,$416D,$2CC9                   ;AA8747;
    dw $2066,$5714,$31CC,$14E3,$5630,$3569,$1883,$0C66                   ;AA8757;

Palette_Torizo_InitialGoldenTorizo_SpritePalette2:
    dw $3800,$5610,$350B,$0800,$0000,$416E,$2CC8,$1823                   ;AA8767;
    dw $0C01,$6A31,$4CAA,$2406,$7F7B,$75F4,$4D10,$0C63                   ;AA8777;

Palette_Torizo_GoldenTorizo_SpritePalette1:
    dw $3800,$4BBE,$06B9,$00A8,$0000,$173A,$0276,$01F2                   ;AA8787;
    dw $014D,$73E0,$4F20,$2A20,$7FE0,$5AA0,$5920,$0043                   ;AA8797;

Palette_Torizo_GoldenTorizo_SpritePalette2:
    dw $3800,$3719,$0214,$0003,$0000,$0295,$01D1,$014D                   ;AA87A7;
    dw $00A8,$4B40,$25E0,$00E0,$6B40,$4600,$4480,$0000                   ;AA87B7;

Hitboxes_Torizo_Blank:
    dw $0000                                                             ;AA87C7;

Spritemap_Torizo_Blank:
    dw $0001,$0100                                                       ;AA87C9;
    db $00                                                               ;AA87CD;
    dw $4200                                                             ;AA87CE;

ExtendedSpritemap_Torizo_Blank:
    dw $0001,$0000,$0000                                                 ;AA87D0;
    dw Spritemap_Torizo_Blank                                            ;AA87D6;
    dw Hitboxes_Torizo_Blank                                             ;AA87D8;

UNUSED_Hitboxes_Torizo_AA87DA:
    dw $0001,$FFF5,$FFD6,$000A,$0003                                     ;AA87DA;
    dw EnemyTouch_Torizo                                                 ;AA87E4;
    dw EnemyShot_Torizo_Normal                                           ;AA87E6;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_0:
    dw $0001,$FFF0,$FFE5,$0010,$001B                                     ;AA87E8;
    dw EnemyTouch_Torizo                                                 ;AA87F2;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA87F4;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_1:
    dw $0001,$FFF2,$FFE5,$000D,$001B                                     ;AA87F6;
    dw EnemyTouch_Torizo                                                 ;AA8800;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA8802;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_2:
    dw $0001,$FFF3,$FFDE,$0009,$0021                                     ;AA8804;
    dw EnemyTouch_Torizo                                                 ;AA880E;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA8810;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_3:
    dw $0001,$FFF5,$FFDA,$000B,$0027                                     ;AA8812;
    dw EnemyTouch_Torizo                                                 ;AA881C;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA881E;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_4:
    dw $0001,$FFF1,$FFD4,$0008,$002F                                     ;AA8820;
    dw EnemyTouch_Torizo                                                 ;AA882A;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA882C;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_5:
    dw $0001,$FFEE,$FFD5,$0003,$0018                                     ;AA882E;
    dw EnemyTouch_Torizo                                                 ;AA8838;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA883A;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_6:
    dw $0001,$FFEF,$FFD6,$0005,$000F                                     ;AA883C;
    dw EnemyTouch_Torizo                                                 ;AA8846;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA8848;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7:
    dw $0001,$FFF1,$FFD9,$0007,$0015                                     ;AA884A;
    dw EnemyTouch_Torizo                                                 ;AA8854;
    dw EnemyShot_Torizo_Normal                                           ;AA8856;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8:
    dw $0000                                                             ;AA8858;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9:
    dw $0000                                                             ;AA885A;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA885C:
    dw $0001,$FFF0,$0027,$FFFF,$0037                                     ;AA885C;
    dw EnemyTouch_Torizo                                                 ;AA8866;
    dw RTL_AAC9C1                                                        ;AA8868;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A:
    dw $0000                                                             ;AA886A;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA886C:
    dw $0001,$FFE0,$0029,$FFF3,$0040                                     ;AA886C;
    dw EnemyTouch_Torizo                                                 ;AA8876;
    dw RTL_AAC9C1                                                        ;AA8878;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B:
    dw $0000                                                             ;AA887A;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA887C:
    dw $0001,$FFD8,$001C,$FFEC,$0030                                     ;AA887C;
    dw EnemyTouch_Torizo                                                 ;AA8886;
    dw RTL_AAC9C1                                                        ;AA8888;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C:
    dw $0000                                                             ;AA888A;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA888C:
    dw $0001,$FFC8,$0009,$FFEB,$0014                                     ;AA888C;
    dw EnemyTouch_Torizo                                                 ;AA8896;
    dw RTL_AAC9C1                                                        ;AA8898;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D:
    dw $0000                                                             ;AA889A;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA889C:
    dw $0001,$FFD3,$FFF3,$FFE5,$0003                                     ;AA889C;
    dw EnemyTouch_Torizo                                                 ;AA88A6;
    dw RTL_AAC9C1                                                        ;AA88A8;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_E:
    dw $0000                                                             ;AA88AA;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88AC:
    dw $0001,$FFE3,$FFDB,$FFF0,$FFF1                                     ;AA88AC;
    dw EnemyTouch_Torizo                                                 ;AA88B6;
    dw RTL_AAC9C1                                                        ;AA88B8;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F:
    dw $0000                                                             ;AA88BA;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_10:
    dw $0000                                                             ;AA88BC;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88BE:
    dw $0001,$FFEF,$0028,$0000,$0039                                     ;AA88BE;
    dw EnemyTouch_Torizo                                                 ;AA88C8;
    dw RTL_AAC9C1                                                        ;AA88CA;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11:
    dw $0000                                                             ;AA88CC;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88CE:
    dw $0001,$FFE6,$0021,$FFF4,$0032                                     ;AA88CE;
    dw EnemyTouch_Torizo                                                 ;AA88D8;
    dw RTL_AAC9C1                                                        ;AA88DA;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12:
    dw $0000                                                             ;AA88DC;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88DE:
    dw $0001,$FFDD,$0018,$FFEA,$0025                                     ;AA88DE;
    dw EnemyTouch_Torizo                                                 ;AA88E8;
    dw RTL_AAC9C1                                                        ;AA88EA;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_13:
    dw $0000                                                             ;AA88EC;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88EE:
    dw $0001,$FFCA,$0008,$FFE9,$0012                                     ;AA88EE;
    dw EnemyTouch_Torizo                                                 ;AA88F8;
    dw RTL_AAC9C1                                                        ;AA88FA;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_14:
    dw $0000                                                             ;AA88FC;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88FE:
    dw $0001,$FFD3,$FFF3,$FFE3,$0000                                     ;AA88FE;
    dw EnemyTouch_Torizo                                                 ;AA8908;
    dw RTL_AAC9C1                                                        ;AA890A;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_15:
    dw $0000                                                             ;AA890C;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA890E:
    dw $0001,$FFE4,$FFDA,$FFEF,$FFEE                                     ;AA890E;
    dw EnemyTouch_Torizo                                                 ;AA8918;
    dw RTL_AAC9C1                                                        ;AA891A;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16:
    dw $0001,$FFEE,$FFDA,$0007,$0009                                     ;AA891C;
    dw EnemyTouch_Torizo                                                 ;AA8926;
    dw EnemyShot_Torizo_Normal                                           ;AA8928;

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17:
    dw $0001,$FFEE,$FFDB,$0007,$0012                                     ;AA892A;
    dw EnemyTouch_Torizo                                                 ;AA8934;
    dw EnemyShot_Torizo_Normal                                           ;AA8936;

UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA8938:
    dw $0001,$FFF5,$FFD6,$000A,$0007                                     ;AA8938;
    dw EnemyTouch_Torizo                                                 ;AA8942;
    dw EnemyShot_Torizo_Normal                                           ;AA8944;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_0:
    dw $0001,$FFF1,$FFE5,$000D,$001B                                     ;AA8946;
    dw EnemyTouch_Torizo                                                 ;AA8950;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA8952;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_1:
    dw $0001,$FFF3,$FFE5,$000D,$001B                                     ;AA8954;
    dw EnemyTouch_Torizo                                                 ;AA895E;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA8960;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_2:
    dw $0001,$FFF2,$FFE0,$000D,$0021                                     ;AA8962;
    dw EnemyTouch_Torizo                                                 ;AA896C;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA896E;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_3:
    dw $0001,$FFF2,$FFDD,$000B,$0027                                     ;AA8970;
    dw EnemyTouch_Torizo                                                 ;AA897A;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA897C;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_4:
    dw $0001,$FFFA,$FFD6,$000D,$002F                                     ;AA897E;
    dw EnemyTouch_Torizo                                                 ;AA8988;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA898A;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_5:
    dw $0001,$FFF9,$FFD7,$000B,$002F                                     ;AA898C;
    dw EnemyTouch_Torizo                                                 ;AA8996;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA8998;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_6:
    dw $0001,$FFF8,$FFD7,$0016,$002F                                     ;AA899A;
    dw EnemyTouch_Torizo                                                 ;AA89A4;
    dw EnemyShot_Torizo_StandUp_SitDown                                  ;AA89A6;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_7:
    dw $0001,$FFF6,$FFDA,$000D,$0017                                     ;AA89A8;
    dw EnemyTouch_Torizo                                                 ;AA89B2;
    dw EnemyShot_Torizo_Normal                                           ;AA89B4;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_8:
    dw $0000                                                             ;AA89B6;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_9:
    dw $0000                                                             ;AA89B8;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89BA:
    dw $0001,$0000,$002B,$0016,$0040                                     ;AA89BA;
    dw EnemyTouch_Torizo                                                 ;AA89C4;
    dw RTL_AAC9C1                                                        ;AA89C6;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_A:
    dw $0000                                                             ;AA89C8;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89CA:
    dw $0001,$000A,$0026,$001F,$003C                                     ;AA89CA;
    dw EnemyTouch_Torizo                                                 ;AA89D4;
    dw RTL_AAC9C1                                                        ;AA89D6;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_B:
    dw $0000                                                             ;AA89D8;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89DA:
    dw $0001,$0014,$0018,$0022,$0025                                     ;AA89DA;
    dw EnemyTouch_Torizo                                                 ;AA89E4;
    dw RTL_AAC9C1                                                        ;AA89E6;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_C:
    dw $0000                                                             ;AA89E8;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89EA:
    dw $0001,$0015,$0008,$003B,$0014                                     ;AA89EA;
    dw EnemyTouch_Torizo                                                 ;AA89F4;
    dw RTL_AAC9C1                                                        ;AA89F6;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_D:
    dw $0000                                                             ;AA89F8;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89FA:
    dw $0001,$0017,$FFF9,$002D,$0004                                     ;AA89FA;
    dw EnemyTouch_Torizo                                                 ;AA8A04;
    dw RTL_AAC9C1                                                        ;AA8A06;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_E:
    dw $0000                                                             ;AA8A08;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A0A:
    dw $0001,$000F,$FFDB,$001C,$FFED                                     ;AA8A0A;
    dw EnemyTouch_Torizo                                                 ;AA8A14;
    dw RTL_AAC9C1                                                        ;AA8A16;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_F:
    dw $0000                                                             ;AA8A18;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_10:
    dw $0000                                                             ;AA8A1A;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A1C:
    dw $0001,$FFFF,$0027,$000F,$003B                                     ;AA8A1C;
    dw EnemyTouch_Torizo                                                 ;AA8A26;
    dw RTL_AAC9C1                                                        ;AA8A28;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_11:
    dw $0000                                                             ;AA8A2A;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A2C:
    dw $0001,$0009,$0023,$001A,$0034                                     ;AA8A2C;
    dw EnemyTouch_Torizo                                                 ;AA8A36;
    dw RTL_AAC9C1                                                        ;AA8A38;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_12:
    dw $0000                                                             ;AA8A3A;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A3C:
    dw $0001,$0016,$0018,$0023,$0024                                     ;AA8A3C;
    dw EnemyTouch_Torizo                                                 ;AA8A46;
    dw RTL_AAC9C1                                                        ;AA8A48;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_13:
    dw $0000                                                             ;AA8A4A;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A4C:
    dw $0001,$0016,$0007,$0034,$0012                                     ;AA8A4C;
    dw EnemyTouch_Torizo                                                 ;AA8A56;
    dw RTL_AAC9C1                                                        ;AA8A58;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_14:
    dw $0000                                                             ;AA8A5A;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A5C:
    dw $0001,$0018,$FFF6,$002C,$0005                                     ;AA8A5C;
    dw EnemyTouch_Torizo                                                 ;AA8A66;
    dw RTL_AAC9C1                                                        ;AA8A68;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_15:
    dw $0000                                                             ;AA8A6A;

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A6C:
    dw $0001,$000F,$FFDA,$001C,$FFF1                                     ;AA8A6C;
    dw EnemyTouch_Torizo                                                 ;AA8A76;
    dw RTL_AAC9C1                                                        ;AA8A78;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_16:
    dw $0001,$FFF8,$FFDB,$000F,$000E                                     ;AA8A7A;
    dw EnemyTouch_Torizo                                                 ;AA8A84;
    dw EnemyShot_Torizo_Normal                                           ;AA8A86;

Hitboxes_Torizo_StandUp_SitDown_FacingRight_17:
    dw $0001,$FFF7,$FFD8,$0010,$0019                                     ;AA8A88;
    dw EnemyTouch_Torizo                                                 ;AA8A92;
    dw EnemyShot_Torizo_Normal                                           ;AA8A94;

Spritemaps_Torizo_0:
    dw $0004,$000C                                                       ;AA8A96;
    db $F4                                                               ;AA8A9A;
    dw $23CB,$0004                                                       ;AA8A9B;
    db $F4                                                               ;AA8A9F;
    dw $23CA,$81F4                                                       ;AA8AA0;
    db $F4                                                               ;AA8AA4;
    dw $23C8,$81F4                                                       ;AA8AA5;
    db $04                                                               ;AA8AA9;
    dw $23E8                                                             ;AA8AAA;

Spritemaps_Torizo_1:
    dw $0004,$01F8                                                       ;AA8AAC;
    db $04                                                               ;AA8AB0;
    dw $23DB,$01F0                                                       ;AA8AB1;
    db $04                                                               ;AA8AB5;
    dw $23DA,$8000                                                       ;AA8AB6;
    db $F4                                                               ;AA8ABA;
    dw $23C6,$81F0                                                       ;AA8ABB;
    db $F4                                                               ;AA8ABF;
    dw $23C4                                                             ;AA8AC0;

Spritemaps_Torizo_2:
    dw $0003,$81E8                                                       ;AA8AC2;
    db $FC                                                               ;AA8AC6;
    dw $23C0,$8000                                                       ;AA8AC7;
    db $F4                                                               ;AA8ACB;
    dw $23C6,$81F0                                                       ;AA8ACC;
    db $F4                                                               ;AA8AD0;
    dw $23C4                                                             ;AA8AD1;

Spritemaps_Torizo_3:
    dw $0003,$81E8                                                       ;AA8AD3;
    db $FC                                                               ;AA8AD7;
    dw $23C2,$8000                                                       ;AA8AD8;
    db $F4                                                               ;AA8ADC;
    dw $23C6,$81F0                                                       ;AA8ADD;
    db $F4                                                               ;AA8AE1;
    dw $23C4                                                             ;AA8AE2;

Spritemaps_Torizo_4:
    dw $0003,$81E8                                                       ;AA8AE4;
    db $FC                                                               ;AA8AE8;
    dw $23E0,$8000                                                       ;AA8AE9;
    db $F4                                                               ;AA8AED;
    dw $23C6,$81F0                                                       ;AA8AEE;
    db $F4                                                               ;AA8AF2;
    dw $23C4                                                             ;AA8AF3;

Spritemaps_Torizo_5:
    dw $0008,$01E0                                                       ;AA8AF5;
    db $F4                                                               ;AA8AF9;
    dw $2372,$01E8                                                       ;AA8AFA;
    db $F4                                                               ;AA8AFE;
    dw $2371,$01F0                                                       ;AA8AFF;
    db $0C                                                               ;AA8B03;
    dw $23F2,$01F0                                                       ;AA8B04;
    db $04                                                               ;AA8B08;
    dw $23F3,$01F0                                                       ;AA8B09;
    db $FC                                                               ;AA8B0D;
    dw $23E3,$01E8                                                       ;AA8B0E;
    db $FC                                                               ;AA8B12;
    dw $23E2,$8000                                                       ;AA8B13;
    db $F4                                                               ;AA8B17;
    dw $23C6,$81F0                                                       ;AA8B18;
    db $F4                                                               ;AA8B1C;
    dw $23C4                                                             ;AA8B1D;

Spritemaps_Torizo_6:
    dw $0013,$01F5                                                       ;AA8B1F;
    db $18                                                               ;AA8B23;
    dw $234C,$0003                                                       ;AA8B24;
    db $18                                                               ;AA8B28;
    dw $634C,$01FC                                                       ;AA8B29;
    db $00                                                               ;AA8B2D;
    dw $635F,$01F8                                                       ;AA8B2E;
    db $D8                                                               ;AA8B32;
    dw $239F,$01F5                                                       ;AA8B33;
    db $28                                                               ;AA8B37;
    dw $23DF,$01F5                                                       ;AA8B38;
    db $20                                                               ;AA8B3C;
    dw $23CF,$01F5                                                       ;AA8B3D;
    db $10                                                               ;AA8B41;
    dw $239E,$01F6                                                       ;AA8B42;
    db $08                                                               ;AA8B46;
    dw $23DE,$01F7                                                       ;AA8B47;
    db $00                                                               ;AA8B4B;
    dw $23CE,$81F0                                                       ;AA8B4C;
    db $F0                                                               ;AA8B50;
    dw $23E6,$81F0                                                       ;AA8B51;
    db $E0                                                               ;AA8B55;
    dw $23E4,$0000                                                       ;AA8B56;
    db $D8                                                               ;AA8B5A;
    dw $639F,$0003                                                       ;AA8B5B;
    db $28                                                               ;AA8B5F;
    dw $63DF,$0003                                                       ;AA8B60;
    db $20                                                               ;AA8B64;
    dw $63CF,$0003                                                       ;AA8B65;
    db $10                                                               ;AA8B69;
    dw $639E,$0002                                                       ;AA8B6A;
    db $08                                                               ;AA8B6E;
    dw $63DE,$0001                                                       ;AA8B6F;
    db $00                                                               ;AA8B73;
    dw $63CE,$8000                                                       ;AA8B74;
    db $F0                                                               ;AA8B78;
    dw $63E6,$8000                                                       ;AA8B79;
    db $E0                                                               ;AA8B7D;
    dw $63E4                                                             ;AA8B7E;

Spritemaps_Torizo_7:
    dw $001B,$0000                                                       ;AA8B80;
    db $F8                                                               ;AA8B84;
    dw $63DC,$0000                                                       ;AA8B85;
    db $F0                                                               ;AA8B89;
    dw $63CC,$01F8                                                       ;AA8B8A;
    db $F8                                                               ;AA8B8E;
    dw $23DC,$01F8                                                       ;AA8B8F;
    db $F0                                                               ;AA8B93;
    dw $23CC,$0003                                                       ;AA8B94;
    db $18                                                               ;AA8B98;
    dw $634C,$01F5                                                       ;AA8B99;
    db $18                                                               ;AA8B9D;
    dw $234C,$01F0                                                       ;AA8B9E;
    db $E8                                                               ;AA8BA2;
    dw $23F4,$01F0                                                       ;AA8BA3;
    db $E0                                                               ;AA8BA7;
    dw $23E4,$0000                                                       ;AA8BA8;
    db $E8                                                               ;AA8BAC;
    dw $63DD,$0000                                                       ;AA8BAD;
    db $E0                                                               ;AA8BB1;
    dw $63CD,$01F8                                                       ;AA8BB2;
    db $E8                                                               ;AA8BB6;
    dw $23DD,$01F8                                                       ;AA8BB7;
    db $E0                                                               ;AA8BBB;
    dw $23CD,$0008                                                       ;AA8BBC;
    db $E8                                                               ;AA8BC0;
    dw $63F4,$0008                                                       ;AA8BC1;
    db $E0                                                               ;AA8BC5;
    dw $63E4,$01FC                                                       ;AA8BC6;
    db $00                                                               ;AA8BCA;
    dw $635F,$01F5                                                       ;AA8BCB;
    db $28                                                               ;AA8BCF;
    dw $23DF,$01F5                                                       ;AA8BD0;
    db $20                                                               ;AA8BD4;
    dw $23CF,$01F5                                                       ;AA8BD5;
    db $10                                                               ;AA8BD9;
    dw $239E,$01F6                                                       ;AA8BDA;
    db $08                                                               ;AA8BDE;
    dw $23DE,$01F7                                                       ;AA8BDF;
    db $00                                                               ;AA8BE3;
    dw $23CE,$81F0                                                       ;AA8BE4;
    db $F0                                                               ;AA8BE8;
    dw $23E6,$0003                                                       ;AA8BE9;
    db $28                                                               ;AA8BED;
    dw $63DF,$0003                                                       ;AA8BEE;
    db $20                                                               ;AA8BF2;
    dw $63CF,$0003                                                       ;AA8BF3;
    db $10                                                               ;AA8BF7;
    dw $639E,$0002                                                       ;AA8BF8;
    db $08                                                               ;AA8BFC;
    dw $63DE,$0001                                                       ;AA8BFD;
    db $00                                                               ;AA8C01;
    dw $63CE,$8000                                                       ;AA8C02;
    db $F0                                                               ;AA8C06;
    dw $63E6                                                             ;AA8C07;

Spritemaps_Torizo_8:
    dw $0001,$01FC                                                       ;AA8C09;
    db $FC                                                               ;AA8C0D;
    dw $6B70                                                             ;AA8C0E;

Spritemaps_Torizo_9:
    dw $0001,$01FC                                                       ;AA8C10;
    db $FC                                                               ;AA8C14;
    dw $6B63                                                             ;AA8C15;

Spritemaps_Torizo_A:
    dw $0001,$01FC                                                       ;AA8C17;
    db $FC                                                               ;AA8C1B;
    dw $6B67                                                             ;AA8C1C;

Spritemaps_Torizo_B:
    dw $0001,$01FC                                                       ;AA8C1E;
    db $FC                                                               ;AA8C22;
    dw $6B6A                                                             ;AA8C23;

UNUSED_Spritemaps_Torizo_AA8C25:
    dw $0001,$81F8                                                       ;AA8C25;
    db $F8                                                               ;AA8C29;
    dw $6B2E                                                             ;AA8C2A;

UNUSED_Spritemaps_Torizo_AA8C2C:
    dw $0001,$81F8                                                       ;AA8C2C;
    db $F8                                                               ;AA8C30;
    dw $2304                                                             ;AA8C31;

Spritemaps_Torizo_C:
    dw $001A,$01E9                                                       ;AA8C33;
    db $FA                                                               ;AA8C37;
    dw $23FB,$01E1                                                       ;AA8C38;
    db $FA                                                               ;AA8C3C;
    dw $23FA,$81FC                                                       ;AA8C3D;
    db $EE                                                               ;AA8C41;
    dw $2328,$81F8                                                       ;AA8C42;
    db $FB                                                               ;AA8C46;
    dw $6308,$01F2                                                       ;AA8C47;
    db $15                                                               ;AA8C4B;
    dw $2362,$01EA                                                       ;AA8C4C;
    db $15                                                               ;AA8C50;
    dw $2361,$01E2                                                       ;AA8C51;
    db $15                                                               ;AA8C55;
    dw $2360,$81E7                                                       ;AA8C56;
    db $F7                                                               ;AA8C5A;
    dw $E358,$81EF                                                       ;AA8C5B;
    db $FF                                                               ;AA8C5F;
    dw $E347,$01F9                                                       ;AA8C60;
    db $12                                                               ;AA8C64;
    dw $2394,$01F1                                                       ;AA8C65;
    db $12                                                               ;AA8C69;
    dw $2393,$81F1                                                       ;AA8C6A;
    db $02                                                               ;AA8C6E;
    dw $2373,$0005                                                       ;AA8C6F;
    db $16                                                               ;AA8C73;
    dw $23EF,$000D                                                       ;AA8C74;
    db $16                                                               ;AA8C78;
    dw $23FC,$000D                                                       ;AA8C79;
    db $0E                                                               ;AA8C7D;
    dw $23FF,$81FD                                                       ;AA8C7E;
    db $06                                                               ;AA8C82;
    dw $23ED,$0007                                                       ;AA8C83;
    db $E3                                                               ;AA8C87;
    dw $23CB,$01FF                                                       ;AA8C88;
    db $E3                                                               ;AA8C8C;
    dw $23CA,$81EF                                                       ;AA8C8D;
    db $E3                                                               ;AA8C91;
    dw $23C8,$81EF                                                       ;AA8C92;
    db $F3                                                               ;AA8C96;
    dw $23E8,$8008                                                       ;AA8C97;
    db $06                                                               ;AA8C9B;
    dw $2342,$81F8                                                       ;AA8C9C;
    db $06                                                               ;AA8CA0;
    dw $2340,$8008                                                       ;AA8CA1;
    db $F6                                                               ;AA8CA5;
    dw $2322,$81F8                                                       ;AA8CA6;
    db $F6                                                               ;AA8CAA;
    dw $2320,$8008                                                       ;AA8CAB;
    db $E6                                                               ;AA8CAF;
    dw $2302,$81F8                                                       ;AA8CB0;
    db $E6                                                               ;AA8CB4;
    dw $2300                                                             ;AA8CB5;

Spritemaps_Torizo_D:
    dw $001A,$81FD                                                       ;AA8CB7;
    db $F9                                                               ;AA8CBB;
    dw $2306,$81FD                                                       ;AA8CBC;
    db $EC                                                               ;AA8CC0;
    dw $2326,$01E3                                                       ;AA8CC1;
    db $03                                                               ;AA8CC5;
    dw $638F,$01EB                                                       ;AA8CC6;
    db $03                                                               ;AA8CCA;
    dw $638E,$01EF                                                       ;AA8CCB;
    db $04                                                               ;AA8CCF;
    dw $634F,$01F7                                                       ;AA8CD0;
    db $04                                                               ;AA8CD4;
    dw $634E,$01FF                                                       ;AA8CD5;
    db $04                                                               ;AA8CD9;
    dw $634D,$01FB                                                       ;AA8CDA;
    db $10                                                               ;AA8CDE;
    dw $2396,$01F3                                                       ;AA8CDF;
    db $10                                                               ;AA8CE3;
    dw $2395,$81F3                                                       ;AA8CE4;
    db $00                                                               ;AA8CE8;
    dw $2375,$0002                                                       ;AA8CE9;
    db $01                                                               ;AA8CED;
    dw $A3AE,$01FA                                                       ;AA8CEE;
    db $01                                                               ;AA8CF2;
    dw $A3AD,$81FA                                                       ;AA8CF3;
    db $09                                                               ;AA8CF7;
    dw $A3A6,$01FB                                                       ;AA8CF8;
    db $15                                                               ;AA8CFC;
    dw $2362,$01F3                                                       ;AA8CFD;
    db $15                                                               ;AA8D01;
    dw $2361,$01EB                                                       ;AA8D02;
    db $15                                                               ;AA8D06;
    dw $2360,$0006                                                       ;AA8D07;
    db $E4                                                               ;AA8D0B;
    dw $23CB,$01FE                                                       ;AA8D0C;
    db $E4                                                               ;AA8D10;
    dw $23CA,$81EE                                                       ;AA8D11;
    db $E4                                                               ;AA8D15;
    dw $23C8,$81EE                                                       ;AA8D16;
    db $F4                                                               ;AA8D1A;
    dw $23E8,$8007                                                       ;AA8D1B;
    db $07                                                               ;AA8D1F;
    dw $2342,$81F7                                                       ;AA8D20;
    db $07                                                               ;AA8D24;
    dw $2340,$8007                                                       ;AA8D25;
    db $F7                                                               ;AA8D29;
    dw $2322,$81F7                                                       ;AA8D2A;
    db $F7                                                               ;AA8D2E;
    dw $2320,$8007                                                       ;AA8D2F;
    db $E7                                                               ;AA8D33;
    dw $2302,$81F7                                                       ;AA8D34;
    db $E7                                                               ;AA8D38;
    dw $2300                                                             ;AA8D39;

Spritemaps_Torizo_E:
    dw $001B,$81E7                                                       ;AA8D3B;
    db $0D                                                               ;AA8D3F;
    dw $636C,$81FA                                                       ;AA8D40;
    db $F4                                                               ;AA8D44;
    dw $2306,$81FA                                                       ;AA8D45;
    db $E7                                                               ;AA8D49;
    dw $2326,$81EE                                                       ;AA8D4A;
    db $07                                                               ;AA8D4E;
    dw $6358,$81F5                                                       ;AA8D4F;
    db $FF                                                               ;AA8D53;
    dw $6347,$01FB                                                       ;AA8D54;
    db $16                                                               ;AA8D58;
    dw $2398,$01F3                                                       ;AA8D59;
    db $16                                                               ;AA8D5D;
    dw $2397,$81F3                                                       ;AA8D5E;
    db $06                                                               ;AA8D62;
    dw $2377,$0001                                                       ;AA8D63;
    db $1B                                                               ;AA8D67;
    dw $2362,$01F9                                                       ;AA8D68;
    db $1B                                                               ;AA8D6C;
    dw $2361,$01F1                                                       ;AA8D6D;
    db $1B                                                               ;AA8D71;
    dw $2360,$0007                                                       ;AA8D72;
    db $0B                                                               ;AA8D76;
    dw $A3EC,$01FF                                                       ;AA8D77;
    db $0B                                                               ;AA8D7B;
    dw $A3EB,$01F7                                                       ;AA8D7C;
    db $0B                                                               ;AA8D80;
    dw $A3EA,$0007                                                       ;AA8D81;
    db $03                                                               ;AA8D85;
    dw $23EC,$01FF                                                       ;AA8D86;
    db $03                                                               ;AA8D8A;
    dw $23EB,$01F7                                                       ;AA8D8B;
    db $03                                                               ;AA8D8F;
    dw $23EA,$0006                                                       ;AA8D90;
    db $DE                                                               ;AA8D94;
    dw $23CB,$01FE                                                       ;AA8D95;
    db $DE                                                               ;AA8D99;
    dw $23CA,$81EE                                                       ;AA8D9A;
    db $DE                                                               ;AA8D9E;
    dw $23C8,$81EE                                                       ;AA8D9F;
    db $EE                                                               ;AA8DA3;
    dw $23E8,$8007                                                       ;AA8DA4;
    db $01                                                               ;AA8DA8;
    dw $2342,$81F7                                                       ;AA8DA9;
    db $01                                                               ;AA8DAD;
    dw $2340,$8007                                                       ;AA8DAE;
    db $F1                                                               ;AA8DB2;
    dw $2322,$81F7                                                       ;AA8DB3;
    db $F1                                                               ;AA8DB7;
    dw $2320,$8007                                                       ;AA8DB8;
    db $E1                                                               ;AA8DBC;
    dw $2302,$81F7                                                       ;AA8DBD;
    db $E1                                                               ;AA8DC1;
    dw $2300                                                             ;AA8DC2;

Spritemaps_Torizo_E_miscount:
    dw $0019,$81FB                                                       ;AA8DC4;
    db $F1                                                               ;AA8DC8;
    dw $2306,$81FB                                                       ;AA8DC9;
    db $E4                                                               ;AA8DCD;
    dw $2326,$81E6                                                       ;AA8DCE;
    db $0A                                                               ;AA8DD2;
    dw $636C,$81ED                                                       ;AA8DD3;
    db $05                                                               ;AA8DD7;
    dw $6358,$81F4                                                       ;AA8DD8;
    db $FD                                                               ;AA8DDC;
    dw $6347,$8002                                                       ;AA8DDD;
    db $FB                                                               ;AA8DE1;
    dw $23A9,$0002                                                       ;AA8DE2;
    db $0B                                                               ;AA8DE6;
    dw $23BB,$01FA                                                       ;AA8DE7;
    db $0B                                                               ;AA8DEB;
    dw $23AF,$81FA                                                       ;AA8DEC;
    db $FB                                                               ;AA8DF0;
    dw $23A8,$0006                                                       ;AA8DF1;
    db $D9                                                               ;AA8DF5;
    dw $23CB,$01FE                                                       ;AA8DF6;
    db $D9                                                               ;AA8DFA;
    dw $23CA,$81EE                                                       ;AA8DFB;
    db $D9                                                               ;AA8DFF;
    dw $23C8,$81EE                                                       ;AA8E00;
    db $E9                                                               ;AA8E04;
    dw $23E8,$8007                                                       ;AA8E05;
    db $FC                                                               ;AA8E09;
    dw $2342,$81F7                                                       ;AA8E0A;
    db $FC                                                               ;AA8E0E;
    dw $2340,$8007                                                       ;AA8E0F;
    db $EC                                                               ;AA8E13;
    dw $2322,$81F7                                                       ;AA8E14;
    db $EC                                                               ;AA8E18;
    dw $2320,$8007                                                       ;AA8E19;
    db $DC                                                               ;AA8E1D;
    dw $2302,$81F7                                                       ;AA8E1E;
    db $DC                                                               ;AA8E22;
    dw $2300,$0001                                                       ;AA8E23;
    db $1B                                                               ;AA8E27;
    dw $2398,$01F9                                                       ;AA8E28;
    db $1B                                                               ;AA8E2C;
    dw $2397,$81F9                                                       ;AA8E2D;
    db $0B                                                               ;AA8E31;
    dw $2377,$0008                                                       ;AA8E32;
    db $21                                                               ;AA8E36;
    dw $2362,$0000                                                       ;AA8E37;
    db $21                                                               ;AA8E3B;
    dw $2361,$01F8                                                       ;AA8E3C;
    db $21                                                               ;AA8E40;
    dw $2360                                                             ;AA8E41;

Spritemaps_Torizo_F:
    dw $0019,$01FD                                                       ;AA8E43;
    db $D3                                                               ;AA8E47;
    dw $23CB,$01F5                                                       ;AA8E48;
    db $D3                                                               ;AA8E4C;
    dw $23CA,$81E5                                                       ;AA8E4D;
    db $E3                                                               ;AA8E51;
    dw $23E8,$81E5                                                       ;AA8E52;
    db $D3                                                               ;AA8E56;
    dw $23C8,$0001                                                       ;AA8E57;
    db $0F                                                               ;AA8E5B;
    dw $23AC,$01F9                                                       ;AA8E5C;
    db $0F                                                               ;AA8E60;
    dw $23AB,$81F9                                                       ;AA8E61;
    db $FF                                                               ;AA8E65;
    dw $23A4,$0003                                                       ;AA8E66;
    db $28                                                               ;AA8E6A;
    dw $2362,$01FB                                                       ;AA8E6B;
    db $28                                                               ;AA8E6F;
    dw $2361,$01F3                                                       ;AA8E70;
    db $28                                                               ;AA8E74;
    dw $2360,$0002                                                       ;AA8E75;
    db $21                                                               ;AA8E79;
    dw $2396,$01FA                                                       ;AA8E7A;
    db $21                                                               ;AA8E7E;
    dw $2395,$81FA                                                       ;AA8E7F;
    db $11                                                               ;AA8E83;
    dw $2375,$01FB                                                       ;AA8E84;
    db $0E                                                               ;AA8E88;
    dw $25AE,$01F3                                                       ;AA8E89;
    db $0E                                                               ;AA8E8D;
    dw $25AD,$81F3                                                       ;AA8E8E;
    db $FE                                                               ;AA8E92;
    dw $25A6,$81FD                                                       ;AA8E93;
    db $15                                                               ;AA8E97;
    dw $258A,$81F5                                                       ;AA8E98;
    db $0D                                                               ;AA8E9C;
    dw $2579,$81FF                                                       ;AA8E9D;
    db $1F                                                               ;AA8EA1;
    dw $25A2,$81FE                                                       ;AA8EA2;
    db $F7                                                               ;AA8EA6;
    dw $2342,$81EE                                                       ;AA8EA7;
    db $F7                                                               ;AA8EAB;
    dw $2340,$81FE                                                       ;AA8EAC;
    db $E7                                                               ;AA8EB0;
    dw $2322,$81EE                                                       ;AA8EB1;
    db $E7                                                               ;AA8EB5;
    dw $2320,$81FE                                                       ;AA8EB6;
    db $D7                                                               ;AA8EBA;
    dw $2302,$81EE                                                       ;AA8EBB;
    db $D7                                                               ;AA8EBF;
    dw $2300                                                             ;AA8EC0;

Spritemaps_Torizo_10:
    dw $001A,$01FD                                                       ;AA8EC2;
    db $D4                                                               ;AA8EC6;
    dw $23CB,$01F5                                                       ;AA8EC7;
    db $D4                                                               ;AA8ECB;
    dw $23CA,$81E5                                                       ;AA8ECC;
    db $E4                                                               ;AA8ED0;
    dw $23E8,$81E5                                                       ;AA8ED1;
    db $D4                                                               ;AA8ED5;
    dw $23C8,$01FC                                                       ;AA8ED6;
    db $0E                                                               ;AA8EDA;
    dw $63AE,$0004                                                       ;AA8EDB;
    db $0E                                                               ;AA8EDF;
    dw $63AD,$81FC                                                       ;AA8EE0;
    db $FE                                                               ;AA8EE4;
    dw $63A6,$0013                                                       ;AA8EE5;
    db $28                                                               ;AA8EE9;
    dw $2362,$000B                                                       ;AA8EEA;
    db $28                                                               ;AA8EEE;
    dw $2361,$0003                                                       ;AA8EEF;
    db $28                                                               ;AA8EF3;
    dw $2360,$000D                                                       ;AA8EF4;
    db $22                                                               ;AA8EF8;
    dw $2398,$0005                                                       ;AA8EF9;
    db $22                                                               ;AA8EFD;
    dw $2397,$8005                                                       ;AA8EFE;
    db $12                                                               ;AA8F02;
    dw $2377,$81F6                                                       ;AA8F03;
    db $FC                                                               ;AA8F07;
    dw $25A9,$01F6                                                       ;AA8F08;
    db $0C                                                               ;AA8F0C;
    dw $25BB,$01EE                                                       ;AA8F0D;
    db $0C                                                               ;AA8F11;
    dw $25AF,$81EE                                                       ;AA8F12;
    db $FC                                                               ;AA8F16;
    dw $25A8,$81F2                                                       ;AA8F17;
    db $1F                                                               ;AA8F1B;
    dw $25A2,$01EF                                                       ;AA8F1C;
    db $1F                                                               ;AA8F20;
    dw $2597,$81EF                                                       ;AA8F21;
    db $0F                                                               ;AA8F25;
    dw $2577,$81FE                                                       ;AA8F26;
    db $F8                                                               ;AA8F2A;
    dw $2342,$81EE                                                       ;AA8F2B;
    db $F8                                                               ;AA8F2F;
    dw $2340,$81FE                                                       ;AA8F30;
    db $E8                                                               ;AA8F34;
    dw $2322,$81EE                                                       ;AA8F35;
    db $E8                                                               ;AA8F39;
    dw $2320,$81FE                                                       ;AA8F3A;
    db $D8                                                               ;AA8F3E;
    dw $2302,$81EE                                                       ;AA8F3F;
    db $D8                                                               ;AA8F43;
    dw $2300                                                             ;AA8F44;

Spritemaps_Torizo_12:
    dw $001C,$01FD                                                       ;AA8F46;
    db $D5                                                               ;AA8F4A;
    dw $23CB,$01F5                                                       ;AA8F4B;
    db $D5                                                               ;AA8F4F;
    dw $23CA,$81E5                                                       ;AA8F50;
    db $E5                                                               ;AA8F54;
    dw $23E8,$81E5                                                       ;AA8F55;
    db $D5                                                               ;AA8F59;
    dw $23C8,$001A                                                       ;AA8F5A;
    db $28                                                               ;AA8F5E;
    dw $2362,$0012                                                       ;AA8F5F;
    db $28                                                               ;AA8F63;
    dw $2361,$000A                                                       ;AA8F64;
    db $28                                                               ;AA8F68;
    dw $2360,$01FD                                                       ;AA8F69;
    db $10                                                               ;AA8F6D;
    dw $63AE,$0005                                                       ;AA8F6E;
    db $10                                                               ;AA8F72;
    dw $63AD,$81FD                                                       ;AA8F73;
    db $00                                                               ;AA8F77;
    dw $63A6,$800F                                                       ;AA8F78;
    db $1C                                                               ;AA8F7C;
    dw $238A,$8007                                                       ;AA8F7D;
    db $14                                                               ;AA8F81;
    dw $2379,$01EB                                                       ;AA8F82;
    db $28                                                               ;AA8F86;
    dw $2562,$01E3                                                       ;AA8F87;
    db $28                                                               ;AA8F8B;
    dw $2561,$01DB                                                       ;AA8F8C;
    db $28                                                               ;AA8F90;
    dw $2560,$81F7                                                       ;AA8F91;
    db $FE                                                               ;AA8F95;
    dw $25A9,$01F7                                                       ;AA8F96;
    db $0E                                                               ;AA8F9A;
    dw $25BB,$01EF                                                       ;AA8F9B;
    db $0E                                                               ;AA8F9F;
    dw $25AF,$81EF                                                       ;AA8FA0;
    db $FE                                                               ;AA8FA4;
    dw $25A8,$01EF                                                       ;AA8FA5;
    db $22                                                               ;AA8FA9;
    dw $2594,$01E7                                                       ;AA8FAA;
    db $22                                                               ;AA8FAE;
    dw $2593,$81E7                                                       ;AA8FAF;
    db $12                                                               ;AA8FB3;
    dw $2573,$81FE                                                       ;AA8FB4;
    db $F9                                                               ;AA8FB8;
    dw $2342,$81EE                                                       ;AA8FB9;
    db $F9                                                               ;AA8FBD;
    dw $2340,$81FE                                                       ;AA8FBE;
    db $E9                                                               ;AA8FC2;
    dw $2322,$81EE                                                       ;AA8FC3;
    db $E9                                                               ;AA8FC7;
    dw $2320,$81FE                                                       ;AA8FC8;
    db $D9                                                               ;AA8FCC;
    dw $2302,$81EE                                                       ;AA8FCD;
    db $D9                                                               ;AA8FD1;
    dw $2300                                                             ;AA8FD2;

Spritemaps_Torizo_13:
    dw $0016,$01EB                                                       ;AA8FD4;
    db $28                                                               ;AA8FD8;
    dw $2362,$01E3                                                       ;AA8FD9;
    db $28                                                               ;AA8FDD;
    dw $2361,$01DB                                                       ;AA8FDE;
    db $28                                                               ;AA8FE2;
    dw $2360,$81F7                                                       ;AA8FE3;
    db $FE                                                               ;AA8FE7;
    dw $23A9,$01F7                                                       ;AA8FE8;
    db $0E                                                               ;AA8FEC;
    dw $23BB,$01EF                                                       ;AA8FED;
    db $0E                                                               ;AA8FF1;
    dw $23AF,$81EF                                                       ;AA8FF2;
    db $FE                                                               ;AA8FF6;
    dw $23A8,$01EF                                                       ;AA8FF7;
    db $22                                                               ;AA8FFB;
    dw $2394,$01E7                                                       ;AA8FFC;
    db $22                                                               ;AA9000;
    dw $2393,$81E7                                                       ;AA9001;
    db $12                                                               ;AA9005;
    dw $2373,$01FC                                                       ;AA9006;
    db $0D                                                               ;AA900A;
    dw $65AE,$0004                                                       ;AA900B;
    db $0D                                                               ;AA900F;
    dw $65AD,$81FC                                                       ;AA9010;
    db $FD                                                               ;AA9014;
    dw $65A6,$800D                                                       ;AA9015;
    db $16                                                               ;AA9019;
    dw $258A,$8005                                                       ;AA901A;
    db $0E                                                               ;AA901E;
    dw $2579,$8013                                                       ;AA901F;
    db $1F                                                               ;AA9023;
    dw $25A0,$81FE                                                       ;AA9024;
    db $F9                                                               ;AA9028;
    dw $2342,$81EE                                                       ;AA9029;
    db $F9                                                               ;AA902D;
    dw $2340,$81FE                                                       ;AA902E;
    db $E9                                                               ;AA9032;
    dw $2322,$81EE                                                       ;AA9033;
    db $E9                                                               ;AA9037;
    dw $2320,$81FE                                                       ;AA9038;
    db $D9                                                               ;AA903C;
    dw $2302,$81EE                                                       ;AA903D;
    db $D9                                                               ;AA9041;
    dw $2300                                                             ;AA9042;

Spritemaps_Torizo_14:
    dw $0015,$01FB                                                       ;AA9044;
    db $0F                                                               ;AA9048;
    dw $23AE,$01F3                                                       ;AA9049;
    db $0F                                                               ;AA904D;
    dw $23AD,$81F3                                                       ;AA904E;
    db $FF                                                               ;AA9052;
    dw $23A6,$01F0                                                       ;AA9053;
    db $28                                                               ;AA9057;
    dw $2362,$01E8                                                       ;AA9058;
    db $28                                                               ;AA905C;
    dw $2361,$01E0                                                       ;AA905D;
    db $28                                                               ;AA9061;
    dw $2360,$01F4                                                       ;AA9062;
    db $23                                                               ;AA9066;
    dw $2394,$01EC                                                       ;AA9067;
    db $23                                                               ;AA906B;
    dw $2393,$81EC                                                       ;AA906C;
    db $13                                                               ;AA9070;
    dw $2373,$8009                                                       ;AA9071;
    db $1E                                                               ;AA9075;
    dw $25A0,$01FF                                                       ;AA9076;
    db $10                                                               ;AA907A;
    dw $25AC,$01F7                                                       ;AA907B;
    db $10                                                               ;AA907F;
    dw $25AB,$81F7                                                       ;AA9080;
    db $00                                                               ;AA9084;
    dw $25A4,$8005                                                       ;AA9085;
    db $18                                                               ;AA9089;
    dw $258A,$81FD                                                       ;AA908A;
    db $10                                                               ;AA908E;
    dw $2579,$81FE                                                       ;AA908F;
    db $F8                                                               ;AA9093;
    dw $2342,$81EE                                                       ;AA9094;
    db $F8                                                               ;AA9098;
    dw $2340,$81FE                                                       ;AA9099;
    db $E8                                                               ;AA909D;
    dw $2322,$81EE                                                       ;AA909E;
    db $E8                                                               ;AA90A2;
    dw $2320,$81FE                                                       ;AA90A3;
    db $D8                                                               ;AA90A7;
    dw $2302,$81EE                                                       ;AA90A8;
    db $D8                                                               ;AA90AC;
    dw $2300                                                             ;AA90AD;

Spritemaps_Torizo_15:
    dw $0015,$0001                                                       ;AA90AF;
    db $0F                                                               ;AA90B3;
    dw $23AC,$01F9                                                       ;AA90B4;
    db $0F                                                               ;AA90B8;
    dw $23AB,$81F9                                                       ;AA90B9;
    db $FF                                                               ;AA90BD;
    dw $23A4,$0003                                                       ;AA90BE;
    db $28                                                               ;AA90C2;
    dw $2362,$01FB                                                       ;AA90C3;
    db $28                                                               ;AA90C7;
    dw $2361,$01F3                                                       ;AA90C8;
    db $28                                                               ;AA90CC;
    dw $2360,$0002                                                       ;AA90CD;
    db $21                                                               ;AA90D1;
    dw $2396,$01FA                                                       ;AA90D2;
    db $21                                                               ;AA90D6;
    dw $2395,$81FA                                                       ;AA90D7;
    db $11                                                               ;AA90DB;
    dw $2375,$01FB                                                       ;AA90DC;
    db $0E                                                               ;AA90E0;
    dw $25AE,$01F3                                                       ;AA90E1;
    db $0E                                                               ;AA90E5;
    dw $25AD,$81F3                                                       ;AA90E6;
    db $FE                                                               ;AA90EA;
    dw $25A6,$81FD                                                       ;AA90EB;
    db $15                                                               ;AA90EF;
    dw $258A,$81F5                                                       ;AA90F0;
    db $0D                                                               ;AA90F4;
    dw $2579,$81FF                                                       ;AA90F5;
    db $1F                                                               ;AA90F9;
    dw $25A2,$81FE                                                       ;AA90FA;
    db $F7                                                               ;AA90FE;
    dw $2342,$81EE                                                       ;AA90FF;
    db $F7                                                               ;AA9103;
    dw $2340,$81FE                                                       ;AA9104;
    db $E7                                                               ;AA9108;
    dw $2322,$81EE                                                       ;AA9109;
    db $E7                                                               ;AA910D;
    dw $2320,$81FE                                                       ;AA910E;
    db $D7                                                               ;AA9112;
    dw $2302,$81EE                                                       ;AA9113;
    db $D7                                                               ;AA9117;
    dw $2300                                                             ;AA9118;

Spritemaps_Torizo_16:
    dw $0016,$01FC                                                       ;AA911A;
    db $0E                                                               ;AA911E;
    dw $63AE,$0004                                                       ;AA911F;
    db $0E                                                               ;AA9123;
    dw $63AD,$81FC                                                       ;AA9124;
    db $FE                                                               ;AA9128;
    dw $63A6,$0013                                                       ;AA9129;
    db $28                                                               ;AA912D;
    dw $2362,$000B                                                       ;AA912E;
    db $28                                                               ;AA9132;
    dw $2361,$0003                                                       ;AA9133;
    db $28                                                               ;AA9137;
    dw $2360,$000D                                                       ;AA9138;
    db $22                                                               ;AA913C;
    dw $2398,$0005                                                       ;AA913D;
    db $22                                                               ;AA9141;
    dw $2397,$8005                                                       ;AA9142;
    db $12                                                               ;AA9146;
    dw $2377,$81F6                                                       ;AA9147;
    db $FC                                                               ;AA914B;
    dw $25A9,$01F6                                                       ;AA914C;
    db $0C                                                               ;AA9150;
    dw $25BB,$01EE                                                       ;AA9151;
    db $0C                                                               ;AA9155;
    dw $25AF,$81EE                                                       ;AA9156;
    db $FC                                                               ;AA915A;
    dw $25A8,$81F2                                                       ;AA915B;
    db $1F                                                               ;AA915F;
    dw $25A2,$01EF                                                       ;AA9160;
    db $1F                                                               ;AA9164;
    dw $2597,$81EF                                                       ;AA9165;
    db $0F                                                               ;AA9169;
    dw $2577,$81FE                                                       ;AA916A;
    db $F8                                                               ;AA916E;
    dw $2342,$81EE                                                       ;AA916F;
    db $F8                                                               ;AA9173;
    dw $2340,$81FE                                                       ;AA9174;
    db $E8                                                               ;AA9178;
    dw $2322,$81EE                                                       ;AA9179;
    db $E8                                                               ;AA917D;
    dw $2320,$81FE                                                       ;AA917E;
    db $D8                                                               ;AA9182;
    dw $2302,$81EE                                                       ;AA9183;
    db $D8                                                               ;AA9187;
    dw $2300                                                             ;AA9188;

Spritemaps_Torizo_17:
    dw $0016,$01FC                                                       ;AA918A;
    db $0E                                                               ;AA918E;
    dw $63AE,$0004                                                       ;AA918F;
    db $0E                                                               ;AA9193;
    dw $63AD,$81FC                                                       ;AA9194;
    db $FE                                                               ;AA9198;
    dw $63A6,$800D                                                       ;AA9199;
    db $17                                                               ;AA919D;
    dw $238A,$8005                                                       ;AA919E;
    db $0F                                                               ;AA91A2;
    dw $2379,$8013                                                       ;AA91A3;
    db $20                                                               ;AA91A7;
    dw $23A0,$01EB                                                       ;AA91A8;
    db $28                                                               ;AA91AC;
    dw $2562,$01E3                                                       ;AA91AD;
    db $28                                                               ;AA91B1;
    dw $2561,$01DB                                                       ;AA91B2;
    db $28                                                               ;AA91B6;
    dw $2560,$81F7                                                       ;AA91B7;
    db $FE                                                               ;AA91BB;
    dw $25A9,$01F7                                                       ;AA91BC;
    db $0E                                                               ;AA91C0;
    dw $25BB,$01EF                                                       ;AA91C1;
    db $0E                                                               ;AA91C5;
    dw $25AF,$81EF                                                       ;AA91C6;
    db $FE                                                               ;AA91CA;
    dw $25A8,$01EF                                                       ;AA91CB;
    db $22                                                               ;AA91CF;
    dw $2594,$01E7                                                       ;AA91D0;
    db $22                                                               ;AA91D4;
    dw $2593,$81E7                                                       ;AA91D5;
    db $12                                                               ;AA91D9;
    dw $2573,$81FE                                                       ;AA91DA;
    db $F9                                                               ;AA91DE;
    dw $2342,$81EE                                                       ;AA91DF;
    db $F9                                                               ;AA91E3;
    dw $2340,$81FE                                                       ;AA91E4;
    db $E9                                                               ;AA91E8;
    dw $2322,$81EE                                                       ;AA91E9;
    db $E9                                                               ;AA91ED;
    dw $2320,$81FE                                                       ;AA91EE;
    db $D9                                                               ;AA91F2;
    dw $2302,$81EE                                                       ;AA91F3;
    db $D9                                                               ;AA91F7;
    dw $2300                                                             ;AA91F8;

Spritemaps_Torizo_18:
    dw $0015,$800A                                                       ;AA91FA;
    db $1D                                                               ;AA91FE;
    dw $23A0,$0000                                                       ;AA91FF;
    db $0F                                                               ;AA9203;
    dw $23AC,$01F8                                                       ;AA9204;
    db $0F                                                               ;AA9208;
    dw $23AB,$81F8                                                       ;AA9209;
    db $FF                                                               ;AA920D;
    dw $23A4,$8006                                                       ;AA920E;
    db $17                                                               ;AA9212;
    dw $238A,$81FE                                                       ;AA9213;
    db $0F                                                               ;AA9217;
    dw $2379,$01FD                                                       ;AA9218;
    db $0F                                                               ;AA921C;
    dw $25AE,$01F5                                                       ;AA921D;
    db $0F                                                               ;AA9221;
    dw $25AD,$81F5                                                       ;AA9222;
    db $FF                                                               ;AA9226;
    dw $25A6,$01F2                                                       ;AA9227;
    db $28                                                               ;AA922B;
    dw $2562,$01EA                                                       ;AA922C;
    db $28                                                               ;AA9230;
    dw $2561,$01E2                                                       ;AA9231;
    db $28                                                               ;AA9235;
    dw $2560,$01F6                                                       ;AA9236;
    db $23                                                               ;AA923A;
    dw $2594,$01EE                                                       ;AA923B;
    db $23                                                               ;AA923F;
    dw $2593,$81EE                                                       ;AA9240;
    db $13                                                               ;AA9244;
    dw $2573,$81FE                                                       ;AA9245;
    db $F8                                                               ;AA9249;
    dw $2342,$81EE                                                       ;AA924A;
    db $F8                                                               ;AA924E;
    dw $2340,$81FE                                                       ;AA924F;
    db $E8                                                               ;AA9253;
    dw $2322,$81EE                                                       ;AA9254;
    db $E8                                                               ;AA9258;
    dw $2320,$81FE                                                       ;AA9259;
    db $D8                                                               ;AA925D;
    dw $2302,$81EE                                                       ;AA925E;
    db $D8                                                               ;AA9262;
    dw $2300                                                             ;AA9263;

Spritemaps_Torizo_19:
    dw $0015,$01FB                                                       ;AA9265;
    db $0E                                                               ;AA9269;
    dw $23AE,$01F3                                                       ;AA926A;
    db $0E                                                               ;AA926E;
    dw $23AD,$81F3                                                       ;AA926F;
    db $FE                                                               ;AA9273;
    dw $23A6,$81FD                                                       ;AA9274;
    db $15                                                               ;AA9278;
    dw $238A,$81F5                                                       ;AA9279;
    db $0D                                                               ;AA927D;
    dw $2379,$81FF                                                       ;AA927E;
    db $1F                                                               ;AA9282;
    dw $23A2,$0001                                                       ;AA9283;
    db $0F                                                               ;AA9287;
    dw $25AC,$01F9                                                       ;AA9288;
    db $0F                                                               ;AA928C;
    dw $25AB,$81F9                                                       ;AA928D;
    db $FF                                                               ;AA9291;
    dw $25A4,$0003                                                       ;AA9292;
    db $28                                                               ;AA9296;
    dw $2562,$01FB                                                       ;AA9297;
    db $28                                                               ;AA929B;
    dw $2561,$01F3                                                       ;AA929C;
    db $28                                                               ;AA92A0;
    dw $2560,$0002                                                       ;AA92A1;
    db $21                                                               ;AA92A5;
    dw $2596,$01FA                                                       ;AA92A6;
    db $21                                                               ;AA92AA;
    dw $2595,$81FA                                                       ;AA92AB;
    db $11                                                               ;AA92AF;
    dw $2575,$81FE                                                       ;AA92B0;
    db $F7                                                               ;AA92B4;
    dw $2342,$81EE                                                       ;AA92B5;
    db $F7                                                               ;AA92B9;
    dw $2340,$81FE                                                       ;AA92BA;
    db $E7                                                               ;AA92BE;
    dw $2322,$81EE                                                       ;AA92BF;
    db $E7                                                               ;AA92C3;
    dw $2320,$81FE                                                       ;AA92C4;
    db $D7                                                               ;AA92C8;
    dw $2302,$81EE                                                       ;AA92C9;
    db $D7                                                               ;AA92CD;
    dw $2300                                                             ;AA92CE;

Spritemaps_Torizo_1A:
    dw $0016,$81F7                                                       ;AA92D0;
    db $FC                                                               ;AA92D4;
    dw $23A9,$01F7                                                       ;AA92D5;
    db $0C                                                               ;AA92D9;
    dw $23BB,$01EF                                                       ;AA92DA;
    db $0C                                                               ;AA92DE;
    dw $23AF,$81EF                                                       ;AA92DF;
    db $FC                                                               ;AA92E3;
    dw $23A8,$81F3                                                       ;AA92E4;
    db $1F                                                               ;AA92E8;
    dw $23A2,$01F0                                                       ;AA92E9;
    db $1F                                                               ;AA92ED;
    dw $2397,$81F0                                                       ;AA92EE;
    db $0F                                                               ;AA92F2;
    dw $2377,$01FE                                                       ;AA92F3;
    db $0E                                                               ;AA92F7;
    dw $65AE,$0006                                                       ;AA92F8;
    db $0E                                                               ;AA92FC;
    dw $65AD,$81FE                                                       ;AA92FD;
    db $FE                                                               ;AA9301;
    dw $65A6,$0015                                                       ;AA9302;
    db $28                                                               ;AA9306;
    dw $2562,$000D                                                       ;AA9307;
    db $28                                                               ;AA930B;
    dw $2561,$0005                                                       ;AA930C;
    db $28                                                               ;AA9310;
    dw $2560,$000F                                                       ;AA9311;
    db $22                                                               ;AA9315;
    dw $2598,$0007                                                       ;AA9316;
    db $22                                                               ;AA931A;
    dw $2597,$8007                                                       ;AA931B;
    db $12                                                               ;AA931F;
    dw $2577,$81FE                                                       ;AA9320;
    db $F8                                                               ;AA9324;
    dw $2342,$81EE                                                       ;AA9325;
    db $F8                                                               ;AA9329;
    dw $2340,$81FE                                                       ;AA932A;
    db $E8                                                               ;AA932E;
    dw $2322,$81EE                                                       ;AA932F;
    db $E8                                                               ;AA9333;
    dw $2320,$81FE                                                       ;AA9334;
    db $D8                                                               ;AA9338;
    dw $2302,$81EE                                                       ;AA9339;
    db $D8                                                               ;AA933D;
    dw $2300                                                             ;AA933E;

Spritemaps_Torizo_1B:
    dw $0007,$0010                                                       ;AA9340;
    db $25                                                               ;AA9344;
    dw $637B,$0010                                                       ;AA9345;
    db $1D                                                               ;AA9349;
    dw $636B,$8005                                                       ;AA934A;
    db $FB                                                               ;AA934E;
    dw $230C,$0010                                                       ;AA934F;
    db $16                                                               ;AA9353;
    dw $2364,$0010                                                       ;AA9354;
    db $0E                                                               ;AA9358;
    dw $2354,$0010                                                       ;AA9359;
    db $06                                                               ;AA935D;
    dw $2344,$81F8                                                       ;AA935E;
    db $F8                                                               ;AA9362;
    dw $632A                                                             ;AA9363;

Spritemaps_Torizo_1C:
    dw $0005,$81FA                                                       ;AA9365;
    db $23                                                               ;AA9369;
    dw $236C,$8001                                                       ;AA936A;
    db $02                                                               ;AA936E;
    dw $230A,$0002                                                       ;AA936F;
    db $1F                                                               ;AA9373;
    dw $6366,$8002                                                       ;AA9374;
    db $0F                                                               ;AA9378;
    dw $6345,$81F8                                                       ;AA9379;
    db $F8                                                               ;AA937D;
    dw $2324                                                             ;AA937E;

Spritemaps_Torizo_1D:
    dw $0005,$81F0                                                       ;AA9380;
    db $28                                                               ;AA9384;
    dw $236C,$01F9                                                       ;AA9385;
    db $24                                                               ;AA9389;
    dw $6366,$81F9                                                       ;AA938A;
    db $14                                                               ;AA938E;
    dw $6345,$81FC                                                       ;AA938F;
    db $05                                                               ;AA9393;
    dw $2308,$81F8                                                       ;AA9394;
    db $F8                                                               ;AA9398;
    dw $6328                                                             ;AA9399;

Spritemaps_Torizo_1E:
    dw $0005,$81E7                                                       ;AA939B;
    db $24                                                               ;AA939F;
    dw $236C,$81F8                                                       ;AA93A0;
    db $06                                                               ;AA93A4;
    dw $2306,$81EC                                                       ;AA93A5;
    db $1B                                                               ;AA93A9;
    dw $6358,$81F4                                                       ;AA93AA;
    db $13                                                               ;AA93AE;
    dw $6347,$81F8                                                       ;AA93AF;
    db $F8                                                               ;AA93B3;
    dw $2326                                                             ;AA93B4;

Spritemaps_Torizo_1F:
    dw $0005,$81DE                                                       ;AA93B6;
    db $19                                                               ;AA93BA;
    dw $236C,$81F4                                                       ;AA93BB;
    db $05                                                               ;AA93BF;
    dw $6308,$01E4                                                       ;AA93C0;
    db $16                                                               ;AA93C4;
    dw $635C,$81EC                                                       ;AA93C5;
    db $0E                                                               ;AA93C9;
    dw $634A,$81F8                                                       ;AA93CA;
    db $F8                                                               ;AA93CE;
    dw $2328                                                             ;AA93CF;

Spritemaps_Torizo_20:
    dw $0007,$81EF                                                       ;AA93D1;
    db $02                                                               ;AA93D5;
    dw $630A,$01CE                                                       ;AA93D6;
    db $0B                                                               ;AA93DA;
    dw $638F,$01D6                                                       ;AA93DB;
    db $0B                                                               ;AA93DF;
    dw $638E,$01DA                                                       ;AA93E0;
    db $0B                                                               ;AA93E4;
    dw $634F,$01E2                                                       ;AA93E5;
    db $0B                                                               ;AA93E9;
    dw $634E,$01EA                                                       ;AA93EA;
    db $0B                                                               ;AA93EE;
    dw $634D,$81F8                                                       ;AA93EF;
    db $F8                                                               ;AA93F3;
    dw $6324                                                             ;AA93F4;

Spritemaps_Torizo_21:
    dw $0005,$81D4                                                       ;AA93F6;
    db $F6                                                               ;AA93FA;
    dw $E36E,$81EF                                                       ;AA93FB;
    db $02                                                               ;AA93FF;
    dw $630A,$81DB                                                       ;AA9400;
    db $FA                                                               ;AA9404;
    dw $E358,$81E3                                                       ;AA9405;
    db $02                                                               ;AA9409;
    dw $E347,$81F8                                                       ;AA940A;
    db $F8                                                               ;AA940E;
    dw $6324                                                             ;AA940F;

Spritemaps_Torizo_22:
    dw $0007,$01E6                                                       ;AA9411;
    db $DD                                                               ;AA9415;
    dw $A37B,$01E6                                                       ;AA9416;
    db $E5                                                               ;AA941A;
    dw $A36B,$81EA                                                       ;AA941B;
    db $F8                                                               ;AA941F;
    dw $630E,$01E6                                                       ;AA9420;
    db $EB                                                               ;AA9424;
    dw $E364,$01E6                                                       ;AA9425;
    db $F3                                                               ;AA9429;
    dw $E354,$01E6                                                       ;AA942A;
    db $FB                                                               ;AA942E;
    dw $E344,$81F8                                                       ;AA942F;
    db $F8                                                               ;AA9433;
    dw $232A                                                             ;AA9434;

Spritemaps_Torizo_23:
    dw $0007,$000F                                                       ;AA9436;
    db $25                                                               ;AA943A;
    dw $657B,$000F                                                       ;AA943B;
    db $1D                                                               ;AA943F;
    dw $656B,$8005                                                       ;AA9440;
    db $FB                                                               ;AA9444;
    dw $250C,$0010                                                       ;AA9445;
    db $16                                                               ;AA9449;
    dw $2564,$0010                                                       ;AA944A;
    db $0E                                                               ;AA944E;
    dw $2554,$0010                                                       ;AA944F;
    db $06                                                               ;AA9453;
    dw $2544,$81F8                                                       ;AA9454;
    db $F8                                                               ;AA9458;
    dw $652A                                                             ;AA9459;

Spritemaps_Torizo_24:
    dw $0005,$81FA                                                       ;AA945B;
    db $23                                                               ;AA945F;
    dw $256C,$8001                                                       ;AA9460;
    db $02                                                               ;AA9464;
    dw $250A,$0002                                                       ;AA9465;
    db $1F                                                               ;AA9469;
    dw $6566,$8002                                                       ;AA946A;
    db $0F                                                               ;AA946E;
    dw $6545,$81F8                                                       ;AA946F;
    db $F8                                                               ;AA9473;
    dw $2524                                                             ;AA9474;

Spritemaps_Torizo_25:
    dw $0005,$81F0                                                       ;AA9476;
    db $28                                                               ;AA947A;
    dw $256C,$01F9                                                       ;AA947B;
    db $24                                                               ;AA947F;
    dw $6566,$81F9                                                       ;AA9480;
    db $14                                                               ;AA9484;
    dw $6545,$81FC                                                       ;AA9485;
    db $05                                                               ;AA9489;
    dw $2508,$81F8                                                       ;AA948A;
    db $F8                                                               ;AA948E;
    dw $6528                                                             ;AA948F;

Spritemaps_Torizo_26:
    dw $0005,$81E6                                                       ;AA9491;
    db $23                                                               ;AA9495;
    dw $256C,$81F8                                                       ;AA9496;
    db $06                                                               ;AA949A;
    dw $2506,$81EC                                                       ;AA949B;
    db $1B                                                               ;AA949F;
    dw $6558,$81F4                                                       ;AA94A0;
    db $13                                                               ;AA94A4;
    dw $6547,$81F8                                                       ;AA94A5;
    db $F8                                                               ;AA94A9;
    dw $2526                                                             ;AA94AA;

Spritemaps_Torizo_27:
    dw $0005,$81DC                                                       ;AA94AC;
    db $19                                                               ;AA94B0;
    dw $256C,$81F4                                                       ;AA94B1;
    db $05                                                               ;AA94B5;
    dw $6508,$01E4                                                       ;AA94B6;
    db $16                                                               ;AA94BA;
    dw $655C,$81EC                                                       ;AA94BB;
    db $0E                                                               ;AA94BF;
    dw $654A,$81F8                                                       ;AA94C0;
    db $F8                                                               ;AA94C4;
    dw $2528                                                             ;AA94C5;

Spritemaps_Torizo_28:
    dw $0007,$81EF                                                       ;AA94C7;
    db $02                                                               ;AA94CB;
    dw $650A,$01CB                                                       ;AA94CC;
    db $0B                                                               ;AA94D0;
    dw $658F,$01D3                                                       ;AA94D1;
    db $0B                                                               ;AA94D5;
    dw $658E,$01DA                                                       ;AA94D6;
    db $0B                                                               ;AA94DA;
    dw $654F,$01E2                                                       ;AA94DB;
    db $0B                                                               ;AA94DF;
    dw $654E,$01EA                                                       ;AA94E0;
    db $0B                                                               ;AA94E4;
    dw $654D,$81F8                                                       ;AA94E5;
    db $F8                                                               ;AA94E9;
    dw $6524                                                             ;AA94EA;

Spritemaps_Torizo_29:
    dw $0005,$81D3                                                       ;AA94EC;
    db $F4                                                               ;AA94F0;
    dw $E56E,$81EF                                                       ;AA94F1;
    db $02                                                               ;AA94F5;
    dw $650A,$81DB                                                       ;AA94F6;
    db $FA                                                               ;AA94FA;
    dw $E558,$81E3                                                       ;AA94FB;
    db $02                                                               ;AA94FF;
    dw $E547,$81F8                                                       ;AA9500;
    db $F8                                                               ;AA9504;
    dw $6524                                                             ;AA9505;

Spritemaps_Torizo_2A:
    dw $0007,$01E6                                                       ;AA9507;
    db $DD                                                               ;AA950B;
    dw $A57B,$01E6                                                       ;AA950C;
    db $E5                                                               ;AA9510;
    dw $A56B,$81EA                                                       ;AA9511;
    db $F8                                                               ;AA9515;
    dw $650E,$01E6                                                       ;AA9516;
    db $EB                                                               ;AA951A;
    dw $E564,$01E6                                                       ;AA951B;
    db $F3                                                               ;AA951F;
    dw $E554,$01E6                                                       ;AA9520;
    db $FB                                                               ;AA9524;
    dw $E544,$81F8                                                       ;AA9525;
    db $F8                                                               ;AA9529;
    dw $252A                                                             ;AA952A;

Spritemaps_Torizo_2B:
    dw $0018,$81EE                                                       ;AA952C;
    db $F3                                                               ;AA9530;
    dw $2330,$81F9                                                       ;AA9531;
    db $FD                                                               ;AA9535;
    dw $23A9,$01F9                                                       ;AA9536;
    db $0D                                                               ;AA953A;
    dw $23BB,$01F1                                                       ;AA953B;
    db $0D                                                               ;AA953F;
    dw $23AF,$81F1                                                       ;AA9540;
    db $FD                                                               ;AA9544;
    dw $23A8,$81FA                                                       ;AA9545;
    db $15                                                               ;AA9549;
    dw $238A,$81F2                                                       ;AA954A;
    db $0D                                                               ;AA954E;
    dw $2379,$0005                                                       ;AA954F;
    db $20                                                               ;AA9553;
    dw $2362,$01FD                                                       ;AA9554;
    db $20                                                               ;AA9558;
    dw $2361,$01F5                                                       ;AA9559;
    db $20                                                               ;AA955D;
    dw $2360,$81F5                                                       ;AA955E;
    db $FD                                                               ;AA9562;
    dw $25A9,$01F5                                                       ;AA9563;
    db $0D                                                               ;AA9567;
    dw $25BB,$01ED                                                       ;AA9568;
    db $0D                                                               ;AA956C;
    dw $25AF,$81ED                                                       ;AA956D;
    db $FD                                                               ;AA9571;
    dw $25A8,$81F6                                                       ;AA9572;
    db $15                                                               ;AA9576;
    dw $258A,$81EE                                                       ;AA9577;
    db $0D                                                               ;AA957B;
    dw $2579,$0001                                                       ;AA957C;
    db $20                                                               ;AA9580;
    dw $2562,$01F9                                                       ;AA9581;
    db $20                                                               ;AA9585;
    dw $2561,$01F1                                                       ;AA9586;
    db $20                                                               ;AA958A;
    dw $2560,$81EE                                                       ;AA958B;
    db $E3                                                               ;AA958F;
    dw $2310,$81FE                                                       ;AA9590;
    db $FB                                                               ;AA9594;
    dw $2342,$81FE                                                       ;AA9595;
    db $EB                                                               ;AA9599;
    dw $2322,$81FE                                                       ;AA959A;
    db $DB                                                               ;AA959E;
    dw $2302,$81EE                                                       ;AA959F;
    db $DB                                                               ;AA95A3;
    dw $2300                                                             ;AA95A4;

Spritemaps_Torizo_2C:
    dw $0013,$81EE                                                       ;AA95A6;
    db $F2                                                               ;AA95AA;
    dw $2330,$01FC                                                       ;AA95AB;
    db $0F                                                               ;AA95AF;
    dw $23AE,$01F4                                                       ;AA95B0;
    db $0F                                                               ;AA95B4;
    dw $23AD,$81F4                                                       ;AA95B5;
    db $FF                                                               ;AA95B9;
    dw $23A6,$8002                                                       ;AA95BA;
    db $22                                                               ;AA95BE;
    dw $23A0,$81FD                                                       ;AA95BF;
    db $19                                                               ;AA95C3;
    dw $238A,$81F5                                                       ;AA95C4;
    db $11                                                               ;AA95C8;
    dw $2379,$81EE                                                       ;AA95C9;
    db $FA                                                               ;AA95CD;
    dw $2340,$81EE                                                       ;AA95CE;
    db $E2                                                               ;AA95D2;
    dw $2310,$81FE                                                       ;AA95D3;
    db $FA                                                               ;AA95D7;
    dw $2342,$81FE                                                       ;AA95D8;
    db $EA                                                               ;AA95DC;
    dw $2322,$81FE                                                       ;AA95DD;
    db $DA                                                               ;AA95E1;
    dw $2302,$81EE                                                       ;AA95E2;
    db $DA                                                               ;AA95E6;
    dw $2300,$01F8                                                       ;AA95E7;
    db $10                                                               ;AA95EB;
    dw $65AC,$0000                                                       ;AA95EC;
    db $10                                                               ;AA95F0;
    dw $65AB,$81F8                                                       ;AA95F1;
    db $00                                                               ;AA95F5;
    dw $65A4,$8009                                                       ;AA95F6;
    db $24                                                               ;AA95FA;
    dw $25A0,$8004                                                       ;AA95FB;
    db $1B                                                               ;AA95FF;
    dw $258A,$81FC                                                       ;AA9600;
    db $13                                                               ;AA9604;
    dw $2579                                                             ;AA9605;

Spritemaps_Torizo_2D:
    dw $0015,$81EE                                                       ;AA9607;
    db $F2                                                               ;AA960B;
    dw $2330,$8003                                                       ;AA960C;
    db $27                                                               ;AA9610;
    dw $23A2,$8006                                                       ;AA9611;
    db $27                                                               ;AA9615;
    dw $23A2,$01F8                                                       ;AA9616;
    db $10                                                               ;AA961A;
    dw $23AB,$0000                                                       ;AA961B;
    db $10                                                               ;AA961F;
    dw $23AC,$81F8                                                       ;AA9620;
    db $00                                                               ;AA9624;
    dw $23A4,$81FD                                                       ;AA9625;
    db $13                                                               ;AA9629;
    dw $2377,$0005                                                       ;AA962A;
    db $23                                                               ;AA962E;
    dw $2398,$01FD                                                       ;AA962F;
    db $23                                                               ;AA9633;
    dw $2397,$01FB                                                       ;AA9634;
    db $10                                                               ;AA9638;
    dw $25AB,$0003                                                       ;AA9639;
    db $10                                                               ;AA963D;
    dw $25AC,$81FB                                                       ;AA963E;
    db $00                                                               ;AA9642;
    dw $25A4,$8000                                                       ;AA9643;
    db $13                                                               ;AA9647;
    dw $2577,$0008                                                       ;AA9648;
    db $23                                                               ;AA964C;
    dw $2598,$0000                                                       ;AA964D;
    db $23                                                               ;AA9651;
    dw $2597,$81EE                                                       ;AA9652;
    db $FA                                                               ;AA9656;
    dw $2340,$81EE                                                       ;AA9657;
    db $E2                                                               ;AA965B;
    dw $2310,$81FE                                                       ;AA965C;
    db $FA                                                               ;AA9660;
    dw $2342,$81FE                                                       ;AA9661;
    db $EA                                                               ;AA9665;
    dw $2322,$81FE                                                       ;AA9666;
    db $DA                                                               ;AA966A;
    dw $2302,$81EE                                                       ;AA966B;
    db $DA                                                               ;AA966F;
    dw $2300                                                             ;AA9670;

Spritemaps_Torizo_2E:
    dw $0018,$001A                                                       ;AA9672;
    db $28                                                               ;AA9676;
    dw $2562,$0012                                                       ;AA9677;
    db $28                                                               ;AA967B;
    dw $2561,$000A                                                       ;AA967C;
    db $28                                                               ;AA9680;
    dw $2560,$01EB                                                       ;AA9681;
    db $28                                                               ;AA9685;
    dw $2362,$01E3                                                       ;AA9686;
    db $28                                                               ;AA968A;
    dw $2361,$01DB                                                       ;AA968B;
    db $28                                                               ;AA968F;
    dw $2360,$81F7                                                       ;AA9690;
    db $FE                                                               ;AA9694;
    dw $23A9,$01F7                                                       ;AA9695;
    db $0E                                                               ;AA9699;
    dw $23BB,$01EF                                                       ;AA969A;
    db $0E                                                               ;AA969E;
    dw $23AF,$81EF                                                       ;AA969F;
    db $FE                                                               ;AA96A3;
    dw $23A8,$01EF                                                       ;AA96A4;
    db $22                                                               ;AA96A8;
    dw $2394,$01E7                                                       ;AA96A9;
    db $22                                                               ;AA96AD;
    dw $2393,$81E7                                                       ;AA96AE;
    db $12                                                               ;AA96B2;
    dw $2373,$01FD                                                       ;AA96B3;
    db $10                                                               ;AA96B7;
    dw $65AE,$0005                                                       ;AA96B8;
    db $10                                                               ;AA96BC;
    dw $65AD,$81FD                                                       ;AA96BD;
    db $00                                                               ;AA96C1;
    dw $65A6,$800F                                                       ;AA96C2;
    db $1C                                                               ;AA96C6;
    dw $258A,$8007                                                       ;AA96C7;
    db $14                                                               ;AA96CB;
    dw $2579,$81FE                                                       ;AA96CC;
    db $F9                                                               ;AA96D0;
    dw $2342,$81EE                                                       ;AA96D1;
    db $F9                                                               ;AA96D5;
    dw $2340,$81FE                                                       ;AA96D6;
    db $E9                                                               ;AA96DA;
    dw $2322,$81EE                                                       ;AA96DB;
    db $E9                                                               ;AA96DF;
    dw $2320,$81FE                                                       ;AA96E0;
    db $D9                                                               ;AA96E4;
    dw $2302,$81EE                                                       ;AA96E5;
    db $D9                                                               ;AA96E9;
    dw $2300                                                             ;AA96EA;

Spritemaps_Torizo_2F:
    dw $0018,$001A                                                       ;AA96EC;
    db $28                                                               ;AA96F0;
    dw $2362,$0012                                                       ;AA96F1;
    db $28                                                               ;AA96F5;
    dw $2361,$000A                                                       ;AA96F6;
    db $28                                                               ;AA96FA;
    dw $2360,$01FD                                                       ;AA96FB;
    db $10                                                               ;AA96FF;
    dw $63AE,$0005                                                       ;AA9700;
    db $10                                                               ;AA9704;
    dw $63AD,$81FD                                                       ;AA9705;
    db $00                                                               ;AA9709;
    dw $63A6,$800F                                                       ;AA970A;
    db $1C                                                               ;AA970E;
    dw $238A,$8007                                                       ;AA970F;
    db $14                                                               ;AA9713;
    dw $2379,$01EB                                                       ;AA9714;
    db $28                                                               ;AA9718;
    dw $2562,$01E3                                                       ;AA9719;
    db $28                                                               ;AA971D;
    dw $2561,$01DB                                                       ;AA971E;
    db $28                                                               ;AA9722;
    dw $2560,$81F7                                                       ;AA9723;
    db $FE                                                               ;AA9727;
    dw $25A9,$01F7                                                       ;AA9728;
    db $0E                                                               ;AA972C;
    dw $25BB,$01EF                                                       ;AA972D;
    db $0E                                                               ;AA9731;
    dw $25AF,$81EF                                                       ;AA9732;
    db $FE                                                               ;AA9736;
    dw $25A8,$01EF                                                       ;AA9737;
    db $22                                                               ;AA973B;
    dw $2594,$01E7                                                       ;AA973C;
    db $22                                                               ;AA9740;
    dw $2593,$81E7                                                       ;AA9741;
    db $12                                                               ;AA9745;
    dw $2573,$81FE                                                       ;AA9746;
    db $F9                                                               ;AA974A;
    dw $2342,$81EE                                                       ;AA974B;
    db $F9                                                               ;AA974F;
    dw $2340,$81FE                                                       ;AA9750;
    db $E9                                                               ;AA9754;
    dw $2322,$81EE                                                       ;AA9755;
    db $E9                                                               ;AA9759;
    dw $2320,$81FE                                                       ;AA975A;
    db $D9                                                               ;AA975E;
    dw $2302,$81EE                                                       ;AA975F;
    db $D9                                                               ;AA9763;
    dw $2300                                                             ;AA9764;

UNUSED_Spritemaps_Torizo_AA9766:
    dw $0006,$8000                                                       ;AA9766;
    db $0C                                                               ;AA976A;
    dw $2342,$81F0                                                       ;AA976B;
    db $0C                                                               ;AA976F;
    dw $2340,$8000                                                       ;AA9770;
    db $FC                                                               ;AA9774;
    dw $2322,$81F0                                                       ;AA9775;
    db $FC                                                               ;AA9779;
    dw $2320,$8000                                                       ;AA977A;
    db $EC                                                               ;AA977E;
    dw $2302,$81F0                                                       ;AA977F;
    db $EC                                                               ;AA9783;
    dw $2300                                                             ;AA9784;

Spritemaps_Torizo_30:
    dw $0004,$01EC                                                       ;AA9786;
    db $F4                                                               ;AA978A;
    dw $63CB,$01F4                                                       ;AA978B;
    db $F4                                                               ;AA978F;
    dw $63CA,$81FC                                                       ;AA9790;
    db $F4                                                               ;AA9794;
    dw $63C8,$81FC                                                       ;AA9795;
    db $04                                                               ;AA9799;
    dw $63E8                                                             ;AA979A;

Spritemaps_Torizo_31:
    dw $0004,$0000                                                       ;AA979C;
    db $04                                                               ;AA97A0;
    dw $63DB,$0008                                                       ;AA97A1;
    db $04                                                               ;AA97A5;
    dw $63DA,$81F0                                                       ;AA97A6;
    db $F4                                                               ;AA97AA;
    dw $63C6,$8000                                                       ;AA97AB;
    db $F4                                                               ;AA97AF;
    dw $63C4                                                             ;AA97B0;

Spritemaps_Torizo_32:
    dw $0003,$8008                                                       ;AA97B2;
    db $FC                                                               ;AA97B6;
    dw $63C0,$81F0                                                       ;AA97B7;
    db $F4                                                               ;AA97BB;
    dw $63C6,$8000                                                       ;AA97BC;
    db $F4                                                               ;AA97C0;
    dw $63C4                                                             ;AA97C1;

Spritemaps_Torizo_33:
    dw $0003,$8008                                                       ;AA97C3;
    db $FC                                                               ;AA97C7;
    dw $63C2,$81F0                                                       ;AA97C8;
    db $F4                                                               ;AA97CC;
    dw $63C6,$8000                                                       ;AA97CD;
    db $F4                                                               ;AA97D1;
    dw $63C4                                                             ;AA97D2;

Spritemaps_Torizo_34:
    dw $0003,$8008                                                       ;AA97D4;
    db $FC                                                               ;AA97D8;
    dw $63E0,$81F0                                                       ;AA97D9;
    db $F4                                                               ;AA97DD;
    dw $63C6,$8000                                                       ;AA97DE;
    db $F4                                                               ;AA97E2;
    dw $63C4                                                             ;AA97E3;

Spritemaps_Torizo_35:
    dw $0008,$0018                                                       ;AA97E5;
    db $F4                                                               ;AA97E9;
    dw $6372,$0010                                                       ;AA97EA;
    db $F4                                                               ;AA97EE;
    dw $6371,$0008                                                       ;AA97EF;
    db $0C                                                               ;AA97F3;
    dw $63F2,$0008                                                       ;AA97F4;
    db $04                                                               ;AA97F8;
    dw $63F3,$0008                                                       ;AA97F9;
    db $FC                                                               ;AA97FD;
    dw $63E3,$0010                                                       ;AA97FE;
    db $FC                                                               ;AA9802;
    dw $63E2,$81F0                                                       ;AA9803;
    db $F4                                                               ;AA9807;
    dw $63C6,$8000                                                       ;AA9808;
    db $F4                                                               ;AA980C;
    dw $63C4                                                             ;AA980D;

UNUSED_Spritemaps_Torizo_AA980F:
    dw $0013,$01F5                                                       ;AA980F;
    db $10                                                               ;AA9813;
    dw $234C,$0003                                                       ;AA9814;
    db $10                                                               ;AA9818;
    dw $634C,$01FC                                                       ;AA9819;
    db $F8                                                               ;AA981D;
    dw $635F,$01F8                                                       ;AA981E;
    db $D0                                                               ;AA9822;
    dw $239F,$01F5                                                       ;AA9823;
    db $20                                                               ;AA9827;
    dw $23DF,$01F5                                                       ;AA9828;
    db $18                                                               ;AA982C;
    dw $23CF,$01F5                                                       ;AA982D;
    db $08                                                               ;AA9831;
    dw $239E,$01F6                                                       ;AA9832;
    db $00                                                               ;AA9836;
    dw $23DE,$01F7                                                       ;AA9837;
    db $F8                                                               ;AA983B;
    dw $23CE,$81F0                                                       ;AA983C;
    db $E8                                                               ;AA9840;
    dw $23E6,$81F0                                                       ;AA9841;
    db $D8                                                               ;AA9845;
    dw $23E4,$0000                                                       ;AA9846;
    db $D0                                                               ;AA984A;
    dw $639F,$0003                                                       ;AA984B;
    db $20                                                               ;AA984F;
    dw $63DF,$0003                                                       ;AA9850;
    db $18                                                               ;AA9854;
    dw $63CF,$0003                                                       ;AA9855;
    db $08                                                               ;AA9859;
    dw $639E,$0002                                                       ;AA985A;
    db $00                                                               ;AA985E;
    dw $63DE,$0001                                                       ;AA985F;
    db $F8                                                               ;AA9863;
    dw $63CE,$8000                                                       ;AA9864;
    db $E8                                                               ;AA9868;
    dw $63E6,$8000                                                       ;AA9869;
    db $D8                                                               ;AA986D;
    dw $63E4                                                             ;AA986E;

UNUSED_Spritemaps_Torizo_AA9870:
    dw $001B,$0000                                                       ;AA9870;
    db $F0                                                               ;AA9874;
    dw $63DC,$0000                                                       ;AA9875;
    db $E8                                                               ;AA9879;
    dw $63CC,$01F8                                                       ;AA987A;
    db $F0                                                               ;AA987E;
    dw $23DC,$01F8                                                       ;AA987F;
    db $E8                                                               ;AA9883;
    dw $23CC,$0003                                                       ;AA9884;
    db $10                                                               ;AA9888;
    dw $634C,$01F5                                                       ;AA9889;
    db $10                                                               ;AA988D;
    dw $234C,$01F0                                                       ;AA988E;
    db $E0                                                               ;AA9892;
    dw $23F4,$01F0                                                       ;AA9893;
    db $D8                                                               ;AA9897;
    dw $23E4,$0000                                                       ;AA9898;
    db $E0                                                               ;AA989C;
    dw $63DD,$0000                                                       ;AA989D;
    db $D8                                                               ;AA98A1;
    dw $63CD,$01F8                                                       ;AA98A2;
    db $E0                                                               ;AA98A6;
    dw $23DD,$01F8                                                       ;AA98A7;
    db $D8                                                               ;AA98AB;
    dw $23CD,$0008                                                       ;AA98AC;
    db $E0                                                               ;AA98B0;
    dw $63F4,$0008                                                       ;AA98B1;
    db $D8                                                               ;AA98B5;
    dw $63E4,$01FC                                                       ;AA98B6;
    db $F8                                                               ;AA98BA;
    dw $635F,$01F5                                                       ;AA98BB;
    db $20                                                               ;AA98BF;
    dw $23DF,$01F5                                                       ;AA98C0;
    db $18                                                               ;AA98C4;
    dw $23CF,$01F5                                                       ;AA98C5;
    db $08                                                               ;AA98C9;
    dw $239E,$01F6                                                       ;AA98CA;
    db $00                                                               ;AA98CE;
    dw $23DE,$01F7                                                       ;AA98CF;
    db $F8                                                               ;AA98D3;
    dw $23CE,$81F0                                                       ;AA98D4;
    db $E8                                                               ;AA98D8;
    dw $23E6,$0003                                                       ;AA98D9;
    db $20                                                               ;AA98DD;
    dw $63DF,$0003                                                       ;AA98DE;
    db $18                                                               ;AA98E2;
    dw $63CF,$0003                                                       ;AA98E3;
    db $08                                                               ;AA98E7;
    dw $639E,$0002                                                       ;AA98E8;
    db $00                                                               ;AA98EC;
    dw $63DE,$0001                                                       ;AA98ED;
    db $F8                                                               ;AA98F1;
    dw $63CE,$8000                                                       ;AA98F2;
    db $E8                                                               ;AA98F6;
    dw $63E6                                                             ;AA98F7;

UNUSED_Spritemaps_Torizo_AA98F9:
    dw $0001,$01FC                                                       ;AA98F9;
    db $FC                                                               ;AA98FD;
    dw $6B70                                                             ;AA98FE;

UNUSED_Spritemaps_Torizo_AA9900:
    dw $0001,$01FC                                                       ;AA9900;
    db $FC                                                               ;AA9904;
    dw $6B63                                                             ;AA9905;

UNUSED_Spritemaps_Torizo_AA9907:
    dw $0001,$01FC                                                       ;AA9907;
    db $FC                                                               ;AA990B;
    dw $6B67                                                             ;AA990C;

UNUSED_Spritemaps_Torizo_AA990E:
    dw $0001,$01FC                                                       ;AA990E;
    db $FC                                                               ;AA9912;
    dw $6B6A                                                             ;AA9913;

UNUSED_Spritemaps_Torizo_AA9915:
    dw $0001,$81F8                                                       ;AA9915;
    db $F8                                                               ;AA9919;
    dw $672C                                                             ;AA991A;

UNUSED_Spritemaps_Torizo_AA991C:
    dw $0001,$81F8                                                       ;AA991C;
    db $F8                                                               ;AA9920;
    dw $6B2E                                                             ;AA9921;

UNUSED_Spritemaps_Torizo_AA9923:
    dw $0001,$81F8                                                       ;AA9923;
    db $F8                                                               ;AA9927;
    dw $6304                                                             ;AA9928;

UNUSED_Spritemaps_Torizo_AA992A:
    dw $0006,$01F8                                                       ;AA992A;
    db $08                                                               ;AA992E;
    dw $EB52,$0000                                                       ;AA992F;
    db $08                                                               ;AA9933;
    dw $AB52,$01F8                                                       ;AA9934;
    db $F8                                                               ;AA9938;
    dw $2B92,$01F8                                                       ;AA9939;
    db $F0                                                               ;AA993D;
    dw $2B82,$0000                                                       ;AA993E;
    db $F8                                                               ;AA9942;
    dw $6B92,$0000                                                       ;AA9943;
    db $F0                                                               ;AA9947;
    dw $6B82                                                             ;AA9948;

Spritemaps_Torizo_36:
    dw $001A,$000F                                                       ;AA994A;
    db $FA                                                               ;AA994E;
    dw $63FB,$0017                                                       ;AA994F;
    db $FA                                                               ;AA9953;
    dw $63FA,$0017                                                       ;AA9954;
    db $FA                                                               ;AA9958;
    dw $63FA,$81F4                                                       ;AA9959;
    db $EE                                                               ;AA995D;
    dw $6328,$81F8                                                       ;AA995E;
    db $FB                                                               ;AA9962;
    dw $2308,$0006                                                       ;AA9963;
    db $15                                                               ;AA9967;
    dw $6362,$000E                                                       ;AA9968;
    db $15                                                               ;AA996C;
    dw $6361,$0016                                                       ;AA996D;
    db $15                                                               ;AA9971;
    dw $6360,$8009                                                       ;AA9972;
    db $F7                                                               ;AA9976;
    dw $A358,$8001                                                       ;AA9977;
    db $FF                                                               ;AA997B;
    dw $A347,$01FF                                                       ;AA997C;
    db $12                                                               ;AA9980;
    dw $6394,$0007                                                       ;AA9981;
    db $12                                                               ;AA9985;
    dw $6393,$81FF                                                       ;AA9986;
    db $02                                                               ;AA998A;
    dw $6373,$01F3                                                       ;AA998B;
    db $16                                                               ;AA998F;
    dw $63EF,$01EB                                                       ;AA9990;
    db $16                                                               ;AA9994;
    dw $63FC,$01EB                                                       ;AA9995;
    db $0E                                                               ;AA9999;
    dw $63FF,$81F3                                                       ;AA999A;
    db $06                                                               ;AA999E;
    dw $63ED,$01F1                                                       ;AA999F;
    db $E3                                                               ;AA99A3;
    dw $63CB,$01F9                                                       ;AA99A4;
    db $E3                                                               ;AA99A8;
    dw $63CA,$8001                                                       ;AA99A9;
    db $E3                                                               ;AA99AD;
    dw $63C8,$8001                                                       ;AA99AE;
    db $F3                                                               ;AA99B2;
    dw $63E8,$81E8                                                       ;AA99B3;
    db $06                                                               ;AA99B7;
    dw $6342,$81F8                                                       ;AA99B8;
    db $06                                                               ;AA99BC;
    dw $6340,$81E8                                                       ;AA99BD;
    db $F6                                                               ;AA99C1;
    dw $6322,$81F8                                                       ;AA99C2;
    db $F6                                                               ;AA99C6;
    dw $6320,$81E8                                                       ;AA99C7;
    db $E6                                                               ;AA99CB;
    dw $6302                                                             ;AA99CC;

UNUSED_Spritemaps_Torizo_UnusedEntry_AA99CE:
    dw $81F8                                                             ;AA99CE;
    db $E6                                                               ;AA99D0;
    dw $6300                                                             ;AA99D1;

Spritemaps_Torizo_37:
    dw $001A,$81F3                                                       ;AA99D3;
    db $F9                                                               ;AA99D7;
    dw $6306,$81F3                                                       ;AA99D8;
    db $EC                                                               ;AA99DC;
    dw $6326,$0015                                                       ;AA99DD;
    db $03                                                               ;AA99E1;
    dw $238F,$000D                                                       ;AA99E2;
    db $03                                                               ;AA99E6;
    dw $238E,$0009                                                       ;AA99E7;
    db $04                                                               ;AA99EB;
    dw $234F,$0001                                                       ;AA99EC;
    db $04                                                               ;AA99F0;
    dw $234E,$01F9                                                       ;AA99F1;
    db $04                                                               ;AA99F5;
    dw $234D,$01FD                                                       ;AA99F6;
    db $10                                                               ;AA99FA;
    dw $6396,$0005                                                       ;AA99FB;
    db $10                                                               ;AA99FF;
    dw $6395,$81FD                                                       ;AA9A00;
    db $00                                                               ;AA9A04;
    dw $6375,$01F6                                                       ;AA9A05;
    db $01                                                               ;AA9A09;
    dw $E3AE,$01FE                                                       ;AA9A0A;
    db $01                                                               ;AA9A0E;
    dw $E3AD,$81F6                                                       ;AA9A0F;
    db $09                                                               ;AA9A13;
    dw $E3A6,$01FD                                                       ;AA9A14;
    db $15                                                               ;AA9A18;
    dw $6362,$0005                                                       ;AA9A19;
    db $15                                                               ;AA9A1D;
    dw $6361,$000D                                                       ;AA9A1E;
    db $15                                                               ;AA9A22;
    dw $6360,$01F2                                                       ;AA9A23;
    db $E4                                                               ;AA9A27;
    dw $63CB,$01FA                                                       ;AA9A28;
    db $E4                                                               ;AA9A2C;
    dw $63CA,$8002                                                       ;AA9A2D;
    db $E4                                                               ;AA9A31;
    dw $63C8,$8002                                                       ;AA9A32;
    db $F4                                                               ;AA9A36;
    dw $63E8,$81E9                                                       ;AA9A37;
    db $07                                                               ;AA9A3B;
    dw $6342,$81F9                                                       ;AA9A3C;
    db $07                                                               ;AA9A40;
    dw $6340,$81E9                                                       ;AA9A41;
    db $F7                                                               ;AA9A45;
    dw $6322,$81F9                                                       ;AA9A46;
    db $F7                                                               ;AA9A4A;
    dw $6320,$81E9                                                       ;AA9A4B;
    db $E7                                                               ;AA9A4F;
    dw $6302,$81F9                                                       ;AA9A50;
    db $E7                                                               ;AA9A54;
    dw $6300                                                             ;AA9A55;

Spritemaps_Torizo_38:
    dw $001B,$8009                                                       ;AA9A57;
    db $0D                                                               ;AA9A5B;
    dw $236C,$81F6                                                       ;AA9A5C;
    db $F4                                                               ;AA9A60;
    dw $6306,$81F6                                                       ;AA9A61;
    db $E7                                                               ;AA9A65;
    dw $6326,$8002                                                       ;AA9A66;
    db $07                                                               ;AA9A6A;
    dw $2358,$81FB                                                       ;AA9A6B;
    db $FF                                                               ;AA9A6F;
    dw $2347,$01FD                                                       ;AA9A70;
    db $16                                                               ;AA9A74;
    dw $6398,$0005                                                       ;AA9A75;
    db $16                                                               ;AA9A79;
    dw $6397,$81FD                                                       ;AA9A7A;
    db $06                                                               ;AA9A7E;
    dw $6377,$01F7                                                       ;AA9A7F;
    db $1B                                                               ;AA9A83;
    dw $6362,$01FF                                                       ;AA9A84;
    db $1B                                                               ;AA9A88;
    dw $6361,$0007                                                       ;AA9A89;
    db $1B                                                               ;AA9A8D;
    dw $6360,$01F1                                                       ;AA9A8E;
    db $0B                                                               ;AA9A92;
    dw $E3EC,$01F9                                                       ;AA9A93;
    db $0B                                                               ;AA9A97;
    dw $E3EB,$0001                                                       ;AA9A98;
    db $0B                                                               ;AA9A9C;
    dw $E3EA,$01F1                                                       ;AA9A9D;
    db $03                                                               ;AA9AA1;
    dw $63EC,$01F9                                                       ;AA9AA2;
    db $03                                                               ;AA9AA6;
    dw $63EB,$0001                                                       ;AA9AA7;
    db $03                                                               ;AA9AAB;
    dw $63EA,$01F2                                                       ;AA9AAC;
    db $DE                                                               ;AA9AB0;
    dw $63CB,$01FA                                                       ;AA9AB1;
    db $DE                                                               ;AA9AB5;
    dw $63CA,$8002                                                       ;AA9AB6;
    db $DE                                                               ;AA9ABA;
    dw $63C8,$8002                                                       ;AA9ABB;
    db $EE                                                               ;AA9ABF;
    dw $63E8,$81E9                                                       ;AA9AC0;
    db $01                                                               ;AA9AC4;
    dw $6342,$81F9                                                       ;AA9AC5;
    db $01                                                               ;AA9AC9;
    dw $6340,$81E9                                                       ;AA9ACA;
    db $F1                                                               ;AA9ACE;
    dw $6322,$81F9                                                       ;AA9ACF;
    db $F1                                                               ;AA9AD3;
    dw $6320,$81E9                                                       ;AA9AD4;
    db $E1                                                               ;AA9AD8;
    dw $6302,$81F9                                                       ;AA9AD9;
    db $E1                                                               ;AA9ADD;
    dw $6300                                                             ;AA9ADE;

Spritemaps_Torizo_39:
    dw $0019,$81F5                                                       ;AA9AE0;
    db $F1                                                               ;AA9AE4;
    dw $6306,$81F5                                                       ;AA9AE5;
    db $E4                                                               ;AA9AE9;
    dw $6326,$800A                                                       ;AA9AEA;
    db $0A                                                               ;AA9AEE;
    dw $236C,$8003                                                       ;AA9AEF;
    db $05                                                               ;AA9AF3;
    dw $2358,$81FC                                                       ;AA9AF4;
    db $FD                                                               ;AA9AF8;
    dw $2347,$81EE                                                       ;AA9AF9;
    db $FB                                                               ;AA9AFD;
    dw $63A9,$01F6                                                       ;AA9AFE;
    db $0B                                                               ;AA9B02;
    dw $63BB,$01FE                                                       ;AA9B03;
    db $0B                                                               ;AA9B07;
    dw $63AF,$81F6                                                       ;AA9B08;
    db $FB                                                               ;AA9B0C;
    dw $63A8,$01F2                                                       ;AA9B0D;
    db $D9                                                               ;AA9B11;
    dw $63CB,$01FA                                                       ;AA9B12;
    db $D9                                                               ;AA9B16;
    dw $63CA,$8002                                                       ;AA9B17;
    db $D9                                                               ;AA9B1B;
    dw $63C8,$8002                                                       ;AA9B1C;
    db $E9                                                               ;AA9B20;
    dw $63E8,$81E9                                                       ;AA9B21;
    db $FC                                                               ;AA9B25;
    dw $6342,$81F9                                                       ;AA9B26;
    db $FC                                                               ;AA9B2A;
    dw $6340,$81E9                                                       ;AA9B2B;
    db $EC                                                               ;AA9B2F;
    dw $6322,$81F9                                                       ;AA9B30;
    db $EC                                                               ;AA9B34;
    dw $6320,$81E9                                                       ;AA9B35;
    db $DC                                                               ;AA9B39;
    dw $6302,$81F9                                                       ;AA9B3A;
    db $DC                                                               ;AA9B3E;
    dw $6300,$01F7                                                       ;AA9B3F;
    db $1B                                                               ;AA9B43;
    dw $6398,$01FF                                                       ;AA9B44;
    db $1B                                                               ;AA9B48;
    dw $6397,$81F7                                                       ;AA9B49;
    db $0B                                                               ;AA9B4D;
    dw $6377,$01F0                                                       ;AA9B4E;
    db $21                                                               ;AA9B52;
    dw $6362,$01F8                                                       ;AA9B53;
    db $21                                                               ;AA9B57;
    dw $6361,$0000                                                       ;AA9B58;
    db $21                                                               ;AA9B5C;
    dw $6360                                                             ;AA9B5D;

Spritemaps_Torizo_3A:
    dw $0019,$01FB                                                       ;AA9B5F;
    db $D3                                                               ;AA9B63;
    dw $63CB,$0003                                                       ;AA9B64;
    db $D3                                                               ;AA9B68;
    dw $63CA,$800B                                                       ;AA9B69;
    db $E3                                                               ;AA9B6D;
    dw $63E8,$800B                                                       ;AA9B6E;
    db $D3                                                               ;AA9B72;
    dw $63C8,$01F7                                                       ;AA9B73;
    db $0F                                                               ;AA9B77;
    dw $63AC,$01FF                                                       ;AA9B78;
    db $0F                                                               ;AA9B7C;
    dw $63AB,$81F7                                                       ;AA9B7D;
    db $FF                                                               ;AA9B81;
    dw $63A4,$01F5                                                       ;AA9B82;
    db $28                                                               ;AA9B86;
    dw $6362,$01FD                                                       ;AA9B87;
    db $28                                                               ;AA9B8B;
    dw $6361,$0005                                                       ;AA9B8C;
    db $28                                                               ;AA9B90;
    dw $6360,$01F6                                                       ;AA9B91;
    db $21                                                               ;AA9B95;
    dw $6396,$01FE                                                       ;AA9B96;
    db $21                                                               ;AA9B9A;
    dw $6395,$81F6                                                       ;AA9B9B;
    db $11                                                               ;AA9B9F;
    dw $6375,$01FD                                                       ;AA9BA0;
    db $0E                                                               ;AA9BA4;
    dw $65AE,$0005                                                       ;AA9BA5;
    db $0E                                                               ;AA9BA9;
    dw $65AD,$81FD                                                       ;AA9BAA;
    db $FE                                                               ;AA9BAE;
    dw $65A6,$81F3                                                       ;AA9BAF;
    db $15                                                               ;AA9BB3;
    dw $658A,$81FB                                                       ;AA9BB4;
    db $0D                                                               ;AA9BB8;
    dw $6579,$81F1                                                       ;AA9BB9;
    db $1F                                                               ;AA9BBD;
    dw $65A2,$81F2                                                       ;AA9BBE;
    db $F7                                                               ;AA9BC2;
    dw $6342,$8002                                                       ;AA9BC3;
    db $F7                                                               ;AA9BC7;
    dw $6340,$81F2                                                       ;AA9BC8;
    db $E7                                                               ;AA9BCC;
    dw $6322,$8002                                                       ;AA9BCD;
    db $E7                                                               ;AA9BD1;
    dw $6320,$81F2                                                       ;AA9BD2;
    db $D7                                                               ;AA9BD6;
    dw $6302,$8002                                                       ;AA9BD7;
    db $D7                                                               ;AA9BDB;
    dw $6300                                                             ;AA9BDC;

Spritemaps_Torizo_3B:
    dw $001A,$01FB                                                       ;AA9BDE;
    db $D4                                                               ;AA9BE2;
    dw $63CB,$0003                                                       ;AA9BE3;
    db $D4                                                               ;AA9BE7;
    dw $63CA,$800B                                                       ;AA9BE8;
    db $E4                                                               ;AA9BEC;
    dw $63E8,$800B                                                       ;AA9BED;
    db $D4                                                               ;AA9BF1;
    dw $63C8,$01FC                                                       ;AA9BF2;
    db $0E                                                               ;AA9BF6;
    dw $23AE,$01F4                                                       ;AA9BF7;
    db $0E                                                               ;AA9BFB;
    dw $23AD,$81F4                                                       ;AA9BFC;
    db $FE                                                               ;AA9C00;
    dw $23A6,$01E5                                                       ;AA9C01;
    db $28                                                               ;AA9C05;
    dw $6362,$01ED                                                       ;AA9C06;
    db $28                                                               ;AA9C0A;
    dw $6361,$01F5                                                       ;AA9C0B;
    db $28                                                               ;AA9C0F;
    dw $6360,$01EB                                                       ;AA9C10;
    db $22                                                               ;AA9C14;
    dw $6398,$01F3                                                       ;AA9C15;
    db $22                                                               ;AA9C19;
    dw $6397,$81EB                                                       ;AA9C1A;
    db $12                                                               ;AA9C1E;
    dw $6377,$81FA                                                       ;AA9C1F;
    db $FC                                                               ;AA9C23;
    dw $65A9,$0002                                                       ;AA9C24;
    db $0C                                                               ;AA9C28;
    dw $65BB,$000A                                                       ;AA9C29;
    db $0C                                                               ;AA9C2D;
    dw $65AF,$8002                                                       ;AA9C2E;
    db $FC                                                               ;AA9C32;
    dw $65A8,$81FE                                                       ;AA9C33;
    db $1F                                                               ;AA9C37;
    dw $65A2,$0009                                                       ;AA9C38;
    db $1F                                                               ;AA9C3C;
    dw $6597,$8001                                                       ;AA9C3D;
    db $0F                                                               ;AA9C41;
    dw $6577,$81F2                                                       ;AA9C42;
    db $F8                                                               ;AA9C46;
    dw $6342,$8002                                                       ;AA9C47;
    db $F8                                                               ;AA9C4B;
    dw $6340,$81F2                                                       ;AA9C4C;
    db $E8                                                               ;AA9C50;
    dw $6322,$8002                                                       ;AA9C51;
    db $E8                                                               ;AA9C55;
    dw $6320,$81F2                                                       ;AA9C56;
    db $D8                                                               ;AA9C5A;
    dw $6302,$8002                                                       ;AA9C5B;
    db $D8                                                               ;AA9C5F;
    dw $6300                                                             ;AA9C60;

Spritemaps_Torizo_3C:
    dw $001C,$01FB                                                       ;AA9C62;
    db $D5                                                               ;AA9C66;
    dw $63CB,$0003                                                       ;AA9C67;
    db $D5                                                               ;AA9C6B;
    dw $63CA,$800B                                                       ;AA9C6C;
    db $E5                                                               ;AA9C70;
    dw $63E8,$800B                                                       ;AA9C71;
    db $D5                                                               ;AA9C75;
    dw $63C8,$01DE                                                       ;AA9C76;
    db $28                                                               ;AA9C7A;
    dw $6362,$01E6                                                       ;AA9C7B;
    db $28                                                               ;AA9C7F;
    dw $6361,$01EE                                                       ;AA9C80;
    db $28                                                               ;AA9C84;
    dw $6360,$01FB                                                       ;AA9C85;
    db $10                                                               ;AA9C89;
    dw $23AE,$01F3                                                       ;AA9C8A;
    db $10                                                               ;AA9C8E;
    dw $23AD,$81F3                                                       ;AA9C8F;
    db $00                                                               ;AA9C93;
    dw $23A6,$81E1                                                       ;AA9C94;
    db $1C                                                               ;AA9C98;
    dw $638A,$81E9                                                       ;AA9C99;
    db $14                                                               ;AA9C9D;
    dw $6379,$000D                                                       ;AA9C9E;
    db $28                                                               ;AA9CA2;
    dw $6562,$0015                                                       ;AA9CA3;
    db $28                                                               ;AA9CA7;
    dw $6561,$001D                                                       ;AA9CA8;
    db $28                                                               ;AA9CAC;
    dw $6560,$81F9                                                       ;AA9CAD;
    db $FE                                                               ;AA9CB1;
    dw $65A9,$0001                                                       ;AA9CB2;
    db $0E                                                               ;AA9CB6;
    dw $65BB,$0009                                                       ;AA9CB7;
    db $0E                                                               ;AA9CBB;
    dw $65AF,$8001                                                       ;AA9CBC;
    db $FE                                                               ;AA9CC0;
    dw $65A8,$0009                                                       ;AA9CC1;
    db $22                                                               ;AA9CC5;
    dw $6594,$0011                                                       ;AA9CC6;
    db $22                                                               ;AA9CCA;
    dw $6593,$8009                                                       ;AA9CCB;
    db $12                                                               ;AA9CCF;
    dw $6573,$81F2                                                       ;AA9CD0;
    db $F9                                                               ;AA9CD4;
    dw $6342,$8002                                                       ;AA9CD5;
    db $F9                                                               ;AA9CD9;
    dw $6340,$81F2                                                       ;AA9CDA;
    db $E9                                                               ;AA9CDE;
    dw $6322,$8002                                                       ;AA9CDF;
    db $E9                                                               ;AA9CE3;
    dw $6320,$81F2                                                       ;AA9CE4;
    db $D9                                                               ;AA9CE8;
    dw $6302,$8002                                                       ;AA9CE9;
    db $D9                                                               ;AA9CED;
    dw $6300                                                             ;AA9CEE;

UNUSED_Spritemaps_Torizo_AA9CF0:
    dw $0002,$01F8                                                       ;AA9CF0;
    db $FC                                                               ;AA9CF4;
    dw $2B80,$0000                                                       ;AA9CF5;
    db $FC                                                               ;AA9CF9;
    dw $6B80                                                             ;AA9CFA;

UNUSED_Spritemaps_Torizo_AA9CFC:
    dw $0004,$01F8                                                       ;AA9CFC;
    db $00                                                               ;AA9D00;
    dw $2B90,$01F8                                                       ;AA9D01;
    db $F8                                                               ;AA9D05;
    dw $2B80,$0000                                                       ;AA9D06;
    db $00                                                               ;AA9D0A;
    dw $6B90,$0000                                                       ;AA9D0B;
    db $F8                                                               ;AA9D0F;
    dw $6B80                                                             ;AA9D10;

UNUSED_Spritemaps_Torizo_AA9D12:
    dw $0003,$81F8                                                       ;AA9D12;
    db $F4                                                               ;AA9D16;
    dw $6B80,$01F8                                                       ;AA9D17;
    db $04                                                               ;AA9D1B;
    dw $2B99,$0000                                                       ;AA9D1C;
    db $04                                                               ;AA9D20;
    dw $6B99                                                             ;AA9D21;

UNUSED_Spritemaps_Torizo_AA9D23:
    dw $0003,$0000                                                       ;AA9D23;
    db $06                                                               ;AA9D27;
    dw $6B80,$01F8                                                       ;AA9D28;
    db $06                                                               ;AA9D2C;
    dw $2B80,$81F8                                                       ;AA9D2D;
    db $F2                                                               ;AA9D31;
    dw $2B2E                                                             ;AA9D32;

Spritemaps_Torizo_3D:
    dw $0016,$000D                                                       ;AA9D34;
    db $28                                                               ;AA9D38;
    dw $6362,$0015                                                       ;AA9D39;
    db $28                                                               ;AA9D3D;
    dw $6361,$001D                                                       ;AA9D3E;
    db $28                                                               ;AA9D42;
    dw $6360,$81F9                                                       ;AA9D43;
    db $FE                                                               ;AA9D47;
    dw $63A9,$0001                                                       ;AA9D48;
    db $0E                                                               ;AA9D4C;
    dw $63BB,$0009                                                       ;AA9D4D;
    db $0E                                                               ;AA9D51;
    dw $63AF,$8001                                                       ;AA9D52;
    db $FE                                                               ;AA9D56;
    dw $63A8,$0009                                                       ;AA9D57;
    db $22                                                               ;AA9D5B;
    dw $6394,$0011                                                       ;AA9D5C;
    db $22                                                               ;AA9D60;
    dw $6393,$8009                                                       ;AA9D61;
    db $12                                                               ;AA9D65;
    dw $6373,$01FC                                                       ;AA9D66;
    db $0D                                                               ;AA9D6A;
    dw $25AE,$01F4                                                       ;AA9D6B;
    db $0D                                                               ;AA9D6F;
    dw $25AD,$81F4                                                       ;AA9D70;
    db $FD                                                               ;AA9D74;
    dw $25A6,$81E3                                                       ;AA9D75;
    db $16                                                               ;AA9D79;
    dw $658A,$81EB                                                       ;AA9D7A;
    db $0E                                                               ;AA9D7E;
    dw $6579,$81DD                                                       ;AA9D7F;
    db $1F                                                               ;AA9D83;
    dw $65A0,$81F2                                                       ;AA9D84;
    db $F9                                                               ;AA9D88;
    dw $6342,$8002                                                       ;AA9D89;
    db $F9                                                               ;AA9D8D;
    dw $6340,$81F2                                                       ;AA9D8E;
    db $E9                                                               ;AA9D92;
    dw $6322,$8002                                                       ;AA9D93;
    db $E9                                                               ;AA9D97;
    dw $6320,$81F2                                                       ;AA9D98;
    db $D9                                                               ;AA9D9C;
    dw $6302,$8002                                                       ;AA9D9D;
    db $D9                                                               ;AA9DA1;
    dw $6300                                                             ;AA9DA2;

Spritemaps_Torizo_3E:
    dw $0015,$01FD                                                       ;AA9DA4;
    db $0F                                                               ;AA9DA8;
    dw $63AE,$0005                                                       ;AA9DA9;
    db $0F                                                               ;AA9DAD;
    dw $63AD,$81FD                                                       ;AA9DAE;
    db $FF                                                               ;AA9DB2;
    dw $63A6,$0008                                                       ;AA9DB3;
    db $28                                                               ;AA9DB7;
    dw $6362,$0010                                                       ;AA9DB8;
    db $28                                                               ;AA9DBC;
    dw $6361,$0018                                                       ;AA9DBD;
    db $28                                                               ;AA9DC1;
    dw $6360,$0004                                                       ;AA9DC2;
    db $23                                                               ;AA9DC6;
    dw $6394,$000C                                                       ;AA9DC7;
    db $23                                                               ;AA9DCB;
    dw $6393,$8004                                                       ;AA9DCC;
    db $13                                                               ;AA9DD0;
    dw $6373,$81E7                                                       ;AA9DD1;
    db $1E                                                               ;AA9DD5;
    dw $65A0,$01F9                                                       ;AA9DD6;
    db $10                                                               ;AA9DDA;
    dw $65AC,$0001                                                       ;AA9DDB;
    db $10                                                               ;AA9DDF;
    dw $65AB,$81F9                                                       ;AA9DE0;
    db $00                                                               ;AA9DE4;
    dw $65A4,$81EB                                                       ;AA9DE5;
    db $18                                                               ;AA9DE9;
    dw $658A,$81F3                                                       ;AA9DEA;
    db $10                                                               ;AA9DEE;
    dw $6579,$81F2                                                       ;AA9DEF;
    db $F8                                                               ;AA9DF3;
    dw $6342,$8002                                                       ;AA9DF4;
    db $F8                                                               ;AA9DF8;
    dw $6340,$81F2                                                       ;AA9DF9;
    db $E8                                                               ;AA9DFD;
    dw $6322,$8002                                                       ;AA9DFE;
    db $E8                                                               ;AA9E02;
    dw $6320,$81F2                                                       ;AA9E03;
    db $D8                                                               ;AA9E07;
    dw $6302,$8002                                                       ;AA9E08;
    db $D8                                                               ;AA9E0C;
    dw $6300                                                             ;AA9E0D;

Spritemaps_Torizo_3F:
    dw $0015,$01F7                                                       ;AA9E0F;
    db $0F                                                               ;AA9E13;
    dw $63AC,$01FF                                                       ;AA9E14;
    db $0F                                                               ;AA9E18;
    dw $63AB,$81F7                                                       ;AA9E19;
    db $FF                                                               ;AA9E1D;
    dw $63A4,$01F5                                                       ;AA9E1E;
    db $28                                                               ;AA9E22;
    dw $6362,$01FD                                                       ;AA9E23;
    db $28                                                               ;AA9E27;
    dw $6361,$0005                                                       ;AA9E28;
    db $28                                                               ;AA9E2C;
    dw $6360,$01F6                                                       ;AA9E2D;
    db $21                                                               ;AA9E31;
    dw $6396,$01FE                                                       ;AA9E32;
    db $21                                                               ;AA9E36;
    dw $6395,$81F6                                                       ;AA9E37;
    db $11                                                               ;AA9E3B;
    dw $6375,$01FD                                                       ;AA9E3C;
    db $0E                                                               ;AA9E40;
    dw $65AE,$0005                                                       ;AA9E41;
    db $0E                                                               ;AA9E45;
    dw $65AD,$81FD                                                       ;AA9E46;
    db $FE                                                               ;AA9E4A;
    dw $65A6,$81F3                                                       ;AA9E4B;
    db $15                                                               ;AA9E4F;
    dw $658A,$81FB                                                       ;AA9E50;
    db $0D                                                               ;AA9E54;
    dw $6579,$81F1                                                       ;AA9E55;
    db $1F                                                               ;AA9E59;
    dw $65A2,$81F2                                                       ;AA9E5A;
    db $F7                                                               ;AA9E5E;
    dw $6342,$8002                                                       ;AA9E5F;
    db $F7                                                               ;AA9E63;
    dw $6340,$81F2                                                       ;AA9E64;
    db $E7                                                               ;AA9E68;
    dw $6322,$8002                                                       ;AA9E69;
    db $E7                                                               ;AA9E6D;
    dw $6320,$81F2                                                       ;AA9E6E;
    db $D7                                                               ;AA9E72;
    dw $6302,$8002                                                       ;AA9E73;
    db $D7                                                               ;AA9E77;
    dw $6300                                                             ;AA9E78;

Spritemaps_Torizo_40:
    dw $0016,$01FC                                                       ;AA9E7A;
    db $0E                                                               ;AA9E7E;
    dw $23AE,$01F4                                                       ;AA9E7F;
    db $0E                                                               ;AA9E83;
    dw $23AD,$81F4                                                       ;AA9E84;
    db $FE                                                               ;AA9E88;
    dw $23A6,$01E5                                                       ;AA9E89;
    db $28                                                               ;AA9E8D;
    dw $6362,$01ED                                                       ;AA9E8E;
    db $28                                                               ;AA9E92;
    dw $6361,$01F5                                                       ;AA9E93;
    db $28                                                               ;AA9E97;
    dw $6360,$01EB                                                       ;AA9E98;
    db $22                                                               ;AA9E9C;
    dw $6398,$01F3                                                       ;AA9E9D;
    db $22                                                               ;AA9EA1;
    dw $6397,$81EB                                                       ;AA9EA2;
    db $12                                                               ;AA9EA6;
    dw $6377,$81FA                                                       ;AA9EA7;
    db $FC                                                               ;AA9EAB;
    dw $65A9,$0002                                                       ;AA9EAC;
    db $0C                                                               ;AA9EB0;
    dw $65BB,$000A                                                       ;AA9EB1;
    db $0C                                                               ;AA9EB5;
    dw $65AF,$8002                                                       ;AA9EB6;
    db $FC                                                               ;AA9EBA;
    dw $65A8,$81FE                                                       ;AA9EBB;
    db $1F                                                               ;AA9EBF;
    dw $65A2,$0009                                                       ;AA9EC0;
    db $1F                                                               ;AA9EC4;
    dw $6597,$8001                                                       ;AA9EC5;
    db $0F                                                               ;AA9EC9;
    dw $6577,$81F2                                                       ;AA9ECA;
    db $F8                                                               ;AA9ECE;
    dw $6342,$8002                                                       ;AA9ECF;
    db $F8                                                               ;AA9ED3;
    dw $6340,$81F2                                                       ;AA9ED4;
    db $E8                                                               ;AA9ED8;
    dw $6322,$8002                                                       ;AA9ED9;
    db $E8                                                               ;AA9EDD;
    dw $6320,$81F2                                                       ;AA9EDE;
    db $D8                                                               ;AA9EE2;
    dw $6302,$8002                                                       ;AA9EE3;
    db $D8                                                               ;AA9EE7;
    dw $6300                                                             ;AA9EE8;

Spritemaps_Torizo_41:
    dw $0016,$01FC                                                       ;AA9EEA;
    db $0E                                                               ;AA9EEE;
    dw $23AE,$01F4                                                       ;AA9EEF;
    db $0E                                                               ;AA9EF3;
    dw $23AD,$81F4                                                       ;AA9EF4;
    db $FE                                                               ;AA9EF8;
    dw $23A6,$81E3                                                       ;AA9EF9;
    db $17                                                               ;AA9EFD;
    dw $638A,$81EB                                                       ;AA9EFE;
    db $0F                                                               ;AA9F02;
    dw $6379,$81DD                                                       ;AA9F03;
    db $20                                                               ;AA9F07;
    dw $63A0,$000D                                                       ;AA9F08;
    db $28                                                               ;AA9F0C;
    dw $6562,$0015                                                       ;AA9F0D;
    db $28                                                               ;AA9F11;
    dw $6561,$001D                                                       ;AA9F12;
    db $28                                                               ;AA9F16;
    dw $6560,$81F9                                                       ;AA9F17;
    db $FE                                                               ;AA9F1B;
    dw $65A9,$0001                                                       ;AA9F1C;
    db $0E                                                               ;AA9F20;
    dw $65BB,$0009                                                       ;AA9F21;
    db $0E                                                               ;AA9F25;
    dw $65AF,$8001                                                       ;AA9F26;
    db $FE                                                               ;AA9F2A;
    dw $65A8,$0009                                                       ;AA9F2B;
    db $22                                                               ;AA9F2F;
    dw $6594,$0011                                                       ;AA9F30;
    db $22                                                               ;AA9F34;
    dw $6593,$8009                                                       ;AA9F35;
    db $12                                                               ;AA9F39;
    dw $6573,$81F2                                                       ;AA9F3A;
    db $F9                                                               ;AA9F3E;
    dw $6342,$8002                                                       ;AA9F3F;
    db $F9                                                               ;AA9F43;
    dw $6340,$81F2                                                       ;AA9F44;
    db $E9                                                               ;AA9F48;
    dw $6322,$8002                                                       ;AA9F49;
    db $E9                                                               ;AA9F4D;
    dw $6320,$81F2                                                       ;AA9F4E;
    db $D9                                                               ;AA9F52;
    dw $6302,$8002                                                       ;AA9F53;
    db $D9                                                               ;AA9F57;
    dw $6300                                                             ;AA9F58;

Spritemaps_Torizo_42:
    dw $0015,$81E6                                                       ;AA9F5A;
    db $1D                                                               ;AA9F5E;
    dw $63A0,$01F8                                                       ;AA9F5F;
    db $0F                                                               ;AA9F63;
    dw $63AC,$0000                                                       ;AA9F64;
    db $0F                                                               ;AA9F68;
    dw $63AB,$81F8                                                       ;AA9F69;
    db $FF                                                               ;AA9F6D;
    dw $63A4,$81EA                                                       ;AA9F6E;
    db $17                                                               ;AA9F72;
    dw $638A,$81F2                                                       ;AA9F73;
    db $0F                                                               ;AA9F77;
    dw $6379,$01FB                                                       ;AA9F78;
    db $0F                                                               ;AA9F7C;
    dw $65AE,$0003                                                       ;AA9F7D;
    db $0F                                                               ;AA9F81;
    dw $65AD,$81FB                                                       ;AA9F82;
    db $FF                                                               ;AA9F86;
    dw $65A6,$0006                                                       ;AA9F87;
    db $28                                                               ;AA9F8B;
    dw $6562,$000E                                                       ;AA9F8C;
    db $28                                                               ;AA9F90;
    dw $6561,$0016                                                       ;AA9F91;
    db $28                                                               ;AA9F95;
    dw $6560,$0002                                                       ;AA9F96;
    db $23                                                               ;AA9F9A;
    dw $6594,$000A                                                       ;AA9F9B;
    db $23                                                               ;AA9F9F;
    dw $6593,$8002                                                       ;AA9FA0;
    db $13                                                               ;AA9FA4;
    dw $6573,$81F2                                                       ;AA9FA5;
    db $F8                                                               ;AA9FA9;
    dw $6342,$8002                                                       ;AA9FAA;
    db $F8                                                               ;AA9FAE;
    dw $6340,$81F2                                                       ;AA9FAF;
    db $E8                                                               ;AA9FB3;
    dw $6322,$8002                                                       ;AA9FB4;
    db $E8                                                               ;AA9FB8;
    dw $6320,$81F2                                                       ;AA9FB9;
    db $D8                                                               ;AA9FBD;
    dw $6302,$8002                                                       ;AA9FBE;
    db $D8                                                               ;AA9FC2;
    dw $6300                                                             ;AA9FC3;

Spritemaps_Torizo_43:
    dw $0015,$01FD                                                       ;AA9FC5;
    db $0E                                                               ;AA9FC9;
    dw $63AE,$0005                                                       ;AA9FCA;
    db $0E                                                               ;AA9FCE;
    dw $63AD,$81FD                                                       ;AA9FCF;
    db $FE                                                               ;AA9FD3;
    dw $63A6,$81F3                                                       ;AA9FD4;
    db $15                                                               ;AA9FD8;
    dw $638A,$81FB                                                       ;AA9FD9;
    db $0D                                                               ;AA9FDD;
    dw $6379,$81F1                                                       ;AA9FDE;
    db $1F                                                               ;AA9FE2;
    dw $63A2,$01F7                                                       ;AA9FE3;
    db $0F                                                               ;AA9FE7;
    dw $65AC,$01FF                                                       ;AA9FE8;
    db $0F                                                               ;AA9FEC;
    dw $65AB,$81F7                                                       ;AA9FED;
    db $FF                                                               ;AA9FF1;
    dw $65A4,$01F5                                                       ;AA9FF2;
    db $28                                                               ;AA9FF6;
    dw $6562,$01FD                                                       ;AA9FF7;
    db $28                                                               ;AA9FFB;
    dw $6561,$0005                                                       ;AA9FFC;
    db $28                                                               ;AAA000;
    dw $6560,$01F6                                                       ;AAA001;
    db $21                                                               ;AAA005;
    dw $6596,$01FE                                                       ;AAA006;
    db $21                                                               ;AAA00A;
    dw $6595,$81F6                                                       ;AAA00B;
    db $11                                                               ;AAA00F;
    dw $6575,$81F2                                                       ;AAA010;
    db $F7                                                               ;AAA014;
    dw $6342,$8002                                                       ;AAA015;
    db $F7                                                               ;AAA019;
    dw $6340,$81F2                                                       ;AAA01A;
    db $E7                                                               ;AAA01E;
    dw $6322,$8002                                                       ;AAA01F;
    db $E7                                                               ;AAA023;
    dw $6320,$81F2                                                       ;AAA024;
    db $D7                                                               ;AAA028;
    dw $6302,$8002                                                       ;AAA029;
    db $D7                                                               ;AAA02D;
    dw $6300                                                             ;AAA02E;

Spritemaps_Torizo_44:
    dw $0016,$81F9                                                       ;AAA030;
    db $FC                                                               ;AAA034;
    dw $63A9,$0001                                                       ;AAA035;
    db $0C                                                               ;AAA039;
    dw $63BB,$0009                                                       ;AAA03A;
    db $0C                                                               ;AAA03E;
    dw $63AF,$8001                                                       ;AAA03F;
    db $FC                                                               ;AAA043;
    dw $63A8,$81FD                                                       ;AAA044;
    db $1F                                                               ;AAA048;
    dw $63A2,$0008                                                       ;AAA049;
    db $1F                                                               ;AAA04D;
    dw $6397,$8000                                                       ;AAA04E;
    db $0F                                                               ;AAA052;
    dw $6377,$01FA                                                       ;AAA053;
    db $0E                                                               ;AAA057;
    dw $25AE,$01F2                                                       ;AAA058;
    db $0E                                                               ;AAA05C;
    dw $25AD,$81F2                                                       ;AAA05D;
    db $FE                                                               ;AAA061;
    dw $25A6,$01E3                                                       ;AAA062;
    db $28                                                               ;AAA066;
    dw $6562,$01EB                                                       ;AAA067;
    db $28                                                               ;AAA06B;
    dw $6561,$01F3                                                       ;AAA06C;
    db $28                                                               ;AAA070;
    dw $6560,$01E9                                                       ;AAA071;
    db $22                                                               ;AAA075;
    dw $6598,$01F1                                                       ;AAA076;
    db $22                                                               ;AAA07A;
    dw $6597,$81E9                                                       ;AAA07B;
    db $12                                                               ;AAA07F;
    dw $6577,$81F2                                                       ;AAA080;
    db $F8                                                               ;AAA084;
    dw $6342,$8002                                                       ;AAA085;
    db $F8                                                               ;AAA089;
    dw $6340,$81F2                                                       ;AAA08A;
    db $E8                                                               ;AAA08E;
    dw $6322,$8002                                                       ;AAA08F;
    db $E8                                                               ;AAA093;
    dw $6320,$81F2                                                       ;AAA094;
    db $D8                                                               ;AAA098;
    dw $6302,$8002                                                       ;AAA099;
    db $D8                                                               ;AAA09D;
    dw $6300                                                             ;AAA09E;

Spritemaps_Torizo_45:
    dw $0007,$01E8                                                       ;AAA0A0;
    db $25                                                               ;AAA0A4;
    dw $237B,$01E8                                                       ;AAA0A5;
    db $1D                                                               ;AAA0A9;
    dw $236B,$81EB                                                       ;AAA0AA;
    db $FB                                                               ;AAA0AE;
    dw $630C,$01E8                                                       ;AAA0AF;
    db $16                                                               ;AAA0B3;
    dw $6364,$01E8                                                       ;AAA0B4;
    db $0E                                                               ;AAA0B8;
    dw $6354,$01E8                                                       ;AAA0B9;
    db $06                                                               ;AAA0BD;
    dw $6344,$81F8                                                       ;AAA0BE;
    db $F8                                                               ;AAA0C2;
    dw $232A                                                             ;AAA0C3;

Spritemaps_Torizo_46:
    dw $0005,$81F6                                                       ;AAA0C5;
    db $23                                                               ;AAA0C9;
    dw $636C,$81EF                                                       ;AAA0CA;
    db $02                                                               ;AAA0CE;
    dw $630A,$01F6                                                       ;AAA0CF;
    db $1F                                                               ;AAA0D3;
    dw $2366,$81EE                                                       ;AAA0D4;
    db $0F                                                               ;AAA0D8;
    dw $2345,$81F8                                                       ;AAA0D9;
    db $F8                                                               ;AAA0DD;
    dw $6324                                                             ;AAA0DE;

Spritemaps_Torizo_47:
    dw $0005,$8000                                                       ;AAA0E0;
    db $28                                                               ;AAA0E4;
    dw $636C,$01FF                                                       ;AAA0E5;
    db $24                                                               ;AAA0E9;
    dw $2366,$81F7                                                       ;AAA0EA;
    db $14                                                               ;AAA0EE;
    dw $2345,$81F4                                                       ;AAA0EF;
    db $05                                                               ;AAA0F3;
    dw $6308,$81F8                                                       ;AAA0F4;
    db $F8                                                               ;AAA0F8;
    dw $2328                                                             ;AAA0F9;

Spritemaps_Torizo_48:
    dw $0005,$8009                                                       ;AAA0FB;
    db $24                                                               ;AAA0FF;
    dw $636C,$81F8                                                       ;AAA100;
    db $06                                                               ;AAA104;
    dw $6306,$8004                                                       ;AAA105;
    db $1B                                                               ;AAA109;
    dw $2358,$81FC                                                       ;AAA10A;
    db $13                                                               ;AAA10E;
    dw $2347,$81F8                                                       ;AAA10F;
    db $F8                                                               ;AAA113;
    dw $6326                                                             ;AAA114;

Spritemaps_Torizo_49:
    dw $0005,$8012                                                       ;AAA116;
    db $19                                                               ;AAA11A;
    dw $636C,$81FC                                                       ;AAA11B;
    db $05                                                               ;AAA11F;
    dw $2308,$0014                                                       ;AAA120;
    db $16                                                               ;AAA124;
    dw $235C,$8004                                                       ;AAA125;
    db $0E                                                               ;AAA129;
    dw $234A,$81F8                                                       ;AAA12A;
    db $F8                                                               ;AAA12E;
    dw $6328                                                             ;AAA12F;

Spritemaps_Torizo_4A:
    dw $0007,$8001                                                       ;AAA131;
    db $02                                                               ;AAA135;
    dw $230A,$002A                                                       ;AAA136;
    db $0B                                                               ;AAA13A;
    dw $238F,$0022                                                       ;AAA13B;
    db $0B                                                               ;AAA13F;
    dw $238E,$001E                                                       ;AAA140;
    db $0B                                                               ;AAA144;
    dw $234F,$0016                                                       ;AAA145;
    db $0B                                                               ;AAA149;
    dw $234E,$000E                                                       ;AAA14A;
    db $0B                                                               ;AAA14E;
    dw $234D,$81F8                                                       ;AAA14F;
    db $F8                                                               ;AAA153;
    dw $2324                                                             ;AAA154;

Spritemaps_Torizo_4B:
    dw $0005,$801C                                                       ;AAA156;
    db $F6                                                               ;AAA15A;
    dw $A36E,$8001                                                       ;AAA15B;
    db $02                                                               ;AAA15F;
    dw $230A,$8015                                                       ;AAA160;
    db $FA                                                               ;AAA164;
    dw $A358,$800D                                                       ;AAA165;
    db $02                                                               ;AAA169;
    dw $A347,$81F8                                                       ;AAA16A;
    db $F8                                                               ;AAA16E;
    dw $2324                                                             ;AAA16F;

Spritemaps_Torizo_4C:
    dw $0007,$0012                                                       ;AAA171;
    db $DD                                                               ;AAA175;
    dw $E37B,$0012                                                       ;AAA176;
    db $E5                                                               ;AAA17A;
    dw $E36B,$8006                                                       ;AAA17B;
    db $F8                                                               ;AAA17F;
    dw $230E,$0012                                                       ;AAA180;
    db $EB                                                               ;AAA184;
    dw $A364,$0012                                                       ;AAA185;
    db $F3                                                               ;AAA189;
    dw $A354,$0012                                                       ;AAA18A;
    db $FB                                                               ;AAA18E;
    dw $A344,$81F8                                                       ;AAA18F;
    db $F8                                                               ;AAA193;
    dw $632A                                                             ;AAA194;

Spritemaps_Torizo_4D:
    dw $0007,$01E9                                                       ;AAA196;
    db $25                                                               ;AAA19A;
    dw $257B,$01E9                                                       ;AAA19B;
    db $1D                                                               ;AAA19F;
    dw $256B,$81EB                                                       ;AAA1A0;
    db $FB                                                               ;AAA1A4;
    dw $650C,$01E8                                                       ;AAA1A5;
    db $16                                                               ;AAA1A9;
    dw $6564,$01E8                                                       ;AAA1AA;
    db $0E                                                               ;AAA1AE;
    dw $6554,$01E8                                                       ;AAA1AF;
    db $06                                                               ;AAA1B3;
    dw $6544,$81F8                                                       ;AAA1B4;
    db $F8                                                               ;AAA1B8;
    dw $252A                                                             ;AAA1B9;

Spritemaps_Torizo_4E:
    dw $0005,$81F6                                                       ;AAA1BB;
    db $23                                                               ;AAA1BF;
    dw $656C,$81EF                                                       ;AAA1C0;
    db $02                                                               ;AAA1C4;
    dw $650A,$01F6                                                       ;AAA1C5;
    db $1F                                                               ;AAA1C9;
    dw $2566,$81EE                                                       ;AAA1CA;
    db $0F                                                               ;AAA1CE;
    dw $2545,$81F8                                                       ;AAA1CF;
    db $F8                                                               ;AAA1D3;
    dw $6524                                                             ;AAA1D4;

Spritemaps_Torizo_4F:
    dw $0005,$8000                                                       ;AAA1D6;
    db $28                                                               ;AAA1DA;
    dw $656C,$01FF                                                       ;AAA1DB;
    db $24                                                               ;AAA1DF;
    dw $2566,$81F7                                                       ;AAA1E0;
    db $14                                                               ;AAA1E4;
    dw $2545,$81F4                                                       ;AAA1E5;
    db $05                                                               ;AAA1E9;
    dw $6508,$81F8                                                       ;AAA1EA;
    db $F8                                                               ;AAA1EE;
    dw $2528                                                             ;AAA1EF;

Spritemaps_Torizo_50:
    dw $0005,$800A                                                       ;AAA1F1;
    db $23                                                               ;AAA1F5;
    dw $656C,$81F8                                                       ;AAA1F6;
    db $06                                                               ;AAA1FA;
    dw $6506,$8004                                                       ;AAA1FB;
    db $1B                                                               ;AAA1FF;
    dw $2558,$81FC                                                       ;AAA200;
    db $13                                                               ;AAA204;
    dw $2547,$81F8                                                       ;AAA205;
    db $F8                                                               ;AAA209;
    dw $6526                                                             ;AAA20A;

Spritemaps_Torizo_51:
    dw $0005,$8014                                                       ;AAA20C;
    db $19                                                               ;AAA210;
    dw $656C,$81FC                                                       ;AAA211;
    db $05                                                               ;AAA215;
    dw $2508,$0014                                                       ;AAA216;
    db $16                                                               ;AAA21A;
    dw $255C,$8004                                                       ;AAA21B;
    db $0E                                                               ;AAA21F;
    dw $254A,$81F8                                                       ;AAA220;
    db $F8                                                               ;AAA224;
    dw $6528                                                             ;AAA225;

Spritemaps_Torizo_52:
    dw $0007,$8001                                                       ;AAA227;
    db $02                                                               ;AAA22B;
    dw $250A,$002D                                                       ;AAA22C;
    db $0B                                                               ;AAA230;
    dw $258F,$0025                                                       ;AAA231;
    db $0B                                                               ;AAA235;
    dw $258E,$001E                                                       ;AAA236;
    db $0B                                                               ;AAA23A;
    dw $254F,$0016                                                       ;AAA23B;
    db $0B                                                               ;AAA23F;
    dw $254E,$000E                                                       ;AAA240;
    db $0B                                                               ;AAA244;
    dw $254D,$81F8                                                       ;AAA245;
    db $F8                                                               ;AAA249;
    dw $2524                                                             ;AAA24A;

Spritemaps_Torizo_53:
    dw $0005,$801D                                                       ;AAA24C;
    db $F4                                                               ;AAA250;
    dw $A56E,$8001                                                       ;AAA251;
    db $02                                                               ;AAA255;
    dw $250A,$8015                                                       ;AAA256;
    db $FA                                                               ;AAA25A;
    dw $A558,$800D                                                       ;AAA25B;
    db $02                                                               ;AAA25F;
    dw $A547,$81F8                                                       ;AAA260;
    db $F8                                                               ;AAA264;
    dw $2524                                                             ;AAA265;

Spritemaps_Torizo_54:
    dw $0007,$0012                                                       ;AAA267;
    db $DD                                                               ;AAA26B;
    dw $E57B,$0012                                                       ;AAA26C;
    db $E5                                                               ;AAA270;
    dw $E56B,$8006                                                       ;AAA271;
    db $F8                                                               ;AAA275;
    dw $250E,$0012                                                       ;AAA276;
    db $EB                                                               ;AAA27A;
    dw $A564,$0012                                                       ;AAA27B;
    db $F3                                                               ;AAA27F;
    dw $A554,$0012                                                       ;AAA280;
    db $FB                                                               ;AAA284;
    dw $A544,$81F8                                                       ;AAA285;
    db $F8                                                               ;AAA289;
    dw $652A                                                             ;AAA28A;

Spritemaps_Torizo_55:
    dw $0018,$8002                                                       ;AAA28C;
    db $F3                                                               ;AAA290;
    dw $6330,$81F7                                                       ;AAA291;
    db $FD                                                               ;AAA295;
    dw $63A9,$01FF                                                       ;AAA296;
    db $0D                                                               ;AAA29A;
    dw $63BB,$0007                                                       ;AAA29B;
    db $0D                                                               ;AAA29F;
    dw $63AF,$81FF                                                       ;AAA2A0;
    db $FD                                                               ;AAA2A4;
    dw $63A8,$81F6                                                       ;AAA2A5;
    db $15                                                               ;AAA2A9;
    dw $638A,$81FE                                                       ;AAA2AA;
    db $0D                                                               ;AAA2AE;
    dw $6379,$01F3                                                       ;AAA2AF;
    db $20                                                               ;AAA2B3;
    dw $6362,$01FB                                                       ;AAA2B4;
    db $20                                                               ;AAA2B8;
    dw $6361,$0003                                                       ;AAA2B9;
    db $20                                                               ;AAA2BD;
    dw $6360,$81FB                                                       ;AAA2BE;
    db $FD                                                               ;AAA2C2;
    dw $65A9,$0003                                                       ;AAA2C3;
    db $0D                                                               ;AAA2C7;
    dw $65BB,$000B                                                       ;AAA2C8;
    db $0D                                                               ;AAA2CC;
    dw $65AF,$8003                                                       ;AAA2CD;
    db $FD                                                               ;AAA2D1;
    dw $65A8,$81FA                                                       ;AAA2D2;
    db $15                                                               ;AAA2D6;
    dw $658A,$8002                                                       ;AAA2D7;
    db $0D                                                               ;AAA2DB;
    dw $6579,$01F7                                                       ;AAA2DC;
    db $20                                                               ;AAA2E0;
    dw $6562,$01FF                                                       ;AAA2E1;
    db $20                                                               ;AAA2E5;
    dw $6561,$0007                                                       ;AAA2E6;
    db $20                                                               ;AAA2EA;
    dw $6560,$8002                                                       ;AAA2EB;
    db $E3                                                               ;AAA2EF;
    dw $6310,$81F2                                                       ;AAA2F0;
    db $FB                                                               ;AAA2F4;
    dw $6342,$81F2                                                       ;AAA2F5;
    db $EB                                                               ;AAA2F9;
    dw $6322,$81F2                                                       ;AAA2FA;
    db $DB                                                               ;AAA2FE;
    dw $6302,$8002                                                       ;AAA2FF;
    db $DB                                                               ;AAA303;
    dw $6300                                                             ;AAA304;

Spritemaps_Torizo_56:
    dw $0013,$8002                                                       ;AAA306;
    db $F2                                                               ;AAA30A;
    dw $6330,$01FC                                                       ;AAA30B;
    db $0F                                                               ;AAA30F;
    dw $63AE,$0004                                                       ;AAA310;
    db $0F                                                               ;AAA314;
    dw $63AD,$81FC                                                       ;AAA315;
    db $FF                                                               ;AAA319;
    dw $63A6,$81EE                                                       ;AAA31A;
    db $22                                                               ;AAA31E;
    dw $63A0,$81F3                                                       ;AAA31F;
    db $19                                                               ;AAA323;
    dw $638A,$81FB                                                       ;AAA324;
    db $11                                                               ;AAA328;
    dw $6379,$8002                                                       ;AAA329;
    db $FA                                                               ;AAA32D;
    dw $6340,$8002                                                       ;AAA32E;
    db $E2                                                               ;AAA332;
    dw $6310,$81F2                                                       ;AAA333;
    db $FA                                                               ;AAA337;
    dw $6342,$81F2                                                       ;AAA338;
    db $EA                                                               ;AAA33C;
    dw $6322,$81F2                                                       ;AAA33D;
    db $DA                                                               ;AAA341;
    dw $6302,$8002                                                       ;AAA342;
    db $DA                                                               ;AAA346;
    dw $6300,$0000                                                       ;AAA347;
    db $10                                                               ;AAA34B;
    dw $25AC,$01F8                                                       ;AAA34C;
    db $10                                                               ;AAA350;
    dw $25AB,$81F8                                                       ;AAA351;
    db $00                                                               ;AAA355;
    dw $25A4,$81E7                                                       ;AAA356;
    db $24                                                               ;AAA35A;
    dw $65A0,$81EC                                                       ;AAA35B;
    db $1B                                                               ;AAA35F;
    dw $658A,$81F4                                                       ;AAA360;
    db $13                                                               ;AAA364;
    dw $6579                                                             ;AAA365;

Spritemaps_Torizo_57:
    dw $0015,$8002                                                       ;AAA367;
    db $F2                                                               ;AAA36B;
    dw $6330,$81ED                                                       ;AAA36C;
    db $27                                                               ;AAA370;
    dw $63A2,$81EA                                                       ;AAA371;
    db $27                                                               ;AAA375;
    dw $63A2,$0000                                                       ;AAA376;
    db $10                                                               ;AAA37A;
    dw $63AB,$01F8                                                       ;AAA37B;
    db $10                                                               ;AAA37F;
    dw $63AC,$81F8                                                       ;AAA380;
    db $00                                                               ;AAA384;
    dw $63A4,$81F3                                                       ;AAA385;
    db $13                                                               ;AAA389;
    dw $6377,$01F3                                                       ;AAA38A;
    db $23                                                               ;AAA38E;
    dw $6398,$01FB                                                       ;AAA38F;
    db $23                                                               ;AAA393;
    dw $6397,$01FD                                                       ;AAA394;
    db $10                                                               ;AAA398;
    dw $65AB,$01F5                                                       ;AAA399;
    db $10                                                               ;AAA39D;
    dw $65AC,$81F5                                                       ;AAA39E;
    db $00                                                               ;AAA3A2;
    dw $65A4,$81F0                                                       ;AAA3A3;
    db $13                                                               ;AAA3A7;
    dw $6577,$01F0                                                       ;AAA3A8;
    db $23                                                               ;AAA3AC;
    dw $6598,$01F8                                                       ;AAA3AD;
    db $23                                                               ;AAA3B1;
    dw $6597,$8002                                                       ;AAA3B2;
    db $FA                                                               ;AAA3B6;
    dw $6340,$8002                                                       ;AAA3B7;
    db $E2                                                               ;AAA3BB;
    dw $6310,$81F2                                                       ;AAA3BC;
    db $FA                                                               ;AAA3C0;
    dw $6342,$81F2                                                       ;AAA3C1;
    db $EA                                                               ;AAA3C5;
    dw $6322,$81F2                                                       ;AAA3C6;
    db $DA                                                               ;AAA3CA;
    dw $6302,$8002                                                       ;AAA3CB;
    db $DA                                                               ;AAA3CF;
    dw $6300                                                             ;AAA3D0;

Spritemaps_Torizo_58:
    dw $0018,$01DE                                                       ;AAA3D2;
    db $28                                                               ;AAA3D6;
    dw $6562,$01E6                                                       ;AAA3D7;
    db $28                                                               ;AAA3DB;
    dw $6561,$01EE                                                       ;AAA3DC;
    db $28                                                               ;AAA3E0;
    dw $6560,$000D                                                       ;AAA3E1;
    db $28                                                               ;AAA3E5;
    dw $6362,$0015                                                       ;AAA3E6;
    db $28                                                               ;AAA3EA;
    dw $6361,$001D                                                       ;AAA3EB;
    db $28                                                               ;AAA3EF;
    dw $6360,$81F9                                                       ;AAA3F0;
    db $FE                                                               ;AAA3F4;
    dw $63A9,$0001                                                       ;AAA3F5;
    db $0E                                                               ;AAA3F9;
    dw $63BB,$0009                                                       ;AAA3FA;
    db $0E                                                               ;AAA3FE;
    dw $63AF,$8001                                                       ;AAA3FF;
    db $FE                                                               ;AAA403;
    dw $63A8,$0009                                                       ;AAA404;
    db $22                                                               ;AAA408;
    dw $6394,$0011                                                       ;AAA409;
    db $22                                                               ;AAA40D;
    dw $6393,$8009                                                       ;AAA40E;
    db $12                                                               ;AAA412;
    dw $6373,$01FB                                                       ;AAA413;
    db $10                                                               ;AAA417;
    dw $25AE,$01F3                                                       ;AAA418;
    db $10                                                               ;AAA41C;
    dw $25AD,$81F3                                                       ;AAA41D;
    db $00                                                               ;AAA421;
    dw $25A6,$81E1                                                       ;AAA422;
    db $1C                                                               ;AAA426;
    dw $658A,$81E9                                                       ;AAA427;
    db $14                                                               ;AAA42B;
    dw $6579,$81F2                                                       ;AAA42C;
    db $F9                                                               ;AAA430;
    dw $6342,$8002                                                       ;AAA431;
    db $F9                                                               ;AAA435;
    dw $6340,$81F2                                                       ;AAA436;
    db $E9                                                               ;AAA43A;
    dw $6322,$8002                                                       ;AAA43B;
    db $E9                                                               ;AAA43F;
    dw $6320,$81F2                                                       ;AAA440;
    db $D9                                                               ;AAA444;
    dw $6302,$8002                                                       ;AAA445;
    db $D9                                                               ;AAA449;
    dw $6300                                                             ;AAA44A;

Spritemaps_Torizo_59:
    dw $0018,$01DE                                                       ;AAA44C;
    db $28                                                               ;AAA450;
    dw $6362,$01E6                                                       ;AAA451;
    db $28                                                               ;AAA455;
    dw $6361,$01EE                                                       ;AAA456;
    db $28                                                               ;AAA45A;
    dw $6360,$01FB                                                       ;AAA45B;
    db $10                                                               ;AAA45F;
    dw $23AE,$01F3                                                       ;AAA460;
    db $10                                                               ;AAA464;
    dw $23AD,$81F3                                                       ;AAA465;
    db $00                                                               ;AAA469;
    dw $23A6,$81E1                                                       ;AAA46A;
    db $1C                                                               ;AAA46E;
    dw $638A,$81E9                                                       ;AAA46F;
    db $14                                                               ;AAA473;
    dw $6379,$000D                                                       ;AAA474;
    db $28                                                               ;AAA478;
    dw $6562,$0015                                                       ;AAA479;
    db $28                                                               ;AAA47D;
    dw $6561,$001D                                                       ;AAA47E;
    db $28                                                               ;AAA482;
    dw $6560,$81F9                                                       ;AAA483;
    db $FE                                                               ;AAA487;
    dw $65A9,$0001                                                       ;AAA488;
    db $0E                                                               ;AAA48C;
    dw $65BB,$0009                                                       ;AAA48D;
    db $0E                                                               ;AAA491;
    dw $65AF,$8001                                                       ;AAA492;
    db $FE                                                               ;AAA496;
    dw $65A8,$0009                                                       ;AAA497;
    db $22                                                               ;AAA49B;
    dw $6594,$0011                                                       ;AAA49C;
    db $22                                                               ;AAA4A0;
    dw $6593,$8009                                                       ;AAA4A1;
    db $12                                                               ;AAA4A5;
    dw $6573,$81F2                                                       ;AAA4A6;
    db $F9                                                               ;AAA4AA;
    dw $6342,$8002                                                       ;AAA4AB;
    db $F9                                                               ;AAA4AF;
    dw $6340,$81F2                                                       ;AAA4B0;
    db $E9                                                               ;AAA4B4;
    dw $6322,$8002                                                       ;AAA4B5;
    db $E9                                                               ;AAA4B9;
    dw $6320,$81F2                                                       ;AAA4BA;
    db $D9                                                               ;AAA4BE;
    dw $6302,$8002                                                       ;AAA4BF;
    db $D9                                                               ;AAA4C3;
    dw $6300                                                             ;AAA4C4;

UNUSED_Spritemaps_Torizo_AAA4C6:
    dw $0006,$81F0                                                       ;AAA4C6;
    db $0C                                                               ;AAA4CA;
    dw $6342,$8000                                                       ;AAA4CB;
    db $0C                                                               ;AAA4CF;
    dw $6340,$81F0                                                       ;AAA4D0;
    db $FC                                                               ;AAA4D4;
    dw $6322,$8000                                                       ;AAA4D5;
    db $FC                                                               ;AAA4D9;
    dw $6320,$81F0                                                       ;AAA4DA;
    db $EC                                                               ;AAA4DE;
    dw $6302,$8000                                                       ;AAA4DF;
    db $EC                                                               ;AAA4E3;
    dw $6300                                                             ;AAA4E4;

UNUSED_ExtendedSpritemaps_Torizo_AAA4E6:
    dw $0001,$0000,$0000                                                 ;AAA4E6;
    dw Spritemaps_Torizo_7                                               ;AAA4EC;
    dw UNUSED_Hitboxes_Torizo_AA87DA                                     ;AAA4EE;

ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging:
    dw $0001,$0000,$0000                                                 ;AAA4F0;
    dw Spritemaps_Torizo_6                                               ;AAA4F6;
    dw Hitboxes_Torizo_Blank                                             ;AAA4F8;

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0:
    dw $0004,$FFF1,$FFE2                                                 ;AAA4FA;
    dw Spritemaps_Torizo_0                                               ;AAA500;
    dw Hitboxes_Torizo_Blank                                             ;AAA502;
    dw $FFFB,$FFE8                                                       ;AAA504;
    dw Spritemaps_Torizo_1B                                              ;AAA508;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8                      ;AAA50A;
    dw $0000,$0000                                                       ;AAA50C;
    dw Spritemaps_Torizo_2E                                              ;AAA510;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA512;
    dw $FFFB,$FFE8                                                       ;AAA514;
    dw Spritemaps_Torizo_27                                              ;AAA518;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12                     ;AAA51A;

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1:
    dw $0004,$FFF1,$FFE2                                                 ;AAA51C;
    dw Spritemaps_Torizo_0                                               ;AAA522;
    dw Hitboxes_Torizo_Blank                                             ;AAA524;
    dw $FFFB,$FFE7                                                       ;AAA526;
    dw Spritemaps_Torizo_1C                                              ;AAA52A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8                      ;AAA52C;
    dw $0000,$0000                                                       ;AAA52E;
    dw Spritemaps_Torizo_13                                              ;AAA532;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7                      ;AAA534;
    dw $FFFB,$FFE7                                                       ;AAA536;
    dw Spritemaps_Torizo_26                                              ;AAA53A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11                     ;AAA53C;

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2:
    dw $0004,$FFF1,$FFE1                                                 ;AAA53E;
    dw Spritemaps_Torizo_0                                               ;AAA544;
    dw Hitboxes_Torizo_Blank                                             ;AAA546;
    dw $FFFB,$FFE6                                                       ;AAA548;
    dw Spritemaps_Torizo_1D                                              ;AAA54C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAA54E;
    dw $0000,$0000                                                       ;AAA550;
    dw Spritemaps_Torizo_14                                              ;AAA554;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7                      ;AAA556;
    dw $FFFB,$FFE6                                                       ;AAA558;
    dw Spritemaps_Torizo_25                                              ;AAA55C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_10                     ;AAA55E;

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3:
    dw $0004,$FFF1,$FFE0                                                 ;AAA560;
    dw Spritemaps_Torizo_0                                               ;AAA566;
    dw Hitboxes_Torizo_Blank                                             ;AAA568;
    dw $FFFB,$FFE7                                                       ;AAA56A;
    dw Spritemaps_Torizo_1E                                              ;AAA56E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA570;
    dw $0000,$0000                                                       ;AAA572;
    dw Spritemaps_Torizo_15                                              ;AAA576;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7                      ;AAA578;
    dw $FFFB,$FFE7                                                       ;AAA57A;
    dw Spritemaps_Torizo_24                                              ;AAA57E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA580;

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4:
    dw $0004,$FFF1,$FFE0                                                 ;AAA582;
    dw Spritemaps_Torizo_0                                               ;AAA588;
    dw Hitboxes_Torizo_Blank                                             ;AAA58A;
    dw $FFFB,$FFE8                                                       ;AAA58C;
    dw Spritemaps_Torizo_1F                                              ;AAA590;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B                      ;AAA592;
    dw $0000,$0000                                                       ;AAA594;
    dw Spritemaps_Torizo_16                                              ;AAA598;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7                      ;AAA59A;
    dw $FFFB,$FFE8                                                       ;AAA59C;
    dw Spritemaps_Torizo_23                                              ;AAA5A0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA5A2;

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0:
    dw $0004,$FFF1,$FFE2                                                 ;AAA5A4;
    dw Spritemaps_Torizo_0                                               ;AAA5AA;
    dw Hitboxes_Torizo_Blank                                             ;AAA5AC;
    dw $FFFB,$FFE8                                                       ;AAA5AE;
    dw Spritemaps_Torizo_1F                                              ;AAA5B2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B                      ;AAA5B4;
    dw $0000,$0000                                                       ;AAA5B6;
    dw Spritemaps_Torizo_2F                                              ;AAA5BA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA5BC;
    dw $FFFB,$FFE8                                                       ;AAA5BE;
    dw Spritemaps_Torizo_23                                              ;AAA5C2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA5C4;

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1:
    dw $0004,$FFF1,$FFE1                                                 ;AAA5C6;
    dw Spritemaps_Torizo_0                                               ;AAA5CC;
    dw Hitboxes_Torizo_Blank                                             ;AAA5CE;
    dw $FFFB,$FFE7                                                       ;AAA5D0;
    dw Spritemaps_Torizo_1E                                              ;AAA5D4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA5D6;
    dw $0000,$0000                                                       ;AAA5D8;
    dw Spritemaps_Torizo_17                                              ;AAA5DC;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7                      ;AAA5DE;
    dw $FFFB,$FFE7                                                       ;AAA5E0;
    dw Spritemaps_Torizo_24                                              ;AAA5E4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA5E6;

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2:
    dw $0004,$FFF1,$FFE1                                                 ;AAA5E8;
    dw Spritemaps_Torizo_0                                               ;AAA5EE;
    dw Hitboxes_Torizo_Blank                                             ;AAA5F0;
    dw $FFFB,$FFE6                                                       ;AAA5F2;
    dw Spritemaps_Torizo_1D                                              ;AAA5F6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAA5F8;
    dw $0000,$0000                                                       ;AAA5FA;
    dw Spritemaps_Torizo_18                                              ;AAA5FE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7                      ;AAA600;
    dw $FFFB,$FFE6                                                       ;AAA602;
    dw Spritemaps_Torizo_25                                              ;AAA606;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_10                     ;AAA608;

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3:
    dw $0004,$FFF1,$FFE0                                                 ;AAA60A;
    dw Spritemaps_Torizo_0                                               ;AAA610;
    dw Hitboxes_Torizo_Blank                                             ;AAA612;
    dw $FFFB,$FFE7                                                       ;AAA614;
    dw Spritemaps_Torizo_1C                                              ;AAA618;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8                      ;AAA61A;
    dw $0000,$0000                                                       ;AAA61C;
    dw Spritemaps_Torizo_19                                              ;AAA620;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7                      ;AAA622;
    dw $FFFB,$FFE7                                                       ;AAA624;
    dw Spritemaps_Torizo_26                                              ;AAA628;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11                     ;AAA62A;

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4:
    dw $0004,$FFF1,$FFE1                                                 ;AAA62C;
    dw Spritemaps_Torizo_0                                               ;AAA632;
    dw Hitboxes_Torizo_Blank                                             ;AAA634;
    dw $FFFB,$FFE8                                                       ;AAA636;
    dw Spritemaps_Torizo_1B                                              ;AAA63A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8                      ;AAA63C;
    dw $0000,$0000                                                       ;AAA63E;
    dw Spritemaps_Torizo_1A                                              ;AAA642;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7                      ;AAA644;
    dw $FFFB,$FFE8                                                       ;AAA646;
    dw Spritemaps_Torizo_27                                              ;AAA64A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12                     ;AAA64C;

ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward:
    dw $0003,$FFF1,$FFE1                                                 ;AAA64E;
    dw Spritemaps_Torizo_0                                               ;AAA654;
    dw Hitboxes_Torizo_Blank                                             ;AAA656;
    dw $FFFC,$FFE7                                                       ;AAA658;
    dw Spritemaps_Torizo_1D                                              ;AAA65C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAA65E;
    dw $0000,$0000                                                       ;AAA660;
    dw Spritemaps_Torizo_2F                                              ;AAA664;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA666;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0:
    dw $0003,$FFF7,$FFE1                                                 ;AAA668;
    dw Spritemaps_Torizo_1                                               ;AAA66E;
    dw Hitboxes_Torizo_Blank                                             ;AAA670;
    dw $FFFC,$FFE7                                                       ;AAA672;
    dw Spritemaps_Torizo_1E                                              ;AAA676;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA678;
    dw $0000,$0000                                                       ;AAA67A;
    dw Spritemaps_Torizo_2F                                              ;AAA67E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA680;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1:
    dw $0003,$FFF7,$FFE1                                                 ;AAA682;
    dw Spritemaps_Torizo_2                                               ;AAA688;
    dw Hitboxes_Torizo_Blank                                             ;AAA68A;
    dw $FFFC,$FFE7                                                       ;AAA68C;
    dw Spritemaps_Torizo_1F                                              ;AAA690;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B                      ;AAA692;
    dw $0000,$0000                                                       ;AAA694;
    dw Spritemaps_Torizo_2F                                              ;AAA698;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA69A;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2:
    dw $0003,$FFF7,$FFE1                                                 ;AAA69C;
    dw Spritemaps_Torizo_3                                               ;AAA6A2;
    dw Hitboxes_Torizo_Blank                                             ;AAA6A4;
    dw $FFFC,$FFE7                                                       ;AAA6A6;
    dw Spritemaps_Torizo_20                                              ;AAA6AA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C                      ;AAA6AC;
    dw $0000,$0000                                                       ;AAA6AE;
    dw Spritemaps_Torizo_2F                                              ;AAA6B2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA6B4;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3:
    dw $0003,$FFFC,$FFE7                                                 ;AAA6B6;
    dw Spritemaps_Torizo_21                                              ;AAA6BC;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D                      ;AAA6BE;
    dw $FFF7,$FFE1                                                       ;AAA6C0;
    dw Spritemaps_Torizo_4                                               ;AAA6C4;
    dw Hitboxes_Torizo_Blank                                             ;AAA6C6;
    dw $0000,$0000                                                       ;AAA6C8;
    dw Spritemaps_Torizo_2F                                              ;AAA6CC;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA6CE;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4:
    dw $0003,$FFFC,$FFE7                                                 ;AAA6D0;
    dw Spritemaps_Torizo_21                                              ;AAA6D6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D                      ;AAA6D8;
    dw $FFF7,$FFE1                                                       ;AAA6DA;
    dw Spritemaps_Torizo_5                                               ;AAA6DE;
    dw Hitboxes_Torizo_Blank                                             ;AAA6E0;
    dw $0000,$0000                                                       ;AAA6E2;
    dw Spritemaps_Torizo_2F                                              ;AAA6E6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA6E8;

ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward:
    dw $0003,$FFF1,$FFE1                                                 ;AAA6EA;
    dw Spritemaps_Torizo_0                                               ;AAA6F0;
    dw Hitboxes_Torizo_Blank                                             ;AAA6F2;
    dw $FFFC,$FFE7                                                       ;AAA6F4;
    dw Spritemaps_Torizo_1C                                              ;AAA6F8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8                      ;AAA6FA;
    dw $0000,$0000                                                       ;AAA6FC;
    dw Spritemaps_Torizo_2E                                              ;AAA700;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA702;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0:
    dw $0003,$FFF7,$FFE1                                                 ;AAA704;
    dw Spritemaps_Torizo_1                                               ;AAA70A;
    dw Hitboxes_Torizo_Blank                                             ;AAA70C;
    dw $FFFC,$FFE7                                                       ;AAA70E;
    dw Spritemaps_Torizo_1E                                              ;AAA712;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA714;
    dw $0000,$0000                                                       ;AAA716;
    dw Spritemaps_Torizo_2E                                              ;AAA71A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA71C;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1:
    dw $0003,$FFF7,$FFE1                                                 ;AAA71E;
    dw Spritemaps_Torizo_2                                               ;AAA724;
    dw Hitboxes_Torizo_Blank                                             ;AAA726;
    dw $FFFC,$FFE7                                                       ;AAA728;
    dw Spritemaps_Torizo_1F                                              ;AAA72C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B                      ;AAA72E;
    dw $0000,$0000                                                       ;AAA730;
    dw Spritemaps_Torizo_2E                                              ;AAA734;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA736;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2:
    dw $0003,$FFF7,$FFE1                                                 ;AAA738;
    dw Spritemaps_Torizo_3                                               ;AAA73E;
    dw Hitboxes_Torizo_Blank                                             ;AAA740;
    dw $FFFC,$FFE7                                                       ;AAA742;
    dw Spritemaps_Torizo_20                                              ;AAA746;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C                      ;AAA748;
    dw $0000,$0000                                                       ;AAA74A;
    dw Spritemaps_Torizo_2E                                              ;AAA74E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA750;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3:
    dw $0003,$FFFC,$FFE7                                                 ;AAA752;
    dw Spritemaps_Torizo_21                                              ;AAA758;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D                      ;AAA75A;
    dw $FFF7,$FFE1                                                       ;AAA75C;
    dw Spritemaps_Torizo_4                                               ;AAA760;
    dw Hitboxes_Torizo_Blank                                             ;AAA762;
    dw $0000,$0000                                                       ;AAA764;
    dw Spritemaps_Torizo_2E                                              ;AAA768;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA76A;

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4:
    dw $0003,$FFFC,$FFE7                                                 ;AAA76C;
    dw Spritemaps_Torizo_21                                              ;AAA772;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D                      ;AAA774;
    dw $FFF7,$FFE1                                                       ;AAA776;
    dw Spritemaps_Torizo_5                                               ;AAA77A;
    dw Hitboxes_Torizo_Blank                                             ;AAA77C;
    dw $0000,$0000                                                       ;AAA77E;
    dw Spritemaps_Torizo_2E                                              ;AAA782;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA784;

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0:
    dw $0003,$FFF1,$FFE1                                                 ;AAA786;
    dw Spritemaps_Torizo_0                                               ;AAA78C;
    dw Hitboxes_Torizo_Blank                                             ;AAA78E;
    dw $FFFC,$FFE7                                                       ;AAA790;
    dw Spritemaps_Torizo_1E                                              ;AAA794;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA796;
    dw $0000,$0000                                                       ;AAA798;
    dw Spritemaps_Torizo_2F                                              ;AAA79C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA79E;

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1:
    dw $0004,$FFF1,$FFE1                                                 ;AAA7A0;
    dw Spritemaps_Torizo_0                                               ;AAA7A6;
    dw Hitboxes_Torizo_Blank                                             ;AAA7A8;
    dw $FFFC,$FFE7                                                       ;AAA7AA;
    dw Spritemaps_Torizo_1E                                              ;AAA7AE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA7B0;
    dw $0000,$0000                                                       ;AAA7B2;
    dw Spritemaps_Torizo_2F                                              ;AAA7B6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA7B8;
    dw $FFFC,$FFE7                                                       ;AAA7BA;
    dw Spritemaps_Torizo_27                                              ;AAA7BE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12                     ;AAA7C0;

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2:
    dw $0004,$FFFC,$FFE7                                                 ;AAA7C2;
    dw Spritemaps_Torizo_1E                                              ;AAA7C8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA7CA;
    dw $FFF1,$FFE1                                                       ;AAA7CC;
    dw Spritemaps_Torizo_0                                               ;AAA7D0;
    dw Hitboxes_Torizo_Blank                                             ;AAA7D2;
    dw $0000,$0000                                                       ;AAA7D4;
    dw Spritemaps_Torizo_2F                                              ;AAA7D8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA7DA;
    dw $FFFC,$FFE7                                                       ;AAA7DC;
    dw Spritemaps_Torizo_28                                              ;AAA7E0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_13                     ;AAA7E2;

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3:
    dw $0004,$FFFC,$FFE7                                                 ;AAA7E4;
    dw Spritemaps_Torizo_1E                                              ;AAA7EA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA7EC;
    dw $FFF1,$FFE1                                                       ;AAA7EE;
    dw Spritemaps_Torizo_0                                               ;AAA7F2;
    dw Hitboxes_Torizo_Blank                                             ;AAA7F4;
    dw $0000,$0000                                                       ;AAA7F6;
    dw Spritemaps_Torizo_2F                                              ;AAA7FA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA7FC;
    dw $FFFC,$FFE7                                                       ;AAA7FE;
    dw Spritemaps_Torizo_29                                              ;AAA802;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_14                     ;AAA804;

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4:
    dw $0004,$FFFC,$FFE7                                                 ;AAA806;
    dw Spritemaps_Torizo_1E                                              ;AAA80C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA80E;
    dw $FFF1,$FFE1                                                       ;AAA810;
    dw Spritemaps_Torizo_0                                               ;AAA814;
    dw Hitboxes_Torizo_Blank                                             ;AAA816;
    dw $0000,$0000                                                       ;AAA818;
    dw Spritemaps_Torizo_2F                                              ;AAA81C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA81E;
    dw $FFFC,$FFE7                                                       ;AAA820;
    dw Spritemaps_Torizo_2A                                              ;AAA824;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_15                     ;AAA826;

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5:
    dw $0004,$FFF1,$FFE1                                                 ;AAA828;
    dw Spritemaps_Torizo_0                                               ;AAA82E;
    dw Hitboxes_Torizo_Blank                                             ;AAA830;
    dw $FFFC,$FFE7                                                       ;AAA832;
    dw Spritemaps_Torizo_1E                                              ;AAA836;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA838;
    dw $0000,$0000                                                       ;AAA83A;
    dw Spritemaps_Torizo_2F                                              ;AAA83E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA840;
    dw $FFFC,$FFE7                                                       ;AAA842;
    dw Spritemaps_Torizo_24                                              ;AAA846;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA848;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0:
    dw $0004,$FFF1,$FFE1                                                 ;AAA84A;
    dw Spritemaps_Torizo_0                                               ;AAA850;
    dw Hitboxes_Torizo_Blank                                             ;AAA852;
    dw $FFFC,$FFE7                                                       ;AAA854;
    dw Spritemaps_Torizo_1F                                              ;AAA858;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B                      ;AAA85A;
    dw $0000,$0000                                                       ;AAA85C;
    dw Spritemaps_Torizo_2F                                              ;AAA860;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA862;
    dw $FFFC,$FFE7                                                       ;AAA864;
    dw Spritemaps_Torizo_24                                              ;AAA868;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA86A;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1:
    dw $0004,$FFF1,$FFE1                                                 ;AAA86C;
    dw Spritemaps_Torizo_0                                               ;AAA872;
    dw Hitboxes_Torizo_Blank                                             ;AAA874;
    dw $FFFC,$FFE7                                                       ;AAA876;
    dw Spritemaps_Torizo_20                                              ;AAA87A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C                      ;AAA87C;
    dw $0000,$0000                                                       ;AAA87E;
    dw Spritemaps_Torizo_2F                                              ;AAA882;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA884;
    dw $FFFC,$FFE7                                                       ;AAA886;
    dw Spritemaps_Torizo_24                                              ;AAA88A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA88C;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2:
    dw $0004,$FFFC,$FFE7                                                 ;AAA88E;
    dw Spritemaps_Torizo_21                                              ;AAA894;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D                      ;AAA896;
    dw $FFF1,$FFE1                                                       ;AAA898;
    dw Spritemaps_Torizo_0                                               ;AAA89C;
    dw Hitboxes_Torizo_Blank                                             ;AAA89E;
    dw $0000,$0000                                                       ;AAA8A0;
    dw Spritemaps_Torizo_2F                                              ;AAA8A4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA8A6;
    dw $FFFC,$FFE7                                                       ;AAA8A8;
    dw Spritemaps_Torizo_24                                              ;AAA8AC;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA8AE;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3:
    dw $0004,$FFFC,$FFE7                                                 ;AAA8B0;
    dw Spritemaps_Torizo_22                                              ;AAA8B6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_E                      ;AAA8B8;
    dw $FFF1,$FFE1                                                       ;AAA8BA;
    dw Spritemaps_Torizo_0                                               ;AAA8BE;
    dw Hitboxes_Torizo_Blank                                             ;AAA8C0;
    dw $0000,$0000                                                       ;AAA8C2;
    dw Spritemaps_Torizo_2F                                              ;AAA8C6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA8C8;
    dw $FFFC,$FFE7                                                       ;AAA8CA;
    dw Spritemaps_Torizo_24                                              ;AAA8CE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F                      ;AAA8D0;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0:
    dw $0003,$FFF1,$FFE1                                                 ;AAA8D2;
    dw Spritemaps_Torizo_0                                               ;AAA8D8;
    dw Hitboxes_Torizo_Blank                                             ;AAA8DA;
    dw $FFFC,$FFE7                                                       ;AAA8DC;
    dw Spritemaps_Torizo_1E                                              ;AAA8E0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAA8E2;
    dw $0000,$0000                                                       ;AAA8E4;
    dw Spritemaps_Torizo_2E                                              ;AAA8E8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA8EA;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1:
    dw $0003,$FFF1,$FFE1                                                 ;AAA8EC;
    dw Spritemaps_Torizo_0                                               ;AAA8F2;
    dw Hitboxes_Torizo_Blank                                             ;AAA8F4;
    dw $FFFC,$FFE7                                                       ;AAA8F6;
    dw Spritemaps_Torizo_1F                                              ;AAA8FA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B                      ;AAA8FC;
    dw $0000,$0000                                                       ;AAA8FE;
    dw Spritemaps_Torizo_2E                                              ;AAA902;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA904;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2:
    dw $0003,$FFFC,$FFE7                                                 ;AAA906;
    dw Spritemaps_Torizo_20                                              ;AAA90C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C                      ;AAA90E;
    dw $FFF1,$FFE1                                                       ;AAA910;
    dw Spritemaps_Torizo_0                                               ;AAA914;
    dw Hitboxes_Torizo_Blank                                             ;AAA916;
    dw $0000,$0000                                                       ;AAA918;
    dw Spritemaps_Torizo_2E                                              ;AAA91C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA91E;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3:
    dw $0003,$FFFC,$FFE7                                                 ;AAA920;
    dw Spritemaps_Torizo_21                                              ;AAA926;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D                      ;AAA928;
    dw $FFF1,$FFE1                                                       ;AAA92A;
    dw Spritemaps_Torizo_0                                               ;AAA92E;
    dw Hitboxes_Torizo_Blank                                             ;AAA930;
    dw $0000,$0000                                                       ;AAA932;
    dw Spritemaps_Torizo_2E                                              ;AAA936;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA938;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4:
    dw $0003,$FFFC,$FFE7                                                 ;AAA93A;
    dw Spritemaps_Torizo_22                                              ;AAA940;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_E                      ;AAA942;
    dw $FFF1,$FFE1                                                       ;AAA944;
    dw Spritemaps_Torizo_0                                               ;AAA948;
    dw Hitboxes_Torizo_Blank                                             ;AAA94A;
    dw $0000,$0000                                                       ;AAA94C;
    dw Spritemaps_Torizo_2E                                              ;AAA950;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA952;

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5:
    dw $0004,$FFF1,$FFE1                                                 ;AAA954;
    dw Spritemaps_Torizo_0                                               ;AAA95A;
    dw Hitboxes_Torizo_Blank                                             ;AAA95C;
    dw $FFFC,$FFE7                                                       ;AAA95E;
    dw Spritemaps_Torizo_1D                                              ;AAA962;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAA964;
    dw $0000,$0000                                                       ;AAA966;
    dw Spritemaps_Torizo_2E                                              ;AAA96A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA96C;
    dw $FFFC,$FFE7                                                       ;AAA96E;
    dw Spritemaps_Torizo_26                                              ;AAA972;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11                     ;AAA974;

ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0:
    dw $0004,$FFF1,$FFE1                                                 ;AAA976;
    dw Spritemaps_Torizo_0                                               ;AAA97C;
    dw Hitboxes_Torizo_Blank                                             ;AAA97E;
    dw $FFFC,$FFE7                                                       ;AAA980;
    dw Spritemaps_Torizo_1D                                              ;AAA984;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAA986;
    dw $0000,$0000                                                       ;AAA988;
    dw Spritemaps_Torizo_2E                                              ;AAA98C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA98E;
    dw $FFFC,$FFE7                                                       ;AAA990;
    dw Spritemaps_Torizo_27                                              ;AAA994;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12                     ;AAA996;

ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1:
    dw $0004,$FFF1,$FFE1                                                 ;AAA998;
    dw Spritemaps_Torizo_0                                               ;AAA99E;
    dw Hitboxes_Torizo_Blank                                             ;AAA9A0;
    dw $FFFC,$FFE7                                                       ;AAA9A2;
    dw Spritemaps_Torizo_1D                                              ;AAA9A6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAA9A8;
    dw $0000,$0000                                                       ;AAA9AA;
    dw Spritemaps_Torizo_2E                                              ;AAA9AE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA9B0;
    dw $FFFC,$FFE7                                                       ;AAA9B2;
    dw Spritemaps_Torizo_28                                              ;AAA9B6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_13                     ;AAA9B8;

ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2:
    dw $0004,$FFFC,$FFE7                                                 ;AAA9BA;
    dw Spritemaps_Torizo_1D                                              ;AAA9C0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAA9C2;
    dw $FFF1,$FFE1                                                       ;AAA9C4;
    dw Spritemaps_Torizo_0                                               ;AAA9C8;
    dw Hitboxes_Torizo_Blank                                             ;AAA9CA;
    dw $0000,$0000                                                       ;AAA9CC;
    dw Spritemaps_Torizo_2E                                              ;AAA9D0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA9D2;
    dw $FFFC,$FFE7                                                       ;AAA9D4;
    dw Spritemaps_Torizo_29                                              ;AAA9D8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_14                     ;AAA9DA;

ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3:
    dw $0004,$FFFC,$FFE7                                                 ;AAA9DC;
    dw Spritemaps_Torizo_1D                                              ;AAA9E2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAA9E4;
    dw $FFF1,$FFE1                                                       ;AAA9E6;
    dw Spritemaps_Torizo_0                                               ;AAA9EA;
    dw Hitboxes_Torizo_Blank                                             ;AAA9EC;
    dw $0000,$0000                                                       ;AAA9EE;
    dw Spritemaps_Torizo_2E                                              ;AAA9F2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17                     ;AAA9F4;
    dw $FFFC,$FFE7                                                       ;AAA9F6;
    dw Spritemaps_Torizo_2A                                              ;AAA9FA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_15                     ;AAA9FC;

UNUSED_ExtendedSpritemaps_Torizo_AAA9FE:
    dw $0001,$0000,$0008                                                 ;AAA9FE;
    dw Spritemaps_Torizo_6                                               ;AAAA04;
    dw UNUSED_Hitboxes_Torizo_AA87DA                                     ;AAAA06;

UNUSED_ExtendedSpritemaps_Torizo_AAAA08:
    dw $0001,$0000,$0008                                                 ;AAAA08;
    dw Spritemaps_Torizo_7                                               ;AAAA0E;
    dw UNUSED_Hitboxes_Torizo_AA87DA                                     ;AAAA10;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0:
    dw $0001,$0000,$0000                                                 ;AAAA12;
    dw Spritemaps_Torizo_C                                               ;AAAA18;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_0                      ;AAAA1A;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1:
    dw $0001,$0000,$0000                                                 ;AAAA1C;
    dw Spritemaps_Torizo_D                                               ;AAAA22;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_1                      ;AAAA24;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2:
    dw $0001,$0000,$0000                                                 ;AAAA26;
    dw Spritemaps_Torizo_E                                               ;AAAA2C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_2                      ;AAAA2E;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3:
    dw $0001,$0000,$0000                                                 ;AAAA30;
    dw Spritemaps_Torizo_E_miscount                                      ;AAAA36;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_3                      ;AAAA38;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4:
    dw $0002,$FFFB,$FFE8                                                 ;AAAA3A;
    dw Spritemaps_Torizo_1D                                              ;AAAA40;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAAA42;
    dw $0000,$0000                                                       ;AAAA44;
    dw Spritemaps_Torizo_F                                               ;AAAA48;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_4                      ;AAAA4A;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5:
    dw $0002,$FFFB,$FFE8                                                 ;AAAA4C;
    dw Spritemaps_Torizo_1E                                              ;AAAA52;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAAA54;
    dw $0000,$0000                                                       ;AAAA56;
    dw Spritemaps_Torizo_10                                              ;AAAA5A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_5                      ;AAAA5C;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6:
    dw $0002,$FFFB,$FFE8                                                 ;AAAA5E;
    dw Spritemaps_Torizo_1E                                              ;AAAA64;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A                      ;AAAA66;
    dw $0000,$0000                                                       ;AAAA68;
    dw Spritemaps_Torizo_12                                              ;AAAA6C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_6                      ;AAAA6E;

UNUSED_ExtendedSpritemaps_Torizo_AAAA70:
    dw $0001,$0000,$0000                                                 ;AAAA70;
    dw Spritemaps_Torizo_8                                               ;AAAA76;
    dw Hitboxes_Torizo_Blank                                             ;AAAA78;

UNUSED_ExtendedSpritemaps_Torizo_AAAA7A:
    dw $0001,$0000,$0000                                                 ;AAAA7A;
    dw Spritemaps_Torizo_9                                               ;AAAA80;
    dw Hitboxes_Torizo_Blank                                             ;AAAA82;

UNUSED_ExtendedSpritemaps_Torizo_AAAA84:
    dw $0001,$0000,$0000                                                 ;AAAA84;
    dw Spritemaps_Torizo_A                                               ;AAAA8A;
    dw Hitboxes_Torizo_Blank                                             ;AAAA8C;

UNUSED_ExtendedSpritemaps_Torizo_AAAA8E:
    dw $0001,$0000,$0000                                                 ;AAAA8E;
    dw Spritemaps_Torizo_B                                               ;AAAA94;
    dw Hitboxes_Torizo_Blank                                             ;AAAA96;

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0:
    dw $0004,$000F,$FFE2                                                 ;AAAA98;
    dw Spritemaps_Torizo_30                                              ;AAAA9E;
    dw Hitboxes_Torizo_Blank                                             ;AAAAA0;
    dw $0005,$FFE8                                                       ;AAAAA2;
    dw Spritemaps_Torizo_45                                              ;AAAAA6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8                     ;AAAAA8;
    dw $0000,$0000                                                       ;AAAAAA;
    dw Spritemaps_Torizo_58                                              ;AAAAAE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAAB0;
    dw $0005,$FFE8                                                       ;AAAAB2;
    dw Spritemaps_Torizo_51                                              ;AAAAB6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_12                    ;AAAAB8;

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1:
    dw $0004,$000F,$FFE2                                                 ;AAAABA;
    dw Spritemaps_Torizo_30                                              ;AAAAC0;
    dw Hitboxes_Torizo_Blank                                             ;AAAAC2;
    dw $0005,$FFE7                                                       ;AAAAC4;
    dw Spritemaps_Torizo_46                                              ;AAAAC8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8                     ;AAAACA;
    dw $0000,$0000                                                       ;AAAACC;
    dw Spritemaps_Torizo_3D                                              ;AAAAD0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7                     ;AAAAD2;
    dw $0005,$FFE7                                                       ;AAAAD4;
    dw Spritemaps_Torizo_50                                              ;AAAAD8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_11                    ;AAAADA;

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2:
    dw $0004,$000F,$FFE1                                                 ;AAAADC;
    dw Spritemaps_Torizo_30                                              ;AAAAE2;
    dw Hitboxes_Torizo_Blank                                             ;AAAAE4;
    dw $0005,$FFE6                                                       ;AAAAE6;
    dw Spritemaps_Torizo_47                                              ;AAAAEA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAAAEC;
    dw $0000,$0000                                                       ;AAAAEE;
    dw Spritemaps_Torizo_3E                                              ;AAAAF2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7                     ;AAAAF4;
    dw $0005,$FFE6                                                       ;AAAAF6;
    dw Spritemaps_Torizo_4F                                              ;AAAAFA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_10                    ;AAAAFC;

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3:
    dw $0004,$000F,$FFE0                                                 ;AAAAFE;
    dw Spritemaps_Torizo_30                                              ;AAAB04;
    dw Hitboxes_Torizo_Blank                                             ;AAAB06;
    dw $0005,$FFE7                                                       ;AAAB08;
    dw Spritemaps_Torizo_48                                              ;AAAB0C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAB0E;
    dw $0000,$0000                                                       ;AAAB10;
    dw Spritemaps_Torizo_3F                                              ;AAAB14;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7                     ;AAAB16;
    dw $0005,$FFE7                                                       ;AAAB18;
    dw Spritemaps_Torizo_4E                                              ;AAAB1C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAAB1E;

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4:
    dw $0004,$000F,$FFE0                                                 ;AAAB20;
    dw Spritemaps_Torizo_30                                              ;AAAB26;
    dw Hitboxes_Torizo_Blank                                             ;AAAB28;
    dw $0005,$FFE8                                                       ;AAAB2A;
    dw Spritemaps_Torizo_49                                              ;AAAB2E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B                     ;AAAB30;
    dw $0000,$0000                                                       ;AAAB32;
    dw Spritemaps_Torizo_40                                              ;AAAB36;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7                     ;AAAB38;
    dw $0005,$FFE8                                                       ;AAAB3A;
    dw Spritemaps_Torizo_4D                                              ;AAAB3E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAAB40;

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0:
    dw $0004,$000F,$FFE2                                                 ;AAAB42;
    dw Spritemaps_Torizo_30                                              ;AAAB48;
    dw Hitboxes_Torizo_Blank                                             ;AAAB4A;
    dw $0005,$FFE8                                                       ;AAAB4C;
    dw Spritemaps_Torizo_49                                              ;AAAB50;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B                     ;AAAB52;
    dw $0000,$0000                                                       ;AAAB54;
    dw Spritemaps_Torizo_59                                              ;AAAB58;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAB5A;
    dw $0005,$FFE8                                                       ;AAAB5C;
    dw Spritemaps_Torizo_4D                                              ;AAAB60;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAAB62;

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1:
    dw $0004,$000F,$FFE1                                                 ;AAAB64;
    dw Spritemaps_Torizo_30                                              ;AAAB6A;
    dw Hitboxes_Torizo_Blank                                             ;AAAB6C;
    dw $0005,$FFE7                                                       ;AAAB6E;
    dw Spritemaps_Torizo_48                                              ;AAAB72;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAB74;
    dw $0000,$0000                                                       ;AAAB76;
    dw Spritemaps_Torizo_41                                              ;AAAB7A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7                     ;AAAB7C;
    dw $0005,$FFE7                                                       ;AAAB7E;
    dw Spritemaps_Torizo_4E                                              ;AAAB82;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAAB84;

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2:
    dw $0004,$000F,$FFE1                                                 ;AAAB86;
    dw Spritemaps_Torizo_30                                              ;AAAB8C;
    dw Hitboxes_Torizo_Blank                                             ;AAAB8E;
    dw $0005,$FFE6                                                       ;AAAB90;
    dw Spritemaps_Torizo_47                                              ;AAAB94;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAAB96;
    dw $0000,$0000                                                       ;AAAB98;
    dw Spritemaps_Torizo_42                                              ;AAAB9C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7                     ;AAAB9E;
    dw $0005,$FFE6                                                       ;AAABA0;
    dw Spritemaps_Torizo_4F                                              ;AAABA4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_10                    ;AAABA6;

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3:
    dw $0004,$000F,$FFE0                                                 ;AAABA8;
    dw Spritemaps_Torizo_30                                              ;AAABAE;
    dw Hitboxes_Torizo_Blank                                             ;AAABB0;
    dw $0005,$FFE7                                                       ;AAABB2;
    dw Spritemaps_Torizo_46                                              ;AAABB6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8                     ;AAABB8;
    dw $0000,$0000                                                       ;AAABBA;
    dw Spritemaps_Torizo_43                                              ;AAABBE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7                     ;AAABC0;
    dw $0005,$FFE7                                                       ;AAABC2;
    dw Spritemaps_Torizo_50                                              ;AAABC6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_11                    ;AAABC8;

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4:
    dw $0004,$000F,$FFE1                                                 ;AAABCA;
    dw Spritemaps_Torizo_30                                              ;AAABD0;
    dw Hitboxes_Torizo_Blank                                             ;AAABD2;
    dw $0005,$FFE8                                                       ;AAABD4;
    dw Spritemaps_Torizo_45                                              ;AAABD8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8                     ;AAABDA;
    dw $0000,$0000                                                       ;AAABDC;
    dw Spritemaps_Torizo_44                                              ;AAABE0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7                     ;AAABE2;
    dw $0005,$FFE8                                                       ;AAABE4;
    dw Spritemaps_Torizo_51                                              ;AAABE8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_12                    ;AAABEA;

ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward:
    dw $0003,$000F,$FFE1                                                 ;AAABEC;
    dw Spritemaps_Torizo_30                                              ;AAABF2;
    dw Hitboxes_Torizo_Blank                                             ;AAABF4;
    dw $0004,$FFE7                                                       ;AAABF6;
    dw Spritemaps_Torizo_47                                              ;AAABFA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAABFC;
    dw $0000,$0000                                                       ;AAABFE;
    dw Spritemaps_Torizo_59                                              ;AAAC02;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAC04;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0:
    dw $0003,$0009,$FFE1                                                 ;AAAC06;
    dw Spritemaps_Torizo_31                                              ;AAAC0C;
    dw Hitboxes_Torizo_Blank                                             ;AAAC0E;
    dw $0004,$FFE7                                                       ;AAAC10;
    dw Spritemaps_Torizo_48                                              ;AAAC14;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAC16;
    dw $0000,$0000                                                       ;AAAC18;
    dw Spritemaps_Torizo_59                                              ;AAAC1C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAC1E;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1:
    dw $0003,$0009,$FFE1                                                 ;AAAC20;
    dw Spritemaps_Torizo_32                                              ;AAAC26;
    dw Hitboxes_Torizo_Blank                                             ;AAAC28;
    dw $0004,$FFE7                                                       ;AAAC2A;
    dw Spritemaps_Torizo_49                                              ;AAAC2E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B                     ;AAAC30;
    dw $0000,$0000                                                       ;AAAC32;
    dw Spritemaps_Torizo_59                                              ;AAAC36;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAC38;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2:
    dw $0003,$0009,$FFE1                                                 ;AAAC3A;
    dw Spritemaps_Torizo_33                                              ;AAAC40;
    dw Hitboxes_Torizo_Blank                                             ;AAAC42;
    dw $0004,$FFE7                                                       ;AAAC44;
    dw Spritemaps_Torizo_4A                                              ;AAAC48;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C                     ;AAAC4A;
    dw $0000,$0000                                                       ;AAAC4C;
    dw Spritemaps_Torizo_59                                              ;AAAC50;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAC52;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3:
    dw $0003,$0004,$FFE7                                                 ;AAAC54;
    dw Spritemaps_Torizo_4B                                              ;AAAC5A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D                     ;AAAC5C;
    dw $0009,$FFE1                                                       ;AAAC5E;
    dw Spritemaps_Torizo_34                                              ;AAAC62;
    dw Hitboxes_Torizo_Blank                                             ;AAAC64;
    dw $0000,$0000                                                       ;AAAC66;
    dw Spritemaps_Torizo_59                                              ;AAAC6A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAC6C;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4:
    dw $0003,$0004,$FFE7                                                 ;AAAC6E;
    dw Spritemaps_Torizo_4B                                              ;AAAC74;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D                     ;AAAC76;
    dw $0009,$FFE1                                                       ;AAAC78;
    dw Spritemaps_Torizo_35                                              ;AAAC7C;
    dw Hitboxes_Torizo_Blank                                             ;AAAC7E;
    dw $0000,$0000                                                       ;AAAC80;
    dw Spritemaps_Torizo_59                                              ;AAAC84;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAC86;

ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward:
    dw $0003,$000F,$FFE1                                                 ;AAAC88;
    dw Spritemaps_Torizo_30                                              ;AAAC8E;
    dw Hitboxes_Torizo_Blank                                             ;AAAC90;
    dw $0004,$FFE7                                                       ;AAAC92;
    dw Spritemaps_Torizo_46                                              ;AAAC96;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8                     ;AAAC98;
    dw $0000,$0000                                                       ;AAAC9A;
    dw Spritemaps_Torizo_58                                              ;AAAC9E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAACA0;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0:
    dw $0003,$0009,$FFE1                                                 ;AAACA2;
    dw Spritemaps_Torizo_31                                              ;AAACA8;
    dw Hitboxes_Torizo_Blank                                             ;AAACAA;
    dw $0004,$FFE7                                                       ;AAACAC;
    dw Spritemaps_Torizo_48                                              ;AAACB0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAACB2;
    dw $0000,$0000                                                       ;AAACB4;
    dw Spritemaps_Torizo_58                                              ;AAACB8;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAACBA;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1:
    dw $0003,$0009,$FFE1                                                 ;AAACBC;
    dw Spritemaps_Torizo_32                                              ;AAACC2;
    dw Hitboxes_Torizo_Blank                                             ;AAACC4;
    dw $0004,$FFE7                                                       ;AAACC6;
    dw Spritemaps_Torizo_49                                              ;AAACCA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B                     ;AAACCC;
    dw $0000,$0000                                                       ;AAACCE;
    dw Spritemaps_Torizo_58                                              ;AAACD2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAACD4;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2:
    dw $0003,$0009,$FFE1                                                 ;AAACD6;
    dw Spritemaps_Torizo_33                                              ;AAACDC;
    dw Hitboxes_Torizo_Blank                                             ;AAACDE;
    dw $0004,$FFE7                                                       ;AAACE0;
    dw Spritemaps_Torizo_4A                                              ;AAACE4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C                     ;AAACE6;
    dw $0000,$0000                                                       ;AAACE8;
    dw Spritemaps_Torizo_58                                              ;AAACEC;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAACEE;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3:
    dw $0003,$0004,$FFE7                                                 ;AAACF0;
    dw Spritemaps_Torizo_4B                                              ;AAACF6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D                     ;AAACF8;
    dw $0009,$FFE1                                                       ;AAACFA;
    dw Spritemaps_Torizo_34                                              ;AAACFE;
    dw Hitboxes_Torizo_Blank                                             ;AAAD00;
    dw $0000,$0000                                                       ;AAAD02;
    dw Spritemaps_Torizo_58                                              ;AAAD06;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAD08;

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4:
    dw $0003,$0004,$FFE7                                                 ;AAAD0A;
    dw Spritemaps_Torizo_4B                                              ;AAAD10;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D                     ;AAAD12;
    dw $0009,$FFE1                                                       ;AAAD14;
    dw Spritemaps_Torizo_35                                              ;AAAD18;
    dw Hitboxes_Torizo_Blank                                             ;AAAD1A;
    dw $0000,$0000                                                       ;AAAD1C;
    dw Spritemaps_Torizo_58                                              ;AAAD20;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAD22;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0:
    dw $0003,$000F,$FFE1                                                 ;AAAD24;
    dw Spritemaps_Torizo_30                                              ;AAAD2A;
    dw Hitboxes_Torizo_Blank                                             ;AAAD2C;
    dw $0004,$FFE7                                                       ;AAAD2E;
    dw Spritemaps_Torizo_48                                              ;AAAD32;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAD34;
    dw $0000,$0000                                                       ;AAAD36;
    dw Spritemaps_Torizo_59                                              ;AAAD3A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAD3C;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1:
    dw $0004,$000F,$FFE1                                                 ;AAAD3E;
    dw Spritemaps_Torizo_30                                              ;AAAD44;
    dw Hitboxes_Torizo_Blank                                             ;AAAD46;
    dw $0004,$FFE7                                                       ;AAAD48;
    dw Spritemaps_Torizo_48                                              ;AAAD4C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAD4E;
    dw $0000,$0000                                                       ;AAAD50;
    dw Spritemaps_Torizo_59                                              ;AAAD54;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAD56;
    dw $0004,$FFE7                                                       ;AAAD58;
    dw Spritemaps_Torizo_51                                              ;AAAD5C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_12                    ;AAAD5E;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2:
    dw $0004,$0004,$FFE7                                                 ;AAAD60;
    dw Spritemaps_Torizo_48                                              ;AAAD66;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAD68;
    dw $000F,$FFE1                                                       ;AAAD6A;
    dw Spritemaps_Torizo_30                                              ;AAAD6E;
    dw Hitboxes_Torizo_Blank                                             ;AAAD70;
    dw $0000,$0000                                                       ;AAAD72;
    dw Spritemaps_Torizo_59                                              ;AAAD76;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAD78;
    dw $0004,$FFE7                                                       ;AAAD7A;
    dw Spritemaps_Torizo_52                                              ;AAAD7E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_13                    ;AAAD80;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3:
    dw $0004,$0004,$FFE7                                                 ;AAAD82;
    dw Spritemaps_Torizo_48                                              ;AAAD88;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAD8A;
    dw $000F,$FFE1                                                       ;AAAD8C;
    dw Spritemaps_Torizo_30                                              ;AAAD90;
    dw Hitboxes_Torizo_Blank                                             ;AAAD92;
    dw $0000,$0000                                                       ;AAAD94;
    dw Spritemaps_Torizo_59                                              ;AAAD98;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAD9A;
    dw $0004,$FFE7                                                       ;AAAD9C;
    dw Spritemaps_Torizo_53                                              ;AAADA0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_14                    ;AAADA2;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4:
    dw $0004,$0004,$FFE7                                                 ;AAADA4;
    dw Spritemaps_Torizo_48                                              ;AAADAA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAADAC;
    dw $000F,$FFE1                                                       ;AAADAE;
    dw Spritemaps_Torizo_30                                              ;AAADB2;
    dw Hitboxes_Torizo_Blank                                             ;AAADB4;
    dw $0000,$0000                                                       ;AAADB6;
    dw Spritemaps_Torizo_59                                              ;AAADBA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAADBC;
    dw $0004,$FFE7                                                       ;AAADBE;
    dw Spritemaps_Torizo_54                                              ;AAADC2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_15                    ;AAADC4;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5:
    dw $0004,$000F,$FFE1                                                 ;AAADC6;
    dw Spritemaps_Torizo_30                                              ;AAADCC;
    dw Hitboxes_Torizo_Blank                                             ;AAADCE;
    dw $0004,$FFE7                                                       ;AAADD0;
    dw Spritemaps_Torizo_48                                              ;AAADD4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAADD6;
    dw $0000,$0000                                                       ;AAADD8;
    dw Spritemaps_Torizo_59                                              ;AAADDC;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAADDE;
    dw $0004,$FFE7                                                       ;AAADE0;
    dw Spritemaps_Torizo_4E                                              ;AAADE4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAADE6;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6:
    dw $0004,$000F,$FFE1                                                 ;AAADE8;
    dw Spritemaps_Torizo_30                                              ;AAADEE;
    dw Hitboxes_Torizo_Blank                                             ;AAADF0;
    dw $0004,$FFE7                                                       ;AAADF2;
    dw Spritemaps_Torizo_49                                              ;AAADF6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B                     ;AAADF8;
    dw $0000,$0000                                                       ;AAADFA;
    dw Spritemaps_Torizo_59                                              ;AAADFE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAE00;
    dw $0004,$FFE7                                                       ;AAAE02;
    dw Spritemaps_Torizo_4E                                              ;AAAE06;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAAE08;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7:
    dw $0004,$000F,$FFE1                                                 ;AAAE0A;
    dw Spritemaps_Torizo_30                                              ;AAAE10;
    dw Hitboxes_Torizo_Blank                                             ;AAAE12;
    dw $0004,$FFE7                                                       ;AAAE14;
    dw Spritemaps_Torizo_4A                                              ;AAAE18;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C                     ;AAAE1A;
    dw $0000,$0000                                                       ;AAAE1C;
    dw Spritemaps_Torizo_59                                              ;AAAE20;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAE22;
    dw $0004,$FFE7                                                       ;AAAE24;
    dw Spritemaps_Torizo_4E                                              ;AAAE28;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAAE2A;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8:
    dw $0004,$0004,$FFE7                                                 ;AAAE2C;
    dw Spritemaps_Torizo_4B                                              ;AAAE32;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D                     ;AAAE34;
    dw $000F,$FFE1                                                       ;AAAE36;
    dw Spritemaps_Torizo_30                                              ;AAAE3A;
    dw Hitboxes_Torizo_Blank                                             ;AAAE3C;
    dw $0000,$0000                                                       ;AAAE3E;
    dw Spritemaps_Torizo_59                                              ;AAAE42;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAE44;
    dw $0004,$FFE7                                                       ;AAAE46;
    dw Spritemaps_Torizo_4E                                              ;AAAE4A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAAE4C;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9:
    dw $0004,$0004,$FFE7                                                 ;AAAE4E;
    dw Spritemaps_Torizo_4C                                              ;AAAE54;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_E                     ;AAAE56;
    dw $000F,$FFE1                                                       ;AAAE58;
    dw Spritemaps_Torizo_30                                              ;AAAE5C;
    dw Hitboxes_Torizo_Blank                                             ;AAAE5E;
    dw $0000,$0000                                                       ;AAAE60;
    dw Spritemaps_Torizo_59                                              ;AAAE64;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAE66;
    dw $0004,$FFE7                                                       ;AAAE68;
    dw Spritemaps_Torizo_4E                                              ;AAAE6C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F                     ;AAAE6E;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0:
    dw $0003,$000F,$FFE1                                                 ;AAAE70;
    dw Spritemaps_Torizo_30                                              ;AAAE76;
    dw Hitboxes_Torizo_Blank                                             ;AAAE78;
    dw $0004,$FFE7                                                       ;AAAE7A;
    dw Spritemaps_Torizo_48                                              ;AAAE7E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAE80;
    dw $0000,$0000                                                       ;AAAE82;
    dw Spritemaps_Torizo_58                                              ;AAAE86;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAE88;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1:
    dw $0003,$000F,$FFE1                                                 ;AAAE8A;
    dw Spritemaps_Torizo_30                                              ;AAAE90;
    dw Hitboxes_Torizo_Blank                                             ;AAAE92;
    dw $0004,$FFE7                                                       ;AAAE94;
    dw Spritemaps_Torizo_49                                              ;AAAE98;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B                     ;AAAE9A;
    dw $0000,$0000                                                       ;AAAE9C;
    dw Spritemaps_Torizo_58                                              ;AAAEA0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAEA2;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2:
    dw $0003,$0004,$FFE7                                                 ;AAAEA4;
    dw Spritemaps_Torizo_4A                                              ;AAAEAA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C                     ;AAAEAC;
    dw $000F,$FFE1                                                       ;AAAEAE;
    dw Spritemaps_Torizo_30                                              ;AAAEB2;
    dw Hitboxes_Torizo_Blank                                             ;AAAEB4;
    dw $0000,$0000                                                       ;AAAEB6;
    dw Spritemaps_Torizo_58                                              ;AAAEBA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAEBC;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3:
    dw $0003,$0004,$FFE7                                                 ;AAAEBE;
    dw Spritemaps_Torizo_4B                                              ;AAAEC4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D                     ;AAAEC6;
    dw $000F,$FFE1                                                       ;AAAEC8;
    dw Spritemaps_Torizo_30                                              ;AAAECC;
    dw Hitboxes_Torizo_Blank                                             ;AAAECE;
    dw $0000,$0000                                                       ;AAAED0;
    dw Spritemaps_Torizo_58                                              ;AAAED4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAED6;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4:
    dw $0003,$0004,$FFE7                                                 ;AAAED8;
    dw Spritemaps_Torizo_4C                                              ;AAAEDE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_E                     ;AAAEE0;
    dw $000F,$FFE1                                                       ;AAAEE2;
    dw Spritemaps_Torizo_30                                              ;AAAEE6;
    dw Hitboxes_Torizo_Blank                                             ;AAAEE8;
    dw $0000,$0000                                                       ;AAAEEA;
    dw Spritemaps_Torizo_58                                              ;AAAEEE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAEF0;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5:
    dw $0004,$000F,$FFE1                                                 ;AAAEF2;
    dw Spritemaps_Torizo_30                                              ;AAAEF8;
    dw Hitboxes_Torizo_Blank                                             ;AAAEFA;
    dw $0004,$FFE7                                                       ;AAAEFC;
    dw Spritemaps_Torizo_47                                              ;AAAF00;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAAF02;
    dw $0000,$0000                                                       ;AAAF04;
    dw Spritemaps_Torizo_58                                              ;AAAF08;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAF0A;
    dw $0004,$FFE7                                                       ;AAAF0C;
    dw Spritemaps_Torizo_50                                              ;AAAF10;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_11                    ;AAAF12;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6:
    dw $0004,$000F,$FFE1                                                 ;AAAF14;
    dw Spritemaps_Torizo_30                                              ;AAAF1A;
    dw Hitboxes_Torizo_Blank                                             ;AAAF1C;
    dw $0004,$FFE7                                                       ;AAAF1E;
    dw Spritemaps_Torizo_47                                              ;AAAF22;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAAF24;
    dw $0000,$0000                                                       ;AAAF26;
    dw Spritemaps_Torizo_58                                              ;AAAF2A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAF2C;
    dw $0004,$FFE7                                                       ;AAAF2E;
    dw Spritemaps_Torizo_51                                              ;AAAF32;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_12                    ;AAAF34;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7:
    dw $0004,$000F,$FFE1                                                 ;AAAF36;
    dw Spritemaps_Torizo_30                                              ;AAAF3C;
    dw Hitboxes_Torizo_Blank                                             ;AAAF3E;
    dw $0004,$FFE7                                                       ;AAAF40;
    dw Spritemaps_Torizo_47                                              ;AAAF44;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAAF46;
    dw $0000,$0000                                                       ;AAAF48;
    dw Spritemaps_Torizo_58                                              ;AAAF4C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAF4E;
    dw $0004,$FFE7                                                       ;AAAF50;
    dw Spritemaps_Torizo_52                                              ;AAAF54;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_13                    ;AAAF56;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8:
    dw $0004,$0004,$FFE7                                                 ;AAAF58;
    dw Spritemaps_Torizo_47                                              ;AAAF5E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAAF60;
    dw $000F,$FFE1                                                       ;AAAF62;
    dw Spritemaps_Torizo_30                                              ;AAAF66;
    dw Hitboxes_Torizo_Blank                                             ;AAAF68;
    dw $0000,$0000                                                       ;AAAF6A;
    dw Spritemaps_Torizo_58                                              ;AAAF6E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAF70;
    dw $0004,$FFE7                                                       ;AAAF72;
    dw Spritemaps_Torizo_53                                              ;AAAF76;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_14                    ;AAAF78;

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9:
    dw $0004,$0004,$FFE7                                                 ;AAAF7A;
    dw Spritemaps_Torizo_47                                              ;AAAF80;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAAF82;
    dw $000F,$FFE1                                                       ;AAAF84;
    dw Spritemaps_Torizo_30                                              ;AAAF88;
    dw Hitboxes_Torizo_Blank                                             ;AAAF8A;
    dw $0000,$0000                                                       ;AAAF8C;
    dw Spritemaps_Torizo_58                                              ;AAAF90;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17                    ;AAAF92;
    dw $0004,$FFE7                                                       ;AAAF94;
    dw Spritemaps_Torizo_54                                              ;AAAF98;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_15                    ;AAAF9A;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_0:
    dw $0001,$0000,$0000                                                 ;AAAF9C;
    dw Spritemaps_Torizo_36                                              ;AAAFA2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_0                     ;AAAFA4;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1:
    dw $0001,$0000,$0000                                                 ;AAAFA6;
    dw Spritemaps_Torizo_37                                              ;AAAFAC;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_1                     ;AAAFAE;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2:
    dw $0001,$0000,$0000                                                 ;AAAFB0;
    dw Spritemaps_Torizo_38                                              ;AAAFB6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_2                     ;AAAFB8;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3:
    dw $0001,$0000,$0000                                                 ;AAAFBA;
    dw Spritemaps_Torizo_39                                              ;AAAFC0;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_3                     ;AAAFC2;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4:
    dw $0002,$0005,$FFE8                                                 ;AAAFC4;
    dw Spritemaps_Torizo_47                                              ;AAAFCA;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAAFCC;
    dw $0000,$0000                                                       ;AAAFCE;
    dw Spritemaps_Torizo_3A                                              ;AAAFD2;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_4                     ;AAAFD4;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5:
    dw $0002,$0005,$FFE8                                                 ;AAAFD6;
    dw Spritemaps_Torizo_48                                              ;AAAFDC;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAFDE;
    dw $0000,$0000                                                       ;AAAFE0;
    dw Spritemaps_Torizo_3B                                              ;AAAFE4;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_5                     ;AAAFE6;

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6:
    dw $0002,$0005,$FFE8                                                 ;AAAFE8;
    dw Spritemaps_Torizo_48                                              ;AAAFEE;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A                     ;AAAFF0;
    dw $0000,$0000                                                       ;AAAFF2;
    dw Spritemaps_Torizo_3C                                              ;AAAFF6;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_6                     ;AAAFF8;

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0:
    dw $0003,$FFF0,$FFE3                                                 ;AAAFFA;
    dw Spritemaps_Torizo_0                                               ;AAB000;
    dw Hitboxes_Torizo_Blank                                             ;AAB002;
    dw $FFFC,$FFEA                                                       ;AAB004;
    dw Spritemaps_Torizo_1D                                              ;AAB008;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9                      ;AAB00A;
    dw $0000,$0000                                                       ;AAB00C;
    dw Spritemaps_Torizo_2B                                              ;AAB010;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16                     ;AAB012;

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1:
    dw $0003,$FFF0,$FFE2                                                 ;AAB014;
    dw Spritemaps_Torizo_0                                               ;AAB01A;
    dw Hitboxes_Torizo_Blank                                             ;AAB01C;
    dw $FFFC,$FFE8                                                       ;AAB01E;
    dw Spritemaps_Torizo_1C                                              ;AAB022;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8                      ;AAB024;
    dw $0000,$0000                                                       ;AAB026;
    dw Spritemaps_Torizo_2C                                              ;AAB02A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16                     ;AAB02C;

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2:
    dw $0003,$FFF0,$FFE2                                                 ;AAB02E;
    dw Spritemaps_Torizo_0                                               ;AAB034;
    dw Hitboxes_Torizo_Blank                                             ;AAB036;
    dw $FFFD,$FFE8                                                       ;AAB038;
    dw Spritemaps_Torizo_1B                                              ;AAB03C;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8                      ;AAB03E;
    dw $0000,$0000                                                       ;AAB040;
    dw Spritemaps_Torizo_2D                                              ;AAB044;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16                     ;AAB046;

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0:
    dw $0003,$000F,$FFE4                                                 ;AAB048;
    dw Spritemaps_Torizo_30                                              ;AAB04E;
    dw Hitboxes_Torizo_Blank                                             ;AAB050;
    dw $0004,$FFEA                                                       ;AAB052;
    dw Spritemaps_Torizo_47                                              ;AAB056;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9                     ;AAB058;
    dw $0000,$0000                                                       ;AAB05A;
    dw Spritemaps_Torizo_55                                              ;AAB05E;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16                    ;AAB060;

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1:
    dw $0003,$000F,$FFE3                                                 ;AAB062;
    dw Spritemaps_Torizo_30                                              ;AAB068;
    dw Hitboxes_Torizo_Blank                                             ;AAB06A;
    dw $0004,$FFE8                                                       ;AAB06C;
    dw Spritemaps_Torizo_46                                              ;AAB070;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8                     ;AAB072;
    dw $0000,$0000                                                       ;AAB074;
    dw Spritemaps_Torizo_56                                              ;AAB078;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16                    ;AAB07A;

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2:
    dw $0003,$000F,$FFE3                                                 ;AAB07C;
    dw Spritemaps_Torizo_30                                              ;AAB082;
    dw Hitboxes_Torizo_Blank                                             ;AAB084;
    dw $0003,$FFE8                                                       ;AAB086;
    dw Spritemaps_Torizo_45                                              ;AAB08A;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8                     ;AAB08C;
    dw $0000,$0000                                                       ;AAB08E;
    dw Spritemaps_Torizo_57                                              ;AAB092;
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16                    ;AAB094;

TorizoMusicTracks_song1:
    dw $0006                                                             ;AAB096;

TorizoMusicTracks_song0:
    dw $0005                                                             ;AAB098;

TorizoMusicTracks_elevator:
    dw $0003                                                             ;AAB09A;

Instruction_Torizo_FunctionInY:
    LDA.W $0000,Y                                                        ;AAB09C;
    STA.W EnemyData.work4,X                                              ;AAB09F;
    INY                                                                  ;AAB0A2;
    INY                                                                  ;AAB0A3;
    RTL                                                                  ;AAB0A4;


Tiles_Blank:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB0A5;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB0B5;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB0C5;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB0D5;

InstList_Torizo_SpecialCallable_BlowUpBombTorizosGut:
    dw Instruction_Torizo_FunctionInY                                    ;AAB0E5;
    dw RTS_AAC6AB                                                        ;AAB0E7;
    dw Instruction_Torizo_SetAnimationLock                               ;AAB0E9;
    dw Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames      ;AAB0EB;
    dw $0000                                                             ;AAB0ED;
    dw Instruction_Torizo_MarkBTGutBlownUp_Spawn6BTDroolProjectiles      ;AAB0EF;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB0F1;
    dw $0040                                                             ;AAB0F3;
    dl Tiles_Torizo_AAB479                                               ;AAB0F5;
    dw $7300                                                             ;AAB0F8;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB0FA;
    dw $0040                                                             ;AAB0FC;
    dl Tiles_Torizo_AAB679                                               ;AAB0FE;
    dw $7400                                                             ;AAB101;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB103;
    dw $0020                                                             ;AAB105;
    dl Tiles_Torizo_AAB4B9                                               ;AAB107;
    dw $7E70                                                             ;AAB10A;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB10C;
    dw $0020                                                             ;AAB10E;
    dl Tiles_Torizo_AAB6B9                                               ;AAB110;
    dw $7F70                                                             ;AAB113;
    dw Instruction_Torizo_FunctionInY                                    ;AAB115;
    dw Function_Torizo_NormalMovement                                    ;AAB117;
    dw Instruction_Torizo_ClearAnimationLock                             ;AAB119;
    dw Instruction_Torizo_GotoGutExplosionLinkInstruction                ;AAB11B;

Instruction_Torizo_MarkBTGutBlownUp_Spawn6BTDroolProjectiles:
    LDA.W EnemyData.initParam1,X                                         ;AAB11D;
    ORA.W #$8000                                                         ;AAB120;
    STA.W EnemyData.initParam1,X                                         ;AAB123;
    PHX                                                                  ;AAB126;
    PHY                                                                  ;AAB127;
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool                     ;AAB128;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAB12B;
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool                     ;AAB12F;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAB132;
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool                     ;AAB136;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAB139;
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool                     ;AAB13D;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAB140;
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool                     ;AAB144;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAB147;
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool                     ;AAB14B;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAB14E;
    PLY                                                                  ;AAB152;
    PLX                                                                  ;AAB153;
    RTL                                                                  ;AAB154;


InstList_Torizo_Callable_BlowUpBombTorizosFace:
    dw Instruction_Torizo_FunctionInY                                    ;AAB155;
    dw RTS_AAC6AB                                                        ;AAB157;
    dw Instruction_Torizo_SetAnimationLock                               ;AAB159;
    dw Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames      ;AAB15B;
    dw $0006                                                             ;AAB15D;
    dw Instruction_Torizo_MarkBombTorizoFaceBlownUp                      ;AAB15F;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB161;
    dw $0020                                                             ;AAB163;
    dl Tiles_Torizo_AAB4D9                                               ;AAB165;
    dw $7E50                                                             ;AAB168;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB16A;
    dw $0020                                                             ;AAB16C;
    dl Tiles_Torizo_AAB6D9                                               ;AAB16E;
    dw $7F50                                                             ;AAB171;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB173;
    dw $0040                                                             ;AAB175;
    dl Tiles_Blank                                                       ;AAB177;
    dw $7C80                                                             ;AAB17A;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB17C;
    dw $0040                                                             ;AAB17E;
    dl Tiles_Blank                                                       ;AAB180;
    dw $7CA0                                                             ;AAB183;
    dw Instruction_Common_WaitYFrames                                    ;AAB185;
    dw $0001                                                             ;AAB187;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB189;
    dw $0040                                                             ;AAB18B;
    dl Tiles_Blank                                                       ;AAB18D;
    dw $7D80                                                             ;AAB190;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB192;
    dw $0040                                                             ;AAB194;
    dl Tiles_Blank                                                       ;AAB196;
    dw $7DA0                                                             ;AAB199;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB19B;
    dw $0040                                                             ;AAB19D;
    dl Tiles_Blank                                                       ;AAB19F;
    dw $7E80                                                             ;AAB1A2;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB1A4;
    dw $0040                                                             ;AAB1A6;
    dl Tiles_Blank                                                       ;AAB1A8;
    dw $7F80                                                             ;AAB1AB;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB1AD;
    dw $0020                                                             ;AAB1AF;
    dl Tiles_Blank                                                       ;AAB1B1;
    dw $79F0                                                             ;AAB1B4;
    dw Instruction_Torizo_FunctionInY                                    ;AAB1B6;
    dw Function_Torizo_NormalMovement                                    ;AAB1B8;
    dw Instruction_Torizo_ClearAnimationLock                             ;AAB1BA;
    dw Instruction_Torizo_Return                                         ;AAB1BC;

Instruction_Torizo_MarkBombTorizoFaceBlownUp:
    LDA.W EnemyData.initParam1,X                                         ;AAB1BE;
    ORA.W #$4000                                                         ;AAB1C1;
    STA.W EnemyData.initParam1,X                                         ;AAB1C4;
    RTL                                                                  ;AAB1C7;


InstList_Torizo_DeathSequence_0:
    dw Instruction_Torizo_FunctionInY                                    ;AAB1C8;
    dw RTS_AAC6AB                                                        ;AAB1CA;
    dw Instruction_Torizo_SetAnimationLock                               ;AAB1CC;
    dw Instruction_Common_TimerInY                                       ;AAB1CE;
    dw $0008                                                             ;AAB1D0;

InstList_Torizo_DeathSequence_1:
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame      ;AAB1D2;
    dw Instruction_Common_WaitYFrames                                    ;AAB1D4;
    dw $0006                                                             ;AAB1D6;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAB1D8;
    dw InstList_Torizo_DeathSequence_1                                   ;AAB1DA;
    dw Instruction_Torizo_SetupPaletteTransitionToBlack                  ;AAB1DC;
    dw Instruction_Common_TimerInY                                       ;AAB1DE;
    dw $000E                                                             ;AAB1E0;

InstList_Torizo_DeathSequence_2:
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame      ;AAB1E2;
    dw Instruction_Torizo_SetAsVisible                                   ;AAB1E4;
    dw Instruction_Common_WaitYFrames                                    ;AAB1E6;
    dw $0002                                                             ;AAB1E8;
    dw Instruction_Torizo_SetAsInvisible                                 ;AAB1EA;
    dw Instruction_Common_WaitYFrames                                    ;AAB1EC;
    dw $0002                                                             ;AAB1EE;
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame      ;AAB1F0;
    dw Instruction_Torizo_SetAsVisible                                   ;AAB1F2;
    dw Instruction_Common_WaitYFrames                                    ;AAB1F4;
    dw $0002                                                             ;AAB1F6;
    dw Instruction_Torizo_SetAsInvisible                                 ;AAB1F8;
    dw Instruction_Common_WaitYFrames                                    ;AAB1FA;
    dw $0002                                                             ;AAB1FC;
    dw Instruction_Torizo_SetAsVisible                                   ;AAB1FE;
    dw Instruction_Common_WaitYFrames                                    ;AAB200;
    dw $0002                                                             ;AAB202;
    dw Instruction_Torizo_SetAsInvisible                                 ;AAB204;
    dw Instruction_Common_WaitYFrames                                    ;AAB206;
    dw $0002                                                             ;AAB208;
    dw Instruction_Torizo_SetAsVisible                                   ;AAB20A;
    dw Instruction_Common_WaitYFrames                                    ;AAB20C;
    dw $0002                                                             ;AAB20E;
    dw Instruction_Torizo_SetAsInvisible                                 ;AAB210;
    dw Instruction_Common_WaitYFrames                                    ;AAB212;
    dw $0002                                                             ;AAB214;
    dw Instruction_Torizo_AdvanceGradualColorChange                      ;AAB216;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAB218;
    dw InstList_Torizo_DeathSequence_2                                   ;AAB21A;
    dw Instruction_Common_WaitYFrames                                    ;AAB21C;
    dw $0040                                                             ;AAB21E;
    dw Instruction_Torizo_SetBossBit_QueueElevatorMusic_SpawnDrops       ;AAB220;
    dw Instruction_Common_DeleteEnemy                                    ;AAB222;

Instruction_Torizo_SetAsVisible:
    LDA.W EnemyData.properties,X                                         ;AAB224;
    AND.W #$FEFF                                                         ;AAB227;
    STA.W EnemyData.properties,X                                         ;AAB22A;
    RTL                                                                  ;AAB22D;


Instruction_Torizo_SetAsInvisible:
    LDA.W EnemyData.properties,X                                         ;AAB22E;
    ORA.W #$0100                                                         ;AAB231;
    STA.W EnemyData.properties,X                                         ;AAB234;
    RTL                                                                  ;AAB237;


Instruction_Torizo_SetupPaletteTransitionToBlack:
    PHX                                                                  ;AAB238;
    LDX.W #$001E                                                         ;AAB239;
    LDA.W #$0000                                                         ;AAB23C;

.loop:
    STA.L $7EC340,X                                                      ;AAB23F;
    STA.L $7EC320,X                                                      ;AAB243;
    DEX                                                                  ;AAB247;
    DEX                                                                  ;AAB248;
    BPL .loop                                                            ;AAB249;
    PLX                                                                  ;AAB24B;
    RTL                                                                  ;AAB24C;


Instruction_Torizo_SetBossBit_QueueElevatorMusic_SpawnDrops:
    LDA.W #$0004                                                         ;AAB24D;
    JSL.L SetBossBitsInAForCurrentArea                                   ;AAB250;
    LDA.W TorizoMusicTracks_elevator                                     ;AAB254;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;AAB257;
    PHY                                                                  ;AAB25B;
    PHX                                                                  ;AAB25C;
    PHP                                                                  ;AAB25D;
    LDA.W $079F                                                          ;AAB25E;
    BNE .notCrateria                                                     ;AAB261;
    JSL.L BombTorizoDeathItemDropRoutine                                 ;AAB263;
    BRA .return                                                          ;AAB267;


.notCrateria:
    JSL.L GoldenTorizoDeathItemDropRoutine                               ;AAB269;

.return:
    PLP                                                                  ;AAB26D;
    PLX                                                                  ;AAB26E;
    PLY                                                                  ;AAB26F;
    RTL                                                                  ;AAB270;


Instruction_Torizo_AdvanceGradualColorChange:
    LDA.W #$0600                                                         ;AAB271;
    JSL.L Advance_GradualColorChange_ofPalettesInA_Denominator_C         ;AAB274;
    RTL                                                                  ;AAB278;


Tiles_Torizo:
    db $34,$2C,$4D,$7D,$5F,$7F,$1E,$7F,$9C,$FF,$B9,$FE,$BB,$FD,$7B,$BE   ;AAB279;
    db $7F,$00,$3A,$00,$DB,$00,$D7,$00,$37,$00,$EE,$00,$AF,$00,$ED,$00   ;AAB289;
    db $B7,$B7,$FF,$FF,$D5,$F5,$6A,$BA,$FE,$5E,$DA,$BA,$94,$74,$38,$F8   ;AAB299;
    db $78,$10,$11,$01,$EB,$01,$D6,$02,$76,$06,$B6,$02,$7E,$04,$EC,$08   ;AAB2A9;

Tiles_Torizo_AAB2B9:
    db $34,$2C,$4D,$7D,$5F,$7F,$1E,$7F,$9C,$FF,$B9,$FF,$BB,$FE,$7C,$BE   ;AAB2B9;
    db $7F,$00,$3A,$00,$DB,$00,$D7,$00,$36,$00,$EC,$00,$AD,$01,$EB,$03   ;AAB2C9;
    db $B7,$B7,$FF,$FF,$F5,$F5,$6A,$FA,$BE,$FE,$DA,$3A,$34,$74,$78,$F8   ;AAB2D9;
    db $78,$10,$11,$01,$CB,$01,$96,$02,$56,$66,$F6,$E2,$DE,$C4,$AC,$88   ;AAB2E9;

Tiles_Torizo_AAB2F9:
    db $34,$2C,$4D,$7D,$5F,$7F,$1E,$7F,$9D,$FF,$BB,$FE,$BC,$FE,$7D,$BE   ;AAB2F9;
    db $7F,$00,$3A,$00,$DB,$00,$D7,$00,$36,$01,$ED,$03,$AB,$03,$EB,$03   ;AAB309;
    db $B7,$B7,$FF,$FF,$F5,$F5,$EA,$FA,$3E,$FE,$5A,$3A,$54,$34,$B8,$78   ;AAB319;
    db $78,$10,$11,$01,$CB,$01,$16,$02,$D6,$E6,$F6,$E2,$FE,$E4,$EC,$C8   ;AAB329;

Tiles_Torizo_AAB339:
    db $34,$2C,$4D,$7D,$5D,$7F,$1A,$7F,$94,$FE,$BC,$F6,$BD,$F6,$76,$BF   ;AAB339;
    db $7F,$00,$3B,$00,$DE,$01,$D5,$03,$3B,$07,$EB,$07,$AB,$07,$E9,$03   ;AAB349;
    db $B7,$B7,$7F,$FF,$F5,$F5,$32,$FA,$5E,$3E,$5A,$3A,$D4,$34,$28,$F8   ;AAB359;
    db $78,$10,$D1,$01,$3B,$E1,$DE,$F2,$EE,$F6,$EE,$F2,$EE,$F4,$DC,$E8   ;AAB369;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB379;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB389;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB399;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB3A9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB3B9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB3C9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB3D9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB3E9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB3F9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB409;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB419;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB429;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB439;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB449;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB459;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB469;

Tiles_Torizo_AAB479:
    db $FD,$FD,$FA,$FB,$F7,$FF,$FF,$F7,$F7,$FF,$DF,$FF,$3F,$7F,$2F,$7F   ;AAB479;
    db $7A,$01,$04,$03,$E4,$FF,$F0,$FF,$20,$39,$00,$78,$00,$70,$00,$58   ;AAB489;
    db $E9,$F9,$5A,$F8,$FE,$FA,$73,$FF,$EF,$7F,$FF,$FF,$7F,$FF,$CF,$FF   ;AAB499;
    db $7F,$E1,$75,$D0,$2F,$F0,$1E,$F0,$3C,$E8,$10,$F8,$03,$FB,$07,$BB   ;AAB4A9;

Tiles_Torizo_AAB4B9:
    db $C7,$C6,$EB,$EA,$2A,$23,$96,$9F,$AB,$9F,$B3,$BF,$1F,$2F,$5B,$37   ;AAB4B9;
    db $7B,$00,$37,$00,$D5,$08,$61,$0C,$41,$3C,$C0,$1C,$C0,$3F,$80,$7F   ;AAB4C9;

Tiles_Torizo_AAB4D9:
    db $4F,$4F,$43,$46,$6F,$2F,$5B,$4C,$5F,$5B,$4F,$4A,$3B,$1F,$0F,$0F   ;AAB4D9;
    db $B6,$00,$F7,$08,$F0,$00,$B7,$00,$BE,$00,$F3,$00,$F4,$00,$FD,$00   ;AAB4E9;

Tiles_Torizo_AAB4F9:
    db $8D,$FD,$FA,$FB,$FF,$FF,$FD,$FE,$F3,$FC,$E5,$FB,$7F,$7E,$7B,$7C   ;AAB4F9;
    db $FA,$01,$64,$03,$1C,$1F,$F8,$FF,$00,$1F,$00,$3F,$00,$1F,$10,$1F   ;AAB509;
    db $E9,$F9,$5A,$F8,$FE,$FA,$B3,$7F,$4F,$FF,$BF,$FF,$BF,$7E,$CF,$7D   ;AAB519;
    db $7F,$E1,$75,$D0,$2F,$F0,$1E,$F0,$1C,$E8,$10,$F8,$02,$FA,$05,$F9   ;AAB529;

Tiles_Torizo_AAB539:
    db $8D,$FD,$FA,$FB,$FF,$FF,$FD,$FE,$FB,$FC,$FC,$FF,$7F,$7F,$3E,$3F   ;AAB539;
    db $FA,$01,$64,$03,$1C,$1F,$F8,$FF,$00,$1F,$60,$6F,$38,$3F,$1C,$1F   ;AAB549;
    db $E9,$F9,$5A,$F8,$FC,$FA,$B3,$7F,$4F,$FF,$BF,$FF,$7F,$BE,$EF,$7D   ;AAB559;
    db $7F,$E1,$75,$D0,$2F,$F0,$1E,$F0,$1C,$E8,$10,$F8,$02,$FA,$05,$F9   ;AAB569;

Tiles_Torizo_AAB579:
    db $8D,$FD,$FA,$FB,$FF,$FF,$FD,$FE,$FB,$FC,$FE,$FF,$7F,$7F,$3F,$3F   ;AAB579;
    db $FA,$01,$64,$03,$1C,$1F,$F8,$FF,$08,$1F,$7C,$7F,$3E,$3F,$2F,$2F   ;AAB589;
    db $E9,$F9,$4A,$F8,$FC,$FA,$73,$FF,$4F,$FF,$BF,$FF,$5F,$BE,$AE,$FD   ;AAB599;
    db $7F,$E1,$75,$C0,$2F,$F0,$1E,$F0,$1C,$E8,$10,$F8,$02,$FA,$05,$F8   ;AAB5A9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB5B9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB5C9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB5D9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB5E9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB5F9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB609;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB619;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB629;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB639;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB649;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB659;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB669;

Tiles_Torizo_AAB679:
    db $7F,$2F,$2B,$3F,$3F,$3F,$07,$2F,$0D,$07,$01,$03,$03,$01,$00,$00   ;AAB679;
    db $00,$58,$00,$3E,$00,$2A,$04,$2F,$00,$0B,$00,$03,$00,$02,$00,$00   ;AAB689;
    db $FE,$FE,$FF,$FF,$FF,$FF,$EF,$FF,$FF,$EF,$DF,$FF,$7F,$DF,$FF,$FF   ;AAB699;
    db $0F,$1A,$0E,$12,$0D,$11,$83,$FB,$03,$FB,$0B,$FB,$1B,$EB,$17,$17   ;AAB6A9;

Tiles_Torizo_AAB6B9:
    db $97,$9F,$13,$AF,$5B,$D7,$FB,$EF,$09,$0F,$44,$47,$2B,$E7,$0A,$E8   ;AAB6B9;
    db $60,$1F,$40,$3F,$20,$1F,$40,$1F,$70,$0F,$F8,$07,$30,$0D,$1D,$02   ;AAB6C9;

Tiles_Torizo_AAB6D9:
    db $47,$47,$65,$66,$3F,$BF,$DF,$7F,$17,$D7,$6F,$2F,$5F,$7F,$AF,$B7   ;AAB6D9;
    db $B9,$00,$9F,$00,$C1,$00,$30,$00,$EE,$00,$92,$00,$B7,$00,$D6,$00   ;AAB6E9;

Tiles_Torizo_AAB6F9:
    db $3D,$3E,$1F,$1F,$1F,$1F,$0F,$0F,$07,$07,$03,$03,$01,$01,$01,$01   ;AAB6F9;
    db $18,$1F,$1C,$1F,$0C,$0F,$06,$07,$03,$03,$00,$00,$00,$00,$01,$01   ;AAB709;
    db $DE,$FE,$DF,$3F,$6F,$BF,$2F,$FF,$DF,$EF,$9F,$FF,$FF,$FF,$FF,$FF   ;AAB719;
    db $0F,$FA,$0E,$F2,$0D,$F1,$03,$FB,$03,$FB,$0B,$FB,$1B,$6B,$17,$17   ;AAB729;

Tiles_Torizo_AAB739:
    db $1F,$1F,$0F,$0F,$07,$07,$07,$07,$03,$03,$01,$01,$01,$01,$01,$01   ;AAB739;
    db $0E,$0F,$07,$07,$03,$03,$03,$03,$01,$01,$01,$01,$00,$00,$01,$01   ;AAB749;
    db $DE,$FE,$BF,$DF,$EF,$FF,$CF,$FF,$DF,$EF,$FF,$FF,$FF,$FF,$FF,$FF   ;AAB759;
    db $0F,$FA,$0E,$F2,$4D,$B1,$83,$FB,$C3,$FB,$AB,$DB,$BB,$8B,$17,$17   ;AAB769;

Tiles_Torizo_AAB779:
    db $1F,$1F,$0F,$0F,$07,$07,$03,$03,$03,$03,$01,$01,$01,$01,$01,$01   ;AAB779;
    db $0F,$0F,$07,$07,$03,$03,$01,$01,$01,$01,$00,$00,$00,$00,$01,$01   ;AAB789;
    db $DE,$FE,$FF,$DF,$EF,$FF,$EF,$FF,$FF,$EF,$FF,$FF,$FF,$FF,$FF,$FF   ;AAB799;
    db $8F,$FA,$CE,$F2,$CD,$F1,$C3,$FB,$C3,$FB,$CB,$FB,$BB,$CB,$17,$17   ;AAB7A9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB7B9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB7C9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB7D9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB7E9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB7F9;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB809;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB819;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB829;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB839;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB849;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB859;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;AAB869;

InstList_Torizo_BombTorizo_Initial_0:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState               ;AAB879;
    dw Instruction_Torizo_SetAnimationLock                               ;AAB87B;
    dw $0001                                                             ;AAB87D;
    dw ExtendedSpritemap_Torizo_Blank                                    ;AAB87F;
    dw Instruction_Torizo_FunctionInY                                    ;AAB881;
    dw Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling          ;AAB883;
    dw Instruction_Common_Sleep                                          ;AAB885;
    dw Instruction_Torizo_FunctionInY                                    ;AAB887;
    dw Function_Torizo_SimpleMovement                                    ;AAB889;
    dw $0030                                                             ;AAB88B;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB88D;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB88F;
    dw $0040                                                             ;AAB891;
    dl Tiles_Torizo                                                      ;AAB893;
    dw $7D80,$0020                                                       ;AAB896;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB89A;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB89C;
    dw $0040                                                             ;AAB89E;
    dl Tiles_Torizo_AAB2B9                                               ;AAB8A0;
    dw $7D80,$0010                                                       ;AAB8A3;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB8A7;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB8A9;
    dw $0040                                                             ;AAB8AB;
    dl Tiles_Torizo_AAB2F9                                               ;AAB8AD;
    dw $7D80,$0008                                                       ;AAB8B0;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB8B4;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB8B6;
    dw $0040                                                             ;AAB8B8;
    dl Tiles_Torizo_AAB339                                               ;AAB8BA;
    dw $7D80,$0020                                                       ;AAB8BD;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB8C1;
    dw Instruction_Common_TimerInY                                       ;AAB8C3;
    dw $0002                                                             ;AAB8C5;

InstList_Torizo_BombTorizo_Initial_1:
    dw $0004                                                             ;AAB8C7;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB8C9;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB8CB;
    dw $0040                                                             ;AAB8CD;
    dl Tiles_Torizo                                                      ;AAB8CF;
    dw $7D80,$0004                                                       ;AAB8D2;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB8D6;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB8D8;
    dw $0040                                                             ;AAB8DA;
    dl Tiles_Torizo_AAB2B9                                               ;AAB8DC;
    dw $7D80,$0004                                                       ;AAB8DF;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB8E3;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB8E5;
    dw $0040                                                             ;AAB8E7;
    dl Tiles_Torizo_AAB2F9                                               ;AAB8E9;
    dw $7D80,$0004                                                       ;AAB8EC;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB8F0;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAB8F2;
    dw $0040                                                             ;AAB8F4;
    dl Tiles_Torizo_AAB339                                               ;AAB8F6;
    dw $7D80                                                             ;AAB8F9;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAB8FB;
    dw InstList_Torizo_BombTorizo_Initial_1                              ;AAB8FD;
    dw $0030                                                             ;AAB8FF;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AAB901;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAB903;
    dw $0000,$0010                                                       ;AAB905;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1            ;AAB909;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAB90B;
    dw $0002,$0008                                                       ;AAB90D;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2            ;AAB911;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAB913;
    dw $0004,$0008                                                       ;AAB915;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3            ;AAB919;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAB91B;
    dw $0006,$0008                                                       ;AAB91D;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4            ;AAB921;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAB923;
    dw $0008,$0008                                                       ;AAB925;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5            ;AAB929;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAB92B;
    dw $000A                                                             ;AAB92D;
    dw Instruction_Torizo_SetupPaletteTransitionToNormalTorizo           ;AAB92F;
    dw Instruction_Common_TimerInY                                       ;AAB931;
    dw $0010                                                             ;AAB933;

InstList_Torizo_BombTorizo_Initial_2:
    dw $0004                                                             ;AAB935;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6            ;AAB937;
    dw Instruction_Torizo_AdvanceGradualColorChange                      ;AAB939;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAB93B;
    dw InstList_Torizo_BombTorizo_Initial_2                              ;AAB93D;
    dw RTL_AAC2C8                                                        ;AAB93F;
    dw Instruction_Torizo_ClearAnimationLock                             ;AAB941;
    dw Instruction_Torizo_StartFightMusic_BombTorizoBellyPaletteFX       ;AAB943;
    dw $0010                                                             ;AAB945;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6            ;AAB947;
    dw Instruction_Common_GotoY                                          ;AAB949;
    dw InstList_Torizo_FacingLeft_Walking_LeftLegMoving                  ;AAB94B;

Instruction_Torizo_SetupPaletteTransitionToNormalTorizo:
    JSR.W LoadNormalTorizoTargetPalettes                                 ;AAB94D;
    RTL                                                                  ;AAB950;


Instruction_Torizo_StartFightMusic_BombTorizoBellyPaletteFX:
    LDA.W TorizoMusicTracks_song0                                        ;AAB951;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;AAB954;
    PHY                                                                  ;AAB958;
    LDY.W #PaletteFXObjects_BombTorizoBelly                              ;AAB959;
    JSL.L Spawn_PaletteFXObject                                          ;AAB95C;
    PLY                                                                  ;AAB960;
    RTL                                                                  ;AAB961;


InstList_Torizo_FacingLeft_TurningLeft:
    dw Instruction_Torizo_FunctionInY                                    ;AAB962;
    dw Function_Torizo_SimpleMovement                                    ;AAB964;
    dw Instruction_Torizo_SetTorizoTurningAroundFlag                     ;AAB966;
    dw $0018                                                             ;AAB968;
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging            ;AAB96A;

InstList_Torizo_FacingLeft_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState                ;AAB96C;
    dw Instruction_Torizo_FunctionInY                                    ;AAB96E;
    dw Function_Torizo_NormalMovement                                    ;AAB970;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAB972;
    dw Function_Torizo_Movement_Walking                                  ;AAB974;
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow        ;AAB976;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAB978;
    dw $000A                                                             ;AAB97A;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0            ;AAB97C;
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront          ;AAB97E;
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward_        ;AAB980;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AAB982;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0      ;AAB984;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB986;
    dw $0002,$0006                                                       ;AAB988;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1            ;AAB98C;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AAB98E;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0      ;AAB990;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB992;
    dw $0004,$0006                                                       ;AAB994;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2            ;AAB998;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AAB99A;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0      ;AAB99C;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB99E;
    dw $0006,$0006                                                       ;AAB9A0;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3            ;AAB9A4;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AAB9A6;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0      ;AAB9A8;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB9AA;
    dw $0008,$0006                                                       ;AAB9AC;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4            ;AAB9B0;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB9B2;
    dw $000A                                                             ;AAB9B4;

InstList_Torizo_FacingLeft_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState               ;AAB9B6;
    dw Instruction_Torizo_FunctionInY                                    ;AAB9B8;
    dw Function_Torizo_NormalMovement                                    ;AAB9BA;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAB9BC;
    dw Function_Torizo_Movement_Walking                                  ;AAB9BE;
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow        ;AAB9C0;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAB9C2;
    dw $000A                                                             ;AAB9C4;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0             ;AAB9C6;
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront          ;AAB9C8;
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward        ;AAB9CA;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AAB9CC;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0         ;AAB9CE;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB9D0;
    dw $000C,$0006                                                       ;AAB9D2;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1             ;AAB9D6;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AAB9D8;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0         ;AAB9DA;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB9DC;
    dw $000E,$0006                                                       ;AAB9DE;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2             ;AAB9E2;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AAB9E4;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0         ;AAB9E6;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB9E8;
    dw $0010,$0006                                                       ;AAB9EA;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3             ;AAB9EE;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AAB9F0;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0         ;AAB9F2;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB9F4;
    dw $0012,$0006                                                       ;AAB9F6;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4             ;AAB9FA;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AAB9FC;
    dw $0000                                                             ;AAB9FE;
    dw Instruction_Common_GotoY                                          ;AABA00;
    dw InstList_Torizo_FacingLeft_Walking_RightLegMoving                 ;AABA02;

InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABA04;
    dw Function_Torizo_Movement_Attacking                                ;AABA06;
    dw $0010                                                             ;AABA08;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AABA0A;
    dw $0008                                                             ;AABA0C;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0        ;AABA0E;
    dw $0008                                                             ;AABA10;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1        ;AABA12;
    dw $0008                                                             ;AABA14;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2        ;AABA16;
    dw $0008                                                             ;AABA18;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3        ;AABA1A;
    dw $0010                                                             ;AABA1C;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4        ;AABA1E;
    dw Instruction_Torizo_PlayShotTorizoSFX                              ;AABA20;
    dw Instruction_Common_TimerInY                                       ;AABA22;
    dw $0003                                                             ;AABA24;

InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs                      ;AABA26;
    dw Instruction_Common_WaitYFrames                                    ;AABA28;
    dw $0010                                                             ;AABA2A;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AABA2C;
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_1        ;AABA2E;
    dw $0008                                                             ;AABA30;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3        ;AABA32;
    dw $0008                                                             ;AABA34;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2        ;AABA36;
    dw $0008                                                             ;AABA38;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1        ;AABA3A;
    dw $0048                                                             ;AABA3C;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0        ;AABA3E;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABA40;
    dw Function_Torizo_Movement_Walking                                  ;AABA42;
    dw Instruction_Torizo_Return                                         ;AABA44;

InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABA46;
    dw Function_Torizo_Movement_Attacking                                ;AABA48;
    dw $0010                                                             ;AABA4A;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AABA4C;
    dw $0008                                                             ;AABA4E;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0         ;AABA50;
    dw $0008                                                             ;AABA52;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1         ;AABA54;
    dw $0008                                                             ;AABA56;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2         ;AABA58;
    dw $0008                                                             ;AABA5A;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3         ;AABA5C;
    dw $0010                                                             ;AABA5E;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4         ;AABA60;
    dw Instruction_Torizo_PlayShotTorizoSFX                              ;AABA62;
    dw Instruction_Common_TimerInY                                       ;AABA64;
    dw $0003                                                             ;AABA66;

InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs                      ;AABA68;
    dw Instruction_Common_WaitYFrames                                    ;AABA6A;
    dw $0010                                                             ;AABA6C;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AABA6E;
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_1         ;AABA70;
    dw $0008                                                             ;AABA72;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3         ;AABA74;
    dw $0008                                                             ;AABA76;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2         ;AABA78;
    dw $0008                                                             ;AABA7A;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1         ;AABA7C;
    dw $0048                                                             ;AABA7E;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0         ;AABA80;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABA82;
    dw Function_Torizo_Movement_Walking                                  ;AABA84;
    dw Instruction_Torizo_Return                                         ;AABA86;

InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABA88;
    dw Function_Torizo_Movement_Attacking                                ;AABA8A;
    dw Instruction_Common_TimerInY                                       ;AABA8C;
    dw $0004                                                             ;AABA8E;

InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_1:
    dw $0006                                                             ;AABA90;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AABA92;
    dw $0006                                                             ;AABA94;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AABA96;
    dw $0006                                                             ;AABA98;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AABA9A;
    dw $0006                                                             ;AABA9C;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AABA9E;
    dw $0006                                                             ;AABAA0;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AABAA2;
    dw $0006                                                             ;AABAA4;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4      ;AABAA6;
    dw $0002                                                             ;AABAA8;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AABAAA;
    dw $0002                                                             ;AABAAC;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AABAAE;
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY         ;AABAB0;
    dw $0000,$0002                                                       ;AABAB2;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AABAB6;
    dw $0018                                                             ;AABAB8;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AABABA;
    dw $0006                                                             ;AABABC;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AABABE;
    dw $0006                                                             ;AABAC0;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5      ;AABAC2;
    dw $0006                                                             ;AABAC4;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0      ;AABAC6;
    dw $0006                                                             ;AABAC8;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1      ;AABACA;
    dw $0006                                                             ;AABACC;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2      ;AABACE;
    dw $0006                                                             ;AABAD0;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3      ;AABAD2;
    dw $0002                                                             ;AABAD4;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2      ;AABAD6;
    dw $0002                                                             ;AABAD8;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1      ;AABADA;
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY         ;AABADC;
    dw $0001,$0002                                                       ;AABADE;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0      ;AABAE2;
    dw $0038                                                             ;AABAE4;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5      ;AABAE6;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AABAE8;
    dw InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_1          ;AABAEA;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABAEC;
    dw Function_Torizo_Movement_Walking                                  ;AABAEE;
    dw Instruction_Torizo_Return                                         ;AABAF0;

InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABAF2;
    dw Function_Torizo_Movement_Attacking                                ;AABAF4;
    dw Instruction_Common_TimerInY                                       ;AABAF6;
    dw $0004                                                             ;AABAF8;

InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_1:
    dw $0006                                                             ;AABAFA;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AABAFC;
    dw $0006                                                             ;AABAFE;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AABB00;
    dw $0006                                                             ;AABB02;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AABB04;
    dw $0006                                                             ;AABB06;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AABB08;
    dw $0006                                                             ;AABB0A;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AABB0C;
    dw $0006                                                             ;AABB0E;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4       ;AABB10;
    dw $0002                                                             ;AABB12;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AABB14;
    dw $0002                                                             ;AABB16;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AABB18;
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY         ;AABB1A;
    dw $0000,$0002                                                       ;AABB1C;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AABB20;
    dw $0018                                                             ;AABB22;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AABB24;
    dw $0006                                                             ;AABB26;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AABB28;
    dw $0006                                                             ;AABB2A;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5       ;AABB2C;
    dw $0006                                                             ;AABB2E;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0        ;AABB30;
    dw $0006                                                             ;AABB32;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1        ;AABB34;
    dw $0006                                                             ;AABB36;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2        ;AABB38;
    dw $0006                                                             ;AABB3A;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3        ;AABB3C;
    dw $0002                                                             ;AABB3E;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2        ;AABB40;
    dw $0002                                                             ;AABB42;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1        ;AABB44;
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY         ;AABB46;
    dw $0001                                                             ;AABB48;
    dw $0002                                                             ;AABB4A;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0        ;AABB4C;
    dw $0038                                                             ;AABB4E;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5       ;AABB50;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AABB52;
    dw InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_1           ;AABB54;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABB56;
    dw Function_Torizo_Movement_Walking                                  ;AABB58;
    dw Instruction_Torizo_Return                                         ;AABB5A;

InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABB5C;
    dw Function_Torizo_Movement_Attacking                                ;AABB5E;
    dw $0003                                                             ;AABB60;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AABB62;
    dw $0003                                                             ;AABB64;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AABB66;
    dw $0003                                                             ;AABB68;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AABB6A;
    dw $0003                                                             ;AABB6C;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AABB6E;
    dw $0003                                                             ;AABB70;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AABB72;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABB74;
    dw $0000,$0003                                                       ;AABB76;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4      ;AABB7A;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABB7C;
    dw $0002,$0001                                                       ;AABB7E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AABB82;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABB84;
    dw $0004,$0001                                                       ;AABB86;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AABB8A;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABB8C;
    dw $0006,$0001                                                       ;AABB8E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AABB92;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABB94;
    dw $0008,$0001                                                       ;AABB96;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AABB9A;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABB9C;
    dw $000A,$0003                                                       ;AABB9E;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AABBA2;
    dw $0003                                                             ;AABBA4;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5      ;AABBA6;
    dw $0003                                                             ;AABBA8;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0      ;AABBAA;
    dw $0003                                                             ;AABBAC;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1      ;AABBAE;
    dw $0003                                                             ;AABBB0;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2      ;AABBB2;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABBB4;
    dw $000C,$0003                                                       ;AABBB6;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3      ;AABBBA;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABBBC;
    dw $000E,$0001                                                       ;AABBBE;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2      ;AABBC2;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABBC4;
    dw $0010,$0001                                                       ;AABBC6;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1      ;AABBCA;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABBCC;
    dw $0012,$0001                                                       ;AABBCE;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0      ;AABBD2;
    dw $0010                                                             ;AABBD4;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5      ;AABBD6;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABBD8;
    dw Function_Torizo_Movement_Walking                                  ;AABBDA;
    dw Instruction_Torizo_Return                                         ;AABBDC;

InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward_:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABBDE;
    dw Function_Torizo_Movement_Attacking                                ;AABBE0;
    dw $0003                                                             ;AABBE2;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AABBE4;
    dw $0003                                                             ;AABBE6;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AABBE8;
    dw $0003                                                             ;AABBEA;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AABBEC;
    dw $0003                                                             ;AABBEE;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AABBF0;
    dw $0003                                                             ;AABBF2;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AABBF4;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABBF6;
    dw $0000,$0003                                                       ;AABBF8;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4       ;AABBFC;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABBFE;
    dw $0002,$0001                                                       ;AABC00;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AABC04;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABC06;
    dw $0004,$0001                                                       ;AABC08;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AABC0C;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABC0E;
    dw $0006,$0001                                                       ;AABC10;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AABC14;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABC16;
    dw $0008,$0001                                                       ;AABC18;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AABC1C;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABC1E;
    dw $000A,$0003                                                       ;AABC20;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AABC24;
    dw $0003                                                             ;AABC26;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5       ;AABC28;
    dw $0003                                                             ;AABC2A;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0        ;AABC2C;
    dw $0003                                                             ;AABC2E;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1        ;AABC30;
    dw $0003                                                             ;AABC32;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2        ;AABC34;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABC36;
    dw $000C,$0003                                                       ;AABC38;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3        ;AABC3C;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABC3E;
    dw $000E,$0001                                                       ;AABC40;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2        ;AABC44;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABC46;
    dw $0010,$0001                                                       ;AABC48;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1        ;AABC4C;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABC4E;
    dw $0012,$0001                                                       ;AABC50;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0        ;AABC54;
    dw $0010                                                             ;AABC56;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5       ;AABC58;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABC5A;
    dw Function_Torizo_Movement_Walking                                  ;AABC5C;
    dw Instruction_Torizo_Return                                         ;AABC5E;

InstList_Torizo_FacingLeft_JumpingForwards_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABC60;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AABC62;
    dw Instruction_Torizo_LinkInstructionInY                             ;AABC64;
    dw InstList_Torizo_FacingLeft_Falling_0                              ;AABC66;
    dw $0005                                                             ;AABC68;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0            ;AABC6A;
    dw $0005                                                             ;AABC6C;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1            ;AABC6E;

InstList_Torizo_FacingLeft_JumpingForwards_1:
    dw $0001                                                             ;AABC70;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2            ;AABC72;
    dw Instruction_Torizo_GotoY_IfRising                                 ;AABC74;
    dw InstList_Torizo_FacingLeft_JumpingForwards_1                      ;AABC76;

InstList_Torizo_FacingLeft_Falling_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABC78;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AABC7A;
    dw Instruction_Torizo_LinkInstructionInY                             ;AABC7C;
    dw InstList_Torizo_FacingLeft_Falling_2                              ;AABC7E;

InstList_Torizo_FacingLeft_Falling_1:
    dw $0005                                                             ;AABC80;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1            ;AABC82;
    dw Instruction_Common_GotoY                                          ;AABC84;
    dw InstList_Torizo_FacingLeft_Falling_1                              ;AABC86;

InstList_Torizo_FacingLeft_Falling_2:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AABC88;
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds                   ;AABC8A;
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden        ;AABC8C;
    dw InstList_Torizo_FacingLeft_Faceless_Walking_LeftLegMoving         ;AABC8E;
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving                   ;AABC90;
    dw Instruction_Common_GotoY                                          ;AABC92;
    dw InstList_Torizo_FacingLeft_Walking_LeftLegMoving                  ;AABC94;

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABC96;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AABC98;
    dw Instruction_Torizo_LinkInstructionInY                             ;AABC9A;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_2      ;AABC9C;
    dw $0005                                                             ;AABC9E;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0            ;AABCA0;
    dw $0005                                                             ;AABCA2;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1            ;AABCA4;

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_1:
    dw $0001                                                             ;AABCA6;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2            ;AABCA8;
    dw Instruction_Torizo_GotoY_IfRising                                 ;AABCAA;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_1      ;AABCAC;

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABCAE;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AABCB0;
    dw Instruction_Torizo_LinkInstructionInY                             ;AABCB2;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_4      ;AABCB4;

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_3:
    dw $0005                                                             ;AABCB6;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1            ;AABCB8;
    dw Instruction_Common_GotoY                                          ;AABCBA;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_3      ;AABCBC;

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_4:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AABCBE;
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds                   ;AABCC0;
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden        ;AABCC2;
    dw InstList_Torizo_FacingLeft_Faceless_Walking_RightLegMoving        ;AABCC4;
    dw InstList_GT_LandedFromBackwardsJump_FacingLeft_LeftFootFwd        ;AABCC6;
    dw Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack                 ;AABCC8;
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_0         ;AABCCA;
    dw InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_0           ;AABCCC;
    dw Instruction_Common_GotoY                                          ;AABCCE;
    dw InstList_Torizo_FacingLeft_Walking_RightLegMoving                 ;AABCD0;

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABCD2;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AABCD4;
    dw Instruction_Torizo_LinkInstructionInY                             ;AABCD6;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_2         ;AABCD8;
    dw $0005                                                             ;AABCDA;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0            ;AABCDC;
    dw $0005                                                             ;AABCDE;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1            ;AABCE0;

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_1:
    dw $0001                                                             ;AABCE2;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2            ;AABCE4;
    dw Instruction_Torizo_GotoY_IfRising                                 ;AABCE6;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_1         ;AABCE8;

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABCEA;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AABCEC;
    dw Instruction_Torizo_LinkInstructionInY                             ;AABCEE;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_4         ;AABCF0;

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_3:
    dw $0005                                                             ;AABCF2;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1            ;AABCF4;
    dw Instruction_Common_GotoY                                          ;AABCF6;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_3         ;AABCF8;

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_4:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AABCFA;
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds                   ;AABCFC;
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden        ;AABCFE;
    dw InstList_Torizo_FacingLeft_Faceless_Walking_LeftLegMoving         ;AABD00;
    dw InstList_GT_LandedFromBackwardsJump_FacingLeft_RightFootFwd       ;AABD02;
    dw Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack                 ;AABD04;
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_0        ;AABD06;
    dw InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_0          ;AABD08;
    dw Instruction_Common_GotoY                                          ;AABD0A;
    dw InstList_Torizo_FacingLeft_Walking_LeftLegMoving                  ;AABD0C;

InstList_Torizo_FacingLeft_Faceless_TurningLeft:
    dw Instruction_Torizo_FunctionInY                                    ;AABD0E;
    dw Function_Torizo_SimpleMovement                                    ;AABD10;
    dw Instruction_Torizo_SetTorizoTurningAroundFlag                     ;AABD12;
    dw $0008                                                             ;AABD14;
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging            ;AABD16;

InstList_Torizo_FacingLeft_Faceless_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState                ;AABD18;
    dw Instruction_Torizo_FunctionInY                                    ;AABD1A;
    dw Function_Torizo_NormalMovement                                    ;AABD1C;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABD1E;
    dw Function_Torizo_Movement_Walking                                  ;AABD20;
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow        ;AABD22;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AABD24;
    dw $0001                                                             ;AABD26;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0            ;AABD28;
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront          ;AABD2A;
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward_        ;AABD2C;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD2E;
    dw $0002,$0005                                                       ;AABD30;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1            ;AABD34;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD36;
    dw $0004,$0005                                                       ;AABD38;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2            ;AABD3C;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD3E;
    dw $0006,$0005                                                       ;AABD40;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3            ;AABD44;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD46;
    dw $0008,$0005                                                       ;AABD48;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4            ;AABD4C;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD4E;
    dw $000A                                                             ;AABD50;

InstList_Torizo_FacingLeft_Faceless_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState               ;AABD52;
    dw Instruction_Torizo_FunctionInY                                    ;AABD54;
    dw Function_Torizo_NormalMovement                                    ;AABD56;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABD58;
    dw Function_Torizo_Movement_Walking                                  ;AABD5A;
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow        ;AABD5C;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AABD5E;
    dw $0001                                                             ;AABD60;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0             ;AABD62;
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront          ;AABD64;
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward        ;AABD66;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD68;
    dw $000C,$0005                                                       ;AABD6A;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1             ;AABD6E;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD70;
    dw $000E,$0005                                                       ;AABD72;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2             ;AABD76;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD78;
    dw $0010,$0005                                                       ;AABD7A;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3             ;AABD7E;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD80;
    dw $0012,$0005                                                       ;AABD82;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4             ;AABD86;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AABD88;
    dw $0000                                                             ;AABD8A;
    dw Instruction_Common_GotoY                                          ;AABD8C;
    dw InstList_Torizo_FacingLeft_Faceless_Walking_RightLegMoving        ;AABD8E;

UNUSED_InstList_Torizo_FacingRight_StandUp_AABD90:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState               ;AABD90;
    dw $0001                                                             ;AABD92;
    dw ExtendedSpritemap_Torizo_Blank                                    ;AABD94;
    dw Instruction_Torizo_FunctionInY                                    ;AABD96;
    dw Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling          ;AABD98;
    dw Instruction_Common_Sleep                                          ;AABD9A;
    dw Instruction_Torizo_FunctionInY                                    ;AABD9C;
    dw Function_Torizo_SimpleMovement                                    ;AABD9E;
    dw $0020                                                             ;AABDA0;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_0           ;AABDA2;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AABDA4;
    dw $0010,$0010                                                       ;AABDA6;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1           ;AABDAA;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AABDAC;
    dw $0012,$0008                                                       ;AABDAE;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2           ;AABDB2;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AABDB4;
    dw $0014,$0008                                                       ;AABDB6;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3           ;AABDBA;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AABDBC;
    dw $0016,$0008                                                       ;AABDBE;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4           ;AABDC2;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AABDC4;
    dw $0018,$0008                                                       ;AABDC6;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5           ;AABDCA;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AABDCC;
    dw $001A,$0008                                                       ;AABDCE;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6           ;AABDD2;
    dw Instruction_Common_GotoY                                          ;AABDD4;
    dw InstList_Torizo_FacingRight_Walking_RightLegMoving                ;AABDD6;

InstList_Torizo_FacingRight_TurningRight:
    dw Instruction_Torizo_FunctionInY                                    ;AABDD8;
    dw Function_Torizo_SimpleMovement                                    ;AABDDA;
    dw Instruction_Torizo_SetTorizoTurningAroundFlag                     ;AABDDC;
    dw $0018                                                             ;AABDDE;
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging            ;AABDE0;

InstList_Torizo_FacingRight_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState              ;AABDE2;
    dw Instruction_Torizo_FunctionInY                                    ;AABDE4;
    dw Function_Torizo_NormalMovement                                    ;AABDE6;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABDE8;
    dw Function_Torizo_Movement_Walking                                  ;AABDEA;
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow        ;AABDEC;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AABDEE;
    dw $000A                                                             ;AABDF0;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0            ;AABDF2;
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront          ;AABDF4;
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward       ;AABDF6;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABDF8;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0       ;AABDFA;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABDFC;
    dw $0016,$0006                                                       ;AABDFE;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1            ;AABE02;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABE04;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0       ;AABE06;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE08;
    dw $0018,$0006                                                       ;AABE0A;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2            ;AABE0E;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABE10;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0       ;AABE12;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE14;
    dw $001A,$0006                                                       ;AABE16;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3            ;AABE1A;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABE1C;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0       ;AABE1E;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE20;
    dw $001C,$0006                                                       ;AABE22;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4            ;AABE26;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABE28;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0       ;AABE2A;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE2C;
    dw $001E                                                             ;AABE2E;

InstList_Torizo_FacingRight_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState               ;AABE30;
    dw Instruction_Torizo_FunctionInY                                    ;AABE32;
    dw Function_Torizo_NormalMovement                                    ;AABE34;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABE36;
    dw Function_Torizo_Movement_Walking                                  ;AABE38;
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow        ;AABE3A;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AABE3C;
    dw $000A                                                             ;AABE3E;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0           ;AABE40;
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront          ;AABE42;
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward        ;AABE44;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABE46;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0       ;AABE48;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE4A;
    dw $0020,$0006                                                       ;AABE4C;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1           ;AABE50;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABE52;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0       ;AABE54;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE56;
    dw $0022,$0006                                                       ;AABE58;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2           ;AABE5C;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABE5E;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0       ;AABE60;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE62;
    dw $0024,$0006                                                       ;AABE64;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3           ;AABE68;
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels        ;AABE6A;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0       ;AABE6C;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE6E;
    dw $0026,$0006                                                       ;AABE70;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4           ;AABE74;
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY      ;AABE76;
    dw $0014                                                             ;AABE78;
    dw Instruction_Common_GotoY                                          ;AABE7A;
    dw InstList_Torizo_FacingRight_Walking_LeftLegMoving                 ;AABE7C;

InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABE7E;
    dw Function_Torizo_Movement_Attacking                                ;AABE80;
    dw $0010                                                             ;AABE82;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AABE84;
    dw $0008                                                             ;AABE86;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0        ;AABE88;
    dw $0008                                                             ;AABE8A;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1        ;AABE8C;
    dw $0008                                                             ;AABE8E;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2        ;AABE90;
    dw $0008                                                             ;AABE92;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3        ;AABE94;
    dw $0010                                                             ;AABE96;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4        ;AABE98;
    dw Instruction_Torizo_PlayShotTorizoSFX                              ;AABE9A;
    dw Instruction_Common_TimerInY                                       ;AABE9C;
    dw $0003                                                             ;AABE9E;

InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs                      ;AABEA0;
    dw Instruction_Common_WaitYFrames                                    ;AABEA2;
    dw $0010                                                             ;AABEA4;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AABEA6;
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_1        ;AABEA8;
    dw $0008                                                             ;AABEAA;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3        ;AABEAC;
    dw $0008                                                             ;AABEAE;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2        ;AABEB0;
    dw $0008                                                             ;AABEB2;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1        ;AABEB4;
    dw $0048                                                             ;AABEB6;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0        ;AABEB8;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABEBA;
    dw Function_Torizo_Movement_Walking                                  ;AABEBC;
    dw Instruction_Torizo_Return                                         ;AABEBE;

InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABEC0;
    dw Function_Torizo_Movement_Attacking                                ;AABEC2;
    dw $0010                                                             ;AABEC4;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AABEC6;
    dw $0008                                                             ;AABEC8;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0       ;AABECA;
    dw $0008                                                             ;AABECC;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1       ;AABECE;
    dw $0008                                                             ;AABED0;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2       ;AABED2;
    dw $0008                                                             ;AABED4;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3       ;AABED6;
    dw $0010                                                             ;AABED8;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4       ;AABEDA;
    dw Instruction_Torizo_PlayShotTorizoSFX                              ;AABEDC;
    dw Instruction_Common_TimerInY                                       ;AABEDE;
    dw $0003                                                             ;AABEE0;

InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs                      ;AABEE2;
    dw Instruction_Common_WaitYFrames                                    ;AABEE4;
    dw $0010                                                             ;AABEE6;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AABEE8;
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_1       ;AABEEA;
    dw $0008                                                             ;AABEEC;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3       ;AABEEE;
    dw $0008                                                             ;AABEF0;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2       ;AABEF2;
    dw $0008                                                             ;AABEF4;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1       ;AABEF6;
    dw $0048                                                             ;AABEF8;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0       ;AABEFA;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABEFC;
    dw Function_Torizo_Movement_Walking                                  ;AABEFE;
    dw Instruction_Torizo_Return                                         ;AABF00;

InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABF02;
    dw Function_Torizo_Movement_Attacking                                ;AABF04;
    dw Instruction_Common_TimerInY                                       ;AABF06;
    dw $0004                                                             ;AABF08;

InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_1:
    dw $0006                                                             ;AABF0A;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AABF0C;
    dw $0006                                                             ;AABF0E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0         ;AABF10;
    dw $0006                                                             ;AABF12;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AABF14;
    dw $0006                                                             ;AABF16;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AABF18;
    dw $0006                                                             ;AABF1A;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AABF1C;
    dw $0006                                                             ;AABF1E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4         ;AABF20;
    dw $0002                                                             ;AABF22;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AABF24;
    dw $0002                                                             ;AABF26;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AABF28;
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY         ;AABF2A;
    dw $0000,$0002                                                       ;AABF2C;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AABF30;
    dw $0018                                                             ;AABF32;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0         ;AABF34;
    dw $0006                                                             ;AABF36;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AABF38;
    dw $0006                                                             ;AABF3A;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5         ;AABF3C;
    dw $0006                                                             ;AABF3E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6         ;AABF40;
    dw $0006                                                             ;AABF42;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7         ;AABF44;
    dw $0006                                                             ;AABF46;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8         ;AABF48;
    dw $0006                                                             ;AABF4A;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9         ;AABF4C;
    dw $0002                                                             ;AABF4E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8         ;AABF50;
    dw $0002                                                             ;AABF52;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7         ;AABF54;
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY         ;AABF56;
    dw $0001,$0002                                                       ;AABF58;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6         ;AABF5C;
    dw $0038                                                             ;AABF5E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5         ;AABF60;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AABF62;
    dw InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_1          ;AABF64;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABF66;
    dw Function_Torizo_Movement_Walking                                  ;AABF68;
    dw Instruction_Torizo_Return                                         ;AABF6A;

InstList_Torizo_FacingRight_SonicBooms_RightFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABF6C;
    dw Function_Torizo_Movement_Attacking                                ;AABF6E;
    dw Instruction_Common_TimerInY                                       ;AABF70;
    dw $0004                                                             ;AABF72;

InstList_Torizo_FacingRight_SonicBooms_RightFootForward_1:
    dw $0006                                                             ;AABF74;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AABF76;
    dw $0006                                                             ;AABF78;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0        ;AABF7A;
    dw $0006                                                             ;AABF7C;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AABF7E;
    dw $0006                                                             ;AABF80;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AABF82;
    dw $0006                                                             ;AABF84;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AABF86;
    dw $0006                                                             ;AABF88;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4        ;AABF8A;
    dw $0002                                                             ;AABF8C;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AABF8E;
    dw $0002                                                             ;AABF90;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AABF92;
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY         ;AABF94;
    dw $0000,$0002                                                       ;AABF96;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AABF9A;
    dw $0018                                                             ;AABF9C;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0        ;AABF9E;
    dw $0006                                                             ;AABFA0;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AABFA2;
    dw $0006                                                             ;AABFA4;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5        ;AABFA6;
    dw $0006                                                             ;AABFA8;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6        ;AABFAA;
    dw $0006                                                             ;AABFAC;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7        ;AABFAE;
    dw $0006                                                             ;AABFB0;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8        ;AABFB2;
    dw $0006                                                             ;AABFB4;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9        ;AABFB6;
    dw $0002                                                             ;AABFB8;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8        ;AABFBA;
    dw $0002                                                             ;AABFBC;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7        ;AABFBE;
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY         ;AABFC0;
    dw $0001,$0002                                                       ;AABFC2;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6        ;AABFC6;
    dw $0038                                                             ;AABFC8;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5        ;AABFCA;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AABFCC;
    dw InstList_Torizo_FacingRight_SonicBooms_RightFootForward_1         ;AABFCE;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABFD0;
    dw Function_Torizo_Movement_Walking                                  ;AABFD2;
    dw Instruction_Torizo_Return                                         ;AABFD4;

InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AABFD6;
    dw Function_Torizo_Movement_Attacking                                ;AABFD8;
    dw $0003                                                             ;AABFDA;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AABFDC;
    dw $0003                                                             ;AABFDE;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0         ;AABFE0;
    dw $0003                                                             ;AABFE2;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AABFE4;
    dw $0003                                                             ;AABFE6;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AABFE8;
    dw $0003                                                             ;AABFEA;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AABFEC;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABFEE;
    dw $0000,$0003                                                       ;AABFF0;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4         ;AABFF4;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABFF6;
    dw $0002,$0001                                                       ;AABFF8;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AABFFC;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AABFFE;
    dw $0004,$0001                                                       ;AAC000;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AAC004;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC006;
    dw $0006,$0001                                                       ;AAC008;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AAC00C;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC00E;
    dw $0008,$0001                                                       ;AAC010;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0         ;AAC014;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC016;
    dw $000A,$0003                                                       ;AAC018;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AAC01C;
    dw $0003                                                             ;AAC01E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5         ;AAC020;
    dw $0003                                                             ;AAC022;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6         ;AAC024;
    dw $0003                                                             ;AAC026;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7         ;AAC028;
    dw $0003                                                             ;AAC02A;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8         ;AAC02C;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC02E;
    dw $000C,$0003                                                       ;AAC030;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9         ;AAC034;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC036;
    dw $000E,$0001                                                       ;AAC038;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8         ;AAC03C;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC03E;
    dw $0010,$0001                                                       ;AAC040;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7         ;AAC044;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC046;
    dw $0012,$0001                                                       ;AAC048;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6         ;AAC04C;
    dw $0010                                                             ;AAC04E;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5         ;AAC050;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC052;
    dw Function_Torizo_Movement_Walking                                  ;AAC054;
    dw Instruction_Torizo_Return                                         ;AAC056;

InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC058;
    dw Function_Torizo_Movement_Attacking                                ;AAC05A;
    dw $0003                                                             ;AAC05C;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AAC05E;
    dw $0003                                                             ;AAC060;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0        ;AAC062;
    dw $0003                                                             ;AAC064;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AAC066;
    dw $0003                                                             ;AAC068;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AAC06A;
    dw $0003                                                             ;AAC06C;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AAC06E;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC070;
    dw $0000,$0003                                                       ;AAC072;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4        ;AAC076;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC078;
    dw $0002,$0001                                                       ;AAC07A;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AAC07E;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC080;
    dw $0004,$0001                                                       ;AAC082;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AAC086;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC088;
    dw $0006,$0001                                                       ;AAC08A;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AAC08E;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC090;
    dw $0008,$0001                                                       ;AAC092;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0        ;AAC096;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC098;
    dw $000A,$0003                                                       ;AAC09A;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AAC09E;
    dw $0003                                                             ;AAC0A0;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5        ;AAC0A2;
    dw $0003                                                             ;AAC0A4;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6        ;AAC0A6;
    dw $0003                                                             ;AAC0A8;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7        ;AAC0AA;
    dw $0003                                                             ;AAC0AC;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8        ;AAC0AE;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC0B0;
    dw $000C,$0003                                                       ;AAC0B2;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9        ;AAC0B6;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC0B8;
    dw $000E,$0001                                                       ;AAC0BA;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8        ;AAC0BE;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC0C0;
    dw $0010,$0001                                                       ;AAC0C2;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7        ;AAC0C6;
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY        ;AAC0C8;
    dw $0012,$0001                                                       ;AAC0CA;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6        ;AAC0CE;
    dw $0010                                                             ;AAC0D0;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5        ;AAC0D2;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC0D4;
    dw Function_Torizo_Movement_Walking                                  ;AAC0D6;
    dw Instruction_Torizo_Return                                         ;AAC0D8;

InstList_Torizo_FacingRight_JumpingForwards_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC0DA;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AAC0DC;
    dw Instruction_Torizo_LinkInstructionInY                             ;AAC0DE;
    dw InstList_Torizo_FacingRight_Falling_0                             ;AAC0E0;
    dw $0005                                                             ;AAC0E2;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0           ;AAC0E4;
    dw $0005                                                             ;AAC0E6;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1           ;AAC0E8;

InstList_Torizo_FacingRight_JumpingForwards_1:
    dw $0001                                                             ;AAC0EA;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2           ;AAC0EC;
    dw Instruction_Torizo_GotoY_IfRising                                 ;AAC0EE;
    dw InstList_Torizo_FacingRight_JumpingForwards_1                     ;AAC0F0;

InstList_Torizo_FacingRight_Falling_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC0F2;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AAC0F4;
    dw Instruction_Torizo_LinkInstructionInY                             ;AAC0F6;
    dw InstList_Torizo_FacingRight_Falling_2                             ;AAC0F8;

InstList_Torizo_FacingRight_Falling_1:
    dw $0005                                                             ;AAC0FA;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1           ;AAC0FC;
    dw Instruction_Common_GotoY                                          ;AAC0FE;
    dw InstList_Torizo_FacingRight_Falling_1                             ;AAC100;

InstList_Torizo_FacingRight_Falling_2:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAC102;
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds                   ;AAC104;
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden        ;AAC106;
    dw InstList_Torizo_FacingRight_Faceless_Walking_RightLegMoving       ;AAC108;
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving                 ;AAC10A;
    dw Instruction_Common_GotoY                                          ;AAC10C;
    dw InstList_Torizo_FacingRight_Walking_RightLegMoving                ;AAC10E;

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC110;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AAC112;
    dw Instruction_Torizo_LinkInstructionInY                             ;AAC114;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_2       ;AAC116;
    dw $0005                                                             ;AAC118;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0           ;AAC11A;
    dw $0005                                                             ;AAC11C;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1           ;AAC11E;

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_1:
    dw $0001                                                             ;AAC120;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2           ;AAC122;
    dw Instruction_Torizo_GotoY_IfRising                                 ;AAC124;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_1       ;AAC126;

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC128;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AAC12A;
    dw Instruction_Torizo_LinkInstructionInY                             ;AAC12C;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_4       ;AAC12E;

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_3:
    dw $0005                                                             ;AAC130;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1           ;AAC132;
    dw Instruction_Common_GotoY                                          ;AAC134;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_3       ;AAC136;

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_4:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAC138;
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds                   ;AAC13A;
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden        ;AAC13C;
    dw InstList_Torizo_FacingRight_Faceless_Walking_LeftLegMoving        ;AAC13E;
    dw InstList_GT_LandedFromBackwardsJump_FacingRight_RightFootFwd      ;AAC140;
    dw Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack                 ;AAC142;
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_0       ;AAC144;
    dw InstList_Torizo_FacingRight_SonicBooms_RightFootForward_0         ;AAC146;
    dw Instruction_Common_GotoY                                          ;AAC148;
    dw InstList_Torizo_FacingRight_Walking_LeftLegMoving                 ;AAC14A;

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC14C;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AAC14E;
    dw Instruction_Torizo_LinkInstructionInY                             ;AAC150;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_2       ;AAC152;
    dw $0005                                                             ;AAC154;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0           ;AAC156;
    dw $0005                                                             ;AAC158;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1           ;AAC15A;

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_1:
    dw $0001                                                             ;AAC15C;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2           ;AAC15E;
    dw Instruction_Torizo_GotoY_IfRising                                 ;AAC160;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_1       ;AAC162;

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC164;
    dw Function_Torizo_Movement_Jumping_Falling                          ;AAC166;
    dw Instruction_Torizo_LinkInstructionInY                             ;AAC168;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_4       ;AAC16A;

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_3:
    dw $0005                                                             ;AAC16C;
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1           ;AAC16E;
    dw Instruction_Common_GotoY                                          ;AAC170;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_3       ;AAC172;

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_4:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAC174;
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds                   ;AAC176;
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden        ;AAC178;
    dw InstList_Torizo_FacingRight_Faceless_Walking_RightLegMoving       ;AAC17A;
    dw InstList_GT_LandedFromBackwardsJump_FacingRight_LeftFootFwd       ;AAC17C;
    dw Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack                 ;AAC17E;
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_0        ;AAC180;
    dw InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_0          ;AAC182;
    dw Instruction_Common_GotoY                                          ;AAC184;
    dw InstList_Torizo_FacingRight_Walking_RightLegMoving                ;AAC186;

InstList_Torizo_FacingRight_Faceless_TurningRight:
    dw Instruction_Torizo_FunctionInY                                    ;AAC188;
    dw Function_Torizo_SimpleMovement                                    ;AAC18A;
    dw Instruction_Torizo_SetTorizoTurningAroundFlag                     ;AAC18C;
    dw $0008                                                             ;AAC18E;
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging            ;AAC190;

InstList_Torizo_FacingRight_Faceless_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState              ;AAC192;
    dw Instruction_Torizo_FunctionInY                                    ;AAC194;
    dw Function_Torizo_NormalMovement                                    ;AAC196;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC198;
    dw Function_Torizo_Movement_Walking                                  ;AAC19A;
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow        ;AAC19C;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAC19E;
    dw $0001                                                             ;AAC1A0;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0            ;AAC1A2;
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront          ;AAC1A4;
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward       ;AAC1A6;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1A8;
    dw $0016,$0005                                                       ;AAC1AA;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1            ;AAC1AE;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1B0;
    dw $0018,$0005                                                       ;AAC1B2;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2            ;AAC1B6;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1B8;
    dw $001A,$0005                                                       ;AAC1BA;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3            ;AAC1BE;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1C0;
    dw $001C,$0005                                                       ;AAC1C2;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4            ;AAC1C6;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1C8;
    dw $001E                                                             ;AAC1CA;

InstList_Torizo_FacingRight_Faceless_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState               ;AAC1CC;
    dw Instruction_Torizo_FunctionInY                                    ;AAC1CE;
    dw Function_Torizo_NormalMovement                                    ;AAC1D0;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAC1D2;
    dw Function_Torizo_Movement_Walking                                  ;AAC1D4;
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow        ;AAC1D6;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAC1D8;
    dw $0001                                                             ;AAC1DA;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0           ;AAC1DC;
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront          ;AAC1DE;
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward        ;AAC1E0;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1E2;
    dw $0020,$0005                                                       ;AAC1E4;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1           ;AAC1E8;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1EA;
    dw $0022,$0005                                                       ;AAC1EC;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2           ;AAC1F0;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1F2;
    dw $0024,$0005                                                       ;AAC1F4;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3           ;AAC1F8;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC1FA;
    dw $0026,$0005                                                       ;AAC1FC;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4           ;AAC200;
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY            ;AAC202;
    dw $0014                                                             ;AAC204;
    dw Instruction_Common_GotoY                                          ;AAC206;
    dw InstList_Torizo_FacingRight_Faceless_Walking_LeftLegMoving        ;AAC208;

MakeTorizoJumpForwards:
    LDA.W EnemyData.initParam0,X                                         ;AAC20A;
    BMI .facingRight                                                     ;AAC20D;
    LDA.W #$FE00                                                         ;AAC20F;
    BRA +                                                                ;AAC212;


.facingRight:
    LDA.W #$0200                                                         ;AAC214;

  + STA.W EnemyData.work0,X                                              ;AAC217;
    LDA.W #$FA40                                                         ;AAC21A;
    STA.W EnemyData.work1,X                                              ;AAC21D;
    LDA.W #$0028                                                         ;AAC220;
    STA.W EnemyData.work2,X                                              ;AAC223;
    LDA.W #$0001                                                         ;AAC226;
    STA.W EnemyData.instTimer,X                                          ;AAC229;
    RTS                                                                  ;AAC22C;


MakeTorizoJumpBackwards:
    LDA.W EnemyData.initParam0,X                                         ;AAC22D;
    BMI .facingRight                                                     ;AAC230;
    LDA.W #$0300                                                         ;AAC232;
    BRA +                                                                ;AAC235;


.facingRight:
    LDA.W #$FD00                                                         ;AAC237;

  + STA.W EnemyData.work0,X                                              ;AAC23A;
    LDA.W #$FB80                                                         ;AAC23D;
    STA.W EnemyData.work1,X                                              ;AAC240;
    LDA.W #$0028                                                         ;AAC243;
    STA.W EnemyData.work2,X                                              ;AAC246;
    LDA.W #$0001                                                         ;AAC249;
    STA.W EnemyData.instTimer,X                                          ;AAC24C;
    RTS                                                                  ;AAC24F;


LoadInitialBombTorizoPalettes:
    PHX                                                                  ;AAC250;
    LDX.W #$001E                                                         ;AAC251;

.loop:
    LDA.W Palette_Torizo_InitialBombTorizo_SpritePalette2,X              ;AAC254;
    STA.L $7EC340,X                                                      ;AAC257;
    LDA.W Palette_Torizo_InitialBombTorizo_SpritePalette1,X              ;AAC25B;
    STA.L $7EC320,X                                                      ;AAC25E;
    DEX                                                                  ;AAC262;
    DEX                                                                  ;AAC263;
    BPL .loop                                                            ;AAC264;
    PLX                                                                  ;AAC266;
    RTS                                                                  ;AAC267;


LoadNormalTorizoTargetPalettes:
    PHX                                                                  ;AAC268;
    LDX.W #$001E                                                         ;AAC269;

.loop:
    LDA.W Palette_Torizo_Normal_SpritePalette2,X                         ;AAC26C;
    STA.L $7EC340,X                                                      ;AAC26F;
    LDA.W Palette_Torizo_Normal_SpritePalette1,X                         ;AAC273;
    STA.L $7EC320,X                                                      ;AAC276;
    DEX                                                                  ;AAC27A;
    DEX                                                                  ;AAC27B;
    BPL .loop                                                            ;AAC27C;
    PLX                                                                  ;AAC27E;
    RTS                                                                  ;AAC27F;


LoadInitialGoldenTorizoPalettes:
    PHX                                                                  ;AAC280;
    LDX.W #$001E                                                         ;AAC281;

.loop:
    LDA.W Palette_Torizo_InitialGoldenTorizo_SpritePalette2,X            ;AAC284;
    STA.L $7EC340,X                                                      ;AAC287;
    LDA.W Palette_Torizo_InitialGoldenTorizo_SpritePalette1,X            ;AAC28B;
    STA.L $7EC320,X                                                      ;AAC28E;
    DEX                                                                  ;AAC292;
    DEX                                                                  ;AAC293;
    BPL .loop                                                            ;AAC294;
    PLX                                                                  ;AAC296;
    RTS                                                                  ;AAC297;


LoadGoldenTorizoPalettes:
    PHX                                                                  ;AAC298;
    LDX.W #$001E                                                         ;AAC299;

.loop:
    LDA.W Palette_Torizo_GoldenTorizo_SpritePalette2,X                   ;AAC29C;
    STA.L $7EC340,X                                                      ;AAC29F;
    LDA.W Palette_Torizo_GoldenTorizo_SpritePalette1,X                   ;AAC2A3;
    STA.L $7EC320,X                                                      ;AAC2A6;
    DEX                                                                  ;AAC2AA;
    DEX                                                                  ;AAC2AB;
    BPL .loop                                                            ;AAC2AC;
    PLX                                                                  ;AAC2AE;
    RTS                                                                  ;AAC2AF;


LoadNormalTorizoPalettes:
    PHX                                                                  ;AAC2B0;
    LDX.W #$001E                                                         ;AAC2B1;

.loop:
    LDA.W Palette_Torizo_Normal_SpritePalette2,X                         ;AAC2B4;
    STA.L $7EC140,X                                                      ;AAC2B7;
    LDA.W Palette_Torizo_Normal_SpritePalette1,X                         ;AAC2BB;
    STA.L $7EC120,X                                                      ;AAC2BE;
    DEX                                                                  ;AAC2C2;
    DEX                                                                  ;AAC2C3;
    BPL .loop                                                            ;AAC2C4;
    PLX                                                                  ;AAC2C6;
    RTS                                                                  ;AAC2C7;


RTL_AAC2C8:
    RTL                                                                  ;AAC2C8;


Instruction_Torizo_SetAnimationLock:
    LDA.W #$7777                                                         ;AAC2C9;
    STA.L $7E7808,X                                                      ;AAC2CC;
    RTL                                                                  ;AAC2D0;


Instruction_Torizo_ClearAnimationLock:
    LDA.W #$0000                                                         ;AAC2D1;
    STA.L $7E7808,X                                                      ;AAC2D4;
    RTL                                                                  ;AAC2D8;


Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden:
    BIT.W EnemyData.initParam1,X                                         ;AAC2D9;
    BVS .faceBlownUp                                                     ;AAC2DC;
    INY                                                                  ;AAC2DE;
    INY                                                                  ;AAC2DF;
    LDA.W $079F                                                          ;AAC2E0;
    BNE .faceBlownUp                                                     ;AAC2E3;
    INY                                                                  ;AAC2E5;
    INY                                                                  ;AAC2E6;
    RTL                                                                  ;AAC2E7;


.faceBlownUp:
    LDA.W $0000,Y                                                        ;AAC2E8;
    TAY                                                                  ;AAC2EB;
    RTL                                                                  ;AAC2EC;


Instruction_Torizo_LinkInstructionInY:
    LDA.W $0000,Y                                                        ;AAC2ED;
    STA.L $7E7800,X                                                      ;AAC2F0;
    INY                                                                  ;AAC2F4;
    INY                                                                  ;AAC2F5;
    RTL                                                                  ;AAC2F6;


Instruction_Torizo_Return:
    LDA.L $7E7800,X                                                      ;AAC2F7;
    TAY                                                                  ;AAC2FB;
    RTL                                                                  ;AAC2FC;


Instruction_Torizo_GotoGutExplosionLinkInstruction:
    LDA.L $7E7802,X                                                      ;AAC2FD;
    TAY                                                                  ;AAC301;
    RTL                                                                  ;AAC302;


Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames:
    PHY                                                                  ;AAC303;
    LDA.W $0000,Y                                                        ;AAC304;
    PHA                                                                  ;AAC307;
    LDY.W #$0005                                                         ;AAC308;

.loop:
    PHY                                                                  ;AAC30B;
    LDA.B $03,S                                                          ;AAC30C;
    LDY.W #EnemyProjectile_BombTorizoLowHealthExplosion                  ;AAC30E;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAC311;
    PLY                                                                  ;AAC315;
    DEY                                                                  ;AAC316;
    BPL .loop                                                            ;AAC317;
    PLA                                                                  ;AAC319;
    PLY                                                                  ;AAC31A;
    INY                                                                  ;AAC31B;
    INY                                                                  ;AAC31C;
    TYA                                                                  ;AAC31D;
    STA.W EnemyData.pInstList,X                                          ;AAC31E;
    LDA.W #$0028                                                         ;AAC321;
    STA.W EnemyData.flashTimer,X                                         ;AAC324;
    STA.W EnemyData.instTimer,X                                          ;AAC327;
    PLA                                                                  ;AAC32A;
    PEA.W ProcessEnemyInstructions_return-1                              ;AAC32B;
    RTL                                                                  ;AAC32E;


Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame:
    PHY                                                                  ;AAC32F;
    LDY.W #EnemyProjectile_BombTorizoDeathExplosion                      ;AAC330;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAC333;
    PLY                                                                  ;AAC337;
    TYA                                                                  ;AAC338;
    STA.W EnemyData.pInstList,X                                          ;AAC339;
    LDA.W #$0001                                                         ;AAC33C;
    STA.W EnemyData.flashTimer,X                                         ;AAC33F;
    STA.W EnemyData.instTimer,X                                          ;AAC342;
    PLA                                                                  ;AAC345;
    PEA.W ProcessEnemyInstructions_return-1                              ;AAC346;
    RTL                                                                  ;AAC349;


Instruction_Torizo_SpawnTorizoLandingDustClouds:
    PHY                                                                  ;AAC34A;
    LDY.W #EnemyProjectile_TorizoLandingDustCloud_RightFoot              ;AAC34B;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAC34E;
    LDY.W #EnemyProjectile_TorizoLandingDustCloud_LeftFoot               ;AAC352;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAC355;
    PLY                                                                  ;AAC359;
    RTL                                                                  ;AAC35A;


Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow:
    LDA.W EnemyData.health,X                                             ;AAC35B;
    CMP.W #$015E                                                         ;AAC35E;
    BCS .return                                                          ;AAC361;
    PHY                                                                  ;AAC363;
    LDY.W #EnemyProjectile_BombTorizoInitialDrool                        ;AAC364;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAC367;
    PLY                                                                  ;AAC36B;

.return:
    RTL                                                                  ;AAC36C;


Instruction_Torizo_SetTorizoTurningAroundFlag:
    LDA.W EnemyData.initParam0,X                                         ;AAC36D;
    ORA.W #$4000                                                         ;AAC370;
    STA.W EnemyData.initParam0,X                                         ;AAC373;
    RTL                                                                  ;AAC376;


Instruction_Torizo_SetSteppedLeftWithLeftFootState:
    LDA.W EnemyData.initParam0,X                                         ;AAC377;
    AND.W #$1FFF                                                         ;AAC37A;
    STA.W EnemyData.initParam0,X                                         ;AAC37D;
    LDA.L $7E7812,X                                                      ;AAC380;
    INC A                                                                ;AAC384;
    STA.L $7E7812,X                                                      ;AAC385;
    RTL                                                                  ;AAC389;


Instruction_Torizo_SetSteppedRightWithRightFootState:
    LDA.W EnemyData.initParam0,X                                         ;AAC38A;
    AND.W #$1FFF                                                         ;AAC38D;
    ORA.W #$8000                                                         ;AAC390;
    STA.W EnemyData.initParam0,X                                         ;AAC393;
    LDA.L $7E7812,X                                                      ;AAC396;
    INC A                                                                ;AAC39A;
    STA.L $7E7812,X                                                      ;AAC39B;
    RTL                                                                  ;AAC39F;


Instruction_Torizo_SetSteppedLeftWithRightFootState:
    LDA.W EnemyData.initParam0,X                                         ;AAC3A0;
    AND.W #$1FFF                                                         ;AAC3A3;
    ORA.W #$2000                                                         ;AAC3A6;
    STA.W EnemyData.initParam0,X                                         ;AAC3A9;
    LDA.L $7E7812,X                                                      ;AAC3AC;
    INC A                                                                ;AAC3B0;
    STA.L $7E7812,X                                                      ;AAC3B1;
    RTL                                                                  ;AAC3B5;


Instruction_Torizo_SetSteppedRightWithLeftFootState:
    LDA.W EnemyData.initParam0,X                                         ;AAC3B6;
    AND.W #$1FFF                                                         ;AAC3B9;
    ORA.W #$A000                                                         ;AAC3BC;
    STA.W EnemyData.initParam0,X                                         ;AAC3BF;
    LDA.L $7E7812,X                                                      ;AAC3C2;
    INC A                                                                ;AAC3C6;
    STA.L $7E7812,X                                                      ;AAC3C7;
    RTL                                                                  ;AAC3CB;


Instruction_Torizo_StandingUpMovement_IndexInY:
    PHY                                                                  ;AAC3CC;
    LDA.W $0000,Y                                                        ;AAC3CD;
    TAY                                                                  ;AAC3D0;
    LDA.W EnemyData.xPosition,X                                          ;AAC3D1;
    CLC                                                                  ;AAC3D4;
    ADC.W .XVelocities,Y                                                 ;AAC3D5;
    STA.W EnemyData.xPosition,X                                          ;AAC3D8;
    TYA                                                                  ;AAC3DB;
    AND.W #$000F                                                         ;AAC3DC;
    TAY                                                                  ;AAC3DF;
    LDA.W EnemyData.yPosition,X                                          ;AAC3E0;
    CLC                                                                  ;AAC3E3;
    ADC.W .YVelocities,Y                                                 ;AAC3E4;
    STA.W EnemyData.yPosition,X                                          ;AAC3E7;
    PLY                                                                  ;AAC3EA;
    INY                                                                  ;AAC3EB;
    INY                                                                  ;AAC3EC;
    RTL                                                                  ;AAC3ED;


.XVelocities:
    dw $FFF7,$FFFA,$FFF9,$0005,$FFF0,$FFF9,$0000,$0000                   ;AAC3EE;
    dw $0009,$0006,$0007,$FFFB,$0010,$0007,$0000,$0000                   ;AAC3FE;

.YVelocities:
    dw $0000,$FFFA,$FFFA,$FFF9,$0000,$0000,$0000,$0000                   ;AAC40E;

Instruction_Torizo_SittingDownMovement_IndexInY:
    PHY                                                                  ;AAC41E;
    LDA.W $0000,Y                                                        ;AAC41F;
    TAY                                                                  ;AAC422;
    LDA.W EnemyData.xPosition,X                                          ;AAC423;
    SEC                                                                  ;AAC426;
    SBC.W .negatedXVelocities,Y                                          ;AAC427;
    STA.W EnemyData.xPosition,X                                          ;AAC42A;
    TYA                                                                  ;AAC42D;
    AND.W #$000F                                                         ;AAC42E;
    TAY                                                                  ;AAC431;
    LDA.W EnemyData.yPosition,X                                          ;AAC432;
    SEC                                                                  ;AAC435;
    SBC.W .negatedYVelocities,Y                                          ;AAC436;
    STA.W EnemyData.yPosition,X                                          ;AAC439;
    PLY                                                                  ;AAC43C;
    INY                                                                  ;AAC43D;
    INY                                                                  ;AAC43E;
    RTL                                                                  ;AAC43F;


.negatedXVelocities:
    dw $FFF7,$FFFA,$FFF9,$0005,$FFF0,$FFF9,$0000,$0000                   ;AAC440;
    dw $0009,$0006,$0007,$FFFB,$0010,$0007,$0000,$0000                   ;AAC450;

.negatedYVelocities:
    dw $0000,$FFFA,$FFFA,$FFF9,$0000,$0000,$0000,$0000                   ;AAC460;

Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY:
    PHY                                                                  ;AAC470;
    STZ.B $12                                                            ;AAC471;
    LDA.W $0000,Y                                                        ;AAC473;
    TAY                                                                  ;AAC476;
    LDA.W .velocities,Y                                                  ;AAC477;
    STA.B $14                                                            ;AAC47A;
    STA.W EnemyData.work0,X                                              ;AAC47C;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;AAC47F;
    PLY                                                                  ;AAC483;
    BCC .noCollision                                                     ;AAC484;
    LDA.W #$0000                                                         ;AAC486;
    STA.L $7E7806,X                                                      ;AAC489;
    LDA.W EnemyData.initParam0,X                                         ;AAC48D;
    BMI .turningLeft                                                     ;AAC490;
    LDY.W #InstList_Torizo_FacingRight_TurningRight                      ;AAC492;
    RTL                                                                  ;AAC495;


.turningLeft:
    LDY.W #InstList_Torizo_FacingLeft_TurningLeft                        ;AAC496;
    RTL                                                                  ;AAC499;


.noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;AAC49A;
    LDA.W $0AF6                                                          ;AAC49E;
    SEC                                                                  ;AAC4A1;
    SBC.W EnemyData.xPosition,X                                          ;AAC4A2;
    EOR.W EnemyData.initParam0,X                                         ;AAC4A5;
    BPL .facingAway                                                      ;AAC4A8;
    INY                                                                  ;AAC4AA;
    INY                                                                  ;AAC4AB;
    RTL                                                                  ;AAC4AC;


.facingAway:
    LDA.L $7E7806,X                                                      ;AAC4AD;
    BNE .return                                                          ;AAC4B1;
    LDA.W #$0048                                                         ;AAC4B3;
    STA.L $7E7806,X                                                      ;AAC4B6;

.return:
    INY                                                                  ;AAC4BA;
    INY                                                                  ;AAC4BB;
    RTL                                                                  ;AAC4BC;


.velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9                   ;AAC4BD;
    dw $FFEF,$FFEE,$0005,$0000,$0005,$0013,$0010,$0007                   ;AAC4CD;
    dw $0000,$0007,$0011,$0012                                           ;AAC4DD;

Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY:
    PHY                                                                  ;AAC4E5;
    STZ.B $12                                                            ;AAC4E6;
    LDA.W $0000,Y                                                        ;AAC4E8;
    TAY                                                                  ;AAC4EB;
    LDA.W .velocities,Y                                                  ;AAC4EC;
    STA.B $14                                                            ;AAC4EF;
    STA.W EnemyData.work0,X                                              ;AAC4F1;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;AAC4F4;
    PLY                                                                  ;AAC4F8;
    BCC .noCollision                                                     ;AAC4F9;
    LDA.W #$0000                                                         ;AAC4FB;
    STA.L $7E7806,X                                                      ;AAC4FE;
    LDA.W EnemyData.initParam0,X                                         ;AAC502;
    BMI .turningLeft                                                     ;AAC505;
    LDY.W #InstList_Torizo_FacingRight_Faceless_TurningRight             ;AAC507;
    RTL                                                                  ;AAC50A;


.turningLeft:
    LDY.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft               ;AAC50B;
    RTL                                                                  ;AAC50E;


.noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;AAC50F;
    LDA.W $0AF6                                                          ;AAC513;
    SEC                                                                  ;AAC516;
    SBC.W EnemyData.xPosition,X                                          ;AAC517;
    EOR.W EnemyData.initParam0,X                                         ;AAC51A;
    BPL .facingAway                                                      ;AAC51D;
    INY                                                                  ;AAC51F;
    INY                                                                  ;AAC520;
    RTL                                                                  ;AAC521;


.facingAway:
    LDA.L $7E7806,X                                                      ;AAC522;
    BNE .return                                                          ;AAC526;
    LDA.W #$0048                                                         ;AAC528;
    STA.L $7E7806,X                                                      ;AAC52B;

.return:
    INY                                                                  ;AAC52F;
    INY                                                                  ;AAC530;
    RTL                                                                  ;AAC531;


.velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9                   ;AAC532;
    dw $FFEF,$FFEE,$0005,$0000,$0005,$0013,$0010,$0007                   ;AAC542;
    dw $0000,$0007,$0011,$0012                                           ;AAC552;

Instruction_Torizo_GotoY_IfRising:
    LDA.W EnemyData.work1,X                                              ;AAC55A;
    BMI .rising                                                          ;AAC55D;
    INY                                                                  ;AAC55F;
    INY                                                                  ;AAC560;
    RTL                                                                  ;AAC561;


.rising:
    LDA.W $0000,Y                                                        ;AAC562;
    TAY                                                                  ;AAC565;
    RTL                                                                  ;AAC566;


Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront:
    LDA.W #$0038                                                         ;AAC567;
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA                 ;AAC56A;
    BCC .near                                                            ;AAC56E;

.return:
    INY                                                                  ;AAC570;
    INY                                                                  ;AAC571;
    RTL                                                                  ;AAC572;


.near:
    LDA.W $0AF6                                                          ;AAC573;
    SEC                                                                  ;AAC576;
    SBC.W EnemyData.xPosition,X                                          ;AAC577;
    EOR.W EnemyData.initParam0,X                                         ;AAC57A;
    BPL .return                                                          ;AAC57D;
    TYA                                                                  ;AAC57F;
    INC A                                                                ;AAC580;
    INC A                                                                ;AAC581;
    STA.L $7E7800,X                                                      ;AAC582;
    LDA.W $0000,Y                                                        ;AAC586;
    TAY                                                                  ;AAC589;
    RTL                                                                  ;AAC58A;


Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels:
    LDA.W #$0020                                                         ;AAC58B;
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA                 ;AAC58E;
    BCS .return                                                          ;AAC592;
    JSR.W CheckIfTorizoIsFacingSamus                                     ;AAC594;
    BMI .return                                                          ;AAC597;
    JSR.W MakeTorizoJumpBackwards                                        ;AAC599;
    LDA.W $0000,Y                                                        ;AAC59C;
    TAY                                                                  ;AAC59F;
    RTL                                                                  ;AAC5A0;


.return:
    INY                                                                  ;AAC5A1;
    INY                                                                  ;AAC5A2;
    RTL                                                                  ;AAC5A3;


Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack:
    TYA                                                                  ;AAC5A4;
    INC A                                                                ;AAC5A5;
    INC A                                                                ;AAC5A6;
    INC A                                                                ;AAC5A7;
    INC A                                                                ;AAC5A8;
    STA.L $7E7800,X                                                      ;AAC5A9;
    LDA.W $09C6                                                          ;AAC5AD;
    CMP.W #$0005                                                         ;AAC5B0;
    BCC .spewOrbs                                                        ;AAC5B3;
    LDA.W $0AF6                                                          ;AAC5B5;
    LSR A                                                                ;AAC5B8;
    ADC.W $05B6                                                          ;AAC5B9;
    BIT.W #$0008                                                         ;AAC5BC;
    BEQ .sonicBooms                                                      ;AAC5BF;

.spewOrbs:
    LDA.W $0000,Y                                                        ;AAC5C1;
    BRA .return                                                          ;AAC5C4;


.sonicBooms:
    LDA.W $0002,Y                                                        ;AAC5C6;

.return:
    TAY                                                                  ;AAC5C9;
    RTL                                                                  ;AAC5CA;


Instruction_Torizo_SpawnBombTorizosChozoOrbs:
    PHY                                                                  ;AAC5CB;
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs                           ;AAC5CC;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAC5CF;
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs                           ;AAC5D3;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAC5D6;
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs                           ;AAC5DA;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAC5DD;
    PLY                                                                  ;AAC5E1;
    RTL                                                                  ;AAC5E2;


Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY:
    PHY                                                                  ;AAC5E3;
    LDA.W $0000,Y                                                        ;AAC5E4;
    LDY.W #EnemyProjectile_BombTorizoSonicBoom                           ;AAC5E7;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAC5EA;
    PLY                                                                  ;AAC5EE;
    INY                                                                  ;AAC5EF;
    INY                                                                  ;AAC5F0;
    RTL                                                                  ;AAC5F1;


Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY:
    PHY                                                                  ;AAC5F2;
    LDA.W $0000,Y                                                        ;AAC5F3;
    LDY.W #EnemyProjectile_GoldenTorizoSonicBoom                         ;AAC5F6;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAC5F9;
    PLY                                                                  ;AAC5FD;
    INY                                                                  ;AAC5FE;
    INY                                                                  ;AAC5FF;
    RTL                                                                  ;AAC600;


Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY:
    PHY                                                                  ;AAC601;
    LDA.W $0000,Y                                                        ;AAC602;
    LDY.W #EnemyProjectile_BombTorizoExplosiveSwipe                      ;AAC605;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAC608;
    PLY                                                                  ;AAC60C;
    INY                                                                  ;AAC60D;
    INY                                                                  ;AAC60E;
    RTL                                                                  ;AAC60F;


Instruction_Torizo_PlayShotTorizoSFX:
    LDA.W #$0027                                                         ;AAC610;
    JSL.L QueueSound_Lib2_Max6                                           ;AAC613;
    RTL                                                                  ;AAC617;


Instruction_Torizo_PlayTorizoFootstepsSFX:
    LDA.W #$004B                                                         ;AAC618;
    JSL.L QueueSound_Lib2_Max6                                           ;AAC61B;
    RTL                                                                  ;AAC61F;


HandleLowHealthInitialDrool:
    LDA.W $079F                                                          ;AAC620;
    BEQ .crateria                                                        ;AAC623;
    JMP.W .returnNotCrateria                                             ;AAC625; >.<


.crateria:
    LDA.W $05E5                                                          ;AAC628;
    AND.W #$8142                                                         ;AAC62B; If [random number] & 8142h = 0: (1/16 chance)
    BNE .return                                                          ;AAC62E;
    LDA.W EnemyData.health,X                                             ;AAC630;
    BEQ .return                                                          ;AAC633;
    CMP.W #$015E                                                         ;AAC635;
    BCS .return                                                          ;AAC638;
    LDY.W #EnemyProjectile_BombTorizoInitialDrool                        ;AAC63A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAC63D;

.return:
    RTS                                                                  ;AAC641;


.returnNotCrateria:
    RTS                                                                  ;AAC642; >.<


HandleFalling:
    STZ.B $12                                                            ;AAC643;
    STZ.B $14                                                            ;AAC645;
    LDA.W EnemyData.work1,X                                              ;AAC647;
    BPL +                                                                ;AAC64A;
    DEC.B $14                                                            ;AAC64C;

  + STA.B $13                                                            ;AAC64E;
    JSL.L MoveEnemyDownBy_14_12                                          ;AAC650;
    BCS .collision                                                       ;AAC654;
    LDA.W EnemyData.work1,X                                              ;AAC656;
    CLC                                                                  ;AAC659;
    ADC.W #$0028                                                         ;AAC65A;
    STA.W EnemyData.work1,X                                              ;AAC65D;
    RTS                                                                  ;AAC660;


.collision:
    LDA.W EnemyData.work1,X                                              ;AAC661;
    BMI .return                                                          ;AAC664;
    CMP.W #$0100                                                         ;AAC666;
    BEQ .return                                                          ;AAC669;
    LDA.W #$0004                                                         ;AAC66B;
    STA.W $183E                                                          ;AAC66E;
    LDA.W #$0020                                                         ;AAC671;
    STA.W $1840                                                          ;AAC674;
    LDA.W #$0100                                                         ;AAC677;
    STA.W EnemyData.work1,X                                              ;AAC67A;

.return:
    RTS                                                                  ;AAC67D;


HurtAI_BombTorizo:
    LDX.W $0E54                                                          ;AAC67E;
    JSR.W HandleLowHealthInitialDrool                                    ;AAC681;
    LDA.W EnemyData.flashTimer,X                                         ;AAC684;
    LSR A                                                                ;AAC687;
    BCS .flash                                                           ;AAC688;
    JSR.W LoadNormalTorizoPalettes                                       ;AAC68A;
    BRA .return                                                          ;AAC68D;


.flash:
    PHX                                                                  ;AAC68F;
    LDX.W #$001E                                                         ;AAC690;

.loop:
    LDA.W #$7FFF                                                         ;AAC693;
    STA.L $7EC140,X                                                      ;AAC696;
    STA.L $7EC120,X                                                      ;AAC69A;
    DEX                                                                  ;AAC69E;
    DEX                                                                  ;AAC69F;
    BPL .loop                                                            ;AAC6A0;
    PLX                                                                  ;AAC6A2;

.return:
    RTL                                                                  ;AAC6A3;


MainAI_BombTorizo:
    LDX.W $0E54                                                          ;AAC6A4;
    JSR.W ($0FB0,X)                                                      ;AAC6A7;
    RTL                                                                  ;AAC6AA;


RTS_AAC6AB:
    RTS                                                                  ;AAC6AB;


UNUSED_Torizo_AAC6AC:
    JSR.W HandleFalling                                                  ;AAC6AC;
    LDA.W #$0600                                                         ;AAC6AF;
    JSL.L Advance_GradualColorChange_ofPalettesInA_Denominator_C         ;AAC6B2;
    BCS .return                                                          ;AAC6B6;
    LDA.W #RTS_AAC6AB                                                    ;AAC6B8;
    STA.W EnemyData.work4,X                                              ;AAC6BB;

.return:
    RTS                                                                  ;AAC6BE;


Function_Torizo_SimpleMovement:
    JSR.W HandleLowHealthInitialDrool                                    ;AAC6BF;
    JSR.W HandleFalling                                                  ;AAC6C2;
    RTS                                                                  ;AAC6C5;


Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling:
    LDA.W EnemyData.properties,X                                         ;AAC6C6;
    ORA.W #$0400                                                         ;AAC6C9;
    STA.W EnemyData.properties,X                                         ;AAC6CC;
    PHX                                                                  ;AAC6CF;
    LDX.W #$004E                                                         ;AAC6D0;

.loop:
    LDA.W $1C37,X                                                        ;AAC6D3;
    CMP.W #PLMEntries_BombTorizosCrumblingChozo                          ;AAC6D6;
    BEQ .return                                                          ;AAC6D9;
    DEX                                                                  ;AAC6DB;
    DEX                                                                  ;AAC6DC;
    BPL .loop                                                            ;AAC6DD;
    PLX                                                                  ;AAC6DF;
    LDA.W TorizoMusicTracks_song1                                        ;AAC6E0;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;AAC6E3;
    LDA.W EnemyData.properties,X                                         ;AAC6E7;
    AND.W #$FBFF                                                         ;AAC6EA;
    STA.W EnemyData.properties,X                                         ;AAC6ED;
    INC.W EnemyData.pInstList,X                                          ;AAC6F0;
    INC.W EnemyData.pInstList,X                                          ;AAC6F3;
    LDA.W #$0001                                                         ;AAC6F6;
    STA.W EnemyData.instTimer,X                                          ;AAC6F9;
    RTS                                                                  ;AAC6FC;


.return:
    PLX                                                                  ;AAC6FD;
    RTS                                                                  ;AAC6FE;


Function_Torizo_NormalMovement:
    JSR.W HandleLowHealthInitialDrool                                    ;AAC6FF;
    BIT.W EnemyData.initParam1,X                                         ;AAC702;
    BMI .notLowHealth                                                    ;AAC705;
    LDA.W EnemyData.health,X                                             ;AAC707;
    CMP.W #$015E                                                         ;AAC70A;
    BCS .notLowHealth                                                    ;AAC70D;
    LDA.W EnemyData.pInstList,X                                          ;AAC70F;
    STA.L $7E7802,X                                                      ;AAC712;
    LDA.W #InstList_Torizo_SpecialCallable_BlowUpBombTorizosGut          ;AAC716;
    STA.W EnemyData.pInstList,X                                          ;AAC719;
    LDA.W #$0001                                                         ;AAC71C;
    STA.W EnemyData.instTimer,X                                          ;AAC71F;
    RTS                                                                  ;AAC722;


.notLowHealth:
    BIT.W EnemyData.initParam1,X                                         ;AAC723;
    BVS .noChange                                                        ;AAC726;
    LDA.W EnemyData.health,X                                             ;AAC728;
    CMP.W #$0064                                                         ;AAC72B;
    BCS .noChange                                                        ;AAC72E;
    LDA.W EnemyData.initParam0,X                                         ;AAC730;
    BMI .facingRight                                                     ;AAC733;
    LDA.W #InstList_Torizo_FacingRight_Faceless_TurningRight             ;AAC735;
    BRA +                                                                ;AAC738;


.facingRight:
    LDA.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft               ;AAC73A;

  + STA.L $7E7800,X                                                      ;AAC73D;
    LDA.W #InstList_Torizo_Callable_BlowUpBombTorizosFace                ;AAC741;
    STA.W EnemyData.pInstList,X                                          ;AAC744;
    LDA.W #$0001                                                         ;AAC747;
    STA.W EnemyData.instTimer,X                                          ;AAC74A;
    RTS                                                                  ;AAC74D;


.noChange:
    JSR.W ($0FB2,X)                                                      ;AAC74E;
    RTS                                                                  ;AAC751;


Function_Torizo_Movement_Walking:
    BIT.W EnemyData.initParam1,X                                         ;AAC752;
    BVC .notFaceless                                                     ;AAC755;
    JMP.W .faceless                                                      ;AAC757;


.notFaceless:
    LDA.L $7E7806,X                                                      ;AAC75A;
    BEQ .notTurning                                                      ;AAC75E;
    DEC A                                                                ;AAC760;
    STA.L $7E7806,X                                                      ;AAC761;
    BNE .notTurning                                                      ;AAC765;
    LDA.W #$0000                                                         ;AAC767;
    STA.L $7E7806,X                                                      ;AAC76A;
    LDA.W EnemyData.initParam0,X                                         ;AAC76E;
    BMI .facingRight                                                     ;AAC771;
    LDA.W #InstList_Torizo_FacingRight_TurningRight                      ;AAC773;
    BRA +                                                                ;AAC776;


.facingRight:
    LDA.W #InstList_Torizo_FacingLeft_TurningLeft                        ;AAC778;

  + STA.W EnemyData.pInstList,X                                          ;AAC77B;
    LDA.W #$0001                                                         ;AAC77E;
    STA.W EnemyData.instTimer,X                                          ;AAC781;
    RTS                                                                  ;AAC784;


.notTurning:
    STZ.B $12                                                            ;AAC785;
    LDA.W EnemyData.work0,X                                              ;AAC787;
    BPL +                                                                ;AAC78A;
    EOR.W #$FFFF                                                         ;AAC78C;
    INC A                                                                ;AAC78F;

  + INC A                                                                ;AAC790;
    CMP.W #$0010                                                         ;AAC791;
    BCC +                                                                ;AAC794;
    LDA.W #$000F                                                         ;AAC796;

  + STA.B $14                                                            ;AAC799;
    JSL.L MoveEnemyDownBy_14_12                                          ;AAC79B;
    BCS .returnUpper                                                     ;AAC79F;
    LDA.W EnemyData.initParam0,X                                         ;AAC7A1;
    BMI ..facingRight                                                    ;AAC7A4;
    LDA.W #InstList_Torizo_FacingLeft_Falling_0                          ;AAC7A6;
    BRA +                                                                ;AAC7A9;


..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0                         ;AAC7AB;

  + STA.W EnemyData.pInstList,X                                          ;AAC7AE;
    LDA.W #$0001                                                         ;AAC7B1;
    STA.W EnemyData.instTimer,X                                          ;AAC7B4;
    LDA.W #$0100                                                         ;AAC7B7;
    STA.W EnemyData.work1,X                                              ;AAC7BA;
    STZ.W EnemyData.work0,X                                              ;AAC7BD;

.returnUpper:
    RTS                                                                  ;AAC7C0;


.faceless:
    LDA.L $7E7806,X                                                      ;AAC7C1;
    BEQ .facelessNotTurning                                              ;AAC7C5;
    DEC A                                                                ;AAC7C7;
    STA.L $7E7806,X                                                      ;AAC7C8;
    BNE .facelessNotTurning                                              ;AAC7CC;
    LDA.W #$0000                                                         ;AAC7CE;
    STA.L $7E7806,X                                                      ;AAC7D1;
    LDA.W EnemyData.initParam0,X                                         ;AAC7D5;
    BMI ..facingRight                                                    ;AAC7D8;
    LDA.W #InstList_Torizo_FacingRight_Faceless_TurningRight             ;AAC7DA;
    BRA +                                                                ;AAC7DD;


..facingRight:
    LDA.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft               ;AAC7DF;

  + STA.W EnemyData.pInstList,X                                          ;AAC7E2;
    LDA.W #$0001                                                         ;AAC7E5;
    STA.W EnemyData.instTimer,X                                          ;AAC7E8;
    RTS                                                                  ;AAC7EB;


.facelessNotTurning:
    STZ.B $12                                                            ;AAC7EC;
    LDA.W EnemyData.work0,X                                              ;AAC7EE;
    BPL +                                                                ;AAC7F1;
    EOR.W #$FFFF                                                         ;AAC7F3;
    INC A                                                                ;AAC7F6;

  + INC A                                                                ;AAC7F7;
    CMP.W #$0010                                                         ;AAC7F8;
    BCC +                                                                ;AAC7FB;
    LDA.W #$000F                                                         ;AAC7FD;

  + STA.B $14                                                            ;AAC800;
    JSL.L MoveEnemyDownBy_14_12                                          ;AAC802;
    BCS .returnLower                                                     ;AAC806;
    LDA.W EnemyData.initParam0,X                                         ;AAC808;
    BMI ..facingRight                                                    ;AAC80B;
    LDA.W #InstList_Torizo_FacingLeft_Falling_0                          ;AAC80D;
    BRA +                                                                ;AAC810;


..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0                         ;AAC812;

  + STA.W EnemyData.pInstList,X                                          ;AAC815;
    LDA.W #$0001                                                         ;AAC818;
    STA.W EnemyData.instTimer,X                                          ;AAC81B;
    LDA.W #$0100                                                         ;AAC81E;
    STA.W EnemyData.work1,X                                              ;AAC821;
    STZ.W EnemyData.work0,X                                              ;AAC824;

.returnLower:
    RTS                                                                  ;AAC827;


Function_Torizo_Movement_Attacking:
    JSR.W HandleFalling                                                  ;AAC828;
    RTS                                                                  ;AAC82B;


Function_Torizo_Movement_Jumping_Falling:
    STZ.B $12                                                            ;AAC82C;
    STZ.B $14                                                            ;AAC82E;
    LDA.W EnemyData.work0,X                                              ;AAC830;
    BPL +                                                                ;AAC833;
    DEC.B $14                                                            ;AAC835;

  + STA.B $13                                                            ;AAC837;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;AAC839;
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;AAC83D;
    STZ.B $12                                                            ;AAC841;
    STZ.B $14                                                            ;AAC843;
    LDA.W EnemyData.work1,X                                              ;AAC845;
    BPL +                                                                ;AAC848;
    DEC.B $14                                                            ;AAC84A;

  + STA.B $13                                                            ;AAC84C;
    JSL.L MoveEnemyDownBy_14_12                                          ;AAC84E;
    BCS .collision                                                       ;AAC852;
    LDA.W EnemyData.work1,X                                              ;AAC854;
    CLC                                                                  ;AAC857;
    ADC.W EnemyData.work2,X                                              ;AAC858;
    STA.W EnemyData.work1,X                                              ;AAC85B;
    RTS                                                                  ;AAC85E;


.collision:
    LDA.L $7E7800,X                                                      ;AAC85F;
    STA.W EnemyData.pInstList,X                                          ;AAC863;
    LDA.W #$0001                                                         ;AAC866;
    STA.W EnemyData.instTimer,X                                          ;AAC869;
    LDA.W #$0100                                                         ;AAC86C;
    STA.W EnemyData.work1,X                                              ;AAC86F;
    LDA.W #$0004                                                         ;AAC872;
    STA.W $183E                                                          ;AAC875;
    LDA.W #$0020                                                         ;AAC878;
    STA.W $1840                                                          ;AAC87B;
    RTS                                                                  ;AAC87E;


InitAI_Torizo:
    LDA.W #$0004                                                         ;AAC87F;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;AAC882;
    BCC .notDead                                                         ;AAC886;
    LDX.W $0E54                                                          ;AAC888;
    LDA.W EnemyData.properties,X                                         ;AAC88B;
    ORA.W #$0200                                                         ;AAC88E;
    STA.W EnemyData.properties,X                                         ;AAC891;
    RTL                                                                  ;AAC894;


.notDead:
    LDY.W $079F                                                          ;AAC895;
    LDX.W $0E54                                                          ;AAC898;
    LDA.W EnemyData.properties,X                                         ;AAC89B;
    ORA.W TorizoInitial_properties,Y                                     ;AAC89E;
    STA.W EnemyData.properties,X                                         ;AAC8A1;
    LDA.W EnemyData.properties2,X                                        ;AAC8A4;
    ORA.W #$0004                                                         ;AAC8A7;
    STA.W EnemyData.properties2,X                                        ;AAC8AA;
    LDA.W TorizoInitial_XRadius,Y                                        ;AAC8AD;
    STA.W EnemyData.xHitboxRadius,X                                      ;AAC8B0;
    LDA.W TorizoInitial_YRadius,Y                                        ;AAC8B3;
    STA.W EnemyData.yHitboxRadius,X                                      ;AAC8B6;
    LDA.W #Function_Torizo_SimpleMovement                                ;AAC8B9;
    STA.W EnemyData.work4,X                                              ;AAC8BC;
    LDA.W #$0001                                                         ;AAC8BF;
    STA.W EnemyData.instTimer,X                                          ;AAC8C2;
    STZ.W EnemyData.loopCounter,X                                        ;AAC8C5;
    STZ.W EnemyData.palette,X                                            ;AAC8C8;
    LDA.W #RTS_AAC95E                                                    ;AAC8CB;
    STA.W EnemyData.work5,X                                              ;AAC8CE;
    LDA.W TorizoInitial_instListPointer,Y                                ;AAC8D1;
    STA.W EnemyData.pInstList,X                                          ;AAC8D4;
    LDA.W #ExtendedSpritemap_Torizo_Blank                                ;AAC8D7;
    STA.W EnemyData.pSpritemap,X                                         ;AAC8DA;
    LDA.W TorizoInitial_XPosition,Y                                      ;AAC8DD;
    STA.W EnemyData.xPosition,X                                          ;AAC8E0;
    LDA.W TorizoInitial_YPosition,Y                                      ;AAC8E3;
    STA.W EnemyData.yPosition,X                                          ;AAC8E6;
    STZ.W EnemyData.work0,X                                              ;AAC8E9;
    LDA.W #$0100                                                         ;AAC8EC;
    STA.W EnemyData.work1,X                                              ;AAC8EF;
    LDX.W #$001E                                                         ;AAC8F2;

.loopTargetPalettes:
    LDA.W Palette_Torizo_BombTorizoStatue,X                              ;AAC8F5;
    STA.L $7EC3E0,X                                                      ;AAC8F8;
    LDA.W Palette_Torizo_OrbProjectile,X                                 ;AAC8FC;
    STA.L $7EC360,X                                                      ;AAC8FF;
    DEX                                                                  ;AAC903;
    DEX                                                                  ;AAC904;
    BPL .loopTargetPalettes                                              ;AAC905;
    LDA.W $079F                                                          ;AAC907;
    BNE .GTCode                                                          ;AAC90A;
    JSR.W LoadInitialBombTorizoPalettes                                  ;AAC90C;
    JSL.L Spawn_BombTorizoHaze                                           ;AAC90F;
    RTL                                                                  ;AAC913;


.GTCode:
    JSR.W LoadInitialGoldenTorizoPalettes                                ;AAC914;
    LDA.B $8B                                                            ;AAC917;
    CMP.W #$C0C0                                                         ;AAC919; ABXY inputs
    BNE .return                                                          ;AAC91C;
    LDA.W #$02BC                                                         ;AAC91E;
    STA.W $09C2                                                          ;AAC921;
    STA.W $09C4                                                          ;AAC924;
    LDA.W #$012C                                                         ;AAC927;
    STA.W $09D4                                                          ;AAC92A;
    STA.W $09D6                                                          ;AAC92D;
    LDA.W #$0064                                                         ;AAC930;
    STA.W $09C6                                                          ;AAC933;
    STA.W $09C8                                                          ;AAC936;
    LDA.W #$0014                                                         ;AAC939;
    STA.W $09CA                                                          ;AAC93C;
    STA.W $09CC                                                          ;AAC93F;
    LDA.W #$0014                                                         ;AAC942;
    STA.W $09CE                                                          ;AAC945;
    STA.W $09D0                                                          ;AAC948;
    LDA.W #$F337                                                         ;AAC94B;
    STA.W $09A2                                                          ;AAC94E;
    STA.W $09A4                                                          ;AAC951;
    LDA.W #$100F                                                         ;AAC954;
    STA.W $09A6                                                          ;AAC957;
    STA.W $09A8                                                          ;AAC95A;

.return:
    RTL                                                                  ;AAC95D;


RTS_AAC95E:
    RTS                                                                  ;AAC95E;


TorizoInitial_XPosition:
    dw $00DB,$01A8                                                       ;AAC95F;

TorizoInitial_YPosition:
    dw $00B3,$0090                                                       ;AAC963;

TorizoInitial_instListPointer:
    dw InstList_Torizo_BombTorizo_Initial_0                              ;AAC967;
    dw InstList_GoldenTorizo_Initial_0                                   ;AAC969;

TorizoInitial_properties:
    dw $2800,$2800                                                       ;AAC96B;

TorizoInitial_XRadius:
    dw $0012,$0012                                                       ;AAC96F;

TorizoInitial_YRadius:
    dw $0030,$0029                                                       ;AAC973;

EnemyTouch_Torizo:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;AAC977;
    RTL                                                                  ;AAC97B;


EnemyShot_Torizo_Normal:
    LDA.W $079F                                                          ;AAC97C;
    BEQ .crateria                                                        ;AAC97F;
    JMP.W ShotReaction_GoldenTorizo_Normal                               ;AAC981;


.crateria:
    LDX.W $0E54                                                          ;AAC984;
    LDA.W EnemyData.flashTimer,X                                         ;AAC987;
    ORA.L $7E7808,X                                                      ;AAC98A;
    BNE .return                                                          ;AAC98E;
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;AAC990;
    LDX.W $0E54                                                          ;AAC994;
    LDA.W EnemyData.health,X                                             ;AAC997;
    BNE .return                                                          ;AAC99A;
    LDA.W #RTS_AAC6AB                                                    ;AAC99C;
    STA.W EnemyData.work4,X                                              ;AAC99F;
    LDA.W #InstList_Torizo_DeathSequence_0                               ;AAC9A2;
    STA.W EnemyData.pInstList,X                                          ;AAC9A5;
    LDA.W #$0001                                                         ;AAC9A8;
    STA.W EnemyData.instTimer,X                                          ;AAC9AB;
    LDA.W EnemyData.initParam1,X                                         ;AAC9AE;
    ORA.W #$C000                                                         ;AAC9B1;
    STA.W EnemyData.initParam1,X                                         ;AAC9B4;
    LDA.W EnemyData.properties,X                                         ;AAC9B7;
    ORA.W #$0400                                                         ;AAC9BA;
    STA.W EnemyData.properties,X                                         ;AAC9BD;

.return:
    RTL                                                                  ;AAC9C0;


RTL_AAC9C1:
    RTL                                                                  ;AAC9C1;


EnemyShot_Torizo_StandUp_SitDown:
    LDA.W $079F                                                          ;AAC9C2;
    BEQ .return                                                          ;AAC9C5;
    JMP.W ShotReaction_GoldenTorizo_StandUp_SitDown                      ;AAC9C7;


.return:
    RTL                                                                  ;AAC9CA;


InstList_GoldenTorizo_Initial_0:
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAC9CB;
    dw $0600                                                             ;AAC9CD;
    dl Tiles_GoldenTorizoEgg                                             ;AAC9CF;
    dw $6D00                                                             ;AAC9D2;
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState               ;AAC9D4;
    dw Instruction_Torizo_SetAnimationLock                               ;AAC9D6;
    dw Instruction_Torizo_FunctionInY                                    ;AAC9D8;
    dw Function_GoldenTorizo_WakeIfSamusIsBelowAndRightOfTargetPos       ;AAC9DA;
    dw $0001                                                             ;AAC9DC;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3            ;AAC9DE;
    dw Instruction_Common_Sleep                                          ;AAC9E0;
    dw Instruction_Torizo_FunctionInY                                    ;AAC9E2;
    dw Function_Torizo_SimpleMovement                                    ;AAC9E4;

InstList_GoldenTorizo_Initial_1:
    dw $0001                                                             ;AAC9E6;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3            ;AAC9E8;
    dw Instruction_Torizo_GotoY_IfNotHitGround                           ;AAC9EA;
    dw InstList_GoldenTorizo_Initial_1                                   ;AAC9EC;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAC9EE;
    dw $0003                                                             ;AAC9F0;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3            ;AAC9F2;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AAC9F4;
    dw $0004,$0004                                                       ;AAC9F6;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2            ;AAC9FA;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AAC9FC;
    dw $0002,$0005                                                       ;AAC9FE;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1            ;AACA02;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACA04;
    dw $0000                                                             ;AACA06;
    dw Instruction_Torizo_FunctionInY                                    ;AACA08;
    dw RTS_AAC6AB                                                        ;AACA0A;
    dw $0030                                                             ;AACA0C;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA0E;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AACA10;
    dw $0040                                                             ;AACA12;
    dl Tiles_Torizo                                                      ;AACA14;
    dw $7D80,$0020                                                       ;AACA17;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA1B;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AACA1D;
    dw $0040                                                             ;AACA1F;
    dl Tiles_Torizo_AAB2B9                                               ;AACA21;
    dw $7D80,$0010                                                       ;AACA24;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA28;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AACA2A;
    dw $0040                                                             ;AACA2C;
    dl Tiles_Torizo_AAB2F9                                               ;AACA2E;
    dw $7D80,$0008                                                       ;AACA31;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA35;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AACA37;
    dw $0040                                                             ;AACA39;
    dl Tiles_Torizo_AAB339                                               ;AACA3B;
    dw $7D80,$0020                                                       ;AACA3E;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA42;
    dw Instruction_Common_TimerInY                                       ;AACA44;
    dw $0002                                                             ;AACA46;

InstList_GoldenTorizo_Initial_2:
    dw $0004                                                             ;AACA48;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA4A;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AACA4C;
    dw $0040                                                             ;AACA4E;
    dl Tiles_Torizo                                                      ;AACA50;
    dw $7D80,$0004                                                       ;AACA53;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA57;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AACA59;
    dw $0040                                                             ;AACA5B;
    dl Tiles_Torizo_AAB2B9                                               ;AACA5D;
    dw $7D80,$0004                                                       ;AACA60;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA64;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AACA66;
    dw $0040                                                             ;AACA68;
    dl Tiles_Torizo_AAB2F9                                               ;AACA6A;
    dw $7D80,$0004                                                       ;AACA6D;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA71;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AACA73;
    dw $0040                                                             ;AACA75;
    dl Tiles_Torizo_AAB339                                               ;AACA77;
    dw $7D80                                                             ;AACA7A;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACA7C;
    dw InstList_GoldenTorizo_Initial_2                                   ;AACA7E;
    dw $0020                                                             ;AACA80;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACA82;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACA84;
    dw $0000,$000C                                                       ;AACA86;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1            ;AACA8A;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACA8C;
    dw $0002,$0008                                                       ;AACA8E;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2            ;AACA92;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACA94;
    dw $0004,$0008                                                       ;AACA96;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3            ;AACA9A;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACA9C;
    dw $0006,$0008                                                       ;AACA9E;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4            ;AACAA2;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACAA4;
    dw $0008,$0008                                                       ;AACAA6;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5            ;AACAAA;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACAAC;
    dw $000A                                                             ;AACAAE;
    dw Instruction_Torizo_LoadGoldenTorizoPalettes                       ;AACAB0;
    dw Instruction_Common_TimerInY                                       ;AACAB2;
    dw $0010                                                             ;AACAB4;

InstList_GoldenTorizo_Initial_3:
    dw $0004                                                             ;AACAB6;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6            ;AACAB8;
    dw Instruction_Torizo_AdvanceGradualColorChange                      ;AACABA;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACABC;
    dw InstList_GoldenTorizo_Initial_3                                   ;AACABE;
    dw RTL_AAC2C8                                                        ;AACAC0;
    dw Instruction_Torizo_ClearAnimationLock                             ;AACAC2;
    dw Inst_Torizo_StartFightMusic_GoldenTorizoBellyPaletteFX            ;AACAC4;
    dw $0010                                                             ;AACAC6;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6            ;AACAC8;
    dw Instruction_Common_GotoY                                          ;AACACA;
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving                   ;AACACC;

Instruction_Torizo_GotoY_IfNotHitGround:
    LDA.W EnemyData.yPosition,X                                          ;AACACE;
    CMP.W #$0177                                                         ;AACAD1;
    BEQ .notHitGround                                                    ;AACAD4;
    LDA.W $0000,Y                                                        ;AACAD6;
    TAY                                                                  ;AACAD9;
    RTL                                                                  ;AACADA;


.notHitGround:
    INY                                                                  ;AACADB;
    INY                                                                  ;AACADC;
    RTL                                                                  ;AACADD;


Instruction_Torizo_LoadGoldenTorizoPalettes:
    JSR.W LoadGoldenTorizoPalettes                                       ;AACADE;
    RTL                                                                  ;AACAE1;


Inst_Torizo_StartFightMusic_GoldenTorizoBellyPaletteFX:
    LDA.W #$0005                                                         ;AACAE2;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;AACAE5;
    LDA.W #$0012                                                         ;AACAE9;
    STA.W EnemyData.xHitboxRadius,X                                      ;AACAEC;
    LDA.W #$0030                                                         ;AACAEF;
    STA.W EnemyData.yHitboxRadius,X                                      ;AACAF2;
    PHY                                                                  ;AACAF5;
    LDY.W #PaletteFXObjects_GoldenTorizoBelly                            ;AACAF6;
    JSL.L Spawn_PaletteFXObject                                          ;AACAF9;
    PLY                                                                  ;AACAFD;
    RTL                                                                  ;AACAFE;


InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACAFF;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACB01;
    dw $0006                                                             ;AACB03;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AACB05;
    dw $0003                                                             ;AACB07;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0        ;AACB09;
    dw $0003                                                             ;AACB0B;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1        ;AACB0D;
    dw $0003                                                             ;AACB0F;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2        ;AACB11;
    dw $0003                                                             ;AACB13;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3        ;AACB15;
    dw $0006                                                             ;AACB17;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4        ;AACB19;
    dw Instruction_Common_TimerInY                                       ;AACB1B;
    dw $0006                                                             ;AACB1D;

InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX                              ;AACB1F;
    dw Instruction_GoldenTorizo_SpawnChozoOrbs                           ;AACB21;
    dw Instruction_Common_WaitYFrames                                    ;AACB23;
    dw $0006                                                             ;AACB25;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACB27;
    dw InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_1       ;AACB29;
    dw $0003                                                             ;AACB2B;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3        ;AACB2D;
    dw $0003                                                             ;AACB2F;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2        ;AACB31;
    dw $0003                                                             ;AACB33;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1        ;AACB35;
    dw $0003                                                             ;AACB37;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0        ;AACB39;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACB3B;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACB3D;
    dw Instruction_Torizo_Return                                         ;AACB3F;

InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACB41;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACB43;
    dw $0006                                                             ;AACB45;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AACB47;
    dw $0003                                                             ;AACB49;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0         ;AACB4B;
    dw $0003                                                             ;AACB4D;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1         ;AACB4F;
    dw $0003                                                             ;AACB51;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2         ;AACB53;
    dw $0003                                                             ;AACB55;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3         ;AACB57;
    dw $0006                                                             ;AACB59;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4         ;AACB5B;
    dw Instruction_Common_TimerInY                                       ;AACB5D;
    dw $0006                                                             ;AACB5F;

InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX                              ;AACB61;
    dw Instruction_GoldenTorizo_SpawnChozoOrbs                           ;AACB63;
    dw Instruction_Common_WaitYFrames                                    ;AACB65;
    dw $0006                                                             ;AACB67;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACB69;
    dw InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_1      ;AACB6B;
    dw $0003                                                             ;AACB6D;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3         ;AACB6F;
    dw $0003                                                             ;AACB71;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2         ;AACB73;
    dw $0003                                                             ;AACB75;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1         ;AACB77;
    dw $0003                                                             ;AACB79;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0         ;AACB7B;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACB7D;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACB7F;
    dw Instruction_Torizo_Return                                         ;AACB81;

InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACB83;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACB85;
    dw Instruction_Common_TimerInY                                       ;AACB87;
    dw $0004                                                             ;AACB89;

InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_1:
    dw $0003                                                             ;AACB8B;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AACB8D;
    dw $0003                                                             ;AACB8F;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AACB91;
    dw $0003                                                             ;AACB93;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AACB95;
    dw $0003                                                             ;AACB97;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AACB99;
    dw $0003                                                             ;AACB9B;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AACB9D;
    dw $0003                                                             ;AACB9F;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4      ;AACBA1;
    dw $0001                                                             ;AACBA3;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AACBA5;
    dw $0001                                                             ;AACBA7;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AACBA9;
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY       ;AACBAB;
    dw $0000,$0001                                                       ;AACBAD;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AACBB1;
    dw $0004                                                             ;AACBB3;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AACBB5;
    dw $0003                                                             ;AACBB7;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AACBB9;
    dw $0003                                                             ;AACBBB;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5      ;AACBBD;
    dw $0003                                                             ;AACBBF;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0      ;AACBC1;
    dw $0003                                                             ;AACBC3;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1      ;AACBC5;
    dw $0003                                                             ;AACBC7;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2      ;AACBC9;
    dw $0003                                                             ;AACBCB;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3      ;AACBCD;
    dw $0001                                                             ;AACBCF;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2      ;AACBD1;
    dw $0001                                                             ;AACBD3;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1      ;AACBD5;
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY       ;AACBD7;
    dw $0001,$0001                                                       ;AACBD9;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0      ;AACBDD;
    dw $0004                                                             ;AACBDF;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5      ;AACBE1;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACBE3;
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_1        ;AACBE5;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACBE7;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACBE9;
    dw Instruction_Torizo_Return                                         ;AACBEB;

InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACBED;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACBEF;
    dw Instruction_Common_TimerInY                                       ;AACBF1;
    dw $0004                                                             ;AACBF3;

InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_1:
    dw $0003                                                             ;AACBF5;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AACBF7;
    dw $0003                                                             ;AACBF9;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AACBFB;
    dw $0003                                                             ;AACBFD;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AACBFF;
    dw $0003                                                             ;AACC01;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AACC03;
    dw $0003                                                             ;AACC05;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AACC07;
    dw $0003                                                             ;AACC09;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4       ;AACC0B;
    dw $0001                                                             ;AACC0D;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AACC0F;
    dw $0001                                                             ;AACC11;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AACC13;
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY       ;AACC15;
    dw $0000,$0001                                                       ;AACC17;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AACC1B;
    dw $0004                                                             ;AACC1D;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AACC1F;
    dw $0003                                                             ;AACC21;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AACC23;
    dw $0003                                                             ;AACC25;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5       ;AACC27;
    dw $0003                                                             ;AACC29;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0        ;AACC2B;
    dw $0003                                                             ;AACC2D;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1        ;AACC2F;
    dw $0003                                                             ;AACC31;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2        ;AACC33;
    dw $0003                                                             ;AACC35;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3        ;AACC37;
    dw $0001                                                             ;AACC39;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2        ;AACC3B;
    dw $0001                                                             ;AACC3D;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1        ;AACC3F;
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY       ;AACC41;
    dw $0001,$0001                                                       ;AACC43;
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0        ;AACC47;
    dw $0004                                                             ;AACC49;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5       ;AACC4B;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACC4D;
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_1         ;AACC4F;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACC51;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACC53;
    dw Instruction_Torizo_Return                                         ;AACC55;

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACC57;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACC59;
    dw $0006                                                             ;AACC5B;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AACC5D;
    dw $0003                                                             ;AACC5F;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0        ;AACC61;
    dw $0003                                                             ;AACC63;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1        ;AACC65;
    dw $0003                                                             ;AACC67;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2        ;AACC69;
    dw $0003                                                             ;AACC6B;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3        ;AACC6D;
    dw $0006                                                             ;AACC6F;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4        ;AACC71;
    dw Instruction_Common_TimerInY                                       ;AACC73;
    dw $0006                                                             ;AACC75;

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX                              ;AACC77;
    dw Instruction_GoldenTorizo_SpawnChozoOrbs                           ;AACC79;
    dw Instruction_Common_WaitYFrames                                    ;AACC7B;
    dw $0006                                                             ;AACC7D;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACC7F;
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_1       ;AACC81;
    dw $0003                                                             ;AACC83;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3        ;AACC85;
    dw $0003                                                             ;AACC87;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2        ;AACC89;
    dw $0003                                                             ;AACC8B;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1        ;AACC8D;
    dw $0003                                                             ;AACC8F;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0        ;AACC91;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACC93;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACC95;
    dw Instruction_Torizo_Return                                         ;AACC97;

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACC99;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACC9B;
    dw $0006                                                             ;AACC9D;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AACC9F;
    dw $0003                                                             ;AACCA1;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0       ;AACCA3;
    dw $0003                                                             ;AACCA5;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1       ;AACCA7;
    dw $0003                                                             ;AACCA9;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2       ;AACCAB;
    dw $0003                                                             ;AACCAD;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3       ;AACCAF;
    dw $0006                                                             ;AACCB1;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4       ;AACCB3;
    dw Instruction_Common_TimerInY                                       ;AACCB5;
    dw $0006                                                             ;AACCB7;

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX                              ;AACCB9;
    dw Instruction_GoldenTorizo_SpawnChozoOrbs                           ;AACCBB;
    dw Instruction_Common_WaitYFrames                                    ;AACCBD;
    dw $0006                                                             ;AACCBF;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACCC1;
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_1      ;AACCC3;
    dw $0003                                                             ;AACCC5;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3       ;AACCC7;
    dw $0003                                                             ;AACCC9;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2       ;AACCCB;
    dw $0003                                                             ;AACCCD;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1       ;AACCCF;
    dw $0003                                                             ;AACCD1;
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0       ;AACCD3;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACCD5;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACCD7;
    dw Instruction_Torizo_Return                                         ;AACCD9;

InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACCDB;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACCDD;
    dw Instruction_Common_TimerInY                                       ;AACCDF;
    dw $0004                                                             ;AACCE1;

InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_1:
    dw $0003                                                             ;AACCE3;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AACCE5;
    dw $0003                                                             ;AACCE7;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0         ;AACCE9;
    dw $0003                                                             ;AACCEB;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AACCED;
    dw $0003                                                             ;AACCEF;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AACCF1;
    dw $0003                                                             ;AACCF3;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AACCF5;
    dw $0003                                                             ;AACCF7;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4         ;AACCF9;
    dw $0001                                                             ;AACCFB;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AACCFD;
    dw $0001                                                             ;AACCFF;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AACD01;
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY       ;AACD03;
    dw $0000,$0001                                                       ;AACD05;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AACD09;
    dw $0004                                                             ;AACD0B;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0         ;AACD0D;
    dw $0003                                                             ;AACD0F;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AACD11;
    dw $0003                                                             ;AACD13;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5         ;AACD15;
    dw $0003                                                             ;AACD17;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6         ;AACD19;
    dw $0003                                                             ;AACD1B;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7         ;AACD1D;
    dw $0003                                                             ;AACD1F;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8         ;AACD21;
    dw $0003                                                             ;AACD23;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9         ;AACD25;
    dw $0001                                                             ;AACD27;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8         ;AACD29;
    dw $0001                                                             ;AACD2B;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7         ;AACD2D;
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY       ;AACD2F;
    dw $0001,$0001                                                       ;AACD31;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6         ;AACD35;
    dw $0004                                                             ;AACD37;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5         ;AACD39;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACD3B;
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_1        ;AACD3D;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACD3F;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACD41;
    dw Instruction_Torizo_Return                                         ;AACD43;

InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACD45;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACD47;
    dw Instruction_Common_TimerInY                                       ;AACD49;
    dw $0004                                                             ;AACD4B;

InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_1:
    dw $0003                                                             ;AACD4D;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AACD4F;
    dw $0003                                                             ;AACD51;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0        ;AACD53;
    dw $0003                                                             ;AACD55;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AACD57;
    dw $0003                                                             ;AACD59;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AACD5B;
    dw $0003                                                             ;AACD5D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AACD5F;
    dw $0003                                                             ;AACD61;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4        ;AACD63;
    dw $0001                                                             ;AACD65;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AACD67;
    dw $0001                                                             ;AACD69;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AACD6B;
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY       ;AACD6D;
    dw $0000,$0001                                                       ;AACD6F;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AACD73;
    dw $0004                                                             ;AACD75;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0        ;AACD77;
    dw $0003                                                             ;AACD79;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AACD7B;
    dw $0003                                                             ;AACD7D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5        ;AACD7F;
    dw $0003                                                             ;AACD81;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6        ;AACD83;
    dw $0003                                                             ;AACD85;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7        ;AACD87;
    dw $0003                                                             ;AACD89;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8        ;AACD8B;
    dw $0003                                                             ;AACD8D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9        ;AACD8F;
    dw $0001                                                             ;AACD91;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8        ;AACD93;
    dw $0001                                                             ;AACD95;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7        ;AACD97;
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY       ;AACD99;
    dw $0001,$0001                                                       ;AACD9B;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6        ;AACD9F;
    dw $0004                                                             ;AACDA1;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5        ;AACDA3;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AACDA5;
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_1       ;AACDA7;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACDA9;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACDAB;
    dw Instruction_Torizo_Return                                         ;AACDAD;

InstList_GT_LandedFromBackwardsJump_FacingLeft_LeftFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack                     ;AACDAF;
    dw InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_0      ;AACDB1;
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_0         ;AACDB3;
    dw Instruction_Common_GotoY                                          ;AACDB5;
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving                  ;AACDB7;

InstList_GT_LandedFromBackwardsJump_FacingLeft_RightFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack                     ;AACDB9;
    dw InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_0       ;AACDBB;
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_0        ;AACDBD;
    dw Instruction_Common_GotoY                                          ;AACDBF;
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving                   ;AACDC1;

InstList_GT_LandedFromBackwardsJump_FacingRight_RightFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack                     ;AACDC3;
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_0      ;AACDC5;
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_0       ;AACDC7;
    dw Instruction_Common_GotoY                                          ;AACDC9;
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving                  ;AACDCB;

InstList_GT_LandedFromBackwardsJump_FacingRight_LeftFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack                     ;AACDCD;
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_0       ;AACDCF;
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_0        ;AACDD1;
    dw Instruction_Common_GotoY                                          ;AACDD3;
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving                 ;AACDD5;

Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag:
    LDA.W EnemyData.initParam1,X                                         ;AACDD7;
    AND.W #$EFFF                                                         ;AACDDA;
    STA.W EnemyData.initParam1,X                                         ;AACDDD;
    RTL                                                                  ;AACDE0;


InstList_GoldenTorizo_CaughtSuper_FacingLeft_LeftLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX                              ;AACDE1;
    dw Instruction_Torizo_FunctionInY                                    ;AACDE3;
    dw Function_GoldenTorizo_SimpleMovement                              ;AACDE5;
    dw $0001                                                             ;AACDE7;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AACDE9;
    dw $0001                                                             ;AACDEB;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AACDED;
    dw $0001                                                             ;AACDEF;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AACDF1;
    dw $0001                                                             ;AACDF3;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AACDF5;
    dw $0001                                                             ;AACDF7;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AACDF9;
    dw $0001                                                             ;AACDFB;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4       ;AACDFD;
    dw $0001                                                             ;AACDFF;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AACE01;
    dw $0001                                                             ;AACE03;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AACE05;
    dw $0001                                                             ;AACE07;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AACE09;
    dw $0001                                                             ;AACE0B;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AACE0D;
    dw $0002                                                             ;AACE0F;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AACE11;
    dw $0002                                                             ;AACE13;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AACE15;
    dw $0002                                                             ;AACE17;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AACE19;
    dw $0002                                                             ;AACE1B;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AACE1D;
    dw Instruction_GoldenTorizo_SpawnSuperMissile                        ;AACE1F;
    dw $0030                                                             ;AACE21;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4       ;AACE23;
    dw $0002                                                             ;AACE25;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3       ;AACE27;
    dw $0002                                                             ;AACE29;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2       ;AACE2B;
    dw $0002                                                             ;AACE2D;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1       ;AACE2F;
    dw $0002                                                             ;AACE31;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0       ;AACE33;
    dw $0002                                                             ;AACE35;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward        ;AACE37;
    dw $0010                                                             ;AACE39;
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5       ;AACE3B;
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag              ;AACE3D;
    dw Instruction_Common_GotoY                                          ;AACE3F;
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving                  ;AACE41;

InstList_GoldenTorizo_CaughtSuper_FacingLeft_RightLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX                              ;AACE43;
    dw Instruction_Torizo_FunctionInY                                    ;AACE45;
    dw Function_GoldenTorizo_SimpleMovement                              ;AACE47;
    dw $0001                                                             ;AACE49;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AACE4B;
    dw $0001                                                             ;AACE4D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AACE4F;
    dw $0001                                                             ;AACE51;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AACE53;
    dw $0001                                                             ;AACE55;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AACE57;
    dw $0001                                                             ;AACE59;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AACE5B;
    dw $0001                                                             ;AACE5D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4      ;AACE5F;
    dw $0001                                                             ;AACE61;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AACE63;
    dw $0001                                                             ;AACE65;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AACE67;
    dw $0001                                                             ;AACE69;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AACE6B;
    dw $0001                                                             ;AACE6D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AACE6F;
    dw $0002                                                             ;AACE71;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AACE73;
    dw $0002                                                             ;AACE75;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AACE77;
    dw $0002                                                             ;AACE79;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AACE7B;
    dw $0002                                                             ;AACE7D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AACE7F;
    dw Instruction_GoldenTorizo_SpawnSuperMissile                        ;AACE81;
    dw $0030                                                             ;AACE83;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4      ;AACE85;
    dw $0002                                                             ;AACE87;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3      ;AACE89;
    dw $0002                                                             ;AACE8B;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2      ;AACE8D;
    dw $0002                                                             ;AACE8F;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1      ;AACE91;
    dw $0002                                                             ;AACE93;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0      ;AACE95;
    dw $0002                                                             ;AACE97;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward       ;AACE99;
    dw $0010                                                             ;AACE9B;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5      ;AACE9D;
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag              ;AACE9F;
    dw Instruction_Common_GotoY                                          ;AACEA1;
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving                   ;AACEA3;

InstList_GoldenTorizo_CaughtSuper_FacingRight_RightLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX                              ;AACEA5;
    dw Instruction_Torizo_FunctionInY                                    ;AACEA7;
    dw Function_GoldenTorizo_SimpleMovement                              ;AACEA9;
    dw $0001                                                             ;AACEAB;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AACEAD;
    dw $0001                                                             ;AACEAF;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0        ;AACEB1;
    dw $0001                                                             ;AACEB3;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AACEB5;
    dw $0001                                                             ;AACEB7;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AACEB9;
    dw $0001                                                             ;AACEBB;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AACEBD;
    dw $0001                                                             ;AACEBF;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4        ;AACEC1;
    dw $0001                                                             ;AACEC3;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AACEC5;
    dw $0001                                                             ;AACEC7;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AACEC9;
    dw $0001                                                             ;AACECB;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AACECD;
    dw $0002                                                             ;AACECF;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AACED1;
    dw $0002                                                             ;AACED3;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AACED5;
    dw $0002                                                             ;AACED7;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AACED9;
    dw Instruction_GoldenTorizo_SpawnSuperMissile                        ;AACEDB;
    dw $0030                                                             ;AACEDD;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4        ;AACEDF;
    dw $0002                                                             ;AACEE1;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3        ;AACEE3;
    dw $0002                                                             ;AACEE5;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2        ;AACEE7;
    dw $0002                                                             ;AACEE9;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1        ;AACEEB;
    dw $0002                                                             ;AACEED;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0        ;AACEEF;
    dw $0002                                                             ;AACEF1;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward      ;AACEF3;
    dw $0010                                                             ;AACEF5;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5        ;AACEF7;
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag              ;AACEF9;
    dw Instruction_Common_GotoY                                          ;AACEFB;
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving                  ;AACEFD;

InstList_GoldenTorizo_CaughtSuper_FacingRight_LeftLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX                              ;AACEFF;
    dw Instruction_Torizo_FunctionInY                                    ;AACF01;
    dw Function_GoldenTorizo_SimpleMovement                              ;AACF03;
    dw $0001                                                             ;AACF05;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AACF07;
    dw $0001                                                             ;AACF09;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0         ;AACF0B;
    dw $0001                                                             ;AACF0D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AACF0F;
    dw $0001                                                             ;AACF11;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AACF13;
    dw $0001                                                             ;AACF15;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AACF17;
    dw $0001                                                             ;AACF19;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4         ;AACF1B;
    dw $0001                                                             ;AACF1D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AACF1F;
    dw $0001                                                             ;AACF21;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AACF23;
    dw $0001                                                             ;AACF25;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AACF27;
    dw $0002                                                             ;AACF29;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AACF2B;
    dw $0002                                                             ;AACF2D;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AACF2F;
    dw $0002                                                             ;AACF31;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AACF33;
    dw Instruction_GoldenTorizo_SpawnSuperMissile                        ;AACF35;
    dw $0030                                                             ;AACF37;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4         ;AACF39;
    dw $0002                                                             ;AACF3B;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3         ;AACF3D;
    dw $0002                                                             ;AACF3F;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2         ;AACF41;
    dw $0002                                                             ;AACF43;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1         ;AACF45;
    dw $0002                                                             ;AACF47;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0         ;AACF49;
    dw $0002                                                             ;AACF4B;
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward       ;AACF4D;
    dw $0010                                                             ;AACF4F;
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5         ;AACF51;
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag              ;AACF53;
    dw Instruction_Common_GotoY                                          ;AACF55;
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving                 ;AACF57;

InstList_GoldenTorizo_SitDownAttack_FacingLeft:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACF59;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACF5B;
    dw $0008                                                             ;AACF5D;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6            ;AACF5F;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACF61;
    dw $000A,$0008                                                       ;AACF63;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5            ;AACF67;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACF69;
    dw $0008,$0006                                                       ;AACF6B;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4            ;AACF6F;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACF71;
    dw $0006,$0006                                                       ;AACF73;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3            ;AACF77;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACF79;
    dw $0004,$0004                                                       ;AACF7B;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2            ;AACF7F;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACF81;
    dw $0002,$0004                                                       ;AACF83;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1            ;AACF87;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACF89;
    dw $0000,$0008                                                       ;AACF8B;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0            ;AACF8F;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACF91;
    dw $0000,$0008                                                       ;AACF93;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1            ;AACF97;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACF99;
    dw $0002,$0008                                                       ;AACF9B;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2            ;AACF9F;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACFA1;
    dw $0004,$0008                                                       ;AACFA3;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3            ;AACFA7;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACFA9;
    dw $0006,$000A                                                       ;AACFAB;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4            ;AACFAF;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACFB1;
    dw $0008,$000A                                                       ;AACFB3;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5            ;AACFB7;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACFB9;
    dw $000A                                                             ;AACFBB;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACFBD;
    dw Function_GoldenTorizo_Movement_Walking                            ;AACFBF;
    dw Instruction_Common_GotoY                                          ;AACFC1;
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving                   ;AACFC3;

InstList_GoldenTorizo_SitDownAttack_FacingRight:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AACFC5;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AACFC7;
    dw $0008                                                             ;AACFC9;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6           ;AACFCB;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACFCD;
    dw $001A,$0008                                                       ;AACFCF;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5           ;AACFD3;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACFD5;
    dw $0018,$0006                                                       ;AACFD7;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4           ;AACFDB;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACFDD;
    dw $0016,$0006                                                       ;AACFDF;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3           ;AACFE3;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACFE5;
    dw $0014,$0004                                                       ;AACFE7;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2           ;AACFEB;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACFED;
    dw $0012,$0004                                                       ;AACFEF;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1           ;AACFF3;
    dw Instruction_Torizo_SittingDownMovement_IndexInY                   ;AACFF5;
    dw $0010,$0008                                                       ;AACFF7;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_0           ;AACFFB;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AACFFD;
    dw $0010,$0008                                                       ;AACFFF;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1           ;AAD003;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAD005;
    dw $0012,$0008                                                       ;AAD007;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2           ;AAD00B;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAD00D;
    dw $0014,$0008                                                       ;AAD00F;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3           ;AAD013;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAD015;
    dw $0016,$000A                                                       ;AAD017;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4           ;AAD01B;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAD01D;
    dw $0018,$000A                                                       ;AAD01F;
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5           ;AAD023;
    dw Instruction_Torizo_StandingUpMovement_IndexInY                    ;AAD025;
    dw $001A                                                             ;AAD027;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD029;
    dw Function_GoldenTorizo_Movement_Walking                            ;AAD02B;
    dw Instruction_Common_GotoY                                          ;AAD02D;
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving                 ;AAD02F;

InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD031;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AAD033;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD035;
    dw $0040                                                             ;AAD037;
    dl Tiles_Torizo_AAB4F9                                               ;AAD039;
    dw $7300                                                             ;AAD03C;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD03E;
    dw $0040                                                             ;AAD040;
    dl Tiles_Torizo_AAB6F9                                               ;AAD042;
    dw $7400                                                             ;AAD045;
    dw Instruction_Common_WaitYFrames                                    ;AAD047;
    dw $0008                                                             ;AAD049;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD04B;
    dw $0040                                                             ;AAD04D;
    dl Tiles_Torizo_AAB539                                               ;AAD04F;
    dw $7300                                                             ;AAD052;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD054;
    dw $0040                                                             ;AAD056;
    dl Tiles_Torizo_AAB739                                               ;AAD058;
    dw $7400                                                             ;AAD05B;
    dw Instruction_Common_WaitYFrames                                    ;AAD05D;
    dw $0008                                                             ;AAD05F;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD061;
    dw $0040                                                             ;AAD063;
    dl Tiles_Torizo_AAB579                                               ;AAD065;
    dw $7300                                                             ;AAD068;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD06A;
    dw $0040                                                             ;AAD06C;
    dl Tiles_Torizo_AAB779                                               ;AAD06E;
    dw $7400                                                             ;AAD071;
    dw Instruction_Common_WaitYFrames                                    ;AAD073;
    dw $0010                                                             ;AAD075;
    dw Instruction_Common_TimerInY                                       ;AAD077;
    dw $0006                                                             ;AAD079;

InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_1:
    dw Instruction_GoldenTorizo_QueueEggReleasedSFX                      ;AAD07B;
    dw Instruction_GoldenTorizo_SpawnGoldenTorizoEgg                     ;AAD07D;
    dw Instruction_Common_WaitYFrames                                    ;AAD07F;
    dw $0008                                                             ;AAD081;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAD083;
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_1                   ;AAD085;

InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_2:
    dw Instruction_Common_WaitYFrames                                    ;AAD087;
    dw $0001                                                             ;AAD089;
    dw Instruction_GoldenTorizo_EyeBeamAttack_0                          ;AAD08B;
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_2                   ;AAD08D;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD08F;
    dw $0040                                                             ;AAD091;
    dl Tiles_Torizo_AAB579                                               ;AAD093;
    dw $7300                                                             ;AAD096;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD098;
    dw $0040                                                             ;AAD09A;
    dl Tiles_Torizo_AAB779                                               ;AAD09C;
    dw $7400                                                             ;AAD09F;
    dw Instruction_Common_WaitYFrames                                    ;AAD0A1;
    dw $0008                                                             ;AAD0A3;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD0A5;
    dw $0040                                                             ;AAD0A7;
    dl Tiles_Torizo_AAB539                                               ;AAD0A9;
    dw $7300                                                             ;AAD0AC;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD0AE;
    dw $0040                                                             ;AAD0B0;
    dl Tiles_Torizo_AAB739                                               ;AAD0B2;
    dw $7400                                                             ;AAD0B5;
    dw Instruction_Common_WaitYFrames                                    ;AAD0B7;
    dw $0008                                                             ;AAD0B9;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD0BB;
    dw $0040                                                             ;AAD0BD;
    dl Tiles_Torizo_AAB4F9                                               ;AAD0BF;
    dw $7300                                                             ;AAD0C2;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD0C4;
    dw $0040                                                             ;AAD0C6;
    dl Tiles_Torizo_AAB6F9                                               ;AAD0C8;
    dw $7400                                                             ;AAD0CB;
    dw Instruction_Common_WaitYFrames                                    ;AAD0CD;
    dw $0008                                                             ;AAD0CF;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD0D1;
    dw $0040                                                             ;AAD0D3;
    dl Tiles_BombTorizo_GoldenTorizo+$600                                ;AAD0D5;
    dw $7300                                                             ;AAD0D8;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD0DA;
    dw $0040                                                             ;AAD0DC;
    dl Tiles_BombTorizo_GoldenTorizo+$800                                ;AAD0DE;
    dw $7400                                                             ;AAD0E1;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD0E3;
    dw Function_GoldenTorizo_Movement_Walking                            ;AAD0E5;
    dw Instruction_Torizo_Return                                         ;AAD0E7;

Instruction_GoldenTorizo_SpawnGoldenTorizoEgg:
    PHY                                                                  ;AAD0E9;
    LDY.W #EnemyProjectile_GoldenTorizoEgg                               ;AAD0EA;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAD0ED;
    PLY                                                                  ;AAD0F1;
    RTL                                                                  ;AAD0F2;


Instruction_GoldenTorizo_EyeBeamAttack_0:
    PHX                                                                  ;AAD0F3;
    LDX.W #$0022                                                         ;AAD0F4;

.loop:
    LDA.W $1997,X                                                        ;AAD0F7;
    CMP.W #EnemyProjectile_GoldenTorizoEgg                               ;AAD0FA;
    BEQ .gotoY                                                           ;AAD0FD;
    DEX                                                                  ;AAD0FF;
    DEX                                                                  ;AAD100;
    BPL .loop                                                            ;AAD101;
    PLX                                                                  ;AAD103;
    INY                                                                  ;AAD104;
    INY                                                                  ;AAD105;
    RTL                                                                  ;AAD106;


.gotoY:
    PLX                                                                  ;AAD107;
    LDA.W $0000,Y                                                        ;AAD108;
    TAY                                                                  ;AAD10B;
    RTL                                                                  ;AAD10C;


InstList_GoldenTorizo_EyeBeamAttack_0:
    dw Instruction_Torizo_FunctionInY                                    ;AAD10D;
    dw Function_GoldenTorizo_SimpleMovement                              ;AAD10F;
    dw Instruction_GoldenTorizo_DisableEyeBeamExplosions                 ;AAD111;
    dw Instruction_Torizo_SetAnimationLock                               ;AAD113;
    dw Instruction_Common_WaitYFrames                                    ;AAD115;
    dw $0008                                                             ;AAD117;
    dw Instruction_Common_TimerInY                                       ;AAD119;
    dw $0004                                                             ;AAD11B;
    dw Instruction_GoldenTorizo_QueueLaserSFX                            ;AAD11D;

InstList_GoldenTorizo_EyeBeamAttack_1:
    dw Instruction_GoldenTorizo_SpawnEyeBeam                             ;AAD11F;
    dw $0000                                                             ;AAD121;
    dw Instruction_Common_WaitYFrames                                    ;AAD123;
    dw $0004                                                             ;AAD125;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAD127;
    dw InstList_GoldenTorizo_EyeBeamAttack_1                             ;AAD129;
    dw Instruction_Common_WaitYFrames                                    ;AAD12B;
    dw $0008                                                             ;AAD12D;
    dw Instruction_Common_TimerInY                                       ;AAD12F;
    dw $0002                                                             ;AAD131;

InstList_GoldenTorizo_EyeBeamAttack_2:
    dw Instruction_Common_WaitYFrames                                    ;AAD133;
    dw $0003                                                             ;AAD135;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD137;
    dw $0040                                                             ;AAD139;
    dl Tiles_Torizo                                                      ;AAD13B;
    dw $7D80                                                             ;AAD13E;
    dw Instruction_Common_WaitYFrames                                    ;AAD140;
    dw $0003                                                             ;AAD142;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD144;
    dw $0040                                                             ;AAD146;
    dl Tiles_Torizo_AAB2B9                                               ;AAD148;
    dw $7D80                                                             ;AAD14B;
    dw Instruction_Common_WaitYFrames                                    ;AAD14D;
    dw $0003                                                             ;AAD14F;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD151;
    dw $0040                                                             ;AAD153;
    dl Tiles_Torizo_AAB2F9                                               ;AAD155;
    dw $7D80                                                             ;AAD158;
    dw Instruction_Common_WaitYFrames                                    ;AAD15A;
    dw $0003                                                             ;AAD15C;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD15E;
    dw $0040                                                             ;AAD160;
    dl Tiles_Torizo_AAB339                                               ;AAD162;
    dw $7D80                                                             ;AAD165;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAD167;
    dw InstList_GoldenTorizo_EyeBeamAttack_2                             ;AAD169;
    dw Instruction_GoldenTorizo_EnableEyeBeamExplosions                  ;AAD16B;
    dw Instruction_Common_WaitYFrames                                    ;AAD16D;
    dw $0008                                                             ;AAD16F;
    dw Instruction_GoldenTorizo_DisableEyeBeamExplosions                 ;AAD171;
    dw Instruction_Torizo_ClearAnimationLock                             ;AAD173;
    dw Instruction_Torizo_FunctionInY                                    ;AAD175;
    dw Function_GoldenTorizo_NormalMovement                              ;AAD177;
    dw Instruction_Torizo_Return                                         ;AAD179;

Instruction_GoldenTorizo_DisableEyeBeamExplosions:
    LDA.L $7E780C,X                                                      ;AAD17B;
    AND.W #$7FFF                                                         ;AAD17F;
    STA.L $7E780C,X                                                      ;AAD182;
    RTL                                                                  ;AAD186;


Instruction_GoldenTorizo_EnableEyeBeamExplosions:
    LDA.L $7E780C,X                                                      ;AAD187;
    ORA.W #$8000                                                         ;AAD18B;
    STA.L $7E780C,X                                                      ;AAD18E;
    RTL                                                                  ;AAD192;


InstList_Torizo_Stunned_0:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD193;
    dw Function_GoldenTorizo_Movement_Attacking                          ;AAD195;
    dw Instruction_Torizo_SetAnimationLock                               ;AAD197;
    dw Instruction_Common_WaitYFrames                                    ;AAD199;
    dw $0018                                                             ;AAD19B;
    dw Instruction_Common_TimerInY                                       ;AAD19D;
    dw $0002                                                             ;AAD19F;

InstList_Torizo_Stunned_1:
    dw Instruction_Common_WaitYFrames                                    ;AAD1A1;
    dw $0003                                                             ;AAD1A3;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD1A5;
    dw $0040                                                             ;AAD1A7;
    dl Tiles_Torizo                                                      ;AAD1A9;
    dw $7D80                                                             ;AAD1AC;
    dw Instruction_Common_WaitYFrames                                    ;AAD1AE;
    dw $0003                                                             ;AAD1B0;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD1B2;
    dw $0040                                                             ;AAD1B4;
    dl Tiles_Torizo_AAB2B9                                               ;AAD1B6;
    dw $7D80                                                             ;AAD1B9;
    dw Instruction_Common_WaitYFrames                                    ;AAD1BB;
    dw $0003                                                             ;AAD1BD;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD1BF;
    dw $0040                                                             ;AAD1C1;
    dl Tiles_Torizo_AAB2F9                                               ;AAD1C3;
    dw $7D80                                                             ;AAD1C6;
    dw Instruction_Common_WaitYFrames                                    ;AAD1C8;
    dw $0003                                                             ;AAD1CA;
    dw Instruction_Common_TransferYBytesInYToVRAM                        ;AAD1CC;
    dw $0040                                                             ;AAD1CE;
    dl Tiles_Torizo_AAB339                                               ;AAD1D0;
    dw $7D80                                                             ;AAD1D3;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAD1D5;
    dw InstList_Torizo_Stunned_1                                         ;AAD1D7;
    dw Instruction_Common_WaitYFrames                                    ;AAD1D9;
    dw $0010                                                             ;AAD1DB;
    dw Instruction_Torizo_ClearAnimationLock                             ;AAD1DD;
    dw Instruction_GoldenTorizo_UnmarkStunned                            ;AAD1DF;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD1E1;
    dw Function_GoldenTorizo_Movement_Walking                            ;AAD1E3;
    dw Instruction_Torizo_Return                                         ;AAD1E5;

Instruction_GoldenTorizo_UnmarkStunned:
    LDA.W EnemyData.initParam1,X                                         ;AAD1E7;
    AND.W #$DFFF                                                         ;AAD1EA;
    STA.W EnemyData.initParam1,X                                         ;AAD1ED;
    RTL                                                                  ;AAD1F0;


InstList_GoldenTorizo_Dodge_TurningLeft:
    dw Instruction_Torizo_FunctionInY                                    ;AAD1F1;
    dw Function_Torizo_SimpleMovement                                    ;AAD1F3;
    dw Instruction_Torizo_SetAnimationLock                               ;AAD1F5;
    dw Instruction_Torizo_SetTorizoTurningAroundFlag                     ;AAD1F7;
    dw $0018                                                             ;AAD1F9;
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging            ;AAD1FB;
    dw Instruction_Torizo_ClearAnimationLock                             ;AAD1FD;
    dw Instruction_Common_GotoY                                          ;AAD1FF;
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving                  ;AAD201;

InstList_GoldenTorizo_TurningLeft:
    dw Instruction_Torizo_FunctionInY                                    ;AAD203;
    dw Function_Torizo_SimpleMovement                                    ;AAD205;
    dw Instruction_Torizo_SetTorizoTurningAroundFlag                     ;AAD207;
    dw $0008                                                             ;AAD209;
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging            ;AAD20B;

InstList_GoldenTorizo_WalkingLeft_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState                ;AAD20D;
    dw Instruction_Torizo_FunctionInY                                    ;AAD20F;
    dw Function_GoldenTorizo_NormalMovement                              ;AAD211;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD213;
    dw Function_GoldenTorizo_Movement_Walking                            ;AAD215;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAD217;
    dw $0008                                                             ;AAD219;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0            ;AAD21B;
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel      ;AAD21D;
    dw InstList_Torizo_FacingLeft_JumpingForwards_0                      ;AAD21F;
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels        ;AAD221;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0      ;AAD223;
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31        ;AAD225;
    dw InstList_Torizo_Stunned_0                                         ;AAD227;
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo       ;AAD229;
    dw InstList_GoldenTorizo_EyeBeamAttack_0                             ;AAD22B;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD22D;
    dw $0002,$0004                                                       ;AAD22F;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1            ;AAD233;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD235;
    dw $0004,$0004                                                       ;AAD237;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2            ;AAD23B;
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789       ;AAD23D;
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0                   ;AAD23F;
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels        ;AAD241;
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0      ;AAD243;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD245;
    dw $0006,$0004                                                       ;AAD247;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3            ;AAD24B;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD24D;
    dw $0008,$0004                                                       ;AAD24F;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4            ;AAD253;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD255;
    dw $000A                                                             ;AAD257;

InstList_GoldenTorizo_WalkingLeft_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState               ;AAD259;
    dw Instruction_Torizo_FunctionInY                                    ;AAD25B;
    dw Function_GoldenTorizo_NormalMovement                              ;AAD25D;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD25F;
    dw Function_GoldenTorizo_Movement_Walking                            ;AAD261;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAD263;
    dw $0008                                                             ;AAD265;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0             ;AAD267;
    dw Instruction_GoldenTorizo_GotoY_IfSamusIsMorphedBehindTorizo       ;AAD269;
    dw InstList_GoldenTorizo_SitDownAttack_FacingLeft                    ;AAD26B;
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel      ;AAD26D;
    dw InstList_Torizo_FacingLeft_JumpingForwards_0                      ;AAD26F;
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels        ;AAD271;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0         ;AAD273;
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31        ;AAD275;
    dw InstList_Torizo_Stunned_0                                         ;AAD277;
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo       ;AAD279;
    dw InstList_GoldenTorizo_EyeBeamAttack_0                             ;AAD27B;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD27D;
    dw $000C,$0004                                                       ;AAD27F;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1             ;AAD283;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD285;
    dw $000E,$0004                                                       ;AAD287;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2             ;AAD28B;
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789       ;AAD28D;
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0                   ;AAD28F;
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels        ;AAD291;
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0         ;AAD293;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD295;
    dw $0010,$0004                                                       ;AAD297;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3             ;AAD29B;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD29D;
    dw $0012,$0004                                                       ;AAD29F;
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4             ;AAD2A3;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD2A5;
    dw $0000                                                             ;AAD2A7;
    dw Instruction_Common_GotoY                                          ;AAD2A9;
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving                  ;AAD2AB;

InstList_GoldenTorizo_Dodge_TurningRight:
    dw Instruction_Torizo_FunctionInY                                    ;AAD2AD;
    dw Function_Torizo_SimpleMovement                                    ;AAD2AF;
    dw Instruction_Torizo_SetAnimationLock                               ;AAD2B1;
    dw Instruction_Torizo_SetTorizoTurningAroundFlag                     ;AAD2B3;
    dw $0018                                                             ;AAD2B5;
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging            ;AAD2B7;
    dw Instruction_Torizo_ClearAnimationLock                             ;AAD2B9;
    dw Instruction_Common_GotoY                                          ;AAD2BB;
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving                  ;AAD2BD;

InstList_GoldenTorizo_TurningRight:
    dw Instruction_Torizo_FunctionInY                                    ;AAD2BF;
    dw Function_Torizo_SimpleMovement                                    ;AAD2C1;
    dw Instruction_Torizo_SetTorizoTurningAroundFlag                     ;AAD2C3;
    dw $0008                                                             ;AAD2C5;
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging            ;AAD2C7;

InstList_GoldenTorizo_WalkingRight_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState              ;AAD2C9;
    dw Instruction_Torizo_FunctionInY                                    ;AAD2CB;
    dw Function_GoldenTorizo_NormalMovement                              ;AAD2CD;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD2CF;
    dw Function_GoldenTorizo_Movement_Walking                            ;AAD2D1;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAD2D3;
    dw $0008                                                             ;AAD2D5;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0            ;AAD2D7;
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel      ;AAD2D9;
    dw InstList_Torizo_FacingRight_JumpingForwards_0                     ;AAD2DB;
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels        ;AAD2DD;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0       ;AAD2DF;
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31        ;AAD2E1;
    dw InstList_Torizo_Stunned_0                                         ;AAD2E3;
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo       ;AAD2E5;
    dw InstList_GoldenTorizo_EyeBeamAttack_0                             ;AAD2E7;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD2E9;
    dw $0016,$0004                                                       ;AAD2EB;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1            ;AAD2EF;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD2F1;
    dw $0018,$0004                                                       ;AAD2F3;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2            ;AAD2F7;
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789       ;AAD2F9;
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0                   ;AAD2FB;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD2FD;
    dw $001A,$0004                                                       ;AAD2FF;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3            ;AAD303;
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels        ;AAD305;
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0       ;AAD307;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD309;
    dw $001C,$0004                                                       ;AAD30B;
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4            ;AAD30F;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD311;
    dw $001E                                                             ;AAD313;

InstList_GoldenTorizo_WalkingRight_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState               ;AAD315;
    dw Instruction_Torizo_FunctionInY                                    ;AAD317;
    dw Function_GoldenTorizo_NormalMovement                              ;AAD319;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAD31B;
    dw Function_GoldenTorizo_Movement_Walking                            ;AAD31D;
    dw Instruction_Torizo_PlayTorizoFootstepsSFX                         ;AAD31F;
    dw $0008                                                             ;AAD321;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0           ;AAD323;
    dw Instruction_GoldenTorizo_GotoY_IfSamusIsMorphedBehindTorizo       ;AAD325;
    dw InstList_GoldenTorizo_SitDownAttack_FacingRight                   ;AAD327;
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel      ;AAD329;
    dw InstList_Torizo_FacingRight_JumpingForwards_0                     ;AAD32B;
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels        ;AAD32D;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0       ;AAD32F;
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31        ;AAD331;
    dw InstList_Torizo_Stunned_0                                         ;AAD333;
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo       ;AAD335;
    dw InstList_GoldenTorizo_EyeBeamAttack_0                             ;AAD337;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD339;
    dw $0020,$0004                                                       ;AAD33B;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1           ;AAD33F;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD341;
    dw $0022,$0004                                                       ;AAD343;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2           ;AAD347;
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789       ;AAD349;
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0                   ;AAD34B;
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels        ;AAD34D;
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0       ;AAD34F;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD351;
    dw $0024,$0004                                                       ;AAD353;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3           ;AAD357;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD359;
    dw $0026,$0004                                                       ;AAD35B;
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4           ;AAD35F;
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY                 ;AAD361;
    dw $0014                                                             ;AAD363;
    dw Instruction_Common_GotoY                                          ;AAD365;
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving                  ;AAD367;

MainAI_GoldenTorizo:
    LDX.W $0E54                                                          ;AAD369;
    LDA.W $0A1C                                                          ;AAD36C;
    CMP.W #$001B                                                         ;AAD36F;
    BEQ .spaceJump                                                       ;AAD372;
    CMP.W #$001C                                                         ;AAD374;
    BEQ .spaceJump                                                       ;AAD377;
    LDA.W #$0000                                                         ;AAD379;
    STA.L $7E780E,X                                                      ;AAD37C;
    BRA .executeFunction                                                 ;AAD380;


.spaceJump:
    LDA.L $7E780E,X                                                      ;AAD382;
    INC A                                                                ;AAD386;
    STA.L $7E780E,X                                                      ;AAD387;

.executeFunction:
    JSR.W ($0FB0,X)                                                      ;AAD38B;
    RTL                                                                  ;AAD38E;


Instruction_GoldenTorizo_QueueEggReleasedSFX:
    LDA.W #$0034                                                         ;AAD38F;
    JSL.L QueueSound_Lib2_Max6                                           ;AAD392;
    RTL                                                                  ;AAD396;


Instruction_GoldenTorizo_QueueLaserSFX:
    LDA.W #$0067                                                         ;AAD397;
    JSL.L QueueSound_Lib2_Max6                                           ;AAD39A;
    RTL                                                                  ;AAD39E;


Instruction_Torizo_QueueSonicBoomSFX:
    LDA.W #$0048                                                         ;AAD39F;
    JSL.L QueueSound_Lib2_Max6                                           ;AAD3A2;
    RTL                                                                  ;AAD3A6;


CheckIfTorizoIsFacingSamus:
    LDA.W EnemyData.xPosition,X                                          ;AAD3A7;
    SEC                                                                  ;AAD3AA;
    SBC.W $0AF6                                                          ;AAD3AB;
    EOR.W EnemyData.initParam0,X                                         ;AAD3AE;
    RTS                                                                  ;AAD3B1;


Goto_GoldenTorizoHealthBasedPaletteHandling:
    LDA.W EnemyData.health,X                                             ;AAD3B2;
    JSL.L GoldenTorizo_HealthBasedPalette_Handling                       ;AAD3B5;
    RTS                                                                  ;AAD3B9;


HurtAI_GoldenTorizo:
    LDX.W $0E54                                                          ;AAD3BA;
    JSR.W HandleLowHealthInitialDrool                                    ;AAD3BD;
    LDA.W EnemyData.flashTimer,X                                         ;AAD3C0;
    LSR A                                                                ;AAD3C3;
    BCS .flash                                                           ;AAD3C4;
    JSR.W Goto_GoldenTorizoHealthBasedPaletteHandling                    ;AAD3C6;
    BRA .return                                                          ;AAD3C9;


.flash:
    PHX                                                                  ;AAD3CB;
    LDX.W #$001E                                                         ;AAD3CC;

.loopPalettes:
    LDA.W #$7FFF                                                         ;AAD3CF;
    STA.L $7EC140,X                                                      ;AAD3D2;
    STA.L $7EC120,X                                                      ;AAD3D6;
    DEX                                                                  ;AAD3DA;
    DEX                                                                  ;AAD3DB;
    BPL .loopPalettes                                                    ;AAD3DC;
    PLX                                                                  ;AAD3DE;

.return:
    RTL                                                                  ;AAD3DF;


Instruction_GoldenTorizo_SpawnSuperMissile:
    PHY                                                                  ;AAD3E0;
    LDY.W #EnemyProjectile_GoldenTorizoSuperMissile                      ;AAD3E1;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAD3E4;
    PLY                                                                  ;AAD3E8;
    RTL                                                                  ;AAD3E9;


Instruction_GoldenTorizo_GotoY_IfSamusIsMorphedBehindTorizo:
    JSR.W CheckIfTorizoIsFacingSamus                                     ;AAD3EA;
    BPL .noGo                                                            ;AAD3ED;
    LDA.W #$0004                                                         ;AAD3EF;
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA                 ;AAD3F2;
    BCC .noGo                                                            ;AAD3F6;
    LDA.W #$0028                                                         ;AAD3F8;
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA                 ;AAD3FB;
    BCS .noGo                                                            ;AAD3FF;
    LDA.W $0A1C                                                          ;AAD401;
    CMP.W #$001D                                                         ;AAD404;
    BEQ .gotoY                                                           ;AAD407;
    CMP.W #$001E                                                         ;AAD409;
    BEQ .gotoY                                                           ;AAD40C;
    CMP.W #$001F                                                         ;AAD40E;
    BEQ .gotoY                                                           ;AAD411;
    CMP.W #$0079                                                         ;AAD413;
    BEQ .gotoY                                                           ;AAD416;
    CMP.W #$007A                                                         ;AAD418;
    BEQ .gotoY                                                           ;AAD41B;
    CMP.W #$007B                                                         ;AAD41D;
    BEQ .gotoY                                                           ;AAD420;
    CMP.W #$007C                                                         ;AAD422;
    BNE .noGo                                                            ;AAD425;

.gotoY:
    LDA.W #$0000                                                         ;AAD427;
    STA.L $7E7812,X                                                      ;AAD42A;
    LDA.W $0000,Y                                                        ;AAD42E;
    TAY                                                                  ;AAD431;
    RTL                                                                  ;AAD432;


.noGo:
    INY                                                                  ;AAD433;
    INY                                                                  ;AAD434;
    RTL                                                                  ;AAD435;


Instruction_GoldenTorizo_SpawnEyeBeam:
    PHY                                                                  ;AAD436;
    LDA.W $0000,Y                                                        ;AAD437;
    LDY.W #EnemyProjectile_GoldenTorizoEyeBeam                           ;AAD43A;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAD43D;
    PLY                                                                  ;AAD441;
    INY                                                                  ;AAD442;
    INY                                                                  ;AAD443;
    RTL                                                                  ;AAD444;


Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo:
    JSR.W CheckIfTorizoIsFacingSamus                                     ;AAD445;
    BMI .noGo                                                            ;AAD448;
    LDA.W #$0020                                                         ;AAD44A;
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA                 ;AAD44D;
    BCC .noGo                                                            ;AAD451;
    LDA.W #$0060                                                         ;AAD453;
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA                 ;AAD456;
    BCS .noGo                                                            ;AAD45A;
    JSL.L GenerateRandomNumber                                           ;AAD45C;
    AND.W #$0110                                                         ;AAD460;
    BNE .noGo                                                            ;AAD463;
    TYA                                                                  ;AAD465;
    INC A                                                                ;AAD466;
    INC A                                                                ;AAD467;
    STA.L $7E7800,X                                                      ;AAD468;
    LDA.W $0000,Y                                                        ;AAD46C;
    TAY                                                                  ;AAD46F;
    RTL                                                                  ;AAD470;


.noGo:
    INY                                                                  ;AAD471;
    INY                                                                  ;AAD472;
    RTL                                                                  ;AAD473;


Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789:
    LDA.W #$0788                                                         ;AAD474;
    CMP.W EnemyData.health,X                                             ;AAD477;
    BCC .noGo                                                            ;AAD47A;
    JSL.L GenerateRandomNumber                                           ;AAD47C;
    AND.W #$0102                                                         ;AAD480;
    BNE .noGo                                                            ;AAD483;
    LDA.W #$0000                                                         ;AAD485;
    STA.L $7E7812,X                                                      ;AAD488;
    TYA                                                                  ;AAD48C;
    INC A                                                                ;AAD48D;
    INC A                                                                ;AAD48E;
    STA.L $7E7800,X                                                      ;AAD48F;
    LDA.W $0000,Y                                                        ;AAD493;
    TAY                                                                  ;AAD496;
    RTL                                                                  ;AAD497;


.noGo:
    INY                                                                  ;AAD498;
    INY                                                                  ;AAD499;
    RTL                                                                  ;AAD49A;


Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31:
    LDA.W #$2A30                                                         ;AAD49B;
    CMP.W EnemyData.health,X                                             ;AAD49E;
    BCS .noGo                                                            ;AAD4A1;
    LDA.W EnemyData.initParam1,X                                         ;AAD4A3;
    BIT.W #$2000                                                         ;AAD4A6;
    BEQ .noGo                                                            ;AAD4A9;
    TYA                                                                  ;AAD4AB;
    INC A                                                                ;AAD4AC;
    INC A                                                                ;AAD4AD;
    STA.L $7E7800,X                                                      ;AAD4AE;
    LDA.W $0000,Y                                                        ;AAD4B2;
    TAY                                                                  ;AAD4B5;
    RTL                                                                  ;AAD4B6;


.noGo:
    INY                                                                  ;AAD4B7;
    INY                                                                  ;AAD4B8;
    RTL                                                                  ;AAD4B9;


Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel:
    LDA.W #$0070                                                         ;AAD4BA;
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA                 ;AAD4BD;
    BCC .noGo                                                            ;AAD4C1;
    JSR.W CheckIfTorizoIsFacingSamus                                     ;AAD4C3;
    BMI .noGo                                                            ;AAD4C6;
    LDA.W #$0168                                                         ;AAD4C8;
    CMP.L $7E780E,X                                                      ;AAD4CB;
    BCC .jump                                                            ;AAD4CF;
    LDA.B $8B                                                            ;AAD4D1;
    AND.W #$0300                                                         ;AAD4D3;
    BEQ .noGo                                                            ;AAD4D6;
    JSL.L GenerateRandomNumber                                           ;AAD4D8;
    AND.W #$0101                                                         ;AAD4DC;
    BEQ .noGo                                                            ;AAD4DF;

.jump:
    LDA.W #$0000                                                         ;AAD4E1;
    STA.L $7E7812,X                                                      ;AAD4E4;
    JSR.W MakeTorizoJumpForwards                                         ;AAD4E8;
    LDA.W $0000,Y                                                        ;AAD4EB;
    TAY                                                                  ;AAD4EE;
    RTL                                                                  ;AAD4EF;


.noGo:
    INY                                                                  ;AAD4F0;
    INY                                                                  ;AAD4F1;
    RTL                                                                  ;AAD4F2;


Instruction_GoldenTorizo_SpawnChozoOrbs:
    PHY                                                                  ;AAD4F3;
    LDY.W #EnemyProjectile_GoldenTorizoChozoOrbs                         ;AAD4F4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAD4F7;
    PLY                                                                  ;AAD4FB;
    RTL                                                                  ;AAD4FC;


Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels:
    LDA.L $7E7812,X                                                      ;AAD4FD;
    CMP.W #$0008                                                         ;AAD501;
    BCS .jump                                                            ;AAD504;
    LDA.W #$0020                                                         ;AAD506;
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA                 ;AAD509;
    BCS .noGo                                                            ;AAD50D;
    JSR.W CheckIfTorizoIsFacingSamus                                     ;AAD50F;
    BMI .noGo                                                            ;AAD512;

.jump:
    LDA.W #$0000                                                         ;AAD514;
    STA.L $7E7812,X                                                      ;AAD517;
    JSR.W MakeTorizoJumpBackwards                                        ;AAD51B;
    LDA.W $0000,Y                                                        ;AAD51E;
    TAY                                                                  ;AAD521;
    RTL                                                                  ;AAD522;


.noGo:
    INY                                                                  ;AAD523;
    INY                                                                  ;AAD524;
    RTL                                                                  ;AAD525;


Instruction_GoldenTorizo_CallY_OrY2_ForAttack:
    TYA                                                                  ;AAD526;
    INC A                                                                ;AAD527;
    INC A                                                                ;AAD528;
    INC A                                                                ;AAD529;
    INC A                                                                ;AAD52A;
    STA.L $7E7800,X                                                      ;AAD52B;
    LDA.W $09C6                                                          ;AAD52F;
    CMP.W #$0020                                                         ;AAD532;
    BCC .spewOrbs                                                        ;AAD535;
    LDA.W $0AF6                                                          ;AAD537;
    LSR A                                                                ;AAD53A;
    ADC.W $05B6                                                          ;AAD53B;
    AND.W #$0008                                                         ;AAD53E;
    BEQ .sonicBooms                                                      ;AAD541;

.spewOrbs:
    LDA.W $0000,Y                                                        ;AAD543;
    BRA .return                                                          ;AAD546;


.sonicBooms:
    LDA.W $0002,Y                                                        ;AAD548;

.return:
    TAY                                                                  ;AAD54B;
    RTL                                                                  ;AAD54C;


Instruction_GoldenTorizo_WalkingMovement_IndexInY:
    PHY                                                                  ;AAD54D;
    STZ.B $12                                                            ;AAD54E;
    LDA.W $0000,Y                                                        ;AAD550;
    TAY                                                                  ;AAD553;
    LDA.W .velocities,Y                                                  ;AAD554;
    STA.B $14                                                            ;AAD557;
    STA.W EnemyData.work0,X                                              ;AAD559;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;AAD55C;
    PLY                                                                  ;AAD560;
    BCC .noCollision                                                     ;AAD561;
    LDA.W #$0000                                                         ;AAD563;
    STA.L $7E7806,X                                                      ;AAD566;
    LDA.W EnemyData.initParam0,X                                         ;AAD56A;
    BMI .facingRight                                                     ;AAD56D;
    LDY.W #InstList_GoldenTorizo_TurningRight                            ;AAD56F;
    RTL                                                                  ;AAD572;


.facingRight:
    LDY.W #InstList_GoldenTorizo_TurningLeft                             ;AAD573;
    RTL                                                                  ;AAD576;


.noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;AAD577;
    LDA.W $0AF6                                                          ;AAD57B;
    SEC                                                                  ;AAD57E;
    SBC.W EnemyData.xPosition,X                                          ;AAD57F;
    EOR.W EnemyData.initParam0,X                                         ;AAD582;
    BPL .facingAway                                                      ;AAD585;
    INY                                                                  ;AAD587;
    INY                                                                  ;AAD588;
    RTL                                                                  ;AAD589;


.facingAway:
    LDA.L $7E7806,X                                                      ;AAD58A;
    BNE .return                                                          ;AAD58E;
    LDA.W #$0010                                                         ;AAD590;
    STA.L $7E7806,X                                                      ;AAD593;

.return:
    INY                                                                  ;AAD597;
    INY                                                                  ;AAD598;
    RTL                                                                  ;AAD599;


.velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9                   ;AAD59A;
    dw $FFEF,$FFEE,$0005,$0000,$0005,$0013,$0010,$0007                   ;AAD5AA;
    dw $0000,$0007,$0011,$0012                                           ;AAD5BA;

Function_GoldenTorizo_WakeIfSamusIsBelowAndRightOfTargetPos:
    LDA.W #$0140                                                         ;AAD5C2;
    CMP.W $0AFA                                                          ;AAD5C5;
    BCS .return                                                          ;AAD5C8;
    LDA.W #$0170                                                         ;AAD5CA;
    CMP.W $0AF6                                                          ;AAD5CD;
    BCS .return                                                          ;AAD5D0;
    INC.W EnemyData.pInstList,X                                          ;AAD5D2;
    INC.W EnemyData.pInstList,X                                          ;AAD5D5;
    LDA.W #$0001                                                         ;AAD5D8;
    STA.W EnemyData.instTimer,X                                          ;AAD5DB;

.return:
    RTS                                                                  ;AAD5DE;


Function_GoldenTorizo_SimpleMovement:
    JSR.W HandleLowHealthInitialDrool                                    ;AAD5DF;
    JSR.W HandleFalling                                                  ;AAD5E2;
    RTS                                                                  ;AAD5E5;


Function_GoldenTorizo_NormalMovement:
    JSR.W HandleLowHealthInitialDrool                                    ;AAD5E6;
    JSR.W ($0FB2,X)                                                      ;AAD5E9;
    RTS                                                                  ;AAD5EC;


Function_GoldenTorizo_Movement_Attacking:
    JSR.W HandleFalling                                                  ;AAD5ED;
    RTS                                                                  ;AAD5F0;


Function_GoldenTorizo_Movement_Walking:
    LDA.L $7E7806,X                                                      ;AAD5F1;
    BEQ .notTurning                                                      ;AAD5F5;
    DEC A                                                                ;AAD5F7;
    STA.L $7E7806,X                                                      ;AAD5F8;
    BNE .notTurning                                                      ;AAD5FC;
    LDA.W #$0000                                                         ;AAD5FE;
    STA.L $7E7806,X                                                      ;AAD601;
    LDA.W EnemyData.initParam0,X                                         ;AAD605;
    BMI .facingRight                                                     ;AAD608;
    LDA.W #InstList_GoldenTorizo_TurningRight                            ;AAD60A;
    BRA +                                                                ;AAD60D;


.facingRight:
    LDA.W #InstList_GoldenTorizo_TurningLeft                             ;AAD60F;

  + STA.W EnemyData.pInstList,X                                          ;AAD612;
    LDA.W #$0001                                                         ;AAD615;
    STA.W EnemyData.instTimer,X                                          ;AAD618;
    RTS                                                                  ;AAD61B;


.notTurning:
    STZ.B $12                                                            ;AAD61C;
    LDA.W EnemyData.work0,X                                              ;AAD61E;
    BPL +                                                                ;AAD621;
    EOR.W #$FFFF                                                         ;AAD623;
    INC A                                                                ;AAD626;

  + INC A                                                                ;AAD627;
    CMP.W #$0010                                                         ;AAD628;
    BCC +                                                                ;AAD62B;
    LDA.W #$000F                                                         ;AAD62D;

  + STA.B $14                                                            ;AAD630;
    JSL.L MoveEnemyDownBy_14_12                                          ;AAD632;
    BCS .return                                                          ;AAD636;
    LDA.W EnemyData.initParam0,X                                         ;AAD638;
    BMI ..facingRight                                                    ;AAD63B;
    LDA.W #InstList_Torizo_FacingLeft_Falling_0                          ;AAD63D;
    BRA +                                                                ;AAD640;


..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0                         ;AAD642;

  + STA.W EnemyData.pInstList,X                                          ;AAD645;
    LDA.W #$0001                                                         ;AAD648;
    STA.W EnemyData.instTimer,X                                          ;AAD64B;
    LDA.W #$0100                                                         ;AAD64E;
    STA.W EnemyData.work1,X                                              ;AAD651;
    STZ.W EnemyData.work0,X                                              ;AAD654;

.return:
    RTS                                                                  ;AAD657;


ShotReaction_GoldenTorizo_StandUp_SitDown:
    LDX.W $0E54                                                          ;AAD658;
    LDA.W EnemyData.flashTimer,X                                         ;AAD65B;
    BNE .return                                                          ;AAD65E;
    LDA.L $7E7808,X                                                      ;AAD660;
    BEQ ShotReaction_GoldenTorizo_Damaged                                ;AAD664;

.return:
    RTL                                                                  ;AAD666;


ShotReaction_GoldenTorizo_Normal:
    LDX.W $0E54                                                          ;AAD667;
    LDA.W EnemyData.flashTimer,X                                         ;AAD66A;
    BNE .return                                                          ;AAD66D;
    LDA.L $7E7808,X                                                      ;AAD66F;
    BEQ .gotoFlashOrAnimLock                                             ;AAD673;
    JMP.W ShotReaction_GoldenTorizo_Damaged                              ;AAD675;


.gotoFlashOrAnimLock:
    JMP.W .flashOrAnimLock                                               ;AAD678; >.<


.return:
    RTL                                                                  ;AAD67B;


.flashOrAnimLock:
    LDA.W EnemyData.initParam1,X                                         ;AAD67C;
    BIT.W #$1000                                                         ;AAD67F;
    BNE .stun                                                            ;AAD682;
    LDA.W $18A6                                                          ;AAD684;
    ASL A                                                                ;AAD687;
    TAY                                                                  ;AAD688;
    LDA.W $0C18,Y                                                        ;AAD689;
    AND.W #$0F00                                                         ;AAD68C;
    STA.L $7E780A,X                                                      ;AAD68F;
    CMP.W #$0100                                                         ;AAD693;
    BEQ ShotReaction_GoldenTorizo_Normal_Missile                         ;AAD696;
    CMP.W #$0200                                                         ;AAD698;
    BEQ ShotReaction_GoldenTorizo_Normal_SuperMissile                    ;AAD69B;

.stun:
    LDA.W EnemyData.initParam1,X                                         ;AAD69D;
    ORA.W #$2000                                                         ;AAD6A0;
    STA.W EnemyData.initParam1,X                                         ;AAD6A3; fallthrough to ShotReaction_GoldenTorizo_Damaged

ShotReaction_GoldenTorizo_Damaged:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;AAD6A6;
    LDX.W $0E54                                                          ;AAD6AA;
    LDA.W EnemyData.health,X                                             ;AAD6AD;
    BNE .return                                                          ;AAD6B0;
    LDA.W #InstList_Torizo_DeathSequence_0                               ;AAD6B2;
    STA.W EnemyData.pInstList,X                                          ;AAD6B5;
    LDA.W #$0001                                                         ;AAD6B8;
    STA.W EnemyData.instTimer,X                                          ;AAD6BB;
    LDA.W EnemyData.initParam1,X                                         ;AAD6BE;
    ORA.W #$C000                                                         ;AAD6C1;
    STA.W EnemyData.initParam1,X                                         ;AAD6C4;
    LDA.W EnemyData.properties,X                                         ;AAD6C7;
    ORA.W #$0400                                                         ;AAD6CA;
    STA.W EnemyData.properties,X                                         ;AAD6CD;

.return:
    RTL                                                                  ;AAD6D0;


ShotReaction_GoldenTorizo_Normal_Missile:
    LDA.W $0C04,Y                                                        ;AAD6D1;
    AND.W #$FFEF                                                         ;AAD6D4;
    STA.W $0C04,Y                                                        ;AAD6D7;
    LDA.W #RTS_AAC6AB                                                    ;AAD6DA;
    STA.W EnemyData.work4,X                                              ;AAD6DD;
    LDA.W #$0001                                                         ;AAD6E0;
    STA.W EnemyData.instTimer,X                                          ;AAD6E3;
    BIT.W EnemyData.initParam0,X                                         ;AAD6E6;
    BMI .keepRight                                                       ;AAD6E9;
    LDA.W #InstList_GoldenTorizo_Dodge_TurningLeft                       ;AAD6EB;
    BRA +                                                                ;AAD6EE;


.keepRight:
    LDA.W #InstList_GoldenTorizo_Dodge_TurningRight                      ;AAD6F0;

  + STA.W EnemyData.pInstList,X                                          ;AAD6F3;
    RTL                                                                  ;AAD6F6;


ShotReaction_GoldenTorizo_Normal_SuperMissile:
    JSR.W CheckIfTorizoIsFacingSamus                                     ;AAD6F7;
    BPL .facingSamus                                                     ;AAD6FA;
    JMP.W ShotReaction_GoldenTorizo_Damaged                              ;AAD6FC;


.facingSamus:
    LDA.W EnemyData.initParam1,X                                         ;AAD6FF;
    ORA.W #$1000                                                         ;AAD702;
    STA.W EnemyData.initParam1,X                                         ;AAD705;
    LDA.W #RTS_AAC6AB                                                    ;AAD708;
    STA.W EnemyData.work4,X                                              ;AAD70B;
    LDA.W $0C04,Y                                                        ;AAD70E;
    ORA.W #$0010                                                         ;AAD711;
    STA.W $0C04,Y                                                        ;AAD714;
    LDA.W #$0001                                                         ;AAD717;
    STA.W EnemyData.instTimer,X                                          ;AAD71A;
    LDA.W EnemyData.initParam0,X                                         ;AAD71D;
    BIT.W #$2000                                                         ;AAD720;
    BNE .backgroundLegForward                                            ;AAD723;
    BIT.W EnemyData.initParam0,X                                         ;AAD725;
    BMI .facingRight                                                     ;AAD728;
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingLeft_LeftLegFwd       ;AAD72A;
    BRA +                                                                ;AAD72D;


.facingRight:
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingRight_RightLegFwd     ;AAD72F;
    BRA +                                                                ;AAD732;


.backgroundLegForward:
    BIT.W EnemyData.initParam0,X                                         ;AAD734;
    BMI ..facingRight                                                    ;AAD737;
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingLeft_RightLegFwd      ;AAD739;
    BRA +                                                                ;AAD73C;


..facingRight:
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingRight_LeftLegFwd      ;AAD73E;

  + STA.W EnemyData.pInstList,X                                          ;AAD741;
    RTL                                                                  ;AAD744;


Palettes_TourianStatue_Ridley:
    dw $3800,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B,$0087                   ;AAD745;
    dw $0044,$001F,$0012,$0009,$7FFF,$7FFF,$7FFF,$0000                   ;AAD755;

Palettes_TourianStatue_Phantoon:
    dw $3800,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B,$0087                   ;AAD765;
    dw $0044,$7FFF,$7FFF,$7FFF,$03FF,$0252,$0129,$0000                   ;AAD775;

Palettes_TourianStatue_BaseDecoration:
    dw $3800,$27F9,$2375,$1AD2,$164E,$11AB,$0D27,$0484                   ;AAD785;
    dw $0000,$7F5F,$7C1F,$5816,$300C,$5294,$39CE,$2108                   ;AAD795;

InstList_TourianStatue_Ridley_0:
    dw Instruction_Common_DeleteEnemy                                    ;AAD7A5;

InstList_TourianStatue_Ridley_1:
    dw $7777                                                             ;AAD7A7;
    dw UNUSED_Spritemaps_TourianStatue_Ridley_AAD83B                     ;AAD7A9;
    dw Instruction_Common_GotoY                                          ;AAD7AB;
    dw InstList_TourianStatue_Ridley_1                                   ;AAD7AD;

InstList_TourianStatue_Phantoon_0:
    dw Instruction_Common_DeleteEnemy                                    ;AAD7AF;

InstList_TourianStatue_Phantoon_1:
    dw $7777                                                             ;AAD7B1;
    dw UNUSED_Spritemaps_TourianStatue_Phantoon_AAD8B0                   ;AAD7B3;
    dw Instruction_Common_GotoY                                          ;AAD7B5;
    dw InstList_TourianStatue_Phantoon_1                                 ;AAD7B7;

InstList_TourianStatue_BaseDecoration_0:
    dw Instruction_Common_DeleteEnemy                                    ;AAD7B9;
    dw $0100                                                             ;AAD7BB;
    dw UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816             ;AAD7BD;

InstList_TourianStatue_BaseDecoration_1:
    dw $7777                                                             ;AAD7BF;
    dw UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816             ;AAD7C1;
    dw Instruction_Common_GotoY                                          ;AAD7C3;
    dw InstList_TourianStatue_BaseDecoration_1                           ;AAD7C5;

MainAI_TourianStatue:
    RTL                                                                  ;AAD7C7;


InitAI_TourianStatue:
    LDX.W $0E54                                                          ;AAD7C8;
    STZ.W EnemyData.palette,X                                            ;AAD7CB;
    LDA.W #$0001                                                         ;AAD7CE;
    STA.W EnemyData.instTimer,X                                          ;AAD7D1;
    STZ.W EnemyData.loopCounter,X                                        ;AAD7D4;
    LDY.W EnemyData.initParam0,X                                         ;AAD7D7;
    LDA.W .pointers,Y                                                    ;AAD7DA;
    STA.W EnemyData.pInstList,X                                          ;AAD7DD;
    LDY.W EnemyData.initParam0,X                                         ;AAD7E0;
    BNE .nonZeroParam1                                                   ;AAD7E3;
    LDY.W #EnemyProjectile_TourianStatueBaseDecoration                   ;AAD7E5;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAD7E8;
    LDY.W #EnemyProjectile_TourianStatueRidley                           ;AAD7EC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAD7EF;
    LDY.W #EnemyProjectile_TourianStatuePhantoon                         ;AAD7F3;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAD7F6;

.nonZeroParam1:
    LDX.W #$001E                                                         ;AAD7FA;

.loopPalettes:
    LDA.W Palettes_TourianStatue_BaseDecoration,X                        ;AAD7FD;
    STA.L $7EC3E0,X                                                      ;AAD800;
    LDA.W Palettes_TourianStatue_Phantoon,X                              ;AAD804;
    STA.L $7EC340,X                                                      ;AAD807;
    DEX                                                                  ;AAD80B;
    DEX                                                                  ;AAD80C;
    BPL .loopPalettes                                                    ;AAD80D;
    RTL                                                                  ;AAD80F;


.pointers:
    dw InstList_TourianStatue_BaseDecoration_0                           ;AAD810;
    dw InstList_TourianStatue_Ridley_0                                   ;AAD812;
    dw InstList_TourianStatue_Phantoon_0                                 ;AAD814;

UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816:
    dw $0007,$C228                                                       ;AAD816;
    db $F8                                                               ;AAD81A;
    dw $1F9C,$C218                                                       ;AAD81B;
    db $F8                                                               ;AAD81F;
    dw $1F9A,$C208                                                       ;AAD820;
    db $F8                                                               ;AAD824;
    dw $1F98,$C3F8                                                       ;AAD825;
    db $F8                                                               ;AAD829;
    dw $1F96,$C3E8                                                       ;AAD82A;
    db $F8                                                               ;AAD82E;
    dw $1F94,$C3D8                                                       ;AAD82F;
    db $F8                                                               ;AAD833;
    dw $1F92,$C3C8                                                       ;AAD834;
    db $F8                                                               ;AAD838;
    dw $1F90                                                             ;AAD839;

UNUSED_Spritemaps_TourianStatue_Ridley_AAD83B:
    dw $0017,$C3E5                                                       ;AAD83B;
    db $18                                                               ;AAD83F;
    dw $2344,$C3E5                                                       ;AAD840;
    db $08                                                               ;AAD844;
    dw $232C,$C3F5                                                       ;AAD845;
    db $18                                                               ;AAD849;
    dw $2346,$000D                                                       ;AAD84A;
    db $20                                                               ;AAD84E;
    dw $237D,$000D                                                       ;AAD84F;
    db $18                                                               ;AAD853;
    dw $236D,$0005                                                       ;AAD854;
    db $18                                                               ;AAD858;
    dw $2348,$C215                                                       ;AAD859;
    db $08                                                               ;AAD85D;
    dw $2342,$C205                                                       ;AAD85E;
    db $08                                                               ;AAD862;
    dw $2340,$C3F5                                                       ;AAD863;
    db $08                                                               ;AAD867;
    dw $232E,$C3D5                                                       ;AAD868;
    db $08                                                               ;AAD86C;
    dw $232A,$C215                                                       ;AAD86D;
    db $F8                                                               ;AAD871;
    dw $2328,$C205                                                       ;AAD872;
    db $F8                                                               ;AAD876;
    dw $2326,$C3F5                                                       ;AAD877;
    db $F8                                                               ;AAD87B;
    dw $2324,$C3E5                                                       ;AAD87C;
    db $F8                                                               ;AAD880;
    dw $2322,$C3D5                                                       ;AAD881;
    db $F8                                                               ;AAD885;
    dw $2320,$C215                                                       ;AAD886;
    db $E8                                                               ;AAD88A;
    dw $230E,$C205                                                       ;AAD88B;
    db $E8                                                               ;AAD88F;
    dw $230C,$C3F5                                                       ;AAD890;
    db $E8                                                               ;AAD894;
    dw $230A,$C3E5                                                       ;AAD895;
    db $E8                                                               ;AAD899;
    dw $2308,$C215                                                       ;AAD89A;
    db $D8                                                               ;AAD89E;
    dw $2306,$C205                                                       ;AAD89F;
    db $D8                                                               ;AAD8A3;
    dw $2304,$C3F5                                                       ;AAD8A4;
    db $D8                                                               ;AAD8A8;
    dw $2302,$C3E5                                                       ;AAD8A9;
    db $D8                                                               ;AAD8AD;
    dw $2300                                                             ;AAD8AE;

UNUSED_Spritemaps_TourianStatue_Phantoon_AAD8B0:
    dw $0013,$0008                                                       ;AAD8B0;
    db $1C                                                               ;AAD8B4;
    dw $2587,$0000                                                       ;AAD8B5;
    db $1C                                                               ;AAD8B9;
    dw $2586,$01F8                                                       ;AAD8BA;
    db $1C                                                               ;AAD8BE;
    dw $2585,$01F0                                                       ;AAD8BF;
    db $1C                                                               ;AAD8C3;
    dw $2584,$0000                                                       ;AAD8C4;
    db $04                                                               ;AAD8C8;
    dw $2583,$0000                                                       ;AAD8C9;
    db $FC                                                               ;AAD8CD;
    dw $2581,$01F8                                                       ;AAD8CE;
    db $04                                                               ;AAD8D2;
    dw $2582,$01F8                                                       ;AAD8D3;
    db $FC                                                               ;AAD8D7;
    dw $2580,$C208                                                       ;AAD8D8;
    db $EC                                                               ;AAD8DC;
    dw $2561,$C3E8                                                       ;AAD8DD;
    db $EC                                                               ;AAD8E1;
    dw $254D,$C208                                                       ;AAD8E2;
    db $FC                                                               ;AAD8E6;
    dw $2565,$C208                                                       ;AAD8E7;
    db $0C                                                               ;AAD8EB;
    dw $256B,$C3F8                                                       ;AAD8EC;
    db $0C                                                               ;AAD8F0;
    dw $2569,$C3E8                                                       ;AAD8F1;
    db $0C                                                               ;AAD8F5;
    dw $2567,$C3E8                                                       ;AAD8F6;
    db $FC                                                               ;AAD8FA;
    dw $2563,$C200                                                       ;AAD8FB;
    db $EC                                                               ;AAD8FF;
    dw $2560,$C3F0                                                       ;AAD900;
    db $EC                                                               ;AAD904;
    dw $254E,$C200                                                       ;AAD905;
    db $DC                                                               ;AAD909;
    dw $254B,$C3F0                                                       ;AAD90A;
    db $DC                                                               ;AAD90E;
    dw $2549                                                             ;AAD90F;

Palette_Shaktool:
    dw $3800,$5755,$4A4F,$1CE4,$0C60,$56B2,$3E0D,$2D68                   ;AAD911;
    dw $2526,$03FF,$02F7,$0210,$0108,$001F,$0018,$000E                   ;AAD921;

UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931:
    PHY                                                                  ;AAD931;
    LDY.W EnemyData.work4,X                                              ;AAD932;
    LDA.W $106E,Y                                                        ;AAD935;
    EOR.W #$0080                                                         ;AAD938;
    PLY                                                                  ;AAD93B;
    JMP.W MoveShaktoolPiece1Pixel                                        ;AAD93C;


UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F:
    PHY                                                                  ;AAD93F;
    LDY.W EnemyData.work4,X                                              ;AAD940;
    LDA.W $106E,Y                                                        ;AAD943;
    PLY                                                                  ;AAD946;
    JMP.W MoveShaktoolPiece1Pixel                                        ;AAD947;


Instruction_Shaktool_Lower1Pixel:
    LDA.W $0FA9,X                                                        ;AAD94A;
    EOR.W #$0080                                                         ;AAD94D;
    JMP.W MoveShaktoolPiece1Pixel                                        ;AAD950;


Instruction_Shaktool_Raise1Pixel:
    LDA.W $0FA9,X                                                        ;AAD953;

MoveShaktoolPiece1Pixel:
    PHX                                                                  ;AAD956;
    PHY                                                                  ;AAD957;
    TXY                                                                  ;AAD958;
    AND.W #$00FF                                                         ;AAD959;
    ASL A                                                                ;AAD95C;
    TAX                                                                  ;AAD95D;
    STZ.B $12                                                            ;AAD95E;
    STZ.B $14                                                            ;AAD960;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;AAD962;
    BPL +                                                                ;AAD966;
    DEC.B $14                                                            ;AAD968;

  + STA.B $13                                                            ;AAD96A;
    LDA.W EnemyData.xSubPosition,Y                                       ;AAD96C;
    CLC                                                                  ;AAD96F;
    ADC.B $12                                                            ;AAD970;
    STA.W EnemyData.xSubPosition,Y                                       ;AAD972;
    LDA.W EnemyData.xPosition,Y                                          ;AAD975;
    ADC.B $14                                                            ;AAD978;
    STA.W EnemyData.xPosition,Y                                          ;AAD97A;
    STZ.B $12                                                            ;AAD97D;
    STZ.B $14                                                            ;AAD97F;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;AAD981;
    BPL +                                                                ;AAD985;
    DEC.B $14                                                            ;AAD987;

  + STA.B $13                                                            ;AAD989;
    LDA.W EnemyData.ySubPosition,Y                                       ;AAD98B;
    CLC                                                                  ;AAD98E;
    ADC.B $12                                                            ;AAD98F;
    STA.W EnemyData.ySubPosition,Y                                       ;AAD991;
    LDA.W EnemyData.yPosition,Y                                          ;AAD994;
    ADC.B $14                                                            ;AAD997;
    STA.W EnemyData.yPosition,Y                                          ;AAD999;
    PLY                                                                  ;AAD99C;
    PLX                                                                  ;AAD99D;
    RTL                                                                  ;AAD99E;


RTL_AAD99F:
    RTL                                                                  ;AAD99F;

    PHY                                                                  ;AAD9A0; dead code
    LDY.W #EnemyProjectile_ShaktoolFrontCircle                           ;AAD9A1;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAD9A4;
    PHA                                                                  ;AAD9A8;
    LDY.W #EnemyProjectile_ShaktoolMiddleCircle                          ;AAD9A9;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAD9AC;
    PLA                                                                  ;AAD9B0;
    LDY.W #EnemyProjectile_ShaktoolBackCircle                            ;AAD9B1;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;AAD9B4;
    PLY                                                                  ;AAD9B8;
    RTL                                                                  ;AAD9B9;


Instruction_Shaktool_ResetShaktoolFunctions:
    PHY                                                                  ;AAD9BA;
    LDY.W EnemyData.work4,X                                              ;AAD9BB;
    LDA.W ShaktoolPieceData_functionPointer                              ;AAD9BE;
    STA.W EnemyData.work5,Y                                              ;AAD9C1;
    LDA.W ShaktoolPieceData_functionPointer_rightArm                     ;AAD9C4;
    STA.W $0FF2,Y                                                        ;AAD9C7;
    LDA.W ShaktoolPieceData_functionPointer_centerRightArm               ;AAD9CA;
    STA.W $1032,Y                                                        ;AAD9CD;
    LDA.W ShaktoolPieceData_functionPointer_head                         ;AAD9D0;
    STA.W $1072,Y                                                        ;AAD9D3;
    LDA.W ShaktoolPieceData_functionPointer_centerLeftArm                ;AAD9D6;
    STA.W $10B2,Y                                                        ;AAD9D9;
    LDA.W ShaktoolPieceData_functionPointer_leftArm                      ;AAD9DC;
    STA.W $10F2,Y                                                        ;AAD9DF;
    LDA.W ShaktoolPieceData_functionPointer_leftSaw                      ;AAD9E2;
    STA.W $1132,Y                                                        ;AAD9E5;
    PLY                                                                  ;AAD9E8;
    RTL                                                                  ;AAD9E9;


UNUSED_InstList_Shaktool_SawHand_Attack_PrimaryPiece_AAD9EA:
    dw Instruction_Common_WaitYFrames                                    ;AAD9EA;
    dw $0240                                                             ;AAD9EC;
    dw Instruction_Common_GotoY                                          ;AAD9EE;
    dw InstList_Shaktool_SawHand_PrimaryPiece                            ;AAD9F0;

UNUSED_InstList_Shaktool_SawHand_Attack_FinalPiece_AAD9F2:
    dw Instruction_Common_WaitYFrames                                    ;AAD9F2;
    dw $0240                                                             ;AAD9F4;
    dw Instruction_Shaktool_ResetShaktoolFunctions                       ;AAD9F6;
    dw Instruction_Common_GotoY                                          ;AAD9F8;
    dw InstList_Shaktool_SawHand_FinalPiece                              ;AAD9FA;

InstList_Shaktool_SawHand_HeadBob_PrimaryPiece:
    dw Instruction_Common_WaitYFrames                                    ;AAD9FC;
    dw $0014                                                             ;AAD9FE;
    dw Instruction_Common_GotoY                                          ;AADA00;
    dw InstList_Shaktool_SawHand_PrimaryPiece                            ;AADA02;

InstList_Shaktool_SawHand_HeadBob_FinalPiece:
    dw Instruction_Common_WaitYFrames                                    ;AADA04;
    dw $0014                                                             ;AADA06;
    dw Instruction_Shaktool_ResetShaktoolFunctions                       ;AADA08;
    dw Instruction_Common_GotoY                                          ;AADA0A;
    dw InstList_Shaktool_SawHand_FinalPiece                              ;AADA0C;

InstList_Shaktool_SawHand_PrimaryPiece:
    dw $000A                                                             ;AADA0E;
    dw Spritemaps_Shaktool_SawHand_PrimaryPiece_0                        ;AADA10;
    dw $000A                                                             ;AADA12;
    dw Spritemaps_Shaktool_SawHand_PrimaryPiece_1                        ;AADA14;
    dw $000A                                                             ;AADA16;
    dw Spritemaps_Shaktool_SawHand_PrimaryPiece_2                        ;AADA18;
    dw Instruction_Common_GotoY                                          ;AADA1A;
    dw InstList_Shaktool_SawHand_PrimaryPiece                            ;AADA1C;

InstList_Shaktool_SawHand_FinalPiece:
    dw $0003                                                             ;AADA1E;
    dw Spritemaps_Shaktool_SawHand_FinalPiece_0                          ;AADA20;
    dw $0003                                                             ;AADA22;
    dw Spritemaps_Shaktool_SawHand_FinalPiece_1                          ;AADA24;
    dw $0003                                                             ;AADA26;
    dw Spritemaps_Shaktool_SawHand_FinalPiece_2                          ;AADA28;
    dw Instruction_Common_GotoY                                          ;AADA2A;
    dw InstList_Shaktool_SawHand_FinalPiece                              ;AADA2C;

UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E:
    dw Instruction_Common_WaitYFrames                                    ;AADA2E;
    dw $00C0                                                             ;AADA30;
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931        ;AADA32;
    dw Instruction_Common_WaitYFrames                                    ;AADA34;
    dw $0080                                                             ;AADA36;
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F         ;AADA38;
    dw Instruction_Common_WaitYFrames                                    ;AADA3A;
    dw $0100                                                             ;AADA3C;
    dw Instruction_Common_GotoY                                          ;AADA3E;
    dw InstList_Shaktool_ArmPiece_Normal                                 ;AADA40;

UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42:
    dw Instruction_Common_WaitYFrames                                    ;AADA42;
    dw $0100                                                             ;AADA44;
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931        ;AADA46;
    dw Instruction_Common_WaitYFrames                                    ;AADA48;
    dw $0080                                                             ;AADA4A;
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F         ;AADA4C;
    dw Instruction_Common_WaitYFrames                                    ;AADA4E;
    dw $00C0                                                             ;AADA50;
    dw Instruction_Common_GotoY                                          ;AADA52;
    dw InstList_Shaktool_ArmPiece_Normal                                 ;AADA54;

InstList_Shaktool_ArmPiece_HeadBob_Back:
    dw Instruction_Shaktool_Lower1Pixel                                  ;AADA56;
    dw Instruction_Common_WaitYFrames                                    ;AADA58;
    dw $0014                                                             ;AADA5A;
    dw Instruction_Shaktool_Raise1Pixel                                  ;AADA5C;
    dw Instruction_Common_GotoY                                          ;AADA5E;
    dw InstList_Shaktool_ArmPiece_Normal                                 ;AADA60;

InstList_Shaktool_ArmPiece_HeadBob_Front:
    dw Instruction_Common_WaitYFrames                                    ;AADA62;
    dw $0004                                                             ;AADA64;
    dw Instruction_Shaktool_Lower1Pixel                                  ;AADA66;
    dw Instruction_Common_WaitYFrames                                    ;AADA68;
    dw $000C                                                             ;AADA6A;
    dw Instruction_Shaktool_Raise1Pixel                                  ;AADA6C;
    dw Instruction_Common_WaitYFrames                                    ;AADA6E;
    dw $0004                                                             ;AADA70;

InstList_Shaktool_ArmPiece_Normal:
    dw $0077                                                             ;AADA72;
    dw Spritemaps_Shaktool_ArmPiece                                      ;AADA74;
    dw Instruction_Common_GotoY                                          ;AADA76;
    dw InstList_Shaktool_ArmPiece_Normal                                 ;AADA78;

UNUSED_InstList_Shaktool_Head_Attack_AADA7A:
    dw Instruction_Common_WaitYFrames                                    ;AADA7A;
    dw $0080                                                             ;AADA7C;
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931        ;AADA7E;
    dw RTL_AAD99F                                                        ;AADA80;
    dw Instruction_Common_WaitYFrames                                    ;AADA82;
    dw $0080                                                             ;AADA84;
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F         ;AADA86;
    dw Instruction_Common_WaitYFrames                                    ;AADA88;
    dw $0140                                                             ;AADA8A;
    dw Instruction_Common_WaitYFrames                                    ;AADA8C;
    dw $0001                                                             ;AADA8E;

InstList_Shaktool_Head_HeadBob:
    dw Instruction_Common_WaitYFrames                                    ;AADA90;
    dw $0008                                                             ;AADA92;
    dw Instruction_Shaktool_Lower1Pixel                                  ;AADA94;
    dw Instruction_Common_WaitYFrames                                    ;AADA96;
    dw $0004                                                             ;AADA98;
    dw Instruction_Shaktool_Raise1Pixel                                  ;AADA9A;
    dw Instruction_Common_WaitYFrames                                    ;AADA9C;
    dw $0008                                                             ;AADA9E;
    dw Instruction_Common_WaitYFrames                                    ;AADAA0;
    dw $0001                                                             ;AADAA2;

InstList_Shaktool_Head_AimingLeft:
    dw $0774                                                             ;AADAA4;
    dw Spritemaps_Shaktool_Head_0                                        ;AADAA6;
    dw Instruction_Common_GotoY                                          ;AADAA8;
    dw InstList_Shaktool_Head_AimingLeft                                 ;AADAAA;

InstList_Shaktool_Head_AimingUpLeft:
    dw $0775                                                             ;AADAAC;
    dw Spritemaps_Shaktool_Head_1                                        ;AADAAE;
    dw Instruction_Common_GotoY                                          ;AADAB0;
    dw InstList_Shaktool_Head_AimingUpLeft                               ;AADAB2;

InstList_Shaktool_Head_AimingUp:
    dw $0776                                                             ;AADAB4;
    dw Spritemaps_Shaktool_Head_2                                        ;AADAB6;
    dw Instruction_Common_GotoY                                          ;AADAB8;
    dw InstList_Shaktool_Head_AimingUp                                   ;AADABA;

InstList_Shaktool_Head_AimingUpRight:
    dw $0777                                                             ;AADABC;
    dw Spritemaps_Shaktool_Head_3                                        ;AADABE;
    dw Instruction_Common_GotoY                                          ;AADAC0;
    dw InstList_Shaktool_Head_AimingUpRight                              ;AADAC2;

InstList_Shaktool_Head_AimingRight:
    dw $0778                                                             ;AADAC4;
    dw Spritemaps_Shaktool_Head_4                                        ;AADAC6;
    dw Instruction_Common_GotoY                                          ;AADAC8;
    dw InstList_Shaktool_Head_AimingRight                                ;AADACA;

InstList_Shaktool_Head_AimingDownRight:
    dw $0779                                                             ;AADACC;
    dw Spritemaps_Shaktool_Head_5                                        ;AADACE;
    dw Instruction_Common_GotoY                                          ;AADAD0;
    dw InstList_Shaktool_Head_AimingDownRight                            ;AADAD2;

InstList_Shaktool_Head_AimingDown:
    dw $077A                                                             ;AADAD4;
    dw Spritemaps_Shaktool_Head_6                                        ;AADAD6;
    dw Instruction_Common_GotoY                                          ;AADAD8;
    dw InstList_Shaktool_Head_AimingDown                                 ;AADADA;

InstList_Shaktool_Head_AimingDownLeft:
    dw $077B                                                             ;AADADC;
    dw Spritemaps_Shaktool_Head_7                                        ;AADADE;
    dw Instruction_Common_GotoY                                          ;AADAE0;
    dw InstList_Shaktool_Head_AimingDownLeft                             ;AADAE2;

RTS_AADAE4:
    RTS                                                                  ;AADAE4;

    JSL.L GenerateRandomNumber                                           ;AADAE5; dead code
    BIT.W #$8431                                                         ;AADAE9;
    BNE .return                                                          ;AADAEC;
    LDY.W #$000C                                                         ;AADAEE;

.loop:
    LDA.W #RTS_AADCAA                                                    ;AADAF1;
    STA.W EnemyData.work5,X                                              ;AADAF4;
    LDA.W ShaktoolPieceData_unusedAttackInstListPointer,Y                ;AADAF7;
    STA.W EnemyData.pInstList,X                                          ;AADAFA;
    LDA.W #$0001                                                         ;AADAFD;
    STA.W EnemyData.instTimer,X                                          ;AADB00;
    TXA                                                                  ;AADB03;
    SEC                                                                  ;AADB04;
    SBC.W #$0040                                                         ;AADB05;
    TAX                                                                  ;AADB08;
    DEY                                                                  ;AADB09;
    DEY                                                                  ;AADB0A;
    BPL .loop                                                            ;AADB0B;

.return:
    RTS                                                                  ;AADB0D;


ShaktoolPiecesMovementOptionsInA:
    LDY.W EnemyData.work4,X                                              ;AADB0E;
    STA.W EnemyData.initParam0,Y                                         ;AADB11;
    STA.W $0FF4,Y                                                        ;AADB14;
    STA.W $1034,Y                                                        ;AADB17;
    STA.W $1074,Y                                                        ;AADB1A;
    STA.W $10B4,Y                                                        ;AADB1D;
    STA.W $10F4,Y                                                        ;AADB20;
    STA.W $1134,Y                                                        ;AADB23;
    RTS                                                                  ;AADB26;


ShaktoolPiecesFacingAngleInA:
    LDY.W EnemyData.work4,X                                              ;AADB27;
    STA.W EnemyData.work0,Y                                              ;AADB2A;
    STA.W $0FE8,Y                                                        ;AADB2D;
    STA.W $1028,Y                                                        ;AADB30;
    STA.W $1068,Y                                                        ;AADB33;
    STA.W $10A8,Y                                                        ;AADB36;
    STA.W $10E8,Y                                                        ;AADB39;
    STA.W $1128,Y                                                        ;AADB3C;
    RTS                                                                  ;AADB3F;


ShaktoolPiecesNeighborAngleInA:
    LDY.W EnemyData.work4,X                                              ;AADB40;
    STA.W EnemyData.work1,Y                                              ;AADB43;
    STA.W $0FEA,Y                                                        ;AADB46;
    STA.W $102A,Y                                                        ;AADB49;
    STA.W $106A,Y                                                        ;AADB4C;
    STA.W $10AA,Y                                                        ;AADB4F;
    STA.W $10EA,Y                                                        ;AADB52;
    STA.W $112A,Y                                                        ;AADB55;
    RTS                                                                  ;AADB58;


FlipShaktool:
    LDY.W EnemyData.work4,X                                              ;AADB59;
    LDA.W $106E,Y                                                        ;AADB5C;
    EOR.W #$8000                                                         ;AADB5F;
    STA.W $106E,Y                                                        ;AADB62;
    LDX.W $112A,Y                                                        ;AADB65;
    LDA.W $0FEA,Y                                                        ;AADB68;
    EOR.W #$8000                                                         ;AADB6B;
    AND.W #$FF00                                                         ;AADB6E;
    STA.W $112A,Y                                                        ;AADB71;
    TXA                                                                  ;AADB74;
    EOR.W #$8000                                                         ;AADB75;
    AND.W #$FF00                                                         ;AADB78;
    STA.W $0FEA,Y                                                        ;AADB7B;
    LDX.W $10EA,Y                                                        ;AADB7E;
    LDA.W $102A,Y                                                        ;AADB81;
    EOR.W #$8000                                                         ;AADB84;
    AND.W #$FF00                                                         ;AADB87;
    STA.W $10EA,Y                                                        ;AADB8A;
    TXA                                                                  ;AADB8D;
    EOR.W #$8000                                                         ;AADB8E;
    AND.W #$FF00                                                         ;AADB91;
    STA.W $102A,Y                                                        ;AADB94;
    LDX.W $10AA,Y                                                        ;AADB97;
    LDA.W $106A,Y                                                        ;AADB9A;
    EOR.W #$8000                                                         ;AADB9D;
    AND.W #$FF00                                                         ;AADBA0;
    STA.W $10AA,Y                                                        ;AADBA3;
    TXA                                                                  ;AADBA6;
    EOR.W #$8000                                                         ;AADBA7;
    AND.W #$FF00                                                         ;AADBAA;
    STA.W $106A,Y                                                        ;AADBAD;
    LDX.W $10FC,Y                                                        ;AADBB0;
    LDA.W EnemyData.xSubPosition,Y                                       ;AADBB3;
    STA.W $10FC,Y                                                        ;AADBB6;
    TXA                                                                  ;AADBB9;
    STA.W EnemyData.xSubPosition,Y                                       ;AADBBA;
    LDX.W $1100,Y                                                        ;AADBBD;
    LDA.W EnemyData.ySubPosition,Y                                       ;AADBC0;
    STA.W $1100,Y                                                        ;AADBC3;
    TXA                                                                  ;AADBC6;
    STA.W EnemyData.ySubPosition,Y                                       ;AADBC7;
    LDX.W $10FA,Y                                                        ;AADBCA;
    LDA.W EnemyData.xPosition,Y                                          ;AADBCD;
    STA.W $10FA,Y                                                        ;AADBD0;
    TXA                                                                  ;AADBD3;
    STA.W EnemyData.xPosition,Y                                          ;AADBD4;
    LDX.W $10FE,Y                                                        ;AADBD7;
    LDA.W EnemyData.yPosition,Y                                          ;AADBDA;
    STA.W $10FE,Y                                                        ;AADBDD;
    TXA                                                                  ;AADBE0;
    STA.W EnemyData.yPosition,Y                                          ;AADBE1;
    TYX                                                                  ;AADBE4;
    LDA.W #$8000                                                         ;AADBE5;
    STA.W $0FBC,X                                                        ;AADBE8;
    STA.W $0FFC,X                                                        ;AADBEB;
    STA.W $103C,X                                                        ;AADBEE;
    STA.W $107C,X                                                        ;AADBF1;
    STA.W $10BC,X                                                        ;AADBF4;
    STA.W $0FC0,X                                                        ;AADBF7;
    STA.W $1000,X                                                        ;AADBFA;
    STA.W $1040,X                                                        ;AADBFD;
    STA.W $1080,X                                                        ;AADC00;
    STA.W $10C0,X                                                        ;AADC03;
    RTS                                                                  ;AADC06;


SetSHaktoolPieceNeighborAngleDeltaDueToBlockCollision:
    LDA.W #$0000                                                         ;AADC07;
    SEC                                                                  ;AADC0A;
    BIT.W EnemyData.initParam0,X                                         ;AADC0B;
    BMI .antiClockwise                                                   ;AADC0E;
    SBC.W EnemyData.work1,X                                              ;AADC10;
    CLC                                                                  ;AADC13;
    ADC.W EnemyData.work0,X                                              ;AADC14;
    BRA +                                                                ;AADC17;


.antiClockwise:
    SBC.W EnemyData.work0,X                                              ;AADC19;
    CLC                                                                  ;AADC1C;
    ADC.W EnemyData.work1,X                                              ;AADC1D;

  + XBA                                                                  ;AADC20;
    AND.W #$00FF                                                         ;AADC21;
    ASL A                                                                ;AADC24;
    ASL A                                                                ;AADC25;
    STA.W EnemyData.work2,X                                              ;AADC26;
    RTS                                                                  ;AADC29;


PositionShaktoolPieceRelativeToPreviousPiece:
    LDA.W $0FAB,X                                                        ;AADC2A;
    AND.W #$00FF                                                         ;AADC2D;
    ASL A                                                                ;AADC30;
    TAY                                                                  ;AADC31;
    STZ.B $12                                                            ;AADC32;
    STZ.B $14                                                            ;AADC34;
    LDA.W SineCosineTables_sine,Y                                        ;AADC36;
    BPL +                                                                ;AADC39;
    DEC.B $14                                                            ;AADC3B;

  + STA.B $13                                                            ;AADC3D;
    LDA.B $12                                                            ;AADC3F;
    CLC                                                                  ;AADC41;
    ADC.W $0F3C,X                                                        ;AADC42;
    STA.W EnemyData.xSubPosition,X                                       ;AADC45;
    LDA.B $14                                                            ;AADC48;
    ADC.W $0F3A,X                                                        ;AADC4A;
    STA.W EnemyData.xPosition,X                                          ;AADC4D;
    STZ.B $12                                                            ;AADC50;
    STZ.B $14                                                            ;AADC52;
    LDA.W SineCosineTables_negativeCosine,Y                              ;AADC54;
    BPL +                                                                ;AADC57;
    DEC.B $14                                                            ;AADC59;

  + STA.B $13                                                            ;AADC5B;
    LDA.B $12                                                            ;AADC5D;
    CLC                                                                  ;AADC5F;
    ADC.W $0F40,X                                                        ;AADC60;
    STA.W EnemyData.ySubPosition,X                                       ;AADC63;
    LDA.B $14                                                            ;AADC66;
    ADC.W $0F3E,X                                                        ;AADC68;
    STA.W EnemyData.yPosition,X                                          ;AADC6B;
    RTS                                                                  ;AADC6E;


SetShaktoolPiecesNeighborAngleAndAngleDeltaForCurling:
    LDA.W EnemyData.work0,X                                              ;AADC6F;
    JSR.W ShaktoolPiecesNeighborAngleInA                                 ;AADC72;
    LDY.W EnemyData.work4,X                                              ;AADC75;
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta             ;AADC78;
    STA.W EnemyData.work2,Y                                              ;AADC7B;
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_rightArm    ;AADC7E;
    STA.W $0FEC,Y                                                        ;AADC81;
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerRightArm ;AADC84;
    STA.W $102C,Y                                                        ;AADC87;
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_head        ;AADC8A;
    STA.W $106C,Y                                                        ;AADC8D;
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerLeftArm ;AADC90;
    STA.W $10AC,Y                                                        ;AADC93;
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftArm     ;AADC96;
    STA.W $10EC,Y                                                        ;AADC99;
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftSaw     ;AADC9C;
    STA.W $112C,Y                                                        ;AADC9F;
    RTS                                                                  ;AADCA2;


MainAI_HurtAI_Shaktool:
    LDX.W $0E54                                                          ;AADCA3;
    JSR.W ($0FB2,X)                                                      ;AADCA6;
    RTL                                                                  ;AADCA9;


RTS_AADCAA:
    RTS                                                                  ;AADCAA;


RTS_AADCAB:
    RTS                                                                  ;AADCAB;


Function_Shaktool_ArmPiece_SetPosition_HandleCurling:
    JSR.W PositionShaktoolPieceRelativeToPreviousPiece                   ;AADCAC;
    BIT.W EnemyData.initParam0,X                                         ;AADCAF;
    BVC .notFullyCurled                                                  ;AADCB2;
    LDA.W #$0100                                                         ;AADCB4;
    CLC                                                                  ;AADCB7;
    ADC.W EnemyData.work0,X                                              ;AADCB8;
    STA.W EnemyData.work0,X                                              ;AADCBB;
    LDA.W #$0100                                                         ;AADCBE;
    BRA +                                                                ;AADCC1;


.notFullyCurled:
    LDA.W EnemyData.work2,X                                              ;AADCC3;

  + BIT.W EnemyData.initParam0,X                                         ;AADCC6;
    BPL .clockwise                                                       ;AADCC9;
    EOR.W #$FFFF                                                         ;AADCCB;
    INC A                                                                ;AADCCE;

.clockwise:
    CLC                                                                  ;AADCCF;
    ADC.W EnemyData.work1,X                                              ;AADCD0;
    STA.W EnemyData.work1,X                                              ;AADCD3;
    RTS                                                                  ;AADCD6;


Function_Shaktool_Head:
    JSR.W Function_Shaktool_ArmPiece_SetPosition_HandleCurling           ;AADCD7;
    LDA.W EnemyData.work1,X                                              ;AADCDA;
    EOR.W #$8000                                                         ;AADCDD;
    STA.B $12                                                            ;AADCE0;
    LDA.W $0FEA,X                                                        ;AADCE2;
    SEC                                                                  ;AADCE5;
    SBC.B $12                                                            ;AADCE6;
    LSR A                                                                ;AADCE8;
    CLC                                                                  ;AADCE9;
    ADC.B $12                                                            ;AADCEA;
    BIT.W EnemyData.work3,X                                              ;AADCEC;
    BPL +                                                                ;AADCEF;
    EOR.W #$8000                                                         ;AADCF1;

  + XBA                                                                  ;AADCF4;
    CLC                                                                  ;AADCF5;
    ADC.W #$0008                                                         ;AADCF6;
    AND.W #$00E0                                                         ;AADCF9;
    SEP #$20                                                             ;AADCFC;
    STA.W EnemyData.work3,X                                              ;AADCFE;
    REP #$20                                                             ;AADD01;
    LSR A                                                                ;AADD03;
    LSR A                                                                ;AADD04;
    LSR A                                                                ;AADD05;
    LSR A                                                                ;AADD06;
    TAY                                                                  ;AADD07;
    LDA.W .pointers,Y                                                    ;AADD08;
    STA.W EnemyData.pInstList,X                                          ;AADD0B;
    LDA.W #$0001                                                         ;AADD0E;
    STA.W EnemyData.instTimer,X                                          ;AADD11;
    RTS                                                                  ;AADD14;


.pointers:
    dw InstList_Shaktool_Head_AimingUp                                   ;AADD15;
    dw InstList_Shaktool_Head_AimingUpRight                              ;AADD17;
    dw InstList_Shaktool_Head_AimingRight                                ;AADD19;
    dw InstList_Shaktool_Head_AimingDownRight                            ;AADD1B;
    dw InstList_Shaktool_Head_AimingDown                                 ;AADD1D;
    dw InstList_Shaktool_Head_AimingDownLeft                             ;AADD1F;
    dw InstList_Shaktool_Head_AimingLeft                                 ;AADD21;
    dw InstList_Shaktool_Head_AimingUpLeft                               ;AADD23;

Function_Shaktool_FinalPiece:
    LDA.W EnemyData.yPosition,X                                          ;AADD25;
    PHA                                                                  ;AADD28;
    LDA.W EnemyData.xPosition,X                                          ;AADD29;
    PHA                                                                  ;AADD2C;
    JSR.W Function_Shaktool_ArmPiece_SetPosition_HandleCurling           ;AADD2D;
    LDA.W EnemyData.yPosition,X                                          ;AADD30;
    PHA                                                                  ;AADD33;
    LDA.W EnemyData.xPosition,X                                          ;AADD34;
    PHA                                                                  ;AADD37;
    LDA.B $05,S                                                          ;AADD38;
    STA.W EnemyData.xPosition,X                                          ;AADD3A;
    LDA.B $07,S                                                          ;AADD3D;
    STA.W EnemyData.yPosition,X                                          ;AADD3F;
    STZ.B $12                                                            ;AADD42;
    LDA.B $01,S                                                          ;AADD44;
    SEC                                                                  ;AADD46;
    SBC.B $05,S                                                          ;AADD47;
    STA.B $14                                                            ;AADD49;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;AADD4B;
    BCS .collision                                                       ;AADD4F;
    LDA.B $07,S                                                          ;AADD51;
    STA.W EnemyData.yPosition,X                                          ;AADD53;
    STZ.B $12                                                            ;AADD56;
    LDA.B $03,S                                                          ;AADD58;
    SEC                                                                  ;AADD5A;
    SBC.B $07,S                                                          ;AADD5B;
    STA.B $14                                                            ;AADD5D;
    JSL.L MoveEnemyDownBy_14_12                                          ;AADD5F;
    BCS .collision                                                       ;AADD63;
    PLA                                                                  ;AADD65;
    STA.W EnemyData.xPosition,X                                          ;AADD66;
    PLA                                                                  ;AADD69;
    STA.W EnemyData.yPosition,X                                          ;AADD6A;
    PLA                                                                  ;AADD6D;
    PLA                                                                  ;AADD6E;
    BIT.W EnemyData.initParam0,X                                         ;AADD6F;
    BVC .notFullyCurled                                                  ;AADD72;
    LDA.W #$0100                                                         ;AADD74;
    CLC                                                                  ;AADD77;
    ADC.W EnemyData.work0,X                                              ;AADD78;
    STA.W EnemyData.work0,X                                              ;AADD7B;
    RTS                                                                  ;AADD7E;


.notFullyCurled:
    LDA.W EnemyData.work1,X                                              ;AADD7F;
    EOR.W EnemyData.work0,X                                              ;AADD82;
    AND.W #$FF00                                                         ;AADD85;
    BNE +                                                                ;AADD88;
    JSR.W SetShaktoolPiecesNeighborAngleAndAngleDeltaForCurling          ;AADD8A;
    LDA.W #$7800                                                         ;AADD8D;
    STA.W EnemyData.work3,X                                              ;AADD90;
    LDA.W EnemyData.initParam0,X                                         ;AADD93;
    AND.W #$DFFF                                                         ;AADD96;
    JSR.W ShaktoolPiecesMovementOptionsInA                               ;AADD99;
    LDA.W EnemyData.work3,X                                              ;AADD9C;
    AND.W #$FF00                                                         ;AADD9F;
    STA.W EnemyData.work3,X                                              ;AADDA2;

  + LDA.W EnemyData.work2,X                                              ;AADDA5;
    CLC                                                                  ;AADDA8;
    ADC.W EnemyData.work3,X                                              ;AADDA9;
    STA.W EnemyData.work3,X                                              ;AADDAC;
    CMP.W #$F000                                                         ;AADDAF;
    BCC .return                                                          ;AADDB2;
    LDY.W EnemyData.work4,X                                              ;AADDB4;
    LDA.W EnemyData.initParam0,X                                         ;AADDB7;
    ORA.W #$4000                                                         ;AADDBA;
    JSR.W ShaktoolPiecesMovementOptionsInA                               ;AADDBD;

.return:
    JSR.W RTS_AADAE4                                                     ;AADDC0;
    RTS                                                                  ;AADDC3;


.collision:
    LDA.W EnemyData.initParam0,X                                         ;AADDC4;
    BIT.W #$2000                                                         ;AADDC7;
    BEQ .curling                                                         ;AADDCA;
    PLA                                                                  ;AADDCC;
    PLA                                                                  ;AADDCD;
    PLA                                                                  ;AADDCE;
    PLA                                                                  ;AADDCF;
    LDA.W EnemyData.initParam0,X                                         ;AADDD0;
    EOR.W #$8000                                                         ;AADDD3;
    AND.W #$8FFF                                                         ;AADDD6;
    JSR.W ShaktoolPiecesMovementOptionsInA                               ;AADDD9;
    BRA +                                                                ;AADDDC;


.curling:
    PLA                                                                  ;AADDDE;
    PLA                                                                  ;AADDDF;
    PLA                                                                  ;AADDE0;
    STA.W EnemyData.xPosition,X                                          ;AADDE1;
    PLA                                                                  ;AADDE4;
    STA.W EnemyData.yPosition,X                                          ;AADDE5;
    JSR.W FlipShaktool                                                   ;AADDE8;
    LDX.W $0E54                                                          ;AADDEB;
    LDA.W EnemyData.initParam0,X                                         ;AADDEE;
    ORA.W #$2000                                                         ;AADDF1;
    JSR.W ShaktoolPiecesMovementOptionsInA                               ;AADDF4;
    LDA.W EnemyData.initParam0,X                                         ;AADDF7;
    AND.W #$BFFF                                                         ;AADDFA;
    JSR.W ShaktoolPiecesMovementOptionsInA                               ;AADDFD;

  + STZ.W EnemyData.work3,X                                              ;AADE00;
    LDY.W EnemyData.work4,X                                              ;AADE03;
    JSL.L CalculateAngleOfEnemyYFromEnemyX                               ;AADE06;
    XBA                                                                  ;AADE0A;
    AND.W #$FF00                                                         ;AADE0B;
    BIT.W EnemyData.initParam0,X                                         ;AADE0E;
    BMI .antiClockwise                                                   ;AADE11;
    CLC                                                                  ;AADE13;
    ADC.W #$4000                                                         ;AADE14;
    BRA +                                                                ;AADE17;


.antiClockwise:
    SEC                                                                  ;AADE19;
    SBC.W #$4000                                                         ;AADE1A;

  + JSR.W ShaktoolPiecesFacingAngleInA                                   ;AADE1D;
    LDY.W #$000C                                                         ;AADE20;

.loop:
    JSR.W SetSHaktoolPieceNeighborAngleDeltaDueToBlockCollision          ;AADE23;
    LDA.W #RTS_AADCAA                                                    ;AADE26;
    STA.W EnemyData.work5,X                                              ;AADE29;
    LDA.W ShaktoolPieceData_headBobInstListPointer,Y                     ;AADE2C;
    STA.W EnemyData.pInstList,X                                          ;AADE2F;
    LDA.W #$0001                                                         ;AADE32;
    STA.W EnemyData.instTimer,X                                          ;AADE35;
    TXA                                                                  ;AADE38;
    SEC                                                                  ;AADE39;
    SBC.W #$0040                                                         ;AADE3A;
    TAX                                                                  ;AADE3D;
    DEY                                                                  ;AADE3E;
    DEY                                                                  ;AADE3F;
    BPL .loop                                                            ;AADE40;
    RTS                                                                  ;AADE42;


InitAI_Shaktool:
    LDX.W $0E54                                                          ;AADE43;
    LDA.W #$0001                                                         ;AADE46;
    STA.W EnemyData.instTimer,X                                          ;AADE49;
    STZ.W EnemyData.loopCounter,X                                        ;AADE4C;
    LDA.W #$0000                                                         ;AADE4F;
    STA.W EnemyData.work0,X                                              ;AADE52;
    STA.W EnemyData.work3,X                                              ;AADE55;
    LDY.W EnemyData.initParam1,X                                         ;AADE58;
    LDA.W EnemyData.properties,X                                         ;AADE5B;
    ORA.W ShaktoolPieceData_properties,Y                                 ;AADE5E;
    STA.W EnemyData.properties,X                                         ;AADE61;
    TXA                                                                  ;AADE64;
    SEC                                                                  ;AADE65;
    SBC.W ShaktoolPieceData_RAMOffset,Y                                  ;AADE66;
    STA.W EnemyData.work4,X                                              ;AADE69;
    LDA.W ShaktoolPieceData_functionPointer,Y                            ;AADE6C;
    STA.W EnemyData.work5,X                                              ;AADE6F;
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta,Y           ;AADE72;
    SEC                                                                  ;AADE75;
    SBC.W ShaktoolPieceData_zero,Y                                       ;AADE76;
    STA.W EnemyData.work2,X                                              ;AADE79;
    LDA.W ShaktoolPieceData_initialNeighborAngle,Y                       ;AADE7C;
    STA.W EnemyData.work1,X                                              ;AADE7F;
    LDA.W ShaktoolPieceData_initialInstListPointer,Y                     ;AADE82;
    STA.W EnemyData.pInstList,X                                          ;AADE85;
    LDA.W ShaktoolPieceData_layerControl,Y                               ;AADE88;
    STA.W EnemyData.layer,X                                              ;AADE8B;
    TYA                                                                  ;AADE8E;
    BEQ .return                                                          ;AADE8F;
    JSR.W PositionShaktoolPieceRelativeToPreviousPiece                   ;AADE91;

.return:
    RTL                                                                  ;AADE94;


ShaktoolPieceData_properties:
    dw $2800,$2C00,$2C00,$2C00,$2C00,$2C00,$2800                         ;AADE95;

ShaktoolPieceData_RAMOffset:
    dw $0000,$0040,$0080,$00C0,$0100,$0140,$0180                         ;AADEA3;

ShaktoolPieceData_initialNeighborAngle:
    dw $0000,$F800,$E800,$D000,$B000,$9800,$8800                         ;AADEB1;

ShaktoolPieceData_initialInstListPointer:
    dw InstList_Shaktool_SawHand_PrimaryPiece                            ;AADEBF;
    dw InstList_Shaktool_ArmPiece_Normal                                 ;AADEC1;
    dw InstList_Shaktool_ArmPiece_Normal                                 ;AADEC3;
    dw InstList_Shaktool_Head_AimingDown                                 ;AADEC5;
    dw InstList_Shaktool_ArmPiece_Normal                                 ;AADEC7;
    dw InstList_Shaktool_ArmPiece_Normal                                 ;AADEC9;
    dw InstList_Shaktool_SawHand_PrimaryPiece                            ;AADECB;

ShaktoolPieceData_layerControl:
    dw $0002,$0004,$0004,$0002,$0004,$0004,$0002                         ;AADECD;

ShaktoolPieceData_functionPointer:
    dw RTS_AADCAB                                                        ;AADEDB;

ShaktoolPieceData_functionPointer_rightArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling              ;AADEDD;

ShaktoolPieceData_functionPointer_centerRightArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling              ;AADEDF;

ShaktoolPieceData_functionPointer_head:
    dw Function_Shaktool_Head                                            ;AADEE1;

ShaktoolPieceData_functionPointer_centerLeftArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling              ;AADEE3;

ShaktoolPieceData_functionPointer_leftArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling              ;AADEE5;

ShaktoolPieceData_functionPointer_leftSaw:
    dw Function_Shaktool_FinalPiece                                      ;AADEE7;

ShaktoolPieceData_initialCurlingNeighborAngleDelta:
    dw $0000                                                             ;AADEE9;

ShaktoolPieceData_initialCurlingNeighborAngleDelta_rightArm:
    dw $0020                                                             ;AADEEB;

ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerRightArm:
    dw $0060                                                             ;AADEED;

ShaktoolPieceData_initialCurlingNeighborAngleDelta_head:
    dw $00C0                                                             ;AADEEF;

ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerLeftArm:
    dw $0140                                                             ;AADEF1;

ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftArm:
    dw $01A0                                                             ;AADEF3;

ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftSaw:
    dw $01E0                                                             ;AADEF5;

ShaktoolPieceData_zero:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000                         ;AADEF7;

ShaktoolPieceData_unused:
    dw $0000,$0000,$0002,$0004,$0006,$0008,$000A                         ;AADF05;

ShaktoolPieceData_headBobInstListPointer:
    dw InstList_Shaktool_SawHand_HeadBob_PrimaryPiece                    ;AADF13;
    dw InstList_Shaktool_ArmPiece_HeadBob_Back                           ;AADF15;
    dw InstList_Shaktool_ArmPiece_HeadBob_Front                          ;AADF17;
    dw InstList_Shaktool_Head_HeadBob                                    ;AADF19;
    dw InstList_Shaktool_ArmPiece_HeadBob_Front                          ;AADF1B;
    dw InstList_Shaktool_ArmPiece_HeadBob_Back                           ;AADF1D;
    dw InstList_Shaktool_SawHand_HeadBob_FinalPiece                      ;AADF1F;

ShaktoolPieceData_unusedAttackInstListPointer:
    dw UNUSED_InstList_Shaktool_SawHand_Attack_PrimaryPiece_AAD9EA       ;AADF21;
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E              ;AADF23;
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42             ;AADF25;
    dw UNUSED_InstList_Shaktool_Head_Attack_AADA7A                       ;AADF27;
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42             ;AADF29;
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E              ;AADF2B;
    dw UNUSED_InstList_Shaktool_SawHand_Attack_FinalPiece_AAD9F2         ;AADF2D;

EnemyTouch_Shaktool:
    JSL.L NormalEnemyTouchAI                                             ;AADF2F;
    RTL                                                                  ;AADF33;


EnemyShot_Shaktool:
    JSL.L NormalEnemyShotAI                                              ;AADF34;
    LDX.W $0E54                                                          ;AADF38;
    LDA.W EnemyData.health,X                                             ;AADF3B;
    BNE .return                                                          ;AADF3E;
    LDY.W EnemyData.work4,X                                              ;AADF40;
    LDA.W #$0200                                                         ;AADF43;
    STA.W EnemyData.properties,Y                                         ;AADF46;
    STA.W $0FC6,Y                                                        ;AADF49;
    STA.W $1006,Y                                                        ;AADF4C;
    STA.W $1046,Y                                                        ;AADF4F;
    STA.W $1086,Y                                                        ;AADF52;
    STA.W $10C6,Y                                                        ;AADF55;
    STA.W $1106,Y                                                        ;AADF58;

.return:
    RTL                                                                  ;AADF5B;


Spritemaps_Shaktool_SawHand_FinalPiece_0:
    dw $0001,$81F8                                                       ;AADF5C;
    db $F8                                                               ;AADF60;
    dw $2100                                                             ;AADF61;

Spritemaps_Shaktool_SawHand_FinalPiece_1:
    dw $0001,$81F8                                                       ;AADF63;
    db $F8                                                               ;AADF67;
    dw $2102                                                             ;AADF68;

Spritemaps_Shaktool_SawHand_FinalPiece_2:
    dw $0001,$81F8                                                       ;AADF6A;
    db $F8                                                               ;AADF6E;
    dw $2104                                                             ;AADF6F;

Spritemaps_Shaktool_ArmPiece:
    dw $0001,$81F8                                                       ;AADF71;
    db $F8                                                               ;AADF75;
    dw $2106                                                             ;AADF76;

Spritemaps_Shaktool_Head_0:
    dw $0004,$81F8                                                       ;AADF78;
    db $F8                                                               ;AADF7C;
    dw $2108,$0001                                                       ;AADF7D;
    db $F6                                                               ;AADF81;
    dw $211F,$0001                                                       ;AADF82;
    db $02                                                               ;AADF86;
    dw $211F,$01F0                                                       ;AADF87;
    db $FC                                                               ;AADF8B;
    dw $210E                                                             ;AADF8C;

Spritemaps_Shaktool_Head_1:
    dw $0004,$01F4                                                       ;AADF8E;
    db $F4                                                               ;AADF92;
    dw $210F,$81F8                                                       ;AADF93;
    db $F8                                                               ;AADF97;
    dw $610C,$0004                                                       ;AADF98;
    db $FC                                                               ;AADF9C;
    dw $211F,$01FC                                                       ;AADF9D;
    db $04                                                               ;AADFA1;
    dw $211F                                                             ;AADFA2;

Spritemaps_Shaktool_Head_2:
    dw $0004,$81F8                                                       ;AADFA4;
    db $F8                                                               ;AADFA8;
    dw $210A,$0002                                                       ;AADFA9;
    db $01                                                               ;AADFAD;
    dw $211F,$01F6                                                       ;AADFAE;
    db $01                                                               ;AADFB2;
    dw $211F,$01FC                                                       ;AADFB3;
    db $F0                                                               ;AADFB7;
    dw $211E                                                             ;AADFB8;

Spritemaps_Shaktool_Head_3:
    dw $0004,$0004                                                       ;AADFBA;
    db $F4                                                               ;AADFBE;
    dw $610F,$81F8                                                       ;AADFBF;
    db $F8                                                               ;AADFC3;
    dw $210C,$01FC                                                       ;AADFC4;
    db $04                                                               ;AADFC8;
    dw $211F,$01F4                                                       ;AADFC9;
    db $FC                                                               ;AADFCD;
    dw $211F                                                             ;AADFCE;

Spritemaps_Shaktool_Head_4:
    dw $0004,$81F8                                                       ;AADFD0;
    db $F8                                                               ;AADFD4;
    dw $6108,$01F7                                                       ;AADFD5;
    db $02                                                               ;AADFD9;
    dw $211F,$01F7                                                       ;AADFDA;
    db $F6                                                               ;AADFDE;
    dw $211F,$0008                                                       ;AADFDF;
    db $FC                                                               ;AADFE3;
    dw $610E                                                             ;AADFE4;

Spritemaps_Shaktool_Head_5:
    dw $0004,$0004                                                       ;AADFE6;
    db $04                                                               ;AADFEA;
    dw $E10F,$81F8                                                       ;AADFEB;
    db $F8                                                               ;AADFEF;
    dw $A10C,$01F4                                                       ;AADFF0;
    db $FC                                                               ;AADFF4;
    dw $211F,$01FC                                                       ;AADFF5;
    db $F4                                                               ;AADFF9;
    dw $211F                                                             ;AADFFA;

Spritemaps_Shaktool_Head_6:
    dw $0004,$81F8                                                       ;AADFFC;
    db $F8                                                               ;AAE000;
    dw $A10A,$0002                                                       ;AAE001;
    db $F7                                                               ;AAE005;
    dw $211F,$01F6                                                       ;AAE006;
    db $F7                                                               ;AAE00A;
    dw $211F,$01FC                                                       ;AAE00B;
    db $08                                                               ;AAE00F;
    dw $A11E                                                             ;AAE010;

Spritemaps_Shaktool_Head_7:
    dw $0004,$01F4                                                       ;AAE012;
    db $04                                                               ;AAE016;
    dw $A10F,$81F8                                                       ;AAE017;
    db $F8                                                               ;AAE01B;
    dw $E10C,$0004                                                       ;AAE01C;
    db $FC                                                               ;AAE020;
    dw $211F,$01FC                                                       ;AAE021;
    db $F4                                                               ;AAE025;
    dw $211F                                                             ;AAE026;

Spritemaps_Shaktool_SawHand_PrimaryPiece_0:
    dw $0001,$81F8                                                       ;AAE028;
    db $F8                                                               ;AAE02C;
    dw $6100                                                             ;AAE02D;

Spritemaps_Shaktool_SawHand_PrimaryPiece_1:
    dw $0001,$81F8                                                       ;AAE02F;
    db $F8                                                               ;AAE033;
    dw $6102                                                             ;AAE034;

Spritemaps_Shaktool_SawHand_PrimaryPiece_2:
    dw $0001,$81F8                                                       ;AAE036;
    db $F8                                                               ;AAE03A;
    dw $6104                                                             ;AAE03B;

SineCosineTables_negativeCosine:
    dw $F401,$F401,$F404,$F409,$F40F,$F418,$F422,$F42E                   ;AAE03D;
    dw $F43C,$F44B,$F45D,$F470,$F485,$F49C,$F4B4,$F4CE                   ;AAE04D;
    dw $F4EA,$F508,$F527,$F549,$F56B,$F590,$F5B6,$F5DD                   ;AAE05D;
    dw $F606,$F631,$F65D,$F68B,$F6BA,$F6EA,$F71C,$F750                   ;AAE06D;
    dw $F784,$F7BA,$F7F1,$F82A,$F864,$F89E,$F8DA,$F918                   ;AAE07D;
    dw $F956,$F995,$F9D5,$FA16,$FA58,$FA9B,$FADF,$FB24                   ;AAE08D;
    dw $FB69,$FBAF,$FBF6,$FC3D,$FC85,$FCCD,$FD16,$FD5F                   ;AAE09D;
    dw $FDA9,$FDF3,$FE3E,$FE88,$FED3,$FF1E,$FF6A,$FFB5                   ;AAE0AD;

SineCosineTables_sine:
    dw $0000,$004B,$0096,$00E1,$012D,$0178,$01C2,$020D                   ;AAE0BD;
    dw $0257,$02A1,$02EA,$0333,$037B,$03C3,$040A,$0451                   ;AAE0CD;
    dw $0497,$04DC,$0521,$0565,$05A8,$05EA,$062B,$066B                   ;AAE0DD;
    dw $06AA,$06E8,$0725,$0761,$079C,$07D6,$080F,$0846                   ;AAE0ED;
    dw $087C,$08B0,$08E4,$0916,$0946,$0975,$09A3,$09CF                   ;AAE0FD;
    dw $09FA,$0A23,$0A4A,$0A70,$0A95,$0AB7,$0AD9,$0AF8                   ;AAE10D;
    dw $0B16,$0B32,$0B4C,$0B64,$0B7B,$0B90,$0BA3,$0BB5                   ;AAE11D;
    dw $0BC4,$0BD2,$0BDE,$0BE8,$0BF1,$0BF7,$0BFC,$0BFF                   ;AAE12D;

SineCosineTables_cosine:
    dw $0BFF,$0BFF,$0BFC,$0BF7,$0BF1,$0BE8,$0BDE,$0BD2                   ;AAE13D;
    dw $0BC4,$0BB5,$0BA3,$0B90,$0B7B,$0B64,$0B4C,$0B32                   ;AAE14D;
    dw $0B16,$0AF8,$0AD9,$0AB7,$0A95,$0A70,$0A4A,$0A23                   ;AAE15D;
    dw $09FA,$09CF,$09A3,$0975,$0946,$0916,$08E4,$08B0                   ;AAE16D;
    dw $087C,$0846,$080F,$07D6,$079C,$0761,$0725,$06E8                   ;AAE17D;
    dw $06AA,$066B,$062B,$05EA,$05A8,$0565,$0521,$04DC                   ;AAE18D;
    dw $0497,$0451,$040A,$03C3,$037B,$0333,$02EA,$02A1                   ;AAE19D;
    dw $0257,$020D,$01C2,$0178,$012D,$00E1,$0096,$004B                   ;AAE1AD;

SineCosineTables_negativeSine:
    dw $0000,$FFB5,$FF6A,$FF1F,$FED3,$FE88,$FE3E,$FDF3                   ;AAE1BD;
    dw $FDA9,$FD5F,$FD16,$FCCD,$FC85,$FC3D,$FBF6,$FBAF                   ;AAE1CD;
    dw $FB69,$FB24,$FADF,$FA9B,$FA58,$FA16,$F9D5,$F995                   ;AAE1DD;
    dw $F956,$F918,$F8DB,$F89F,$F864,$F82A,$F7F1,$F7BA                   ;AAE1ED;
    dw $F784,$F750,$F71C,$F6EA,$F6BA,$F68B,$F65D,$F631                   ;AAE1FD;
    dw $F606,$F5DD,$F5B6,$F590,$F56B,$F549,$F527,$F508                   ;AAE20D;
    dw $F4EA,$F4CE,$F4B4,$F49C,$F485,$F470,$F45D,$F44B                   ;AAE21D;
    dw $F43C,$F42E,$F422,$F418,$F40F,$F409,$F404,$F401                   ;AAE22D;

SineCosineTables_negativeCosine_duplicate:
    dw $F401,$F401,$F404,$F409,$F40F,$F418,$F422,$F42E                   ;AAE23D;
    dw $F43C,$F44B,$F45D,$F470,$F485,$F49C,$F4B4,$F4CE                   ;AAE24D;
    dw $F4EA,$F508,$F527,$F549,$F56B,$F590,$F5B6,$F5DD                   ;AAE25D;
    dw $F606,$F631,$F65D,$F68B,$F6BA,$F6EA,$F71C,$F750                   ;AAE26D;
    dw $F784,$F7BA,$F7F1,$F82A,$F864,$F89E,$F8DA,$F918                   ;AAE27D;
    dw $F956,$F995,$F9D5,$FA16,$FA58,$FA9B,$FADF,$FB24                   ;AAE28D;
    dw $FB69,$FBAF,$FBF6,$FC3D,$FC85,$FCCD,$FD16,$FD5F                   ;AAE29D;
    dw $FDA9,$FDF3,$FE3E,$FE88,$FED3,$FF1E,$FF6A,$FFB5                   ;AAE2AD;

Palette_NoobTubeCrack_Initial:
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6                   ;AAE2BD;
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400                   ;AAE2CD;

Palette_NoobTubeCrack_SpritePalette1:
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6                   ;AAE2DD;
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400                   ;AAE2ED;

Palette_NoobTubeCrack_SpritePalette2:
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6                   ;AAE2FD;
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400                   ;AAE30D;

Palette_Chozo_WreckedShip_SpritePalette1:
    dw $3800,$633F,$4A9F,$2DDF,$6739,$4E73,$318C,$18C6                   ;AAE31D;
    dw $27FF,$1AF7,$0DCE,$00C6,$3FFF,$2B39,$7FFF,$0000                   ;AAE32D;

Palette_Chozo_WreckedShip_SpritePalette2:
    dw $3800,$633F,$4A9F,$2DDF,$4210,$318C,$2108,$1084                   ;AAE33D;
    dw $27FF,$1AF7,$0DCE,$00C6,$3FFF,$2B39,$5294,$0000                   ;AAE34D;

Palette_Chozo_LowerNorfair_SpritePalette1:
    dw $3800,$633F,$4A9F,$2DDF,$2F7C,$2295,$118D,$08E8                   ;AAE35D;
    dw $27FF,$1AF7,$0DCE,$00C6,$3FFF,$2B39,$73DF,$0043                   ;AAE36D;

Palette_Chozo_LowerNorfair_SpritePalette2:
    dw $3800,$633F,$4A9F,$2DDF,$2295,$118D,$08E8,$0085                   ;AAE37D;
    dw $27FF,$1AF7,$0DCE,$00C6,$3FFF,$2B39,$5294,$0001                   ;AAE38D;

InstList_Chozo_LowerNorfair_Initial:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAE39D;
    dw Function_Chozo_LowerNorfair                                       ;AAE39F;
    dw $0001                                                             ;AAE3A1;
    dw Spritemaps_Chozo_13                                               ;AAE3A3;
    dw Instruction_Common_Sleep                                          ;AAE3A5;

InstList_Chozo_LowerNorfair_Activated_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS                              ;AAE3A7;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE3A9;
    dw $0020,$0020                                                       ;AAE3AB;
    dw Spritemaps_Chozo_13                                               ;AAE3AF;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE3B1;
    dw $0022,$0008                                                       ;AAE3B3;
    dw Spritemaps_Chozo_14                                               ;AAE3B7;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE3B9;
    dw $0024,$0030                                                       ;AAE3BB;
    dw Spritemaps_Chozo_15                                               ;AAE3BF;
    dw Instruction_Chozo_PlayChozoGrabsSamusSFX                          ;AAE3C1;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE3C3;
    dw $0026,$0040                                                       ;AAE3C5;
    dw Spritemaps_Chozo_16                                               ;AAE3C9;
    dw $0006                                                             ;AAE3CB;
    dw Spritemaps_Chozo_1F                                               ;AAE3CD;
    dw $0008                                                             ;AAE3CF;
    dw Spritemaps_Chozo_20                                               ;AAE3D1;
    dw $000A                                                             ;AAE3D3;
    dw Spritemaps_Chozo_21                                               ;AAE3D5;
    dw $000C                                                             ;AAE3D7;
    dw Spritemaps_Chozo_22                                               ;AAE3D9;
    dw $0060                                                             ;AAE3DB;
    dw Spritemaps_Chozo_23                                               ;AAE3DD;
    dw Instruction_Chozo_StartLoweringAcid                               ;AAE3DF;
    dw Instruction_Common_TimerInY                                       ;AAE3E1;
    dw $0005                                                             ;AAE3E3;

InstList_Chozo_LowerNorfair_Activated_1:
    dw $000B                                                             ;AAE3E5;
    dw Spritemaps_Chozo_20                                               ;AAE3E7;
    dw $0008                                                             ;AAE3E9;
    dw Spritemaps_Chozo_21                                               ;AAE3EB;
    dw $0006                                                             ;AAE3ED;
    dw Spritemaps_Chozo_22                                               ;AAE3EF;
    dw $0008                                                             ;AAE3F1;
    dw Spritemaps_Chozo_23                                               ;AAE3F3;
    dw $0006                                                             ;AAE3F5;
    dw Spritemaps_Chozo_22                                               ;AAE3F7;
    dw $0008                                                             ;AAE3F9;
    dw Spritemaps_Chozo_21                                               ;AAE3FB;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAE3FD;
    dw InstList_Chozo_LowerNorfair_Activated_1                           ;AAE3FF;
    dw Instruction_Common_SetEnemy0FB2ToRTS                              ;AAE401;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE403;
    dw $0026,$0080                                                       ;AAE405;
    dw Spritemaps_Chozo_16                                               ;AAE409;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE40B;
    dw $0024,$0050                                                       ;AAE40D;
    dw Spritemaps_Chozo_15                                               ;AAE411;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE413;
    dw $0022,$0008                                                       ;AAE415;
    dw Spritemaps_Chozo_14                                               ;AAE419;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE41B;
    dw $0020,$0020                                                       ;AAE41D;
    dw Spritemaps_Chozo_13                                               ;AAE421;
    dw Instruction_Chozo_UnlockSamus                                     ;AAE423;
    dw Instruction_Chozo_SetLoweredAcidPosition                          ;AAE425;
    dw Instruction_Common_Sleep                                          ;AAE427;

Instruction_Chozo_StartLoweringAcid:
    LDA.W #$0020                                                         ;AAE429;
    STA.W $1980                                                          ;AAE42C;
    LDA.W #$0040                                                         ;AAE42F;
    STA.W $197C                                                          ;AAE432;
    RTL                                                                  ;AAE435;


Instruction_Chozo_SetLoweredAcidPosition:
    LDA.W #$02D2                                                         ;AAE436;
    STA.W $1978                                                          ;AAE439;
    RTL                                                                  ;AAE43C;


Instruction_Chozo_UnlockSamus:
    LDA.W #$0001                                                         ;AAE43D;
    JSL.L Run_Samus_Command                                              ;AAE440;
    RTL                                                                  ;AAE444;


Function_Chozo_LowerNorfair:
    LDA.W EnemyData.initParam0,X                                         ;AAE445;
    BEQ .return                                                          ;AAE448;
    LDA.W #InstList_Chozo_LowerNorfair_Activated_0                       ;AAE44A;
    STA.W EnemyData.pInstList,X                                          ;AAE44D;
    LDA.W #$0001                                                         ;AAE450;
    STA.W EnemyData.instTimer,X                                          ;AAE453;

.return:
    RTS                                                                  ;AAE456;


InstList_Chozo_WreckedShip_Initial:
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAE457;
    dw Function_Chozo_WreckedShip                                        ;AAE459;
    dw $0001                                                             ;AAE45B;
    dw Spritemaps_Chozo_0                                                ;AAE45D;
    dw Instruction_Common_Sleep                                          ;AAE45F;

InstList_Chozo_WreckedShip_Activated_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS                              ;AAE461;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE463;
    dw $0000,$0020                                                       ;AAE465;
    dw Spritemaps_Chozo_0                                                ;AAE469;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE46B;
    dw $0002,$0008                                                       ;AAE46D;
    dw Spritemaps_Chozo_1                                                ;AAE471;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE473;
    dw $0004,$0050                                                       ;AAE475;
    dw Spritemaps_Chozo_2                                                ;AAE479;
    dw Instruction_Chozo_PlayChozoGrabsSamusSFX                          ;AAE47B;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE47D;
    dw $0006,$0080                                                       ;AAE47F;
    dw Spritemaps_Chozo_3                                                ;AAE483;
    dw $0006                                                             ;AAE485;
    dw Spritemaps_Chozo_C                                                ;AAE487;
    dw $0008                                                             ;AAE489;
    dw Spritemaps_Chozo_D                                                ;AAE48B;
    dw $000A                                                             ;AAE48D;
    dw Spritemaps_Chozo_E                                                ;AAE48F;
    dw $000C                                                             ;AAE491;
    dw Spritemaps_Chozo_F                                                ;AAE493;
    dw $0080                                                             ;AAE495;
    dw Spritemaps_Chozo_10                                               ;AAE497;
    dw Instruction_Common_TimerInY                                       ;AAE499;
    dw $0004                                                             ;AAE49B;

InstList_Chozo_WreckedShip_Activated_1:
    dw $000B                                                             ;AAE49D;
    dw Spritemaps_Chozo_D                                                ;AAE49F;
    dw $0008                                                             ;AAE4A1;
    dw Spritemaps_Chozo_E                                                ;AAE4A3;
    dw $0006                                                             ;AAE4A5;
    dw Spritemaps_Chozo_F                                                ;AAE4A7;
    dw $0008                                                             ;AAE4A9;
    dw Spritemaps_Chozo_10                                               ;AAE4AB;
    dw $0006                                                             ;AAE4AD;
    dw Spritemaps_Chozo_F                                                ;AAE4AF;
    dw $0008                                                             ;AAE4B1;
    dw Spritemaps_Chozo_E                                                ;AAE4B3;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAE4B5;
    dw InstList_Chozo_WreckedShip_Activated_1                            ;AAE4B7;
    dw Instruction_Common_Enemy0FB2_InY                                  ;AAE4B9;
    dw RTS_AAE7DA                                                        ;AAE4BB;
    dw Instruction_Common_TimerInY                                       ;AAE4BD;
    dw $0010                                                             ;AAE4BF;

InstList_Chozo_WreckedShip_Activated_2:
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE4C1;
    dw $0016                                                             ;AAE4C3;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE4C5;
    dw $FFF8,$0008                                                       ;AAE4C7;
    dw Spritemaps_Chozo_B                                                ;AAE4CB;
    dw Instruction_Chozo_PlayChozoFootstepsSFX                           ;AAE4CD;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE4CF;
    dw $0008                                                             ;AAE4D1;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE4D3;
    dw $FFEC,$000B                                                       ;AAE4D5;
    dw Spritemaps_Chozo_4                                                ;AAE4D9;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE4DB;
    dw $000A                                                             ;AAE4DD;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE4DF;
    dw $FFF0,$0008                                                       ;AAE4E1;
    dw Spritemaps_Chozo_5                                                ;AAE4E5;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE4E7;
    dw $000C                                                             ;AAE4E9;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE4EB;
    dw $0000,$0006                                                       ;AAE4ED;
    dw Spritemaps_Chozo_6                                                ;AAE4F1;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE4F3;
    dw $000E                                                             ;AAE4F5;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE4F7;
    dw $FFF8,$0008                                                       ;AAE4F9;
    dw Spritemaps_Chozo_7                                                ;AAE4FD;
    dw Instruction_Chozo_PlayChozoFootstepsSFX                           ;AAE4FF;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE501;
    dw $0010                                                             ;AAE503;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE505;
    dw $FFEC,$000B                                                       ;AAE507;
    dw Spritemaps_Chozo_8                                                ;AAE50B;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE50D;
    dw $0012                                                             ;AAE50F;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE511;
    dw $FFF0,$0008                                                       ;AAE513;
    dw Spritemaps_Chozo_9                                                ;AAE517;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE519;
    dw $0014                                                             ;AAE51B;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE51D;
    dw $0000,$0006                                                       ;AAE51F;
    dw Spritemaps_Chozo_A                                                ;AAE523;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;AAE525;
    dw InstList_Chozo_WreckedShip_Activated_2                            ;AAE527;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE529;
    dw $0016                                                             ;AAE52B;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE52D;
    dw $FFF8,$0008                                                       ;AAE52F;
    dw Spritemaps_Chozo_B                                                ;AAE533;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE535;
    dw $0008                                                             ;AAE537;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE539;
    dw $FFEC,$000B                                                       ;AAE53B;
    dw Spritemaps_Chozo_4                                                ;AAE53F;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE541;
    dw $000A                                                             ;AAE543;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE545;
    dw $FFF0,$0008                                                       ;AAE547;
    dw Spritemaps_Chozo_5                                                ;AAE54B;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE54D;
    dw $000C                                                             ;AAE54F;
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile       ;AAE551;
    dw $0000,$0006                                                       ;AAE553;
    dw Spritemaps_Chozo_6                                                ;AAE557;
    dw Instruction_Common_SetEnemy0FB2ToRTS                              ;AAE559;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE55B;
    dw $0006,$0080                                                       ;AAE55D;
    dw Spritemaps_Chozo_3                                                ;AAE561;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE563;
    dw $0004,$0050                                                       ;AAE565;
    dw Spritemaps_Chozo_2                                                ;AAE569;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE56B;
    dw $0002,$0008                                                       ;AAE56D;
    dw Spritemaps_Chozo_1                                                ;AAE571;
    dw Instruction_Chozo_Movement_IndexInY                               ;AAE573;
    dw $0000,$0020                                                       ;AAE575;
    dw Spritemaps_Chozo_0                                                ;AAE579;
    dw Instruction_Chozo_ReleaseSamus_BlockSlopeAccess                   ;AAE57B;
    dw Instruction_Common_Sleep                                          ;AAE57D;

Instruction_Chozo_PlayChozoGrabsSamusSFX:
    LDA.W #$001C                                                         ;AAE57F;
    JSL.L QueueSound_Lib2_Max6                                           ;AAE582;
    RTL                                                                  ;AAE586;


Instruction_Chozo_PlayChozoFootstepsSFX:
    LDA.W #$004B                                                         ;AAE587;
    JSL.L QueueSound_Lib2_Max6                                           ;AAE58A;
    RTL                                                                  ;AAE58E;


Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile:
    PHX                                                                  ;AAE58F;
    PHY                                                                  ;AAE590;
    LDA.W EnemyData.xPosition,X                                          ;AAE591;
    CLC                                                                  ;AAE594;
    ADC.W $0000,Y                                                        ;AAE595;
    PHA                                                                  ;AAE598;
    LDA.W EnemyData.yPosition,X                                          ;AAE599;
    CLC                                                                  ;AAE59C;
    ADC.W #$001C                                                         ;AAE59D;
    PHA                                                                  ;AAE5A0;
    JSL.L CalculateTheBlockContainingAPixelPosition                      ;AAE5A1;
    LDA.W $0DC4                                                          ;AAE5A5;
    CLC                                                                  ;AAE5A8;
    ADC.W $07A5                                                          ;AAE5A9;
    ASL A                                                                ;AAE5AC;
    TAX                                                                  ;AAE5AD;
    LDA.L $7F0002,X                                                      ;AAE5AE;
    AND.W #$F000                                                         ;AAE5B2;
    CMP.W #$A000                                                         ;AAE5B5;
    BNE .return                                                          ;AAE5B8;
    TXA                                                                  ;AAE5BA;
    SEC                                                                  ;AAE5BB;
    SBC.W $07A5                                                          ;AAE5BC;
    TAX                                                                  ;AAE5BF;
    LDA.W #PLMEntries_CrumbleLowerNorfairChozoRoomPlug                   ;AAE5C0;
    JSL.L Spawn_PLM_to_CurrentBlockIndex                                 ;AAE5C3;
    PLY                                                                  ;AAE5C7;
    PHY                                                                  ;AAE5C8;
    LDA.W $0000,Y                                                        ;AAE5C9;
    LDY.W #EnemyProjectile_WreckedShipChozoSpikeClearingFootsteps        ;AAE5CC;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;AAE5CF;

.return:
    PLY                                                                  ;AAE5D3;
    PLX                                                                  ;AAE5D4;
    INY                                                                  ;AAE5D5;
    INY                                                                  ;AAE5D6;
    RTL                                                                  ;AAE5D7;


Instruction_Chozo_Movement_IndexInY:
    LDA.W $0000,Y                                                        ;AAE5D8;
    STA.W EnemyData.work2,X                                              ;AAE5DB;
    PHY                                                                  ;AAE5DE;
    STZ.B $12                                                            ;AAE5DF;
    STZ.B $14                                                            ;AAE5E1;
    LDY.W EnemyData.work2,X                                              ;AAE5E3;
    LDA.W .XVelocity,Y                                                   ;AAE5E6;
    BPL +                                                                ;AAE5E9;
    DEC.B $14                                                            ;AAE5EB;

  + STA.B $13                                                            ;AAE5ED;
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes                            ;AAE5EF;
    BCS .goingNowhere                                                    ;AAE5F3; >_<

.goingNowhere:
    STZ.B $12                                                            ;AAE5F5;
    STZ.B $14                                                            ;AAE5F7;
    LDY.W EnemyData.work2,X                                              ;AAE5F9;
    LDA.W .XVelocity,Y                                                   ;AAE5FC;
    BPL +                                                                ;AAE5FF;
    EOR.W #$FFFF                                                         ;AAE601;
    INC A                                                                ;AAE604;

  + BPL +                                                                ;AAE605;
    DEC.B $14                                                            ;AAE607;

  + STA.B $13                                                            ;AAE609;
    JSL.L MoveEnemyDownBy_14_12                                          ;AAE60B;
    BCS .move                                                            ;AAE60F;

.move:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope                          ;AAE611;
    LDY.W EnemyData.work2,X                                              ;AAE615;
    LDA.W EnemyData.xPosition,X                                          ;AAE618;
    CLC                                                                  ;AAE61B;
    ADC.W .XOffsets,Y                                                    ;AAE61C;
    STA.W $0AF6                                                          ;AAE61F;
    LDA.W EnemyData.yPosition,X                                          ;AAE622;
    CLC                                                                  ;AAE625;
    ADC.W .YOffsets,Y                                                    ;AAE626;
    STA.W $0AFA                                                          ;AAE629;
    PLY                                                                  ;AAE62C;
    INY                                                                  ;AAE62D;
    INY                                                                  ;AAE62E;
    RTL                                                                  ;AAE62F;


.XVelocity:
    dw $0000,$0000,$0000,$0000,$FE00,$FD00,$F200,$F800                   ;AAE630;
    dw $FE00,$FD00,$F200,$F800,$0000,$0000,$0000,$0000                   ;AAE640;
    dw $0000,$0000,$0000,$0000,$0200,$0300,$0E00,$0800                   ;AAE650;
    dw $0200,$0300,$0E00,$0800,$0000,$0000,$0000,$0000                   ;AAE660;

.XOffsets:
    dw $FFE4,$FFE2,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0                   ;AAE670;
    dw $FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0                   ;AAE680;
    dw $001C,$001E,$0020,$0020,$0020,$0020,$0020,$0020                   ;AAE690;
    dw $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020                   ;AAE6A0;

.YOffsets:
    dw $FFE0,$FFE7,$FFE9,$FFE9,$FFE9,$FFE8,$FFE7,$FFE8                   ;AAE6B0;
    dw $FFE9,$FFE8,$FFE7,$FFE8,$FFE9,$FFE9,$FFE9,$FFE9                   ;AAE6C0;
    dw $FFE0,$FFE7,$FFE9,$FFE9,$FFE9,$FFE8,$FFE7,$FFE8                   ;AAE6D0;
    dw $FFE9,$FFE8,$FFE7,$FFE8,$FFE9,$FFE9,$FFE9,$FFE9                   ;AAE6E0;

Instruction_Chozo_ReleaseSamus_BlockSlopeAccess:
    LDA.W #$0001                                                         ;AAE6F0;
    JSL.L Run_Samus_Command                                              ;AAE6F3;
    LDA.W #$0000                                                         ;AAE6F7;
    STA.L $7ECD26                                                        ;AAE6FA;
    STA.L $7ECD28                                                        ;AAE6FE;
    STA.L $7ECD29                                                        ;AAE702;
    LDA.W #$0001                                                         ;AAE706;
    STA.L $7ECD2D                                                        ;AAE709;
    JSL.L Spawn_Hardcoded_PLM                                            ;AAE70D;
    db $17,$1D                                                           ;AAE711;
    dw PLMEntries_BlockSlopeAccessForWreckedShipChozo                    ;AAE713;
    RTL                                                                  ;AAE715;


InitAI_NoobTubeCrack:
    LDX.W #$003E                                                         ;AAE716;

.loop:
    LDA.W Palette_NoobTubeCrack_SpritePalette1,X                         ;AAE719;
    STA.L $7EC320,X                                                      ;AAE71C;
    DEX                                                                  ;AAE720;
    DEX                                                                  ;AAE721;
    BPL .loop                                                            ;AAE722;
    RTL                                                                  ;AAE724;


InitAI_Chozo:
    LDX.W $0E54                                                          ;AAE725;
    LDA.W EnemyData.properties,X                                         ;AAE728;
    ORA.W #$A800                                                         ;AAE72B;
    STA.W EnemyData.properties,X                                         ;AAE72E;
    LDA.W #Spritemap_CommonAA_Nothing                                    ;AAE731;
    STA.W EnemyData.pSpritemap,X                                         ;AAE734;
    LDA.W #$0001                                                         ;AAE737;
    STA.W EnemyData.instTimer,X                                          ;AAE73A;
    STZ.W EnemyData.loopCounter,X                                        ;AAE73D;
    LDA.W #RTS_AAE7A6                                                    ;AAE740;
    STA.W EnemyData.work5,X                                              ;AAE743;
    LDA.W #$0000                                                         ;AAE746;
    STA.W EnemyData.initParam0,X                                         ;AAE749;
    STZ.W EnemyData.palette,X                                            ;AAE74C;
    STZ.W $0F9A                                                          ;AAE74F;
    LDY.W EnemyData.initParam1,X                                         ;AAE752;
    LDA.W .instListPointers,Y                                            ;AAE755;
    STA.W EnemyData.pInstList,X                                          ;AAE758;
    TYA                                                                  ;AAE75B;
    BNE .lowerNorfair                                                    ;AAE75C;
    LDX.W #$001E                                                         ;AAE75E;

.loopWreckedShip:
    LDA.W Palette_Chozo_WreckedShip_SpritePalette2,X                     ;AAE761;
    STA.L $7EC340,X                                                      ;AAE764;
    LDA.W Palette_Chozo_WreckedShip_SpritePalette1,X                     ;AAE768;
    STA.L $7EC320,X                                                      ;AAE76B;
    DEX                                                                  ;AAE76F;
    DEX                                                                  ;AAE770;
    BPL .loopWreckedShip                                                 ;AAE771;
    JSL.L Spawn_Hardcoded_PLM                                            ;AAE773;
    db $4A,$17                                                           ;AAE777;
    dw PLMEntries_WreckedShipChozoHand                                   ;AAE779;
    JSL.L Spawn_Hardcoded_PLM                                            ;AAE77B;
    db $17,$1D                                                           ;AAE77F;
    dw PLMEntries_BlockSlopeAccessForWreckedShipChozo                    ;AAE781;
    RTL                                                                  ;AAE783;


.lowerNorfair:
    LDX.W #$001E                                                         ;AAE784;

.loop:
    LDA.W Palette_Chozo_LowerNorfair_SpritePalette2,X                    ;AAE787;
    STA.L $7EC340,X                                                      ;AAE78A;
    LDA.W Palette_Chozo_LowerNorfair_SpritePalette1,X                    ;AAE78E;
    STA.L $7EC320,X                                                      ;AAE791;
    DEX                                                                  ;AAE795;
    DEX                                                                  ;AAE796;
    BPL .loop                                                            ;AAE797;
    JSL.L Spawn_Hardcoded_PLM                                            ;AAE799;
    db $0C,$1D                                                           ;AAE79D;
    dw PLMEntries_LowerNorfairChozoHand                                  ;AAE79F;
    RTL                                                                  ;AAE7A1;


.instListPointers:
    dw InstList_Chozo_WreckedShip_Initial                                ;AAE7A2;
    dw InstList_Chozo_LowerNorfair_Initial                               ;AAE7A4;

RTS_AAE7A6:
    RTS                                                                  ;AAE7A6;


MainAI_Chozo:
    LDX.W $0E54                                                          ;AAE7A7;
    JSR.W ($0FB2,X)                                                      ;AAE7AA;
    RTL                                                                  ;AAE7AD;


Function_Chozo_WreckedShip:
    PHX                                                                  ;AAE7AE;
    LDX.W $079F                                                          ;AAE7AF;
    LDA.L $7ED828,X                                                      ;AAE7B2;
    PLX                                                                  ;AAE7B6;
    AND.W #$0001                                                         ;AAE7B7;
    BEQ .return                                                          ;AAE7BA;
    LDA.W EnemyData.initParam0,X                                         ;AAE7BC;
    BEQ .return                                                          ;AAE7BF;
    LDA.W #InstList_Chozo_WreckedShip_Activated_0                        ;AAE7C1;
    STA.W EnemyData.pInstList,X                                          ;AAE7C4;
    LDA.W #$0001                                                         ;AAE7C7;
    STA.W EnemyData.instTimer,X                                          ;AAE7CA;
    LDA.W #$FF00                                                         ;AAE7CD;
    STA.W EnemyData.work0,X                                              ;AAE7D0;
    LDA.W #$0100                                                         ;AAE7D3;
    STA.W EnemyData.work1,X                                              ;AAE7D6;

.return:
    RTS                                                                  ;AAE7D9;


RTS_AAE7DA:
    RTS                                                                  ;AAE7DA;


RTL_AAE7DB:
    RTL                                                                  ;AAE7DB;


RTL_AAE7DC:
    RTL                                                                  ;AAE7DC;


Spritemaps_Chozo_0:
    dw $0012,$01FA                                                       ;AAE7DD;
    db $DF                                                               ;AAE7E1;
    dw $237D,$C3D6                                                       ;AAE7E2;
    db $E7                                                               ;AAE7E6;
    dw $2320,$01E6                                                       ;AAE7E7;
    db $E7                                                               ;AAE7EB;
    dw $230F,$C3E6                                                       ;AAE7EC;
    db $EF                                                               ;AAE7F0;
    dw $2322,$C3ED                                                       ;AAE7F1;
    db $EC                                                               ;AAE7F5;
    dw $230D,$C3F5                                                       ;AAE7F6;
    db $E4                                                               ;AAE7FA;
    dw $230B,$C3F2                                                       ;AAE7FB;
    db $1F                                                               ;AAE7FF;
    dw $2370,$C3FA                                                       ;AAE800;
    db $1F                                                               ;AAE804;
    dw $2371,$C3FA                                                       ;AAE805;
    db $0D                                                               ;AAE809;
    dw $234C,$C3FA                                                       ;AAE80A;
    db $15                                                               ;AAE80E;
    dw $235C,$C3F9                                                       ;AAE80F;
    db $05                                                               ;AAE813;
    dw $2350,$C3F9                                                       ;AAE814;
    db $FD                                                               ;AAE818;
    dw $2340,$C3F4                                                       ;AAE819;
    db $F7                                                               ;AAE81D;
    dw $2308,$C3FC                                                       ;AAE81E;
    db $F7                                                               ;AAE822;
    dw $2309,$C3FC                                                       ;AAE823;
    db $E7                                                               ;AAE827;
    dw $2306,$C3EC                                                       ;AAE828;
    db $E7                                                               ;AAE82C;
    dw $2304,$C3FC                                                       ;AAE82D;
    db $D7                                                               ;AAE831;
    dw $2302,$C3EC                                                       ;AAE832;
    db $D7                                                               ;AAE836;
    dw $2300                                                             ;AAE837;

Spritemaps_Chozo_1:
    dw $0011,$01FA                                                       ;AAE839;
    db $DF                                                               ;AAE83D;
    dw $237D,$C3E9                                                       ;AAE83E;
    db $ED                                                               ;AAE842;
    dw $232A,$C3D9                                                       ;AAE843;
    db $ED                                                               ;AAE847;
    dw $2328,$C3ED                                                       ;AAE848;
    db $EC                                                               ;AAE84C;
    dw $230D,$C3F5                                                       ;AAE84D;
    db $E4                                                               ;AAE851;
    dw $230B,$C3F2                                                       ;AAE852;
    db $1F                                                               ;AAE856;
    dw $2370,$C3FA                                                       ;AAE857;
    db $1F                                                               ;AAE85B;
    dw $2371,$C3FA                                                       ;AAE85C;
    db $0D                                                               ;AAE860;
    dw $234C,$C3FA                                                       ;AAE861;
    db $15                                                               ;AAE865;
    dw $235C,$C3F9                                                       ;AAE866;
    db $05                                                               ;AAE86A;
    dw $2350,$C3F9                                                       ;AAE86B;
    db $FD                                                               ;AAE86F;
    dw $2340,$C3F4                                                       ;AAE870;
    db $F7                                                               ;AAE874;
    dw $2308,$C3FC                                                       ;AAE875;
    db $F7                                                               ;AAE879;
    dw $2309,$C3FC                                                       ;AAE87A;
    db $E7                                                               ;AAE87E;
    dw $2306,$C3EC                                                       ;AAE87F;
    db $E7                                                               ;AAE883;
    dw $2304,$C3FC                                                       ;AAE884;
    db $D7                                                               ;AAE888;
    dw $2302,$C3EC                                                       ;AAE889;
    db $D7                                                               ;AAE88D;
    dw $2300                                                             ;AAE88E;

Spritemaps_Chozo_2:
    dw $0011,$C3E8                                                       ;AAE890;
    db $ED                                                               ;AAE894;
    dw $2326,$C3D8                                                       ;AAE895;
    db $ED                                                               ;AAE899;
    dw $2324,$01FA                                                       ;AAE89A;
    db $DF                                                               ;AAE89E;
    dw $237D,$C3ED                                                       ;AAE89F;
    db $EC                                                               ;AAE8A3;
    dw $230D,$C3F5                                                       ;AAE8A4;
    db $E4                                                               ;AAE8A8;
    dw $230B,$C3F2                                                       ;AAE8A9;
    db $1F                                                               ;AAE8AD;
    dw $2370,$C3FA                                                       ;AAE8AE;
    db $1F                                                               ;AAE8B2;
    dw $2371,$C3FA                                                       ;AAE8B3;
    db $0D                                                               ;AAE8B7;
    dw $234C,$C3FA                                                       ;AAE8B8;
    db $15                                                               ;AAE8BC;
    dw $235C,$C3F9                                                       ;AAE8BD;
    db $05                                                               ;AAE8C1;
    dw $2350,$C3F9                                                       ;AAE8C2;
    db $FD                                                               ;AAE8C6;
    dw $2340,$C3F4                                                       ;AAE8C7;
    db $F7                                                               ;AAE8CB;
    dw $2308,$C3FC                                                       ;AAE8CC;
    db $F7                                                               ;AAE8D0;
    dw $2309,$C3FC                                                       ;AAE8D1;
    db $E7                                                               ;AAE8D5;
    dw $2306,$C3EC                                                       ;AAE8D6;
    db $E7                                                               ;AAE8DA;
    dw $2304,$C3FC                                                       ;AAE8DB;
    db $D7                                                               ;AAE8DF;
    dw $2302,$C3EC                                                       ;AAE8E0;
    db $D7                                                               ;AAE8E4;
    dw $2300                                                             ;AAE8E5;

Spritemaps_Chozo_3:
    dw $0012,$C3E8                                                       ;AAE8E7;
    db $ED                                                               ;AAE8EB;
    dw $2326,$C3D8                                                       ;AAE8EC;
    db $E9                                                               ;AAE8F0;
    dw $232C,$01E0                                                       ;AAE8F1;
    db $F9                                                               ;AAE8F5;
    dw $231F,$01FA                                                       ;AAE8F6;
    db $DF                                                               ;AAE8FA;
    dw $237D,$C3ED                                                       ;AAE8FB;
    db $EC                                                               ;AAE8FF;
    dw $230D,$C3F5                                                       ;AAE900;
    db $E4                                                               ;AAE904;
    dw $230B,$C3F2                                                       ;AAE905;
    db $1F                                                               ;AAE909;
    dw $2370,$C3FA                                                       ;AAE90A;
    db $1F                                                               ;AAE90E;
    dw $2371,$C3FA                                                       ;AAE90F;
    db $0D                                                               ;AAE913;
    dw $234C,$C3FA                                                       ;AAE914;
    db $15                                                               ;AAE918;
    dw $235C,$C3F9                                                       ;AAE919;
    db $05                                                               ;AAE91D;
    dw $2350,$C3F9                                                       ;AAE91E;
    db $FD                                                               ;AAE922;
    dw $2340,$C3F4                                                       ;AAE923;
    db $F7                                                               ;AAE927;
    dw $2308,$C3FC                                                       ;AAE928;
    db $F7                                                               ;AAE92C;
    dw $2309,$C3FC                                                       ;AAE92D;
    db $E7                                                               ;AAE931;
    dw $2306,$C3EC                                                       ;AAE932;
    db $E7                                                               ;AAE936;
    dw $2304,$C3FC                                                       ;AAE937;
    db $D7                                                               ;AAE93B;
    dw $2302,$C3EC                                                       ;AAE93C;
    db $D7                                                               ;AAE940;
    dw $2300                                                             ;AAE941;

Spritemaps_Chozo_4:
    dw $0015,$01E0                                                       ;AAE943;
    db $F9                                                               ;AAE947;
    dw $231F,$C3E8                                                       ;AAE948;
    db $ED                                                               ;AAE94C;
    dw $2326,$01FA                                                       ;AAE94D;
    db $DF                                                               ;AAE951;
    dw $2379,$C3E9                                                       ;AAE952;
    db $1B                                                               ;AAE956;
    dw $2371,$C3E1                                                       ;AAE957;
    db $1B                                                               ;AAE95B;
    dw $2370,$C3EE                                                       ;AAE95C;
    db $10                                                               ;AAE960;
    dw $2358,$C3EE                                                       ;AAE961;
    db $08                                                               ;AAE965;
    dw $2348,$C3F4                                                       ;AAE966;
    db $FD                                                               ;AAE96A;
    dw $2344,$C3F4                                                       ;AAE96B;
    db $F7                                                               ;AAE96F;
    dw $2308,$C3FC                                                       ;AAE970;
    db $F7                                                               ;AAE974;
    dw $2309,$C210                                                       ;AAE975;
    db $15                                                               ;AAE979;
    dw $2575,$C204                                                       ;AAE97A;
    db $09                                                               ;AAE97E;
    dw $254E,$C3FB                                                       ;AAE97F;
    db $FD                                                               ;AAE983;
    dw $6542,$C3FB                                                       ;AAE984;
    db $05                                                               ;AAE988;
    dw $6552,$C3D8                                                       ;AAE989;
    db $E9                                                               ;AAE98D;
    dw $232C,$C3ED                                                       ;AAE98E;
    db $EC                                                               ;AAE992;
    dw $230D,$C3F5                                                       ;AAE993;
    db $E4                                                               ;AAE997;
    dw $230B,$C3FC                                                       ;AAE998;
    db $E7                                                               ;AAE99C;
    dw $2306,$C3EC                                                       ;AAE99D;
    db $E7                                                               ;AAE9A1;
    dw $2304,$C3FC                                                       ;AAE9A2;
    db $D7                                                               ;AAE9A6;
    dw $2302,$C3EC                                                       ;AAE9A7;
    db $D7                                                               ;AAE9AB;
    dw $2300                                                             ;AAE9AC;

Spritemaps_Chozo_5:
    dw $0016,$01E0                                                       ;AAE9AE;
    db $F8                                                               ;AAE9B2;
    dw $231F,$C3E8                                                       ;AAE9B3;
    db $EC                                                               ;AAE9B7;
    dw $2326,$01FA                                                       ;AAE9B8;
    db $DE                                                               ;AAE9BC;
    dw $237A,$C3EC                                                       ;AAE9BD;
    db $1C                                                               ;AAE9C1;
    dw $2371,$C3E4                                                       ;AAE9C2;
    db $1C                                                               ;AAE9C6;
    dw $2370,$C3F1                                                       ;AAE9C7;
    db $11                                                               ;AAE9CB;
    dw $2358,$C3F1                                                       ;AAE9CC;
    db $09                                                               ;AAE9D0;
    dw $2348,$C3F7                                                       ;AAE9D1;
    db $04                                                               ;AAE9D5;
    dw $2352,$C3F7                                                       ;AAE9D6;
    db $FC                                                               ;AAE9DA;
    dw $2342,$C3F4                                                       ;AAE9DB;
    db $F6                                                               ;AAE9DF;
    dw $2308,$C3FC                                                       ;AAE9E0;
    db $F6                                                               ;AAE9E4;
    dw $2309,$C209                                                       ;AAE9E5;
    db $16                                                               ;AAE9E9;
    dw $2575,$C3FC                                                       ;AAE9EA;
    db $09                                                               ;AAE9EE;
    dw $254E,$C3F9                                                       ;AAE9EF;
    db $04                                                               ;AAE9F3;
    dw $2550,$C3F9                                                       ;AAE9F4;
    db $FC                                                               ;AAE9F8;
    dw $2540,$C3D8                                                       ;AAE9F9;
    db $E8                                                               ;AAE9FD;
    dw $232C,$C3ED                                                       ;AAE9FE;
    db $EB                                                               ;AAEA02;
    dw $230D,$C3F5                                                       ;AAEA03;
    db $E3                                                               ;AAEA07;
    dw $230B,$C3FC                                                       ;AAEA08;
    db $E6                                                               ;AAEA0C;
    dw $2306,$C3EC                                                       ;AAEA0D;
    db $E6                                                               ;AAEA11;
    dw $2304,$C3FC                                                       ;AAEA12;
    db $D6                                                               ;AAEA16;
    dw $2302,$C3EC                                                       ;AAEA17;
    db $D6                                                               ;AAEA1B;
    dw $2300                                                             ;AAEA1C;

Spritemaps_Chozo_6:
    dw $0016,$C3E8                                                       ;AAEA1E;
    db $EB                                                               ;AAEA22;
    dw $2326,$01E0                                                       ;AAEA23;
    db $F7                                                               ;AAEA27;
    dw $231F,$01FA                                                       ;AAEA28;
    db $DD                                                               ;AAEA2C;
    dw $237B,$C3FA                                                       ;AAEA2D;
    db $1E                                                               ;AAEA31;
    dw $2371,$C3F2                                                       ;AAEA32;
    db $1E                                                               ;AAEA36;
    dw $2370,$C3FA                                                       ;AAEA37;
    db $13                                                               ;AAEA3B;
    dw $235C,$C3FA                                                       ;AAEA3C;
    db $0B                                                               ;AAEA40;
    dw $234C,$C3FD                                                       ;AAEA41;
    db $17                                                               ;AAEA45;
    dw $2573,$C3F9                                                       ;AAEA46;
    db $03                                                               ;AAEA4A;
    dw $2350,$C3F9                                                       ;AAEA4B;
    db $FB                                                               ;AAEA4F;
    dw $2340,$C3FA                                                       ;AAEA50;
    db $08                                                               ;AAEA54;
    dw $254E,$C3F4                                                       ;AAEA55;
    db $F5                                                               ;AAEA59;
    dw $2308,$C3FC                                                       ;AAEA5A;
    db $F5                                                               ;AAEA5E;
    dw $2309,$C3F7                                                       ;AAEA5F;
    db $03                                                               ;AAEA63;
    dw $2552,$C3F7                                                       ;AAEA64;
    db $FB                                                               ;AAEA68;
    dw $2542,$C3D8                                                       ;AAEA69;
    db $E7                                                               ;AAEA6D;
    dw $232C,$C3ED                                                       ;AAEA6E;
    db $EA                                                               ;AAEA72;
    dw $230D,$C3F5                                                       ;AAEA73;
    db $E2                                                               ;AAEA77;
    dw $230B,$C3FC                                                       ;AAEA78;
    db $E5                                                               ;AAEA7C;
    dw $2306,$C3EC                                                       ;AAEA7D;
    db $E5                                                               ;AAEA81;
    dw $2304,$C3FC                                                       ;AAEA82;
    db $D5                                                               ;AAEA86;
    dw $2302,$C3EC                                                       ;AAEA87;
    db $D5                                                               ;AAEA8B;
    dw $2300                                                             ;AAEA8C;

Spritemaps_Chozo_7:
    dw $0016,$01E0                                                       ;AAEA8E;
    db $F8                                                               ;AAEA92;
    dw $231F,$C3E8                                                       ;AAEA93;
    db $EC                                                               ;AAEA97;
    dw $2326,$01FA                                                       ;AAEA98;
    db $DE                                                               ;AAEA9C;
    dw $237C,$C201                                                       ;AAEA9D;
    db $1D                                                               ;AAEAA1;
    dw $2371,$C3F9                                                       ;AAEAA2;
    db $1D                                                               ;AAEAA6;
    dw $2370,$C201                                                       ;AAEAA7;
    db $12                                                               ;AAEAAB;
    dw $2356,$C201                                                       ;AAEAAC;
    db $0A                                                               ;AAEAB0;
    dw $2346,$C3FB                                                       ;AAEAB1;
    db $04                                                               ;AAEAB5;
    dw $6352,$C3FB                                                       ;AAEAB6;
    db $FC                                                               ;AAEABA;
    dw $6342,$C3F2                                                       ;AAEABB;
    db $1B                                                               ;AAEABF;
    dw $2573,$C3F3                                                       ;AAEAC0;
    db $10                                                               ;AAEAC4;
    dw $2556,$C3F3                                                       ;AAEAC5;
    db $08                                                               ;AAEAC9;
    dw $2546,$C3F4                                                       ;AAEACA;
    db $F6                                                               ;AAEACE;
    dw $2308,$C3FC                                                       ;AAEACF;
    db $F6                                                               ;AAEAD3;
    dw $2309,$C3F4                                                       ;AAEAD4;
    db $FC                                                               ;AAEAD8;
    dw $2544,$C3D8                                                       ;AAEAD9;
    db $E8                                                               ;AAEADD;
    dw $232C,$C3ED                                                       ;AAEADE;
    db $EB                                                               ;AAEAE2;
    dw $230D,$C3F5                                                       ;AAEAE3;
    db $E3                                                               ;AAEAE7;
    dw $230B,$C3FC                                                       ;AAEAE8;
    db $E6                                                               ;AAEAEC;
    dw $2306,$C3EC                                                       ;AAEAED;
    db $E6                                                               ;AAEAF1;
    dw $2304,$C3FC                                                       ;AAEAF2;
    db $D6                                                               ;AAEAF6;
    dw $2302,$C3EC                                                       ;AAEAF7;
    db $D6                                                               ;AAEAFB;
    dw $2300                                                             ;AAEAFC;

Spritemaps_Chozo_8:
    dw $0015,$C3E8                                                       ;AAEAFE;
    db $ED                                                               ;AAEB02;
    dw $2326,$01E0                                                       ;AAEB03;
    db $F9                                                               ;AAEB07;
    dw $231F,$01FA                                                       ;AAEB08;
    db $DF                                                               ;AAEB0C;
    dw $2379,$C210                                                       ;AAEB0D;
    db $15                                                               ;AAEB11;
    dw $2375,$C204                                                       ;AAEB12;
    db $09                                                               ;AAEB16;
    dw $234E,$C3FB                                                       ;AAEB17;
    db $05                                                               ;AAEB1B;
    dw $6352,$C3FB                                                       ;AAEB1C;
    db $FD                                                               ;AAEB20;
    dw $6342,$C3F4                                                       ;AAEB21;
    db $F7                                                               ;AAEB25;
    dw $2308,$C3FC                                                       ;AAEB26;
    db $F7                                                               ;AAEB2A;
    dw $2309,$C3E1                                                       ;AAEB2B;
    db $1B                                                               ;AAEB2F;
    dw $2570,$C3E9                                                       ;AAEB30;
    db $1B                                                               ;AAEB34;
    dw $2571,$C3EE                                                       ;AAEB35;
    db $10                                                               ;AAEB39;
    dw $2558,$C3EE                                                       ;AAEB3A;
    db $08                                                               ;AAEB3E;
    dw $2548,$C3F4                                                       ;AAEB3F;
    db $FD                                                               ;AAEB43;
    dw $2544,$C3D8                                                       ;AAEB44;
    db $E9                                                               ;AAEB48;
    dw $232C,$C3ED                                                       ;AAEB49;
    db $EC                                                               ;AAEB4D;
    dw $230D,$C3F5                                                       ;AAEB4E;
    db $E4                                                               ;AAEB52;
    dw $230B,$C3FC                                                       ;AAEB53;
    db $E7                                                               ;AAEB57;
    dw $2306,$C3EC                                                       ;AAEB58;
    db $E7                                                               ;AAEB5C;
    dw $2304,$C3FC                                                       ;AAEB5D;
    db $D7                                                               ;AAEB61;
    dw $2302,$C3EC                                                       ;AAEB62;
    db $D7                                                               ;AAEB66;
    dw $2300                                                             ;AAEB67;

Spritemaps_Chozo_9:
    dw $0016,$01E0                                                       ;AAEB69;
    db $F8                                                               ;AAEB6D;
    dw $231F,$C3E8                                                       ;AAEB6E;
    db $EC                                                               ;AAEB72;
    dw $2326,$01FA                                                       ;AAEB73;
    db $DE                                                               ;AAEB77;
    dw $237A,$C209                                                       ;AAEB78;
    db $16                                                               ;AAEB7C;
    dw $2375,$C3FC                                                       ;AAEB7D;
    db $09                                                               ;AAEB81;
    dw $234E,$C3F9                                                       ;AAEB82;
    db $04                                                               ;AAEB86;
    dw $2350,$C3F9                                                       ;AAEB87;
    db $FC                                                               ;AAEB8B;
    dw $2340,$C3D8                                                       ;AAEB8C;
    db $E8                                                               ;AAEB90;
    dw $232C,$C3F5                                                       ;AAEB91;
    db $E3                                                               ;AAEB95;
    dw $230B,$C3ED                                                       ;AAEB96;
    db $EB                                                               ;AAEB9A;
    dw $230D,$C3F4                                                       ;AAEB9B;
    db $F6                                                               ;AAEB9F;
    dw $2308,$C3FC                                                       ;AAEBA0;
    db $F6                                                               ;AAEBA4;
    dw $2309,$C3FC                                                       ;AAEBA5;
    db $E6                                                               ;AAEBA9;
    dw $2306,$C3EC                                                       ;AAEBAA;
    db $E6                                                               ;AAEBAE;
    dw $2304,$C3FC                                                       ;AAEBAF;
    db $D6                                                               ;AAEBB3;
    dw $2302,$C3EC                                                       ;AAEBB4;
    db $D6                                                               ;AAEBB8;
    dw $2300,$C3E4                                                       ;AAEBB9;
    db $1C                                                               ;AAEBBD;
    dw $2570,$C3EC                                                       ;AAEBBE;
    db $1C                                                               ;AAEBC2;
    dw $2571,$C3F1                                                       ;AAEBC3;
    db $11                                                               ;AAEBC7;
    dw $2558,$C3F1                                                       ;AAEBC8;
    db $09                                                               ;AAEBCC;
    dw $2548,$C3F7                                                       ;AAEBCD;
    db $04                                                               ;AAEBD1;
    dw $2552,$C3F7                                                       ;AAEBD2;
    db $FC                                                               ;AAEBD6;
    dw $2542                                                             ;AAEBD7;

Spritemaps_Chozo_A:
    dw $0016,$C3E8                                                       ;AAEBD9;
    db $EB                                                               ;AAEBDD;
    dw $2326,$01E0                                                       ;AAEBDE;
    db $F7                                                               ;AAEBE2;
    dw $231F,$01FA                                                       ;AAEBE3;
    db $DD                                                               ;AAEBE7;
    dw $237B,$C3FD                                                       ;AAEBE8;
    db $17                                                               ;AAEBEC;
    dw $2373,$C3FA                                                       ;AAEBED;
    db $08                                                               ;AAEBF1;
    dw $234E,$C3F7                                                       ;AAEBF2;
    db $03                                                               ;AAEBF6;
    dw $2352,$C3F7                                                       ;AAEBF7;
    db $FB                                                               ;AAEBFB;
    dw $2342,$C3F2                                                       ;AAEBFC;
    db $1E                                                               ;AAEC00;
    dw $2570,$C3FA                                                       ;AAEC01;
    db $1E                                                               ;AAEC05;
    dw $2571,$C3FA                                                       ;AAEC06;
    db $13                                                               ;AAEC0A;
    dw $255C,$C3FA                                                       ;AAEC0B;
    db $0B                                                               ;AAEC0F;
    dw $254C,$C3F9                                                       ;AAEC10;
    db $03                                                               ;AAEC14;
    dw $2550,$C3F9                                                       ;AAEC15;
    db $FB                                                               ;AAEC19;
    dw $2540,$C3D8                                                       ;AAEC1A;
    db $E7                                                               ;AAEC1E;
    dw $232C,$C3ED                                                       ;AAEC1F;
    db $EA                                                               ;AAEC23;
    dw $230D,$C3F5                                                       ;AAEC24;
    db $E2                                                               ;AAEC28;
    dw $230B,$C3F4                                                       ;AAEC29;
    db $F5                                                               ;AAEC2D;
    dw $2308,$C3FC                                                       ;AAEC2E;
    db $F5                                                               ;AAEC32;
    dw $2309,$C3FC                                                       ;AAEC33;
    db $E5                                                               ;AAEC37;
    dw $2306,$C3EC                                                       ;AAEC38;
    db $E5                                                               ;AAEC3C;
    dw $2304,$C3FC                                                       ;AAEC3D;
    db $D5                                                               ;AAEC41;
    dw $2302,$C3EC                                                       ;AAEC42;
    db $D5                                                               ;AAEC46;
    dw $2300                                                             ;AAEC47;

Spritemaps_Chozo_B:
    dw $0016,$01E0                                                       ;AAEC49;
    db $F8                                                               ;AAEC4D;
    dw $231F,$C3E8                                                       ;AAEC4E;
    db $EC                                                               ;AAEC52;
    dw $2326,$01FA                                                       ;AAEC53;
    db $DE                                                               ;AAEC57;
    dw $237C,$C3F2                                                       ;AAEC58;
    db $1B                                                               ;AAEC5C;
    dw $2373,$C3F3                                                       ;AAEC5D;
    db $10                                                               ;AAEC61;
    dw $2356,$C3F3                                                       ;AAEC62;
    db $08                                                               ;AAEC66;
    dw $2346,$C3F4                                                       ;AAEC67;
    db $FC                                                               ;AAEC6B;
    dw $2344,$C3F9                                                       ;AAEC6C;
    db $1D                                                               ;AAEC70;
    dw $2570,$C201                                                       ;AAEC71;
    db $1D                                                               ;AAEC75;
    dw $2571,$C201                                                       ;AAEC76;
    db $12                                                               ;AAEC7A;
    dw $2556,$C201                                                       ;AAEC7B;
    db $0A                                                               ;AAEC7F;
    dw $2546,$C3F4                                                       ;AAEC80;
    db $F6                                                               ;AAEC84;
    dw $2308,$C3FC                                                       ;AAEC85;
    db $F6                                                               ;AAEC89;
    dw $2309,$C3FB                                                       ;AAEC8A;
    db $FC                                                               ;AAEC8E;
    dw $6542,$C3FB                                                       ;AAEC8F;
    db $04                                                               ;AAEC93;
    dw $6552,$C3D8                                                       ;AAEC94;
    db $E8                                                               ;AAEC98;
    dw $232C,$C3ED                                                       ;AAEC99;
    db $EB                                                               ;AAEC9D;
    dw $230D,$C3F5                                                       ;AAEC9E;
    db $E3                                                               ;AAECA2;
    dw $230B,$C3FC                                                       ;AAECA3;
    db $E6                                                               ;AAECA7;
    dw $2306,$C3EC                                                       ;AAECA8;
    db $E6                                                               ;AAECAC;
    dw $2304,$C3FC                                                       ;AAECAD;
    db $D6                                                               ;AAECB1;
    dw $2302,$C3EC                                                       ;AAECB2;
    db $D6                                                               ;AAECB6;
    dw $2300                                                             ;AAECB7;

Spritemaps_Chozo_C:
    dw $0012,$C3E8                                                       ;AAECB9;
    db $ED                                                               ;AAECBD;
    dw $2326,$01E0                                                       ;AAECBE;
    db $F9                                                               ;AAECC2;
    dw $231F,$01FA                                                       ;AAECC3;
    db $DF                                                               ;AAECC7;
    dw $237D,$C3D8                                                       ;AAECC8;
    db $E9                                                               ;AAECCC;
    dw $232C,$C3ED                                                       ;AAECCD;
    db $EC                                                               ;AAECD1;
    dw $230D,$C3F5                                                       ;AAECD2;
    db $E4                                                               ;AAECD6;
    dw $230B,$C3F2                                                       ;AAECD7;
    db $1F                                                               ;AAECDB;
    dw $2370,$C3FA                                                       ;AAECDC;
    db $1F                                                               ;AAECE0;
    dw $2371,$C3FA                                                       ;AAECE1;
    db $0D                                                               ;AAECE5;
    dw $234C,$C3FA                                                       ;AAECE6;
    db $15                                                               ;AAECEA;
    dw $235C,$C3F9                                                       ;AAECEB;
    db $05                                                               ;AAECEF;
    dw $2350,$C3F9                                                       ;AAECF0;
    db $FD                                                               ;AAECF4;
    dw $2340,$C3F4                                                       ;AAECF5;
    db $F7                                                               ;AAECF9;
    dw $2308,$C3FC                                                       ;AAECFA;
    db $F7                                                               ;AAECFE;
    dw $2309,$C3FC                                                       ;AAECFF;
    db $E7                                                               ;AAED03;
    dw $2306,$C3EC                                                       ;AAED04;
    db $E7                                                               ;AAED08;
    dw $2304,$C3FC                                                       ;AAED09;
    db $D7                                                               ;AAED0D;
    dw $2302,$C3EC                                                       ;AAED0E;
    db $D7                                                               ;AAED12;
    dw $2300                                                             ;AAED13;

Spritemaps_Chozo_D:
    dw $0012,$01E0                                                       ;AAED15;
    db $F9                                                               ;AAED19;
    dw $231F,$C3E8                                                       ;AAED1A;
    db $ED                                                               ;AAED1E;
    dw $2326,$01FA                                                       ;AAED1F;
    db $DF                                                               ;AAED23;
    dw $237C,$C3D8                                                       ;AAED24;
    db $E9                                                               ;AAED28;
    dw $232C,$C3ED                                                       ;AAED29;
    db $EC                                                               ;AAED2D;
    dw $230D,$C3F5                                                       ;AAED2E;
    db $E4                                                               ;AAED32;
    dw $230B,$C3F2                                                       ;AAED33;
    db $1F                                                               ;AAED37;
    dw $2370,$C3FA                                                       ;AAED38;
    db $1F                                                               ;AAED3C;
    dw $2371,$C3FA                                                       ;AAED3D;
    db $0D                                                               ;AAED41;
    dw $234C,$C3FA                                                       ;AAED42;
    db $15                                                               ;AAED46;
    dw $235C,$C3F9                                                       ;AAED47;
    db $05                                                               ;AAED4B;
    dw $2350,$C3F9                                                       ;AAED4C;
    db $FD                                                               ;AAED50;
    dw $2340,$C3F4                                                       ;AAED51;
    db $F7                                                               ;AAED55;
    dw $2308,$C3FC                                                       ;AAED56;
    db $F7                                                               ;AAED5A;
    dw $2309,$C3FC                                                       ;AAED5B;
    db $E7                                                               ;AAED5F;
    dw $2306,$C3EC                                                       ;AAED60;
    db $E7                                                               ;AAED64;
    dw $2304,$C3FC                                                       ;AAED65;
    db $D7                                                               ;AAED69;
    dw $2302,$C3EC                                                       ;AAED6A;
    db $D7                                                               ;AAED6E;
    dw $2300                                                             ;AAED6F;

Spritemaps_Chozo_E:
    dw $0012,$C3D8                                                       ;AAED71;
    db $E9                                                               ;AAED75;
    dw $232C,$C3E8                                                       ;AAED76;
    db $ED                                                               ;AAED7A;
    dw $2326,$01E0                                                       ;AAED7B;
    db $F9                                                               ;AAED7F;
    dw $231F,$01FA                                                       ;AAED80;
    db $DF                                                               ;AAED84;
    dw $237B,$C3ED                                                       ;AAED85;
    db $EC                                                               ;AAED89;
    dw $230D,$C3F5                                                       ;AAED8A;
    db $E4                                                               ;AAED8E;
    dw $230B,$C3F2                                                       ;AAED8F;
    db $1F                                                               ;AAED93;
    dw $2370,$C3FA                                                       ;AAED94;
    db $1F                                                               ;AAED98;
    dw $2371,$C3FA                                                       ;AAED99;
    db $0D                                                               ;AAED9D;
    dw $234C,$C3FA                                                       ;AAED9E;
    db $15                                                               ;AAEDA2;
    dw $235C,$C3F9                                                       ;AAEDA3;
    db $05                                                               ;AAEDA7;
    dw $2350,$C3F9                                                       ;AAEDA8;
    db $FD                                                               ;AAEDAC;
    dw $2340,$C3F4                                                       ;AAEDAD;
    db $F7                                                               ;AAEDB1;
    dw $2308,$C3FC                                                       ;AAEDB2;
    db $F7                                                               ;AAEDB6;
    dw $2309,$C3FC                                                       ;AAEDB7;
    db $E7                                                               ;AAEDBB;
    dw $2306,$C3EC                                                       ;AAEDBC;
    db $E7                                                               ;AAEDC0;
    dw $2304,$C3FC                                                       ;AAEDC1;
    db $D7                                                               ;AAEDC5;
    dw $2302,$C3EC                                                       ;AAEDC6;
    db $D7                                                               ;AAEDCA;
    dw $2300                                                             ;AAEDCB;

Spritemaps_Chozo_F:
    dw $0012,$01E0                                                       ;AAEDCD;
    db $F9                                                               ;AAEDD1;
    dw $231F,$C3E8                                                       ;AAEDD2;
    db $ED                                                               ;AAEDD6;
    dw $2326,$01FA                                                       ;AAEDD7;
    db $DF                                                               ;AAEDDB;
    dw $237A,$C3D8                                                       ;AAEDDC;
    db $E9                                                               ;AAEDE0;
    dw $232C,$C3ED                                                       ;AAEDE1;
    db $EC                                                               ;AAEDE5;
    dw $230D,$C3F5                                                       ;AAEDE6;
    db $E4                                                               ;AAEDEA;
    dw $230B,$C3F2                                                       ;AAEDEB;
    db $1F                                                               ;AAEDEF;
    dw $2370,$C3FA                                                       ;AAEDF0;
    db $1F                                                               ;AAEDF4;
    dw $2371,$C3FA                                                       ;AAEDF5;
    db $0D                                                               ;AAEDF9;
    dw $234C,$C3FA                                                       ;AAEDFA;
    db $15                                                               ;AAEDFE;
    dw $235C,$C3F9                                                       ;AAEDFF;
    db $05                                                               ;AAEE03;
    dw $2350,$C3F9                                                       ;AAEE04;
    db $FD                                                               ;AAEE08;
    dw $2340,$C3F4                                                       ;AAEE09;
    db $F7                                                               ;AAEE0D;
    dw $2308,$C3FC                                                       ;AAEE0E;
    db $F7                                                               ;AAEE12;
    dw $2309,$C3FC                                                       ;AAEE13;
    db $E7                                                               ;AAEE17;
    dw $2306,$C3EC                                                       ;AAEE18;
    db $E7                                                               ;AAEE1C;
    dw $2304,$C3FC                                                       ;AAEE1D;
    db $D7                                                               ;AAEE21;
    dw $2302,$C3EC                                                       ;AAEE22;
    db $D7                                                               ;AAEE26;
    dw $2300                                                             ;AAEE27;

Spritemaps_Chozo_10:
    dw $0012,$C3D8                                                       ;AAEE29;
    db $E9                                                               ;AAEE2D;
    dw $232C,$01E0                                                       ;AAEE2E;
    db $F9                                                               ;AAEE32;
    dw $231F,$C3E8                                                       ;AAEE33;
    db $ED                                                               ;AAEE37;
    dw $2326,$01FA                                                       ;AAEE38;
    db $DF                                                               ;AAEE3C;
    dw $2379,$C3ED                                                       ;AAEE3D;
    db $EC                                                               ;AAEE41;
    dw $230D,$C3F5                                                       ;AAEE42;
    db $E4                                                               ;AAEE46;
    dw $230B,$C3F2                                                       ;AAEE47;
    db $1F                                                               ;AAEE4B;
    dw $2370,$C3FA                                                       ;AAEE4C;
    db $1F                                                               ;AAEE50;
    dw $2371,$C3FA                                                       ;AAEE51;
    db $0D                                                               ;AAEE55;
    dw $234C,$C3FA                                                       ;AAEE56;
    db $15                                                               ;AAEE5A;
    dw $235C,$C3F9                                                       ;AAEE5B;
    db $05                                                               ;AAEE5F;
    dw $2350,$C3F9                                                       ;AAEE60;
    db $FD                                                               ;AAEE64;
    dw $2340,$C3F4                                                       ;AAEE65;
    db $F7                                                               ;AAEE69;
    dw $2308,$C3FC                                                       ;AAEE6A;
    db $F7                                                               ;AAEE6E;
    dw $2309,$C3FC                                                       ;AAEE6F;
    db $E7                                                               ;AAEE73;
    dw $2306,$C3EC                                                       ;AAEE74;
    db $E7                                                               ;AAEE78;
    dw $2304,$C3FC                                                       ;AAEE79;
    db $D7                                                               ;AAEE7D;
    dw $2302,$C3EC                                                       ;AAEE7E;
    db $D7                                                               ;AAEE82;
    dw $2300                                                             ;AAEE83;

Spritemaps_Chozo_11:
    dw $002A,$C3E0                                                       ;AAEE85;
    db $98                                                               ;AAEE89;
    dw $2344,$C242                                                       ;AAEE8A;
    db $98                                                               ;AAEE8E;
    dw $234A,$C232                                                       ;AAEE8F;
    db $A0                                                               ;AAEE93;
    dw $2358,$C232                                                       ;AAEE94;
    db $98                                                               ;AAEE98;
    dw $2348,$C222                                                       ;AAEE99;
    db $A0                                                               ;AAEE9D;
    dw $235C,$C222                                                       ;AAEE9E;
    db $98                                                               ;AAEEA2;
    dw $234C,$C202                                                       ;AAEEA3;
    db $98                                                               ;AAEEA7;
    dw $234E,$C212                                                       ;AAEEA8;
    db $A0                                                               ;AAEEAC;
    dw $2356,$C212                                                       ;AAEEAD;
    db $98                                                               ;AAEEB1;
    dw $2346,$C201                                                       ;AAEEB2;
    db $B8                                                               ;AAEEB6;
    dw $254E,$C211                                                       ;AAEEB7;
    db $C0                                                               ;AAEEBB;
    dw $2556,$C211                                                       ;AAEEBC;
    db $B8                                                               ;AAEEC0;
    dw $2546,$C241                                                       ;AAEEC1;
    db $B8                                                               ;AAEEC5;
    dw $254A,$C231                                                       ;AAEEC6;
    db $C0                                                               ;AAEECA;
    dw $2558,$C231                                                       ;AAEECB;
    db $B8                                                               ;AAEECF;
    dw $2548,$C221                                                       ;AAEED0;
    db $C0                                                               ;AAEED4;
    dw $255C,$C221                                                       ;AAEED5;
    db $B8                                                               ;AAEED9;
    dw $254C,$C3D8                                                       ;AAEEDA;
    db $F0                                                               ;AAEEDE;
    dw $2577,$C3C8                                                       ;AAEEDF;
    db $F0                                                               ;AAEEE3;
    dw $2575,$C3B8                                                       ;AAEEE4;
    db $F0                                                               ;AAEEE8;
    dw $2573,$C3A0                                                       ;AAEEE9;
    db $F0                                                               ;AAEEED;
    dw $2570,$C3A8                                                       ;AAEEEE;
    db $F0                                                               ;AAEEF2;
    dw $2571,$C3D8                                                       ;AAEEF3;
    db $E0                                                               ;AAEEF7;
    dw $2377,$C3C8                                                       ;AAEEF8;
    db $E0                                                               ;AAEEFC;
    dw $2375,$C3B8                                                       ;AAEEFD;
    db $E0                                                               ;AAEF01;
    dw $2373,$C3A8                                                       ;AAEF02;
    db $E0                                                               ;AAEF06;
    dw $2371,$C3A0                                                       ;AAEF07;
    db $E0                                                               ;AAEF0B;
    dw $2370,$C3D0                                                       ;AAEF0C;
    db $A0                                                               ;AAEF10;
    dw $2352,$C3D0                                                       ;AAEF11;
    db $98                                                               ;AAEF15;
    dw $2342,$C3B0                                                       ;AAEF16;
    db $A0                                                               ;AAEF1A;
    dw $6352,$C3B0                                                       ;AAEF1B;
    db $98                                                               ;AAEF1F;
    dw $6342,$C3C0                                                       ;AAEF20;
    db $A0                                                               ;AAEF24;
    dw $2350,$C3C0                                                       ;AAEF25;
    db $98                                                               ;AAEF29;
    dw $2340,$C3A0                                                       ;AAEF2A;
    db $98                                                               ;AAEF2E;
    dw $6344,$C3A1                                                       ;AAEF2F;
    db $B8                                                               ;AAEF33;
    dw $6544,$C3B0                                                       ;AAEF34;
    db $B8                                                               ;AAEF38;
    dw $6542,$C3B0                                                       ;AAEF39;
    db $C0                                                               ;AAEF3D;
    dw $6552,$C3D0                                                       ;AAEF3E;
    db $C0                                                               ;AAEF42;
    dw $2552,$C3C0                                                       ;AAEF43;
    db $C0                                                               ;AAEF47;
    dw $2550,$C3E0                                                       ;AAEF48;
    db $B8                                                               ;AAEF4C;
    dw $2544,$C3D0                                                       ;AAEF4D;
    db $B8                                                               ;AAEF51;
    dw $2542,$C3C0                                                       ;AAEF52;
    db $B8                                                               ;AAEF56;
    dw $2540                                                             ;AAEF57;

Spritemaps_Chozo_12:
    dw $0019,$C238                                                       ;AAEF59;
    db $88                                                               ;AAEF5D;
    dw $230D,$C240                                                       ;AAEF5E;
    db $80                                                               ;AAEF62;
    dw $230B,$003E                                                       ;AAEF63;
    db $EF                                                               ;AAEF67;
    dw $2339,$C236                                                       ;AAEF68;
    db $DF                                                               ;AAEF6C;
    dw $232C,$C246                                                       ;AAEF6D;
    db $E7                                                               ;AAEF71;
    dw $232A,$C220                                                       ;AAEF72;
    db $DB                                                               ;AAEF76;
    dw $232A,$C210                                                       ;AAEF77;
    db $DB                                                               ;AAEF7B;
    dw $2328,$C245                                                       ;AAEF7C;
    db $C8                                                               ;AAEF80;
    dw $2326,$0045                                                       ;AAEF81;
    db $C0                                                               ;AAEF85;
    dw $231F,$C235                                                       ;AAEF86;
    db $C0                                                               ;AAEF8A;
    dw $2324,$C211                                                       ;AAEF8B;
    db $C0                                                               ;AAEF8F;
    dw $2320,$0021                                                       ;AAEF90;
    db $C0                                                               ;AAEF94;
    dw $230F,$C221                                                       ;AAEF95;
    db $C8                                                               ;AAEF99;
    dw $2322,$C3B7                                                       ;AAEF9A;
    db $BD                                                               ;AAEF9E;
    dw $234C,$C3B7                                                       ;AAEF9F;
    db $C5                                                               ;AAEFA3;
    dw $235C,$C399                                                       ;AAEFA4;
    db $D7                                                               ;AAEFA8;
    dw $2350,$C399                                                       ;AAEFA9;
    db $CF                                                               ;AAEFAD;
    dw $2340,$C3DA                                                       ;AAEFAE;
    db $CA                                                               ;AAEFB2;
    dw $2370,$C3E2                                                       ;AAEFB3;
    db $CA                                                               ;AAEFB7;
    dw $2371,$C3F1                                                       ;AAEFB8;
    db $A8                                                               ;AAEFBC;
    dw $2308,$C3F9                                                       ;AAEFBD;
    db $A8                                                               ;AAEFC1;
    dw $2309,$C3F9                                                       ;AAEFC2;
    db $98                                                               ;AAEFC6;
    dw $2306,$C3E9                                                       ;AAEFC7;
    db $98                                                               ;AAEFCB;
    dw $2304,$C3F9                                                       ;AAEFCC;
    db $88                                                               ;AAEFD0;
    dw $2302,$C3E9                                                       ;AAEFD1;
    db $88                                                               ;AAEFD5;
    dw $2300                                                             ;AAEFD6;

Spritemaps_Chozo_13:
    dw $0012,$01FE                                                       ;AAEFD8;
    db $DF                                                               ;AAEFDC;
    dw $637D,$C21A                                                       ;AAEFDD;
    db $E7                                                               ;AAEFE1;
    dw $6320,$0012                                                       ;AAEFE2;
    db $E7                                                               ;AAEFE6;
    dw $630F,$C20A                                                       ;AAEFE7;
    db $EF                                                               ;AAEFEB;
    dw $6322,$C203                                                       ;AAEFEC;
    db $EC                                                               ;AAEFF0;
    dw $630D,$C3FB                                                       ;AAEFF1;
    db $E4                                                               ;AAEFF5;
    dw $630B,$C3FE                                                       ;AAEFF6;
    db $1F                                                               ;AAEFFA;
    dw $6370,$C3F6                                                       ;AAEFFB;
    db $1F                                                               ;AAEFFF;
    dw $6371,$C3F6                                                       ;AAF000;
    db $0D                                                               ;AAF004;
    dw $634C,$C3F6                                                       ;AAF005;
    db $15                                                               ;AAF009;
    dw $635C,$C3F7                                                       ;AAF00A;
    db $05                                                               ;AAF00E;
    dw $6350,$C3F7                                                       ;AAF00F;
    db $FD                                                               ;AAF013;
    dw $6340,$C3FC                                                       ;AAF014;
    db $F7                                                               ;AAF018;
    dw $6308,$C3F4                                                       ;AAF019;
    db $F7                                                               ;AAF01D;
    dw $6309,$C3F4                                                       ;AAF01E;
    db $E7                                                               ;AAF022;
    dw $6306,$C204                                                       ;AAF023;
    db $E7                                                               ;AAF027;
    dw $6304,$C3F4                                                       ;AAF028;
    db $D7                                                               ;AAF02C;
    dw $6302,$C204                                                       ;AAF02D;
    db $D7                                                               ;AAF031;
    dw $6300                                                             ;AAF032;

Spritemaps_Chozo_14:
    dw $0011,$01FE                                                       ;AAF034;
    db $DF                                                               ;AAF038;
    dw $637D,$C207                                                       ;AAF039;
    db $ED                                                               ;AAF03D;
    dw $632A,$C217                                                       ;AAF03E;
    db $ED                                                               ;AAF042;
    dw $6328,$C203                                                       ;AAF043;
    db $EC                                                               ;AAF047;
    dw $630D,$C3FB                                                       ;AAF048;
    db $E4                                                               ;AAF04C;
    dw $630B,$C3FE                                                       ;AAF04D;
    db $1F                                                               ;AAF051;
    dw $6370,$C3F6                                                       ;AAF052;
    db $1F                                                               ;AAF056;
    dw $6371,$C3F6                                                       ;AAF057;
    db $0D                                                               ;AAF05B;
    dw $634C,$C3F6                                                       ;AAF05C;
    db $15                                                               ;AAF060;
    dw $635C,$C3F7                                                       ;AAF061;
    db $05                                                               ;AAF065;
    dw $6350,$C3F7                                                       ;AAF066;
    db $FD                                                               ;AAF06A;
    dw $6340,$C3FC                                                       ;AAF06B;
    db $F7                                                               ;AAF06F;
    dw $6308,$C3F4                                                       ;AAF070;
    db $F7                                                               ;AAF074;
    dw $6309,$C3F4                                                       ;AAF075;
    db $E7                                                               ;AAF079;
    dw $6306,$C204                                                       ;AAF07A;
    db $E7                                                               ;AAF07E;
    dw $6304,$C3F4                                                       ;AAF07F;
    db $D7                                                               ;AAF083;
    dw $6302,$C204                                                       ;AAF084;
    db $D7                                                               ;AAF088;
    dw $6300                                                             ;AAF089;

Spritemaps_Chozo_15:
    dw $0011,$C208                                                       ;AAF08B;
    db $ED                                                               ;AAF08F;
    dw $6326,$C218                                                       ;AAF090;
    db $ED                                                               ;AAF094;
    dw $6324,$01FE                                                       ;AAF095;
    db $DF                                                               ;AAF099;
    dw $637D,$C203                                                       ;AAF09A;
    db $EC                                                               ;AAF09E;
    dw $630D,$C3FB                                                       ;AAF09F;
    db $E4                                                               ;AAF0A3;
    dw $630B,$C3FE                                                       ;AAF0A4;
    db $1F                                                               ;AAF0A8;
    dw $6370,$C3F6                                                       ;AAF0A9;
    db $1F                                                               ;AAF0AD;
    dw $6371,$C3F6                                                       ;AAF0AE;
    db $0D                                                               ;AAF0B2;
    dw $634C,$C3F6                                                       ;AAF0B3;
    db $15                                                               ;AAF0B7;
    dw $635C,$C3F7                                                       ;AAF0B8;
    db $05                                                               ;AAF0BC;
    dw $6350,$C3F7                                                       ;AAF0BD;
    db $FD                                                               ;AAF0C1;
    dw $6340,$C3FC                                                       ;AAF0C2;
    db $F7                                                               ;AAF0C6;
    dw $6308,$C3F4                                                       ;AAF0C7;
    db $F7                                                               ;AAF0CB;
    dw $6309,$C3F4                                                       ;AAF0CC;
    db $E7                                                               ;AAF0D0;
    dw $6306,$C204                                                       ;AAF0D1;
    db $E7                                                               ;AAF0D5;
    dw $6304,$C3F4                                                       ;AAF0D6;
    db $D7                                                               ;AAF0DA;
    dw $6302,$C204                                                       ;AAF0DB;
    db $D7                                                               ;AAF0DF;
    dw $6300                                                             ;AAF0E0;

Spritemaps_Chozo_16:
    dw $0012,$C208                                                       ;AAF0E2;
    db $ED                                                               ;AAF0E6;
    dw $6326,$C218                                                       ;AAF0E7;
    db $E9                                                               ;AAF0EB;
    dw $632C,$0018                                                       ;AAF0EC;
    db $F9                                                               ;AAF0F0;
    dw $631F,$01FE                                                       ;AAF0F1;
    db $DF                                                               ;AAF0F5;
    dw $637D,$C203                                                       ;AAF0F6;
    db $EC                                                               ;AAF0FA;
    dw $630D,$C3FB                                                       ;AAF0FB;
    db $E4                                                               ;AAF0FF;
    dw $630B,$C3FE                                                       ;AAF100;
    db $1F                                                               ;AAF104;
    dw $6370,$C3F6                                                       ;AAF105;
    db $1F                                                               ;AAF109;
    dw $6371,$C3F6                                                       ;AAF10A;
    db $0D                                                               ;AAF10E;
    dw $634C,$C3F6                                                       ;AAF10F;
    db $15                                                               ;AAF113;
    dw $635C,$C3F7                                                       ;AAF114;
    db $05                                                               ;AAF118;
    dw $6350,$C3F7                                                       ;AAF119;
    db $FD                                                               ;AAF11D;
    dw $6340,$C3FC                                                       ;AAF11E;
    db $F7                                                               ;AAF122;
    dw $6308,$C3F4                                                       ;AAF123;
    db $F7                                                               ;AAF127;
    dw $6309,$C3F4                                                       ;AAF128;
    db $E7                                                               ;AAF12C;
    dw $6306,$C204                                                       ;AAF12D;
    db $E7                                                               ;AAF131;
    dw $6304,$C3F4                                                       ;AAF132;
    db $D7                                                               ;AAF136;
    dw $6302,$C204                                                       ;AAF137;
    db $D7                                                               ;AAF13B;
    dw $6300                                                             ;AAF13C;

Spritemaps_Chozo_17:
    dw $0015,$01E0                                                       ;AAF13E;
    db $F9                                                               ;AAF142;
    dw $231F,$C3E8                                                       ;AAF143;
    db $ED                                                               ;AAF147;
    dw $2326,$01FA                                                       ;AAF148;
    db $DF                                                               ;AAF14C;
    dw $2379,$C3E9                                                       ;AAF14D;
    db $1B                                                               ;AAF151;
    dw $2371,$C3E1                                                       ;AAF152;
    db $1B                                                               ;AAF156;
    dw $2370,$C3EE                                                       ;AAF157;
    db $10                                                               ;AAF15B;
    dw $2358,$C3EE                                                       ;AAF15C;
    db $08                                                               ;AAF160;
    dw $2348,$C3F4                                                       ;AAF161;
    db $FD                                                               ;AAF165;
    dw $2344,$C3F4                                                       ;AAF166;
    db $F7                                                               ;AAF16A;
    dw $2308,$C3FC                                                       ;AAF16B;
    db $F7                                                               ;AAF16F;
    dw $2309,$C210                                                       ;AAF170;
    db $15                                                               ;AAF174;
    dw $2575,$C204                                                       ;AAF175;
    db $09                                                               ;AAF179;
    dw $254E,$C3FB                                                       ;AAF17A;
    db $FD                                                               ;AAF17E;
    dw $6542,$C3FB                                                       ;AAF17F;
    db $05                                                               ;AAF183;
    dw $6552,$C3D8                                                       ;AAF184;
    db $E9                                                               ;AAF188;
    dw $232C,$C3ED                                                       ;AAF189;
    db $EC                                                               ;AAF18D;
    dw $230D,$C3F5                                                       ;AAF18E;
    db $E4                                                               ;AAF192;
    dw $230B,$C3FC                                                       ;AAF193;
    db $E7                                                               ;AAF197;
    dw $2306,$C3EC                                                       ;AAF198;
    db $E7                                                               ;AAF19C;
    dw $2304,$C3FC                                                       ;AAF19D;
    db $D7                                                               ;AAF1A1;
    dw $2302,$C3EC                                                       ;AAF1A2;
    db $D7                                                               ;AAF1A6;
    dw $2300                                                             ;AAF1A7;

Spritemaps_Chozo_18:
    dw $0016,$01E0                                                       ;AAF1A9;
    db $F8                                                               ;AAF1AD;
    dw $231F,$C3E8                                                       ;AAF1AE;
    db $EC                                                               ;AAF1B2;
    dw $2326,$01FA                                                       ;AAF1B3;
    db $DE                                                               ;AAF1B7;
    dw $237A,$C3EC                                                       ;AAF1B8;
    db $1C                                                               ;AAF1BC;
    dw $2371,$C3E4                                                       ;AAF1BD;
    db $1C                                                               ;AAF1C1;
    dw $2370,$C3F1                                                       ;AAF1C2;
    db $11                                                               ;AAF1C6;
    dw $2358,$C3F1                                                       ;AAF1C7;
    db $09                                                               ;AAF1CB;
    dw $2348,$C3F7                                                       ;AAF1CC;
    db $04                                                               ;AAF1D0;
    dw $2352,$C3F7                                                       ;AAF1D1;
    db $FC                                                               ;AAF1D5;
    dw $2342,$C3F4                                                       ;AAF1D6;
    db $F6                                                               ;AAF1DA;
    dw $2308,$C3FC                                                       ;AAF1DB;
    db $F6                                                               ;AAF1DF;
    dw $2309,$C209                                                       ;AAF1E0;
    db $16                                                               ;AAF1E4;
    dw $2575,$C3FC                                                       ;AAF1E5;
    db $09                                                               ;AAF1E9;
    dw $254E,$C3F9                                                       ;AAF1EA;
    db $04                                                               ;AAF1EE;
    dw $2550,$C3F9                                                       ;AAF1EF;
    db $FC                                                               ;AAF1F3;
    dw $2540,$C3D8                                                       ;AAF1F4;
    db $E8                                                               ;AAF1F8;
    dw $232C,$C3ED                                                       ;AAF1F9;
    db $EB                                                               ;AAF1FD;
    dw $230D,$C3F5                                                       ;AAF1FE;
    db $E3                                                               ;AAF202;
    dw $230B,$C3FC                                                       ;AAF203;
    db $E6                                                               ;AAF207;
    dw $2306,$C3EC                                                       ;AAF208;
    db $E6                                                               ;AAF20C;
    dw $2304,$C3FC                                                       ;AAF20D;
    db $D6                                                               ;AAF211;
    dw $2302,$C3EC                                                       ;AAF212;
    db $D6                                                               ;AAF216;
    dw $2300                                                             ;AAF217;

Spritemaps_Chozo_19:
    dw $0016,$C3E8                                                       ;AAF219;
    db $EB                                                               ;AAF21D;
    dw $2326,$01E0                                                       ;AAF21E;
    db $F7                                                               ;AAF222;
    dw $231F,$01FA                                                       ;AAF223;
    db $DD                                                               ;AAF227;
    dw $237B,$C3FA                                                       ;AAF228;
    db $1E                                                               ;AAF22C;
    dw $2371,$C3F2                                                       ;AAF22D;
    db $1E                                                               ;AAF231;
    dw $2370,$C3FA                                                       ;AAF232;
    db $13                                                               ;AAF236;
    dw $235C,$C3FA                                                       ;AAF237;
    db $0B                                                               ;AAF23B;
    dw $234C,$C3FD                                                       ;AAF23C;
    db $17                                                               ;AAF240;
    dw $2573,$C3F9                                                       ;AAF241;
    db $03                                                               ;AAF245;
    dw $2350,$C3F9                                                       ;AAF246;
    db $FB                                                               ;AAF24A;
    dw $2340,$C3FA                                                       ;AAF24B;
    db $08                                                               ;AAF24F;
    dw $254E,$C3F4                                                       ;AAF250;
    db $F5                                                               ;AAF254;
    dw $2308,$C3FC                                                       ;AAF255;
    db $F5                                                               ;AAF259;
    dw $2309,$C3F7                                                       ;AAF25A;
    db $03                                                               ;AAF25E;
    dw $2552,$C3F7                                                       ;AAF25F;
    db $FB                                                               ;AAF263;
    dw $2542,$C3D8                                                       ;AAF264;
    db $E7                                                               ;AAF268;
    dw $232C,$C3ED                                                       ;AAF269;
    db $EA                                                               ;AAF26D;
    dw $230D,$C3F5                                                       ;AAF26E;
    db $E2                                                               ;AAF272;
    dw $230B,$C3FC                                                       ;AAF273;
    db $E5                                                               ;AAF277;
    dw $2306,$C3EC                                                       ;AAF278;
    db $E5                                                               ;AAF27C;
    dw $2304,$C3FC                                                       ;AAF27D;
    db $D5                                                               ;AAF281;
    dw $2302,$C3EC                                                       ;AAF282;
    db $D5                                                               ;AAF286;
    dw $2300                                                             ;AAF287;

Spritemaps_Chozo_1A:
    dw $0016,$01E0                                                       ;AAF289;
    db $F8                                                               ;AAF28D;
    dw $231F,$C3E8                                                       ;AAF28E;
    db $EC                                                               ;AAF292;
    dw $2326,$01FA                                                       ;AAF293;
    db $DE                                                               ;AAF297;
    dw $237C,$C201                                                       ;AAF298;
    db $1D                                                               ;AAF29C;
    dw $2371,$C3F9                                                       ;AAF29D;
    db $1D                                                               ;AAF2A1;
    dw $2370,$C201                                                       ;AAF2A2;
    db $12                                                               ;AAF2A6;
    dw $2356,$C201                                                       ;AAF2A7;
    db $0A                                                               ;AAF2AB;
    dw $2346,$C3FB                                                       ;AAF2AC;
    db $04                                                               ;AAF2B0;
    dw $6352,$C3FB                                                       ;AAF2B1;
    db $FC                                                               ;AAF2B5;
    dw $6342,$C3F2                                                       ;AAF2B6;
    db $1B                                                               ;AAF2BA;
    dw $2573,$C3F3                                                       ;AAF2BB;
    db $10                                                               ;AAF2BF;
    dw $2556,$C3F3                                                       ;AAF2C0;
    db $08                                                               ;AAF2C4;
    dw $2546,$C3F4                                                       ;AAF2C5;
    db $F6                                                               ;AAF2C9;
    dw $2308,$C3FC                                                       ;AAF2CA;
    db $F6                                                               ;AAF2CE;
    dw $2309,$C3F4                                                       ;AAF2CF;
    db $FC                                                               ;AAF2D3;
    dw $2544,$C3D8                                                       ;AAF2D4;
    db $E8                                                               ;AAF2D8;
    dw $232C,$C3ED                                                       ;AAF2D9;
    db $EB                                                               ;AAF2DD;
    dw $230D,$C3F5                                                       ;AAF2DE;
    db $E3                                                               ;AAF2E2;
    dw $230B,$C3FC                                                       ;AAF2E3;
    db $E6                                                               ;AAF2E7;
    dw $2306,$C3EC                                                       ;AAF2E8;
    db $E6                                                               ;AAF2EC;
    dw $2304,$C3FC                                                       ;AAF2ED;
    db $D6                                                               ;AAF2F1;
    dw $2302,$C3EC                                                       ;AAF2F2;
    db $D6                                                               ;AAF2F6;
    dw $2300                                                             ;AAF2F7;

Spritemaps_Chozo_1B:
    dw $0015,$C3E8                                                       ;AAF2F9;
    db $ED                                                               ;AAF2FD;
    dw $2326,$01E0                                                       ;AAF2FE;
    db $F9                                                               ;AAF302;
    dw $231F,$01FA                                                       ;AAF303;
    db $DF                                                               ;AAF307;
    dw $2379,$C210                                                       ;AAF308;
    db $15                                                               ;AAF30C;
    dw $2375,$C204                                                       ;AAF30D;
    db $09                                                               ;AAF311;
    dw $234E,$C3FB                                                       ;AAF312;
    db $05                                                               ;AAF316;
    dw $6352,$C3FB                                                       ;AAF317;
    db $FD                                                               ;AAF31B;
    dw $6342,$C3F4                                                       ;AAF31C;
    db $F7                                                               ;AAF320;
    dw $2308,$C3FC                                                       ;AAF321;
    db $F7                                                               ;AAF325;
    dw $2309,$C3E1                                                       ;AAF326;
    db $1B                                                               ;AAF32A;
    dw $2570,$C3E9                                                       ;AAF32B;
    db $1B                                                               ;AAF32F;
    dw $2571,$C3EE                                                       ;AAF330;
    db $10                                                               ;AAF334;
    dw $2558,$C3EE                                                       ;AAF335;
    db $08                                                               ;AAF339;
    dw $2548,$C3F4                                                       ;AAF33A;
    db $FD                                                               ;AAF33E;
    dw $2544,$C3D8                                                       ;AAF33F;
    db $E9                                                               ;AAF343;
    dw $232C,$C3ED                                                       ;AAF344;
    db $EC                                                               ;AAF348;
    dw $230D,$C3F5                                                       ;AAF349;
    db $E4                                                               ;AAF34D;
    dw $230B,$C3FC                                                       ;AAF34E;
    db $E7                                                               ;AAF352;
    dw $2306,$C3EC                                                       ;AAF353;
    db $E7                                                               ;AAF357;
    dw $2304,$C3FC                                                       ;AAF358;
    db $D7                                                               ;AAF35C;
    dw $2302,$C3EC                                                       ;AAF35D;
    db $D7                                                               ;AAF361;
    dw $2300                                                             ;AAF362;

Spritemaps_Chozo_1C:
    dw $0016,$01E0                                                       ;AAF364;
    db $F8                                                               ;AAF368;
    dw $231F,$C3E8                                                       ;AAF369;
    db $EC                                                               ;AAF36D;
    dw $2326,$01FA                                                       ;AAF36E;
    db $DE                                                               ;AAF372;
    dw $237A,$C209                                                       ;AAF373;
    db $16                                                               ;AAF377;
    dw $2375,$C3FC                                                       ;AAF378;
    db $09                                                               ;AAF37C;
    dw $234E,$C3F9                                                       ;AAF37D;
    db $04                                                               ;AAF381;
    dw $2350,$C3F9                                                       ;AAF382;
    db $FC                                                               ;AAF386;
    dw $2340,$C3D8                                                       ;AAF387;
    db $E8                                                               ;AAF38B;
    dw $232C,$C3F5                                                       ;AAF38C;
    db $E3                                                               ;AAF390;
    dw $230B,$C3ED                                                       ;AAF391;
    db $EB                                                               ;AAF395;
    dw $230D,$C3F4                                                       ;AAF396;
    db $F6                                                               ;AAF39A;
    dw $2308,$C3FC                                                       ;AAF39B;
    db $F6                                                               ;AAF39F;
    dw $2309,$C3FC                                                       ;AAF3A0;
    db $E6                                                               ;AAF3A4;
    dw $2306,$C3EC                                                       ;AAF3A5;
    db $E6                                                               ;AAF3A9;
    dw $2304,$C3FC                                                       ;AAF3AA;
    db $D6                                                               ;AAF3AE;
    dw $2302,$C3EC                                                       ;AAF3AF;
    db $D6                                                               ;AAF3B3;
    dw $2300,$C3E4                                                       ;AAF3B4;
    db $1C                                                               ;AAF3B8;
    dw $2570,$C3EC                                                       ;AAF3B9;
    db $1C                                                               ;AAF3BD;
    dw $2571,$C3F1                                                       ;AAF3BE;
    db $11                                                               ;AAF3C2;
    dw $2558,$C3F1                                                       ;AAF3C3;
    db $09                                                               ;AAF3C7;
    dw $2548,$C3F7                                                       ;AAF3C8;
    db $04                                                               ;AAF3CC;
    dw $2552,$C3F7                                                       ;AAF3CD;
    db $FC                                                               ;AAF3D1;
    dw $2542                                                             ;AAF3D2;

Spritemaps_Chozo_1D:
    dw $0016,$C3E8                                                       ;AAF3D4;
    db $EB                                                               ;AAF3D8;
    dw $2326,$01E0                                                       ;AAF3D9;
    db $F7                                                               ;AAF3DD;
    dw $231F,$01FA                                                       ;AAF3DE;
    db $DD                                                               ;AAF3E2;
    dw $237B,$C3FD                                                       ;AAF3E3;
    db $17                                                               ;AAF3E7;
    dw $2373,$C3FA                                                       ;AAF3E8;
    db $08                                                               ;AAF3EC;
    dw $234E,$C3F7                                                       ;AAF3ED;
    db $03                                                               ;AAF3F1;
    dw $2352,$C3F7                                                       ;AAF3F2;
    db $FB                                                               ;AAF3F6;
    dw $2342,$C3F2                                                       ;AAF3F7;
    db $1E                                                               ;AAF3FB;
    dw $2570,$C3FA                                                       ;AAF3FC;
    db $1E                                                               ;AAF400;
    dw $2571,$C3FA                                                       ;AAF401;
    db $13                                                               ;AAF405;
    dw $255C,$C3FA                                                       ;AAF406;
    db $0B                                                               ;AAF40A;
    dw $254C,$C3F9                                                       ;AAF40B;
    db $03                                                               ;AAF40F;
    dw $2550,$C3F9                                                       ;AAF410;
    db $FB                                                               ;AAF414;
    dw $2540,$C3D8                                                       ;AAF415;
    db $E7                                                               ;AAF419;
    dw $232C,$C3ED                                                       ;AAF41A;
    db $EA                                                               ;AAF41E;
    dw $230D,$C3F5                                                       ;AAF41F;
    db $E2                                                               ;AAF423;
    dw $230B,$C3F4                                                       ;AAF424;
    db $F5                                                               ;AAF428;
    dw $2308,$C3FC                                                       ;AAF429;
    db $F5                                                               ;AAF42D;
    dw $2309,$C3FC                                                       ;AAF42E;
    db $E5                                                               ;AAF432;
    dw $2306,$C3EC                                                       ;AAF433;
    db $E5                                                               ;AAF437;
    dw $2304,$C3FC                                                       ;AAF438;
    db $D5                                                               ;AAF43C;
    dw $2302,$C3EC                                                       ;AAF43D;
    db $D5                                                               ;AAF441;
    dw $2300                                                             ;AAF442;

Spritemaps_Chozo_1E:
    dw $0016,$01E0                                                       ;AAF444;
    db $F8                                                               ;AAF448;
    dw $231F,$C3E8                                                       ;AAF449;
    db $EC                                                               ;AAF44D;
    dw $2326,$01FA                                                       ;AAF44E;
    db $DE                                                               ;AAF452;
    dw $237C,$C3F2                                                       ;AAF453;
    db $1B                                                               ;AAF457;
    dw $2373,$C3F3                                                       ;AAF458;
    db $10                                                               ;AAF45C;
    dw $2356,$C3F3                                                       ;AAF45D;
    db $08                                                               ;AAF461;
    dw $2346,$C3F4                                                       ;AAF462;
    db $FC                                                               ;AAF466;
    dw $2344,$C3F9                                                       ;AAF467;
    db $1D                                                               ;AAF46B;
    dw $2570,$C201                                                       ;AAF46C;
    db $1D                                                               ;AAF470;
    dw $2571,$C201                                                       ;AAF471;
    db $12                                                               ;AAF475;
    dw $2556,$C201                                                       ;AAF476;
    db $0A                                                               ;AAF47A;
    dw $2546,$C3F4                                                       ;AAF47B;
    db $F6                                                               ;AAF47F;
    dw $2308,$C3FC                                                       ;AAF480;
    db $F6                                                               ;AAF484;
    dw $2309,$C3FB                                                       ;AAF485;
    db $FC                                                               ;AAF489;
    dw $6542,$C3FB                                                       ;AAF48A;
    db $04                                                               ;AAF48E;
    dw $6552,$C3D8                                                       ;AAF48F;
    db $E8                                                               ;AAF493;
    dw $232C,$C3ED                                                       ;AAF494;
    db $EB                                                               ;AAF498;
    dw $230D,$C3F5                                                       ;AAF499;
    db $E3                                                               ;AAF49D;
    dw $230B,$C3FC                                                       ;AAF49E;
    db $E6                                                               ;AAF4A2;
    dw $2306,$C3EC                                                       ;AAF4A3;
    db $E6                                                               ;AAF4A7;
    dw $2304,$C3FC                                                       ;AAF4A8;
    db $D6                                                               ;AAF4AC;
    dw $2302,$C3EC                                                       ;AAF4AD;
    db $D6                                                               ;AAF4B1;
    dw $2300                                                             ;AAF4B2;

Spritemaps_Chozo_1F:
    dw $0012,$C208                                                       ;AAF4B4;
    db $ED                                                               ;AAF4B8;
    dw $6326,$0018                                                       ;AAF4B9;
    db $F9                                                               ;AAF4BD;
    dw $631F,$01FE                                                       ;AAF4BE;
    db $DF                                                               ;AAF4C2;
    dw $637D,$C218                                                       ;AAF4C3;
    db $E9                                                               ;AAF4C7;
    dw $632C,$C203                                                       ;AAF4C8;
    db $EC                                                               ;AAF4CC;
    dw $630D,$C3FB                                                       ;AAF4CD;
    db $E4                                                               ;AAF4D1;
    dw $630B,$C3FE                                                       ;AAF4D2;
    db $1F                                                               ;AAF4D6;
    dw $6370,$C3F6                                                       ;AAF4D7;
    db $1F                                                               ;AAF4DB;
    dw $6371,$C3F6                                                       ;AAF4DC;
    db $0D                                                               ;AAF4E0;
    dw $634C,$C3F6                                                       ;AAF4E1;
    db $15                                                               ;AAF4E5;
    dw $635C,$C3F7                                                       ;AAF4E6;
    db $05                                                               ;AAF4EA;
    dw $6350,$C3F7                                                       ;AAF4EB;
    db $FD                                                               ;AAF4EF;
    dw $6340,$C3FC                                                       ;AAF4F0;
    db $F7                                                               ;AAF4F4;
    dw $6308,$C3F4                                                       ;AAF4F5;
    db $F7                                                               ;AAF4F9;
    dw $6309,$C3F4                                                       ;AAF4FA;
    db $E7                                                               ;AAF4FE;
    dw $6306,$C204                                                       ;AAF4FF;
    db $E7                                                               ;AAF503;
    dw $6304,$C3F4                                                       ;AAF504;
    db $D7                                                               ;AAF508;
    dw $6302,$C204                                                       ;AAF509;
    db $D7                                                               ;AAF50D;
    dw $6300                                                             ;AAF50E;

Spritemaps_Chozo_20:
    dw $0012,$0018                                                       ;AAF510;
    db $F9                                                               ;AAF514;
    dw $631F,$C208                                                       ;AAF515;
    db $ED                                                               ;AAF519;
    dw $6326,$01FE                                                       ;AAF51A;
    db $DF                                                               ;AAF51E;
    dw $637C,$C218                                                       ;AAF51F;
    db $E9                                                               ;AAF523;
    dw $632C,$C203                                                       ;AAF524;
    db $EC                                                               ;AAF528;
    dw $630D,$C3FB                                                       ;AAF529;
    db $E4                                                               ;AAF52D;
    dw $630B,$C3FE                                                       ;AAF52E;
    db $1F                                                               ;AAF532;
    dw $6370,$C3F6                                                       ;AAF533;
    db $1F                                                               ;AAF537;
    dw $6371,$C3F6                                                       ;AAF538;
    db $0D                                                               ;AAF53C;
    dw $634C,$C3F6                                                       ;AAF53D;
    db $15                                                               ;AAF541;
    dw $635C,$C3F7                                                       ;AAF542;
    db $05                                                               ;AAF546;
    dw $6350,$C3F7                                                       ;AAF547;
    db $FD                                                               ;AAF54B;
    dw $6340,$C3FC                                                       ;AAF54C;
    db $F7                                                               ;AAF550;
    dw $6308,$C3F4                                                       ;AAF551;
    db $F7                                                               ;AAF555;
    dw $6309,$C3F4                                                       ;AAF556;
    db $E7                                                               ;AAF55A;
    dw $6306,$C204                                                       ;AAF55B;
    db $E7                                                               ;AAF55F;
    dw $6304,$C3F4                                                       ;AAF560;
    db $D7                                                               ;AAF564;
    dw $6302,$C204                                                       ;AAF565;
    db $D7                                                               ;AAF569;
    dw $6300                                                             ;AAF56A;

Spritemaps_Chozo_21:
    dw $0012,$C218                                                       ;AAF56C;
    db $E9                                                               ;AAF570;
    dw $632C,$C208                                                       ;AAF571;
    db $ED                                                               ;AAF575;
    dw $6326,$0018                                                       ;AAF576;
    db $F9                                                               ;AAF57A;
    dw $631F,$01FE                                                       ;AAF57B;
    db $DF                                                               ;AAF57F;
    dw $637B,$C203                                                       ;AAF580;
    db $EC                                                               ;AAF584;
    dw $630D,$C3FB                                                       ;AAF585;
    db $E4                                                               ;AAF589;
    dw $630B,$C3FE                                                       ;AAF58A;
    db $1F                                                               ;AAF58E;
    dw $6370,$C3F6                                                       ;AAF58F;
    db $1F                                                               ;AAF593;
    dw $6371,$C3F6                                                       ;AAF594;
    db $0D                                                               ;AAF598;
    dw $634C,$C3F6                                                       ;AAF599;
    db $15                                                               ;AAF59D;
    dw $635C,$C3F7                                                       ;AAF59E;
    db $05                                                               ;AAF5A2;
    dw $6350,$C3F7                                                       ;AAF5A3;
    db $FD                                                               ;AAF5A7;
    dw $6340,$C3FC                                                       ;AAF5A8;
    db $F7                                                               ;AAF5AC;
    dw $6308,$C3F4                                                       ;AAF5AD;
    db $F7                                                               ;AAF5B1;
    dw $6309,$C3F4                                                       ;AAF5B2;
    db $E7                                                               ;AAF5B6;
    dw $6306,$C204                                                       ;AAF5B7;
    db $E7                                                               ;AAF5BB;
    dw $6304,$C3F4                                                       ;AAF5BC;
    db $D7                                                               ;AAF5C0;
    dw $6302,$C204                                                       ;AAF5C1;
    db $D7                                                               ;AAF5C5;
    dw $6300                                                             ;AAF5C6;

Spritemaps_Chozo_22:
    dw $0012,$0018                                                       ;AAF5C8;
    db $F9                                                               ;AAF5CC;
    dw $631F,$C208                                                       ;AAF5CD;
    db $ED                                                               ;AAF5D1;
    dw $6326,$01FE                                                       ;AAF5D2;
    db $DF                                                               ;AAF5D6;
    dw $637A,$C218                                                       ;AAF5D7;
    db $E9                                                               ;AAF5DB;
    dw $632C,$C203                                                       ;AAF5DC;
    db $EC                                                               ;AAF5E0;
    dw $630D,$C3FB                                                       ;AAF5E1;
    db $E4                                                               ;AAF5E5;
    dw $630B,$C3FE                                                       ;AAF5E6;
    db $1F                                                               ;AAF5EA;
    dw $6370,$C3F6                                                       ;AAF5EB;
    db $1F                                                               ;AAF5EF;
    dw $6371,$C3F6                                                       ;AAF5F0;
    db $0D                                                               ;AAF5F4;
    dw $634C,$C3F6                                                       ;AAF5F5;
    db $15                                                               ;AAF5F9;
    dw $635C,$C3F7                                                       ;AAF5FA;
    db $05                                                               ;AAF5FE;
    dw $6350,$C3F7                                                       ;AAF5FF;
    db $FD                                                               ;AAF603;
    dw $6340,$C3FC                                                       ;AAF604;
    db $F7                                                               ;AAF608;
    dw $6308,$C3F4                                                       ;AAF609;
    db $F7                                                               ;AAF60D;
    dw $6309,$C3F4                                                       ;AAF60E;
    db $E7                                                               ;AAF612;
    dw $6306,$C204                                                       ;AAF613;
    db $E7                                                               ;AAF617;
    dw $6304,$C3F4                                                       ;AAF618;
    db $D7                                                               ;AAF61C;
    dw $6302,$C204                                                       ;AAF61D;
    db $D7                                                               ;AAF621;
    dw $6300                                                             ;AAF622;

Spritemaps_Chozo_23:
    dw $0012,$C218                                                       ;AAF624;
    db $E9                                                               ;AAF628;
    dw $632C,$0018                                                       ;AAF629;
    db $F9                                                               ;AAF62D;
    dw $631F,$C208                                                       ;AAF62E;
    db $ED                                                               ;AAF632;
    dw $6326,$01FE                                                       ;AAF633;
    db $DF                                                               ;AAF637;
    dw $6379,$C203                                                       ;AAF638;
    db $EC                                                               ;AAF63C;
    dw $630D,$C3FB                                                       ;AAF63D;
    db $E4                                                               ;AAF641;
    dw $630B,$C3FE                                                       ;AAF642;
    db $1F                                                               ;AAF646;
    dw $6370,$C3F6                                                       ;AAF647;
    db $1F                                                               ;AAF64B;
    dw $6371,$C3F6                                                       ;AAF64C;
    db $0D                                                               ;AAF650;
    dw $634C,$C3F6                                                       ;AAF651;
    db $15                                                               ;AAF655;
    dw $635C,$C3F7                                                       ;AAF656;
    db $05                                                               ;AAF65A;
    dw $6350,$C3F7                                                       ;AAF65B;
    db $FD                                                               ;AAF65F;
    dw $6340,$C3FC                                                       ;AAF660;
    db $F7                                                               ;AAF664;
    dw $6308,$C3F4                                                       ;AAF665;
    db $F7                                                               ;AAF669;
    dw $6309,$C3F4                                                       ;AAF66A;
    db $E7                                                               ;AAF66E;
    dw $6306,$C204                                                       ;AAF66F;
    db $E7                                                               ;AAF673;
    dw $6304,$C3F4                                                       ;AAF674;
    db $D7                                                               ;AAF678;
    dw $6302,$C204                                                       ;AAF679;
    db $D7                                                               ;AAF67D;
    dw $6300                                                             ;AAF67E;

Spritemaps_Chozo_24:
    dw $002A,$C3E0                                                       ;AAF680;
    db $98                                                               ;AAF684;
    dw $2344,$C242                                                       ;AAF685;
    db $98                                                               ;AAF689;
    dw $234A,$C232                                                       ;AAF68A;
    db $A0                                                               ;AAF68E;
    dw $2358,$C232                                                       ;AAF68F;
    db $98                                                               ;AAF693;
    dw $2348,$C222                                                       ;AAF694;
    db $A0                                                               ;AAF698;
    dw $235C,$C222                                                       ;AAF699;
    db $98                                                               ;AAF69D;
    dw $234C,$C202                                                       ;AAF69E;
    db $98                                                               ;AAF6A2;
    dw $234E,$C212                                                       ;AAF6A3;
    db $A0                                                               ;AAF6A7;
    dw $2356,$C212                                                       ;AAF6A8;
    db $98                                                               ;AAF6AC;
    dw $2346,$C201                                                       ;AAF6AD;
    db $B8                                                               ;AAF6B1;
    dw $254E,$C211                                                       ;AAF6B2;
    db $C0                                                               ;AAF6B6;
    dw $2556,$C211                                                       ;AAF6B7;
    db $B8                                                               ;AAF6BB;
    dw $2546,$C241                                                       ;AAF6BC;
    db $B8                                                               ;AAF6C0;
    dw $254A,$C231                                                       ;AAF6C1;
    db $C0                                                               ;AAF6C5;
    dw $2558,$C231                                                       ;AAF6C6;
    db $B8                                                               ;AAF6CA;
    dw $2548,$C221                                                       ;AAF6CB;
    db $C0                                                               ;AAF6CF;
    dw $255C,$C221                                                       ;AAF6D0;
    db $B8                                                               ;AAF6D4;
    dw $254C,$C3D8                                                       ;AAF6D5;
    db $F0                                                               ;AAF6D9;
    dw $2577,$C3C8                                                       ;AAF6DA;
    db $F0                                                               ;AAF6DE;
    dw $2575,$C3B8                                                       ;AAF6DF;
    db $F0                                                               ;AAF6E3;
    dw $2573,$C3A0                                                       ;AAF6E4;
    db $F0                                                               ;AAF6E8;
    dw $2570,$C3A8                                                       ;AAF6E9;
    db $F0                                                               ;AAF6ED;
    dw $2571,$C3D8                                                       ;AAF6EE;
    db $E0                                                               ;AAF6F2;
    dw $2377,$C3C8                                                       ;AAF6F3;
    db $E0                                                               ;AAF6F7;
    dw $2375,$C3B8                                                       ;AAF6F8;
    db $E0                                                               ;AAF6FC;
    dw $2373,$C3A8                                                       ;AAF6FD;
    db $E0                                                               ;AAF701;
    dw $2371,$C3A0                                                       ;AAF702;
    db $E0                                                               ;AAF706;
    dw $2370,$C3D0                                                       ;AAF707;
    db $A0                                                               ;AAF70B;
    dw $2352,$C3D0                                                       ;AAF70C;
    db $98                                                               ;AAF710;
    dw $2342,$C3B0                                                       ;AAF711;
    db $A0                                                               ;AAF715;
    dw $6352,$C3B0                                                       ;AAF716;
    db $98                                                               ;AAF71A;
    dw $6342,$C3C0                                                       ;AAF71B;
    db $A0                                                               ;AAF71F;
    dw $2350,$C3C0                                                       ;AAF720;
    db $98                                                               ;AAF724;
    dw $2340,$C3A0                                                       ;AAF725;
    db $98                                                               ;AAF729;
    dw $6344,$C3A1                                                       ;AAF72A;
    db $B8                                                               ;AAF72E;
    dw $6544,$C3B0                                                       ;AAF72F;
    db $B8                                                               ;AAF733;
    dw $6542,$C3B0                                                       ;AAF734;
    db $C0                                                               ;AAF738;
    dw $6552,$C3D0                                                       ;AAF739;
    db $C0                                                               ;AAF73D;
    dw $2552,$C3C0                                                       ;AAF73E;
    db $C0                                                               ;AAF742;
    dw $2550,$C3E0                                                       ;AAF743;
    db $B8                                                               ;AAF747;
    dw $2544,$C3D0                                                       ;AAF748;
    db $B8                                                               ;AAF74C;
    dw $2542,$C3C0                                                       ;AAF74D;
    db $B8                                                               ;AAF751;
    dw $2540                                                             ;AAF752;

Spritemaps_Chozo_25:
    dw $0019,$C238                                                       ;AAF754;
    db $88                                                               ;AAF758;
    dw $230D,$C240                                                       ;AAF759;
    db $80                                                               ;AAF75D;
    dw $230B,$003E                                                       ;AAF75E;
    db $EF                                                               ;AAF762;
    dw $2339,$C236                                                       ;AAF763;
    db $DF                                                               ;AAF767;
    dw $232C,$C246                                                       ;AAF768;
    db $E7                                                               ;AAF76C;
    dw $232A,$C220                                                       ;AAF76D;
    db $DB                                                               ;AAF771;
    dw $232A,$C210                                                       ;AAF772;
    db $DB                                                               ;AAF776;
    dw $2328,$C245                                                       ;AAF777;
    db $C8                                                               ;AAF77B;
    dw $2326,$0045                                                       ;AAF77C;
    db $C0                                                               ;AAF780;
    dw $231F,$C235                                                       ;AAF781;
    db $C0                                                               ;AAF785;
    dw $2324,$C211                                                       ;AAF786;
    db $C0                                                               ;AAF78A;
    dw $2320,$0021                                                       ;AAF78B;
    db $C0                                                               ;AAF78F;
    dw $230F,$C221                                                       ;AAF790;
    db $C8                                                               ;AAF794;
    dw $2322,$C3B7                                                       ;AAF795;
    db $BD                                                               ;AAF799;
    dw $234C,$C3B7                                                       ;AAF79A;
    db $C5                                                               ;AAF79E;
    dw $235C,$C399                                                       ;AAF79F;
    db $D7                                                               ;AAF7A3;
    dw $2350,$C399                                                       ;AAF7A4;
    db $CF                                                               ;AAF7A8;
    dw $2340,$C3DA                                                       ;AAF7A9;
    db $CA                                                               ;AAF7AD;
    dw $2370,$C3E2                                                       ;AAF7AE;
    db $CA                                                               ;AAF7B2;
    dw $2371,$C3F1                                                       ;AAF7B3;
    db $A8                                                               ;AAF7B7;
    dw $2308,$C3F9                                                       ;AAF7B8;
    db $A8                                                               ;AAF7BC;
    dw $2309,$C3F9                                                       ;AAF7BD;
    db $98                                                               ;AAF7C1;
    dw $2306,$C3E9                                                       ;AAF7C2;
    db $98                                                               ;AAF7C6;
    dw $2304,$C3F9                                                       ;AAF7C7;
    db $88                                                               ;AAF7CB;
    dw $2302,$C3E9                                                       ;AAF7CC;
    db $88                                                               ;AAF7D0;
    dw $2300                                                             ;AAF7D1;

Freespace_BankAA_F7D3:                                                   ;AAF7D3;
; $82D bytes
