ProcessTimer:
    PHB                                                                  ;809DE7;
    PHK                                                                  ;809DE8;
    PLB                                                                  ;809DE9;
    PHX                                                                  ;809DEA;
    PHY                                                                  ;809DEB;
    LDA.W $0943                                                          ;809DEC;
    AND.W #$00FF                                                         ;809DEF;
    ASL A                                                                ;809DF2;
    TAX                                                                  ;809DF3;
    JSR.W (.pointers,X)                                                  ;809DF4;
    PLY                                                                  ;809DF7;
    PLX                                                                  ;809DF8;
    PLB                                                                  ;809DF9;
    RTL                                                                  ;809DFA;


.pointers:
    dw ProcessTimer_Inactive                                             ;809DFB;
    dw ProcessTimer_CeresStart                                           ;809DFD;
    dw ProcessTimer_MotherBrainStart                                     ;809DFF;
    dw ProcessTimer_InitialDelay                                         ;809E01;
    dw ProcessTimer_RunningMovementDelayed                               ;809E03;
    dw ProcessTimer_RunningMovingIntoPlace                               ;809E05;
    dw ProcessTimer_RunningMovingIntoPlace_return                        ;809E07;

ProcessTimer_CeresStart:
    JSL.L ClearTimerRAM                                                  ;809E09;
    LDA.W #$0100                                                         ;809E0D;
    JSL.L SetTimer                                                       ;809E10;
    LDA.W #$8003                                                         ;809E14;
    STA.W $0943                                                          ;809E17;

ProcessTimer_Inactive:
    CLC                                                                  ;809E1A;
    RTS                                                                  ;809E1B;


ProcessTimer_MotherBrainStart:
    JSL.L ClearTimerRAM                                                  ;809E1C;
    LDA.W #$0300                                                         ;809E20;
    JSL.L SetTimer                                                       ;809E23;
    LDA.W #$8003                                                         ;809E27;
    STA.W $0943                                                          ;809E2A;
    CLC                                                                  ;809E2D;
    RTS                                                                  ;809E2E;


ProcessTimer_InitialDelay:
    SEP #$20                                                             ;809E2F;
    INC.W $0948                                                          ;809E31;
    LDA.W $0948                                                          ;809E34;
    CMP.B #$10                                                           ;809E37;
    BCC .return                                                          ;809E39;
    INC.W $0943                                                          ;809E3B;

.return:
    REP #$21                                                             ;809E3E;
    RTS                                                                  ;809E40;


ProcessTimer_RunningMovementDelayed:
    SEP #$20                                                             ;809E41;
    INC.W $0948                                                          ;809E43;
    LDA.W $0948                                                          ;809E46;
    CMP.B #$60                                                           ;809E49;
    BCC .return                                                          ;809E4B;
    STZ.W $0948                                                          ;809E4D;
    INC.W $0943                                                          ;809E50;

.return:
    REP #$20                                                             ;809E53;
    JMP.W DecrementTimer                                                 ;809E55;


ProcessTimer_RunningMovingIntoPlace:
    LDY.W #$0000                                                         ;809E58;
    LDA.W #$00E0                                                         ;809E5B;
    CLC                                                                  ;809E5E;
    ADC.W $0948                                                          ;809E5F;
    CMP.W #$DC00                                                         ;809E62;
    BCC .XinPosition                                                     ;809E65;
    INY                                                                  ;809E67;
    LDA.W #$DC00                                                         ;809E68;

.XinPosition:
    STA.W $0948                                                          ;809E6B;
    LDA.W #$FF3F                                                         ;809E6E;
    CLC                                                                  ;809E71;
    ADC.W $094A                                                          ;809E72;
    CMP.W #$3000                                                         ;809E75;
    BCS .YinPosition                                                     ;809E78;
    INY                                                                  ;809E7A;
    LDA.W #$3000                                                         ;809E7B;

