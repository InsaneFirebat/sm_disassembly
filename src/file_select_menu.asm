FileSelectMenu:
    REP #$30                                                             ;8193FB;
    PHB                                                                  ;8193FD;
    PHK                                                                  ;8193FE;
    PLB                                                                  ;8193FF;
    LDA.W $0727                                                          ;819400;
    ASL A                                                                ;819403;
    TAX                                                                  ;819404;
    JSR.W (.pointers,X)                                                  ;819405;
    PLB                                                                  ;819408;
    RTL                                                                  ;819409;


.pointers:
    dw FileSelectMenu_Index0_TitleSequenceToMain_FadeOutConfigGfx        ;81940A;
    dw FileSelectMenu_Index1_TitleSequenceToMain_LoadBG2                 ;81940C;
    dw FileSelectMenu_Index2_TitleSequenceToMain                         ;81940E;
    dw FileSelectMenu_Index3_TitleSequenceToMain_FadeIn                  ;819410;
    dw FileSelectMenu_Index4_Main                                        ;819412;
    dw FileSelectMenu_Index5_13_FadeOutFromMain                          ;819414;
    dw FileSelectMenu_Index6_MainToFileCopy_Initialise                   ;819416;
    dw FileSelectMenu_Index7_15_FadeInFromMain                           ;819418;
    dw FileSelectMenu_Index8_FileCopy_SelectSource                       ;81941A;
    dw FileSelectMenu_Index9_FileCopy_InitialiseSelectDestination        ;81941C;
    dw FileSelectMenu_IndexA_FileCopy_SelectDestination                  ;81941E;
    dw FileSelectMenu_IndexB_FileCopy_InitialiseConfirmation             ;819420;
    dw FileSelectMenu_IndexC_FileCopy_Confirmation                       ;819422;
    dw FileSelectMenu_Index0_FileCopy_DoFileCopy                         ;819424;
    dw FileSelectMenu_IndexE_FileCopy_CopyCompleted                      ;819426;
    dw FileSelectMenu_IndexF_1B_FadeOutToMain                            ;819428;
    dw FileSelectMenu_Index10_1C_ReloadMain                              ;81942A;
    dw FileSelectMenu_Index11_10_FadeInToMain                            ;81942C;
    dw FileSelectMenu_Index12_FileCopyToMain_MenuIndex_Main              ;81942E;
    dw FileSelectMenu_Index5_13_FadeOutFromMain                          ;819430;
    dw FileSelectMenu_Index14_MainToFileClear_Initialise                 ;819432;
    dw FileSelectMenu_Index7_15_FadeInFromMain                           ;819434;
    dw FileSelectMenu_Index16_FileClear_SelectSlot                       ;819436;
    dw FileSelectMenu_Index17_FileClear_InitialiseConfirmation           ;819438;
    dw FileSelectMenu_Index18_FileClear_Confirmation                     ;81943A;
    dw FileSelectMenu_Index19_FileClear_DoFileClear                      ;81943C;
    dw FileSelectMenu_Index1A_FileClear_ClearCompleted                   ;81943E;
    dw FileSelectMenu_IndexF_1B_FadeOutToMain                            ;819440;
    dw FileSelectMenu_Index10_1C_ReloadMain                              ;819442;
    dw FileSelectMenu_Index11_10_FadeInToMain                            ;819444;
    dw FileSelectMenu_Index1E_FileClearToMain_MenuIndex_Main             ;819446;
    dw FileSelectMenu_Index1F_MainToOptionsMenu_TurnSamusHelmet          ;819448;
    dw FileSelectMenu_Index20_MainToOptionsMenu_FadeOut                  ;81944A;
    dw FileSelectMenu_Index21_MainToTitleSequence                        ;81944C;

FileSelectMenu_Index0_TitleSequenceToMain_FadeOutConfigGfx:
    REP #$30                                                             ;81944E;
    JSL.L HandleFadingOut                                                ;819450;
    LDA.B $51                                                            ;819454;
    AND.W #$000F                                                         ;819456;
    BEQ +                                                                ;819459;
    RTS                                                                  ;81945B;


  + JSL.L SetForceBlankAndWaitForNMI                                     ;81945C;
    LDA.W #$0001                                                         ;819460;
    JSL.L QueueSound_Lib3_Max6                                           ;819463;
    JSL.L Disable_HDMAObjects                                            ;819467;
    JSL.L Wait_End_VBlank_Clear_HDMA                                     ;81946B;
    INC.W $0727                                                          ;81946F;
    JSR.W MapVRAMForMenu                                                 ;819472;
    JSR.W LoadInitialMenuTiles                                           ;819475;
    REP #$30                                                             ;819478;
    STZ.B $B1                                                            ;81947A;
    STZ.B $B5                                                            ;81947C;
    STZ.B $B9                                                            ;81947E;
    STZ.B $B3                                                            ;819480;
    STZ.B $B7                                                            ;819482;
    STZ.B $BB                                                            ;819484;

LoadFileSelectPalettes:
    LDX.W #$0000                                                         ;819486;

.loop:
    LDA.L Menu_Palettes,X                                                ;819489;
    STA.L $7EC000,X                                                      ;81948D;
    LDA.L Menu_Palettes+2,X                                              ;819491;
    STA.L $7EC002,X                                                      ;819495;
    INX                                                                  ;819499;
    INX                                                                  ;81949A;
    INX                                                                  ;81949B;
    INX                                                                  ;81949C;
    CPX.W #$0200                                                         ;81949D;
    BMI .loop                                                            ;8194A0;
    RTS                                                                  ;8194A2;


FileSelectMenu_Index20_MainToOptionsMenu_FadeOut:
    REP #$30                                                             ;8194A3;
    JSL.L Draw_Menu_Selection_Missile                                    ;8194A5;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;8194A9;
    JSR.W Draw_FileSelect_SamusHelmets                                   ;8194AD;
    JSL.L HandleFadingOut                                                ;8194B0;
    LDA.B $51                                                            ;8194B4;
    AND.W #$000F                                                         ;8194B6;
    BNE .return                                                          ;8194B9;
    LDA.W #$0002                                                         ;8194BB;
    STA.W $0998                                                          ;8194BE;
    STZ.W $0727                                                          ;8194C1;
    LDY.W #$0000                                                         ;8194C4;
    LDA.W #$0000                                                         ;8194C7;

.loop:
    STA.W $198D,Y                                                        ;8194CA;
    INY                                                                  ;8194CD;
    INY                                                                  ;8194CE;
    CPY.W #$0030                                                         ;8194CF;
    BMI .loop                                                            ;8194D2;

.return:
    RTS                                                                  ;8194D4;


FileSelectMenu_Index21_MainToTitleSequence:
    REP #$30                                                             ;8194D5;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;8194D7;
    JSR.W Draw_FileSelect_SamusHelmets                                   ;8194DB;
    JSL.L HandleFadingOut                                                ;8194DE;
    LDA.B $51                                                            ;8194E2;
    AND.W #$000F                                                         ;8194E4;
    BNE .return                                                          ;8194E7;
    JML.L SoftReset                                                      ;8194E9;


.return:
    RTS                                                                  ;8194ED;


FileSelectMenu_Index5_13_FadeOutFromMain:
    REP #$30                                                             ;8194EE;
    JSL.L Draw_Menu_Selection_Missile                                    ;8194F0;

FileSelectMenu_IndexF_1B_FadeOutToMain:
    JSL.L HandleFadingOut                                                ;8194F4;
    LDA.B $57                                                            ;8194F8;
    AND.W #$FF0F                                                         ;8194FA;
    STA.B $12                                                            ;8194FD;
    LDA.B $51                                                            ;8194FF;
    AND.W #$000F                                                         ;819501;
    ASL A                                                                ;819504;
    ASL A                                                                ;819505;
    ASL A                                                                ;819506;
    ASL A                                                                ;819507;
    EOR.W #$00F0                                                         ;819508;
    ORA.B $12                                                            ;81950B;
    STA.B $57                                                            ;81950D;
    LDA.B $51                                                            ;81950F;
    AND.W #$000F                                                         ;819511;
    BNE .return                                                          ;819514;
    JSL.L SetForceBlankAndWaitForNMI                                     ;819516;
    INC.W $0727                                                          ;81951A;

.return:
    RTS                                                                  ;81951D;


FileSelectMenu_Index11_10_FadeInToMain:
    REP #$30                                                             ;81951E;
    LDA.W $0952                                                          ;819520;
    ASL A                                                                ;819523;
    ASL A                                                                ;819524;
    TAX                                                                  ;819525;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X        ;819526;
    STA.W $19AB                                                          ;819529;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X        ;81952C;
    STA.W $19A1                                                          ;81952F;

FileSelectMenu_Index7_15_FadeInFromMain:
    REP #$30                                                             ;819532;
    JSL.L Draw_Menu_Selection_Missile                                    ;819534;
    JSL.L HandleFadingIn                                                 ;819538;
    LDA.B $57                                                            ;81953C;
    AND.W #$FF0F                                                         ;81953E;
    STA.B $12                                                            ;819541;
    LDA.B $51                                                            ;819543;
    AND.W #$000F                                                         ;819545;
    ASL A                                                                ;819548;
    ASL A                                                                ;819549;
    ASL A                                                                ;81954A;
    ASL A                                                                ;81954B;
    EOR.W #$00F0                                                         ;81954C;
    ORA.B $12                                                            ;81954F;
    STA.B $57                                                            ;819551;
    LDA.B $51                                                            ;819553;
    AND.W #$000F                                                         ;819555;
    CMP.W #$000F                                                         ;819558;
    BNE .return                                                          ;81955B;
    INC.W $0727                                                          ;81955D;

.return:
    RTS                                                                  ;819560;


FileSelectMenu_Index6_MainToFileCopy_Initialise:
    REP #$30                                                             ;819561;
    INC.W $0727                                                          ;819563;

Initialise_FileSelectMenu_FileCopy:
    JSR.W ClearMenuTilemap                                               ;819566;
    LDY.W #Tilemap_FileSelect_dataCopyMode                               ;819569;
    LDX.W #($9<<1)|($1<<6)                                               ;81956C; $0052
    STZ.W $0F96                                                          ;81956F;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819572;
    LDY.W #Tilemap_FileSelect_copyWhichData                              ;819575;
    LDX.W #($8<<1)|($5<<6)                                               ;819578; $0150
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81957B;
    JSR.W LoadMenuExitTilemap                                            ;81957E;
    JSR.W Draw_FileCopyClear_SaveFileInfo                                ;819581;
    JSR.W SetInitial_FileCopyClear_MenuSelection                         ;819584;
    JSR.W Set_FileCopyMenu_SelectionMissile_Position                     ;819587;
    STZ.W $19B7                                                          ;81958A;
    STZ.W $19B9                                                          ;81958D;
    RTS                                                                  ;819590;


