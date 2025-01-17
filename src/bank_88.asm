
org $888000


LayerBlending_Handler:
    PHP                                                                  ;888000;
    SEP #$30                                                             ;888001;
    LDY.B #$00                                                           ;888003;
    LDX.W $1986                                                          ;888005;
    BEQ .powerBomb                                                       ;888008;
    JSR.W Initialize_LayerBlending                                       ;88800A;
    JSR.W (.pointers,X)                                                  ;88800D;

.powerBomb:
    BIT.W $1987                                                          ;888010;
    BPL .xrayShowBlocks                                                  ;888013;
    JSR.W Handle_LayerBlending_PowerBomb                                 ;888015;
    BRA .return                                                          ;888018;


.xrayShowBlocks:
    BIT.W $1987                                                          ;88801A;
    BVC .xrayHideBlocks                                                  ;88801D;
    JSR.W Handle_LayerBlending_Xray_CanShowBlocks                        ;88801F;
    BRA .return                                                          ;888022;


.xrayHideBlocks:
    LDA.W $1987                                                          ;888024;
    BIT.B #$20                                                           ;888027;
    BEQ .xrayFirefleaRoom                                                ;888029;
    JSR.W Handle_LayerBlending_Xray_CantShowBlocks                       ;88802B;
    BRA .return                                                          ;88802E;


.xrayFirefleaRoom:
    LDA.W $1987                                                          ;888030;
    BIT.B #$10                                                           ;888033;
    BEQ .return                                                          ;888035;
    JSR.W Handle_LayerBlending_Xray_FirefleaRoom                         ;888037;
    BRA .return                                                          ;88803A; >_<


.return:
    PLP                                                                  ;88803C;
    RTS                                                                  ;88803D;


.pointers:
    dw RTS_888074                                                        ;88803E;
    dw RTS_888074                                                        ;888040;
    dw LayerBlending_4_Phantoon                                          ;888042;
    dw UNUSED_LayerBlending_6_888099                                     ;888044;
    dw LayerBlending_8_WreckedShipPowerOff                               ;888046;
    dw LayerBlending_A_Spores                                            ;888048;
    dw LayerBlending_C_Fireflea                                          ;88804A;
    dw RTS_8880B7                                                        ;88804C;
    dw LayerBlending_10_12_MorphBallEye_SuitPickup                       ;88804E;
    dw LayerBlending_10_12_MorphBallEye_SuitPickup                       ;888050;
    dw LayerBlending_14_22_Water                                         ;888052;
    dw LayerBlending_16_Water                                            ;888054;
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog                         ;888056;
    dw LayerBlending_1A_Phantoon                                         ;888058;
    dw LayerBlending_1C                                                  ;88805A;
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog                         ;88805C;
    dw RTS_88810C                                                        ;88805E;
    dw LayerBlending_14_22_Water                                         ;888060;
    dw LayerBlending_24_MotherBrain                                      ;888062;
    dw LayerBlending_26                                                  ;888064;
    dw LayerBlending_28                                                  ;888066;
    dw LayerBlending_2A                                                  ;888068;
    dw LayerBlending_2C                                                  ;88806A;
    dw LayerBlending_2E                                                  ;88806C;
    dw LayerBlending_18_1E_30_Water_LavaAcid_Fog                         ;88806E;
    dw LayerBlending_32                                                  ;888070;
    dw LayerBlending_34                                                  ;888072;

RTS_888074:
    RTS                                                                  ;888074;


Initialize_LayerBlending:
    STZ.B $60                                                            ;888075;
    STZ.B $61                                                            ;888077;
    STZ.B $62                                                            ;888079;
    LDA.B #$13                                                           ;88807B;
    STA.B $69                                                            ;88807D;
    LDA.B #$04                                                           ;88807F;
    STA.B $6B                                                            ;888081;
    STZ.B $6C                                                            ;888083;
    STZ.B $6D                                                            ;888085;
    LDA.B #$02                                                           ;888087;
    STA.B $6E                                                            ;888089;
    LDA.B #$33                                                           ;88808B;
    STA.B $71                                                            ;88808D;
    RTS                                                                  ;88808F;


LayerBlending_4_Phantoon:
    LDA.B #$11                                                           ;888090;
    STA.B $69                                                            ;888092;
    LDA.B #$04                                                           ;888094;
    STA.B $6B                                                            ;888096;
    RTS                                                                  ;888098;


UNUSED_LayerBlending_6_888099:
    LDA.B #$14                                                           ;888099;
    STA.B $6B                                                            ;88809B;
    LDA.B #$27                                                           ;88809D;
    STA.B $71                                                            ;88809F;
    RTS                                                                  ;8880A1;


LayerBlending_8_WreckedShipPowerOff:
    LDA.B #$14                                                           ;8880A2;
    STA.B $6B                                                            ;8880A4;
    LDA.B #$22                                                           ;8880A6;
    STA.B $71                                                            ;8880A8;
    RTS                                                                  ;8880AA;


LayerBlending_A_Spores:
    LDA.B #$32                                                           ;8880AB;
    STA.B $71                                                            ;8880AD;
    RTS                                                                  ;8880AF;


LayerBlending_C_Fireflea:
    STZ.B $6E                                                            ;8880B0;
    LDA.B #$A2                                                           ;8880B2;
    STA.B $71                                                            ;8880B4;
    RTS                                                                  ;8880B6;


RTS_8880B7:
    RTS                                                                  ;8880B7;


LayerBlending_10_12_MorphBallEye_SuitPickup:
    LDA.B #$02                                                           ;8880B8;
    STA.B $61                                                            ;8880BA;
    LDA.B #$20                                                           ;8880BC;
    STA.B $62                                                            ;8880BE;
    LDA.B #$04                                                           ;8880C0;
    STA.B $6D                                                            ;8880C2;
    RTS                                                                  ;8880C4;


LayerBlending_14_22_Water:
    LDA.B #$B3                                                           ;8880C5;
    STA.B $71                                                            ;8880C7;
    RTS                                                                  ;8880C9;


LayerBlending_16_Water:
    LDY.B #$04                                                           ;8880CA;
    LDA.B #$11                                                           ;8880CC;
    STA.B $69                                                            ;8880CE;
    LDA.B #$06                                                           ;8880D0;
    STA.B $6B                                                            ;8880D2;
    LDA.B #$B1                                                           ;8880D4;
    STA.B $71                                                            ;8880D6;
    RTS                                                                  ;8880D8;


LayerBlending_1A_Phantoon:
    LDY.B #$04                                                           ;8880D9;
    LDA.B #$15                                                           ;8880DB;
    STA.B $69                                                            ;8880DD;
    LDA.B #$02                                                           ;8880DF;
    STA.B $6B                                                            ;8880E1;
    LDA.B #$35                                                           ;8880E3;
    STA.B $71                                                            ;8880E5;
    RTS                                                                  ;8880E7;


LayerBlending_1C:
    LDA.B #$15                                                           ;8880E8;
    STA.B $69                                                            ;8880EA;
    LDA.B #$02                                                           ;8880EC;
    STA.B $6B                                                            ;8880EE;
    LDA.B #$55                                                           ;8880F0;
    STA.B $71                                                            ;8880F2;
    RTS                                                                  ;8880F4;


LayerBlending_18_1E_30_Water_LavaAcid_Fog:
    LDY.B #$02                                                           ;8880F5;
    LDA.B $84                                                            ;8880F7;
    AND.B #$30                                                           ;8880F9;
    EOR.B #$30                                                           ;8880FB;
    BNE .return                                                          ;8880FD;
    LDA.B #$24                                                           ;8880FF;
    STA.B $71                                                            ;888101;
    LDA.B #$13                                                           ;888103;
    STA.B $6B                                                            ;888105;
    LDA.B #$04                                                           ;888107;
    STA.B $69                                                            ;888109;

.return:
    RTS                                                                  ;88810B;


RTS_88810C:
    RTS                                                                  ;88810C;


LayerBlending_26:
    LDA.B #$77                                                           ;88810D;
    STA.B $71                                                            ;88810F;
    RTS                                                                  ;888111;


LayerBlending_28:
    STZ.B $6E                                                            ;888112;
    LDA.B #$B3                                                           ;888114;
    STA.B $71                                                            ;888116;
    BIT.W $1987                                                          ;888118;
    BMI .return                                                          ;88811B;
    LDA.B #$25                                                           ;88811D;
    STA.B $74                                                            ;88811F;
    LDA.B #$40                                                           ;888121;
    STA.B $75                                                            ;888123;
    LDA.B #$80                                                           ;888125;
    STA.B $76                                                            ;888127;

.return:
    RTS                                                                  ;888129;


LayerBlending_2A:
    STZ.B $6E                                                            ;88812A;
    LDA.B #$B3                                                           ;88812C;
    STA.B $71                                                            ;88812E;
    BIT.W $1987                                                          ;888130;
    BMI .return                                                          ;888133;
    LDA.B #$26                                                           ;888135;
    STA.B $74                                                            ;888137;
    LDA.B #$42                                                           ;888139;
    STA.B $75                                                            ;88813B;
    LDA.B #$80                                                           ;88813D;
    STA.B $76                                                            ;88813F;

.return:
    RTS                                                                  ;888141;


LayerBlending_2C:
    STZ.B $6E                                                            ;888142;
    RTS                                                                  ;888144;


LayerBlending_2E:
    LDA.B #$B3                                                           ;888145;
    STA.B $71                                                            ;888147;
    RTS                                                                  ;888149;


LayerBlending_32:
    LDA.B #$44                                                           ;88814A;
    STA.B $6B                                                            ;88814C;
    LDA.B #$B2                                                           ;88814E;
    STA.B $71                                                            ;888150;
    RTS                                                                  ;888152;


LayerBlending_34:
    LDY.B #$06                                                           ;888153;
    RTS                                                                  ;888155;


LayerBlending_24_MotherBrain:
    LDA.B #$00                                                           ;888156;
    STA.B $60                                                            ;888158;
    LDA.B #$02                                                           ;88815A;
    STA.B $61                                                            ;88815C;
    LDA.B #$20                                                           ;88815E;
    STA.B $62                                                            ;888160;
    LDA.B #$13                                                           ;888162;
    STA.B $69                                                            ;888164;
    LDA.B #$04                                                           ;888166;
    STA.B $6B                                                            ;888168;
    LDA.B #$13                                                           ;88816A;
    STA.B $6C                                                            ;88816C;
    LDA.B #$04                                                           ;88816E;
    STA.B $6D                                                            ;888170;
    LDA.B #$10                                                           ;888172;
    STA.B $6E                                                            ;888174;
    LDA.B #$33                                                           ;888176;
    STA.B $71                                                            ;888178;
    RTS                                                                  ;88817A;


Handle_LayerBlending_Xray_CanShowBlocks:
    LDA.B #$C8                                                           ;88817B;
    STA.B $60                                                            ;88817D;
    LDA.B #$08                                                           ;88817F;
    STA.B $61                                                            ;888181;
    LDA.B #$80                                                           ;888183;
    STA.B $62                                                            ;888185;
    LDA.B #$13                                                           ;888187;
    STA.B $69                                                            ;888189;
    LDA.B #$04                                                           ;88818B;
    STA.B $6B                                                            ;88818D;
    LDA.B #$03                                                           ;88818F;
    STA.B $6C                                                            ;888191;
    LDA.B #$04                                                           ;888193;
    STA.B $6D                                                            ;888195;
    LDA.B #$22                                                           ;888197;
    STA.B $6E                                                            ;888199;
    LDA.B $71                                                            ;88819B;
    AND.B #$80                                                           ;88819D;
    ORA.B #$73                                                           ;88819F;
    STA.B $71                                                            ;8881A1;
    RTS                                                                  ;8881A3;


Handle_LayerBlending_Xray_CantShowBlocks:
    STZ.B $60                                                            ;8881A4;
    LDA.B #$08                                                           ;8881A6;
    STA.B $61                                                            ;8881A8;
    LDA.B #$80                                                           ;8881AA;
    STA.B $62                                                            ;8881AC;
    LDA.B #$13                                                           ;8881AE;
    STA.B $69                                                            ;8881B0;
    LDA.B #$04                                                           ;8881B2;
    STA.B $6B                                                            ;8881B4;
    LDA.B #$03                                                           ;8881B6;
    STA.B $6C                                                            ;8881B8;
    LDA.B #$04                                                           ;8881BA;
    STA.B $6D                                                            ;8881BC;
    LDA.B #$22                                                           ;8881BE;
    STA.B $6E                                                            ;8881C0;
    LDA.B $71                                                            ;8881C2;
    AND.B #$80                                                           ;8881C4;
    ORA.B #$61                                                           ;8881C6;
    STA.B $71                                                            ;8881C8;
    REP #$20                                                             ;8881CA;
    LDA.W $079B                                                          ;8881CC;
    CMP.W #RoomHeader_GlassTunnel                                        ;8881CF;
    SEP #$20                                                             ;8881D2;
    BNE .return                                                          ;8881D4;
    LDA.B #$11                                                           ;8881D6;
    STA.B $69                                                            ;8881D8;

.return:
    RTS                                                                  ;8881DA;


Handle_LayerBlending_Xray_FirefleaRoom:
    STZ.B $60                                                            ;8881DB;
    LDA.B #$08                                                           ;8881DD;
    STA.B $61                                                            ;8881DF;
    LDA.B #$80                                                           ;8881E1;
    STA.B $62                                                            ;8881E3;
    LDA.B #$13                                                           ;8881E5;
    STA.B $69                                                            ;8881E7;
    LDA.B #$04                                                           ;8881E9;
    STZ.B $6B                                                            ;8881EB;
    LDA.B #$03                                                           ;8881ED;
    STA.B $6C                                                            ;8881EF;
    LDA.B #$04                                                           ;8881F1;
    STA.B $6D                                                            ;8881F3;
    LDA.B #$20                                                           ;8881F5;
    STA.B $6E                                                            ;8881F7;
    LDA.B #$B3                                                           ;8881F9;
    STA.B $71                                                            ;8881FB;
    RTS                                                                  ;8881FD;


Handle_LayerBlending_PowerBomb:
    REP #$30                                                             ;8881FE;
    LDA.W $079B                                                          ;888200;
    CMP.W #RoomHeader_Statues                                            ;888203;
    SEP #$30                                                             ;888206;
    BNE +                                                                ;888208;
    LDY.B #$06                                                           ;88820A;

  + TYX                                                                  ;88820C;
    JSR.W (.pointers,X)                                                  ;88820D;
    RTS                                                                  ;888210;


.pointers:
    dw Handle_LayerBlending_PowerBomb_0_2                                ;888211;
    dw Handle_LayerBlending_PowerBomb_0_2                                ;888213;
    dw Handle_LayerBlending_PowerBomb_4                                  ;888215;
    dw Handle_LayerBlending_PowerBomb_6                                  ;888217;

Handle_LayerBlending_PowerBomb_0_2:
    LDA.B #$00                                                           ;888219;
    STA.B $60                                                            ;88821B;
    LDA.B #$08                                                           ;88821D;
    STA.B $61                                                            ;88821F;
    LDA.B #$80                                                           ;888221;
    STA.B $62                                                            ;888223;
    LDA.B #$02                                                           ;888225;
    STA.B $6E                                                            ;888227;
    LDA.B #$37                                                           ;888229;
    STA.B $71                                                            ;88822B;
    LDA.B #$00                                                           ;88822D;
    STA.B $6C                                                            ;88822F;
    LDA.B #$04                                                           ;888231;
    STA.B $6D                                                            ;888233;
    LDA.B #$13                                                           ;888235;
    STA.B $69                                                            ;888237;
    LDA.B #$04                                                           ;888239;
    STA.B $6B                                                            ;88823B;
    RTS                                                                  ;88823D;


Handle_LayerBlending_PowerBomb_4:
    LDA.B #$80                                                           ;88823E;
    STA.B $60                                                            ;888240;
    LDA.B #$08                                                           ;888242;
    STA.B $61                                                            ;888244;
    LDA.B #$80                                                           ;888246;
    STA.B $62                                                            ;888248;
    LDA.B #$02                                                           ;88824A;
    STA.B $6E                                                            ;88824C;
    LDA.B #$37                                                           ;88824E;
    STA.B $71                                                            ;888250;
    LDA.B #$00                                                           ;888252;
    STA.B $6C                                                            ;888254;
    LDA.B #$06                                                           ;888256;
    STA.B $6D                                                            ;888258;
    LDA.B #$11                                                           ;88825A;
    STA.B $69                                                            ;88825C;
    LDA.B #$06                                                           ;88825E;
    STA.B $6B                                                            ;888260;
    RTS                                                                  ;888262;


Handle_LayerBlending_PowerBomb_6:
    LDA.B #$00                                                           ;888263;
    STA.B $60                                                            ;888265;
    LDA.B #$08                                                           ;888267;
    STA.B $61                                                            ;888269;
    LDA.B #$80                                                           ;88826B;
    STA.B $62                                                            ;88826D;
    LDA.B #$02                                                           ;88826F;
    STA.B $6E                                                            ;888271;
    LDA.B #$31                                                           ;888273;
    STA.B $71                                                            ;888275;
    LDA.B #$00                                                           ;888277;
    STA.B $6C                                                            ;888279;
    LDA.B #$04                                                           ;88827B;
    STA.B $6D                                                            ;88827D;
    LDA.B #$13                                                           ;88827F;
    STA.B $69                                                            ;888281;
    LDA.B #$04                                                           ;888283;
    STA.B $6B                                                            ;888285;
    RTS                                                                  ;888287;


Enable_HDMAObjects:
    PHP                                                                  ;888288;
    REP #$20                                                             ;888289;
    LDA.W #$8000                                                         ;88828B;
    TSB.W $18B0                                                          ;88828E;
    PLP                                                                  ;888291;
    RTL                                                                  ;888292;


Disable_HDMAObjects:
    PHP                                                                  ;888293;
    REP #$20                                                             ;888294;
    LDA.W #$8000                                                         ;888296;
    TRB.W $18B0                                                          ;888299;
    PLP                                                                  ;88829C;
    RTL                                                                  ;88829D;


Wait_End_VBlank_Clear_HDMA:
    PHP                                                                  ;88829E;
    SEP #$20                                                             ;88829F;
    JSL.L WaitUntilTheEndOfAVBlank                                       ;8882A1;
    STZ.W $420B                                                          ;8882A5;
    STZ.W $420C                                                          ;8882A8;
    PLP                                                                  ;8882AB; fallthrough to Delete_HDMA_Objects

Delete_HDMAObjects:
    PHP                                                                  ;8882AC;
    SEP #$20                                                             ;8882AD;
    STZ.B $85                                                            ;8882AF;
    REP #$30                                                             ;8882B1;
    PHX                                                                  ;8882B3;
    LDX.W #$000A                                                         ;8882B4;

.loop:
    STZ.W $18B4,X                                                        ;8882B7;
    DEX                                                                  ;8882BA;
    DEX                                                                  ;8882BB;
    BPL .loop                                                            ;8882BC;
    PLX                                                                  ;8882BE;
    PLP                                                                  ;8882BF;
    RTL                                                                  ;8882C0;


Initialise_Special_Effects_for_New_Room:
    PHP                                                                  ;8882C1;
    REP #$20                                                             ;8882C2;
    STZ.W $0607                                                          ;8882C4;
    STZ.W $0609                                                          ;8882C7;
    LDA.W $079B                                                          ;8882CA;
    CMP.W #RoomHeader_BombTorizo                                         ;8882CD;
    BEQ .noEarthquakeSFX                                                 ;8882D0;
    CMP.W #RoomHeader_Climb                                              ;8882D2;
    BEQ .noEarthquakeSFX                                                 ;8882D5;
    CMP.W #RoomHeader_Ridley                                             ;8882D7;
    BEQ .noEarthquakeSFX                                                 ;8882DA;
    CMP.W #RoomHeader_Pillar                                             ;8882DC;
    BEQ .noEarthquakeSFX                                                 ;8882DF;
    CMP.W #RoomHeader_MotherBrain                                        ;8882E1;
    BEQ .noEarthquakeSFX                                                 ;8882E4;
    CMP.W #RoomHeader_TourianEscape4                                     ;8882E6;
    BEQ .noEarthquakeSFX                                                 ;8882E9;
    BRA .earthquakeSFX                                                   ;8882EB;


.noEarthquakeSFX:
    LDA.W #$FFFF                                                         ;8882ED;
    STA.W $0609                                                          ;8882F0;

.earthquakeSFX:
    STZ.W $05F7                                                          ;8882F3;
    SEP #$30                                                             ;8882F6;
    LDX.B #$20                                                           ;8882F8;

.loopClearHDMARegisters:
    STZ.W $4300,X                                                        ;8882FA;
    LDA.B #$13                                                           ;8882FD;
    STA.W $4301,X                                                        ;8882FF;
    STZ.W $4302,X                                                        ;888302;
    STZ.W $4303,X                                                        ;888305;
    STZ.W $4304,X                                                        ;888308;
    STZ.W $4305,X                                                        ;88830B;
    STZ.W $4306,X                                                        ;88830E;
    STZ.W $4308,X                                                        ;888311;
    STZ.W $4309,X                                                        ;888314;
    TXA                                                                  ;888317;
    CLC                                                                  ;888318;
    ADC.B #$10                                                           ;888319;
    TAX                                                                  ;88831B;
    CPX.B #$80                                                           ;88831C;
    BNE .loopClearHDMARegisters                                          ;88831E;
    REP #$30                                                             ;888320;
    LDA.W #$FFFF                                                         ;888322;
    STZ.W $195C                                                          ;888325;
    STA.W $195E                                                          ;888328;
    STZ.W $1960                                                          ;88832B;
    STA.W $1962                                                          ;88832E;
    LDA.W #$0000                                                         ;888331;
    STA.L $7ECAD8                                                        ;888334;
    STA.L $7ECADA                                                        ;888338;
    STA.L $7ECADC                                                        ;88833C;
    STA.L $7ECADE                                                        ;888340;
    STZ.W $0783                                                          ;888344;
    STZ.W $0941                                                          ;888347;
    STZ.W $1E6F                                                          ;88834A;
    STZ.W $1E6D                                                          ;88834D;
    STZ.W $1840                                                          ;888350;
    STZ.W $1988                                                          ;888353;
    STZ.W $0592                                                          ;888356;
    STZ.W $0CEE                                                          ;888359;
    STZ.W $0CEA                                                          ;88835C;
    STZ.W $1964                                                          ;88835F;
    STZ.W $196E                                                          ;888362;
    LDA.W #$8000                                                         ;888365;
    STA.W $1976                                                          ;888368;
    STZ.W $1978                                                          ;88836B;
    STZ.W $197A                                                          ;88836E;
    STZ.W $197C                                                          ;888371;
    STZ.W $197E                                                          ;888374;
    STZ.W $1980                                                          ;888377;
    STZ.W $1974                                                          ;88837A;
    STZ.W $1970                                                          ;88837D;
    STZ.W $1972                                                          ;888380;
    LDA.W #$0002                                                         ;888383;
    STA.W $1982                                                          ;888386;
    STZ.B $B9                                                            ;888389;
    STZ.B $BB                                                            ;88838B;
    STZ.W $0917                                                          ;88838D;
    STZ.W $0919                                                          ;888390;
    STZ.B $A9                                                            ;888393;
    LDA.W #RTL_8883E1>>8&$FF00                                           ;888395;
    STA.W $0602                                                          ;888398;
    STA.W $0605                                                          ;88839B;
    LDA.W #RTL_8883E1                                                    ;88839E;
    STA.W $0601                                                          ;8883A1;
    STA.W $0604                                                          ;8883A4;
    SEP #$20                                                             ;8883A7;
    LDA.B #$F0                                                           ;8883A9;
    STA.W $2181                                                          ;8883AB;
    LDA.B #$FF                                                           ;8883AE;
    STA.W $2182                                                          ;8883B0;
    LDA.B #$01                                                           ;8883B3;
    STA.W $2183                                                          ;8883B5;
    STZ.B $85                                                            ;8883B8;
    LDA.B #$20                                                           ;8883BA;
    STA.B $74                                                            ;8883BC;
    LDA.B #$40                                                           ;8883BE;
    STA.B $75                                                            ;8883C0;
    LDA.B #$80                                                           ;8883C2;
    STA.B $76                                                            ;8883C4;
    STZ.B $57                                                            ;8883C6;
    LDA.B #$13                                                           ;8883C8;
    STA.B $69                                                            ;8883CA;
    STZ.B $6F                                                            ;8883CC;
    STZ.B $72                                                            ;8883CE;
    STZ.B $5D                                                            ;8883D0;
    LDA.B #$04                                                           ;8883D2;
    STA.B $5E                                                            ;8883D4;
    LDA.B #$49                                                           ;8883D6;
    STA.B $59                                                            ;8883D8;
    LDA.B #$5A                                                           ;8883DA;
    STA.B $5A                                                            ;8883DC;
    STA.B $5B                                                            ;8883DE;
    PLP                                                                  ;8883E0; fallthrough to RTL_8883E1

RTL_8883E1:
    RTL                                                                  ;8883E1;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpawnHDMAObject_Slot0_Channel4_Index20_8883E2:
    PHP                                                                  ;8883E2;
    PHB                                                                  ;8883E3;
    REP #$20                                                             ;8883E4;
    LDA.W #$0400                                                         ;8883E6;
    STA.B $12                                                            ;8883E9;
    LDA.W #$0020                                                         ;8883EB;
    STA.B $14                                                            ;8883EE;
    LDX.W #$0000                                                         ;8883F0;
    JMP.W SpawnHDMAObject_SlotX_Hardcoded                                ;8883F3;


UNUSED_SpawnHDMAObject_Slot8_Channel40_Index60_8883F6:
    PHP                                                                  ;8883F6;
    PHB                                                                  ;8883F7;
    REP #$20                                                             ;8883F8;
    LDA.W #$4000                                                         ;8883FA;
    STA.B $12                                                            ;8883FD;
    LDA.W #$0060                                                         ;8883FF;
    STA.B $14                                                            ;888402;
    LDX.W #$0008                                                         ;888404;
    JMP.W SpawnHDMAObject_SlotX_Hardcoded                                ;888407;
endif ; !FEATURE_KEEP_UNREFERENCED


SpawnHDMAObject_SlotA_Channel80_Index70:
    PHP                                                                  ;88840A;
    PHB                                                                  ;88840B;
    REP #$20                                                             ;88840C;
    LDA.W #$8000                                                         ;88840E;
    STA.B $12                                                            ;888411;
    LDA.W #$0070                                                         ;888413;
    STA.B $14                                                            ;888416;
    LDX.W #$000A                                                         ;888418;

SpawnHDMAObject_SlotX_Hardcoded:
    SEP #$20                                                             ;88841B;
    LDA.B $05,S                                                          ;88841D;
    PHA                                                                  ;88841F;
    PLB                                                                  ;888420;
    XBA                                                                  ;888421;
    LDA.B #$00                                                           ;888422;
    REP #$30                                                             ;888424;
    STA.B $18                                                            ;888426;
    LDA.B $03,S                                                          ;888428;
    TAY                                                                  ;88842A;
    INY                                                                  ;88842B;
    CLC                                                                  ;88842C;
    ADC.W #$0004                                                         ;88842D;
    STA.B $03,S                                                          ;888430;
    JMP.W Spawn_HDMAObject_to_Slot_X                                     ;888432;


Spawn_HDMAObject:
    PHP                                                                  ;888435;
    PHB                                                                  ;888436;
    SEP #$20                                                             ;888437;
    LDA.B $05,S                                                          ;888439;
    PHA                                                                  ;88843B;
    PLB                                                                  ;88843C;
    XBA                                                                  ;88843D;
    LDA.B #$00                                                           ;88843E;
    REP #$30                                                             ;888440;
    STA.B $18                                                            ;888442;
    LDA.B $03,S                                                          ;888444;
    TAY                                                                  ;888446;
    INY                                                                  ;888447;
    CLC                                                                  ;888448;
    ADC.W #$0004                                                         ;888449;
    STA.B $03,S                                                          ;88844C;
    LDA.W #$0400                                                         ;88844E;
    STA.B $12                                                            ;888451;
    LDA.W #$0020                                                         ;888453;
    STA.B $14                                                            ;888456;
    LDX.W #$0000                                                         ;888458;

.loop:
    LDA.W $18B4,X                                                        ;88845B;
    BEQ Spawn_HDMAObject_to_Slot_X                                       ;88845E;
    ASL.B $12                                                            ;888460;
    BCS .returnFullArray                                                 ;888462;
    LDA.B $14                                                            ;888464;
    CLC                                                                  ;888466;
    ADC.W #$0010                                                         ;888467;
    STA.B $14                                                            ;88846A;
    INX                                                                  ;88846C;
    INX                                                                  ;88846D;
    CPX.W #$000C                                                         ;88846E;
    BNE .loop                                                            ;888471;

.returnFullArray:
    PLB                                                                  ;888473;
    PLP                                                                  ;888474;
    SEC                                                                  ;888475;
    RTL                                                                  ;888476;


Spawn_HDMAObject_to_Slot_X:
    LDA.W #.return                                                       ;888477;
    STA.W $18F0,X                                                        ;88847A;
    LDA.W #$0088                                                         ;88847D;
    STA.W $18FC,X                                                        ;888480;
    LDA.W $0002,Y                                                        ;888483;
    STA.W $18CC,X                                                        ;888486;
    LDA.W #$0001                                                         ;888489;
    STA.W $18E4,X                                                        ;88848C;
    STZ.W $1908,X                                                        ;88848F;
    STZ.W $1914,X                                                        ;888492;
    STZ.W $1920,X                                                        ;888495;
    STZ.W $192C,X                                                        ;888498;
    STZ.W $1938,X                                                        ;88849B;
    LDA.B $12                                                            ;88849E;
    XBA                                                                  ;8884A0;
    STA.W $18B4,X                                                        ;8884A1;
    LDA.B $14                                                            ;8884A4;
    ORA.B $18                                                            ;8884A6;
    STA.W $18C0,X                                                        ;8884A8;
    PHX                                                                  ;8884AB;
    LDX.B $14                                                            ;8884AC;
    LDA.W $0000,Y                                                        ;8884AE;
    STA.W $4300,X                                                        ;8884B1;
    PLA                                                                  ;8884B4;
    PLB                                                                  ;8884B5;
    PLP                                                                  ;8884B6;
    CLC                                                                  ;8884B7;

  .return
    RTL                                                                  ;8884B8;


HDMAObjectHandler_HandleMusicQueue:
    PHP                                                                  ;8884B9;
    PHB                                                                  ;8884BA;
    REP #$30                                                             ;8884BB;
    JSL.L HandleMusicQueue                                               ;8884BD;
    LDA.W $0A78                                                          ;8884C1;
    BNE +                                                                ;8884C4;
    BIT.W $0592                                                          ;8884C6;
    BVC +                                                                ;8884C9;
    LDA.W #$8000                                                         ;8884CB;
    STA.W $0592                                                          ;8884CE;
    JSL.L Spawn_HDMAObject                                               ;8884D1;
    db $40,$28                                                           ;8884D5;
    dw InstList_PowerBombExplosion_Window2_LeftPosition                  ;8884D7;
    JSL.L Spawn_HDMAObject                                               ;8884D9;
    db $40,$29                                                           ;8884DD;
    dw InstList_PowerBombExplosion_Window2_RightPosition                 ;8884DF;

  + PHK                                                                  ;8884E1;
    PLB                                                                  ;8884E2;
    REP #$30                                                             ;8884E3;
    LDA.W $1982                                                          ;8884E5;
    STA.W $1986                                                          ;8884E8;
    BIT.W $18B0                                                          ;8884EB;
    BPL .return                                                          ;8884EE;
    SEP #$30                                                             ;8884F0;
    LDX.B #$00                                                           ;8884F2;
    STX.B $85                                                            ;8884F4;
    STX.W $18B3                                                          ;8884F6;

.loop:
    STX.W $18B2                                                          ;8884F9;
    LDA.W $18B4,X                                                        ;8884FC;
    BEQ .next                                                            ;8884FF;
    ORA.B $85                                                            ;888501;
    STA.B $85                                                            ;888503;
    JSR.W HDMAObject_Instruction_Handler                                 ;888505;
    LDX.W $18B2                                                          ;888508;

.next:
    INX                                                                  ;88850B;
    INX                                                                  ;88850C;
    CPX.B #$0C                                                           ;88850D;
    BNE .loop                                                            ;88850F;
    JSR.W LayerBlending_Handler                                          ;888511;
    PLB                                                                  ;888514;
    PLP                                                                  ;888515;
    RTL                                                                  ;888516;

    STZ.B $85                                                            ;888517; dead code

.return:
    PLB                                                                  ;888519;
    PLP                                                                  ;88851A;
    RTL                                                                  ;88851B;


HDMAObject_Instruction_Handler:
    REP #$20                                                             ;88851C;
    LDA.W $18F0,X                                                        ;88851E;
    STA.B $12                                                            ;888521;
    LDA.W $18FC,X                                                        ;888523;
    STA.B $14                                                            ;888526;
    PHK                                                                  ;888528;
    PEA.W .manualReturn-1                                                ;888529;
    JML.W [$0012]                                                        ;88852C;


.manualReturn:
    SEP #$10                                                             ;88852F;
    REP #$20                                                             ;888531;
    LDX.W $18B2                                                          ;888533;
    DEC.W $18E4,X                                                        ;888536;
    BNE .return                                                          ;888539;
    LDY.W $18C1,X                                                        ;88853B;
    PHY                                                                  ;88853E;
    PLB                                                                  ;88853F;
    LDA.W $18CC,X                                                        ;888540;
    REP #$10                                                             ;888543;
    TAY                                                                  ;888545;

.loop:
    LDA.W $0000,Y                                                        ;888546;
    BPL .timer                                                           ;888549;
    STA.B $12                                                            ;88854B;
    INY                                                                  ;88854D;
    INY                                                                  ;88854E;
    PEA.W .loop-1                                                        ;88854F;
    JMP.W ($0012)                                                        ;888552;


.timer:
    STA.W $18E4,X                                                        ;888555;
    TYA                                                                  ;888558;
    CLC                                                                  ;888559;
    ADC.W #$0004                                                         ;88855A;
    STA.W $18CC,X                                                        ;88855D;
    LDA.W $0002,Y                                                        ;888560;
    STA.W $18D8,X                                                        ;888563;

.return:
    SEP #$30                                                             ;888566;
    RTS                                                                  ;888568;


Instruction_HDMAObject_Delete:
    STZ.W $18B4,X                                                        ;888569;
    PLA                                                                  ;88856C;
    SEP #$30                                                             ;88856D;
    RTS                                                                  ;88856F;


Instruction_HDMAObject_PreInstructionInY:
    LDA.W $0000,Y                                                        ;888570;
    STA.W $18F0,X                                                        ;888573;
    SEP #$20                                                             ;888576;
    LDA.W $0002,Y                                                        ;888578;
    STA.W $18FC,X                                                        ;88857B;
    REP #$20                                                             ;88857E;
    INY                                                                  ;888580;
    INY                                                                  ;888581;
    INY                                                                  ;888582;
    RTS                                                                  ;888583;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_HDMAObject_ClearPreInstruction_888584:
    LDA.W #.return                                                       ;888584;
    STA.W $18F0,X                                                        ;888587;

  .return
    RTS                                                                  ;88858A;


UNUSED_Instruction_HDMAObject_CallFunctionY_88858B:
    LDA.W $0000,Y                                                        ;88858B;
    STA.B $12                                                            ;88858E;
    PHX                                                                  ;888590;
    PHY                                                                  ;888591;
    PEA.W .return-1                                                      ;888592;
    JMP.W ($0012)                                                        ;888595;


.return:
    PLY                                                                  ;888598;
    PLX                                                                  ;888599;
    INY                                                                  ;88859A;
    INY                                                                  ;88859B;
    RTS                                                                  ;88859C;


UNUSED_Instruction_HDMAObject_CallFunctionYWithA_88859D:
    LDA.W $0000,Y                                                        ;88859D;
    STA.B $12                                                            ;8885A0;
    LDA.W $0002,Y                                                        ;8885A2;
    PHX                                                                  ;8885A5;
    PHY                                                                  ;8885A6;
    PEA.W .return-1                                                      ;8885A7;
    JMP.W ($0012)                                                        ;8885AA;


.return:
    PLY                                                                  ;8885AD;
    PLX                                                                  ;8885AE;
    INY                                                                  ;8885AF;
    INY                                                                  ;8885B0;
    INY                                                                  ;8885B1;
    INY                                                                  ;8885B2;
    RTS                                                                  ;8885B3;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_HDMAObject_CallExternalFunctionInY:
    LDA.W $0000,Y                                                        ;8885B4;
    STA.B $12                                                            ;8885B7;
    LDA.W $0001,Y                                                        ;8885B9;
    STA.B $13                                                            ;8885BC;
    PHX                                                                  ;8885BE;
    PHY                                                                  ;8885BF;
    JSL.L .externalFunction                                              ;8885C0;
    PLY                                                                  ;8885C4;
    PLX                                                                  ;8885C5;
    INY                                                                  ;8885C6;
    INY                                                                  ;8885C7;
    INY                                                                  ;8885C8;
    RTS                                                                  ;8885C9;


.externalFunction:
    JML.W [$0012]                                                        ;8885CA;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_HDMAObject_CallExternalFuncYWithA_8885CD:
    LDA.W $0000,Y                                                        ;8885CD;
    STA.B $12                                                            ;8885D0;
    LDA.W $0001,Y                                                        ;8885D2;
    STA.B $13                                                            ;8885D5;
    LDA.W $0003,Y                                                        ;8885D7;
    PHX                                                                  ;8885DA;
    PHY                                                                  ;8885DB;
    JSL.L .externalFunction                                              ;8885DC;
    PLY                                                                  ;8885E0;
    PLX                                                                  ;8885E1;
    TYA                                                                  ;8885E2;
    CLC                                                                  ;8885E3;
    ADC.W #$0005                                                         ;8885E4;
    TAY                                                                  ;8885E7;
    RTS                                                                  ;8885E8;


.externalFunction:
    JML.W [$0012]                                                        ;8885E9;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_HDMAObject_GotoY:
    LDA.W $0000,Y                                                        ;8885EC;
    TAY                                                                  ;8885EF;
    RTS                                                                  ;8885F0;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_HDMAObject_GotoY_Y_8885F1:
    STY.B $12                                                            ;8885F1;
    DEY                                                                  ;8885F3;
    LDA.W $0000,Y                                                        ;8885F4;
    XBA                                                                  ;8885F7;
    BMI .highByte                                                        ;8885F8;
    AND.W #$00FF                                                         ;8885FA;
    BRA +                                                                ;8885FD;


.highByte:
    ORA.W #$FF00                                                         ;8885FF;

  + CLC                                                                  ;888602;
    ADC.B $12                                                            ;888603;
    TAY                                                                  ;888605;
    RTS                                                                  ;888606;

    DEC.W $1908,X                                                        ;888607;
    BNE Instruction_HDMAObject_GotoY                                     ;88860A;
    INY                                                                  ;88860C;
    INY                                                                  ;88860D;
    RTS                                                                  ;88860E;


UNUSED_Instruction_HDMAObject_DecTimer_GotoYIfNonZero_88860F:
    DEC.W $1908,X                                                        ;88860F;
    BNE UNUSED_Instruction_HDMAObject_GotoY_Y_8885F1                     ;888612;
    INY                                                                  ;888614;
    RTS                                                                  ;888615;


UNUSED_Instruction_HDMAObject_TimerInY_888616:
    SEP #$20                                                             ;888616;
    LDA.W $0000,Y                                                        ;888618;
    STA.W $1908,X                                                        ;88861B;
    REP #$20                                                             ;88861E;
    INY                                                                  ;888620;
    RTS                                                                  ;888621;


UNUSED_Instruction_HDMAObject_HDMAControlInY_888622:
    PHX                                                                  ;888622;
    LDA.W $18C0,X                                                        ;888623;
    AND.W #$00FF                                                         ;888626;
    TAX                                                                  ;888629;
    SEP #$20                                                             ;88862A;
    LDA.W $0000,Y                                                        ;88862C;
    STA.W $4300,X                                                        ;88862F;
    REP #$20                                                             ;888632;
    PLX                                                                  ;888634;
    INY                                                                  ;888635;
    RTS                                                                  ;888636;


UNUSED_Instruction_HDMAObject_HDMATargetInY:
    PHX                                                                  ;888637;
    LDA.W $18C0,X                                                        ;888638;
    AND.W #$00FF                                                         ;88863B;
    TAX                                                                  ;88863E;
    SEP #$20                                                             ;88863F;
    LDA.W $0000,Y                                                        ;888641;
    STA.W $4301,X                                                        ;888644;
    REP #$20                                                             ;888647;
    PLX                                                                  ;888649;
    INY                                                                  ;88864A;
    RTS                                                                  ;88864B;


UNUSED_Instruction_HDMAObject_HDMATablePointerInY_88864C:
    LDA.W $0000,Y                                                        ;88864C;
    STA.W $18D8,X                                                        ;88864F;
    INY                                                                  ;888652;
    INY                                                                  ;888653;
    RTS                                                                  ;888654;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_HDMAObject_HDMATableBank:
    PHX                                                                  ;888655;
    LDA.W $18C0,X                                                        ;888656;
    AND.W #$00FF                                                         ;888659;
    TAX                                                                  ;88865C;
    SEP #$20                                                             ;88865D;
    LDA.W $0000,Y                                                        ;88865F;
    STA.W $4304,X                                                        ;888662;
    REP #$20                                                             ;888665;
    PLX                                                                  ;888667;
    INY                                                                  ;888668;
    RTS                                                                  ;888669;


Instruction_HDMAObject_IndirectHDMATableBank:
    PHX                                                                  ;88866A;
    LDA.W $18C0,X                                                        ;88866B;
    AND.W #$00FF                                                         ;88866E;
    TAX                                                                  ;888671;
    SEP #$20                                                             ;888672;
    LDA.W $0000,Y                                                        ;888674;
    STA.W $4307,X                                                        ;888677;
    REP #$20                                                             ;88867A;
    PLX                                                                  ;88867C;
    INY                                                                  ;88867D;
    RTS                                                                  ;88867E;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_HDMAObject_SkipNextInstruction_88867F:
    INY                                                                  ;88867F;
    INY                                                                  ;888680;
    RTS                                                                  ;888681;
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_HDMAObject_Sleep:
    DEY                                                                  ;888682;
    DEY                                                                  ;888683;
    TYA                                                                  ;888684;
    STA.W $18CC,X                                                        ;888685;
    PLA                                                                  ;888688;
    SEP #$30                                                             ;888689;
    RTS                                                                  ;88868B;


RaiseOrLower_FX:
    LDA.W $197A                                                          ;88868C;
    BMI .returnCarrySet                                                  ;88868F;
    STZ.B $16                                                            ;888691;
    STZ.B $18                                                            ;888693;
    LDA.W $197C                                                          ;888695;
    BPL .lower                                                           ;888698;
    DEC.B $18                                                            ;88869A;
    STA.B $17                                                            ;88869C;
    LDA.W $1976                                                          ;88869E;
    CLC                                                                  ;8886A1;
    ADC.B $16                                                            ;8886A2;
    STA.W $1976                                                          ;8886A4;
    LDA.W $1978                                                          ;8886A7;
    ADC.B $18                                                            ;8886AA;
    BPL +                                                                ;8886AC;
    LDA.W #$0000                                                         ;8886AE;

  + STA.W $1978                                                          ;8886B1;
    LDA.W $197A                                                          ;8886B4;
    CMP.W $1978                                                          ;8886B7;
    BCC .return                                                          ;8886BA;
    STA.W $1978                                                          ;8886BC;
    STZ.W $1976                                                          ;8886BF;

.return:
    RTS                                                                  ;8886C2;


.lower:
    STA.B $17                                                            ;8886C3;
    LDA.W $1976                                                          ;8886C5;
    CLC                                                                  ;8886C8;
    ADC.B $16                                                            ;8886C9;
    STA.W $1976                                                          ;8886CB;
    LDA.W $1978                                                          ;8886CE;
    ADC.B $18                                                            ;8886D1;
    BPL +                                                                ;8886D3;
    LDA.W #$FFFF                                                         ;8886D5;

  + STA.W $1978                                                          ;8886D8;
    LDA.W $197A                                                          ;8886DB;
    CMP.W $1978                                                          ;8886DE;
    BCS .returnCarryClear                                                ;8886E1;
    STA.W $1978                                                          ;8886E3;
    STZ.W $1976                                                          ;8886E6;
    SEC                                                                  ;8886E9;
    RTS                                                                  ;8886EA;


.returnCarryClear:
    CLC                                                                  ;8886EB;
    RTS                                                                  ;8886EC;


.returnCarrySet:
    SEC                                                                  ;8886ED;
    RTS                                                                  ;8886EE;


PreInstruction_Xray_Main:
    PHP                                                                  ;8886EF;
    REP #$30                                                             ;8886F0;
    LDX.W #$1000                                                         ;8886F2;
    LDA.W $196E                                                          ;8886F5;
    CMP.W #$0024                                                         ;8886F8;
    BEQ +                                                                ;8886FB;
    LDX.W #$2000                                                         ;8886FD;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;888700;
    BEQ +                                                                ;888704;
    LDX.W #$4000                                                         ;888706;
    LDA.W #$0027                                                         ;888709;
    STA.B $74                                                            ;88870C;
    LDA.W #$0047                                                         ;88870E;
    STA.B $75                                                            ;888711;
    LDA.W #$0087                                                         ;888713;
    STA.B $76                                                            ;888716;

  + TXA                                                                  ;888718;
    TSB.W $1986                                                          ;888719;
    LDA.W $0A7A                                                          ;88871C;
    ASL A                                                                ;88871F;
    TAX                                                                  ;888720;
    JSR.W (.pointers,X)                                                  ;888721;
    PLP                                                                  ;888724;
    RTL                                                                  ;888725;


.pointers:
    dw HandleXrayScope_State0_NoBeam                                     ;888726;
    dw HandleXrayScope_State1_BeamIsWidening                             ;888728;
    dw HandleXrayScope_State2_FullBeam                                   ;88872A;
    dw HandleXrayScope_State3_DeactivateBeam_RestoreBG2_FirstHalf        ;88872C;
    dw HandleXrayScope_State4_DeactivateBeam_RestoreBG2_SecondHalf       ;88872E;
    dw HandleXrayScope_State5_DeactivateBeam_Finish                      ;888730;

HandleXrayScope_State0_NoBeam:
    PHP                                                                  ;888732;
    REP #$30                                                             ;888733;
    LDA.B $8B                                                            ;888735;
    BIT.W $09B6                                                          ;888737;
    BNE .calculateHDMATable                                              ;88873A;
    LDA.W #$0003                                                         ;88873C;
    STA.W $0A7A                                                          ;88873F;
    BRA .return                                                          ;888742;


.calculateHDMATable:
    JSR.W Calculate_Xray_HDMADataTable                                   ;888744;
    LDA.W $0A7A                                                          ;888747;
    INC A                                                                ;88874A;
    STA.W $0A7A                                                          ;88874B;
    JSR.W RTS_888753                                                     ;88874E;

.return:
    PLP                                                                  ;888751;
    RTS                                                                  ;888752;


RTS_888753:
    RTS                                                                  ;888753;


HandleXrayScope_State1_BeamIsWidening:
    PHP                                                                  ;888754;
    REP #$30                                                             ;888755;
    LDA.B $8B                                                            ;888757;
    BIT.W $09B6                                                          ;888759;
    BNE +                                                                ;88875C;
    LDA.W #$0003                                                         ;88875E;
    STA.W $0A7A                                                          ;888761;
    BRA .return                                                          ;888764;


  + JSR.W RTS_888753                                                     ;888766;
    REP #$20                                                             ;888769;
    LDA.W $0A7E                                                          ;88876B;
    CLC                                                                  ;88876E;
    ADC.W #$0800                                                         ;88876F;
    STA.W $0A7E                                                          ;888772;
    LDA.W $0A7C                                                          ;888775;
    ADC.W #$0000                                                         ;888778;
    STA.W $0A7C                                                          ;88877B;
    LDA.W $0A86                                                          ;88877E;
    CLC                                                                  ;888781;
    ADC.W $0A7E                                                          ;888782;
    STA.W $0A86                                                          ;888785;
    LDA.W $0A84                                                          ;888788;
    ADC.W $0A7C                                                          ;88878B;
    STA.W $0A84                                                          ;88878E;
    CMP.W #$000B                                                         ;888791;
    BMI .calculateHDMATable                                              ;888794;
    STZ.W $0A86                                                          ;888796;
    LDA.W #$000A                                                         ;888799;
    STA.W $0A84                                                          ;88879C;
    LDA.W $0A7A                                                          ;88879F;
    INC A                                                                ;8887A2;
    STA.W $0A7A                                                          ;8887A3;

.calculateHDMATable:
    JSR.W Calculate_Xray_HDMADataTable                                   ;8887A6;

.return:
    PLP                                                                  ;8887A9;
    RTS                                                                  ;8887AA;


HandleXrayScope_State2_FullBeam:
    PHP                                                                  ;8887AB;
    REP #$30                                                             ;8887AC;
    LDA.B $8B                                                            ;8887AE;
    BIT.W $09B6                                                          ;8887B0;
    BEQ .state3                                                          ;8887B3;
    JSR.W HandleMovingXray_UpDown                                        ;8887B5;
    JSR.W Calculate_Xray_HDMADataTable                                   ;8887B8;
    JSR.W RTS_888753                                                     ;8887BB;
    PLP                                                                  ;8887BE;
    RTS                                                                  ;8887BF;


.state3:
    INC.W $0A7A                                                          ;8887C0;
    PLP                                                                  ;8887C3;
    RTS                                                                  ;8887C4;


HandleMovingXray_UpDown:
    PHP                                                                  ;8887C5;
    REP #$30                                                             ;8887C6;
    LDA.B $8B                                                            ;8887C8;
    BIT.W $09AA                                                          ;8887CA;
    BNE .up                                                              ;8887CD;
    BIT.W $09AC                                                          ;8887CF;
    BNE .down                                                            ;8887D2;
    BRA .return                                                          ;8887D4;


.up:
    JSR.W MoveXray_Up                                                    ;8887D6;
    BRA .return                                                          ;8887D9;


.down:
    JSR.W MoveXray_Down                                                  ;8887DB;

.return:
    PLP                                                                  ;8887DE;
    RTS                                                                  ;8887DF;


MoveXray_Up:
    PHP                                                                  ;8887E0;
    REP #$30                                                             ;8887E1;
    LDA.W $0A82                                                          ;8887E3;
    CMP.W #$0080                                                         ;8887E6;
    BPL .facingLeft                                                      ;8887E9;
    SEC                                                                  ;8887EB;
    SBC.W $0A84                                                          ;8887EC;
    BEQ .return                                                          ;8887EF;
    BMI .setAngularWidth                                                 ;8887F1;
    LDA.W $0A82                                                          ;8887F3;
    SEC                                                                  ;8887F6;
    SBC.W #$0001                                                         ;8887F7;
    STA.W $0A82                                                          ;8887FA;
    SBC.W $0A84                                                          ;8887FD;
    BPL .return                                                          ;888800;

.setAngularWidth:
    LDA.W $0A84                                                          ;888802;
    STA.W $0A82                                                          ;888805;
    BRA .return                                                          ;888808;


.facingLeft:
    CLC                                                                  ;88880A;
    ADC.W $0A84                                                          ;88880B;
    CMP.W #$0100                                                         ;88880E;
    BEQ .return                                                          ;888811;
    BPL .max100                                                          ;888813;
    LDA.W $0A82                                                          ;888815;
    CLC                                                                  ;888818;
    ADC.W #$0001                                                         ;888819;
    STA.W $0A82                                                          ;88881C;
    ADC.W $0A84                                                          ;88881F;
    CMP.W #$0100                                                         ;888822;
    BEQ .return                                                          ;888825;
    BMI .return                                                          ;888827;

.max100:
    LDA.W #$0100                                                         ;888829;
    SEC                                                                  ;88882C;
    SBC.W $0A84                                                          ;88882D;
    STA.W $0A82                                                          ;888830;

.return:
    PLP                                                                  ;888833;
    RTS                                                                  ;888834;


MoveXray_Down:
    PHP                                                                  ;888835;
    REP #$30                                                             ;888836;
    LDA.W $0A82                                                          ;888838;
    CMP.W #$0080                                                         ;88883B;
    BPL .facingLeft                                                      ;88883E;
    CLC                                                                  ;888840;
    ADC.W $0A84                                                          ;888841;
    CMP.W #$0080                                                         ;888844;
    BEQ .return                                                          ;888847;
    BPL .setAngularWidth                                                 ;888849;
    LDA.W $0A82                                                          ;88884B;
    CLC                                                                  ;88884E;
    ADC.W #$0001                                                         ;88884F;
    STA.W $0A82                                                          ;888852;
    ADC.W $0A84                                                          ;888855;
    CMP.W #$0080                                                         ;888858;
    BEQ .return                                                          ;88885B;
    BMI .return                                                          ;88885D;

.setAngularWidth:
    LDA.W #$0080                                                         ;88885F;
    SEC                                                                  ;888862;
    SBC.W $0A84                                                          ;888863;
    STA.W $0A82                                                          ;888866;
    BRA .return                                                          ;888869;


.facingLeft:
    SEC                                                                  ;88886B;
    SBC.W $0A84                                                          ;88886C;
    CMP.W #$0080                                                         ;88886F;
    BEQ .return                                                          ;888872;
    BMI +                                                                ;888874;
    LDA.W $0A82                                                          ;888876;
    SEC                                                                  ;888879;
    SBC.W #$0001                                                         ;88887A;
    STA.W $0A82                                                          ;88887D;
    SBC.W $0A84                                                          ;888880;
    CMP.W #$0080                                                         ;888883;
    BEQ .return                                                          ;888886;
    BPL .return                                                          ;888888;

  + LDA.W #$0080                                                         ;88888A;
    CLC                                                                  ;88888D;
    ADC.W $0A84                                                          ;88888E;
    STA.W $0A82                                                          ;888891;

.return:
    PLP                                                                  ;888894;
    RTS                                                                  ;888895;


Calculate_Xray_HDMADataTable:
    PHP                                                                  ;888896;
    REP #$30                                                             ;888897;
    LDA.W #$7E00                                                         ;888899;
    STA.B $01                                                            ;88889C;
    LDA.W #$9800                                                         ;88889E; $7E
    STA.B $00                                                            ;8888A1;
    LDA.W $0A82                                                          ;8888A3;
    STA.B $12                                                            ;8888A6;
    LDA.W $0A84                                                          ;8888A8;
    STA.B $14                                                            ;8888AB;
    LDA.W $0A1E                                                          ;8888AD;
    AND.W #$00FF                                                         ;8888B0;
    CMP.W #$0004                                                         ;8888B3;
    BEQ .facingLeft                                                      ;8888B6;
    LDA.W $0AF6                                                          ;8888B8;
    SEC                                                                  ;8888BB;
    SBC.W $0911                                                          ;8888BC;
    CLC                                                                  ;8888BF;
    ADC.W #$0003                                                         ;8888C0;
    TAX                                                                  ;8888C3;
    BRA .checkMovement                                                   ;8888C4;


.facingLeft:
    LDA.W $0AF6                                                          ;8888C6;
    SEC                                                                  ;8888C9;
    SBC.W $0911                                                          ;8888CA;
    SBC.W #$0003                                                         ;8888CD;
    TAX                                                                  ;8888D0;

.checkMovement:
    LDA.W $0A1F                                                          ;8888D1;
    AND.W #$00FF                                                         ;8888D4;
    CMP.W #$0005                                                         ;8888D7;
    BEQ .crouching                                                       ;8888DA;
    LDA.W $0AFA                                                          ;8888DC;
    SEC                                                                  ;8888DF;
    SBC.W $0915                                                          ;8888E0;
    SBC.W #$0010                                                         ;8888E3;
    TAY                                                                  ;8888E6;
    BRA .checkScreenPosition                                             ;8888E7;


.crouching:
    LDA.W $0AFA                                                          ;8888E9;
    SEC                                                                  ;8888EC;
    SBC.W $0915                                                          ;8888ED;
    SBC.W #$000C                                                         ;8888F0;
    TAY                                                                  ;8888F3;

.checkScreenPosition:
    CPX.W #$0000                                                         ;8888F4;
    BMI .leftOfScreen                                                    ;8888F7;
    CPX.W #$0100                                                         ;8888F9;
    BMI .onScreen                                                        ;8888FC;
    LDA.W $0A1E                                                          ;8888FE;
    AND.W #$00FF                                                         ;888901;
    CMP.W #$0008                                                         ;888904;
    BEQ .offScreen                                                       ;888907;
    BRA .onScreenFromOffScreen                                           ;888909;


.leftOfScreen:
    LDA.W $0A1E                                                          ;88890B;
    AND.W #$00FF                                                         ;88890E;
    CMP.W #$0004                                                         ;888911;
    BEQ .offScreen                                                       ;888914;
    BRA .onScreenFromOffScreen                                           ;888916;


.onScreen:
    JSL.L Calc_Xray_HDMADataTable_OnScreen                               ;888918;
    PLP                                                                  ;88891C;
    RTS                                                                  ;88891D;


.onScreenFromOffScreen:
    JSL.L Calc_Xray_HDMADataTable_OffScreen                              ;88891E;
    PLP                                                                  ;888922;
    RTS                                                                  ;888923;


.offScreen:
    LDX.W #$01FE                                                         ;888924;
    LDA.W #$00FF                                                         ;888927;

.loop:
    STA.L $7E9800,X                                                      ;88892A;
    DEX                                                                  ;88892E;
    DEX                                                                  ;88892F;
    BPL .loop                                                            ;888930;
    PLP                                                                  ;888932;
    RTS                                                                  ;888933;


HandleXrayScope_State3_DeactivateBeam_RestoreBG2_FirstHalf:
    PHP                                                                  ;888934;
    REP #$30                                                             ;888935;
    LDA.W #$0001                                                         ;888937;
    STA.W $0A88                                                          ;88893A;
    LDA.W #$9800                                                         ;88893D; $7E
    STA.W $0A89                                                          ;888940;
    STZ.W $0A8B                                                          ;888943;
    STZ.W $0A8C                                                          ;888946;
    STZ.W $0A8E                                                          ;888949;
    STZ.W $0A90                                                          ;88894C;
    LDA.W #$00FF                                                         ;88894F;
    STA.L $7E9800                                                        ;888952;
    LDX.W #$1000                                                         ;888956;
    LDA.W $196E                                                          ;888959;
    CMP.W #$0024                                                         ;88895C;
    BEQ +                                                                ;88895F;
    LDX.W #$2000                                                         ;888961;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;888964;
    BEQ +                                                                ;888968;
    LDX.W #$4000                                                         ;88896A;

  + TXA                                                                  ;88896D;
    TSB.W $1986                                                          ;88896E;
    LDA.W #$0000                                                         ;888971;
    STA.L $7EC000                                                        ;888974;
    LDX.W $18B2                                                          ;888978;
    LDA.W $1914,X                                                        ;88897B;
    STA.B $B5                                                            ;88897E;
    LDA.W $1920,X                                                        ;888980;
    STA.B $B7                                                            ;888983;
    SEP #$20                                                             ;888985;
    LDA.W $192C,X                                                        ;888987;
    STA.B $59                                                            ;88898A;
    REP #$20                                                             ;88898C;
    LDX.W $0330                                                          ;88898E;
    CPX.W #$00F0                                                         ;888991;
    BPL .return                                                          ;888994;
    LDA.W #$0800                                                         ;888996;
    STA.B $D0,X                                                          ;888999;
    LDA.W #$5000                                                         ;88899B;
    STA.B $D2,X                                                          ;88899E;
    LDA.W #$007E                                                         ;8889A0;
    STA.B $D4,X                                                          ;8889A3;
    LDA.B $59                                                            ;8889A5;
    AND.W #$00FC                                                         ;8889A7;
    XBA                                                                  ;8889AA;
    STA.B $D5,X                                                          ;8889AB;
    TXA                                                                  ;8889AD;
    CLC                                                                  ;8889AE;
    ADC.W #$0007                                                         ;8889AF;
    STA.W $0330                                                          ;8889B2;
    INC.W $0A7A                                                          ;8889B5;

.return:
    PLP                                                                  ;8889B8;
    RTS                                                                  ;8889B9;


HandleXrayScope_State4_DeactivateBeam_RestoreBG2_SecondHalf:
    PHP                                                                  ;8889BA;
    REP #$30                                                             ;8889BB;
    LDX.W #$1000                                                         ;8889BD;
    LDA.W $196E                                                          ;8889C0;
    CMP.W #$0024                                                         ;8889C3;
    BEQ +                                                                ;8889C6;
    LDX.W #$2000                                                         ;8889C8;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;8889CB;
    BEQ +                                                                ;8889CF;
    LDX.W #$4000                                                         ;8889D1;

  + TXA                                                                  ;8889D4;
    TSB.W $1986                                                          ;8889D5;
    LDX.W $0330                                                          ;8889D8;
    CPX.W #$00F0                                                         ;8889DB;
    BPL .return                                                          ;8889DE;
    LDA.W #$0800                                                         ;8889E0;
    STA.B $D0,X                                                          ;8889E3;
    LDA.W #$5800                                                         ;8889E5;
    STA.B $D2,X                                                          ;8889E8;
    LDA.W #$007E                                                         ;8889EA;
    STA.B $D4,X                                                          ;8889ED;
    LDA.B $59                                                            ;8889EF;
    AND.W #$00FC                                                         ;8889F1;
    XBA                                                                  ;8889F4;
    CLC                                                                  ;8889F5;
    ADC.W #$0400                                                         ;8889F6;
    STA.B $D5,X                                                          ;8889F9;
    TXA                                                                  ;8889FB;
    CLC                                                                  ;8889FC;
    ADC.W #$0007                                                         ;8889FD;
    STA.W $0330                                                          ;888A00;
    INC.W $0A7A                                                          ;888A03;

.return:
    PLP                                                                  ;888A06;
    RTS                                                                  ;888A07;


HandleXrayScope_State5_DeactivateBeam_Finish:
    PHP                                                                  ;888A08;
    REP #$30                                                             ;888A09;
    LDX.W #$1000                                                         ;888A0B;
    LDA.W $196E                                                          ;888A0E;
    CMP.W #$0024                                                         ;888A11;
    BEQ +                                                                ;888A14;
    LDX.W #$2000                                                         ;888A16;
    JSL.L CheckIfXrayShouldShowAnyBlocks                                 ;888A19;
    BEQ +                                                                ;888A1D;
    LDX.W #$4000                                                         ;888A1F;

  + TXA                                                                  ;888A22;
    TSB.W $1986                                                          ;888A23;
    LDA.W $0A78                                                          ;888A26;
    BNE .timeIsFrozen                                                    ;888A29;
    PLP                                                                  ;888A2B;
    RTS                                                                  ;888A2C;


.timeIsFrozen:
    STZ.W $0A78                                                          ;888A2D;
    STZ.W $0A7A                                                          ;888A30;
    STZ.W $0A7C                                                          ;888A33;
    STZ.W $0A7E                                                          ;888A36;
    STZ.W $0A82                                                          ;888A39;
    STZ.W $0A84                                                          ;888A3C;
    STZ.W $0A86                                                          ;888A3F;
    LDA.W #$0001                                                         ;888A42;
    STA.W $0A88                                                          ;888A45;
    LDA.W #$9800                                                         ;888A48; $7E
    STA.W $0A89                                                          ;888A4B;
    STZ.W $0A8B                                                          ;888A4E;
    STZ.W $0A8C                                                          ;888A51;
    STZ.W $0A8E                                                          ;888A54;
    STZ.W $0A90                                                          ;888A57;
    JSL.L Set_NonXray_SamusPose                                          ;888A5A;
    LDX.W $18B2                                                          ;888A5E;
    STZ.W $18B4,X                                                        ;888A61;
    LDA.W #$000A                                                         ;888A64;
    JSL.L QueueSound_Lib1_Max6                                           ;888A67;
    SEP #$20                                                             ;888A6B;
    LDA.W $196E                                                          ;888A6D;
    CMP.B #$24                                                           ;888A70;
    BEQ +                                                                ;888A72;
    LDA.B #$80                                                           ;888A74;
    STA.B $76                                                            ;888A76;
    LDA.B #$40                                                           ;888A78;
    STA.B $75                                                            ;888A7A;
    LDA.B #$20                                                           ;888A7C;
    STA.B $74                                                            ;888A7E;

  + LDA.B #$7E                                                           ;888A80;
    STA.B $02                                                            ;888A82;
    REP #$20                                                             ;888A84;
    LDA.W #$9800                                                         ;888A86; $7E
    STA.B $00                                                            ;888A89;
    LDY.W #$01FE                                                         ;888A8B;
    LDA.W #$00FF                                                         ;888A8E;

.loop:
    STA.B [$00],Y                                                        ;888A91;
    DEY                                                                  ;888A93;
    DEY                                                                  ;888A94;
    BPL .loop                                                            ;888A95;
    LDA.W $0A04                                                          ;888A97;
    BEQ .return                                                          ;888A9A;
    STZ.W $09D2                                                          ;888A9C;
    STZ.W $0A04                                                          ;888A9F;

.return:
    PLP                                                                  ;888AA2;
    RTS                                                                  ;888AA3;


Spawn_PowerBombExplosion:
    LDA.W $0A78                                                          ;888AA4;
    BNE .pending                                                         ;888AA7;
    LDA.W #$0001                                                         ;888AA9;
    JSL.L QueueSound                                                     ;888AAC;
    LDA.W #$8000                                                         ;888AB0;
    STA.W $0592                                                          ;888AB3;
    JSL.L Spawn_HDMAObject                                               ;888AB6;
    db $40,$28                                                           ;888ABA;
    dw InstList_PowerBombExplosion_Window2_LeftPosition                  ;888ABC;
    JSL.L Spawn_HDMAObject                                               ;888ABE;
    db $40,$29                                                           ;888AC2;
    dw InstList_PowerBombExplosion_Window2_RightPosition                 ;888AC4;
    RTL                                                                  ;888AC6;


.pending:
    LDA.W #$4000                                                         ;888AC7;
    STA.W $0592                                                          ;888ACA;
    RTL                                                                  ;888ACD;


InstList_PowerBombExplosion_Window2_LeftPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89                     ;888ACE;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;888AD1;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888AD4;
    dl PowerBombExplosion_Setup1_PreExplosion_White                      ;888AD6;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888AD9;
    dl PreInstruction_PowerBombExplosion_1_PreExplosion_White            ;888ADB;
    dw Instruction_HDMAObject_Sleep                                      ;888ADE;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888AE0;
    dl PowerBombExplosion_Setup2_PreExplosion_Yellow                     ;888AE2;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888AE5;
    dl PreInstruction_PowerBombExplosion_2_PreExplosion_Yellow           ;888AE7;
    dw Instruction_HDMAObject_Sleep                                      ;888AEA;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888AEC;
    dl PowerBombExplosion_Setup3_Explosion_Yellow                        ;888AEE;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888AF1;
    dl PreInstruction_PowerBombExplosion_3_Explosion_Yellow              ;888AF3;
    dw Instruction_HDMAObject_Sleep                                      ;888AF6;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888AF8;
    dl PowerBombExplosion_Setup4_Explosion_White                         ;888AFA;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888AFD;
    dl PreInstruction_PowerBombExplosion_4_Explosion_White               ;888AFF;
    dw Instruction_HDMAObject_Sleep                                      ;888B02;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888B04;
    dl PreInstruction_PowerBombExplosion_5_AfterGlow                     ;888B06;
    dw Instruction_HDMAObject_Sleep                                      ;888B09;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;888B0B;
    dl PowerBombExplosion_ClearnUp_TryCrystalFlash                       ;888B0D;
    dw Instruction_HDMAObject_Sleep                                      ;888B10;
    dw Instruction_HDMAObject_Delete                                     ;888B12;

PowerBombExplosion_Setup1_PreExplosion_White:
    SEP #$20                                                             ;888B14;
    LDA.B #$FF                                                           ;888B16;
    STA.L $7EC606                                                        ;888B18;
    LDA.B #$00                                                           ;888B1C;
    STA.L $7EC607                                                        ;888B1E;
    REP #$20                                                             ;888B22;
    LDA.W #$0400                                                         ;888B24;
    STA.W $0CEC                                                          ;888B27;
    LDA.L PowerBomb_PreExplosion_InitialRadiusSpeed                      ;888B2A;
    STA.W $0CF0                                                          ;888B2E;
    RTL                                                                  ;888B31;


PowerBombExplosion_Setup2_PreExplosion_Yellow:
    LDA.W #PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled        ;888B32;
    STA.W $0CF2                                                          ;888B35;
    RTL                                                                  ;888B38;


PowerBombExplosion_Setup3_Explosion_Yellow:
    LDA.W #$0400                                                         ;888B39;
    STA.W $0CEA                                                          ;888B3C;
    LDA.L PowerBombExplosion_InitialRadiusSpeed                          ;888B3F;
    STA.W $0CF0                                                          ;888B43;
    RTL                                                                  ;888B46;


PowerBombExplosion_Setup4_Explosion_White:
    LDA.W #PowerBomb_Explosion_ShapeDefinitionTiles_PreScaled            ;888B47;
    STA.W $0CF2                                                          ;888B4A;
    RTL                                                                  ;888B4D;


PowerBombExplosion_ClearnUp_TryCrystalFlash:
    LDA.W $0AF6                                                          ;888B4E;
    CMP.W $0CE2                                                          ;888B51;
    BNE .clearPBFlag                                                     ;888B54;
    LDA.W $0AFA                                                          ;888B56;
    CMP.W $0CE4                                                          ;888B59;
    BNE .clearPBFlag                                                     ;888B5C;
    PHX                                                                  ;888B5E;
    JSL.L CrystalFlash                                                   ;888B5F;
    PLX                                                                  ;888B63;
    BCC .crystalFlashing                                                 ;888B64;

.clearPBFlag:
    STZ.W $0CEE                                                          ;888B66;

.crystalFlashing:
    STZ.W $0592                                                          ;888B69;
    STZ.W $18B4,X                                                        ;888B6C;
    STZ.W $18B6,X                                                        ;888B6F;
    STZ.W $0CEC                                                          ;888B72;
    STZ.W $0CEA                                                          ;888B75;
    LDA.W #$001E                                                         ;888B78;
    JSL.L Run_Samus_Command                                              ;888B7B;
    RTL                                                                  ;888B7F;


InstList_PowerBombExplosion_Window2_RightPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89                     ;888B80;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;888B83;
    dw Instruction_HDMAObject_PreInstructionInY                          ;888B86;
    dl PreInstruction_PowerBombExplosion_SetLayerBlendingWindow2         ;888B88;
    dw Instruction_HDMAObject_Sleep                                      ;888B8B;
    dw Instruction_HDMAObject_Delete                                     ;888B8D;

PreInstruction_PowerBombExplosion_SetLayerBlendingWindow2:
    LDA.W #$8000                                                         ;888B8F;
    TSB.W $1986                                                          ;888B92;
    RTL                                                                  ;888B95;


PowerBomb_Stage5_HDMAObjectTimer:
    dw $0003                                                             ;888B96;

PreInstruction_PowerBombExplosion_5_AfterGlow:
    LDA.W $0592                                                          ;888B98;
    BMI .exploding                                                       ;888B9B;
    RTL                                                                  ;888B9D;


.exploding:
    DEC.W $1908,X                                                        ;888B9E;
    BPL .return                                                          ;888BA1;
    SEP #$20                                                             ;888BA3;
    DEC.W $1938,X                                                        ;888BA5;
    BEQ .wake                                                            ;888BA8;
    LDA.W $0074                                                          ;888BAA;
    AND.B #$1F                                                           ;888BAD;
    BEQ .green                                                           ;888BAF;
    DEC A                                                                ;888BB1;
    ORA.B #$20                                                           ;888BB2;
    STA.W $0074                                                          ;888BB4;

.green:
    LDA.W $0075                                                          ;888BB7;
    AND.B #$1F                                                           ;888BBA;
    BEQ .blue                                                            ;888BBC;
    DEC A                                                                ;888BBE;
    ORA.B #$40                                                           ;888BBF;
    STA.W $0075                                                          ;888BC1;

.blue:
    LDA.W $0076                                                          ;888BC4;
    AND.B #$1F                                                           ;888BC7;
    BEQ .setTimer                                                        ;888BC9;
    DEC A                                                                ;888BCB;
    ORA.B #$80                                                           ;888BCC;
    STA.W $0076                                                          ;888BCE;

.setTimer:
    LDA.L PowerBomb_Stage5_HDMAObjectTimer                               ;888BD1;
    STA.W $1908,X                                                        ;888BD5;
    REP #$20                                                             ;888BD8;

.return:
    RTL                                                                  ;888BDA;


.wake:
    REP #$20                                                             ;888BDB;
    LDA.W #$0001                                                         ;888BDD;
    STA.W $18E4,X                                                        ;888BE0;
    INC.W $18CC,X                                                        ;888BE3;
    INC.W $18CC,X                                                        ;888BE6;
    RTL                                                                  ;888BE9;


Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen:
    LDA.W $0CE6                                                          ;888BEA;
    CLC                                                                  ;888BED;
    ADC.W $0000,Y                                                        ;888BEE;
    BCS +                                                                ;888BF1;
    LDA.B #$00                                                           ;888BF3;
    STA.L $7EC506,X                                                      ;888BF5;
    INC A                                                                ;888BF9;
    STA.L $7EC406,X                                                      ;888BFA;
    BRA .next                                                            ;888BFE;


  + STA.L $7EC506,X                                                      ;888C00;
    LDA.B #$00                                                           ;888C04;
    STA.L $7EC406,X                                                      ;888C06;

.next:
    INY                                                                  ;888C0A;
    INX                                                                  ;888C0B;
    CPX.W #$00C0                                                         ;888C0C;
    BNE Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen        ;888C0F;
    RTS                                                                  ;888C11;


Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen:
    LDA.W $0000,Y                                                        ;888C12;
    BEQ .return                                                          ;888C15;
    CLC                                                                  ;888C17;
    ADC.W $0CE6                                                          ;888C18;
    BCC +                                                                ;888C1B;
    LDA.B #$FF                                                           ;888C1D;

  + STA.L $7EC506,X                                                      ;888C1F;
    LDA.W $0CE6                                                          ;888C23;
    SEC                                                                  ;888C26;
    SBC.W $0000,Y                                                        ;888C27;
    BCS .storeTable                                                      ;888C2A;
    LDA.B #$00                                                           ;888C2C;

.storeTable:
    STA.L $7EC406,X                                                      ;888C2E;
    INY                                                                  ;888C32;
    INX                                                                  ;888C33;
    CPX.W #$00C0                                                         ;888C34;
    BNE Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen       ;888C37;

.return:
    RTS                                                                  ;888C39;


Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen:
    LDA.W $0CE6                                                          ;888C3A;
    SEC                                                                  ;888C3D;
    SBC.W $0000,Y                                                        ;888C3E;
    BCC +                                                                ;888C41;
    LDA.B #$FF                                                           ;888C43;
    STA.L $7EC406,X                                                      ;888C45;
    DEC A                                                                ;888C49;
    STA.L $7EC506,X                                                      ;888C4A;
    BRA .next                                                            ;888C4E;


  + STA.L $7EC406,X                                                      ;888C50;
    LDA.B #$FF                                                           ;888C54;
    STA.L $7EC506,X                                                      ;888C56;

.next:
    INY                                                                  ;888C5A;
    INX                                                                  ;888C5B;
    CPX.W #$00C0                                                         ;888C5C;
    BNE Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen       ;888C5F;
    RTS                                                                  ;888C61;


Calculate_PowerBombExplosion_HDMADataTablePointers:
    LDA.W $0592                                                          ;888C62;
    BMI .exploding                                                       ;888C65;
    RTL                                                                  ;888C67;


.exploding:
    LDA.W $0CE2                                                          ;888C68;
    SEC                                                                  ;888C6B;
    SBC.W $0911                                                          ;888C6C;
    CLC                                                                  ;888C6F;
    ADC.W #$0100                                                         ;888C70;
    CMP.W #$0300                                                         ;888C73;
    BCC +                                                                ;888C76;
    BRA .offScreen                                                       ;888C78;


  + STA.W $0CE6                                                          ;888C7A;
    LDA.W $0CE4                                                          ;888C7D;
    SEC                                                                  ;888C80;
    SBC.W $0915                                                          ;888C81;
    CLC                                                                  ;888C84;
    ADC.W #$0100                                                         ;888C85;
    CMP.W #$0300                                                         ;888C88;
    BCC .onScreen                                                        ;888C8B;

.offScreen:
    LDA.W #$0000                                                         ;888C8D;

.onScreen:
    EOR.W #$03FF                                                         ;888C90;
    SEC                                                                  ;888C93;
    SBC.W #$0100                                                         ;888C94;
    STA.W $0CE8                                                          ;888C97;
    LDA.W $0CEA                                                          ;888C9A;
    AND.W #$FF00                                                         ;888C9D;
    BNE +                                                                ;888CA0;
    STZ.W $0CE8                                                          ;888CA2;

  + LDA.W $18C0,X                                                        ;888CA5;
    AND.W #$00FF                                                         ;888CA8;
    TAY                                                                  ;888CAB;
    LDA.W $0CE8                                                          ;888CAC;
    ASL A                                                                ;888CAF;
    CLC                                                                  ;888CB0;
    ADC.W $0CE8                                                          ;888CB1;
    STA.B $16                                                            ;888CB4;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below     ;888CB6;
    STA.W $18D8,X                                                        ;888CB9;
    LDA.B $16                                                            ;888CBC;
    CLC                                                                  ;888CBE;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below    ;888CBF;
    STA.W $18DA,X                                                        ;888CC2;
    RTL                                                                  ;888CC5;


Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888CC6;
    STA.W $4203                                                          ;888CC9;
    NOP                                                                  ;888CCC;
    NOP                                                                  ;888CCD;
    NOP                                                                  ;888CCE;
    LDA.W $4217                                                          ;888CCF;
    STA.B $14                                                            ;888CD2;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;888CD4;
    STA.W $4203                                                          ;888CD7;
    NOP                                                                  ;888CDA;
    LDA.W $0CE6                                                          ;888CDB;
    CLC                                                                  ;888CDE;
    ADC.W $4217                                                          ;888CDF;
    BCS .moveToHighByte                                                  ;888CE2;
    LDA.B #$00                                                           ;888CE4;
    XBA                                                                  ;888CE6;
    LDA.B #$FF                                                           ;888CE7;
    BRA .loopDataTable                                                   ;888CE9;


.moveToHighByte:
    XBA                                                                  ;888CEB;
    LDA.B #$00                                                           ;888CEC;

.loopDataTable:
    STA.L $7EC406,X                                                      ;888CEE;
    XBA                                                                  ;888CF2;
    STA.L $7EC506,X                                                      ;888CF3;
    XBA                                                                  ;888CF7;
    CPX.B $14                                                            ;888CF8;
    BEQ .nextShapeDefinite                                               ;888CFA;
    DEX                                                                  ;888CFC;
    JMP.W .loopDataTable                                                 ;888CFD;


.nextShapeDefinite:
    INY                                                                  ;888D00;
    BPL Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen      ;888D01;
    RTS                                                                  ;888D03;


Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888D04;
    STA.W $4203                                                          ;888D07;
    NOP                                                                  ;888D0A;
    NOP                                                                  ;888D0B;
    NOP                                                                  ;888D0C;
    LDA.W $4217                                                          ;888D0D;
    STA.B $14                                                            ;888D10;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;888D12;
    STA.W $4203                                                          ;888D15;
    NOP                                                                  ;888D18;
    LDA.W $0CE6                                                          ;888D19;
    CLC                                                                  ;888D1C;
    ADC.W $4217                                                          ;888D1D;
    BCC .lowByte                                                         ;888D20;
    LDA.B #$FF                                                           ;888D22;

.lowByte:
    XBA                                                                  ;888D24;
    LDA.W $0CE6                                                          ;888D25;
    SEC                                                                  ;888D28;
    SBC.W $4217                                                          ;888D29;
    BCS .loopDataTable                                                   ;888D2C;
    LDA.B #$00                                                           ;888D2E;

.loopDataTable:
    STA.L $7EC406,X                                                      ;888D30;
    XBA                                                                  ;888D34;
    STA.L $7EC506,X                                                      ;888D35;
    XBA                                                                  ;888D39;
    CPX.B $14                                                            ;888D3A;
    BEQ .next                                                            ;888D3C;
    DEX                                                                  ;888D3E;
    JMP.W .loopDataTable                                                 ;888D3F;


.next:
    INY                                                                  ;888D42;
    BPL Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen      ;888D43;
    RTS                                                                  ;888D45;


Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888D46;
    STA.W $4203                                                          ;888D49;
    NOP                                                                  ;888D4C;
    NOP                                                                  ;888D4D;
    NOP                                                                  ;888D4E;
    LDA.W $4217                                                          ;888D4F;
    STA.B $14                                                            ;888D52;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;888D54;
    STA.W $4203                                                          ;888D57;
    NOP                                                                  ;888D5A;
    LDA.W $0CE6                                                          ;888D5B;
    SEC                                                                  ;888D5E;
    SBC.W $4217                                                          ;888D5F;
    BCC .lessThan100                                                     ;888D62;
    LDA.B #$FF                                                           ;888D64;
    XBA                                                                  ;888D66;
    LDA.B #$00                                                           ;888D67;
    BRA +                                                                ;888D69;


.lessThan100:
    XBA                                                                  ;888D6B;
    LDA.B #$FF                                                           ;888D6C;

  + XBA                                                                  ;888D6E;

.loopDataTable:
    STA.L $7EC406,X                                                      ;888D6F;
    XBA                                                                  ;888D73;
    STA.L $7EC506,X                                                      ;888D74;
    XBA                                                                  ;888D78;
    CPX.B $14                                                            ;888D79;
    BEQ .nextShapeDefinition                                             ;888D7B;
    DEX                                                                  ;888D7D;
    JMP.W .loopDataTable                                                 ;888D7E;


.nextShapeDefinition:
    INY                                                                  ;888D81;
    BPL Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen     ;888D82;
    RTS                                                                  ;888D84;


PowerBombExplosion_Colors:
; Indexed by [power bomb explosion radius] / 800h
; Red, green, blue. Range 0..1Fh
; Yellow section
  .red
    db $0E                                                               ;888D85;
  .green
    db     $0E                                                           ;888D86;
  .blue
    db         $0A                                                       ;888D87;
    db $0F,$0F,$09
    db $10,$10,$08
    db $11,$11,$07
    db $12,$12,$06
    db $13,$13,$05
    db $14,$14,$04
    db $15,$15,$03
    db $16,$16,$02
    db $17,$17,$01
    db $18,$18,$00
    db $19,$19,$00
    db $1A,$1A,$00
    db $1A,$1A,$00
; White section
    db $1A,$1A,$1A
    db $1A,$1A,$1A
    db $1B,$1B,$1B
    db $1B,$1B,$1B
    db $1C,$1C,$1C
    db $1B,$1B,$1B
    db $1A,$1A,$1A
    db $1A,$18,$18
    db $1A,$17,$17
    db $19,$16,$16
    db $18,$15,$15
    db $17,$15,$15
    db $16,$14,$14
    db $15,$13,$13
    db $12,$10,$10
    db $12,$0E,$0E
    db $12,$0D,$0D
    db $12,$0D,$0D

PowerBombExplosion_InitialRadiusSpeed:
    dw $0000                                                             ;888DE5;

PowerBombExplosion_RadiusAcceleration:
    dw $0030                                                             ;888DE7;

PreInstruction_PowerBombExplosion_3_Explosion_Yellow:
    LDA.W $0592                                                          ;888DE9;
    BMI .exploding                                                       ;888DEC;
    RTL                                                                  ;888DEE;


.exploding:
    PHP                                                                  ;888DEF;
    PHB                                                                  ;888DF0;
    REP #$30                                                             ;888DF1;
    PHX                                                                  ;888DF3;
    PHY                                                                  ;888DF4;
    JSL.L Calculate_PowerBombExplosion_HDMADataTablePointers             ;888DF5;
    PEA.W $8800                                                          ;888DF9;
    PLB                                                                  ;888DFC;
    PLB                                                                  ;888DFD;
    SEP #$30                                                             ;888DFE;
    LDA.B #$00                                                           ;888E00;
    XBA                                                                  ;888E02;
    LDY.B #$60                                                           ;888E03;
    LDA.W $0CEB                                                          ;888E05;
    STA.W $4202                                                          ;888E08;
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset     ;888E0B;
    STA.W $4203                                                          ;888E0E;
    NOP                                                                  ;888E11;
    NOP                                                                  ;888E12;
    NOP                                                                  ;888E13;
    LDA.W $4217                                                          ;888E14;
    STA.B $12                                                            ;888E17;
    TAX                                                                  ;888E19;
    PEA.W .loopPadDataTableBegin-1                                       ;888E1A;
    LDA.W $0CE7                                                          ;888E1D;
    AND.B #$FF                                                           ;888E20;
    BEQ .offScreenLeft                                                   ;888E22;
    DEC A                                                                ;888E24;
    BEQ .onScreen                                                        ;888E25;
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen   ;888E27;


.onScreen:
    JMP.W Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen    ;888E2A;


.offScreenLeft:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen    ;888E2D;


.loopPadDataTableBegin:
    STA.L $7EC406,X                                                      ;888E30;
    XBA                                                                  ;888E34;
    STA.L $7EC506,X                                                      ;888E35;
    XBA                                                                  ;888E39;
    DEX                                                                  ;888E3A;
    BPL .loopPadDataTableBegin                                           ;888E3B;
    LDX.B $12                                                            ;888E3D;
    INX                                                                  ;888E3F;
    CPX.B #$C0                                                           ;888E40;
    BEQ .finishedTable                                                   ;888E42;
    LDA.B #$FF                                                           ;888E44;

.loopPadDataTableEnd:
    STA.L $7EC406,X                                                      ;888E46;
    INC A                                                                ;888E4A;
    STA.L $7EC506,X                                                      ;888E4B;
    DEC A                                                                ;888E4F;
    INX                                                                  ;888E50;
    CPX.B #$C0                                                           ;888E51;
    BNE .loopPadDataTableEnd                                             ;888E53;

.finishedTable:
    LDA.W $0CEB                                                          ;888E55;
    LSR A                                                                ;888E58;
    LSR A                                                                ;888E59;
    LSR A                                                                ;888E5A;
    AND.B #$1F                                                           ;888E5B;
    STA.B $12                                                            ;888E5D;
    ASL A                                                                ;888E5F;
    CLC                                                                  ;888E60;
    ADC.B $12                                                            ;888E61;
    TAX                                                                  ;888E63;
    LDA.L PowerBombExplosion_Colors_red,X                                ;888E64;
    ORA.B #$20                                                           ;888E68;
    STA.W $0074                                                          ;888E6A; >.<
    LDA.L PowerBombExplosion_Colors_green,X                              ;888E6D;
    ORA.B #$40                                                           ;888E71;
    STA.W $0075                                                          ;888E73; >.<
    LDA.L PowerBombExplosion_Colors_blue,X                               ;888E76;
    ORA.B #$80                                                           ;888E7A;
    STA.W $0076                                                          ;888E7C; >.<
    REP #$30                                                             ;888E7F;
    PLY                                                                  ;888E81;
    PLX                                                                  ;888E82;
    LDA.W $0CEA                                                          ;888E83;
    CLC                                                                  ;888E86;
    ADC.W $0CF0                                                          ;888E87;
    STA.W $0CEA                                                          ;888E8A;
    CMP.W #$8600                                                         ;888E8D;
    BCC .lessThan8600                                                    ;888E90;
    LDA.W #$0001                                                         ;888E92;
    STA.W $18E4,X                                                        ;888E95;
    INC.W $18CC,X                                                        ;888E98;
    INC.W $18CC,X                                                        ;888E9B;
    STZ.W $1908,X                                                        ;888E9E;
    JMP.W .return                                                        ;888EA1;


.lessThan8600:
    LDA.W $0CF0                                                          ;888EA4;
    CLC                                                                  ;888EA7;
    ADC.L PowerBombExplosion_RadiusAcceleration                          ;888EA8;
    STA.W $0CF0                                                          ;888EAC;

.return:
    PLB                                                                  ;888EAF;
    PLP                                                                  ;888EB0;
    RTL                                                                  ;888EB1;


PreInstruction_PowerBombExplosion_4_Explosion_White:
    LDA.W $0592                                                          ;888EB2;
    BMI .exploding                                                       ;888EB5;
    RTL                                                                  ;888EB7;


.exploding:
    PHP                                                                  ;888EB8;
    PHB                                                                  ;888EB9;
    REP #$30                                                             ;888EBA;
    PHX                                                                  ;888EBC;
    PHY                                                                  ;888EBD;
    JSL.L Calculate_PowerBombExplosion_HDMADataTablePointers             ;888EBE;
    PEA.W $8800                                                          ;888EC2;
    PLB                                                                  ;888EC5;
    PLB                                                                  ;888EC6;
    LDY.W $0CF2                                                          ;888EC7;
    LDX.W #$0000                                                         ;888ECA;
    SEP #$20                                                             ;888ECD;
    PEA.W .manualReturn-1                                                ;888ECF;
    LDA.W $0CE7                                                          ;888ED2;
    AND.B #$FF                                                           ;888ED5;
    BEQ .offScreenLeft                                                   ;888ED7;
    DEC A                                                                ;888ED9;
    BEQ .onScreen                                                        ;888EDA;
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen     ;888EDC;


.onScreen:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen     ;888EDF;


.offScreenLeft:
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen      ;888EE2;


.manualReturn:
    SEP #$30                                                             ;888EE5;
    LDA.B #$00                                                           ;888EE7;
    XBA                                                                  ;888EE9;
    LDA.W $0CEB                                                          ;888EEA;
    LSR A                                                                ;888EED;
    LSR A                                                                ;888EEE;
    LSR A                                                                ;888EEF;
    AND.B #$1F                                                           ;888EF0;
    STA.B $12                                                            ;888EF2;
    ASL A                                                                ;888EF4;
    CLC                                                                  ;888EF5;
    ADC.B $12                                                            ;888EF6;
    TAX                                                                  ;888EF8;
    LDA.L PowerBombExplosion_Colors_red,X                                ;888EF9;
    ORA.B #$20                                                           ;888EFD;
    STA.W $0074                                                          ;888EFF; >.<
    LDA.L PowerBombExplosion_Colors_green,X                              ;888F02;
    ORA.B #$40                                                           ;888F06;
    STA.W $0075                                                          ;888F08; >.<
    LDA.L PowerBombExplosion_Colors_blue,X                               ;888F0B;
    ORA.B #$80                                                           ;888F0F;
    STA.W $0076                                                          ;888F11; >.<
    REP #$30                                                             ;888F14;
    PLY                                                                  ;888F16;
    PLX                                                                  ;888F17;
    LDA.W $0CF2                                                          ;888F18;
    CLC                                                                  ;888F1B;
    ADC.W #$00C0                                                         ;888F1C;
    STA.W $0CF2                                                          ;888F1F;
    CMP.W #PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled        ;888F22;
    BNE .notPreExplosion                                                 ;888F25;
    LDA.W #$0001                                                         ;888F27;
    STA.W $18E4,X                                                        ;888F2A;
    INC.W $18CC,X                                                        ;888F2D;
    INC.W $18CC,X                                                        ;888F30;
    STZ.W $1908,X                                                        ;888F33;
    LDA.W #$0020                                                         ;888F36;
    STA.W $1938,X                                                        ;888F39;

.notPreExplosion:
    LDA.W $0CEA                                                          ;888F3C;
    CLC                                                                  ;888F3F;
    ADC.W $0CF0                                                          ;888F40;
    BCS .return                                                          ;888F43;
    STA.W $0CEA                                                          ;888F45;
    LDA.W $0CF0                                                          ;888F48;
    CLC                                                                  ;888F4B;
    ADC.L PowerBombExplosion_RadiusAcceleration                          ;888F4C;
    STA.W $0CF0                                                          ;888F50;

.return:
    PLB                                                                  ;888F53;
    PLP                                                                  ;888F54;
    RTL                                                                  ;888F55;


Calculate_PowerBombPreExplosion_HDMAObjectTablePointers:
    LDA.W $0592                                                          ;888F56;
    BMI .exploding                                                       ;888F59;
    RTL                                                                  ;888F5B;


.exploding:
    LDA.W $0CE2                                                          ;888F5C;
    SEC                                                                  ;888F5F;
    SBC.W $0911                                                          ;888F60;
    CLC                                                                  ;888F63;
    ADC.W #$0100                                                         ;888F64;
    CMP.W #$0300                                                         ;888F67;
    BCC +                                                                ;888F6A;
    BRA .offScreen                                                       ;888F6C;


  + STA.W $0CE6                                                          ;888F6E;
    LDA.W $0CE4                                                          ;888F71;
    SEC                                                                  ;888F74;
    SBC.W $0915                                                          ;888F75;
    CLC                                                                  ;888F78;
    ADC.W #$0100                                                         ;888F79;
    CMP.W #$0300                                                         ;888F7C;
    BCC .onScreen                                                        ;888F7F;

.offScreen:
    LDA.W #$0000                                                         ;888F81;

.onScreen:
    EOR.W #$03FF                                                         ;888F84;
    SEC                                                                  ;888F87;
    SBC.W #$0100                                                         ;888F88;
    STA.W $0CE8                                                          ;888F8B;
    LDA.W $0CEC                                                          ;888F8E;
    AND.W #$FF00                                                         ;888F91;
    BNE +                                                                ;888F94;
    STZ.W $0CE8                                                          ;888F96;

  + LDA.W $18C0,X                                                        ;888F99;
    AND.W #$00FF                                                         ;888F9C;
    TAY                                                                  ;888F9F;
    LDA.W $0CE8                                                          ;888FA0;
    ASL A                                                                ;888FA3;
    CLC                                                                  ;888FA4;
    ADC.W $0CE8                                                          ;888FA5;
    STA.B $16                                                            ;888FA8;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below     ;888FAA;
    STA.W $18D8,X                                                        ;888FAD;
    LDA.B $16                                                            ;888FB0;
    CLC                                                                  ;888FB2;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below    ;888FB3;
    STA.W $18DA,X                                                        ;888FB6;
    RTL                                                                  ;888FB9;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CalcPowerBombRelatedHDMATables_Scaled_Left_888FBA:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888FBA;
    STA.W $4203                                                          ;888FBD;
    NOP                                                                  ;888FC0;
    NOP                                                                  ;888FC1;
    NOP                                                                  ;888FC2;
    LDA.W $4217                                                          ;888FC3;
    STA.B $14                                                            ;888FC6;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;888FC8;
    STA.W $4203                                                          ;888FCB;
    NOP                                                                  ;888FCE;
    LDA.W $0CE6                                                          ;888FCF;
    CLC                                                                  ;888FD2;
    ADC.W $4217                                                          ;888FD3;
    BCS +                                                                ;888FD6;
    LDA.B #$00                                                           ;888FD8;
    XBA                                                                  ;888FDA;
    LDA.B #$FF                                                           ;888FDB;
    BRA .loop                                                            ;888FDD;


  + XBA                                                                  ;888FDF;
    LDA.B #$00                                                           ;888FE0;

.loop:
    STA.L $7EC406,X                                                      ;888FE2;
    XBA                                                                  ;888FE6;
    STA.L $7EC506,X                                                      ;888FE7;
    XBA                                                                  ;888FEB;
    CPX.B $14                                                            ;888FEC;
    BEQ .next                                                            ;888FEE;
    DEX                                                                  ;888FF0;
    JMP.W .loop                                                          ;888FF1;


.next:
    INY                                                                  ;888FF4;
    BPL UNUSED_CalcPowerBombRelatedHDMATables_Scaled_Left_888FBA         ;888FF5;
    RTS                                                                  ;888FF7;


UNUSED_CalcPBRelatedHDMADataTables_Scaled_OnScreen_888FF8:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;888FF8;
    STA.W $4203                                                          ;888FFB;
    NOP                                                                  ;888FFE;
    NOP                                                                  ;888FFF;
    NOP                                                                  ;889000;
    LDA.W $4217                                                          ;889001;
    STA.B $14                                                            ;889004;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;889006;
    STA.W $4203                                                          ;889009;
    NOP                                                                  ;88900C;
    LDA.W $0CE6                                                          ;88900D;
    CLC                                                                  ;889010;
    ADC.W $4217                                                          ;889011;
    BCC +                                                                ;889014;
    LDA.B #$FF                                                           ;889016;

  + XBA                                                                  ;889018;
    LDA.W $0CE6                                                          ;889019;
    SEC                                                                  ;88901C;
    SBC.W $4217                                                          ;88901D;
    BCS .loop                                                            ;889020;
    LDA.B #$00                                                           ;889022;

.loop:
    STA.L $7EC406,X                                                      ;889024;
    XBA                                                                  ;889028;
    STA.L $7EC506,X                                                      ;889029;
    XBA                                                                  ;88902D;
    CPX.B $14                                                            ;88902E;
    BEQ .next                                                            ;889030;
    DEX                                                                  ;889032;
    JMP.W .loop                                                          ;889033;


.next:
    INY                                                                  ;889036;
    BPL UNUSED_CalcPBRelatedHDMADataTables_Scaled_OnScreen_888FF8        ;889037;
    RTS                                                                  ;889039;


UNUSED_CalPBRelatedHDMADataTables_Scaled_OnScreen_88903A:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;88903A;
    STA.W $4203                                                          ;88903D;
    NOP                                                                  ;889040;
    NOP                                                                  ;889041;
    NOP                                                                  ;889042;
    LDA.W $4217                                                          ;889043;
    STA.B $14                                                            ;889046;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;889048;
    STA.W $4203                                                          ;88904B;
    NOP                                                                  ;88904E;
    LDA.W $0CE6                                                          ;88904F;
    SEC                                                                  ;889052;
    SBC.W $4217                                                          ;889053;
    BCC .lowByteFF                                                       ;889056;
    LDA.B #$FF                                                           ;889058;
    XBA                                                                  ;88905A;
    LDA.B #$00                                                           ;88905B;
    BRA +                                                                ;88905D;


.lowByteFF:
    XBA                                                                  ;88905F;
    LDA.B #$FF                                                           ;889060;

  + XBA                                                                  ;889062;

.loop:
    STA.L $7EC406,X                                                      ;889063;
    XBA                                                                  ;889067;
    STA.L $7EC506,X                                                      ;889068;
    XBA                                                                  ;88906C;
    CPX.B $14                                                            ;88906D;
    BEQ .next                                                            ;88906F;
    DEX                                                                  ;889071;
    JMP.W .loop                                                          ;889072;


.next:
    INY                                                                  ;889075;
    BPL UNUSED_CalPBRelatedHDMADataTables_Scaled_OnScreen_88903A         ;889076;
    RTS                                                                  ;889078;
endif ; !FEATURE_KEEP_UNREFERENCED


PowerBomb_PreExplosion_Colors:
; Indexed by [power bomb pre-explosion radius] / 800h
; Red, green, blue. Range 0..1Fh
; White section
  .red
    db $10                                                               ;889079;
  .green
    db $10                                                               ;88907A;
  .blue
    db $10                                                               ;88907B;
    db $04,$04,$04
    db $06,$06,$06
    db $08,$08,$08
    db $0A,$0A,$0A
    db $0C,$0C,$0C
    db $0E,$0E,$0A
; Yellow section
    db $10,$10,$08
    db $12,$12,$08
    db $14,$14,$08
    db $16,$16,$08
    db $18,$18,$08
    db $1A,$1A,$0A
    db $18,$18,$08
    db $16,$16,$06
    db $14,$14,$04

if !FEATURE_KEEP_UNREFERENCED
UNUSED_PowerBomb_ExplosionRelated_Colors_8890A9:
; These might have been used for the after-glow in earlier development
    db $13,$13,$0F                                                       ;8890A9;
    db $11,$11,$0E
    db $0F,$0F,$0D
    db $0D,$0D,$0C
    db $0B,$0B,$0B
    db $0A,$0A,$0A
    db $09,$09,$09
    db $08,$08,$08
    db $07,$07,$07
    db $06,$06,$06
    db $05,$05,$05
    db $04,$04,$04
    db $03,$03,$03
    db $02,$02,$02
    db $01,$01,$01
    db $00,$00,$00

UNUSED_PowerBombColors_8890D9:
    dw $0001                                                             ;8890D9;
endif ; !FEATURE_KEEP_UNREFERENCED

PowerBomb_PreExplosion_InitialRadiusSpeed:
    dw $3000                                                             ;8890DB;

PowerBomb_PreExplosion_RadiusAcceleration:
    dw $0080                                                             ;8890DD;

PreInstruction_PowerBombExplosion_1_PreExplosion_White:
    LDA.W $0592                                                          ;8890DF;
    BMI .exploding                                                       ;8890E2;
    RTL                                                                  ;8890E4;


.exploding:
    PHP                                                                  ;8890E5;
    PHB                                                                  ;8890E6;
    REP #$30                                                             ;8890E7;
    PHX                                                                  ;8890E9;
    PHY                                                                  ;8890EA;
    JSL.L Calculate_PowerBombPreExplosion_HDMAObjectTablePointers        ;8890EB;
    PEA.W $8800                                                          ;8890EF;
    PLB                                                                  ;8890F2;
    PLB                                                                  ;8890F3;
    SEP #$30                                                             ;8890F4;
    LDA.B #$00                                                           ;8890F6;
    XBA                                                                  ;8890F8;
    LDY.B #$60                                                           ;8890F9;
    LDA.W $0CED                                                          ;8890FB;
    STA.W $4202                                                          ;8890FE;
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset     ;889101;
    STA.W $4203                                                          ;889104;
    NOP                                                                  ;889107;
    NOP                                                                  ;889108;
    NOP                                                                  ;889109;
    LDA.W $4217                                                          ;88910A;
    STA.B $12                                                            ;88910D;
    TAX                                                                  ;88910F;
    PEA.W .loopPadDataTableBegin-1                                       ;889110;
    LDA.W $0CE7                                                          ;889113;
    AND.B #$FF                                                           ;889116;
    BEQ .offScreenLeft                                                   ;889118;
    DEC A                                                                ;88911A;
    BEQ .onScreen                                                        ;88911B;
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_RightOfScreen   ;88911D;


.onScreen:
    JMP.W Calculate_PowerBombExplosion_HDMADataTables_Scaled_OnScreen    ;889120;


.offScreenLeft:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_Scaled_LeftOfScreen    ;889123;


.loopPadDataTableBegin:
    STA.L $7EC406,X                                                      ;889126;
    XBA                                                                  ;88912A;
    STA.L $7EC506,X                                                      ;88912B;
    XBA                                                                  ;88912F;
    DEX                                                                  ;889130;
    BPL .loopPadDataTableBegin                                           ;889131;
    LDX.B $12                                                            ;889133;
    INX                                                                  ;889135;
    CPX.B #$C0                                                           ;889136;
    BEQ .finishedTable                                                   ;889138;
    LDA.B #$FF                                                           ;88913A;

.loopPadDataTableEnd:
    STA.L $7EC406,X                                                      ;88913C;
    INC A                                                                ;889140;
    STA.L $7EC506,X                                                      ;889141;
    DEC A                                                                ;889145;
    INX                                                                  ;889146;
    CPX.B #$C0                                                           ;889147;
    BNE .loopPadDataTableEnd                                             ;889149;

.finishedTable:
    LDA.W $0CED                                                          ;88914B;
    LSR A                                                                ;88914E;
    LSR A                                                                ;88914F;
    LSR A                                                                ;889150;
    AND.B #$0F                                                           ;889151;
    STA.B $12                                                            ;889153;
    ASL A                                                                ;889155;
    CLC                                                                  ;889156;
    ADC.B $12                                                            ;889157;
    TAX                                                                  ;889159;
    LDA.L PowerBomb_PreExplosion_Colors_red,X                            ;88915A;
    ORA.B #$20                                                           ;88915E;
    STA.W $0074                                                          ;889160; >.<
    LDA.L PowerBomb_PreExplosion_Colors_green,X                          ;889163;
    ORA.B #$40                                                           ;889167;
    STA.W $0075                                                          ;889169; >.<
    LDA.L PowerBomb_PreExplosion_Colors_blue,X                           ;88916C;
    ORA.B #$80                                                           ;889170;
    STA.W $0076                                                          ;889172; >.<
    REP #$30                                                             ;889175;
    PLY                                                                  ;889177;
    PLX                                                                  ;889178;
    LDA.W $0CEC                                                          ;889179;
    CLC                                                                  ;88917C;
    ADC.W $0CF0                                                          ;88917D;
    STA.W $0CEC                                                          ;889180;
    CMP.W #$9200                                                         ;889183; radius
    BCC .lessThan9200                                                    ;889186;
    LDA.W #$0001                                                         ;889188;
    STA.W $18E4,X                                                        ;88918B;
    INC.W $18CC,X                                                        ;88918E;
    INC.W $18CC,X                                                        ;889191;
    STZ.W $1908,X                                                        ;889194;
    JMP.W .return                                                        ;889197;


.lessThan9200:
    LDA.W $0CF0                                                          ;88919A;
    SEC                                                                  ;88919D;
    SBC.L PowerBomb_PreExplosion_RadiusAcceleration                      ;88919E;
    STA.W $0CF0                                                          ;8891A2;

.return:
    PLB                                                                  ;8891A5;
    PLP                                                                  ;8891A6;
    RTL                                                                  ;8891A7;


PreInstruction_PowerBombExplosion_2_PreExplosion_Yellow:
    LDA.W $0592                                                          ;8891A8;
    BMI .exploding                                                       ;8891AB;
    RTL                                                                  ;8891AD;


.exploding:
    PHP                                                                  ;8891AE;
    PHB                                                                  ;8891AF;
    REP #$30                                                             ;8891B0;
    PHX                                                                  ;8891B2;
    PHY                                                                  ;8891B3;
    JSL.L Calculate_PowerBombPreExplosion_HDMAObjectTablePointers        ;8891B4;
    PEA.W $8800                                                          ;8891B8;
    PLB                                                                  ;8891BB;
    PLB                                                                  ;8891BC;
    LDY.W $0CF2                                                          ;8891BD;
    LDX.W #$0000                                                         ;8891C0;
    SEP #$20                                                             ;8891C3;
    PEA.W .manualReturn-1                                                ;8891C5;
    LDA.W $0CE7                                                          ;8891C8;
    AND.B #$FF                                                           ;8891CB;
    BEQ .offScreenLeft                                                   ;8891CD;
    DEC A                                                                ;8891CF;
    BEQ .onScreen                                                        ;8891D0;
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_RightOfScreen     ;8891D2;


.onScreen:
    JMP.W Calculate_PowerBombExplo_HDMADataTables_PreScaled_OnScreen     ;8891D5;


.offScreenLeft:
    JMP.W Calc_PowerBombExplo_HDMADataTables_PreScaled_LeftOfScreen      ;8891D8;


.manualReturn:
    SEP #$30                                                             ;8891DB;
    LDA.B #$00                                                           ;8891DD;
    XBA                                                                  ;8891DF;
    LDA.W $0CED                                                          ;8891E0;
    LSR A                                                                ;8891E3;
    LSR A                                                                ;8891E4;
    LSR A                                                                ;8891E5;
    AND.B #$0F                                                           ;8891E6;
    STA.B $12                                                            ;8891E8;
    ASL A                                                                ;8891EA;
    CLC                                                                  ;8891EB;
    ADC.B $12                                                            ;8891EC;
    TAX                                                                  ;8891EE;
    LDA.L PowerBomb_PreExplosion_Colors_red,X                            ;8891EF;
    ORA.B #$20                                                           ;8891F3;
    STA.W $0074                                                          ;8891F5;
    LDA.L PowerBomb_PreExplosion_Colors_green,X                          ;8891F8;
    ORA.B #$40                                                           ;8891FC;
    STA.W $0075                                                          ;8891FE;
    LDA.L PowerBomb_PreExplosion_Colors_blue,X                           ;889201;
    ORA.B #$80                                                           ;889205;
    STA.W $0076                                                          ;889207;
    REP #$30                                                             ;88920A;
    PLY                                                                  ;88920C;
    PLX                                                                  ;88920D;
    LDA.W $0CF2                                                          ;88920E;
    CLC                                                                  ;889211;
    ADC.W #$00C0                                                         ;889212;
    STA.W $0CF2                                                          ;889215;
    CMP.W #PowerBomb_ShapeDefinitionTiles_Optimization_A206              ;889218;
    BNE .notA206                                                         ;88921B;
    LDA.W #$0001                                                         ;88921D;
    STA.W $18E4,X                                                        ;889220;
    INC.W $18CC,X                                                        ;889223;
    INC.W $18CC,X                                                        ;889226;
    STZ.W $1908,X                                                        ;889229;

.notA206:
    LDA.W $0CEC                                                          ;88922C;
    CLC                                                                  ;88922F;
    ADC.W $0CF0                                                          ;889230;
    BCS .return                                                          ;889233;
    STA.W $0CEC                                                          ;889235;
    LDA.W $0CF0                                                          ;889238;
    SEC                                                                  ;88923B;
    SBC.L PowerBomb_PreExplosion_RadiusAcceleration                      ;88923C;
    STA.W $0CF0                                                          ;889240;

.return:
    PLB                                                                  ;889243;
    PLP                                                                  ;889244;
    RTL                                                                  ;889245;


PowerBomb_Explosion_ShapeDefinitionTiles_PreScaled:
; Defines the shape of (the bottom) half of a power bomb explosion
; Each byte defines the width of the power bomb explosion for that pixel-row, C0h pixel-rows total
; One line per frame of explosion
    db $7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7E,$7E,$7E   ;889246;
    db $7E,$7D,$7D,$7D,$7D,$7D,$7C,$7C,$7B,$7B,$7B,$7A,$7A,$7A,$79,$79   ;889256;
    db $78,$78,$77,$77,$76,$76,$75,$75,$74,$74,$73,$72,$71,$71,$70,$6F   ;889266;
    db $6E,$6E,$6D,$6C,$6B,$6A,$69,$69,$68,$67,$66,$65,$63,$62,$61,$60   ;889276;
    db $5F,$5E,$5D,$5C,$5A,$59,$57,$56,$54,$53,$51,$4F,$4E,$4C,$4A,$49   ;889286;
    db $47,$45,$43,$40,$3E,$3B,$39,$36,$33,$30,$2C,$28,$25,$1F,$1A,$12   ;889296;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892A6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892B6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892C6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892D6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892E6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8892F6;
    db $86,$86,$86,$86,$86,$86,$86,$86,$86,$85,$85,$85,$85,$85,$85,$85   ;889306;
    db $84,$84,$84,$84,$84,$83,$83,$83,$82,$82,$82,$81,$81,$81,$80,$80   ;889316;
    db $80,$7F,$7F,$7E,$7E,$7D,$7C,$7C,$7B,$7B,$7A,$7A,$79,$78,$77,$77   ;889326;
    db $76,$76,$75,$74,$73,$72,$71,$70,$6F,$6F,$6E,$6D,$6C,$6B,$6A,$68   ;889336;
    db $67,$66,$65,$64,$63,$62,$61,$5F,$5E,$5D,$5B,$5A,$58,$56,$55,$53   ;889346;
    db $52,$50,$4E,$4C,$4A,$48,$46,$45,$42,$40,$3D,$3B,$37,$34,$31,$2D   ;889356;
    db $29,$27,$21,$1B,$13,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889366;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889376;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889386;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889396;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8893A6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8893B6;
    db $8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8D,$8C,$8C,$8C,$8C,$8C,$8C   ;8893C6;
    db $8C,$8B,$8B,$8B,$8B,$8B,$8A,$8A,$8A,$89,$89,$89,$89,$88,$87,$87   ;8893D6;
    db $87,$86,$86,$85,$85,$84,$84,$84,$83,$82,$82,$81,$80,$80,$80,$7F   ;8893E6;
    db $7E,$7D,$7C,$7C,$7B,$7A,$7A,$78,$78,$77,$76,$75,$75,$74,$73,$72   ;8893F6;
    db $71,$70,$6F,$6D,$6C,$6B,$6A,$69,$68,$67,$66,$64,$62,$62,$60,$5E   ;889406;
    db $5D,$5A,$5A,$58,$57,$54,$52,$51,$4F,$4D,$4A,$48,$47,$44,$42,$3F   ;889416;
    db $3C,$3A,$36,$33,$2F,$2B,$29,$22,$1D,$14,$00,$00,$00,$00,$00,$00   ;889426;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889436;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889446;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889456;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889466;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889476;
    db $95,$95,$95,$95,$95,$95,$95,$95,$95,$95,$94,$94,$94,$94,$94,$94   ;889486;
    db $94,$93,$93,$93,$93,$93,$93,$92,$92,$91,$91,$91,$90,$90,$90,$90   ;889496;
    db $8F,$8E,$8E,$8E,$8D,$8D,$8D,$8C,$8C,$8B,$8A,$8A,$89,$89,$88,$87   ;8894A6;
    db $87,$86,$86,$85,$85,$83,$83,$82,$81,$80,$80,$7F,$7E,$7D,$7C,$7B   ;8894B6;
    db $7B,$7A,$79,$78,$76,$76,$74,$73,$72,$71,$70,$6F,$6E,$6C,$6B,$6A   ;8894C6;
    db $68,$67,$66,$65,$63,$61,$60,$5E,$5C,$5B,$59,$57,$55,$53,$51,$4F   ;8894D6;
    db $4E,$4B,$48,$47,$43,$41,$3E,$3C,$38,$34,$32,$2D,$28,$22,$1F,$15   ;8894E6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8894F6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889506;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889516;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889526;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889536;
    db $9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9C,$9B,$9B,$9B,$9B,$9B   ;889546;
    db $9B,$9B,$9A,$9A,$9A,$99,$99,$99,$99,$99,$98,$98,$98,$97,$97,$97   ;889556;
    db $96,$96,$95,$95,$95,$95,$94,$93,$93,$92,$92,$91,$91,$90,$90,$8F   ;889566;
    db $8E,$8E,$8E,$8D,$8D,$8B,$8B,$8A,$89,$89,$88,$87,$86,$85,$85,$84   ;889576;
    db $83,$82,$81,$80,$80,$7E,$7D,$7D,$7B,$7A,$79,$78,$77,$76,$75,$73   ;889586;
    db $72,$71,$70,$6F,$6D,$6C,$6A,$6A,$67,$66,$64,$63,$60,$60,$5D,$5C   ;889596;
    db $5A,$57,$57,$54,$52,$50,$4D,$4C,$48,$46,$44,$41,$3C,$3A,$36,$34   ;8895A6;
    db $2F,$2A,$26,$20,$16,$0F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895B6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895C6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895D6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895E6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8895F6;
    db $A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A4,$A3,$A3,$A3,$A3,$A3   ;889606;
    db $A3,$A3,$A3,$A2,$A2,$A2,$A1,$A1,$A1,$A1,$A1,$A1,$A0,$A0,$9F,$9F   ;889616;
    db $9F,$9E,$9E,$9D,$9D,$9D,$9D,$9C,$9B,$9B,$9A,$9A,$9A,$99,$98,$98   ;889626;
    db $97,$96,$96,$95,$95,$94,$94,$93,$92,$92,$91,$91,$8F,$8F,$8E,$8D   ;889636;
    db $8C,$8B,$8B,$8A,$89,$87,$87,$86,$86,$84,$84,$82,$82,$80,$7E,$7E   ;889646;
    db $7D,$7C,$7B,$79,$78,$77,$76,$75,$73,$72,$70,$6F,$6E,$6C,$6B,$69   ;889656;
    db $68,$65,$63,$62,$60,$5E,$5C,$5B,$58,$57,$54,$51,$4F,$4C,$4A,$48   ;889666;
    db $46,$42,$3F,$3B,$39,$34,$2F,$2C,$26,$22,$17,$10,$00,$00,$00,$00   ;889676;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889686;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889696;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8896A6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8896B6;
    db $AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AC,$AB,$AB,$AB,$AB   ;8896C6;
    db $AB,$AA,$AA,$AA,$AA,$AA,$AA,$A9,$A9,$A9,$A8,$A8,$A8,$A8,$A8,$A7   ;8896D6;
    db $A6,$A6,$A6,$A6,$A5,$A5,$A4,$A4,$A4,$A4,$A3,$A2,$A2,$A1,$A1,$A0   ;8896E6;
    db $A0,$A0,$9F,$9E,$9E,$9D,$9C,$9C,$9C,$9B,$9A,$99,$99,$98,$98,$96   ;8896F6;
    db $96,$95,$94,$93,$92,$91,$91,$8F,$8F,$8E,$8D,$8D,$8B,$8B,$89,$89   ;889706;
    db $87,$86,$85,$84,$83,$82,$81,$7F,$7E,$7D,$7C,$7A,$78,$78,$76,$75   ;889716;
    db $73,$72,$70,$6E,$6E,$6B,$6A,$68,$67,$64,$63,$60,$5F,$5D,$5B,$58   ;889726;
    db $56,$53,$52,$4E,$4D,$49,$47,$42,$40,$3C,$3A,$34,$32,$2E,$27,$23   ;889736;
    db $19,$11,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889746;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889756;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889766;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889776;
    db $B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B4,$B3,$B3,$B3   ;889786;
    db $B3,$B2,$B2,$B2,$B2,$B2,$B2,$B2,$B1,$B1,$B1,$B0,$B0,$B0,$B0,$B0   ;889796;
    db $AF,$AF,$AE,$AE,$AE,$AD,$AD,$AC,$AC,$AC,$AB,$AB,$AB,$AA,$A9,$A8   ;8897A6;
    db $A8,$A8,$A8,$A7,$A6,$A6,$A5,$A5,$A4,$A4,$A3,$A2,$A2,$A1,$A0,$9F   ;8897B6;
    db $9F,$9F,$9D,$9C,$9C,$9B,$9A,$99,$99,$98,$97,$95,$95,$95,$93,$93   ;8897C6;
    db $91,$90,$90,$8E,$8E,$8B,$8B,$89,$89,$88,$87,$85,$84,$83,$82,$80   ;8897D6;
    db $7F,$7D,$7D,$7B,$7A,$78,$76,$76,$73,$72,$70,$6F,$6D,$6A,$69,$67   ;8897E6;
    db $65,$64,$61,$5F,$5C,$5A,$59,$56,$54,$51,$4F,$4D,$48,$45,$41,$3E   ;8897F6;
    db $39,$37,$34,$2C,$29,$1F,$1A,$12,$00,$00,$00,$00,$00,$00,$00,$00   ;889806;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889816;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889826;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889836;
    db $BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BC,$BB,$BB,$BB   ;889846;
    db $BB,$BB,$BA,$BA,$BA,$BA,$BA,$BA,$BA,$B9,$B9,$B9,$B9,$B8,$B8,$B8   ;889856;
    db $B7,$B7,$B7,$B6,$B6,$B6,$B5,$B5,$B4,$B4,$B4,$B4,$B3,$B3,$B2,$B1   ;889866;
    db $B1,$B0,$B0,$AF,$AF,$AE,$AE,$AD,$AD,$AC,$AC,$AB,$AB,$AA,$A9,$A9   ;889876;
    db $A8,$A7,$A6,$A6,$A5,$A4,$A3,$A3,$A2,$A1,$A0,$A0,$9F,$9D,$9D,$9B   ;889886;
    db $9B,$9B,$99,$98,$98,$96,$95,$95,$92,$92,$91,$8F,$8F,$8E,$8D,$8B   ;889896;
    db $8A,$89,$88,$86,$85,$84,$82,$81,$80,$7E,$7C,$7C,$79,$78,$77,$74   ;8898A6;
    db $73,$70,$6F,$6E,$6B,$69,$68,$65,$63,$62,$5E,$5D,$5B,$57,$55,$52   ;8898B6;
    db $50,$4E,$49,$46,$44,$3F,$3B,$39,$32,$2E,$2B,$21,$1B,$13,$00,$00   ;8898C6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8898D6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8898E6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8898F6;
    db $C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C5,$C4,$C4   ;889906;
    db $C4,$C4,$C4,$C3,$C3,$C3,$C3,$C2,$C2,$C2,$C2,$C2,$C2,$C2,$C1,$C1   ;889916;
    db $C1,$C0,$C0,$BF,$BF,$BF,$BF,$BF,$BE,$BD,$BD,$BC,$BC,$BC,$BB,$BB   ;889926;
    db $BB,$BA,$BA,$B9,$B8,$B8,$B8,$B7,$B7,$B6,$B5,$B4,$B4,$B4,$B3,$B3   ;889936;
    db $B2,$B1,$B1,$B0,$AF,$AE,$AE,$AE,$AC,$AB,$AA,$AA,$A9,$A8,$A7,$A7   ;889946;
    db $A6,$A5,$A3,$A3,$A3,$A2,$A0,$A0,$9F,$9D,$9D,$9C,$9B,$99,$98,$97   ;889956;
    db $96,$95,$94,$93,$91,$90,$8F,$8E,$8C,$8B,$89,$88,$87,$86,$84,$82   ;889966;
    db $81,$7E,$7E,$7D,$7A,$79,$77,$76,$73,$71,$70,$6D,$6B,$6A,$68,$65   ;889976;
    db $63,$62,$5E,$5C,$59,$58,$54,$51,$4F,$4A,$47,$44,$3E,$3C,$39,$35   ;889986;
    db $2D,$28,$22,$14,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889996;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8899A6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;8899B6;
    db $CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CD,$CC,$CC   ;8899C6;
    db $CC,$CC,$CC,$CC,$CB,$CB,$CB,$CB,$CA,$CA,$CA,$C9,$C9,$C9,$C9,$C9   ;8899D6;
    db $C9,$C9,$C8,$C8,$C8,$C7,$C6,$C6,$C6,$C6,$C5,$C5,$C5,$C4,$C4,$C4   ;8899E6;
    db $C3,$C3,$C2,$C1,$C1,$C1,$C0,$C0,$BF,$BF,$BE,$BD,$BD,$BD,$BC,$BB   ;8899F6;
    db $BA,$BA,$B9,$B9,$B9,$B8,$B7,$B6,$B5,$B5,$B5,$B3,$B2,$B1,$B1,$B0   ;889A06;
    db $AF,$AE,$AE,$AD,$AC,$AB,$AA,$A9,$A8,$A8,$A7,$A5,$A4,$A4,$A3,$A1   ;889A16;
    db $A0,$9F,$9E,$9C,$9C,$9B,$9A,$99,$97,$96,$95,$94,$92,$91,$90,$8F   ;889A26;
    db $8C,$8C,$8B,$89,$87,$86,$83,$83,$7F,$7F,$7E,$7C,$79,$77,$76,$75   ;889A36;
    db $72,$6F,$6F,$6C,$69,$67,$66,$63,$5F,$5D,$5C,$5A,$57,$52,$4F,$4D   ;889A46;
    db $4A,$45,$41,$3E,$3B,$32,$2F,$2A,$24,$14,$00,$00,$00,$00,$00,$00   ;889A56;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889A66;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889A76;
    db $D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D6,$D5   ;889A86;
    db $D5,$D5,$D5,$D5,$D5,$D4,$D4,$D4,$D4,$D3,$D3,$D3,$D2,$D2,$D2,$D2   ;889A96;
    db $D1,$D1,$D1,$D1,$D1,$D1,$D0,$D0,$CF,$CF,$CF,$CE,$CE,$CD,$CD,$CC   ;889AA6;
    db $CC,$CC,$CC,$CC,$CB,$CA,$CA,$C9,$C8,$C8,$C7,$C7,$C7,$C7,$C6,$C5   ;889AB6;
    db $C4,$C4,$C3,$C2,$C2,$C2,$C1,$C1,$C0,$BF,$BE,$BD,$BC,$BC,$BC,$BA   ;889AC6;
    db $B9,$B9,$B8,$B7,$B6,$B6,$B5,$B4,$B3,$B2,$B1,$B1,$B0,$AF,$AE,$AD   ;889AD6;
    db $AC,$AB,$AA,$A9,$A7,$A6,$A5,$A4,$A3,$A2,$A1,$A0,$9E,$9D,$9D,$9B   ;889AE6;
    db $9A,$98,$98,$96,$94,$92,$92,$91,$8F,$8D,$8C,$89,$88,$88,$84,$83   ;889AF6;
    db $82,$80,$7E,$7D,$7A,$78,$77,$74,$73,$70,$6E,$6B,$6A,$68,$63,$61   ;889B06;
    db $60,$5E,$5B,$56,$53,$50,$4E,$4A,$48,$41,$3E,$39,$34,$31,$25,$1F   ;889B16;
    db $15,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889B26;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889B36;
    db $DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DF,$DE   ;889B46;
    db $DE,$DE,$DE,$DE,$DE,$DE,$DD,$DD,$DD,$DD,$DC,$DC,$DC,$DB,$DB,$DB   ;889B56;
    db $DB,$DB,$DA,$DA,$DA,$D9,$D9,$D9,$D9,$D9,$D8,$D8,$D8,$D7,$D7,$D6   ;889B66;
    db $D6,$D5,$D5,$D5,$D4,$D4,$D3,$D3,$D2,$D2,$D1,$D1,$D1,$D0,$D0,$CF   ;889B76;
    db $CE,$CD,$CD,$CC,$CC,$CB,$CB,$CB,$CA,$C9,$C9,$C8,$C7,$C6,$C5,$C4   ;889B86;
    db $C4,$C4,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BD,$BD,$BC,$BA,$B9,$B8,$B8   ;889B96;
    db $B7,$B6,$B6,$B4,$B3,$B2,$B1,$B0,$AF,$AE,$AC,$AB,$AA,$A9,$A8,$A8   ;889BA6;
    db $A7,$A4,$A3,$A2,$A1,$A1,$9F,$9E,$9B,$9A,$99,$98,$97,$95,$93,$92   ;889BB6;
    db $8F,$8E,$8D,$8B,$8A,$89,$85,$84,$82,$80,$7F,$7D,$7C,$78,$76,$75   ;889BC6;
    db $72,$70,$6F,$6C,$68,$65,$64,$62,$5F,$5C,$5A,$54,$51,$4D,$4B,$46   ;889BD6;
    db $44,$40,$37,$33,$2E,$27,$20,$16,$00,$00,$00,$00,$00,$00,$00,$00   ;889BE6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889BF6;
    db $E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8,$E8   ;889C06;
    db $E7,$E7,$E7,$E7,$E7,$E7,$E6,$E6,$E6,$E6,$E6,$E5,$E5,$E5,$E5,$E4   ;889C16;
    db $E4,$E4,$E4,$E3,$E3,$E3,$E3,$E2,$E2,$E1,$E1,$E0,$E0,$E0,$E0,$DF   ;889C26;
    db $DF,$DE,$DE,$DE,$DE,$DE,$DD,$DD,$DC,$DC,$DB,$DB,$DA,$D9,$D9,$D8   ;889C36;
    db $D8,$D7,$D7,$D6,$D5,$D5,$D4,$D4,$D3,$D3,$D3,$D2,$D1,$D1,$D0,$CF   ;889C46;
    db $CE,$CE,$CC,$CC,$CB,$CA,$CA,$C9,$C9,$C8,$C7,$C6,$C5,$C4,$C3,$C2   ;889C56;
    db $C1,$C0,$C0,$C0,$BF,$BE,$BC,$BB,$BA,$B9,$B8,$B7,$B6,$B5,$B4,$B3   ;889C66;
    db $B1,$B0,$AF,$AE,$AD,$AC,$AB,$AA,$A9,$A8,$A5,$A4,$A2,$A2,$A1,$9F   ;889C76;
    db $9E,$9D,$9B,$99,$97,$95,$94,$93,$90,$8F,$8E,$8D,$8B,$89,$85,$84   ;889C86;
    db $82,$81,$7E,$7D,$7A,$79,$77,$74,$70,$6F,$6C,$69,$68,$65,$63,$60   ;889C96;
    db $5D,$5A,$57,$51,$4E,$49,$46,$43,$3E,$39,$35,$30,$28,$17,$00,$00   ;889CA6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889CB6;
    db $F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2,$F2   ;889CC6;
    db $F2,$F1,$F1,$F1,$F1,$F1,$F1,$F0,$F0,$F0,$F0,$F0,$EF,$EF,$EF,$EF   ;889CD6;
    db $EE,$EE,$EE,$EE,$EE,$ED,$ED,$ED,$EC,$EC,$EC,$EB,$EB,$EA,$EA,$EA   ;889CE6;
    db $EA,$E9,$E9,$E8,$E8,$E7,$E7,$E7,$E7,$E6,$E5,$E5,$E4,$E4,$E3,$E2   ;889CF6;
    db $E2,$E2,$E1,$E1,$E0,$E0,$E0,$DF,$DF,$DE,$DE,$DC,$DC,$DC,$DB,$DA   ;889D06;
    db $DA,$D9,$D8,$D7,$D7,$D6,$D5,$D5,$D4,$D3,$D2,$D1,$D1,$D0,$CE,$CD   ;889D16;
    db $CD,$CD,$CC,$CB,$CA,$C9,$C8,$C8,$C7,$C6,$C5,$C4,$C3,$C2,$C1,$C0   ;889D26;
    db $BF,$BC,$BB,$BA,$BA,$B9,$B8,$B7,$B6,$B5,$B3,$B2,$B1,$B0,$AF,$AE   ;889D36;
    db $AC,$AB,$A9,$A8,$A6,$A5,$A4,$A2,$A0,$9F,$9E,$9B,$9A,$99,$96,$95   ;889D46;
    db $95,$93,$91,$8F,$8D,$8B,$87,$86,$83,$82,$80,$7F,$7C,$79,$78,$75   ;889D56;
    db $73,$70,$6E,$6D,$6A,$67,$64,$61,$5D,$58,$54,$51,$4C,$4A,$46,$41   ;889D66;
    db $3B,$38,$32,$2A,$23,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889D76;
    db $FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB,$FB   ;889D86;
    db $FB,$FA,$FA,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F9,$F8,$F8,$F8   ;889D96;
    db $F8,$F7,$F7,$F7,$F7,$F7,$F6,$F6,$F6,$F6,$F5,$F5,$F5,$F4,$F4,$F3   ;889DA6;
    db $F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0,$F0,$F0,$F0,$EF,$EF,$EE,$EE,$ED   ;889DB6;
    db $EC,$EB,$EB,$EB,$EA,$EA,$E9,$E9,$E8,$E7,$E7,$E6,$E6,$E5,$E4,$E4   ;889DC6;
    db $E4,$E3,$E2,$E2,$E1,$E0,$DF,$DF,$DE,$DD,$DD,$DC,$DB,$DA,$D9,$D9   ;889DD6;
    db $D8,$D7,$D6,$D5,$D5,$D4,$D3,$D2,$D1,$D0,$CF,$CF,$CE,$CD,$CC,$CB   ;889DE6;
    db $CA,$C9,$C8,$C7,$C6,$C5,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BD,$BC,$B9   ;889DF6;
    db $B8,$B7,$B6,$B5,$B3,$B2,$B0,$AF,$AE,$AC,$AB,$AA,$A8,$A6,$A5,$A4   ;889E06;
    db $A1,$A0,$9F,$9C,$9B,$9A,$98,$96,$94,$92,$90,$8F,$8C,$8B,$88,$87   ;889E16;
    db $84,$83,$80,$7E,$7D,$7A,$78,$75,$72,$71,$6E,$6B,$68,$65,$61,$5E   ;889E26;
    db $5B,$57,$54,$4F,$4C,$48,$43,$3E,$3A,$34,$2C,$24,$19,$00,$00,$00   ;889E36;
    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE   ;889E46;
    db $FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC,$FB,$FB,$FB   ;889E56;
    db $FB,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F6   ;889E66;
    db $F6,$F6,$F6,$F5,$F5,$F4,$F4,$F3,$F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0   ;889E76;
    db $F0,$EF,$EE,$EE,$EE,$ED,$ED,$EC,$EC,$EB,$EA,$EA,$E9,$E9,$E8,$E7   ;889E86;
    db $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E2,$E2,$E1,$E0,$E0,$DF,$DE,$DD,$DC   ;889E96;
    db $DC,$DB,$DA,$D9,$D8,$D8,$D7,$D6,$D5,$D4,$D3,$D2,$D2,$D1,$D0,$CF   ;889EA6;
    db $CE,$CD,$CC,$CB,$CA,$C9,$C8,$C6,$C5,$C4,$C3,$C2,$C1,$C0,$BF,$BE   ;889EB6;
    db $BC,$BB,$BA,$B9,$B8,$B7,$B5,$B4,$B2,$B1,$B0,$AE,$AD,$AC,$AA,$A8   ;889EC6;
    db $A7,$A6,$A3,$A2,$A1,$9E,$9D,$9C,$9A,$98,$96,$94,$92,$91,$8E,$8D   ;889ED6;
    db $8A,$89,$86,$85,$82,$7F,$7E,$7B,$79,$76,$73,$72,$6F,$6C,$69,$66   ;889EE6;
    db $62,$5F,$5C,$58,$55,$50,$4D,$49,$44,$3E,$3A,$34,$2C,$24,$19,$00   ;889EF6;

PowerBomb_PreExplosion_ShapeDefinitionTables_PreScaled:
; Defines the shape of (the bottom) half of a power bomb explosion
; Each byte defines the width of the power bomb explosion for that pixel-row, C0h pixel-rows total
; One line per frame of explosion
    db $91,$91,$91,$91,$91,$91,$91,$91,$91,$91,$90,$90,$90,$90,$90,$90   ;889F06;
    db $90,$8F,$8F,$8F,$8F,$8F,$8E,$8E,$8E,$8E,$8D,$8C,$8C,$8C,$8C,$8B   ;889F16;
    db $8B,$8B,$8A,$8A,$89,$89,$88,$88,$87,$87,$86,$86,$85,$84,$84,$83   ;889F26;
    db $83,$82,$81,$80,$80,$7F,$7E,$7E,$7C,$7C,$7B,$7A,$79,$78,$78,$77   ;889F36;
    db $76,$75,$74,$73,$71,$70,$6F,$6E,$6D,$6C,$6B,$6A,$68,$67,$66,$64   ;889F46;
    db $63,$61,$60,$5F,$5C,$5A,$5A,$58,$56,$53,$53,$50,$4E,$4C,$4A,$48   ;889F56;
    db $45,$42,$41,$3E,$3A,$36,$35,$31,$2C,$27,$23,$1E,$15,$00,$00,$00   ;889F66;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889F76;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889F86;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889F96;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889FA6;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;889FB6;
    db $C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$C0,$BF,$BF,$BF   ;889FC6;
    db $BF,$BF,$BF,$BE,$BE,$BE,$BD,$BD,$BD,$BD,$BD,$BD,$BD,$BC,$BC,$BC   ;889FD6;
    db $BB,$BB,$BA,$BA,$BA,$BA,$BA,$B9,$B8,$B8,$B7,$B7,$B7,$B7,$B6,$B6   ;889FE6;
    db $B5,$B5,$B4,$B4,$B4,$B3,$B2,$B2,$B1,$B1,$B0,$AF,$AE,$AE,$AE,$AD   ;889FF6;
    db $AD,$AB,$AB,$AB,$A9,$A9,$A8,$A7,$A6,$A6,$A5,$A4,$A3,$A2,$A2,$A1   ;88A006;
    db $9F,$9F,$9F,$9D,$9C,$9C,$9A,$99,$99,$97,$96,$95,$93,$93,$92,$90   ;88A016;
    db $8F,$8E,$8D,$8C,$8B,$8A,$88,$86,$86,$83,$83,$82,$7F,$7E,$7D,$7A   ;88A026;
    db $7A,$77,$76,$74,$73,$70,$6E,$6E,$6B,$68,$68,$65,$62,$60,$5D,$5B   ;88A036;
    db $59,$56,$54,$52,$4D,$4A,$48,$43,$40,$3D,$37,$34,$2F,$27,$21,$1B   ;88A046;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;88A056;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;88A066;
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;88A076;
    db $EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE,$EE   ;88A086;
    db $ED,$ED,$ED,$ED,$ED,$ED,$ED,$EC,$EC,$EC,$EC,$EC,$EB,$EB,$EB,$EA   ;88A096;
    db $EA,$EA,$EA,$EA,$E9,$E9,$E9,$E9,$E8,$E8,$E8,$E7,$E6,$E6,$E6,$E6   ;88A0A6;
    db $E5,$E5,$E4,$E4,$E3,$E3,$E3,$E3,$E2,$E1,$E1,$E0,$E0,$E0,$DF,$DF   ;88A0B6;
    db $DF,$DE,$DE,$DD,$DD,$DC,$DB,$DA,$DA,$D9,$D8,$D8,$D8,$D7,$D6,$D6   ;88A0C6;
    db $D5,$D4,$D3,$D3,$D2,$D2,$D1,$D0,$CF,$CE,$CE,$CD,$CC,$CB,$CA,$CA   ;88A0D6;
    db $C9,$C8,$C7,$C5,$C4,$C4,$C4,$C3,$C2,$C1,$C0,$BF,$BE,$BD,$BC,$BB   ;88A0E6;
    db $B9,$B7,$B6,$B6,$B5,$B4,$B3,$B2,$B0,$AF,$AE,$AD,$AC,$AB,$A9,$A7   ;88A0F6;
    db $A6,$A5,$A3,$A2,$A1,$9F,$9D,$9C,$9B,$99,$98,$97,$94,$92,$90,$8E   ;88A106;
    db $8C,$8B,$89,$88,$85,$84,$81,$80,$7E,$7D,$7A,$76,$73,$71,$6F,$6C   ;88A116;
    db $6B,$68,$65,$62,$60,$5C,$59,$56,$53,$4B,$48,$45,$40,$3A,$37,$31   ;88A126;
    db $2A,$22,$18,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;88A136;
    db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE   ;88A146;
    db $FE,$FD,$FD,$FD,$FD,$FD,$FD,$FD,$FC,$FC,$FC,$FC,$FC,$FB,$FB,$FB   ;88A156;
    db $FB,$FA,$FA,$FA,$FA,$FA,$F9,$F9,$F9,$F9,$F8,$F8,$F8,$F7,$F7,$F6   ;88A166;
    db $F6,$F6,$F6,$F5,$F5,$F4,$F4,$F3,$F3,$F3,$F3,$F2,$F2,$F1,$F1,$F0   ;88A176;
    db $F0,$EF,$EE,$EE,$EE,$ED,$ED,$EC,$EC,$EB,$EA,$EA,$E9,$E9,$E8,$E7   ;88A186;
    db $E7,$E7,$E6,$E5,$E5,$E4,$E3,$E2,$E2,$E1,$E0,$E0,$DF,$DE,$DD,$DC   ;88A196;
    db $DC,$DB,$DA,$D9,$D8,$D8,$D7,$D6,$D5,$D4,$D3,$D2,$D2,$D1,$D0,$CF   ;88A1A6;
    db $CE,$CD,$CC,$CB,$CA,$C9,$C8,$C6,$C5,$C4,$C3,$C2,$C1,$C0,$BF,$BE   ;88A1B6;
    db $BC,$BB,$BA,$B9,$B8,$B7,$B5,$B4,$B2,$B1,$B0,$AE,$AD,$AC,$AA,$A8   ;88A1C6;
    db $A7,$A6,$A3,$A2,$A1,$9E,$9D,$9C,$9A,$98,$96,$94,$92,$91,$8E,$8D   ;88A1D6;
    db $8A,$89,$86,$85,$82,$7F,$7E,$7B,$79,$76,$73,$72,$6F,$6C,$69,$66   ;88A1E6;
    db $62,$5F,$5C,$58,$55,$50,$4D,$49,$44,$3E,$3A,$34,$2C,$24,$19,$00   ;88A1F6;

PowerBomb_ShapeDefinitionTiles_Optimization_A206:
; PJ believes this padding exists purely because of the "optimisation" done in the
; "calculate power bomb explosion HDMA data tables - stage 1/3" routines ($8CC6/$8D04/$8D46)
; where Y starts at 60h so that it can be checked against 80h via inspecting the negative flag.
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A206;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A216;

PowerBomb_ShapeDefinitionTiles_Optimization_A226:
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A226;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A236;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A246;
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;88A256;

PowerBombExplosion_ShapeDefinitionTable_Unscaled_width:
; This table gives the shape of (the bottom) half of a power bomb explosion with X radius = 100h (Y radius C0h),
; starting from the bottom and ending at the centre
; Width
    db $00,$0C,$19,$25,$31,$3E,$4A,$56,$61,$6D,$78,$83,$8E,$98,$A2,$AB   ;88A266;
    db $B5,$BD,$C5,$CD,$D4,$DB,$E1,$E7,$EC,$F1,$F4,$F8,$FB,$FD,$FE,$FF   ;88A276;

PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset:
; Top offset (previous entry used as bottom offset)
    db $BF,$BF,$BE,$BD,$BA,$B8,$B6,$B2,$AF,$AB,$A6,$A2,$9C,$96,$90,$8A   ;88A286;
    db $84,$7D,$75,$6E,$66,$5E,$56,$4D,$45,$3C,$33,$2A,$20,$17,$0D,$04   ;88A296;

Spawn_CrystalFlash_HDMAObjects:
    LDA.W #$8000                                                         ;88A2A6;
    STA.W $0592                                                          ;88A2A9;
    JSL.L Spawn_HDMAObject                                               ;88A2AC;
    db $40,$28                                                           ;88A2B0;
    dw InstList_CrystalFlash_Window2_LeftPosition                        ;88A2B2;
    JSL.L Spawn_HDMAObject                                               ;88A2B4;
    db $40,$29                                                           ;88A2B8;
    dw InstList_CrystalFlash_Window2_RightPosition                       ;88A2BA;
    RTL                                                                  ;88A2BC;


InstList_CrystalFlash_Window2_LeftPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89                     ;88A2BD;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88A2C0;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88A2C3;
    dl CrystalFlash_Setup_1                                              ;88A2C5;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88A2C8;
    dl CrystalFlash_Setup_2                                              ;88A2CA;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88A2CD;
    dl PreInstruction_CrystalFlash_1_Explosion                           ;88A2CF;
    dw Instruction_HDMAObject_Sleep                                      ;88A2D2;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88A2D4;
    dl PreInstruction_CrystalFlash_2_AfterGlow                           ;88A2D6;
    dw Instruction_HDMAObject_Sleep                                      ;88A2D9;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88A2DB;
    dl CrystalFlash_Cleanup                                              ;88A2DD;
    dw Instruction_HDMAObject_Sleep                                      ;88A2E0;
    dw Instruction_HDMAObject_Delete                                     ;88A2E2;

CrystalFlash_Setup_1:
    SEP #$20                                                             ;88A2E4;
    LDA.B #$FF                                                           ;88A2E6;
    STA.L $7EC606                                                        ;88A2E8;
    LDA.B #$00                                                           ;88A2EC;
    STA.L $7EC607                                                        ;88A2EE;
    REP #$20                                                             ;88A2F2;
    LDA.W #$0400                                                         ;88A2F4;
    STA.W $0CEC                                                          ;88A2F7;
    LDA.L PowerBomb_PreExplosion_InitialRadiusSpeed                      ;88A2FA;
    STA.W $0CF0                                                          ;88A2FE;
    LDA.W #$0001                                                         ;88A301;
    JSL.L QueueSound_Lib1_Max6                                           ;88A304;
    RTL                                                                  ;88A308;


CrystalFlash_Setup_2:
    LDA.W #$0400                                                         ;88A309;
    STA.W $0CEA                                                          ;88A30C;
    LDA.L PowerBombExplosion_InitialRadiusSpeed                          ;88A30F;
    STA.W $0CF0                                                          ;88A313;
    RTL                                                                  ;88A316;


CrystalFlash_Cleanup:
    STZ.W $0CEE                                                          ;88A317;
    STZ.W $0592                                                          ;88A31A;
    STZ.W $18B4,X                                                        ;88A31D;
    STZ.W $18B6,X                                                        ;88A320;
    STZ.W $0CEC                                                          ;88A323;
    STZ.W $0CEA                                                          ;88A326;
    RTL                                                                  ;88A329;


InstList_CrystalFlash_Window2_RightPosition:
    dw Instruction_HDMAObject_HDMATableBank : db $89                     ;88A32A;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88A32D;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88A330;
    dl PreInstruction_CrystalFlash_CustomLayerBlendingWindow2Config      ;88A332;
    dw Instruction_HDMAObject_Sleep                                      ;88A335;
    dw Instruction_HDMAObject_Delete                                     ;88A337;

PreInstruction_CrystalFlash_CustomLayerBlendingWindow2Config:
    SEP #$20                                                             ;88A339;
    STZ.W $0060                                                          ;88A33B;
    LDA.B #$08                                                           ;88A33E;
    STA.W $0061                                                          ;88A340;
    LDA.B #$80                                                           ;88A343;
    STA.W $0062                                                          ;88A345;
    LDA.B #$02                                                           ;88A348;
    STA.W $006E                                                          ;88A34A;
    LDA.B #$33                                                           ;88A34D;
    STA.W $0071                                                          ;88A34F;
    STZ.W $006C                                                          ;88A352;
    LDA.B #$04                                                           ;88A355;
    STA.W $006D                                                          ;88A357;
    REP #$20                                                             ;88A35A;
    RTL                                                                  ;88A35C;


PreInstruction_CrystalFlash_2_AfterGlow:
    LDA.W $0592                                                          ;88A35D;
    BMI .exploding                                                       ;88A360;
    RTL                                                                  ;88A362;


.exploding:
    DEC.W $1908,X                                                        ;88A363;
    BPL .return                                                          ;88A366;
    SEP #$20                                                             ;88A368;
    LDA.W $0074                                                          ;88A36A;
    ORA.W $0075                                                          ;88A36D;
    ORA.W $0076                                                          ;88A370;
    AND.B #$1F                                                           ;88A373;
    BEQ .wake                                                            ;88A375;
    LDA.W $0074                                                          ;88A377;
    AND.B #$1F                                                           ;88A37A;
    BEQ .green                                                           ;88A37C;
    DEC A                                                                ;88A37E;
    ORA.B #$20                                                           ;88A37F;
    STA.W $0074                                                          ;88A381; >.<

.green:
    LDA.W $0075                                                          ;88A384; >.<
    AND.B #$1F                                                           ;88A387;
    BEQ .blue                                                            ;88A389;
    DEC A                                                                ;88A38B;
    ORA.B #$40                                                           ;88A38C;
    STA.W $0075                                                          ;88A38E; >.<

.blue:
    LDA.W $0076                                                          ;88A391; >.<
    AND.B #$1F                                                           ;88A394;
    BEQ .setTimer                                                        ;88A396;
    DEC A                                                                ;88A398;
    ORA.B #$80                                                           ;88A399;
    STA.W $0076                                                          ;88A39B; >.<

.setTimer:
    LDA.L PowerBomb_Stage5_HDMAObjectTimer                               ;88A39E;
    STA.W $1908,X                                                        ;88A3A2;
    REP #$20                                                             ;88A3A5;

.return:
    RTL                                                                  ;88A3A7;


.wake:
    REP #$20                                                             ;88A3A8;
    LDA.W #$0001                                                         ;88A3AA;
    STA.W $18E4,X                                                        ;88A3AD;
    INC.W $18CC,X                                                        ;88A3B0;
    INC.W $18CC,X                                                        ;88A3B3;
    RTL                                                                  ;88A3B6;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CalcCrystalFlashHDMADataTables_PreScaled_Left_88A3B7:
    LDA.W $0CE6                                                          ;88A3B7;
    CLC                                                                  ;88A3BA;
    ADC.W $0000,Y                                                        ;88A3BB;
    BCS +                                                                ;88A3BE;
    LDA.B #$00                                                           ;88A3C0;
    STA.L $7EC506,X                                                      ;88A3C2;
    INC A                                                                ;88A3C6;
    STA.L $7EC406,X                                                      ;88A3C7;
    BRA .loop                                                            ;88A3CB;


  + STA.L $7EC506,X                                                      ;88A3CD;
    LDA.B #$00                                                           ;88A3D1;
    STA.L $7EC406,X                                                      ;88A3D3;

.loop:
    INY                                                                  ;88A3D7;
    INX                                                                  ;88A3D8;
    CPX.W #$00C0                                                         ;88A3D9;
    BNE UNUSED_CalcCrystalFlashHDMADataTables_PreScaled_Left_88A3B7      ;88A3DC;
    RTS                                                                  ;88A3DE;


UNUSED_Calc_CF_HDMADataTables_PreScaled_OnScreen_88A3DF:
    LDA.W $0000,Y                                                        ;88A3DF;
    BEQ .return                                                          ;88A3E2;
    CLC                                                                  ;88A3E4;
    ADC.W $0CE6                                                          ;88A3E5;
    BCC +                                                                ;88A3E8;
    LDA.B #$FF                                                           ;88A3EA;

  + STA.L $7EC506,X                                                      ;88A3EC;
    LDA.W $0CE6                                                          ;88A3F0;
    SEC                                                                  ;88A3F3;
    SBC.W $0000,Y                                                        ;88A3F4;
    BCS +                                                                ;88A3F7;
    LDA.B #$00                                                           ;88A3F9;

  + STA.L $7EC406,X                                                      ;88A3FB;
    INY                                                                  ;88A3FF;
    INX                                                                  ;88A400;
    CPX.W #$00C0                                                         ;88A401;
    BNE UNUSED_Calc_CF_HDMADataTables_PreScaled_OnScreen_88A3DF          ;88A404;

.return:
    RTS                                                                  ;88A406;


UNUSED_Calc_CF_HDMADataTables_PreScaled_RightOfScreen_88A407:
    LDA.W $0CE6                                                          ;88A407;
    SEC                                                                  ;88A40A;
    SBC.W $0000,Y                                                        ;88A40B;
    BCC +                                                                ;88A40E;
    LDA.B #$FF                                                           ;88A410;
    STA.L $7EC406,X                                                      ;88A412;
    DEC A                                                                ;88A416;
    STA.L $7EC506,X                                                      ;88A417;
    BRA .next                                                            ;88A41B;


  + STA.L $7EC406,X                                                      ;88A41D;
    LDA.B #$FF                                                           ;88A421;
    STA.L $7EC506,X                                                      ;88A423;

.next:
    INY                                                                  ;88A427;
    INX                                                                  ;88A428;
    CPX.W #$00C0                                                         ;88A429;
    BNE UNUSED_Calc_CF_HDMADataTables_PreScaled_RightOfScreen_88A407     ;88A42C;
    RTS                                                                  ;88A42E;
endif ; !FEATURE_KEEP_UNREFERENCED


Calculate_CrystalFlash_HDMAObjectTablePointers:
    LDA.W $0592                                                          ;88A42F;
    BMI .exploding                                                       ;88A432;
    RTL                                                                  ;88A434;


.exploding:
    LDA.W $0CE2                                                          ;88A435;
    SEC                                                                  ;88A438;
    SBC.W $0911                                                          ;88A439;
    CLC                                                                  ;88A43C;
    ADC.W #$0100                                                         ;88A43D;
    CMP.W #$0300                                                         ;88A440;
    BCC +                                                                ;88A443;
    BRA .offScreen                                                       ;88A445;


  + STA.W $0CE6                                                          ;88A447;
    LDA.W $0CE4                                                          ;88A44A;
    SEC                                                                  ;88A44D;
    SBC.W $0915                                                          ;88A44E;
    CLC                                                                  ;88A451;
    ADC.W #$0100                                                         ;88A452;
    CMP.W #$0300                                                         ;88A455;
    BCC .onScreen                                                        ;88A458;

.offScreen:
    LDA.W #$0000                                                         ;88A45A;

.onScreen:
    EOR.W #$03FF                                                         ;88A45D;
    SEC                                                                  ;88A460;
    SBC.W #$0100                                                         ;88A461;
    STA.W $0CE8                                                          ;88A464;
    LDA.W $0CEA                                                          ;88A467;
    AND.W #$FF00                                                         ;88A46A;
    BNE +                                                                ;88A46D;
    STZ.W $0CE8                                                          ;88A46F;

  + LDA.W $18C0,X                                                        ;88A472;
    AND.W #$00FF                                                         ;88A475;
    TAY                                                                  ;88A478;
    LDA.W $0CE8                                                          ;88A479;
    ASL A                                                                ;88A47C;
    CLC                                                                  ;88A47D;
    ADC.W $0CE8                                                          ;88A47E;
    STA.B $16                                                            ;88A481;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Left_200below     ;88A483;
    STA.W $18D8,X                                                        ;88A486;
    LDA.B $16                                                            ;88A489;
    CLC                                                                  ;88A48B;
    ADC.W #IndirectHDMATable_PowerBombExplosionWindow2_Right_200below    ;88A48C;
    STA.W $18DA,X                                                        ;88A48F;
    RTL                                                                  ;88A492;


Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;88A493;
    STA.W $4203                                                          ;88A496;
    NOP                                                                  ;88A499;
    NOP                                                                  ;88A49A;
    NOP                                                                  ;88A49B;
    LDA.W $4217                                                          ;88A49C;
    STA.B $14                                                            ;88A49F;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;88A4A1;
    STA.W $4203                                                          ;88A4A4;
    NOP                                                                  ;88A4A7;
    LDA.W $0CE6                                                          ;88A4A8;
    CLC                                                                  ;88A4AB;
    ADC.W $4217                                                          ;88A4AC;
    BCS .lowByteZero                                                     ;88A4AF;
    LDA.B #$00                                                           ;88A4B1;
    XBA                                                                  ;88A4B3;
    LDA.B #$FF                                                           ;88A4B4;
    BRA .loop                                                            ;88A4B6;


.lowByteZero:
    XBA                                                                  ;88A4B8;
    LDA.B #$00                                                           ;88A4B9;

.loop:
    STA.L $7EC406,X                                                      ;88A4BB;
    XBA                                                                  ;88A4BF;
    STA.L $7EC506,X                                                      ;88A4C0;
    XBA                                                                  ;88A4C4;
    CPX.B $14                                                            ;88A4C5;
    BEQ .next                                                            ;88A4C7;
    DEX                                                                  ;88A4C9;
    JMP.W .loop                                                          ;88A4CA;


.next:
    INY                                                                  ;88A4CD;
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen        ;88A4CE;
    RTS                                                                  ;88A4D0;


Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;88A4D1;
    STA.W $4203                                                          ;88A4D4;
    NOP                                                                  ;88A4D7;
    NOP                                                                  ;88A4D8;
    NOP                                                                  ;88A4D9;
    LDA.W $4217                                                          ;88A4DA;
    STA.B $14                                                            ;88A4DD;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;88A4DF;
    STA.W $4203                                                          ;88A4E2;
    NOP                                                                  ;88A4E5;
    LDA.W $0CE6                                                          ;88A4E6;
    CLC                                                                  ;88A4E9;
    ADC.W $4217                                                          ;88A4EA;
    BCC +                                                                ;88A4ED;
    LDA.B #$FF                                                           ;88A4EF;

  + XBA                                                                  ;88A4F1;
    LDA.W $0CE6                                                          ;88A4F2;
    SEC                                                                  ;88A4F5;
    SBC.W $4217                                                          ;88A4F6;
    BCS .loop                                                            ;88A4F9;
    LDA.B #$00                                                           ;88A4FB;

.loop:
    STA.L $7EC406,X                                                      ;88A4FD;
    XBA                                                                  ;88A501;
    STA.L $7EC506,X                                                      ;88A502;
    XBA                                                                  ;88A506;
    CPX.B $14                                                            ;88A507;
    BEQ .next                                                            ;88A509;
    DEX                                                                  ;88A50B;
    JMP.W .loop                                                          ;88A50C;


.next:
    INY                                                                  ;88A50F;
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen            ;88A510;
    RTS                                                                  ;88A512;


Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen:
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A226,Y             ;88A513;
    STA.W $4203                                                          ;88A516;
    NOP                                                                  ;88A519;
    NOP                                                                  ;88A51A;
    NOP                                                                  ;88A51B;
    LDA.W $4217                                                          ;88A51C;
    STA.B $14                                                            ;88A51F;
    LDA.W PowerBomb_ShapeDefinitionTiles_Optimization_A206,Y             ;88A521;
    STA.W $4203                                                          ;88A524;
    NOP                                                                  ;88A527;
    LDA.W $0CE6                                                          ;88A528;
    SEC                                                                  ;88A52B;
    SBC.W $4217                                                          ;88A52C;
    BCC .lowByteFF                                                       ;88A52F;
    LDA.B #$FF                                                           ;88A531;
    XBA                                                                  ;88A533;
    LDA.B #$00                                                           ;88A534;
    BRA +                                                                ;88A536;


.lowByteFF:
    XBA                                                                  ;88A538;
    LDA.B #$FF                                                           ;88A539;

  + XBA                                                                  ;88A53B;

.loop:
    STA.L $7EC406,X                                                      ;88A53C;
    XBA                                                                  ;88A540;
    STA.L $7EC506,X                                                      ;88A541;
    XBA                                                                  ;88A545;
    CPX.B $14                                                            ;88A546;
    BEQ .next                                                            ;88A548;
    DEX                                                                  ;88A54A;
    JMP.W .loop                                                          ;88A54B;


.next:
    INY                                                                  ;88A54E;
    BPL Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen       ;88A54F;
    RTS                                                                  ;88A551;


PreInstruction_CrystalFlash_1_Explosion:
    LDA.W $0592                                                          ;88A552;
    BMI .exploding                                                       ;88A555;
    RTL                                                                  ;88A557;


.exploding:
    PHP                                                                  ;88A558;
    PHB                                                                  ;88A559;
    REP #$30                                                             ;88A55A;
    PHX                                                                  ;88A55C;
    PHY                                                                  ;88A55D;
    JSL.L Calculate_CrystalFlash_HDMAObjectTablePointers                 ;88A55E;
    PEA.W $8800                                                          ;88A562;
    PLB                                                                  ;88A565;
    PLB                                                                  ;88A566;
    SEP #$30                                                             ;88A567;
    LDA.B #$00                                                           ;88A569;
    XBA                                                                  ;88A56B;
    LDY.B #$60                                                           ;88A56C;
    LDA.W $0CEB                                                          ;88A56E;
    STA.W $4202                                                          ;88A571;
    LDA.W PowerBombExplosion_ShapeDefinitionTable_Unscaled_topOffset     ;88A574;
    STA.W $4203                                                          ;88A577;
    NOP                                                                  ;88A57A;
    NOP                                                                  ;88A57B;
    NOP                                                                  ;88A57C;
    LDA.W $4217                                                          ;88A57D;
    STA.B $12                                                            ;88A580;
    TAX                                                                  ;88A582;
    PEA.W .loopPadDataTableBegin-1                                       ;88A583;
    LDA.W $0CE7                                                          ;88A586;
    AND.B #$FF                                                           ;88A589;
    BEQ .offScreenLeft                                                   ;88A58B;
    DEC A                                                                ;88A58D;
    BEQ .onScreen                                                        ;88A58E;
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_RightOfScreen     ;88A590;


.onScreen:
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_OnScreen          ;88A593;


.offScreenLeft:
    JMP.W Calculate_CrystalFlash_HDMADataTables_Scaled_LeftOfScreen      ;88A596;


.loopPadDataTableBegin:
    STA.L $7EC406,X                                                      ;88A599;
    XBA                                                                  ;88A59D;
    STA.L $7EC506,X                                                      ;88A59E;
    XBA                                                                  ;88A5A2;
    DEX                                                                  ;88A5A3;
    BPL .loopPadDataTableBegin                                           ;88A5A4;
    LDX.B $12                                                            ;88A5A6;
    INX                                                                  ;88A5A8;
    CPX.B #$C0                                                           ;88A5A9;
    BEQ .finishedTable                                                   ;88A5AB;
    LDA.B #$FF                                                           ;88A5AD;

.loopPadDataTableEnd:
    STA.L $7EC406,X                                                      ;88A5AF;
    INC A                                                                ;88A5B3;
    STA.L $7EC506,X                                                      ;88A5B4;
    DEC A                                                                ;88A5B8;
    INX                                                                  ;88A5B9;
    CPX.B #$C0                                                           ;88A5BA;
    BNE .loopPadDataTableEnd                                             ;88A5BC;

.finishedTable:
    LDA.W $0CEB                                                          ;88A5BE;
    LSR A                                                                ;88A5C1;
    LSR A                                                                ;88A5C2;
    LSR A                                                                ;88A5C3;
    AND.B #$1F                                                           ;88A5C4;
    STA.B $12                                                            ;88A5C6;
    ASL A                                                                ;88A5C8;
    CLC                                                                  ;88A5C9;
    ADC.B $12                                                            ;88A5CA;
    TAX                                                                  ;88A5CC;
    LDA.L PowerBombExplosion_Colors_red,X                                ;88A5CD;
    ORA.B #$20                                                           ;88A5D1;
    STA.W $0074                                                          ;88A5D3;
    LDA.L PowerBombExplosion_Colors_green,X                              ;88A5D6;
    ORA.B #$40                                                           ;88A5DA;
    STA.W $0075                                                          ;88A5DC;
    LDA.L PowerBombExplosion_Colors_blue,X                               ;88A5DF;
    ORA.B #$80                                                           ;88A5E3;
    STA.W $0076                                                          ;88A5E5;
    REP #$30                                                             ;88A5E8;
    PLY                                                                  ;88A5EA;
    PLX                                                                  ;88A5EB;
    LDA.W $0CEA                                                          ;88A5EC;
    CLC                                                                  ;88A5EF;
    ADC.W $0CF0                                                          ;88A5F0;
    STA.W $0CEA                                                          ;88A5F3;
    CMP.W #$2000                                                         ;88A5F6;
    BCC .lessThan2000                                                    ;88A5F9;
    LDA.W #$0001                                                         ;88A5FB;
    STA.W $18E4,X                                                        ;88A5FE;
    INC.W $18CC,X                                                        ;88A601;
    INC.W $18CC,X                                                        ;88A604;
    STZ.W $1908,X                                                        ;88A607;
    JMP.W .return                                                        ;88A60A;


.lessThan2000:
    LDA.W $0CF0                                                          ;88A60D;
    CLC                                                                  ;88A610;
    ADC.L PowerBombExplosion_RadiusAcceleration                          ;88A611;
    STA.W $0CF0                                                          ;88A615;

.return:
    PLB                                                                  ;88A618;
    PLP                                                                  ;88A619;
    RTL                                                                  ;88A61A;


FXType_20_22_ScrollingSky:
    PHP                                                                  ;88A61B;
    REP #$30                                                             ;88A61C;
    LDA.W #$04E0                                                         ;88A61E;
    STA.W $195E                                                          ;88A621;
    LDA.W #$0006                                                         ;88A624;
    STA.W $196E                                                          ;88A627;
    JSL.L Spawn_HDMAObject                                               ;88A62A;
    db $02,$12                                                           ;88A62E;
    dw InstList_FXType_22_BG3YScroll_0                                   ;88A630;
    JSL.L Spawn_HDMAObject                                               ;88A632;
    db $42,$11                                                           ;88A636;
    dw InstList_FXType_22_BG3XScroll_0                                   ;88A638;
    JSL.L Spawn_HDMAObject                                               ;88A63A;
    db $42,$0D                                                           ;88A63E;
    dw InstList_FXType_22_BG1XScroll_0                                   ;88A640;
    PLP                                                                  ;88A642;

PreInstruction_FXType_22_BG3Yscroll:
    REP #$30                                                             ;88A643;
    JSR.W Damage_Samus_IfSheIsInTheTopRow                                ;88A645;
    LDA.W #FXType_22_RepeatingBG3StripsTable                             ;88A648;
    STA.B $00                                                            ;88A64B;
    LDA.W #FXType_22_RepeatingBG3StripsTable+2                           ;88A64D;
    STA.B $03                                                            ;88A650;
    LDA.W #FXType_22_RepeatingBG3StripsTable+4                           ;88A652;
    STA.B $06                                                            ;88A655;
    LDA.W #FXType_22_RepeatingBG3StripsTable+6                           ;88A657;
    STA.B $09                                                            ;88A65A;
    LDA.W #$004E                                                         ;88A65C;
    STA.B $18                                                            ;88A65F;
    JSR.W Calculate_FXType_22_BG3YScrollHDMATable                        ;88A661;
    LDA.W #$0000                                                         ;88A664;
    STA.L $7E9C00,X                                                      ;88A667;
    RTL                                                                  ;88A66B;


Instruction_HDMAObjectPhaseIncreaseTimer_1:
    LDA.W #$0001                                                         ;88A66C;
    STA.W $1920,X                                                        ;88A66F;
    RTS                                                                  ;88A672;


PreInstruction_FXType_22_BG3XScroll:
    PHP                                                                  ;88A673;
    REP #$30                                                             ;88A674;
    PHB                                                                  ;88A676;
    PHX                                                                  ;88A677;
    PHY                                                                  ;88A678;
    LDA.W $0915                                                          ;88A679;
    CMP.W #$0400                                                         ;88A67C;
    BPL .wavy                                                            ;88A67F;
    LDA.W $05B5                                                          ;88A681;
    AND.W #$0001                                                         ;88A684;
    BNE +                                                                ;88A687;
    LDA.W $0596                                                          ;88A689;
    INC A                                                                ;88A68C;
    INC A                                                                ;88A68D;
    AND.W #$001E                                                         ;88A68E;
    STA.W $0596                                                          ;88A691;

  + LDY.W $0596                                                          ;88A694;
    LDX.W #$0000                                                         ;88A697;

.loop:
    LDA.W FXType_22_BG3XScrollHDMAData,Y                                 ;88A69A;
    STA.L $7E9E80,X                                                      ;88A69D;
    INX                                                                  ;88A6A1;
    INX                                                                  ;88A6A2;
    INY                                                                  ;88A6A3;
    INY                                                                  ;88A6A4;
    CPY.W #$0020                                                         ;88A6A5;
    BMI .loop                                                            ;88A6A8;
    BRA .merge                                                           ;88A6AA;


.wavy:
    DEC.W $1920,X                                                        ;88A6AC;
    BNE +                                                                ;88A6AF;
    LDA.W #$0006                                                         ;88A6B1;
    STA.W $1920,X                                                        ;88A6B4;
    LDA.W $1914,X                                                        ;88A6B7;
    INC A                                                                ;88A6BA;
    INC A                                                                ;88A6BB;
    AND.W #$001F                                                         ;88A6BC;
    STA.W $1914,X                                                        ;88A6BF;

  + LDA.W $1914,X                                                        ;88A6C2;
    TAX                                                                  ;88A6C5;
    LDY.W #$001E                                                         ;88A6C6;

.loopWavy:
    LDA.B $B1                                                            ;88A6C9;
    CLC                                                                  ;88A6CB;
    ADC.W WaveDisplacementTable_Water,Y                                  ;88A6CC;
    STA.L $7E9E80,X                                                      ;88A6CF;
    TXA                                                                  ;88A6D3;
    DEC A                                                                ;88A6D4;
    DEC A                                                                ;88A6D5;
    AND.W #$001F                                                         ;88A6D6;
    TAX                                                                  ;88A6D9;
    DEY                                                                  ;88A6DA;
    DEY                                                                  ;88A6DB;
    BPL .loopWavy                                                        ;88A6DC;

.merge:
    LDA.W #$0000                                                         ;88A6DE;
    STA.L $7E9E00                                                        ;88A6E1;
    STA.L $7E9F00                                                        ;88A6E5;
    LDA.W #$001F                                                         ;88A6E9;
    STA.L $7E9E02                                                        ;88A6EC;
    STA.L $7E9F02                                                        ;88A6F0;
    STA.B $12                                                            ;88A6F4;
    LDA.W #$9E00                                                         ;88A6F6; $7E
    STA.L $7E9E03                                                        ;88A6F9;
    STA.L $7E9F03                                                        ;88A6FD;
    LDA.W $0915                                                          ;88A701;
    CMP.W #$0400                                                         ;88A704;
    BMI .lessThan400                                                     ;88A707;
    LDA.W #$00B1                                                         ;88A709;
    STA.B $14                                                            ;88A70C;
    STZ.B $16                                                            ;88A70E;
    LDX.W #$0105                                                         ;88A710;
    JSR.W Calculate_FXType_22_IndirectHDMATable                          ;88A713;
    BRA +                                                                ;88A716;


.lessThan400:
    LDA.W #$0000                                                         ;88A718;
    STA.L $7E9F02                                                        ;88A71B;

  + LDX.W #$0005                                                         ;88A71F;
    LDA.W #$9E80                                                         ;88A722; $7E
    STA.B $14                                                            ;88A725;
    LDA.W #$0080                                                         ;88A727;
    STA.B $16                                                            ;88A72A;
    JSR.W Calculate_FXType_22_IndirectHDMATable                          ;88A72C;
    LDA.W #$00E0                                                         ;88A72F;
    SEC                                                                  ;88A732;
    SBC.B $12                                                            ;88A733;
    TAY                                                                  ;88A735;

.loopPad:
    TYA                                                                  ;88A736;
    SEC                                                                  ;88A737;
    SBC.W #$0010                                                         ;88A738;
    BMI .lessThan10                                                      ;88A73B;
    TAY                                                                  ;88A73D;
    LDA.W #$0090                                                         ;88A73E;
    STA.L $7E9E00,X                                                      ;88A741;
    STA.L $7E9F00,X                                                      ;88A745;
    LDA.W #$9E80                                                         ;88A749; $7E
    STA.L $7E9E01,X                                                      ;88A74C;
    STA.L $7E9F01,X                                                      ;88A750;
    INX                                                                  ;88A754;
    INX                                                                  ;88A755;
    INX                                                                  ;88A756;
    BRA .loopPad                                                         ;88A757;


.lessThan10:
    TYA                                                                  ;88A759;
    CMP.W #$0000                                                         ;88A75A;
    BEQ +                                                                ;88A75D;
    CLC                                                                  ;88A75F;
    ADC.W #$0080                                                         ;88A760;

  + STA.L $7E9E00,X                                                      ;88A763;
    STA.L $7E9F00,X                                                      ;88A767;
    LDA.W #$9E80                                                         ;88A76B; $7E
    STA.L $7E9E01,X                                                      ;88A76E;
    STA.L $7E9F01,X                                                      ;88A772;
    LDA.W #$0000                                                         ;88A776;
    STA.L $7E9E03,X                                                      ;88A779;
    STA.L $7E9F03,X                                                      ;88A77D;
    PLY                                                                  ;88A781;
    PLX                                                                  ;88A782;
    PLB                                                                  ;88A783;
    PLP                                                                  ;88A784;
    RTL                                                                  ;88A785;


Calculate_FXType_22_IndirectHDMATable:
    LDA.W #$04C0                                                         ;88A786;
    SEC                                                                  ;88A789;
    SBC.W $0915                                                          ;88A78A;
    STA.B $18                                                            ;88A78D;
    BMI .return                                                          ;88A78F;
    BEQ .return                                                          ;88A791;
    CMP.W #$0080                                                         ;88A793;
    BMI .onlyOneEntryNeeded                                              ;88A796;
    STA.B $12                                                            ;88A798;
    CMP.W #$00C1                                                         ;88A79A;
    BMI .remainingScanlineCounter                                        ;88A79D;
    LDA.W #$00C1                                                         ;88A79F;

.remainingScanlineCounter:
    STA.B $12                                                            ;88A7A2;
    STA.B $18                                                            ;88A7A4;

.loop:
    SEC                                                                  ;88A7A6;
    SBC.W #$0010                                                         ;88A7A7;
    BMI .done                                                            ;88A7AA;
    STA.B $18                                                            ;88A7AC;
    LDA.W #$0010                                                         ;88A7AE;
    ORA.B $16                                                            ;88A7B1;
    STA.L $7E9E00,X                                                      ;88A7B3;
    LDA.B $14                                                            ;88A7B7;
    STA.L $7E9E01,X                                                      ;88A7B9;
    LDA.B $18                                                            ;88A7BD;
    INX                                                                  ;88A7BF;
    INX                                                                  ;88A7C0;
    INX                                                                  ;88A7C1;
    BRA .loop                                                            ;88A7C2;


.onlyOneEntryNeeded:
    STA.B $12                                                            ;88A7C4;

.done:
    LDA.B $18                                                            ;88A7C6;
    ORA.B $16                                                            ;88A7C8;
    STA.L $7E9E00,X                                                      ;88A7CA;
    LDA.B $14                                                            ;88A7CE;
    STA.L $7E9E01,X                                                      ;88A7D0;
    INX                                                                  ;88A7D4;
    INX                                                                  ;88A7D5;
    INX                                                                  ;88A7D6;

.return:
    RTS                                                                  ;88A7D7;


FXType_20_ScrollingSky_RoomSetupASM_ScrollingSkyLand:
    PHP                                                                  ;88A7D8;
    SEP #$30                                                             ;88A7D9;
    LDA.W $091B                                                          ;88A7DB;
    ORA.B #$01                                                           ;88A7DE;
    STA.W $091B                                                          ;88A7E0;
    LDA.W $091C                                                          ;88A7E3;
    ORA.B #$01                                                           ;88A7E6;
    STA.W $091C                                                          ;88A7E8;
    JSL.L Spawn_HDMAObject                                               ;88A7EB;
    db $42,$0F                                                           ;88A7EF;
    dw InstList_ScrollingSkyLand_BG2XScroll_0                            ;88A7F1;
    REP #$30                                                             ;88A7F3;
    LDA.W #$00E0                                                         ;88A7F5;
    STA.W $059A                                                          ;88A7F8;
    STZ.W $059C                                                          ;88A7FB;
    PLP                                                                  ;88A7FE;
    RTL                                                                  ;88A7FF;


RoomSetupASM_ScrollingSkyOcean:
    PHP                                                                  ;88A800;
    SEP #$30                                                             ;88A801;
    LDA.B #$4A                                                           ;88A803;
    STA.B $59                                                            ;88A805;
    JSL.L Spawn_HDMAObject                                               ;88A807;
    db $42,$0F                                                           ;88A80B;
    dw InstList_ScrollingSkyOcean_BG2XScroll_0                           ;88A80D;
    REP #$30                                                             ;88A80F;
    LDA.W #$00E0                                                         ;88A811;
    STA.W $059A                                                          ;88A814;
    STZ.W $059C                                                          ;88A817;
    PLP                                                                  ;88A81A;
    RTL                                                                  ;88A81B;


Calculate_FXType_22_BG3YScrollHDMATable:
    PHB                                                                  ;88A81C;
    PHK                                                                  ;88A81D;
    PLB                                                                  ;88A81E;
    LDA.W #$0020                                                         ;88A81F;
    STA.W $0598                                                          ;88A822;
    DEC A                                                                ;88A825;
    STA.L $7E9C00                                                        ;88A826;
    LDA.W #$0000                                                         ;88A82A;
    STA.L $7E9C01                                                        ;88A82D;
    LDX.W #$0003                                                         ;88A831;
    LDA.W $0915                                                          ;88A834;
    CLC                                                                  ;88A837;
    ADC.W $0598                                                          ;88A838;
    STA.B $12                                                            ;88A83B;
    LDY.W #$0000                                                         ;88A83D;

.loopFirstStrip:
    CMP.B ($00),Y                                                        ;88A840;
    BMI +                                                                ;88A842;
    CMP.B ($09),Y                                                        ;88A844;
    BMI .foundFirstStrip                                                 ;88A846;

  + INY                                                                  ;88A848;
    INY                                                                  ;88A849;
    INY                                                                  ;88A84A;
    INY                                                                  ;88A84B;
    INY                                                                  ;88A84C;
    INY                                                                  ;88A84D;
    CPY.B $18                                                            ;88A84E;
    BMI .loopFirstStrip                                                  ;88A850;
    PLB                                                                  ;88A852;
    RTS                                                                  ;88A853;


.foundFirstStrip:
    LDA.B $12                                                            ;88A854;
    CMP.W #$04E0                                                         ;88A856;
    BMI .YposMod10                                                       ;88A859;
    AND.W #$001F                                                         ;88A85B;
    BRA +                                                                ;88A85E;


.YposMod10:
    AND.W #$000F                                                         ;88A860;

  + STA.B $16                                                            ;88A863;
    LDA.B ($03),Y                                                        ;88A865;
    SEC                                                                  ;88A867;
    SBC.B $16                                                            ;88A868;
    STA.L $7E9C00,X                                                      ;88A86A;
    LDA.B ($06),Y                                                        ;88A86E;
    CLC                                                                  ;88A870;
    ADC.B $16                                                            ;88A871;
    SEC                                                                  ;88A873;
    SBC.W $0598                                                          ;88A874;
    STA.L $7E9C01,X                                                      ;88A877;
    BRA .next                                                            ;88A87B;


.loopHDMATable:
    LDA.B $12                                                            ;88A87D;

.loopStrip:
    CMP.B ($00),Y                                                        ;88A87F;
    BMI +                                                                ;88A881;
    CMP.B ($09),Y                                                        ;88A883;
    BMI .foundStrip                                                      ;88A885;

  + INY                                                                  ;88A887;
    INY                                                                  ;88A888;
    INY                                                                  ;88A889;
    INY                                                                  ;88A88A;
    INY                                                                  ;88A88B;
    INY                                                                  ;88A88C;
    CPY.B $18                                                            ;88A88D;
    BMI .loopStrip                                                       ;88A88F;
    PLB                                                                  ;88A891;
    RTS                                                                  ;88A892;


.foundStrip:
    LDA.B ($03),Y                                                        ;88A893;
    STA.L $7E9C00,X                                                      ;88A895;
    LDA.B ($06),Y                                                        ;88A899;
    SEC                                                                  ;88A89B;
    SBC.W $0598                                                          ;88A89C;
    STA.L $7E9C01,X                                                      ;88A89F;

.next:
    LDA.L $7E9C00,X                                                      ;88A8A3;
    AND.W #$00FF                                                         ;88A8A7;
    STA.B $14                                                            ;88A8AA;
    CLC                                                                  ;88A8AC;
    ADC.B $12                                                            ;88A8AD;
    STA.B $12                                                            ;88A8AF;
    INX                                                                  ;88A8B1;
    INX                                                                  ;88A8B2;
    INX                                                                  ;88A8B3;
    LDA.B $14                                                            ;88A8B4;
    CLC                                                                  ;88A8B6;
    ADC.W $0598                                                          ;88A8B7;
    STA.W $0598                                                          ;88A8BA;
    CMP.W #$00E0                                                         ;88A8BD;
    BMI .loopHDMATable                                                   ;88A8C0;
    PLB                                                                  ;88A8C2;
    RTS                                                                  ;88A8C3;


Damage_Samus_IfSheIsInTheTopRow:
    LDA.W $0AFA                                                          ;88A8C4;
    SEC                                                                  ;88A8C7;
    SBC.W $0B00                                                          ;88A8C8;
    BMI .8damage                                                         ;88A8CB;
    CMP.W #$0011                                                         ;88A8CD;
    BMI .8damage                                                         ;88A8D0;
    RTS                                                                  ;88A8D2;


.8damage:
    LDA.W #$0008                                                         ;88A8D3;
    STA.W $0A50                                                          ;88A8D6;
    RTS                                                                  ;88A8D9;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Table_88A8DA:
; Looks like the format of FXType_22_RepeatingBG3StripsTable below
    dw $0000,$0010,$0020,$0020,$0010,$0030,$0040                         ;88A8DA;
endif ; !FEATURE_KEEP_UNREFERENCED

FXType_22_RepeatingBG3StripsTable:
; This table defines sections of repeating strips of BG3
;        _______________ Section top position
;       |      _________ Strip height
;       |     |      ___ BG3 tilemap Y position
;       |     |     |
    dw $0000,$0010,$0020                                                 ;88A8E8;
    dw $0030,$0010,$0030
    dw $0040,$0010,$0040
    dw $0300,$0010,$0050
    dw $0310,$0010,$0060
    dw $0330,$0010,$0070
    dw $0340,$0010,$0080
    dw $03A0,$0010,$0090
    dw $03B0,$0010,$00A0
    dw $03D0,$0010,$00B0
    dw $03E0,$0010,$00C0
    dw $04E0,$0020,$00D0
    dw $0500,$0020,$00F0
    dw $0600

FXType_22_BG3XScrollHDMAData:
; Looks like only the first line is used (see PreInstruction_FXType_22_BG3XScroll)
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A938;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A948;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A958;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A968;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A978;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A988;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A998;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A9A8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A9B8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A9C8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A9D8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88A9E8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88A9F8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA08;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA18;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA28;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA38;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA48;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA58;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA68;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA78;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AA88;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AA98;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AAA8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AAB8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AAC8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AAD8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AAE8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AAF8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB08;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB18;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB28;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB38;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB48;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB58;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB68;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB78;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AB88;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AB98;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ABA8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ABB8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ABC8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ABD8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ABE8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ABF8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC08;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC18;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC28;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC38;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC48;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC58;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC68;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC78;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AC88;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AC98;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ACA8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ACB8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ACC8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ACD8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88ACE8;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88ACF8;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AD08;
    dw $0000,$0001,$0002,$0003,$0003,$0002,$0001,$0000                   ;88AD18;
    dw $0000,$FFFF,$FFFE,$FFFD,$FFFD,$FFFE,$FFFF,$0000                   ;88AD28;

RTL_88AD38:
    RTL                                                                  ;88AD38;


InstList_FXType_22_BG1XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD39;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD3C;
    dw Instruction_HDMAObjectPhaseIncreaseTimer_1                        ;88AD3F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD41;
    dl RTL_88AD38                                                        ;88AD43;

InstList_FXType_22_BG1XScroll_1:
    dw $7000,$9F02                                                       ;88AD46; $7E9F02
    dw Instruction_HDMAObject_GotoY                                      ;88AD4A;
    dw InstList_FXType_22_BG1XScroll_1                                   ;88AD4C;

InstList_FXType_22_BG3XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD4E;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD51;
    dw Instruction_HDMAObjectPhaseIncreaseTimer_1                        ;88AD54;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD56;
    dl PreInstruction_FXType_22_BG3XScroll                               ;88AD58;

InstList_FXType_22_BG3XScroll_1:
    dw $7000,$9E02                                                       ;88AD5B; $7E9E02
    dw Instruction_HDMAObject_GotoY                                      ;88AD5F;
    dw InstList_FXType_22_BG3XScroll_1                                   ;88AD61;

InstList_FXType_22_BG3YScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD63;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD66;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD69;
    dl PreInstruction_FXType_22_BG3Yscroll                               ;88AD6B;

InstList_FXType_22_BG3YScroll_1:
    dw $7000,$9C00                                                       ;88AD6E; $7E9C00
    dw Instruction_HDMAObject_GotoY                                      ;88AD72;
    dw InstList_FXType_22_BG3YScroll_1                                   ;88AD74;

InstList_ScrollingSkyLand_BG2XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD76;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD79;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD7C;
    dl PreInstruction_ScrollingSkyLand_BG2XScroll                        ;88AD7E;

InstList_ScrollingSkyLand_BG2XScroll_1:
    dw $7000,$9F00                                                       ;88AD81; $7E9F00
    dw Instruction_HDMAObject_GotoY                                      ;88AD85;
    dw InstList_ScrollingSkyLand_BG2XScroll_1                            ;88AD87;

InstList_ScrollingSkyOcean_BG2XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88AD89;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88AD8C;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88AD8F;
    dl PreInstruction_ScrollingSkyOcean_BG2XScroll                       ;88AD91;

InstList_ScrollingSkyOcean_BG2XScroll_1:
    dw $7000,$9F00                                                       ;88AD94; $7E9F00
    dw Instruction_HDMAObject_GotoY                                      ;88AD98;
    dw InstList_ScrollingSkyOcean_BG2XScroll_1                           ;88AD9A;

ScrollingSkyLand_ChunkPointers:
    dw ScrollingSky_Tilemaps_0                                           ;88AD9C;
    dw ScrollingSky_Tilemaps_1                                           ;88AD9E;
    dw ScrollingSky_Tilemaps_2                                           ;88ADA0;
    dw ScrollingSky_Tilemaps_3                                           ;88ADA2;
    dw ScrollingSky_Tilemaps_4                                           ;88ADA4;

ScrollingSkyOcean_ChunkPointesr:
    dw ScrollingSky_Tilemaps_0                                           ;88ADA6;
    dw ScrollingSky_Tilemaps_1                                           ;88ADA8;
    dw ScrollingSky_Tilemaps_2                                           ;88ADAA;
    dw ScrollingSky_Tilemaps_3                                           ;88ADAC;
    dw ScrollingSky_Tilemaps_5                                           ;88ADAE;
    dw ScrollingSky_Tilemaps_8AE180                                      ;88ADB0;

PreInstruction_ScrollingSkyLand_BG2XScroll:
    REP #$30                                                             ;88ADB2;
    LDA.W $0A78                                                          ;88ADB4;
    BEQ Handle_ScrollingSky_BG2XScroll_HDMATables                        ;88ADB7;
    RTL                                                                  ;88ADB9;


PreInstruction_ScrollingSkyOcean_BG2XScroll:
    REP #$30                                                             ;88ADBA;
    LDA.W $0A78                                                          ;88ADBC;
    BEQ Handle_ScrollingSky_BG2XScroll_HDMATables                        ;88ADBF;
    RTL                                                                  ;88ADC1;


Handle_ScrollingSky_BG2XScroll_HDMATables:
    SEP #$30                                                             ;88ADC2;
    LDA.B #$4A                                                           ;88ADC4;
    STA.B $59                                                            ;88ADC6;
    REP #$30                                                             ;88ADC8;
    LDY.W #$0000                                                         ;88ADCA;

.loopDataTable:
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y        ;88ADCD;
    TAX                                                                  ;88ADD0;
    LDA.W ScrollingSky_ScrollingTable_scrollSubspeed,Y                   ;88ADD1;
    CLC                                                                  ;88ADD4;
    ADC.L $7E0000,X                                                      ;88ADD5;
    STA.L $7E0000,X                                                      ;88ADD9;
    LDA.W ScrollingSky_ScrollingTable_scrollSpeed,Y                      ;88ADDD;
    ADC.L $7E0002,X                                                      ;88ADE0;
    STA.L $7E0002,X                                                      ;88ADE4;
    TYA                                                                  ;88ADE8;
    CLC                                                                  ;88ADE9;
    ADC.W #$0008                                                         ;88ADEA;
    TAY                                                                  ;88ADED;
    CMP.W #$00B8                                                         ;88ADEE;
    BMI .loopDataTable                                                   ;88ADF1;
    LDA.W #$0000                                                         ;88ADF3;
    STA.L $7E9FD8                                                        ;88ADF6;
    STA.L $7E9FDA                                                        ;88ADFA;
    LDA.W #$001F                                                         ;88ADFE;
    STA.L $7E9F00                                                        ;88AE01;
    LDA.W #$059E                                                         ;88AE05;
    STA.L $7E9F01                                                        ;88AE08;
    LDA.W $0915                                                          ;88AE0C;
    CLC                                                                  ;88AE0F;
    ADC.W #$0020                                                         ;88AE10;
    STA.B $12                                                            ;88AE13;
    CLC                                                                  ;88AE15;
    ADC.W #$00C0                                                         ;88AE16;
    STA.B $14                                                            ;88AE19;
    LDY.W #$0000                                                         ;88AE1B;
    LDX.W #$0003                                                         ;88AE1E;

.loopIndirectTable:
    LDA.B $12                                                            ;88AE21;
    CMP.W ScrollingSky_ScrollingTable_topPosition,Y                      ;88AE23;
    BMI +                                                                ;88AE26;
    CMP.W ScrollingSky_ScrollingTable_nextEntry,Y                        ;88AE28;
    BMI .scrollingSection                                                ;88AE2B;

  + TYA                                                                  ;88AE2D;
    CLC                                                                  ;88AE2E;
    ADC.W #$0008                                                         ;88AE2F;
    TAY                                                                  ;88AE32;
    CMP.W #$00B8                                                         ;88AE33;
    BMI .loopIndirectTable                                               ;88AE36;
    LDA.W #$05FF                                                         ;88AE38;
    SEC                                                                  ;88AE3B;
    SBC.B $12                                                            ;88AE3C;

.loopNonScrollingSection:
    STA.B $18                                                            ;88AE3E;
    CMP.W #$0080                                                         ;88AE40;
    BMI .lessThan80                                                      ;88AE43;
    LDA.W #$007F                                                         ;88AE45;
    STA.L $7E9F00,X                                                      ;88AE48;
    LDA.W #$00B5                                                         ;88AE4C;
    STA.L $7E9F01,X                                                      ;88AE4F;
    INX                                                                  ;88AE53;
    INX                                                                  ;88AE54;
    INX                                                                  ;88AE55;
    LDA.B $18                                                            ;88AE56;
    SEC                                                                  ;88AE58;
    SBC.W #$007F                                                         ;88AE59;
    BRA .loopNonScrollingSection                                         ;88AE5C;


.lessThan80:
    STA.L $7E9F00,X                                                      ;88AE5E;
    LDA.W #$00B5                                                         ;88AE62;
    STA.L $7E9F01,X                                                      ;88AE65;
    LDA.W #$0000                                                         ;88AE69;
    STA.L $7E9F03,X                                                      ;88AE6C;
    RTL                                                                  ;88AE70;


.scrollingSection:
    LDA.W ScrollingSky_ScrollingTable_nextEntry,Y                        ;88AE71;
    SEC                                                                  ;88AE74;
    SBC.B $12                                                            ;88AE75;
    STA.B $18                                                            ;88AE77;
    CMP.W #$0080                                                         ;88AE79;
    BMI .heightLessThan80                                                ;88AE7C;
    LDA.W #$007F                                                         ;88AE7E;
    STA.L $7E9F00,X                                                      ;88AE81;
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y        ;88AE85;
    INC A                                                                ;88AE88;
    INC A                                                                ;88AE89;
    STA.L $7E9F01,X                                                      ;88AE8A;
    INX                                                                  ;88AE8E;
    INX                                                                  ;88AE8F;
    INX                                                                  ;88AE90;
    LDA.B $18                                                            ;88AE91;
    SEC                                                                  ;88AE93;
    SBC.W #$007F                                                         ;88AE94;

.heightLessThan80:
    STA.L $7E9F00,X                                                      ;88AE97;
    LDA.W ScrollingSky_ScrollingTable_HDMADataTableEntryPointer,Y        ;88AE9B;
    CLC                                                                  ;88AE9E;
    ADC.W #$0002                                                         ;88AE9F;
    STA.L $7E9F01,X                                                      ;88AEA2;
    LDA.B $18                                                            ;88AEA6;
    CLC                                                                  ;88AEA8;
    ADC.B $12                                                            ;88AEA9;
    STA.B $12                                                            ;88AEAB;
    INX                                                                  ;88AEAD;
    INX                                                                  ;88AEAE;
    INX                                                                  ;88AEAF;
    LDA.B $12                                                            ;88AEB0;
    CMP.B $14                                                            ;88AEB2;
    BPL .terminateTable                                                  ;88AEB4;
    JMP.W .loopIndirectTable                                             ;88AEB6;


.terminateTable:
    LDA.W #$0000                                                         ;88AEB9;
    STA.L $7E9F03,X                                                      ;88AEBC;
    RTL                                                                  ;88AEC0;


ScrollingSky_ScrollingTable:
; Scrolling sky scroll table
;                        ________________ Top position of scrolling section
;                       |     ___________ Scroll subspeed
;                       |    |     ______ Scroll speed
;                       |    |    |     _ Pointer to HDMA data table entry
;                       |    |    |    |
  .topPosition
    dw $0000                                                             ;88AEC1;
  .scrollSubspeed
    dw $8000                                                             ;88AEC3;
  .scrollSpeed
    dw $0000                                                             ;88AEC5;
  .HDMADataTableEntryPointer
    dw $9F80                                                             ;88AEC7;
  .nextEntry
    dw $0010,$C000,$0000,$9F84                                           ;88AEC9;
    dw $0038,$8000,$0000,$9F88                                           ;88AED1;
    dw $00D0,$C000,$0000,$9F8C                                           ;88AED9;
    dw $00E0,$8000,$0000,$9F90                                           ;88AEE1;
    dw $0120,$C000,$0000,$9F94                                           ;88AEE9;
    dw $01A0,$8000,$0000,$9F98                                           ;88AEF1;
    dw $01D8,$C000,$0000,$9F9C                                           ;88AEF9;
    dw $0238,$8000,$0000,$9FA0                                           ;88AF01;
    dw $0268,$C000,$0000,$9FA4                                           ;88AF09;
    dw $02A0,$8000,$0000,$9FA8                                           ;88AF11;
    dw $02E0,$C000,$0000,$9FA0                                           ;88AF19;
    dw $0300,$8000,$0000,$9FB0                                           ;88AF21;
    dw $0320,$C000,$0000,$9FB4                                           ;88AF29;
    dw $0350,$8000,$0000,$9FB8                                           ;88AF31;
    dw $0378,$C000,$0000,$9FBC                                           ;88AF39;
    dw $03C8,$8000,$0000,$9FC0                                           ;88AF41;
    dw $0440,$7000,$0000,$9FC4                                           ;88AF49;
    dw $0460,$C000,$0000,$9FC8                                           ;88AF51;
    dw $0480,$8000,$0000,$9FCC                                           ;88AF59;
    dw $0490,$0000,$0000,$9FD0                                           ;88AF61;
    dw $04A8,$0000,$0000,$9FD4                                           ;88AF69;
    dw $04B8,$0000,$0000,$9FD8                                           ;88AF71;
    dw $0500
; Unused continuation
    dw $0500,$0000,$0000,$9FDC                                           ;88AF79;
    dw $0578,$0000,$0000,$9FE0                                           ;88AF83;
    dw $05F0                                                             ;88AF8B;

RoomMainASM_ScrollingSkyLand:
    LDA.W #ScrollingSkyLand_ChunkPointers                                ;88AF8D;
    STA.B $00                                                            ;88AF90;
    LDA.W #$0088                                                         ;88AF92;
    STA.B $02                                                            ;88AF95;
    BRA RoomMainASM_ScrollingSky                                         ;88AF97;


RoomMainASM_ScrollingSkyOcean:
    LDA.W #ScrollingSkyOcean_ChunkPointesr                               ;88AF99;
    STA.B $00                                                            ;88AF9C;
    LDA.W #$0088                                                         ;88AF9E;
    STA.B $02                                                            ;88AFA1;

RoomMainASM_ScrollingSky:
    LDA.W $0A78                                                          ;88AFA3;
    BEQ .timeNotFrozen                                                   ;88AFA6;
    LDA.W #$0000                                                         ;88AFA8;
    STA.L $7E9F00                                                        ;88AFAB;
    RTL                                                                  ;88AFAF;


.timeNotFrozen:
    REP #$30                                                             ;88AFB0;
    LDA.W $0915                                                          ;88AFB2;
    STA.B $B7                                                            ;88AFB5;
    LDX.W $0330                                                          ;88AFB7;
    LDA.W #$0040                                                         ;88AFBA;
    STA.B $D0,X                                                          ;88AFBD;
    STA.B $D7,X                                                          ;88AFBF;
    STA.B $DE,X                                                          ;88AFC1;
    STA.B $E5,X                                                          ;88AFC3;
    LDA.W $0915                                                          ;88AFC5;
    AND.W #$07F8                                                         ;88AFC8;
    SEC                                                                  ;88AFCB;
    SBC.W #$0010                                                         ;88AFCC;
    PHA                                                                  ;88AFCF;
    AND.W #$FF00                                                         ;88AFD0;
    XBA                                                                  ;88AFD3;
    ASL A                                                                ;88AFD4;
    TAY                                                                  ;88AFD5;
    PLA                                                                  ;88AFD6;
    AND.W #$00FF                                                         ;88AFD7;
    ASL A                                                                ;88AFDA;
    ASL A                                                                ;88AFDB;
    ASL A                                                                ;88AFDC;
    CLC                                                                  ;88AFDD;
    ADC.B [$00],Y                                                        ;88AFDE;
    STA.B $D2,X                                                          ;88AFE0;
    CLC                                                                  ;88AFE2;
    ADC.W #$0040                                                         ;88AFE3;
    STA.B $D9,X                                                          ;88AFE6;
    LDA.W $0915                                                          ;88AFE8;
    AND.W #$07F8                                                         ;88AFEB;
    CLC                                                                  ;88AFEE;
    ADC.W #$00F0                                                         ;88AFEF;
    PHA                                                                  ;88AFF2;
    AND.W #$FF00                                                         ;88AFF3;
    XBA                                                                  ;88AFF6;
    ASL A                                                                ;88AFF7;
    TAY                                                                  ;88AFF8;
    PLA                                                                  ;88AFF9;
    AND.W #$00FF                                                         ;88AFFA;
    ASL A                                                                ;88AFFD;
    ASL A                                                                ;88AFFE;
    ASL A                                                                ;88AFFF;
    CLC                                                                  ;88B000;
    ADC.B [$00],Y                                                        ;88B001;
    STA.B $E0,X                                                          ;88B003;
    CLC                                                                  ;88B005;
    ADC.W #$0040                                                         ;88B006;
    STA.B $E7,X                                                          ;88B009;
    SEP #$20                                                             ;88B00B;
    LDA.B #$8A                                                           ;88B00D;
    STA.B $D4,X                                                          ;88B00F;
    STA.B $DB,X                                                          ;88B011;
    STA.B $E2,X                                                          ;88B013;
    STA.B $E9,X                                                          ;88B015;
    REP #$20                                                             ;88B017;
    LDA.B $59                                                            ;88B019;
    AND.W #$00FC                                                         ;88B01B;
    XBA                                                                  ;88B01E;
    STA.B $12                                                            ;88B01F;
    LDA.W $0915                                                          ;88B021;
    SEC                                                                  ;88B024;
    SBC.W #$0010                                                         ;88B025;
    AND.W #$01F8                                                         ;88B028;
    ASL A                                                                ;88B02B;
    ASL A                                                                ;88B02C;
    CLC                                                                  ;88B02D;
    ADC.B $12                                                            ;88B02E;
    STA.B $D5,X                                                          ;88B030;
    CLC                                                                  ;88B032;
    ADC.W #$0020                                                         ;88B033;
    STA.B $DC,X                                                          ;88B036;
    LDA.W $0915                                                          ;88B038;
    CLC                                                                  ;88B03B;
    ADC.W #$00F0                                                         ;88B03C;
    AND.W #$01F8                                                         ;88B03F;
    ASL A                                                                ;88B042;
    ASL A                                                                ;88B043;
    CLC                                                                  ;88B044;
    ADC.B $12                                                            ;88B045;
    STA.B $E3,X                                                          ;88B047;
    CLC                                                                  ;88B049;
    ADC.W #$0020                                                         ;88B04A;
    STA.B $EA,X                                                          ;88B04D;
    TXA                                                                  ;88B04F;
    CLC                                                                  ;88B050;
    ADC.W #$001C                                                         ;88B051;
    STA.W $0330                                                          ;88B054;
    RTL                                                                  ;88B057;


Fireflea_Flashing_Shades:
; Indexed by [fireflea flashing index] * 2
    dw $0000,$0100,$0200,$0300,$0400,$0500,$0600,$0500                   ;88B058;
    dw $0400,$0300,$0200,$0100                                           ;88B068;

Fireflea_Darkness_Shades:
; Indexed by [fireflea darkness level]
    dw $0000,$0600,$0C00,$1200,$1800,$1900                               ;88B070;

FXType_24_Fireflea:
    PHP                                                                  ;88B07C;
    REP #$30                                                             ;88B07D;
    LDA.W #$0006                                                         ;88B07F;
    STA.W $1778                                                          ;88B082;
    STZ.W $177A                                                          ;88B085;
    JSL.L Spawn_HDMAObject                                               ;88B088;
    db $42,$11                                                           ;88B08C;
    dw InstList_Fireflea_BG3XScroll_0                                    ;88B08E;
    LDA.W #$0000                                                         ;88B090;
    STA.L $7E9E00                                                        ;88B093;
    STZ.W $177C                                                          ;88B097;
    STZ.W $177E                                                          ;88B09A;
    LDA.W #$0018                                                         ;88B09D;
    STA.W $1780                                                          ;88B0A0;
    LDA.L Fireflea_Flashing_Shades                                       ;88B0A3;
    STA.W $1782                                                          ;88B0A7;
    PLP                                                                  ;88B0AA;
    RTL                                                                  ;88B0AB;


InstList_Fireflea_BG3XScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88B0AC;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88B0AF;
    dl PreInstruction_Fireflea_BG3XScroll                                ;88B0B1;

InstList_Fireflea_BG3XScroll_1:
    dw $0001,$9E00                                                       ;88B0B4; $7E9E00
    dw Instruction_HDMAObject_GotoY                                      ;88B0B8;
    dw InstList_Fireflea_BG3XScroll_1                                    ;88B0BA;

PreInstruction_Fireflea_BG3XScroll:
    PHP                                                                  ;88B0BC;
    REP #$30                                                             ;88B0BD;
    LDA.W $1986                                                          ;88B0BF;
    AND.W #$FF00                                                         ;88B0C2;
    ORA.W #$000C                                                         ;88B0C5;
    STA.W $1986                                                          ;88B0C8;
    LDA.W $0A78                                                          ;88B0CB;
    BNE .return                                                          ;88B0CE;
    DEC.W $1778                                                          ;88B0D0;
    BNE .nonZero                                                         ;88B0D3;
    LDA.W #$0006                                                         ;88B0D5;
    STA.W $1778                                                          ;88B0D8;
    LDA.W $177E                                                          ;88B0DB;
    CMP.W #$000A                                                         ;88B0DE;
    BMI .lessThanA                                                       ;88B0E1;
    LDA.W #$0006                                                         ;88B0E3;
    BRA .storeIndex                                                      ;88B0E6;


.lessThanA:
    LDA.W $177A                                                          ;88B0E8;
    INC A                                                                ;88B0EB;
    CMP.W #$000C                                                         ;88B0EC;
    BCC .storeIndex                                                      ;88B0EF;
    LDA.W #$0000                                                         ;88B0F1;

.storeIndex:
    STA.W $177A                                                          ;88B0F4;

.nonZero:
    REP #$30                                                             ;88B0F7;
    LDA.W $177A                                                          ;88B0F9;
    ASL A                                                                ;88B0FC;
    TAX                                                                  ;88B0FD;
    LDA.L Fireflea_Flashing_Shades,X                                     ;88B0FE;
    LDX.W $177E                                                          ;88B102;
    CLC                                                                  ;88B105;
    ADC.L Fireflea_Darkness_Shades,X                                     ;88B106;
    XBA                                                                  ;88B10A;
    TAX                                                                  ;88B10B;
    SEP #$30                                                             ;88B10C;
    ORA.B #$80                                                           ;88B10E;
    STA.B $75                                                            ;88B110;
    TXA                                                                  ;88B112;
    ORA.B #$40                                                           ;88B113;
    STA.B $76                                                            ;88B115;
    TXA                                                                  ;88B117;
    ORA.B #$20                                                           ;88B118;
    STA.B $74                                                            ;88B11A;

.return:
    PLP                                                                  ;88B11C;
    RTL                                                                  ;88B11D;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spawn_ExpandingContractingEffect_HDMAObject_88B11E:
    PHP                                                                  ;88B11E;
    REP #$30                                                             ;88B11F;
    STZ.W $05A0                                                          ;88B121;
    STZ.W $059A                                                          ;88B124;
    LDA.W #$0080                                                         ;88B127;
    STA.W $05A4                                                          ;88B12A;
    STA.W $05A6                                                          ;88B12D;
    LDA.W #$007F                                                         ;88B130;
    STA.W $05A8                                                          ;88B133;
    STA.W $05AA                                                          ;88B136;
    LDA.W #$2000                                                         ;88B139;
    STA.W $05A2                                                          ;88B13C;
    LDA.W #$00FF                                                         ;88B13F;
    STA.L $7E9E00                                                        ;88B142;
    LDA.W #$9C00                                                         ;88B146; $7E
    STA.L $7E9E01                                                        ;88B149;
    LDA.W #$00E1                                                         ;88B14D;
    STA.L $7E9E03                                                        ;88B150;
    LDA.W #$9CFE                                                         ;88B154; $7E
    STA.L $7E9E04                                                        ;88B157;
    LDA.W #$0000                                                         ;88B15B;
    STA.L $7E9E06                                                        ;88B15E;
    JSL.L Spawn_HDMAObject                                               ;88B162;
    db $42,$10                                                           ;88B166;
    dw InstList_ExpandingContractingEffect_BG2YScroll_0                  ;88B168;
    PLP                                                                  ;88B16A;
    RTL                                                                  ;88B16B;
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_ExpandingContractingEffect_BG2YScroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88B16C;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88B16F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88B172;
    dl PreInstruction_ExpandingContractingEffect_BG2YScroll              ;88B174;

InstList_ExpandingContractingEffect_BG2YScroll_1:
    dw $7777,$9E00                                                       ;88B177; $7E9E00
    dw Instruction_HDMAObject_GotoY                                      ;88B17B;
    dw InstList_ExpandingContractingEffect_BG2YScroll_1                  ;88B17D;

PreInstruction_ExpandingContractingEffect_BG2YScroll:
    PHP                                                                  ;88B17F;
    REP #$30                                                             ;88B180;
    INC.W $059A                                                          ;88B182;
    LDA.W $059A                                                          ;88B185;
    CMP.W #$0004                                                         ;88B188;
    BMI .counterLessThan4                                                ;88B18B;
    STZ.W $059A                                                          ;88B18D;
    LDA.W $05A0                                                          ;88B190;
    BEQ .expanding                                                       ;88B193;
    LDA.W $05A2                                                          ;88B195;
    SEC                                                                  ;88B198;
    SBC.W #$0400                                                         ;88B199;
    STA.W $05A2                                                          ;88B19C;
    CMP.W #$2000                                                         ;88B19F;
    BPL +                                                                ;88B1A2;
    LDA.W #$2000                                                         ;88B1A4;
    STA.W $05A2                                                          ;88B1A7;
    STZ.W $05A0                                                          ;88B1AA;
    BRA +                                                                ;88B1AD;


.expanding:
    LDA.W $05A2                                                          ;88B1AF;
    CLC                                                                  ;88B1B2;
    ADC.W #$0400                                                         ;88B1B3;
    STA.W $05A2                                                          ;88B1B6;
    CMP.W #$8000                                                         ;88B1B9;
    BMI +                                                                ;88B1BC;
    INC.W $05A0                                                          ;88B1BE;

  + LDA.W #$0080                                                         ;88B1C1;
    STA.W $05A4                                                          ;88B1C4;
    STA.W $05A6                                                          ;88B1C7;
    LDA.W #$007F                                                         ;88B1CA;
    STA.W $05A8                                                          ;88B1CD;
    STA.W $05AA                                                          ;88B1D0;

.counterLessThan4:
    LDA.W $05A4                                                          ;88B1D3;
    ASL A                                                                ;88B1D6;
    TAX                                                                  ;88B1D7;
    LDA.W $05A8                                                          ;88B1D8;
    ASL A                                                                ;88B1DB;
    TAY                                                                  ;88B1DC;
    STZ.B $12                                                            ;88B1DD;
    LDA.W #$0020                                                         ;88B1DF;
    STA.B $14                                                            ;88B1E2;

.loop:
    LDA.W $05A6                                                          ;88B1E4;
    SEC                                                                  ;88B1E7;
    SBC.W $05A4                                                          ;88B1E8;
    STA.L $7E9C00,X                                                      ;88B1EB;
    PHX                                                                  ;88B1EF;
    TYX                                                                  ;88B1F0;
    LDA.W $05AA                                                          ;88B1F1;
    SEC                                                                  ;88B1F4;
    SBC.W $05A8                                                          ;88B1F5;
    STA.L $7E9C00,X                                                      ;88B1F8;
    PLX                                                                  ;88B1FC;
    LDA.B $12                                                            ;88B1FD;
    CLC                                                                  ;88B1FF;
    ADC.W $05A2                                                          ;88B200;
    STA.B $12                                                            ;88B203;
    BVS +                                                                ;88B205;
    INC.W $05A6                                                          ;88B207;
    DEC.W $05AA                                                          ;88B20A;

  + INC.W $05A4                                                          ;88B20D;
    DEC.W $05A8                                                          ;88B210;
    DEY                                                                  ;88B213;
    DEY                                                                  ;88B214;
    INX                                                                  ;88B215;
    INX                                                                  ;88B216;
    DEC.B $14                                                            ;88B217;
    BNE .loop                                                            ;88B219;
    PLP                                                                  ;88B21B;
    RTL                                                                  ;88B21C;


Handle_Earthquake_SoundEffect:
    PHX                                                                  ;88B21D;
    PHY                                                                  ;88B21E;
    PHP                                                                  ;88B21F;
    REP #$30                                                             ;88B220;
    LDA.W $0609                                                          ;88B222;
    BMI .return                                                          ;88B225;
    DEC A                                                                ;88B227;
    STA.W $0609                                                          ;88B228;
    BPL .return                                                          ;88B22B;
    LDX.W $0607                                                          ;88B22D;
    LDA.W .soundIndex,X                                                  ;88B230;
    BPL .quake                                                           ;88B233;
    LDX.W #$0000                                                         ;88B235;
    LDA.W .soundIndex,X                                                  ;88B238;

.quake:
    JSL.L QueueSound_Lib2_Max6                                           ;88B23B;
    LDA.W $05E5                                                          ;88B23F;
    AND.W #$0003                                                         ;88B242;
    ADC.W .baseTimer,X                                                   ;88B245;
    STA.W $0609                                                          ;88B248;
    INX                                                                  ;88B24B;
    INX                                                                  ;88B24C;
    INX                                                                  ;88B24D;
    INX                                                                  ;88B24E;
    STX.W $0607                                                          ;88B24F;

.return:
    PLP                                                                  ;88B252;
    PLY                                                                  ;88B253;
    PLX                                                                  ;88B254;
    RTS                                                                  ;88B255;

;        _________ Sound index (sound library 2)
;       |      ___ Base timer
;       |     |
.soundIndex:
    dw $0046                                                             ;88B256;
.baseTimer:
    dw       $0001
    dw $0046,$0003
    dw $0046,$0002
    dw $0046,$0001
    dw $0046,$0001
    dw $0046,$0002
    dw $0046,$0002
    dw $0046,$0001
    dw $8000


RTL_88B278:
    RTL                                                                  ;88B278;


FXType_2_Lava:
    LDA.W #FXRisingFunction_LavaAcid_Normal                              ;88B279;
    STA.W $196C                                                          ;88B27C;
    LDA.W $1978                                                          ;88B27F;
    STA.W $1962                                                          ;88B282;
    JSL.L Spawn_HDMAObject                                               ;88B285;
    db $42,$12                                                           ;88B289;
    dw InstList_LavaAcidBG3_Yscroll                                      ;88B28B;
    JSL.L Spawn_HDMAObject                                               ;88B28D;
    db $42,$10                                                           ;88B291;
    dw InstList_LavaAcidBG2_Yscroll                                      ;88B293;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88B295;
    LDY.W #AnimatedTilesObject_Lava                                      ;88B299;
    JSL.L Spawn_AnimatedTilesObject                                      ;88B29C;
    RTL                                                                  ;88B2A0;


FXType_4_Acid:
    LDA.W #FXRisingFunction_LavaAcid_Normal                              ;88B2A1;
    STA.W $196C                                                          ;88B2A4;
    LDA.W $1978                                                          ;88B2A7;
    STA.W $1962                                                          ;88B2AA;
    JSL.L Spawn_HDMAObject                                               ;88B2AD;
    db $42,$12                                                           ;88B2B1;
    dw InstList_LavaAcidBG3_Yscroll                                      ;88B2B3;
    JSL.L Spawn_HDMAObject                                               ;88B2B5;
    db $42,$10                                                           ;88B2B9;
    dw InstList_LavaAcidBG2_Yscroll                                      ;88B2BB;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88B2BD;
    LDY.W #AnimatedTilesObject_Acid                                      ;88B2C1;
    JSL.L Spawn_AnimatedTilesObject                                      ;88B2C4;
    RTL                                                                  ;88B2C8;


Handle_Tide:
    BIT.W $197D                                                          ;88B2C9;
    BMI .smallTide                                                       ;88B2CC;
    BVS .bigTide                                                         ;88B2CE;
    RTS                                                                  ;88B2D0;


.smallTide:
    STZ.W $1970                                                          ;88B2D1;
    STZ.W $1972                                                          ;88B2D4;
    LDA.W $1975                                                          ;88B2D7;
    AND.W #$00FF                                                         ;88B2DA;
    ASL A                                                                ;88B2DD;
    TAX                                                                  ;88B2DE;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;88B2DF;
    ASL A                                                                ;88B2E3;
    ASL A                                                                ;88B2E4;
    ASL A                                                                ;88B2E5;
    BPL +                                                                ;88B2E6;
    DEC.W $1972                                                          ;88B2E8;

  + STA.W $1971                                                          ;88B2EB;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;88B2EE;
    BPL .smallBelowMidpoint                                              ;88B2F2;
    LDA.W $1974                                                          ;88B2F4;
    CLC                                                                  ;88B2F7;
    ADC.W #$00C0                                                         ;88B2F8;
    BRA .returnSmallTide                                                 ;88B2FB;


.smallBelowMidpoint:
    LDA.W $1974                                                          ;88B2FD;
    CLC                                                                  ;88B300;
    ADC.W #$0120                                                         ;88B301;

.returnSmallTide:
    STA.W $1974                                                          ;88B304;
    RTS                                                                  ;88B307;


.bigTide:
    STZ.W $1970                                                          ;88B308;
    STZ.W $1972                                                          ;88B30B;
    LDA.W $1975                                                          ;88B30E;
    AND.W #$00FF                                                         ;88B311;
    ASL A                                                                ;88B314;
    TAX                                                                  ;88B315;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;88B316;
    ASL A                                                                ;88B31A;
    ASL A                                                                ;88B31B;
    ASL A                                                                ;88B31C;
    ASL A                                                                ;88B31D;
    ASL A                                                                ;88B31E;
    BPL +                                                                ;88B31F;
    DEC.W $1972                                                          ;88B321;

  + STA.W $1971                                                          ;88B324;
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X                 ;88B327;
    BPL .bigBelowMidpoint                                                ;88B32B;
    LDA.W $1974                                                          ;88B32D;
    CLC                                                                  ;88B330;
    ADC.W #$0080                                                         ;88B331;
    BRA .returnBigTide                                                   ;88B334;


.bigBelowMidpoint:
    LDA.W $1974                                                          ;88B336;
    CLC                                                                  ;88B339;
    ADC.W #$00E0                                                         ;88B33A;

.returnBigTide:
    STA.W $1974                                                          ;88B33D;
    RTS                                                                  ;88B340;


RTS_88B341:
    RTS                                                                  ;88B341;


RTS_88B342:
    RTS                                                                  ;88B342;


FXRisingFunction_LavaAcid_Normal:
    LDA.W $197C                                                          ;88B343;
    BEQ .return3                                                         ;88B346;
    BMI .negative                                                        ;88B348;
    LDA.W $197A                                                          ;88B34A;
    CMP.W $1978                                                          ;88B34D;
    BEQ .return1                                                         ;88B350;
    BCS .doRise                                                          ;88B352;

.return1:
    RTS                                                                  ;88B354;


.negative:
    LDA.W $197A                                                          ;88B355;
    CMP.W $1978                                                          ;88B358;
    BEQ .return2                                                         ;88B35B;
    BCC .doRise                                                          ;88B35D;

.return2:
    RTS                                                                  ;88B35F;


.doRise:
    LDA.W #FXRisingFunction_LavaAcid_WaitToRise                          ;88B360;
    STA.W $196C                                                          ;88B363;

.return3:
    RTS                                                                  ;88B366;


FXRisingFunction_LavaAcid_WaitToRise:
    JSR.W Handle_Earthquake_SoundEffect                                  ;88B367;
    LDA.W #$0015                                                         ;88B36A;
    STA.W $183E                                                          ;88B36D;
    LDA.W #$0020                                                         ;88B370;
    TSB.W $1840                                                          ;88B373;
    DEC.W $1980                                                          ;88B376;
    BNE .return                                                          ;88B379;
    LDA.W #FXRisingFunction_LavaAcid_Rising                              ;88B37B;
    STA.W $196C                                                          ;88B37E;

.return:
    RTS                                                                  ;88B381;


FXRisingFunction_LavaAcid_Rising:
    JSR.W Handle_Earthquake_SoundEffect                                  ;88B382;
    LDA.W #$0015                                                         ;88B385;
    STA.W $183E                                                          ;88B388;
    LDA.W #$0020                                                         ;88B38B;
    TSB.W $1840                                                          ;88B38E;
    JSR.W RaiseOrLower_FX                                                ;88B391;
    BCS .reachedTarget                                                   ;88B394;
    RTS                                                                  ;88B396;


.reachedTarget:
    STZ.W $197C                                                          ;88B397;
    LDA.W #FXRisingFunction_LavaAcid_Normal                              ;88B39A;
    STA.W $196C                                                          ;88B39D;
    RTS                                                                  ;88B3A0;


Lava_SoundEffects:
; Sound library 2. Chosen randomly from the following
    db $12,$13,$14,$12,$13,$14,$12,$13                                   ;88B3A1;

Instruction_LavaSoundTimer_70:
    LDA.W #$0070                                                         ;88B3A9;
    STA.W $192C,X                                                        ;88B3AC;
    RTS                                                                  ;88B3AF;


PreInstruction_LavaAcid_BG3YScroll:
    PHB                                                                  ;88B3B0;
    LDA.W $1984                                                          ;88B3B1;
    STA.W $1986                                                          ;88B3B4;
    LDA.W $0A78                                                          ;88B3B7;
    BEQ .timeNotFrozen                                                   ;88B3BA;
    PLB                                                                  ;88B3BC;
    RTL                                                                  ;88B3BD;


.timeNotFrozen:
    REP #$30                                                             ;88B3BE;
    PEA.W .manualReturn-1                                                ;88B3C0;
    JMP.W ($196C)                                                        ;88B3C3;


.manualReturn:
    JSR.W Handle_Tide                                                    ;88B3C6;
    SEP #$10                                                             ;88B3C9;
    LDA.W $1976                                                          ;88B3CB;
    CLC                                                                  ;88B3CE;
    ADC.W $1970                                                          ;88B3CF;
    STA.W $1960                                                          ;88B3D2;
    LDA.W $1978                                                          ;88B3D5;
    ADC.W $1972                                                          ;88B3D8;
    STA.W $1962                                                          ;88B3DB;
    LDA.B $B1                                                            ;88B3DE;
    STA.L $7ECADC                                                        ;88B3E0;
    LDA.W #$0000                                                         ;88B3E4;
    STA.L $7E9C00                                                        ;88B3E7;
    LDA.W #$0000                                                         ;88B3EB;
    STA.L $7ECADE                                                        ;88B3EE;
    LDA.W $1962                                                          ;88B3F2;
    BMI .offScreen                                                       ;88B3F5;
    SEC                                                                  ;88B3F7;
    SBC.W $0915                                                          ;88B3F8;
    BEQ +                                                                ;88B3FB;
    BPL .positive                                                        ;88B3FD;

  + EOR.W #$001F                                                         ;88B3FF;
    AND.W #$001F                                                         ;88B402;
    ORA.W #$0100                                                         ;88B405;
    BRA .merge                                                           ;88B408;


.positive:
    CMP.W #$0100                                                         ;88B40A;
    BCC .onScreen                                                        ;88B40D;

.offScreen:
    LDA.W #$0000                                                         ;88B40F;
    BRA .merge                                                           ;88B412;


.onScreen:
    EOR.W #$00FF                                                         ;88B414;
    AND.W #$00FF                                                         ;88B417;

.merge:
    STA.L $7E9C02                                                        ;88B41A;
    LDX.W $18B2                                                          ;88B41E;
    LDA.W $196E                                                          ;88B421;
    CMP.W #$0002                                                         ;88B424;
    BNE +                                                                ;88B427;
    LDA.W $1962                                                          ;88B429;
    BMI +                                                                ;88B42C;
    DEC.W $192C,X                                                        ;88B42E;
    BNE +                                                                ;88B431;
    LDA.W #$0070                                                         ;88B433;
    STA.W $192C,X                                                        ;88B436;
    LDA.W $05E5                                                          ;88B439;
    AND.W #$0007                                                         ;88B43C;
    TAY                                                                  ;88B43F;
    LDA.W Lava_SoundEffects,Y                                            ;88B440;
    AND.W #$00FF                                                         ;88B443;
    JSL.L QueueSound_Lib2_Max6                                           ;88B446;

  + LDA.W $05E5                                                          ;88B44A;
    XBA                                                                  ;88B44D;
    STA.W $05E5                                                          ;88B44E;
    LDX.W $18B2                                                          ;88B451;
    LDA.W $18C0,X                                                        ;88B454;
    AND.W #$00FF                                                         ;88B457;
    TAY                                                                  ;88B45A;
    LDA.W $1962                                                          ;88B45B;
    BMI .negative                                                        ;88B45E;
    SEC                                                                  ;88B460;
    SBC.W $0915                                                          ;88B461;
    CLC                                                                  ;88B464;
    ADC.W #$0100                                                         ;88B465;
    BPL +                                                                ;88B468;
    LDA.W #$00FF                                                         ;88B46A;
    BRA .merge2                                                          ;88B46D;


  + CMP.W #$0200                                                         ;88B46F;
    BCC .merge2                                                          ;88B472;

.negative:
    LDA.W #$01FF                                                         ;88B474;

.merge2:
    EOR.W #$01FF                                                         ;88B477;
    INC A                                                                ;88B47A;
    AND.W #$03FF                                                         ;88B47B;
    STA.B $12                                                            ;88B47E;
    LDA.B $12                                                            ;88B480;
    ASL A                                                                ;88B482;
    CLC                                                                  ;88B483;
    ADC.B $12                                                            ;88B484;
    ADC.W #IndirectHDMATable_LavaAcid_BG3Yscroll                         ;88B486;
    STA.W $18D8,X                                                        ;88B489;
    PLB                                                                  ;88B48C;
    RTL                                                                  ;88B48D;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_WaveDisplacementTable_88B48E:
; Wave displacement table. Same as the data at Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy_waveDisplacementTable
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B48E;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B49E;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B4AE;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B4BE;
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_HDMAObject_PhaseDecreaseTimer_1:
    LDA.W #$0001                                                         ;88B4CE;
    STA.W $1920,X                                                        ;88B4D1;
    RTS                                                                  ;88B4D4;


PreInstruction_LavaAcid_BG2YScroll:
    PHB                                                                  ;88B4D5;
    LDA.B $B7                                                            ;88B4D6;
    STA.L $7E9C44                                                        ;88B4D8;
    LDA.W $0A78                                                          ;88B4DC;
    BNE .timeNotFrozen                                                   ;88B4DF;
    LDA.W $197E                                                          ;88B4E1;
    BIT.W #$0006                                                         ;88B4E4;
    BNE .wavy                                                            ;88B4E7;

.timeNotFrozen:
    LDX.W $18B2                                                          ;88B4E9;
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_NotWavy                     ;88B4EC;
    BRA .merge                                                           ;88B4EF;


.wavy:
    BIT.W #$0002                                                         ;88B4F1;
    BNE .verticallyWavy                                                  ;88B4F4;
    LDX.W $18B2                                                          ;88B4F6;
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_HorizontallyWavy            ;88B4F9;
    BRA .merge                                                           ;88B4FC;


.verticallyWavy:
    LDX.W $18B2                                                          ;88B4FE;
    JSR.W Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy              ;88B501;

.merge:
    LDX.W $18B2                                                          ;88B504;
    LDA.B $B7                                                            ;88B507;
    AND.W #$000F                                                         ;88B509;
    STA.B $12                                                            ;88B50C;
    LDA.B $12                                                            ;88B50E;
    ASL A                                                                ;88B510;
    CLC                                                                  ;88B511;
    ADC.B $12                                                            ;88B512;
    CLC                                                                  ;88B514;
    ADC.W #IndirectHDMATable_LavaAcidBG2_Yscroll                         ;88B515;
    STA.W $18D8,X                                                        ;88B518;
    PLB                                                                  ;88B51B;
    RTL                                                                  ;88B51C;


Setup_LavaAcid_BG2YScrollDataTable_NotWavy:
    SEP #$20                                                             ;88B51D;
    LDY.W $18C0,X                                                        ;88B51F;
    LDA.B #$10                                                           ;88B522;
    STA.W $4301,Y                                                        ;88B524;
    REP #$20                                                             ;88B527;
    PHX                                                                  ;88B529;
    LDX.B #$1E                                                           ;88B52A;
    LDA.B $B7                                                            ;88B52C;
    AND.W #$01FF                                                         ;88B52E;

.loop:
    STA.L $7E9C46,X                                                      ;88B531;
    DEX                                                                  ;88B535;
    DEX                                                                  ;88B536;
    BPL .loop                                                            ;88B537;
    PLX                                                                  ;88B539;
    RTS                                                                  ;88B53A;


Setup_LavaAcid_BG2YScrollDataTable_HorizontallyWavy:
    SEP #$20                                                             ;88B53B;
    LDY.W $18C0,X                                                        ;88B53D;
    LDA.B #$0F                                                           ;88B540;
    STA.W $4301,Y                                                        ;88B542;
    REP #$20                                                             ;88B545;
    DEC.W $1920,X                                                        ;88B547;
    BNE .nonZeroTimer                                                    ;88B54A;
    LDA.W #$0006                                                         ;88B54C;
    STA.W $1920,X                                                        ;88B54F;
    LDA.W $1914,X                                                        ;88B552;
    DEC A                                                                ;88B555;
    DEC A                                                                ;88B556;
    AND.W #$001E                                                         ;88B557;
    STA.W $1914,X                                                        ;88B55A;

.nonZeroTimer:
    PHX                                                                  ;88B55D;
    LDY.W $1914,X                                                        ;88B55E;
    LDX.B #$1E                                                           ;88B561;
    LDA.W #$000F                                                         ;88B563;
    STA.B $12                                                            ;88B566;

.loop:
    LDA.B $B5                                                            ;88B568;
    CLC                                                                  ;88B56A;
    ADC.W .waveDisplacementTable,Y                                       ;88B56B;
    AND.W #$01FF                                                         ;88B56E;
    STA.L $7E9C46,X                                                      ;88B571;
    TYA                                                                  ;88B575;
    DEC A                                                                ;88B576;
    DEC A                                                                ;88B577;
    AND.W #$001E                                                         ;88B578;
    TAY                                                                  ;88B57B;
    TXA                                                                  ;88B57C;
    DEC A                                                                ;88B57D;
    DEC A                                                                ;88B57E;
    AND.W #$001E                                                         ;88B57F;
    TAX                                                                  ;88B582;
    DEC.B $12                                                            ;88B583;
    BPL .loop                                                            ;88B585;
    PLX                                                                  ;88B587;
    RTS                                                                  ;88B588;


.waveDisplacementTable:
    dw $0000,$0000,$0001,$0001,$0001,$0001,$0000,$0000                   ;88B589;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$0000,$0000,$0000,$0000                   ;88B599;

Setup_LavaAcid_BG2YScrollDataTable_VerticallyWavy:
    SEP #$20                                                             ;88B5A9;
    LDY.W $18C0,X                                                        ;88B5AB;
    LDA.B #$10                                                           ;88B5AE;
    STA.W $4301,Y                                                        ;88B5B0;
    REP #$20                                                             ;88B5B3;
    DEC.W $1920,X                                                        ;88B5B5;
    BNE .nonZeroTimer                                                    ;88B5B8;
    LDA.W #$0004                                                         ;88B5BA;
    STA.W $1920,X                                                        ;88B5BD;
    LDA.W $1914,X                                                        ;88B5C0;
    DEC A                                                                ;88B5C3;
    DEC A                                                                ;88B5C4;
    AND.W #$001E                                                         ;88B5C5;
    STA.W $1914,X                                                        ;88B5C8;

.nonZeroTimer:
    PHX                                                                  ;88B5CB;
    LDA.B $B7                                                            ;88B5CC;
    AND.W #$000F                                                         ;88B5CE;
    ASL A                                                                ;88B5D1;
    PHA                                                                  ;88B5D2;
    CLC                                                                  ;88B5D3;
    ADC.W $1914,X                                                        ;88B5D4;
    AND.W #$001E                                                         ;88B5D7;
    TAY                                                                  ;88B5DA;
    PLA                                                                  ;88B5DB;
    CLC                                                                  ;88B5DC;
    ADC.W #$001E                                                         ;88B5DD;
    AND.W #$001E                                                         ;88B5E0;
    TAX                                                                  ;88B5E3;
    LDA.W #$000F                                                         ;88B5E4;
    STA.B $12                                                            ;88B5E7;

.loop:
    LDA.B $B7                                                            ;88B5E9;
    CLC                                                                  ;88B5EB;
    ADC.W .waveDisplacementTable,Y                                       ;88B5EC;
    AND.W #$01FF                                                         ;88B5EF;
    STA.L $7E9C46,X                                                      ;88B5F2;
    TXA                                                                  ;88B5F6;
    DEC A                                                                ;88B5F7;
    DEC A                                                                ;88B5F8;
    AND.W #$001E                                                         ;88B5F9;
    TAX                                                                  ;88B5FC;
    TYA                                                                  ;88B5FD;
    DEC A                                                                ;88B5FE;
    DEC A                                                                ;88B5FF;
    AND.W #$001E                                                         ;88B600;
    TAY                                                                  ;88B603;
    DEC.B $12                                                            ;88B604;
    BPL .loop                                                            ;88B606;
    PLX                                                                  ;88B608;
    RTS                                                                  ;88B609;

  .waveDisplacementTable
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B60A;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88B61A;


IndirectHDMATable_LavaAcid_BG3Yscroll:
; 81h,$9C00 x F0h
; 81h,$9C02 x 190h
; 60h,$9C02 x 2
; 0

; Disregarding the unnecessary nature of the lava/acid BG3 Y scroll HDMA (see $B3B0), this table is needlessly large
; There's no reason to have more than E0h scanlines of $9C02 (even less if the HUD is accounted for)
    db $81 : dw $9C00                                                    ;88B62A;
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $81 : dw $9C02
    db $60 : dw $9C02
    db $60 : dw $9C02
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88BDB1:
    db $81 : dw $9C44                                                    ;88BDB1;
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
endif ; !FEATURE_KEEP_UNREFERENCED

IndirectHDMATable_LavaAcidBG2_Yscroll:
    db $81 : dw $9C46                                                    ;88C0B1;
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C46
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64


InstList_LavaAcidBG3_Yscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88C3E1;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88C3E4;
    dw Instruction_LavaSoundTimer_70                                     ;88C3E7;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88C3E9;
    dl PreInstruction_LavaAcid_BG3YScroll                                ;88C3EB;
    dw Instruction_HDMAObject_Sleep                                      ;88C3EE;

InstList_LavaAcidBG2_Yscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88C3F0;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88C3F3;
    dw Instruction_HDMAObject_PhaseDecreaseTimer_1                       ;88C3F6;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88C3F8;
    dl PreInstruction_LavaAcid_BG2YScroll                                ;88C3FA;
    dw Instruction_HDMAObject_Sleep                                      ;88C3FD;

FXType_6_Water:
    LDA.W #FXRisingFunction_Water_Normal                                 ;88C3FF;
    STA.W $196C                                                          ;88C402;
    LDA.W $1978                                                          ;88C405;
    STA.W $195E                                                          ;88C408;
    JSL.L Spawn_HDMAObject                                               ;88C40B;
    db $42,$11                                                           ;88C40F;
    dw InstList_Water_BG3_Xscroll                                        ;88C411;
    LDA.W $197E                                                          ;88C413;
    AND.W #$0002                                                         ;88C416;
    BEQ .notWavy                                                         ;88C419;
    JSL.L Spawn_HDMAObject                                               ;88C41B;
    db $42,$0F                                                           ;88C41F;
    dw InstList_Water_BG2_Xscroll                                        ;88C421;

.notWavy:
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88C423;
    RTL                                                                  ;88C427;


FXRisingFunction_Water_Normal:
    LDA.W $197C                                                          ;88C428;
    BEQ .return3                                                         ;88C42B;
    BMI .negative                                                        ;88C42D;
    LDA.W $197A                                                          ;88C42F;
    CMP.W $1978                                                          ;88C432;
    BEQ .return1                                                         ;88C435;
    BCS .doRise                                                          ;88C437;

.return1:
    RTS                                                                  ;88C439;


.negative:
    LDA.W $197A                                                          ;88C43A;
    CMP.W $1978                                                          ;88C43D;
    BEQ .return2                                                         ;88C440;
    BCC .doRise                                                          ;88C442;

.return2:
    RTS                                                                  ;88C444;


.doRise:
    LDA.W #FXRisingFunction_Water_WaitToRise                             ;88C445;
    STA.W $196C                                                          ;88C448;

.return3:
    RTS                                                                  ;88C44B;


FXRisingFunction_Water_WaitToRise:
    DEC.W $1980                                                          ;88C44C;
    BNE .return                                                          ;88C44F;
    LDA.W #FXRisingFunction_Water_Rising                                 ;88C451;
    STA.W $196C                                                          ;88C454;

.return:
    RTS                                                                  ;88C457;


FXRisingFunction_Water_Rising:
    JSR.W RaiseOrLower_FX                                                ;88C458;
    BCC .return                                                          ;88C45B;
    LDA.W #FXRisingFunction_Water_Normal                                 ;88C45D;
    STA.W $196C                                                          ;88C460;
    STZ.W $197C                                                          ;88C463;

.return:
    RTS                                                                  ;88C466;


Instruction_HDMA_Object_Phase_Increase_Timer_1:
    LDA.W #$0001                                                         ;88C467;
    STA.W $1920,X                                                        ;88C46A;
    RTS                                                                  ;88C46D;


WaveDisplacementTable_Water:
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88C46E;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88C47E;

PreInstruction_Water_BG3_Xscroll:
    PHB                                                                  ;88C48E;
    LDA.W $1984                                                          ;88C48F;
    STA.W $1986                                                          ;88C492;
    LDA.W $0A78                                                          ;88C495;
    BEQ .notFrozen                                                       ;88C498;
    PLB                                                                  ;88C49A;
    RTL                                                                  ;88C49B;


.notFrozen:
    PHX                                                                  ;88C49C;
    PHY                                                                  ;88C49D;
    REP #$30                                                             ;88C49E;
    PEA.W .functionReturn-1                                              ;88C4A0;
    JMP.W ($196C)                                                        ;88C4A3;


.functionReturn:
    JSR.W Handle_Tide                                                    ;88C4A6;
    SEP #$10                                                             ;88C4A9;
    LDA.W $1976                                                          ;88C4AB;
    CLC                                                                  ;88C4AE;
    ADC.W $1970                                                          ;88C4AF;
    STA.W $195C                                                          ;88C4B2;
    LDA.W $1978                                                          ;88C4B5;
    ADC.W $1972                                                          ;88C4B8;
    STA.W $195E                                                          ;88C4BB;
    LDA.W $195E                                                          ;88C4BE;
    BMI .negative                                                        ;88C4C1;
    SEC                                                                  ;88C4C3;
    SBC.W $0915                                                          ;88C4C4;
    BEQ +                                                                ;88C4C7;
    BPL .notAboveScreen                                                  ;88C4C9;

  + EOR.W #$001F                                                         ;88C4CB;
    AND.W #$001F                                                         ;88C4CE;
    ORA.W #$0100                                                         ;88C4D1;
    BRA .merge                                                           ;88C4D4;


.notAboveScreen:
    CMP.W #$0100                                                         ;88C4D6;
    BCC .onScreen                                                        ;88C4D9;

.negative:
    LDA.W #$0000                                                         ;88C4DB;
    BRA .merge                                                           ;88C4DE;


.onScreen:
    EOR.W #$00FF                                                         ;88C4E0;
    AND.W #$00FF                                                         ;88C4E3;

.merge:
    STA.L $7ECADE                                                        ;88C4E6;
    LDX.W $18B2                                                          ;88C4EA;
    LDA.W $192C,X                                                        ;88C4ED;
    XBA                                                                  ;88C4F0;
    BPL .lowByte                                                         ;88C4F1;
    ORA.W #$FF00                                                         ;88C4F3;
    BRA +                                                                ;88C4F6;


.lowByte:
    AND.W #$00FF                                                         ;88C4F8;

  + CLC                                                                  ;88C4FB;
    ADC.W $0911                                                          ;88C4FC;
    STA.B $14                                                            ;88C4FF;
    DEC.W $1920,X                                                        ;88C501;
    BNE .loopSetup                                                       ;88C504;
    LDA.W #$000A                                                         ;88C506;
    STA.W $1920,X                                                        ;88C509;
    LDA.W $1914,X                                                        ;88C50C;
    INC A                                                                ;88C50F;
    INC A                                                                ;88C510;
    AND.W #$001E                                                         ;88C511;
    STA.W $1914,X                                                        ;88C514;

.loopSetup:
    LDA.W $1914,X                                                        ;88C517;
    TAX                                                                  ;88C51A;
    LDY.B #$1E                                                           ;88C51B;

.loop:
    LDA.B $14                                                            ;88C51D;
    CLC                                                                  ;88C51F;
    ADC.W WaveDisplacementTable_Water,Y                                  ;88C520;
    STA.L $7E9C04,X                                                      ;88C523;
    DEX                                                                  ;88C527;
    DEX                                                                  ;88C528;
    TXA                                                                  ;88C529;
    AND.W #$001E                                                         ;88C52A;
    TAX                                                                  ;88C52D;
    DEY                                                                  ;88C52E;
    DEY                                                                  ;88C52F;
    BPL .loop                                                            ;88C530;
    LDX.W $18B2                                                          ;88C532;
    LDA.W $197E                                                          ;88C535;
    AND.W #$0001                                                         ;88C538;
    BEQ +                                                                ;88C53B;
    LDA.W $192C,X                                                        ;88C53D;
    CLC                                                                  ;88C540;
    ADC.W #$0040                                                         ;88C541;
    STA.W $192C,X                                                        ;88C544;

  + LDX.W $18B2                                                          ;88C547;
    LDA.W $195E                                                          ;88C54A;
    BMI .negative2                                                       ;88C54D;
    SEC                                                                  ;88C54F;
    SBC.W $0915                                                          ;88C550;
    CLC                                                                  ;88C553;
    ADC.W #$0100                                                         ;88C554;
    BPL .lessThan100                                                     ;88C557;
    AND.W #$000F                                                         ;88C559;
    ORA.W #$0100                                                         ;88C55C;
    BRA .merge2                                                          ;88C55F;


.lessThan100:
    CMP.W #$0200                                                         ;88C561;
    BCC .merge2                                                          ;88C564;

.negative2:
    LDA.W #$01FF                                                         ;88C566;

.merge2:
    EOR.W #$01FF                                                         ;88C569;
    INC A                                                                ;88C56C;
    AND.W #$03FF                                                         ;88C56D;
    STA.B $12                                                            ;88C570;
    LDA.B $12                                                            ;88C572;
    ASL A                                                                ;88C574;
    CLC                                                                  ;88C575;
    ADC.B $12                                                            ;88C576;
    ADC.W #IndirectHDMATable_WaterBG3XScroll_0                           ;88C578;
    STA.W $18D8,X                                                        ;88C57B;
    PLY                                                                  ;88C57E;
    PLX                                                                  ;88C57F;
    PLB                                                                  ;88C580;
    RTL                                                                  ;88C581;


Instruction_HDMA_Object_Phase_Increase_Timer_1_duplicate:
    LDA.W #$0001                                                         ;88C582;
    STA.W $1920,X                                                        ;88C585;
    RTS                                                                  ;88C588;


PreInstruction_Water_BG2_Xscroll:
    PHB                                                                  ;88C589;
    LDA.B $B5                                                            ;88C58A;
    STA.L $7E9C44                                                        ;88C58C;
    LDA.W $0A78                                                          ;88C590;
    BNE .notWavy                                                         ;88C593;
    LDA.W $197E                                                          ;88C595;
    AND.W #$0002                                                         ;88C598;
    BNE .wavy                                                            ;88C59B;
    STZ.W $18B4,X                                                        ;88C59D;

.notWavy:
    JSR.W Setup_Water_BG2_Xscroll_DataTable_NotWavy                      ;88C5A0;
    BRA .merge                                                           ;88C5A3;


.wavy:
    JSR.W Setup_Water_BG2_Xscroll_DataTable_Wavy                         ;88C5A5;

.merge:
    LDA.W $18C0,X                                                        ;88C5A8;
    AND.W #$00FF                                                         ;88C5AB;
    TAY                                                                  ;88C5AE;
    LDA.W $195E                                                          ;88C5AF;
    BMI .negative                                                        ;88C5B2;
    SEC                                                                  ;88C5B4;
    SBC.W $0915                                                          ;88C5B5;
    CLC                                                                  ;88C5B8;
    ADC.W #$0100                                                         ;88C5B9;
    BPL .lessThan100                                                     ;88C5BC;
    AND.W #$000F                                                         ;88C5BE;
    ORA.W #$0100                                                         ;88C5C1;
    BRA .merge2                                                          ;88C5C4;


.lessThan100:
    CMP.W #$0200                                                         ;88C5C6;
    BCC .merge2                                                          ;88C5C9;

.negative:
    LDA.W #$01FF                                                         ;88C5CB;

.merge2:
    EOR.W #$01FF                                                         ;88C5CE;
    AND.W #$03FF                                                         ;88C5D1;
    STA.B $12                                                            ;88C5D4;
    LDA.B $12                                                            ;88C5D6;
    ASL A                                                                ;88C5D8;
    CLC                                                                  ;88C5D9;
    ADC.B $12                                                            ;88C5DA;
    ADC.W #IndirectHDMATable_WaterBG2XScroll                             ;88C5DC;
    STA.W $18D8,X                                                        ;88C5DF;
    PLB                                                                  ;88C5E2;
    RTL                                                                  ;88C5E3;


Setup_Water_BG2_Xscroll_DataTable_Wavy:
    DEC.W $1920,X                                                        ;88C5E4;
    BNE +                                                                ;88C5E7;
    LDA.W #$0006                                                         ;88C5E9;
    STA.W $1920,X                                                        ;88C5EC;
    LDA.W $1914,X                                                        ;88C5EF;
    INC A                                                                ;88C5F2;
    INC A                                                                ;88C5F3;
    AND.W #$001E                                                         ;88C5F4;
    STA.W $1914,X                                                        ;88C5F7;

  + PHX                                                                  ;88C5FA;
    LDA.B $B7                                                            ;88C5FB;
    AND.W #$000F                                                         ;88C5FD;
    ASL A                                                                ;88C600;
    PHA                                                                  ;88C601;
    CLC                                                                  ;88C602;
    ADC.W $1914,X                                                        ;88C603;
    AND.W #$001E                                                         ;88C606;
    TAY                                                                  ;88C609;
    PLA                                                                  ;88C60A;
    CLC                                                                  ;88C60B;
    ADC.W #$001E                                                         ;88C60C;
    AND.W #$001E                                                         ;88C60F;
    TAX                                                                  ;88C612;
    LDA.W #$000F                                                         ;88C613;
    STA.B $12                                                            ;88C616;

.loop:
    LDA.B $B5                                                            ;88C618;
    CLC                                                                  ;88C61A;
    ADC.W WaveDisplacementTable_Water,Y                                  ;88C61B;
    STA.L $7E9C48,X                                                      ;88C61E;
    DEX                                                                  ;88C622;
    DEX                                                                  ;88C623;
    TXA                                                                  ;88C624;
    AND.W #$001E                                                         ;88C625;
    TAX                                                                  ;88C628;
    DEY                                                                  ;88C629;
    DEY                                                                  ;88C62A;
    TYA                                                                  ;88C62B;
    AND.W #$001E                                                         ;88C62C;
    TAY                                                                  ;88C62F;
    DEC.B $12                                                            ;88C630;
    BPL .loop                                                            ;88C632;
    PLX                                                                  ;88C634;
    RTS                                                                  ;88C635;


Setup_Water_BG2_Xscroll_DataTable_NotWavy:
    PHX                                                                  ;88C636;
    LDX.B #$1E                                                           ;88C637;
    LDA.B $B5                                                            ;88C639;

.loop:
    STA.L $7E9C48,X                                                      ;88C63B;
    DEX                                                                  ;88C63F;
    DEX                                                                  ;88C640;
    BPL .loop                                                            ;88C641;
    PLX                                                                  ;88C643;
    RTS                                                                  ;88C644;


IndirectHDMATable_WaterBG3XScroll_0:
    db $81 : dw $9C00                                                    ;88C645;
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00
    db $81 : dw $9C00

IndirectHDMATable_WaterBG3XScroll_1:
    db $81 : dw $9C04                                                    ;88C945;
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $81 : dw $9C04
    db $81 : dw $9C06
    db $81 : dw $9C08
    db $81 : dw $9C0A
    db $81 : dw $9C0C
    db $81 : dw $9C0E
    db $81 : dw $9C10
    db $81 : dw $9C12
    db $81 : dw $9C14
    db $81 : dw $9C16
    db $81 : dw $9C18
    db $81 : dw $9C1A
    db $81 : dw $9C1C
    db $81 : dw $9C1E
    db $81 : dw $9C20
    db $81 : dw $9C22
    db $00

IndirectHDMATable_WaterBG2XScroll:
    db $81 : dw $9C44                                                    ;88CF46;
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C44
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $81 : dw $9C48
    db $81 : dw $9C4A
    db $81 : dw $9C4C
    db $81 : dw $9C4E
    db $81 : dw $9C50
    db $81 : dw $9C52
    db $81 : dw $9C54
    db $81 : dw $9C56
    db $81 : dw $9C58
    db $81 : dw $9C5A
    db $81 : dw $9C5C
    db $81 : dw $9C5E
    db $81 : dw $9C60
    db $81 : dw $9C62
    db $81 : dw $9C64
    db $81 : dw $9C66
    db $00

InstList_Water_BG2_Xscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D847;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88D84A;
    dw Instruction_HDMA_Object_Phase_Increase_Timer_1_duplicate          ;88D84D;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88D84F;
    dl PreInstruction_Water_BG2_Xscroll                                  ;88D851;
    dw Instruction_HDMAObject_Sleep                                      ;88D854;

InstList_Water_BG3_Xscroll:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D856;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88D859;
    dw Instruction_HDMA_Object_Phase_Increase_Timer_1                    ;88D85C;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88D85E;
    dl PreInstruction_Water_BG3_Xscroll                                  ;88D860;
    dw Instruction_HDMAObject_Sleep                                      ;88D863;

Spawn_BG3_Scroll_HDMA_Object:
    JSL.L SpawnHDMAObject_SlotA_Channel80_Index70                        ;88D865;
    db $43,$11                                                           ;88D869;
    dw InstList_BG3Scroll_0                                              ;88D86B;
    RTL                                                                  ;88D86D;


RTL_88D86E:
    RTL                                                                  ;88D86E;


IndirectHDMATable_BG3Scroll:                                             ;88D86F;
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CAD8
    db $81 : dw $CADC
    db $00

InstList_BG3Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D8D0;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88D8D3;

InstList_BG3Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll                                 ;88D8D6;
    dw Instruction_HDMAObject_GotoY                                      ;88D8DA;
    dw InstList_BG3Scroll_1                                              ;88D8DC;

FXType_28_CeresRidley:
    JSL.L Spawn_HDMAObject                                               ;88D8DE;
    db $40,$05                                                           ;88D8E2;
    dw InstList_CeresRidleyMode_BGTileSize_0                             ;88D8E4;
    JSL.L Spawn_HDMAObject                                               ;88D8E6;
    db $00,$2C                                                           ;88D8EA;
    dw InstList_CeresRidley_MainScreenLayers_0                           ;88D8EC;
    RTL                                                                  ;88D8EE;


RTL_88D8EF:
    RTL                                                                  ;88D8EF;


IndirectHDMATable_CeresRidleyMode_BGTileSize:
    db $1F : dw $07EB                                                    ;88D8F0;
    db $60 : dw $07EC
    db $50 : dw $07EC
    db $10 : dw $07EB
    db $00

IndirectHDMATable_CeresRidleyMainScreenLayers:                           ;88D8FD;
    db $1F,$04 ;         BG3
    db $60,$13 ; BG1/BG2/    sprites
    db $50,$13 ; BG1/BG2/    sprites
    db $10,$12 ;     BG2/    sprites
    db $00

InstList_CeresRidleyMode_BGTileSize_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D906;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $00             ;88D909;
    dw Instruction_VideoMode_for_HUD_and_Floor_1                         ;88D90C;

InstList_CeresRidleyMode_BGTileSize_1:
    dw $7FFF,IndirectHDMATable_CeresRidleyMode_BGTileSize                ;88D90E;
    dw Instruction_HDMAObject_GotoY                                      ;88D912;
    dw InstList_CeresRidleyMode_BGTileSize_1                             ;88D914;

Instruction_VideoMode_for_HUD_and_Floor_1:
    LDA.W #$0009                                                         ;88D916;
    STA.W $07EB                                                          ;88D919;
    RTS                                                                  ;88D91C;


InstList_CeresRidley_MainScreenLayers_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D91D;

InstList_CeresRidley_MainScreenLayers_1:
    dw $7FFF,IndirectHDMATable_CeresRidleyMainScreenLayers               ;88D920;
    dw Instruction_HDMAObject_GotoY                                      ;88D924;
    dw InstList_CeresRidley_MainScreenLayers_1                           ;88D926;

FXType_2A_CeresElevator:
    JSL.L Spawn_HDMAObject                                               ;88D928;
    db $40,$05                                                           ;88D92C;
    dw InstList_CeresElevatorMode_BGTileSize_0                           ;88D92E;
    RTL                                                                  ;88D930;


RTL_88D931:
    RTL                                                                  ;88D931;


IndirectHDMATable_CeresElevatorMode_BGTileSize:                          ;88D932;
    db $1F : dw $07EB
    db $70 : dw $07EC
    db $00

InstList_CeresElevatorMode_BGTileSize_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D939;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $00             ;88D93C;
    dw Instruction_VideoMode_for_HUD_1                                   ;88D93F;

InstList_CeresElevatorMode_BGTileSize_1:
    dw $7FFF,IndirectHDMATable_CeresElevatorMode_BGTileSize              ;88D941;
    dw Instruction_HDMAObject_GotoY                                      ;88D945;
    dw InstList_CeresElevatorMode_BGTileSize_1                           ;88D947;

Instruction_VideoMode_for_HUD_1:
    LDA.W #$0009                                                         ;88D949;
    STA.W $07EB                                                          ;88D94C;
    RTS                                                                  ;88D94F;


FXType_A_Rain:
    SEP #$20                                                             ;88D950;
    LDA.B #$5C                                                           ;88D952;
    STA.B $5B                                                            ;88D954;
    REP #$20                                                             ;88D956;
    JSL.L Spawn_HDMAObject                                               ;88D958;
    db $43,$11                                                           ;88D95C;
    dw InstList_Rain_BG3Scroll_0                                         ;88D95E;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88D960;
    LDY.W #AnimatedTilesObject_Rain                                      ;88D964;
    JSL.L Spawn_AnimatedTilesObject                                      ;88D967;
    RTL                                                                  ;88D96B;


InstList_Rain_BG3Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88D96C;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88D96F;
    dw Instruction_HDMAObjectBG3XVelocity                                ;88D972;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88D974;
    dl PreInstruction_RainBG3Scroll                                      ;88D976;

InstList_Rain_BG3Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll                                 ;88D979;
    dw Instruction_HDMAObject_GotoY                                      ;88D97D;
    dw InstList_Rain_BG3Scroll_1                                         ;88D97F;

Instruction_HDMAObjectBG3XVelocity:
    PHX                                                                  ;88D981;
    LDA.W $05E5                                                          ;88D982;
    LSR A                                                                ;88D985;
    AND.W #$0006                                                         ;88D986;
    TAX                                                                  ;88D989;
    LDA.W .BG3XVelocities,X                                              ;88D98A;
    PLX                                                                  ;88D98D;
    STA.W $1938,X                                                        ;88D98E;
    RTS                                                                  ;88D991;


.BG3XVelocities:
    dw $FA00,$0600,$FC00,$0400                                           ;88D992;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88D99A:
    db $1F : dw $CAD8                                                    ;88D99A;
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_RainBG3Scroll:
    PHB                                                                  ;88D9A1;
    LDY.B #$5C                                                           ;88D9A2;
    STY.B $5B                                                            ;88D9A4;
    LDA.W $1984                                                          ;88D9A6;
    STA.W $1986                                                          ;88D9A9;
    LDA.W $0A78                                                          ;88D9AC;
    BEQ .notFrozen                                                       ;88D9AF;
    PLB                                                                  ;88D9B1;
    RTL                                                                  ;88D9B2;


.notFrozen:
    LDA.W $1944,X                                                        ;88D9B3;
    SEC                                                                  ;88D9B6;
    SBC.W $0915                                                          ;88D9B7;
    STA.B $12                                                            ;88D9BA;
    LDA.W $1914,X                                                        ;88D9BC;
    XBA                                                                  ;88D9BF;
    BPL .lowByteD9C7                                                     ;88D9C0;
    ORA.W #$FF00                                                         ;88D9C2;
    BRA +                                                                ;88D9C5;


.lowByteD9C7:
    AND.W #$00FF                                                         ;88D9C7;

  + CLC                                                                  ;88D9CA;
    ADC.B $12                                                            ;88D9CB;
    STA.L $7ECADE                                                        ;88D9CD;
    LDA.W $1914,X                                                        ;88D9D1;
    CLC                                                                  ;88D9D4;
    ADC.W #$FA00                                                         ;88D9D5; -$600
    STA.W $1914,X                                                        ;88D9D8;
    LDA.W $0915                                                          ;88D9DB;
    STA.W $1944,X                                                        ;88D9DE;
    LDA.W $1950,X                                                        ;88D9E1;
    SEC                                                                  ;88D9E4;
    SBC.W $0911                                                          ;88D9E5;
    STA.B $12                                                            ;88D9E8;
    LDA.W $1920,X                                                        ;88D9EA;
    XBA                                                                  ;88D9ED;
    BPL .lowByteD9F5                                                     ;88D9EE;
    ORA.W #$FF00                                                         ;88D9F0;
    BRA +                                                                ;88D9F3;


.lowByteD9F5:
    AND.W #$00FF                                                         ;88D9F5;

  + CLC                                                                  ;88D9F8;
    ADC.B $12                                                            ;88D9F9;
    STA.L $7ECADC                                                        ;88D9FB;
    LDA.W $1920,X                                                        ;88D9FF;
    CLC                                                                  ;88DA02;
    ADC.W $1938,X                                                        ;88DA03;
    STA.W $1920,X                                                        ;88DA06;
    LDA.W $0911                                                          ;88DA09;
    STA.W $1950,X                                                        ;88DA0C;
    PLB                                                                  ;88DA0F;
    RTL                                                                  ;88DA10;


FXType_8_Spores:
    SEP #$20                                                             ;88DA11;
    LDA.B #$5C                                                           ;88DA13;
    STA.B $5B                                                            ;88DA15;
    REP #$20                                                             ;88DA17;
    JSL.L Spawn_HDMAObject                                               ;88DA19;
    db $42,$11                                                           ;88DA1D;
    dw InstList_Spores_BG3_Xscroll_0                                     ;88DA1F;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88DA21;
    LDY.W #AnimatedTilesObject_Spores                                    ;88DA25;
    JSL.L Spawn_AnimatedTilesObject                                      ;88DA28;
    RTL                                                                  ;88DA2C;


InstList_Spores_BG3_Xscroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DA2D;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DA30;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DA33;
    dl PreInstruction_Spores_BG3_Xsscroll                                ;88DA35;

InstList_Spores_BG3_Xscroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll                                 ;88DA38;
    dw Instruction_HDMAObject_GotoY                                      ;88DA3C;
    dw InstList_Spores_BG3_Xscroll_1                                     ;88DA3E;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88DA40:
    db $1F : dw $CAD8                                                    ;88DA40;
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_Spores_BG3_Xsscroll:
    PHB                                                                  ;88DA47;
    LDY.B #$5C                                                           ;88DA48;
    STY.B $5B                                                            ;88DA4A;
    LDA.W $1984                                                          ;88DA4C;
    STA.W $1986                                                          ;88DA4F;
    LDA.W $0A78                                                          ;88DA52;
    BEQ .notFrozen                                                       ;88DA55;
    PLB                                                                  ;88DA57;
    RTL                                                                  ;88DA58;


.notFrozen:
    LDA.W $192C,X                                                        ;88DA59;
    XBA                                                                  ;88DA5C;
    BPL .lowByteDA64                                                     ;88DA5D;
    ORA.W #$FF00                                                         ;88DA5F;
    BRA +                                                                ;88DA62;


.lowByteDA64:
    AND.W #$00FF                                                         ;88DA64;

  + CLC                                                                  ;88DA67;
    ADC.W $0915                                                          ;88DA68;
    STA.L $7ECADE                                                        ;88DA6B;
    LDA.W $192C,X                                                        ;88DA6F;
    CLC                                                                  ;88DA72;
    ADC.W #$FFC0                                                         ;88DA73;
    STA.W $192C,X                                                        ;88DA76;
    STA.B $14                                                            ;88DA79;
    LDA.W $1938,X                                                        ;88DA7B;
    XBA                                                                  ;88DA7E;
    BPL .lowByteDA86                                                     ;88DA7F;
    ORA.W #$FF00                                                         ;88DA81;
    BRA +                                                                ;88DA84;


.lowByteDA86:
    AND.W #$00FF                                                         ;88DA86;

  + CLC                                                                  ;88DA89;
    ADC.W $0911                                                          ;88DA8A;
    STA.L $7ECADC                                                        ;88DA8D;
    STA.B $12                                                            ;88DA91;
    LDA.W $1938,X                                                        ;88DA93;
    CLC                                                                  ;88DA96;
    ADC.W #$0000                                                         ;88DA97;
    STA.W $1938,X                                                        ;88DA9A;
    PLB                                                                  ;88DA9D;
    RTL                                                                  ;88DA9E;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_HandleSporesWaviness_88DA9F:
    DEC.W $1920,X                                                        ;88DA9F;
    BNE .setupLoop                                                       ;88DAA2;
    LDA.W #$000A                                                         ;88DAA4;
    STA.W $1920,X                                                        ;88DAA7;
    LDA.W $1914,X                                                        ;88DAAA;
    INC A                                                                ;88DAAD;
    INC A                                                                ;88DAAE;
    AND.W #$001F                                                         ;88DAAF;
    STA.W $1914,X                                                        ;88DAB2;

.setupLoop:
    LDA.W $1914,X                                                        ;88DAB5;
    TAX                                                                  ;88DAB8;
    LDY.B #$1E                                                           ;88DAB9;

.loop:
    LDA.B $12                                                            ;88DABB;
    CLC                                                                  ;88DABD;
    ADC.W $0AF6                                                          ;88DABE;
    ADC.W .waveDisplacementTable,Y                                       ;88DAC1;
    STA.L $7E9C04,X                                                      ;88DAC4;
    TXA                                                                  ;88DAC8;
    DEC A                                                                ;88DAC9;
    DEC A                                                                ;88DACA;
    AND.W #$001F                                                         ;88DACB;
    TAX                                                                  ;88DACE;
    DEY                                                                  ;88DACF;
    DEY                                                                  ;88DAD0;
    BPL .loop                                                            ;88DAD1;
    LDX.W $18B2                                                          ;88DAD3;
    LDA.W #$FFF0                                                         ;88DAD6;
    TRB.B $14                                                            ;88DAD9;
    LDA.B $14                                                            ;88DADB;
    ASL A                                                                ;88DADD;
    CLC                                                                  ;88DADE;
    ADC.B $14                                                            ;88DADF;
    ADC.W #IndirectHDMATable_WaterBG3XScroll_1                           ;88DAE1;
    STA.W $18D8,X                                                        ;88DAE4;
    RTL                                                                  ;88DAE7;


.waveDisplacementTable:
; Same as WaveDisplacementTable_Water
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88DAE8;
    dw $0000,$0001,$0001,$0000,$0000,$FFFF,$FFFF,$0000                   ;88DAF8;
endif ; !FEATURE_KEEP_UNREFERENCED

FXType_C_Fog:
    SEP #$20                                                             ;88DB08;
    LDA.B #$5C                                                           ;88DB0A;
    STA.B $5B                                                            ;88DB0C;
    REP #$20                                                             ;88DB0E;
    JSL.L Spawn_HDMAObject                                               ;88DB10;
    db $43,$11                                                           ;88DB14;
    dw InstList_Fog_BG3_Scroll_0                                         ;88DB16;
    RTL                                                                  ;88DB18;


InstList_Fog_BG3_Scroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DB19;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DB1C;
    dw RTS_88DB2E                                                        ;88DB1F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DB21;
    dl PreInstruction_Fog_BG3Scroll                                      ;88DB23;

InstList_Fog_BG3_Scroll_1:
    dw $7FFF,IndirectHDMATable_BG3Scroll                                 ;88DB26;
    dw Instruction_HDMAObject_GotoY                                      ;88DB2A;
    dw InstList_Fog_BG3_Scroll_1                                         ;88DB2C;

RTS_88DB2E:
    RTS                                                                  ;88DB2E;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_IndirectHDMATable_88DB2F:
    db $1F : dw $CAD8                                                    ;88DB2F;
    db $81 : dw $CADC
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_Fog_BG3Scroll:
    PHB                                                                  ;88DB36;
    LDY.B #$5C                                                           ;88DB37;
    STY.B $5B                                                            ;88DB39;
    LDA.W $1984                                                          ;88DB3B;
    STA.W $1986                                                          ;88DB3E;
    LDA.W $0A78                                                          ;88DB41;
    BEQ .timeNotFrozen                                                   ;88DB44;
    PLB                                                                  ;88DB46;
    RTL                                                                  ;88DB47;


.timeNotFrozen:
    LDA.W $1914,X                                                        ;88DB48;
    XBA                                                                  ;88DB4B;
    BPL .lowByteDB53                                                     ;88DB4C;
    ORA.W #$FF00                                                         ;88DB4E;
    BRA +                                                                ;88DB51;


.lowByteDB53:
    AND.W #$00FF                                                         ;88DB53;

  + CLC                                                                  ;88DB56;
    ADC.W $0915                                                          ;88DB57;
    STA.L $7ECADE                                                        ;88DB5A;
    LDA.W $1914,X                                                        ;88DB5E;
    CLC                                                                  ;88DB61;
    ADC.W #$FFC0                                                         ;88DB62;
    STA.W $1914,X                                                        ;88DB65;
    LDA.W $1920,X                                                        ;88DB68;
    XBA                                                                  ;88DB6B;
    BPL .lowByteDB73                                                     ;88DB6C;
    ORA.W #$FF00                                                         ;88DB6E;
    BRA +                                                                ;88DB71;


.lowByteDB73:
    AND.W #$00FF                                                         ;88DB73;

  + CLC                                                                  ;88DB76;
    ADC.W $0911                                                          ;88DB77;
    STA.L $7ECADC                                                        ;88DB7A;
    LDA.W $1920,X                                                        ;88DB7E;
    CLC                                                                  ;88DB81;
    ADC.W #$0050                                                         ;88DB82;
    STA.W $1920,X                                                        ;88DB85;
    PLB                                                                  ;88DB88;
    RTL                                                                  ;88DB89;


FXType_26_TourianEntranceStatue:
    LDA.W #$000A                                                         ;88DB8A;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DB8D;
    BCC .tourianLocked                                                   ;88DB91;
    JSL.L Spawn_Hardcoded_PLM                                            ;88DB93;
    db $06,$0C                                                           ;88DB97;
    dw PLMEntries_clearAccessToTourianElevator                           ;88DB99;
    LDA.W #$0202                                                         ;88DB9B;
    STA.L $7ECD20                                                        ;88DB9E;

.tourianLocked:
    SEP #$20                                                             ;88DBA2;
    LDA.B #$4A                                                           ;88DBA4;
    STA.B $59                                                            ;88DBA6;
    REP #$20                                                             ;88DBA8;
    LDA.W #FXRisingFunction_Water_Normal                                 ;88DBAA;
    STA.W $196C                                                          ;88DBAD;
    LDA.W $1978                                                          ;88DBB0;
    STA.W $195E                                                          ;88DBB3;
    JSL.L Spawn_HDMAObject                                               ;88DBB6;
    db $42,$11                                                           ;88DBBA;
    dw InstList_Water_BG3_Xscroll                                        ;88DBBC;
    JSL.L Spawn_HDMAObject                                               ;88DBBE;
    db $42,$10                                                           ;88DBC2;
    dw InstList_TourianEntranceStatue_BG2Yscroll_0                       ;88DBC4;
    JSL.L Spawn_BG3_Scroll_HDMA_Object                                   ;88DBC6;
    RTL                                                                  ;88DBCA;


Set_TourianEntranceStatue_BG2_Yscroll:
    LDA.W $1920,X                                                        ;88DBCB;
    CLC                                                                  ;88DBCE;
    ADC.W $0915                                                          ;88DBCF;
    STA.L $7E9E00                                                        ;88DBD2;
    RTS                                                                  ;88DBD6;


PreInst_TourianEntranceStatue_BG2_Yscroll_WaitForUnlock:
    PHP                                                                  ;88DBD7;
    REP #$30                                                             ;88DBD8;
    LDA.W #$0006                                                         ;88DBDA;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DBDD;
    BCC .setYscroll                                                      ;88DBE1;
    LDA.W #$0007                                                         ;88DBE3;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DBE6;
    BCC .setYscroll                                                      ;88DBEA;
    LDA.W #$0008                                                         ;88DBEC;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DBEF;
    BCC .setYscroll                                                      ;88DBF3;
    LDA.W #$0009                                                         ;88DBF5;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DBF8;
    BCC .setYscroll                                                      ;88DBFC;
    LDA.W #$0010                                                         ;88DBFE;
    TSB.W $1E6F                                                          ;88DC01;
    LDA.W $1E6F                                                          ;88DC04;
    BMI .setYscroll                                                      ;88DC07;
    LDA.W #$012C                                                         ;88DC09;
    STA.W $192C,X                                                        ;88DC0C;
    LDX.W $18B2                                                          ;88DC0F;
    LDA.W #$0001                                                         ;88DC12;
    STA.W $18E4,X                                                        ;88DC15;
    INC.W $18CC,X                                                        ;88DC18;
    INC.W $18CC,X                                                        ;88DC1B;

.setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll                          ;88DC1E;
    PLP                                                                  ;88DC21;
    RTL                                                                  ;88DC22;


PreInst_TourianEntranceStatue_BG2Yscroll_DescentDelay:
    JSR.W Handle_Earthquake_SoundEffect                                  ;88DC23;
    LDA.W #$000D                                                         ;88DC26;
    STA.W $183E                                                          ;88DC29;
    LDA.W #$0020                                                         ;88DC2C;
    TSB.W $1840                                                          ;88DC2F;
    DEC.W $192C,X                                                        ;88DC32;
    BPL .setYscroll                                                      ;88DC35;
    REP #$30                                                             ;88DC37;
    LDY.W #EnemyProjectile_TourianStatueDustClouds                       ;88DC39;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;88DC3C;
    LDY.W #EnemyProjectile_TourianStatueDustClouds                       ;88DC40;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;88DC43;
    LDY.W #EnemyProjectile_TourianStatueDustClouds                       ;88DC47;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;88DC4A;
    LDY.W #EnemyProjectile_TourianStatueDustClouds                       ;88DC4E;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;88DC51;
    SEP #$10                                                             ;88DC55;
    REP #$20                                                             ;88DC57;
    LDA.W #$0001                                                         ;88DC59;
    STA.W $18E4,X                                                        ;88DC5C;
    INC.W $18CC,X                                                        ;88DC5F;
    INC.W $18CC,X                                                        ;88DC62;

.setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll                          ;88DC65;
    RTL                                                                  ;88DC68;


PreInstruction_TourianEntranceStatue_BG2_Yscroll_Descending:
    JSR.W Handle_Earthquake_SoundEffect                                  ;88DC69;
    LDA.W #$000D                                                         ;88DC6C;
    STA.W $183E                                                          ;88DC6F;
    LDA.W #$0020                                                         ;88DC72;
    TSB.W $1840                                                          ;88DC75;
    LDA.W $0A78                                                          ;88DC78;
    BNE .return                                                          ;88DC7B;
    LDA.W $1914,X                                                        ;88DC7D;
    CLC                                                                  ;88DC80;
    ADC.W #$C000                                                         ;88DC81;
    STA.W $1914,X                                                        ;88DC84;
    LDA.W $1920,X                                                        ;88DC87;
    ADC.W #$FFFF                                                         ;88DC8A;
    STA.W $1920,X                                                        ;88DC8D;
    CMP.W #$FF10                                                         ;88DC90;
    BNE .setYscroll                                                      ;88DC93;
    PHX                                                                  ;88DC95;
    PHP                                                                  ;88DC96;
    REP #$10                                                             ;88DC97;
    JSL.L Spawn_Hardcoded_PLM                                            ;88DC99;
    db $06,$0C                                                           ;88DC9D;
    dw PLMEntries_crumbleAccessToTourianElevator                         ;88DC9F;
    PLP                                                                  ;88DCA1;
    PLX                                                                  ;88DCA2;
    LDA.W #$000A                                                         ;88DCA3;
    JSL.L MarkEvent_inA                                                  ;88DCA6;
    LDA.W #$0001                                                         ;88DCAA;
    STA.W $18E4,X                                                        ;88DCAD;
    INC.W $18CC,X                                                        ;88DCB0;
    INC.W $18CC,X                                                        ;88DCB3;

.setYscroll:
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll                          ;88DCB6;

.return:
    RTL                                                                  ;88DCB9;


PreInst_TourianEntranceStatue_BG2Yscroll_EnableScrolling:
    LDA.W #$8000                                                         ;88DCBA;
    STA.W $1E6D                                                          ;88DCBD;
    LDA.W #$0202                                                         ;88DCC0;
    STA.L $7ECD20                                                        ;88DCC3;
    JSR.W Set_TourianEntranceStatue_BG2_Yscroll                          ;88DCC7;
    RTL                                                                  ;88DCCA;


Instruction_GotoY_ifEntranceToTourianUnlocked:
    STZ.W $192C,X                                                        ;88DCCB;
    STZ.W $1914,X                                                        ;88DCCE;
    LDA.W #$000A                                                         ;88DCD1;
    JSL.L CheckIfEvent_inA_HasHappened                                   ;88DCD4;
    BCS .gotoY                                                           ;88DCD8;
    STZ.W $1920,X                                                        ;88DCDA;
    STA.L $7E9E00                                                        ;88DCDD;
    LDA.W #$0001                                                         ;88DCE1;
    STA.L $7ECD20                                                        ;88DCE4;
    INY                                                                  ;88DCE8;
    INY                                                                  ;88DCE9;
    RTS                                                                  ;88DCEA;


.gotoY:
    LDA.W #$FF10                                                         ;88DCEB;
    STA.W $1920,X                                                        ;88DCEE;
    STA.L $7E9E00                                                        ;88DCF1;
    LDA.W $0000,Y                                                        ;88DCF5;
    TAY                                                                  ;88DCF8;
    RTS                                                                  ;88DCF9;


InstList_TourianEntranceStatue_BG2Yscroll_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DCFA;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DCFD;
    dw Instruction_GotoY_ifEntranceToTourianUnlocked                     ;88DD00;
    dw InstList_TourianEntranceStatue_BG2Yscroll_1                       ;88DD02;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD04;
    dl PreInst_TourianEntranceStatue_BG2_Yscroll_WaitForUnlock           ;88DD06;
    dw $0001,IndirectHDMATable_TourianEntranceStatue_BG2YScroll          ;88DD09;
    dw Instruction_HDMAObject_Sleep                                      ;88DD0D;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD0F;
    dl PreInst_TourianEntranceStatue_BG2Yscroll_DescentDelay             ;88DD11;
    dw Instruction_HDMAObject_Sleep                                      ;88DD14;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD16;
    dl PreInstruction_TourianEntranceStatue_BG2_Yscroll_Descending       ;88DD18;
    dw Instruction_HDMAObject_Sleep                                      ;88DD1B;

InstList_TourianEntranceStatue_BG2Yscroll_1:
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD1D;
    dl PreInst_TourianEntranceStatue_BG2Yscroll_EnableScrolling          ;88DD1F;
    dw $0001,IndirectHDMATable_TourianEntranceStatue_BG2YScroll          ;88DD22;
    dw Instruction_HDMAObject_Sleep                                      ;88DD26;

IndirectHDMATable_TourianEntranceStatue_BG2YScroll:                      ;88DD28;
    db $1F : dw $9E00
    db $01 : dw $9E00
    db $01 : dw $9E00
    db $00

Spawn_BombTorizoHaze:
    JSL.L Spawn_HDMAObject                                               ;88DD32;
    db $02,$32                                                           ;88DD36;
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_0        ;88DD38;
    JSL.L Spawn_HDMAObject                                               ;88DD3A;
    db $00,$32                                                           ;88DD3E;
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_0        ;88DD40;
    RTL                                                                  ;88DD42;


PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor:
    LDA.W #$002C                                                         ;88DD43;
    STA.W $1986                                                          ;88DD46;
    RTL                                                                  ;88DD49;


PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DD4A;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88DD4D;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DD50;
    dl PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor               ;88DD52;
    dw $0001,HDMATable_Nothing_88DD61                                    ;88DD55;

PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_1:
    dw $7777,HDMATable_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed  ;88DD59;
    dw Instruction_HDMAObject_GotoY                                      ;88DD5D;
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed_1        ;88DD5F;

HDMATable_Nothing_88DD61:
    db $00                                                               ;88DD61;

PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DD62;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88DD65;
    dw $0001,HDMATable_Nothing_88DD74                                    ;88DD68;

PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_1:
    dw $7777,HDMATable_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue  ;88DD6C;
    dw Instruction_HDMAObject_GotoY                                      ;88DD70;
    dw PreInst_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue_1        ;88DD72;

HDMATable_Nothing_88DD74:
    db $00                                                               ;88DD74;

HDMATable_BombTorizoHaze_ColorMathSubScnBackColor_GreenRed:
    db $48,$20,$40                                                       ;88DD75;
    db $0A,$21,$41
    db $0A,$21,$41
    db $0A,$21,$41
    db $0A,$22,$42
    db $0A,$22,$42
    db $0A,$22,$42
    db $0A,$23,$43
    db $0A,$23,$43
    db $0A,$23,$43
    db $0A,$24,$44
    db $0A,$24,$44
    db $0A,$24,$44
    db $0A,$25,$45
    db $0A,$25,$45
    db $0A,$25,$45
    db $00

HDMATable_BombTorizoHaze_ColorMathSubScnBackdropColor_Blue:
    db $48,$80                                                           ;88DDA6;
    db $0A,$81
    db $0A,$81
    db $0A,$82
    db $0A,$82
    db $0A,$83
    db $0A,$83
    db $0A,$84
    db $0A,$84
    db $0A,$85
    db $0A,$85
    db $0A,$86
    db $0A,$86
    db $0A,$87
    db $0A,$87
    db $0A,$88
    db $00

FXType_2C_CeresHaze:
    LDA.W #$0001                                                         ;88DDC7;
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA                   ;88DDCA;
    BCS .alive                                                           ;88DDCE;
    JSL.L Spawn_HDMAObject                                               ;88DDD0;
    db $40,$32                                                           ;88DDD4;
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_0         ;88DDD6;
    RTL                                                                  ;88DDD8;


.alive:
    JSL.L Spawn_HDMAObject                                               ;88DDD9;
    db $40,$32                                                           ;88DDDD;
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_0          ;88DDDF;
    RTL                                                                  ;88DDE1;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Set_CeresHaze_PreInstruction_for_NoFade_88DDE2:
    LDA.W #UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade  ;88DDE2;
    STA.W $18F0,X                                                        ;88DDE5;

UNUSED_PreInst_CeresHaze_ColorMathSubScnBackdropColor_NoFade:
    LDY.B #$20                                                           ;88DDE8;
    STY.B $74                                                            ;88DDEA;
    LDY.B #$40                                                           ;88DDEC;
    STY.B $75                                                            ;88DDEE;
    LDY.B #$80                                                           ;88DDF0;
    STY.B $76                                                            ;88DDF2;
    LDA.W #$002C                                                         ;88DDF4;
    STA.W $1986                                                          ;88DDF7;
    SEP #$20                                                             ;88DDFA;
    PHX                                                                  ;88DDFC;
    LDA.W $1920,X                                                        ;88DDFD;
    ORA.B #$0F                                                           ;88DE00;
    LDX.B #$0F                                                           ;88DE02;

.loop:
    STA.L $7E9D00,X                                                      ;88DE04;
    DEC A                                                                ;88DE08;
    DEX                                                                  ;88DE09;
    BPL .loop                                                            ;88DE0A;
    PLX                                                                  ;88DE0C;
    REP #$20                                                             ;88DE0D;
    RTL                                                                  ;88DE0F;
endif ; !FEATURE_KEEP_UNREFERENCED


PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsAlive:
    LDA.W #$0080                                                         ;88DE10;
    BRA Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn     ;88DE13;


PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsDead:
    LDA.W #$0020                                                         ;88DE15;

Setup_CeresHaze_ColorMathSubScnBackColor_HDMAObject_FadingIn:
    STA.W $1920,X                                                        ;88DE18;
    STZ.W $1914,X                                                        ;88DE1B;
    LDA.W $099C                                                          ;88DE1E;
    CMP.W #DoorTransitionFunction_FadeInTheScreen_and_RunEnemies_Finish  ;88DE21;
    BEQ .fadingIn                                                        ;88DE24;
    RTL                                                                  ;88DE26;


.fadingIn:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingIn    ;88DE27;
    STA.W $18F0,X                                                        ;88DE2A;

PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingIn:
    LDY.B #$20                                                           ;88DE2D;
    STY.B $74                                                            ;88DE2F;
    LDY.B #$40                                                           ;88DE31;
    STY.B $75                                                            ;88DE33;
    LDY.B #$80                                                           ;88DE35;
    STY.B $76                                                            ;88DE37;
    LDA.W #$002C                                                         ;88DE39;
    STA.W $1986                                                          ;88DE3C;
    LDA.W $1914,X                                                        ;88DE3F;
    CMP.W #$0010                                                         ;88DE42;
    BEQ .done                                                            ;88DE45;
    PHX                                                                  ;88DE47;
    PHP                                                                  ;88DE48;
    SEP #$20                                                             ;88DE49;
    LDA.W $1920,X                                                        ;88DE4B;
    STA.B $14                                                            ;88DE4E;
    LDA.W $1914,X                                                        ;88DE50;
    LDX.B #$0F                                                           ;88DE53;

.loop:
    STA.B $12                                                            ;88DE55;
    ORA.B $14                                                            ;88DE57;
    STA.L $7E9D00,X                                                      ;88DE59;
    LDA.B $12                                                            ;88DE5D;
    DEC A                                                                ;88DE5F;
    BPL .next                                                            ;88DE60;
    LDA.B #$00                                                           ;88DE62;

.next:
    DEX                                                                  ;88DE64;
    BPL .loop                                                            ;88DE65;
    PLP                                                                  ;88DE67;
    PLX                                                                  ;88DE68;
    INC.W $1914,X                                                        ;88DE69;
    RTL                                                                  ;88DE6C;


.done:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadedIn     ;88DE6D;
    STA.W $18F0,X                                                        ;88DE70;
    RTL                                                                  ;88DE73;


PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadedIn:
    LDY.B #$20                                                           ;88DE74;
    STY.B $74                                                            ;88DE76;
    LDY.B #$40                                                           ;88DE78;
    STY.B $75                                                            ;88DE7A;
    LDY.B #$80                                                           ;88DE7C;
    STY.B $76                                                            ;88DE7E;
    LDA.W #$002C                                                         ;88DE80;
    STA.W $1986                                                          ;88DE83;
    LDA.W $099C                                                          ;88DE86;
    CMP.W #DoorTransitionFunction_FadeOutTheScreen                       ;88DE89;
    BEQ .fadingOut                                                       ;88DE8C;
    RTL                                                                  ;88DE8E;


.fadingOut:
    LDA.W #PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingOut   ;88DE8F;
    STA.W $18F0,X                                                        ;88DE92;
    RTL                                                                  ;88DE95;


PreInstruction_CeresHaze_ColorMathSubScnBackColor_FadingOut:
    LDY.B #$20                                                           ;88DE96;
    STY.B $74                                                            ;88DE98;
    LDY.B #$40                                                           ;88DE9A;
    STY.B $75                                                            ;88DE9C;
    LDY.B #$80                                                           ;88DE9E;
    STY.B $76                                                            ;88DEA0;
    LDA.W #$002C                                                         ;88DEA2;
    STA.W $1986                                                          ;88DEA5;
    LDA.W $1914,X                                                        ;88DEA8;
    BEQ .return                                                          ;88DEAB;
    PHX                                                                  ;88DEAD;
    PHP                                                                  ;88DEAE;
    SEP #$20                                                             ;88DEAF;
    LDA.W $1920,X                                                        ;88DEB1;
    STA.B $14                                                            ;88DEB4;
    LDA.W $1914,X                                                        ;88DEB6;
    LDX.B #$0F                                                           ;88DEB9;

.loop:
    STA.B $12                                                            ;88DEBB;
    ORA.B $14                                                            ;88DEBD;
    STA.L $7E9D00,X                                                      ;88DEBF;
    LDA.B $12                                                            ;88DEC3;
    DEC A                                                                ;88DEC5;
    BPL .next                                                            ;88DEC6;
    LDA.B #$00                                                           ;88DEC8;

.next:
    DEX                                                                  ;88DECA;
    BPL .loop                                                            ;88DECB;
    PLP                                                                  ;88DECD;
    PLX                                                                  ;88DECE;
    DEC.W $1914,X                                                        ;88DECF;

.return:
    RTL                                                                  ;88DED2;


InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DED3;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DED6;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DED9;
    dl PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsAlive      ;88DEDB;
    dw $0001,Empty_HDMATable_88DEEA                                      ;88DEDE;

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_1:
    dw $7777,IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor    ;88DEE2;
    dw Instruction_HDMAObject_GotoY                                      ;88DEE6;
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyAlive_1         ;88DEE8;

Empty_HDMATable_88DEEA:
    db $00                                                               ;88DEEA;

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_0:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DEEB;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88DEEE;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DEF1;
    dl PreInst_CeresHaze_ColorMathSubScnBackdropColor_RidleyIsDead       ;88DEF3;
    dw $0001,Empty_HDMATable_88DF02                                      ;88DEF6;

InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_1:
    dw $7777,IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor    ;88DEFA;
    dw Instruction_HDMAObject_GotoY                                      ;88DEFE;
    dw InstList_CeresHaze_ColorMathSubScnBackColor_RidleyDead_1          ;88DF00;

Empty_HDMATable_88DF02:
    db $00                                                               ;88DF02;

IndirectHDMATable_CeresHaze_ColorMathSubScnBackdropColor:
    db $40 : dw $9D00                                                    ;88DF03;
    db $08 : dw $9D01
    db $08 : dw $9D02
    db $08 : dw $9D03
    db $08 : dw $9D04
    db $08 : dw $9D05
    db $08 : dw $9D06
    db $08 : dw $9D07
    db $08 : dw $9D08
    db $08 : dw $9D09
    db $08 : dw $9D0A
    db $08 : dw $9D0B
    db $08 : dw $9D0C
    db $08 : dw $9D0D
    db $08 : dw $9D0E
    db $08 : dw $9D0F
    db $00

Spawn_DraygonMainScreenLayers_HDMAObject:
    JSL.L Spawn_HDMAObject                                               ;88DF34;
    db $00,$2C                                                           ;88DF38;
    dw InstList_DraygonMainScreenLayers_Initial                          ;88DF3A;
    RTL                                                                  ;88DF3C;


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpawnHDMAObject_88DF3D:
    JSL.L Spawn_HDMAObject                                               ;88DF3D;
    db $00,$2C                                                           ;88DF41;
    dw InstList_DraygonMainScreenLayers_DraygonAroundTop                 ;88DF43;
    RTL                                                                  ;88DF45;


UNUSED_SpawnHDMAObject_88DF46:
    JSL.L Spawn_HDMAObject                                               ;88DF46;
    db $02,$12                                                           ;88DF4A;
    dw UNUSED_InstList_BG3_Yscroll_0_88DF77                              ;88DF4C;
    RTL                                                                  ;88DF4E;
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_DraygonMainScreenLayers_Initial:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DF4F;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88DF52;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88DF55;
    dl RTL_88DF91                                                        ;88DF57;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DF5A;
    dl PreInstruction_DraygonMainScreenLayers                            ;88DF5C;

InstList_DraygonMainScreenLayers_DraygonAroundMiddle:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundMiddle       ;88DF5F;
    dw Instruction_HDMAObject_Sleep                                      ;88DF63;

InstList_DraygonMainScreenLayers_DraygonAroundBottom:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundBottom       ;88DF65;
    dw Instruction_HDMAObject_Sleep                                      ;88DF69;

InstList_DraygonMainScreenLayers_DraygonAroundTop:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonAroundTop          ;88DF6B;
    dw Instruction_HDMAObject_Sleep                                      ;88DF6F;

InstList_DraygonMainScreenLayers_DraygonOffScreen:
    dw $0001,HDMATable_DraygonMainScreenLayers_DraygonOffScreen          ;88DF71;
    dw Instruction_HDMAObject_Sleep                                      ;88DF75;

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_BG3_Yscroll_0_88DF77:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88DF77;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88DF7A;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88DF7D;
    dl RTL_88DF92                                                        ;88DF7F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88DF82;
    dl RTL_88DF93                                                        ;88DF84;

UNUSED_InstList_BG3_Yscroll_1_88DF87:
    dw $0001,UNUSED_HDMATable_BG3_Yscroll                                ;88DF87;
    dw Instruction_HDMAObject_GotoY                                      ;88DF8B;
    dw UNUSED_InstList_BG3_Yscroll_1_88DF87                              ;88DF8D;
    dw Instruction_HDMAObject_Sleep                                      ;88DF8F;
endif ; !FEATURE_KEEP_UNREFERENCED

RTL_88DF91:
    RTL                                                                  ;88DF91;


RTL_88DF92:
    RTL                                                                  ;88DF92;


RTL_88DF93:
    RTL                                                                  ;88DF93;


PreInstruction_DraygonMainScreenLayers:
    LDA.W $0F86                                                          ;88DF94;
    BIT.W #$0200                                                         ;88DF97;
    BNE .offScreen                                                       ;88DF9A;
    LDA.W $0F7A                                                          ;88DF9C;
    SEC                                                                  ;88DF9F;
    SBC.W $0911                                                          ;88DFA0;
    CLC                                                                  ;88DFA3;
    ADC.W #$0040                                                         ;88DFA4;
    BMI .offScreen                                                       ;88DFA7;
    CMP.W #$0180                                                         ;88DFA9;
    BPL .offScreen                                                       ;88DFAC;
    LDA.W $0F7E                                                          ;88DFAE;
    SEC                                                                  ;88DFB1;
    SBC.W $0915                                                          ;88DFB2;
    CLC                                                                  ;88DFB5;
    ADC.W #$0010                                                         ;88DFB6;
    BMI .offScreen                                                       ;88DFB9;
    LDA.W $0F7E                                                          ;88DFBB;
    SEC                                                                  ;88DFBE;
    SBC.W $0915                                                          ;88DFBF;
    CMP.W #$0130                                                         ;88DFC2;
    BPL .offScreen                                                       ;88DFC5;
    CMP.W #$0028                                                         ;88DFC7;
    BMI .aroundTop                                                       ;88DFCA;
    CMP.W #$00C0                                                         ;88DFCC;
    BMI .aroundMiddle                                                    ;88DFCF;
    BRA .aroundBottom                                                    ;88DFD1;


.aroundTop:
    LDA.W #$0001                                                         ;88DFD3;
    STA.W $18E4,X                                                        ;88DFD6;
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundTop             ;88DFD9;
    STA.W $18CC,X                                                        ;88DFDC;
    RTL                                                                  ;88DFDF;


.offScreen:
    LDA.W #$0001                                                         ;88DFE0;
    STA.W $18E4,X                                                        ;88DFE3;
    LDA.W #InstList_DraygonMainScreenLayers_DraygonOffScreen             ;88DFE6;
    STA.W $18CC,X                                                        ;88DFE9;
    RTL                                                                  ;88DFEC;


.aroundBottom:
    LDA.W #$0001                                                         ;88DFED;
    STA.W $18E4,X                                                        ;88DFF0;
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundBottom          ;88DFF3;
    STA.W $18CC,X                                                        ;88DFF6;
    RTL                                                                  ;88DFF9;


.aroundMiddle:
    LDA.W #$0001                                                         ;88DFFA;
    STA.W $18E4,X                                                        ;88DFFD;
    LDA.W #InstList_DraygonMainScreenLayers_DraygonAroundMiddle          ;88E000;
    STA.W $18CC,X                                                        ;88E003;
    RTL                                                                  ;88E006;


HDMATable_DraygonMainScreenLayers_DraygonAroundMiddle:                   ;88E007;
    db $1F,$04 ;         BG3
    db $81,$13 ; BG1/BG2/    sprites
    db $00

HDMATable_DraygonMainScreenLayers_DraygonAroundBottom:                   ;88E00C;
    db $1F,$04 ;         BG3
    db $60,$11 ; BG1/        sprites
    db $81,$13 ; BG1/BG2/    sprites
    db $00

HDMATable_DraygonMainScreenLayers_DraygonAroundTop:                      ;88E013;
    db $1F,$04 ;         BG3
    db $40,$13 ; BG1/BG2/    sprites
    db $81,$11 ; BG1/        sprites
    db $00

HDMATable_DraygonMainScreenLayers_DraygonOffScreen:                      ;88E01A;
    db $1F,$04 ;         BG3
    db $81,$11 ; BG1/        sprites
    db $00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_HDMATable_BG3_Yscroll:
    db $40 : dw $0000                                                    ;88E01F;
    db $81 : dw $0020
    db $00
endif ; !FEATURE_KEEP_UNREFERENCED

PreInstruction_VariaSuitPickup:
    PHP                                                                  ;88E026;
    REP #$30                                                             ;88E027;
    LDA.W $0DEC                                                          ;88E029;
    ASL A                                                                ;88E02C;
    TAX                                                                  ;88E02D;
    JSR.W (.pointers,X)                                                  ;88E02E;
    BCC .return                                                          ;88E031;
    SEP #$20                                                             ;88E033;
    LDA.W $0DF0                                                          ;88E035;
    STA.B $74                                                            ;88E038;
    LDA.W $0DF1                                                          ;88E03A;
    STA.B $75                                                            ;88E03D;
    LDA.W $0DF2                                                          ;88E03F;
    STA.B $76                                                            ;88E042;
    REP #$20                                                             ;88E044;
    LDA.W #$0012                                                         ;88E046;
    STA.W $1986                                                          ;88E049;

.return:
    PLP                                                                  ;88E04C;
    RTL                                                                  ;88E04D;


.pointers:
    dw SuitPickup_Stage0_LightBeamAppears                                ;88E04E;
    dw SuitPickup_Stage1_LightBeamWidens_Linear                          ;88E050;
    dw SuitPickup_Stage3_LightBeamWidens_Curved                          ;88E052;
    dw VariaSuitPickup_Stage3_GiveSamusVariaSuit                         ;88E054;
    dw SuitPickup_Stage4_LightBeamShrinks                                ;88E056;
    dw SuitPickup_Stage5_LightBeamDissipates                             ;88E058;
    dw VariaSuitPickup_Stage6                                            ;88E05A;

PreInstruction_GravitySuitPickup:
    PHP                                                                  ;88E05C;
    REP #$30                                                             ;88E05D;
    LDA.W $0DEC                                                          ;88E05F;
    ASL A                                                                ;88E062;
    TAX                                                                  ;88E063;
    JSR.W (.poitners,X)                                                  ;88E064;
    BCC .return                                                          ;88E067;
    SEP #$20                                                             ;88E069;
    LDA.W $0DF0                                                          ;88E06B;
    STA.B $74                                                            ;88E06E;
    LDA.W $0DF1                                                          ;88E070;
    STA.B $75                                                            ;88E073;
    LDA.W $0DF2                                                          ;88E075;
    STA.B $76                                                            ;88E078;
    REP #$20                                                             ;88E07A;
    LDA.W #$0012                                                         ;88E07C;
    STA.W $1986                                                          ;88E07F;

.return:
    PLP                                                                  ;88E082;
    RTL                                                                  ;88E083;


.poitners:
    dw SuitPickup_Stage0_LightBeamAppears                                ;88E084;
    dw SuitPickup_Stage1_LightBeamWidens_Linear                          ;88E086;
    dw SuitPickup_Stage3_LightBeamWidens_Curved                          ;88E088;
    dw GravitySuitPickup_Stage3_GiveSamusGravitySuit                     ;88E08A;
    dw SuitPickup_Stage4_LightBeamShrinks                                ;88E08C;
    dw SuitPickup_Stage5_LightBeamDissipates                             ;88E08E;
    dw GravitySuitPickup_Stage6                                          ;88E090;

SuitPickup_Stage0_LightBeamAppears:
    LDA.W $0DEE                                                          ;88E092;
    CLC                                                                  ;88E095;
    ADC.W #$0008                                                         ;88E096;
    STA.W $0DEE                                                          ;88E099;
    TAY                                                                  ;88E09C;
    LDX.W #$0000                                                         ;88E09D;

.loopUpperHalf:
    LDA.W .positions                                                     ;88E0A0;
    STA.L $7E9800,X                                                      ;88E0A3;
    INX                                                                  ;88E0A7;
    INX                                                                  ;88E0A8;
    DEY                                                                  ;88E0A9;
    BEQ +                                                                ;88E0AA;
    BPL .loopUpperHalf                                                   ;88E0AC;

  + LDX.W #$01FE                                                         ;88E0AE;
    LDY.W $0DEE                                                          ;88E0B1;

.loopLowerHalf:
    LDA.W .positions                                                     ;88E0B4;
    STA.L $7E9800,X                                                      ;88E0B7;
    DEX                                                                  ;88E0BB;
    DEX                                                                  ;88E0BC;
    DEY                                                                  ;88E0BD;
    BEQ +                                                                ;88E0BE;
    BPL .loopLowerHalf                                                   ;88E0C0;

  + LDA.W $0DEE                                                          ;88E0C2;
    CMP.W #$0080                                                         ;88E0C5;
    BMI .return                                                          ;88E0C8;
    INC.W $0DEC                                                          ;88E0CA;
    LDA.W #$7878                                                         ;88E0CD;
    STA.W $0DEE                                                          ;88E0D0;

.return:
    SEC                                                                  ;88E0D3;
    RTS                                                                  ;88E0D4;


.positions:
    db $78,$78                                                           ;88E0D5;

SuitPickup_Stage1_LightBeamWidens_Linear:
    SEP #$20                                                             ;88E0D7;
    LDA.W $0DEE                                                          ;88E0D9;
    SEC                                                                  ;88E0DC;
    SBC.W $0DDD                                                          ;88E0DD;
    STA.W $0DEE                                                          ;88E0E0;
    LDA.W $0DEF                                                          ;88E0E3;
    CLC                                                                  ;88E0E6;
    ADC.W $0DDD                                                          ;88E0E7;
    STA.W $0DEF                                                          ;88E0EA;
    REP #$20                                                             ;88E0ED;
    LDX.W #$01FE                                                         ;88E0EF;

.loop:
    LDA.W $0DEE                                                          ;88E0F2;
    STA.L $7E9800,X                                                      ;88E0F5;
    DEX                                                                  ;88E0F9;
    DEX                                                                  ;88E0FA;
    BPL .loop                                                            ;88E0FB;
    LDA.W $0DEE                                                          ;88E0FD;
    AND.W #$00FF                                                         ;88E100;
    CMP.W #$0061                                                         ;88E103;
    BPL .return                                                          ;88E106;
    INC.W $0DEC                                                          ;88E108;
    LDA.W #$846C                                                         ;88E10B; Suit pickup light beam left position = 6Ch, right position = 84h
    STA.W $0DEE                                                          ;88E10E;

.return:
    SEC                                                                  ;88E111;
    RTS                                                                  ;88E112;


SuitPickup_Stage3_LightBeamWidens_Curved:
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToWhite    ;88E113;
    REP #$10                                                             ;88E116;
    SEP #$20                                                             ;88E118;
    LDA.W $0DEE                                                          ;88E11A;
    SEC                                                                  ;88E11D;
    SBC.W $0DDD                                                          ;88E11E;
    STA.W $0DEE                                                          ;88E121;
    BEQ .lessThanZero                                                    ;88E124;
    BMI .lessThanZero                                                    ;88E126;
    LDA.W $0DEF                                                          ;88E128;
    CLC                                                                  ;88E12B;
    ADC.W $0DDD                                                          ;88E12C;
    BCC .greaterThanZero                                                 ;88E12F;
    LDA.B #$FF                                                           ;88E131;

.greaterThanZero:
    STA.W $0DEF                                                          ;88E133;
    REP #$20                                                             ;88E136;
    BRA .loopSetup                                                       ;88E138;


.lessThanZero:
    REP #$20                                                             ;88E13A;
    LDA.W #$FF00                                                         ;88E13C;
    STA.W $0DEE                                                          ;88E13F;

.loopSetup:
    SEP #$20                                                             ;88E142;
    LDX.W #$0000                                                         ;88E144;
    LDY.W #$0000                                                         ;88E147;

.loopUpperHalf:
    LDA.W $0DEE                                                          ;88E14A;
    SEC                                                                  ;88E14D;
    SBC.W SuitPickup_LightBeam_CurveWidths,Y                             ;88E14E;
    BPL +                                                                ;88E151;
    LDA.B #$00                                                           ;88E153;

  + STA.L $7E9800,X                                                      ;88E155;
    INX                                                                  ;88E159;
    LDA.W $0DEF                                                          ;88E15A;
    CLC                                                                  ;88E15D;
    ADC.W SuitPickup_LightBeam_CurveWidths,Y                             ;88E15E;
    BCC +                                                                ;88E161;
    LDA.B #$FF                                                           ;88E163;

  + STA.L $7E9800,X                                                      ;88E165;
    INX                                                                  ;88E169;
    INY                                                                  ;88E16A;
    CPX.W #$0100                                                         ;88E16B;
    BMI .loopUpperHalf                                                   ;88E16E;
    DEY                                                                  ;88E170;

.loopLowerHalf:
    LDA.W $0DEE                                                          ;88E171;
    SEC                                                                  ;88E174;
    SBC.W SuitPickup_LightBeam_CurveWidths,Y                             ;88E175;
    BPL +                                                                ;88E178;
    LDA.B #$00                                                           ;88E17A;

  + STA.L $7E9800,X                                                      ;88E17C;
    INX                                                                  ;88E180;
    LDA.W $0DEF                                                          ;88E181;
    CLC                                                                  ;88E184;
    ADC.W SuitPickup_LightBeam_CurveWidths,Y                             ;88E185;
    BCC +                                                                ;88E188;
    LDA.B #$FF                                                           ;88E18A;

  + STA.L $7E9800,X                                                      ;88E18C;
    INX                                                                  ;88E190;
    DEY                                                                  ;88E191;
    CPX.W #$0200                                                         ;88E192;
    BMI .loopLowerHalf                                                   ;88E195;
    REP #$20                                                             ;88E197;
    LDA.W $0DDC                                                          ;88E199;
    CLC                                                                  ;88E19C;
    ADC.W #$0060                                                         ;88E19D;
    STA.W $0DDC                                                          ;88E1A0;
    LDA.W $0DEE                                                          ;88E1A3;
    CMP.W #$FF00                                                         ;88E1A6;
    BNE .return                                                          ;88E1A9;
    INC.W $0DEC                                                          ;88E1AB;
    LDA.W $0DDC                                                          ;88E1AE;
    LSR A                                                                ;88E1B1;
    STA.W $0DDC                                                          ;88E1B2;
    STZ.W $0DEE                                                          ;88E1B5;

.return:
    SEC                                                                  ;88E1B8;
    RTS                                                                  ;88E1B9;


SuitPickup_Stage4_LightBeamShrinks:
    LDA.W $0DF2                                                          ;88E1BA;
    BIT.W #$FF00                                                         ;88E1BD;
    BNE .advanceToOrange                                                 ;88E1C0;
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToOrange   ;88E1C2;
    BRA +                                                                ;88E1C5;


.advanceToOrange:
    JSR.W AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToBlue     ;88E1C7;

  + LDA.W $0DDC                                                          ;88E1CA;
    AND.W #$FF00                                                         ;88E1CD;
    XBA                                                                  ;88E1D0;
    STA.B $12                                                            ;88E1D1;
    LDA.W $0DEE                                                          ;88E1D3;
    CLC                                                                  ;88E1D6;
    ADC.B $12                                                            ;88E1D7;
    STA.W $0DEE                                                          ;88E1D9;
    TAY                                                                  ;88E1DC;
    LDX.W #$0000                                                         ;88E1DD;

.loopUpperHalf:
    LDA.W #$00FF                                                         ;88E1E0;
    STA.L $7E9800,X                                                      ;88E1E3;
    INX                                                                  ;88E1E7;
    INX                                                                  ;88E1E8;
    DEY                                                                  ;88E1E9;
    BEQ .setupLowerLoop                                                  ;88E1EA;
    BPL .loopUpperHalf                                                   ;88E1EC;

.setupLowerLoop:
    LDX.W #$01FE                                                         ;88E1EE;
    LDY.W $0DEE                                                          ;88E1F1;
    DEY                                                                  ;88E1F4;

.loopLowerHalf:
    LDA.W #$00FF                                                         ;88E1F5;
    STA.L $7E9800,X                                                      ;88E1F8;
    DEX                                                                  ;88E1FC;
    DEX                                                                  ;88E1FD;
    DEY                                                                  ;88E1FE;
    BEQ +                                                                ;88E1FF;
    BPL .loopLowerHalf                                                   ;88E201;

  + LDA.W $0DDC                                                          ;88E203;
    SEC                                                                  ;88E206;
    SBC.W #$0020                                                         ;88E207;
    STA.W $0DDC                                                          ;88E20A;
    CMP.W #$0100                                                         ;88E20D;
    BPL +                                                                ;88E210;
    LDA.W #$0100                                                         ;88E212;
    STA.W $0DDC                                                          ;88E215;

  + LDA.W $0DEE                                                          ;88E218;
    CMP.W #$0080                                                         ;88E21B;
    BMI .return                                                          ;88E21E;
    INC.W $0DEC                                                          ;88E220;
    LDA.W #$F8FF                                                         ;88E223;
    STA.W $0DEE                                                          ;88E226;

.return:
    SEC                                                                  ;88E229;
    RTS                                                                  ;88E22A;


SuitPickup_Stage5_LightBeamDissipates:
    SEP #$20                                                             ;88E22B;
    LDA.W $0DEE                                                          ;88E22D;
    CLC                                                                  ;88E230;
    ADC.B #$08                                                           ;88E231;
    STA.W $0DEE                                                          ;88E233;
    LDA.W $0DEF                                                          ;88E236;
    SEC                                                                  ;88E239;
    SBC.B #$08                                                           ;88E23A;
    STA.W $0DEF                                                          ;88E23C;
    REP #$20                                                             ;88E23F;
    LDA.W $0DEE                                                          ;88E241;
    STA.L $7E9900                                                        ;88E244;
    LDA.W $0DEE                                                          ;88E248;
    AND.W #$00FF                                                         ;88E24B;
    CMP.W #$0070                                                         ;88E24E;
    BMI .return                                                          ;88E251;
    INC.W $0DEC                                                          ;88E253;

.return:
    SEC                                                                  ;88E256;
    RTS                                                                  ;88E257;


VariaSuitPickup_Stage6:
    LDA.W #$0003                                                         ;88E258;
    JSL.L QueueMusicDataOrTrack_8FrameDelay                              ;88E25B;

GravitySuitPickup_Stage6:
    SEP #$20                                                             ;88E25F;
    LDA.B #$80                                                           ;88E261;
    STA.B $76                                                            ;88E263;
    LDA.B #$40                                                           ;88E265;
    STA.B $75                                                            ;88E267;
    LDA.B #$20                                                           ;88E269;
    STA.B $74                                                            ;88E26B;
    REP #$20                                                             ;88E26D;
    LDA.W #$0001                                                         ;88E26F;
    STA.W $0A88                                                          ;88E272;
    LDA.W #$9800                                                         ;88E275; $7E
    STA.W $0A89                                                          ;88E278;
    STZ.W $0A8B                                                          ;88E27B;
    STZ.W $0A8C                                                          ;88E27E;
    STZ.W $0A8E                                                          ;88E281;
    STZ.W $0A90                                                          ;88E284;
    LDA.W #$00FF                                                         ;88E287;
    STA.L $7E9800                                                        ;88E28A;
    STZ.W $0DEC                                                          ;88E28E;
    STZ.W $0DEE                                                          ;88E291;
    STZ.W $0DF0                                                          ;88E294;
    STZ.W $0DF2                                                          ;88E297;
    LDX.W $18B2                                                          ;88E29A;
    LDA.W $18CC,X                                                        ;88E29D;
    INC A                                                                ;88E2A0;
    INC A                                                                ;88E2A1;
    STA.W $18CC,X                                                        ;88E2A2;
    LDA.W #$0001                                                         ;88E2A5;
    STA.W $18E4,X                                                        ;88E2A8;
    LDA.W #$000B                                                         ;88E2AB;
    JSL.L Run_Samus_Command                                              ;88E2AE;
    CLC                                                                  ;88E2B2;
    RTS                                                                  ;88E2B3;


AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToWhite:
    SEP #$20                                                             ;88E2B4;
    LDA.W $0DF0                                                          ;88E2B6;
    CMP.B #$3F                                                           ;88E2B9;
    BEQ .green                                                           ;88E2BB;
    INC A                                                                ;88E2BD;
    INC A                                                                ;88E2BE;
    STA.W $0DF0                                                          ;88E2BF;
    CMP.B #$40                                                           ;88E2C2;
    BMI .green                                                           ;88E2C4;
    LDA.B #$3F                                                           ;88E2C6;
    STA.W $0DF0                                                          ;88E2C8;

.green:
    LDA.W $0DF1                                                          ;88E2CB;
    CMP.B #$5F                                                           ;88E2CE;
    BEQ .blue                                                            ;88E2D0;
    INC A                                                                ;88E2D2;
    INC A                                                                ;88E2D3;
    STA.W $0DF1                                                          ;88E2D4;
    CMP.B #$60                                                           ;88E2D7;
    BMI .blue                                                            ;88E2D9;
    LDA.B #$5F                                                           ;88E2DB;
    STA.W $0DF1                                                          ;88E2DD;

.blue:
    LDA.W $0DF2                                                          ;88E2E0;
    CMP.B #$9F                                                           ;88E2E3;
    BEQ .return                                                          ;88E2E5;
    INC A                                                                ;88E2E7;
    INC A                                                                ;88E2E8;
    STA.W $0DF2                                                          ;88E2E9;
    CMP.B #$A0                                                           ;88E2EC;
    BMI .return                                                          ;88E2EE;
    LDA.B #$9F                                                           ;88E2F0;
    STA.W $0DF2                                                          ;88E2F2;

.return:
    REP #$20                                                             ;88E2F5;
    SEC                                                                  ;88E2F7;
    RTS                                                                  ;88E2F8;


AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToOrange:
    SEP #$20                                                             ;88E2F9;
    LDA.W $0DF0                                                          ;88E2FB;
    CMP.B #$3F                                                           ;88E2FE;
    BEQ .green                                                           ;88E300;
    DEC A                                                                ;88E302;
    STA.W $0DF0                                                          ;88E303;

.green:
    LDA.W $0DF1                                                          ;88E306;
    CMP.B #$4D                                                           ;88E309;
    BEQ .blue                                                            ;88E30B;
    DEC A                                                                ;88E30D;
    STA.W $0DF1                                                          ;88E30E;

.blue:
    LDA.W $0DF2                                                          ;88E311;
    CMP.B #$83                                                           ;88E314;
    BEQ .return                                                          ;88E316;
    DEC A                                                                ;88E318;
    STA.W $0DF2                                                          ;88E319;

.return:
    REP #$20                                                             ;88E31C;
    SEC                                                                  ;88E31E;
    RTS                                                                  ;88E31F;


VariaSuitPickup_Stage3_GiveSamusVariaSuit:
    LDA.W $09A2                                                          ;88E320;
    ORA.W #$0001                                                         ;88E323;
    STA.W $09A2                                                          ;88E326;
    LDA.W $09A4                                                          ;88E329;
    ORA.W #$0001                                                         ;88E32C;
    STA.W $09A4                                                          ;88E32F;
    LDA.W #$009B                                                         ;88E332;
    STA.W $0A1C                                                          ;88E335;
    JSL.L InitializeSamusPose_1                                          ;88E338;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;88E33C;
    LDA.W $0A20                                                          ;88E340;
    STA.W $0A24                                                          ;88E343;
    LDA.W $0A22                                                          ;88E346;
    STA.W $0A26                                                          ;88E349;
    LDA.W $0A1C                                                          ;88E34C;
    STA.W $0A20                                                          ;88E34F;
    LDA.W $0A1E                                                          ;88E352;
    STA.W $0A22                                                          ;88E355;
    JSL.L LoadSamusSuitPalette                                           ;88E358;
    INC.W $0DEC                                                          ;88E35C;
    SEC                                                                  ;88E35F;
    RTS                                                                  ;88E360;


GravitySuitPickup_Stage3_GiveSamusGravitySuit:
    LDA.W $09A2                                                          ;88E361;
    ORA.W #$0020                                                         ;88E364;
    STA.W $09A2                                                          ;88E367;
    LDA.W $09A4                                                          ;88E36A;
    ORA.W #$0020                                                         ;88E36D;
    STA.W $09A4                                                          ;88E370;
    LDA.W #$009B                                                         ;88E373;
    STA.W $0A1C                                                          ;88E376;
    JSL.L InitializeSamusPose_1                                          ;88E379;
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged                        ;88E37D;
    LDA.W $0A20                                                          ;88E381;
    STA.W $0A24                                                          ;88E384;
    LDA.W $0A22                                                          ;88E387;
    STA.W $0A26                                                          ;88E38A;
    LDA.W $0A1C                                                          ;88E38D;
    STA.W $0A20                                                          ;88E390;
    LDA.W $0A1E                                                          ;88E393;
    STA.W $0A22                                                          ;88E396;
    JSL.L LoadSamusSuitPalette                                           ;88E399;
    INC.W $0DEC                                                          ;88E39D;
    SEC                                                                  ;88E3A0;
    RTS                                                                  ;88E3A1;


AdvanceSuitPickup_ColorMathSubScnBackdrop_TransitionToBlue:
    SEP #$20                                                             ;88E3A2;
    LDA.W $0DF0                                                          ;88E3A4;
    CMP.B #$30                                                           ;88E3A7;
    BEQ .green                                                           ;88E3A9;
    DEC A                                                                ;88E3AB;
    STA.W $0DF0                                                          ;88E3AC;

.green:
    LDA.W $0DF1                                                          ;88E3AF;
    CMP.B #$49                                                           ;88E3B2;
    BEQ .blue                                                            ;88E3B4;
    DEC A                                                                ;88E3B6;
    STA.W $0DF1                                                          ;88E3B7;

.blue:
    LDA.W $0DF2                                                          ;88E3BA;
    CMP.B #$90                                                           ;88E3BD;
    BEQ .return                                                          ;88E3BF;
    DEC A                                                                ;88E3C1;
    STA.W $0DF2                                                          ;88E3C2;

.return:
    REP #$20                                                             ;88E3C5;
    SEC                                                                  ;88E3C7;
    RTS                                                                  ;88E3C8;


SuitPickup_LightBeam_CurveWidths:
; Indexed by scanline for upper half (`FFh - scanline` for lower half)
    db $01,$02,$03,$04,$05,$06,$07,$07,$08,$08,$09,$09,$0A,$0A,$0B,$0B   ;88E3C9;
    db $0B,$0C,$0C,$0C,$0D,$0D,$0D,$0E,$0E,$0E,$0E,$0F,$0F,$0F,$0F,$10   ;88E3D9;
    db $10,$10,$10,$10,$11,$11,$11,$11,$11,$11,$12,$12,$12,$12,$12,$12   ;88E3E9;
    db $13,$13,$13,$13,$13,$13,$14,$14,$14,$14,$14,$14,$14,$14,$15,$15   ;88E3F9;
    db $15,$15,$15,$15,$15,$15,$15,$15,$16,$16,$16,$16,$16,$16,$16,$16   ;88E409;
    db $16,$16,$16,$16,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17,$17   ;88E419;
    db $17,$17,$17,$17,$17,$17,$17,$18,$18,$18,$18,$18,$18,$18,$18,$18   ;88E429;
    db $18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18,$18   ;88E439;

PreInstruction_PhantoonSemiTransparency:
    PHP                                                                  ;88E449;
    SEP #$10                                                             ;88E44A;
    REP #$20                                                             ;88E44C;
    BIT.W $1988                                                          ;88E44E;
    BVS .semiTransparent                                                 ;88E451;
    LDX.W $1074                                                          ;88E453;
    BEQ .BG2Disabled                                                     ;88E456;
    CPX.B #$FF                                                           ;88E458;
    BEQ .delete                                                          ;88E45A;
    BRA .return                                                          ;88E45C;


.BG2Disabled:
    LDA.W #$0004                                                         ;88E45E;
    STA.W $1986                                                          ;88E461;
    BRA .return                                                          ;88E464;


.semiTransparent:
    LDA.W #$001A                                                         ;88E466;
    STA.W $1986                                                          ;88E469;

.return:
    PLP                                                                  ;88E46C;
    RTL                                                                  ;88E46D;


.delete:
    LDA.W #$0004                                                         ;88E46E;
    STA.W $1986                                                          ;88E471;
    LDX.W $18B2                                                          ;88E474;
    LDA.W $18CC,X                                                        ;88E477;
    INC A                                                                ;88E47A;
    INC A                                                                ;88E47B;
    STA.W $18CC,X                                                        ;88E47C;
    LDA.W #$0001                                                         ;88E47F;
    STA.W $18E4,X                                                        ;88E482;
    PLP                                                                  ;88E485;
    RTL                                                                  ;88E486;


Spawn_WavyPhantoon_HDMAObject:
    PHP                                                                  ;88E487;
    PHB                                                                  ;88E488;
    PHK                                                                  ;88E489;
    PLB                                                                  ;88E48A;
    REP #$30                                                             ;88E48B;
    PHX                                                                  ;88E48D;
    STA.W $1034                                                          ;88E48E;
    STZ.W $106E                                                          ;88E491;
    STZ.W $1070                                                          ;88E494;
    LDA.B $16                                                            ;88E497;
    STA.W $1072                                                          ;88E499;
    JSL.L Spawn_HDMAObject                                               ;88E49C;
    db $42,$0F                                                           ;88E4A0;
    dw InstList_WavyPhantoon_BG2_Xscroll                                 ;88E4A2;
    PLX                                                                  ;88E4A4;
    PLB                                                                  ;88E4A5;
    PLP                                                                  ;88E4A6;
    RTL                                                                  ;88E4A7;


InstList_WavyPhantoon_BG2_Xscroll:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88E4A8;
                                                                   ;88E4AA;
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88E4AB;
                                                                   ;88E4AD;
    dw Instruction_Setup_WavyPhantoon                                    ;88E4AE;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E4B0;
    dl PreInstruction_WavyPhantoon                                       ;88E4B2;
    dw $0001,$9000                                                       ;88E4B5;
    dw Instruction_HDMAObject_Sleep                                      ;88E4B9;
    dw Instruction_HDMAObject_Delete                                     ;88E4BB;

Instruction_Setup_WavyPhantoon:
    PHP                                                                  ;88E4BD;
    REP #$30                                                             ;88E4BE;
    LDA.W $1034                                                          ;88E4C0;
    STA.W $0FF4                                                          ;88E4C3;
    BIT.W #$0001                                                         ;88E4C6;
    BNE .wavelengthDoubled                                               ;88E4C9;
    LDA.W #$00A0                                                         ;88E4CB;
    STA.L $7E9000                                                        ;88E4CE;
    STA.L $7E9003                                                        ;88E4D2;
    STA.L $7E9006                                                        ;88E4D6;
    STA.L $7E9009                                                        ;88E4DA;
    STA.L $7E900C                                                        ;88E4DE;
    STA.L $7E900F                                                        ;88E4E2;
    STA.L $7E9012                                                        ;88E4E6;
    STA.L $7E9015                                                        ;88E4EA;
    LDA.W #$9100                                                         ;88E4EE; $7E
    STA.L $7E9001                                                        ;88E4F1;
    STA.L $7E9007                                                        ;88E4F5;
    STA.L $7E900D                                                        ;88E4F9;
    STA.L $7E9013                                                        ;88E4FD;
    LDA.W #$9140                                                         ;88E501; $7E
    STA.L $7E9004                                                        ;88E504;
    STA.L $7E900A                                                        ;88E508;
    STA.L $7E9010                                                        ;88E50C;
    STA.L $7E9016                                                        ;88E510;
    LDA.W #$0000                                                         ;88E514;
    STA.L $7E9018                                                        ;88E517;
    BRA .merge                                                           ;88E51B;


.wavelengthDoubled:
    LDA.W #$00C0                                                         ;88E51D;
    STA.L $7E9000                                                        ;88E520;
    STA.L $7E9003                                                        ;88E524;
    STA.L $7E9006                                                        ;88E528;
    STA.L $7E9009                                                        ;88E52C;
    LDA.W #$9100                                                         ;88E530; $7E
    STA.L $7E9001                                                        ;88E533;
    LDA.W #$9180                                                         ;88E537; $7E
    STA.L $7E9004                                                        ;88E53A;
    LDA.W #$9100                                                         ;88E53E; $7E
    STA.L $7E9007                                                        ;88E541;
    LDA.W #$9180                                                         ;88E545; $7E
    STA.L $7E900A                                                        ;88E548;
    LDA.W #$0000                                                         ;88E54C;
    STA.L $7E900C                                                        ;88E54F;

.merge:
    LDA.W #$FFFE                                                         ;88E553;
    STA.W $1914,X                                                        ;88E556;
    LDA.W #$0001                                                         ;88E559;
    STA.W $1920,X                                                        ;88E55C;
    STZ.W $192C,X                                                        ;88E55F;
    STZ.W $1938,X                                                        ;88E562;
    PLP                                                                  ;88E565;
    RTS                                                                  ;88E566;


PreInstruction_WavyPhantoon:
    PHP                                                                  ;88E567;
    REP #$30                                                             ;88E568;
    LDA.W $0FF4                                                          ;88E56A;
    BNE .phantoonEnabled                                                 ;88E56D;
    LDX.W $18B2                                                          ;88E56F;
    LDA.W $18CC,X                                                        ;88E572;
    INC A                                                                ;88E575;
    INC A                                                                ;88E576;
    STA.W $18CC,X                                                        ;88E577;
    LDA.W #$0001                                                         ;88E57A;
    STA.W $18E4,X                                                        ;88E57D;
    PLP                                                                  ;88E580;
    RTL                                                                  ;88E581;


.phantoonEnabled:
    BIT.W #$0001                                                         ;88E582;
    BNE .doubledE593                                                     ;88E585;
    LDA.W #$0008                                                         ;88E587;
    STA.B $1C                                                            ;88E58A;
    LDA.W #$0040                                                         ;88E58C;
    STA.B $1E                                                            ;88E58F;
    BRA +                                                                ;88E591;


.doubledE593:
    LDA.W #$0004                                                         ;88E593;
    STA.B $1C                                                            ;88E596;
    LDA.W #$0080                                                         ;88E598;
    STA.B $1E                                                            ;88E59B;

  + PHX                                                                  ;88E59D;
    DEC.W $1920,X                                                        ;88E59E;
    BNE .nonZeroTimer                                                    ;88E5A1;
    LDA.W #$0001                                                         ;88E5A3;
    STA.W $1920,X                                                        ;88E5A6;
    LDA.W $1072                                                          ;88E5A9;
    ASL A                                                                ;88E5AC;
    STA.B $12                                                            ;88E5AD;
    LDA.W $1914,X                                                        ;88E5AF;
    CLC                                                                  ;88E5B2;
    ADC.B $12                                                            ;88E5B3;
    AND.W #$01FF                                                         ;88E5B5;
    STA.W $1914,X                                                        ;88E5B8;

.nonZeroTimer:
    LDA.W $1914,X                                                        ;88E5BB;
    STA.B $14                                                            ;88E5BE;
    LDX.W #$0000                                                         ;88E5C0;

.loop:
    PHX                                                                  ;88E5C3;
    LDX.B $14                                                            ;88E5C4;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;88E5C6;
    BPL .positive                                                        ;88E5CA;
    JMP.W .negative                                                      ;88E5CC;


.positive:
    STA.B $12                                                            ;88E5CF;
    SEP #$20                                                             ;88E5D1;
    STA.W $4202                                                          ;88E5D3;
    LDA.W $106E                                                          ;88E5D6;
    STA.W $4203                                                          ;88E5D9;
    NOP                                                                  ;88E5DC;
    NOP                                                                  ;88E5DD;
    NOP                                                                  ;88E5DE;
    REP #$20                                                             ;88E5DF;
    LDA.W $4216                                                          ;88E5E1;
    XBA                                                                  ;88E5E4;
    AND.W #$00FF                                                         ;88E5E5;
    STA.B $16                                                            ;88E5E8;
    SEP #$20                                                             ;88E5EA;
    LDA.B $13                                                            ;88E5EC;
    STA.W $4202                                                          ;88E5EE;
    LDA.W $106E                                                          ;88E5F1;
    STA.W $4203                                                          ;88E5F4;
    NOP                                                                  ;88E5F7;
    NOP                                                                  ;88E5F8;
    NOP                                                                  ;88E5F9;
    REP #$20                                                             ;88E5FA;
    LDA.W $4216                                                          ;88E5FC;
    CLC                                                                  ;88E5FF;
    ADC.B $16                                                            ;88E600;
    STA.B $16                                                            ;88E602;
    SEP #$20                                                             ;88E604;
    LDA.B $12                                                            ;88E606;
    STA.W $4202                                                          ;88E608;
    LDA.W $106F                                                          ;88E60B;
    STA.W $4203                                                          ;88E60E;
    NOP                                                                  ;88E611;
    NOP                                                                  ;88E612;
    NOP                                                                  ;88E613;
    REP #$20                                                             ;88E614;
    LDA.W $4216                                                          ;88E616;
    STA.B $18                                                            ;88E619;
    SEP #$20                                                             ;88E61B;
    LDA.B $13                                                            ;88E61D;
    STA.W $4202                                                          ;88E61F;
    LDA.W $106F                                                          ;88E622;
    STA.W $4203                                                          ;88E625;
    REP #$20                                                             ;88E628;
    LDA.B $16                                                            ;88E62A;
    CLC                                                                  ;88E62C;
    ADC.B $18                                                            ;88E62D;
    STA.B $16                                                            ;88E62F;
    LDA.W $4215                                                          ;88E631;
    AND.W #$FF00                                                         ;88E634;
    CLC                                                                  ;88E637;
    ADC.B $16                                                            ;88E638;
    AND.W #$FF00                                                         ;88E63A;
    XBA                                                                  ;88E63D;
    STA.B $12                                                            ;88E63E;
    TXA                                                                  ;88E640;
    CLC                                                                  ;88E641;
    ADC.B $1C                                                            ;88E642;
    AND.W #$01FF                                                         ;88E644;
    STA.B $14                                                            ;88E647;
    PLX                                                                  ;88E649;
    LDA.B $B5                                                            ;88E64A;
    CLC                                                                  ;88E64C;
    ADC.B $12                                                            ;88E64D;
    STA.L $7E9100,X                                                      ;88E64F;
    JMP.W .next                                                          ;88E653;


.negative:
    EOR.W #$FFFF                                                         ;88E656;
    INC A                                                                ;88E659;
    STA.B $12                                                            ;88E65A;
    SEP #$20                                                             ;88E65C;
    STA.W $4202                                                          ;88E65E;
    LDA.W $106E                                                          ;88E661;
    STA.W $4203                                                          ;88E664;
    NOP                                                                  ;88E667;
    NOP                                                                  ;88E668;
    NOP                                                                  ;88E669;
    REP #$20                                                             ;88E66A;
    LDA.W $4216                                                          ;88E66C;
    XBA                                                                  ;88E66F;
    AND.W #$00FF                                                         ;88E670;
    STA.B $16                                                            ;88E673;
    SEP #$20                                                             ;88E675;
    LDA.B $13                                                            ;88E677;
    STA.W $4202                                                          ;88E679;
    LDA.W $106E                                                          ;88E67C;
    STA.W $4203                                                          ;88E67F;
    NOP                                                                  ;88E682;
    NOP                                                                  ;88E683;
    NOP                                                                  ;88E684;
    REP #$20                                                             ;88E685;
    LDA.W $4216                                                          ;88E687;
    CLC                                                                  ;88E68A;
    ADC.B $16                                                            ;88E68B;
    STA.B $16                                                            ;88E68D;
    SEP #$20                                                             ;88E68F;
    LDA.B $12                                                            ;88E691;
    STA.W $4202                                                          ;88E693;
    LDA.W $106F                                                          ;88E696;
    STA.W $4203                                                          ;88E699;
    NOP                                                                  ;88E69C;
    NOP                                                                  ;88E69D;
    NOP                                                                  ;88E69E;
    REP #$20                                                             ;88E69F;
    LDA.W $4216                                                          ;88E6A1;
    STA.B $18                                                            ;88E6A4;
    SEP #$20                                                             ;88E6A6;
    LDA.B $13                                                            ;88E6A8;
    STA.W $4202                                                          ;88E6AA;
    LDA.W $106F                                                          ;88E6AD;
    STA.W $4203                                                          ;88E6B0;
    REP #$20                                                             ;88E6B3;
    LDA.B $16                                                            ;88E6B5;
    CLC                                                                  ;88E6B7;
    ADC.B $18                                                            ;88E6B8;
    STA.B $16                                                            ;88E6BA;
    LDA.W $4215                                                          ;88E6BC;
    AND.W #$FF00                                                         ;88E6BF;
    CLC                                                                  ;88E6C2;
    ADC.B $16                                                            ;88E6C3;
    AND.W #$FF00                                                         ;88E6C5;
    XBA                                                                  ;88E6C8;
    STA.B $12                                                            ;88E6C9;
    TXA                                                                  ;88E6CB;
    CLC                                                                  ;88E6CC;
    ADC.B $1C                                                            ;88E6CD;
    AND.W #$01FF                                                         ;88E6CF;
    STA.B $14                                                            ;88E6D2;
    PLX                                                                  ;88E6D4;
    LDA.B $B5                                                            ;88E6D5;
    SEC                                                                  ;88E6D7;
    SBC.B $12                                                            ;88E6D8;
    STA.L $7E9100,X                                                      ;88E6DA;

.next:
    INX                                                                  ;88E6DE;
    INX                                                                  ;88E6DF;
    CPX.B $1E                                                            ;88E6E0;
    BPL +                                                                ;88E6E2;
    JMP.W .loop                                                          ;88E6E4;


  + LDA.W $0FF4                                                          ;88E6E7;
    BIT.W #$0001                                                         ;88E6EA;
    BNE .doubledE706                                                     ;88E6ED;
    LDX.W #$003E                                                         ;88E6EF;

.loopNotDoubled:
    LDA.B $B5                                                            ;88E6F2;
    SEC                                                                  ;88E6F4;
    SBC.L $7E9100,X                                                      ;88E6F5;
    CLC                                                                  ;88E6F9;
    ADC.B $B5                                                            ;88E6FA;
    STA.L $7E9140,X                                                      ;88E6FC;
    DEX                                                                  ;88E700;
    DEX                                                                  ;88E701;
    BPL .loopNotDoubled                                                  ;88E702;
    BRA .return                                                          ;88E704;


.doubledE706:
    LDX.W #$007E                                                         ;88E706;

.loopDoubled:
    LDA.B $B5                                                            ;88E709;
    SEC                                                                  ;88E70B;
    SBC.L $7E9100,X                                                      ;88E70C;
    CLC                                                                  ;88E710;
    ADC.B $B5                                                            ;88E711;
    STA.L $7E9180,X                                                      ;88E713;
    DEX                                                                  ;88E717;
    DEX                                                                  ;88E718;
    BPL .loopDoubled                                                     ;88E719;

.return:
    PLX                                                                  ;88E71B;
    PLP                                                                  ;88E71C;
    RTL                                                                  ;88E71D;


Spawn_MotherBrainRising_HDMAObject:
    JSL.L Spawn_HDMAObject                                               ;88E71E;
    db $00,$2C                                                           ;88E722;
    dw InstList_MotherBrainRising_MainScreenLayers                       ;88E724;

RTL_88E726:
    RTL                                                                  ;88E726;


InstList_MotherBrainRising_MainScreenLayers:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88E727;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $88             ;88E72A;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88E72D;
    dl RTL_88E726                                                        ;88E72F;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E732;
    dl RTL_88E726                                                        ;88E734;
    dw $0001,HDMATable_MotherBrainRising_MainScreenLayers                ;88E737;
    dw Instruction_HDMAObject_Sleep                                      ;88E73B;

HDMATable_MotherBrainRising_MainScreenLayers:                            ;88E73D;
    db $20,$04 ;         BG3
    db $18,$15 ; BG1/    BG3/sprites
    db $60,$13 ; BG1/BG2/    sprites
    db $40,$13 ; BG1/BG2/    sprites
    db $08,$05 ; BG1/    BG3
    db $00

Spawn_MotherBrainRainbowBeam_HDMAObject:
    JSL.L Spawn_HDMAObject                                               ;88E748;
    db $41,$26                                                           ;88E74C;
    dw InstList_MotherBrainRainbowBeam_Window1Position                   ;88E74E;
    RTL                                                                  ;88E750;


InstList_MotherBrainRainbowBeam_Window1Position:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88E751;
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88E754;
    dw Instruction_HDMAObject_CallExternalFunctionInY                    ;88E757;
    dl Initialise_Rainbow_Beam                                           ;88E759;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E75C;
    dl PreInstruction_MotherBrainRainbowBeam                             ;88E75E;
    dw $0001,$9C00                                                       ;88E761;
    dw Instruction_HDMAObject_Sleep                                      ;88E765;

Initialise_Rainbow_Beam:
    PHP                                                                  ;88E767;
    SEP #$20                                                             ;88E768;
    REP #$10                                                             ;88E76A;
    LDA.B #$20                                                           ;88E76C;
    STA.B $74                                                            ;88E76E;
    LDA.B #$47                                                           ;88E770;
    STA.B $75                                                            ;88E772;
    LDA.B #$8F                                                           ;88E774;
    STA.B $76                                                            ;88E776;
    REP #$30                                                             ;88E778;
    LDA.W #$0024                                                         ;88E77A;
    STA.W $1986                                                          ;88E77D;
    SEP #$20                                                             ;88E780;
    LDA.B #$E4                                                           ;88E782;
    LDA.B #$64                                                           ;88E784;
    STA.L $7E9C00                                                        ;88E786;
    REP #$20                                                             ;88E78A;
    LDA.W #$9D00                                                         ;88E78C; $7E
    STA.L $7E9C01                                                        ;88E78F;
    LDA.W #$0000                                                         ;88E793;
    STA.L $7E9C03                                                        ;88E796;
    LDA.W #$0000                                                         ;88E79A;
    STA.L $7E9D00                                                        ;88E79D;
    LDA.W #$8020                                                         ;88E7A1; $7E:9D02 = 20h,80h
    STA.L $7E9D02                                                        ;88E7A4;
    LDA.W #$0000                                                         ;88E7A8;
    STA.L $7E9D04                                                        ;88E7AB;
    PHB                                                                  ;88E7AF;
    PEA.W $A900                                                          ;88E7B0;
    PLB                                                                  ;88E7B3;
    PLB                                                                  ;88E7B4;
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables                   ;88E7B5;
    PLB                                                                  ;88E7B9;
    PLP                                                                  ;88E7BA;
    RTL                                                                  ;88E7BB;


PreInstruction_MotherBrainRainbowBeam:
    PHP                                                                  ;88E7BC;
    REP #$30                                                             ;88E7BD;
    LDA.W $0998                                                          ;88E7BF;
    CMP.W #$0013                                                         ;88E7C2;
    BEQ .delete                                                          ;88E7C5;
    LDA.W #$0024                                                         ;88E7C7;
    STA.W $1986                                                          ;88E7CA;
    LDA.W $0998                                                          ;88E7CD;
    CMP.W #$001B                                                         ;88E7D0;
    BEQ .return                                                          ;88E7D3;
    PHB                                                                  ;88E7D5;
    PEA.W $A900                                                          ;88E7D6;
    PLB                                                                  ;88E7D9;
    PLB                                                                  ;88E7DA;
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables                   ;88E7DB;
    PLB                                                                  ;88E7DF;
    JSR.W Set_RainbowBeam_ColorMathSubscreenBackdropColor                ;88E7E0;

.return:
    PLP                                                                  ;88E7E3;
    RTL                                                                  ;88E7E4;


.delete:
    LDX.W $18B2                                                          ;88E7E5;
    STZ.W $18B4,X                                                        ;88E7E8;
    PLP                                                                  ;88E7EB;
    RTL                                                                  ;88E7EC;


Set_RainbowBeam_ColorMathSubscreenBackdropColor:
    LDX.W $1914                                                          ;88E7ED;
    LDA.W .table,X                                                       ;88E7F0;
    BPL .notSet                                                          ;88E7F3;
    STZ.W $1914                                                          ;88E7F5;
    LDA.W .table                                                         ;88E7F8;
    BRA .setColor                                                        ;88E7FB;


.notSet:
    INC.W $1914                                                          ;88E7FD;
    INC.W $1914                                                          ;88E800;
    INC.W $1914                                                          ;88E803;
    INC.W $1914                                                          ;88E806;

.setColor:
    PHA                                                                  ;88E809;
    SEP #$20                                                             ;88E80A;
    AND.B #$1F                                                           ;88E80C;
    ORA.B #$20                                                           ;88E80E;
    STA.B $74                                                            ;88E810;
    REP #$20                                                             ;88E812;
    LDA.B $01,S                                                          ;88E814;
    ASL A                                                                ;88E816;
    ASL A                                                                ;88E817;
    ASL A                                                                ;88E818;
    XBA                                                                  ;88E819;
    SEP #$20                                                             ;88E81A;
    AND.B #$1F                                                           ;88E81C;
    ORA.B #$40                                                           ;88E81E;
    STA.B $75                                                            ;88E820;
    REP #$20                                                             ;88E822;
    PLA                                                                  ;88E824;
    LSR A                                                                ;88E825;
    LSR A                                                                ;88E826;
    XBA                                                                  ;88E827;
    SEP #$20                                                             ;88E828;
    AND.B #$1F                                                           ;88E82A;
    ORA.B #$80                                                           ;88E82C;
    STA.B $76                                                            ;88E82E;
    REP #$20                                                             ;88E830;
    RTS                                                                  ;88E832;

  .table
; Rainbow beam colour table
; The table index is incremented by 4 per frame instead of 2, so only entries 2k for some k are used
    dw $001F,$005F, $009F,$00DF, $011F,$015F, $019F,$01DF                 ;88E833;
    dw $023F,$027F, $02BF,$02FF, $033F,$037F, $03BF,$03FF                 ;88E843;
    dw $03FD,$03FB, $03F9,$03F7, $03F5,$03F3, $03F1,$03EF                 ;88E853;
    dw $03EC,$03EA, $03E8,$03E6, $03E4,$03E2, $03E0,$0BA0                 ;88E863;
    dw $1360,$1B20, $22E0,$2AA0, $3260,$3A20, $45E0,$4D80                 ;88E873;
    dw $5540,$5D00, $64C0,$6C80, $7440,$7C00, $7C02,$7C04                 ;88E883;
    dw $7C06,$7C08, $7C0A,$7C0C, $7C0D,$7C2F, $7C31,$7C33                 ;88E893;
    dw $7C35,$7C37, $7C39,$7C3B, $7C1F,$741F, $6C1F,$641F                 ;88E8A3;
    dw $5C1F,$541F, $4C1F,$441F, $3C1F,$301F, $281F,$201F                 ;88E8B3;
    dw $181F,$101F, $081F,$FFFF, $FFFF                                    ;88E8C3;
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF ; Excess terminators


Spawn_MorphBallEyeBeam_HDMAObject:
    PHP                                                                  ;88E8D9;
    PHB                                                                  ;88E8DA;
    PHK                                                                  ;88E8DB;
    PLB                                                                  ;88E8DC;
    REP #$30                                                             ;88E8DD;
    PHX                                                                  ;88E8DF;
    JSL.L Spawn_HDMAObject                                               ;88E8E0;
    db $41,$26                                                           ;88E8E4;
    dw InstList_MorphBallEyeBeam_Window1Position                         ;88E8E6;
    PLX                                                                  ;88E8E8;
    PLB                                                                  ;88E8E9;
    PLP                                                                  ;88E8EA;
    RTL                                                                  ;88E8EB;


InstList_MorphBallEyeBeam_Window1Position:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88E8EC;
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88E8EF;
    dw Instruction_Initialise_MorphBallEyeBeam_HDMA                      ;88E8F2;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E8F4;
    dl PreInstruction_MorphBallEyeBeam_BeamIsWidening                    ;88E8F6;
    dw $0001,$9000                                                       ;88E8F9;
    dw Instruction_HDMAObject_Sleep                                      ;88E8FD;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E8FF;
    dl PreInstruction_MorphBallEyeBeamHDMA_FullBeam                      ;88E901;
    dw $0001,$9000                                                       ;88E904;
    dw Instruction_HDMAObject_Sleep                                      ;88E908;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88E90A;
    dl PreInstruction_MorphBallEyeBeamHDMA_DeactivateBeam                ;88E90C;
    dw $0001,$9000                                                       ;88E90F;
    dw Instruction_HDMAObject_Sleep                                      ;88E913;
    dw Instruction_HDMAObject_Delete                                     ;88E915;

Instruction_Initialise_MorphBallEyeBeam_HDMA:
    PHP                                                                  ;88E917;
    SEP #$20                                                             ;88E918;
    REP #$10                                                             ;88E91A;
    LDA.B #$30                                                           ;88E91C;
    STA.W $1914,X                                                        ;88E91E;
    STA.B $74                                                            ;88E921;
    LDA.B #$50                                                           ;88E923;
    STA.W $1915,X                                                        ;88E925;
    STA.B $75                                                            ;88E928;
    LDA.B #$80                                                           ;88E92A;
    STA.W $1920,X                                                        ;88E92C;
    STA.B $76                                                            ;88E92F;
    REP #$30                                                             ;88E931;
    LDA.W #$0010                                                         ;88E933;
    STA.W $1986                                                          ;88E936;
    LDA.W #$00E4                                                         ;88E939;
    STA.L $7E9000                                                        ;88E93C;
    LDA.W #$9100                                                         ;88E940; $7E
    STA.L $7E9001                                                        ;88E943;
    LDA.W #$00E4                                                         ;88E947;
    STA.L $7E9003                                                        ;88E94A;
    LDA.W #$91C8                                                         ;88E94E; $7E
    STA.L $7E9004                                                        ;88E951;
    LDA.W #$0098                                                         ;88E955;
    STA.L $7E9006                                                        ;88E958;
    LDA.W #$9290                                                         ;88E95C; $7E
    STA.L $7E9007                                                        ;88E95F;
    LDA.W #$0000                                                         ;88E963;
    STA.L $7E9009                                                        ;88E966;
    LDA.W #$0001                                                         ;88E96A;
    STA.W $0FEC                                                          ;88E96D;
    STZ.W $192C,X                                                        ;88E970;
    STZ.W $1938,X                                                        ;88E973;
    LDA.W #$0000                                                         ;88E976;
    STA.L $7E9080                                                        ;88E979;
    STA.L $7E9082                                                        ;88E97D;
    STA.L $7E9090                                                        ;88E981;
    PLP                                                                  ;88E985;
    RTS                                                                  ;88E986;


Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor:
    PHP                                                                  ;88E987;
    REP #$30                                                             ;88E988;
    PHX                                                                  ;88E98A;
    LDA.W $0FEE                                                          ;88E98B;
    STA.B $12                                                            ;88E98E;
    LDA.W $192C,X                                                        ;88E990;
    STA.B $14                                                            ;88E993;
    LDA.W $0FBE                                                          ;88E995;
    SEC                                                                  ;88E998;
    SBC.W $0915                                                          ;88E999;
    TAY                                                                  ;88E99C;
    LDA.W $0FBA                                                          ;88E99D;
    SEC                                                                  ;88E9A0;
    SBC.W $0911                                                          ;88E9A1;
    TAX                                                                  ;88E9A4;
    BMI .offScreen                                                       ;88E9A5;
    CMP.W #$0100                                                         ;88E9A7;
    BPL .offScreen                                                       ;88E9AA;
    SEP #$20                                                             ;88E9AC;
    LDA.B #$7E                                                           ;88E9AE;
    STA.B $02                                                            ;88E9B0;
    REP #$20                                                             ;88E9B2;
    LDA.W #$9100                                                         ;88E9B4; $7E
    STA.B $00                                                            ;88E9B7;
    JSL.L Calc_Xray_HDMADataTable_OnScreen                               ;88E9B9;
    BRA .merge                                                           ;88E9BD;


.offScreen:
    SEP #$20                                                             ;88E9BF;
    LDA.B #$7E                                                           ;88E9C1;
    STA.B $02                                                            ;88E9C3;
    REP #$20                                                             ;88E9C5;
    LDA.W #$9100                                                         ;88E9C7; $7E
    STA.B $00                                                            ;88E9CA;
    JSL.L Calc_Xray_HDMADataTable_OffScreen                              ;88E9CC;

.merge:
    PLX                                                                  ;88E9D0;
    SEP #$20                                                             ;88E9D1;
    LDA.W $1914,X                                                        ;88E9D3;
    STA.B $74                                                            ;88E9D6;
    LDA.W $1915,X                                                        ;88E9D8;
    STA.B $75                                                            ;88E9DB;
    LDA.W $1920,X                                                        ;88E9DD;
    STA.B $76                                                            ;88E9E0;
    REP #$20                                                             ;88E9E2; >_<
    PLP                                                                  ;88E9E4;
    RTS                                                                  ;88E9E5;


PreInstruction_MorphBallEyeBeam_BeamIsWidening:
    PHP                                                                  ;88E9E6;
    REP #$30                                                             ;88E9E7;
    LDA.W #$0010                                                         ;88E9E9;
    STA.W $1986                                                          ;88E9EC;
    LDA.L $7E9082                                                        ;88E9EF;
    CLC                                                                  ;88E9F3;
    ADC.W #$4000                                                         ;88E9F4;
    STA.L $7E9082                                                        ;88E9F7;
    LDA.L $7E9080                                                        ;88E9FB;
    ADC.W #$0000                                                         ;88E9FF;
    STA.L $7E9080                                                        ;88EA02;
    LDA.W $1938,X                                                        ;88EA06;
    CLC                                                                  ;88EA09;
    ADC.L $7E9082                                                        ;88EA0A;
    STA.W $1938,X                                                        ;88EA0E;
    LDA.W $192C,X                                                        ;88EA11;
    ADC.L $7E9080                                                        ;88EA14;
    STA.W $192C,X                                                        ;88EA18;
    CMP.W #$0004                                                         ;88EA1B;
    BMI .update                                                          ;88EA1E;
    LDA.W #$0004                                                         ;88EA20;
    STA.W $192C,X                                                        ;88EA23;
    LDX.W $18B2                                                          ;88EA26;
    LDA.W $18CC,X                                                        ;88EA29;
    INC A                                                                ;88EA2C;
    INC A                                                                ;88EA2D;
    STA.W $18CC,X                                                        ;88EA2E;
    LDA.W #$0001                                                         ;88EA31;
    STA.W $18E4,X                                                        ;88EA34;

.update:
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor     ;88EA37;
    PLP                                                                  ;88EA3A;
    RTL                                                                  ;88EA3B;


PreInstruction_MorphBallEyeBeamHDMA_FullBeam:
    PHP                                                                  ;88EA3C;
    REP #$30                                                             ;88EA3D;
    LDA.W #$0010                                                         ;88EA3F;
    STA.W $1986                                                          ;88EA42;
    LDA.W $0FEC                                                          ;88EA45;
    BNE .update                                                          ;88EA48;
    LDX.W $18B2                                                          ;88EA4A;
    LDA.W $18CC,X                                                        ;88EA4D;
    INC A                                                                ;88EA50;
    INC A                                                                ;88EA51;
    STA.W $18CC,X                                                        ;88EA52;
    LDA.W #$0001                                                         ;88EA55;
    STA.W $18E4,X                                                        ;88EA58;
    PLP                                                                  ;88EA5B;
    RTL                                                                  ;88EA5C;


.update:
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor     ;88EA5D;
    LDA.L $7E9090                                                        ;88EA60;
    ASL A                                                                ;88EA64;
    ASL A                                                                ;88EA65;
    TAY                                                                  ;88EA66;
    SEP #$20                                                             ;88EA67;
    LDA.W .red,Y                                                         ;88EA69;
    STA.W $1914,X                                                        ;88EA6C;
    LDA.W .green,Y                                                       ;88EA6F;
    STA.W $1915,X                                                        ;88EA72;
    LDA.W .blue,Y                                                        ;88EA75;
    STA.W $1920,X                                                        ;88EA78;
    REP #$20                                                             ;88EA7B;
    LDA.L $7E9090                                                        ;88EA7D;
    INC A                                                                ;88EA81;
    AND.W #$000F                                                         ;88EA82;
    STA.L $7E9090                                                        ;88EA85;
    PLP                                                                  ;88EA89;
    RTL                                                                  ;88EA8A;

;        ____________ Red component
;       |    ________ Green component
;       |   |    ____ Blue component
;       |   |   |
  .red:
    db $30                                                               ;88EA8B;
  .green:
    db     $50                                                           ;88EA8C;
  .blue:
    db         $80, $00                                                  ;88EA8D;
    db $2F,$4F,$80, $00
    db $2E,$4E,$80, $00
    db $2D,$4D,$80, $00
    db $2C,$4C,$80, $00
    db $2B,$4B,$80, $00
    db $2A,$4A,$80, $00
    db $29,$49,$80, $00
    db $28,$48,$80, $00
    db $29,$49,$80, $00
    db $2A,$4A,$80, $00
    db $2B,$4B,$80, $00
    db $2C,$4C,$80, $00
    db $2D,$4D,$80, $00
    db $2E,$4E,$80, $00
    db $2F,$4F,$80, $00

PreInstruction_MorphBallEyeBeamHDMA_DeactivateBeam:
    PHP                                                                  ;88EACB;
    REP #$30                                                             ;88EACC;
    LDA.W #$0010                                                         ;88EACE;
    STA.W $1986                                                          ;88EAD1;
    SEP #$20                                                             ;88EAD4;
    LDA.W $1915,X                                                        ;88EAD6;
    CMP.B #$40                                                           ;88EAD9;
    BNE .notDone                                                         ;88EADB;
    LDA.B #$20                                                           ;88EADD;
    STA.B $74                                                            ;88EADF;
    LDA.B #$40                                                           ;88EAE1;
    STA.B $75                                                            ;88EAE3;
    LDA.B #$80                                                           ;88EAE5;
    STA.B $76                                                            ;88EAE7;
    REP #$20                                                             ;88EAE9;
    STZ.W $1938,X                                                        ;88EAEB;
    STZ.W $192C,X                                                        ;88EAEE;
    LDX.W #$01FE                                                         ;88EAF1;

.loop:
    LDA.W #$00FF                                                         ;88EAF4;
    STA.L $7E9100,X                                                      ;88EAF7;
    DEX                                                                  ;88EAFB;
    DEX                                                                  ;88EAFC;
    BPL .loop                                                            ;88EAFD;
    LDA.W #$0000                                                         ;88EAFF;
    STA.L $7E9000                                                        ;88EB02;
    STA.L $7E9002                                                        ;88EB06;
    STA.L $7E9004                                                        ;88EB0A;
    STA.L $7E9006                                                        ;88EB0E;
    STA.L $7E9008                                                        ;88EB12;
    LDX.W $18B2                                                          ;88EB16;
    LDA.W $18CC,X                                                        ;88EB19;
    INC A                                                                ;88EB1C;
    INC A                                                                ;88EB1D;
    STA.W $18CC,X                                                        ;88EB1E;
    LDA.W #$0001                                                         ;88EB21;
    STA.W $18E4,X                                                        ;88EB24;
    BRA .return                                                          ;88EB27;


.notDone:
    REP #$20                                                             ;88EB29;
    JSR.W Update_MorphBallEyeBeam_HDMATable_ColorMathSubScnBackColor     ;88EB2B;
    LDX.W $18B2                                                          ;88EB2E;
    SEP #$20                                                             ;88EB31;
    LDA.W $1914,X                                                        ;88EB33;
    CMP.B #$20                                                           ;88EB36;
    BEQ .green                                                           ;88EB38;
    DEC A                                                                ;88EB3A;
    STA.W $1914,X                                                        ;88EB3B;

.green:
    LDA.W $1915,X                                                        ;88EB3E;
    CMP.B #$40                                                           ;88EB41;
    BEQ .blue                                                            ;88EB43;
    DEC A                                                                ;88EB45;
    STA.W $1915,X                                                        ;88EB46;

.blue:
    LDA.W $1920,X                                                        ;88EB49;
    CMP.B #$80                                                           ;88EB4C;
    BEQ .returnREP20                                                     ;88EB4E;
    DEC A                                                                ;88EB50;
    STA.W $1920,X                                                        ;88EB51;

.returnREP20:
    REP #$20                                                             ;88EB54; >.<

.return:
    PLP                                                                  ;88EB56;
    RTL                                                                  ;88EB57;


Spawn_TitleSequenceGradient_HDMAObjects:
    PHP                                                                  ;88EB58;
    PHB                                                                  ;88EB59;
    PHK                                                                  ;88EB5A;
    PLB                                                                  ;88EB5B;
    REP #$30                                                             ;88EB5C;
    PHX                                                                  ;88EB5E;
    JSL.L Spawn_HDMAObject                                               ;88EB5F;
    db $00,$32                                                           ;88EB63;
    dw InstList_ColorMathSubScnBackdropColor_TitleSequenceGradient       ;88EB65;
    JSL.L Spawn_HDMAObject                                               ;88EB67;
    db $00,$31                                                           ;88EB6B;
    dw InstList_ColorMathControlRegB_TitleSequenceGradient               ;88EB6D;
    PLX                                                                  ;88EB6F;
    PLB                                                                  ;88EB70;
    PLP                                                                  ;88EB71;
    RTL                                                                  ;88EB72;


InstList_ColorMathSubScnBackdropColor_TitleSequenceGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $7E                     ;88EB73;
    dw Instruction_Setup_TitleSequenceGradient_HDMATable                 ;88EB76;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88EB78;
    dl PreInst_ColorMathSubScnBackdropColor_TitleSequenceGradient        ;88EB7A;
    dw $0001,$9800                                                       ;88EB7D;
    dw Instruction_HDMAObject_Sleep                                      ;88EB81;
    dw Instruction_HDMAObject_Delete                                     ;88EB83;

InstList_ColorMathControlRegB_TitleSequenceGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88EB85;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88EB88;
    dl PreInstruction_ColorMathControlRegB_TitleSequenceGradient         ;88EB8A;
    dw $0001,HDMATable_ColorMathControlRegB_TitleSequenceGradient        ;88EB8D;
    dw Instruction_HDMAObject_Sleep                                      ;88EB91;
    dw Instruction_HDMAObject_Delete                                     ;88EB93;

HDMATable_ColorMathControlRegB_TitleSequenceGradient:                    ;88EB95;
    db $40,$A1 ;\
    db $3A,$A1 ;} Enable subtractive colour math on BG1/backdrop
    db $40,$31 ;\
    db $40,$31 ;} Enable colour math on BG1/sprites/backdrop
    db $00,$00

Instruction_Setup_TitleSequenceGradient_HDMATable:
    PHP                                                                  ;88EB9F;
    SEP #$20                                                             ;88EBA0;
    REP #$10                                                             ;88EBA2;
    PHX                                                                  ;88EBA4;
    PHY                                                                  ;88EBA5;
    STZ.B $6F                                                            ;88EBA6;
    JSL.L Configure_TitleScreen_GradientHDMATable                        ;88EBA8;
    PLY                                                                  ;88EBAC;
    PLX                                                                  ;88EBAD;
    PLP                                                                  ;88EBAE;
    RTS                                                                  ;88EBAF;


PreInst_ColorMathSubScnBackdropColor_TitleSequenceGradient:
    PHP                                                                  ;88EBB0;
    REP #$30                                                             ;88EBB1;
    JSL.L Configure_TitleScreen_GradientHDMATable                        ;88EBB3;
    LDA.W $1F51                                                          ;88EBB7;
    CMP.W #CinematicFunction_LoadTitleSequence                           ;88EBBA;
    BNE .return                                                          ;88EBBD;
    LDX.W $18B2                                                          ;88EBBF;
    LDA.W $18CC,X                                                        ;88EBC2;
    INC A                                                                ;88EBC5;
    INC A                                                                ;88EBC6;
    STA.W $18CC,X                                                        ;88EBC7;
    LDA.W #$0001                                                         ;88EBCA;
    STA.W $18E4,X                                                        ;88EBCD;

.return:
    PLP                                                                  ;88EBD0;
    RTL                                                                  ;88EBD1;


PreInstruction_ColorMathControlRegB_TitleSequenceGradient:
    PHP                                                                  ;88EBD2;
    REP #$30                                                             ;88EBD3;
    LDA.W $1F51                                                          ;88EBD5;
    CMP.W #CinematicFunction_LoadTitleSequence                           ;88EBD8;
    BNE .return                                                          ;88EBDB;
    LDX.W $18B2                                                          ;88EBDD;
    LDA.W $18CC,X                                                        ;88EBE0;
    INC A                                                                ;88EBE3;
    INC A                                                                ;88EBE4;
    STA.W $18CC,X                                                        ;88EBE5;
    LDA.W #$0001                                                         ;88EBE8;
    STA.W $18E4,X                                                        ;88EBEB;

.return:
    PLP                                                                  ;88EBEE;
    RTL                                                                  ;88EBEF;


SpawnIntroCutsceneCrossFade_HDMAObject:
    PHP                                                                  ;88EBF0;
    PHB                                                                  ;88EBF1;
    PHK                                                                  ;88EBF2;
    PLB                                                                  ;88EBF3;
    REP #$30                                                             ;88EBF4;
    PHX                                                                  ;88EBF6;
    JSL.L Spawn_HDMAObject                                               ;88EBF7;
    db $00,$31                                                           ;88EBFB;
    dw InstList_IntroCutsceneCrossFade                                   ;88EBFD;
    PLX                                                                  ;88EBFF;
    PLB                                                                  ;88EC00;
    PLP                                                                  ;88EC01;
    RTL                                                                  ;88EC02;


InstList_IntroCutsceneCrossFade:
    dw Instruction_HDMAObject_HDMATableBank : db $88                     ;88EC03;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88EC06;
    dl PreInstruction_IntroCutsceneCrossFade                             ;88EC08;
    dw $0001,HDMATable_IntroCutsceneCrossFade_ColorMathControlRegB       ;88EC0B;
    dw Instruction_HDMAObject_Sleep                                      ;88EC0F;
    dw Instruction_HDMAObject_Delete                                     ;88EC11;

HDMATable_IntroCutsceneCrossFade_ColorMathControlRegB:                   ;88EC13;
    db $17,$02 ; Enable colour math on BG2
    db $60,$06 ; Enable colour math on BG2/BG3
    db $40,$06 ; Enable colour math on BG2/BG3
    db $48,$02 ; Enable colour math on BG2
    db $00,$00

PreInstruction_IntroCutsceneCrossFade:
    PHP                                                                  ;88EC1D;
    REP #$30                                                             ;88EC1E;
    LDA.W $1A4B                                                          ;88EC20;
    CMP.W #$0001                                                         ;88EC23;
    BNE .return                                                          ;88EC26;
    LDX.W $18B2                                                          ;88EC28;
    LDA.W $18CC,X                                                        ;88EC2B;
    INC A                                                                ;88EC2E;
    INC A                                                                ;88EC2F;
    STA.W $18CC,X                                                        ;88EC30;
    LDA.W #$0001                                                         ;88EC33;
    STA.W $18E4,X                                                        ;88EC36;

.return:
    PLP                                                                  ;88EC39;
    RTL                                                                  ;88EC3A;


Spawn_WavySamus_HDMAObject:
    PHP                                                                  ;88EC3B;
    PHB                                                                  ;88EC3C;
    PHK                                                                  ;88EC3D;
    PLB                                                                  ;88EC3E;
    REP #$30                                                             ;88EC3F;
    PHX                                                                  ;88EC41;
    LDA.W #$0001                                                         ;88EC42;
    STA.W $0D9C                                                          ;88EC45;
    LDA.W #$4000                                                         ;88EC48;
    STA.W $0D9E                                                          ;88EC4B;
    LDA.W #$0008                                                         ;88EC4E;
    STA.W $0DA0                                                          ;88EC51;
    LDA.W #$00C0                                                         ;88EC54;
    STA.W $0D82                                                          ;88EC57;
    STA.W $0D85                                                          ;88EC5A;
    STA.W $0D88                                                          ;88EC5D;
    STA.W $0D8B                                                          ;88EC60;
    LDA.W #$9800                                                         ;88EC63; $7E
    STA.W $0D83                                                          ;88EC66;
    LDA.W #$9880                                                         ;88EC69; $7E
    STA.W $0D86                                                          ;88EC6C;
    LDA.W #$9800                                                         ;88EC6F; $7E
    STA.W $0D89                                                          ;88EC72;
    LDA.W #$9880                                                         ;88EC75; $7E
    STA.W $0D8C                                                          ;88EC78;
    STZ.W $0D8E                                                          ;88EC7B;
    JSL.L Spawn_HDMAObject                                               ;88EC7E;
    db $42,$11                                                           ;88EC82;
    dw InstList_WavySamus                                                ;88EC84;
    PLX                                                                  ;88EC86;
    PLB                                                                  ;88EC87;
    PLP                                                                  ;88EC88;
    RTL                                                                  ;88EC89;


InstList_WavySamus:
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E             ;88EC8A;
    dw Instruction_HDMAObject_HDMATableBank : db $00                     ;88EC8D;
    dw Instruction_Setup_WavySamus                                       ;88EC90;
    dw Instruction_HDMAObject_PreInstructionInY                          ;88EC92;
    dl PreInstruction_WavySamus                                          ;88EC94;
    dw $0001,$0D82                                                       ;88EC97;
    dw Instruction_HDMAObject_Sleep                                      ;88EC9B;
    dw Instruction_HDMAObject_Delete                                     ;88EC9D;

Instruction_Setup_WavySamus:
    PHP                                                                  ;88EC9F;
    REP #$30                                                             ;88ECA0;
    LDA.W #$FFFE                                                         ;88ECA2;
    STA.W $1914,X                                                        ;88ECA5;
    LDA.W #$0001                                                         ;88ECA8;
    STA.W $1920,X                                                        ;88ECAB;
    STZ.W $192C,X                                                        ;88ECAE;
    STZ.W $1938,X                                                        ;88ECB1;
    PLP                                                                  ;88ECB4;
    RTS                                                                  ;88ECB5;


PreInstruction_WavySamus:
    PHP                                                                  ;88ECB6;
    REP #$30                                                             ;88ECB7;
    LDA.W $0D9C                                                          ;88ECB9;
    BNE .enabled                                                         ;88ECBC;
    LDX.W $18B2                                                          ;88ECBE;
    LDA.W $18CC,X                                                        ;88ECC1;
    INC A                                                                ;88ECC4;
    INC A                                                                ;88ECC5;
    STA.W $18CC,X                                                        ;88ECC6;
    LDA.W #$0001                                                         ;88ECC9;
    STA.W $18E4,X                                                        ;88ECCC;
    PLP                                                                  ;88ECCF;
    RTL                                                                  ;88ECD0;


.enabled:
    LDA.W #$0004                                                         ;88ECD1;
    STA.B $1C                                                            ;88ECD4;
    LDA.W #$0080                                                         ;88ECD6;
    STA.B $1E                                                            ;88ECD9;
    PHX                                                                  ;88ECDB;
    LDA.W $0DA0                                                          ;88ECDC;
    ASL A                                                                ;88ECDF;
    STA.B $12                                                            ;88ECE0;
    LDA.W $1914,X                                                        ;88ECE2;
    CLC                                                                  ;88ECE5;
    ADC.B $12                                                            ;88ECE6;
    AND.W #$01FF                                                         ;88ECE8;
    STA.W $1914,X                                                        ;88ECEB;
    LDA.W $1914,X                                                        ;88ECEE;
    STA.B $14                                                            ;88ECF1;
    LDX.W #$0000                                                         ;88ECF3;

.loop:
    PHX                                                                  ;88ECF6;
    LDX.B $14                                                            ;88ECF7;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;88ECF9;
    BPL +                                                                ;88ECFD;
    JMP.W .negative                                                      ;88ECFF;


  + STA.B $12                                                            ;88ED02;
    SEP #$20                                                             ;88ED04;
    STA.W $4202                                                          ;88ED06;
    LDA.W $0D9E                                                          ;88ED09;
    STA.W $4203                                                          ;88ED0C;
    NOP                                                                  ;88ED0F;
    NOP                                                                  ;88ED10;
    NOP                                                                  ;88ED11;
    REP #$20                                                             ;88ED12;
    LDA.W $4216                                                          ;88ED14;
    XBA                                                                  ;88ED17;
    AND.W #$00FF                                                         ;88ED18;
    STA.B $16                                                            ;88ED1B;
    SEP #$20                                                             ;88ED1D;
    LDA.B $13                                                            ;88ED1F;
    STA.W $4202                                                          ;88ED21;
    LDA.W $0D9E                                                          ;88ED24;
    STA.W $4203                                                          ;88ED27;
    NOP                                                                  ;88ED2A;
    NOP                                                                  ;88ED2B;
    NOP                                                                  ;88ED2C;
    REP #$20                                                             ;88ED2D;
    LDA.W $4216                                                          ;88ED2F;
    CLC                                                                  ;88ED32;
    ADC.B $16                                                            ;88ED33;
    STA.B $16                                                            ;88ED35;
    SEP #$20                                                             ;88ED37;
    LDA.B $12                                                            ;88ED39;
    STA.W $4202                                                          ;88ED3B;
    LDA.W $0D9F                                                          ;88ED3E;
    STA.W $4203                                                          ;88ED41;
    NOP                                                                  ;88ED44;
    NOP                                                                  ;88ED45;
    NOP                                                                  ;88ED46;
    REP #$20                                                             ;88ED47;
    LDA.W $4216                                                          ;88ED49;
    STA.B $18                                                            ;88ED4C;
    SEP #$20                                                             ;88ED4E;
    LDA.B $13                                                            ;88ED50;
    STA.W $4202                                                          ;88ED52;
    LDA.W $0D9F                                                          ;88ED55;
    STA.W $4203                                                          ;88ED58;
    REP #$20                                                             ;88ED5B;
    LDA.B $16                                                            ;88ED5D;
    CLC                                                                  ;88ED5F;
    ADC.B $18                                                            ;88ED60;
    STA.B $16                                                            ;88ED62;
    LDA.W $4215                                                          ;88ED64;
    AND.W #$FF00                                                         ;88ED67;
    CLC                                                                  ;88ED6A;
    ADC.B $16                                                            ;88ED6B;
    AND.W #$FF00                                                         ;88ED6D;
    XBA                                                                  ;88ED70;
    STA.B $12                                                            ;88ED71;
    TXA                                                                  ;88ED73;
    CLC                                                                  ;88ED74;
    ADC.B $1C                                                            ;88ED75;
    AND.W #$01FF                                                         ;88ED77;
    STA.B $14                                                            ;88ED7A;
    PLX                                                                  ;88ED7C;
    LDA.B $B9                                                            ;88ED7D;
    CLC                                                                  ;88ED7F;
    ADC.B $12                                                            ;88ED80;
    STA.L $7E9800,X                                                      ;88ED82;
    JMP.W .next                                                          ;88ED86;


.negative:
    EOR.W #$FFFF                                                         ;88ED89;
    INC A                                                                ;88ED8C;
    STA.B $12                                                            ;88ED8D;
    SEP #$20                                                             ;88ED8F;
    STA.W $4202                                                          ;88ED91;
    LDA.W $0D9E                                                          ;88ED94;
    STA.W $4203                                                          ;88ED97;
    NOP                                                                  ;88ED9A;
    NOP                                                                  ;88ED9B;
    NOP                                                                  ;88ED9C;
    REP #$20                                                             ;88ED9D;
    LDA.W $4216                                                          ;88ED9F;
    XBA                                                                  ;88EDA2;
    AND.W #$00FF                                                         ;88EDA3;
    STA.B $16                                                            ;88EDA6;
    SEP #$20                                                             ;88EDA8;
    LDA.B $13                                                            ;88EDAA;
    STA.W $4202                                                          ;88EDAC;
    LDA.W $0D9E                                                          ;88EDAF;
    STA.W $4203                                                          ;88EDB2;
    NOP                                                                  ;88EDB5;
    NOP                                                                  ;88EDB6;
    NOP                                                                  ;88EDB7;
    REP #$20                                                             ;88EDB8;
    LDA.W $4216                                                          ;88EDBA;
    CLC                                                                  ;88EDBD;
    ADC.B $16                                                            ;88EDBE;
    STA.B $16                                                            ;88EDC0;
    SEP #$20                                                             ;88EDC2;
    LDA.B $12                                                            ;88EDC4;
    STA.W $4202                                                          ;88EDC6;
    LDA.W $0D9F                                                          ;88EDC9;
    STA.W $4203                                                          ;88EDCC;
    NOP                                                                  ;88EDCF;
    NOP                                                                  ;88EDD0;
    NOP                                                                  ;88EDD1;
    REP #$20                                                             ;88EDD2;
    LDA.W $4216                                                          ;88EDD4;
    STA.B $18                                                            ;88EDD7;
    SEP #$20                                                             ;88EDD9;
    LDA.B $13                                                            ;88EDDB;
    STA.W $4202                                                          ;88EDDD;
    LDA.W $0D9F                                                          ;88EDE0;
    STA.W $4203                                                          ;88EDE3;
    REP #$20                                                             ;88EDE6;
    LDA.B $16                                                            ;88EDE8;
    CLC                                                                  ;88EDEA;
    ADC.B $18                                                            ;88EDEB;
    STA.B $16                                                            ;88EDED;
    LDA.W $4215                                                          ;88EDEF;
    AND.W #$FF00                                                         ;88EDF2;
    CLC                                                                  ;88EDF5;
    ADC.B $16                                                            ;88EDF6;
    AND.W #$FF00                                                         ;88EDF8;
    XBA                                                                  ;88EDFB;
    STA.B $12                                                            ;88EDFC;
    TXA                                                                  ;88EDFE;
    CLC                                                                  ;88EDFF;
    ADC.B $1C                                                            ;88EE00;
    AND.W #$01FF                                                         ;88EE02;
    STA.B $14                                                            ;88EE05;
    PLX                                                                  ;88EE07;
    LDA.B $B9                                                            ;88EE08;
    SEC                                                                  ;88EE0A;
    SBC.B $12                                                            ;88EE0B;
    STA.L $7E9800,X                                                      ;88EE0D;

.next:
    INX                                                                  ;88EE11;
    INX                                                                  ;88EE12;
    CPX.B $1E                                                            ;88EE13;
    BPL +                                                                ;88EE15;
    JMP.W .loop                                                          ;88EE17;


  + LDX.W #$007E                                                         ;88EE1A;

.loopBG3XScroll:
    LDA.B $B9                                                            ;88EE1D;
    SEC                                                                  ;88EE1F;
    SBC.L $7E9800,X                                                      ;88EE20;
    CLC                                                                  ;88EE24;
    ADC.B $B9                                                            ;88EE25;
    STA.L $7E9880,X                                                      ;88EE27;
    DEX                                                                  ;88EE2B;
    DEX                                                                  ;88EE2C;
    BPL .loopBG3XScroll                                                  ;88EE2D;
    PLX                                                                  ;88EE2F;
    PLP                                                                  ;88EE30;
    RTL                                                                  ;88EE31;


Freespace_Bank88_EE32:                                                   ;88EE32;
; $11CE bytes
