Debug_GameOverMenu:
    REP #$30                                                             ;818CF4;
    PHB                                                                  ;818CF6;
    PHK                                                                  ;818CF7;
    PLB                                                                  ;818CF8;
    LDA.W $0727                                                          ;818CF9;
    ASL A                                                                ;818CFC;
    TAX                                                                  ;818CFD;
    JSR.W (.pointers,X)                                                  ;818CFE;
    PLB                                                                  ;818D01;
    RTL                                                                  ;818D02;


.pointers:
    dw Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu        ;818D03;
    dw Debug_GameOverMenu_Index1_Initialise                              ;818D05;
    dw Debug_GameOverMenu_Index24_FadeIn                                 ;818D07;
    dw DebugGameOverMenu_Index3_Main                                     ;818D09;
    dw Debug_GameOverMenu_Index24_FadeIn                                 ;818D0B;
    dw DebugGameOverMenu_Index5_Continue                                 ;818D0D;

Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu:
    REP #$30                                                             ;818D0F;
    JSL.L HandleFadingOut                                                ;818D11;
    LDA.B $51                                                            ;818D15;
    AND.W #$000F                                                         ;818D17;
    BEQ +                                                                ;818D1A;
    RTS                                                                  ;818D1C;


  + JSL.L SetForceBlankAndWaitForNMI                                     ;818D1D;
    LDA.W #$0001                                                         ;818D21;
    JSL.L QueueSound_Lib3_Max6                                           ;818D24;
    JSL.L Disable_HDMAObjects                                            ;818D28;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;818D2C;
    LDX.W #$0000                                                         ;818D30;

.loopPalettes:
    LDA.L $7EC000,X                                                      ;818D33;
    STA.L $7E3300,X                                                      ;818D37;
    INX                                                                  ;818D3B;
    INX                                                                  ;818D3C;
    CPX.W #$0200                                                         ;818D3D;
    BMI .loopPalettes                                                    ;818D40;
    LDX.W #$0000                                                         ;818D42;

.loopIORegisterMirrors:
    LDA.B $51,X                                                          ;818D45;
    STA.L $7E3500,X                                                      ;818D47;
    INX                                                                  ;818D4B;
    INX                                                                  ;818D4C;
    CPX.W #$0036                                                         ;818D4D;
    BMI .loopIORegisterMirrors                                           ;818D50;
    JSR.W MapVRAMForMenu                                                 ;818D52;
    JSR.W LoadInitialMenuTiles                                           ;818D55;
    REP #$30                                                             ;818D58;
    STZ.B $B1                                                            ;818D5A;
    STZ.B $B5                                                            ;818D5C;
    STZ.B $B9                                                            ;818D5E;
    STZ.B $B3                                                            ;818D60;
    STZ.B $B7                                                            ;818D62;
    STZ.B $BB                                                            ;818D64;
    JSR.W LoadMenuPalettes                                               ;818D66;
    INC.W $0727                                                          ;818D69;
    RTS                                                                  ;818D6C;


Debug_GameOverMenu_Index1_Initialise:
    REP #$30                                                             ;818D6D;
    LDA.W #$0000                                                         ;818D6F;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;818D72;
    LDA.W #$FF03                                                         ;818D76;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;818D79;
    SEP #$20                                                             ;818D7D;
    LDA.B #$11                                                           ;818D7F;
    STA.B $69                                                            ;818D81;
    REP #$30                                                             ;818D83;
    LDA.W #Debug_GameOverMenu_VRAMTransferDefinitions                    ;818D85;
    STA.B $00                                                            ;818D88;
    LDA.W #Debug_GameOverMenu_VRAMTransferDefinitions>>16                ;818D8A;
    STA.B $02                                                            ;818D8D;
    JSL.L LoadDebugGameOverMenuTilemap                                   ;818D8F;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;818D93;
    INC.W $0727                                                          ;818D97;
    STZ.W $0723                                                          ;818D9A;
    STZ.W $0725                                                          ;818D9D;
    STZ.W $0950                                                          ;818DA0;
    RTS                                                                  ;818DA3;


