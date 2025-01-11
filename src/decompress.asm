Decompression_HardcodedDestination:
    LDA.B $02,S                                                          ;80B0FF;
    STA.B $45                                                            ;80B101;
    LDA.B $01,S                                                          ;80B103;
    STA.B $44                                                            ;80B105;
    CLC                                                                  ;80B107;
    ADC.W #$0003                                                         ;80B108;
    STA.B $01,S                                                          ;80B10B;
    LDY.W #$0001                                                         ;80B10D;
    LDA.B [$44],Y                                                        ;80B110;
    STA.B $4C                                                            ;80B112;
    INY                                                                  ;80B114;
    LDA.B [$44],Y                                                        ;80B115;
    STA.B $4D                                                            ;80B117;

Decompression_VariableDestination:
    PHP                                                                  ;80B119;
    PHB                                                                  ;80B11A;
    SEP #$20                                                             ;80B11B;
    REP #$10                                                             ;80B11D;
    LDA.B $49                                                            ;80B11F;
    PHA                                                                  ;80B121;
    PLB                                                                  ;80B122;
    STZ.B $50                                                            ;80B123;
    LDY.W #$0000                                                         ;80B125;

.loopMain:
    PHX                                                                  ;80B128;
    LDX.B $47                                                            ;80B129;
    LDA.W $0000,X                                                        ;80B12B;
    INX                                                                  ;80B12E;
    BNE +                                                                ;80B12F;
    JSR.W SourceBankOverflowCorrection                                   ;80B131;

  + STX.B $47                                                            ;80B134;
    PLX                                                                  ;80B136;
    STA.B $4A                                                            ;80B137;
    CMP.B #$FF                                                           ;80B139;
    BNE +                                                                ;80B13B;
    PLB                                                                  ;80B13D;
    PLP                                                                  ;80B13E;
    RTL                                                                  ;80B13F;


  + AND.B #$E0                                                           ;80B140;
    CMP.B #$E0                                                           ;80B142;
    BNE .pushCommandBits                                                 ;80B144;
    LDA.B $4A                                                            ;80B146;
    ASL A                                                                ;80B148;
    ASL A                                                                ;80B149;
    ASL A                                                                ;80B14A;
    AND.B #$E0                                                           ;80B14B;
    PHA                                                                  ;80B14D;
    LDA.B $4A                                                            ;80B14E;
    AND.B #$03                                                           ;80B150;
    XBA                                                                  ;80B152;
    PHX                                                                  ;80B153;
    LDX.B $47                                                            ;80B154;
    LDA.W $0000,X                                                        ;80B156;
    INX                                                                  ;80B159;
    BNE +                                                                ;80B15A;
    JSR.W SourceBankOverflowCorrection                                   ;80B15C;

  + STX.B $47                                                            ;80B15F;
    PLX                                                                  ;80B161;
    BRA +                                                                ;80B162;


.pushCommandBits:
    PHA                                                                  ;80B164;
    LDA.B #$00                                                           ;80B165;
    XBA                                                                  ;80B167;
    LDA.B $4A                                                            ;80B168;
    AND.B #$1F                                                           ;80B16A;

  + TAX                                                                  ;80B16C;
    INX                                                                  ;80B16D;
    PLA                                                                  ;80B16E;
    CMP.B #$00                                                           ;80B16F;
    BPL +                                                                ;80B171;
    JMP.W .dictionaryVariant                                             ;80B173;


  + CMP.B #$20                                                           ;80B176;
    BEQ .byteFill                                                        ;80B178;
    CMP.B #$40                                                           ;80B17A;
    BEQ .wordFill                                                        ;80B17C;
    CMP.B #$60                                                           ;80B17E;
    BEQ .incrementingFill                                                ;80B180;

