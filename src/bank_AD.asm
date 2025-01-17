
org $AD8000


Tiles_Crocomire:
incbin "../data/Tiles_Crocomire.bin" ; $2600 bytes

Tiles_CrocomireSkeleton_0:
incbin "../data/Tiles_CrocomireSkeleton_0.bin" ; $200 bytes

Tiles_CrocomireSkeleton_1:
incbin "../data/Tiles_CrocomireSkeleton_1.bin" ; $200 bytes

Tiles_CrocomireSkeleton_2:
incbin "../data/Tiles_CrocomireSkeleton_2.bin" ; $200 bytes

Tiles_CrocomireSkeleton_3:
incbin "../data/Tiles_CrocomireSkeleton_3.bin" ; $200 bytes

Tiles_CrocomireSkeleton_4:
incbin "../data/Tiles_CrocomireSkeleton_4.bin" ; $200 bytes

Tiles_CrocomireSkeleton_5:
incbin "../data/Tiles_CrocomireSkeleton_5.bin" ; $200 bytes

Tiles_BombTorizosCrumblingChozo:
incbin "../data/Tiles_BombTorizosCrumblingChozo.bin" ; $400 bytes

Tiles_Ship:
incbin "../data/Tiles_Ship.bin" ; $1000 bytes

Tiles_SpacePirate:
incbin "../data/Tiles_SpacePirate.bin" ; $1800 bytes

CalculateMotherBrainRainbowBeamHDMATables:
    LDA.L $7E8027                                                        ;ADDE00;
    AND.W #$00FF                                                         ;ADDE04;
    LSR A                                                                ;ADDE07;
    STA.B $12                                                            ;ADDE08;
    LDA.L $7E8022                                                        ;ADDE0A;
    SEC                                                                  ;ADDE0E;
    SBC.B $12                                                            ;ADDE0F;
    STA.L $7E8034                                                        ;ADDE11;
    LDA.L $7E8022                                                        ;ADDE15;
    CLC                                                                  ;ADDE19;
    ADC.B $12                                                            ;ADDE1A;
    STA.L $7E8036                                                        ;ADDE1C;
    LDA.W $0FB9                                                          ;ADDE20;
    CLC                                                                  ;ADDE23;
    ADC.W #$0E00                                                         ;ADDE24;
    AND.W #$FF00                                                         ;ADDE27;
    STA.L $7E8038                                                        ;ADDE2A;
    STA.L $7E803C                                                        ;ADDE2E;
    LDA.W $0FBE                                                          ;ADDE32;
    CLC                                                                  ;ADDE35;
    ADC.W #$0005                                                         ;ADDE36;
    STA.L $7E803A                                                        ;ADDE39;
    STA.L $7E803E                                                        ;ADDE3D;
    LDA.L $7E8034                                                        ;ADDE41;
    AND.W #$00C0                                                         ;ADDE45;
    ASL A                                                                ;ADDE48;
    ASL A                                                                ;ADDE49;
    STA.B $12                                                            ;ADDE4A;
    LDA.L $7E8036                                                        ;ADDE4C;
    AND.W #$00C0                                                         ;ADDE50;
    ORA.B $12                                                            ;ADDE53;
    ASL A                                                                ;ADDE55;
    ASL A                                                                ;ADDE56;
    ASL A                                                                ;ADDE57;
    XBA                                                                  ;ADDE58;
    TAX                                                                  ;ADDE59;
    JSR.W (CalculateMotherBrainRainbowBeamHDMATables_pointers,X)         ;ADDE5A;
    RTL                                                                  ;ADDE5D;


RTS_ADDE5E:
    RTS                                                                  ;ADDE5E;


CalculateMotherBrainRainbowBeamHDMATables_pointers:
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownwards       ;ADDE5F;
    dw CalculateMotherBrainRainbowBeamHDMATable_AimedRight               ;ADDE61;
    dw $0000                                                             ;ADDE63;
    dw $0000                                                             ;ADDE65;
    dw $0000                                                             ;ADDE67;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpwards         ;ADDE69;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpwards         ;ADDE6B;
    dw $0000                                                             ;ADDE6D;
    dw $0000                                                             ;ADDE6F;
    dw $0000                                                             ;ADDE71;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpwards         ;ADDE73;
    dw RTS_ADDE5E                                                        ;ADDE75;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownwards       ;ADDE77;
    dw $0000                                                             ;ADDE79;
    dw $0000                                                             ;ADDE7B;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownwards       ;ADDE7D;

CalculateMotherBrainRainbowBeamHDMATable_AimedRight:
    LDA.L $7E8038                                                        ;ADDE7F;
    STA.B $16                                                            ;ADDE83;
    LDA.L $7E803C                                                        ;ADDE85;
    STA.B $18                                                            ;ADDE89;
    JSR.W CalculateMotherBrainRainbowBeamHDMADataTable_AimedRight        ;ADDE8B;
    LDA.W #$0010                                                         ;ADDE8E;
    STA.L $7E9C00                                                        ;ADDE91;
    LDA.W #$9C00                                                         ;ADDE95;
    STA.L $7E9C01                                                        ;ADDE98;
    LDA.W #$0010                                                         ;ADDE9C;
    STA.L $7E9C03                                                        ;ADDE9F;
    LDA.W #$9C03                                                         ;ADDEA3;
    STA.L $7E9C04                                                        ;ADDEA6;
    LDA.W #$00F0                                                         ;ADDEAA;
    STA.L $7E9C06                                                        ;ADDEAD;
    LDA.W #$9D04                                                         ;ADDEB1;
    STA.L $7E9C07                                                        ;ADDEB4;
    LDA.W #$00F4                                                         ;ADDEB8;
    STA.L $7E9C09                                                        ;ADDEBB;
    LDA.W #$9DEC                                                         ;ADDEBF;
    STA.L $7E9C0A                                                        ;ADDEC2;
    LDA.W #$0000                                                         ;ADDEC6;
    STA.L $7E9C0C                                                        ;ADDEC9;
    RTS                                                                  ;ADDECD;


CalculateMotherBrainRainbowBeamHDMADataTable_AimedRight:
    PHB                                                                  ;ADDECE;
    PEA.W $7E7E                                                          ;ADDECF;
    PLB                                                                  ;ADDED2;
    PLB                                                                  ;ADDED3;
    LDA.W #$00FF                                                         ;ADDED4;
    STA.W $9D00                                                          ;ADDED7;
    STA.W $9D02                                                          ;ADDEDA;
    LDA.W $8034                                                          ;ADDEDD;
    AND.W #$00FF                                                         ;ADDEE0;
    ASL A                                                                ;ADDEE3;
    TAX                                                                  ;ADDEE4;
    LDA.L AbsoluteTangentTable,X                                         ;ADDEE5;
    STA.B $12                                                            ;ADDEE9;
    LDA.W $8036                                                          ;ADDEEB;
    AND.W #$00FF                                                         ;ADDEEE;
    ASL A                                                                ;ADDEF1;
    TAX                                                                  ;ADDEF2;
    LDA.L AbsoluteTangentTable,X                                         ;ADDEF3;
    STA.B $14                                                            ;ADDEF7;
    LDA.W $803E                                                          ;ADDEF9;
    TAY                                                                  ;ADDEFC;
    SEC                                                                  ;ADDEFD;
    SBC.W #$0020                                                         ;ADDEFE;
    ASL A                                                                ;ADDF01;
    CLC                                                                  ;ADDF02;
    ADC.W #$9D02                                                         ;ADDF03;
    TAX                                                                  ;ADDF06;
    LDA.W #$00FF                                                         ;ADDF07;
    STA.W $0002,X                                                        ;ADDF0A;
    STA.W $0004,X                                                        ;ADDF0D;
    PHX                                                                  ;ADDF10;

.loopLeftEdge:
    LDA.B $18                                                            ;ADDF11;
    CLC                                                                  ;ADDF13;
    ADC.B $14                                                            ;ADDF14;
    BCS ..done                                                           ;ADDF16;
    STA.B $18                                                            ;ADDF18;
    XBA                                                                  ;ADDF1A;
    AND.W #$00FF                                                         ;ADDF1B;
    ORA.W #$FF00                                                         ;ADDF1E;
    STA.W $0000,X                                                        ;ADDF21;
    DEX                                                                  ;ADDF24;
    DEX                                                                  ;ADDF25;
    DEY                                                                  ;ADDF26;
    CPY.W #$0020                                                         ;ADDF27;
    BNE .loopLeftEdge                                                    ;ADDF2A;

..done:
    LDA.W #$00FF                                                         ;ADDF2C;

.loopLeftSidePadding:
    STA.W $0000,X                                                        ;ADDF2F;
    DEX                                                                  ;ADDF32;
    DEX                                                                  ;ADDF33;
    DEY                                                                  ;ADDF34;
    CPY.W #$0020                                                         ;ADDF35;
    BNE .loopLeftSidePadding                                             ;ADDF38;
    PLX                                                                  ;ADDF3A;
    INX                                                                  ;ADDF3B;
    INX                                                                  ;ADDF3C;
    LDA.W $803E                                                          ;ADDF3D;
    TAY                                                                  ;ADDF40;

.loopRightEdge:
    LDA.B $16                                                            ;ADDF41;
    CLC                                                                  ;ADDF43;
    ADC.B $12                                                            ;ADDF44;
    BCS ..done                                                           ;ADDF46;
    STA.B $16                                                            ;ADDF48;
    XBA                                                                  ;ADDF4A;
    AND.W #$00FF                                                         ;ADDF4B;
    ORA.W #$FF00                                                         ;ADDF4E;
    STA.W $0000,X                                                        ;ADDF51;
    INX                                                                  ;ADDF54;
    INX                                                                  ;ADDF55;
    INY                                                                  ;ADDF56;
    CPY.W #$00E8                                                         ;ADDF57;
    BNE .loopRightEdge                                                   ;ADDF5A;
    PLB                                                                  ;ADDF5C;
    RTS                                                                  ;ADDF5D;


..done:
    LDA.W #$00FF                                                         ;ADDF5E;

.loopRightSidePadding:
    STA.W $0000,X                                                        ;ADDF61;
    INX                                                                  ;ADDF64;
    INX                                                                  ;ADDF65;
    INY                                                                  ;ADDF66;
    CPY.W #$00E8                                                         ;ADDF67;
    BNE .loopRightSidePadding                                            ;ADDF6A;
    PLB                                                                  ;ADDF6C;
    RTS                                                                  ;ADDF6D;


CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpwards:
    LDA.L $7E8038                                                        ;ADDF6E;
    STA.B $16                                                            ;ADDF72;
    LDA.L $7E803C                                                        ;ADDF74;
    STA.B $18                                                            ;ADDF78;
    SEP #$20                                                             ;ADDF7A;
    LDA.L $7E8034                                                        ;ADDF7C;
    ASL A                                                                ;ADDF80;
    ROL.B $12                                                            ;ADDF81;
    LDA.L $7E8036                                                        ;ADDF83;
    ASL A                                                                ;ADDF87;
    ROL.B $12                                                            ;ADDF88;
    LDA.B $12                                                            ;ADDF8A;
    REP #$20                                                             ;ADDF8C;
    AND.W #$0003                                                         ;ADDF8E;
    ASL A                                                                ;ADDF91;
    TAX                                                                  ;ADDF92;
    JSR.W (.pointers,X)                                                  ;ADDF93;
    LDA.W #$0010                                                         ;ADDF96;
    STA.L $7E9C00                                                        ;ADDF99;
    LDA.W #$9D00                                                         ;ADDF9D;
    STA.L $7E9C01                                                        ;ADDFA0;
    LDA.W #$0010                                                         ;ADDFA4;
    STA.L $7E9C03                                                        ;ADDFA7;
    LDA.W #$9D02                                                         ;ADDFAB;
    STA.L $7E9C04                                                        ;ADDFAE;
    LDA.L $7E803A                                                        ;ADDFB2;
    SEC                                                                  ;ADDFB6;
    SBC.W #$0020                                                         ;ADDFB7;
    CMP.W #$0080                                                         ;ADDFBA;
    BCS .greaterThanEqualTo80                                            ;ADDFBD;
    PHA                                                                  ;ADDFBF;
    ORA.W #$0080                                                         ;ADDFC0;
    STA.L $7E9C06                                                        ;ADDFC3;
    LDA.W #$9D04                                                         ;ADDFC7;
    STA.L $7E9C07                                                        ;ADDFCA;
    LDA.W #$007F                                                         ;ADDFCE;
    STA.L $7E9C09                                                        ;ADDFD1;
    PLA                                                                  ;ADDFD5;
    ASL A                                                                ;ADDFD6;
    CLC                                                                  ;ADDFD7;
    ADC.W #$9D04                                                         ;ADDFD8;
    STA.L $7E9C0A                                                        ;ADDFDB;
    LDA.W #$0000                                                         ;ADDFDF;
    STA.L $7E9C0C                                                        ;ADDFE2;
    RTS                                                                  ;ADDFE6;


.greaterThanEqualTo80:
    SEC                                                                  ;ADDFE7;
    SBC.W #$007F                                                         ;ADDFE8;
    STA.B $12                                                            ;ADDFEB;
    ORA.W #$0080                                                         ;ADDFED;
    STA.L $7E9C06                                                        ;ADDFF0;
    LDA.W #$9D04                                                         ;ADDFF4;
    STA.L $7E9C07                                                        ;ADDFF7;
    LDA.W #$00FF                                                         ;ADDFFB;
    STA.L $7E9C09                                                        ;ADDFFE;
    LDA.B $12                                                            ;ADE002;
    ASL A                                                                ;ADE004;
    ADC.W #$9D04                                                         ;ADE005;
    STA.L $7E9C0A                                                        ;ADE008;
    PHA                                                                  ;ADE00C;
    LDA.W #$007F                                                         ;ADE00D;
    STA.L $7E9C0C                                                        ;ADE010;
    PLA                                                                  ;ADE014;
    ADC.W #$00FE                                                         ;ADE015;
    STA.L $7E9C0D                                                        ;ADE018;
    LDA.W #$0000                                                         ;ADE01C;
    STA.L $7E9C0F                                                        ;ADE01F;
    RTS                                                                  ;ADE023;


.pointers:
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpRight         ;ADE024;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUp              ;ADE026;
    dw $0000                                                             ;ADE028;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpLeft          ;ADE02A;

CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpRight:
    PHB                                                                  ;ADE02C;
    PEA.W $7E7E                                                          ;ADE02D;
    PLB                                                                  ;ADE030;
    PLB                                                                  ;ADE031;
    LDA.W #$00FF                                                         ;ADE032;
    STA.W $9D00                                                          ;ADE035;
    STA.W $9D02                                                          ;ADE038;
    LDA.W $8036                                                          ;ADE03B;
    AND.W #$00FF                                                         ;ADE03E;
    ASL A                                                                ;ADE041;
    TAX                                                                  ;ADE042;
    LDA.L AbsoluteTangentTable,X                                         ;ADE043;
    STA.B $12                                                            ;ADE047;
    LDA.W $8034                                                          ;ADE049;
    AND.W #$00FF                                                         ;ADE04C;
    ASL A                                                                ;ADE04F;
    TAX                                                                  ;ADE050;
    LDA.L AbsoluteTangentTable,X                                         ;ADE051;
    STA.B $14                                                            ;ADE055;
    LDA.W $803A                                                          ;ADE057;
    TAY                                                                  ;ADE05A;
    SEC                                                                  ;ADE05B;
    SBC.W #$0020                                                         ;ADE05C;
    ASL A                                                                ;ADE05F;
    CLC                                                                  ;ADE060;
    ADC.W #$9D02                                                         ;ADE061;
    TAX                                                                  ;ADE064;
    LDA.W #$00FF                                                         ;ADE065;
    STA.W $0002,X                                                        ;ADE068;
    STA.W $0004,X                                                        ;ADE06B;

.loop:
    LDA.B $16                                                            ;ADE06E;
    CLC                                                                  ;ADE070;
    ADC.B $12                                                            ;ADE071;
    BCC +                                                                ;ADE073;
    LDA.W #$FFFF                                                         ;ADE075;

  + STA.B $16                                                            ;ADE078;
    AND.W #$FF00                                                         ;ADE07A;
    XBA                                                                  ;ADE07D;
    STA.B $24                                                            ;ADE07E;
    LDA.B $18                                                            ;ADE080;
    CLC                                                                  ;ADE082;
    ADC.B $14                                                            ;ADE083;
    BCC +                                                                ;ADE085;
    LDA.W #$FFFF                                                         ;ADE087;

  + STA.B $18                                                            ;ADE08A;
    AND.W #$FF00                                                         ;ADE08C;
    ORA.B $24                                                            ;ADE08F;
    CMP.W #$FFFF                                                         ;ADE091;
    BNE .next                                                            ;ADE094;
    LDA.W #$00FF                                                         ;ADE096;

.next:
    STA.W $0000,X                                                        ;ADE099;
    DEX                                                                  ;ADE09C;
    DEX                                                                  ;ADE09D;
    DEY                                                                  ;ADE09E;
    CPY.W #$0020                                                         ;ADE09F;
    BNE .loop                                                            ;ADE0A2;
    PLB                                                                  ;ADE0A4;
    RTS                                                                  ;ADE0A5;


CalculateMotherBrainRainbowBeamHDMADataTable_AimedUp:
    PHB                                                                  ;ADE0A6;
    PEA.W $7E7E                                                          ;ADE0A7;
    PLB                                                                  ;ADE0AA;
    PLB                                                                  ;ADE0AB;
    LDA.W #$00FF                                                         ;ADE0AC;
    STA.W $9D00                                                          ;ADE0AF;
    STA.W $9D02                                                          ;ADE0B2;
    LDA.W $8036                                                          ;ADE0B5;
    EOR.W #$FFFF                                                         ;ADE0B8;
    INC A                                                                ;ADE0BB;
    AND.W #$00FF                                                         ;ADE0BC;
    ASL A                                                                ;ADE0BF;
    TAX                                                                  ;ADE0C0;
    LDA.L AbsoluteTangentTable,X                                         ;ADE0C1;
    STA.B $12                                                            ;ADE0C5;
    LDA.W $8034                                                          ;ADE0C7;
    AND.W #$00FF                                                         ;ADE0CA;
    ASL A                                                                ;ADE0CD;
    TAX                                                                  ;ADE0CE;
    LDA.L AbsoluteTangentTable,X                                         ;ADE0CF;
    STA.B $14                                                            ;ADE0D3;
    LDA.W $803A                                                          ;ADE0D5;
    TAY                                                                  ;ADE0D8;
    SEC                                                                  ;ADE0D9;
    SBC.W #$0020                                                         ;ADE0DA;
    ASL A                                                                ;ADE0DD;
    CLC                                                                  ;ADE0DE;
    ADC.W #$9D02                                                         ;ADE0DF;
    TAX                                                                  ;ADE0E2;
    LDA.W #$00FF                                                         ;ADE0E3;
    STA.W $0002,X                                                        ;ADE0E6;
    STA.W $0004,X                                                        ;ADE0E9;

.loop:
    LDA.B $16                                                            ;ADE0EC;
    SEC                                                                  ;ADE0EE;
    SBC.B $12                                                            ;ADE0EF;
    BCS +                                                                ;ADE0F1;
    LDA.W #$0000                                                         ;ADE0F3;

  + STA.B $16                                                            ;ADE0F6;
    AND.W #$FF00                                                         ;ADE0F8;
    XBA                                                                  ;ADE0FB;
    STA.B $1A                                                            ;ADE0FC;
    LDA.B $18                                                            ;ADE0FE;
    CLC                                                                  ;ADE100;
    ADC.B $14                                                            ;ADE101;
    BCC +                                                                ;ADE103;
    LDA.W #$FFFF                                                         ;ADE105;

  + STA.B $18                                                            ;ADE108;
    AND.W #$FF00                                                         ;ADE10A;
    ORA.B $1A                                                            ;ADE10D;
    CMP.W #$FFFF                                                         ;ADE10F;
    BNE .next                                                            ;ADE112;
    LDA.W #$00FF                                                         ;ADE114;

.next:
    STA.W $0000,X                                                        ;ADE117;
    DEX                                                                  ;ADE11A;
    DEX                                                                  ;ADE11B;
    DEY                                                                  ;ADE11C;
    CPY.W #$0020                                                         ;ADE11D;
    BNE .loop                                                            ;ADE120;
    PLB                                                                  ;ADE122;
    RTS                                                                  ;ADE123;


CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpLeft:
    PHB                                                                  ;ADE124;
    PEA.W $7E7E                                                          ;ADE125;
    PLB                                                                  ;ADE128;
    PLB                                                                  ;ADE129;
    LDA.W #$00FF                                                         ;ADE12A;
    STA.W $9D00                                                          ;ADE12D;
    STA.W $9D02                                                          ;ADE130;
    LDA.W $8036                                                          ;ADE133;
    EOR.W #$FFFF                                                         ;ADE136;
    INC A                                                                ;ADE139;
    AND.W #$00FF                                                         ;ADE13A;
    ASL A                                                                ;ADE13D;
    TAX                                                                  ;ADE13E;
    LDA.L AbsoluteTangentTable,X                                         ;ADE13F;
    STA.B $12                                                            ;ADE143;
    LDA.W $8034                                                          ;ADE145;
    EOR.W #$FFFF                                                         ;ADE148;
    INC A                                                                ;ADE14B;
    AND.W #$00FF                                                         ;ADE14C;
    ASL A                                                                ;ADE14F;
    TAX                                                                  ;ADE150;
    LDA.L AbsoluteTangentTable,X                                         ;ADE151;
    STA.B $14                                                            ;ADE155;
    LDA.W $803A                                                          ;ADE157;
    TAY                                                                  ;ADE15A;
    SEC                                                                  ;ADE15B;
    SBC.W #$0020                                                         ;ADE15C;
    ASL A                                                                ;ADE15F;
    CLC                                                                  ;ADE160;
    ADC.W #$9D02                                                         ;ADE161;
    TAX                                                                  ;ADE164;
    LDA.W #$00FF                                                         ;ADE165;
    STA.W $0002,X                                                        ;ADE168;
    STA.W $0004,X                                                        ;ADE16B;

