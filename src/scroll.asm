CalculateLayer2XPosition:
    PHP                                                                  ;80A2F9;
    LDY.W $0911                                                          ;80A2FA;
    SEP #$20                                                             ;80A2FD;
    LDA.W $091B                                                          ;80A2FF;
    BEQ .scrollReturn                                                    ;80A302;
    CMP.B #$01                                                           ;80A304;
    BEQ .return                                                          ;80A306;
    AND.B #$FE                                                           ;80A308;
    STA.W HW_WRMPYA                                                      ;80A30A;
    LDA.W $0911                                                          ;80A30D;
    STA.W HW_WRMPYB                                                      ;80A310;
    STZ.W $0934                                                          ;80A313;
    PHA                                                                  ;80A316;
    PLA                                                                  ;80A317;
    LDA.W $4217                                                          ;80A318;
    STA.W $0933                                                          ;80A31B;
    LDA.W $0912                                                          ;80A31E;
    STA.W HW_WRMPYB                                                      ;80A321;
    REP #$20                                                             ;80A324;
    LDA.W $0933                                                          ;80A326;
    CLC                                                                  ;80A329;
    ADC.W HW_RDMPY                                                       ;80A32A;
    TAY                                                                  ;80A32D;

.scrollReturn:
    REP #$20                                                             ;80A32E;
    TYA                                                                  ;80A330;
    STA.W $0917                                                          ;80A331;
    PLP                                                                  ;80A334;
    CLC                                                                  ;80A335;
    RTS                                                                  ;80A336;


.return:
    PLP                                                                  ;80A337;
    SEC                                                                  ;80A338;
    RTS                                                                  ;80A339;


CalculateLayer2YPosition:
    PHP                                                                  ;80A33A;
    LDY.W $0915                                                          ;80A33B;
    SEP #$20                                                             ;80A33E;
    LDA.W $091C                                                          ;80A340;
    BEQ .scrollReturn                                                    ;80A343;
    CMP.B #$01                                                           ;80A345;
    BEQ .return                                                          ;80A347;
    AND.B #$FE                                                           ;80A349;
    STA.W HW_WRMPYA                                                      ;80A34B;
    LDA.W $0915                                                          ;80A34E;
    STA.W HW_WRMPYB                                                      ;80A351;
    STZ.W $0934                                                          ;80A354;
    PHA                                                                  ;80A357;
    PLA                                                                  ;80A358;
    LDA.W $4217                                                          ;80A359;
    STA.W $0933                                                          ;80A35C;
    LDA.W $0916                                                          ;80A35F;
    STA.W HW_WRMPYB                                                      ;80A362;
    REP #$20                                                             ;80A365;
    LDA.W $0933                                                          ;80A367;
    CLC                                                                  ;80A36A;
    ADC.W HW_RDMPY                                                       ;80A36B;
    TAY                                                                  ;80A36E;

.scrollReturn:
    REP #$20                                                             ;80A36F;
    TYA                                                                  ;80A371;
    STA.W $0919                                                          ;80A372;
    PLP                                                                  ;80A375;
    CLC                                                                  ;80A376;
    RTS                                                                  ;80A377;


.return:
    PLP                                                                  ;80A378;
    SEC                                                                  ;80A379;
    RTS                                                                  ;80A37A;


CalculateBGScrolls:
    LDA.W $0911                                                          ;80A37B;
    CLC                                                                  ;80A37E;
    ADC.W $091D                                                          ;80A37F;
    STA.B $B1                                                            ;80A382;
    LDA.W $0915                                                          ;80A384;
    CLC                                                                  ;80A387;
    ADC.W $091F                                                          ;80A388;
    STA.B $B3                                                            ;80A38B;
    LDA.W $0917                                                          ;80A38D;
    CLC                                                                  ;80A390;
    ADC.W $0921                                                          ;80A391;
    STA.B $B5                                                            ;80A394;
    LDA.W $0919                                                          ;80A396;
    CLC                                                                  ;80A399;
    ADC.W $0923                                                          ;80A39A;
    STA.B $B7                                                            ;80A39D;
    RTS                                                                  ;80A39F;


CalculateBGScrolls_UpdateBGGraphics_WhenScrolling:
    PHP                                                                  ;80A3A0;
    PHB                                                                  ;80A3A1;
    PHK                                                                  ;80A3A2;
    PLB                                                                  ;80A3A3;
    REP #$30                                                             ;80A3A4;
    JSR.W CalculateBGScrolls                                             ;80A3A6;
    BRA UpdateBGGraphics_WhenScrolling                                   ;80A3A9;


Calc_Layer2Position_BGScrolls_UpdateBGGraphics_WhenScrolling:
    LDA.W $0A78                                                          ;80A3AB;
    BEQ .continue                                                        ;80A3AE;
    RTL                                                                  ;80A3B0;


.continue:
    PHP                                                                  ;80A3B1;
    PHB                                                                  ;80A3B2;
    PHK                                                                  ;80A3B3;
    PLB                                                                  ;80A3B4;
    REP #$30                                                             ;80A3B5;
    LDA.W $0911                                                          ;80A3B7;
    CLC                                                                  ;80A3BA;
    ADC.W $091D                                                          ;80A3BB;
    STA.B $B1                                                            ;80A3BE;
    LDA.W $0915                                                          ;80A3C0;
    CLC                                                                  ;80A3C3;
    ADC.W $091F                                                          ;80A3C4;
    STA.B $B3                                                            ;80A3C7;
    JSR.W CalculateLayer2XPosition                                       ;80A3C9;
    BCS .layer2Y                                                         ;80A3CC;
    CLC                                                                  ;80A3CE;
    ADC.W $0921                                                          ;80A3CF;
    STA.B $B5                                                            ;80A3D2;

.layer2Y:
    JSR.W CalculateLayer2YPosition                                       ;80A3D4;
    BCS UpdateBGGraphics_WhenScrolling                                   ;80A3D7;
    CLC                                                                  ;80A3D9;
    ADC.W $0923                                                          ;80A3DA;
    STA.B $B7                                                            ;80A3DD;

UpdateBGGraphics_WhenScrolling:
    REP #$20                                                             ;80A3DF;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80A3E1;
    LDX.W #$0000                                                         ;80A3E4;
    LDA.W $08F7                                                          ;80A3E7;
    CMP.W $08FF                                                          ;80A3EA;
    BEQ .layer1HorizontalEnd                                             ;80A3ED;
    STA.W $08FF                                                          ;80A3EF;
    BMI .updateLayer1                                                    ;80A3F2;
    LDX.W #$0010                                                         ;80A3F4;

.updateLayer1:
    TXA                                                                  ;80A3F7;
    CLC                                                                  ;80A3F8;
    ADC.W $08F7                                                          ;80A3F9;
    STA.W $0990                                                          ;80A3FC;
    TXA                                                                  ;80A3FF;
    CLC                                                                  ;80A400;
    ADC.W $0907                                                          ;80A401;
    STA.W $0994                                                          ;80A404;
    LDA.W $08F9                                                          ;80A407;
    STA.W $0992                                                          ;80A40A;
    LDA.W $0909                                                          ;80A40D;
    STA.W $0996                                                          ;80A410;
    JSR.W UpdateLevelDataColumn                                          ;80A413;

.layer1HorizontalEnd:
    LDA.W $091B                                                          ;80A416;
    LSR A                                                                ;80A419;
    BCS .layer2HorizontalEnd                                             ;80A41A;
    LDX.W #$0000                                                         ;80A41C;
    LDA.W $08FB                                                          ;80A41F;
    CMP.W $0903                                                          ;80A422;
    BEQ .layer2HorizontalEnd                                             ;80A425;
    STA.W $0903                                                          ;80A427;
    BMI .updateLayer2                                                    ;80A42A;
    LDX.W #$0010                                                         ;80A42C;

.updateLayer2:
    TXA                                                                  ;80A42F;
    CLC                                                                  ;80A430;
    ADC.W $08FB                                                          ;80A431;
    STA.W $0990                                                          ;80A434;
    TXA                                                                  ;80A437;
    CLC                                                                  ;80A438;
    ADC.W $090B                                                          ;80A439;
    STA.W $0994                                                          ;80A43C;
    LDA.W $08FD                                                          ;80A43F;
    STA.W $0992                                                          ;80A442;
    LDA.W $090D                                                          ;80A445;
    STA.W $0996                                                          ;80A448;
    JSR.W UpdateBackgroundDataColumn                                     ;80A44B;

.layer2HorizontalEnd:
    LDX.W #$0001                                                         ;80A44E;
    LDA.W $08F9                                                          ;80A451;
    CMP.W $0901                                                          ;80A454;
    BEQ .layer1VerticalEnd                                               ;80A457;
    STA.W $0901                                                          ;80A459;
    BMI +                                                                ;80A45C;
    LDX.W #$000F                                                         ;80A45E;

  + TXA                                                                  ;80A461;
    CLC                                                                  ;80A462;
    ADC.W $08F9                                                          ;80A463;
    STA.W $0992                                                          ;80A466;
    TXA                                                                  ;80A469;
    CLC                                                                  ;80A46A;
    ADC.W $0909                                                          ;80A46B;
    STA.W $0996                                                          ;80A46E;
    LDA.W $08F7                                                          ;80A471;
    STA.W $0990                                                          ;80A474;
    LDA.W $0907                                                          ;80A477;
    STA.W $0994                                                          ;80A47A;
    JSR.W UpdateLevelDataRow                                             ;80A47D;

.layer1VerticalEnd:
    LDA.W $091C                                                          ;80A480;
    LSR A                                                                ;80A483;
    BCS .return                                                          ;80A484;
    LDX.W #$0001                                                         ;80A486;
    LDA.W $08FD                                                          ;80A489;
    CMP.W $0905                                                          ;80A48C;
    BEQ .return                                                          ;80A48F;
    STA.W $0905                                                          ;80A491;
    BMI .finish                                                          ;80A494;
    LDX.W #$000F                                                         ;80A496;

