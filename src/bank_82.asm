
org $828000


GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData:
    PHP                                                                  ;828000;
    REP #$30                                                             ;828001;
    LDA.W $0998                                                          ;828003;
    CMP.W #$0028                                                         ;828006;
    BNE .notDemo                                                         ;828009;
    JSR.W InialiseIORegistersForGameplay                                 ;82800B;
    JSR.W Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps                ;82800E;
    JSR.W LoadInitialPalette                                             ;828011;
    JSL.L InitializeSamus                                                ;828014;
    JSR.W LoadDemoRoomData                                               ;828018;
    BRA .gameplay                                                        ;82801B;


.notDemo:
    LDA.L $7ED914                                                        ;82801D;
    CMP.W #$0005                                                         ;828021;
    BEQ .onZebes                                                         ;828024;
    CMP.W #$001F                                                         ;828026;
    BEQ .ceres                                                           ;828029;
    CMP.W #$0022                                                         ;82802B;
    BEQ .zebesLanding                                                    ;82802E;
    BRA .onZebes                                                         ;828030;


.zebesLanding:
    STZ.W $079F                                                          ;828032;
    LDA.W #$0012                                                         ;828035;
    STA.W $078B                                                          ;828038;
    JSL.L LoadMirrorOfCurrentAreasMapExplored                            ;82803B;
    BRA .onZebes                                                         ;82803F;


.ceres:
    LDA.W #$0006                                                         ;828041;
    STA.W $079F                                                          ;828044;
    STZ.W $078B                                                          ;828047;
    JSL.L ClearTimerRAM                                                  ;82804A;

.onZebes:
    JSR.W InialiseIORegistersForGameplay                                 ;82804E;
    JSR.W Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps                ;828051;
    JSR.W LoadInitialPalette                                             ;828054;
    JSL.L InitializeSamus                                                ;828057;
    JSL.L LoadFromLoadStation                                            ;82805B;

.gameplay:
    JSL.L StartGameplay                                                  ;82805F;
    JSL.L InitialiseHUD_GameLoading                                      ;828063;
    JSL.L RTL_A09784                                                     ;828067;
    PHP                                                                  ;82806B;
    REP #$30                                                             ;82806C;
    LDY.W #$0020                                                         ;82806E;
    LDX.W #$0000                                                         ;828071;

.loopTargetSamusPalette:
    LDA.L $7EC180,X                                                      ;828074;
    STA.L $7EC380,X                                                      ;828078;
    INX                                                                  ;82807C;
    INX                                                                  ;82807D;
    DEY                                                                  ;82807E;
    DEY                                                                  ;82807F;
    BNE .loopTargetSamusPalette                                          ;828080;
    PLP                                                                  ;828082;
    LDA.W #$0001                                                         ;828083;
    STA.W $0723                                                          ;828086;
    STA.W $0725                                                          ;828089;
    JSL.L EnableNMI                                                      ;82808C;
    JSL.L Enable_Enemy_Projectiles                                       ;828090;
    JSL.L Enable_PLMs                                                    ;828094;
    JSL.L Enable_PaletteFXObjects                                        ;828098;
    JSL.L Enable_HDMAObjects                                             ;82809C;
    JSL.L Enable_AnimatedTilesObjects                                    ;8280A0;
    JSL.L SetLiquidPhysicsType                                           ;8280A4;
    LDA.W $0998                                                          ;8280A8;
    CMP.W #$0028                                                         ;8280AB;
    BNE +                                                                ;8280AE;
    JMP.W .demo                                                          ;8280B0;


  + LDA.L $7ED914                                                        ;8280B3;
    CMP.W #$0022                                                         ;8280B7;
    BNE .notZebesLanding                                                 ;8280BA;
    LDA.W #$0005                                                         ;8280BC;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8280BF;
    LDA.W #$000F                                                         ;8280C3;
    STA.W $0DA0                                                          ;8280C6;

.loopAlpha:
    JSL.L TransferEnemyTilesToVRAM_InitialiseEnemies                     ;8280C9;
    JSL.L WaitForNMI                                                     ;8280CD;
    DEC.W $0DA0                                                          ;8280D1;
    BPL .loopAlpha                                                       ;8280D4;
    INC.W $0998                                                          ;8280D6;
    PHP                                                                  ;8280D9;
    REP #$30                                                             ;8280DA;
    LDY.W #$0200                                                         ;8280DC;
    LDX.W #$0000                                                         ;8280DF;

.loopAlphaPalettes:
    LDA.L $7EC200,X                                                      ;8280E2;
    STA.L $7EC000,X                                                      ;8280E6;
    INX                                                                  ;8280EA;
    INX                                                                  ;8280EB;
    DEY                                                                  ;8280EC;
    DEY                                                                  ;8280ED;
    BNE .loopAlphaPalettes                                               ;8280EE;
    PLP                                                                  ;8280F0;
    PLP                                                                  ;8280F1;
    RTS                                                                  ;8280F2;


.notZebesLanding:
    LDA.W #$0006                                                         ;8280F3;
    STA.W $0DA0                                                          ;8280F6;

.loopBeta:
    JSL.L TransferEnemyTilesToVRAM_InitialiseEnemies                     ;8280F9;
    JSL.L WaitForNMI                                                     ;8280FD;
    DEC.W $0DA0                                                          ;828101;
    BPL .loopBeta                                                        ;828104;
    LDA.W #$0007                                                         ;828106;
    STA.W $0998                                                          ;828109;
    PHP                                                                  ;82810C;
    REP #$30                                                             ;82810D;
    LDY.W #$0200                                                         ;82810F;
    LDX.W #$0000                                                         ;828112;

.loopBetaPalettes:
    LDA.L $7EC200,X                                                      ;828115;
    STA.L $7EC000,X                                                      ;828119;
    INX                                                                  ;82811D;
    INX                                                                  ;82811E;
    DEY                                                                  ;82811F;
    DEY                                                                  ;828120;
    BNE .loopBetaPalettes                                                ;828121;
    PLP                                                                  ;828123;
    LDA.L $7ED914                                                        ;828124;
    CMP.W #$001F                                                         ;828128;
    BNE .runSamusCmd                                                     ;82812B;
    LDA.W #$0000                                                         ;82812D;
    STA.L $7EC1BE                                                        ;828130;
    LDA.W #$0008                                                         ;828134;
    JSL.L Run_Samus_Command                                              ;828137;
    PLP                                                                  ;82813B;
    RTS                                                                  ;82813C;


.runSamusCmd:
    LDA.W #$0009                                                         ;82813D;
    JSL.L Run_Samus_Command                                              ;828140;
    PLP                                                                  ;828144;
    RTS                                                                  ;828145;


.demo:
    LDA.W #$0006                                                         ;828146;
    STA.W $0DA0                                                          ;828149;

.transferVRAM:
    JSL.L TransferEnemyTilesToVRAM_InitialiseEnemies                     ;82814C;
    JSL.L WaitForNMI                                                     ;828150;
    DEC.W $0DA0                                                          ;828154;
    BPL .transferVRAM                                                    ;828157;
    LDA.W $1F57                                                          ;828159;
    DEC A                                                                ;82815C;
    STA.B $12                                                            ;82815D;
    ASL A                                                                ;82815F;
    ASL A                                                                ;828160;
    ASL A                                                                ;828161;
    ADC.B $12                                                            ;828162;
    ASL A                                                                ;828164;
    STA.B $12                                                            ;828165;
    LDA.W $1F55                                                          ;828167;
    ASL A                                                                ;82816A;
    TAX                                                                  ;82816B;
    LDA.W DemoRoomData_pointers,X                                        ;82816C;
    CLC                                                                  ;82816F;
    ADC.B $12                                                            ;828170;
    TAX                                                                  ;828172;
    LDA.W $0010,X                                                        ;828173;
    STA.B $12                                                            ;828176;
    LDX.W #$0000                                                         ;828178;
    JSR.W ($0012,X)                                                      ;82817B;
    INC.W $0998                                                          ;82817E;
    PHP                                                                  ;828181;
    REP #$30                                                             ;828182;
    LDY.W #$0200                                                         ;828184;
    LDX.W #$0000                                                         ;828187;

.loopDemoPalettes:
    LDA.L $7EC200,X                                                      ;82818A;
    STA.L $7EC000,X                                                      ;82818E;
    INX                                                                  ;828192;
    INX                                                                  ;828193;
    DEY                                                                  ;828194;
    DEY                                                                  ;828195;
    BNE .loopDemoPalettes                                                ;828196;
    PLP                                                                  ;828198;
    PLP                                                                  ;828199;
    RTS                                                                  ;82819A;


InialiseIORegistersForGameplay:
    PHP                                                                  ;82819B;
    JSR.W InitialiseCPURegistersForGameplay                              ;82819C;
    JSR.W SetupPPUForGameplay                                            ;82819F;
    PLP                                                                  ;8281A2;
    RTS                                                                  ;8281A3;


InitialiseCPURegistersForGameplay:
    PHP                                                                  ;8281A4;
    SEP #$30                                                             ;8281A5;
    LDA.B #$01                                                           ;8281A7;
    STA.W $4200                                                          ;8281A9;
    STA.B $84                                                            ;8281AC;
    STZ.W $4201                                                          ;8281AE;
    STZ.W HW_WRMPYA                                                      ;8281B1;
    STZ.W HW_WRMPYB                                                      ;8281B4;
    STZ.W $4204                                                          ;8281B7;
    STZ.W $4205                                                          ;8281BA;
    STZ.W $4206                                                          ;8281BD;
    STZ.W $4207                                                          ;8281C0;
    STZ.W $4208                                                          ;8281C3;
    STZ.W $4209                                                          ;8281C6;
    STZ.W $420A                                                          ;8281C9;
    STZ.W $420B                                                          ;8281CC;
    STZ.W $420C                                                          ;8281CF;
    STZ.B $85                                                            ;8281D2;
    LDA.B #$01                                                           ;8281D4;
    STA.W $420D                                                          ;8281D6;
    STA.B $86                                                            ;8281D9;
    PLP                                                                  ;8281DB;
    RTS                                                                  ;8281DC;


SetupPPUForGameplay:
    PHP                                                                  ;8281DD;
    SEP #$30                                                             ;8281DE;
    LDA.B #$80                                                           ;8281E0;
    STA.W $2100                                                          ;8281E2;
    STA.B $51                                                            ;8281E5;
    LDA.B #$03                                                           ;8281E7;
    STA.W $2101                                                          ;8281E9;
    STA.B $52                                                            ;8281EC;
    STZ.W $2102                                                          ;8281EE;
    STZ.B $53                                                            ;8281F1;
    LDA.B #$80                                                           ;8281F3;
    STA.W $2103                                                          ;8281F5;
    STA.B $54                                                            ;8281F8;
    STZ.W $2104                                                          ;8281FA;
    STZ.W $2104                                                          ;8281FD;
    LDA.B #$09                                                           ;828200;
    STA.W $2105                                                          ;828202;
    STA.B $55                                                            ;828205;
    STZ.W $2106                                                          ;828207;
    STZ.B $57                                                            ;82820A;
    STZ.B $5D                                                            ;82820C;
    STZ.W $210B                                                          ;82820E;
    LDA.B #$04                                                           ;828211;
    STA.B $5E                                                            ;828213;
    STA.W $210C                                                          ;828215;
    LDA.B #$51                                                           ;828218;
    STA.B $58                                                            ;82821A;
    STA.W $2107                                                          ;82821C;
    LDA.B #$49                                                           ;82821F;
    STA.B $59                                                            ;828221;
    STA.W $2108                                                          ;828223;
    LDA.B #$5A                                                           ;828226;
    STA.B $5A                                                            ;828228;
    STA.W $2109                                                          ;82822A;
    LDA.B #$00                                                           ;82822D;
    STA.B $5C                                                            ;82822F;
    STA.W $210A                                                          ;828231;
    STZ.W $2115                                                          ;828234;
    STZ.W $2123                                                          ;828237;
    STZ.B $60                                                            ;82823A;
    STZ.W $2123                                                          ;82823C;
    STZ.B $60                                                            ;82823F;
    STZ.W $2124                                                          ;828241;
    STZ.B $61                                                            ;828244;
    STZ.W $2125                                                          ;828246;
    STZ.B $62                                                            ;828249;
    STZ.W $2126                                                          ;82824B;
    STZ.B $63                                                            ;82824E;
    STZ.W $2127                                                          ;828250;
    STZ.B $64                                                            ;828253;
    STZ.W $2128                                                          ;828255;
    STZ.B $65                                                            ;828258;
    STZ.W $2129                                                          ;82825A;
    STZ.B $66                                                            ;82825D;
    STZ.W $212A                                                          ;82825F;
    STZ.B $67                                                            ;828262;
    STZ.W $212B                                                          ;828264;
    STZ.B $68                                                            ;828267;
    LDA.B #$17                                                           ;828269;
    STA.W $212C                                                          ;82826B;
    STA.B $69                                                            ;82826E;
    STZ.W $212E                                                          ;828270;
    STZ.B $6C                                                            ;828273;
    LDA.B #$00                                                           ;828275;
    STA.W $212D                                                          ;828277;
    STA.B $6B                                                            ;82827A;
    STZ.W $212F                                                          ;82827C;
    STZ.B $6D                                                            ;82827F;
    STZ.W $2130                                                          ;828281;
    STZ.B $6E                                                            ;828284;
    STZ.W $2131                                                          ;828286;
    STZ.B $71                                                            ;828289;
    LDA.B #$E0                                                           ;82828B;
    STA.W $2132                                                          ;82828D;
    LDA.B #$00                                                           ;828290;
    STA.W $2133                                                          ;828292;
    STA.B $77                                                            ;828295;
    REP #$30                                                             ;828297;
    STZ.W $0590                                                          ;828299;
    LDA.W #$0000                                                         ;82829C;
    LDX.W #$3000                                                         ;82829F;
    LDY.W #$07FE                                                         ;8282A2;
    JSL.L WriteYBytesOfATo_7E0000_X_16bit                                ;8282A5;
    LDA.W #$006F                                                         ;8282A9;
    LDX.W #$4000                                                         ;8282AC;
    LDY.W #$07FE                                                         ;8282AF;
    JSL.L WriteYBytesOfATo_7E0000_X_16bit                                ;8282B2;
    LDA.W #$2C0F                                                         ;8282B6;
    LDX.W #$4000                                                         ;8282B9;
    LDY.W #$00FE                                                         ;8282BC;
    JSL.L WriteYBytesOfATo_7E0000_X_16bit                                ;8282BF;
    PLP                                                                  ;8282C3;
    RTS                                                                  ;8282C4;


LoadInitialPalette:
    PHP                                                                  ;8282C5;
    SEP #$30                                                             ;8282C6;
    PHP                                                                  ;8282C8;
    REP #$30                                                             ;8282C9;
    LDY.W #$0200                                                         ;8282CB;
    LDX.W #$0000                                                         ;8282CE;

.loop:
    LDA.L Initial_Palette_BGPalette0,X                                   ;8282D1;
    STA.L $7EC000,X                                                      ;8282D5;
    INX                                                                  ;8282D9;
    INX                                                                  ;8282DA;
    DEY                                                                  ;8282DB;
    DEY                                                                  ;8282DC;
    BNE .loop                                                            ;8282DD;
    PLP                                                                  ;8282DF;
    PLP                                                                  ;8282E0;
    RTS                                                                  ;8282E1;


Load_StandardBG3Tiles_SpriteTiles_ClearTilemaps:
    PHP                                                                  ;8282E2;
    SEP #$30                                                             ;8282E3;
    LDA.B #$00                                                           ;8282E5;
    STA.W $2116                                                          ;8282E7;
    LDA.B #$40                                                           ;8282EA;
    STA.W $2117                                                          ;8282EC;
    LDA.B #$80                                                           ;8282EF;
    STA.W $2115                                                          ;8282F1;
    JSL.L SetupHDMATransfer                                              ;8282F4;
    db $01,$01,$18                                                       ;8282F8;
    dl Tiles_Standard_BG3                                                ;8282FB;
    dw $2000                                                             ;8282FE;
    LDA.B #$02                                                           ;828300;
    STA.W $420B                                                          ;828302;
    LDA.B #$00                                                           ;828305;
    STA.W $2116                                                          ;828307;
    LDA.B #$60                                                           ;82830A;
    STA.W $2117                                                          ;82830C;
    LDA.B #$80                                                           ;82830F;
    STA.W $2115                                                          ;828311;
    JSL.L SetupHDMATransfer                                              ;828314;
    db $01,$01,$18                                                       ;828318;
    dl Tiles_Standard_Sprite_0                                           ;82831B;
    dw $4000                                                             ;82831E;
    LDA.B #$02                                                           ;828320;
    STA.W $420B                                                          ;828322;
    LDA.B #$00                                                           ;828325;
    STA.W $2116                                                          ;828327;
    LDA.B #$50                                                           ;82832A;
    STA.W $2117                                                          ;82832C;
    LDA.B #$80                                                           ;82832F;
    STA.W $2115                                                          ;828331;
    JSL.L SetupHDMATransfer                                              ;828334;
    db $01,$01,$18                                                       ;828338;
    dl $7E4000                                                           ;82833B;
    dw $1000                                                             ;82833E;
    LDA.B #$02                                                           ;828340;
    STA.W $420B                                                          ;828342;
    LDA.B #$00                                                           ;828345;
    STA.W $2116                                                          ;828347;
    LDA.B #$58                                                           ;82834A;
    STA.W $2117                                                          ;82834C;
    LDA.B #$80                                                           ;82834F;
    STA.W $2115                                                          ;828351;
    JSL.L SetupHDMATransfer                                              ;828354;
    db $01,$01,$18                                                       ;828358;
    dl $7E4000                                                           ;82835B;
    dw $0800                                                             ;82835E;
    LDA.B #$02                                                           ;828360;
    STA.W $420B                                                          ;828362;
    PLP                                                                  ;828365;
    RTS                                                                  ;828366;


GameState_20_MadeItToCeresElevator:
    PHP                                                                  ;828367;
    REP #$30                                                             ;828368;
    LDA.W $0943                                                          ;82836A;
    BEQ +                                                                ;82836D;
    JSL.L DrawTimer                                                      ;82836F;

  + JSR.W GameState_8_MainGameplay                                       ;828373;
    DEC.W $0AA0                                                          ;828376;
    BEQ +                                                                ;828379;
    BPL .return                                                          ;82837B;

  + INC.W $0998                                                          ;82837D;
    STZ.W $0723                                                          ;828380;
    STZ.W $0725                                                          ;828383;

.return:
    PLP                                                                  ;828386;
    RTS                                                                  ;828387;


GameState_21_BlackoutFromCeres:
    PHP                                                                  ;828388;
    REP #$30                                                             ;828389;
    LDA.W $0943                                                          ;82838B;
    BEQ +                                                                ;82838E;
    JSL.L DrawTimer                                                      ;828390;

  + JSR.W GameState_8_MainGameplay                                       ;828394;
    JSL.L HandleFadingOut                                                ;828397;
    SEP #$20                                                             ;82839B;
    LDA.B $51                                                            ;82839D;
    CMP.B #$80                                                           ;82839F;
    BEQ +                                                                ;8283A1;
    REP #$20                                                             ;8283A3;
    PLP                                                                  ;8283A5;
    RTS                                                                  ;8283A6;


  + JSL.L EnableNMI                                                      ;8283A7;
    REP #$20                                                             ;8283AB;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;8283AD;
    JSL.L DisableHVCounterInterrupts                                     ;8283B1;
    STZ.W $1982                                                          ;8283B5;
    STZ.B $AB                                                            ;8283B8;
    SEP #$20                                                             ;8283BA;
    STZ.B $6E                                                            ;8283BC;
    STZ.B $71                                                            ;8283BE;
    LDA.B #$10                                                           ;8283C0;
    STA.B $69                                                            ;8283C2;
    STZ.B $6B                                                            ;8283C4;
    STZ.B $6C                                                            ;8283C6;
    STZ.B $6D                                                            ;8283C8;
    LDA.B #$09                                                           ;8283CA;
    STA.B $55                                                            ;8283CC;
    REP #$20                                                             ;8283CE;
    STZ.W $0723                                                          ;8283D0;
    STZ.W $0725                                                          ;8283D3;
    LDA.W #$0022                                                         ;8283D6;
    STA.L $7ED914                                                        ;8283D9;
    STA.W $0998                                                          ;8283DD;
    LDA.W $0952                                                          ;8283E0;
    JSL.L SaveToSRAM                                                     ;8283E3;
    LDA.W #CinematicFunction_CeresGoesBoom_Initial                       ;8283E7;
    STA.W $1F51                                                          ;8283EA;
    STZ.W $093F                                                          ;8283ED;
    STZ.W $0943                                                          ;8283F0;
    LDA.W #$0000                                                         ;8283F3;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;8283F6;
    LDA.W #$0002                                                         ;8283FA;
    JSL.L QueueSound                                                     ;8283FD;
    LDA.W #$0071                                                         ;828401;
    JSL.L QueueSound_Lib2_Max15                                          ;828404;
    LDA.W #$0001                                                         ;828408;
    JSL.L QueueSound_Lib3_Max15                                          ;82840B;
    PLP                                                                  ;82840F;
    RTS                                                                  ;828410;


GameState_23_TimeUp:
    PHP                                                                  ;828411;
    REP #$30                                                             ;828412;
    JSR.W GameState_8_MainGameplay                                       ;828414;
    LDA.W #$0008                                                         ;828417;
    STA.L $7EC402                                                        ;82841A;
    JSR.W Advance_GradualColorChange_ofAllPalettes                       ;82841E;
    BCC .return                                                          ;828421;
    LDA.W #$0024                                                         ;828423;
    STA.W $0998                                                          ;828426;
    STZ.W $0723                                                          ;828429;
    STZ.W $0725                                                          ;82842C;

.return:
    PLP                                                                  ;82842F;
    RTS                                                                  ;828430;


GameState_24_WhitingOutFromTimeUp:
    PHP                                                                  ;828431;
    REP #$30                                                             ;828432;
    JSL.L HandleFadingOut                                                ;828434;
    SEP #$20                                                             ;828438;
    LDA.B $51                                                            ;82843A;
    CMP.B #$80                                                           ;82843C;
    BEQ +                                                                ;82843E;
    REP #$20                                                             ;828440;
    PLP                                                                  ;828442;
    RTS                                                                  ;828443;


  + JSL.L EnableNMI                                                      ;828444;
    REP #$20                                                             ;828448;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;82844A;
    JSL.L DisableHVCounterInterrupts                                     ;82844E;
    STZ.W $1982                                                          ;828452;
    STZ.B $AB                                                            ;828455;
    SEP #$20                                                             ;828457;
    STZ.B $6E                                                            ;828459;
    STZ.B $71                                                            ;82845B;
    LDA.B #$10                                                           ;82845D;
    STA.B $69                                                            ;82845F;
    STZ.B $6B                                                            ;828461;
    STZ.B $6C                                                            ;828463;
    STZ.B $6D                                                            ;828465;
    LDA.B #$09                                                           ;828467;
    STA.B $55                                                            ;828469;
    REP #$20                                                             ;82846B;
    STZ.W $0723                                                          ;82846D;
    STZ.W $0725                                                          ;828470;
    STZ.W $093F                                                          ;828473;
    STZ.W $0943                                                          ;828476;
    LDA.W #$0002                                                         ;828479;
    JSL.L QueueSound                                                     ;82847C;
    LDA.W #$0071                                                         ;828480;
    JSL.L QueueSound_Lib2_Max15                                          ;828483;
    LDA.W #$0001                                                         ;828487;
    JSL.L QueueSound_Lib3_Max15                                          ;82848A;
    LDA.W #$000E                                                         ;82848E;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;828491;
    BCC .notZebesTimebomb                                                ;828495;
    STZ.W $0DE2                                                          ;828497;
    STZ.W $0727                                                          ;82849A;
    LDX.W #$00FE                                                         ;82849D;

.loop:
    STZ.W $1A8D,X                                                        ;8284A0;
    DEX                                                                  ;8284A3;
    DEX                                                                  ;8284A4;
    BPL .loop                                                            ;8284A5;
    LDA.W #$0019                                                         ;8284A7;
    STA.W $0998                                                          ;8284AA;
    PLP                                                                  ;8284AD;
    RTS                                                                  ;8284AE;


.notZebesTimebomb:
    LDA.W #$0025                                                         ;8284AF;
    STA.W $0998                                                          ;8284B2;
    LDA.W #CinematicFunction_CeresGoesBoom_Initial                       ;8284B5;
    STA.W $1F51                                                          ;8284B8;
    PLP                                                                  ;8284BB;
    RTS                                                                  ;8284BC;


GameState_26_SamusEscapesFromZebes:
    PHP                                                                  ;8284BD;
    REP #$30                                                             ;8284BE;
    JSR.W GameState_8_MainGameplay                                       ;8284C0;
    JSL.L HandleFadingOut                                                ;8284C3;
    SEP #$20                                                             ;8284C7;
    LDA.B $51                                                            ;8284C9;
    CMP.B #$80                                                           ;8284CB;
    BEQ +                                                                ;8284CD;
    REP #$20                                                             ;8284CF;
    PLP                                                                  ;8284D1;
    RTS                                                                  ;8284D2;


  + JSL.L EnableNMI                                                      ;8284D3;
    REP #$20                                                             ;8284D7;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;8284D9;
    JSL.L DisableHVCounterInterrupts                                     ;8284DD;
    STZ.W $1982                                                          ;8284E1;
    SEP #$20                                                             ;8284E4;
    STZ.B $6E                                                            ;8284E6;
    STZ.B $71                                                            ;8284E8;
    LDA.B #$10                                                           ;8284EA;
    STA.B $69                                                            ;8284EC;
    STZ.B $6B                                                            ;8284EE;
    STZ.B $6C                                                            ;8284F0;
    STZ.B $6D                                                            ;8284F2;
    LDA.B #$09                                                           ;8284F4;
    STA.B $55                                                            ;8284F6;
    REP #$20                                                             ;8284F8;
    STZ.W $0723                                                          ;8284FA;
    STZ.W $0725                                                          ;8284FD;
    LDA.W #$0027                                                         ;828500;
    STA.W $0998                                                          ;828503;
    LDA.W #CinematicFunction_Ending_Setup                                ;828506;
    STA.W $1F51                                                          ;828509;
    STZ.W $0943                                                          ;82850C;
    LDA.W #$0000                                                         ;82850F;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;828512;
    LDA.W #$0002                                                         ;828516;
    JSL.L QueueSound                                                     ;828519;
    LDA.W #$0071                                                         ;82851D;
    JSL.L QueueSound_Lib2_Max15                                          ;828520;
    LDA.W #$0001                                                         ;828524;
    JSL.L QueueSound_Lib3_Max15                                          ;828527;
    PLP                                                                  ;82852B;
    RTS                                                                  ;82852C;


GameState_29_TransitionToDemo:
    PHP                                                                  ;82852D;
    REP #$30                                                             ;82852E;
    JSR.W GameState_8_MainGameplay                                       ;828530;
    JSL.L WaitForNMI                                                     ;828533;
    JSL.L HDMAObjectHandler_HandleMusicQueue                             ;828537;
    INC.W $0998                                                          ;82853B;
    SEP #$20                                                             ;82853E;
    LDA.B #$0F                                                           ;828540;
    STA.B $51                                                            ;828542;
    REP #$20                                                             ;828544;
    PLP                                                                  ;828546;
    RTS                                                                  ;828547;


GameState_2A_PlayingDemo:
    PHP                                                                  ;828548;
    REP #$30                                                             ;828549;
    JSR.W GameState_8_MainGameplay                                       ;82854B;
    LDA.B $8F                                                            ;82854E;
    BEQ .decDemoTimer                                                    ;828550;
    LDA.W #$0001                                                         ;828552;
    STA.W $0DEC                                                          ;828555;
    BRA .endDemos                                                        ;828558;


.decDemoTimer:
    DEC.W $1F53                                                          ;82855A;
    BEQ +                                                                ;82855D;
    BPL .return                                                          ;82855F;

  + STZ.W $0DEC                                                          ;828561;
    LDX.W #$005A                                                         ;828564;

.loop:
    JSL.L WaitForNMI                                                     ;828567;
    LDA.B $8F                                                            ;82856B;
    BNE .pressedInput                                                    ;82856D;
    DEX                                                                  ;82856F;
    BNE .loop                                                            ;828570;
    BRA .endDemos                                                        ;828572;


.pressedInput:
    LDA.W #$0001                                                         ;828574;
    STA.W $0DEC                                                          ;828577;

.endDemos:
    INC.W $0998                                                          ;82857A;
    STZ.W $05F5                                                          ;82857D;
    SEP #$20                                                             ;828580;
    LDA.B #$80                                                           ;828582;
    STA.B $51                                                            ;828584;
    REP #$20                                                             ;828586;
    LDA.W #$0001                                                         ;828588;
    STA.W $0723                                                          ;82858B;
    STA.W $0725                                                          ;82858E;

.return:
    PLP                                                                  ;828591;
    RTS                                                                  ;828592;


GameState_2B_UnloadGameData:
    PHP                                                                  ;828593;
    REP #$30                                                             ;828594;
    LDA.W $0DEC                                                          ;828596;
    CMP.W #$0001                                                         ;828599;
    BEQ +                                                                ;82859C;
    JSR.W CheckForNextDemo                                               ;82859E;

  + JSL.L EnableNMI                                                      ;8285A1;
    INC.W $0998                                                          ;8285A5;
    STZ.W $0723                                                          ;8285A8;
    STZ.W $0725                                                          ;8285AB;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;8285AE;
    JSL.L DisableHVCounterInterrupts                                     ;8285B2;
    STZ.W $1982                                                          ;8285B6;
    STZ.B $AB                                                            ;8285B9;
    STZ.B $A7                                                            ;8285BB;
    JSL.L Disable_PaletteFXObjects                                       ;8285BD;
    JSL.L Clear_PaletteFXObjects                                         ;8285C1;
    LDA.W #$1C1F                                                         ;8285C5;
    DEC A                                                                ;8285C8;
    DEC A                                                                ;8285C9;
    SEC                                                                  ;8285CA;
    SBC.W #$198D                                                         ;8285CB;
    TAX                                                                  ;8285CE;

.clearNonGameplayRAM:
    STZ.W $198D,X                                                        ;8285CF;
    DEX                                                                  ;8285D2;
    DEX                                                                  ;8285D3;
    BPL .clearNonGameplayRAM                                             ;8285D4;
    LDA.W #$0998                                                         ;8285D6;
    DEC A                                                                ;8285D9;
    DEC A                                                                ;8285DA;
    SEC                                                                  ;8285DB;
    SBC.W #$077C                                                         ;8285DC;
    TAX                                                                  ;8285DF;

.clearGameplayRAM:
    STZ.W $077C,X                                                        ;8285E0;
    DEX                                                                  ;8285E3;
    DEX                                                                  ;8285E4;
    BPL .clearGameplayRAM                                                ;8285E5;
    SEP #$20                                                             ;8285E7;
    STZ.B $6E                                                            ;8285E9;
    STZ.B $71                                                            ;8285EB;
    LDA.B #$10                                                           ;8285ED;
    STA.B $69                                                            ;8285EF;
    STZ.B $6B                                                            ;8285F1;
    STZ.B $6C                                                            ;8285F3;
    STZ.B $6D                                                            ;8285F5;
    REP #$20                                                             ;8285F7;
    PLP                                                                  ;8285F9;
    RTS                                                                  ;8285FA;


GameState_2C_TransitionFromDemo:
    PHP                                                                  ;8285FB;
    REP #$30                                                             ;8285FC;
    LDA.W #$0001                                                         ;8285FE;
    STA.W $0998                                                          ;828601;
    LDA.W $0DEC                                                          ;828604;
    BMI .nextDemoScene                                                   ;828607;
    BNE .titleSequence                                                   ;828609;
    LDA.W #$0000                                                         ;82860B;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;82860E;
    STZ.W $05F5                                                          ;828612;
    LDA.W #CinematicFunction_LoadTitleSequence                           ;828615;
    STA.W $1F51                                                          ;828618;
    PLP                                                                  ;82861B;
    RTS                                                                  ;82861C;


.titleSequence:
    JSL.L Load_Title_Sequence_Graphics                                   ;82861D;
    LDA.W #$0002                                                         ;828621;
    STA.W $1A53                                                          ;828624;
    LDA.W #RTS_8B9A47                                                    ;828627;
    STA.W $1F51                                                          ;82862A;
    PLP                                                                  ;82862D;
    RTS                                                                  ;82862E;


.nextDemoScene:
    LDA.W #$0028                                                         ;82862F;
    STA.W $0998                                                          ;828632;
    PLP                                                                  ;828635;
    RTS                                                                  ;828636;


CheckForNextDemo:
    PHP                                                                  ;828637;
    REP #$30                                                             ;828638;
    LDA.W $1F57                                                          ;82863A;
    ASL A                                                                ;82863D;
    ASL A                                                                ;82863E;
    ASL A                                                                ;82863F;
    ADC.W $1F57                                                          ;828640;
    ASL A                                                                ;828643;
    STA.B $12                                                            ;828644;
    LDA.W $1F55                                                          ;828646;
    ASL A                                                                ;828649;
    TAX                                                                  ;82864A;
    LDA.W DemoRoomData_pointers,X                                        ;82864B;
    CLC                                                                  ;82864E;
    ADC.B $12                                                            ;82864F;
    TAX                                                                  ;828651;
    LDA.W $0000,X                                                        ;828652;
    CMP.W #$FFFF                                                         ;828655;
    BNE .nextDemoScene                                                   ;828658;
    STZ.W $0DEC                                                          ;82865A;
    LDA.W $1F55                                                          ;82865D;
    INC A                                                                ;828660;
    CMP.W $1F59                                                          ;828661;
    BCC +                                                                ;828664;
    LDA.W #$0000                                                         ;828666;

  + STA.W $1F55                                                          ;828669;
    STZ.W $1F57                                                          ;82866C;
    PLP                                                                  ;82866F;
    RTS                                                                  ;828670;


.nextDemoScene:
    LDA.W #$8000                                                         ;828671;
    STA.W $0DEC                                                          ;828674;
    PLP                                                                  ;828677;
    RTS                                                                  ;828678;


LoadDemoRoomData:
    PHP                                                                  ;828679;
    REP #$30                                                             ;82867A;
    STZ.W $078D                                                          ;82867C;
    LDA.W $1F57                                                          ;82867F;
    ASL A                                                                ;828682;
    ASL A                                                                ;828683;
    ASL A                                                                ;828684;
    ADC.W $1F57                                                          ;828685;
    ASL A                                                                ;828688;
    STA.B $12                                                            ;828689;
    LDA.W $1F55                                                          ;82868B;
    ASL A                                                                ;82868E;
    TAX                                                                  ;82868F;
    LDA.W DemoRoomData_pointers,X                                        ;828690;
    CLC                                                                  ;828693;
    ADC.B $12                                                            ;828694;
    TAX                                                                  ;828696;
    LDA.W $0000,X                                                        ;828697;
    STA.W $079B                                                          ;82869A;
    LDA.W $0002,X                                                        ;82869D;
    STA.W $078D                                                          ;8286A0;
    LDA.W $0004,X                                                        ;8286A3;
    STA.W $078F                                                          ;8286A6;
    LDA.W $0006,X                                                        ;8286A9;
    STA.W $0911                                                          ;8286AC;
    STA.W $091D                                                          ;8286AF;
    LDA.W $0008,X                                                        ;8286B2;
    STA.W $0915                                                          ;8286B5;
    STA.W $091F                                                          ;8286B8;
    LDA.W $000A,X                                                        ;8286BB;
    CLC                                                                  ;8286BE;
    ADC.W $0915                                                          ;8286BF;
    STA.W $0AFA                                                          ;8286C2;
    STA.W $0B14                                                          ;8286C5;
    LDA.W $0911                                                          ;8286C8;
    CLC                                                                  ;8286CB;
    ADC.W #$0080                                                         ;8286CC;
    CLC                                                                  ;8286CF;
    ADC.W $000C,X                                                        ;8286D0;
    STA.W $0AF6                                                          ;8286D3;
    STA.W $0B10                                                          ;8286D6;
    LDA.W $000E,X                                                        ;8286D9;
    STA.W $1F53                                                          ;8286DC;
    PHB                                                                  ;8286DF;
    SEP #$20                                                             ;8286E0;
    LDA.B #$8F                                                           ;8286E2;
    PHA                                                                  ;8286E4;
    PLB                                                                  ;8286E5;
    LDX.W $079B                                                          ;8286E6;
    LDA.W $0001,X                                                        ;8286E9;
    STA.W $079F                                                          ;8286EC;
    REP #$20                                                             ;8286EF;
    PLB                                                                  ;8286F1;
    STZ.B $B1                                                            ;8286F2;
    STZ.B $B3                                                            ;8286F4;
    INC.W $1F57                                                          ;8286F6;
    LDX.W #$0000                                                         ;8286F9;

.loopEvents:
    LDA.W #$FFFF                                                         ;8286FC;
    STA.L $7ED830,X                                                      ;8286FF;
    STA.L $7ED870,X                                                      ;828703;
    STA.L $7ED8F0,X                                                      ;828707;
    STA.L $7ED908,X                                                      ;82870B;
    STA.L $7ED8F8,X                                                      ;82870F;
    STA.L $7ED900,X                                                      ;828713;
    LDA.W #$0000                                                         ;828717;
    STA.L $7ED8B0,X                                                      ;82871A;
    STA.L $7ED820,X                                                      ;82871E;
    STA.L $7ED828,X                                                      ;828722;
    INX                                                                  ;828726;
    INX                                                                  ;828727;
    CPX.W #$0008                                                         ;828728;
    BMI .loopEvents                                                      ;82872B;

.loopItems:
    LDA.W #$FFFF                                                         ;82872D;
    STA.L $7ED830,X                                                      ;828730;
    STA.L $7ED870,X                                                      ;828734;
    LDA.W #$0000                                                         ;828738;
    STA.L $7ED8B0,X                                                      ;82873B;
    INX                                                                  ;82873F;
    INX                                                                  ;828740;
    CPX.W #$0040                                                         ;828741;
    BMI .loopItems                                                       ;828744;
    LDA.W #$0000                                                         ;828746;
    LDX.W #$0000                                                         ;828749;

.loopMapData:
    STA.L $7ECD52,X                                                      ;82874C;
    INX                                                                  ;828750;
    INX                                                                  ;828751;
    CPX.W #$0600                                                         ;828752;
    BMI .loopMapData                                                     ;828755;
    LDA.W #$0000                                                         ;828757;
    STA.W $09D4                                                          ;82875A;
    STA.W $09D6                                                          ;82875D;
    STA.W $09C0                                                          ;828760;
    STA.L $7ED914                                                        ;828763;
    STA.W $05F7                                                          ;828767;
    PLP                                                                  ;82876A;
    RTS                                                                  ;82876B;


DemoRoomData_pointers:
    dw DemoRoomData_set0                                                 ;82876C;
    dw DemoRoomData_set1                                                 ;82876E;
    dw DemoRoomData_set2                                                 ;828770;
    dw DemoRoomData_set3                                                 ;828772;

DemoRoomData_set0:
    dw RoomHeader_LandingSite                                            ;828774;
    dw Door_Parlor_1                                                     ;828776;
    dw $0001,$0400,$0400,$0040,$0001,$04D3                               ;828778;
    dw DemoRoomCode_LandingSite_BG2Tilemap                               ;828784;

    dw RoomHeader_ConstructionZone                                       ;828786;
    dw Door_MorphBall_1                                                  ;828788;
    dw $0001,$0000,$0000,$006B,$FFD2,$0151                               ;82878A;
    dw RTS_828924                                                        ;828796;

    dw RoomHeader_SporeSpawnKihunters                                    ;828798;
    dw Door_BigPink_0                                                    ;82879A;
    dw $0000,$0100,$0000,$00BB,$FFE0,$017A                               ;82879C;
    dw RTS_828924                                                        ;8287A8;

    dw RoomHeader_FrogSpeedway                                           ;8287AA;
    dw Door_UpperNorfairFarming_0                                        ;8287AC;
    dw $0000,$0700,$0000,$008B,$0048,$01A4                               ;8287AE;
    dw RTS_828924                                                        ;8287BA;

    dw RoomHeader_SpikyAcidSnakesTunnel                                  ;8287BC;
    dw Door_UpperNorfairRefill_1                                         ;8287BE;
    dw $0001,$0000,$0000,$008B,$FFC2,$01BC                               ;8287C0;
    dw RTS_828924                                                        ;8287CC;

    dw RoomHeader_BigPink                                                ;8287CE;
    dw Door_GreenHillZone_0                                              ;8287D0;
    dw $0000,$0200,$0600,$0099,$0027,$0265                               ;8287D2;
    dw DemoRoomCode_ChargeBeamRoom_Scroll21hRed                          ;8287DE;

    dw $FFFF                                                             ;8287E0;

DemoRoomData_set1:
    dw RoomHeader_BelowSpazer                                            ;8287E2;
    dw Door_WestTunnel_1                                                 ;8287E4;
    dw $0000,$0100,$0100,$008B,$0056,$01FD                               ;8287E6;
    dw RTS_828924                                                        ;8287F2;

    dw RoomHeader_GreenBrinstarFirefleas                                 ;8287F4;
    dw Door_GreenBrinstarMainShaft_3                                     ;8287F6;
    dw $0003,$0200,$0000,$008B,$0049,$019A                               ;8287F8;
    dw RTS_828924                                                        ;828804;

    dw RoomHeader_GreenHillZone                                          ;828806;
    dw Door_BigPink_3                                                    ;828808;
    dw $0003,$0500,$0300,$00AB,$FFE2,$0117                               ;82880A;
    dw RTS_828924                                                        ;828816;

    dw RoomHeader_LavaDive                                               ;828818;
    dw Door_KronicBoost_2                                                ;82881A;
    dw $0002,$0300,$0000,$008B,$004B,$03CA                               ;82881C;
    dw RTS_828924                                                        ;828828;

    dw RoomHeader_Flyway                                                 ;82882A;
    dw Door_Parlor_3                                                     ;82882C;
    dw $0003,$0000,$0000,$00BB,$FFF1,$00D5                               ;82882E;
    dw RTS_828924                                                        ;82883A;

    dw RoomHeader_Dachora                                                ;82883C;
    dw Door_BigPink_1                                                    ;82883E;
    dw $0001,$0400,$0200,$0080,$0005,$0317                               ;828840;
    dw RTS_828924                                                        ;82884C;

    dw $FFFF                                                             ;82884E;

DemoRoomData_set2:
    dw RoomHeader_Basement                                               ;828850;
    dw Door_WreckedShipMainShaft_3                                       ;828852;
    dw $0003,$0200,$0000,$0060,$0004,$02EF                               ;828854;
    dw RTS_828924                                                        ;828860;

    dw RoomHeader_LandingSite                                            ;828862;
    dw Door_Parlor_1                                                     ;828864;
    dw $0001,$0300,$0400,$00B0,$0000,$00C7                               ;828866;
    dw DemoRoomCode_LandingSite_BG2Tilemap                               ;828872;

    dw RoomHeader_KraidEyeDoor                                           ;828874;
    dw Door_MiniKraid_1                                                  ;828876;
    dw $0001,$0000,$0100,$008B,$FFD2,$02D3                               ;828878;
    dw RTS_828924                                                        ;828884;

    dw RoomHeader_Caterpillar                                            ;828886;
    dw Door_AlphaPowerBomb_0                                             ;828888;
    dw $0000,$0000,$0700,$008B,$FFAA,$0164                               ;82888A;
    dw RTS_828924                                                        ;828896;

    dw RoomHeader_Kraid                                                  ;828898;
    dw Door_KraidEyeDoor_1                                               ;82889A;
    dw $0001,$0000,$0100,$008B,$FFBF,$013F                               ;82889C;
    dw DemoRoomCode_Kraid_KraidFunctionTimer                             ;8288A8;

    dw RoomHeader_Statues                                                ;8288AA;
    dw Door_StatuesHallway_1                                             ;8288AC;
    dw $0001,$0000,$0000,$008B,$FFB1,$0197                               ;8288AE;
    dw DemoRoomCode_TourianEntrance_KraidIsDead                          ;8288BA;

    dw $FFFF                                                             ;8288BC;

DemoRoomData_set3:
    dw RoomHeader_LandingSite                                            ;8288BE;
    dw Door_DemoSet3_0_2_4                                               ;8288C0;
    dw $0000,$0600,$0200,$0080,$0030,$0100                               ;8288C2;
    dw DemoRoomCode_LandingSite_BG2Tilemap                               ;8288CE;

    dw RoomHeader_MtEverest                                              ;8288D0;
    dw Door_RedFish_0                                                    ;8288D2;
    dw $0000,$0200,$0000,$00AB,$0000,$0332                               ;8288D4;
    dw RTS_828924                                                        ;8288E0;

    dw RoomHeader_LandingSite                                            ;8288E2;
    dw Door_DemoSet3_0_2_4                                               ;8288E4;
    dw $0000,$0600,$0200,$007B,$0020,$0185                               ;8288E6;
    dw DemoRoomCode_LandingSite_BG2Tilemap                               ;8288F2;

    dw RoomHeader_GreenBrinstarMainShaft                                 ;8288F4;
    dw Door_BrinstarPreMap_1                                             ;8288F6;
    dw $0001,$0000,$0400,$008B,$FFB7,$018A                               ;8288F8;
    dw RTS_828924                                                        ;828904;

    dw RoomHeader_LandingSite                                            ;828906;
    dw Door_DemoSet3_0_2_4                                               ;828908;
    dw $0000,$0600,$0200,$008B,$0004,$0200                               ;82890A;
    dw DemoRoomCode_LandingSite_BG2Tilemap                               ;828916;

    dw $FFFF                                                             ;828918;

DemoRoomCode_ChargeBeamRoom_Scroll21hRed:
    SEP #$20                                                             ;82891A;
    LDA.B #$00                                                           ;82891C;
    STA.L $7ECD41                                                        ;82891E;
    REP #$20                                                             ;828922;

RTS_828924:
    RTS                                                                  ;828924;


DemoRoomCode_LandingSite_BG2Tilemap:
    LDA.W #$004A                                                         ;828925;
    STA.B $59                                                            ;828928;
    RTS                                                                  ;82892A;


DemoRoomCode_Kraid_KraidFunctionTimer:
    LDA.W #$003C                                                         ;82892B;
    STA.W $0FB2                                                          ;82892E;
    RTS                                                                  ;828931;


DemoRoomCode_TourianEntrance_KraidIsDead:
    SEP #$20                                                             ;828932;
    LDA.B #$01                                                           ;828934;
    STA.L $7ED829                                                        ;828936;
    REP #$20                                                             ;82893A;
    RTS                                                                  ;82893C;


MainGameLoop:
    PHK                                                                  ;82893D;
    PLB                                                                  ;82893E;
    REP #$20                                                             ;82893F;
    STZ.W $0998                                                          ;828941;
    STZ.W $0DF4                                                          ;828944;
    CLI                                                                  ;828947;

.loop:
    PHP                                                                  ;828948;
    REP #$30                                                             ;828949;
    JSL.L HDMAObjectHandler_HandleMusicQueue                             ;82894B;
    JSL.L GenerateRandomNumber                                           ;82894F;
    JSL.L ClearHighOAM                                                   ;828953;
    STZ.W $0590                                                          ;828957;
    STZ.W $071D                                                          ;82895A;
    STZ.W $071F                                                          ;82895D;
    STZ.W $0721                                                          ;828960;
    LDA.W $0998                                                          ;828963;
    AND.W #$00FF                                                         ;828966;
    ASL A                                                                ;828969;
    TAX                                                                  ;82896A;
    JSR.W (.gamemodes,X)                                                 ;82896B;
    JSL.L HandleSounds                                                   ;82896E;
    JSL.L Finalise_OAM                                                   ;828972;
    JSL.L ShowSpareCPUDebug_UpdatePrevCtrl1Input                         ;828976;
    JSL.L WaitForNMI                                                     ;82897A;
    PLP                                                                  ;82897E;
    BRA .loop                                                            ;82897F;


.gamemodes:
    dw GameState_0_ResetStart                                            ;828981;
    dw GameState_1_TitleSequence                                         ;828983;
    dw GameState_2_GameOptionsMenu                                       ;828985;
    dw GameState_3_Nothing                                               ;828987;
    dw GameState_4_FileSelectMenus                                       ;828989;
    dw GameState_5_FileSelectMap                                         ;82898B;
    dw GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData       ;82898D;
    dw GameState_7_MainGameplayFadingIn                                  ;82898F;
    dw GameState_8_MainGameplay                                          ;828991;
    dw GameState_9_HitADoorBlock                                         ;828993;
    dw GameState_A_LoadingNextRoom                                       ;828995;
    dw GameState_B_LoadingNextRoom                                       ;828997;
    dw GameState_C_Pausing_NormalGameplayDarkening                       ;828999;
    dw GameState_D_Pausing_LoadingPauseScreen                            ;82899B;
    dw GameState_E_Paused_LoadingPauseScreen                             ;82899D;
    dw GameState_F_Paused_MapAndItemScreens                              ;82899F;
    dw GameState_10_Unpausing_LoadingNormalGameplay                      ;8289A1;
    dw GameState_11_Unpausing_LoadingNormalGameplay                      ;8289A3;
    dw GameState_12_Unpausing_NormalGameplayBrightening                  ;8289A5;
    dw GameState_13_DeathSequence_Start                                  ;8289A7;
    dw GameState_14_DeathSequence_BlackOutSurroundings                   ;8289A9;
    dw GameState_15_DeathSequence_WaitForMusic                           ;8289AB;
    dw GameState_16_DeathSequence_PreFlashing                            ;8289AD;
    dw GameState_17_DeathSequence_Flashing                               ;8289AF;
    dw GameState_18_DeathSequence_ExplosionWhiteOut                      ;8289B1;
    dw GameState_19_DeathSequence_BlackOut                               ;8289B3;
    dw GameState_1A_GameOverScreen                                       ;8289B5;
    dw GameState_1B_ReserveTankAuto                                      ;8289B7;
    dw UNUSED_GameState_1C_828B3F                                        ;8289B9;
    dw GameState_1D_DebugGameOverMenu                                    ;8289BB;
    dw GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes           ;8289BD;
    dw GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData       ;8289BF;
    dw GameState_20_MadeItToCeresElevator                                ;8289C1;
    dw GameState_21_BlackoutFromCeres                                    ;8289C3;
    dw GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes           ;8289C5;
    dw GameState_23_TimeUp                                               ;8289C7;
    dw GameState_24_WhitingOutFromTimeUp                                 ;8289C9;
    dw GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes           ;8289CB;
    dw GameState_26_SamusEscapesFromZebes                                ;8289CD;
    dw GameState_27_EndingAndCredits                                     ;8289CF;
    dw GameState_6_1F_28_LoadingGameData_SetupNewGame_LoadDemoData       ;8289D1;
    dw GameState_29_TransitionToDemo                                     ;8289D3;
    dw GameState_2A_PlayingDemo                                          ;8289D5;
    dw GameState_2B_UnloadGameData                                       ;8289D7;
    dw GameState_2C_TransitionFromDemo                                   ;8289D9;

GameState_1D_DebugGameOverMenu:
    JSL.L Debug_GameOverMenu                                             ;8289DB;
    RTS                                                                  ;8289DF;


GameState_1A_GameOverScreen:
    JSL.L GameOverMenu                                                   ;8289E0;
    RTS                                                                  ;8289E4;


GameState_4_FileSelectMenus:
    JSL.L FileSelectMenu                                                 ;8289E5;
    RTS                                                                  ;8289E9;


GameState_5_FileSelectMap:
    JSL.L FileSelectMap                                                  ;8289EA;
    RTS                                                                  ;8289EE;


HandleSounds:
    PHP                                                                  ;8289EF;
    SEP #$30                                                             ;8289F0;
    LDA.W $0686                                                          ;8289F2;
    DEC A                                                                ;8289F5;
    BPL .downtime                                                        ;8289F6;
    LDY.B #$00                                                           ;8289F8;

.loop:
    PHY                                                                  ;8289FA;
    LDA.W $0649,Y                                                        ;8289FB;
    ASL A                                                                ;8289FE;
    TAX                                                                  ;8289FF;
    JSR.W (.pointers,X)                                                  ;828A00;
    PLY                                                                  ;828A03;
    INY                                                                  ;828A04;
    CPY.B #$03                                                           ;828A05;
    BCC .loop                                                            ;828A07;
    PLP                                                                  ;828A09;
    RTL                                                                  ;828A0A;


.downtime:
    STA.W $0686                                                          ;828A0B;
    STZ.W $2141                                                          ;828A0E;
    STZ.W $064D                                                          ;828A11;
    STZ.W $2142                                                          ;828A14;
    STZ.W $064E                                                          ;828A17;
    STZ.W $2143                                                          ;828A1A;
    STZ.W $064F                                                          ;828A1D;
    PLP                                                                  ;828A20;
    RTL                                                                  ;828A21;


.pointers:
    dw SoundState_0_SendAPUSoundRequestFromQueue                         ;828A22;
    dw SoundState_1_WaitForAPUSoundRequestAcknowledgement                ;828A24;
    dw SoundState_2_ClearSoundRequest                                    ;828A26;
    dw SoudnState_3_WaitForAPUClearRequestAcknowledgement                ;828A28;
    dw SoundState_4_ResetSoundState                                      ;828A2A;

SoundState_0_SendAPUSoundRequestFromQueue:
    TYX                                                                  ;828A2C;
    LDA.W $0643,X                                                        ;828A2D;
    CMP.W $0646,X                                                        ;828A30;
    BEQ .return                                                          ;828A33;
    LDA.L .data,X                                                        ;828A35;
    CLC                                                                  ;828A39;
    ADC.W $0643,X                                                        ;828A3A;
    TAY                                                                  ;828A3D;
    LDA.W $0656,Y                                                        ;828A3E;
    STA.W $2141,X                                                        ;828A41;
    STA.W $064D,X                                                        ;828A44;
    INY                                                                  ;828A47;
    TYA                                                                  ;828A48;
    AND.B #$0F                                                           ;828A49;
    STA.W $0643,X                                                        ;828A4B;
    INC.W $0649,X                                                        ;828A4E;

.return:
    RTS                                                                  ;828A51;


.data:
    db $00,$10,$20                                                       ;828A52;

SoundState_1_WaitForAPUSoundRequestAcknowledgement:
    TYX                                                                  ;828A55;
    LDA.W $064D,X                                                        ;828A56;
    CMP.W $2141,X                                                        ;828A59;
    BEQ .incState                                                        ;828A5C;
    STA.W $2141,X                                                        ;828A5E;
    BRA .return                                                          ;828A61;


.incState:
    INC.W $0649,X                                                        ;828A63;
    LDA.B #$02                                                           ;828A66;
    STA.W $0650,X                                                        ;828A68;

.return:
    RTS                                                                  ;828A6B;


SoundState_2_ClearSoundRequest:
    TYX                                                                  ;828A6C;
    DEC.W $0650,X                                                        ;828A6D;
    BNE .return                                                          ;828A70;
    STZ.W $2141,X                                                        ;828A72;
    STZ.W $064D,X                                                        ;828A75;
    INC.W $0649,X                                                        ;828A78;

.return:
    RTS                                                                  ;828A7B;


SoudnState_3_WaitForAPUClearRequestAcknowledgement:
    TYX                                                                  ;828A7C;
    LDA.W $064D,X                                                        ;828A7D;
    CMP.W $2141,X                                                        ;828A80;
    BEQ .state0                                                          ;828A83;
    STA.W $2141,X                                                        ;828A85;
    BRA .return                                                          ;828A88;


.state0:
    STZ.W $0649,X                                                        ;828A8A;
    BRA SoundState_0_SendAPUSoundRequestFromQueue                        ;828A8D;


.return:
    RTS                                                                  ;828A8F;


SoundState_4_ResetSoundState:
    TYX                                                                  ;828A90;
    DEC.W $0650,X                                                        ;828A91;
    BNE .return                                                          ;828A94;
    STZ.W $0649,X                                                        ;828A96;

.return:
    RTS                                                                  ;828A99;


ResetSoundQueues:
    PHP                                                                  ;828A9A;
    REP #$20                                                             ;828A9B;
    STZ.W $0643                                                          ;828A9D;
    STZ.W $0645                                                          ;828AA0;
    STZ.W $0647                                                          ;828AA3;
    STZ.W $0649                                                          ;828AA6;
    SEP #$20                                                             ;828AA9;
    STZ.W $064B                                                          ;828AAB;
    PLP                                                                  ;828AAE;
    RTL                                                                  ;828AAF;


ShowSpareCPUDebug_UpdatePrevCtrl1Input:
    PHP                                                                  ;828AB0;
    REP #$30                                                             ;828AB1;
    LDA.W $05C5                                                          ;828AB3;
    AND.W #$4000                                                         ;828AB6;
    BEQ +                                                                ;828AB9;
    LDA.W $0DF4                                                          ;828ABB;
    BNE .clearFlag                                                       ;828ABE;
    LDA.W #$0001                                                         ;828AC0;
    STA.W $0DF4                                                          ;828AC3;
    BRA +                                                                ;828AC6;


.clearFlag:
    STZ.W $0DF4                                                          ;828AC8;

  + LDA.W $0DF4                                                          ;828ACB;
    BEQ .return                                                          ;828ACE;
    SEP #$20                                                             ;828AD0;
    LDA.B $51                                                            ;828AD2;
    AND.B #$F0                                                           ;828AD4;
    ORA.B #$05                                                           ;828AD6;
    STA.W $2100                                                          ;828AD8;
    REP #$20                                                             ;828ADB;

.return:
    LDA.B $8B                                                            ;828ADD;
    STA.W $0DFE                                                          ;828ADF;
    PLP                                                                  ;828AE2;
    RTL                                                                  ;828AE3;


GameState_0_ResetStart:
    STZ.W $0DF8                                                          ;828AE4;
    STZ.W $0DFA                                                          ;828AE7;
    STZ.W $0DFC                                                          ;828AEA;
    LDA.W #CinematicFunction_LoadTitleSequence                           ;828AED;
    STA.W $1F51                                                          ;828AF0;
    STZ.W $1F55                                                          ;828AF3;
    LDA.W $1F59                                                          ;828AF6;
    CMP.W #$0004                                                         ;828AF9;
    BNE .return                                                          ;828AFC;
    LDA.W #$0003                                                         ;828AFE;
    STA.W $1F55                                                          ;828B01;

.return:
    INC.W $0998                                                          ;828B04;
    RTS                                                                  ;828B07;


GameState_1_TitleSequence:
    JSL.L GameState1_TitleSequence                                       ;828B08;
    RTS                                                                  ;828B0C;


GameState_3_Nothing:
    RTS                                                                  ;828B0D;


GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes:
    JSL.L GameState_1E_22_25_Intro_CeresGoesBoom_SamusGoesToZebes_8B     ;828B0E;
    RTS                                                                  ;828B12;


GameState_27_EndingAndCredits:
    JSL.L GameState27_EndingAndCredits                                   ;828B13;
    RTS                                                                  ;828B17;


UNUSED_IncrementGameState_828B18:
    PHP                                                                  ;828B18;
    REP #$30                                                             ;828B19;
    INC.W $0998                                                          ;828B1B;
    PLP                                                                  ;828B1E;
    RTS                                                                  ;828B1F;


GameState_7_MainGameplayFadingIn:
    PHP                                                                  ;828B20;
    REP #$30                                                             ;828B21;
    JSR.W GameState_8_MainGameplay                                       ;828B23;
    JSL.L HandleFadingIn                                                 ;828B26;
    SEP #$20                                                             ;828B2A;
    LDA.B $51                                                            ;828B2C;
    CMP.B #$0F                                                           ;828B2E;
    BNE .return                                                          ;828B30;
    REP #$20                                                             ;828B32;
    STZ.W $0723                                                          ;828B34;
    STZ.W $0725                                                          ;828B37;
    INC.W $0998                                                          ;828B3A;

.return:
    PLP                                                                  ;828B3D;
    RTS                                                                  ;828B3E;


UNUSED_GameState_1C_828B3F:
    JSL.L UNUSED_GameState1C_91D4DA                                      ;828B3F;
    RTS                                                                  ;828B43;


GameState_8_MainGameplay:
    PHP                                                                  ;828B44;
    REP #$30                                                             ;828B45;
    JSL.L Determine_Which_Enemies_to_Process                             ;828B47;
    JSL.L DebugHandler                                                   ;828B4B;
    AND.W #$FFFF                                                         ;828B4F;
    BNE .skipProcessing                                                  ;828B52;
    JSL.L PaletteFXObject_Handler                                        ;828B54;
    JSL.L SamusCurrentStateHandler                                       ;828B58;
    LDA.W $0E12                                                          ;828B5C;
    BNE +                                                                ;828B5F;
    JSL.L Samus_Projectiles_Interaction_Handling                         ;828B61;

  + JSL.L Main_Enemy_Routine                                             ;828B65;
    JSL.L SamusNewStateHandler                                           ;828B69;
    JSL.L Enemy_Projectile_Handler                                       ;828B6D;
    JSL.L PLM_Handler                                                    ;828B71;
    JSL.L AnimatedTilesObject_Handler                                    ;828B75;
    LDA.W $0E12                                                          ;828B79;
    BNE +                                                                ;828B7C;
    JSL.L EnemyProjectile_Samus_Collision_Handling                       ;828B7E;
    JSL.L Projectile_vs_Projectile_Collision_Handling                    ;828B82;
    JSL.L Process_Enemy_PowerBomb_Interaction                            ;828B86;

  + JSL.L Main_Scrolling_Routine                                         ;828B8A;
    LDA.L DebugConst_DebugScrolling                                      ;828B8E;
    BEQ +                                                                ;828B92;
    JSL.L Debug_Layer1Position_Saving_Loading                            ;828B94;

  + JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles           ;828B98;
    JSL.L Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer                 ;828B9C;

.skipProcessing:
    JSL.L HandleHUDTilemap_PausedAndRunning                              ;828BA0;
    JSL.L Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling   ;828BA4;
    JSL.L Execute_Room_Main_ASM                                          ;828BA8;
    JSR.W HandleSamusRunningOutOfEnergy_and_IncrementGameTime            ;828BAC;
    JSL.L Handle_Room_Shaking                                            ;828BAF;
    JSL.L DecrementSamusHurtTimers_ClearActiveEnemyIndicesLists          ;828BB3;
    PLP                                                                  ;828BB7;
    RTS                                                                  ;828BB8;


Delete_GameOptionsMenu_Objects:
    PHP                                                                  ;828BB9;
    REP #$30                                                             ;828BBA;
    LDX.W #$000E                                                         ;828BBC;

.loop:
    STZ.W $1A9D,X                                                        ;828BBF;
    STZ.W $1AFD,X                                                        ;828BC2;
    DEX                                                                  ;828BC5;
    DEX                                                                  ;828BC6;
    BPL .loop                                                            ;828BC7;
    PLP                                                                  ;828BC9;
    RTS                                                                  ;828BCA;


Spawn_GameOptionsMenu_Object:
    PHP                                                                  ;828BCB;
    REP #$30                                                             ;828BCC;
    PHX                                                                  ;828BCE;
    STA.W $1A93                                                          ;828BCF;
    TYX                                                                  ;828BD2;
    LDY.W #$000E                                                         ;828BD3;

.loop:
    LDA.W $1AFD,Y                                                        ;828BD6;
    BEQ .instruction                                                     ;828BD9;
    DEY                                                                  ;828BDB;
    DEY                                                                  ;828BDC;
    BPL .loop                                                            ;828BDD;
    PLX                                                                  ;828BDF;
    PLP                                                                  ;828BE0;
    SEC                                                                  ;828BE1;
    RTS                                                                  ;828BE2;


.instruction:
    REP #$30                                                             ;828BE3;
    LDA.W $0002,X                                                        ;828BE5;
    STA.W $1B0D,Y                                                        ;828BE8;
    LDA.W $0004,X                                                        ;828BEB;
    STA.W $1AFD,Y                                                        ;828BEE;
    LDA.W #$0001                                                         ;828BF1;
    STA.W $1B1D,Y                                                        ;828BF4;
    LDA.W #$0000                                                         ;828BF7;
    STA.W $1A9D,Y                                                        ;828BFA;
    LDA.W #$0000                                                         ;828BFD;
    STA.W $1B2D,Y                                                        ;828C00;
    STA.W $1ADD,Y                                                        ;828C03;
    STA.W $1AED,Y                                                        ;828C06;
    JSR.W ($0000,X)                                                      ;828C09;
    PLX                                                                  ;828C0C;
    PLP                                                                  ;828C0D;
    CLC                                                                  ;828C0E;
    RTS                                                                  ;828C0F;


RTS_828C10:
    RTS                                                                  ;828C10;


GameOptionsMenu_ObjectHandler:
    PHP                                                                  ;828C11;
    REP #$30                                                             ;828C12;
    LDX.W #$000E                                                         ;828C14;

.loop:
    STX.W $1A8F                                                          ;828C17;
    LDA.W $1AFD,X                                                        ;828C1A;
    BEQ .next                                                            ;828C1D;
    JSR.W Process_GameOptionsMenu_Object                                 ;828C1F;
    LDX.W $1A8F                                                          ;828C22;

.next:
    DEX                                                                  ;828C25;
    DEX                                                                  ;828C26;
    BPL .loop                                                            ;828C27;
    PLP                                                                  ;828C29;
    RTS                                                                  ;828C2A;


Process_GameOptionsMenu_Object:
    JSR.W ($1B0D,X)                                                      ;828C2B;
    LDX.W $1A8F                                                          ;828C2E;
    DEC.W $1B1D,X                                                        ;828C31;
    BNE .return                                                          ;828C34;
    LDY.W $1AFD,X                                                        ;828C36;

.returnPEA:
    LDA.W $0000,Y                                                        ;828C39;
    BPL .instruction                                                     ;828C3C;
    STA.B $12                                                            ;828C3E;
    INY                                                                  ;828C40;
    INY                                                                  ;828C41;
    PEA.W .returnPEA-1                                                   ;828C42;
    JMP.W ($0012)                                                        ;828C45;


.instruction:
    STA.W $1B1D,X                                                        ;828C48;
    LDA.W $0002,Y                                                        ;828C4B;
    STA.W $1A9D,X                                                        ;828C4E;
    TYA                                                                  ;828C51;
    CLC                                                                  ;828C52;
    ADC.W #$0004                                                         ;828C53;
    STA.W $1AFD,X                                                        ;828C56;

.return:
    RTS                                                                  ;828C59;


Instruction_GameOptionsMenu_Delete:
    REP #$30                                                             ;828C5A;
    STZ.W $1A9D,X                                                        ;828C5C;
    STZ.W $1AFD,X                                                        ;828C5F;
    PLA                                                                  ;828C62;
    RTS                                                                  ;828C63;


Instruction_GameOptionsMenu_Sleep:
    REP #$30                                                             ;828C64;
    DEY                                                                  ;828C66;
    DEY                                                                  ;828C67;
    TYA                                                                  ;828C68;
    STA.W $1AFD,X                                                        ;828C69;
    PLA                                                                  ;828C6C;
    RTS                                                                  ;828C6D;


Instruction_GameOptionsMenu_PreInstruction_inY:
    REP #$30                                                             ;828C6E;
    LDA.W $0000,Y                                                        ;828C70;
    STA.W $1B0D,X                                                        ;828C73;
    INY                                                                  ;828C76;
    INY                                                                  ;828C77;
    RTS                                                                  ;828C78;


Instruction_GameOptionsMenu_ClearPreInstruction:
    REP #$30                                                             ;828C79;
    LDA.W #.RTS                                                          ;828C7B;
    STA.W $1B0D,X                                                        ;828C7E;

.RTS:
    RTS                                                                  ;828C81;


Instruction_GameOptionsMenu_GotoY:
    REP #$30                                                             ;828C82;
    LDA.W $0000,Y                                                        ;828C84;
    TAY                                                                  ;828C87;
    RTS                                                                  ;828C88;


Instruction_GameOptionsMenu_DecTimer_and_GotoY_if_NonZero:
    REP #$30                                                             ;828C89;
    DEC.W $1B2D,X                                                        ;828C8B;
    BNE Instruction_GameOptionsMenu_GotoY                                ;828C8E;
    INY                                                                  ;828C90;
    INY                                                                  ;828C91;
    RTS                                                                  ;828C92;


Instruction_GameOptionsMenu_TimerInY:
    REP #$30                                                             ;828C93;
    LDA.W $0000,Y                                                        ;828C95;
    STA.W $1B2D,X                                                        ;828C98;
    INY                                                                  ;828C9B;
    INY                                                                  ;828C9C;
    RTS                                                                  ;828C9D;


REP30RTS_828C9E:
    REP #$30                                                             ;828C9E;
    RTS                                                                  ;828CA0;


Draw_GameOptionsMenu_Spritemaps:
    PHP                                                                  ;828CA1;
    REP #$30                                                             ;828CA2;
    PHB                                                                  ;828CA4;
    LDX.W #$000E                                                         ;828CA5;

.loop:
    LDA.W $1A9D,X                                                        ;828CA8;
    BEQ .next                                                            ;828CAB;
    PEA.W $8200                                                          ;828CAD;
    PLB                                                                  ;828CB0;
    PLB                                                                  ;828CB1;
    LDY.W $1A9D,X                                                        ;828CB2;
    LDA.W $1ACD,X                                                        ;828CB5;
    STA.B $16                                                            ;828CB8;
    LDA.W $1AAD,X                                                        ;828CBA;
    STA.B $14                                                            ;828CBD;
    LDA.W $1ABD,X                                                        ;828CBF;
    STA.B $12                                                            ;828CC2;
    JSL.L AddSpritemapToOAM                                              ;828CC4;

.next:
    DEX                                                                  ;828CC8;
    DEX                                                                  ;828CC9;
    BPL .loop                                                            ;828CCA;
    PLB                                                                  ;828CCC;
    PLP                                                                  ;828CCD;
    RTS                                                                  ;828CCE;


GameState_C_Pausing_NormalGameplayDarkening:
    PHP                                                                  ;828CCF;
    REP #$30                                                             ;828CD0;
    JSR.W GameState_8_MainGameplay                                       ;828CD2;
    JSL.L HandleFadingOut                                                ;828CD5;
    LDA.B $51                                                            ;828CD9;
    AND.W #$000F                                                         ;828CDB;
    BNE .return                                                          ;828CDE;
    JSL.L EnableNMI                                                      ;828CE0;
    STZ.W $0723                                                          ;828CE4;
    STZ.W $0725                                                          ;828CE7;
    INC.W $0998                                                          ;828CEA;

.return:
    PLP                                                                  ;828CED;
    RTS                                                                  ;828CEE;


GameState_D_Pausing_LoadingPauseScreen:
    PHP                                                                  ;828CEF;
    REP #$30                                                             ;828CF0;
    PHB                                                                  ;828CF2;
    PHK                                                                  ;828CF3;
    PLB                                                                  ;828CF4;
    JSL.L Disable_HDMAObjects                                            ;828CF5;
    SEP #$20                                                             ;828CF9;
    LDA.B #$00                                                           ;828CFB;
    STA.B $85                                                            ;828CFD;
    STA.W $420C                                                          ;828CFF;
    REP #$20                                                             ;828D02;
    JSL.L Disable_AnimatedTilesObjects                                   ;828D04;
    JSR.W Backup_BG2Tilemap_for_PauseMenu                                ;828D08;
    PHP                                                                  ;828D0B;
    PHB                                                                  ;828D0C;
    PHK                                                                  ;828D0D;
    PEA.W .returnPEA-1                                                   ;828D0E;
    JML.W [$0601]                                                        ;828D11;


.returnPEA:
    PLB                                                                  ;828D14;
    PLP                                                                  ;828D15;
    JSL.L Cancel_Sound_Effects                                           ;828D16;
    JSR.W Backup_SomeGraphicsState_for_PauseScreen                       ;828D1A;
    JSL.L LoadPauseMenuTiles_ClearBG2Tilemap                             ;828D1D;
    JSL.L LoadPauseScreen_BaseTilemaps                                   ;828D21;
    JSL.L Load_PauseMenuMapTilemap_and_AreaLabel                         ;828D25;
    JSR.W BackupGameplayPalettes_LoadPauseScreenPalettes                 ;828D29;
    JSR.W ContinueInitializingPauseMenu                                  ;828D2C;
    LDA.W #$0001                                                         ;828D2F;
    STA.W $0723                                                          ;828D32;
    STA.W $0725                                                          ;828D35;
    STZ.W $074D                                                          ;828D38;
    LDA.W #$0001                                                         ;828D3B;
    STA.W $073B                                                          ;828D3E;
    STZ.W $05FD                                                          ;828D41;
    STZ.W $05FF                                                          ;828D44;
    JSL.L QueueClearingOfFXTilemap                                       ;828D47;
    INC.W $0998                                                          ;828D4B;
    PLB                                                                  ;828D4E;
    PLP                                                                  ;828D4F;
    RTS                                                                  ;828D50;


Backup_BG2Tilemap_for_PauseMenu:
    PHP                                                                  ;828D51;
    SEP #$20                                                             ;828D52;
    LDA.B #$01                                                           ;828D54;
    STA.W $2116                                                          ;828D56;
    LDA.B $59                                                            ;828D59;
    AND.B #$FC                                                           ;828D5B;
    STA.W $2117                                                          ;828D5D;
    LDA.B #$81                                                           ;828D60;
    STA.W $4310                                                          ;828D62;
    LDA.B #$39                                                           ;828D65;
    STA.W $4311                                                          ;828D67;
    LDA.B #$5C                                                           ;828D6A;
    STA.W $4312                                                          ;828D6C;
    LDA.B #$DF                                                           ;828D6F;
    STA.W $4313                                                          ;828D71;
    LDA.B #$7E                                                           ;828D74;
    STA.W $4314                                                          ;828D76;
    LDA.B #$00                                                           ;828D79;
    STA.W $4315                                                          ;828D7B;
    LDA.B #$10                                                           ;828D7E;
    STA.W $4316                                                          ;828D80;
    STZ.W $4317                                                          ;828D83;
    STZ.W $4318                                                          ;828D86;
    STZ.W $4319                                                          ;828D89;
    STZ.W $431A                                                          ;828D8C;
    LDA.B #$02                                                           ;828D8F;
    STA.W $420B                                                          ;828D91;
    PLP                                                                  ;828D94;
    RTS                                                                  ;828D95;


Restore_BG2Tilemap_from_PauseMenu:
    PHP                                                                  ;828D96;
    SEP #$20                                                             ;828D97;
    LDA.B #$00                                                           ;828D99;
    STA.W $2116                                                          ;828D9B;
    LDA.B $59                                                            ;828D9E;
    AND.B #$FC                                                           ;828DA0;
    STA.W $2117                                                          ;828DA2;
    LDA.B #$80                                                           ;828DA5;
    STA.W $2115                                                          ;828DA7;
    JSL.L SetupHDMATransfer                                              ;828DAA;
    db $01,$01,$18                                                       ;828DAE;
    dl $7EDF5C                                                           ;828DB1;
    dw $1000                                                             ;828DB4;
    LDA.B #$02                                                           ;828DB6;
    STA.W $420B                                                          ;828DB8;
    PLP                                                                  ;828DBB;
    RTS                                                                  ;828DBC;


Backup_SomeGraphicsState_for_PauseScreen:
    PHP                                                                  ;828DBD;
    SEP #$20                                                             ;828DBE;
    LDA.B $58                                                            ;828DC0;
    STA.W $0765                                                          ;828DC2;
    LDA.B $59                                                            ;828DC5;
    STA.W $0766                                                          ;828DC7;
    LDA.B $5A                                                            ;828DCA;
    STA.W $0767                                                          ;828DCC;
    LDA.B $5D                                                            ;828DCF;
    STA.W $0768                                                          ;828DD1;
    LDA.B $5E                                                            ;828DD4;
    STA.W $0769                                                          ;828DD6;
    LDA.B $52                                                            ;828DD9;
    STA.W $076A                                                          ;828DDB;
    LDA.B $B1                                                            ;828DDE;
    STA.W $076B                                                          ;828DE0;
    LDA.B $B5                                                            ;828DE3;
    STA.W $076C                                                          ;828DE5;
    LDA.B $B9                                                            ;828DE8;
    STA.W $076D                                                          ;828DEA;
    LDA.B $B3                                                            ;828DED;
    STA.W $076E                                                          ;828DEF;
    LDA.B $B7                                                            ;828DF2;
    STA.W $076F                                                          ;828DF4;
    LDA.B $BB                                                            ;828DF7;
    STA.W $0770                                                          ;828DF9;
    LDA.B $55                                                            ;828DFC;
    STA.W $0771                                                          ;828DFE;
    LDA.W $091B                                                          ;828E01;
    STA.W $0772                                                          ;828E04;
    LDA.W $091C                                                          ;828E07;
    STA.W $0773                                                          ;828E0A;
    LDA.B $57                                                            ;828E0D;
    STA.W $0774                                                          ;828E0F;
    LDA.B $71                                                            ;828E12;
    STA.W $0775                                                          ;828E14;
    PLP                                                                  ;828E17;
    RTS                                                                  ;828E18;


Restore_SomeGraphicsState_from_PauseScreen:
    PHP                                                                  ;828E19;
    SEP #$20                                                             ;828E1A;
    LDA.W $0772                                                          ;828E1C;
    STA.W $091B                                                          ;828E1F;
    LDA.W $0773                                                          ;828E22;
    STA.W $091C                                                          ;828E25;
    LDA.W $0771                                                          ;828E28;
    STA.B $55                                                            ;828E2B;
    LDA.W $0770                                                          ;828E2D;
    STA.B $BB                                                            ;828E30;
    LDA.W $076F                                                          ;828E32;
    STA.B $B7                                                            ;828E35;
    LDA.W $076E                                                          ;828E37;
    STA.B $B3                                                            ;828E3A;
    LDA.W $076D                                                          ;828E3C;
    STA.B $B9                                                            ;828E3F;
    LDA.W $076C                                                          ;828E41;
    STA.B $B5                                                            ;828E44;
    LDA.W $076B                                                          ;828E46;
    STA.B $B1                                                            ;828E49;
    LDA.W $076A                                                          ;828E4B;
    STA.B $52                                                            ;828E4E;
    LDA.W $0769                                                          ;828E50;
    STA.B $5E                                                            ;828E53;
    LDA.W $0768                                                          ;828E55;
    STA.B $5D                                                            ;828E58;
    LDA.W $0767                                                          ;828E5A;
    STA.B $5A                                                            ;828E5D;
    LDA.W $0766                                                          ;828E5F;
    STA.B $59                                                            ;828E62;
    LDA.W $0765                                                          ;828E64;
    STA.B $58                                                            ;828E67;
    LDA.W $0774                                                          ;828E69;
    STA.B $57                                                            ;828E6C;
    LDA.W $0775                                                          ;828E6E;
    STA.B $71                                                            ;828E71;
    PLP                                                                  ;828E73;
    RTS                                                                  ;828E74;


LoadPauseMenuTiles_ClearBG2Tilemap:
    PHP                                                                  ;828E75;
    SEP #$30                                                             ;828E76;
    LDA.B #$00                                                           ;828E78;
    STA.W $2116                                                          ;828E7A;
    LDA.B #$00                                                           ;828E7D;
    STA.W $2117                                                          ;828E7F;
    LDA.B #$80                                                           ;828E82;
    STA.W $2115                                                          ;828E84;
    JSL.L SetupHDMATransfer                                              ;828E87;
    db $01,$01,$18                                                       ;828E8B;
    dl Tiles_PauseScreen_BG1_BG2                                         ;828E8E;
    dw $4000                                                             ;828E91;
    LDA.B #$02                                                           ;828E93;
    STA.W $420B                                                          ;828E95;
    LDA.B #$00                                                           ;828E98;
    STA.W $2116                                                          ;828E9A;
    LDA.B #$20                                                           ;828E9D;
    STA.W $2117                                                          ;828E9F;
    LDA.B #$80                                                           ;828EA2;
    STA.W $2115                                                          ;828EA4;
    JSL.L SetupHDMATransfer                                              ;828EA7;
    db $01,$01,$18                                                       ;828EAB;
    dl Tiles_Menu_PauseScreen_Sprites                                    ;828EAE;
    dw $2000                                                             ;828EB1;
    LDA.B #$02                                                           ;828EB3;
    STA.W $420B                                                          ;828EB5;
    LDA.B #$00                                                           ;828EB8;
    STA.W $2116                                                          ;828EBA;
    LDA.B #$40                                                           ;828EBD;
    STA.W $2117                                                          ;828EBF;
    LDA.B #$80                                                           ;828EC2;
    STA.W $2115                                                          ;828EC4;
    JSL.L SetupHDMATransfer                                              ;828EC7;
    db $01,$01,$18                                                       ;828ECB;
    dl Tiles_Standard_BG3                                                ;828ECE;
    dw $2000                                                             ;828ED1;
    LDA.B #$02                                                           ;828ED3;
    STA.W $420B                                                          ;828ED5;
    PLP                                                                  ;828ED8;
    RTL                                                                  ;828ED9;


LoadPauseScreen_BaseTilemaps:
    PHP                                                                  ;828EDA;
    SEP #$30                                                             ;828EDB;
    LDA.B #$00                                                           ;828EDD;
    STA.W $2116                                                          ;828EDF;
    LDA.B #$38                                                           ;828EE2;
    STA.W $2117                                                          ;828EE4;
    LDA.B #$80                                                           ;828EE7;
    STA.W $2115                                                          ;828EE9;
    JSL.L SetupHDMATransfer                                              ;828EEC;
    db $01,$01,$18                                                       ;828EF0;
    dl Tilemap_BG2PauseScreen_BG2RoomSelectMap_0                         ;828EF3;
    dw $0800                                                             ;828EF6;
    LDA.B #$02                                                           ;828EF8;
    STA.W $420B                                                          ;828EFA;
    LDA.B #$00                                                           ;828EFD;
    STA.W $2181                                                          ;828EFF;
    LDA.B #$34                                                           ;828F02;
    STA.W $2182                                                          ;828F04;
    LDA.B #$7E                                                           ;828F07;
    STA.W $2183                                                          ;828F09;
    JSL.L SetupHDMATransfer                                              ;828F0C;
    db $01,$00,$80                                                       ;828F10;
    dl Tilemap_BG2PauseScreen_BG2RoomSelectMap_1                         ;828F13;
    dw $0400                                                             ;828F16;
    LDA.B #$02                                                           ;828F18;
    STA.W $420B                                                          ;828F1A;
    LDA.B #$00                                                           ;828F1D;
    STA.W $2181                                                          ;828F1F;
    LDA.B #$38                                                           ;828F22;
    STA.W $2182                                                          ;828F24;
    LDA.B #$7E                                                           ;828F27;
    STA.W $2183                                                          ;828F29;
    JSL.L SetupHDMATransfer                                              ;828F2C;
    db $01,$00,$80                                                       ;828F30;
    dl Tilemap_EquipmentScreen                                           ;828F33;
    dw $0800                                                             ;828F36;
    LDA.B #$02                                                           ;828F38;
    STA.W $420B                                                          ;828F3A;
    REP #$30                                                             ;828F3D;
    LDY.W #Dummy_Samus_Wireframe_Tilemap                                 ;828F3F;
    LDX.W #$01D8                                                         ;828F42;
    LDA.W #$0011                                                         ;828F45;
    STA.B $14                                                            ;828F48;

.loopRows:
    LDA.W #$0008                                                         ;828F4A;
    STA.B $12                                                            ;828F4D;

.loopColumns:
    LDA.W $0000,Y                                                        ;828F4F;
    STA.L $7E3000,X                                                      ;828F52;
    INX                                                                  ;828F56;
    INX                                                                  ;828F57;
    INY                                                                  ;828F58;
    INY                                                                  ;828F59;
    DEC.B $12                                                            ;828F5A;
    BNE .loopColumns                                                     ;828F5C;
    TXA                                                                  ;828F5E;
    CLC                                                                  ;828F5F;
    ADC.W #$0010                                                         ;828F60;
    TAX                                                                  ;828F63;
    DEC.B $14                                                            ;828F64;
    BNE .loopRows                                                        ;828F66;
    JSR.W EquipmentScreen_WriteSamusWireframeTilemap                     ;828F68;
    JSR.W Load_EquipmentScreen_ReserveHealth_Tilemap                     ;828F6B;
    PLP                                                                  ;828F6E;
    RTL                                                                  ;828F6F;


Load_EquipmentScreen_ReserveHealth_Tilemap:
    PHP                                                                  ;828F70;
    REP #$30                                                             ;828F71;
    LDA.W $09D4                                                          ;828F73;
    BEQ .return                                                          ;828F76;
    LDA.W $09D6                                                          ;828F78;
    STA.W $4204                                                          ;828F7B;
    SEP #$20                                                             ;828F7E;
    LDA.B #$64                                                           ;828F80;
    STA.W $4206                                                          ;828F82;
    NOP                                                                  ;828F85;
    NOP                                                                  ;828F86;
    NOP                                                                  ;828F87;
    NOP                                                                  ;828F88;
    NOP                                                                  ;828F89;
    NOP                                                                  ;828F8A;
    NOP                                                                  ;828F8B;
    NOP                                                                  ;828F8C;
    NOP                                                                  ;828F8D;
    LDA.W $4214                                                          ;828F8E;
    STA.B $2A                                                            ;828F91;
    LDA.W $4215                                                          ;828F93;
    STA.B $2B                                                            ;828F96;
    LDA.W HW_RDMPY                                                       ;828F98;
    STA.W $4204                                                          ;828F9B;
    LDA.W $4217                                                          ;828F9E;
    STA.W $4205                                                          ;828FA1;
    LDA.B #$0A                                                           ;828FA4;
    STA.W $4206                                                          ;828FA6;
    REP #$20                                                             ;828FA9;
    NOP                                                                  ;828FAB;
    NOP                                                                  ;828FAC;
    NOP                                                                  ;828FAD;
    NOP                                                                  ;828FAE;
    NOP                                                                  ;828FAF;
    NOP                                                                  ;828FB0;
    NOP                                                                  ;828FB1;
    LDA.W HW_RDMPY                                                       ;828FB2;
    CLC                                                                  ;828FB5;
    ADC.W #$0804                                                         ;828FB6;
    STA.L $7E3B14                                                        ;828FB9;
    LDA.W $4214                                                          ;828FBD;
    CLC                                                                  ;828FC0;
    ADC.W #$0804                                                         ;828FC1;
    STA.L $7E3B12                                                        ;828FC4;
    LDA.B $2A                                                            ;828FC8;
    CLC                                                                  ;828FCA;
    ADC.W #$0804                                                         ;828FCB;
    STA.L $7E3B10                                                        ;828FCE;

.return:
    PLP                                                                  ;828FD2;
    RTS                                                                  ;828FD3;


BackupGameplayPalettes_LoadPauseScreenPalettes:
    PHP                                                                  ;828FD4;
    SEP #$30                                                             ;828FD5;
    PHP                                                                  ;828FD7;
    REP #$30                                                             ;828FD8;
    LDY.W #$0200                                                         ;828FDA;
    LDX.W #$0000                                                         ;828FDD;

.loopBackupGameplay:
    LDA.L $7EC000,X                                                      ;828FE0;
    STA.L $7E3300,X                                                      ;828FE4;
    INX                                                                  ;828FE8;
    INX                                                                  ;828FE9;
    DEY                                                                  ;828FEA;
    DEY                                                                  ;828FEB;
    BNE .loopBackupGameplay                                              ;828FEC;
    PLP                                                                  ;828FEE;
    PHP                                                                  ;828FEF;
    REP #$30                                                             ;828FF0;
    LDY.W #$0200                                                         ;828FF2;
    LDX.W #$0000                                                         ;828FF5;

.loopLoadPause:
    LDA.L Palettes_PauseScreen,X                                         ;828FF8;
    STA.L $7EC000,X                                                      ;828FFC;
    INX                                                                  ;829000;
    INX                                                                  ;829001;
    DEY                                                                  ;829002;
    DEY                                                                  ;829003;
    BNE .loopLoadPause                                                   ;829004;
    PLP                                                                  ;829006;
    PLP                                                                  ;829007;
    RTS                                                                  ;829008;


ContinueInitializingPauseMenu:
    PHP                                                                  ;829009;
    PHB                                                                  ;82900A;
    PHK                                                                  ;82900B;
    PLB                                                                  ;82900C;
    JSR.W SetupPPUForPauseMenu                                           ;82900D;
    JSR.W ResetPauseMenuAnimations                                       ;829010;
    JSR.W Load_EquipmentScreen_EquipmentTilemaps                         ;829013;
    JSR.W Set_PauseScreen_ButtonLabelPalettes_MapScreen                  ;829016;
    JSR.W Update_PauseMenu_L_R_Start_VRAMTilemap                         ;829019;
    JSR.W DetermineMapScrollLimits                                       ;82901C;
    LDA.W #$0080                                                         ;82901F;
    JSR.W SetupMapScrollingForPauseMenu                                  ;829022;
    PLB                                                                  ;829025;
    PLP                                                                  ;829026;
    RTS                                                                  ;829027;


Setup_MapScrolling_for_FileSelectMap:
    JSR.W ResetPauseMenuAnimations                                       ;829028;
    JSR.W DetermineMapScrollLimits                                       ;82902B;
    LDA.W $05AE                                                          ;82902E;
    SEC                                                                  ;829031;
    SBC.W $05AC                                                          ;829032;
    LSR A                                                                ;829035;
    CLC                                                                  ;829036;
    ADC.W $05AC                                                          ;829037;
    SEC                                                                  ;82903A;
    SBC.W #$0080                                                         ;82903B;
    STA.B $B1                                                            ;82903E;
    LDA.W $0AF6                                                          ;829040;
    AND.W #$FF00                                                         ;829043;
    XBA                                                                  ;829046;
    CLC                                                                  ;829047;
    ADC.W $07A1                                                          ;829048;
    ASL A                                                                ;82904B;
    ASL A                                                                ;82904C;
    ASL A                                                                ;82904D;
    SEC                                                                  ;82904E;
    SBC.B $B1                                                            ;82904F;
    STA.B $12                                                            ;829051;
    LDA.W #$00E0                                                         ;829053;
    SEC                                                                  ;829056;
    SBC.B $12                                                            ;829057;
    BPL .Xscroll                                                         ;829059;
    STA.B $12                                                            ;82905B;
    LDA.B $B1                                                            ;82905D;
    SEC                                                                  ;82905F;
    SBC.B $12                                                            ;829060;
    STA.B $B1                                                            ;829062;
    BRA .Yscroll                                                         ;829064;


.Xscroll:
    LDA.W #$0020                                                         ;829066;
    SEC                                                                  ;829069;
    SBC.B $12                                                            ;82906A;
    STA.B $12                                                            ;82906C;
    BMI .Yscroll                                                         ;82906E;
    LDA.B $B1                                                            ;829070;
    SEC                                                                  ;829072;
    SBC.B $12                                                            ;829073;
    STA.B $B1                                                            ;829075;

.Yscroll:
    LDA.W $05B2                                                          ;829077;
    SEC                                                                  ;82907A;
    SBC.W $05B0                                                          ;82907B;
    LSR A                                                                ;82907E;
    CLC                                                                  ;82907F;
    ADC.W #$0010                                                         ;829080;
    CLC                                                                  ;829083;
    ADC.W $05B0                                                          ;829084;
    STA.B $12                                                            ;829087;
    LDA.W #$0070                                                         ;829089;
    SEC                                                                  ;82908C;
    SBC.B $12                                                            ;82908D;
    AND.W #$FFF8                                                         ;82908F;
    EOR.W #$FFFF                                                         ;829092;
    INC A                                                                ;829095;
    STA.B $B3                                                            ;829096;
    LDA.W $0AFA                                                          ;829098;
    XBA                                                                  ;82909B;
    AND.W #$00FF                                                         ;82909C;
    CLC                                                                  ;82909F;
    ADC.W $07A3                                                          ;8290A0;
    INC A                                                                ;8290A3;
    ASL A                                                                ;8290A4;
    ASL A                                                                ;8290A5;
    ASL A                                                                ;8290A6;
    SEC                                                                  ;8290A7;
    SBC.B $B3                                                            ;8290A8;
    STA.B $12                                                            ;8290AA;
    LDA.W #$0040                                                         ;8290AC;
    SEC                                                                  ;8290AF;
    SBC.B $12                                                            ;8290B0;
    BMI .return                                                          ;8290B2;
    STA.B $12                                                            ;8290B4;
    LDA.B $B3                                                            ;8290B6;
    SEC                                                                  ;8290B8;
    SBC.B $12                                                            ;8290B9;
    STA.B $B3                                                            ;8290BB;
    CMP.W #$FFD8                                                         ;8290BD;
    BPL .return                                                          ;8290C0;
    LDA.W #$FFD8                                                         ;8290C2;
    STA.B $B3                                                            ;8290C5;

.return:
    RTL                                                                  ;8290C7;


GameState_E_Paused_LoadingPauseScreen:
    PHP                                                                  ;8290C8;
    REP #$30                                                             ;8290C9;
    JSL.L Draw_PauseMenu_during_FadeIn                                   ;8290CB;
    JSL.L HandleFadingIn                                                 ;8290CF;
    SEP #$20                                                             ;8290D3;
    LDA.B $51                                                            ;8290D5;
    CMP.B #$0F                                                           ;8290D7;
    BNE .return                                                          ;8290D9;
    REP #$20                                                             ;8290DB;
    STZ.W $0723                                                          ;8290DD;
    STZ.W $0725                                                          ;8290E0;
    INC.W $0998                                                          ;8290E3;

.return:
    PLP                                                                  ;8290E6;
    RTS                                                                  ;8290E7;


GameState_F_Paused_MapAndItemScreens:
    PHB                                                                  ;8290E8;
    PHK                                                                  ;8290E9;
    PLB                                                                  ;8290EA;
    LDA.W #$0003                                                         ;8290EB;
    JSL.L UpdateHeldInput                                                ;8290EE;
    JSL.L MainPauseRoutine                                               ;8290F2;
    JSL.L HandleHUDTilemap_PausedAndRunning                              ;8290F6;
    JSR.W Handle_PauseScreen_PaletteAnimation                            ;8290FA;
    PLB                                                                  ;8290FD;
    RTS                                                                  ;8290FE;


MainPauseRoutine:
    PHP                                                                  ;8290FF;
    PHB                                                                  ;829100;
    PHK                                                                  ;829101;
    PLB                                                                  ;829102;
    REP #$30                                                             ;829103;
    LDA.W $0727                                                          ;829105;
    ASL A                                                                ;829108;
    TAX                                                                  ;829109;
    JSR.W (.pointers,X)                                                  ;82910A;
    PLB                                                                  ;82910D;
    PLP                                                                  ;82910E;
    RTL                                                                  ;82910F;


.pointers:
    dw PauseMenu_0_MapScreen                                             ;829110;
    dw PauseScreen_1_EquipmentScreen                                     ;829112;
    dw PauseMenu_2_MapScreenToEquipmentScreen_FadingOut                  ;829114;
    dw PauseMenu_3_MapScreenToEquipmentScreen_LoadEquipmentScreen        ;829116;
    dw PauseMenu_4_MapScreenToEquipmentScreen_FadingIn                   ;829118;
    dw PauseMenu_5_EquipmentScreenToMapScreen_FadingOut                  ;82911A;
    dw PauseMenu_6_EquipmentScreenToMapScreen_LoadMapScreen              ;82911C;
    dw PauseMenu_7_EquipmentScreenToMapScreen_FadingIn                   ;82911E;

PauseMenu_0_MapScreen:
    REP #$30                                                             ;829120;
    JSR.W Handle_PauseScreen_L_R                                         ;829122;
    JSR.W Handle_PauseScreen_StartButton                                 ;829125;
    JSL.L Handle_MapScrollArrows                                         ;829128;
    JSL.L MapScrolling                                                   ;82912C;
    JSR.W MapScreen_DrawSamusPositionIndicator                           ;829130;
    JSL.L Draw_Map_Icons                                                 ;829133;
    JSL.L Display_Map_Elevator_Destinations                              ;829137;
    LDA.W #$0000                                                         ;82913B;
    STA.W $0763                                                          ;82913E;
    RTS                                                                  ;829141;


PauseScreen_1_EquipmentScreen:
    STZ.B $B1                                                            ;829142;
    STZ.B $B3                                                            ;829144;
    JSR.W EquipmentScreen_Main                                           ;829146;
    JSR.W Handle_PauseScreen_L_R                                         ;829149;
    JSR.W Handle_PauseScreen_StartButton                                 ;82914C;
    LDA.W #$0001                                                         ;82914F;
    STA.W $0763                                                          ;829152;
    RTS                                                                  ;829155;


PauseMenu_2_MapScreenToEquipmentScreen_FadingOut:
    JSL.L Display_Map_Elevator_Destinations                              ;829156;
    JSR.W MapScreen_DrawSamusPositionIndicator                           ;82915A;
    JSL.L Draw_Map_Icons                                                 ;82915D;
    JSR.W Handle_PauseMenu_L_R_PressedHighlight                          ;829161;
    LDA.W #$0000                                                         ;829164;
    STA.W $0763                                                          ;829167;
    JSL.L HandleFadingOut                                                ;82916A;
    SEP #$20                                                             ;82916E;
    LDA.B $51                                                            ;829170;
    CMP.B #$80                                                           ;829172;
    BNE .return                                                          ;829174;
    JSL.L EnableNMI                                                      ;829176;
    REP #$20                                                             ;82917A;
    STZ.W $0723                                                          ;82917C;
    STZ.W $0725                                                          ;82917F;
    INC.W $0727                                                          ;829182;

.return:
    RTS                                                                  ;829185;


PauseMenu_5_EquipmentScreenToMapScreen_FadingOut:
    JSR.W EquipmentScreen_DrawItemSelector                               ;829186;
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell                 ;829189;
    JSR.W Handle_PauseMenu_L_R_PressedHighlight                          ;82918C;
    JSL.L HandleFadingOut                                                ;82918F;
    SEP #$20                                                             ;829193;
    LDA.B $51                                                            ;829195;
    CMP.B #$80                                                           ;829197;
    BNE .return                                                          ;829199;
    JSL.L EnableNMI                                                      ;82919B;
    REP #$20                                                             ;82919F;
    STZ.W $0723                                                          ;8291A1;
    STZ.W $0725                                                          ;8291A4;
    INC.W $0727                                                          ;8291A7;

.return:
    RTS                                                                  ;8291AA;


PauseMenu_3_MapScreenToEquipmentScreen_LoadEquipmentScreen:
    REP #$30                                                             ;8291AB;
    JSL.L Display_Map_Elevator_Destinations                              ;8291AD;
    JSR.W EquipmentScreen_SetupReserveMode_and_DetermineInitialSelect    ;8291B1;
    JSL.L EquipmentScreen_TransferBG1Tilemap                             ;8291B4;
    LDA.W #$0001                                                         ;8291B8;
    STA.W $0763                                                          ;8291BB;
    JSR.W Set_PauseScreen_ButtonLabelPalettes                            ;8291BE;
    STZ.W $073F                                                          ;8291C1;
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays   ;8291C4;
    STA.W $072B                                                          ;8291C7;
    LDA.W #$0001                                                         ;8291CA;
    STA.W $0723                                                          ;8291CD;
    STA.W $0725                                                          ;8291D0;
    INC.W $0727                                                          ;8291D3;
    RTS                                                                  ;8291D6;


PauseMenu_6_EquipmentScreenToMapScreen_LoadMapScreen:
    REP #$30                                                             ;8291D7;
    JSL.L Display_Map_Elevator_Destinations                              ;8291D9;
    JSL.L Load_PauseMenuMapTilemap_and_AreaLabel                         ;8291DD;
    JSR.W Set_PauseScreen_ButtonLabelPalettes                            ;8291E1;
    STZ.W $073F                                                          ;8291E4;
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays   ;8291E7;
    STA.W $072B                                                          ;8291EA;
    LDA.W #$0001                                                         ;8291ED;
    STA.W $0723                                                          ;8291F0;
    STA.W $0725                                                          ;8291F3;
    LDA.W #$0000                                                         ;8291F6;
    STA.W $0763                                                          ;8291F9;
    INC.W $0727                                                          ;8291FC;
    RTS                                                                  ;8291FF;


PauseMenu_7_EquipmentScreenToMapScreen_FadingIn:
    JSR.W MapScreen_DrawSamusPositionIndicator                           ;829200;
    JSL.L Draw_Map_Icons                                                 ;829203;
    JSL.L Display_Map_Elevator_Destinations                              ;829207;
    LDA.W #$0000                                                         ;82920B;
    STA.W $0763                                                          ;82920E;
    JSL.L HandleFadingIn                                                 ;829211;
    SEP #$20                                                             ;829215;
    LDA.B $51                                                            ;829217;
    CMP.B #$0F                                                           ;829219;
    BNE .return                                                          ;82921B;
    REP #$20                                                             ;82921D;
    STZ.W $0723                                                          ;82921F;
    STZ.W $0725                                                          ;829222;
    LDA.W $0753                                                          ;829225;
    BEQ +                                                                ;829228;
    LDA.W #$0001                                                         ;82922A;

  + STA.W $0727                                                          ;82922D;

.return:
    RTS                                                                  ;829230;


PauseMenu_4_MapScreenToEquipmentScreen_FadingIn:
    JSR.W EquipmentScreen_DrawItemSelector                               ;829231;
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell                 ;829234;
    LDA.W #$0001                                                         ;829237;
    STA.W $0763                                                          ;82923A;
    JSL.L HandleFadingIn                                                 ;82923D;
    SEP #$20                                                             ;829241;
    LDA.B $51                                                            ;829243;
    CMP.B #$0F                                                           ;829245;
    BNE .return                                                          ;829247;
    REP #$20                                                             ;829249;
    STZ.W $0723                                                          ;82924B;
    STZ.W $0725                                                          ;82924E;
    LDA.W $0753                                                          ;829251;
    BEQ +                                                                ;829254;
    LDA.W #$0001                                                         ;829256;

  + STA.W $0727                                                          ;829259;

.return:
    RTS                                                                  ;82925C;


MapScrolling:
    PHP                                                                  ;82925D;
    PHB                                                                  ;82925E;
    PHK                                                                  ;82925F;
    PLB                                                                  ;829260;
    REP #$30                                                             ;829261;
    LDA.W $05FD                                                          ;829263;
    ASL A                                                                ;829266;
    TAX                                                                  ;829267;
    JSR.W (.pointers,X)                                                  ;829268;
    PLB                                                                  ;82926B;
    PLP                                                                  ;82926C;
    RTL                                                                  ;82926D;


.pointers:
    dw MapScrolling_None                                                 ;82926E;
    dw MapScrolling_Left                                                 ;829270;
    dw MapScrolling_Right                                                ;829272;
    dw MapScrolling_Up                                                   ;829274;
    dw MapScrolling_Down                                                 ;829276;

MapScrolling_None:
    LDA.W #$0004                                                         ;829278;
    STA.W $05FB                                                          ;82927B;
    RTS                                                                  ;82927E;


GetMapScrollSpeedIndexInX:
    LDX.W $05FF                                                          ;82927F;
    LDA.W $05FB                                                          ;829282;
    BNE .return                                                          ;829285;
    TXA                                                                  ;829287;
    CLC                                                                  ;829288;
    ADC.W #$0020                                                         ;829289;
    TAX                                                                  ;82928C;

.return:
    RTS                                                                  ;82928D;


MapScrolling_Left:
    JSR.W GetMapScrollSpeedIndexInX                                      ;82928E;
    LDA.B $B1                                                            ;829291;
    SEC                                                                  ;829293;
    SBC.W MapScrolling_SpeedTable,X                                      ;829294;
    STA.B $B1                                                            ;829297;

MapScrolling_Common:
    INC.W $05FF                                                          ;829299;
    INC.W $05FF                                                          ;82929C;
    LDA.W $05FF                                                          ;82929F;
    AND.W #$000F                                                         ;8292A2;
    BNE .return                                                          ;8292A5;
    LDA.W #$0036                                                         ;8292A7;
    JSL.L QueueSound_Lib1_Max6                                           ;8292AA;
    STZ.W $05FD                                                          ;8292AE;
    STZ.W $05FF                                                          ;8292B1;
    LDA.W $05FB                                                          ;8292B4;
    BEQ .return                                                          ;8292B7;
    DEC.W $05FB                                                          ;8292B9;

.return:
    RTS                                                                  ;8292BC;


MapScrolling_Right:
    JSR.W GetMapScrollSpeedIndexInX                                      ;8292BD;
    LDA.W MapScrolling_SpeedTable,X                                      ;8292C0;
    CLC                                                                  ;8292C3;
    ADC.B $B1                                                            ;8292C4;
    STA.B $B1                                                            ;8292C6;
    BRA MapScrolling_Common                                              ;8292C8;


MapScrolling_Up:
    JSR.W GetMapScrollSpeedIndexInX                                      ;8292CA;
    LDA.B $B3                                                            ;8292CD;
    SEC                                                                  ;8292CF;
    SBC.W MapScrolling_SpeedTable,X                                      ;8292D0;
    STA.B $B3                                                            ;8292D3;
    BRA MapScrolling_Common                                              ;8292D5;


MapScrolling_Down:
    JSR.W GetMapScrollSpeedIndexInX                                      ;8292D7;
    LDA.W MapScrolling_SpeedTable,X                                      ;8292DA;
    CLC                                                                  ;8292DD;
    ADC.B $B3                                                            ;8292DE;
    STA.B $B3                                                            ;8292E0;
    BRA MapScrolling_Common                                              ;8292E2;


MapScrolling_SpeedTable:
    dw $0000,$0000,$0000,$0008,$0000,$0000,$0000,$0000                   ;8292E4;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;8292F4;
    dw $0000,$0000,$0000,$0008,$0000,$0000,$0000,$0000                   ;829304;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;829314;

GameState_10_Unpausing_LoadingNormalGameplay:
    PHP                                                                  ;829324;
    REP #$30                                                             ;829325;
    JSL.L Handle_PauseMenu_StartPressedHighlight                         ;829327;
    JSR.W Draw_PauseMenu_During_FadeOut                                  ;82932B;
    JSL.L HandleFadingOut                                                ;82932E;
    SEP #$20                                                             ;829332;
    LDA.B $51                                                            ;829334;
    CMP.B #$80                                                           ;829336;
    BNE .return                                                          ;829338;
    JSL.L EnableNMI                                                      ;82933A;
    REP #$20                                                             ;82933E;
    STZ.W $0723                                                          ;829340;
    STZ.W $0725                                                          ;829343;
    INC.W $0998                                                          ;829346;

.return:
    PLP                                                                  ;829349;
    RTS                                                                  ;82934A;


Draw_PauseMenu_During_FadeOut:
    LDA.W $0763                                                          ;82934B;
    CMP.W #$0001                                                         ;82934E;
    BEQ .equipScreen                                                     ;829351;
    JSL.L Display_Map_Elevator_Destinations                              ;829353;
    JSL.L Draw_Map_Icons                                                 ;829357;
    JMP.W MapScreen_DrawSamusPositionIndicator                           ;82935B;


.equipScreen:
    JSR.W EquipmentScreen_DrawItemSelector                               ;82935E;
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell                 ;829361;
    JMP.W Handle_PauseMenu_L_R_PressedHighlight                          ;829364;


GameState_11_Unpausing_LoadingNormalGameplay:
    PHP                                                                  ;829367;
    REP #$30                                                             ;829368;
    JSR.W Clear_Samus_Beam_Tiles                                         ;82936A;
    JSR.W ContinueInitialising_GameplayResume                            ;82936D;
    JSL.L ResumeGameplay                                                 ;829370;
    JSR.W Restore_SomeGraphicsState_from_PauseScreen                     ;829374;
    JSR.W Restore_BG2Tilemap_from_PauseMenu                              ;829377;
    REP #$30                                                             ;82937A;
    LDA.W #$0001                                                         ;82937C;
    STA.W $0723                                                          ;82937F;
    STA.W $0725                                                          ;829382;
    PHP                                                                  ;829385;
    PHB                                                                  ;829386;
    PHK                                                                  ;829387;
    PEA.W .returnPEA-1                                                   ;829388;
    JML.W [$0604]                                                        ;82938B; Execute unpause hook


.returnPEA:
    JSL.L Enable_HDMAObjects                                             ;82938E;
    JSL.L Enable_AnimatedTilesObjects                                    ;829392;
    JSL.L Queue_Samus_Movement_SoundEffects                              ;829396;
    PLB                                                                  ;82939A;
    PLP                                                                  ;82939B;
    INC.W $0998                                                          ;82939C;
    PLP                                                                  ;82939F;
    RTS                                                                  ;8293A0;


GameState_12_Unpausing_NormalGameplayBrightening:
    PHP                                                                  ;8293A1;
    REP #$30                                                             ;8293A2;
    JSR.W GameState_8_MainGameplay                                       ;8293A4;
    JSL.L HandleFadingIn                                                 ;8293A7;
    SEP #$20                                                             ;8293AB;
    LDA.B $51                                                            ;8293AD;
    CMP.B #$0F                                                           ;8293AF;
    BNE .return                                                          ;8293B1;
    REP #$20                                                             ;8293B3;
    STZ.W $0723                                                          ;8293B5;
    STZ.W $0725                                                          ;8293B8;
    LDA.W #$0008                                                         ;8293BB;
    STA.W $0998                                                          ;8293BE;

.return:
    PLP                                                                  ;8293C1;
    RTS                                                                  ;8293C2;


Load_PauseMenuMapTilemap_and_AreaLabel:
    PHP                                                                  ;8293C3;
    PHB                                                                  ;8293C4;
    PHK                                                                  ;8293C5;
    PLB                                                                  ;8293C6;
    REP #$30                                                             ;8293C7;
    LDA.B $BD                                                            ;8293C9;
    STA.B $B1                                                            ;8293CB;
    LDA.B $BF                                                            ;8293CD;
    STA.B $B3                                                            ;8293CF;
    SEP #$30                                                             ;8293D1;
    LDA.B #$00                                                           ;8293D3;
    STA.W $2116                                                          ;8293D5;
    LDA.B #$30                                                           ;8293D8;
    STA.W $2117                                                          ;8293DA;
    LDA.B #$80                                                           ;8293DD;
    STA.W $2115                                                          ;8293DF;
    JSR.W LoadPauseMenuMapTilemap                                        ;8293E2;
    JSL.L SetupHDMATransfer                                              ;8293E5;
    db $01,$01,$18                                                       ;8293E9;
    dl $7E4000                                                           ;8293EC;
    dw $1000                                                             ;8293EF;
    LDA.B #$02                                                           ;8293F1;
    STA.W $420B                                                          ;8293F3;
    LDA.B #$AA                                                           ;8293F6;
    STA.W $2116                                                          ;8293F8;
    LDA.B #$38                                                           ;8293FB;
    STA.W $2117                                                          ;8293FD;
    LDA.B #$80                                                           ;829400;
    STA.W $2115                                                          ;829402;
    LDA.B #$01                                                           ;829405;
    STA.W $4310                                                          ;829407;
    LDA.B #$18                                                           ;82940A;
    STA.W $4311                                                          ;82940C;
    LDA.B #$18                                                           ;82940F;
    STA.W $4315                                                          ;829411;
    LDA.B #$00                                                           ;829414;
    STA.W $4316                                                          ;829416;
    REP #$30                                                             ;829419;
    LDA.W $079F                                                          ;82941B;
    CMP.W #$0007                                                         ;82941E;
    BMI +                                                                ;829421;
    LDA.W #$0000                                                         ;829423;

  + ASL A                                                                ;829426;
    TAX                                                                  ;829427;
    LDA.W AreaLabelTilemaps_pointers,X                                   ;829428;
    STA.W $4312                                                          ;82942B;
    SEP #$20                                                             ;82942E;
    LDA.B #$82                                                           ;829430;
    STA.W $4314                                                          ;829432;
    LDA.B #$02                                                           ;829435;
    STA.W $420B                                                          ;829437;
    PLB                                                                  ;82943A;
    PLP                                                                  ;82943B;
    RTL                                                                  ;82943C;


LoadPauseMenuMapTilemap:
    PHP                                                                  ;82943D;
    REP #$30                                                             ;82943E;
    LDA.W $079F                                                          ;829440;
    CMP.W #$0007                                                         ;829443;
    BMI +                                                                ;829446;
    LDA.W #$0000                                                         ;829448;

  + STA.B $12                                                            ;82944B;
    ASL A                                                                ;82944D;
    CLC                                                                  ;82944E;
    ADC.B $12                                                            ;82944F;
    TAX                                                                  ;829451;
    LDA.W AreaMapPointers,X                                              ;829452;
    STA.B $00                                                            ;829455;
    LDA.W AreaMapPointers+2,X                                            ;829457;
    STA.B $02                                                            ;82945A;
    LDA.W #$4000                                                         ;82945C;
    STA.B $03                                                            ;82945F;
    LDA.W #$007E                                                         ;829461;
    STA.B $05                                                            ;829464;
    LDA.B $12                                                            ;829466;
    ASL A                                                                ;829468;
    TAX                                                                  ;829469;
    LDA.W #$0082                                                         ;82946A;
    STA.B $08                                                            ;82946D;
    LDA.L MapData_pointers,X                                             ;82946F;
    STA.B $06                                                            ;829473;
    LDX.W $079F                                                          ;829475;
    LDA.L $7ED908,X                                                      ;829478;
    AND.W #$00FF                                                         ;82947C;
    BNE .mapCollected                                                    ;82947F;
    SEP #$20                                                             ;829481;
    LDY.W #$0000                                                         ;829483;
    LDX.W #$0000                                                         ;829486;
    STZ.B $12                                                            ;829489;
    CLC                                                                  ;82948B;

.loopWithoutMapData:
    ROL.W $07F7,X                                                        ;82948C;
    BCS .exploredMapTile                                                 ;82948F;
    REP #$20                                                             ;829491;
    LDA.W #$001F                                                         ;829493;
    STA.B [$03],Y                                                        ;829496;

.nextWithoutMapData:
    SEP #$20                                                             ;829498;
    INY                                                                  ;82949A;
    INY                                                                  ;82949B;
    INC.B $12                                                            ;82949C;
    LDA.B $12                                                            ;82949E;
    CMP.B #$08                                                           ;8294A0;
    BMI .loopWithoutMapData                                              ;8294A2;
    STZ.B $12                                                            ;8294A4;
    INX                                                                  ;8294A6;
    CPX.W #$0100                                                         ;8294A7;
    BMI .loopWithoutMapData                                              ;8294AA;
    PLP                                                                  ;8294AC;
    RTS                                                                  ;8294AD;


.exploredMapTile:
    INC.W $07F7,X                                                        ;8294AE;
    REP #$30                                                             ;8294B1;
    LDA.B [$00],Y                                                        ;8294B3;
    AND.W #$FBFF                                                         ;8294B5;
    STA.B [$03],Y                                                        ;8294B8;
    BRA .nextWithoutMapData                                              ;8294BA;


.mapCollected:
    REP #$30                                                             ;8294BC;
    LDA.B [$06]                                                          ;8294BE;
    XBA                                                                  ;8294C0;
    STA.B $26                                                            ;8294C1;
    INC.B $06                                                            ;8294C3;
    INC.B $06                                                            ;8294C5;
    LDA.W #$0000                                                         ;8294C7;
    STA.B $0B                                                            ;8294CA;
    LDA.W #$07F7                                                         ;8294CC;
    STA.B $09                                                            ;8294CF;
    LDA.B [$09]                                                          ;8294D1;
    XBA                                                                  ;8294D3;
    STA.B $28                                                            ;8294D4;
    INC.B $09                                                            ;8294D6;
    INC.B $09                                                            ;8294D8;
    LDY.W #$0000                                                         ;8294DA;
    LDX.W #$0010                                                         ;8294DD;

.loopWithMapData:
    LDA.B [$00],Y                                                        ;8294E0;
    ASL.B $28                                                            ;8294E2;
    BCC +                                                                ;8294E4;
    AND.W #$FBFF                                                         ;8294E6;
    ASL.B $26                                                            ;8294E9;
    BRA .decX                                                            ;8294EB;


  + ASL.B $26                                                            ;8294ED;
    BCS .decX                                                            ;8294EF;
    LDA.W #$001F                                                         ;8294F1;

.decX:
    STA.B [$03],Y                                                        ;8294F4;
    DEX                                                                  ;8294F6;
    BNE .next                                                            ;8294F7;
    LDX.W #$0010                                                         ;8294F9;
    LDA.B [$06]                                                          ;8294FC;
    XBA                                                                  ;8294FE;
    STA.B $26                                                            ;8294FF;
    INC.B $06                                                            ;829501;
    INC.B $06                                                            ;829503;
    LDA.B [$09]                                                          ;829505;
    XBA                                                                  ;829507;
    STA.B $28                                                            ;829508;
    INC.B $09                                                            ;82950A;
    INC.B $09                                                            ;82950C;

.next:
    INY                                                                  ;82950E;
    INY                                                                  ;82950F;
    CPY.W #$1000                                                         ;829510;
    BMI .loopWithMapData                                                 ;829513;
    PLP                                                                  ;829515;
    RTS                                                                  ;829516;


DrawRoomSelectMap:
    SEP #$30                                                             ;829517;
    LDA.B #$33                                                           ;829519;
    STA.B $5D                                                            ;82951B;
    LDA.B #$13                                                           ;82951D;
    STA.B $69                                                            ;82951F;
    LDA.B #$D8                                                           ;829521;
    STA.B $B3                                                            ;829523;
    LDA.B #$FF                                                           ;829525;
    STA.B $B4                                                            ;829527;
    REP #$30                                                             ;829529;
    PHK                                                                  ;82952B;
    PLB                                                                  ;82952C;
    LDA.W $079F                                                          ;82952D;
    CMP.W #$0007                                                         ;829530;
    BMI +                                                                ;829533;
    LDA.W #$0000                                                         ;829535;

  + STA.B $12                                                            ;829538;
    ASL A                                                                ;82953A;
    CLC                                                                  ;82953B;
    ADC.B $12                                                            ;82953C;
    TAX                                                                  ;82953E;
    LDA.W AreaMapPointers,X                                              ;82953F;
    STA.B $00                                                            ;829542;
    LDA.W AreaMapPointers+2,X                                            ;829544;
    STA.B $02                                                            ;829547;
    LDA.W #$3000                                                         ;829549;
    STA.B $03                                                            ;82954C;
    LDA.W #$007E                                                         ;82954E;
    STA.B $05                                                            ;829551;
    LDA.B $12                                                            ;829553;
    ASL A                                                                ;829555;
    TAX                                                                  ;829556;
    LDA.W #$0082                                                         ;829557;
    STA.B $08                                                            ;82955A;
    LDA.L MapData_pointers,X                                             ;82955C;
    STA.B $06                                                            ;829560;
    LDX.W $079F                                                          ;829562;
    LDA.L $7ED908,X                                                      ;829565;
    AND.W #$00FF                                                         ;829569;
    BNE .mapCollected                                                    ;82956C;
    SEP #$20                                                             ;82956E;
    LDY.W #$0000                                                         ;829570;
    LDX.W #$0000                                                         ;829573;
    STZ.B $12                                                            ;829576;
    CLC                                                                  ;829578;

.loopWithoutMapData:
    ROL.W $07F7,X                                                        ;829579;
    BCS .exploredMapTile                                                 ;82957C;
    REP #$20                                                             ;82957E;
    LDA.W #$000F                                                         ;829580;
    STA.B [$03],Y                                                        ;829583;

.nextWithoutMapData:
    SEP #$20                                                             ;829585;
    INY                                                                  ;829587;
    INY                                                                  ;829588;
    INC.B $12                                                            ;829589;
    LDA.B $12                                                            ;82958B;
    CMP.B #$08                                                           ;82958D;
    BMI .loopWithoutMapData                                              ;82958F;
    STZ.B $12                                                            ;829591;
    INX                                                                  ;829593;
    CPX.W #$0100                                                         ;829594;
    BMI .loopWithoutMapData                                              ;829597;
    JMP.W .return                                                        ;829599;


.exploredMapTile:
    INC.W $07F7,X                                                        ;82959C;
    REP #$30                                                             ;82959F;
    LDA.B [$00],Y                                                        ;8295A1;
    AND.W #$FBFF                                                         ;8295A3;
    STA.B [$03],Y                                                        ;8295A6;
    BRA .nextWithoutMapData                                              ;8295A8;


.mapCollected:
    REP #$30                                                             ;8295AA;
    LDA.B [$06]                                                          ;8295AC;
    XBA                                                                  ;8295AE;
    STA.B $26                                                            ;8295AF;
    INC.B $06                                                            ;8295B1;
    INC.B $06                                                            ;8295B3;
    LDA.W #$0000                                                         ;8295B5;
    STA.B $0B                                                            ;8295B8;
    LDA.W #$07F7                                                         ;8295BA;
    STA.B $09                                                            ;8295BD;
    LDA.B [$09]                                                          ;8295BF;
    XBA                                                                  ;8295C1;
    STA.B $28                                                            ;8295C2;
    INC.B $09                                                            ;8295C4;
    INC.B $09                                                            ;8295C6;
    LDY.W #$0000                                                         ;8295C8;
    LDX.W #$0010                                                         ;8295CB;

.loopWithMapData:
    LDA.B [$00],Y                                                        ;8295CE;
    ASL.B $28                                                            ;8295D0;
    BCC +                                                                ;8295D2;
    AND.W #$FBFF                                                         ;8295D4;
    ASL.B $26                                                            ;8295D7;
    BRA .decX                                                            ;8295D9;


  + ASL.B $26                                                            ;8295DB;
    BCS .decX                                                            ;8295DD;
    LDA.W #$001F                                                         ;8295DF;

.decX:
    STA.B [$03],Y                                                        ;8295E2;
    DEX                                                                  ;8295E4;
    BNE .next                                                            ;8295E5;
    LDX.W #$0010                                                         ;8295E7;
    LDA.B [$06]                                                          ;8295EA;
    XBA                                                                  ;8295EC;
    STA.B $26                                                            ;8295ED;
    INC.B $06                                                            ;8295EF;
    INC.B $06                                                            ;8295F1;
    LDA.B [$09]                                                          ;8295F3;
    XBA                                                                  ;8295F5;
    STA.B $28                                                            ;8295F6;
    INC.B $09                                                            ;8295F8;
    INC.B $09                                                            ;8295FA;

.next:
    INY                                                                  ;8295FC;
    INY                                                                  ;8295FD;
    CPY.W #$1000                                                         ;8295FE;
    BMI .loopWithMapData                                                 ;829601;

.return:
    REP #$30                                                             ;829603;
    LDX.W $0330                                                          ;829605;
    LDA.W #$1000                                                         ;829608;
    STA.B $D0,X                                                          ;82960B;
    LDA.W #$3000                                                         ;82960D;
    STA.B $D2,X                                                          ;829610;
    LDA.W #$007E                                                         ;829612;
    STA.B $D4,X                                                          ;829615;
    LDA.B $58                                                            ;829617;
    AND.W #$00FC                                                         ;829619;
    XBA                                                                  ;82961C;
    STA.B $D5,X                                                          ;82961D;
    TXA                                                                  ;82961F;
    CLC                                                                  ;829620;
    ADC.W #$0007                                                         ;829621;
    STA.W $0330                                                          ;829624;
    RTL                                                                  ;829627;


DrawRoomSelectMap_AreaLabel:
    PHB                                                                  ;829628;
    PHK                                                                  ;829629;
    PLB                                                                  ;82962A;
    LDA.W $079F                                                          ;82962B;
    ASL A                                                                ;82962E;
    TAX                                                                  ;82962F;
    LDA.W AreaLabelTilemaps_pointers,X                                   ;829630;
    TAX                                                                  ;829633;
    LDY.W #$0000                                                         ;829634;

.loop:
    LDA.W $0000,X                                                        ;829637;
    AND.W #$EFFF                                                         ;82963A;
    STA.B [$00],Y                                                        ;82963D;
    INX                                                                  ;82963F;
    INX                                                                  ;829640;
    INY                                                                  ;829641;
    INY                                                                  ;829642;
    CPY.W #$0018                                                         ;829643;
    BMI .loop                                                            ;829646;
    PLB                                                                  ;829648;
    RTL                                                                  ;829649;


AreaMapPointers:
    dl MapTilemaps_crateria                                              ;82964A;
    dl MapTilemaps_brinstar                                              ;82964D;
    dl MapTilemaps_norfair                                               ;829650;
    dl MapTilemaps_wreckedShip                                           ;829653;
    dl MapTilemaps_maridia                                               ;829656;
    dl MapTilemaps_tourian                                               ;829659;
    dl UNUSED_MapTilemaps_ceres_B5E000                                   ;82965C;

AreaLabelTilemaps_pointers:
    dw AreaLabelTilemaps_crateria                                        ;82965F;
    dw AreaLabelTilemaps_brinstar                                        ;829661;
    dw AreaLabelTilemaps_norfair                                         ;829663;
    dw AreaLabelTilemaps_wreckedShip                                     ;829665;
    dw AreaLabelTilemaps_maridia                                         ;829667;
    dw AreaLabelTilemaps_tourianDebug                                    ;829669;
    dw AreaLabelTilemaps_ceres                                           ;82966B;
    dw AreaLabelTilemaps_tourianDebug                                    ;82966D;

AreaLabelTilemaps_crateria:
    dw $2801,$2801,$3832,$3841,$3830,$3843,$3834,$3841,$3838,$2830,$2801,$2801 ;82966F;

AreaLabelTilemaps_brinstar:
    dw $2801,$2801,$3831,$3841,$3838,$383D,$3842,$3843,$3830,$3841,$2801,$2801 ;829687;

AreaLabelTilemaps_norfair:
    dw $2801,$2801,$383D,$383E,$3841,$3835,$3830,$3838,$3841,$2801,$2801,$2801 ;82969F;

AreaLabelTilemaps_wreckedShip:
    dw $3846,$3841,$3834,$3832,$383A,$3834,$3833,$2801,$3842,$3837,$3838,$383F ;8296B7;

AreaLabelTilemaps_maridia:
    dw $2801,$2801,$383C,$3830,$3841,$3838,$3833,$3838,$3830,$2801,$2801,$2801 ;8296CF;

AreaLabelTilemaps_tourianDebug:
    dw $2801,$2801,$3843,$383E,$3844,$3841,$3838,$3830,$383D,$2801,$2801,$2801 ;8296E7;

AreaLabelTilemaps_ceres:
    dw $2801,$2801,$2801,$3832,$383E,$383B,$383E,$383D,$3848,$2801,$2801,$2801 ;8296FF;

MapData_pointers:
    dw MapData_crateria                                                  ;829717;
    dw MapData_brinstar                                                  ;829719;
    dw MapData_norfair                                                   ;82971B;
    dw MapData_wreckedShip                                               ;82971D;
    dw MapData_maridia                                                   ;82971F;
    dw MapData_tourianDebug                                              ;829721;
    dw MapData_ceres                                                     ;829723;
    dw MapData_tourianDebug                                              ;829725;

MapData_crateria:
    db $00,$00,$00,$00                                                   ;829727;
    db $00,$00,$00,$7F
    db $00,$00,$00,$7F
    db $00,$00,$00,$7F
    db $00,$00,$00,$7F
    db $00,$01,$FF,$FF
    db $00,$07,$94,$00
    db $00,$1E,$37,$C0
    db $00,$10,$FF,$00
    db $03,$F0,$10,$00
    db $02,$00,$10,$00
    db $02,$00,$10,$00
    db $02,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$10,$00
    db $00,$00,$1F,$00
    db $00,$00,$01,$00
    db $00,$00,$01,$00
    db $00,$00,$01,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $03,$FC,$00,$00
    db                 $03,$FC,$00,$00
    db                 $03,$F0,$00,$00
    db                 $03,$F0,$00,$00
    db                 $FF,$FC,$7F,$80
    db                 $0D,$FC,$7F,$80
    db                 $00,$00,$00,$80
    db                 $20,$00,$00,$80
    db                 $20,$00,$07,$80
    db                 $20,$00,$0F,$80
    db                 $20,$00,$08,$00
    db                 $00,$00,$08,$00
    db                 $00,$00,$08,$00
    db                 $00,$00,$08,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_brinstar:
    db $00,$00,$00,$00                                                  ;829827;
    db $00,$40,$00,$00
    db $00,$40,$02,$00
    db $00,$40,$02,$00
    db $00,$40,$02,$00
    db $07,$FD,$FE,$00
    db $00,$C0,$60,$00
    db $03,$FF,$E0,$00
    db $06,$00,$78,$20
    db $00,$00,$7C,$20
    db $00,$00,$60,$20
    db $00,$00,$7E,$7F
    db $00,$00,$1C,$0C
    db $00,$00,$07,$80
    db $00,$FE,$01,$FF
    db $00,$00,$00,$00
    db $00,$00,$01,$FF
    db $00,$00,$00,$66
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $04,$00,$00,$00
    db                 $04,$00,$00,$00
    db                 $04,$00,$00,$00
    db                 $04,$00,$00,$00
    db                 $1C,$00,$00,$00
    db                 $06,$00,$00,$00
    db                 $7C,$00,$00,$00
    db                 $C0,$00,$00,$00
    db                 $50,$00,$00,$00
    db                 $40,$00,$00,$00
    db                 $C0,$00,$00,$00
    db                 $40,$00,$00,$00
    db                 $C0,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $02,$00,$00,$00
    db                 $3F,$FF,$C1,$80
    db                 $00,$79,$FF,$C0
    db                 $00,$40,$00,$00
    db                 $00,$40,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_norfair:
    db $00,$00,$00,$00                                                   ;829927;
    db $00,$20,$00,$00
    db $1E,$20,$00,$FE
    db $1E,$20,$07,$8F
    db $1F,$FF,$87,$80
    db $3E,$7F,$FF,$FC
    db $20,$FF,$FF,$F8
    db $21,$BE,$1E,$FC
    db $3F,$1F,$13,$04
    db $03,$C1,$93,$FC
    db $00,$FF,$FF,$A0
    db $00,$7F,$F3,$E0
    db $00,$38,$01,$C0
    db $03,$E0,$01,$80
    db $03,$E0,$00,$00
    db $1E,$20,$00,$00
    db $1F,$3E,$00,$00
    db $1F,$A0,$01,$00
    db $0F,$F0,$01,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $FC,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_wreckedShip:
    db $00,$00,$00,$00                                                   ;829A27;
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$0F,$FC,$00
    db $00,$0F,$00,$00
    db $00,$3E,$00,$00
    db $00,$20,$80,$00
    db $00,$0F,$C4,$00
    db $00,$00,$FC,$00
    db $00,$00,$80,$00
    db $00,$01,$80,$00
    db $00,$00,$80,$00
    db $00,$07,$F0,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_maridia:
    db $00,$00,$00,$00                                                   ;829B27;
    db $00,$00,$00,$78
    db $00,$00,$00,$58
    db $00,$00,$01,$D8
    db $00,$00,$01,$C0
    db $00,$00,$3F,$C0
    db $00,$00,$FD,$FF
    db $00,$00,$31,$DF
    db $00,$02,$21,$FF
    db $00,$02,$2F,$BF
    db $00,$3F,$EF,$C0
    db $00,$3F,$CF,$FC
    db $00,$37,$9F,$C0
    db $00,$37,$B0,$00
    db $00,$37,$B0,$00
    db $00,$37,$B0,$00
    db $00,$3E,$70,$00
    db $00,$3F,$FF,$F0
    db $00,$1F,$C0,$00
    db $00,$7C,$00,$00
    db $00,$18,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $20,$00,$00,$00
    db                 $20,$00,$00,$00
    db                 $20,$00,$00,$00
    db                 $20,$00,$00,$00
    db                 $30,$00,$00,$00
    db                 $E0,$00,$00,$00
    db                 $FF,$E0,$00,$00
    db                 $FF,$E0,$00,$00
    db                 $FE,$00,$00,$00
    db                 $01,$80,$00,$00
    db                 $03,$80,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_tourianDebug:
    db $00,$00,$00,$00                                                   ;829C27;
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$08,$00
    db $00,$00,$08,$00
    db $00,$00,$08,$00
    db $00,$00,$08,$00
    db $00,$07,$FC,$00
    db $00,$07,$F8,$00
    db $00,$00,$08,$00
    db $00,$0F,$F8,$00
    db $00,$1F,$C0,$00
    db $00,$00,$C0,$00
    db $00,$07,$C0,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

MapData_ceres:
    db $00,$00,$00,$00                                                   ;829D27;
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$08,$00,$00
    db $00,$08,$00,$00
    db $00,$08,$00,$00
    db $00,$08,$00,$00
    db $00,$08,$00,$00
    db $00,$0F,$00,$00
    db $00,$01,$F8,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00
    db                 $00,$00,$00,$00

SetupMapScrollingForPauseMenu:
    REP #$30                                                             ;829E27;
    STA.B $14                                                            ;829E29;
    LDA.W $05AE                                                          ;829E2B;
    SEC                                                                  ;829E2E;
    SBC.W $05AC                                                          ;829E2F;
    LSR A                                                                ;829E32;
    CLC                                                                  ;829E33;
    ADC.W $05AC                                                          ;829E34;
    SEC                                                                  ;829E37;
    SBC.W #$0080                                                         ;829E38;
    STA.B $B1                                                            ;829E3B;
    LDA.W $0AF6                                                          ;829E3D;
    AND.W #$FF00                                                         ;829E40;
    XBA                                                                  ;829E43;
    CLC                                                                  ;829E44;
    ADC.W $07A1                                                          ;829E45;
    ASL A                                                                ;829E48;
    ASL A                                                                ;829E49;
    ASL A                                                                ;829E4A;
    SEC                                                                  ;829E4B;
    SBC.B $B1                                                            ;829E4C;
    STA.B $12                                                            ;829E4E;
    LDA.W #$00E0                                                         ;829E50;
    SEC                                                                  ;829E53;
    SBC.B $12                                                            ;829E54;
    BPL .Xscroll                                                         ;829E56;
    STA.B $12                                                            ;829E58;
    LDA.B $B1                                                            ;829E5A;
    SEC                                                                  ;829E5C;
    SBC.B $12                                                            ;829E5D;
    STA.B $B1                                                            ;829E5F;
    BRA .Yscroll                                                         ;829E61;


.Xscroll:
    LDA.W #$0020                                                         ;829E63;
    SEC                                                                  ;829E66;
    SBC.B $12                                                            ;829E67;
    STA.B $12                                                            ;829E69;
    BMI .Yscroll                                                         ;829E6B;
    LDA.B $B1                                                            ;829E6D;
    SEC                                                                  ;829E6F;
    SBC.B $12                                                            ;829E70;
    STA.B $B1                                                            ;829E72;

.Yscroll:
    LDA.W $05B2                                                          ;829E74;
    SEC                                                                  ;829E77;
    SBC.W $05B0                                                          ;829E78;
    LSR A                                                                ;829E7B;
    CLC                                                                  ;829E7C;
    ADC.W #$0010                                                         ;829E7D;
    CLC                                                                  ;829E80;
    ADC.W $05B0                                                          ;829E81;
    STA.B $12                                                            ;829E84;
    LDA.B $14                                                            ;829E86;
    SEC                                                                  ;829E88;
    SBC.B $12                                                            ;829E89;
    AND.W #$FFF8                                                         ;829E8B;
    EOR.W #$FFFF                                                         ;829E8E;
    INC A                                                                ;829E91;
    STA.B $B3                                                            ;829E92;
    LDA.W $0AFA                                                          ;829E94;
    XBA                                                                  ;829E97;
    AND.W #$00FF                                                         ;829E98;
    CLC                                                                  ;829E9B;
    ADC.W $07A3                                                          ;829E9C;
    INC A                                                                ;829E9F;
    ASL A                                                                ;829EA0;
    ASL A                                                                ;829EA1;
    ASL A                                                                ;829EA2;
    SEC                                                                  ;829EA3;
    SBC.B $B3                                                            ;829EA4;
    STA.B $12                                                            ;829EA6;
    LDA.W #$0040                                                         ;829EA8;
    SEC                                                                  ;829EAB;
    SBC.B $12                                                            ;829EAC;
    BMI .return                                                          ;829EAE;
    STA.B $12                                                            ;829EB0;
    LDA.B $B3                                                            ;829EB2;
    SEC                                                                  ;829EB4;
    SBC.B $12                                                            ;829EB5;
    STA.B $B3                                                            ;829EB7;
    CMP.W #$FFD8                                                         ;829EB9;
    BPL .return                                                          ;829EBC;
    LDA.W #$FFD8                                                         ;829EBE;
    STA.B $B3                                                            ;829EC1;

.return:
    RTS                                                                  ;829EC3;


DetermineMapScrollLimits:
    PHP                                                                  ;829EC4;
    PHB                                                                  ;829EC5;
    LDA.W $0789                                                          ;829EC6;
    BEQ .areaMapNotCollected                                             ;829EC9;
    LDA.W #$0082                                                         ;829ECB;
    STA.B $08                                                            ;829ECE;
    LDA.W #MapData_pointers                                              ;829ED0;
    STA.B $06                                                            ;829ED3;
    LDA.W $079F                                                          ;829ED5;
    ASL A                                                                ;829ED8;
    TAY                                                                  ;829ED9;
    LDA.B [$06],Y                                                        ;829EDA;
    STA.B $06                                                            ;829EDC;
    BRA +                                                                ;829EDE;


.areaMapNotCollected:
    LDA.W #$0000                                                         ;829EE0;
    STA.B $08                                                            ;829EE3;
    LDA.W #$07F7                                                         ;829EE5;
    STA.B $06                                                            ;829EE8;

  + PHK                                                                  ;829EEA;
    PLB                                                                  ;829EEB;
    SEP #$20                                                             ;829EEC;
    LDA.B $08                                                            ;829EEE;
    STA.B $02                                                            ;829EF0;
    REP #$20                                                             ;829EF2;
    LDA.B $06                                                            ;829EF4;
    STA.B $00                                                            ;829EF6;
    JSR.W DetermineLeftmostMapColumn                                     ;829EF8;
    JSR.W A_equals_X_times_8                                             ;829EFB;
    STA.W $05AC                                                          ;829EFE;
    LDA.W $079F                                                          ;829F01;
    CMP.W #$0004                                                         ;829F04;
    BNE +                                                                ;829F07;
    LDA.W $05AC                                                          ;829F09;
    SEC                                                                  ;829F0C;
    SBC.W #$0018                                                         ;829F0D;
    STA.W $05AC                                                          ;829F10;

  + LDA.B $06                                                            ;829F13;
    CLC                                                                  ;829F15;
    ADC.W #$0083                                                         ;829F16;
    STA.B $00                                                            ;829F19;
    JSR.W DetermineRightmostMapColumn                                    ;829F1B;
    JSR.W A_equals_X_times_8                                             ;829F1E;
    STA.W $05AE                                                          ;829F21;
    LDA.B $06                                                            ;829F24;
    STA.B $00                                                            ;829F26;
    JSR.W DetermineTopmostMapRow                                         ;829F28;
    JSR.W A_equals_X_times_8                                             ;829F2B;
    STA.W $05B0                                                          ;829F2E;
    LDA.B $06                                                            ;829F31;
    CLC                                                                  ;829F33;
    ADC.W #$007C                                                         ;829F34;
    STA.B $00                                                            ;829F37;
    JSR.W DetermineLeftmostMapRow                                        ;829F39;
    JSR.W A_equals_X_times_8                                             ;829F3C;
    STA.W $05B2                                                          ;829F3F;
    PLB                                                                  ;829F42;
    PLP                                                                  ;829F43;
    RTS                                                                  ;829F44;


A_equals_X_times_8:
    TXA                                                                  ;829F45;
    ASL A                                                                ;829F46;
    ASL A                                                                ;829F47;
    ASL A                                                                ;829F48;
    RTS                                                                  ;829F49;


DetermineLeftmostMapColumn:
    PHP                                                                  ;829F4A;
    SEP #$20                                                             ;829F4B;
    LDA.B #$00                                                           ;829F4D;
    XBA                                                                  ;829F4F;
    LDA.B #$00                                                           ;829F50;
    LDX.W #$0000                                                         ;829F52;

.loopColumns:
    TXA                                                                  ;829F55;
    AND.B #$07                                                           ;829F56;
    TAY                                                                  ;829F58;
    LDA.W .bits,Y                                                        ;829F59;
    STA.B $12                                                            ;829F5C;
    LDY.W #$0000                                                         ;829F5E;

.loopRows:
    LDA.B [$00],Y                                                        ;829F61;
    BIT.B $12                                                            ;829F63;
    BNE .return                                                          ;829F65;
    INY                                                                  ;829F67;
    INY                                                                  ;829F68;
    INY                                                                  ;829F69;
    INY                                                                  ;829F6A;
    CPY.W #$0080                                                         ;829F6B;
    BMI .loopRows                                                        ;829F6E;
    INX                                                                  ;829F70;
    CPX.W #$0040                                                         ;829F71;
    BPL .emptyMap                                                        ;829F74;
    TXA                                                                  ;829F76;
    AND.B #$07                                                           ;829F77;
    BNE +                                                                ;829F79;
    LDA.B $00                                                            ;829F7B;
    CLC                                                                  ;829F7D;
    ADC.B #$01                                                           ;829F7E;
    STA.B $00                                                            ;829F80;
    LDA.B $01                                                            ;829F82;
    ADC.B #$00                                                           ;829F84;
    STA.B $01                                                            ;829F86;

  + CPX.W #$0020                                                         ;829F88;
    BNE .loopColumns                                                     ;829F8B;
    LDA.B $00                                                            ;829F8D;
    CLC                                                                  ;829F8F;
    ADC.B #$7B                                                           ;829F90;
    STA.B $00                                                            ;829F92;
    LDA.B $01                                                            ;829F94;
    ADC.B #$00                                                           ;829F96;
    STA.B $01                                                            ;829F98;
    BRA .loopColumns                                                     ;829F9A;


.emptyMap:
    LDX.W #$001A                                                         ;829F9C;

.return:
    PLP                                                                  ;829F9F;
    RTS                                                                  ;829FA0;


.bits:
    db $80,$40,$20,$10,$08,$04,$02,$01                                   ;829FA1;

DetermineRightmostMapColumn:
    PHP                                                                  ;829FA9;
    SEP #$20                                                             ;829FAA;
    LDA.B #$00                                                           ;829FAC;
    XBA                                                                  ;829FAE;
    LDA.B #$00                                                           ;829FAF;
    LDX.W #$003F                                                         ;829FB1;

.loopColumns:
    TXA                                                                  ;829FB4;
    AND.B #$07                                                           ;829FB5;
    TAY                                                                  ;829FB7;
    LDA.W .bits,Y                                                        ;829FB8;
    STA.B $12                                                            ;829FBB;
    LDY.W #$0000                                                         ;829FBD;

.loopRows:
    LDA.B [$00],Y                                                        ;829FC0;
    BIT.B $12                                                            ;829FC2;
    BNE .return                                                          ;829FC4;
    INY                                                                  ;829FC6;
    INY                                                                  ;829FC7;
    INY                                                                  ;829FC8;
    INY                                                                  ;829FC9;
    CPY.W #$0080                                                         ;829FCA;
    BMI .loopRows                                                        ;829FCD;
    DEX                                                                  ;829FCF;
    BMI .emptyMap                                                        ;829FD0;
    TXA                                                                  ;829FD2;
    AND.B #$07                                                           ;829FD3;
    CMP.B #$07                                                           ;829FD5;
    BNE +                                                                ;829FD7;
    LDA.B $00                                                            ;829FD9;
    SEC                                                                  ;829FDB;
    SBC.B #$01                                                           ;829FDC;
    STA.B $00                                                            ;829FDE;
    LDA.B $01                                                            ;829FE0;
    SBC.B #$00                                                           ;829FE2;
    STA.B $01                                                            ;829FE4;

  + CPX.W #$001F                                                         ;829FE6;
    BNE .loopColumns                                                     ;829FE9;
    REP #$20                                                             ;829FEB;
    LDA.B $00                                                            ;829FED;
    SEC                                                                  ;829FEF;
    SBC.W #$007C                                                         ;829FF0;
    STA.B $00                                                            ;829FF3;
    LDA.W #$0000                                                         ;829FF5;
    SEP #$20                                                             ;829FF8;
    BRA .loopColumns                                                     ;829FFA;


.emptyMap:
    LDX.W #$001C                                                         ;829FFC;

.return:
    PLP                                                                  ;829FFF;
    RTS                                                                  ;82A000;


.bits:
    db $80,$40,$20,$10,$08,$04,$02,$01                                   ;82A001;

DetermineTopmostMapRow:
    PHP                                                                  ;82A009;
    REP #$20                                                             ;82A00A;
    LDA.B $00                                                            ;82A00C;
    CLC                                                                  ;82A00E;
    ADC.W #$0080                                                         ;82A00F;
    STA.B $03                                                            ;82A012;
    LDA.W #$0000                                                         ;82A014;
    SEP #$20                                                             ;82A017;
    LDA.B $02                                                            ;82A019;
    STA.B $05                                                            ;82A01B;
    LDX.W #$0000                                                         ;82A01D;
    LDY.W #$0000                                                         ;82A020;

.loop:
    LDA.B [$00],Y                                                        ;82A023;
    BNE .return                                                          ;82A025;
    LDA.B [$03],Y                                                        ;82A027;
    BNE .return                                                          ;82A029;
    INY                                                                  ;82A02B;
    CPY.W #$0004                                                         ;82A02C;
    BMI .loop                                                            ;82A02F;
    LDY.W #$0000                                                         ;82A031;
    REP #$20                                                             ;82A034;
    LDA.B $00                                                            ;82A036;
    CLC                                                                  ;82A038;
    ADC.W #$0004                                                         ;82A039;
    STA.B $00                                                            ;82A03C;
    LDA.B $03                                                            ;82A03E;
    CLC                                                                  ;82A040;
    ADC.W #$0004                                                         ;82A041;
    STA.B $03                                                            ;82A044;
    SEP #$20                                                             ;82A046;
    INX                                                                  ;82A048;
    CPX.W #$001F                                                         ;82A049;
    BMI .loop                                                            ;82A04C;
    LDX.W #$0001                                                         ;82A04E;

.return:
    PLP                                                                  ;82A051;
    RTS                                                                  ;82A052;


DetermineLeftmostMapRow:
    PHP                                                                  ;82A053;
    REP #$20                                                             ;82A054;
    LDA.B $00                                                            ;82A056;
    CLC                                                                  ;82A058;
    ADC.W #$0080                                                         ;82A059;
    STA.B $03                                                            ;82A05C;
    LDA.W #$0000                                                         ;82A05E;
    SEP #$20                                                             ;82A061;
    LDA.B $02                                                            ;82A063;
    STA.B $05                                                            ;82A065;
    LDX.W #$001F                                                         ;82A067;
    LDY.W #$0000                                                         ;82A06A;

.loop:
    LDA.B [$00],Y                                                        ;82A06D;
    BNE .return                                                          ;82A06F;
    LDA.B [$03],Y                                                        ;82A071;
    BNE .return                                                          ;82A073;
    INY                                                                  ;82A075;
    CPY.W #$0004                                                         ;82A076;
    BMI .loop                                                            ;82A079;
    LDY.W #$0000                                                         ;82A07B;
    REP #$20                                                             ;82A07E;
    LDA.B $00                                                            ;82A080;
    SEC                                                                  ;82A082;
    SBC.W #$0004                                                         ;82A083;
    STA.B $00                                                            ;82A086;
    LDA.B $03                                                            ;82A088;
    SEC                                                                  ;82A08A;
    SBC.W #$0004                                                         ;82A08B;
    STA.B $03                                                            ;82A08E;
    SEP #$20                                                             ;82A090;
    DEX                                                                  ;82A092;
    BNE .loop                                                            ;82A093;
    LDX.W #$000B                                                         ;82A095;

.return:
    PLP                                                                  ;82A098;
    RTS                                                                  ;82A099;


SetupPPUForPauseMenu:
    SEP #$30                                                             ;82A09A;
    LDA.B #$01                                                           ;82A09C;
    STA.W $2101                                                          ;82A09E;
    STA.B $52                                                            ;82A0A1;
    LDA.B #$09                                                           ;82A0A3;
    STA.W $2105                                                          ;82A0A5;
    STA.B $55                                                            ;82A0A8;
    STZ.B $5D                                                            ;82A0AA;
    STZ.W $210B                                                          ;82A0AC;
    LDA.B #$04                                                           ;82A0AF;
    STA.B $5E                                                            ;82A0B1;
    STA.W $210C                                                          ;82A0B3;
    LDA.B #$31                                                           ;82A0B6;
    STA.B $58                                                            ;82A0B8;
    STA.W $2107                                                          ;82A0BA;
    LDA.B #$38                                                           ;82A0BD;
    STA.B $59                                                            ;82A0BF;
    STA.W $2108                                                          ;82A0C1;
    LDA.B #$58                                                           ;82A0C4;
    STA.B $5A                                                            ;82A0C6;
    STA.W $2109                                                          ;82A0C8;
    LDA.B #$00                                                           ;82A0CB;
    STA.B $5C                                                            ;82A0CD;
    STA.W $210A                                                          ;82A0CF;
    LDA.B #$17                                                           ;82A0D2;
    STA.W $212C                                                          ;82A0D4;
    STA.B $69                                                            ;82A0D7;
    LDA.B #$00                                                           ;82A0D9;
    STA.W $2106                                                          ;82A0DB;
    STA.B $57                                                            ;82A0DE;
    LDA.B $74                                                            ;82A0E0;
    AND.B #$E0                                                           ;82A0E2;
    STA.B $74                                                            ;82A0E4;
    LDA.B $75                                                            ;82A0E6;
    AND.B #$E0                                                           ;82A0E8;
    STA.B $75                                                            ;82A0EA;
    LDA.B $76                                                            ;82A0EC;
    AND.B #$E0                                                           ;82A0EE;
    STA.B $76                                                            ;82A0F0;
    LDA.B #$00                                                           ;82A0F2;
    STA.B $71                                                            ;82A0F4;
    RTS                                                                  ;82A0F6;


ResetPauseMenuAnimations:
    REP #$30                                                             ;82A0F7;
    STZ.W $0757                                                          ;82A0F9;
    STZ.B $B1                                                            ;82A0FC;
    STZ.B $B5                                                            ;82A0FE;
    STZ.B $B9                                                            ;82A100;
    STZ.B $B7                                                            ;82A102;
    STZ.B $BB                                                            ;82A104;
    STZ.W $0753                                                          ;82A106;
    STZ.W $073F                                                          ;82A109;
    STZ.W $0745                                                          ;82A10C;
    STZ.W $0776                                                          ;82A10F;
    STZ.W $0778                                                          ;82A112;
    STZ.W $077A                                                          ;82A115;
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays   ;82A118;
    STA.W $072B                                                          ;82A11B;
    LDA.W #$0001                                                         ;82A11E;
    STA.W $073B                                                          ;82A121;
    LDA.W #$0000                                                         ;82A124;
    STA.W $074F                                                          ;82A127;
    RTS                                                                  ;82A12A;


Load_EquipmentScreen_EquipmentTilemaps:
    REP #$30                                                             ;82A12B;
    LDA.W $09D4                                                          ;82A12D;
    BEQ +                                                                ;82A130;
    LDY.W #$0000                                                         ;82A132;
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_tanks                   ;82A135;
    STA.B $03                                                            ;82A138;
    LDA.W #$0082                                                         ;82A13A;
    STA.B $05                                                            ;82A13D;
    LDA.B [$03],Y                                                        ;82A13F;
    STA.B $00                                                            ;82A141;
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_tanks            ;82A143;
    LDA.W #$000E                                                         ;82A146;
    STA.B $16                                                            ;82A149;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A14B;
    LDY.W #$0002                                                         ;82A14E;
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_tanks                   ;82A151;
    STA.B $03                                                            ;82A154;
    LDA.W #$0082                                                         ;82A156;
    STA.B $05                                                            ;82A159;
    LDA.B [$03],Y                                                        ;82A15B;
    STA.B $00                                                            ;82A15D;
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_tanksReserve     ;82A15F;
    LDA.W #$000E                                                         ;82A162;
    STA.B $16                                                            ;82A165;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A167;

  + LDY.W #$0000                                                         ;82A16A;
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_weapons                 ;82A16D;
    STA.B $03                                                            ;82A170;
    LDA.W #$0082                                                         ;82A172;
    STA.B $05                                                            ;82A175;
    LDA.B [$03],Y                                                        ;82A177;
    STA.B $00                                                            ;82A179;
    LDA.W $0A76                                                          ;82A17B;
    BNE .hyperBeam                                                       ;82A17E;

.loopWeapons:
    LDA.W EquipmentScreenData_EquipmentBitmasks_weapons,Y                ;82A180;
    BIT.W $09A8                                                          ;82A183;
    BNE +                                                                ;82A186;
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder                      ;82A188;
    LDA.W #$000A                                                         ;82A18B;
    STA.B $16                                                            ;82A18E;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A190;
    BRA .nextWeapon                                                      ;82A193;


  + LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_weapons,Y        ;82A195;
    LDA.W #$000A                                                         ;82A198;
    STA.B $16                                                            ;82A19B;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A19D;
    LDA.W EquipmentScreenData_EquipmentBitmasks_weapons,Y                ;82A1A0;
    BIT.W $09A6                                                          ;82A1A3;
    BNE .nextWeapon                                                      ;82A1A6;
    LDA.W #$0C00                                                         ;82A1A8;
    STA.B $12                                                            ;82A1AB;
    LDA.W #$000A                                                         ;82A1AD;
    STA.B $16                                                            ;82A1B0;
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12                            ;82A1B2;

.nextWeapon:
    INY                                                                  ;82A1B5;
    INY                                                                  ;82A1B6;
    LDA.B [$03],Y                                                        ;82A1B7;
    STA.B $00                                                            ;82A1B9;
    CPY.W #$000C                                                         ;82A1BB;
    BMI .loopWeapons                                                     ;82A1BE;
    BRA .merge                                                           ;82A1C0;


.hyperBeam:
    LDY.W #$0000                                                         ;82A1C2;

.loopHyperBeamWeapons:
    LDX.W HyperBeamTilemaps,Y                                            ;82A1C5;
    LDA.W #$000A                                                         ;82A1C8;
    STA.B $16                                                            ;82A1CB;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A1CD;
    INY                                                                  ;82A1D0;
    INY                                                                  ;82A1D1;
    LDA.B [$03],Y                                                        ;82A1D2;
    STA.B $00                                                            ;82A1D4;
    CPY.W #$000C                                                         ;82A1D6;
    BMI .loopHyperBeamWeapons                                            ;82A1D9;

.merge:
    LDY.W #$0000                                                         ;82A1DB;
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_suitsMisc               ;82A1DE;
    STA.B $03                                                            ;82A1E1;
    LDA.W #$0082                                                         ;82A1E3;
    STA.B $05                                                            ;82A1E6;
    LDA.B [$03],Y                                                        ;82A1E8;
    STA.B $00                                                            ;82A1EA;

.loopSuitMisc:
    LDA.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,Y              ;82A1EC;
    BIT.W $09A4                                                          ;82A1EF;
    BNE +                                                                ;82A1F2;
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder                      ;82A1F4;
    LDA.W #$0012                                                         ;82A1F7;
    STA.B $16                                                            ;82A1FA;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A1FC;
    BRA .nextSuitMisc                                                    ;82A1FF;


  + LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_suitsMisc,Y      ;82A201;
    LDA.W #$0012                                                         ;82A204;
    STA.B $16                                                            ;82A207;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A209;
    LDA.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,Y              ;82A20C;
    BIT.W $09A2                                                          ;82A20F;
    BNE .nextSuitMisc                                                    ;82A212;
    LDA.W #$0C00                                                         ;82A214;
    STA.B $12                                                            ;82A217;
    LDA.W #$0012                                                         ;82A219;
    STA.B $16                                                            ;82A21C;
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12                            ;82A21E;

.nextSuitMisc:
    INY                                                                  ;82A221;
    INY                                                                  ;82A222;
    LDA.B [$03],Y                                                        ;82A223;
    STA.B $00                                                            ;82A225;
    CPY.W #$000C                                                         ;82A227;
    BMI .loopSuitMisc                                                    ;82A22A;
    LDY.W #$0000                                                         ;82A22C;
    LDA.W #EquipmentScreenData_RAMTilemapOffsets_boots                   ;82A22F;
    STA.B $03                                                            ;82A232;
    LDA.W #$0082                                                         ;82A234;
    STA.B $05                                                            ;82A237;
    LDA.B [$03],Y                                                        ;82A239;
    STA.B $00                                                            ;82A23B;

.loopBoots:
    LDA.W EquipmentScreenData_EquipmentBitmasks_boots,Y                  ;82A23D;
    BIT.W $09A4                                                          ;82A240;
    BNE +                                                                ;82A243;
    LDX.W #EquipmentScreenTilemaps_blankPlaceholder                      ;82A245;
    LDA.W #$0012                                                         ;82A248;
    STA.B $16                                                            ;82A24B;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A24D;
    BRA .nextBoots                                                       ;82A250;


  + LDA.W #$0012                                                         ;82A252;
    STA.B $16                                                            ;82A255;
    LDX.W EquipmentScreenData_PointersEquipmentTIlemaps_boots,Y          ;82A257;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82A25A;
    LDA.W EquipmentScreenData_EquipmentBitmasks_boots,Y                  ;82A25D;
    BIT.W $09A2                                                          ;82A260;
    BNE .nextBoots                                                       ;82A263;
    LDA.W #$0C00                                                         ;82A265;
    STA.B $12                                                            ;82A268;
    LDA.W #$0012                                                         ;82A26A;
    STA.B $16                                                            ;82A26D;
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12                            ;82A26F;

.nextBoots:
    INY                                                                  ;82A272;
    INY                                                                  ;82A273;
    LDA.B [$03],Y                                                        ;82A274;
    STA.B $00                                                            ;82A276;
    CPY.W #$0006                                                         ;82A278;
    BMI .loopBoots                                                       ;82A27B;
    RTS                                                                  ;82A27D;


Copy_Bytes_from_X_to_7ERAM:
    PHP                                                                  ;82A27E;
    PHY                                                                  ;82A27F;
    SEP #$20                                                             ;82A280;
    LDA.B #$7E                                                           ;82A282;
    STA.B $02                                                            ;82A284;
    REP #$30                                                             ;82A286;
    LDY.W #$0000                                                         ;82A288;

.loop:
    LDA.W $0000,X                                                        ;82A28B;
    STA.B [$00],Y                                                        ;82A28E;
    INX                                                                  ;82A290;
    INX                                                                  ;82A291;
    INY                                                                  ;82A292;
    INY                                                                  ;82A293;
    DEC.B $16                                                            ;82A294;
    DEC.B $16                                                            ;82A296;
    BNE .loop                                                            ;82A298;
    PLY                                                                  ;82A29A;
    PLP                                                                  ;82A29B;
    RTS                                                                  ;82A29C;


Copy_Bytes_of_Palette_from_7E_to_12:
    PHP                                                                  ;82A29D;
    PHY                                                                  ;82A29E;
    SEP #$20                                                             ;82A29F;
    LDA.B #$7E                                                           ;82A2A1;
    STA.B $02                                                            ;82A2A3;
    REP #$30                                                             ;82A2A5;
    LDY.W #$0000                                                         ;82A2A7;

.loop:
    LDA.B [$00],Y                                                        ;82A2AA;
    AND.W #$E3FF                                                         ;82A2AC;
    ORA.B $12                                                            ;82A2AF;
    STA.B [$00],Y                                                        ;82A2B1;
    INY                                                                  ;82A2B3;
    INY                                                                  ;82A2B4;
    DEC.B $16                                                            ;82A2B5;
    DEC.B $16                                                            ;82A2B7;
    BNE .loop                                                            ;82A2B9;
    PLY                                                                  ;82A2BB;
    PLP                                                                  ;82A2BC;
    RTS                                                                  ;82A2BD;


Clear_Samus_Beam_Tiles:
    PHP                                                                  ;82A2BE;
    SEP #$30                                                             ;82A2BF;
    LDA.B #$00                                                           ;82A2C1;
    STA.W $2116                                                          ;82A2C3;
    LDA.B #$60                                                           ;82A2C6;
    STA.W $2117                                                          ;82A2C8;
    LDA.B #$80                                                           ;82A2CB;
    STA.W $2115                                                          ;82A2CD;
    JSL.L SetupHDMATransfer                                              ;82A2D0;
    db $01,$01,$18                                                       ;82A2D4;
    dl Tiles_Standard_Sprite_0                                           ;82A2D7;
    dw $1000                                                             ;82A2DA;
    LDA.B #$02                                                           ;82A2DC;
    STA.W $420B                                                          ;82A2DE;
    PLP                                                                  ;82A2E1;
    RTS                                                                  ;82A2E2;


ContinueInitialising_GameplayResume:
    SEP #$30                                                             ;82A2E3;
    PHP                                                                  ;82A2E5;
    REP #$30                                                             ;82A2E6;
    LDY.W #$0200                                                         ;82A2E8;
    LDX.W #$0000                                                         ;82A2EB;

.loop:
    LDA.L $7E3300,X                                                      ;82A2EE;
    STA.L $7EC000,X                                                      ;82A2F2;
    INX                                                                  ;82A2F6;
    INX                                                                  ;82A2F7;
    DEY                                                                  ;82A2F8;
    DEY                                                                  ;82A2F9;
    BNE .loop                                                            ;82A2FA;
    PLP                                                                  ;82A2FC;
    JSR.W Setup_PPU_for_GameplayResume                                   ;82A2FD;
    JSR.W Calculate_BG_Scrolls_bank82                                    ;82A300;
    JSR.W JSL_to_Update_BeamTiles_and_Palette                            ;82A303;
    JSR.W Clear_PauseMenu_Data                                           ;82A306;
    REP #$30                                                             ;82A309;
    LDA.W #$000C                                                         ;82A30B;
    JSL.L Run_Samus_Command                                              ;82A30E;
    RTS                                                                  ;82A312;


Setup_PPU_for_GameplayResume:
    PHP                                                                  ;82A313;
    SEP #$30                                                             ;82A314;
    LDA.B #$03                                                           ;82A316;
    STA.W $2101                                                          ;82A318;
    STA.B $52                                                            ;82A31B;
    LDA.B #$09                                                           ;82A31D;
    STA.W $2105                                                          ;82A31F;
    STA.B $55                                                            ;82A322;
    STZ.B $5D                                                            ;82A324;
    STZ.W $210B                                                          ;82A326;
    LDA.B #$04                                                           ;82A329;
    STA.B $5E                                                            ;82A32B;
    STA.W $210C                                                          ;82A32D;
    LDA.B #$51                                                           ;82A330;
    STA.B $58                                                            ;82A332;
    STA.W $2107                                                          ;82A334;
    LDA.B #$49                                                           ;82A337;
    STA.B $59                                                            ;82A339;
    STA.W $2108                                                          ;82A33B;
    LDA.B #$5A                                                           ;82A33E;
    STA.B $5A                                                            ;82A340;
    STA.W $2109                                                          ;82A342;
    LDA.B #$00                                                           ;82A345;
    STA.B $5C                                                            ;82A347;
    STA.W $210A                                                          ;82A349;
    PLP                                                                  ;82A34C;
    RTS                                                                  ;82A34D;


Calculate_BG_Scrolls_bank82:
    PHP                                                                  ;82A34E;
    REP #$30                                                             ;82A34F;
    LDA.W $0911                                                          ;82A351;
    CLC                                                                  ;82A354;
    ADC.W $091D                                                          ;82A355;
    STA.B $B1                                                            ;82A358;
    LDA.W $0915                                                          ;82A35A;
    CLC                                                                  ;82A35D;
    ADC.W $091F                                                          ;82A35E;
    STA.B $B3                                                            ;82A361;
    LDA.W $0917                                                          ;82A363;
    CLC                                                                  ;82A366;
    ADC.W $0921                                                          ;82A367;
    STA.B $B5                                                            ;82A36A;
    LDA.W $0919                                                          ;82A36C;
    CLC                                                                  ;82A36F;
    ADC.W $0923                                                          ;82A370;
    STA.B $B7                                                            ;82A373;
    PLP                                                                  ;82A375;
    RTS                                                                  ;82A376;


JSL_to_Update_BeamTiles_and_Palette:
    PHP                                                                  ;82A377;
    REP #$30                                                             ;82A378;
    JSL.L Update_Beam_Tiles_and_Palette                                  ;82A37A;
    PLP                                                                  ;82A37E;
    RTS                                                                  ;82A37F;


Clear_PauseMenu_Data:
    PHP                                                                  ;82A380;
    REP #$30                                                             ;82A381;
    STZ.W $0727                                                          ;82A383;
    STZ.W $0729                                                          ;82A386;
    STZ.W $072B                                                          ;82A389;
    STZ.W $072D                                                          ;82A38C;
    STZ.W $072F                                                          ;82A38F;
    STZ.W $0731                                                          ;82A392;
    STZ.W $0733                                                          ;82A395;
    STZ.W $0735                                                          ;82A398;
    STZ.W $0737                                                          ;82A39B;
    STZ.W $0739                                                          ;82A39E;
    STZ.W $073D                                                          ;82A3A1;
    STZ.W $073F                                                          ;82A3A4;
    STZ.W $0741                                                          ;82A3A7;
    STZ.W $0743                                                          ;82A3AA;
    STZ.W $0745                                                          ;82A3AD;
    STZ.W $0747                                                          ;82A3B0;
    STZ.W $0749                                                          ;82A3B3;
    STZ.W $074B                                                          ;82A3B6;
    STZ.W $074D                                                          ;82A3B9;
    STZ.W $0751                                                          ;82A3BC;
    STZ.W $0753                                                          ;82A3BF;
    STZ.W $0755                                                          ;82A3C2;
    STZ.W $0757                                                          ;82A3C5;
    STZ.W $0759                                                          ;82A3C8;
    STZ.W $075B                                                          ;82A3CB;
    STZ.W $075D                                                          ;82A3CE;
    STZ.W $075F                                                          ;82A3D1;
    STZ.W $0761                                                          ;82A3D4;
    PLP                                                                  ;82A3D7;
    RTS                                                                  ;82A3D8;


UNUSED_Change_Pose_Due_to_Equipment_Change:
    PHP                                                                  ;82A3D9;
    REP #$30                                                             ;82A3DA;
    LDA.W $0A1F                                                          ;82A3DC;
    AND.W #$00FF                                                         ;82A3DF;
    ASL A                                                                ;82A3E2;
    TAX                                                                  ;82A3E3;
    JSR.W (.pointers,X)                                                  ;82A3E4;
    JSL.L LoadSamusSuitPalette                                           ;82A3E7;
    PLP                                                                  ;82A3EB;
    RTS                                                                  ;82A3EC;


.pointers:
    dw RTS_82A425                                                        ;82A3ED;
    dw RTS_82A425                                                        ;82A3EF;
    dw RTS_82A425                                                        ;82A3F1;
    dw ChangePose_DueTo_EquipmentChange_SpinJumping                      ;82A3F3;
    dw ChangePose_DueTo_EquipmentChange_MorphBall                        ;82A3F5;
    dw RTS_82A425                                                        ;82A3F7;
    dw RTS_82A425                                                        ;82A3F9;
    dw Change_Pose_due_to_Equipment_Change_MovementTypes_7_9             ;82A3FB;
    dw ChangePose_DueTo_EquipmentChange_MorphBall                        ;82A3FD;
    dw Change_Pose_due_to_Equipment_Change_MovementTypes_7_9             ;82A3FF;
    dw RTS_82A425                                                        ;82A401;
    dw RTS_82A425                                                        ;82A403;
    dw RTS_82A425                                                        ;82A405;
    dw RTS_82A425                                                        ;82A407;
    dw RTS_82A425                                                        ;82A409;
    dw RTS_82A425                                                        ;82A40B;
    dw RTS_82A425                                                        ;82A40D;
    dw ChangePose_DueTo_EquipmentChange_SpringBall                       ;82A40F;
    dw ChangePose_DueTo_EquipmentChange_SpringBall                       ;82A411;
    dw ChangePose_DueTo_EquipmentChange_SpringBall                       ;82A413;
    dw RTS_82A425                                                        ;82A415;
    dw RTS_82A425                                                        ;82A417;
    dw RTS_82A425                                                        ;82A419;
    dw RTS_82A425                                                        ;82A41B;
    dw RTS_82A425                                                        ;82A41D;
    dw RTS_82A425                                                        ;82A41F;
    dw RTS_82A425                                                        ;82A421;
    dw RTS_82A425                                                        ;82A423;

RTS_82A425:
    PHP                                                                  ;82A425;
    REP #$30                                                             ;82A426;
    PLP                                                                  ;82A428;
    RTS                                                                  ;82A429;


ChangePose_DueTo_EquipmentChange_SpinJumping:
    PHP                                                                  ;82A42A;
    REP #$30                                                             ;82A42B;
    LDA.W $0A1C                                                          ;82A42D;
    CMP.W #$0081                                                         ;82A430;
    BEQ .screwAttack                                                     ;82A433;
    CMP.W #$0082                                                         ;82A435;
    BEQ .screwAttack                                                     ;82A438;
    CMP.W #$001B                                                         ;82A43A;
    BEQ .spaceJump                                                       ;82A43D;
    CMP.W #$001C                                                         ;82A43F;
    BEQ .spaceJump                                                       ;82A442;
    BRA .return                                                          ;82A444;


.spaceJump:
    LDA.W $09A2                                                          ;82A446;
    BIT.W #$0020                                                         ;82A449;
    BNE .return                                                          ;82A44C;
    BRA .merge                                                           ;82A44E;


.screwAttack:
    LDA.W $09A2                                                          ;82A450;
    BIT.W #$0008                                                         ;82A453;
    BNE .return                                                          ;82A456;

.merge:
    LDA.W $0A1E                                                          ;82A458;
    AND.W #$00FF                                                         ;82A45B;
    CMP.W #$0004                                                         ;82A45E;
    BEQ .facingLeft                                                      ;82A461;
    LDA.W #$0019                                                         ;82A463;
    STA.W $0A1C                                                          ;82A466;
    BRA .initialisePose                                                  ;82A469;


.facingLeft:
    LDA.W #$001A                                                         ;82A46B;
    STA.W $0A1C                                                          ;82A46E;

.initialisePose:
    JSL.L InitializeSamusPose_1                                          ;82A471;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;82A475;

.return:
    PLP                                                                  ;82A479;
    RTS                                                                  ;82A47A;


Change_Pose_due_to_Equipment_Change_MovementTypes_7_9:
    PHP                                                                  ;82A47B;
    REP #$30                                                             ;82A47C;
    LDA.W $09A2                                                          ;82A47E;
    BIT.W #$0004                                                         ;82A481;
    BNE .return                                                          ;82A484;
    LDA.W $0A1E                                                          ;82A486;
    AND.W #$00FF                                                         ;82A489;
    CMP.W #$0004                                                         ;82A48C;
    BEQ .facingLeft                                                      ;82A48F;
    LDA.W #$001D                                                         ;82A491;
    STA.W $0A1C                                                          ;82A494;
    BRA .initialisePose                                                  ;82A497;


.facingLeft:
    LDA.W #$0041                                                         ;82A499;
    STA.W $0A1C                                                          ;82A49C;

.initialisePose:
    JSL.L InitializeSamusPose_1                                          ;82A49F;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;82A4A3;

.return:
    PLP                                                                  ;82A4A7;
    RTS                                                                  ;82A4A8;


ChangePose_DueTo_EquipmentChange_MorphBall:
    PHP                                                                  ;82A4A9;
    REP #$30                                                             ;82A4AA;
    LDA.W $09A2                                                          ;82A4AC;
    BIT.W #$0002                                                         ;82A4AF;
    BEQ .return                                                          ;82A4B2;
    LDA.W $0A1E                                                          ;82A4B4;
    AND.W #$00FF                                                         ;82A4B7;
    CMP.W #$0004                                                         ;82A4BA;
    BEQ .facingLeft                                                      ;82A4BD;
    LDA.W #$0079                                                         ;82A4BF;
    STA.W $0A1C                                                          ;82A4C2;
    BRA .initialisePose                                                  ;82A4C5;


.facingLeft:
    LDA.W #$007A                                                         ;82A4C7;
    STA.W $0A1C                                                          ;82A4CA;

.initialisePose:
    JSL.L InitializeSamusPose_1                                          ;82A4CD;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;82A4D1;

.return:
    PLP                                                                  ;82A4D5;
    RTS                                                                  ;82A4D6;


ChangePose_DueTo_EquipmentChange_SpringBall:
    PHP                                                                  ;82A4D7;
    REP #$30                                                             ;82A4D8;
    LDA.W $09A2                                                          ;82A4DA;
    BIT.W #$0002                                                         ;82A4DD;
    BNE .return                                                          ;82A4E0;
    LDA.W $0A1E                                                          ;82A4E2;
    AND.W #$00FF                                                         ;82A4E5;
    CMP.W #$0004                                                         ;82A4E8;
    BEQ .facingLeft                                                      ;82A4EB;
    LDA.W #$001D                                                         ;82A4ED;
    STA.W $0A1C                                                          ;82A4F0;
    BRA .initialisePose                                                  ;82A4F3;


.facingLeft:
    LDA.W #$0041                                                         ;82A4F5;
    STA.W $0A1C                                                          ;82A4F8;

.initialisePose:
    JSL.L InitializeSamusPose_1                                          ;82A4FB;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;82A4FF;

.return:
    PLP                                                                  ;82A503;
    RTS                                                                  ;82A504;


Handle_PauseScreen_L_R:
    JSR.W Handle_PauseScreen_L_R_Input                                   ;82A505;
    JSR.W EquipmentScreen_Draw_L_R_Highlight                             ;82A508;
    RTS                                                                  ;82A50B;


Handle_PauseScreen_L_R_Input:
    PHP                                                                  ;82A50C;
    REP #$30                                                             ;82A50D;
    LDA.W $05E1                                                          ;82A50F;
    BIT.W #$0020                                                         ;82A512;
    BNE .L                                                               ;82A515;
    BIT.W #$0010                                                         ;82A517;
    BNE .R                                                               ;82A51A;
    BRA .return                                                          ;82A51C;

    LDA.W $0753                                                          ;82A51E;
    BNE .highlightL                                                      ;82A521;
    BRA .highlightR                                                      ;82A523;


.R:
    LDA.W $0753                                                          ;82A525;
    CMP.W #$0002                                                         ;82A528;
    BEQ .return                                                          ;82A52B;
    LDA.W Duration_Of_L_R_Button_Pressed_Highlight                       ;82A52D;
    STA.W $0729                                                          ;82A530;
    LDA.W #$0002                                                         ;82A533;
    STA.W $0727                                                          ;82A536;

.highlightR:
    LDA.W #$0002                                                         ;82A539;
    STA.W $0751                                                          ;82A53C;
    STA.W $0753                                                          ;82A53F;
    JSR.W Set_PauseScreen_ButtonLabelPalettes                            ;82A542;
    BRA .merge                                                           ;82A545;


.L:
    LDA.W $0753                                                          ;82A547;
    BEQ .return                                                          ;82A54A;
    LDA.W Duration_Of_L_R_Button_Pressed_Highlight                       ;82A54C;
    STA.W $0729                                                          ;82A54F;
    LDA.W #$0005                                                         ;82A552;
    STA.W $0727                                                          ;82A555;

.highlightL:
    LDA.W #$0001                                                         ;82A558;
    STA.W $0751                                                          ;82A55B;
    STZ.W $0753                                                          ;82A55E;
    JSR.W Set_PauseScreen_ButtonLabelPalettes                            ;82A561;

.merge:
    LDA.W #$0038                                                         ;82A564;
    JSL.L QueueSound_Lib1_Max6                                           ;82A567;

.return:
    PLP                                                                  ;82A56B;
    RTS                                                                  ;82A56C;


Handle_PauseMenu_L_R_PressedHighlight:
    PHP                                                                  ;82A56D;
    REP #$30                                                             ;82A56E;
    LDA.W $0729                                                          ;82A570;
    BEQ .return                                                          ;82A573;
    DEC A                                                                ;82A575;
    STA.W $0729                                                          ;82A576;
    LDA.W $0751                                                          ;82A579;
    BEQ .return                                                          ;82A57C;
    DEC A                                                                ;82A57E;
    ASL A                                                                ;82A57F;
    TAX                                                                  ;82A580;
    LDA.W #$0000                                                         ;82A581;
    STA.B $03                                                            ;82A584;
    LDA.W L_R_ButtonPressed_HighlightTable_spritemapID,X                 ;82A586;
    PHA                                                                  ;82A589;
    LDA.W L_R_ButtonPressed_HighlightTable_YposPlus1,X                   ;82A58A;
    TAY                                                                  ;82A58D;
    DEY                                                                  ;82A58E;
    LDA.W L_R_ButtonPressed_HighlightTable_Xpos,X                        ;82A58F;
    TAX                                                                  ;82A592;
    PLA                                                                  ;82A593;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82A594;

.return:
    PLP                                                                  ;82A598;
    RTS                                                                  ;82A599;


EquipmentScreen_Draw_L_R_Highlight:
    PHP                                                                  ;82A59A;
    REP #$30                                                             ;82A59B;
    LDY.W #$00D0                                                         ;82A59D;
    LDX.W #$0018                                                         ;82A5A0;
    LDA.W #$0002                                                         ;82A5A3;
    JSR.W Draw_PauseScreen_SpriteAnimation                               ;82A5A6;
    LDY.W #$00D0                                                         ;82A5A9;
    LDX.W #$00E8                                                         ;82A5AC;
    LDA.W #$0002                                                         ;82A5AF;
    JSR.W Draw_PauseScreen_SpriteAnimation                               ;82A5B2;
    PLP                                                                  ;82A5B5;
    RTS                                                                  ;82A5B6;


Handle_PauseScreen_StartButton:
    PHP                                                                  ;82A5B7;
    REP #$30                                                             ;82A5B8;
    LDA.W $05E1                                                          ;82A5BA;
    BIT.W #$1000                                                         ;82A5BD;
    BEQ +                                                                ;82A5C0;
    LDA.W #$0038                                                         ;82A5C2;
    JSL.L QueueSound_Lib1_Max6                                           ;82A5C5;
    LDA.W #$0001                                                         ;82A5C9;
    STA.W $0723                                                          ;82A5CC;
    STA.W $0725                                                          ;82A5CF;
    LDA.W $0753                                                          ;82A5D2;
    PHA                                                                  ;82A5D5;
    LDA.W #$0001                                                         ;82A5D6;
    STA.W $0753                                                          ;82A5D9;
    JSR.W Set_PauseScreen_ButtonLabelPalettes                            ;82A5DC;
    PLA                                                                  ;82A5DF;
    STA.W $0753                                                          ;82A5E0;
    LDA.W #$000B                                                         ;82A5E3;
    STA.W $0729                                                          ;82A5E6;
    INC.W $0998                                                          ;82A5E9;

  + JSR.W Update_PauseMenu_L_R_Start_VRAMTilemap                         ;82A5EC;
    PLP                                                                  ;82A5EF;
    RTS                                                                  ;82A5F0;


Handle_PauseMenu_StartPressedHighlight:
    PHP                                                                  ;82A5F1;
    PHB                                                                  ;82A5F2;
    PHK                                                                  ;82A5F3;
    PLB                                                                  ;82A5F4;
    REP #$30                                                             ;82A5F5;
    LDA.W $0729                                                          ;82A5F7;
    BEQ .return                                                          ;82A5FA;
    DEC A                                                                ;82A5FC;
    STA.W $0729                                                          ;82A5FD;
    LDA.W #$0000                                                         ;82A600;
    STA.B $03                                                            ;82A603;
    LDX.W #$0090                                                         ;82A605;
    LDY.W #$00D0                                                         ;82A608;
    LDA.W #$002B                                                         ;82A60B;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82A60E;

.return:
    PLB                                                                  ;82A612;
    PLP                                                                  ;82A613;
    RTL                                                                  ;82A614;


Set_PauseScreen_ButtonLabelPalettes:
    PHP                                                                  ;82A615;
    REP #$30                                                             ;82A616;
    LDA.W $0753                                                          ;82A618;
    ASL A                                                                ;82A61B;
    TAX                                                                  ;82A61C;
    JSR.W (.pointers,X)                                                  ;82A61D;
    PLP                                                                  ;82A620;
    RTS                                                                  ;82A621;


.pointers:
    dw Set_PauseScreen_ButtonLabelPalettes_MapScreen                     ;82A622;
    dw Set_PauseScreen_ButtonLabelPalettes_Unpausing                     ;82A624;
    dw Set_PauseScreen_ButtonLabelPalettes_EquipmentScreen               ;82A626;

Set_PauseScreen_ButtonLabelPalettes_EquipmentScreen:
    REP #$30                                                             ;82A628;
    PHP                                                                  ;82A62A;
    REP #$30                                                             ;82A62B;
    LDY.W #$000A                                                         ;82A62D;
    LDX.W #$0000                                                         ;82A630;

.loopTopMAP:
    LDA.L $7E364A,X                                                      ;82A633;
    AND.W #$E3FF                                                         ;82A637;
    ORA.W #$0800                                                         ;82A63A;
    STA.L $7E364A,X                                                      ;82A63D;
    INX                                                                  ;82A641;
    INX                                                                  ;82A642;
    DEY                                                                  ;82A643;
    DEY                                                                  ;82A644;
    BNE .loopTopMAP                                                      ;82A645;
    PLP                                                                  ;82A647;
    PHP                                                                  ;82A648;
    REP #$30                                                             ;82A649;
    LDY.W #$000A                                                         ;82A64B;
    LDX.W #$0000                                                         ;82A64E;

.loopBottomMAP:
    LDA.L $7E368A,X                                                      ;82A651;
    AND.W #$E3FF                                                         ;82A655;
    ORA.W #$0800                                                         ;82A658;
    STA.L $7E368A,X                                                      ;82A65B;
    INX                                                                  ;82A65F;
    INX                                                                  ;82A660;
    DEY                                                                  ;82A661;
    DEY                                                                  ;82A662;
    BNE .loopBottomMAP                                                   ;82A663;
    PLP                                                                  ;82A665;
    PHP                                                                  ;82A666;
    REP #$30                                                             ;82A667;
    LDY.W #$0008                                                         ;82A669;
    LDX.W #$0000                                                         ;82A66C;

.loopTopEXIT:
    LDA.L $7E3658,X                                                      ;82A66F;
    AND.W #$E3FF                                                         ;82A673;
    ORA.W #$0800                                                         ;82A676;
    STA.L $7E3658,X                                                      ;82A679;
    INX                                                                  ;82A67D;
    INX                                                                  ;82A67E;
    DEY                                                                  ;82A67F;
    DEY                                                                  ;82A680;
    BNE .loopTopEXIT                                                     ;82A681;
    PLP                                                                  ;82A683;
    PHP                                                                  ;82A684;
    REP #$30                                                             ;82A685;
    LDY.W #$0008                                                         ;82A687;
    LDX.W #$0000                                                         ;82A68A;

.loopBottomEXIT:
    LDA.L $7E3698,X                                                      ;82A68D;
    AND.W #$E3FF                                                         ;82A691;
    ORA.W #$0800                                                         ;82A694;
    STA.L $7E3698,X                                                      ;82A697;
    INX                                                                  ;82A69B;
    INX                                                                  ;82A69C;
    DEY                                                                  ;82A69D;
    DEY                                                                  ;82A69E;
    BNE .loopBottomEXIT                                                  ;82A69F;
    PLP                                                                  ;82A6A1;
    PHP                                                                  ;82A6A2;
    REP #$30                                                             ;82A6A3;
    LDY.W #$000A                                                         ;82A6A5;
    LDX.W #$0000                                                         ;82A6A8;

.loopTopSAMUS:
    LDA.L $7E366C,X                                                      ;82A6AB;
    AND.W #$E3FF                                                         ;82A6AF;
    ORA.W #$1400                                                         ;82A6B2;
    STA.L $7E366C,X                                                      ;82A6B5;
    INX                                                                  ;82A6B9;
    INX                                                                  ;82A6BA;
    DEY                                                                  ;82A6BB;
    DEY                                                                  ;82A6BC;
    BNE .loopTopSAMUS                                                    ;82A6BD;
    PLP                                                                  ;82A6BF;
    PHP                                                                  ;82A6C0;
    REP #$30                                                             ;82A6C1;
    LDY.W #$000A                                                         ;82A6C3;
    LDX.W #$0000                                                         ;82A6C6;

.loopBottomSAMUS:
    LDA.L $7E36AC,X                                                      ;82A6C9;
    AND.W #$E3FF                                                         ;82A6CD;
    ORA.W #$1400                                                         ;82A6D0;
    STA.L $7E36AC,X                                                      ;82A6D3;
    INX                                                                  ;82A6D7;
    INX                                                                  ;82A6D8;
    DEY                                                                  ;82A6D9;
    DEY                                                                  ;82A6DA;
    BNE .loopBottomSAMUS                                                 ;82A6DB;
    PLP                                                                  ;82A6DD;
    RTS                                                                  ;82A6DE;


Set_PauseScreen_ButtonLabelPalettes_Unpausing:
    REP #$30                                                             ;82A6DF;
    PHP                                                                  ;82A6E1;
    REP #$30                                                             ;82A6E2;
    LDY.W #$0008                                                         ;82A6E4;
    LDX.W #$0000                                                         ;82A6E7;

.loopTopEXIT:
    LDA.L $7E3658,X                                                      ;82A6EA;
    AND.W #$E3FF                                                         ;82A6EE;
    ORA.W #$0800                                                         ;82A6F1;
    STA.L $7E3658,X                                                      ;82A6F4;
    INX                                                                  ;82A6F8;
    INX                                                                  ;82A6F9;
    DEY                                                                  ;82A6FA;
    DEY                                                                  ;82A6FB;
    BNE .loopTopEXIT                                                     ;82A6FC;
    PLP                                                                  ;82A6FE;
    PHP                                                                  ;82A6FF;
    REP #$30                                                             ;82A700;
    LDY.W #$0008                                                         ;82A702;
    LDX.W #$0000                                                         ;82A705;

.loopBottomEXIT:
    LDA.L $7E3698,X                                                      ;82A708;
    AND.W #$E3FF                                                         ;82A70C;
    ORA.W #$0800                                                         ;82A70F;
    STA.L $7E3698,X                                                      ;82A712;
    INX                                                                  ;82A716;
    INX                                                                  ;82A717;
    DEY                                                                  ;82A718;
    DEY                                                                  ;82A719;
    BNE .loopBottomEXIT                                                  ;82A71A;
    PLP                                                                  ;82A71C;
    PHP                                                                  ;82A71D;
    REP #$30                                                             ;82A71E;
    LDY.W #$000A                                                         ;82A720;
    LDX.W #$0000                                                         ;82A723;

.loopTopMAP:
    LDA.L $7E364A,X                                                      ;82A726;
    AND.W #$E3FF                                                         ;82A72A;
    ORA.W #$1400                                                         ;82A72D;
    STA.L $7E364A,X                                                      ;82A730;
    INX                                                                  ;82A734;
    INX                                                                  ;82A735;
    DEY                                                                  ;82A736;
    DEY                                                                  ;82A737;
    BNE .loopTopMAP                                                      ;82A738;
    PLP                                                                  ;82A73A;
    PHP                                                                  ;82A73B;
    REP #$30                                                             ;82A73C;
    LDY.W #$000A                                                         ;82A73E;
    LDX.W #$0000                                                         ;82A741;

.loopBottomMAP:
    LDA.L $7E368A,X                                                      ;82A744;
    AND.W #$E3FF                                                         ;82A748;
    ORA.W #$1400                                                         ;82A74B;
    STA.L $7E368A,X                                                      ;82A74E;
    INX                                                                  ;82A752;
    INX                                                                  ;82A753;
    DEY                                                                  ;82A754;
    DEY                                                                  ;82A755;
    BNE .loopBottomMAP                                                   ;82A756;
    PLP                                                                  ;82A758;
    PHP                                                                  ;82A759;
    REP #$30                                                             ;82A75A;
    LDY.W #$000A                                                         ;82A75C;
    LDX.W #$0000                                                         ;82A75F;

.loopTopSAMUS:
    LDA.L $7E366C,X                                                      ;82A762;
    AND.W #$E3FF                                                         ;82A766;
    ORA.W #$1400                                                         ;82A769;
    STA.L $7E366C,X                                                      ;82A76C;
    INX                                                                  ;82A770;
    INX                                                                  ;82A771;
    DEY                                                                  ;82A772;
    DEY                                                                  ;82A773;
    BNE .loopTopSAMUS                                                    ;82A774;
    PLP                                                                  ;82A776;
    PHP                                                                  ;82A777;
    REP #$30                                                             ;82A778;
    LDY.W #$000A                                                         ;82A77A;
    LDX.W #$0000                                                         ;82A77D;

.loopBottomSAMUS:
    LDA.L $7E36AC,X                                                      ;82A780;
    AND.W #$E3FF                                                         ;82A784;
    ORA.W #$1400                                                         ;82A787;
    STA.L $7E36AC,X                                                      ;82A78A;
    INX                                                                  ;82A78E;
    INX                                                                  ;82A78F;
    DEY                                                                  ;82A790;
    DEY                                                                  ;82A791;
    BNE .loopBottomSAMUS                                                 ;82A792;
    PLP                                                                  ;82A794;
    RTS                                                                  ;82A795;


Set_PauseScreen_ButtonLabelPalettes_MapScreen:
    REP #$30                                                             ;82A796;
    PHP                                                                  ;82A798;
    REP #$30                                                             ;82A799;
    LDY.W #$000A                                                         ;82A79B;
    LDX.W #$0000                                                         ;82A79E;

.loopTopSAMUS:
    LDA.L $7E366C,X                                                      ;82A7A1;
    AND.W #$E3FF                                                         ;82A7A5;
    ORA.W #$0800                                                         ;82A7A8;
    STA.L $7E366C,X                                                      ;82A7AB;
    INX                                                                  ;82A7AF;
    INX                                                                  ;82A7B0;
    DEY                                                                  ;82A7B1;
    DEY                                                                  ;82A7B2;
    BNE .loopTopSAMUS                                                    ;82A7B3;
    PLP                                                                  ;82A7B5;
    PHP                                                                  ;82A7B6;
    REP #$30                                                             ;82A7B7;
    LDY.W #$000A                                                         ;82A7B9;
    LDX.W #$0000                                                         ;82A7BC;

.loopBottomSAMUS:
    LDA.L $7E36AC,X                                                      ;82A7BF;
    AND.W #$E3FF                                                         ;82A7C3;
    ORA.W #$0800                                                         ;82A7C6;
    STA.L $7E36AC,X                                                      ;82A7C9;
    INX                                                                  ;82A7CD;
    INX                                                                  ;82A7CE;
    DEY                                                                  ;82A7CF;
    DEY                                                                  ;82A7D0;
    BNE .loopBottomSAMUS                                                 ;82A7D1;
    PLP                                                                  ;82A7D3;
    PHP                                                                  ;82A7D4;
    REP #$30                                                             ;82A7D5;
    LDY.W #$0008                                                         ;82A7D7;
    LDX.W #$0000                                                         ;82A7DA;

.loopTopEXIT:
    LDA.L $7E3658,X                                                      ;82A7DD;
    AND.W #$E3FF                                                         ;82A7E1;
    ORA.W #$0800                                                         ;82A7E4;
    STA.L $7E3658,X                                                      ;82A7E7;
    INX                                                                  ;82A7EB;
    INX                                                                  ;82A7EC;
    DEY                                                                  ;82A7ED;
    DEY                                                                  ;82A7EE;
    BNE .loopTopEXIT                                                     ;82A7EF;
    PLP                                                                  ;82A7F1;
    PHP                                                                  ;82A7F2;
    REP #$30                                                             ;82A7F3;
    LDY.W #$0008                                                         ;82A7F5;
    LDX.W #$0000                                                         ;82A7F8;

.loopBottomEXIT:
    LDA.L $7E3698,X                                                      ;82A7FB;
    AND.W #$E3FF                                                         ;82A7FF;
    ORA.W #$0800                                                         ;82A802;
    STA.L $7E3698,X                                                      ;82A805;
    INX                                                                  ;82A809;
    INX                                                                  ;82A80A;
    DEY                                                                  ;82A80B;
    DEY                                                                  ;82A80C;
    BNE .loopBottomEXIT                                                  ;82A80D;
    PLP                                                                  ;82A80F;
    PHP                                                                  ;82A810;
    REP #$30                                                             ;82A811;
    LDY.W #$000A                                                         ;82A813;
    LDX.W #$0000                                                         ;82A816;

.loopTopMAP:
    LDA.L $7E364A,X                                                      ;82A819;
    AND.W #$E3FF                                                         ;82A81D;
    ORA.W #$1400                                                         ;82A820;
    STA.L $7E364A,X                                                      ;82A823;
    INX                                                                  ;82A827;
    INX                                                                  ;82A828;
    DEY                                                                  ;82A829;
    DEY                                                                  ;82A82A;
    BNE .loopTopMAP                                                      ;82A82B;
    PLP                                                                  ;82A82D;
    PHP                                                                  ;82A82E;
    REP #$30                                                             ;82A82F;
    LDY.W #$000A                                                         ;82A831;
    LDX.W #$0000                                                         ;82A834;

.loopBottomMAP:
    LDA.L $7E368A,X                                                      ;82A837;
    AND.W #$E3FF                                                         ;82A83B;
    ORA.W #$1400                                                         ;82A83E;
    STA.L $7E368A,X                                                      ;82A841;
    INX                                                                  ;82A845;
    INX                                                                  ;82A846;
    DEY                                                                  ;82A847;
    DEY                                                                  ;82A848;
    BNE .loopBottomMAP                                                   ;82A849;
    PLP                                                                  ;82A84B;
    RTS                                                                  ;82A84C;


Update_PauseMenu_L_R_Start_VRAMTilemap:
    PHP                                                                  ;82A84D;
    REP #$30                                                             ;82A84E;
    LDX.W $0330                                                          ;82A850;
    LDA.W #$0080                                                         ;82A853;
    STA.B $D0,X                                                          ;82A856;
    INX                                                                  ;82A858;
    INX                                                                  ;82A859;
    LDA.W #$3640                                                         ;82A85A;
    STA.B $D0,X                                                          ;82A85D;
    INX                                                                  ;82A85F;
    INX                                                                  ;82A860;
    SEP #$20                                                             ;82A861;
    LDA.B #$7E                                                           ;82A863;
    STA.B $D0,X                                                          ;82A865;
    REP #$20                                                             ;82A867;
    INX                                                                  ;82A869;
    LDA.B $59                                                            ;82A86A;
    AND.W #$00FC                                                         ;82A86C;
    XBA                                                                  ;82A86F;
    CLC                                                                  ;82A870;
    ADC.W #$0320                                                         ;82A871;
    STA.B $D0,X                                                          ;82A874;
    INX                                                                  ;82A876;
    INX                                                                  ;82A877;
    STX.W $0330                                                          ;82A878;
    PLP                                                                  ;82A87B;
    RTS                                                                  ;82A87C;


UNUSED_Draw_PauseScreen_SpriteAnimation_long:
    JSR.W Draw_PauseScreen_SpriteAnimation                               ;82A87D;
    RTL                                                                  ;82A880;


Draw_PauseScreen_SpriteAnimation:
    PHP                                                                  ;82A881;
    PHX                                                                  ;82A882;
    REP #$30                                                             ;82A883;
    STX.B $12                                                            ;82A885;
    STY.B $14                                                            ;82A887;
    DEC A                                                                ;82A889;
    ASL A                                                                ;82A88A;
    TAX                                                                  ;82A88B;
    LDA.W PauseScreen_SpriteAnimationData_timer,X                        ;82A88C;
    TAY                                                                  ;82A88F;
    LDA.W $0000,Y                                                        ;82A890;
    DEC A                                                                ;82A893;
    STA.W $0000,Y                                                        ;82A894;
    BEQ +                                                                ;82A897;
    BPL .nonZero                                                         ;82A899;

  + STY.B $18                                                            ;82A89B;
    LDA.W PauseScreen_SpriteAnimationData_frame,X                        ;82A89D;
    TAY                                                                  ;82A8A0;
    LDA.W $0000,Y                                                        ;82A8A1;
    INC A                                                                ;82A8A4;
    STA.W $0000,Y                                                        ;82A8A5;
    ASL A                                                                ;82A8A8;
    CLC                                                                  ;82A8A9;
    ADC.W $0000,Y                                                        ;82A8AA;
    STA.B $16                                                            ;82A8AD;
    LDA.W PauseScreen_SpriteAnimationData_data,X                         ;82A8AF;
    CLC                                                                  ;82A8B2;
    ADC.B $16                                                            ;82A8B3;
    TAY                                                                  ;82A8B5;
    LDA.W $0000,Y                                                        ;82A8B6;
    AND.W #$00FF                                                         ;82A8B9;
    CMP.W #$00FF                                                         ;82A8BC;
    BNE +                                                                ;82A8BF;
    LDA.W PauseScreen_SpriteAnimationData_frame,X                        ;82A8C1;
    TAY                                                                  ;82A8C4;
    LDA.W #$0000                                                         ;82A8C5;
    STA.W $0000,Y                                                        ;82A8C8;
    LDA.W PauseScreen_SpriteAnimationData_data,X                         ;82A8CB;
    TAY                                                                  ;82A8CE;
    LDA.W $0000,Y                                                        ;82A8CF;
    AND.W #$00FF                                                         ;82A8D2;

  + LDY.B $18                                                            ;82A8D5;
    STA.W $0000,Y                                                        ;82A8D7;

.nonZero:
    LDA.W PauseScreen_SpriteAnimationData_frame,X                        ;82A8DA;
    TAY                                                                  ;82A8DD;
    LDA.W $0000,Y                                                        ;82A8DE;
    ASL A                                                                ;82A8E1;
    CLC                                                                  ;82A8E2;
    ADC.W $0000,Y                                                        ;82A8E3;
    STA.B $18                                                            ;82A8E6;
    LDA.W PauseScreen_SpriteAnimationData_data,X                         ;82A8E8;
    CLC                                                                  ;82A8EB;
    ADC.B $18                                                            ;82A8EC;
    INC A                                                                ;82A8EE;
    TAY                                                                  ;82A8EF;
    PHY                                                                  ;82A8F0;
    LDA.W #$0003                                                         ;82A8F1;
    ASL A                                                                ;82A8F4;
    TAY                                                                  ;82A8F5;
    LDA.W SpritePalette_IndexValues,Y                                    ;82A8F6;
    STA.B $03                                                            ;82A8F9;
    PLY                                                                  ;82A8FB;
    INY                                                                  ;82A8FC;
    LDA.W $0000,Y                                                        ;82A8FD;
    AND.W #$00FF                                                         ;82A900;
    STA.B $18                                                            ;82A903;
    LDA.W PauseScreen_SpriteAnimationData_mode,X                         ;82A905;
    TAY                                                                  ;82A908;
    LDA.W $0000,Y                                                        ;82A909;
    AND.W #$00FF                                                         ;82A90C;
    ASL A                                                                ;82A90F;
    STA.B $1A                                                            ;82A910;
    LDA.W AnimationSpritemapBaseIDPointers,X                             ;82A912;
    CLC                                                                  ;82A915;
    ADC.B $1A                                                            ;82A916;
    TAY                                                                  ;82A918;
    LDA.W $0000,Y                                                        ;82A919;
    CLC                                                                  ;82A91C;
    ADC.B $18                                                            ;82A91D;
    LDX.B $12                                                            ;82A91F;
    LDY.B $14                                                            ;82A921;
    DEY                                                                  ;82A923;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82A924;
    PLX                                                                  ;82A928;
    PLP                                                                  ;82A929;
    RTS                                                                  ;82A92A;


Handle_PauseScreen_PaletteAnimation:
    PHP                                                                  ;82A92B;
    SEP #$20                                                             ;82A92C;
    LDA.B #$00                                                           ;82A92E;
    XBA                                                                  ;82A930;
    LDA.B #$00                                                           ;82A931;
    LDA.W $073B                                                          ;82A933;
    BEQ .return                                                          ;82A936;
    DEC A                                                                ;82A938;
    STA.W $073B                                                          ;82A939;
    BNE .return                                                          ;82A93C;
    LDA.W $074F                                                          ;82A93E;
    INC A                                                                ;82A941;

.loop:
    STA.W $074F                                                          ;82A942;
    ASL A                                                                ;82A945;
    CLC                                                                  ;82A946;
    ADC.W $074F                                                          ;82A947;
    TAX                                                                  ;82A94A;
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays,X ;82A94B;
    CMP.B #$FF                                                           ;82A94E;
    BNE +                                                                ;82A950;
    REP #$30                                                             ;82A952;
    LDA.W #$002A                                                         ;82A954;
    JSL.L QueueSound_Lib3_Max6                                           ;82A957;
    SEP #$20                                                             ;82A95B;
    LDA.B #$00                                                           ;82A95D;
    XBA                                                                  ;82A95F;
    LDA.B #$00                                                           ;82A960;
    BRA .loop                                                            ;82A962;


  + STA.W $073B                                                          ;82A964;
    LDA.W $074F                                                          ;82A967;
    REP #$30                                                             ;82A96A;
    XBA                                                                  ;82A96C;
    LSR A                                                                ;82A96D;
    LSR A                                                                ;82A96E;
    LSR A                                                                ;82A96F;
    CLC                                                                  ;82A970;
    ADC.W #$001E                                                         ;82A971;
    TAY                                                                  ;82A974;
    LDX.W #$001E                                                         ;82A975;

.loopAnimationTimer:
    LDA.W .paletteData,Y                                                 ;82A978;
    STA.L $7EC160,X                                                      ;82A97B;
    DEY                                                                  ;82A97F;
    DEY                                                                  ;82A980;
    DEX                                                                  ;82A981;
    DEX                                                                  ;82A982;
    BPL .loopAnimationTimer                                              ;82A983;

.return:
    PLP                                                                  ;82A985;
    RTS                                                                  ;82A986;


.paletteData:
    dw $0000,$7E7F,$015F,$7C14,$7FFF,$4E73,$0000,$318C,$0070,$2870,$318C,$0000,$0000,$318C,$0000,$318C
    dw $0000,$6E1C,$011B,$7412,$739C,$5294,$00A6,$294D,$004E,$3092,$294B,$00A6,$1084,$294A,$0000,$298E
    dw $0000,$61BA,$00F9,$6810,$6B5A,$56B5,$012A,$2530,$004C,$34B4,$294B,$012A,$18C6,$2108,$0000,$25B0
    dw $0000,$5577,$00B6,$580C,$6318,$5AD6,$018E,$2111,$004B,$3CF5,$252B,$018E,$294A,$1CE7,$0000,$21B1
    dw $0000,$5156,$0093,$500A,$6318,$6318,$0212,$1CF2,$0028,$3CF6,$210B,$0212,$39CE,$14A5,$0000,$1DD3
    dw $0000,$44F4,$0012,$4407,$5AD6,$6739,$0296,$18D5,$0004,$4518,$18CB,$0296,$4A52,$0C63,$0000,$15D6
    dw $0000,$3CD2,$0070,$3805,$5294,$739C,$02FA,$0C7A,$0002,$495A,$0C6F,$02FA,$6318,$0421,$0000,$0DFA
    dw $0000,$200D,$000A,$2C02,$4E73,$7FFF,$039F,$001F,$0000,$559D,$001D,$039F,$7FFF,$0000,$0000,$023F
    dw $0000,$3CD2,$0070,$3805,$5294,$739C,$02FA,$0C7A,$0002,$495A,$0C6F,$02FA,$6318,$0421,$0000,$0DFA
    dw $0000,$44F4,$0012,$4407,$5AD6,$6739,$0296,$18D5,$0004,$4518,$18CB,$0296,$4A52,$0C63,$0000,$15D6
    dw $0000,$5156,$0093,$500A,$6318,$6318,$0212,$1CF2,$0028,$3CF6,$210B,$0212,$39CE,$14A5,$0000,$1DD3
    dw $0000,$5577,$00B6,$580C,$6318,$5AD6,$018E,$2111,$004B,$3CF5,$252B,$018E,$294A,$1CE7,$0000,$21B1
    dw $0000,$61BA,$00F9,$6810,$6B5A,$56B5,$012A,$2530,$004C,$34B4,$294B,$012A,$18C6,$2108,$0000,$25B0
    dw $0000,$6E1C,$011B,$7412,$739C,$5294,$00A6,$294D,$004E,$3092,$294B,$00A6,$1084,$294A,$0000,$298E

EquipmentScreen_SetupReserveMode_and_DetermineInitialSelect:
    PHP                                                                  ;82AB47;
    REP #$30                                                             ;82AB48;
    LDA.B $B1                                                            ;82AB4A;
    STA.B $BD                                                            ;82AB4C;
    LDA.B $B3                                                            ;82AB4E;
    STA.B $BF                                                            ;82AB50;
    STZ.B $B1                                                            ;82AB52;
    STZ.B $B3                                                            ;82AB54;
    LDA.W $09D4                                                          ;82AB56;
    BEQ .noReserves                                                      ;82AB59;
    LDA.W $09C0                                                          ;82AB5B;
    BEQ .noReserves                                                      ;82AB5E;
    LDX.W #EquipmentScreenTilemaps_auto                                  ;82AB60;
    LDY.W #$0082                                                         ;82AB63;
    CMP.W #$0001                                                         ;82AB66;
    BEQ +                                                                ;82AB69;
    LDX.W #EquipmentScreenTilemaps_manual                                ;82AB6B;
    LDY.W #$0082                                                         ;82AB6E;

  + STY.B $02                                                            ;82AB71;
    STX.B $00                                                            ;82AB73;
    LDA.W #$0004                                                         ;82AB75;
    STA.B $12                                                            ;82AB78;
    LDX.W #$0000                                                         ;82AB7A;
    LDY.W #$0000                                                         ;82AB7D;

.loopTilemap:
    LDA.L $7E3A8E,X                                                      ;82AB80;
    AND.W #$FC00                                                         ;82AB84;
    ORA.B [$00],Y                                                        ;82AB87;
    STA.L $7E3A8E,X                                                      ;82AB89;
    INY                                                                  ;82AB8D;
    INY                                                                  ;82AB8E;
    INX                                                                  ;82AB8F;
    INX                                                                  ;82AB90;
    DEC.B $12                                                            ;82AB91;
    BNE .loopTilemap                                                     ;82AB93;

.noReserves:
    STZ.W $0741                                                          ;82AB95;
    LDA.W L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays   ;82AB98;
    AND.W #$00FF                                                         ;82AB9B;
    STA.W $072D                                                          ;82AB9E;
    STZ.W $0743                                                          ;82ABA1;
    LDA.W ReserveTank_AnimationData                                      ;82ABA4;
    AND.W #$00FF                                                         ;82ABA7;
    STA.W $072F                                                          ;82ABAA;
    LDA.W $09D4                                                          ;82ABAD;
    BEQ +                                                                ;82ABB0;
    LDA.W #$0000                                                         ;82ABB2;
    STA.W $0755                                                          ;82ABB5;
    BRA .return                                                          ;82ABB8;


  + LDA.W $0A76                                                          ;82ABBA;
    BNE .noBeams                                                         ;82ABBD;
    LDA.W $09A8                                                          ;82ABBF;
    LDX.W #$0000                                                         ;82ABC2;

.loopBeams:
    BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X                ;82ABC5;
    BNE +                                                                ;82ABC8;
    INX                                                                  ;82ABCA;
    INX                                                                  ;82ABCB;
    CPX.W #$000A                                                         ;82ABCC;
    BMI .loopBeams                                                       ;82ABCF;
    BRA .noBeams                                                         ;82ABD1;


  + TXA                                                                  ;82ABD3;
    LSR A                                                                ;82ABD4;
    XBA                                                                  ;82ABD5;
    ORA.W #$0001                                                         ;82ABD6;
    STA.W $0755                                                          ;82ABD9;
    BRA .return                                                          ;82ABDC;


.noBeams:
    LDA.W $09A4                                                          ;82ABDE;
    LDX.W #$0000                                                         ;82ABE1;

.loopSuitMisc:
    BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X              ;82ABE4;
    BNE +                                                                ;82ABE7;
    INX                                                                  ;82ABE9;
    INX                                                                  ;82ABEA;
    CPX.W #$000C                                                         ;82ABEB;
    BMI .loopSuitMisc                                                    ;82ABEE;
    BRA .noSuitMisc                                                      ;82ABF0;


  + TXA                                                                  ;82ABF2;
    LSR A                                                                ;82ABF3;
    XBA                                                                  ;82ABF4;
    ORA.W #$0002                                                         ;82ABF5;
    STA.W $0755                                                          ;82ABF8;
    BRA .return                                                          ;82ABFB;


.noSuitMisc:
    LDX.W #$0000                                                         ;82ABFD;

.loopNoSuitMisc:
    BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X                  ;82AC00;
    INX                                                                  ;82AC03;
    INX                                                                  ;82AC04;
    CPX.W #$0006                                                         ;82AC05;
    BMI .loopNoSuitMisc                                                  ;82AC08;
    BRA .return                                                          ;82AC0A;

    TXA                                                                  ;82AC0C; dead code
    LSR A                                                                ;82AC0D;
    XBA                                                                  ;82AC0E;
    ORA.W #$0003                                                         ;82AC0F;
    STA.W $0755                                                          ;82AC12;

.return:
    LDA.W $09D6                                                          ;82AC15;
    BEQ +                                                                ;82AC18;
    JSR.W EquipmentScreen_GlowingArrow_Solid_On                          ;82AC1A;
    JSR.W EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM       ;82AC1D;

  + PLP                                                                  ;82AC20;
    RTS                                                                  ;82AC21;


EquipmentScreen_TransferBG1Tilemap:
    PHP                                                                  ;82AC22;
    PHB                                                                  ;82AC23;
    PHK                                                                  ;82AC24;
    PLB                                                                  ;82AC25;
    SEP #$30                                                             ;82AC26;
    LDA.B #$00                                                           ;82AC28;
    STA.W $2116                                                          ;82AC2A;
    LDA.B #$30                                                           ;82AC2D;
    STA.W $2117                                                          ;82AC2F;
    LDA.B #$80                                                           ;82AC32;
    STA.W $2115                                                          ;82AC34;
    JSL.L SetupHDMATransfer                                              ;82AC37;
    db $01,$01,$18                                                       ;82AC3B;
    dl $7E3800                                                           ;82AC3E;
    dw $0800                                                             ;82AC41;
    LDA.B #$02                                                           ;82AC43;
    STA.W $420B                                                          ;82AC45;
    STZ.B $B3                                                            ;82AC48;
    STZ.B $B4                                                            ;82AC4A;
    PLB                                                                  ;82AC4C;
    PLP                                                                  ;82AC4D;
    RTL                                                                  ;82AC4E;


EquipmentScreen_Main:
    PHP                                                                  ;82AC4F;
    REP #$30                                                             ;82AC50;
    LDA.W $0755                                                          ;82AC52;
    AND.W #$00FF                                                         ;82AC55;
    ASL A                                                                ;82AC58;
    TAX                                                                  ;82AC59;
    JSR.W (.pointers,X)                                                  ;82AC5A;
    JSR.W EquipmentScreen_DrawItemSelector                               ;82AC5D;
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell                 ;82AC60;
    JSR.W EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM       ;82AC63;
    PLP                                                                  ;82AC66;
    RTS                                                                  ;82AC67;


.pointers:
    dw EquipmentScreen_Main_Tanks                                        ;82AC68;
    dw EquipmentScreen_Main_Weapons                                      ;82AC6A;
    dw EquipmentScreen_Main_SuitsMisc                                    ;82AC6C;
    dw EquipmentScreen_Main_Boots                                        ;82AC6E;

EquipmentScreen_Main_Tanks:
    PHP                                                                  ;82AC70;
    REP #$30                                                             ;82AC71;
    LDA.W $0755                                                          ;82AC73;
    XBA                                                                  ;82AC76;
    AND.W #$00FF                                                         ;82AC77;
    ASL A                                                                ;82AC7A;
    TAX                                                                  ;82AC7B;
    JSR.W (.pointers,X)                                                  ;82AC7C;
    JSR.W EquipmentScreen_Main_Tanks_DPadResponse                        ;82AC7F;
    JSR.W EquipmentScreen_Main_Tanks_GlowingArrow                        ;82AC82;
    PLP                                                                  ;82AC85;
    RTS                                                                  ;82AC86;


.pointers:
    dw EquipmentScreen_Main_Tanks_Mode                                   ;82AC87;
    dw EquipmentScreen_Main_Tanks_ReserveTank                            ;82AC89;

EquipmentScreen_Main_Tanks_DPadResponse:
    PHP                                                                  ;82AC8B;
    REP #$30                                                             ;82AC8C;
    LDA.W $0755                                                          ;82AC8E;
    STA.B $12                                                            ;82AC91;
    LDA.B $8F                                                            ;82AC93;
    BIT.W #$0100                                                         ;82AC95;
    BEQ .notRight                                                        ;82AC98;
    BIT.W #$0400                                                         ;82AC9A;
    BNE .moveToBoots                                                     ;82AC9D;
    LDX.W #$0000                                                         ;82AC9F;
    JSR.W EquipmentScreen_MoveLowerOnSuitsMisc                           ;82ACA2;
    CMP.W #$FFFF                                                         ;82ACA5;
    BNE .exit                                                            ;82ACA8;

.moveToBoots:
    LDX.W #$0000                                                         ;82ACAA;
    JSR.W EquipmentScreen_MoveLowerOnBoots                               ;82ACAD;

.exit:
    PLP                                                                  ;82ACB0;
    RTS                                                                  ;82ACB1;


.notRight:
    BIT.W #$0800                                                         ;82ACB2;
    BNE .up                                                              ;82ACB5;
    BIT.W #$0400                                                         ;82ACB7;
    BEQ .exit                                                            ;82ACBA;
    LDA.W $0755                                                          ;82ACBC;
    AND.W #$FF00                                                         ;82ACBF;
    CMP.W #$0100                                                         ;82ACC2;
    BEQ .moveToBeams                                                     ;82ACC5;
    LDA.W $09C0                                                          ;82ACC7;
    CMP.W #$0001                                                         ;82ACCA;
    BEQ .moveToBeams                                                     ;82ACCD;
    LDA.W $0755                                                          ;82ACCF;
    CLC                                                                  ;82ACD2;
    ADC.W #$0100                                                         ;82ACD3;
    STA.W $0755                                                          ;82ACD6;
    LDA.W $09D6                                                          ;82ACD9;
    BEQ .moveToBeams                                                     ;82ACDC;
    LDA.W #$0037                                                         ;82ACDE;
    JSL.L QueueSound_Lib1_Max6                                           ;82ACE1;
    BRA .return                                                          ;82ACE5;


.moveToBeams:
    LDX.W #$0000                                                         ;82ACE7;
    JSR.W EquipmentScreen_MoveLowerOnBeams                               ;82ACEA;
    BRA .return                                                          ;82ACED;


.up:
    LDA.W $0755                                                          ;82ACEF;
    AND.W #$FF00                                                         ;82ACF2;
    BEQ .return                                                          ;82ACF5;
    LDA.W #$0037                                                         ;82ACF7;
    JSL.L QueueSound_Lib1_Max6                                           ;82ACFA;
    LDA.W $0755                                                          ;82ACFE;
    SEC                                                                  ;82AD01;
    SBC.W #$0100                                                         ;82AD02;
    STA.W $0755                                                          ;82AD05;

.return:
    PLP                                                                  ;82AD08;
    RTS                                                                  ;82AD09;


EquipmentScreen_Main_Tanks_GlowingArrow:
    PHP                                                                  ;82AD0A;
    REP #$30                                                             ;82AD0B;
    LDA.W $0755                                                          ;82AD0D;
    BIT.W #$00FF                                                         ;82AD10;
    BNE .solidOff                                                        ;82AD13;
    XBA                                                                  ;82AD15;
    AND.W #$00FF                                                         ;82AD16;
    ASL A                                                                ;82AD19;
    TAX                                                                  ;82AD1A;
    JSR.W (.pointers,X)                                                  ;82AD1B;
    PLP                                                                  ;82AD1E;
    RTS                                                                  ;82AD1F;


.solidOff:
    JSR.W EquipmentScreen_GlowingArrow_Solid_Off                         ;82AD20;
    PLP                                                                  ;82AD23;
    RTS                                                                  ;82AD24;


.pointers:
    dw EquipmentScreen_GlowingArrow_Animated                             ;82AD25;
    dw EquipmentScreen_GlowingArrow_Solid_On                             ;82AD27;

EquipmentScreen_GlowingArrow_Animated:
    LDA.W $09C0                                                          ;82AD29;
    CMP.W #$0001                                                         ;82AD2C;
    BNE .disableGlow                                                     ;82AD2F;
    LDA.W $05B5                                                          ;82AD31;
    AND.W #$001F                                                         ;82AD34;
    ASL A                                                                ;82AD37;
    TAX                                                                  ;82AD38;
    LDA.W .palette6,X                                                    ;82AD39;
    STA.L $7EC0CC                                                        ;82AD3C;
    LDA.W .paletteB,X                                                    ;82AD40;
    STA.L $7EC0D6                                                        ;82AD43;
    JSR.W EquipmentScreen_Enable_EnergyArrowGlow                         ;82AD47;
    RTS                                                                  ;82AD4A;


.disableGlow:
    LDA.W #$039E                                                         ;82AD4B;
    STA.L $7EC0D6                                                        ;82AD4E;
    LDA.W #$0156                                                         ;82AD52;
    STA.L $7EC0CC                                                        ;82AD55;
    JSR.W EquipmentScreen_Disable_EnergyArrowGlow                        ;82AD59;
    RTS                                                                  ;82AD5C;


.palette6:
    dw $039E,$077D,$0B5C,$0F5B,$133A,$171A,$1F19,$22F8,$26D7,$2AD6,$2EB6,$3695,$3A94,$3E73,$4253,$4A52
    dw $4A52,$4253,$3E73,$3A94,$3695,$2EB6,$2AD6,$26D7,$22F8,$1F19,$171A,$133A,$0F5B,$0B5C,$077D,$039E

.paletteB:
    dw $0156,$0155,$0554,$0954,$0D53,$0D52,$1152,$1551,$1970,$1D70,$1D6F,$216E,$256E,$296D,$296C,$318C
    dw $318C,$296C,$296D,$256E,$216E,$1D6F,$1D70,$1970,$1551,$1152,$0D52,$0D53,$0954,$0554,$0155,$0156

EquipmentScreen_GlowingArrow_Solid_On:
    LDA.W #$039E                                                         ;82ADDD;
    STA.L $7EC0D6                                                        ;82ADE0;
    LDA.W #$0156                                                         ;82ADE4;
    STA.L $7EC0CC                                                        ;82ADE7;
    JSR.W EquipmentScreen_Enable_EnergyArrowGlow                         ;82ADEB;
    RTS                                                                  ;82ADEE;


EquipmentScreen_GlowingArrow_Solid_Off:
    LDA.W #$039E                                                         ;82ADEF;
    STA.L $7EC0D6                                                        ;82ADF2;
    LDA.W #$0156                                                         ;82ADF6;
    STA.L $7EC0CC                                                        ;82ADF9;
    JSR.W EquipmentScreen_Disable_EnergyArrowGlow                        ;82ADFD;
    RTS                                                                  ;82AE00;


EquipmentScreen_Enable_EnergyArrowGlow:
    PHP                                                                  ;82AE01;
    REP #$30                                                             ;82AE02;
    PHP                                                                  ;82AE04;
    REP #$30                                                             ;82AE05;
    LDY.W #$0010                                                         ;82AE07;
    LDX.W #$0000                                                         ;82AE0A;

.loopVertical:
    LDA.L $7E3902,X                                                      ;82AE0D;
    AND.W #$E3FF                                                         ;82AE11;
    ORA.W #$1800                                                         ;82AE14;
    STA.L $7E3902,X                                                      ;82AE17;
    TXA                                                                  ;82AE1B;
    CLC                                                                  ;82AE1C;
    ADC.W #$0040                                                         ;82AE1D;
    TAX                                                                  ;82AE20;
    DEY                                                                  ;82AE21;
    DEY                                                                  ;82AE22;
    BNE .loopVertical                                                    ;82AE23;
    PLP                                                                  ;82AE25;
    PHP                                                                  ;82AE26;
    REP #$30                                                             ;82AE27;
    LDY.W #$0004                                                         ;82AE29;
    LDX.W #$0000                                                         ;82AE2C;

.loopHorizontal:
    LDA.L $7E3B02,X                                                      ;82AE2F;
    AND.W #$E3FF                                                         ;82AE33;
    ORA.W #$1800                                                         ;82AE36;
    STA.L $7E3B02,X                                                      ;82AE39;
    INX                                                                  ;82AE3D;
    INX                                                                  ;82AE3E;
    DEY                                                                  ;82AE3F;
    DEY                                                                  ;82AE40;
    BNE .loopHorizontal                                                  ;82AE41;
    PLP                                                                  ;82AE43;
    PLP                                                                  ;82AE44;
    RTS                                                                  ;82AE45;


EquipmentScreen_Disable_EnergyArrowGlow:
    PHP                                                                  ;82AE46;
    REP #$30                                                             ;82AE47;
    PHP                                                                  ;82AE49;
    REP #$30                                                             ;82AE4A;
    LDY.W #$0010                                                         ;82AE4C;
    LDX.W #$0000                                                         ;82AE4F;

.loopVertical:
    LDA.L $7E3902,X                                                      ;82AE52;
    AND.W #$E3FF                                                         ;82AE56;
    ORA.W #$1C00                                                         ;82AE59;
    STA.L $7E3902,X                                                      ;82AE5C;
    TXA                                                                  ;82AE60;
    CLC                                                                  ;82AE61;
    ADC.W #$0040                                                         ;82AE62;
    TAX                                                                  ;82AE65;
    DEY                                                                  ;82AE66;
    DEY                                                                  ;82AE67;
    BNE .loopVertical                                                    ;82AE68;
    PLP                                                                  ;82AE6A;
    PHP                                                                  ;82AE6B;
    REP #$30                                                             ;82AE6C;
    LDY.W #$0004                                                         ;82AE6E;
    LDX.W #$0000                                                         ;82AE71;

.loopHorizontal:
    LDA.L $7E3B02,X                                                      ;82AE74;
    AND.W #$E3FF                                                         ;82AE78;
    ORA.W #$1C00                                                         ;82AE7B;
    STA.L $7E3B02,X                                                      ;82AE7E;
    INX                                                                  ;82AE82;
    INX                                                                  ;82AE83;
    DEY                                                                  ;82AE84;
    DEY                                                                  ;82AE85;
    BNE .loopHorizontal                                                  ;82AE86;
    PLP                                                                  ;82AE88;
    PLP                                                                  ;82AE89;
    RTS                                                                  ;82AE8A;


EquipmentScreen_Main_Tanks_Mode:
    PHP                                                                  ;82AE8B;
    REP #$30                                                             ;82AE8C;
    LDA.B $8F                                                            ;82AE8E;
    BIT.W #$0080                                                         ;82AE90;
    BEQ .return                                                          ;82AE93;
    LDA.W $09D4                                                          ;82AE95;
    BEQ .return                                                          ;82AE98;
    LDA.W #$0037                                                         ;82AE9A;
    JSL.L QueueSound_Lib1_Max6                                           ;82AE9D;
    LDA.W $09C0                                                          ;82AEA1;
    CMP.W #$0001                                                         ;82AEA4;
    BNE .manual                                                          ;82AEA7;
    LDA.W #$0002                                                         ;82AEA9;
    STA.W $09C0                                                          ;82AEAC;
    JSR.W EquipmentScreen_ClearHUDReserveAUTOTilemap                     ;82AEAF;
    PHP                                                                  ;82AEB2;
    REP #$30                                                             ;82AEB3;
    LDY.W #$0008                                                         ;82AEB5;
    LDX.W #$0000                                                         ;82AEB8;

.loopAuto:
    LDA.L $7E3A8E,X                                                      ;82AEBB;
    AND.W #$FC00                                                         ;82AEBF;
    ORA.L EquipmentScreenTilemaps_manual,X                               ;82AEC2;
    STA.L $7E3A8E,X                                                      ;82AEC6;
    INX                                                                  ;82AECA;
    INX                                                                  ;82AECB;
    DEY                                                                  ;82AECC;
    DEY                                                                  ;82AECD;
    BNE .loopAuto                                                        ;82AECE;
    PLP                                                                  ;82AED0;
    BRA .return                                                          ;82AED1;


.manual:
    LDA.W #$0001                                                         ;82AED3;
    STA.W $09C0                                                          ;82AED6;
    JSR.W EquipmentScreen_SetHUDReserveAUTOTilemap                       ;82AED9;
    PHP                                                                  ;82AEDC;
    REP #$30                                                             ;82AEDD;
    LDY.W #$0008                                                         ;82AEDF;
    LDX.W #$0000                                                         ;82AEE2;

.loopManual:
    LDA.L $7E3A8E,X                                                      ;82AEE5;
    AND.W #$FC00                                                         ;82AEE9;
    ORA.L EquipmentScreenTilemaps_auto,X                                 ;82AEEC;
    STA.L $7E3A8E,X                                                      ;82AEF0;
    INX                                                                  ;82AEF4;
    INX                                                                  ;82AEF5;
    DEY                                                                  ;82AEF6;
    DEY                                                                  ;82AEF7;
    BNE .loopManual                                                      ;82AEF8;
    PLP                                                                  ;82AEFA;

.return:
    PLP                                                                  ;82AEFB;
    RTS                                                                  ;82AEFC;


EquipmentScreen_SetHUDReserveAUTOTilemap:
    LDY.W #Tilemap_HUD_autoReserve                                       ;82AEFD;
    LDA.W $09D6                                                          ;82AF00;
    BNE +                                                                ;82AF03;
    LDY.W #Tilemap_HUD_emptyAutoReserve                                  ;82AF05;

  + LDA.W $0000,Y                                                        ;82AF08;
    STA.L $7EC618                                                        ;82AF0B;
    LDA.W $0002,Y                                                        ;82AF0F;
    STA.L $7EC61A                                                        ;82AF12;
    LDA.W $0004,Y                                                        ;82AF16;
    STA.L $7EC658                                                        ;82AF19;
    LDA.W $0006,Y                                                        ;82AF1D;
    STA.L $7EC65A                                                        ;82AF20;
    LDA.W $0008,Y                                                        ;82AF24;
    STA.L $7EC698                                                        ;82AF27;
    LDA.W $000A,Y                                                        ;82AF2B;
    STA.L $7EC69A                                                        ;82AF2E;
    RTS                                                                  ;82AF32;


EquipmentScreen_ClearHUDReserveAUTOTilemap:
    LDA.W #$2C0F                                                         ;82AF33;
    STA.L $7EC618                                                        ;82AF36;
    STA.L $7EC61A                                                        ;82AF3A;
    STA.L $7EC658                                                        ;82AF3E;
    STA.L $7EC65A                                                        ;82AF42;
    STA.L $7EC698                                                        ;82AF46;
    STA.L $7EC69A                                                        ;82AF4A;
    RTS                                                                  ;82AF4E;


EquipmentScreen_Main_Tanks_ReserveTank:
    PHP                                                                  ;82AF4F;
    REP #$30                                                             ;82AF50;
    LDA.W $0757                                                          ;82AF52;
    BNE .soundTimer                                                      ;82AF55;
    LDA.B $8F                                                            ;82AF57;
    BIT.W #$0080                                                         ;82AF59;
    BEQ .return                                                          ;82AF5C;
    LDA.W $09D6                                                          ;82AF5E;
    CLC                                                                  ;82AF61;
    ADC.W #$0007                                                         ;82AF62;
    AND.W #$FFF8                                                         ;82AF65;
    STA.W $0757                                                          ;82AF68;

.soundTimer:
    LDA.W $0757                                                          ;82AF6B;
    DEC A                                                                ;82AF6E;
    STA.W $0757                                                          ;82AF6F;
    AND.W #$0007                                                         ;82AF72;
    CMP.W #$0007                                                         ;82AF75;
    BNE .incrementEnergy                                                 ;82AF78;
    LDA.W #$002D                                                         ;82AF7A;
    JSL.L QueueSound_Lib3_Max6                                           ;82AF7D;

.incrementEnergy:
    LDA.W $09C2                                                          ;82AF81;
    CLC                                                                  ;82AF84;
    ADC.W ReserveTank_TransferEnergyPerFrame                             ;82AF85;
    STA.W $09C2                                                          ;82AF88;
    CMP.W $09C4                                                          ;82AF8B;
    BMI .decrementReserve                                                ;82AF8E;
    LDA.W $09C4                                                          ;82AF90;
    STA.W $09C2                                                          ;82AF93;
    BRA .emptyReserve                                                    ;82AF96;


.decrementReserve:
    LDA.W $09D6                                                          ;82AF98;
    SEC                                                                  ;82AF9B;
    SBC.W ReserveTank_TransferEnergyPerFrame                             ;82AF9C;
    STA.W $09D6                                                          ;82AF9F;
    BEQ .emptyReserve                                                    ;82AFA2;
    BPL .return                                                          ;82AFA4;
    LDA.W $09C2                                                          ;82AFA6;
    CLC                                                                  ;82AFA9;
    ADC.W $09D6                                                          ;82AFAA;
    STA.W $09C2                                                          ;82AFAD;

.emptyReserve:
    STZ.W $09D6                                                          ;82AFB0;
    STZ.W $0757                                                          ;82AFB3;
    JSR.W EquipmentScreen_Disable_EnergyArrowGlow                        ;82AFB6;
    STZ.W $0755                                                          ;82AFB9;

.return:
    PLP                                                                  ;82AFBC;
    RTS                                                                  ;82AFBD;


EquipmentScreen_Main_Weapons:
    PHP                                                                  ;82AFBE;
    REP #$30                                                             ;82AFBF;
    JSR.W EquipmentScreen_Main_Weapons_MoveResponse                      ;82AFC1;
    LDA.W $09A6                                                          ;82AFC4;
    STA.B $24                                                            ;82AFC7;
    LDA.W $09A8                                                          ;82AFC9;
    BEQ .return                                                          ;82AFCC;
    LDA.W #$000A                                                         ;82AFCE;
    STA.B $18                                                            ;82AFD1;
    JSR.W EquipmentScreen_Main_ButtonResponse                            ;82AFD3;
    JSR.W EquipmentScreen_Main_Weapons_PlasmaSpazerCheck                 ;82AFD6;

.return:
    PLP                                                                  ;82AFD9;
    RTS                                                                  ;82AFDA;


EquipmentScreen_Main_Weapons_MoveResponse:
    PHP                                                                  ;82AFDB;
    REP #$30                                                             ;82AFDC;
    LDA.W $0755                                                          ;82AFDE;
    STA.B $12                                                            ;82AFE1;
    LDA.B $8F                                                            ;82AFE3;
    BIT.W #$0100                                                         ;82AFE5;
    BEQ .rightEnd                                                        ;82AFE8;
    BIT.W #$0800                                                         ;82AFEA;
    BNE .top                                                             ;82AFED;
    LDX.W #$0004                                                         ;82AFEF;
    JSR.W EquipmentScreen_MoveLowerOnSuitsMisc                           ;82AFF2;
    CMP.W #$0000                                                         ;82AFF5;
    BEQ .return                                                          ;82AFF8;
    LDX.W #$0000                                                         ;82AFFA;
    JSR.W EquipmentScreen_MoveLowerOnBoots                               ;82AFFD;
    BRA .return                                                          ;82B000;


.top:
    LDX.W #$0000                                                         ;82B002;
    JSR.W EquipmentScreen_MoveLowerOnSuitsMisc                           ;82B005;
    BRA .return                                                          ;82B008;


.rightEnd:
    BIT.W #$0400                                                         ;82B00A;
    BNE .down                                                            ;82B00D;
    BIT.W #$0800                                                         ;82B00F;
    BEQ .return                                                          ;82B012;
    LDA.W $0755                                                          ;82B014;
    AND.W #$FF00                                                         ;82B017;
    BEQ .moveToReserve                                                   ;82B01A;
    LDA.W $0755                                                          ;82B01C;
    SEC                                                                  ;82B01F;
    SBC.W #$0100                                                         ;82B020;
    STA.W $0755                                                          ;82B023;
    XBA                                                                  ;82B026;
    AND.W #$00FF                                                         ;82B027;
    ASL A                                                                ;82B02A;
    TAX                                                                  ;82B02B;
    JSR.W EquipmentScreen_MoveHigherOnBeams                              ;82B02C;
    CMP.W #$FFFF                                                         ;82B02F;
    BNE .return                                                          ;82B032;

.moveToReserve:
    LDX.W #$0000                                                         ;82B034;
    JSR.W EquipmentScreen_MoveToReserveTanks                             ;82B037;
    CMP.W #$0000                                                         ;82B03A;
    BNE .return                                                          ;82B03D;
    LDA.B $12                                                            ;82B03F;
    STA.W $0755                                                          ;82B041;
    BRA .return                                                          ;82B044;


.down:
    LDA.W $0A76                                                          ;82B046;
    BNE .return                                                          ;82B049;
    LDA.W $0755                                                          ;82B04B;
    CMP.W #$0401                                                         ;82B04E;
    BEQ .return                                                          ;82B051;
    LDA.W $0755                                                          ;82B053;
    CLC                                                                  ;82B056;
    ADC.W #$0100                                                         ;82B057;
    STA.W $0755                                                          ;82B05A;
    XBA                                                                  ;82B05D;
    AND.W #$00FF                                                         ;82B05E;
    ASL A                                                                ;82B061;
    TAX                                                                  ;82B062;
    JSR.W EquipmentScreen_MoveLowerOnBeams                               ;82B063;

.return:
    PLP                                                                  ;82B066;
    RTS                                                                  ;82B067;


EquipmentScreen_Main_Weapons_PlasmaSpazerCheck:
    PHP                                                                  ;82B068;
    REP #$30                                                             ;82B069;
    LDA.B $24                                                            ;82B06B;
    EOR.W #$FFFF                                                         ;82B06D;
    AND.W $09A6                                                          ;82B070;
    BIT.W #$0004                                                         ;82B073;
    BNE .spazerToggled                                                   ;82B076;
    BIT.W #$0008                                                         ;82B078;
    BEQ .return                                                          ;82B07B;
    LDA.B $24                                                            ;82B07D;
    BIT.W #$0008                                                         ;82B07F;
    BNE .return                                                          ;82B082;
    LDA.W $09A6                                                          ;82B084;
    BIT.W #$0004                                                         ;82B087;
    BEQ .return                                                          ;82B08A;
    AND.W #$FFFB                                                         ;82B08C;
    STA.W $09A6                                                          ;82B08F;
    LDA.W EquipmentScreenData_RAMTilemapOffsets_weapons_spazer           ;82B092;
    STA.B $00                                                            ;82B095;
    BRA .merge                                                           ;82B097;


.spazerToggled:
    LDA.B $24                                                            ;82B099;
    BIT.W #$0004                                                         ;82B09B;
    BNE .return                                                          ;82B09E;
    LDA.W $09A6                                                          ;82B0A0;
    BIT.W #$0008                                                         ;82B0A3;
    BEQ .return                                                          ;82B0A6;
    AND.W #$FFF7                                                         ;82B0A8;
    STA.W $09A6                                                          ;82B0AB;
    LDA.W EquipmentScreenData_RAMTilemapOffsets_weapons_plasma           ;82B0AE;
    STA.B $00                                                            ;82B0B1;

.merge:
    LDA.W #$0C00                                                         ;82B0B3;
    STA.B $12                                                            ;82B0B6;
    LDA.W #$000A                                                         ;82B0B8;
    STA.B $16                                                            ;82B0BB;
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12                            ;82B0BD;

.return:
    PLP                                                                  ;82B0C0;
    RTS                                                                  ;82B0C1;


EquipmentScreen_Main_SuitsMisc:
    PHP                                                                  ;82B0C2;
    REP #$30                                                             ;82B0C3;
    JSR.W EquipmentScreen_SuitsMisc_MoveResponse                         ;82B0C5;
    LDA.W #$0012                                                         ;82B0C8;
    STA.B $18                                                            ;82B0CB;
    JSR.W EquipmentScreen_Main_ButtonResponse                            ;82B0CD;
    PLP                                                                  ;82B0D0;
    RTS                                                                  ;82B0D1;


EquipmentScreen_SuitsMisc_MoveResponse:
    PHP                                                                  ;82B0D2;
    REP #$30                                                             ;82B0D3;
    LDA.W $0755                                                          ;82B0D5;
    STA.B $12                                                            ;82B0D8;
    LDA.B $8F                                                            ;82B0DA;
    BIT.W #$0200                                                         ;82B0DC;
    BEQ .leftEnd                                                         ;82B0DF;
    BIT.W #$0400                                                         ;82B0E1;
    BNE .topOfBeams                                                      ;82B0E4;
    LDX.W #$0000                                                         ;82B0E6;
    JSR.W EquipmentScreen_MoveToReserveTanks                             ;82B0E9;
    CMP.W #$0000                                                         ;82B0EC;
    BNE .return                                                          ;82B0EF;
    LDA.B $12                                                            ;82B0F1;
    STA.W $0755                                                          ;82B0F3;

.topOfBeams:
    LDX.W #$0000                                                         ;82B0F6;
    JSR.W EquipmentScreen_MoveLowerOnBeams                               ;82B0F9;
    BRA .return                                                          ;82B0FC;


.leftEnd:
    BIT.W #$0800                                                         ;82B0FE;
    BNE .up                                                              ;82B101;
    BIT.W #$0400                                                         ;82B103;
    BEQ .return                                                          ;82B106;
    LDA.W $0755                                                          ;82B108;
    AND.W #$FF00                                                         ;82B10B;
    CMP.W #$0500                                                         ;82B10E;
    BEQ .moveToBoots                                                     ;82B111;
    LDA.W $0755                                                          ;82B113;
    CLC                                                                  ;82B116;
    ADC.W #$0100                                                         ;82B117;
    STA.W $0755                                                          ;82B11A;
    XBA                                                                  ;82B11D;
    AND.W #$00FF                                                         ;82B11E;
    ASL A                                                                ;82B121;
    TAX                                                                  ;82B122;
    JSR.W EquipmentScreen_MoveLowerOnSuitsMisc                           ;82B123;
    CMP.W #$FFFF                                                         ;82B126;
    BNE .return                                                          ;82B129;

.moveToBoots:
    LDX.W #$0000                                                         ;82B12B;
    JSR.W EquipmentScreen_MoveLowerOnBoots                               ;82B12E;
    BRA .return                                                          ;82B131;


.up:
    LDA.W $0755                                                          ;82B133;
    AND.W #$FF00                                                         ;82B136;
    BEQ .return                                                          ;82B139;
    LDA.W $0755                                                          ;82B13B;
    SEC                                                                  ;82B13E;
    SBC.W #$0100                                                         ;82B13F;
    STA.W $0755                                                          ;82B142;
    XBA                                                                  ;82B145;
    AND.W #$00FF                                                         ;82B146;
    ASL A                                                                ;82B149;
    TAX                                                                  ;82B14A;
    JSR.W EquipmentScreen_MoveHigherOnSuitsMisc                          ;82B14B;

.return:
    PLP                                                                  ;82B14E;
    RTS                                                                  ;82B14F;


EquipmentScreen_Main_Boots:
    PHP                                                                  ;82B150;
    REP #$30                                                             ;82B151;
    JSR.W EquipmentScreen_Main_Boots_MoveResponse                        ;82B153;
    LDA.W #$0012                                                         ;82B156;
    STA.B $18                                                            ;82B159;
    JSR.W EquipmentScreen_Main_ButtonResponse                            ;82B15B;
    PLP                                                                  ;82B15E;
    RTS                                                                  ;82B15F;


EquipmentScreen_Main_Boots_MoveResponse:
    PHP                                                                  ;82B160;
    REP #$30                                                             ;82B161;
    LDA.W $0755                                                          ;82B163;
    STA.B $12                                                            ;82B166;
    LDA.B $8F                                                            ;82B168;
    BIT.W #$0200                                                         ;82B16A;
    BEQ .leftEnd                                                         ;82B16D;
    BIT.W #$0800                                                         ;82B16F;
    BNE .moveToReserve                                                   ;82B172;
    LDX.W #$0008                                                         ;82B174;
    JSR.W EquipmentScreen_MoveHigherOnBeams                              ;82B177;
    CMP.W #$FFFF                                                         ;82B17A;
    BNE .return                                                          ;82B17D;

.moveToReserve:
    LDX.W #$0000                                                         ;82B17F;
    JSR.W EquipmentScreen_MoveToReserveTanks                             ;82B182;
    CMP.W #$0000                                                         ;82B185;
    BNE .return                                                          ;82B188;
    LDA.B $12                                                            ;82B18A;
    STA.W $0755                                                          ;82B18C;
    BRA .return                                                          ;82B18F;


.leftEnd:
    BIT.W #$0400                                                         ;82B191;
    BNE .down                                                            ;82B194;
    BIT.W #$0800                                                         ;82B196;
    BEQ .return                                                          ;82B199;
    LDA.W $0755                                                          ;82B19B;
    AND.W #$FF00                                                         ;82B19E;
    BEQ .moveToSuitsMisc                                                 ;82B1A1;
    LDA.W $0755                                                          ;82B1A3;
    SEC                                                                  ;82B1A6;
    SBC.W #$0100                                                         ;82B1A7;
    STA.W $0755                                                          ;82B1AA;
    XBA                                                                  ;82B1AD;
    AND.W #$00FF                                                         ;82B1AE;
    ASL A                                                                ;82B1B1;
    TAX                                                                  ;82B1B2;
    JSR.W EquipmentScreen_MoveHigherOnBoots                              ;82B1B3;
    CMP.W #$FFFF                                                         ;82B1B6;
    BNE .return                                                          ;82B1B9;

.moveToSuitsMisc:
    LDX.W #$000A                                                         ;82B1BB;
    JSR.W EquipmentScreen_MoveHigherOnSuitsMisc                          ;82B1BE;
    BRA .return                                                          ;82B1C1;


.down:
    LDA.W $0755                                                          ;82B1C3;
    CMP.W #$0203                                                         ;82B1C6;
    BEQ .return                                                          ;82B1C9;
    LDA.W $0755                                                          ;82B1CB;
    CLC                                                                  ;82B1CE;
    ADC.W #$0100                                                         ;82B1CF;
    STA.W $0755                                                          ;82B1D2;
    XBA                                                                  ;82B1D5;
    AND.W #$00FF                                                         ;82B1D6;
    ASL A                                                                ;82B1D9;
    TAX                                                                  ;82B1DA;
    JSR.W EquipmentScreen_MoveLowerOnBoots                               ;82B1DB;

.return:
    PLP                                                                  ;82B1DE;
    RTS                                                                  ;82B1DF;


EquipmentScreen_WriteSamusWireframeTilemap_and_BG1ToVRAM:
    PHP                                                                  ;82B1E0;
    REP #$30                                                             ;82B1E1;
    JSR.W EquipmentScreen_WriteSamusWireframeTilemap                     ;82B1E3;
    LDX.W $0330                                                          ;82B1E6;
    LDA.W #$0500                                                         ;82B1E9;
    STA.B $D0,X                                                          ;82B1EC;
    INX                                                                  ;82B1EE;
    INX                                                                  ;82B1EF;
    LDA.W #$3900                                                         ;82B1F0;
    STA.B $D0,X                                                          ;82B1F3;
    INX                                                                  ;82B1F5;
    INX                                                                  ;82B1F6;
    SEP #$20                                                             ;82B1F7;
    LDA.B #$7E                                                           ;82B1F9;
    STA.B $D0,X                                                          ;82B1FB;
    REP #$20                                                             ;82B1FD;
    INX                                                                  ;82B1FF;
    LDA.W #$3080                                                         ;82B200;
    STA.B $D0,X                                                          ;82B203;
    INX                                                                  ;82B205;
    INX                                                                  ;82B206;
    STX.W $0330                                                          ;82B207;
    PLP                                                                  ;82B20A;
    RTS                                                                  ;82B20B;


EquipmentScreen_WriteSamusWireframeTilemap:
    PHP                                                                  ;82B20C;
    REP #$30                                                             ;82B20D;
    LDA.W $09A2                                                          ;82B20F;
    AND.W #$0101                                                         ;82B212;
    LDX.W #$0000                                                         ;82B215;

.loopSuit:
    CMP.W .bitmaps,X                                                     ;82B218;
    BEQ +                                                                ;82B21B;
    INX                                                                  ;82B21D;
    INX                                                                  ;82B21E;
    BRA .loopSuit                                                        ;82B21F;


  + LDA.W .addresses,X                                                   ;82B221;
    STA.B $00                                                            ;82B224;
    LDA.W #$0082                                                         ;82B226;
    STA.B $02                                                            ;82B229;
    LDA.W #$0011                                                         ;82B22B;
    STA.B $14                                                            ;82B22E;
    LDY.W #$0000                                                         ;82B230;
    LDX.W #$01D8                                                         ;82B233;

.loopRow:
    PHX                                                                  ;82B236;
    LDA.W #$0008                                                         ;82B237;
    STA.B $12                                                            ;82B23A;

.loop:
    LDA.B [$00],Y                                                        ;82B23C;
    STA.L $7E3800,X                                                      ;82B23E;
    INX                                                                  ;82B242;
    INX                                                                  ;82B243;
    INY                                                                  ;82B244;
    INY                                                                  ;82B245;
    DEC.B $12                                                            ;82B246;
    BNE .loop                                                            ;82B248;
    PLX                                                                  ;82B24A;
    TXA                                                                  ;82B24B;
    CLC                                                                  ;82B24C;
    ADC.W #$0040                                                         ;82B24D;
    TAX                                                                  ;82B250;
    DEC.B $14                                                            ;82B251;
    BNE .loopRow                                                         ;82B253;
    PLP                                                                  ;82B255;
    RTS                                                                  ;82B256;


.bitmaps:
    dw $0000,$0100,$0001,$0101                                           ;82B257;

.addresses:
    dw Samus_Wireframe_Tilemaps_powerSuit                                ;82B25F;
    dw Samus_Wireframe_Tilemaps_hiJumpBoots                              ;82B261;
    dw Samus_Wireframe_Tilemaps_variaSuit                                ;82B263;
    dw Samus_Wireframe_Tilemaps_hiJumpBootsVariaSuit                     ;82B265;

EquipmentScreen_DrawItemSelector:
    PHP                                                                  ;82B267;
    REP #$30                                                             ;82B268;
    LDA.W $09A8                                                          ;82B26A;
    ORA.W $09A4                                                          ;82B26D;
    ORA.W $09D4                                                          ;82B270;
    BEQ .return                                                          ;82B273;
    LDA.W $0755                                                          ;82B275;
    AND.W #$00FF                                                         ;82B278;
    ASL A                                                                ;82B27B;
    TAX                                                                  ;82B27C;
    LDA.W EquipmentScreen_ItemSelectorPositions_pointers,X               ;82B27D;
    STA.B $12                                                            ;82B280;
    LDA.W $0755                                                          ;82B282;
    XBA                                                                  ;82B285;
    AND.W #$00FF                                                         ;82B286;
    ASL A                                                                ;82B289;
    ASL A                                                                ;82B28A;
    CLC                                                                  ;82B28B;
    ADC.B $12                                                            ;82B28C;
    TAY                                                                  ;82B28E;
    LDA.W $0000,Y                                                        ;82B28F;
    TAX                                                                  ;82B292;
    DEX                                                                  ;82B293;
    INY                                                                  ;82B294;
    INY                                                                  ;82B295;
    LDA.W $0000,Y                                                        ;82B296;
    TAY                                                                  ;82B299;
    LDA.W #$0003                                                         ;82B29A;
    JSR.W Draw_PauseScreen_SpriteAnimation                               ;82B29D;

.return:
    PLP                                                                  ;82B2A0;
    RTS                                                                  ;82B2A1;


EquipmentScreen_DisplayReserveTankAmount_shell:
    PHP                                                                  ;82B2A2;
    REP #$30                                                             ;82B2A3;
    JSR.W EquipmentScreen_DisplayReserveTankAmount                       ;82B2A5;
    PLP                                                                  ;82B2A8;
    RTS                                                                  ;82B2A9;


EquipmentScreen_DisplayReserveTankAmount:
    PHP                                                                  ;82B2AA;
    REP #$30                                                             ;82B2AB;
    STZ.B $03                                                            ;82B2AD;
    JSR.W EquipmentScreen_Main_DisplayReserves_PaletteSetup              ;82B2AF;
    STZ.B $34                                                            ;82B2B2;
    LDA.W $09D4                                                          ;82B2B4;
    BNE +                                                                ;82B2B7;
    PLP                                                                  ;82B2B9;
    RTS                                                                  ;82B2BA;


  + STA.W $4204                                                          ;82B2BB;
    SEP #$20                                                             ;82B2BE;
    LDA.B #$64                                                           ;82B2C0;
    STA.W $4206                                                          ;82B2C2;
    REP #$20                                                             ;82B2C5;
    NOP                                                                  ;82B2C7;
    NOP                                                                  ;82B2C8;
    NOP                                                                  ;82B2C9;
    NOP                                                                  ;82B2CA;
    NOP                                                                  ;82B2CB;
    NOP                                                                  ;82B2CC;
    NOP                                                                  ;82B2CD;
    LDA.W $4214                                                          ;82B2CE;
    STA.B $2C                                                            ;82B2D1;
    LDA.W $09D6                                                          ;82B2D3;
    STA.W $4204                                                          ;82B2D6;
    SEP #$20                                                             ;82B2D9;
    LDA.B #$64                                                           ;82B2DB;
    STA.W $4206                                                          ;82B2DD;
    REP #$20                                                             ;82B2E0;
    NOP                                                                  ;82B2E2;
    NOP                                                                  ;82B2E3;
    NOP                                                                  ;82B2E4;
    NOP                                                                  ;82B2E5;
    NOP                                                                  ;82B2E6;
    NOP                                                                  ;82B2E7;
    NOP                                                                  ;82B2E8;
    LDA.W HW_RDMPY                                                       ;82B2E9;
    STA.B $32                                                            ;82B2EC;
    LDA.W $4214                                                          ;82B2EE;
    STA.B $2A                                                            ;82B2F1;
    STA.B $30                                                            ;82B2F3;
    STA.B $2E                                                            ;82B2F5;
    BEQ .empty                                                           ;82B2F7;
    LDY.W #$0000                                                         ;82B2F9;

.loopFullTanks:
    PHY                                                                  ;82B2FC;
    LDA.W EquipmentScreen_ReserveTank_Xpositions,Y                       ;82B2FD;
    TAX                                                                  ;82B300;
    LDY.W EquipmentScreen_ReserveTank_Yposition                          ;82B301;
    DEY                                                                  ;82B304;
    LDA.W #$001B                                                         ;82B305;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B308;
    PLY                                                                  ;82B30C;
    INY                                                                  ;82B30D;
    INY                                                                  ;82B30E;
    DEC.B $2E                                                            ;82B30F;
    BNE .loopFullTanks                                                   ;82B311;
    STY.B $34                                                            ;82B313;

.empty:
    LDA.W HW_RDMPY                                                       ;82B315;
    BEQ .loopEmptyTanks                                                  ;82B318;
    STA.W $4204                                                          ;82B31A;
    SEP #$20                                                             ;82B31D;
    LDA.B #$0E                                                           ;82B31F;
    STA.W $4206                                                          ;82B321;
    REP #$20                                                             ;82B324;
    NOP                                                                  ;82B326;
    NOP                                                                  ;82B327;
    NOP                                                                  ;82B328;
    NOP                                                                  ;82B329;
    NOP                                                                  ;82B32A;
    NOP                                                                  ;82B32B;
    NOP                                                                  ;82B32C;
    LDA.W $4214                                                          ;82B32D;
    ASL A                                                                ;82B330;
    TAX                                                                  ;82B331;
    CMP.W #$0007                                                         ;82B332;
    BPL +                                                                ;82B335;
    LDA.W HW_RDMPY                                                       ;82B337;
    BEQ +                                                                ;82B33A;
    LDA.W $05B5                                                          ;82B33C;
    BIT.W #$0004                                                         ;82B33F;
    BNE +                                                                ;82B342;
    INX                                                                  ;82B344;
    INX                                                                  ;82B345;

  + LDA.W $09D6                                                          ;82B346;
    CMP.W #$0064                                                         ;82B349;
    BMI +                                                                ;82B34C;
    TXA                                                                  ;82B34E;
    CLC                                                                  ;82B34F;
    ADC.W #$0010                                                         ;82B350;
    TAX                                                                  ;82B353;

  + LDA.W .spritemapIDs,X                                                ;82B354;
    PHA                                                                  ;82B357;
    LDX.B $34                                                            ;82B358;
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X                       ;82B35A;
    TAX                                                                  ;82B35D;
    LDY.W EquipmentScreen_ReserveTank_Yposition                          ;82B35E;
    DEY                                                                  ;82B361;
    PLA                                                                  ;82B362;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B363;
    INC.B $30                                                            ;82B367;
    INC.B $34                                                            ;82B369;
    INC.B $34                                                            ;82B36B;

.loopEmptyTanks:
    LDX.B $34                                                            ;82B36D;
    LDA.B $30                                                            ;82B36F;
    CMP.B $2C                                                            ;82B371;
    BPL +                                                                ;82B373;
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X                       ;82B375;
    TAX                                                                  ;82B378;
    LDY.W EquipmentScreen_ReserveTank_Yposition                          ;82B379;
    DEY                                                                  ;82B37C;
    LDA.W #$0020                                                         ;82B37D;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B380;
    INC.B $34                                                            ;82B384;
    INC.B $34                                                            ;82B386;
    INC.B $30                                                            ;82B388;
    BRA .loopEmptyTanks                                                  ;82B38A;


  + LDX.B $34                                                            ;82B38C;
    LDA.W EquipmentScreen_ReserveTank_Xpositions,X                       ;82B38E;
    TAX                                                                  ;82B391;
    LDY.W EquipmentScreen_ReserveTank_Yposition                          ;82B392;
    DEY                                                                  ;82B395;
    LDA.W #$001F                                                         ;82B396;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B399;
    SEP #$20                                                             ;82B39D;
    LDA.B $32                                                            ;82B39F;
    STA.W $4204                                                          ;82B3A1;
    LDA.B $33                                                            ;82B3A4;
    STA.W $4205                                                          ;82B3A6;
    LDA.B #$0A                                                           ;82B3A9;
    STA.W $4206                                                          ;82B3AB;
    REP #$20                                                             ;82B3AE;
    NOP                                                                  ;82B3B0;
    NOP                                                                  ;82B3B1;
    NOP                                                                  ;82B3B2;
    NOP                                                                  ;82B3B3;
    NOP                                                                  ;82B3B4;
    NOP                                                                  ;82B3B5;
    NOP                                                                  ;82B3B6;
    LDA.W HW_RDMPY                                                       ;82B3B7;
    CLC                                                                  ;82B3BA;
    ADC.W #$0804                                                         ;82B3BB;
    STA.L $7E3B14                                                        ;82B3BE;
    LDA.W $4214                                                          ;82B3C2;
    CLC                                                                  ;82B3C5;
    ADC.W #$0804                                                         ;82B3C6;
    STA.L $7E3B12                                                        ;82B3C9;
    LDA.B $2A                                                            ;82B3CD;
    CLC                                                                  ;82B3CF;
    ADC.W #$0804                                                         ;82B3D0;
    STA.L $7E3B10                                                        ;82B3D3;
    PLP                                                                  ;82B3D7;
    RTS                                                                  ;82B3D8;


.spritemapIDs:
; Partial reserve tank spritemap IDs (for $82:C569 table)
    dw $0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027 ; [Samus reserve health] < 100
    dw $0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027 ; [Samus reserve health] >= 100

EquipmentScreen_Main_DisplayReserves_PaletteSetup:
    PHP                                                                  ;82B3F9;
    REP #$30                                                             ;82B3FA;
    LDA.W #$0600                                                         ;82B3FC;
    STA.B $03                                                            ;82B3FF;
    LDA.W $09D6                                                          ;82B401;
    BEQ .return                                                          ;82B404;
    DEC.W $072F                                                          ;82B406;
    BEQ .incrementAnimationFrame                                         ;82B409;
    BPL .positive                                                        ;82B40B;

.incrementAnimationFrame:
    LDA.W $0743                                                          ;82B40D;
    INC A                                                                ;82B410;
    STA.W $0743                                                          ;82B411;
    ASL A                                                                ;82B414;
    TAX                                                                  ;82B415;
    LDA.W ReserveTank_AnimationData,X                                    ;82B416;
    AND.W #$00FF                                                         ;82B419;
    CMP.W #$00FF                                                         ;82B41C;
    BNE .animationTimer                                                  ;82B41F;
    STZ.W $0743                                                          ;82B421;
    LDA.W ReserveTank_AnimationData                                      ;82B424;
    AND.W #$00FF                                                         ;82B427;

.animationTimer:
    STA.W $072F                                                          ;82B42A;

.positive:
    LDA.W $0743                                                          ;82B42D;
    ASL A                                                                ;82B430;
    INC A                                                                ;82B431;
    TAX                                                                  ;82B432;
    LDA.W #$0003                                                         ;82B433;
    ASL A                                                                ;82B436;
    TAX                                                                  ;82B437;
    LDA.W SpritePalette_IndexValues,X                                    ;82B438;
    STA.B $03                                                            ;82B43B;

.return:
    PLP                                                                  ;82B43D;
    RTS                                                                  ;82B43E;


EquipmentScreen_MoveToReserveTanks:
    PHP                                                                  ;82B43F;
    REP #$30                                                             ;82B440;
    LDA.W $09D4                                                          ;82B442;
    BEQ .return                                                          ;82B445;
    STZ.W $0755                                                          ;82B447;
    LDA.W #$0037                                                         ;82B44A;
    JSL.L QueueSound_Lib1_Max6                                           ;82B44D;
    LDA.W #$0001                                                         ;82B451;

.return:
    PLP                                                                  ;82B454;
    RTS                                                                  ;82B455;


EquipmentScreen_MoveLowerOnBeams:
    PHP                                                                  ;82B456;
    REP #$30                                                             ;82B457;
    LDA.W $0A76                                                          ;82B459;
    BNE .cancel                                                          ;82B45C;

.loop:
    LDA.W $09A8                                                          ;82B45E;
    BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X                ;82B461;
    BNE .found                                                           ;82B464;
    INX                                                                  ;82B466;
    INX                                                                  ;82B467;
    CPX.W #$000A                                                         ;82B468;
    BMI .loop                                                            ;82B46B;

.cancel:
    LDA.B $12                                                            ;82B46D;
    STA.W $0755                                                          ;82B46F;
    BRA .return                                                          ;82B472;


.found:
    TXA                                                                  ;82B474;
    LSR A                                                                ;82B475;
    XBA                                                                  ;82B476;
    AND.W #$FF00                                                         ;82B477;
    ORA.W #$0001                                                         ;82B47A;
    STA.W $0755                                                          ;82B47D;
    LDA.W #$0037                                                         ;82B480;
    JSL.L QueueSound_Lib1_Max6                                           ;82B483;

.return:
    PLP                                                                  ;82B487;
    RTS                                                                  ;82B488;


EquipmentScreen_MoveHigherOnBeams:
    PHP                                                                  ;82B489;
    REP #$30                                                             ;82B48A;
    LDA.W $0A76                                                          ;82B48C;
    BNE .cancel                                                          ;82B48F;

.loop:
    LDA.W $09A8                                                          ;82B491;
    BIT.W EquipmentScreenData_EquipmentBitmasks_weapons,X                ;82B494;
    BNE .found                                                           ;82B497;
    DEX                                                                  ;82B499;
    DEX                                                                  ;82B49A;
    BPL .loop                                                            ;82B49B;

.cancel:
    LDA.W #$FFFF                                                         ;82B49D;
    BRA .return                                                          ;82B4A0;


.found:
    LDA.W #$0037                                                         ;82B4A2;
    JSL.L QueueSound_Lib1_Max6                                           ;82B4A5;
    TXA                                                                  ;82B4A9;
    LSR A                                                                ;82B4AA;
    XBA                                                                  ;82B4AB;
    AND.W #$FF00                                                         ;82B4AC;
    ORA.W #$0001                                                         ;82B4AF;
    STA.W $0755                                                          ;82B4B2;

.return:
    PLP                                                                  ;82B4B5;
    RTS                                                                  ;82B4B6;


EquipmentScreen_MoveLowerOnSuitsMisc:
    PHP                                                                  ;82B4B7;
    REP #$30                                                             ;82B4B8;

.loop:
    LDA.W $09A4                                                          ;82B4BA;
    BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X              ;82B4BD;
    BNE +                                                                ;82B4C0;
    INX                                                                  ;82B4C2;
    INX                                                                  ;82B4C3;
    CPX.W #$000A                                                         ;82B4C4; Bug: $B4C4 should be CPX #$000C. Can't access Screw Attack without Spring Ball or Boots
    BMI .loop                                                            ;82B4C7;
    LDA.W #$FFFF                                                         ;82B4C9;
    BRA .return                                                          ;82B4CC;


  + LDA.W #$0037                                                         ;82B4CE;
    JSL.L QueueSound_Lib1_Max6                                           ;82B4D1;
    TXA                                                                  ;82B4D5;
    LSR A                                                                ;82B4D6;
    XBA                                                                  ;82B4D7;
    AND.W #$FF00                                                         ;82B4D8;
    ORA.W #$0002                                                         ;82B4DB;
    STA.W $0755                                                          ;82B4DE;
    LDA.W #$0000                                                         ;82B4E1;

.return:
    PLP                                                                  ;82B4E4;
    RTS                                                                  ;82B4E5;


EquipmentScreen_MoveHigherOnSuitsMisc:
    PHP                                                                  ;82B4E6;
    REP #$30                                                             ;82B4E7;

.loop:
    LDA.W $09A4                                                          ;82B4E9;
    BIT.W EquipmentScreenData_EquipmentBitmasks_suitsMisc,X              ;82B4EC;
    BNE +                                                                ;82B4EF;
    DEX                                                                  ;82B4F1;
    DEX                                                                  ;82B4F2;
    BPL .loop                                                            ;82B4F3;
    LDA.B $12                                                            ;82B4F5;
    STA.W $0755                                                          ;82B4F7;
    BRA .return                                                          ;82B4FA;


  + LDA.W #$0037                                                         ;82B4FC;
    JSL.L QueueSound_Lib1_Max6                                           ;82B4FF;
    TXA                                                                  ;82B503;
    LSR A                                                                ;82B504;
    XBA                                                                  ;82B505;
    AND.W #$FF00                                                         ;82B506;
    ORA.W #$0002                                                         ;82B509;
    STA.W $0755                                                          ;82B50C;

.return:
    PLP                                                                  ;82B50F;
    RTS                                                                  ;82B510;


EquipmentScreen_MoveLowerOnBoots:
    PHP                                                                  ;82B511;
    REP #$30                                                             ;82B512;

.loop:
    LDA.W $09A4                                                          ;82B514;
    BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X                  ;82B517;
    BNE +                                                                ;82B51A;
    INX                                                                  ;82B51C;
    INX                                                                  ;82B51D;
    CPX.W #$0006                                                         ;82B51E;
    BMI .loop                                                            ;82B521;
    LDA.B $12                                                            ;82B523;
    STA.W $0755                                                          ;82B525;
    BRA .return                                                          ;82B528;


  + LDA.W #$0037                                                         ;82B52A;
    JSL.L QueueSound_Lib1_Max6                                           ;82B52D;
    TXA                                                                  ;82B531;
    LSR A                                                                ;82B532;
    XBA                                                                  ;82B533;
    AND.W #$FF00                                                         ;82B534;
    ORA.W #$0003                                                         ;82B537;
    STA.W $0755                                                          ;82B53A;

.return:
    PLP                                                                  ;82B53D;
    RTS                                                                  ;82B53E;


EquipmentScreen_MoveHigherOnBoots:
    PHP                                                                  ;82B53F;
    REP #$30                                                             ;82B540;

.loop:
    LDA.W $09A4                                                          ;82B542;
    BIT.W EquipmentScreenData_EquipmentBitmasks_boots,X                  ;82B545;
    BNE +                                                                ;82B548;
    DEX                                                                  ;82B54A;
    DEX                                                                  ;82B54B;
    BPL .loop                                                            ;82B54C;
    LDA.W #$FFFF                                                         ;82B54E;
    BRA .return                                                          ;82B551;


  + LDA.W #$0037                                                         ;82B553;
    JSL.L QueueSound_Lib1_Max6                                           ;82B556;
    TXA                                                                  ;82B55A;
    LSR A                                                                ;82B55B;
    XBA                                                                  ;82B55C;
    AND.W #$FF00                                                         ;82B55D;
    ORA.W #$0003                                                         ;82B560;
    STA.W $0755                                                          ;82B563;

.return:
    PLP                                                                  ;82B566;
    RTS                                                                  ;82B567;


EquipmentScreen_Main_ButtonResponse:
    PHP                                                                  ;82B568;
    REP #$30                                                             ;82B569;
    LDA.B $8F                                                            ;82B56B;
    BIT.W #$0080                                                         ;82B56D;
    BNE +                                                                ;82B570;
    PLP                                                                  ;82B572;
    RTS                                                                  ;82B573;


  + LDA.W #$0038                                                         ;82B574;
    JSL.L QueueSound_Lib1_Max6                                           ;82B577;
    LDA.W $0755                                                          ;82B57B;
    AND.W #$00FF                                                         ;82B57E;
    ASL A                                                                ;82B581;
    TAX                                                                  ;82B582;
    STA.B $1A                                                            ;82B583;
    LDA.W $0755                                                          ;82B585;
    XBA                                                                  ;82B588;
    AND.W #$00FF                                                         ;82B589;
    ASL A                                                                ;82B58C;
    STA.B $12                                                            ;82B58D;
    LDA.W EquipmentScreenDataPointers_tilemapOffsets,X                   ;82B58F;
    CLC                                                                  ;82B592;
    ADC.B $12                                                            ;82B593;
    TAY                                                                  ;82B595;
    LDA.W $0000,Y                                                        ;82B596;
    STA.B $00                                                            ;82B599;
    LDA.W EquipmentScreenDataPointers_equipmentBitmasks,X                ;82B59B;
    TAY                                                                  ;82B59E;
    LDA.W EquipmentScreenDataPointers_listsEquipmentBitmasks,X           ;82B59F;
    CLC                                                                  ;82B5A2;
    ADC.B $12                                                            ;82B5A3;
    TAX                                                                  ;82B5A5;
    LDA.W $0000,Y                                                        ;82B5A6;
    BIT.W $0000,X                                                        ;82B5A9;
    BNE +                                                                ;82B5AC;
    ORA.W $0000,X                                                        ;82B5AE;
    STA.W $0000,Y                                                        ;82B5B1;
    LDA.B $18                                                            ;82B5B4;
    STA.B $16                                                            ;82B5B6;
    LDX.B $1A                                                            ;82B5B8;
    LDA.W EquipmentScreenDataPointers_listsPointsToEquipmentTilemaps,X   ;82B5BA;
    CLC                                                                  ;82B5BD;
    ADC.B $12                                                            ;82B5BE;
    TAY                                                                  ;82B5C0;
    LDA.W $0000,Y                                                        ;82B5C1;
    TAX                                                                  ;82B5C4;
    JSR.W Copy_Bytes_from_X_to_7ERAM                                     ;82B5C5;
    BRA .return                                                          ;82B5C8;


  + LDA.W $0000,X                                                        ;82B5CA;
    EOR.W #$FFFF                                                         ;82B5CD;
    STA.B $12                                                            ;82B5D0;
    LDA.W $0000,Y                                                        ;82B5D2;
    AND.B $12                                                            ;82B5D5;
    STA.W $0000,Y                                                        ;82B5D7;
    LDA.W #$0C00                                                         ;82B5DA;
    STA.B $12                                                            ;82B5DD;
    LDA.B $18                                                            ;82B5DF;
    STA.B $16                                                            ;82B5E1;
    JSR.W Copy_Bytes_of_Palette_from_7E_to_12                            ;82B5E3;

.return:
    PLP                                                                  ;82B5E6;
    RTS                                                                  ;82B5E7;


UNUSED_ConvertAToThreeDecimalDigits:
    PHP                                                                  ;82B5E8;
    REP #$30                                                             ;82B5E9;
    STA.B $18                                                            ;82B5EB;
    STZ.B $12                                                            ;82B5ED;
    STZ.B $14                                                            ;82B5EF;
    STZ.B $16                                                            ;82B5F1;

  - LDA.B $18                                                            ;82B5F3;
    SEC                                                                  ;82B5F5;
    SBC.W #$0064                                                         ;82B5F6;
    STA.B $18                                                            ;82B5F9;
    BMI +                                                                ;82B5FB;
    INC.B $16                                                            ;82B5FD;
    BRA -                                                                ;82B5FF;


  + CLC                                                                  ;82B601;
    ADC.W #$0064                                                         ;82B602;
    STA.B $18                                                            ;82B605;

  - LDA.B $18                                                            ;82B607;
    SEC                                                                  ;82B609;
    SBC.W #$000A                                                         ;82B60A;
    STA.B $18                                                            ;82B60D;
    BMI +                                                                ;82B60F;
    INC.B $14                                                            ;82B611;
    BRA -                                                                ;82B613;


  + CLC                                                                  ;82B615;
    ADC.W #$000A                                                         ;82B616;
    STA.B $18                                                            ;82B619;

  - LDA.B $18                                                            ;82B61B;
    SEC                                                                  ;82B61D;
    SBC.W #$0001                                                         ;82B61E;
    STA.B $18                                                            ;82B621;
    BMI .return                                                          ;82B623;
    INC.B $12                                                            ;82B625;
    BRA -                                                                ;82B627;


.return:
    PLP                                                                  ;82B629;
    RTS                                                                  ;82B62A;


Draw_PauseMenu_during_FadeIn:
    PHP                                                                  ;82B62B;
    PHB                                                                  ;82B62C;
    PHK                                                                  ;82B62D;
    PLB                                                                  ;82B62E;
    REP #$30                                                             ;82B62F;
    LDA.W $0753                                                          ;82B631;
    LDA.W $0727                                                          ;82B634;
    BEQ .mapScreen                                                       ;82B637;
    JSR.W EquipmentScreen_DrawItemSelector                               ;82B639;
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell                 ;82B63C;
    PLB                                                                  ;82B63F;
    PLP                                                                  ;82B640;
    RTL                                                                  ;82B641;


.mapScreen:
    JSR.W MapScreen_DrawSamusPositionIndicator                           ;82B642;
    JSL.L Draw_Map_Icons                                                 ;82B645;
    JSL.L Display_Map_Elevator_Destinations                              ;82B649;
    PLB                                                                  ;82B64D;
    PLP                                                                  ;82B64E;
    RTL                                                                  ;82B64F;


UNUSED_82B650:
    PHP                                                                  ;82B650;
    PHB                                                                  ;82B651;
    PHK                                                                  ;82B652;
    PLB                                                                  ;82B653;
    REP #$30                                                             ;82B654;
    LDA.W $0753                                                          ;82B656;
    BNE +                                                                ;82B659;
    JSR.W EquipmentScreen_DrawItemSelector                               ;82B65B;
    JSR.W EquipmentScreen_DisplayReserveTankAmount_shell                 ;82B65E;
    PLB                                                                  ;82B661;
    PLP                                                                  ;82B662;
    RTL                                                                  ;82B663;


  + JSL.L Display_Map_Elevator_Destinations                              ;82B664;
    JSR.W MapScreen_DrawSamusPositionIndicator                           ;82B668;
    JSL.L Draw_Map_Icons                                                 ;82B66B;
    PLB                                                                  ;82B66F;
    PLP                                                                  ;82B670;
    RTL                                                                  ;82B671;


Draw_Map_Icons:
    PHB                                                                  ;82B672;
    REP #$30                                                             ;82B673;
    PHK                                                                  ;82B675;
    PLB                                                                  ;82B676;
    LDX.W #MapIcon_PositionTablePointers_bossIcons                       ;82B677;
    LDA.W #$0009                                                         ;82B67A;
    JSR.W Display_Map_Boss_Icons                                         ;82B67D;
    LDA.W #$0E00                                                         ;82B680;
    STA.B $03                                                            ;82B683;
    LDX.W #MapIcon_PositionTablePointers_missileStations                 ;82B685;
    LDA.W #$000B                                                         ;82B688;
    JSR.W Draw_Simple_MapIcons                                           ;82B68B;
    LDX.W #MapIcon_PositionTablePointers_energyStations                  ;82B68E;
    LDA.W #$000A                                                         ;82B691;
    JSR.W Draw_Simple_MapIcons                                           ;82B694;
    LDX.W #MapIcon_PositionTablePointers_mapStations                     ;82B697;
    LDA.W #$004E                                                         ;82B69A;
    JSR.W Draw_Simple_MapIcons                                           ;82B69D;
    LDA.W #$0400                                                         ;82B6A0;
    STA.B $03                                                            ;82B6A3;
    LDX.W #MapIcon_PositionTablePointers_savePoints                      ;82B6A5;
    LDA.W #$0008                                                         ;82B6A8;
    JSR.W Draw_SaveStation_MapIcons                                      ;82B6AB;
    LDA.W $05D1                                                          ;82B6AE;
    BEQ +                                                                ;82B6B1;
    LDX.W #MapIcon_PositionTablePointers_debugSavePoints                 ;82B6B3;
    LDA.W #$0008                                                         ;82B6B6;
    JSR.W Draw_Simple_MapIcons                                           ;82B6B9;

  + LDA.W $079F                                                          ;82B6BC;
    BNE .return                                                          ;82B6BF;
    LDA.W #$0E00                                                         ;82B6C1;
    STA.B $03                                                            ;82B6C4;
    LDA.W Crateria_MapIconPositions_savePoints2                          ;82B6C6;
    SEC                                                                  ;82B6C9;
    SBC.B $B3                                                            ;82B6CA;
    TAY                                                                  ;82B6CC;
    LDA.W Crateria_MapIconPositions_savePoints                           ;82B6CD;
    SEC                                                                  ;82B6D0;
    SBC.B $B1                                                            ;82B6D1;
    TAX                                                                  ;82B6D3;
    LDA.W #$0063                                                         ;82B6D4;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B6D7;

.return:
    PLB                                                                  ;82B6DB;
    RTL                                                                  ;82B6DC;


Draw_FileSelectMap_Icons:
    PHB                                                                  ;82B6DD;
    REP #$30                                                             ;82B6DE;
    PHK                                                                  ;82B6E0;
    PLB                                                                  ;82B6E1;
    JSR.W Handle_PauseScreen_PaletteAnimation                            ;82B6E2;
    LDX.W #MapIcon_PositionTablePointers_bossIcons                       ;82B6E5;
    LDA.W #$0009                                                         ;82B6E8;
    JSR.W Display_Map_Boss_Icons                                         ;82B6EB;
    LDA.W #$0E00                                                         ;82B6EE;
    STA.B $03                                                            ;82B6F1;
    LDX.W #MapIcon_PositionTablePointers_missileStations                 ;82B6F3;
    LDA.W #$000B                                                         ;82B6F6;
    JSR.W Draw_Simple_MapIcons                                           ;82B6F9;
    LDX.W #MapIcon_PositionTablePointers_energyStations                  ;82B6FC;
    LDA.W #$000A                                                         ;82B6FF;
    JSR.W Draw_Simple_MapIcons                                           ;82B702;
    LDX.W #MapIcon_PositionTablePointers_mapStations                     ;82B705;
    LDA.W #$004E                                                         ;82B708;
    JSR.W Draw_Simple_MapIcons                                           ;82B70B;
    LDA.W #$0E00                                                         ;82B70E;
    STA.B $03                                                            ;82B711;
    JSR.W Update_Samus_Position_Indicator_Animation                      ;82B713;
    PHA                                                                  ;82B716;
    LDA.W #$0082                                                         ;82B717;
    STA.B $02                                                            ;82B71A;
    LDA.W $079F                                                          ;82B71C;
    ASL A                                                                ;82B71F;
    TAX                                                                  ;82B720;
    LDA.W MapIcon_PositionTablePointers_savePoints,X                     ;82B721;
    STA.B $00                                                            ;82B724;
    LDA.W $078B                                                          ;82B726;
    ASL A                                                                ;82B729;
    ASL A                                                                ;82B72A;
    TAY                                                                  ;82B72B;
    LDA.B [$00],Y                                                        ;82B72C;
    SEC                                                                  ;82B72E;
    SBC.B $B1                                                            ;82B72F;
    TAX                                                                  ;82B731;
    PHX                                                                  ;82B732;
    INY                                                                  ;82B733;
    INY                                                                  ;82B734;
    LDA.B [$00],Y                                                        ;82B735;
    SEC                                                                  ;82B737;
    SBC.B $B3                                                            ;82B738;
    TAY                                                                  ;82B73A;
    PHY                                                                  ;82B73B;
    LDA.W $077A                                                          ;82B73C;
    BIT.W #$0001                                                         ;82B73F;
    BNE +                                                                ;82B742;
    LDA.W #$0012                                                         ;82B744;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B747;

  + PLY                                                                  ;82B74B;
    PLX                                                                  ;82B74C;
    PLA                                                                  ;82B74D;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B74E;
    LDA.W $05D1                                                          ;82B752;
    BEQ +                                                                ;82B755;
    LDA.W #$0600                                                         ;82B757;
    STA.B $03                                                            ;82B75A;
    LDX.W #MapIcon_PositionTablePointers_savePoints                      ;82B75C;
    LDA.W #$000C                                                         ;82B75F;
    JSR.W Draw_Debug_Save_MapIcons                                       ;82B762;
    LDX.W #MapIcon_PositionTablePointers_debugElevatorMarkers            ;82B765;
    LDA.W #$0017                                                         ;82B768;
    JSR.W Draw_Debug_Elevator_Map_Icons                                  ;82B76B;
    LDX.W #MapIcon_PositionTablePointers_debugSavePoints                 ;82B76E;
    LDA.W #$000C                                                         ;82B771;
    JSR.W Draw_Simple_MapIcons                                           ;82B774;

  + LDA.W $079F                                                          ;82B777;
    BNE .return                                                          ;82B77A;
    LDA.W #$0E00                                                         ;82B77C;
    STA.B $03                                                            ;82B77F;
    LDA.W Crateria_MapIconPositions_savePoints2                          ;82B781;
    SEC                                                                  ;82B784;
    SBC.B $B3                                                            ;82B785;
    TAY                                                                  ;82B787;
    LDA.W Crateria_MapIconPositions_savePoints                           ;82B788;
    SEC                                                                  ;82B78B;
    SBC.B $B1                                                            ;82B78C;
    TAX                                                                  ;82B78E;
    LDA.W #$0063                                                         ;82B78F;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B792;

.return:
    PLB                                                                  ;82B796;
    RTL                                                                  ;82B797;


Draw_SaveStation_MapIcons:
    STX.B $20                                                            ;82B798;
    STA.B $22                                                            ;82B79A;
    LDA.W $079F                                                          ;82B79C;
    CMP.L $7ED918                                                        ;82B79F;
    BNE .return                                                          ;82B7A3;
    ASL A                                                                ;82B7A5;
    TAX                                                                  ;82B7A6;
    LDA.L $7ED8F8,X                                                      ;82B7A7;
    STA.B $24                                                            ;82B7AB;
    SEP #$20                                                             ;82B7AD;
    LDX.W $078B                                                          ;82B7AF;
    LDA.W .bits,X                                                        ;82B7B2;
    AND.B $24                                                            ;82B7B5;
    STA.B $24                                                            ;82B7B7;
    REP #$20                                                             ;82B7B9;
    LDA.W $079F                                                          ;82B7BB;
    ASL A                                                                ;82B7BE;
    CLC                                                                  ;82B7BF;
    ADC.B $20                                                            ;82B7C0;
    TAX                                                                  ;82B7C2;
    LDA.W $0000,X                                                        ;82B7C3;
    BNE Draw_MapIcons_ofGivenType                                        ;82B7C6;

.return:
    RTS                                                                  ;82B7C8;


.bits:
    db $01,$02,$04,$08,$10,$20,$40,$80                                   ;82B7C9;

Draw_Debug_Save_MapIcons:
    STX.B $20                                                            ;82B7D1;
    STA.B $22                                                            ;82B7D3;
    LDA.W $079F                                                          ;82B7D5;
    ASL A                                                                ;82B7D8;
    TAX                                                                  ;82B7D9;
    LDA.L $7ED8F8,X                                                      ;82B7DA;
    STA.B $24                                                            ;82B7DE;
    TXA                                                                  ;82B7E0;
    CLC                                                                  ;82B7E1;
    ADC.B $20                                                            ;82B7E2;
    TAX                                                                  ;82B7E4;
    LDA.W $0000,X                                                        ;82B7E5;
    BNE Draw_MapIcons_ofGivenType                                        ;82B7E8;
    RTS                                                                  ;82B7EA;


Draw_Debug_Elevator_Map_Icons:
    STX.B $20                                                            ;82B7EB;
    STA.B $22                                                            ;82B7ED;
    LDA.W $079F                                                          ;82B7EF;
    ASL A                                                                ;82B7F2;
    TAX                                                                  ;82B7F3;
    LDA.L $7ED8F9,X                                                      ;82B7F4;
    STA.B $24                                                            ;82B7F8;
    TXA                                                                  ;82B7FA;
    CLC                                                                  ;82B7FB;
    ADC.B $20                                                            ;82B7FC;
    TAX                                                                  ;82B7FE;
    LDA.W $0000,X                                                        ;82B7FF;
    BNE Draw_MapIcons_ofGivenType                                        ;82B802;
    RTS                                                                  ;82B804;


Draw_Simple_MapIcons:
    STX.B $20                                                            ;82B805;
    STA.B $22                                                            ;82B807;
    LDA.W #$FFFF                                                         ;82B809;
    STA.B $24                                                            ;82B80C;
    LDA.W $079F                                                          ;82B80E;
    ASL A                                                                ;82B811;
    CLC                                                                  ;82B812;
    ADC.B $20                                                            ;82B813;
    TAX                                                                  ;82B815;
    LDA.W $0000,X                                                        ;82B816;
    BNE Draw_MapIcons_ofGivenType                                        ;82B819;
    RTS                                                                  ;82B81B;


Draw_MapIcons_ofGivenType:
    TAX                                                                  ;82B81C;

.loop:
    LDA.W $0000,X                                                        ;82B81D;
    BIT.W #$8000                                                         ;82B820;
    BNE .return                                                          ;82B823;
    LSR.B $24                                                            ;82B825;
    BCC .next                                                            ;82B827;
    PHX                                                                  ;82B829;
    LDA.W $0002,X                                                        ;82B82A;
    TAY                                                                  ;82B82D;
    LDA.W $0000,X                                                        ;82B82E;
    TAX                                                                  ;82B831;
    JSR.W Check_if_MapPosition_isExplored                                ;82B832;
    BEQ .restoreX                                                        ;82B835;
    PLX                                                                  ;82B837;
    PHX                                                                  ;82B838;
    LDA.W $0002,X                                                        ;82B839;
    SEC                                                                  ;82B83C;
    SBC.B $B3                                                            ;82B83D;
    TAY                                                                  ;82B83F;
    LDA.W $0000,X                                                        ;82B840;
    SEC                                                                  ;82B843;
    SBC.B $B1                                                            ;82B844;
    TAX                                                                  ;82B846;
    LDA.B $22                                                            ;82B847;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B849;

.restoreX:
    PLX                                                                  ;82B84D;

.next:
    INX                                                                  ;82B84E;
    INX                                                                  ;82B84F;
    INX                                                                  ;82B850;
    INX                                                                  ;82B851;
    BRA .loop                                                            ;82B852;


.return:
    RTS                                                                  ;82B854;


Check_if_MapPosition_isExplored:
    TXA                                                                  ;82B855;
    AND.W #$FF00                                                         ;82B856;
    LSR A                                                                ;82B859;
    STA.B $12                                                            ;82B85A;
    TXA                                                                  ;82B85C;
    AND.W #$00FF                                                         ;82B85D;
    LSR A                                                                ;82B860;
    LSR A                                                                ;82B861;
    LSR A                                                                ;82B862;
    LSR A                                                                ;82B863;
    LSR A                                                                ;82B864;
    LSR A                                                                ;82B865;
    CLC                                                                  ;82B866;
    ADC.B $12                                                            ;82B867;
    STA.B $12                                                            ;82B869;
    TYA                                                                  ;82B86B;
    AND.W #$FFF8                                                         ;82B86C;
    LSR A                                                                ;82B86F;
    CLC                                                                  ;82B870;
    ADC.B $12                                                            ;82B871;
    STA.B $12                                                            ;82B873;
    TXA                                                                  ;82B875;
    LSR A                                                                ;82B876;
    LSR A                                                                ;82B877;
    LSR A                                                                ;82B878;
    AND.W #$0007                                                         ;82B879;
    TAX                                                                  ;82B87C;
    LDY.B $12                                                            ;82B87D;
    SEP #$20                                                             ;82B87F;
    LDA.W $07F7,Y                                                        ;82B881;
    BIT.W .bits,X                                                        ;82B884;
    REP #$20                                                             ;82B887;
    RTS                                                                  ;82B889;


.bits:
    db $80,$40,$20,$10,$08,$04,$02,$01                                   ;82B88A;

Display_Map_Boss_Icons:
    STX.B $20                                                            ;82B892;
    STA.B $22                                                            ;82B894;
    LDX.W $079F                                                          ;82B896;
    LDA.L $7ED828,X                                                      ;82B899;
    AND.W #$00FF                                                         ;82B89D;
    STA.B $24                                                            ;82B8A0;
    LDA.W $079F                                                          ;82B8A2;
    ASL A                                                                ;82B8A5;
    CLC                                                                  ;82B8A6;
    ADC.B $20                                                            ;82B8A7;
    TAX                                                                  ;82B8A9;
    LDA.W $0000,X                                                        ;82B8AA;
    BEQ .return                                                          ;82B8AD;
    TAX                                                                  ;82B8AF;

.bossIcons:
    LDA.W $0000,X                                                        ;82B8B0;
    CMP.W #$FFFF                                                         ;82B8B3;
    BEQ .return                                                          ;82B8B6;
    CMP.W #$FFFE                                                         ;82B8B8;
    BEQ .skip                                                            ;82B8BB;
    LDA.W #$0E00                                                         ;82B8BD;
    STA.B $03                                                            ;82B8C0;
    LSR.B $24                                                            ;82B8C2;
    BCS .bossDead                                                        ;82B8C4;
    LDA.W $0789                                                          ;82B8C6;
    BEQ .skip                                                            ;82B8C9;

.drawBossIcon:
    PHX                                                                  ;82B8CB;
    LDA.W $0002,X                                                        ;82B8CC;
    SEC                                                                  ;82B8CF;
    SBC.B $B3                                                            ;82B8D0;
    TAY                                                                  ;82B8D2;
    LDA.W $0000,X                                                        ;82B8D3;
    SEC                                                                  ;82B8D6;
    SBC.B $B1                                                            ;82B8D7;
    TAX                                                                  ;82B8D9;
    LDA.B $22                                                            ;82B8DA;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B8DC;
    PLX                                                                  ;82B8E0;

.next:
    INX                                                                  ;82B8E1;
    INX                                                                  ;82B8E2;
    INX                                                                  ;82B8E3;
    INX                                                                  ;82B8E4;
    BRA .bossIcons                                                       ;82B8E5;


.return:
    RTS                                                                  ;82B8E7;


.skip:
    LSR.B $24                                                            ;82B8E8;
    BRA .next                                                            ;82B8EA;


.bossDead:
    PHX                                                                  ;82B8EC;
    LDA.W $0002,X                                                        ;82B8ED;
    SEC                                                                  ;82B8F0;
    SBC.B $B3                                                            ;82B8F1;
    TAY                                                                  ;82B8F3;
    LDA.W $0000,X                                                        ;82B8F4;
    SEC                                                                  ;82B8F7;
    SBC.B $B1                                                            ;82B8F8;
    TAX                                                                  ;82B8FA;
    LDA.W #$0062                                                         ;82B8FB;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B8FE;
    PLX                                                                  ;82B902;
    LDA.W #$0C00                                                         ;82B903;
    STA.B $03                                                            ;82B906;
    BRA .drawBossIcon                                                    ;82B908;


Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction:
    PHX                                                                  ;82B90A;
    LDA.W $0000,X                                                        ;82B90B;
    PHA                                                                  ;82B90E;
    LDA.W $0002,X                                                        ;82B90F;
    TAY                                                                  ;82B912;
    LDA.W $0004,X                                                        ;82B913;
    PLX                                                                  ;82B916;
    PHB                                                                  ;82B917;
    PHK                                                                  ;82B918;
    PLB                                                                  ;82B919;
    JSR.W Draw_PauseScreen_SpriteAnimation                               ;82B91A;
    PLB                                                                  ;82B91D;
    PLX                                                                  ;82B91E;
    LDA.W $0006,X                                                        ;82B91F;
    BIT.B $8B                                                            ;82B922;
    BEQ .return                                                          ;82B924;
    LDA.W $05FD                                                          ;82B926;
    BNE .return                                                          ;82B929;
    LDA.W $0008,X                                                        ;82B92B;
    STA.W $05FD                                                          ;82B92E;

.return:
    RTL                                                                  ;82B931;


UNUSED_REP30_82B932:
    REP #$30                                                             ;82B932;

Handle_MapScrollArrows:
    PHP                                                                  ;82B934;
    PHB                                                                  ;82B935;
    SEP #$20                                                             ;82B936;
    LDA.B #$82                                                           ;82B938;
    PHA                                                                  ;82B93A;
    PLB                                                                  ;82B93B;
    REP #$20                                                             ;82B93C;
    LDA.W $05AC                                                          ;82B93E;
    SEC                                                                  ;82B941;
    SBC.W #$0018                                                         ;82B942;
    CMP.B $B1                                                            ;82B945;
    BPL +                                                                ;82B947;
    LDX.W #MapScrollArrows_left                                          ;82B949;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;82B94C;

  + LDA.W $05AE                                                          ;82B950;
    CLC                                                                  ;82B953;
    ADC.W #$0018                                                         ;82B954;
    SEC                                                                  ;82B957;
    SBC.W #$0100                                                         ;82B958;
    CMP.B $B1                                                            ;82B95B;
    BMI +                                                                ;82B95D;
    LDX.W #MapScrollArrows_right                                         ;82B95F;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;82B962;

  + LDA.W $05B0                                                          ;82B966;
    SEC                                                                  ;82B969;
    SBC.W #$0038                                                         ;82B96A;
    CMP.B $B3                                                            ;82B96D;
    BPL +                                                                ;82B96F;
    LDX.W #MapScrollArrows_up                                            ;82B971;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;82B974;

  + LDA.W $05B2                                                          ;82B978;
    SEC                                                                  ;82B97B;
    SBC.W #$00B1                                                         ;82B97C;
    CMP.B $B3                                                            ;82B97F;
    BMI .cancelScrollDown                                                ;82B981;
    LDX.W #MapScrollArrows_down                                          ;82B983;
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction         ;82B986;

.return:
    PLB                                                                  ;82B98A;
    PLP                                                                  ;82B98B;
    RTL                                                                  ;82B98C;


.cancelScrollDown:
    LDA.W $05FD                                                          ;82B98D;
    CMP.W MapScrollArrows_downDirection                                  ;82B990;
    BNE .return                                                          ;82B993;
    STZ.W $05FB                                                          ;82B995;
    STZ.W $05FD                                                          ;82B998;
    STZ.W $05FF                                                          ;82B99B;
    BRA .return                                                          ;82B99E;


MapScrollArrows:
  .left
    dw $0010,$0078,$0009,$0200,$0001                                     ;82B9A0;
  .right
    dw $00F0,$0078,$0008,$0100,$0002                                     ;82B9AA;
  .up
    dw $0080,$0038,$0006,$0800,$0003                                     ;82B9B4;
  .down
    dw $0080,$00B8,$0007,$0400                                           ;82B9BE;
  .downDirection
    dw $0004                                                             ;82B9C6;

MapScreen_DrawSamusPositionIndicator:
    LDA.W #$0E00                                                         ;82B9C8;
    STA.B $03                                                            ;82B9CB;
    JSR.W Update_Samus_Position_Indicator_Animation                      ;82B9CD;
    PHA                                                                  ;82B9D0;
    LDA.W $0AF6                                                          ;82B9D1;
    XBA                                                                  ;82B9D4;
    AND.W #$00FF                                                         ;82B9D5;
    CLC                                                                  ;82B9D8;
    ADC.W $07A1                                                          ;82B9D9;
    ASL A                                                                ;82B9DC;
    ASL A                                                                ;82B9DD;
    ASL A                                                                ;82B9DE;
    SEC                                                                  ;82B9DF;
    SBC.B $B1                                                            ;82B9E0;
    TAX                                                                  ;82B9E2;
    LDA.W $0AFA                                                          ;82B9E3;
    XBA                                                                  ;82B9E6;
    AND.W #$00FF                                                         ;82B9E7;
    CLC                                                                  ;82B9EA;
    ADC.W $07A3                                                          ;82B9EB;
    INC A                                                                ;82B9EE;
    ASL A                                                                ;82B9EF;
    ASL A                                                                ;82B9F0;
    ASL A                                                                ;82B9F1;
    SEC                                                                  ;82B9F2;
    SBC.B $B3                                                            ;82B9F3;
    TAY                                                                  ;82B9F5;
    PLA                                                                  ;82B9F6;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82B9F7;
    RTS                                                                  ;82B9FB;


Update_Samus_Position_Indicator_Animation:
    LDA.W $0778                                                          ;82B9FC;
    BNE .nonZero                                                         ;82B9FF;
    LDX.W $0776                                                          ;82BA01;
    INX                                                                  ;82BA04;
    INX                                                                  ;82BA05;
    CPX.W #$0008                                                         ;82BA06;
    BMI +                                                                ;82BA09;
    INC.W $077A                                                          ;82BA0B;
    LDX.W #$0000                                                         ;82BA0E;

  + STX.W $0776                                                          ;82BA11;
    LDA.W .delays,X                                                      ;82BA14;
    STA.W $0778                                                          ;82BA17;

.nonZero:
    DEC A                                                                ;82BA1A;
    STA.W $0778                                                          ;82BA1B;
    LDX.W $0776                                                          ;82BA1E;
    LDA.W .spritemapIDs,X                                                ;82BA21;
    RTS                                                                  ;82BA24;


.delays:
    db $08,$00,$04,$00,$08,$00,$04,$00                                   ;82BA25;

.spritemapIDs:
    db $5F,$00,$60,$00,$61,$00,$60,$00                                   ;82BA2D; (into $82:C569 table)

Draw_Border_Around_SAMUS_DATA:
    LDA.W #$0E00                                                         ;82BA35;
    STA.B $03                                                            ;82BA38;
    LDX.W #$0080                                                         ;82BA3A;
    LDY.W #$0010                                                         ;82BA3D;
    LDA.W #$0048                                                         ;82BA40;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82BA43;
    RTL                                                                  ;82BA47;


Draw_Border_Around_DATA_COPY_MODE:
    LDA.W #$0E00                                                         ;82BA48;
    STA.B $03                                                            ;82BA4B;
    LDX.W #$0080                                                         ;82BA4D;
    LDY.W #$0010                                                         ;82BA50;
    LDA.W #$0049                                                         ;82BA53;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82BA56;
    RTL                                                                  ;82BA5A;


Draw_Border_Around_DATA_CLEAR_MODE:
    LDA.W #$0E00                                                         ;82BA5B;
    STA.B $03                                                            ;82BA5E;
    LDX.W #$007C                                                         ;82BA60;
    LDY.W #$0010                                                         ;82BA63;
    LDA.W #$004A                                                         ;82BA66;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82BA69;
    RTL                                                                  ;82BA6D;


Draw_Menu_Selection_Missile:
    PHB                                                                  ;82BA6E;
    PHK                                                                  ;82BA6F;
    PLB                                                                  ;82BA70;
    LDA.W $198D                                                          ;82BA71;
    BEQ +                                                                ;82BA74;
    DEC A                                                                ;82BA76;
    STA.W $198D                                                          ;82BA77;
    BNE +                                                                ;82BA7A;
    LDA.W $1997                                                          ;82BA7C;
    INC A                                                                ;82BA7F;
    AND.W #$0003                                                         ;82BA80;
    STA.W $1997                                                          ;82BA83;
    ASL A                                                                ;82BA86;
    TAY                                                                  ;82BA87;
    LDA.W .animTimer,Y                                                   ;82BA88;
    STA.W $198D                                                          ;82BA8B;

  + LDA.W #$0E00                                                         ;82BA8E;
    STA.B $03                                                            ;82BA91;
    LDA.W $1997                                                          ;82BA93;
    ASL A                                                                ;82BA96;
    TAY                                                                  ;82BA97;
    LDA.W .animFrame,Y                                                   ;82BA98;
    PHA                                                                  ;82BA9B;
    LDA.W $19AB                                                          ;82BA9C;
    TAY                                                                  ;82BA9F;
    LDA.W $19A1                                                          ;82BAA0;
    TAX                                                                  ;82BAA3;
    PLA                                                                  ;82BAA4;
    PLB                                                                  ;82BAA5;
    JML.L AddSpritemapFrom_82C569_TableToOAM                             ;82BAA6;


.animTimer:
    dw $0008,$0008,$0008,$0008                                           ;82BAAA;

.animFrame:
    dw $0037,$0036,$0035,$0034                                           ;82BAB2;

Draw_FileCopy_Arrow:
    PHB                                                                  ;82BABA;
    PHK                                                                  ;82BABB;
    PLB                                                                  ;82BABC;
    LDA.W $19B7                                                          ;82BABD;
    SEC                                                                  ;82BAC0;
    SBC.W $19B9                                                          ;82BAC1;
    BPL .upwards                                                         ;82BAC4;
    EOR.W #$FFFF                                                         ;82BAC6;
    INC A                                                                ;82BAC9;
    LDX.W #$0000                                                         ;82BACA;
    CMP.W #$0002                                                         ;82BACD;
    BPL .spawnSprite                                                     ;82BAD0;
    LDX.W #$0006                                                         ;82BAD2;
    LDA.W $19B7                                                          ;82BAD5;
    BEQ +                                                                ;82BAD8;
    LDX.W #$000C                                                         ;82BADA;

  + BRA .spawnSprite                                                     ;82BADD;


.upwards:
    LDX.W #$0012                                                         ;82BADF;
    CMP.W #$0002                                                         ;82BAE2;
    BPL .spawnSprite                                                     ;82BAE5;
    LDX.W #$0018                                                         ;82BAE7;
    LDA.W $19B7                                                          ;82BAEA;
    CMP.W #$0001                                                         ;82BAED;
    BEQ .spawnSprite                                                     ;82BAF0;
    LDX.W #$001E                                                         ;82BAF2;

.spawnSprite:
    LDA.W #$0200                                                         ;82BAF5;
    STA.B $03                                                            ;82BAF8;
    LDA.W .tableIndex,X                                                  ;82BAFA;
    PHA                                                                  ;82BAFD;
    LDA.W .tableYpos,X                                                   ;82BAFE;
    TAY                                                                  ;82BB01;
    LDA.W .tableXpos,X                                                   ;82BB02;
    TAX                                                                  ;82BB05;
    PLA                                                                  ;82BB06;
    PLB                                                                  ;82BB07;
    JML.L AddSpritemapFrom_82C569_TableToOAM                             ;82BB08;


;        _______________ Spritemap index
;       |      _________ X position
;       |     |      ___ Y position
;       |     |     |
.tableIndex:
    dw $0042                                                             ;82BB0C;
.tableXpos:
    dw       $0014
.tableYpos:
    dw             $0068 ; 0:   A ------> C
    dw $0040,$0014,$0058 ; 6:   A -> B
    dw $0040,$0014,$0078 ; Ch:       B -> C
    dw $0043,$0014,$0068 ; 12h: A <------ C
    dw $0041,$0014,$0058 ; 18h: A <- B
    dw $0041,$0014,$0078 ; 1Eh:      B <- C

Display_Map_Elevator_Destinations:
    REP #$30                                                             ;82BB30;
    PHB                                                                  ;82BB32;
    PHK                                                                  ;82BB33;
    PLB                                                                  ;82BB34;
    LDA.W #$0000                                                         ;82BB35;
    STA.B $03                                                            ;82BB38;
    LDX.W $079F                                                          ;82BB3A;
    LDA.L $7ED908,X                                                      ;82BB3D;
    AND.W #$00FF                                                         ;82BB41;
    BEQ .return                                                          ;82BB44;
    LDA.W $079F                                                          ;82BB46;
    ASL A                                                                ;82BB49;
    TAX                                                                  ;82BB4A;
    LDA.W Map_Elevator_Destinations,X                                    ;82BB4B;
    TAX                                                                  ;82BB4E;

.loop:
    LDA.W $0000,X                                                        ;82BB4F;
    CMP.W #$FFFF                                                         ;82BB52;
    BEQ .return                                                          ;82BB55;
    PHX                                                                  ;82BB57;
    SEC                                                                  ;82BB58;
    SBC.B $B1                                                            ;82BB59;
    PHA                                                                  ;82BB5B;
    LDA.W $0002,X                                                        ;82BB5C;
    SEC                                                                  ;82BB5F;
    SBC.B $B3                                                            ;82BB60;
    TAY                                                                  ;82BB62;
    LDA.W $0004,X                                                        ;82BB63;
    PLX                                                                  ;82BB66;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82BB67;
    PLA                                                                  ;82BB6B;
    CLC                                                                  ;82BB6C;
    ADC.W #$0006                                                         ;82BB6D;
    TAX                                                                  ;82BB70;
    BRA .loop                                                            ;82BB71;


.return:
    PLB                                                                  ;82BB73;
    RTL                                                                  ;82BB74;


Handle_GameOver_BabyMetroid:
    PHB                                                                  ;82BB75;
    REP #$30                                                             ;82BB76;
    PHK                                                                  ;82BB78;
    PLB                                                                  ;82BB79;
    LDA.W $0F94                                                          ;82BB7A;
    BEQ Restart_GameOver_BabyMetroid_InstructionList                     ;82BB7D;

Process_GameOver_BabyMetroid_InstructionList:
    LDX.W $0F92                                                          ;82BB7F;
    DEC A                                                                ;82BB82;
    STA.W $0F94                                                          ;82BB83;
    BNE Draw_GameOver_BabyMetroid                                        ;82BB86;
    LDA.W $0006,X                                                        ;82BB88;
    CMP.W #$FFFF                                                         ;82BB8B;
    BEQ Restart_GameOver_BabyMetroid_InstructionList                     ;82BB8E;
    BMI Goto_A_82BBEB                                                    ;82BB90;
    STA.W $0F94                                                          ;82BB92;
    TXA                                                                  ;82BB95;
    CLC                                                                  ;82BB96;
    ADC.W #$0006                                                         ;82BB97;
    STA.W $0F92                                                          ;82BB9A;
    TAX                                                                  ;82BB9D;

Draw_GameOver_BabyMetroid:
    PHX                                                                  ;82BB9E;
    LDA.W $0004,X                                                        ;82BB9F;
    TAY                                                                  ;82BBA2;
    LDX.W #$0000                                                         ;82BBA3;

.loop:
    LDA.W $0000,Y                                                        ;82BBA6;
    STA.L $7EC180,X                                                      ;82BBA9;
    INY                                                                  ;82BBAD;
    INY                                                                  ;82BBAE;
    INX                                                                  ;82BBAF;
    INX                                                                  ;82BBB0;
    CPX.W #$0020                                                         ;82BBB1;
    BMI .loop                                                            ;82BBB4;
    PLX                                                                  ;82BBB6;
    LDA.W #$0800                                                         ;82BBB7;
    STA.B $03                                                            ;82BBBA;
    LDA.W $0002,X                                                        ;82BBBC;
    LDX.W #$007C                                                         ;82BBBF;
    LDY.W #$0050                                                         ;82BBC2;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82BBC5;
    LDA.W #$0A00                                                         ;82BBC9;
    STA.B $03                                                            ;82BBCC;
    LDA.W #$0064                                                         ;82BBCE;
    LDX.W #$007C                                                         ;82BBD1;
    LDY.W #$0050                                                         ;82BBD4;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;82BBD7;
    PLB                                                                  ;82BBDB;
    RTL                                                                  ;82BBDC;


Restart_GameOver_BabyMetroid_InstructionList:
    LDA.W #GameOver_BabyMetroid_InstructionList                          ;82BBDD;
    STA.W $0F92                                                          ;82BBE0;
    LDA.W #$000A                                                         ;82BBE3;
    STA.W $0F94                                                          ;82BBE6;
    BRA Process_GameOver_BabyMetroid_InstructionList                     ;82BBE9;


Goto_A_82BBEB:
    STA.B $12                                                            ;82BBEB;
    JMP.W ($0012)                                                        ;82BBED;


FinishProcessing_GameOver_BabyMetroid_ASMInstruction:
    LDX.W $0F92                                                          ;82BBF0;
    LDA.W $0008,X                                                        ;82BBF3;
    STA.W $0F94                                                          ;82BBF6;
    TXA                                                                  ;82BBF9;
    CLC                                                                  ;82BBFA;
    ADC.W #$0008                                                         ;82BBFB;
    STA.W $0F92                                                          ;82BBFE;
    TAX                                                                  ;82BC01;
    LDA.W $0000,X                                                        ;82BC02;
    CMP.W #$FFFF                                                         ;82BC05;
    BEQ Restart_GameOver_BabyMetroid_InstructionList                     ;82BC08;
    BRA Draw_GameOver_BabyMetroid                                        ;82BC0A;


Instruction_Queue_BabyMetroid_Cry1_SoundEffect:
    LDA.W #$0023                                                         ;82BC0C;
    JSL.L QueueSound_Lib3_Max6                                           ;82BC0F;
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction             ;82BC13;


Instruction_Queue_BabyMetroid_Cry2_SoundEffect:
    LDA.W #$0026                                                         ;82BC15;
    JSL.L QueueSound_Lib3_Max6                                           ;82BC18;
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction             ;82BC1C;


Instruction_Queue_BabyMetroid_Cry3_SoundEffect:
    LDA.W #$0027                                                         ;82BC1E;
    JSL.L QueueSound_Lib3_Max6                                           ;82BC21;
    BRA FinishProcessing_GameOver_BabyMetroid_ASMInstruction             ;82BC25;


GameOver_BabyMetroid_InstructionList:
; Positive instruction format: timer, spritemap index for $82:C569 table, palette pointer
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BC27;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BC2D;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BC33;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BC39;
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BC3F;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BC45;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BC4B;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BC51;
    dw $0006,$0065,GameOver_BabyMetroid_Palettes_1                       ;82BC57;
    dw Instruction_Queue_BabyMetroid_Cry1_SoundEffect                    ;82BC5D;
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BC5F;
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3                       ;82BC65;
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BC6B;
    dw $0002,$0065,GameOver_BabyMetroid_Palettes_1                       ;82BC71;
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BC77;
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3                       ;82BC7D;
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BC83;
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BC89;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BC8F;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BC95;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BC9B;
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BCA1;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BCA7;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BCAD;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BCB3;
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BCB9;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BCBF;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BCC5;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BCCB;
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BCD1;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BCD7;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BCDD;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BCE3;
    dw $0006,$0065,GameOver_BabyMetroid_Palettes_1                       ;82BCE9;
    dw Instruction_Queue_BabyMetroid_Cry2_SoundEffect                    ;82BCEF;
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BCF1;
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3                       ;82BCF7;
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BCFD;
    dw $0002,$0065,GameOver_BabyMetroid_Palettes_1                       ;82BD03;
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BD09;
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3                       ;82BD0F;
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BD15;
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BD1B;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BD21;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BD27;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BD2D;
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BD33;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BD39;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BD3F;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BD45;
    dw $000A,$0065,GameOver_BabyMetroid_Palettes_0                       ;82BD4B;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BD51;
    dw $000A,$0067,GameOver_BabyMetroid_Palettes_0                       ;82BD57;
    dw $000A,$0066,GameOver_BabyMetroid_Palettes_0                       ;82BD5D;
    dw $0006,$0065,GameOver_BabyMetroid_Palettes_1                       ;82BD63;
    dw Instruction_Queue_BabyMetroid_Cry3_SoundEffect                    ;82BD69;
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BD6B;
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3                       ;82BD71;
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BD77;
    dw $0002,$0065,GameOver_BabyMetroid_Palettes_1                       ;82BD7D;
    dw $0003,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BD83;
    dw $0004,$0067,GameOver_BabyMetroid_Palettes_3                       ;82BD89;
    dw $0005,$0066,GameOver_BabyMetroid_Palettes_2                       ;82BD8F;
    dw $FFFF                                                             ;82BD95;

GameOver_BabyMetroid_Palettes_0:                                         ;82BDA7;
    dw $3800,$7F50,$2E40,$2DA0,$2D00,$725A,$2C3A,$240F,$1C05,$1800,$639A,$52D3,$420D,$7F66,$7FFA,$7240

GameOver_BabyMetroid_Palettes_1:                                         ;82BDC7;
    dw $3800,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0

GameOver_BabyMetroid_Palettes_2:                                         ;82BDE7;
    dw $3800,$77F8,$1344,$12A4,$1204,$6ABF,$249F,$1C77,$146D,$1067,$5BFF,$4B38,$3A72,$7BD3,$7FFF,$6B43

GameOver_BabyMetroid_Palettes_3:                                         ;82BE07;
    dw $3800,$7FFB,$1FA7,$1F07,$1E67,$771F,$30FF,$28DA,$20D0,$1CCA,$67FF,$579B,$46D5,$7BD6,$7FFF,$77A6

Cancel_Sound_Effects:
    REP #$30                                                             ;82BE17;
    LDA.W #$0002                                                         ;82BE19;
    JSL.L QueueSound_Lib1_Max6                                           ;82BE1C;
    LDA.W #$0071                                                         ;82BE20;
    JSL.L QueueSound_Lib2_Max6                                           ;82BE23;
    LDA.W #$0001                                                         ;82BE27;
    JSL.L QueueSound_Lib3_Max6                                           ;82BE2A;
    RTL                                                                  ;82BE2E;


Queue_Samus_Movement_SoundEffects:
    REP #$30                                                             ;82BE2F;
    LDA.W $0B3E                                                          ;82BE31;
    AND.W #$FF00                                                         ;82BE34;
    CMP.W #$0400                                                         ;82BE37;
    BNE +                                                                ;82BE3A;
    LDA.W #$002B                                                         ;82BE3C;
    JSL.L QueueSound_Lib3_Max6                                           ;82BE3F;

  + LDA.W $0CD0                                                          ;82BE43;
    CMP.W #$0010                                                         ;82BE46;
    BMI +                                                                ;82BE49;
    LDA.W #$0041                                                         ;82BE4B;
    JSL.L QueueSound_Lib1_Max6                                           ;82BE4E;

  + LDA.W #$0014                                                         ;82BE52;
    JSL.L Run_Samus_Command                                              ;82BE55;
    RTL                                                                  ;82BE59;


UNUSED_82BE5A:
    REP #$30                                                             ;82BE5A;
    LDA.W $079F                                                          ;82BE5C;
    STA.B $12                                                            ;82BE5F;
    ASL A                                                                ;82BE61;
    CLC                                                                  ;82BE62;
    ADC.B $12                                                            ;82BE63;
    TAX                                                                  ;82BE65;
    LDA.W AreaMapPointers,X                                              ;82BE66;
    STA.B $00                                                            ;82BE69;
    LDA.W AreaMapPointers+2,X                                            ;82BE6B;
    STA.B $02                                                            ;82BE6E;
    LDY.W #$0000                                                         ;82BE70;

.clear12:
    STZ.B $12                                                            ;82BE73;

.loop:
    LDA.B [$00],Y                                                        ;82BE75;
    AND.W #$03FF                                                         ;82BE77;
    CMP.W #$001F                                                         ;82BE7A;
    BEQ .clc                                                             ;82BE7D;
    SEC                                                                  ;82BE7F;
    BRA +                                                                ;82BE80;


.clc:
    CLC                                                                  ;82BE82;

  + ROL.B $12                                                            ;82BE83;
    INY                                                                  ;82BE85;
    INY                                                                  ;82BE86;
    TYA                                                                  ;82BE87;
    AND.W #$000F                                                         ;82BE88;
    BNE .loop                                                            ;82BE8B;
    CPY.W #$1000                                                         ;82BE8D;

.crash:
    BPL .crash                                                           ;82BE90;
    TYA                                                                  ;82BE92; dead code
    LSR A                                                                ;82BE93;
    LSR A                                                                ;82BE94;
    LSR A                                                                ;82BE95;
    LSR A                                                                ;82BE96;
    TAX                                                                  ;82BE97;
    SEP #$20                                                             ;82BE98;
    LDA.B $12                                                            ;82BE9A;
    STA.W $07F6,X                                                        ;82BE9C;
    REP #$20                                                             ;82BE9F;
    BRA .clear12                                                         ;82BEA1;


UNUSED_82BEA3:
    REP #$30                                                             ;82BEA3;
    LDX.W #$0600                                                         ;82BEA5;
    LDA.W #$0000                                                         ;82BEA8;

.loop:
    STA.L $7E3000,X                                                      ;82BEAB;
    STA.L $7E4000,X                                                      ;82BEAF;
    DEX                                                                  ;82BEB3;
    DEX                                                                  ;82BEB4;
    BPL .loop                                                            ;82BEB5;
    STA.L $7E4000                                                        ;82BEB7;
    STA.L $7E4002                                                        ;82BEBB;
    STA.L $7E4004                                                        ;82BEBF;
    STZ.W $079F                                                          ;82BEC3;

.biggerLoop:
    REP #$20                                                             ;82BEC6;
    LDA.W $079F                                                          ;82BEC8;
    XBA                                                                  ;82BECB;
    TAY                                                                  ;82BECC;
    TAX                                                                  ;82BECD;
    SEP #$20                                                             ;82BECE;
    LDA.B #$FF                                                           ;82BED0;
    STA.B $12                                                            ;82BED2;

.middleLoop:
    LDA.W ReserveTank_TransferEnergyPerFrame,Y                           ;82BED4;
    BEQ +                                                                ;82BED7;
    TYA                                                                  ;82BED9;
    STA.L $7E3000,X                                                      ;82BEDA;
    INX                                                                  ;82BEDE;
    PHX                                                                  ;82BEDF;
    LDX.W $079F                                                          ;82BEE0;
    LDA.L $7E4000,X                                                      ;82BEE3;
    INC A                                                                ;82BEE7;
    STA.L $7E4000,X                                                      ;82BEE8;
    PLX                                                                  ;82BEEC;

  + INY                                                                  ;82BEED;
    LDA.B $12                                                            ;82BEEE;
    DEC A                                                                ;82BEF0;
    STA.B $12                                                            ;82BEF1;
    CMP.B #$FF                                                           ;82BEF3;
    BNE .middleLoop                                                      ;82BEF5;
    LDA.W $079F                                                          ;82BEF7;
    INC A                                                                ;82BEFA;
    STA.W $079F                                                          ;82BEFB;
    CMP.B #$07                                                           ;82BEFE;
    BMI .biggerLoop                                                      ;82BF00;

.crash:
    BRA .crash                                                           ;82BF02;


ReserveTank_TransferEnergyPerFrame:
    dw $0001                                                             ;82BF04;

EquipmentScreenTilemaps:
  .modeManual
; MODE[MANUAL]
    dw $2519,$251A,$251B,$3D46,$3D47,$3D48,$3D49                         ;82BF06;

  .reserveTank
; RESERVE TANK
    dw $3C80,$3C81,$3C82,$3C83,$3C84,$3C85,$3C86                         ;82BF14;

  .manual
; [MANUAL]
    dw $3D46,$3D47,$3D48,$3D49                                           ;82BF22;

  .auto
; [ AUTO ]
    dw $3D56,$3D57,$3D58,$3D59                                           ;82BF2A;

  .charge
; oCHARGE
    dw $08FF,$08D8,$08D9,$08DA,$08E7                                     ;82BF32;

  .ice
; oICE
    dw $08FF,$08DB,$08DC,$08D4,$08D4                                     ;82BF3C;

  .wave
; oWAVE
    dw $08FF,$08DD,$08DE,$08DF,$08D4                                     ;82BF46;

  .spazer
; oSPAZER
    dw $08FF,$08E8,$08E9,$08EA,$08EB                                     ;82BF50;

  .plasma
; oPLASMA
    dw $08FF,$08EC,$08ED,$08EE,$08EF                                     ;82BF5A;

  .variaSuit
; oVARIA SUIT
    dw $08FF,$0900,$0901,$0902,$0903,$0904,$0905,$08D4,$08D4             ;82BF64;

  .gravitySuit
; oGRAVITY SUIT
    dw $08FF,$08D0,$08D1,$08D2,$08D3,$0903,$0904,$0905,$08D4             ;82BF76;

  .morphingBall
; oMORPHING BALL
    dw $08FF,$0920,$0921,$0922,$0923,$0917,$0918,$090F,$091F             ;82BF88;

  .bombs
; oBOMBS
    dw $08FF,$08D5,$08D6,$08D7,$08D4,$08D4,$08D4,$08D4,$08D4             ;82BF9A;

  .springBall
; oSPRING BALL
    dw $08FF,$0910,$0911,$0912,$0913,$0914,$0915,$0916,$08D4             ;82BFAC;

  .UNUSED
    dw $0000                                                             ;82BFBE;

  .screwAttack
; oSCREW ATTACK
    dw $08FF,$08E0,$08E1,$08E2,$08E3,$08E4,$08E5,$08E6,$08D4             ;82BFC0;

  .hiJumpBoots
; oHI-JUMP BOOTS
    dw $08FF,$0930,$0931,$0932,$0933,$0934,$0935,$0936,$08D4             ;82BFD2;

  .spaceJump
; oSPACE JUMP
    dw $08FF,$08F0,$08F1,$08F2,$08F3,$08F4,$08F5,$08D4,$08D4             ;82BFE4;

  .speedBooster
; oSPEED BOOSTER
    dw $08FF,$0924,$0925,$0926,$0927,$0928,$0929,$092A,$092B             ;82BFF6;

  .hyper
; oHYPER
    dw $08FF,$0937,$0938,$0939,$092F,$08D4,$08D4,$08D4,$08D4             ;82C008;

  .blankPlaceholder
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000             ;82C01A;

EquipmentScreenDataPointers:
  .tilemapOffsets:
    dw EquipmentScreenData_RAMTilemapOffsets_tanks                       ;82C02C;
    dw EquipmentScreenData_RAMTilemapOffsets_weapons                     ;82C02E;
    dw EquipmentScreenData_RAMTilemapOffsets_suitsMisc                   ;82C030;
    dw EquipmentScreenData_RAMTilemapOffsets_boots                       ;82C032;


  .listsEquipmentBitmasks:
    dw $0000                                                             ;82C034;
    dw EquipmentScreenData_EquipmentBitmasks_weapons                     ;82C036;
    dw EquipmentScreenData_EquipmentBitmasks_suitsMisc                   ;82C038;
    dw EquipmentScreenData_EquipmentBitmasks_boots                       ;82C03A;


  .equipmentBitmasks:
;        _____________________ Tanks
;       |      _______________ Weapons
;       |     |      _________ Suit/misc
;       |     |     |      ___ Boots
;       |     |     |     |
    dw $0000,$09A6,$09A2,$09A2                                           ;82C03C;


  .listsPointsToEquipmentTilemaps:
    dw $0000                                                             ;82C044;
    dw EquipmentScreenData_PointersEquipmentTIlemaps_weapons             ;82C046;
    dw EquipmentScreenData_PointersEquipmentTIlemaps_suitsMisc           ;82C048;
    dw EquipmentScreenData_PointersEquipmentTIlemaps_boots               ;82C04A;

EquipmentScreenData:
  .EquipmentBitmasks
  ..weapons                                                              ;82C04C;
    dw $1000 ; Weapons - charge
    dw $0002 ; Weapons - ice
    dw $0001 ; Weapons - wave
    dw $0004 ; Weapons - spazer
    dw $0008 ; Weapons - plasma

  ..suitsMisc                                                            ;82C056;
    dw $0001 ; Suit/misc - varia suit
    dw $0020 ; Suit/misc - gravity suit
    dw $0004 ; Suit/misc - morph ball
    dw $1000 ; Suit/misc - bombs
    dw $0002 ; Suit/misc - spring ball
    dw $0008 ; Suit/misc - screw attack

  ..boots                                                                ;82C062;
    dw $0100 ; Boots - hi-jump boots
    dw $0200 ; Boots - space jump
    dw $2000 ; Boots - speed booster

  .RAMTilemapOffsets                                                     ;82C068;
  ..tanks
    dw $3A88 ; Tanks - mode
    dw $3AC8 ; Tanks - reserve tank

  ..weapons                                                              ;82C06C;
    dw $3C08 ; Weapons - char
    dw $3C48 ; Weapons - ice
    dw $3C88 ; Weapons - wave
  ...spazer                                                              ;82C072;
    dw $3CC8 ; Weapons - spazer
  ...plasma                                                              ;82C074;
    dw $3D08 ; Weapons - plasma

  ..suitsMisc                                                            ;82C076;
    dw $3A6A ; Suit/misc - varia suit
    dw $3AAA ; Suit/misc - gravity suit
    dw $3B6A ; Suit/misc - morph ball
    dw $3BAA ; Suit/misc - bombs
    dw $3BEA ; Suit/misc - spring ball
    dw $3C2A ; Suit/misc - screw attack

  ..boots                                                                ;82C082;
    dw $3CEA ; Boots - hi-jump boots
    dw $3D2A ; Boots - space jump
    dw $3D6A ; Boots - speed booster

EquipmentScreenData_PointersEquipmentTIlemaps_tanks:
    dw EquipmentScreenTilemaps_modeManual                                ;82C088;

EquipmentScreenData_PointersEquipmentTIlemaps_tanksReserve:
    dw EquipmentScreenTilemaps_reserveTank                               ;82C08A;

EquipmentScreenData_PointersEquipmentTIlemaps_weapons:
    dw EquipmentScreenTilemaps_charge                                    ;82C08C;
    dw EquipmentScreenTilemaps_ice                                       ;82C08E;
    dw EquipmentScreenTilemaps_wave                                      ;82C090;
    dw EquipmentScreenTilemaps_spazer                                    ;82C092;
    dw EquipmentScreenTilemaps_plasma                                    ;82C094;

EquipmentScreenData_PointersEquipmentTIlemaps_suitsMisc:
    dw EquipmentScreenTilemaps_variaSuit                                 ;82C096;
    dw EquipmentScreenTilemaps_gravitySuit                               ;82C098;
    dw EquipmentScreenTilemaps_morphingBall                              ;82C09A;
    dw EquipmentScreenTilemaps_bombs                                     ;82C09C;
    dw EquipmentScreenTilemaps_springBall                                ;82C09E;
    dw EquipmentScreenTilemaps_screwAttack                               ;82C0A0;

EquipmentScreenData_PointersEquipmentTIlemaps_boots:
    dw EquipmentScreenTilemaps_hiJumpBoots                               ;82C0A2;
    dw EquipmentScreenTilemaps_spaceJump                                 ;82C0A4;
    dw EquipmentScreenTilemaps_speedBooster                              ;82C0A6;

HyperBeamTilemaps:
    dw EquipmentScreenTilemaps_blankPlaceholder                          ;82C0A8;
    dw EquipmentScreenTilemaps_blankPlaceholder                          ;82C0AA;
    dw EquipmentScreenTilemaps_hyper                                     ;82C0AC;
    dw EquipmentScreenTilemaps_blankPlaceholder                          ;82C0AE;
    dw EquipmentScreenTilemaps_blankPlaceholder                          ;82C0B0;

;;; $C0B2: Pause screen sprite animation data ;;;
PauseScreen_SpriteAnimationData:
;        ___________________________________________________ 1: Unused (used for start / L/R button pressed highlight elsewhere)
;       |      _____________________________________________ 2: L/R highlight
;       |     |      _______________________________________ 3: Item selector
;       |     |     |      _________________________________ 4: Unused (used for reserve tank animation elsewhere)
;       |     |     |     |      ___________________________ 5: Unused
;       |     |     |     |     |      _____________________ 6: Map scroll arrow - up
;       |     |     |     |     |     |      _______________ 7: Map scroll arrow - down
;       |     |     |     |     |     |     |      _________ 8: Map scroll arrow - right
;       |     |     |     |     |     |     |     |      ___ 9: Map scroll arrow - left
;       |     |     |     |     |     |     |     |     |
  .timer                                                                 ;82C0B2;
; Pointers to use for animation timer
    dw $0729,$072B,$072D,$072F,$0731,$0733,$0735,$0737,$0739
  .frame                                                                 ;82C0C4;
; Pointers to use for animation frame, indexes animation data
    dw $073D,$073F,$0741,$0743,$0745,$0747,$0749,$074B,$074D
  .mode                                                                  ;82C0D6;
; Pointers to use for animation mode, indexes [$C1E4 + (animation ID) * 2]
    dw $0751,$0753,$0755,$0757,$0759,$075B,$075D,$075F,$0761
  .data
; Pointers to animation data
    dw Duration_Of_L_R_Button_Pressed_Highlight                          ;82C0E8;
    dw L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays      ;82C0EA;
    dw ItemSelector_and_MapScrollArrows                                  ;82C0EC;
    dw UNUSED_Animation_4_82C162                                         ;82C0EE;
    dw ItemSelector_and_MapScrollArrows                                  ;82C0F0;
    dw ItemSelector_and_MapScrollArrows                                  ;82C0F2;
    dw ItemSelector_and_MapScrollArrows                                  ;82C0F4;
    dw ItemSelector_and_MapScrollArrows                                  ;82C0F6;
    dw ItemSelector_and_MapScrollArrows                                  ;82C0F8;

SpritePalette_IndexValues:
; Sprite palette index values
    dw $0000,$0200,$0400,$0600,$0800,$0A00,$0C00,$0E00                   ;82C0FA;

Duration_Of_L_R_Button_Pressed_Highlight:
; Duration of L/R button pressed highlight
    dw $0005                                                             ;82C10A;

L_R_HighlightAnimationData_PauseScreenPaletteAnimationDelays:            ;82C10C;
; FF = loop to start, else timer (1 byte), unknown (1 byte), spritemap ID (1 byte)
; L/R highlight animation data / pause screen palette animation delays
    db $0F,$00,$00, $03,$01,$00, $03,$02,$00, $03,$03,$00, $03,$04,$00
    db $03,$05,$00, $03,$06,$00, $03,$07,$00, $03,$06,$00, $03,$05,$00
    db $03,$04,$00, $03,$03,$00, $03,$02,$00, $03,$01,$00, $FF

ItemSelector_and_MapScrollArrows:                                        ;82C137;
; Item selector and map scroll arrows
    db $0F,$00,$00, $02,$01,$00, $02,$02,$00, $02,$03,$00, $02,$04,$00
    db $02,$05,$00, $02,$06,$00, $02,$07,$00, $02,$06,$00, $02,$05,$00
    db $02,$04,$00, $02,$03,$00, $02,$02,$00, $02,$01,$00, $FF

UNUSED_Animation_4_82C162:
    db $02,$07,$FF                                                       ;82C162;

ReserveTank_AnimationData:                                               ;82C165;
; Reserve tank animation data
; FF = loop to start, else timer (1 byte), unknown (1 byte)
    db $0F,$00, $02,$01, $02,$02, $02,$03, $02,$04, $02,$05, $02,$06
    db $02,$07, $02,$06, $02,$05, $02,$04, $02,$03, $02,$02, $02,$01
    db $FF

L_R_ButtonPressed_HighlightTable:
  .spritemapID
; L/R button pressed highlight table
;        ________ L button
;       |     ___ R button
;       |    |
    dw $0028,$0029                                                       ;82C182;
  .Xpos:
    dw $0018,$00E8                                                       ;82C186;
  .YposPlus1:
    dw $00D0,$00D0                                                       ;82C18A;

EquipmentScreen_ItemSelectorPositions:
  .pointers
; Pointers to lists of equipment screen item selector positions
    dw EquipmentScreen_ItemSelectorPositions_tanks                       ;82C18E;
    dw EquipmentScreen_ItemSelectorPositions_weapons                     ;82C190;
    dw EquipmentScreen_ItemSelectorPositions_suitsMisc                   ;82C192;
    dw EquipmentScreen_ItemSelectorPositions_boots                       ;82C194;

;        _________ X position
;       |      ___ Y position
;       |     |
  .tanks:                                                                ;82C196;
    dw $001B,$0054 ; Tanks - mode
    dw $001B,$005C ; Tanks - reserve tank

  .weapons                                                               ;82C19E;
    dw $0030,$0084 ; Weapons - charge
    dw $0030,$008C ; Weapons - ice
    dw $0030,$0094 ; Weapons - wave
    dw $0030,$009C ; Weapons - spazer
    dw $0030,$00A4 ; Weapons - plasma

  .suitsMisc:                                                            ;82C1B2;
    dw $00CC,$004C ; Suit/misc - varia suit
    dw $00CC,$0054 ; Suit/misc - gravity suit
    dw $00CC,$006C ; Suit/misc - morph ball
    dw $00CC,$0074 ; Suit/misc - bombs
    dw $00CC,$007C ; Suit/misc - spring ball
    dw $00CC,$0084 ; Suit/misc - screw attack

  .boots:                                                                ;82C1CA;
    dw $00CC,$009C ; Boots - hi-jump boots
    dw $00CC,$00A4 ; Boots - space jump
    dw $00CC,$00AC ; Boots - speed booster

EquipmentScreen_ReserveTank:
  .Xpositions
; Equipment screen reserve tank X positions
    dw $0018,$0020,$0028,$0030,$0038,$0040                               ;82C1D6;

  .Yposition
; Equipment screen reserve tank Y position + 1
    dw $0060                                                             ;82C1E2;

AnimationSpritemapBaseIDPointers:
; Pointers to animation spritemap base IDs (into $82:C569 table)
    dw UNUSED_Animation_0_82C1F6                                         ;82C1E4;
    dw L_R_Highlight_PauseScreenButtonLabelMode                          ;82C1E6;
    dw ItemSelector_EquipmentScreenCategoryIndex                         ;82C1E8;
    dw ItemSelector_EquipmentScreenCategoryIndex_UNUSED_Anim4            ;82C1EA;
    dw ItemSelector_EquipmentScreenCategoryIndex_UNUSED_Anim5            ;82C1EC;
    dw ItemSelector_EquipmentScreenCategoryIndex_upScrollArrow           ;82C1EE;
    dw ItemSelector_EquipmentScreenCategoryIndex_downScrollArrow         ;82C1F0;
    dw ItemSelector_EquipmentScreenCategoryIndex_rightScrollArrow        ;82C1F2;
    dw ItemSelector_EquipmentScreenCategoryIndex_leftScrollArrow         ;82C1F4;

UNUSED_Animation_0_82C1F6:
    dw $0000,$0028,$0029                                                 ;82C1F6;

L_R_Highlight_PauseScreenButtonLabelMode:                                ;82C1FC;
; L/R highlight (pause screen button label mode)
    dw $002A ; 0: Map screen (SAMUS on the right)
    dw $002A ; 1: Unpausing (nothing)
    dw $002A ; 2: Equipment screen (MAP on the left)

ItemSelector_EquipmentScreenCategoryIndex:                               ;82C202;
; Item selector (equipment screen category index)
    dw $0014 ; 0: Tanks
    dw $0015 ; 1: Weapons
    dw $0016 ; 2: Suit
    dw $0016 ; 3: Boots

  .UNUSED_Anim4
    dw $002C                                                             ;82C20A;

  .UNUSED_Anim5
    dw $0013                                                             ;82C20C;

  .upScrollArrow
    dw $0006                                                             ;82C20E;

  .downScrollArrow
    dw $0007                                                             ;82C210;

  .rightScrollArrow
    dw $0004                                                             ;82C212;

  .leftScrollArrow
    dw $0005                                                             ;82C214;

MenuSpritemap_2:
    dw $0001                                                             ;82C216;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $95)

MenuSpritemap_3:
    dw $0001                                                             ;82C21D;
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $95)

MenuSpritemap_1:
    dw $0001                                                             ;82C224;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $94)

MenuSpritemap_0:
    dw $0001                                                             ;82C22B;
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $94)

MenuSpritemap_6_MapScrollingArrow_Up:
    dw $0002                                                             ;82C232;
    %spritemapEntry(0, $1FF, $FC, 1, 1, 3, 2, $9D)
    %spritemapEntry(0, $1F8, $FC, 1, 0, 3, 2, $9D)

MenuSpritemap_7_MapScrollingArrow_Down:
    dw $0002                                                             ;82C23E;
    %spritemapEntry(0, $1FF, $FC, 0, 1, 3, 2, $9D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 2, $9D)

MenuSpritemap_5_MapScrollingArrow_Left:
    dw $0002                                                             ;82C24A;
    %spritemapEntry(0, $1FC, $00, 1, 1, 3, 2, $9E)
    %spritemapEntry(0, $1FC, $F9, 0, 1, 3, 2, $9E)

MenuSpritemap_4_MapScrollingArrow_Right:
    dw $0002                                                             ;82C256;
    %spritemapEntry(0, $1FC, $00, 1, 0, 3, 2, $9E)
    %spritemapEntry(0, $1FC, $F9, 0, 0, 3, 2, $9E)

MenuSpritemap_10:
    dw $0005                                                             ;82C262;
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 0, $97)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $86)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $88)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 0, $77)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $87)

MenuSpritemap_11:
    dw $0005                                                             ;82C27D;
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $8B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 0, $89)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 0, $9A)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $8A)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 0, $7A)

MenuSpritemap_12_FileSelectMapSamusIcon:
    dw $0001                                                             ;82C298;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 7, $89)

MenuSpritemap_14_EquipmentScreenItemSelector_Tanks:
    dw $0001                                                             ;82C29F;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 3, $46)

MenuSpritemap_19:
    dw $0003                                                             ;82C2A6;
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $63)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $B9)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $B8)

MenuSpritemap_15_EquipmentScreenItemSelector_Weapons:
    dw $000C                                                             ;82C2B7;
    %spritemapEntry(0, $10, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $10, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F0, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F8, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $00, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $08, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $18, $04, 0, 0, 3, 2, $5E)
    %spritemapEntry(0, $18, $FC, 0, 0, 3, 2, $5D)
    %spritemapEntry(0, $08, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $00, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 3, 2, $5B)

MenuSpritemap_16_EquipmentScreenItemSelector_SuitMiscBoots:
    dw $0014                                                             ;82C2F5;
    %spritemapEntry(0, $1C, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1C, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $04, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $14, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $0C, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $14, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $0C, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1FC, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1DC, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1E4, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1EC, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1F4, $04, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $24, $04, 0, 0, 3, 2, $5E)
    %spritemapEntry(0, $24, $FC, 0, 0, 3, 2, $5D)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 3, 2, $5C)
    %spritemapEntry(0, $1DC, $FC, 0, 0, 3, 2, $5B)

MenuSpritemap_1B_FullEquipmentScreenReserveTank:
    dw $0001                                                             ;82C35B;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_1C:
    dw $0001                                                             ;82C362;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4D)

MenuSpritemap_1A:
    dw $0001                                                             ;82C369;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4F)

MenuSpritemap_1F_EndOfEquipmentScreenReserveHealthBar:
    dw $0001                                                             ;82C370;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_1D:
    dw $0001                                                             ;82C377;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $4D)

MenuSpritemap_1E:
    dw $0001                                                             ;82C37E;
    %spritemapEntry(0, $1FD, $FC, 0, 0, 3, 7, $1F0)

MenuSpritemap_8_SaveIcon:
    dw $0001                                                             ;82C385;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8D)

MenuSpritemap_9_BossIcon:
    dw $0001                                                             ;82C38C;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8A)

MenuSpritemap_A_EnergyStationIcon:
    dw $0001                                                             ;82C393;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8C)

MenuSpritemap_B_MissileStationIcon:
    dw $0001                                                             ;82C39A;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8B)

MenuSpritemap_4E_MapStationIcon:
    dw $0001                                                             ;82C3A1;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8E)

MenuSpritemap_17_DebugElevatorIcon:
    dw $0001                                                             ;82C3A8;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $8F)

MenuSpritemap_C_DebugSaveIcon:
    dw $0001                                                             ;82C3AF;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F4)

MenuSpritemap_D:
    dw $0001                                                             ;82C3B6;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F1)

MenuSpritemap_E:
    dw $0001                                                             ;82C3BD;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F3)

MenuSpritemap_F:
    dw $0001                                                             ;82C3C4;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F2)

MenuSpritemap_18:
    dw $0001                                                             ;82C3CB;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F6)

MenuSpritemap_Unknown_82C3D2:
    dw $0001                                                             ;82C3D2;
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $1F5)

MenuSpritemap_20_EmptyEquipmentScreenReserveTank:
    dw $0001                                                             ;82C3D9;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4D)

MenuSpritemap_21_EquipmentScreen_1_7_ReserveTank:
    dw $0001                                                             ;82C3E0;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $47)

MenuSpritemap_22_EquipmentScreen_2_7_ReserveTank:
    dw $0001                                                             ;82C3E7;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $48)

MenuSpritemap_23_EquipmentScreen_3_7_ReserveTank:
    dw $0001                                                             ;82C3EE;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $49)

MenuSpritemap_24_EquipmentScreen_4_7_ReserveTank:
    dw $0001                                                             ;82C3F5;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4A)

MenuSpritemap_25_EquipmentScreen_5_7_ReserveTank:
    dw $0001                                                             ;82C3FC;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4B)

MenuSpritemap_26_EquipmentScreen_6_7_ReserveTank:
    dw $0001                                                             ;82C403;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4C)

MenuSpritemap_27_EquipmentScreen_7_7_ReserveTank:
    dw $0001                                                             ;82C40A;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $4E)

MenuSpritemap_4F:
    dw $0001                                                             ;82C411;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $64)

MenuSpritemap_50:
    dw $0001                                                             ;82C418;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $65)

MenuSpritemap_51:
    dw $0001                                                             ;82C41F;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $66)

MenuSpritemap_52:
    dw $0001                                                             ;82C426;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $67)

MenuSpritemap_53:
    dw $0001                                                             ;82C42D;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $68)

MenuSpritemap_54:
    dw $0001                                                             ;82C434;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $69)

MenuSpritemap_55:
    dw $0001                                                             ;82C43B;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6A)

MenuSpritemap_56:
    dw $0001                                                             ;82C442;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6B)

MenuSpritemap_57:
    dw $0001                                                             ;82C449;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6C)

MenuSpritemap_58:
    dw $0001                                                             ;82C450;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6D)

MenuSpritemap_Unknown_82C457:
    dw $0001                                                             ;82C457;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6E)

MenuSpritemap_Unknown_82C45E:
    dw $0001                                                             ;82C45E;
    %spritemapEntry(0, $00, $00, 0, 0, 3, 0, $6F)

MenuSpritemap_2A_L_R_Highlight:
    dw $0008                                                             ;82C465;
    %spritemapEntry(0, $08, $00, 0, 1, 3, 2, $51)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $43)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $43)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 2, $51)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 2, $3D)
    %spritemapEntry(0, $08, $F8, 0, 1, 3, 2, $3C)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 2, $3D)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 2, $3C)

MenuSpritemap_28_LButtonPressedHighlight:
    dw $0003                                                             ;82C48F;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $29)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 2, $2A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 2, $28)

MenuSpritemap_29_RButtonPressedHighlight:
    dw $0003                                                             ;82C4A0;
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 2, $2E)
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 2, $2A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 3, 2, $28)

MenuSpritemap_2B_StartButtonPressedHighlight:
    dw $0008                                                             ;82C4B1;
    %spritemapEntry(0, $08, $00, 0, 0, 3, 2, $C7)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 2, $C6)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 2, $C5)
    %spritemapEntry(0, $1F0, $00, 0, 0, 3, 2, $C4)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 2, $B6)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 2, $B5)
    %spritemapEntry(0, $08, $F8, 0, 1, 3, 2, $B4)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 2, $B4)

MenuSpritemap_59_ElevatorDestination_Crateria:
    dw $0004                                                             ;82C4DB;
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $03)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $02)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $01)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $00)

MenuSpritemap_5A_ElevatorDestination_Brinstar:
    dw $0004                                                             ;82C4F1;
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $07)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $06)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $05)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $04)

MenuSpritemap_5B_ElevatorDestination_Norfair:
    dw $0004                                                             ;82C507;
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $14)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $13)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $12)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $10)

MenuSpritemap_5E_ElevatorDestination_Tourian:
    dw $0004                                                             ;82C51D;
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $32)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $20)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $09)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $08)

MenuSpritemap_5D_ElevatorDestination_Maridia:
    dw $0004                                                             ;82C533;
    %spritemapEntry(0, $10, $F8, 0, 0, 2, 0, $19)
    %spritemapEntry(0, $08, $F8, 0, 0, 2, 0, $18)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $16)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $15)

MenuSpritemap_5C_ElevatorDestination_WreckedShip:
    dw $0006                                                             ;82C549;
    %spritemapEntry(0, $04, $00, 0, 0, 2, 0, $45)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $44)
    %spritemapEntry(0, $0C, $F8, 0, 0, 2, 0, $56)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 0, $55)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 2, 0, $54)
    %spritemapEntry(0, $1F4, $F8, 0, 0, 2, 0, $53)

MenuSpritemap_Pointers:
; Spawned by $81:891F
    dw MenuSpritemap_0                                                   ;82C569;
    dw MenuSpritemap_1                                                   ;82C56B;
    dw MenuSpritemap_2                                                   ;82C56D;
    dw MenuSpritemap_3                                                   ;82C56F;
    dw MenuSpritemap_4_MapScrollingArrow_Right                           ;82C571;
    dw MenuSpritemap_5_MapScrollingArrow_Left                            ;82C573;
    dw MenuSpritemap_6_MapScrollingArrow_Up                              ;82C575;
    dw MenuSpritemap_7_MapScrollingArrow_Down                            ;82C577;
    dw MenuSpritemap_8_SaveIcon                                          ;82C579;
    dw MenuSpritemap_9_BossIcon                                          ;82C57B;
    dw MenuSpritemap_A_EnergyStationIcon                                 ;82C57D;
    dw MenuSpritemap_B_MissileStationIcon                                ;82C57F;
    dw MenuSpritemap_C_DebugSaveIcon                                     ;82C581;
    dw MenuSpritemap_D                                                   ;82C583;
    dw MenuSpritemap_E                                                   ;82C585;
    dw MenuSpritemap_F                                                   ;82C587;
    dw MenuSpritemap_10                                                  ;82C589;
    dw MenuSpritemap_11                                                  ;82C58B;
    dw MenuSpritemap_12_FileSelectMapSamusIcon                           ;82C58D;
    dw MenuSpritemap_1E                                                  ;82C58F;
    dw MenuSpritemap_14_EquipmentScreenItemSelector_Tanks                ;82C591;
    dw MenuSpritemap_15_EquipmentScreenItemSelector_Weapons              ;82C593;
    dw MenuSpritemap_16_EquipmentScreenItemSelector_SuitMiscBoots        ;82C595;
    dw MenuSpritemap_17_DebugElevatorIcon                                ;82C597;
    dw MenuSpritemap_18                                                  ;82C599;
    dw MenuSpritemap_19                                                  ;82C59B;
    dw MenuSpritemap_1A                                                  ;82C59D;
    dw MenuSpritemap_1B_FullEquipmentScreenReserveTank                   ;82C59F;
    dw MenuSpritemap_1C                                                  ;82C5A1;
    dw MenuSpritemap_1F_EndOfEquipmentScreenReserveHealthBar             ;82C5A3;
    dw MenuSpritemap_1D                                                  ;82C5A5;
    dw MenuSpritemap_1A                                                  ;82C5A7;
    dw MenuSpritemap_20_EmptyEquipmentScreenReserveTank                  ;82C5A9;
    dw MenuSpritemap_21_EquipmentScreen_1_7_ReserveTank                  ;82C5AB;
    dw MenuSpritemap_22_EquipmentScreen_2_7_ReserveTank                  ;82C5AD;
    dw MenuSpritemap_23_EquipmentScreen_3_7_ReserveTank                  ;82C5AF;
    dw MenuSpritemap_24_EquipmentScreen_4_7_ReserveTank                  ;82C5B1;
    dw MenuSpritemap_25_EquipmentScreen_5_7_ReserveTank                  ;82C5B3;
    dw MenuSpritemap_26_EquipmentScreen_6_7_ReserveTank                  ;82C5B5;
    dw MenuSpritemap_27_EquipmentScreen_7_7_ReserveTank                  ;82C5B7;
    dw MenuSpritemap_28_LButtonPressedHighlight                          ;82C5B9;
    dw MenuSpritemap_29_RButtonPressedHighlight                          ;82C5BB;
    dw MenuSpritemap_2A_L_R_Highlight                                    ;82C5BD;
    dw MenuSpritemap_2B_StartButtonPressedHighlight                      ;82C5BF;
    dw TitleMenuSpritemaps_2C_FileSelectMenu_SamusHelmet_0               ;82C5C1;
    dw TitleMenuSpritemaps_2D_FileSelectMenu_SamusHelmet_1               ;82C5C3;
    dw TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2               ;82C5C5;
    dw TitleMenuSpritemaps_2F_FileSelectMenu_SamusHelmet_3               ;82C5C7;
    dw TitleMenuSpritemaps_30_FileSelectMenu_SamusHelmet_4               ;82C5C9;
    dw TitleMenuSpritemaps_31_FileSelectMenu_SamusHelmet_5               ;82C5CB;
    dw TitleMenuSpritemaps_32_FileSelectMenu_SamusHelmet_6               ;82C5CD;
    dw TitleMenuSpritemaps_33_FileSelectMenu_SamusHelmet_7               ;82C5CF;
    dw TitleMenuSpritemaps_34_MenuSelectionMissile_0                     ;82C5D1;
    dw TitleMenuSpritemaps_35_MenuSelectionMissile_1                     ;82C5D3;
    dw TitleMenuSpritemaps_36_MenuSelectionMissile_2                     ;82C5D5;
    dw TitleMenuSpritemaps_37_MenuSelectionMissile_3                     ;82C5D7;
    dw TitleMenuSpritemaps_38_AreaSelect_PlanetZebes                     ;82C5D9;
    dw TitleMenuSpritemaps_39_AreaSelect_Crateria                        ;82C5DB;
    dw TitleMenuSpritemaps_3A_AreaSelect_Brinstar                        ;82C5DD;
    dw TitleMenuSpritemaps_3B_AreaSelect_Norfair                         ;82C5DF;
    dw TitleMenuSpritemaps_3C_AreaSelect_WreckedShip                     ;82C5E1;
    dw TitleMenuSpritemaps_3D_AreaSelect_Maridia                         ;82C5E3;
    dw TitleMenuSpritemaps_3E_AreaSelect_Tourian                         ;82C5E5;
    dw TitleMenuSpritemaps_3F_82CD67                                     ;82C5E7;
    dw TitleMenuSpritemaps_40_FileCopyArrow_OneSlotDown                  ;82C5E9;
    dw TitleMenuSpritemaps_41_FileCopyArrow_OneSlotUp                    ;82C5EB;
    dw TitleMenuSpritemaps_42_FileCopyArrow_TwoSlotsDown                 ;82C5ED;
    dw TitleMenuSpritemaps_43_FileCopyArrow_TwoSlotsUp                   ;82C5EF;
    dw TitleMenuSpritemaps_44_82CF3D                                     ;82C5F1;
    dw TitleMenuSpritemaps_45                                            ;82C5F3;
    dw TitleMenuSpritemaps_46                                            ;82C5F5;
    dw TitleMenuSpritemaps_47                                            ;82C5F7;
    dw TitleMenuSpritemaps_48_BorderAround_SAMUS_DATA                    ;82C5F9;
    dw TitleMenuSpritemaps_49_BorderAround_DATA_COPY_MODE                ;82C5FB;
    dw TitleMenuSpritemaps_4A_BorderAround_DATA_CLEAR_MODE               ;82C5FD;
    dw TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE                  ;82C5FF;
    dw TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE       ;82C601;
    dw TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE          ;82C603;
    dw MenuSpritemap_4E_MapStationIcon                                   ;82C605;
    dw MenuSpritemap_4F                                                  ;82C607;
    dw MenuSpritemap_50                                                  ;82C609;
    dw MenuSpritemap_51                                                  ;82C60B;
    dw MenuSpritemap_52                                                  ;82C60D;
    dw MenuSpritemap_53                                                  ;82C60F;
    dw MenuSpritemap_54                                                  ;82C611;
    dw MenuSpritemap_55                                                  ;82C613;
    dw MenuSpritemap_56                                                  ;82C615;
    dw MenuSpritemap_57                                                  ;82C617;
    dw MenuSpritemap_58                                                  ;82C619;
    dw MenuSpritemap_59_ElevatorDestination_Crateria                     ;82C61B;
    dw MenuSpritemap_5A_ElevatorDestination_Brinstar                     ;82C61D;
    dw MenuSpritemap_5B_ElevatorDestination_Norfair                      ;82C61F;
    dw MenuSpritemap_5C_ElevatorDestination_WreckedShip                  ;82C621;
    dw MenuSpritemap_5D_ElevatorDestination_Maridia                      ;82C623;
    dw MenuSpritemap_5E_ElevatorDestination_Tourian                      ;82C625;
    dw TitleMenuSpritemaps_5F_SamusPositionIndicator_0                   ;82C627;
    dw TitleMenuSpritemaps_5F_SamusPositionIndicator_1                   ;82C629;
    dw TitleMenuSpritemaps_5F_SamusPositionIndicator_2                   ;82C62B;
    dw TitleMenuSpritemaps_62_BossCrossOutIcon                           ;82C62D;
    dw TitleMenuSpritemaps_63_GunshipIcon                                ;82C62F;
    dw TitleMenuSpritemaps_64_GameOverBabyMetroidContainer               ;82C631;
    dw TitleMenuSpritemaps_65_GameOverBabyMetroid_0                      ;82C633;
    dw TitleMenuSpritemaps_66_GameOverBabyMetroid_1                      ;82C635;
    dw TitleMenuSpritemaps_67_GameOverBabyMetroid_2                      ;82C637;

Dummy_Samus_Wireframe_Tilemap:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000                   ;82C639;
    dw $25C0,$25C1,$25C2,$25C3,$65C3,$65C2,$65C1,$65C0                   ;82C649;
    dw $25D0,$25D1,$25D2,$25D3,$65D3,$65D2,$65D1,$65D0                   ;82C659;
    dw $25E0,$25E1,$25EF,$25E3,$25E4,$25E5,$25E6,$25E7                   ;82C669;
    dw $25F0,$25F1,$25F2,$25F3,$25F4,$25F5,$65F1,$65F0                   ;82C679;
    dw $2600,$2601,$2602,$2603,$2604,$2605,$6601,$6600                   ;82C689;
    dw $2610,$2611,$2612,$2613,$2614,$2615,$2616,$2617                   ;82C699;
    dw $2620,$2621,$2622,$2623,$2624,$2625,$2626,$2627                   ;82C6A9;
    dw $2630,$2631,$2632,$2633,$6633,$6632,$2636,$2637                   ;82C6B9;
    dw $0000,$25C9,$25CA,$25CB,$65CB,$65CA,$0000,$0000                   ;82C6C9;
    dw $0000,$0000,$25DA,$25DB,$65DB,$65DA,$0000,$0000                   ;82C6D9;
    dw $0000,$25E9,$25EA,$25EB,$65EB,$65EA,$65E9,$0000                   ;82C6E9;
    dw $0000,$25F9,$25FA,$25FB,$65FB,$65FA,$65F9,$0000                   ;82C6F9;
    dw $0000,$2609,$260A,$0000,$0000,$660A,$6609,$0000                   ;82C709;
    dw $0000,$2619,$261A,$0000,$0000,$661A,$6619,$0000                   ;82C719;
    dw $2628,$2629,$262A,$062B,$462B,$662A,$262C,$262D                   ;82C729;
    dw $2638,$2639,$263A,$0000,$0000,$663A,$263C,$6638                   ;82C739;

AreaSelect_SpritemapBaseIndex:
    dw $0038                                                             ;82C749;

UNUSED_DPadIcon_SpritemapIndex:
    dw $0044                                                             ;82C74B;

Map_Elevator_Destinations:
    dw SpritemapIndices_crateria                                         ;82C74D;
    dw SpritemapIndices_brinstar                                         ;82C74F;
    dw SpritemapIndices_norfair                                          ;82C751;
    dw SpritemapIndices_wreckedShip                                      ;82C753;
    dw SpritemapIndices_maridia                                          ;82C755;
    dw SpritemapIndices_tourian                                          ;82C757;

SpritemapIndices:
;        _______________ X position
;       |      _________ Y position
;       |     |      ___ Spritemap index
;       |     |     |
  .crateria                                                              ;82C759;
    dw $0030,$0070,$005A
    dw $00B8,$00B8,$005A
    dw $0110,$0068,$005A
    dw $0178,$0020,$005C
    dw $01A0,$0080,$005D
    dw $FFFF
  .brinstar                                                              ;82C779;
    dw $0048,$0008,$0059
    dw $00D0,$0040,$0059
    dw $0128,$0020,$0059
    dw $0140,$0090,$005D
    dw $0148,$00C0,$005B
    dw $FFFF
  .norfair                                                               ;82C799;
    dw $0050,$0008,$005A
    dw $FFFF
  .wreckedShip                                                           ;82C7A1;
    dw $0040,$0080,$0059
    dw $00C0,$0080,$0059
    dw $FFFF
  .maridia                                                               ;82C7AF;
    dw $0108,$0008,$0059
    dw $0030,$00A0,$005A
    dw $0078,$00A0,$005A
    dw $FFFF
  .tourian                                                               ;82C7C3;
    dw $0098,$0048,$0059
    dw $FFFF

MapIcon_PositionTablePointers:
  .bossIcons
    dw Crateria_MapIconPositions_bossIcons                               ;82C7CB; Crateria
    dw Brinstar_MapIconPositions_bossIcons                               ;82C7CD; Brinstar
    dw Norfair_MapIconPositions_bossIcons                                ;82C7CF; Norfair
    dw WreckedShip_MapIconPositions_bossIcons                            ;82C7D1; Wrecked Ship
    dw Maridia_MapIconPositions_bossIcons                                ;82C7D3; Maridia
    dw $0000                                                             ;82C7D5; Tourian
    dw Ceres_MapIconPositions_bossIcons                                  ;82C7D7; Ceres
    dw $0000                                                             ;82C7D9; Debug

  .missileStations
    dw $0000                                                             ;82C7DB; Crateria
    dw Brinstar_MapIconPositions_missileStations                         ;82C7DD; Brinstar
    dw $0000                                                             ;82C7DF; Norfair
    dw $0000                                                             ;82C7E1; Wrecked Ship
    dw Maridia_MapIconPositions_missileStations                          ;82C7E3; Maridia
    dw $0000                                                             ;82C7E5; Tourian
    dw $0000                                                             ;82C7E7; Ceres
    dw $0000                                                             ;82C7E9; Debug

  .energyStations
    dw $0000                                                             ;82C7EB; Crateria
    dw Brinstar_MapIconPositions_energyStations                          ;82C7ED; Brinstar
    dw Norfair_MapIconPositions_energyStations                           ;82C7EF; Norfair
    dw $0000                                                             ;82C7F1; Wrecked Ship
    dw Maridia_MapIconPositions_energyStations                           ;82C7F3; Maridia
    dw Tourian_MapIconPositions_energyStations                           ;82C7F5; Tourian
    dw $0000                                                             ;82C7F7; Ceres
    dw $0000                                                             ;82C7F9; Debug

  .mapStations
    dw Crateria_MapIconPositions_mapStations                             ;82C7FB; Crateria
    dw Brinstar_MapIconPositions_mapStations                             ;82C7FD; Brinstar
    dw Norfair_MapIconPositions_mapStations                              ;82C7FF; Norfair
    dw WreckedShip_MapIconPositions_mapStations                          ;82C801; Wrecked Ship
    dw Maridia_MapIconPositions_mapStations                              ;82C803; Maridia
    dw Tourian_MapIconPositions_mapStations                              ;82C805; Tourian
    dw $0000                                                             ;82C807; Ceres
    dw $0000                                                             ;82C809; Debug

  .savePoints
    dw Crateria_MapIconPositions_savePoints                              ;82C80B; Crateria
    dw Brinstar_MapIconPositions_savePoints                              ;82C80D; Brinstar
    dw Norfair_MapIconPositions_savePoints                               ;82C80F; Norfair
    dw WreckedShip_MapIconPositions_savePoints                           ;82C811; Wrecked Ship
    dw Maridia_MapIconPositions_savePoints                               ;82C813; Maridia
    dw Tourian_MapIconPositions_savePoints                               ;82C815; Tourian
    dw $0000                                                             ;82C817; Ceres
    dw $0000                                                             ;82C819; Debug

  .debugElevatorMarkers
    dw Crateria_MapIconPositions_debugElevatorMarkers                    ;82C81B; Crateria
    dw Brinstar_MapIconPositions_debugElevatorMarkers                    ;82C81D; Brinstar
    dw Norfair_MapIconPositions_debugElevatorMarkers                     ;82C81F; Norfair
    dw WreckedShip_MapIconPositions_debugElevatorMarkers                 ;82C821; Wrecked Ship
    dw Maridia_MapIconPositions_debugElevatorMarkers                     ;82C823; Maridia
    dw Tourian_MapIconPositions_debugElevatorMarkers                     ;82C825; Tourian
    dw $0000                                                             ;82C827; Ceres
    dw $0000                                                             ;82C829; Debug

  .debugSavePoints
    dw Crateria_MapIconPositions_debugSavePoints                         ;82C82B; Crateria
    dw Brinstar_MapIconPositions_debugSaveStations                       ;82C82D; Brinstar
    dw Norfair_MapIconPositions_debugSavePoints                          ;82C82F; Norfair
    dw WreckedShip_MapIconPositions_debugSavePoints                      ;82C831; Wrecked Ship
    dw Maridia_MapIconPositions_debugSavePoints                          ;82C833; Maridia
    dw Tourian_MapIconPositions_debugSavePoints                          ;82C835; Tourian
    dw $0000                                                             ;82C837; Ceres
    dw $0000                                                             ;82C839; Debug

Crateria_MapIconPositions:
  .bossIcons
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFF                      ;82C83B;
  .missileStations
    dw $FFFF                                                             ;82C849;
  .energyStations
    dw $FFFF                                                             ;82C84B;
  .mapStations
    dw $00B8,$0040, $FFFF                                                ;82C84D;
  .savePoints
    dw $00D8                                                             ;82C853;
  .savePoints2
    dw $0028,$0090, $0038,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C855;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE                      ;82C865;
  .debugElevatorMarkers
    dw $01A0,$0058, $0110,$0040, $00B8,$0090, $0030,$0048                ;82C873;
    dw $0088,$0050, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C883;
  .debugSavePoints
    dw $00D8,$0028, $0188,$0028, $FFFF                                   ;82C893;

Brinstar_MapIconPositions:
  .bossIcons
    dw $01BC,$009C, $FFFF                                                ;82C89D;
  .missileStations
    dw $0028,$0040, $FFFF                                                ;82C8A3;
  .energyStations
    dw $0048,$0068, $0100,$0098, $01B0,$0098, $FFFF                      ;82C8A9;
  .mapStations
    dw $0028,$0028, $FFFF                                                ;82C8B7;
  .savePoints
    dw $0078,$0028, $0040,$0030, $0028,$0060, $0188,$0098                ;82C8BD;
    dw $0130,$0048, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C8CD;
  .debugElevatorMarkers
    dw $0048,$0018, $00D0,$0058, $0128,$0038, $0148,$0098                ;82C8DD;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C8ED;
  .debugSaveStations
    dw $0048,$0018, $01B8,$00A0, $0090,$0020, $FFFF                      ;82C8FD;

Norfair_MapIconPositions:
  .bossIcons
    dw $00B8,$0090, $FFFF                                                ;82C90B;
  .missileStations
    dw $FFFF                                                             ;82C911;
  .energyStations
    dw $00A0,$0050, $00A8,$0080,$FFFF                                    ;82C913;
  .mapStations
    dw $0048,$0028, $FFFF                                                ;82C91D;
  .savePoints
    dw $0060,$0060, $00A8,$0020, $0058,$0030, $0080,$0048                ;82C923;
    dw $00A0,$0058, $0120,$0068, $FFFE,$FFFE, $FFFE,$FFFE                ;82C933;
  .debugElevatorMarkers
    dw $0050,$0018, $00A8,$0058, $00A8,$0070, $FFFE,$FFFE                ;82C943;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C953;
  .debugSavePoints
    dw $0050,$0010, $0078,$0050, $00B0,$0088, $0050,$0058                ;82C963;
    dw $00A8,$0070, $00A0,$0080, $0010,$0008, $FFFF                      ;82C973;

WreckedShip_MapIconPositions:
  .bossIcons
    dw $0098,$00A0, $FFFF                                                ;82C981;
  .missileStations
    dw $FFFF                                                             ;82C987;
  .energyStations
    dw $FFFF                                                             ;82C989;
  .mapStations
    dw $0068,$00A0, $FFFF                                                ;82C98B;
  .savePoints
    dw $0088,$0078, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C991;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C9A1;
  .debugElevatorMarkers
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C9B1;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82C9C1;
  .debugSavePoints
    dw $0050,$0078, $0090,$00A0, $FFFF                                   ;82C9D1;

Maridia_MapIconPositions:
  .bossIcons
    dw $013C,$0054, $FFFF                                                ;82C9DB;
  .missileStations
    dw $0130,$0048, $FFFF                                                ;82C9E1;
  .energyStations
    dw $0150,$0038, $FFFF                                                ;82C9E7;
  .mapStations
    dw $0088,$0090, $FFFF                                                ;82C9ED;
  .savePoints
    dw $0060,$00A0, $0118,$0028, $0098,$0060, $0148,$0038                ;82C9F3;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CA03;
  .debugElevatorMarkers
    dw $0110,$0018, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CA13;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CA23;
  .debugSavePoints
    dw $0090,$0028, $0148,$0050, $00B8,$0048, $00B0,$0088                ;82CA33;
    dw $FFFF                                                             ;82CA43;

Tourian_MapIconPositions:
  .bossIcons
    dw $FFFF                                                             ;82CA45;
  .missileStations
    dw $FFFF                                                             ;82CA47;
  .energyStations
    dw $0058,$0088, $FFFF                                                ;82CA49;
  .mapStations
    dw $FFFF                                                             ;82CA4F;
  .savePoints
    dw $0080,$0090, $00A8,$0068, $FFFE,$FFFE, $FFFE,$FFFE                ;82CA51;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CA61;
  .debugElevatorMarkers
    dw $00A0,$0060, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CA71;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CA81;
  .debugSavePoints
    dw $0088,$0050, $0068,$00C0, $FFFF                                   ;82CA91;

Ceres_MapIconPositions:
  .bossIcons
    dw $00A0,$0088, $FFFF                                                ;82CA9B;
  .missileStations
    dw $FFFF                                                             ;82CAA1;
  .energyStations
    dw $FFFF                                                             ;82CAA3;
  .mapStations
    dw $FFFF                                                             ;82CAA5;
  .savePoints
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CAA7;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CAB7;
  .debugElevatorMarkers
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CAC7;
    dw $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE, $FFFE,$FFFE                ;82CAD7;
  .debugSavePoints
    dw $FFFF                                                             ;82CAE7;

TitleMenuSpritemaps_2C_FileSelectMenu_SamusHelmet_0:
    dw $0004,$C3FC                                                       ;82CAE9;
    db $F4                                                               ;82CAED;
    dw $3ED1,$C3FC                                                       ;82CAEE;
    db $FC                                                               ;82CAF2;
    dw $3EE1,$C3F4                                                       ;82CAF3;
    db $FC                                                               ;82CAF7;
    dw $3EE0,$C3F4                                                       ;82CAF8;
    db $F4                                                               ;82CAFC;
    dw $3ED0                                                             ;82CAFD;

TitleMenuSpritemaps_2D_FileSelectMenu_SamusHelmet_1:
    dw $0004,$C3F4                                                       ;82CAFF;
    db $FC                                                               ;82CB03;
    dw $3EE3,$C3F4                                                       ;82CB04;
    db $F4                                                               ;82CB08;
    dw $3ED3,$C3FC                                                       ;82CB09;
    db $F4                                                               ;82CB0D;
    dw $3ED4,$C3FC                                                       ;82CB0E;
    db $FC                                                               ;82CB12;
    dw $3EE4                                                             ;82CB13;

TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2:
    dw $0004,$C3FC                                                       ;82CB15;
    db $F4                                                               ;82CB19;
    dw $3ED7,$C3F4                                                       ;82CB1A;
    db $F4                                                               ;82CB1E;
    dw $3ED6,$C3F4                                                       ;82CB1F;
    db $FC                                                               ;82CB23;
    dw $3EE6,$C3FC                                                       ;82CB24;
    db $FC                                                               ;82CB28;
    dw $3EE7                                                             ;82CB29;

TitleMenuSpritemaps_2F_FileSelectMenu_SamusHelmet_3:
    dw $0006,$0000                                                       ;82CB2B;
    db $FE                                                               ;82CB2F;
    dw $3EDA,$01F8                                                       ;82CB30;
    db $FE                                                               ;82CB34;
    dw $3ED9,$C3FC                                                       ;82CB35;
    db $F4                                                               ;82CB39;
    dw $3ED7,$C3F4                                                       ;82CB3A;
    db $F4                                                               ;82CB3E;
    dw $3ED6,$C3F4                                                       ;82CB3F;
    db $FC                                                               ;82CB43;
    dw $3EE6,$C3FC                                                       ;82CB44;
    db $FC                                                               ;82CB48;
    dw $3EE7                                                             ;82CB49;

TitleMenuSpritemaps_30_FileSelectMenu_SamusHelmet_4:
    dw $0006,$0000                                                       ;82CB4B;
    db $FE                                                               ;82CB4F;
    dw $3EDC,$01F8                                                       ;82CB50;
    db $FE                                                               ;82CB54;
    dw $3EDB,$C3FC                                                       ;82CB55;
    db $F4                                                               ;82CB59;
    dw $3ED7,$C3F4                                                       ;82CB5A;
    db $F4                                                               ;82CB5E;
    dw $3ED6,$C3F4                                                       ;82CB5F;
    db $FC                                                               ;82CB63;
    dw $3EE6,$C3FC                                                       ;82CB64;
    db $FC                                                               ;82CB68;
    dw $3EE7                                                             ;82CB69;

TitleMenuSpritemaps_31_FileSelectMenu_SamusHelmet_5:
    dw $0006,$0000                                                       ;82CB6B;
    db $FE                                                               ;82CB6F;
    dw $3EDE,$01F8                                                       ;82CB70;
    db $FE                                                               ;82CB74;
    dw $3EDD,$C3FC                                                       ;82CB75;
    db $F4                                                               ;82CB79;
    dw $3ED7,$C3F4                                                       ;82CB7A;
    db $F4                                                               ;82CB7E;
    dw $3ED6,$C3F4                                                       ;82CB7F;
    db $FC                                                               ;82CB83;
    dw $3EE6,$C3FC                                                       ;82CB84;
    db $FC                                                               ;82CB88;
    dw $3EE7                                                             ;82CB89;

TitleMenuSpritemaps_32_FileSelectMenu_SamusHelmet_6:
    dw $0006,$0000                                                       ;82CB8B;
    db $FE                                                               ;82CB8F;
    dw $3EEA,$01F8                                                       ;82CB90;
    db $FE                                                               ;82CB94;
    dw $3EE9,$C3FC                                                       ;82CB95;
    db $F4                                                               ;82CB99;
    dw $3ED7,$C3F4                                                       ;82CB9A;
    db $F4                                                               ;82CB9E;
    dw $3ED6,$C3F4                                                       ;82CB9F;
    db $FC                                                               ;82CBA3;
    dw $3EE6,$C3FC                                                       ;82CBA4;
    db $FC                                                               ;82CBA8;
    dw $3EE7                                                             ;82CBA9;

TitleMenuSpritemaps_33_FileSelectMenu_SamusHelmet_7:
    dw $0006,$0000                                                       ;82CBAB;
    db $FE                                                               ;82CBAF;
    dw $3EEC,$01F8                                                       ;82CBB0;
    db $FE                                                               ;82CBB4;
    dw $3EEB,$C3FC                                                       ;82CBB5;
    db $F4                                                               ;82CBB9;
    dw $3ED7,$C3F4                                                       ;82CBBA;
    db $F4                                                               ;82CBBE;
    dw $3ED6,$C3F4                                                       ;82CBBF;
    db $FC                                                               ;82CBC3;
    dw $3EE6,$C3FC                                                       ;82CBC4;
    db $FC                                                               ;82CBC8;
    dw $3EE7                                                             ;82CBC9;

TitleMenuSpritemaps_34_MenuSelectionMissile_0:
    dw $0002,$0000                                                       ;82CBCB;
    db $FC                                                               ;82CBCF;
    dw $3EEF,$01F8                                                       ;82CBD0;
    db $FC                                                               ;82CBD4;
    dw $3EDF                                                             ;82CBD5;

TitleMenuSpritemaps_35_MenuSelectionMissile_1:
    dw $0002,$0000                                                       ;82CBD7;
    db $FC                                                               ;82CBDB;
    dw $3EFF,$01F8                                                       ;82CBDC;
    db $FC                                                               ;82CBE0;
    dw $3EEE                                                             ;82CBE1;

TitleMenuSpritemaps_36_MenuSelectionMissile_2:
    dw $0002,$0000                                                       ;82CBE3;
    db $FC                                                               ;82CBE7;
    dw $3ECC,$01F8                                                       ;82CBE8;
    db $FC                                                               ;82CBEC;
    dw $3EFE                                                             ;82CBED;

TitleMenuSpritemaps_37_MenuSelectionMissile_3:
    dw $0002,$01F8                                                       ;82CBEF;
    db $FC                                                               ;82CBF3;
    dw $3EC8,$0000                                                       ;82CBF4;
    db $FC                                                               ;82CBF8;
    dw $3EFF                                                             ;82CBF9;

TitleMenuSpritemaps_38_AreaSelect_PlanetZebes:
    dw $0016,$0028                                                       ;82CBFB;
    db $00                                                               ;82CBFF;
    dw $303B,$0028                                                       ;82CC00;
    db $F8                                                               ;82CC04;
    dw $302B,$0020                                                       ;82CC05;
    db $00                                                               ;82CC09;
    dw $301E,$0020                                                       ;82CC0A;
    db $F8                                                               ;82CC0E;
    dw $300E,$0018                                                       ;82CC0F;
    db $00                                                               ;82CC13;
    dw $301B,$0018                                                       ;82CC14;
    db $F8                                                               ;82CC18;
    dw $300B,$0010                                                       ;82CC19;
    db $00                                                               ;82CC1D;
    dw $301E,$0010                                                       ;82CC1E;
    db $F8                                                               ;82CC22;
    dw $300E,$0008                                                       ;82CC23;
    db $00                                                               ;82CC27;
    dw $3052,$0008                                                       ;82CC28;
    db $F8                                                               ;82CC2C;
    dw $3042,$01F8                                                       ;82CC2D;
    db $00                                                               ;82CC31;
    dw $3011,$01F8                                                       ;82CC32;
    db $F8                                                               ;82CC36;
    dw $302C,$01F0                                                       ;82CC37;
    db $00                                                               ;82CC3B;
    dw $301E,$01F0                                                       ;82CC3C;
    db $F8                                                               ;82CC40;
    dw $300E,$01E8                                                       ;82CC41;
    db $00                                                               ;82CC45;
    dw $3037,$01E8                                                       ;82CC46;
    db $F8                                                               ;82CC4A;
    dw $3027,$01E0                                                       ;82CC4B;
    db $00                                                               ;82CC4F;
    dw $301A,$01E0                                                       ;82CC50;
    db $F8                                                               ;82CC54;
    dw $300A,$01D8                                                       ;82CC55;
    db $00                                                               ;82CC59;
    dw $3035,$01D8                                                       ;82CC5A;
    db $F8                                                               ;82CC5E;
    dw $3025,$01D0                                                       ;82CC5F;
    db $F8                                                               ;82CC63;
    dw $300D,$01D0                                                       ;82CC64;
    db $00                                                               ;82CC68;
    dw $3038                                                             ;82CC69;

TitleMenuSpritemaps_39_AreaSelect_Crateria:
    dw $0008,$0017                                                       ;82CC6B;
    db $FC                                                               ;82CC6F;
    dw $306A,$0010                                                       ;82CC70;
    db $FC                                                               ;82CC74;
    dw $3072,$000A                                                       ;82CC75;
    db $FC                                                               ;82CC79;
    dw $307B,$0002                                                       ;82CC7A;
    db $FC                                                               ;82CC7E;
    dw $306E,$01FA                                                       ;82CC7F;
    db $FC                                                               ;82CC83;
    dw $307D,$01F2                                                       ;82CC84;
    db $FC                                                               ;82CC88;
    dw $306A,$01EA                                                       ;82CC89;
    db $FC                                                               ;82CC8D;
    dw $307B,$01E2                                                       ;82CC8E;
    db $FC                                                               ;82CC92;
    dw $306C                                                             ;82CC93;

TitleMenuSpritemaps_3A_AreaSelect_Brinstar:
    dw $0008,$0017                                                       ;82CC95;
    db $FC                                                               ;82CC99;
    dw $307B,$000E                                                       ;82CC9A;
    db $FC                                                               ;82CC9E;
    dw $306A,$0007                                                       ;82CC9F;
    db $FC                                                               ;82CCA3;
    dw $307D,$01FF                                                       ;82CCA4;
    db $FC                                                               ;82CCA8;
    dw $307C,$01F7                                                       ;82CCA9;
    db $FC                                                               ;82CCAD;
    dw $3077,$01EF                                                       ;82CCAE;
    db $FC                                                               ;82CCB2;
    dw $3072,$01E9                                                       ;82CCB3;
    db $FC                                                               ;82CCB7;
    dw $307B,$01E1                                                       ;82CCB8;
    db $FC                                                               ;82CCBC;
    dw $306B                                                             ;82CCBD;

TitleMenuSpritemaps_3B_AreaSelect_Norfair:
    dw $0007,$0014                                                       ;82CCBF;
    db $FC                                                               ;82CCC3;
    dw $307B,$000C                                                       ;82CCC4;
    db $FC                                                               ;82CCC8;
    dw $3072,$0005                                                       ;82CCC9;
    db $FC                                                               ;82CCCD;
    dw $306A,$01FD                                                       ;82CCCE;
    db $FC                                                               ;82CCD2;
    dw $306F,$01F5                                                       ;82CCD3;
    db $FC                                                               ;82CCD7;
    dw $307B,$01ED                                                       ;82CCD8;
    db $FC                                                               ;82CCDC;
    dw $3078,$01E5                                                       ;82CCDD;
    db $FC                                                               ;82CCE1;
    dw $3077                                                             ;82CCE2;

TitleMenuSpritemaps_3E_AreaSelect_Tourian:
    dw $0007,$0013                                                       ;82CCE4;
    db $FC                                                               ;82CCE8;
    dw $3077,$000A                                                       ;82CCE9;
    db $FC                                                               ;82CCED;
    dw $306A,$0003                                                       ;82CCEE;
    db $FC                                                               ;82CCF2;
    dw $3072,$01FD                                                       ;82CCF3;
    db $FC                                                               ;82CCF7;
    dw $307B,$01F5                                                       ;82CCF8;
    db $FC                                                               ;82CCFC;
    dw $307E,$01ED                                                       ;82CCFD;
    db $FC                                                               ;82CD01;
    dw $3078,$01E6                                                       ;82CD02;
    db $FC                                                               ;82CD06;
    dw $307D                                                             ;82CD07;

TitleMenuSpritemaps_3D_AreaSelect_Maridia:
    dw $0007,$0013                                                       ;82CD09;
    db $FC                                                               ;82CD0D;
    dw $306A,$000B                                                       ;82CD0E;
    db $FC                                                               ;82CD12;
    dw $3072,$0004                                                       ;82CD13;
    db $FC                                                               ;82CD17;
    dw $306D,$01FC                                                       ;82CD18;
    db $FC                                                               ;82CD1C;
    dw $3072,$01F6                                                       ;82CD1D;
    db $FC                                                               ;82CD21;
    dw $307B,$01EE                                                       ;82CD22;
    db $FC                                                               ;82CD26;
    dw $306A,$01E6                                                       ;82CD27;
    db $FC                                                               ;82CD2B;
    dw $3076                                                             ;82CD2C;

TitleMenuSpritemaps_3C_AreaSelect_WreckedShip:
    dw $000B,$0018                                                       ;82CD2E;
    db $00                                                               ;82CD32;
    dw $3079,$0010                                                       ;82CD33;
    db $00                                                               ;82CD37;
    dw $3072,$0009                                                       ;82CD38;
    db $00                                                               ;82CD3C;
    dw $3071,$0001                                                       ;82CD3D;
    db $00                                                               ;82CD41;
    dw $307C,$0010                                                       ;82CD42;
    db $F8                                                               ;82CD46;
    dw $306D,$0008                                                       ;82CD47;
    db $F8                                                               ;82CD4B;
    dw $306E,$0000                                                       ;82CD4C;
    db $F8                                                               ;82CD50;
    dw $3074,$01F8                                                       ;82CD51;
    db $F8                                                               ;82CD55;
    dw $306C,$01F0                                                       ;82CD56;
    db $F8                                                               ;82CD5A;
    dw $306E,$01E8                                                       ;82CD5B;
    db $F8                                                               ;82CD5F;
    dw $307B,$01E0                                                       ;82CD60;
    db $F8                                                               ;82CD64;
    dw $3080                                                             ;82CD65;

TitleMenuSpritemaps_3F_82CD67:
    dw $0014,$0010                                                       ;82CD67;
    db $08                                                               ;82CD6B;
    dw $3EFA,$0008                                                       ;82CD6C;
    db $08                                                               ;82CD70;
    dw $3EFA,$0000                                                       ;82CD71;
    db $08                                                               ;82CD75;
    dw $3EFA,$01F8                                                       ;82CD76;
    db $08                                                               ;82CD7A;
    dw $3EFA,$01F0                                                       ;82CD7B;
    db $08                                                               ;82CD7F;
    dw $3EFA,$01E8                                                       ;82CD80;
    db $08                                                               ;82CD84;
    dw $3EFA,$0010                                                       ;82CD85;
    db $F0                                                               ;82CD89;
    dw $3EFA,$0008                                                       ;82CD8A;
    db $F0                                                               ;82CD8E;
    dw $3EFA,$0000                                                       ;82CD8F;
    db $F0                                                               ;82CD93;
    dw $3EFA,$01F8                                                       ;82CD94;
    db $F0                                                               ;82CD98;
    dw $3EFA,$01F0                                                       ;82CD99;
    db $F0                                                               ;82CD9D;
    dw $3EFA,$01E8                                                       ;82CD9E;
    db $F0                                                               ;82CDA2;
    dw $3EFA,$01E0                                                       ;82CDA3;
    db $00                                                               ;82CDA7;
    dw $3EED,$01E0                                                       ;82CDA8;
    db $F8                                                               ;82CDAC;
    dw $3EED,$0018                                                       ;82CDAD;
    db $00                                                               ;82CDB1;
    dw $3EED,$0018                                                       ;82CDB2;
    db $F8                                                               ;82CDB6;
    dw $3EED,$0018                                                       ;82CDB7;
    db $08                                                               ;82CDBB;
    dw $3EFD,$01E0                                                       ;82CDBC;
    db $08                                                               ;82CDC0;
    dw $3EFC,$0018                                                       ;82CDC1;
    db $F0                                                               ;82CDC5;
    dw $3EFB,$01E0                                                       ;82CDC6;
    db $F0                                                               ;82CDCA;
    dw $3EF9                                                             ;82CDCB;

TitleMenuSpritemaps_40_FileCopyArrow_OneSlotDown:
    dw $000E,$0002                                                       ;82CDCD;
    db $F0                                                               ;82CDD1;
    dw $32CF,$01FA                                                       ;82CDD2;
    db $F0                                                               ;82CDD6;
    dw $32CE,$0002                                                       ;82CDD7;
    db $E8                                                               ;82CDDB;
    dw $32BF,$01FA                                                       ;82CDDC;
    db $E8                                                               ;82CDE0;
    dw $32BE,$01FA                                                       ;82CDE1;
    db $08                                                               ;82CDE5;
    dw $32B9,$01FA                                                       ;82CDE6;
    db $10                                                               ;82CDEA;
    dw $32C9,$0002                                                       ;82CDEB;
    db $10                                                               ;82CDEF;
    dw $32CB,$0002                                                       ;82CDF0;
    db $08                                                               ;82CDF4;
    dw $32BB,$01F2                                                       ;82CDF5;
    db $08                                                               ;82CDF9;
    dw $32B8,$01F2                                                       ;82CDFA;
    db $00                                                               ;82CDFE;
    dw $32BC,$01FA                                                       ;82CDFF;
    db $00                                                               ;82CE03;
    dw $32BD,$01F2                                                       ;82CE04;
    db $F0                                                               ;82CE08;
    dw $32CD,$01FA                                                       ;82CE09;
    db $F8                                                               ;82CE0D;
    dw $32BD,$01F2                                                       ;82CE0E;
    db $F8                                                               ;82CE12;
    dw $32BC                                                             ;82CE13;

TitleMenuSpritemaps_41_FileCopyArrow_OneSlotUp:
    dw $000E,$01F2                                                       ;82CE15;
    db $F0                                                               ;82CE19;
    dw $B2B8,$01F2                                                       ;82CE1A;
    db $F8                                                               ;82CE1E;
    dw $B2BC,$01FA                                                       ;82CE1F;
    db $F8                                                               ;82CE23;
    dw $B2BD,$01FA                                                       ;82CE24;
    db $E8                                                               ;82CE28;
    dw $B2C9,$01FA                                                       ;82CE29;
    db $F0                                                               ;82CE2D;
    dw $B2B9,$0002                                                       ;82CE2E;
    db $08                                                               ;82CE32;
    dw $B2CF,$01FA                                                       ;82CE33;
    db $08                                                               ;82CE37;
    dw $B2CE,$0002                                                       ;82CE38;
    db $10                                                               ;82CE3C;
    dw $B2BF,$01FA                                                       ;82CE3D;
    db $10                                                               ;82CE41;
    dw $B2BE,$01F2                                                       ;82CE42;
    db $08                                                               ;82CE46;
    dw $B2CD,$01FA                                                       ;82CE47;
    db $00                                                               ;82CE4B;
    dw $B2BD,$01F2                                                       ;82CE4C;
    db $00                                                               ;82CE50;
    dw $B2BC,$0002                                                       ;82CE51;
    db $E8                                                               ;82CE55;
    dw $B2CB,$0002                                                       ;82CE56;
    db $F0                                                               ;82CE5A;
    dw $B2BB                                                             ;82CE5B;

TitleMenuSpritemaps_42_FileCopyArrow_TwoSlotsDown:
    dw $0016,$01FA                                                       ;82CE5D;
    db $08                                                               ;82CE61;
    dw $32BD,$01F2                                                       ;82CE62;
    db $08                                                               ;82CE66;
    dw $32BC,$01FA                                                       ;82CE67;
    db $00                                                               ;82CE6B;
    dw $32BD,$01F2                                                       ;82CE6C;
    db $00                                                               ;82CE70;
    dw $32BC,$01FA                                                       ;82CE71;
    db $F8                                                               ;82CE75;
    dw $32BD,$01F2                                                       ;82CE76;
    db $F8                                                               ;82CE7A;
    dw $32BC,$01FA                                                       ;82CE7B;
    db $F0                                                               ;82CE7F;
    dw $32BD,$01F2                                                       ;82CE80;
    db $F0                                                               ;82CE84;
    dw $32BC,$01F2                                                       ;82CE85;
    db $18                                                               ;82CE89;
    dw $32B8,$01F2                                                       ;82CE8A;
    db $10                                                               ;82CE8E;
    dw $32BC,$01FA                                                       ;82CE8F;
    db $10                                                               ;82CE93;
    dw $32BD,$01FA                                                       ;82CE94;
    db $20                                                               ;82CE98;
    dw $32C9,$01FA                                                       ;82CE99;
    db $18                                                               ;82CE9D;
    dw $32B9,$0002                                                       ;82CE9E;
    db $E0                                                               ;82CEA2;
    dw $32CF,$01FA                                                       ;82CEA3;
    db $E0                                                               ;82CEA7;
    dw $32CE,$0002                                                       ;82CEA8;
    db $D8                                                               ;82CEAC;
    dw $32BF,$01FA                                                       ;82CEAD;
    db $D8                                                               ;82CEB1;
    dw $32BE,$01F2                                                       ;82CEB2;
    db $E0                                                               ;82CEB6;
    dw $32CD,$01FA                                                       ;82CEB7;
    db $E8                                                               ;82CEBB;
    dw $32BD,$01F2                                                       ;82CEBC;
    db $E8                                                               ;82CEC0;
    dw $32BC,$0002                                                       ;82CEC1;
    db $20                                                               ;82CEC5;
    dw $32CB,$0002                                                       ;82CEC6;
    db $18                                                               ;82CECA;
    dw $32BB                                                             ;82CECB;

TitleMenuSpritemaps_43_FileCopyArrow_TwoSlotsUp:
    dw $0016,$01FA                                                       ;82CECD;
    db $F0                                                               ;82CED1;
    dw $B2BD,$01F2                                                       ;82CED2;
    db $F0                                                               ;82CED6;
    dw $B2BC,$01FA                                                       ;82CED7;
    db $F8                                                               ;82CEDB;
    dw $B2BD,$01F2                                                       ;82CEDC;
    db $F8                                                               ;82CEE0;
    dw $B2BC,$01FA                                                       ;82CEE1;
    db $00                                                               ;82CEE5;
    dw $B2BD,$01F2                                                       ;82CEE6;
    db $00                                                               ;82CEEA;
    dw $B2BC,$01FA                                                       ;82CEEB;
    db $08                                                               ;82CEEF;
    dw $B2BD,$01F2                                                       ;82CEF0;
    db $08                                                               ;82CEF4;
    dw $B2BC,$01F2                                                       ;82CEF5;
    db $E0                                                               ;82CEF9;
    dw $B2B8,$01F2                                                       ;82CEFA;
    db $E8                                                               ;82CEFE;
    dw $B2BC,$01FA                                                       ;82CEFF;
    db $E8                                                               ;82CF03;
    dw $B2BD,$01FA                                                       ;82CF04;
    db $D8                                                               ;82CF08;
    dw $B2C9,$01FA                                                       ;82CF09;
    db $E0                                                               ;82CF0D;
    dw $B2B9,$0002                                                       ;82CF0E;
    db $18                                                               ;82CF12;
    dw $B2CF,$01FA                                                       ;82CF13;
    db $18                                                               ;82CF17;
    dw $B2CE,$0002                                                       ;82CF18;
    db $20                                                               ;82CF1C;
    dw $B2BF,$01FA                                                       ;82CF1D;
    db $20                                                               ;82CF21;
    dw $B2BE,$01F2                                                       ;82CF22;
    db $18                                                               ;82CF26;
    dw $B2CD,$01FA                                                       ;82CF27;
    db $10                                                               ;82CF2B;
    dw $B2BD,$01F2                                                       ;82CF2C;
    db $10                                                               ;82CF30;
    dw $B2BC,$0002                                                       ;82CF31;
    db $D8                                                               ;82CF35;
    dw $B2CB,$0002                                                       ;82CF36;
    db $E0                                                               ;82CF3A;
    dw $B2BB                                                             ;82CF3B;

TitleMenuSpritemaps_44_82CF3D:
    dw $0004,$01FF                                                       ;82CF3D;
    db $FF                                                               ;82CF41;
    dw $F0B3,$01F8                                                       ;82CF42;
    db $FF                                                               ;82CF46;
    dw $B0B3,$01FF                                                       ;82CF47;
    db $F8                                                               ;82CF4B;
    dw $70B3,$01F8                                                       ;82CF4C;
    db $F8                                                               ;82CF50;
    dw $30B3                                                             ;82CF51;

TitleMenuSpritemaps_45:
    dw $0002,$C3F4                                                       ;82CF53;
    db $F8                                                               ;82CF57;
    dw $3095,$C3FC                                                       ;82CF58;
    db $F8                                                               ;82CF5C;
    dw $3096                                                             ;82CF5D;

TitleMenuSpritemaps_46:
    dw $0001,$C3F8                                                       ;82CF5F;
    db $F8                                                               ;82CF63;
    dw $3091                                                             ;82CF64;

TitleMenuSpritemaps_47:
    dw $0004,$0000                                                       ;82CF66;
    db $00                                                               ;82CF6A;
    dw $70A0,$0000                                                       ;82CF6B;
    db $F8                                                               ;82CF6F;
    dw $7090,$01F8                                                       ;82CF70;
    db $00                                                               ;82CF74;
    dw $30A0,$01F8                                                       ;82CF75;
    db $F8                                                               ;82CF79;
    dw $3090                                                             ;82CF7A;

TitleMenuSpritemaps_5F_SamusPositionIndicator_0:
    dw $0004,$0004                                                       ;82CF7C;
    db $04                                                               ;82CF80;
    dw $EEAF,$01FC                                                       ;82CF81;
    db $04                                                               ;82CF85;
    dw $AEAF,$0004                                                       ;82CF86;
    db $FC                                                               ;82CF8A;
    dw $6EAF,$01FC                                                       ;82CF8B;
    db $FC                                                               ;82CF8F;
    dw $2EAF                                                             ;82CF90;

TitleMenuSpritemaps_5F_SamusPositionIndicator_1:
    dw $0004,$0005                                                       ;82CF92;
    db $05                                                               ;82CF96;
    dw $EEAF,$01FB                                                       ;82CF97;
    db $05                                                               ;82CF9B;
    dw $AEAF,$0005                                                       ;82CF9C;
    db $FB                                                               ;82CFA0;
    dw $6EAF,$01FB                                                       ;82CFA1;
    db $FB                                                               ;82CFA5;
    dw $2EAF                                                             ;82CFA6;

TitleMenuSpritemaps_5F_SamusPositionIndicator_2:
    dw $0004,$0006                                                       ;82CFA8;
    db $06                                                               ;82CFAC;
    dw $EEAF,$01FA                                                       ;82CFAD;
    db $06                                                               ;82CFB1;
    dw $AEAF,$0006                                                       ;82CFB2;
    db $FA                                                               ;82CFB6;
    dw $6EAF,$01FA                                                       ;82CFB7;
    db $FA                                                               ;82CFBB;
    dw $2EAF                                                             ;82CFBC;

TitleMenuSpritemaps_62_BossCrossOutIcon:
    dw $0004,$0003                                                       ;82CFBE;
    db $04                                                               ;82CFC2;
    dw $EE9F,$0003                                                       ;82CFC3;
    db $FC                                                               ;82CFC7;
    dw $6E9F,$01FC                                                       ;82CFC8;
    db $04                                                               ;82CFCC;
    dw $AE9F,$01FC                                                       ;82CFCD;
    db $FC                                                               ;82CFD1;
    dw $2E9F                                                             ;82CFD2;

TitleMenuSpritemaps_63_GunshipIcon:
    dw $0002,$0004                                                       ;82CFD4;
    db $FE                                                               ;82CFD8;
    dw $6E8F,$01FC                                                       ;82CFD9;
    db $FE                                                               ;82CFDD;
    dw $2E8F                                                             ;82CFDE;

TitleMenuSpritemaps_64_GameOverBabyMetroidContainer:
    dw $0004,$0000                                                       ;82CFE0;
    db $08                                                               ;82CFE4;
    dw $FA9A,$01F8                                                       ;82CFE5;
    db $08                                                               ;82CFE9;
    dw $BA9A,$0000                                                       ;82CFEA;
    db $F0                                                               ;82CFEE;
    dw $7A9A,$01F8                                                       ;82CFEF;
    db $F0                                                               ;82CFF3;
    dw $3A9A                                                             ;82CFF4;

TitleMenuSpritemaps_65_GameOverBabyMetroid_0:
    dw $0001,$C3F8                                                       ;82CFF6;
    db $F8                                                               ;82CFFA;
    dw $3890                                                             ;82CFFB;

TitleMenuSpritemaps_66_GameOverBabyMetroid_1:
    dw $0001,$C3F8                                                       ;82CFFD;
    db $F8                                                               ;82D001;
    dw $3892                                                             ;82D002;

TitleMenuSpritemaps_67_GameOverBabyMetroid_2:
    dw $0001,$C3F8                                                       ;82D004;
    db $F8                                                               ;82D008;
    dw $389B                                                             ;82D009;

TitleMenuSpritemaps_48_BorderAround_SAMUS_DATA:
    dw $0020,$01C8                                                       ;82D00B;
    db $00                                                               ;82D00F;
    dw $3EED,$01C8                                                       ;82D010;
    db $F8                                                               ;82D014;
    dw $3EED,$0030                                                       ;82D015;
    db $00                                                               ;82D019;
    dw $3EED,$0030                                                       ;82D01A;
    db $F8                                                               ;82D01E;
    dw $3EED,$0030                                                       ;82D01F;
    db $08                                                               ;82D023;
    dw $3EFD,$01C8                                                       ;82D024;
    db $08                                                               ;82D028;
    dw $3EFC,$0030                                                       ;82D029;
    db $F0                                                               ;82D02D;
    dw $3EFB,$01C8                                                       ;82D02E;
    db $F0                                                               ;82D032;
    dw $3EF9,$01F8                                                       ;82D033;
    db $08                                                               ;82D037;
    dw $3EFA,$01F0                                                       ;82D038;
    db $08                                                               ;82D03C;
    dw $3EFA,$01E8                                                       ;82D03D;
    db $08                                                               ;82D041;
    dw $3EFA,$01E0                                                       ;82D042;
    db $08                                                               ;82D046;
    dw $3EFA,$01D8                                                       ;82D047;
    db $08                                                               ;82D04B;
    dw $3EFA,$01D0                                                       ;82D04C;
    db $08                                                               ;82D050;
    dw $3EFA,$0028                                                       ;82D051;
    db $08                                                               ;82D055;
    dw $3EFA,$0020                                                       ;82D056;
    db $08                                                               ;82D05A;
    dw $3EFA,$0018                                                       ;82D05B;
    db $08                                                               ;82D05F;
    dw $3EFA,$0010                                                       ;82D060;
    db $08                                                               ;82D064;
    dw $3EFA,$0008                                                       ;82D065;
    db $08                                                               ;82D069;
    dw $3EFA,$0000                                                       ;82D06A;
    db $08                                                               ;82D06E;
    dw $3EFA,$0028                                                       ;82D06F;
    db $F0                                                               ;82D073;
    dw $3EFA,$0020                                                       ;82D074;
    db $F0                                                               ;82D078;
    dw $3EFA,$0018                                                       ;82D079;
    db $F0                                                               ;82D07D;
    dw $3EFA,$0010                                                       ;82D07E;
    db $F0                                                               ;82D082;
    dw $3EFA,$0008                                                       ;82D083;
    db $F0                                                               ;82D087;
    dw $3EFA,$0000                                                       ;82D088;
    db $F0                                                               ;82D08C;
    dw $3EFA,$01F8                                                       ;82D08D;
    db $F0                                                               ;82D091;
    dw $3EFA,$01F0                                                       ;82D092;
    db $F0                                                               ;82D096;
    dw $3EFA,$01E8                                                       ;82D097;
    db $F0                                                               ;82D09B;
    dw $3EFA,$01E0                                                       ;82D09C;
    db $F0                                                               ;82D0A0;
    dw $3EFA,$01D8                                                       ;82D0A1;
    db $F0                                                               ;82D0A5;
    dw $3EFA,$01D0                                                       ;82D0A6;
    db $F0                                                               ;82D0AA;
    dw $3EFA                                                             ;82D0AB;

TitleMenuSpritemaps_49_BorderAround_DATA_COPY_MODE:
    dw $0028,$0000                                                       ;82D0AD;
    db $08                                                               ;82D0B1;
    dw $3EFA,$0008                                                       ;82D0B2;
    db $08                                                               ;82D0B6;
    dw $3EFA,$01F0                                                       ;82D0B7;
    db $08                                                               ;82D0BB;
    dw $3EFA,$01F8                                                       ;82D0BC;
    db $08                                                               ;82D0C0;
    dw $3EFA,$0000                                                       ;82D0C1;
    db $F0                                                               ;82D0C5;
    dw $3EFA,$0008                                                       ;82D0C6;
    db $F0                                                               ;82D0CA;
    dw $3EFA,$01F0                                                       ;82D0CB;
    db $F0                                                               ;82D0CF;
    dw $3EFA,$01F8                                                       ;82D0D0;
    db $F0                                                               ;82D0D4;
    dw $3EFA,$01B8                                                       ;82D0D5;
    db $00                                                               ;82D0D9;
    dw $3EED,$01B8                                                       ;82D0DA;
    db $F8                                                               ;82D0DE;
    dw $3EED,$0040                                                       ;82D0DF;
    db $00                                                               ;82D0E3;
    dw $3EED,$0040                                                       ;82D0E4;
    db $F8                                                               ;82D0E8;
    dw $3EED,$0040                                                       ;82D0E9;
    db $08                                                               ;82D0ED;
    dw $3EFD,$01B8                                                       ;82D0EE;
    db $08                                                               ;82D0F2;
    dw $3EFC,$0040                                                       ;82D0F3;
    db $F0                                                               ;82D0F7;
    dw $3EFB,$01B8                                                       ;82D0F8;
    db $F0                                                               ;82D0FC;
    dw $3EF9,$01E8                                                       ;82D0FD;
    db $08                                                               ;82D101;
    dw $3EFA,$01E0                                                       ;82D102;
    db $08                                                               ;82D106;
    dw $3EFA,$01D8                                                       ;82D107;
    db $08                                                               ;82D10B;
    dw $3EFA,$01D0                                                       ;82D10C;
    db $08                                                               ;82D110;
    dw $3EFA,$01C8                                                       ;82D111;
    db $08                                                               ;82D115;
    dw $3EFA,$01C0                                                       ;82D116;
    db $08                                                               ;82D11A;
    dw $3EFA,$0038                                                       ;82D11B;
    db $08                                                               ;82D11F;
    dw $3EFA,$0030                                                       ;82D120;
    db $08                                                               ;82D124;
    dw $3EFA,$0028                                                       ;82D125;
    db $08                                                               ;82D129;
    dw $3EFA,$0020                                                       ;82D12A;
    db $08                                                               ;82D12E;
    dw $3EFA,$0018                                                       ;82D12F;
    db $08                                                               ;82D133;
    dw $3EFA,$0010                                                       ;82D134;
    db $08                                                               ;82D138;
    dw $3EFA,$0038                                                       ;82D139;
    db $F0                                                               ;82D13D;
    dw $3EFA,$0030                                                       ;82D13E;
    db $F0                                                               ;82D142;
    dw $3EFA,$0028                                                       ;82D143;
    db $F0                                                               ;82D147;
    dw $3EFA,$0020                                                       ;82D148;
    db $F0                                                               ;82D14C;
    dw $3EFA,$0018                                                       ;82D14D;
    db $F0                                                               ;82D151;
    dw $3EFA,$0010                                                       ;82D152;
    db $F0                                                               ;82D156;
    dw $3EFA,$01E8                                                       ;82D157;
    db $F0                                                               ;82D15B;
    dw $3EFA,$01E0                                                       ;82D15C;
    db $F0                                                               ;82D160;
    dw $3EFA,$01D8                                                       ;82D161;
    db $F0                                                               ;82D165;
    dw $3EFA,$01D0                                                       ;82D166;
    db $F0                                                               ;82D16A;
    dw $3EFA,$01C8                                                       ;82D16B;
    db $F0                                                               ;82D16F;
    dw $3EFA,$01C0                                                       ;82D170;
    db $F0                                                               ;82D174;
    dw $3EFA                                                             ;82D175;

TitleMenuSpritemaps_4A_BorderAround_DATA_CLEAR_MODE:
    dw $002A,$01EC                                                       ;82D177;
    db $F0                                                               ;82D17B;
    dw $3EFA,$01EC                                                       ;82D17C;
    db $08                                                               ;82D180;
    dw $3EFA,$0004                                                       ;82D181;
    db $08                                                               ;82D185;
    dw $3EFA,$000C                                                       ;82D186;
    db $08                                                               ;82D18A;
    dw $3EFA,$01F4                                                       ;82D18B;
    db $08                                                               ;82D18F;
    dw $3EFA,$01FC                                                       ;82D190;
    db $08                                                               ;82D194;
    dw $3EFA,$0004                                                       ;82D195;
    db $F0                                                               ;82D199;
    dw $3EFA,$000C                                                       ;82D19A;
    db $F0                                                               ;82D19E;
    dw $3EFA,$01F4                                                       ;82D19F;
    db $F0                                                               ;82D1A3;
    dw $3EFA,$01FC                                                       ;82D1A4;
    db $F0                                                               ;82D1A8;
    dw $3EFA,$01B4                                                       ;82D1A9;
    db $00                                                               ;82D1AD;
    dw $3EED,$01B4                                                       ;82D1AE;
    db $F8                                                               ;82D1B2;
    dw $3EED,$0044                                                       ;82D1B3;
    db $00                                                               ;82D1B7;
    dw $3EED,$0044                                                       ;82D1B8;
    db $F8                                                               ;82D1BC;
    dw $3EED,$0044                                                       ;82D1BD;
    db $08                                                               ;82D1C1;
    dw $3EFD,$01B4                                                       ;82D1C2;
    db $08                                                               ;82D1C6;
    dw $3EFC,$0044                                                       ;82D1C7;
    db $F0                                                               ;82D1CB;
    dw $3EFB,$01B4                                                       ;82D1CC;
    db $F0                                                               ;82D1D0;
    dw $3EF9,$01E4                                                       ;82D1D1;
    db $08                                                               ;82D1D5;
    dw $3EFA,$01DC                                                       ;82D1D6;
    db $08                                                               ;82D1DA;
    dw $3EFA,$01D4                                                       ;82D1DB;
    db $08                                                               ;82D1DF;
    dw $3EFA,$01CC                                                       ;82D1E0;
    db $08                                                               ;82D1E4;
    dw $3EFA,$01C4                                                       ;82D1E5;
    db $08                                                               ;82D1E9;
    dw $3EFA,$01BC                                                       ;82D1EA;
    db $08                                                               ;82D1EE;
    dw $3EFA,$003C                                                       ;82D1EF;
    db $08                                                               ;82D1F3;
    dw $3EFA,$0034                                                       ;82D1F4;
    db $08                                                               ;82D1F8;
    dw $3EFA,$002C                                                       ;82D1F9;
    db $08                                                               ;82D1FD;
    dw $3EFA,$0024                                                       ;82D1FE;
    db $08                                                               ;82D202;
    dw $3EFA,$001C                                                       ;82D203;
    db $08                                                               ;82D207;
    dw $3EFA,$0014                                                       ;82D208;
    db $08                                                               ;82D20C;
    dw $3EFA,$003C                                                       ;82D20D;
    db $F0                                                               ;82D211;
    dw $3EFA,$0034                                                       ;82D212;
    db $F0                                                               ;82D216;
    dw $3EFA,$002C                                                       ;82D217;
    db $F0                                                               ;82D21B;
    dw $3EFA,$0024                                                       ;82D21C;
    db $F0                                                               ;82D220;
    dw $3EFA,$001C                                                       ;82D221;
    db $F0                                                               ;82D225;
    dw $3EFA,$0014                                                       ;82D226;
    db $F0                                                               ;82D22A;
    dw $3EFA,$01E4                                                       ;82D22B;
    db $F0                                                               ;82D22F;
    dw $3EFA,$01DC                                                       ;82D230;
    db $F0                                                               ;82D234;
    dw $3EFA,$01D4                                                       ;82D235;
    db $F0                                                               ;82D239;
    dw $3EFA,$01CC                                                       ;82D23A;
    db $F0                                                               ;82D23E;
    dw $3EFA,$01C4                                                       ;82D23F;
    db $F0                                                               ;82D243;
    dw $3EFA,$01BC                                                       ;82D244;
    db $F0                                                               ;82D248;
    dw $3EFA                                                             ;82D249;

TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE:
    dw $0022,$01FC                                                       ;82D24B;
    db $08                                                               ;82D24F;
    dw $3EFA,$01FC                                                       ;82D250;
    db $F0                                                               ;82D254;
    dw $3EFA,$01F4                                                       ;82D255;
    db $08                                                               ;82D259;
    dw $3EFA,$01F4                                                       ;82D25A;
    db $F0                                                               ;82D25E;
    dw $3EFA,$01C4                                                       ;82D25F;
    db $00                                                               ;82D263;
    dw $3EED,$01C4                                                       ;82D264;
    db $F8                                                               ;82D268;
    dw $3EED,$0034                                                       ;82D269;
    db $00                                                               ;82D26D;
    dw $3EED,$0034                                                       ;82D26E;
    db $F8                                                               ;82D272;
    dw $3EED,$0034                                                       ;82D273;
    db $08                                                               ;82D277;
    dw $3EFD,$01C4                                                       ;82D278;
    db $08                                                               ;82D27C;
    dw $3EFC,$0034                                                       ;82D27D;
    db $F0                                                               ;82D281;
    dw $3EFB,$01C4                                                       ;82D282;
    db $F0                                                               ;82D286;
    dw $3EF9,$01EC                                                       ;82D287;
    db $08                                                               ;82D28B;
    dw $3EFA,$01E4                                                       ;82D28C;
    db $08                                                               ;82D290;
    dw $3EFA,$01DC                                                       ;82D291;
    db $08                                                               ;82D295;
    dw $3EFA,$01D4                                                       ;82D296;
    db $08                                                               ;82D29A;
    dw $3EFA,$01CC                                                       ;82D29B;
    db $08                                                               ;82D29F;
    dw $3EFA,$002C                                                       ;82D2A0;
    db $08                                                               ;82D2A4;
    dw $3EFA,$0024                                                       ;82D2A5;
    db $08                                                               ;82D2A9;
    dw $3EFA,$001C                                                       ;82D2AA;
    db $08                                                               ;82D2AE;
    dw $3EFA,$0014                                                       ;82D2AF;
    db $08                                                               ;82D2B3;
    dw $3EFA,$000C                                                       ;82D2B4;
    db $08                                                               ;82D2B8;
    dw $3EFA,$0004                                                       ;82D2B9;
    db $08                                                               ;82D2BD;
    dw $3EFA,$002C                                                       ;82D2BE;
    db $F0                                                               ;82D2C2;
    dw $3EFA,$0024                                                       ;82D2C3;
    db $F0                                                               ;82D2C7;
    dw $3EFA,$001C                                                       ;82D2C8;
    db $F0                                                               ;82D2CC;
    dw $3EFA,$0014                                                       ;82D2CD;
    db $F0                                                               ;82D2D1;
    dw $3EFA,$000C                                                       ;82D2D2;
    db $F0                                                               ;82D2D6;
    dw $3EFA,$0004                                                       ;82D2D7;
    db $F0                                                               ;82D2DB;
    dw $3EFA,$01EC                                                       ;82D2DC;
    db $F0                                                               ;82D2E0;
    dw $3EFA,$01E4                                                       ;82D2E1;
    db $F0                                                               ;82D2E5;
    dw $3EFA,$01DC                                                       ;82D2E6;
    db $F0                                                               ;82D2EA;
    dw $3EFA,$01D4                                                       ;82D2EB;
    db $F0                                                               ;82D2EF;
    dw $3EFA,$01CC                                                       ;82D2F0;
    db $F0                                                               ;82D2F4;
    dw $3EFA                                                             ;82D2F5;

TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE:
    dw $003A,$01DC                                                       ;82D2F7;
    db $08                                                               ;82D2FB;
    dw $3EFA,$01E4                                                       ;82D2FC;
    db $08                                                               ;82D300;
    dw $3EFA,$0014                                                       ;82D301;
    db $08                                                               ;82D305;
    dw $3EFA,$000C                                                       ;82D306;
    db $08                                                               ;82D30A;
    dw $3EFA,$0004                                                       ;82D30B;
    db $08                                                               ;82D30F;
    dw $3EFA,$01EC                                                       ;82D310;
    db $08                                                               ;82D314;
    dw $3EFA,$01FC                                                       ;82D315;
    db $08                                                               ;82D319;
    dw $3EFA,$01F4                                                       ;82D31A;
    db $08                                                               ;82D31E;
    dw $3EFA,$01DC                                                       ;82D31F;
    db $F0                                                               ;82D323;
    dw $3EFA,$01E4                                                       ;82D324;
    db $F0                                                               ;82D328;
    dw $3EFA,$0014                                                       ;82D329;
    db $F0                                                               ;82D32D;
    dw $3EFA,$000C                                                       ;82D32E;
    db $F0                                                               ;82D332;
    dw $3EFA,$0004                                                       ;82D333;
    db $F0                                                               ;82D337;
    dw $3EFA,$01EC                                                       ;82D338;
    db $F0                                                               ;82D33C;
    dw $3EFA,$01FC                                                       ;82D33D;
    db $F0                                                               ;82D341;
    dw $3EFA,$01F4                                                       ;82D342;
    db $F0                                                               ;82D346;
    dw $3EFA,$01CC                                                       ;82D347;
    db $F0                                                               ;82D34B;
    dw $3EFA,$01CC                                                       ;82D34C;
    db $08                                                               ;82D350;
    dw $3EFA,$0024                                                       ;82D351;
    db $08                                                               ;82D355;
    dw $3EFA,$002C                                                       ;82D356;
    db $08                                                               ;82D35A;
    dw $3EFA,$01D4                                                       ;82D35B;
    db $08                                                               ;82D35F;
    dw $3EFA,$001C                                                       ;82D360;
    db $08                                                               ;82D364;
    dw $3EFA,$0024                                                       ;82D365;
    db $F0                                                               ;82D369;
    dw $3EFA,$002C                                                       ;82D36A;
    db $F0                                                               ;82D36E;
    dw $3EFA,$01D4                                                       ;82D36F;
    db $F0                                                               ;82D373;
    dw $3EFA,$001C                                                       ;82D374;
    db $F0                                                               ;82D378;
    dw $3EFA,$0194                                                       ;82D379;
    db $00                                                               ;82D37D;
    dw $3EED,$0194                                                       ;82D37E;
    db $F8                                                               ;82D382;
    dw $3EED,$0064                                                       ;82D383;
    db $00                                                               ;82D387;
    dw $3EED,$0064                                                       ;82D388;
    db $F8                                                               ;82D38C;
    dw $3EED,$0064                                                       ;82D38D;
    db $08                                                               ;82D391;
    dw $3EFD,$0194                                                       ;82D392;
    db $08                                                               ;82D396;
    dw $3EFC,$0064                                                       ;82D397;
    db $F0                                                               ;82D39B;
    dw $3EFB,$0194                                                       ;82D39C;
    db $F0                                                               ;82D3A0;
    dw $3EF9,$01C4                                                       ;82D3A1;
    db $08                                                               ;82D3A5;
    dw $3EFA,$01BC                                                       ;82D3A6;
    db $08                                                               ;82D3AA;
    dw $3EFA,$01B4                                                       ;82D3AB;
    db $08                                                               ;82D3AF;
    dw $3EFA,$01AC                                                       ;82D3B0;
    db $08                                                               ;82D3B4;
    dw $3EFA,$01A4                                                       ;82D3B5;
    db $08                                                               ;82D3B9;
    dw $3EFA,$019C                                                       ;82D3BA;
    db $08                                                               ;82D3BE;
    dw $3EFA,$005C                                                       ;82D3BF;
    db $08                                                               ;82D3C3;
    dw $3EFA,$0054                                                       ;82D3C4;
    db $08                                                               ;82D3C8;
    dw $3EFA,$004C                                                       ;82D3C9;
    db $08                                                               ;82D3CD;
    dw $3EFA,$0044                                                       ;82D3CE;
    db $08                                                               ;82D3D2;
    dw $3EFA,$003C                                                       ;82D3D3;
    db $08                                                               ;82D3D7;
    dw $3EFA,$0034                                                       ;82D3D8;
    db $08                                                               ;82D3DC;
    dw $3EFA,$005C                                                       ;82D3DD;
    db $F0                                                               ;82D3E1;
    dw $3EFA,$0054                                                       ;82D3E2;
    db $F0                                                               ;82D3E6;
    dw $3EFA,$004C                                                       ;82D3E7;
    db $F0                                                               ;82D3EB;
    dw $3EFA,$0044                                                       ;82D3EC;
    db $F0                                                               ;82D3F0;
    dw $3EFA,$003C                                                       ;82D3F1;
    db $F0                                                               ;82D3F5;
    dw $3EFA,$0034                                                       ;82D3F6;
    db $F0                                                               ;82D3FA;
    dw $3EFA,$01C4                                                       ;82D3FB;
    db $F0                                                               ;82D3FF;
    dw $3EFA,$01BC                                                       ;82D400;
    db $F0                                                               ;82D404;
    dw $3EFA,$01B4                                                       ;82D405;
    db $F0                                                               ;82D409;
    dw $3EFA,$01AC                                                       ;82D40A;
    db $F0                                                               ;82D40E;
    dw $3EFA,$01A4                                                       ;82D40F;
    db $F0                                                               ;82D413;
    dw $3EFA,$019C                                                       ;82D414;
    db $F0                                                               ;82D418;
    dw $3EFA                                                             ;82D419;

TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE:
    dw $0034,$01E8                                                       ;82D41B;
    db $08                                                               ;82D41F;
    dw $3EFA,$01F0                                                       ;82D420;
    db $08                                                               ;82D424;
    dw $3EFA,$0008                                                       ;82D425;
    db $08                                                               ;82D429;
    dw $3EFA,$0000                                                       ;82D42A;
    db $08                                                               ;82D42E;
    dw $3EFA,$01F8                                                       ;82D42F;
    db $08                                                               ;82D433;
    dw $3EFA,$01E8                                                       ;82D434;
    db $F0                                                               ;82D438;
    dw $3EFA,$01F0                                                       ;82D439;
    db $F0                                                               ;82D43D;
    dw $3EFA,$0008                                                       ;82D43E;
    db $F0                                                               ;82D442;
    dw $3EFA,$0000                                                       ;82D443;
    db $F0                                                               ;82D447;
    dw $3EFA,$01F8                                                       ;82D448;
    db $F0                                                               ;82D44C;
    dw $3EFA,$01D8                                                       ;82D44D;
    db $F0                                                               ;82D451;
    dw $3EFA,$01D8                                                       ;82D452;
    db $08                                                               ;82D456;
    dw $3EFA,$0018                                                       ;82D457;
    db $08                                                               ;82D45B;
    dw $3EFA,$0020                                                       ;82D45C;
    db $08                                                               ;82D460;
    dw $3EFA,$01E0                                                       ;82D461;
    db $08                                                               ;82D465;
    dw $3EFA,$0010                                                       ;82D466;
    db $08                                                               ;82D46A;
    dw $3EFA,$0018                                                       ;82D46B;
    db $F0                                                               ;82D46F;
    dw $3EFA,$0020                                                       ;82D470;
    db $F0                                                               ;82D474;
    dw $3EFA,$01E0                                                       ;82D475;
    db $F0                                                               ;82D479;
    dw $3EFA,$0010                                                       ;82D47A;
    db $F0                                                               ;82D47E;
    dw $3EFA,$01A0                                                       ;82D47F;
    db $00                                                               ;82D483;
    dw $3EED,$01A0                                                       ;82D484;
    db $F8                                                               ;82D488;
    dw $3EED,$0058                                                       ;82D489;
    db $00                                                               ;82D48D;
    dw $3EED,$0058                                                       ;82D48E;
    db $F8                                                               ;82D492;
    dw $3EED,$0058                                                       ;82D493;
    db $08                                                               ;82D497;
    dw $3EFD,$01A0                                                       ;82D498;
    db $08                                                               ;82D49C;
    dw $3EFC,$0058                                                       ;82D49D;
    db $F0                                                               ;82D4A1;
    dw $3EFB,$01A0                                                       ;82D4A2;
    db $F0                                                               ;82D4A6;
    dw $3EF9,$01D0                                                       ;82D4A7;
    db $08                                                               ;82D4AB;
    dw $3EFA,$01C8                                                       ;82D4AC;
    db $08                                                               ;82D4B0;
    dw $3EFA,$01C0                                                       ;82D4B1;
    db $08                                                               ;82D4B5;
    dw $3EFA,$01B8                                                       ;82D4B6;
    db $08                                                               ;82D4BA;
    dw $3EFA,$01B0                                                       ;82D4BB;
    db $08                                                               ;82D4BF;
    dw $3EFA,$01A8                                                       ;82D4C0;
    db $08                                                               ;82D4C4;
    dw $3EFA,$0050                                                       ;82D4C5;
    db $08                                                               ;82D4C9;
    dw $3EFA,$0048                                                       ;82D4CA;
    db $08                                                               ;82D4CE;
    dw $3EFA,$0040                                                       ;82D4CF;
    db $08                                                               ;82D4D3;
    dw $3EFA,$0038                                                       ;82D4D4;
    db $08                                                               ;82D4D8;
    dw $3EFA,$0030                                                       ;82D4D9;
    db $08                                                               ;82D4DD;
    dw $3EFA,$0028                                                       ;82D4DE;
    db $08                                                               ;82D4E2;
    dw $3EFA,$0050                                                       ;82D4E3;
    db $F0                                                               ;82D4E7;
    dw $3EFA,$0048                                                       ;82D4E8;
    db $F0                                                               ;82D4EC;
    dw $3EFA,$0040                                                       ;82D4ED;
    db $F0                                                               ;82D4F1;
    dw $3EFA,$0038                                                       ;82D4F2;
    db $F0                                                               ;82D4F6;
    dw $3EFA,$0030                                                       ;82D4F7;
    db $F0                                                               ;82D4FB;
    dw $3EFA,$0028                                                       ;82D4FC;
    db $F0                                                               ;82D500;
    dw $3EFA,$01D0                                                       ;82D501;
    db $F0                                                               ;82D505;
    dw $3EFA,$01C8                                                       ;82D506;
    db $F0                                                               ;82D50A;
    dw $3EFA,$01C0                                                       ;82D50B;
    db $F0                                                               ;82D50F;
    dw $3EFA,$01B8                                                       ;82D510;
    db $F0                                                               ;82D514;
    dw $3EFA,$01B0                                                       ;82D515;
    db $F0                                                               ;82D519;
    dw $3EFA,$01A8                                                       ;82D51A;
    db $F0                                                               ;82D51E;
    dw $3EFA                                                             ;82D51F;

Samus_Wireframe_Tilemaps_powerSuit:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000                   ;82D521;
    dw $25BC,$25BD,$25BE,$25C3,$65C3,$65BE,$65BD,$65BC                   ;82D531;
    dw $25CC,$25CD,$25CE,$25D3,$65D3,$65CE,$65CD,$65CC                   ;82D541;
    dw $25DC,$25DD,$25EC,$25ED,$257C,$257D,$257E,$257F                   ;82D551;
    dw $25F0,$25F1,$25FC,$25FD,$65FD,$65FC,$65F1,$65F0                   ;82D561;
    dw $2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570                   ;82D571;
    dw $2580,$2581,$2594,$2583,$2584,$2578,$2586,$2587                   ;82D581;
    dw $2590,$2591,$25A4,$25A5,$65A5,$2588,$2596,$2597                   ;82D591;
    dw $25A0,$25A1,$25B4,$25B5,$65B5,$65B4,$25A6,$25A7                   ;82D5A1;
    dw $0000,$25C9,$25C4,$25C5,$65C5,$65C4,$0000,$0000                   ;82D5B1;
    dw $0000,$0000,$25D4,$25D5,$65D5,$65D4,$0000,$0000                   ;82D5C1;
    dw $0000,$0000,$25B6,$25B7,$65B7,$65B6,$0000,$0000                   ;82D5D1;
    dw $0000,$0000,$25C6,$25C7,$65C7,$65C6,$0000,$0000                   ;82D5E1;
    dw $0000,$0000,$25D6,$05D7,$45D7,$65D6,$0000,$0000                   ;82D5F1;
    dw $0000,$0000,$258F,$0000,$0000,$658F,$0000,$F955                   ;82D601;
    dw $258E,$259E,$259F,$0000,$0000,$659F,$25EE,$259D                   ;82D611;
    dw $25AD,$25AE,$25AF,$0000,$0000,$65AF,$25FE,$65AD                   ;82D621;

Samus_Wireframe_Tilemaps_hiJumpBoots:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000                   ;82D631;
    dw $25BC,$25BD,$25BE,$25C3,$65C3,$65BE,$65BD,$65BC                   ;82D641;
    dw $25CC,$25CD,$25CE,$25D3,$65D3,$65CE,$65CD,$65CC                   ;82D651;
    dw $25DC,$25DD,$25EC,$25ED,$257C,$257D,$257E,$257F                   ;82D661;
    dw $25F0,$25F1,$25FC,$25FD,$65FD,$65FC,$65F1,$65F0                   ;82D671;
    dw $2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570                   ;82D681;
    dw $2580,$2581,$2594,$2583,$2584,$2578,$2586,$2587                   ;82D691;
    dw $2590,$2591,$25A4,$25A5,$65A5,$2588,$2596,$2597                   ;82D6A1;
    dw $25A0,$25A1,$25B4,$25B5,$65B5,$65B4,$25A6,$25A7                   ;82D6B1;
    dw $0000,$25C9,$25C4,$25C5,$65C5,$65C4,$0000,$0000                   ;82D6C1;
    dw $0000,$0000,$25D4,$25D5,$65D5,$65D4,$0000,$0000                   ;82D6D1;
    dw $0000,$0000,$25B6,$25B7,$65B7,$65B6,$0000,$0000                   ;82D6E1;
    dw $0000,$0000,$25C6,$25C7,$65C7,$65C6,$0000,$0000                   ;82D6F1;
    dw $0000,$0579,$258C,$05D7,$45D7,$658C,$4579,$0000                   ;82D701;
    dw $0000,$0589,$258A,$0000,$0000,$658A,$4589,$E955                   ;82D711;
    dw $2598,$2599,$259A,$059B,$459B,$659A,$259C,$259D                   ;82D721;
    dw $25A8,$25A9,$25AA,$0000,$0000,$65AA,$25AC,$65A8                   ;82D731;

Samus_Wireframe_Tilemaps_variaSuit:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000                   ;82D741;
    dw $25C0,$25C1,$25C2,$25C3,$65C3,$65C2,$65C1,$65C0                   ;82D751;
    dw $25D0,$25D1,$25D2,$25D3,$65D3,$65D2,$65D1,$65D0                   ;82D761;
    dw $25E0,$25E1,$25E2,$25E3,$25E4,$25E5,$25E6,$25E7                   ;82D771;
    dw $25F0,$25F1,$25F2,$25F3,$65F3,$65F2,$65F1,$65F0                   ;82D781;
    dw $2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570                   ;82D791;
    dw $2580,$2581,$2582,$2583,$2584,$2585,$2586,$2587                   ;82D7A1;
    dw $2590,$2591,$2592,$2593,$6593,$2595,$2596,$2597                   ;82D7B1;
    dw $25A0,$25A1,$25A2,$25A3,$65A3,$65A2,$25A6,$25A7                   ;82D7C1;
    dw $0000,$25C9,$25CA,$25CB,$65CB,$65CA,$0000,$0000                   ;82D7D1;
    dw $0000,$0000,$25DA,$25DB,$65DB,$65DA,$0000,$0000                   ;82D7E1;
    dw $0000,$05E9,$25EA,$25EB,$45EB,$65EA,$65E9,$0000                   ;82D7F1;
    dw $0000,$05F9,$25FA,$25FB,$45FB,$65FA,$65F9,$0000                   ;82D801;
    dw $0000,$0000,$257B,$05D7,$45D7,$657B,$0000,$0000                   ;82D811;
    dw $0000,$0000,$258B,$0000,$0000,$658B,$0000,$E955                   ;82D821;
    dw $258E,$259E,$259F,$0000,$0000,$659F,$25EE,$259D                   ;82D831;
    dw $25AD,$25AE,$25AF,$0000,$0000,$65AF,$25FE,$25FF                   ;82D841;

Samus_Wireframe_Tilemaps_hiJumpBootsVariaSuit:
    dw $0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000                   ;82D851;
    dw $25C0,$25C1,$25C2,$25C3,$65C3,$65C2,$65C1,$65C0                   ;82D861;
    dw $25D0,$25D1,$25D2,$25D3,$65D3,$65D2,$65D1,$65D0                   ;82D871;
    dw $25E0,$25E1,$25E2,$25E3,$25E4,$25E5,$25E6,$25E7                   ;82D881;
    dw $25F0,$25F1,$25F2,$25F3,$65F3,$65F2,$65F1,$65F0                   ;82D891;
    dw $2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570                   ;82D8A1;
    dw $2580,$2581,$2582,$2583,$2584,$2585,$2586,$2587                   ;82D8B1;
    dw $2590,$2591,$2592,$2593,$6593,$2595,$2596,$2597                   ;82D8C1;
    dw $25A0,$25A1,$25A2,$25A3,$65A3,$65A2,$25A6,$25A7                   ;82D8D1;
    dw $0000,$25C9,$25CA,$25CB,$65CB,$65CA,$0000,$0000                   ;82D8E1;
    dw $0000,$0000,$25DA,$25DB,$65DB,$65DA,$0000,$0000                   ;82D8F1;
    dw $0000,$25E9,$25EA,$25EB,$65EB,$65EA,$65E9,$0000                   ;82D901;
    dw $0000,$25F9,$25FA,$25FB,$65FB,$65FA,$65F9,$0000                   ;82D911;
    dw $0000,$2579,$257A,$0000,$0000,$657A,$6579,$0000                   ;82D921;
    dw $0000,$2589,$258A,$0000,$0000,$658A,$6589,$F955                   ;82D931;
    dw $2598,$2599,$259A,$059B,$459B,$659A,$259C,$259D                   ;82D941;
    dw $25A8,$25A9,$25AA,$0000,$0000,$65AA,$25AC,$65A8                   ;82D951;

Advance_GradualColorChange_ofAllPalettes_Denominator_C:
    LDA.W #$000C                                                         ;82D961;
    STA.L $7EC402                                                        ;82D964;
    JSR.W Advance_GradualColorChange_ofAllPalettes                       ;82D968;
    RTS                                                                  ;82D96B;


Advance_GradualColorChange_ofBGPalette6:
    REP #$30                                                             ;82D96C;
    LDA.W #$000C                                                         ;82D96E;
    STA.L $7EC402                                                        ;82D971;
    INC A                                                                ;82D975;
    CMP.L $7EC400                                                        ;82D976;
    BCS .advance                                                         ;82D97A;
    LDA.W #$0000                                                         ;82D97C;
    STA.L $7EC400                                                        ;82D97F;
    SEC                                                                  ;82D983;
    RTL                                                                  ;82D984;


.advance:
    PHB                                                                  ;82D985;
    PEA.W $7E7E                                                          ;82D986;
    PLB                                                                  ;82D989;
    PLB                                                                  ;82D98A;
    LDX.W #$00C0                                                         ;82D98B;

.loop:
    PHX                                                                  ;82D98E;
    LDA.L $7EC200,X                                                      ;82D98F;
    TAY                                                                  ;82D993;
    LDA.L $7EC000,X                                                      ;82D994;
    TAX                                                                  ;82D998;
    LDA.L $7EC400                                                        ;82D999;
    JSR.W CalculateTheAth_TransitionalColor_fromXtoY                     ;82D99D;
    PLX                                                                  ;82D9A0;
    STA.L $7EC000,X                                                      ;82D9A1;
    INX                                                                  ;82D9A5;
    INX                                                                  ;82D9A6;
    CPX.W #$00E0                                                         ;82D9A7;
    BCC .loop                                                            ;82D9AA;
    PLB                                                                  ;82D9AC;
    LDA.L $7EC400                                                        ;82D9AD;
    INC A                                                                ;82D9B1;
    STA.L $7EC400                                                        ;82D9B2;
    CLC                                                                  ;82D9B6;
    RTL                                                                  ;82D9B7;


Advance_GradualColorChange_ofPaletteRAM:
    REP #$30                                                             ;82D9B8;
    LDA.W #$000F                                                         ;82D9BA;
    STA.L $7EC402                                                        ;82D9BD;
    CMP.L $7EC400                                                        ;82D9C1;
    BPL .advance                                                         ;82D9C5;
    LDA.W #$0000                                                         ;82D9C7;
    STA.L $7EC400                                                        ;82D9CA;
    SEC                                                                  ;82D9CE;
    RTL                                                                  ;82D9CF;


.advance:
    STY.B $22                                                            ;82D9D0;
    PHB                                                                  ;82D9D2;
    PEA.W $7E7E                                                          ;82D9D3;
    PLB                                                                  ;82D9D6;
    PLB                                                                  ;82D9D7;

.loop:
    PHX                                                                  ;82D9D8;
    LDA.L $7EC200,X                                                      ;82D9D9;
    TAY                                                                  ;82D9DD;
    LDA.L $7EC000,X                                                      ;82D9DE;
    TAX                                                                  ;82D9E2;
    LDA.L $7EC400                                                        ;82D9E3;
    INC A                                                                ;82D9E7;
    JSR.W CalculateTheAth_TransitionalColor_fromXtoY                     ;82D9E8;
    PLX                                                                  ;82D9EB;
    STA.L $7EC000,X                                                      ;82D9EC;
    INX                                                                  ;82D9F0;
    INX                                                                  ;82D9F1;
    CPX.B $22                                                            ;82D9F2;
    BCC .loop                                                            ;82D9F4;
    PLB                                                                  ;82D9F6;
    LDA.L $7EC400                                                        ;82D9F7;
    INC A                                                                ;82D9FB;
    STA.L $7EC400                                                        ;82D9FC;
    CLC                                                                  ;82DA00;
    RTL                                                                  ;82DA01;


Advance_GradualColorChange_ofAllPalettes:
    REP #$30                                                             ;82DA02;
    LDA.L $7EC402                                                        ;82DA04;
    INC A                                                                ;82DA08;
    CMP.L $7EC400                                                        ;82DA09;
    BCS .advance                                                         ;82DA0D;
    LDA.W #$0000                                                         ;82DA0F;
    STA.L $7EC400                                                        ;82DA12;
    SEC                                                                  ;82DA16;
    RTS                                                                  ;82DA17;


.advance:
    PHB                                                                  ;82DA18;
    PEA.W $7E7E                                                          ;82DA19;
    PLB                                                                  ;82DA1C;
    PLB                                                                  ;82DA1D;
    LDX.W #$0000                                                         ;82DA1E;

.loop:
    STX.W $C404                                                          ;82DA21;
    LDA.W $C200,X                                                        ;82DA24;
    CMP.W $C000,X                                                        ;82DA27;
    BEQ .next                                                            ;82DA2A;
    TAY                                                                  ;82DA2C;
    LDA.W $C000,X                                                        ;82DA2D;
    TAX                                                                  ;82DA30;
    LDA.W $C400                                                          ;82DA31;
    JSR.W CalculateTheAth_TransitionalColor_fromXtoY                     ;82DA34;
    LDX.W $C404                                                          ;82DA37;
    STA.W $C000,X                                                        ;82DA3A;

.next:
    INX                                                                  ;82DA3D;
    INX                                                                  ;82DA3E;
    CPX.W #$0200                                                         ;82DA3F;
    BCC .loop                                                            ;82DA42;
    INC.W $C400                                                          ;82DA44;
    PLB                                                                  ;82DA47;
    CLC                                                                  ;82DA48;
    RTS                                                                  ;82DA49;


CalculateTheAth_TransitionalColor_fromXtoY:
    PHA                                                                  ;82DA4A;
    PHA                                                                  ;82DA4B;
    PHX                                                                  ;82DA4C;
    PHY                                                                  ;82DA4D;
    LDA.B $01,S                                                          ;82DA4E;
    AND.W #$001F                                                         ;82DA50;
    TAY                                                                  ;82DA53;
    LDA.B $03,S                                                          ;82DA54;
    AND.W #$001F                                                         ;82DA56;
    TAX                                                                  ;82DA59;
    LDA.B $05,S                                                          ;82DA5A;
    JSR.W CalculateTheAth_TransitionalColorComponent_fromXtoY            ;82DA5C;
    STA.B $07,S                                                          ;82DA5F;
    LDA.B $01,S                                                          ;82DA61;
    ASL A                                                                ;82DA63;
    ASL A                                                                ;82DA64;
    ASL A                                                                ;82DA65;
    XBA                                                                  ;82DA66;
    AND.W #$001F                                                         ;82DA67;
    TAY                                                                  ;82DA6A;
    LDA.B $03,S                                                          ;82DA6B;
    ASL A                                                                ;82DA6D;
    ASL A                                                                ;82DA6E;
    ASL A                                                                ;82DA6F;
    XBA                                                                  ;82DA70;
    AND.W #$001F                                                         ;82DA71;
    TAX                                                                  ;82DA74;
    LDA.B $05,S                                                          ;82DA75;
    JSR.W CalculateTheAth_TransitionalColorComponent_fromXtoY            ;82DA77;
    ASL A                                                                ;82DA7A;
    ASL A                                                                ;82DA7B;
    ASL A                                                                ;82DA7C;
    ASL A                                                                ;82DA7D;
    ASL A                                                                ;82DA7E;
    ORA.B $07,S                                                          ;82DA7F;
    STA.B $07,S                                                          ;82DA81;
    LDA.B $01,S                                                          ;82DA83;
    LSR A                                                                ;82DA85;
    LSR A                                                                ;82DA86;
    XBA                                                                  ;82DA87;
    AND.W #$001F                                                         ;82DA88;
    TAY                                                                  ;82DA8B;
    LDA.B $03,S                                                          ;82DA8C;
    LSR A                                                                ;82DA8E;
    LSR A                                                                ;82DA8F;
    XBA                                                                  ;82DA90;
    AND.W #$001F                                                         ;82DA91;
    TAX                                                                  ;82DA94;
    LDA.B $05,S                                                          ;82DA95;
    JSR.W CalculateTheAth_TransitionalColorComponent_fromXtoY            ;82DA97;
    ASL A                                                                ;82DA9A;
    ASL A                                                                ;82DA9B;
    XBA                                                                  ;82DA9C;
    ORA.B $07,S                                                          ;82DA9D;
    STA.B $07,S                                                          ;82DA9F;
    PLY                                                                  ;82DAA1;
    PLX                                                                  ;82DAA2;
    PLA                                                                  ;82DAA3;
    PLA                                                                  ;82DAA4;
    RTS                                                                  ;82DAA5;


CalculateTheAth_TransitionalColorComponent_fromXtoY:
    CMP.W #$0000                                                         ;82DAA6;
    BNE .AisNonZero                                                      ;82DAA9;
    TXA                                                                  ;82DAAB;
    RTS                                                                  ;82DAAC;


.AisNonZero:
    DEC A                                                                ;82DAAD;
    CMP.W $C402                                                          ;82DAAE;
    BNE +                                                                ;82DAB1;
    TYA                                                                  ;82DAB3;
    RTS                                                                  ;82DAB4;


  + PHX                                                                  ;82DAB5;
    INC A                                                                ;82DAB6;
    STA.B $14                                                            ;82DAB7;
    TYA                                                                  ;82DAB9;
    SEC                                                                  ;82DABA;
    SBC.B $01,S                                                          ;82DABB;
    STA.B $12                                                            ;82DABD;
    BPL +                                                                ;82DABF;
    EOR.W #$FFFF                                                         ;82DAC1;
    INC A                                                                ;82DAC4;

  + XBA                                                                  ;82DAC5;
    AND.W #$FF00                                                         ;82DAC6;
    STA.L HW_WRDIV                                                       ;82DAC9;
    SEP #$21                                                             ;82DACD;
    LDA.W $C402                                                          ;82DACF;
    SBC.B $14                                                            ;82DAD2;
    INC A                                                                ;82DAD4;
    STA.L HW_WRDIVB                                                      ;82DAD5;
    REP #$20                                                             ;82DAD9;
    XBA                                                                  ;82DADB;
    XBA                                                                  ;82DADC;
    NOP                                                                  ;82DADD;
    NOP                                                                  ;82DADE;
    LDA.L HW_RDDIV                                                       ;82DADF;
    BIT.B $12                                                            ;82DAE3;
    BPL +                                                                ;82DAE5;
    EOR.W #$FFFF                                                         ;82DAE7;
    INC A                                                                ;82DAEA;

  + STA.B $12                                                            ;82DAEB;
    PLA                                                                  ;82DAED;
    XBA                                                                  ;82DAEE;
    CLC                                                                  ;82DAEF;
    ADC.B $12                                                            ;82DAF0;
    XBA                                                                  ;82DAF2;
    AND.W #$00FF                                                         ;82DAF3;
    RTS                                                                  ;82DAF6;


Advance_GradualColorChange_ofPalettesInA_Denominator_C:
    PHX                                                                  ;82DAF7;
    PHY                                                                  ;82DAF8;
    PHB                                                                  ;82DAF9;
    PEA.W $7E7E                                                          ;82DAFA;
    PLB                                                                  ;82DAFD;
    PLB                                                                  ;82DAFE;
    LDX.W #$000C                                                         ;82DAFF;
    STX.W $C402                                                          ;82DB02;
    JSR.W Advance_GradualColorChange_ofPalettesInA                       ;82DB05;
    PLB                                                                  ;82DB08;
    PLY                                                                  ;82DB09;
    PLX                                                                  ;82DB0A;
    RTL                                                                  ;82DB0B;


Advance_GradualColorChange_ofPalettesInA:
    REP #$30                                                             ;82DB0C;
    PHA                                                                  ;82DB0E;
    LDA.W $C402                                                          ;82DB0F;
    INC A                                                                ;82DB12;
    CMP.W $C400                                                          ;82DB13;
    BCS +                                                                ;82DB16;
    LDA.W #$0000                                                         ;82DB18;
    STA.W $C400                                                          ;82DB1B;
    PLA                                                                  ;82DB1E;
    SEC                                                                  ;82DB1F;
    RTS                                                                  ;82DB20;


  + STZ.W $C404                                                          ;82DB21;

.loop:
    PLA                                                                  ;82DB24;
    BEQ +                                                                ;82DB25;
    LSR A                                                                ;82DB27;
    PHA                                                                  ;82DB28;
    BCS .advance                                                         ;82DB29;
    LDA.W $C404                                                          ;82DB2B;
    ADC.W #$0020                                                         ;82DB2E;
    STA.W $C404                                                          ;82DB31;
    BRA .loop                                                            ;82DB34;


.advance:
    JSR.W Advance_GradualColorChange_ofPaletteX_DividedBy_20             ;82DB36;
    BRA .loop                                                            ;82DB39;

    PLA                                                                  ;82DB3B; dead code (just the PLA)

  + INC.W $C400                                                          ;82DB3C;
    CLC                                                                  ;82DB3F;
    RTS                                                                  ;82DB40;


Advance_GradualColorChange_ofPaletteX_DividedBy_20:
    LDX.W $C404                                                          ;82DB41;

.loop:
    LDA.W $C200,X                                                        ;82DB44;
    CMP.W $C000,X                                                        ;82DB47;
    BEQ .next                                                            ;82DB4A;
    TAY                                                                  ;82DB4C;
    LDA.W $C000,X                                                        ;82DB4D;
    TAX                                                                  ;82DB50;
    LDA.W $C400                                                          ;82DB51;
    JSR.W CalculateTheAth_TransitionalColor_fromXtoY                     ;82DB54;
    LDX.W $C404                                                          ;82DB57;
    STA.W $C000,X                                                        ;82DB5A;

.next:
    INX                                                                  ;82DB5D;
    INX                                                                  ;82DB5E;
    STX.W $C404                                                          ;82DB5F;
    TXA                                                                  ;82DB62;
    AND.W #$001F                                                         ;82DB63;
    BNE .loop                                                            ;82DB66;
    RTS                                                                  ;82DB68;


HandleSamusRunningOutOfEnergy_and_IncrementGameTime:
    PHP                                                                  ;82DB69;
    REP #$30                                                             ;82DB6A;
    LDA.W $09C2                                                          ;82DB6C;
    BEQ .zeroEnergy                                                      ;82DB6F;
    BPL .tickGameTime                                                    ;82DB71;

.zeroEnergy:
    LDA.W $09C0                                                          ;82DB73;
    BIT.W #$0001                                                         ;82DB76;
    BEQ .noAutoReserve                                                   ;82DB79;
    LDA.W $09D6                                                          ;82DB7B;
    BEQ .noAutoReserve                                                   ;82DB7E;
    LDA.W #$8000                                                         ;82DB80;
    STA.W $0A78                                                          ;82DB83;
    LDA.W #$001B                                                         ;82DB86;
    STA.W $0998                                                          ;82DB89;
    LDA.W #$001B                                                         ;82DB8C;
    JSL.L Run_Samus_Command                                              ;82DB8F;
    BRA .tickGameTime                                                    ;82DB93;


.noAutoReserve:
    LDA.W $0998                                                          ;82DB95;
    CMP.W #$0008                                                         ;82DB98;
    BEQ .normalGameplay                                                  ;82DB9B;
    PLP                                                                  ;82DB9D;
    RTS                                                                  ;82DB9E;


.normalGameplay:
    LDA.W #$8000                                                         ;82DB9F;
    STA.W $0A78                                                          ;82DBA2;
    LDA.W #$0011                                                         ;82DBA5;
    JSL.L Run_Samus_Command                                              ;82DBA8;
    LDA.W #$0013                                                         ;82DBAC;
    STA.W $0998                                                          ;82DBAF;

.tickGameTime:
    LDA.W $09DA                                                          ;82DBB2;
    CLC                                                                  ;82DBB5;
    ADC.W #$0001                                                         ;82DBB6;
    STA.W $09DA                                                          ;82DBB9;
    CMP.W #$003C                                                         ;82DBBC;
    BMI .checkGameTime                                                   ;82DBBF;
    STZ.W $09DA                                                          ;82DBC1;
    LDA.W $09DC                                                          ;82DBC4;
    CLC                                                                  ;82DBC7;
    ADC.W #$0001                                                         ;82DBC8;
    STA.W $09DC                                                          ;82DBCB;
    CMP.W #$003C                                                         ;82DBCE;
    BMI .checkGameTime                                                   ;82DBD1;
    STZ.W $09DC                                                          ;82DBD3;
    LDA.W $09DE                                                          ;82DBD6;
    CLC                                                                  ;82DBD9;
    ADC.W #$0001                                                         ;82DBDA;
    STA.W $09DE                                                          ;82DBDD;
    CMP.W #$003C                                                         ;82DBE0;
    BMI .checkGameTime                                                   ;82DBE3;
    STZ.W $09DE                                                          ;82DBE5;
    LDA.W $09E0                                                          ;82DBE8;
    CLC                                                                  ;82DBEB;
    ADC.W #$0001                                                         ;82DBEC;
    STA.W $09E0                                                          ;82DBEF;

.checkGameTime:
    LDA.W $09E0                                                          ;82DBF2;
    CMP.W #$0064                                                         ;82DBF5;
    BPL .capGameTime                                                     ;82DBF8;
    PLP                                                                  ;82DBFA;
    RTS                                                                  ;82DBFB;


.capGameTime:
    LDA.W #$003B                                                         ;82DBFC;
    STA.W $09DA                                                          ;82DBFF;
    STA.W $09DC                                                          ;82DC02;
    STA.W $09DE                                                          ;82DC05;
    LDA.W #$0063                                                         ;82DC08;
    STA.W $09E0                                                          ;82DC0B;
    PLP                                                                  ;82DC0E;
    RTS                                                                  ;82DC0F;


GameState_1B_ReserveTankAuto:
    PHP                                                                  ;82DC10;
    REP #$30                                                             ;82DC11;
    JSR.W Reserve_Tank_Auto_Refill                                       ;82DC13;
    BCC +                                                                ;82DC16;
    STZ.W $0A78                                                          ;82DC18;
    LDA.W #$0008                                                         ;82DC1B;
    STA.W $0998                                                          ;82DC1E;
    LDA.W #$0010                                                         ;82DC21;
    JSL.L Run_Samus_Command                                              ;82DC24;

  + JSR.W GameState_8_MainGameplay                                       ;82DC28;
    JSL.L Low_Health_Check_external                                      ;82DC2B;
    PLP                                                                  ;82DC2F;
    RTS                                                                  ;82DC30;


Reserve_Tank_Auto_Refill:
    LDA.W $09D6                                                          ;82DC31;
    BEQ .return                                                          ;82DC34;
    LDA.W $05B6                                                          ;82DC36;
    BIT.W #$0007                                                         ;82DC39;
    BNE +                                                                ;82DC3C;
    LDA.W #$002D                                                         ;82DC3E;
    JSL.L QueueSound_Lib3_Max3                                           ;82DC41;

  + LDA.W $09C2                                                          ;82DC45;
    CLC                                                                  ;82DC48;
    ADC.W #$0001                                                         ;82DC49;
    STA.W $09C2                                                          ;82DC4C;
    CMP.W $09C4                                                          ;82DC4F;
    BMI +                                                                ;82DC52;
    LDA.W $09C4                                                          ;82DC54;
    STA.W $09C2                                                          ;82DC57;
    BRA .zeroReserve                                                     ;82DC5A;


  + LDA.W $09D6                                                          ;82DC5C;
    SEC                                                                  ;82DC5F;
    SBC.W #$0001                                                         ;82DC60;
    STA.W $09D6                                                          ;82DC63;
    BEQ .zeroReserve                                                     ;82DC66;
    BPL .return                                                          ;82DC68;
    LDA.W $09C2                                                          ;82DC6A;
    CLC                                                                  ;82DC6D;
    ADC.W $09D6                                                          ;82DC6E;
    STA.W $09C2                                                          ;82DC71;

.zeroReserve:
    STZ.W $09D6                                                          ;82DC74;

.return:
    LDA.W $09D6                                                          ;82DC77;
    BNE .notDoneRefilling                                                ;82DC7A;
    SEC                                                                  ;82DC7C;
    RTS                                                                  ;82DC7D;


.notDoneRefilling:
    CLC                                                                  ;82DC7E;
    RTS                                                                  ;82DC7F;


GameState_13_DeathSequence_Start:
    PHP                                                                  ;82DC80;
    REP #$30                                                             ;82DC81;
    JSR.W GameState_8_MainGameplay                                       ;82DC83;
    LDX.W #$01FE                                                         ;82DC86;

  - LDA.L $7EC000,X                                                      ;82DC89;
    STA.L $7E3300,X                                                      ;82DC8D;
    DEX                                                                  ;82DC91;
    DEX                                                                  ;82DC92;
    BPL -                                                                ;82DC93;
    LDX.W #$017E                                                         ;82DC95;
    LDA.W #$0000                                                         ;82DC98;

  - STA.L $7EC200,X                                                      ;82DC9B;
    DEX                                                                  ;82DC9F;
    DEX                                                                  ;82DCA0;
    BPL -                                                                ;82DCA1;
    LDX.W #$005E                                                         ;82DCA3;
    LDA.W #$0000                                                         ;82DCA6;

  - STA.L $7EC3A0,X                                                      ;82DCA9;
    DEX                                                                  ;82DCAD;
    DEX                                                                  ;82DCAE;
    BPL -                                                                ;82DCAF;
    LDX.W #$001E                                                         ;82DCB1;

  - LDA.L $7EC180,X                                                      ;82DCB4;
    STA.L $7EC380,X                                                      ;82DCB8;
    DEX                                                                  ;82DCBC;
    DEX                                                                  ;82DCBD;
    BPL -                                                                ;82DCBE;
    LDA.W #$0003                                                         ;82DCC0;
    STA.W $0DE2                                                          ;82DCC3;
    STZ.W $0DE4                                                          ;82DCC6;
    STZ.W $0DE6                                                          ;82DCC9;
    STZ.W $0DE8                                                          ;82DCCC;
    STZ.W $09D2                                                          ;82DCCF;
    STZ.W $0A04                                                          ;82DCD2;
    STZ.W $18A8                                                          ;82DCD5;
    STZ.W $18AA                                                          ;82DCD8;
    INC.W $0998                                                          ;82DCDB;
    PLP                                                                  ;82DCDE;
    RTS                                                                  ;82DCDF;


GameState_14_DeathSequence_BlackOutSurroundings:
    PHP                                                                  ;82DCE0;
    REP #$30                                                             ;82DCE1;
    JSR.W GameState_8_MainGameplay                                       ;82DCE3;
    LDA.W #$0006                                                         ;82DCE6;
    STA.L $7EC402                                                        ;82DCE9;
    JSR.W Advance_GradualColorChange_ofAllPalettes                       ;82DCED;
    BCS +                                                                ;82DCF0;
    PLP                                                                  ;82DCF2;
    RTS                                                                  ;82DCF3;


  + JSL.L Wait_End_VBlank_Clear_HDMA                                     ;82DCF4;
    JSL.L DisableHVCounterInterrupts                                     ;82DCF8;
    STZ.W $1982                                                          ;82DCFC;
    STZ.B $AB                                                            ;82DCFF;
    SEP #$20                                                             ;82DD01;
    STZ.B $6E                                                            ;82DD03;
    STZ.B $71                                                            ;82DD05;
    LDA.B #$10                                                           ;82DD07;
    STA.B $69                                                            ;82DD09;
    STZ.B $6B                                                            ;82DD0B;
    STZ.B $6C                                                            ;82DD0D;
    STZ.B $6D                                                            ;82DD0F;
    LDA.B #$09                                                           ;82DD11;
    STA.B $55                                                            ;82DD13;
    REP #$20                                                             ;82DD15;
    STZ.W $0DE2                                                          ;82DD17;
    STZ.W $0723                                                          ;82DD1A;
    STZ.W $0725                                                          ;82DD1D;
    LDX.W #$00FE                                                         ;82DD20;

  - STZ.W $1A8D,X                                                        ;82DD23;
    DEX                                                                  ;82DD26;
    DEX                                                                  ;82DD27;
    BPL -                                                                ;82DD28;
    LDA.W #$0010                                                         ;82DD2A;
    STA.W $0DE8                                                          ;82DD2D;
    LDA.W #$0003                                                         ;82DD30;
    STA.W $0DE2                                                          ;82DD33;
    STZ.W $0DE4                                                          ;82DD36;
    STZ.W $0DE6                                                          ;82DD39;
    INC.W $0998                                                          ;82DD3C;
    STZ.W $0592                                                          ;82DD3F;
    LDA.W #$0002                                                         ;82DD42;
    JSL.L QueueSound                                                     ;82DD45;
    LDA.W #$0071                                                         ;82DD49;
    JSL.L QueueSound_Lib2_Max15                                          ;82DD4C;
    LDA.W #$0001                                                         ;82DD50;
    JSL.L QueueSound_Lib3_Max15                                          ;82DD53;
    LDA.W #$0000                                                         ;82DD57;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;82DD5A;
    LDA.W #$FF39                                                         ;82DD5E;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;82DD61;
    LDA.W #$0005                                                         ;82DD65;
    LDY.W #$000E                                                         ;82DD68;
    JSL.L QueueMusicDataOrTrack_YFrameDelay                              ;82DD6B;
    PLP                                                                  ;82DD6F;
    RTS                                                                  ;82DD70;


GameState_15_DeathSequence_WaitForMusic:
    PHP                                                                  ;82DD71;
    REP #$30                                                             ;82DD72;
    JSL.L Draw_Inanimate_Samus                                           ;82DD74;
    JSL.L CheckIfMusicIsQueued                                           ;82DD78;
    BCS .reutrn                                                          ;82DD7C;
    JSL.L SetSamusDeathSequencePose                                      ;82DD7E;
    INC.W $0998                                                          ;82DD82;

.reutrn:
    PLP                                                                  ;82DD85;
    RTS                                                                  ;82DD86;


GameState_16_DeathSequence_PreFlashing:
    PHP                                                                  ;82DD87;
    REP #$30                                                             ;82DD88;
    JSL.L Draw_Samus_Starting_Death_Animation_JSL                        ;82DD8A;
    DEC.W $0DE8                                                          ;82DD8E;
    BEQ +                                                                ;82DD91;
    BPL .return                                                          ;82DD93;

  + INC.W $0998                                                          ;82DD95;

.return:
    PLP                                                                  ;82DD98;
    RTS                                                                  ;82DD99;


GameState_17_DeathSequence_Flashing:
    PHP                                                                  ;82DD9A;
    REP #$30                                                             ;82DD9B;
    JSL.L Handle_Death_Animation_Flashing                                ;82DD9D;
    TAX                                                                  ;82DDA1;
    BEQ .flashingEnded                                                   ;82DDA2;
    INC.W $0998                                                          ;82DDA4;
    BRA .return                                                          ;82DDA7;


.flashingEnded:
    JSL.L Draw_Samus_During_Death_Animation                              ;82DDA9;

.return:
    PLP                                                                  ;82DDAD;
    RTS                                                                  ;82DDAE;


GameState_18_DeathSequence_ExplosionWhiteOut:
    PHP                                                                  ;82DDAF;
    REP #$30                                                             ;82DDB0;
    JSL.L Handle_DeathSequence_SuitExplosionWhiteOut                     ;82DDB2;
    TAX                                                                  ;82DDB6;
    BEQ .return                                                          ;82DDB7;
    LDA.W #$0001                                                         ;82DDB9;
    STA.W $0723                                                          ;82DDBC;
    STA.W $0725                                                          ;82DDBF;
    INC.W $0998                                                          ;82DDC2;

.return:
    PLP                                                                  ;82DDC5;
    RTS                                                                  ;82DDC6;


GameState_19_DeathSequence_BlackOut:
    PHP                                                                  ;82DDC7;
    REP #$30                                                             ;82DDC8;
    JSL.L HandleFadingOut                                                ;82DDCA;
    SEP #$20                                                             ;82DDCE;
    LDA.B $51                                                            ;82DDD0;
    CMP.B #$80                                                           ;82DDD2;
    BNE .return                                                          ;82DDD4;
    JSL.L EnableNMI                                                      ;82DDD6;
    REP #$20                                                             ;82DDDA;
    STZ.W $0723                                                          ;82DDDC;
    STZ.W $0725                                                          ;82DDDF;
    INC.W $0998                                                          ;82DDE2;
    STZ.W $0727                                                          ;82DDE5;
    STZ.W $05F5                                                          ;82DDE8;
    PLP                                                                  ;82DDEB;
    RTS                                                                  ;82DDEC;


.return:
    REP #$20                                                             ;82DDED;
    PLP                                                                  ;82DDEF;
    RTS                                                                  ;82DDF0;


Load_Destination_RoomCRE_Bitset:
    PHB                                                                  ;82DDF1;
    PHX                                                                  ;82DDF2;
    PEA.W $8F00                                                          ;82DDF3;
    PLB                                                                  ;82DDF6;
    PLB                                                                  ;82DDF7;
    LDX.W $078D                                                          ;82DDF8;
    LDA.L $830000,X                                                      ;82DDFB;
    TAX                                                                  ;82DDFF;
    LDA.W $07B3                                                          ;82DE00;
    STA.W $07B1                                                          ;82DE03;
    LDA.W $0008,X                                                        ;82DE06;
    AND.W #$00FF                                                         ;82DE09;
    STA.W $07B3                                                          ;82DE0C;
    PLX                                                                  ;82DE0F;
    PLB                                                                  ;82DE10;
    RTS                                                                  ;82DE11;


Load_Door_Header:
    PEA.W $8300                                                          ;82DE12;
    PLB                                                                  ;82DE15;
    PLB                                                                  ;82DE16;
    LDX.W $078D                                                          ;82DE17;
    LDA.W $0000,X                                                        ;82DE1A;
    STA.W $079B                                                          ;82DE1D;
    LDA.W $0002,X                                                        ;82DE20;
    STA.W $0793                                                          ;82DE23;
    AND.W #$0080                                                         ;82DE26;
    STA.W $0E16                                                          ;82DE29;
    LDA.W $0003,X                                                        ;82DE2C;
    AND.W #$00FF                                                         ;82DE2F;
    STA.W $0791                                                          ;82DE32;
    LDA.W $0006,X                                                        ;82DE35;
    AND.W #$00FF                                                         ;82DE38;
    XBA                                                                  ;82DE3B;
    STA.W $0927                                                          ;82DE3C;
    LDA.W $0007,X                                                        ;82DE3F;
    AND.W #$00FF                                                         ;82DE42;
    XBA                                                                  ;82DE45;
    STA.W $0929                                                          ;82DE46;
    STZ.B $12                                                            ;82DE49;
    STZ.B $14                                                            ;82DE4B;
    LDA.W $0008,X                                                        ;82DE4D;
    BPL .positive                                                        ;82DE50;
    LDA.W $0791                                                          ;82DE52;
    BIT.W #$0002                                                         ;82DE55;
    BNE .vertical                                                        ;82DE58;
    LDA.W #$00C8                                                         ;82DE5A;
    BRA .positive                                                        ;82DE5D;


.vertical:
    LDA.W #$0180                                                         ;82DE5F;

.positive:
    STA.B $13                                                            ;82DE62;
    LDA.B $12                                                            ;82DE64;
    STA.W $092B                                                          ;82DE66;
    LDA.B $14                                                            ;82DE69;
    STA.W $092D                                                          ;82DE6B;
    RTS                                                                  ;82DE6E;


Load_Room_Header:
    PEA.W $8F00                                                          ;82DE6F;
    PLB                                                                  ;82DE72;
    PLB                                                                  ;82DE73;
    LDX.W $079B                                                          ;82DE74;
    LDA.W $0000,X                                                        ;82DE77;
    AND.W #$00FF                                                         ;82DE7A;
    STA.W $079D                                                          ;82DE7D;
    LDA.W $0001,X                                                        ;82DE80;
    AND.W #$00FF                                                         ;82DE83;
    STA.W $079F                                                          ;82DE86;
    LDA.W $0002,X                                                        ;82DE89;
    AND.W #$00FF                                                         ;82DE8C;
    STA.W $07A1                                                          ;82DE8F;
    LDA.W $0003,X                                                        ;82DE92;
    AND.W #$00FF                                                         ;82DE95;
    STA.W $07A3                                                          ;82DE98;
    LDA.W $0004,X                                                        ;82DE9B;
    AND.W #$00FF                                                         ;82DE9E;
    STA.W $07A9                                                          ;82DEA1;
    ASL A                                                                ;82DEA4;
    ASL A                                                                ;82DEA5;
    ASL A                                                                ;82DEA6;
    ASL A                                                                ;82DEA7;
    STA.W $07A5                                                          ;82DEA8;
    LDA.W $0005,X                                                        ;82DEAB;
    AND.W #$00FF                                                         ;82DEAE;
    STA.W $07AB                                                          ;82DEB1;
    ASL A                                                                ;82DEB4;
    ASL A                                                                ;82DEB5;
    ASL A                                                                ;82DEB6;
    ASL A                                                                ;82DEB7;
    STA.W $07A7                                                          ;82DEB8;
    LDA.W $0006,X                                                        ;82DEBB;
    AND.W #$00FF                                                         ;82DEBE;
    STA.W $07AD                                                          ;82DEC1;
    LDA.W $0007,X                                                        ;82DEC4;
    AND.W #$00FF                                                         ;82DEC7;
    STA.W $07AF                                                          ;82DECA;
    LDA.W $0009,X                                                        ;82DECD;
    STA.W $07B5                                                          ;82DED0;
    JSL.L Room_State_Checking_Handler                                    ;82DED3;
    SEP #$20                                                             ;82DED7;
    LDA.W $07A5                                                          ;82DED9;
    STA.W HW_WRMPYA                                                      ;82DEDC;
    LDA.W $07A7                                                          ;82DEDF;
    STA.W HW_WRMPYB                                                      ;82DEE2;
    REP #$20                                                             ;82DEE5;
    NOP                                                                  ;82DEE7;
    NOP                                                                  ;82DEE8;
    NOP                                                                  ;82DEE9;
    LDA.W HW_RDMPY                                                       ;82DEEA;
    ASL A                                                                ;82DEED;
    STA.W $07B9                                                          ;82DEEE;
    RTS                                                                  ;82DEF1;


Load_State_Header:
    PEA.W $8F00                                                          ;82DEF2;
    PLB                                                                  ;82DEF5;
    PLB                                                                  ;82DEF6;
    LDX.W $07BB                                                          ;82DEF7;
    LDA.W $0003,X                                                        ;82DEFA;
    AND.W #$00FF                                                         ;82DEFD;
    ASL A                                                                ;82DF00;
    TAY                                                                  ;82DF01;
    LDX.W Tileset_Pointers,Y                                             ;82DF02;
    LDA.W $0001,X                                                        ;82DF05;
    STA.W $07C1                                                          ;82DF08;
    LDA.W $0000,X                                                        ;82DF0B;
    STA.W $07C0                                                          ;82DF0E;
    LDA.W $0004,X                                                        ;82DF11;
    STA.W $07C4                                                          ;82DF14;
    LDA.W $0003,X                                                        ;82DF17;
    STA.W $07C3                                                          ;82DF1A;
    LDA.W $0007,X                                                        ;82DF1D;
    STA.W $07C7                                                          ;82DF20;
    LDA.W $0006,X                                                        ;82DF23;
    STA.W $07C6                                                          ;82DF26;
    LDX.W $07BB                                                          ;82DF29;
    LDA.W $0001,X                                                        ;82DF2C;
    STA.W $07BE                                                          ;82DF2F;
    LDA.W $0000,X                                                        ;82DF32;
    STA.W $07BD                                                          ;82DF35;
    LDA.W $0004,X                                                        ;82DF38;
    AND.W #$00FF                                                         ;82DF3B;
    STA.W $07CB                                                          ;82DF3E;
    LDA.W $0005,X                                                        ;82DF41;
    AND.W #$00FF                                                         ;82DF44;
    STA.W $07C9                                                          ;82DF47;
    LDA.W $0006,X                                                        ;82DF4A;
    STA.W $07CD                                                          ;82DF4D;
    LDA.W $0008,X                                                        ;82DF50;
    STA.W $07CF                                                          ;82DF53;
    LDA.W $000A,X                                                        ;82DF56;
    STA.W $07D1                                                          ;82DF59;
    LDA.W $000C,X                                                        ;82DF5C;
    STA.W $091B                                                          ;82DF5F;
    LDA.W $0012,X                                                        ;82DF62;
    STA.W $07DF                                                          ;82DF65;
    RTS                                                                  ;82DF68;


WaitUntilTheEndOfAVBlank_and_Enable_H_V_CounterInterrupts:
    PHP                                                                  ;82DF69;
    SEP #$20                                                             ;82DF6A;
    JSL.L WaitUntilTheEndOfAVBlank                                       ;82DF6C;
    LDA.B $84                                                            ;82DF70;
    AND.B #$30                                                           ;82DF72;
    CMP.B #$30                                                           ;82DF74;
    BEQ .return                                                          ;82DF76;
    JSL.L EnableHVCounterInterruptsNow                                   ;82DF78;

.return:
    REP #$20                                                             ;82DF7C;
    PLP                                                                  ;82DF7E;
    RTS                                                                  ;82DF7F;


Much_ado_about_nothing:
    PHP                                                                  ;82DF80;
    SEP #$20                                                             ;82DF81;
    LDA.L EnableHVCounterInterrupts                                      ;82DF83; >.<
    CMP.L Much_ado_about_nothing                                         ;82DF87; >.<
    BEQ .return                                                          ;82DF8B;
    JSL.L DisableHVCounterInterrupts                                     ;82DF8D;
    JSL.L EnableHVCounterInterrupts                                      ;82DF91;

.return:
    REP #$20                                                             ;82DF95; >.<
    PLP                                                                  ;82DF97;
    RTS                                                                  ;82DF98;


Save_Map_Explored_If_Elevator:
    LDA.W $0793                                                          ;82DF99;
    AND.W #$000F                                                         ;82DF9C;
    BEQ +                                                                ;82DF9F;
    JSL.L SetDebugElevatorAsUsed                                         ;82DFA1;

  + LDX.W $078D                                                          ;82DFA5;
    LDA.L $830002,X                                                      ;82DFA8;
    BIT.W #$0040                                                         ;82DFAC;
    BEQ .return                                                          ;82DFAF;
    JSL.L MirrorCurrentAreasMapExplored                                  ;82DFB1;

.return:
    RTS                                                                  ;82DFB5;


Load_Map_Explored_If_Elevator:
    LDX.W $078D                                                          ;82DFB6;
    LDA.L $830002,X                                                      ;82DFB9;
    BIT.W #$0040                                                         ;82DFBD;
    BEQ .return                                                          ;82DFC0;
    JSL.L LoadMirrorOfCurrentAreasMapExplored                            ;82DFC2;

.return:
    RTS                                                                  ;82DFC6;


Draw_Inanimate_Samus_Bank82:
    LDA.W $0E16                                                          ;82DFC7;
    BNE .return                                                          ;82DFCA;
    JSL.L Draw_Inanimate_Samus                                           ;82DFCC;

.return:
    RTS                                                                  ;82DFD0;


Load_EnemyGFX_to_VRAM:
    LDA.W #$7000                                                         ;82DFD1;
    STA.B $12                                                            ;82DFD4;
    LDX.W $07D1                                                          ;82DFD6;
    BEQ .return                                                          ;82DFD9;
    TXY                                                                  ;82DFDB;

.loop:
    LDA.L $B40000,X                                                      ;82DFDC;
    CMP.W #$FFFF                                                         ;82DFE0;
    BEQ .return                                                          ;82DFE3;
    TAX                                                                  ;82DFE5;
    LDA.L $A00036,X                                                      ;82DFE6;
    STA.W $05C0                                                          ;82DFEA;
    LDA.L $A00037,X                                                      ;82DFED;
    STA.W $05C1                                                          ;82DFF1;
    LDA.L $A00000,X                                                      ;82DFF4;
    BMI +                                                                ;82DFF8;
    STA.W $05C3                                                          ;82DFFA;
    LDA.B $12                                                            ;82DFFD;
    STA.W $05BE                                                          ;82DFFF;
    LDA.L $A00000,X                                                      ;82E002;
    LSR A                                                                ;82E006;
    CLC                                                                  ;82E007;
    ADC.B $12                                                            ;82E008;
    STA.B $12                                                            ;82E00A;
    BRA .doorFlag                                                        ;82E00C;


  + AND.W #$7FFF                                                         ;82E00E;
    STA.W $05C3                                                          ;82E011;
    TYX                                                                  ;82E014;
    LDA.L $B40002,X                                                      ;82E015;
    AND.W #$F000                                                         ;82E019;
    LSR A                                                                ;82E01C;
    LSR A                                                                ;82E01D;
    LSR A                                                                ;82E01E;
    LSR A                                                                ;82E01F;
    ORA.W #$6000                                                         ;82E020;
    STA.W $05BE                                                          ;82E023;

.doorFlag:
    LDA.W #$8000                                                         ;82E026;
    TSB.W $05BC                                                          ;82E029;

.wait:
    LDA.W $05BC                                                          ;82E02C;
    BMI .wait                                                            ;82E02F;
    INY                                                                  ;82E031;
    INY                                                                  ;82E032;
    INY                                                                  ;82E033;
    INY                                                                  ;82E034;
    TYX                                                                  ;82E035;
    BRA .loop                                                            ;82E036;


.return:
    RTS                                                                  ;82E038;


Perform_Door_Transition_VRAM_Update:
    LDA.B $01,S                                                          ;82E039;
    INC A                                                                ;82E03B;
    STA.B $AD                                                            ;82E03C;
    PHB                                                                  ;82E03E;
    PHK                                                                  ;82E03F;
    PLB                                                                  ;82E040;
    LDA.B ($AD)                                                          ;82E041;
    STA.W $05C0                                                          ;82E043;
    INC.B $AD                                                            ;82E046;
    LDA.B ($AD)                                                          ;82E048;
    STA.W $05C1                                                          ;82E04A;
    INC.B $AD                                                            ;82E04D;
    INC.B $AD                                                            ;82E04F;
    LDA.B ($AD)                                                          ;82E051;
    STA.W $05BE                                                          ;82E053;
    INC.B $AD                                                            ;82E056;
    INC.B $AD                                                            ;82E058;
    LDA.B ($AD)                                                          ;82E05A;
    STA.W $05C3                                                          ;82E05C;
    PLB                                                                  ;82E05F;
    LDA.B $AD                                                            ;82E060;
    INC A                                                                ;82E062;
    STA.B $01,S                                                          ;82E063;
    LDA.W #$8000                                                         ;82E065;
    TSB.W $05BC                                                          ;82E068;

.wait:
    LDA.W $05BC                                                          ;82E06B;
    BMI .wait                                                            ;82E06E;
    RTS                                                                  ;82E070;


Queue_Room_Music_Data:
    PHP                                                                  ;82E071;
    PHB                                                                  ;82E072;
    REP #$30                                                             ;82E073;
    LDA.W $0998                                                          ;82E075;
    CMP.W #$0028                                                         ;82E078;
    BCS .return                                                          ;82E07B;
    LDA.W $07CB                                                          ;82E07D;
    BEQ .return                                                          ;82E080;
    CMP.W $07F3                                                          ;82E082;
    BEQ .return                                                          ;82E085;
    LDA.W #$0000                                                         ;82E087;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;82E08A;
    LDA.W $07CB                                                          ;82E08E;
    ORA.W #$FF00                                                         ;82E091;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;82E094;

.return:
    PLB                                                                  ;82E098;
    PLP                                                                  ;82E099;
    RTL                                                                  ;82E09A;


Update_Music_Track_Index:
    PHP                                                                  ;82E09B;
    PHB                                                                  ;82E09C;
    REP #$30                                                             ;82E09D;
    LDA.W $0998                                                          ;82E09F;
    CMP.W #$0028                                                         ;82E0A2;
    BCS .return                                                          ;82E0A5;
    LDA.W $07C9                                                          ;82E0A7;
    BEQ .return                                                          ;82E0AA;
    LDA.W $07CA                                                          ;82E0AC;
    AND.W #$FF00                                                         ;82E0AF;
    STA.B $12                                                            ;82E0B2;
    LDA.W $07C9                                                          ;82E0B4;
    TSB.B $12                                                            ;82E0B7;
    LDA.W $07F2                                                          ;82E0B9;
    AND.W #$FF00                                                         ;82E0BC;
    STA.B $14                                                            ;82E0BF;
    LDA.W $07F5                                                          ;82E0C1;
    TSB.B $14                                                            ;82E0C4;
    LDA.B $12                                                            ;82E0C6;
    CMP.B $14                                                            ;82E0C8;
    BEQ .return                                                          ;82E0CA;
    LDA.W $07C9                                                          ;82E0CC;
    STA.W $07F5                                                          ;82E0CF;

.return:
    PLB                                                                  ;82E0D2;
    PLP                                                                  ;82E0D3;
    RTL                                                                  ;82E0D4;


Load_New_Music_Track_If_Changed:
    PHP                                                                  ;82E0D5;
    PHB                                                                  ;82E0D6;
    REP #$30                                                             ;82E0D7;
    LDA.W $0998                                                          ;82E0D9;
    CMP.W #$0028                                                         ;82E0DC;
    BCS .return                                                          ;82E0DF;
    LDA.W $07C9                                                          ;82E0E1;
    BEQ .return                                                          ;82E0E4;
    LDA.W $07CA                                                          ;82E0E6;
    AND.W #$FF00                                                         ;82E0E9;
    STA.B $12                                                            ;82E0EC;
    LDA.W $07C9                                                          ;82E0EE;
    TSB.B $12                                                            ;82E0F1;
    LDA.W $07F2                                                          ;82E0F3;
    AND.W #$FF00                                                         ;82E0F6;
    STA.B $14                                                            ;82E0F9;
    LDA.W $07F5                                                          ;82E0FB;
    TSB.B $14                                                            ;82E0FE;
    LDA.B $12                                                            ;82E100;
    CMP.B $14                                                            ;82E102;
    BEQ .return                                                          ;82E104;
    LDY.W #$0006                                                         ;82E106;
    LDA.W $07C9                                                          ;82E109;
    JSL.L QueueMusicDataOrTrack_YFrameDelay                              ;82E10C;

.return:
    PLB                                                                  ;82E110;
    PLP                                                                  ;82E111;
    RTL                                                                  ;82E112;


RTL_82E113:
    PHP                                                                  ;82E113;
    REP #$20                                                             ;82E114;
    PLP                                                                  ;82E116;
    RTL                                                                  ;82E117;


Play_Room_Music_Track_After_A_Frames:
    PHP                                                                  ;82E118;
    PHB                                                                  ;82E119;
    REP #$30                                                             ;82E11A;
    PHY                                                                  ;82E11C;
    TAY                                                                  ;82E11D;
    LDA.W $0998                                                          ;82E11E;
    CMP.W #$0028                                                         ;82E121;
    BCS .return                                                          ;82E124;
    LDA.W #$0000                                                         ;82E126;
    JSL.L QueueMusicDataOrTrack_YFrameDelay                              ;82E129;
    LDA.W $07F5                                                          ;82E12D;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;82E130;

.return:
    PLY                                                                  ;82E134;
    PLB                                                                  ;82E135;
    PLP                                                                  ;82E136;
    RTL                                                                  ;82E137;


RTL_82E138:
    RTL                                                                  ;82E138;


Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies:
    REP #$30                                                             ;82E139;
    LDX.W #$001E                                                         ;82E13B;

  - LDA.L Initial_Palette_spritePalette5,X                               ;82E13E;
    STA.L $7EC3A0,X                                                      ;82E142;
    DEX                                                                  ;82E146;
    DEX                                                                  ;82E147;
    BPL -                                                                ;82E148;
    LDX.W #$001E                                                         ;82E14A;

  - LDA.L $7EC1C0,X                                                      ;82E14D;
    STA.L $7EC3C0,X                                                      ;82E151;
    DEX                                                                  ;82E155;
    DEX                                                                  ;82E156;
    BPL -                                                                ;82E157;
    LDX.W #$001E                                                         ;82E159;

  - LDA.L Standard_Target_Sprite_Palette_Line0,X                         ;82E15C;
    STA.L $7EC300,X                                                      ;82E160;
    DEX                                                                  ;82E164;
    DEX                                                                  ;82E165;
    BPL -                                                                ;82E166;
    RTL                                                                  ;82E168;


GameState_9_HitADoorBlock:
    PHP                                                                  ;82E169;
    REP #$30                                                             ;82E16A;
    PEA.W .manualReturn-1                                                ;82E16C;
    JMP.W ($099C)                                                        ;82E16F;


.manualReturn:
    BCS .gameStateA                                                      ;82E172;
    PLP                                                                  ;82E174;
    RTS                                                                  ;82E175;


.gameStateA:
    INC.W $0998                                                          ;82E176;
    PLP                                                                  ;82E179;
    JMP.W GameState_A_LoadingNextRoom                                    ;82E17A;


DoorTransitionFunction_HandleElevator:
    LDA.W $0E16                                                          ;82E17D;
    BEQ .return                                                          ;82E180;
    LDA.W #$0000                                                         ;82E182;
    JSL.L Run_Samus_Command                                              ;82E185;
    LDA.W $0799                                                          ;82E189;
    BMI .return                                                          ;82E18C;
    LDA.W #$0030                                                         ;82E18E;
    STA.W $092F                                                          ;82E191;
    LDA.W #DoorTransitionFunction_Wait48FramesForDownElevator            ;82E194;
    STA.W $099C                                                          ;82E197;
    JMP.W DoorTransitionFunction_Wait48FramesForDownElevator             ;82E19A;


.return:
    SEC                                                                  ;82E19D;
    RTS                                                                  ;82E19E;


DoorTransitionFunction_Wait48FramesForDownElevator:
    DEC.W $092F                                                          ;82E19F;
    BMI .return                                                          ;82E1A2;
    JSL.L Determine_Which_Enemies_to_Process                             ;82E1A4;
    JSL.L Main_Enemy_Routine                                             ;82E1A8;
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles           ;82E1AC;
    JSR.W Draw_Inanimate_Samus_Bank82                                    ;82E1B0;
    CLC                                                                  ;82E1B3;
    RTS                                                                  ;82E1B4;


.return:
    SEC                                                                  ;82E1B5;
    RTS                                                                  ;82E1B6;


GameState_A_LoadingNextRoom:
    PHP                                                                  ;82E1B7;
    PHB                                                                  ;82E1B8;
    REP #$30                                                             ;82E1B9;
    LDA.W #$0001                                                         ;82E1BB;
    STA.W $0797                                                          ;82E1BE;
    STA.W $0795                                                          ;82E1C1;
    STZ.W $05F7                                                          ;82E1C4;
    STZ.W $1E75                                                          ;82E1C7;
    JSL.L Determine_Which_Enemies_to_Process                             ;82E1CA;
    JSL.L Main_Enemy_Routine                                             ;82E1CE;
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles           ;82E1D2;
    JSR.W Draw_Inanimate_Samus_Bank82                                    ;82E1D6;
    JSR.W Load_Destination_RoomCRE_Bitset                                ;82E1D9;
    PEA.W $7E00                                                          ;82E1DC;
    PLB                                                                  ;82E1DF;
    PLB                                                                  ;82E1E0;
    LDX.W #$00FE                                                         ;82E1E1;
    LDA.W #$0000                                                         ;82E1E4;

  - STA.W $C200,X                                                        ;82E1E7;
    STA.W $C300,X                                                        ;82E1EA;
    DEX                                                                  ;82E1ED;
    DEX                                                                  ;82E1EE;
    BPL -                                                                ;82E1EF;
    LDA.W $C012                                                          ;82E1F1;
    STA.W $C212                                                          ;82E1F4;
    LDA.W $C014                                                          ;82E1F7;
    STA.W $C214                                                          ;82E1FA;
    LDA.W $C01A                                                          ;82E1FD;
    STA.W $C21A                                                          ;82E200;
    LDA.W $C01C                                                          ;82E203;
    STA.W $C21C                                                          ;82E206;
    LDA.W $C022                                                          ;82E209;
    STA.W $C222                                                          ;82E20C;
    LDA.W $C024                                                          ;82E20F;
    STA.W $C224                                                          ;82E212;
    LDA.W $C026                                                          ;82E215;
    STA.W $C226                                                          ;82E218;
    LDA.W $C03A                                                          ;82E21B;
    STA.W $C23A                                                          ;82E21E;
    LDA.W $07B3                                                          ;82E221;
    ORA.W $07B1                                                          ;82E224;
    BIT.W #$0001                                                         ;82E227;
    BNE .clearSounds                                                     ;82E22A;
    LDA.W $C028                                                          ;82E22C;
    STA.W $C228                                                          ;82E22F;
    LDA.W $C02A                                                          ;82E232;
    STA.W $C22A                                                          ;82E235;
    LDA.W $C02C                                                          ;82E238;
    STA.W $C22C                                                          ;82E23B;
    LDA.W $C02E                                                          ;82E23E;
    STA.W $C22E                                                          ;82E241;
    LDA.W $C038                                                          ;82E244;
    STA.W $C238                                                          ;82E247;
    LDA.W $0943                                                          ;82E24A;
    BEQ .clearSounds                                                     ;82E24D;
    LDA.W $C1A2                                                          ;82E24F;
    STA.W $C3A2                                                          ;82E252;
    LDA.W $C1A4                                                          ;82E255;
    STA.W $C3A4                                                          ;82E258;
    LDA.W $C1A8                                                          ;82E25B;
    STA.W $C3A8                                                          ;82E25E;
    LDA.W $C1BA                                                          ;82E261;
    STA.W $C3BA                                                          ;82E264;
    JSL.L DrawTimer                                                      ;82E267;

.clearSounds:
    JSL.L Clear_Sounds_When_Going_Through_Door                           ;82E26B;
    LDA.W #$0071                                                         ;82E26F;
    JSL.L QueueSound_Lib2_Max15                                          ;82E272;
    LDA.W #$FFFF                                                         ;82E276;
    STA.W $05F5                                                          ;82E279;
    LDA.W #DoorTransitionFunction_WaitForSoundsToFinish                  ;82E27C;
    STA.W $099C                                                          ;82E27F;
    INC.W $0998                                                          ;82E282;
    PLB                                                                  ;82E285;
    PLP                                                                  ;82E286;
    RTS                                                                  ;82E287;


GameState_B_LoadingNextRoom:
    PHP                                                                  ;82E288;
    PHB                                                                  ;82E289;
    REP #$30                                                             ;82E28A;
    PEA.W .manualReturn-1                                                ;82E28C;
    JMP.W ($099C)                                                        ;82E28F;


.manualReturn:
    LDA.W $0943                                                          ;82E292;
    BEQ .return                                                          ;82E295;
    JSL.L DrawTimer                                                      ;82E297;

.return:
    PLB                                                                  ;82E29B;
    PLP                                                                  ;82E29C;
    RTS                                                                  ;82E29D;


DoorTransitionFunction_WaitForSoundsToFinish:
    PHP                                                                  ;82E29E;
    JSL.L Determine_Which_Enemies_to_Process                             ;82E29F;
    JSL.L Main_Enemy_Routine                                             ;82E2A3;
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles           ;82E2A7;
    JSR.W Draw_Inanimate_Samus_Bank82                                    ;82E2AB;
    SEP #$20                                                             ;82E2AE;
    LDA.W $0646                                                          ;82E2B0;
    SEC                                                                  ;82E2B3;
    SBC.W $0643                                                          ;82E2B4;
    AND.B #$0F                                                           ;82E2B7;
    BNE .return                                                          ;82E2B9;
    LDA.W $0647                                                          ;82E2BB;
    SEC                                                                  ;82E2BE;
    SBC.W $0644                                                          ;82E2BF;
    AND.B #$0F                                                           ;82E2C2;
    BNE .return                                                          ;82E2C4;
    LDA.W $0648                                                          ;82E2C6;
    SEC                                                                  ;82E2C9;
    SBC.W $0645                                                          ;82E2CA;
    AND.B #$0F                                                           ;82E2CD;
    BNE .return                                                          ;82E2CF;
    REP #$20                                                             ;82E2D1;
    LDA.W #DoorTransitionFunction_FadeOutTheScreen                       ;82E2D3;
    STA.W $099C                                                          ;82E2D6;

.return:
    PLP                                                                  ;82E2D9;
    RTS                                                                  ;82E2DA;


DoorTransitionFunction_FadeOutTheScreen:
    JSR.W Advance_GradualColorChange_ofAllPalettes_Denominator_C         ;82E2DB;
    BCS +                                                                ;82E2DE;
    JSL.L Determine_Which_Enemies_to_Process                             ;82E2E0;
    JSL.L Main_Enemy_Routine                                             ;82E2E4;
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles           ;82E2E8;
    JSR.W Draw_Inanimate_Samus_Bank82                                    ;82E2EC;
    RTS                                                                  ;82E2EF;


  + LDA.W #DoorTransitionFunction_LoadDoorHeader_DeleteHDMAObjects_IRQ   ;82E2F0;
    STA.W $099C                                                          ;82E2F3;
    RTS                                                                  ;82E2F6;


DoorTransitionFunction_LoadDoorHeader_DeleteHDMAObjects_IRQ:
    JSR.W Load_Door_Header                                               ;82E2F7;
    JSL.L Delete_HDMAObjects                                             ;82E2FA;
    LDA.W #$8000                                                         ;82E2FE;
    TRB.W $18B0                                                          ;82E301;
    LDA.W #$0008                                                         ;82E304;
    STA.B $A7                                                            ;82E307;
    LDA.W #DoorTransitionFunction_ScrollScreenToAlignment                ;82E309;
    STA.W $099C                                                          ;82E30C;
    RTS                                                                  ;82E30F;


DoorTransitionFunction_ScrollScreenToAlignment:
    PEA.W $8F00                                                          ;82E310;
    PLB                                                                  ;82E313;
    PLB                                                                  ;82E314;
    LDA.W $0791                                                          ;82E315;
    BIT.W #$0002                                                         ;82E318;
    BNE .vertical                                                        ;82E31B;
    LDA.W $0914                                                          ;82E31D;
    BIT.W #$FF00                                                         ;82E320;
    BEQ .done                                                            ;82E323;
    BMI +                                                                ;82E325;
    DEC.W $0915                                                          ;82E327;
    BRA .return                                                          ;82E32A;


  + INC.W $0915                                                          ;82E32C;
    BRA .return                                                          ;82E32F;


.vertical:
    LDA.W $0910                                                          ;82E331;
    BIT.W #$FF00                                                         ;82E334;
    BEQ .done                                                            ;82E337;
    BMI +                                                                ;82E339;
    DEC.W $0911                                                          ;82E33B;
    BRA .return                                                          ;82E33E;


  + INC.W $0911                                                          ;82E340;

.return:
    JSL.L Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling   ;82E343;
    RTS                                                                  ;82E347;


.done:
    JSL.L Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling   ;82E348;
    LDA.W #DoorTransitionFunction_FixDoorsMovingUp                       ;82E34C;
    STA.W $099C                                                          ;82E34F;
    RTS                                                                  ;82E352;


DoorTransitionFunction_FixDoorsMovingUp:
    PEA.W $8F00                                                          ;82E353;
    PLB                                                                  ;82E356;
    PLB                                                                  ;82E357;
    LDA.W $0791                                                          ;82E358;
    AND.W #$0003                                                         ;82E35B;
    CMP.W #$0003                                                         ;82E35E;
    BNE +                                                                ;82E361;
    JSL.L DrawTopRowOfScreenForUpwardsDoorTransition                     ;82E363;

  + LDA.W #DoorTransitionFunction_LoadRoomHeader_SetupMap_Decompress     ;82E367;
    STA.W $099C                                                          ;82E36A;
    RTS                                                                  ;82E36D;


DoorTransitionFunction_LoadRoomHeader_SetupMap_Decompress:
    PEA.W $8F00                                                          ;82E36E;
    PLB                                                                  ;82E371;
    PLB                                                                  ;82E372;
    JSR.W Save_Map_Explored_If_Elevator                                  ;82E373;
    JSR.W Load_Room_Header                                               ;82E376;
    JSR.W Load_State_Header                                              ;82E379;
    JSR.W Load_Map_Explored_If_Elevator                                  ;82E37C;
    JSL.L Initialise_Special_Effects_for_New_Room                        ;82E37F;
    JSL.L Load_Level_Scroll_and_CRE_Data                                 ;82E383;
    LDA.W #DoorTransitionFunction_SetupScrolling                         ;82E387;
    STA.W $099C                                                          ;82E38A;
    RTS                                                                  ;82E38D;


DoorTransitionFunction_SetupScrolling:
    PEA.W $8F00                                                          ;82E38E;
    PLB                                                                  ;82E391;
    PLB                                                                  ;82E392;
    STZ.B $B5                                                            ;82E393;
    STZ.B $B7                                                            ;82E395;
    STZ.W $07E9                                                          ;82E397;
    LDA.W $0791                                                          ;82E39A;
    AND.W #$0003                                                         ;82E39D;
    CMP.W #$0002                                                         ;82E3A0;
    BNE +                                                                ;82E3A3;
    INC.B $B3                                                            ;82E3A5;

  + LDA.W $0791                                                          ;82E3A7;
    AND.W #$0003                                                         ;82E3AA;
    CMP.W #$0003                                                         ;82E3AD;
    BEQ +                                                                ;82E3B0;
    STZ.W $0925                                                          ;82E3B2;

  + JSL.L DoorTransitionScrollingSetup                                   ;82E3B5;
    LDA.W #DoorTransitionFunction_PlaceSamus_LoadTiles                   ;82E3B9;
    STA.W $099C                                                          ;82E3BC;
    RTS                                                                  ;82E3BF;


DoorTransitionFunction_PlaceSamus_LoadTiles:
    PEA.W $8F00                                                          ;82E3C0;
    PLB                                                                  ;82E3C3;
    PLB                                                                  ;82E3C4;
    LDA.W $0AF6                                                          ;82E3C5;
    AND.W #$00FF                                                         ;82E3C8;
    CLC                                                                  ;82E3CB;
    ADC.W $0911                                                          ;82E3CC;
    STA.W $0AF6                                                          ;82E3CF;
    STA.W $0B10                                                          ;82E3D2;
    LDA.W $0AFA                                                          ;82E3D5;
    AND.W #$00FF                                                         ;82E3D8;
    CLC                                                                  ;82E3DB;
    ADC.W $0915                                                          ;82E3DC;
    STA.W $0AFA                                                          ;82E3DF;
    STA.W $0B14                                                          ;82E3E2;
    STZ.W $0931                                                          ;82E3E5;
    STZ.W $05BC                                                          ;82E3E8;
    LDA.W $0791                                                          ;82E3EB;
    AND.W #$0003                                                         ;82E3EE;
    CMP.W #$0002                                                         ;82E3F1;
    BNE .horizontal                                                      ;82E3F4;
    LDA.W #$0010                                                         ;82E3F6;
    BRA .vertical                                                        ;82E3F9;


.horizontal:
    LDA.W #$0016                                                         ;82E3FB;

.vertical:
    STA.B $A7                                                            ;82E3FE;
    JSR.W WaitUntilTheEndOfAVBlank_and_Enable_H_V_CounterInterrupts      ;82E400;
    LDA.W $07B3                                                          ;82E403;
    BIT.W #$0002                                                         ;82E406;
    BEQ .decompress                                                      ;82E409;
    LDA.W $078D                                                          ;82E40B;
    CMP.W #Door_PostCrocShaft_0                                          ;82E40E;
    BEQ .decompress                                                      ;82E411;
    LDA.W #CRE_Tiles_Compressed>>8&$FF00                                 ;82E413;
    STA.B $48                                                            ;82E416;
    LDA.W #CRE_Tiles_Compressed                                          ;82E418;
    STA.B $47                                                            ;82E41B;
    JSL.L Decompression_HardcodedDestination                             ;82E41D;
    dl $7E7000                                                           ;82E421;

.decompress:
    LDA.W $07C4                                                          ;82E424;
    STA.B $48                                                            ;82E427;
    LDA.W $07C3                                                          ;82E429;
    STA.B $47                                                            ;82E42C;
    JSL.L Decompression_HardcodedDestination                             ;82E42E;
    dl $7E2000                                                           ;82E432;
    LDA.W $07C7                                                          ;82E435;
    STA.B $48                                                            ;82E438;
    LDA.W $07C6                                                          ;82E43A;
    STA.B $47                                                            ;82E43D;
    JSL.L Decompression_HardcodedDestination                             ;82E43F;
    dl $7EC200                                                           ;82E443;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E446;
    dl $7E2000                                                           ;82E449;
    dw $0000,$2000                                                       ;82E44C;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E450;
    dl $7E4000                                                           ;82E453;
    dw $1000,$2000                                                       ;82E456;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E45A;
    dl $7E6000                                                           ;82E45D;
    dw $2000,$1000                                                       ;82E460;
    LDA.W $07B3                                                          ;82E464;
    BIT.W #$0006                                                         ;82E467;
    BEQ .checkUp                                                         ;82E46A;
    LDA.W $078D                                                          ;82E46C;
    CMP.W #Door_PostCrocShaft_0                                          ;82E46F;
    BEQ .checkUp                                                         ;82E472;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E474;
    dl $7E7000                                                           ;82E477;
    dw $2800,$1000                                                       ;82E47A;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E47E;
    dl $7E8000                                                           ;82E481;
    dw $3000,$2000                                                       ;82E484;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E488;
    dl Tiles_Standard_BG3                                                ;82E48B;
    dw $4000,$1000                                                       ;82E48E;

.checkUp:
    LDA.W $0791                                                          ;82E492;
    AND.W #$0003                                                         ;82E495;
    CMP.W #$0003                                                         ;82E498;
    BNE +                                                                ;82E49B;
    LDA.W #$0010                                                         ;82E49D;
    STA.B $A7                                                            ;82E4A0;

  + LDA.W #DoorTransitionFunction_LoadSpritesBGPLMsAudio_RunDoorRoomASM  ;82E4A2;
    STA.W $099C                                                          ;82E4A5;
    RTS                                                                  ;82E4A8;


DoorTransitionFunction_LoadSpritesBGPLMsAudio_RunDoorRoomASM:
    PHP                                                                  ;82E4A9;
    JSR.W Load_EnemyGFX_to_VRAM                                          ;82E4AA;
    JSL.L Queue_Room_Music_Data                                          ;82E4AD;
    JSL.L Clear_Enemy_Projectiles                                        ;82E4B1;
    JSL.L Clear_AnimatedTilesObjects                                     ;82E4B5;
    JSL.L Clear_PaletteFXObjects                                         ;82E4B9;
    JSL.L Clear_PLMs                                                     ;82E4BD;
    JSL.L CreatePLMs_ExecuteDoorASM_RoomSetupASM_SetElevatorStatus       ;82E4C1;
    JSL.L Load_FX_Header                                                 ;82E4C5;
    JSR.W Spawn_Door_Closing_PLM                                         ;82E4C9;
    JSL.L Update_Beam_Tiles_and_Palette                                  ;82E4CC;
    JSL.L Load_Target_Colors_for_Common_SpritesBeamsFlashingEnemies      ;82E4D0;
    JSL.L Load_Enemies                                                   ;82E4D4;
    JSL.L Initialise_Enemies                                             ;82E4D8;
    JSL.L Reset_Projectile_Data                                          ;82E4DC;
    JSL.L LoadSamusSuitTargetPalette                                     ;82E4E0;
    PLP                                                                  ;82E4E4;
    PEA.W $8F00                                                          ;82E4E5;
    PLB                                                                  ;82E4E8;
    PLB                                                                  ;82E4E9;
    JSR.W Clear_FX_Tilemap_bank82                                        ;82E4EA;
    LDA.W #$8A00                                                         ;82E4ED;
    STA.W $05C1                                                          ;82E4F0;
    LDA.W $1964                                                          ;82E4F3;
    BEQ +                                                                ;82E4F6;
    STA.W $05C0                                                          ;82E4F8;
    LDA.W #$5BE0                                                         ;82E4FB;
    STA.W $05BE                                                          ;82E4FE;
    LDA.W #$0840                                                         ;82E501;
    STA.W $05C3                                                          ;82E504;
    LDA.W #$8000                                                         ;82E507;
    TSB.W $05BC                                                          ;82E50A;

.waitVRAM:
    BIT.W $05BC                                                          ;82E50D;
    BMI .waitVRAM                                                        ;82E510;

  + LDX.W $07BB                                                          ;82E512;
    LDY.W $0016,X                                                        ;82E515;
    BPL .noLibraryBackground                                             ;82E518;

.loop:
    LDX.W $0000,Y                                                        ;82E51A;
    INY                                                                  ;82E51D;
    INY                                                                  ;82E51E;
    JSR.W (Library_Background_Function_Pointers,X)                       ;82E51F;
    BCC .loop                                                            ;82E522;

.noLibraryBackground:
    REP #$30                                                             ;82E524;

.waitDoor:
    LDA.W $0931                                                          ;82E526;
    BPL .waitDoor                                                        ;82E529;
    LDA.W #$3BE0                                                         ;82E52B;
    STA.L $7EC188                                                        ;82E52E;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;82E532;
    LDA.W #$8000                                                         ;82E536;
    TSB.W $18B0                                                          ;82E539;
    JSL.L PLM_Handler                                                    ;82E53C;
    JSL.L WaitForNMI                                                     ;82E540;
    LDA.W $0791                                                          ;82E544;
    BIT.W #$0002                                                         ;82E547;
    BNE .return                                                          ;82E54A;
    AND.W #$0003                                                         ;82E54C;
    BEQ .right                                                           ;82E54F;
    LDA.W #$0007                                                         ;82E551;
    TRB.W $0AF6                                                          ;82E554;
    BRA .return                                                          ;82E557;


.right:
    LDA.W #$0007                                                         ;82E559;
    TSB.W $0AF6                                                          ;82E55C;

.return:
    LDA.W #DoorTransitionFunction_HandleAnimatedTiles                    ;82E55F;
    STA.W $099C                                                          ;82E562;
    RTS                                                                  ;82E565;


Clear_FX_Tilemap_bank82:
    LDX.W #$077E                                                         ;82E566;
    LDA.W #$184E                                                         ;82E569;

.loop:
    STA.L $7E4000,X                                                      ;82E56C;
    STA.L $7E4780,X                                                      ;82E570;
    DEX                                                                  ;82E574;
    DEX                                                                  ;82E575;
    BPL .loop                                                            ;82E576;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E578;
    dl $7E4000                                                           ;82E57B;
    dw $5880,$0F00                                                       ;82E57E;
    RTS                                                                  ;82E582;


Clear_BG2_Tilemap_bank82:
    LDX.W #$07FE                                                         ;82E583;
    LDA.W #$0338                                                         ;82E586;

.loop:
    STA.L $7E4000,X                                                      ;82E589;
    STA.L $7E4800,X                                                      ;82E58D;
    DEX                                                                  ;82E591;
    DEX                                                                  ;82E592;
    BPL .loop                                                            ;82E593;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E595;
    dl $7E4000                                                           ;82E598;
    dw $4800,$1000                                                       ;82E59B;
    RTS                                                                  ;82E59F;


Clear_Kraids_BG2_Tilemap:
    LDX.W #$07FE                                                         ;82E5A0;
    LDA.W #$0338                                                         ;82E5A3;

.loop:
    STA.L $7E4000,X                                                      ;82E5A6;
    STA.L $7E4800,X                                                      ;82E5AA;
    DEX                                                                  ;82E5AE;
    DEX                                                                  ;82E5AF;
    BPL .loop                                                            ;82E5B0;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E5B2;
    dl $7E4000                                                           ;82E5B5;
    dw $4000,$1000                                                       ;82E5B8;
    JSR.W Perform_Door_Transition_VRAM_Update                            ;82E5BC;
    dl $7E4000                                                           ;82E5BF;
    dw $4800,$1000                                                       ;82E5C2;
    RTS                                                                  ;82E5C6;


Library_Background_Function_Pointers:
    dw LoadLibraryBackground_0_Terminator                                ;82E5C7;
    dw LoadLibraryBackground_2_TransferToVRAM                            ;82E5C9;
    dw LoadLibraryBackground_4_Decompression                             ;82E5CB;
    dw LoadLibraryBackground_6_ClearFXTilemap                            ;82E5CD;
    dw LoadLibraryBackground_8_TransferToVRAM_SetBG3TilesBaseAddr        ;82E5CF;
    dw LoadLibraryBackground_A_ClearBG2Tilemap                           ;82E5D1;
    dw LoadLibraryBackground_C_ClearKraidsLayer2                         ;82E5D3;
    dw LoadLibraryBackground_E_DoorDependentTransferToVRAM               ;82E5D5;

LoadLibraryBackground_0_Terminator:
    SEC                                                                  ;82E5D7;
    RTS                                                                  ;82E5D8;


LoadLibraryBackground_E_DoorDependentTransferToVRAM:
    LDA.W $078D                                                          ;82E5D9;
    CMP.W $0000,Y                                                        ;82E5DC;
    BEQ +                                                                ;82E5DF;
    TYA                                                                  ;82E5E1;
    CLC                                                                  ;82E5E2;
    ADC.W #$0009                                                         ;82E5E3;
    TAY                                                                  ;82E5E6;
    CLC                                                                  ;82E5E7;
    RTS                                                                  ;82E5E8;


  + INY                                                                  ;82E5E9;
    INY                                                                  ;82E5EA;

LoadLibraryBackground_2_TransferToVRAM:
    LDA.W $0003,Y                                                        ;82E5EB;
    STA.W $05BE                                                          ;82E5EE;
    LDA.W $0000,Y                                                        ;82E5F1;
    STA.W $05C0                                                          ;82E5F4;
    LDA.W $0001,Y                                                        ;82E5F7;
    STA.W $05C1                                                          ;82E5FA;
    LDA.W $0005,Y                                                        ;82E5FD;
    STA.W $05C3                                                          ;82E600;
    LDA.W #$8000                                                         ;82E603;
    TSB.W $05BC                                                          ;82E606;

.wait:
    BIT.W $05BC                                                          ;82E609;
    BMI .wait                                                            ;82E60C;
    TYA                                                                  ;82E60E;
    CLC                                                                  ;82E60F;
    ADC.W #$0007                                                         ;82E610;
    TAY                                                                  ;82E613;
    CLC                                                                  ;82E614;
    RTS                                                                  ;82E615;


LoadLibraryBackground_4_Decompression:
    PHY                                                                  ;82E616;
    LDA.W $0000,Y                                                        ;82E617;
    STA.B $47                                                            ;82E61A;
    LDA.W $0001,Y                                                        ;82E61C;
    STA.B $48                                                            ;82E61F;
    LDA.W #$7E00                                                         ;82E621;
    STA.B $4D                                                            ;82E624;
    LDA.W $0003,Y                                                        ;82E626;
    STA.B $4C                                                            ;82E629;
    JSL.L Decompression_VariableDestination                              ;82E62B;
    PLA                                                                  ;82E62F;
    CLC                                                                  ;82E630;
    ADC.W #$0005                                                         ;82E631;
    TAY                                                                  ;82E634;
    CLC                                                                  ;82E635;
    RTS                                                                  ;82E636;


LoadLibraryBackground_6_ClearFXTilemap:
    PHY                                                                  ;82E637;
    JSR.W Clear_FX_Tilemap_bank82                                        ;82E638;
    PLY                                                                  ;82E63B;
    CLC                                                                  ;82E63C;
    RTS                                                                  ;82E63D;


LoadLibraryBackground_8_TransferToVRAM_SetBG3TilesBaseAddr:
    JSR.W LoadLibraryBackground_2_TransferToVRAM                         ;82E63E;
    SEP #$20                                                             ;82E641;
    LDA.B #$02                                                           ;82E643;
    STA.B $5E                                                            ;82E645;
    REP #$20                                                             ;82E647;
    CLC                                                                  ;82E649;
    RTS                                                                  ;82E64A;


LoadLibraryBackground_A_ClearBG2Tilemap:
    PHY                                                                  ;82E64B;
    JSR.W Clear_BG2_Tilemap_bank82                                       ;82E64C;
    PLY                                                                  ;82E64F;
    CLC                                                                  ;82E650;
    RTS                                                                  ;82E651;


LoadLibraryBackground_C_ClearKraidsLayer2:
    PHY                                                                  ;82E652;
    JSR.W Clear_Kraids_BG2_Tilemap                                       ;82E653;
    PLY                                                                  ;82E656;
    CLC                                                                  ;82E657;
    RTS                                                                  ;82E658;


DoorTransitionFunction_HandleAnimatedTiles:
    JSL.L AnimatedTilesObject_Handler                                    ;82E659;
    LDA.W #DoorTransitionFunction_WaitForMusicQueueClear_and_LoadMusic   ;82E65D;
    STA.W $099C                                                          ;82E660;
    RTS                                                                  ;82E663;


DoorTransitionFunction_WaitForMusicQueueClear_and_LoadMusic:
    JSL.L CheckIfMusicIsQueued                                           ;82E664;
    BCS .return                                                          ;82E668;
    LDA.W #DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor        ;82E66A;
    STA.W $099C                                                          ;82E66D;
    JSL.L Load_New_Music_Track_If_Changed                                ;82E670;

.return:
    RTS                                                                  ;82E674;


UNUSED_DoorTransitionFunction:
    JSL.L HandleMusicQueue                                               ;82E675;
    JSL.L Determine_Which_Enemies_to_Process                             ;82E679;
    STZ.W $0795                                                          ;82E67D;
    JSL.L Main_Enemy_Routine                                             ;82E680;
    INC.W $0795                                                          ;82E684;
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles           ;82E687;
    JSL.L Main_Scrolling_Routine                                         ;82E68B;
    JSR.W Draw_Inanimate_Samus_Bank82                                    ;82E68F;
    JSL.L Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling   ;82E692;
    DEC.W $092F                                                          ;82E696;
    BPL .return                                                          ;82E699;
    LDA.W #DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor        ;82E69B;
    STA.W $099C                                                          ;82E69E;

.return:
    RTS                                                                  ;82E6A1;


DoorTransitionFunction_NudgeSamusIfInterceptingTheDoor:
    LDA.W $0AF6                                                          ;82E6A2;
    AND.W #$00F0                                                         ;82E6A5;
    CMP.W #$0010                                                         ;82E6A8;
    BNE .X                                                               ;82E6AB;
    LDA.W $0AF6                                                          ;82E6AD;
    ORA.W #$000F                                                         ;82E6B0;
    CLC                                                                  ;82E6B3;
    ADC.W #$0008                                                         ;82E6B4;
    STA.W $0AF6                                                          ;82E6B7;
    BRA .Y                                                               ;82E6BA;


.X:
    CMP.W #$00E0                                                         ;82E6BC;
    BNE .Y                                                               ;82E6BF;
    LDA.W $0AF6                                                          ;82E6C1;
    AND.W #$FFF0                                                         ;82E6C4;
    SEC                                                                  ;82E6C7;
    SBC.W #$0008                                                         ;82E6C8;
    STA.W $0AF6                                                          ;82E6CB;

.Y:
    LDA.W $0AFA                                                          ;82E6CE;
    AND.W #$00F0                                                         ;82E6D1;
    CMP.W #$0010                                                         ;82E6D4;
    BNE .what                                                            ;82E6D7;
    LDA.W $0AFA                                                          ;82E6D9;
    ORA.W #$000F                                                         ;82E6DC;
    CLC                                                                  ;82E6DF;
    ADC.W #$0008                                                         ;82E6E0;
    STA.W $0AFA                                                          ;82E6E3;
    BRA +                                                                ;82E6E6;


.what:
    CMP.W #$00E0                                                         ;82E6E8;

  + PHB                                                                  ;82E6EB;
    PEA.W $7E00                                                          ;82E6EC;
    PLB                                                                  ;82E6EF;
    PLB                                                                  ;82E6F0;
    LDX.W #$01FE                                                         ;82E6F1;

.loop:
    STZ.W $9C00,X                                                        ;82E6F4;
    STZ.W $9E00,X                                                        ;82E6F7;
    DEX                                                                  ;82E6FA;
    DEX                                                                  ;82E6FB;
    BPL .loop                                                            ;82E6FC;
    PLB                                                                  ;82E6FE;
    LDA.B $A9                                                            ;82E6FF;
    BNE +                                                                ;82E701;
    LDA.W #$0004                                                         ;82E703;

  + STA.B $A7                                                            ;82E706;
    JSR.W Much_ado_about_nothing                                         ;82E708;
    LDA.W $0E16                                                          ;82E70B;
    BEQ .notElevator                                                     ;82E70E;
    BIT.W $0799                                                          ;82E710;
    BPL .samusCmd                                                        ;82E713;
    LDA.W #$0000                                                         ;82E715;
    JSL.L Run_Samus_Command                                              ;82E718;
    BRA .notElevator                                                     ;82E71C;


.samusCmd:
    LDA.W #$0007                                                         ;82E71E;
    JSL.L Run_Samus_Command                                              ;82E721;

.notElevator:
    JSL.L SetLiquidPhysicsType                                           ;82E725;
    LDA.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish  ;82E729;
    STA.W $099C                                                          ;82E72C;
    LDA.B $51                                                            ;82E72F;
    ORA.W #$001F                                                         ;82E731;
    STA.B $51                                                            ;82E734;
    RTS                                                                  ;82E736;


DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish:
    JSL.L AnimatedTilesObject_Handler                                    ;82E737;
    JSL.L Determine_Which_Enemies_to_Process                             ;82E73B;
    JSL.L Main_Enemy_Routine                                             ;82E73F;
    JSL.L Enemy_Projectile_Handler                                       ;82E743;
    JSL.L Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles           ;82E747;
    JSR.W Draw_Inanimate_Samus_Bank82                                    ;82E74B;
    JSL.L Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer                 ;82E74E;
    JSR.W Advance_GradualColorChange_ofAllPalettes_Denominator_C         ;82E752;
    BCC .return                                                          ;82E755;
    STZ.W $05F5                                                          ;82E757;
    JSL.L Play_SpinJumpSound_if_SpinJumping                              ;82E75A;
    STZ.W $0795                                                          ;82E75E;
    STZ.W $0797                                                          ;82E761;
    LDA.W #$0008                                                         ;82E764;
    STA.W $0998                                                          ;82E767;

.return:
    RTS                                                                  ;82E76A;


Load_Destination_Room:
    PHP                                                                  ;82E76B;
    PHB                                                                  ;82E76C;
    REP #$30                                                             ;82E76D;
    PEA.W $8F00                                                          ;82E76F;
    PLB                                                                  ;82E772;
    PLB                                                                  ;82E773;
    JSR.W Load_Destination_RoomCRE_Bitset                                ;82E774;
    JSR.W Load_Door_Header                                               ;82E777;
    JSR.W Load_Room_Header                                               ;82E77A;
    JSR.W Load_State_Header                                              ;82E77D;
    JMP.W Load_CRETiles_TilesetTiles_and_TilesetPalette                  ;82E780;


Load_CRETiles_TilesetTiles_and_TilesetPalette_DB_8F:
    PHP                                                                  ;82E783;
    PHB                                                                  ;82E784;
    REP #$30                                                             ;82E785;
    PEA.W $8F00                                                          ;82E787;
    PLB                                                                  ;82E78A;
    PLB                                                                  ;82E78B;

Load_CRETiles_TilesetTiles_and_TilesetPalette:
    STZ.W $0E16                                                          ;82E78C;
    LDA.W #$0080                                                         ;82E78F;
    STA.W $2115                                                          ;82E792;
    LDA.W #CRE_Tiles_Compressed>>8&$FF00                                 ;82E795;
    STA.B $48                                                            ;82E798;
    LDA.W #CRE_Tiles_Compressed                                          ;82E79A;
    STA.B $47                                                            ;82E79D;
    LDA.W #$5000                                                         ;82E79F;
    STA.B $4C                                                            ;82E7A2;
    LSR A                                                                ;82E7A4;
    STA.W $2116                                                          ;82E7A5;
    JSL.L DecompressionToVRAM                                            ;82E7A8;
    LDA.W $07C4                                                          ;82E7AC;
    STA.B $48                                                            ;82E7AF;
    LDA.W $07C3                                                          ;82E7B1;
    STA.B $47                                                            ;82E7B4;
    STZ.W $2116                                                          ;82E7B6;
    STZ.B $4C                                                            ;82E7B9;
    JSL.L DecompressionToVRAM                                            ;82E7BB;
    LDA.W $07C7                                                          ;82E7BF;
    STA.B $48                                                            ;82E7C2;
    LDY.W $07C6                                                          ;82E7C4;
    STY.B $47                                                            ;82E7C7;
    JSL.L Decompression_HardcodedDestination                             ;82E7C9;
    dl $7EC200                                                           ;82E7CD;
    PLB                                                                  ;82E7D0;
    PLP                                                                  ;82E7D1;
    RTL                                                                  ;82E7D2;


LoadLevelData_CRE_TileTable_ScrollData_PLMs_DoorASM_RoomASM:
    PHP                                                                  ;82E7D3;
    PHB                                                                  ;82E7D4;
    REP #$30                                                             ;82E7D5;
    PEA.W $8F00                                                          ;82E7D7;
    PLB                                                                  ;82E7DA;
    PLB                                                                  ;82E7DB;
    LDX.W #$63FE                                                         ;82E7DC;
    LDA.W #$8000                                                         ;82E7DF;

.loopA:
    STA.L $7F0002,X                                                      ;82E7E2;
    DEX                                                                  ;82E7E6;
    DEX                                                                  ;82E7E7;
    BPL .loopA                                                           ;82E7E8;
    LDA.W $07BE                                                          ;82E7EA;
    STA.B $48                                                            ;82E7ED;
    LDA.W $07BD                                                          ;82E7EF;
    STA.B $47                                                            ;82E7F2;
    JSL.L Decompression_HardcodedDestination                             ;82E7F4;
    dl $7F0000                                                           ;82E7F8;
    PHB                                                                  ;82E7FB;
    PEA.W $7F00                                                          ;82E7FC;
    PLB                                                                  ;82E7FF;
    PLB                                                                  ;82E800;
    LDA.W $0000                                                          ;82E801;
    TAX                                                                  ;82E804;
    LSR A                                                                ;82E805;
    ADC.W $0000                                                          ;82E806;
    ADC.W $0000                                                          ;82E809;
    TAY                                                                  ;82E80C;
    BRA +                                                                ;82E80D;


.loopB:
    LDA.W $0002,Y                                                        ;82E80F;
    STA.W $9602,X                                                        ;82E812;

  + DEY                                                                  ;82E815;
    DEY                                                                  ;82E816;
    DEX                                                                  ;82E817;
    DEX                                                                  ;82E818;
    BPL .loopB                                                           ;82E819;
    LDA.W $0000                                                          ;82E81B;
    LSR A                                                                ;82E81E;
    TAX                                                                  ;82E81F;
    ADC.W $0000                                                          ;82E820;
    TAY                                                                  ;82E823;
    BRA +                                                                ;82E824;


.loopC:
    LDA.W $0002,Y                                                        ;82E826;
    STA.W $6402,X                                                        ;82E829;

  + DEY                                                                  ;82E82C;
    DEY                                                                  ;82E82D;
    DEX                                                                  ;82E82E;
    DEX                                                                  ;82E82F;
    BPL .loopC                                                           ;82E830;
    PLB                                                                  ;82E832;
    LDA.W $079F                                                          ;82E833;
    CMP.W #$0006                                                         ;82E836;
    BEQ .skipCRE                                                         ;82E839;
    LDA.W #CRE_TileTable_Compressed>>8&$FF00                             ;82E83B;
    STA.B $48                                                            ;82E83E;
    LDA.W #CRE_TileTable_Compressed                                      ;82E840;
    STA.B $47                                                            ;82E843;
    JSL.L Decompression_HardcodedDestination                             ;82E845;
    dl $7EA000                                                           ;82E849;
    LDA.W $07C1                                                          ;82E84C;
    STA.B $48                                                            ;82E84F;
    LDA.W $07C0                                                          ;82E851;
    STA.B $47                                                            ;82E854;
    JSL.L Decompression_HardcodedDestination                             ;82E856;
    dl $7EA800                                                           ;82E85A;
    BRA .scrolls                                                         ;82E85D;


.skipCRE:
    LDA.W $07C1                                                          ;82E85F;
    STA.B $48                                                            ;82E862;
    LDA.W $07C0                                                          ;82E864;
    STA.B $47                                                            ;82E867;
    JSL.L Decompression_HardcodedDestination                             ;82E869;
    dl $7EA000                                                           ;82E86D;

.scrolls:
    LDX.W $07BB                                                          ;82E870;
    LDY.W $000E,X                                                        ;82E873;
    BPL .presetScrolls                                                   ;82E876;
    LDX.W #$0000                                                         ;82E878;

.loopD:
    LDA.W $0000,Y                                                        ;82E87B;
    STA.L $7ECD20,X                                                      ;82E87E;
    INY                                                                  ;82E882;
    INY                                                                  ;82E883;
    INX                                                                  ;82E884;
    INX                                                                  ;82E885;
    CPX.W #$0032                                                         ;82E886;
    BNE .loopD                                                           ;82E889;
    BRA .scrollsEnd                                                      ;82E88B;


.presetScrolls:
    STY.B $12                                                            ;82E88D;
    SEP #$30                                                             ;82E88F;
    LDA.W $07AB                                                          ;82E891;
    DEC A                                                                ;82E894;
    STA.B $14                                                            ;82E895;
    LDA.B #$02                                                           ;82E897;
    LDX.B #$00                                                           ;82E899;
    LDY.B #$00                                                           ;82E89B;

.loop:
    CPY.B $14                                                            ;82E89D;
    BNE +                                                                ;82E89F;
    LDA.B $12                                                            ;82E8A1;
    INC A                                                                ;82E8A3;

  + PHY                                                                  ;82E8A4;
    LDY.B #$00                                                           ;82E8A5;

.loopE:
    STA.L $7ECD20,X                                                      ;82E8A7;
    INX                                                                  ;82E8AB;
    INY                                                                  ;82E8AC;
    CPY.W $07A9                                                          ;82E8AD;
    BNE .loopE                                                           ;82E8B0;
    PLY                                                                  ;82E8B2;
    INY                                                                  ;82E8B3;
    CPY.W $07AB                                                          ;82E8B4;
    BNE .loop                                                            ;82E8B7;

.scrollsEnd:
    REP #$30                                                             ;82E8B9;
    LDX.W $07BB                                                          ;82E8BB;
    LDA.W $0014,X                                                        ;82E8BE;
    BEQ +                                                                ;82E8C1;
    TAX                                                                  ;82E8C3;

.loopF:
    LDA.W $0000,X                                                        ;82E8C4;
    BEQ +                                                                ;82E8C7;
    JSL.L Spawn_Room_PLM                                                 ;82E8C9;
    TXA                                                                  ;82E8CD;
    CLC                                                                  ;82E8CE;
    ADC.W #$0006                                                         ;82E8CF;
    TAX                                                                  ;82E8D2;
    BRA .loopF                                                           ;82E8D3;


  + JSL.L Execute_Door_ASM                                               ;82E8D5;
    JSL.L Execute_Room_Setup_ASM                                         ;82E8D9;
    LDA.W $0E16                                                          ;82E8DD;
    BEQ .return                                                          ;82E8E0;
    LDA.W #$0002                                                         ;82E8E2;
    STA.W $0E18                                                          ;82E8E5;

.return:
    PLB                                                                  ;82E8E8;
    PLP                                                                  ;82E8E9;
    RTL                                                                  ;82E8EA;


Spawn_Door_Closing_PLM:
    PHP                                                                  ;82E8EB;
    PHB                                                                  ;82E8EC;
    REP #$30                                                             ;82E8ED;
    PEA.W $8F00                                                          ;82E8EF;
    PLB                                                                  ;82E8F2;
    PLB                                                                  ;82E8F3;
    JSR.W CheckIfColoredDoorcapWasSpawned_SwitchDoorPLMInstruction       ;82E8F4;
    BCS .return                                                          ;82E8F7;
    LDA.W $0791                                                          ;82E8F9;
    ASL A                                                                ;82E8FC;
    CLC                                                                  ;82E8FD;
    ADC.W #Door_Closing_PLMs                                             ;82E8FE;
    TAX                                                                  ;82E901;
    LDA.W $0000,X                                                        ;82E902;
    BEQ .return                                                          ;82E905;
    STA.B $12                                                            ;82E907;
    LDX.W $078D                                                          ;82E909;
    LDA.L $830004,X                                                      ;82E90C;
    STA.B $14                                                            ;82E910;
    LDX.W #$0012                                                         ;82E912;
    JSL.L Spawn_Room_PLM                                                 ;82E915;

.return:
    PLB                                                                  ;82E919;
    PLP                                                                  ;82E91A;
    RTS                                                                  ;82E91B;


CheckIfColoredDoorcapWasSpawned_SwitchDoorPLMInstruction:
    LDX.W $078D                                                          ;82E91C;
    SEI                                                                  ;82E91F;
    SEP #$20                                                             ;82E920;
    LDA.L $830005,X                                                      ;82E922;
    STA.W HW_WRMPYA                                                      ;82E926;
    LDA.W $07A5                                                          ;82E929;
    STA.W HW_WRMPYB                                                      ;82E92C;
    LDA.L $830004,X                                                      ;82E92F;
    REP #$20                                                             ;82E933;
    AND.W #$00FF                                                         ;82E935;
    CLC                                                                  ;82E938;
    ADC.W HW_RDMPY                                                       ;82E939;
    ASL A                                                                ;82E93C;
    CLI                                                                  ;82E93D;
    LDX.W #$004E                                                         ;82E93E;

.loop:
    CMP.W $1C87,X                                                        ;82E941;
    BEQ .found                                                           ;82E944;
    DEX                                                                  ;82E946;
    DEX                                                                  ;82E947;
    BPL .loop                                                            ;82E948;

.noColoredDoor:
    CLC                                                                  ;82E94A;
    RTS                                                                  ;82E94B;


.found:
    LDA.W $1C37,X                                                        ;82E94C;
    BEQ .noColoredDoor                                                   ;82E94F;
    LDA.W $1DC7,X                                                        ;82E951;
    BMI +                                                                ;82E954;
    PHX                                                                  ;82E956;
    JSL.L BitIndexToByteIndexAndBitmask                                  ;82E957;
    LDA.L $7ED8B0,X                                                      ;82E95B;
    PLX                                                                  ;82E95F;
    AND.W $05E7                                                          ;82E960;
    BNE .noColoredDoor                                                   ;82E963;

  + LDA.W #$0001                                                         ;82E965;
    STA.L $7EDE1C,X                                                      ;82E968;
    TXY                                                                  ;82E96C;
    LDA.W $1C37,X                                                        ;82E96D;
    BEQ .noColoredDoor                                                   ;82E970;
    TAX                                                                  ;82E972;
    LDA.L $840004,X                                                      ;82E973;
    STA.W $1D27,Y                                                        ;82E977;
    SEC                                                                  ;82E97A;
    RTS                                                                  ;82E97B;


LoadLibraryBackground_LoadingPausing:
    PHP                                                                  ;82E97C;
    PHB                                                                  ;82E97D;
    REP #$30                                                             ;82E97E;
    JSL.L ClearFXTilemap                                                 ;82E980;
    LDA.W $1964                                                          ;82E984;
    BEQ +                                                                ;82E987;
    STA.W $4312                                                          ;82E989;
    LDA.W #$5BE0                                                         ;82E98C;
    STA.W $2116                                                          ;82E98F;
    LDA.W #$1801                                                         ;82E992;
    STA.W $4310                                                          ;82E995;
    LDA.W #$008A                                                         ;82E998;
    STA.W $4314                                                          ;82E99B;
    LDA.W #$0840                                                         ;82E99E;
    STA.W $4315                                                          ;82E9A1;
    SEP #$20                                                             ;82E9A4;
    LDA.B #$80                                                           ;82E9A6;
    STA.W $2115                                                          ;82E9A8;
    LDA.B #$02                                                           ;82E9AB;
    STA.W $420B                                                          ;82E9AD;
    REP #$20                                                             ;82E9B0;
    TYA                                                                  ;82E9B2;
    CLC                                                                  ;82E9B3;
    ADC.W #$0007                                                         ;82E9B4;
    TAY                                                                  ;82E9B7;
    CLC                                                                  ;82E9B8;

  + PEA.W $8F00                                                          ;82E9B9;
    PLB                                                                  ;82E9BC;
    PLB                                                                  ;82E9BD;
    REP #$20                                                             ;82E9BE;
    LDX.W $07BB                                                          ;82E9C0;
    LDY.W $0016,X                                                        ;82E9C3;
    BPL .return                                                          ;82E9C6;

.loop:
    LDX.W $0000,Y                                                        ;82E9C8;
    INY                                                                  ;82E9CB;
    INY                                                                  ;82E9CC;
    JSR.W (.pointers,X)                                                  ;82E9CD;
    BCC .loop                                                            ;82E9D0;

.return:
    PLB                                                                  ;82E9D2;
    PLP                                                                  ;82E9D3;
    RTL                                                                  ;82E9D4;


.pointers:
    dw LoadLibraryBackgroundLP_0_Terminator                              ;82E9D5;
    dw LoadLibraryBackgroundLP_2_TransferToVRAM                          ;82E9D7;
    dw LoadLibraryBackgroundLP_4_Decompression                           ;82E9D9;
    dw LoadLibraryBackgroundLP_6_ClearFXTilemap                          ;82E9DB;
    dw LoadLibraryBackgroundLP_8_TransferVRAM_and_SetBG3TilesAddr        ;82E9DD;
    dw LoadLibraryBackgroundLP_A_ClearBG2Tilemap                         ;82E9DF;
    dw LoadLibraryBackgroundLP_C_ClearKraidsLayer2                       ;82E9E1;
    dw LoadLibraryBackgroundLP_E_DoorDependentTransferToVRAM             ;82E9E3;

LoadLibraryBackgroundLP_0_Terminator:
    SEC                                                                  ;82E9E5;
    RTS                                                                  ;82E9E6;


LoadLibraryBackgroundLP_E_DoorDependentTransferToVRAM:
    LDA.W $078D                                                          ;82E9E7;
    CMP.W $0000,Y                                                        ;82E9EA;
    BEQ +                                                                ;82E9ED;
    TYA                                                                  ;82E9EF;
    CLC                                                                  ;82E9F0;
    ADC.W #$0009                                                         ;82E9F1;
    TAY                                                                  ;82E9F4;
    CLC                                                                  ;82E9F5;
    RTS                                                                  ;82E9F6;


  + INY                                                                  ;82E9F7;
    INY                                                                  ;82E9F8;

LoadLibraryBackgroundLP_2_TransferToVRAM:
    LDA.W $0003,Y                                                        ;82E9F9;
    STA.W $2116                                                          ;82E9FC;
    LDA.W #$1801                                                         ;82E9FF;
    STA.W $4310                                                          ;82EA02;
    LDA.W $0000,Y                                                        ;82EA05;
    STA.W $4312                                                          ;82EA08;
    LDA.W $0002,Y                                                        ;82EA0B;
    STA.W $4314                                                          ;82EA0E;
    LDA.W $0005,Y                                                        ;82EA11;
    STA.W $4315                                                          ;82EA14;
    SEP #$20                                                             ;82EA17;
    LDA.B #$80                                                           ;82EA19;
    STA.W $2115                                                          ;82EA1B;
    LDA.B #$02                                                           ;82EA1E;
    STA.W $420B                                                          ;82EA20;
    REP #$20                                                             ;82EA23;
    TYA                                                                  ;82EA25;
    CLC                                                                  ;82EA26;
    ADC.W #$0007                                                         ;82EA27;
    TAY                                                                  ;82EA2A;
    CLC                                                                  ;82EA2B;
    RTS                                                                  ;82EA2C;


LoadLibraryBackgroundLP_4_Decompression:
    PHY                                                                  ;82EA2D;
    LDA.W $0000,Y                                                        ;82EA2E;
    STA.B $47                                                            ;82EA31;
    LDA.W $0001,Y                                                        ;82EA33;
    STA.B $48                                                            ;82EA36;
    LDA.W #$7E00                                                         ;82EA38;
    STA.B $4D                                                            ;82EA3B;
    LDA.W $0003,Y                                                        ;82EA3D;
    STA.B $4C                                                            ;82EA40;
    JSL.L Decompression_VariableDestination                              ;82EA42;
    PLA                                                                  ;82EA46;
    CLC                                                                  ;82EA47;
    ADC.W #$0005                                                         ;82EA48;
    TAY                                                                  ;82EA4B;
    CLC                                                                  ;82EA4C;
    RTS                                                                  ;82EA4D;


LoadLibraryBackgroundLP_6_ClearFXTilemap:
    PHY                                                                  ;82EA4E;
    JSL.L ClearFXTilemap                                                 ;82EA4F;
    PLY                                                                  ;82EA53;
    CLC                                                                  ;82EA54;
    RTS                                                                  ;82EA55;


LoadLibraryBackgroundLP_A_ClearBG2Tilemap:
    PHY                                                                  ;82EA56;
    JSL.L ClearBG2Tilemap                                                ;82EA57;
    PLY                                                                  ;82EA5B;
    CLC                                                                  ;82EA5C;
    RTS                                                                  ;82EA5D;


LoadLibraryBackgroundLP_C_ClearKraidsLayer2:
    PHY                                                                  ;82EA5E;
    JSL.L ClearBG2Tilemap                                                ;82EA5F;
    PLY                                                                  ;82EA63;
    CLC                                                                  ;82EA64;
    RTS                                                                  ;82EA65;


LoadLibraryBackgroundLP_8_TransferVRAM_and_SetBG3TilesAddr:
    JSR.W LoadLibraryBackgroundLP_2_TransferToVRAM                       ;82EA66;
    SEP #$20                                                             ;82EA69;
    LDA.B #$02                                                           ;82EA6B;
    STA.B $5E                                                            ;82EA6D;
    REP #$20                                                             ;82EA6F;
    CLC                                                                  ;82EA71;
    RTS                                                                  ;82EA72;


Load_Level_Scroll_and_CRE_Data:
    PEA.W $8F00                                                          ;82EA73;
    PLB                                                                  ;82EA76;
    PLB                                                                  ;82EA77;
    LDX.W #$18FE                                                         ;82EA78;
    LDA.W #$8000                                                         ;82EA7B;

  - STA.L $7F0002,X                                                      ;82EA7E;
    STA.L $7F1902,X                                                      ;82EA82;
    STA.L $7F3202,X                                                      ;82EA86;
    STA.L $7F4B02,X                                                      ;82EA8A;
    DEX                                                                  ;82EA8E;
    DEX                                                                  ;82EA8F;
    BPL -                                                                ;82EA90;
    LDA.W $07BE                                                          ;82EA92;
    STA.B $48                                                            ;82EA95;
    LDA.W $07BD                                                          ;82EA97;
    STA.B $47                                                            ;82EA9A;
    JSL.L Decompression_HardcodedDestination                             ;82EA9C;
    dl $7F0000                                                           ;82EAA0;
    PHB                                                                  ;82EAA3;
    PEA.W $7F00                                                          ;82EAA4;
    PLB                                                                  ;82EAA7;
    PLB                                                                  ;82EAA8;
    LDA.W $0000                                                          ;82EAA9;
    TAX                                                                  ;82EAAC;
    LSR A                                                                ;82EAAD;
    ADC.W $0000                                                          ;82EAAE;
    ADC.W $0000                                                          ;82EAB1;
    TAY                                                                  ;82EAB4;
    BRA +                                                                ;82EAB5;


  - LDA.W $0002,Y                                                        ;82EAB7;
    STA.W $9602,X                                                        ;82EABA;

  + DEY                                                                  ;82EABD;
    DEY                                                                  ;82EABE;
    DEX                                                                  ;82EABF;
    DEX                                                                  ;82EAC0;
    BPL -                                                                ;82EAC1;
    LDA.W $0000                                                          ;82EAC3;
    LSR A                                                                ;82EAC6;
    TAX                                                                  ;82EAC7;
    ADC.W $0000                                                          ;82EAC8;
    TAY                                                                  ;82EACB;
    BRA +                                                                ;82EACC;


  - LDA.W $0002,Y                                                        ;82EACE;
    STA.W $6402,X                                                        ;82EAD1;

  + DEY                                                                  ;82EAD4;
    DEY                                                                  ;82EAD5;
    DEX                                                                  ;82EAD6;
    DEX                                                                  ;82EAD7;
    BPL -                                                                ;82EAD8;
    PLB                                                                  ;82EADA;
    LDA.W $079F                                                          ;82EADB;
    CMP.W #$0006                                                         ;82EADE;
    BEQ .inCeres                                                         ;82EAE1;
    LDA.W $07B3                                                          ;82EAE3;
    BIT.W #$0002                                                         ;82EAE6;
    BEQ +                                                                ;82EAE9;
    LDA.W #CRE_TileTable_Compressed>>8&$FF00                             ;82EAEB;
    STA.B $48                                                            ;82EAEE;
    LDA.W #CRE_TileTable_Compressed                                      ;82EAF0;
    STA.B $47                                                            ;82EAF3;
    JSL.L Decompression_HardcodedDestination                             ;82EAF5;
    dl $7EA000                                                           ;82EAF9;

  + LDA.W $07C1                                                          ;82EAFC;
    STA.B $48                                                            ;82EAFF;
    LDA.W $07C0                                                          ;82EB01;
    STA.B $47                                                            ;82EB04;
    JSL.L Decompression_HardcodedDestination                             ;82EB06;
    dl $7EA800                                                           ;82EB0A;
    BRA +                                                                ;82EB0D;


.inCeres:
    LDA.W $07C1                                                          ;82EB0F;
    STA.B $48                                                            ;82EB12;
    LDA.W $07C0                                                          ;82EB14;
    STA.B $47                                                            ;82EB17;
    JSL.L Decompression_HardcodedDestination                             ;82EB19;
    dl $7EA000                                                           ;82EB1D;

  + LDX.W $07BB                                                          ;82EB20;
    LDY.W $000E,X                                                        ;82EB23;
    BPL .presetScrolls                                                   ;82EB26;
    LDX.W #$0000                                                         ;82EB28;

  - LDA.W $0000,Y                                                        ;82EB2B;
    STA.L $7ECD20,X                                                      ;82EB2E;
    INY                                                                  ;82EB32;
    INY                                                                  ;82EB33;
    INX                                                                  ;82EB34;
    INX                                                                  ;82EB35;
    CPX.W #$0032                                                         ;82EB36;
    BNE -                                                                ;82EB39;
    BRA .return                                                          ;82EB3B;


.presetScrolls:
    STY.B $12                                                            ;82EB3D;
    SEP #$30                                                             ;82EB3F;
    LDA.W $07AB                                                          ;82EB41;
    DEC A                                                                ;82EB44;
    STA.B $14                                                            ;82EB45;
    LDA.B #$02                                                           ;82EB47;
    LDX.B #$00                                                           ;82EB49;
    LDY.B #$00                                                           ;82EB4B;

.loop:
    CPY.B $14                                                            ;82EB4D;
    BNE +                                                                ;82EB4F;
    LDA.B $12                                                            ;82EB51;
    INC A                                                                ;82EB53;

  + PHY                                                                  ;82EB54;
    LDY.B #$00                                                           ;82EB55;

  - STA.L $7ECD20,X                                                      ;82EB57;
    INX                                                                  ;82EB5B;
    INY                                                                  ;82EB5C;
    CPY.W $07A9                                                          ;82EB5D;
    BNE -                                                                ;82EB60;
    PLY                                                                  ;82EB62;
    INY                                                                  ;82EB63;
    CPY.W $07AB                                                          ;82EB64;
    BNE .loop                                                            ;82EB67;

.return:
    REP #$30                                                             ;82EB69;
    RTL                                                                  ;82EB6B;


CreatePLMs_ExecuteDoorASM_RoomSetupASM_SetElevatorStatus:
    PEA.W $8F00                                                          ;82EB6C;
    PLB                                                                  ;82EB6F;
    PLB                                                                  ;82EB70;
    LDX.W $07BB                                                          ;82EB71;
    LDA.W $0014,X                                                        ;82EB74;
    BEQ .noPLMs                                                          ;82EB77;
    TAX                                                                  ;82EB79;

.loop:
    LDA.W $0000,X                                                        ;82EB7A;
    BEQ .noPLMs                                                          ;82EB7D;
    JSL.L Spawn_Room_PLM                                                 ;82EB7F;
    TXA                                                                  ;82EB83;
    CLC                                                                  ;82EB84;
    ADC.W #$0006                                                         ;82EB85;
    TAX                                                                  ;82EB88;
    BRA .loop                                                            ;82EB89;


.noPLMs:
    JSL.L Execute_Door_ASM                                               ;82EB8B;
    JSL.L Execute_Room_Setup_ASM                                         ;82EB8F;
    LDA.W $0E16                                                          ;82EB93;
    BEQ .return                                                          ;82EB96;
    LDA.W #$0002                                                         ;82EB98;
    STA.W $0E18                                                          ;82EB9B;

.return:
    RTL                                                                  ;82EB9E;


GameState_2_GameOptionsMenu:
    PHP                                                                  ;82EB9F;
    PHB                                                                  ;82EBA0;
    PHK                                                                  ;82EBA1;
    PLB                                                                  ;82EBA2;
    REP #$30                                                             ;82EBA3;
    LDA.W $0DE2                                                          ;82EBA5;
    ASL A                                                                ;82EBA8;
    TAX                                                                  ;82EBA9;
    JSR.W (.pointers,X)                                                  ;82EBAA;
    JSR.W GameOptionsMenu_ObjectHandler                                  ;82EBAD;
    JSR.W Draw_GameOptionsMenu_Spritemaps                                ;82EBB0;
    LDA.W $0DE2                                                          ;82EBB3;
    CMP.W #$0002                                                         ;82EBB6;
    BMI .return                                                          ;82EBB9;
    JSR.W Draw_GameOptionsMenu_BG1                                       ;82EBBB;

.return:
    PLB                                                                  ;82EBBE;
    PLP                                                                  ;82EBBF;
    RTS                                                                  ;82EBC0;


.pointers:
    dw GameOptionsMenu_0_FinishFadingOut                                 ;82EBC1;
    dw GameOptionsMenu_1_LoadingOptionsMenu                              ;82EBC3;
    dw GameOptionsMenu_2_FadingInOptionsMenu                             ;82EBC5;
    dw GameOptionsMenu_3_OptionsMenu                                     ;82EBC7;
    dw GameOptionsMenu_4_StartGame                                       ;82EBC9;
    dw GameOptionsMenu_5_DissolveOutScreen                               ;82EBCB;
    dw GameOptionsMenu_6_DissolveInScreen                                ;82EBCD;
    dw GameOptionsMenu_7_ControllerSettings                              ;82EBCF;
    dw GameOptionsMenu_8_SpecialSettings                                 ;82EBD1;
    dw GameOptionsMenu_9_ScrollControllerSettingsDown                    ;82EBD3;
    dw GameOptionsMenu_A_ScrollControllerSettingsUp                      ;82EBD5;
    dw GameOptionsMenu_B_TransitionBackToFileSelect                      ;82EBD7;
    dw GameOptionsMenu_C_FadingOutOptionsMenuToStartGame                 ;82EBD9;

GameOptionsMenu_0_FinishFadingOut:
    JSL.L HandleFadingOut                                                ;82EBDB;
    SEP #$20                                                             ;82EBDF;
    LDA.B $51                                                            ;82EBE1;
    CMP.B #$80                                                           ;82EBE3;
    BNE +                                                                ;82EBE5;
    JSL.L EnableNMI                                                      ;82EBE7;
    REP #$20                                                             ;82EBEB;
    STZ.W $0723                                                          ;82EBED;
    STZ.W $0725                                                          ;82EBF0;
    INC.W $0DE2                                                          ;82EBF3;
    RTS                                                                  ;82EBF6;


  + SEP #$20                                                             ;82EBF7;
    LDA.B $51                                                            ;82EBF9;
    CMP.B #$0E                                                           ;82EBFB;
    BNE .return                                                          ;82EBFD;
    LDA.B $6B                                                            ;82EBFF;
    BIT.B #$04                                                           ;82EC01;
    BNE .return                                                          ;82EC03;
    REP #$20                                                             ;82EC05;
    LDY.W #GameOptionsMenu_Objects_SAMUS_DATA_Border                     ;82EC07;
    JSR.W Spawn_GameOptionsMenu_Object                                   ;82EC0A; Spawn border around SAMUS DATA
    RTS                                                                  ;82EC0D;


.return:
    REP #$20                                                             ;82EC0E;
    RTS                                                                  ;82EC10;


GameOptionsMenu_1_LoadingOptionsMenu:
    PHP                                                                  ;82EC11;
    SEP #$30                                                             ;82EC12;
    LDA.B #$00                                                           ;82EC14;
    STA.B $5D                                                            ;82EC16;
    LDA.B #$13                                                           ;82EC18;
    STA.B $69                                                            ;82EC1A;
    STZ.B $6B                                                            ;82EC1C;
    STZ.B $6C                                                            ;82EC1E;
    STZ.B $6D                                                            ;82EC20;
    STZ.B $6E                                                            ;82EC22;
    STZ.B $71                                                            ;82EC24;
    STZ.B $6F                                                            ;82EC26;
    STZ.B $72                                                            ;82EC28;
    LDA.B #$00                                                           ;82EC2A;
    STA.W $2116                                                          ;82EC2C;
    LDA.B #$58                                                           ;82EC2F;
    STA.W $2117                                                          ;82EC31;
    LDA.B #$80                                                           ;82EC34;
    STA.W $2115                                                          ;82EC36;
    JSL.L SetupHDMATransfer                                              ;82EC39;
    db $01,$01,$18                                                       ;82EC3D;
    dl Zebes_and_Stars_Tilemap                                           ;82EC40;
    dw $0800                                                             ;82EC43;
    LDA.B #$02                                                           ;82EC45;
    STA.W $420B                                                          ;82EC47;
    REP #$30                                                             ;82EC4A;
    STZ.B $B1                                                            ;82EC4C;
    STZ.B $B3                                                            ;82EC4E;
    STZ.B $B5                                                            ;82EC50;
    STZ.B $B7                                                            ;82EC52;
    STZ.W $0DE0                                                          ;82EC54;
    LDX.W #$01FE                                                         ;82EC57;

  - LDA.L Menu_Palettes,X                                                ;82EC5A;
    STA.L $7EC000,X                                                      ;82EC5E;
    DEX                                                                  ;82EC62;
    DEX                                                                  ;82EC63;
    BPL -                                                                ;82EC64;
    LDA.W #GameOptionsMenu_OptionsScreen_Tilemap>>8&$FF00                ;82EC66;
    STA.B $48                                                            ;82EC69;
    LDA.W #GameOptionsMenu_OptionsScreen_Tilemap                         ;82EC6B;
    STA.B $47                                                            ;82EC6E;
    JSL.L Decompression_HardcodedDestination                             ;82EC70;
    dl $7FC000                                                           ;82EC74;
    LDA.W #GameOptionsMenu_ControllerSettings_English_Tilemap>>8&$FF00   ;82EC77;
    STA.B $48                                                            ;82EC7A;
    LDA.W #GameOptionsMenu_ControllerSettings_English_Tilemap            ;82EC7C;
    STA.B $47                                                            ;82EC7F;
    JSL.L Decompression_HardcodedDestination                             ;82EC81;
    dl $7FC800                                                           ;82EC85;
    LDA.W #GameOptionsMenu_ControllerSettings_Japanese_Tilemap>>8&$FF00  ;82EC88;
    STA.B $48                                                            ;82EC8B;
    LDA.W #GameOptionsMenu_ControllerSettings_Japanese_Tilemap           ;82EC8D;
    STA.B $47                                                            ;82EC90;
    JSL.L Decompression_HardcodedDestination                             ;82EC92;
    dl $7FD000                                                           ;82EC96;
    LDA.W #GameOptionsMenu_SpecialSettings_English_Tilemap>>8&$FF00      ;82EC99;
    STA.B $48                                                            ;82EC9C;
    LDA.W #GameOptionsMenu_SpecialSettings_English_Tilemap               ;82EC9E;
    STA.B $47                                                            ;82ECA1;
    JSL.L Decompression_HardcodedDestination                             ;82ECA3;
    dl $7FD800                                                           ;82ECA7;
    LDA.W #GameOptionsMenu_SpecialSettings_Japanese_Tilemap>>8&$FF00     ;82ECAA;
    STA.B $48                                                            ;82ECAD;
    LDA.W #GameOptionsMenu_SpecialSettings_Japanese_Tilemap              ;82ECAF;
    STA.B $47                                                            ;82ECB2;
    JSL.L Decompression_HardcodedDestination                             ;82ECB4;
    dl $7FE000                                                           ;82ECB8;
    LDX.W #$07FE                                                         ;82ECBB;

  - LDA.L $7FC000,X                                                      ;82ECBE;
    STA.L $7E3000,X                                                      ;82ECC2;
    DEX                                                                  ;82ECC6;
    DEX                                                                  ;82ECC7;
    BPL -                                                                ;82ECC8;
    STZ.W $099E                                                          ;82ECCA;
    JSR.W Delete_GameOptionsMenu_Objects                                 ;82ECCD;
    LDY.W #GameOptionsMenu_Objects_MenuSelectionMissile_setup            ;82ECD0;
    JSR.W Spawn_GameOptionsMenu_Object                                   ;82ECD3;
    LDY.W #GameOptionsMenu_Objects_OPTION_MODE_Border                    ;82ECD6;
    JSR.W Spawn_GameOptionsMenu_Object                                   ;82ECD9;
    INC.W $0DE2                                                          ;82ECDC;
    JSR.W Set_Language_Text_Option_Highlight                             ;82ECDF;
    PLP                                                                  ;82ECE2;
    RTS                                                                  ;82ECE3;


GameOptionsMenu_2_FadingInOptionsMenu:
    JSL.L HandleFadingIn                                                 ;82ECE4;
    SEP #$20                                                             ;82ECE8;
    LDA.B $51                                                            ;82ECEA;
    CMP.B #$0F                                                           ;82ECEC;
    BNE .return                                                          ;82ECEE;
    REP #$20                                                             ;82ECF0;
    STZ.W $0723                                                          ;82ECF2;
    STZ.W $0725                                                          ;82ECF5;
    INC.W $0DE2                                                          ;82ECF8;
    RTS                                                                  ;82ECFB;


.return:
    REP #$20                                                             ;82ECFC;
    RTS                                                                  ;82ECFE;


Draw_GameOptionsMenu_BG1:
    PHP                                                                  ;82ECFF;
    REP #$30                                                             ;82ED00;
    LDX.W $0330                                                          ;82ED02;
    LDA.W #$0800                                                         ;82ED05;
    STA.B $D0,X                                                          ;82ED08;
    INX                                                                  ;82ED0A;
    INX                                                                  ;82ED0B;
    LDA.W #$3000                                                         ;82ED0C;
    STA.B $D0,X                                                          ;82ED0F;
    INX                                                                  ;82ED11;
    INX                                                                  ;82ED12;
    SEP #$20                                                             ;82ED13;
    LDA.B #$7E                                                           ;82ED15;
    STA.B $D0,X                                                          ;82ED17;
    REP #$20                                                             ;82ED19;
    INX                                                                  ;82ED1B;
    LDA.W #$5000                                                         ;82ED1C;
    STA.B $D0,X                                                          ;82ED1F;
    INX                                                                  ;82ED21;
    INX                                                                  ;82ED22;
    STX.W $0330                                                          ;82ED23;
    PLP                                                                  ;82ED26;
    RTS                                                                  ;82ED27;


Set_GameOptionsMenu_TilePalettes:
    PHP                                                                  ;82ED28;
    REP #$30                                                             ;82ED29;
    STA.B $12                                                            ;82ED2B;

.loop:
    LDA.L $7E3000,X                                                      ;82ED2D;
    AND.W #$E3FF                                                         ;82ED31;
    ORA.B $12                                                            ;82ED34;
    STA.L $7E3000,X                                                      ;82ED36;
    INX                                                                  ;82ED3A;
    INX                                                                  ;82ED3B;
    DEY                                                                  ;82ED3C;
    DEY                                                                  ;82ED3D;
    BNE .loop                                                            ;82ED3E;
    PLP                                                                  ;82ED40;
    RTS                                                                  ;82ED41;


GameOptionsMenu_3_OptionsMenu:
    PHP                                                                  ;82ED42;
    REP #$30                                                             ;82ED43;
    LDA.B $8F                                                            ;82ED45;
    AND.W #$0800                                                         ;82ED47;
    BEQ .checkDown                                                       ;82ED4A;
    LDA.W #$0037                                                         ;82ED4C;
    JSL.L QueueSound_Lib1_Max6                                           ;82ED4F;
    DEC.W $099E                                                          ;82ED53;
    BPL .checkB                                                          ;82ED56;
    LDA.W #$0004                                                         ;82ED58;
    STA.W $099E                                                          ;82ED5B;
    BRA .checkB                                                          ;82ED5E;


.checkDown:
    LDA.B $8F                                                            ;82ED60;
    AND.W #$0400                                                         ;82ED62;
    BEQ .checkB                                                          ;82ED65;
    LDA.W #$0037                                                         ;82ED67;
    JSL.L QueueSound_Lib1_Max6                                           ;82ED6A;
    LDA.W $099E                                                          ;82ED6E;
    INC A                                                                ;82ED71;
    STA.W $099E                                                          ;82ED72;
    CMP.W #$0005                                                         ;82ED75;
    BNE .checkB                                                          ;82ED78;
    STZ.W $099E                                                          ;82ED7A;

.checkB:
    LDA.B $8F                                                            ;82ED7D;
    BIT.W #$8000                                                         ;82ED7F;
    BNE .cancel                                                          ;82ED82;
    BIT.W #$0080                                                         ;82ED84;
    BNE .actiate                                                         ;82ED87;
    BIT.W #$1000                                                         ;82ED89;
    BEQ .return                                                          ;82ED8C;

.actiate:
    LDA.W #$0038                                                         ;82ED8E;
    JSL.L QueueSound_Lib1_Max6                                           ;82ED91;
    LDA.W $099E                                                          ;82ED95;
    ASL A                                                                ;82ED98;
    TAX                                                                  ;82ED99;
    JSR.W (.pointers,X)                                                  ;82ED9A;

.return:
    PLP                                                                  ;82ED9D;
    RTS                                                                  ;82ED9E;


.cancel:
    LDA.W #$000B                                                         ;82ED9F;
    STA.W $0DE2                                                          ;82EDA2;
    PLP                                                                  ;82EDA5;
    RTS                                                                  ;82EDA6;


.pointers:
    dw GameOptionsMenu_StartGame                                         ;82EDA7; Start game
    dw GameOptionsMenu_OptionsMenu_ToggleLanguageText                    ;82EDA9; English text
    dw GameOptionsMenu_OptionsMenu_ToggleLanguageText                    ;82EDAB; Japanese Text
    dw Start_GameOptionsMenu_DissolveTransition                          ;82EDAD; Controller setting mode
    dw Start_GameOptionsMenu_DissolveTransition                          ;82EDAF; Special setting mode

GameOptionsMenu_StartGame:
    LDA.W $05D1                                                          ;82EDB1;
    BEQ .debug                                                           ;82EDB4;
    LDA.B $8B                                                            ;82EDB6;
    BIT.W #$0020                                                         ;82EDB8;
    BEQ .startGame                                                       ;82EDBB;

.debug:
    LDA.L $7ED914                                                        ;82EDBD;
    CMP.W #$0005                                                         ;82EDC1;
    BNE .fadeScreen                                                      ;82EDC4;

.startGame:
    LDA.W #$0004                                                         ;82EDC6;
    STA.W $0DE2                                                          ;82EDC9;
    RTS                                                                  ;82EDCC;


.fadeScreen:
    STZ.W $0723                                                          ;82EDCD;
    STZ.W $0725                                                          ;82EDD0;
    LDA.W #$000C                                                         ;82EDD3;
    STA.W $0DE2                                                          ;82EDD6;
    RTS                                                                  ;82EDD9;


GameOptionsMenu_OptionsMenu_ToggleLanguageText:
    STZ.W $099E                                                          ;82EDDA;
    LDA.W $09E2                                                          ;82EDDD;
    BEQ .japaneseText                                                    ;82EDE0;
    STZ.W $09E2                                                          ;82EDE2;
    BRA Set_Language_Text_Option_Highlight                               ;82EDE5;


.japaneseText:
    LDA.W #$0001                                                         ;82EDE7;
    STA.W $09E2                                                          ;82EDEA;

Set_Language_Text_Option_Highlight:
    LDA.W $09E2                                                          ;82EDED;
    BNE .japaneseText                                                    ;82EDF0;
    LDX.W #$0288                                                         ;82EDF2;
    LDY.W #$0018                                                         ;82EDF5;
    LDA.W #$0000                                                         ;82EDF8;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82EDFB;
    LDX.W #$02C8                                                         ;82EDFE;
    LDY.W #$0018                                                         ;82EE01;
    LDA.W #$0000                                                         ;82EE04;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82EE07;
    LDX.W #$0348                                                         ;82EE0A;
    LDY.W #$0032                                                         ;82EE0D;
    LDA.W #$0400                                                         ;82EE10;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82EE13;
    LDX.W #$0388                                                         ;82EE16;
    LDY.W #$0032                                                         ;82EE19;
    LDA.W #$0400                                                         ;82EE1C;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82EE1F;
    BRA .return                                                          ;82EE22;


.japaneseText:
    LDX.W #$0288                                                         ;82EE24;
    LDY.W #$0018                                                         ;82EE27;
    LDA.W #$0400                                                         ;82EE2A;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82EE2D;
    LDX.W #$02C8                                                         ;82EE30;
    LDY.W #$0018                                                         ;82EE33;
    LDA.W #$0400                                                         ;82EE36;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82EE39;
    LDX.W #$0348                                                         ;82EE3C;
    LDY.W #$0032                                                         ;82EE3F;
    LDA.W #$0000                                                         ;82EE42;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82EE45;
    LDX.W #$0388                                                         ;82EE48;
    LDY.W #$0032                                                         ;82EE4B;
    LDA.W #$0000                                                         ;82EE4E;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82EE51;

.return:
    RTS                                                                  ;82EE54;


Start_GameOptionsMenu_DissolveTransition:
    SEP #$20                                                             ;82EE55;
    LDA.B #$03                                                           ;82EE57;
    STA.B $57                                                            ;82EE59;
    REP #$20                                                             ;82EE5B;
    STZ.W $0723                                                          ;82EE5D;
    STZ.W $0725                                                          ;82EE60;
    LDA.W #$0005                                                         ;82EE63;
    STA.W $0DE2                                                          ;82EE66;
    RTS                                                                  ;82EE69;


GameOptionsMenu_B_TransitionBackToFileSelect:
    JSL.L HandleFadingOut                                                ;82EE6A;
    SEP #$20                                                             ;82EE6E;
    LDA.B $51                                                            ;82EE70;
    CMP.B #$80                                                           ;82EE72;
    BNE .return                                                          ;82EE74;
    JSL.L EnableNMI                                                      ;82EE76;
    REP #$20                                                             ;82EE7A;
    STZ.W $0723                                                          ;82EE7C;
    STZ.W $0725                                                          ;82EE7F;
    LDA.W #$0004                                                         ;82EE82;
    STA.W $0998                                                          ;82EE85;
    STZ.W $0727                                                          ;82EE88;
    STZ.W $0DE2                                                          ;82EE8B;
    RTS                                                                  ;82EE8E;


.return:
    REP #$20                                                             ;82EE8F;
    RTS                                                                  ;82EE91;


GameOptionsMenu_C_FadingOutOptionsMenuToStartGame:
    JSL.L HandleFadingOut                                                ;82EE92;
    SEP #$20                                                             ;82EE96;
    LDA.B $51                                                            ;82EE98;
    CMP.B #$80                                                           ;82EE9A;
    BNE .return                                                          ;82EE9C;
    JSL.L EnableNMI                                                      ;82EE9E;
    REP #$20                                                             ;82EEA2;
    STZ.W $0723                                                          ;82EEA4;
    STZ.W $0725                                                          ;82EEA7;
    LDA.W #$0004                                                         ;82EEAA;
    STA.W $0DE2                                                          ;82EEAD;
    RTS                                                                  ;82EEB0;


.return:
    REP #$20                                                             ;82EEB1;
    RTS                                                                  ;82EEB3;


GameOptionsMenu_4_StartGame:
    STZ.W $0DE2                                                          ;82EEB4;
    LDA.W $05D1                                                          ;82EEB7;
    BEQ .checkLoadingState                                               ;82EEBA;
    LDA.B $8B                                                            ;82EEBC;
    BIT.W #$0020                                                         ;82EEBE;
    BEQ .debug                                                           ;82EEC1;

.checkLoadingState:
    LDA.L $7ED914                                                        ;82EEC3;
    BEQ .intro                                                           ;82EEC7;
    STA.W $0998                                                          ;82EEC9;
    CMP.W #$0022                                                         ;82EECC;
    BNE .cutscene                                                        ;82EECF;
    LDA.W #CinematicFunction_CeresGoesBoom_Initial                       ;82EED1;
    STA.W $1F51                                                          ;82EED4;
    BRA .cutscene                                                        ;82EED7;


.intro:
    LDA.W #$001E                                                         ;82EED9;
    STA.W $0998                                                          ;82EEDC;
    LDA.W #CinematicFunction_Intro_Initial                               ;82EEDF;
    STA.W $1F51                                                          ;82EEE2;
    STZ.W $099E                                                          ;82EEE5;
    STZ.W $0723                                                          ;82EEE8;
    STZ.W $0725                                                          ;82EEEB;
    RTS                                                                  ;82EEEE;


.cutscene:
    STZ.W $099E                                                          ;82EEEF;
    STZ.W $0DE2                                                          ;82EEF2;
    RTS                                                                  ;82EEF5;


.debug:
    LDA.L $7ED914                                                        ;82EEF6;
    CMP.W #$0005                                                         ;82EEFA;
    BEQ .fileSelectMap                                                   ;82EEFD;
    LDA.W #$0005                                                         ;82EEFF;
    STA.W $0998                                                          ;82EF02;
    STA.L $7ED914                                                        ;82EF05;
    LDA.W $0952                                                          ;82EF09;
    JSL.L SaveToSRAM                                                     ;82EF0C;
    RTS                                                                  ;82EF10;


.fileSelectMap:
    LDA.W #$0005                                                         ;82EF11;
    STA.W $0998                                                          ;82EF14;
    RTS                                                                  ;82EF17;


GameOptionsMenu_5_DissolveOutScreen:
    JSL.L HandleFadingOut                                                ;82EF18;
    SEP #$20                                                             ;82EF1C;
    LDA.B $57                                                            ;82EF1E;
    CMP.B #$F3                                                           ;82EF20;
    BEQ .notFinishedFadingOut                                            ;82EF22;
    CLC                                                                  ;82EF24;
    ADC.B #$10                                                           ;82EF25;
    STA.B $57                                                            ;82EF27;

.notFinishedFadingOut:
    LDA.B $51                                                            ;82EF29;
    CMP.B #$80                                                           ;82EF2B;
    BEQ .finishedFadingOut                                               ;82EF2D;
    REP #$20                                                             ;82EF2F;
    RTS                                                                  ;82EF31;


.finishedFadingOut:
    JSL.L EnableNMI                                                      ;82EF32;
    REP #$20                                                             ;82EF36;
    STZ.W $0723                                                          ;82EF38;
    STZ.W $0725                                                          ;82EF3B;
    STZ.B $B3                                                            ;82EF3E;
    INC.W $0DE2                                                          ;82EF40;
    LDA.W $099E                                                          ;82EF43;
    BEQ .gotoOptionsMenu                                                 ;82EF46;
    BIT.W #$0004                                                         ;82EF48;
    BNE .specialSubmenu                                                  ;82EF4B;
    LDA.W $09E2                                                          ;82EF4D;
    BNE .japaneseControllerSettings                                      ;82EF50;
    LDX.W #$07FE                                                         ;82EF52;

.englishCtrlLoop:
    LDA.L $7FC800,X                                                      ;82EF55;
    STA.L $7E3000,X                                                      ;82EF59;
    DEX                                                                  ;82EF5D;
    DEX                                                                  ;82EF5E;
    BPL .englishCtrlLoop                                                 ;82EF5F;
    BRA .continueControllerSettingsSettings                              ;82EF61;


.japaneseControllerSettings:
    LDX.W #$07FE                                                         ;82EF63;

.japaneseCtrlLoop:
    LDA.L $7FD000,X                                                      ;82EF66;
    STA.L $7E3000,X                                                      ;82EF6A;
    DEX                                                                  ;82EF6E;
    DEX                                                                  ;82EF6F;
    BPL .japaneseCtrlLoop                                                ;82EF70;

.continueControllerSettingsSettings:
    LDY.W #GameOptionsMenu_Objects_CONTROLLER_SETTING_MODE_Border        ;82EF72;
    JSR.W Spawn_GameOptionsMenu_Object                                   ;82EF75;
    JSR.W GameOptionsMenu_ControllerBindings                             ;82EF78;
    JSR.W Draw_GameOptionsMenu_ControllerBindings                        ;82EF7B;
    RTS                                                                  ;82EF7E;


.gotoOptionsMenu:
    BRA .optionsMenu                                                     ;82EF7F;


.specialSubmenu:
    LDA.W $09E2                                                          ;82EF81;
    BNE .japaneseSettings                                                ;82EF84;
    LDX.W #$07FE                                                         ;82EF86;

.englishSettingsLoop:
    LDA.L $7FD800,X                                                      ;82EF89;
    STA.L $7E3000,X                                                      ;82EF8D;
    DEX                                                                  ;82EF91;
    DEX                                                                  ;82EF92;
    BPL .englishSettingsLoop                                             ;82EF93;
    BRA .continueSpecial                                                 ;82EF95;


.japaneseSettings:
    LDX.W #$07FE                                                         ;82EF97;

.japaneseSettingsLoop:
    LDA.L $7FE000,X                                                      ;82EF9A;
    STA.L $7E3000,X                                                      ;82EF9E;
    DEX                                                                  ;82EFA2;
    DEX                                                                  ;82EFA3;
    BPL .japaneseSettingsLoop                                            ;82EFA4;

.continueSpecial:
    STZ.W $099E                                                          ;82EFA6;
    JSR.W Set_SpecialSetting_Highlights                                  ;82EFA9;
    LDA.W #$0001                                                         ;82EFAC;
    STA.W $099E                                                          ;82EFAF;
    JSR.W Set_SpecialSetting_Highlights                                  ;82EFB2;
    LDA.W #$0004                                                         ;82EFB5;
    STA.W $099E                                                          ;82EFB8;
    LDY.W #GameOptionsMenu_Objects_SPECIAL_SETTING_MODE_Border           ;82EFBB;
    JSR.W Spawn_GameOptionsMenu_Object                                   ;82EFBE;
    RTS                                                                  ;82EFC1;


.optionsMenu:
    LDX.W #$07FE                                                         ;82EFC2;

.optionsMenuLoop:
    LDA.L $7FC000,X                                                      ;82EFC5;
    STA.L $7E3000,X                                                      ;82EFC9;
    DEX                                                                  ;82EFCD;
    DEX                                                                  ;82EFCE;
    BPL .optionsMenuLoop                                                 ;82EFCF;
    JSR.W Set_Language_Text_Option_Highlight                             ;82EFD1;
    LDY.W #GameOptionsMenu_Objects_OPTION_MODE_Border                    ;82EFD4;
    JSR.W Spawn_GameOptionsMenu_Object                                   ;82EFD7;
    RTS                                                                  ;82EFDA;


GameOptionsMenu_6_DissolveInScreen:
    JSL.L HandleFadingIn                                                 ;82EFDB;
    SEP #$20                                                             ;82EFDF;
    LDA.B $57                                                            ;82EFE1;
    CMP.B #$03                                                           ;82EFE3;
    BEQ .brightness                                                      ;82EFE5;
    SEC                                                                  ;82EFE7;
    SBC.B #$10                                                           ;82EFE8;
    STA.B $57                                                            ;82EFEA;

.brightness:
    LDA.B $51                                                            ;82EFEC;
    CMP.B #$0F                                                           ;82EFEE;
    BNE .return                                                          ;82EFF0;
    STZ.B $57                                                            ;82EFF2;
    REP #$20                                                             ;82EFF4;
    STZ.W $0723                                                          ;82EFF6;
    STZ.W $0725                                                          ;82EFF9;
    LDA.W $099E                                                          ;82EFFC;
    BEQ .OptionsMenu                                                     ;82EFFF;
    BIT.W #$0004                                                         ;82F001;
    BNE .specialSubmenu                                                  ;82F004;
    LDA.W #$0007                                                         ;82F006;
    STA.W $0DE2                                                          ;82F009;
    STZ.W $099E                                                          ;82F00C;
    RTS                                                                  ;82F00F;


.specialSubmenu:
    LDA.W #$0008                                                         ;82F010;
    STA.W $0DE2                                                          ;82F013;
    STZ.W $099E                                                          ;82F016;
    RTS                                                                  ;82F019;


.OptionsMenu:
    LDA.W #$0003                                                         ;82F01A;
    STA.W $0DE2                                                          ;82F01D;
    RTS                                                                  ;82F020;


.return:
    REP #$20                                                             ;82F021;
    RTS                                                                  ;82F023;


GameOptionsMenu_8_SpecialSettings:
    LDA.B $8F                                                            ;82F024;
    AND.W #$0800                                                         ;82F026;
    BEQ .checkDown                                                       ;82F029;
    LDA.W #$0037                                                         ;82F02B;
    JSL.L QueueSound_Lib1_Max6                                           ;82F02E;
    DEC.W $099E                                                          ;82F032;
    BPL .checkB                                                          ;82F035;
    LDA.W #$0002                                                         ;82F037;
    STA.W $099E                                                          ;82F03A;
    BRA .checkB                                                          ;82F03D;


.checkDown:
    LDA.B $8F                                                            ;82F03F;
    AND.W #$0400                                                         ;82F041;
    BEQ .checkB                                                          ;82F044;
    LDA.W #$0037                                                         ;82F046;
    JSL.L QueueSound_Lib1_Max6                                           ;82F049;
    LDA.W $099E                                                          ;82F04D;
    INC A                                                                ;82F050;
    STA.W $099E                                                          ;82F051;
    CMP.W #$0003                                                         ;82F054;
    BNE .checkB                                                          ;82F057;
    STZ.W $099E                                                          ;82F059;

.checkB:
    LDA.B $8F                                                            ;82F05C;
    BIT.W #$8000                                                         ;82F05E;
    BEQ .checkActivate                                                   ;82F061;
    LDA.W #$0038                                                         ;82F063;
    JSL.L QueueSound_Lib1_Max6                                           ;82F066;
    STZ.W $099E                                                          ;82F06A;
    JSR.W Start_GameOptionsMenu_DissolveTransition                       ;82F06D;
    RTS                                                                  ;82F070;


.checkActivate:
    LDA.B $8F                                                            ;82F071;
    BIT.W #$1380                                                         ;82F073;
    BEQ .return                                                          ;82F076;
    LDA.W #$0038                                                         ;82F078;
    JSL.L QueueSound_Lib1_Max6                                           ;82F07B;
    LDA.W $099E                                                          ;82F07F;
    ASL A                                                                ;82F082;
    TAX                                                                  ;82F083;
    JSR.W (.pointers,X)                                                  ;82F084;

.return:
    RTS                                                                  ;82F087;


.pointers:
    dw GameOptions_SpecialSettings_ToggleSetting                         ;82F088;
    dw GameOptions_SpecialSettings_ToggleSetting                         ;82F08A;
    dw GameOptions_SpecialSettings_End                                   ;82F08C;

GameOptions_SpecialSettings_ToggleSetting:
    LDA.W $099E                                                          ;82F08E;
    ASL A                                                                ;82F091;
    TAX                                                                  ;82F092;
    LDA.W SpecialSettingRAMAddresses,X                                   ;82F093;
    TAX                                                                  ;82F096;
    LDA.W $0000,X                                                        ;82F097;
    BEQ .toggleOn                                                        ;82F09A;
    LDA.W #$0000                                                         ;82F09C; toggle off
    STA.W $0000,X                                                        ;82F09F;
    BRA .highlight                                                       ;82F0A2;


.toggleOn:
    LDA.W #$0001                                                         ;82F0A4;
    STA.W $0000,X                                                        ;82F0A7;

.highlight:
    JSR.W Set_SpecialSetting_Highlights                                  ;82F0AA;
    RTS                                                                  ;82F0AD;


SpecialSettingRAMAddresses:
    dw $09EA                                                             ;82F0AE;
    dw $09E4                                                             ;82F0B0;

GameOptions_SpecialSettings_End:
    STZ.W $099E                                                          ;82F0B2;
    JSR.W Start_GameOptionsMenu_DissolveTransition                       ;82F0B5;
    RTS                                                                  ;82F0B8;


Set_SpecialSetting_Highlights:
    LDA.W $099E                                                          ;82F0B9;
    ASL A                                                                ;82F0BC;
    TAX                                                                  ;82F0BD;
    LDA.W SpecialSettingRAMAddresses,X                                   ;82F0BE;
    TAX                                                                  ;82F0C1;
    LDA.W $0000,X                                                        ;82F0C2;
    BNE .settingIsOn                                                     ;82F0C5;
    LDA.W $099E                                                          ;82F0C7;
    ASL A                                                                ;82F0CA;
    ASL A                                                                ;82F0CB;
    TAX                                                                  ;82F0CC;
    PHX                                                                  ;82F0CD;
    LDA.W .iconCancelManualRow0,X                                        ;82F0CE;
    TAX                                                                  ;82F0D1;
    LDY.W #$000C                                                         ;82F0D2;
    LDA.W #$0400                                                         ;82F0D5;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82F0D8;
    PLX                                                                  ;82F0DB;
    PHX                                                                  ;82F0DC;
    LDA.W .iconCancelManualRow1,X                                        ;82F0DD;
    TAX                                                                  ;82F0E0;
    LDY.W #$000C                                                         ;82F0E1;
    LDA.W #$0400                                                         ;82F0E4;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82F0E7;
    PLX                                                                  ;82F0EA;
    PHX                                                                  ;82F0EB;
    LDA.W .iconCancelAutoRow0,X                                          ;82F0EC;
    TAX                                                                  ;82F0EF;
    LDY.W #$000C                                                         ;82F0F0;
    LDA.W #$0000                                                         ;82F0F3;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82F0F6;
    PLX                                                                  ;82F0F9;
    LDA.W .iconCancelAutoRow1,X                                          ;82F0FA;
    TAX                                                                  ;82F0FD;
    LDY.W #$000C                                                         ;82F0FE;
    LDA.W #$0000                                                         ;82F101;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82F104;
    RTS                                                                  ;82F107;


.settingIsOn:
    LDA.W $099E                                                          ;82F108;
    ASL A                                                                ;82F10B;
    ASL A                                                                ;82F10C;
    TAX                                                                  ;82F10D;
    PHX                                                                  ;82F10E;
    LDA.W .iconCancelManualRow0,X                                        ;82F10F;
    TAX                                                                  ;82F112;
    LDY.W #$000C                                                         ;82F113;
    LDA.W #$0000                                                         ;82F116;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82F119;
    PLX                                                                  ;82F11C;
    PHX                                                                  ;82F11D;
    LDA.W .iconCancelManualRow1,X                                        ;82F11E;
    TAX                                                                  ;82F121;
    LDY.W #$000C                                                         ;82F122;
    LDA.W #$0000                                                         ;82F125;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82F128;
    PLX                                                                  ;82F12B;
    PHX                                                                  ;82F12C;
    LDA.W .iconCancelAutoRow0,X                                          ;82F12D;
    TAX                                                                  ;82F130;
    LDY.W #$000C                                                         ;82F131;
    LDA.W #$0400                                                         ;82F134;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82F137;
    PLX                                                                  ;82F13A;
    LDA.W .iconCancelAutoRow1,X                                          ;82F13B;
    TAX                                                                  ;82F13E;
    LDY.W #$000C                                                         ;82F13F;
    LDA.W #$0400                                                         ;82F142;
    JSR.W Set_GameOptionsMenu_TilePalettes                               ;82F145;
    RTS                                                                  ;82F148;


.iconCancelManualRow0:
    dw $01E0                                                             ;82F149;

.iconCancelManualRow1:
    dw $0220                                                             ;82F14B;

.moonwalkOnRow0:
    dw $0360                                                             ;82F14D;

.moonwalkOnRow1:
    dw $03A0                                                             ;82F14F;

.iconCancelAutoRow0:
    dw $01EE                                                             ;82F151;

.iconCancelAutoRow1:
    dw $022E                                                             ;82F153;

.moonwalkOffRow0:
    dw $036E                                                             ;82F155;

.moonwalkOffRow1:
    dw $03AE                                                             ;82F157;

GameOptionsMenu_7_ControllerSettings:
    LDA.B $8F                                                            ;82F159;
    AND.W #$0800                                                         ;82F15B;
    BEQ .upEnd                                                           ;82F15E;
    LDA.W #$0037                                                         ;82F160;
    JSL.L QueueSound_Lib1_Max6                                           ;82F163;
    LDA.W $099E                                                          ;82F167;
    DEC A                                                                ;82F16A;
    STA.W $099E                                                          ;82F16B;
    BMI .gotoScrollDown                                                  ;82F16E;
    CMP.W #$0006                                                         ;82F170;
    BEQ .scrollUp                                                        ;82F173;
    RTS                                                                  ;82F175;


.gotoScrollDown:
    LDA.W #$0008                                                         ;82F176;
    STA.W $099E                                                          ;82F179;
    BRA .scrollDown                                                      ;82F17C;


.return:
    RTS                                                                  ;82F17E;


.upEnd:
    LDA.B $8F                                                            ;82F17F;
    AND.W #$0400                                                         ;82F181;
    BEQ .downEnd                                                         ;82F184;
    LDA.W #$0037                                                         ;82F186;
    JSL.L QueueSound_Lib1_Max6                                           ;82F189;
    LDA.W $099E                                                          ;82F18D;
    INC A                                                                ;82F190;
    STA.W $099E                                                          ;82F191;
    CMP.W #$0007                                                         ;82F194;
    BEQ .scrollDown                                                      ;82F197;
    CMP.W #$0009                                                         ;82F199;
    BNE .return                                                          ;82F19C;
    STZ.W $099E                                                          ;82F19E;
    BRA .scrollUp                                                        ;82F1A1;


.scrollDown:
    LDA.W #$0009                                                         ;82F1A3;
    STA.W $0DE2                                                          ;82F1A6;
    RTS                                                                  ;82F1A9;


.scrollUp:
    LDA.W #$000A                                                         ;82F1AA;
    STA.W $0DE2                                                          ;82F1AD;
    RTS                                                                  ;82F1B0;


.downEnd:
    LDA.B $8F                                                            ;82F1B1;
    BEQ .misplacedCode                                                   ;82F1B3;
    LDA.W #$0038                                                         ;82F1B5;
    JSL.L QueueSound_Lib1_Max6                                           ;82F1B8;
    LDA.W $099E                                                          ;82F1BC;
    ASL A                                                                ;82F1BF;
    TAX                                                                  ;82F1C0;
    JSR.W (.pointers,X)                                                  ;82F1C1;
    RTS                                                                  ;82F1C4;


.misplacedCode:
    LDA.B $91                                                            ;82F1C5;
    BRA .backOnTrack                                                     ;82F1C7;


.pointers:
    dw GameOptions_ControllerSettings_SetBinding                         ;82F1C9;
    dw GameOptions_ControllerSettings_SetBinding                         ;82F1CB;
    dw GameOptions_ControllerSettings_SetBinding                         ;82F1CD;
    dw GameOptions_ControllerSettings_SetBinding                         ;82F1CF;
    dw GameOptions_ControllerSettings_SetBinding                         ;82F1D1;
    dw GameOptions_ControllerSettings_SetBinding                         ;82F1D3;
    dw GameOptions_ControllerSettings_SetBinding                         ;82F1D5;
    dw GameOptions_ControllerSettings_End                                ;82F1D7;
    dw GameOptions_ControllerSettings_ResetToDefault                     ;82F1D9;

.backOnTrack:
    TAY                                                                  ;82F1DB;
    BEQ .otherReturn                                                     ;82F1DC;
    LDA.W $099E                                                          ;82F1DE;
    CMP.W #$0008                                                         ;82F1E1;
    BNE .otherReturn                                                     ;82F1E4;
    LDA.W $0DE0                                                          ;82F1E6;
    CMP.W #$0010                                                         ;82F1E9;
    BPL .otherReturn                                                     ;82F1EC;
    LDA.W $0DE0                                                          ;82F1EE;
    ASL A                                                                ;82F1F1;
    TAX                                                                  ;82F1F2;
    TYA                                                                  ;82F1F3;
    AND.W .inputs,X                                                      ;82F1F4;
    CMP.W .inputs,X                                                      ;82F1F7;
    BNE .debugInvulOff                                                   ;82F1FA;
    INC.W $0DE0                                                          ;82F1FC;
    RTS                                                                  ;82F1FF;


.debugInvulOff:
    STZ.W $0DE0                                                          ;82F200;

.otherReturn:
    RTS                                                                  ;82F203;


.inputs:
    dw $0020,$0020,$0020,$0020,$0010,$0010,$0010,$0010                   ;82F204;
    dw $0010,$0010,$4000,$0040,$0040,$0080,$0080,$0080                   ;82F214;

GameOptions_ControllerSettings_ResetToDefault:
    LDA.B $8F                                                            ;82F224;
    BIT.W #$1080                                                         ;82F226;
    BNE .reset                                                           ;82F229;
    RTS                                                                  ;82F22B;


.reset:
    LDA.W #$0040                                                         ;82F22C;
    STA.W $09B2                                                          ;82F22F;
    LDA.W #$0080                                                         ;82F232;
    STA.W $09B4                                                          ;82F235;
    LDA.W #$8000                                                         ;82F238;
    STA.W $09B6                                                          ;82F23B;
    LDA.W #$4000                                                         ;82F23E;
    STA.W $09B8                                                          ;82F241;
    LDA.W #$2000                                                         ;82F244;
    STA.W $09BA                                                          ;82F247;
    LDA.W #$0010                                                         ;82F24A;
    STA.W $09BE                                                          ;82F24D;
    LDA.W #$0020                                                         ;82F250;
    STA.W $09BC                                                          ;82F253;
    JSR.W GameOptionsMenu_ControllerBindings                             ;82F256;
    JSR.W Draw_GameOptionsMenu_ControllerBindings                        ;82F259;
    RTS                                                                  ;82F25C;


GameOptions_ControllerSettings_End:
    LDA.B $8F                                                            ;82F25D;
    BIT.W #$1080                                                         ;82F25F;
    BNE .end                                                             ;82F262;
    RTS                                                                  ;82F264;


.end:
    JSR.W Save_GameOptionsMenu_ControllerBindings                        ;82F265;
    BCS .return                                                          ;82F268;
    STZ.W $099E                                                          ;82F26A;
    JSR.W Start_GameOptionsMenu_DissolveTransition                       ;82F26D;

.return:
    RTS                                                                  ;82F270;


GameOptionsMenu_9_ScrollControllerSettingsDown:
    LDA.B $B3                                                            ;82F271;
    CLC                                                                  ;82F273;
    ADC.W #$0002                                                         ;82F274;
    STA.B $B3                                                            ;82F277;
    CMP.W #$0020                                                         ;82F279;
    BNE .return                                                          ;82F27C;
    LDA.W #$0007                                                         ;82F27E;
    STA.W $0DE2                                                          ;82F281;

.return:
    RTS                                                                  ;82F284;


GameOptionsMenu_A_ScrollControllerSettingsUp:
    LDA.B $B3                                                            ;82F285;
    SEC                                                                  ;82F287;
    SBC.W #$0002                                                         ;82F288;
    STA.B $B3                                                            ;82F28B;
    BNE RTS_82F295                                                       ;82F28D;
    LDA.W #$0007                                                         ;82F28F;
    STA.W $0DE2                                                          ;82F292;

RTS_82F295:
    RTS                                                                  ;82F295;


Setup_MenuSelectionMissile:
    LDA.W #$0018                                                         ;82F296;
    STA.W $1AAD,Y                                                        ;82F299;
    LDA.W #$0038                                                         ;82F29C;
    STA.W $1ABD,Y                                                        ;82F29F;
    LDA.W #$0E00                                                         ;82F2A2;
    STA.W $1ACD,Y                                                        ;82F2A5;
    RTS                                                                  ;82F2A8;


PreInstruction_MenuSelectionMissile:
    LDA.W $0998                                                          ;82F2A9;
    CMP.W #$0002                                                         ;82F2AC;
    BEQ +                                                                ;82F2AF;
    LDA.W #$0001                                                         ;82F2B1;
    STA.W $1B1D,X                                                        ;82F2B4;
    LDA.W #InstList_GameOptionsMenu_Delete                               ;82F2B7;
    STA.W $1AFD,X                                                        ;82F2BA;
    RTS                                                                  ;82F2BD;


  + LDA.W $0DE2                                                          ;82F2BE;
    ASL A                                                                ;82F2C1;
    TAY                                                                  ;82F2C2;
    LDA.W .pointers,Y                                                    ;82F2C3;
    BEQ +                                                                ;82F2C6;
    STA.B $12                                                            ;82F2C8;
    LDA.W $099E                                                          ;82F2CA;
    ASL A                                                                ;82F2CD;
    ASL A                                                                ;82F2CE;
    CLC                                                                  ;82F2CF;
    ADC.B $12                                                            ;82F2D0;
    TAY                                                                  ;82F2D2;
    LDA.W $0000,Y                                                        ;82F2D3;
    STA.W $1AAD,X                                                        ;82F2D6;
    LDA.W $0002,Y                                                        ;82F2D9;
    STA.W $1ABD,X                                                        ;82F2DC;
    RTS                                                                  ;82F2DF;


  + LDA.W #$0180                                                         ;82F2E0;
    STA.W $1AAD,X                                                        ;82F2E3;
    LDA.W #$0010                                                         ;82F2E6;
    STA.W $1ABD,X                                                        ;82F2E9;
    RTS                                                                  ;82F2EC;


.pointers:
    dw $0000,$0000                                                       ;82F2ED; 0 - Finish fading out
    dw .OptionsMenu_X                                                    ;82F2F1; 2 - Fading in options menu
    dw .OptionsMenu_X                                                    ;82F2F3; 3 - Options menu
    dw $0000,$0000,$0000                                                 ;82F2F5; 4 - Start game
    dw .ControllerSettings_X                                             ;82F2FB; 7 - Controller settings
    dw .SpecialSettings_X                                                ;82F2FD; 8 - Special settings
    dw $0000,$0000                                                       ;82F2FF; 9 - Scroll controller settings down
    dw .OptionsMenu_X                                                    ;82F303; B - Transition back to file selection
    dw $0000                                                             ;82F305; C - Fading out options menu to start game

.OptionsMenu_X:
    dw $0018                                                             ;82F307;

.OptionsMenu_Y:
    dw $0038,$0018,$0058,$0018,$0070,$0018,$0090,$0018                   ;82F309;
    dw $00B0                                                             ;82F319;

.ControllerSettings_X:
    dw $0028                                                             ;82F31B;

.ControllerSettings_Y:
    dw $0030,$0028,$0048,$0028,$0060,$0028,$0078,$0028                   ;82F31D;
    dw $0090,$0028,$00A8,$0028,$00C0,$0028,$00B8,$0028                   ;82F32D;
    dw $00D0                                                             ;82F33D;

.SpecialSettings_X:
    dw $0010                                                             ;82F33F;

.SpecialSettings_Y:
    dw $0040,$0010,$0070,$0010,$00A0                                     ;82F341;

Setup_BorderAround_OPTION_MODE:
    LDA.W #$007C                                                         ;82F34B;
    STA.W $1AAD,Y                                                        ;82F34E;
    BRA Common_Border_Setup                                              ;82F351;


Setup_BorderAround_CONTRLLER_SETTING_MODE:
    LDA.W #$0084                                                         ;82F353;
    STA.W $1AAD,Y                                                        ;82F356;
    BRA Common_Border_Setup                                              ;82F359;


Setup_BorderAround_SPECIAL_SETTING_MODE:
    LDA.W #$0080                                                         ;82F35B;
    STA.W $1AAD,Y                                                        ;82F35E;
    BRA Common_Border_Setup                                              ;82F361;


Setup_BorderAround_SAMUS_DATA:
    LDA.W #$0080                                                         ;82F363;
    STA.W $1AAD,Y                                                        ;82F366;

Common_Border_Setup:
    LDA.W #$0010                                                         ;82F369;
    STA.W $1ABD,Y                                                        ;82F36C;
    LDA.W #$0E00                                                         ;82F36F;
    STA.W $1ACD,Y                                                        ;82F372;
    RTS                                                                  ;82F375;


PreInstruction_BorderAround_OPTIONS_MODE:
    LDA.W $0998                                                          ;82F376;
    CMP.W #$0002                                                         ;82F379;
    BNE .delete                                                          ;82F37C;
    LDA.W $0DE2                                                          ;82F37E;
    CMP.W #$0006                                                         ;82F381;
    BNE .return                                                          ;82F384;
    SEP #$20                                                             ;82F386;
    LDA.B $51                                                            ;82F388;
    CMP.B #$80                                                           ;82F38A;
    BEQ .delete                                                          ;82F38C;
    REP #$20                                                             ;82F38E;
    RTS                                                                  ;82F390;


.delete:
    REP #$20                                                             ;82F391;
    LDA.W #$0001                                                         ;82F393;
    STA.W $1B1D,X                                                        ;82F396;
    LDA.W #InstList_GameOptionsMenu_Delete                               ;82F399;
    STA.W $1AFD,X                                                        ;82F39C;

.return:
    RTS                                                                  ;82F39F;


PreInstruction_BorderAround_CONTRLLER_SETTING_MODE:
    LDA.W $0DE2                                                          ;82F3A0;
    CMP.W #$0006                                                         ;82F3A3;
    BNE .dissolveInEnd                                                   ;82F3A6;
    SEP #$20                                                             ;82F3A8;
    LDA.B $51                                                            ;82F3AA;
    CMP.B #$80                                                           ;82F3AC;
    BEQ .delete                                                          ;82F3AE;
    REP #$20                                                             ;82F3B0;
    RTS                                                                  ;82F3B2;


.delete:
    REP #$20                                                             ;82F3B3;
    LDA.W #$0001                                                         ;82F3B5;
    STA.W $1B1D,X                                                        ;82F3B8;
    LDA.W #InstList_GameOptionsMenu_Delete                              ;82F3BB;
    STA.W $1AFD,X                                                        ;82F3BE;
    RTS                                                                  ;82F3C1;


.dissolveInEnd:
    CMP.W #$0009                                                         ;82F3C2;
    BNE .checkScrollingUp                                                ;82F3C5;
    LDA.W $1ABD,X                                                        ;82F3C7;
    SEC                                                                  ;82F3CA;
    SBC.W #$0002                                                         ;82F3CB;
    STA.W $1ABD,X                                                        ;82F3CE;
    RTS                                                                  ;82F3D1;


.checkScrollingUp:
    CMP.W #$000A                                                         ;82F3D2;
    BNE .return                                                          ;82F3D5;
    LDA.W $1ABD,X                                                        ;82F3D7;
    CLC                                                                  ;82F3DA;
    ADC.W #$0002                                                         ;82F3DB;
    STA.W $1ABD,X                                                        ;82F3DE;

.return:
    RTS                                                                  ;82F3E1;


PreInstruction_BorderAround_SPECIAL_SETTING_MODE:
    LDA.W $0DE2                                                          ;82F3E2;
    CMP.W #$0006                                                         ;82F3E5;
    BNE .return                                                          ;82F3E8;
    SEP #$20                                                             ;82F3EA;
    LDA.B $51                                                            ;82F3EC;
    CMP.B #$80                                                           ;82F3EE;
    BEQ .startedFadingIn                                                 ;82F3F0;
    REP #$20                                                             ;82F3F2;
    RTS                                                                  ;82F3F4;


.startedFadingIn:
    REP #$20                                                             ;82F3F5;
    LDA.W #$0001                                                         ;82F3F7;
    STA.W $1B1D,X                                                        ;82F3FA;
    LDA.W #InstList_GameOptionsMenu_Delete                               ;82F3FD;
    STA.W $1AFD,X                                                        ;82F400;

.return:
    RTS                                                                  ;82F403;


UNUSED_PreInstruction_82F404:
    LDA.W $0DE2                                                          ;82F404;
    CMP.W #$0001                                                         ;82F407;
    BNE .return                                                          ;82F40A;
    LDA.W #$0001                                                         ;82F40C;
    STA.W $1B1D,X                                                        ;82F40F;
    LDA.W #InstList_GameOptionsMenu_Delete                               ;82F412;
    STA.W $1AFD,X                                                        ;82F415;

.return:
    RTS                                                                  ;82F418;


Setup_FileSelectMenu_SamusHelmet:
    LDA.W #$00D8                                                         ;82F419;
    STA.W $1AAD,Y                                                        ;82F41C;
    LDA.W #$0010                                                         ;82F41F;
    STA.W $1ABD,Y                                                        ;82F422;
    LDA.W #$0E00                                                         ;82F425;
    STA.W $1ACD,Y                                                        ;82F428;
    RTS                                                                  ;82F42B;


PreInstruction_FileSelectMenu_SamusHelmet:
    LDA.W $0998                                                          ;82F42C;
    CMP.W #$0002                                                         ;82F42F;
    BEQ .extraRTS                                                        ;82F432;
    LDA.W #$0001                                                         ;82F434;
    STA.W $1B1D,X                                                        ;82F437;
    LDA.W #InstList_GameOptionsMenu_Delete                               ;82F43A;
    STA.W $1AFD,X                                                        ;82F43D;
    RTS                                                                  ;82F440;


.extraRTS:
    RTS                                                                  ;82F441;


InstList_GameOptionsMenu_MenuSelectionMissile:
    dw $0008                                                             ;82F442;
    dw TitleMenuSpritemaps_34_MenuSelectionMissile_0                     ;82F444;
    dw $0008                                                             ;82F446;
    dw TitleMenuSpritemaps_35_MenuSelectionMissile_1                     ;82F448;
    dw $0008                                                             ;82F44A;
    dw TitleMenuSpritemaps_36_MenuSelectionMissile_2                     ;82F44C;
    dw $0008                                                             ;82F44E;
    dw TitleMenuSpritemaps_37_MenuSelectionMissile_3                     ;82F450;
    dw Instruction_GameOptionsMenu_GotoY                                 ;82F452;
    dw InstList_GameOptionsMenu_MenuSelectionMissile                     ;82F454;

InstList_GameOptionsMenu_FileSelectMenu_SamusHelmet:
    dw $0090                                                             ;82F456;
    dw TitleMenuSpritemaps_2C_FileSelectMenu_SamusHelmet_0               ;82F458;
    dw $0006                                                             ;82F45A;
    dw TitleMenuSpritemaps_2D_FileSelectMenu_SamusHelmet_1               ;82F45C;
    dw $0008                                                             ;82F45E;
    dw TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2               ;82F460;
    dw $0001                                                             ;82F462;
    dw TitleMenuSpritemaps_2F_FileSelectMenu_SamusHelmet_3               ;82F464;
    dw $0002                                                             ;82F466;
    dw TitleMenuSpritemaps_30_FileSelectMenu_SamusHelmet_4               ;82F468;
    dw $0004                                                             ;82F46A;
    dw TitleMenuSpritemaps_31_FileSelectMenu_SamusHelmet_5               ;82F46C;
    dw $0002                                                             ;82F46E;
    dw TitleMenuSpritemaps_32_FileSelectMenu_SamusHelmet_6               ;82F470;
    dw $0001                                                             ;82F472;
    dw TitleMenuSpritemaps_33_FileSelectMenu_SamusHelmet_7               ;82F474;
    dw $009F                                                             ;82F476;
    dw TitleMenuSpritemaps_2E_FileSelectMenu_SamusHelmet_2               ;82F478;
    dw Instruction_GameOptionsMenu_GotoY                                 ;82F47A;
    dw InstList_GameOptionsMenu_FileSelectMenu_SamusHelmet               ;82F47C;

InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_0:
    dw $0002                                                             ;82F47E;
    dw TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE                  ;82F480;
    dw Instruction_GameOptionsMenu_PreInstruction_inY                    ;82F482;
    dw PreInstruction_BorderAround_OPTIONS_MODE                          ;82F484;

InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_1:
    dw $0090                                                             ;82F486;
    dw TitleMenuSpritemaps_4B_BorderAround_OPTIONS_MODE                  ;82F488;
    dw Instruction_GameOptionsMenu_GotoY                                 ;82F48A;
    dw InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_1              ;82F48C;

InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_0:
    dw $0002                                                             ;82F48E;
    dw TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE       ;82F490;
    dw Instruction_GameOptionsMenu_PreInstruction_inY                    ;82F492;
    dw PreInstruction_BorderAround_CONTRLLER_SETTING_MODE                ;82F494;

InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_1:
    dw $0090                                                             ;82F496;
    dw TitleMenuSpritemaps_49_BorderAround_CONTROLLER_SETTING_MODE       ;82F498;
    dw Instruction_GameOptionsMenu_GotoY                                 ;82F49A;
    dw InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_1         ;82F49C;

InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_0:
    dw $0002                                                             ;82F49E;
    dw TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE          ;82F4A0;
    dw Instruction_GameOptionsMenu_PreInstruction_inY                    ;82F4A2;
    dw PreInstruction_BorderAround_SPECIAL_SETTING_MODE                  ;82F4A4;

InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_1:
    dw $0090                                                             ;82F4A6;
    dw TitleMenuSpritemaps_4D_BorderAround_SPECIAL_SETTING_MODE          ;82F4A8;
    dw Instruction_GameOptionsMenu_GotoY                                 ;82F4AA;
    dw InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_1      ;82F4AC;

InstList_GameOptionsMenu_BorderAround_SAMUS_DATA:
    dw $0090                                                             ;82F4AE;
    dw TitleMenuSpritemaps_48_BorderAround_SAMUS_DATA                    ;82F4B0;
    dw Instruction_GameOptionsMenu_GotoY                                 ;82F4B2;
    dw InstList_GameOptionsMenu_BorderAround_SAMUS_DATA                  ;82F4B4;

InstList_GameOptionsMenu_Delete:
    dw Instruction_GameOptionsMenu_Delete                                ;82F4B6;

GameOptionsMenu_Objects_MenuSelectionMissile_setup:
    dw Setup_MenuSelectionMissile                                        ;82F4B8;

GameOptionsMenu_Objects_MenuSelectionMissile_preInstruction:
    dw PreInstruction_MenuSelectionMissile                               ;82F4BA;

GameOptionsMenu_Objects_MenuSelectionMissile_instructionList:
    dw InstList_GameOptionsMenu_MenuSelectionMissile                     ;82F4BC;

UNUSED_GameOptionsMenu_Objects_FileSelectMenuSamusHelmet_82F4BE:
    dw Setup_FileSelectMenu_SamusHelmet                                  ;82F4BE;
    dw PreInstruction_FileSelectMenu_SamusHelmet                         ;82F4C0;
    dw InstList_GameOptionsMenu_FileSelectMenu_SamusHelmet               ;82F4C2;

GameOptionsMenu_Objects_OPTION_MODE_Border:
    dw Setup_BorderAround_OPTION_MODE                                    ;82F4C4;
    dw RTS_828C10                                                        ;82F4C6;
    dw InstList_GameOptionsMenu_BorderAround_OPTIONS_MODE_0              ;82F4C8;

GameOptionsMenu_Objects_CONTROLLER_SETTING_MODE_Border:
    dw Setup_BorderAround_CONTRLLER_SETTING_MODE                         ;82F4CA;
    dw RTS_828C10                                                        ;82F4CC;
    dw InstList_GameOptionsMenu_BorderAround_CTRL_SETTING_MODE_0         ;82F4CE;

GameOptionsMenu_Objects_SPECIAL_SETTING_MODE_Border:
    dw Setup_BorderAround_SPECIAL_SETTING_MODE                           ;82F4D0;
    dw RTS_828C10                                                        ;82F4D2;
    dw InstList_GameOptionsMenu_BorderAround_SPECIAL_SETTING_MODE_0      ;82F4D4;

GameOptionsMenu_Objects_SAMUS_DATA_Border:
    dw Setup_BorderAround_SAMUS_DATA                                     ;82F4D6;
    dw RTS_828C10                                                        ;82F4D8;
    dw InstList_GameOptionsMenu_BorderAround_SAMUS_DATA                  ;82F4DA;

GameOptionsMenu_ControllerBindings:
    LDX.W #$0000                                                         ;82F4DC;

.loop:
    LDA.W Configurable_Controller_Binding_RAM_Addresses,X                ;82F4DF;
    TAY                                                                  ;82F4E2;
    LDA.W $0000,Y                                                        ;82F4E3;
    BIT.W #$0040                                                         ;82F4E6;
    BNE .X                                                               ;82F4E9;
    BIT.W #$0080                                                         ;82F4EB;
    BNE .A                                                               ;82F4EE;
    BIT.W #$8000                                                         ;82F4F0;
    BNE .B                                                               ;82F4F3;
    BIT.W #$2000                                                         ;82F4F5;
    BNE .Select                                                          ;82F4F8;
    BIT.W #$4000                                                         ;82F4FA;
    BNE .Y                                                               ;82F4FD;
    BIT.W #$0020                                                         ;82F4FF;
    BNE .L                                                               ;82F502;
    BIT.W #$0010                                                         ;82F504;
    BNE .R                                                               ;82F507;

.X:
    LDA.W #$0000                                                         ;82F509;
    STA.W $1B3D,X                                                        ;82F50C;
    BRA .next                                                            ;82F50F;


.A:
    LDA.W #$0001                                                         ;82F511;
    STA.W $1B3D,X                                                        ;82F514;
    BRA .next                                                            ;82F517;


.B:
    LDA.W #$0002                                                         ;82F519;
    STA.W $1B3D,X                                                        ;82F51C;
    BRA .next                                                            ;82F51F;


.Select:
    LDA.W #$0003                                                         ;82F521;
    STA.W $1B3D,X                                                        ;82F524;
    BRA .next                                                            ;82F527;


.Y:
    LDA.W #$0004                                                         ;82F529;
    STA.W $1B3D,X                                                        ;82F52C;
    BRA .next                                                            ;82F52F;


.L:
    LDA.W #$0005                                                         ;82F531;
    STA.W $1B3D,X                                                        ;82F534;
    BRA .next                                                            ;82F537;


.R:
    LDA.W #$0006                                                         ;82F539;
    STA.W $1B3D,X                                                        ;82F53C;

.next:
    INX                                                                  ;82F53F;
    INX                                                                  ;82F540;
    CPX.W #$000E                                                         ;82F541;
    BPL .return                                                          ;82F544;
    JMP.W .loop                                                          ;82F546;


.return:
    RTS                                                                  ;82F549;


Configurable_Controller_Binding_RAM_Addresses:
    dw $09B2                                                             ;82F54A; Shot
    dw $09B4                                                             ;82F54C; Jump
    dw $09B6                                                             ;82F54E; Run
    dw $09BA                                                             ;82F550; Item Select
    dw $09B8                                                             ;82F552; Item Cancel
    dw $09BE                                                             ;82F554; Angle Up
    dw $09BC                                                             ;82F556; Angle Down

Save_GameOptionsMenu_ControllerBindings:
    LDX.W #$0000                                                         ;82F558;

.loop:
    PHX                                                                  ;82F55B;
    LDA.W Configurable_Controller_Binding_RAM_Addresses,X                ;82F55C;
    TAY                                                                  ;82F55F;
    LDA.W $1B3D,X                                                        ;82F560;

.L:
    ASL A                                                                ;82F563;
    TAX                                                                  ;82F564;
    LDA.W Controller_Input_Bitmasks,X                                    ;82F565;
    STA.W $0000,Y                                                        ;82F568;
    PLX                                                                  ;82F56B;
    INX                                                                  ;82F56C;
    INX                                                                  ;82F56D;
    CPX.W #$000E                                                         ;82F56E;
    BMI .loop                                                            ;82F571;
    CLC                                                                  ;82F573;
    RTS                                                                  ;82F574;


Controller_Input_Bitmasks:
    dw $0040,$0080,$8000,$2000,$4000,$0020,$0010,$0200                   ;82F575; X
    dw $0100                                                             ;82F585; Right

Draw_GameOptionsMenu_ControllerBindings:
    LDX.W #$0000                                                         ;82F587;

.loop:
    PHX                                                                  ;82F58A;
    LDA.W $1B3D,X                                                        ;82F58B;
    ASL A                                                                ;82F58E;
    TAY                                                                  ;82F58F;
    LDA.W GameOptionsMenu_TilemapOffsets,X                               ;82F590;
    TAX                                                                  ;82F593;
    LDA.W ControllerButton_TilemapPointers,Y                             ;82F594;
    TAY                                                                  ;82F597;
    LDA.W $0000,Y                                                        ;82F598;
    STA.L $7E3000,X                                                      ;82F59B;
    LDA.W $0002,Y                                                        ;82F59F;
    STA.L $7E3002,X                                                      ;82F5A2;
    LDA.W $0004,Y                                                        ;82F5A6;
    STA.L $7E3004,X                                                      ;82F5A9;
    LDA.W $0006,Y                                                        ;82F5AD;
    STA.L $7E3040,X                                                      ;82F5B0;
    LDA.W $0008,Y                                                        ;82F5B4;
    STA.L $7E3042,X                                                      ;82F5B7;
    LDA.W $000A,Y                                                        ;82F5BB;
    STA.L $7E3044,X                                                      ;82F5BE;
    PLX                                                                  ;82F5C2;
    INX                                                                  ;82F5C3;
    INX                                                                  ;82F5C4;
    CPX.W #$000E                                                         ;82F5C5;
    BMI .loop                                                            ;82F5C8;
    LDA.W $1B47                                                          ;82F5CA;
    CMP.W #$0005                                                         ;82F5CD;
    BEQ .shoulderButton                                                  ;82F5D0;
    CMP.W #$0006                                                         ;82F5D2;
    BEQ .shoulderButton                                                  ;82F5D5;
    LDA.W ButtonTilemaps_OFF                                             ;82F5D7;
    STA.L $7E352E                                                        ;82F5DA;
    LDA.W ButtonTilemaps_OFF2                                            ;82F5DE;
    STA.L $7E3530                                                        ;82F5E1;
    LDA.W ButtonTilemaps_OFF4                                            ;82F5E5;
    STA.L $7E3532                                                        ;82F5E8;
    LDA.W ButtonTilemaps_OFF6                                            ;82F5EC;
    STA.L $7E356E                                                        ;82F5EF;
    LDA.W ButtonTilemaps_OFF8                                            ;82F5F3;
    STA.L $7E3570                                                        ;82F5F6;
    LDA.W ButtonTilemaps_OFFA                                            ;82F5FA;
    STA.L $7E3572                                                        ;82F5FD;

.shoulderButton:
    LDA.W $1B49                                                          ;82F601;
    CMP.W #$0005                                                         ;82F604;
    BEQ .return                                                          ;82F607;
    CMP.W #$0006                                                         ;82F609;
    BEQ .return                                                          ;82F60C;
    LDA.W ButtonTilemaps_OFF                                             ;82F60E;
    STA.L $7E35EE                                                        ;82F611;
    LDA.W ButtonTilemaps_OFF2                                            ;82F615;
    STA.L $7E35F0                                                        ;82F618;
    LDA.W ButtonTilemaps_OFF4                                            ;82F61C;
    STA.L $7E35F2                                                        ;82F61F;
    LDA.W ButtonTilemaps_OFF6                                            ;82F623;
    STA.L $7E362E                                                        ;82F626;
    LDA.W ButtonTilemaps_OFF8                                            ;82F62A;
    STA.L $7E3630                                                        ;82F62D;
    LDA.W ButtonTilemaps_OFFA                                            ;82F631;
    STA.L $7E3632                                                        ;82F634;

.return:
    RTS                                                                  ;82F638;


GameOptionsMenu_TilemapOffsets:
    dw $016E,$022E,$02EE,$03AE,$046E,$052E,$05EE                         ;82F639;

ControllerButton_TilemapPointers:
    dw ButtonTilemaps_X                                                  ;82F647;
    dw ButtonTilemaps_A                                                  ;82F649;
    dw ButtonTilemaps_B                                                  ;82F64B;
    dw ButtonTilemaps_Select                                             ;82F64D;
    dw ButtonTilemaps_Y                                                  ;82F64F;
    dw ButtonTilemaps_L                                                  ;82F651;
    dw ButtonTilemaps_R                                                  ;82F653;
    dw ButtonTilemaps_OFF                                                ;82F655;
    dw ButtonTilemaps_OFF                                                ;82F657;

ButtonTilemaps_X:
    dw $0093,$C0A3,$000F,$00A3,$C093,$000F                               ;82F659;

ButtonTilemaps_A:
    dw $0090,$4090,$000F,$00A0,$40A0,$000F                               ;82F665;

ButtonTilemaps_B:
    dw $0091,$0092,$000F,$00A1,$00A2,$000F                               ;82F671;

ButtonTilemaps_Select:
    dw $0095,$0096,$0097,$00A5,$00A6,$00A7                               ;82F67D;

ButtonTilemaps_Y:
    dw $0094,$4094,$000F,$00A4,$40A4,$000F                               ;82F689;

ButtonTilemaps_L:
    dw $009A,$009B,$409A,$809A,$00AB,$C09A                               ;82F695;

ButtonTilemaps_R:
    dw $009A,$009C,$409A,$809A,$00AC,$C09A                               ;82F6A1;

ButtonTilemaps_OFF:
    dw $0000                                                             ;82F6AD;

ButtonTilemaps_OFF2:
    dw $000E                                                             ;82F6AF;

ButtonTilemaps_OFF4:
    dw $000E                                                             ;82F6B1;

ButtonTilemaps_OFF6:
    dw $0010                                                             ;82F6B3;

ButtonTilemaps_OFF8:
    dw $001F                                                             ;82F6B5;

ButtonTilemaps_OFFA:
    dw $001F                                                             ;82F6B7;

GameOptions_ControllerSettings_SetBinding:
    LDX.W #$000C                                                         ;82F6B9;
    LDA.B $8F                                                            ;82F6BC;

.loopInput:
    BIT.W Controller_Input_Bitmasks,X                                    ;82F6BE;
    BNE +                                                                ;82F6C1;
    DEX                                                                  ;82F6C3;
    DEX                                                                  ;82F6C4;
    BPL .loopInput                                                       ;82F6C5;
    RTS                                                                  ;82F6C7;


  + TXA                                                                  ;82F6C8;
    LSR A                                                                ;82F6C9;
    STA.B $12                                                            ;82F6CA;
    LDA.W $099E                                                          ;82F6CC;
    ASL A                                                                ;82F6CF;
    CLC                                                                  ;82F6D0;
    ADC.W #$0002                                                         ;82F6D1;
    CMP.W #$000E                                                         ;82F6D4;
    BMI +                                                                ;82F6D7;
    LDA.W #$0000                                                         ;82F6D9;

  + TAY                                                                  ;82F6DC;
    LDX.W #$0005                                                         ;82F6DD;

.loopFindExisting:
    LDA.W $1B3D,Y                                                        ;82F6E0;
    CMP.B $12                                                            ;82F6E3;
    BEQ .found                                                           ;82F6E5;
    INY                                                                  ;82F6E7;
    INY                                                                  ;82F6E8;
    CPY.W #$000E                                                         ;82F6E9;
    BMI .next                                                            ;82F6EC;
    LDY.W #$0000                                                         ;82F6EE;

.next:
    DEX                                                                  ;82F6F1;
    BPL .loopFindExisting                                                ;82F6F2;

.found:
    PHY                                                                  ;82F6F4;
    LDA.W $099E                                                          ;82F6F5;
    ASL A                                                                ;82F6F8;
    TAY                                                                  ;82F6F9;
    LDA.W $1B3D,Y                                                        ;82F6FA;
    STA.B $14                                                            ;82F6FD;
    LDA.B $12                                                            ;82F6FF;
    STA.W $1B3D,Y                                                        ;82F701;
    PLY                                                                  ;82F704;
    LDA.B $14                                                            ;82F705;
    STA.W $1B3D,Y                                                        ;82F707;
    JSR.W Draw_GameOptionsMenu_ControllerBindings                        ;82F70A;
    RTS                                                                  ;82F70D;


RTL_82F70E:
    RTL                                                                  ;82F70E;


Freespace_Bank82_F70F:                                                   ;82F70F;
; $8F1 bytes