UNUSED_REP30_819591:
    REP #$30                                                             ;819591;

SetInitial_FileCopyClear_MenuSelection:
    LDA.W $0954                                                          ;819593;
    LDY.W #$0000                                                         ;819596;

.loop:
    LSR A                                                                ;819599;
    BCS .return                                                          ;81959A;
    INY                                                                  ;81959C;
    CPY.W #$0003                                                         ;81959D;
    BMI .loop                                                            ;8195A0;

.return:
    STY.W $19B5                                                          ;8195A2;
    RTS                                                                  ;8195A5;


ClearMenuTilemap:
    LDX.W #$07FE                                                         ;8195A6;
    LDA.W #$000F                                                         ;8195A9;

.loop:
    STA.L $7E3600,X                                                      ;8195AC;
    DEX                                                                  ;8195B0;
    DEX                                                                  ;8195B1;
    BPL .loop                                                            ;8195B2;
    RTS                                                                  ;8195B4;


LoadMenuExitTilemap:
    LDY.W #Tilemap_FileSelect_exit                                       ;8195B5;
    LDX.W #($4<<1)|($1A<<6)                                              ;8195B8; $0688
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8195BB;


Draw_FileCopyClear_SaveFileInfo:
    LDA.W #$0000                                                         ;8195BE;
    JSR.W LoadFromSRAM_external                                          ;8195C1;
    STZ.W $0F96                                                          ;8195C4;
    LDA.W $0954                                                          ;8195C7;
    BIT.W #$0001                                                         ;8195CA;
    BNE +                                                                ;8195CD;
    LDA.W #$0400                                                         ;8195CF;
    STA.W $0F96                                                          ;8195D2;

  + JSR.W Draw_FileCopyClear_SaveSlotAInfo                               ;8195D5;
    LDA.W #$0001                                                         ;8195D8;
    JSR.W LoadFromSRAM_external                                          ;8195DB;
    STZ.W $0F96                                                          ;8195DE;
    LDA.W $0954                                                          ;8195E1;
    BIT.W #$0002                                                         ;8195E4;
    BNE +                                                                ;8195E7;
    LDA.W #$0400                                                         ;8195E9;
    STA.W $0F96                                                          ;8195EC;

  + JSR.W Draw_FileCopyClear_SaveSlotBInfo                               ;8195EF;
    LDA.W #$0002                                                         ;8195F2;
    JSR.W LoadFromSRAM_external                                          ;8195F5;
    STZ.W $0F96                                                          ;8195F8;
    LDA.W $0954                                                          ;8195FB;
    BIT.W #$0004                                                         ;8195FE;
    BNE +                                                                ;819601;
    LDA.W #$0400                                                         ;819603;
    STA.W $0F96                                                          ;819606;

  + JSR.W Draw_FileCopyClear_SaveSlotCInfo                               ;819609;
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1                            ;81960C;


Draw_FileCopyClear_SaveSlotAInfo:
    LDX.W #$0218                                                         ;81960F;
    LDA.W $0954                                                          ;819612;
    EOR.W #$FFFF                                                         ;819615;
    AND.W #$0001                                                         ;819618;
    JSR.W Draw_FileSelection_Health                                      ;81961B;
    LDX.W #$0272                                                         ;81961E;
    LDA.W $0954                                                          ;819621;
    EOR.W #$FFFF                                                         ;819624;
    AND.W #$0001                                                         ;819627;
    JSR.W Draw_FileSelection_Time                                        ;81962A;
    LDY.W #Tilemap_FileSelect_time                                       ;81962D;
    LDX.W #($1A<<1)|($8<<6)                                              ;819630; $0234
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819633;
    LDY.W #Tilemap_FileSelect_SamusA                                     ;819636;
    LDX.W #($4<<1)|($8<<6)                                               ;819639; $0208
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81963C;


Draw_FileCopyClear_SaveSlotBInfo:
    LDX.W #$0318                                                         ;81963F;
    LDA.W $0954                                                          ;819642;
    EOR.W #$FFFF                                                         ;819645;
    AND.W #$0002                                                         ;819648;
    JSR.W Draw_FileSelection_Health                                      ;81964B;
    LDX.W #$0372                                                         ;81964E;
    LDA.W $0954                                                          ;819651;
    EOR.W #$FFFF                                                         ;819654;
    AND.W #$0002                                                         ;819657;
    JSR.W Draw_FileSelection_Time                                        ;81965A;
    LDY.W #Tilemap_FileSelect_time                                       ;81965D;
    LDX.W #($1A<<1)|($C<<6)                                              ;819660; $0334
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819663;
    LDY.W #Tilemap_FileSelect_SamusB                                     ;819666;
    LDX.W #($4<<1)|($C<<6)                                               ;819669; $0308
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81966C;


Draw_FileCopyClear_SaveSlotCInfo:
    LDX.W #$0418                                                         ;81966F;
    LDA.W $0954                                                          ;819672;
    EOR.W #$FFFF                                                         ;819675;
    AND.W #$0004                                                         ;819678;
    JSR.W Draw_FileSelection_Health                                      ;81967B;
    LDX.W #$0472                                                         ;81967E;
    LDA.W $0954                                                          ;819681;
    EOR.W #$FFFF                                                         ;819684;
    AND.W #$0004                                                         ;819687;
    JSR.W Draw_FileSelection_Time                                        ;81968A;
    LDY.W #Tilemap_FileSelect_time                                       ;81968D;
    LDX.W #($1A<<1)|($10<<6)                                             ;819690; $0434
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819693;
    LDY.W #Tilemap_FileSelect_SamusC                                     ;819696;
    LDX.W #($4<<1)|($10<<6)                                              ;819699; $0408
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81969C;


QueueTransfer_MenuTilemap_ToVRAMBG1:
    LDX.W $0330                                                          ;81969F;
    LDA.W #$0800                                                         ;8196A2;
    STA.B $D0,X                                                          ;8196A5;
    LDA.W #$3600                                                         ;8196A7;
    STA.B $D2,X                                                          ;8196AA;
    LDA.W #$007E                                                         ;8196AC;
    STA.B $D4,X                                                          ;8196AF;
    LDA.B $58                                                            ;8196B1;
    AND.W #$00FC                                                         ;8196B3;
    XBA                                                                  ;8196B6;
    STA.B $D5,X                                                          ;8196B7;
    TXA                                                                  ;8196B9;
    CLC                                                                  ;8196BA;
    ADC.W #$0007                                                         ;8196BB;
    STA.W $0330                                                          ;8196BE;
    RTS                                                                  ;8196C1;


FileSelectMenu_Index8_FileCopy_SelectSource:
    REP #$30                                                             ;8196C2;
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;8196C4;
    JSL.L Draw_Menu_Selection_Missile                                    ;8196C8;
    LDA.B $8F                                                            ;8196CC;
    BIT.W #$1080                                                         ;8196CE;
    BNE .select                                                          ;8196D1;
    BIT.W #$8000                                                         ;8196D3;
    BNE .B                                                               ;8196D6;
    BIT.W #$0800                                                         ;8196D8;
    BNE .up                                                              ;8196DB;
    BIT.W #$0400                                                         ;8196DD;
    BEQ Set_FileCopyMenu_SelectionMissile_Position                       ;8196E0;
    SEP #$30                                                             ;8196E2;
    LDA.W $0954                                                          ;8196E4;
    LDX.W $19B5                                                          ;8196E7;

.loopDown:
    INX                                                                  ;8196EA;
    CPX.B #$04                                                           ;8196EB;
    BPL Set_FileCopyMenu_SelectionMissile_Position                       ;8196ED;
    CPX.B #$03                                                           ;8196EF;
    BEQ +                                                                ;8196F1;
    BIT.W .bitmasks,X                                                    ;8196F3;
    BEQ .loopDown                                                        ;8196F6;

  + STX.W $19B5                                                          ;8196F8;
    REP #$30                                                             ;8196FB;
    LDA.W #$0037                                                         ;8196FD;
    JSL.L QueueSound_Lib1_Max6                                           ;819700;
    BRA Set_FileCopyMenu_SelectionMissile_Position                       ;819704;

    REP #$30                                                             ;819706;

.B:
    LDA.W $0727                                                          ;819708;
    CLC                                                                  ;81970B;
    ADC.W #$0007                                                         ;81970C;
    STA.W $0727                                                          ;81970F;
    LDA.W #$0037                                                         ;819712;
    JSL.L QueueSound_Lib1_Max6                                           ;819715;
    RTS                                                                  ;819719;


.up:
    SEP #$30                                                             ;81971A;
    LDA.W $0954                                                          ;81971C;
    LDX.W $19B5                                                          ;81971F;

.loopUp:
    DEX                                                                  ;819722;
    BMI Set_FileCopyMenu_SelectionMissile_Position                       ;819723;
    BIT.W .bitmasks,X                                                    ;819725;
    BEQ .loopUp                                                          ;819728;
    STX.W $19B5                                                          ;81972A;
    REP #$30                                                             ;81972D;
    LDA.W #$0037                                                         ;81972F;
    JSL.L QueueSound_Lib1_Max6                                           ;819732;
    BRA Set_FileCopyMenu_SelectionMissile_Position                       ;819736;


.select:
    REP #$30                                                             ;819738;
    LDA.W #$0037                                                         ;81973A;
    JSL.L QueueSound_Lib1_Max6                                           ;81973D;
    LDA.W $19B5                                                          ;819741;
    CMP.W #$0003                                                         ;819744;
    BEQ +                                                                ;819747;
    STA.W $19B7                                                          ;819749;
    INC.W $0727                                                          ;81974C;
    RTS                                                                  ;81974F;


  + LDA.W $0727                                                          ;819750;
    CLC                                                                  ;819753;
    ADC.W #$0007                                                         ;819754;
    STA.W $0727                                                          ;819757;
    RTS                                                                  ;81975A;


.bitmasks:
    db $01,$02,$04                                                       ;81975B;

Set_FileCopyMenu_SelectionMissile_Position:
    REP #$30                                                             ;81975E;
    LDA.W $19B5                                                          ;819760;
    ASL A                                                                ;819763;
    TAX                                                                  ;819764;
    LDA.W .position,X                                                    ;819765;
    STA.W $19AB                                                          ;819768;
    LDA.W #$0016                                                         ;81976B;
    STA.W $19A1                                                          ;81976E;
    RTS                                                                  ;819771;


.position:
    dw $0048,$0068,$0088,$00D3                                           ;819772;