.finish:
    TXA                                                                  ;80A499;
    CLC                                                                  ;80A49A;
    ADC.W $08FD                                                          ;80A49B;
    STA.W $0992                                                          ;80A49E;
    TXA                                                                  ;80A4A1;
    CLC                                                                  ;80A4A2;
    ADC.W $090D                                                          ;80A4A3;
    STA.W $0996                                                          ;80A4A6;
    LDA.W $08FB                                                          ;80A4A9;
    STA.W $0990                                                          ;80A4AC;
    LDA.W $090B                                                          ;80A4AF;
    STA.W $0994                                                          ;80A4B2;
    JSR.W UpdateBackgroundDataRow                                        ;80A4B5;

.return:
    PLB                                                                  ;80A4B8;
    PLP                                                                  ;80A4B9;
    RTL                                                                  ;80A4BA;


Calculate_BGScroll_LayerPositionBlocks:
    LDA.B $B1                                                            ;80A4BB;
    LSR A                                                                ;80A4BD;
    LSR A                                                                ;80A4BE;
    LSR A                                                                ;80A4BF;
    LSR A                                                                ;80A4C0;
    STA.W $0907                                                          ;80A4C1;
    LDA.B $B5                                                            ;80A4C4;
    LSR A                                                                ;80A4C6;
    LSR A                                                                ;80A4C7;
    LSR A                                                                ;80A4C8;
    LSR A                                                                ;80A4C9;
    STA.W $090B                                                          ;80A4CA;
    LDA.W $0911                                                          ;80A4CD;
    LSR A                                                                ;80A4D0;
    LSR A                                                                ;80A4D1;
    LSR A                                                                ;80A4D2;
    LSR A                                                                ;80A4D3;
    BIT.W #$0800                                                         ;80A4D4;
    BEQ +                                                                ;80A4D7;
    ORA.W #$F000                                                         ;80A4D9;

  + STA.W $08F7                                                          ;80A4DC;
    LDA.W $0917                                                          ;80A4DF;
    LSR A                                                                ;80A4E2;
    LSR A                                                                ;80A4E3;
    LSR A                                                                ;80A4E4;
    LSR A                                                                ;80A4E5;
    BIT.W #$0800                                                         ;80A4E6;
    BEQ +                                                                ;80A4E9;
    ORA.W #$F000                                                         ;80A4EB;

  + STA.W $08FB                                                          ;80A4EE;
    LDA.B $B3                                                            ;80A4F1;
    LSR A                                                                ;80A4F3;
    LSR A                                                                ;80A4F4;
    LSR A                                                                ;80A4F5;
    LSR A                                                                ;80A4F6;
    STA.W $0909                                                          ;80A4F7;
    LDA.B $B7                                                            ;80A4FA;
    LSR A                                                                ;80A4FC;
    LSR A                                                                ;80A4FD;
    LSR A                                                                ;80A4FE;
    LSR A                                                                ;80A4FF;
    STA.W $090D                                                          ;80A500;
    LDA.W $0915                                                          ;80A503;
    LSR A                                                                ;80A506;
    LSR A                                                                ;80A507;
    LSR A                                                                ;80A508;
    LSR A                                                                ;80A509;
    BIT.W #$0800                                                         ;80A50A;
    BEQ +                                                                ;80A50D;
    ORA.W #$F000                                                         ;80A50F;

  + STA.W $08F9                                                          ;80A512;
    LDA.W $0919                                                          ;80A515;
    LSR A                                                                ;80A518;
    LSR A                                                                ;80A519;
    LSR A                                                                ;80A51A;
    LSR A                                                                ;80A51B;
    BIT.W #$0800                                                         ;80A51C;
    BEQ +                                                                ;80A51F;
    ORA.W #$F000                                                         ;80A521;

  + STA.W $08FD                                                          ;80A524;
    RTS                                                                  ;80A527;


HandleScrollZones_HorizontalAutoscrolling:
    PHP                                                                  ;80A528;
    PHB                                                                  ;80A529;
    SEP #$20                                                             ;80A52A;
    LDA.W $0A78                                                          ;80A52C;
    ORA.W $0A79                                                          ;80A52F;
    BEQ +                                                                ;80A532;
    JMP.W .return                                                        ;80A534;


  + LDA.B #$8F                                                           ;80A537;
    PHA                                                                  ;80A539;
    PLB                                                                  ;80A53A;
    REP #$30                                                             ;80A53B;
    LDA.W $0911                                                          ;80A53D;
    STA.W $0939                                                          ;80A540;
    BPL +                                                                ;80A543;
    STZ.W $0911                                                          ;80A545;

  + LDA.W $07A9                                                          ;80A548;
    DEC A                                                                ;80A54B;
    XBA                                                                  ;80A54C;
    CMP.W $0911                                                          ;80A54D;
    BCS +                                                                ;80A550;
    STA.W $0911                                                          ;80A552;

  + LDA.W $0915                                                          ;80A555;
    CLC                                                                  ;80A558;
    ADC.W #$0080                                                         ;80A559;
    XBA                                                                  ;80A55C;
    SEP #$20                                                             ;80A55D;
    STA.W HW_WRMPYA                                                      ;80A55F;
    LDA.W $07A9                                                          ;80A562;
    STA.W HW_WRMPYB                                                      ;80A565;
    REP #$20                                                             ;80A568;
    LDA.W $0912                                                          ;80A56A;
    AND.W #$00FF                                                         ;80A56D;
    CLC                                                                  ;80A570;
    ADC.W HW_RDMPY                                                       ;80A571;
    TAX                                                                  ;80A574;
    LDA.L $7ECD20,X                                                      ;80A575;
    AND.W #$00FF                                                         ;80A579;
    BNE .unboundedFromLeft                                               ;80A57C;
    LDA.W $0911                                                          ;80A57E;
    AND.W #$FF00                                                         ;80A581;
    CLC                                                                  ;80A584;
    ADC.W #$0100                                                         ;80A585;
    STA.W $0933                                                          ;80A588;
    LDA.W $0939                                                          ;80A58B;
    CLC                                                                  ;80A58E;
    ADC.W $0DA2                                                          ;80A58F;
    ADC.W #$0002                                                         ;80A592;
    CMP.W $0933                                                          ;80A595;
    BCS .reachedRightScrollBoundary                                      ;80A598;
    STA.W $0939                                                          ;80A59A;
    LDA.W $0915                                                          ;80A59D;
    CLC                                                                  ;80A5A0;
    ADC.W #$0080                                                         ;80A5A1;
    XBA                                                                  ;80A5A4;
    SEP #$20                                                             ;80A5A5;
    STA.W HW_WRMPYA                                                      ;80A5A7;
    LDA.W $07A9                                                          ;80A5AA;
    STA.W HW_WRMPYB                                                      ;80A5AD;
    REP #$20                                                             ;80A5B0;
    LDA.W $093A                                                          ;80A5B2;
    INC A                                                                ;80A5B5;
    AND.W #$00FF                                                         ;80A5B6;
    CLC                                                                  ;80A5B9;
    ADC.W HW_RDMPY                                                       ;80A5BA;
    TAX                                                                  ;80A5BD;
    LDA.L $7ECD20,X                                                      ;80A5BE;
    AND.W #$00FF                                                         ;80A5C2;
    BNE .returnLayer1X                                                   ;80A5C5;
    LDA.W $0939                                                          ;80A5C7;
    AND.W #$FF00                                                         ;80A5CA;
    BRA +                                                                ;80A5CD;


.returnLayer1X:
    LDA.W $0939                                                          ;80A5CF;
    BRA +                                                                ;80A5D2;


.reachedRightScrollBoundary:
    LDA.W $0933                                                          ;80A5D4;
    BRA +                                                                ;80A5D7;


.unboundedFromLeft:
    INX                                                                  ;80A5D9;
    LDA.L $7ECD20,X                                                      ;80A5DA;
    AND.W #$00FF                                                         ;80A5DE;
    BNE .return                                                          ;80A5E1;
    LDA.W $0911                                                          ;80A5E3;
    AND.W #$FF00                                                         ;80A5E6;
    STA.W $0933                                                          ;80A5E9;
    LDA.W $0939                                                          ;80A5EC;
    SEC                                                                  ;80A5EF;
    SBC.W $0DA2                                                          ;80A5F0;
    SBC.W #$0002                                                         ;80A5F3;
    CMP.W $0933                                                          ;80A5F6;
    BMI .reachedLeftScrollBoundary                                       ;80A5F9;
    STA.W $0939                                                          ;80A5FB;
    LDA.W $0915                                                          ;80A5FE;
    CLC                                                                  ;80A601;
    ADC.W #$0080                                                         ;80A602;
    XBA                                                                  ;80A605;
    SEP #$20                                                             ;80A606;
    STA.W HW_WRMPYA                                                      ;80A608;
    LDA.W $07A9                                                          ;80A60B;
    STA.W HW_WRMPYB                                                      ;80A60E;
    REP #$20                                                             ;80A611;
    LDA.W $093A                                                          ;80A613;
    AND.W #$00FF                                                         ;80A616;
    CLC                                                                  ;80A619;
    ADC.W HW_RDMPY                                                       ;80A61A;
    TAX                                                                  ;80A61D;
    LDA.L $7ECD20,X                                                      ;80A61E;
    AND.W #$00FF                                                         ;80A622;
    BNE .return0939                                                      ;80A625;
    LDA.W $0939                                                          ;80A627;
    AND.W #$FF00                                                         ;80A62A;
    CLC                                                                  ;80A62D;
    ADC.W #$0100                                                         ;80A62E;
    BRA +                                                                ;80A631;


.return0939:
    LDA.W $0939                                                          ;80A633;
    BRA +                                                                ;80A636;


.reachedLeftScrollBoundary:
    LDA.W $0933                                                          ;80A638;

  + STA.W $0911                                                          ;80A63B;

.return:
    PLB                                                                  ;80A63E;
    PLP                                                                  ;80A63F;
    RTL                                                                  ;80A640;