.loopDirectCopy:
    PHX                                                                  ;80B182;
    LDX.B $47                                                            ;80B183;
    LDA.W $0000,X                                                        ;80B185;
    INX                                                                  ;80B188;
    BNE +                                                                ;80B189;
    JSR.W SourceBankOverflowCorrection                                   ;80B18B;

  + STX.B $47                                                            ;80B18E;
    PLX                                                                  ;80B190;
    STA.B [$4C],Y                                                        ;80B191;
    INY                                                                  ;80B193;
    DEX                                                                  ;80B194;
    BNE .loopDirectCopy                                                  ;80B195;
    BEQ .loopMain                                                        ;80B197;

.byteFill:
    PHX                                                                  ;80B199;
    LDX.B $47                                                            ;80B19A;
    LDA.W $0000,X                                                        ;80B19C;
    INX                                                                  ;80B19F;
    BNE +                                                                ;80B1A0;
    JSR.W SourceBankOverflowCorrection                                   ;80B1A2;

  + STX.B $47                                                            ;80B1A5;
    PLX                                                                  ;80B1A7;

.loopByteFill:
    STA.B [$4C],Y                                                        ;80B1A8;
    INY                                                                  ;80B1AA;
    DEX                                                                  ;80B1AB;
    BNE .loopByteFill                                                    ;80B1AC;
    JMP.W .loopMain                                                      ;80B1AE;


.wordFill:
    PHX                                                                  ;80B1B1;
    LDX.B $47                                                            ;80B1B2;
    LDA.W $0000,X                                                        ;80B1B4;
    INX                                                                  ;80B1B7;
    BNE +                                                                ;80B1B8;
    JSR.W SourceBankOverflowCorrection                                   ;80B1BA;

  + STX.B $47                                                            ;80B1BD;
    PLX                                                                  ;80B1BF;
    STA.B $4A                                                            ;80B1C0;
    PHX                                                                  ;80B1C2;
    LDX.B $47                                                            ;80B1C3;
    LDA.W $0000,X                                                        ;80B1C5;
    INX                                                                  ;80B1C8;
    BNE +                                                                ;80B1C9;
    JSR.W SourceBankOverflowCorrection                                   ;80B1CB;

  + STX.B $47                                                            ;80B1CE;
    PLX                                                                  ;80B1D0;
    STA.B $4B                                                            ;80B1D1;

.loopWordFill:
    LDA.B $4A                                                            ;80B1D3;
    STA.B [$4C],Y                                                        ;80B1D5;
    INY                                                                  ;80B1D7;
    DEX                                                                  ;80B1D8;
    BEQ .goto_loopMain                                                   ;80B1D9;
    LDA.B $4B                                                            ;80B1DB;
    STA.B [$4C],Y                                                        ;80B1DD;
    INY                                                                  ;80B1DF;
    DEX                                                                  ;80B1E0;
    BNE .loopWordFill                                                    ;80B1E1;

.goto_loopMain:
    JMP.W .loopMain                                                      ;80B1E3;


.incrementingFill:
    PHX                                                                  ;80B1E6;
    LDX.B $47                                                            ;80B1E7;
    LDA.W $0000,X                                                        ;80B1E9;
    INX                                                                  ;80B1EC;
    BNE +                                                                ;80B1ED;
    JSR.W SourceBankOverflowCorrection                                   ;80B1EF;

  + STX.B $47                                                            ;80B1F2;
    PLX                                                                  ;80B1F4;

.loopIncrementingFill:
    STA.B [$4C],Y                                                        ;80B1F5;
    INC A                                                                ;80B1F7;
    INY                                                                  ;80B1F8;
    DEX                                                                  ;80B1F9;
    BNE .loopIncrementingFill                                            ;80B1FA;
    JMP.W .loopMain                                                      ;80B1FC;