FileSelectMenu_Index9_FileCopy_InitialiseSelectDestination:
    REP #$30                                                             ;81977A;
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;81977C;
    JSR.W Draw_FileCopy_SelectDestination_SaveFileInfo                   ;819780;
    INC.W $0727                                                          ;819783;
    LDA.W #$0000                                                         ;819786;

.loop:
    CMP.W $19B7                                                          ;819789;
    BNE +                                                                ;81978C;
    INC A                                                                ;81978E;
    CMP.W #$0003                                                         ;81978F;
    BMI .loop                                                            ;819792;

  + STA.W $19B5                                                          ;819794;
    BRA Set_FileCopyMenu_SelectionMissile_Position                       ;819797;


Draw_FileCopy_SelectDestination_SaveFileInfo:
    JSR.W ClearMenuTilemap                                               ;819799;
    LDY.W #Tilemap_FileSelect_dataCopyMode                               ;81979C;
    LDX.W #($9<<1)|($1<<6)                                               ;81979F; $0052
    STZ.W $0F96                                                          ;8197A2;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8197A5;
    LDY.W #Tilemap_FileSelect_copySamusToWhere                           ;8197A8;
    LDX.W #($4<<1)|($5<<6)                                               ;8197AB; $0148
    STZ.W $0F96                                                          ;8197AE;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8197B1;
    LDA.W $19B7                                                          ;8197B4;
    CLC                                                                  ;8197B7;
    ADC.W #$206A                                                         ;8197B8;
    STA.L $7E3760                                                        ;8197BB;
    JSR.W LoadMenuExitTilemap                                            ;8197BF;
    LDA.W #$0000                                                         ;8197C2;
    JSR.W LoadFromSRAM_external                                          ;8197C5;
    LDX.W #$0400                                                         ;8197C8;
    LDA.W $19B7                                                          ;8197CB;
    BEQ +                                                                ;8197CE;
    LDX.W #$0000                                                         ;8197D0;

  + TXA                                                                  ;8197D3;
    STA.W $0F96                                                          ;8197D4;
    JSR.W Draw_FileCopyClear_SaveSlotAInfo                               ;8197D7;
    LDA.W #$0001                                                         ;8197DA;
    JSR.W LoadFromSRAM_external                                          ;8197DD;
    LDX.W #$0400                                                         ;8197E0;
    LDA.W $19B7                                                          ;8197E3;
    CMP.W #$0001                                                         ;8197E6;
    BEQ +                                                                ;8197E9;
    LDX.W #$0000                                                         ;8197EB;

  + TXA                                                                  ;8197EE;
    STA.W $0F96                                                          ;8197EF;
    JSR.W Draw_FileCopyClear_SaveSlotBInfo                               ;8197F2;
    LDA.W #$0002                                                         ;8197F5;
    JSR.W LoadFromSRAM_external                                          ;8197F8;
    LDX.W #$0400                                                         ;8197FB;
    LDA.W $19B7                                                          ;8197FE;
    CMP.W #$0002                                                         ;819801;
    BEQ +                                                                ;819804;
    LDX.W #$0000                                                         ;819806;

  + TXA                                                                  ;819809;
    STA.W $0F96                                                          ;81980A;
    JSR.W Draw_FileCopyClear_SaveSlotCInfo                               ;81980D;
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1                            ;819810;


FileSelectMenu_IndexA_FileCopy_SelectDestination:
    REP #$30                                                             ;819813;
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;819815;
    JSL.L Draw_Menu_Selection_Missile                                    ;819819;
    LDA.B $8F                                                            ;81981D;
    BIT.W #$1080                                                         ;81981F;
    BNE .select                                                          ;819822;
    BIT.W #$8000                                                         ;819824;
    BNE .B                                                               ;819827;
    BIT.W #$0800                                                         ;819829;
    BNE .up                                                              ;81982C;
    BIT.W #$0400                                                         ;81982E;
    BEQ .setMissilePosition                                              ;819831;
    LDA.W #$0037                                                         ;819833;
    JSL.L QueueSound_Lib1_Max6                                           ;819836;
    LDX.W $19B5                                                          ;81983A;

.loopDown:
    INX                                                                  ;81983D;
    CPX.W #$0004                                                         ;81983E;
    BEQ .setMissilePosition                                              ;819841;
    CPX.W $19B7                                                          ;819843;
    BNE .setMenuSelection                                                ;819846;
    BRA .loopDown                                                        ;819848;


.setMenuSelection:
    STX.W $19B5                                                          ;81984A;

.setMissilePosition:
    LDA.W $19B5                                                          ;81984D;
    ASL A                                                                ;819850;
    TAX                                                                  ;819851;
    LDA.W .positions,X                                                   ;819852;
    STA.W $19AB                                                          ;819855;
    LDA.W #$0016                                                         ;819858;
    STA.W $19A1                                                          ;81985B;
    RTS                                                                  ;81985E;


.B:
    LDA.W $0727                                                          ;81985F;
    SEC                                                                  ;819862;
    SBC.W #$0002                                                         ;819863;
    STA.W $0727                                                          ;819866;
    LDA.W $19B7                                                          ;819869;
    STA.W $19B5                                                          ;81986C;
    LDA.W #$0037                                                         ;81986F;
    JSL.L QueueSound_Lib1_Max6                                           ;819872;
    JMP.W Initialise_FileSelectMenu_FileCopy                             ;819876;


.select:
    LDA.W #$0037                                                         ;819879;
    JSL.L QueueSound_Lib1_Max6                                           ;81987C;
    LDA.W $19B5                                                          ;819880;
    CMP.W #$0003                                                         ;819883;
    BEQ +                                                                ;819886;
    STA.W $19B9                                                          ;819888;
    INC.W $0727                                                          ;81988B;
    BRA .setMissilePosition                                              ;81988E;


  + LDA.W $0727                                                          ;819890;
    CLC                                                                  ;819893;
    ADC.W #$0005                                                         ;819894;
    STA.W $0727                                                          ;819897;
    RTS                                                                  ;81989A;


.up:
    LDA.W #$0037                                                         ;81989B;
    JSL.L QueueSound_Lib1_Max6                                           ;81989E;
    LDX.W $19B5                                                          ;8198A2;

.loopUp:
    DEX                                                                  ;8198A5;
    BMI .setMissilePosition                                              ;8198A6;
    CPX.W $19B7                                                          ;8198A8;
    BNE .setMenuSelection                                                ;8198AB;
    BRA .loopUp                                                          ;8198AD;


.positions:
    dw $0048,$0068,$0088,$00D4                                           ;8198AF;

FileSelectMenu_IndexB_FileCopy_InitialiseConfirmation:
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;8198B7;
    LDY.W #Tilemap_FileSelect_copySamusToSamus                           ;8198BB;
    LDX.W #($2<<1)|($5<<6)                                               ;8198BE; $0144
    STZ.W $0F96                                                          ;8198C1;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8198C4;
    LDA.W $19B7                                                          ;8198C7;
    CLC                                                                  ;8198CA;
    ADC.W #$206A                                                         ;8198CB;
    STA.L $7E375C                                                        ;8198CE;
    LDA.W $19B9                                                          ;8198D2;
    CLC                                                                  ;8198D5;
    ADC.W #$206A                                                         ;8198D6;
    STA.L $7E3776                                                        ;8198D9;
    JSR.W Draw_FileCopyClear_Confirmation                                ;8198DD;
    INC.W $0727                                                          ;8198E0;
    STZ.W $19B5                                                          ;8198E3;
    LDA.W #$0008                                                         ;8198E6;
    STA.W $198F                                                          ;8198E9;
    RTS                                                                  ;8198EC;


Draw_FileCopyClear_Confirmation:
    LDY.W #Tilemap_FileSelect_isThisOK                                   ;8198ED;
    LDX.W #($A<<1)|($14<<6)                                              ;8198F0; $0514
    STZ.W $0F96                                                          ;8198F3;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;8198F6;
    LDY.W #Tilemap_FileSelect_yes                                        ;8198F9;
    LDX.W #($E<<1)|($16<<6)                                              ;8198FC; $059C
    STZ.W $0F96                                                          ;8198FF;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819902;
    LDX.W #$0680                                                         ;819905;
    LDA.W #$000F                                                         ;819908;

.loop:
    STA.L $7E3600,X                                                      ;81990B;
    INX                                                                  ;81990F;
    INX                                                                  ;819910;
    CPX.W #$06C0                                                         ;819911;
    BMI .loop                                                            ;819914;
    LDY.W #Tilemap_FileSelect_no                                         ;819916;
    LDX.W #($E<<1)|($19<<6)                                              ;819919; $065C
    STZ.W $0F96                                                          ;81991C;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81991F;

Draw_FileCopyClear_Confirmation_SaveFileInfo:
    LDA.W #$0000                                                         ;819922;
    JSR.W LoadFromSRAM_external                                          ;819925;
    LDX.W #$0000                                                         ;819928;
    LDA.W $19B7                                                          ;81992B;
    BEQ +                                                                ;81992E;
    LDA.W $19B9                                                          ;819930;
    BEQ +                                                                ;819933;
    LDX.W #$0400                                                         ;819935;

  + TXA                                                                  ;819938;
    STA.W $0F96                                                          ;819939;
    JSR.W Draw_FileCopyClear_SaveSlotAInfo                               ;81993C;
    LDA.W #$0001                                                         ;81993F;
    JSR.W LoadFromSRAM_external                                          ;819942;
    LDX.W #$0000                                                         ;819945;
    LDA.W $19B7                                                          ;819948;
    DEC A                                                                ;81994B;
    BEQ +                                                                ;81994C;
    LDA.W $19B9                                                          ;81994E;
    DEC A                                                                ;819951;
    BEQ +                                                                ;819952;
    LDX.W #$0400                                                         ;819954;

  + TXA                                                                  ;819957;
    STA.W $0F96                                                          ;819958;
    JSR.W Draw_FileCopyClear_SaveSlotBInfo                               ;81995B;
    LDA.W #$0002                                                         ;81995E;
    JSR.W LoadFromSRAM_external                                          ;819961;
    LDX.W #$0000                                                         ;819964;
    LDA.W $19B7                                                          ;819967;
    CMP.W #$0002                                                         ;81996A;
    BEQ +                                                                ;81996D;
    LDA.W $19B9                                                          ;81996F;
    CMP.W #$0002                                                         ;819972;
    BEQ +                                                                ;819975;
    LDX.W #$0400                                                         ;819977;

  + TXA                                                                  ;81997A;
    STA.W $0F96                                                          ;81997B;
    JSR.W Draw_FileCopyClear_SaveSlotCInfo                               ;81997E;
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1                            ;819981;