.loop:
    LDA.B $16                                                            ;ADE16E;
    SEC                                                                  ;ADE170;
    SBC.B $12                                                            ;ADE171;
    BCS +                                                                ;ADE173;
    LDA.W #$0000                                                         ;ADE175;

  + STA.B $16                                                            ;ADE178;
    AND.W #$FF00                                                         ;ADE17A;
    XBA                                                                  ;ADE17D;
    STA.B $24                                                            ;ADE17E;
    LDA.B $18                                                            ;ADE180;
    SEC                                                                  ;ADE182;
    SBC.B $14                                                            ;ADE183;
    BCS +                                                                ;ADE185;
    LDA.W #$0000                                                         ;ADE187;

  + STA.B $18                                                            ;ADE18A;
    AND.W #$FF00                                                         ;ADE18C;
    ORA.B $24                                                            ;ADE18F;
    CMP.W #$FFFF                                                         ;ADE191;
    BNE .next                                                            ;ADE194;
    LDA.W #$00FF                                                         ;ADE196;

.next:
    STA.W $0000,X                                                        ;ADE199;
    DEX                                                                  ;ADE19C;
    DEX                                                                  ;ADE19D;
    DEY                                                                  ;ADE19E;
    CPY.W #$0020                                                         ;ADE19F;
    BNE .loop                                                            ;ADE1A2;
    PLB                                                                  ;ADE1A4;
    RTS                                                                  ;ADE1A5;


CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownwards:
    LDA.L $7E8038                                                        ;ADE1A6;
    STA.B $16                                                            ;ADE1AA;
    LDA.L $7E803C                                                        ;ADE1AC;
    STA.B $18                                                            ;ADE1B0;
    SEP #$20                                                             ;ADE1B2;
    LDA.L $7E8034                                                        ;ADE1B4;
    ASL A                                                                ;ADE1B8;
    ROL.B $12                                                            ;ADE1B9;
    LDA.L $7E8036                                                        ;ADE1BB;
    ASL A                                                                ;ADE1BF;
    ROL.B $12                                                            ;ADE1C0;
    LDA.B $12                                                            ;ADE1C2;
    REP #$20                                                             ;ADE1C4;
    AND.W #$0003                                                         ;ADE1C6;
    ASL A                                                                ;ADE1C9;
    TAX                                                                  ;ADE1CA;
    JSR.W (.pointers,X)                                                  ;ADE1CB;
    LDA.W #$0010                                                         ;ADE1CE;
    STA.L $7E9C00                                                        ;ADE1D1;
    LDA.W #$9C00                                                         ;ADE1D5;
    STA.L $7E9C01                                                        ;ADE1D8;
    LDA.W #$0010                                                         ;ADE1DC;
    STA.L $7E9C03                                                        ;ADE1DF;
    LDA.W #$9C03                                                         ;ADE1E3;
    STA.L $7E9C04                                                        ;ADE1E6;
    LDA.W #$00F0                                                         ;ADE1EA;
    STA.L $7E9C06                                                        ;ADE1ED;
    LDA.W #$9D04                                                         ;ADE1F1;
    STA.L $7E9C07                                                        ;ADE1F4;
    LDA.W #$00F4                                                         ;ADE1F8;
    STA.L $7E9C09                                                        ;ADE1FB;
    LDA.W #$9DE6                                                         ;ADE1FF;
    STA.L $7E9C0A                                                        ;ADE202;
    LDA.W #$0000                                                         ;ADE206;
    STA.L $7E9C0C                                                        ;ADE209;
    RTS                                                                  ;ADE20D;


.pointers:
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownRight       ;ADE20E;
    dw $0000                                                             ;ADE210;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDown            ;ADE212;
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownLeft        ;ADE214;

CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownRight:
    PHB                                                                  ;ADE216;
    PEA.W $7E7E                                                          ;ADE217;
    PLB                                                                  ;ADE21A;
    PLB                                                                  ;ADE21B;
    LDA.W #$00FF                                                         ;ADE21C;
    STA.W $9D00                                                          ;ADE21F;
    STA.W $9D02                                                          ;ADE222;
    LDA.W $8034                                                          ;ADE225;
    AND.W #$00FF                                                         ;ADE228;
    ASL A                                                                ;ADE22B;
    TAX                                                                  ;ADE22C;
    LDA.L AbsoluteTangentTable,X                                         ;ADE22D;
    STA.B $12                                                            ;ADE231;
    LDA.W $8036                                                          ;ADE233;
    AND.W #$00FF                                                         ;ADE236;
    ASL A                                                                ;ADE239;
    TAX                                                                  ;ADE23A;
    LDA.L AbsoluteTangentTable,X                                         ;ADE23B;
    STA.B $14                                                            ;ADE23F;
    LDA.W $803A                                                          ;ADE241;
    SEC                                                                  ;ADE244;
    SBC.W #$0020                                                         ;ADE245;
    TAY                                                                  ;ADE248;
    LDX.W #$9D04                                                         ;ADE249;
    LDA.W #$00FF                                                         ;ADE24C;

.loopPadAbove:
    STA.W $0000,X                                                        ;ADE24F;
    INX                                                                  ;ADE252;
    INX                                                                  ;ADE253;
    DEY                                                                  ;ADE254;
    BNE .loopPadAbove                                                    ;ADE255;
    LDA.W $803A                                                          ;ADE257;
    TAY                                                                  ;ADE25A;

.loopBeam:
    LDA.B $16                                                            ;ADE25B;
    CLC                                                                  ;ADE25D;
    ADC.B $12                                                            ;ADE25E;
    BCC +                                                                ;ADE260;
    LDA.W #$FFFF                                                         ;ADE262;

  + STA.B $16                                                            ;ADE265;
    AND.W #$FF00                                                         ;ADE267;
    XBA                                                                  ;ADE26A;
    STA.B $1A                                                            ;ADE26B;
    LDA.B $18                                                            ;ADE26D;
    CLC                                                                  ;ADE26F;
    ADC.B $14                                                            ;ADE270;
    BCC +                                                                ;ADE272;
    LDA.W #$FFFF                                                         ;ADE274;

  + STA.B $18                                                            ;ADE277;
    AND.W #$FF00                                                         ;ADE279;
    ORA.B $1A                                                            ;ADE27C;
    CMP.W #$FFFF                                                         ;ADE27E;
    BNE +                                                                ;ADE281;
    LDA.W #$00FF                                                         ;ADE283;

  + STA.W $0000,X                                                        ;ADE286;
    INX                                                                  ;ADE289;
    INX                                                                  ;ADE28A;
    INY                                                                  ;ADE28B;
    CPY.W #$00E8                                                         ;ADE28C;
    BNE .loopBeam                                                        ;ADE28F;
    PLB                                                                  ;ADE291;
    RTS                                                                  ;ADE292;


CalculateMotherBrainRainbowBeamHDMADataTable_AimedDown:
    PHB                                                                  ;ADE293;
    PEA.W $7E7E                                                          ;ADE294;
    PLB                                                                  ;ADE297;
    PLB                                                                  ;ADE298;
    LDA.W #$00FF                                                         ;ADE299;
    STA.W $9D00                                                          ;ADE29C;
    STA.W $9D02                                                          ;ADE29F;
    LDA.W $8034                                                          ;ADE2A2;
    EOR.W #$FFFF                                                         ;ADE2A5;
    INC A                                                                ;ADE2A8;
    AND.W #$00FF                                                         ;ADE2A9;
    ASL A                                                                ;ADE2AC;
    TAX                                                                  ;ADE2AD;
    LDA.L AbsoluteTangentTable,X                                         ;ADE2AE;
    STA.B $12                                                            ;ADE2B2;
    LDA.W $8036                                                          ;ADE2B4;
    AND.W #$00FF                                                         ;ADE2B7;
    ASL A                                                                ;ADE2BA;
    TAX                                                                  ;ADE2BB;
    LDA.L AbsoluteTangentTable,X                                         ;ADE2BC;
    STA.B $14                                                            ;ADE2C0;
    LDA.W $803A                                                          ;ADE2C2;
    SEC                                                                  ;ADE2C5;
    SBC.W #$0020                                                         ;ADE2C6;
    TAY                                                                  ;ADE2C9;
    LDX.W #$9D04                                                         ;ADE2CA;
    LDA.W #$00FF                                                         ;ADE2CD;

.loopPadAbove:
    STA.W $0000,X                                                        ;ADE2D0;
    INX                                                                  ;ADE2D3;
    INX                                                                  ;ADE2D4;
    DEY                                                                  ;ADE2D5;
    BNE .loopPadAbove                                                    ;ADE2D6;
    LDA.W $803A                                                          ;ADE2D8;
    TAY                                                                  ;ADE2DB;

.loopBeam:
    LDA.B $16                                                            ;ADE2DC;
    SEC                                                                  ;ADE2DE;
    SBC.B $12                                                            ;ADE2DF;
    BCS +                                                                ;ADE2E1;
    LDA.W #$0000                                                         ;ADE2E3;

  + STA.B $16                                                            ;ADE2E6;
    AND.W #$FF00                                                         ;ADE2E8;
    XBA                                                                  ;ADE2EB;
    STA.B $1A                                                            ;ADE2EC;
    LDA.B $18                                                            ;ADE2EE;
    CLC                                                                  ;ADE2F0;
    ADC.B $14                                                            ;ADE2F1;
    BCC +                                                                ;ADE2F3;
    LDA.W #$FFFF                                                         ;ADE2F5;

  + STA.B $18                                                            ;ADE2F8;
    AND.W #$FF00                                                         ;ADE2FA;
    ORA.B $1A                                                            ;ADE2FD;
    CMP.W #$FFFF                                                         ;ADE2FF;
    BNE +                                                                ;ADE302;
    LDA.W #$00FF                                                         ;ADE304;

  + STA.W $0000,X                                                        ;ADE307;
    INX                                                                  ;ADE30A;
    INX                                                                  ;ADE30B;
    INY                                                                  ;ADE30C;
    CPY.W #$00E8                                                         ;ADE30D;
    BNE .loopBeam                                                        ;ADE310;
    PLB                                                                  ;ADE312;
    RTS                                                                  ;ADE313;


CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownLeft:
    PHB                                                                  ;ADE314;
    PEA.W $7E7E                                                          ;ADE315;
    PLB                                                                  ;ADE318;
    PLB                                                                  ;ADE319;
    LDA.W #$00FF                                                         ;ADE31A;
    STA.W $9D00                                                          ;ADE31D;
    STA.W $9D02                                                          ;ADE320;
    LDA.W $8034                                                          ;ADE323;
    EOR.W #$FFFF                                                         ;ADE326;
    INC A                                                                ;ADE329;
    AND.W #$00FF                                                         ;ADE32A;
    ASL A                                                                ;ADE32D;
    TAX                                                                  ;ADE32E;
    LDA.L AbsoluteTangentTable,X                                         ;ADE32F;
    STA.B $12                                                            ;ADE333;
    LDA.W $8036                                                          ;ADE335;
    EOR.W #$FFFF                                                         ;ADE338;
    INC A                                                                ;ADE33B;
    AND.W #$00FF                                                         ;ADE33C;
    ASL A                                                                ;ADE33F;
    TAX                                                                  ;ADE340;
    LDA.L AbsoluteTangentTable,X                                         ;ADE341;
    STA.B $14                                                            ;ADE345;
    LDA.W $803A                                                          ;ADE347;
    SEC                                                                  ;ADE34A;
    SBC.W #$0020                                                         ;ADE34B;
    TAY                                                                  ;ADE34E;
    LDX.W #$9D04                                                         ;ADE34F;
    LDA.W #$00FF                                                         ;ADE352;