HandleScrollZones_ScrollingRight:
    PHP                                                                  ;80A641;
    PHB                                                                  ;80A642;
    SEP #$20                                                             ;80A643;
    LDA.B #$8F                                                           ;80A645;
    PHA                                                                  ;80A647;
    PLB                                                                  ;80A648;
    REP #$30                                                             ;80A649;
    LDA.W $0911                                                          ;80A64B;
    STA.W $0939                                                          ;80A64E;
    LDA.W $0B0A                                                          ;80A651;
    CMP.W $0911                                                          ;80A654;
    BPL +                                                                ;80A657;
    LDA.W $0B0A                                                          ;80A659;
    STA.W $0911                                                          ;80A65C;
    STZ.W $090F                                                          ;80A65F;

  + LDA.W $07A9                                                          ;80A662;
    DEC A                                                                ;80A665;
    XBA                                                                  ;80A666;
    CMP.W $0911                                                          ;80A667;
    BCS +                                                                ;80A66A;
    STA.W $0911                                                          ;80A66C;
    BRA .return                                                          ;80A66F;


  + LDA.W $0915                                                          ;80A671;
    CLC                                                                  ;80A674;
    ADC.W #$0080                                                         ;80A675;
    XBA                                                                  ;80A678;
    SEP #$20                                                             ;80A679;
    STA.W HW_WRMPYA                                                      ;80A67B;
    LDA.W $07A9                                                          ;80A67E;
    STA.W HW_WRMPYB                                                      ;80A681;
    REP #$20                                                             ;80A684;
    LDA.W $0912                                                          ;80A686;
    AND.W #$00FF                                                         ;80A689;
    SEC                                                                  ;80A68C;
    ADC.W HW_RDMPY                                                       ;80A68D;
    TAX                                                                  ;80A690;
    LDA.L $7ECD20,X                                                      ;80A691;
    AND.W #$00FF                                                         ;80A695;
    BNE .return                                                          ;80A698;
    LDA.W $0911                                                          ;80A69A;
    AND.W #$FF00                                                         ;80A69D;
    STA.W $0933                                                          ;80A6A0;
    LDA.W $0939                                                          ;80A6A3;
    SEC                                                                  ;80A6A6;
    SBC.W $0DA2                                                          ;80A6A7;
    SBC.W #$0002                                                         ;80A6AA;
    CMP.W $0933                                                          ;80A6AD;
    BPL +                                                                ;80A6B0;
    LDA.W $0933                                                          ;80A6B2;

  + STA.W $0911                                                          ;80A6B5;

.return:
    PLB                                                                  ;80A6B8;
    PLP                                                                  ;80A6B9;
    RTL                                                                  ;80A6BA;


HandleScrollZones_ScrollingLeft:
    PHP                                                                  ;80A6BB;
    PHB                                                                  ;80A6BC;
    SEP #$20                                                             ;80A6BD;
    LDA.B #$8F                                                           ;80A6BF;
    PHA                                                                  ;80A6C1;
    PLB                                                                  ;80A6C2;
    REP #$30                                                             ;80A6C3;
    LDA.W $0911                                                          ;80A6C5;
    STA.W $0939                                                          ;80A6C8;
    CMP.W $0B0A                                                          ;80A6CB;
    BPL +                                                                ;80A6CE;
    LDA.W $0B0A                                                          ;80A6D0;
    STA.W $0911                                                          ;80A6D3;
    STZ.W $090F                                                          ;80A6D6;

  + LDA.W $0911                                                          ;80A6D9;
    BPL +                                                                ;80A6DC;
    STZ.W $0911                                                          ;80A6DE;
    BRA .return                                                          ;80A6E1;


  + LDA.W $0915                                                          ;80A6E3;
    CLC                                                                  ;80A6E6;
    ADC.W #$0080                                                         ;80A6E7;
    XBA                                                                  ;80A6EA;
    SEP #$20                                                             ;80A6EB;
    STA.W HW_WRMPYA                                                      ;80A6ED;
    LDA.W $07A9                                                          ;80A6F0;
    STA.W HW_WRMPYB                                                      ;80A6F3;
    REP #$20                                                             ;80A6F6;
    LDA.W $0912                                                          ;80A6F8;
    AND.W #$00FF                                                         ;80A6FB;
    CLC                                                                  ;80A6FE;
    ADC.W HW_RDMPY                                                       ;80A6FF;
    TAX                                                                  ;80A702;
    LDA.L $7ECD20,X                                                      ;80A703;
    AND.W #$00FF                                                         ;80A707;
    BNE .return                                                          ;80A70A;
    LDA.W $0911                                                          ;80A70C;
    AND.W #$FF00                                                         ;80A70F;
    CLC                                                                  ;80A712;
    ADC.W #$0100                                                         ;80A713;
    STA.W $0933                                                          ;80A716;
    LDA.W $0939                                                          ;80A719;
    CLC                                                                  ;80A71C;
    ADC.W $0DA2                                                          ;80A71D;
    ADC.W #$0002                                                         ;80A720;
    CMP.W $0933                                                          ;80A723;
    BCC +                                                                ;80A726;
    LDA.W $0933                                                          ;80A728;

  + STA.W $0911                                                          ;80A72B;

.return:
    PLB                                                                  ;80A72E;
    PLP                                                                  ;80A72F;
    RTL                                                                  ;80A730;


HandleScrollZones_VerticalAutoscrolling:
    PHP                                                                  ;80A731;
    PHB                                                                  ;80A732;
    SEP #$20                                                             ;80A733;
    LDA.W $0A78                                                          ;80A735;
    ORA.W $0A79                                                          ;80A738;
    BEQ +                                                                ;80A73B;
    JMP.W .return                                                        ;80A73D;


  + LDA.B #$8F                                                           ;80A740;
    PHA                                                                  ;80A742;
    PLB                                                                  ;80A743;
    REP #$30                                                             ;80A744;
    LDY.W #$0000                                                         ;80A746;
    SEP #$20                                                             ;80A749;
    LDA.W $0916                                                          ;80A74B;
    STA.W HW_WRMPYA                                                      ;80A74E;
    LDA.W $07A9                                                          ;80A751;
    STA.W HW_WRMPYB                                                      ;80A754;
    REP #$20                                                             ;80A757;
    LDA.W $0911                                                          ;80A759;
    CLC                                                                  ;80A75C;
    ADC.W #$0080                                                         ;80A75D;
    XBA                                                                  ;80A760;
    AND.W #$00FF                                                         ;80A761;
    CLC                                                                  ;80A764;
    ADC.W HW_RDMPY                                                       ;80A765;
    STA.B $14                                                            ;80A768;
    TAX                                                                  ;80A76A;
    LDA.L $7ECD20,X                                                      ;80A76B;
    AND.W #$00FF                                                         ;80A76F;
    CMP.W #$0001                                                         ;80A772;
    BEQ +                                                                ;80A775;
    LDY.W #$001F                                                         ;80A777;

  + STY.W $0933                                                          ;80A77A;
    LDA.W $0915                                                          ;80A77D;
    STA.W $0939                                                          ;80A780;
    BPL +                                                                ;80A783;
    STZ.W $0915                                                          ;80A785;

  + LDA.W $07AB                                                          ;80A788;
    DEC A                                                                ;80A78B;
    XBA                                                                  ;80A78C;
    CLC                                                                  ;80A78D;
    ADC.W $0933                                                          ;80A78E;
    CMP.W $0915                                                          ;80A791;
    BCS +                                                                ;80A794;
    STA.W $0915                                                          ;80A796;

  + SEP #$20                                                             ;80A799;
    LDA.W $0916                                                          ;80A79B;
    STA.W HW_WRMPYA                                                      ;80A79E;
    LDA.W $07A9                                                          ;80A7A1;
    STA.W HW_WRMPYB                                                      ;80A7A4;
    REP #$20                                                             ;80A7A7;
    LDA.W $0911                                                          ;80A7A9;
    CLC                                                                  ;80A7AC;
    ADC.W #$0080                                                         ;80A7AD;
    XBA                                                                  ;80A7B0;
    AND.W #$00FF                                                         ;80A7B1;
    CLC                                                                  ;80A7B4;
    ADC.W HW_RDMPY                                                       ;80A7B5;
    TAX                                                                  ;80A7B8;
    LDA.L $7ECD20,X                                                      ;80A7B9;
    AND.W #$00FF                                                         ;80A7BD;
    BNE .unboundedFromAbove                                              ;80A7C0;
    LDA.W $0915                                                          ;80A7C2;
    AND.W #$FF00                                                         ;80A7C5;
    CLC                                                                  ;80A7C8;
    ADC.W #$0100                                                         ;80A7C9;
    STA.W $0935                                                          ;80A7CC;
    LDA.W $0939                                                          ;80A7CF;
    CLC                                                                  ;80A7D2;
    ADC.W $0DA6                                                          ;80A7D3;
    ADC.W #$0002                                                         ;80A7D6;
    CMP.W $0935                                                          ;80A7D9;
    BCS .reachedBottomScrollBoundary                                     ;80A7DC;
    STA.W $0939                                                          ;80A7DE;
    SEP #$20                                                             ;80A7E1;
    LDA.W $093A                                                          ;80A7E3;
    INC A                                                                ;80A7E6;
    STA.W HW_WRMPYA                                                      ;80A7E7;
    LDA.W $07A9                                                          ;80A7EA;
    STA.W HW_WRMPYB                                                      ;80A7ED;
    REP #$20                                                             ;80A7F0;
    LDA.W $0911                                                          ;80A7F2;
    CLC                                                                  ;80A7F5;
    ADC.W #$0080                                                         ;80A7F6;
    XBA                                                                  ;80A7F9;
    AND.W #$00FF                                                         ;80A7FA;
    CLC                                                                  ;80A7FD;
    ADC.W HW_RDMPY                                                       ;80A7FE;
    TAX                                                                  ;80A801;
    LDA.L $7ECD20,X                                                      ;80A802;
    AND.W #$00FF                                                         ;80A806;
    BNE +                                                                ;80A809;
    LDA.W $0939                                                          ;80A80B;
    AND.W #$FF00                                                         ;80A80E;
    BRA .returnLayer1Y                                                   ;80A811;


  + LDA.W $0939                                                          ;80A813;
    BRA .returnLayer1Y                                                   ;80A816;


.reachedBottomScrollBoundary:
    LDA.W $0935                                                          ;80A818;
    BRA .returnLayer1Y                                                   ;80A81B;