UNUSED_818DA4:
    dw $000F                                                             ;818DA4;

Debug_GameOverMenu_Index24_FadeIn:
    REP #$30                                                             ;818DA6;
    JSL.L HandleFadingIn                                                 ;818DA8;
    LDA.B $51                                                            ;818DAC;
    AND.W #$000F                                                         ;818DAE;
    CMP.W #$000F                                                         ;818DB1;
    BNE .return                                                          ;818DB4;
    INC.W $0727                                                          ;818DB6;

.return:
    RTS                                                                  ;818DB9;


MapVRAMForMenu:
    SEP #$20                                                             ;818DBA;
    STZ.B $6B                                                            ;818DBC;
    LDA.B #$03                                                           ;818DBE;
    STA.B $52                                                            ;818DC0;
    LDA.B #$51                                                           ;818DC2;
    STA.B $58                                                            ;818DC4;
    LDA.B #$58                                                           ;818DC6;
    STA.B $59                                                            ;818DC8;
    LDA.B #$5C                                                           ;818DCA;
    STA.B $5A                                                            ;818DCC;
    LDA.B #$00                                                           ;818DCE;
    STA.B $5D                                                            ;818DD0;
    LDA.B #$04                                                           ;818DD2;
    STA.B $5E                                                            ;818DD4;
    LDA.B #$13                                                           ;818DD6;
    STA.B $69                                                            ;818DD8;
    RTS                                                                  ;818DDA;


LoadInitialMenuTiles:
    PHP                                                                  ;818DDB;
    SEP #$30                                                             ;818DDC;
    LDA.B #$00                                                           ;818DDE;
    STA.W $2116                                                          ;818DE0;
    LDA.B #$00                                                           ;818DE3;
    STA.W $2117                                                          ;818DE5;
    LDA.B #$80                                                           ;818DE8;
    STA.W $2115                                                          ;818DEA;
    JSL.L SetupHDMATransfer                                              ;818DED;
    db $01,$01,$18                                                       ;818DF1;
    dl Tiles_Menu_BG1_BG2                                                ;818DF4;
    dw $5600                                                             ;818DF7;
    LDA.B #$02                                                           ;818DF9;
    STA.W HW_MDMAEN                                                      ;818DFB;
    LDA.B #$00                                                           ;818DFE;
    STA.W $2116                                                          ;818E00;
    LDA.B #$30                                                           ;818E03;
    STA.W $2117                                                          ;818E05;
    LDA.B #$80                                                           ;818E08;
    STA.W $2115                                                          ;818E0A;
    JSL.L SetupHDMATransfer                                              ;818E0D;
    db $01,$01,$18                                                       ;818E11;
    dl Tiles_PauseScreen_BG1_BG2                                         ;818E14;
    dw $2000                                                             ;818E17;
    LDA.B #$02                                                           ;818E19;
    STA.W HW_MDMAEN                                                      ;818E1B;
    LDA.B #$00                                                           ;818E1E;
    STA.W $2116                                                          ;818E20;
    LDA.B #$60                                                           ;818E23;
    STA.W $2117                                                          ;818E25;
    LDA.B #$80                                                           ;818E28;
    STA.W $2115                                                          ;818E2A;
    JSL.L SetupHDMATransfer                                              ;818E2D;
    db $01,$01,$18                                                       ;818E31;
    dl Tiles_Menu_PauseScreen_Sprites                                    ;818E34;
    dw $2000                                                             ;818E37;
    LDA.B #$02                                                           ;818E39;
    STA.W HW_MDMAEN                                                      ;818E3B;
    LDA.B #$00                                                           ;818E3E;
    STA.W $2116                                                          ;818E40;
    LDA.B #$40                                                           ;818E43;
    STA.W $2117                                                          ;818E45;
    LDA.B #$80                                                           ;818E48;
    STA.W $2115                                                          ;818E4A;
    JSL.L SetupHDMATransfer                                              ;818E4D;
    db $01,$01,$18                                                       ;818E51;
    dl Tiles_Beta_Minimap_Area_Select_BG3                                ;818E54;
    dw $0600                                                             ;818E57;
    LDA.B #$02                                                           ;818E59;
    STA.W HW_MDMAEN                                                      ;818E5B;
    PLP                                                                  ;818E5E;
    RTS                                                                  ;818E5F;