.loopPadAbove:
    STA.W $0000,X                                                        ;ADE355;
    INX                                                                  ;ADE358;
    INX                                                                  ;ADE359;
    DEY                                                                  ;ADE35A;
    BNE .loopPadAbove                                                    ;ADE35B;
    LDA.W $803A                                                          ;ADE35D;
    TAY                                                                  ;ADE360;

.loopBeam:
    LDA.B $16                                                            ;ADE361;
    SEC                                                                  ;ADE363;
    SBC.B $12                                                            ;ADE364;
    BCS +                                                                ;ADE366;
    LDA.W #$0000                                                         ;ADE368;

  + STA.B $16                                                            ;ADE36B;
    AND.W #$FF00                                                         ;ADE36D;
    XBA                                                                  ;ADE370;
    STA.B $1A                                                            ;ADE371;
    LDA.B $18                                                            ;ADE373;
    SEC                                                                  ;ADE375;
    SBC.B $14                                                            ;ADE376;
    BCS +                                                                ;ADE378;
    LDA.W #$0000                                                         ;ADE37A;

  + STA.B $18                                                            ;ADE37D;
    AND.W #$FF00                                                         ;ADE37F;
    ORA.B $1A                                                            ;ADE382;
    BNE +                                                                ;ADE384;
    LDA.W #$00FF                                                         ;ADE386;

  + STA.W $0000,X                                                        ;ADE389;
    INX                                                                  ;ADE38C;
    INX                                                                  ;ADE38D;
    INY                                                                  ;ADE38E;
    CPY.W #$00E8                                                         ;ADE38F;
    BNE .loopBeam                                                        ;ADE392;
    PLB                                                                  ;ADE394;
    RTS                                                                  ;ADE395;


SealMotherBrainsWallFunction_FakeDeath_Descent:
    LDA.W #$00F8                                                         ;ADE396;
    STA.B $12                                                            ;ADE399;
    LDA.W #$0048                                                         ;ADE39B;
    STA.B $14                                                            ;ADE39E;
    LDA.W #$0009                                                         ;ADE3A0;
    LDY.W #EnemyProjectile_MiscDust                                      ;ADE3A3;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;ADE3A6;
    LDA.W #$00F8                                                         ;ADE3AA;
    STA.B $12                                                            ;ADE3AD;
    LDA.W #$0098                                                         ;ADE3AF;
    STA.B $14                                                            ;ADE3B2;
    LDA.W #$0009                                                         ;ADE3B4;
    LDY.W #EnemyProjectile_MiscDust                                      ;ADE3B7;
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics                  ;ADE3BA;
    JSL.L Spawn_Hardcoded_PLM                                            ;ADE3BE;
    db $0F,$04                                                           ;ADE3C2;
    dw PLMEntries_fillMotherBrainsWall                                   ;ADE3C4;
    JSL.L Spawn_Hardcoded_PLM                                            ;ADE3C6;
    db $0F,$09                                                           ;ADE3CA;
    dw PLMEntries_fillMotherBrainsWall                                   ;ADE3CC;
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_InitialPause       ;ADE3CE;
    STA.W $0FA8                                                          ;ADE3D1;
    RTL                                                                  ;ADE3D4;


MotherBrainHealthBasedPaletteHandling:
    LDA.L $7E783E                                                        ;ADE3D5;
    CMP.W #$0002                                                         ;ADE3D9;
    BCS .recovered                                                       ;ADE3DC;
    RTL                                                                  ;ADE3DE;


.recovered:
    PHB                                                                  ;ADE3DF;
    PEA.W $AD00                                                          ;ADE3E0;
    PLB                                                                  ;ADE3E3;
    PLB                                                                  ;ADE3E4;
    LDY.W #$0000                                                         ;ADE3E5;
    LDA.W $0FCC                                                          ;ADE3E8;
    CMP.W #$2328                                                         ;ADE3EB;
    BCS .writePalette                                                    ;ADE3EE;
    LDY.W #$0002                                                         ;ADE3F0;
    CMP.W #$1518                                                         ;ADE3F3;
    BCS .writePalette                                                    ;ADE3F6;
    LDY.W #$0004                                                         ;ADE3F8;
    CMP.W #$0708                                                         ;ADE3FB;
    BCS .writePalette                                                    ;ADE3FE;
    LDY.W #$0006                                                         ;ADE400;

.writePalette:
    PHY                                                                  ;ADE403;
    LDA.W MotherBrainHealthBasedPalettes_BrainBody,Y                     ;ADE404;
    TAY                                                                  ;ADE407;
    LDX.W #$0082                                                         ;ADE408;
    LDA.W #$000F                                                         ;ADE40B;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADE40E;
    LDA.B $01,S                                                          ;ADE412;
    TAY                                                                  ;ADE414;
    LDA.W MotherBrainHealthBasedPalettes_BrainBody,Y                     ;ADE415;
    TAY                                                                  ;ADE418;
    LDX.W #$0122                                                         ;ADE419;
    LDA.W #$000F                                                         ;ADE41C;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADE41F;
    PLY                                                                  ;ADE423;
    LDA.W MotherBrainHealthBasedPalettes_BackLeg,Y                       ;ADE424;
    TAY                                                                  ;ADE427;
    LDX.W #$0162                                                         ;ADE428;
    LDA.W #$000F                                                         ;ADE42B;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADE42E;
    PLB                                                                  ;ADE432;
    RTL                                                                  ;ADE433;


MotherBrainBodyRainbowBeamPalette_Pointers:
    dw MotherBrainBodyRainbowBeamPalette_0                               ;ADE434;
    dw MotherBrainBodyRainbowBeamPalette_1                               ;ADE436;
    dw MotherBrainBodyRainbowBeamPalette_2                               ;ADE438;
    dw MotherBrainBodyRainbowBeamPalette_3                               ;ADE43A;
    dw MotherBrainBodyRainbowBeamPalette_4                               ;ADE43C;
    dw MotherBrainBodyRainbowBeamPalette_5                               ;ADE43E;

MotherBrainPhase2DeathBeforeGreyPalette_Pointers:
    dw MotherBrainBodyRainbowBeamPalette_6                               ;ADE440; shared with MotherBrainBodyRainbowBeamPalette_Pointers
    dw MotherBrainBodyRainbowBeamPalette_7                               ;ADE442;
    dw MotherBrainBodyRainbowBeamPalette_8                               ;ADE444;
    dw MotherBrainBodyRainbowBeamPalette_9                               ;ADE446;
    dw $0000                                                             ;ADE448;

MotherBrainBodyRainbowBeamPalette_0:
    dw $047F,$0479,$0033,$002D,$3A3B,$2DB7,$1D33,$0C8E                   ;ADE44A;
    dw $25BF,$1D5B,$14F7,$0CB2,$086E,$56BF,$000A,$0450                   ;ADE45A;
    dw $044D,$002A,$0027,$1D2E,$18EC,$10AA,$0847,$14F0                   ;ADE46A;
    dw $10AE,$0C8C,$0869,$0447,$2D70,$0005                               ;ADE47A;

MotherBrainBodyRainbowBeamPalette_1:
    dw $051F,$04F9,$00D3,$00AD,$3ABB,$2E37,$1DB3,$0D2E                   ;ADE486;
    dw $263F,$1DFB,$1597,$0D52,$08EE,$573F,$00AA,$0490                   ;ADE496;
    dw $048D,$006A,$0067,$1D6E,$192C,$10EA,$08A7,$1530                   ;ADE4A6;
    dw $110E,$0CCC,$08A9,$0487,$2DB0,$0065                               ;ADE4B6;

MotherBrainBodyRainbowBeamPalette_2:
    dw $05DF,$05B9,$0193,$016D,$3B7B,$2EF7,$1E73,$0DCE                   ;ADE4C2;
    dw $26FF,$1E9B,$1657,$0E12,$09AE,$57FF,$014A,$04F0                   ;ADE4D2;
    dw $04ED,$00CA,$00C7,$1DCE,$198C,$114A,$08E7,$1590                   ;ADE4E2;
    dw $114E,$0D2C,$0909,$04E7,$2E10,$00A5                               ;ADE4F2;

MotherBrainBodyRainbowBeamPalette_3:
    dw $05D5,$05AF,$0189,$0163,$3B71,$2EED,$1E69,$0DC4                   ;ADE4FE;
    dw $26F5,$1E91,$164D,$0E08,$09A4,$57F5,$0140,$04EB                   ;ADE50E;
    dw $04E8,$00C5,$00C2,$1DC9,$1987,$1145,$08E2,$158B                   ;ADE51E;
    dw $1149,$0D27,$0904,$04E2,$2E0B,$00A0                               ;ADE52E;

MotherBrainBodyRainbowBeamPalette_4:
    dw $0D95,$0D6F,$0949,$0923,$4331,$36AD,$2629,$1584                   ;ADE53A;
    dw $2EB5,$2651,$1E0D,$15C8,$1164,$5FB5,$0900,$08CB                   ;ADE54A;
    dw $08C8,$04A5,$04A2,$21A9,$1D67,$1525,$0CC2,$196B                   ;ADE55A;
    dw $1529,$1107,$0CE4,$08C2,$31EB,$0480                               ;ADE56A;

MotherBrainBodyRainbowBeamPalette_5:
    dw $1915,$190F,$18C9,$18C3,$52D1,$424D,$35C9,$2524                   ;ADE576;
    dw $3A55,$31F1,$2D8D,$2548,$2104,$6B55,$18A0,$0C8B                   ;ADE586;
    dw $0C88,$0C65,$0C62,$2969,$2127,$1CE5,$14A2,$1D2B                   ;ADE596;
    dw $1909,$18C7,$14A4,$1082,$35AB,$0C60                               ;ADE5A6;

MotherBrainBodyRainbowBeamPalette_6:
    dw $2C75,$2C6F,$2829,$2823,$6231,$55AD,$4929,$3884                   ;ADE5B2;
    dw $4DB5,$4551,$40ED,$38A8,$3064,$7EB5,$2800,$184B                   ;ADE5C2;
    dw $1848,$1425,$1422,$3129,$2CE7,$24A5,$1C42,$28EB                   ;ADE5D2;
    dw $24A9,$2087,$1C64,$1842,$416B,$1400                               ;ADE5E2;

MotherBrainBodyRainbowBeamPalette_7:
    dw $2C9A,$2C74,$284E,$2828,$6236,$55B2,$492E,$3889                   ;ADE5EE;
    dw $4DBA,$4556,$4112,$38CD,$3069,$7EBA,$2805,$184D                   ;ADE5FE;
    dw $184A,$1427,$1424,$312B,$2CE9,$24A7,$1C45,$28ED                   ;ADE60E;
    dw $24AB,$2089,$1C67,$1845,$416D,$1403                               ;ADE61E;