.unboundedFromAbove:
    TXA                                                                  ;80A81D;
    CLC                                                                  ;80A81E;
    ADC.W $07A9                                                          ;80A81F;
    TAX                                                                  ;80A822;
    LDA.L $7ECD20,X                                                      ;80A823;
    AND.W #$00FF                                                         ;80A827;
    BNE .return                                                          ;80A82A;
    LDA.W $0915                                                          ;80A82C;
    AND.W #$FF00                                                         ;80A82F;
    CLC                                                                  ;80A832;
    ADC.W $0933                                                          ;80A833;
    STA.W $0937                                                          ;80A836;
    CMP.W $0915                                                          ;80A839;
    BCS .return                                                          ;80A83C;
    LDA.W $0939                                                          ;80A83E;
    SEC                                                                  ;80A841;
    SBC.W $0DA6                                                          ;80A842;
    SBC.W #$0002                                                         ;80A845;
    CMP.W $0937                                                          ;80A848;
    BMI .reachedTopScrollBoundary                                        ;80A84B;
    STA.W $0939                                                          ;80A84D;
    SEP #$20                                                             ;80A850;
    LDA.W $093A                                                          ;80A852;
    STA.W HW_WRMPYA                                                      ;80A855;
    LDA.W $07A9                                                          ;80A858;
    STA.W HW_WRMPYB                                                      ;80A85B;
    REP #$20                                                             ;80A85E;
    LDA.W $0911                                                          ;80A860;
    CLC                                                                  ;80A863;
    ADC.W #$0080                                                         ;80A864;
    XBA                                                                  ;80A867;
    AND.W #$00FF                                                         ;80A868;
    CLC                                                                  ;80A86B;
    ADC.W HW_RDMPY                                                       ;80A86C;
    TAX                                                                  ;80A86F;
    LDA.L $7ECD20,X                                                      ;80A870;
    AND.W #$00FF                                                         ;80A874;
    BNE .returnProposedLayer1X                                           ;80A877;
    LDA.W $0939                                                          ;80A879;
    AND.W #$FF00                                                         ;80A87C;
    CLC                                                                  ;80A87F;
    ADC.W #$0100                                                         ;80A880;
    BRA .returnLayer1Y                                                   ;80A883;


.returnProposedLayer1X:
    LDA.W $0939                                                          ;80A885;
    BRA .returnLayer1Y                                                   ;80A888;


.reachedTopScrollBoundary:
    LDA.W $0937                                                          ;80A88A;

.returnLayer1Y:
    STA.W $0915                                                          ;80A88D;

.return:
    PLB                                                                  ;80A890;
    PLP                                                                  ;80A891;
    RTL                                                                  ;80A892;


HandleScrollZones_ScrollingDown:
    PHP                                                                  ;80A893;
    PHB                                                                  ;80A894;
    SEP #$20                                                             ;80A895;
    LDA.B #$8F                                                           ;80A897;
    PHA                                                                  ;80A899;
    PLB                                                                  ;80A89A;
    REP #$30                                                             ;80A89B;
    LDA.W $0915                                                          ;80A89D;
    STA.W $0939                                                          ;80A8A0;
    LDY.W #$0000                                                         ;80A8A3;
    SEP #$20                                                             ;80A8A6;
    LDA.W $0916                                                          ;80A8A8;
    STA.W HW_WRMPYA                                                      ;80A8AB;
    LDA.W $07A9                                                          ;80A8AE;
    STA.W HW_WRMPYB                                                      ;80A8B1;
    REP #$20                                                             ;80A8B4;
    LDA.W $0911                                                          ;80A8B6;
    CLC                                                                  ;80A8B9;
    ADC.W #$0080                                                         ;80A8BA;
    XBA                                                                  ;80A8BD;
    AND.W #$00FF                                                         ;80A8BE;
    CLC                                                                  ;80A8C1;
    ADC.W HW_RDMPY                                                       ;80A8C2;
    STA.B $14                                                            ;80A8C5;
    TAX                                                                  ;80A8C7;
    LDA.L $7ECD20,X                                                      ;80A8C8;
    AND.W #$00FF                                                         ;80A8CC;
    CMP.W #$0001                                                         ;80A8CF;
    BEQ +                                                                ;80A8D2;
    LDY.W #$001F                                                         ;80A8D4;

  + STY.W $0933                                                          ;80A8D7;
    LDA.W $0B0E                                                          ;80A8DA;
    CMP.W $0915                                                          ;80A8DD;
    BPL +                                                                ;80A8E0;
    LDA.W $0B0E                                                          ;80A8E2;
    STA.W $0915                                                          ;80A8E5;
    STZ.W $0913                                                          ;80A8E8;

  + LDA.W $07AB                                                          ;80A8EB;
    DEC A                                                                ;80A8EE;
    XBA                                                                  ;80A8EF;
    CLC                                                                  ;80A8F0;
    ADC.W $0933                                                          ;80A8F1;
    STA.W $0937                                                          ;80A8F4;
    CMP.W $0915                                                          ;80A8F7;
    BCC .setLayer1Y                                                      ;80A8FA;
    LDA.B $14                                                            ;80A8FC;
    CLC                                                                  ;80A8FE;
    ADC.W $07A9                                                          ;80A8FF;
    TAX                                                                  ;80A902;
    LDA.L $7ECD20,X                                                      ;80A903;
    AND.W #$00FF                                                         ;80A907;
    BNE .return                                                          ;80A90A;
    LDA.W $0915                                                          ;80A90C;
    AND.W #$FF00                                                         ;80A90F;
    CLC                                                                  ;80A912;
    ADC.W $0933                                                          ;80A913;
    STA.W $0937                                                          ;80A916;
    CMP.W $0915                                                          ;80A919;
    BCS .return                                                          ;80A91C;

.setLayer1Y:
    LDA.W $0939                                                          ;80A91E;
    SEC                                                                  ;80A921;
    SBC.W $0DA6                                                          ;80A922;
    SBC.W #$0002                                                         ;80A925;
    CMP.W $0937                                                          ;80A928;
    BPL +                                                                ;80A92B;
    LDA.W $0937                                                          ;80A92D;

  + STA.W $0915                                                          ;80A930;

.return:
    PLB                                                                  ;80A933;
    PLP                                                                  ;80A934;
    RTL                                                                  ;80A935;


HandleScrollZones_ScrollingUp:
    PHP                                                                  ;80A936;
    PHB                                                                  ;80A937;
    SEP #$20                                                             ;80A938;
    LDA.B #$8F                                                           ;80A93A;
    PHA                                                                  ;80A93C;
    PLB                                                                  ;80A93D;
    REP #$30                                                             ;80A93E;
    LDA.W $0915                                                          ;80A940;
    STA.W $0939                                                          ;80A943;
    CMP.W $0B0E                                                          ;80A946;
    BPL +                                                                ;80A949;
    LDA.W $0B0E                                                          ;80A94B;
    STA.W $0915                                                          ;80A94E;
    STZ.W $0913                                                          ;80A951;

  + LDA.W $0915                                                          ;80A954;
    BPL +                                                                ;80A957;
    STZ.W $0915                                                          ;80A959;
    BRA .return                                                          ;80A95C;


  + SEP #$20                                                             ;80A95E;
    LDA.W $0916                                                          ;80A960;
    STA.W HW_WRMPYA                                                      ;80A963;
    LDA.W $07A9                                                          ;80A966;
    STA.W HW_WRMPYB                                                      ;80A969;
    REP #$20                                                             ;80A96C;
    LDA.W $0911                                                          ;80A96E;
    CLC                                                                  ;80A971;
    ADC.W #$0080                                                         ;80A972;
    XBA                                                                  ;80A975;
    AND.W #$00FF                                                         ;80A976;
    CLC                                                                  ;80A979;
    ADC.W HW_RDMPY                                                       ;80A97A;
    TAX                                                                  ;80A97D;
    LDA.L $7ECD20,X                                                      ;80A97E;
    AND.W #$00FF                                                         ;80A982;
    BNE .return                                                          ;80A985;
    LDA.W $0915                                                          ;80A987;
    AND.W #$FF00                                                         ;80A98A;
    CLC                                                                  ;80A98D;
    ADC.W #$0100                                                         ;80A98E;
    STA.W $0933                                                          ;80A991;
    LDA.W $0939                                                          ;80A994;
    CLC                                                                  ;80A997;
    ADC.W $0DA6                                                          ;80A998;
    ADC.W #$0002                                                         ;80A99B;
    CMP.W $0933                                                          ;80A99E;
    BCC +                                                                ;80A9A1;
    LDA.W $0933                                                          ;80A9A3;

  + STA.W $0915                                                          ;80A9A6;

.return:
    PLB                                                                  ;80A9A9;
    PLP                                                                  ;80A9AA;
    RTL                                                                  ;80A9AB;


Debug_Layer1Position_Saving_Loading:
    LDA.B $91                                                            ;80A9AC;
    AND.W #$0040                                                         ;80A9AE;
    BEQ +                                                                ;80A9B1;
    INC.W $05D3                                                          ;80A9B3;

  + LDA.W $05D3                                                          ;80A9B6;
    LSR A                                                                ;80A9B9;
    BCC +                                                                ;80A9BA;
    LDA.W $05D5                                                          ;80A9BC;
    STA.W $0911                                                          ;80A9BF;
    LDA.W $05D7                                                          ;80A9C2;
    STA.W $0915                                                          ;80A9C5;
    RTL                                                                  ;80A9C8;


  + LDA.W $0911                                                          ;80A9C9;
    STA.W $05D5                                                          ;80A9CC;
    LDA.W $0915                                                          ;80A9CF;
    STA.W $05D7                                                          ;80A9D2;
    RTL                                                                  ;80A9D5;


UpdateBackgroundDataColumn:
    LDX.W #$001C                                                         ;80A9D6;
    BRA UpdateLevelBackgroundDataColumn                                  ;80A9D9;


UpdateLevelDataColumn:
    LDX.W #$0000                                                         ;80A9DB;