LoadMenuPalettes:
    REP #$30                                                             ;818E60;
    LDX.W #$0000                                                         ;818E62;

.loop:
    LDA.L Menu_Palettes,X                                                ;818E65;
    STA.L $7EC000,X                                                      ;818E69;
    LDA.L Menu_Palettes+2,X                                              ;818E6D;
    STA.L $7EC002,X                                                      ;818E71;
    INX                                                                  ;818E75;
    INX                                                                  ;818E76;
    INX                                                                  ;818E77;
    INX                                                                  ;818E78;
    CPX.W #$0200                                                         ;818E79;
    BMI .loop                                                            ;818E7C;
    RTS                                                                  ;818E7E;


LoadDebugGameOverMenuTilemap:
    LDX.W #$0000                                                         ;818E7F;
    LDA.W #$000F                                                         ;818E82;

.loopClear:
    STA.L $7E3800,X                                                      ;818E85;
    INX                                                                  ;818E89;
    INX                                                                  ;818E8A;
    CPX.W #$0800                                                         ;818E8B;
    BMI .loopClear                                                       ;818E8E;
    LDX.W $0330                                                          ;818E90;
    LDA.W #$0800                                                         ;818E93;
    STA.B $D0,X                                                          ;818E96;
    LDA.W #$3800                                                         ;818E98;
    STA.B $D2,X                                                          ;818E9B;
    LDA.W #$007E                                                         ;818E9D;
    STA.B $D4,X                                                          ;818EA0;
    LDA.B $58                                                            ;818EA2;
    AND.W #$00FC                                                         ;818EA4;
    XBA                                                                  ;818EA7;
    STA.B $D5,X                                                          ;818EA8;
    TXA                                                                  ;818EAA;
    CLC                                                                  ;818EAB;
    ADC.W #$0007                                                         ;818EAC;
    STA.W $0330                                                          ;818EAF;
    LDX.W $0330                                                          ;818EB2;
    LDY.W #$0000                                                         ;818EB5;

.loop:
    LDA.B [$00],Y                                                        ;818EB8;
    CMP.W #$FFFF                                                         ;818EBA;
    BEQ .return                                                          ;818EBD;
    STA.B $D0,X                                                          ;818EBF;
    INY                                                                  ;818EC1;
    INY                                                                  ;818EC2;
    LDA.B [$00],Y                                                        ;818EC3;
    STA.B $D2,X                                                          ;818EC5;
    INY                                                                  ;818EC7;
    INY                                                                  ;818EC8;
    LDA.B [$00],Y                                                        ;818EC9;
    STA.B $D4,X                                                          ;818ECB;
    INY                                                                  ;818ECD;
    INY                                                                  ;818ECE;
    LDA.B [$00],Y                                                        ;818ECF;
    STA.B $D5,X                                                          ;818ED1;
    TXA                                                                  ;818ED3;
    CLC                                                                  ;818ED4;
    ADC.W #$0007                                                         ;818ED5;
    TAX                                                                  ;818ED8;
    INY                                                                  ;818ED9;
    INY                                                                  ;818EDA;
    BRA .loop                                                            ;818EDB;


.return:
    STX.W $0330                                                          ;818EDD;
    RTL                                                                  ;818EE0;