.YinPosition:
    STA.W $094A                                                          ;809E7E;
    CPY.W #$0002                                                         ;809E81;
    BNE ProcessTimer_RunningMovingIntoPlace_return                       ;809E84;
    INC.W $0943                                                          ;809E86;

ProcessTimer_RunningMovingIntoPlace_return:
    JMP.W DecrementTimer                                                 ;809E89;


SetTimer:
    STZ.W $0945                                                          ;809E8C;
    STA.W $0946                                                          ;809E8F;
    RTL                                                                  ;809E92;


ClearTimerRAM:
    LDA.W #$8000                                                         ;809E93;
    STA.W $0948                                                          ;809E96;
    LDA.W #$8000                                                         ;809E99;
    STA.W $094A                                                          ;809E9C;
    STZ.W $0945                                                          ;809E9F;
    STZ.W $0946                                                          ;809EA2;
    STZ.W $0943                                                          ;809EA5;
    RTL                                                                  ;809EA8;


DecrementTimer:
    SEP #$39                                                             ;809EA9; Set carry and decimal
    LDA.W $05B6                                                          ;809EAB;
    AND.B #$7F                                                           ;809EAE;
    TAX                                                                  ;809EB0;
    LDA.W $0945                                                          ;809EB1;
    SBC.W .centiseconds,X                                                ;809EB4;
    STA.W $0945                                                          ;809EB7;
    BCS .checkExpired                                                    ;809EBA;
    LDA.W $0946                                                          ;809EBC;
    SBC.B #$00                                                           ;809EBF;
    STA.W $0946                                                          ;809EC1;
    BCS .checkExpired                                                    ;809EC4;
    LDA.W $0947                                                          ;809EC6;
    SBC.B #$00                                                           ;809EC9;
    STA.W $0947                                                          ;809ECB;
    BCC .clearTimer                                                      ;809ECE;
    LDA.B #$59                                                           ;809ED0;
    STA.W $0946                                                          ;809ED2;
    BRA .checkExpired                                                    ;809ED5;


.clearTimer:
    STZ.W $0945                                                          ;809ED7;
    STZ.W $0946                                                          ;809EDA;
    STZ.W $0947                                                          ;809EDD;

.checkExpired:
    REP #$39                                                             ;809EE0;
    LDA.W $0945                                                          ;809EE2;
    ORA.W $0946                                                          ;809EE5;
    BNE .return                                                          ;809EE8;
    SEC                                                                  ;809EEA;

.return:
    RTS                                                                  ;809EEB;


.centiseconds:
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02   ;809EEC;
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02   ;809EFC;
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02   ;809F0C;
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02   ;809F1C;
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02   ;809F2C;
    db $01,$02,$02,$01,$02,$02,$01,$02,$01,$02,$02,$01,$02,$02,$01,$02   ;809F3C;
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02   ;809F4C;
    db $01,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02   ;809F5C;

DrawTimer:
    PHB                                                                  ;809F6C;
    PHK                                                                  ;809F6D;
    PLB                                                                  ;809F6E;
    LDY.W #Spritemap_Timer_TIME                                          ;809F6F;
    LDA.W #$0000                                                         ;809F72;
    JSR.W DrawTimerSpritemap                                             ;809F75;
    LDA.W $0947                                                          ;809F78;
    LDX.W #$FFE4                                                         ;809F7B;
    JSR.W DrawTwoTimerDigits                                             ;809F7E;
    LDA.W $0946                                                          ;809F81;
    LDX.W #$FFFC                                                         ;809F84;
    JSR.W DrawTwoTimerDigits                                             ;809F87;
    LDA.W $0945                                                          ;809F8A;
    LDX.W #$0014                                                         ;809F8D;
    JSR.W DrawTwoTimerDigits                                             ;809F90;
    PLB                                                                  ;809F93;
    RTL                                                                  ;809F94;