MotherBrainBodyRainbowBeamPalette_8:
    dw $2C7F,$2C79,$2833,$282D,$623B,$55B7,$4933,$388E                   ;ADE62A;
    dw $4DBF,$455B,$40F7,$38B2,$306E,$7EBF,$280A,$1850                   ;ADE63A;
    dw $184D,$142A,$1427,$312E,$2CEC,$24AA,$1C47,$28F0                   ;ADE64A;
    dw $24AE,$208C,$1C69,$1847,$4170,$1405                               ;ADE65A;

MotherBrainBodyRainbowBeamPalette_9:
    dw $187F,$1879,$1433,$142D,$4E3B,$41B7,$3133,$208E                   ;ADE666;
    dw $39BF,$315B,$28F7,$20B2,$1C6E,$6ABF,$140A,$0C50                   ;ADE676;
    dw $0C4D,$0C2A,$0C27,$292E,$20EC,$18AA,$1047,$1CF0                   ;ADE686;
    dw $18AE,$148C,$1069,$1047,$3570,$0C05                               ;ADE696;

MotherBrainHealthBasedPalettes_BrainBody:
    dw MotherBrainHealthBasedPalettes_BrainBody_0                        ;ADE6A2;
    dw MotherBrainHealthBasedPalettes_BrainBody_1                        ;ADE6A4;
    dw MotherBrainHealthBasedPalettes_BrainBody_2                        ;ADE6A6;
    dw MotherBrainHealthBasedPalettes_BrainBody_3                        ;ADE6A8;
    dw UNUSED_MotherBrainHealthBasedPalettes_BrainBody_4_ADE724          ;ADE6AA;

MotherBrainHealthBasedPalettes_BrainBody_0:
    dw $269F,$0159,$004C,$0004,$5739,$4273,$2DAD,$14C6                   ;ADE6AC;
    dw $367F,$29F9,$2173,$150C,$0C86,$7FFF,$0000                         ;ADE6BC;

MotherBrainHealthBasedPalettes_BrainBody_1:
    dw $225F,$0139,$002D,$0005,$4EF9,$3E33,$298E,$10A7                   ;ADE6CA;
    dw $323F,$25D9,$1D53,$10ED,$0867,$77BF,$0002                         ;ADE6DA;

MotherBrainHealthBasedPalettes_BrainBody_2:
    dw $1E1F,$011A,$002F,$0009,$429A,$31F5,$2150,$108B                   ;ADE6E8;
    dw $29FF,$219A,$1915,$10CF,$086B,$631F,$0006                         ;ADE6F8;

MotherBrainHealthBasedPalettes_BrainBody_3:
    dw $159F,$00DB,$0033,$000E,$31FB,$2577,$18F4,$0C70                   ;ADE706;
    dw $1D7F,$193B,$10D7,$0C93,$0450,$4A5F,$000C                         ;ADE716;

UNUSED_MotherBrainHealthBasedPalettes_BrainBody_4_ADE724:
    dw $159F,$00DB,$0033,$000E,$31FB,$2577,$18F4,$0C70                   ;ADE724;
    dw $1D7F,$193B,$10D7,$0C93,$0450,$4A5F,$000C                         ;ADE734;

MotherBrainHealthBasedPalettes_BackLeg:
    dw MotherBrainHealthBasedPalettes_BackLeg_0                          ;ADE742;
    dw MotherBrainHealthBasedPalettes_BackLeg_1                          ;ADE744;
    dw MotherBrainHealthBasedPalettes_BackLeg_2                          ;ADE746;
    dw MotherBrainHealthBasedPalettes_BackLeg_3                          ;ADE748;
    dw UNUSED_MotherBrainHealthBasedPalettes_BackLeg_4_ADE7C4            ;ADE74A;

MotherBrainHealthBasedPalettes_BackLeg_0:
    dw $0000,$0000,$0000,$0024,$29AD,$214A,$14E7,$0C63                   ;ADE74C;
    dw $0000,$0000,$0000,$0000,$0000,$29AD,$0000                         ;ADE75C;

MotherBrainHealthBasedPalettes_BackLeg_1:
    dw $0004,$0004,$0004,$0007,$216F,$1D0C,$10CA,$0846                   ;ADE76A;
    dw $0004,$0004,$0004,$0004,$0004,$216F,$0004                         ;ADE77A;

MotherBrainHealthBasedPalettes_BackLeg_2:
    dw $0008,$0008,$0008,$000B,$1D31,$14EF,$0CAD,$084A                   ;ADE788;
    dw $0008,$0008,$0008,$0008,$0008,$1D31,$0008                         ;ADE798;

MotherBrainHealthBasedPalettes_BackLeg_3:
    dw $000E,$000E,$000E,$0010,$14F5,$10B3,$0872,$0430                   ;ADE7A6;
    dw $000E,$000E,$000E,$000E,$000E,$14F5,$000E                         ;ADE7B6;

UNUSED_MotherBrainHealthBasedPalettes_BackLeg_4_ADE7C4:
    dw $000E,$000E,$000E,$0010,$14F5,$10B3,$0872,$0430                   ;ADE7C4;
    dw $000E,$000E,$000E,$000E,$000E,$14F5,$000E                         ;ADE7D4;

BabyMetroidHealthBasedPalette_Shell:
    dw UNUSED_BabyMetroidHealthBasedPalette_Shell_0_ADE7F2               ;ADE7E2;
    dw BabyMetroidHealthBasedPalette_Shell_1                             ;ADE7E4;
    dw BabyMetroidHealthBasedPalette_Shell_2                             ;ADE7E6;
    dw BabyMetroidHealthBasedPalette_Shell_3                             ;ADE7E8;
    dw BabyMetroidHealthBasedPalette_Shell_4                             ;ADE7EA;
    dw BabyMetroidHealthBasedPalette_Shell_5                             ;ADE7EC;
    dw BabyMetroidHealthBasedPalette_Shell_6                             ;ADE7EE;
    dw BabyMetroidHealthBasedPalette_Shell_7                             ;ADE7F0;

UNUSED_BabyMetroidHealthBasedPalette_Shell_0_ADE7F2:
    dw $57B8,$0B11,$1646,$00E3,$4F9F,$3ED8,$2E12,$08CD                   ;ADE7F2;
    dw $7FFF                                                             ;ADE802;

BabyMetroidHealthBasedPalette_Shell_1:
    dw $4FB8,$0B12,$1227,$00E4,$4B7E,$3AB7,$29F1,$08CD                   ;ADE804;
    dw $7BFF                                                             ;ADE814;

BabyMetroidHealthBasedPalette_Shell_2:
    dw $47B9,$0AF2,$1228,$00E4,$473C,$3A96,$29F1,$08AC                   ;ADE816;
    dw $73FF                                                             ;ADE826;

BabyMetroidHealthBasedPalette_Shell_3:
    dw $3FB9,$0AF3,$0E09,$00E5,$431B,$3675,$25D0,$08AC                   ;ADE828;
    dw $6FFF                                                             ;ADE838;

BabyMetroidHealthBasedPalette_Shell_4:
    dw $3399,$06F3,$0E09,$00E5,$42FA,$3254,$25AF,$04AB                   ;ADE83A;
    dw $67DE                                                             ;ADE84A;

BabyMetroidHealthBasedPalette_Shell_5:
    dw $2B99,$06F4,$09EA,$00E6,$3ED9,$2E33,$218E,$04AB                   ;ADE84C;
    dw $63DE                                                             ;ADE85C;

BabyMetroidHealthBasedPalette_Shell_6:
    dw $239A,$06D4,$09EB,$00E6,$3A97,$2E12,$218E,$048A                   ;ADE85E;
    dw $5BDE                                                             ;ADE86E;

BabyMetroidHealthBasedPalette_Shell_7:
    dw $1B9A,$06D5,$05CC,$00E7,$3676,$29F1,$1D6D,$048A                   ;ADE870;
    dw $57DE                                                             ;ADE880;

BabyMetroidHealthBasedPalette_Innards:
    dw UNUSED_BabyMetroidHealthBasedPalette_Innards_0_ADE892             ;ADE882;
    dw BabyMetroidHealthBasedPalette_Innards_1                           ;ADE884;
    dw BabyMetroidHealthBasedPalette_Innards_2                           ;ADE886;
    dw BabyMetroidHealthBasedPalette_Innards_3                           ;ADE888;
    dw BabyMetroidHealthBasedPalette_Innards_4                           ;ADE88A;
    dw BabyMetroidHealthBasedPalette_Innards_5                           ;ADE88C;
    dw BabyMetroidHealthBasedPalette_Innards_6                           ;ADE88E;
    dw BabyMetroidHealthBasedPalette_Innards_7                           ;ADE890;

UNUSED_BabyMetroidHealthBasedPalette_Innards_0_ADE892:
    dw $72FF,$2CDF,$24B9,$1CAF,$18A9                                     ;ADE892;

BabyMetroidHealthBasedPalette_Innards_1:
    dw $6EBD,$2CDD,$28B7,$20AE,$18A8                                     ;ADE89C;

BabyMetroidHealthBasedPalette_Innards_2:
    dw $6A9B,$30BB,$2896,$208D,$1488                                     ;ADE8A6;

BabyMetroidHealthBasedPalette_Innards_3:
    dw $6659,$30B9,$2C94,$248C,$1487                                     ;ADE8B0;

BabyMetroidHealthBasedPalette_Innards_4:
    dw $6636,$3496,$2C92,$288B,$1066                                     ;ADE8BA;

BabyMetroidHealthBasedPalette_Innards_5:
    dw $61F4,$3494,$3090,$2C8A,$1065                                     ;ADE8C4;

BabyMetroidHealthBasedPalette_Innards_6:
    dw $5DD2,$3872,$306F,$2C69,$0C45                                     ;ADE8CE;

BabyMetroidHealthBasedPalette_Innards_7:
    dw $5990,$3870,$346D,$3068,$0C44                                     ;ADE8D8;

BabyMetroidFadingToBlackPalettes:
    dw UNUSED_BabyMetroidFadingToBlackPalettes_0_ADE8F0                  ;ADE8E2;
    dw BabyMetroidFadingToBlackPalettes_1                                ;ADE8E4;
    dw BabyMetroidFadingToBlackPalettes_2                                ;ADE8E6;
    dw BabyMetroidFadingToBlackPalettes_3                                ;ADE8E8;
    dw BabyMetroidFadingToBlackPalettes_4                                ;ADE8EA;
    dw BabyMetroidFadingToBlackPalettes_5                                ;ADE8EC;
    dw BabyMetroidFadingToBlackPalettes_6                                ;ADE8EE;

UNUSED_BabyMetroidFadingToBlackPalettes_0_ADE8F0:
    dw $1716,$0252,$018A,$00C6,$494D,$304D,$2C4B,$2846                   ;ADE8F0;
    dw $0823,$2E12,$218E,$192B,$0068,$4B39                               ;ADE900;