Debug_GameOverMenu_VRAMTransferDefinitions:
    dw $0040                                                             ;818EE1; '            GAME QUIT           '
    dl Tilemap_DebugGameOverMenu_gameQuit                                ;818EE3;
    db $00                                                               ;818EE6;
    dw $5140,$0040                                                       ;818EE7;

    dl Tilemap_DebugGameOverMenu_wouldYouPlay                            ;818EEB; '        WOULD YOU PLAY ?        '
    db $00                                                               ;818EEE;
    dw $5180,$0040                                                       ;818EEF;

    dl Tilemap_DebugGameOverMenu_end                                     ;818EF3; '            END                 '
    db $00                                                               ;818EF6;
    dw $51E0,$0040                                                       ;818EF7;

    dl Tilemap_DebugGameOverMenu_continue                                ;818EFB; '            CONTINUE            '
    db $00                                                               ;818EFE;
    dw $5220                                                             ;818EFF;
    dw $FFFF

Tilemap_DebugGameOverMenu:
  .gameQuit
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F03;
    dw $000F,$000F,$000F,$000F,$0070,$006A,$0076,$006E                   ;818F13;
    dw $000F,$007A,$007E,$0072,$007D,$000F,$000F,$000F                   ;818F23;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F33;

  .wouldYouPlay
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F43;
    dw $0080,$0078,$007E,$0075,$006D,$000F,$0082,$0078                   ;818F53;
    dw $007E,$000F,$0079,$0075,$006A,$0082,$000F,$0085                   ;818F63;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F73;

  .end
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818F83;
    dw $000F,$000F,$000F,$000F,$006E,$0077,$006D,$000F                   ;818F93;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818FA3;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818FB3;

  .continue
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818FC3;
    dw $000F,$000F,$000F,$000F,$006C,$0078,$0077,$007D                   ;818FD3;
    dw $0072,$0077,$007E,$006E,$000F,$000F,$000F,$000F                   ;818FE3;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;818FF3;

DebugGameOverMenu_Index3_Main:
    REP #$30                                                             ;819003;
    LDA.B $8F                                                            ;819005;
    BIT.W #$2000                                                         ;819007;
    BNE .toggleSelection                                                 ;81900A;
    BIT.W #$0800                                                         ;81900C;
    BNE .toggleSelection                                                 ;81900F;
    BIT.W #$0400                                                         ;819011;
    BNE .toggleSelection                                                 ;819014;
    BIT.W #$9080                                                         ;819016;
    BEQ .noChange                                                        ;819019;
    LDA.W $0950                                                          ;81901B;
    BNE +                                                                ;81901E;
    LDA.W $0952                                                          ;819020;
    JSL.L SaveToSRAM                                                     ;819023;
    JML.L SoftReset                                                      ;819027;


  + INC.W $0727                                                          ;81902B;
    RTS                                                                  ;81902E;


.toggleSelection:
    LDA.W $0950                                                          ;81902F;
    EOR.W #$0001                                                         ;819032;
    STA.W $0950                                                          ;819035;

.noChange:
    LDX.W #$7800                                                         ;819038;
    LDA.W $0950                                                          ;81903B;
    BEQ +                                                                ;81903E;
    LDX.W #$8800                                                         ;819040;

  + TXA                                                                  ;819043;
    ORA.W #$0028                                                         ;819044;
    LDX.W $0590                                                          ;819047;
    STA.W $0370,X                                                        ;81904A;
    LDA.W #$00B6                                                         ;81904D;
    STA.W $0372,X                                                        ;819050;
    INX                                                                  ;819053;
    INX                                                                  ;819054;
    INX                                                                  ;819055;
    INX                                                                  ;819056;
    STX.W $0590                                                          ;819057;
    RTS                                                                  ;81905A;


RestorePalettesAndIORegistersFromDebugGameOverMenu:
    LDX.W #$0000                                                         ;81905B;

.loopPalettes:
    LDA.L $7E3300,X                                                      ;81905E;
    STA.L $7EC000,X                                                      ;819062;
    INX                                                                  ;819066;
    INX                                                                  ;819067;
    CPX.W #$0200                                                         ;819068;
    BMI .loopPalettes                                                    ;81906B;
    LDX.W #$0000                                                         ;81906D;