.dictionaryVariant:
    CMP.B #$C0                                                           ;80B1FF;
    BCS .slidingDictionary                                               ;80B201;
    AND.B #$20                                                           ;80B203;
    STA.B $4F                                                            ;80B205;
    PHX                                                                  ;80B207;
    LDX.B $47                                                            ;80B208;
    LDA.W $0000,X                                                        ;80B20A;
    INX                                                                  ;80B20D;
    BNE +                                                                ;80B20E;
    JSR.W SourceBankOverflowCorrection                                   ;80B210;

  + STX.B $47                                                            ;80B213;
    PLX                                                                  ;80B215;
    STA.B $4A                                                            ;80B216;
    PHX                                                                  ;80B218;
    LDX.B $47                                                            ;80B219;
    LDA.W $0000,X                                                        ;80B21B;
    INX                                                                  ;80B21E;
    BNE +                                                                ;80B21F;
    JSR.W SourceBankOverflowCorrection                                   ;80B221;

  + STX.B $47                                                            ;80B224;
    PLX                                                                  ;80B226;
    STA.B $4B                                                            ;80B227;

.dictionaryCopy:
    SEP #$20                                                             ;80B229;

.loopDictionaryCopy:
    PHX                                                                  ;80B22B;
    PHY                                                                  ;80B22C;
    LDY.B $4A                                                            ;80B22D;
    LDA.B [$4C],Y                                                        ;80B22F;
    INY                                                                  ;80B231;
    STY.B $4A                                                            ;80B232;
    PLY                                                                  ;80B234;
    LDX.B $4F                                                            ;80B235;
    BEQ +                                                                ;80B237;
    EOR.B #$FF                                                           ;80B239;

  + STA.B [$4C],Y                                                        ;80B23B;
    INY                                                                  ;80B23D;
    PLX                                                                  ;80B23E;
    DEX                                                                  ;80B23F;
    BNE .loopDictionaryCopy                                              ;80B240;
    JMP.W .loopMain                                                      ;80B242;


.slidingDictionary:
    AND.B #$20                                                           ;80B245;
    STA.B $4F                                                            ;80B247;
    PHX                                                                  ;80B249;
    LDX.B $47                                                            ;80B24A;
    LDA.W $0000,X                                                        ;80B24C;
    INX                                                                  ;80B24F;
    BNE +                                                                ;80B250;
    JSR.W SourceBankOverflowCorrection                                   ;80B252;

  + STX.B $47                                                            ;80B255;
    PLX                                                                  ;80B257;
    STA.B $4A                                                            ;80B258;
    STZ.B $4B                                                            ;80B25A;
    REP #$20                                                             ;80B25C;
    TYA                                                                  ;80B25E;
    SEC                                                                  ;80B25F;
    SBC.B $4A                                                            ;80B260;
    STA.B $4A                                                            ;80B262;
    BRA .dictionaryCopy                                                  ;80B264;


SourceBankOverflowCorrection:
    LDX.W #$8000                                                         ;80B266;
    PHA                                                                  ;80B269;
    PHB                                                                  ;80B26A;
    PLA                                                                  ;80B26B;
    INC A                                                                ;80B26C;
    PHA                                                                  ;80B26D;
    PLB                                                                  ;80B26E;
    PLA                                                                  ;80B26F;
    RTS                                                                  ;80B270;


DecompressionToVRAM:
    PHP                                                                  ;80B271;
    PHB                                                                  ;80B272;
    REP #$10                                                             ;80B273;
    SEP #$20                                                             ;80B275;
    LDA.B $49                                                            ;80B277;
    PHA                                                                  ;80B279;
    PLB                                                                  ;80B27A;
    STZ.B $50                                                            ;80B27B;
    LDY.B $4C                                                            ;80B27D;