BabyMetroidFadingToBlackPalettes_1:
    dw $1292,$01EF,$0148,$00A5,$3D0B,$284B,$2449,$2045                   ;ADE90C;
    dw $0822,$25AF,$1D4C,$14E9,$0047,$3EB5                               ;ADE91C;

BabyMetroidFadingToBlackPalettes_2:
    dw $0E0E,$018C,$0106,$0084,$30C9,$2029,$1C27,$1824                   ;ADE928;
    dw $0422,$1D4C,$1509,$10C7,$0045,$3231                               ;ADE938;

BabyMetroidFadingToBlackPalettes_3:
    dw $098B,$0129,$00C5,$0063,$24A6,$1826,$1425,$1423                   ;ADE944;
    dw $0401,$1509,$10C7,$0C85,$0024,$258C                               ;ADE954;

BabyMetroidFadingToBlackPalettes_4:
    dw $0507,$00C6,$0083,$0042,$1864,$1004,$0C03,$0C02                   ;ADE960;
    dw $0001,$0CA6,$0884,$0863,$0022,$1908                               ;ADE970;

BabyMetroidFadingToBlackPalettes_5:
    dw $0083,$0063,$0041,$0021,$0C22,$0802,$0401,$0401                   ;ADE97C;
    dw $0000,$0443,$0442,$0421,$0001,$0C84                               ;ADE98C;

BabyMetroidFadingToBlackPalettes_6:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;ADE998;
    dw $0000,$0000,$0000,$0000,$0000,$0000                               ;ADE9A8;

FadeMotherBrainPaletteToBlack:
    ASL A                                                                ;ADE9B4;
    TAX                                                                  ;ADE9B5;
    LDA.L .pointers,X                                                    ;ADE9B6;
    BNE .notZero                                                         ;ADE9BA;
    SEC                                                                  ;ADE9BC;
    RTL                                                                  ;ADE9BD;


.notZero:
    PHB                                                                  ;ADE9BE;
    PEA.W $AD00                                                          ;ADE9BF;
    PLB                                                                  ;ADE9C2;
    PLB                                                                  ;ADE9C3;
    TAY                                                                  ;ADE9C4;
    PHY                                                                  ;ADE9C5;
    LDX.W #$0082                                                         ;ADE9C6;
    LDA.W #$000E                                                         ;ADE9C9;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADE9CC;
    PLY                                                                  ;ADE9D0;
    LDX.W #$0122                                                         ;ADE9D1;
    LDA.W #$000E                                                         ;ADE9D4;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADE9D7;
    LDX.W #$0162                                                         ;ADE9DB;
    LDA.W #$000E                                                         ;ADE9DE;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADE9E1;
    PLB                                                                  ;ADE9E5;
    CLC                                                                  ;ADE9E6;
    RTL                                                                  ;ADE9E7;


.pointers:
    dw .pallete0                                                         ;ADE9E8;
    dw .pallete1                                                         ;ADE9EA;
    dw .pallete2                                                         ;ADE9EC;
    dw .pallete3                                                         ;ADE9EE;
    dw .pallete4                                                         ;ADE9F0;
    dw .pallete5                                                         ;ADE9F2;
    dw .pallete6                                                         ;ADE9F4;
    dw .pallete7                                                         ;ADE9F6;
    dw .pallete8                                                         ;ADE9F8;
    dw .pallete9                                                         ;ADE9FA;
    dw .palleteA                                                         ;ADE9FC;
    dw .palleteB                                                         ;ADE9FE;
    dw .palleteC                                                         ;ADEA00;
    dw .palleteD                                                         ;ADEA02;
    dw .palleteE                                                         ;ADEA04;
    dw .palleteF                                                         ;ADEA06;
    dw $0000                                                             ;ADEA08;

.pallete0:
    dw $159F,$00DB,$0033,$000E,$31FB,$2577,$18F4,$0C70                   ;ADEA0A;
    dw $1D7F,$193B,$10D7,$0C93,$0450,$4A5F,$000E,$000E                   ;ADEA1A;
    dw $000E,$0010,$14F5,$10B3,$0872,$0430,$000E,$000E                   ;ADEA2A;
    dw $000E,$000E,$000E,$14F5                                           ;ADEA3A;

.pallete1:
    dw $117D,$00B9,$0031,$000D,$2DD9,$2155,$14D2,$084F                   ;ADEA42;
    dw $195D,$1519,$0CB5,$0871,$042F,$421D,$000D,$000D                   ;ADEA52;
    dw $000D,$000F,$10D3,$0C91,$0450,$042F,$000D,$000D                   ;ADEA62;
    dw $000D,$000D,$000D,$10D3                                           ;ADEA72;

.pallete2:
    dw $115A,$00B7,$0010,$000C,$29B7,$1D34,$14D1,$084D                   ;ADEA7A;
    dw $193A,$14F7,$0CB4,$0870,$002D,$3DFA,$000C,$000C                   ;ADEA8A;
    dw $000C,$000D,$10D2,$0C90,$044F,$000D,$000C,$000C                   ;ADEA9A;
    dw $000C,$000C,$000C,$10D2                                           ;ADEAAA;

.pallete3:
    dw $1138,$0095,$000F,$000B,$2595,$1D12,$10B0,$084C                   ;ADEAB2;
    dw $1518,$10F5,$0C92,$086F,$002C,$39D8,$000B,$000B                   ;ADEAC2;
    dw $000B,$000C,$10B0,$0C8F,$044E,$000C,$000B,$000B                   ;ADEAD2;
    dw $000B,$000B,$000B,$10B0                                           ;ADEAE2;

.pallete4:
    dw $0D16,$0093,$000E,$000A,$2173,$1910,$10AE,$084B                   ;ADEAEA;
    dw $1516,$10D3,$0C90,$086E,$002B,$35B6,$000A,$000A                   ;ADEAFA;
    dw $000A,$000B,$0CAF,$0C6E,$044D,$000B,$000A,$000A                   ;ADEB0A;
    dw $000A,$000A,$000A,$0CAF                                           ;ADEB1A;

.pallete5:
    dw $0D14,$0092,$000C,$0009,$2152,$18EF,$108D,$084A                   ;ADEB22;
    dw $10F4,$10D2,$088F,$084C,$002A,$3194,$0009,$0009                   ;ADEB32;
    dw $0009,$000A,$0C8E,$086C,$044C,$000A,$0009,$0009                   ;ADEB42;
    dw $0009,$0009,$0009,$0C8E                                           ;ADEB52;

.pallete6:
    dw $0CF2,$0070,$000B,$0008,$1D30,$14CD,$0C8C,$0429                   ;ADEB5A;
    dw $10D2,$0CB0,$086D,$044B,$0029,$2952,$0008,$0008                   ;ADEB6A;
    dw $0008,$0009,$0C8C,$086B,$042A,$0009,$0008,$0008                   ;ADEB7A;
    dw $0008,$0008,$0008,$0C8C                                           ;ADEB8A;

.pallete7:
    dw $08D0,$006E,$000A,$0007,$190E,$10AC,$0C6A,$0428                   ;ADEB92;
    dw $0CB0,$0C8E,$086C,$044A,$0028,$2530,$0007,$0007                   ;ADEBA2;
    dw $0007,$0008,$086B,$084A,$0429,$0008,$0007,$0007                   ;ADEBB2;
    dw $0007,$0007,$0007,$086B                                           ;ADEBC2;

.pallete8:
    dw $08AE,$004C,$0008,$0006,$14EC,$10AA,$0869,$0427                   ;ADEBCA;
    dw $0CAE,$088C,$044A,$0428,$0027,$210E,$0006,$0006                   ;ADEBDA;
    dw $0006,$0007,$0869,$0448,$0428,$0007,$0006,$0006                   ;ADEBEA;
    dw $0006,$0006,$0006,$0869                                           ;ADEBFA;

.pallete9:
    dw $088C,$004A,$0007,$0005,$10CA,$0C89,$0848,$0426                   ;ADEC02;
    dw $088C,$086A,$0449,$0427,$0006,$1CEC,$0005,$0005                   ;ADEC12;
    dw $0005,$0006,$0848,$0447,$0027,$0006,$0005,$0005                   ;ADEC22;
    dw $0005,$0005,$0005,$0848                                           ;ADEC32;

.palleteA:
    dw $048A,$0049,$0006,$0004,$10A9,$0C67,$0846,$0425                   ;ADEC3A;
    dw $086A,$0869,$0447,$0426,$0005,$18CA,$0004,$0004                   ;ADEC4A;
    dw $0004,$0005,$0447,$0426,$0026,$0005,$0004,$0004                   ;ADEC5A;
    dw $0004,$0004,$0004,$0447                                           ;ADEC6A;

.palleteB:
    dw $0468,$0027,$0005,$0003,$0C87,$0866,$0425,$0004                   ;ADEC72;
    dw $0468,$0447,$0426,$0025,$0004,$1088,$0003,$0003                   ;ADEC82;
    dw $0003,$0004,$0425,$0425,$0004,$0004,$0003,$0003                   ;ADEC92;
    dw $0003,$0003,$0003,$0425                                           ;ADECA2;

.palleteC:
    dw $0446,$0025,$0003,$0002,$0865,$0444,$0424,$0003                   ;ADECAA;
    dw $0446,$0425,$0024,$0003,$0003,$0C66,$0002,$0002                   ;ADECBA;
    dw $0002,$0003,$0424,$0023,$0003,$0003,$0002,$0002                   ;ADECCA;
    dw $0002,$0002,$0002,$0424                                           ;ADECDA;

.palleteD:
    dw $0024,$0003,$0002,$0001,$0443,$0423,$0022,$0002                   ;ADECE2;
    dw $0424,$0023,$0003,$0002,$0002,$0844,$0001,$0001                   ;ADECF2;
    dw $0001,$0002,$0022,$0002,$0002,$0002,$0001,$0001                   ;ADED02;
    dw $0001,$0001,$0001,$0022                                           ;ADED12;

.palleteE:
    dw $0002,$0001,$0001,$0001,$0021,$0001,$0001,$0001                   ;ADED1A;
    dw $0002,$0001,$0001,$0001,$0001,$0422,$0001,$0001                   ;ADED2A;
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001                   ;ADED3A;
    dw $0001,$0001,$0001,$0001                                           ;ADED4A;

.palleteF:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;ADED52;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;ADED62;
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;ADED72;
    dw $0000,$0000,$0000,$0000                                           ;ADED82;

MotherBrainPalettes_TransitionToGrey:
    dw MotherBrainPalettes_TransitionToFromGrey_0                        ;ADED8A;
    dw MotherBrainPalettes_TransitionToFromGrey_1                        ;ADED8C;
    dw MotherBrainPalettes_TransitionToFromGrey_2                        ;ADED8E;
    dw MotherBrainPalettes_TransitionToFromGrey_3                        ;ADED90;
    dw MotherBrainPalettes_TransitionToFromGrey_4                        ;ADED92;
    dw MotherBrainPalettes_TransitionToFromGrey_5                        ;ADED94;
    dw MotherBrainPalettes_TransitionToFromGrey_6                        ;ADED96;
    dw MotherBrainPalettes_TransitionToFromGrey_7                        ;ADED98;
    dw $0000                                                             ;ADED9A;