UpdateLevelBackgroundDataColumn:
    LDA.W $0783                                                          ;80A9DE;
    BEQ +                                                                ;80A9E1;
    RTS                                                                  ;80A9E3;


  + PHP                                                                  ;80A9E4;
    SEP #$20                                                             ;80A9E5;
    LDA.W $07A5                                                          ;80A9E7;
    STA.W HW_WRMPYA                                                      ;80A9EA;
    LDA.W $0992                                                          ;80A9ED;
    STA.W HW_WRMPYB                                                      ;80A9F0;
    PHB                                                                  ;80A9F3;
    REP #$30                                                             ;80A9F4;
    LDA.W $0990                                                          ;80A9F6;
    CLC                                                                  ;80A9F9;
    ADC.W HW_RDMPY                                                       ;80A9FA;
    ASL A                                                                ;80A9FD;
    CLC                                                                  ;80A9FE;
    ADC.W #$0002                                                         ;80A9FF;
    TXY                                                                  ;80AA02;
    BEQ +                                                                ;80AA03;
    CLC                                                                  ;80AA05;
    ADC.W #$9600                                                         ;80AA06; $7F

  + STA.B $36                                                            ;80AA09;
    LDA.W #$007F                                                         ;80AA0B;
    STA.B $38                                                            ;80AA0E;
    LDA.W $0996                                                          ;80AA10;
    ASL A                                                                ;80AA13;
    ASL A                                                                ;80AA14;
    AND.W #$003C                                                         ;80AA15;
    STA.W $0958,X                                                        ;80AA18;
    EOR.W #$003F                                                         ;80AA1B;
    INC A                                                                ;80AA1E;
    STA.W $0956,X                                                        ;80AA1F;
    SEP #$20                                                             ;80AA22;
    LDA.W $0996                                                          ;80AA24;
    AND.B #$0F                                                           ;80AA27;
    STA.W HW_WRMPYA                                                      ;80AA29;
    LDA.B #$40                                                           ;80AA2C;
    STA.W HW_WRMPYB                                                      ;80AA2E;
    REP #$20                                                             ;80AA31;
    LDA.W $0994                                                          ;80AA33;
    AND.W #$001F                                                         ;80AA36;
    STA.W $0935                                                          ;80AA39;
    ASL A                                                                ;80AA3C;
    CLC                                                                  ;80AA3D;
    ADC.W HW_RDMPY                                                       ;80AA3E;
    STA.W $0933                                                          ;80AA41;
    LDA.W #$5000                                                         ;80AA44;
    LDY.W $0935                                                          ;80AA47;
    CPY.W #$0010                                                         ;80AA4A;
    BCC +                                                                ;80AA4D;
    LDA.W #$53E0                                                         ;80AA4F;

  + TXY                                                                  ;80AA52;
    BEQ +                                                                ;80AA53;
    SEC                                                                  ;80AA55;
    SBC.W $098E                                                          ;80AA56;

  + STA.W $0937                                                          ;80AA59;
    CLC                                                                  ;80AA5C;
    ADC.W $0933                                                          ;80AA5D;
    STA.W $095A,X                                                        ;80AA60;
    LDA.W $0937                                                          ;80AA63;
    CLC                                                                  ;80AA66;
    ADC.W $0935                                                          ;80AA67;
    ADC.W $0935                                                          ;80AA6A;
    STA.W $095C,X                                                        ;80AA6D;
    LDA.W #$C8C8                                                         ;80AA70; $7E
    LDY.W #$0000                                                         ;80AA73;
    CPX.W #$0000                                                         ;80AA76;
    BEQ +                                                                ;80AA79;
    LDA.W #$C9D0                                                         ;80AA7B; $7E
    LDY.W #$0108                                                         ;80AA7E;

  + CLC                                                                  ;80AA81;
    ADC.W $0956,X                                                        ;80AA82;
    STA.W $095E,X                                                        ;80AA85;
    CLC                                                                  ;80AA88;
    ADC.W #$0040                                                         ;80AA89;
    STA.W $0960,X                                                        ;80AA8C;
    STY.W $0937                                                          ;80AA8F;
    SEP #$20                                                             ;80AA92;
    LDA.B #$7E                                                           ;80AA94;
    PHA                                                                  ;80AA96;
    PLB                                                                  ;80AA97;
    REP #$20                                                             ;80AA98;
    PHX                                                                  ;80AA9A;
    LDY.W #$0000                                                         ;80AA9B;
    LDA.W #$0010                                                         ;80AA9E;
    STA.W $0939                                                          ;80AAA1;

.loop:
    LDA.B [$36],Y                                                        ;80AAA4;
    STA.W $093B                                                          ;80AAA6;
    AND.W #$03FF                                                         ;80AAA9;
    ASL A                                                                ;80AAAC;
    ASL A                                                                ;80AAAD;
    ASL A                                                                ;80AAAE;
    TAX                                                                  ;80AAAF;
    PHY                                                                  ;80AAB0;
    LDY.W $0937                                                          ;80AAB1;
    LDA.W $093B                                                          ;80AAB4;
    AND.W #$0C00                                                         ;80AAB7;
    BNE +                                                                ;80AABA;
    LDA.W $A000,X                                                        ;80AABC;
    STA.W $C8C8,Y                                                        ;80AABF;
    LDA.W $A002,X                                                        ;80AAC2;
    STA.W $C908,Y                                                        ;80AAC5;
    LDA.W $A004,X                                                        ;80AAC8;
    STA.W $C8CA,Y                                                        ;80AACB;
    LDA.W $A006,X                                                        ;80AACE;
    STA.W $C90A,Y                                                        ;80AAD1;
    JMP.W .next                                                          ;80AAD4;


  + CMP.W #$0400                                                         ;80AAD7;
    BNE +                                                                ;80AADA;
    LDA.W $A002,X                                                        ;80AADC;
    EOR.W #$4000                                                         ;80AADF;
    STA.W $C8C8,Y                                                        ;80AAE2;
    LDA.W $A000,X                                                        ;80AAE5;
    EOR.W #$4000                                                         ;80AAE8;
    STA.W $C908,Y                                                        ;80AAEB;
    LDA.W $A006,X                                                        ;80AAEE;
    EOR.W #$4000                                                         ;80AAF1;
    STA.W $C8CA,Y                                                        ;80AAF4;
    LDA.W $A004,X                                                        ;80AAF7;
    EOR.W #$4000                                                         ;80AAFA;
    STA.W $C90A,Y                                                        ;80AAFD;
    BRA .next                                                            ;80AB00;


  + CMP.W #$0800                                                         ;80AB02;
    BNE +                                                                ;80AB05;
    LDA.W $A004,X                                                        ;80AB07;
    EOR.W #$8000                                                         ;80AB0A;
    STA.W $C8C8,Y                                                        ;80AB0D;
    LDA.W $A006,X                                                        ;80AB10;
    EOR.W #$8000                                                         ;80AB13;
    STA.W $C908,Y                                                        ;80AB16;
    LDA.W $A000,X                                                        ;80AB19;
    EOR.W #$8000                                                         ;80AB1C;
    STA.W $C8CA,Y                                                        ;80AB1F;
    LDA.W $A002,X                                                        ;80AB22;
    EOR.W #$8000                                                         ;80AB25;
    STA.W $C90A,Y                                                        ;80AB28;
    BRA .next                                                            ;80AB2B;


  + LDA.W $A006,X                                                        ;80AB2D;
    EOR.W #$C000                                                         ;80AB30;
    STA.W $C8C8,Y                                                        ;80AB33;
    LDA.W $A004,X                                                        ;80AB36;
    EOR.W #$C000                                                         ;80AB39;
    STA.W $C908,Y                                                        ;80AB3C;
    LDA.W $A002,X                                                        ;80AB3F;
    EOR.W #$C000                                                         ;80AB42;
    STA.W $C8CA,Y                                                        ;80AB45;
    LDA.W $A000,X                                                        ;80AB48;
    EOR.W #$C000                                                         ;80AB4B;
    STA.W $C90A,Y                                                        ;80AB4E;

.next:
    INY                                                                  ;80AB51;
    INY                                                                  ;80AB52;
    INY                                                                  ;80AB53;
    INY                                                                  ;80AB54;
    STY.W $0937                                                          ;80AB55;
    PLA                                                                  ;80AB58;
    CLC                                                                  ;80AB59;
    ADC.W $07A5                                                          ;80AB5A;
    ADC.W $07A5                                                          ;80AB5D;
    TAY                                                                  ;80AB60;
    DEC.W $0939                                                          ;80AB61;
    BEQ .return                                                          ;80AB64;
    JMP.W .loop                                                          ;80AB66;


.return:
    PLX                                                                  ;80AB69;
    INC.W $0962,X                                                        ;80AB6A;
    PLB                                                                  ;80AB6D;
    PLP                                                                  ;80AB6E;
    RTS                                                                  ;80AB6F;


UpdateBackgroundDataRow:
    LDX.W #$001C                                                         ;80AB70;
    BRA UpdateBackgroundLevelDataRow                                     ;80AB73;


UpdateLevelDataRow:
    LDX.W #$0000                                                         ;80AB75;