.loopMain:
    PHX                                                                  ;80B27F;
    LDX.B $47                                                            ;80B280;
    LDA.W $0000,X                                                        ;80B282;
    INX                                                                  ;80B285;
    BNE +                                                                ;80B286;
    JSR.W SourceBankOverflowCorrection                                   ;80B288;

  + STX.B $47                                                            ;80B28B;
    PLX                                                                  ;80B28D;
    STA.B $4A                                                            ;80B28E;
    CMP.B #$FF                                                           ;80B290;
    BNE +                                                                ;80B292;
    PLB                                                                  ;80B294;
    PLP                                                                  ;80B295;
    RTL                                                                  ;80B296;


  + AND.B #$E0                                                           ;80B297;
    CMP.B #$E0                                                           ;80B299;
    BNE .pushCommandBits                                                 ;80B29B;
    LDA.B $4A                                                            ;80B29D;
    ASL A                                                                ;80B29F;
    ASL A                                                                ;80B2A0;
    ASL A                                                                ;80B2A1;
    AND.B #$E0                                                           ;80B2A2;
    PHA                                                                  ;80B2A4;
    LDA.B $4A                                                            ;80B2A5;
    AND.B #$03                                                           ;80B2A7;
    XBA                                                                  ;80B2A9;
    PHX                                                                  ;80B2AA;
    LDX.B $47                                                            ;80B2AB;
    LDA.W $0000,X                                                        ;80B2AD;
    INX                                                                  ;80B2B0;
    BNE +                                                                ;80B2B1;
    JSR.W SourceBankOverflowCorrection                                   ;80B2B3;

  + STX.B $47                                                            ;80B2B6;
    PLX                                                                  ;80B2B8;
    BRA +                                                                ;80B2B9;


.pushCommandBits:
    PHA                                                                  ;80B2BB;
    LDA.B #$00                                                           ;80B2BC;
    XBA                                                                  ;80B2BE;
    LDA.B $4A                                                            ;80B2BF;
    AND.B #$1F                                                           ;80B2C1;

  + TAX                                                                  ;80B2C3;
    INX                                                                  ;80B2C4;
    PLA                                                                  ;80B2C5;
    CMP.B #$00                                                           ;80B2C6;
    BPL +                                                                ;80B2C8;
    JMP.W .dictionaryVariant                                             ;80B2CA;


  + CMP.B #$20                                                           ;80B2CD;
    BEQ .byteFill                                                        ;80B2CF;
    CMP.B #$40                                                           ;80B2D1;
    BEQ .wordFill                                                        ;80B2D3;
    CMP.B #$60                                                           ;80B2D5;
    BNE .loopDirectCopy                                                  ;80B2D7;
    JMP.W .incrementingFill                                              ;80B2D9;


.loopDirectCopy:
    PHX                                                                  ;80B2DC;
    LDX.B $47                                                            ;80B2DD;
    LDA.W $0000,X                                                        ;80B2DF;
    INX                                                                  ;80B2E2;
    BNE +                                                                ;80B2E3;
    JSR.W SourceBankOverflowCorrection                                   ;80B2E5;

  + STX.B $47                                                            ;80B2E8;
    PLX                                                                  ;80B2EA;
    PHA                                                                  ;80B2EB;
    TYA                                                                  ;80B2EC;
    LSR A                                                                ;80B2ED;
    PLA                                                                  ;80B2EE;
    BCS .VRAMDataWriteLow                                                ;80B2EF;
    STA.L $002118                                                        ;80B2F1;
    BRA .VRAMDataWriteHigh                                               ;80B2F5;


.VRAMDataWriteLow:
    STA.L $002119                                                        ;80B2F7;

.VRAMDataWriteHigh:
    INY                                                                  ;80B2FB;
    DEX                                                                  ;80B2FC;
    BNE .loopDirectCopy                                                  ;80B2FD;
    JMP.W .loopMain                                                      ;80B2FF;


.byteFill:
    PHX                                                                  ;80B302;
    LDX.B $47                                                            ;80B303;
    LDA.W $0000,X                                                        ;80B305;
    INX                                                                  ;80B308;
    BNE +                                                                ;80B309;
    JSR.W SourceBankOverflowCorrection                                   ;80B30B;

  + STX.B $47                                                            ;80B30E;
    PLX                                                                  ;80B310;