MotherBrainPalettes_TransitionFromGrey:
    dw MotherBrainPalettes_TransitionToFromGrey_7                        ;ADED9C;
    dw MotherBrainPalettes_TransitionToFromGrey_6                        ;ADED9E;
    dw MotherBrainPalettes_TransitionToFromGrey_5                        ;ADEDA0;
    dw MotherBrainPalettes_TransitionToFromGrey_4                        ;ADEDA2;
    dw MotherBrainPalettes_TransitionToFromGrey_3                        ;ADEDA4;
    dw MotherBrainPalettes_TransitionToFromGrey_2                        ;ADEDA6;
    dw MotherBrainPalettes_TransitionToFromGrey_1                        ;ADEDA8;
    dw MotherBrainPalettes_TransitionToFromGrey_0                        ;ADEDAA;
    dw $0000                                                             ;ADEDAC;

MotherBrainPalettes_TransitionToFromGrey_0:
    dw $269F,$0159,$004C,$0004,$5739,$4273,$2DAD,$14C6                   ;ADEDAE;
    dw $367F,$29F9,$2173,$150C,$0C86,$0024,$29AD,$214A                   ;ADEDBE;
    dw $14E7,$0C63,$29AD                                                 ;ADEDCE;

MotherBrainPalettes_TransitionToFromGrey_1:
    dw $2ABE,$0978,$046C,$0024,$5739,$4273,$2DAD,$14C6                   ;ADEDD4;
    dw $3A9E,$2E18,$2593,$192C,$0CA6,$0024,$258C,$1D29                   ;ADEDE4;
    dw $14E7,$0C63,$258C                                                 ;ADEDF4;

MotherBrainPalettes_TransitionToFromGrey_2:
    dw $32BD,$1197,$08AC,$0424,$5739,$4273,$2DAD,$14C6                   ;ADEDFA;
    dw $3EBD,$3238,$25B2,$194C,$10C7,$0023,$256B,$1D29                   ;ADEE0A;
    dw $10C6,$0C63,$256B                                                 ;ADEE1A;

MotherBrainPalettes_TransitionToFromGrey_3:
    dw $36DC,$19B6,$0CCC,$0444,$5739,$4273,$2DAD,$14C6                   ;ADEE20;
    dw $42DC,$3657,$29D2,$1D6C,$10E7,$0023,$214A,$1908                   ;ADEE30;
    dw $10C6,$0C63,$214A                                                 ;ADEE40;

MotherBrainPalettes_TransitionToFromGrey_4:
    dw $3EFB,$21F5,$150B,$0865,$5739,$4273,$2DAD,$14C6                   ;ADEE46;
    dw $42DB,$3656,$2DD2,$216D,$14E8,$0023,$1D4A,$18E7                   ;ADEE56;
    dw $10A5,$0842,$1D4A                                                 ;ADEE66;

MotherBrainPalettes_TransitionToFromGrey_5:
    dw $431A,$2A14,$192B,$0885,$5739,$4273,$2DAD,$14C6                   ;ADEE6C;
    dw $46FA,$3A75,$3211,$258D,$1508,$0023,$1929,$14C6                   ;ADEE7C;
    dw $10A5,$0842,$1929                                                 ;ADEE8C;

MotherBrainPalettes_TransitionToFromGrey_6:
    dw $4B19,$3233,$1D6B,$0C85,$5739,$4273,$2DAD,$14C6                   ;ADEE92;
    dw $4B19,$3E95,$3211,$25AD,$1929,$0022,$1908,$14C6                   ;ADEEA2;
    dw $0C84,$0842,$1908                                                 ;ADEEB2;

MotherBrainPalettes_TransitionToFromGrey_7:
    dw $4F38,$3A52,$218B,$0CA5,$5739,$4273,$2DAD,$14C6                   ;ADEEB8;
    dw $4F38,$42B4,$3631,$29CD,$1949,$0022,$14E7,$10A5                   ;ADEEC8;
    dw $0C84,$0842,$14E7                                                 ;ADEED8;

TransitionMotherBrainPaletteToGrey_FakeDeath:
    PHX                                                                  ;ADEEDE;
    ASL A                                                                ;ADEEDF;
    TAX                                                                  ;ADEEE0;
    LDA.L MotherBrainPalettes_TransitionToGrey,X                         ;ADEEE1;
    BNE TransitionMotherBrainPaletteToFromGrey_FakeDeath                 ;ADEEE5;
    PLX                                                                  ;ADEEE7;
    SEC                                                                  ;ADEEE8;
    RTL                                                                  ;ADEEE9;


TransitionMotherBrainPaletteFromGrey_FakeDeath:
    PHX                                                                  ;ADEEEA;
    ASL A                                                                ;ADEEEB;
    TAX                                                                  ;ADEEEC;
    LDA.L MotherBrainPalettes_TransitionFromGrey,X                       ;ADEEED;
    BNE TransitionMotherBrainPaletteToFromGrey_FakeDeath                 ;ADEEF1;
    PLX                                                                  ;ADEEF3;
    SEC                                                                  ;ADEEF4;
    RTL                                                                  ;ADEEF5;


TransitionMotherBrainPaletteToFromGrey_FakeDeath:
    PHY                                                                  ;ADEEF6;
    PHB                                                                  ;ADEEF7;
    PEA.W $AD00                                                          ;ADEEF8;
    PLB                                                                  ;ADEEFB;
    PLB                                                                  ;ADEEFC;
    TAY                                                                  ;ADEEFD;
    LDX.W #$0122                                                         ;ADEEFE;
    LDA.W #$0003                                                         ;ADEF01;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADEF04;
    PLB                                                                  ;ADEF08;
    PLY                                                                  ;ADEF09;
    PLX                                                                  ;ADEF0A;
    CLC                                                                  ;ADEF0B;
    RTL                                                                  ;ADEF0C;


TransitionMotherBrainPaletteFromGrey_DrainedByBabyMetroid:
    ASL A                                                                ;ADEF0D;
    TAX                                                                  ;ADEF0E;
    LDA.L MotherBrainPalettes_TransitionFromGrey,X                       ;ADEF0F;
    BNE .notZero                                                         ;ADEF13;
    SEC                                                                  ;ADEF15;
    RTL                                                                  ;ADEF16;


.notZero:
    PHB                                                                  ;ADEF17;
    PEA.W $AD00                                                          ;ADEF18;
    PLB                                                                  ;ADEF1B;
    PLB                                                                  ;ADEF1C;
    TAY                                                                  ;ADEF1D;
    PHY                                                                  ;ADEF1E;
    LDX.W #$0082                                                         ;ADEF1F;
    LDA.W #$000D                                                         ;ADEF22;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADEF25;
    PLY                                                                  ;ADEF29;
    LDX.W #$0122                                                         ;ADEF2A;
    LDA.W #$000D                                                         ;ADEF2D;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADEF30;
    LDX.W #$0168                                                         ;ADEF34;
    LDA.W #$0005                                                         ;ADEF37;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADEF3A;
    LDX.W #$017C                                                         ;ADEF3E;
    LDA.W $0000,Y                                                        ;ADEF41;
    STA.W $0000,X                                                        ;ADEF44;
    PLB                                                                  ;ADEF47;
    CLC                                                                  ;ADEF48;
    RTL                                                                  ;ADEF49;


TransitionMotherBrainPaletteToGrey_DrainedByBabyMetroid:
    ASL A                                                                ;ADEF4A;
    TAX                                                                  ;ADEF4B;
    LDA.L .pointers,X                                                    ;ADEF4C;
    BNE .notZero                                                         ;ADEF50;
    SEC                                                                  ;ADEF52;
    RTL                                                                  ;ADEF53;


.notZero:
    PHB                                                                  ;ADEF54;
    PEA.W $AD00                                                          ;ADEF55;
    PLB                                                                  ;ADEF58;
    PLB                                                                  ;ADEF59;
    TAY                                                                  ;ADEF5A;
    PHY                                                                  ;ADEF5B;
    LDX.W #$0082                                                         ;ADEF5C;
    LDA.W #$000F                                                         ;ADEF5F;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADEF62;
    PLY                                                                  ;ADEF66;
    LDX.W #$0122                                                         ;ADEF67;
    LDA.W #$000F                                                         ;ADEF6A;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADEF6D;
    LDX.W #$0168                                                         ;ADEF71;
    LDA.W #$0005                                                         ;ADEF74;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADEF77;
    LDX.W #$017C                                                         ;ADEF7B;
    LDA.W $0000,Y                                                        ;ADEF7E;
    STA.W $0000,X                                                        ;ADEF81;
    PLB                                                                  ;ADEF84;
    CLC                                                                  ;ADEF85;
    RTL                                                                  ;ADEF86;


.pointers:
    dw .palette0                                                         ;ADEF87;
    dw .palette1                                                         ;ADEF89;
    dw .palette2                                                         ;ADEF8B;
    dw .palette3                                                         ;ADEF8D;
    dw .palette4                                                         ;ADEF8F;
    dw .palette5                                                         ;ADEF91;
    dw .palette6                                                         ;ADEF93;
    dw .palette7                                                         ;ADEF95;
    dw $0000                                                             ;ADEF97;

.palette0:
    dw $2C75,$2C6F,$2829,$2823,$6231,$55AD,$4929,$3884                   ;ADEF99;
    dw $4DB5,$4551,$40ED,$38A8,$3064,$7EB5,$2800,$1422                   ;ADEFA9;
    dw $3129,$2CE7,$24A5,$1C42,$416B                                     ;ADEFB9;

.palette1:
    dw $30D5,$2CAF,$2869,$2443,$6252,$51CE,$454A,$3484                   ;ADEFC3;
    dw $4DF5,$4591,$410E,$34C9,$2C85,$7ED6,$2400,$1022                   ;ADEFD3;
    dw $2D29,$28E7,$20A5,$1842,$394A                                     ;ADEFE3;

.palette2:
    dw $3536,$30F0,$248A,$2044,$5E73,$51EF,$414A,$2CA5                   ;ADEFED;
    dw $4E16,$45B2,$3D4E,$3509,$28A5,$7F18,$1C00,$1022                   ;ADEFFD;
    dw $2908,$24C6,$1CA5,$1842,$354A                                     ;ADF00D;

.palette3:
    dw $3996,$3130,$24CA,$1C64,$5E94,$4E10,$3D6B,$28A5                   ;ADF017;
    dw $4E56,$45F2,$3D6F,$312A,$24C6,$7F39,$1800,$0C22                   ;ADF027;
    dw $2508,$20C6,$18A5,$1442,$2D29                                     ;ADF037;

.palette4:
    dw $4217,$3591,$24EA,$1864,$5AD6,$4A10,$396B,$24A5                   ;ADF041;
    dw $4E97,$4213,$39AF,$314B,$24E7,$7F7B,$1000,$0822                   ;ADF051;
    dw $2108,$1CC6,$1884,$1042,$2929                                     ;ADF061;

.palette5:
    dw $4677,$35D1,$252A,$1484,$5AF7,$4631,$358C,$20A5                   ;ADF06B;
    dw $4ED7,$4253,$39D0,$2D6C,$2108,$7F9C,$0C00,$0422                   ;ADF07B;
    dw $1D08,$18C6,$1484,$0C42,$2108                                     ;ADF08B;