UpdateBackgroundLevelDataRow:
    LDA.W $0783                                                          ;80AB78;
    BEQ +                                                                ;80AB7B;
    RTS                                                                  ;80AB7D;


  + PHP                                                                  ;80AB7E;
    SEP #$20                                                             ;80AB7F;
    LDA.W $07A5                                                          ;80AB81;
    STA.W HW_WRMPYA                                                      ;80AB84;
    LDA.W $0992                                                          ;80AB87;
    STA.W HW_WRMPYB                                                      ;80AB8A;
    PHB                                                                  ;80AB8D;
    REP #$30                                                             ;80AB8E;
    LDA.W $0990                                                          ;80AB90;
    CLC                                                                  ;80AB93;
    ADC.W HW_RDMPY                                                       ;80AB94;
    ASL A                                                                ;80AB97;
    CLC                                                                  ;80AB98;
    ADC.W #$0002                                                         ;80AB99;
    TXY                                                                  ;80AB9C;
    BEQ +                                                                ;80AB9D;
    CLC                                                                  ;80AB9F;
    ADC.W #$9600                                                         ;80ABA0; $7F

  + STA.B $36                                                            ;80ABA3;
    LDA.W #$007F                                                         ;80ABA5;
    STA.B $38                                                            ;80ABA8;
    LDA.W $0994                                                          ;80ABAA;
    AND.W #$000F                                                         ;80ABAD;
    STA.W $0933                                                          ;80ABB0;
    LDA.W #$0010                                                         ;80ABB3;
    SEC                                                                  ;80ABB6;
    SBC.W $0933                                                          ;80ABB7;
    ASL A                                                                ;80ABBA;
    ASL A                                                                ;80ABBB;
    STA.W $0964,X                                                        ;80ABBC;
    LDA.W $0933                                                          ;80ABBF;
    INC A                                                                ;80ABC2;
    ASL A                                                                ;80ABC3;
    ASL A                                                                ;80ABC4;
    STA.W $0966,X                                                        ;80ABC5;
    SEP #$20                                                             ;80ABC8;
    LDA.W $0996                                                          ;80ABCA;
    AND.B #$0F                                                           ;80ABCD;
    STA.W HW_WRMPYA                                                      ;80ABCF;
    LDA.B #$40                                                           ;80ABD2;
    STA.W HW_WRMPYB                                                      ;80ABD4;
    REP #$20                                                             ;80ABD7;
    LDA.W $0994                                                          ;80ABD9;
    AND.W #$001F                                                         ;80ABDC;
    STA.W $0935                                                          ;80ABDF;
    ASL A                                                                ;80ABE2;
    CLC                                                                  ;80ABE3;
    ADC.W HW_RDMPY                                                       ;80ABE4;
    STA.W $0933                                                          ;80ABE7;
    LDA.W #$5400                                                         ;80ABEA;
    STA.W $0937                                                          ;80ABED;
    LDA.W #$5000                                                         ;80ABF0;
    LDY.W $0935                                                          ;80ABF3;
    CPY.W #$0010                                                         ;80ABF6;
    BCC +                                                                ;80ABF9;
    LDA.W #$5000                                                         ;80ABFB;
    STA.W $0937                                                          ;80ABFE;
    LDA.W #$53E0                                                         ;80AC01;

  + TXY                                                                  ;80AC04;
    BEQ +                                                                ;80AC05;
    SEC                                                                  ;80AC07;
    SBC.W $098E                                                          ;80AC08;

  + CLC                                                                  ;80AC0B;
    ADC.W $0933                                                          ;80AC0C;
    STA.W $0968,X                                                        ;80AC0F;
    LDA.W $0937                                                          ;80AC12;
    TXY                                                                  ;80AC15;
    BEQ +                                                                ;80AC16;
    SEC                                                                  ;80AC18;
    SBC.W $098E                                                          ;80AC19;

  + CLC                                                                  ;80AC1C;
    ADC.W HW_RDMPY                                                       ;80AC1D;
    STA.W $096A,X                                                        ;80AC20;
    LDA.W #$C948                                                         ;80AC23; $7E
    LDY.W #$0000                                                         ;80AC26;
    CPX.W #$0000                                                         ;80AC29;
    BEQ +                                                                ;80AC2C;
    LDA.W #$CA50                                                         ;80AC2E; $7E
    LDY.W #$0108                                                         ;80AC31;

  + CLC                                                                  ;80AC34;
    ADC.W $0964,X                                                        ;80AC35;
    STA.W $096C,X                                                        ;80AC38;
    CLC                                                                  ;80AC3B;
    ADC.W #$0044                                                         ;80AC3C;
    STA.W $096E,X                                                        ;80AC3F;
    STY.W $0937                                                          ;80AC42;
    SEP #$20                                                             ;80AC45;
    LDA.B #$7E                                                           ;80AC47;
    PHA                                                                  ;80AC49;
    PLB                                                                  ;80AC4A;
    REP #$20                                                             ;80AC4B;
    PHX                                                                  ;80AC4D;
    LDY.W #$0000                                                         ;80AC4E;
    LDA.W #$0011                                                         ;80AC51;
    STA.W $0939                                                          ;80AC54;

.loop:
    LDA.B [$36],Y                                                        ;80AC57;
    STA.W $093B                                                          ;80AC59;
    AND.W #$03FF                                                         ;80AC5C;
    ASL A                                                                ;80AC5F;
    ASL A                                                                ;80AC60;
    ASL A                                                                ;80AC61;
    TAX                                                                  ;80AC62;
    PHY                                                                  ;80AC63;
    LDY.W $0937                                                          ;80AC64;
    LDA.W $093B                                                          ;80AC67;
    AND.W #$0C00                                                         ;80AC6A;
    BNE +                                                                ;80AC6D;
    LDA.W $A000,X                                                        ;80AC6F;
    STA.W $C948,Y                                                        ;80AC72;
    LDA.W $A002,X                                                        ;80AC75;
    STA.W $C94A,Y                                                        ;80AC78;
    LDA.W $A004,X                                                        ;80AC7B;
    STA.W $C98C,Y                                                        ;80AC7E;
    LDA.W $A006,X                                                        ;80AC81;
    STA.W $C98E,Y                                                        ;80AC84;
    JMP.W .next                                                          ;80AC87;


  + CMP.W #$0400                                                         ;80AC8A;
    BNE +                                                                ;80AC8D;
    LDA.W $A002,X                                                        ;80AC8F;
    EOR.W #$4000                                                         ;80AC92;
    STA.W $C948,Y                                                        ;80AC95;
    LDA.W $A000,X                                                        ;80AC98;
    EOR.W #$4000                                                         ;80AC9B;
    STA.W $C94A,Y                                                        ;80AC9E;
    LDA.W $A006,X                                                        ;80ACA1;
    EOR.W #$4000                                                         ;80ACA4;
    STA.W $C98C,Y                                                        ;80ACA7;
    LDA.W $A004,X                                                        ;80ACAA;
    EOR.W #$4000                                                         ;80ACAD;
    STA.W $C98E,Y                                                        ;80ACB0;
    BRA .next                                                            ;80ACB3;


  + CMP.W #$0800                                                         ;80ACB5;
    BNE +                                                                ;80ACB8;
    LDA.W $A004,X                                                        ;80ACBA;
    EOR.W #$8000                                                         ;80ACBD;
    STA.W $C948,Y                                                        ;80ACC0;
    LDA.W $A006,X                                                        ;80ACC3;
    EOR.W #$8000                                                         ;80ACC6;
    STA.W $C94A,Y                                                        ;80ACC9;
    LDA.W $A000,X                                                        ;80ACCC;
    EOR.W #$8000                                                         ;80ACCF;
    STA.W $C98C,Y                                                        ;80ACD2;
    LDA.W $A002,X                                                        ;80ACD5;
    EOR.W #$8000                                                         ;80ACD8;
    STA.W $C98E,Y                                                        ;80ACDB;
    BRA .next                                                            ;80ACDE;


  + LDA.W $A006,X                                                        ;80ACE0;
    EOR.W #$C000                                                         ;80ACE3;
    STA.W $C948,Y                                                        ;80ACE6;
    LDA.W $A004,X                                                        ;80ACE9;
    EOR.W #$C000                                                         ;80ACEC;
    STA.W $C94A,Y                                                        ;80ACEF;
    LDA.W $A002,X                                                        ;80ACF2;
    EOR.W #$C000                                                         ;80ACF5;
    STA.W $C98C,Y                                                        ;80ACF8;
    LDA.W $A000,X                                                        ;80ACFB;
    EOR.W #$C000                                                         ;80ACFE;
    STA.W $C98E,Y                                                        ;80AD01;

.next:
    INY                                                                  ;80AD04;
    INY                                                                  ;80AD05;
    INY                                                                  ;80AD06;
    INY                                                                  ;80AD07;
    STY.W $0937                                                          ;80AD08;
    PLY                                                                  ;80AD0B;
    INY                                                                  ;80AD0C;
    INY                                                                  ;80AD0D;
    DEC.W $0939                                                          ;80AD0E;
    BEQ .return                                                          ;80AD11;
    JMP.W .loop                                                          ;80AD13;


.return:
    PLX                                                                  ;80AD16;
    INC.W $0970,X                                                        ;80AD17;
    PLB                                                                  ;80AD1A;
    PLP                                                                  ;80AD1B;
    RTS                                                                  ;80AD1C;


DrawTopRowOfScreenForUpwardsDoorTransition:
    STZ.W $0925                                                          ;80AD1D;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80AD20;
    JSR.W UpdatePreviousLayerBlocks                                      ;80AD23;
    INC.W $0901                                                          ;80AD26;
    INC.W $0905                                                          ;80AD29;
    JSR.W DoorTransitionScrolling_Up                                     ;80AD2C;
    RTL                                                                  ;80AD2F;


DoorTransitionScrollingSetup:
    REP #$30                                                             ;80AD30;
    LDA.W $0927                                                          ;80AD32;
    STA.W $0911                                                          ;80AD35;
    LDA.W $0929                                                          ;80AD38;
    STA.W $0915                                                          ;80AD3B;
    LDA.W $0791                                                          ;80AD3E;
    AND.W #$0003                                                         ;80AD41;
    ASL A                                                                ;80AD44;
    TAX                                                                  ;80AD45;
    JSR.W (Door_Transition_Scrolling_Setup_Pointers,X)                   ;80AD46;
    RTL                                                                  ;80AD49;


DoorTransitionScrollingSetup_Right:
    JSR.W CalculateLayer2XPosition                                       ;80AD4A;
    SEC                                                                  ;80AD4D;
    SBC.W #$0100                                                         ;80AD4E;
    STA.W $0917                                                          ;80AD51;
    JSR.W CalculateLayer2YPosition                                       ;80AD54;
    LDA.W $0911                                                          ;80AD57;
    SEC                                                                  ;80AD5A;
    SBC.W #$0100                                                         ;80AD5B;
    STA.W $0911                                                          ;80AD5E;
    JSR.W UpdateBGScrollOffsets                                          ;80AD61;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80AD64;
    JSR.W UpdatePreviousLayerBlocks                                      ;80AD67;
    DEC.W $08FF                                                          ;80AD6A;
    DEC.W $0903                                                          ;80AD6D;
    JSR.W DoorTransitionScrolling_Right                                  ;80AD70;
    RTS                                                                  ;80AD73;