.loopByteFill:
    PHA                                                                  ;80B311;
    TYA                                                                  ;80B312;
    LSR A                                                                ;80B313;
    PLA                                                                  ;80B314;
    BCS ..writeHigh                                                      ;80B315;
    STA.L $002118                                                        ;80B317;
    BRA ..writeLow                                                       ;80B31B;


..writeHigh:
    STA.L $002119                                                        ;80B31D;

..writeLow:
    INY                                                                  ;80B321;
    DEX                                                                  ;80B322;
    BNE .loopByteFill                                                    ;80B323;
    JMP.W .loopMain                                                      ;80B325;


.wordFill:
    PHX                                                                  ;80B328;
    LDX.B $47                                                            ;80B329;
    LDA.W $0000,X                                                        ;80B32B;
    INX                                                                  ;80B32E;
    BNE +                                                                ;80B32F;
    JSR.W SourceBankOverflowCorrection                                   ;80B331;

  + STX.B $47                                                            ;80B334;
    PLX                                                                  ;80B336;
    STA.B $4A                                                            ;80B337;
    PHX                                                                  ;80B339;
    LDX.B $47                                                            ;80B33A;
    LDA.W $0000,X                                                        ;80B33C;
    INX                                                                  ;80B33F;
    BNE +                                                                ;80B340;
    JSR.W SourceBankOverflowCorrection                                   ;80B342;

  + STX.B $47                                                            ;80B345;
    PLX                                                                  ;80B347;
    STA.B $4B                                                            ;80B348;

.loopWordFill:
    LDA.B $4A                                                            ;80B34A;
    PHA                                                                  ;80B34C;
    TYA                                                                  ;80B34D;
    LSR A                                                                ;80B34E;
    PLA                                                                  ;80B34F;
    BCS ..writeHigh                                                      ;80B350;
    STA.L $002118                                                        ;80B352;
    BRA ..writeLow                                                       ;80B356;


..writeHigh:
    STA.L $002119                                                        ;80B358;

..writeLow:
    INY                                                                  ;80B35C;
    DEX                                                                  ;80B35D;
    BEQ .goto_loopMain                                                   ;80B35E;
    LDA.B $4B                                                            ;80B360;
    PHA                                                                  ;80B362;
    TYA                                                                  ;80B363;
    LSR A                                                                ;80B364;
    PLA                                                                  ;80B365;
    BCS ..writeHigh2                                                     ;80B366;
    STA.L $002118                                                        ;80B368;
    BRA .writeLow2                                                       ;80B36C;


..writeHigh2:
    STA.L $002119                                                        ;80B36E;

.writeLow2:
    INY                                                                  ;80B372;
    DEX                                                                  ;80B373;
    BNE .loopWordFill                                                    ;80B374;

.goto_loopMain:
    JMP.W .loopMain                                                      ;80B376;


.incrementingFill:
    PHX                                                                  ;80B379;
    LDX.B $47                                                            ;80B37A;
    LDA.W $0000,X                                                        ;80B37C;
    INX                                                                  ;80B37F;
    BNE +                                                                ;80B380;
    JSR.W SourceBankOverflowCorrection                                   ;80B382;

  + STX.B $47                                                            ;80B385;
    PLX                                                                  ;80B387;

.loopIncrementingFill:
    PHA                                                                  ;80B388;
    TYA                                                                  ;80B389;
    LSR A                                                                ;80B38A;
    PLA                                                                  ;80B38B;
    BCS ..writeHigh                                                      ;80B38C;
    STA.L $002118                                                        ;80B38E;
    BRA ..writeLow                                                       ;80B392;


..writeHigh:
    STA.L $002119                                                        ;80B394;

..writeLow:
    INY                                                                  ;80B398;
    INC A                                                                ;80B399;
    DEX                                                                  ;80B39A;
    BNE .loopIncrementingFill                                            ;80B39B;
    JMP.W .loopMain                                                      ;80B39D;