.loopIORegisters:
    LDA.L $7E3500,X                                                      ;819070;
    STA.B $51,X                                                          ;819074;
    INX                                                                  ;819076;
    INX                                                                  ;819077;
    CPX.W #$0036                                                         ;819078;
    BMI .loopIORegisters                                                 ;81907B;
    RTS                                                                  ;81907D;


DebugGameOverMenu_Index5_Continue:
    SEP #$30                                                             ;81907E;
    LDA.B #$00                                                           ;819080;
    STA.W $2116                                                          ;819082;
    LDA.B #$40                                                           ;819085;
    STA.W $2117                                                          ;819087;
    LDA.B #$80                                                           ;81908A;
    STA.W $2115                                                          ;81908C;
    JSL.L SetupHDMATransfer                                              ;81908F;
    db $01,$01,$18                                                       ;819093;
    dl Tiles_Standard_BG3                                                ;819096;
    dw $2000                                                             ;819099;
    LDA.B #$02                                                           ;81909B;
    STA.W HW_MDMAEN                                                      ;81909D;
    REP #$30                                                             ;8190A0;
    LDA.W #$0010                                                         ;8190A2;
    STA.W $0998                                                          ;8190A5;
    STZ.W $0950                                                          ;8190A8;
    JMP.W RestorePalettesAndIORegistersFromDebugGameOverMenu             ;8190AB;


GameOverMenu:
    REP #$30                                                             ;8190AE;
    PHB                                                                  ;8190B0;
    PHK                                                                  ;8190B1;
    PLB                                                                  ;8190B2;
    LDA.W $0727                                                          ;8190B3;
    ASL A                                                                ;8190B6;
    TAX                                                                  ;8190B7;
    JSR.W (.pointers,X)                                                  ;8190B8;
    PLB                                                                  ;8190BB;
    RTL                                                                  ;8190BC;


.pointers:
    dw Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu        ;8190BD;
    dw GameOverMenu_Index1_Initialise                                    ;8190BF;
    dw GameOverMenu_Index2_PlayMusicTrack                                ;8190C1;
    dw GameOverMenu_Index3_FadeIn                                        ;8190C3;
    dw GameOverMenu_Index4_Main                                          ;8190C5;
    dw GameOverMenu_Index5_FadeOutIntoGameMapView                        ;8190C7;
    dw GameOverMenu_Index6_LoadGameMapView                               ;8190C9;
    dw GameOverMenu_Index7_FadeOutIntoGameMapView                        ;8190CB;

GameOverMenu_Index3_FadeIn:
    JSL.L Handle_GameOver_BabyMetroid                                    ;8190CD;
    JSL.L Draw_Menu_Selection_Missile                                    ;8190D1;
    JSL.L HandleFadingIn                                                 ;8190D5;
    LDA.B $51                                                            ;8190D9;
    AND.W #$000F                                                         ;8190DB;
    CMP.W #$000F                                                         ;8190DE;
    BNE .return                                                          ;8190E1;
    INC.W $0727                                                          ;8190E3;

.return:
    RTS                                                                  ;8190E6;


GameOverMenu_Index5_FadeOutIntoGameMapView:
    JSL.L Handle_GameOver_BabyMetroid                                    ;8190E7;
    JSL.L Draw_Menu_Selection_Missile                                    ;8190EB;
    JSL.L HandleFadingOut                                                ;8190EF;
    LDA.B $51                                                            ;8190F3;
    AND.W #$000F                                                         ;8190F5;
    BNE .return                                                          ;8190F8;
    INC.W $0727                                                          ;8190FA;

.return:
    RTS                                                                  ;8190FD;


