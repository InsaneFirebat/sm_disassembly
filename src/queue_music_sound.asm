CheckIfMusicIsQueued:
    PHP                                                                  ;808EF4;
    REP #$30                                                             ;808EF5;
    PHX                                                                  ;808EF7;
    LDX.W #$000E                                                         ;808EF8;

.loop:
    LDA.W $0629,X                                                        ;808EFB;
    BNE .nonZeroTimer                                                    ;808EFE;
    DEX                                                                  ;808F00;
    DEX                                                                  ;808F01;
    BPL .loop                                                            ;808F02;
    PLX                                                                  ;808F04;
    PLP                                                                  ;808F05;
    CLC                                                                  ;808F06;
    RTL                                                                  ;808F07;


.nonZeroTimer:
    PLX                                                                  ;808F08;
    PLP                                                                  ;808F09;
    SEC                                                                  ;808F0A;
    RTL                                                                  ;808F0B;


HandleMusicQueue:
    PHP                                                                  ;808F0C;
    REP #$20                                                             ;808F0D;
    DEC.W $063F                                                          ;808F0F;
    BMI .negative                                                        ;808F12;
    BEQ .positive                                                        ;808F14;
    PLP                                                                  ;808F16;
    RTL                                                                  ;808F17;


.positive:
    LDA.W $063D                                                          ;808F18;
    BMI .musicData                                                       ;808F1B;
    SEP #$20                                                             ;808F1D;
    AND.B #$7F                                                           ;808F1F;
    STA.W $07F5                                                          ;808F21;
    STZ.W $07F6                                                          ;808F24;
    STA.W $2140                                                          ;808F27;
    STA.W $064C                                                          ;808F2A;
    REP #$20                                                             ;808F2D;
    LDA.W #$0008                                                         ;808F2F;
    STA.W $0686                                                          ;808F32;
    LDX.W $063B                                                          ;808F35;
    STZ.W $0619,X                                                        ;808F38;
    STZ.W $0629,X                                                        ;808F3B;
    INX                                                                  ;808F3E;
    INX                                                                  ;808F3F;
    TXA                                                                  ;808F40;
    AND.W #$000E                                                         ;808F41;
    STA.W $063B                                                          ;808F44;

.negative:
    LDX.W $063B                                                          ;808F47;
    CPX.W $0639                                                          ;808F4A;
    BEQ .clearTimer                                                      ;808F4D;
    LDA.W $0619,X                                                        ;808F4F;
    STA.W $063D                                                          ;808F52;
    LDA.W $0629,X                                                        ;808F55;
    STA.W $063F                                                          ;808F58;
    PLP                                                                  ;808F5B;
    RTL                                                                  ;808F5C;


.clearTimer:
    STZ.W $063F                                                          ;808F5D;
    PLP                                                                  ;808F60;
    RTL                                                                  ;808F61;


.musicData:
    AND.W #$00FF                                                         ;808F62;
    STA.W $07F3                                                          ;808F65;
    TAX                                                                  ;808F68;
    SEP #$20                                                             ;808F69;
    LDA.B #$FF                                                           ;808F6B;
    STA.W $064C                                                          ;808F6D;
    REP #$20                                                             ;808F70;
    LDA.L Music_Pointers,X                                               ;808F72;
    STA.B $00                                                            ;808F76;
    LDA.L Music_Pointers+1,X                                             ;808F78;
    STA.B $01                                                            ;808F7C;
    JSL.L UploadToAPU_long                                               ;808F7E;
    SEP #$20                                                             ;808F82;
    STZ.W $064C                                                          ;808F84;
    REP #$20                                                             ;808F87;
    LDX.W $063B                                                          ;808F89;
    STZ.W $0619,X                                                        ;808F8C;
    STZ.W $0629,X                                                        ;808F8F;
    INX                                                                  ;808F92;
    INX                                                                  ;808F93;
    TXA                                                                  ;808F94;
    AND.W #$000E                                                         ;808F95;
    STA.W $063B                                                          ;808F98;
    LDA.W #$0008                                                         ;808F9B;
    STA.W $0686                                                          ;808F9E;
    PLP                                                                  ;808FA1;
    RTL                                                                  ;808FA2;