.dictionaryVariant:
    CMP.B #$C0                                                           ;80B3A0;
    BCS .slidingDictionary                                               ;80B3A2;
    AND.B #$20                                                           ;80B3A4;
    STA.B $4F                                                            ;80B3A6;
    PHX                                                                  ;80B3A8;
    LDX.B $47                                                            ;80B3A9;
    LDA.W $0000,X                                                        ;80B3AB;
    INX                                                                  ;80B3AE;
    BNE +                                                                ;80B3AF;
    JSR.W SourceBankOverflowCorrection                                   ;80B3B1;

  + STX.B $47                                                            ;80B3B4;
    PLX                                                                  ;80B3B6;
    STA.B $4A                                                            ;80B3B7;
    PHX                                                                  ;80B3B9;
    LDX.B $47                                                            ;80B3BA;
    LDA.W $0000,X                                                        ;80B3BC;
    INX                                                                  ;80B3BF;
    BNE +                                                                ;80B3C0;
    JSR.W SourceBankOverflowCorrection                                   ;80B3C2;

  + STX.B $47                                                            ;80B3C5;
    PLX                                                                  ;80B3C7;
    STA.B $4B                                                            ;80B3C8;
    REP #$20                                                             ;80B3CA;
    LDA.B $4C                                                            ;80B3CC;
    CLC                                                                  ;80B3CE;
    ADC.B $4A                                                            ;80B3CF;
    STA.B $4A                                                            ;80B3D1;

.loopDictionaryCopy:
    PHX                                                                  ;80B3D3;
    REP #$20                                                             ;80B3D4;
    LDA.B $4A                                                            ;80B3D6;
    LSR A                                                                ;80B3D8;
    STA.L $002116                                                        ;80B3D9;
    LDA.L $002139                                                        ;80B3DD;
    LDA.L $002139                                                        ;80B3E1;
    BCC +                                                                ;80B3E5;
    XBA                                                                  ;80B3E7;

  + INC.B $4A                                                            ;80B3E8;
    SEP #$20                                                             ;80B3EA;
    LDX.B $4F                                                            ;80B3EC;
    BEQ +                                                                ;80B3EE;
    EOR.B #$FF                                                           ;80B3F0;

  + PHA                                                                  ;80B3F2;
    REP #$20                                                             ;80B3F3;
    TYA                                                                  ;80B3F5;
    LSR A                                                                ;80B3F6;
    STA.L $002116                                                        ;80B3F7;
    SEP #$20                                                             ;80B3FB;
    PLA                                                                  ;80B3FD;
    PHA                                                                  ;80B3FE;
    TYA                                                                  ;80B3FF;
    LSR A                                                                ;80B400;
    PLA                                                                  ;80B401;
    BCS ..writeHigh                                                      ;80B402;
    STA.L $002118                                                        ;80B404;
    BRA ..writeLow                                                       ;80B408;


..writeHigh:
    STA.L $002119                                                        ;80B40A;

..writeLow:
    INY                                                                  ;80B40E;
    PLX                                                                  ;80B40F;
    DEX                                                                  ;80B410;
    BNE .loopDictionaryCopy                                              ;80B411;
    JMP.W .loopMain                                                      ;80B413;


.slidingDictionary:
    AND.B #$20                                                           ;80B416;
    STA.B $4F                                                            ;80B418;
    PHX                                                                  ;80B41A;
    LDX.B $47                                                            ;80B41B;
    LDA.W $0000,X                                                        ;80B41D;
    INX                                                                  ;80B420;
    BNE +                                                                ;80B421;
    JSR.W SourceBankOverflowCorrection                                   ;80B423;

  + STX.B $47                                                            ;80B426;
    PLX                                                                  ;80B428;
    STA.B $4A                                                            ;80B429;
    STZ.B $4B                                                            ;80B42B;
    REP #$20                                                             ;80B42D;
    TYA                                                                  ;80B42F;
    SEC                                                                  ;80B430;
    SBC.B $4A                                                            ;80B431;
    STA.B $4A                                                            ;80B433;
    BRA .loopDictionaryCopy                                              ;80B435;