GameOverMenu_Index7_FadeOutIntoGameMapView:
    JSL.L Draw_Menu_Selection_Missile                                    ;8190FE;
    JSL.L Handle_GameOver_BabyMetroid                                    ;819102;
    JSL.L HandleFadingOut                                                ;819106;
    LDA.B $51                                                            ;81910A;
    AND.W #$000F                                                         ;81910C;
    BEQ .softReset                                                       ;81910F;
    RTS                                                                  ;819111;


.softReset:
    JML.L SoftReset                                                      ;819112;


GameOverMenu_Index6_LoadGameMapView:
    JSL.L Disable_HDMAObjects                                            ;819116;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;81911A;
    LDA.W #$0005                                                         ;81911E;
    STA.W $0998                                                          ;819121;
    LDA.W #$0000                                                         ;819124;
    STA.W $0727                                                          ;819127;
    RTS                                                                  ;81912A;


GameOverMenu_Index4_Main:
    REP #$30                                                             ;81912B;
    JSL.L Handle_GameOver_BabyMetroid                                    ;81912D;
    JSL.L Draw_Menu_Selection_Missile                                    ;819131;
    LDA.B $8F                                                            ;819135;
    BIT.W #$2000                                                         ;819137;
    BNE .toggleSelection                                                 ;81913A;
    BIT.W #$0800                                                         ;81913C;
    BNE .toggleSelection                                                 ;81913F;
    BIT.W #$0400                                                         ;819141;
    BNE .toggleSelection                                                 ;819144;
    BIT.W #$0080                                                         ;819146;
    BEQ .noChange                                                        ;819149;
    LDA.W #$00B4                                                         ;81914B;
    STA.W $0F94                                                          ;81914E;
    LDA.W $0950                                                          ;819151;
    BEQ +                                                                ;819154;
    LDA.W #$0007                                                         ;819156;
    STA.W $0727                                                          ;819159;
    RTS                                                                  ;81915C;


  + LDA.L $7ED914                                                        ;81915D;
    CMP.W #$001F                                                         ;819161;
    BEQ +                                                                ;819164;
    INC.W $0727                                                          ;819166;
    LDA.W $0952                                                          ;819169;
    JSL.L LoadFromSRAM                                                   ;81916C;
    RTS                                                                  ;819170;


  + STA.W $0998                                                          ;819171;
    LDA.W $0952                                                          ;819174;
    JSL.L LoadFromSRAM                                                   ;819177;
    RTS                                                                  ;81917B;


.toggleSelection:
    LDA.W #$0037                                                         ;81917C;
    JSL.L QueueSound_Lib1_Max6                                           ;81917F;
    LDA.W $0950                                                          ;819183;
    EOR.W #$0001                                                         ;819186;
    STA.W $0950                                                          ;819189;

.noChange:
    LDX.W #$0028                                                         ;81918C;
    LDY.W #$00A0                                                         ;81918F;
    LDA.W $0950                                                          ;819192;
    BEQ +                                                                ;819195;
    LDX.W #$0028                                                         ;819197;
    LDY.W #$00C0                                                         ;81919A;

  + STX.W $19A1                                                          ;81919D;
    STY.W $19AB                                                          ;8191A0;
    RTS                                                                  ;8191A3;


GameOverMenu_Index1_Initialise:
    SEP #$20                                                             ;8191A4;
    LDA.B #$11                                                           ;8191A6;
    STA.B $69                                                            ;8191A8;
    LDA.B #$20                                                           ;8191AA;
    STA.B $74                                                            ;8191AC;
    LDA.B #$40                                                           ;8191AE;
    STA.B $75                                                            ;8191B0;
    LDA.B #$80                                                           ;8191B2;
    STA.B $76                                                            ;8191B4;
    REP #$30                                                             ;8191B6;
    LDA.W #$0000                                                         ;8191B8;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8191BB;
    LDA.W #$FF03                                                         ;8191BF;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8191C2;
    LDA.W #$0001                                                         ;8191C6;
    STA.W $198D                                                          ;8191C9;
    DEC A                                                                ;8191CC;
    STA.W $1997                                                          ;8191CD;
    LDX.W #$0000                                                         ;8191D0;
    LDA.W #$000F                                                         ;8191D3;