DoorTransitionScrollingSetup_Left:
    JSR.W CalculateLayer2XPosition                                       ;80AD74;
    CLC                                                                  ;80AD77;
    ADC.W #$0100                                                         ;80AD78;
    STA.W $0917                                                          ;80AD7B;
    JSR.W CalculateLayer2YPosition                                       ;80AD7E;
    LDA.W $0911                                                          ;80AD81;
    CLC                                                                  ;80AD84;
    ADC.W #$0100                                                         ;80AD85;
    STA.W $0911                                                          ;80AD88;
    JSR.W UpdateBGScrollOffsets                                          ;80AD8B;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80AD8E;
    JSR.W UpdatePreviousLayerBlocks                                      ;80AD91;
    INC.W $08FF                                                          ;80AD94;
    INC.W $0903                                                          ;80AD97;
    JSR.W DoorTransitionScrolling_Left                                   ;80AD9A;
    RTS                                                                  ;80AD9D;


DoorTransitionScrollingSetup_Down:
    JSR.W CalculateLayer2XPosition                                       ;80AD9E;
    JSR.W CalculateLayer2YPosition                                       ;80ADA1;
    SEC                                                                  ;80ADA4;
    SBC.W #$00E0                                                         ;80ADA5;
    STA.W $0919                                                          ;80ADA8;
    LDA.W $0915                                                          ;80ADAB;
    SEC                                                                  ;80ADAE;
    SBC.W #$00E0                                                         ;80ADAF;
    STA.W $0915                                                          ;80ADB2;
    JSR.W UpdateBGScrollOffsets                                          ;80ADB5;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80ADB8;
    JSR.W UpdatePreviousLayerBlocks                                      ;80ADBB;
    DEC.W $0901                                                          ;80ADBE;
    DEC.W $0905                                                          ;80ADC1;
    JSR.W DoorTransitionScrolling_Down                                   ;80ADC4;
    RTS                                                                  ;80ADC7;


DoorTransitionScrollingSetup_Up:
    JSR.W CalculateLayer2XPosition                                       ;80ADC8;
    LDA.W $0915                                                          ;80ADCB;
    PHA                                                                  ;80ADCE;
    CLC                                                                  ;80ADCF;
    ADC.W #$001F                                                         ;80ADD0;
    STA.W $0915                                                          ;80ADD3;
    JSR.W CalculateLayer2YPosition                                       ;80ADD6;
    CLC                                                                  ;80ADD9;
    ADC.W #$00E0                                                         ;80ADDA;
    STA.W $0919                                                          ;80ADDD;
    PLA                                                                  ;80ADE0;
    CLC                                                                  ;80ADE1;
    ADC.W #$0100                                                         ;80ADE2;
    STA.W $0915                                                          ;80ADE5;
    JSR.W UpdateBGScrollOffsets                                          ;80ADE8;
    LDA.W $0929                                                          ;80ADEB;
    CLC                                                                  ;80ADEE;
    ADC.W #$0020                                                         ;80ADEF;
    STA.W $0929                                                          ;80ADF2;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80ADF5;
    JSR.W UpdatePreviousLayerBlocks                                      ;80ADF8;
    INC.W $0901                                                          ;80ADFB;
    INC.W $0905                                                          ;80ADFE;
    DEC.W $0915                                                          ;80AE01;
    JSR.W DoorTransitionScrolling_Up                                     ;80AE04;
    RTS                                                                  ;80AE07;


Door_Transition_Scrolling_Setup_Pointers:
    dw DoorTransitionScrollingSetup_Right                                ;80AE08;
    dw DoorTransitionScrollingSetup_Left                                 ;80AE0A;
    dw DoorTransitionScrollingSetup_Down                                 ;80AE0C;
    dw DoorTransitionScrollingSetup_Up                                   ;80AE0E;

UpdatePreviousLayerBlocks:
    LDA.W $08F7                                                          ;80AE10;
    STA.W $08FF                                                          ;80AE13;
    LDA.W $08FB                                                          ;80AE16;
    STA.W $0903                                                          ;80AE19;
    LDA.W $08F9                                                          ;80AE1C;
    STA.W $0901                                                          ;80AE1F;
    LDA.W $08FD                                                          ;80AE22;
    STA.W $0905                                                          ;80AE25;
    RTS                                                                  ;80AE28;


UpdateBGScrollOffsets:
    LDA.B $B1                                                            ;80AE29;
    SEC                                                                  ;80AE2B;
    SBC.W $0911                                                          ;80AE2C;
    STA.W $091D                                                          ;80AE2F;
    LDA.B $B3                                                            ;80AE32;
    SEC                                                                  ;80AE34;
    SBC.W $0915                                                          ;80AE35;
    STA.W $091F                                                          ;80AE38;
    LDA.B $B5                                                            ;80AE3B;
    SEC                                                                  ;80AE3D;
    SBC.W $0911                                                          ;80AE3E;
    STA.W $0921                                                          ;80AE41;
    LDA.B $B7                                                            ;80AE44;
    SEC                                                                  ;80AE46;
    SBC.W $0915                                                          ;80AE47;
    STA.W $0923                                                          ;80AE4A;
    RTS                                                                  ;80AE4D;


DoorTransitionScrolling:
    PHP                                                                  ;80AE4E;
    PHB                                                                  ;80AE4F;
    PHK                                                                  ;80AE50;
    PLB                                                                  ;80AE51;
    REP #$30                                                             ;80AE52;
    LDA.W $0791                                                          ;80AE54;
    AND.W #$0003                                                         ;80AE57;
    ASL A                                                                ;80AE5A;
    TAX                                                                  ;80AE5B;
    JSR.W (.pointers,X)                                                  ;80AE5C;
    BCC .return                                                          ;80AE5F;
    LDA.W $0927                                                          ;80AE61;
    STA.W $0911                                                          ;80AE64;
    LDA.W $0929                                                          ;80AE67;
    STA.W $0915                                                          ;80AE6A;
    LDA.W #$8000                                                         ;80AE6D;
    TSB.W $0931                                                          ;80AE70;

.return:
    PLB                                                                  ;80AE73;
    PLP                                                                  ;80AE74;
    RTL                                                                  ;80AE75;


.pointers:
    dw DoorTransitionScrolling_Right                                     ;80AE76;
    dw DoorTransitionScrolling_Left                                      ;80AE78;
    dw DoorTransitionScrolling_Down                                      ;80AE7A;
    dw DoorTransitionScrolling_Up                                        ;80AE7C;

DoorTransitionScrolling_Right:
    LDX.W $0925                                                          ;80AE7E;
    PHX                                                                  ;80AE81;
    LDA.W $0AF8                                                          ;80AE82;
    CLC                                                                  ;80AE85;
    ADC.W $092B                                                          ;80AE86;
    STA.W $0AF8                                                          ;80AE89;
    LDA.W $0AF6                                                          ;80AE8C;
    ADC.W $092D                                                          ;80AE8F;
    STA.W $0AF6                                                          ;80AE92;
    STA.W $0B10                                                          ;80AE95;
    LDA.W $0911                                                          ;80AE98;
    CLC                                                                  ;80AE9B;
    ADC.W #$0004                                                         ;80AE9C;
    STA.W $0911                                                          ;80AE9F;
    LDA.W $0917                                                          ;80AEA2;
    CLC                                                                  ;80AEA5;
    ADC.W #$0004                                                         ;80AEA6;
    STA.W $0917                                                          ;80AEA9;
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling              ;80AEAC;
    PLX                                                                  ;80AEB0;
    INX                                                                  ;80AEB1;
    STX.W $0925                                                          ;80AEB2;
    CPX.W #$0040                                                         ;80AEB5;
    BNE +                                                                ;80AEB8;
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling              ;80AEBA;
    SEC                                                                  ;80AEBE;
    RTS                                                                  ;80AEBF;


  + CLC                                                                  ;80AEC0;
    RTS                                                                  ;80AEC1;


DoorTransitionScrolling_Left:
    LDX.W $0925                                                          ;80AEC2;
    PHX                                                                  ;80AEC5;
    LDA.W $0AF8                                                          ;80AEC6;
    SEC                                                                  ;80AEC9;
    SBC.W $092B                                                          ;80AECA;
    STA.W $0AF8                                                          ;80AECD;
    LDA.W $0AF6                                                          ;80AED0;
    SBC.W $092D                                                          ;80AED3;
    STA.W $0AF6                                                          ;80AED6;
    STA.W $0B10                                                          ;80AED9;
    LDA.W $0911                                                          ;80AEDC;
    SEC                                                                  ;80AEDF;
    SBC.W #$0004                                                         ;80AEE0;
    STA.W $0911                                                          ;80AEE3;
    LDA.W $0917                                                          ;80AEE6;
    SEC                                                                  ;80AEE9;
    SBC.W #$0004                                                         ;80AEEA;
    STA.W $0917                                                          ;80AEED;
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling              ;80AEF0;
    PLX                                                                  ;80AEF4;
    INX                                                                  ;80AEF5;
    STX.W $0925                                                          ;80AEF6;
    CPX.W #$0040                                                         ;80AEF9;
    BNE +                                                                ;80AEFC;
    SEC                                                                  ;80AEFE;
    RTS                                                                  ;80AEFF;


  + CLC                                                                  ;80AF00;
    RTS                                                                  ;80AF01;


DoorTransitionScrolling_Down:
    LDX.W $0925                                                          ;80AF02;
    PHX                                                                  ;80AF05;
    BNE +                                                                ;80AF06;
    LDA.B $B3                                                            ;80AF08;
    PHA                                                                  ;80AF0A;
    LDA.B $B7                                                            ;80AF0B;
    PHA                                                                  ;80AF0D;
    LDA.W $0915                                                          ;80AF0E;
    PHA                                                                  ;80AF11;
    SEC                                                                  ;80AF12;
    SBC.W #$000F                                                         ;80AF13;
    STA.W $0915                                                          ;80AF16;
    LDA.W $0919                                                          ;80AF19;
    PHA                                                                  ;80AF1C;
    SEC                                                                  ;80AF1D;
    SBC.W #$000F                                                         ;80AF1E;
    STA.W $0919                                                          ;80AF21;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80AF24;
    JSR.W UpdatePreviousLayerBlocks                                      ;80AF27;
    DEC.W $0901                                                          ;80AF2A;
    DEC.W $0905                                                          ;80AF2D;
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling              ;80AF30;
    PLA                                                                  ;80AF34;
    STA.W $0919                                                          ;80AF35;
    PLA                                                                  ;80AF38;
    STA.W $0915                                                          ;80AF39;
    PLA                                                                  ;80AF3C;
    STA.B $B7                                                            ;80AF3D;
    PLA                                                                  ;80AF3F;
    STA.B $B3                                                            ;80AF40;
    BRA .finish                                                          ;80AF42;


  + CPX.W #$0039                                                         ;80AF44;
    BCS .finish                                                          ;80AF47;
    LDA.W $0AFC                                                          ;80AF49;
    CLC                                                                  ;80AF4C;
    ADC.W $092B                                                          ;80AF4D;
    STA.W $0AFC                                                          ;80AF50;
    LDA.W $0AFA                                                          ;80AF53;
    ADC.W $092D                                                          ;80AF56;
    STA.W $0AFA                                                          ;80AF59;
    STA.W $0B14                                                          ;80AF5C;
    LDA.W $0915                                                          ;80AF5F;
    CLC                                                                  ;80AF62;
    ADC.W #$0004                                                         ;80AF63;
    STA.W $0915                                                          ;80AF66;
    LDA.W $0919                                                          ;80AF69;
    CLC                                                                  ;80AF6C;
    ADC.W #$0004                                                         ;80AF6D;
    STA.W $0919                                                          ;80AF70;
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling              ;80AF73;