FileSelectMenu_IndexC_FileCopy_Confirmation:
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;819984;
    JSL.L Draw_Menu_Selection_Missile                                    ;819988;
    JSR.W HandleFileCopyArrowPalette                                     ;81998C;
    JSL.L Draw_FileCopy_Arrow                                            ;81998F;
    LDA.B $8F                                                            ;819993;
    BIT.W #$0C00                                                         ;819995;
    BNE .toggle                                                          ;819998;
    BIT.W #$8000                                                         ;81999A;
    BNE .B                                                               ;81999D;
    BIT.W #$1080                                                         ;81999F;
    BEQ .setMissilePosition                                              ;8199A2;
    LDA.W #$0038                                                         ;8199A4;
    JSL.L QueueSound_Lib1_Max6                                           ;8199A7;
    LDA.W $19B5                                                          ;8199AB;
    BEQ .yes                                                             ;8199AE;
    LDA.W $0727                                                          ;8199B0;
    SEC                                                                  ;8199B3;
    SBC.W #$0004                                                         ;8199B4;
    STA.W $0727                                                          ;8199B7;
    JMP.W Initialise_FileSelectMenu_FileCopy                             ;8199BA;


.B:
    LDA.W $0727                                                          ;8199BD;
    SEC                                                                  ;8199C0;
    SBC.W #$0003                                                         ;8199C1;
    STA.W $0727                                                          ;8199C4;
    LDA.W $19B9                                                          ;8199C7;
    STA.W $19B5                                                          ;8199CA;
    LDA.W #$0037                                                         ;8199CD;
    JSL.L QueueSound_Lib1_Max6                                           ;8199D0;
    RTS                                                                  ;8199D4;


.yes:
    INC.W $0727                                                          ;8199D5;
    RTS                                                                  ;8199D8;


.toggle:
    LDA.W $19B5                                                          ;8199D9;
    EOR.W #$0001                                                         ;8199DC;
    STA.W $19B5                                                          ;8199DF;
    LDA.W #$0037                                                         ;8199E2;
    JSL.L QueueSound_Lib1_Max6                                           ;8199E5;

.setMissilePosition:
    LDY.W #$00B8                                                         ;8199E9;
    LDA.W $19B5                                                          ;8199EC;
    BEQ +                                                                ;8199EF;
    LDY.W #$00D0                                                         ;8199F1;

  + STY.W $19AB                                                          ;8199F4;
    LDA.W #$005E                                                         ;8199F7;
    STA.W $19A1                                                          ;8199FA;
    RTS                                                                  ;8199FD;


HandleFileCopyArrowPalette:
    LDA.W $198F                                                          ;8199FE;
    BEQ .return                                                          ;819A01;
    DEC A                                                                ;819A03;
    STA.W $198F                                                          ;819A04;
    BNE .return                                                          ;819A07;
    LDA.W #$0004                                                         ;819A09;
    STA.W $198F                                                          ;819A0C;
    LDA.L $7EC122                                                        ;819A0F;
    TAY                                                                  ;819A13;
    LDX.W #$0000                                                         ;819A14;

.loop:
    LDA.L $7EC124,X                                                      ;819A17;
    STA.L $7EC122,X                                                      ;819A1B;
    INX                                                                  ;819A1F;
    INX                                                                  ;819A20;
    CPX.W #$000C                                                         ;819A21;
    BMI .loop                                                            ;819A24;
    TYA                                                                  ;819A26;
    STA.L $7EC12E                                                        ;819A27;

.return:
    RTS                                                                  ;819A2B;


FileSelectMenu_Index0_FileCopy_DoFileCopy:
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;819A2C;
    JSL.L Draw_Menu_Selection_Missile                                    ;819A30;
    JSR.W HandleFileCopyArrowPalette                                     ;819A34;
    JSL.L Draw_FileCopy_Arrow                                            ;819A37;
    LDA.W #$0070                                                         ;819A3B;
    STA.B $02                                                            ;819A3E;
    STA.B $05                                                            ;819A40;
    LDA.W $19B7                                                          ;819A42;
    ASL A                                                                ;819A45;
    TAX                                                                  ;819A46;
    LDA.L SaveSlotOffsets,X                                              ;819A47;
    STA.B $00                                                            ;819A4B;
    LDA.W $19B9                                                          ;819A4D;
    ASL A                                                                ;819A50;
    TAX                                                                  ;819A51;
    LDA.L SaveSlotOffsets,X                                              ;819A52;
    STA.B $03                                                            ;819A56;
    LDY.W #$0000                                                         ;819A58;

.loop:
    LDA.B [$00],Y                                                        ;819A5B;
    STA.B [$03],Y                                                        ;819A5D;
    INY                                                                  ;819A5F;
    INY                                                                  ;819A60;
    CPY.W #$065C                                                         ;819A61;
    BMI .loop                                                            ;819A64;
    LDA.W $19B7                                                          ;819A66;
    ASL A                                                                ;819A69;
    TAX                                                                  ;819A6A;
    LDA.L $701FF0,X                                                      ;819A6B;
    PHA                                                                  ;819A6F;
    LDA.L $701FF8,X                                                      ;819A70;
    PHA                                                                  ;819A74;
    LDA.L $700000,X                                                      ;819A75;
    PHA                                                                  ;819A79;
    LDA.L $700008,X                                                      ;819A7A;
    PHA                                                                  ;819A7E;
    LDA.W $19B9                                                          ;819A7F;
    ASL A                                                                ;819A82;
    TAX                                                                  ;819A83;
    PLA                                                                  ;819A84;
    STA.L $700008,X                                                      ;819A85;
    PLA                                                                  ;819A89;
    STA.L $700000,X                                                      ;819A8A;
    PLA                                                                  ;819A8E;
    STA.L $701FF8,X                                                      ;819A8F;
    PLA                                                                  ;819A93;
    STA.L $701FF0,X                                                      ;819A94;
    INC.W $0727                                                          ;819A98;
    LDX.W #$0500                                                         ;819A9B;
    LDA.W #$000F                                                         ;819A9E;

.loopRows:
    STA.L $7E3600,X                                                      ;819AA1;
    INX                                                                  ;819AA5;
    INX                                                                  ;819AA6;
    CPX.W #$0740                                                         ;819AA7;
    BMI .loopRows                                                        ;819AAA;
    LDA.W $19B9                                                          ;819AAC;
    ASL A                                                                ;819AAF;
    TAX                                                                  ;819AB0;
    LDA.W $0954                                                          ;819AB1;
    ORA.W .list,X                                                        ;819AB4;
    STA.W $0954                                                          ;819AB7;
    LDA.W $19B9                                                          ;819ABA;
    ASL A                                                                ;819ABD;
    ASL A                                                                ;819ABE;
    CLC                                                                  ;819ABF;
    ADC.W #$0009                                                         ;819AC0;
    ASL A                                                                ;819AC3;
    ASL A                                                                ;819AC4;
    ASL A                                                                ;819AC5;
    ASL A                                                                ;819AC6;
    ASL A                                                                ;819AC7;
    ASL A                                                                ;819AC8;
    CLC                                                                  ;819AC9;
    ADC.W #$0018                                                         ;819ACA;
    TAX                                                                  ;819ACD;
    LDY.W #$0000                                                         ;819ACE;
    LDA.W #$000F                                                         ;819AD1;

.loopColumns:
    STA.L $7E3600,X                                                      ;819AD4;
    STA.L $7E35C0,X                                                      ;819AD8;
    INX                                                                  ;819ADC;
    INX                                                                  ;819ADD;
    INY                                                                  ;819ADE;
    INY                                                                  ;819ADF;
    CPY.W #$0016                                                         ;819AE0;
    BMI .loopColumns                                                     ;819AE3;
    LDY.W #Tilemap_FileSelect_copyCompleted                              ;819AE5;
    LDX.W #($8<<1)|($14<<6)                                              ;819AE8; $0510
    STZ.W $0F96                                                          ;819AEB;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819AEE;
    JMP.W Draw_FileCopyClear_Confirmation_SaveFileInfo                   ;819AF1;


.list:
    dw $0001,$0002,$0004                                                 ;819AF4;

FileSelectMenu_IndexE_FileCopy_CopyCompleted:
    JSL.L Draw_Border_Around_DATA_COPY_MODE                              ;819AFA;
    LDA.B $8F                                                            ;819AFE;
    BEQ .return                                                          ;819B00;
    LDA.W #$0037                                                         ;819B02;
    JSL.L QueueSound_Lib1_Max6                                           ;819B05;
    INC.W $0727                                                          ;819B09;
    LDA.L $701FEC                                                        ;819B0C;
    CMP.W #$0000                                                         ;819B10;
    BMI .zero                                                            ;819B13;
    CMP.W #$0003                                                         ;819B15;
    BPL .zero                                                            ;819B18;
    TAX                                                                  ;819B1A;
    AND.L $701FEE                                                        ;819B1B;
    BEQ .validSaveSlot                                                   ;819B1F;

.zero:
    LDX.W #$0000                                                         ;819B21;

.validSaveSlot:
    STX.W $0952                                                          ;819B24;

.return:
    RTS                                                                  ;819B27;


FileSelectMenu_Index12_FileCopyToMain_MenuIndex_Main:
    LDA.W $0727                                                          ;819B28;
    SEC                                                                  ;819B2B;
    SBC.W #$000E                                                         ;819B2C;
    STA.W $0727                                                          ;819B2F;
    RTS                                                                  ;819B32;


FileSelectMenu_Index14_MainToFileClear_Initialise:
    REP #$30                                                             ;819B33;
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819B35;
    INC.W $0727                                                          ;819B39;

Initialise_FileSelectMenu_FileClear:
    JSR.W ClearMenuTilemap                                               ;819B3C;
    LDY.W #Tilemap_FileSelect_dataClearMode                              ;819B3F;
    LDX.W #($8<<1)|($1<<6)                                               ;819B42; $0050
    STZ.W $0F96                                                          ;819B45;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819B48;
    LDY.W #Tilemap_FileSelect_clearWhichData                             ;819B4B;
    LDX.W #($0<<1)|($5<<6)                                               ;819B4E; $0140
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819B51;
    JSR.W LoadMenuExitTilemap                                            ;819B54;
    JSR.W Draw_FileCopyClear_SaveFileInfo                                ;819B57;
    STZ.W $19B7                                                          ;819B5A;
    JSR.W SetInitial_FileCopyClear_MenuSelection                         ;819B5D;
    JSR.W Set_FileClearMenuSelection_MissilePosition                     ;819B60;
    RTS                                                                  ;819B63;