UNUSED_QueueMusicDataOrTrack_808FA3:
    PHP                                                                  ;808FA3;
    REP #$30                                                             ;808FA4;
    PHX                                                                  ;808FA6;
    PHY                                                                  ;808FA7;
    LDX.W $0639                                                          ;808FA8;
    STA.W $0619,X                                                        ;808FAB;
    LDA.W #$0010                                                         ;808FAE;
    STA.W $0629,X                                                        ;808FB1;
    INX                                                                  ;808FB4;
    INX                                                                  ;808FB5;
    TXA                                                                  ;808FB6;
    AND.W #$000E                                                         ;808FB7;
    STA.W $0639                                                          ;808FBA;
    PLY                                                                  ;808FBD;
    PLX                                                                  ;808FBE;
    PLP                                                                  ;808FBF;
    RTL                                                                  ;808FC0;


QueueMusicDataOrTrack_8FrameDelay:
    PHP                                                                  ;808FC1;
    REP #$30                                                             ;808FC2;
    PHX                                                                  ;808FC4;
    PHY                                                                  ;808FC5;
    LDX.W $0998                                                          ;808FC6;
    CPX.W #$0028                                                         ;808FC9;
    BCS .return                                                          ;808FCC;
    PHA                                                                  ;808FCE;
    LDA.W $0639                                                          ;808FCF;
    INC A                                                                ;808FD2;
    INC A                                                                ;808FD3;
    AND.W #$000E                                                         ;808FD4;
    TAX                                                                  ;808FD7;
    PLA                                                                  ;808FD8;
    CPX.W $063B                                                          ;808FD9;
    BEQ .return                                                          ;808FDC;
    LDX.W $0639                                                          ;808FDE;
    STA.W $0619,X                                                        ;808FE1;
    LDA.W #$0008                                                         ;808FE4;
    STA.W $0629,X                                                        ;808FE7;
    INX                                                                  ;808FEA;
    INX                                                                  ;808FEB;
    TXA                                                                  ;808FEC;
    AND.W #$000E                                                         ;808FED;
    STA.W $0639                                                          ;808FF0;

.return:
    PLY                                                                  ;808FF3;
    PLX                                                                  ;808FF4;
    PLP                                                                  ;808FF5;
    RTL                                                                  ;808FF6;


QueueMusicDataOrTrack_YFrameDelay:
    PHP                                                                  ;808FF7;
    REP #$30                                                             ;808FF8;
    PHX                                                                  ;808FFA;
    LDX.W $0998                                                          ;808FFB;
    CPX.W #$0028                                                         ;808FFE;
    BCS .return                                                          ;809001;
    LDX.W $0639                                                          ;809003;
    STA.W $0619,X                                                        ;809006;
    TYA                                                                  ;809009;
    CMP.W #$0008                                                         ;80900A;
    BCS .setTimer                                                        ;80900D;
    LDA.W #$0008                                                         ;80900F;

.setTimer:
    STA.W $0629,X                                                        ;809012;
    INX                                                                  ;809015;
    INX                                                                  ;809016;
    TXA                                                                  ;809017;
    AND.W #$000E                                                         ;809018;
    STA.W $0639                                                          ;80901B;

.return:
    PLX                                                                  ;80901E;
    PLP                                                                  ;80901F;
    RTL                                                                  ;809020;


QueueSound:
    PHX                                                                  ;809021;
    PHY                                                                  ;809022;
    PHP                                                                  ;809023;
    SEP #$30                                                             ;809024;
    XBA                                                                  ;809026;
    LDA.B #$0F                                                           ;809027;
    BRA QueueSound_Lib1                                                  ;809029;


QueueSound_Lib1_Max9:
    PHX                                                                  ;80902B;
    PHY                                                                  ;80902C;
    PHP                                                                  ;80902D;
    SEP #$30                                                             ;80902E;
    XBA                                                                  ;809030;
    LDA.B #$09                                                           ;809031;
    BRA QueueSound_Lib1                                                  ;809033;


QueueSound_Lib1_Max3:
    PHX                                                                  ;809035;
    PHY                                                                  ;809036;
    PHP                                                                  ;809037;
    SEP #$30                                                             ;809038;
    XBA                                                                  ;80903A;
    LDA.B #$03                                                           ;80903B;
    BRA QueueSound_Lib1                                                  ;80903D;


QueueSound_Lib1_Max1:
    PHX                                                                  ;80903F;
    PHY                                                                  ;809040;
    PHP                                                                  ;809041;
    SEP #$30                                                             ;809042;
    XBA                                                                  ;809044;
    LDA.B #$01                                                           ;809045;
    BRA QueueSound_Lib1                                                  ;809047;


QueueSound_Lib1_Max6:
    PHX                                                                  ;809049;
    PHY                                                                  ;80904A;
    PHP                                                                  ;80904B;
    SEP #$30                                                             ;80904C;
    XBA                                                                  ;80904E;
    LDA.B #$06                                                           ;80904F;