.loop:
    STA.L $7E3600,X                                                      ;8191D6;
    INX                                                                  ;8191DA;
    INX                                                                  ;8191DB;
    CPX.W #$0800                                                         ;8191DC;
    BMI .loop                                                            ;8191DF;
    LDX.W $0330                                                          ;8191E1;
    LDA.W #$0800                                                         ;8191E4;
    STA.B $D0,X                                                          ;8191E7;
    LDA.W #$3600                                                         ;8191E9;
    STA.B $D2,X                                                          ;8191EC;
    LDA.W #$007E                                                         ;8191EE;
    STA.B $D4,X                                                          ;8191F1;
    LDA.B $58                                                            ;8191F3;
    AND.W #$00FC                                                         ;8191F5;
    XBA                                                                  ;8191F8;
    STA.B $D5,X                                                          ;8191F9;
    TXA                                                                  ;8191FB;
    CLC                                                                  ;8191FC;
    ADC.W #$0007                                                         ;8191FD;
    STA.W $0330                                                          ;819200;
    STZ.W $0F96                                                          ;819203;
    LDY.W #Tilemap_GameOver_gameOver                                     ;819206;
    LDX.W #($B<<1)|($5<<6)                                               ;819209; $0156
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81920C;
    LDY.W #Tilemap_GameOver_findTheMetroidLarva                          ;81920F;
    LDX.W #($5<<1)|($E<<6)                                               ;819212; $038A
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819215;
    LDY.W #Tilemap_GameOver_tryAgain                                     ;819218;
    LDX.W #($A<<1)|($10<<6)                                              ;81921B; $0414
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81921E;
    LDY.W #Tilemap_GameOver_yesReturnToGame                              ;819221;
    LDX.W #($7<<1)|($13<<6)                                              ;819224; $04CE
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819227;
    LDY.W #Tilemap_GameOver_noGoToTitle                                  ;81922A;
    LDX.W #($7<<1)|($17<<6)                                              ;81922D; $05CE
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819230;
    STZ.W $0F92                                                          ;819233;
    STZ.W $0F94                                                          ;819236;
    JSL.L Handle_GameOver_BabyMetroid                                    ;819239;
    LDA.B $6F                                                            ;81923D;
    AND.W #$FF00                                                         ;81923F;
    STA.B $6F                                                            ;819242;
    JSL.L Disable_HDMAObjects                                            ;819244;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;819248;
    JSL.L Enable_HDMAObjects                                             ;81924C;
    JSL.L Spawn_HDMAObject                                               ;819250;
    db $00,$32                                                           ;819254;
    dw HDMAObjInstList_ColorMathSubscnBackdrop_GameOverMenuGradient      ;819256;
    JSL.L Spawn_HDMAObject                                               ;819258;
    db $00,$31                                                           ;81925C;
    dw HDMAObjInstList_ColorMathCtrlRegB_GameOverMenuGradient            ;81925E;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;819260;
    INC.W $0727                                                          ;819264;
    STZ.W $0723                                                          ;819267;
    STZ.W $0725                                                          ;81926A;
    STZ.W $0950                                                          ;81926D;
    LDA.W #$0028                                                         ;819270;
    STA.W $19A1                                                          ;819273;
    LDA.W #$00A0                                                         ;819276;
    STA.W $19AB                                                          ;819279;
    RTS                                                                  ;81927C;


HDMAObjInstList_ColorMathSubscnBackdrop_GameOverMenuGradient:
    dw Instruction_HDMAObject_HDMATableBank                              ;81927D; 
    db HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient>>16

    dw Instruction_HDMAObject_PreInstructionInY : dl RTL_8192DB          ;819280;
    dw $0001, HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient     ;819285;
    dw Instruction_HDMAObject_Sleep                                      ;819289;
    dw Instruction_HDMAObject_Delete                                     ;81928B;