.finish:
    PLX                                                                  ;80AF77;
    INX                                                                  ;80AF78;
    STX.W $0925                                                          ;80AF79;
    CPX.W #$0039                                                         ;80AF7C;
    BCC +                                                                ;80AF7F;
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling              ;80AF81;
    SEC                                                                  ;80AF85;
    RTS                                                                  ;80AF86;


  + CLC                                                                  ;80AF87;
    RTS                                                                  ;80AF88;


DoorTransitionScrolling_Up:
    LDX.W $0925                                                          ;80AF89;
    PHX                                                                  ;80AF8C;
    BNE +                                                                ;80AF8D;
    LDA.B $B3                                                            ;80AF8F;
    PHA                                                                  ;80AF91;
    LDA.B $B7                                                            ;80AF92;
    PHA                                                                  ;80AF94;
    LDA.W $0915                                                          ;80AF95;
    PHA                                                                  ;80AF98;
    SEC                                                                  ;80AF99;
    SBC.W #$0010                                                         ;80AF9A;
    STA.W $0915                                                          ;80AF9D;
    LDA.W $0919                                                          ;80AFA0;
    PHA                                                                  ;80AFA3;
    SEC                                                                  ;80AFA4;
    SBC.W #$0010                                                         ;80AFA5;
    STA.W $0919                                                          ;80AFA8;
    JSR.W Calculate_BGScroll_LayerPositionBlocks                         ;80AFAB;
    JSR.W UpdatePreviousLayerBlocks                                      ;80AFAE;
    INC.W $0901                                                          ;80AFB1;
    INC.W $0905                                                          ;80AFB4;
    JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling              ;80AFB7;
    PLA                                                                  ;80AFBB;
    STA.W $0919                                                          ;80AFBC;
    PLA                                                                  ;80AFBF;
    STA.W $0915                                                          ;80AFC0;
    PLA                                                                  ;80AFC3;
    STA.B $B7                                                            ;80AFC4;
    PLA                                                                  ;80AFC6;
    STA.B $B3                                                            ;80AFC7;
    BRA .done                                                            ;80AFC9;


  + LDA.W $0AFC                                                          ;80AFCB;
    SEC                                                                  ;80AFCE;
    SBC.W $092B                                                          ;80AFCF;
    STA.W $0AFC                                                          ;80AFD2;
    LDA.W $0AFA                                                          ;80AFD5;
    SBC.W $092D                                                          ;80AFD8;
    STA.W $0AFA                                                          ;80AFDB;
    STA.W $0B14                                                          ;80AFDE;
    LDA.W $0915                                                          ;80AFE1;
    SEC                                                                  ;80AFE4;
    SBC.W #$0004                                                         ;80AFE5;
    STA.W $0915                                                          ;80AFE8;
    LDA.W $0919                                                          ;80AFEB;
    SEC                                                                  ;80AFEE;
    SBC.W #$0004                                                         ;80AFEF;
    STA.W $0919                                                          ;80AFF2;
    CPX.W #$0005                                                         ;80AFF5;
    BCS +                                                                ;80AFF8;
    LDA.W $0911                                                          ;80AFFA;
    CLC                                                                  ;80AFFD;
    ADC.W $091D                                                          ;80AFFE;
    STA.B $B1                                                            ;80B001;
    LDA.W $0915                                                          ;80B003;
    CLC                                                                  ;80B006;
    ADC.W $091F                                                          ;80B007;
    STA.B $B3                                                            ;80B00A;
    LDA.W $0917                                                          ;80B00C;
    CLC                                                                  ;80B00F;
    ADC.W $0921                                                          ;80B010;
    STA.B $B5                                                            ;80B013;
    LDA.W $0919                                                          ;80B015;
    CLC                                                                  ;80B018;
    ADC.W $0923                                                          ;80B019;
    STA.B $B7                                                            ;80B01C;
    BRA .done                                                            ;80B01E;


  + JSL.L CalculateBGScrolls_UpdateBGGraphics_WhenScrolling              ;80B020;

.done:
    PLX                                                                  ;80B024;
    INX                                                                  ;80B025;
    STX.W $0925                                                          ;80B026;
    CPX.W #$0039                                                         ;80B029;
    BNE +                                                                ;80B02C;
    SEC                                                                  ;80B02E;
    RTS                                                                  ;80B02F;


  + CLC                                                                  ;80B030;
    RTS                                                                  ;80B031;


UNUSED_SetupRotatingMode7Background_80B032:
    LDA.W #$0001                                                         ;80B032;
    STA.W $0783                                                          ;80B035;
    LDA.W $0783                                                          ;80B038; >_<
    BNE +                                                                ;80B03B;
    SEC                                                                  ;80B03D; dead code
    RTL                                                                  ;80B03E;


  + JSL.L SetForceBlankAndWaitForNMI                                     ;80B03F;
    LDA.W #$0080                                                         ;80B043;
    STA.W $2115                                                          ;80B046;
    STZ.W $2116                                                          ;80B049;
    LDA.W #$1900                                                         ;80B04C;
    STA.W $4310                                                          ;80B04F;
    LDA.W #$8000                                                         ;80B052;
    STA.W $4312                                                          ;80B055;
    LDA.W #$4000                                                         ;80B058;
    STA.W $4315                                                          ;80B05B;
    SEP #$20                                                             ;80B05E;
    LDA.B #$98                                                           ;80B060;
    STA.W $4314                                                          ;80B062;
    LDA.B #$02                                                           ;80B065;
    STA.W HW_MDMAEN                                                      ;80B067;
    STZ.W $2115                                                          ;80B06A;
    STZ.W $2116                                                          ;80B06D;
    STZ.W $2117                                                          ;80B070;
    LDX.W #$4000                                                         ;80B073;

.loopClearLowBytes:
    STZ.W $2118                                                          ;80B076;
    DEX                                                                  ;80B079;
    BNE .loopClearLowBytes                                               ;80B07A;
    LDY.W #$0000                                                         ;80B07C;
    TYX                                                                  ;80B07F;

.loop:
    STY.W $2116                                                          ;80B080;
    PHY                                                                  ;80B083;
    LDY.W #$0020                                                         ;80B084;

.innerLoop:
    LDA.L $98C000,X                                                      ;80B087; data doesn't exist in final release?
    STA.W $2118                                                          ;80B08B;
    INX                                                                  ;80B08E;
    DEY                                                                  ;80B08F;
    BNE .innerLoop                                                       ;80B090;
    REP #$20                                                             ;80B092;
    PLA                                                                  ;80B094;
    CLC                                                                  ;80B095;
    ADC.W #$0080                                                         ;80B096;
    TAY                                                                  ;80B099;
    SEP #$20                                                             ;80B09A;
    CPX.W #$0400                                                         ;80B09C;
    BNE .loop                                                            ;80B09F;
    LDA.B #$07                                                           ;80B0A1;
    STA.B $55                                                            ;80B0A3;
    REP #$20                                                             ;80B0A5;
    LDA.W #$0100                                                         ;80B0A7;
    STA.B $78                                                            ;80B0AA;
    STZ.B $7A                                                            ;80B0AC;
    STZ.B $7C                                                            ;80B0AE;
    STA.B $7E                                                            ;80B0B0;
    LDA.W #$0080                                                         ;80B0B2;
    STA.B $80                                                            ;80B0B5;
    STA.B $82                                                            ;80B0B7;
    STZ.W $0785                                                          ;80B0B9;
    JSL.L ClearForceBlankAndWaitForNMI                                   ;80B0BC;
    SEC                                                                  ;80B0C0;
    RTL                                                                  ;80B0C1;


UNUSED_ConfigureMode7RotationMatrix_80B0C2:
    PHP                                                                  ;80B0C2;
    REP #$30                                                             ;80B0C3;
    LDA.W $0783                                                          ;80B0C5;
    BEQ .return                                                          ;80B0C8;
    LDA.W $05B6                                                          ;80B0CA;
    AND.W #$0007                                                         ;80B0CD;
    BNE .return                                                          ;80B0D0;
    LDA.W $0785                                                          ;80B0D2;
    AND.W #$00FF                                                         ;80B0D5;
    ASL A                                                                ;80B0D8;
    TAX                                                                  ;80B0D9;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;80B0DA;
    STA.B $7A                                                            ;80B0DE;
    EOR.W #$FFFF                                                         ;80B0E0;
    INC A                                                                ;80B0E3;
    STA.B $7C                                                            ;80B0E4;
    LDA.W $0785                                                          ;80B0E6;
    CLC                                                                  ;80B0E9;
    ADC.W #$0040                                                         ;80B0EA;
    AND.W #$00FF                                                         ;80B0ED;
    ASL A                                                                ;80B0F0;
    TAX                                                                  ;80B0F1;
    LDA.L SineCosineTables_8bitSine_SignExtended,X                       ;80B0F2;
    STA.B $78                                                            ;80B0F6;
    STA.B $7E                                                            ;80B0F8;
    INC.W $0785                                                          ;80B0FA;

.return:
    PLP                                                                  ;80B0FD;
    RTL                                                                  ;80B0FE;