DrawTwoTimerDigits:
    PHX                                                                  ;809F95;
    PHA                                                                  ;809F96;
    AND.W #$00F0                                                         ;809F97;
    LSR A                                                                ;809F9A;
    LSR A                                                                ;809F9B;
    LSR A                                                                ;809F9C;
    TAX                                                                  ;809F9D;
    LDY.W TimerDigitsSpritemapPointers,X                                 ;809F9E;
    LDA.B $03,S                                                          ;809FA1;
    JSR.W DrawTimerSpritemap                                             ;809FA3;
    PLA                                                                  ;809FA6;
    AND.W #$000F                                                         ;809FA7;
    ASL A                                                                ;809FAA;
    TAX                                                                  ;809FAB;
    LDY.W TimerDigitsSpritemapPointers,X                                 ;809FAC;
    PLA                                                                  ;809FAF;
    ADC.W #$0008                                                         ;809FB0;

DrawTimerSpritemap:
    STA.B $14                                                            ;809FB3;
    LDA.W $0948                                                          ;809FB5;
    XBA                                                                  ;809FB8;
    AND.W #$00FF                                                         ;809FB9;
    CLC                                                                  ;809FBC;
    ADC.B $14                                                            ;809FBD;
    STA.B $14                                                            ;809FBF;
    LDA.W $094A                                                          ;809FC1;
    XBA                                                                  ;809FC4;
    AND.W #$00FF                                                         ;809FC5;
    STA.B $12                                                            ;809FC8;
    LDA.W #$0A00                                                         ;809FCA;
    STA.B $16                                                            ;809FCD;
    JSL.L AddSpritemapToOAM                                              ;809FCF;
    RTS                                                                  ;809FD3;


TimerDigitsSpritemapPointers:
    dw Spritemap_TimerDigits_0                                           ;809FD4;
    dw Spritemap_TimerDigits_1                                           ;809FD6;
    dw Spritemap_TimerDigits_2                                           ;809FD8;
    dw Spritemap_TimerDigits_3                                           ;809FDA;
    dw Spritemap_TimerDigits_4                                           ;809FDC;
    dw Spritemap_TimerDigits_5                                           ;809FDE;
    dw Spritemap_TimerDigits_6                                           ;809FE0;
    dw Spritemap_TimerDigits_7                                           ;809FE2;
    dw Spritemap_TimerDigits_8                                           ;809FE4;
    dw Spritemap_TimerDigits_9                                           ;809FE6;

Spritemap_TimerDigits_0:
    dw $0002                                                             ;809FE8;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EA)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E0)

Spritemap_TimerDigits_1:
    dw $0002                                                             ;809FF4;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EB)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E1)

Spritemap_TimerDigits_2:
    dw $0002                                                             ;80A000;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EC)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E2)

Spritemap_TimerDigits_3:
    dw $0002                                                             ;80A00C;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1ED)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E3)

Spritemap_TimerDigits_4:
    dw $0002                                                             ;80A018;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EE)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E4)

Spritemap_TimerDigits_5:
    dw $0002                                                             ;80A024;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1EF)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E5)

Spritemap_TimerDigits_6:
    dw $0002                                                             ;80A030;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1F0)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E6)

Spritemap_TimerDigits_7:
    dw $0002                                                             ;80A03C;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1F1)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E7)

Spritemap_TimerDigits_8:
    dw $0002                                                             ;80A048;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1F2)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E8)

Spritemap_TimerDigits_9:
    dw $0002                                                             ;80A054;
    %spritemapEntry(0, $1FC, $00, 0, 0, 3, 5, $1F3)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $1E9)

Spritemap_Timer_TIME:
    dw $0005                                                             ;80A060;
    %spritemapEntry(0, $1F0, $F0, 0, 0, 3, 5, $1F8)
    %spritemapEntry(0, $1E8, $F0, 0, 0, 3, 5, $1F7)
    %spritemapEntry(0, $1E0, $F0, 0, 0, 3, 5, $1F6)
    %spritemapEntry(0, $008, $F8, 0, 0, 3, 5, $1F5)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 5, $1F4)