FileSelectMenu_Index16_FileClear_SelectSlot:
    REP #$30                                                             ;819B64;
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819B66;
    JSL.L Draw_Menu_Selection_Missile                                    ;819B6A;
    LDA.B $8F                                                            ;819B6E;
    BIT.W #$1080                                                         ;819B70;
    BNE .select                                                          ;819B73;
    BIT.W #$8000                                                         ;819B75;
    BNE .exit                                                            ;819B78;
    BIT.W #$0800                                                         ;819B7A;
    BNE .up                                                              ;819B7D;
    BIT.W #$0400                                                         ;819B7F;
    BEQ Set_FileClearMenuSelection_MissilePosition                       ;819B82;
    SEP #$30                                                             ;819B84;
    LDA.W $0954                                                          ;819B86;
    LDX.W $19B5                                                          ;819B89;

.loopDown:
    INX                                                                  ;819B8C;
    CPX.B #$04                                                           ;819B8D;
    BPL Set_FileClearMenuSelection_MissilePosition                       ;819B8F;
    CPX.B #$03                                                           ;819B91;
    BEQ +                                                                ;819B93;
    BIT.W .data,X                                                        ;819B95;
    BEQ .loopDown                                                        ;819B98;

  + STX.W $19B5                                                          ;819B9A;
    LDA.B #$37                                                           ;819B9D;
    JSL.L QueueSound_Lib1_Max6                                           ;819B9F;
    BRA Set_FileClearMenuSelection_MissilePosition                       ;819BA3;


.exit:
    REP #$30                                                             ;819BA5;
    LDA.W #$0037                                                         ;819BA7;
    JSL.L QueueSound_Lib1_Max6                                           ;819BAA;
    LDA.W $0727                                                          ;819BAE;
    CLC                                                                  ;819BB1;
    ADC.W #$0005                                                         ;819BB2;
    STA.W $0727                                                          ;819BB5;
    RTS                                                                  ;819BB8;


.up:
    SEP #$30                                                             ;819BB9;
    LDA.W $0954                                                          ;819BBB;
    LDX.W $19B5                                                          ;819BBE;

.loopUp:
    DEX                                                                  ;819BC1;
    BMI Set_FileClearMenuSelection_MissilePosition                       ;819BC2;
    BIT.W .data,X                                                        ;819BC4;
    BEQ .loopUp                                                          ;819BC7;
    STX.W $19B5                                                          ;819BC9;
    LDA.B #$37                                                           ;819BCC;
    JSL.L QueueSound_Lib1_Max6                                           ;819BCE;
    BRA Set_FileClearMenuSelection_MissilePosition                       ;819BD2;


.select:
    REP #$30                                                             ;819BD4;
    LDA.W #$0037                                                         ;819BD6;
    JSL.L QueueSound_Lib1_Max6                                           ;819BD9;
    LDA.W $19B5                                                          ;819BDD;
    CMP.W #$0003                                                         ;819BE0;
    BEQ .exit                                                            ;819BE3;
    STA.W $19B7                                                          ;819BE5;
    INC.W $0727                                                          ;819BE8;
    RTS                                                                  ;819BEB;


.data:
    db $01,$02,$04                                                       ;819BEC;

Set_FileClearMenuSelection_MissilePosition:
    REP #$30                                                             ;819BEF;
    LDA.W $19B5                                                          ;819BF1;
    ASL A                                                                ;819BF4;
    TAX                                                                  ;819BF5;
    LDA.W .positions,X                                                   ;819BF6;
    STA.W $19AB                                                          ;819BF9;
    LDA.W #$0016                                                         ;819BFC;
    STA.W $19A1                                                          ;819BFF;
    RTS                                                                  ;819C02;


.positions:
    dw $0048,$0068,$0088,$00D3                                           ;819C03;

FileSelectMenu_Index17_FileClear_InitialiseConfirmation:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819C0B;
    LDY.W #Tilemap_FileSelect_clearSamusA                                ;819C0F;
    LDX.W #($0<<1)|($5<<6)                                               ;819C12; $0140
    STZ.W $0F96                                                          ;819C15;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819C18;
    LDA.W $19B7                                                          ;819C1B;
    CLC                                                                  ;819C1E;
    ADC.W #$206A                                                         ;819C1F;
    STA.L $7E376A                                                        ;819C22;
    LDA.W #$0003                                                         ;819C26;
    STA.W $19B9                                                          ;819C29;
    JSR.W Draw_FileCopyClear_Confirmation                                ;819C2C;
    INC.W $0727                                                          ;819C2F;
    STZ.W $19B5                                                          ;819C32;
    RTS                                                                  ;819C35;


FileSelectMenu_Index18_FileClear_Confirmation:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819C36;
    JSL.L Draw_Menu_Selection_Missile                                    ;819C3A;
    LDA.B $8F                                                            ;819C3E;
    BIT.W #$0C00                                                         ;819C40;
    BNE .toggle                                                          ;819C43;
    BIT.W #$8000                                                         ;819C45;
    BNE .B                                                               ;819C48;
    BIT.W #$1080                                                         ;819C4A;
    BEQ .setMissilePosition                                              ;819C4D;
    LDA.W #$0038                                                         ;819C4F;
    JSL.L QueueSound_Lib1_Max6                                           ;819C52;
    LDA.W $19B5                                                          ;819C56;
    BEQ .yes                                                             ;819C59;

.B:
    LDA.W $0727                                                          ;819C5B;
    SEC                                                                  ;819C5E;
    SBC.W #$0002                                                         ;819C5F;
    STA.W $0727                                                          ;819C62;
    LDA.W $19B7                                                          ;819C65;
    STA.W $19B5                                                          ;819C68;
    LDA.W #$0037                                                         ;819C6B;
    JSL.L QueueSound_Lib1_Max6                                           ;819C6E;
    JMP.W Initialise_FileSelectMenu_FileClear                            ;819C72;


.yes:
    INC.W $0727                                                          ;819C75;
    RTS                                                                  ;819C78;


.toggle:
    LDA.W $19B5                                                          ;819C79;
    EOR.W #$0001                                                         ;819C7C;
    STA.W $19B5                                                          ;819C7F;
    LDA.W #$0037                                                         ;819C82;
    JSL.L QueueSound_Lib1_Max6                                           ;819C85;

.setMissilePosition:
    LDY.W #$00B8                                                         ;819C89;
    LDA.W $19B5                                                          ;819C8C;
    BEQ +                                                                ;819C8F;
    LDY.W #$00D0                                                         ;819C91;

  + STY.W $19AB                                                          ;819C94;
    LDA.W #$005E                                                         ;819C97;
    STA.W $19A1                                                          ;819C9A;
    RTS                                                                  ;819C9D;


FileSelectMenu_Index19_FileClear_DoFileClear:
    REP #$30                                                             ;819C9E;
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819CA0;
    LDA.W #$0070                                                         ;819CA4;
    STA.B $02                                                            ;819CA7;
    LDA.W $19B7                                                          ;819CA9;
    ASL A                                                                ;819CAC;
    TAX                                                                  ;819CAD;
    LDA.L SaveSlotOffsets,X                                              ;819CAE;
    STA.B $00                                                            ;819CB2;
    LDY.W #$0000                                                         ;819CB4;
    LDA.W #$0000                                                         ;819CB7;

.loopClear:
    STA.B [$00],Y                                                        ;819CBA;
    INY                                                                  ;819CBC;
    INY                                                                  ;819CBD;
    CPY.W #$065C                                                         ;819CBE;
    BMI .loopClear                                                       ;819CC1;
    LDA.W $19B7                                                          ;819CC3;
    ASL A                                                                ;819CC6;
    TAX                                                                  ;819CC7;
    LDA.W #$0000                                                         ;819CC8;
    STA.L $700000,X                                                      ;819CCB;
    STA.L $700008,X                                                      ;819CCF;
    STA.L $701FF0,X                                                      ;819CD3;
    STA.L $701FF8,X                                                      ;819CD7;
    INC.W $0727                                                          ;819CDB;
    JSR.W NewSaveFile                                                    ;819CDE;
    LDA.W $19B7                                                          ;819CE1;
    JSL.L LoadFromSRAM                                                   ;819CE4;
    LDA.W $19B7                                                          ;819CE8;
    STA.W $079F                                                          ;819CEB;
    JSL.L LoadMirrorOfCurrentAreasMapExplored                            ;819CEE;
    LDX.W #$0500                                                         ;819CF2;
    LDA.W #$000F                                                         ;819CF5;

.loopRows:
    STA.L $7E3600,X                                                      ;819CF8;
    INX                                                                  ;819CFC;
    INX                                                                  ;819CFD;
    CPX.W #$0740                                                         ;819CFE;
    BMI .loopRows                                                        ;819D01;
    LDA.W $19B7                                                          ;819D03;
    ASL A                                                                ;819D06;
    TAX                                                                  ;819D07;
    LDA.W $0954                                                          ;819D08;
    AND.W .data,X                                                        ;819D0B;
    STA.W $0954                                                          ;819D0E;
    LDY.W #Tilemap_FileSelect_dataCleared                                ;819D11;
    LDX.W #($0<<1)|($14<<6)                                              ;819D14; $0500
    STZ.W $0F96                                                          ;819D17;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819D1A;
    JMP.W Draw_FileCopyClear_Confirmation_SaveFileInfo                   ;819D1D;


.data:
    dw $FFFE,$FFFD,$FFFB                                                 ;819D20;

FileSelectMenu_Index1A_FileClear_ClearCompleted:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE                             ;819D26;
    LDA.B $8F                                                            ;819D2A;
    BEQ .return                                                          ;819D2C;
    LDA.W #$0037                                                         ;819D2E;
    JSL.L QueueSound_Lib1_Max6                                           ;819D31;
    INC.W $0727                                                          ;819D35;
    LDA.W #$0000                                                         ;819D38;
    JSL.L LoadFromSRAM                                                   ;819D3B;
    BCS .slotACorrupt                                                    ;819D3F;

.selectSlotA:
    LDA.W #$0000                                                         ;819D41;
    STA.W $0952                                                          ;819D44;
    RTS                                                                  ;819D47;


.slotACorrupt:
    LDA.W #$0001                                                         ;819D48;
    JSL.L LoadFromSRAM                                                   ;819D4B;
    BCS +                                                                ;819D4F;
    LDA.W #$0001                                                         ;819D51;
    STA.W $0952                                                          ;819D54;
    RTS                                                                  ;819D57;


  + LDA.W #$0002                                                         ;819D58;
    JSL.L LoadFromSRAM                                                   ;819D5B;
    BCS .selectSlotA                                                     ;819D5F;
    LDA.W #$0002                                                         ;819D61;
    STA.W $0952                                                          ;819D64;

.return:
    RTS                                                                  ;819D67;