QueueSound_Lib1:
    STA.W $0653                                                          ;809051;
    LDA.W $0646                                                          ;809054;
    SEC                                                                  ;809057;
    SBC.W $0643                                                          ;809058;
    AND.B #$0F                                                           ;80905B;
    CMP.W $0653                                                          ;80905D;
    BCS .return                                                          ;809060;
    XBA                                                                  ;809062;
    REP #$30                                                             ;809063;
    LDX.W $05F5                                                          ;809065;
    BNE .return                                                          ;809068;
    LDX.W $0998                                                          ;80906A;
    CPX.W #$0028                                                         ;80906D;
    BCS .return                                                          ;809070;
    LDX.W $0592                                                          ;809072;
    BMI .return                                                          ;809075;
    SEP #$30                                                             ;809077;
    LDY.W $0646                                                          ;809079;
    TYX                                                                  ;80907C;
    INX                                                                  ;80907D;
    CPX.B #$10                                                           ;80907E;
    BCC .queueSound                                                      ;809080;
    LDX.B #$00                                                           ;809082;

.queueSound:
    CPX.W $0643                                                          ;809084;
    BEQ .queueFull                                                       ;809087;
    STA.W $0656,Y                                                        ;809089;
    STX.W $0646                                                          ;80908C;
    STZ.W $0656,X                                                        ;80908F;

.return:
    PLP                                                                  ;809092;
    PLY                                                                  ;809093;
    PLX                                                                  ;809094;
    RTL                                                                  ;809095;


.queueFull:
    JSR.W NOPRTS_8091A7                                                  ;809096;
    CMP.W $0656,Y                                                        ;809099;
    BCS .return                                                          ;80909C;
    STA.W $0656,Y                                                        ;80909E;
    BRA .return                                                          ;8090A1;


QueueSound_Lib2_Max15:
    PHX                                                                  ;8090A3;
    PHY                                                                  ;8090A4;
    PHP                                                                  ;8090A5;
    SEP #$30                                                             ;8090A6;
    XBA                                                                  ;8090A8;
    LDA.B #$0F                                                           ;8090A9;
    BRA QueueSound_Lib2                                                  ;8090AB;


QueueSound_Lib2_Max9:
    PHX                                                                  ;8090AD;
    PHY                                                                  ;8090AE;
    PHP                                                                  ;8090AF;
    SEP #$30                                                             ;8090B0;
    XBA                                                                  ;8090B2;
    LDA.B #$09                                                           ;8090B3;
    BRA QueueSound_Lib2                                                  ;8090B5;


QueueSound_Lib2_Max3:
    PHX                                                                  ;8090B7;
    PHY                                                                  ;8090B8;
    PHP                                                                  ;8090B9;
    SEP #$30                                                             ;8090BA;
    XBA                                                                  ;8090BC;
    LDA.B #$03                                                           ;8090BD;
    BRA QueueSound_Lib2                                                  ;8090BF;


QueueSound_Lib2_Max1:
    PHX                                                                  ;8090C1;
    PHY                                                                  ;8090C2;
    PHP                                                                  ;8090C3;
    SEP #$30                                                             ;8090C4;
    XBA                                                                  ;8090C6;
    LDA.B #$01                                                           ;8090C7;
    BRA QueueSound_Lib2                                                  ;8090C9;


QueueSound_Lib2_Max6:
    PHX                                                                  ;8090CB;
    PHY                                                                  ;8090CC;
    PHP                                                                  ;8090CD;
    SEP #$30                                                             ;8090CE;
    XBA                                                                  ;8090D0;
    LDA.B #$06                                                           ;8090D1;

QueueSound_Lib2:
    STA.W $0654                                                          ;8090D3;
    LDA.W $0647                                                          ;8090D6;
    SEC                                                                  ;8090D9;
    SBC.W $0644                                                          ;8090DA;
    AND.B #$0F                                                           ;8090DD;
    CMP.W $0654                                                          ;8090DF;
    BCS .return                                                          ;8090E2;
    XBA                                                                  ;8090E4;
    REP #$30                                                             ;8090E5;
    LDX.W $05F5                                                          ;8090E7;
    BNE .return                                                          ;8090EA;
    LDX.W $0998                                                          ;8090EC;
    CPX.W #$0028                                                         ;8090EF;
    BCS .return                                                          ;8090F2;
    LDX.W $0592                                                          ;8090F4;
    BMI .return                                                          ;8090F7;
    SEP #$30                                                             ;8090F9;
    LDY.W $0647                                                          ;8090FB;
    TYX                                                                  ;8090FE;
    INX                                                                  ;8090FF;
    CPX.B #$10                                                           ;809100;
    BCC .queueSound                                                      ;809102;
    LDX.B #$00                                                           ;809104;