.palette6:
    dw $4AD8,$3A12,$214B,$1085,$5718,$4652,$318C,$18C6                   ;ADF095;
    dw $4EF8,$4274,$3610,$2DAC,$1D28,$7FDE,$0400,$0422                   ;ADF0A5;
    dw $18E7,$14A5,$1084,$0C42,$1D08                                     ;ADF0B5;

.palette7:
    dw $4F38,$3A52,$218B,$0CA5,$5739,$4273,$2DAD,$14C6                   ;ADF0BF;
    dw $4F38,$42B4,$3631,$29CD,$1949,$7FFF,$0000,$0022                   ;ADF0CF;
    dw $14E7,$10A5,$0C84,$0842,$14E7                                     ;ADF0DF;

TransitionMotherBrainPaletteToGrey_RealDeath:
    ASL A                                                                ;ADF0E9;
    TAX                                                                  ;ADF0EA;
    LDA.L .pointers,X                                                    ;ADF0EB;
    BNE .notZero                                                         ;ADF0EF;
    SEC                                                                  ;ADF0F1;
    RTL                                                                  ;ADF0F2;


.notZero:
    PHB                                                                  ;ADF0F3;
    PEA.W $AD00                                                          ;ADF0F4;
    PLB                                                                  ;ADF0F7;
    PLB                                                                  ;ADF0F8;
    TAY                                                                  ;ADF0F9;
    LDX.W #$01E2                                                         ;ADF0FA;
    LDA.W #$000F                                                         ;ADF0FD;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADF100;
    PLB                                                                  ;ADF104;
    CLC                                                                  ;ADF105;
    RTL                                                                  ;ADF106;


.pointers:
    dw .palette0                                                         ;ADF107;
    dw .palette1                                                         ;ADF109;
    dw .palette2                                                         ;ADF10B;
    dw .palette3                                                         ;ADF10D;
    dw .palette4                                                         ;ADF10F;
    dw .palette5                                                         ;ADF111;
    dw .palette6                                                         ;ADF113;
    dw .palette7                                                         ;ADF115;
    dw $0000                                                             ;ADF117;

.palette0:
    dw $159F,$00DB,$0033,$000E,$31FB,$2577,$18F4,$0C70                   ;ADF119;
    dw $1D7F,$193B,$10D7,$0C93,$0450,$4A5F,$000C                         ;ADF129;

.palette1:
    dw $1DDE,$091A,$0472,$002D,$361B,$2996,$1D13,$0C6F                   ;ADF137;
    dw $25BE,$1D7A,$1516,$10B2,$086F,$529F,$000A                         ;ADF147;

.palette2:
    dw $261D,$1138,$0891,$042B,$3E5A,$2DB6,$1D32,$108D                   ;ADF155;
    dw $29FD,$2599,$1D35,$14F1,$088E,$5ADF,$0009                         ;ADF165;

.palette3:
    dw $2E5C,$1977,$0CD0,$044A,$427A,$31D5,$2151,$108C                   ;ADF173;
    dw $323C,$29D8,$2174,$1910,$0CAD,$631F,$0007                         ;ADF183;

.palette4:
    dw $367B,$21B6,$14EE,$0869,$46BA,$3615,$2550,$10AA                   ;ADF191;
    dw $3A7B,$3217,$2594,$1D50,$10EC,$673F,$0005                         ;ADF1A1;

.palette5:
    dw $3EBA,$29F5,$192D,$0888,$4ADA,$3A34,$296F,$10A9                   ;ADF1AF;
    dw $42BA,$3656,$29D3,$216F,$150B,$6F7F,$0003                         ;ADF1BF;

.palette6:
    dw $46F9,$3213,$1D4C,$0C86,$5319,$3E54,$298E,$14C7                   ;ADF1CD;
    dw $46F9,$3E75,$31F2,$25AE,$152A,$77BF,$0002                         ;ADF1DD;

.palette7:
    dw $4F38,$3A52,$218B,$0CA5,$5739,$4273,$2DAD,$14C6                   ;ADF1EB;
    dw $4F38,$42B4,$3631,$29CD,$1949,$7FFF,$0000                         ;ADF1FB;

FadeOutBackgroundForBabyMetroidDeathSequence:
    PHB                                                                  ;ADF209;
    PEA.W $AD00                                                          ;ADF20A;
    PLB                                                                  ;ADF20D;
    PLB                                                                  ;ADF20E;
    PHX                                                                  ;ADF20F;
    PHY                                                                  ;ADF210;
    LDY.W #.justZeroes                                                   ;ADF211;
    LDX.W #$0062                                                         ;ADF214;
    LDA.W #$000E                                                         ;ADF217;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADF21A;
    LDY.W #.justZeroes                                                   ;ADF21E;
    LDX.W #$00A2                                                         ;ADF221;
    LDA.W #$000E                                                         ;ADF224;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADF227;
    PLY                                                                  ;ADF22B;
    PLX                                                                  ;ADF22C;
    PLB                                                                  ;ADF22D;
    RTL                                                                  ;ADF22E;


.justZeroes:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000                   ;ADF22F;
    dw $0000,$0000,$0000,$0000,$0000,$0000                               ;ADF23F;

FadeInBackgroundForMotherBrainPhase3:
    ASL A                                                                ;ADF24B;
    TAX                                                                  ;ADF24C;
    LDA.L .pointers,X                                                    ;ADF24D;
    BNE .notZero                                                         ;ADF251;
    SEC                                                                  ;ADF253;
    RTL                                                                  ;ADF254;


.notZero:
    PHB                                                                  ;ADF255;
    PEA.W $AD00                                                          ;ADF256;
    PLB                                                                  ;ADF259;
    PLB                                                                  ;ADF25A;
    TAY                                                                  ;ADF25B;
    LDX.W #$0062                                                         ;ADF25C;
    LDA.W #$000E                                                         ;ADF25F;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADF262;
    LDX.W #$00A2                                                         ;ADF266;
    LDA.W #$000E                                                         ;ADF269;
    JSL.L WriteAColorsFromYtoColorIndexX                                 ;ADF26C;
    PLB                                                                  ;ADF270;
    CLC                                                                  ;ADF271;
    RTL                                                                  ;ADF272;


.pointers:
    dw .palette6                                                         ;ADF273;
    dw .palette5                                                         ;ADF275;
    dw .palette4                                                         ;ADF277;
    dw .palette3                                                         ;ADF279;
    dw .palette2                                                         ;ADF27B;
    dw .palette1                                                         ;ADF27D;
    dw .palette0                                                         ;ADF27F;
    dw $0000                                                             ;ADF281;

.palette0:
    dw $72B2,$71C7,$4463,$4A16,$3991,$2D2C,$1CA7,$20E5                   ;ADF283;
    dw $18A4,$1083,$0841,$0000,$0000,$02DF,$6318,$6318                   ;ADF293;
    dw $0802,$5294,$39CE,$2108,$1084,$0019,$0012,$5C00                   ;ADF2A3;
    dw $4000,$1084,$197F,$7FFF                                           ;ADF2B3;

.palette1:
    dw $624F,$6186,$3842,$3DB2,$314E,$24EA,$1886,$18C4                   ;ADF2BB;
    dw $1483,$0C62,$0420,$0000,$0000,$025A,$5294,$5294                   ;ADF2CB;
    dw $0401,$4631,$318C,$18C6,$0C63,$0015,$000F,$4C00                   ;ADF2DB;
    dw $3400,$0C63,$153A,$6B5A                                           ;ADF2EB;

.palette2:
    dw $51EC,$5145,$3042,$316F,$290C,$1CC8,$1465,$14A3                   ;ADF2F3;
    dw $1062,$0842,$0420,$0000,$0000,$01F6,$4631,$4631                   ;ADF303;
    dw $0401,$39CE,$294A,$14A5,$0842,$0011,$000C,$4000                   ;ADF313;
    dw $2C00,$0842,$10F6,$5AD6                                           ;ADF323;

.palette3:
    dw $418A,$4104,$2421,$292C,$20C9,$18A6,$1044,$1082                   ;ADF32B;
    dw $0C42,$0841,$0420,$0000,$0000,$0191,$35AD,$35AD                   ;ADF33B;
    dw $0401,$2D6B,$2108,$1084,$0842,$000E,$000A,$3400                   ;ADF34B;
    dw $2400,$0842,$0CD1,$4631                                           ;ADF35B;

.palette4:
    dw $3127,$30C3,$1C21,$1CC9,$18A7,$1065,$0C43,$0C62                   ;ADF363;
    dw $0841,$0421,$0000,$0000,$0000,$012D,$294A,$294A                   ;ADF373;
    dw $0000,$2108,$18C6,$0C63,$0421,$000A,$0007,$2400                   ;ADF383;
    dw $1800,$0421,$088D,$35AD                                           ;ADF393;

.palette5:
    dw $20C5,$2082,$1000,$1486,$1064,$0C43,$0822,$0841                   ;ADF39B;
    dw $0421,$0420,$0000,$0000,$0000,$00C8,$18C6,$18C6                   ;ADF3AB;
    dw $0000,$14A5,$1084,$0842,$0421,$0007,$0005,$1800                   ;ADF3BB;
    dw $1000,$0421,$0468,$2108                                           ;ADF3CB;

.palette6:
    dw $1062,$1041,$0800,$0843,$0822,$0421,$0401,$0420                   ;ADF3D3;
    dw $0000,$0000,$0000,$0000,$0000,$0064,$0C63,$0C63                   ;ADF3E3;
    dw $0000,$0842,$0842,$0421,$0000,$0003,$0002,$0C00                   ;ADF3F3;
    dw $0800,$0000,$0024,$1084                                           ;ADF403;

EnableEarthquakeTypeInAFor20Frames:
    STA.W $183E                                                          ;ADF40B;
    LDA.W #$0014                                                         ;ADF40E;
    STA.W $1840                                                          ;ADF411;
    LDA.W #$0025                                                         ;ADF414;
    JSL.L QueueSound_Lib2_Max6                                           ;ADF417;
    RTL                                                                  ;ADF41B;


HandleMotherBrainBodyFlickering:
    LDA.W $0FA4                                                          ;ADF41C;
    LSR A                                                                ;ADF41F;
    BCC .invisible                                                       ;ADF420;
    LDA.B $69                                                            ;ADF422;
    ORA.W #$0002                                                         ;ADF424;
    STA.B $69                                                            ;ADF427;
    LDA.W $0F86                                                          ;ADF429;
    AND.W #$FEFF                                                         ;ADF42C;
    STA.W $0F86                                                          ;ADF42F;
    RTL                                                                  ;ADF432;


.invisible:
    LDA.B $69                                                            ;ADF433;
    AND.W #$FFFD                                                         ;ADF435;
    STA.B $69                                                            ;ADF438;
    LDA.W $0F86                                                          ;ADF43A;
    ORA.W #$0100                                                         ;ADF43D;
    STA.W $0F86                                                          ;ADF440;
    RTL                                                                  ;ADF443;


Freespace_BankAD_F444:                                                   ;ADF444;
; $BBC bytes