FileSelectMenu_Index1E_FileClearToMain_MenuIndex_Main:
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;819D68;
    LDA.W $0727                                                          ;819D6C;
    SEC                                                                  ;819D6F;
    SBC.W #$001A                                                         ;819D70;
    STA.W $0727                                                          ;819D73;
    RTS                                                                  ;819D76;


FileSelectMenu_Index1F_MainToOptionsMenu_TurnSamusHelmet:
    JSL.L Draw_Menu_Selection_Missile                                    ;819D77;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;819D7B;
    LDX.W #$0004                                                         ;819D7F;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819D82;
    LDX.W #$0006                                                         ;819D85;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819D88;
    LDX.W #$0008                                                         ;819D8B;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819D8E;
    LDA.B $8F                                                            ;819D91;
    BIT.W #$1080                                                         ;819D93;
    BNE .advance                                                         ;819D96;
    LDA.W $199B                                                          ;819D98;
    CMP.W #$0007                                                         ;819D9B;
    BNE +                                                                ;819D9E;
    LDA.W $1991                                                          ;819DA0;
    BEQ .advance                                                         ;819DA3;

  + LDA.W $199D                                                          ;819DA5;
    CMP.W #$0007                                                         ;819DA8;
    BNE +                                                                ;819DAB;
    LDA.W $1993                                                          ;819DAD;
    BEQ .advance                                                         ;819DB0;

  + LDA.W $199F                                                          ;819DB2;
    CMP.W #$0007                                                         ;819DB5;
    BNE .return                                                          ;819DB8;
    LDA.W $1995                                                          ;819DBA;
    BNE .return                                                          ;819DBD;

.advance:
    INC.W $0727                                                          ;819DBF;

.return:
    RTS                                                                  ;819DC2;


Draw_FileSelect_SamusHelmets:
    LDX.W #$0004                                                         ;819DC3;
    LDA.W #$0000                                                         ;819DC6;
    STA.W $198D,X                                                        ;819DC9;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819DCC;
    LDX.W #$0006                                                         ;819DCF;
    LDA.W #$0000                                                         ;819DD2;
    STA.W $198D,X                                                        ;819DD5;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;819DD8;
    LDX.W #$0008                                                         ;819DDB;
    LDA.W #$0000                                                         ;819DDE;
    STA.W $198D,X                                                        ;819DE1;

Draw_FileSelect_Slot_SamusHelmet:
    PHX                                                                  ;819DE4;
    PHB                                                                  ;819DE5;
    PHK                                                                  ;819DE6;
    PLB                                                                  ;819DE7;
    LDA.W $198D,X                                                        ;819DE8;
    BEQ timerHandled                                                     ;819DEB;
    DEC A                                                                ;819DED;
    STA.W $198D,X                                                        ;819DEE;
    BNE timerHandled                                                     ;819DF1;
    LDA.W #$0008                                                         ;819DF3;
    STA.W $198D,X                                                        ;819DF6;
    LDA.W $1997,X                                                        ;819DF9;
    INC A                                                                ;819DFC;
    CMP.W #$0008                                                         ;819DFD;
    BMI +                                                                ;819E00;
    LDA.W #$0000                                                         ;819E02;
    STA.W $198D,X                                                        ;819E05;
    LDA.W #$0007                                                         ;819E08;

  + STA.W $1997,X                                                        ;819E0B;

timerHandled:
    LDA.W $1997,X                                                        ;819E0E;
    ASL A                                                                ;819E11;
    TAY                                                                  ;819E12;
    LDA.W #$0E00                                                         ;819E13;
    STA.B $03                                                            ;819E16;
    LDA.W .data,Y                                                        ;819E18;
    PHA                                                                  ;819E1B;
    LDA.W $19AB,X                                                        ;819E1C;
    TAY                                                                  ;819E1F;
    LDA.W $19A1,X                                                        ;819E20;
    TAX                                                                  ;819E23;
    PLA                                                                  ;819E24;
    JSL.L AddSpritemapFrom_82C569_TableToOAM                             ;819E25;
    PLB                                                                  ;819E29;
    PLX                                                                  ;819E2A;
    RTS                                                                  ;819E2B;


.data:
    dw $002C,$002D,$002E,$002F,$0030,$0031,$0032,$0033,$0033             ;819E2C;

FileSelectMap:
    REP #$30                                                             ;819E3E;
    PHB                                                                  ;819E40;
    PHK                                                                  ;819E41;
    PLB                                                                  ;819E42;
    LDA.W $0727                                                          ;819E43;
    ASL A                                                                ;819E46;
    TAX                                                                  ;819E47;
    JSR.W (.pointers,X)                                                  ;819E48;
    PLB                                                                  ;819E4B;
    RTL                                                                  ;819E4C;


.pointers:
    dw FileSelectMap_Index0_GameOptionsToAreaSelectMap_ClearBG2          ;819E4D;
    dw FileSelectMap_Index1_GameOptionsToAreaSelectMap_FadeOut           ;819E4F;
    dw FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap         ;819E51;
    dw FileSelectMap_Index3_GameOptionsToAreaSelectMap                   ;819E53;
    dw FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap          ;819E55;
    dw FileSelectMap_Index5_GameOptionsToAreaSelectMap_ExpSqrTrans       ;819E57;
    dw FineSelectMap_Index6_AreaSelectMap                                ;819E59;
    dw FileSelectMap_Index7_AreaSelectMapToRoomSelectMap                 ;819E5B;
    dw FileSelectMap_Index8_AreaSelectMapToRoomSelectMap                 ;819E5D;
    dw FileSelectMap_Index9_AreaSelectMapToRoomSelectMap_Init            ;819E5F;
    dw FileSelectMap_IndexA_RoomSelectMap                                ;819E61;
    dw FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData             ;819E63;
    dw FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData             ;819E65;
    dw FileSelectMap_IndexD_RoomSelectMapToAreaSelectMap_FadeOut         ;819E67;
    dw FileSelectMap_IndexE_RoomSelectMapToLoadingGameData_Wait          ;819E69;
    dw FileSelectMap_IndexF_RoomSelectMapToAreaSelectMap_ClearBG1        ;819E6B;
    dw FileSelectMap_Index10_RoomSelectMapToAreaSelectMap_LoadPal        ;819E6D;
    dw FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap         ;819E6F;
    dw FileSelectMap_Index12_RoomSelectMapToAreaSelectMap                ;819E71;
    dw FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap          ;819E73;
    dw FileSelectMap_Index14_PrepContractSquareTransToAreaSelect         ;819E75;
    dw FileSelectMap_Index15_RoomSelectMapToAreaSelectMap                ;819E77;
    dw FileSelectMap_Index16_FileClear_AreaSelectMapToGameOptions        ;819E79;

FileSelectMap_Index16_FileClear_AreaSelectMapToGameOptions:
    JSR.W DrawAreaSelectMapLabels                                        ;819E7B;
    JSL.L HandleFadingOut                                                ;819E7E;
    LDA.B $51                                                            ;819E82;
    AND.W #$000F                                                         ;819E84;
    BNE .return                                                          ;819E87;
    LDA.W #$0002                                                         ;819E89;
    STA.W $0998                                                          ;819E8C;
    STZ.W $0727                                                          ;819E8F;

.return:
    RTS                                                                  ;819E92;


FileSelectMenu_Index1_TitleSequenceToMain_LoadBG2:
    REP #$30                                                             ;819E93;
    LDX.W #$07FE                                                         ;819E95;
    LDA.W #$000F                                                         ;819E98;

.loop:
    LDA.L Zebes_and_Stars_Tilemap,X                                      ;819E9B;
    STA.L $7E3600,X                                                      ;819E9F;
    DEX                                                                  ;819EA3;
    DEX                                                                  ;819EA4;
    BPL .loop                                                            ;819EA5;
    LDX.W $0330                                                          ;819EA7;
    LDA.W #$0800                                                         ;819EAA;
    STA.B $D0,X                                                          ;819EAD;
    LDA.W #$3600                                                         ;819EAF;
    STA.B $D2,X                                                          ;819EB2;
    LDA.W #$007E                                                         ;819EB4;
    STA.B $D4,X                                                          ;819EB7;
    LDA.B $59                                                            ;819EB9;
    AND.W #$00FC                                                         ;819EBB;
    XBA                                                                  ;819EBE;
    STA.B $D5,X                                                          ;819EBF;
    TXA                                                                  ;819EC1;
    CLC                                                                  ;819EC2;
    ADC.W #$0007                                                         ;819EC3;
    STA.W $0330                                                          ;819EC6;
    INC.W $0727                                                          ;819EC9;
    LDA.W #$0001                                                         ;819ECC;
    STA.W $198D                                                          ;819ECF;
    STZ.W $1997                                                          ;819ED2;
    RTS                                                                  ;819ED5;


FileSelectMenu_Index2_TitleSequenceToMain:
    REP #$30                                                             ;819ED6;
    LDA.L $701FEC                                                        ;819ED8;
    CMP.W #$0000                                                         ;819EDC;
    BMI +                                                                ;819EDF;
    CMP.W #$0003                                                         ;819EE1;
    BPL +                                                                ;819EE4;
    TAX                                                                  ;819EE6;
    AND.L $701FEE                                                        ;819EE7;
    BEQ .validSaveSlot                                                   ;819EEB;

  + LDX.W #$0000                                                         ;819EED;

.validSaveSlot:
    STX.W $0952                                                          ;819EF0;

FileSelectMenu_Index10_1C_ReloadMain:
    LDX.W #$07FE                                                         ;819EF3;
    LDA.W #$000F                                                         ;819EF6;

