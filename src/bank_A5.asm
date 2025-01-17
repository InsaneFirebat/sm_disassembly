
org $A58000


CommonA5_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI                                ;A58000;
    RTL                                                                  ;A58004;


CommonA5_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple                            ;A58005;
    RTL                                                                  ;A58009;


CommonA5_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath                                    ;A5800A;
    RTL                                                                  ;A5800E;


CommonA5_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI                                     ;A5800F;
    RTL                                                                  ;A58013;


CommonA5_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility            ;A58014;
    RTL                                                                  ;A58018;


UNUSED_CommonA5_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A58019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy              ;A58019;
    RTL                                                                  ;A5801D;


CommonA5_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate                           ;A5801E;
    RTL                                                                  ;A58022;


CommonA5_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI                                             ;A58023;
    RTL                                                                  ;A58027;


CommonA5_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A58028;
    RTL                                                                  ;A5802C;


CommonA5_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI                                              ;A5802D;
    RTL                                                                  ;A58031;


CommonA5_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A58032;
    RTL                                                                  ;A58036;


CommonA5_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI                                         ;A58037;
    RTL                                                                  ;A5803B;


CommonA5_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A5803C;
    RTL                                                                  ;A58040;


CommonA5_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI                                            ;A58041;
    RTL                                                                  ;A58045;


CommonA5_CreateADudShot:
    JSL.L CreateADudShot                                                 ;A58046;
    RTL                                                                  ;A5804A;


RTS_A5804B:
    RTS                                                                  ;A5804B;


RTL_A5804C:
    RTL                                                                  ;A5804C;


Spritemap_CommonA5_Nothing:
    dw $0000                                                             ;A5804D;

ExtendedSpritemap_CommonA5_Nothing:
    dw $0001,$0000,$0000                                                 ;A5804F;
    dw Spritemap_CommonA5_Nothing                                        ;A58055;
    dw Hitbox_CommonA5_Nothing                                           ;A58057;

Hitbox_CommonA5_Nothing:
    dw $0001,$0000,$0000,$0000,$0000                                     ;A58059;
    dw CommonA5_NormalEnemyTouchAI                                       ;A58063;
    dw CommonA5_NormalEnemyShotAI                                        ;A58065;

InstList_CommonA5_DeleteEnemy:
    dw Instruction_CommonA5_DeleteEnemy                                  ;A58067;

NOPNOP_A58069:
    NOP                                                                  ;A58069;
    NOP                                                                  ;A5806A;

Instruction_CommonA5_Enemy0FB2_InY:
    LDA.W $0000,Y                                                        ;A5806B;
    STA.W $0FB2,X                                                        ;A5806E;
    INY                                                                  ;A58071;
    INY                                                                  ;A58072;
    RTL                                                                  ;A58073;


Instruction_CommonA5_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A5807B                                                    ;A58074;
    STA.W $0FB2,X                                                        ;A58077;
    RTL                                                                  ;A5807A;


RTS_A5807B:
    RTS                                                                  ;A5807B;


Instruction_CommonA5_DeleteEnemy:
    LDA.W $0F86,X                                                        ;A5807C;
    ORA.W #$0200                                                         ;A5807F;
    STA.W $0F86,X                                                        ;A58082;
    PLA                                                                  ;A58085;
    PEA.W ProcessEnemyInstructions_return-1                              ;A58086;
    RTL                                                                  ;A58089;


Instruction_CommonA5_CallFunctionInY:
    LDA.W $0000,Y                                                        ;A5808A;
    STA.B $12                                                            ;A5808D;
    PHY                                                                  ;A5808F;
    PHX                                                                  ;A58090;
    PEA.W .manualReturn-1                                                ;A58091;
    JMP.W ($0012)                                                        ;A58094;


.manualReturn:
    PLX                                                                  ;A58097;
    PLY                                                                  ;A58098;
    INY                                                                  ;A58099;
    INY                                                                  ;A5809A;
    RTL                                                                  ;A5809B;


Instruction_CommonA5_CallFunctionInY_WithA:
    LDA.W $0000,Y                                                        ;A5809C;
    STA.B $12                                                            ;A5809F;
    LDA.W $0002,Y                                                        ;A580A1;
    PHY                                                                  ;A580A4;
    PHX                                                                  ;A580A5;
    PEA.W .manualReturn-1                                                ;A580A6;
    JMP.W ($0012)                                                        ;A580A9;


.manualReturn:
    PLX                                                                  ;A580AC;
    PLY                                                                  ;A580AD;
    TYA                                                                  ;A580AE;
    CLC                                                                  ;A580AF;
    ADC.W #$0004                                                         ;A580B0;
    TAY                                                                  ;A580B3;
    RTL                                                                  ;A580B4;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_CommonA5_CallExternalFunctionInY_A580B5:
    LDA.W $0000,Y                                                        ;A580B5;
    STA.B $12                                                            ;A580B8;
    LDA.W $0001,Y                                                        ;A580BA;
    STA.B $13                                                            ;A580BD;
    PHX                                                                  ;A580BF;
    PHY                                                                  ;A580C0;
    JSL.L .externalFunction                                              ;A580C1;
    PLY                                                                  ;A580C5;
    PLX                                                                  ;A580C6;
    INY                                                                  ;A580C7;
    INY                                                                  ;A580C8;
    INY                                                                  ;A580C9;
    RTL                                                                  ;A580CA;


.externalFunction:
    JML.W [$0012]                                                        ;A580CB;


UNUSED_Inst_CommonA5_CallExternalFunctionInY_WithA_A580CE:
    LDA.W $0000,Y                                                        ;A580CE;
    STA.B $12                                                            ;A580D1;
    LDA.W $0001,Y                                                        ;A580D3;
    STA.B $13                                                            ;A580D6;
    LDA.W $0003,Y                                                        ;A580D8;
    PHX                                                                  ;A580DB;
    PHY                                                                  ;A580DC;
    JSL.L .externalFunction                                              ;A580DD;
    PLY                                                                  ;A580E1;
    PLX                                                                  ;A580E2;
    TYA                                                                  ;A580E3;
    CLC                                                                  ;A580E4;
    ADC.W #$0005                                                         ;A580E5;
    TAY                                                                  ;A580E8;
    RTL                                                                  ;A580E9;


.externalFunction:
    JML.W [$0012]                                                        ;A580EA;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_CommonA5_GotoY:
    LDA.W $0000,Y                                                        ;A580ED;
    TAY                                                                  ;A580F0;
    RTL                                                                  ;A580F1;


Instruction_CommonA5_GotoY_PlusY:
    STY.B $12                                                            ;A580F2;
    DEY                                                                  ;A580F4;
    LDA.W $0000,Y                                                        ;A580F5;
    XBA                                                                  ;A580F8;
    BMI .highByte                                                        ;A580F9;
    AND.W #$00FF                                                         ;A580FB;
    BRA +                                                                ;A580FE;


.highByte:
    ORA.W #$FF00                                                         ;A58100;

  + CLC                                                                  ;A58103;
    ADC.B $12                                                            ;A58104;
    TAY                                                                  ;A58106;
    RTL                                                                  ;A58107;


Instruction_CommonA5_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X                                                        ;A58108;
    BNE Instruction_CommonA5_GotoY                                       ;A5810B;
    INY                                                                  ;A5810D;
    INY                                                                  ;A5810E;
    RTL                                                                  ;A5810F;


Instruction_CommonA5_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X                                                        ;A58110;
    BNE Instruction_CommonA5_GotoY                                       ;A58113;
    INY                                                                  ;A58115;
    INY                                                                  ;A58116;
    RTL                                                                  ;A58117;


Instruction_CommonA5_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20                                                             ;A58118;
    DEC.W $0F90,X                                                        ;A5811A;
    REP #$20                                                             ;A5811D;
    BNE Instruction_CommonA5_GotoY_PlusY                                 ;A5811F;
    INY                                                                  ;A58121;
    RTL                                                                  ;A58122;


Instruction_CommonA5_TimerInY:
    LDA.W $0000,Y                                                        ;A58123;
    STA.W $0F90,X                                                        ;A58126;
    INY                                                                  ;A58129;
    INY                                                                  ;A5812A;
    RTL                                                                  ;A5812B;


Instruction_CommonA5_SkipNextInstruction:
    INY                                                                  ;A5812C;
    INY                                                                  ;A5812D;
    RTL                                                                  ;A5812E;


Instruction_CommonA5_Sleep:
    DEY                                                                  ;A5812F;
    DEY                                                                  ;A58130;
    TYA                                                                  ;A58131;
    STA.W $0F92,X                                                        ;A58132;
    PLA                                                                  ;A58135;
    PEA.W ProcessEnemyInstructions_return-1                              ;A58136;
    RTL                                                                  ;A58139;


Instruction_CommonA5_WaitYFrames:
    LDA.W $0000,Y                                                        ;A5813A;
    STA.W $0F94,X                                                        ;A5813D;
    INY                                                                  ;A58140;
    INY                                                                  ;A58141;
    TYA                                                                  ;A58142;
    STA.W $0F92,X                                                        ;A58143;
    PLA                                                                  ;A58146;
    PEA.W ProcessEnemyInstructions_return-1                              ;A58147;
    RTL                                                                  ;A5814A;


Instruction_CommonA5_TransferYBytesInYToVRAM:
    PHX                                                                  ;A5814B;
    LDX.W $0330                                                          ;A5814C;
    LDA.W $0000,Y                                                        ;A5814F;
    STA.B $D0,X                                                          ;A58152;
    LDA.W $0002,Y                                                        ;A58154;
    STA.B $D2,X                                                          ;A58157;
    LDA.W $0003,Y                                                        ;A58159;
    STA.B $D3,X                                                          ;A5815C;
    LDA.W $0005,Y                                                        ;A5815E;
    STA.B $D5,X                                                          ;A58161;
    TXA                                                                  ;A58163;
    CLC                                                                  ;A58164;
    ADC.W #$0007                                                         ;A58165;
    STA.W $0330                                                          ;A58168;
    TYA                                                                  ;A5816B;
    CLC                                                                  ;A5816C;
    ADC.W #$0007                                                         ;A5816D;
    TAY                                                                  ;A58170;
    PLX                                                                  ;A58171;
    RTL                                                                  ;A58172;


Instruction_CommonA5_EnableOffScreenProcessing:
    LDA.W $0F86,X                                                        ;A58173;
    ORA.W #$0800                                                         ;A58176;
    STA.W $0F86,X                                                        ;A58179;
    RTL                                                                  ;A5817C;


Instruction_CommonA5_DisableOffScreenProcessing:
    LDA.W $0F86,X                                                        ;A5817D;
    AND.W #$F7FF                                                         ;A58180;
    STA.W $0F86,X                                                        ;A58183;
    RTL                                                                  ;A58186;


CommonA5EnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000                   ;A5818B;
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000                   ;A5819B;
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000                   ;A581AB;
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000                   ;A581BB;
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000                   ;A581CB;
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000                   ;A581DB;
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000                   ;A581EB;
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000                   ;A581FB;
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000                   ;A5820B;
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000                   ;A5821B;
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000                   ;A5822B;
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000                   ;A5823B;
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000                   ;A5824B;
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000                   ;A5825B;
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000                   ;A5826B;
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000                   ;A5827B;
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000                   ;A5828B;
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000                   ;A5829B;
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000                   ;A582AB;
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000                   ;A582BB;
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000                   ;A582CB;
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000                   ;A582DB;
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000                   ;A582EB;
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000                   ;A582FB;
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000                   ;A5830B;
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000                   ;A5831B;
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000                   ;A5832B;
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000                   ;A5833B;
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000                   ;A5834B;
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000                   ;A5835B;
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000                   ;A5836B;
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000                   ;A5837B;
    dw $0004,$0000,$FFFC,$0000                                           ;A5838B;

CommonA5EnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF                   ;A5838F;
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF                   ;A5839F;
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF                   ;A583AF;
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF                   ;A583BF;
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF                   ;A583CF;
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF                   ;A583DF;
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF                   ;A583EF;
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF                   ;A583FF;
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF                   ;A5840F;
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF                   ;A5841F;
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF                   ;A5842F;
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE                   ;A5843F;
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE                   ;A5844F;
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE                   ;A5845F;
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE                   ;A5846F;
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE                   ;A5847F;
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD                   ;A5848F;
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD                   ;A5849F;
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD                   ;A584AF;
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC                   ;A584BF;
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC                   ;A584CF;
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC                   ;A584DF;
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB                   ;A584EF;
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB                   ;A584FF;
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB                   ;A5850F;
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA                   ;A5851F;
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA                   ;A5852F;
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9                   ;A5853F;
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9                   ;A5854F;
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9                   ;A5855F;
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8                   ;A5856F;
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8                   ;A5857F;
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7                   ;A5858F;
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7                   ;A5859F;
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6                   ;A585AF;
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6                   ;A585BF;
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5                   ;A585CF;
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4                   ;A585DF;
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4                   ;A585EF;
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3                   ;A585FF;
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3                   ;A5860F;
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2                   ;A5861F;
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1                   ;A5862F;
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1                   ;A5863F;
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0                   ;A5864F;
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF                   ;A5865F;
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE                   ;A5866F;
    dw $74F9,$0011,$8B07,$FFEE                                           ;A5867F;

InitAI_DraygonBody:
    LDX.W #$0030                                                         ;A58687;

.loopTargetPalette:
    LDA.W Palette_Draygon_Sprite1,X                                      ;A5868A;
    STA.L $7EC320,X                                                      ;A5868D;
    DEX                                                                  ;A58691;
    DEX                                                                  ;A58692;
    BPL .loopTargetPalette                                               ;A58693;
    LDX.W #$0FFE                                                         ;A58695;
    LDA.W #$0338                                                         ;A58698;

.loopBG2Tilemap:
    STA.L $7E2000,X                                                      ;A5869B;
    DEX                                                                  ;A5869F;
    DEX                                                                  ;A586A0;
    BPL .loopBG2Tilemap                                                  ;A586A1;
    LDX.W $0E54                                                          ;A586A3;
    LDA.W #$0700                                                         ;A586A6;
    ASL A                                                                ;A586A9;
    STA.W $0F96,X                                                        ;A586AA;
    LDA.W #$00A5                                                         ;A586AD;
    STA.W $178E                                                          ;A586B0;
    LDA.W #EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll                 ;A586B3;
    STA.W $178C                                                          ;A586B6;
    LDA.W #$FFFF                                                         ;A586B9;
    STA.W $183C                                                          ;A586BC;
    LDA.W #InstList_DraygonBody_FacingLeft_Idle                          ;A586BF;
    STA.W $0F92                                                          ;A586C2;
    LDA.W #InstList_DraygonEye_FacingLeft_Idle                           ;A586C5;
    STA.W $0FD2                                                          ;A586C8;
    LDA.W #InstList_DraygonTail_FacingLeft_FakeTailWhip                  ;A586CB;
    STA.W $1012                                                          ;A586CE;
    LDA.W #InstList_DraygonArms_FacingLeft_NearSwoopApex                 ;A586D1;
    STA.W $1052                                                          ;A586D4;
    LDA.W #$0400                                                         ;A586D7;
    STA.W $179A                                                          ;A586DA;
    LDA.W #Function_DraygonBody_FightIntro_InitialDelay                  ;A586DD;
    STA.W $0FA8,X                                                        ;A586E0;
    JSL.L Spawn_DraygonMainScreenLayers_HDMAObject                       ;A586E3;
    LDA.W #$000C                                                         ;A586E7;
    STA.B $A9                                                            ;A586EA;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;A586EC;
    LDA.W #$0001                                                         ;A586F0;
    STA.L $7E880A                                                        ;A586F3;
    JSL.L DisableMinimap_MarkBossRoomTilesExplored                       ;A586F7;
    RTL                                                                  ;A586FB;


MainAI_DraygonBody:
    LDX.W $0E54                                                          ;A586FC;
    JSR.W ($0FA8,X)                                                      ;A586FF;
    LDA.W $0F7A                                                          ;A58702;
    STA.W $0FBA                                                          ;A58705;
    STA.W $0FFA                                                          ;A58708;
    STA.W $103A                                                          ;A5870B;
    LDA.W $0F7E                                                          ;A5870E;
    STA.W $0FBE                                                          ;A58711;
    STA.W $0FFE                                                          ;A58714;
    STA.W $103E                                                          ;A58717;
    RTL                                                                  ;A5871A;


Function_DraygonBody_FightIntro_InitialDelay:
    JSR.W HandleFiringWallTurret                                         ;A5871B;
    LDX.W $0E54                                                          ;A5871E; >.<
    LDA.W $0FAA                                                          ;A58721;
    CMP.W #$0100                                                         ;A58724;
    BPL .done                                                            ;A58727;
    LDA.W $0FAA                                                          ;A58729;
    BNE .incFunctionTimer                                                ;A5872C;
    LDX.W $0330                                                          ;A5872E;
    LDA.W #$0600                                                         ;A58731;
    STA.B $D0,X                                                          ;A58734;
    LDA.W #Tiles_Evir                                                    ;A58736;
    STA.B $D2,X                                                          ;A58739;
    LDA.W #Tiles_Evir>>16                                                ;A5873B;
    STA.B $D4,X                                                          ;A5873E;
    LDA.W #$6D00                                                         ;A58740;
    STA.B $D5,X                                                          ;A58743;
    LDA.W $0330                                                          ;A58745;
    CLC                                                                  ;A58748;
    ADC.W #$0007                                                         ;A58749;
    STA.W $0330                                                          ;A5874C;
    JSR.W SpawnFightIntroEvirSpriteObjects                               ;A5874F;

.incFunctionTimer:
    INC.W $0FAA                                                          ;A58752;
    RTS                                                                  ;A58755;


.done:
    LDA.W #Function_DraygonBody_FightIntro_Dance                         ;A58756;
    STA.W $0FA8                                                          ;A58759;
    STZ.W $0FAA                                                          ;A5875C;
    LDA.W $0F7A                                                          ;A5875F;
    STA.L $7E7800                                                        ;A58762;
    CLC                                                                  ;A58766;
    ADC.W #$02A0                                                         ;A58767;
    STA.L $7E7804                                                        ;A5876A;
    LDA.W $0F7E                                                          ;A5876E;
    STA.L $7E7802                                                        ;A58771;
    LDA.L $7E7800                                                        ;A58775;
    STA.W $0F7A                                                          ;A58779; >.<
    LDA.L $7E7802                                                        ;A5877C;
    STA.W $0F7E                                                          ;A58780; >.<
    LDA.W #$0018                                                         ;A58783;
    STA.L $7E781E                                                        ;A58786;
    RTS                                                                  ;A5878A;


Function_DraygonBody_FightIntro_Dance:
    JSR.W HandleFiringWallTurret                                         ;A5878B;
    LDX.W $0E54                                                          ;A5878E; >.<
    LDA.W $0FAA                                                          ;A58791;
    CMP.W #$04D0                                                         ;A58794;
    BPL .startFight                                                      ;A58797;
    JSR.W HandleDraygonFightIntroDance                                   ;A58799;
    INC.W $0FAA                                                          ;A5879C;
    RTS                                                                  ;A5879F;


.startFight:
    LDA.W #Function_DraygonBody_SwoopRight_Setup                         ;A587A0;
    STA.W $0FA8                                                          ;A587A3;
    STZ.W $0FAA                                                          ;A587A6;
    RTS                                                                  ;A587A9;


HandleFiringWallTurret:
    LDA.W $05B6                                                          ;A587AA;
    AND.W #$003F                                                         ;A587AD;
    BNE .return                                                          ;A587B0;
    JSL.L GenerateRandomNumber                                           ;A587B2;
    AND.W #$0003                                                         ;A587B6;
    CLC                                                                  ;A587B9;
    ADC.W #$0002                                                         ;A587BA;
    ASL A                                                                ;A587BD;
    TAX                                                                  ;A587BE;
    ASL A                                                                ;A587BF;
    TAY                                                                  ;A587C0;
    LDA.L $7E8800,X                                                      ;A587C1;
    BNE .return                                                          ;A587C5;
    LDA.W .XPosition,Y                                                   ;A587C7;
    STA.B $12                                                            ;A587CA;
    LDA.W .YPosition,Y                                                   ;A587CC;
    STA.B $14                                                            ;A587CF;
    LDY.W #EnemyProjectile_DraygonWallTurret                             ;A587D1;
    LDA.W #$0003                                                         ;A587D4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A587D7;

.return:
    RTS                                                                  ;A587DB;


.XPosition:
    dw $0040                                                             ;A587DC;

.YPosition:
    dw $0060,$0038,$00C0,$0034,$012F,$01CC,$0101,$01CC                   ;A587DE;
    dw $015E,$01BC,$0188                                                 ;A587EE;

Function_DraygonBody_SwoopRight_Setup:
    JSR.W HandleFiringWallTurret                                         ;A587F4;
    LDX.W $0E54                                                          ;A587F7; >.<
    JSR.W CalculateDraygonSwoopYPositions                                ;A587FA;
    LDA.W #Function_DraygonBody_SwoopRight_Descending                    ;A587FD;
    STA.W $0FA8                                                          ;A58800;
    LDA.W #InstList_DraygonBody_FacingRight_Reset                        ;A58803;
    STA.W $0F92                                                          ;A58806;
    LDA.W #$0001                                                         ;A58809;
    STA.W $0F94                                                          ;A5880C;
    LDA.W #$0001                                                         ;A5880F;
    STA.L $7E8000                                                        ;A58812;
    RTS                                                                  ;A58816;


CalculateDraygonSwoopYPositions:
    LDA.W #$0180                                                         ;A58817;
    STA.W $0E28                                                          ;A5881A;
    LDA.W $0E28                                                          ;A5881D; >.<
    STA.W $0E24                                                          ;A58820;
    STZ.W $0E22                                                          ;A58823;
    STZ.W $0E26                                                          ;A58826;

.loop:
    LDX.W $0E54                                                          ;A58829; >.<
    LDA.L $7E781E                                                        ;A5882C;
    CLC                                                                  ;A58830;
    ADC.W $0E22                                                          ;A58831;
    STA.W $0E22                                                          ;A58834;
    XBA                                                                  ;A58837;
    AND.W #$00FF                                                         ;A58838;
    EOR.W #$FFFF                                                         ;A5883B;
    INC A                                                                ;A5883E;
    CLC                                                                  ;A5883F;
    ADC.W $0E24                                                          ;A58840;
    CMP.L $7E7802                                                        ;A58843;
    BMI +                                                                ;A58847;
    STA.W $0E24                                                          ;A58849;
    LDX.W $0E26                                                          ;A5884C;
    STA.L $7E9002,X                                                      ;A5884F;
    INC.W $0E26                                                          ;A58853; >.<
    INC.W $0E26                                                          ;A58856;
    INC.W $0E26                                                          ;A58859;
    INC.W $0E26                                                          ;A5885C;
    LDA.W $0E26                                                          ;A5885F;
    CMP.W #$0800                                                         ;A58862;
    BMI .loop                                                            ;A58865;

.crash:
    BRA .crash                                                           ;A58867;


  + LDA.L $7E7800                                                        ;A58869;
    BMI .leftSideReset                                                   ;A5886D;
    SEC                                                                  ;A5886F;
    SBC.W $0AF6                                                          ;A58870;
    JSL.L NegateA_A0B067                                                 ;A58873;
    BRA +                                                                ;A58877;


.leftSideReset:
    JSL.L NegateA_A0B067                                                 ;A58879;
    CLC                                                                  ;A5887D;
    ADC.W $0AF6                                                          ;A5887E;
    JSL.L NegateA_A0B067                                                 ;A58881;

  + STA.B $2C                                                            ;A58885;
    STZ.B $2A                                                            ;A58887;
    LDA.W $0E26                                                          ;A58889;
    LSR A                                                                ;A5888C;
    LSR A                                                                ;A5888D;
    STA.B $2E                                                            ;A5888E;
    STZ.B $30                                                            ;A58890;
    JSL.L UnsignedDivision_32bit_A0B761                                  ;A58892;
    LDA.B $2C                                                            ;A58896;
    STA.W $0FAE                                                          ;A58898;
    LDA.B $2A                                                            ;A5889B;
    STA.W $0FB0                                                          ;A5889D;
    LDA.W $0F7E                                                          ;A588A0;
    LDX.W $0E26                                                          ;A588A3;
    STA.L $7E9002,X                                                      ;A588A6;
    STX.W $0FAA                                                          ;A588AA;
    STX.W $0FAC                                                          ;A588AD;
    RTS                                                                  ;A588B0;


Function_DraygonBody_SwoopRight_Descending:
    JSR.W HandleFiringWallTurret                                         ;A588B1;
    JSR.W HandleShortDraygonBreathBubbles                                ;A588B4;
    LDY.W $0E54                                                          ;A588B7;
    LDX.W $0FAA                                                          ;A588BA;
    CPX.W #$0068                                                         ;A588BD;
    BNE .notIndex68                                                      ;A588C0;
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex                ;A588C2;
    STA.W $1052                                                          ;A588C5;
    LDA.W #$0001                                                         ;A588C8;
    STA.W $1054                                                          ;A588CB;

.notIndex68:
    LDA.L $7E9002,X                                                      ;A588CE;
    STA.W $0F7E,Y                                                        ;A588D2;
    DEC.W $0FAA                                                          ;A588D5;
    DEC.W $0FAA                                                          ;A588D8;
    DEC.W $0FAA                                                          ;A588DB;
    DEC.W $0FAA                                                          ;A588DE;
    LDA.W $0FAA                                                          ;A588E1;
    BEQ .apex                                                            ;A588E4;
    LDA.W $0F7C                                                          ;A588E6;
    CLC                                                                  ;A588E9;
    ADC.W $0FB0                                                          ;A588EA;
    STA.W $0F7C                                                          ;A588ED;
    LDA.W $0F7A                                                          ;A588F0;
    ADC.W $0FAE                                                          ;A588F3;
    STA.W $0F7A                                                          ;A588F6;
    RTS                                                                  ;A588F9;


.apex:
    LDA.W #Function_DraygonBody_SwoopRight_Apex                          ;A588FA;
    STA.W $0FA8                                                          ;A588FD;
    RTS                                                                  ;A58900;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Draygon_FireGoop_A58901:
    LDA.W $05B6                                                          ;A58901;
    AND.W #$000F                                                         ;A58904;
    BNE .return                                                          ;A58907;
    LDA.W #InstList_DraygonBody_FacingLeft_FireGoop                      ;A58909;
    STA.W $0F92                                                          ;A5890C;
    LDA.L $7E8000                                                        ;A5890F;
    BEQ .keepLeft                                                        ;A58913;
    LDA.W #InstList_DraygonBody_FacingRight_FireGoop                     ;A58915;
    STA.W $0F92                                                          ;A58918;

.keepLeft:
    LDA.W #$0001                                                         ;A5891B;
    STA.W $0F94                                                          ;A5891E;

.return:
    RTS                                                                  ;A58921;
endif ; !FEATURE_KEEP_UNREFERENCED


Function_DraygonBody_SwoopRight_Apex:
    JSR.W HandleFiringWallTurret                                         ;A58922;
    LDX.W $0E54                                                          ;A58925; >.<
    LDA.W #$02A0                                                         ;A58928;
    SEC                                                                  ;A5892B;
    SBC.W $0F7A                                                          ;A5892C;
    STA.B $2C                                                            ;A5892F;
    STZ.B $2A                                                            ;A58931;
    LDA.W $0FAC                                                          ;A58933;
    LSR A                                                                ;A58936;
    LSR A                                                                ;A58937;
    STA.B $2E                                                            ;A58938;
    STZ.B $30                                                            ;A5893A;
    JSL.L UnsignedDivision_32bit_A0B761                                  ;A5893C;
    LDA.B $2C                                                            ;A58940;
    STA.W $0FAE                                                          ;A58942;
    LDA.B $2A                                                            ;A58945;
    STA.W $0FB0                                                          ;A58947;
    LDA.W #Function_DraygonBody_SwoopRight_Ascending                     ;A5894A;
    STA.W $0FA8                                                          ;A5894D;
    RTS                                                                  ;A58950;


Function_DraygonBody_SwoopRight_Ascending:
    JSR.W HandleFiringWallTurret                                         ;A58951;
    LDY.W $0E54                                                          ;A58954;
    LDX.W $0FAA                                                          ;A58957;
    CPX.W #$0068                                                         ;A5895A;
    BNE .notIndex68                                                      ;A5895D;
    LDA.W #InstList_DraygonArms_FacingRight_Idle_0                       ;A5895F;
    STA.W $1052                                                          ;A58962;
    LDA.W #$0001                                                         ;A58965;
    STA.W $1054                                                          ;A58968;

.notIndex68:
    LDA.L $7E9002,X                                                      ;A5896B;
    STA.W $0F7E,Y                                                        ;A5896F;
    INC.W $0FAA                                                          ;A58972;
    INC.W $0FAA                                                          ;A58975;
    INC.W $0FAA                                                          ;A58978;
    INC.W $0FAA                                                          ;A5897B;
    LDA.W $0FAA                                                          ;A5897E;
    CMP.W $0FAC                                                          ;A58981;
    BEQ +                                                                ;A58984;
    LDA.W $0F7C                                                          ;A58986;
    CLC                                                                  ;A58989;
    ADC.W $0FB0                                                          ;A5898A;
    STA.W $0F7C                                                          ;A5898D;
    LDA.W $0F7A                                                          ;A58990;
    ADC.W $0FAE                                                          ;A58993;
    STA.W $0F7A                                                          ;A58996;
    RTS                                                                  ;A58999;


  + STZ.W $0FAA                                                          ;A5899A;
    LDA.W $05E5                                                          ;A5899D;
    AND.W #$0001                                                         ;A589A0;
    BEQ .goopLeft                                                        ;A589A3;
    LDA.W #Function_DraygonBody_SwoopLeft_Setup                          ;A589A5;
    STA.W $0FA8                                                          ;A589A8;
    RTS                                                                  ;A589AB;


.goopLeft:
    LDA.W #Function_DraygonBody_GoopLeft_Setup                           ;A589AC;
    STA.W $0FA8                                                          ;A589AF;
    RTS                                                                  ;A589B2;


Function_DraygonBody_SwoopLeft_Setup:
    JSR.W HandleFiringWallTurret                                         ;A589B3;
    LDX.W $0E54                                                          ;A589B6; >.<
    LDA.L $7E7804                                                        ;A589B9;
    SEC                                                                  ;A589BD;
    SBC.W $0AF6                                                          ;A589BE;
    JSL.L NegateA_A0B067                                                 ;A589C1;
    STA.B $2C                                                            ;A589C5;
    STZ.B $2A                                                            ;A589C7;
    LDA.W $0E26                                                          ;A589C9;
    LSR A                                                                ;A589CC;
    LSR A                                                                ;A589CD;
    STA.B $2E                                                            ;A589CE;
    STZ.B $30                                                            ;A589D0;
    JSL.L UnsignedDivision_32bit_A0B761                                  ;A589D2;
    LDA.B $2C                                                            ;A589D6;
    STA.W $0FAE                                                          ;A589D8;
    LDA.B $2A                                                            ;A589DB;
    STA.W $0FB0                                                          ;A589DD;
    LDA.W #Function_DraygonBody_SwoopLeft_Descending                     ;A589E0;
    STA.W $0FA8                                                          ;A589E3;
    LDA.W #InstList_DraygonBody_FacingLeft_Reset                         ;A589E6;
    STA.W $0F92                                                          ;A589E9;
    LDA.W #$0001                                                         ;A589EC;
    STA.W $0F94                                                          ;A589EF;
    LDA.W #$0000                                                         ;A589F2;
    STA.L $7E8000                                                        ;A589F5;
    LDA.W $0FAC                                                          ;A589F9;
    STA.W $0FAA                                                          ;A589FC;
    RTS                                                                  ;A589FF;


Function_DraygonBody_SwoopLeft_Descending:
    JSR.W HandleFiringWallTurret                                         ;A58A00;
    JSR.W HandleShortDraygonBreathBubbles                                ;A58A03;
    LDY.W $0E54                                                          ;A58A06;
    LDX.W $0FAA                                                          ;A58A09;
    CPX.W #$0068                                                         ;A58A0C;
    BNE .notIndex68                                                      ;A58A0F;
    LDA.W #InstList_DraygonArms_FacingLeft_NearSwoopApex                 ;A58A11;
    STA.W $1052                                                          ;A58A14;
    LDA.W #$0001                                                         ;A58A17;
    STA.W $1054                                                          ;A58A1A;

.notIndex68:
    LDA.L $7E9002,X                                                      ;A58A1D;
    STA.W $0F7E,Y                                                        ;A58A21;
    DEC.W $0FAA                                                          ;A58A24;
    DEC.W $0FAA                                                          ;A58A27;
    DEC.W $0FAA                                                          ;A58A2A;
    DEC.W $0FAA                                                          ;A58A2D;
    LDA.W $0FAA                                                          ;A58A30;
    BEQ .apex                                                            ;A58A33;
    LDA.W $0F7C                                                          ;A58A35;
    SEC                                                                  ;A58A38;
    SBC.W $0FB0                                                          ;A58A39;
    STA.W $0F7C                                                          ;A58A3C;
    LDA.W $0F7A                                                          ;A58A3F;
    SBC.W $0FAE                                                          ;A58A42;
    STA.W $0F7A                                                          ;A58A45;
    RTS                                                                  ;A58A48;


.apex:
    LDA.W #Function_DraygonBody_SwoopLeft_Apex                           ;A58A49;
    STA.W $0FA8                                                          ;A58A4C;
    RTS                                                                  ;A58A4F;


Function_DraygonBody_SwoopLeft_Apex:
    JSR.W HandleFiringWallTurret                                         ;A58A50;
    LDX.W $0E54                                                          ;A58A53; >.<
    LDA.L $7E7800                                                        ;A58A56;
    BMI .leftSideReset                                                   ;A58A5A;
    LDA.W $0F7A                                                          ;A58A5C;
    SEC                                                                  ;A58A5F;
    SBC.L $7E7800                                                        ;A58A60;
    BRA +                                                                ;A58A64;


.leftSideReset:
    EOR.W #$FFFF                                                         ;A58A66;
    INC A                                                                ;A58A69;
    CLC                                                                  ;A58A6A;
    ADC.W $0F7A                                                          ;A58A6B;

  + STA.B $2C                                                            ;A58A6E;
    STZ.B $2A                                                            ;A58A70;
    LDA.W $0FAC                                                          ;A58A72;
    LSR A                                                                ;A58A75;
    LSR A                                                                ;A58A76;
    STA.B $2E                                                            ;A58A77;
    STZ.B $30                                                            ;A58A79;
    JSL.L UnsignedDivision_32bit_A0B761                                  ;A58A7B;
    LDA.B $2C                                                            ;A58A7F;
    STA.W $0FAE                                                          ;A58A81;
    LDA.B $2A                                                            ;A58A84;
    STA.W $0FB0                                                          ;A58A86;
    LDA.W #Function_DraygonBody_SwoopLeft_Ascending                      ;A58A89;
    STA.W $0FA8                                                          ;A58A8C;
    RTS                                                                  ;A58A8F;


Function_DraygonBody_SwoopLeft_Ascending:
    JSR.W HandleFiringWallTurret                                         ;A58A90;
    JSR.W HandleShortDraygonBreathBubbles                                ;A58A93;
    LDY.W $0E54                                                          ;A58A96;
    LDX.W $0FAA                                                          ;A58A99;
    CPX.W #$0068                                                         ;A58A9C;
    BNE +                                                                ;A58A9F;
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0                        ;A58AA1;
    STA.W $1052                                                          ;A58AA4;
    LDA.W #$0001                                                         ;A58AA7;
    STA.W $1054                                                          ;A58AAA;

  + LDA.L $7E9002,X                                                      ;A58AAD;
    STA.W $0F7E,Y                                                        ;A58AB1;
    INC.W $0FAA                                                          ;A58AB4;
    INC.W $0FAA                                                          ;A58AB7;
    INC.W $0FAA                                                          ;A58ABA;
    INC.W $0FAA                                                          ;A58ABD;
    LDA.W $0FAA                                                          ;A58AC0;
    CMP.W $0FAC                                                          ;A58AC3;
    BEQ .chooseAttack                                                    ;A58AC6;
    LDA.W $0F7C                                                          ;A58AC8;
    SEC                                                                  ;A58ACB;
    SBC.W $0FB0                                                          ;A58ACC;
    STA.W $0F7C                                                          ;A58ACF;
    LDA.W $0F7A                                                          ;A58AD2;
    SBC.W $0FAE                                                          ;A58AD5;
    STA.W $0F7A                                                          ;A58AD8;
    RTS                                                                  ;A58ADB;


.chooseAttack:
    LDA.W $05E5                                                          ;A58ADC;
    AND.W #$0001                                                         ;A58ADF;
    BEQ .goop                                                            ;A58AE2;
    LDA.W #Function_DraygonBody_SwoopRight_Setup                         ;A58AE4;
    STA.W $0FA8                                                          ;A58AE7;
    STZ.W $0FAA                                                          ;A58AEA;
    LDA.L $7E7800                                                        ;A58AED;
    STA.W $0F7A                                                          ;A58AF1;
    LDA.L $7E7802                                                        ;A58AF4;
    STA.W $0F7E                                                          ;A58AF8;
    RTS                                                                  ;A58AFB;


.goop:
    LDA.W #Function_DraygonBody_GoopRight_Setup                          ;A58AFC;
    STA.W $0FA8                                                          ;A58AFF;
    LDA.L $7E7800                                                        ;A58B02;
    STA.W $0F7A                                                          ;A58B06;
    RTS                                                                  ;A58B09;


Function_DraygonBody_GoopRight_Setup:
    JSR.W HandleFiringWallTurret                                         ;A58B0A;
    LDA.W #$FFB0                                                         ;A58B0D;
    STA.W $0F7A                                                          ;A58B10;
    LDA.W #$0180                                                         ;A58B13;
    STA.W $0F7E                                                          ;A58B16;
    LDA.W #$0000                                                         ;A58B19;
    STA.W $0FB0                                                          ;A58B1C;
    LDA.W #$0001                                                         ;A58B1F;
    STA.W $0FAE                                                          ;A58B22;
    LDA.W #$0000                                                         ;A58B25;
    STA.L $7E781A                                                        ;A58B28;
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex                ;A58B2C;
    STA.W $1052                                                          ;A58B2F;
    LDA.W #$0001                                                         ;A58B32;
    STA.W $1054                                                          ;A58B35;
    LDA.W #Function_DraygonBody_GoopRight_MoveUntilSamusInRange          ;A58B38;
    STA.W $0FA8                                                          ;A58B3B;
    LDA.W #InstList_DraygonBody_FacingRight_Reset                        ;A58B3E;
    STA.W $0F92                                                          ;A58B41;
    LDA.W #$0001                                                         ;A58B44;
    STA.W $0F94                                                          ;A58B47;
    LDA.W #$0001                                                         ;A58B4A;
    STA.L $7E8000                                                        ;A58B4D;
    RTS                                                                  ;A58B51;


Function_DraygonBody_GoopRight_MoveUntilSamusInRange:
    JSR.W HandleFiringWallTurret                                         ;A58B52;
    JSR.W HandleShortDraygonBreathBubbles                                ;A58B55;
    LDA.W $0F7A                                                          ;A58B58;
    SEC                                                                  ;A58B5B;
    SBC.W $0AF6                                                          ;A58B5C;
    JSL.L NegateA_A0B067                                                 ;A58B5F;
    CMP.W #$00D0                                                         ;A58B63;
    BPL .tooFar                                                          ;A58B66;
    LDA.W #Function_DraygonBody_GoopRight_FiringGoops                    ;A58B68;
    STA.W $0FA8                                                          ;A58B6B;
    LDA.W #$0010                                                         ;A58B6E;
    STA.L $7E7806                                                        ;A58B71;
    RTS                                                                  ;A58B75;


.tooFar:
    LDA.W #$0020                                                         ;A58B76;
    STA.W $0E32                                                          ;A58B79;
    LDA.L $7E781A                                                        ;A58B7C;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58B80;
    CLC                                                                  ;A58B84;
    ADC.W #$0180                                                         ;A58B85;
    STA.W $0F7E                                                          ;A58B88;
    LDA.L $7E781A                                                        ;A58B8B;
    CLC                                                                  ;A58B8F;
    ADC.W #$0001                                                         ;A58B90;
    AND.W #$00FF                                                         ;A58B93;
    STA.L $7E781A                                                        ;A58B96;
    LDA.W $0F7C                                                          ;A58B9A;
    CLC                                                                  ;A58B9D;
    ADC.W $0FB0                                                          ;A58B9E;
    STA.W $0F7C                                                          ;A58BA1;
    LDA.W $0F7A                                                          ;A58BA4;
    ADC.W $0FAE                                                          ;A58BA7;
    STA.W $0F7A                                                          ;A58BAA;
    RTS                                                                  ;A58BAD;


Function_DraygonBody_GoopRight_FiringGoops:
    JSR.W HandleFiringWallTurret                                         ;A58BAE;
    LDA.W $0A66                                                          ;A58BB1;
    BNE .SamusGooped                                                     ;A58BB4;
    LDA.W $05E5                                                          ;A58BB6;
    AND.W #$000F                                                         ;A58BB9;
    BNE .noGoop                                                          ;A58BBC;
    LDA.L $7E7806                                                        ;A58BBE;
    DEC A                                                                ;A58BC2;
    STA.L $7E7806                                                        ;A58BC3;
    BEQ .reloadSpeedDivisor                                              ;A58BC7;
    LDY.W #InstList_DraygonBody_FacingRight_FireGoop                     ;A58BC9;
    STY.W $0F92                                                          ;A58BCC;
    LDA.W #$0001                                                         ;A58BCF;
    STA.W $0F94                                                          ;A58BD2;

.noGoop:
    LDA.W #$0020                                                         ;A58BD5;
    STA.W $0E32                                                          ;A58BD8;
    LDA.L $7E781A                                                        ;A58BDB;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58BDF;
    CLC                                                                  ;A58BE3;
    ADC.W #$0180                                                         ;A58BE4;
    STA.W $0F7E                                                          ;A58BE7;
    LDA.L $7E781A                                                        ;A58BEA;
    CLC                                                                  ;A58BEE;
    ADC.W #$0001                                                         ;A58BEF;
    AND.W #$00FF                                                         ;A58BF2;
    STA.L $7E781A                                                        ;A58BF5;
    LDA.W $0F7C                                                          ;A58BF9;
    CLC                                                                  ;A58BFC;
    ADC.W $0FB0                                                          ;A58BFD;
    STA.W $0F7C                                                          ;A58C00;
    LDA.W $0F7A                                                          ;A58C03;
    ADC.W $0FAE                                                          ;A58C06;
    STA.W $0F7A                                                          ;A58C09;
    BMI .return                                                          ;A58C0C;
    CMP.W #$02A0                                                         ;A58C0E;
    BPL .reloadSpeedDivisor                                              ;A58C11;

.return:
    RTS                                                                  ;A58C13;


.reloadSpeedDivisor:
    LDA.W $0A66                                                          ;A58C14;
    BEQ .done                                                            ;A58C17;

.SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus                               ;A58C19;
    STA.W $0FA8                                                          ;A58C1C;
    RTS                                                                  ;A58C1F;


.done:
    LDA.W #InstList_DraygonArms_FacingRight_Idle_0                       ;A58C20;
    STA.W $1052                                                          ;A58C23;
    LDA.W #$0001                                                         ;A58C26;
    STA.W $1054                                                          ;A58C29;
    LDA.W #Function_DraygonBody_GoopRight_MoveUntilOffScreen             ;A58C2C;
    STA.W $0FA8                                                          ;A58C2F;
    RTS                                                                  ;A58C32;


Function_DraygonBody_GoopRight_MoveUntilOffScreen:
    JSR.W HandleShortDraygonBreathBubbles                                ;A58C33;
    LDA.W #$0020                                                         ;A58C36;
    STA.W $0E32                                                          ;A58C39;
    LDA.L $7E781A                                                        ;A58C3C;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58C40;
    CLC                                                                  ;A58C44;
    ADC.W #$0180                                                         ;A58C45;
    STA.W $0F7E                                                          ;A58C48;
    LDA.L $7E781A                                                        ;A58C4B;
    CLC                                                                  ;A58C4F;
    ADC.W #$0001                                                         ;A58C50;
    AND.W #$00FF                                                         ;A58C53;
    STA.L $7E781A                                                        ;A58C56;
    LDA.W $0F7C                                                          ;A58C5A;
    CLC                                                                  ;A58C5D;
    ADC.W $0FB0                                                          ;A58C5E;
    STA.W $0F7C                                                          ;A58C61;
    LDA.W $0F7A                                                          ;A58C64;
    ADC.W $0FAE                                                          ;A58C67;
    STA.W $0F7A                                                          ;A58C6A;
    BMI .return                                                          ;A58C6D;
    CMP.W #$02A0                                                         ;A58C6F;
    BPL .done                                                            ;A58C72;

.return:
    RTS                                                                  ;A58C74;


.done:
    LDA.W #Function_DraygonBody_SwoopLeft_Setup                          ;A58C75;
    STA.W $0FA8                                                          ;A58C78;
    LDA.W #$0250                                                         ;A58C7B;
    STA.W $0F7A                                                          ;A58C7E;
    LDA.W #$FFB0                                                         ;A58C81;
    STA.W $0F7E                                                          ;A58C84;
    LDA.W $0FAC                                                          ;A58C87;
    STA.W $0FAA                                                          ;A58C8A;
    RTS                                                                  ;A58C8D;


Function_DraygonBody_GoopLeft_Setup:
    LDA.L $7E7804                                                        ;A58C8E;
    STA.W $0F7A                                                          ;A58C92;
    LDA.W #$0180                                                         ;A58C95;
    STA.W $0F7E                                                          ;A58C98;
    LDA.W #$0000                                                         ;A58C9B;
    STA.W $0FB0                                                          ;A58C9E;
    LDA.W #$0001                                                         ;A58CA1;
    STA.W $0FAE                                                          ;A58CA4;
    LDA.W #$0000                                                         ;A58CA7;
    STA.L $7E781A                                                        ;A58CAA;
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex                ;A58CAE;
    STA.W $1052                                                          ;A58CB1;
    LDA.W #$0001                                                         ;A58CB4;
    STA.W $1054                                                          ;A58CB7;
    LDA.W #Function_DraygonBody_GoopLeft_MoveUntilSamusInRange           ;A58CBA;
    STA.W $0FA8                                                          ;A58CBD;
    LDA.W #InstList_DraygonBody_FacingLeft_Reset                         ;A58CC0;
    STA.W $0F92                                                          ;A58CC3;
    LDA.W #$0001                                                         ;A58CC6;
    STA.W $0F94                                                          ;A58CC9;
    LDA.W #$0000                                                         ;A58CCC;
    STA.L $7E8000                                                        ;A58CCF;
    RTS                                                                  ;A58CD3;


Function_DraygonBody_GoopLeft_MoveUntilSamusInRange:
    JSR.W HandleFiringWallTurret                                         ;A58CD4;
    JSR.W HandleShortDraygonBreathBubbles                                ;A58CD7;
    LDA.W $0F7A                                                          ;A58CDA;
    SEC                                                                  ;A58CDD;
    SBC.W $0AF6                                                          ;A58CDE;
    JSL.L NegateA_A0B067                                                 ;A58CE1;
    CMP.W #$00D0                                                         ;A58CE5;
    BPL .tooFar                                                          ;A58CE8;
    LDA.W #Function_DraygonBody_GoopLeft_FiringGoops                     ;A58CEA;
    STA.W $0FA8                                                          ;A58CED;
    LDA.W #$0010                                                         ;A58CF0;
    STA.L $7E7806                                                        ;A58CF3;
    RTS                                                                  ;A58CF7;


.tooFar:
    LDA.W #$0020                                                         ;A58CF8;
    STA.W $0E32                                                          ;A58CFB;
    LDA.L $7E781A                                                        ;A58CFE;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58D02;
    CLC                                                                  ;A58D06;
    ADC.W #$0180                                                         ;A58D07;
    STA.W $0F7E                                                          ;A58D0A;
    LDA.L $7E781A                                                        ;A58D0D;
    CLC                                                                  ;A58D11;
    ADC.W #$0001                                                         ;A58D12;
    AND.W #$00FF                                                         ;A58D15;
    STA.L $7E781A                                                        ;A58D18;
    LDA.W $0F7C                                                          ;A58D1C;
    SEC                                                                  ;A58D1F;
    SBC.W $0FB0                                                          ;A58D20;
    STA.W $0F7C                                                          ;A58D23;
    LDA.W $0F7A                                                          ;A58D26;
    SBC.W $0FAE                                                          ;A58D29;
    STA.W $0F7A                                                          ;A58D2C;
    RTS                                                                  ;A58D2F;


Function_DraygonBody_GoopLeft_FiringGoops:
    LDA.W $0A66                                                          ;A58D30;
    BNE .SamusGooped                                                     ;A58D33;
    LDA.W $05E5                                                          ;A58D35;
    AND.W #$000F                                                         ;A58D38;
    BNE .noGoop                                                          ;A58D3B;
    LDA.L $7E7806                                                        ;A58D3D;
    DEC A                                                                ;A58D41;
    STA.L $7E7806                                                        ;A58D42;
    BEQ .reloadSpeedDivisor                                              ;A58D46;
    LDY.W #InstList_DraygonBody_FacingLeft_FireGoop                      ;A58D48;
    STY.W $0F92                                                          ;A58D4B;
    LDA.W #$0001                                                         ;A58D4E;
    STA.W $0F94                                                          ;A58D51;

.noGoop:
    LDA.W #$0020                                                         ;A58D54;
    STA.W $0E32                                                          ;A58D57;
    LDA.L $7E781A                                                        ;A58D5A;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58D5E;
    CLC                                                                  ;A58D62;
    ADC.W #$0180                                                         ;A58D63;
    STA.W $0F7E                                                          ;A58D66;
    LDA.L $7E781A                                                        ;A58D69;
    CLC                                                                  ;A58D6D;
    ADC.W #$0001                                                         ;A58D6E;
    AND.W #$00FF                                                         ;A58D71;
    STA.L $7E781A                                                        ;A58D74;
    LDA.W $0F7C                                                          ;A58D78;
    SEC                                                                  ;A58D7B;
    SBC.W $0FB0                                                          ;A58D7C;
    STA.W $0F7C                                                          ;A58D7F;
    LDA.W $0F7A                                                          ;A58D82;
    SBC.W $0FAE                                                          ;A58D85;
    STA.W $0F7A                                                          ;A58D88;
    BPL .return                                                          ;A58D8B;
    CMP.W #$FFB0                                                         ;A58D8D;
    BMI .reloadSpeedDivisor                                              ;A58D90;

.return:
    RTS                                                                  ;A58D92;


.reloadSpeedDivisor:
    LDA.W $0A66                                                          ;A58D93;
    BEQ .done                                                            ;A58D96;

.SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus                               ;A58D98;
    STA.W $0FA8                                                          ;A58D9B;
    RTS                                                                  ;A58D9E;


.done:
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0                        ;A58D9F;
    STA.W $1052                                                          ;A58DA2;
    LDA.W #$0001                                                         ;A58DA5;
    STA.W $1054                                                          ;A58DA8;
    LDA.W #Function_DraygonBody_GoopLeft_MoveUntilOffScreen              ;A58DAB;
    STA.W $0FA8                                                          ;A58DAE;
    RTS                                                                  ;A58DB1;


Function_DraygonBody_GoopLeft_MoveUntilOffScreen:
    JSR.W HandleShortDraygonBreathBubbles                                ;A58DB2;
    LDA.W $0A66                                                          ;A58DB5;
    BNE .SamusGooped                                                     ;A58DB8;
    LDA.W #$0020                                                         ;A58DBA;
    STA.W $0E32                                                          ;A58DBD;
    LDA.L $7E781A                                                        ;A58DC0;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A58DC4;
    CLC                                                                  ;A58DC8;
    ADC.W #$0180                                                         ;A58DC9;
    STA.W $0F7E                                                          ;A58DCC;
    LDA.L $7E781A                                                        ;A58DCF;
    CLC                                                                  ;A58DD3;
    ADC.W #$0001                                                         ;A58DD4;
    AND.W #$00FF                                                         ;A58DD7;
    STA.L $7E781A                                                        ;A58DDA;
    LDA.W $0F7C                                                          ;A58DDE;
    SEC                                                                  ;A58DE1;
    SBC.W $0FB0                                                          ;A58DE2;
    STA.W $0F7C                                                          ;A58DE5;
    LDA.W $0F7A                                                          ;A58DE8;
    SBC.W $0FAE                                                          ;A58DEB;
    STA.W $0F7A                                                          ;A58DEE;
    BPL .return                                                          ;A58DF1;
    CMP.W #$FFB0                                                         ;A58DF3;
    BMI .done                                                            ;A58DF6;

.return:
    RTS                                                                  ;A58DF8;


.SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus                               ;A58DF9;
    STA.W $0FA8                                                          ;A58DFC;
    RTS                                                                  ;A58DFF;


.done:
    LDA.W #Function_DraygonBody_SwoopRight_Setup                         ;A58E00;
    STA.W $0FA8                                                          ;A58E03;
    LDA.W #$FFB0                                                         ;A58E06;
    STA.W $0F7A                                                          ;A58E09;
    LDA.W #$FFB0                                                         ;A58E0C;
    STA.W $0F7E                                                          ;A58E0F;
    LDA.W $0FAC                                                          ;A58E12;
    STA.W $0FAA                                                          ;A58E15;
    RTS                                                                  ;A58E18;


Function_DraygonBody_ChaseSamus:
    JSR.W HandleFiringWallTurret                                         ;A58E19;
    LDA.W $0A66                                                          ;A58E1C;
    BNE .SamusStillGooped                                                ;A58E1F;
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp               ;A58E21;
    STA.W $0FA8                                                          ;A58E24;
    RTS                                                                  ;A58E27;


.SamusStillGooped:
    LDA.W $0F86                                                          ;A58E28;
    ORA.W #$0400                                                         ;A58E2B;
    STA.W $0F86                                                          ;A58E2E;
    LDY.W #$0008                                                         ;A58E31;
    LDA.L $7E8000                                                        ;A58E34;
    BNE .notLeft                                                         ;A58E38;
    LDY.W #$FFF8                                                         ;A58E3A;

.notLeft:
    TYA                                                                  ;A58E3D;
    CLC                                                                  ;A58E3E;
    ADC.W $0F7A                                                          ;A58E3F;
    SEC                                                                  ;A58E42;
    SBC.W $0AF6                                                          ;A58E43;
    JSL.L NegateA_A0B067                                                 ;A58E46;
    CMP.W #$0008                                                         ;A58E4A;
    BPL .notGrabbed                                                      ;A58E4D;
    LDA.W $0F7E                                                          ;A58E4F;
    SEC                                                                  ;A58E52;
    SBC.W $0AFA                                                          ;A58E53;
    JSL.L NegateA_A0B067                                                 ;A58E56;
    CMP.W #$0008                                                         ;A58E5A;
    BPL .notGrabbed                                                      ;A58E5D;
    BRA .grab                                                            ;A58E5F;


.notGrabbed:
    LDA.W $0AF6                                                          ;A58E61;
    SEC                                                                  ;A58E64;
    SBC.W $0F7A                                                          ;A58E65;
    STA.B $12                                                            ;A58E68;
    LDA.W $0AFA                                                          ;A58E6A;
    SEC                                                                  ;A58E6D;
    SBC.W $0F7E                                                          ;A58E6E;
    STA.B $14                                                            ;A58E71;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A58E73;
    EOR.W #$00FF                                                         ;A58E77;
    INC A                                                                ;A58E7A;
    CLC                                                                  ;A58E7B;
    ADC.W #$0040                                                         ;A58E7C;
    AND.W #$00FF                                                         ;A58E7F;
    STA.W $0E20                                                          ;A58E82;
    STA.B $12                                                            ;A58E85;
    LDA.W #$0002                                                         ;A58E87;
    STA.B $14                                                            ;A58E8A;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A58E8C; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16                                                            ;A58E90;
    STA.W $0E24                                                          ;A58E92;
    LDA.B $18                                                            ;A58E95;
    STA.W $0E26                                                          ;A58E97;
    LDA.B $1A                                                            ;A58E9A;
    STA.W $0E28                                                          ;A58E9C;
    LDA.B $1C                                                            ;A58E9F;
    STA.W $0E2A                                                          ;A58EA1;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A58EA4;
    RTS                                                                  ;A58EA8;


.grab:
    LDY.W #InstList_DraygonArms_FacingLeft_Grab                          ;A58EA9;
    LDA.L $7E8000                                                        ;A58EAC;
    BEQ .keepLeft                                                        ;A58EB0;
    LDY.W #InstList_DraygonArms_FacingRight_Grab                         ;A58EB2;

.keepLeft:
    STY.W $1052                                                          ;A58EB5;
    LDA.W #$0001                                                         ;A58EB8;
    STA.W $1054                                                          ;A58EBB;
    LDA.W #$000D                                                         ;A58EBE;
    JSL.L Run_Samus_Command                                              ;A58EC1;
    AND.W #$FFFF                                                         ;A58EC5;
    BNE .retreat                                                         ;A58EC8;
    LDY.W #$0000                                                         ;A58ECA;
    LDA.L $7E8000                                                        ;A58ECD;
    BEQ .left                                                            ;A58ED1;
    LDY.W #$0001                                                         ;A58ED3;

.left:
    TYA                                                                  ;A58ED6;
    JSL.L SetSamusIntoTheGrabbedByDraygonPose                            ;A58ED7;
    LDA.W #$0100                                                         ;A58EDB;
    STA.L $7E780C                                                        ;A58EDE;
    LDA.W #$0180                                                         ;A58EE2;
    STA.L $7E780E                                                        ;A58EE5;
    LDA.W #$0000                                                         ;A58EE9;
    STA.L $7E780A                                                        ;A58EEC;
    STA.L $7E7812                                                        ;A58EF0;
    LDA.W #$00C0                                                         ;A58EF4;
    STA.L $7E7810                                                        ;A58EF7;
    LDA.W #$0800                                                         ;A58EFB;
    STA.L $7E7816                                                        ;A58EFE;
    LDA.W #Function_DraygonBody_GrabbedSamus_MovingToTargetPosition      ;A58F02;
    STA.W $0FA8                                                          ;A58F05;
    RTS                                                                  ;A58F08;


.retreat:
    LDA.W #Function_DraygonBody_RepelledByGrapple                        ;A58F09;
    STA.W $0FA8                                                          ;A58F0C;
    RTS                                                                  ;A58F0F;


Function_DraygonBody_RepelledByGrapple:
    LDA.W #GrappleBeamFunction_Dropped                                   ;A58F10;
    STA.W $0D32                                                          ;A58F13;
    LDA.W #Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp     ;A58F16;
    STA.W $0FA8                                                          ;A58F19;
    RTS                                                                  ;A58F1C;


RTS_A58F1D:
    RTS                                                                  ;A58F1D;


Function_DraygonBody_GrabbedSamus_MovingToTargetPosition:
    LDA.W $0A64                                                          ;A58F1E;
    BIT.W #$0001                                                         ;A58F21;
    BEQ .notGrappled                                                     ;A58F24;
    PHX                                                                  ;A58F26;
    LDX.W $0F78                                                          ;A58F27;
    LDA.L $A0000D,X                                                      ;A58F2A;
    AND.W #$00FF                                                         ;A58F2E;
    CLC                                                                  ;A58F31;
    ADC.W #$0008                                                         ;A58F32;
    STA.W $0F9C                                                          ;A58F35;
    PLX                                                                  ;A58F38;
    LDA.W $0F8A                                                          ;A58F39;
    ORA.W #$0002                                                         ;A58F3C;
    STA.W $0F8A                                                          ;A58F3F;
    RTS                                                                  ;A58F42;


.notGrappled:
    LDA.W $0F7A                                                          ;A58F43;
    SEC                                                                  ;A58F46;
    SBC.W #$0100                                                         ;A58F47;
    JSL.L NegateA_A0B067                                                 ;A58F4A;
    CMP.W #$0002                                                         ;A58F4E;
    BPL .notReachedTarget                                                ;A58F51;
    LDA.W $0F7E                                                          ;A58F53;
    SEC                                                                  ;A58F56;
    SBC.W #$0180                                                         ;A58F57;
    JSL.L NegateA_A0B067                                                 ;A58F5A;
    CMP.W #$0002                                                         ;A58F5E;
    BPL .notReachedTarget                                                ;A58F61;
    BRA .reachedTargetPosition                                           ;A58F63;


.notReachedTarget:
    LDA.W #$0100                                                         ;A58F65;
    SEC                                                                  ;A58F68;
    SBC.W $0F7A                                                          ;A58F69;
    STA.B $12                                                            ;A58F6C;
    LDA.W #$0180                                                         ;A58F6E;
    SEC                                                                  ;A58F71;
    SBC.W $0F7E                                                          ;A58F72;
    STA.B $14                                                            ;A58F75;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A58F77;
    EOR.W #$00FF                                                         ;A58F7B;
    INC A                                                                ;A58F7E;
    CLC                                                                  ;A58F7F;
    ADC.W #$0040                                                         ;A58F80;
    AND.W #$00FF                                                         ;A58F83;
    STA.W $0E20                                                          ;A58F86;
    STA.B $12                                                            ;A58F89;
    LDA.W #$0002                                                         ;A58F8B;
    STA.B $14                                                            ;A58F8E;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A58F90; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16                                                            ;A58F94;
    STA.W $0E24                                                          ;A58F96;
    LDA.B $18                                                            ;A58F99;
    STA.W $0E26                                                          ;A58F9B;
    LDA.B $1A                                                            ;A58F9E;
    STA.W $0E28                                                          ;A58FA0;
    LDA.B $1C                                                            ;A58FA3;
    STA.W $0E2A                                                          ;A58FA5;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A58FA8;
    JSR.W MoveSamusWithDraygon                                           ;A58FAC;
    RTS                                                                  ;A58FAF;


.reachedTargetPosition:
    LDA.W #Function_DraygonBody_GrabbedSamus_RisingSpiralMovement        ;A58FB0;
    STA.W $0FA8                                                          ;A58FB3;
    LDY.W #InstList_DraygonBody_FacingLeft_Roar                          ;A58FB6;
    LDA.L $7E8000                                                        ;A58FB9;
    BEQ .keepLeft                                                        ;A58FBD;
    LDY.W #InstList_DraygonBody_FacingRight_Roar                         ;A58FBF;

.keepLeft:
    TYA                                                                  ;A58FC2;
    STA.W $0F92,X                                                        ;A58FC3;
    LDA.W #$0001                                                         ;A58FC6;
    STA.W $0F94,X                                                        ;A58FC9;
    LDA.W $0F86                                                          ;A58FCC;
    ORA.W #$0400                                                         ;A58FCF;
    STA.W $0F86                                                          ;A58FD2;
    RTS                                                                  ;A58FD5;


Function_DraygonBody_GrabbedSamus_RisingSpiralMovement:
    LDA.W $0A64                                                          ;A58FD6;
    BIT.W #$0001                                                         ;A58FD9;
    BEQ .notGrappled                                                     ;A58FDC;
    PHX                                                                  ;A58FDE;
    LDX.W $0F78                                                          ;A58FDF;
    LDA.L $A0000D,X                                                      ;A58FE2;
    AND.W #$00FF                                                         ;A58FE6;
    CLC                                                                  ;A58FE9;
    ADC.W #$0008                                                         ;A58FEA;
    STA.W $0F9C                                                          ;A58FED;
    PLX                                                                  ;A58FF0;
    LDA.W $0F8A                                                          ;A58FF1;
    ORA.W #$0002                                                         ;A58FF4;
    STA.W $0F8A                                                          ;A58FF7;
    RTS                                                                  ;A58FFA;


.notGrappled:
    LDA.W $05E5                                                          ;A58FFB;
    AND.W #$00FF                                                         ;A58FFE;
    BNE .noSpank                                                         ;A59001;
    LDA.W #$0040                                                         ;A59003;
    STA.L $7E7818                                                        ;A59006;
    LDA.W #Function_DraygonBody_GrabbedSamus_TailWhip                    ;A5900A;
    STA.W $0FA8                                                          ;A5900D;
    RTS                                                                  ;A59010;


.noSpank:
    LDA.L $7E780A                                                        ;A59011;
    STA.W $0E32                                                          ;A59015;
    LDA.L $7E7810                                                        ;A59018;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A5901C;
    CLC                                                                  ;A59020;
    ADC.L $7E780C                                                        ;A59021;
    STA.W $0F7A                                                          ;A59025;
    LDA.L $7E780A                                                        ;A59028;
    LSR A                                                                ;A5902C;
    LSR A                                                                ;A5902D;
    STA.W $0E32                                                          ;A5902E;
    LDA.L $7E7810                                                        ;A59031;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A59035;
    CLC                                                                  ;A59039;
    ADC.L $7E780E                                                        ;A5903A;
    STA.W $0F7E                                                          ;A5903E;
    LDA.W $0FA4,X                                                        ;A59041;
    AND.W #$0007                                                         ;A59044;
    BNE .noFoam                                                          ;A59047;
    LDA.W $0F7A                                                          ;A59049;
    SEC                                                                  ;A5904C;
    SBC.W #$0020                                                         ;A5904D;
    STA.B $12                                                            ;A59050;
    LDA.L $7E8000                                                        ;A59052;
    BEQ .left                                                            ;A59056;
    LDA.W $0F7A                                                          ;A59058;
    CLC                                                                  ;A5905B;
    ADC.W #$0020                                                         ;A5905C;
    STA.B $12                                                            ;A5905F;

.left:
    LDA.W $0F7E                                                          ;A59061;
    SEC                                                                  ;A59064;
    SBC.W #$0010                                                         ;A59065;
    STA.B $14                                                            ;A59068;
    LDA.W #$003D                                                         ;A5906A;
    STA.B $16                                                            ;A5906D;
    STZ.B $18                                                            ;A5906F;
    JSL.L Create_Sprite_Object                                           ;A59071;

.noFoam:
    LDA.L $7E7812                                                        ;A59075;
    CLC                                                                  ;A59079;
    ADC.W #$2000                                                         ;A5907A;
    STA.L $7E7812                                                        ;A5907D;
    LDA.L $7E780A                                                        ;A59081;
    ADC.W #$0000                                                         ;A59085;
    STA.L $7E780A                                                        ;A59088;
    CMP.W #$00A0                                                         ;A5908C;
    BPL .finalSpanking                                                   ;A5908F;
    LDA.L $7E7816                                                        ;A59091;
    SEC                                                                  ;A59095;
    SBC.W #$0001                                                         ;A59096;
    STA.L $7E7816                                                        ;A59099;
    AND.W #$FF00                                                         ;A5909D;
    XBA                                                                  ;A590A0;
    CLC                                                                  ;A590A1;
    ADC.L $7E7810                                                        ;A590A2;
    AND.W #$00FF                                                         ;A590A6;
    STA.L $7E7810                                                        ;A590A9;
    LDA.L $7E7814                                                        ;A590AD;
    SEC                                                                  ;A590B1;
    SBC.W #$4000                                                         ;A590B2;
    STA.L $7E7814                                                        ;A590B5;
    LDA.L $7E780E                                                        ;A590B9;
    SBC.W #$0000                                                         ;A590BD;
    STA.L $7E780E                                                        ;A590C0;
    CMP.W #$0040                                                         ;A590C4;
    BMI .finalSpanking                                                   ;A590C7;
    JSR.W MoveSamusWithDraygon                                           ;A590C9;
    RTS                                                                  ;A590CC;

.finalSpanking:
    LDA.W #Function_DraygonBody_GrabbedSamus_FinalSpanking_Start         ;A590CD;
    STA.W $0FA8                                                          ;A590D0;
    RTS                                                                  ;A590D3;


Function_DraygonBody_GrabbedSamus_TailWhip:
    JSR.W MoveSamusWithDraygon                                           ;A590D4;
    LDA.L $7E7818                                                        ;A590D7;
    DEC A                                                                ;A590DB;
    STA.L $7E7818                                                        ;A590DC;
    BEQ .done                                                            ;A590E0;
    CMP.W #$003F                                                         ;A590E2;
    BEQ .getDirection                                                    ;A590E5;
    RTS                                                                  ;A590E7;

.getDirection:
    LDY.W #InstList_DraygonTail_FacingLeft_TailWhip                      ;A590E8;
    LDA.L $7E8000                                                        ;A590EB;
    BEQ .keepLeft                                                        ;A590EF;
    LDY.W #InstList_DraygonTail_FacingRight_TailWhip_0                   ;A590F1;

.keepLeft:
    STY.W $1012                                                          ;A590F4;
    LDA.W #$0001                                                         ;A590F7;
    STA.W $1014                                                          ;A590FA;
    RTS                                                                  ;A590FD;

.done:
    LDA.W #Function_DraygonBody_GrabbedSamus_RisingSpiralMovement        ;A590FE;
    STA.W $0FA8                                                          ;A59101;
    RTS                                                                  ;A59104;


Function_DraygonBody_GrabbedSamus_FinalSpanking_Start:
    JSR.W MoveSamusWithDraygon                                           ;A59105;
    LDY.W #InstList_DraygonTail_FacingLeft_FinalTailWhips_0              ;A59108;
    LDA.L $7E8000,X                                                      ;A5910B;
    BEQ .keepLeft                                                        ;A5910F;
    LDY.W #InstList_DraygonTail_FacingRight_FinalTailWhips_0             ;A59111;

.keepLeft:
    STY.W $1012                                                          ;A59114;
    LDA.W #$0001                                                         ;A59117;
    STA.W $1014                                                          ;A5911A;
    LDA.W #Function_DraygonBody_GrabbedSamus_FinalSpanking_Ongoing       ;A5911D;
    STA.W $0FA8                                                          ;A59120;
    RTS                                                                  ;A59123;


Function_DraygonBody_GrabbedSamus_FinalSpanking_Ongoing:
    JSR.W MoveSamusWithDraygon                                           ;A59124;
    RTS                                                                  ;A59127;


Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp:
    JSL.L ReleaseSamusFromDraygon_external                               ;A59128;
    STZ.W $0A64                                                          ;A5912C;
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp               ;A5912F;
    STA.W $0FA8                                                          ;A59132;
    LDA.W $0F86                                                          ;A59135;
    AND.W #$FBFF                                                         ;A59138;
    STA.W $0F86                                                          ;A5913B;
    LDY.W #InstList_DraygonTail_FacingLeft_TailFlail                     ;A5913E;
    LDA.L $7E8000                                                        ;A59141;
    BEQ .keepLeft                                                        ;A59145;
    LDY.W #InstList_DraygonTail_FacingRight_TailFlail_0                  ;A59147;

.keepLeft:
    STY.W $1012                                                          ;A5914A;
    LDA.W #$0001                                                         ;A5914D;
    STA.W $1014                                                          ;A59150;
    RTS                                                                  ;A59153;


Function_DraygonBody_GrabbedSamus_FlyStraightUp:
    JSR.W HandleFiringWallTurret                                         ;A59154;
    LDA.W $0F7E                                                          ;A59157;
    SEC                                                                  ;A5915A;
    SBC.W #$0004                                                         ;A5915B;
    STA.W $0F7E                                                          ;A5915E;
    BMI .offScreenTop                                                    ;A59161;
    RTS                                                                  ;A59163;


.offScreenTop:
    LDA.W $0F86                                                          ;A59164;
    AND.W #$FBFF                                                         ;A59167;
    STA.W $0F86                                                          ;A5916A;
    LDA.W #Function_DraygonBody_SwoopRight_Setup                         ;A5916D;
    STA.W $0FA8                                                          ;A59170;
    STZ.W $0FAA                                                          ;A59173;
    LDA.L $7E7800                                                        ;A59176;
    STA.W $0F7A                                                          ;A5917A;
    LDA.L $7E7802                                                        ;A5917D;
    STA.W $0F7E                                                          ;A59181;
    RTS                                                                  ;A59184;


Function_DraygonBody_DeathSequence_DriftToDeathSpot:
    LDX.W $0E54                                                          ;A59185; >.<
    LDA.W $0FA4,X                                                        ;A59188;
    AND.W #$000F                                                         ;A5918B;
    BNE .noFoam                                                          ;A5918E;
    LDA.W $0F7A                                                          ;A59190;
    SEC                                                                  ;A59193;
    SBC.W #$0020                                                         ;A59194;
    STA.B $12                                                            ;A59197;
    LDA.L $7E8000                                                        ;A59199;
    BEQ .left                                                            ;A5919D;
    LDA.W $0F7A                                                          ;A5919F;
    CLC                                                                  ;A591A2;
    ADC.W #$0020                                                         ;A591A3;
    STA.B $12                                                            ;A591A6;

.left:
    LDA.W $0F7E                                                          ;A591A8;
    SEC                                                                  ;A591AB;
    SBC.W #$0010                                                         ;A591AC;
    STA.B $14                                                            ;A591AF;
    LDA.W #$003D                                                         ;A591B1;
    STA.B $16                                                            ;A591B4;
    STZ.B $18                                                            ;A591B6;
    JSL.L Create_Sprite_Object                                           ;A591B8;

.noFoam:
    LDA.W $0F7A                                                          ;A591BC;
    LSR A                                                                ;A591BF;
    LSR A                                                                ;A591C0;
    STA.B $12                                                            ;A591C1;
    LDA.W #$0100                                                         ;A591C3;
    LSR A                                                                ;A591C6; >.<
    LSR A                                                                ;A591C7;
    SEC                                                                  ;A591C8;
    SBC.B $12                                                            ;A591C9;
    STA.B $12                                                            ;A591CB;
    LDA.W $0F7E                                                          ;A591CD;
    LSR A                                                                ;A591D0;
    LSR A                                                                ;A591D1;
    STA.B $14                                                            ;A591D2;
    LDA.W #$01E0                                                         ;A591D4;
    LSR A                                                                ;A591D7; >.<
    LSR A                                                                ;A591D8;
    SEC                                                                  ;A591D9;
    SBC.B $14                                                            ;A591DA;
    STA.B $14                                                            ;A591DC;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A591DE;
    SEC                                                                  ;A591E2;
    SBC.W #$0040                                                         ;A591E3;
    EOR.W #$FFFF                                                         ;A591E6;
    INC A                                                                ;A591E9;
    AND.W #$00FF                                                         ;A591EA;
    STA.L $7E8806                                                        ;A591ED;
    LDA.W #$0001                                                         ;A591F1;
    STA.B $14                                                            ;A591F4;
    LDA.L $7E8806                                                        ;A591F6;
    AND.W #$00FF                                                         ;A591FA;
    STA.B $12                                                            ;A591FD;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A591FF; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16                                                            ;A59203;
    STA.W $0E24                                                          ;A59205;
    LDA.B $18                                                            ;A59208;
    STA.W $0E26                                                          ;A5920A;
    LDA.B $1A                                                            ;A5920D;
    STA.W $0E28                                                          ;A5920F;
    LDA.B $1C                                                            ;A59212;
    STA.W $0E2A                                                          ;A59214;
    LDA.L $7E8806                                                        ;A59217;
    AND.W #$00FF                                                         ;A5921B;
    STA.W $0E20                                                          ;A5921E;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A59221;
    LDA.W $0F7A                                                          ;A59225;
    SEC                                                                  ;A59228;
    SBC.W #$0100                                                         ;A59229;
    JSL.L NegateA_A0B067                                                 ;A5922C;
    CMP.W #$0004                                                         ;A59230;
    BPL .gotoReturn                                                      ;A59233;
    LDA.W $0F7E                                                          ;A59235;
    SEC                                                                  ;A59238;
    SBC.W #$01E0                                                         ;A59239;
    JSL.L NegateA_A0B067                                                 ;A5923C;
    CMP.W #$0004                                                         ;A59240;
    BPL .gotoReturn                                                      ;A59243;
    BRA .done                                                            ;A59245;


.gotoReturn:
    JMP.W .return                                                        ;A59247;


.done:
    JSR.W SpawnDeathSequenceEvirSpriteObjects                            ;A5924A;
    LDA.W #Function_DraygonBody_DeathSequence_WaitForEvirs               ;A5924D;
    STA.W $0FA8                                                          ;A59250;
    LDA.W #$0003                                                         ;A59253;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;A59256;
    LDA.W #$01A0                                                         ;A5925A;
    STA.W $0FAA                                                          ;A5925D;
    LDA.W #InstList_Draygon_Sleep                                        ;A59260;
    STA.W $0F92                                                          ;A59263;
    LDA.W #$0001                                                         ;A59266;
    STA.W $0F94                                                          ;A59269;
    LDA.W $0F86                                                          ;A5926C;
    ORA.W #$0200                                                         ;A5926F;
    STA.W $1006                                                          ;A59272;
    STA.W $1046                                                          ;A59275;
    LDY.W #InstList_DraygonEye_FacingLeft_Dead                           ;A59278;
    LDA.L $7E8000                                                        ;A5927B;
    BEQ .keepLeft                                                        ;A5927F;
    LDY.W #InstList_DraygonEye_FacingRight_Dead                          ;A59281;

.keepLeft:
    STY.W $0FD2                                                          ;A59284;
    LDA.W #$0001                                                         ;A59287;
    STA.W $0FD4                                                          ;A5928A;
    LDA.W #RTS_A5804B                                                    ;A5928D;
    STA.W $0FE8                                                          ;A59290;

.return:
    RTS                                                                  ;A59293;


Function_DraygonBody_DeathSequence_WaitForEvirs:
    JSR.W HandleDyingDraygonSmoke                                        ;A59294;
    DEC.W $0FAA                                                          ;A59297;
    LDA.W $0FAA                                                          ;A5929A;
    BEQ .timerExpired                                                    ;A5929D;
    JSR.W HandleDeathSequenceEvirMovement                                ;A5929F;
    BRA .return                                                          ;A592A2;


.timerExpired:
    LDA.W #Function_DraygonBody_DeathSequence_BuriedByEvirs              ;A592A4;
    STA.W $0FA8                                                          ;A592A7;

.return:
    RTS                                                                  ;A592AA;


Function_DraygonBody_DeathSequence_BuriedByEvirs:
    JSR.W HandleDyingDraygonSmoke                                        ;A592AB;
    JSR.W HandleDeathSequenceEvirMovement                                ;A592AE;
    INC.W $0F7E                                                          ;A592B1;
    LDA.W $0F7E                                                          ;A592B4;
    CMP.W #$0240                                                         ;A592B7;
    BMI .return                                                          ;A592BA;
    LDA.W #InstList_Draygon_Delete                                       ;A592BC;
    STA.W $0F92                                                          ;A592BF;
    LDA.W #$0001                                                         ;A592C2;
    STA.W $0F94                                                          ;A592C5;
    LDA.W $0F86                                                          ;A592C8;
    ORA.W #$0200                                                         ;A592CB;
    STA.W $0F86                                                          ;A592CE;
    STA.W $0FC6                                                          ;A592D1;
    LDX.W $079F                                                          ;A592D4;
    LDA.L $7ED828,X                                                      ;A592D7;
    ORA.W #$0001                                                         ;A592DB;
    STA.L $7ED828,X                                                      ;A592DE;
    JSL.L DraygonDeathItemDropRoutine                                    ;A592E2;
    JSR.W Draygon_ClearSpriteObjects                                     ;A592E6;

.return:
    RTS                                                                  ;A592E9;


HandleDyingDraygonSmoke:
    PHY                                                                  ;A592EA;
    PHX                                                                  ;A592EB;
    LDA.W $05B6                                                          ;A592EC;
    AND.W #$0007                                                         ;A592EF;
    BNE .return                                                          ;A592F2;
    JSL.L GenerateRandomNumber                                           ;A592F4;
    AND.W #$007F                                                         ;A592F8;
    CLC                                                                  ;A592FB;
    ADC.W #$00C0                                                         ;A592FC;
    STA.B $12                                                            ;A592FF;
    LDA.W $05E5                                                          ;A59301;
    AND.W #$3F00                                                         ;A59304;
    XBA                                                                  ;A59307;
    CLC                                                                  ;A59308;
    ADC.W #$0190                                                         ;A59309;
    STA.B $14                                                            ;A5930C;
    LDA.W #$0015                                                         ;A5930E;
    STA.B $16                                                            ;A59311;
    STZ.B $18                                                            ;A59313;
    JSL.L Create_Sprite_Object                                           ;A59315;

.return:
    PLX                                                                  ;A59319;
    PLY                                                                  ;A5931A;
    RTS                                                                  ;A5931B;


HandleShortDraygonBreathBubbles:
    LDA.W $0FA4,X                                                        ;A5931C;
    AND.W #$007F                                                         ;A5931F;
    BNE .return                                                          ;A59322;
    LDA.W $0F7A                                                          ;A59324;
    CLC                                                                  ;A59327;
    ADC.W #$FFF0                                                         ;A59328;
    STA.B $12                                                            ;A5932B;
    LDA.W $0F7E                                                          ;A5932D;
    CLC                                                                  ;A59330;
    ADC.W #$FFF0                                                         ;A59331;
    STA.B $14                                                            ;A59334;
    LDA.W #$0018                                                         ;A59336;
    STA.B $16                                                            ;A59339;
    STZ.B $18                                                            ;A5933B;
    JSL.L Create_Sprite_Object                                           ;A5933D;

.return:
    RTS                                                                  ;A59341;


EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll:
    LDA.W $0911                                                          ;A59342;
    SEC                                                                  ;A59345;
    SBC.W $0F7A                                                          ;A59346;
    SEC                                                                  ;A59349;
    SBC.W #$01C2                                                         ;A5934A;
    CLC                                                                  ;A5934D;
    ADC.L $7E883C                                                        ;A5934E;
    STA.B $B5                                                            ;A59352;
    LDA.W $0915                                                          ;A59354;
    SEC                                                                  ;A59357;
    SBC.W $0F7E                                                          ;A59358;
    SEC                                                                  ;A5935B;
    SBC.W #$00C0                                                         ;A5935C;
    CLC                                                                  ;A5935F;
    ADC.L $7E883E                                                        ;A59360;
    STA.B $B7                                                            ;A59364;
    RTL                                                                  ;A59366;


Debug_DraygonController2InputHandling:
    LDX.W #$0000                                                         ;A59367;
    LDA.B $8D                                                            ;A5936A;
    BIT.W #$0040                                                         ;A5936C;
    BEQ .notPressingX                                                    ;A5936F;
    JSL.L Debug_MoveDraygonWithDpad_Fast                                 ;A59371;
    BRA +                                                                ;A59375;


.notPressingX:
    JSL.L Debug_MoveDraygonWithDpad_Slow                                 ;A59377;

  + LDX.W #$0000                                                         ;A5937B;
    LDA.B $91                                                            ;A5937E;
    BIT.W #$4000                                                         ;A59380;
    BEQ .fireGoopEnd                                                     ;A59383;
    LDY.W #InstList_DraygonBody_FacingLeft_FireGoop                      ;A59385;
    LDA.L $7E8000,X                                                      ;A59388;
    BEQ .keepLeft                                                        ;A5938C;
    LDY.W #InstList_DraygonBody_FacingRight_FireGoop                     ;A5938E;

.keepLeft:
    STY.W $0F92                                                          ;A59391;
    LDA.W #$0001                                                         ;A59394;
    STA.W $0F94                                                          ;A59397;
    BRA .return                                                          ;A5939A;


.fireGoopEnd:
    BIT.W #$8000                                                         ;A5939C;
    BEQ .tailWhipEnd                                                     ;A5939F;
    LDY.W #InstList_DraygonTail_FacingLeft_FakeTailWhip                  ;A593A1;
    LDA.L $7E8000,X                                                      ;A593A4;
    BEQ ..keepLeft                                                       ;A593A8;
    LDY.W #Debug_InstList_DraygonTail_FacingRight_FakeTailWhip           ;A593AA;

..keepLeft:
    STY.W $1012                                                          ;A593AD;
    LDA.W #$0001                                                         ;A593B0;
    STA.W $1014                                                          ;A593B3;
    BRA .return                                                          ;A593B6;


.tailWhipEnd:
    BIT.W #$0080                                                         ;A593B8;
    BEQ .grabEnd                                                         ;A593BB;
    LDY.W #Debug_InstList_DraygonArms_FacingLeft_FakeGrab                ;A593BD;
    LDA.L $7E8000,X                                                      ;A593C0;
    BEQ ..keepLeft                                                       ;A593C4;
    LDY.W #Debug_InstList_DraygonArms_FacingRight_FakeGrab               ;A593C6;

..keepLeft:
    STY.W $1052                                                          ;A593C9;
    LDA.W #$0001                                                         ;A593CC;
    STA.W $1054                                                          ;A593CF;
    BRA .return                                                          ;A593D2;


.grabEnd:
    BIT.W #$0040                                                         ;A593D4;
    BEQ .return                                                          ;A593D7; >.<

.return:
    RTL                                                                  ;A593D9;


Debug_MoveDraygonWithDpad_Slow:
    LDA.B $8D                                                            ;A593DA;
    BIT.W #$0200                                                         ;A593DC;
    BEQ .notPressingLeft                                                 ;A593DF;
    DEC.W $0F7A                                                          ;A593E1;
    CMP.W $1866                                                          ;A593E4;
    BEQ .notPressingLeft                                                 ;A593E7;
    STA.W $1866                                                          ;A593E9;
    LDY.W #InstList_DraygonBody_FacingLeft_Reset                         ;A593EC;
    LDA.W #$0000                                                         ;A593EF;
    STA.L $7E8000                                                        ;A593F2;
    BRA +                                                                ;A593F6;


.notPressingLeft:
    BIT.W #$0100                                                         ;A593F8;
    BEQ .noHorizontalMovement                                            ;A593FB;
    INC.W $0F7A                                                          ;A593FD;
    CMP.W $1866                                                          ;A59400;
    BEQ .noHorizontalMovement                                            ;A59403;
    STA.W $1866                                                          ;A59405;
    LDY.W #InstList_DraygonBody_FacingRight_Reset                        ;A59408;
    LDA.W #$0001                                                         ;A5940B;
    STA.L $7E8000                                                        ;A5940E;

  + STY.W $0F92                                                          ;A59412;
    LDA.W #$0001                                                         ;A59415;
    STA.W $0F94                                                          ;A59418;

.noHorizontalMovement:
    LDA.B $8D                                                            ;A5941B;
    BIT.W #$0800                                                         ;A5941D;
    BEQ .notPressingUp                                                   ;A59420;
    DEC.W $0F7E                                                          ;A59422;
    BRA .return                                                          ;A59425;


.notPressingUp:
    BIT.W #$0400                                                         ;A59427;
    BEQ .return                                                          ;A5942A;
    INC.W $0F7E                                                          ;A5942C;

.return:
    RTL                                                                  ;A5942F;


Debug_MoveDraygonWithDpad_Fast:
    LDA.B $8D                                                            ;A59430;
    BIT.W #$0200                                                         ;A59432;
    BEQ .noPressingLeft                                                  ;A59435;
    LDA.W $0F7A                                                          ;A59437;
    SEC                                                                  ;A5943A;
    SBC.W #$0004                                                         ;A5943B;
    STA.W $0F7A                                                          ;A5943E;
    LDA.B $8D                                                            ;A59441;
    CMP.W $1866                                                          ;A59443;
    BEQ .noPressingLeft                                                  ;A59446;
    STA.W $1866                                                          ;A59448;
    LDY.W #InstList_DraygonBody_FacingLeft_Reset                         ;A5944B;
    LDA.W #$0000                                                         ;A5944E;
    STA.L $7E8000                                                        ;A59451;
    BRA +                                                                ;A59455;


.noPressingLeft:
    BIT.W #$0100                                                         ;A59457;
    BEQ .noHorizontalMovement                                            ;A5945A;
    LDA.W $0F7A                                                          ;A5945C;
    CLC                                                                  ;A5945F;
    ADC.W #$0004                                                         ;A59460;
    STA.W $0F7A                                                          ;A59463;
    LDA.B $8D                                                            ;A59466;
    CMP.W $1866                                                          ;A59468;
    BEQ .noHorizontalMovement                                            ;A5946B;
    STA.W $1866                                                          ;A5946D;
    LDY.W #InstList_DraygonBody_FacingRight_Reset                        ;A59470;
    LDA.W #$0001                                                         ;A59473;
    STA.L $7E8000                                                        ;A59476;

  + STY.W $0F92                                                          ;A5947A;
    LDA.W #$0001                                                         ;A5947D;
    STA.W $0F94                                                          ;A59480;

.noHorizontalMovement:
    LDA.B $8D                                                            ;A59483;
    BIT.W #$0800                                                         ;A59485;
    BEQ .notPressingUp                                                   ;A59488;
    LDA.W $0F7E                                                          ;A5948A;
    SEC                                                                  ;A5948D;
    SBC.W #$0004                                                         ;A5948E;
    STA.W $0F7E                                                          ;A59491;
    BRA .return                                                          ;A59494;


.notPressingUp:
    BIT.W #$0400                                                         ;A59496;
    BEQ .return                                                          ;A59499;
    INC.W $0F7E                                                          ;A5949B;
    LDA.W $0F7E                                                          ;A5949E;
    CLC                                                                  ;A594A1;
    ADC.W #$0004                                                         ;A594A2;
    STA.W $0F7E                                                          ;A594A5;

.return:
    RTL                                                                  ;A594A8;


MoveSamusWithDraygon:
    LDY.W #$0008                                                         ;A594A9;
    LDA.L $7E8000,X                                                      ;A594AC;
    BNE .keepLeft                                                        ;A594B0;
    LDY.W #$FFF8                                                         ;A594B2;

.keepLeft:
    TYA                                                                  ;A594B5;
    CLC                                                                  ;A594B6;
    ADC.W $0F7A                                                          ;A594B7;
    STA.W $0AF6                                                          ;A594BA;
    LDA.W $0F7E                                                          ;A594BD;
    CLC                                                                  ;A594C0;
    ADC.W #$0028                                                         ;A594C1;
    STA.W $0AFA                                                          ;A594C4;
    JSL.L CapScrollingSpeed                                              ;A594C7;
    LDA.W $0A64                                                          ;A594CB;
    BIT.W #$0002                                                         ;A594CE;
    BEQ .return                                                          ;A594D1;
    STZ.W $0A64                                                          ;A594D3;
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp               ;A594D6;
    STA.W $0FA8                                                          ;A594D9;

.return:
    RTS                                                                  ;A594DC;


Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms:
    PHY                                                                  ;A594DD;
    LDA.W $0000,Y                                                        ;A594DE;
    STA.W $0F92                                                          ;A594E1;
    LDA.W $0002,Y                                                        ;A594E4;
    STA.W $0FD2                                                          ;A594E7;
    LDA.W $0004,Y                                                        ;A594EA;
    STA.W $1012                                                          ;A594ED;
    LDA.W $0006,Y                                                        ;A594F0;
    STA.W $1052                                                          ;A594F3;
    LDA.W #$0001                                                         ;A594F6;
    STA.W $0F94                                                          ;A594F9;
    STA.W $0FD4                                                          ;A594FC;
    STA.W $1014                                                          ;A594FF;
    STA.W $1054                                                          ;A59502;
    PLY                                                                  ;A59505;
    TYA                                                                  ;A59506;
    CLC                                                                  ;A59507;
    ADC.W #$0008                                                         ;A59508;
    TAY                                                                  ;A5950B;
    RTL                                                                  ;A5950C;


if !FEATURE_KEEP_UNREFERENCED
Unused_DraygonInstListPointers_A5950D:
    dw InstList_DraygonArms_FacingLeft_Idle_0                            ;A5950D;
    dw InstList_DraygonArms_FacingLeft_NearSwoopApex                     ;A5950F;
    dw UNUSED_InstList_DraygonArms_A59805                                ;A59511;
    dw InstList_DraygonArms_FacingRight_Idle_0                           ;A59513;
    dw InstList_DraygonArms_FacingRight_NearSwoopApex                    ;A59515;
    dw UNUSED_InstList_DraygonArms_A59BF8                                ;A59517;
    dw $0000                                                             ;A59519;
    dw InstList_DraygonBody_FacingLeft_Idle                              ;A5951B;
    dw InstList_DraygonArms_FacingLeft_Dying                             ;A5951D;
    dw UNUSED_InstList_DraygonBody_A5987B                                ;A5951F;
    dw InstList_DraygonBody_FacingLeft_FireGoop                          ;A59521;
    dw InstList_DraygonBody_FacingRight_Idle                             ;A59523;
    dw InstList_DraygonArms_FacingRight_Dying_0                          ;A59525;
    dw UNUSED_InstList_DraygonBody_A59C70                                ;A59527;
    dw InstList_DraygonBody_FacingRight_FireGoop                         ;A59529;
    dw $0000                                                             ;A5952B;
    dw InstList_DraygonEye_FacingLeft_Idle                               ;A5952D;
    dw InstList_DraygonEye_FacingLeft_LookingLeft                        ;A5952F;
    dw InstList_DraygonEye_FacingLeft_LookingRight                       ;A59531;
    dw InstList_DraygonEye_FacingLeft_LookingUp                          ;A59533;
    dw InstList_DraygonEye_FacingLeft_LookingDown                        ;A59535;
    dw InstList_DraygonEye_FacingRight_Idle                              ;A59537;
    dw InstList_DraygonEye_FacingRight_LookingRight                      ;A59539;
    dw InstList_DraygonEye_FacingRight_LookingLeft                       ;A5953B;
    dw InstList_DraygonEye_FacingRight_LookingUp                         ;A5953D;
    dw InstList_DraygonEye_FacingRight_LookingDown                       ;A5953F;
    dw $0000                                                             ;A59541;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59543;
    dw InstList_DraygonTail_FacingLeft_FakeTailWhip                      ;A59545;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59547;
    dw Debug_InstList_DraygonTail_FacingRight_FakeTailWhip               ;A59549;
    dw $0000                                                             ;A5954B;
endif ; !FEATURE_KEEP_UNREFERENCED

HurtAI_Draygon:
    LDY.W #Palette_Draygon_BG12_5                                        ;A5954D;
    LDX.W $0E54                                                          ;A59550;
    LDA.W $0F9C,X                                                        ;A59553;
    BIT.W #$0002                                                         ;A59556;
    BEQ .noFlash                                                         ;A59559;
    LDY.W #Palette_Draygon_WhiteFlash                                    ;A5955B;

.noFlash:
    LDX.W #$C0A0                                                         ;A5955E; $7E
    LDA.W #$0010                                                         ;A59561;
    STA.W $060B                                                          ;A59564;

.loopBG12Palette5:
    LDA.W $0000,Y                                                        ;A59567;
    STA.L $7E0000,X                                                      ;A5956A;
    INX                                                                  ;A5956E;
    INX                                                                  ;A5956F;
    INY                                                                  ;A59570;
    INY                                                                  ;A59571;
    DEC.W $060B                                                          ;A59572;
    BNE .loopBG12Palette5                                                ;A59575;
    LDX.W $0E54                                                          ;A59577;
    LDA.W $0F9C,X                                                        ;A5957A;
    BIT.W #$0002                                                         ;A5957D;
    BNE .flashing                                                        ;A59580;
    LDA.L $7E781C                                                        ;A59582;
    ASL A                                                                ;A59586;
    ASL A                                                                ;A59587;
    TAY                                                                  ;A59588;
    LDX.W #$0000                                                         ;A59589;

.loopHealthBasedPalette:
    LDA.W DraygonHealthBasedPaletteTable,Y                               ;A5958C;
    STA.L $7EC0B2,X                                                      ;A5958F;
    INY                                                                  ;A59593;
    INY                                                                  ;A59594;
    INX                                                                  ;A59595;
    INX                                                                  ;A59596;
    CPX.W #$0008                                                         ;A59597;
    BNE .loopHealthBasedPalette                                          ;A5959A;

.flashing:
    LDY.W #Palette_Draygon_Sprite7                                       ;A5959C;
    LDX.W $0E54                                                          ;A5959F;
    LDA.W $0F9C,X                                                        ;A595A2;
    BIT.W #$0002                                                         ;A595A5;
    BEQ ..noFlash                                                        ;A595A8;
    LDY.W #Palette_Draygon_WhiteFlash                                    ;A595AA;

..noFlash:
    LDX.W #$C1E0                                                         ;A595AD; $7E
    LDA.W #$0010                                                         ;A595B0;
    STA.W $060B                                                          ;A595B3;

.loopSpritePalette7:
    LDA.W $0000,Y                                                        ;A595B6;
    STA.L $7E0000,X                                                      ;A595B9;
    INX                                                                  ;A595BD;
    INX                                                                  ;A595BE;
    INY                                                                  ;A595BF;
    INY                                                                  ;A595C0;
    DEC.W $060B                                                          ;A595C1;
    BNE .loopSpritePalette7                                              ;A595C4;
    LDA.W $0A64                                                          ;A595C6;
    BIT.W #$0001                                                         ;A595C9;
    BEQ .return                                                          ;A595CC;
    LDA.W $0FA4                                                          ;A595CE;
    AND.W #$0007                                                         ;A595D1;
    BNE .return                                                          ;A595D4;
    LDA.W $0F8C                                                          ;A595D6;
    SEC                                                                  ;A595D9;
    SBC.W #$0100                                                         ;A595DA;
    BPL .grappleDamage                                                   ;A595DD;
    LDA.W #$0000                                                         ;A595DF;

.grappleDamage:
    STA.W $0F8C                                                          ;A595E2;
    JSL.L DraygonReaction_Common                                         ;A595E5;

.return:
    RTL                                                                  ;A595E9;


EnemyTouch_Draygon:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A595EA;
    BRA DraygonReaction_Common                                           ;A595EE;


EnemyShot_Draygon:
    LDA.L $7E781E                                                        ;A595F0;
    CLC                                                                  ;A595F4;
    ADC.W #$0008                                                         ;A595F5;
    CMP.W #$00A0                                                         ;A595F8;
    BPL +                                                                ;A595FB;
    STA.L $7E781E                                                        ;A595FD;

  + JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External     ;A59601;
    BRA DraygonReaction_Common                                           ;A59605;


PowerBombReaction_Draygon:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External                   ;A59607;
    BRA DraygonReaction_Common                                           ;A5960B; >.<


DraygonReaction_Common:
    LDX.W $0E54                                                          ;A5960D;
    LDA.W $0F8C,X                                                        ;A59610;
    BEQ .dead                                                            ;A59613;
    JMP.W .notDead                                                       ;A59615;


.dead:
    LDA.W #GrappleBeamFunction_Dropped                                   ;A59618;
    STA.W $0D32                                                          ;A5961B;
    LDY.W #InstList_DraygonArms_FacingLeft_Dying                         ;A5961E;
    LDA.L $7E8000                                                        ;A59621;
    BEQ ..keepLeft                                                       ;A59625;
    LDY.W #InstList_DraygonArms_FacingRight_Dying_0                      ;A59627;

  ..keepLeft
    STY.W $0F92                                                          ;A5962A;
    LDA.W #$0001                                                         ;A5962D;
    STA.W $0F94                                                          ;A59630;
    LDY.W #InstList_DraygonEye_FacingLeft_Dying_0                        ;A59633;
    LDA.L $7E8000                                                        ;A59636;
    BEQ +                                                                ;A5963A;
    LDY.W #InstList_DraygonEye_FacingRight_Dying_0                       ;A5963C;

+   STY.W $0FD2                                                          ;A5963F;
    LDA.W #$0001                                                         ;A59642;
    STA.W $0FD4                                                          ;A59645;
    LDA.W #RTS_A5804B                                                    ;A59648;
    STA.W $0FE8                                                          ;A5964B;
    LDA.W #Function_DraygonBody_DeathSequence_DriftToDeathSpot           ;A5964E;
    STA.W $0FA8                                                          ;A59651;
    JSL.L ReleaseSamusFromDraygon_external                               ;A59654;
    STZ.W $0A64                                                          ;A59658;
    LDA.W #$0100                                                         ;A5965B;
    SEC                                                                  ;A5965E;
    SBC.W $0F7A                                                          ;A5965F;
    STA.B $12                                                            ;A59662;
    LDA.W #$01E0                                                         ;A59664;
    SEC                                                                  ;A59667;
    SBC.W $0F7E                                                          ;A59668;
    STA.B $14                                                            ;A5966B;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A5966D;
    SEC                                                                  ;A59671;
    SBC.W #$0040                                                         ;A59672;
    EOR.W #$FFFF                                                         ;A59675;
    INC A                                                                ;A59678;
    AND.W #$00FF                                                         ;A59679;
    STA.L $7E8806                                                        ;A5967C;
    LDA.W #$0001                                                         ;A59680;
    STA.B $14                                                            ;A59683;
    LDA.L $7E8806                                                        ;A59685;
    AND.W #$00FF                                                         ;A59689;
    STA.B $12                                                            ;A5968C;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A5968E; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16                                                            ;A59692;
    STA.L $7E8010                                                        ;A59694;
    LDA.B $18                                                            ;A59698;
    STA.L $7E8012                                                        ;A5969A;
    LDA.B $1A                                                            ;A5969E;
    STA.L $7E8014                                                        ;A596A0;
    LDA.B $1C                                                            ;A596A4;
    STA.L $7E8016                                                        ;A596A6;
    RTL                                                                  ;A596AA;


.notDead:
    JSR.W DraygonHealthBasedPaletteHandling                              ;A596AB;
    RTL                                                                  ;A596AE;


DraygonHealthBasedPaletteTable:
    dw $0319,$0254,$018F,$00CA,$02BA,$01F4,$014F,$00AA                   ;A596AF;
    dw $023B,$01B5,$012F,$0089,$01DC,$0155,$00EF,$0069                   ;A596BF;
    dw $015C,$0116,$00B0,$0069,$00FD,$00B6,$0070,$0049                   ;A596CF;
    dw $007E,$0077,$0050,$0028,$001F,$0017,$0010,$0008                   ;A596DF;

DraygonHealthBasedPaletteThresholds:
    dw $1482,$1194,$0EA6,$0BB8,$08CA,$05DC,$02EE,$0000                   ;A596EF;
    dw $FFFF                                                             ;A596FF;

DraygonHealthBasedPaletteHandling:
    LDX.W #$0000                                                         ;A59701;

.loopFindThreshold:
    LDA.W $0F8C                                                          ;A59704;
    CMP.W DraygonHealthBasedPaletteThresholds,X                          ;A59707;
    BPL .found                                                           ;A5970A;
    INX                                                                  ;A5970C;
    INX                                                                  ;A5970D;
    BRA .loopFindThreshold                                               ;A5970E;


.found:
    TXA                                                                  ;A59710;
    CMP.L $7E781C                                                        ;A59711;
    BEQ .return                                                          ;A59715;
    STA.L $7E781C                                                        ;A59717;
    LDA.L $7E781C                                                        ;A5971B; >_<
    ASL A                                                                ;A5971F;
    ASL A                                                                ;A59720;
    TAY                                                                  ;A59721;
    LDX.W #$0000                                                         ;A59722;

.loopPalette:
    LDA.W DraygonHealthBasedPaletteTable,Y                               ;A59725;
    STA.L $7EC0B2,X                                                      ;A59728;
    INY                                                                  ;A5972C;
    INY                                                                  ;A5972D;
    INX                                                                  ;A5972E;
    INX                                                                  ;A5972F;
    CPX.W #$0008                                                         ;A59730;
    BNE .loopPalette                                                     ;A59733;

.return:
    RTS                                                                  ;A59735;


Instruction_Draygon_FunctionInY:
    LDA.W $0000,Y                                                        ;A59736;
    STA.W $0FA8,X                                                        ;A59739;
    INY                                                                  ;A5973C;
    INY                                                                  ;A5973D;
    RTL                                                                  ;A5973E;


Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud:
    PHY                                                                  ;A5973F;
    PHX                                                                  ;A59740;
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition                 ;A59741;
    LDA.W #$0015                                                         ;A59744;
    STA.B $16                                                            ;A59747;
    STZ.B $18                                                            ;A59749;
    JSL.L Create_Sprite_Object                                           ;A5974B;
    PLX                                                                  ;A5974F;
    PLY                                                                  ;A59750;
    RTL                                                                  ;A59751;


Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion:
    PHY                                                                  ;A59752;
    PHX                                                                  ;A59753;
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition                 ;A59754;
    LDA.W #$0003                                                         ;A59757;
    STA.B $16                                                            ;A5975A;
    STZ.B $18                                                            ;A5975C;
    JSL.L Create_Sprite_Object                                           ;A5975E;
    PLX                                                                  ;A59762;
    PLY                                                                  ;A59763;
    RTL                                                                  ;A59764;


Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion:
    PHY                                                                  ;A59765;
    PHX                                                                  ;A59766;
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition                 ;A59767;
    LDA.W #$001D                                                         ;A5976A;
    STA.B $16                                                            ;A5976D;
    STZ.B $18                                                            ;A5976F;
    JSL.L Create_Sprite_Object                                           ;A59771;
    PLX                                                                  ;A59775;
    PLY                                                                  ;A59776;
    RTL                                                                  ;A59777;


Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles:
    PHY                                                                  ;A59778;
    PHX                                                                  ;A59779;
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition                 ;A5977A;
    LDA.W #$0018                                                         ;A5977D;
    STA.B $16                                                            ;A59780;
    STZ.B $18                                                            ;A59782;
    JSL.L Create_Sprite_Object                                           ;A59784;
    PLX                                                                  ;A59788;
    PLY                                                                  ;A59789;
    RTL                                                                  ;A5978A;


GenerateRandomDyingDraygonSpriteObjectPosition:
    JSL.L GenerateRandomNumber                                           ;A5978B;
    LDA.W $05E5                                                          ;A5978F;
    AND.W #$007F                                                         ;A59792;
    SEC                                                                  ;A59795;
    SBC.W #$0040                                                         ;A59796;
    STA.B $12                                                            ;A59799;
    LDA.W $0F7A                                                          ;A5979B;
    CLC                                                                  ;A5979E;
    ADC.B $12                                                            ;A5979F;
    STA.B $12                                                            ;A597A1;
    LDA.W $05E5                                                          ;A597A3;
    AND.W #$7F00                                                         ;A597A6;
    XBA                                                                  ;A597A9;
    SEC                                                                  ;A597AA;
    SBC.W #$0040                                                         ;A597AB;
    STA.B $14                                                            ;A597AE;
    LDA.W $0F7E                                                          ;A597B0;
    CLC                                                                  ;A597B3;
    ADC.B $14                                                            ;A597B4;
    STA.B $14                                                            ;A597B6;
    RTS                                                                  ;A597B8;


InstList_Draygon_Sleep:
    dw Instruction_Common_Sleep                                          ;A597B9;

InstList_DraygonBody_FacingLeft_Reset:
    dw Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms                ;A597BB;
    dw InstList_DraygonBody_FacingLeft_Idle                              ;A597BD;
    dw InstList_DraygonEye_FacingLeft_Idle                               ;A597BF;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A597C1;
    dw InstList_DraygonArms_FacingLeft_Idle_0                            ;A597C3;
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw          ;A597C5;
    dw Instruction_Draygon_EyeFunctionInY                                ;A597C7;
    dw Function_DraygonEye_FacingLeft                                    ;A597C9;
    dw $0001                                                             ;A597CB;
    dw ExtendedSpritemap_Draygon_1A                                      ;A597CD;
    dw Instruction_Common_Sleep                                          ;A597CF;

InstList_DraygonBody_FacingRight_Reset:
    dw Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms                ;A597D1;
    dw InstList_DraygonBody_FacingRight_Idle                             ;A597D3;
    dw InstList_DraygonEye_FacingRight_Idle                              ;A597D5;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A597D7;
    dw InstList_DraygonArms_FacingRight_Idle_0                           ;A597D9;
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw          ;A597DB;
    dw Instruction_Draygon_EyeFunctionInY                                ;A597DD;
    dw Function_DraygonEye_FacingRight                                   ;A597DF;
    dw $0001                                                             ;A597E1;
    dw ExtendedSpritemap_Draygon_4A                                      ;A597E3;
    dw Instruction_Common_Sleep                                          ;A597E5;

InstList_DraygonArms_FacingLeft_Idle_0:
    dw $0005                                                             ;A597E7;
    dw ExtendedSpritemap_Draygon_4                                       ;A597E9;
    dw $0005                                                             ;A597EB;
    dw ExtendedSpritemap_Draygon_5                                       ;A597ED;
    dw $0005                                                             ;A597EF;
    dw ExtendedSpritemap_Draygon_6                                       ;A597F1;
    dw $0005                                                             ;A597F3;
    dw ExtendedSpritemap_Draygon_7                                       ;A597F5;
    dw $0005                                                             ;A597F7;
    dw ExtendedSpritemap_Draygon_8                                       ;A597F9;
    dw $0005                                                             ;A597FB;
    dw ExtendedSpritemap_Draygon_9                                       ;A597FD;
    dw Instruction_Common_GotoY                                          ;A597FF;
    dw InstList_DraygonArms_FacingLeft_Idle_0                            ;A59801;

InstList_DraygonArms_FacingLeft_Idle_1:
    dw Instruction_Common_Sleep                                          ;A59803;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonArms_A59805:
    dw $0001                                                             ;A59805;
    dw ExtendedSpritemap_Draygon_1D                                      ;A59807;
    dw $0001                                                             ;A59809;
    dw ExtendedSpritemap_Draygon_1C                                      ;A5980B;
    dw $0040                                                             ;A5980D;
    dw ExtendedSpritemap_Draygon_1B                                      ;A5980F;
    dw Instruction_Common_Sleep                                          ;A59811;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonArms_FacingLeft_NearSwoopApex:
    dw $0001                                                             ;A59813;
    dw ExtendedSpritemap_Draygon_1B                                      ;A59815;
    dw $0001                                                             ;A59817;
    dw ExtendedSpritemap_Draygon_1C                                      ;A59819;
    dw $0001                                                             ;A5981B;
    dw ExtendedSpritemap_Draygon_1D                                      ;A5981D;
    dw $0040                                                             ;A5981F;
    dw ExtendedSpritemap_Draygon_1E                                      ;A59821;
    dw Instruction_Common_Sleep                                          ;A59823;

Debug_InstList_DraygonArms_FacingLeft_FakeGrab:
    dw $0001                                                             ;A59825;
    dw ExtendedSpritemap_Draygon_1B                                      ;A59827;
    dw $0001                                                             ;A59829;
    dw ExtendedSpritemap_Draygon_1C                                      ;A5982B;
    dw $0001                                                             ;A5982D;
    dw ExtendedSpritemap_Draygon_1D                                      ;A5982F;
    dw $0040                                                             ;A59831;
    dw ExtendedSpritemap_Draygon_1E                                      ;A59833;
    dw $0001                                                             ;A59835;
    dw ExtendedSpritemap_Draygon_1D                                      ;A59837;
    dw $0001                                                             ;A59839;
    dw ExtendedSpritemap_Draygon_1C                                      ;A5983B;
    dw $0040                                                             ;A5983D;
    dw ExtendedSpritemap_Draygon_1B                                      ;A5983F;
    dw Instruction_Common_GotoY                                          ;A59841;
    dw InstList_DraygonArms_FacingLeft_Idle_0                            ;A59843;

InstList_DraygonArms_FacingLeft_Grab:
    dw $0001                                                             ;A59845;
    dw ExtendedSpritemap_Draygon_1B                                      ;A59847;
    dw $0001                                                             ;A59849;
    dw ExtendedSpritemap_Draygon_1C                                      ;A5984B;
    dw $0001                                                             ;A5984D;
    dw ExtendedSpritemap_Draygon_1D                                      ;A5984F;
    dw $0008                                                             ;A59851;
    dw ExtendedSpritemap_Draygon_1E                                      ;A59853;
    dw $0001                                                             ;A59855;
    dw ExtendedSpritemap_Draygon_1D                                      ;A59857;
    dw $0001                                                             ;A59859;
    dw ExtendedSpritemap_Draygon_1C                                      ;A5985B;
    dw $0001                                                             ;A5985D;
    dw ExtendedSpritemap_Draygon_1B                                      ;A5985F;
    dw $0001                                                             ;A59861;
    dw ExtendedSpritemap_Draygon_1C                                      ;A59863;
    dw Instruction_Common_Sleep                                          ;A59865;

InstList_DraygonArms_FacingLeft_Dying:
    dw $0005                                                             ;A59867;
    dw ExtendedSpritemap_Draygon_A                                       ;A59869;
    dw $0005                                                             ;A5986B;
    dw ExtendedSpritemap_Draygon_B                                       ;A5986D;
    dw $0005                                                             ;A5986F;
    dw ExtendedSpritemap_Draygon_C                                       ;A59871;
    dw $0005                                                             ;A59873;
    dw ExtendedSpritemap_Draygon_D                                       ;A59875;
    dw Instruction_Common_GotoY                                          ;A59877;
    dw InstList_DraygonBody_Dying_0                                      ;A59879;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonBody_A5987B:
    dw $0005                                                             ;A5987B;
    dw ExtendedSpritemap_Draygon_C                                       ;A5987D;
    dw $0005                                                             ;A5987F;
    dw ExtendedSpritemap_Draygon_B                                       ;A59881;
    dw $0005                                                             ;A59883;
    dw ExtendedSpritemap_Draygon_A                                       ;A59885;
    dw Instruction_Common_Sleep                                          ;A59887;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonBody_FacingLeft_Idle:
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw          ;A59889;
    dw Instruction_Draygon_EyeFunctionInY                                ;A5988B;
    dw Function_DraygonEye_FacingLeft                                    ;A5988D;
    dw $0001                                                             ;A5988F;
    dw ExtendedSpritemap_Draygon_1A                                      ;A59891;
    dw Instruction_Common_Sleep                                          ;A59893;

Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw:
    LDA.W #$000C                                                         ;A59895;
    STA.B $A9                                                            ;A59898;
    RTL                                                                  ;A5989A;


InstList_DraygonBody_Dying_0:
    dw Instruction_Draygon_QueueSFXInY_Lib3_Max6                         ;A5989B;
    dw $001B                                                             ;A5989D;
    dw Instruction_DraygonBody_SetAsIntangible                           ;A5989F;
    dw Instruction_Common_TimerInY                                       ;A598A1;
    dw $0008                                                             ;A598A3;

InstList_DraygonBody_Dying_1:
    dw Instruction_Common_WaitYFrames                                    ;A598A5;
    dw $000C                                                             ;A598A7;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion           ;A598A9;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion         ;A598AB;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud           ;A598AD;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles          ;A598AF;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A598B1;
    dw $0025                                                             ;A598B3;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A598B5;
    dw InstList_DraygonBody_Dying_1                                      ;A598B7;
    dw Instruction_Common_WaitYFrames                                    ;A598B9;
    dw $0001                                                             ;A598BB;
    dw Instruction_Draygon_ParalyseDraygonTailAndArms                    ;A598BD;

InstList_DraygonBody_Dying_2:
    dw Instruction_Common_WaitYFrames                                    ;A598BF;
    dw $0010                                                             ;A598C1;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion           ;A598C3;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion         ;A598C5;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud           ;A598C7;
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles          ;A598C9;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A598CB;
    dw $0025                                                             ;A598CD;
    dw Instruction_Common_GotoY                                          ;A598CF;
    dw InstList_DraygonBody_Dying_2                                      ;A598D1;

Instruction_Draygon_ParalyseDraygonTailAndArms:
    PHX                                                                  ;A598D3;
    PHY                                                                  ;A598D4;
    LDA.W #$0001                                                         ;A598D5;
    STA.W $1014                                                          ;A598D8;
    STA.W $1054                                                          ;A598DB;
    LDA.W #InstList_Draygon_Sleep                                        ;A598DE;
    STA.W $1012                                                          ;A598E1;
    LDA.W #InstList_Draygon_Sleep                                        ;A598E4;
    STA.W $1052                                                          ;A598E7;
    PLY                                                                  ;A598EA;
    PLX                                                                  ;A598EB;
    RTL                                                                  ;A598EC;


InstList_Draygon_Delete:
    dw Instruction_Common_DeleteEnemy                                    ;A598ED;

Instruction_DraygonBody_SetAsIntangible:
    PHX                                                                  ;A598EF;
    LDX.W $0E54                                                          ;A598F0;
    LDA.W $0F86                                                          ;A598F3;
    ORA.W #$0400                                                         ;A598F6;
    STA.W $0F86                                                          ;A598F9;
    PLX                                                                  ;A598FC;
    RTL                                                                  ;A598FD;


InstList_DraygonBody_FacingLeft_FireGoop:
    dw $0001                                                             ;A598FE;
    dw ExtendedSpritemap_Draygon_E                                       ;A59900;
    dw $0002                                                             ;A59902;
    dw ExtendedSpritemap_Draygon_F                                       ;A59904;
    dw $0003                                                             ;A59906;
    dw ExtendedSpritemap_Draygon_10                                      ;A59908;
    dw Instruction_Draygon_SpawnGoop_Leftwards                           ;A5990A;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A5990C;
    dw $004C,$0003                                                       ;A5990E;
    dw ExtendedSpritemap_Draygon_11                                      ;A59912;
    dw $0002                                                             ;A59914;
    dw ExtendedSpritemap_Draygon_10                                      ;A59916;
    dw $0002                                                             ;A59918;
    dw ExtendedSpritemap_Draygon_F                                       ;A5991A;
    dw $0001                                                             ;A5991C;
    dw ExtendedSpritemap_Draygon_E                                       ;A5991E;
    dw Instruction_Common_Sleep                                          ;A59920;

InstList_DraygonBody_FacingLeft_Roar:
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59922;
    dw $0073,$0006                                                       ;A59924;
    dw ExtendedSpritemap_Draygon_E                                       ;A59928;
    dw $0006                                                             ;A5992A;
    dw ExtendedSpritemap_Draygon_F                                       ;A5992C;
    dw $0006                                                             ;A5992E;
    dw ExtendedSpritemap_Draygon_10                                      ;A59930;
    dw $0006                                                             ;A59932;
    dw ExtendedSpritemap_Draygon_11                                      ;A59934;
    dw $0006                                                             ;A59936;
    dw ExtendedSpritemap_Draygon_10                                      ;A59938;
    dw $0006                                                             ;A5993A;
    dw ExtendedSpritemap_Draygon_F                                       ;A5993C;
    dw $0006                                                             ;A5993E;
    dw ExtendedSpritemap_Draygon_E                                       ;A59940;
    dw Instruction_Common_Sleep                                          ;A59942;

InstList_DraygonEye_FacingLeft_Idle:
    dw $0015                                                             ;A59944;
    dw ExtendedSpritemap_Draygon_12                                      ;A59946;
    dw $0005                                                             ;A59948;
    dw ExtendedSpritemap_Draygon_13                                      ;A5994A;
    dw $0005                                                             ;A5994C;
    dw ExtendedSpritemap_Draygon_14                                      ;A5994E;
    dw $000A                                                             ;A59950;
    dw ExtendedSpritemap_Draygon_13                                      ;A59952;
    dw $000A                                                             ;A59954;
    dw ExtendedSpritemap_Draygon_16                                      ;A59956;
    dw $000A                                                             ;A59958;
    dw ExtendedSpritemap_Draygon_16                                      ;A5995A;
    dw $000A                                                             ;A5995C;
    dw ExtendedSpritemap_Draygon_18                                      ;A5995E;
    dw $000A                                                             ;A59960;
    dw ExtendedSpritemap_Draygon_18                                      ;A59962;
    dw $000A                                                             ;A59964;
    dw ExtendedSpritemap_Draygon_19                                      ;A59966;
    dw $0005                                                             ;A59968;
    dw ExtendedSpritemap_Draygon_14                                      ;A5996A;
    dw $0005                                                             ;A5996C;
    dw ExtendedSpritemap_Draygon_13                                      ;A5996E;
    dw $0005                                                             ;A59970;
    dw ExtendedSpritemap_Draygon_12                                      ;A59972;
    dw Instruction_Draygon_FunctionInY                                   ;A59974;
    dw Function_DraygonEye_FacingLeft                                    ;A59976;
    dw Instruction_Common_Sleep                                          ;A59978;

InstList_DraygonEye_FacingLeft_Dying_0:
    dw Instruction_Common_TimerInY                                       ;A5997A;
    dw $0004                                                             ;A5997C;

InstList_DraygonEye_FacingLeft_Dying_1:
    dw $0004                                                             ;A5997E;
    dw ExtendedSpritemap_Draygon_16                                      ;A59980;
    dw $0004                                                             ;A59982;
    dw ExtendedSpritemap_Draygon_18                                      ;A59984;
    dw $0004                                                             ;A59986;
    dw ExtendedSpritemap_Draygon_17                                      ;A59988;
    dw $0004                                                             ;A5998A;
    dw ExtendedSpritemap_Draygon_19                                      ;A5998C;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A5998E;
    dw InstList_DraygonEye_FacingLeft_Dying_1                            ;A59990;
    dw $0020                                                             ;A59992;
    dw ExtendedSpritemap_Draygon_15                                      ;A59994;
    dw $0010                                                             ;A59996;
    dw ExtendedSpritemap_Draygon_14                                      ;A59998;
    dw Instruction_Common_Sleep                                          ;A5999A;

InstList_DraygonEye_FacingLeft_Dead:
    dw $0020                                                             ;A5999C;
    dw ExtendedSpritemap_Draygon_15                                      ;A5999E;
    dw $0020                                                             ;A599A0;
    dw ExtendedSpritemap_Draygon_14                                      ;A599A2;
    dw $0020                                                             ;A599A4;
    dw ExtendedSpritemap_Draygon_13                                      ;A599A6;
    dw $0001                                                             ;A599A8;
    dw ExtendedSpritemap_Draygon_12                                      ;A599AA;
    dw Instruction_Common_Sleep                                          ;A599AC;

InstList_DraygonEye_FacingLeft_LookingLeft:
    dw $0001                                                             ;A599AE;
    dw ExtendedSpritemap_Draygon_16                                      ;A599B0;
    dw Instruction_Common_Sleep                                          ;A599B2;

InstList_DraygonEye_FacingLeft_LookingRight:
    dw $0001                                                             ;A599B4;
    dw ExtendedSpritemap_Draygon_17                                      ;A599B6;
    dw Instruction_Common_Sleep                                          ;A599B8;

InstList_DraygonEye_FacingLeft_LookingUp:
    dw $0001                                                             ;A599BA;
    dw ExtendedSpritemap_Draygon_18                                      ;A599BC;
    dw Instruction_Common_Sleep                                          ;A599BE;

InstList_DraygonEye_FacingLeft_LookingDown:
    dw $0001                                                             ;A599C0;
    dw ExtendedSpritemap_Draygon_19                                      ;A599C2;
    dw Instruction_Common_Sleep                                          ;A599C4;

InstList_DraygonTail_FacingLeft_Idle_0:
    dw $0008                                                             ;A599C6;
    dw ExtendedSpritemap_Draygon_22                                      ;A599C8;
    dw $0007                                                             ;A599CA;
    dw ExtendedSpritemap_Draygon_23                                      ;A599CC;
    dw $0006                                                             ;A599CE;
    dw ExtendedSpritemap_Draygon_24                                      ;A599D0;
    dw $0006                                                             ;A599D2;
    dw ExtendedSpritemap_Draygon_25                                      ;A599D4;
    dw $0006                                                             ;A599D6;
    dw ExtendedSpritemap_Draygon_26                                      ;A599D8;
    dw $0006                                                             ;A599DA;
    dw ExtendedSpritemap_Draygon_27                                      ;A599DC;
    dw $0006                                                             ;A599DE;
    dw ExtendedSpritemap_Draygon_28                                      ;A599E0;
    dw $0006                                                             ;A599E2;
    dw ExtendedSpritemap_Draygon_27                                      ;A599E4;
    dw $0006                                                             ;A599E6;
    dw ExtendedSpritemap_Draygon_26                                      ;A599E8;
    dw $0006                                                             ;A599EA;
    dw ExtendedSpritemap_Draygon_25                                      ;A599EC;
    dw $0006                                                             ;A599EE;
    dw ExtendedSpritemap_Draygon_24                                      ;A599F0;
    dw $0007                                                             ;A599F2;
    dw ExtendedSpritemap_Draygon_23                                      ;A599F4;
    dw Instruction_Common_GotoY                                          ;A599F6;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A599F8;

InstList_DraygonTail_FacingLeft_Idle_1:
    dw Instruction_Common_Sleep                                          ;A599FA;

InstList_DraygonTail_FacingLeft_FakeTailWhip:
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A599FC;
    dw $FFFF,$FFFF,$0010                                                 ;A599FE;
    dw ExtendedSpritemap_Draygon_24                                      ;A59A04;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A06;
    dw $FFFE,$FFFE,$0006                                                 ;A59A08;
    dw ExtendedSpritemap_Draygon_29                                      ;A59A0E;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A10;
    dw $FFFD,$FFFD,$0005                                                 ;A59A12;
    dw ExtendedSpritemap_Draygon_2A                                      ;A59A18;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A1A;
    dw $FFFC,$FFFC,$0004                                                 ;A59A1C;
    dw ExtendedSpritemap_Draygon_2B                                      ;A59A22;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A24;
    dw $FFFB,$FFFB,$0003                                                 ;A59A26;
    dw ExtendedSpritemap_Draygon_2C                                      ;A59A2C;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A2E;
    dw $FFFA,$FFFA,$0002                                                 ;A59A30;
    dw ExtendedSpritemap_Draygon_2D                                      ;A59A36;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A38;
    dw $FFF8,$FFF8,$0001                                                 ;A59A3A;
    dw ExtendedSpritemap_Draygon_2E                                      ;A59A40;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A42;
    dw $0000,$0000,$0010                                                 ;A59A44;
    dw ExtendedSpritemap_Draygon_2F                                      ;A59A4A;
    dw $0001                                                             ;A59A4C;
    dw ExtendedSpritemap_Draygon_2E                                      ;A59A4E;
    dw $0002                                                             ;A59A50;
    dw ExtendedSpritemap_Draygon_2D                                      ;A59A52;
    dw $0003                                                             ;A59A54;
    dw ExtendedSpritemap_Draygon_2C                                      ;A59A56;
    dw $0004                                                             ;A59A58;
    dw ExtendedSpritemap_Draygon_2B                                      ;A59A5A;
    dw $0005                                                             ;A59A5C;
    dw ExtendedSpritemap_Draygon_2A                                      ;A59A5E;
    dw $0006                                                             ;A59A60;
    dw ExtendedSpritemap_Draygon_29                                      ;A59A62;
    dw Instruction_Common_GotoY                                          ;A59A64;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59A66;

InstList_DraygonTail_FacingLeft_FinalTailWhips_0:
    dw Instruction_Common_TimerInY                                       ;A59A68;
    dw $0004                                                             ;A59A6A;

InstList_DraygonTail_FacingLeft_FinalTailWhips_1:
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A6C;
    dw $FFFF,$FFFF,$0002                                                 ;A59A6E;
    dw ExtendedSpritemap_Draygon_24                                      ;A59A74;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A76;
    dw $FFFE,$FFFE,$0006                                                 ;A59A78;
    dw ExtendedSpritemap_Draygon_29                                      ;A59A7E;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A80;
    dw $FFFD,$FFFD,$0005                                                 ;A59A82;
    dw ExtendedSpritemap_Draygon_2A                                      ;A59A88;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A8A;
    dw $FFFC,$FFFC,$0004                                                 ;A59A8C;
    dw ExtendedSpritemap_Draygon_2B                                      ;A59A92;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A94;
    dw $FFFB,$FFFB,$0003                                                 ;A59A96;
    dw ExtendedSpritemap_Draygon_2C                                      ;A59A9C;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59A9E;
    dw $FFFA,$FFFA,$0002                                                 ;A59AA0;
    dw ExtendedSpritemap_Draygon_2D                                      ;A59AA6;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59AA8;
    dw $FFF8,$FFF8,$0001                                                 ;A59AAA;
    dw ExtendedSpritemap_Draygon_2E                                      ;A59AB0;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59AB2;
    dw $0000,$0000                                                       ;A59AB4;
    dw Instruction_DraygonTail_TailWhipHit                               ;A59AB8;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59ABA;
    dw $0025,$0003                                                       ;A59ABC;
    dw ExtendedSpritemap_Draygon_2F                                      ;A59AC0;
    dw $0001                                                             ;A59AC2;
    dw ExtendedSpritemap_Draygon_2E                                      ;A59AC4;
    dw $0002                                                             ;A59AC6;
    dw ExtendedSpritemap_Draygon_2D                                      ;A59AC8;
    dw $0003                                                             ;A59ACA;
    dw ExtendedSpritemap_Draygon_2C                                      ;A59ACC;
    dw $0004                                                             ;A59ACE;
    dw ExtendedSpritemap_Draygon_2B                                      ;A59AD0;
    dw $0005                                                             ;A59AD2;
    dw ExtendedSpritemap_Draygon_2A                                      ;A59AD4;
    dw $0006                                                             ;A59AD6;
    dw ExtendedSpritemap_Draygon_29                                      ;A59AD8;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A59ADA;
    dw InstList_DraygonTail_FacingLeft_FinalTailWhips_1                  ;A59ADC;
    dw Instruction_Draygon_BodyFunctionInY                               ;A59ADE;
    dw Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp         ;A59AE0;
    dw Instruction_Common_GotoY                                          ;A59AE2;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59AE4;

InstList_DraygonTail_FacingLeft_FinalTailWhips_2:
    dw Instruction_Common_Sleep                                          ;A59AE6;

InstList_DraygonTail_FacingLeft_TailWhip:
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59AE8;
    dw $FFFF,$FFFF,$0002                                                 ;A59AEA;
    dw ExtendedSpritemap_Draygon_24                                      ;A59AF0;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59AF2;
    dw $FFFE,$FFFE,$0006                                                 ;A59AF4;
    dw ExtendedSpritemap_Draygon_29                                      ;A59AFA;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59AFC;
    dw $FFFD,$FFFD,$0005                                                 ;A59AFE;
    dw ExtendedSpritemap_Draygon_2A                                      ;A59B04;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59B06;
    dw $FFFC,$FFFC,$0004                                                 ;A59B08;
    dw ExtendedSpritemap_Draygon_2B                                      ;A59B0E;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59B10;
    dw $FFFB,$FFFB,$0003                                                 ;A59B12;
    dw ExtendedSpritemap_Draygon_2C                                      ;A59B18;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59B1A;
    dw $FFFA,$FFFA,$0002                                                 ;A59B1C;
    dw ExtendedSpritemap_Draygon_2D                                      ;A59B22;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59B24;
    dw $FFF8,$FFF8,$0001                                                 ;A59B26;
    dw ExtendedSpritemap_Draygon_2E                                      ;A59B2C;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59B2E;
    dw $0000,$0000                                                       ;A59B30;
    dw Instruction_DraygonTail_TailWhipHit                               ;A59B34;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59B36;
    dw $0025,$0003                                                       ;A59B38;
    dw ExtendedSpritemap_Draygon_2F                                      ;A59B3C;
    dw $0001                                                             ;A59B3E;
    dw ExtendedSpritemap_Draygon_2E                                      ;A59B40;
    dw $0002                                                             ;A59B42;
    dw ExtendedSpritemap_Draygon_2D                                      ;A59B44;
    dw $0003                                                             ;A59B46;
    dw ExtendedSpritemap_Draygon_2C                                      ;A59B48;
    dw $0004                                                             ;A59B4A;
    dw ExtendedSpritemap_Draygon_2B                                      ;A59B4C;
    dw $0005                                                             ;A59B4E;
    dw ExtendedSpritemap_Draygon_2A                                      ;A59B50;
    dw $0006                                                             ;A59B52;
    dw ExtendedSpritemap_Draygon_29                                      ;A59B54;
    dw Instruction_Common_GotoY                                          ;A59B56;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59B58;

InstList_DraygonTail_FacingLeft_TailFlail:
    dw $0002                                                             ;A59B5A;
    dw ExtendedSpritemap_Draygon_24                                      ;A59B5C;
    dw $0006                                                             ;A59B5E;
    dw ExtendedSpritemap_Draygon_29                                      ;A59B60;
    dw $0005                                                             ;A59B62;
    dw ExtendedSpritemap_Draygon_2A                                      ;A59B64;
    dw $0004                                                             ;A59B66;
    dw ExtendedSpritemap_Draygon_2B                                      ;A59B68;
    dw $0003                                                             ;A59B6A;
    dw ExtendedSpritemap_Draygon_2C                                      ;A59B6C;
    dw $0002                                                             ;A59B6E;
    dw ExtendedSpritemap_Draygon_2D                                      ;A59B70;
    dw $0001                                                             ;A59B72;
    dw ExtendedSpritemap_Draygon_2E                                      ;A59B74;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59B76;
    dw $0025,$0003                                                       ;A59B78;
    dw ExtendedSpritemap_Draygon_2F                                      ;A59B7C;
    dw $0001                                                             ;A59B7E;
    dw ExtendedSpritemap_Draygon_2E                                      ;A59B80;
    dw $0002                                                             ;A59B82;
    dw ExtendedSpritemap_Draygon_2D                                      ;A59B84;
    dw $0003                                                             ;A59B86;
    dw ExtendedSpritemap_Draygon_2C                                      ;A59B88;
    dw $0004                                                             ;A59B8A;
    dw ExtendedSpritemap_Draygon_2B                                      ;A59B8C;
    dw $0005                                                             ;A59B8E;
    dw ExtendedSpritemap_Draygon_2A                                      ;A59B90;
    dw $0006                                                             ;A59B92;
    dw ExtendedSpritemap_Draygon_29                                      ;A59B94;
    dw Instruction_Common_GotoY                                          ;A59B96;
    dw InstList_DraygonTail_FacingLeft_Idle_0                            ;A59B98;

Instruction_DraygonTail_TailWhipHit:
    PHX                                                                  ;A59B9A;
    PHY                                                                  ;A59B9B;
    LDA.W #$0018                                                         ;A59B9C;
    STA.L $7E781E                                                        ;A59B9F;
    LDX.W $0F78                                                          ;A59BA3;
    LDA.L $A00006,X                                                      ;A59BA6;
    JSL.L Suit_Damage_Division                                           ;A59BAA;
    JSL.L Deal_A_Damage_to_Samus                                         ;A59BAE;
    LDA.W #$0020                                                         ;A59BB2;
    STA.W $1840                                                          ;A59BB5;
    LDA.W #$0007                                                         ;A59BB8;
    STA.W $183E                                                          ;A59BBB;
    LDA.W $0AF6                                                          ;A59BBE;
    STA.B $12                                                            ;A59BC1;
    LDA.W $0AFA                                                          ;A59BC3;
    CLC                                                                  ;A59BC6;
    ADC.W #$0010                                                         ;A59BC7;
    STA.B $14                                                            ;A59BCA;
    LDA.W #$0015                                                         ;A59BCC;
    STA.B $16                                                            ;A59BCF;
    STZ.B $18                                                            ;A59BD1;
    JSL.L Create_Sprite_Object                                           ;A59BD3;
    PLY                                                                  ;A59BD7;
    PLX                                                                  ;A59BD8;
    RTL                                                                  ;A59BD9;


InstList_DraygonArms_FacingRight_Idle_0:
    dw $0005                                                             ;A59BDA;
    dw ExtendedSpritemap_Draygon_34                                      ;A59BDC;
    dw $0005                                                             ;A59BDE;
    dw ExtendedSpritemap_Draygon_35                                      ;A59BE0;
    dw $0005                                                             ;A59BE2;
    dw ExtendedSpritemap_Draygon_36                                      ;A59BE4;
    dw $0005                                                             ;A59BE6;
    dw ExtendedSpritemap_Draygon_37                                      ;A59BE8;
    dw $0005                                                             ;A59BEA;
    dw ExtendedSpritemap_Draygon_38                                      ;A59BEC;
    dw $0005                                                             ;A59BEE;
    dw ExtendedSpritemap_Draygon_39                                      ;A59BF0;
    dw Instruction_Common_GotoY                                          ;A59BF2;
    dw InstList_DraygonArms_FacingRight_Idle_0                           ;A59BF4;

InstList_DraygonArms_FacingRight_Idle_1:
    dw Instruction_Common_Sleep                                          ;A59BF6;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonArms_A59BF8:
    dw $0001                                                             ;A59BF8;
    dw ExtendedSpritemap_Draygon_4D                                      ;A59BFA;
    dw $0001                                                             ;A59BFC;
    dw ExtendedSpritemap_Draygon_4C                                      ;A59BFE;
    dw $0040                                                             ;A59C00;
    dw ExtendedSpritemap_Draygon_4B                                      ;A59C02;
    dw Instruction_Common_Sleep                                          ;A59C04;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonArms_FacingRight_NearSwoopApex:
    dw $0001                                                             ;A59C06;
    dw ExtendedSpritemap_Draygon_4B                                      ;A59C08;
    dw $0001                                                             ;A59C0A;
    dw ExtendedSpritemap_Draygon_4C                                      ;A59C0C;
    dw $0001                                                             ;A59C0E;
    dw ExtendedSpritemap_Draygon_4D                                      ;A59C10;
    dw $0040                                                             ;A59C12;
    dw ExtendedSpritemap_Draygon_4E                                      ;A59C14;
    dw Instruction_Common_Sleep                                          ;A59C16;

Debug_InstList_DraygonArms_FacingRight_FakeGrab:
    dw $0001                                                             ;A59C18;
    dw ExtendedSpritemap_Draygon_4B                                      ;A59C1A;
    dw $0001                                                             ;A59C1C;
    dw ExtendedSpritemap_Draygon_4C                                      ;A59C1E;
    dw $0001                                                             ;A59C20;
    dw ExtendedSpritemap_Draygon_4D                                      ;A59C22;
    dw $0040                                                             ;A59C24;
    dw ExtendedSpritemap_Draygon_4E                                      ;A59C26;
    dw $0001                                                             ;A59C28;
    dw ExtendedSpritemap_Draygon_4D                                      ;A59C2A;
    dw $0001                                                             ;A59C2C;
    dw ExtendedSpritemap_Draygon_4C                                      ;A59C2E;
    dw $0040                                                             ;A59C30;
    dw ExtendedSpritemap_Draygon_4B                                      ;A59C32;
    dw Instruction_Common_GotoY                                          ;A59C34;
    dw InstList_DraygonArms_FacingRight_Idle_0                           ;A59C36;

InstList_DraygonArms_FacingRight_Grab:
    dw $0001                                                             ;A59C38;
    dw ExtendedSpritemap_Draygon_4B                                      ;A59C3A;
    dw $0001                                                             ;A59C3C;
    dw ExtendedSpritemap_Draygon_4C                                      ;A59C3E;
    dw $0001                                                             ;A59C40;
    dw ExtendedSpritemap_Draygon_4D                                      ;A59C42;
    dw $0008                                                             ;A59C44;
    dw ExtendedSpritemap_Draygon_4E                                      ;A59C46;
    dw $0001                                                             ;A59C48;
    dw ExtendedSpritemap_Draygon_4D                                      ;A59C4A;
    dw $0001                                                             ;A59C4C;
    dw ExtendedSpritemap_Draygon_4C                                      ;A59C4E;
    dw $0001                                                             ;A59C50;
    dw ExtendedSpritemap_Draygon_4B                                      ;A59C52;
    dw $0001                                                             ;A59C54;
    dw ExtendedSpritemap_Draygon_4C                                      ;A59C56;
    dw Instruction_Common_Sleep                                          ;A59C58;

InstList_DraygonArms_FacingRight_Dying_0:
    dw $0005                                                             ;A59C5A;
    dw ExtendedSpritemap_Draygon_3A                                      ;A59C5C;
    dw $0005                                                             ;A59C5E;
    dw ExtendedSpritemap_Draygon_3B                                      ;A59C60;
    dw $0005                                                             ;A59C62;
    dw ExtendedSpritemap_Draygon_3C                                      ;A59C64;
    dw $0005                                                             ;A59C66;
    dw ExtendedSpritemap_Draygon_3D                                      ;A59C68;
    dw Instruction_Common_GotoY                                          ;A59C6A;
    dw InstList_DraygonBody_Dying_0                                      ;A59C6C;

InstList_DraygonBody_FacingRight_Dying_1:
    dw Instruction_Common_Sleep                                          ;A59C6E;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonBody_A59C70:
    dw $0005                                                             ;A59C70;
    dw ExtendedSpritemap_Draygon_3C                                      ;A59C72;
    dw $0005                                                             ;A59C74;
    dw ExtendedSpritemap_Draygon_3B                                      ;A59C76;
    dw $0005                                                             ;A59C78;
    dw ExtendedSpritemap_Draygon_3A                                      ;A59C7A;
    dw Instruction_Common_Sleep                                          ;A59C7C;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonBody_FacingRight_Idle:
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw_dup      ;A59C7E;
    dw Instruction_Draygon_EyeFunctionInY                                ;A59C80;
    dw Function_DraygonEye_FacingRight                                   ;A59C82;
    dw $0001                                                             ;A59C84;
    dw ExtendedSpritemap_Draygon_4A                                      ;A59C86;
    dw Instruction_Common_Sleep                                          ;A59C88;

Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw_dup:
    LDA.W #$000C                                                         ;A59C8A;
    STA.B $A9                                                            ;A59C8D;
    RTL                                                                  ;A59C8F;


InstList_DraygonBody_FacingRight_FireGoop:
    dw $0001                                                             ;A59C90;
    dw ExtendedSpritemap_Draygon_3E                                      ;A59C92;
    dw $0002                                                             ;A59C94;
    dw ExtendedSpritemap_Draygon_3F                                      ;A59C96;
    dw $0003                                                             ;A59C98;
    dw ExtendedSpritemap_Draygon_40                                      ;A59C9A;
    dw Instruction_Draygon_SpawnGoop_Rightwards                          ;A59C9C;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59C9E;
    dw $004C,$0003                                                       ;A59CA0;
    dw ExtendedSpritemap_Draygon_41                                      ;A59CA4;
    dw $0002                                                             ;A59CA6;
    dw ExtendedSpritemap_Draygon_40                                      ;A59CA8;
    dw $0002                                                             ;A59CAA;
    dw ExtendedSpritemap_Draygon_3F                                      ;A59CAC;
    dw $0001                                                             ;A59CAE;
    dw ExtendedSpritemap_Draygon_3E                                      ;A59CB0;
    dw Instruction_Common_Sleep                                          ;A59CB2;

InstList_DraygonBody_FacingRight_Roar:
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59CB4;
    dw $0073,$0006                                                       ;A59CB6;
    dw ExtendedSpritemap_Draygon_3E                                      ;A59CBA;
    dw $0006                                                             ;A59CBC;
    dw ExtendedSpritemap_Draygon_3F                                      ;A59CBE;
    dw $0006                                                             ;A59CC0;
    dw ExtendedSpritemap_Draygon_40                                      ;A59CC2;
    dw $0006                                                             ;A59CC4;
    dw ExtendedSpritemap_Draygon_41                                      ;A59CC6;
    dw $0006                                                             ;A59CC8;
    dw ExtendedSpritemap_Draygon_40                                      ;A59CCA;
    dw $0006                                                             ;A59CCC;
    dw ExtendedSpritemap_Draygon_3F                                      ;A59CCE;
    dw $0006                                                             ;A59CD0;
    dw ExtendedSpritemap_Draygon_3E                                      ;A59CD2;
    dw Instruction_Common_Sleep                                          ;A59CD4;

InstList_DraygonEye_FacingRight_Idle:
    dw $0015                                                             ;A59CD6;
    dw ExtendedSpritemap_Draygon_42                                      ;A59CD8;
    dw $0005                                                             ;A59CDA;
    dw ExtendedSpritemap_Draygon_43                                      ;A59CDC;
    dw $0005                                                             ;A59CDE;
    dw ExtendedSpritemap_Draygon_44                                      ;A59CE0;
    dw $000A                                                             ;A59CE2;
    dw ExtendedSpritemap_Draygon_43                                      ;A59CE4;
    dw $000A                                                             ;A59CE6;
    dw ExtendedSpritemap_Draygon_46                                      ;A59CE8;
    dw $000A                                                             ;A59CEA;
    dw ExtendedSpritemap_Draygon_46                                      ;A59CEC;
    dw $000A                                                             ;A59CEE;
    dw ExtendedSpritemap_Draygon_48                                      ;A59CF0;
    dw $000A                                                             ;A59CF2;
    dw ExtendedSpritemap_Draygon_48                                      ;A59CF4;
    dw $000A                                                             ;A59CF6;
    dw ExtendedSpritemap_Draygon_49                                      ;A59CF8;
    dw $0005                                                             ;A59CFA;
    dw ExtendedSpritemap_Draygon_44                                      ;A59CFC;
    dw $0005                                                             ;A59CFE;
    dw ExtendedSpritemap_Draygon_43                                      ;A59D00;
    dw $0005                                                             ;A59D02;
    dw ExtendedSpritemap_Draygon_42                                      ;A59D04;
    dw Instruction_Draygon_FunctionInY                                   ;A59D06;
    dw Function_DraygonEye_FacingLeft                                    ;A59D08;
    dw Instruction_Common_Sleep                                          ;A59D0A;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonEye_A59D0C:
    dw $0015                                                             ;A59D0C;
    dw ExtendedSpritemap_Draygon_42                                      ;A59D0E;
    dw $0005                                                             ;A59D10;
    dw ExtendedSpritemap_Draygon_43                                      ;A59D12;
    dw $0005                                                             ;A59D14;
    dw ExtendedSpritemap_Draygon_44                                      ;A59D16;
    dw $000A                                                             ;A59D18;
    dw ExtendedSpritemap_Draygon_45                                      ;A59D1A;
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonEye_FacingRight_Dying_0:
    dw Instruction_Common_TimerInY                                       ;A59D1C;
    dw $0004                                                             ;A59D1E;

InstList_DraygonEye_FacingRight_Dying_1:
    dw $0004                                                             ;A59D20;
    dw ExtendedSpritemap_Draygon_46                                      ;A59D22;
    dw $0004                                                             ;A59D24;
    dw ExtendedSpritemap_Draygon_48                                      ;A59D26;
    dw $0004                                                             ;A59D28;
    dw ExtendedSpritemap_Draygon_47                                      ;A59D2A;
    dw $0004                                                             ;A59D2C;
    dw ExtendedSpritemap_Draygon_49                                      ;A59D2E;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A59D30;
    dw InstList_DraygonEye_FacingRight_Dying_1                           ;A59D32;
    dw $0020                                                             ;A59D34;
    dw ExtendedSpritemap_Draygon_45                                      ;A59D36;
    dw $0010                                                             ;A59D38;
    dw ExtendedSpritemap_Draygon_44                                      ;A59D3A;
    dw Instruction_Common_Sleep                                          ;A59D3C;

InstList_DraygonEye_FacingRight_Dead:
    dw $0020                                                             ;A59D3E;
    dw ExtendedSpritemap_Draygon_45                                      ;A59D40;
    dw $0020                                                             ;A59D42;
    dw ExtendedSpritemap_Draygon_44                                      ;A59D44;
    dw $0020                                                             ;A59D46;
    dw ExtendedSpritemap_Draygon_43                                      ;A59D48;
    dw $0001                                                             ;A59D4A;
    dw ExtendedSpritemap_Draygon_42                                      ;A59D4C;
    dw Instruction_Common_Sleep                                          ;A59D4E;

InstList_DraygonEye_FacingRight_LookingRight:
    dw $0001                                                             ;A59D50;
    dw ExtendedSpritemap_Draygon_46                                      ;A59D52;
    dw Instruction_Common_Sleep                                          ;A59D54;

InstList_DraygonEye_FacingRight_LookingLeft:
    dw $0001                                                             ;A59D56;
    dw ExtendedSpritemap_Draygon_47                                      ;A59D58;
    dw Instruction_Common_Sleep                                          ;A59D5A;

InstList_DraygonEye_FacingRight_LookingUp:
    dw $0001                                                             ;A59D5C;
    dw ExtendedSpritemap_Draygon_48                                      ;A59D5E;
    dw Instruction_Common_Sleep                                          ;A59D60;

InstList_DraygonEye_FacingRight_LookingDown:
    dw $0001                                                             ;A59D62;
    dw ExtendedSpritemap_Draygon_49                                      ;A59D64;
    dw Instruction_Common_Sleep                                          ;A59D66;

InstList_DraygonTail_FacingRight_Idle_0:
    dw $0008                                                             ;A59D68;
    dw ExtendedSpritemap_Draygon_59                                      ;A59D6A;
    dw $0007                                                             ;A59D6C;
    dw ExtendedSpritemap_Draygon_5A                                      ;A59D6E;
    dw $0006                                                             ;A59D70;
    dw ExtendedSpritemap_Draygon_5B                                      ;A59D72;
    dw $0006                                                             ;A59D74;
    dw ExtendedSpritemap_Draygon_5C                                      ;A59D76;
    dw $0006                                                             ;A59D78;
    dw ExtendedSpritemap_Draygon_5D                                      ;A59D7A;
    dw $0006                                                             ;A59D7C;
    dw ExtendedSpritemap_Draygon_5E                                      ;A59D7E;
    dw $0006                                                             ;A59D80;
    dw ExtendedSpritemap_Draygon_5F                                      ;A59D82;
    dw $0006                                                             ;A59D84;
    dw ExtendedSpritemap_Draygon_5E                                      ;A59D86;
    dw $0006                                                             ;A59D88;
    dw ExtendedSpritemap_Draygon_5D                                      ;A59D8A;
    dw $0006                                                             ;A59D8C;
    dw ExtendedSpritemap_Draygon_5C                                      ;A59D8E;
    dw $0006                                                             ;A59D90;
    dw ExtendedSpritemap_Draygon_5B                                      ;A59D92;
    dw $0007                                                             ;A59D94;
    dw ExtendedSpritemap_Draygon_5A                                      ;A59D96;
    dw Instruction_Common_GotoY                                          ;A59D98;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59D9A;

InstList_DraygonTail_FacingRight_Idle_1:
    dw Instruction_Common_Sleep                                          ;A59D9C;

Debug_InstList_DraygonTail_FacingRight_FakeTailWhip:
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59D9E;
    dw $0001,$FFFF,$0010                                                 ;A59DA0;
    dw ExtendedSpritemap_Draygon_5B                                      ;A59DA6;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59DA8;
    dw $0002,$FFFE,$0006                                                 ;A59DAA;
    dw ExtendedSpritemap_Draygon_60                                      ;A59DB0;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59DB2;
    dw $0003,$FFFD,$0005                                                 ;A59DB4;
    dw ExtendedSpritemap_Draygon_61                                      ;A59DBA;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59DBC;
    dw $0004,$FFFC,$0004                                                 ;A59DBE;
    dw ExtendedSpritemap_Draygon_62                                      ;A59DC4;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59DC6;
    dw $0005,$FFFB,$0003                                                 ;A59DC8;
    dw ExtendedSpritemap_Draygon_63                                      ;A59DCE;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59DD0;
    dw $0006,$FFFA,$0002                                                 ;A59DD2;
    dw ExtendedSpritemap_Draygon_64                                      ;A59DD8;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59DDA;
    dw $0008,$FFF9,$0001                                                 ;A59DDC;
    dw ExtendedSpritemap_Draygon_65                                      ;A59DE2;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59DE4;
    dw $0000,$0000,$0010                                                 ;A59DE6;
    dw ExtendedSpritemap_Draygon_66                                      ;A59DEC;
    dw $0001                                                             ;A59DEE;
    dw ExtendedSpritemap_Draygon_65                                      ;A59DF0;
    dw $0002                                                             ;A59DF2;
    dw ExtendedSpritemap_Draygon_64                                      ;A59DF4;
    dw $0003                                                             ;A59DF6;
    dw ExtendedSpritemap_Draygon_63                                      ;A59DF8;
    dw $0004                                                             ;A59DFA;
    dw ExtendedSpritemap_Draygon_62                                      ;A59DFC;
    dw $0005                                                             ;A59DFE;
    dw ExtendedSpritemap_Draygon_61                                      ;A59E00;
    dw $0006                                                             ;A59E02;
    dw ExtendedSpritemap_Draygon_60                                      ;A59E04;
    dw Instruction_Common_GotoY                                          ;A59E06;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59E08;

Instruction_DraygonBody_DisplaceGraphics:
    PHX                                                                  ;A59E0A;
    PHY                                                                  ;A59E0B;
    LDA.W $0000,Y                                                        ;A59E0C;
    STA.L $7E883C                                                        ;A59E0F;
    LDA.W $0002,Y                                                        ;A59E13;
    STA.L $7E883E                                                        ;A59E16;
    PLY                                                                  ;A59E1A;
    PLX                                                                  ;A59E1B;
    INY                                                                  ;A59E1C;
    INY                                                                  ;A59E1D;
    INY                                                                  ;A59E1E;
    INY                                                                  ;A59E1F;
    RTL                                                                  ;A59E20;


InstList_DraygonTail_FacingRight_FinalTailWhips_0:
    dw Instruction_Common_TimerInY                                       ;A59E21;
    dw $0004                                                             ;A59E23;

InstList_DraygonTail_FacingRight_FinalTailWhips_1:
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59E25;
    dw $0001,$FFFF,$0002                                                 ;A59E27;
    dw ExtendedSpritemap_Draygon_5B                                      ;A59E2D;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59E2F;
    dw $0002,$FFFE,$0006                                                 ;A59E31;
    dw ExtendedSpritemap_Draygon_60                                      ;A59E37;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59E39;
    dw $0003,$FFFD,$0005                                                 ;A59E3B;
    dw ExtendedSpritemap_Draygon_61                                      ;A59E41;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59E43;
    dw $0004,$FFFC,$0004                                                 ;A59E45;
    dw ExtendedSpritemap_Draygon_62                                      ;A59E4B;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59E4D;
    dw $0005,$FFFB,$0003                                                 ;A59E4F;
    dw ExtendedSpritemap_Draygon_63                                      ;A59E55;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59E57;
    dw $0006,$FFFA,$0002                                                 ;A59E59;
    dw ExtendedSpritemap_Draygon_64                                      ;A59E5F;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59E61;
    dw $0008,$FFF8,$0001                                                 ;A59E63;
    dw ExtendedSpritemap_Draygon_65                                      ;A59E69;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59E6B;
    dw $0000,$0000                                                       ;A59E6D;
    dw Instruction_DraygonTail_TailWhipHit                               ;A59E71;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59E73;
    dw $0025,$0003                                                       ;A59E75;
    dw ExtendedSpritemap_Draygon_66                                      ;A59E79;
    dw $0001                                                             ;A59E7B;
    dw ExtendedSpritemap_Draygon_65                                      ;A59E7D;
    dw $0002                                                             ;A59E7F;
    dw ExtendedSpritemap_Draygon_64                                      ;A59E81;
    dw $0003                                                             ;A59E83;
    dw ExtendedSpritemap_Draygon_63                                      ;A59E85;
    dw $0004                                                             ;A59E87;
    dw ExtendedSpritemap_Draygon_62                                      ;A59E89;
    dw $0005                                                             ;A59E8B;
    dw ExtendedSpritemap_Draygon_61                                      ;A59E8D;
    dw $0006                                                             ;A59E8F;
    dw ExtendedSpritemap_Draygon_60                                      ;A59E91;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A59E93;
    dw InstList_DraygonTail_FacingRight_FinalTailWhips_1                 ;A59E95;
    dw Instruction_Draygon_BodyFunctionInY                               ;A59E97;
    dw Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp         ;A59E99;
    dw Instruction_Common_GotoY                                          ;A59E9B;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59E9D;

InstList_DraygonTail_FacingRight_FinalTailWhips_2:
    dw Instruction_Common_Sleep                                          ;A59E9F;

InstList_DraygonTail_FacingRight_TailWhip_0:
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59EA1;
    dw $0001,$FFFF,$0002                                                 ;A59EA3;
    dw ExtendedSpritemap_Draygon_5B                                      ;A59EA9;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59EAB;
    dw $0002,$FFFE,$0006                                                 ;A59EAD;
    dw ExtendedSpritemap_Draygon_60                                      ;A59EB3;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59EB5;
    dw $0003,$FFFD,$0005                                                 ;A59EB7;
    dw ExtendedSpritemap_Draygon_61                                      ;A59EBD;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59EBF;
    dw $0004,$FFFC,$0004                                                 ;A59EC1;
    dw ExtendedSpritemap_Draygon_62                                      ;A59EC7;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59EC9;
    dw $0005,$FFFB,$0003                                                 ;A59ECB;
    dw ExtendedSpritemap_Draygon_63                                      ;A59ED1;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59ED3;
    dw $0006,$FFFA,$0002                                                 ;A59ED5;
    dw ExtendedSpritemap_Draygon_64                                      ;A59EDB;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59EDD;
    dw $0008,$FFF8,$0001                                                 ;A59EDF;
    dw ExtendedSpritemap_Draygon_65                                      ;A59EE5;
    dw Instruction_DraygonBody_DisplaceGraphics                          ;A59EE7;
    dw $0000,$0000                                                       ;A59EE9;
    dw Instruction_DraygonTail_TailWhipHit                               ;A59EED;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59EEF;
    dw $0025,$0003                                                       ;A59EF1;
    dw ExtendedSpritemap_Draygon_66                                      ;A59EF5;
    dw $0001                                                             ;A59EF7;
    dw ExtendedSpritemap_Draygon_65                                      ;A59EF9;
    dw $0002                                                             ;A59EFB;
    dw ExtendedSpritemap_Draygon_64                                      ;A59EFD;
    dw $0003                                                             ;A59EFF;
    dw ExtendedSpritemap_Draygon_63                                      ;A59F01;
    dw $0004                                                             ;A59F03;
    dw ExtendedSpritemap_Draygon_62                                      ;A59F05;
    dw $0005                                                             ;A59F07;
    dw ExtendedSpritemap_Draygon_61                                      ;A59F09;
    dw $0006                                                             ;A59F0B;
    dw ExtendedSpritemap_Draygon_60                                      ;A59F0D;
    dw Instruction_Common_GotoY                                          ;A59F0F;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59F11;

InstList_DraygonTail_FacingRight_TailWhip_1:
    dw Instruction_Common_Sleep                                          ;A59F13;

InstList_DraygonTail_FacingRight_TailFlail_0:
    dw $0002                                                             ;A59F15;
    dw ExtendedSpritemap_Draygon_5B                                      ;A59F17;
    dw $0006                                                             ;A59F19;
    dw ExtendedSpritemap_Draygon_60                                      ;A59F1B;
    dw $0005                                                             ;A59F1D;
    dw ExtendedSpritemap_Draygon_61                                      ;A59F1F;
    dw $0004                                                             ;A59F21;
    dw ExtendedSpritemap_Draygon_62                                      ;A59F23;
    dw $0003                                                             ;A59F25;
    dw ExtendedSpritemap_Draygon_63                                      ;A59F27;
    dw $0002                                                             ;A59F29;
    dw ExtendedSpritemap_Draygon_64                                      ;A59F2B;
    dw $0001                                                             ;A59F2D;
    dw ExtendedSpritemap_Draygon_65                                      ;A59F2F;
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6                         ;A59F31;
    dw $0025,$0003                                                       ;A59F33;
    dw ExtendedSpritemap_Draygon_66                                      ;A59F37;
    dw $0001                                                             ;A59F39;
    dw ExtendedSpritemap_Draygon_65                                      ;A59F3B;
    dw $0002                                                             ;A59F3D;
    dw ExtendedSpritemap_Draygon_64                                      ;A59F3F;
    dw $0003                                                             ;A59F41;
    dw ExtendedSpritemap_Draygon_63                                      ;A59F43;
    dw $0004                                                             ;A59F45;
    dw ExtendedSpritemap_Draygon_62                                      ;A59F47;
    dw $0005                                                             ;A59F49;
    dw ExtendedSpritemap_Draygon_61                                      ;A59F4B;
    dw $0006                                                             ;A59F4D;
    dw ExtendedSpritemap_Draygon_60                                      ;A59F4F;
    dw Instruction_Common_GotoY                                          ;A59F51;
    dw InstList_DraygonTail_FacingRight_Idle_0                           ;A59F53;

InstList_DraygonTail_FacingRight_TailFlail_1:
    dw Instruction_Common_Sleep                                          ;A59F55;

Instruction_Draygon_BodyFunctionInY:
    LDA.W $0000,Y                                                        ;A59F57;
    STA.W $0FA8                                                          ;A59F5A;
    INY                                                                  ;A59F5D;
    INY                                                                  ;A59F5E;
    RTL                                                                  ;A59F5F;


Instruction_Draygon_QueueSFXInY_Lib2_Max6:
    PHX                                                                  ;A59F60;
    PHY                                                                  ;A59F61;
    LDA.W $0000,Y                                                        ;A59F62;
    JSL.L QueueSound_Lib2_Max6                                           ;A59F65;
    PLY                                                                  ;A59F69;
    PLX                                                                  ;A59F6A;
    INY                                                                  ;A59F6B;
    INY                                                                  ;A59F6C;
    RTL                                                                  ;A59F6D;


Instruction_Draygon_QueueSFXInY_Lib3_Max6:
    PHX                                                                  ;A59F6E;
    PHY                                                                  ;A59F6F;
    LDA.W $0000,Y                                                        ;A59F70;
    JSL.L QueueSound_Lib3_Max6                                           ;A59F73;
    PLY                                                                  ;A59F77;
    PLX                                                                  ;A59F78;
    INY                                                                  ;A59F79;
    INY                                                                  ;A59F7A;
    RTL                                                                  ;A59F7B;


Instruction_Draygon_SpawnGoop_Leftwards:
    PHX                                                                  ;A59F7C;
    PHY                                                                  ;A59F7D;
    LDX.W $0E54                                                          ;A59F7E;
    LDA.W $0F7A                                                          ;A59F81;
    CLC                                                                  ;A59F84;
    ADC.W #$FFE4                                                         ;A59F85;
    STA.B $12                                                            ;A59F88;
    LDA.W $0F7E                                                          ;A59F8A;
    CLC                                                                  ;A59F8D;
    ADC.W #$FFF0                                                         ;A59F8E;
    STA.B $14                                                            ;A59F91;
    JSL.L GenerateRandomNumber                                           ;A59F93;
    AND.W #$003F                                                         ;A59F97;
    CLC                                                                  ;A59F9A;
    ADC.W #$0080                                                         ;A59F9B;
    STA.W $1995                                                          ;A59F9E;
    LDY.W #EnemyProjectile_DraygonGoop                                   ;A59FA1;
    LDA.W #$0002                                                         ;A59FA4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A59FA7;
    PLY                                                                  ;A59FAB;
    PLX                                                                  ;A59FAC;
    RTL                                                                  ;A59FAD;


Instruction_Draygon_SpawnGoop_Rightwards:
    PHX                                                                  ;A59FAE;
    PHY                                                                  ;A59FAF;
    LDX.W $0E54                                                          ;A59FB0;
    LDA.W $0F7A                                                          ;A59FB3;
    CLC                                                                  ;A59FB6;
    ADC.W #$0018                                                         ;A59FB7;
    STA.B $12                                                            ;A59FBA;
    LDA.W $0F7E                                                          ;A59FBC;
    CLC                                                                  ;A59FBF;
    ADC.W #$FFF0                                                         ;A59FC0;
    STA.B $14                                                            ;A59FC3;
    JSL.L GenerateRandomNumber                                           ;A59FC5;
    AND.W #$003F                                                         ;A59FC9;
    CLC                                                                  ;A59FCC;
    ADC.W #$00C0                                                         ;A59FCD;
    STA.W $1995                                                          ;A59FD0;
    LDY.W #EnemyProjectile_DraygonGoop                                   ;A59FD3;
    LDA.W #$0002                                                         ;A59FD6;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A59FD9;
    PLY                                                                  ;A59FDD;
    PLX                                                                  ;A59FDE;
    RTL                                                                  ;A59FDF;


HandleDeathSequenceEvirMovement:
    PHY                                                                  ;A59FE0;
    LDX.W #$003E                                                         ;A59FE1;
    LDY.W #$0014                                                         ;A59FE4;

.loop:
    LDA.W DraygonDeathSequenceEvirAngles,Y                               ;A59FE7;
    CLC                                                                  ;A59FEA;
    ADC.W #$0040                                                         ;A59FEB;
    BIT.W #$0080                                                         ;A59FEE;
    BEQ +                                                                ;A59FF1;
    LDA.L $7EF178,X                                                      ;A59FF3;
    CLC                                                                  ;A59FF7;
    ADC.W DraygonDeathSequenceEvirSubSpeeds_X,Y                          ;A59FF8;
    STA.L $7EF178,X                                                      ;A59FFB;
    LDA.L $7EF0F8,X                                                      ;A59FFF;
    ADC.W #$0000                                                         ;A5A003;
    STA.L $7EF0F8,X                                                      ;A5A006;
    BRA .YPosition                                                       ;A5A00A;


  + LDA.L $7EF178,X                                                      ;A5A00C;
    SEC                                                                  ;A5A010;
    SBC.W DraygonDeathSequenceEvirSubSpeeds_X,Y                          ;A5A011;
    STA.L $7EF178,X                                                      ;A5A014;
    LDA.L $7EF0F8,X                                                      ;A5A018;
    SBC.W $0E24                                                          ;A5A01C;
    STA.L $7EF0F8,X                                                      ;A5A01F;

.YPosition:
    LDA.W DraygonDeathSequenceEvirAngles,Y                               ;A5A023;
    CLC                                                                  ;A5A026;
    ADC.W #$0080                                                         ;A5A027;
    BIT.W #$0080                                                         ;A5A02A;
    BEQ +                                                                ;A5A02D;
    LDA.L $7EF278,X                                                      ;A5A02F;
    CLC                                                                  ;A5A033;
    ADC.W DraygonDeathSequenceEvirSubSpeeds_Y,Y                          ;A5A034;
    STA.L $7EF278,X                                                      ;A5A037;
    LDA.L $7EF1F8,X                                                      ;A5A03B;
    ADC.W #$0000                                                         ;A5A03F;
    STA.L $7EF1F8,X                                                      ;A5A042;
    BRA .nextSpriteObject                                                ;A5A046;


  + LDA.L $7EF278,X                                                      ;A5A048;
    SEC                                                                  ;A5A04C;
    SBC.W DraygonDeathSequenceEvirSubSpeeds_Y,Y                          ;A5A04D;
    STA.L $7EF278,X                                                      ;A5A050;
    LDA.L $7EF1F8,X                                                      ;A5A054;
    SBC.W #$0000                                                         ;A5A058;
    STA.L $7EF1F8,X                                                      ;A5A05B;

.nextSpriteObject:
    DEX                                                                  ;A5A05F;
    DEX                                                                  ;A5A060;
    DEY                                                                  ;A5A061;
    DEY                                                                  ;A5A062;
    DEY                                                                  ;A5A063;
    DEY                                                                  ;A5A064;
    BPL .gotoLoop                                                        ;A5A065;
    PLY                                                                  ;A5A067;
    RTS                                                                  ;A5A068;


.gotoLoop:
    JMP.W .loop                                                          ;A5A069;


SpawnDeathSequenceEvirSpriteObjects:
    PHX                                                                  ;A5A06C;
    PHY                                                                  ;A5A06D;
    LDX.W #$003E                                                         ;A5A06E;
    LDA.W #$0000                                                         ;A5A071;

.loopClearSpriteObjects:
    STA.L $7EEF78,X                                                      ;A5A074;
    DEX                                                                  ;A5A078;
    DEX                                                                  ;A5A079;
    BPL .loopClearSpriteObjects                                          ;A5A07A;
    LDX.W #$0002                                                         ;A5A07C;
    LDY.W #$0014                                                         ;A5A07F;

loopLeft:
    LDA.W DraygonDeathSequenceEvirSpawnPositions_X,Y                     ;A5A082;
    STA.B $12                                                            ;A5A085;
    LDA.W DraygonDeathSequenceEvirSpawnPositions_Y,Y                     ;A5A087;
    STA.B $14                                                            ;A5A08A;
    LDA.W #$003B                                                         ;A5A08C;
    STA.B $16                                                            ;A5A08F;
    LDA.W #$0E00                                                         ;A5A091;
    STA.B $18                                                            ;A5A094;
    JSL.L Create_Sprite_Object                                           ;A5A096;
    DEY                                                                  ;A5A09A;
    DEY                                                                  ;A5A09B;
    DEY                                                                  ;A5A09C;
    DEY                                                                  ;A5A09D;
    DEX                                                                  ;A5A09E;
    BPL loopLeft                                                         ;A5A09F;
    LDX.W #$0002                                                         ;A5A0A1;

.loopRight:
    LDA.W DraygonDeathSequenceEvirSpawnPositions_X,Y                     ;A5A0A4;
    STA.B $12                                                            ;A5A0A7;
    LDA.W DraygonDeathSequenceEvirSpawnPositions_Y,Y                     ;A5A0A9;
    STA.B $14                                                            ;A5A0AC;
    LDA.W #$003C                                                         ;A5A0AE;
    STA.B $16                                                            ;A5A0B1;
    LDA.W #$0E00                                                         ;A5A0B3;
    STA.B $18                                                            ;A5A0B6;
    JSL.L Create_Sprite_Object                                           ;A5A0B8;
    DEY                                                                  ;A5A0BC;
    DEY                                                                  ;A5A0BD;
    DEY                                                                  ;A5A0BE;
    DEY                                                                  ;A5A0BF;
    DEX                                                                  ;A5A0C0;
    BPL .loopRight                                                       ;A5A0C1;
    PLY                                                                  ;A5A0C3;
    PLX                                                                  ;A5A0C4;
    RTS                                                                  ;A5A0C5;


Draygon_ClearSpriteObjects:
    PHX                                                                  ;A5A0C6;
    PHY                                                                  ;A5A0C7;
    LDX.W #$003E                                                         ;A5A0C8;
    LDA.W #$0000                                                         ;A5A0CB;

.loop:
    STA.L $7EEF78,X                                                      ;A5A0CE;
    DEX                                                                  ;A5A0D2;
    DEX                                                                  ;A5A0D3;
    BPL .loop                                                            ;A5A0D4;
    PLY                                                                  ;A5A0D6;
    PLX                                                                  ;A5A0D7;
    RTS                                                                  ;A5A0D8;


SpawnFightIntroEvirSpriteObjects:
    PHX                                                                  ;A5A0D9;
    PHY                                                                  ;A5A0DA;
    LDA.W #$0010                                                         ;A5A0DB;
    STA.B $12                                                            ;A5A0DE;
    LDA.W #$0180                                                         ;A5A0E0;
    STA.B $14                                                            ;A5A0E3;
    LDA.W #$003B                                                         ;A5A0E5;
    STA.B $16                                                            ;A5A0E8;
    LDA.W #$0E00                                                         ;A5A0EA;
    STA.B $18                                                            ;A5A0ED;
    JSL.L Create_Sprite_Object                                           ;A5A0EF;
    LDA.W #$0010                                                         ;A5A0F3;
    STA.B $12                                                            ;A5A0F6;
    LDA.W #$0180                                                         ;A5A0F8;
    STA.B $14                                                            ;A5A0FB;
    LDA.W #$003B                                                         ;A5A0FD;
    STA.B $16                                                            ;A5A100;
    LDA.W #$0E00                                                         ;A5A102;
    STA.B $18                                                            ;A5A105;
    JSL.L Create_Sprite_Object                                           ;A5A107;
    LDA.W #$0010                                                         ;A5A10B;
    STA.B $12                                                            ;A5A10E;
    LDA.W #$0180                                                         ;A5A110;
    STA.B $14                                                            ;A5A113;
    LDA.W #$003B                                                         ;A5A115;
    STA.B $16                                                            ;A5A118;
    LDA.W #$0E00                                                         ;A5A11A;
    STA.B $18                                                            ;A5A11D;
    JSL.L Create_Sprite_Object                                           ;A5A11F;
    LDA.W #$0010                                                         ;A5A123;
    STA.B $12                                                            ;A5A126;
    LDA.W #$0180                                                         ;A5A128;
    STA.B $14                                                            ;A5A12B;
    LDA.W #$003B                                                         ;A5A12D;
    STA.B $16                                                            ;A5A130;
    LDA.W #$0E00                                                         ;A5A132;
    STA.B $18                                                            ;A5A135;
    JSL.L Create_Sprite_Object                                           ;A5A137;
    PLY                                                                  ;A5A13B;
    PLX                                                                  ;A5A13C;
    RTS                                                                  ;A5A13D;


HandleDraygonFightIntroDance:
    PHY                                                                  ;A5A13E;
    LDX.W #$003E                                                         ;A5A13F;

.loop:
    TXA                                                                  ;A5A142;
    SEC                                                                  ;A5A143;
    SBC.W #$0038                                                         ;A5A144;
    TAY                                                                  ;A5A147;
    LDA.W MovementLatencyForEachEvirSpriteObject,Y                       ;A5A148;
    CLC                                                                  ;A5A14B;
    ADC.L $7E880C                                                        ;A5A14C;
    BMI .next                                                            ;A5A150;
    TAY                                                                  ;A5A152;
    LDA.W DraygonFightIntroDanceData_KeikoLove,Y                         ;A5A153;
    CMP.W #$8080                                                         ;A5A156;
    BEQ .deleteSpriteObject                                              ;A5A159;
    LDA.W DraygonFightIntroDanceData_KeikoLove,Y                         ;A5A15B;
    AND.W #$00FF                                                         ;A5A15E;
    JSL.L Sign_Extend_A                                                  ;A5A161;
    CLC                                                                  ;A5A165;
    ADC.L $7EF0F8,X                                                      ;A5A166;
    STA.L $7EF0F8,X                                                      ;A5A16A;
    LDA.W DraygonFightIntroDanceData_KeikoLove+1,Y                       ;A5A16E;
    AND.W #$00FF                                                         ;A5A171;
    JSL.L Sign_Extend_A                                                  ;A5A174;
    CLC                                                                  ;A5A178;
    ADC.L $7EF1F8,X                                                      ;A5A179;
    STA.L $7EF1F8,X                                                      ;A5A17D;

.next:
    DEX                                                                  ;A5A181;
    DEX                                                                  ;A5A182;
    CPX.W #$0038                                                         ;A5A183;
    BPL .loop                                                            ;A5A186;
    LDA.L $7E880C                                                        ;A5A188;
    INC A                                                                ;A5A18C;
    INC A                                                                ;A5A18D;
    INC A                                                                ;A5A18E;
    INC A                                                                ;A5A18F;
    STA.L $7E880C                                                        ;A5A190;
    PLY                                                                  ;A5A194;
    RTS                                                                  ;A5A195;


.deleteSpriteObject:
    LDA.W #$0000                                                         ;A5A196;
    STA.L $7EEF78,X                                                      ;A5A199;
    BRA .next                                                            ;A5A19D;


MovementLatencyForEachEvirSpriteObject:
    dw $FC80,$FD00,$FD80,$FE00                                           ;A5A19F;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_MovementLatencyForEachEvirSpriteObject_A5A1A7:
    dw $FE80,$FF00,$FF80,$0000                                           ;A5A1A7;
endif ; !FEATURE_KEEP_UNREFERENCED

DraygonDeathSequenceEvirSubSpeeds_X:
    dw $D4DA                                                             ;A5A1AF;

DraygonDeathSequenceEvirSubSpeeds_Y:
    dw $8E39,$8E39,$D4DA,$31F1,$FB13,$31F1,$FB13,$8E39                   ;A5A1B1;
    dw $D4DA,$D4DA,$8E39                                                 ;A5A1C1;

DraygonDeathSequenceEvirSpawnPositions_X:
    dw $FF59                                                             ;A5A1C7;

DraygonDeathSequenceEvirSpawnPositions_Y:
    dw $00E5,$FFE5,$0059,$009C,$000D,$0163,$000D,$021A                   ;A5A1C9;
    dw $0059,$02A6,$00E5                                                 ;A5A1D9;

DraygonDeathSequenceEvirAngles:
    dw $0068,$0000,$0058,$0000,$0048,$0000,$0038,$0000                   ;A5A1DF;
    dw $0028,$0000,$0018,$0000                                           ;A5A1EF;

Palette_Draygon_Sprite7:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5A1F7;
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145                   ;A5A207;

Palette_Draygon_Sprite1:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5A217;
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145                   ;A5A227;

Palette_Draygon_Sprite2:
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B                   ;A5A237;
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$03E0                   ;A5A247;

Palette_Draygon_Sprite3:
    dw $3800,$4B9C,$3694,$0929,$0042,$42F7,$2A52,$19AD                   ;A5A257;
    dw $116B,$1420,$1420,$1420,$1420,$1420,$1420,$1420                   ;A5A267;

Palette_Draygon_BG12_5:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5A277;
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145                   ;A5A287;

Palette_Draygon_WhiteFlash:
    dw $3800,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A5A297;
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF                   ;A5A2A7;

ExtendedSpritemap_Draygon_0:
    dw $0001,$0000,$0000                                                 ;A5A2B7;
    dw Spritemap_Draygon_0                                               ;A5A2BD;
    dw Hitbox_Draygon_1B                                                 ;A5A2BF;

ExtendedSpritemap_Draygon_1:
    dw $0001,$0000,$0000                                                 ;A5A2C1;
    dw Spritemap_Draygon_0                                               ;A5A2C7;
    dw Hitbox_Draygon_1B                                                 ;A5A2C9;

ExtendedSpritemap_Draygon_2:
    dw $0001,$0000,$0000                                                 ;A5A2CB;
    dw Spritemap_Draygon_0                                               ;A5A2D1;
    dw Hitbox_Draygon_1B                                                 ;A5A2D3;

ExtendedSpritemap_Draygon_3:
    dw $0001,$0000,$0000                                                 ;A5A2D5;
    dw Spritemap_Draygon_0                                               ;A5A2DB;
    dw Hitbox_Draygon_1B                                                 ;A5A2DD;

ExtendedSpritemap_Draygon_4:
    dw $0001,$0000,$0001                                                 ;A5A2DF;
    dw Spritemap_Draygon_B                                               ;A5A2E5;
    dw Hitbox_Draygon_1B                                                 ;A5A2E7;

ExtendedSpritemap_Draygon_5:
    dw $0001,$0000,$0001                                                 ;A5A2E9;
    dw Spritemap_Draygon_C                                               ;A5A2EF;
    dw Hitbox_Draygon_1B                                                 ;A5A2F1;

ExtendedSpritemap_Draygon_6:
    dw $0001,$0000,$0001                                                 ;A5A2F3;
    dw Spritemap_Draygon_D                                               ;A5A2F9;
    dw Hitbox_Draygon_1B                                                 ;A5A2FB;

ExtendedSpritemap_Draygon_7:
    dw $0001,$0000,$0001                                                 ;A5A2FD;
    dw Spritemap_Draygon_E                                               ;A5A303;
    dw Hitbox_Draygon_1B                                                 ;A5A305;

ExtendedSpritemap_Draygon_8:
    dw $0001,$0000,$0001                                                 ;A5A307;
    dw Spritemap_Draygon_F                                               ;A5A30D;
    dw Hitbox_Draygon_1B                                                 ;A5A30F;

ExtendedSpritemap_Draygon_9:
    dw $0001,$0000,$0001                                                 ;A5A311;
    dw Spritemap_Draygon_10                                              ;A5A317;
    dw Hitbox_Draygon_1B                                                 ;A5A319;

ExtendedSpritemap_Draygon_A:
    dw $0001,$0000,$0000                                                 ;A5A31B;
    dw ExtendedTilemap_Draygon_B                                         ;A5A321;
    dw Hitbox_Draygon_1A                                                 ;A5A323;

ExtendedSpritemap_Draygon_B:
    dw $0001,$0000,$0000                                                 ;A5A325;
    dw ExtendedTilemap_Draygon_C                                         ;A5A32B;
    dw Hitbox_Draygon_1A                                                 ;A5A32D;

ExtendedSpritemap_Draygon_C:
    dw $0001,$0000,$0000                                                 ;A5A32F;
    dw ExtendedTilemap_Draygon_D                                         ;A5A335;
    dw Hitbox_Draygon_1A                                                 ;A5A337;

ExtendedSpritemap_Draygon_D:
    dw $0001,$0000,$0000                                                 ;A5A339;
    dw ExtendedTilemap_Draygon_E                                         ;A5A33F;
    dw Hitbox_Draygon_1A                                                 ;A5A341;

ExtendedSpritemap_Draygon_E:
    dw $0001,$0000,$0000                                                 ;A5A343;
    dw ExtendedTilemap_Draygon_7                                         ;A5A349;
    dw Hitbox_Draygon_1A                                                 ;A5A34B;

ExtendedSpritemap_Draygon_F:
    dw $0001,$0000,$0000                                                 ;A5A34D;
    dw ExtendedTilemap_Draygon_8                                         ;A5A353;
    dw Hitbox_Draygon_1A                                                 ;A5A355;

ExtendedSpritemap_Draygon_10:
    dw $0001,$0000,$0000                                                 ;A5A357;
    dw ExtendedTilemap_Draygon_9                                         ;A5A35D;
    dw Hitbox_Draygon_1A                                                 ;A5A35F;

ExtendedSpritemap_Draygon_11:
    dw $0001,$0000,$0000                                                 ;A5A361;
    dw ExtendedTilemap_Draygon_A                                         ;A5A367;
    dw Hitbox_Draygon_1A                                                 ;A5A369;

ExtendedSpritemap_Draygon_12:
    dw $0001,$0000,$0000                                                 ;A5A36B;
    dw ExtendedTilemap_Draygon_F                                         ;A5A371;
    dw Hitbox_Draygon_1B                                                 ;A5A373;

ExtendedSpritemap_Draygon_13:
    dw $0001,$0000,$0000                                                 ;A5A375;
    dw ExtendedTilemap_Draygon_10                                        ;A5A37B;
    dw Hitbox_Draygon_1B                                                 ;A5A37D;

ExtendedSpritemap_Draygon_14:
    dw $0001,$0000,$0000                                                 ;A5A37F;
    dw ExtendedTilemap_Draygon_11                                        ;A5A385;
    dw Hitbox_Draygon_1B                                                 ;A5A387;

ExtendedSpritemap_Draygon_15:
    dw $0001,$0000,$0000                                                 ;A5A389;
    dw ExtendedTilemap_Draygon_12                                        ;A5A38F;
    dw Hitbox_Draygon_1B                                                 ;A5A391;

ExtendedSpritemap_Draygon_16:
    dw $0001,$0000,$0000                                                 ;A5A393;
    dw ExtendedTilemap_Draygon_13                                        ;A5A399;
    dw Hitbox_Draygon_1B                                                 ;A5A39B;

ExtendedSpritemap_Draygon_17:
    dw $0001,$0000,$0000                                                 ;A5A39D;
    dw ExtendedTilemap_Draygon_14                                        ;A5A3A3;
    dw Hitbox_Draygon_1B                                                 ;A5A3A5;

ExtendedSpritemap_Draygon_18:
    dw $0001,$0000,$0000                                                 ;A5A3A7;
    dw ExtendedTilemap_Draygon_15                                        ;A5A3AD;
    dw Hitbox_Draygon_1B                                                 ;A5A3AF;

ExtendedSpritemap_Draygon_19:
    dw $0001,$0000,$0000                                                 ;A5A3B1;
    dw ExtendedTilemap_Draygon_16                                        ;A5A3B7;
    dw Hitbox_Draygon_1B                                                 ;A5A3B9;

ExtendedSpritemap_Draygon_1A:
    dw $0001,$0000,$0000                                                 ;A5A3BB;
    dw ExtendedTilemap_Draygon_17                                        ;A5A3C1;
    dw Hitbox_Draygon_1A                                                 ;A5A3C3;

ExtendedSpritemap_Draygon_1B:
    dw $0001,$0000,$0001                                                 ;A5A3C5;
    dw Spritemap_Draygon_3                                               ;A5A3CB;
    dw Hitbox_Draygon_1B                                                 ;A5A3CD;

ExtendedSpritemap_Draygon_1C:
    dw $0001,$0000,$0001                                                 ;A5A3CF;
    dw Spritemap_Draygon_4                                               ;A5A3D5;
    dw Hitbox_Draygon_1B                                                 ;A5A3D7;

ExtendedSpritemap_Draygon_1D:
    dw $0001,$0000,$0001                                                 ;A5A3D9;
    dw Spritemap_Draygon_5                                               ;A5A3DF;
    dw Hitbox_Draygon_1B                                                 ;A5A3E1;

ExtendedSpritemap_Draygon_1E:
    dw $0001,$0000,$0001                                                 ;A5A3E3;
    dw Spritemap_Draygon_6                                               ;A5A3E9;
    dw Hitbox_Draygon_1B                                                 ;A5A3EB;

ExtendedSpritemap_Draygon_1F:
    dw $0001,$0029,$0001                                                 ;A5A3ED;
    dw Spritemap_Draygon_0                                               ;A5A3F3;
    dw Hitbox_Draygon_1B                                                 ;A5A3F5;

ExtendedSpritemap_Draygon_20:
    dw $0001,$0000,$0000                                                 ;A5A3F7;
    dw ExtendedTilemap_Draygon_5                                         ;A5A3FD;
    dw Hitbox_Draygon_12                                                 ;A5A3FF;

ExtendedSpritemap_Draygon_21:
    dw $0001,$0000,$0000                                                 ;A5A401;
    dw ExtendedTilemap_Draygon_6                                         ;A5A407;
    dw Hitbox_Draygon_12                                                 ;A5A409;

ExtendedSpritemap_Draygon_22:
    dw $0002,$001B,$003F                                                 ;A5A40B;
    dw Spritemap_Draygon_1A                                              ;A5A411;
    dw Hitbox_Draygon_1B                                                 ;A5A413;
    dw $0037,$0021                                                       ;A5A415;
    dw Spritemap_Draygon_7                                               ;A5A419;
    dw Hitbox_Draygon_1B                                                 ;A5A41B;

ExtendedSpritemap_Draygon_23:
    dw $0002,$0017,$003D                                                 ;A5A41D;
    dw Spritemap_Draygon_19                                              ;A5A423;
    dw Hitbox_Draygon_1B                                                 ;A5A425;
    dw $0037,$0021                                                       ;A5A427;
    dw Spritemap_Draygon_7                                               ;A5A42B;
    dw Hitbox_Draygon_1B                                                 ;A5A42D;

ExtendedSpritemap_Draygon_24:
    dw $0002,$0013,$003A                                                 ;A5A42F;
    dw Spritemap_Draygon_18                                              ;A5A435;
    dw Hitbox_Draygon_1B                                                 ;A5A437;
    dw $0037,$0021                                                       ;A5A439;
    dw Spritemap_Draygon_8                                               ;A5A43D;
    dw Hitbox_Draygon_1B                                                 ;A5A43F;

ExtendedSpritemap_Draygon_25:
    dw $0002,$000E,$0035                                                 ;A5A441;
    dw Spritemap_Draygon_17                                              ;A5A447;
    dw Hitbox_Draygon_1B                                                 ;A5A449;
    dw $0037,$0021                                                       ;A5A44B;
    dw Spritemap_Draygon_8                                               ;A5A44F;
    dw Hitbox_Draygon_1B                                                 ;A5A451;

ExtendedSpritemap_Draygon_26:
    dw $0002,$000C,$002E                                                 ;A5A453;
    dw Spritemap_Draygon_16                                              ;A5A459;
    dw Hitbox_Draygon_1B                                                 ;A5A45B;
    dw $0037,$0021                                                       ;A5A45D;
    dw Spritemap_Draygon_9                                               ;A5A461;
    dw Hitbox_Draygon_1B                                                 ;A5A463;

ExtendedSpritemap_Draygon_27:
    dw $0002,$000E,$002D                                                 ;A5A465;
    dw Spritemap_Draygon_15                                              ;A5A46B;
    dw Hitbox_Draygon_1B                                                 ;A5A46D;
    dw $0037,$0021                                                       ;A5A46F;
    dw Spritemap_Draygon_9                                               ;A5A473;
    dw Hitbox_Draygon_1B                                                 ;A5A475;

ExtendedSpritemap_Draygon_28:
    dw $0002,$0011,$0028                                                 ;A5A477;
    dw Spritemap_Draygon_14                                              ;A5A47D;
    dw Hitbox_Draygon_1B                                                 ;A5A47F;
    dw $0037,$0021                                                       ;A5A481;
    dw Spritemap_Draygon_A                                               ;A5A485;
    dw Hitbox_Draygon_1B                                                 ;A5A487;

ExtendedSpritemap_Draygon_29:
    dw $0003,$000B,$003C                                                 ;A5A489;
    dw Spritemap_Draygon_18                                              ;A5A48F;
    dw Hitbox_Draygon_1B                                                 ;A5A491;
    dw $0019,$0032                                                       ;A5A493;
    dw Spritemap_Draygon_24                                              ;A5A497;
    dw Hitbox_Draygon_1B                                                 ;A5A499;
    dw $0037,$0021                                                       ;A5A49B;
    dw Spritemap_Draygon_7                                               ;A5A49F;
    dw Hitbox_Draygon_1B                                                 ;A5A4A1;

ExtendedSpritemap_Draygon_2A:
    dw $0004,$0008,$0043                                                 ;A5A4A3;
    dw Spritemap_Draygon_18                                              ;A5A4A9;
    dw Hitbox_Draygon_1B                                                 ;A5A4AB;
    dw $0014,$0036                                                       ;A5A4AD;
    dw Spritemap_Draygon_24                                              ;A5A4B1;
    dw Hitbox_Draygon_1B                                                 ;A5A4B3;
    dw $0018,$0031                                                       ;A5A4B5;
    dw Spritemap_Draygon_24                                              ;A5A4B9;
    dw Hitbox_Draygon_1B                                                 ;A5A4BB;
    dw $0037,$0021                                                       ;A5A4BD;
    dw Spritemap_Draygon_7                                               ;A5A4C1;
    dw Hitbox_Draygon_1B                                                 ;A5A4C3;

ExtendedSpritemap_Draygon_2B:
    dw $0005,$0009,$004D                                                 ;A5A4C5;
    dw Spritemap_Draygon_19                                              ;A5A4CB;
    dw Hitbox_Draygon_1B                                                 ;A5A4CD;
    dw $000F,$003D                                                       ;A5A4CF;
    dw Spritemap_Draygon_24                                              ;A5A4D3;
    dw Hitbox_Draygon_1B                                                 ;A5A4D5;
    dw $0013,$0036                                                       ;A5A4D7;
    dw Spritemap_Draygon_24                                              ;A5A4DB;
    dw Hitbox_Draygon_1B                                                 ;A5A4DD;
    dw $0019,$0031                                                       ;A5A4DF;
    dw Spritemap_Draygon_23                                              ;A5A4E3;
    dw Hitbox_Draygon_1B                                                 ;A5A4E5;
    dw $0037,$0021                                                       ;A5A4E7;
    dw Spritemap_Draygon_8                                               ;A5A4EB;
    dw Hitbox_Draygon_1B                                                 ;A5A4ED;

ExtendedSpritemap_Draygon_2C:
    dw $0006,$FFF8,$004D                                                 ;A5A4EF;
    dw Spritemap_Draygon_18                                              ;A5A4F5;
    dw Hitbox_Draygon_1B                                                 ;A5A4F7;
    dw $0007,$0042                                                       ;A5A4F9;
    dw Spritemap_Draygon_24                                              ;A5A4FD;
    dw Hitbox_Draygon_1B                                                 ;A5A4FF;
    dw $000C,$003C                                                       ;A5A501;
    dw Spritemap_Draygon_24                                              ;A5A505;
    dw Hitbox_Draygon_1B                                                 ;A5A507;
    dw $0013,$0037                                                       ;A5A509;
    dw Spritemap_Draygon_23                                              ;A5A50D;
    dw Hitbox_Draygon_1B                                                 ;A5A50F;
    dw $001A,$0032                                                       ;A5A511;
    dw Spritemap_Draygon_23                                              ;A5A515;
    dw Hitbox_Draygon_1B                                                 ;A5A517;
    dw $0037,$0021                                                       ;A5A519;
    dw Spritemap_Draygon_9                                               ;A5A51D;
    dw Hitbox_Draygon_1B                                                 ;A5A51F;

ExtendedSpritemap_Draygon_2D:
    dw $0007,$FFEC,$0037                                                 ;A5A521;
    dw Spritemap_Draygon_15                                              ;A5A527;
    dw Hitbox_Draygon_1B                                                 ;A5A529;
    dw $FFFC,$003D                                                       ;A5A52B;
    dw Spritemap_Draygon_24                                              ;A5A52F;
    dw Hitbox_Draygon_1B                                                 ;A5A531;
    dw $0005,$003F                                                       ;A5A533;
    dw Spritemap_Draygon_24                                              ;A5A537;
    dw Hitbox_Draygon_1B                                                 ;A5A539;
    dw $000D,$003E                                                       ;A5A53B;
    dw Spritemap_Draygon_23                                              ;A5A53F;
    dw Hitbox_Draygon_1B                                                 ;A5A541;
    dw $0015,$003A                                                       ;A5A543;
    dw Spritemap_Draygon_23                                              ;A5A547;
    dw Hitbox_Draygon_1B                                                 ;A5A549;
    dw $001B,$0034                                                       ;A5A54B;
    dw Spritemap_Draygon_22                                              ;A5A54F;
    dw Hitbox_Draygon_1B                                                 ;A5A551;
    dw $0037,$0021                                                       ;A5A553;
    dw Spritemap_Draygon_A                                               ;A5A557;
    dw Hitbox_Draygon_1B                                                 ;A5A559;

ExtendedSpritemap_Draygon_2E:
    dw $0008,$FFED,$002E                                                 ;A5A55B;
    dw Spritemap_Draygon_14                                              ;A5A561;
    dw Hitbox_Draygon_1B                                                 ;A5A563;
    dw $FFF9,$003A                                                       ;A5A565;
    dw Spritemap_Draygon_24                                              ;A5A569;
    dw Hitbox_Draygon_1B                                                 ;A5A56B;
    dw $0000,$0040                                                       ;A5A56D;
    dw Spritemap_Draygon_24                                              ;A5A571;
    dw Hitbox_Draygon_1B                                                 ;A5A573;
    dw $0008,$0041                                                       ;A5A575;
    dw Spritemap_Draygon_23                                              ;A5A579;
    dw Hitbox_Draygon_1B                                                 ;A5A57B;
    dw $0011,$0043                                                       ;A5A57D;
    dw Spritemap_Draygon_23                                              ;A5A581;
    dw Hitbox_Draygon_1B                                                 ;A5A583;
    dw $0019,$003F                                                       ;A5A585;
    dw Spritemap_Draygon_22                                              ;A5A589;
    dw Hitbox_Draygon_1B                                                 ;A5A58B;
    dw $001D,$0035                                                       ;A5A58D;
    dw Spritemap_Draygon_22                                              ;A5A591;
    dw Hitbox_Draygon_1B                                                 ;A5A593;
    dw $0037,$0021                                                       ;A5A595;
    dw Spritemap_Draygon_A                                               ;A5A599;
    dw Hitbox_Draygon_1B                                                 ;A5A59B;

ExtendedSpritemap_Draygon_2F:
    dw $0008,$FFF7,$0025                                                 ;A5A59D;
    dw Spritemap_Draygon_12                                              ;A5A5A3;
    dw Hitbox_Draygon_1B                                                 ;A5A5A5;
    dw $FFF8,$0038                                                       ;A5A5A7;
    dw Spritemap_Draygon_24                                              ;A5A5AB;
    dw Hitbox_Draygon_1B                                                 ;A5A5AD;
    dw $FFFD,$0041                                                       ;A5A5AF;
    dw Spritemap_Draygon_24                                              ;A5A5B3;
    dw Hitbox_Draygon_1B                                                 ;A5A5B5;
    dw $0006,$0043                                                       ;A5A5B7;
    dw Spritemap_Draygon_23                                              ;A5A5BB;
    dw Hitbox_Draygon_1B                                                 ;A5A5BD;
    dw $0010,$0044                                                       ;A5A5BF;
    dw Spritemap_Draygon_23                                              ;A5A5C3;
    dw Hitbox_Draygon_1B                                                 ;A5A5C5;
    dw $0018,$0041                                                       ;A5A5C7;
    dw Spritemap_Draygon_22                                              ;A5A5CB;
    dw Hitbox_Draygon_1B                                                 ;A5A5CD;
    dw $001E,$0037                                                       ;A5A5CF;
    dw Spritemap_Draygon_22                                              ;A5A5D3;
    dw Hitbox_Draygon_1B                                                 ;A5A5D5;
    dw $0037,$0021                                                       ;A5A5D7;
    dw Spritemap_Draygon_A                                               ;A5A5DB;
    dw Hitbox_Draygon_1B                                                 ;A5A5DD;

ExtendedSpritemap_Draygon_30:
    dw $0001,$0000,$0000                                                 ;A5A5DF;
    dw Spritemap_Draygon_28                                              ;A5A5E5;
    dw Hitbox_Draygon_1B                                                 ;A5A5E7;

ExtendedSpritemap_Draygon_31:
    dw $0001,$0000,$0000                                                 ;A5A5E9;
    dw Spritemap_Draygon_28                                              ;A5A5EF;
    dw Hitbox_Draygon_1B                                                 ;A5A5F1;

ExtendedSpritemap_Draygon_32:
    dw $0001,$0000,$0000                                                 ;A5A5F3;
    dw Spritemap_Draygon_28                                              ;A5A5F9;
    dw Hitbox_Draygon_1B                                                 ;A5A5FB;

ExtendedSpritemap_Draygon_33:
    dw $0001,$0000,$0000                                                 ;A5A5FD;
    dw Spritemap_Draygon_28                                              ;A5A603;
    dw Hitbox_Draygon_1B                                                 ;A5A605;

ExtendedSpritemap_Draygon_34:
    dw $0001,$0000,$0001                                                 ;A5A607;
    dw Spritemap_Draygon_41                                              ;A5A60D;
    dw Hitbox_Draygon_1B                                                 ;A5A60F;

ExtendedSpritemap_Draygon_35:
    dw $0001,$0000,$0001                                                 ;A5A611;
    dw Spritemap_Draygon_42                                              ;A5A617;
    dw Hitbox_Draygon_1B                                                 ;A5A619;

ExtendedSpritemap_Draygon_36:
    dw $0001,$0000,$0001                                                 ;A5A61B;
    dw Spritemap_Draygon_43                                              ;A5A621;
    dw Hitbox_Draygon_1B                                                 ;A5A623;

ExtendedSpritemap_Draygon_37:
    dw $0001,$0000,$0001                                                 ;A5A625;
    dw Spritemap_Draygon_44                                              ;A5A62B;
    dw Hitbox_Draygon_1B                                                 ;A5A62D;

ExtendedSpritemap_Draygon_38:
    dw $0001,$0000,$0001                                                 ;A5A62F;
    dw Spritemap_Draygon_45                                              ;A5A635;
    dw Hitbox_Draygon_1B                                                 ;A5A637;

ExtendedSpritemap_Draygon_39:
    dw $0001,$0000,$0001                                                 ;A5A639;
    dw Spritemap_Draygon_46                                              ;A5A63F;
    dw Hitbox_Draygon_1B                                                 ;A5A641;

ExtendedSpritemap_Draygon_3A:
    dw $0001,$0000,$0000                                                 ;A5A643;
    dw ExtendedTilemap_Draygon_23                                        ;A5A649;
    dw Hitbox_Draygon_2D                                                 ;A5A64B;

ExtendedSpritemap_Draygon_3B:
    dw $0001,$0000,$0000                                                 ;A5A64D;
    dw ExtendedTilemap_Draygon_24                                        ;A5A653;
    dw Hitbox_Draygon_2D                                                 ;A5A655;

ExtendedSpritemap_Draygon_3C:
    dw $0001,$0000,$0000                                                 ;A5A657;
    dw ExtendedTilemap_Draygon_25                                        ;A5A65D;
    dw Hitbox_Draygon_2D                                                 ;A5A65F;

ExtendedSpritemap_Draygon_3D:
    dw $0001,$0000,$0000                                                 ;A5A661;
    dw ExtendedTilemap_Draygon_26                                        ;A5A667;
    dw Hitbox_Draygon_2D                                                 ;A5A669;

ExtendedSpritemap_Draygon_3E:
    dw $0001,$0000,$0000                                                 ;A5A66B;
    dw ExtendedTilemap_Draygon_1F                                        ;A5A671;
    dw Hitbox_Draygon_2D                                                 ;A5A673;

ExtendedSpritemap_Draygon_3F:
    dw $0001,$0000,$0000                                                 ;A5A675;
    dw ExtendedTilemap_Draygon_20                                        ;A5A67B;
    dw Hitbox_Draygon_2D                                                 ;A5A67D;

ExtendedSpritemap_Draygon_40:
    dw $0001,$0000,$0000                                                 ;A5A67F;
    dw ExtendedTilemap_Draygon_21                                        ;A5A685;
    dw Hitbox_Draygon_2D                                                 ;A5A687;

ExtendedSpritemap_Draygon_41:
    dw $0001,$0000,$0000                                                 ;A5A689;
    dw ExtendedTilemap_Draygon_22                                        ;A5A68F;
    dw Hitbox_Draygon_2D                                                 ;A5A691;

ExtendedSpritemap_Draygon_42:
    dw $0001,$0000,$0000                                                 ;A5A693;
    dw ExtendedTilemap_Draygon_27                                        ;A5A699;
    dw Hitbox_Draygon_1B                                                 ;A5A69B;

ExtendedSpritemap_Draygon_43:
    dw $0001,$0000,$0000                                                 ;A5A69D;
    dw ExtendedTilemap_Draygon_28                                        ;A5A6A3;
    dw Hitbox_Draygon_1B                                                 ;A5A6A5;

ExtendedSpritemap_Draygon_44:
    dw $0001,$0000,$0000                                                 ;A5A6A7;
    dw ExtendedTilemap_Draygon_29                                        ;A5A6AD;
    dw Hitbox_Draygon_1B                                                 ;A5A6AF;

ExtendedSpritemap_Draygon_45:
    dw $0001,$0000,$0000                                                 ;A5A6B1;
    dw ExtendedTilemap_Draygon_2A                                        ;A5A6B7;
    dw Hitbox_Draygon_1B                                                 ;A5A6B9;

ExtendedSpritemap_Draygon_46:
    dw $0001,$0000,$0000                                                 ;A5A6BB;
    dw ExtendedTilemap_Draygon_2B                                        ;A5A6C1;
    dw Hitbox_Draygon_1B                                                 ;A5A6C3;

ExtendedSpritemap_Draygon_47:
    dw $0001,$0000,$0000                                                 ;A5A6C5;
    dw ExtendedTilemap_Draygon_2C                                        ;A5A6CB;
    dw Hitbox_Draygon_1B                                                 ;A5A6CD;

ExtendedSpritemap_Draygon_48:
    dw $0001,$0000,$0000                                                 ;A5A6CF;
    dw ExtendedTilemap_Draygon_2D                                        ;A5A6D5;
    dw Hitbox_Draygon_1B                                                 ;A5A6D7;

ExtendedSpritemap_Draygon_49:
    dw $0001,$0000,$0000                                                 ;A5A6D9;
    dw ExtendedTilemap_Draygon_2E                                        ;A5A6DF;
    dw Hitbox_Draygon_1B                                                 ;A5A6E1;

ExtendedSpritemap_Draygon_4A:
    dw $0001,$0000,$0000                                                 ;A5A6E3;
    dw ExtendedTilemap_Draygon_2F                                        ;A5A6E9;
    dw Hitbox_Draygon_2D                                                 ;A5A6EB;

ExtendedSpritemap_Draygon_4B:
    dw $0001,$0000,$0001                                                 ;A5A6ED;
    dw Spritemap_Draygon_2B                                              ;A5A6F3;
    dw Hitbox_Draygon_1B                                                 ;A5A6F5;

ExtendedSpritemap_Draygon_4C:
    dw $0001,$0000,$0001                                                 ;A5A6F7;
    dw Spritemap_Draygon_2C                                              ;A5A6FD;
    dw Hitbox_Draygon_1B                                                 ;A5A6FF;

ExtendedSpritemap_Draygon_4D:
    dw $0001,$0000,$0001                                                 ;A5A701;
    dw Spritemap_Draygon_2D                                              ;A5A707;
    dw Hitbox_Draygon_1B                                                 ;A5A709;

ExtendedSpritemap_Draygon_4E:
    dw $0001,$0000,$0001                                                 ;A5A70B;
    dw Spritemap_Draygon_2E                                              ;A5A711;
    dw Hitbox_Draygon_1B                                                 ;A5A713;

ExtendedSpritemap_Draygon_4F:
    dw $0001,$0000,$0000                                                 ;A5A715;
    dw Spritemap_Draygon_28                                              ;A5A71B;
    dw Hitbox_Draygon_1B                                                 ;A5A71D;

ExtendedSpritemap_Draygon_50:
    dw $0001,$0000,$0000                                                 ;A5A71F;
    dw Spritemap_Draygon_28                                              ;A5A725;
    dw Hitbox_Draygon_1B                                                 ;A5A727;

ExtendedSpritemap_Draygon_51:
    dw $0001,$0000,$0000                                                 ;A5A729;
    dw Spritemap_Draygon_28                                              ;A5A72F;
    dw Hitbox_Draygon_1B                                                 ;A5A731;

ExtendedSpritemap_Draygon_52:
    dw $0001,$0000,$0000                                                 ;A5A733;
    dw Spritemap_Draygon_28                                              ;A5A739;
    dw Hitbox_Draygon_1B                                                 ;A5A73B;

ExtendedSpritemap_Draygon_53:
    dw $0001,$0000,$0000                                                 ;A5A73D;
    dw Spritemap_Draygon_28                                              ;A5A743;
    dw Hitbox_Draygon_1B                                                 ;A5A745;

ExtendedSpritemap_Draygon_54:
    dw $0001,$0000,$0000                                                 ;A5A747;
    dw Spritemap_Draygon_28                                              ;A5A74D;
    dw Hitbox_Draygon_1B                                                 ;A5A74F;

ExtendedSpritemap_Draygon_55:
    dw $0001,$0000,$0000                                                 ;A5A751;
    dw Spritemap_Draygon_28                                              ;A5A757;
    dw Hitbox_Draygon_1B                                                 ;A5A759;

ExtendedSpritemap_Draygon_56:
    dw $0001,$0000,$0000                                                 ;A5A75B;
    dw Spritemap_Draygon_28                                              ;A5A761;
    dw Hitbox_Draygon_1B                                                 ;A5A763;

ExtendedSpritemap_Draygon_57:
    dw $0001,$0000,$0000                                                 ;A5A765;
    dw ExtendedTilemap_Draygon_1D                                        ;A5A76B;
    dw Hitbox_Draygon_29                                                 ;A5A76D;

ExtendedSpritemap_Draygon_58:
    dw $0001,$0000,$0000                                                 ;A5A76F;
    dw ExtendedTilemap_Draygon_1E                                        ;A5A775;
    dw Hitbox_Draygon_29                                                 ;A5A777;

ExtendedSpritemap_Draygon_59:
    dw $0002,$FFE5,$003F                                                 ;A5A779;
    dw Spritemap_Draygon_50                                              ;A5A77F;
    dw Hitbox_Draygon_1B                                                 ;A5A781;
    dw $FFCE,$0021                                                       ;A5A783;
    dw Spritemap_Draygon_34                                              ;A5A787;
    dw Hitbox_Draygon_1B                                                 ;A5A789;

ExtendedSpritemap_Draygon_5A:
    dw $0002,$FFE9,$003D                                                 ;A5A78B;
    dw Spritemap_Draygon_4F                                              ;A5A791;
    dw Hitbox_Draygon_1B                                                 ;A5A793;
    dw $FFCE,$0021                                                       ;A5A795;
    dw Spritemap_Draygon_34                                              ;A5A799;
    dw Hitbox_Draygon_1B                                                 ;A5A79B;

ExtendedSpritemap_Draygon_5B:
    dw $0002,$FFED,$003A                                                 ;A5A79D;
    dw Spritemap_Draygon_4E                                              ;A5A7A3;
    dw Hitbox_Draygon_1B                                                 ;A5A7A5;
    dw $FFCE,$0021                                                       ;A5A7A7;
    dw Spritemap_Draygon_35                                              ;A5A7AB;
    dw Hitbox_Draygon_1B                                                 ;A5A7AD;

ExtendedSpritemap_Draygon_5C:
    dw $0002,$FFF2,$0035                                                 ;A5A7AF;
    dw Spritemap_Draygon_4D                                              ;A5A7B5;
    dw Hitbox_Draygon_1B                                                 ;A5A7B7;
    dw $FFCE,$0021                                                       ;A5A7B9;
    dw Spritemap_Draygon_35                                              ;A5A7BD;
    dw Hitbox_Draygon_1B                                                 ;A5A7BF;

ExtendedSpritemap_Draygon_5D:
    dw $0002,$FFF4,$002E                                                 ;A5A7C1;
    dw Spritemap_Draygon_4C                                              ;A5A7C7;
    dw Hitbox_Draygon_1B                                                 ;A5A7C9;
    dw $FFCE,$0021                                                       ;A5A7CB;
    dw Spritemap_Draygon_3F                                              ;A5A7CF;
    dw Hitbox_Draygon_1B                                                 ;A5A7D1;

ExtendedSpritemap_Draygon_5E:
    dw $0002,$FFF2,$002D                                                 ;A5A7D3;
    dw Spritemap_Draygon_4B                                              ;A5A7D9;
    dw Hitbox_Draygon_1B                                                 ;A5A7DB;
    dw $FFCE,$0021                                                       ;A5A7DD;
    dw Spritemap_Draygon_3F                                              ;A5A7E1;
    dw Hitbox_Draygon_1B                                                 ;A5A7E3;

ExtendedSpritemap_Draygon_5F:
    dw $0002,$FFEF,$0028                                                 ;A5A7E5;
    dw Spritemap_Draygon_4A                                              ;A5A7EB;
    dw Hitbox_Draygon_1B                                                 ;A5A7ED;
    dw $FFCE,$0021                                                       ;A5A7EF;
    dw Spritemap_Draygon_40                                              ;A5A7F3;
    dw Hitbox_Draygon_1B                                                 ;A5A7F5;

ExtendedSpritemap_Draygon_60:
    dw $0003,$FFF5,$003C                                                 ;A5A7F7;
    dw Spritemap_Draygon_4E                                              ;A5A7FD;
    dw Hitbox_Draygon_2E                                                 ;A5A7FF;
    dw $FFE7,$0032                                                       ;A5A801;
    dw Spritemap_Draygon_5A                                              ;A5A805;
    dw Hitbox_Draygon_1B                                                 ;A5A807;
    dw $FFCE,$0021                                                       ;A5A809;
    dw Spritemap_Draygon_34                                              ;A5A80D;
    dw Hitbox_Draygon_1B                                                 ;A5A80F;

ExtendedSpritemap_Draygon_61:
    dw $0004,$FFF8,$0043                                                 ;A5A811;
    dw Spritemap_Draygon_4E                                              ;A5A817;
    dw Hitbox_Draygon_2E                                                 ;A5A819;
    dw $FFEC,$0036                                                       ;A5A81B;
    dw Spritemap_Draygon_5A                                              ;A5A81F;
    dw Hitbox_Draygon_1B                                                 ;A5A821;
    dw $FFE8,$0031                                                       ;A5A823;
    dw Spritemap_Draygon_5A                                              ;A5A827;
    dw Hitbox_Draygon_1B                                                 ;A5A829;
    dw $FFCE,$0021                                                       ;A5A82B;
    dw Spritemap_Draygon_34                                              ;A5A82F;
    dw Hitbox_Draygon_1B                                                 ;A5A831;

ExtendedSpritemap_Draygon_62:
    dw $0005,$FFF7,$004D                                                 ;A5A833;
    dw Spritemap_Draygon_4F                                              ;A5A839;
    dw Hitbox_Draygon_2E                                                 ;A5A83B;
    dw $FFF1,$003D                                                       ;A5A83D;
    dw Spritemap_Draygon_5A                                              ;A5A841;
    dw Hitbox_Draygon_1B                                                 ;A5A843;
    dw $FFED,$0036                                                       ;A5A845;
    dw Spritemap_Draygon_5A                                              ;A5A849;
    dw Hitbox_Draygon_1B                                                 ;A5A84B;
    dw $FFE7,$0031                                                       ;A5A84D;
    dw Spritemap_Draygon_59                                              ;A5A851;
    dw Hitbox_Draygon_1B                                                 ;A5A853;
    dw $FFCE,$0021                                                       ;A5A855;
    dw Spritemap_Draygon_35                                              ;A5A859;
    dw Hitbox_Draygon_1B                                                 ;A5A85B;

ExtendedSpritemap_Draygon_63:
    dw $0006,$0008,$004D                                                 ;A5A85D;
    dw Spritemap_Draygon_4E                                              ;A5A863;
    dw Hitbox_Draygon_2E                                                 ;A5A865;
    dw $FFF9,$0042                                                       ;A5A867;
    dw Spritemap_Draygon_5A                                              ;A5A86B;
    dw Hitbox_Draygon_1B                                                 ;A5A86D;
    dw $FFF4,$003C                                                       ;A5A86F;
    dw Spritemap_Draygon_5A                                              ;A5A873;
    dw Hitbox_Draygon_1B                                                 ;A5A875;
    dw $FFED,$0037                                                       ;A5A877;
    dw Spritemap_Draygon_59                                              ;A5A87B;
    dw Hitbox_Draygon_1B                                                 ;A5A87D;
    dw $FFE6,$0032                                                       ;A5A87F;
    dw Spritemap_Draygon_59                                              ;A5A883;
    dw Hitbox_Draygon_1B                                                 ;A5A885;
    dw $FFCE,$0021                                                       ;A5A887;
    dw Spritemap_Draygon_35                                              ;A5A88B;
    dw Hitbox_Draygon_1B                                                 ;A5A88D;

ExtendedSpritemap_Draygon_64:
    dw $0007,$0014,$0037                                                 ;A5A88F;
    dw Spritemap_Draygon_4B                                              ;A5A895;
    dw Hitbox_Draygon_2E                                                 ;A5A897;
    dw $0004,$003D                                                       ;A5A899;
    dw Spritemap_Draygon_5A                                              ;A5A89D;
    dw Hitbox_Draygon_1B                                                 ;A5A89F;
    dw $FFFB,$003F                                                       ;A5A8A1;
    dw Spritemap_Draygon_5A                                              ;A5A8A5;
    dw Hitbox_Draygon_1B                                                 ;A5A8A7;
    dw $FFF3,$003E                                                       ;A5A8A9;
    dw Spritemap_Draygon_59                                              ;A5A8AD;
    dw Hitbox_Draygon_1B                                                 ;A5A8AF;
    dw $FFEB,$003A                                                       ;A5A8B1;
    dw Spritemap_Draygon_59                                              ;A5A8B5;
    dw Hitbox_Draygon_1B                                                 ;A5A8B7;
    dw $FFE5,$0034                                                       ;A5A8B9;
    dw Spritemap_Draygon_58                                              ;A5A8BD;
    dw Hitbox_Draygon_1B                                                 ;A5A8BF;
    dw $FFCE,$0021                                                       ;A5A8C1;
    dw Spritemap_Draygon_3F                                              ;A5A8C5;
    dw Hitbox_Draygon_1B                                                 ;A5A8C7;

ExtendedSpritemap_Draygon_65:
    dw $0008,$0013,$002E                                                 ;A5A8C9;
    dw Spritemap_Draygon_4A                                              ;A5A8CF;
    dw Hitbox_Draygon_2E                                                 ;A5A8D1;
    dw $0007,$003A                                                       ;A5A8D3;
    dw Spritemap_Draygon_5A                                              ;A5A8D7;
    dw Hitbox_Draygon_1B                                                 ;A5A8D9;
    dw $0000,$0040                                                       ;A5A8DB;
    dw Spritemap_Draygon_5A                                              ;A5A8DF;
    dw Hitbox_Draygon_1B                                                 ;A5A8E1;
    dw $FFF8,$0041                                                       ;A5A8E3;
    dw Spritemap_Draygon_59                                              ;A5A8E7;
    dw Hitbox_Draygon_1B                                                 ;A5A8E9;
    dw $FFEF,$0043                                                       ;A5A8EB;
    dw Spritemap_Draygon_59                                              ;A5A8EF;
    dw Hitbox_Draygon_1B                                                 ;A5A8F1;
    dw $FFE7,$003F                                                       ;A5A8F3;
    dw Spritemap_Draygon_58                                              ;A5A8F7;
    dw Hitbox_Draygon_1B                                                 ;A5A8F9;
    dw $FFE3,$0035                                                       ;A5A8FB;
    dw Spritemap_Draygon_58                                              ;A5A8FF;
    dw Hitbox_Draygon_1B                                                 ;A5A901;
    dw $FFCE,$0021                                                       ;A5A903;
    dw Spritemap_Draygon_3F                                              ;A5A907;
    dw Hitbox_Draygon_1B                                                 ;A5A909;

ExtendedSpritemap_Draygon_66:
    dw $0008,$0009,$0025                                                 ;A5A90B;
    dw Spritemap_Draygon_48                                              ;A5A911;
    dw Hitbox_Draygon_2E                                                 ;A5A913;
    dw $0008,$0038                                                       ;A5A915;
    dw Spritemap_Draygon_5A                                              ;A5A919;
    dw Hitbox_Draygon_1B                                                 ;A5A91B;
    dw $0003,$0041                                                       ;A5A91D;
    dw Spritemap_Draygon_5A                                              ;A5A921;
    dw Hitbox_Draygon_1B                                                 ;A5A923;
    dw $FFFA,$0043                                                       ;A5A925;
    dw Spritemap_Draygon_59                                              ;A5A929;
    dw Hitbox_Draygon_1B                                                 ;A5A92B;
    dw $FFF0,$0044                                                       ;A5A92D;
    dw Spritemap_Draygon_59                                              ;A5A931;
    dw Hitbox_Draygon_1B                                                 ;A5A933;
    dw $FFE8,$0041                                                       ;A5A935;
    dw Spritemap_Draygon_58                                              ;A5A939;
    dw Hitbox_Draygon_1B                                                 ;A5A93B;
    dw $FFE2,$0037                                                       ;A5A93D;
    dw Spritemap_Draygon_58                                              ;A5A941;
    dw Hitbox_Draygon_1B                                                 ;A5A943;
    dw $FFCE,$0021                                                       ;A5A945;
    dw Spritemap_Draygon_40                                              ;A5A949;
    dw Hitbox_Draygon_1B                                                 ;A5A94B;

Hitbox_Draygon_0:
    dw $0001,$0000,$0000,$0017,$001F                                     ;A5A94D;
    dw EnemyTouch_Draygon                                                ;A5A957;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A959;

Hitbox_Draygon_1:
    dw $0001,$0000,$0000,$0015,$001F                                     ;A5A95B;
    dw EnemyTouch_Draygon                                                ;A5A965;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A967;

Hitbox_Draygon_2:
    dw $0001,$0000,$0000,$000C,$0021                                     ;A5A969;
    dw EnemyTouch_Draygon                                                ;A5A973;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A975;

Hitbox_Draygon_3:
    dw $0001,$FFF9,$FFF8,$0006,$0006                                     ;A5A977;
    dw EnemyTouch_Draygon                                                ;A5A981;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A983;

Hitbox_Draygon_4:
    dw $0001,$FFF7,$FFF6,$0009,$0008                                     ;A5A985;
    dw EnemyTouch_Draygon                                                ;A5A98F;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A991;

Hitbox_Draygon_5:
    dw $0001,$FFF9,$FFF8,$0007,$0007                                     ;A5A993;
    dw EnemyTouch_Draygon                                                ;A5A99D;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A99F;

Hitbox_Draygon_6:
    dw $0001,$FFF8,$FFF8,$0006,$0006                                     ;A5A9A1;
    dw EnemyTouch_Draygon                                                ;A5A9AB;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A9AD;

Hitbox_Draygon_7:
    dw $0001,$FFF7,$FFF7,$0004,$0007                                     ;A5A9AF;
    dw RTL_A5804C                                                        ;A5A9B9;
    dw RTL_A5804C                                                        ;A5A9BB;

Hitbox_Draygon_8:
    dw $0000                                                             ;A5A9BD;

Hitbox_Draygon_9:
    dw $0000                                                             ;A5A9BF;

Hitbox_Draygon_A:
    dw $0001,$FFFB,$FFFB,$0004,$0004                                     ;A5A9C1;
    dw EnemyTouch_Draygon                                                ;A5A9CB;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A9CD;

Hitbox_Draygon_B:
    dw $0001,$FFFB,$FFFB,$0003,$0005                                     ;A5A9CF;
    dw EnemyTouch_Draygon                                                ;A5A9D9;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A9DB;

Hitbox_Draygon_C:
    dw $0001,$FFFB,$FFFB,$0004,$0004                                     ;A5A9DD;
    dw EnemyTouch_Draygon                                                ;A5A9E7;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A9E9;

Hitbox_Draygon_D:
    dw $0001,$FFF9,$FFF9,$0007,$0006                                     ;A5A9EB;
    dw EnemyTouch_Draygon                                                ;A5A9F5;
    dw CommonA5_NormalEnemyShotAI                                        ;A5A9F7;

Hitbox_Draygon_E:
    dw $0001,$FFFB,$FFFB,$0004,$0004                                     ;A5A9F9;
    dw EnemyTouch_Draygon                                                ;A5AA03;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA05;

Hitbox_Draygon_F:
    dw $0001,$FFFB,$FFFC,$0004,$0004                                     ;A5AA07;
    dw EnemyTouch_Draygon                                                ;A5AA11;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA13;

Hitbox_Draygon_10:
    dw $0001,$FFFB,$FFFB,$0004,$0004                                     ;A5AA15;
    dw EnemyTouch_Draygon                                                ;A5AA1F;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA21;

Hitbox_Draygon_11:
    dw $0000                                                             ;A5AA23;

Hitbox_Draygon_12:
    dw $0001,$FFE2,$FFE6,$FFF2,$FFF5                                     ;A5AA25;
    dw EnemyTouch_Draygon                                                ;A5AA2F;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA31;

Hitbox_Draygon_13:
    dw $0001,$FFE1,$FFE6,$FFF2,$FFF6                                     ;A5AA33;
    dw EnemyTouch_Draygon                                                ;A5AA3D;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA3F;

Hitbox_Draygon_14:
    dw $0001,$FFE1,$FFE6,$FFF2,$FFF6                                     ;A5AA41;
    dw EnemyTouch_Draygon                                                ;A5AA4B;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA4D;

Hitbox_Draygon_15:
    dw $0001,$FFE1,$FFE6,$FFF2,$FFF7                                     ;A5AA4F;
    dw EnemyTouch_Draygon                                                ;A5AA59;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA5B;

Hitbox_Draygon_16:
    dw $0001,$FFF3,$0000,$000A,$0017                                     ;A5AA5D;
    dw EnemyTouch_Draygon                                                ;A5AA67;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA69;

Hitbox_Draygon_17:
    dw $0001,$FFF3,$0000,$000A,$0017                                     ;A5AA6B;
    dw EnemyTouch_Draygon                                                ;A5AA75;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA77;

Hitbox_Draygon_18:
    dw $0001,$FFF3,$0000,$000A,$0017                                     ;A5AA79;
    dw EnemyTouch_Draygon                                                ;A5AA83;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA85;

Hitbox_Draygon_19:
    dw $0001,$FFF3,$0000,$000A,$0017                                     ;A5AA87;
    dw EnemyTouch_Draygon                                                ;A5AA91;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AA93;

Hitbox_Draygon_1A:
    dw $0004,$FFEF,$FFF0,$0012,$001E                                     ;A5AA95;
    dw RTL_A5804C                                                        ;A5AA9F;
    dw EnemyShot_Draygon                                                 ;A5AAA1;
    dw $FFC5,$FFBE,$0003,$FFE2                                           ;A5AAA3;
    dw EnemyTouch_Draygon                                                ;A5AAAB;
    dw CommonA5_CreateADudShot                                           ;A5AAAD;
    dw $0010,$0001,$003C,$0035                                           ;A5AAAF;
    dw EnemyTouch_Draygon                                                ;A5AAB7;
    dw CommonA5_CreateADudShot                                           ;A5AAB9;
    dw $FFE4,$FFDB,$003D,$FFF6                                           ;A5AABB;
    dw EnemyTouch_Draygon                                                ;A5AAC3;
    dw CommonA5_CreateADudShot                                           ;A5AAC5;

Hitbox_Draygon_1B:
    dw $0000                                                             ;A5AAC7;

Hitbox_Draygon_1C:
    dw $0001,$FFF9,$FFF8,$0006,$0006                                     ;A5AAC9;
    dw EnemyTouch_Draygon                                                ;A5AAD3;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AAD5;

Hitbox_Draygon_1D:
    dw $0001,$FFF7,$FFF6,$0009,$0008                                     ;A5AAD7;
    dw EnemyTouch_Draygon                                                ;A5AAE1;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AAE3;

Hitbox_Draygon_1E:
    dw $0001,$FFF9,$FFF8,$0007,$0007                                     ;A5AAE5;
    dw EnemyTouch_Draygon                                                ;A5AAEF;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AAF1;

Hitbox_Draygon_1F:
    dw $0001,$FFF8,$FFF8,$0006,$0006                                     ;A5AAF3;
    dw EnemyTouch_Draygon                                                ;A5AAFD;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AAFF;

Hitbox_Draygon_20:
    dw $0001,$FFFB,$FFF7,$0007,$0007                                     ;A5AB01;
    dw RTL_A5804C                                                        ;A5AB0B;
    dw RTL_A5804C                                                        ;A5AB0D;

Hitbox_Draygon_21:
    dw $0001,$FFFB,$FFFB,$0004,$0004                                     ;A5AB0F;
    dw EnemyTouch_Draygon                                                ;A5AB19;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB1B;

Hitbox_Draygon_22:
    dw $0001,$FFFB,$FFFB,$0003,$0005                                     ;A5AB1D;
    dw EnemyTouch_Draygon                                                ;A5AB27;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB29;

Hitbox_Draygon_23:
    dw $0001,$FFFB,$FFFB,$0004,$0004                                     ;A5AB2B;
    dw EnemyTouch_Draygon                                                ;A5AB35;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB37;

Hitbox_Draygon_24:
    dw $0001,$FFF9,$FFF9,$0007,$0006                                     ;A5AB39;
    dw EnemyTouch_Draygon                                                ;A5AB43;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB45;

Hitbox_Draygon_25:
    dw $0001,$FFFB,$FFFB,$0004,$0004                                     ;A5AB47;
    dw EnemyTouch_Draygon                                                ;A5AB51;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB53;

Hitbox_Draygon_26:
    dw $0001,$FFFB,$FFFC,$0004,$0004                                     ;A5AB55;
    dw EnemyTouch_Draygon                                                ;A5AB5F;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB61;

Hitbox_Draygon_27:
    dw $0001,$FFFB,$FFFB,$0004,$0004                                     ;A5AB63;
    dw EnemyTouch_Draygon                                                ;A5AB6D;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB6F;

Hitbox_Draygon_28:
    dw $0000                                                             ;A5AB71;

Hitbox_Draygon_29:
    dw $0001,$FFFA,$0000,$0010,$0017                                     ;A5AB73;
    dw EnemyTouch_Draygon                                                ;A5AB7D;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB7F;

Hitbox_Draygon_2A:
    dw $0001,$FFFA,$0000,$0010,$0017                                     ;A5AB81;
    dw EnemyTouch_Draygon                                                ;A5AB8B;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB8D;

Hitbox_Draygon_2B:
    dw $0001,$FFFA,$0000,$0010,$0017                                     ;A5AB8F;
    dw EnemyTouch_Draygon                                                ;A5AB99;
    dw CommonA5_NormalEnemyShotAI                                        ;A5AB9B;

Hitbox_Draygon_2C:
    dw $0001,$FFFA,$0000,$0010,$0017                                     ;A5AB9D;
    dw EnemyTouch_Draygon                                                ;A5ABA7;
    dw CommonA5_NormalEnemyShotAI                                        ;A5ABA9;

Hitbox_Draygon_2D:
    dw $0004,$FFEE,$FFF9,$0012,$001E                                     ;A5ABAB;
    dw RTL_A5804C                                                        ;A5ABB5;
    dw EnemyShot_Draygon                                                 ;A5ABB7;
    dw $FFF6,$FFC1,$003E,$FFE6                                           ;A5ABB9;
    dw EnemyTouch_Draygon                                                ;A5ABC1;
    dw CommonA5_CreateADudShot                                           ;A5ABC3;
    dw $FFC9,$0000,$FFEB,$0039                                           ;A5ABC5;
    dw EnemyTouch_Draygon                                                ;A5ABCD;
    dw CommonA5_CreateADudShot                                           ;A5ABCF;
    dw $FFC2,$FFDF,$000F,$FFFB                                           ;A5ABD1;
    dw EnemyTouch_Draygon                                                ;A5ABD9;
    dw CommonA5_CreateADudShot                                           ;A5ABDB;

Hitbox_Draygon_2E:
    dw $0000                                                             ;A5ABDD;

Spritemap_Draygon_0:
    dw $0004,$8008                                                       ;A5ABDF;
    db $10                                                               ;A5ABE3;
    dw $0721,$8008                                                       ;A5ABE4;
    db $00                                                               ;A5ABE8;
    dw $0701,$8000                                                       ;A5ABE9;
    db $10                                                               ;A5ABED;
    dw $0720,$8000                                                       ;A5ABEE;
    db $00                                                               ;A5ABF2;
    dw $0700                                                             ;A5ABF3;

Spritemap_Draygon_1:
    dw $0004,$0000                                                       ;A5ABF5;
    db $10                                                               ;A5ABF9;
    dw $2723,$8000                                                       ;A5ABFA;
    db $00                                                               ;A5ABFE;
    dw $2703,$8008                                                       ;A5ABFF;
    db $10                                                               ;A5AC03;
    dw $2724,$8008                                                       ;A5AC04;
    db $00                                                               ;A5AC08;
    dw $2704                                                             ;A5AC09;

Spritemap_Draygon_2:
    dw $0002,$8000                                                       ;A5AC0B;
    db $10                                                               ;A5AC0F;
    dw $2726,$8000                                                       ;A5AC10;
    db $00                                                               ;A5AC14;
    dw $2706                                                             ;A5AC15;

Spritemap_Draygon_3:
    dw $0018,$81E5                                                       ;A5AC17;
    db $02                                                               ;A5AC1B;
    dw $271C,$81DD                                                       ;A5AC1C;
    db $0A                                                               ;A5AC20;
    dw $272B,$81ED                                                       ;A5AC21;
    db $FA                                                               ;A5AC25;
    dw $270D,$01F4                                                       ;A5AC26;
    db $EC                                                               ;A5AC2A;
    dw $2750,$81FC                                                       ;A5AC2B;
    db $E4                                                               ;A5AC2F;
    dw $2741,$81F4                                                       ;A5AC30;
    db $F4                                                               ;A5AC34;
    dw $2760,$81ED                                                       ;A5AC35;
    db $0A                                                               ;A5AC39;
    dw $271C,$81E5                                                       ;A5AC3A;
    db $12                                                               ;A5AC3E;
    dw $272B,$81F5                                                       ;A5AC3F;
    db $02                                                               ;A5AC43;
    dw $270D,$01FC                                                       ;A5AC44;
    db $F4                                                               ;A5AC48;
    dw $2750,$8004                                                       ;A5AC49;
    db $EC                                                               ;A5AC4D;
    dw $2741,$81FC                                                       ;A5AC4E;
    db $FC                                                               ;A5AC52;
    dw $2760,$81F5                                                       ;A5AC53;
    db $12                                                               ;A5AC57;
    dw $271C,$81ED                                                       ;A5AC58;
    db $1A                                                               ;A5AC5C;
    dw $272B,$81FD                                                       ;A5AC5D;
    db $0A                                                               ;A5AC61;
    dw $270D,$0004                                                       ;A5AC62;
    db $FC                                                               ;A5AC66;
    dw $2750,$800C                                                       ;A5AC67;
    db $F4                                                               ;A5AC6B;
    dw $2741,$8004                                                       ;A5AC6C;
    db $04                                                               ;A5AC70;
    dw $2760,$81FC                                                       ;A5AC71;
    db $1B                                                               ;A5AC75;
    dw $271C,$81F4                                                       ;A5AC76;
    db $23                                                               ;A5AC7A;
    dw $272B,$8004                                                       ;A5AC7B;
    db $13                                                               ;A5AC7F;
    dw $270D,$000B                                                       ;A5AC80;
    db $05                                                               ;A5AC84;
    dw $2750,$8013                                                       ;A5AC85;
    db $FD                                                               ;A5AC89;
    dw $2741,$800B                                                       ;A5AC8A;
    db $0D                                                               ;A5AC8E;
    dw $2760                                                             ;A5AC8F;

Spritemap_Draygon_4:
    dw $0014,$81F8                                                       ;A5AC91;
    db $F9                                                               ;A5AC95;
    dw $272E,$01E8                                                       ;A5AC96;
    db $09                                                               ;A5AC9A;
    dw $274C,$81F0                                                       ;A5AC9B;
    db $01                                                               ;A5AC9F;
    dw $273D,$81FC                                                       ;A5ACA0;
    db $F4                                                               ;A5ACA4;
    dw $2762,$81FC                                                       ;A5ACA5;
    db $E4                                                               ;A5ACA9;
    dw $2743,$8000                                                       ;A5ACAA;
    db $01                                                               ;A5ACAE;
    dw $272E,$01F0                                                       ;A5ACAF;
    db $11                                                               ;A5ACB3;
    dw $274C,$81F8                                                       ;A5ACB4;
    db $09                                                               ;A5ACB8;
    dw $273D,$8004                                                       ;A5ACB9;
    db $FC                                                               ;A5ACBD;
    dw $2762,$8004                                                       ;A5ACBE;
    db $EC                                                               ;A5ACC2;
    dw $2743,$8008                                                       ;A5ACC3;
    db $09                                                               ;A5ACC7;
    dw $272E,$01F8                                                       ;A5ACC8;
    db $19                                                               ;A5ACCC;
    dw $274C,$8000                                                       ;A5ACCD;
    db $11                                                               ;A5ACD1;
    dw $273D,$800C                                                       ;A5ACD2;
    db $04                                                               ;A5ACD6;
    dw $2762,$800C                                                       ;A5ACD7;
    db $F4                                                               ;A5ACDB;
    dw $2743,$800F                                                       ;A5ACDC;
    db $12                                                               ;A5ACE0;
    dw $272E,$01FF                                                       ;A5ACE1;
    db $22                                                               ;A5ACE5;
    dw $274C,$8007                                                       ;A5ACE6;
    db $1A                                                               ;A5ACEA;
    dw $273D,$8013                                                       ;A5ACEB;
    db $0D                                                               ;A5ACEF;
    dw $2762,$8013                                                       ;A5ACF0;
    db $FD                                                               ;A5ACF4;
    dw $2743                                                             ;A5ACF5;

Spritemap_Draygon_5:
    dw $0010,$81F9                                                       ;A5ACF7;
    db $F9                                                               ;A5ACFB;
    dw $2738,$8001                                                       ;A5ACFC;
    db $F1                                                               ;A5AD00;
    dw $2729,$8004                                                       ;A5AD01;
    db $EC                                                               ;A5AD05;
    dw $2756,$81FC                                                       ;A5AD06;
    db $E4                                                               ;A5AD0A;
    dw $2745,$8000                                                       ;A5AD0B;
    db $00                                                               ;A5AD0F;
    dw $2738,$8008                                                       ;A5AD10;
    db $F8                                                               ;A5AD14;
    dw $2729,$800B                                                       ;A5AD15;
    db $F3                                                               ;A5AD19;
    dw $2756,$8003                                                       ;A5AD1A;
    db $EB                                                               ;A5AD1E;
    dw $2745,$8007                                                       ;A5AD1F;
    db $07                                                               ;A5AD23;
    dw $2738,$800F                                                       ;A5AD24;
    db $FF                                                               ;A5AD28;
    dw $2729,$8012                                                       ;A5AD29;
    db $FA                                                               ;A5AD2D;
    dw $2756,$800A                                                       ;A5AD2E;
    db $F2                                                               ;A5AD32;
    dw $2745,$800E                                                       ;A5AD33;
    db $0E                                                               ;A5AD37;
    dw $2738,$8016                                                       ;A5AD38;
    db $06                                                               ;A5AD3C;
    dw $2729,$8019                                                       ;A5AD3D;
    db $01                                                               ;A5AD41;
    dw $2756,$8011                                                       ;A5AD42;
    db $F9                                                               ;A5AD46;
    dw $2745                                                             ;A5AD47;

Spritemap_Draygon_6:
    dw $0010,$8000                                                       ;A5AD49;
    db $F4                                                               ;A5AD4D;
    dw $2768,$8000                                                       ;A5AD4E;
    db $EC                                                               ;A5AD52;
    dw $2758,$8004                                                       ;A5AD53;
    db $E4                                                               ;A5AD57;
    dw $2709,$81FC                                                       ;A5AD58;
    db $E4                                                               ;A5AD5C;
    dw $2708,$8007                                                       ;A5AD5D;
    db $FC                                                               ;A5AD61;
    dw $2768,$8007                                                       ;A5AD62;
    db $F4                                                               ;A5AD66;
    dw $2758,$800B                                                       ;A5AD67;
    db $EC                                                               ;A5AD6B;
    dw $2709,$8003                                                       ;A5AD6C;
    db $EC                                                               ;A5AD70;
    dw $2708,$800E                                                       ;A5AD71;
    db $03                                                               ;A5AD75;
    dw $2768,$800E                                                       ;A5AD76;
    db $FB                                                               ;A5AD7A;
    dw $2758,$8012                                                       ;A5AD7B;
    db $F3                                                               ;A5AD7F;
    dw $2709,$800A                                                       ;A5AD80;
    db $F3                                                               ;A5AD84;
    dw $2708,$8015                                                       ;A5AD85;
    db $0A                                                               ;A5AD89;
    dw $2768,$8015                                                       ;A5AD8A;
    db $02                                                               ;A5AD8E;
    dw $2758,$8019                                                       ;A5AD8F;
    db $FA                                                               ;A5AD93;
    dw $2709,$8011                                                       ;A5AD94;
    db $FA                                                               ;A5AD98;
    dw $2708                                                             ;A5AD99;

Spritemap_Draygon_7:
    dw $000A,$81FC                                                       ;A5AD9B;
    db $F0                                                               ;A5AD9F;
    dw $0721,$81FC                                                       ;A5ADA0;
    db $E0                                                               ;A5ADA4;
    dw $0701,$81F4                                                       ;A5ADA5;
    db $F0                                                               ;A5ADA9;
    dw $0720,$81F4                                                       ;A5ADAA;
    db $E0                                                               ;A5ADAE;
    dw $0700,$01F4                                                       ;A5ADAF;
    db $04                                                               ;A5ADB3;
    dw $2723,$81F4                                                       ;A5ADB4;
    db $F4                                                               ;A5ADB8;
    dw $2703,$81FC                                                       ;A5ADB9;
    db $04                                                               ;A5ADBD;
    dw $2724,$81FC                                                       ;A5ADBE;
    db $F4                                                               ;A5ADC2;
    dw $2704,$81F4                                                       ;A5ADC3;
    db $14                                                               ;A5ADC7;
    dw $2726,$81F4                                                       ;A5ADC8;
    db $04                                                               ;A5ADCC;
    dw $2706                                                             ;A5ADCD;

Spritemap_Draygon_8:
    dw $000A,$81FB                                                       ;A5ADCF;
    db $F0                                                               ;A5ADD3;
    dw $0721,$81FB                                                       ;A5ADD4;
    db $E0                                                               ;A5ADD8;
    dw $0701,$81F3                                                       ;A5ADD9;
    db $F0                                                               ;A5ADDD;
    dw $0720,$81F3                                                       ;A5ADDE;
    db $E0                                                               ;A5ADE2;
    dw $0700,$01F3                                                       ;A5ADE3;
    db $04                                                               ;A5ADE7;
    dw $2723,$81F3                                                       ;A5ADE8;
    db $F4                                                               ;A5ADEC;
    dw $2703,$81FB                                                       ;A5ADED;
    db $04                                                               ;A5ADF1;
    dw $2724,$81FB                                                       ;A5ADF2;
    db $F4                                                               ;A5ADF6;
    dw $2704,$81F3                                                       ;A5ADF7;
    db $14                                                               ;A5ADFB;
    dw $2726,$81F3                                                       ;A5ADFC;
    db $04                                                               ;A5AE00;
    dw $2706                                                             ;A5AE01;

Spritemap_Draygon_9:
    dw $000A,$81FB                                                       ;A5AE03;
    db $F0                                                               ;A5AE07;
    dw $0721,$81FB                                                       ;A5AE08;
    db $E0                                                               ;A5AE0C;
    dw $0701,$81F3                                                       ;A5AE0D;
    db $F0                                                               ;A5AE11;
    dw $0720,$81F3                                                       ;A5AE12;
    db $E0                                                               ;A5AE16;
    dw $0700,$01F2                                                       ;A5AE17;
    db $04                                                               ;A5AE1B;
    dw $2723,$81F2                                                       ;A5AE1C;
    db $F4                                                               ;A5AE20;
    dw $2703,$81FA                                                       ;A5AE21;
    db $04                                                               ;A5AE25;
    dw $2724,$81FA                                                       ;A5AE26;
    db $F4                                                               ;A5AE2A;
    dw $2704,$81F2                                                       ;A5AE2B;
    db $14                                                               ;A5AE2F;
    dw $2726,$81F2                                                       ;A5AE30;
    db $04                                                               ;A5AE34;
    dw $2706                                                             ;A5AE35;

Spritemap_Draygon_A:
    dw $000A,$81FB                                                       ;A5AE37;
    db $F0                                                               ;A5AE3B;
    dw $0721,$81FB                                                       ;A5AE3C;
    db $E0                                                               ;A5AE40;
    dw $0701,$81F3                                                       ;A5AE41;
    db $F0                                                               ;A5AE45;
    dw $0720,$81F3                                                       ;A5AE46;
    db $E0                                                               ;A5AE4A;
    dw $0700,$01F2                                                       ;A5AE4B;
    db $04                                                               ;A5AE4F;
    dw $2723,$81F2                                                       ;A5AE50;
    db $F4                                                               ;A5AE54;
    dw $2703,$81FA                                                       ;A5AE55;
    db $04                                                               ;A5AE59;
    dw $2724,$81FA                                                       ;A5AE5A;
    db $F4                                                               ;A5AE5E;
    dw $2704,$81F1                                                       ;A5AE5F;
    db $14                                                               ;A5AE63;
    dw $2726,$81F1                                                       ;A5AE64;
    db $04                                                               ;A5AE68;
    dw $2706                                                             ;A5AE69;

Spritemap_Draygon_B:
    dw $0013,$81E5                                                       ;A5AE6B;
    db $02                                                               ;A5AE6F;
    dw $271C,$81DD                                                       ;A5AE70;
    db $0A                                                               ;A5AE74;
    dw $272B,$81ED                                                       ;A5AE75;
    db $FA                                                               ;A5AE79;
    dw $270D,$01F4                                                       ;A5AE7A;
    db $EC                                                               ;A5AE7E;
    dw $2750,$81FC                                                       ;A5AE7F;
    db $E4                                                               ;A5AE83;
    dw $2741,$81F4                                                       ;A5AE84;
    db $F4                                                               ;A5AE88;
    dw $2760,$8000                                                       ;A5AE89;
    db $01                                                               ;A5AE8D;
    dw $272E,$01F0                                                       ;A5AE8E;
    db $11                                                               ;A5AE92;
    dw $274C,$81F8                                                       ;A5AE93;
    db $09                                                               ;A5AE97;
    dw $273D,$8004                                                       ;A5AE98;
    db $FC                                                               ;A5AE9C;
    dw $2762,$8004                                                       ;A5AE9D;
    db $EC                                                               ;A5AEA1;
    dw $2743,$8009                                                       ;A5AEA2;
    db $09                                                               ;A5AEA6;
    dw $2738,$8011                                                       ;A5AEA7;
    db $01                                                               ;A5AEAB;
    dw $2729,$8014                                                       ;A5AEAC;
    db $FC                                                               ;A5AEB0;
    dw $2756,$800C                                                       ;A5AEB1;
    db $F4                                                               ;A5AEB5;
    dw $2745,$8018                                                       ;A5AEB6;
    db $0C                                                               ;A5AEBA;
    dw $2768,$8018                                                       ;A5AEBB;
    db $04                                                               ;A5AEBF;
    dw $2758,$801C                                                       ;A5AEC0;
    db $FC                                                               ;A5AEC4;
    dw $2709,$8014                                                       ;A5AEC5;
    db $FC                                                               ;A5AEC9;
    dw $2708                                                             ;A5AECA;

Spritemap_Draygon_C:
    dw $0011,$81F8                                                       ;A5AECC;
    db $F9                                                               ;A5AED0;
    dw $272E,$01E8                                                       ;A5AED1;
    db $09                                                               ;A5AED5;
    dw $274C,$81F0                                                       ;A5AED6;
    db $01                                                               ;A5AEDA;
    dw $273D,$81FC                                                       ;A5AEDB;
    db $F4                                                               ;A5AEDF;
    dw $2762,$81FC                                                       ;A5AEE0;
    db $E4                                                               ;A5AEE4;
    dw $2743,$8001                                                       ;A5AEE5;
    db $01                                                               ;A5AEE9;
    dw $2738,$8009                                                       ;A5AEEA;
    db $F9                                                               ;A5AEEE;
    dw $2729,$800C                                                       ;A5AEEF;
    db $F4                                                               ;A5AEF3;
    dw $2756,$8004                                                       ;A5AEF4;
    db $EC                                                               ;A5AEF8;
    dw $2745,$8010                                                       ;A5AEF9;
    db $04                                                               ;A5AEFD;
    dw $2768,$8010                                                       ;A5AEFE;
    db $FC                                                               ;A5AF02;
    dw $2758,$8014                                                       ;A5AF03;
    db $F4                                                               ;A5AF07;
    dw $2709,$800C                                                       ;A5AF08;
    db $F4                                                               ;A5AF0C;
    dw $2708,$8011                                                       ;A5AF0D;
    db $11                                                               ;A5AF11;
    dw $2738,$8019                                                       ;A5AF12;
    db $09                                                               ;A5AF16;
    dw $2729,$801C                                                       ;A5AF17;
    db $04                                                               ;A5AF1B;
    dw $2756,$8014                                                       ;A5AF1C;
    db $FC                                                               ;A5AF20;
    dw $2745                                                             ;A5AF21;

Spritemap_Draygon_D:
    dw $0011,$81F9                                                       ;A5AF23;
    db $F9                                                               ;A5AF27;
    dw $2738,$8001                                                       ;A5AF28;
    db $F1                                                               ;A5AF2C;
    dw $2729,$8004                                                       ;A5AF2D;
    db $EC                                                               ;A5AF31;
    dw $2756,$81FC                                                       ;A5AF32;
    db $E4                                                               ;A5AF36;
    dw $2745,$8008                                                       ;A5AF37;
    db $FC                                                               ;A5AF3B;
    dw $2768,$8008                                                       ;A5AF3C;
    db $F4                                                               ;A5AF40;
    dw $2758,$800C                                                       ;A5AF41;
    db $EC                                                               ;A5AF45;
    dw $2709,$8004                                                       ;A5AF46;
    db $EC                                                               ;A5AF4A;
    dw $2708,$8009                                                       ;A5AF4B;
    db $09                                                               ;A5AF4F;
    dw $2738,$8011                                                       ;A5AF50;
    db $01                                                               ;A5AF54;
    dw $2729,$8014                                                       ;A5AF55;
    db $FC                                                               ;A5AF59;
    dw $2756,$800C                                                       ;A5AF5A;
    db $F4                                                               ;A5AF5E;
    dw $2745,$8010                                                       ;A5AF5F;
    db $11                                                               ;A5AF63;
    dw $272E,$0000                                                       ;A5AF64;
    db $21                                                               ;A5AF68;
    dw $274C,$8008                                                       ;A5AF69;
    db $19                                                               ;A5AF6D;
    dw $273D,$8014                                                       ;A5AF6E;
    db $0C                                                               ;A5AF72;
    dw $2762,$8014                                                       ;A5AF73;
    db $FC                                                               ;A5AF77;
    dw $2743                                                             ;A5AF78;

Spritemap_Draygon_E:
    dw $0013,$8000                                                       ;A5AF7A;
    db $F4                                                               ;A5AF7E;
    dw $2768,$8000                                                       ;A5AF7F;
    db $EC                                                               ;A5AF83;
    dw $2758,$8004                                                       ;A5AF84;
    db $E4                                                               ;A5AF88;
    dw $2709,$81FC                                                       ;A5AF89;
    db $E4                                                               ;A5AF8D;
    dw $2708,$8001                                                       ;A5AF8E;
    db $01                                                               ;A5AF92;
    dw $2738,$8009                                                       ;A5AF93;
    db $F9                                                               ;A5AF97;
    dw $2729,$800C                                                       ;A5AF98;
    db $F4                                                               ;A5AF9C;
    dw $2756,$8004                                                       ;A5AF9D;
    db $EC                                                               ;A5AFA1;
    dw $2745,$8008                                                       ;A5AFA2;
    db $09                                                               ;A5AFA6;
    dw $272E,$01F8                                                       ;A5AFA7;
    db $19                                                               ;A5AFAB;
    dw $274C,$8000                                                       ;A5AFAC;
    db $11                                                               ;A5AFB0;
    dw $273D,$800C                                                       ;A5AFB1;
    db $04                                                               ;A5AFB5;
    dw $2762,$800C                                                       ;A5AFB6;
    db $F4                                                               ;A5AFBA;
    dw $2743,$81FD                                                       ;A5AFBB;
    db $1A                                                               ;A5AFBF;
    dw $271C,$81F5                                                       ;A5AFC0;
    db $22                                                               ;A5AFC4;
    dw $272B,$8005                                                       ;A5AFC5;
    db $12                                                               ;A5AFC9;
    dw $270D,$000C                                                       ;A5AFCA;
    db $04                                                               ;A5AFCE;
    dw $2750,$8014                                                       ;A5AFCF;
    db $FC                                                               ;A5AFD3;
    dw $2741,$800C                                                       ;A5AFD4;
    db $0C                                                               ;A5AFD8;
    dw $2760                                                             ;A5AFD9;

Spritemap_Draygon_F:
    dw $0014,$81F9                                                       ;A5AFDB;
    db $F9                                                               ;A5AFDF;
    dw $2738,$8001                                                       ;A5AFE0;
    db $F1                                                               ;A5AFE4;
    dw $2729,$8004                                                       ;A5AFE5;
    db $EC                                                               ;A5AFE9;
    dw $2756,$81FC                                                       ;A5AFEA;
    db $E4                                                               ;A5AFEE;
    dw $2745,$8000                                                       ;A5AFEF;
    db $01                                                               ;A5AFF3;
    dw $272E,$01F0                                                       ;A5AFF4;
    db $11                                                               ;A5AFF8;
    dw $274C,$81F8                                                       ;A5AFF9;
    db $09                                                               ;A5AFFD;
    dw $273D,$8004                                                       ;A5AFFE;
    db $FC                                                               ;A5B002;
    dw $2762,$8004                                                       ;A5B003;
    db $EC                                                               ;A5B007;
    dw $2743,$81F5                                                       ;A5B008;
    db $12                                                               ;A5B00C;
    dw $271C,$81ED                                                       ;A5B00D;
    db $1A                                                               ;A5B011;
    dw $272B,$81FD                                                       ;A5B012;
    db $0A                                                               ;A5B016;
    dw $270D,$0004                                                       ;A5B017;
    db $FC                                                               ;A5B01B;
    dw $2750,$800C                                                       ;A5B01C;
    db $F4                                                               ;A5B020;
    dw $2741,$8004                                                       ;A5B021;
    db $04                                                               ;A5B025;
    dw $2760,$8010                                                       ;A5B026;
    db $11                                                               ;A5B02A;
    dw $272E,$0000                                                       ;A5B02B;
    db $21                                                               ;A5B02F;
    dw $274C,$8008                                                       ;A5B030;
    db $19                                                               ;A5B034;
    dw $273D,$8014                                                       ;A5B035;
    db $0C                                                               ;A5B039;
    dw $2762,$8014                                                       ;A5B03A;
    db $FC                                                               ;A5B03E;
    dw $2743                                                             ;A5B03F;

Spritemap_Draygon_10:
    dw $0014,$81F8                                                       ;A5B041;
    db $F9                                                               ;A5B045;
    dw $272E,$01E8                                                       ;A5B046;
    db $09                                                               ;A5B04A;
    dw $274C,$81F0                                                       ;A5B04B;
    db $01                                                               ;A5B04F;
    dw $273D,$81FC                                                       ;A5B050;
    db $F4                                                               ;A5B054;
    dw $2762,$81FC                                                       ;A5B055;
    db $E4                                                               ;A5B059;
    dw $2743,$81ED                                                       ;A5B05A;
    db $0A                                                               ;A5B05E;
    dw $271C,$81E5                                                       ;A5B05F;
    db $12                                                               ;A5B063;
    dw $272B,$81F5                                                       ;A5B064;
    db $02                                                               ;A5B068;
    dw $270D,$01FC                                                       ;A5B069;
    db $F4                                                               ;A5B06D;
    dw $2750,$8004                                                       ;A5B06E;
    db $EC                                                               ;A5B072;
    dw $2741,$81FC                                                       ;A5B073;
    db $FC                                                               ;A5B077;
    dw $2760,$8008                                                       ;A5B078;
    db $09                                                               ;A5B07C;
    dw $272E,$01F8                                                       ;A5B07D;
    db $19                                                               ;A5B081;
    dw $274C,$8000                                                       ;A5B082;
    db $11                                                               ;A5B086;
    dw $273D,$800C                                                       ;A5B087;
    db $04                                                               ;A5B08B;
    dw $2762,$800C                                                       ;A5B08C;
    db $F4                                                               ;A5B090;
    dw $2743,$8011                                                       ;A5B091;
    db $11                                                               ;A5B095;
    dw $2738,$8019                                                       ;A5B096;
    db $09                                                               ;A5B09A;
    dw $2729,$801C                                                       ;A5B09B;
    db $04                                                               ;A5B09F;
    dw $2756,$8014                                                       ;A5B0A0;
    db $FC                                                               ;A5B0A4;
    dw $2745                                                             ;A5B0A5;

Spritemap_Draygon_11:
    dw $0013,$81BB                                                       ;A5B0A7;
    db $E5                                                               ;A5B0AB;
    dw $271C,$81B3                                                       ;A5B0AC;
    db $ED                                                               ;A5B0B0;
    dw $272B,$81C3                                                       ;A5B0B1;
    db $DD                                                               ;A5B0B5;
    dw $270D,$01CA                                                       ;A5B0B6;
    db $CF                                                               ;A5B0BA;
    dw $2750,$81D2                                                       ;A5B0BB;
    db $C7                                                               ;A5B0BF;
    dw $2741,$81CA                                                       ;A5B0C0;
    db $D7                                                               ;A5B0C4;
    dw $2760,$800E                                                       ;A5B0C5;
    db $05                                                               ;A5B0C9;
    dw $2768,$800E                                                       ;A5B0CA;
    db $FD                                                               ;A5B0CE;
    dw $2758,$8012                                                       ;A5B0CF;
    db $F5                                                               ;A5B0D3;
    dw $2709,$800A                                                       ;A5B0D4;
    db $F5                                                               ;A5B0D8;
    dw $2708,$81F7                                                       ;A5B0D9;
    db $F0                                                               ;A5B0DD;
    dw $2738,$81FF                                                       ;A5B0DE;
    db $E8                                                               ;A5B0E2;
    dw $2729,$8002                                                       ;A5B0E3;
    db $E3                                                               ;A5B0E7;
    dw $2756,$81FA                                                       ;A5B0E8;
    db $DB                                                               ;A5B0EC;
    dw $2745,$81D8                                                       ;A5B0ED;
    db $ED                                                               ;A5B0F1;
    dw $272E,$01C8                                                       ;A5B0F2;
    db $FD                                                               ;A5B0F6;
    dw $274C,$81D0                                                       ;A5B0F7;
    db $F5                                                               ;A5B0FB;
    dw $273D,$81DC                                                       ;A5B0FC;
    db $E8                                                               ;A5B100;
    dw $2762,$81DC                                                       ;A5B101;
    db $D8                                                               ;A5B105;
    dw $2743                                                             ;A5B106;

ExtendedTilemap_Draygon_0:
    dw $FFFE,$2316,$0002,$159F,$15A0,$2356,$0002,$15AC                   ;A5B108;
    dw $15AD,$2394,$0003,$15B9,$15BA,$15BB,$23D4,$0003                   ;A5B118;
    dw $15C8,$15C9,$15CA,$2414,$0003,$15D7,$15D8,$15D9                   ;A5B128;
    dw $2454,$0003,$15DF,$15E0,$1547,$2496,$0002,$1547                   ;A5B138;
    dw $1547,$FFFF                                                       ;A5B148;

ExtendedTilemap_Draygon_1:
    dw $FFFE,$2316,$0002,$1559,$155A,$2356,$0002,$1569                   ;A5B14C;
    dw $156A,$2394,$0003,$1576,$1577,$1578,$23D2,$0004                   ;A5B15C;
    dw $1585,$1586,$1587,$1588,$2412,$0004,$1592,$1593                   ;A5B16C;
    dw $1594,$1595,$2452,$0004,$15A1,$15A2,$15A3,$0147                   ;A5B17C;
    dw $2496,$0002,$0147,$0147,$FFFF                                     ;A5B18C;

ExtendedTilemap_Draygon_2:
    dw $FFFE,$2316,$0002,$1596,$1597,$2356,$0002,$15A4                   ;A5B196;
    dw $15A5,$2390,$0005,$15AE,$15AF,$15B0,$15B1,$15B2                   ;A5B1A6;
    dw $23CE,$0006,$15BC,$15BD,$15BE,$15BF,$15C0,$15C1                   ;A5B1B6;
    dw $240E,$0006,$15CB,$15CC,$15CD,$15CE,$15CF,$15D0                   ;A5B1C6;
    dw $2452,$0003,$0147,$0147,$0147,$FFFF                               ;A5B1D6;

ExtendedTilemap_Draygon_3:
    dw $FFFE,$230A,$0003,$15DA,$15DB,$1547,$2316,$0002                   ;A5B1E2;
    dw $15DC,$15DD,$234C,$0003,$15E1,$15E2,$15E3,$2354                   ;A5B1F2;
    dw $0003,$15AE,$15E4,$15E5,$238C,$0007,$15E9,$15EA                   ;A5B202;
    dw $15EB,$15EC,$15ED,$15EE,$15EF,$23CC,$0007,$15F3                   ;A5B212;
    dw $15F4,$15F5,$15F6,$15F7,$15F8,$15F9,$240E,$0005                   ;A5B222;
    dw $1600,$1601,$1602,$1603,$1604,$FFFF                               ;A5B232;

ExtendedTilemap_Draygon_4:
    dw $FFFE,$230A,$0003,$0147,$0147,$0147,$2316,$0002                   ;A5B23E;
    dw $1596,$1597,$234C,$0003,$0147,$0147,$0147,$2354                   ;A5B24E;
    dw $0003,$0147,$15A4,$15A5,$238C,$0007,$0147,$0147                   ;A5B25E;
    dw $15AE,$15AF,$15B0,$15B1,$15B2,$23CC,$0007,$0147                   ;A5B26E;
    dw $15BC,$15BD,$15BE,$15BF,$15C0,$15C1,$240E,$0005                   ;A5B27E;
    dw $15CB,$15CC,$15CD,$15CE,$15CF,$FFFF                               ;A5B28E;

ExtendedTilemap_Draygon_5:
    dw $FFFE,$2316,$0002,$1559,$155A,$2356,$0002,$1569                   ;A5B29A;
    dw $156A,$2390,$0005,$0147,$0147,$1576,$1577,$1578                   ;A5B2AA;
    dw $23CE,$0006,$0147,$0147,$1585,$1586,$1587,$1588                   ;A5B2BA;
    dw $240E,$0006,$0147,$0147,$1592,$1593,$1594,$1595                   ;A5B2CA;
    dw $2452,$0003,$15A1,$15A2,$15A3,$FFFF                               ;A5B2DA;

ExtendedTilemap_Draygon_6:
    dw $FFFE,$2316,$0002,$159F,$15A0,$2356,$0002,$15AC                   ;A5B2E6;
    dw $15AD,$2394,$0003,$15B9,$15BA,$15BB,$23D2,$0004                   ;A5B2F6;
    dw $0147,$15C8,$15C9,$15CA,$2412,$0004,$0147,$15D7                   ;A5B306;
    dw $15D8,$15D9,$2452,$0004,$0147,$15DF,$15E0,$1547                   ;A5B316;
    dw $2496,$0002,$1547,$1547,$FFFF                                     ;A5B326;

ExtendedTilemap_Draygon_7:
    dw $FFFE,$2148,$0002,$1554,$1555,$2188,$0002,$1564                   ;A5B330;
    dw $1565,$FFFF                                                       ;A5B340;

ExtendedTilemap_Draygon_8:
    dw $FFFE,$2148,$0002,$1580,$1581,$2188,$0002,$1590                   ;A5B344;
    dw $1591,$FFFF                                                       ;A5B354;

ExtendedTilemap_Draygon_9:
    dw $FFFE,$2148,$0002,$1582,$1583,$2188,$0002,$1592                   ;A5B358;
    dw $1593,$FFFF                                                       ;A5B368;

ExtendedTilemap_Draygon_A:
    dw $FFFE,$2148,$0002,$1562,$1563,$2188,$0002,$1572                   ;A5B36C;
    dw $1573,$FFFF                                                       ;A5B37C;

ExtendedTilemap_Draygon_B:
    dw $FFFE,$220C,$0003,$1586,$159E,$159F,$224C,$0003                   ;A5B380;
    dw $1596,$1597,$1598,$228C,$0003,$15A6,$15A7,$15A8                   ;A5B390;
    dw $FFFF                                                             ;A5B3A0;

ExtendedTilemap_Draygon_C:
    dw $FFFE,$220C,$0001,$159D,$224C,$0003,$15AD,$15AE                   ;A5B3A2;
    dw $15AF,$228C,$0003,$15BD,$15BE,$15BF,$FFFF                         ;A5B3B2;

ExtendedTilemap_Draygon_D:
    dw $FFFE,$220C,$0003,$15A0,$15A1,$15A2,$224C,$0003                   ;A5B3C0;
    dw $15B0,$15B1,$15B2,$228C,$0003,$15B4,$15B5,$15B6                   ;A5B3D0;
    dw $FFFF                                                             ;A5B3E0;

ExtendedTilemap_Draygon_E:
    dw $FFFE,$220C,$0003,$15A3,$1584,$1585,$224C,$0003                   ;A5B3E2;
    dw $15B3,$1594,$1595,$228C,$0003,$1574,$15A4,$15A5                   ;A5B3F2;
    dw $FFFF                                                             ;A5B402;

ExtendedTilemap_Draygon_F:
    dw $FFFE,$20C8,$0002,$1540,$1541,$2108,$0002,$1550                   ;A5B404;
    dw $1551,$FFFF                                                       ;A5B414;

ExtendedTilemap_Draygon_10:
    dw $FFFE,$20C8,$0002,$1560,$1561,$2108,$0002,$1570                   ;A5B418;
    dw $1571,$FFFF                                                       ;A5B428;

ExtendedTilemap_Draygon_11:
    dw $FFFE,$20C8,$0002,$150A,$150B,$2108,$0002,$151A                   ;A5B42C;
    dw $151B,$FFFF                                                       ;A5B43C;

ExtendedTilemap_Draygon_12:
    dw $FFFE,$20C8,$0002,$150C,$150D,$2108,$0002,$151C                   ;A5B440;
    dw $151D,$FFFF                                                       ;A5B450;

ExtendedTilemap_Draygon_13:
    dw $FFFE,$20C8,$0002,$1534,$1535,$2108,$0002,$1544                   ;A5B454;
    dw $1545,$FFFF                                                       ;A5B464;

ExtendedTilemap_Draygon_14:
    dw $FFFE,$20C8,$0002,$150E,$150F,$2108,$0002,$151E                   ;A5B468;
    dw $151F,$FFFF                                                       ;A5B478;

ExtendedTilemap_Draygon_15:
    dw $FFFE,$20C8,$0002,$152C,$152D,$2108,$0002,$153C                   ;A5B47C;
    dw $153D,$FFFF                                                       ;A5B48C;

ExtendedTilemap_Draygon_16:
    dw $FFFE,$20C8,$0002,$152E,$152F,$2108,$0002,$153E                   ;A5B490;
    dw $153F,$FFFF                                                       ;A5B4A0;

ExtendedTilemap_Draygon_17:
    dw $FFFE,$2000,$0010,$1500,$1501,$1502,$1503,$1504                   ;A5B4A4;
    dw $1505,$1506,$1507,$0338,$0338,$0338,$0338,$0338                   ;A5B4B4;
    dw $0338,$0338,$0338,$2040,$0010,$1510,$1511,$1512                   ;A5B4C4;
    dw $1513,$1514,$1515,$1516,$1517,$1518,$0338,$0338                   ;A5B4D4;
    dw $0338,$0338,$0338,$0338,$0338,$2080,$0010,$1520                   ;A5B4E4;
    dw $1521,$1522,$1523,$1524,$1525,$1526,$1527,$1528                   ;A5B4F4;
    dw $1529,$0338,$0338,$0338,$0338,$0338,$0338,$20C0                   ;A5B504;
    dw $0010,$1530,$1531,$1532,$1533,$02FF,$02FF,$1536                   ;A5B514;
    dw $1537,$1538,$1539,$153A,$0338,$0338,$0338,$0338                   ;A5B524;
    dw $0338,$2100,$0010,$0338,$0338,$1542,$1543,$02FF                   ;A5B534;
    dw $02FF,$1546,$1547,$1548,$1549,$154A,$154B,$154C                   ;A5B544;
    dw $154D,$154E,$1738,$2140,$0010,$0338,$0338,$0338                   ;A5B554;
    dw $1553,$1554,$1555,$1556,$1557,$1558,$1559,$155A                   ;A5B564;
    dw $155B,$155C,$155D,$155E,$155F,$2180,$0010,$0338                   ;A5B574;
    dw $0338,$0338,$0338,$1564,$1565,$1566,$1567,$1568                   ;A5B584;
    dw $1569,$156A,$156B,$156C,$156D,$156E,$156F,$21C0                   ;A5B594;
    dw $0010,$0338,$0338,$0338,$0338,$0338,$1575,$1576                   ;A5B5A4;
    dw $1577,$1578,$1579,$157A,$157B,$157C,$157D,$157E                   ;A5B5B4;
    dw $157F,$2200,$0010,$0338,$0338,$0338,$0338,$0338                   ;A5B5C4;
    dw $0338,$1586,$159E,$159F,$1589,$158A,$158B,$158C                   ;A5B5D4;
    dw $158D,$158E,$158F,$2240,$0010,$0338,$0338,$0338                   ;A5B5E4;
    dw $0338,$0338,$0338,$1596,$1597,$1598,$1599,$159A                   ;A5B5F4;
    dw $159B,$159C,$0338,$0338,$0338,$2280,$0010,$0338                   ;A5B604;
    dw $0338,$0338,$0338,$0338,$0338,$15A6,$15A7,$15A8                   ;A5B614;
    dw $15A9,$15AA,$15AB,$15AC,$0338,$0338,$0338,$22C0                   ;A5B624;
    dw $0010,$0338,$0338,$0338,$0338,$0338,$0338,$0338                   ;A5B634;
    dw $15B7,$15B8,$15B9,$15BA,$15BB,$15BC,$0338,$0338                   ;A5B644;
    dw $0338,$2300,$0010,$8338,$8338,$8338,$8338,$8338                   ;A5B654;
    dw $8338,$8338,$8338,$8338,$8338,$8338,$1508,$1509                   ;A5B664;
    dw $8338,$8338,$8338,$2340,$0010,$8338,$8338,$8338                   ;A5B674;
    dw $8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338                   ;A5B684;
    dw $153B,$1519,$8338,$8338,$8338,$2380,$0010,$8338                   ;A5B694;
    dw $8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338                   ;A5B6A4;
    dw $8338,$8338,$152A,$152B,$8338,$8338,$8338,$FFFF                   ;A5B6B4;

Spritemap_Draygon_12:
    dw $0003,$01F8                                                       ;A5B6C4;
    db $F8                                                               ;A5B6C8;
    dw $27BD,$01F8                                                       ;A5B6C9;
    db $F0                                                               ;A5B6CD;
    dw $27AD,$81F8                                                       ;A5B6CE;
    db $00                                                               ;A5B6D2;
    dw $27A9                                                             ;A5B6D3;

Spritemap_Draygon_13:
    dw $0003,$01F8                                                       ;A5B6D5;
    db $F8                                                               ;A5B6D9;
    dw $27BC,$01F8                                                       ;A5B6DA;
    db $F0                                                               ;A5B6DE;
    dw $27AC,$81F8                                                       ;A5B6DF;
    db $00                                                               ;A5B6E3;
    dw $27A7                                                             ;A5B6E4;

Spritemap_Draygon_14:
    dw $0004,$01F4                                                       ;A5B6E6;
    db $F4                                                               ;A5B6EA;
    dw $27BB,$01F4                                                       ;A5B6EB;
    db $EC                                                               ;A5B6EF;
    dw $27AB,$01F4                                                       ;A5B6F0;
    db $FC                                                               ;A5B6F4;
    dw $27A4,$81FC                                                       ;A5B6F5;
    db $FC                                                               ;A5B6F9;
    dw $27A5                                                             ;A5B6FA;

Spritemap_Draygon_15:
    dw $0002,$81F0                                                       ;A5B6FC;
    db $F8                                                               ;A5B700;
    dw $27A0,$8000                                                       ;A5B701;
    db $F8                                                               ;A5B705;
    dw $27A2                                                             ;A5B706;

Spritemap_Draygon_16:
    dw $0003,$01F8                                                       ;A5B708;
    db $00                                                               ;A5B70C;
    dw $2797,$01F0                                                       ;A5B70D;
    db $00                                                               ;A5B711;
    dw $2796,$8000                                                       ;A5B712;
    db $F8                                                               ;A5B716;
    dw $27AE                                                             ;A5B717;

Spritemap_Draygon_17:
    dw $0003,$01F8                                                       ;A5B719;
    db $00                                                               ;A5B71D;
    dw $27D1,$01F0                                                       ;A5B71E;
    db $00                                                               ;A5B722;
    dw $27D0,$8000                                                       ;A5B723;
    db $F8                                                               ;A5B727;
    dw $27C2                                                             ;A5B728;

Spritemap_Draygon_18:
    dw $0003,$01FC                                                       ;A5B72A;
    db $04                                                               ;A5B72E;
    dw $2787,$01F4                                                       ;A5B72F;
    db $04                                                               ;A5B733;
    dw $2786,$81FC                                                       ;A5B734;
    db $F4                                                               ;A5B738;
    dw $27C4                                                             ;A5B739;

Spritemap_Draygon_19:
    dw $0002,$81F8                                                       ;A5B73B;
    db $00                                                               ;A5B73F;
    dw $2788,$81F8                                                       ;A5B740;
    db $F0                                                               ;A5B744;
    dw $27C6                                                             ;A5B745;

Spritemap_Draygon_1A:
    dw $0003,$0000                                                       ;A5B747;
    db $00                                                               ;A5B74B;
    dw $E1BD,$0000                                                       ;A5B74C;
    db $08                                                               ;A5B750;
    dw $E1AD,$81F8                                                       ;A5B751;
    db $F0                                                               ;A5B755;
    dw $21C8                                                             ;A5B756;

Spritemap_Draygon_1B:
    dw $0003,$0000                                                       ;A5B758;
    db $00                                                               ;A5B75C;
    dw $E7BC,$0000                                                       ;A5B75D;
    db $08                                                               ;A5B761;
    dw $E7AC,$81F8                                                       ;A5B762;
    db $F0                                                               ;A5B766;
    dw $E7A7                                                             ;A5B767;

Spritemap_Draygon_1C:
    dw $0004,$0004                                                       ;A5B769;
    db $04                                                               ;A5B76D;
    dw $E7BB,$0004                                                       ;A5B76E;
    db $0C                                                               ;A5B772;
    dw $E7AB,$0004                                                       ;A5B773;
    db $FC                                                               ;A5B777;
    dw $E7A4,$81F4                                                       ;A5B778;
    db $F4                                                               ;A5B77C;
    dw $E7A5                                                             ;A5B77D;

Spritemap_Draygon_1D:
    dw $0002,$8000                                                       ;A5B77F;
    db $F8                                                               ;A5B783;
    dw $E7A0,$81F0                                                       ;A5B784;
    db $F8                                                               ;A5B788;
    dw $E7A2                                                             ;A5B789;

Spritemap_Draygon_1E:
    dw $0003,$0000                                                       ;A5B78B;
    db $F8                                                               ;A5B78F;
    dw $E797,$0008                                                       ;A5B790;
    db $F8                                                               ;A5B794;
    dw $E796,$81F0                                                       ;A5B795;
    db $F8                                                               ;A5B799;
    dw $E7AE                                                             ;A5B79A;

Spritemap_Draygon_1F:
    dw $0003,$0000                                                       ;A5B79C;
    db $F8                                                               ;A5B7A0;
    dw $E7D1,$0008                                                       ;A5B7A1;
    db $F8                                                               ;A5B7A5;
    dw $E7D0,$81F0                                                       ;A5B7A6;
    db $F8                                                               ;A5B7AA;
    dw $E7C2                                                             ;A5B7AB;

Spritemap_Draygon_20:
    dw $0003,$01FC                                                       ;A5B7AD;
    db $F4                                                               ;A5B7B1;
    dw $E787,$0004                                                       ;A5B7B2;
    db $F4                                                               ;A5B7B6;
    dw $E786,$81F4                                                       ;A5B7B7;
    db $FC                                                               ;A5B7BB;
    dw $E7C4                                                             ;A5B7BC;

Spritemap_Draygon_21:
    dw $0002,$81F8                                                       ;A5B7BE;
    db $F0                                                               ;A5B7C2;
    dw $E788,$81F8                                                       ;A5B7C3;
    db $00                                                               ;A5B7C7;
    dw $E7C6                                                             ;A5B7C8;

Spritemap_Draygon_22:
    dw $0001,$81F8                                                       ;A5B7CA;
    db $F8                                                               ;A5B7CE;
    dw $2784                                                             ;A5B7CF;

Spritemap_Draygon_23:
    dw $0001,$81F8                                                       ;A5B7D1;
    db $F8                                                               ;A5B7D5;
    dw $2782                                                             ;A5B7D6;

Spritemap_Draygon_24:
    dw $0001,$81F8                                                       ;A5B7D8;
    db $F8                                                               ;A5B7DC;
    dw $2780                                                             ;A5B7DD;

Spritemap_Draygon_25:
    dw $0001,$81F8                                                       ;A5B7DF;
    db $F8                                                               ;A5B7E3;
    dw $6784                                                             ;A5B7E4;

Spritemap_Draygon_26:
    dw $0001,$81F8                                                       ;A5B7E6;
    db $F8                                                               ;A5B7EA;
    dw $6782                                                             ;A5B7EB;

Spritemap_Draygon_27:
    dw $0001,$81F8                                                       ;A5B7ED;
    db $F8                                                               ;A5B7F1;
    dw $6780                                                             ;A5B7F2;

Spritemap_Draygon_28:
    dw $0004,$81E8                                                       ;A5B7F4;
    db $10                                                               ;A5B7F8;
    dw $4721,$81E8                                                       ;A5B7F9;
    db $00                                                               ;A5B7FD;
    dw $6701,$81F0                                                       ;A5B7FE;
    db $10                                                               ;A5B802;
    dw $6720,$81F0                                                       ;A5B803;
    db $00                                                               ;A5B807;
    dw $6700                                                             ;A5B808;

Spritemap_Draygon_29:
    dw $0004,$01F8                                                       ;A5B80A;
    db $10                                                               ;A5B80E;
    dw $6723,$81F0                                                       ;A5B80F;
    db $00                                                               ;A5B813;
    dw $6703,$81E8                                                       ;A5B814;
    db $10                                                               ;A5B818;
    dw $6724,$81E8                                                       ;A5B819;
    db $00                                                               ;A5B81D;
    dw $6704                                                             ;A5B81E;

Spritemap_Draygon_2A:
    dw $0002,$81F0                                                       ;A5B820;
    db $10                                                               ;A5B824;
    dw $6726,$81F0                                                       ;A5B825;
    db $00                                                               ;A5B829;
    dw $6706                                                             ;A5B82A;

Spritemap_Draygon_2B:
    dw $0018,$800B                                                       ;A5B82C;
    db $02                                                               ;A5B830;
    dw $671C,$8013                                                       ;A5B831;
    db $0A                                                               ;A5B835;
    dw $672B,$8003                                                       ;A5B836;
    db $FA                                                               ;A5B83A;
    dw $670D,$0004                                                       ;A5B83B;
    db $EC                                                               ;A5B83F;
    dw $6750,$81F4                                                       ;A5B840;
    db $E4                                                               ;A5B844;
    dw $6741,$81FC                                                       ;A5B845;
    db $F4                                                               ;A5B849;
    dw $6760,$8003                                                       ;A5B84A;
    db $0A                                                               ;A5B84E;
    dw $671C,$800B                                                       ;A5B84F;
    db $12                                                               ;A5B853;
    dw $672B,$81FB                                                       ;A5B854;
    db $02                                                               ;A5B858;
    dw $670D,$01FC                                                       ;A5B859;
    db $F4                                                               ;A5B85D;
    dw $6750,$81EC                                                       ;A5B85E;
    db $EC                                                               ;A5B862;
    dw $6741,$81F4                                                       ;A5B863;
    db $FC                                                               ;A5B867;
    dw $6760,$81FB                                                       ;A5B868;
    db $12                                                               ;A5B86C;
    dw $671C,$8003                                                       ;A5B86D;
    db $1A                                                               ;A5B871;
    dw $672B,$81F3                                                       ;A5B872;
    db $0A                                                               ;A5B876;
    dw $670D,$01F4                                                       ;A5B877;
    db $FC                                                               ;A5B87B;
    dw $6750,$81E4                                                       ;A5B87C;
    db $F4                                                               ;A5B880;
    dw $6741,$81EC                                                       ;A5B881;
    db $04                                                               ;A5B885;
    dw $6760,$81F4                                                       ;A5B886;
    db $1B                                                               ;A5B88A;
    dw $671C,$81FC                                                       ;A5B88B;
    db $23                                                               ;A5B88F;
    dw $672B,$81EC                                                       ;A5B890;
    db $13                                                               ;A5B894;
    dw $670D,$01ED                                                       ;A5B895;
    db $05                                                               ;A5B899;
    dw $6750,$81DD                                                       ;A5B89A;
    db $FD                                                               ;A5B89E;
    dw $6741,$81E5                                                       ;A5B89F;
    db $0D                                                               ;A5B8A3;
    dw $6760                                                             ;A5B8A4;

Spritemap_Draygon_2C:
    dw $0014,$81F8                                                       ;A5B8A6;
    db $F9                                                               ;A5B8AA;
    dw $672E,$0010                                                       ;A5B8AB;
    db $09                                                               ;A5B8AF;
    dw $674C,$8000                                                       ;A5B8B0;
    db $01                                                               ;A5B8B4;
    dw $673D,$81F4                                                       ;A5B8B5;
    db $F4                                                               ;A5B8B9;
    dw $6762,$81F4                                                       ;A5B8BA;
    db $E4                                                               ;A5B8BE;
    dw $6743,$81F0                                                       ;A5B8BF;
    db $01                                                               ;A5B8C3;
    dw $672E,$0008                                                       ;A5B8C4;
    db $11                                                               ;A5B8C8;
    dw $674C,$81F8                                                       ;A5B8C9;
    db $09                                                               ;A5B8CD;
    dw $673D,$81EC                                                       ;A5B8CE;
    db $FC                                                               ;A5B8D2;
    dw $6762,$81EC                                                       ;A5B8D3;
    db $EC                                                               ;A5B8D7;
    dw $6743,$81E8                                                       ;A5B8D8;
    db $09                                                               ;A5B8DC;
    dw $672E,$0000                                                       ;A5B8DD;
    db $19                                                               ;A5B8E1;
    dw $674C,$81F0                                                       ;A5B8E2;
    db $11                                                               ;A5B8E6;
    dw $673D,$81E4                                                       ;A5B8E7;
    db $04                                                               ;A5B8EB;
    dw $6762,$81E4                                                       ;A5B8EC;
    db $F4                                                               ;A5B8F0;
    dw $6743,$81E1                                                       ;A5B8F1;
    db $12                                                               ;A5B8F5;
    dw $672E,$01F9                                                       ;A5B8F6;
    db $22                                                               ;A5B8FA;
    dw $674C,$81E9                                                       ;A5B8FB;
    db $1A                                                               ;A5B8FF;
    dw $673D,$81DD                                                       ;A5B900;
    db $0D                                                               ;A5B904;
    dw $6762,$81DD                                                       ;A5B905;
    db $FD                                                               ;A5B909;
    dw $6743                                                             ;A5B90A;

Spritemap_Draygon_2D:
    dw $0010,$81F7                                                       ;A5B90C;
    db $F9                                                               ;A5B910;
    dw $6738,$81EF                                                       ;A5B911;
    db $F1                                                               ;A5B915;
    dw $6729,$81EC                                                       ;A5B916;
    db $EC                                                               ;A5B91A;
    dw $6756,$81F4                                                       ;A5B91B;
    db $E4                                                               ;A5B91F;
    dw $6745,$81F0                                                       ;A5B920;
    db $00                                                               ;A5B924;
    dw $6738,$81E8                                                       ;A5B925;
    db $F8                                                               ;A5B929;
    dw $6729,$81E5                                                       ;A5B92A;
    db $F3                                                               ;A5B92E;
    dw $6756,$81ED                                                       ;A5B92F;
    db $EB                                                               ;A5B933;
    dw $6745,$81E9                                                       ;A5B934;
    db $07                                                               ;A5B938;
    dw $6738,$81E1                                                       ;A5B939;
    db $FF                                                               ;A5B93D;
    dw $6729,$81DE                                                       ;A5B93E;
    db $FA                                                               ;A5B942;
    dw $6756,$81E6                                                       ;A5B943;
    db $F2                                                               ;A5B947;
    dw $6745,$81E2                                                       ;A5B948;
    db $0E                                                               ;A5B94C;
    dw $6738,$81DA                                                       ;A5B94D;
    db $06                                                               ;A5B951;
    dw $6729,$81D7                                                       ;A5B952;
    db $01                                                               ;A5B956;
    dw $6756,$81DF                                                       ;A5B957;
    db $F9                                                               ;A5B95B;
    dw $6745                                                             ;A5B95C;

Spritemap_Draygon_2E:
    dw $0010,$81F0                                                       ;A5B95E;
    db $F4                                                               ;A5B962;
    dw $6768,$81F0                                                       ;A5B963;
    db $EC                                                               ;A5B967;
    dw $6758,$81EC                                                       ;A5B968;
    db $E4                                                               ;A5B96C;
    dw $6709,$81F4                                                       ;A5B96D;
    db $E4                                                               ;A5B971;
    dw $6708,$81E9                                                       ;A5B972;
    db $FC                                                               ;A5B976;
    dw $6768,$81E9                                                       ;A5B977;
    db $F4                                                               ;A5B97B;
    dw $6758,$81E5                                                       ;A5B97C;
    db $EC                                                               ;A5B980;
    dw $6709,$81ED                                                       ;A5B981;
    db $EC                                                               ;A5B985;
    dw $6708,$81E2                                                       ;A5B986;
    db $03                                                               ;A5B98A;
    dw $6768,$81E2                                                       ;A5B98B;
    db $FB                                                               ;A5B98F;
    dw $6758,$81DE                                                       ;A5B990;
    db $F3                                                               ;A5B994;
    dw $6709,$81E6                                                       ;A5B995;
    db $F3                                                               ;A5B999;
    dw $6708,$81DB                                                       ;A5B99A;
    db $0A                                                               ;A5B99E;
    dw $6768,$81DB                                                       ;A5B99F;
    db $02                                                               ;A5B9A3;
    dw $6758,$81D7                                                       ;A5B9A4;
    db $FA                                                               ;A5B9A8;
    dw $6709,$81DF                                                       ;A5B9A9;
    db $FA                                                               ;A5B9AD;
    dw $6708                                                             ;A5B9AE;

Spritemap_Draygon_2F:
    dw $0001,$81F8                                                       ;A5B9B0;
    db $F8                                                               ;A5B9B4;
    dw $2764                                                             ;A5B9B5;

Spritemap_Draygon_30:
    dw $0001,$81F8                                                       ;A5B9B7;
    db $F8                                                               ;A5B9BB;
    dw $276A                                                             ;A5B9BC;

Spritemap_Draygon_31:
    dw $0001,$81F8                                                       ;A5B9BE;
    db $F8                                                               ;A5B9C2;
    dw $275E                                                             ;A5B9C3;

Spritemap_Draygon_32:
    dw $0001,$81F8                                                       ;A5B9C5;
    db $F8                                                               ;A5B9C9;
    dw $275C                                                             ;A5B9CA;

Spritemap_Draygon_33:
    dw $0001,$81F8                                                       ;A5B9CC;
    db $F8                                                               ;A5B9D0;
    dw $274A                                                             ;A5B9D1;

Spritemap_Draygon_34:
    dw $000A,$81F4                                                       ;A5B9D3;
    db $F0                                                               ;A5B9D7;
    dw $4721,$81F4                                                       ;A5B9D8;
    db $E0                                                               ;A5B9DC;
    dw $4701,$81FC                                                       ;A5B9DD;
    db $F0                                                               ;A5B9E1;
    dw $4720,$81FC                                                       ;A5B9E2;
    db $E0                                                               ;A5B9E6;
    dw $4700,$0004                                                       ;A5B9E7;
    db $04                                                               ;A5B9EB;
    dw $6723,$81FC                                                       ;A5B9EC;
    db $F4                                                               ;A5B9F0;
    dw $6703,$81F4                                                       ;A5B9F1;
    db $04                                                               ;A5B9F5;
    dw $6724,$81F4                                                       ;A5B9F6;
    db $F4                                                               ;A5B9FA;
    dw $6704,$81FC                                                       ;A5B9FB;
    db $14                                                               ;A5B9FF;
    dw $6726,$81FC                                                       ;A5BA00;
    db $04                                                               ;A5BA04;
    dw $6706                                                             ;A5BA05;

Spritemap_Draygon_35:
    dw $000A,$81F5                                                       ;A5BA07;
    db $F0                                                               ;A5BA0B;
    dw $4721,$81F5                                                       ;A5BA0C;
    db $E0                                                               ;A5BA10;
    dw $4701,$81FD                                                       ;A5BA11;
    db $F0                                                               ;A5BA15;
    dw $4720,$81FD                                                       ;A5BA16;
    db $E0                                                               ;A5BA1A;
    dw $4700,$0005                                                       ;A5BA1B;
    db $04                                                               ;A5BA1F;
    dw $6723,$81FD                                                       ;A5BA20;
    db $F4                                                               ;A5BA24;
    dw $6703,$81F5                                                       ;A5BA25;
    db $04                                                               ;A5BA29;
    dw $6724,$81F5                                                       ;A5BA2A;
    db $F4                                                               ;A5BA2E;
    dw $6704,$81FD                                                       ;A5BA2F;
    db $14                                                               ;A5BA33;
    dw $6726,$81FD                                                       ;A5BA34;
    db $04                                                               ;A5BA38;
    dw $6706                                                             ;A5BA39;

Spritemap_Draygon_36:
    dw $0001,$01FC                                                       ;A5BA3B;
    db $FC                                                               ;A5BA3F;
    dw $277E                                                             ;A5BA40;

Spritemap_Draygon_37:
    dw $0001,$01FC                                                       ;A5BA42;
    db $FC                                                               ;A5BA46;
    dw $277D                                                             ;A5BA47;

Spritemap_Draygon_38:
    dw $0001,$01FC                                                       ;A5BA49;
    db $FC                                                               ;A5BA4D;
    dw $277C                                                             ;A5BA4E;

Spritemap_Draygon_39:
    dw $0001,$81F8                                                       ;A5BA50;
    db $F8                                                               ;A5BA54;
    dw $278A                                                             ;A5BA55;

Spritemap_Draygon_3A:
    dw $0001,$01FC                                                       ;A5BA57;
    db $FC                                                               ;A5BA5B;
    dw $277F                                                             ;A5BA5C;

Spritemap_Draygon_3B:
    dw $0001,$01FC                                                       ;A5BA5E;
    db $FC                                                               ;A5BA62;
    dw $2777                                                             ;A5BA63;

Spritemap_Draygon_3C:
    dw $0001,$01FC                                                       ;A5BA65;
    db $FC                                                               ;A5BA69;
    dw $2776                                                             ;A5BA6A;

Spritemap_Draygon_3D:
    dw $0001,$81F8                                                       ;A5BA6C;
    db $F8                                                               ;A5BA70;
    dw $278C                                                             ;A5BA71;

Spritemap_Draygon_3E:
    dw $0001,$81F8                                                       ;A5BA73;
    db $F8                                                               ;A5BA77;
    dw $278E                                                             ;A5BA78;

Spritemap_Draygon_3F:
    dw $000A,$81F5                                                       ;A5BA7A;
    db $F0                                                               ;A5BA7E;
    dw $4721,$81F5                                                       ;A5BA7F;
    db $E0                                                               ;A5BA83;
    dw $4701,$81FD                                                       ;A5BA84;
    db $F0                                                               ;A5BA88;
    dw $4720,$81FD                                                       ;A5BA89;
    db $E0                                                               ;A5BA8D;
    dw $4700,$0006                                                       ;A5BA8E;
    db $04                                                               ;A5BA92;
    dw $6723,$81FE                                                       ;A5BA93;
    db $F4                                                               ;A5BA97;
    dw $6703,$81F6                                                       ;A5BA98;
    db $04                                                               ;A5BA9C;
    dw $6724,$81F6                                                       ;A5BA9D;
    db $F4                                                               ;A5BAA1;
    dw $6704,$81FE                                                       ;A5BAA2;
    db $14                                                               ;A5BAA6;
    dw $6726,$81FE                                                       ;A5BAA7;
    db $04                                                               ;A5BAAB;
    dw $6706                                                             ;A5BAAC;

Spritemap_Draygon_40:
    dw $000A,$81F5                                                       ;A5BAAE;
    db $F0                                                               ;A5BAB2;
    dw $4721,$81F5                                                       ;A5BAB3;
    db $E0                                                               ;A5BAB7;
    dw $4701,$81FD                                                       ;A5BAB8;
    db $F0                                                               ;A5BABC;
    dw $4720,$81FD                                                       ;A5BABD;
    db $E0                                                               ;A5BAC1;
    dw $4700,$0006                                                       ;A5BAC2;
    db $04                                                               ;A5BAC6;
    dw $6723,$81FE                                                       ;A5BAC7;
    db $F4                                                               ;A5BACB;
    dw $6703,$81F6                                                       ;A5BACC;
    db $04                                                               ;A5BAD0;
    dw $6724,$81F6                                                       ;A5BAD1;
    db $F4                                                               ;A5BAD5;
    dw $6704,$81FF                                                       ;A5BAD6;
    db $14                                                               ;A5BADA;
    dw $6726,$81FF                                                       ;A5BADB;
    db $04                                                               ;A5BADF;
    dw $6706                                                             ;A5BAE0;

Spritemap_Draygon_41:
    dw $0013,$800B                                                       ;A5BAE2;
    db $02                                                               ;A5BAE6;
    dw $671C,$8013                                                       ;A5BAE7;
    db $0A                                                               ;A5BAEB;
    dw $672B,$8003                                                       ;A5BAEC;
    db $FA                                                               ;A5BAF0;
    dw $670D,$0004                                                       ;A5BAF1;
    db $EC                                                               ;A5BAF5;
    dw $6750,$81F4                                                       ;A5BAF6;
    db $E4                                                               ;A5BAFA;
    dw $6741,$81FC                                                       ;A5BAFB;
    db $F4                                                               ;A5BAFF;
    dw $6760,$81F0                                                       ;A5BB00;
    db $01                                                               ;A5BB04;
    dw $672E,$0008                                                       ;A5BB05;
    db $11                                                               ;A5BB09;
    dw $674C,$81F8                                                       ;A5BB0A;
    db $09                                                               ;A5BB0E;
    dw $673D,$81EC                                                       ;A5BB0F;
    db $FC                                                               ;A5BB13;
    dw $6762,$81EC                                                       ;A5BB14;
    db $EC                                                               ;A5BB18;
    dw $6743,$81E7                                                       ;A5BB19;
    db $09                                                               ;A5BB1D;
    dw $6738,$81DF                                                       ;A5BB1E;
    db $01                                                               ;A5BB22;
    dw $6729,$81DC                                                       ;A5BB23;
    db $FC                                                               ;A5BB27;
    dw $6756,$81E4                                                       ;A5BB28;
    db $F4                                                               ;A5BB2C;
    dw $6745,$81D8                                                       ;A5BB2D;
    db $0C                                                               ;A5BB31;
    dw $6768,$81D8                                                       ;A5BB32;
    db $04                                                               ;A5BB36;
    dw $6758,$81D4                                                       ;A5BB37;
    db $FC                                                               ;A5BB3B;
    dw $6709,$81DC                                                       ;A5BB3C;
    db $FC                                                               ;A5BB40;
    dw $6708                                                             ;A5BB41;

Spritemap_Draygon_42:
    dw $0011,$81F8                                                       ;A5BB43;
    db $F9                                                               ;A5BB47;
    dw $672E,$0010                                                       ;A5BB48;
    db $09                                                               ;A5BB4C;
    dw $674C,$8000                                                       ;A5BB4D;
    db $01                                                               ;A5BB51;
    dw $673D,$81F4                                                       ;A5BB52;
    db $F4                                                               ;A5BB56;
    dw $6762,$81F4                                                       ;A5BB57;
    db $E4                                                               ;A5BB5B;
    dw $6743,$81EF                                                       ;A5BB5C;
    db $01                                                               ;A5BB60;
    dw $6738,$81E7                                                       ;A5BB61;
    db $F9                                                               ;A5BB65;
    dw $6729,$81E4                                                       ;A5BB66;
    db $F4                                                               ;A5BB6A;
    dw $6756,$81EC                                                       ;A5BB6B;
    db $EC                                                               ;A5BB6F;
    dw $6745,$81E0                                                       ;A5BB70;
    db $04                                                               ;A5BB74;
    dw $6768,$81E0                                                       ;A5BB75;
    db $FC                                                               ;A5BB79;
    dw $6758,$81DC                                                       ;A5BB7A;
    db $F4                                                               ;A5BB7E;
    dw $6709,$81E4                                                       ;A5BB7F;
    db $F4                                                               ;A5BB83;
    dw $6708,$81DF                                                       ;A5BB84;
    db $11                                                               ;A5BB88;
    dw $6738,$81D7                                                       ;A5BB89;
    db $09                                                               ;A5BB8D;
    dw $6729,$81D4                                                       ;A5BB8E;
    db $04                                                               ;A5BB92;
    dw $6756,$81DC                                                       ;A5BB93;
    db $FC                                                               ;A5BB97;
    dw $6745                                                             ;A5BB98;

Spritemap_Draygon_43:
    dw $0011,$81F7                                                       ;A5BB9A;
    db $F9                                                               ;A5BB9E;
    dw $6738,$81EF                                                       ;A5BB9F;
    db $F1                                                               ;A5BBA3;
    dw $6729,$81EC                                                       ;A5BBA4;
    db $EC                                                               ;A5BBA8;
    dw $6756,$81F4                                                       ;A5BBA9;
    db $E4                                                               ;A5BBAD;
    dw $6745,$81E8                                                       ;A5BBAE;
    db $FC                                                               ;A5BBB2;
    dw $6768,$81E8                                                       ;A5BBB3;
    db $F4                                                               ;A5BBB7;
    dw $6758,$81E4                                                       ;A5BBB8;
    db $EC                                                               ;A5BBBC;
    dw $6709,$81EC                                                       ;A5BBBD;
    db $EC                                                               ;A5BBC1;
    dw $6708,$81E7                                                       ;A5BBC2;
    db $09                                                               ;A5BBC6;
    dw $6738,$81DF                                                       ;A5BBC7;
    db $01                                                               ;A5BBCB;
    dw $6729,$81DC                                                       ;A5BBCC;
    db $FC                                                               ;A5BBD0;
    dw $6756,$81E4                                                       ;A5BBD1;
    db $F4                                                               ;A5BBD5;
    dw $6745,$81E0                                                       ;A5BBD6;
    db $11                                                               ;A5BBDA;
    dw $672E,$01F8                                                       ;A5BBDB;
    db $21                                                               ;A5BBDF;
    dw $674C,$81E8                                                       ;A5BBE0;
    db $19                                                               ;A5BBE4;
    dw $673D,$81DC                                                       ;A5BBE5;
    db $0C                                                               ;A5BBE9;
    dw $6762,$81DC                                                       ;A5BBEA;
    db $FC                                                               ;A5BBEE;
    dw $6743                                                             ;A5BBEF;

Spritemap_Draygon_44:
    dw $0013,$81F0                                                       ;A5BBF1;
    db $F4                                                               ;A5BBF5;
    dw $6768,$81F0                                                       ;A5BBF6;
    db $EC                                                               ;A5BBFA;
    dw $6758,$81EC                                                       ;A5BBFB;
    db $E4                                                               ;A5BBFF;
    dw $6709,$81F4                                                       ;A5BC00;
    db $E4                                                               ;A5BC04;
    dw $6708,$81EF                                                       ;A5BC05;
    db $01                                                               ;A5BC09;
    dw $6738,$81E7                                                       ;A5BC0A;
    db $F9                                                               ;A5BC0E;
    dw $6729,$81E4                                                       ;A5BC0F;
    db $F4                                                               ;A5BC13;
    dw $6756,$81EC                                                       ;A5BC14;
    db $EC                                                               ;A5BC18;
    dw $6745,$81E8                                                       ;A5BC19;
    db $09                                                               ;A5BC1D;
    dw $672E,$0000                                                       ;A5BC1E;
    db $19                                                               ;A5BC22;
    dw $674C,$81F0                                                       ;A5BC23;
    db $11                                                               ;A5BC27;
    dw $673D,$81E4                                                       ;A5BC28;
    db $04                                                               ;A5BC2C;
    dw $6762,$81E4                                                       ;A5BC2D;
    db $F4                                                               ;A5BC31;
    dw $6743,$81F3                                                       ;A5BC32;
    db $1A                                                               ;A5BC36;
    dw $671C,$81FB                                                       ;A5BC37;
    db $22                                                               ;A5BC3B;
    dw $672B,$81EB                                                       ;A5BC3C;
    db $12                                                               ;A5BC40;
    dw $670D,$01EC                                                       ;A5BC41;
    db $04                                                               ;A5BC45;
    dw $6750,$81DC                                                       ;A5BC46;
    db $FC                                                               ;A5BC4A;
    dw $6741,$81E4                                                       ;A5BC4B;
    db $0C                                                               ;A5BC4F;
    dw $6760                                                             ;A5BC50;

Spritemap_Draygon_45:
    dw $0014,$81F7                                                       ;A5BC52;
    db $F9                                                               ;A5BC56;
    dw $6738,$81EF                                                       ;A5BC57;
    db $F1                                                               ;A5BC5B;
    dw $6729,$81EC                                                       ;A5BC5C;
    db $EC                                                               ;A5BC60;
    dw $6756,$81F4                                                       ;A5BC61;
    db $E4                                                               ;A5BC65;
    dw $6745,$81F0                                                       ;A5BC66;
    db $01                                                               ;A5BC6A;
    dw $672E,$0008                                                       ;A5BC6B;
    db $11                                                               ;A5BC6F;
    dw $674C,$81F8                                                       ;A5BC70;
    db $09                                                               ;A5BC74;
    dw $673D,$81EC                                                       ;A5BC75;
    db $FC                                                               ;A5BC79;
    dw $6762,$81EC                                                       ;A5BC7A;
    db $EC                                                               ;A5BC7E;
    dw $6743,$81FB                                                       ;A5BC7F;
    db $12                                                               ;A5BC83;
    dw $671C,$8003                                                       ;A5BC84;
    db $1A                                                               ;A5BC88;
    dw $672B,$81F3                                                       ;A5BC89;
    db $0A                                                               ;A5BC8D;
    dw $670D,$01F4                                                       ;A5BC8E;
    db $FC                                                               ;A5BC92;
    dw $6750,$81E4                                                       ;A5BC93;
    db $F4                                                               ;A5BC97;
    dw $6741,$81EC                                                       ;A5BC98;
    db $04                                                               ;A5BC9C;
    dw $6760,$81E0                                                       ;A5BC9D;
    db $11                                                               ;A5BCA1;
    dw $672E,$01F8                                                       ;A5BCA2;
    db $21                                                               ;A5BCA6;
    dw $674C,$81E8                                                       ;A5BCA7;
    db $19                                                               ;A5BCAB;
    dw $673D,$81DC                                                       ;A5BCAC;
    db $0C                                                               ;A5BCB0;
    dw $6762,$81DC                                                       ;A5BCB1;
    db $FC                                                               ;A5BCB5;
    dw $6743                                                             ;A5BCB6;

Spritemap_Draygon_46:
    dw $0014,$81F8                                                       ;A5BCB8;
    db $F9                                                               ;A5BCBC;
    dw $672E,$0010                                                       ;A5BCBD;
    db $09                                                               ;A5BCC1;
    dw $674C,$8000                                                       ;A5BCC2;
    db $01                                                               ;A5BCC6;
    dw $673D,$81F4                                                       ;A5BCC7;
    db $F4                                                               ;A5BCCB;
    dw $6762,$81F4                                                       ;A5BCCC;
    db $E4                                                               ;A5BCD0;
    dw $6743,$8003                                                       ;A5BCD1;
    db $0A                                                               ;A5BCD5;
    dw $671C,$800B                                                       ;A5BCD6;
    db $12                                                               ;A5BCDA;
    dw $672B,$81FB                                                       ;A5BCDB;
    db $02                                                               ;A5BCDF;
    dw $670D,$01FC                                                       ;A5BCE0;
    db $F4                                                               ;A5BCE4;
    dw $6750,$81EC                                                       ;A5BCE5;
    db $EC                                                               ;A5BCE9;
    dw $6741,$81F4                                                       ;A5BCEA;
    db $FC                                                               ;A5BCEE;
    dw $6760,$81E8                                                       ;A5BCEF;
    db $09                                                               ;A5BCF3;
    dw $672E,$0000                                                       ;A5BCF4;
    db $19                                                               ;A5BCF8;
    dw $674C,$81F0                                                       ;A5BCF9;
    db $11                                                               ;A5BCFD;
    dw $673D,$81E4                                                       ;A5BCFE;
    db $04                                                               ;A5BD02;
    dw $6762,$81E4                                                       ;A5BD03;
    db $F4                                                               ;A5BD07;
    dw $6743,$81DF                                                       ;A5BD08;
    db $11                                                               ;A5BD0C;
    dw $6738,$81D7                                                       ;A5BD0D;
    db $09                                                               ;A5BD11;
    dw $6729,$81D4                                                       ;A5BD12;
    db $04                                                               ;A5BD16;
    dw $6756,$81DC                                                       ;A5BD17;
    db $FC                                                               ;A5BD1B;
    dw $6745                                                             ;A5BD1C;

Spritemap_Draygon_47:
    dw $0013,$8035                                                       ;A5BD1E;
    db $E5                                                               ;A5BD22;
    dw $671C,$803D                                                       ;A5BD23;
    db $ED                                                               ;A5BD27;
    dw $672B,$802D                                                       ;A5BD28;
    db $DD                                                               ;A5BD2C;
    dw $670D,$002E                                                       ;A5BD2D;
    db $CF                                                               ;A5BD31;
    dw $6750,$801E                                                       ;A5BD32;
    db $C7                                                               ;A5BD36;
    dw $6741,$8026                                                       ;A5BD37;
    db $D7                                                               ;A5BD3B;
    dw $6760,$81E2                                                       ;A5BD3C;
    db $05                                                               ;A5BD40;
    dw $6768,$81E2                                                       ;A5BD41;
    db $FD                                                               ;A5BD45;
    dw $6758,$81DE                                                       ;A5BD46;
    db $F5                                                               ;A5BD4A;
    dw $6709,$81E6                                                       ;A5BD4B;
    db $F5                                                               ;A5BD4F;
    dw $6708,$81F9                                                       ;A5BD50;
    db $F0                                                               ;A5BD54;
    dw $6738,$81F1                                                       ;A5BD55;
    db $E8                                                               ;A5BD59;
    dw $6729,$81EE                                                       ;A5BD5A;
    db $E3                                                               ;A5BD5E;
    dw $6756,$81F6                                                       ;A5BD5F;
    db $DB                                                               ;A5BD63;
    dw $6745,$8018                                                       ;A5BD64;
    db $ED                                                               ;A5BD68;
    dw $672E,$0030                                                       ;A5BD69;
    db $FD                                                               ;A5BD6D;
    dw $674C,$8020                                                       ;A5BD6E;
    db $F5                                                               ;A5BD72;
    dw $673D,$8014                                                       ;A5BD73;
    db $E8                                                               ;A5BD77;
    dw $6762,$8014                                                       ;A5BD78;
    db $D8                                                               ;A5BD7C;
    dw $6743                                                             ;A5BD7D;

ExtendedTilemap_Draygon_18:
    dw $FFFE,$2316,$0002,$159F,$15A0,$2356,$0002,$15AC                   ;A5BD7F;
    dw $15AD,$2394,$0003,$15B9,$15BA,$15BB,$23D4,$0003                   ;A5BD8F;
    dw $15C8,$15C9,$15CA,$2414,$0003,$15D7,$15D8,$15D9                   ;A5BD9F;
    dw $2454,$0003,$15DF,$15E0,$1547,$2496,$0002,$1547                   ;A5BDAF;
    dw $1547,$FFFF                                                       ;A5BDBF;

ExtendedTilemap_Draygon_19:
    dw $FFFE,$2316,$0002,$1559,$155A,$2356,$0002,$1569                   ;A5BDC3;
    dw $156A,$2394,$0003,$1576,$1577,$1578,$23D2,$0004                   ;A5BDD3;
    dw $1585,$1586,$1587,$1588,$2412,$0004,$1592,$1593                   ;A5BDE3;
    dw $1594,$1595,$2452,$0004,$15A1,$15A2,$15A3,$0147                   ;A5BDF3;
    dw $2496,$0002,$0147,$0147,$FFFF                                     ;A5BE03;

ExtendedTilemap_Draygon_1A:
    dw $FFFE,$2316,$0002,$1596,$1597,$2356,$0002,$15A4                   ;A5BE0D;
    dw $15A5,$2390,$0005,$15AE,$15AF,$15B0,$15B1,$15B2                   ;A5BE1D;
    dw $23CE,$0006,$15BC,$15BD,$15BE,$15BF,$15C0,$15C1                   ;A5BE2D;
    dw $240E,$0006,$15CB,$15CC,$15CD,$15CE,$15CF,$15D0                   ;A5BE3D;
    dw $2452,$0003,$0147,$0147,$0147,$FFFF                               ;A5BE4D;

ExtendedTilemap_Draygon_1B:
    dw $FFFE,$230A,$0003,$15DA,$15DB,$1547,$2316,$0002                   ;A5BE59;
    dw $15DC,$15DD,$234C,$0003,$15E1,$15E2,$15E3,$2354                   ;A5BE69;
    dw $0003,$15AE,$15E4,$15E5,$238C,$0007,$15E9,$15EA                   ;A5BE79;
    dw $15EB,$15EC,$15ED,$15EE,$15EF,$23CC,$0007,$15F3                   ;A5BE89;
    dw $15F4,$15F5,$15F6,$15F7,$15F8,$15F9,$240E,$0005                   ;A5BE99;
    dw $1600,$1601,$1602,$1603,$1604,$FFFF                               ;A5BEA9;

ExtendedTilemap_Draygon_1C:
    dw $FFFE,$230A,$0003,$0147,$0147,$0147,$2316,$0002                   ;A5BEB5;
    dw $1596,$1597,$234C,$0003,$0147,$0147,$0147,$2354                   ;A5BEC5;
    dw $0003,$0147,$15A4,$15A5,$238C,$0007,$0147,$0147                   ;A5BED5;
    dw $15AE,$15AF,$15B0,$15B1,$15B2,$23CC,$0007,$0147                   ;A5BEE5;
    dw $15BC,$15BD,$15BE,$15BF,$15C0,$15C1,$240E,$0005                   ;A5BEF5;
    dw $15CB,$15CC,$15CD,$15CE,$15CF,$FFFF                               ;A5BF05;

ExtendedTilemap_Draygon_1D:
    dw $FFFE,$2316,$0002,$1559,$155A,$2356,$0002,$1569                   ;A5BF11;
    dw $156A,$2390,$0005,$0147,$0147,$1576,$1577,$1578                   ;A5BF21;
    dw $23CE,$0006,$0147,$0147,$1585,$1586,$1587,$1588                   ;A5BF31;
    dw $240E,$0006,$0147,$0147,$1592,$1593,$1594,$1595                   ;A5BF41;
    dw $2452,$0003,$15A1,$15A2,$15A3,$FFFF                               ;A5BF51;

ExtendedTilemap_Draygon_1E:
    dw $FFFE,$2316,$0002,$159F,$15A0,$2356,$0002,$15AC                   ;A5BF5D;
    dw $15AD,$2394,$0003,$15B9,$15BA,$15BB,$23D2,$0004                   ;A5BF6D;
    dw $0147,$15C8,$15C9,$15CA,$2412,$0004,$0147,$15D7                   ;A5BF7D;
    dw $15D8,$15D9,$2452,$0004,$0147,$15DF,$15E0,$1547                   ;A5BF8D;
    dw $2496,$0002,$1547,$1547,$FFFF                                     ;A5BF9D;

ExtendedTilemap_Draygon_1F:
    dw $FFFE,$2154,$0002,$5555,$5554,$2194,$0002,$5565                   ;A5BFA7;
    dw $5564,$FFFF                                                       ;A5BFB7;

ExtendedTilemap_Draygon_20:
    dw $FFFE,$2154,$0002,$5581,$5580,$2194,$0002,$5591                   ;A5BFBB;
    dw $5590,$FFFF                                                       ;A5BFCB;

ExtendedTilemap_Draygon_21:
    dw $FFFE,$2154,$0002,$5583,$5582,$2194,$0002,$5593                   ;A5BFCF;
    dw $5592,$FFFF                                                       ;A5BFDF;

ExtendedTilemap_Draygon_22:
    dw $FFFE,$2154,$0002,$5563,$5562,$2194,$0002,$5573                   ;A5BFE3;
    dw $5572,$FFFF                                                       ;A5BFF3;

ExtendedTilemap_Draygon_23:
    dw $FFFE,$220E,$0003,$559F,$559E,$5586,$224E,$0003                   ;A5BFF7;
    dw $5598,$5597,$5596,$228E,$0003,$55A8,$55A7,$55A6                   ;A5C007;
    dw $FFFF                                                             ;A5C017;

ExtendedTilemap_Draygon_24:
    dw $FFFE,$2212,$0001,$559D,$224E,$0003,$55AF,$55AE                   ;A5C019;
    dw $55AD,$228E,$0003,$55BF,$55BE,$55BD,$FFFF                         ;A5C029;

ExtendedTilemap_Draygon_25:
    dw $FFFE,$220E,$0003,$55A2,$55A1,$55A0,$224E,$0003                   ;A5C037;
    dw $55B2,$55B1,$55B0,$228E,$0003,$55B6,$55B5,$55B4                   ;A5C047;
    dw $FFFF                                                             ;A5C057;

ExtendedTilemap_Draygon_26:
    dw $FFFE,$220E,$0003,$5585,$5584,$55A3,$224E,$0003                   ;A5C059;
    dw $5595,$5594,$55B3,$228E,$0003,$55A5,$55A4,$5574                   ;A5C069;
    dw $FFFF                                                             ;A5C079;

ExtendedTilemap_Draygon_27:
    dw $FFFE,$20D4,$0002,$5541,$5540,$2114,$0002,$5551                   ;A5C07B;
    dw $5550,$FFFF                                                       ;A5C08B;

ExtendedTilemap_Draygon_28:
    dw $FFFE,$20D4,$0002,$5561,$5560,$2114,$0002,$5571                   ;A5C08F;
    dw $5570,$FFFF                                                       ;A5C09F;

ExtendedTilemap_Draygon_29:
    dw $FFFE,$20D4,$0002,$550B,$550A,$2114,$0002,$551B                   ;A5C0A3;
    dw $551A,$FFFF                                                       ;A5C0B3;

ExtendedTilemap_Draygon_2A:
    dw $FFFE,$20D4,$0002,$550D,$550C,$2114,$0002,$551D                   ;A5C0B7;
    dw $551C,$FFFF                                                       ;A5C0C7;

ExtendedTilemap_Draygon_2B:
    dw $FFFE,$20D4,$0002,$5535,$5534,$2114,$0002,$5545                   ;A5C0CB;
    dw $5544,$FFFF                                                       ;A5C0DB;

ExtendedTilemap_Draygon_2C:
    dw $FFFE,$20D4,$0002,$550F,$550E,$2114,$0002,$551F                   ;A5C0DF;
    dw $551E,$FFFF                                                       ;A5C0EF;

ExtendedTilemap_Draygon_2D:
    dw $FFFE,$20D4,$0002,$552D,$552C,$2114,$0002,$553D                   ;A5C0F3;
    dw $553C,$FFFF                                                       ;A5C103;

ExtendedTilemap_Draygon_2E:
    dw $FFFE,$20D4,$0002,$552F,$552E,$2114,$0002,$553F                   ;A5C107;
    dw $553E,$FFFF                                                       ;A5C117;

ExtendedTilemap_Draygon_2F:
    dw $FFFE,$2000,$0010,$4338,$4338,$4338,$4338,$4338                   ;A5C11B;
    dw $4338,$4338,$4338,$5507,$5506,$5505,$5504,$5503                   ;A5C12B;
    dw $5502,$5501,$5500,$2040,$0010,$4338,$4338,$4338                   ;A5C13B;
    dw $4338,$4338,$4338,$4338,$5518,$5517,$5516,$5515                   ;A5C14B;
    dw $5514,$5513,$5512,$5511,$5510,$2080,$0010,$4338                   ;A5C15B;
    dw $4338,$4338,$4338,$4338,$4338,$5529,$5528,$5527                   ;A5C16B;
    dw $5526,$5525,$5524,$5523,$5522,$5521,$5520,$20C0                   ;A5C17B;
    dw $0010,$4338,$4338,$4338,$4338,$4338,$553A,$5539                   ;A5C18B;
    dw $5538,$5537,$5536,$02FF,$02FF,$5533,$5532,$5531                   ;A5C19B;
    dw $5530,$2100,$0010,$5738,$554E,$554D,$554C,$554B                   ;A5C1AB;
    dw $554A,$5549,$5548,$5547,$5546,$02FF,$02FF,$5543                   ;A5C1BB;
    dw $5542,$4338,$4338,$2140,$0010,$555F,$555E,$555D                   ;A5C1CB;
    dw $555C,$555B,$555A,$5559,$5558,$5557,$5556,$5555                   ;A5C1DB;
    dw $5554,$5553,$4338,$4338,$4338,$2180,$0010,$556F                   ;A5C1EB;
    dw $556E,$556D,$556C,$556B,$556A,$5569,$5568,$5567                   ;A5C1FB;
    dw $5566,$5565,$5564,$4338,$4338,$4338,$4338,$21C0                   ;A5C20B;
    dw $0010,$557F,$557E,$557D,$557C,$557B,$557A,$5579                   ;A5C21B;
    dw $5578,$5577,$5576,$5575,$4338,$4338,$4338,$4338                   ;A5C22B;
    dw $4338,$2200,$0010,$558F,$558E,$558D,$558C,$558B                   ;A5C23B;
    dw $558A,$5589,$559F,$559E,$5586,$4338,$4338,$4338                   ;A5C24B;
    dw $4338,$4338,$4338,$2240,$0010,$4338,$4338,$4338                   ;A5C25B;
    dw $559C,$559B,$559A,$5599,$5598,$5597,$5596,$4338                   ;A5C26B;
    dw $4338,$4338,$4338,$4338,$4338,$2280,$0010,$4338                   ;A5C27B;
    dw $4338,$4338,$55AC,$55AB,$55AA,$55A9,$55A8,$55A7                   ;A5C28B;
    dw $55A6,$4338,$4338,$4338,$4338,$4338,$4338,$22C0                   ;A5C29B;
    dw $0010,$4338,$4338,$4338,$55BC,$55BB,$55BA,$55B9                   ;A5C2AB;
    dw $55B8,$55B7,$4338,$4338,$4338,$4338,$4338,$4338                   ;A5C2BB;
    dw $4338,$2300,$0010,$C338,$C338,$C338,$5509,$5508                   ;A5C2CB;
    dw $C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338                   ;A5C2DB;
    dw $C338,$C338,$C338,$2340,$0010,$C338,$C338,$C338                   ;A5C2EB;
    dw $5519,$553B,$C338,$C338,$C338,$C338,$C338,$C338                   ;A5C2FB;
    dw $C338,$C338,$C338,$C338,$C338,$2380,$0010,$C338                   ;A5C30B;
    dw $C338,$C338,$552B,$552A,$C338,$C338,$C338,$C338                   ;A5C31B;
    dw $C338,$C338,$C338,$C338,$C338,$C338,$C338,$FFFF                   ;A5C32B;

Spritemap_Draygon_48:
    dw $0003,$0000                                                       ;A5C33B;
    db $F8                                                               ;A5C33F;
    dw $67BD,$0000                                                       ;A5C340;
    db $F0                                                               ;A5C344;
    dw $67AD,$81F8                                                       ;A5C345;
    db $00                                                               ;A5C349;
    dw $67A9                                                             ;A5C34A;

Spritemap_Draygon_49:
    dw $0003,$0000                                                       ;A5C34C;
    db $F8                                                               ;A5C350;
    dw $67BC,$0000                                                       ;A5C351;
    db $F0                                                               ;A5C355;
    dw $67AC,$81F8                                                       ;A5C356;
    db $00                                                               ;A5C35A;
    dw $67A7                                                             ;A5C35B;

Spritemap_Draygon_4A:
    dw $0004,$0004                                                       ;A5C35D;
    db $F4                                                               ;A5C361;
    dw $67BB,$0004                                                       ;A5C362;
    db $EC                                                               ;A5C366;
    dw $67AB,$0004                                                       ;A5C367;
    db $FC                                                               ;A5C36B;
    dw $67A4,$81F4                                                       ;A5C36C;
    db $FC                                                               ;A5C370;
    dw $67A5                                                             ;A5C371;

Spritemap_Draygon_4B:
    dw $0002,$8000                                                       ;A5C373;
    db $F8                                                               ;A5C377;
    dw $67A0,$81F0                                                       ;A5C378;
    db $F8                                                               ;A5C37C;
    dw $67A2                                                             ;A5C37D;

Spritemap_Draygon_4C:
    dw $0003,$0000                                                       ;A5C37F;
    db $00                                                               ;A5C383;
    dw $6797,$0008                                                       ;A5C384;
    db $00                                                               ;A5C388;
    dw $6796,$81F0                                                       ;A5C389;
    db $F8                                                               ;A5C38D;
    dw $67AE                                                             ;A5C38E;

Spritemap_Draygon_4D:
    dw $0003,$0000                                                       ;A5C390;
    db $00                                                               ;A5C394;
    dw $67D1,$0008                                                       ;A5C395;
    db $00                                                               ;A5C399;
    dw $67D0,$81F0                                                       ;A5C39A;
    db $F8                                                               ;A5C39E;
    dw $67C2                                                             ;A5C39F;

Spritemap_Draygon_4E:
    dw $0003,$01FC                                                       ;A5C3A1;
    db $04                                                               ;A5C3A5;
    dw $6787,$0004                                                       ;A5C3A6;
    db $04                                                               ;A5C3AA;
    dw $6786,$81F4                                                       ;A5C3AB;
    db $F4                                                               ;A5C3AF;
    dw $67C4                                                             ;A5C3B0;

Spritemap_Draygon_4F:
    dw $0002,$81F8                                                       ;A5C3B2;
    db $00                                                               ;A5C3B6;
    dw $6788,$81F8                                                       ;A5C3B7;
    db $F0                                                               ;A5C3BB;
    dw $67C6                                                             ;A5C3BC;

Spritemap_Draygon_50:
    dw $0003,$0000                                                       ;A5C3BE;
    db $00                                                               ;A5C3C2;
    dw $E1BD,$0000                                                       ;A5C3C3;
    db $08                                                               ;A5C3C7;
    dw $E1AD,$81F8                                                       ;A5C3C8;
    db $F0                                                               ;A5C3CC;
    dw $21C8                                                             ;A5C3CD;

Spritemap_Draygon_51:
    dw $0003,$01F8                                                       ;A5C3CF;
    db $00                                                               ;A5C3D3;
    dw $A7BC,$01F8                                                       ;A5C3D4;
    db $08                                                               ;A5C3D8;
    dw $A7AC,$81F8                                                       ;A5C3D9;
    db $F0                                                               ;A5C3DD;
    dw $A7A7                                                             ;A5C3DE;

Spritemap_Draygon_52:
    dw $0004,$01F4                                                       ;A5C3E0;
    db $04                                                               ;A5C3E4;
    dw $A7BB,$01F4                                                       ;A5C3E5;
    db $0C                                                               ;A5C3E9;
    dw $A7AB,$01F4                                                       ;A5C3EA;
    db $FC                                                               ;A5C3EE;
    dw $A7A4,$81FC                                                       ;A5C3EF;
    db $F4                                                               ;A5C3F3;
    dw $A7A5                                                             ;A5C3F4;

Spritemap_Draygon_53:
    dw $0002,$81F0                                                       ;A5C3F6;
    db $F8                                                               ;A5C3FA;
    dw $A7A0,$8000                                                       ;A5C3FB;
    db $F8                                                               ;A5C3FF;
    dw $A7A2                                                             ;A5C400;

Spritemap_Draygon_54:
    dw $0003,$01F8                                                       ;A5C402;
    db $F8                                                               ;A5C406;
    dw $A797,$01F0                                                       ;A5C407;
    db $F8                                                               ;A5C40B;
    dw $A796,$8000                                                       ;A5C40C;
    db $F8                                                               ;A5C410;
    dw $A7AE                                                             ;A5C411;

Spritemap_Draygon_55:
    dw $0003,$01F8                                                       ;A5C413;
    db $F8                                                               ;A5C417;
    dw $A7D1,$01F0                                                       ;A5C418;
    db $F8                                                               ;A5C41C;
    dw $A7D0,$8000                                                       ;A5C41D;
    db $F8                                                               ;A5C421;
    dw $A7C2                                                             ;A5C422;

Spritemap_Draygon_56:
    dw $0003,$01FC                                                       ;A5C424;
    db $F4                                                               ;A5C428;
    dw $A787,$01F4                                                       ;A5C429;
    db $F4                                                               ;A5C42D;
    dw $A786,$81FC                                                       ;A5C42E;
    db $FC                                                               ;A5C432;
    dw $A7C4                                                             ;A5C433;

Spritemap_Draygon_57:
    dw $0002,$81F8                                                       ;A5C435;
    db $F0                                                               ;A5C439;
    dw $A788,$81F8                                                       ;A5C43A;
    db $00                                                               ;A5C43E;
    dw $A7C6                                                             ;A5C43F;

Spritemap_Draygon_58:
    dw $0001,$81F8                                                       ;A5C441;
    db $F8                                                               ;A5C445;
    dw $6784                                                             ;A5C446;

Spritemap_Draygon_59:
    dw $0001,$81F8                                                       ;A5C448;
    db $F8                                                               ;A5C44C;
    dw $6782                                                             ;A5C44D;

Spritemap_Draygon_5A:
    dw $0001,$81F8                                                       ;A5C44F;
    db $F8                                                               ;A5C453;
    dw $6780                                                             ;A5C454;

Spritemap_Draygon_5B:
    dw $0001,$81F8                                                       ;A5C456;
    db $F8                                                               ;A5C45A;
    dw $2784                                                             ;A5C45B;

Spritemap_Draygon_5C:
    dw $0001,$81F8                                                       ;A5C45D;
    db $F8                                                               ;A5C461;
    dw $2782                                                             ;A5C462;

Spritemap_Draygon_5D:
    dw $0001,$81F8                                                       ;A5C464;
    db $F8                                                               ;A5C468;
    dw $2780                                                             ;A5C469;

InitAI_DraygonEye:
    LDX.W $0E54                                                          ;A5C46B;
    LDA.W #InstList_DraygonEye_FacingLeft_Idle                           ;A5C46E;
    STA.W $0F92,X                                                        ;A5C471;
    LDA.W #RTS_A5804B                                                    ;A5C474;
    STA.W $0FA8,X                                                        ;A5C477;
    RTL                                                                  ;A5C47A;


Instruction_Draygon_EyeFunctionInY:
    PHY                                                                  ;A5C47B;
    LDA.W $0000,Y                                                        ;A5C47C;
    STA.W $0FE8                                                          ;A5C47F;
    PLY                                                                  ;A5C482;
    INY                                                                  ;A5C483;
    INY                                                                  ;A5C484;
    RTL                                                                  ;A5C485;


MainAI_DraygonEye:
    LDX.W $0E54                                                          ;A5C486;
    JSR.W ($0FA8,X)                                                      ;A5C489;
    RTL                                                                  ;A5C48C;


Function_DraygonEye_FacingLeft:
    LDA.W $0FA4,X                                                        ;A5C48D;
    AND.W #$007F                                                         ;A5C490;
    BNE .nonZeroCounter                                                  ;A5C493;
    LDA.W $0FBA                                                          ;A5C495;
    SEC                                                                  ;A5C498;
    SBC.W #$0018                                                         ;A5C499;
    STA.B $12                                                            ;A5C49C;
    LDA.W $0FBE                                                          ;A5C49E;
    SEC                                                                  ;A5C4A1;
    SBC.W #$0020                                                         ;A5C4A2;
    STA.B $14                                                            ;A5C4A5;
    LDA.W #$0018                                                         ;A5C4A7;
    LDY.W #EnemyProjectile_MiscDust                                      ;A5C4AA;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A5C4AD;

.nonZeroCounter:
    LDX.W $0E54                                                          ;A5C4B1;
    LDA.W $0F7A                                                          ;A5C4B4;
    SEC                                                                  ;A5C4B7;
    SBC.W #$0018                                                         ;A5C4B8;
    STA.B $12                                                            ;A5C4BB;
    LDA.W $0AF6                                                          ;A5C4BD;
    SEC                                                                  ;A5C4C0;
    SBC.B $12                                                            ;A5C4C1;
    STA.B $12                                                            ;A5C4C3;
    LDA.W $0F7E                                                          ;A5C4C5;
    SEC                                                                  ;A5C4C8;
    SBC.W #$0020                                                         ;A5C4C9;
    STA.B $14                                                            ;A5C4CC;
    LDA.W $0AFA                                                          ;A5C4CE;
    SEC                                                                  ;A5C4D1;
    SBC.B $14                                                            ;A5C4D2;
    STA.B $14                                                            ;A5C4D4;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A5C4D6;
    CMP.W $0FB2,X                                                        ;A5C4DA;
    BEQ .return                                                          ;A5C4DD;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingUp                      ;A5C4DF;
    CMP.W #$0020                                                         ;A5C4E2;
    BMI .directionChosen                                                 ;A5C4E5;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingRight                   ;A5C4E7;
    CMP.W #$0060                                                         ;A5C4EA;
    BMI .directionChosen                                                 ;A5C4ED;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingDown                    ;A5C4EF;
    CMP.W #$00A0                                                         ;A5C4F2;
    BMI .directionChosen                                                 ;A5C4F5;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingLeft                    ;A5C4F7;
    CMP.W #$00E0                                                         ;A5C4FA;
    BMI .directionChosen                                                 ;A5C4FD;
    LDY.W #InstList_DraygonEye_FacingLeft_LookingUp                      ;A5C4FF;

.directionChosen:
    STA.W $0FB2,X                                                        ;A5C502;
    TYA                                                                  ;A5C505;
    STA.W $0F92,X                                                        ;A5C506;
    LDA.W #$0001                                                         ;A5C509;
    STA.W $0F94,X                                                        ;A5C50C;
    STZ.W $0F90,X                                                        ;A5C50F;

.return:
    RTS                                                                  ;A5C512;


Function_DraygonEye_FacingRight:
    LDA.W $0FA4,X                                                        ;A5C513;
    AND.W #$007F                                                         ;A5C516;
    BNE .nonZeroCounter                                                  ;A5C519;
    LDA.W $0F7A                                                          ;A5C51B;
    CLC                                                                  ;A5C51E;
    ADC.W #$0018                                                         ;A5C51F;
    STA.B $12                                                            ;A5C522;
    LDA.W $0F7E                                                          ;A5C524;
    SEC                                                                  ;A5C527;
    SBC.W #$0020                                                         ;A5C528;
    STA.B $14                                                            ;A5C52B;
    LDA.W #$0018                                                         ;A5C52D;
    LDY.W #EnemyProjectile_MiscDust                                      ;A5C530;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A5C533;

.nonZeroCounter:
    LDX.W $0E54                                                          ;A5C537;
    LDA.W $0F7A                                                          ;A5C53A;
    CLC                                                                  ;A5C53D;
    ADC.W #$0018                                                         ;A5C53E;
    STA.B $12                                                            ;A5C541;
    LDA.W $0AF6                                                          ;A5C543;
    SEC                                                                  ;A5C546;
    SBC.B $12                                                            ;A5C547;
    STA.B $12                                                            ;A5C549;
    LDA.W $0F7E                                                          ;A5C54B;
    SEC                                                                  ;A5C54E;
    SBC.W #$0020                                                         ;A5C54F;
    STA.B $14                                                            ;A5C552;
    LDA.W $0AFA                                                          ;A5C554;
    SEC                                                                  ;A5C557;
    SBC.B $14                                                            ;A5C558;
    STA.B $14                                                            ;A5C55A;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A5C55C;
    CMP.W $0FB2,X                                                        ;A5C560;
    BEQ .return                                                          ;A5C563;
    LDY.W #InstList_DraygonEye_FacingRight_LookingUp                     ;A5C565;
    CMP.W #$0020                                                         ;A5C568;
    BMI .directionChosen                                                 ;A5C56B;
    LDY.W #InstList_DraygonEye_FacingRight_LookingRight                  ;A5C56D;
    CMP.W #$0060                                                         ;A5C570;
    BMI .directionChosen                                                 ;A5C573;
    LDY.W #InstList_DraygonEye_FacingRight_LookingDown                   ;A5C575;
    CMP.W #$00A0                                                         ;A5C578;
    BMI .directionChosen                                                 ;A5C57B;
    LDY.W #InstList_DraygonEye_FacingRight_LookingLeft                   ;A5C57D;
    CMP.W #$00E0                                                         ;A5C580;
    BMI .directionChosen                                                 ;A5C583;
    LDY.W #InstList_DraygonEye_FacingRight_LookingUp                     ;A5C585;

.directionChosen:
    STA.W $0FB2,X                                                        ;A5C588;
    TYA                                                                  ;A5C58B;
    STA.W $0F92,X                                                        ;A5C58C;
    LDA.W #$0001                                                         ;A5C58F;
    STA.W $0F94,X                                                        ;A5C592;
    STZ.W $0F90,X                                                        ;A5C595;

.return:
    RTS                                                                  ;A5C598;


InitAI_DraygonTail:
    LDX.W $0E54                                                          ;A5C599;
    LDA.W #InstList_DraygonTail_FacingLeft_FakeTailWhip                  ;A5C59C;
    STA.W $0F92,X                                                        ;A5C59F;
    LDA.W #$0700                                                         ;A5C5A2;
    ASL A                                                                ;A5C5A5;
    STA.W $0F96,X                                                        ;A5C5A6;
    RTL                                                                  ;A5C5A9;


RTL_A5C5AA:
    RTL                                                                  ;A5C5AA;


RTL_A5C5AB:
    RTL                                                                  ;A5C5AB;


RTL_A5C5AC:
    RTL                                                                  ;A5C5AC;


InitAI_DraygonArms:
    LDX.W $0E54                                                          ;A5C5AD;
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0                        ;A5C5B0;
    STA.W $0F92,X                                                        ;A5C5B3;
    LDA.W #$0700                                                         ;A5C5B6;
    ASL A                                                                ;A5C5B9;
    STA.W $0F96,X                                                        ;A5C5BA;
    LDA.W #$0002                                                         ;A5C5BD;
    STA.W $0F9A,X                                                        ;A5C5C0;
    RTL                                                                  ;A5C5C3;


RTL_A5C5C4:
    RTL                                                                  ;A5C5C4;


RTL_A5C5C5:
    RTL                                                                  ;A5C5C5;


RTL_A5C5C6:
    RTL                                                                  ;A5C5C6;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DraygonFightIntroDanceData_KeikoLove_A5C5C7:
    db $01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00   ;A5C5C7;
    db $01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$00,$FF,$01,$00,$01,$FF   ;A5C5D7;
    db $01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF   ;A5C5E7;
    db $01,$00,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF   ;A5C5F7;
    db $00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE   ;A5C607;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$FF,$FF,$00,$FF,$00,$FF   ;A5C617;
    db $00,$FE,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF   ;A5C627;
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF   ;A5C637;
    db $FF,$00,$FF,$00,$FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01   ;A5C647;
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01   ;A5C657;
    db $00,$01,$00,$02,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01   ;A5C667;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01   ;A5C677;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5C687;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5C697;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01   ;A5C6A7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01   ;A5C6B7;
    db $00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01   ;A5C6C7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5C6D7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$FF,$01,$FF,$00,$FF   ;A5C6E7;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF   ;A5C6F7;
    db $00,$FE,$00,$FF,$00,$FF,$01,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FF   ;A5C707;
    db $00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FF   ;A5C717;
    db $00,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF   ;A5C727;
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00   ;A5C737;
    db $01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$01,$00,$01,$01,$01   ;A5C747;
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$02,$00,$01,$00,$01   ;A5C757;
    db $FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01   ;A5C767;
    db $FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00   ;A5C777;
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$01   ;A5C787;
    db $01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$00   ;A5C797;
    db $01,$01,$01,$01,$01,$01,$02,$01,$01,$00,$00,$01,$01,$00,$01,$01   ;A5C7A7;
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5C7B7;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00   ;A5C7C7;
    db $01,$00,$02,$FF,$01,$00,$02,$00,$01,$00,$02,$FF,$01,$00,$02,$00   ;A5C7D7;
    db $01,$FF,$02,$00,$01,$00,$01,$FF,$02,$00,$01,$FF,$01,$00,$01,$FF   ;A5C7E7;
    db $02,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$FF   ;A5C7F7;
    db $01,$FF,$01,$FE,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$00,$FE,$01,$FF   ;A5C807;
    db $00,$FE,$00,$FF,$01,$FF,$00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FF   ;A5C817;
    db $00,$FE,$00,$FF,$00,$FE,$FF,$FE,$00,$FF,$00,$FE,$FF,$FE,$00,$FF   ;A5C827;
    db $00,$FE,$FF,$FE,$FF,$FE,$00,$FF,$FF,$FE,$FF,$FE,$00,$FE,$FF,$FF   ;A5C837;
    db $FF,$FE,$FF,$FF,$FF,$FE,$FF,$FF,$00,$FF,$FF,$FE,$FF,$FF,$FF,$FF   ;A5C847;
    db $FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00   ;A5C857;
    db $FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$02,$FF,$01,$00,$01   ;A5C867;
    db $FF,$02,$FF,$01,$00,$02,$FF,$01,$FF,$02,$00,$02,$FF,$01,$00,$02   ;A5C877;
    db $00,$02,$FF,$02,$00,$01,$00,$02,$FF,$02,$00,$02,$00,$01,$00,$02   ;A5C887;
    db $00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$01,$02,$00,$01   ;A5C897;
    db $00,$01,$01,$02,$00,$01,$01,$02,$00,$01,$01,$01,$00,$01,$01,$02   ;A5C8A7;
    db $01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01   ;A5C8B7;
    db $01,$01,$01,$01,$02,$00,$01,$01,$01,$01,$01,$01,$02,$00,$01,$01   ;A5C8C7;
    db $01,$00,$02,$01,$01,$00,$01,$01,$02,$00,$01,$00,$02,$01,$01,$00   ;A5C8D7;
    db $02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00   ;A5C8E7;
    db $01,$00,$01,$00,$02,$00,$01,$FF,$01,$00,$02,$00,$01,$00,$01,$FF   ;A5C8F7;
    db $01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF   ;A5C907;
    db $00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$FE,$00,$FF,$00,$FF,$00,$FF   ;A5C917;
    db $00,$FE,$00,$FF,$00,$FE,$00,$FF,$00,$FE,$00,$FF,$00,$FE,$00,$FF   ;A5C927;
    db $00,$FE,$00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FE,$00,$FF,$00,$FE   ;A5C937;
    db $00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FF   ;A5C947;
    db $00,$FE,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FF,$01,$FF   ;A5C957;
    db $00,$FF,$00,$FF,$00,$FF,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5C967;
    db $00,$01,$00,$01,$00,$01,$01,$02,$00,$01,$00,$02,$00,$01,$00,$02   ;A5C977;
    db $00,$01,$00,$02,$FF,$01,$00,$02,$00,$02,$00,$02,$00,$01,$00,$02   ;A5C987;
    db $00,$02,$00,$01,$00,$02,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01   ;A5C997;
    db $00,$02,$FF,$01,$00,$02,$00,$01,$00,$02,$00,$01,$01,$01,$00,$01   ;A5C9A7;
    db $00,$02,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$01,$01   ;A5C9B7;
    db $01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$02,$00   ;A5C9C7;
    db $01,$01,$01,$00,$02,$00,$01,$01,$01,$FF,$01,$00,$00,$FF,$01,$00   ;A5C9D7;
    db $01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00   ;A5C9E7;
    db $01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF   ;A5C9F7;
    db $01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF   ;A5CA07;
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF   ;A5CA17;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;A5CA27;
    db $00,$FE,$FF,$FF,$00,$FF,$00,$FF,$00,$FE,$FF,$FF,$00,$FF,$00,$FF   ;A5CA37;
    db $FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF   ;A5CA47;
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$01,$00,$01   ;A5CA57;
    db $FF,$00,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01   ;A5CA67;
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01   ;A5CA77;
    db $FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5CA87;
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5CA97;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;A5CAA7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5CAB7;
    db $01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5CAC7;
    db $00,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01   ;A5CAD7;
    db $00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5CAE7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5CAF7;
    db $00,$01,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;A5CB07;
    db $00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$01,$FF   ;A5CB17;
    db $00,$FE,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF   ;A5CB27;
    db $00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF   ;A5CB37;
    db $01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00   ;A5CB47;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00   ;A5CB57;
    db $01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$00,$01   ;A5CB67;
    db $00,$01,$01,$02,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01   ;A5CB77;
    db $FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00   ;A5CB87;
    db $FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00   ;A5CB97;
    db $FF,$FF,$FF,$00,$FF,$FF,$00,$01,$01,$01,$01,$01,$01,$01,$00,$01   ;A5CBA7;
    db $01,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$02,$01   ;A5CBB7;
    db $01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$00   ;A5CBC7;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5CBD7;
    db $01,$00,$01,$00,$01,$00,$01,$FF,$01,$FF,$00,$FF,$01,$00,$01,$FF   ;A5CBE7;
    db $00,$FF,$01,$00,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$01,$FF   ;A5CBF7;
    db $01,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF   ;A5CC07;
    db $01,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF   ;A5CC17;
    db $01,$FE,$01,$FF,$00,$FF,$01,$FE,$00,$FF,$01,$FF,$00,$FF,$01,$FE   ;A5CC27;
    db $01,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FE   ;A5CC37;
    db $00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;A5CC47;
    db $00,$FF,$FF,$00,$00,$FF,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00   ;A5CC57;
    db $FF,$00,$00,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01   ;A5CC67;
    db $FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01   ;A5CC77;
    db $FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01   ;A5CC87;
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01   ;A5CC97;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5CCA7;
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01   ;A5CCB7;
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01   ;A5CCC7;
    db $01,$01,$00,$01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01   ;A5CCD7;
    db $01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$FF   ;A5CCE7;
    db $01,$00,$01,$FF,$01,$00,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$FF   ;A5CCF7;
    db $01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FE,$00,$FF   ;A5CD07;
    db $01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$00,$FF   ;A5CD17;
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF   ;A5CD27;
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF   ;A5CD37;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;A5CD47;
    db $00,$FF,$00,$FE,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF   ;A5CD57;
    db $FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00,$FF,$FF   ;A5CD67;
    db $FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01   ;A5CD77;
    db $FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$01,$FF,$02   ;A5CD87;
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$01,$01,$01,$00,$01,$01   ;A5CD97;
    db $01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5CDA7;
    db $01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00   ;A5CDB7;
    db $01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00   ;A5CDC7;
    db $01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF   ;A5CDD7;
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF   ;A5CDE7;
    db $01,$00,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00   ;A5CDF7;
endif ; !FEATURE_KEEP_UNREFERENCED

DraygonFightIntroDanceData_KeikoLove:
    db $03,$00,$03,$00,$03,$00,$02,$FF,$03,$00,$03,$FF,$03,$00,$02,$FF   ;A5CE07;
    db $03,$FF,$02,$FE,$02,$FF,$02,$FE,$02,$FE,$02,$FD,$02,$FE,$01,$FD   ;A5CE17;
    db $02,$FD,$01,$FE,$01,$FD,$02,$FE,$01,$FE,$00,$FE,$01,$FE,$01,$FF   ;A5CE27;
    db $01,$00,$00,$FF,$01,$00,$01,$01,$00,$01,$00,$01,$00,$02,$00,$02   ;A5CE37;
    db $00,$02,$00,$02,$00,$02,$00,$03,$FF,$03,$00,$03,$00,$03,$FF,$04   ;A5CE47;
    db $00,$03,$FF,$04,$00,$04,$FF,$04,$00,$04,$FF,$04,$FF,$04,$00,$05   ;A5CE57;
    db $FF,$04,$FF,$04,$00,$05,$FF,$04,$FF,$04,$FF,$05,$FF,$04,$00,$04   ;A5CE67;
    db $FF,$05,$FF,$04,$FF,$04,$FF,$04,$FF,$04,$00,$04,$FF,$03,$FF,$04   ;A5CE77;
    db $FF,$03,$00,$03,$FF,$03,$FF,$03,$FF,$03,$00,$02,$FF,$02,$FF,$02   ;A5CE87;
    db $00,$01,$FF,$02,$00,$01,$FF,$01,$FF,$00,$00,$FF,$00,$FF,$00,$FF   ;A5CE97;
    db $00,$FF,$00,$FE,$00,$FF,$00,$FD,$00,$FE,$00,$FE,$00,$FD,$00,$FD   ;A5CEA7;
    db $01,$FD,$00,$FD,$00,$FD,$01,$FD,$00,$FC,$01,$FD,$01,$FC,$00,$FD   ;A5CEB7;
    db $01,$FC,$01,$FD,$00,$FC,$01,$FC,$01,$FD,$01,$FC,$01,$FD,$01,$FC   ;A5CEC7;
    db $01,$FD,$01,$FD,$02,$FD,$01,$FD,$01,$FD,$02,$FD,$01,$FD,$01,$FE   ;A5CED7;
    db $02,$FE,$02,$FE,$01,$FD,$02,$FF,$02,$FE,$02,$FE,$01,$FE,$02,$FF   ;A5CEE7;
    db $02,$FE,$03,$FE,$02,$FF,$02,$FE,$03,$FE,$02,$FF,$03,$FE,$02,$FF   ;A5CEF7;
    db $03,$FE,$03,$FE,$03,$FE,$03,$FE,$03,$FE,$02,$FF,$03,$FE,$03,$FE   ;A5CF07;
    db $03,$FF,$03,$FE,$02,$FF,$03,$FF,$02,$FF,$03,$FF,$02,$00,$01,$FF   ;A5CF17;
    db $02,$00,$01,$01,$02,$00,$00,$01,$01,$01,$00,$02,$00,$02,$00,$02   ;A5CF27;
    db $00,$02,$FF,$02,$00,$03,$FF,$02,$FF,$03,$FE,$03,$FF,$03,$FF,$03   ;A5CF37;
    db $FE,$03,$FE,$03,$FE,$03,$FE,$04,$FE,$03,$FE,$03,$FE,$03,$FE,$02   ;A5CF47;
    db $FE,$03,$FD,$03,$FE,$02,$FE,$03,$FD,$02,$FE,$02,$FE,$01,$FD,$02   ;A5CF57;
    db $FE,$01,$FD,$02,$FE,$01,$FD,$01,$FD,$01,$FE,$00,$FD,$01,$FD,$00   ;A5CF67;
    db $FE,$00,$FD,$00,$FD,$FF,$FD,$00,$FD,$FF,$FD,$FF,$FD,$FF,$FD,$FE   ;A5CF77;
    db $FD,$FF,$FD,$FE,$FE,$FE,$FE,$FE,$FF,$FE,$00,$FF,$01,$FE,$01,$FE   ;A5CF87;
    db $02,$FE,$02,$FF,$03,$FE,$03,$FF,$04,$FF,$03,$FF,$03,$00,$03,$00   ;A5CF97;
    db $03,$00,$03,$01,$03,$00,$02,$01,$02,$02,$03,$01,$02,$02,$02,$02   ;A5CFA7;
    db $02,$02,$01,$02,$02,$02,$02,$03,$01,$03,$02,$02,$01,$03,$02,$03   ;A5CFB7;
    db $01,$03,$01,$03,$02,$03,$01,$03,$01,$02,$01,$03,$01,$03,$02,$03   ;A5CFC7;
    db $01,$03,$01,$02,$01,$03,$02,$03,$01,$02,$01,$03,$02,$02,$01,$02   ;A5CFD7;
    db $02,$02,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$01,$02,$02   ;A5CFE7;
    db $02,$01,$02,$01,$03,$01,$02,$01,$03,$01,$02,$01,$03,$00,$03,$01   ;A5CFF7;
    db $03,$01,$01,$FF,$02,$00,$01,$FF,$02,$00,$01,$FF,$02,$00,$01,$FF   ;A5D007;
    db $01,$00,$02,$FF,$01,$FF,$02,$00,$01,$FF,$02,$00,$01,$FF,$01,$FF   ;A5D017;
    db $02,$00,$01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$00,$02,$FF,$01,$FF   ;A5D027;
    db $01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$02,$FF   ;A5D037;
    db $01,$FF,$01,$FE,$01,$FF,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$01,$FF   ;A5D047;
    db $01,$FE,$00,$FF,$01,$FE,$01,$FF,$01,$FE,$00,$FF,$01,$FE,$01,$FF   ;A5D057;
    db $00,$FE,$01,$FF,$00,$FE,$00,$FF,$01,$FE,$00,$FE,$00,$FF,$00,$FE   ;A5D067;
    db $00,$FF,$00,$FE,$00,$FE,$00,$FF,$00,$FE,$00,$FF,$FF,$FE,$00,$FE   ;A5D077;
    db $00,$FF,$FF,$FE,$FF,$FE,$00,$FF,$FF,$FE,$FF,$FF,$FF,$FE,$FF,$FF   ;A5D087;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FF,$00,$FF,$00,$FE,$00   ;A5D097;
    db $FF,$00,$FF,$00,$FE,$01,$FF,$00,$FE,$01,$FF,$01,$FE,$01,$FF,$01   ;A5D0A7;
    db $FF,$01,$FE,$01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$FF,$02,$FF,$01   ;A5D0B7;
    db $FF,$01,$00,$02,$FF,$01,$FF,$02,$00,$01,$FF,$01,$00,$02,$00,$01   ;A5D0C7;
    db $FF,$02,$00,$01,$00,$02,$00,$01,$00,$02,$FF,$01,$00,$02,$00,$02   ;A5D0D7;
    db $00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02   ;A5D0E7;
    db $00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$01,$01,$00,$02   ;A5D0F7;
    db $00,$01,$01,$02,$00,$01,$01,$01,$00,$02,$01,$01,$01,$01,$00,$01   ;A5D107;
    db $01,$01,$01,$02,$02,$00,$01,$01,$01,$01,$01,$01,$02,$01,$01,$00   ;A5D117;
    db $02,$01,$01,$00,$02,$01,$01,$00,$02,$01,$01,$00,$02,$00,$02,$01   ;A5D127;
    db $01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$00   ;A5D137;
    db $02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$01,$00,$02,$FF   ;A5D147;
    db $01,$00,$02,$00,$01,$FF,$01,$00,$02,$FF,$01,$00,$01,$00,$02,$FF   ;A5D157;
    db $01,$00,$01,$FF,$01,$FF,$01,$00,$02,$FF,$01,$00,$01,$FF,$01,$FF   ;A5D167;
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF   ;A5D177;
    db $01,$FE,$00,$FF,$01,$FF,$00,$FF,$01,$FE,$01,$FF,$00,$FE,$01,$FF   ;A5D187;
    db $00,$FE,$01,$FF,$00,$FE,$01,$FE,$00,$FF,$01,$FE,$00,$FE,$01,$FE   ;A5D197;
    db $01,$FE,$00,$FE,$01,$FE,$00,$FF,$01,$FE,$00,$FE,$01,$FE,$00,$FE   ;A5D1A7;
    db $01,$FE,$00,$FE,$01,$FE,$00,$FE,$01,$FE,$00,$FE,$00,$FE,$01,$FF   ;A5D1B7;
    db $00,$FE,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$00,$FE,$01,$FF,$00,$FF   ;A5D1C7;
    db $00,$FE,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00   ;A5D1D7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D1E7;
    db $00,$02,$00,$01,$00,$02,$FF,$01,$00,$02,$00,$02,$00,$01,$00,$02   ;A5D1F7;
    db $00,$02,$FF,$01,$00,$02,$00,$02,$00,$01,$FF,$02,$00,$02,$00,$01   ;A5D207;
    db $00,$02,$FF,$01,$00,$02,$00,$01,$00,$02,$FF,$01,$00,$01,$00,$02   ;A5D217;
    db $00,$01,$00,$01,$00,$02,$FF,$01,$00,$01,$00,$02,$00,$01,$00,$01   ;A5D227;
    db $00,$02,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$01,$02   ;A5D237;
    db $00,$01,$00,$01,$01,$01,$00,$02,$00,$01,$01,$01,$00,$02,$01,$01   ;A5D247;
    db $00,$01,$01,$01,$01,$02,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01   ;A5D257;
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$02,$01,$01,$01,$01,$00   ;A5D267;
    db $01,$01,$02,$00,$01,$00,$01,$01,$02,$00,$01,$00,$02,$00,$01,$01   ;A5D277;
    db $01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$02,$FF   ;A5D287;
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF   ;A5D297;
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF   ;A5D2A7;
    db $01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FE,$01,$FF,$01,$FF   ;A5D2B7;
    db $01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF   ;A5D2C7;
    db $00,$FF,$01,$FF,$01,$FF,$00,$FE,$01,$FF,$01,$FF,$00,$FF,$01,$FF   ;A5D2D7;
    db $00,$FF,$01,$FE,$01,$FF,$00,$FF,$01,$FF,$00,$FE,$01,$FF,$00,$FF   ;A5D2E7;
    db $01,$FE,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$01,$FE,$00,$FF,$00,$FE   ;A5D2F7;
    db $01,$FE,$00,$FF,$01,$FE,$00,$FF,$00,$FE,$00,$FE,$01,$FE,$00,$FF   ;A5D307;
    db $00,$FE,$01,$FE,$00,$FE,$00,$FE,$00,$FE,$01,$FE,$00,$FE,$00,$FE   ;A5D317;
    db $00,$FE,$00,$FE,$00,$FE,$01,$FE,$00,$FE,$00,$FE,$00,$FE,$00,$FE   ;A5D327;
    db $00,$FE,$00,$FE,$00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FF,$00,$FE   ;A5D337;
    db $00,$FF,$00,$FE,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF   ;A5D347;
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01   ;A5D357;
    db $FF,$01,$00,$01,$FF,$01,$FF,$01,$00,$02,$FF,$01,$FF,$02,$00,$01   ;A5D367;
    db $FF,$02,$00,$02,$FF,$01,$FF,$02,$00,$02,$FF,$02,$FF,$01,$00,$02   ;A5D377;
    db $FF,$02,$00,$02,$FF,$01,$00,$02,$00,$02,$FF,$01,$00,$02,$FF,$01   ;A5D387;
    db $00,$02,$00,$02,$00,$01,$FF,$02,$00,$01,$00,$02,$00,$01,$00,$02   ;A5D397;
    db $FF,$01,$00,$02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01   ;A5D3A7;
    db $00,$01,$00,$02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$02   ;A5D3B7;
    db $00,$01,$00,$01,$01,$01,$00,$02,$00,$01,$00,$01,$00,$02,$00,$01   ;A5D3C7;
    db $00,$01,$00,$02,$00,$01,$00,$01,$00,$02,$01,$01,$00,$01,$00,$02   ;A5D3D7;
    db $00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$02   ;A5D3E7;
    db $00,$01,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01   ;A5D3F7;
    db $00,$02,$00,$01,$00,$02,$FF,$02,$00,$01,$00,$02,$00,$02,$00,$01   ;A5D407;
    db $FF,$02,$00,$02,$00,$01,$00,$02,$FF,$01,$00,$01,$00,$01,$00,$01   ;A5D417;
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF   ;A5D427;
    db $00,$FE,$00,$FF,$00,$FE,$01,$FE,$00,$FE,$00,$FE,$00,$FE,$00,$FE   ;A5D437;
    db $01,$FE,$00,$FE,$00,$FD,$01,$FE,$00,$FE,$01,$FE,$00,$FE,$01,$FE   ;A5D447;
    db $00,$FD,$01,$FE,$01,$FE,$00,$FE,$01,$FE,$01,$FE,$00,$FF,$01,$FE   ;A5D457;
    db $01,$FE,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$01,$FF,$01,$FF,$01,$FF   ;A5D467;
    db $01,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00   ;A5D477;
    db $02,$01,$01,$00,$01,$01,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01   ;A5D487;
    db $02,$01,$01,$01,$01,$01,$00,$02,$01,$01,$01,$01,$01,$02,$00,$01   ;A5D497;
    db $01,$02,$00,$01,$00,$02,$01,$01,$00,$02,$00,$01,$00,$02,$00,$01   ;A5D4A7;
    db $00,$02,$FF,$01,$00,$02,$00,$01,$FF,$02,$00,$01,$FF,$01,$FF,$02   ;A5D4B7;
    db $FF,$01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FE,$01   ;A5D4C7;
    db $FF,$00,$FF,$00,$FE,$00,$FF,$00,$FE,$FF,$FF,$FF,$FE,$00,$FF,$FF   ;A5D4D7;
    db $FF,$FF,$FF,$FF,$FF,$00,$FF,$00,$00,$01,$00,$02,$01,$01,$00,$01   ;A5D4E7;
    db $01,$02,$01,$02,$01,$02,$01,$01,$01,$02,$02,$02,$01,$01,$01,$01   ;A5D4F7;
    db $02,$01,$01,$01,$01,$01,$02,$01,$01,$00,$02,$00,$01,$00,$01,$01   ;A5D507;
    db $02,$00,$01,$00,$02,$FF,$01,$00,$02,$00,$01,$00,$01,$00,$02,$FF   ;A5D517;
    db $01,$00,$02,$00,$01,$FF,$01,$00,$02,$00,$01,$FF,$02,$00,$02,$FF   ;A5D527;
    db $01,$FE,$02,$FF,$02,$FF,$02,$FF,$01,$FE,$02,$FF,$02,$FE,$01,$FE   ;A5D537;
    db $02,$FF,$02,$FE,$01,$FE,$02,$FE,$02,$FE,$01,$FD,$02,$FE,$01,$FD   ;A5D547;
    db $02,$FE,$01,$FD,$02,$FD,$01,$FE,$02,$FD,$01,$FD,$01,$FD,$02,$FD   ;A5D557;
    db $01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FE   ;A5D567;
    db $00,$FD,$01,$FE,$01,$FD,$00,$FE,$01,$FD,$00,$FE,$00,$FE,$01,$FF   ;A5D577;
    db $00,$FE,$00,$FF,$00,$FE,$FF,$FF,$00,$FF,$FF,$FF,$FF,$00,$FF,$00   ;A5D587;
    db $00,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$01,$FF,$02,$FF,$02,$FF,$02   ;A5D597;
    db $FE,$02,$FF,$02,$FF,$02,$FF,$03,$FF,$03,$FE,$02,$FF,$03,$FF,$03   ;A5D5A7;
    db $00,$03,$FF,$03,$FF,$03,$00,$03,$FF,$03,$00,$03,$00,$03,$00,$03   ;A5D5B7;
    db $00,$03,$00,$03,$00,$03,$01,$03,$00,$03,$01,$03,$00,$03,$01,$02   ;A5D5C7;
    db $01,$03,$01,$02,$01,$02,$01,$03,$01,$02,$01,$01,$01,$02,$01,$02   ;A5D5D7;
    db $02,$01,$01,$01,$01,$01,$02,$01,$01,$01,$01,$00,$02,$00,$01,$00   ;A5D5E7;
    db $02,$00,$01,$FF,$02,$FF,$02,$FF,$01,$FF,$02,$FF,$01,$FE,$02,$FF   ;A5D5F7;
    db $01,$FE,$02,$FE,$01,$FE,$02,$FE,$01,$FD,$01,$FE,$02,$FD,$01,$FE   ;A5D607;
    db $01,$FD,$02,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD   ;A5D617;
    db $01,$FD,$00,$FD,$01,$FD,$01,$FC,$00,$FD,$00,$FD,$01,$FE,$00,$FD   ;A5D627;
    db $00,$FD,$00,$FD,$FF,$FE,$00,$FD,$FF,$FE,$00,$FE,$FF,$FE,$FF,$FE   ;A5D637;
    db $FF,$FE,$FE,$FE,$FF,$FF,$FE,$FF,$FE,$FF,$FE,$00,$FE,$FF,$FD,$00   ;A5D647;
    db $FD,$00,$FE,$00,$FD,$01,$FD,$01,$FE,$01,$FE,$01,$FE,$01,$FF,$01   ;A5D657;
    db $FF,$02,$00,$01,$01,$02,$01,$02,$02,$01,$02,$02,$02,$01,$03,$02   ;A5D667;
    db $02,$01,$03,$01,$03,$00,$02,$01,$03,$00,$02,$00,$02,$00,$03,$00   ;A5D677;
    db $02,$00,$02,$FF,$02,$00,$02,$FF,$02,$00,$03,$FF,$01,$00,$01,$00   ;A5D687;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00   ;A5D697;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5D6A7;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5D6B7;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00   ;A5D6C7;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00   ;A5D6D7;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00   ;A5D6E7;
    db $01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00   ;A5D6F7;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00   ;A5D707;
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$00   ;A5D717;
    db $01,$FF,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$FF   ;A5D727;
    db $01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$00,$01,$FF   ;A5D737;
    db $00,$FF,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$00,$01,$FF   ;A5D747;
    db $01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF   ;A5D757;
    db $01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF   ;A5D767;
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;A5D777;
    db $00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF   ;A5D787;
    db $FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00   ;A5D797;
    db $FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01   ;A5D7A7;
    db $00,$01,$FF,$01,$00,$01,$FF,$01,$00,$02,$00,$01,$FF,$01,$00,$01   ;A5D7B7;
    db $00,$01,$00,$01,$FF,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D7C7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01   ;A5D7D7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D7E7;
    db $01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D7F7;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01   ;A5D807;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D817;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D827;
    db $FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D837;
    db $00,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D847;
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01   ;A5D857;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D867;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D877;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D887;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01   ;A5D897;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01   ;A5D8A7;
    db $00,$01,$00,$01,$00,$01,$FF,$01,$00,$02,$00,$01,$00,$01,$FF,$01   ;A5D8B7;
    db $00,$01,$00,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$01,$FF,$00   ;A5D8C7;
    db $FF,$01,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00   ;A5D8D7;
    db $FF,$00,$FF,$FF,$FE,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF   ;A5D8E7;
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF   ;A5D8F7;
    db $00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00   ;A5D907;
    db $01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$00,$01,$00,$01,$FF   ;A5D917;
    db $01,$00,$01,$00,$01,$00,$01,$FF,$02,$00,$01,$00,$01,$00,$01,$00   ;A5D927;
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00   ;A5D937;
    db $01,$00,$01,$01,$01,$00,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01   ;A5D947;
    db $01,$01,$01,$01,$01,$00,$00,$01,$01,$01,$01,$00,$01,$01,$00,$01   ;A5D957;
    db $01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$01,$01   ;A5D967;
    db $00,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00   ;A5D977;
    db $01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00   ;A5D987;
    db $01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5D997;
    db $01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00   ;A5D9A7;
    db $02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FE,$00,$FF,$01,$FE   ;A5D9B7;
    db $00,$FF,$01,$FE,$01,$FF,$00,$FE,$01,$FF,$00,$FE,$01,$FF,$00,$FE   ;A5D9C7;
    db $01,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$01,$FF,$00,$FE,$01,$FF   ;A5D9D7;
    db $00,$FE,$01,$FF,$00,$FF,$01,$FE,$00,$FF,$01,$FF,$00,$FF,$00,$FF   ;A5D9E7;
    db $01,$FE,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF   ;A5D9F7;
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF   ;A5DA07;
    db $00,$FF,$00,$FF,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00   ;A5DA17;
    db $00,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$00,$FF,$01   ;A5DA27;
    db $00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$02,$00,$01,$FF,$01   ;A5DA37;
    db $00,$01,$FF,$01,$00,$01,$00,$02,$FF,$01,$00,$01,$00,$01,$00,$02   ;A5DA47;
    db $00,$01,$FF,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01   ;A5DA57;
    db $00,$01,$01,$01,$00,$02,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01   ;A5DA67;
    db $00,$02,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01   ;A5DA77;
    db $01,$01,$01,$01,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5DA87;
    db $00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$FF,$01,$00,$00,$FF   ;A5DA97;
    db $01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF   ;A5DAA7;
    db $00,$FF,$01,$FF,$00,$FF,$01,$FE,$00,$FF,$00,$FF,$01,$FE,$00,$FF   ;A5DAB7;
    db $01,$FF,$00,$FE,$00,$FF,$01,$FE,$00,$FF,$00,$FF,$00,$FE,$00,$FF   ;A5DAC7;
    db $01,$FE,$00,$FF,$00,$FE,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FE   ;A5DAD7;
    db $00,$FF,$FF,$FF,$00,$FE,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF   ;A5DAE7;
    db $FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00   ;A5DAF7;
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$01   ;A5DB07;
    db $FF,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$01,$00   ;A5DB17;
    db $00,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00   ;A5DB27;
    db $01,$00,$02,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5DB37;
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF   ;A5DB47;
    db $01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF   ;A5DB57;
    db $01,$FF,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$01   ;A5DB67;
    db $00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01   ;A5DB77;
    db $00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01   ;A5DB87;
    db $00,$02,$00,$01,$FF,$02,$00,$01,$00,$02,$00,$01,$00,$02,$FF,$01   ;A5DB97;
    db $00,$01,$00,$02,$00,$01,$FF,$01,$00,$01,$00,$02,$00,$01,$00,$01   ;A5DBA7;
    db $FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01   ;A5DBB7;
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00,$01,$00,$01,$00   ;A5DBC7;
    db $01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF   ;A5DBD7;
    db $01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF   ;A5DBE7;
    db $00,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FE,$00,$FF,$01,$FF,$01,$FF   ;A5DBF7;
    db $00,$FE,$01,$FF,$01,$FF,$00,$FE,$01,$FF,$00,$FF,$01,$FE,$00,$FF   ;A5DC07;
    db $00,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$00,$FF,$01,$FE,$00,$FF   ;A5DC17;
    db $00,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF   ;A5DC27;
    db $00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$01,$00,$01   ;A5DC37;
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01   ;A5DC47;
    db $00,$01,$00,$01,$00,$01,$00,$02,$01,$01,$00,$01,$00,$01,$00,$02   ;A5DC57;
    db $01,$01,$00,$01,$00,$01,$01,$02,$00,$01,$00,$01,$01,$01,$00,$01   ;A5DC67;
    db $01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$00,$01,$01,$00   ;A5DC77;
    db $01,$01,$00,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$00,$01   ;A5DC87;
    db $01,$00,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01   ;A5DC97;
    db $01,$01,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01   ;A5DCA7;
    db $01,$00,$01,$01,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00   ;A5DCB7;
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00   ;A5DCC7;
    db $01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF   ;A5DCD7;
    db $00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF   ;A5DCE7;
    db $00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE   ;A5DCF7;
    db $00,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FF,$00,$FE   ;A5DD07;
    db $FF,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$FF,$FF,$00,$FE,$00,$FF   ;A5DD17;
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF   ;A5DD27;
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF   ;A5DD37;
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00   ;A5DD47;
    db $FF,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01,$00,$01   ;A5DD57;
    db $FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01   ;A5DD67;
    db $00,$01,$00,$02,$FF,$01,$00,$01,$00,$01,$00,$02,$00,$01,$FF,$01   ;A5DD77;
    db $00,$02,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$02   ;A5DD87;
    db $00,$01,$00,$01,$00,$01,$01,$01,$00,$02,$00,$01,$00,$01,$01,$01   ;A5DD97;
    db $00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01   ;A5DDA7;
    db $01,$01,$01,$00,$00,$01,$01,$01,$80,$80,$80,$80,$80,$80,$80,$80   ;A5DDB7;

DraygonFightIntroDanceData_KeikoLove_EvirsAlreadyDeleted:
    db $01,$FF,$02,$FE,$01,$FF,$02,$FE,$01,$FF,$01,$FE,$02,$FF,$01,$FE   ;A5DDC7;
    db $02,$FF,$01,$FE,$01,$FF,$02,$FE,$01,$FE,$01,$FF,$02,$FE,$01,$FE   ;A5DDD7;
    db $01,$FF,$02,$FE,$01,$FE,$01,$FE,$01,$FE,$02,$FF,$01,$FE,$01,$FE   ;A5DDE7;
    db $01,$FD,$02,$FE,$01,$FE,$01,$FE,$01,$FE,$01,$FD,$01,$FE,$01,$FE   ;A5DDF7;
    db $01,$FD,$01,$FD,$01,$FE,$01,$FD,$01,$FD,$01,$FE,$01,$FD,$01,$FD   ;A5DE07;
    db $01,$FD,$00,$FE,$01,$FD,$01,$FE,$00,$FD,$00,$FE,$01,$FE,$00,$FE   ;A5DE17;
    db $00,$FF,$00,$FE,$FF,$FF,$00,$FF,$FF,$FF,$FF,$00,$FF,$00,$FF,$01   ;A5DE27;
    db $FF,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$02,$FF,$01,$FE,$02,$FF,$02   ;A5DE37;
    db $FE,$03,$FF,$02,$FE,$02,$FF,$03,$FE,$03,$FF,$03,$FE,$02,$FF,$03   ;A5DE47;
    db $FF,$03,$FF,$03,$FF,$04,$FF,$03,$FF,$03,$FF,$03,$FF,$03,$00,$03   ;A5DE57;
    db $00,$03,$FF,$03,$00,$03,$00,$03,$00,$03,$01,$03,$00,$03,$00,$02   ;A5DE67;
    db $01,$03,$01,$03,$00,$02,$01,$02,$01,$03,$01,$02,$01,$02,$01,$02   ;A5DE77;
    db $01,$02,$02,$01,$01,$02,$01,$01,$02,$01,$01,$01,$02,$01,$01,$01   ;A5DE87;
    db $02,$01,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$FF,$02,$00   ;A5DE97;
    db $01,$FF,$02,$FF,$02,$FF,$02,$FE,$01,$FF,$02,$FE,$02,$FF,$01,$FE   ;A5DEA7;
    db $02,$FE,$01,$FE,$02,$FE,$01,$FD,$02,$FE,$01,$FE,$01,$FD,$01,$FD   ;A5DEB7;
    db $01,$FE,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$00,$FD,$01,$FD,$00,$FD   ;A5DEC7;
    db $00,$FC,$01,$FD,$00,$FD,$FF,$FD,$00,$FD,$00,$FC,$00,$FD,$FF,$FD   ;A5DED7;
    db $00,$FD,$FF,$FD,$FF,$FD,$FF,$FD,$00,$FE,$FF,$FD,$FF,$FE,$FF,$FD   ;A5DEE7;
    db $FE,$FE,$FF,$FE,$FF,$FE,$FF,$FF,$FE,$FE,$FF,$FF,$FF,$FF,$FE,$00   ;A5DEF7;
    db $FF,$FF,$FE,$00,$FF,$00,$FE,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$01   ;A5DF07;
    db $FE,$02,$FF,$02,$FF,$02,$FE,$02,$FF,$03,$FF,$02,$00,$03,$FF,$02   ;A5DF17;
    db $FF,$02,$00,$03,$00,$02,$00,$02,$00,$03,$00,$02,$01,$02,$01,$02   ;A5DF27;
    db $01,$02,$00,$02,$02,$02,$01,$01,$01,$02,$01,$02,$02,$02,$02,$01   ;A5DF37;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DraygonFightIntroDanceData_KeikoLove_A5DF47:
    db $01,$02,$02,$02,$02,$01,$01,$02,$02,$02,$02,$01,$02,$02,$02,$01   ;A5DF47;
    db $02,$02,$02,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$02   ;A5DF57;
    db $01,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02,$01,$01,$02,$02,$02   ;A5DF67;
    db $01,$02,$02,$01,$01,$02,$02,$02,$01,$01,$02,$01,$02,$02,$02,$01   ;A5DF77;
    db $01,$01,$02,$01,$02,$01,$02,$01,$03,$01,$02,$00,$02,$01,$00,$FF   ;A5DF87;
    db $00,$FE,$00,$FF,$01,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$01,$FE   ;A5DF97;
    db $00,$FF,$00,$FF,$00,$FE,$00,$FF,$01,$FF,$00,$FE,$00,$FF,$00,$FF   ;A5DFA7;
    db $01,$FE,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FE   ;A5DFB7;
    db $00,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$01,$FE   ;A5DFC7;
    db $01,$FE,$00,$FF,$01,$FE,$00,$FF,$01,$FE,$01,$FE,$01,$FE,$01,$FF   ;A5DFD7;
    db $00,$FE,$01,$FE,$01,$FE,$01,$FF,$01,$FE,$01,$FE,$01,$FE,$01,$FE   ;A5DFE7;
    db $01,$FE,$01,$FE,$01,$FF,$02,$FE,$01,$FF,$01,$FF,$01,$FF,$01,$FF   ;A5DFF7;
    db $01,$00,$01,$00,$01,$01,$01,$01,$00,$01,$01,$02,$00,$01,$00,$02   ;A5E007;
    db $01,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02   ;A5E017;
    db $00,$01,$00,$02,$FF,$02,$00,$01,$00,$02,$00,$01,$FF,$02,$00,$01   ;A5E027;
    db $00,$02,$00,$01,$FF,$01,$00,$02,$00,$01,$FF,$02,$00,$01,$00,$01   ;A5E037;
    db $FF,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01   ;A5E047;
    db $00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$01,$02,$00,$02,$01,$02   ;A5E057;
    db $00,$01,$01,$02,$00,$02,$01,$02,$01,$01,$00,$02,$01,$01,$01,$02   ;A5E067;
    db $01,$01,$00,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00   ;A5E077;
    db $01,$00,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$FE,$00,$FF,$01,$FF   ;A5E087;
    db $01,$FE,$01,$FF,$01,$FE,$00,$FE,$01,$FE,$01,$FE,$01,$FE,$00,$FE   ;A5E097;
    db $01,$FD,$00,$FE,$01,$FE,$01,$FD,$00,$FE,$01,$FD,$00,$FE,$00,$FE   ;A5E0A7;
    db $01,$FD,$00,$FE,$01,$FD,$00,$FE,$00,$FD,$01,$FE,$00,$FE,$00,$FD   ;A5E0B7;
    db $00,$FE,$01,$FE,$00,$FE,$00,$FE,$00,$FE,$01,$FE,$00,$FE,$00,$FF   ;A5E0C7;
    db $00,$FE,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF   ;A5E0D7;
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$01,$02   ;A5E0E7;
    db $00,$01,$01,$02,$00,$01,$00,$02,$01,$02,$00,$02,$00,$01,$01,$02   ;A5E0F7;
    db $00,$02,$00,$01,$01,$02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02   ;A5E107;
    db $01,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$01,$02   ;A5E117;
    db $00,$01,$00,$02,$00,$01,$00,$02,$01,$01,$00,$02,$00,$01,$01,$02   ;A5E127;
    db $00,$01,$00,$02,$01,$01,$00,$02,$01,$01,$00,$02,$01,$01,$01,$02   ;A5E137;
    db $00,$01,$01,$01,$01,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01   ;A5E147;
    db $02,$01,$01,$01,$01,$01,$01,$01,$02,$00,$01,$01,$02,$01,$01,$01   ;A5E157;
    db $02,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00   ;A5E167;
    db $02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$FF   ;A5E177;
    db $02,$00,$01,$00,$02,$FF,$01,$00,$02,$FF,$01,$00,$01,$FF,$02,$FF   ;A5E187;
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$FF   ;A5E197;
    db $01,$FF,$01,$FE,$01,$FF,$01,$FF,$00,$FE,$01,$FF,$01,$FE,$01,$FF   ;A5E1A7;
    db $01,$FE,$01,$FF,$01,$FE,$01,$FF,$01,$FE,$00,$FF,$01,$FE,$01,$FF   ;A5E1B7;
    db $01,$FE,$01,$FF,$01,$FE,$01,$FF,$01,$FE,$00,$FF,$01,$FE,$01,$FF   ;A5E1C7;
    db $01,$FE,$01,$FF,$00,$FE,$01,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF   ;A5E1D7;
    db $01,$FE,$00,$FF,$00,$FE,$01,$FF,$00,$FE,$00,$FE,$00,$FF,$00,$FE   ;A5E1E7;
    db $00,$FF,$00,$FE,$FF,$FE,$00,$FF,$00,$FE,$FF,$FE,$00,$FE,$FF,$FF   ;A5E1F7;
    db $FF,$FE,$FF,$FE,$FF,$FF,$FF,$FE,$FF,$FE,$FF,$FF,$FF,$FE,$FF,$FF   ;A5E207;
    db $FF,$FF,$FF,$FE,$FE,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FF,$00,$FF,$FF   ;A5E217;
    db $FE,$FF,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$01,$FF,$00,$FE,$01   ;A5E227;
    db $FF,$00,$FF,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$02,$FF,$01,$FF,$02   ;A5E237;
    db $FF,$01,$FF,$02,$FF,$01,$FF,$02,$00,$02,$FF,$01,$FF,$02,$FF,$02   ;A5E247;
    db $00,$02,$FF,$02,$FF,$02,$00,$01,$FF,$02,$00,$02,$00,$02,$FF,$01   ;A5E257;
    db $00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01   ;A5E267;
    db $00,$02,$00,$02,$00,$01,$00,$02,$01,$01,$00,$02,$00,$01,$01,$02   ;A5E277;
    db $00,$02,$01,$01,$00,$02,$01,$01,$00,$02,$01,$01,$00,$02,$01,$01   ;A5E287;
    db $00,$02,$01,$01,$01,$02,$00,$02,$01,$01,$01,$02,$01,$01,$00,$02   ;A5E297;
    db $01,$01,$01,$02,$01,$01,$01,$02,$01,$01,$01,$01,$01,$02,$01,$01   ;A5E2A7;
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$02,$01,$01,$01,$01,$01   ;A5E2B7;
    db $01,$01,$02,$00,$01,$01,$02,$01,$01,$00,$02,$01,$01,$00,$02,$00   ;A5E2C7;
    db $01,$01,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$00   ;A5E2D7;
    db $02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$FF   ;A5E2E7;
    db $02,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$FF,$01,$00,$02,$00   ;A5E2F7;
    db $01,$00,$02,$00,$02,$FF,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00   ;A5E307;
    db $01,$FF,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$FF   ;A5E317;
    db $02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00   ;A5E327;
    db $02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00   ;A5E337;
    db $02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00   ;A5E347;
    db $02,$00                                                           ;A5E357;
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_SporeSpawn:
    dw $0000,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5E359;
    dw $0924,$57FF,$3AB5,$1DCE,$00E7,$03FF,$0216,$00B0                   ;A5E369;

Palette_SporeSpawn_HealthBased_0:
    dw $0000,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166                   ;A5E379;
    dw $0924,$57FF,$3AB5,$1DCE,$00E7,$03FF,$0216,$00B0                   ;A5E389;

Palette_SporeSpawn_HealthBased_1:
    dw $3800,$2A92,$21CC,$00C4,$0062,$260E,$15AA,$0D27                   ;A5E399;
    dw $04E5,$475A,$2E52,$198C,$00C6,$033F,$01B6,$008F                   ;A5E3A9;

Palette_SporeSpawn_HealthBased_2:
    dw $3800,$15EF,$156B,$00A5,$0063,$15AC,$0D49,$0907                   ;A5E3B9;
    dw $04C6,$36D6,$21D0,$114B,$00A6,$025F,$0137,$008D                   ;A5E3C9;

Palette_SporeSpawn_HealthBased_3:
    dw $3800,$094A,$0908,$0463,$0000,$0929,$04C6,$04A5                   ;A5E3D9;
    dw $0484,$2631,$156D,$0D09,$0085,$019F,$00D7,$006C                   ;A5E3E9;

Palette_SporeSpawn_DeathSequence_0:
    dw $3800,$094A,$0908,$0463,$0000,$0929,$04C6,$04A5                   ;A5E3F9;
    dw $0484,$2631,$156D,$0D09,$0085,$019F,$00D7,$006C                   ;A5E409;

Palette_SporeSpawn_DeathSequence_1:
    dw $3800,$118C,$0D2A,$0464,$0000,$0D4B,$08E8,$04A6                   ;A5E419;
    dw $0485,$2A53,$156E,$0D09,$0065,$09DF,$04F6,$006C                   ;A5E429;

Palette_SporeSpawn_DeathSequence_2:
    dw $3800,$15AF,$114B,$0465,$0001,$156D,$0D09,$08C7                   ;A5E439;
    dw $04A6,$2A74,$158E,$08EA,$0065,$11FE,$0916,$008C                   ;A5E449;

Palette_SporeSpawn_DeathSequence_3:
    dw $3800,$1DF1,$156D,$0466,$0001,$198F,$112B,$08C8                   ;A5E459;
    dw $04A7,$2E96,$158F,$08EA,$0045,$1A3E,$0D35,$008C                   ;A5E469;

Palette_SporeSpawn_DeathSequence_4:
    dw $3800,$2213,$1D8F,$0086,$0001,$21D0,$114D,$08EA                   ;A5E479;
    dw $04A8,$2E97,$1990,$04EA,$0044,$1E5D,$0D54,$00AB                   ;A5E489;

Palette_SporeSpawn_DeathSequence_5:
    dw $3800,$2A55,$21B1,$0087,$0001,$25F2,$156F,$08EB                   ;A5E499;
    dw $04A9,$32B9,$1991,$04EA,$0024,$269D,$1173,$00AB                   ;A5E4A9;

Palette_SporeSpawn_DeathSequence_6:
    dw $3800,$2E78,$25D2,$0088,$0002,$2E14,$1990,$0D0C                   ;A5E4B9;
    dw $04CA,$32DA,$19B1,$00CB,$0024,$2EBC,$1593,$00CB                   ;A5E4C9;

Palette_SporeSpawn_DeathSequence_7:
    dw $3800,$36BA,$29F4,$0089,$0002,$3236,$1DB2,$0D0D                   ;A5E4D9;
    dw $04CB,$36FC,$19B2,$00CB,$0004,$36FC,$19B2,$00CB                   ;A5E4E9;

Palette_SporeSpawn_DeathSequence_Level_0:
    dw $2003,$6318,$6318,$1CE1,$1DA9,$2923,$24A1,$1400                   ;A5E4F9;
    dw $2269,$21C9,$1544,$0420,$268B,$04C5,$2731,$0000                   ;A5E509;

Palette_SporeSpawn_DeathSequence_Level_1:
    dw $2003,$6318,$6318,$18C3,$1DAA,$2524,$1CA3,$1000                   ;A5E519;
    dw $1E2A,$1D8A,$1145,$0000,$2A8D,$0CE7,$22F1,$0001                   ;A5E529;

Palette_SporeSpawn_DeathSequence_Level_2:
    dw $0000,$6318,$6318,$14C4,$1DAC,$2126,$18A4,$0C00                   ;A5E539;
    dw $19EA,$196A,$1147,$0001,$2A6F,$112A,$22B1,$0001                   ;A5E549;

Palette_SporeSpawn_DeathSequence_Level_3:
    dw $0000,$6318,$6318,$0CA5,$19AD,$1908,$1085,$0400                   ;A5E559;
    dw $118A,$114A,$0D29,$0001,$2E70,$194C,$1E72,$0002                   ;A5E569;

Palette_SporeSpawn_DeathSequence_Level_4:
    dw $0000,$6318,$6318,$08A6,$19AF,$150A,$0C86,$0000                   ;A5E579;
    dw $0D4A,$0D2A,$0D2B,$0002,$2E52,$1D8F,$1E32,$0002                   ;A5E589;

Palette_SporeSpawn_DeathSequence_Level_5:
    dw $0000,$6318,$6318,$0488,$19B0,$110B,$0488,$0001                   ;A5E599;
    dw $090B,$08EB,$092C,$0003,$3254,$25B1,$19F2,$0002                   ;A5E5A9;

Palette_SporeSpawn_DeathSequence_Level_6:
    dw $0000,$6318,$6318,$0089,$19B2,$0D0D,$0089,$0002                   ;A5E5B9;
    dw $04CB,$04CB,$092E,$0004,$3236,$29F4,$19B2,$0002                   ;A5E5C9;

Palette_SporeSpawn_DeathSequence_Background_0:
    dw $3800,$5544,$3C84,$1441,$24E3,$18A2,$1081,$0C40                   ;A5E5D9;
    dw $129C,$11B5,$14EE,$1066,$7FFF,$7FFF,$16BD,$0800                   ;A5E5E9;

Palette_SporeSpawn_DeathSequence_Background_1:
    dw $3800,$4947,$3486,$1063,$2105,$18C4,$1083,$0C21                   ;A5E5F9;
    dw $1239,$1194,$110E,$1065,$7FFF,$7FFF,$167B,$0401                   ;A5E609;

Palette_SporeSpawn_DeathSequence_Background_2:
    dw $3800,$4169,$2CA7,$0C64,$2128,$14C6,$0C84,$0821                   ;A5E619;
    dw $0DF6,$0D72,$110E,$0C45,$7FFF,$7FFF,$1659,$0401                   ;A5E629;

Palette_SporeSpawn_DeathSequence_Background_3:
    dw $3800,$356B,$24C9,$0C65,$1D4A,$14E7,$0885,$0821                   ;A5E639;
    dw $0DB4,$0D30,$0D0E,$0845,$7FFF,$7FFF,$1A38,$0401                   ;A5E649;

Palette_SporeSpawn_DeathSequence_Background_4:
    dw $3800,$2D8D,$1CEA,$0866,$1D6D,$10E9,$0486,$0421                   ;A5E659;
    dw $0971,$090E,$0D0E,$0425,$7FFF,$7FFF,$1A16,$0401                   ;A5E669;

Palette_SporeSpawn_DeathSequence_Background_5:
    dw $3800,$2190,$14EC,$0488,$198F,$110B,$0488,$0402                   ;A5E679;
    dw $090E,$08ED,$092E,$0424,$7FFF,$7FFF,$19D4,$0002                   ;A5E689;

Palette_SporeSpawn_DeathSequence_Background_6:
    dw $3800,$19B2,$0D0D,$0089,$19B2,$0D0D,$0089,$0002                   ;A5E699;
    dw $04CB,$04CB,$092E,$0004,$7FFF,$7FFF,$19B2,$0002                   ;A5E6A9;

InstList_SporeSpawn_Initial_Dead:
    dw Instruction_SporeSpawn_LoadDeathSequenceTargetPalette             ;A5E6B9;
    dw $00C0                                                             ;A5E6BB;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E6BD;
    dw RTS_A5EB1A                                                        ;A5E6BF;
    dw $0001                                                             ;A5E6C1;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E6C3;
    dw Instruction_Common_Sleep                                          ;A5E6C5;

InstList_SporeSpawn_Initial_Alive:
    dw $0100                                                             ;A5E6C7;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0             ;A5E6C9;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E6CB;
    dw Function_SporeSpawn_Descent                                       ;A5E6CD;
    dw $0001                                                             ;A5E6CF;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0             ;A5E6D1;
    dw Instruction_Common_Sleep                                          ;A5E6D3;

InstList_SporeSpawn_FightHasStarted:
    dw Instruction_SporeSpawn_SetMaxXRadiusAndAngleDelta                 ;A5E6D5;
    dw $0040,$0001                                                       ;A5E6D7;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E6DB;
    dw Function_SporeSpawn_Moving                                        ;A5E6DD;
    dw $0300                                                             ;A5E6DF;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0             ;A5E6E1;

InstList_SporeSpawn_OpenAndStop_0:
    dw Instruction_SporeSpawn_SporeGenerationFlagInY                     ;A5E6E3;
    dw $0001                                                             ;A5E6E5;
    dw Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6                      ;A5E6E7;
    dw $002C,$0001                                                       ;A5E6E9;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0             ;A5E6ED;
    dw $0008                                                             ;A5E6EF;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1             ;A5E6F1;
    dw $0008                                                             ;A5E6F3;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2             ;A5E6F5;
    dw $0008                                                             ;A5E6F7;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3             ;A5E6F9;
    dw $0007                                                             ;A5E6FB;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4             ;A5E6FD;
    dw $0007                                                             ;A5E6FF;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5             ;A5E701;
    dw $0006                                                             ;A5E703;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6             ;A5E705;
    dw $0001                                                             ;A5E707;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_7             ;A5E709;
    dw Instruction_SporeSpawn_ClearDamagedFlag                           ;A5E70B;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E70D;
    dw RTS_A5EB1A                                                        ;A5E70F;
    dw Instruction_Common_TimerInY                                       ;A5E711;
    dw $0005                                                             ;A5E713;

InstList_SporeSpawn_OpenAndStop_1:
    dw $0008                                                             ;A5E715;
    dw ExtendedSpritemap_SporeSpawn_FullyOpen_0                          ;A5E717;
    dw $0008                                                             ;A5E719;
    dw ExtendedSpritemap_SporeSpawn_FullyOpen_1                          ;A5E71B;
    dw $0008                                                             ;A5E71D;
    dw ExtendedSpritemap_SporeSpawn_FullyOpen_2                          ;A5E71F;
    dw $0008                                                             ;A5E721;
    dw ExtendedSpritemap_SporeSpawn_FullyOpen_1                          ;A5E723;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A5E725;
    dw InstList_SporeSpawn_OpenAndStop_1                                 ;A5E727;

InstList_SporeSpawn_CloseAndMove:
    dw $0008                                                             ;A5E729;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6             ;A5E72B;
    dw $0008                                                             ;A5E72D;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5             ;A5E72F;
    dw $0008                                                             ;A5E731;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4             ;A5E733;
    dw $0008                                                             ;A5E735;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3             ;A5E737;
    dw $0008                                                             ;A5E739;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2             ;A5E73B;
    dw $0008                                                             ;A5E73D;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1             ;A5E73F;
    dw $0001                                                             ;A5E741;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0             ;A5E743;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E745;
    dw Function_SporeSpawn_Moving                                        ;A5E747;
    dw Instruction_SporeSpawn_SporeGenerationFlagInY                     ;A5E749;
    dw $0000                                                             ;A5E74B;
    dw Instruction_SporeSpawn_IncreaseMaxXRadius                         ;A5E74D;
    dw $0200                                                             ;A5E74F;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0             ;A5E751;
    dw Instruction_SporeSpawn_SporeGenerationFlagInY                     ;A5E753;
    dw $0001,$00D0                                                       ;A5E755;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0             ;A5E759;
    dw Instruction_Common_GotoY                                          ;A5E75B;
    dw InstList_SporeSpawn_OpenAndStop_0                                 ;A5E75D;

Instruction_SporeSpawn_IncreaseMaxXRadius:
    LDA.L $7E7816                                                        ;A5E75F;
    CLC                                                                  ;A5E763;
    ADC.W #$0008                                                         ;A5E764;
    CMP.W #$0030                                                         ;A5E767;
    BPL .return                                                          ;A5E76A;
    STA.L $7E7816                                                        ;A5E76C;

.return:
    RTL                                                                  ;A5E770;


Instruction_SporeSpawn_ClearDamagedFlag:
    PHX                                                                  ;A5E771;
    PHY                                                                  ;A5E772;
    LDA.W #$0000                                                         ;A5E773;
    STA.L $7E801E                                                        ;A5E776;
    PLY                                                                  ;A5E77A;
    PLX                                                                  ;A5E77B;
    RTL                                                                  ;A5E77C;


InstList_SporeSpawn_DeathSequence_0:
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E77D;
    dw Function_SporeSpawn_SetupDeath                                    ;A5E77F;
    dw $0001                                                             ;A5E781;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6             ;A5E783;
    dw Instruction_SporeSpawn_FunctionInY                                ;A5E785;
    dw Function_SporeSpawn_Dying                                         ;A5E787;
    dw Instruction_Common_TimerInY                                       ;A5E789;
    dw $000A                                                             ;A5E78B;

InstList_SporeSpawn_DeathSequence_1:
    dw $0001                                                             ;A5E78D;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6             ;A5E78F;
    dw Instruction_SporeSpawn_SpawnDyingExplosion                        ;A5E791;
    dw Instruction_Common_WaitYFrames                                    ;A5E793;
    dw $0008                                                             ;A5E795;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A5E797;
    dw InstList_SporeSpawn_DeathSequence_1                               ;A5E799;
    dw $0008                                                             ;A5E79B;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6             ;A5E79D;
    dw $0008                                                             ;A5E79F;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5             ;A5E7A1;
    dw $0008                                                             ;A5E7A3;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4             ;A5E7A5;
    dw $0008                                                             ;A5E7A7;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3             ;A5E7A9;
    dw $0008                                                             ;A5E7AB;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2             ;A5E7AD;
    dw $0008                                                             ;A5E7AF;
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1             ;A5E7B1;
    dw $0001                                                             ;A5E7B3;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E7B5;
    dw Instruction_SporeSpawn_Harden                                     ;A5E7B7;
    dw Instruction_Common_TimerInY                                       ;A5E7B9;
    dw $000A                                                             ;A5E7BB;

InstList_SporeSpawn_DeathSequence_2:
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7BD;
    dw Instruction_Common_WaitYFrames                                    ;A5E7BF;
    dw $0008                                                             ;A5E7C1;
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate        ;A5E7C3;
    dw InstList_SporeSpawn_DeathSequence_2                               ;A5E7C5;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette                   ;A5E7C7;
    dw $0000                                                             ;A5E7C9;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7CB;
    dw $0010                                                             ;A5E7CD;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E7CF;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette                   ;A5E7D1;
    dw $0020                                                             ;A5E7D3;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7D5;
    dw $0010                                                             ;A5E7D7;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E7D9;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette                   ;A5E7DB;
    dw $0040                                                             ;A5E7DD;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7DF;
    dw $0010                                                             ;A5E7E1;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E7E3;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette                   ;A5E7E5;
    dw $0060                                                             ;A5E7E7;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7E9;
    dw $0010                                                             ;A5E7EB;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E7ED;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette                   ;A5E7EF;
    dw $0080                                                             ;A5E7F1;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7F3;
    dw $0010                                                             ;A5E7F5;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E7F7;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette                   ;A5E7F9;
    dw $00A0                                                             ;A5E7FB;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E7FD;
    dw $0010                                                             ;A5E7FF;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E801;
    dw Instruction_SporeSpawn_LoadDeathSequencePalette                   ;A5E803;
    dw $00C0                                                             ;A5E805;
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud                    ;A5E807;
    dw $0010                                                             ;A5E809;
    dw ExtendedSpritemap_SporeSpawn_Dead                                 ;A5E80B;
    dw Instruction_SporeSpawn_CallSporeSpawnDeathItemDropRoutine         ;A5E80D;
    dw Instruction_Common_Sleep                                          ;A5E80F;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_SporeSpawn_SetMaxXRadiusAndAngles_A5E811:
    LDA.W $0000,Y                                                        ;A5E811;
    STA.L $7E7816                                                        ;A5E814;
    LDA.W $0002,Y                                                        ;A5E818;
    STA.L $7E7818                                                        ;A5E81B;
    LDA.W $0004,Y                                                        ;A5E81F;
    STA.L $7E7814                                                        ;A5E822;
    TYA                                                                  ;A5E826;
    CLC                                                                  ;A5E827;
    ADC.W #$0006                                                         ;A5E828;
    TAY                                                                  ;A5E82B;
    RTL                                                                  ;A5E82C;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_SporeSpawn_SetMaxXRadiusAndAngleDelta:
    LDA.W $0000,Y                                                        ;A5E82D;
    STA.L $7E7816                                                        ;A5E830;
    LDA.W $0002,Y                                                        ;A5E834;
    STA.L $7E7818                                                        ;A5E837;
    INY                                                                  ;A5E83B;
    INY                                                                  ;A5E83C;
    INY                                                                  ;A5E83D;
    INY                                                                  ;A5E83E;
    RTL                                                                  ;A5E83F;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_SporeSpawn_MaxXRadiusInY_A5E840:
    LDA.W $0000,Y                                                        ;A5E840;
    STA.L $7E7816                                                        ;A5E843;
    INY                                                                  ;A5E847;
    INY                                                                  ;A5E848;
    RTL                                                                  ;A5E849;


UNUSED_Instruction_SporeSpawn_AngleDeltaInY_A5E84A:
    LDA.W $0000,Y                                                        ;A5E84A;
    STA.L $7E7818                                                        ;A5E84D;
    INY                                                                  ;A5E851;
    INY                                                                  ;A5E852;
    RTL                                                                  ;A5E853;


UNUSED_Instruction_SporeSpawn_MaxXRadiusPlusY_A5E854:
    LDA.L $7E7816                                                        ;A5E854;
    CLC                                                                  ;A5E858;
    ADC.W $0000,Y                                                        ;A5E859;
    STA.L $7E7816                                                        ;A5E85C;
    INY                                                                  ;A5E860;
    INY                                                                  ;A5E861;
    RTL                                                                  ;A5E862;


UNUSED_Instruction_SporeSpawn_AngleDeltaPlusY_A5E863:
    LDA.L $7E7818                                                        ;A5E863;
    CLC                                                                  ;A5E867;
    ADC.W $0000,Y                                                        ;A5E868;
    STA.L $7E7818                                                        ;A5E86B;
    INY                                                                  ;A5E86F;
    INY                                                                  ;A5E870;
    RTL                                                                  ;A5E871;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_SporeSpawn_SporeGenerationFlagInY:
    LDA.W $0000,Y                                                        ;A5E872;
    STA.L $7E9000                                                        ;A5E875;
    INY                                                                  ;A5E879;
    INY                                                                  ;A5E87A;
    RTL                                                                  ;A5E87B;


Instruction_SporeSpawn_Harden:
    LDA.W #$0080                                                         ;A5E87C;
    STA.W $0F7A                                                          ;A5E87F;
    LDA.W #$0270                                                         ;A5E882;
    STA.W $0F7E                                                          ;A5E885;
    LDA.W $0F86                                                          ;A5E888;
    ORA.W #$A000                                                         ;A5E88B;
    AND.W #$FBFF                                                         ;A5E88E;
    STA.W $0F86                                                          ;A5E891;
    RTL                                                                  ;A5E894;


Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6:
    PHX                                                                  ;A5E895;
    PHY                                                                  ;A5E896;
    LDA.W $0000,Y                                                        ;A5E897;
    JSL.L QueueSound_Lib2_Max6                                           ;A5E89A;
    PLY                                                                  ;A5E89E;
    PLX                                                                  ;A5E89F;
    INY                                                                  ;A5E8A0;
    INY                                                                  ;A5E8A1;
    RTL                                                                  ;A5E8A2;


Instruction_SporeSpawn_QueueSFXInY_Lib3_Max6:
    PHX                                                                  ;A5E8A3;
    PHY                                                                  ;A5E8A4;
    LDA.W $0000,Y                                                        ;A5E8A5;
    JSL.L QueueSound_Lib3_Max6                                           ;A5E8A8;
    PLY                                                                  ;A5E8AC;
    PLX                                                                  ;A5E8AD;
    INY                                                                  ;A5E8AE;
    INY                                                                  ;A5E8AF;
    RTL                                                                  ;A5E8B0;


Instruction_SporeSpawn_CallSporeSpawnDeathItemDropRoutine:
    PHX                                                                  ;A5E8B1;
    PHY                                                                  ;A5E8B2;
    JSL.L SporeSpawnDeathItemDropRoutine                                 ;A5E8B3;
    PLY                                                                  ;A5E8B7;
    PLX                                                                  ;A5E8B8;
    RTL                                                                  ;A5E8B9;


Instruction_SporeSpawn_FunctionInY:
    PHY                                                                  ;A5E8BA;
    PHX                                                                  ;A5E8BB;
    LDX.W $0E54                                                          ;A5E8BC;
    LDA.W $0000,Y                                                        ;A5E8BF;
    STA.W $0FA8,X                                                        ;A5E8C2;
    PLX                                                                  ;A5E8C5;
    PLY                                                                  ;A5E8C6;
    INY                                                                  ;A5E8C7;
    INY                                                                  ;A5E8C8;
    RTL                                                                  ;A5E8C9;


Instruction_SporeSpawn_LoadDeathSequencePalette:
    PHY                                                                  ;A5E8CA;
    PHX                                                                  ;A5E8CB;
    STY.B $12                                                            ;A5E8CC;
    LDA.W $0000,Y                                                        ;A5E8CE;
    TAY                                                                  ;A5E8D1;
    LDX.W #$0000                                                         ;A5E8D2;

.loopSpritePalette1:
    LDA.W Palette_SporeSpawn_DeathSequence_0,Y                           ;A5E8D5;
    STA.L $7EC120,X                                                      ;A5E8D8;
    INY                                                                  ;A5E8DC;
    INY                                                                  ;A5E8DD;
    INX                                                                  ;A5E8DE;
    INX                                                                  ;A5E8DF;
    CPX.W #$0020                                                         ;A5E8E0;
    BNE .loopSpritePalette1                                              ;A5E8E3;
    LDY.B $12                                                            ;A5E8E5;
    LDA.W $0000,Y                                                        ;A5E8E7;
    TAY                                                                  ;A5E8EA;
    LDX.W #$0000                                                         ;A5E8EB;

.loopBG12Palette4:
    LDA.W Palette_SporeSpawn_DeathSequence_Level_0,Y                     ;A5E8EE;
    STA.L $7EC080,X                                                      ;A5E8F1;
    INY                                                                  ;A5E8F5;
    INY                                                                  ;A5E8F6;
    INX                                                                  ;A5E8F7;
    INX                                                                  ;A5E8F8;
    CPX.W #$0020                                                         ;A5E8F9;
    BNE .loopBG12Palette4                                                ;A5E8FC;
    LDY.B $12                                                            ;A5E8FE;
    LDA.W $0000,Y                                                        ;A5E900;
    TAY                                                                  ;A5E903;
    LDX.W #$0000                                                         ;A5E904;

Instruction_SporeSpawn_.loopBG12Palette7:
    LDA.W Palette_SporeSpawn_DeathSequence_Background_0,Y                ;A5E907;
    STA.L $7EC0E0,X                                                      ;A5E90A;
    INY                                                                  ;A5E90E;
    INY                                                                  ;A5E90F;
    INX                                                                  ;A5E910;
    INX                                                                  ;A5E911;
    CPX.W #$0020                                                         ;A5E912;
    BNE Instruction_SporeSpawn_.loopBG12Palette7                         ;A5E915;
    PLX                                                                  ;A5E917;
    PLY                                                                  ;A5E918;
    INY                                                                  ;A5E919;
    INY                                                                  ;A5E91A;
    RTL                                                                  ;A5E91B;


Instruction_SporeSpawn_LoadDeathSequenceTargetPalette:
    PHY                                                                  ;A5E91C;
    PHX                                                                  ;A5E91D;
    STY.B $12                                                            ;A5E91E;
    LDA.W $0000,Y                                                        ;A5E920;
    TAY                                                                  ;A5E923;
    LDX.W #$0000                                                         ;A5E924;

.loopSpritePalette1:
    LDA.W Palette_SporeSpawn_DeathSequence_0,Y                           ;A5E927;
    STA.L $7EC320,X                                                      ;A5E92A;
    INY                                                                  ;A5E92E;
    INY                                                                  ;A5E92F;
    INX                                                                  ;A5E930;
    INX                                                                  ;A5E931;
    CPX.W #$0020                                                         ;A5E932;
    BNE .loopSpritePalette1                                              ;A5E935;
    LDY.B $12                                                            ;A5E937;
    LDA.W $0000,Y                                                        ;A5E939;
    TAY                                                                  ;A5E93C;
    LDX.W #$0000                                                         ;A5E93D;

.loopBG12Palette4:
    LDA.W Palette_SporeSpawn_DeathSequence_Level_0,Y                     ;A5E940;
    STA.L $7EC280,X                                                      ;A5E943;
    INY                                                                  ;A5E947;
    INY                                                                  ;A5E948;
    INX                                                                  ;A5E949;
    INX                                                                  ;A5E94A;
    CPX.W #$0020                                                         ;A5E94B;
    BNE .loopBG12Palette4                                                ;A5E94E;
    LDY.B $12                                                            ;A5E950;
    LDA.W $0000,Y                                                        ;A5E952;
    TAY                                                                  ;A5E955;
    LDX.W #$0000                                                         ;A5E956;

.loopBG12Palette7:
    LDA.W Palette_SporeSpawn_DeathSequence_Background_0,Y                ;A5E959;
    STA.L $7EC2E0,X                                                      ;A5E95C;
    INY                                                                  ;A5E960;
    INY                                                                  ;A5E961;
    INX                                                                  ;A5E962;
    INX                                                                  ;A5E963;
    CPX.W #$0020                                                         ;A5E964;
    BNE .loopBG12Palette7                                                ;A5E967;
    PLX                                                                  ;A5E969;
    PLY                                                                  ;A5E96A;
    INY                                                                  ;A5E96B;
    INY                                                                  ;A5E96C;
    RTL                                                                  ;A5E96D;


Instruction_SporeSpawn_SpawnHardeningDustCloud:
    PHY                                                                  ;A5E96E;
    PHX                                                                  ;A5E96F;
    JSL.L GenerateRandomNumber                                           ;A5E970;
    LDA.W $05E5                                                          ;A5E974;
    AND.W #$007F                                                         ;A5E977;
    SEC                                                                  ;A5E97A;
    SBC.W #$0040                                                         ;A5E97B;
    STA.B $12                                                            ;A5E97E;
    LDA.W $0F7A                                                          ;A5E980;
    CLC                                                                  ;A5E983;
    ADC.B $12                                                            ;A5E984;
    STA.B $12                                                            ;A5E986;
    LDA.W $05E5                                                          ;A5E988;
    AND.W #$7F00                                                         ;A5E98B;
    XBA                                                                  ;A5E98E;
    SEC                                                                  ;A5E98F;
    SBC.W #$0040                                                         ;A5E990;
    STA.B $14                                                            ;A5E993;
    LDA.W $0F7E                                                          ;A5E995;
    CLC                                                                  ;A5E998;
    ADC.B $14                                                            ;A5E999;
    STA.B $14                                                            ;A5E99B;
    LDA.W #$0015                                                         ;A5E99D;
    LDY.W #EnemyProjectile_MiscDust                                      ;A5E9A0;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;A5E9A3;
    LDA.W #$0029                                                         ;A5E9A7;
    JSL.L QueueSound_Lib2_Max6                                           ;A5E9AA;
    PLX                                                                  ;A5E9AE;
    PLY                                                                  ;A5E9AF;
    RTL                                                                  ;A5E9B0;


Instruction_SporeSpawn_SpawnDyingExplosion:
    PHY                                                                  ;A5E9B1;
    PHX                                                                  ;A5E9B2;
    JSL.L GenerateRandomNumber                                           ;A5E9B3;
    LDA.W $05E5                                                          ;A5E9B7;
    AND.W #$007F                                                         ;A5E9BA;
    SEC                                                                  ;A5E9BD;
    SBC.W #$0040                                                         ;A5E9BE;
    STA.B $12                                                            ;A5E9C1;
    LDA.W $0F7A                                                          ;A5E9C3;
    CLC                                                                  ;A5E9C6;
    ADC.B $12                                                            ;A5E9C7;
    STA.B $12                                                            ;A5E9C9;
    LDA.W $05E5                                                          ;A5E9CB;
    AND.W #$3F00                                                         ;A5E9CE;
    XBA                                                                  ;A5E9D1;
    SEC                                                                  ;A5E9D2;
    SBC.W #$0020                                                         ;A5E9D3;
    STA.B $14                                                            ;A5E9D6;
    LDA.W $0F7E                                                          ;A5E9D8;
    CLC                                                                  ;A5E9DB;
    ADC.B $14                                                            ;A5E9DC;
    STA.B $14                                                            ;A5E9DE;
    LDA.W #$0003                                                         ;A5E9E0;
    STA.B $16                                                            ;A5E9E3;
    STZ.B $18                                                            ;A5E9E5;
    JSL.L Create_Sprite_Object                                           ;A5E9E7;
    LDA.W #$0025                                                         ;A5E9EB;
    JSL.L QueueSound_Lib2_Max6                                           ;A5E9EE;
    PLX                                                                  ;A5E9F2;
    PLY                                                                  ;A5E9F3;
    RTL                                                                  ;A5E9F4;


SpawnSporeSpawnCeilingDustCloud:
    PHY                                                                  ;A5E9F5;
    PHX                                                                  ;A5E9F6;
    LDA.W $05B6                                                          ;A5E9F7;
    AND.W #$000F                                                         ;A5E9FA;
    BNE .return                                                          ;A5E9FD;
    JSL.L GenerateRandomNumber                                           ;A5E9FF;
    LDA.W $05E5                                                          ;A5EA03;
    AND.W #$003F                                                         ;A5EA06;
    CLC                                                                  ;A5EA09;
    ADC.W #$0060                                                         ;A5EA0A;
    STA.B $12                                                            ;A5EA0D;
    LDA.W $05E5                                                          ;A5EA0F;
    AND.W #$0F00                                                         ;A5EA12;
    XBA                                                                  ;A5EA15;
    CLC                                                                  ;A5EA16;
    ADC.W #$01E0                                                         ;A5EA17;
    STA.B $14                                                            ;A5EA1A;
    LDA.W #$0015                                                         ;A5EA1C;
    STA.B $16                                                            ;A5EA1F;
    STZ.B $18                                                            ;A5EA21;
    JSL.L Create_Sprite_Object                                           ;A5EA23;

.return:
    PLX                                                                  ;A5EA27;
    PLY                                                                  ;A5EA28;
    RTL                                                                  ;A5EA29;


InitAI_SporeSpawn:
    LDY.W #$0000                                                         ;A5EA2A;
    LDX.W #$0000                                                         ;A5EA2D;

.loopSpritePalette7:
    LDA.W Palette_SporeSpawn,Y                                           ;A5EA30;
    STA.L $7EC3E0,X                                                      ;A5EA33;
    INY                                                                  ;A5EA37;
    INY                                                                  ;A5EA38;
    INX                                                                  ;A5EA39;
    INX                                                                  ;A5EA3A;
    CPX.W #$0020                                                         ;A5EA3B;
    BNE .loopSpritePalette7                                              ;A5EA3E;
    LDX.W $0E54                                                          ;A5EA40;
    LDA.W #$0000                                                         ;A5EA43;
    LDY.W #EnemyProjectile_SporeSpawnStalk                               ;A5EA46;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EA49;
    LDA.W #$0001                                                         ;A5EA4D;
    LDY.W #EnemyProjectile_SporeSpawnStalk                               ;A5EA50;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EA53;
    LDA.W #$0002                                                         ;A5EA57;
    LDY.W #EnemyProjectile_SporeSpawnStalk                               ;A5EA5A;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EA5D;
    LDA.W #$0003                                                         ;A5EA61;
    LDY.W #EnemyProjectile_SporeSpawnStalk                               ;A5EA64;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EA67;
    LDX.W $0E54                                                          ;A5EA6B;
    LDA.W $0F7A,X                                                        ;A5EA6E;
    STA.L $7E7808,X                                                      ;A5EA71;
    LDA.W $0F7E,X                                                        ;A5EA75;
    SEC                                                                  ;A5EA78;
    SBC.W #$0048                                                         ;A5EA79;
    STA.L $7E780A,X                                                      ;A5EA7C;
    LDA.W $0F7A,X                                                        ;A5EA80;
    STA.W $0FAC,X                                                        ;A5EA83;
    LDA.W $0F7E,X                                                        ;A5EA86;
    STA.W $0FAE,X                                                        ;A5EA89;
    STZ.W $0FB2,X                                                        ;A5EA8C;
    LDX.W $079F                                                          ;A5EA8F;
    LDA.L $7ED828,X                                                      ;A5EA92;
    AND.W #$0002                                                         ;A5EA96;
    BEQ .alive                                                           ;A5EA99;
    LDA.W #InstList_SporeSpawn_Initial_Dead                              ;A5EA9B;
    STA.W $0F92                                                          ;A5EA9E;
    LDA.W #RTS_A5EB1A                                                    ;A5EAA1;
    STA.W $0FA8                                                          ;A5EAA4;
    LDA.W $0F86                                                          ;A5EAA7;
    ORA.W #$8000                                                         ;A5EAAA;
    STA.W $0F86                                                          ;A5EAAD;
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EAB0;
    JSL.L Spawn_Hardcoded_PLM                                            ;A5EAB3;
    db $07,$1E                                                           ;A5EAB7;
    dw PLMEntries_clearSporeSpawnCeiling                                 ;A5EAB9;
    STZ.W $07E9                                                          ;A5EABB;
    RTL                                                                  ;A5EABE;


.alive:
    LDX.W $0E54                                                          ;A5EABF;
    LDA.W #InstList_SporeSpawn_Initial_Alive                             ;A5EAC2;
    STA.W $0F92                                                          ;A5EAC5;
    LDA.W #$FFFF                                                         ;A5EAC8;
    STA.W $183C                                                          ;A5EACB;
    LDX.W $0E54                                                          ;A5EACE;
    LDA.W #RTS_A5EB1A                                                    ;A5EAD1;
    STA.W $0FA8,X                                                        ;A5EAD4;
    LDA.W #ScrollingFinishedHook_SporeSpawnFight                         ;A5EAD7;
    STA.W $07E9                                                          ;A5EADA;
    LDA.W $0F7E,X                                                        ;A5EADD;
    SEC                                                                  ;A5EAE0;
    SBC.W #$0080                                                         ;A5EAE1;
    STA.W $0F7E,X                                                        ;A5EAE4;
    LDA.W #$0000                                                         ;A5EAE7;
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner                        ;A5EAEA;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EAED;
    LDA.W #$0001                                                         ;A5EAF1;
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner                        ;A5EAF4;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EAF7;
    LDA.W #$0002                                                         ;A5EAFB;
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner                        ;A5EAFE;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EB01;
    LDA.W #$0003                                                         ;A5EB05;
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner                        ;A5EB08;
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics                     ;A5EB0B;
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EB0F;
    RTL                                                                  ;A5EB12;


MainAI_SporeSpawn:
    LDX.W $0E54                                                          ;A5EB13;
    JSR.W ($0FA8,X)                                                      ;A5EB16;
    RTL                                                                  ;A5EB19;


RTS_A5EB1A:
    RTS                                                                  ;A5EB1A;


Function_SporeSpawn_Descent:
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EB1B;
    LDX.W $0E54                                                          ;A5EB1E;
    LDA.W $0F7E,X                                                        ;A5EB21;
    CLC                                                                  ;A5EB24;
    ADC.W #$0001                                                         ;A5EB25;
    STA.W $0F7E,X                                                        ;A5EB28;
    CMP.W #$0270                                                         ;A5EB2B;
    BMI .descending                                                      ;A5EB2E;
    LDA.W #InstList_SporeSpawn_FightHasStarted                           ;A5EB30;
    STA.W $0F92,X                                                        ;A5EB33;
    LDA.W #$0001                                                         ;A5EB36;
    STA.W $0F94,X                                                        ;A5EB39;

.descending:
    LDA.W #$0030                                                         ;A5EB3C;
    STA.L $7E7816                                                        ;A5EB3F;
    LDA.W #$0001                                                         ;A5EB43;
    STA.L $7E7818                                                        ;A5EB46;
    LDA.W #$00C0                                                         ;A5EB4A;
    STA.L $7E7814                                                        ;A5EB4D;
    RTS                                                                  ;A5EB51;


Function_SporeSpawn_Moving:
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EB52;
    LDA.L $7E7816                                                        ;A5EB55;
    STA.W $0E32                                                          ;A5EB59;
    LDA.L $7E7814                                                        ;A5EB5C;
    JSL.L EightBitCosineMultiplication_A0B0B2                            ;A5EB60;
    CLC                                                                  ;A5EB64;
    ADC.W $0FAC,X                                                        ;A5EB65;
    STA.W $0F7A,X                                                        ;A5EB68;
    LDA.L $7E7816                                                        ;A5EB6B;
    SEC                                                                  ;A5EB6F;
    SBC.W #$0010                                                         ;A5EB70;
    STA.W $0E32                                                          ;A5EB73;
    LDA.L $7E7814                                                        ;A5EB76;
    SEC                                                                  ;A5EB7A;
    SBC.W #$0040                                                         ;A5EB7B;
    ASL A                                                                ;A5EB7E;
    JSL.L EightBitNegativeSineMultiplication_A0B0C6                      ;A5EB7F;
    CLC                                                                  ;A5EB83;
    ADC.W $0FAE,X                                                        ;A5EB84;
    STA.W $0F7E,X                                                        ;A5EB87;
    LDA.L $7E7814                                                        ;A5EB8A;
    CLC                                                                  ;A5EB8E;
    ADC.L $7E7818                                                        ;A5EB8F;
    AND.W #$00FF                                                         ;A5EB93;
    STA.L $7E7814                                                        ;A5EB96;
    RTS                                                                  ;A5EB9A;


Function_SporeSpawn_SetupDeath:
    LDX.W $0E54                                                          ;A5EB9B;
    LDA.W #$0080                                                         ;A5EB9E;
    SEC                                                                  ;A5EBA1;
    SBC.W $0F7A                                                          ;A5EBA2;
    STA.B $12                                                            ;A5EBA5;
    LDA.W #$0270                                                         ;A5EBA7;
    SEC                                                                  ;A5EBAA;
    SBC.W $0F7E                                                          ;A5EBAB;
    STA.B $14                                                            ;A5EBAE;
    JSL.L CalculateAngleOf_12_14_Offset                                  ;A5EBB0;
    SEC                                                                  ;A5EBB4;
    SBC.W #$0040                                                         ;A5EBB5;
    EOR.W #$FFFF                                                         ;A5EBB8;
    INC A                                                                ;A5EBBB;
    AND.W #$00FF                                                         ;A5EBBC;
    STA.L $7E8806                                                        ;A5EBBF;
    LDA.W #$0001                                                         ;A5EBC3;
    STA.B $14                                                            ;A5EBC6;
    LDA.L $7E8806                                                        ;A5EBC8;
    AND.W #$00FF                                                         ;A5EBCC;
    STA.B $12                                                            ;A5EBCF;
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name              ;A5EBD1; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16                                                            ;A5EBD5;
    STA.L $7E8010,X                                                      ;A5EBD7;
    LDA.B $18                                                            ;A5EBDB;
    STA.L $7E8012,X                                                      ;A5EBDD;
    LDA.B $1A                                                            ;A5EBE1;
    STA.L $7E8014,X                                                      ;A5EBE3;
    LDA.B $1C                                                            ;A5EBE7;
    STA.L $7E8016,X                                                      ;A5EBE9;
    RTS                                                                  ;A5EBED;


Function_SporeSpawn_Dying:
    LDX.W $0E54                                                          ;A5EBEE;
    LDA.L $7E8010,X                                                      ;A5EBF1;
    STA.W $0E24                                                          ;A5EBF5;
    LDA.L $7E8012,X                                                      ;A5EBF8;
    STA.W $0E26                                                          ;A5EBFC;
    LDA.L $7E8014,X                                                      ;A5EBFF;
    STA.W $0E28                                                          ;A5EC03;
    LDA.L $7E8016,X                                                      ;A5EC06;
    STA.W $0E2A                                                          ;A5EC0A;
    LDA.L $7E8806                                                        ;A5EC0D;
    AND.W #$00FF                                                         ;A5EC11;
    STA.W $0E20                                                          ;A5EC14;
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds                           ;A5EC17;
    LDA.W $0F7A                                                          ;A5EC1B;
    SEC                                                                  ;A5EC1E;
    SBC.W #$0080                                                         ;A5EC1F;
    JSL.L NegateA_A0B067                                                 ;A5EC22;
    CMP.W #$0008                                                         ;A5EC26;
    BPL .notDone                                                         ;A5EC29;
    LDA.W $0F7E                                                          ;A5EC2B;
    SEC                                                                  ;A5EC2E;
    SBC.W #$0270                                                         ;A5EC2F;
    JSL.L NegateA_A0B067                                                 ;A5EC32;
    CMP.W #$0008                                                         ;A5EC36;
    BPL .notDone                                                         ;A5EC39;
    LDA.W #RTS_A5EB1A                                                    ;A5EC3B;
    STA.W $0FA8                                                          ;A5EC3E;

.notDone:
    JSR.W UpdateSporeSpawnStalkSegmentPositions                          ;A5EC41;
    JSL.L SpawnSporeSpawnCeilingDustCloud                                ;A5EC44;
    RTS                                                                  ;A5EC48;


UpdateSporeSpawnStalkSegmentPositions:
    LDA.W $0F7A                                                          ;A5EC49;
    SEC                                                                  ;A5EC4C;
    SBC.L $7E7808                                                        ;A5EC4D;
    BPL .positiveX                                                       ;A5EC51;
    EOR.W #$FFFF                                                         ;A5EC53;
    INC A                                                                ;A5EC56;
    LSR A                                                                ;A5EC57;
    STA.B $12                                                            ;A5EC58;
    LSR A                                                                ;A5EC5A;
    STA.B $14                                                            ;A5EC5B;
    CLC                                                                  ;A5EC5D;
    ADC.B $12                                                            ;A5EC5E;
    STA.B $16                                                            ;A5EC60;
    LDA.W #$0080                                                         ;A5EC62;
    STA.W $1A67                                                          ;A5EC65;
    LDA.L $7E7808                                                        ;A5EC68;
    SEC                                                                  ;A5EC6C;
    SBC.B $14                                                            ;A5EC6D;
    STA.W $1A69                                                          ;A5EC6F;
    STA.L $7E8000                                                        ;A5EC72;
    LDA.L $7E7808                                                        ;A5EC76;
    SEC                                                                  ;A5EC7A;
    SBC.B $12                                                            ;A5EC7B;
    STA.W $1A6B                                                          ;A5EC7D;
    STA.L $7E8002                                                        ;A5EC80;
    LDA.L $7E7808                                                        ;A5EC84;
    SEC                                                                  ;A5EC88;
    SBC.B $16                                                            ;A5EC89;
    STA.W $1A6D                                                          ;A5EC8B;
    STA.L $7E8004                                                        ;A5EC8E;
    BRA .checkY                                                          ;A5EC92;


.positiveX:
    LSR A                                                                ;A5EC94;
    STA.B $12                                                            ;A5EC95;
    LSR A                                                                ;A5EC97;
    STA.B $14                                                            ;A5EC98;
    CLC                                                                  ;A5EC9A;
    ADC.B $12                                                            ;A5EC9B;
    STA.B $16                                                            ;A5EC9D;
    LDA.W #$0080                                                         ;A5EC9F;
    STA.W $1A67                                                          ;A5ECA2;
    LDA.B $14                                                            ;A5ECA5;
    CLC                                                                  ;A5ECA7;
    ADC.L $7E7808                                                        ;A5ECA8;
    STA.W $1A69                                                          ;A5ECAC;
    STA.L $7E8000                                                        ;A5ECAF;
    LDA.B $12                                                            ;A5ECB3;
    CLC                                                                  ;A5ECB5;
    ADC.L $7E7808                                                        ;A5ECB6;
    STA.W $1A6B                                                          ;A5ECBA;
    STA.L $7E8002                                                        ;A5ECBD;
    LDA.B $16                                                            ;A5ECC1;
    CLC                                                                  ;A5ECC3;
    ADC.L $7E7808                                                        ;A5ECC4;
    STA.W $1A6D                                                          ;A5ECC8;
    STA.L $7E8004                                                        ;A5ECCB;

.checkY:
    LDA.W $0F7E                                                          ;A5ECCF;
    SEC                                                                  ;A5ECD2;
    SBC.W #$0028                                                         ;A5ECD3;
    SEC                                                                  ;A5ECD6;
    SBC.L $7E780A                                                        ;A5ECD7;
    BPL .positiveY                                                       ;A5ECDB;
    EOR.W #$FFFF                                                         ;A5ECDD;
    INC A                                                                ;A5ECE0;
    LSR A                                                                ;A5ECE1;
    STA.B $12                                                            ;A5ECE2;
    LSR A                                                                ;A5ECE4;
    STA.B $14                                                            ;A5ECE5;
    CLC                                                                  ;A5ECE7;
    ADC.B $12                                                            ;A5ECE8;
    STA.B $16                                                            ;A5ECEA;
    LDA.W #$0230                                                         ;A5ECEC;
    STA.W $1AAF                                                          ;A5ECEF;
    LDA.L $7E780A                                                        ;A5ECF2;
    SEC                                                                  ;A5ECF6;
    SBC.B $14                                                            ;A5ECF7;
    STA.W $1AB1                                                          ;A5ECF9;
    STA.L $7E8006                                                        ;A5ECFC;
    LDA.L $7E780A                                                        ;A5ED00;
    SEC                                                                  ;A5ED04;
    SBC.B $12                                                            ;A5ED05;
    STA.W $1AB3                                                          ;A5ED07;
    STA.L $7E8008                                                        ;A5ED0A;
    LDA.L $7E780A                                                        ;A5ED0E;
    SEC                                                                  ;A5ED12;
    SBC.B $16                                                            ;A5ED13;
    STA.W $1AB5                                                          ;A5ED15;
    STA.L $7E800A                                                        ;A5ED18;
    BRA .return                                                          ;A5ED1C;


.positiveY:
    LSR A                                                                ;A5ED1E;
    STA.B $12                                                            ;A5ED1F;
    LSR A                                                                ;A5ED21;
    STA.B $14                                                            ;A5ED22;
    CLC                                                                  ;A5ED24;
    ADC.B $12                                                            ;A5ED25;
    STA.B $16                                                            ;A5ED27;
    LDA.W #$0230                                                         ;A5ED29;
    STA.W $1AAF                                                          ;A5ED2C;
    LDA.B $14                                                            ;A5ED2F;
    CLC                                                                  ;A5ED31;
    ADC.L $7E780A                                                        ;A5ED32;
    STA.W $1AB1                                                          ;A5ED36;
    STA.L $7E8006                                                        ;A5ED39;
    LDA.B $12                                                            ;A5ED3D;
    CLC                                                                  ;A5ED3F;
    ADC.L $7E780A                                                        ;A5ED40;
    STA.W $1AB3                                                          ;A5ED44;
    STA.L $7E8008                                                        ;A5ED47;
    LDA.B $16                                                            ;A5ED4B;
    CLC                                                                  ;A5ED4D;
    ADC.L $7E780A                                                        ;A5ED4E;
    STA.W $1AB5                                                          ;A5ED52;
    STA.L $7E800A                                                        ;A5ED55;

.return:
    RTS                                                                  ;A5ED59;


EnemyShot_SporeSpawn_Vulnerable:
    LDA.W $18A6                                                          ;A5ED5A;
    ASL A                                                                ;A5ED5D;
    TAX                                                                  ;A5ED5E;
    LDA.W $0C18,X                                                        ;A5ED5F;
    BIT.W #$0700                                                         ;A5ED62;
    BNE .notBeam                                                         ;A5ED65;
    BIT.W #$0010                                                         ;A5ED67;
    BNE .notBeam                                                         ;A5ED6A;
    RTL                                                                  ;A5ED6C;


.notBeam:
    JSL.L NormalEnemyShotAI_NoDeathCheck                                 ;A5ED6D;
    LDA.W $0F9C,X                                                        ;A5ED71;
    BEQ EnemyShot_SporeSpawn                                             ;A5ED74;
    LDA.W #Function_SporeSpawn_Moving                                    ;A5ED76;
    STA.W $0FA8,X                                                        ;A5ED79;
    LDY.W #$0002                                                         ;A5ED7C;
    LDA.W $0F8C,X                                                        ;A5ED7F;
    CMP.W #$0190                                                         ;A5ED82;
    BPL .noSpeedUp                                                       ;A5ED85;
    LDA.L $7E7818                                                        ;A5ED87;
    BPL .negativeAngleDelta                                              ;A5ED8B;
    TYA                                                                  ;A5ED8D;
    EOR.W #$FFFF                                                         ;A5ED8E;
    INC A                                                                ;A5ED91;
    TAY                                                                  ;A5ED92;

.negativeAngleDelta:
    TYA                                                                  ;A5ED93;
    STA.L $7E7818                                                        ;A5ED94;

.noSpeedUp:
    LDA.L $7E801E                                                        ;A5ED98;
    BNE EnemyShot_SporeSpawn                                             ;A5ED9C;
    LDA.L $7E7818                                                        ;A5ED9E;
    EOR.W #$FFFF                                                         ;A5EDA2;
    INC A                                                                ;A5EDA5;
    STA.L $7E7818                                                        ;A5EDA6;
    LDA.W #$0001                                                         ;A5EDAA;
    STA.L $7E801E                                                        ;A5EDAD;
    LDA.W #InstList_SporeSpawn_CloseAndMove                              ;A5EDB1;
    STA.W $0F92,X                                                        ;A5EDB4;
    LDA.W #$0001                                                         ;A5EDB7;
    STA.W $0F94,X                                                        ;A5EDBA;
    LDY.W #$0060                                                         ;A5EDBD;
    LDA.W $0F8C,X                                                        ;A5EDC0;
    CMP.W #$0046                                                         ;A5EDC3;
    BMI .paletteChosen                                                   ;A5EDC6;
    LDY.W #$0040                                                         ;A5EDC8;
    CMP.W #$019A                                                         ;A5EDCB;
    BMI .paletteChosen                                                   ;A5EDCE;
    LDY.W #$0020                                                         ;A5EDD0;
    CMP.W #$0302                                                         ;A5EDD3;
    BMI .paletteChosen                                                   ;A5EDD6;
    LDY.W #$0000                                                         ;A5EDD8;

.paletteChosen:
    CMP.L $7E8800                                                        ;A5EDDB;
    BEQ EnemyShot_SporeSpawn                                             ;A5EDDF;
    STA.L $7E8800                                                        ;A5EDE1;
    TYA                                                                  ;A5EDE5;
    JSL.L LoadSporeSpawnHealthBasedPalette                               ;A5EDE6;

EnemyShot_SporeSpawn:
    BRA SporeSpawnReaction_Common                                        ;A5EDEA;


EnemyTouch_SporeSpawn:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External                       ;A5EDEC;
    BRA SporeSpawnReaction_Common                                        ;A5EDF0;


PowerBombReaction_SporeSpawn:
    RTL                                                                  ;A5EDF2; >.<


SporeSpawnReaction_Common:
    LDX.W $0E54                                                          ;A5EDF3;
    LDA.W $0F8C,X                                                        ;A5EDF6;
    BNE .return                                                          ;A5EDF9;
    LDX.W $0E54                                                          ;A5EDFB;
    LDA.W #$0000                                                         ;A5EDFE;
    STA.L $7E781C                                                        ;A5EE01;
    STZ.W $0FA0,X                                                        ;A5EE05;
    STZ.W $0F9C,X                                                        ;A5EE08;
    STZ.W $0F8A,X                                                        ;A5EE0B;
    LDA.W $0F86,X                                                        ;A5EE0E;
    ORA.W #$0400                                                         ;A5EE11;
    STA.W $0F86,X                                                        ;A5EE14;
    LDY.W #$001A                                                         ;A5EE17;
    LDA.W #$0000                                                         ;A5EE1A;

.loopClearProjectiles:
    STA.W $1997,Y                                                        ;A5EE1D;
    DEY                                                                  ;A5EE20;
    DEY                                                                  ;A5EE21;
    BPL .loopClearProjectiles                                            ;A5EE22;
    LDA.W #InstList_SporeSpawn_DeathSequence_0                           ;A5EE24;
    STA.W $0F92                                                          ;A5EE27;
    LDA.W #$0001                                                         ;A5EE2A;
    STA.W $0F94                                                          ;A5EE2D;
    LDX.W $079F                                                          ;A5EE30;
    LDA.L $7ED828,X                                                      ;A5EE33;
    ORA.W #$0002                                                         ;A5EE37;
    STA.L $7ED828,X                                                      ;A5EE3A;
    STZ.W $07E9                                                          ;A5EE3E;
    JSL.L Spawn_Hardcoded_PLM                                            ;A5EE41;
    db $07,$1E                                                           ;A5EE45;
    dw PLMEntries_crumbleSporeSpawnCeiling                               ;A5EE47;

.return:
    RTL                                                                  ;A5EE49;


LoadSporeSpawnHealthBasedPalette:
    PHY                                                                  ;A5EE4A;
    PHX                                                                  ;A5EE4B;
    STA.B $12                                                            ;A5EE4C;
    TAY                                                                  ;A5EE4E;
    LDX.W #$0000                                                         ;A5EE4F;

.loopSpritePalette1:
    LDA.W Palette_SporeSpawn_HealthBased_0,Y                             ;A5EE52;
    STA.L $7EC120,X                                                      ;A5EE55;
    INY                                                                  ;A5EE59;
    INY                                                                  ;A5EE5A;
    INX                                                                  ;A5EE5B;
    INX                                                                  ;A5EE5C;
    CPX.W #$0020                                                         ;A5EE5D;
    BNE .loopSpritePalette1                                              ;A5EE60;
    PLX                                                                  ;A5EE62;
    PLY                                                                  ;A5EE63;
    RTL                                                                  ;A5EE64;


ExtendedSpritemap_SporeSpawn_Dead:
    dw $0001                                                             ;A5EE65;
    dw $0000,$0000                                                       ;A5EE67;
    dw Spritemap_SporeSpawn_0                                            ;A5EE6B;
    dw Hitbox_SporeSpawn_0                                               ;A5EE6D;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0:
    dw $0001,$0000,$0000                                                 ;A5EE6F;
    dw Spritemap_SporeSpawn_0                                            ;A5EE75;
    dw Hitbox_SporeSpawn_1                                               ;A5EE77;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1:
    dw $0002,$0000,$0000                                                 ;A5EE79;
    dw Spritemap_SporeSpawn_1                                            ;A5EE7F;
    dw Hitbox_SporeSpawn_2                                               ;A5EE81;
    dw $0000,$0000                                                       ;A5EE83;
    dw Spritemap_SporeSpawn_B                                            ;A5EE87;
    dw Hitbox_SporeSpawn_B                                               ;A5EE89;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2:
    dw $0002,$0000,$0000                                                 ;A5EE8B;
    dw Spritemap_SporeSpawn_2                                            ;A5EE91;
    dw Hitbox_SporeSpawn_3                                               ;A5EE93;
    dw $0000,$0000                                                       ;A5EE95;
    dw Spritemap_SporeSpawn_C                                            ;A5EE99;
    dw Hitbox_SporeSpawn_C                                               ;A5EE9B;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3:
    dw $0002,$0000,$0000                                                 ;A5EE9D;
    dw Spritemap_SporeSpawn_3                                            ;A5EEA3;
    dw Hitbox_SporeSpawn_4                                               ;A5EEA5;
    dw $0000,$0000                                                       ;A5EEA7;
    dw Spritemap_SporeSpawn_D                                            ;A5EEAB;
    dw Hitbox_SporeSpawn_D                                               ;A5EEAD;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4:
    dw $0002,$0000,$0000                                                 ;A5EEAF;
    dw Spritemap_SporeSpawn_4                                            ;A5EEB5;
    dw Hitbox_SporeSpawn_5                                               ;A5EEB7;
    dw $0000,$0000                                                       ;A5EEB9;
    dw Spritemap_SporeSpawn_C                                            ;A5EEBD;
    dw Hitbox_SporeSpawn_C                                               ;A5EEBF;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5:
    dw $0002,$0000,$0000                                                 ;A5EEC1;
    dw Spritemap_SporeSpawn_5                                            ;A5EEC7;
    dw Hitbox_SporeSpawn_6                                               ;A5EEC9;
    dw $0000,$0000                                                       ;A5EECB;
    dw Spritemap_SporeSpawn_B                                            ;A5EECF;
    dw Hitbox_SporeSpawn_B                                               ;A5EED1;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6:
    dw $0002,$0000,$0000                                                 ;A5EED3;
    dw Spritemap_SporeSpawn_15                                           ;A5EED9;
    dw Hitbox_SporeSpawn_13                                              ;A5EEDB;
    dw $0000,$0000                                                       ;A5EEDD;
    dw Spritemap_SporeSpawn_C                                            ;A5EEE1;
    dw Hitbox_SporeSpawn_C                                               ;A5EEE3;

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_7:
    dw $0002,$0000,$0000                                                 ;A5EEE5;
    dw Spritemap_SporeSpawn_16                                           ;A5EEEB;
    dw Hitbox_SporeSpawn_14                                              ;A5EEED;
    dw $0000,$0000                                                       ;A5EEEF;
    dw Spritemap_SporeSpawn_D                                            ;A5EEF3;
    dw Hitbox_SporeSpawn_D                                               ;A5EEF5;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_SporeSpawn_A5EEF7:
    dw $0001,$0000,$0000                                                 ;A5EEF7;
    dw Spritemap_SporeSpawn_F                                            ;A5EEFD;
    dw Hitbox_SporeSpawn_F                                               ;A5EEFF;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF01:
    dw $0001,$0000,$0000                                                 ;A5EF01;
    dw Spritemap_SporeSpawn_10                                           ;A5EF07;
    dw Hitbox_SporeSpawn_10                                              ;A5EF09;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF0B:
    dw $0001,$0000,$0000                                                 ;A5EF0B;
    dw Spritemap_SporeSpawn_11                                           ;A5EF11;
    dw Hitbox_SporeSpawn_11                                              ;A5EF13;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF15:
    dw $0001,$0000,$0000                                                 ;A5EF15;
    dw Spritemap_SporeSpawn_12                                           ;A5EF1B;
    dw Hitbox_SporeSpawn_12                                              ;A5EF1D;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF1F:
    dw $0001,$0000,$0000                                                 ;A5EF1F;
    dw Spritemap_SporeSpawn_13                                           ;A5EF25;
    dw Hitbox_SporeSpawn_13                                              ;A5EF27;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF29:
    dw $0001,$0000,$0000                                                 ;A5EF29;
    dw Spritemap_SporeSpawn_14                                           ;A5EF2F;
    dw Hitbox_SporeSpawn_13                                              ;A5EF31;

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF33:
    dw $0001,$0000,$0000                                                 ;A5EF33;
    dw Spritemap_SporeSpawn_E                                            ;A5EF39;
    dw Hitbox_SporeSpawn_E                                               ;A5EF3B;
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_SporeSpawn_FullyOpen_0:
    dw $0002,$0000,$0000                                                 ;A5EF3D;
    dw Spritemap_SporeSpawn_16                                           ;A5EF43;
    dw Hitbox_SporeSpawn_14                                              ;A5EF45;
    dw $0000,$0000                                                       ;A5EF47;
    dw Spritemap_SporeSpawn_B                                            ;A5EF4B;
    dw Hitbox_SporeSpawn_B                                               ;A5EF4D;

ExtendedSpritemap_SporeSpawn_FullyOpen_1:
    dw $0002,$0000,$0000                                                 ;A5EF4F;
    dw Spritemap_SporeSpawn_16                                           ;A5EF55;
    dw Hitbox_SporeSpawn_14                                              ;A5EF57;
    dw $0000,$0000                                                       ;A5EF59;
    dw Spritemap_SporeSpawn_C                                            ;A5EF5D;
    dw Hitbox_SporeSpawn_C                                               ;A5EF5F;

ExtendedSpritemap_SporeSpawn_FullyOpen_2:
    dw $0002,$0000,$0000                                                 ;A5EF61;
    dw Spritemap_SporeSpawn_16                                           ;A5EF67;
    dw Hitbox_SporeSpawn_14                                              ;A5EF69;
    dw $0000,$0000                                                       ;A5EF6B;
    dw Spritemap_SporeSpawn_D                                            ;A5EF6F;
    dw Hitbox_SporeSpawn_D                                               ;A5EF71;

Hitbox_SporeSpawn_0:
    dw $0002,$FFD7,$FFE2,$0029,$001E                                     ;A5EF73;
    dw RTL_A5804C                                                        ;A5EF7D;
    dw CommonA5_CreateADudShot                                           ;A5EF7F;
    dw $FFF0,$FFD3,$000F,$FFE2                                           ;A5EF81;
    dw RTL_A5804C                                                        ;A5EF89;
    dw CommonA5_CreateADudShot                                           ;A5EF8B;

Hitbox_SporeSpawn_1:
    dw $0002,$FFD7,$FFE2,$0029,$001E                                     ;A5EF8D;
    dw EnemyTouch_SporeSpawn                                             ;A5EF97;
    dw CommonA5_CreateADudShot                                           ;A5EF99;
    dw $FFF0,$FFD3,$000F,$FFE2                                           ;A5EF9B;
    dw EnemyTouch_SporeSpawn                                             ;A5EFA3;
    dw CommonA5_CreateADudShot                                           ;A5EFA5;

Hitbox_SporeSpawn_2:
    dw $0002,$FFD4,$FFDD,$002B,$0021                                     ;A5EFA7;
    dw EnemyTouch_SporeSpawn                                             ;A5EFB1;
    dw CommonA5_CreateADudShot                                           ;A5EFB3;
    dw $FFF0,$FFCF,$000F,$FFDD                                           ;A5EFB5;
    dw EnemyTouch_SporeSpawn                                             ;A5EFBD;
    dw CommonA5_CreateADudShot                                           ;A5EFBF;

Hitbox_SporeSpawn_3:
    dw $0004,$FFD3,$FFDA,$002C,$FFF7                                     ;A5EFC1;
    dw EnemyTouch_SporeSpawn                                             ;A5EFCB;
    dw CommonA5_CreateADudShot                                           ;A5EFCD;
    dw $FFD3,$0008,$002C,$0023                                           ;A5EFCF;
    dw EnemyTouch_SporeSpawn                                             ;A5EFD7;
    dw CommonA5_CreateADudShot                                           ;A5EFD9;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5EFDB;
    dw EnemyTouch_SporeSpawn                                             ;A5EFE3;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5EFE5;
    dw $FFF0,$FFCA,$0010,$FFEA                                           ;A5EFE7;
    dw EnemyTouch_SporeSpawn                                             ;A5EFEF;
    dw CommonA5_CreateADudShot                                           ;A5EFF1;

Hitbox_SporeSpawn_4:
    dw $0004,$FFD5,$FFD4,$002A,$FFF3                                     ;A5EFF3;
    dw EnemyTouch_SporeSpawn                                             ;A5EFFD;
    dw CommonA5_CreateADudShot                                           ;A5EFFF;
    dw $FFD4,$000C,$002A,$002A                                           ;A5F001;
    dw EnemyTouch_SporeSpawn                                             ;A5F009;
    dw CommonA5_CreateADudShot                                           ;A5F00B;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F00D;
    dw EnemyTouch_SporeSpawn                                             ;A5F015;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F017;
    dw $FFF0,$FFC6,$0010,$FFD6                                           ;A5F019;
    dw EnemyTouch_SporeSpawn                                             ;A5F021;
    dw CommonA5_CreateADudShot                                           ;A5F023;

Hitbox_SporeSpawn_5:
    dw $0004,$FFD3,$FFD1,$002C,$FFEF                                     ;A5F025;
    dw EnemyTouch_SporeSpawn                                             ;A5F02F;
    dw CommonA5_CreateADudShot                                           ;A5F031;
    dw $FFD4,$0010,$002B,$002E                                           ;A5F033;
    dw EnemyTouch_SporeSpawn                                             ;A5F03B;
    dw CommonA5_CreateADudShot                                           ;A5F03D;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F03F;
    dw EnemyTouch_SporeSpawn                                             ;A5F047;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F049;
    dw $FFF0,$FFC2,$0010,$FFD3                                           ;A5F04B;
    dw EnemyTouch_SporeSpawn                                             ;A5F053;
    dw CommonA5_CreateADudShot                                           ;A5F055;

Hitbox_SporeSpawn_6:
    dw $0004,$FFD4,$FFCE,$002D,$FFEB                                     ;A5F057;
    dw EnemyTouch_SporeSpawn                                             ;A5F061;
    dw CommonA5_CreateADudShot                                           ;A5F063;
    dw $FFD5,$0014,$002B,$0032                                           ;A5F065;
    dw EnemyTouch_SporeSpawn                                             ;A5F06D;
    dw CommonA5_CreateADudShot                                           ;A5F06F;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F071;
    dw EnemyTouch_SporeSpawn                                             ;A5F079;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F07B;
    dw $FFF0,$FFC0,$0010,$FFD0                                           ;A5F07D;
    dw EnemyTouch_SporeSpawn                                             ;A5F085;
    dw CommonA5_CreateADudShot                                           ;A5F087;

Hitbox_SporeSpawn_7:
    dw $0002,$FFD2,$FFDD,$002C,$0023                                     ;A5F089;
    dw EnemyTouch_SporeSpawn                                             ;A5F093;
    dw CommonA5_CreateADudShot                                           ;A5F095;
    dw $FFF0,$FFD0,$0010,$FFE0                                           ;A5F097;
    dw EnemyTouch_SporeSpawn                                             ;A5F09F;
    dw CommonA5_CreateADudShot                                           ;A5F0A1;

Hitbox_SporeSpawn_8:
    dw $0004,$FFD3,$FFD9,$002D,$FFF7                                     ;A5F0A3;
    dw EnemyTouch_SporeSpawn                                             ;A5F0AD;
    dw CommonA5_CreateADudShot                                           ;A5F0AF;
    dw $FFD4,$0008,$002C,$0026                                           ;A5F0B1;
    dw EnemyTouch_SporeSpawn                                             ;A5F0B9;
    dw CommonA5_CreateADudShot                                           ;A5F0BB;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F0BD;
    dw EnemyTouch_SporeSpawn                                             ;A5F0C5;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F0C7;
    dw $FFF0,$FFCA,$0010,$FFE0                                           ;A5F0C9;
    dw EnemyTouch_SporeSpawn                                             ;A5F0D1;
    dw CommonA5_CreateADudShot                                           ;A5F0D3;

Hitbox_SporeSpawn_9:
    dw $0004,$FFD3,$FFD4,$002D,$FFF3                                     ;A5F0D5;
    dw EnemyTouch_SporeSpawn                                             ;A5F0DF;
    dw CommonA5_CreateADudShot                                           ;A5F0E1;
    dw $FFD6,$000C,$002A,$002B                                           ;A5F0E3;
    dw EnemyTouch_SporeSpawn                                             ;A5F0EB;
    dw CommonA5_CreateADudShot                                           ;A5F0ED;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F0EF;
    dw EnemyTouch_SporeSpawn                                             ;A5F0F7;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F0F9;
    dw $FFF0,$FFC6,$0010,$FFE0                                           ;A5F0FB;
    dw EnemyTouch_SporeSpawn                                             ;A5F103;
    dw CommonA5_CreateADudShot                                           ;A5F105;

Hitbox_SporeSpawn_A:
    dw $0004,$FFD4,$FFD1,$0029,$FFEF                                     ;A5F107;
    dw EnemyTouch_SporeSpawn                                             ;A5F111;
    dw CommonA5_CreateADudShot                                           ;A5F113;
    dw $FFD4,$0010,$002C,$002D                                           ;A5F115;
    dw EnemyTouch_SporeSpawn                                             ;A5F11D;
    dw CommonA5_CreateADudShot                                           ;A5F11F;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F121;
    dw EnemyTouch_SporeSpawn                                             ;A5F129;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F12B;
    dw $FFF0,$FFC3,$0010,$FFD2                                           ;A5F12D;
    dw EnemyTouch_SporeSpawn                                             ;A5F135;
    dw CommonA5_CreateADudShot                                           ;A5F137;

Hitbox_SporeSpawn_B:
    dw $0001,$FFF1,$FFE8,$000E,$0017                                     ;A5F139;
    dw EnemyTouch_SporeSpawn                                             ;A5F143;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F145;

Hitbox_SporeSpawn_C:
    dw $0001,$FFF1,$FFE8,$000E,$0017                                     ;A5F147;
    dw EnemyTouch_SporeSpawn                                             ;A5F151;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F153;

Hitbox_SporeSpawn_D:
    dw $0001,$FFF1,$FFE8,$000E,$0017                                     ;A5F155;
    dw EnemyTouch_SporeSpawn                                             ;A5F15F;
    dw CommonA5_CreateADudShot                                           ;A5F161;

Hitbox_SporeSpawn_E:
    dw $0001,$FFF8,$FFF8,$0007,$0007                                     ;A5F163;
    dw EnemyTouch_SporeSpawn                                             ;A5F16D;
    dw CommonA5_CreateADudShot                                           ;A5F16F;

Hitbox_SporeSpawn_F:
    dw $0001,$FFF8,$FFF8,$0007,$0006                                     ;A5F171;
    dw EnemyTouch_SporeSpawn                                             ;A5F17B;
    dw CommonA5_CreateADudShot                                           ;A5F17D;

Hitbox_SporeSpawn_10:
    dw $0001,$FFF8,$FFF8,$0007,$0006                                     ;A5F17F;
    dw EnemyTouch_SporeSpawn                                             ;A5F189;
    dw CommonA5_CreateADudShot                                           ;A5F18B;

Hitbox_SporeSpawn_11:
    dw $0001,$FFF8,$FFF8,$0007,$0006                                     ;A5F18D;
    dw EnemyTouch_SporeSpawn                                             ;A5F197;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F199;

Hitbox_SporeSpawn_12:
    dw $0001,$FFFC,$FFFC,$0003,$0003                                     ;A5F19B;
    dw EnemyTouch_SporeSpawn                                             ;A5F1A5;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F1A7;

Hitbox_SporeSpawn_13:
    dw $0004,$FFD4,$FFCB,$002C,$FFE9                                     ;A5F1A9;
    dw EnemyTouch_SporeSpawn                                             ;A5F1B3;
    dw CommonA5_CreateADudShot                                           ;A5F1B5;
    dw $FFD4,$0016,$002B,$0034                                           ;A5F1B7;
    dw EnemyTouch_SporeSpawn                                             ;A5F1BF;
    dw CommonA5_CreateADudShot                                           ;A5F1C1;
    dw $FFF1,$FFE8,$000E,$0017                                           ;A5F1C3;
    dw EnemyTouch_SporeSpawn                                             ;A5F1CB;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F1CD;
    dw $FFF0,$FFBC,$0010,$FFD0                                           ;A5F1CF;
    dw EnemyTouch_SporeSpawn                                             ;A5F1D7;
    dw CommonA5_CreateADudShot                                           ;A5F1D9;

Hitbox_SporeSpawn_14:
    dw $0004,$FFD4,$FFC9,$002B,$FFE7                                     ;A5F1DB;
    dw EnemyTouch_SporeSpawn                                             ;A5F1E5;
    dw CommonA5_CreateADudShot                                           ;A5F1E7;
    dw $FFD3,$0018,$002B,$0037                                           ;A5F1E9;
    dw EnemyTouch_SporeSpawn                                             ;A5F1F1;
    dw CommonA5_CreateADudShot                                           ;A5F1F3;
    dw $FFF1,$FFE7,$000E,$0018                                           ;A5F1F5;
    dw EnemyTouch_SporeSpawn                                             ;A5F1FD;
    dw EnemyShot_SporeSpawn_Vulnerable                                   ;A5F1FF;
    dw $FFF0,$FFBB,$0010,$FFD0                                           ;A5F201;
    dw EnemyTouch_SporeSpawn                                             ;A5F209;
    dw CommonA5_CreateADudShot                                           ;A5F20B;

Spritemap_SporeSpawn_0:
    dw $001A,$8000                                                       ;A5F20D;
    db $F0                                                               ;A5F211;
    dw $6124,$8010                                                       ;A5F212;
    db $F0                                                               ;A5F216;
    dw $6122,$8020                                                       ;A5F217;
    db $F0                                                               ;A5F21B;
    dw $6120,$8000                                                       ;A5F21C;
    db $E0                                                               ;A5F220;
    dw $6104,$8010                                                       ;A5F221;
    db $E0                                                               ;A5F225;
    dw $6102,$8020                                                       ;A5F226;
    db $E0                                                               ;A5F22A;
    dw $6100,$81F0                                                       ;A5F22B;
    db $F0                                                               ;A5F22F;
    dw $2124,$81E0                                                       ;A5F230;
    db $F0                                                               ;A5F234;
    dw $2122,$81D0                                                       ;A5F235;
    db $F0                                                               ;A5F239;
    dw $2120,$81F0                                                       ;A5F23A;
    db $E0                                                               ;A5F23E;
    dw $2104,$81E0                                                       ;A5F23F;
    db $E0                                                               ;A5F243;
    dw $2102,$81D0                                                       ;A5F244;
    db $E0                                                               ;A5F248;
    dw $2100,$8000                                                       ;A5F249;
    db $D2                                                               ;A5F24D;
    dw $6142,$81F0                                                       ;A5F24E;
    db $D2                                                               ;A5F252;
    dw $2142,$8000                                                       ;A5F253;
    db $10                                                               ;A5F257;
    dw $614E,$8010                                                       ;A5F258;
    db $10                                                               ;A5F25C;
    dw $614C,$8020                                                       ;A5F25D;
    db $10                                                               ;A5F261;
    dw $614A,$8000                                                       ;A5F262;
    db $00                                                               ;A5F266;
    dw $6148,$8010                                                       ;A5F267;
    db $00                                                               ;A5F26B;
    dw $6146,$8020                                                       ;A5F26C;
    db $00                                                               ;A5F270;
    dw $6144,$81F0                                                       ;A5F271;
    db $10                                                               ;A5F275;
    dw $214E,$81E0                                                       ;A5F276;
    db $10                                                               ;A5F27A;
    dw $214C,$81D0                                                       ;A5F27B;
    db $10                                                               ;A5F27F;
    dw $214A,$81F0                                                       ;A5F280;
    db $00                                                               ;A5F284;
    dw $2148,$81E0                                                       ;A5F285;
    db $00                                                               ;A5F289;
    dw $2146,$81D0                                                       ;A5F28A;
    db $00                                                               ;A5F28E;
    dw $2144                                                             ;A5F28F;

Spritemap_SporeSpawn_1:
    dw $001E,$8000                                                       ;A5F291;
    db $EC                                                               ;A5F295;
    dw $6124,$8010                                                       ;A5F296;
    db $EC                                                               ;A5F29A;
    dw $6122,$8020                                                       ;A5F29B;
    db $EC                                                               ;A5F29F;
    dw $6120,$8000                                                       ;A5F2A0;
    db $DC                                                               ;A5F2A4;
    dw $6104,$8010                                                       ;A5F2A5;
    db $DC                                                               ;A5F2A9;
    dw $6102,$8020                                                       ;A5F2AA;
    db $DC                                                               ;A5F2AE;
    dw $6100,$81F0                                                       ;A5F2AF;
    db $EC                                                               ;A5F2B3;
    dw $2124,$81E0                                                       ;A5F2B4;
    db $EC                                                               ;A5F2B8;
    dw $2122,$81D0                                                       ;A5F2B9;
    db $EC                                                               ;A5F2BD;
    dw $2120,$81F0                                                       ;A5F2BE;
    db $DC                                                               ;A5F2C2;
    dw $2104,$81E0                                                       ;A5F2C3;
    db $DC                                                               ;A5F2C7;
    dw $2102,$81D0                                                       ;A5F2C8;
    db $DC                                                               ;A5F2CC;
    dw $2100,$8000                                                       ;A5F2CD;
    db $CE                                                               ;A5F2D1;
    dw $6142,$81F0                                                       ;A5F2D2;
    db $CE                                                               ;A5F2D6;
    dw $2142,$8000                                                       ;A5F2D7;
    db $14                                                               ;A5F2DB;
    dw $614E,$8010                                                       ;A5F2DC;
    db $14                                                               ;A5F2E0;
    dw $614C,$8020                                                       ;A5F2E1;
    db $14                                                               ;A5F2E5;
    dw $614A,$8000                                                       ;A5F2E6;
    db $04                                                               ;A5F2EA;
    dw $6148,$8010                                                       ;A5F2EB;
    db $04                                                               ;A5F2EF;
    dw $6146,$8020                                                       ;A5F2F0;
    db $04                                                               ;A5F2F4;
    dw $6144,$81F0                                                       ;A5F2F5;
    db $14                                                               ;A5F2F9;
    dw $214E,$81E0                                                       ;A5F2FA;
    db $14                                                               ;A5F2FE;
    dw $214C,$81D0                                                       ;A5F2FF;
    db $14                                                               ;A5F303;
    dw $214A,$81F0                                                       ;A5F304;
    db $04                                                               ;A5F308;
    dw $2148,$81E0                                                       ;A5F309;
    db $04                                                               ;A5F30D;
    dw $2146,$81D0                                                       ;A5F30E;
    db $04                                                               ;A5F312;
    dw $2144,$0010                                                       ;A5F313;
    db $FC                                                               ;A5F317;
    dw $613F,$0024                                                       ;A5F318;
    db $FC                                                               ;A5F31C;
    dw $613F,$01D4                                                       ;A5F31D;
    db $FC                                                               ;A5F321;
    dw $213F,$01E8                                                       ;A5F322;
    db $FC                                                               ;A5F326;
    dw $213F                                                             ;A5F327;

Spritemap_SporeSpawn_2:
    dw $0022,$8000                                                       ;A5F329;
    db $E8                                                               ;A5F32D;
    dw $6124,$8010                                                       ;A5F32E;
    db $E8                                                               ;A5F332;
    dw $6122,$8020                                                       ;A5F333;
    db $E8                                                               ;A5F337;
    dw $6120,$8000                                                       ;A5F338;
    db $D8                                                               ;A5F33C;
    dw $6104,$8010                                                       ;A5F33D;
    db $D8                                                               ;A5F341;
    dw $6102,$8020                                                       ;A5F342;
    db $D8                                                               ;A5F346;
    dw $6100,$81F0                                                       ;A5F347;
    db $E8                                                               ;A5F34B;
    dw $2124,$81E0                                                       ;A5F34C;
    db $E8                                                               ;A5F350;
    dw $2122,$81D0                                                       ;A5F351;
    db $E8                                                               ;A5F355;
    dw $2120,$81F0                                                       ;A5F356;
    db $D8                                                               ;A5F35A;
    dw $2104,$81E0                                                       ;A5F35B;
    db $D8                                                               ;A5F35F;
    dw $2102,$81D0                                                       ;A5F360;
    db $D8                                                               ;A5F364;
    dw $2100,$8000                                                       ;A5F365;
    db $CA                                                               ;A5F369;
    dw $6142,$81F0                                                       ;A5F36A;
    db $CA                                                               ;A5F36E;
    dw $2142,$0024                                                       ;A5F36F;
    db $00                                                               ;A5F373;
    dw $6161,$000E                                                       ;A5F374;
    db $00                                                               ;A5F378;
    dw $6161,$01EA                                                       ;A5F379;
    db $00                                                               ;A5F37D;
    dw $2161,$01D5                                                       ;A5F37E;
    db $00                                                               ;A5F382;
    dw $2161,$0024                                                       ;A5F383;
    db $F8                                                               ;A5F387;
    dw $6160,$000E                                                       ;A5F388;
    db $F8                                                               ;A5F38C;
    dw $6160,$01EA                                                       ;A5F38D;
    db $F8                                                               ;A5F391;
    dw $2160,$01D5                                                       ;A5F392;
    db $F8                                                               ;A5F396;
    dw $2160,$8000                                                       ;A5F397;
    db $18                                                               ;A5F39B;
    dw $614E,$8010                                                       ;A5F39C;
    db $18                                                               ;A5F3A0;
    dw $614C,$8020                                                       ;A5F3A1;
    db $18                                                               ;A5F3A5;
    dw $614A,$8000                                                       ;A5F3A6;
    db $08                                                               ;A5F3AA;
    dw $6148,$8010                                                       ;A5F3AB;
    db $08                                                               ;A5F3AF;
    dw $6146,$8020                                                       ;A5F3B0;
    db $08                                                               ;A5F3B4;
    dw $6144,$81F0                                                       ;A5F3B5;
    db $18                                                               ;A5F3B9;
    dw $214E,$81E0                                                       ;A5F3BA;
    db $18                                                               ;A5F3BE;
    dw $214C,$81D0                                                       ;A5F3BF;
    db $18                                                               ;A5F3C3;
    dw $214A,$81F0                                                       ;A5F3C4;
    db $08                                                               ;A5F3C8;
    dw $2148,$81E0                                                       ;A5F3C9;
    db $08                                                               ;A5F3CD;
    dw $2146,$81D0                                                       ;A5F3CE;
    db $08                                                               ;A5F3D2;
    dw $2144                                                             ;A5F3D3;

Spritemap_SporeSpawn_3:
    dw $0022,$8000                                                       ;A5F3D5;
    db $E4                                                               ;A5F3D9;
    dw $6124,$8010                                                       ;A5F3DA;
    db $E4                                                               ;A5F3DE;
    dw $6122,$8020                                                       ;A5F3DF;
    db $E4                                                               ;A5F3E3;
    dw $6120,$8000                                                       ;A5F3E4;
    db $D4                                                               ;A5F3E8;
    dw $6104,$8010                                                       ;A5F3E9;
    db $D4                                                               ;A5F3ED;
    dw $6102,$8020                                                       ;A5F3EE;
    db $D4                                                               ;A5F3F2;
    dw $6100,$81F0                                                       ;A5F3F3;
    db $E4                                                               ;A5F3F7;
    dw $2124,$81E0                                                       ;A5F3F8;
    db $E4                                                               ;A5F3FC;
    dw $2122,$81D0                                                       ;A5F3FD;
    db $E4                                                               ;A5F401;
    dw $2120,$81F0                                                       ;A5F402;
    db $D4                                                               ;A5F406;
    dw $2104,$81E0                                                       ;A5F407;
    db $D4                                                               ;A5F40B;
    dw $2102,$81D0                                                       ;A5F40C;
    db $D4                                                               ;A5F410;
    dw $2100,$8000                                                       ;A5F411;
    db $C6                                                               ;A5F415;
    dw $6142,$81F0                                                       ;A5F416;
    db $C6                                                               ;A5F41A;
    dw $2142,$0020                                                       ;A5F41B;
    db $04                                                               ;A5F41F;
    dw $6163,$000C                                                       ;A5F420;
    db $04                                                               ;A5F424;
    dw $6163,$01EC                                                       ;A5F425;
    db $04                                                               ;A5F429;
    dw $2163,$01D8                                                       ;A5F42A;
    db $04                                                               ;A5F42E;
    dw $2163,$0020                                                       ;A5F42F;
    db $F4                                                               ;A5F433;
    dw $6162,$000C                                                       ;A5F434;
    db $F4                                                               ;A5F438;
    dw $6162,$01EC                                                       ;A5F439;
    db $F4                                                               ;A5F43D;
    dw $2162,$01D8                                                       ;A5F43E;
    db $F4                                                               ;A5F442;
    dw $2162,$8000                                                       ;A5F443;
    db $1C                                                               ;A5F447;
    dw $614E,$8010                                                       ;A5F448;
    db $1C                                                               ;A5F44C;
    dw $614C,$8020                                                       ;A5F44D;
    db $1C                                                               ;A5F451;
    dw $614A,$8000                                                       ;A5F452;
    db $0C                                                               ;A5F456;
    dw $6148,$8010                                                       ;A5F457;
    db $0C                                                               ;A5F45B;
    dw $6146,$8020                                                       ;A5F45C;
    db $0C                                                               ;A5F460;
    dw $6144,$81F0                                                       ;A5F461;
    db $1C                                                               ;A5F465;
    dw $214E,$81E0                                                       ;A5F466;
    db $1C                                                               ;A5F46A;
    dw $214C,$81D0                                                       ;A5F46B;
    db $1C                                                               ;A5F46F;
    dw $214A,$81F0                                                       ;A5F470;
    db $0C                                                               ;A5F474;
    dw $2148,$81E0                                                       ;A5F475;
    db $0C                                                               ;A5F479;
    dw $2146,$81D0                                                       ;A5F47A;
    db $0C                                                               ;A5F47E;
    dw $2144                                                             ;A5F47F;

Spritemap_SporeSpawn_4:
    dw $0022,$8000                                                       ;A5F481;
    db $D0                                                               ;A5F485;
    dw $6104,$8010                                                       ;A5F486;
    db $D0                                                               ;A5F48A;
    dw $6102,$8020                                                       ;A5F48B;
    db $D0                                                               ;A5F48F;
    dw $6100,$81F0                                                       ;A5F490;
    db $D0                                                               ;A5F494;
    dw $2104,$81E0                                                       ;A5F495;
    db $D0                                                               ;A5F499;
    dw $2102,$81D0                                                       ;A5F49A;
    db $D0                                                               ;A5F49E;
    dw $2100,$8000                                                       ;A5F49F;
    db $E0                                                               ;A5F4A3;
    dw $6124,$8010                                                       ;A5F4A4;
    db $E0                                                               ;A5F4A8;
    dw $6122,$8020                                                       ;A5F4A9;
    db $E0                                                               ;A5F4AD;
    dw $6120,$81F0                                                       ;A5F4AE;
    db $E0                                                               ;A5F4B2;
    dw $2124,$81E0                                                       ;A5F4B3;
    db $E0                                                               ;A5F4B7;
    dw $2122,$81D0                                                       ;A5F4B8;
    db $E0                                                               ;A5F4BC;
    dw $2120,$8000                                                       ;A5F4BD;
    db $C2                                                               ;A5F4C1;
    dw $6142,$81F0                                                       ;A5F4C2;
    db $C2                                                               ;A5F4C6;
    dw $2142,$001F                                                       ;A5F4C7;
    db $08                                                               ;A5F4CB;
    dw $6165,$000B                                                       ;A5F4CC;
    db $08                                                               ;A5F4D0;
    dw $6165,$01ED                                                       ;A5F4D1;
    db $08                                                               ;A5F4D5;
    dw $2165,$01D9                                                       ;A5F4D6;
    db $08                                                               ;A5F4DA;
    dw $2165,$001F                                                       ;A5F4DB;
    db $F0                                                               ;A5F4DF;
    dw $6164,$000B                                                       ;A5F4E0;
    db $F0                                                               ;A5F4E4;
    dw $6164,$01ED                                                       ;A5F4E5;
    db $F0                                                               ;A5F4E9;
    dw $2164,$01D9                                                       ;A5F4EA;
    db $F0                                                               ;A5F4EE;
    dw $2164,$8000                                                       ;A5F4EF;
    db $20                                                               ;A5F4F3;
    dw $614E,$8010                                                       ;A5F4F4;
    db $20                                                               ;A5F4F8;
    dw $614C,$8020                                                       ;A5F4F9;
    db $20                                                               ;A5F4FD;
    dw $614A,$8000                                                       ;A5F4FE;
    db $10                                                               ;A5F502;
    dw $6148,$8010                                                       ;A5F503;
    db $10                                                               ;A5F507;
    dw $6146,$8020                                                       ;A5F508;
    db $10                                                               ;A5F50C;
    dw $6144,$81F0                                                       ;A5F50D;
    db $20                                                               ;A5F511;
    dw $214E,$81E0                                                       ;A5F512;
    db $20                                                               ;A5F516;
    dw $214C,$81D0                                                       ;A5F517;
    db $20                                                               ;A5F51B;
    dw $214A,$81F0                                                       ;A5F51C;
    db $10                                                               ;A5F520;
    dw $2148,$81E0                                                       ;A5F521;
    db $10                                                               ;A5F525;
    dw $2146,$81D0                                                       ;A5F526;
    db $10                                                               ;A5F52A;
    dw $2144                                                             ;A5F52B;

Spritemap_SporeSpawn_5:
    dw $001A,$8000                                                       ;A5F52D;
    db $CC                                                               ;A5F531;
    dw $6104,$8010                                                       ;A5F532;
    db $CC                                                               ;A5F536;
    dw $6102,$8020                                                       ;A5F537;
    db $CC                                                               ;A5F53B;
    dw $6100,$81F0                                                       ;A5F53C;
    db $CC                                                               ;A5F540;
    dw $2104,$81E0                                                       ;A5F541;
    db $CC                                                               ;A5F545;
    dw $2102,$81D0                                                       ;A5F546;
    db $CC                                                               ;A5F54A;
    dw $2100,$8000                                                       ;A5F54B;
    db $BE                                                               ;A5F54F;
    dw $6142,$81F0                                                       ;A5F550;
    db $BE                                                               ;A5F554;
    dw $2142,$8000                                                       ;A5F555;
    db $24                                                               ;A5F559;
    dw $614E,$8010                                                       ;A5F55A;
    db $24                                                               ;A5F55E;
    dw $614C,$8020                                                       ;A5F55F;
    db $24                                                               ;A5F563;
    dw $614A,$8000                                                       ;A5F564;
    db $14                                                               ;A5F568;
    dw $6148,$8010                                                       ;A5F569;
    db $14                                                               ;A5F56D;
    dw $6146,$8020                                                       ;A5F56E;
    db $14                                                               ;A5F572;
    dw $6144,$81F0                                                       ;A5F573;
    db $24                                                               ;A5F577;
    dw $214E,$81E0                                                       ;A5F578;
    db $24                                                               ;A5F57C;
    dw $214C,$81D0                                                       ;A5F57D;
    db $24                                                               ;A5F581;
    dw $214A,$81F0                                                       ;A5F582;
    db $14                                                               ;A5F586;
    dw $2148,$81E0                                                       ;A5F587;
    db $14                                                               ;A5F58B;
    dw $2146,$81D0                                                       ;A5F58C;
    db $14                                                               ;A5F590;
    dw $2144,$8000                                                       ;A5F591;
    db $DC                                                               ;A5F595;
    dw $6124,$8010                                                       ;A5F596;
    db $DC                                                               ;A5F59A;
    dw $6122,$8020                                                       ;A5F59B;
    db $DC                                                               ;A5F59F;
    dw $6120,$81F0                                                       ;A5F5A0;
    db $DC                                                               ;A5F5A4;
    dw $2124,$81E0                                                       ;A5F5A5;
    db $DC                                                               ;A5F5A9;
    dw $2122,$81D0                                                       ;A5F5AA;
    db $DC                                                               ;A5F5AE;
    dw $2120                                                             ;A5F5AF;

Spritemap_SporeSpawn_6:
    dw $001A,$8000                                                       ;A5F5B1;
    db $DC                                                               ;A5F5B5;
    dw $6104,$8010                                                       ;A5F5B6;
    db $DC                                                               ;A5F5BA;
    dw $6102,$8020                                                       ;A5F5BB;
    db $DC                                                               ;A5F5BF;
    dw $6100,$81F0                                                       ;A5F5C0;
    db $DC                                                               ;A5F5C4;
    dw $2104,$81E0                                                       ;A5F5C5;
    db $DC                                                               ;A5F5C9;
    dw $2102,$81D0                                                       ;A5F5CA;
    db $DC                                                               ;A5F5CE;
    dw $2100,$8000                                                       ;A5F5CF;
    db $CE                                                               ;A5F5D3;
    dw $6142,$81F0                                                       ;A5F5D4;
    db $CE                                                               ;A5F5D8;
    dw $2142,$8000                                                       ;A5F5D9;
    db $14                                                               ;A5F5DD;
    dw $614E,$8010                                                       ;A5F5DE;
    db $14                                                               ;A5F5E2;
    dw $614C,$8020                                                       ;A5F5E3;
    db $14                                                               ;A5F5E7;
    dw $614A,$8000                                                       ;A5F5E8;
    db $04                                                               ;A5F5EC;
    dw $6148,$8010                                                       ;A5F5ED;
    db $04                                                               ;A5F5F1;
    dw $6146,$8020                                                       ;A5F5F2;
    db $04                                                               ;A5F5F6;
    dw $6144,$81F0                                                       ;A5F5F7;
    db $14                                                               ;A5F5FB;
    dw $214E,$81E0                                                       ;A5F5FC;
    db $14                                                               ;A5F600;
    dw $214C,$81D0                                                       ;A5F601;
    db $14                                                               ;A5F605;
    dw $214A,$81F0                                                       ;A5F606;
    db $04                                                               ;A5F60A;
    dw $2148,$81E0                                                       ;A5F60B;
    db $04                                                               ;A5F60F;
    dw $2146,$81D0                                                       ;A5F610;
    db $04                                                               ;A5F614;
    dw $2144,$8000                                                       ;A5F615;
    db $EC                                                               ;A5F619;
    dw $6124,$8010                                                       ;A5F61A;
    db $EC                                                               ;A5F61E;
    dw $6122,$8020                                                       ;A5F61F;
    db $EC                                                               ;A5F623;
    dw $6120,$81F0                                                       ;A5F624;
    db $EC                                                               ;A5F628;
    dw $2124,$81E0                                                       ;A5F629;
    db $EC                                                               ;A5F62D;
    dw $2122,$81D0                                                       ;A5F62E;
    db $EC                                                               ;A5F632;
    dw $2120                                                             ;A5F633;

Spritemap_SporeSpawn_7:
    dw $001A,$8000                                                       ;A5F635;
    db $D8                                                               ;A5F639;
    dw $6104,$8010                                                       ;A5F63A;
    db $D8                                                               ;A5F63E;
    dw $6102,$8020                                                       ;A5F63F;
    db $D8                                                               ;A5F643;
    dw $6100,$81F0                                                       ;A5F644;
    db $D8                                                               ;A5F648;
    dw $2104,$81E0                                                       ;A5F649;
    db $D8                                                               ;A5F64D;
    dw $2102,$81D0                                                       ;A5F64E;
    db $D8                                                               ;A5F652;
    dw $2100,$8000                                                       ;A5F653;
    db $CA                                                               ;A5F657;
    dw $6142,$81F0                                                       ;A5F658;
    db $CA                                                               ;A5F65C;
    dw $2142,$8000                                                       ;A5F65D;
    db $18                                                               ;A5F661;
    dw $614E,$8010                                                       ;A5F662;
    db $18                                                               ;A5F666;
    dw $614C,$8020                                                       ;A5F667;
    db $18                                                               ;A5F66B;
    dw $614A,$8000                                                       ;A5F66C;
    db $08                                                               ;A5F670;
    dw $6148,$8010                                                       ;A5F671;
    db $08                                                               ;A5F675;
    dw $6146,$8020                                                       ;A5F676;
    db $08                                                               ;A5F67A;
    dw $6144,$81F0                                                       ;A5F67B;
    db $18                                                               ;A5F67F;
    dw $214E,$81E0                                                       ;A5F680;
    db $18                                                               ;A5F684;
    dw $214C,$81D0                                                       ;A5F685;
    db $18                                                               ;A5F689;
    dw $214A,$81F0                                                       ;A5F68A;
    db $08                                                               ;A5F68E;
    dw $2148,$81E0                                                       ;A5F68F;
    db $08                                                               ;A5F693;
    dw $2146,$81D0                                                       ;A5F694;
    db $08                                                               ;A5F698;
    dw $2144,$8000                                                       ;A5F699;
    db $E8                                                               ;A5F69D;
    dw $6124,$8010                                                       ;A5F69E;
    db $E8                                                               ;A5F6A2;
    dw $6122,$8020                                                       ;A5F6A3;
    db $E8                                                               ;A5F6A7;
    dw $6120,$81F0                                                       ;A5F6A8;
    db $E8                                                               ;A5F6AC;
    dw $2124,$81E0                                                       ;A5F6AD;
    db $E8                                                               ;A5F6B1;
    dw $2122,$81D0                                                       ;A5F6B2;
    db $E8                                                               ;A5F6B6;
    dw $2120                                                             ;A5F6B7;

Spritemap_SporeSpawn_8:
    dw $001A,$8000                                                       ;A5F6B9;
    db $E4                                                               ;A5F6BD;
    dw $6124,$8010                                                       ;A5F6BE;
    db $E4                                                               ;A5F6C2;
    dw $6122,$8020                                                       ;A5F6C3;
    db $E4                                                               ;A5F6C7;
    dw $6120,$8000                                                       ;A5F6C8;
    db $D4                                                               ;A5F6CC;
    dw $6104,$8010                                                       ;A5F6CD;
    db $D4                                                               ;A5F6D1;
    dw $6102,$8020                                                       ;A5F6D2;
    db $D4                                                               ;A5F6D6;
    dw $6100,$81F0                                                       ;A5F6D7;
    db $E4                                                               ;A5F6DB;
    dw $2124,$81E0                                                       ;A5F6DC;
    db $E4                                                               ;A5F6E0;
    dw $2122,$81D0                                                       ;A5F6E1;
    db $E4                                                               ;A5F6E5;
    dw $2120,$81F0                                                       ;A5F6E6;
    db $D4                                                               ;A5F6EA;
    dw $2104,$81E0                                                       ;A5F6EB;
    db $D4                                                               ;A5F6EF;
    dw $2102,$81D0                                                       ;A5F6F0;
    db $D4                                                               ;A5F6F4;
    dw $2100,$8000                                                       ;A5F6F5;
    db $C6                                                               ;A5F6F9;
    dw $6142,$81F0                                                       ;A5F6FA;
    db $C6                                                               ;A5F6FE;
    dw $2142,$8000                                                       ;A5F6FF;
    db $1C                                                               ;A5F703;
    dw $614E,$8010                                                       ;A5F704;
    db $1C                                                               ;A5F708;
    dw $614C,$8020                                                       ;A5F709;
    db $1C                                                               ;A5F70D;
    dw $614A,$8000                                                       ;A5F70E;
    db $0C                                                               ;A5F712;
    dw $6148,$8010                                                       ;A5F713;
    db $0C                                                               ;A5F717;
    dw $6146,$8020                                                       ;A5F718;
    db $0C                                                               ;A5F71C;
    dw $6144,$81F0                                                       ;A5F71D;
    db $1C                                                               ;A5F721;
    dw $214E,$81E0                                                       ;A5F722;
    db $1C                                                               ;A5F726;
    dw $214C,$81D0                                                       ;A5F727;
    db $1C                                                               ;A5F72B;
    dw $214A,$81F0                                                       ;A5F72C;
    db $0C                                                               ;A5F730;
    dw $2148,$81E0                                                       ;A5F731;
    db $0C                                                               ;A5F735;
    dw $2146,$81D0                                                       ;A5F736;
    db $0C                                                               ;A5F73A;
    dw $2144                                                             ;A5F73B;

Spritemap_SporeSpawn_A:
    dw $001A,$8000                                                       ;A5F73D;
    db $E0                                                               ;A5F741;
    dw $6124,$8010                                                       ;A5F742;
    db $E0                                                               ;A5F746;
    dw $6122,$8020                                                       ;A5F747;
    db $E0                                                               ;A5F74B;
    dw $6120,$8000                                                       ;A5F74C;
    db $D0                                                               ;A5F750;
    dw $6104,$8010                                                       ;A5F751;
    db $D0                                                               ;A5F755;
    dw $6102,$8020                                                       ;A5F756;
    db $D0                                                               ;A5F75A;
    dw $6100,$81F0                                                       ;A5F75B;
    db $E0                                                               ;A5F75F;
    dw $2124,$81E0                                                       ;A5F760;
    db $E0                                                               ;A5F764;
    dw $2122,$81D0                                                       ;A5F765;
    db $E0                                                               ;A5F769;
    dw $2120,$81F0                                                       ;A5F76A;
    db $D0                                                               ;A5F76E;
    dw $2104,$81E0                                                       ;A5F76F;
    db $D0                                                               ;A5F773;
    dw $2102,$81D0                                                       ;A5F774;
    db $D0                                                               ;A5F778;
    dw $2100,$8000                                                       ;A5F779;
    db $C2                                                               ;A5F77D;
    dw $6142,$81F0                                                       ;A5F77E;
    db $C2                                                               ;A5F782;
    dw $2142,$8000                                                       ;A5F783;
    db $20                                                               ;A5F787;
    dw $614E,$8010                                                       ;A5F788;
    db $20                                                               ;A5F78C;
    dw $614C,$8020                                                       ;A5F78D;
    db $20                                                               ;A5F791;
    dw $614A,$8000                                                       ;A5F792;
    db $10                                                               ;A5F796;
    dw $6148,$8010                                                       ;A5F797;
    db $10                                                               ;A5F79B;
    dw $6146,$8020                                                       ;A5F79C;
    db $10                                                               ;A5F7A0;
    dw $6144,$81F0                                                       ;A5F7A1;
    db $20                                                               ;A5F7A5;
    dw $214E,$81E0                                                       ;A5F7A6;
    db $20                                                               ;A5F7AA;
    dw $214C,$81D0                                                       ;A5F7AB;
    db $20                                                               ;A5F7AF;
    dw $214A,$81F0                                                       ;A5F7B0;
    db $10                                                               ;A5F7B4;
    dw $2148,$81E0                                                       ;A5F7B5;
    db $10                                                               ;A5F7B9;
    dw $2146,$81D0                                                       ;A5F7BA;
    db $10                                                               ;A5F7BE;
    dw $2144                                                             ;A5F7BF;

Spritemap_SporeSpawn_B:
    dw $0006,$8000                                                       ;A5F7C1;
    db $F8                                                               ;A5F7C5;
    dw $6106,$81F0                                                       ;A5F7C6;
    db $F8                                                               ;A5F7CA;
    dw $2106,$8000                                                       ;A5F7CB;
    db $E8                                                               ;A5F7CF;
    dw $E126,$8000                                                       ;A5F7D0;
    db $08                                                               ;A5F7D4;
    dw $6126,$81F0                                                       ;A5F7D5;
    db $E8                                                               ;A5F7D9;
    dw $A126,$81F0                                                       ;A5F7DA;
    db $08                                                               ;A5F7DE;
    dw $2126                                                             ;A5F7DF;

Spritemap_SporeSpawn_C:
    dw $0006,$8000                                                       ;A5F7E1;
    db $F8                                                               ;A5F7E5;
    dw $6108,$81F0                                                       ;A5F7E6;
    db $F8                                                               ;A5F7EA;
    dw $2108,$8000                                                       ;A5F7EB;
    db $E8                                                               ;A5F7EF;
    dw $E128,$81F0                                                       ;A5F7F0;
    db $E8                                                               ;A5F7F4;
    dw $A128,$8000                                                       ;A5F7F5;
    db $08                                                               ;A5F7F9;
    dw $6128,$81F0                                                       ;A5F7FA;
    db $08                                                               ;A5F7FE;
    dw $2128                                                             ;A5F7FF;

Spritemap_SporeSpawn_D:
    dw $0006,$8000                                                       ;A5F801;
    db $F8                                                               ;A5F805;
    dw $610A,$81F0                                                       ;A5F806;
    db $F8                                                               ;A5F80A;
    dw $210A,$8000                                                       ;A5F80B;
    db $E8                                                               ;A5F80F;
    dw $E12A,$81F0                                                       ;A5F810;
    db $E8                                                               ;A5F814;
    dw $A12A,$8000                                                       ;A5F815;
    db $08                                                               ;A5F819;
    dw $612A,$81F0                                                       ;A5F81A;
    db $08                                                               ;A5F81E;
    dw $212A                                                             ;A5F81F;

Spritemap_SporeSpawn_E:
    dw $0001,$81F8                                                       ;A5F821;
    db $F8                                                               ;A5F825;
    dw $2140                                                             ;A5F826;

Spritemap_SporeSpawn_F:
    dw $0001,$81F8                                                       ;A5F828;
    db $F8                                                               ;A5F82C;
    dw $210C                                                             ;A5F82D;

Spritemap_SporeSpawn_10:
    dw $0001,$81F8                                                       ;A5F82F;
    db $F8                                                               ;A5F833;
    dw $210E                                                             ;A5F834;

Spritemap_SporeSpawn_11:
    dw $0001,$81F8                                                       ;A5F836;
    db $F8                                                               ;A5F83A;
    dw $212C                                                             ;A5F83B;

Spritemap_SporeSpawn_12:
    dw $0001,$01FC                                                       ;A5F83D;
    db $FC                                                               ;A5F841;
    dw $213E                                                             ;A5F842;

Spritemap_SporeSpawn_13:
    dw $0001,$01FC                                                       ;A5F844;
    db $FC                                                               ;A5F848;
    dw $212F                                                             ;A5F849;

Spritemap_SporeSpawn_14:
    dw $0001,$01FC                                                       ;A5F84B;
    db $FC                                                               ;A5F84F;
    dw $212E                                                             ;A5F850;

Spritemap_SporeSpawn_15:
    dw $001A,$8000                                                       ;A5F852;
    db $DA                                                               ;A5F856;
    dw $6124,$8010                                                       ;A5F857;
    db $DA                                                               ;A5F85B;
    dw $6122,$8020                                                       ;A5F85C;
    db $DA                                                               ;A5F860;
    dw $6120,$8000                                                       ;A5F861;
    db $CA                                                               ;A5F865;
    dw $6104,$8010                                                       ;A5F866;
    db $CA                                                               ;A5F86A;
    dw $6102,$8020                                                       ;A5F86B;
    db $CA                                                               ;A5F86F;
    dw $6100,$81F0                                                       ;A5F870;
    db $DA                                                               ;A5F874;
    dw $2124,$81E0                                                       ;A5F875;
    db $DA                                                               ;A5F879;
    dw $2122,$81D0                                                       ;A5F87A;
    db $DA                                                               ;A5F87E;
    dw $2120,$81F0                                                       ;A5F87F;
    db $CA                                                               ;A5F883;
    dw $2104,$81E0                                                       ;A5F884;
    db $CA                                                               ;A5F888;
    dw $2102,$81D0                                                       ;A5F889;
    db $CA                                                               ;A5F88D;
    dw $2100,$8000                                                       ;A5F88E;
    db $BC                                                               ;A5F892;
    dw $6142,$81F0                                                       ;A5F893;
    db $BC                                                               ;A5F897;
    dw $2142,$8000                                                       ;A5F898;
    db $26                                                               ;A5F89C;
    dw $614E,$8010                                                       ;A5F89D;
    db $26                                                               ;A5F8A1;
    dw $614C,$8020                                                       ;A5F8A2;
    db $26                                                               ;A5F8A6;
    dw $614A,$8000                                                       ;A5F8A7;
    db $16                                                               ;A5F8AB;
    dw $6148,$8010                                                       ;A5F8AC;
    db $16                                                               ;A5F8B0;
    dw $6146,$8020                                                       ;A5F8B1;
    db $16                                                               ;A5F8B5;
    dw $6144,$81F0                                                       ;A5F8B6;
    db $26                                                               ;A5F8BA;
    dw $214E,$81E0                                                       ;A5F8BB;
    db $26                                                               ;A5F8BF;
    dw $214C,$81D0                                                       ;A5F8C0;
    db $26                                                               ;A5F8C4;
    dw $214A,$81F0                                                       ;A5F8C5;
    db $16                                                               ;A5F8C9;
    dw $2148,$81E0                                                       ;A5F8CA;
    db $16                                                               ;A5F8CE;
    dw $2146,$81D0                                                       ;A5F8CF;
    db $16                                                               ;A5F8D3;
    dw $2144                                                             ;A5F8D4;

Spritemap_SporeSpawn_16:
    dw $001A,$8000                                                       ;A5F8D6;
    db $C8                                                               ;A5F8DA;
    dw $6104,$8010                                                       ;A5F8DB;
    db $C8                                                               ;A5F8DF;
    dw $6102,$81F0                                                       ;A5F8E0;
    db $C8                                                               ;A5F8E4;
    dw $2104,$81E0                                                       ;A5F8E5;
    db $C8                                                               ;A5F8E9;
    dw $2102,$81D0                                                       ;A5F8EA;
    db $C8                                                               ;A5F8EE;
    dw $2100,$8000                                                       ;A5F8EF;
    db $BA                                                               ;A5F8F3;
    dw $6142,$81F0                                                       ;A5F8F4;
    db $BA                                                               ;A5F8F8;
    dw $2142,$8000                                                       ;A5F8F9;
    db $28                                                               ;A5F8FD;
    dw $614E,$8010                                                       ;A5F8FE;
    db $28                                                               ;A5F902;
    dw $614C,$8020                                                       ;A5F903;
    db $28                                                               ;A5F907;
    dw $614A,$8000                                                       ;A5F908;
    db $18                                                               ;A5F90C;
    dw $6148,$8010                                                       ;A5F90D;
    db $18                                                               ;A5F911;
    dw $6146,$8020                                                       ;A5F912;
    db $18                                                               ;A5F916;
    dw $6144,$81F0                                                       ;A5F917;
    db $28                                                               ;A5F91B;
    dw $214E,$81E0                                                       ;A5F91C;
    db $28                                                               ;A5F920;
    dw $214C,$81D0                                                       ;A5F921;
    db $28                                                               ;A5F925;
    dw $214A,$81F0                                                       ;A5F926;
    db $18                                                               ;A5F92A;
    dw $2148,$81E0                                                       ;A5F92B;
    db $18                                                               ;A5F92F;
    dw $2146,$81D0                                                       ;A5F930;
    db $18                                                               ;A5F934;
    dw $2144,$8000                                                       ;A5F935;
    db $D8                                                               ;A5F939;
    dw $6124,$8010                                                       ;A5F93A;
    db $D8                                                               ;A5F93E;
    dw $6122,$8020                                                       ;A5F93F;
    db $D8                                                               ;A5F943;
    dw $6120,$8020                                                       ;A5F944;
    db $C8                                                               ;A5F948;
    dw $6100,$81F0                                                       ;A5F949;
    db $D8                                                               ;A5F94D;
    dw $2124,$81E0                                                       ;A5F94E;
    db $D8                                                               ;A5F952;
    dw $2122,$81D0                                                       ;A5F953;
    db $D8                                                               ;A5F957;
    dw $2120                                                             ;A5F958;

Freespace_BankA5_F95A:                                                   ;A5F95A;
; $6A6 bytes