HDMAObjInstList_ColorMathCtrlRegB_GameOverMenuGradient:
    dw Instruction_HDMAObject_HDMATableBank                              ;81928D;
    db HDMATable_ColorMathCtrlRegB_GameOverMenuGradient>>16

    dw Instruction_HDMAObject_PreInstructionInY : dl RTL_8192DB          ;819290;
    dw $0001, HDMATable_ColorMathCtrlRegB_GameOverMenuGradient           ;819295;
    dw Instruction_HDMAObject_Sleep                                      ;819299;
    dw Instruction_HDMAObject_Delete                                     ;81929B;

HDMATable_ColorMathCtrlRegB_GameOverMenuGradient:
    db $40,$A1                                                           ;81929D;
    db $3A,$A1
    db $40,$21
    db $40,$21
    db $00,$00

HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient:
    db $05,$E8                                                           ;8192A7;
    db $05,$E7
    db $05,$E6
    db $07,$E5
    db $08,$E4
    db $0A,$E3
    db $0C,$E2
    db $0C,$E1 
    db $40,$E0
    db $05,$C0
    db $0E,$C1
    db $0C,$C2
    db $0C,$C3
    db $08,$C4
    db $07,$C5
    db $06,$C6
    db $06,$C7
    db $06,$C8
    db $06,$C9
    db $07,$CA
    db $06,$CB
    db $06,$CC
    db $06,$CD
    db $06,$CE
    db $02,$CF
    db $00,$00

RTL_8192DB:
    RTL                                                                  ;8192DB;


Tilemap_GameOver_gameOver:
    dw $000C,$000A,$0026,$000E,$000F,$0000,$002D,$000E                   ;8192DC;
    dw $000D,$FFFE,$0030,$001A,$0036,$001E,$000F,$0010                   ;8192EC;
    dw $003E,$001E,$003A,$FFFF                                           ;8192FC;

Tilemap_GameOver_findTheMetroidLarva:
    dw $006F,$0072,$0077,$006D,$000F,$007D,$0071,$006E                   ;819304;
    dw $000F,$0076,$006E,$007D,$007B,$0078,$0072,$006D                   ;819314;
    dw $000F,$0075,$006A,$007B,$007F,$006A,$0084,$FFFF                   ;819324;

Tilemap_GameOver_tryAgain:
    dw $007D,$007B,$0082,$000F,$006A,$0070,$006A,$0072                   ;819334;
    dw $0077,$000F,$0085,$FFFF                                           ;819344;

Tilemap_GameOver_yesReturnToGame:
    dw $0041,$000E,$002B,$000F,$000F,$000F,$000F,$000F                   ;81934C;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;81935C;
    dw $000F,$000F,$000F,$000F,$FFFE,$0017,$001E,$003B                   ;81936C;
    dw $000F,$008A,$007B,$006E,$007D,$007E,$007B,$0077                   ;81937C;
    dw $000F,$007D,$0078,$000F,$0070,$006A,$0076,$006E                   ;81938C;
    dw $008B,$FFFF                                                       ;81939C;

Tilemap_GameOver_noGoToTitle:
    dw $0027,$000F,$0000,$000F,$000F,$000F,$000F,$000F                   ;8193A0;
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F                   ;8193B0;
    dw $000F,$FFFE,$0037,$000F,$0010,$000F,$008A,$0070                   ;8193C0;
    dw $0078,$000F,$007D,$0078,$000F,$007D,$0072,$007D                   ;8193D0;
    dw $0075,$006E,$008B,$FFFF                                           ;8193E0;

GameOverMenu_Index2_PlayMusicTrack:
    REP #$30                                                             ;8193E8;
    JSL.L CheckIfMusicIsQueued                                           ;8193EA;
    BCS .return                                                          ;8193EE;
    INC.W $0727                                                          ;8193F0;
    LDA.W #$0004                                                         ;8193F3;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8193F6;

.return:
    RTS                                                                  ;8193FA;