.loopTilemap:
    STA.L $7E3600,X                                                      ;819EF9;
    DEX                                                                  ;819EFD;
    DEX                                                                  ;819EFE;
    BPL .loopTilemap                                                     ;819EFF;
    LDA.W #$FFFF                                                         ;819F01;
    STA.W $0954                                                          ;819F04;
    LDY.W #Tilemap_FileSelect_SamusData                                  ;819F07;
    LDX.W #($B<<1)|($1<<6)                                               ;819F0A; $0056
    STZ.W $0F96                                                          ;819F0D;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F10;
    LDY.W #Tilemap_FileSelect_SamusA                                     ;819F13;
    LDX.W #($3<<1)|($5<<6)                                               ;819F16; $0146
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F19;
    LDA.W #$0000                                                         ;819F1C;
    JSR.W LoadFromSRAM_external                                          ;819F1F;
    ROR.W $0954                                                          ;819F22;
    LDX.W #$015C                                                         ;819F25;
    LDA.W $0954                                                          ;819F28;
    BIT.W #$8000                                                         ;819F2B;
    JSR.W Draw_FileSelection_Health                                      ;819F2E;
    LDX.W #$01B4                                                         ;819F31;
    LDA.W $0954                                                          ;819F34;
    BIT.W #$8000                                                         ;819F37;
    JSR.W Draw_FileSelection_Time                                        ;819F3A;
    LDY.W #Tilemap_FileSelect_time                                       ;819F3D;
    LDX.W #($1B<<1)|($5<<6)                                              ;819F40; $0176
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F43;
    LDY.W #Tilemap_FileSelect_SamusB                                     ;819F46;
    LDX.W #($3<<1)|($A<<6)                                               ;819F49; $0286
    STZ.W $0F96                                                          ;819F4C;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F4F;
    LDA.W #$0001                                                         ;819F52;
    JSR.W LoadFromSRAM_external                                          ;819F55;
    ROR.W $0954                                                          ;819F58;
    LDX.W #$029C                                                         ;819F5B;
    LDA.W $0954                                                          ;819F5E;
    BIT.W #$8000                                                         ;819F61;
    JSR.W Draw_FileSelection_Health                                      ;819F64;
    LDX.W #$02F4                                                         ;819F67;
    LDA.W $0954                                                          ;819F6A;
    BIT.W #$8000                                                         ;819F6D;
    JSR.W Draw_FileSelection_Time                                        ;819F70;
    LDY.W #Tilemap_FileSelect_time                                       ;819F73;
    LDX.W #($1B<<1)|($A<<6)                                              ;819F76; $02B6
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F79;
    LDY.W #Tilemap_FileSelect_SamusC                                     ;819F7C;
    LDX.W #($3<<1)|($F<<6)                                               ;819F7F; $03C6
    STZ.W $0F96                                                          ;819F82;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819F85;
    LDA.W #$0002                                                         ;819F88;
    JSR.W LoadFromSRAM_external                                          ;819F8B;
    ROR.W $0954                                                          ;819F8E;
    LDX.W #$03DC                                                         ;819F91;
    LDA.W $0954                                                          ;819F94;
    BIT.W #$8000                                                         ;819F97;
    JSR.W Draw_FileSelection_Health                                      ;819F9A;
    LDX.W #$0434                                                         ;819F9D;
    LDA.W $0954                                                          ;819FA0;
    BIT.W #$8000                                                         ;819FA3;
    JSR.W Draw_FileSelection_Time                                        ;819FA6;
    LDY.W #Tilemap_FileSelect_time                                       ;819FA9;
    LDX.W #($1B<<1)|($F<<6)                                              ;819FAC; $03F6
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819FAF;
    LDA.W $0954                                                          ;819FB2;
    EOR.W #$FFFF                                                         ;819FB5;
    XBA                                                                  ;819FB8;
    LSR A                                                                ;819FB9;
    LSR A                                                                ;819FBA;
    LSR A                                                                ;819FBB;
    LSR A                                                                ;819FBC;
    LSR A                                                                ;819FBD;
    STA.W $0954                                                          ;819FBE;
    CMP.W #$0000                                                         ;819FC1;
    BEQ .loadTilemap                                                     ;819FC4;
    LDY.W #Tilemap_FileSelect_dataCopy                                   ;819FC6;
    LDX.W #($4<<1)|($14<<6)                                              ;819FC9; $0508
    STZ.W $0F96                                                          ;819FCC;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819FCF;
    LDY.W #Tilemap_FileSelect_dataClear                                  ;819FD2;
    LDX.W #($4<<1)|($17<<6)                                              ;819FD5; $05C8
    STZ.W $0F96                                                          ;819FD8;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819FDB;

.loadTilemap:
    LDY.W #Tilemap_FileSelect_exit                                       ;819FDE;
    LDX.W #($4<<1)|($1A<<6)                                              ;819FE1; $0688
    STZ.W $0F96                                                          ;819FE4;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;819FE7;
    JSR.W QueueTransfer_MenuTilemap_ToVRAMBG1                            ;819FEA;
    LDA.W #$0001                                                         ;819FED;
    STA.W $198D                                                          ;819FF0;
    DEC A                                                                ;819FF3;
    STA.W $198F                                                          ;819FF4;
    STA.W $1991                                                          ;819FF7;
    STA.W $1993                                                          ;819FFA;
    STA.W $1995                                                          ;819FFD;
    STA.W $1997                                                          ;81A000;
    STA.W $1999                                                          ;81A003;
    STA.W $199B                                                          ;81A006;
    STA.W $199D                                                          ;81A009;
    STA.W $199F                                                          ;81A00C;
    STA.W $19A1                                                          ;81A00F;
    STA.W $19AB                                                          ;81A012;
    STA.W $19A3                                                          ;81A015;
    STA.W $19AD                                                          ;81A018;
    LDA.W #$0064                                                         ;81A01B;
    STA.W $19A5                                                          ;81A01E;
    STA.W $19A7                                                          ;81A021;
    STA.W $19A9                                                          ;81A024;
    LDA.W #$002F                                                         ;81A027;
    STA.W $19AF                                                          ;81A02A;
    LDA.W #$0057                                                         ;81A02D;
    STA.W $19B1                                                          ;81A030;
    LDA.W #$007F                                                         ;81A033;
    STA.W $19B3                                                          ;81A036;
    LDA.W #$0001                                                         ;81A039;
    STA.W $0723                                                          ;81A03C;
    STA.W $0725                                                          ;81A03F;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;81A042;
    INC.W $0727                                                          ;81A046;
    STZ.W $19B5                                                          ;81A049;
    STZ.W $19B7                                                          ;81A04C;
    STZ.W $19B9                                                          ;81A04F;
    RTS                                                                  ;81A052;


LoadFromSRAM_external:
    JSL.L LoadFromSRAM                                                   ;81A053;
    RTS                                                                  ;81A057;


FileSelectMenu_Index3_TitleSequenceToMain_FadeIn:
    JSR.W Draw_FileSelect_SamusHelmets                                   ;81A058;
    LDA.W $0952                                                          ;81A05B;
    ASL A                                                                ;81A05E;
    ASL A                                                                ;81A05F;
    TAX                                                                  ;81A060;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X        ;81A061;
    STA.W $19AB                                                          ;81A064;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X        ;81A067;
    STA.W $19A1                                                          ;81A06A;
    JSL.L Draw_Menu_Selection_Missile                                    ;81A06D;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;81A071;
    JSL.L HandleFadingIn                                                 ;81A075;
    LDA.B $51                                                            ;81A079;
    AND.W #$000F                                                         ;81A07B;
    CMP.W #$000F                                                         ;81A07E;
    BNE .return                                                          ;81A081;
    INC.W $0727                                                          ;81A083;

.return:
    RTS                                                                  ;81A086;


Draw_FileSelection_Health:
    BEQ .zero                                                            ;81A087;
    PHX                                                                  ;81A089;
    JSR.W ClearResetOfMenuTilemapRow                                     ;81A08A;
    PLA                                                                  ;81A08D;
    CLC                                                                  ;81A08E;
    ADC.W #$0040                                                         ;81A08F;
    TAX                                                                  ;81A092;
    LDY.W #Tilemap_FileSelect_noData                                     ;81A093;
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81A096;


.zero:
    STX.B $1A                                                            ;81A099;
    LDY.W #Tilemap_FileSelect_energy                                     ;81A09B;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81A09E;
    LDA.B $1A                                                            ;81A0A1;
    CLC                                                                  ;81A0A3;
    ADC.W #$0008                                                         ;81A0A4;
    TAX                                                                  ;81A0A7;
    LDA.W Equipment.currentEnergy                                        ;81A0A8;
    STA.W HW_WRDIV                                                       ;81A0AB;
    SEP #$20                                                             ;81A0AE;
    LDA.B #$64                                                           ;81A0B0;
    STA.W HW_WRDIVB                                                      ;81A0B2;
    PHA                                                                  ;81A0B5;
    PLA                                                                  ;81A0B6;
    PHA                                                                  ;81A0B7;
    PLA                                                                  ;81A0B8;
    REP #$20                                                             ;81A0B9;
    LDA.W $4214                                                          ;81A0BB;
    STA.B $14                                                            ;81A0BE;
    LDA.W HW_RDMPY                                                       ;81A0C0;
    STA.B $12                                                            ;81A0C3;
    LDA.W Equipment.maxEnergy                                            ;81A0C5;
    STA.W HW_WRDIV                                                       ;81A0C8;
    SEP #$20                                                             ;81A0CB;
    LDA.B #$64                                                           ;81A0CD;
    STA.W HW_WRDIVB                                                      ;81A0CF;
    PHA                                                                  ;81A0D2;
    PLA                                                                  ;81A0D3;
    PHA                                                                  ;81A0D4;
    PLA                                                                  ;81A0D5;
    REP #$20                                                             ;81A0D6;
    LDA.W $4214                                                          ;81A0D8;
    STA.B $16                                                            ;81A0DB;
    LDA.W #$0007                                                         ;81A0DD;
    STA.B $18                                                            ;81A0E0;
    TXA                                                                  ;81A0E2;
    CLC                                                                  ;81A0E3;
    ADC.W #$0040                                                         ;81A0E4;
    TAX                                                                  ;81A0E7;

.loop:
    DEC.B $16                                                            ;81A0E8;
    BMI .etanksDrawn                                                     ;81A0EA;
    LDY.W #$0099                                                         ;81A0EC;
    LDA.B $14                                                            ;81A0EF;
    BEQ +                                                                ;81A0F1;
    DEC.B $14                                                            ;81A0F3;
    LDY.W #$0098                                                         ;81A0F5;

  + TYA                                                                  ;81A0F8;
    ORA.W $0F96                                                          ;81A0F9;
    STA.L $7E3600,X                                                      ;81A0FC;
    INX                                                                  ;81A100;
    INX                                                                  ;81A101;
    DEC.B $18                                                            ;81A102;
    BNE .loop                                                            ;81A104;
    TXA                                                                  ;81A106;
    SEC                                                                  ;81A107;
    SBC.W #$004E                                                         ;81A108;
    TAX                                                                  ;81A10B;
    LDA.W #$0008                                                         ;81A10C;
    STA.B $18                                                            ;81A10F;
    BRA .loop                                                            ;81A111;