.queueSound:
    CPX.W $0644                                                          ;809106;
    BEQ .queueFull                                                       ;809109;
    STA.W $0666,Y                                                        ;80910B;
    STX.W $0647                                                          ;80910E;
    STZ.W $0666,X                                                        ;809111;

.return:
    PLP                                                                  ;809114;
    PLY                                                                  ;809115;
    PLX                                                                  ;809116;
    RTL                                                                  ;809117;


.queueFull:
    JSR.W NOPRTS_8091A7                                                  ;809118;
    CMP.W $0666,Y                                                        ;80911B;
    BCS .return                                                          ;80911E;
    STA.W $0666,Y                                                        ;809120;
    BRA .return                                                          ;809123;


QueueSound_Lib3_Max15:
    PHX                                                                  ;809125;
    PHY                                                                  ;809126;
    PHP                                                                  ;809127;
    SEP #$30                                                             ;809128;
    XBA                                                                  ;80912A;
    LDA.B #$0F                                                           ;80912B;
    BRA QueueSound_Lib3                                                  ;80912D;


QueueSound_Lib3_Max9:
    PHX                                                                  ;80912F;
    PHY                                                                  ;809130;
    PHP                                                                  ;809131;
    SEP #$30                                                             ;809132;
    XBA                                                                  ;809134;
    LDA.B #$09                                                           ;809135;
    BRA QueueSound_Lib3                                                  ;809137;


QueueSound_Lib3_Max3:
    PHX                                                                  ;809139;
    PHY                                                                  ;80913A;
    PHP                                                                  ;80913B;
    SEP #$30                                                             ;80913C;
    XBA                                                                  ;80913E;
    LDA.B #$03                                                           ;80913F;
    BRA QueueSound_Lib3                                                  ;809141;


QueueSound_Lib3_Max1:
    PHX                                                                  ;809143;
    PHY                                                                  ;809144;
    PHP                                                                  ;809145;
    SEP #$30                                                             ;809146;
    XBA                                                                  ;809148;
    LDA.B #$01                                                           ;809149;
    BRA QueueSound_Lib3                                                  ;80914B;


QueueSound_Lib3_Max6:
    PHX                                                                  ;80914D;
    PHY                                                                  ;80914E;
    PHP                                                                  ;80914F;
    SEP #$30                                                             ;809150;
    XBA                                                                  ;809152;
    LDA.B #$06                                                           ;809153;

QueueSound_Lib3:
    STA.W $0655                                                          ;809155;
    LDA.W $0648                                                          ;809158;
    SEC                                                                  ;80915B;
    SBC.W $0645                                                          ;80915C;
    AND.B #$0F                                                           ;80915F;
    CMP.W $0655                                                          ;809161;
    BCS .return                                                          ;809164;
    XBA                                                                  ;809166;
    REP #$30                                                             ;809167;
    LDX.W $05F5                                                          ;809169;
    BNE .return                                                          ;80916C;
    LDX.W $0998                                                          ;80916E;
    CPX.W #$0028                                                         ;809171;
    BCS .return                                                          ;809174;
    LDX.W $0592                                                          ;809176;
    BMI .return                                                          ;809179;
    SEP #$30                                                             ;80917B;
    LDY.W $0648                                                          ;80917D;
    TYX                                                                  ;809180;
    INX                                                                  ;809181;
    CPX.B #$10                                                           ;809182;
    BCC .queueSound                                                      ;809184;
    LDX.B #$00                                                           ;809186;

.queueSound:
    CPX.W $0645                                                          ;809188;
    BEQ .queueFull                                                       ;80918B;
    STA.W $0676,Y                                                        ;80918D;
    STX.W $0648                                                          ;809190;
    STZ.W $0676,X                                                        ;809193;

.return:
    PLP                                                                  ;809196;
    PLY                                                                  ;809197;
    PLX                                                                  ;809198;
    RTL                                                                  ;809199;


.queueFull:
    JSR.W NOPRTS_8091A7                                                  ;80919A;
    CMP.W $0676,Y                                                        ;80919D;
    BCS .return                                                          ;8091A0;
    STA.W $0676,Y                                                        ;8091A2;
    BRA .return                                                          ;8091A5;


NOPRTS_8091A7:
    NOP                                                                  ;8091A7;
    RTS                                                                  ;8091A8;