.etanksDrawn:
    LDX.B $1A                                                            ;81A113;
    LDA.B $12                                                            ;81A115;
    STA.W HW_WRDIV                                                       ;81A117;
    SEP #$20                                                             ;81A11A;
    LDA.B #$0A                                                           ;81A11C;
    STA.W HW_WRDIVB                                                      ;81A11E;
    PHA                                                                  ;81A121;
    PLA                                                                  ;81A122;
    PHA                                                                  ;81A123;
    PLA                                                                  ;81A124;
    REP #$20                                                             ;81A125;
    LDA.W $4214                                                          ;81A127;
    STA.B $14                                                            ;81A12A;
    LDA.W HW_RDMPY                                                       ;81A12C;
    STA.B $12                                                            ;81A12F;
    LDX.B $1A                                                            ;81A131;
    LDA.B $12                                                            ;81A133;
    CLC                                                                  ;81A135;
    ADC.W #$2060                                                         ;81A136;
    ORA.W $0F96                                                          ;81A139;
    STA.L $7E3644,X                                                      ;81A13C;
    LDA.B $14                                                            ;81A140;
    CLC                                                                  ;81A142;
    ADC.W #$2060                                                         ;81A143;
    ORA.W $0F96                                                          ;81A146;
    STA.L $7E3642,X                                                      ;81A149;
    RTS                                                                  ;81A14D;


Draw_FileSelection_Time:
    BNE .return                                                          ;81A14E;
    STX.B $1A                                                            ;81A150;
    LDA.W Equipment.igtHours                                             ;81A152;
    STA.W HW_WRDIV                                                       ;81A155;
    SEP #$20                                                             ;81A158;
    LDA.B #$0A                                                           ;81A15A;
    STA.W HW_WRDIVB                                                      ;81A15C;
    PHA                                                                  ;81A15F;
    PLA                                                                  ;81A160;
    PHA                                                                  ;81A161;
    PLA                                                                  ;81A162;
    REP #$20                                                             ;81A163;
    LDX.B $1A                                                            ;81A165;
    LDA.W HW_RDMPY                                                       ;81A167;
    CLC                                                                  ;81A16A;
    ADC.W #$2060                                                         ;81A16B;
    ORA.W $0F96                                                          ;81A16E;
    STA.L $7E3602,X                                                      ;81A171;
    LDA.W $4214                                                          ;81A175;
    CLC                                                                  ;81A178;
    ADC.W #$2060                                                         ;81A179;
    ORA.W $0F96                                                          ;81A17C;
    STA.L $7E3600,X                                                      ;81A17F;
    LDA.B $1A                                                            ;81A183;
    CLC                                                                  ;81A185;
    ADC.W #$0004                                                         ;81A186;
    TAX                                                                  ;81A189;
    LDY.W #Tilemap_FileSelect_colon                                      ;81A18A;
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates                             ;81A18D;
    LDA.W Equipment.igtMinutes                                           ;81A190;
    STA.W HW_WRDIV                                                       ;81A193;
    SEP #$20                                                             ;81A196;
    LDA.B #$0A                                                           ;81A198;
    STA.W HW_WRDIVB                                                      ;81A19A;
    PHA                                                                  ;81A19D;
    PLA                                                                  ;81A19E;
    PHA                                                                  ;81A19F;
    PLA                                                                  ;81A1A0;
    REP #$20                                                             ;81A1A1;
    LDX.B $1A                                                            ;81A1A3;
    LDA.W HW_RDMPY                                                       ;81A1A5;
    CLC                                                                  ;81A1A8;
    ADC.W #$2060                                                         ;81A1A9;
    ORA.W $0F96                                                          ;81A1AC;
    STA.L $7E3608,X                                                      ;81A1AF;
    LDA.W $4214                                                          ;81A1B3;
    CLC                                                                  ;81A1B6;
    ADC.W #$2060                                                         ;81A1B7;
    ORA.W $0F96                                                          ;81A1BA;
    STA.L $7E3606,X                                                      ;81A1BD;

.return:
    RTS                                                                  ;81A1C1;


FileSelectMenu_Index4_Main:
    REP #$30                                                             ;81A1C2;
    JSL.L Draw_Border_Around_SAMUS_DATA                                  ;81A1C4;
    JSL.L Draw_Menu_Selection_Missile                                    ;81A1C8;
    LDX.W #$0004                                                         ;81A1CC;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;81A1CF;
    LDX.W #$0006                                                         ;81A1D2;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;81A1D5;
    LDX.W #$0008                                                         ;81A1D8;
    JSR.W Draw_FileSelect_Slot_SamusHelmet                               ;81A1DB;
    LDA.B $8F                                                            ;81A1DE;
    BIT.W #$1080                                                         ;81A1E0;
    BNE .select                                                          ;81A1E3;
    BIT.W #$0800                                                         ;81A1E5;
    BNE .up                                                              ;81A1E8;
    BIT.W #$0400                                                         ;81A1EA;
    BEQ +                                                                ;81A1ED;
    JMP.W .down                                                          ;81A1EF;


  + BIT.W #$8000                                                         ;81A1F2;
    BEQ .goto_done                                                       ;81A1F5;
    LDA.W #$0037                                                         ;81A1F7;
    JSL.L QueueSound_Lib1_Max6                                           ;81A1FA;
    LDA.W #$0021                                                         ;81A1FE;
    STA.W $0727                                                          ;81A201;
    LDA.W #$0037                                                         ;81A204;
    JSL.L QueueSound_Lib1_Max6                                           ;81A207;

.goto_done:
    JMP.W .done                                                          ;81A20B;


.select:
    LDA.W $0952                                                          ;81A20E;
    CMP.W #$0003                                                         ;81A211;
    BMI +                                                                ;81A214;
    JMP.W .fileOperation                                                 ;81A216;


  + LDA.W #$002A                                                         ;81A219;
    JSL.L QueueSound_Lib1_Max6                                           ;81A21C;
    LDA.W $0727                                                          ;81A220;
    CLC                                                                  ;81A223;
    ADC.W #$001B                                                         ;81A224;
    STA.W $0727                                                          ;81A227;
    LDA.W $0952                                                          ;81A22A;
    CLC                                                                  ;81A22D;
    ADC.W #$0002                                                         ;81A22E;
    ASL A                                                                ;81A231;
    TAX                                                                  ;81A232;
    LDA.W #$0001                                                         ;81A233;
    STA.W $198D,X                                                        ;81A236;
    LDA.W $0952                                                          ;81A239;
    STA.L $701FEC                                                        ;81A23C;
    EOR.W #$FFFF                                                         ;81A240;
    STA.L $701FEE                                                        ;81A243;
    LDA.W $0952                                                          ;81A247;
    JSL.L LoadFromSRAM                                                   ;81A24A;
    BCS +                                                                ;81A24E;
    JSL.L LoadMirrorOfCurrentAreasMapExplored                            ;81A250;
    BRA .done                                                            ;81A254;


  + JSR.W NewSaveFile                                                    ;81A256;
    STZ.W $0789                                                          ;81A259;
    BRA .done                                                            ;81A25C;


.up:
    LDA.W $0954                                                          ;81A25E;
    BEQ +                                                                ;81A261;
    LDA.W $0952                                                          ;81A263;
    DEC A                                                                ;81A266;
    BPL .storeSelection                                                  ;81A267;
    LDA.W #$0005                                                         ;81A269;
    BRA .storeSelection                                                  ;81A26C;


  + LDA.W $0952                                                          ;81A26E;
    DEC A                                                                ;81A271;
    BPL +                                                                ;81A272;
    LDA.W #$0005                                                         ;81A274;
    BRA .storeSelection                                                  ;81A277;


  + CMP.W #$0004                                                         ;81A279;
    BMI .storeSelection                                                  ;81A27C;
    LDA.W #$0002                                                         ;81A27E;

.storeSelection:
    STA.W $0952                                                          ;81A281;
    BRA .cursorSound                                                     ;81A284;


.down:
    LDA.W $0954                                                          ;81A286;
    BEQ +                                                                ;81A289;
    LDA.W $0952                                                          ;81A28B;
    INC A                                                                ;81A28E;
    CMP.W #$0006                                                         ;81A28F;
    BMI .storeSelection2                                                 ;81A292;
    LDA.W #$0000                                                         ;81A294;
    BRA .storeSelection2                                                 ;81A297;


  + LDA.W $0952                                                          ;81A299;
    INC A                                                                ;81A29C;
    CMP.W #$0003                                                         ;81A29D;
    BMI .storeSelection2                                                 ;81A2A0;
    CMP.W #$0006                                                         ;81A2A2;
    BPL .zero                                                            ;81A2A5;
    LDA.W #$0005                                                         ;81A2A7;
    BRA .storeSelection2                                                 ;81A2AA;


.zero:
    LDA.W #$0000                                                         ;81A2AC;

.storeSelection2:
    STA.W $0952                                                          ;81A2AF;

.cursorSound:
    LDA.W #$0037                                                         ;81A2B2;
    JSL.L QueueSound_Lib1_Max6                                           ;81A2B5;

.done:
    LDA.W $0952                                                          ;81A2B9;
    ASL A                                                                ;81A2BC;
    ASL A                                                                ;81A2BD;
    TAX                                                                  ;81A2BE;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X        ;81A2BF;
    STA.W $19AB                                                          ;81A2C2;
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X        ;81A2C5;
    STA.W $19A1                                                          ;81A2C8;
    RTS                                                                  ;81A2CB;


.fileOperation:
    CMP.W #$0003                                                         ;81A2CC;
    BNE +                                                                ;81A2CF;
    LDA.W #$0037                                                         ;81A2D1;
    JSL.L QueueSound_Lib1_Max6                                           ;81A2D4;
    INC.W $0727                                                          ;81A2D8;
    LDA.B $57                                                            ;81A2DB;
    AND.W #$FF0F                                                         ;81A2DD;
    ORA.W #$0003                                                         ;81A2E0;
    STA.B $57                                                            ;81A2E3;
    RTS                                                                  ;81A2E5;


  + CMP.W #$0004                                                         ;81A2E6;
    BNE .checkFive                                                       ;81A2E9;
    LDA.W #$0037                                                         ;81A2EB;
    JSL.L QueueSound_Lib1_Max6                                           ;81A2EE;
    LDA.W $0727                                                          ;81A2F2;
    CLC                                                                  ;81A2F5;
    ADC.W #$000F                                                         ;81A2F6;
    STA.W $0727                                                          ;81A2F9;
    LDA.B $57                                                            ;81A2FC;
    AND.W #$FF0F                                                         ;81A2FE;
    ORA.W #$0003                                                         ;81A301;
    STA.B $57                                                            ;81A304;

.checkFive:
    CMP.W #$0005                                                         ;81A306;
    BNE .return                                                          ;81A309;
    LDA.W #$0021                                                         ;81A30B;
    STA.W $0727                                                          ;81A30E;

.return:
    RTS                                                                  ;81A311;


FileSelectMenu_SelectionMissile_Coordinates:
  .Yposition
    dw $0030                                                             ;81A312;
  .Xposition:
    dw       $000E ; Slot A
    dw $0058,$000E ; Slot B
    dw $0080,$000E ; Slot C
    dw $00A3,$000E ; File copy
    dw $00BB,$000E ; File clear
    dw $00D3,$000E ; Exit
